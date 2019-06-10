Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0CEF3BAC0
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 19:13:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728549AbfFJRN1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 13:13:27 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:57916 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728556AbfFJRNU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jun 2019 13:13:20 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5AHD9vn057230;
        Mon, 10 Jun 2019 12:13:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560186789;
        bh=65y0Cnd2F217f0FjndQy2sPV2LzXGcSYmUp9Flgkgvs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=GR8KXJRKBvhp2lPNPS8xTmEhlBQuiy4e3Loyz7HTGdIJ7ybj46XcFQjkmQIzvyrhv
         nN3yjQZiPuu4UqRHuq56Gn78a6s15Iw1aOMYFwzkncexdyaLpou+3qwiV8MuZhZqmR
         QljzPb5a9l2WL9kTMmMz5RGMtlLhqBIGAjW5/k9s=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5AHD9bu014309
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 10 Jun 2019 12:13:09 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 10
 Jun 2019 12:13:09 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 10 Jun 2019 12:13:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5AHD8UR052649;
        Mon, 10 Jun 2019 12:13:08 -0500
From:   Grygorii Strashko <grygorii.strashko@ti.com>
To:     Russell King <rmk@arm.linux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tony Lindgren <tony@atomide.com>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        <linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Russell King <rmk+kernel@armlinux.org.uk>,
        Grygorii Strashko <grygorii.strashko@ti.com>
Subject: [PATCH-next 19/20] gpio: gpio-omap: irq_startup() must not return error codes
Date:   Mon, 10 Jun 2019 20:11:02 +0300
Message-ID: <20190610171103.30903-20-grygorii.strashko@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190610171103.30903-1-grygorii.strashko@ti.com>
References: <20190610171103.30903-1-grygorii.strashko@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Russell King <rmk+kernel@armlinux.org.uk>

The irq_startup() method returns an unsigned int, but in __irq_startup()
it is assigned to an int.  However, nothing checks for errors, so any
error that is returned is ignored.

Remove the check for GPIO-input mode and the error return.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/gpio/gpio-omap.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 61e32c7e6670..94b10dfbff3f 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -635,8 +635,6 @@ static unsigned int omap_gpio_irq_startup(struct irq_data *d)
 
 	if (!LINE_USED(bank->mod_usage, offset))
 		omap_set_gpio_direction(bank, offset, 1);
-	else if (!omap_gpio_is_input(bank, offset))
-		goto err;
 	omap_enable_gpio_module(bank, offset);
 	bank->irq_usage |= BIT(offset);
 
@@ -644,9 +642,6 @@ static unsigned int omap_gpio_irq_startup(struct irq_data *d)
 	omap_gpio_unmask_irq(d);
 
 	return 0;
-err:
-	raw_spin_unlock_irqrestore(&bank->lock, flags);
-	return -EINVAL;
 }
 
 static void omap_gpio_irq_shutdown(struct irq_data *d)
-- 
2.17.1

