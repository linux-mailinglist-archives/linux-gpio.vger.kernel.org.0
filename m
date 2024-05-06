Return-Path: <linux-gpio+bounces-6169-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F588BD613
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 22:16:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3052A1F23D82
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 20:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A7FD15B106;
	Mon,  6 May 2024 20:16:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E856C15AD95
	for <linux-gpio@vger.kernel.org>; Mon,  6 May 2024 20:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=62.142.5.84
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715026564; cv=none; b=plg3ZM0kGUMSw6E8Dxx6tdzB6g0et19HjmF8feDxOKe50Z5DOGLVwfw37m1I9xFTFBRr8duxyMf0WrY2/X0mQAO6H7NG4AH60+O1OyiD0QW8xdSGTlA1IMdpWyiZLSbA6VMBgwCbmMXaJwLFDgqRENELIrJejDtLPVDF7V2X1TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715026564; c=relaxed/simple;
	bh=7e7enVBOTBWT2FAM18zxpera1NSmBKeUCsEGflGgEmQ=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G2JqzmeoROnhxxahMmzxQMyu7Puj9cMLA/zn1xFTVS8ctoSeogEX75HOLY6dIuv2cUbE2e1PVYw+Bfn8j6lEz3Er9K2HGi249TaVU/VzTxyq0/GDLbK/0icJKsZJRg3zxrYEbdyo3L1CL1KKuCeMnMUM2GepWDUS0BWJngcZ8xA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=62.142.5.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
Received: from localhost (88-113-25-208.elisa-laajakaista.fi [88.113.25.208])
	by fgw22.mail.saunalahti.fi (Halon) with ESMTP
	id 7317e310-0be5-11ef-a9de-005056bdf889;
	Mon, 06 May 2024 23:15:59 +0300 (EEST)
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Mon, 6 May 2024 23:15:57 +0300
To: Alex Soo <yuklin.soo@starfivetech.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Drew Fustini <drew@beagleboard.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [RFC PATCH v3 2/7] pinctrl: starfive: jh8100: add main driver
 and sys_east domain sub-driver
Message-ID: <Zjk6fVwE_uUt3_G9@surfacebook.localdomain>
References: <20240503111436.113089-1-yuklin.soo@starfivetech.com>
 <20240503111436.113089-3-yuklin.soo@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240503111436.113089-3-yuklin.soo@starfivetech.com>

Fri, May 03, 2024 at 07:14:31PM +0800, Alex Soo kirjoitti:
> Add Starfive JH8100 SoC pinctrl main driver to provide the
> common APIs that are used by the sub-drivers of pinctrl
> domains:
> - sys_east,
> - sys_west,
> - sys_gmac,
> - aon (always-on)
> 
> to implement the following tasks:
> 
> - applies pin multiplexing, function selection, and pin
>   configuration for devices during system initialization
>   or change of pinctrl state due to power management.
> - read or set pin configuration from user space.
> 
> Also, add the sys_east domain sub-driver since it requires
> at least one domain sub-driver to run the probe function in
> the main driver to enable the basic pinctrl functionalities
> on the system.

...

> +config PINCTRL_STARFIVE_JH8100
> +	bool
> +	select GENERIC_PINCONF
> +	select GENERIC_PINCTRL_GROUPS
> +	select GENERIC_PINMUX_FUNCTIONS
> +	select GPIOLIB
> +	select GPIOLIB_IRQCHIP

> +	select OF_GPIO

Why?

...

> +/*
> + * Pinctrl / GPIO driver for StarFive JH8100 SoC sys east controller
> + *
> + * Copyright (C) 2023-2024 StarFive Technology Co., Ltd.
> + * Author: Alex Soo <yuklin.soo@starfivetech.com>

> + *

Unneeded blank line.

> + */

...

> +#include <linux/gpio/driver.h>
> +#include <linux/module.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>

This lacks some of inclusions.
E.g., array_size.h, mod_devicetable.h, io.h.

...

> +#ifdef CONFIG_PM_SLEEP

SHouldn't be in a new code. Use proper PM macros.

> +static int jh8100_sys_e_pinctrl_suspend(struct device *dev)
> +{
> +	struct jh8100_pinctrl *sfp;
> +	int i;
> +
> +	sfp = dev_get_drvdata(dev);

> +	if (!sfp)
> +		return -EINVAL;

When this check can be true?

> +	for (i = 0; i < sfp->info->nregs; i++)
> +		sfp->jh8100_sys_east_regs[i] = readl_relaxed(sfp->base + (i * 4));
> +
> +	return pinctrl_force_sleep(sfp->pctl);
> +}
> +
> +static int jh8100_sys_e_pinctrl_resume(struct device *dev)
> +{
> +	struct jh8100_pinctrl *sfp;
> +	int i;

> +	sfp = dev_get_drvdata(dev);
> +	if (!sfp)
> +		return -EINVAL;

Ditto.

> +	for (i = 0; i < sfp->info->nregs; i++)
> +		writel_relaxed(sfp->jh8100_sys_east_regs[i], sfp->base + (i * 4));

Too many parentheses.

> +	return pinctrl_force_default(sfp->pctl);
> +}
> +#endif

...

> +static SIMPLE_DEV_PM_OPS(jh8100_sys_e_pinctrl_dev_pm_ops,
> +			 jh8100_sys_e_pinctrl_suspend,
> +			 jh8100_sys_e_pinctrl_resume);

Don't use obsoleted macros, use new ones.

...

> +#ifdef CONFIG_PM_SLEEP
> +		.pm = &jh8100_sys_e_pinctrl_dev_pm_ops,
> +#endif

Ditto, no ugly ifdeffery.

> +		.of_match_table = jh8100_sys_e_pinctrl_of_match,
> +	},
> +};

...

> +/*
> + * Pinctrl / GPIO driver for StarFive JH8100 SoC
> + *
> + * Copyright (C) 2023-2024 StarFive Technology Co., Ltd.
> + * Author: Alex Soo <yuklin.soo@starfivetech.com>

> + *

Unneeded blank line.

> + */

...

+ array_size.h

> +#include <linux/bits.h>
> +#include <linux/clk.h>

+ container_of.h

> +#include <linux/gpio/consumer.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/io.h>
> +#include <linux/irq.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_irq.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_wakeirq.h>
> +#include <linux/reset.h>
> +#include <linux/seq_file.h>
> +#include <linux/spinlock.h>
> +#include <linux/string.h>

+ types.h

...

> +static unsigned int jh8100_pinmux_din(u32 v)
> +{
> +	return (v & GENMASK(31, 24)) >> 24;
> +}
> +
> +static u32 jh8100_pinmux_dout(u32 v)
> +{
> +	return (v & GENMASK(23, 16)) >> 16;
> +}
> +
> +static u32 jh8100_pinmux_doen(u32 v)
> +{
> +	return (v & GENMASK(15, 10)) >> 10;
> +}
> +
> +static u32 jh8100_pinmux_function(u32 v)
> +{
> +	return (v & GENMASK(9, 8)) >> 8;
> +}
> +
> +static unsigned int jh8100_pinmux_pin(u32 v)
> +{
> +	return v & GENMASK(7, 0);
> +}

These all are reinventions of bitfield.h.

...

> +static void jh8100_pin_dbg_show(struct pinctrl_dev *pctldev,
> +				struct seq_file *s, unsigned int pin)
> +{
> +	struct jh8100_pinctrl *sfp = pinctrl_dev_get_drvdata(pctldev);
> +	const struct jh8100_pinctrl_domain_info *info = sfp->info;
> +
> +	seq_printf(s, "%s", dev_name(pctldev->dev));

> +	if (pin < sfp->gc.ngpio) {

When this is not true?

If that case even possible, invert the conditional to reduce the indentation
level.

> +		unsigned int offset = 4 * (pin / 4);
> +		unsigned int shift  = 8 * (pin % 4);
> +		u32 dout = readl_relaxed(sfp->base + info->dout_reg_base + offset);
> +		u32 doen = readl_relaxed(sfp->base + info->doen_reg_base + offset);
> +		u32 gpi = readl_relaxed(sfp->base + info->gpi_reg_base + offset);
> +
> +		dout = (dout >> shift) & info->dout_mask;
> +		doen = (doen >> shift) & info->doen_mask;
> +		gpi = ((gpi >> shift) - 2) & info->gpi_mask;
> +
> +		seq_printf(s, " dout=%u doen=%u din=%u", dout, doen, gpi);
> +	}
> +}

...

> +	pgnames = devm_kcalloc(dev, ngroups, sizeof(*pgnames), GFP_KERNEL);
> +	if (!pgnames)
> +		return -ENOMEM;
> +
> +	map = kcalloc(nmaps, sizeof(*map), GFP_KERNEL);
> +	if (!map)
> +		return -ENOMEM;

Why one is managed and another is not? Shouldn't be both either managed or not?

...

> +	mutex_lock(&sfp->mutex);

Don't you want to use cleanup.h from day 1?

...

> +	for_each_child_of_node(np, child) {

Why not using _scoped() variant?

...

> +		int npins = of_property_count_u32_elems(child, "pinmux");

Why signed?
Please, decouple definition and assignment.

> +		int *pins;
> +		u32 *pinmux;
> +		int i;
> +
> +		if (npins < 1) {
> +			dev_err(dev,
> +				"invalid pinctrl group %pOFn.%pOFn: pinmux not set\n",
> +				np, child);
> +			ret = -EINVAL;

Can npins be negative? In such case why shadowing an error code?

> +			goto put_child;
> +		}

...

> +		ret = pinctrl_generic_add_group(pctldev, grpname,
> +						pins, npins, pinmux);

One line?

...

> +	for (i = 0; i < group->grp.npins; i++) {
> +		u32 v = pinmux[i];
> +
> +		jh8100_set_one_pin_mux(sfp,
> +				       jh8100_pinmux_pin(v),
> +				       jh8100_pinmux_din(v),
> +				       jh8100_pinmux_dout(v),
> +				       jh8100_pinmux_doen(v),
> +				       jh8100_pinmux_function(v));
> +		}

Indentation?

...

> +static u32 jh8100_padcfg_ds_to_mA(u32 padcfg)
> +{
> +	return jh8100_drive_strength_mA[(padcfg >> 1) & 3U];

GENMASK() ?

> +}
> +
> +static u32 jh8100_padcfg_ds_to_uA(u32 padcfg)
> +{
> +	return jh8100_drive_strength_mA[(padcfg >> 1) & 3U] * 1000;

Ditto.

> +}

...

> +static u32 jh8100_padcfg_ds_from_mA(u32 v)
> +{
> +	int i;

Why signed?

> +	for (i = 0; i < ARRAY_SIZE(jh8100_drive_strength_mA); i++) {
> +		if (v <= jh8100_drive_strength_mA[i])
> +			break;
> +	}
> +	return i << 1;
> +}

...

> +static int jh8100_gpio_get_direction(struct gpio_chip *gc,
> +				     unsigned int gpio)

One line?

> +{
> +	struct jh8100_pinctrl *sfp = container_of(gc,
> +			struct jh8100_pinctrl, gc);
> +	const struct jh8100_pinctrl_domain_info *info = sfp->info;
> +	unsigned int offset = 4 * (gpio / 4);
> +	unsigned int shift  = 8 * (gpio % 4);
> +	u32 doen = readl_relaxed(sfp->base + info->doen_reg_base + offset);

> +	doen = (doen >> shift) & info->doen_mask;
> +
> +	return doen == 0 ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;

	if ((doen >> shift) & info->doen_mask)
		return GPIO_LINE_DIRECTION_IN;

	return GPIO_LINE_DIRECTION_OUT;

> +}

...

> +static int jh8100_gpio_direction_input(struct gpio_chip *gc,
> +				       unsigned int gpio)
> +{
> +	struct jh8100_pinctrl *sfp = container_of(gc,
> +			struct jh8100_pinctrl, gc);

Broken indentation, just put on one line.

> +	/* enable input and schmitt trigger */
> +	jh8100_padcfg_rmw(sfp, gpio,
> +			  JH8100_PADCFG_IE | JH8100_PADCFG_SMT,
> +			  JH8100_PADCFG_IE | JH8100_PADCFG_SMT);
> +
> +	jh8100_set_one_pin_mux(sfp, gpio, 255, 0, 1, 0);
> +
> +	return 0;
> +}

...

> +static int jh8100_gpio_direction_output(struct gpio_chip *gc,
> +					unsigned int gpio, int value)
> +{
> +	struct jh8100_pinctrl *sfp = container_of(gc,
> +			struct jh8100_pinctrl, gc);

> +	jh8100_set_one_pin_mux(sfp, gpio,
> +			       255, value ? 1 : 0,
> +			       0, 0);

Use room on the previous lines.


> +	/* disable input, schmitt trigger and bias */
> +	jh8100_padcfg_rmw(sfp, gpio,
> +			  JH8100_PADCFG_IE | JH8100_PADCFG_SMT,
> +			  0);
> +	return 0;
> +}

...

> +{
> +	struct jh8100_pinctrl *sfp = container_of(gc,
> +			struct jh8100_pinctrl, gc);

One line. You may create a helper to_jh8100_pinctrl() and use everywhere,

> +	const struct jh8100_pinctrl_domain_info *info = sfp->info;
> +	void __iomem *reg = sfp->base + info->gpioin_reg_base
> +			+ 4 * (gpio / 32);

Split definition and assignment. It will increase readability.

> +	return !!(readl_relaxed(reg) & BIT(gpio % 32));
> +}

...

> +static void jh8100_gpio_set(struct gpio_chip *gc,
> +			    unsigned int gpio, int value)
> +{
> +	struct jh8100_pinctrl *sfp = container_of(gc,
> +			struct jh8100_pinctrl, gc);
> +	const struct jh8100_pinctrl_domain_info *info = sfp->info;
> +	unsigned int offset = 4 * (gpio / 4);
> +	unsigned int shift  = 8 * (gpio % 4);
> +	void __iomem *reg_dout = sfp->base + info->dout_reg_base + offset;
> +	u32 dout = (value ? 1 : 0) << shift;

	u32 dout = value ? BIT(shift) : 0;

> +	u32 mask = info->dout_mask << shift;
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&sfp->lock, flags);
> +	dout |= readl_relaxed(reg_dout) & ~mask;
> +	writel_relaxed(dout, reg_dout);
> +	raw_spin_unlock_irqrestore(&sfp->lock, flags);
> +}

...

> +static void jh8100_irq_mask(struct irq_data *d)
> +{
> +	struct jh8100_pinctrl *sfp = jh8100_from_irq_data(d);
> +	const struct jh8100_gpio_irq_reg *irq_reg = sfp->info->irq_reg;
> +	irq_hw_number_t gpio = irqd_to_hwirq(d);
> +	void __iomem *ie = sfp->base + irq_reg->ie_reg_base
> +		+ 4 * (gpio / 32);
> +	u32 mask = BIT(gpio % 32);
> +	unsigned long flags;
> +	u32 value;
> +
> +	raw_spin_lock_irqsave(&sfp->lock, flags);
> +	value = readl_relaxed(ie) & ~mask;
> +	writel_relaxed(value, ie);
> +	raw_spin_unlock_irqrestore(&sfp->lock, flags);
> +
> +	gpiochip_disable_irq(&sfp->gc, d->hwirq);

You have gpio, why not use it here?

> +}

...

> +static void jh8100_irq_unmask(struct irq_data *d)
> +{
> +	struct jh8100_pinctrl *sfp = jh8100_from_irq_data(d);
> +	const struct jh8100_gpio_irq_reg *irq_reg = sfp->info->irq_reg;
> +	irq_hw_number_t gpio = irqd_to_hwirq(d);
> +	void __iomem *ie = sfp->base + irq_reg->ie_reg_base
> +		+ 4 * (gpio / 32);
> +	u32 mask = BIT(gpio % 32);
> +	unsigned long flags;
> +	u32 value;
> +
> +	gpiochip_enable_irq(&sfp->gc, d->hwirq);

Ditto.

> +	raw_spin_lock_irqsave(&sfp->lock, flags);
> +	value = readl_relaxed(ie) | mask;
> +	writel_relaxed(value, ie);
> +	raw_spin_unlock_irqrestore(&sfp->lock, flags);
> +}

...

> +static int jh8100_irq_set_wake(struct irq_data *d, unsigned int enable)
> +{
> +	struct jh8100_pinctrl *sfp = jh8100_from_irq_data(d);
> +	int ret = 0;
> +
> +	if (enable)
> +		ret = enable_irq_wake(sfp->wakeup_irq);
> +	else
> +		ret = disable_irq_wake(sfp->wakeup_irq);
> +	if (ret)
> +		dev_err(sfp->dev, "failed to %s wake-up interrupt\n",
> +			enable ? "enable" : "disable");

str_enable_disable() (will require string_choices.h).

> +	return ret;
> +}

...

> +static void jh8100_irq_print_chip(struct irq_data *d, struct seq_file *p)
> +{
> +	struct jh8100_pinctrl *sfp = jh8100_from_irq_data(d);
> +
> +	seq_printf(p, sfp->gc.label);

This is bad. Use seq_puts() or proper formatting string.

> +}

...

> +	writel_relaxed(~0U, sfp->base + sfp->info->irq_reg->ic_reg_base);

GENMASK() ?

...

> +		writel_relaxed(~0U, sfp->base + sfp->info->irq_reg->ic1_reg_base);

Ditto.

...

> +	info = of_device_get_match_data(&pdev->dev);
> +	if (!info)
> +		return -ENODEV;

Use device_get_match_data() from property.h.

...

> +	clk = devm_clk_get_optional(dev, NULL);
> +	if (IS_ERR(clk))
> +		return dev_err_probe(dev, PTR_ERR(clk), "could not get clock\n");

Why not _enabled() variant?

...

> +	/*
> +	 * we don't want to assert reset and risk undoing pin muxing for the

We

> +	 * early boot serial console, but let's make sure the reset line is
> +	 * deasserted in case someone runs a really minimal bootloader.
> +	 */

...

> +	ret = devm_pinctrl_register_and_init(dev,
> +					     jh8100_pinctrl_desc,
> +					     sfp, &sfp->pctl);

Can occupy less lines.

> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "could not register pinctrl driver\n");

...

> +	if (sfp->gc.ngpio > 0) {

Is it really can be not true?

> +		ret = devm_gpiochip_add_data(dev, &sfp->gc, sfp);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "could not register gpiochip\n");
> +
> +		dev_info(dev, "StarFive JH8100 GPIO chip registered %d GPIOs\n", sfp->gc.ngpio);
> +	}

...

> +/*
> + * Pinctrl / GPIO driver for StarFive JH8100 SoC
> + *
> + * Copyright (C) 2023-2024 StarFive Technology Co., Ltd.
> + * Author: Alex Soo <yuklin.soo@starfivetech.com>

> + *

Unneeded blank line.

> + */
> +
> +#ifndef __PINCTRL_STARFIVE_JH8100_H__
> +#define __PINCTRL_STARFIVE_JH8100_H__

A lot of inclusions are missed, like

types.h

> +#include "../core.h"


Some of the forward declarations are missed, like

struct device;

> +#endif /* __PINCTRL_STARFIVE_JH8100_H__ */

-- 
With Best Regards,
Andy Shevchenko



