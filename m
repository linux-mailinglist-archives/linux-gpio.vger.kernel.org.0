Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AD9115D8DB
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Feb 2020 14:57:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726191AbgBNN53 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 14 Feb 2020 08:57:29 -0500
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40323 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728173AbgBNN53 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Feb 2020 08:57:29 -0500
Received: by mail-lj1-f196.google.com with SMTP id n18so10840764ljo.7
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2020 05:57:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=/xjVDPxY6KXtieK2XdeI50FSsOOlYVORoXb7mq0OuBM=;
        b=QsMiFRyuklSS/xDPbYAaRvKi8xXshJUnZicZOqdSjxeQnNzii+ubrVcRAMYOap3T4Y
         wLGBtPp/AoLWLiRHgZTEPhYipM2I8Zz/tY8OR7A8Aud/IrKLcydmSOc8Jrem4YU13+zO
         VFI9NPJqjjhZRlPCRNif+KECl6Ipl6ob2BbXoVqYnNO+YII2QIO3/kQW3+Li7fDuBjp+
         aweneOGJYjQyaBh2AFETxjQFAxsuaJuLYNGg+zkJo/oo+b/GNu8U1sZjfP9a+YS+FT/W
         HCB5EcEsx1q3ryny185dYJqB1ueKNrRyVjKeq/dcCJJEXW4KM/4+6rVc+jU3rTdJTUlZ
         v1uQ==
X-Gm-Message-State: APjAAAXrGBhvf6bYaDr864y63QurVO1xBOHqL/G1ggW1G3YG5Liw0yXn
        viA4odNgU3vgfd5wjzVCN/ahuCV/
X-Google-Smtp-Source: APXvYqxdL7O6FLWyd/pomhWxZ8H5GEHzwf6Po4eIe4SAkmr5idq6BZWGPy7J2h0WPOfzR8DAQ+2eqw==
X-Received: by 2002:a2e:730e:: with SMTP id o14mr2277487ljc.51.1581688645903;
        Fri, 14 Feb 2020 05:57:25 -0800 (PST)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id v9sm3711004lfe.18.2020.02.14.05.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2020 05:57:25 -0800 (PST)
Date:   Fri, 14 Feb 2020 15:57:12 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: [PATCH v3] pinctrl: Use new GPIO_LINE_DIRECTION
Message-ID: <20200214135712.GA14557@localhost.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use newly added GPIO defines GPIO_LINE_DIRECTION_IN and
GPIO_LINE_DIRECTION_OUT instead of using hard-coded 1 and 0.

Main benefit is to make it easier to see which values mean IN and which
OUT. As a side effect this helps GPIO framework to change the direction
defines to something else if ever needed.

Please note that return value from get_direction call on
pinctrl-axp209 driver was changed. Previously pinctrl-axp209 might have
returned value 2 for direction INPUT.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Reported-by: kbuild test robot <lkp@intel.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

---

This is actually a resend (of second patch v2 - I messed up the
numbering). Basically unchanged from previous version (except for rebasing
and resolving a trivial conflict in pinctrl-ingenic.c). I just added the
reviewed-by from Jacopo.

Sorry for the hassle.

 drivers/pinctrl/bcm/pinctrl-bcm2835.c         |  5 ++++-
 drivers/pinctrl/bcm/pinctrl-iproc-gpio.c      |  5 ++++-
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c |  5 ++++-
 drivers/pinctrl/mediatek/pinctrl-paris.c      |  5 ++++-
 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c   |  5 ++++-
 drivers/pinctrl/nomadik/pinctrl-nomadik.c     |  7 +++++--
 drivers/pinctrl/pinctrl-amd.c                 |  5 ++++-
 drivers/pinctrl/pinctrl-at91.c                |  5 ++++-
 drivers/pinctrl/pinctrl-axp209.c              |  7 +++++--
 drivers/pinctrl/pinctrl-ingenic.c             | 14 ++++++++++----
 drivers/pinctrl/pinctrl-ocelot.c              |  5 ++++-
 drivers/pinctrl/pinctrl-oxnas.c               |  5 ++++-
 drivers/pinctrl/pinctrl-pic32.c               |  5 ++++-
 drivers/pinctrl/pinctrl-pistachio.c           |  5 ++++-
 drivers/pinctrl/pinctrl-rk805.c               |  7 +++++--
 drivers/pinctrl/pinctrl-rockchip.c            |  5 ++++-
 drivers/pinctrl/pinctrl-rza1.c                |  5 ++++-
 drivers/pinctrl/pinctrl-rza2.c                |  6 +++---
 drivers/pinctrl/pinctrl-st.c                  | 14 +++++++++++---
 drivers/pinctrl/pinctrl-stmfx.c               | 17 ++++++++++++++---
 drivers/pinctrl/pinctrl-sx150x.c              |  9 ++++++---
 drivers/pinctrl/qcom/pinctrl-msm.c            |  4 ++--
 drivers/pinctrl/stm32/pinctrl-stm32.c         |  4 ++--
 drivers/pinctrl/vt8500/pinctrl-wmt.c          |  6 ++++--
 24 files changed, 119 insertions(+), 41 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
index 0de1a3a96984..d3294964bb4e 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
@@ -322,7 +322,10 @@ static int bcm2835_gpio_get_direction(struct gpio_chip *chip, unsigned int offse
 	if (fsel > BCM2835_FSEL_GPIO_OUT)
 		return -EINVAL;
 
-	return (fsel == BCM2835_FSEL_GPIO_IN);
+	if (fsel == BCM2835_FSEL_GPIO_IN)
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static void bcm2835_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
index 25166217c3e0..a38f0d5f47ce 100644
--- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
@@ -363,7 +363,10 @@ static int iproc_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
 	unsigned int offset = IPROC_GPIO_REG(gpio, IPROC_GPIO_OUT_EN_OFFSET);
 	unsigned int shift = IPROC_GPIO_SHIFT(gpio);
 
-	return !(readl(chip->base + offset) & BIT(shift));
+	if (readl(chip->base + offset) & BIT(shift))
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static void iproc_gpio_set(struct gpio_chip *gc, unsigned gpio, int val)
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 67f8444f7a0c..a02ad10ec6fa 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -804,7 +804,10 @@ static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 		pctl->devdata->spec_dir_set(&reg_addr, offset);
 
 	regmap_read(pctl->regmap1, reg_addr, &read_val);
-	return !(read_val & bit);
+	if (read_val & bit)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int mtk_gpio_get(struct gpio_chip *chip, unsigned offset)
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index 923264d0e9ef..d70bb3aec2c9 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -699,7 +699,10 @@ static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
 	if (err)
 		return err;
 
-	return !value;
+	if (value)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int mtk_gpio_get(struct gpio_chip *chip, unsigned int gpio)
diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 243fba254175..32f12a388b3c 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -402,7 +402,10 @@ static int armada_37xx_gpio_get_direction(struct gpio_chip *chip,
 	mask = BIT(offset);
 	regmap_read(info->regmap, reg, &val);
 
-	return !(val & mask);
+	if (val & mask)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int armada_37xx_gpio_direction_output(struct gpio_chip *chip,
diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
index 95f864dfdef4..ca7bbe4164c0 100644
--- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
+++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
@@ -831,11 +831,14 @@ static int nmk_gpio_get_dir(struct gpio_chip *chip, unsigned offset)
 
 	clk_enable(nmk_chip->clk);
 
-	dir = !(readl(nmk_chip->addr + NMK_GPIO_DIR) & BIT(offset));
+	dir = readl(nmk_chip->addr + NMK_GPIO_DIR) & BIT(offset);
 
 	clk_disable(nmk_chip->clk);
 
-	return dir;
+	if (dir)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int nmk_gpio_make_input(struct gpio_chip *chip, unsigned offset)
diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
index 73aff6591de2..1fe62a35bb12 100644
--- a/drivers/pinctrl/pinctrl-amd.c
+++ b/drivers/pinctrl/pinctrl-amd.c
@@ -46,7 +46,10 @@ static int amd_gpio_get_direction(struct gpio_chip *gc, unsigned offset)
 	pin_reg = readl(gpio_dev->base + offset * 4);
 	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
 
-	return !(pin_reg & BIT(OUTPUT_ENABLE_OFF));
+	if (pin_reg & BIT(OUTPUT_ENABLE_OFF))
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int amd_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
index 207f266e9cf2..52386ad29f28 100644
--- a/drivers/pinctrl/pinctrl-at91.c
+++ b/drivers/pinctrl/pinctrl-at91.c
@@ -1414,7 +1414,10 @@ static int at91_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 	u32 osr;
 
 	osr = readl_relaxed(pio + PIO_OSR);
-	return !(osr & mask);
+	if (osr & mask)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int at91_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
diff --git a/drivers/pinctrl/pinctrl-axp209.c b/drivers/pinctrl/pinctrl-axp209.c
index be5b645815e5..207cbae3a7bf 100644
--- a/drivers/pinctrl/pinctrl-axp209.c
+++ b/drivers/pinctrl/pinctrl-axp209.c
@@ -149,13 +149,16 @@ static int axp20x_gpio_get_direction(struct gpio_chip *chip,
 	 * going to change the value soon anyway. Default to output.
 	 */
 	if ((val & AXP20X_GPIO_FUNCTIONS) > 2)
-		return 0;
+		return GPIO_LINE_DIRECTION_OUT;
 
 	/*
 	 * The GPIO directions are the three lowest values.
 	 * 2 is input, 0 and 1 are output
 	 */
-	return val & 2;
+	if (val & 2)
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int axp20x_gpio_output(struct gpio_chip *chip, unsigned int offset,
diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 96f04d121ebd..5328a6232d65 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -1916,13 +1916,19 @@ static int ingenic_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 	struct ingenic_pinctrl *jzpc = jzgc->jzpc;
 	unsigned int pin = gc->base + offset;
 
-	if (jzpc->info->version >= ID_JZ4760)
-		return ingenic_get_pin_config(jzpc, pin, JZ4760_GPIO_PAT1);
+	if (jzpc->info->version >= ID_JZ4760) {
+		if (ingenic_get_pin_config(jzpc, pin, JZ4760_GPIO_PAT1))
+			return GPIO_LINE_DIRECTION_IN;
+		return GPIO_LINE_DIRECTION_OUT;
+	}
 
 	if (ingenic_get_pin_config(jzpc, pin, JZ4740_GPIO_SELECT))
-		return true;
+		return GPIO_LINE_DIRECTION_IN;
+
+	if (ingenic_get_pin_config(jzpc, pin, JZ4740_GPIO_DIR))
+		return GPIO_LINE_DIRECTION_OUT;
 
-	return !ingenic_get_pin_config(jzpc, pin, JZ4740_GPIO_DIR);
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static const struct pinctrl_ops ingenic_pctlops = {
diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
index eb3dd0d46d6c..ed8eac6c1494 100644
--- a/drivers/pinctrl/pinctrl-ocelot.c
+++ b/drivers/pinctrl/pinctrl-ocelot.c
@@ -604,7 +604,10 @@ static int ocelot_gpio_get_direction(struct gpio_chip *chip,
 
 	regmap_read(info->map, REG(OCELOT_GPIO_OE, info, offset), &val);
 
-	return !(val & BIT(offset % 32));
+	if (val & BIT(offset % 32))
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int ocelot_gpio_direction_input(struct gpio_chip *chip,
diff --git a/drivers/pinctrl/pinctrl-oxnas.c b/drivers/pinctrl/pinctrl-oxnas.c
index 674b7b5919df..5a312279b3c7 100644
--- a/drivers/pinctrl/pinctrl-oxnas.c
+++ b/drivers/pinctrl/pinctrl-oxnas.c
@@ -756,7 +756,10 @@ static int oxnas_gpio_get_direction(struct gpio_chip *chip,
 	struct oxnas_gpio_bank *bank = gpiochip_get_data(chip);
 	u32 mask = BIT(offset);
 
-	return !(readl_relaxed(bank->reg_base + OUTPUT_EN) & mask);
+	if (readl_relaxed(bank->reg_base + OUTPUT_EN) & mask)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int oxnas_gpio_direction_input(struct gpio_chip *chip,
diff --git a/drivers/pinctrl/pinctrl-pic32.c b/drivers/pinctrl/pinctrl-pic32.c
index e5d6d3f9753e..a6e2a4a4ca95 100644
--- a/drivers/pinctrl/pinctrl-pic32.c
+++ b/drivers/pinctrl/pinctrl-pic32.c
@@ -1990,7 +1990,10 @@ static int pic32_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 {
 	struct pic32_gpio_bank *bank = gpiochip_get_data(chip);
 
-	return !!(readl(bank->reg_base + TRIS_REG) & BIT(offset));
+	if (readl(bank->reg_base + TRIS_REG) & BIT(offset))
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static void pic32_gpio_irq_ack(struct irq_data *data)
diff --git a/drivers/pinctrl/pinctrl-pistachio.c b/drivers/pinctrl/pinctrl-pistachio.c
index fa370c171cad..ec761ba2a2da 100644
--- a/drivers/pinctrl/pinctrl-pistachio.c
+++ b/drivers/pinctrl/pinctrl-pistachio.c
@@ -1166,7 +1166,10 @@ static int pistachio_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 {
 	struct pistachio_gpio_bank *bank = gpiochip_get_data(chip);
 
-	return !(gpio_readl(bank, GPIO_OUTPUT_EN) & BIT(offset));
+	if (gpio_readl(bank, GPIO_OUTPUT_EN) & BIT(offset))
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int pistachio_gpio_get(struct gpio_chip *chip, unsigned offset)
diff --git a/drivers/pinctrl/pinctrl-rk805.c b/drivers/pinctrl/pinctrl-rk805.c
index 26adbe9d6d42..cccbe072274e 100644
--- a/drivers/pinctrl/pinctrl-rk805.c
+++ b/drivers/pinctrl/pinctrl-rk805.c
@@ -184,7 +184,7 @@ static int rk805_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 
 	/* default output*/
 	if (!pci->pin_cfg[offset].dir_msk)
-		return 0;
+		return GPIO_LINE_DIRECTION_OUT;
 
 	ret = regmap_read(pci->rk808->regmap,
 			  pci->pin_cfg[offset].reg,
@@ -194,7 +194,10 @@ static int rk805_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 		return ret;
 	}
 
-	return !(val & pci->pin_cfg[offset].dir_msk);
+	if (val & pci->pin_cfg[offset].dir_msk)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static const struct gpio_chip rk805_gpio_chip = {
diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index fc9a2a9959d9..098951346339 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -2549,7 +2549,10 @@ static int rockchip_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 	data = readl_relaxed(bank->reg_base + GPIO_SWPORT_DDR);
 	clk_disable(bank->clk);
 
-	return !(data & BIT(offset));
+	if (data & BIT(offset))
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 /*
diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
index 617585be6a7d..da2d8365c690 100644
--- a/drivers/pinctrl/pinctrl-rza1.c
+++ b/drivers/pinctrl/pinctrl-rza1.c
@@ -777,7 +777,10 @@ static int rza1_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
 {
 	struct rza1_port *port = gpiochip_get_data(chip);
 
-	return !!rza1_get_bit(port, RZA1_PM_REG, gpio);
+	if (rza1_get_bit(port, RZA1_PM_REG, gpio))
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int rza1_gpio_direction_input(struct gpio_chip *chip,
diff --git a/drivers/pinctrl/pinctrl-rza2.c b/drivers/pinctrl/pinctrl-rza2.c
index a205964e839b..c5bf98c86b2b 100644
--- a/drivers/pinctrl/pinctrl-rza2.c
+++ b/drivers/pinctrl/pinctrl-rza2.c
@@ -135,10 +135,10 @@ static int rza2_chip_get_direction(struct gpio_chip *chip, unsigned int offset)
 	reg16 = (reg16 >> (pin * 2)) & RZA2_PDR_MASK;
 
 	if (reg16 == RZA2_PDR_OUTPUT)
-		return 0;
+		return GPIO_LINE_DIRECTION_OUT;
 
 	if (reg16 == RZA2_PDR_INPUT)
-		return 1;
+		return GPIO_LINE_DIRECTION_IN;
 
 	/*
 	 * This GPIO controller has a default Hi-Z state that is not input or
@@ -146,7 +146,7 @@ static int rza2_chip_get_direction(struct gpio_chip *chip, unsigned int offset)
 	 */
 	rza2_pin_to_gpio(priv->base, offset, 1);
 
-	return 1;
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int rza2_chip_direction_input(struct gpio_chip *chip,
diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
index 4f39a7945d01..7b8c7a0b13de 100644
--- a/drivers/pinctrl/pinctrl-st.c
+++ b/drivers/pinctrl/pinctrl-st.c
@@ -746,7 +746,10 @@ static int st_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 	function = st_pctl_get_pin_function(&pc, offset);
 	if (function) {
 		st_pinconf_get_direction(&pc, offset, &config);
-		return !ST_PINCONF_UNPACK_OE(config);
+		if (ST_PINCONF_UNPACK_OE(config))
+			return GPIO_LINE_DIRECTION_OUT;
+
+		return GPIO_LINE_DIRECTION_IN;
 	}
 
 	/*
@@ -758,7 +761,10 @@ static int st_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 		direction |= ((value >> offset) & 0x1) << i;
 	}
 
-	return (direction == ST_GPIO_DIRECTION_IN);
+	if (direction == ST_GPIO_DIRECTION_IN)
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 /* Pinctrl Groups */
@@ -996,6 +1002,7 @@ static void st_pinconf_dbg_show(struct pinctrl_dev *pctldev,
 	unsigned int function;
 	int offset = st_gpio_pin(pin_id);
 	char f[16];
+	int oe;
 
 	mutex_unlock(&pctldev->mutex);
 	pc = st_get_pio_control(pctldev, pin_id);
@@ -1008,10 +1015,11 @@ static void st_pinconf_dbg_show(struct pinctrl_dev *pctldev,
 	else
 		snprintf(f, 5, "GPIO");
 
+	oe = st_gpio_get_direction(&pc_to_bank(pc)->gpio_chip, offset);
 	seq_printf(s, "[OE:%d,PU:%ld,OD:%ld]\t%s\n"
 		"\t\t[retime:%ld,invclk:%ld,clknotdat:%ld,"
 		"de:%ld,rt-clk:%ld,rt-delay:%ld]",
-		!st_gpio_get_direction(&pc_to_bank(pc)->gpio_chip, offset),
+		(oe == GPIO_LINE_DIRECTION_OUT),
 		ST_PINCONF_UNPACK_PU(config),
 		ST_PINCONF_UNPACK_OD(config),
 		f,
diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
index 16723797fa7c..60100b45f5e5 100644
--- a/drivers/pinctrl/pinctrl-stmfx.c
+++ b/drivers/pinctrl/pinctrl-stmfx.c
@@ -134,10 +134,14 @@ static int stmfx_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
 	ret = regmap_read(pctl->stmfx->map, reg, &val);
 	/*
 	 * On stmfx, gpio pins direction is (0)input, (1)output.
-	 * .get_direction returns 0=out, 1=in
 	 */
+	if (ret)
+		return ret;
 
-	return ret ? ret : !(val & mask);
+	if (val & mask)
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int stmfx_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
@@ -223,6 +227,13 @@ static int stmfx_pinconf_get(struct pinctrl_dev *pctldev,
 	dir = stmfx_gpio_get_direction(&pctl->gpio_chip, pin);
 	if (dir < 0)
 		return dir;
+
+	/*
+	 * Currently the gpiolib IN is 1 and OUT is 0 but let's not count
+	 * on it just to be on the safe side also in the future :)
+	 */
+	dir = (dir == GPIO_LINE_DIRECTION_IN) ? 1 : 0;
+
 	type = stmfx_pinconf_get_type(pctl, pin);
 	if (type < 0)
 		return type;
@@ -360,7 +371,7 @@ static void stmfx_pinconf_dbg_show(struct pinctrl_dev *pctldev,
 	if (val < 0)
 		return;
 
-	if (!dir) {
+	if (dir == GPIO_LINE_DIRECTION_OUT) {
 		seq_printf(s, "output %s ", val ? "high" : "low");
 		if (type)
 			seq_printf(s, "open drain %s internal pull-up ",
diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 566665931a04..6e74bd87d959 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -391,13 +391,16 @@ static int sx150x_gpio_get_direction(struct gpio_chip *chip,
 	int ret;
 
 	if (sx150x_pin_is_oscio(pctl, offset))
-		return false;
+		return GPIO_LINE_DIRECTION_OUT;
 
 	ret = regmap_read(pctl->regmap, pctl->data->reg_dir, &value);
 	if (ret < 0)
 		return ret;
 
-	return !!(value & BIT(offset));
+	if (value & BIT(offset))
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
 }
 
 static int sx150x_gpio_get(struct gpio_chip *chip, unsigned int offset)
@@ -687,7 +690,7 @@ static int sx150x_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
 		if (ret < 0)
 			return ret;
 
-		if (ret)
+		if (ret == GPIO_LINE_DIRECTION_IN)
 			return -EINVAL;
 
 		ret = sx150x_gpio_get(&pctl->gpio, pin);
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 9a8daa256a32..173be7d4f00c 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -489,8 +489,8 @@ static int msm_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 
 	val = msm_readl_ctl(pctrl, g);
 
-	/* 0 = output, 1 = input */
-	return val & BIT(g->oe_bit) ? 0 : 1;
+	return val & BIT(g->oe_bit) ? GPIO_LINE_DIRECTION_OUT :
+				      GPIO_LINE_DIRECTION_IN;
 }
 
 static int msm_gpio_get(struct gpio_chip *chip, unsigned offset)
diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 2d5e0435af0a..72e0669ca7c8 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -283,9 +283,9 @@ static int stm32_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 
 	stm32_pmx_get_mode(bank, pin, &mode, &alt);
 	if ((alt == 0) && (mode == 0))
-		ret = 1;
+		ret = GPIO_LINE_DIRECTION_IN;
 	else if ((alt == 0) && (mode == 1))
-		ret = 0;
+		ret = GPIO_LINE_DIRECTION_OUT;
 	else
 		ret = -EINVAL;
 
diff --git a/drivers/pinctrl/vt8500/pinctrl-wmt.c b/drivers/pinctrl/vt8500/pinctrl-wmt.c
index ea910a18b4d7..65b97e240196 100644
--- a/drivers/pinctrl/vt8500/pinctrl-wmt.c
+++ b/drivers/pinctrl/vt8500/pinctrl-wmt.c
@@ -486,8 +486,10 @@ static int wmt_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
 	u32 val;
 
 	val = readl_relaxed(data->base + reg_dir);
-	/* Return 0 == output, 1 == input */
-	return !(val & BIT(bit));
+	if (val & BIT(bit))
+		return GPIO_LINE_DIRECTION_OUT;
+
+	return GPIO_LINE_DIRECTION_IN;
 }
 
 static int wmt_gpio_get_value(struct gpio_chip *chip, unsigned offset)

base-commit: b2929a9cb2fbfedf30c66033a865c8135a7c2184
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
