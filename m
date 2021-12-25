Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2942C47F32C
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Dec 2021 13:00:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbhLYMAw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 25 Dec 2021 07:00:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45831 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229828AbhLYMAw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 25 Dec 2021 07:00:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640433651;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1QYShQCzXSe5UVnvars9MhkRi1BpddBlHN5EzWs3jhc=;
        b=ZvV0fruIONUzKlHayRx3WpwyeVW1fIPRD2MgLegLlOc+T20fg8DiIx/8w4ALYhZ+CvbPPG
        gf6S1RDQwWSvlKnE15pU3T1EMtXI4jrJIpdDm0FxzciC5EGoYoTECWT5QCZ9rohGXx4hey
        +dPNDBqQzsCEy76+spPkbrTOSJ0jxOE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-591-ByhwASINPLOvEw6yQM1n1g-1; Sat, 25 Dec 2021 07:00:49 -0500
X-MC-Unique: ByhwASINPLOvEw6yQM1n1g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D7E981CCB4;
        Sat, 25 Dec 2021 12:00:48 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.12])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 78FB19815B;
        Sat, 25 Dec 2021 12:00:41 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH 2/2] gpio: crystalcove: Set IRQ domain bus token to DOMAIN_BUS_WIRED
Date:   Sat, 25 Dec 2021 13:00:26 +0100
Message-Id: <20211225120026.95268-2-hdegoede@redhat.com>
In-Reply-To: <20211225120026.95268-1-hdegoede@redhat.com>
References: <20211225120026.95268-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

For the CRC PMIC we end up with multiple irq-domains with the same fwnode.
One for the irqchip which demultiplexes the actual PMIC interrupt into
interrupts for the various cells (known as the level 1 interrupts);

And 2 more for the irqchips which are part of the crystal_cove_gpio
and crystal_cove_charger cells.

This leads to the following error being printed when
CONFIG_GENERIC_IRQ_DEBUGFS is enabled:
 debugfs: File '\_SB.I2C7.PMIC' in directory 'domains' already present!

Set the bus token of the main IRQ domain to DOMAIN_BUS_WIRED to avoid
this error, this also allows irq_find_matching_fwspec() to find the
right domain if necessary.

Note all 3 domain registering drivers need to set the IRQ domain bus token.
This is necessary because the IRQ domain code defaults to creating
the debugfs dir with just the fwnode name and then renames it when
the bus token is set. So each one starts with the same default name and
all 3 must be given a different name to avoid problems when one of the
other drivers loads and starts with the same default name.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpio/gpio-crystalcove.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-crystalcove.c b/drivers/gpio/gpio-crystalcove.c
index 5a909f3c79e8..b55c74a5e064 100644
--- a/drivers/gpio/gpio-crystalcove.c
+++ b/drivers/gpio/gpio-crystalcove.c
@@ -370,7 +370,14 @@ static int crystalcove_gpio_probe(struct platform_device *pdev)
 		return retval;
 	}
 
-	return devm_gpiochip_add_data(&pdev->dev, &cg->chip, cg);
+	retval = devm_gpiochip_add_data(&pdev->dev, &cg->chip, cg);
+	if (retval)
+		return retval;
+
+	/* Distuingish IRQ domain from others sharing (MFD) the same fwnode */
+	irq_domain_update_bus_token(cg->chip.irq.domain, DOMAIN_BUS_WIRED);
+
+	return 0;
 }
 
 static struct platform_driver crystalcove_gpio_driver = {
-- 
2.33.1

