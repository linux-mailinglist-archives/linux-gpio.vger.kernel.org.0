Return-Path: <linux-gpio+bounces-10159-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D4A9799F4
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 04:43:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6B3B4B21F25
	for <lists+linux-gpio@lfdr.de>; Mon, 16 Sep 2024 02:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9AECDF53;
	Mon, 16 Sep 2024 02:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="Wc5O+hWx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84012A94F;
	Mon, 16 Sep 2024 02:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726454603; cv=none; b=IZqwB3ZUCmAmpL770PAbBakjQ+H2XqPSZ6uyPLak4lU2CQom4rTXTUQx5KCfl2LaoZznbxZz5zw5blZNG1e8dLB9ea/8AmyMSvWhX2Fo0YI8X2llWjZlSgrFfvJAAIyTAHg+eGQtGvgvJmiNvJBKswcMo562FS4gjkkw+Ia6vzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726454603; c=relaxed/simple;
	bh=nbEtqhZSTQ4in4Rf1xAWEnNPzyU6SIw/MXFbSU2ulYg=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=egqMc30nX0kt/7YhnmpvOGXm8EKrgC9UQVTGvv0rdcclXGWKQalLYz0e3wEt2xyRw3OY7T3Hi2mn8oOuk3b6Sdkqf6Vg9v8iNAVWzAbXthSU4seNPo4O38vudsJziH/+uhWtgrMEO6FQ9WX69xxi+wsyK4f50awtwRL+2a+5VEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=Wc5O+hWx; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1726454597;
	bh=hdDo0nRy5KeTUYj4WS1cNjtgE/PFkXYuX36K9Cxx4nM=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=Wc5O+hWxmup7FbWK2VXMbpB1hPChZ2sySusjs8cyQJe7+sKRK2OLrpkdhMqAE6IUb
	 uczABc24Pd6JSJJ3KQsDPAk4Quh+buJbPxRbaQ2frurrBnnXv4APF5Qf6aiaBxsy5Q
	 ldpwZmHLG+1ZHjdZQU6nU/ntIwcpfvI6ae1VPx4uTSipES75P/TvTeh5tFpuN4IyJ3
	 b71qGGu79c4BmrDMbfmKH/ZNBw1Nu6PfEwselMz0YforyyPvbWyUFvo7u9MtopM/GR
	 dEdlrS87+oMCSKPs7bg5VlHXbhEawHlUgt+93b97MaQphV1HhMqpoT/Q3MDXN9eZff
	 kAEyzsj+2unzw==
Received: from [192.168.68.112] (ppp118-210-161-36.adl-adc-lon-bras34.tpg.internode.on.net [118.210.161.36])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7217665027;
	Mon, 16 Sep 2024 10:43:16 +0800 (AWST)
Message-ID: <07fd6855ef46f4815940187bd85c9b191e9054c2.camel@codeconstruct.com.au>
Subject: Re: [PATCH v3 3/6] gpio: aspeed: Create llops to handle hardware
 access
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org, 
	brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	joel@jms.id.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com, Peter.Yin@quantatw.com
Date: Mon, 16 Sep 2024 12:13:15 +0930
In-Reply-To: <20240913074325.239390-4-billy_tsai@aspeedtech.com>
References: <20240913074325.239390-1-billy_tsai@aspeedtech.com>
	 <20240913074325.239390-4-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-09-13 at 15:43 +0800, Billy Tsai wrote:
> Add low-level operations (llops) to abstract the register access for GPIO
> registers and the coprocessor request/release. With this abstraction
> layer, the driver can separate the hardware and software logic, making it
> easier to extend the driver to support different hardware register
> layouts.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/gpio/gpio-aspeed.c | 366 ++++++++++++++++++-------------------
>  1 file changed, 178 insertions(+), 188 deletions(-)
>=20
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index d20e15b2079d..40ca308054c6 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -39,6 +39,10 @@ struct aspeed_bank_props {
>  struct aspeed_gpio_config {
>  	unsigned int nr_gpios;
>  	const struct aspeed_bank_props *props;
> +	const struct aspeed_gpio_llops *llops;
> +	const int *debounce_timers_array;
> +	int debounce_timers_num;
> +	bool cmd_source_supoort;

Typo: s/cmd_source_supoort/cmd_source_support/

However, this is a derived value. It can be inferred like:

   static bool aspeed_gpio_supports_cmd_source(const struct aspeed_gpio_con=
fig *config)
   {
       return config->llops->copro_request && config->llops->coproc_release=
;
   }

Can we do that instead? That removes the opportunity for the member
values to become unsynchronised in bad ways.

>  };
> =20
>  /*
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

Guess I should have commented on this on v2, but maybe call this
`reg_bits_get()` for symmetry with `reg_bits_set()`?

I also have a comment on the use of "bits" in the member names below.

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
> @@ -296,107 +305,56 @@ static inline bool have_output(struct aspeed_gpio =
*gpio, unsigned int offset)
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
> +	gpio->config->llops->reg_bits_set(gpio, offset & ~(0x7), reg_cmdsrc1, !=
!(cmdsrc & BIT(1)));
>  	/* Then Source 0 */
> -	reg =3D ioread32(c0);
> -	if (cmdsrc & 1)
> -		reg |=3D bit;
> -	else
> -		reg &=3D ~bit;
> -	iowrite32(reg, c0);
> +	gpio->config->llops->reg_bits_set(gpio, offset & ~(0x7), reg_cmdsrc0, !=
!(cmdsrc & BIT(0)));
>  }
> =20
>  static bool aspeed_gpio_copro_request(struct aspeed_gpio *gpio,
>  				      unsigned int offset)
>  {
> -	const struct aspeed_gpio_bank *bank =3D to_bank(offset);
> -
> -	if (!copro_ops || !gpio->cf_copro_bankmap)
> -		return false;
> -	if (!gpio->cf_copro_bankmap[offset >> 3])
> -		return false;
> -	if (!copro_ops->request_access)
> -		return false;
> +	if (gpio->config->llops->copro_request)
> +		return gpio->config->llops->copro_request(gpio, offset);
> =20
> -	/* Pause the coprocessor */
> -	copro_ops->request_access(copro_data);
> -
> -	/* Change command source back to ARM */
> -	aspeed_gpio_change_cmd_source(gpio, bank, offset >> 3, GPIO_CMDSRC_ARM)=
;
> -
> -	/* Update cache */
> -	gpio->dcache[GPIO_BANK(offset)] =3D ioread32(bank_reg(gpio, bank, reg_r=
data));
> -
> -	return true;
> +	return false;
>  }
> =20
>  static void aspeed_gpio_copro_release(struct aspeed_gpio *gpio,
>  				      unsigned int offset)
>  {
> -	const struct aspeed_gpio_bank *bank =3D to_bank(offset);
> -
> -	if (!copro_ops || !gpio->cf_copro_bankmap)
> -		return;
> -	if (!gpio->cf_copro_bankmap[offset >> 3])
> -		return;
> -	if (!copro_ops->release_access)
> -		return;
> -
> -	/* Change command source back to ColdFire */
> -	aspeed_gpio_change_cmd_source(gpio, bank, offset >> 3,
> -				      GPIO_CMDSRC_COLDFIRE);
> -
> -	/* Restart the coprocessor */
> -	copro_ops->release_access(copro_data);
> +	if (gpio->config->llops->copro_release)
> +		gpio->config->llops->copro_release(gpio, offset);
>  }
> =20
>  static int aspeed_gpio_get(struct gpio_chip *gc, unsigned int offset)
>  {
>  	struct aspeed_gpio *gpio =3D gpiochip_get_data(gc);
> -	const struct aspeed_gpio_bank *bank =3D to_bank(offset);
> =20
> -	return !!(ioread32(bank_reg(gpio, bank, reg_val)) & GPIO_BIT(offset));
> +	return gpio->config->llops->reg_bits_read(gpio, offset, reg_val);
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
> +	gpio->config->llops->reg_bits_set(gpio, offset, reg_val, val);
>  }
> =20
>  static void aspeed_gpio_set(struct gpio_chip *gc, unsigned int offset,
> @@ -404,7 +362,7 @@ static void aspeed_gpio_set(struct gpio_chip *gc, uns=
igned int offset,
>  {
>  	struct aspeed_gpio *gpio =3D gpiochip_get_data(gc);
>  	unsigned long flags;
> -	bool copro;
> +	bool copro =3D 0;

Isn't this a dead store? If it's not, can we use `false` instead to
align with the `bool` type?

If it is a dead store can you please address the rest of the instances
throughout the patch?

> =20
>  	raw_spin_lock_irqsave(&gpio->lock, flags);
>  	copro =3D aspeed_gpio_copro_request(gpio, offset);
> @@ -419,22 +377,16 @@ static void aspeed_gpio_set(struct gpio_chip *gc, u=
nsigned int offset,
>  static int aspeed_gpio_dir_in(struct gpio_chip *gc, unsigned int offset)
>  {
>  	struct aspeed_gpio *gpio =3D gpiochip_get_data(gc);
> -	const struct aspeed_gpio_bank *bank =3D to_bank(offset);
> -	void __iomem *addr =3D bank_reg(gpio, bank, reg_dir);
>  	unsigned long flags;
> -	bool copro;
> -	u32 reg;
> +	bool copro =3D 0;
> =20
>  	if (!have_input(gpio, offset))
>  		return -ENOTSUPP;
> =20
>  	raw_spin_lock_irqsave(&gpio->lock, flags);
> =20
> -	reg =3D ioread32(addr);
> -	reg &=3D ~GPIO_BIT(offset);
> -
>  	copro =3D aspeed_gpio_copro_request(gpio, offset);
> -	iowrite32(reg, addr);
> +	gpio->config->llops->reg_bits_set(gpio, offset, reg_dir, 0);
>  	if (copro)
>  		aspeed_gpio_copro_release(gpio, offset);
> =20
> @@ -447,23 +399,17 @@ static int aspeed_gpio_dir_out(struct gpio_chip *gc=
,
>  			       unsigned int offset, int val)
>  {
>  	struct aspeed_gpio *gpio =3D gpiochip_get_data(gc);
> -	const struct aspeed_gpio_bank *bank =3D to_bank(offset);
> -	void __iomem *addr =3D bank_reg(gpio, bank, reg_dir);
>  	unsigned long flags;
> -	bool copro;
> -	u32 reg;
> +	bool copro =3D 0;
> =20
>  	if (!have_output(gpio, offset))
>  		return -ENOTSUPP;
> =20
>  	raw_spin_lock_irqsave(&gpio->lock, flags);
> =20
> -	reg =3D ioread32(addr);
> -	reg |=3D GPIO_BIT(offset);
> -
>  	copro =3D aspeed_gpio_copro_request(gpio, offset);
>  	__aspeed_gpio_set(gc, offset, val);
> -	iowrite32(reg, addr);
> +	gpio->config->llops->reg_bits_set(gpio, offset, reg_dir, 1);
> =20
>  	if (copro)
>  		aspeed_gpio_copro_release(gpio, offset);
> @@ -475,7 +421,6 @@ static int aspeed_gpio_dir_out(struct gpio_chip *gc,
>  static int aspeed_gpio_get_direction(struct gpio_chip *gc, unsigned int =
offset)
>  {
>  	struct aspeed_gpio *gpio =3D gpiochip_get_data(gc);
> -	const struct aspeed_gpio_bank *bank =3D to_bank(offset);
>  	unsigned long flags;
>  	u32 val;
> =20
> @@ -487,7 +432,7 @@ static int aspeed_gpio_get_direction(struct gpio_chip=
 *gc, unsigned int offset)
> =20
>  	raw_spin_lock_irqsave(&gpio->lock, flags);
> =20
> -	val =3D ioread32(bank_reg(gpio, bank, reg_dir)) & GPIO_BIT(offset);
> +	val =3D gpio->config->llops->reg_bits_read(gpio, offset, reg_dir);
> =20
>  	raw_spin_unlock_irqrestore(&gpio->lock, flags);
> =20
> @@ -496,8 +441,7 @@ static int aspeed_gpio_get_direction(struct gpio_chip=
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
> @@ -510,32 +454,25 @@ static inline int irqd_to_aspeed_gpio_data(struct i=
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
> -	bool copro;
> -	u32 bit;
> +	bool copro =3D 0;
> =20
> -	rc =3D irqd_to_aspeed_gpio_data(d, &gpio, &bank, &bit, &offset);
> +	rc =3D irqd_to_aspeed_gpio_data(d, &gpio, &offset);
>  	if (rc)
>  		return;
> =20
> -	status_addr =3D bank_reg(gpio, bank, reg_irq_status);
> -
>  	raw_spin_lock_irqsave(&gpio->lock, flags);
>  	copro =3D aspeed_gpio_copro_request(gpio, offset);
> =20
> -	iowrite32(bit, status_addr);
> +	gpio->config->llops->reg_bits_set(gpio, offset, reg_irq_status, 1);
> =20
>  	if (copro)
>  		aspeed_gpio_copro_release(gpio, offset);
> @@ -544,20 +481,15 @@ static void aspeed_gpio_irq_ack(struct irq_data *d)
> =20
>  static void aspeed_gpio_irq_set_mask(struct irq_data *d, bool set)
>  {
> -	const struct aspeed_gpio_bank *bank;
>  	struct aspeed_gpio *gpio;
>  	unsigned long flags;
> -	u32 reg, bit;
> -	void __iomem *addr;
>  	int rc, offset;
> -	bool copro;
> +	bool copro =3D 0;
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
> @@ -565,12 +497,7 @@ static void aspeed_gpio_irq_set_mask(struct irq_data=
 *d, bool set)
>  	raw_spin_lock_irqsave(&gpio->lock, flags);
>  	copro =3D aspeed_gpio_copro_request(gpio, offset);
> =20
> -	reg =3D ioread32(addr);
> -	if (set)
> -		reg |=3D bit;
> -	else
> -		reg &=3D ~bit;
> -	iowrite32(reg, addr);
> +	gpio->config->llops->reg_bits_set(gpio, offset, reg_irq_enable, set);
> =20
>  	if (copro)
>  		aspeed_gpio_copro_release(gpio, offset);
> @@ -596,34 +523,31 @@ static int aspeed_gpio_set_type(struct irq_data *d,=
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
> -	bool copro;
> +	bool copro =3D 0;
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
> @@ -633,20 +557,9 @@ static int aspeed_gpio_set_type(struct irq_data *d, =
unsigned int type)
>  	raw_spin_lock_irqsave(&gpio->lock, flags);
>  	copro =3D aspeed_gpio_copro_request(gpio, offset);
> =20
> -	addr =3D bank_reg(gpio, bank, reg_irq_type0);
> -	reg =3D ioread32(addr);
> -	reg =3D (reg & ~bit) | type0;
> -	iowrite32(reg, addr);
> -
> -	addr =3D bank_reg(gpio, bank, reg_irq_type1);
> -	reg =3D ioread32(addr);
> -	reg =3D (reg & ~bit) | type1;
> -	iowrite32(reg, addr);
> -
> -	addr =3D bank_reg(gpio, bank, reg_irq_type2);
> -	reg =3D ioread32(addr);
> -	reg =3D (reg & ~bit) | type2;
> -	iowrite32(reg, addr);
> +	gpio->config->llops->reg_bits_set(gpio, offset, reg_irq_type0, type0);
> +	gpio->config->llops->reg_bits_set(gpio, offset, reg_irq_type1, type1);
> +	gpio->config->llops->reg_bits_set(gpio, offset, reg_irq_type2, type2);
> =20
>  	if (copro)
>  		aspeed_gpio_copro_release(gpio, offset);
> @@ -661,7 +574,6 @@ static void aspeed_gpio_irq_handler(struct irq_desc *=
desc)
>  {
>  	struct gpio_chip *gc =3D irq_desc_get_handler_data(desc);
>  	struct irq_chip *ic =3D irq_desc_get_chip(desc);
> -	struct aspeed_gpio *data =3D gpiochip_get_data(gc);
>  	unsigned int i, p, banks;
>  	unsigned long reg;
>  	struct aspeed_gpio *gpio =3D gpiochip_get_data(gc);
> @@ -670,9 +582,7 @@ static void aspeed_gpio_irq_handler(struct irq_desc *=
desc)
> =20
>  	banks =3D DIV_ROUND_UP(gpio->chip.ngpio, 32);
>  	for (i =3D 0; i < banks; i++) {
> -		const struct aspeed_gpio_bank *bank =3D &aspeed_gpio_banks[i];
> -
> -		reg =3D ioread32(bank_reg(data, bank, reg_irq_status));
> +		reg =3D gpio->config->llops->reg_bits_read(gpio, i, reg_irq_status);
> =20
>  		for_each_set_bit(p, &reg, 32)
>  			generic_handle_domain_irq(gc->irq.domain, i * 32 + p);
> @@ -711,23 +621,12 @@ static int aspeed_gpio_reset_tolerance(struct gpio_=
chip *chip,
>  {
>  	struct aspeed_gpio *gpio =3D gpiochip_get_data(chip);
>  	unsigned long flags;
> -	void __iomem *treg;
> -	bool copro;
> -	u32 val;
> -
> -	treg =3D bank_reg(gpio, to_bank(offset), reg_tolerance);
> +	bool copro =3D 0;
> =20
>  	raw_spin_lock_irqsave(&gpio->lock, flags);
>  	copro =3D aspeed_gpio_copro_request(gpio, offset);
> =20
> -	val =3D readl(treg);
> -
> -	if (enable)
> -		val |=3D GPIO_BIT(offset);
> -	else
> -		val &=3D ~GPIO_BIT(offset);
> -
> -	writel(val, treg);
> +	gpio->config->llops->reg_bits_set(gpio, offset, reg_tolerance, enable);
> =20
>  	if (copro)
>  		aspeed_gpio_copro_release(gpio, offset);
> @@ -821,21 +720,11 @@ static inline bool timer_allocation_registered(stru=
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
> +	gpio->config->llops->reg_bits_set(gpio, offset, reg_debounce_sel1, !!(t=
imer & BIT(1)));
> +	gpio->config->llops->reg_bits_set(gpio, offset, reg_debounce_sel2, !!(t=
imer & BIT(0)));
>  }
> =20
>  static int enable_debounce(struct gpio_chip *chip, unsigned int offset,
> @@ -866,15 +755,15 @@ static int enable_debounce(struct gpio_chip *chip, =
unsigned int offset,
>  	}
> =20
>  	/* Try to find a timer already configured for the debounce period */
> -	for (i =3D 1; i < ARRAY_SIZE(debounce_timers); i++) {
> +	for (i =3D 1; i < gpio->config->debounce_timers_num; i++) {
>  		u32 cycles;
> =20
> -		cycles =3D ioread32(gpio->base + debounce_timers[i]);
> +		cycles =3D ioread32(gpio->base + gpio->config->debounce_timers_array[i=
]);
>  		if (requested_cycles =3D=3D cycles)
>  			break;
>  	}
> =20
> -	if (i =3D=3D ARRAY_SIZE(debounce_timers)) {
> +	if (i =3D=3D gpio->config->debounce_timers_num) {
>  		int j;
> =20
>  		/*
> @@ -888,8 +777,8 @@ static int enable_debounce(struct gpio_chip *chip, un=
signed int offset,
> =20
>  		if (j =3D=3D ARRAY_SIZE(gpio->timer_users)) {
>  			dev_warn(chip->parent,
> -					"Debounce timers exhausted, cannot debounce for period %luus\n",
> -					usecs);
> +				 "Debounce timers exhausted, cannot debounce for period %luus\n",
> +				 usecs);
> =20
>  			rc =3D -EPERM;
> =20
> @@ -905,7 +794,7 @@ static int enable_debounce(struct gpio_chip *chip, un=
signed int offset,
> =20
>  		i =3D j;
> =20
> -		iowrite32(requested_cycles, gpio->base + debounce_timers[i]);
> +		iowrite32(requested_cycles, gpio->base + gpio->config->debounce_timers=
_array[i]);
>  	}
> =20
>  	if (WARN(i =3D=3D 0, "Cannot register index of disabled timer\n")) {
> @@ -1008,6 +897,9 @@ int aspeed_gpio_copro_grab_gpio(struct gpio_desc *de=
sc,
>  	const struct aspeed_gpio_bank *bank =3D to_bank(offset);
>  	unsigned long flags;
> =20
> +	if (!gpio->config->cmd_source_supoort)
> +		return -EOPNOTSUPP;
> +
>  	if (!gpio->cf_copro_bankmap)
>  		gpio->cf_copro_bankmap =3D kzalloc(gpio->chip.ngpio >> 3, GFP_KERNEL);
>  	if (!gpio->cf_copro_bankmap)
> @@ -1027,7 +919,7 @@ int aspeed_gpio_copro_grab_gpio(struct gpio_desc *de=
sc,
> =20
>  	/* Switch command source */
>  	if (gpio->cf_copro_bankmap[bindex] =3D=3D 1)
> -		aspeed_gpio_change_cmd_source(gpio, bank, bindex,
> +		aspeed_gpio_change_cmd_source(gpio, offset,
>  					      GPIO_CMDSRC_COLDFIRE);
> =20
>  	if (vreg_offset)
> @@ -1051,9 +943,11 @@ int aspeed_gpio_copro_release_gpio(struct gpio_desc=
 *desc)
>  	struct gpio_chip *chip =3D gpiod_to_chip(desc);
>  	struct aspeed_gpio *gpio =3D gpiochip_get_data(chip);
>  	int rc =3D 0, bindex, offset =3D gpio_chip_hwgpio(desc);
> -	const struct aspeed_gpio_bank *bank =3D to_bank(offset);
>  	unsigned long flags;
> =20
> +	if (!gpio->config->cmd_source_supoort)
> +		return -EOPNOTSUPP;
> +
>  	if (!gpio->cf_copro_bankmap)
>  		return -ENXIO;
> =20
> @@ -1072,7 +966,7 @@ int aspeed_gpio_copro_release_gpio(struct gpio_desc =
*desc)
> =20
>  	/* Switch command source */
>  	if (gpio->cf_copro_bankmap[bindex] =3D=3D 0)
> -		aspeed_gpio_change_cmd_source(gpio, bank, bindex,
> +		aspeed_gpio_change_cmd_source(gpio, offset,
>  					      GPIO_CMDSRC_ARM);
>   bail:
>  	raw_spin_unlock_irqrestore(&gpio->lock, flags);
> @@ -1082,12 +976,10 @@ EXPORT_SYMBOL_GPL(aspeed_gpio_copro_release_gpio);
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
> @@ -1104,6 +996,78 @@ static const struct irq_chip aspeed_gpio_irq_chip =
=3D {
>  	GPIOCHIP_IRQ_RESOURCE_HELPERS,
>  };
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

Perhaps the type of `val` should be `bool` for now to indicate it can
only handle a single bit? Maybe "_bits_" in the function names is
unhelpful too, and that should be just "_bit_"?

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
> +static bool aspeed_g4_copro_request(struct aspeed_gpio *gpio, unsigned i=
nt offset)
> +{
> +	const struct aspeed_gpio_bank *bank =3D to_bank(offset);
> +
> +	if (!copro_ops || !gpio->cf_copro_bankmap)
> +		return false;
> +	if (!gpio->cf_copro_bankmap[offset >> 3])
> +		return false;
> +	if (!copro_ops->request_access)
> +		return false;
> +
> +	/* Pause the coprocessor */
> +	copro_ops->request_access(copro_data);
> +
> +	/* Change command source back to ARM */
> +	aspeed_gpio_change_cmd_source(gpio, offset, GPIO_CMDSRC_ARM);
> +
> +	/* Update cache */
> +	gpio->dcache[GPIO_BANK(offset)] =3D ioread32(bank_reg(gpio, bank, reg_r=
data));
> +
> +	return true;
> +}
> +
> +static void aspeed_g4_copro_release(struct aspeed_gpio *gpio, unsigned i=
nt offset)
> +{
> +	if (!copro_ops || !gpio->cf_copro_bankmap)
> +		return;
> +	if (!gpio->cf_copro_bankmap[offset >> 3])
> +		return;
> +	if (!copro_ops->release_access)
> +		return;
> +
> +	/* Change command source back to ColdFire */
> +	aspeed_gpio_change_cmd_source(gpio, offset, GPIO_CMDSRC_COLDFIRE);
> +
> +	/* Restart the coprocessor */
> +	copro_ops->release_access(copro_data);
> +}
> +
> +static const struct aspeed_gpio_llops aspeed_g4_llops =3D {
> +	.copro_request =3D aspeed_g4_copro_request,
> +	.copro_release =3D aspeed_g4_copro_release,
> +	.reg_bits_set =3D aspeed_g4_reg_bits_set,
> +	.reg_bits_read =3D aspeed_g4_reg_bits_read,
> +};
>  /*
>   * Any banks not specified in a struct aspeed_bank_props array are assum=
ed to
>   * have the properties:
> @@ -1120,7 +1084,14 @@ static const struct aspeed_bank_props ast2400_bank=
_props[] =3D {
> =20
>  static const struct aspeed_gpio_config ast2400_config =3D
>  	/* 220 for simplicity, really 216 with two 4-GPIO holes, four at end */
> -	{ .nr_gpios =3D 220, .props =3D ast2400_bank_props, };
> +	{
> +		.nr_gpios =3D 220,
> +		.props =3D ast2400_bank_props,
> +		.llops =3D &aspeed_g4_llops,
> +		.debounce_timers_array =3D debounce_timers,
> +		.debounce_timers_num =3D ARRAY_SIZE(debounce_timers),
> +		.cmd_source_supoort =3D true,
> +	};
> =20
>  static const struct aspeed_bank_props ast2500_bank_props[] =3D {
>  	/*     input	  output   */
> @@ -1132,7 +1103,14 @@ static const struct aspeed_bank_props ast2500_bank=
_props[] =3D {
> =20
>  static const struct aspeed_gpio_config ast2500_config =3D
>  	/* 232 for simplicity, actual number is 228 (4-GPIO hole in GPIOAB) */
> -	{ .nr_gpios =3D 232, .props =3D ast2500_bank_props, };
> +	{
> +		.nr_gpios =3D 232,
> +		.props =3D ast2500_bank_props,
> +		.llops =3D &aspeed_g4_llops,
> +		.debounce_timers_array =3D debounce_timers,
> +		.debounce_timers_num =3D ARRAY_SIZE(debounce_timers),
> +		.cmd_source_supoort =3D true,
> +	};
> =20
>  static const struct aspeed_bank_props ast2600_bank_props[] =3D {
>  	/*     input	  output   */
> @@ -1148,7 +1126,14 @@ static const struct aspeed_gpio_config ast2600_con=
fig =3D
>  	 * We expect ngpio being set in the device tree and this is a fallback
>  	 * option.
>  	 */
> -	{ .nr_gpios =3D 208, .props =3D ast2600_bank_props, };
> +	{
> +		.nr_gpios =3D 208,
> +		.props =3D ast2600_bank_props,
> +		.llops =3D &aspeed_g4_llops,
> +		.debounce_timers_array =3D debounce_timers,
> +		.debounce_timers_num =3D ARRAY_SIZE(debounce_timers),
> +		.cmd_source_supoort =3D true,
> +	};
> =20
>  static const struct of_device_id aspeed_gpio_of_table[] =3D {
>  	{ .compatible =3D "aspeed,ast2400-gpio", .data =3D &ast2400_config, },
> @@ -1191,6 +1176,9 @@ static int __init aspeed_gpio_probe(struct platform=
_device *pdev)
> =20
>  	gpio->config =3D gpio_id->data;
> =20
> +	if (!gpio->config->llops->reg_bits_set || !gpio->config->llops->reg_bit=
s_read)
> +		return -EOPNOTSUPP;
> +

Hmm, not quite sure about -EOPNOTSUPP. -EINVAL might be better. Given
it's a programming error I think it deserves a log message as well, as
ultimately it should never be hit, and if it is we want to clear up the
confusion quickly.

Andrew

