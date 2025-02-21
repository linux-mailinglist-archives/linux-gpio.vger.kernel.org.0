Return-Path: <linux-gpio+bounces-16402-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A0EA3FD85
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 18:31:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C9343A4AEB
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 17:27:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09C8E2500D0;
	Fri, 21 Feb 2025 17:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="S0JY/8PE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C5524E4B9
	for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 17:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740158833; cv=none; b=WXBxUMFEExa9uTK4RGXxOhUZXQItOKoGesnGRjTA2WSz0Yh8Da9ZWEoqb3qe4BvgCfmIUnJ2mMH3sgbzGvy8IafglNivopRZrdZYIhjejebLbB7HGyipZaRGsUefZ14bcqlmqZBMMG/bRkBLMlSxFFWe3wbatySGsuPYkPBSCe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740158833; c=relaxed/simple;
	bh=FQ5n1vvRHLLfHaySmly9POtqTaCHPxq2DzJ5YpUiB4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WsP2IrT2MsjfQ6NB1V3WTw1Js4XkOeQc5oJ1nc75zkRBPS2/EdYw/dPB4fOAT8aJ+Sb9KkpAOPkPUThmvlq6IqMnb4j4RdEXRwFRfwfy9kt951ak2isLmq7WHWOM+lYV9DrlVJUAHYipwofncTzrz28aK3bXqPRD4lAJ8X01T2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=S0JY/8PE; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3cfc8772469so7761565ab.3
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2025 09:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1740158830; x=1740763630; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8p/1Lh3fecHVfcz1OFW2Ia1cbUJbEsHA/guYiKZIMOM=;
        b=S0JY/8PEqEs79rwIPSh21C8r2612cBeHE9qUTMAQwXnA9dqysjzmgREgmNgHFEdUn6
         dTgl6scOSCwCCJ6uJf9XjEo1Nm/wy6Qq947DBgVc+WqPbn8t7HXrDGhJatf3WwODv/bM
         EprPV4ZYvERv/gOnKY3BZ3XFbfXB3PN2nR3G0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740158830; x=1740763630;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8p/1Lh3fecHVfcz1OFW2Ia1cbUJbEsHA/guYiKZIMOM=;
        b=IJ8bZAjl2dbTXLqULC7v0tjwPeXwg1RmEdSnlRSmwA5OnLxSQdSs73M2BIq3lYxGAz
         f0HrnmGOemyrIvq+dZpJl5o8zzv4VoW5eTMTQXpfQA/ZjUfinK42QLPfTyroFJ8l0ekU
         CIsZGyaiNSwNTn3YGMGBIp7RGGkdKRVu1Dh8DL/SZz3oI4XHUYnOr6Wuf8IPh0wsbeZL
         5JCs/0aRgdv65jUs1sl1UPn6AutVIjEZ+YLihPS4zWgGCcQx6srV4N3tW00OHrn6mWqm
         3+YsSZnDIotmMSAziP4ZyDQxtC2oIQnKdiSMSbOx6MZjBgCSIjJgag9ORypQqIwzuUR+
         Y6UA==
X-Forwarded-Encrypted: i=1; AJvYcCUhDCviIn/XCSkWCGReV73oe/4SYW8yQtrGDOTy2YvOTg6yKzVAiX188KqOsDbb0lZCxKfwXtrtXOFy@vger.kernel.org
X-Gm-Message-State: AOJu0YzB+9vN2D5b8KNzvuRTPVf+NI22jvLEjQBptLIQgOb8mJBM8Tid
	JGw06p97jCp6wi23HpWGd1zISmhtgzsfb1tgA6BUSsQUE5Kz2curiYoeRojNtg==
X-Gm-Gg: ASbGncs0/DX0DTC6KV6HfoeysO6Zz9Ct9S5I/X5bkQ6gbkC3dVYCcMiD1rVD/1L738B
	10SqKfrMcRa6q2AbvfTkWdIhP9GzJ6ny7RfVxZDansiseAiGUMr/uToT5Vr5xOVpAfp8LN1yGPS
	oMg9K+xD7REu941haqfX8X37bX0Lp/NgQ0BSWAzfPuW8aPM4xx/wRUxWKiaGP8x4306ysGv4Cm/
	UAOql8kGC2wj2k1Y5pfPB9USy1CTpC0bMghKtTkdksxKdS2Z37iWDtzif93aI7m5YlPJhTj8TRv
	37oAKLSAj0/6xO5Ze1cfZ46jRKs4QYu3G95DQoZt5CAxCBdt/ITbVGuftkoh
X-Google-Smtp-Source: AGHT+IGi+515wg4KsB8DMgYH/D3am5w2JvsQXTqdyeiRKZuazAKSl5XuTW93qOEaDCycL823TFbpaQ==
X-Received: by 2002:a05:6e02:1a4d:b0:3cf:bb11:a3a7 with SMTP id e9e14a558f8ab-3d2caee673amr37889695ab.17.1740158830238;
        Fri, 21 Feb 2025 09:27:10 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d2ab3b67c1sm18701325ab.63.2025.02.21.09.27.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 09:27:09 -0800 (PST)
Message-ID: <8dd08731-8f50-4599-8d18-873b7f594dee@ieee.org>
Date: Fri, 21 Feb 2025 11:27:06 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] gpio: spacemit: add support for K1 SoC
To: Yixun Lan <dlan@gentoo.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>
Cc: Yangyu Chen <cyy@cyyself.name>, Jisheng Zhang <jszhang@kernel.org>,
 Jesse Taube <mr.bossman075@gmail.com>, Inochi Amaoto
 <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org>
 <20250217-03-k1-gpio-v5-3-2863ec3e7b67@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20250217-03-k1-gpio-v5-3-2863ec3e7b67@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/17/25 6:57 AM, Yixun Lan wrote:
> Implement GPIO functionality which capable of setting pin as
> input, output. Also, each pin can be used as interrupt which
> support rising, failing, or both edge type trigger.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

This looks nicer!

I have some more comments, but they're pretty minor.

> ---
>   drivers/gpio/Kconfig            |   8 +
>   drivers/gpio/Makefile           |   1 +
>   drivers/gpio/gpio-spacemit-k1.c | 376 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 385 insertions(+)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index add5ad29a673c09082a913cb2404073b2034af48..eaae729eec00a3d6d2b83769aed3e2b0ca9927e5 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -655,6 +655,14 @@ config GPIO_SNPS_CREG
>   	  where only several fields in register belong to GPIO lines and
>   	  each GPIO line owns a field with different length and on/off value.
>   
> +config GPIO_SPACEMIT_K1
> +	bool "SPACEMIT K1 GPIO support"
> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	depends on OF_GPIO
> +	select GPIOLIB_IRQCHIP
> +	help
> +	  Say yes here to support the SpacemiT's K1 GPIO device.
> +
>   config GPIO_SPEAR_SPICS
>   	bool "ST SPEAr13xx SPI Chip Select as GPIO support"
>   	depends on PLAT_SPEAR
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index af3ba4d81b583842893ea69e677fbe2abf31bc7b..6709ce511a0cf10310a94521c85a2d382dcfa696 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -156,6 +156,7 @@ obj-$(CONFIG_GPIO_SIOX)			+= gpio-siox.o
>   obj-$(CONFIG_GPIO_SL28CPLD)		+= gpio-sl28cpld.o
>   obj-$(CONFIG_GPIO_SLOPPY_LOGIC_ANALYZER) += gpio-sloppy-logic-analyzer.o
>   obj-$(CONFIG_GPIO_SODAVILLE)		+= gpio-sodaville.o
> +obj-$(CONFIG_GPIO_SPACEMIT_K1)		+= gpio-spacemit-k1.o
>   obj-$(CONFIG_GPIO_SPEAR_SPICS)		+= gpio-spear-spics.o
>   obj-$(CONFIG_GPIO_SPRD)			+= gpio-sprd.o
>   obj-$(CONFIG_GPIO_STMPE)		+= gpio-stmpe.o
> diff --git a/drivers/gpio/gpio-spacemit-k1.c b/drivers/gpio/gpio-spacemit-k1.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..f72511b5ab8f8f0b1d1c9e89d2f9ca07b623a866
> --- /dev/null
> +++ b/drivers/gpio/gpio-spacemit-k1.c
> @@ -0,0 +1,376 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2023-2025 SpacemiT (Hangzhou) Technology Co. Ltd
> + * Copyright (C) 2025 Yixun Lan <dlan@gentoo.org>
> + */
> +
> +#include <linux/io.h>
> +#include <linux/init.h>
> +#include <linux/irq.h>
> +#include <linux/interrupt.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/platform_device.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/property.h>
> +#include <linux/seq_file.h>
> +#include <linux/module.h>
> +
> +#include "gpiolib.h"
> +
> +/* register offset */

The comments are great, but I think I'd like to see them be abbreviated
further and added to the right of the definitions, if you can do that.

I think you can drop "GPIO" and "register" in each one of them, and
that might get you close to an 80 column limit.  See what you can do.

> +/* GPIO port level register */

I think the port level register is read-only, and you didn't include
that annotation.

> +#define GPLR		0x00
> +/* GPIO port direction register - R/W */
> +#define GPDR		0x0c
> +/* GPIO port set register - W */
> +#define GPSR		0x18
> +/* GPIO port clear register - W */
> +#define GPCR		0x24
> +/* GPIO port rising edge register R/W */
> +#define GRER		0x30
> +/* GPIO port falling edge register R/W */
> +#define GFER		0x3c
> +/* GPIO edge detect status register - R/W1C */
> +#define GEDR		0x48
> +/*  GPIO (set) direction register - W */

Delete the extra space above.

> +#define GSDR		0x54
> +/* GPIO (clear) direction register - W */
> +#define GCDR		0x60
> +/* GPIO (set) rising edge detect enable register - W */
> +#define GSRER		0x6c
> +/* GPIO (clear) rising edge detect enable register - W */
> +#define GCRER		0x78
> +/* GPIO (set) falling edge detect enable register - W */
> +#define GSFER		0x84
> +/* GPIO (clear) falling edge detect enable register - W */
> +#define GCFER		0x90
> +/* GPIO interrupt mask register, 0 disable, 1 enable - R/W */
> +#define GAPMASK		0x9c
> +
> +#define NR_BANKS		4
> +#define NR_GPIOS_PER_BANK	32
> +
> +#define to_spacemit_gpio_bank(x) container_of((x), struct spacemit_gpio_bank, gc)
> +
> +struct spacemit_gpio;
> +
> +struct spacemit_gpio_bank {
> +	struct gpio_chip		gc;
> +	struct spacemit_gpio		*sg;
> +	void __iomem			*base;
> +	u32				index;

You almost never use the index field.  It could easily be
computed rather than stored:

static u32 spacemit_gpio_bank_index(struct spacemit_gpio_bank *gb)
{
	return (u32)(gb - gb->sg->sgb);
}

> +	u32				irq_mask;
> +	u32				irq_rising_edge;
> +	u32				irq_falling_edge;
> +};
> +
> +struct spacemit_gpio {
> +	struct	device			*dev;
> +	struct	spacemit_gpio_bank	sgb[NR_BANKS];
> +};
> +
> +static irqreturn_t spacemit_gpio_irq_handler(int irq, void *dev_id)
> +{
> +	struct spacemit_gpio_bank *gb = dev_id;
> +	unsigned long pending;
> +	u32 n, gedr;
> +
> +	gedr = readl(gb->base + GEDR);
> +	if (!gedr)
> +		return IRQ_NONE;
> +	writel(gedr, gb->base + GEDR);
> +
> +	gedr = gedr & gb->irq_mask;
> +	if (!gedr)
> +		return IRQ_NONE;
> +
> +	pending = gedr;

Instead, do:

	pending = gedr & gb->irq_mask;
	if (!pending)
		return IRQ_NONE;

> +	for_each_set_bit(n, &pending, BITS_PER_LONG)
> +		handle_nested_irq(irq_find_mapping(gb->gc.irq.domain, n));
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static void spacemit_gpio_irq_ack(struct irq_data *d)
> +{
> +	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(d);
> +
> +	writel(BIT(irqd_to_hwirq(d)), gb->base + GEDR);
> +}
> +
> +static void spacemit_gpio_irq_mask(struct irq_data *d)
> +{
> +	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(d);
> +	u32 bit = BIT(irqd_to_hwirq(d));
> +
> +	gb->irq_mask &= ~bit;

This is a minor suggestion, and I'm not sure how much difference
it makes.  But here (and one or two more times below) you could
avoid the writel() calls if you know the particular IRQ was
already disabled.  (Maybe that won't ever happen?)

	if (!(gb->irq_mask & bit))
		return;

	gb->irq_mask &= !bit;
	...

This should work because in spacemit_gpio_add_bank() you reset
all the IRQ state and disable all IRQs, so the cached copy of
the irq_mask and the rising and falling edge masks should match
reality.

> +
> +	if (bit & gb->irq_rising_edge)
> +		writel(bit, gb->base + GCRER);
> +
> +	if (bit & gb->irq_falling_edge)
> +		writel(bit, gb->base + GCFER);
> +}
> +
> +static void spacemit_gpio_irq_unmask(struct irq_data *d)
> +{
> +	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(d);
> +	u32 bit = BIT(irqd_to_hwirq(d));
> +


Same thought here.

	if (gb->irq_mask & bit)
		return;

> +	gb->irq_mask |= bit;
> +
> +	if (bit & gb->irq_rising_edge)
> +		writel(bit,  gb->base + GSRER);
> +
> +	if (bit & gb->irq_falling_edge)
> +		writel(bit, gb->base + GSFER);
> +}
> +
> +static int spacemit_gpio_irq_set_type(struct irq_data *d, unsigned int type)
> +{
> +	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(d);
> +	u32 bit = BIT(irqd_to_hwirq(d));
> +

Same thought in this function, although it gets a little
messier looking.

> +	if (type & IRQ_TYPE_EDGE_RISING) {
> +		gb->irq_rising_edge |= bit;
> +		writel(bit, gb->base + GSRER);
> +	} else {
> +		gb->irq_rising_edge &= ~bit;
> +		writel(bit, gb->base + GCRER);
> +	}

Otherwise:

     if (type & IRQ_TYPE_EDGE_RISING)
	gb->irq_rising_edge |= bit;
     else
	gb->irq_rising_edge &= ~bit;
     writel(bit, gb->base + GSRER);

and again below.

> +
> +	if (type & IRQ_TYPE_EDGE_FALLING) {
> +		gb->irq_falling_edge |= bit;
> +		writel(bit, gb->base + GSFER);
> +	} else {
> +		gb->irq_falling_edge &= ~bit;
> +		writel(bit, gb->base + GCFER);
> +	}
> +
> +	return 0;
> +}
> +

You added this function in version 5 of the series.  Please call
attention to additions (or removals) like this in your cover page,
and/or in notes at the top of this patch.

> +static void spacemit_gpio_irq_print_chip(struct irq_data *data, struct seq_file *p)
> +{
> +	struct spacemit_gpio_bank *gb = irq_data_get_irq_chip_data(data);
> +
> +	seq_printf(p, "%s-%d", dev_name(gb->gc.parent), gb->index);

Does this look like "gpiochip2-15" or something?  I wasn't able
to find it in the debugfs file system.

> +}
> +
> +static struct irq_chip spacemit_gpio_chip = {
> +	.name		= "k1-gpio-irqchip",
> +	.irq_ack	= spacemit_gpio_irq_ack,
> +	.irq_mask	= spacemit_gpio_irq_mask,
> +	.irq_unmask	= spacemit_gpio_irq_unmask,
> +	.irq_set_type	= spacemit_gpio_irq_set_type,
> +	.irq_print_chip	= spacemit_gpio_irq_print_chip,
> +	.flags		= IRQCHIP_IMMUTABLE,

Last time your flags value was IRQCHIP_SET_WAKE.  Why the change?

> +	GPIOCHIP_IRQ_RESOURCE_HELPERS,
> +};
> +

Maybe you could add a comment indicating that gpiospec->args[]
will contain:
0:  bank index
1:  GPIO offset within the bank
2:  flags

(And the GPIO chip instance number as Linus suggested.)

> +static int spacemit_gpio_xlate(struct gpio_chip *gc,
> +			       const struct of_phandle_args *gpiospec, u32 *flags)
> +{
> +	struct spacemit_gpio_bank *gb = gpiochip_get_data(gc);
> +	struct spacemit_gpio *sg = gb->sg;
> +

Get rid of the above blank line.

> +	int i;
> +

I'm not sure the context in which this runs.  Can it be given
arbitrary content from a DTB?  Mainly I'm interested to know
whether any of these checks can be eliminated.  If it's called
while parsing a DTB I can see why you'd need to verify all
input values for validity.

> +	if (gc->of_gpio_n_cells != 3)
> +		return -EINVAL;
> +
> +	if (gpiospec->args_count < gc->of_gpio_n_cells)
> +		return -EINVAL;
> +
> +	i = gpiospec->args[0];
> +	if (i >= NR_BANKS)
> +		return -EINVAL;
> +
> +	if (gc != &sg->sgb[i].gc)
> +		return -EINVAL;
> +
> +	if (gpiospec->args[1] >= gc->ngpio)
> +		return -EINVAL;
> +
> +	if (flags)
> +		*flags = gpiospec->args[2];
> +
> +	return gpiospec->args[1];
> +}
> +
> +static int spacemit_add_pin_range(struct gpio_chip *gc)
> +{
> +	struct spacemit_gpio_bank *gb;
> +	struct of_phandle_args pinspec;
> +	struct pinctrl_dev *pctldev;
> +	struct device_node *np;
> +	int ret, trim;
> +
> +	np = dev_of_node(&gc->gpiodev->dev);
> +	if (!np)
> +		return 0;
> +
> +	gb = to_spacemit_gpio_bank(gc);
> +
> +	ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3,
> +					       gb->index, &pinspec);
> +	if (ret)
> +		return ret;
> +
> +	pctldev = of_pinctrl_get(pinspec.np);
> +	of_node_put(pinspec.np);
> +	if (!pctldev)
> +		return -EPROBE_DEFER;
> +
> +	/* Ignore ranges outside of this GPIO chip */
> +	if (pinspec.args[0] >= (gc->offset + gc->ngpio))
> +		return -EINVAL;
> +
> +	if (pinspec.args[0] + pinspec.args[2] <= gc->offset)
> +		return -EINVAL;
> +

I would do the following test earlier.

> +	if (!pinspec.args[2])
> +		return -EINVAL;
> +
> +	/* Trim the range to fit this GPIO chip */
> +	if (gc->offset > pinspec.args[0]) {
> +		trim = gc->offset - pinspec.args[0];
> +		pinspec.args[2] -= trim;
> +		pinspec.args[1] += trim;
> +		pinspec.args[0] = 0;
> +	} else {
> +		pinspec.args[0] -= gc->offset;
> +	}
> +	if ((pinspec.args[0] + pinspec.args[2]) > gc->ngpio)
> +		pinspec.args[2] = gc->ngpio - pinspec.args[0];
> +
> +	ret = gpiochip_add_pin_range(gc,
> +				     pinctrl_dev_get_devname(pctldev),
> +				     pinspec.args[0],
> +				     pinspec.args[1],
> +				     pinspec.args[2]);
> +	if (ret)
> +		return ret;
> +
> +	return 0;

Just do this:

     return  gpiochip_add_pin_range(gc, pinctrl_dev_get_devname(pctldev),
				   pinspec.args[0], pinspec.args[2]);

> +}
> +
> +static int spacemit_gpio_add_bank(struct spacemit_gpio *sg,
> +				  void __iomem *regs,
> +				  int index, int irq)
> +{
> +	struct spacemit_gpio_bank *gb = &sg->sgb[index];
> +	struct gpio_chip *gc = &gb->gc;
> +	struct device *dev = sg->dev;
> +	struct gpio_irq_chip *girq;
> +	void __iomem *dat, *set, *clr, *dirin, *dirout;
> +	int ret, bank_base[] = { 0x0, 0x4, 0x8, 0x100 };
> +
> +	gb->index = index;
> +	gb->base = regs + bank_base[index];
> +
> +	dat	= gb->base + GPLR;
> +	set	= gb->base + GPSR;
> +	clr	= gb->base + GPCR;
> +	dirin	= gb->base + GCDR;
> +	dirout	= gb->base + GSDR;
> +
> +	/* This registers 32 GPIO lines per bank */
> +	ret = bgpio_init(gc, dev, 4, dat, set, clr, dirout, dirin,
> +			 BGPIOF_UNREADABLE_REG_SET | BGPIOF_UNREADABLE_REG_DIR);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to init gpio chip\n");
> +
> +	gb->sg = sg;
> +
> +	gc->label		= dev_name(dev);
> +	gc->request		= gpiochip_generic_request;
> +	gc->free		= gpiochip_generic_free;
> +	gc->ngpio		= NR_GPIOS_PER_BANK;
> +	gc->base		= -1;
> +
> +#ifdef CONFIG_OF_GPIO

Why are these lines conditionally defined?  Is it intended
to allow CONFIG_COMPILE_TEST to work?  Your Kconfig states
that this *depends on* OF_GPIO, so this is probably not
needed.

You don't define spacemit_gpio_xlate() earlier conditionally.
Nor spacemit_add_pin_range().

> +	gc->of_xlate		= spacemit_gpio_xlate;
> +	gc->of_add_pin_range	= spacemit_add_pin_range;
> +	gc->of_gpio_n_cells	= 3;
> +#endif
> +
> +	girq			= &gc->irq;
> +	girq->threaded		= true;
> +	girq->handler		= handle_simple_irq;
> +
> +	gpio_irq_chip_set_chip(girq, &spacemit_gpio_chip);
> +
> +	/* Clear Edge Detection Settings */
> +	writel(0x0, gb->base + GRER);
> +	writel(0x0, gb->base + GFER);
> +	/* Clear and Disable Interrupt */
> +	writel(0xffffffff, gb->base + GCFER);
> +	writel(0xffffffff, gb->base + GCRER);

It seems that GAPMASK is an overall interrupt mask register.
I assume that means that by writing 0 here, no interrupts
of any kind will be generated for any of the 32 GPIO ports.

If that's true, I would write this first, *then* disable
the rising and falling edge detection interrupts, *then*
clear any pending interrupts.

Are there any interrupt types other than rising and falling
edge?  Does this just provide an atomic way to disable both
types at once?  If there are no other interrupt types maybe
this could be used rather than disabling both types
separately using GCFER etc. in spacemit_gpio_irq_*mask().

					-Alex

> +	writel(0, gb->base + GAPMASK);
> +
> +	ret = devm_request_threaded_irq(dev, irq, NULL,
> +					spacemit_gpio_irq_handler,
> +					IRQF_ONESHOT | IRQF_SHARED,
> +					gb->gc.label, gb);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to register IRQ\n");
> +
> +	ret = devm_gpiochip_add_data(dev, gc, gb);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to add gpio chip\n");
> +
> +	/* Eable Interrupt */
> +	writel(0xffffffff, gb->base + GAPMASK);
> +
> +	return 0;
> +}
> +
> +static int spacemit_gpio_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct spacemit_gpio *sg;
> +	struct resource *res;
> +	void __iomem *regs;
> +	int i, irq, ret;
> +
> +	sg = devm_kzalloc(dev, sizeof(*sg), GFP_KERNEL);
> +	if (!sg)
> +		return -ENOMEM;
> +
> +	regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(regs))
> +		return PTR_ERR(regs);
> +
> +	irq = platform_get_irq(pdev, 0);
> +	if (irq < 0)
> +		return irq;
> +
> +	sg->dev	= dev;
> +
> +	for (i = 0; i < NR_BANKS; i++) {
> +		ret = spacemit_gpio_add_bank(sg, regs, i, irq);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id spacemit_gpio_dt_ids[] = {
> +	{ .compatible = "spacemit,k1-gpio" },
> +	{ /* sentinel */ }
> +};
> +
> +static struct platform_driver spacemit_gpio_driver = {
> +	.probe		= spacemit_gpio_probe,
> +	.driver		= {
> +		.name	= "k1-gpio",
> +		.of_match_table = spacemit_gpio_dt_ids,
> +	},
> +};
> +module_platform_driver(spacemit_gpio_driver);
> +
> +MODULE_AUTHOR("Yixun Lan <dlan@gentoo.org>");
> +MODULE_DESCRIPTION("GPIO driver for SpacemiT K1 SoC");
> +MODULE_LICENSE("GPL");
> 


