Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A2DB1F463A
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Jun 2020 20:25:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732101AbgFISY6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Jun 2020 14:24:58 -0400
Received: from mga04.intel.com ([192.55.52.120]:21539 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389150AbgFISYy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Jun 2020 14:24:54 -0400
IronPort-SDR: aeoSNaAkf4phUhS5L+T5M1JhtTdzpq0vX4dGsy5/LQn8RtTpoPyObX2VBA7HvhsT6Egys0SgY9
 +0fdxNmFhWog==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2020 11:24:52 -0700
IronPort-SDR: Y8BEplZAc2z0U77q6f/2tELYr6f24bL+PS6dh5l+/Ko1Yc6i+0gBgE99Q/D3HD8ryFB5Z5X7Lu
 xMHKkfBLAGAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,493,1583222400"; 
   d="scan'208";a="259886604"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 09 Jun 2020 11:24:50 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id D3E03277; Tue,  9 Jun 2020 21:24:49 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/6] pinctrl: cherryview: Convert chv_writel() to use chv_padreg()
Date:   Tue,  9 Jun 2020 21:24:46 +0300
Message-Id: <20200609182449.45813-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
In-Reply-To: <20200609182449.45813-1-andriy.shevchenko@linux.intel.com>
References: <20200609182449.45813-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

chv_writel() is now solely used for cases where we write data
to the PAD registers. In order to simplify callers, calculate
register address inside chv_writel().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 48 ++++++++--------------
 1 file changed, 16 insertions(+), 32 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 28ed2f3b42a1..1fc46dfb880e 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -629,10 +629,12 @@ static u32 chv_readl(struct chv_pinctrl *pctrl, unsigned int pin, unsigned int o
 	return readl(chv_padreg(pctrl, pin, offset));
 }
 
-static void chv_writel(u32 value, void __iomem *reg)
+static void chv_writel(struct chv_pinctrl *pctrl, unsigned int pin, unsigned int offset, u32 value)
 {
+	void __iomem *reg = chv_padreg(pctrl, pin, offset);
+
+	/* Write and simple read back to confirm the bus transferring done */
 	writel(value, reg);
-	/* simple readback to confirm the bus transferring done */
 	readl(reg);
 }
 
@@ -758,7 +760,6 @@ static int chv_pinmux_set_mux(struct pinctrl_dev *pctldev,
 
 	for (i = 0; i < grp->npins; i++) {
 		int pin = grp->pins[i];
-		void __iomem *reg;
 		unsigned int mode;
 		bool invert_oe;
 		u32 value;
@@ -773,21 +774,19 @@ static int chv_pinmux_set_mux(struct pinctrl_dev *pctldev,
 		invert_oe = mode & PINMODE_INVERT_OE;
 		mode &= ~PINMODE_INVERT_OE;
 
-		reg = chv_padreg(pctrl, pin, CHV_PADCTRL0);
 		value = chv_readl(pctrl, pin, CHV_PADCTRL0);
 		/* Disable GPIO mode */
 		value &= ~CHV_PADCTRL0_GPIOEN;
 		/* Set to desired mode */
 		value &= ~CHV_PADCTRL0_PMODE_MASK;
 		value |= mode << CHV_PADCTRL0_PMODE_SHIFT;
-		chv_writel(value, reg);
+		chv_writel(pctrl, pin, CHV_PADCTRL0, value);
 
 		/* Update for invert_oe */
-		reg = chv_padreg(pctrl, pin, CHV_PADCTRL1);
 		value = chv_readl(pctrl, pin, CHV_PADCTRL1) & ~CHV_PADCTRL1_INVRXTX_MASK;
 		if (invert_oe)
 			value |= CHV_PADCTRL1_INVRXTX_TXENABLE;
-		chv_writel(value, reg);
+		chv_writel(pctrl, pin, CHV_PADCTRL1, value);
 
 		dev_dbg(pctrl->dev, "configured pin %u mode %u OE %sinverted\n",
 			pin, mode, invert_oe ? "" : "not ");
@@ -801,14 +800,12 @@ static int chv_pinmux_set_mux(struct pinctrl_dev *pctldev,
 static void chv_gpio_clear_triggering(struct chv_pinctrl *pctrl,
 				      unsigned int offset)
 {
-	void __iomem *reg;
 	u32 value;
 
-	reg = chv_padreg(pctrl, offset, CHV_PADCTRL1);
 	value = chv_readl(pctrl, offset, CHV_PADCTRL1);
 	value &= ~CHV_PADCTRL1_INTWAKECFG_MASK;
 	value &= ~CHV_PADCTRL1_INVRXTX_MASK;
-	chv_writel(value, reg);
+	chv_writel(pctrl, offset, CHV_PADCTRL1, value);
 }
 
 static int chv_gpio_request_enable(struct pinctrl_dev *pctldev,
@@ -817,7 +814,6 @@ static int chv_gpio_request_enable(struct pinctrl_dev *pctldev,
 {
 	struct chv_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
 	unsigned long flags;
-	void __iomem *reg;
 	u32 value;
 
 	raw_spin_lock_irqsave(&chv_lock, flags);
@@ -843,7 +839,6 @@ static int chv_gpio_request_enable(struct pinctrl_dev *pctldev,
 		/* Disable interrupt generation */
 		chv_gpio_clear_triggering(pctrl, offset);
 
-		reg = chv_padreg(pctrl, offset, CHV_PADCTRL0);
 		value = chv_readl(pctrl, offset, CHV_PADCTRL0);
 
 		/*
@@ -853,13 +848,12 @@ static int chv_gpio_request_enable(struct pinctrl_dev *pctldev,
 		if ((value & CHV_PADCTRL0_GPIOCFG_MASK) ==
 		     (CHV_PADCTRL0_GPIOCFG_HIZ << CHV_PADCTRL0_GPIOCFG_SHIFT)) {
 			value &= ~CHV_PADCTRL0_GPIOCFG_MASK;
-			value |= CHV_PADCTRL0_GPIOCFG_GPI <<
-				CHV_PADCTRL0_GPIOCFG_SHIFT;
+			value |= CHV_PADCTRL0_GPIOCFG_GPI << CHV_PADCTRL0_GPIOCFG_SHIFT;
 		}
 
 		/* Switch to a GPIO mode */
 		value |= CHV_PADCTRL0_GPIOEN;
-		chv_writel(value, reg);
+		chv_writel(pctrl, offset, CHV_PADCTRL0, value);
 	}
 
 	raw_spin_unlock_irqrestore(&chv_lock, flags);
@@ -887,7 +881,6 @@ static int chv_gpio_set_direction(struct pinctrl_dev *pctldev,
 				  unsigned int offset, bool input)
 {
 	struct chv_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-	void __iomem *reg = chv_padreg(pctrl, offset, CHV_PADCTRL0);
 	unsigned long flags;
 	u32 ctrl0;
 
@@ -898,7 +891,7 @@ static int chv_gpio_set_direction(struct pinctrl_dev *pctldev,
 		ctrl0 |= CHV_PADCTRL0_GPIOCFG_GPI << CHV_PADCTRL0_GPIOCFG_SHIFT;
 	else
 		ctrl0 |= CHV_PADCTRL0_GPIOCFG_GPO << CHV_PADCTRL0_GPIOCFG_SHIFT;
-	chv_writel(ctrl0, reg);
+	chv_writel(pctrl, offset, CHV_PADCTRL0, ctrl0);
 
 	raw_spin_unlock_irqrestore(&chv_lock, flags);
 
@@ -998,7 +991,6 @@ static int chv_config_get(struct pinctrl_dev *pctldev, unsigned int pin,
 static int chv_config_set_pull(struct chv_pinctrl *pctrl, unsigned int pin,
 			       enum pin_config_param param, u32 arg)
 {
-	void __iomem *reg = chv_padreg(pctrl, pin, CHV_PADCTRL0);
 	unsigned long flags;
 	u32 ctrl0, pull;
 
@@ -1055,7 +1047,7 @@ static int chv_config_set_pull(struct chv_pinctrl *pctrl, unsigned int pin,
 		return -EINVAL;
 	}
 
-	chv_writel(ctrl0, reg);
+	chv_writel(pctrl, pin, CHV_PADCTRL0, ctrl0);
 	raw_spin_unlock_irqrestore(&chv_lock, flags);
 
 	return 0;
@@ -1064,7 +1056,6 @@ static int chv_config_set_pull(struct chv_pinctrl *pctrl, unsigned int pin,
 static int chv_config_set_oden(struct chv_pinctrl *pctrl, unsigned int pin,
 			       bool enable)
 {
-	void __iomem *reg = chv_padreg(pctrl, pin, CHV_PADCTRL1);
 	unsigned long flags;
 	u32 ctrl1;
 
@@ -1076,7 +1067,7 @@ static int chv_config_set_oden(struct chv_pinctrl *pctrl, unsigned int pin,
 	else
 		ctrl1 &= ~CHV_PADCTRL1_ODEN;
 
-	chv_writel(ctrl1, reg);
+	chv_writel(pctrl, pin, CHV_PADCTRL1, ctrl1);
 	raw_spin_unlock_irqrestore(&chv_lock, flags);
 
 	return 0;
@@ -1206,12 +1197,10 @@ static void chv_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct chv_pinctrl *pctrl = gpiochip_get_data(chip);
 	unsigned long flags;
-	void __iomem *reg;
 	u32 ctrl0;
 
 	raw_spin_lock_irqsave(&chv_lock, flags);
 
-	reg = chv_padreg(pctrl, offset, CHV_PADCTRL0);
 	ctrl0 = chv_readl(pctrl, offset, CHV_PADCTRL0);
 
 	if (value)
@@ -1219,7 +1208,7 @@ static void chv_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 	else
 		ctrl0 &= ~CHV_PADCTRL0_GPIOTXSTATE;
 
-	chv_writel(ctrl0, reg);
+	chv_writel(pctrl, offset, CHV_PADCTRL0, ctrl0);
 
 	raw_spin_unlock_irqrestore(&chv_lock, flags);
 }
@@ -1383,8 +1372,6 @@ static int chv_gpio_irq_type(struct irq_data *d, unsigned int type)
 	 *	Driver programs the IntWakeCfg bits and save the mapping.
 	 */
 	if (!chv_pad_locked(pctrl, pin)) {
-		void __iomem *reg = chv_padreg(pctrl, pin, CHV_PADCTRL1);
-
 		value = chv_readl(pctrl, pin, CHV_PADCTRL1);
 		value &= ~CHV_PADCTRL1_INTWAKECFG_MASK;
 		value &= ~CHV_PADCTRL1_INVRXTX_MASK;
@@ -1402,7 +1389,7 @@ static int chv_gpio_irq_type(struct irq_data *d, unsigned int type)
 				value |= CHV_PADCTRL1_INVRXTX_RXDATA;
 		}
 
-		chv_writel(value, reg);
+		chv_writel(pctrl, pin, CHV_PADCTRL1, value);
 	}
 
 	value = chv_readl(pctrl, pin, CHV_PADCTRL0);
@@ -1772,7 +1759,6 @@ static int chv_pinctrl_resume_noirq(struct device *dev)
 	for (i = 0; i < pctrl->community->npins; i++) {
 		const struct pinctrl_pin_desc *desc;
 		const struct chv_pin_context *ctx;
-		void __iomem *reg;
 		u32 val;
 
 		desc = &pctrl->community->pins[i];
@@ -1782,19 +1768,17 @@ static int chv_pinctrl_resume_noirq(struct device *dev)
 		ctx = &pctrl->saved_pin_context[i];
 
 		/* Only restore if our saved state differs from the current */
-		reg = chv_padreg(pctrl, desc->number, CHV_PADCTRL0);
 		val = chv_readl(pctrl, desc->number, CHV_PADCTRL0);
 		val &= ~CHV_PADCTRL0_GPIORXSTATE;
 		if (ctx->padctrl0 != val) {
-			chv_writel(ctx->padctrl0, reg);
+			chv_writel(pctrl, desc->number, CHV_PADCTRL0, ctx->padctrl0);
 			dev_dbg(pctrl->dev, "restored pin %2u ctrl0 0x%08x\n",
 				desc->number, chv_readl(pctrl, desc->number, CHV_PADCTRL0));
 		}
 
-		reg = chv_padreg(pctrl, desc->number, CHV_PADCTRL1);
 		val = chv_readl(pctrl, desc->number, CHV_PADCTRL1);
 		if (ctx->padctrl1 != val) {
-			chv_writel(ctx->padctrl1, reg);
+			chv_writel(pctrl, desc->number, CHV_PADCTRL1, ctx->padctrl1);
 			dev_dbg(pctrl->dev, "restored pin %2u ctrl1 0x%08x\n",
 				desc->number, chv_readl(pctrl, desc->number, CHV_PADCTRL1));
 		}
-- 
2.27.0.rc2

