Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C48A3BA95
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 19:12:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388254AbfFJRM0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 13:12:26 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:44440 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388217AbfFJRMZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jun 2019 13:12:25 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5AHCJNS121561;
        Mon, 10 Jun 2019 12:12:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560186739;
        bh=cIdme23WQcOOfsiyIH4tk+2i2ShkvU9NXxOhEA9MTjU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=bb79OS+ZyaXmWfw8J0sZ/ISy3xgxY1eMrYNNQqVCtdBp51Jrj8X98IFYdip9H/7fN
         w+Ep14xeECiVG5eVQ4rHhm4nf2oGeYaFadFGWjb8+sm7ZA6Can3Ng5RJhjfQVTDkFK
         UTtvbue0G9xHquKXXCFIedHLBan+zTEO4SvzeBrE=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5AHCJIM080627
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 10 Jun 2019 12:12:19 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 10
 Jun 2019 12:12:18 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 10 Jun 2019 12:12:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5AHCIpU067517;
        Mon, 10 Jun 2019 12:12:18 -0500
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
Subject: [PATCH-next 10/20] gpio: gpio-omap: simplify set_multiple()
Date:   Mon, 10 Jun 2019 20:10:53 +0300
Message-ID: <20190610171103.30903-11-grygorii.strashko@ti.com>
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

One of the reasons for set_multiple() to exist is to allow multiple
GPIOs on the same chip to be changed simultaneously - see commit
5f42424354f5 ("gpiolib: allow simultaneous setting of multiple GPIO
outputs"):

 - Simultaneous glitch-free setting of multiple pins on any kind of
   parallel bus attached to GPIOs provided they all reside on the
   same chip and bank.

In order for this to work, we should not use the atomic set/clear
registers, but instead read-modify-write the dataout register.  We
already take the spinlock to ensure that happens atomically, so
move the code into the set_multiple() function and kill the two
helper functions.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/gpio/gpio-omap.c | 45 +++++++---------------------------------
 1 file changed, 7 insertions(+), 38 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index a26decc5c611..8fdac6e4a929 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -74,8 +74,6 @@ struct gpio_bank {
 	int context_loss_count;
 
 	void (*set_dataout)(struct gpio_bank *bank, unsigned gpio, int enable);
-	void (*set_dataout_multiple)(struct gpio_bank *bank,
-				     unsigned long *mask, unsigned long *bits);
 	int (*get_context_loss_count)(struct device *dev);
 
 	struct omap_gpio_reg_offs *regs;
@@ -146,35 +144,6 @@ static void omap_set_gpio_dataout_mask(struct gpio_bank *bank, unsigned offset,
 	bank->context.dataout = l;
 }
 
-/* set multiple data out values using dedicate set/clear register */
-static void omap_set_gpio_dataout_reg_multiple(struct gpio_bank *bank,
-					       unsigned long *mask,
-					       unsigned long *bits)
-{
-	void __iomem *reg = bank->base;
-	u32 l;
-
-	l = *bits & *mask;
-	writel_relaxed(l, reg + bank->regs->set_dataout);
-	bank->context.dataout |= l;
-
-	l = ~*bits & *mask;
-	writel_relaxed(l, reg + bank->regs->clr_dataout);
-	bank->context.dataout &= ~l;
-}
-
-/* set multiple data out values using mask register */
-static void omap_set_gpio_dataout_mask_multiple(struct gpio_bank *bank,
-						unsigned long *mask,
-						unsigned long *bits)
-{
-	void __iomem *reg = bank->base + bank->regs->dataout;
-	u32 l = (readl_relaxed(reg) & ~*mask) | (*bits & *mask);
-
-	writel_relaxed(l, reg);
-	bank->context.dataout = l;
-}
-
 static inline void omap_gpio_rmw(void __iomem *base, u32 reg, u32 mask, bool set)
 {
 	int l = readl_relaxed(base + reg);
@@ -1037,10 +1006,14 @@ static void omap_gpio_set_multiple(struct gpio_chip *chip, unsigned long *mask,
 				   unsigned long *bits)
 {
 	struct gpio_bank *bank = gpiochip_get_data(chip);
+	void __iomem *reg = bank->base + bank->regs->dataout;
 	unsigned long flags;
+	u32 l;
 
 	raw_spin_lock_irqsave(&bank->lock, flags);
-	bank->set_dataout_multiple(bank, mask, bits);
+	l = (readl_relaxed(reg) & ~*mask) | (*bits & *mask);
+	writel_relaxed(l, reg);
+	bank->context.dataout = l;
 	raw_spin_unlock_irqrestore(&bank->lock, flags);
 }
 
@@ -1530,14 +1503,10 @@ static int omap_gpio_probe(struct platform_device *pdev)
 				pdata->get_context_loss_count;
 	}
 
-	if (bank->regs->set_dataout && bank->regs->clr_dataout) {
+	if (bank->regs->set_dataout && bank->regs->clr_dataout)
 		bank->set_dataout = omap_set_gpio_dataout_reg;
-		bank->set_dataout_multiple = omap_set_gpio_dataout_reg_multiple;
-	} else {
+	else
 		bank->set_dataout = omap_set_gpio_dataout_mask;
-		bank->set_dataout_multiple =
-				omap_set_gpio_dataout_mask_multiple;
-	}
 
 	raw_spin_lock_init(&bank->lock);
 	raw_spin_lock_init(&bank->wa_lock);
-- 
2.17.1

