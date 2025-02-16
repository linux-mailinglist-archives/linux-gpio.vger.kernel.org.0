Return-Path: <linux-gpio+bounces-16070-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFD7A37445
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Feb 2025 13:56:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 246E5188C5AD
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Feb 2025 12:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23679191499;
	Sun, 16 Feb 2025 12:56:20 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0971519B4;
	Sun, 16 Feb 2025 12:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739710580; cv=none; b=I74IZBlHSd6nzb4O9DUxIUzvfczGd7RxYwdWoEZG3DtFzRdl3Nci/9YPyDozmozXqKnD7Z2QjW5LVte5y7Nslr6xssmSgmsjwes7HOGqUPY2kL2KFM5aPtgpUVoL5Gd5xQb5lrfGwqiapEYu0K1iUh7KEGnq7cMgUqg12ee4r5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739710580; c=relaxed/simple;
	bh=IluO3fm46uzNOm4O1i7QNvpAIOwjjDH4LPr0ur8tJPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hBEgWzti9Wdg6rmOGF+BOQOe589sSa7FmShIOlraLjzxbCzrVI3AoFsGBX7pMo5VQmQ9lfkch2dkuvH86aF6qL8Yh4kR7NpyWiPi9XTcopx9wS80lDCmO4bXSOAHaXW7C0yKGNfR+UcBQGjtLkJZogxF/jLKZK2IgVsS9CcH50A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from localhost (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 56E86342FED;
	Sun, 16 Feb 2025 12:56:14 +0000 (UTC)
Date: Sun, 16 Feb 2025 12:56:01 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
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
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 2/4] gpio: spacemit: add support for K1 SoC
Message-ID: <20250216125601-GYA23642@gentoo>
References: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
 <20250121-03-k1-gpio-v4-2-4641c95c0194@gentoo.org>
 <0133988a-b0d9-4451-b06c-480dd7f559cd@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0133988a-b0d9-4451-b06c-480dd7f559cd@riscstar.com>

Hi Alex:

thanks for your fully review

On 15:11 Sat 15 Feb     , Alex Elder wrote:
> On 1/20/25 9:38 PM, Yixun Lan wrote:
> > Implement GPIO functionality which capable of setting pin as
> > input, output. Also, each pin can be used as interrupt which
> > support rising, failing, or both edge type trigger.
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> 
> It sounds like the hardware will be modeled in DTS with
> explicit banks, which makes sense.  The hardware looks like:
> 
>      GPIO controller ---> bank0 --> GPIOs 0..31
>                      |
>                      |--> bank1 --> GPIOs 0..31
>                      |
>                      |--> bank2 --> GPIOs 0..31
>                      |
>                      ---> bank3 --> GPIOs 0..31
> 
> Each bank has its own set of 15 registers, but all are managed
> by the same controller (driver instance).
> 
Yes, this is the hardware, the driver will populate each bank with one gpio chip

and notice that, we've got some comments from DT maintainer that it's better to
fold children nodes into parent and switch to three cells gpio node.
see following link for more detail discussion
https://lore.kernel.org/all/CACRpkdZYYZ5tUR4gJXuCrix0k56rPPB2TUGP3KpwqMgjs_Vd5w@mail.gmail.com/

so, probably I will massively re-construct this driver in next version...

> Anyway, I'm going to comment on just the code...
> 
> > ---
> >   drivers/gpio/Kconfig            |   7 +
> >   drivers/gpio/Makefile           |   1 +
> >   drivers/gpio/gpio-spacemit-k1.c | 295 ++++++++++++++++++++++++++++++++++++++++
> >   3 files changed, 303 insertions(+)
> > 
> > diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> > index 56fee58e281e7cac7f287eb04e4c17a17f75ed04..c153f5439649da020ee42c38e88cb8df31a8e307 100644
> > --- a/drivers/gpio/Kconfig
> > +++ b/drivers/gpio/Kconfig
> > @@ -654,6 +654,13 @@ config GPIO_SNPS_CREG
> >   	  where only several fields in register belong to GPIO lines and
> >   	  each GPIO line owns a field with different length and on/off value.
> >   
> > +config GPIO_SPACEMIT_K1
> > +	bool "SPACEMIT K1 GPIO support"
> > +	depends on ARCH_SPACEMIT || COMPILE_TEST
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
> > index 0000000000000000000000000000000000000000..de0491af494c10f528095efee9b3a140bdcc0b0d
> > --- /dev/null
> > +++ b/drivers/gpio/gpio-spacemit-k1.c
> > @@ -0,0 +1,295 @@
> > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > +/*
> > + * Copyright (C) 2023-2025 SpacemiT (Hangzhou) Technology Co. Ltd
> > + * Copyright (c) 2025 Yixun Lan <dlan@gentoo.org>
> > + */
> > +
> > +#include <linux/io.h>
> > +#include <linux/init.h>
> > +#include <linux/irq.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/gpio/driver.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/property.h>
> > +#include <linux/seq_file.h>
> > +#include <linux/module.h>
> > +
> > +/* register offset */
> 
> Please add one-line comments explaining the purpose of these registers.
> I explain my understanding below but you can maybe shorten it and add
> something to the right of each definition.
> 
I didn't consider to add comments in the first place, it's kind of tedious,
 also it will mostly duplicate what in the docs from spacemit

but I can do this, I will try to come up with a short version,
if it's not enough, then people can always consult the documentation

> > +#define GPLR		0x00
> 
> Current port (or pin?) level (port value, regardless of in or out) (r)
> 
#define GPLR               0x00	/* GPIO port level register */

> > +#define GPDR		0x0c
> 
> Current port direction (clear/0 = in, set/1 = out) (r)
> This is currently never used.
> 
#define GPDR               0x0c /* GPIO port direction register - R/W */

> > +#define GPSR		0x18
> 
> Set port value (set output level high for any set bits) (w)
> 
#define GPSR               0x18	/* GPIO port set register - W */
> > +#define GPCR		0x24
> 
> Clear port value (set output level low for any set bits) (w)
#define GPCR               0x24 /* GPIO port clear register - W */
> 
..
> > +#define GRER		0x30
> 
> Ports configured for rising edge detect (r)
> This is currently never used.
> 
#define GRER               0x30 /* GPIO port rising edge register R/W */
> > +#define GFER		0x3c
> 
> Ports configured for falling edge detect (r)
> This is currently never used.
> 
#define GFER               0x3c /* GPIO port falling edge register R/W */

No, the above two registers are not used, as I think it's has duplicated functionality
 with GSRER, GCRER, GSFER, GCFER

but, I don't know why the hw design like this, may need more clarification from vendor
the code from vendor also doesn't touch these two registers
from my testing, the GPIO interrupt's rising/falling edge trigger works fine without them

> > +#define GEDR		0x48
> 
> Edge detect status register (set bits indicate edge detected) (r/w)
> 
#define GEDR               0x48 /* GPIO Edge Detect Status Registers - R/W1C */

> > +#define GSDR		0x54
> 
> Set port direction (set bits indicate output pins) (w)
> 
#define GSDR               0x54 /*  GPIO (set) Direction Registers - W */

> > +#define GCDR		0x60
> 
> Clear port direction (set bits indicate input pins) (w)
> 
#define GCDR               0x60 /* GPIO (clear) Direction Registers - W */
> > +#define GSRER		0x6c
> 
> Enable rising edge detect (set bits indicate rising edge detect) (w)
> 
#define GSRER              0x6c /* GPIO (set) rising edge detect enable register - W */


> > +#define GCRER		0x78
> 
> Disable rising edge detect (w)
> 
#define GCRER              0x78 /* GPIO (clear) rising edge detect enable register - W */

> > +#define GSFER		0x84
> 
> Enable falling edge detect (set bits indicate falling edge detect) (w)
> 

#define GSFER              0x84 /* GPIO (set) falling edge detect enable register - W */

> > +#define GCFER		0x90
> 
> Disable falling edge detect (w)
> 
#define GCFER              0x90 /* GPIO (clear) falling edge detect enable register - W */

> > +#define GAPMASK		0x9c
> 
> I don't know what this is.  You write it with ~0 after you
> clear both rising and falling edge detection on all 32 pins.
> 
I haven't found documentation from spacemit's web, just copied the logic from vendor code..

from my understanding (best guess), it's the mask bit to AP (application processor)
writing 1 should enable GPIO interrupt functionality to AP?

> > +#define GCPMASK		0xa8
> 
> I don't know what this is.  It's currently never used.
> 
my guess, it's used to mask bits to disable interrupt to AP? 
since we don't need to do this, so not used 

> > +
> > +#define K1_BANK_GPIO_NUMBER	(32)
> 
> No need for parentheses around a simple constant.
> 
Ok

> > +
> > +#define to_spacemit_gpio_port(x) container_of((x), struct spacemit_gpio_port, gc)
> > +
> > +struct spacemit_gpio;
> > +
> 
> I might just not understand what a "port" means in this context
> (I think here it represents a "bank" of 32 GPIOs.)  Based on the
> DT discussion it seems like your structures might change, and
> I'd like to know what you'll call them.
> 
> Here are terms I'll use:  There will be a top-level "controller"
> structure which will be able to access four distinct "banks",
> each of which has 32 "ports".
> 
what I mean is "ports == banks", but after looking at docs and take your suggestion here,
we'd might better rename "ports" to "banks"

> > +struct spacemit_gpio_port {
> > +	struct gpio_chip		gc;
> > +	struct spacemit_gpio		*gpio;
> > +	struct fwnode_handle		*fwnode;
> > +	void __iomem			*base;
> > +	int				irq;
> > +	u32				irq_mask;
> > +	u32				irq_rising_edge;
> > +	u32				irq_falling_edge;
> > +	u32				index;
> > +};
> > +
> > +struct spacemit_gpio {
> > +	struct	device			*dev;
> > +	struct spacemit_gpio_port	*ports;
> > +	u32				nr_ports;
> > +};
> > +
> 
> Basically all of the write registers allow you to specify an
> entire mask of bits, where the register write changes the
> state of every port in a bank whose corresponding bit is set.
yes, these registers are only able to W1 (write), not readable,
also write 0 takes no effect

> That capability is probably worth exposing, even though the
> driver currently doesn't use it.
> 
no idea how to expose, or where it can be used..

> Meanwhile, most (maybe all) of your functions are only used
> to update the state of a single port in a bank.
> 
right

> I think the argument names should distinguish these two cases.
> I find the argument name "bit" (which now represents a 32-bit
> mask with only one bit set) to be ambiguous.
> 
> If exactly one port is affected, maybe its number (0-31) can
> be passed as the argument.  But where multiple ports in a
> bank can be affected by the same operation, pass a "mask".
> 
I got your idea, and I will see what I can do..

> > +static inline void spacemit_clear_edge_detection(struct spacemit_gpio_port *port, u32 bit)
> > +{
> 
> I'd do:
> 	if (bit & port->irq_rising_edge)
> 		writel(bit, port->base + GSRER);
> 
Ok, strictly we can add extra checking

> (And similar below, and in spacemit_set_edge_detection().)
> 
> > +	writel(bit, port->base + GCRER);
> > +	writel(bit, port->base + GCFER);
> > +}
> > +
> 
> Two comments about the function above and the next one:
> - I think their names should be about masking IRQs, not about
>    edge detection.
> - Each is called only once, and they're trivial enough that I
>    don't think encapsulating them in a function adds any value.
>    Just open-code them where they're used.
> 
I thought giving a function name would make it more readable,
it shouldn't bring extra price as compiler will inline it

but, I'm open mind with this, "open-code + one line comment" is also fine

> > +static inline void spacemit_set_edge_detection(struct spacemit_gpio_port *port, u32 bit)
> > +{
> > +	writel(bit & port->irq_rising_edge,  port->base + GSRER);
> > +	writel(bit & port->irq_falling_edge, port->base + GSFER);
> > +}
> > +
> 
> This is used to disable IRQ generation on all ports in a bank.
> I would offer the same two comments about this function as I
> gave above.
> 
ok

> > +static inline void spacemit_reset_edge_detection(struct spacemit_gpio_port *port)
> > +{
> > +	writel(0xffffffff, port->base + GCFER);
> > +	writel(0xffffffff, port->base + GCRER);
> > +	writel(0xffffffff, port->base + GAPMASK);
> > +
> 
> Use names that align with the callback function names.  I.e.,
> this should be spacemit_irq_set_type().
> 
ok
> > +static int spacemit_gpio_irq_type(struct irq_data *d, unsigned int type)
> > +{
> > +	struct spacemit_gpio_port *port = irq_data_get_irq_chip_data(d);
> > +	u32 bit = BIT(irqd_to_hwirq(d));
> > +
> > +	if (type & IRQ_TYPE_EDGE_RISING) {
> > +		port->irq_rising_edge |= bit;
> 
> Here too, maybe avoid doing the write if the bit was already
> set in the rising edge mask.
> 
I thought it's tedious to do extra checking.. kind of unnecessary
making the mask bit match underlying hw write operation is more intuitive

> > +		writel(bit, port->base + GSRER);
> > +	} else {
> > +		port->irq_rising_edge &= ~bit;
> > +		writel(bit, port->base + GCRER);
> > +	}
> > +
> > +	if (type & IRQ_TYPE_EDGE_FALLING) {
> > +		port->irq_falling_edge |= bit;
> > +		writel(bit, port->base + GSFER);
> > +	} else {
> > +		port->irq_falling_edge &= ~bit;
> > +		writel(bit, port->base + GCFER);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static irqreturn_t spacemit_gpio_irq_handler(int irq, void *dev_id)
> > +{
> > +	struct spacemit_gpio_port *port = dev_id;
> > +	unsigned long pending;
> > +	u32 n, gedr;
> > +
> > +	gedr = readl(port->base + GEDR);
> > +	if (!gedr)
> > +		return IRQ_NONE;
> > +
> > +	writel(gedr, port->base + GEDR);
> 
> I'd have the blank line here, instead of above the writel().
> 
ok

> > +	gedr = gedr & port->irq_mask;
> 
> 	pending = gedr & port->irq_mask;
> 	if (!pending)
> 
> > +
> > +	if (!gedr)
> > +		return IRQ_NONE;
> > +
> > +	pending = gedr;
> > +
> > +	for_each_set_bit(n, &pending, BITS_PER_LONG)
> > +		handle_nested_irq(irq_find_mapping(port->gc.irq.domain, n));
> > +
> > +	return IRQ_HANDLED;
> > +}
> > +
> 
> I don't think "muxed" is necessary in these names.  Just call
> this spacemit_irq_ack().
> 
ok
> > +static void spacemit_ack_muxed_gpio(struct irq_data *d)
> > +{
> > +	struct spacemit_gpio_port *port = irq_data_get_irq_chip_data(d);
> > +
> > +	writel(BIT(irqd_to_hwirq(d)), port->base + GEDR);
> > +}
> > +
> 
> spacemit_irq_mask()
> 
ok
> > +static void spacemit_mask_muxed_gpio(struct irq_data *d)
> > +{
> > +	struct spacemit_gpio_port *port = irq_data_get_irq_chip_data(d);
> > +	u32 bit = BIT(irqd_to_hwirq(d));
> > +
> > +	port->irq_mask &= ~bit;
> > +
> 
> As I said earlier, I think you should just open-code the two
> writes done by the next function.
> 
ok
> > +	spacemit_clear_edge_detection(port, bit);
> > +}
> > +
> 
> spacemit_irq_unmask()
> 
ok
> > +static void spacemit_unmask_muxed_gpio(struct irq_data *d)
> > +{
> > +	struct spacemit_gpio_port *port = irq_data_get_irq_chip_data(d);
> > +	u32 bit = BIT(irqd_to_hwirq(d));
> > +
> > +	port->irq_mask |= bit;
> > +
> 
> Open-code this call too.
> 
ok
> > +	spacemit_set_edge_detection(port, bit);
> > +}
> > +
> > +static void spacemit_irq_print_chip(struct irq_data *data, struct seq_file *p)
> > +{
> > +	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
> > +	struct spacemit_gpio_port *port = to_spacemit_gpio_port(gc);
> > +
> > +	seq_printf(p, "%s-%d", dev_name(gc->parent), port->index);
> > +}
> > +
> > +static struct irq_chip spacemit_muxed_gpio_chip = {
> > +	.name		= "k1-gpio-irqchip",
> > +	.irq_ack	= spacemit_ack_muxed_gpio,
> > +	.irq_mask	= spacemit_mask_muxed_gpio,
> > +	.irq_unmask	= spacemit_unmask_muxed_gpio,
> > +	.irq_set_type	= spacemit_gpio_irq_type,
> > +	.irq_print_chip	= spacemit_irq_print_chip,
> > +	.flags		= IRQCHIP_IMMUTABLE,
> > +	GPIOCHIP_IRQ_RESOURCE_HELPERS,
> > +};
> > +
> > +static int spacemit_gpio_get_ports(struct device *dev, struct spacemit_gpio *gpio,
> > +				   void __iomem *regs)
> > +{
> > +	struct spacemit_gpio_port *port;
> > +	u32 i = 0, offset;
> > +
> > +	gpio->nr_ports = device_get_child_node_count(dev);
> > +	if (gpio->nr_ports == 0)
> > +		return -ENODEV;
> > +
> > +	gpio->ports = devm_kcalloc(dev, gpio->nr_ports, sizeof(*gpio->ports), GFP_KERNEL);
> > +	if (!gpio->ports)
> > +		return -ENOMEM;
> > +
> > +	device_for_each_child_node_scoped(dev, fwnode)  {
> 
> Make sure i never exceeds gpio->nr_ports.
> 
Ok, will see, as this function need to refactor

> > +		port		= &gpio->ports[i];
> > +		port->fwnode	= fwnode;
> > +		port->index	= i++;
> > +
> > +		if (fwnode_property_read_u32(fwnode, "reg", &offset))
> > +			return -EINVAL;
> > +
> > +		port->base	= regs + offset;
> > +		port->irq	= fwnode_irq_get(fwnode, 0);
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int spacemit_gpio_add_port(struct spacemit_gpio *gpio, int index)
> > +{
> > +	struct spacemit_gpio_port *port;
> > +	struct device *dev = gpio->dev;
> > +	struct gpio_irq_chip *girq;
> > +	void __iomem *dat, *set, *clr, *dirin, *dirout;
> > +	int ret;
> > +
> > +	port = &gpio->ports[index];
> > +	port->gpio = gpio;
> > +
> > +	dat	= port->base + GPLR;
> > +	set	= port->base + GPSR;
> > +	clr	= port->base + GPCR;
> > +	dirin	= port->base + GCDR;
> > +	dirout	= port->base + GSDR;
> > +
> > +	/* This registers 32 GPIO lines per port */
> > +	ret = bgpio_init(&port->gc, dev, 4, dat, set, clr, dirout, dirin,
> > +			 BGPIOF_UNREADABLE_REG_SET | BGPIOF_UNREADABLE_REG_DIR);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "failed to init gpio chip for port\n");
> > +
> > +	port->gc.label		= dev_name(dev);
> > +	port->gc.fwnode		= port->fwnode;
> > +	port->gc.request	= gpiochip_generic_request;
> > +	port->gc.free		= gpiochip_generic_free;
> > +	port->gc.ngpio		= K1_BANK_GPIO_NUMBER;
> > +	port->gc.base		= -1;
> > +
> > +	girq			= &port->gc.irq;
> > +	girq->threaded		= true;
> > +	girq->handler		= handle_simple_irq;
> > +
> > +	gpio_irq_chip_set_chip(girq, &spacemit_muxed_gpio_chip);
> > +
> > +	spacemit_reset_edge_detection(port);
> > +
> 
> I *think* you should call devm_gpiochip_add_data() *before*
> you register the interrupt handler, because conceivably an
> interrupt could fire the instant it's registered.  Maybe it
> doesn't matter though.
> 
good point, I will check this, we probably better to enable(unmask) interrupt
 after all registration is done

> 					-Alex
> 
> > +	ret = devm_request_threaded_irq(dev, port->irq, NULL,
> > +					spacemit_gpio_irq_handler,
> > +					IRQF_ONESHOT | IRQF_SHARED,
> > +					port->gc.label, port);
> > +	if (ret < 0)
> > +		return dev_err_probe(dev, ret, "failed to request IRQ\n");
> > +
> > +	return devm_gpiochip_add_data(dev, &port->gc, port);
> > +}
> > +
> > +static int spacemit_gpio_probe(struct platform_device *pdev)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct spacemit_gpio *gpio;
> > +	struct resource *res;
> > +	void __iomem *regs;
> > +	int i, ret;
> > +
> > +	gpio = devm_kzalloc(dev, sizeof(*gpio), GFP_KERNEL);
> > +	if (!gpio)
> > +		return -ENOMEM;
> > +
> > +	gpio->dev = dev;
> > +
> > +	regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> > +	if (IS_ERR(regs))
> > +		return PTR_ERR(regs);
> > +
> > +	ret = spacemit_gpio_get_ports(dev, gpio, regs);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "fail to get gpio ports\n");
> > +
> > +	for (i = 0; i < gpio->nr_ports; i++) {
> > +		ret = spacemit_gpio_add_port(gpio, i);
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

