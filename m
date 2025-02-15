Return-Path: <linux-gpio+bounces-16069-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A237A370D4
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Feb 2025 22:12:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56D6B16F0F8
	for <lists+linux-gpio@lfdr.de>; Sat, 15 Feb 2025 21:12:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37D381FC0FC;
	Sat, 15 Feb 2025 21:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="1dJonHFb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7ADA1FBEB0
	for <linux-gpio@vger.kernel.org>; Sat, 15 Feb 2025 21:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739653921; cv=none; b=lhUSaF4NBC/CpIuUZ075RpL+rocX9kdMpHQ9XtLxRg60DjBn2Owp+quoURnRRnK6zqZ0fVWsDCQMuCpoN5VH4pI65YA1MPrHHSU29F72ydr3EVnVKoti8Qtq44e6nqsBko0DL8eKsKj2xfRo7myzocixMJdDPBSEOH7D7UabjuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739653921; c=relaxed/simple;
	bh=f+VbCY1gfLHoxf9oxxzk5qyOMQi09g3ceH9zT13fWKQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fEnvOFo/dvII91B3EHtYsl9aW2C2f0USwEXsg5UAbKkp9lbSvywVP2ve7zdlSOm6UWehqTwYQjAjJAkE1o2JR1PujOAkLiEWgzHqZs4oj8xulrQfuf25jaYOdOOVhl18gE1UvHK0CZzygUgY0+R4bYOpttAtxTmsnW4bF5GDl4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=1dJonHFb; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-85521efa9b5so68100439f.3
        for <linux-gpio@vger.kernel.org>; Sat, 15 Feb 2025 13:11:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1739653918; x=1740258718; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ceafEGWj5GkwpOKdDCNpSD8H3/j66ZDHpZYJ3GYP6r0=;
        b=1dJonHFb3wWH0tEShtNNj0qJkb27sycWk6lWZ4h7dqv+zvhAlULnH2ecPUYqF7MoDq
         BJhO43KPlwD9JvX6ggxRN5i7GR7Qs/8D+C1sBaSJn2NzTgK/PJURaautBVF+aYQZ8X5d
         s4AjmzrGiUtHD5jzgusDdXp/AFfI3aa6fNGFlOMVQjz7wmMXwXCROQO3scxWdjHtSPDm
         FlE/MsJQ1t/l4PGgm19/A0HbUsiSHTGyEiRLX6RJvYg0xGQ6S4+ErIeeBqDy+plhUHUx
         LPwwPfFUCTBzozyQOqAoemb1NakUMq2YdZ/PkgWyIW+cERa61HXucFXVTq6pYcNUAgtJ
         FGyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739653918; x=1740258718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ceafEGWj5GkwpOKdDCNpSD8H3/j66ZDHpZYJ3GYP6r0=;
        b=CWRTNGo7UzHdw0LNfo3lGk9z62gn1/Aw6JWAHH403XAQwNTpTm8WbT/fCzNGjOynyi
         /8PvNBa1r44P0F33LjeGsrrucAk6xB5I/PtMSIB2zPVc6qobajDcqqIOE7iNgJlH5FG8
         XKjJrSpLXnJ5Ziw4E8W+mjkzTeT4+AS21pxPiobZTFOebXVs+UJCZvg+2bwxE3dgoPz4
         pbyFqQwJ7cGED2NCFszb9H2MnYf/rhcvUAIBdrmKy3XfoIGO5OLe7Gy6LgpIALq6qDcS
         L8LHV4Ez1J5kxLwdYOJpvICjM+6qVib/zQ8ka9pSPEWLcDDGJHJCDnNWoLTPI80ka+Vn
         E0CA==
X-Forwarded-Encrypted: i=1; AJvYcCU3/4jSnabm4IcEAUgMPpU6mrp6Bm5FvZgxA1f+n6rlIyZRD76vDK4JArKnMTDV6b6LNa3CoEOscFaF@vger.kernel.org
X-Gm-Message-State: AOJu0YyQNwzixhk9EVoI8ZcFH+sjbVehlKfgWsr3LuFb5BLhdxFY+eG5
	k/shbQYFqBpK9m/h4EXQ7ssOIQ6f3LVeHDG20kTWDhXsmOhw6D5yA80vZ1OkMNQ=
X-Gm-Gg: ASbGncsnwSumd/+E7DQRjnHFqPvS4hR+PfqHCtBuXqkfK35B0uSvmFBDcCiK3wbM+5B
	RmdareuIAjOV9Ac2L6xTTlhW4yZ/HIbkaDAHTl0QHUk5qKtYHlOuHCj09UpEpjIvUkUISg+xlMe
	clAxrbcmQXwB7SCPxn736/L+wTNsAkKe01zyEBVZD+2vU+tpAfRUBpoho6cUkGzTPDbsm+lDZgD
	+uzsD34b1aBF//sivfvKmEYptsTSQ5XL6OccfHXrK8TZIlw5frACQS+yOKqibgq+AQMP4OyH2g+
	9iSXckIdPIqHoky3nZIuiauPstXpNVJ66O/IgXfeYgkJhbuwIj6+noQ3YaEOFrp09B7PkA==
X-Google-Smtp-Source: AGHT+IGuxU5zm7P8MamZT0KtUt6I5ePRawlrPWD3RPOpisukWv1FIdKmvx9A0oq2JmeKzILAfqJUTQ==
X-Received: by 2002:a05:6602:1653:b0:84a:78ff:1247 with SMTP id ca18e2360f4ac-8557a11ee17mr416344939f.9.1739653917692;
        Sat, 15 Feb 2025 13:11:57 -0800 (PST)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4ed28314722sm1422109173.135.2025.02.15.13.11.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 Feb 2025 13:11:57 -0800 (PST)
Message-ID: <0133988a-b0d9-4451-b06c-480dd7f559cd@riscstar.com>
Date: Sat, 15 Feb 2025 15:11:55 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] gpio: spacemit: add support for K1 SoC
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
 linux-riscv@lists.infradead.org
References: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
 <20250121-03-k1-gpio-v4-2-4641c95c0194@gentoo.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250121-03-k1-gpio-v4-2-4641c95c0194@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/20/25 9:38 PM, Yixun Lan wrote:
> Implement GPIO functionality which capable of setting pin as
> input, output. Also, each pin can be used as interrupt which
> support rising, failing, or both edge type trigger.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>

It sounds like the hardware will be modeled in DTS with
explicit banks, which makes sense.  The hardware looks like:

     GPIO controller ---> bank0 --> GPIOs 0..31
                     |
                     |--> bank1 --> GPIOs 0..31
                     |
                     |--> bank2 --> GPIOs 0..31
                     |
                     ---> bank3 --> GPIOs 0..31

Each bank has its own set of 15 registers, but all are managed
by the same controller (driver instance).

Anyway, I'm going to comment on just the code...

> ---
>   drivers/gpio/Kconfig            |   7 +
>   drivers/gpio/Makefile           |   1 +
>   drivers/gpio/gpio-spacemit-k1.c | 295 ++++++++++++++++++++++++++++++++++++++++
>   3 files changed, 303 insertions(+)
> 
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 56fee58e281e7cac7f287eb04e4c17a17f75ed04..c153f5439649da020ee42c38e88cb8df31a8e307 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -654,6 +654,13 @@ config GPIO_SNPS_CREG
>   	  where only several fields in register belong to GPIO lines and
>   	  each GPIO line owns a field with different length and on/off value.
>   
> +config GPIO_SPACEMIT_K1
> +	bool "SPACEMIT K1 GPIO support"
> +	depends on ARCH_SPACEMIT || COMPILE_TEST
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
> index 0000000000000000000000000000000000000000..de0491af494c10f528095efee9b3a140bdcc0b0d
> --- /dev/null
> +++ b/drivers/gpio/gpio-spacemit-k1.c
> @@ -0,0 +1,295 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2023-2025 SpacemiT (Hangzhou) Technology Co. Ltd
> + * Copyright (c) 2025 Yixun Lan <dlan@gentoo.org>
> + */
> +
> +#include <linux/io.h>
> +#include <linux/init.h>
> +#include <linux/irq.h>
> +#include <linux/interrupt.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/seq_file.h>
> +#include <linux/module.h>
> +
> +/* register offset */

Please add one-line comments explaining the purpose of these registers.
I explain my understanding below but you can maybe shorten it and add
something to the right of each definition.

> +#define GPLR		0x00

Current port (or pin?) level (port value, regardless of in or out) (r)

> +#define GPDR		0x0c

Current port direction (clear/0 = in, set/1 = out) (r)
This is currently never used.

> +#define GPSR		0x18

Set port value (set output level high for any set bits) (w)

> +#define GPCR		0x24

Clear port value (set output level low for any set bits) (w)

> +#define GRER		0x30

Ports configured for rising edge detect (r)
This is currently never used.

> +#define GFER		0x3c

Ports configured for falling edge detect (r)
This is currently never used.

> +#define GEDR		0x48

Edge detect status register (set bits indicate edge detected) (r/w)

> +#define GSDR		0x54

Set port direction (set bits indicate output pins) (w)

> +#define GCDR		0x60

Clear port direction (set bits indicate input pins) (w)

> +#define GSRER		0x6c

Enable rising edge detect (set bits indicate rising edge detect) (w)

> +#define GCRER		0x78

Disable rising edge detect (w)

> +#define GSFER		0x84

Enable falling edge detect (set bits indicate falling edge detect) (w)

> +#define GCFER		0x90

Disable falling edge detect (w)

> +#define GAPMASK		0x9c

I don't know what this is.  You write it with ~0 after you
clear both rising and falling edge detection on all 32 pins.

> +#define GCPMASK		0xa8

I don't know what this is.  It's currently never used.

> +
> +#define K1_BANK_GPIO_NUMBER	(32)

No need for parentheses around a simple constant.

> +
> +#define to_spacemit_gpio_port(x) container_of((x), struct spacemit_gpio_port, gc)
> +
> +struct spacemit_gpio;
> +

I might just not understand what a "port" means in this context
(I think here it represents a "bank" of 32 GPIOs.)  Based on the
DT discussion it seems like your structures might change, and
I'd like to know what you'll call them.

Here are terms I'll use:  There will be a top-level "controller"
structure which will be able to access four distinct "banks",
each of which has 32 "ports".

> +struct spacemit_gpio_port {
> +	struct gpio_chip		gc;
> +	struct spacemit_gpio		*gpio;
> +	struct fwnode_handle		*fwnode;
> +	void __iomem			*base;
> +	int				irq;
> +	u32				irq_mask;
> +	u32				irq_rising_edge;
> +	u32				irq_falling_edge;
> +	u32				index;
> +};
> +
> +struct spacemit_gpio {
> +	struct	device			*dev;
> +	struct spacemit_gpio_port	*ports;
> +	u32				nr_ports;
> +};
> +

Basically all of the write registers allow you to specify an
entire mask of bits, where the register write changes the
state of every port in a bank whose corresponding bit is set.
That capability is probably worth exposing, even though the
driver currently doesn't use it.

Meanwhile, most (maybe all) of your functions are only used
to update the state of a single port in a bank.

I think the argument names should distinguish these two cases.
I find the argument name "bit" (which now represents a 32-bit
mask with only one bit set) to be ambiguous.

If exactly one port is affected, maybe its number (0-31) can
be passed as the argument.  But where multiple ports in a
bank can be affected by the same operation, pass a "mask".

> +static inline void spacemit_clear_edge_detection(struct spacemit_gpio_port *port, u32 bit)
> +{

I'd do:
	if (bit & port->irq_rising_edge)
		writel(bit, port->base + GSRER);

(And similar below, and in spacemit_set_edge_detection().)

> +	writel(bit, port->base + GCRER);
> +	writel(bit, port->base + GCFER);
> +}
> +

Two comments about the function above and the next one:
- I think their names should be about masking IRQs, not about
   edge detection.
- Each is called only once, and they're trivial enough that I
   don't think encapsulating them in a function adds any value.
   Just open-code them where they're used.

> +static inline void spacemit_set_edge_detection(struct spacemit_gpio_port *port, u32 bit)
> +{
> +	writel(bit & port->irq_rising_edge,  port->base + GSRER);
> +	writel(bit & port->irq_falling_edge, port->base + GSFER);
> +}
> +

This is used to disable IRQ generation on all ports in a bank.
I would offer the same two comments about this function as I
gave above.

> +static inline void spacemit_reset_edge_detection(struct spacemit_gpio_port *port)
> +{
> +	writel(0xffffffff, port->base + GCFER);
> +	writel(0xffffffff, port->base + GCRER);
> +	writel(0xffffffff, port->base + GAPMASK);
> +}
> +

Use names that align with the callback function names.  I.e.,
this should be spacemit_irq_set_type().

> +static int spacemit_gpio_irq_type(struct irq_data *d, unsigned int type)
> +{
> +	struct spacemit_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 bit = BIT(irqd_to_hwirq(d));
> +
> +	if (type & IRQ_TYPE_EDGE_RISING) {
> +		port->irq_rising_edge |= bit;

Here too, maybe avoid doing the write if the bit was already
set in the rising edge mask.

> +		writel(bit, port->base + GSRER);
> +	} else {
> +		port->irq_rising_edge &= ~bit;
> +		writel(bit, port->base + GCRER);
> +	}
> +
> +	if (type & IRQ_TYPE_EDGE_FALLING) {
> +		port->irq_falling_edge |= bit;
> +		writel(bit, port->base + GSFER);
> +	} else {
> +		port->irq_falling_edge &= ~bit;
> +		writel(bit, port->base + GCFER);
> +	}
> +
> +	return 0;
> +}
> +
> +static irqreturn_t spacemit_gpio_irq_handler(int irq, void *dev_id)
> +{
> +	struct spacemit_gpio_port *port = dev_id;
> +	unsigned long pending;
> +	u32 n, gedr;
> +
> +	gedr = readl(port->base + GEDR);
> +	if (!gedr)
> +		return IRQ_NONE;
> +
> +	writel(gedr, port->base + GEDR);

I'd have the blank line here, instead of above the writel().

> +	gedr = gedr & port->irq_mask;

	pending = gedr & port->irq_mask;
	if (!pending)

> +
> +	if (!gedr)
> +		return IRQ_NONE;
> +
> +	pending = gedr;
> +
> +	for_each_set_bit(n, &pending, BITS_PER_LONG)
> +		handle_nested_irq(irq_find_mapping(port->gc.irq.domain, n));
> +
> +	return IRQ_HANDLED;
> +}
> +

I don't think "muxed" is necessary in these names.  Just call
this spacemit_irq_ack().

> +static void spacemit_ack_muxed_gpio(struct irq_data *d)
> +{
> +	struct spacemit_gpio_port *port = irq_data_get_irq_chip_data(d);
> +
> +	writel(BIT(irqd_to_hwirq(d)), port->base + GEDR);
> +}
> +

spacemit_irq_mask()

> +static void spacemit_mask_muxed_gpio(struct irq_data *d)
> +{
> +	struct spacemit_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 bit = BIT(irqd_to_hwirq(d));
> +
> +	port->irq_mask &= ~bit;
> +

As I said earlier, I think you should just open-code the two
writes done by the next function.

> +	spacemit_clear_edge_detection(port, bit);
> +}
> +

spacemit_irq_unmask()

> +static void spacemit_unmask_muxed_gpio(struct irq_data *d)
> +{
> +	struct spacemit_gpio_port *port = irq_data_get_irq_chip_data(d);
> +	u32 bit = BIT(irqd_to_hwirq(d));
> +
> +	port->irq_mask |= bit;
> +

Open-code this call too.

> +	spacemit_set_edge_detection(port, bit);
> +}
> +
> +static void spacemit_irq_print_chip(struct irq_data *data, struct seq_file *p)
> +{
> +	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
> +	struct spacemit_gpio_port *port = to_spacemit_gpio_port(gc);
> +
> +	seq_printf(p, "%s-%d", dev_name(gc->parent), port->index);
> +}
> +
> +static struct irq_chip spacemit_muxed_gpio_chip = {
> +	.name		= "k1-gpio-irqchip",
> +	.irq_ack	= spacemit_ack_muxed_gpio,
> +	.irq_mask	= spacemit_mask_muxed_gpio,
> +	.irq_unmask	= spacemit_unmask_muxed_gpio,
> +	.irq_set_type	= spacemit_gpio_irq_type,
> +	.irq_print_chip	= spacemit_irq_print_chip,
> +	.flags		= IRQCHIP_IMMUTABLE,
> +	GPIOCHIP_IRQ_RESOURCE_HELPERS,
> +};
> +
> +static int spacemit_gpio_get_ports(struct device *dev, struct spacemit_gpio *gpio,
> +				   void __iomem *regs)
> +{
> +	struct spacemit_gpio_port *port;
> +	u32 i = 0, offset;
> +
> +	gpio->nr_ports = device_get_child_node_count(dev);
> +	if (gpio->nr_ports == 0)
> +		return -ENODEV;
> +
> +	gpio->ports = devm_kcalloc(dev, gpio->nr_ports, sizeof(*gpio->ports), GFP_KERNEL);
> +	if (!gpio->ports)
> +		return -ENOMEM;
> +
> +	device_for_each_child_node_scoped(dev, fwnode)  {

Make sure i never exceeds gpio->nr_ports.

> +		port		= &gpio->ports[i];
> +		port->fwnode	= fwnode;
> +		port->index	= i++;
> +
> +		if (fwnode_property_read_u32(fwnode, "reg", &offset))
> +			return -EINVAL;
> +
> +		port->base	= regs + offset;
> +		port->irq	= fwnode_irq_get(fwnode, 0);
> +	}
> +
> +	return 0;
> +}
> +
> +static int spacemit_gpio_add_port(struct spacemit_gpio *gpio, int index)
> +{
> +	struct spacemit_gpio_port *port;
> +	struct device *dev = gpio->dev;
> +	struct gpio_irq_chip *girq;
> +	void __iomem *dat, *set, *clr, *dirin, *dirout;
> +	int ret;
> +
> +	port = &gpio->ports[index];
> +	port->gpio = gpio;
> +
> +	dat	= port->base + GPLR;
> +	set	= port->base + GPSR;
> +	clr	= port->base + GPCR;
> +	dirin	= port->base + GCDR;
> +	dirout	= port->base + GSDR;
> +
> +	/* This registers 32 GPIO lines per port */
> +	ret = bgpio_init(&port->gc, dev, 4, dat, set, clr, dirout, dirin,
> +			 BGPIOF_UNREADABLE_REG_SET | BGPIOF_UNREADABLE_REG_DIR);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to init gpio chip for port\n");
> +
> +	port->gc.label		= dev_name(dev);
> +	port->gc.fwnode		= port->fwnode;
> +	port->gc.request	= gpiochip_generic_request;
> +	port->gc.free		= gpiochip_generic_free;
> +	port->gc.ngpio		= K1_BANK_GPIO_NUMBER;
> +	port->gc.base		= -1;
> +
> +	girq			= &port->gc.irq;
> +	girq->threaded		= true;
> +	girq->handler		= handle_simple_irq;
> +
> +	gpio_irq_chip_set_chip(girq, &spacemit_muxed_gpio_chip);
> +
> +	spacemit_reset_edge_detection(port);
> +

I *think* you should call devm_gpiochip_add_data() *before*
you register the interrupt handler, because conceivably an
interrupt could fire the instant it's registered.  Maybe it
doesn't matter though.

					-Alex

> +	ret = devm_request_threaded_irq(dev, port->irq, NULL,
> +					spacemit_gpio_irq_handler,
> +					IRQF_ONESHOT | IRQF_SHARED,
> +					port->gc.label, port);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "failed to request IRQ\n");
> +
> +	return devm_gpiochip_add_data(dev, &port->gc, port);
> +}
> +
> +static int spacemit_gpio_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct spacemit_gpio *gpio;
> +	struct resource *res;
> +	void __iomem *regs;
> +	int i, ret;
> +
> +	gpio = devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
> +	if (!gpio)
> +		return -ENOMEM;
> +
> +	gpio->dev = dev;
> +
> +	regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(regs))
> +		return PTR_ERR(regs);
> +
> +	ret = spacemit_gpio_get_ports(dev, gpio, regs);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "fail to get gpio ports\n");
> +
> +	for (i = 0; i < gpio->nr_ports; i++) {
> +		ret = spacemit_gpio_add_port(gpio, i);
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


