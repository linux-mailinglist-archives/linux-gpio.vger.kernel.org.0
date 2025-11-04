Return-Path: <linux-gpio+bounces-28015-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF92C308ED
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 11:43:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C940D34519A
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 10:43:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 353A22D7395;
	Tue,  4 Nov 2025 10:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="gZKYfj/M"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456002D3755;
	Tue,  4 Nov 2025 10:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762253022; cv=none; b=s1DV/SVzVadgRuj+YFkP16MigkXVkGiOO+BKLM8KgAyfEdL6tK+k2vfhAH1tMbuuCxTZP/syJQVgm2gkJcDF5hLvXMACk1oV2aMFc/UjtaI4Iasv9s2P5BGtgNN8nj5mfHNfc2xUkZ1SjospyXQ0XcL9dA4FDMkDtTk+RcE/hgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762253022; c=relaxed/simple;
	bh=AJnEZpqhcJ1TvAfJOFQN+BmpQ2JIxN2gA6Sp6ggj5WU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eBq2g+nVN6sDtNBjoBG7Q65mZ1xJ2p60rIMqo7+PhSqZSqUbJiM3npom2aDnwu5CEpOIgqKMl1G1siy4yHNQFKCvOYXh7PsWGizTZASgn+UciPyDUOIkSMjrLDycoSWEJ0UQrhJ5GthoYj4zNt0VpZik4iUuYix39oZSSgN3X68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=gZKYfj/M; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=NPr5PM9Tq20IPqTjYDds8eM1A/B5CK6SotofCUZn9ik=; b=gZKYfj/MlqZ4RVwK7M0D2fojSy
	mZgcZjXsKR9A5kztK5L1JR5F8VStKSokQ6q+diYF0m2/V0ljfVCPi3RU95g8aOZqkCUGMk2NAjBjW
	QuHFotAKUj3Dmhk3s9iqM2jXrImdbbqfYHOPgah4EmZu4yoZOzLEQ6iSpRF+4oIKtbJ/4lh7ZqgOs
	0EsU7nmN3zpgWr7ZnyxR2c+3JgmjHM3xiVqyO327E6VBuSiOuvqNHH3lcHElgRqjsBsfaEpOfZSLR
	huRDuD2iNmzERerkho4/7pva/5G1AaOvwvxaQSIt5/qvYrT8drOl5adduDmuWySb8faFWQy+p7/GE
	j5cGLA3Q==;
Received: from i53875aae.versanet.de ([83.135.90.174] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vGEVh-00040r-PL; Tue, 04 Nov 2025 11:43:33 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Ye Zhang <ye.zhang@rock-chips.com>,
 Linus Walleij <linus.walleij@linaro.org>, Ye Zhang <ye.zhang@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 tao.huang@rock-chips.com
Subject: Re: [PATCH v1 2/3] pinctrl: rockchip: Add rk3506 pinctrl support
Date: Tue, 04 Nov 2025 11:43:32 +0100
Message-ID: <1797465.QkHrqEjB74@diego>
In-Reply-To: <20251104021223.2375116-3-ye.zhang@rock-chips.com>
References:
 <20251104021223.2375116-1-ye.zhang@rock-chips.com>
 <20251104021223.2375116-3-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 4. November 2025, 03:12:22 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Ye Zhang:
> Add support for the 5 rk3506 GPIO banks.
>=20
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/pinctrl/pinctrl-rockchip.c | 442 ++++++++++++++++++++++++++++-
>  drivers/pinctrl/pinctrl-rockchip.h |   4 +
>  2 files changed, 438 insertions(+), 8 deletions(-)
>=20
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl=
=2Drockchip.c
> index 7a68a6237649..e44ef262beec 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -105,6 +105,29 @@
>  		.pull_type[3] =3D pull3,					\
>  	}
> =20
> +#define PIN_BANK_IOMUX_FLAGS_OFFSET_DRV_FLAGS(id, pins, label, iom0,	\
> +					       iom1, iom2, iom3,	\
> +					       offset0, offset1,	\
> +					       offset2, offset3, drv0,	\
> +					       drv1, drv2, drv3)	\
> +	{								\
> +		.bank_num	=3D id,					\
> +		.nr_pins	=3D pins,					\
> +		.name		=3D label,				\
> +		.iomux		=3D {					\
> +			{ .type =3D iom0, .offset =3D offset0 },		\
> +			{ .type =3D iom1, .offset =3D offset1 },		\
> +			{ .type =3D iom2, .offset =3D offset2 },		\
> +			{ .type =3D iom3, .offset =3D offset3 },		\
> +		},							\
> +		.drv		=3D {					\
> +			{ .drv_type =3D drv0, .offset =3D -1 },		\
> +			{ .drv_type =3D drv1, .offset =3D -1 },		\
> +			{ .drv_type =3D drv2, .offset =3D -1 },		\
> +			{ .drv_type =3D drv3, .offset =3D -1 },		\
> +		},							\
> +	}
> +
>  #define PIN_BANK_DRV_FLAGS(id, pins, label, type0, type1, type2, type3) \
>  	{								\
>  		.bank_num	=3D id,					\
> @@ -233,6 +256,35 @@
>  		.pull_type[3] =3D pull3,					\
>  	}
> =20
> +#define PIN_BANK_IOMUX_FLAGS_OFFSET_DRV_FLAGS_PULL_FLAGS(id, pins,	\
> +						label, iom0, iom1,	\
> +						iom2, iom3, offset0,	\
> +						offset1, offset2,	\
> +						offset3, drv0, drv1,	\
> +						drv2, drv3, pull0,	\
> +						pull1, pull2, pull3)	\
> +	{								\
> +		.bank_num	=3D id,					\
> +		.nr_pins	=3D pins,					\
> +		.name		=3D label,				\
> +		.iomux		=3D {					\
> +			{ .type =3D iom0, .offset =3D offset0 },		\
> +			{ .type =3D iom1, .offset =3D offset1 },		\
> +			{ .type =3D iom2, .offset =3D offset2 },		\
> +			{ .type =3D iom3, .offset =3D offset3 },		\
> +		},							\
> +		.drv		=3D {					\
> +			{ .drv_type =3D drv0, .offset =3D -1 },		\
> +			{ .drv_type =3D drv1, .offset =3D -1 },		\
> +			{ .drv_type =3D drv2, .offset =3D -1 },		\
> +			{ .drv_type =3D drv3, .offset =3D -1 },		\
> +		},							\
> +		.pull_type[0] =3D pull0,					\
> +		.pull_type[1] =3D pull1,					\
> +		.pull_type[2] =3D pull2,					\
> +		.pull_type[3] =3D pull3,					\
> +	}
> +
>  #define PIN_BANK_MUX_ROUTE_FLAGS(ID, PIN, FUNC, REG, VAL, FLAG)		\
>  	{								\
>  		.bank_num	=3D ID,					\
> @@ -1120,6 +1172,13 @@ static int rockchip_get_mux(struct rockchip_pin_ba=
nk *bank, int pin)
>  	else
>  		regmap =3D info->regmap_base;
> =20
> +	if (ctrl->type =3D=3D RK3506) {
> +		if (bank->bank_num =3D=3D 1)
> +			regmap =3D info->regmap_ioc1;
> +		else if (bank->bank_num =3D=3D 4)
> +			return 0;
> +	}
> +
>  	/* get basic quadrupel of mux registers and the correct reg inside */
>  	mux_type =3D bank->iomux[iomux_num].type;
>  	reg =3D bank->iomux[iomux_num].offset;
> @@ -1239,6 +1298,13 @@ static int rockchip_set_mux(struct rockchip_pin_ba=
nk *bank, int pin, int mux)
>  	else
>  		regmap =3D info->regmap_base;
> =20
> +	if (ctrl->type =3D=3D RK3506) {
> +		if (bank->bank_num =3D=3D 1)
> +			regmap =3D info->regmap_ioc1;
> +		else if (bank->bank_num =3D=3D 4)
> +			return 0;
> +	}
> +
>  	/* get basic quadrupel of mux registers and the correct reg inside */
>  	mux_type =3D bank->iomux[iomux_num].type;
>  	reg =3D bank->iomux[iomux_num].offset;
> @@ -2003,6 +2069,262 @@ static int rk3399_calc_drv_reg_and_bit(struct roc=
kchip_pin_bank *bank,
>  	return 0;
>  }
> =20
> +#define RK3506_DRV_BITS_PER_PIN		8
> +#define RK3506_DRV_PINS_PER_REG		2
> +#define RK3506_DRV_GPIO0_A_OFFSET	0x100
> +#define RK3506_DRV_GPIO0_D_OFFSET	0x830
> +#define RK3506_DRV_GPIO1_OFFSET		0x140
> +#define RK3506_DRV_GPIO2_OFFSET		0x180
> +#define RK3506_DRV_GPIO3_OFFSET		0x1c0
> +#define RK3506_DRV_GPIO4_OFFSET		0x840
> +
> +static int rk3506_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
> +					int pin_num, struct regmap **regmap,
> +					int *reg, u8 *bit)
> +{
> +	struct rockchip_pinctrl *info =3D bank->drvdata;
> +	int ret =3D 0;
> +
> +	switch (bank->bank_num) {
> +	case 0:
> +		*regmap =3D info->regmap_pmu;
> +		if (pin_num > 24) {
> +			ret =3D -EINVAL;
> +		} else if (pin_num < 24) {
> +			*reg =3D RK3506_DRV_GPIO0_A_OFFSET;
> +		} else {
> +			*reg =3D RK3506_DRV_GPIO0_D_OFFSET;
> +			*bit =3D 3;
> +
> +			return 0;
> +		}
> +		break;
> +
> +	case 1:
> +		*regmap =3D info->regmap_ioc1;
> +		if (pin_num < 28)
> +			*reg =3D RK3506_DRV_GPIO1_OFFSET;
> +		else
> +			ret =3D -EINVAL;
> +		break;
> +
> +	case 2:
> +		*regmap =3D info->regmap_base;
> +		if (pin_num < 17)
> +			*reg =3D RK3506_DRV_GPIO2_OFFSET;
> +		else
> +			ret =3D -EINVAL;
> +		break;
> +
> +	case 3:
> +		*regmap =3D info->regmap_base;
> +		if (pin_num < 15)
> +			*reg =3D RK3506_DRV_GPIO3_OFFSET;
> +		else
> +			ret =3D -EINVAL;
> +		break;
> +
> +	case 4:
> +		*regmap =3D info->regmap_base;
> +		if (pin_num < 8 || pin_num > 11) {
> +			ret =3D -EINVAL;
> +		} else {
> +			*reg =3D RK3506_DRV_GPIO4_OFFSET;
> +			*bit =3D 10;
> +
> +			return 0;
> +		}
> +		break;
> +
> +	default:
> +		ret =3D -EINVAL;
> +		break;
> +	}
> +
> +	if (ret) {
> +		dev_err(info->dev, "unsupported bank_num %d pin_num %d\n", bank->bank_=
num, pin_num);
> +
> +		return ret;
> +	}
> +
> +	*reg +=3D ((pin_num / RK3506_DRV_PINS_PER_REG) * 4);
> +	*bit =3D pin_num % RK3506_DRV_PINS_PER_REG;
> +	*bit *=3D RK3506_DRV_BITS_PER_PIN;
> +
> +	return 0;
> +}
> +
> +#define RK3506_PULL_BITS_PER_PIN	2
> +#define RK3506_PULL_PINS_PER_REG	8
> +#define RK3506_PULL_GPIO0_A_OFFSET	0x200
> +#define RK3506_PULL_GPIO0_D_OFFSET	0x830
> +#define RK3506_PULL_GPIO1_OFFSET	0x210
> +#define RK3506_PULL_GPIO2_OFFSET	0x220
> +#define RK3506_PULL_GPIO3_OFFSET	0x230
> +#define RK3506_PULL_GPIO4_OFFSET	0x840
> +
> +static int rk3506_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
> +					 int pin_num, struct regmap **regmap,
> +					 int *reg, u8 *bit)
> +{
> +	struct rockchip_pinctrl *info =3D bank->drvdata;
> +	int ret =3D 0;
> +
> +	switch (bank->bank_num) {
> +	case 0:
> +		*regmap =3D info->regmap_pmu;
> +		if (pin_num > 24) {
> +			ret =3D -EINVAL;
> +		} else if (pin_num < 24) {
> +			*reg =3D RK3506_PULL_GPIO0_A_OFFSET;
> +		} else {
> +			*reg =3D RK3506_PULL_GPIO0_D_OFFSET;
> +			*bit =3D 5;
> +
> +			return 0;
> +		}
> +		break;
> +
> +	case 1:
> +		*regmap =3D info->regmap_ioc1;
> +		if (pin_num < 28)
> +			*reg =3D RK3506_PULL_GPIO1_OFFSET;
> +		else
> +			ret =3D -EINVAL;
> +		break;
> +
> +	case 2:
> +		*regmap =3D info->regmap_base;
> +		if (pin_num < 17)
> +			*reg =3D RK3506_PULL_GPIO2_OFFSET;
> +		else
> +			ret =3D -EINVAL;
> +		break;
> +
> +	case 3:
> +		*regmap =3D info->regmap_base;
> +		if (pin_num < 15)
> +			*reg =3D RK3506_PULL_GPIO3_OFFSET;
> +		else
> +			ret =3D -EINVAL;
> +		break;
> +
> +	case 4:
> +		*regmap =3D info->regmap_base;
> +		if (pin_num < 8 || pin_num > 11) {
> +			ret =3D -EINVAL;
> +		} else {
> +			*reg =3D RK3506_PULL_GPIO4_OFFSET;
> +			*bit =3D 13;
> +
> +			return 0;
> +		}
> +		break;
> +
> +	default:
> +		ret =3D -EINVAL;
> +		break;
> +	}
> +
> +	if (ret) {
> +		dev_err(info->dev, "unsupported bank_num %d pin_num %d\n", bank->bank_=
num, pin_num);
> +
> +		return ret;
> +	}
> +
> +	*reg +=3D ((pin_num / RK3506_PULL_PINS_PER_REG) * 4);
> +	*bit =3D pin_num % RK3506_PULL_PINS_PER_REG;
> +	*bit *=3D RK3506_PULL_BITS_PER_PIN;
> +
> +	return 0;
> +}
> +
> +#define RK3506_SMT_BITS_PER_PIN		1
> +#define RK3506_SMT_PINS_PER_REG		8
> +#define RK3506_SMT_GPIO0_A_OFFSET	0x400
> +#define RK3506_SMT_GPIO0_D_OFFSET	0x830
> +#define RK3506_SMT_GPIO1_OFFSET		0x410
> +#define RK3506_SMT_GPIO2_OFFSET		0x420
> +#define RK3506_SMT_GPIO3_OFFSET		0x430
> +#define RK3506_SMT_GPIO4_OFFSET		0x840
> +
> +static int rk3506_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *ban=
k,
> +					   int pin_num,
> +					   struct regmap **regmap,
> +					   int *reg, u8 *bit)
> +{
> +	struct rockchip_pinctrl *info =3D bank->drvdata;
> +	int ret =3D 0;
> +
> +	switch (bank->bank_num) {
> +	case 0:
> +		*regmap =3D info->regmap_pmu;
> +		if (pin_num > 24) {
> +			ret =3D -EINVAL;
> +		} else if (pin_num < 24) {
> +			*reg =3D RK3506_SMT_GPIO0_A_OFFSET;
> +		} else {
> +			*reg =3D RK3506_SMT_GPIO0_D_OFFSET;
> +			*bit =3D 9;
> +
> +			return 0;
> +		}
> +		break;
> +
> +	case 1:
> +		*regmap =3D info->regmap_ioc1;
> +		if (pin_num < 28)
> +			*reg =3D RK3506_SMT_GPIO1_OFFSET;
> +		else
> +			ret =3D -EINVAL;
> +		break;
> +
> +	case 2:
> +		*regmap =3D info->regmap_base;
> +		if (pin_num < 17)
> +			*reg =3D RK3506_SMT_GPIO2_OFFSET;
> +		else
> +			ret =3D -EINVAL;
> +		break;
> +
> +	case 3:
> +		*regmap =3D info->regmap_base;
> +		if (pin_num < 15)
> +			*reg =3D RK3506_SMT_GPIO3_OFFSET;
> +		else
> +			ret =3D -EINVAL;
> +		break;
> +
> +	case 4:
> +		*regmap =3D info->regmap_base;
> +		if (pin_num < 8 || pin_num > 11) {
> +			ret =3D -EINVAL;
> +		} else {
> +			*reg =3D RK3506_SMT_GPIO4_OFFSET;
> +			*bit =3D 8;
> +
> +			return 0;
> +		}
> +		break;
> +
> +	default:
> +		ret =3D -EINVAL;
> +		break;
> +	}
> +
> +	if (ret) {
> +		dev_err(info->dev, "unsupported bank_num %d pin_num %d\n", bank->bank_=
num, pin_num);
> +
> +		return ret;
> +	}
> +
> +	*reg +=3D ((pin_num / RK3506_SMT_PINS_PER_REG) * 4);
> +	*bit =3D pin_num % RK3506_SMT_PINS_PER_REG;
> +	*bit *=3D RK3506_SMT_BITS_PER_PIN;
> +
> +	return 0;
> +}
> +
>  #define RK3528_DRV_BITS_PER_PIN		8
>  #define RK3528_DRV_PINS_PER_REG		2
>  #define RK3528_DRV_GPIO0_OFFSET		0x100
> @@ -2749,7 +3071,8 @@ static int rockchip_set_drive_perpin(struct rockchi=
p_pin_bank *bank,
>  		rmask_bits =3D RK3588_DRV_BITS_PER_PIN;
>  		ret =3D strength;
>  		goto config;
> -	} else if (ctrl->type =3D=3D RK3528 ||
> +	} else if (ctrl->type =3D=3D RK3506 ||
> +		   ctrl->type =3D=3D RK3528 ||
>  		   ctrl->type =3D=3D RK3562 ||
>  		   ctrl->type =3D=3D RK3568) {
>  		rmask_bits =3D RK3568_DRV_BITS_PER_PIN;
> @@ -2828,12 +3151,37 @@ static int rockchip_set_drive_perpin(struct rockc=
hip_pin_bank *bank,
>  	case DRV_TYPE_IO_1V8_ONLY:
>  		rmask_bits =3D RK3288_DRV_BITS_PER_PIN;
>  		break;
> +	case DRV_TYPE_IO_LEVEL_2_BIT:
> +		ret =3D regmap_read(regmap, reg, &data);
> +		if (ret)
> +			return ret;
> +		data >>=3D bit;
> +
> +		return data & 0x3;
> +	case DRV_TYPE_IO_LEVEL_8_BIT:
> +		ret =3D regmap_read(regmap, reg, &data);
> +		if (ret)
> +			return ret;
> +		data >>=3D bit;
> +		data &=3D (1 << 8) - 1;
> +
> +		ret =3D hweight8(data);
> +		if (ret > 0)
> +			return ret - 1;
> +		else
> +			return -EINVAL;
>  	default:
>  		dev_err(dev, "unsupported pinctrl drive type: %d\n", drv_type);
>  		return -EINVAL;
>  	}
> =20
>  config:
> +	if (ctrl->type =3D=3D RK3506) {
> +		if ((bank->bank_num =3D=3D 0 && pin_num =3D=3D 24) || bank->bank_num =
=3D=3D 4) {
> +			rmask_bits =3D 2;
> +			ret =3D strength;
> +		}
> +	}
>  	/* enable the write to the equivalent lower bits */
>  	data =3D ((1 << rmask_bits) - 1) << (bit + 16);
>  	rmask =3D data | (data >> 16);
> @@ -2957,6 +3305,7 @@ static int rockchip_set_pull(struct rockchip_pin_ba=
nk *bank,
>  	case RK3328:
>  	case RK3368:
>  	case RK3399:
> +	case RK3506:
>  	case RK3528:
>  	case RK3562:
>  	case RK3568:
> @@ -3077,6 +3426,10 @@ static int rockchip_get_schmitt(struct rockchip_pi=
n_bank *bank, int pin_num)
>  		break;
>  	}
> =20
> +	if (ctrl->type =3D=3D RK3506)
> +		if ((bank->bank_num =3D=3D 0 && pin_num =3D=3D 24) ||  bank->bank_num =
=3D=3D 4)
> +			return data & 0x3;
> +
>  	return data & 0x1;
>  }
> =20
> @@ -3112,6 +3465,14 @@ static int rockchip_set_schmitt(struct rockchip_pi=
n_bank *bank,
>  		break;
>  	}
> =20
> +	if (ctrl->type =3D=3D RK3506) {
> +		if ((bank->bank_num =3D=3D 0 && pin_num =3D=3D 24) || bank->bank_num =
=3D=3D 4) {
> +			data =3D 0x3 << (bit + 16);
> +			rmask =3D data | (data >> 16);
> +			data |=3D ((enable ? 0x3 : 0) << bit);
> +		}
> +	}
> +
>  	return regmap_update_bits(regmap, reg, rmask, data);
>  }
> =20
> @@ -3227,6 +3588,7 @@ static bool rockchip_pinconf_pull_valid(struct rock=
chip_pin_ctrl *ctrl,
>  	case RK3328:
>  	case RK3368:
>  	case RK3399:
> +	case RK3506:
>  	case RK3528:
>  	case RK3562:
>  	case RK3568:
> @@ -3880,13 +4242,10 @@ static int rockchip_pinctrl_probe(struct platform=
_device *pdev)
>  	}
> =20
>  	/* try to find the optional reference to the pmu syscon */
> -	node =3D of_parse_phandle(np, "rockchip,pmu", 0);
> -	if (node) {
> -		info->regmap_pmu =3D syscon_node_to_regmap(node);
> -		of_node_put(node);
> -		if (IS_ERR(info->regmap_pmu))
> -			return PTR_ERR(info->regmap_pmu);
> -	}
> +	info->regmap_pmu =3D syscon_regmap_lookup_by_phandle_optional(np, "rock=
chip,pmu");
> +
> +	/* try to find the optional reference to the ioc1 syscon */
> +	info->regmap_ioc1 =3D syscon_regmap_lookup_by_phandle_optional(np, "roc=
kchip,ioc1");
> =20
>  	ret =3D rockchip_pinctrl_register(pdev, info);
>  	if (ret)
> @@ -4350,6 +4709,71 @@ static struct rockchip_pin_ctrl rk3399_pin_ctrl =
=3D {
>  		.drv_calc_reg		=3D rk3399_calc_drv_reg_and_bit,
>  };
> =20
> +static struct rockchip_pin_bank rk3506_pin_banks[] =3D {
> +	PIN_BANK_IOMUX_FLAGS_OFFSET_DRV_FLAGS_PULL_FLAGS(0, 32, "gpio0",
> +				    IOMUX_WIDTH_4BIT | IOMUX_SOURCE_PMU,
> +				    IOMUX_WIDTH_4BIT | IOMUX_SOURCE_PMU,
> +				    IOMUX_WIDTH_4BIT | IOMUX_SOURCE_PMU,
> +				    IOMUX_WIDTH_2BIT | IOMUX_SOURCE_PMU,
> +				    0x0, 0x8, 0x10, 0x830,
> +				    DRV_TYPE_IO_LEVEL_8_BIT,
> +				    DRV_TYPE_IO_LEVEL_8_BIT,
> +				    DRV_TYPE_IO_LEVEL_8_BIT,
> +				    DRV_TYPE_IO_LEVEL_2_BIT,
> +				    0, 0, 0, 1),
> +	PIN_BANK_IOMUX_FLAGS_OFFSET_DRV_FLAGS(1, 32, "gpio1",
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    0x20, 0x28, 0x30, 0x38,
> +				    DRV_TYPE_IO_LEVEL_8_BIT,
> +				    DRV_TYPE_IO_LEVEL_8_BIT,
> +				    DRV_TYPE_IO_LEVEL_8_BIT,
> +				    DRV_TYPE_IO_LEVEL_8_BIT),
> +	PIN_BANK_IOMUX_FLAGS_OFFSET_DRV_FLAGS(2, 32, "gpio2",
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    0x40, 0x48, 0x50, 0x58,
> +				    DRV_TYPE_IO_LEVEL_8_BIT,
> +				    DRV_TYPE_IO_LEVEL_8_BIT,
> +				    DRV_TYPE_IO_LEVEL_8_BIT,
> +				    DRV_TYPE_IO_LEVEL_8_BIT),
> +	PIN_BANK_IOMUX_FLAGS_OFFSET_DRV_FLAGS(3, 32, "gpio3",
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    0x60, 0x68, 0x70, 0x78,
> +				    DRV_TYPE_IO_LEVEL_8_BIT,
> +				    DRV_TYPE_IO_LEVEL_8_BIT,
> +				    DRV_TYPE_IO_LEVEL_8_BIT,
> +				    DRV_TYPE_IO_LEVEL_8_BIT),
> +	PIN_BANK_IOMUX_FLAGS_OFFSET_DRV_FLAGS_PULL_FLAGS(4, 32, "gpio4",
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    0x80, 0x88, 0x90, 0x98,
> +				    DRV_TYPE_IO_LEVEL_2_BIT,
> +				    DRV_TYPE_IO_LEVEL_2_BIT,
> +				    DRV_TYPE_IO_LEVEL_2_BIT,
> +				    DRV_TYPE_IO_LEVEL_2_BIT,
> +				    1, 1, 1, 1),
> +};
> +
> +static struct rockchip_pin_ctrl rk3506_pin_ctrl __maybe_unused =3D {
> +	.pin_banks		=3D rk3506_pin_banks,
> +	.nr_banks		=3D ARRAY_SIZE(rk3506_pin_banks),
> +	.label			=3D "RK3506-GPIO",
> +	.type			=3D RK3506,
> +	.pull_calc_reg		=3D rk3506_calc_pull_reg_and_bit,
> +	.drv_calc_reg		=3D rk3506_calc_drv_reg_and_bit,
> +	.schmitt_calc_reg	=3D rk3506_calc_schmitt_reg_and_bit,
> +};
> +
>  static struct rockchip_pin_bank rk3528_pin_banks[] =3D {
>  	PIN_BANK_IOMUX_FLAGS_OFFSET(0, 32, "gpio0",
>  				    IOMUX_WIDTH_4BIT,
> @@ -4560,6 +4984,8 @@ static const struct of_device_id rockchip_pinctrl_d=
t_match[] =3D {
>  		.data =3D &rk3368_pin_ctrl },
>  	{ .compatible =3D "rockchip,rk3399-pinctrl",
>  		.data =3D &rk3399_pin_ctrl },
> +	{ .compatible =3D "rockchip,rk3506-pinctrl",
> +		.data =3D &rk3506_pin_ctrl },
>  	{ .compatible =3D "rockchip,rk3528-pinctrl",
>  		.data =3D &rk3528_pin_ctrl },
>  	{ .compatible =3D "rockchip,rk3562-pinctrl",
> diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl=
=2Drockchip.h
> index 35cd38079d1e..4f4aff42a80a 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.h
> +++ b/drivers/pinctrl/pinctrl-rockchip.h
> @@ -196,6 +196,7 @@ enum rockchip_pinctrl_type {
>  	RK3328,
>  	RK3368,
>  	RK3399,
> +	RK3506,
>  	RK3528,
>  	RK3562,
>  	RK3568,
> @@ -260,6 +261,8 @@ enum rockchip_pin_drv_type {
>  	DRV_TYPE_IO_1V8_ONLY,
>  	DRV_TYPE_IO_1V8_3V0_AUTO,
>  	DRV_TYPE_IO_3V3_ONLY,
> +	DRV_TYPE_IO_LEVEL_2_BIT,
> +	DRV_TYPE_IO_LEVEL_8_BIT,
>  	DRV_TYPE_MAX
>  };
> =20
> @@ -458,6 +461,7 @@ struct rockchip_pinctrl {
>  	int				reg_size;
>  	struct regmap			*regmap_pull;
>  	struct regmap			*regmap_pmu;
> +	struct regmap			*regmap_ioc1;
>  	struct device			*dev;
>  	struct rockchip_pin_ctrl	*ctrl;
>  	struct pinctrl_desc		pctl;
>=20





