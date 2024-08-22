Return-Path: <linux-gpio+bounces-8964-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF3995AA96
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 03:37:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0EE991C212D4
	for <lists+linux-gpio@lfdr.de>; Thu, 22 Aug 2024 01:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 493BF2033A;
	Thu, 22 Aug 2024 01:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="aT0jJvXv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1037922612;
	Thu, 22 Aug 2024 01:31:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724290321; cv=none; b=Lspll3NH1RJtkFCEoO/MDgNS9AGDdPbh4xng17lrH1bgncHgeCBJWV/VOk1POlKYMIuj0C0urjIgqr7vvWsWZd0Aq0e3P4hQK1uYzXpRw5LrZ7I5Y1Ks4bBKF/nEzrv5NQDizpghbTnL1btudkTEYY724N89APtF9dET2fXF0+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724290321; c=relaxed/simple;
	bh=j5Nc0pJd5jUcWhgvQ2u0neRS/L8LWUJXmBKB3uViV6Y=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c7h7oMATP/KQJqVispvrHGGMVPtZIz1HQwqTKZSkNyGhuZS9qVp2Y9/oHjVWHADh+kp23IRi7W26YI4vi1bQb1BauprXpWYmgEjjodH2shCfv58se2JuqS6sbJ9tGMEGORs1mwiMgik2zryKNFC4tCv7hopGuGnKBQ39yhpP5kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=aT0jJvXv; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1724290310;
	bh=RdBjx8zM7Bei92JtF4bpwAxnNG4U943ILkVbMCOrzJI=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=aT0jJvXvdky1gBXeIITcSOeW67Vy54omBaTCmlX4cz7mIxhafBnxb18sugmT3Xd5a
	 IGNeJMRVFCKdaD78RZu4bL8lH0fkWL1InQ/4aW/7x1B9snnWyZkt4ux1YcAQPr2JAH
	 f70eYMWyqPBVeWGqmpb62LNA3qiimDBTenIfwCa/MKfUc20FCXeu4DxQ/p5sgBN6uN
	 /jHSGLLL7hlx6bJpKNbl0nihg7CcAKwa20PEnMDfoaxu5fOOOyBF7fOSaWeK+oDbfG
	 gj5MJuFodw4SeIBuIy4gXENsLa+j0UvWxjh+N5W6R0qupaOlbKFhSgTPns8GYq+UhQ
	 II6AXl/BmxiNQ==
Received: from [192.168.68.112] (ppp118-210-185-99.adl-adc-lon-bras34.tpg.internode.on.net [118.210.185.99])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 041E964FDD;
	Thu, 22 Aug 2024 09:31:45 +0800 (AWST)
Message-ID: <cf92b3ab4b171e7c7c07cada066dad6323c5dace.camel@codeconstruct.com.au>
Subject: Re: [PATCH v1 2/2] gpio: Add G7 Aspeed gpio controller driver
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org, 
	brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com
Date: Thu, 22 Aug 2024 11:01:43 +0930
In-Reply-To: <20240821070740.2378602-3-billy_tsai@aspeedtech.com>
References: <20240821070740.2378602-1-billy_tsai@aspeedtech.com>
	 <20240821070740.2378602-3-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Billy,

On Wed, 2024-08-21 at 15:07 +0800, Billy Tsai wrote:
> In the 7th generation of the SoC from Aspeed, the control logic of the
> GPIO controller has been updated to support per-pin control. Each pin now
> has its own 32-bit register, allowing for individual control of the pin=
=E2=80=99s
> value, direction, interrupt type, and other settings.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/gpio/Kconfig          |   7 +
>  drivers/gpio/Makefile         |   1 +
>  drivers/gpio/gpio-aspeed-g7.c | 831 ++++++++++++++++++++++++++++++++++
>  3 files changed, 839 insertions(+)
>  create mode 100644 drivers/gpio/gpio-aspeed-g7.c
>=20
> diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
> index 58f43bcced7c..93f237429b92 100644
> --- a/drivers/gpio/Kconfig
> +++ b/drivers/gpio/Kconfig
> @@ -172,6 +172,13 @@ config GPIO_ASPEED
>  	help
>  	  Say Y here to support Aspeed AST2400 and AST2500 GPIO controllers.
> =20
> +config GPIO_ASPEED_G7
> +	tristate "Aspeed G7 GPIO support"
> +	depends on (ARCH_ASPEED || COMPILE_TEST) && OF_GPIO
> +	select GPIOLIB_IRQCHIP
> +	help
> +	  Say Y here to support Aspeed AST2700 GPIO controllers.
> +
>  config GPIO_ASPEED_SGPIO
>  	bool "Aspeed SGPIO support"
>  	depends on (ARCH_ASPEED || COMPILE_TEST) && OF_GPIO
> diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
> index 64dd6d9d730d..e830291761ee 100644
> --- a/drivers/gpio/Makefile
> +++ b/drivers/gpio/Makefile
> @@ -34,6 +34,7 @@ obj-$(CONFIG_GPIO_AMD_FCH)		+=3D gpio-amd-fch.o
>  obj-$(CONFIG_GPIO_AMDPT)		+=3D gpio-amdpt.o
>  obj-$(CONFIG_GPIO_ARIZONA)		+=3D gpio-arizona.o
>  obj-$(CONFIG_GPIO_ASPEED)		+=3D gpio-aspeed.o
> +obj-$(CONFIG_GPIO_ASPEED_G7)		+=3D gpio-aspeed-g7.o
>  obj-$(CONFIG_GPIO_ASPEED_SGPIO)		+=3D gpio-aspeed-sgpio.o
>  obj-$(CONFIG_GPIO_ATH79)		+=3D gpio-ath79.o
>  obj-$(CONFIG_GPIO_BCM_KONA)		+=3D gpio-bcm-kona.o
> diff --git a/drivers/gpio/gpio-aspeed-g7.c b/drivers/gpio/gpio-aspeed-g7.=
c
> new file mode 100644
> index 000000000000..dbca097de6ea
> --- /dev/null
> +++ b/drivers/gpio/gpio-aspeed-g7.c
> @@ -0,0 +1,831 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright 2024 Aspeed Technology Inc.
> + *
> + * Billy Tsai <billy_tsai@aspeedtech.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/gpio/aspeed.h>

I think you should either drop this include or rework the existing
implementations so the coprocessor handshake works correctly.

> +#include <linux/gpio/driver.h>
> +#include <linux/hashtable.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/platform_device.h>
> +#include <linux/seq_file.h>
> +#include <linux/spinlock.h>
> +#include <linux/string.h>
> +
> +#include <asm/div64.h>
> +
> +#define GPIO_G7_IRQ_STS_BASE 0x100
> +#define GPIO_G7_IRQ_STS_OFFSET(x) (GPIO_G7_IRQ_STS_BASE + (x) * 0x4)
> +#define GPIO_G7_CTRL_REG_BASE 0x180
> +#define GPIO_G7_CTRL_REG_OFFSET(x) (GPIO_G7_CTRL_REG_BASE + (x) * 0x4)
> +#define GPIO_G7_OUT_DATA BIT(0)
> +#define GPIO_G7_DIR BIT(1)
> +#define GPIO_G7_IRQ_EN BIT(2)
> +#define GPIO_G7_IRQ_TYPE0 BIT(3)
> +#define GPIO_G7_IRQ_TYPE1 BIT(4)
> +#define GPIO_G7_IRQ_TYPE2 BIT(5)
> +#define GPIO_G7_RST_TOLERANCE BIT(6)
> +#define GPIO_G7_DEBOUNCE_SEL GENMASK(8, 7)
> +#define GPIO_G7_INPUT_MASK BIT(9)
> +#define GPIO_G7_IRQ_STS BIT(12)
> +#define GPIO_G7_IN_DATA BIT(13)

Can you please add `CTRL` into these field macro names so it's clear
they relate to the control register?

> +/*
> + * The configuration of the following registers should be determined
> + * outside of the GPIO driver.

Where though?

> + */
> +#define GPIO_G7_PRIVILEGE_W_REG_BASE 0x810
> +#define GPIO_G7_PRIVILEGE_W_REG_OFFSET(x) (GPIO_G7_PRIVILEGE_W_REG_BASE =
+ ((x) >> 2) * 0x4)
> +#define GPIO_G7_PRIVILEGE_R_REG_BASE 0x910
> +#define GPIO_G7_PRIVILEGE_R_REG_OFFSET(x) (GPIO_G7_PRIVILEGE_R_REG_BASE =
+ ((x) >> 2) * 0x4)
> +#define GPIO_G7_IRQ_TARGET_REG_BASE 0xA10
> +#define GPIO_G7_IRQ_TARGET_REG_OFFSET(x) (GPIO_G7_IRQ_TARGET_REG_BASE + =
((x) >> 2) * 0x4)
> +#define GPIO_G7_IRQ_TO_INTC2_18 BIT(0)
> +#define GPIO_G7_IRQ_TO_INTC2_19 BIT(1)
> +#define GPIO_G7_IRQ_TO_INTC2_20 BIT(2)
> +#define GPIO_G7_IRQ_TO_SIO BIT(3)
> +#define GPIO_G7_IRQ_TARGET_RESET_TOLERANCE BIT(6)
> +#define GPIO_G7_IRQ_TARGET_W_PROTECT BIT(7)
> +
> +static inline u32 field_get(u32 _mask, u32 _val)
> +{
> +	return (((_val) & (_mask)) >> (ffs(_mask) - 1));
> +}
> +
> +static inline u32 field_prep(u32 _mask, u32 _val)
> +{
> +	return (((_val) << (ffs(_mask) - 1)) & (_mask));
> +}

So linux/bitfield.h provides a lot of APIs along these lines, perhaps
use them instead?

> +
> +static inline void ast_write_bits(void __iomem *addr, u32 mask, u32 val)
> +{
> +	iowrite32((ioread32(addr) & ~(mask)) | field_prep(mask, val), addr);
> +}
> +
> +static inline void ast_clr_bits(void __iomem *addr, u32 mask)
> +{
> +	iowrite32((ioread32(addr) & ~(mask)), addr);
> +}
> +
> +struct aspeed_bank_props {
> +	unsigned int bank;
> +	u32 input;
> +	u32 output;
> +};
> +
> +struct aspeed_gpio_g7_config {
> +	unsigned int nr_gpios;
> +	const struct aspeed_bank_props *props;
> +};
> +
> +/*
> + * @offset_timer: Maps an offset to an @timer_users index, or zero if di=
sabled
> + * @timer_users: Tracks the number of users for each timer
> + *
> + * The @timer_users has four elements but the first element is unused. T=
his is
> + * to simplify accounting and indexing, as a zero value in @offset_timer
> + * represents disabled debouncing for the GPIO. Any other value for an e=
lement
> + * of @offset_timer is used as an index into @timer_users. This behaviou=
r of
> + * the zero value aligns with the behaviour of zero built from the timer
> + * configuration registers (i.e. debouncing is disabled).
> + */
> +struct aspeed_gpio_g7 {
> +	struct gpio_chip chip;
> +	struct device *dev;
> +	raw_spinlock_t lock;
> +	void __iomem *base;
> +	int irq;
> +	const struct aspeed_gpio_g7_config *config;
> +
> +	u8 *offset_timer;
> +	unsigned int timer_users[4];
> +	struct clk *clk;
> +
> +	u32 *dcache;
> +};
> +
> +/*
> + * Note: The "value" register returns the input value sampled on the
> + *       line even when the GPIO is configured as an output. Since
> + *       that input goes through synchronizers, writing, then reading
> + *       back may not return the written value right away.
> + *
> + *       The "rdata" register returns the content of the write latch
> + *       and thus can be used to read back what was last written
> + *       reliably.
> + */
> +
> +static const int debounce_timers[4] =3D { 0x00, 0x04, 0x00, 0x08 };

This is all largely copy/pasted from gpio-aspeed.c. Can we split it out
and share the definitions?

> +
> +#define GPIO_BANK(x) ((x) >> 5)
> +#define GPIO_OFFSET(x) ((x) & 0x1f)
> +#define GPIO_BIT(x) BIT(GPIO_OFFSET(x))
> +
> +static inline bool is_bank_props_sentinel(const struct aspeed_bank_props=
 *props)
> +{
> +	return !(props->input || props->output);
> +}
> +
> +static inline const struct aspeed_bank_props *find_bank_props(struct asp=
eed_gpio_g7 *gpio,
> +							      unsigned int offset)
> +{
> +	const struct aspeed_bank_props *props =3D gpio->config->props;
> +
> +	while (!is_bank_props_sentinel(props)) {
> +		if (props->bank =3D=3D GPIO_BANK(offset))
> +			return props;
> +		props++;
> +	}
> +
> +	return NULL;
> +}
> +
> +static inline bool have_gpio(struct aspeed_gpio_g7 *gpio, unsigned int o=
ffset)
> +{
> +	const struct aspeed_bank_props *props =3D find_bank_props(gpio, offset)=
;
> +
> +	if (offset > gpio->chip.ngpio)
> +		return false;
> +
> +	return (!props || ((props->input | props->output) & GPIO_BIT(offset)));
> +}
> +
> +static inline bool have_input(struct aspeed_gpio_g7 *gpio, unsigned int =
offset)
> +{
> +	const struct aspeed_bank_props *props =3D find_bank_props(gpio, offset)=
;
> +
> +	return !props || (props->input & GPIO_BIT(offset));
> +}
> +
> +#define have_irq(g, o) have_input((g), (o))
> +#define have_debounce(g, o) have_input((g), (o))
> +
> +static inline bool have_output(struct aspeed_gpio_g7 *gpio, unsigned int=
 offset)
> +{
> +	const struct aspeed_bank_props *props =3D find_bank_props(gpio, offset)=
;
> +
> +	return !props || (props->output & GPIO_BIT(offset));
> +}
> +

This is all common as well.

> +static int aspeed_gpio_g7_get(struct gpio_chip *gc, unsigned int offset)
> +{
> +	struct aspeed_gpio_g7 *gpio =3D gpiochip_get_data(gc);
> +	void __iomem *addr =3D gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);
> +
> +	return !!(field_get(GPIO_G7_IN_DATA, ioread32(addr)));
> +}
> +
> +static void __aspeed_gpio_g7_set(struct gpio_chip *gc, unsigned int offs=
et, int val)
> +{
> +	struct aspeed_gpio_g7 *gpio =3D gpiochip_get_data(gc);
> +	void __iomem *addr =3D gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);

The rest of the implementation of this function is broadly the same as
in gpio-aspeed.c. The main difference is accounting for the address to
access and the bit to whack. If we define some callbacks that replace
GPIO_BANK()/to_bank() and GPIO_BIT() that can account for the
differences in register layout, perhaps this could be common?

The trade-off is some complexity vs copy-paste, but there does seem to
be an awful lot of the latter with only minor changes so far.

> +	u32 reg;
> +
> +	reg =3D gpio->dcache[GPIO_BANK(offset)];
> +
> +	if (val)
> +		reg |=3D GPIO_BIT(offset);
> +	else
> +		reg &=3D ~GPIO_BIT(offset);
> +	gpio->dcache[GPIO_BANK(offset)] =3D reg;
> +
> +	ast_write_bits(addr, GPIO_G7_OUT_DATA, val);
> +}
> +
> +static void aspeed_gpio_g7_set(struct gpio_chip *gc, unsigned int offset=
, int val)
> +{
> +	struct aspeed_gpio_g7 *gpio =3D gpiochip_get_data(gc);
> +	unsigned long flags;
> +
> +	raw_spin_lock_irqsave(&gpio->lock, flags);
> +
> +	__aspeed_gpio_g7_set(gc, offset, val);
> +
> +	raw_spin_unlock_irqrestore(&gpio->lock, flags);
> +}
> +
> +static int aspeed_gpio_g7_dir_in(struct gpio_chip *gc, unsigned int offs=
et)
> +{
> +	struct aspeed_gpio_g7 *gpio =3D gpiochip_get_data(gc);
> +	void __iomem *addr =3D gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);
> +	unsigned long flags;
> +
> +	if (!have_input(gpio, offset))
> +		return -EOPNOTSUPP;
> +
> +	raw_spin_lock_irqsave(&gpio->lock, flags);
> +
> +	ast_clr_bits(addr, GPIO_G7_DIR);
> +
> +	raw_spin_unlock_irqrestore(&gpio->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int aspeed_gpio_g7_dir_out(struct gpio_chip *gc, unsigned int off=
set, int val)
> +{
> +	struct aspeed_gpio_g7 *gpio =3D gpiochip_get_data(gc);
> +	void __iomem *addr =3D gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);
> +	unsigned long flags;
> +
> +	if (!have_output(gpio, offset))
> +		return -EOPNOTSUPP;
> +
> +	raw_spin_lock_irqsave(&gpio->lock, flags);
> +
> +	__aspeed_gpio_g7_set(gc, offset, val);
> +	ast_write_bits(addr, GPIO_G7_DIR, 1);
> +
> +	raw_spin_unlock_irqrestore(&gpio->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int aspeed_gpio_g7_get_direction(struct gpio_chip *gc, unsigned i=
nt offset)
> +{
> +	struct aspeed_gpio_g7 *gpio =3D gpiochip_get_data(gc);
> +	void __iomem *addr =3D gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);
> +	unsigned long flags;
> +	u32 val;
> +
> +	if (!have_input(gpio, offset))
> +		return GPIO_LINE_DIRECTION_OUT;
> +
> +	if (!have_output(gpio, offset))
> +		return GPIO_LINE_DIRECTION_IN;
> +
> +	raw_spin_lock_irqsave(&gpio->lock, flags);
> +
> +	val =3D ioread32(addr) & GPIO_G7_DIR;
> +
> +	raw_spin_unlock_irqrestore(&gpio->lock, flags);
> +
> +	return val ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION_IN;
> +}

On top of handling the differences in the register layout as I
mentioned above, the main difference in these get/set implementations
is dropping the calls through the coprocessor handshake APIs. If you
stub out the implementation of the coprocessor APIs I think it's likely
these can be common. To do that you would need to make them use
callbacks into the SoC-specific driver. To stub out the implementation
you could leave the callback pointer as NULL for now.

> +
> +static inline int irqd_to_aspeed_gpio_g7_data(struct irq_data *d, struct=
 aspeed_gpio_g7 **gpio,
> +					      int *offset)
> +{
> +	struct aspeed_gpio_g7 *internal;
> +
> +	*offset =3D irqd_to_hwirq(d);
> +
> +	internal =3D irq_data_get_irq_chip_data(d);
> +
> +	/* This might be a bit of a questionable place to check */
> +	if (!have_irq(internal, *offset))
> +		return -EOPNOTSUPP;
> +
> +	*gpio =3D internal;
> +
> +	return 0;
> +}

You do have different data-types here (struct aspeed_gpio_g7), but
possibly with appropriate struct definitions and use of container_of()
by the caller, this could be common too?

> +
> +static void aspeed_gpio_g7_irq_ack(struct irq_data *d)
> +{
> +	struct aspeed_gpio_g7 *gpio;
> +	unsigned long flags;
> +	void __iomem *addr;
> +	int rc, offset;
> +
> +	rc =3D irqd_to_aspeed_gpio_g7_data(d, &gpio, &offset);
> +	if (rc)
> +		return;
> +
> +	addr =3D gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);
> +
> +	raw_spin_lock_irqsave(&gpio->lock, flags);
> +
> +	ast_write_bits(addr, GPIO_G7_IRQ_STS, 1);
> +
> +	raw_spin_unlock_irqrestore(&gpio->lock, flags);
> +}
> +
> +static void aspeed_gpio_g7_irq_set_mask(struct irq_data *d, bool set)
> +{
> +	struct aspeed_gpio_g7 *gpio;
> +	unsigned long flags;
> +	void __iomem *addr;
> +	int rc, offset;
> +
> +	rc =3D irqd_to_aspeed_gpio_g7_data(d, &gpio, &offset);
> +	if (rc)
> +		return;
> +
> +	addr =3D gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);
> +
> +	/* Unmasking the IRQ */
> +	if (set)
> +		gpiochip_enable_irq(&gpio->chip, irqd_to_hwirq(d));
> +
> +	raw_spin_lock_irqsave(&gpio->lock, flags);
> +
> +	if (set)
> +		ast_write_bits(addr, GPIO_G7_IRQ_EN, 1);
> +	else
> +		ast_clr_bits(addr, GPIO_G7_IRQ_EN);
> +
> +	raw_spin_unlock_irqrestore(&gpio->lock, flags);
> +
> +	/* Masking the IRQ */
> +	if (!set)
> +		gpiochip_disable_irq(&gpio->chip, irqd_to_hwirq(d));
> +}
> +
> +static void aspeed_gpio_g7_irq_mask(struct irq_data *d)
> +{
> +	aspeed_gpio_g7_irq_set_mask(d, false);
> +}
> +
> +static void aspeed_gpio_g7_irq_unmask(struct irq_data *d)
> +{
> +	aspeed_gpio_g7_irq_set_mask(d, true);
> +}
> +
> +static int aspeed_gpio_g7_set_type(struct irq_data *d, unsigned int type=
)
> +{
> +	u32 type0 =3D 0;
> +	u32 type1 =3D 0;
> +	u32 type2 =3D 0;
> +	irq_flow_handler_t handler;
> +	struct aspeed_gpio_g7 *gpio;
> +	unsigned long flags;
> +	void __iomem *addr;
> +	int rc, offset;
> +
> +	rc =3D irqd_to_aspeed_gpio_g7_data(d, &gpio, &offset);
> +	if (rc)
> +		return -EINVAL;
> +	addr =3D gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);
> +
> +	switch (type & IRQ_TYPE_SENSE_MASK) {
> +	case IRQ_TYPE_EDGE_BOTH:
> +		type2 =3D 1;
> +		fallthrough;
> +	case IRQ_TYPE_EDGE_RISING:
> +		type0 =3D 1;
> +		fallthrough;
> +	case IRQ_TYPE_EDGE_FALLING:
> +		handler =3D handle_edge_irq;
> +		break;
> +	case IRQ_TYPE_LEVEL_HIGH:
> +		type0 |=3D 1;
> +		fallthrough;
> +	case IRQ_TYPE_LEVEL_LOW:
> +		type1 |=3D 1;
> +		handler =3D handle_level_irq;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	raw_spin_lock_irqsave(&gpio->lock, flags);
> +
> +	ast_write_bits(addr, GPIO_G7_IRQ_TYPE2, type2);
> +	ast_write_bits(addr, GPIO_G7_IRQ_TYPE1, type1);
> +	ast_write_bits(addr, GPIO_G7_IRQ_TYPE0, type0);

Can we write them as a field in the one call? They're all in the same
register, which was not true in the previous controller register
layout.

> +
> +	raw_spin_unlock_irqrestore(&gpio->lock, flags);
> +
> +	irq_set_handler_locked(d, handler);
> +
> +	return 0;
> +}
> +
> +static void aspeed_gpio_g7_irq_handler(struct irq_desc *desc)
> +{
> +	struct gpio_chip *gc =3D irq_desc_get_handler_data(desc);
> +	struct irq_chip *ic =3D irq_desc_get_chip(desc);
> +	unsigned int i, p, banks;
> +	unsigned long reg;
> +	struct aspeed_gpio_g7 *gpio =3D gpiochip_get_data(gc);
> +	void __iomem *addr;
> +
> +	chained_irq_enter(ic, desc);
> +
> +	banks =3D DIV_ROUND_UP(gpio->chip.ngpio, 32);
> +	for (i =3D 0; i < banks; i++) {
> +		addr =3D gpio->base + GPIO_G7_IRQ_STS_OFFSET(i);
> +
> +		reg =3D ioread32(addr);
> +
> +		for_each_set_bit(p, &reg, 32)
> +			generic_handle_domain_irq(gc->irq.domain, i * 32 + p);
> +	}
> +
> +	chained_irq_exit(ic, desc);
> +}

The only thing that's different for the IRQ status handling is the
spread of the registers in the layout. In terms of the bits in each
bank's IRQ status register, the layout is the same. By implementing the
means to locate the status register as a callback this code could be
common between the drivers.

> +
> +static void aspeed_init_irq_valid_mask(struct gpio_chip *gc, unsigned lo=
ng *valid_mask,
> +				       unsigned int ngpios)
> +{
> +	struct aspeed_gpio_g7 *gpio =3D gpiochip_get_data(gc);
> +	const struct aspeed_bank_props *props =3D gpio->config->props;
> +
> +	while (!is_bank_props_sentinel(props)) {
> +		unsigned int offset;
> +		const unsigned long input =3D props->input;
> +
> +		/* Pretty crummy approach, but similar to GPIO core */
> +		for_each_clear_bit(offset, &input, 32) {
> +			unsigned int i =3D props->bank * 32 + offset;
> +
> +			if (i >=3D gpio->chip.ngpio)
> +				break;
> +
> +			clear_bit(i, valid_mask);
> +		}
> +
> +		props++;
> +	}
> +}

This is the same except for the change to use `struct aspeed_gpio_g7`?
Can we make this common?

> +
> +static int aspeed_gpio_g7_reset_tolerance(struct gpio_chip *chip, unsign=
ed int offset, bool enable)
> +{
> +	struct aspeed_gpio_g7 *gpio =3D gpiochip_get_data(chip);
> +	unsigned long flags;
> +	void __iomem *addr;
> +
> +	addr =3D gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);
> +
> +	raw_spin_lock_irqsave(&gpio->lock, flags);
> +
> +	if (enable)
> +		ast_write_bits(addr, GPIO_G7_RST_TOLERANCE, 1);
> +	else
> +		ast_clr_bits(addr, GPIO_G7_RST_TOLERANCE);
> +
> +	raw_spin_unlock_irqrestore(&gpio->lock, flags);
> +
> +	return 0;
> +}
> +
> +static int aspeed_gpio_g7_request(struct gpio_chip *chip, unsigned int o=
ffset)
> +{
> +	if (!have_gpio(gpiochip_get_data(chip), offset))
> +		return -ENODEV;
> +
> +	return pinctrl_gpio_request(chip->base + offset);

pinctrl_gpio_request() takes the chip and the offset value separately.
It looks like you've developed this patch against an older kernel tree?

> +}
> +
> +static void aspeed_gpio_g7_free(struct gpio_chip *chip, unsigned int off=
set)
> +{
> +	pinctrl_gpio_free(chip->base + offset);

Same as above for pinctrl_gpio_free().

> +}
> +
> +static int usecs_to_cycles(struct aspeed_gpio_g7 *gpio, unsigned long us=
ecs, u32 *cycles)
> +{
> +	u64 rate;
> +	u64 n;
> +	u32 r;
> +
> +	rate =3D clk_get_rate(gpio->clk);
> +	if (!rate)
> +		return -EOPNOTSUPP;
> +
> +	n =3D rate * usecs;
> +	r =3D do_div(n, 1000000);
> +
> +	if (n >=3D U32_MAX)
> +		return -ERANGE;
> +
> +	/* At least as long as the requested time */
> +	*cycles =3D n + (!!r);
> +
> +	return 0;
> +}
> +
> +/* Call under gpio->lock */
> +static int register_allocated_timer(struct aspeed_gpio_g7 *gpio, unsigne=
d int offset,
> +				    unsigned int timer)
> +{
> +	if (WARN(gpio->offset_timer[offset] !=3D 0, "Offset %d already allocate=
d timer %d\n", offset,
> +		 gpio->offset_timer[offset]))
> +		return -EINVAL;
> +
> +	if (WARN(gpio->timer_users[timer] =3D=3D UINT_MAX, "Timer user count wo=
uld overflow\n"))
> +		return -EPERM;
> +
> +	gpio->offset_timer[offset] =3D timer;
> +	gpio->timer_users[timer]++;
> +
> +	return 0;
> +}
> +
> +/* Call under gpio->lock */
> +static int unregister_allocated_timer(struct aspeed_gpio_g7 *gpio, unsig=
ned int offset)
> +{
> +	if (WARN(gpio->offset_timer[offset] =3D=3D 0, "No timer allocated to of=
fset %d\n", offset))
> +		return -EINVAL;
> +
> +	if (WARN(gpio->timer_users[gpio->offset_timer[offset]] =3D=3D 0,
> +		 "No users recorded for timer %d\n", gpio->offset_timer[offset]))
> +		return -EINVAL;
> +
> +	gpio->timer_users[gpio->offset_timer[offset]]--;
> +	gpio->offset_timer[offset] =3D 0;
> +
> +	return 0;
> +}
> +
> +/* Call under gpio->lock */
> +static inline bool timer_allocation_registered(struct aspeed_gpio_g7 *gp=
io, unsigned int offset)
> +{
> +	return gpio->offset_timer[offset] > 0;
> +}

The above functions have all been copy/pasted, can we make them common?
> +
> +static void configure_timer(struct aspeed_gpio_g7 *gpio, unsigned int of=
fset, unsigned int timer)
> +{
> +	void __iomem *addr =3D gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);
> +
> +	/* Note: Debounce timer isn't under control of the command
> +	 * source registers, so no need to sync with the coprocessor
> +	 */
> +	ast_write_bits(addr, GPIO_G7_DEBOUNCE_SEL, timer);
> +}
> +
> +static int enable_debounce(struct gpio_chip *chip, unsigned int offset, =
unsigned long usecs)
> +{
> +	struct aspeed_gpio_g7 *gpio =3D gpiochip_get_data(chip);
> +	u32 requested_cycles;
> +	unsigned long flags;
> +	int rc;
> +	int i;
> +
> +	if (!gpio->clk)
> +		return -EINVAL;
> +
> +	rc =3D usecs_to_cycles(gpio, usecs, &requested_cycles);
> +	if (rc < 0) {
> +		dev_warn(chip->parent, "Failed to convert %luus to cycles at %luHz: %d=
\n", usecs,
> +			 clk_get_rate(gpio->clk), rc);
> +		return rc;
> +	}
> +
> +	raw_spin_lock_irqsave(&gpio->lock, flags);
> +
> +	if (timer_allocation_registered(gpio, offset)) {
> +		rc =3D unregister_allocated_timer(gpio, offset);
> +		if (rc < 0)
> +			goto out;
> +	}
> +
> +	/* Try to find a timer already configured for the debounce period */
> +	for (i =3D 1; i < ARRAY_SIZE(debounce_timers); i++) {
> +		u32 cycles;
> +
> +		cycles =3D ioread32(gpio->base + debounce_timers[i]);
> +		if (requested_cycles =3D=3D cycles)
> +			break;
> +	}
> +
> +	if (i =3D=3D ARRAY_SIZE(debounce_timers)) {
> +		int j;
> +
> +		/*
> +		 * As there are no timers configured for the requested debounce
> +		 * period, find an unused timer instead
> +		 */
> +		for (j =3D 1; j < ARRAY_SIZE(gpio->timer_users); j++) {
> +			if (gpio->timer_users[j] =3D=3D 0)
> +				break;
> +		}
> +
> +		if (j =3D=3D ARRAY_SIZE(gpio->timer_users)) {
> +			dev_warn(chip->parent,
> +				 "Debounce timers exhausted, cannot debounce for period %luus\n",
> +				 usecs);
> +
> +			rc =3D -EPERM;
> +
> +			/*
> +			 * We already adjusted the accounting to remove @offset
> +			 * as a user of its previous timer, so also configure
> +			 * the hardware so @offset has timers disabled for
> +			 * consistency.
> +			 */
> +			configure_timer(gpio, offset, 0);
> +			goto out;
> +		}
> +
> +		i =3D j;
> +
> +		iowrite32(requested_cycles, gpio->base + debounce_timers[i]);
> +	}
> +
> +	if (WARN(i =3D=3D 0, "Cannot register index of disabled timer\n")) {
> +		rc =3D -EINVAL;
> +		goto out;
> +	}
> +
> +	register_allocated_timer(gpio, offset, i);
> +	configure_timer(gpio, offset, i);
> +
> +out:
> +	raw_spin_unlock_irqrestore(&gpio->lock, flags);
> +
> +	return rc;
> +}
> +
> +static int disable_debounce(struct gpio_chip *chip, unsigned int offset)
> +{
> +	struct aspeed_gpio_g7 *gpio =3D gpiochip_get_data(chip);
> +	unsigned long flags;
> +	int rc;
> +
> +	raw_spin_lock_irqsave(&gpio->lock, flags);
> +
> +	rc =3D unregister_allocated_timer(gpio, offset);
> +	if (!rc)
> +		configure_timer(gpio, offset, 0);
> +
> +	raw_spin_unlock_irqrestore(&gpio->lock, flags);
> +
> +	return rc;
> +}
> +
> +static int set_debounce(struct gpio_chip *chip, unsigned int offset, uns=
igned long usecs)
> +{
> +	struct aspeed_gpio_g7 *gpio =3D gpiochip_get_data(chip);
> +
> +	if (!have_debounce(gpio, offset))
> +		return -EOPNOTSUPP;
> +
> +	if (usecs)
> +		return enable_debounce(chip, offset, usecs);
> +
> +	return disable_debounce(chip, offset);
> +}

These are all copy/pasted, save for changing to `struct
aspeed_gpio_g7`. Can we make them common?

> +
> +static int aspeed_gpio_g7_set_config(struct gpio_chip *chip, unsigned in=
t offset,
> +				     unsigned long config)
> +{
> +	unsigned long param =3D pinconf_to_config_param(config);
> +	u32 arg =3D pinconf_to_config_argument(config);
> +
> +	if (param =3D=3D PIN_CONFIG_INPUT_DEBOUNCE)
> +		return set_debounce(chip, offset, arg);
> +	else if (param =3D=3D PIN_CONFIG_BIAS_DISABLE || param =3D=3D PIN_CONFI=
G_BIAS_PULL_DOWN ||
> +		 param =3D=3D PIN_CONFIG_DRIVE_STRENGTH)
> +		return pinctrl_gpio_set_config(offset, config);
> +	else if (param =3D=3D PIN_CONFIG_DRIVE_OPEN_DRAIN || param =3D=3D PIN_C=
ONFIG_DRIVE_OPEN_SOURCE)
> +		/* Return -EOPNOTSUPP to trigger emulation, as per datasheet */
> +		return -EOPNOTSUPP;
> +	else if (param =3D=3D PIN_CONFIG_PERSIST_STATE)
> +		return aspeed_gpio_g7_reset_tolerance(chip, offset, arg);
> +
> +	return -EOPNOTSUPP;
> +}

This is copy/paste, save for the call to
aspeed_gpio_g7_reset_tolerance(). Can we make it common?

Andrew


