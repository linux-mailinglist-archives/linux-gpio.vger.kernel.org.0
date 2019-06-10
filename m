Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 169D23BA9F
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 19:12:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388378AbfFJRMi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 13:12:38 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:57778 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388341AbfFJRMi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 Jun 2019 13:12:38 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5AHCWqD057060;
        Mon, 10 Jun 2019 12:12:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1560186752;
        bh=5SfKHLCw529kyp6oELk+x6cXgHwfk5Oxq0eDXnkhulU=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=MUrQlrir+uNdIo9n2/papO42WezbSw/ZcLMe9QbvcCrJlU2kZuSNxKxv+p8ZuzNKn
         0wgsvQrpx0eW0ESrww27U8K01hXGV4VnwdLlzBGnOlw94S+aGKeeKIQRcaS2Urv8Vu
         BcfosXfR+WH8mte+Xwaexr2746LCt0cxth3YSzhg=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5AHCWxU080842
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 10 Jun 2019 12:12:32 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 10
 Jun 2019 12:12:32 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 10 Jun 2019 12:12:32 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5AHCVCf067611;
        Mon, 10 Jun 2019 12:12:32 -0500
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
Subject: [PATCH-next 12/20] gpio: gpio-omap: simplify read-modify-write
Date:   Mon, 10 Jun 2019 20:10:55 +0300
Message-ID: <20190610171103.30903-13-grygorii.strashko@ti.com>
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

We already have a read-modify-write helper, but there's more that can
be done with a read-modify-write helper if it returned the new value.
Modify the existing helper to return the new value, and arrange for
it to take one less argument by having the caller compute the register
address.

Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
Signed-off-by: Grygorii Strashko <grygorii.strashko@ti.com>
---
 drivers/gpio/gpio-omap.c | 83 +++++++++++++++-------------------------
 1 file changed, 30 insertions(+), 53 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 369ce46e2b09..1a0890586b45 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -92,20 +92,25 @@ static inline struct gpio_bank *omap_irq_data_get_bank(struct irq_data *d)
 	return gpiochip_get_data(chip);
 }
 
-static void omap_set_gpio_direction(struct gpio_bank *bank, int gpio,
-				    int is_input)
+static inline u32 omap_gpio_rmw(void __iomem *reg, u32 mask, bool set)
 {
-	void __iomem *reg = bank->base;
-	u32 l;
+	u32 val = readl_relaxed(reg);
 
-	reg += bank->regs->direction;
-	l = readl_relaxed(reg);
-	if (is_input)
-		l |= BIT(gpio);
+	if (set)
+		val |= mask;
 	else
-		l &= ~(BIT(gpio));
-	writel_relaxed(l, reg);
-	bank->context.oe = l;
+		val &= ~mask;
+
+	writel_relaxed(val, reg);
+
+	return val;
+}
+
+static void omap_set_gpio_direction(struct gpio_bank *bank, int gpio,
+				    int is_input)
+{
+	bank->context.oe = omap_gpio_rmw(bank->base + bank->regs->direction,
+					 BIT(gpio), is_input);
 }
 
 
@@ -131,29 +136,8 @@ static void omap_set_gpio_dataout_reg(struct gpio_bank *bank, unsigned offset,
 static void omap_set_gpio_dataout_mask(struct gpio_bank *bank, unsigned offset,
 				       int enable)
 {
-	void __iomem *reg = bank->base + bank->regs->dataout;
-	u32 gpio_bit = BIT(offset);
-	u32 l;
-
-	l = readl_relaxed(reg);
-	if (enable)
-		l |= gpio_bit;
-	else
-		l &= ~gpio_bit;
-	writel_relaxed(l, reg);
-	bank->context.dataout = l;
-}
-
-static inline void omap_gpio_rmw(void __iomem *base, u32 reg, u32 mask, bool set)
-{
-	int l = readl_relaxed(base + reg);
-
-	if (set)
-		l |= mask;
-	else
-		l &= ~mask;
-
-	writel_relaxed(l, base + reg);
+	bank->context.dataout = omap_gpio_rmw(bank->base + bank->regs->dataout,
+					      BIT(offset), enable);
 }
 
 static inline void omap_gpio_dbck_enable(struct gpio_bank *bank)
@@ -217,16 +201,9 @@ static int omap2_set_gpio_debounce(struct gpio_bank *bank, unsigned offset,
 	reg = bank->base + bank->regs->debounce;
 	writel_relaxed(debounce, reg);
 
-	reg = bank->base + bank->regs->debounce_en;
-	val = readl_relaxed(reg);
-
-	if (enable)
-		val |= l;
-	else
-		val &= ~l;
+	val = omap_gpio_rmw(bank->base + bank->regs->debounce_en, l, enable);
 	bank->dbck_enable_mask = val;
 
-	writel_relaxed(val, reg);
 	clk_disable(bank->dbck);
 	/*
 	 * Enable debounce clock per module.
@@ -301,9 +278,9 @@ static inline void omap_set_gpio_trigger(struct gpio_bank *bank, int gpio,
 	void __iomem *base = bank->base;
 	u32 gpio_bit = BIT(gpio);
 
-	omap_gpio_rmw(base, bank->regs->leveldetect0, gpio_bit,
+	omap_gpio_rmw(base + bank->regs->leveldetect0, gpio_bit,
 		      trigger & IRQ_TYPE_LEVEL_LOW);
-	omap_gpio_rmw(base, bank->regs->leveldetect1, gpio_bit,
+	omap_gpio_rmw(base + bank->regs->leveldetect1, gpio_bit,
 		      trigger & IRQ_TYPE_LEVEL_HIGH);
 
 	/*
@@ -311,9 +288,9 @@ static inline void omap_set_gpio_trigger(struct gpio_bank *bank, int gpio,
 	 * to be woken from idle state.  Set the appropriate edge detection
 	 * in addition to the level detection.
 	 */
-	omap_gpio_rmw(base, bank->regs->risingdetect, gpio_bit,
+	omap_gpio_rmw(base + bank->regs->risingdetect, gpio_bit,
 		      trigger & (IRQ_TYPE_EDGE_RISING | IRQ_TYPE_LEVEL_HIGH));
-	omap_gpio_rmw(base, bank->regs->fallingdetect, gpio_bit,
+	omap_gpio_rmw(base + bank->regs->fallingdetect, gpio_bit,
 		      trigger & (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_LEVEL_LOW));
 
 	bank->context.leveldetect0 =
@@ -329,7 +306,7 @@ static inline void omap_set_gpio_trigger(struct gpio_bank *bank, int gpio,
 			   bank->context.leveldetect1;
 
 	if (likely(!(bank->non_wakeup_gpios & gpio_bit))) {
-		omap_gpio_rmw(base, bank->regs->wkup_en, gpio_bit, trigger != 0);
+		omap_gpio_rmw(base + bank->regs->wkup_en, gpio_bit, trigger != 0);
 		bank->context.wake_en =
 			readl_relaxed(bank->base + bank->regs->wkup_en);
 	}
@@ -414,7 +391,7 @@ static int omap_set_gpio_triggering(struct gpio_bank *bank, int gpio,
 			l |= BIT(gpio << 1);
 
 		/* Enable wake-up during idle for dynamic tick */
-		omap_gpio_rmw(base, bank->regs->wkup_en, BIT(gpio), trigger);
+		omap_gpio_rmw(base + bank->regs->wkup_en, BIT(gpio), trigger);
 		bank->context.wake_en =
 			readl_relaxed(bank->base + bank->regs->wkup_en);
 		writel_relaxed(l, reg);
@@ -451,7 +428,7 @@ static void omap_disable_gpio_module(struct gpio_bank *bank, unsigned offset)
 	    !LINE_USED(bank->mod_usage, offset) &&
 	    !LINE_USED(bank->irq_usage, offset)) {
 		/* Disable wake-up during idle for dynamic tick */
-		omap_gpio_rmw(base, bank->regs->wkup_en, BIT(offset), 0);
+		omap_gpio_rmw(base + bank->regs->wkup_en, BIT(offset), 0);
 		bank->context.wake_en =
 			readl_relaxed(bank->base + bank->regs->wkup_en);
 	}
@@ -1046,9 +1023,9 @@ static void omap_gpio_mod_init(struct gpio_bank *bank)
 		return;
 	}
 
-	omap_gpio_rmw(base, bank->regs->irqenable, l,
+	omap_gpio_rmw(base + bank->regs->irqenable, l,
 		      bank->regs->irqenable_inv);
-	omap_gpio_rmw(base, bank->regs->irqstatus, l,
+	omap_gpio_rmw(base + bank->regs->irqstatus, l,
 		      !bank->regs->irqenable_inv);
 	if (bank->regs->debounce_en)
 		writel_relaxed(0, base + bank->regs->debounce_en);
@@ -1219,8 +1196,8 @@ static void omap_gpio_idle(struct gpio_bank *bank, bool may_lose_context)
 	 */
 	if (!bank->loses_context && bank->enabled_non_wakeup_gpios) {
 		nowake = bank->enabled_non_wakeup_gpios;
-		omap_gpio_rmw(base, bank->regs->fallingdetect, nowake, ~nowake);
-		omap_gpio_rmw(base, bank->regs->risingdetect, nowake, ~nowake);
+		omap_gpio_rmw(base + bank->regs->fallingdetect, nowake, ~nowake);
+		omap_gpio_rmw(base + bank->regs->risingdetect, nowake, ~nowake);
 	}
 
 update_gpio_context_count:
-- 
2.17.1

