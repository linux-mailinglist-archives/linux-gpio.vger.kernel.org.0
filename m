Return-Path: <linux-gpio+bounces-10393-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BCD983AF5
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Sep 2024 03:39:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9FD8B21EC5
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Sep 2024 01:39:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 798491C32;
	Tue, 24 Sep 2024 01:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="dnp3D1Lg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2281DECF;
	Tue, 24 Sep 2024 01:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727141962; cv=none; b=XeOtUxl3etRKOI5Rm/ftpn0qxYUMu178utsVDhMney91id6uWBflj/XAVlf7lcP2RO+czAkV55vnlTx6/FcHeCsPb5qsG4opYnAVbobBKONt1LqplE919c2B732o/xwp69rUfuCBoe0b3p5a3XfBAVOL0DwDew4xvwF+Xp+5Jr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727141962; c=relaxed/simple;
	bh=mr9Ly1kS9BGBF0qc/4Dn48iCyzM0FRHD01OLGZq3LT8=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r4xJjGwGg/5D98xQszb21pikefIT8WL59OROVajc21QK39l7FbPdIT7tMeKJZ2UKuY/du35Oc/BvKQ2lzBVptQyOdhdzA55Aqg9fAXVMaS+su8GwHQ1jc4Lej+2V9EQyfG+mYrmdxBJK/4j3UE2JeJd4XBiT5VEOOVY+AawuvUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=dnp3D1Lg; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1727141951;
	bh=bFM+1Drubnp3netrJw2gcQEIclelNL2Zh/zdkioY7cI=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=dnp3D1LgSJCL3xFayUpH+FD5nPw/an1J51a8EbQNXjECROAPP1MsU3YtpkCPxNQRc
	 /2959bQ8J5OBQnG47fIeCcsX/3Trdy4ngdICuWKOG93HtxOgyrOvF2YApS6vfmR/fE
	 p/HJQfL13fTBXcsioDiJLV2Adg8I7UZnNsvAbtGkLdpuk1y9yMprEzSShRpDye12Rk
	 6T8zTO5G7fjzWKzH0siq+UvoNOBZ+6riAndEmDpRst8niPYehfBsF2dU8BBw2+LHeo
	 OgmG3i1wxS93V3CQGM62lMvH1YNyN2wQIomAocHpwPrALbUhjwJU8qxwO9rJRb6Gav
	 /VyMaHzG/QM/A==
Received: from [192.168.68.112] (ppp118-210-177-92.adl-adc-lon-bras34.tpg.internode.on.net [118.210.177.92])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id A75566502A;
	Tue, 24 Sep 2024 09:39:09 +0800 (AWST)
Message-ID: <fe54dfef05d67a44a60eb497cdc052aeeed4a4d0.camel@codeconstruct.com.au>
Subject: Re: [PATCH v5 4/6] gpio: aspeed: Support G7 Aspeed gpio controller
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org, 
 brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 joel@jms.id.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com,
 Peter.Yin@quantatw.com,  Jay_Zhang@wiwynn.com
Date: Tue, 24 Sep 2024 11:09:09 +0930
In-Reply-To: <20240923100611.1597113-5-billy_tsai@aspeedtech.com>
References: <20240923100611.1597113-1-billy_tsai@aspeedtech.com>
	 <20240923100611.1597113-5-billy_tsai@aspeedtech.com>
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

On Mon, 2024-09-23 at 18:06 +0800, Billy Tsai wrote:
> In the 7th generation of the SoC from Aspeed, the control logic of the
> GPIO controller has been updated to support per-pin control. Each pin now
> has its own 32-bit register, allowing for individual control of the pin's
> value, direction, interrupt type, and other settings. The permission for
> coprocessor access is supported by the hardware but hasn't been
> implemented in the current patch.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/gpio/gpio-aspeed.c | 122 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 122 insertions(+)
>=20
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index d3994d833684..7418d65be721 100644
> --- a/drivers/gpio/gpio-aspeed.c
> +++ b/drivers/gpio/gpio-aspeed.c
> @@ -30,6 +30,23 @@
>  #include <linux/gpio/consumer.h>
>  #include "gpiolib.h"
> =20
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
> @@ -95,6 +112,7 @@ struct aspeed_gpio_bank {
>   */
> =20
>  static const int debounce_timers[4] =3D { 0x00, 0x50, 0x54, 0x58 };
> +static const int g7_debounce_timers[4] =3D { 0x00, 0x04, 0x00, 0x08 };
> =20
>  static const struct aspeed_gpio_copro_ops *copro_ops;
>  static void *copro_data;
> @@ -250,6 +268,39 @@ static inline void __iomem *bank_reg(struct aspeed_g=
pio *gpio,
>  	BUG();
>  }
> =20
> +static inline u32 reg_mask(const enum aspeed_gpio_reg reg)

This is specific to the AST2700/G7, can you name it as such? Also I
find in helpful when reading backtraces if even static functions are
prefixed with e.g. aspeed_gpio_.

Other than that, the broad preference is to not mark functions as
inline. The function is already static and the keyword is at best a
hint, the compiler will decide what it thinks is best either way.

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
> @@ -1106,6 +1157,53 @@ static const struct aspeed_gpio_llops aspeed_g4_ll=
ops =3D {
>  	.privilege_ctrl =3D aspeed_g4_privilege_ctrl,
>  	.privilege_init =3D aspeed_g4_privilege_init,
>  };
> +
> +static void aspeed_g7_reg_bit_set(struct aspeed_gpio *gpio, unsigned int=
 offset,
> +				  const enum aspeed_gpio_reg reg, bool val)
> +{
> +	u32 mask =3D reg_mask(reg);
> +	void __iomem *addr =3D gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);
> +	u32 write_val =3D (ioread32(addr) & ~(mask)) | (((val) << (ffs(mask) - =
1)) & (mask));

Might be worth poking at whether there are existing macros or functions
that can more clearly describe this bit-hackery :)

Subtracting 1 from 0 to feed a shift is problematic.

> +
> +	iowrite32(write_val, addr);
> +}
> +
> +static bool aspeed_g7_reg_bit_get(struct aspeed_gpio *gpio, unsigned int=
 offset,
> +				  const enum aspeed_gpio_reg reg)
> +{
> +	u32 mask =3D reg_mask(reg);
> +	void __iomem *addr;
> +
> +	addr =3D gpio->base + GPIO_G7_CTRL_REG_OFFSET(offset);
> +	if (reg =3D=3D reg_val)
> +		mask =3D GPIO_G7_CTRL_IN_DATA;
> +
> +	return (((ioread32(addr)) & (mask)) >> (ffs(mask) - 1));

Again, can we avoid open-coding the bit-hackery? The subtraction is
still problematic.

Andrew

