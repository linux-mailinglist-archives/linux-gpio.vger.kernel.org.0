Return-Path: <linux-gpio+bounces-28017-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1794AC30AE0
	for <lists+linux-gpio@lfdr.de>; Tue, 04 Nov 2025 12:11:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EAC7C3B5504
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Nov 2025 11:09:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A2B32E1C7C;
	Tue,  4 Nov 2025 11:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="pFDw7sdd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D776E191F92;
	Tue,  4 Nov 2025 11:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762254543; cv=none; b=ZxgEvQfxPirafME+j8RNsLhdbcHwLxz99BetewFT+Nq7bO//A2wwau0oEL+535vUv2jLLon4OV9I+f0haLBaaWomuKLuNaaqad1Ndp8iteqdx2349o5u1mBZDSrpWdq6gD6oowBsfidcySAXUjXryfOEdQIf6hDzznY4V7UVU+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762254543; c=relaxed/simple;
	bh=l6q5AMhS09Ke0kDsZOdMSGCdAMqiuA52MZttsj3WfZQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hINvkxBKChGFBgmWKadF+S3WJK19ZW6eo/KC1FUdi7oWypfDCml+CfpuX29WLfshHc228lWSiBJrH0nJctXRLevWAdyPuS0UtqDUsC5AO7+3NE5oMR7ntPlTo94gmS3PtKYF6b8YUxtCtUfkMVZVkP5xSN0wn9tB9+Id+R8BxuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=pFDw7sdd; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=CzcMdp2iynSnLwdcr7Xyc/HaEci5kKTUV9g0xKg98Kw=; b=pFDw7sddAIbfGsSbmG8PgRB2IW
	CS4KayctWIlylbuFqBwLtsbKi8+tu8TB+grcFcSPn+NFYk3qqoN/myszwsE/5vlhwatwpkQGPbYyb
	qKMoB2Z9CicZ+T+LotPL4apiyDLrTpoBqqftBas8hmwn2GPjHRbKERjLULtaVwwgeX0HglHsShM0h
	jJEIOLwpaKB0Zdf/rNrE1m5D/JW88nJDWHexCkEbAvQiXW5Y0AM3oTWzf0CuMZWhO3RJEbjKnQlME
	JyCS7FZGwgLLAl21uVfuGyi2l6VFaCEqcvljPRjWCDjC3SFmZx5QPYLfeMn1FscdMAArCCZ7Zxx/4
	FWkoSv4w==;
Received: from i53875aae.versanet.de ([83.135.90.174] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vGEuD-0004GC-It; Tue, 04 Nov 2025 12:08:53 +0100
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: Ye Zhang <ye.zhang@rock-chips.com>,
 Linus Walleij <linus.walleij@linaro.org>, Ye Zhang <ye.zhang@rock-chips.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 tao.huang@rock-chips.com
Subject: Re: [PATCH v1 3/3] pinctrl: rockchip: add rk3506 rmio support
Date: Tue, 04 Nov 2025 12:08:52 +0100
Message-ID: <4419588.mogB4TqSGs@diego>
In-Reply-To: <20251104021223.2375116-4-ye.zhang@rock-chips.com>
References:
 <20251104021223.2375116-1-ye.zhang@rock-chips.com>
 <20251104021223.2375116-4-ye.zhang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Dienstag, 4. November 2025, 03:12:23 Mitteleurop=C3=A4ische Normalzeit s=
chrieb Ye Zhang:
> Support rockchip matrix io
>=20
> Signed-off-by: Ye Zhang <ye.zhang@rock-chips.com>
> ---
>  drivers/pinctrl/pinctrl-rockchip.c | 75 ++++++++++++++++++++++++++++++
>  drivers/pinctrl/pinctrl-rockchip.h |  1 +
>  2 files changed, 76 insertions(+)

Here I disagree though.

The RMIO controller is a completely separate thing and from what I understa=
nd
from the documentation

=2D you set the pinmux to go to the rmio controller, and then that controll=
er
  selects the function for this pin.

=46or example pinmux values for gpio0a7_sel are
=2D 0: GPIO0_A7
=2D 1: F SAI0_SDI3
=2D 2: SPI1_CSN1
=2D 7: RM_IO7

With 7 being the route to the matrix-io controller.


So lumping this into the main pinctrl feels definitly wrong, as then you
create a number of "virtual" pinmuxes where they don't belong.

So instead of trying to bolt this onto the main pinctrl, I'd like things
to be separate ... for the main iomux you route the pin to the rmio
controller and then have a separate configuration for the rmio marix.

bus2: bus2 {
	rockchip,pins =3D <0 RK_PA0 7 &pcfg_pull_none_drv_8ma>,
		<0 RK_PA1 7 &pcfg_pull_none_drv_8ma>,
		<0 RK_PA2 7 &pcfg_pull_none_drv_8ma>,
		<0 RK_PA3 7 &pcfg_pull_none_drv_8ma>,

	rockchip,rmio-pins {
		/* some way to sanely describe the rmio-config */
		pins =3D "GPIO0_A0", "GPIO0_A1";
		functions =3D "i2c0-scl", "i2c0-sda";
	};
};

This is especially true, as each pin in the rmio-controller can have each
function. So gpio0-a0 can be uart1-tx, uart1-rx etc etc ... 98 different
functions according to the documentation.


Heiko

>=20
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl=
=2Drockchip.c
> index e44ef262beec..89ff8d8c7fcc 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -1258,6 +1258,74 @@ static int rockchip_verify_mux(struct rockchip_pin=
_bank *bank,
>  	return 0;
>  }
> =20
> +static int rockchip_set_rmio(struct rockchip_pin_bank *bank, int pin, in=
t *mux)
> +{
> +	struct rockchip_pinctrl *info =3D bank->drvdata;
> +	struct rockchip_pin_ctrl *ctrl =3D info->ctrl;
> +	struct regmap *regmap;
> +	int reg, function;
> +	u32 data, rmask;
> +	int ret =3D 0;
> +	int iomux_num =3D (pin / 8);
> +	u32 iomux_max, mux_type;
> +
> +	mux_type =3D bank->iomux[iomux_num].type;
> +	if (mux_type & IOMUX_WIDTH_4BIT)
> +		iomux_max =3D (1 << 4) - 1;
> +	else if (mux_type & IOMUX_WIDTH_3BIT)
> +		iomux_max =3D (1 << 3) - 1;
> +	else
> +		iomux_max =3D (1 << 2) - 1;
> +
> +	if (*mux > iomux_max)
> +		function =3D *mux - iomux_max;
> +	else
> +		return 0;
> +
> +	switch (ctrl->type) {
> +	case RK3506:
> +		regmap =3D info->regmap_rmio;
> +		if (bank->bank_num =3D=3D 0) {
> +			if (pin < 24)
> +				reg =3D 0x80 + 0x4 * pin;
> +			else
> +				ret =3D -EINVAL;
> +		} else if (bank->bank_num =3D=3D 1) {
> +			if (pin >=3D 9 && pin <=3D 11)
> +				reg =3D 0xbc + 0x4 * pin;
> +			else if (pin >=3D 18 && pin <=3D 19)
> +				reg =3D 0xa4 + 0x4 * pin;
> +			else if (pin >=3D 25 && pin <=3D 27)
> +				reg =3D 0x90 + 0x4 * pin;
> +			else
> +				ret =3D -EINVAL;
> +		} else {
> +			ret =3D -EINVAL;
> +		}
> +
> +		if (ret) {
> +			dev_err(info->dev,
> +				"rmio unsupported bank_num %d function %d\n",
> +				bank->bank_num, function);
> +
> +			return -EINVAL;
> +		}
> +
> +		rmask =3D 0x7f007f;
> +		data =3D 0x7f0000 | function;
> +		*mux =3D 7;
> +		ret =3D regmap_update_bits(regmap, reg, rmask, data);
> +		if (ret)
> +			return ret;
> +		break;
> +
> +	default:
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
>  /*
>   * Set a new mux function for a pin.
>   *
> @@ -1291,6 +1359,10 @@ static int rockchip_set_mux(struct rockchip_pin_ba=
nk *bank, int pin, int mux)
> =20
>  	dev_dbg(dev, "setting mux of GPIO%d-%d to %d\n", bank->bank_num, pin, m=
ux);
> =20
> +	ret =3D rockchip_set_rmio(bank, pin, &mux);
> +	if (ret)
> +		return ret;
> +
>  	if (bank->iomux[iomux_num].type & IOMUX_SOURCE_PMU)
>  		regmap =3D info->regmap_pmu;
>  	else if (bank->iomux[iomux_num].type & IOMUX_L_SOURCE_PMU)
> @@ -4247,6 +4319,9 @@ static int rockchip_pinctrl_probe(struct platform_d=
evice *pdev)
>  	/* try to find the optional reference to the ioc1 syscon */
>  	info->regmap_ioc1 =3D syscon_regmap_lookup_by_phandle_optional(np, "roc=
kchip,ioc1");
> =20
> +	/* try to find the optional reference to the rmio syscon */
> +	info->regmap_rmio =3D syscon_regmap_lookup_by_phandle_optional(np, "roc=
kchip,rmio");
> +
>  	ret =3D rockchip_pinctrl_register(pdev, info);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl=
=2Drockchip.h
> index 4f4aff42a80a..6d79ccf73b71 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.h
> +++ b/drivers/pinctrl/pinctrl-rockchip.h
> @@ -462,6 +462,7 @@ struct rockchip_pinctrl {
>  	struct regmap			*regmap_pull;
>  	struct regmap			*regmap_pmu;
>  	struct regmap			*regmap_ioc1;
> +	struct regmap			*regmap_rmio;
>  	struct device			*dev;
>  	struct rockchip_pin_ctrl	*ctrl;
>  	struct pinctrl_desc		pctl;
>=20





