Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9225EFAC4B
	for <lists+linux-gpio@lfdr.de>; Wed, 13 Nov 2019 09:52:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727412AbfKMIv5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 13 Nov 2019 03:51:57 -0500
Received: from relay6-d.mail.gandi.net ([217.70.183.198]:57541 "EHLO
        relay6-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727378AbfKMIvh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 13 Nov 2019 03:51:37 -0500
X-Originating-IP: 93.34.114.233
Received: from uno.localdomain (93-34-114-233.ip49.fastwebnet.it [93.34.114.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 5BC5EC0010;
        Wed, 13 Nov 2019 08:51:24 +0000 (UTC)
Date:   Wed, 13 Nov 2019 09:53:20 +0100
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, Linus Walleij <linus.walleij@linaro.org>,
        Eric Anholt <eric@anholt.net>,
        Stefan Wahren <wahrenst@gmx.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Sean Wang <sean.wang@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Patrice Chotard <patrice.chotard@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-oxnas@groups.io,
        linux-rockchip@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: Use new GPIO_LINE_DIRECTION
Message-ID: <20191113085320.bz4xrihx5gggjttb@uno.localdomain>
References: <20191112141819.GA22076@localhost.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="3cofqt6mytfzspnk"
Content-Disposition: inline
In-Reply-To: <20191112141819.GA22076@localhost.localdomain>
User-Agent: NeoMutt/20180716
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


--3cofqt6mytfzspnk
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Hi Matti,

On Tue, Nov 12, 2019 at 04:18:19PM +0200, Matti Vaittinen wrote:
> Use newly added GPIO defines GPIO_LINE_DIRECTION_IN and
> GPIO_LINE_DIRECTION_OUT instead of using hard-coded 1 and 0.
>
> Main benefit is to make it easier to see which values mean IN and which
> OUT. As a side effect this helps GPIO framework to change the direction
> defines to something else if ever needed.
>
> Please note that return value from get_direction call on
> pinctrl-axp209 driver was changed. Previously pinctrl-axp209 might have
> returned value 2 for direction INPUT.
>
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  drivers/pinctrl/bcm/pinctrl-bcm2835.c         |  5 ++++-
>  drivers/pinctrl/bcm/pinctrl-iproc-gpio.c      |  5 ++++-
>  drivers/pinctrl/mediatek/pinctrl-mtk-common.c |  5 ++++-
>  drivers/pinctrl/mediatek/pinctrl-paris.c      |  5 ++++-
>  drivers/pinctrl/mvebu/pinctrl-armada-37xx.c   |  5 ++++-
>  drivers/pinctrl/nomadik/pinctrl-nomadik.c     |  7 +++++--
>  drivers/pinctrl/pinctrl-amd.c                 |  5 ++++-
>  drivers/pinctrl/pinctrl-at91.c                |  5 ++++-
>  drivers/pinctrl/pinctrl-axp209.c              |  7 +++++--
>  drivers/pinctrl/pinctrl-ingenic.c             | 14 ++++++++++----
>  drivers/pinctrl/pinctrl-ocelot.c              |  5 ++++-
>  drivers/pinctrl/pinctrl-oxnas.c               |  5 ++++-
>  drivers/pinctrl/pinctrl-pic32.c               |  5 ++++-
>  drivers/pinctrl/pinctrl-pistachio.c           |  5 ++++-
>  drivers/pinctrl/pinctrl-rk805.c               |  7 +++++--
>  drivers/pinctrl/pinctrl-rockchip.c            |  5 ++++-
>  drivers/pinctrl/pinctrl-rza1.c                |  5 ++++-
>  drivers/pinctrl/pinctrl-rza2.c                |  6 +++---

For RZ/A1 RZ/A2:
Reviewed-by: Jacopo Mondi <jacopo+renesas@jmondi.org>

Thanks
   j

>  drivers/pinctrl/pinctrl-st.c                  | 14 +++++++++++---
>  drivers/pinctrl/pinctrl-stmfx.c               | 17 ++++++++++++++---
>  drivers/pinctrl/pinctrl-sx150x.c              |  9 ++++++---
>  drivers/pinctrl/qcom/pinctrl-msm.c            |  4 ++--
>  drivers/pinctrl/stm32/pinctrl-stm32.c         |  4 ++--
>  drivers/pinctrl/vt8500/pinctrl-wmt.c          |  6 ++++--
>  24 files changed, 119 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/pinctrl/bcm/pinctrl-bcm2835.c b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> index 0de1a3a96984..d3294964bb4e 100644
> --- a/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> +++ b/drivers/pinctrl/bcm/pinctrl-bcm2835.c
> @@ -322,7 +322,10 @@ static int bcm2835_gpio_get_direction(struct gpio_chip *chip, unsigned int offse
>  	if (fsel > BCM2835_FSEL_GPIO_OUT)
>  		return -EINVAL;
>
> -	return (fsel == BCM2835_FSEL_GPIO_IN);
> +	if (fsel == BCM2835_FSEL_GPIO_IN)
> +		return GPIO_LINE_DIRECTION_IN;
> +
> +	return GPIO_LINE_DIRECTION_OUT;
>  }
>
>  static void bcm2835_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
> diff --git a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
> index 42f7ab383ad9..3a0a9735ebd4 100644
> --- a/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
> +++ b/drivers/pinctrl/bcm/pinctrl-iproc-gpio.c
> @@ -357,7 +357,10 @@ static int iproc_gpio_get_direction(struct gpio_chip *gc, unsigned int gpio)
>  	unsigned int offset = IPROC_GPIO_REG(gpio, IPROC_GPIO_OUT_EN_OFFSET);
>  	unsigned int shift = IPROC_GPIO_SHIFT(gpio);
>
> -	return !(readl(chip->base + offset) & BIT(shift));
> +	if (readl(chip->base + offset) & BIT(shift))
> +		return GPIO_LINE_DIRECTION_OUT;
> +
> +	return GPIO_LINE_DIRECTION_IN;
>  }
>
>  static void iproc_gpio_set(struct gpio_chip *gc, unsigned gpio, int val)
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> index 53f52b9a0acd..4c11217e7d25 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -804,7 +804,10 @@ static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
>  		pctl->devdata->spec_dir_set(&reg_addr, offset);
>
>  	regmap_read(pctl->regmap1, reg_addr, &read_val);
> -	return !(read_val & bit);
> +	if (read_val & bit)
> +		return GPIO_LINE_DIRECTION_OUT;
> +
> +	return GPIO_LINE_DIRECTION_IN;
>  }
>
>  static int mtk_gpio_get(struct gpio_chip *chip, unsigned offset)
> diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
> index 923264d0e9ef..d70bb3aec2c9 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-paris.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
> @@ -699,7 +699,10 @@ static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
>  	if (err)
>  		return err;
>
> -	return !value;
> +	if (value)
> +		return GPIO_LINE_DIRECTION_OUT;
> +
> +	return GPIO_LINE_DIRECTION_IN;
>  }
>
>  static int mtk_gpio_get(struct gpio_chip *chip, unsigned int gpio)
> diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> index f2f5fcd9a237..73e41515d978 100644
> --- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> +++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
> @@ -403,7 +403,10 @@ static int armada_37xx_gpio_get_direction(struct gpio_chip *chip,
>  	mask = BIT(offset);
>  	regmap_read(info->regmap, reg, &val);
>
> -	return !(val & mask);
> +	if (val & mask)
> +		return GPIO_LINE_DIRECTION_OUT;
> +
> +	return GPIO_LINE_DIRECTION_IN;
>  }
>
>  static int armada_37xx_gpio_direction_output(struct gpio_chip *chip,
> diff --git a/drivers/pinctrl/nomadik/pinctrl-nomadik.c b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
> index 2a8190b11d10..21f0e044ef2d 100644
> --- a/drivers/pinctrl/nomadik/pinctrl-nomadik.c
> +++ b/drivers/pinctrl/nomadik/pinctrl-nomadik.c
> @@ -850,11 +850,14 @@ static int nmk_gpio_get_dir(struct gpio_chip *chip, unsigned offset)
>
>  	clk_enable(nmk_chip->clk);
>
> -	dir = !(readl(nmk_chip->addr + NMK_GPIO_DIR) & BIT(offset));
> +	dir = readl(nmk_chip->addr + NMK_GPIO_DIR) & BIT(offset);
>
>  	clk_disable(nmk_chip->clk);
>
> -	return dir;
> +	if (dir)
> +		return GPIO_LINE_DIRECTION_OUT;
> +
> +	return GPIO_LINE_DIRECTION_IN;
>  }
>
>  static int nmk_gpio_make_input(struct gpio_chip *chip, unsigned offset)
> diff --git a/drivers/pinctrl/pinctrl-amd.c b/drivers/pinctrl/pinctrl-amd.c
> index 2c61141519f8..9331a6b84acd 100644
> --- a/drivers/pinctrl/pinctrl-amd.c
> +++ b/drivers/pinctrl/pinctrl-amd.c
> @@ -46,7 +46,10 @@ static int amd_gpio_get_direction(struct gpio_chip *gc, unsigned offset)
>  	pin_reg = readl(gpio_dev->base + offset * 4);
>  	raw_spin_unlock_irqrestore(&gpio_dev->lock, flags);
>
> -	return !(pin_reg & BIT(OUTPUT_ENABLE_OFF));
> +	if (pin_reg & BIT(OUTPUT_ENABLE_OFF))
> +		return GPIO_LINE_DIRECTION_OUT;
> +
> +	return GPIO_LINE_DIRECTION_IN;
>  }
>
>  static int amd_gpio_direction_input(struct gpio_chip *gc, unsigned offset)
> diff --git a/drivers/pinctrl/pinctrl-at91.c b/drivers/pinctrl/pinctrl-at91.c
> index d6e7e9f0ddec..a3444c638337 100644
> --- a/drivers/pinctrl/pinctrl-at91.c
> +++ b/drivers/pinctrl/pinctrl-at91.c
> @@ -1414,7 +1414,10 @@ static int at91_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
>  	u32 osr;
>
>  	osr = readl_relaxed(pio + PIO_OSR);
> -	return !(osr & mask);
> +	if (osr & mask)
> +		return GPIO_LINE_DIRECTION_OUT;
> +
> +	return GPIO_LINE_DIRECTION_IN;
>  }
>
>  static int at91_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
> diff --git a/drivers/pinctrl/pinctrl-axp209.c b/drivers/pinctrl/pinctrl-axp209.c
> index be5b645815e5..207cbae3a7bf 100644
> --- a/drivers/pinctrl/pinctrl-axp209.c
> +++ b/drivers/pinctrl/pinctrl-axp209.c
> @@ -149,13 +149,16 @@ static int axp20x_gpio_get_direction(struct gpio_chip *chip,
>  	 * going to change the value soon anyway. Default to output.
>  	 */
>  	if ((val & AXP20X_GPIO_FUNCTIONS) > 2)
> -		return 0;
> +		return GPIO_LINE_DIRECTION_OUT;
>
>  	/*
>  	 * The GPIO directions are the three lowest values.
>  	 * 2 is input, 0 and 1 are output
>  	 */
> -	return val & 2;
> +	if (val & 2)
> +		return GPIO_LINE_DIRECTION_IN;
> +
> +	return GPIO_LINE_DIRECTION_OUT;
>  }
>
>  static int axp20x_gpio_output(struct gpio_chip *chip, unsigned int offset,
> diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
> index 6e2683016c1f..faee2f33792b 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -1643,13 +1643,19 @@ static int ingenic_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
>  	struct ingenic_pinctrl *jzpc = jzgc->jzpc;
>  	unsigned int pin = gc->base + offset;
>
> -	if (jzpc->version >= ID_JZ4760)
> -		return ingenic_get_pin_config(jzpc, pin, JZ4760_GPIO_PAT1);
> +	if (jzpc->version >= ID_JZ4760) {
> +		if (ingenic_get_pin_config(jzpc, pin, JZ4760_GPIO_PAT1))
> +			return GPIO_LINE_DIRECTION_IN;
> +		return GPIO_LINE_DIRECTION_OUT;
> +	}
>
>  	if (ingenic_get_pin_config(jzpc, pin, JZ4740_GPIO_SELECT))
> -		return true;
> +		return GPIO_LINE_DIRECTION_IN;
> +
> +	if (ingenic_get_pin_config(jzpc, pin, JZ4740_GPIO_DIR))
> +		return GPIO_LINE_DIRECTION_OUT;
>
> -	return !ingenic_get_pin_config(jzpc, pin, JZ4740_GPIO_DIR);
> +	return GPIO_LINE_DIRECTION_IN;
>  }
>
>  static const struct pinctrl_ops ingenic_pctlops = {
> diff --git a/drivers/pinctrl/pinctrl-ocelot.c b/drivers/pinctrl/pinctrl-ocelot.c
> index fb76fb2e9ea5..c3ae4b070c3d 100644
> --- a/drivers/pinctrl/pinctrl-ocelot.c
> +++ b/drivers/pinctrl/pinctrl-ocelot.c
> @@ -604,7 +604,10 @@ static int ocelot_gpio_get_direction(struct gpio_chip *chip,
>
>  	regmap_read(info->map, REG(OCELOT_GPIO_OE, info, offset), &val);
>
> -	return !(val & BIT(offset % 32));
> +	if (val & BIT(offset % 32))
> +		return GPIO_LINE_DIRECTION_OUT;
> +
> +	return GPIO_LINE_DIRECTION_IN;
>  }
>
>  static int ocelot_gpio_direction_input(struct gpio_chip *chip,
> diff --git a/drivers/pinctrl/pinctrl-oxnas.c b/drivers/pinctrl/pinctrl-oxnas.c
> index 55488ca246f1..7d6d17b94ab9 100644
> --- a/drivers/pinctrl/pinctrl-oxnas.c
> +++ b/drivers/pinctrl/pinctrl-oxnas.c
> @@ -756,7 +756,10 @@ static int oxnas_gpio_get_direction(struct gpio_chip *chip,
>  	struct oxnas_gpio_bank *bank = gpiochip_get_data(chip);
>  	u32 mask = BIT(offset);
>
> -	return !(readl_relaxed(bank->reg_base + OUTPUT_EN) & mask);
> +	if (readl_relaxed(bank->reg_base + OUTPUT_EN) & mask)
> +		return GPIO_LINE_DIRECTION_OUT;
> +
> +	return GPIO_LINE_DIRECTION_IN;
>  }
>
>  static int oxnas_gpio_direction_input(struct gpio_chip *chip,
> diff --git a/drivers/pinctrl/pinctrl-pic32.c b/drivers/pinctrl/pinctrl-pic32.c
> index e7f6dd5ab578..dd65178fbda2 100644
> --- a/drivers/pinctrl/pinctrl-pic32.c
> +++ b/drivers/pinctrl/pinctrl-pic32.c
> @@ -1990,7 +1990,10 @@ static int pic32_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
>  {
>  	struct pic32_gpio_bank *bank = gpiochip_get_data(chip);
>
> -	return !!(readl(bank->reg_base + TRIS_REG) & BIT(offset));
> +	if (readl(bank->reg_base + TRIS_REG) & BIT(offset))
> +		return GPIO_LINE_DIRECTION_IN;
> +
> +	return GPIO_LINE_DIRECTION_OUT;
>  }
>
>  static void pic32_gpio_irq_ack(struct irq_data *data)
> diff --git a/drivers/pinctrl/pinctrl-pistachio.c b/drivers/pinctrl/pinctrl-pistachio.c
> index 379e9a6a6d89..c33375f5c5ff 100644
> --- a/drivers/pinctrl/pinctrl-pistachio.c
> +++ b/drivers/pinctrl/pinctrl-pistachio.c
> @@ -1166,7 +1166,10 @@ static int pistachio_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
>  {
>  	struct pistachio_gpio_bank *bank = gpiochip_get_data(chip);
>
> -	return !(gpio_readl(bank, GPIO_OUTPUT_EN) & BIT(offset));
> +	if (gpio_readl(bank, GPIO_OUTPUT_EN) & BIT(offset))
> +		return GPIO_LINE_DIRECTION_OUT;
> +
> +	return GPIO_LINE_DIRECTION_IN;
>  }
>
>  static int pistachio_gpio_get(struct gpio_chip *chip, unsigned offset)
> diff --git a/drivers/pinctrl/pinctrl-rk805.c b/drivers/pinctrl/pinctrl-rk805.c
> index 26adbe9d6d42..cccbe072274e 100644
> --- a/drivers/pinctrl/pinctrl-rk805.c
> +++ b/drivers/pinctrl/pinctrl-rk805.c
> @@ -184,7 +184,7 @@ static int rk805_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
>
>  	/* default output*/
>  	if (!pci->pin_cfg[offset].dir_msk)
> -		return 0;
> +		return GPIO_LINE_DIRECTION_OUT;
>
>  	ret = regmap_read(pci->rk808->regmap,
>  			  pci->pin_cfg[offset].reg,
> @@ -194,7 +194,10 @@ static int rk805_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
>  		return ret;
>  	}
>
> -	return !(val & pci->pin_cfg[offset].dir_msk);
> +	if (val & pci->pin_cfg[offset].dir_msk)
> +		return GPIO_LINE_DIRECTION_OUT;
> +
> +	return GPIO_LINE_DIRECTION_IN;
>  }
>
>  static const struct gpio_chip rk805_gpio_chip = {
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index dc0bbf198cbc..cf5181ad817e 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -2211,7 +2211,10 @@ static int rockchip_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
>  	data = readl_relaxed(bank->reg_base + GPIO_SWPORT_DDR);
>  	clk_disable(bank->clk);
>
> -	return !(data & BIT(offset));
> +	if (data & BIT(offset))
> +		return GPIO_LINE_DIRECTION_OUT;
> +
> +	return GPIO_LINE_DIRECTION_IN;
>  }
>
>  /*
> diff --git a/drivers/pinctrl/pinctrl-rza1.c b/drivers/pinctrl/pinctrl-rza1.c
> index 215db220d795..002bd7346562 100644
> --- a/drivers/pinctrl/pinctrl-rza1.c
> +++ b/drivers/pinctrl/pinctrl-rza1.c
> @@ -777,7 +777,10 @@ static int rza1_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
>  {
>  	struct rza1_port *port = gpiochip_get_data(chip);
>
> -	return !!rza1_get_bit(port, RZA1_PM_REG, gpio);
> +	if (rza1_get_bit(port, RZA1_PM_REG, gpio))
> +		return GPIO_LINE_DIRECTION_IN;
> +
> +	return GPIO_LINE_DIRECTION_OUT;
>  }
>
>  static int rza1_gpio_direction_input(struct gpio_chip *chip,
> diff --git a/drivers/pinctrl/pinctrl-rza2.c b/drivers/pinctrl/pinctrl-rza2.c
> index 3be1d833bf25..0fca1fbc9480 100644
> --- a/drivers/pinctrl/pinctrl-rza2.c
> +++ b/drivers/pinctrl/pinctrl-rza2.c
> @@ -135,10 +135,10 @@ static int rza2_chip_get_direction(struct gpio_chip *chip, unsigned int offset)
>  	reg16 = (reg16 >> (pin * 2)) & RZA2_PDR_MASK;
>
>  	if (reg16 == RZA2_PDR_OUTPUT)
> -		return 0;
> +		return GPIO_LINE_DIRECTION_OUT;
>
>  	if (reg16 == RZA2_PDR_INPUT)
> -		return 1;
> +		return GPIO_LINE_DIRECTION_IN;
>
>  	/*
>  	 * This GPIO controller has a default Hi-Z state that is not input or
> @@ -146,7 +146,7 @@ static int rza2_chip_get_direction(struct gpio_chip *chip, unsigned int offset)
>  	 */
>  	rza2_pin_to_gpio(priv->base, offset, 1);
>
> -	return 1;
> +	return GPIO_LINE_DIRECTION_IN;
>  }
>
>  static int rza2_chip_direction_input(struct gpio_chip *chip,
> diff --git a/drivers/pinctrl/pinctrl-st.c b/drivers/pinctrl/pinctrl-st.c
> index 00db8b9efb2c..aff589ce446f 100644
> --- a/drivers/pinctrl/pinctrl-st.c
> +++ b/drivers/pinctrl/pinctrl-st.c
> @@ -746,7 +746,10 @@ static int st_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
>  	function = st_pctl_get_pin_function(&pc, offset);
>  	if (function) {
>  		st_pinconf_get_direction(&pc, offset, &config);
> -		return !ST_PINCONF_UNPACK_OE(config);
> +		if (ST_PINCONF_UNPACK_OE(config))
> +			return GPIO_LINE_DIRECTION_OUT;
> +
> +		return GPIO_LINE_DIRECTION_IN;
>  	}
>
>  	/*
> @@ -758,7 +761,10 @@ static int st_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
>  		direction |= ((value >> offset) & 0x1) << i;
>  	}
>
> -	return (direction == ST_GPIO_DIRECTION_IN);
> +	if (direction == ST_GPIO_DIRECTION_IN)
> +		return GPIO_LINE_DIRECTION_IN;
> +
> +	return GPIO_LINE_DIRECTION_OUT;
>  }
>
>  /* Pinctrl Groups */
> @@ -996,6 +1002,7 @@ static void st_pinconf_dbg_show(struct pinctrl_dev *pctldev,
>  	unsigned int function;
>  	int offset = st_gpio_pin(pin_id);
>  	char f[16];
> +	int oe;
>
>  	mutex_unlock(&pctldev->mutex);
>  	pc = st_get_pio_control(pctldev, pin_id);
> @@ -1008,10 +1015,11 @@ static void st_pinconf_dbg_show(struct pinctrl_dev *pctldev,
>  	else
>  		snprintf(f, 5, "GPIO");
>
> +	oe = st_gpio_get_direction(&pc_to_bank(pc)->gpio_chip, offset);
>  	seq_printf(s, "[OE:%d,PU:%ld,OD:%ld]\t%s\n"
>  		"\t\t[retime:%ld,invclk:%ld,clknotdat:%ld,"
>  		"de:%ld,rt-clk:%ld,rt-delay:%ld]",
> -		!st_gpio_get_direction(&pc_to_bank(pc)->gpio_chip, offset),
> +		(oe == GPIO_LINE_DIRECTION_OUT),
>  		ST_PINCONF_UNPACK_PU(config),
>  		ST_PINCONF_UNPACK_OD(config),
>  		f,
> diff --git a/drivers/pinctrl/pinctrl-stmfx.c b/drivers/pinctrl/pinctrl-stmfx.c
> index 564660028fcc..132a0f217692 100644
> --- a/drivers/pinctrl/pinctrl-stmfx.c
> +++ b/drivers/pinctrl/pinctrl-stmfx.c
> @@ -134,10 +134,14 @@ static int stmfx_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
>  	ret = regmap_read(pctl->stmfx->map, reg, &val);
>  	/*
>  	 * On stmfx, gpio pins direction is (0)input, (1)output.
> -	 * .get_direction returns 0=out, 1=in
>  	 */
> +	if (ret)
> +		return ret;
>
> -	return ret ? ret : !(val & mask);
> +	if (val & mask)
> +		return GPIO_LINE_DIRECTION_OUT;
> +
> +	return GPIO_LINE_DIRECTION_IN;
>  }
>
>  static int stmfx_gpio_direction_input(struct gpio_chip *gc, unsigned int offset)
> @@ -223,6 +227,13 @@ static int stmfx_pinconf_get(struct pinctrl_dev *pctldev,
>  	dir = stmfx_gpio_get_direction(&pctl->gpio_chip, pin);
>  	if (dir < 0)
>  		return dir;
> +
> +	/*
> +	 * Currently the gpiolib IN is 1 and OUT is 0 but let's not count
> +	 * on it just to be on the safe side also in the future :)
> +	 */
> +	dir = (dir == GPIO_LINE_DIRECTION_IN) ? 1 : 0;
> +
>  	type = stmfx_pinconf_get_type(pctl, pin);
>  	if (type < 0)
>  		return type;
> @@ -360,7 +371,7 @@ static void stmfx_pinconf_dbg_show(struct pinctrl_dev *pctldev,
>  	if (val < 0)
>  		return;
>
> -	if (!dir) {
> +	if (dir == GPIO_LINE_DIRECTION_OUT) {
>  		seq_printf(s, "output %s ", val ? "high" : "low");
>  		if (type)
>  			seq_printf(s, "open drain %s internal pull-up ",
> diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
> index 566665931a04..6e74bd87d959 100644
> --- a/drivers/pinctrl/pinctrl-sx150x.c
> +++ b/drivers/pinctrl/pinctrl-sx150x.c
> @@ -391,13 +391,16 @@ static int sx150x_gpio_get_direction(struct gpio_chip *chip,
>  	int ret;
>
>  	if (sx150x_pin_is_oscio(pctl, offset))
> -		return false;
> +		return GPIO_LINE_DIRECTION_OUT;
>
>  	ret = regmap_read(pctl->regmap, pctl->data->reg_dir, &value);
>  	if (ret < 0)
>  		return ret;
>
> -	return !!(value & BIT(offset));
> +	if (value & BIT(offset))
> +		return GPIO_LINE_DIRECTION_IN;
> +
> +	return GPIO_LINE_DIRECTION_OUT;
>  }
>
>  static int sx150x_gpio_get(struct gpio_chip *chip, unsigned int offset)
> @@ -687,7 +690,7 @@ static int sx150x_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin,
>  		if (ret < 0)
>  			return ret;
>
> -		if (ret)
> +		if (ret == GPIO_LINE_DIRECTION_IN)
>  			return -EINVAL;
>
>  		ret = sx150x_gpio_get(&pctl->gpio, pin);
> diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
> index 763da0be10d6..8844ca1261d5 100644
> --- a/drivers/pinctrl/qcom/pinctrl-msm.c
> +++ b/drivers/pinctrl/qcom/pinctrl-msm.c
> @@ -485,8 +485,8 @@ static int msm_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
>
>  	val = msm_readl_ctl(pctrl, g);
>
> -	/* 0 = output, 1 = input */
> -	return val & BIT(g->oe_bit) ? 0 : 1;
> +	return val & BIT(g->oe_bit) ? GPIO_LINE_DIRECTION_OUT :
> +				      GPIO_LINE_DIRECTION_IN;
>  }
>
>  static int msm_gpio_get(struct gpio_chip *chip, unsigned offset)
> diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
> index 2d5e0435af0a..72e0669ca7c8 100644
> --- a/drivers/pinctrl/stm32/pinctrl-stm32.c
> +++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
> @@ -283,9 +283,9 @@ static int stm32_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
>
>  	stm32_pmx_get_mode(bank, pin, &mode, &alt);
>  	if ((alt == 0) && (mode == 0))
> -		ret = 1;
> +		ret = GPIO_LINE_DIRECTION_IN;
>  	else if ((alt == 0) && (mode == 1))
> -		ret = 0;
> +		ret = GPIO_LINE_DIRECTION_OUT;
>  	else
>  		ret = -EINVAL;
>
> diff --git a/drivers/pinctrl/vt8500/pinctrl-wmt.c b/drivers/pinctrl/vt8500/pinctrl-wmt.c
> index 4d5cd7d8c760..7f2aceba295a 100644
> --- a/drivers/pinctrl/vt8500/pinctrl-wmt.c
> +++ b/drivers/pinctrl/vt8500/pinctrl-wmt.c
> @@ -486,8 +486,10 @@ static int wmt_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
>  	u32 val;
>
>  	val = readl_relaxed(data->base + reg_dir);
> -	/* Return 0 == output, 1 == input */
> -	return !(val & BIT(bit));
> +	if (val & BIT(bit))
> +		GPIO_LINE_DIRECTION_OUT;
> +
> +	return GPIO_LINE_DIRECTION_IN;
>  }
>
>  static int wmt_gpio_get_value(struct gpio_chip *chip, unsigned offset)
> --
> 2.21.0
>
>
> --
> Matti Vaittinen, Linux device drivers
> ROHM Semiconductors, Finland SWDC
> Kiviharjunlenkki 1E
> 90220 OULU
> FINLAND
>
> ~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
> Simon says - in Latin please.
> ~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
> Thanks to Simon Glass for the translation =]

--3cofqt6mytfzspnk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEtcQ9SICaIIqPWDjAcjQGjxahVjwFAl3LxHwACgkQcjQGjxah
VjxDOhAAjapDY3w5vt0xFk97lIjMO+xK9bVX7zzNj2x68vZz5vVChLZA7dubeKJt
vlYroZ52LvYR/tS491SHeSsUXopbr2O0WDWcZLNLVReIhGVuQJZ8DkNGw9BDxC7h
CAbKTck/N33HTmHjqNHPgvZ52eSaS9/wMw2HBbSqxL/QPuyJ1SxRIoVdFOmR72di
wli9sa7udGijiLURljoiaFZvZeQqi4jRjGN30y2SbJLCVsTESCozMwKakZV2e1yh
i+/r9subySdZaOFzBtEcWLmkyAPwi0AHsIWwSmzTpM1RktflMx9+zCHDcetNZ4gL
GUzigjWwGR3vE4FgapPKx4uVN+ZM14yinFZZvTxp6KKtKbHPW5n2EHPeldojoGwc
FYGIH/wjhi9X0eRM6J3r924IaUon+iRPK4LoyrabyMOzjeNDQvjWDjsgmXCyhTW7
iQeCRao1zao39rPraIEPfOgog+in50PpZo74akcm04yhQj65EHqekjX0LxajEWI1
KJFU3tyh5M0NGuam7FTJVdJsWqOOXGE973CvMqtgaaBAKs2Lrw5JV+fzWf/QtIZL
9Ae0gI8HbCWEzBDIChwjvk/y83FlQYGBF9xMZZz9cWxf1snZZEQ8idap631uXL/G
nUMpt5tg7zyT9eA8p4DDtLaMvsr+dHdsR3gNLYvLWow9zPJ8ASo=
=MTK4
-----END PGP SIGNATURE-----

--3cofqt6mytfzspnk--
