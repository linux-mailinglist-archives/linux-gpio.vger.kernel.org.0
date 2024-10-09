Return-Path: <linux-gpio+bounces-11084-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C20995DA5
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 04:12:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F34E9286646
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Oct 2024 02:12:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B33C46BFCA;
	Wed,  9 Oct 2024 02:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="fTvC5No2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B69F915C3;
	Wed,  9 Oct 2024 02:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728439968; cv=none; b=CQ3iKMVipwGJEKizrhNPsYC936BEL3B3V61Pbhv6kjOHyxlf0+t3Y0vt7dy8ygfrpQYPs0UqVYGjYTrVO4Wt4IKvHirO4nSG4NdvyRH/CKvdJycNRzYRt3hFMdE9Mu2Mb1LntKMv7MvOD44DTqUYrs2/qU5uTJe/wsbVk5Eq6x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728439968; c=relaxed/simple;
	bh=rA99sVkEcf6yaCwSELyjgFiBgQvMIM0Wt3ktRt/eNOU=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LRWk0fAAABfDSMekpVD7plTjzUP3MGnl2udDk0ccXbOeTVhNsXGbSCMr/RYB/JeVHl4pH2+xSQCq+CkDFy4m1Y2y61hjrbmg5lHD67LckYadA68kpE8au6qGlb0IROxif3nkpFTLY38HgLug/M9MtykjGsfEGSVroJt6TQjlogA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=fTvC5No2; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1728439964;
	bh=w7qyq17nc2TUPZIsLK+Ts256NF7jrNuc8mECRfNXiYU=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=fTvC5No2x2gTlXdS1g2gGF3WjRMe6U7keZi9fSjKdCXi4cQsQ2iFUtwQfyAqokLaP
	 CnTxMiG0ijumGlA2bXf0/PSGvEPmAFyA8WlZbEepwY+NHuboW6vbEjVzck5bimbs2h
	 DFk0zj1KoNHjcjkutqggi58vr/FwazaHTuLZMa09I5G1yRNHZYk8m15lntxOOB3GQf
	 XeX6EGHGtIC5McgdLxNlIG2+4+wUq12PHxJ2vhnqmTaJYUcDOKv8O35fRuBUMT8Pel
	 67+suSEHSR5YETOD9KsddVzqYJDzYibnPq+8YZUo6JD986DX0l/mrZe79xeNrsxhF/
	 gU8wYYzEyPzEQ==
Received: from [192.168.68.112] (ppp118-210-190-105.adl-adc-lon-bras34.tpg.internode.on.net [118.210.190.105])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 660586497F;
	Wed,  9 Oct 2024 10:12:43 +0800 (AWST)
Message-ID: <66e619a9085a2ecb62e3945cd024822de5317f92.camel@codeconstruct.com.au>
Subject: Re: [PATCH v7 7/7] gpio: aspeed: Support G7 Aspeed gpio controller
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Billy Tsai <billy_tsai@aspeedtech.com>, linus.walleij@linaro.org, 
 brgl@bgdev.pl, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 joel@jms.id.au, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com,
 Peter.Yin@quantatw.com,  Jay_Zhang@wiwynn.com
Date: Wed, 09 Oct 2024 12:42:42 +1030
In-Reply-To: <20241008081450.1490955-8-billy_tsai@aspeedtech.com>
References: <20241008081450.1490955-1-billy_tsai@aspeedtech.com>
	 <20241008081450.1490955-8-billy_tsai@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2024-10-08 at 16:14 +0800, Billy Tsai wrote:
> In the 7th generation of the SoC from Aspeed, the control logic of the
> GPIO controller has been updated to support per-pin control. Each pin now
> has its own 32-bit register, allowing for individual control of the pin's
> value, direction, interrupt type, and other settings. The permission for
> coprocessor access is supported by the hardware but hasn't been
> implemented in the current patch.
>=20
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> ---
>  drivers/gpio/gpio-aspeed.c | 147 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 147 insertions(+)
>=20
> diff --git a/drivers/gpio/gpio-aspeed.c b/drivers/gpio/gpio-aspeed.c
> index 5d583cc9cbc7..208f95fb585e 100644
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
> +#define GPIO_G7_CTRL_DEBOUNCE_SEL1 BIT(7)
> +#define GPIO_G7_CTRL_DEBOUNCE_SEL2 BIT(8)
> +#define GPIO_G7_CTRL_INPUT_MASK BIT(9)
> +#define GPIO_G7_CTRL_IRQ_STS BIT(12)
> +#define GPIO_G7_CTRL_IN_DATA BIT(13)
> +
>  struct aspeed_bank_props {
>  	unsigned int bank;
>  	u32 input;
> @@ -95,6 +116,22 @@ struct aspeed_gpio_bank {
>   */
> =20
>  static const int debounce_timers[4] =3D { 0x00, 0x50, 0x54, 0x58 };
> +static const int g7_debounce_timers[4] =3D { 0x00, 0x00, 0x04, 0x08 };
> +
> +/*
> + * The debounce timers array is used to configure the debounce timer set=
tings.Here=E2=80=99s how it works:
> + * Array Value: Indicates the offset for configuring the debounce timer.
> + * Array Index: Corresponds to the debounce setting register.
> + * The debounce timers array follows this pattern for configuring the de=
bounce setting registers:
> + * Array Index 0: No debounce timer is set;
> + *		  Array Value is irrelevant (don=E2=80=99t care).
> + * Array Index 1: Debounce setting #2 is set to 1, and debounce setting =
#1 is set to 0.
> + *		  Array Value: offset for configuring debounce timer 0 (g4: 0x50, g7=
: 0x00)
> + * Array Index 2: Debounce setting #2 is set to 0, and debounce setting =
#1 is set to 1.
> + *		  Array Value: offset for configuring debounce timer 1 (g4: 0x54, g7=
: 0x04)
> + * Array Index 3: Debounce setting #2 is set to 1, and debounce setting =
#1 is set to 1.
> + *		  Array Value: offset for configuring debounce timer 2 (g4: 0x58, g7=
: 0x8)
> + */
> =20
>  static const struct aspeed_gpio_copro_ops *copro_ops;
>  static void *copro_data;
> @@ -250,6 +287,39 @@ static void __iomem *aspeed_gpio_g4_bank_reg(struct =
aspeed_gpio *gpio,
>  	BUG();
>  }
> =20
> +static u32 aspeed_gpio_g7_reg_mask(const enum aspeed_gpio_reg reg)
> +{
> +	switch (reg) {
> +	case reg_val:
> +		return GPIO_G7_CTRL_OUT_DATA;

I think a problem is that we want this to be GPIO_G7_CTRL_IN_DATA for
reads, but GPIO_G7_CTRL_OUT_DATA for writes?

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

I think this is correct regardless of the access type though.

If we can resolve the query above, the rest looks alright to me.

Andrew

