Return-Path: <linux-gpio+bounces-16428-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EC8A40C9E
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 04:09:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62C5417BC13
	for <lists+linux-gpio@lfdr.de>; Sun, 23 Feb 2025 03:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF22C3594C;
	Sun, 23 Feb 2025 03:09:31 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5EB928F4;
	Sun, 23 Feb 2025 03:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740280171; cv=none; b=RVPb5OSWG9zuucJ8s8xJ37S8CZ1zu7rPJPNlGVtYBzzNM9k3kAeLgAkr0ikq22rviGbxjUya9wtP7s3hZp9dpLNsdO4B5WNhKX70z5mHJY251c/RshSLqrb3FIdHIIw/5q2vOR0d3mKiNgZIN5zXBjUPL7qpEZi5b+XlvFsyozk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740280171; c=relaxed/simple;
	bh=FaCIUZ+zIC7FWegxjAWM73imTbhyiSB3/WkIHbXrads=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qWEnjv9aKZRCTP4yHl4WJmIgyw6iW8sOLpycQFm4+RP6xYppFM470hpETn2wZEUzDwTXCHQ8RLmHQoXN1LMomxW0EIbakpMlEGu/y93Wq7LYPHQ1KZgfldqX90vAWDzhbhWyNCWl7kMRuLvJEfACx+nnWpYl3Xobjdm5mZJU/Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [180.172.118.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 828D2343208;
	Sun, 23 Feb 2025 03:09:28 +0000 (UTC)
Date: Sun, 23 Feb 2025 03:09:17 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@ieee.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Yangyu Chen <cyy@cyyself.name>,
	Jisheng Zhang <jszhang@kernel.org>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v5 3/5] gpio: spacemit: add support for K1 SoC
Message-ID: <20250223030917-GYA33864@gentoo>
References: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org>
 <20250217-03-k1-gpio-v5-3-2863ec3e7b67@gentoo.org>
 <8dd08731-8f50-4599-8d18-873b7f594dee@ieee.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8dd08731-8f50-4599-8d18-873b7f594dee@ieee.org>

Hi Alex:

thanks for the review

On 11:27 Fri 21 Feb     , Alex Elder wrote:
> On 2/17/25 6:57 AM, Yixun Lan wrote:
> > Implement GPIO functionality which capable of setting pin as
> > input, output. Also, each pin can be used as interrupt which
> > support rising, failing, or both edge type trigger.
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> 
> This looks nicer!
> 
> I have some more comments, but they're pretty minor.
> 
> > ---
> >   drivers/gpio/Kconfig            |   8 +
> >   drivers/gpio/Makefile           |   1 +
> >   drivers/gpio/gpio-spacemit-k1.c | 376 ++++++++++++++++++++++++++++++++++++++++
> >   3 files changed, 385 insertions(+)
> > 
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index add5ad29a673c09082a913cb2404073b2034af48..eaae729eec00a3d6d2b83769aed3e2b0ca9927e5 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -655,6 +655,14 @@ config GPIO_SNPS_CREG
> >   	  where only several fields in register belong to GPIO lines and
> >   	  each GPIO line owns a field with different length and on/off value.
> >   
> > +config GPIO_SPACEMIT_K1
> > +	bool "SPACEMIT K1 GPIO support"
> > +	depends on ARCH_SPACEMIT || COMPILE_TEST
> > +	depends on OF_GPIO
> > +	select GPIOLIB_IRQCHIP
> > +	help
> > +	  Say yes here to support the SpacemiT's K1 GPIO device.
> > +
> >   config GPIO_SPEAR_SPICS
> >   	bool "ST SPEAr13xx SPI Chip Select as GPIO support"
> >   	depends on PLAT_SPEAR
> > diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> > index af3ba4d81b583842893ea69e677fbe2abf31bc7b..6709ce511a0cf10310a94521c85a2d382dcfa696 100644
> > --- a/drivers/gpio/Makefile
> > +++ b/drivers/gpio/Makefile
> > @@ -156,6 +156,7 @@ obj-$(CONFIG_GPIO_SIOX)			+= gpio-siox.o
> >   obj-$(CONFIG_GPIO_SL28CPLD)		+= gpio-sl28cpld.o
> >   obj-$(CONFIG_GPIO_SLOPPY_LOGIC_ANALYZER) += gpio-sloppy-logic-analyzer.o
> >   obj-$(CONFIG_GPIO_SODAVILLE)		+= gpio-sodaville.o
> > +obj-$(CONFIG_GPIO_SPACEMIT_K1)		+= gpio-spacemit-k1.o
> >   obj-$(CONFIG_GPIO_SPEAR_SPICS)		+= gpio-spear-spics.o
> >   obj-$(CONFIG_GPIO_SPRD)			+= gpio-sprd.o
> >   obj-$(CONFIG_GPIO_STMPE)		+= gpio-stmpe.o
> > diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit-k1.c
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..f72511b5ab8f8f0b1d1c9e89d2f9ca07b623a866
> > --- /dev/null
> > +++ b/drivers/gpio/gpio-spacemit-k1.c
> > @@ -0,0 +1,376 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > +/*
> > + * Copyright (C) 2023-2025 SpacemiT (Hangzhou) Technology Co. Ltd
> > + * Copyright (C) 2025 Yixun Lan <dlan@gentoo.org>
> > + */
> > +
> > +#include <linux/io.h>
> > +#include <linux/init.h>
> > +#include <linux/irq.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/pinctrl/pinctrl.h>
> > +#include <linux/property.h>
> > +#include <linux/seq_file.h>
> > +#include <linux/module.h>
> > +
> > +#include "gpiolib.h"
> > +
> > +/* register offset */
> 
> The comments are great, but I think I'd like to see them be abbreviated
> further and added to the right of the definitions, if you can do that.
> 
> I think you can drop "GPIO" and "register" in each one of them, and
> that might get you close to an 80 column limit.  See what you can do.
> 
sure, I can do this
> > +/* GPIO port level register */
> 
> I think the port level register is read-only, and you didn't include
> that annotation.
> 
right, I will add that annotation
> > +#define GPLR		0x00
> > +/* GPIO port direction register - R/W */
> > +#define GPDR		0x0c
> > +/* GPIO port set register - W */
> > +#define GPSR		0x18
> > +/* GPIO port clear register - W */
> > +#define GPCR		0x24
> > +/* GPIO port rising edge register R/W */
> > +#define GRER		0x30
> > +/* GPIO port falling edge register R/W */
> > +#define GFER		0x3c
> > +/* GPIO edge detect status register - R/W1C */
> > +#define GEDR		0x48
> > +/*  GPIO (set) direction register - W */
> 
> Delete the extra space above.
> 
will do
> > +#define GSDR		0x54
> > +/* GPIO (clear) direction register - W */
> > +#define GCDR		0x60
> > +/* GPIO (set) rising edge detect enable register - W */
> > +#define GSRER		0x6c
> > +/* GPIO (clear) rising edge detect enable register - W */
> > +#define GCRER		0x78
> > +/* GPIO (set) falling edge detect enable register - W */
> > +#define GSFER		0x84
> > +/* GPIO (clear) falling edge detect enable register - W */
> > +#define GCFER		0x90
> > +/* GPIO interrupt mask register, 0 disable, 1 enable - R/W */
> > +#define GAPMASK		0x9c
> > +
> > +#define NR_BANKS		4
> > +#define NR_GPIOS_PER_BANK	32
> > +
> > +#define to_spacemit_gpio_bank(x) container_of((x), struct spacemit_gpio_bank, gc)
> > +
> > +struct spacemit_gpio;
> > +
> > +struct spacemit_gpio_bank {
> > +	struct gpio_chip		gc;
> > +	struct spacemit_gpio		*sg;
> > +	void __iomem			*base;
> > +	u32				index;
> 
> You almost never use the index field.  It could easily be
> computed rather than stored:
> 
> static u32 spacemit_gpio_bank_index(struct spacemit_gpio_bank *gb)
> {
> 	return (u32)(gb - gb->sg->sgb);
> }
> 
ok
> > +	u32				irq_mask;
> > +	u32				irq_rising_edge;
> > +	u32				irq_falling_edge;
> > +};
> > +
> > +struct spacemit_gpio {
> > +	struct	device			*dev;
> > +	struct	spacemit_gpio_bank	sgb[NR_BANKS];
> > +};
> > +
> > +static irqreturn_t spacemit_gpio_irq_handler(int irq, void *dev_id)
> > +{
> > +	struct spacemit_gpio_bank *gb = dev_id;
> > +	unsigned long pending;
> > +	u32 n, gedr;
> > +
> > +	gedr = readl(gb->base + GEDR);
> > +	if (!gedr)
> > +		return IRQ_NONE;
> > +	writel(gedr, gb->base + GEDR);
> > +
> > +	gedr = gedr & gb->irq_mask;
> > +	if (!gedr)
> > +		return IRQ_NONE;
> > +
> > +	pending = gedr;
> 
> Instead, do:
> 
> 	pending = gedr & gb->irq_mask;
> 	if (!pending)
> 		return IRQ_NONE;
> 
good suggestion
> > +	for_each_set_bit(n, &pending, BITS_PER_LONG)
> > +		handle_nested_irq(irq_find_mapping(gb->gc.irq.domain, n));
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> > +static void spacemit_gpio_irq_ack(struct irq_data *d)
> > +{
> > +	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(d);
> > +
> > +	writel(BIT(irqd_to_hwirq(d)), gb->base + GEDR);
> > +}
> > +
> > +static void spacemit_gpio_irq_mask(struct irq_data *d)
> > +{
> > +	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(d);
> > +	u32 bit = BIT(irqd_to_hwirq(d));
> > +
> > +	gb->irq_mask &= ~bit;
> 
> This is a minor suggestion, and I'm not sure how much difference
> it makes.  But here (and one or two more times below) you could
> avoid the writel() calls if you know the particular IRQ was
> already disabled.  (Maybe that won't ever happen?)
> 
pratically, this should be called once irq unmasked (in pair),
besides, it won't worth to do the optimization as not called frequently

> 	if (!(gb->irq_mask & bit))
> 		return;
> 
> 	gb->irq_mask &= !bit;
> 	...
> 
> This should work because in spacemit_gpio_add_bank() you reset
> all the IRQ state and disable all IRQs, so the cached copy of
> the irq_mask and the rising and falling edge masks should match
> reality.
> 
> > +
> > +	if (bit & gb->irq_rising_edge)
> > +		writel(bit, gb->base + GCRER);
> > +
> > +	if (bit & gb->irq_falling_edge)
> > +		writel(bit, gb->base + GCFER);
> > +}
> > +
> > +static void spacemit_gpio_irq_unmask(struct irq_data *d)
> > +{
> > +	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(d);
> > +	u32 bit = BIT(irqd_to_hwirq(d));
> > +
> 
> 
> Same thought here.
> 
> 	if (gb->irq_mask & bit)
> 		return;
> 
> > +	gb->irq_mask |= bit;
> > +
> > +	if (bit & gb->irq_rising_edge)
> > +		writel(bit,  gb->base + GSRER);
> > +
> > +	if (bit & gb->irq_falling_edge)
> > +		writel(bit, gb->base + GSFER);
> > +}
> > +
> > +static int spacemit_gpio_irq_set_type(struct irq_data *d, unsigned int type)
> > +{
> > +	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(d);
> > +	u32 bit = BIT(irqd_to_hwirq(d));
> > +
> 
> Same thought in this function, although it gets a little
> messier looking.
> 
> > +	if (type & IRQ_TYPE_EDGE_RISING) {
> > +		gb->irq_rising_edge |= bit;
> > +		writel(bit, gb->base + GSRER);
> > +	} else {
> > +		gb->irq_rising_edge &= ~bit;
> > +		writel(bit, gb->base + GCRER);
> > +	}
> 
> Otherwise:
> 
>      if (type & IRQ_TYPE_EDGE_RISING)
> 	gb->irq_rising_edge |= bit;
>      else
> 	gb->irq_rising_edge &= ~bit;
>      writel(bit, gb->base + GSRER);
> 
no, it's two different registers: GSRER vs GCRER
> and again below.
> 
> > +
> > +	if (type & IRQ_TYPE_EDGE_FALLING) {
> > +		gb->irq_falling_edge |= bit;
> > +		writel(bit, gb->base + GSFER);
> > +	} else {
> > +		gb->irq_falling_edge &= ~bit;
> > +		writel(bit, gb->base + GCFER);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> 
> You added this function in version 5 of the series.  Please call
> attention to additions (or removals) like this in your cover page,
> and/or in notes at the top of this patch.
> 
ok
> > +static void spacemit_gpio_irq_print_chip(struct irq_data *data, struct seq_file *p)
> > +{
> > +	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(data);
> > +
> > +	seq_printf(p, "%s-%d", dev_name(gb->gc.parent), gb->index);
> 
> Does this look like "gpiochip2-15" or something?  I wasn't able
> to find it in the debugfs file system.
> 
it shows in /proc/interrupts once irq registered..
something will look like this - d4019000.gpio-$index

> > +}
> > +
> > +static struct irq_chip spacemit_gpio_chip = {
> > +	.name		= "k1-gpio-irqchip",
> > +	.irq_ack	= spacemit_gpio_irq_ack,
> > +	.irq_mask	= spacemit_gpio_irq_mask,
> > +	.irq_unmask	= spacemit_gpio_irq_unmask,
> > +	.irq_set_type	= spacemit_gpio_irq_set_type,
> > +	.irq_print_chip	= spacemit_gpio_irq_print_chip,
> > +	.flags		= IRQCHIP_IMMUTABLE,
> 
> Last time your flags value was IRQCHIP_SET_WAKE.  Why the change?
> 
I was about to check this..

the gpio controller doesn't support irq wake up,
I will add this flag in next version

> > +	GPIOCHIP_IRQ_RESOURCE_HELPERS,
> > +};
> > +
> 
> Maybe you could add a comment indicating that gpiospec->args[]
> will contain:
> 0:  bank index
> 1:  GPIO offset within the bank
> 2:  flags
> 
> (And the GPIO chip instance number as Linus suggested.)
> 
please ignore, I will drop this function as LinusW promote this
to gpio core
> > +static int spacemit_gpio_xlate(struct gpio_chip *gc,
> > +			       const struct of_phandle_args *gpiospec, u32 *flags)
> > +{
> > +	struct spacemit_gpio_bank *gb = gpiochip_get_data(gc);
> > +	struct spacemit_gpio *sg = gb->sg;
> > +
> 
> Get rid of the above blank line.
> 
> > +	int i;
> > +
> 
> I'm not sure the context in which this runs.  Can it be given
> arbitrary content from a DTB?  Mainly I'm interested to know
> whether any of these checks can be eliminated.  If it's called
> while parsing a DTB I can see why you'd need to verify all
> input values for validity.
> 
> > +	if (gc->of_gpio_n_cells != 3)
> > +		return -EINVAL;
> > +
> > +	if (gpiospec->args_count < gc->of_gpio_n_cells)
> > +		return -EINVAL;
> > +
> > +	i = gpiospec->args[0];
> > +	if (i >= NR_BANKS)
> > +		return -EINVAL;
> > +
> > +	if (gc != &sg->sgb[i].gc)
> > +		return -EINVAL;
> > +
> > +	if (gpiospec->args[1] >= gc->ngpio)
> > +		return -EINVAL;
> > +
> > +	if (flags)
> > +		*flags = gpiospec->args[2];
> > +
> > +	return gpiospec->args[1];
> > +}
> > +
> > +static int spacemit_add_pin_range(struct gpio_chip *gc)
> > +{
> > +	struct spacemit_gpio_bank *gb;
> > +	struct of_phandle_args pinspec;
> > +	struct pinctrl_dev *pctldev;
> > +	struct device_node *np;
> > +	int ret, trim;
> > +
> > +	np = dev_of_node(&gc->gpiodev->dev);
> > +	if (!np)
> > +		return 0;
> > +
> > +	gb = to_spacemit_gpio_bank(gc);
> > +
> > +	ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
> > +					       gb->index, &pinspec);
> > +	if (ret)
> > +		return ret;
> > +
> > +	pctldev = of_pinctrl_get(pinspec.np);
> > +	of_node_put(pinspec.np);
> > +	if (!pctldev)
> > +		return -EPROBE_DEFER;
> > +
> > +	/* Ignore ranges outside of this GPIO chip */
> > +	if (pinspec.args[0] >= (gc->offset + gc->ngpio))
> > +		return -EINVAL;
> > +
> > +	if (pinspec.args[0] + pinspec.args[2] <= gc->offset)
> > +		return -EINVAL;
> > +
> 
> I would do the following test earlier.
> 
ditto, ignore this, as move to gpio core
> > +	if (!pinspec.args[2])
> > +		return -EINVAL;
> > +
> > +	/* Trim the range to fit this GPIO chip */
> > +	if (gc->offset > pinspec.args[0]) {
> > +		trim = gc->offset - pinspec.args[0];
> > +		pinspec.args[2] -= trim;
> > +		pinspec.args[1] += trim;
> > +		pinspec.args[0] = 0;
> > +	} else {
> > +		pinspec.args[0] -= gc->offset;
> > +	}
> > +	if ((pinspec.args[0] + pinspec.args[2]) > gc->ngpio)
> > +		pinspec.args[2] = gc->ngpio - pinspec.args[0];
> > +
> > +	ret = gpiochip_add_pin_range(gc,
> > +				     pinctrl_dev_get_devname(pctldev),
> > +				     pinspec.args[0],
> > +				     pinspec.args[1],
> > +				     pinspec.args[2]);
> > +	if (ret)
> > +		return ret;
> > +
> > +	return 0;
> 
> Just do this:
> 
>      return  gpiochip_add_pin_range(gc, pinctrl_dev_get_devname(pctldev),
> 				   pinspec.args[0], pinspec.args[2]);
> 
> > +}
> > +
> > +static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
> > +				  void __iomem *regs,
> > +				  int index, int irq)
> > +{
> > +	struct spacemit_gpio_bank *gb = &sg->sgb[index];
> > +	struct gpio_chip *gc = &gb->gc;
> > +	struct device *dev = sg->dev;
> > +	struct gpio_irq_chip *girq;
> > +	void __iomem *dat, *set, *clr, *dirin, *dirout;
> > +	int ret, bank_base[] = { 0x0, 0x4, 0x8, 0x100 };
> > +
> > +	gb->index = index;
> > +	gb->base = regs + bank_base[index];
> > +
> > +	dat	= gb->base + GPLR;
> > +	set	= gb->base + GPSR;
> > +	clr	= gb->base + GPCR;
> > +	dirin	= gb->base + GCDR;
> > +	dirout	= gb->base + GSDR;
> > +
> > +	/* This registers 32 GPIO lines per bank */
> > +	ret = bgpio_init(gc, dev, 4, dat, set, clr, dirout, dirin,
> > +			 BGPIOF_UNREADABLE_REG_SET | BGPIOF_UNREADABLE_REG_DIR);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to init gpio chip\n");
> > +
> > +	gb->sg = sg;
> > +
> > +	gc->label		= dev_name(dev);
> > +	gc->request		= gpiochip_generic_request;
> > +	gc->free		= gpiochip_generic_free;
> > +	gc->ngpio		= NR_GPIOS_PER_BANK;
> > +	gc->base		= -1;
> > +
> > +#ifdef CONFIG_OF_GPIO
> 
> Why are these lines conditionally defined?  Is it intended
> to allow CONFIG_COMPILE_TEST to work?  Your Kconfig states
> that this *depends on* OF_GPIO, so this is probably not
> needed.
> 
> You don't define spacemit_gpio_xlate() earlier conditionally.
> Nor spacemit_add_pin_range().
> 
make sense, I will drop this #ifdef
> > +	gc->of_xlate		= spacemit_gpio_xlate;
> > +	gc->of_add_pin_range	= spacemit_add_pin_range;
> > +	gc->of_gpio_n_cells	= 3;
> > +#endif
> > +
> > +	girq			= &gc->irq;
> > +	girq->threaded		= true;
> > +	girq->handler		= handle_simple_irq;
> > +
> > +	gpio_irq_chip_set_chip(girq, &spacemit_gpio_chip);
> > +
> > +	/* Clear Edge Detection Settings */
> > +	writel(0x0, gb->base + GRER);
> > +	writel(0x0, gb->base + GFER);
> > +	/* Clear and Disable Interrupt */
> > +	writel(0xffffffff, gb->base + GCFER);
> > +	writel(0xffffffff, gb->base + GCRER);
> 
> It seems that GAPMASK is an overall interrupt mask register.
> I assume that means that by writing 0 here, no interrupts
> of any kind will be generated for any of the 32 GPIO ports.
> 
yes

> If that's true, I would write this first, *then* disable
> the rising and falling edge detection interrupts, *then*
> clear any pending interrupts.
> 
ok, I will take your suggestion, this is more strict

> Are there any interrupt types other than rising and falling
> edge?  Does this just provide an atomic way to disable both
only two types, rising, falling, and both can be enabled simultaneously
(there is no level trigger interrupt)

> types at once?  If there are no other interrupt types maybe
> this could be used rather than disabling both types
> separately using GCFER etc. in spacemit_gpio_irq_*mask().
> 
you are right, I think we can do this

> 					-Alex
> 
> > +	writel(0, gb->base + GAPMASK);
> > +
> > +	ret = devm_request_threaded_irq(dev, irq, NULL,
> > +					spacemit_gpio_irq_handler,
> > +					IRQF_ONESHOT | IRQF_SHARED,
> > +					gb->gc.label, gb);
> > +	if (ret < 0)
> > +		return dev_err_probe(dev, ret, "failed to register IRQ\n");
> > +
> > +	ret = devm_gpiochip_add_data(dev, gc, gb);
> > +	if (ret < 0)
> > +		return dev_err_probe(dev, ret, "failed to add gpio chip\n");
> > +
> > +	/* Eable Interrupt */
> > +	writel(0xffffffff, gb->base + GAPMASK);
> > +
> > +	return 0;
> > +}
> > +
> > +static int spacemit_gpio_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct spacemit_gpio *sg;
> > +	struct resource *res;
> > +	void __iomem *regs;
> > +	int i, irq, ret;
> > +
> > +	sg = devm_kzalloc(dev, sizeof(*sg), GFP_KERNEL);
> > +	if (!sg)
> > +		return -ENOMEM;
> > +
> > +	regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> > +	if (IS_ERR(regs))
> > +		return PTR_ERR(regs);
> > +
> > +	irq = platform_get_irq(pdev, 0);
> > +	if (irq < 0)
> > +		return irq;
> > +
> > +	sg->dev	= dev;
> > +
> > +	for (i = 0; i < NR_BANKS; i++) {
> > +		ret = spacemit_gpio_add_bank(sg, regs, i, irq);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id spacemit_gpio_dt_ids[] = {
> > +	{ .compatible = "spacemit,k1-gpio" },
> > +	{ /* sentinel */ }
> > +};
> > +
> > +static struct platform_driver spacemit_gpio_driver = {
> > +	.probe		= spacemit_gpio_probe,
> > +	.driver		= {
> > +		.name	= "k1-gpio",
> > +		.of_match_table = spacemit_gpio_dt_ids,
> > +	},
> > +};
> > +module_platform_driver(spacemit_gpio_driver);
> > +
> > +MODULE_AUTHOR("Yixun Lan <dlan@gentoo.org>");
> > +MODULE_DESCRIPTION("GPIO driver for SpacemiT K1 SoC");
> > +MODULE_LICENSE("GPL");
> > 
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

