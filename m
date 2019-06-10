Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B116E3BAA5
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 19:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388212AbfFJRMY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 13:12:24 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:57714 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387898AbfFJRMY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jun 2019 13:12:24 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5AHC7UR056957;
        Mon, 10 Jun 2019 12:12:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560186727;
        bh=8miiJXRQL/O8gcf1AHy/TV7t/sY9raPUDixdUMYIf9g=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=fx+Ma3zCg0+cpgQg/ubudqf5IMC7ekppCIzWe0Wmi3iQMaH/DdCDAlvTqdBju4rOl
         /84bmcEkSk3rqPM3R947KYFiBVcLuHPUHgylebfv76PdSLQA3KyDY0hzPhwUD88R1t
         FDHcMX/X33F+e5k1IAmPalFI2oGXmJhys3ilnHik=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5AHC6x7010831
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 10 Jun 2019 12:12:07 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 10
 Jun 2019 12:12:05 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 10 Jun 2019 12:12:05 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5AHC473067224;
        Mon, 10 Jun 2019 12:12:05 -0500
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
Subject: [PATCH-next 08/20] gpio: gpio-omap: simplify get() method
Date:   Mon, 10 Jun 2019 20:10:51 +0300
Message-ID: <20190610171103.30903-9-grygorii.strashko@ti.com>
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

omap_gpio_get() calls omap_get_gpio_datain() or omap_get_gpio_dataout()
to read the GPIO state. These two functions are only called from this
method, so they don't add much value.  Move their contents into
omap_gpio_get() method and simplify.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/gpio/gpio-omap.c | 25 ++++++-------------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 44a4287cce9e..bf1e6f1d0de7 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -146,20 +146,6 @@ static void omap_set_gpio_dataout_mask(struct gpio_bank *bank, unsigned offset,
 	bank->context.dataout = l;
 }
 
-static int omap_get_gpio_datain(struct gpio_bank *bank, int offset)
-{
-	void __iomem *reg = bank->base + bank->regs->datain;
-
-	return (readl_relaxed(reg) & (BIT(offset))) != 0;
-}
-
-static int omap_get_gpio_dataout(struct gpio_bank *bank, int offset)
-{
-	void __iomem *reg = bank->base + bank->regs->dataout;
-
-	return (readl_relaxed(reg) & (BIT(offset))) != 0;
-}
-
 /* set multiple data out values using dedicate set/clear register */
 static void omap_set_gpio_dataout_reg_multiple(struct gpio_bank *bank,
 					       unsigned long *mask,
@@ -973,14 +959,15 @@ static int omap_gpio_input(struct gpio_chip *chip, unsigned offset)
 
 static int omap_gpio_get(struct gpio_chip *chip, unsigned offset)
 {
-	struct gpio_bank *bank;
-
-	bank = gpiochip_get_data(chip);
+	struct gpio_bank *bank = gpiochip_get_data(chip);
+	void __iomem *reg;
 
 	if (omap_gpio_is_input(bank, offset))
-		return omap_get_gpio_datain(bank, offset);
+		reg = bank->base + bank->regs->datain;
 	else
-		return omap_get_gpio_dataout(bank, offset);
+		reg = bank->base + bank->regs->dataout;
+
+	return (readl_relaxed(reg) & BIT(offset)) != 0;
 }
 
 static int omap_gpio_output(struct gpio_chip *chip, unsigned offset, int value)
-- 
2.17.1

