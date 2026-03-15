Return-Path: <linux-gpio+bounces-33444-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kBDrMtYAtmn78AAAu9opvQ
	(envelope-from <linux-gpio+bounces-33444-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Mar 2026 01:44:06 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EE7828FAA2
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Mar 2026 01:44:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 50E74305DA96
	for <lists+linux-gpio@lfdr.de>; Sun, 15 Mar 2026 00:44:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2AA01E5B68;
	Sun, 15 Mar 2026 00:44:02 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3421A681D;
	Sun, 15 Mar 2026 00:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773535442; cv=none; b=gw6vbrcCp/BVg+Yn+Dqy5eninF3EP2FqvNMlRBYj999yhzNXRD/36mcHEhK0jQr9cGFwr6bUMaLJabTp3j1Op23rI7aYOZ/9OnF1af6fKX+RAIoMuJ7VoUgaClwzoWZJ+LizBTyVCWacOYrFe2fB9OtPWGgYILVlUHByirN4rak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773535442; c=relaxed/simple;
	bh=jhbwOkmSNbArfrU++r8APhIkf0krh5jWjxZOb6bJsVw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HijaxfoJTUNTUzG3f0BOYd0rlKXg1Lm8XTbYTu8Lp/leVv2MQHUTxNtIDCQjW4a8dadiH3GZ7bM5xyeUo63SDDP1YkQXDgoVaTZL7mJkC7q/KgjKVxgZpeqWreTdyD6OYf7jLM9Uxyyq/wymWGk0+0GPtiFr6eg0qdKU8Y3F53s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BCFA152B;
	Sat, 14 Mar 2026 17:43:52 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 762313F7BD;
	Sat, 14 Mar 2026 17:43:56 -0700 (PDT)
Date: Sun, 15 Mar 2026 01:42:05 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Linus Walleij <linusw@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland	
 <samuel@sholland.org>, Bartosz Golaszewski <brgl@kernel.org>,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] pinctrl: sunxi: convert to GPIO_GENERIC
Message-ID: <20260315014205.471d6834@ryzen.lan>
In-Reply-To: <a4cfb10e4701da0649ef648136496a962be5870d.camel@icenowy.me>
References: <20260313000652.11470-1-andre.przywara@arm.com>
	<a4cfb10e4701da0649ef648136496a962be5870d.camel@icenowy.me>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spamd-Result: default: False [0.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[arm.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,vger.kernel.org,lists.infradead.org,lists.linux.dev];
	TAGGED_FROM(0.00)[bounces-33444-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andre.przywara@arm.com,linux-gpio@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.997];
	RCPT_COUNT_SEVEN(0.00)[10];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2EE7828FAA2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 14 Mar 2026 13:14:25 +0800
Icenowy Zheng <uwu@icenowy.me> wrote:

> =E5=9C=A8 2026-03-13=E4=BA=94=E7=9A=84 01:06 +0100=EF=BC=8CAndre Przywara=
=E5=86=99=E9=81=93=EF=BC=9A
> > Allwinner SoCs combine pinmuxing and GPIO control in one device/MMIO
> > register frame. So far we were instantiating one GPIO chip per
> > pinctrl
> > device, which covers multiple banks of up to 32 GPIO pins per bank.
> > The
> > GPIO numbers were set to match the absolute pin numbers, even across
> > the
> > typically two instances of the pinctrl device.
> >=20
> > Convert the GPIO part of the sunxi pinctrl over to use the
> > gpio_generic
> > framework. This alone allows to remove some sunxi specific code,
> > which
> > is replaced with the existing generic code. This will become even
> > more
> > useful with the upcoming A733 support, which adds set and clear
> > registers for the output.
> > As a side effect this also changes the GPIO device and number
> > allocation: Each bank is now represented by its own gpio_chip, with
> > only
> > as many pins as there are actually implemented. The numbering is left
> > up =20
>=20
> Ah, is this a userspace API break?

Was that ever a guaranteed user space API? Or just something
that everyone relied on because it was always the same (until it
wasn't)? Similar to /dev/mmcblk0 being the SD card?
And ignoring the ill-fated old-style sysfs interface for now, how does
this work with libgpiod? Would it still use the absolute pin numbers?

I mean looking at that warning about the forced GPIO numbering we
get, using base =3D -1 seems to be the recommended way?

Cheers,
Andre

> Sincerely,
> Icenowy
>=20
> > to the kernel (.base =3D -1).
> >=20
> > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > ---
> > =C2=A0drivers/pinctrl/sunxi/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> > =C2=A0drivers/pinctrl/sunxi/pinctrl-sunxi.c | 245 ++++++++++++---------=
---
> > --
> > =C2=A0drivers/pinctrl/sunxi/pinctrl-sunxi.h |=C2=A0 11 +-
> > =C2=A03 files changed, 124 insertions(+), 133 deletions(-)
> >=20
> > diff --git a/drivers/pinctrl/sunxi/Kconfig
> > b/drivers/pinctrl/sunxi/Kconfig
> > index dc62eba96348e..5905810dbf398 100644
> > --- a/drivers/pinctrl/sunxi/Kconfig
> > +++ b/drivers/pinctrl/sunxi/Kconfig
> > @@ -4,6 +4,7 @@ if ARCH_SUNXI
> > =C2=A0config PINCTRL_SUNXI
> > =C2=A0	bool
> > =C2=A0	select PINMUX
> > +	select GPIO_GENERIC
> > =C2=A0	select GENERIC_PINCONF
> > =C2=A0	select GPIOLIB
> > =C2=A0
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > index 48434292a39b5..4235f9feff00d 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.c
> > @@ -13,6 +13,7 @@
> > =C2=A0#include <linux/clk.h>
> > =C2=A0#include <linux/export.h>
> > =C2=A0#include <linux/gpio/driver.h>
> > +#include <linux/gpio/generic.h>
> > =C2=A0#include <linux/interrupt.h>
> > =C2=A0#include <linux/io.h>
> > =C2=A0#include <linux/irqchip/chained_irq.h>
> > @@ -86,17 +87,6 @@ static void sunxi_mux_reg(const struct
> > sunxi_pinctrl *pctl,
> > =C2=A0	*mask=C2=A0 =3D (BIT(MUX_FIELD_WIDTH) - 1) << *shift;
> > =C2=A0}
> > =C2=A0
> > -static void sunxi_data_reg(const struct sunxi_pinctrl *pctl,
> > -			=C2=A0=C2=A0 u32 pin, u32 *reg, u32 *shift, u32 *mask)
> > -{
> > -	u32 offset =3D pin % PINS_PER_BANK * DATA_FIELD_WIDTH;
> > -
> > -	*reg=C2=A0=C2=A0 =3D sunxi_bank_offset(pctl, pin) + DATA_REGS_OFFSET +
> > -		 offset / BITS_PER_TYPE(u32) * sizeof(u32);
> > -	*shift =3D offset % BITS_PER_TYPE(u32);
> > -	*mask=C2=A0 =3D (BIT(DATA_FIELD_WIDTH) - 1) << *shift;
> > -}
> > -
> > =C2=A0static void sunxi_dlevel_reg(const struct sunxi_pinctrl *pctl,
> > =C2=A0			=C2=A0=C2=A0=C2=A0=C2=A0 u32 pin, u32 *reg, u32 *shift, u32
> > *mask)
> > =C2=A0{
> > @@ -930,99 +920,22 @@ static const struct pinmux_ops sunxi_pmx_ops =3D
> > {
> > =C2=A0	.strict			=3D true,
> > =C2=A0};
> > =C2=A0
> > -static int sunxi_pinctrl_gpio_direction_input(struct gpio_chip
> > *chip,
> > -					unsigned offset)
> > -{
> > -	struct sunxi_pinctrl *pctl =3D gpiochip_get_data(chip);
> > -
> > -	return sunxi_pmx_gpio_set_direction(pctl->pctl_dev, NULL,
> > -					=C2=A0=C2=A0=C2=A0 chip->base + offset,
> > true);
> > -}
> > -
> > -static int sunxi_pinctrl_gpio_get(struct gpio_chip *chip, unsigned
> > offset)
> > -{
> > -	struct sunxi_pinctrl *pctl =3D gpiochip_get_data(chip);
> > -	bool set_mux =3D pctl->desc->irq_read_needs_mux &&
> > -		gpiochip_line_is_irq(chip, offset);
> > -	u32 pin =3D offset + chip->base;
> > -	u32 reg, shift, mask, val;
> > -
> > -	sunxi_data_reg(pctl, offset, &reg, &shift, &mask);
> > -
> > -	if (set_mux)
> > -		sunxi_pmx_set(pctl->pctl_dev, pin,
> > SUN4I_FUNC_INPUT);
> > -
> > -	val =3D (readl(pctl->membase + reg) & mask) >> shift;
> > -
> > -	if (set_mux)
> > -		sunxi_pmx_set(pctl->pctl_dev, pin, SUN4I_FUNC_IRQ);
> > -
> > -	return val;
> > -}
> > -
> > -static int sunxi_pinctrl_gpio_set(struct gpio_chip *chip, unsigned
> > int offset,
> > -				=C2=A0 int value)
> > -{
> > -	struct sunxi_pinctrl *pctl =3D gpiochip_get_data(chip);
> > -	u32 reg, shift, mask, val;
> > -	unsigned long flags;
> > -
> > -	sunxi_data_reg(pctl, offset, &reg, &shift, &mask);
> > -
> > -	raw_spin_lock_irqsave(&pctl->lock, flags);
> > -
> > -	val =3D readl(pctl->membase + reg);
> > -
> > -	if (value)
> > -		val |=3D mask;
> > -	else
> > -		val &=3D ~mask;
> > -
> > -	writel(val, pctl->membase + reg);
> > -
> > -	raw_spin_unlock_irqrestore(&pctl->lock, flags);
> > -
> > -	return 0;
> > -}
> > -
> > -static int sunxi_pinctrl_gpio_direction_output(struct gpio_chip
> > *chip,
> > -					unsigned offset, int value)
> > -{
> > -	struct sunxi_pinctrl *pctl =3D gpiochip_get_data(chip);
> > -
> > -	sunxi_pinctrl_gpio_set(chip, offset, value);
> > -	return sunxi_pmx_gpio_set_direction(pctl->pctl_dev, NULL,
> > -					=C2=A0=C2=A0=C2=A0 chip->base + offset,
> > false);
> > -}
> > -
> > -static int sunxi_pinctrl_gpio_of_xlate(struct gpio_chip *gc,
> > -				const struct of_phandle_args
> > *gpiospec,
> > -				u32 *flags)
> > -{
> > -	int pin, base;
> > -
> > -	base =3D PINS_PER_BANK * gpiospec->args[0];
> > -	pin =3D base + gpiospec->args[1];
> > -
> > -	if (pin > gc->ngpio)
> > -		return -EINVAL;
> > -
> > -	if (flags)
> > -		*flags =3D gpiospec->args[2];
> > -
> > -	return pin;
> > -}
> > -
> > =C2=A0static int sunxi_pinctrl_gpio_to_irq(struct gpio_chip *chip,
> > unsigned offset)
> > =C2=A0{
> > =C2=A0	struct sunxi_pinctrl *pctl =3D gpiochip_get_data(chip);
> > =C2=A0	struct sunxi_desc_function *desc;
> > -	unsigned pinnum =3D pctl->desc->pin_base + offset;
> > -	unsigned irqnum;
> > +	unsigned int pinnum, irqnum, i;
> > =C2=A0
> > =C2=A0	if (offset >=3D chip->ngpio)
> > =C2=A0		return -ENXIO;
> > =C2=A0
> > +	for (i =3D 0; i < SUNXI_PINCTRL_MAX_BANKS; i++)
> > +		if (pctl->banks[i].chip.gc.base =3D=3D chip->base)
> > +			break;
> > +	if (i =3D=3D SUNXI_PINCTRL_MAX_BANKS)
> > +		return -EINVAL;
> > +	pinnum =3D pctl->desc->pin_base + i * PINS_PER_BANK + offset;
> > +
> > =C2=A0	desc =3D sunxi_pinctrl_desc_find_function_by_pin(pctl, pinnum,
> > "irq");
> > =C2=A0	if (!desc)
> > =C2=A0		return -EINVAL;
> > @@ -1039,18 +952,19 @@ static int
> > sunxi_pinctrl_irq_request_resources(struct irq_data *d)
> > =C2=A0{
> > =C2=A0	struct sunxi_pinctrl *pctl =3D irq_data_get_irq_chip_data(d);
> > =C2=A0	struct sunxi_desc_function *func;
> > -	int ret;
> > +	int pinnum =3D pctl->irq_array[d->hwirq], ret;
> > +	int bank =3D (pinnum - pctl->desc->pin_base) / PINS_PER_BANK;
> > =C2=A0
> > -	func =3D sunxi_pinctrl_desc_find_function_by_pin(pctl,
> > -					pctl->irq_array[d->hwirq],
> > "irq");
> > +	func =3D sunxi_pinctrl_desc_find_function_by_pin(pctl, pinnum,
> > "irq");
> > =C2=A0	if (!func)
> > =C2=A0		return -EINVAL;
> > =C2=A0
> > -	ret =3D gpiochip_lock_as_irq(pctl->chip,
> > -			pctl->irq_array[d->hwirq] - pctl->desc- =20
> > >pin_base); =20
> > +	ret =3D gpiochip_lock_as_irq(&pctl->banks[bank].chip.gc,
> > +				=C2=A0=C2=A0 d->hwirq % IRQ_PER_BANK);
> > =C2=A0	if (ret) {
> > =C2=A0		dev_err(pctl->dev, "unable to lock HW IRQ %lu for
> > IRQ\n",
> > =C2=A0			irqd_to_hwirq(d));
> > +
> > =C2=A0		return ret;
> > =C2=A0	}
> > =C2=A0
> > @@ -1063,9 +977,10 @@ static int
> > sunxi_pinctrl_irq_request_resources(struct irq_data *d)
> > =C2=A0static void sunxi_pinctrl_irq_release_resources(struct irq_data *=
d)
> > =C2=A0{
> > =C2=A0	struct sunxi_pinctrl *pctl =3D irq_data_get_irq_chip_data(d);
> > +	int pinnum =3D pctl->irq_array[d->hwirq] - pctl->desc- =20
> > >pin_base; =20
> > +	struct gpio_chip *gc =3D &pctl->banks[pinnum /
> > PINS_PER_BANK].chip.gc;
> > =C2=A0
> > -	gpiochip_unlock_as_irq(pctl->chip,
> > -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pctl->irq_array[d->hwirq] - pctl- =20
> > >desc->pin_base); =20
> > +	gpiochip_unlock_as_irq(gc, pinnum);
> > =C2=A0}
> > =C2=A0
> > =C2=A0static int sunxi_pinctrl_irq_set_type(struct irq_data *d, unsigned
> > int type)
> > @@ -1493,6 +1408,84 @@ static int sunxi_pinctrl_setup_debounce(struct
> > sunxi_pinctrl *pctl,
> > =C2=A0	return 0;
> > =C2=A0}
> > =C2=A0
> > +static bool sunxi_of_node_instance_match(struct gpio_chip *chip,
> > unsigned int i)
> > +{
> > +	struct sunxi_pinctrl *pctl =3D gpiochip_get_data(chip);
> > +
> > +	if (i >=3D SUNXI_PINCTRL_MAX_BANKS)
> > +		return false;
> > +
> > +	return (chip->base =3D=3D pctl->banks[i].chip.gc.base);
> > +}
> > +
> > +static int sunxi_num_pins_of_bank(struct sunxi_pinctrl *pctl, int
> > bank)
> > +{
> > +	int max =3D -1, i;
> > +
> > +	for (i =3D 0; i < pctl->desc->npins; i++) {
> > +		int pinnum =3D pctl->desc->pins[i].pin.number - pctl- =20
> > >desc->pin_base; =20
> > +
> > +		if (pinnum / PINS_PER_BANK < bank)
> > +			continue;
> > +		if (pinnum / PINS_PER_BANK > bank)
> > +			break;
> > +		if (pinnum % PINS_PER_BANK > max)
> > +			max =3D pinnum % PINS_PER_BANK;
> > +	}
> > +
> > +	return max + 1;
> > +}
> > +
> > +static int sunxi_gpio_add_bank(struct sunxi_pinctrl *pctl, int
> > index)
> > +{
> > +	char bank_name =3D 'A' + index + pctl->desc->pin_base /
> > PINS_PER_BANK;
> > +	struct sunxi_gpio_bank *bank =3D &pctl->banks[index];
> > +	struct gpio_generic_chip_config config;
> > +	struct gpio_chip *gc =3D &bank->chip.gc;
> > +	int ngpio, ret;
> > +
> > +	ngpio =3D sunxi_num_pins_of_bank(pctl, index);
> > +	bank->pctl =3D pctl;
> > +	bank->base =3D pctl->membase + index * pctl->bank_mem_size;
> > +	if (!ngpio) {
> > +		gc->owner =3D THIS_MODULE;
> > +		gc->ngpio =3D 0;
> > +		gc->base =3D -1;
> > +		gc->of_gpio_n_cells =3D 3;
> > +
> > +		return 0;
> > +	}
> > +
> > +	config =3D (struct gpio_generic_chip_config) {
> > +		.dev =3D pctl->dev,
> > +		.sz =3D 4,
> > +		.dat =3D bank->base + DATA_REGS_OFFSET,
> > +		.set =3D bank->base + DATA_REGS_OFFSET,
> > +		.clr =3D NULL,
> > +		.flags =3D GPIO_GENERIC_READ_OUTPUT_REG_SET |
> > +			 GPIO_GENERIC_PINCTRL_BACKEND,
> > +	};
> > +
> > +	ret =3D gpio_generic_chip_init(&bank->chip, &config);
> > +	if (ret)
> > +		return dev_err_probe(pctl->dev, ret,
> > +				=C2=A0=C2=A0=C2=A0=C2=A0 "failed to init generic gpio
> > chip\n");
> > +
> > +	gc->owner		=3D THIS_MODULE;
> > +	gc->label		=3D devm_kasprintf(pctl->dev,
> > GFP_KERNEL,
> > +						 "%s-P%c", gc- =20
> > >label, =20
> > +						 bank_name);
> > +	gc->ngpio		=3D ngpio;
> > +	gc->base		=3D -1;
> > +	gc->of_gpio_n_cells	=3D 3;
> > +	gc->of_node_instance_match =3D sunxi_of_node_instance_match;
> > +	gc->set_config		=3D gpiochip_generic_config;
> > +	gc->to_irq		=3D sunxi_pinctrl_gpio_to_irq;
> > +	gc->can_sleep		=3D false;
> > +
> > +	return gpiochip_add_data(gc, pctl);
> > +}
> > +
> > =C2=A0int sunxi_pinctrl_init_with_flags(struct platform_device *pdev,
> > =C2=A0				=C2=A0 const struct sunxi_pinctrl_desc
> > *desc,
> > =C2=A0				=C2=A0 unsigned long flags)
> > @@ -1503,6 +1496,7 @@ int sunxi_pinctrl_init_with_flags(struct
> > platform_device *pdev,
> > =C2=A0	struct sunxi_pinctrl *pctl;
> > =C2=A0	struct pinmux_ops *pmxops;
> > =C2=A0	int i, ret, last_pin, pin_idx;
> > +	int gpio_banks;
> > =C2=A0	struct clk *clk;
> > =C2=A0
> > =C2=A0	pctl =3D devm_kzalloc(&pdev->dev, sizeof(*pctl), GFP_KERNEL);
> > @@ -1590,38 +1584,23 @@ int sunxi_pinctrl_init_with_flags(struct
> > platform_device *pdev,
> > =C2=A0		return PTR_ERR(pctl->pctl_dev);
> > =C2=A0	}
> > =C2=A0
> > -	pctl->chip =3D devm_kzalloc(&pdev->dev, sizeof(*pctl->chip),
> > GFP_KERNEL);
> > -	if (!pctl->chip)
> > -		return -ENOMEM;
> > -
> > -	last_pin =3D pctl->desc->pins[pctl->desc->npins -
> > 1].pin.number;
> > -	pctl->chip->owner =3D THIS_MODULE;
> > -	pctl->chip->request =3D gpiochip_generic_request;
> > -	pctl->chip->free =3D gpiochip_generic_free;
> > -	pctl->chip->set_config =3D gpiochip_generic_config;
> > -	pctl->chip->direction_input =3D
> > sunxi_pinctrl_gpio_direction_input;
> > -	pctl->chip->direction_output =3D
> > sunxi_pinctrl_gpio_direction_output;
> > -	pctl->chip->get =3D sunxi_pinctrl_gpio_get;
> > -	pctl->chip->set =3D sunxi_pinctrl_gpio_set;
> > -	pctl->chip->of_xlate =3D sunxi_pinctrl_gpio_of_xlate;
> > -	pctl->chip->to_irq =3D sunxi_pinctrl_gpio_to_irq;
> > -	pctl->chip->of_gpio_n_cells =3D 3;
> > -	pctl->chip->can_sleep =3D false;
> > -	pctl->chip->ngpio =3D round_up(last_pin, PINS_PER_BANK) -
> > -			=C2=A0=C2=A0=C2=A0 pctl->desc->pin_base;
> > -	pctl->chip->label =3D dev_name(&pdev->dev);
> > -	pctl->chip->parent =3D &pdev->dev;
> > -	pctl->chip->base =3D pctl->desc->pin_base;
> > -
> > -	ret =3D gpiochip_add_data(pctl->chip, pctl);
> > -	if (ret)
> > -		return ret;
> > +	last_pin =3D pctl->desc->pins[pctl->desc->npins -
> > 1].pin.number -
> > +		=C2=A0=C2=A0 pctl->desc->pin_base;
> > +	for (gpio_banks =3D 0;
> > +	=C2=A0=C2=A0=C2=A0=C2=A0 gpio_banks <=3D last_pin / PINS_PER_BANK;
> > +	=C2=A0=C2=A0=C2=A0=C2=A0 gpio_banks++) {
> > +		ret =3D sunxi_gpio_add_bank(pctl, gpio_banks);
> > +		if (ret)
> > +			goto gpiochip_error;
> > +	}
> > =C2=A0
> > =C2=A0	for (i =3D 0; i < pctl->desc->npins; i++) {
> > =C2=A0		const struct sunxi_desc_pin *pin =3D pctl->desc->pins
> > + i;
> > +		int bank =3D (pin->pin.number - pctl->desc->pin_base)
> > / PINS_PER_BANK;
> > +		struct gpio_chip *gc =3D &pctl->banks[bank].chip.gc;
> > =C2=A0
> > -		ret =3D gpiochip_add_pin_range(pctl->chip,
> > dev_name(&pdev->dev),
> > -					=C2=A0=C2=A0=C2=A0=C2=A0 pin->pin.number - pctl- =20
> > >desc->pin_base, =20
> > +		ret =3D gpiochip_add_pin_range(gc, dev_name(&pdev- =20
> > >dev), =20
> > +					=C2=A0=C2=A0=C2=A0=C2=A0 pin->pin.number %
> > PINS_PER_BANK,
> > =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 pin->pin.number, 1);
> > =C2=A0		if (ret)
> > =C2=A0			goto gpiochip_error;
> > @@ -1690,6 +1669,8 @@ int sunxi_pinctrl_init_with_flags(struct
> > platform_device *pdev,
> > =C2=A0	return 0;
> > =C2=A0
> > =C2=A0gpiochip_error:
> > -	gpiochip_remove(pctl->chip);
> > +	while (--gpio_banks >=3D 0)
> > +		gpiochip_remove(&pctl->banks[gpio_banks].chip.gc);
> > +
> > =C2=A0	return ret;
> > =C2=A0}
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> > b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> > index ad26e4de16a85..085131caa02fe 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sunxi.h
> > @@ -14,6 +14,7 @@
> > =C2=A0#define __PINCTRL_SUNXI_H
> > =C2=A0
> > =C2=A0#include <linux/kernel.h>
> > +#include <linux/gpio/generic.h>
> > =C2=A0#include <linux/spinlock.h>
> > =C2=A0
> > =C2=A0#define PA_BASE	0
> > @@ -159,9 +160,17 @@ struct sunxi_pinctrl_regulator {
> > =C2=A0	refcount_t		refcount;
> > =C2=A0};
> > =C2=A0
> > +struct sunxi_pinctrl;
> > +
> > +struct sunxi_gpio_bank {
> > +	struct gpio_generic_chip chip;
> > +	struct sunxi_pinctrl *pctl;
> > +	void __iomem *base;
> > +};
> > +
> > =C2=A0struct sunxi_pinctrl {
> > =C2=A0	void __iomem			*membase;
> > -	struct gpio_chip		*chip;
> > +	struct
> > sunxi_gpio_bank		banks[SUNXI_PINCTRL_MAX_BANKS];
> > =C2=A0	const struct sunxi_pinctrl_desc	*desc;
> > =C2=A0	struct device			*dev;
> > =C2=A0	struct sunxi_pinctrl_regulator	regulators[11]; =20
>=20


