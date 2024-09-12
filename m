Return-Path: <linux-gpio+bounces-9998-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E802197643A
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2024 10:18:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB619284CA0
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Sep 2024 08:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665A7190665;
	Thu, 12 Sep 2024 08:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="GwWiwLEu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FFF18E764;
	Thu, 12 Sep 2024 08:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726129133; cv=none; b=uu66N7reFTXNBZDCPuMQRmsMYcZmEeJcWKkYRWL/M8EWPJ70IWfhxQpdJUSSvEUQa64yChCP5ZQQmO0UP6kv6zihS1rV1qVVuSSj9tBL1xUPHfJIFb6rJtILZRNMQnQMuGKQzNrDmnanf2IYIL1U+7be4uNSeLJDT9po9FmXjBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726129133; c=relaxed/simple;
	bh=TwDlr7ZX0SvYWUgnMAX1Favuodch3oJnigvWnVMvJqw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IFq1nttOT2eha+7x/5WYDIqSnEr4Qgf8uKLFQCjFz5FR9XItPS4DFMios8AyGyZ6oH2oIrVeIuqDAT7F178VPnRAsM04MHmaOp9zxPJ2rw4dKQOPVLfMxcB+/SEtI9ND7fw1hr+ymkRIY64IXCGAPTyr14otCWwGlsRhEcviUQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=GwWiwLEu; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726129128;
	bh=OjizMSkYgaBs3rVCn9iy59tr1MRR62KTXhMBH9qio8o=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=GwWiwLEucON0CizXT4Y/Z7/WAa7lpzyJQ1PGm9rGUOf+y+FNoyj2nhr7QGDT47kxL
	 wF3FhSfQg0nW3z2mA9bX4VFaXRFMlySfx9U+yur6LNGtCn0L1xLU1ukzPTGBnd/D5u
	 I56BBOmUvb9orZ5CfPrN0nTd2Kr+KOmUel9zIvjzzdSJEuuw/gRjqf8SR+J/GyeBqe
	 vvCOosWeJyEkuAlaq6S1xasYYGckTKeM7TTxlAY1lJHYPIahtdCIXLfsnRypgoT4i0
	 Rslq0LjOTv3XGecwYv/a1sdUpsFwTNFXyWk8lpfPZUD6MsC0644Uz6vSEuM4e/XMiq
	 aNCp3xgHlWTCg==
Received: from [192.168.68.112] (ppp118-210-89-8.adl-adc-lon-bras32.tpg.internode.on.net [118.210.89.8])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 6016B659B3;
	Thu, 12 Sep 2024 16:18:47 +0800 (AWST)
Message-ID: <416e580aabf2827199ed430dc561f364a1c39678.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 3/4] gpio: aspeed: Create llops to handle hardware
 access
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org, 
	brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com
Date: Thu, 12 Sep 2024 17:48:46 +0930
In-Reply-To: <20240830034047.2251482-4-billy_tsai@aspeedtech.com>
References: <20240830034047.2251482-1-billy_tsai@aspeedtech.com>
	 <20240830034047.2251482-4-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-08-30 at 11:40 +0800, Billy Tsai wrote:
> Add low-level operations (llops) to abstract the register access for GPIO
> registers and the coprocessor request/release. With this abstraction
> layer, the driver can separate the hardware and software logic, making it
> easier to extend the driver to support different hardware register
> layouts.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/gpio/gpio-aspeed.c | 309 +++++++++++++++++--------------------
>  1 file changed, 138 insertions(+), 171 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index 24f50a0ea4ab..74c4e80958bf 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -39,6 +39,7 @@ struct aspeed_bank_props {
>  struct aspeed_gpio_config {
>  	unsigned int nr_gpios;
>  	const struct aspeed_bank_props *props;
> +	unsigned int version;

I'm interested to see whether this is necessary in practice.

>  };
> =20
>  /*
> @@ -62,10 +63,13 @@ struct aspeed_gpio {
> =20
>  	u8 *offset_timer;
>  	unsigned int timer_users[4];
> +	const int *debounce_timers_array;
> +	int debounce_timers_num;
>  	struct clk *clk;
> =20
>  	u32 *dcache;
>  	u8 *cf_copro_bankmap;
> +	const struct aspeed_gpio_llops *llops;
>  };
> =20
>  struct aspeed_gpio_bank {
> @@ -178,6 +182,15 @@ enum aspeed_gpio_reg {
>  	reg_cmdsrc1,
>  };
> =20
> +struct aspeed_gpio_llops {
> +	bool (*copro_request)(struct aspeed_gpio *gpio, unsigned int offset);
> +	void (*copro_release)(struct aspeed_gpio *gpio, unsigned int offset);
> +	void (*reg_bits_set)(struct aspeed_gpio *gpio, unsigned int offset,
> +			     const enum aspeed_gpio_reg reg, u32 val);
> +	u32 (*reg_bits_read)(struct aspeed_gpio *gpio, unsigned int offset,
> +			     const enum aspeed_gpio_reg reg);
> +};
> +
>  #define GPIO_VAL_VALUE	0x00
>  #define GPIO_VAL_DIR	0x04
> =20
> @@ -237,10 +250,6 @@ static inline void __iomem *bank_reg(struct aspeed_g=
pio *gpio,
>  #define GPIO_OFFSET(x)	((x) & 0x1f)
>  #define GPIO_BIT(x)	BIT(GPIO_OFFSET(x))
> =20
> -#define _GPIO_SET_DEBOUNCE(t, o, i) ((!!((t) & BIT(i))) << GPIO_OFFSET(o=
))
> -#define GPIO_SET_DEBOUNCE1(t, o) _GPIO_SET_DEBOUNCE(t, o, 1)
> -#define GPIO_SET_DEBOUNCE2(t, o) _GPIO_SET_DEBOUNCE(t, o, 0)
> -
>  static const struct aspeed_gpio_bank *to_bank(unsigned int offset)
>  {
>  	unsigned int bank =3D GPIO_BANK(offset);
> @@ -296,35 +305,17 @@ static inline bool have_output(struct aspeed_gpio *=
gpio, unsigned int offset)
>  }
> =20
>  static void aspeed_gpio_change_cmd_source(struct aspeed_gpio *gpio,
> -					  const struct aspeed_gpio_bank *bank,
> -					  int bindex, int cmdsrc)
> +					  unsigned int offset,
> +					  int cmdsrc)
>  {
> -	void __iomem *c0 =3D bank_reg(gpio, bank, reg_cmdsrc0);
> -	void __iomem *c1 =3D bank_reg(gpio, bank, reg_cmdsrc1);
> -	u32 bit, reg;
> -
>  	/*
> -	 * Each register controls 4 banks, so take the bottom 2
> -	 * bits of the bank index, and use them to select the
> -	 * right control bit (0, 8, 16 or 24).
> +	 * The command source register is only valid in bits 0, 8, 16, and 24, =
so we use
> +	 * (offset & ~(0x7)) to ensure that reg_bits_set always targets a valid=
 bit.
>  	 */
> -	bit =3D BIT((bindex & 3) << 3);
> -
>  	/* Source 1 first to avoid illegal 11 combination */
> -	reg =3D ioread32(c1);
> -	if (cmdsrc & 2)
> -		reg |=3D bit;
> -	else
> -		reg &=3D ~bit;
> -	iowrite32(reg, c1);
> -
> +	gpio->llops->reg_bits_set(gpio, offset & ~(0x7), reg_cmdsrc1, !!(cmdsrc=
 & BIT(1)));
>  	/* Then Source 0 */
> -	reg =3D ioread32(c0);
> -	if (cmdsrc & 1)
> -		reg |=3D bit;
> -	else
> -		reg &=3D ~bit;
> -	iowrite32(reg, c0);
> +	gpio->llops->reg_bits_set(gpio, offset & ~(0x7), reg_cmdsrc0, !!(cmdsrc=
 & BIT(0)));
>  }
> =20
>  static bool aspeed_gpio_copro_request(struct aspeed_gpio *gpio,
> @@ -343,7 +334,7 @@ static bool aspeed_gpio_copro_request(struct aspeed_g=
pio *gpio,
>  	copro_ops->request_access(copro_data);
> =20
>  	/* Change command source back to ARM */
> -	aspeed_gpio_change_cmd_source(gpio, bank, offset >> 3, GPIO_CMDSRC_ARM)=
;
> +	aspeed_gpio_change_cmd_source(gpio, offset, GPIO_CMDSRC_ARM);
> =20
>  	/* Update cache */
>  	gpio->dcache[GPIO_BANK(offset)] =3D ioread32(bank_reg(gpio, bank, reg_r=
data));
> @@ -354,8 +345,6 @@ static bool aspeed_gpio_copro_request(struct aspeed_g=
pio *gpio,
>  static void aspeed_gpio_copro_release(struct aspeed_gpio *gpio,
>  				      unsigned int offset)
>  {
> -	const struct aspeed_gpio_bank *bank =3D to_bank(offset);
> -
>  	if (!copro_ops || !gpio->cf_copro_bankmap)
>  		return;
>  	if (!gpio->cf_copro_bankmap[offset >> 3])
> @@ -364,7 +353,7 @@ static void aspeed_gpio_copro_release(struct aspeed_g=
pio *gpio,
>  		return;
> =20
>  	/* Change command source back to ColdFire */
> -	aspeed_gpio_change_cmd_source(gpio, bank, offset >> 3,
> +	aspeed_gpio_change_cmd_source(gpio, offset,
>  				      GPIO_CMDSRC_COLDFIRE);
> =20
>  	/* Restart the coprocessor */
> @@ -374,29 +363,24 @@ static void aspeed_gpio_copro_release(struct aspeed=
_gpio *gpio,
>  static int aspeed_gpio_get(struct gpio_chip *gc, unsigned int offset)
>  {
>  	struct aspeed_gpio *gpio =3D gpiochip_get_data(gc);
> -	const struct aspeed_gpio_bank *bank =3D to_bank(offset);
> =20
> -	return !!(ioread32(bank_reg(gpio, bank, reg_val)) & GPIO_BIT(offset));
> +	return gpio->llops->reg_bits_read(gpio, offset, reg_val);
>  }
> =20
>  static void __aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
>  			      int val)
>  {
>  	struct aspeed_gpio *gpio =3D gpiochip_get_data(gc);
> -	const struct aspeed_gpio_bank *bank =3D to_bank(offset);
> -	void __iomem *addr;
>  	u32 reg;
> =20
> -	addr =3D bank_reg(gpio, bank, reg_val);
>  	reg =3D gpio->dcache[GPIO_BANK(offset)];
> -
>  	if (val)
>  		reg |=3D GPIO_BIT(offset);
>  	else
>  		reg &=3D ~GPIO_BIT(offset);
>  	gpio->dcache[GPIO_BANK(offset)] =3D reg;
> =20
> -	iowrite32(reg, addr);
> +	gpio->llops->reg_bits_set(gpio, offset, reg_val, val);
>  }
> =20
>  static void aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
> @@ -407,36 +391,32 @@ static void aspeed_gpio_set(struct gpio_chip *gc, u=
nsigned int offset,
>  	bool copro;
> =20
>  	raw_spin_lock_irqsave(&gpio->lock, flags);
> -	copro =3D aspeed_gpio_copro_request(gpio, offset);
> +	if (gpio->llops->copro_request)
> +		copro =3D gpio->llops->copro_request(gpio, offset);

A bit minor perhaps, but I'd add a static function to do the test and
call:

static bool aspeed_gpio_copro_request(struct aspeed_gpio *gpio,
unsigned int offset)
{
    if (gpio->llops->copro_request)
        return gpio->llops->copro_request(gpio, offset);

    return false;
}

static void aspeed_gpio_copro_release(struct aspeed_gpio *gpio,
unsigned int offset)
{
    if (gpio->llops->copro_release)
        gpio->llops->copro_release(gpio, offset);
}

A bit less noise at the call-sites that way.

That's only a suggestion for the optional copro function pointers
though. For the reg_bits_read and reg_bits_set callbacks we should
ensure they're not NULL in the driver probe() implementation, or error
out if they are.

> =20
>  	__aspeed_gpio_set(gc, offset, val);
> =20
> -	if (copro)
> -		aspeed_gpio_copro_release(gpio, offset);
> +	if (copro && gpio->llops->copro_release)
> +		gpio->llops->copro_release(gpio, offset);
>  	raw_spin_unlock_irqrestore(&gpio->lock, flags);
>  }
> =20
>  static int aspeed_gpio_dir_in(struct gpio_chip *gc, unsigned int offset)
>  {
>  	struct aspeed_gpio *gpio =3D gpiochip_get_data(gc);
> -	const struct aspeed_gpio_bank *bank =3D to_bank(offset);
> -	void __iomem *addr =3D bank_reg(gpio, bank, reg_dir);
>  	unsigned long flags;
>  	bool copro;
> -	u32 reg;
> =20
>  	if (!have_input(gpio, offset))
>  		return -ENOTSUPP;
> =20
>  	raw_spin_lock_irqsave(&gpio->lock, flags);
> =20
> -	reg =3D ioread32(addr);
> -	reg &=3D ~GPIO_BIT(offset);
> -
> -	copro =3D aspeed_gpio_copro_request(gpio, offset);
> -	iowrite32(reg, addr);
> -	if (copro)
> -		aspeed_gpio_copro_release(gpio, offset);
> +	if (gpio->llops->copro_request)
> +		copro =3D gpio->llops->copro_request(gpio, offset);
> +	gpio->llops->reg_bits_set(gpio, offset, reg_dir, 0);
> +	if (copro && gpio->llops->copro_release)
> +		gpio->llops->copro_release(gpio, offset);
> =20
>  	raw_spin_unlock_irqrestore(&gpio->lock, flags);
> =20
> @@ -447,26 +427,21 @@ static int aspeed_gpio_dir_out(struct gpio_chip *gc=
,
>  			       unsigned int offset, int val)
>  {
>  	struct aspeed_gpio *gpio =3D gpiochip_get_data(gc);
> -	const struct aspeed_gpio_bank *bank =3D to_bank(offset);
> -	void __iomem *addr =3D bank_reg(gpio, bank, reg_dir);
>  	unsigned long flags;
>  	bool copro;
> -	u32 reg;
> =20
>  	if (!have_output(gpio, offset))
>  		return -ENOTSUPP;
> =20
>  	raw_spin_lock_irqsave(&gpio->lock, flags);
> =20
> -	reg =3D ioread32(addr);
> -	reg |=3D GPIO_BIT(offset);
> -
> -	copro =3D aspeed_gpio_copro_request(gpio, offset);
> +	if (gpio->llops->copro_request)
> +		copro =3D gpio->llops->copro_request(gpio, offset);
>  	__aspeed_gpio_set(gc, offset, val);
> -	iowrite32(reg, addr);
> +	gpio->llops->reg_bits_set(gpio, offset, reg_dir, 1);
> =20
> -	if (copro)
> -		aspeed_gpio_copro_release(gpio, offset);
> +	if (copro && gpio->llops->copro_release)
> +		gpio->llops->copro_release(gpio, offset);
>  	raw_spin_unlock_irqrestore(&gpio->lock, flags);
> =20
>  	return 0;
> @@ -475,7 +450,6 @@ static int aspeed_gpio_dir_out(struct gpio_chip *gc,
>  static int aspeed_gpio_get_direction(struct gpio_chip *gc, unsigned int =
offset)
>  {
>  	struct aspeed_gpio *gpio =3D gpiochip_get_data(gc);
> -	const struct aspeed_gpio_bank *bank =3D to_bank(offset);
>  	unsigned long flags;
>  	u32 val;
> =20
> @@ -487,7 +461,7 @@ static int aspeed_gpio_get_direction(struct gpio_chip=
 *gc, unsigned int offset)
> =20
>  	raw_spin_lock_irqsave(&gpio->lock, flags);
> =20
> -	val =3D ioread32(bank_reg(gpio, bank, reg_dir)) & GPIO_BIT(offset);
> +	val =3D gpio->llops->reg_bits_read(gpio, offset, reg_dir);
> =20
>  	raw_spin_unlock_irqrestore(&gpio->lock, flags);
> =20
> @@ -496,8 +470,7 @@ static int aspeed_gpio_get_direction(struct gpio_chip=
 *gc, unsigned int offset)
> =20
>  static inline int irqd_to_aspeed_gpio_data(struct irq_data *d,
>  					   struct aspeed_gpio **gpio,
> -					   const struct aspeed_gpio_bank **bank,
> -					   u32 *bit, int *offset)
> +					   int *offset)
>  {
>  	struct aspeed_gpio *internal;
> =20
> @@ -510,70 +483,55 @@ static inline int irqd_to_aspeed_gpio_data(struct i=
rq_data *d,
>  		return -ENOTSUPP;
> =20
>  	*gpio =3D internal;
> -	*bank =3D to_bank(*offset);
> -	*bit =3D GPIO_BIT(*offset);
> =20
>  	return 0;
>  }
> =20
>  static void aspeed_gpio_irq_ack(struct irq_data *d)
>  {
> -	const struct aspeed_gpio_bank *bank;
>  	struct aspeed_gpio *gpio;
>  	unsigned long flags;
> -	void __iomem *status_addr;
>  	int rc, offset;
>  	bool copro;
> -	u32 bit;
> =20
> -	rc =3D irqd_to_aspeed_gpio_data(d, &gpio, &bank, &bit, &offset);
> +	rc =3D irqd_to_aspeed_gpio_data(d, &gpio, &offset);
>  	if (rc)
>  		return;
> =20
> -	status_addr =3D bank_reg(gpio, bank, reg_irq_status);
> -
>  	raw_spin_lock_irqsave(&gpio->lock, flags);
> -	copro =3D aspeed_gpio_copro_request(gpio, offset);
> +	if (gpio->llops->copro_request)
> +		copro =3D gpio->llops->copro_request(gpio, offset);
> =20
> -	iowrite32(bit, status_addr);
> +	gpio->llops->reg_bits_set(gpio, offset, reg_irq_status, 1);
> =20
> -	if (copro)
> -		aspeed_gpio_copro_release(gpio, offset);
> +	if (copro && gpio->llops->copro_release)
> +		gpio->llops->copro_release(gpio, offset);
>  	raw_spin_unlock_irqrestore(&gpio->lock, flags);
>  }
> =20
>  static void aspeed_gpio_irq_set_mask(struct irq_data *d, bool set)
>  {
> -	const struct aspeed_gpio_bank *bank;
>  	struct aspeed_gpio *gpio;
>  	unsigned long flags;
> -	u32 reg, bit;
> -	void __iomem *addr;
>  	int rc, offset;
>  	bool copro;
> =20
> -	rc =3D irqd_to_aspeed_gpio_data(d, &gpio, &bank, &bit, &offset);
> +	rc =3D irqd_to_aspeed_gpio_data(d, &gpio, &offset);
>  	if (rc)
>  		return;
> =20
> -	addr =3D bank_reg(gpio, bank, reg_irq_enable);
> -
>  	/* Unmasking the IRQ */
>  	if (set)
>  		gpiochip_enable_irq(&gpio->chip, irqd_to_hwirq(d));
> =20
>  	raw_spin_lock_irqsave(&gpio->lock, flags);
> -	copro =3D aspeed_gpio_copro_request(gpio, offset);
> +	if (gpio->llops->copro_request)
> +		copro =3D gpio->llops->copro_request(gpio, offset);
> =20
> -	reg =3D ioread32(addr);
> -	if (set)
> -		reg |=3D bit;
> -	else
> -		reg &=3D ~bit;
> -	iowrite32(reg, addr);
> +	gpio->llops->reg_bits_set(gpio, offset, reg_irq_enable, set);
> =20
> -	if (copro)
> -		aspeed_gpio_copro_release(gpio, offset);
> +	if (copro && gpio->llops->copro_release)
> +		gpio->llops->copro_release(gpio, offset);
>  	raw_spin_unlock_irqrestore(&gpio->lock, flags);
> =20
>  	/* Masking the IRQ */
> @@ -596,34 +554,31 @@ static int aspeed_gpio_set_type(struct irq_data *d,=
 unsigned int type)
>  	u32 type0 =3D 0;
>  	u32 type1 =3D 0;
>  	u32 type2 =3D 0;
> -	u32 bit, reg;
> -	const struct aspeed_gpio_bank *bank;
>  	irq_flow_handler_t handler;
>  	struct aspeed_gpio *gpio;
>  	unsigned long flags;
> -	void __iomem *addr;
>  	int rc, offset;
>  	bool copro;
> =20
> -	rc =3D irqd_to_aspeed_gpio_data(d, &gpio, &bank, &bit, &offset);
> +	rc =3D irqd_to_aspeed_gpio_data(d, &gpio, &offset);
>  	if (rc)
>  		return -EINVAL;
> =20
>  	switch (type & IRQ_TYPE_SENSE_MASK) {
>  	case IRQ_TYPE_EDGE_BOTH:
> -		type2 |=3D bit;
> +		type2 =3D 1;
>  		fallthrough;
>  	case IRQ_TYPE_EDGE_RISING:
> -		type0 |=3D bit;
> +		type0 =3D 1;
>  		fallthrough;
>  	case IRQ_TYPE_EDGE_FALLING:
>  		handler =3D handle_edge_irq;
>  		break;
>  	case IRQ_TYPE_LEVEL_HIGH:
> -		type0 |=3D bit;
> +		type0 =3D 1;
>  		fallthrough;
>  	case IRQ_TYPE_LEVEL_LOW:
> -		type1 |=3D bit;
> +		type1 =3D 1;
>  		handler =3D handle_level_irq;
>  		break;
>  	default:
> @@ -631,25 +586,15 @@ static int aspeed_gpio_set_type(struct irq_data *d,=
 unsigned int type)
>  	}
> =20
>  	raw_spin_lock_irqsave(&gpio->lock, flags);
> -	copro =3D aspeed_gpio_copro_request(gpio, offset);
> -
> -	addr =3D bank_reg(gpio, bank, reg_irq_type0);
> -	reg =3D ioread32(addr);
> -	reg =3D (reg & ~bit) | type0;
> -	iowrite32(reg, addr);
> +	if (gpio->llops->copro_request)
> +		copro =3D gpio->llops->copro_request(gpio, offset);
> =20
> -	addr =3D bank_reg(gpio, bank, reg_irq_type1);
> -	reg =3D ioread32(addr);
> -	reg =3D (reg & ~bit) | type1;
> -	iowrite32(reg, addr);
> +	gpio->llops->reg_bits_set(gpio, offset, reg_irq_type0, type0);
> +	gpio->llops->reg_bits_set(gpio, offset, reg_irq_type1, type1);
> +	gpio->llops->reg_bits_set(gpio, offset, reg_irq_type2, type2);
> =20
> -	addr =3D bank_reg(gpio, bank, reg_irq_type2);
> -	reg =3D ioread32(addr);
> -	reg =3D (reg & ~bit) | type2;
> -	iowrite32(reg, addr);
> -
> -	if (copro)
> -		aspeed_gpio_copro_release(gpio, offset);
> +	if (copro && gpio->llops->copro_release)
> +		gpio->llops->copro_release(gpio, offset);
>  	raw_spin_unlock_irqrestore(&gpio->lock, flags);
> =20
>  	irq_set_handler_locked(d, handler);
> @@ -661,7 +606,6 @@ static void aspeed_gpio_irq_handler(struct irq_desc *=
desc)
>  {
>  	struct gpio_chip *gc =3D irq_desc_get_handler_data(desc);
>  	struct irq_chip *ic =3D irq_desc_get_chip(desc);
> -	struct aspeed_gpio *data =3D gpiochip_get_data(gc);
>  	unsigned int i, p, banks;
>  	unsigned long reg;
>  	struct aspeed_gpio *gpio =3D gpiochip_get_data(gc);
> @@ -670,9 +614,7 @@ static void aspeed_gpio_irq_handler(struct irq_desc *=
desc)
> =20
>  	banks =3D DIV_ROUND_UP(gpio->chip.ngpio, 32);
>  	for (i =3D 0; i < banks; i++) {
> -		const struct aspeed_gpio_bank *bank =3D &aspeed_gpio_banks[i];
> -
> -		reg =3D ioread32(bank_reg(data, bank, reg_irq_status));
> +		reg =3D gpio->llops->reg_bits_read(gpio, i, reg_irq_status);
> =20
>  		for_each_set_bit(p, &reg, 32)
>  			generic_handle_domain_irq(gc->irq.domain, i * 32 + p);
> @@ -711,26 +653,16 @@ static int aspeed_gpio_reset_tolerance(struct gpio_=
chip *chip,
>  {
>  	struct aspeed_gpio *gpio =3D gpiochip_get_data(chip);
>  	unsigned long flags;
> -	void __iomem *treg;
>  	bool copro;
> -	u32 val;
> -
> -	treg =3D bank_reg(gpio, to_bank(offset), reg_tolerance);
> =20
>  	raw_spin_lock_irqsave(&gpio->lock, flags);
> -	copro =3D aspeed_gpio_copro_request(gpio, offset);
> +	if (gpio->llops->copro_request)
> +		copro =3D gpio->llops->copro_request(gpio, offset);
> =20
> -	val =3D readl(treg);
> +	gpio->llops->reg_bits_set(gpio, offset, reg_tolerance, enable);
> =20
> -	if (enable)
> -		val |=3D GPIO_BIT(offset);
> -	else
> -		val &=3D ~GPIO_BIT(offset);
> -
> -	writel(val, treg);
> -
> -	if (copro)
> -		aspeed_gpio_copro_release(gpio, offset);
> +	if (copro && gpio->llops->copro_release)
> +		gpio->llops->copro_release(gpio, offset);
>  	raw_spin_unlock_irqrestore(&gpio->lock, flags);
> =20
>  	return 0;
> @@ -821,21 +753,11 @@ static inline bool timer_allocation_registered(stru=
ct aspeed_gpio *gpio,
>  static void configure_timer(struct aspeed_gpio *gpio, unsigned int offse=
t,
>  		unsigned int timer)
>  {
> -	const struct aspeed_gpio_bank *bank =3D to_bank(offset);
> -	const u32 mask =3D GPIO_BIT(offset);
> -	void __iomem *addr;
> -	u32 val;
> -
>  	/* Note: Debounce timer isn't under control of the command
>  	 * source registers, so no need to sync with the coprocessor
>  	 */
> -	addr =3D bank_reg(gpio, bank, reg_debounce_sel1);
> -	val =3D ioread32(addr);
> -	iowrite32((val & ~mask) | GPIO_SET_DEBOUNCE1(timer, offset), addr);
> -
> -	addr =3D bank_reg(gpio, bank, reg_debounce_sel2);
> -	val =3D ioread32(addr);
> -	iowrite32((val & ~mask) | GPIO_SET_DEBOUNCE2(timer, offset), addr);
> +	gpio->llops->reg_bits_set(gpio, offset, reg_debounce_sel1, !!(timer & B=
IT(1)));
> +	gpio->llops->reg_bits_set(gpio, offset, reg_debounce_sel2, !!(timer & B=
IT(0)));
>  }
> =20
>  static int enable_debounce(struct gpio_chip *chip, unsigned int offset,
> @@ -866,15 +788,15 @@ static int enable_debounce(struct gpio_chip *chip, =
unsigned int offset,
>  	}
> =20
>  	/* Try to find a timer already configured for the debounce period */
> -	for (i =3D 1; i < ARRAY_SIZE(debounce_timers); i++) {
> +	for (i =3D 1; i < gpio->debounce_timers_num; i++) {
>  		u32 cycles;
> =20
> -		cycles =3D ioread32(gpio->base + debounce_timers[i]);
> +		cycles =3D ioread32(gpio->base + gpio->debounce_timers_array[i]);
>  		if (requested_cycles =3D=3D cycles)
>  			break;
>  	}
> =20
> -	if (i =3D=3D ARRAY_SIZE(debounce_timers)) {
> +	if (i =3D=3D gpio->debounce_timers_num) {
>  		int j;
> =20
>  		/*
> @@ -905,7 +827,7 @@ static int enable_debounce(struct gpio_chip *chip, un=
signed int offset,
> =20
>  		i =3D j;
> =20
> -		iowrite32(requested_cycles, gpio->base + debounce_timers[i]);
> +		iowrite32(requested_cycles, gpio->base + gpio->debounce_timers_array[i=
]);
>  	}
> =20
>  	if (WARN(i =3D=3D 0, "Cannot register index of disabled timer\n")) {
> @@ -1027,7 +949,7 @@ int aspeed_gpio_copro_grab_gpio(struct gpio_desc *de=
sc,
> =20
>  	/* Switch command source */
>  	if (gpio->cf_copro_bankmap[bindex] =3D=3D 1)
> -		aspeed_gpio_change_cmd_source(gpio, bank, bindex,
> +		aspeed_gpio_change_cmd_source(gpio, offset,
>  					      GPIO_CMDSRC_COLDFIRE);
> =20
>  	if (vreg_offset)
> @@ -1051,7 +973,6 @@ int aspeed_gpio_copro_release_gpio(struct gpio_desc =
*desc)
>  	struct gpio_chip *chip =3D gpiod_to_chip(desc);
>  	struct aspeed_gpio *gpio =3D gpiochip_get_data(chip);
>  	int rc =3D 0, bindex, offset =3D gpio_chip_hwgpio(desc);
> -	const struct aspeed_gpio_bank *bank =3D to_bank(offset);
>  	unsigned long flags;
> =20
>  	if (!gpio->cf_copro_bankmap)
> @@ -1072,7 +993,7 @@ int aspeed_gpio_copro_release_gpio(struct gpio_desc =
*desc)
> =20
>  	/* Switch command source */
>  	if (gpio->cf_copro_bankmap[bindex] =3D=3D 0)
> -		aspeed_gpio_change_cmd_source(gpio, bank, bindex,
> +		aspeed_gpio_change_cmd_source(gpio, offset,
>  					      GPIO_CMDSRC_ARM);
>   bail:
>  	raw_spin_unlock_irqrestore(&gpio->lock, flags);
> @@ -1082,12 +1003,10 @@ EXPORT_SYMBOL_GPL(aspeed_gpio_copro_release_gpio)=
;
> =20
>  static void aspeed_gpio_irq_print_chip(struct irq_data *d, struct seq_fi=
le *p)
>  {
> -	const struct aspeed_gpio_bank *bank;
>  	struct aspeed_gpio *gpio;
> -	u32 bit;
>  	int rc, offset;
> =20
> -	rc =3D irqd_to_aspeed_gpio_data(d, &gpio, &bank, &bit, &offset);
> +	rc =3D irqd_to_aspeed_gpio_data(d, &gpio, &offset);
>  	if (rc)
>  		return;
> =20
> @@ -1120,7 +1039,7 @@ static const struct aspeed_bank_props ast2400_bank_=
props[] =3D {
> =20
>  static const struct aspeed_gpio_config ast2400_config =3D
>  	/* 220 for simplicity, really 216 with two 4-GPIO holes, four at end */
> -	{ .nr_gpios =3D 220, .props =3D ast2400_bank_props, };
> +	{ .nr_gpios =3D 220, .props =3D ast2400_bank_props, .version =3D 4};
> =20
>  static const struct aspeed_bank_props ast2500_bank_props[] =3D {
>  	/*     input	  output   */
> @@ -1132,7 +1051,7 @@ static const struct aspeed_bank_props ast2500_bank_=
props[] =3D {
> =20
>  static const struct aspeed_gpio_config ast2500_config =3D
>  	/* 232 for simplicity, actual number is 228 (4-GPIO hole in GPIOAB) */
> -	{ .nr_gpios =3D 232, .props =3D ast2500_bank_props, };
> +	{ .nr_gpios =3D 232, .props =3D ast2500_bank_props, .version =3D 4};
> =20
>  static const struct aspeed_bank_props ast2600_bank_props[] =3D {
>  	/*     input	  output   */
> @@ -1148,7 +1067,7 @@ static const struct aspeed_gpio_config ast2600_conf=
ig =3D
>  	 * We expect ngpio being set in the device tree and this is a fallback
>  	 * option.
>  	 */
> -	{ .nr_gpios =3D 208, .props =3D ast2600_bank_props, };
> +	{ .nr_gpios =3D 208, .props =3D ast2600_bank_props, .version =3D 4};
> =20
>  static const struct of_device_id aspeed_gpio_of_table[] =3D {
>  	{ .compatible =3D "aspeed,ast2400-gpio", .data =3D &ast2400_config, },
> @@ -1158,6 +1077,40 @@ static const struct of_device_id aspeed_gpio_of_ta=
ble[] =3D {
>  };
>  MODULE_DEVICE_TABLE(of, aspeed_gpio_of_table);
> =20
> +static void aspeed_g4_reg_bits_set(struct aspeed_gpio *gpio, unsigned in=
t offset,
> +				   const enum aspeed_gpio_reg reg, u32 val)
> +{
> +	const struct aspeed_gpio_bank *bank =3D to_bank(offset);
> +	void __iomem *addr =3D bank_reg(gpio, bank, reg);
> +	u32 temp;
> +
> +	temp =3D ioread32(addr);
> +	if (val)
> +		temp |=3D GPIO_BIT(offset);
> +	else
> +		temp &=3D ~GPIO_BIT(offset);
> +
> +	iowrite32(temp, addr);
> +}
> +
> +static u32 aspeed_g4_reg_bits_read(struct aspeed_gpio *gpio, unsigned in=
t offset,
> +				   const enum aspeed_gpio_reg reg)
> +{
> +	const struct aspeed_gpio_bank *bank =3D to_bank(offset);
> +	void __iomem *addr =3D bank_reg(gpio, bank, reg);
> +
> +	if (reg =3D=3D reg_rdata)
> +		return ioread32(addr);
> +	return !!(ioread32(addr) & GPIO_BIT(offset));
> +}
> +
> +struct aspeed_gpio_llops aspeed_g4_llops =3D {
> +	.copro_request =3D aspeed_gpio_copro_request,
> +	.copro_release =3D aspeed_gpio_copro_release,
> +	.reg_bits_set =3D aspeed_g4_reg_bits_set,
> +	.reg_bits_read =3D aspeed_g4_reg_bits_read,
> +};
> +
>  static int __init aspeed_gpio_probe(struct platform_device *pdev)
>  {
>  	const struct of_device_id *gpio_id;
> @@ -1191,6 +1144,18 @@ static int __init aspeed_gpio_probe(struct platfor=
m_device *pdev)
> =20
>  	gpio->config =3D gpio_id->data;
> =20
> +	if (gpio->config->version =3D=3D 4) {
> +		if (!gpio->llops)
> +			gpio->llops =3D &aspeed_g4_llops;
> +
> +		if (!gpio->debounce_timers_array) {
> +			gpio->debounce_timers_array =3D debounce_timers;
> +			gpio->debounce_timers_num =3D ARRAY_SIZE(debounce_timers);
> +		}

Why not embed the llops and debounce array pointer/size straight into
the config struct that we provide via  .data in the OF match table?

I think that would just mean reordering some of the function and struct
definitions in the source?

That way we can get rid of the version member.

Also, let's make sure here that the reg_bits_set and reg_bits_read
callbacks are not NULL (and error out of aspeed_gpio_probe() if they
are).

On the whole though, I feel this change turns out to be a decent
cleanup. It pushes the bank/offset bit-hackery down and away from the
call-sites.

Andrew

> +	} else {
> +		return -EOPNOTSUPP;
> +	}
> +
>  	gpio->chip.parent =3D &pdev->dev;
>  	err =3D of_property_read_u32(pdev->dev.of_node, "ngpios", &ngpio);
>  	gpio->chip.ngpio =3D (u16) ngpio;
> @@ -1218,15 +1183,17 @@ static int __init aspeed_gpio_probe(struct platfo=
rm_device *pdev)
>  	 * Populate it with initial values read from the HW and switch
>  	 * all command sources to the ARM by default
>  	 */
> -	for (i =3D 0; i < banks; i++) {
> -		const struct aspeed_gpio_bank *bank =3D &aspeed_gpio_banks[i];
> -		void __iomem *addr =3D bank_reg(gpio, bank, reg_rdata);
> -		gpio->dcache[i] =3D ioread32(addr);
> -		aspeed_gpio_change_cmd_source(gpio, bank, 0, GPIO_CMDSRC_ARM);
> -		aspeed_gpio_change_cmd_source(gpio, bank, 1, GPIO_CMDSRC_ARM);
> -		aspeed_gpio_change_cmd_source(gpio, bank, 2, GPIO_CMDSRC_ARM);
> -		aspeed_gpio_change_cmd_source(gpio, bank, 3, GPIO_CMDSRC_ARM);
> -	}
> +	if (gpio->config->version =3D=3D 4)
> +		for (i =3D 0; i < banks; i++) {
> +			const struct aspeed_gpio_bank *bank =3D &aspeed_gpio_banks[i];
> +			void __iomem *addr =3D bank_reg(gpio, bank, reg_rdata);
> +
> +			gpio->dcache[i] =3D ioread32(addr);
> +			aspeed_gpio_change_cmd_source(gpio, i * 8 + 0, GPIO_CMDSRC_ARM);
> +			aspeed_gpio_change_cmd_source(gpio, i * 8 + 8, GPIO_CMDSRC_ARM);
> +			aspeed_gpio_change_cmd_source(gpio, i * 8 + 16, GPIO_CMDSRC_ARM);
> +			aspeed_gpio_change_cmd_source(gpio, i * 8 + 24, GPIO_CMDSRC_ARM);
> +		}
> =20
>  	/* Set up an irqchip */
>  	irq =3D platform_get_irq(pdev, 0);


