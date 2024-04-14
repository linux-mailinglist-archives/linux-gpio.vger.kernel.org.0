Return-Path: <linux-gpio+bounces-5281-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A04789EE07
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 10:54:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3D1671C21487
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Apr 2024 08:54:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B8FE13DBA2;
	Wed, 10 Apr 2024 08:54:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5DA154BF6
	for <linux-gpio@vger.kernel.org>; Wed, 10 Apr 2024 08:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712739257; cv=none; b=PA5tNbTYJhgX9gpUp//MSC/UOuafondMmbof1D+rpSWxWX2wKTfVyWtG2rdMvqf0LNBxkN516CxlzipUeRiEZaMDn8vcVlqTx4gz/OV0U2FVLO5Pyw80nBgju4cC8KJykvSzEGZuxTqhBmNn6SWkvWn7y/cyqMczQdjrbwJ85OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712739257; c=relaxed/simple;
	bh=fqQ+fGZTS0DlchRHj16dh+XcVLPtCREgK/BWw6VOm64=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JAsCZ60UgA7kHtb7267N9oliHF8Eq3b4uEoauYFzEycL6lQBbKVjTjVnXLUQNNxH5vC7NTFV6v8xsDPiTNZrjj5Ban5gL3w0erZh7zwyNfDRbTwIhR/jGHrWQfTe/dfQEkycI7mkjxKhdTQvtH7XXfYpeQl/0t0lhWswsQCeSKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-26-217.elisa-laajakaista.fi [88.113.26.217])
	by fgw20.mail.saunalahti.fi (Halon) with ESMTP
	id e555ebac-f717-11ee-b3cf-005056bd6ce9;
	Wed, 10 Apr 2024 11:54:11 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 10 Apr 2024 11:54:09 +0300
To: Jacky Huang <ychuang570808@gmail.com>
Cc: linus.walleij@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	p.zabel@pengutronix.de, j.neuschaefer@gmx.net,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	ychuang3@nuvoton.com, schung@nuvoton.com
Subject: Re: [PATCH v7 3/3] pinctrl: nuvoton: Add ma35d1 pinctrl and GPIO
 driver
Message-ID: <ZhZTsV3RKpuyeUr4@surfacebook.localdomain>
References: <20240409095637.2135-1-ychuang570808@gmail.com>
 <20240409095637.2135-4-ychuang570808@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240409095637.2135-4-ychuang570808@gmail.com>

Tue, Apr 09, 2024 at 09:56:37AM +0000, Jacky Huang kirjoitti:
> From: Jacky Huang <ychuang3@nuvoton.com>
> 
> Add common pinctrl and GPIO driver for Nuvoton MA35 series SoC, and
> add support for ma35d1 pinctrl.

...

> + * Copyright (C) 2023 Nuvoton Technology Corp.

Almos mid of 2024...

...

> +#include <linux/gpio/driver.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_device.h>
> +#include <linux/of_address.h>

Do you really need all of these pf*.h?
Don't you miss other headers to be included (spoiler: a lot!)

> +#include <linux/pinctrl/pinconf.h>
> +#include <linux/pinctrl/pinctrl.h>

Move this group...

> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +

...to be here to show the relation to the pin control subsystem.

> +#include "../core.h"
> +#include "../pinconf.h"
> +#include "pinctrl-ma35.h"

...

> +#define MA35_GP_MODE_MASK_WIDTH		2
> +
> +#define MA35_GP_SLEWCTL_MASK_WIDTH	2

I looked at the code how you use these... Oh, please switch to FIELD_GET() /
FIELD_PREP() (don't forget to include bitfield.h)

...

> +struct ma35_pin_func {
> +	const char		*name;
> +	const char		**groups;
> +	u32			ngroups;
> +};

NIH struct pinfunction.

You may still have a wrapper (as struct pingroup below most likely will be
embedded in your custom data type), see the pinctrl-intel.h examples.

...

> +struct ma35_pin_group {
> +	const char		*name;
> +	unsigned int		npins;
> +	unsigned int		*pins;

NIH struct pingroup.

> +	struct ma35_pin_setting	*settings;
> +};

...

> +struct ma35_pin_bank {
> +	void __iomem		*reg_base;
> +	struct clk		*clk;
> +	int			irq;
> +	u8			nr_pins;
> +	const char		*name;
> +	u8			bank_num;

Interleaved fields with such a different type may lead to waste of memory. Run
`pahole` and update the ordering in this struct accordingly.

> +	bool			valid;

> +	struct device_node	*np;

Can you keep it fwnode-based?

> +	struct gpio_chip	chip;
> +	u32			irqtype;
> +	u32			irqinten;
> +	struct regmap		*regmap;
> +	struct device		*dev;

> +	spinlock_t		lock;

No use in RT_PREEMPT?

> +};

...

> +	new_map = devm_kcalloc(pctldev->dev, map_num, sizeof(*new_map), GFP_KERNEL);
> +	if (!new_map)
> +		return -ENOMEM;
> +
> +	*map = new_map;
> +	*num_maps = map_num;
> +	/* create mux map */
> +	parent = of_get_parent(np);
> +	if (!parent) {
> +		devm_kfree(pctldev->dev, new_map);

Huh?! Are you sure you know the scope of usage of devm_*()?

> +		return -EINVAL;
> +	}
> +

...

> +		regval &= ~GENMASK(setting->shift + MA35_MFP_BITS_PER_PORT - 1,
> +				   setting->shift);

This will generate an awful code. Use respective FIELD_*() macros.

...

> +	regval &= ~GENMASK(gpio * MA35_GP_MODE_MASK_WIDTH - 1,
> +			   gpio * MA35_GP_MODE_MASK_WIDTH);
> +	regval |= mode << gpio * MA35_GP_MODE_MASK_WIDTH;

Ditto.

...

> +	regval &= GENMASK(gpio * MA35_GP_MODE_MASK_WIDTH - 1,
> +			  gpio * MA35_GP_MODE_MASK_WIDTH);
> +
> +	return regval >> gpio * MA35_GP_MODE_MASK_WIDTH;

Ditto.

...

> +static int ma35_gpio_core_direction_in(struct gpio_chip *gc, unsigned int gpio)
> +{
> +	struct ma35_pin_bank *bank = gpiochip_get_data(gc);
> +	void __iomem *reg_mode = bank->reg_base + MA35_GP_REG_MODE;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&bank->lock, flags);

Use cleanup.h, i.e. guard() in this case, from day 1.
Similar approach for all other places.

> +	spin_unlock_irqrestore(&bank->lock, flags);
> +
> +	return 0;
> +}

...

> +	regval = readl(reg_dout);
> +	if (val)
> +		writel(regval | BIT(gpio), reg_dout);
> +	else
> +		writel(regval & ~BIT(gpio), reg_dout);

Can you split regval update and make only a single writel() call? It's slightly
better pattern

	read()
	if (foo)
		v =
	else
		v = 
	write()

> +	ma35_gpio_set_mode(reg_mode, gpio, MA35_GP_MODE_OUTPUT);

...

> +	regval &= ~GENMASK(bit_offs + MA35_MFP_BITS_PER_PORT - 1, bit_offs);

FIELD_GET()

...

> +	writel(1<<num, reg_intsrc);

Oh, something happened here, besides indentation.
Have you meant BIT() ?

...

> +	unsigned int num = (d->hwirq);

Read Documentation on how to access hwirq field and what type of the value
should be. There are plently of the examples already in the kernel. Just
check the recent (more or less) ones.

...

> +	/*
> +	 * The MA35_GP_REG_INTEN bits 0 ~ 15 control low-level or falling edge trigger,
> +	 * while bits 16 ~ 31 control high-level or rising edge trigger.
> +	 * We disable both type of interrupt.
> +	 */
> +	regval &= ~(BIT(num + 16) | BIT(num));

You have this idiom more than once in the code, make the definition and use it.
Move comment closer to that definition.

...

> +		irq_set_handler_locked(d, handle_edge_irq);
> +		bank->irqtype &= ~(0x1 << num);
> +		bank->irqinten |= (0x1 << num);
> +		bank->irqinten &= ~(0x1 << (num + 16));
> +		break;
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		irq_set_handler_locked(d, handle_level_irq);
> +		bank->irqtype |= (0x1 << num);
> +		bank->irqinten &= ~(0x1 << num);
> +		bank->irqinten |= (0x1 << (num + 16));
> +		break;
> +	case IRQ_TYPE_LEVEL_LOW:
> +		irq_set_handler_locked(d, handle_level_irq);
> +		bank->irqtype |= (0x1 << num);
> +		bank->irqinten &= ~(0x1 << (num + 16));
> +		bank->irqinten |= (0x1 << num);
> +		break;

BIT() in all cases.

...


> +		irq_set_handler_locked(d, handle_bad_irq);

Just assign it in the probe.

...

> +static struct irq_chip ma35_gpio_irqchip = {
> +	.name = "MA35-GPIO-IRQ",
> +	.irq_disable = ma35_irq_gpio_mask,
> +	.irq_enable = ma35_irq_gpio_unmask,
> +	.irq_ack = ma35_irq_gpio_ack,
> +	.irq_mask = ma35_irq_gpio_mask,
> +	.irq_unmask = ma35_irq_gpio_unmask,
> +	.irq_set_type = ma35_irq_irqtype,
> +	.flags = IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_SKIP_SET_WAKE | IRQCHIP_IMMUTABLE,

It doesn't look like IMMUTABLE. Again, check other examples, there are a lot.

...

> +static void ma35_irq_demux_intgroup(struct irq_desc *desc)
> +{
> +	struct ma35_pin_bank *bank = gpiochip_get_data(irq_desc_get_handler_data(desc));
> +	struct irq_domain *irqdomain = bank->chip.irq.domain;
> +	struct irq_chip *irqchip = irq_desc_get_chip(desc);
> +	unsigned long isr;
> +	int offset;
> +
> +	chained_irq_enter(irqchip, desc);
> +	isr = readl(bank->reg_base + MA35_GP_REG_INTSRC);

> +	if (isr)

Unneeded duplicate check.

> +		for_each_set_bit(offset, &isr, bank->nr_pins)
> +			generic_handle_irq(irq_find_mapping(irqdomain, offset));
> +
> +	chained_irq_exit(irqchip, desc);
> +}

...

> +	for (i = 0; i < ctrl->nr_banks; ++i, ++bank) {

Why pre-increments?

> +		if (!bank->valid) {
> +			dev_warn(&pdev->dev, "bank %s is not valid\n",
> +				 bank->np->name);

Do not use fwnode / of_node name like this, use proper specifiers: %pfw / %pOF.

> +			continue;
> +		}
> +		bank->irqtype = 0;
> +		bank->irqinten = 0;
> +		bank->chip.label = bank->name;
> +		bank->chip.of_gpio_n_cells = 2;
> +		bank->chip.parent = &pdev->dev;
> +		bank->chip.request = ma35_gpio_core_to_request;
> +		bank->chip.direction_input = ma35_gpio_core_direction_in;
> +		bank->chip.direction_output = ma35_gpio_core_direction_out;
> +		bank->chip.get = ma35_gpio_core_get;
> +		bank->chip.set = ma35_gpio_core_set;
> +		bank->chip.base = -1;
> +		bank->chip.ngpio = bank->nr_pins;
> +		bank->chip.can_sleep = false;
> +		spin_lock_init(&bank->lock);
> +
> +		if (bank->irq > 0) {
> +			struct gpio_irq_chip *girq;
> +
> +			girq = &bank->chip.irq;
> +			gpio_irq_chip_set_chip(girq, &ma35_gpio_irqchip);
> +			girq->parent_handler = ma35_irq_demux_intgroup;
> +			girq->num_parents = 1;
> +
> +			girq->parents = devm_kcalloc(&pdev->dev, 1, sizeof(*girq->parents),

Use num_parents instead of 1.

> +						     GFP_KERNEL);
> +			if (!girq->parents) {
> +				ret = -ENOMEM;
> +				goto fail;
> +			}
> +
> +			girq->parents[0] = bank->irq;
> +			girq->default_type = IRQ_TYPE_NONE;
> +			girq->handler = handle_bad_irq;
> +		}
> +
> +		ret = gpiochip_add_data(&bank->chip, bank);
> +		if (ret) {
> +			dev_err(&pdev->dev, "failed to register gpio_chip %s, error code: %d\n",
> +				bank->chip.label, ret);
> +			goto fail;
> +		}
> +	}

...

> +fail:
> +	for (--i, --bank; i >= 0; --i, --bank) {

	while (i--) {
		bank--;
		...
	}

much better to read.

> +		if (!bank->valid)
> +			continue;
> +		gpiochip_remove(&bank->chip);
> +	}
> +	return ret;
> +}

...

> +static int ma35_get_bank_data(struct ma35_pin_bank *bank, struct ma35_pinctrl *npctl)
> +{
> +	struct resource res;
> +
> +	if (of_address_to_resource(bank->np, 0, &res)) {
> +		dev_err(npctl->dev, "cannot find IO resource for bank\n");
> +		return -ENOENT;
> +	}
> +
> +	bank->reg_base = devm_ioremap_resource(npctl->dev, &res);
> +	if (IS_ERR(bank->reg_base)) {
> +		dev_err(npctl->dev, "cannot ioremap resource for bank\n");
> +		return PTR_ERR(bank->reg_base);
> +	}

Use fwnode_iomap()

> +	bank->irq = irq_of_parse_and_map(bank->np, 0);

Use fwnode_get_irq()

> +	bank->nr_pins = MA35_GPIO_PORT_MAX;
> +
> +	bank->clk = of_clk_get(bank->np, 0);

Can't you use simple clk_get()? Why?

> +	if (IS_ERR(bank->clk))
> +		return PTR_ERR(bank->clk);
> +
> +	return clk_prepare_enable(bank->clk);
> +}

...

> +	for_each_gpiochip_node(&pdev->dev, child) {
> +		struct device_node *np = to_of_node(child);

No need, just keep everythin fwnode based.

> +		bank = &ctrl->pin_banks[id];
> +		bank->np = np;
> +		bank->regmap = pctl->regmap;
> +		bank->dev = &pdev->dev;
> +		if (!ma35_get_bank_data(bank, pctl))
> +			bank->valid = true;
> +		id++;
> +	}

...

> +	regval &= ~GENMASK(port * MA35_GP_PUSEL_MASK_WIDTH - 1,
> +			   port * MA35_GP_PUSEL_MASK_WIDTH);

FIELD_*()

...

> +	regval &= GENMASK(port * MA35_GP_PUSEL_MASK_WIDTH - 1,
> +			  port * MA35_GP_PUSEL_MASK_WIDTH);
> +	regval >>= port * MA35_GP_PUSEL_MASK_WIDTH;

Ditto.

...

> +	if (regval & BIT(port))
> +		return MVOLT_3300;
> +	else
> +		return MVOLT_1800;

Can be written as

	return (regval & BIT()) ? _3300 : _1800;

...

> +	if (port < MA35_GP_DSH_BASE_PORT) {
> +		regval = readl(base + MA35_GP_REG_DSL);
> +		ds_val = (regval & GENMASK(port * 4 + 2, port * 4)) >> port * 4;

This is too complicated way of saying

		ds_val = (regval >> port * 4) & GENMASK(2, 0);

> +	} else {
> +		port -= MA35_GP_DSH_BASE_PORT;
> +		regval = readl(base + MA35_GP_REG_DSH);
> +		ds_val = (regval & GENMASK(port * 4 + 2, port * 4)) >> port * 4;

Ditto.

> +	}

...

> +	if (ma35_pinconf_get_power_source(npctl, pin) == MVOLT_1800) {
> +		for (i = 0; i < ARRAY_SIZE(ds_1800mv_tbl); i++) {
> +			if (ds_1800mv_tbl[i] == strength)
> +				ds_val = i;

And still continue?!

> +		}
> +	} else {
> +		for (i = 0; i < ARRAY_SIZE(ds_3300mv_tbl); i++) {
> +			if (ds_3300mv_tbl[i] == strength)
> +				ds_val = i;

Ditto.

> +		}
> +	}

Wondering if the linear_ranges or other existing tables approaches can be used here.

...

> +	if (port < MA35_GP_DSH_BASE_PORT) {
> +		regval = readl(base + MA35_GP_REG_DSL);
> +		regval &= ~GENMASK(port * 4 + 2, port * 4);
> +		regval |= ds_val << port * 4;

As per above

		~(GENMASK(2, 0) << (port * 4))

> +		writel(regval, base + MA35_GP_REG_DSL);
> +	} else {
> +		port -= MA35_GP_DSH_BASE_PORT;
> +		regval = readl(base + MA35_GP_REG_DSH);
> +		regval &= ~GENMASK(port * 4 + 2, port * 4);

Ditto.

> +		regval |= ds_val << port * 4;
> +		writel(regval, base + MA35_GP_REG_DSH);
> +	}

...

> +	regval &= ~GENMASK(port * MA35_GP_SLEWCTL_MASK_WIDTH - 1,
> +			   port * MA35_GP_SLEWCTL_MASK_WIDTH);
> +	regval |= rate << port * MA35_GP_SLEWCTL_MASK_WIDTH;

FIELD_*()

...

> +static int ma35_pinconf_get(struct pinctrl_dev *pctldev, unsigned int pin, unsigned long *config)
> +{
> +	struct ma35_pinctrl *npctl = pinctrl_dev_get_drvdata(pctldev);
> +	enum pin_config_param param = pinconf_to_config_param(*config);
> +	u32 arg;
> +	int ret;
> +
> +	switch (param) {
> +	case PIN_CONFIG_BIAS_DISABLE:
> +	case PIN_CONFIG_BIAS_PULL_DOWN:
> +	case PIN_CONFIG_BIAS_PULL_UP:

> +		if (ma35_pinconf_get_pull(npctl, pin) == param)
> +			arg = 1;
> +		else
> +			return -EINVAL;
> +		break;

Check for the error case first and get rid of redundant 'else'.

> +	case PIN_CONFIG_DRIVE_STRENGTH:
> +		ret = ma35_pinconf_get_drive_strength(npctl, pin, &arg);
> +		if (ret)
> +			return ret;
> +		break;
> +
> +	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> +		arg = ma35_pinconf_get_schmitt_enable(npctl, pin);
> +		break;
> +
> +	case PIN_CONFIG_SLEW_RATE:
> +		arg = ma35_pinconf_get_slew_rate(npctl, pin);
> +		break;
> +
> +	case PIN_CONFIG_OUTPUT_ENABLE:
> +		arg = ma35_pinconf_get_output(npctl, pin);
> +		break;
> +
> +	case PIN_CONFIG_POWER_SOURCE:
> +		arg = ma35_pinconf_get_power_source(npctl, pin);
> +		break;
> +
> +	default:
> +		return -EINVAL;
> +	}
> +	*config = pinconf_to_config_packed(param, arg);
> +
> +	return 0;
> +}

...

> +static int ma35_pinconf_set(struct pinctrl_dev *pctldev, unsigned int pin,
> +			    unsigned long *configs, unsigned int num_configs)
> +{
> +	struct ma35_pinctrl *npctl = pinctrl_dev_get_drvdata(pctldev);
> +	enum pin_config_param param;
> +	unsigned int arg = 0;
> +	int i, ret = 0;
> +
> +	for (i = 0; i < num_configs; i++) {
> +		param = pinconf_to_config_param(configs[i]);
> +		arg = pinconf_to_config_argument(configs[i]);
> +
> +		switch (param) {
> +		case PIN_CONFIG_BIAS_DISABLE:
> +		case PIN_CONFIG_BIAS_PULL_UP:
> +		case PIN_CONFIG_BIAS_PULL_DOWN:
> +			ret = ma35_pinconf_set_pull(npctl, pin, param);
> +			break;
> +
> +		case PIN_CONFIG_DRIVE_STRENGTH:
> +			ret = ma35_pinconf_set_drive_strength(npctl, pin, arg);
> +			break;
> +
> +		case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
> +			ret = ma35_pinconf_set_schmitt(npctl, pin, 1);
> +			break;
> +
> +		case PIN_CONFIG_INPUT_SCHMITT:
> +			ret = ma35_pinconf_set_schmitt(npctl, pin, arg);
> +			break;
> +
> +		case PIN_CONFIG_SLEW_RATE:
> +			ret = ma35_pinconf_set_slew_rate(npctl, pin, arg);
> +			break;
> +
> +		case PIN_CONFIG_OUTPUT_ENABLE:
> +			ret = ma35_pinconf_set_output(npctl, pin, arg);
> +			break;
> +
> +		case PIN_CONFIG_POWER_SOURCE:
> +			ret = ma35_pinconf_set_power_source(npctl, pin, arg);
> +			break;
> +
> +		default:
> +			return -EINVAL;
> +		}

No returning an error if we got ret != 0?!

> +	}
> +	return ret;
> +}

...

> +static int ma35_pinctrl_parse_groups(struct device_node *np, struct ma35_pin_group *grp,
> +				     struct ma35_pinctrl *npctl, u32 index)
> +{
> +	unsigned long *configs;
> +	unsigned int nconfigs;
> +	struct ma35_pin_setting *pin;

> +	const __be32 *list;

Huh?!

> +	int i, j, size, ret;
> +
> +	dev_dbg(npctl->dev, "group(%d): %s\n", index, np->name);
> +
> +	grp->name = np->name;
> +
> +	ret = pinconf_generic_parse_dt_config(np, NULL, &configs, &nconfigs);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * the binding format is nuvoton,pins = <bank pin-mfp pin-function>,
> +	 * do sanity check and calculate pins number
> +	 */

/*
 * Respect English grammar and puntuation
 * in all multi-line comments. See the difference
 * how it's done above and in this example.
 */

> +	list = of_get_property(np, "nuvoton,pins", &size);

Oh, no. 
Use respective of_property_ calls.

> +	size /= sizeof(*list);
> +	if (!size || size % 3) {
> +		dev_err(npctl->dev, "wrong setting!\n");
> +		return -EINVAL;
> +	}
> +	grp->npins = size / 3;
> +
> +	grp->pins = devm_kcalloc(npctl->dev, grp->npins, sizeof(*grp->pins), GFP_KERNEL);
> +	if (!grp->pins)
> +		return -ENOMEM;
> +
> +	grp->settings = devm_kcalloc(npctl->dev, grp->npins, sizeof(*grp->settings), GFP_KERNEL);
> +	if (!grp->settings)
> +		return -ENOMEM;
> +
> +	pin = grp->settings;
> +
> +	for (i = 0, j = 0; i < size; i += 3, j++) {
> +		pin->offset = be32_to_cpu(*list++) * MA35_MFP_REG_SZ_PER_BANK + MA35_MFP_REG_BASE;
> +		pin->shift = (be32_to_cpu(*list++) * MA35_MFP_BITS_PER_PORT) % 32;
> +		pin->muxval = be32_to_cpu(*list++);
> +		pin->configs = configs;
> +		pin->nconfigs = nconfigs;
> +		grp->pins[j] = npctl->info->get_pin_num(pin->offset, pin->shift);
> +		pin++;
> +	}
> +	return 0;
> +}

...

> +	for_each_child_of_node(np, child) {
> +		if (of_property_read_bool(child, "gpio-controller"))
> +			continue;

There is a macro already present, for_each_gpiochip_node().

> +		npctl->nfunctions++;
> +		npctl->ngroups += of_get_child_count(child);
> +	}

...

> +	for_each_child_of_node(np, child) {
> +		if (of_property_read_bool(child, "gpio-controller"))
> +			continue;

Ditto.

> +		ret = ma35_pinctrl_parse_functions(child, npctl, idx++);
> +		if (ret) {
> +			dev_err(&pdev->dev, "failed to parse function\n");
> +			of_node_put(child);
> +			return ret;
> +		}
> +	}

...

> +	if (!info || !info->pins || !info->npins) {
> +		dev_err(&pdev->dev, "wrong pinctrl info\n");
> +		return -EINVAL;

		return dev_err_probe(...);

> +	}

...

> +	ret = devm_pinctrl_register_and_init(&pdev->dev, ma35_pinctrl_desc,
> +					     npctl, &npctl->pctl);

Haveing

	struct device *dev = &pdev->dev;

makes in particular this one better

	ret = devm_pinctrl_register_and_init(dev, ma35_pinctrl_desc, npctl, &npctl->pctl);

> +	if (ret)
> +		return dev_err_probe(&pdev->dev, ret, "fail to register MA35 pinctrl\n");

...

> +int __maybe_unused ma35_pinctrl_suspend(struct device *dev)

No __maybe_unused.
Just use respective PM macros (pm_ptr(), DEFINE_,*PM_OPS, etc).

> +{
> +	struct ma35_pinctrl *npctl = dev_get_drvdata(dev);
> +
> +	return pinctrl_force_sleep(npctl->pctl);
> +}
> +
> +int __maybe_unused ma35_pinctrl_resume(struct device *dev)

Ditto.

> +{
> +	struct ma35_pinctrl *npctl = dev_get_drvdata(dev);
> +
> +	return pinctrl_force_default(npctl->pctl);
> +}

...

> +struct ma35_mux_desc {
> +	const char *name;
> +	u32 muxval;
> +};
> +
> +struct ma35_pin_data {
> +	u32 offset;
> +	u32 shift;
> +	struct ma35_mux_desc *muxes;
> +};

Don't pin control subsystem has already some data types suitable in this cases?

...

> +#define MA35_PIN(num, n, o, s, ...) {			\
> +	.number = num,					\
> +	.name = #n,					\

Don't we have macros for this?

> +	.drv_data = &(struct ma35_pin_data) {		\
> +		.offset = o,				\
> +		.shift = s,				\
> +		.muxes = (struct ma35_mux_desc[]) {	\
> +			 __VA_ARGS__, { } },		\
> +	},						\
> +}

...

> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/module.h>

Missing headers and stray ones. Please, get this into order by following IWYU
principle.

> +#include <linux/of.h>
> +#include <linux/of_device.h>

How are these being used?

> +#include <linux/pinctrl/pinctrl.h>

...

> +static const struct dev_pm_ops ma35d1_pinctrl_pm_ops = {
> +	SET_LATE_SYSTEM_SLEEP_PM_OPS(ma35_pinctrl_suspend, ma35_pinctrl_resume)
> +};

New PM macros, please.

...

> +static const struct of_device_id ma35d1_pinctrl_of_match[] = {
> +	{ .compatible = "nuvoton,ma35d1-pinctrl", },
> +	{ },

No comma in the terminator entry.

> +};

...

> +static struct platform_driver ma35d1_pinctrl_driver = {
> +	.probe = ma35d1_pinctrl_probe,
> +	.driver = {
> +		.name = "ma35d1-pinctrl",
> +		.pm = &ma35d1_pinctrl_pm_ops,

New PM macro here.

> +		.of_match_table = ma35d1_pinctrl_of_match,
> +	},
> +};

-- 
With Best Regards,
Andy Shevchenko



