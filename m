Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 19E7F1F4639
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2020 20:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389150AbgFISY6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jun 2020 14:24:58 -0400
Received: from mga12.intel.com ([192.55.52.136]:38658 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389011AbgFISYw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Jun 2020 14:24:52 -0400
IronPort-SDR: RTGPak5zivfajLUxeoKRzc2mx4N8l9uQmPrJf01v0Bz2MiRpRYth1KN+NSwYviOB5c+LrtBMBw
 fzvCy5TYm5Qw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2020 11:24:52 -0700
IronPort-SDR: J6cnUBwbBG/CA2xo6lWDZBLt9VgbEDhrBKcaQRRkEw4BGWqWeqzqXSpbCfm6bmt3LDeyo4iNv8
 FfDuNjSlQ5Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,493,1583222400"; 
   d="scan'208";a="418490644"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 09 Jun 2020 11:24:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id BE90E21D; Tue,  9 Jun 2020 21:24:49 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/6] pinctrl: cherryview: Introduce chv_readl() helper
Date:   Tue,  9 Jun 2020 21:24:44 +0300
Message-Id: <20200609182449.45813-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There are plenty of places where we call
	readl(chv_padreg(pctrl, offset, ...));

Replace them with newly introduced chv_readl() helper
	chv_readl(pctrl, offset, ...);

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 71 +++++++++++-----------
 1 file changed, 36 insertions(+), 35 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 8e3953a223d0..afff7c0fc33f 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -610,6 +610,11 @@ static void __iomem *chv_padreg(struct chv_pinctrl *pctrl, unsigned int offset,
 	return pctrl->regs + offset + reg;
 }
 
+static u32 chv_readl(struct chv_pinctrl *pctrl, unsigned int pin, unsigned int offset)
+{
+	return readl(chv_padreg(pctrl, pin, offset));
+}
+
 static void chv_writel(u32 value, void __iomem *reg)
 {
 	writel(value, reg);
@@ -620,10 +625,7 @@ static void chv_writel(u32 value, void __iomem *reg)
 /* When Pad Cfg is locked, driver can only change GPIOTXState or GPIORXState */
 static bool chv_pad_locked(struct chv_pinctrl *pctrl, unsigned int offset)
 {
-	void __iomem *reg;
-
-	reg = chv_padreg(pctrl, offset, CHV_PADCTRL1);
-	return readl(reg) & CHV_PADCTRL1_CFGLOCK;
+	return chv_readl(pctrl, offset, CHV_PADCTRL1) & CHV_PADCTRL1_CFGLOCK;
 }
 
 static int chv_get_groups_count(struct pinctrl_dev *pctldev)
@@ -661,8 +663,8 @@ static void chv_pin_dbg_show(struct pinctrl_dev *pctldev, struct seq_file *s,
 
 	raw_spin_lock_irqsave(&chv_lock, flags);
 
-	ctrl0 = readl(chv_padreg(pctrl, offset, CHV_PADCTRL0));
-	ctrl1 = readl(chv_padreg(pctrl, offset, CHV_PADCTRL1));
+	ctrl0 = chv_readl(pctrl, offset, CHV_PADCTRL0);
+	ctrl1 = chv_readl(pctrl, offset, CHV_PADCTRL1);
 	locked = chv_pad_locked(pctrl, offset);
 
 	raw_spin_unlock_irqrestore(&chv_lock, flags);
@@ -758,7 +760,7 @@ static int chv_pinmux_set_mux(struct pinctrl_dev *pctldev,
 		mode &= ~PINMODE_INVERT_OE;
 
 		reg = chv_padreg(pctrl, pin, CHV_PADCTRL0);
-		value = readl(reg);
+		value = chv_readl(pctrl, pin, CHV_PADCTRL0);
 		/* Disable GPIO mode */
 		value &= ~CHV_PADCTRL0_GPIOEN;
 		/* Set to desired mode */
@@ -768,7 +770,7 @@ static int chv_pinmux_set_mux(struct pinctrl_dev *pctldev,
 
 		/* Update for invert_oe */
 		reg = chv_padreg(pctrl, pin, CHV_PADCTRL1);
-		value = readl(reg) & ~CHV_PADCTRL1_INVRXTX_MASK;
+		value = chv_readl(pctrl, pin, CHV_PADCTRL1) & ~CHV_PADCTRL1_INVRXTX_MASK;
 		if (invert_oe)
 			value |= CHV_PADCTRL1_INVRXTX_TXENABLE;
 		chv_writel(value, reg);
@@ -789,7 +791,7 @@ static void chv_gpio_clear_triggering(struct chv_pinctrl *pctrl,
 	u32 value;
 
 	reg = chv_padreg(pctrl, offset, CHV_PADCTRL1);
-	value = readl(reg);
+	value = chv_readl(pctrl, offset, CHV_PADCTRL1);
 	value &= ~CHV_PADCTRL1_INTWAKECFG_MASK;
 	value &= ~CHV_PADCTRL1_INVRXTX_MASK;
 	chv_writel(value, reg);
@@ -807,7 +809,7 @@ static int chv_gpio_request_enable(struct pinctrl_dev *pctldev,
 	raw_spin_lock_irqsave(&chv_lock, flags);
 
 	if (chv_pad_locked(pctrl, offset)) {
-		value = readl(chv_padreg(pctrl, offset, CHV_PADCTRL0));
+		value = chv_readl(pctrl, offset, CHV_PADCTRL0);
 		if (!(value & CHV_PADCTRL0_GPIOEN)) {
 			/* Locked so cannot enable */
 			raw_spin_unlock_irqrestore(&chv_lock, flags);
@@ -828,7 +830,7 @@ static int chv_gpio_request_enable(struct pinctrl_dev *pctldev,
 		chv_gpio_clear_triggering(pctrl, offset);
 
 		reg = chv_padreg(pctrl, offset, CHV_PADCTRL0);
-		value = readl(reg);
+		value = chv_readl(pctrl, offset, CHV_PADCTRL0);
 
 		/*
 		 * If the pin is in HiZ mode (both TX and RX buffers are
@@ -877,7 +879,7 @@ static int chv_gpio_set_direction(struct pinctrl_dev *pctldev,
 
 	raw_spin_lock_irqsave(&chv_lock, flags);
 
-	ctrl0 = readl(reg) & ~CHV_PADCTRL0_GPIOCFG_MASK;
+	ctrl0 = chv_readl(pctrl, offset, CHV_PADCTRL0) & ~CHV_PADCTRL0_GPIOCFG_MASK;
 	if (input)
 		ctrl0 |= CHV_PADCTRL0_GPIOCFG_GPI << CHV_PADCTRL0_GPIOCFG_SHIFT;
 	else
@@ -910,8 +912,8 @@ static int chv_config_get(struct pinctrl_dev *pctldev, unsigned int pin,
 	u32 term;
 
 	raw_spin_lock_irqsave(&chv_lock, flags);
-	ctrl0 = readl(chv_padreg(pctrl, pin, CHV_PADCTRL0));
-	ctrl1 = readl(chv_padreg(pctrl, pin, CHV_PADCTRL1));
+	ctrl0 = chv_readl(pctrl, pin, CHV_PADCTRL0);
+	ctrl1 = chv_readl(pctrl, pin, CHV_PADCTRL1);
 	raw_spin_unlock_irqrestore(&chv_lock, flags);
 
 	term = (ctrl0 & CHV_PADCTRL0_TERM_MASK) >> CHV_PADCTRL0_TERM_SHIFT;
@@ -987,7 +989,7 @@ static int chv_config_set_pull(struct chv_pinctrl *pctrl, unsigned int pin,
 	u32 ctrl0, pull;
 
 	raw_spin_lock_irqsave(&chv_lock, flags);
-	ctrl0 = readl(reg);
+	ctrl0 = chv_readl(pctrl, pin, CHV_PADCTRL0);
 
 	switch (param) {
 	case PIN_CONFIG_BIAS_DISABLE:
@@ -1053,7 +1055,7 @@ static int chv_config_set_oden(struct chv_pinctrl *pctrl, unsigned int pin,
 	u32 ctrl1;
 
 	raw_spin_lock_irqsave(&chv_lock, flags);
-	ctrl1 = readl(reg);
+	ctrl1 = chv_readl(pctrl, pin, CHV_PADCTRL1);
 
 	if (enable)
 		ctrl1 |= CHV_PADCTRL1_ODEN;
@@ -1175,7 +1177,7 @@ static int chv_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	u32 ctrl0, cfg;
 
 	raw_spin_lock_irqsave(&chv_lock, flags);
-	ctrl0 = readl(chv_padreg(pctrl, offset, CHV_PADCTRL0));
+	ctrl0 = chv_readl(pctrl, offset, CHV_PADCTRL0);
 	raw_spin_unlock_irqrestore(&chv_lock, flags);
 
 	cfg = ctrl0 & CHV_PADCTRL0_GPIOCFG_MASK;
@@ -1196,7 +1198,7 @@ static void chv_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 	raw_spin_lock_irqsave(&chv_lock, flags);
 
 	reg = chv_padreg(pctrl, offset, CHV_PADCTRL0);
-	ctrl0 = readl(reg);
+	ctrl0 = chv_readl(pctrl, offset, CHV_PADCTRL0);
 
 	if (value)
 		ctrl0 |= CHV_PADCTRL0_GPIOTXSTATE;
@@ -1215,7 +1217,7 @@ static int chv_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 	unsigned long flags;
 
 	raw_spin_lock_irqsave(&chv_lock, flags);
-	ctrl0 = readl(chv_padreg(pctrl, offset, CHV_PADCTRL0));
+	ctrl0 = chv_readl(pctrl, offset, CHV_PADCTRL0);
 	raw_spin_unlock_irqrestore(&chv_lock, flags);
 
 	direction = ctrl0 & CHV_PADCTRL0_GPIOCFG_MASK;
@@ -1259,7 +1261,7 @@ static void chv_gpio_irq_ack(struct irq_data *d)
 
 	raw_spin_lock(&chv_lock);
 
-	intr_line = readl(chv_padreg(pctrl, pin, CHV_PADCTRL0));
+	intr_line = chv_readl(pctrl, pin, CHV_PADCTRL0);
 	intr_line &= CHV_PADCTRL0_INTSEL_MASK;
 	intr_line >>= CHV_PADCTRL0_INTSEL_SHIFT;
 	chv_writel(BIT(intr_line), pctrl->regs + CHV_INTSTAT);
@@ -1277,7 +1279,7 @@ static void chv_gpio_irq_mask_unmask(struct irq_data *d, bool mask)
 
 	raw_spin_lock_irqsave(&chv_lock, flags);
 
-	intr_line = readl(chv_padreg(pctrl, pin, CHV_PADCTRL0));
+	intr_line = chv_readl(pctrl, pin, CHV_PADCTRL0);
 	intr_line &= CHV_PADCTRL0_INTSEL_MASK;
 	intr_line >>= CHV_PADCTRL0_INTSEL_SHIFT;
 
@@ -1322,11 +1324,11 @@ static unsigned chv_gpio_irq_startup(struct irq_data *d)
 		u32 intsel, value;
 
 		raw_spin_lock_irqsave(&chv_lock, flags);
-		intsel = readl(chv_padreg(pctrl, pin, CHV_PADCTRL0));
+		intsel = chv_readl(pctrl, pin, CHV_PADCTRL0);
 		intsel &= CHV_PADCTRL0_INTSEL_MASK;
 		intsel >>= CHV_PADCTRL0_INTSEL_SHIFT;
 
-		value = readl(chv_padreg(pctrl, pin, CHV_PADCTRL1));
+		value = chv_readl(pctrl, pin, CHV_PADCTRL1);
 		if (value & CHV_PADCTRL1_INTWAKECFG_LEVEL)
 			handler = handle_level_irq;
 		else
@@ -1369,7 +1371,7 @@ static int chv_gpio_irq_type(struct irq_data *d, unsigned int type)
 	if (!chv_pad_locked(pctrl, pin)) {
 		void __iomem *reg = chv_padreg(pctrl, pin, CHV_PADCTRL1);
 
-		value = readl(reg);
+		value = chv_readl(pctrl, pin, CHV_PADCTRL1);
 		value &= ~CHV_PADCTRL1_INTWAKECFG_MASK;
 		value &= ~CHV_PADCTRL1_INVRXTX_MASK;
 
@@ -1389,7 +1391,7 @@ static int chv_gpio_irq_type(struct irq_data *d, unsigned int type)
 		chv_writel(value, reg);
 	}
 
-	value = readl(chv_padreg(pctrl, pin, CHV_PADCTRL0));
+	value = chv_readl(pctrl, pin, CHV_PADCTRL0);
 	value &= CHV_PADCTRL0_INTSEL_MASK;
 	value >>= CHV_PADCTRL0_INTSEL_SHIFT;
 
@@ -1487,7 +1489,7 @@ static void chv_init_irq_valid_mask(struct gpio_chip *chip,
 
 		desc = &community->pins[i];
 
-		intsel = readl(chv_padreg(pctrl, desc->number, CHV_PADCTRL0));
+		intsel = chv_readl(pctrl, desc->number, CHV_PADCTRL0);
 		intsel &= CHV_PADCTRL0_INTSEL_MASK;
 		intsel >>= CHV_PADCTRL0_INTSEL_SHIFT;
 
@@ -1721,7 +1723,6 @@ static int chv_pinctrl_suspend_noirq(struct device *dev)
 	for (i = 0; i < pctrl->community->npins; i++) {
 		const struct pinctrl_pin_desc *desc;
 		struct chv_pin_context *ctx;
-		void __iomem *reg;
 
 		desc = &pctrl->community->pins[i];
 		if (chv_pad_locked(pctrl, desc->number))
@@ -1729,11 +1730,10 @@ static int chv_pinctrl_suspend_noirq(struct device *dev)
 
 		ctx = &pctrl->saved_pin_context[i];
 
-		reg = chv_padreg(pctrl, desc->number, CHV_PADCTRL0);
-		ctx->padctrl0 = readl(reg) & ~CHV_PADCTRL0_GPIORXSTATE;
+		ctx->padctrl0 = chv_readl(pctrl, desc->number, CHV_PADCTRL0);
+		ctx->padctrl0 &= ~CHV_PADCTRL0_GPIORXSTATE;
 
-		reg = chv_padreg(pctrl, desc->number, CHV_PADCTRL1);
-		ctx->padctrl1 = readl(reg);
+		ctx->padctrl1 = chv_readl(pctrl, desc->number, CHV_PADCTRL1);
 	}
 
 	raw_spin_unlock_irqrestore(&chv_lock, flags);
@@ -1770,19 +1770,20 @@ static int chv_pinctrl_resume_noirq(struct device *dev)
 
 		/* Only restore if our saved state differs from the current */
 		reg = chv_padreg(pctrl, desc->number, CHV_PADCTRL0);
-		val = readl(reg) & ~CHV_PADCTRL0_GPIORXSTATE;
+		val = chv_readl(pctrl, desc->number, CHV_PADCTRL0);
+		val &= ~CHV_PADCTRL0_GPIORXSTATE;
 		if (ctx->padctrl0 != val) {
 			chv_writel(ctx->padctrl0, reg);
 			dev_dbg(pctrl->dev, "restored pin %2u ctrl0 0x%08x\n",
-				desc->number, readl(reg));
+				desc->number, chv_readl(pctrl, desc->number, CHV_PADCTRL0));
 		}
 
 		reg = chv_padreg(pctrl, desc->number, CHV_PADCTRL1);
-		val = readl(reg);
+		val = chv_readl(pctrl, desc->number, CHV_PADCTRL1);
 		if (ctx->padctrl1 != val) {
 			chv_writel(ctx->padctrl1, reg);
 			dev_dbg(pctrl->dev, "restored pin %2u ctrl1 0x%08x\n",
-				desc->number, readl(reg));
+				desc->number, chv_readl(pctrl, desc->number, CHV_PADCTRL1));
 		}
 	}
 
-- 
2.27.0.rc2

