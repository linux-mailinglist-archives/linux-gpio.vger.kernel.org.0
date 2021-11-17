Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE4C54550DD
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Nov 2021 23:59:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233932AbhKQXCz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Nov 2021 18:02:55 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:38115 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233251AbhKQXCx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Nov 2021 18:02:53 -0500
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 230876000D;
        Wed, 17 Nov 2021 22:59:51 +0000 (UTC)
Date:   Wed, 17 Nov 2021 23:59:51 +0100
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Kavyasree Kotagiri <kavyasree.kotagiri@microchip.com>
Cc:     robh+dt@kernel.org, linus.walleij@linaro.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com
Subject: Re: [PATCH 2/2] pinctrl: ocelot: Extend support for lan966x
Message-ID: <YZWJZzCuzXTVzIJ+@piout.net>
References: <20211029092703.18886-1-kavyasree.kotagiri@microchip.com>
 <20211029092703.18886-3-kavyasree.kotagiri@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211029092703.18886-3-kavyasree.kotagiri@microchip.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hello Kavya,

On 29/10/2021 14:57:03+0530, Kavyasree Kotagiri wrote:
> +	LAN966X_PIN(76),
> +	LAN966X_PIN(77),
> +};
> +
> +

One blank line should be removed

>  static int ocelot_get_functions_count(struct pinctrl_dev *pctldev)
>  {
>  	return ARRAY_SIZE(ocelot_function_names);
> @@ -709,6 +1056,9 @@ static int ocelot_pin_function_idx(struct ocelot_pinctrl *info,
>  	for (i = 0; i < OCELOT_FUNC_PER_PIN; i++) {
>  		if (function == p->functions[i])
>  			return i;
> +
> +		if (function == p->a_functions[i])
> +			return i + OCELOT_FUNC_PER_PIN;
>  	}
>  
>  	return -1;
> @@ -744,6 +1094,36 @@ static int ocelot_pinmux_set_mux(struct pinctrl_dev *pctldev,
>  	return 0;
>  }
>  
> +static int lan966x_pinmux_set_mux(struct pinctrl_dev *pctldev,
> +				  unsigned int selector, unsigned int group)
> +{
> +	struct ocelot_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
> +	struct ocelot_pin_caps *pin = info->desc->pins[group].drv_data;
> +	unsigned int p = pin->pin % 32;
> +	int f;
> +
> +	f = ocelot_pin_function_idx(info, group, selector);
> +	if (f < 0)
> +		return -EINVAL;
> +
> +	/*
> +	 * f is encoded on three bits.
> +	 * bit 0 of f goes in BIT(pin) of ALT[0], bit 1 of f goes in BIT(pin) of
> +	 * ALT[1], bit 2 of f goes in BIT(pin) of ALT[2]
> +	 * This is racy because both registers can't be updated at the same time

That's three registers, not two so I guess this sentence should be
reworked.

> +	 * but it doesn't matter much for now.
> +	 * Note: ALT0/ALT1/ALT2 are organized specially for 78 gpio targets
> +	 */
> +	regmap_update_bits(info->map, REG_ALT(0, info, pin->pin),
> +			   BIT(p), f << p);
> +	regmap_update_bits(info->map, REG_ALT(1, info, pin->pin),
> +			   BIT(p), (f >> 1) << p);
> +	regmap_update_bits(info->map, REG_ALT(2, info, pin->pin),
> +			   BIT(p), (f >> 2) << p);
> +

I would have thought the hardware would be fixed because you now have 78
pins and this probably will get worse over time. This is really a poor
choice of interface as now you will get two transient states instead of
one.

> +	return 0;
> +}
> +
>  #define REG(r, info, p) ((r) * (info)->stride + (4 * ((p) / 32)))
>  
>  static int ocelot_gpio_set_direction(struct pinctrl_dev *pctldev,
> @@ -774,6 +1154,23 @@ static int ocelot_gpio_request_enable(struct pinctrl_dev *pctldev,
>  	return 0;
>  }
>  
> +static int lan966x_gpio_request_enable(struct pinctrl_dev *pctldev,
> +				       struct pinctrl_gpio_range *range,
> +				       unsigned int offset)
> +{
> +	struct ocelot_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
> +	unsigned int p = offset % 32;
> +
> +	regmap_update_bits(info->map, REG_ALT(0, info, offset),
> +			   BIT(p), 0);
> +	regmap_update_bits(info->map, REG_ALT(1, info, offset),
> +			   BIT(p), 0);
> +	regmap_update_bits(info->map, REG_ALT(2, info, offset),
> +			   BIT(p), 0);
> +
> +	return 0;
> +}
> +
>  static const struct pinmux_ops ocelot_pmx_ops = {
>  	.get_functions_count = ocelot_get_functions_count,
>  	.get_function_name = ocelot_get_function_name,
> @@ -783,6 +1180,15 @@ static const struct pinmux_ops ocelot_pmx_ops = {
>  	.gpio_request_enable = ocelot_gpio_request_enable,
>  };
>  
> +static const struct pinmux_ops lan966x_pmx_ops = {
> +	.get_functions_count = ocelot_get_functions_count,
> +	.get_function_name = ocelot_get_function_name,
> +	.get_function_groups = ocelot_get_function_groups,
> +	.set_mux = lan966x_pinmux_set_mux,
> +	.gpio_set_direction = ocelot_gpio_set_direction,
> +	.gpio_request_enable = lan966x_gpio_request_enable,
> +};
> +
>  static int ocelot_pctl_get_groups_count(struct pinctrl_dev *pctldev)
>  {
>  	struct ocelot_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
> @@ -1074,6 +1480,14 @@ static struct pinctrl_desc sparx5_desc = {
>  	.npins = ARRAY_SIZE(sparx5_pins),
>  	.pctlops = &ocelot_pctl_ops,
>  	.pmxops = &ocelot_pmx_ops,
> +};
> +
> +static struct pinctrl_desc lan966x_desc = {
> +	.name = "lan966x-pinctrl",
> +	.pins = lan966x_pins,
> +	.npins = ARRAY_SIZE(lan966x_pins),
> +	.pctlops = &ocelot_pctl_ops,
> +	.pmxops = &lan966x_pmx_ops,
>  	.confops = &ocelot_confops,
>  	.owner = THIS_MODULE,
>  };
> @@ -1114,6 +1528,7 @@ static int ocelot_create_group_func_map(struct device *dev,
>  	return 0;
>  }
>  
> +

Useless blank line

>  static int ocelot_pinctrl_register(struct platform_device *pdev,
>  				   struct ocelot_pinctrl *info)
>  {
> @@ -1337,6 +1752,7 @@ static const struct of_device_id ocelot_pinctrl_of_match[] = {
>  	{ .compatible = "mscc,ocelot-pinctrl", .data = &ocelot_desc },
>  	{ .compatible = "mscc,jaguar2-pinctrl", .data = &jaguar2_desc },
>  	{ .compatible = "microchip,sparx5-pinctrl", .data = &sparx5_desc },
> +	{ .compatible = "microchip,lan966x-pinctrl", .data = &lan966x_desc },
>  	{},
>  };
>  
> -- 
> 2.17.1
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
