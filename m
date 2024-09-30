Return-Path: <linux-gpio+bounces-10542-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 605AB9899AE
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 06:04:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDDCEB218C2
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 04:04:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D8663C466;
	Mon, 30 Sep 2024 04:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="ghKk2FqK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460541B815;
	Mon, 30 Sep 2024 04:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727669068; cv=none; b=DOufM0qtQFKIfp1guAs5DruJiZ9EVw9XrLuI5e7tLLCXqGnNqJLj0Ggqye8k4stzm9fJzqzvFU/H3F4RU5ZIDuQGjqz3k2PINrWwOE3r5AYCVN96BNjxPJqEX/4EeFnDrkI+DN5xS1301/fVGg0BUyRLZ9ZTBhdmEyH1zLowN6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727669068; c=relaxed/simple;
	bh=840uT3Km0xUBnFqUPiypQbF/mRBye+MyiXm4njUGB4o=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zmi+tXyPYATFu2ojIJA+qcpyXbIudvyy0QcSk5fWHLF+p7KVjDpIa6tUKKwqvQO3blL2u2pO76FRQgmoTHDF6+xAN4ADtP+H1fSZ+1a4CTU85TzPOlCrNgqeT1ku9D5Q7tXdnNFP4xZfwyryLFY4e2QBWJFSs+b6U+k2GqEE/Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=ghKk2FqK; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727669064;
	bh=/M+0pVUG7o7hMpNjYeNxjriFTZQ7E3PhpaSAttbh8nI=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=ghKk2FqKS2+mcOlfUvfFqdNm0V+CiJil1psaTH72C36BjnBTxn1zguSEpzLQrgexH
	 1Cmu/H1QsBYgplZlAz6tnnhRv05rdxhyMzJutbrWrYw1H5CXKZjnPTPDyQXRmVctd4
	 nRwy4x3E0ZGtESu/RzYxaAj6iCi+4qa73VMMYCd1pwB7ofrR+Ye7bd/al6txq+gJSh
	 J0i2tur/Qk79JMs8ANmAxQO2+XNIG2lLFoIuPW3W1wMgSgIsMDVnH60deXXcR7RDeD
	 qGfOMhd/dumejuKgpoBPlKaw9vmpQR7lL9kx2F3JYI7A9al2vxcL9rsSVTXHL4AzV+
	 l2sCmay4V5ghQ==
Received: from [192.168.68.112] (ppp118-210-73-17.adl-adc-lon-bras32.tpg.internode.on.net [118.210.73.17])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 2B4516511E;
	Mon, 30 Sep 2024 12:04:23 +0800 (AWST)
Message-ID: <24164aadbe5628cea4f10b0028a5ddf6c1fb29f2.camel@codeconstruct.com.au>
Subject: Re: [PATCH v6 4/7] gpio: aspeed: Support G7 Aspeed gpio controller
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org, 
 brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 joel@jms.id.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com,
 Peter.Yin@quantatw.com,  Jay_Zhang@wiwynn.com
Date: Mon, 30 Sep 2024 13:34:22 +0930
In-Reply-To: <20240927111744.3511373-5-billy_tsai@aspeedtech.com>
References: <20240927111744.3511373-1-billy_tsai@aspeedtech.com>
	 <20240927111744.3511373-5-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-09-27 at 19:17 +0800, Billy Tsai wrote:
> In the 7th generation of the SoC from Aspeed, the control logic of the
> GPIO controller has been updated to support per-pin control. Each pin now
> has its own 32-bit register, allowing for individual control of the pin's
> value, direction, interrupt type, and other settings. The permission for
> coprocessor access is supported by the hardware but hasn't been
> implemented in the current patch.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/gpio/gpio-aspeed.c | 132 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 132 insertions(+)
>=20
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index 3ed58289a4a8..1be9a7aa9e8b 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -30,6 +30,27 @@
>  #include <linux/gpio/consumer.h>
>  #include "gpiolib.h"
> =20
> +/* Non-constant mask variant of FIELD_GET() and FIELD_PREP() */
> +#define field_get(_mask, _reg)	(((_reg) & (_mask)) >> (ffs(_mask) - 1))
> +#define field_prep(_mask, _val)	(((_val) << (ffs(_mask) - 1)) & (_mask))
> +
> +#define GPIO_G7_IRQ_STS_BASE 0x100
> +#define GPIO_G7_IRQ_STS_OFFSET(x) (GPIO_G7_IRQ_STS_BASE + (x) * 0x4)
> +#define GPIO_G7_CTRL_REG_BASE 0x180
> +#define GPIO_G7_CTRL_REG_OFFSET(x) (GPIO_G7_CTRL_REG_BASE + (x) * 0x4)
> +#define GPIO_G7_CTRL_OUT_DATA BIT(0)
> +#define GPIO_G7_CTRL_DIR BIT(1)
> +#define GPIO_G7_CTRL_IRQ_EN BIT(2)
> +#define GPIO_G7_CTRL_IRQ_TYPE0 BIT(3)
> +#define GPIO_G7_CTRL_IRQ_TYPE1 BIT(4)
> +#define GPIO_G7_CTRL_IRQ_TYPE2 BIT(5)
> +#define GPIO_G7_CTRL_RST_TOLERANCE BIT(6)
> +#define GPIO_G7_CTRL_DEBOUNCE_SEL2 BIT(7)
> +#define GPIO_G7_CTRL_DEBOUNCE_SEL1 BIT(8)
> +#define GPIO_G7_CTRL_INPUT_MASK BIT(9)
> +#define GPIO_G7_CTRL_IRQ_STS BIT(12)
> +#define GPIO_G7_CTRL_IN_DATA BIT(13)
> +
>  struct aspeed_bank_props {
>  	unsigned int bank;
>  	u32 input;
> @@ -95,6 +116,7 @@ struct aspeed_gpio_bank {
>   */
> =20
>  static const int debounce_timers[4] =3D { 0x00, 0x50, 0x54, 0x58 };
> +static const int g7_debounce_timers[4] =3D { 0x00, 0x04, 0x00, 0x08 };

Why is 0 listed twice here?

That might be worth a comment if there's a good reason?

> =20
>  static const struct aspeed_gpio_copro_ops *copro_ops;
>  static void *copro_data;
> @@ -250,6 +272,39 @@ static void __iomem *aspeed_gpio_g4_bank_reg(struct =
aspeed_gpio *gpio,
>  	BUG();
>  }
> =20
> +static u32 aspeed_gpio_g7_reg_mask(const enum aspeed_gpio_reg reg)
> +{
> +	switch (reg) {
> +	case reg_val:
> +		return GPIO_G7_CTRL_OUT_DATA;
> +	case reg_dir:
> +		return GPIO_G7_CTRL_DIR;
> +	case reg_irq_enable:
> +		return GPIO_G7_CTRL_IRQ_EN;
> +	case reg_irq_type0:
> +		return GPIO_G7_CTRL_IRQ_TYPE0;
> +	case reg_irq_type1:
> +		return GPIO_G7_CTRL_IRQ_TYPE1;
> +	case reg_irq_type2:
> +		return GPIO_G7_CTRL_IRQ_TYPE2;
> +	case reg_tolerance:
> +		return GPIO_G7_CTRL_RST_TOLERANCE;
> +	case reg_debounce_sel1:
> +		return GPIO_G7_CTRL_DEBOUNCE_SEL1;
> +	case reg_debounce_sel2:
> +		return GPIO_G7_CTRL_DEBOUNCE_SEL2;
> +	case reg_rdata:
> +		return GPIO_G7_CTRL_OUT_DATA;
> +	case reg_irq_status:
> +		return GPIO_G7_CTRL_IRQ_STS;
> +	case reg_cmdsrc0:
> +	case reg_cmdsrc1:
> +	default:
> +		WARN_ON_ONCE(1);
> +		return 0;
> +	}
> +}
> +
>  #define GPIO_BANK(x)	((x) >> 5)
>  #define GPIO_OFFSET(x)	((x) & 0x1f)
>  #define GPIO_BIT(x)	BIT(GPIO_OFFSET(x))
> @@ -1106,6 +1161,59 @@ static const struct aspeed_gpio_llops aspeed_g4_ll=
ops =3D {
>  	.privilege_ctrl =3D aspeed_g4_privilege_ctrl,
>  	.privilege_init =3D aspeed_g4_privilege_init,
>  };
> +
> +static void aspeed_g7_reg_bit_set(struct aspeed_gpio *gpio, unsigned int=
 offset,
> +				  const enum aspeed_gpio_reg reg, bool val)
> +{
> +	u32 mask =3D aspeed_gpio_g7_reg_mask(reg);
> +	void __iomem *addr =3D gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);
> +	u32 write_val;
> +
> +	if (mask) {
> +		write_val =3D (ioread32(addr) & ~(mask)) | field_prep(mask, val);
> +		iowrite32(write_val, addr);
> +	}
> +}
> +
> +static bool aspeed_g7_reg_bit_get(struct aspeed_gpio *gpio, unsigned int=
 offset,
> +				  const enum aspeed_gpio_reg reg)
> +{
> +	u32 mask =3D aspeed_gpio_g7_reg_mask(reg);
> +	void __iomem *addr;
> +
> +	addr =3D gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);
> +	if (reg =3D=3D reg_val)
> +		mask =3D GPIO_G7_CTRL_IN_DATA;
> +
> +	if (mask)
> +		return field_get(mask, ioread32(addr));
> +	else
> +		return 0;
> +}
> +
> +static int aspeed_g7_reg_bank_get(struct aspeed_gpio *gpio, unsigned int=
 offset,
> +				  const enum aspeed_gpio_reg reg)
> +{
> +	void __iomem *addr;
> +
> +	if (reg =3D=3D reg_irq_status) {
> +		addr =3D gpio->base + GPIO_G7_IRQ_STS_OFFSET(offset >> 5);
> +		return ioread32(addr);
> +	} else {
> +		return -EOPNOTSUPP;
> +	}
> +}
> +
> +static const struct aspeed_gpio_llops aspeed_g7_llops =3D {
> +	.copro_request =3D NULL,
> +	.copro_release =3D NULL,
> +	.reg_bit_set =3D aspeed_g7_reg_bit_set,
> +	.reg_bit_get =3D aspeed_g7_reg_bit_get,
> +	.reg_bank_get =3D aspeed_g7_reg_bank_get,
> +	.privilege_ctrl =3D NULL,
> +	.privilege_init =3D NULL,
> +};

Same minor nitpick about the ordering if you respin the series.

Andrew

