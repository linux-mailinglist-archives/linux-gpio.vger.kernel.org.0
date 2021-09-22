Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B7B76414A2F
	for <lists+linux-gpio@lfdr.de>; Wed, 22 Sep 2021 15:09:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230309AbhIVNLS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 22 Sep 2021 09:11:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:41136 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230246AbhIVNLS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 22 Sep 2021 09:11:18 -0400
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org [51.254.78.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id D30326103C;
        Wed, 22 Sep 2021 13:09:47 +0000 (UTC)
Received: from sofa.misterjones.org ([185.219.108.64] helo=why.misterjones.org)
        by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <maz@kernel.org>)
        id 1mT20P-00CKXt-Ht; Wed, 22 Sep 2021 14:09:45 +0100
Date:   Wed, 22 Sep 2021 14:09:44 +0100
Message-ID: <87bl4kvjs7.wl-maz@kernel.org>
From:   Marc Zyngier <maz@kernel.org>
To:     Joey Gouly <joey.gouly@arm.com>
Cc:     <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Hector Martin <marcan@marcan.st>,
        Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
        Sven Peter <sven@svenpeter.dev>, <nd@arm.com>,
        Stan Skowronek <stan@corellium.com>
Subject: Re: [PATCH v1 1/1] pinctrl: add pinctrl/GPIO driver for Apple SoCs
In-Reply-To: <20210921222956.40719-2-joey.gouly@arm.com>
References: <20210921222956.40719-1-joey.gouly@arm.com>
        <20210921222956.40719-2-joey.gouly@arm.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/27.1
 (x86_64-pc-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: joey.gouly@arm.com, linux-gpio@vger.kernel.org, linus.walleij@linaro.org, marcan@marcan.st, alyssa.rosenzweig@collabora.com, sven@svenpeter.dev, nd@arm.com, stan@corellium.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Joey,

On Tue, 21 Sep 2021 23:29:56 +0100,
Joey Gouly <joey.gouly@arm.com> wrote:
> 
> From: Stan Skowronek <stan@corellium.com>
> 
> This driver adds support for the pinctrl / GPIO hardware found
> on some Apple SoCs.
> 
> Co-authored-by: Joey Gouly <joey.gouly@arm.com>
> Signed-off-by: Stan Skowronek <stan@corellium.com>
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> ---
>  MAINTAINERS                          |   1 +
>  drivers/pinctrl/Kconfig              |  13 +
>  drivers/pinctrl/Makefile             |   1 +
>  drivers/pinctrl/pinctrl-apple-gpio.c | 652 +++++++++++++++++++++++++++
>  4 files changed, 667 insertions(+)
>  create mode 100644 drivers/pinctrl/pinctrl-apple-gpio.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ca6d6fde85cf..e83e992b8ada 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1722,6 +1722,7 @@ F:	Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
>  F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
>  F:	arch/arm64/boot/dts/apple/
>  F:	drivers/irqchip/irq-apple-aic.c
> +F:	drivers/pinctrl/pinctrl-apple-gpio.c
>  F:	include/dt-bindings/interrupt-controller/apple-aic.h
>  F:	include/dt-bindings/pinctrl/apple.h
>  
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index 31921108e456..7269614c85a1 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -31,6 +31,19 @@ config DEBUG_PINCTRL
>  	help
>  	  Say Y here to add some extra checks and diagnostics to PINCTRL calls.
>  
> +config PINCTRL_APPLE_GPIO
> +	bool "Apple SoC GPIO pin controller driver"
> +	depends on ARCH_APPLE
> +	select PINMUX
> +	select GPIOLIB
> +	select GPIOLIB_IRQCHIP
> +	select GENERIC_PINCTRL_GROUPS
> +	select GENERIC_PINMUX_FUNCTIONS
> +	select OF_GPIO
> +	help
> +	  This is the driver for the GPIO controller found on Apple ARM SoCs,
> +	  including M1.
> +
>  config PINCTRL_ARTPEC6
>  	bool "Axis ARTPEC-6 pin controller driver"
>  	depends on MACH_ARTPEC6
> diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
> index 200073bcc2c1..5e63de2ffcf4 100644
> --- a/drivers/pinctrl/Makefile
> +++ b/drivers/pinctrl/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_PINMUX)		+= pinmux.o
>  obj-$(CONFIG_PINCONF)		+= pinconf.o
>  obj-$(CONFIG_OF)		+= devicetree.o
>  obj-$(CONFIG_GENERIC_PINCONF)	+= pinconf-generic.o
> +obj-$(CONFIG_PINCTRL_APPLE_GPIO) += pinctrl-apple-gpio.o
>  obj-$(CONFIG_PINCTRL_ARTPEC6)	+= pinctrl-artpec6.o
>  obj-$(CONFIG_PINCTRL_AS3722)	+= pinctrl-as3722.o
>  obj-$(CONFIG_PINCTRL_AXP209)	+= pinctrl-axp209.o
> diff --git a/drivers/pinctrl/pinctrl-apple-gpio.c b/drivers/pinctrl/pinctrl-apple-gpio.c
> new file mode 100644
> index 000000000000..a27d21682f3a
> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-apple-gpio.c
> @@ -0,0 +1,652 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Apple SoC pinctrl+GPIO+external IRQ driver
> + *
> + * Copyright (C) 2021 The Asahi Linux Contributors
> + * Copyright (C) 2020 Corellium LLC
> + *
> + * Based on: pinctrl-pistachio.c
> + * Copyright (C) 2014 Imagination Technologies Ltd.
> + * Copyright (C) 2014 Google, Inc.
> + */
> +
> +#define USE_PINMUX_GENERIC_FN 1
> +#define USE_PINCTRL_GENERIC_FN 1
> +
> +#include <dt-bindings/pinctrl/apple.h>
> +#include <linux/clk.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/interrupt.h>
> +#include <linux/irq.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +#include <linux/platform_device.h>
> +
> +#include "pinctrl-utils.h"
> +#include "core.h"
> +#include "pinmux.h"
> +
> +struct apple_gpio_pincfg {
> +	uint8_t irqtype;
> +	uint8_t stat;
> +};
> +
> +#define PINCFG_STAT_OUTVAL	0x01
> +#define PINCFG_STAT_OUTEN	0x02
> +#define PINCFG_STAT_PERIPH	0x20
> +#define PINCFG_STAT_IRQEN	0x80
> +
> +struct apple_gpio_pinctrl {
> +	struct device *dev;
> +	struct pinctrl_dev *pctldev;
> +
> +	unsigned int npins;
> +	struct pinctrl_pin_desc *pins;
> +	struct apple_gpio_pincfg *pin_cfgs;
> +	const char **pin_names;
> +	unsigned *pin_nums;
> +
> +	void __iomem *base;
> +	unsigned int nirqgrps;
> +
> +	struct pinctrl_desc pinctrl_desc;
> +	struct gpio_chip gpio_chip;
> +	struct irq_chip irq_chip;
> +};
> +
> +#define REG_GPIO(x)		(4 * (x))
> +#define  REG_GPIOx_DATA		BIT(0)
> +#define  REG_GPIOx_MODE_MASK	GENMASK(3, 1)
> +#define REG_GPIOx_OUT	(1 << REG_GPIOx_DATA)
> +#define REG_GPIOx_IN_IRQ_HI	(2 << REG_GPIOx_DATA)
> +#define REG_GPIOx_IN_IRQ_LO	(3 << REG_GPIOx_DATA)
> +#define REG_GPIOx_IN_IRQ_UP	(4 << REG_GPIOx_DATA)
> +#define REG_GPIOx_IN_IRQ_DN	(5 << REG_GPIOx_DATA)
> +#define REG_GPIOx_IN_IRQ_ANY	(6 << REG_GPIOx_DATA)
> +#define REG_GPIOx_IN_IRQ_OFF	(7 << REG_GPIOx_DATA)
> +#define  REG_GPIOx_PERIPH	BIT(5)
> +#define  REG_GPIOx_CFG_DONE	BIT(9)
> +#define  REG_GPIOx_GRP_MASK	GENMASK(18, 16)
> +#define REG_IRQ(g,x)		(0x800 + 0x40 * (g) + 4 * ((x) >> 5))
> +
> +static void apple_gpio_set_reg(struct apple_gpio_pinctrl *pctl, unsigned pin, uint32_t clr, uint32_t set)
> +{
> +	void __iomem *ppin = pctl->base + pin * 4;
> +	uint32_t prev, cfg;
> +
> +	prev = readl(ppin);
> +	cfg = (prev & ~clr) | set;
> +
> +	if(!(prev & REG_GPIOx_CFG_DONE))
> +		writel(cfg & ~REG_GPIOx_CFG_DONE, ppin);
> +	writel(cfg, ppin);

I'll add my usual rant about the use of relaxed accessors, or lack
thereof. Unless there is a compelling reason for spitting out
barriers everywhere, please use the _relaxed version.

> +}
> +
> +static void apple_gpio_refresh_reg(struct apple_gpio_pinctrl *pctl, unsigned pin)
> +{
> +	struct apple_gpio_pincfg *pincfg = &pctl->pin_cfgs[pin];
> +
> +	int stat = pincfg->stat;
> +	int outval = (stat & PINCFG_STAT_OUTVAL);
> +
> +	int clear = REG_GPIOx_MODE_MASK | REG_GPIOx_DATA;
> +	int set = REG_GPIOx_CFG_DONE | outval;
> +
> +	if (stat & PINCFG_STAT_PERIPH) {
> +		set |= REG_GPIOx_PERIPH;
> +	} else {
> +		clear |= REG_GPIOx_PERIPH;
> +		if (stat & PINCFG_STAT_OUTEN)
> +			set |= REG_GPIOx_OUT;
> +		else if (stat & PINCFG_STAT_IRQEN)
> +			set |= pincfg->irqtype;
> +		else
> +			set |= REG_GPIOx_IN_IRQ_OFF;
> +	}
> +
> +	apple_gpio_set_reg(pctl, pin, clear, set);

Please add some documentation on how these bits behave. This is
specially important as the mask/unmask operations can be used
concurrently. Unless the HW ensures mutual exclusion one way or
another (such as separate registers per interrupts?), you'll need some
locking here.

[...]

I know nothing about pinctrl and GPIO, so I'll skip directly to my own
turf...

> +/* IRQ chip functions */
> +
> +static void apple_gpio_gpio_irq_ack(struct irq_data *data)
> +{
> +	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(irq_data_get_irq_chip_data(data));
> +	unsigned irqgrp = FIELD_GET(REG_GPIOx_GRP_MASK, apple_gpio_get_reg(pctl, data->hwirq));
> +
> +	writel(1u << (data->hwirq & 31), pctl->base + REG_IRQ(irqgrp, data->hwirq));

Use BIT().

> +}
> +
> +static void apple_gpio_gpio_irq_mask(struct irq_data *data)
> +{
> +	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(irq_data_get_irq_chip_data(data));
> +
> +	pctl->pin_cfgs[data->hwirq].stat &= ~PINCFG_STAT_IRQEN;
> +	apple_gpio_refresh_reg(pctl, data->hwirq);

See my above note about the potential requirement for locking.

> +}
> +
> +static void apple_gpio_gpio_irq_unmask(struct irq_data *data)
> +{
> +	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(irq_data_get_irq_chip_data(data));
> +
> +	pctl->pin_cfgs[data->hwirq].stat |= PINCFG_STAT_IRQEN;
> +	apple_gpio_refresh_reg(pctl, data->hwirq);
> +}
> +
> +static unsigned int apple_gpio_gpio_irq_startup(struct irq_data *data)
> +{
> +	struct gpio_chip *chip = irq_data_get_irq_chip_data(data);
> +	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(chip);
> +	unsigned irqgrp = 0;

Useless variable?

> +
> +	apple_gpio_set_reg(pctl, data->hwirq, REG_GPIOx_GRP_MASK, FIELD_PREP(REG_GPIOx_GRP_MASK, irqgrp));
> +
> +	apple_gpio_gpio_direction_input(chip, data->hwirq);
> +	apple_gpio_gpio_irq_unmask(data);
> +
> +	return 0;
> +}
> +
> +static int apple_gpio_gpio_irq_set_type(struct irq_data *data, unsigned int type)
> +{
> +	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(irq_data_get_irq_chip_data(data));
> +
> +	switch(type & IRQ_TYPE_SENSE_MASK) {
> +	case IRQ_TYPE_EDGE_RISING:
> +		pctl->pin_cfgs[data->hwirq].irqtype = REG_GPIOx_IN_IRQ_UP;
> +		break;
> +	case IRQ_TYPE_EDGE_FALLING:
> +		pctl->pin_cfgs[data->hwirq].irqtype = REG_GPIOx_IN_IRQ_DN;
> +		break;
> +	case IRQ_TYPE_EDGE_BOTH:
> +		pctl->pin_cfgs[data->hwirq].irqtype = REG_GPIOx_IN_IRQ_ANY;
> +		break;
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		pctl->pin_cfgs[data->hwirq].irqtype = REG_GPIOx_IN_IRQ_HI;
> +		break;
> +	case IRQ_TYPE_LEVEL_LOW:
> +		pctl->pin_cfgs[data->hwirq].irqtype = REG_GPIOx_IN_IRQ_LO;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	apple_gpio_refresh_reg(pctl, data->hwirq);

A general question about how the HW works: you seem to shadow some of
the state in memory, only to end-up committing it into the HW at a
later point. Why the indirection? I don't think a RMW operation is
going to hurt.

> +
> +	if(type & IRQ_TYPE_LEVEL_MASK)
> +		irq_set_handler_locked(data, handle_level_irq);
> +	else
> +		irq_set_handler_locked(data, handle_edge_irq);
> +	return 0;
> +}
> +
> +static void apple_gpio_gpio_irq_handler(struct irq_desc *desc)
> +{
> +	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
> +	struct apple_gpio_pinctrl *pctl = gpiochip_get_data(gc);
> +	struct irq_chip *chip = irq_desc_get_chip(desc);
> +	unsigned irqgrp, pinh, pinl;
> +	unsigned long pending;
> +	unsigned int parent = irq_desc_get_irq(desc);
> +
> +	for (irqgrp = 0; irqgrp < pctl->nirqgrps; ++irqgrp) {
> +		if (parent == gc->irq.parents[irqgrp])
> +			break;
> +	}

This seems counter-productive. Why can't the handler data give you the
correct context without having to iterate on internal data structures?

> +
> +	WARN_ON(irqgrp == pctl->nirqgrps);

WARN_ON(), followed by the dereferencing of random data? If that
cannot happen, please drop it. If it can happen, just fix it. See
below for my take on this.

> +
> +	chained_irq_enter(chip, desc);
> +	for(pinh=0; pinh<pctl->npins; pinh+=32) {

Coding style, please (all over the file).

> +		pending = readl(pctl->base + REG_IRQ(irqgrp, pinh));
> +		for_each_set_bit(pinl, &pending, 32)
> +			generic_handle_irq(irq_linear_revmap(gc->irq.domain, pinh + pinl));

This should be a call to generic_handle_domain_irq().
irq_linear_revmap() is going away soon.

> +	}
> +	chained_irq_exit(chip, desc);
> +}
> +
> +/* Probe & register */
> +
> +static int apple_gpio_gpio_register(struct apple_gpio_pinctrl *pctl)
> +{
> +	struct device_node *node = pctl->dev->of_node;
> +	struct gpio_irq_chip *girq;
> +	int i, ret = 0;
> +
> +	if(!of_find_property(node, "gpio-controller", NULL)) {
> +		dev_err(pctl->dev, "Apple GPIO must have 'gpio-controller' property.\n");
> +		return -ENODEV;
> +	}
> +
> +	pctl->gpio_chip.label = dev_name(pctl->dev);
> +	pctl->gpio_chip.request = gpiochip_generic_request;
> +	pctl->gpio_chip.free = gpiochip_generic_free;
> +	pctl->gpio_chip.get_direction = apple_gpio_gpio_get_direction;
> +	pctl->gpio_chip.direction_input = apple_gpio_gpio_direction_input;
> +	pctl->gpio_chip.direction_output = apple_gpio_gpio_direction_output;
> +	pctl->gpio_chip.get = apple_gpio_gpio_get;
> +	pctl->gpio_chip.set = apple_gpio_gpio_set;
> +	pctl->gpio_chip.base = -1;
> +	pctl->gpio_chip.ngpio = pctl->npins;
> +	pctl->gpio_chip.parent = pctl->dev;
> +	pctl->gpio_chip.of_node = node;
> +
> +	if (of_find_property(node, "interrupt-controller", NULL)) {
> +		ret = platform_irq_count(to_platform_device(pctl->dev));
> +		if(ret < 0)
> +			return ret;
> +
> +		pctl->nirqgrps = ret;
> +
> +		pctl->irq_chip.name = dev_name(pctl->dev);

No, please. We don't need a massively long name that will make
/proc/interrupts more messy than it needs to be (and creates ABI
issues when someone repaints the DT). Just say "GPIO".

> +		pctl->irq_chip.irq_startup = apple_gpio_gpio_irq_startup;
> +		pctl->irq_chip.irq_ack = apple_gpio_gpio_irq_ack;
> +		pctl->irq_chip.irq_mask = apple_gpio_gpio_irq_mask;
> +		pctl->irq_chip.irq_unmask = apple_gpio_gpio_irq_unmask;
> +		pctl->irq_chip.irq_set_type = apple_gpio_gpio_irq_set_type;
> +
> +		girq = &pctl->gpio_chip.irq;
> +		girq->chip = &pctl->irq_chip;
> +		girq->parent_handler = apple_gpio_gpio_irq_handler;
> +		girq->num_parents = pctl->nirqgrps;
> +
> +		girq->parents = devm_kmalloc_array(pctl->dev, pctl->nirqgrps,
> +			sizeof(girq->parents[0]), GFP_KERNEL);
> +		if (!girq->parents)
> +			return -ENOMEM;
> +
> +		for(i = 0; i < pctl->nirqgrps; i++) {
> +			ret = platform_get_irq(to_platform_device(pctl->dev), i);
> +			if(ret < 0) {
> +				if(ret != -EPROBE_DEFER)
> +					dev_err(pctl->dev, "Failed to map IRQ %d (%d).\n", i, ret);
> +				return ret;
> +			}
> +			girq->parents[i] = ret;
> +		}

In general, keeping track of the parent interrupts in an interrupt
controller driver is a sure sign that things are badly organised.
Here, you have a single irqchip context that handles multiple muxes.
You really should have one context per mux, which would simplify your
interrupt handling.

An alternative is to use the fact that all the interrupts to the AIC
form a contiguous space, and use that to directly index into the array.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.
