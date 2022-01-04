Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9ADCD48461D
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Jan 2022 17:42:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233941AbiADQmq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 4 Jan 2022 11:42:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48609 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235459AbiADQmp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 4 Jan 2022 11:42:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641314565;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=JjEbSC6uTQtcPATHlH+Jw3i3wJ9TRnYzeQ7Gi34hSFg=;
        b=Y1HzMvYzM85leCI51K1l+rFHlUi3us3Uoagl79ShL/GceL9yAPWo6N+du3yaeh7UP+kmfW
        oCaiGtH+kRu7J2iNaCTq7X+bJmtnnUaFYJlsbFEZAaRCEdLdXhCbJz26zg4saliOE+AdJG
        nkwLMpzU97NxVC9vtFZjMAie2dbkM80=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-z_Q6HDVlMFKuoT7_qVzgDg-1; Tue, 04 Jan 2022 11:42:42 -0500
X-MC-Unique: z_Q6HDVlMFKuoT7_qVzgDg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF23C10168C3;
        Tue,  4 Jan 2022 16:42:40 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.174])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 254D57B6DD;
        Tue,  4 Jan 2022 16:42:38 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-gpio@vger.kernel.org,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: [PATCH] pinctrl: cherryview: Trigger hwirq0 for interrupt-lines without a mapping
Date:   Tue,  4 Jan 2022 17:42:38 +0100
Message-Id: <20220104164238.253142-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Commit bdfbef2d29dc ("pinctrl: cherryview: Don't use selection 0 to mark
an interrupt line as unused") made the code properly differentiate
between unset vs (hwirq) 0 entries in the GPIO-controller interrupt-line
to GPIO pinnumber/hwirq mapping.

This is causing some boards to not boot. This commit restores the old
behavior of triggering hwirq 0 when receiving an interrupt on an
interrupt-line for which there is no mapping.

Fixes: bdfbef2d29dc ("pinctrl: cherryview: Don't use selection 0 to mark an interrupt line as unused")
Reported-and-tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 683b95e9639a..5d85ef5d5da8 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1471,8 +1471,9 @@ static void chv_gpio_irq_handler(struct irq_desc *desc)
 
 		offset = cctx->intr_lines[intr_line];
 		if (offset == CHV_INVALID_HWIRQ) {
-			dev_err(dev, "interrupt on unused interrupt line %u\n", intr_line);
-			continue;
+			dev_warn_once(dev, "interrupt on unmapped interrupt line %u\n", intr_line);
+			/* Some boards expect hwirq 0 to trigger in this case */
+			offset = 0;
 		}
 
 		generic_handle_domain_irq(gc->irq.domain, offset);
-- 
2.33.1

