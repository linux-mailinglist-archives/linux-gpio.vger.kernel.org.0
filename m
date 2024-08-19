Return-Path: <linux-gpio+bounces-8807-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 774F0956E19
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2024 17:01:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 99F5E1C2222B
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Aug 2024 15:01:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4EF1186E2E;
	Mon, 19 Aug 2024 15:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b="c52iv9ub"
X-Original-To: linux-gpio@vger.kernel.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694C6179206;
	Mon, 19 Aug 2024 15:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724079640; cv=pass; b=qf+9o4XehD1fcb23oTqpA9ZLcVzA1i3tjX1/Ey5Oho9c5zyVxp3tZNYDYJYA8dU7la9uc5VWrXlx+RwQPdjQX/DqXgZbubh+6z9yvt/PckCaL6zWJBUrD0WxgteHCRdq/WaoDLAtY6SOMg6UinMjR6jU1N41Y4hFdquggpLVMkI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724079640; c=relaxed/simple;
	bh=CLSFR0OpEbtA8JbCMSDw5RIztJ8tB+ECwQnu96STcac=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HrBMS/L9UodJSD8yNbSTGlYGJ8MVxB4W5NGfJ5IajipolHwefxWqlEl4JAKK/2/VgV1RR/4V/CAPkMFiI0Js85EzGYyF3w0lmUIVU0XI3LdbbCwQjDxw6P6K7Zkzn4Xdi4GVB88tfvSgAfxdJ0ukY/ujnR/mcmDyKg2OdzjEmWo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=detlev.casanova@collabora.com header.b=c52iv9ub; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Delivered-To: kernel@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724079616; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=F7lFfbl3TOmQZwYfQoXrEkCKUnZiT83ytqeu9Z35W9b+yfrwoSBC61gSJhNbZLLkjczmmf4vou8xGq8pVo566BUGr7AXCByW8NXJfInXm5Cp3Ki8PObrkECWw3TFQIJHTuFXz6RzQpOs5ZQyJeAOUJ5TjQK1JTpdkxhl9PNm3fU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724079616; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=k7RJw9FJ26zmXFdgal1iaGnogUQEftlUDoNQFv6oWO0=; 
	b=mgQGjJlttMFllg0+wDaSDVi/6MOszNBsm+60OzR3omnASR8hgSteAlG9QzoQb/Tx0BxmYqjZJZkjcXI8X8k5+KCvmJOu/xt/58imJYpQd+5zax+N1WU7P478VhvJgDy22+idaUYO0aRLy6/axu1q9PWkM1eKy96UFxI4EV6kdqk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=detlev.casanova@collabora.com;
	dmarc=pass header.from=<detlev.casanova@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724079616;
	s=zohomail; d=collabora.com; i=detlev.casanova@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
	bh=k7RJw9FJ26zmXFdgal1iaGnogUQEftlUDoNQFv6oWO0=;
	b=c52iv9ubZ/riJfG2Zud97957XWOrplbR1VFKS3fi5wWrXm3KUT3LcogcDChp6bjj
	Jg46FWcy5SInLqvicpGKvbVNzjrs7P6MKNSkW9KeUfwKPD5ecUAx7FAABe88l08IYFS
	c9YWnKjFfM4M7Pujxq7j7d6GQppaXs3M/mKLdiQw=
Received: by mx.zohomail.com with SMTPS id 1724079614574772.4387142966756;
	Mon, 19 Aug 2024 08:00:14 -0700 (PDT)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org,
 Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com, Steven Liu <steven.liu@rock-chips.com>
Subject: Re: [PATCH v3 2/2] pinctrl: rockchip: Add rk3576 pinctrl support
Date: Mon, 19 Aug 2024 11:01:50 -0400
Message-ID: <3025828.e9J7NaK4W3@trenzalore>
In-Reply-To: <5865327.fQeU5cv6pJ@diego>
References:
 <20240814223217.3498-1-detlev.casanova@collabora.com>
 <20240814223217.3498-3-detlev.casanova@collabora.com>
 <5865327.fQeU5cv6pJ@diego>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-ZohoMailClient: External

Hi Heiko,

On Thursday, 15 August 2024 10:05:08 EDT Heiko St=C3=BCbner wrote:
> Am Donnerstag, 15. August 2024, 00:30:39 CEST schrieb Detlev Casanova:
> > From: Steven Liu <steven.liu@rock-chips.com>
> >=20
> > Add support for the 5 rk3576 GPIO banks.
> >=20
> > This also adds support for optionnal support of the sys-grf syscon,
>=20
> only one "n" in optional
>=20
> > used for i3c software controlled weak pull-up.
> >=20
> > Signed-off-by: Steven Liu <steven.liu@rock-chips.com>
> > [rebase, reword commit message]
> > Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> > ---
> >=20
> >  drivers/pinctrl/pinctrl-rockchip.c | 228 +++++++++++++++++++++++++++++
> >  drivers/pinctrl/pinctrl-rockchip.h |   2 +
> >  2 files changed, 230 insertions(+)
> >=20
> > diff --git a/drivers/pinctrl/pinctrl-rockchip.c
> > b/drivers/pinctrl/pinctrl-rockchip.c index 0eacaf10c640f..110ed81d650be
> > 100644
> > --- a/drivers/pinctrl/pinctrl-rockchip.c
> > +++ b/drivers/pinctrl/pinctrl-rockchip.c
[...]
> > @@ -1234,6 +1263,20 @@ static int rockchip_set_mux(struct
> > rockchip_pin_bank *bank, int pin, int mux)>=20
> >  	if (bank->recalced_mask & BIT(pin))
> >  =09
> >  		rockchip_get_recalced_mux(bank, pin, &reg, &bit,=20
&mask);
> >=20
> > +	if (ctrl->type =3D=3D RK3576) {
> > +		if ((bank->bank_num =3D=3D 0) && (pin >=3D RK_PB4) && (pin <=3D=20
RK_PB7))
> > +			reg +=3D 0x1FF4; /*=20
GPIO0_IOC_GPIO0B_IOMUX_SEL_H */
>=20
> 0x1ff4 please
>=20
> > +		/* i3c0 weakpull controlled by software */
> > +		if (((bank->bank_num =3D=3D 0) && (pin =3D=3D RK_PC5) && (mux=20
=3D=3D 0xb)) ||
> > +		    ((bank->bank_num =3D=3D 1) && (pin =3D=3D RK_PD1) && (mux=20
=3D=3D 0xa)))
> > +			regmap_update_bits(regmap_sys, 0x4,=20
0xc000c0, 0xc000c0);
> > +		/* i3c1 weakpull controlled by software */
> > +		if (((bank->bank_num =3D=3D 2) && (pin =3D=3D RK_PA5) && (mux=20
=3D=3D 0xe)) ||
> > +		    ((bank->bank_num =3D=3D 2) && (pin =3D=3D RK_PD6) && (mux=20
=3D=3D 0xc)) ||
> > +		    ((bank->bank_num =3D=3D 3) && (pin =3D=3D RK_PD1) && (mux=20
=3D=3D 0xb)))
> > +			regmap_update_bits(regmap_sys, 0x4,=20
0x3000300, 0x3000300);
>=20
> this setting belongs into drivers/soc/rockchip/grf.c .
>=20
> You want to decide that the i3c controller has no say over the pull
> settings, but instead pinctrl should always be in control.

So If i understand correctly, the GRF driver should contain a rk3576 specif=
ic=20
entry for default values where i3c0 and i3c1 are activated by default and n=
ot=20
to be changed later then ?

I didnt realize that in this driver, the bits are only set to one, never=20
cleared. So it would make sens to have them set by the GRF driver.

Something like this should do it:

#define RK3576_SYSGRF_SOC_CON1		0x6004

static const struct rockchip_grf_value rk3576_defaults[] __initconst =3D {
	{ "i3c0 weakpull", RK3576_SYSGRF_SOC_CON1, HIWORD_UPDATE(3, 3, 6)=20
},
	{ "i3c1 weakpull", RK3576_SYSGRF_SOC_CON1, HIWORD_UPDATE(3, 3, 8)=20
},
};

static const struct rockchip_grf_info rk3576_sysgrf __initconst =3D {
	.values =3D rk3576_defaults,
	.num_values =3D ARRAY_SIZE(rk3576_defaults),
};

> Such default system-wide settings should not clutter up the pinctrl
> driver please. The grf-"driver" exists for exactly that case.
>=20
> That way you also don't need the additional grf-handling here and
> in the dt-binding.
>
> > +	}
> > +
> >=20
> >  	if (ctrl->type =3D=3D RK3588) {
> >  =09
> >  		if (bank->bank_num =3D=3D 0) {
> >  	=09
> >  			if ((pin >=3D RK_PB4) && (pin <=3D RK_PD7)) {
> >=20
> > @@ -2038,6 +2081,142 @@ static int rk3568_calc_drv_reg_and_bit(struct
> > rockchip_pin_bank *bank,>=20
> >  	return 0;
> > =20
> >  }
> >=20
> > +#define RK3576_DRV_BITS_PER_PIN		4
> > +#define RK3576_DRV_PINS_PER_REG		4
> > +#define RK3576_DRV_GPIO0_AL_OFFSET	0x10
> > +#define RK3576_DRV_GPIO0_BH_OFFSET	0x2014
> > +#define RK3576_DRV_GPIO1_OFFSET		0x6020
> > +#define RK3576_DRV_GPIO2_OFFSET		0x6040
> > +#define RK3576_DRV_GPIO3_OFFSET		0x6060
> > +#define RK3576_DRV_GPIO4_AL_OFFSET	0x6080
> > +#define RK3576_DRV_GPIO4_CL_OFFSET	0xA090
> > +#define RK3576_DRV_GPIO4_DL_OFFSET	0xB098
> > +
> > +static int rk3576_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
> > +					int pin_num, struct=20
regmap **regmap,
> > +					int *reg, u8 *bit)
> > +{
> > +	struct rockchip_pinctrl *info =3D bank->drvdata;
> > +
> > +	*regmap =3D info->regmap_base;
> > +
> > +	if (bank->bank_num =3D=3D 0 && pin_num < 12)
> > +		*reg =3D RK3576_DRV_GPIO0_AL_OFFSET;
> > +	else if (bank->bank_num =3D=3D 0)
> > +		*reg =3D RK3576_DRV_GPIO0_BH_OFFSET - 0xc;
> > +	else if (bank->bank_num =3D=3D 1)
> > +		*reg =3D RK3576_DRV_GPIO1_OFFSET;
> > +	else if (bank->bank_num =3D=3D 2)
> > +		*reg =3D RK3576_DRV_GPIO2_OFFSET;
> > +	else if (bank->bank_num =3D=3D 3)
> > +		*reg =3D RK3576_DRV_GPIO3_OFFSET;
> > +	else if (bank->bank_num =3D=3D 4 && pin_num < 16)
> > +		*reg =3D RK3576_DRV_GPIO4_AL_OFFSET;
> > +	else if (bank->bank_num =3D=3D 4 && pin_num < 24)
> > +		*reg =3D RK3576_DRV_GPIO4_CL_OFFSET - 0x10;
> > +	else if (bank->bank_num =3D=3D 4)
> > +		*reg =3D RK3576_DRV_GPIO4_DL_OFFSET - 0x18;
> > +	else
> > +		dev_err(info->dev, "unsupported bank_num %d\n", bank-
>bank_num);
> > +
> > +	*reg +=3D ((pin_num / RK3576_DRV_PINS_PER_REG) * 4);
> > +	*bit =3D pin_num % RK3576_DRV_PINS_PER_REG;
> > +	*bit *=3D RK3576_DRV_BITS_PER_PIN;
> > +
> > +	return 0;
> > +}
> > +
> > +#define RK3576_PULL_BITS_PER_PIN	2
> > +#define RK3576_PULL_PINS_PER_REG	8
> > +#define RK3576_PULL_GPIO0_AL_OFFSET	0x20
> > +#define RK3576_PULL_GPIO0_BH_OFFSET	0x2028
> > +#define RK3576_PULL_GPIO1_OFFSET	0x6110
> > +#define RK3576_PULL_GPIO2_OFFSET	0x6120
> > +#define RK3576_PULL_GPIO3_OFFSET	0x6130
> > +#define RK3576_PULL_GPIO4_AL_OFFSET	0x6140
> > +#define RK3576_PULL_GPIO4_CL_OFFSET	0xA148
> > +#define RK3576_PULL_GPIO4_DL_OFFSET	0xB14C
> > +
> > +static int rk3576_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
> > +					 int pin_num, struct=20
regmap **regmap,
> > +					 int *reg, u8 *bit)
> > +{
> > +	struct rockchip_pinctrl *info =3D bank->drvdata;
> > +
> > +	*regmap =3D info->regmap_base;
> > +
> > +	if (bank->bank_num =3D=3D 0 && pin_num < 12)
> > +		*reg =3D RK3576_PULL_GPIO0_AL_OFFSET;
> > +	else if (bank->bank_num =3D=3D 0)
> > +		*reg =3D RK3576_PULL_GPIO0_BH_OFFSET - 0x4;
> > +	else if (bank->bank_num =3D=3D 1)
> > +		*reg =3D RK3576_PULL_GPIO1_OFFSET;
> > +	else if (bank->bank_num =3D=3D 2)
> > +		*reg =3D RK3576_PULL_GPIO2_OFFSET;
> > +	else if (bank->bank_num =3D=3D 3)
> > +		*reg =3D RK3576_PULL_GPIO3_OFFSET;
> > +	else if (bank->bank_num =3D=3D 4 && pin_num < 16)
> > +		*reg =3D RK3576_PULL_GPIO4_AL_OFFSET;
> > +	else if (bank->bank_num =3D=3D 4 && pin_num < 24)
> > +		*reg =3D RK3576_PULL_GPIO4_CL_OFFSET - 0x8;
> > +	else if (bank->bank_num =3D=3D 4)
> > +		*reg =3D RK3576_PULL_GPIO4_DL_OFFSET - 0xc;
> > +	else
> > +		dev_err(info->dev, "unsupported bank_num %d\n", bank-
>bank_num);
> > +
> > +	*reg +=3D ((pin_num / RK3576_PULL_PINS_PER_REG) * 4);
> > +	*bit =3D pin_num % RK3576_PULL_PINS_PER_REG;
> > +	*bit *=3D RK3576_PULL_BITS_PER_PIN;
> > +
> > +	return 0;
> > +}
> > +
> > +#define RK3576_SMT_BITS_PER_PIN		1
> > +#define RK3576_SMT_PINS_PER_REG		8
> > +#define RK3576_SMT_GPIO0_AL_OFFSET	0x30
> > +#define RK3576_SMT_GPIO0_BH_OFFSET	0x2040
> > +#define RK3576_SMT_GPIO1_OFFSET		0x6210
> > +#define RK3576_SMT_GPIO2_OFFSET		0x6220
> > +#define RK3576_SMT_GPIO3_OFFSET		0x6230
> > +#define RK3576_SMT_GPIO4_AL_OFFSET	0x6240
> > +#define RK3576_SMT_GPIO4_CL_OFFSET	0xA248
> > +#define RK3576_SMT_GPIO4_DL_OFFSET	0xB24C
> > +
> > +static int rk3576_calc_schmitt_reg_and_bit(struct rockchip_pin_bank
> > *bank,
> > +					   int pin_num,
> > +					   struct regmap=20
**regmap,
> > +					   int *reg, u8 *bit)
> > +{
> > +	struct rockchip_pinctrl *info =3D bank->drvdata;
> > +
> > +	*regmap =3D info->regmap_base;
> > +
> > +	if (bank->bank_num =3D=3D 0 && pin_num < 12)
> > +		*reg =3D RK3576_SMT_GPIO0_AL_OFFSET;
> > +	else if (bank->bank_num =3D=3D 0)
> > +		*reg =3D RK3576_SMT_GPIO0_BH_OFFSET - 0x4;
> > +	else if (bank->bank_num =3D=3D 1)
> > +		*reg =3D RK3576_SMT_GPIO1_OFFSET;
> > +	else if (bank->bank_num =3D=3D 2)
> > +		*reg =3D RK3576_SMT_GPIO2_OFFSET;
> > +	else if (bank->bank_num =3D=3D 3)
> > +		*reg =3D RK3576_SMT_GPIO3_OFFSET;
> > +	else if (bank->bank_num =3D=3D 4 && pin_num < 16)
> > +		*reg =3D RK3576_SMT_GPIO4_AL_OFFSET;
> > +	else if (bank->bank_num =3D=3D 4 && pin_num < 24)
> > +		*reg =3D RK3576_SMT_GPIO4_CL_OFFSET - 0x8;
> > +	else if (bank->bank_num =3D=3D 4)
> > +		*reg =3D RK3576_SMT_GPIO4_DL_OFFSET - 0xc;
> > +	else
> > +		dev_err(info->dev, "unsupported bank_num %d\n", bank-
>bank_num);
> > +
> > +	*reg +=3D ((pin_num / RK3576_SMT_PINS_PER_REG) * 4);
> > +	*bit =3D pin_num % RK3576_SMT_PINS_PER_REG;
> > +	*bit *=3D RK3576_SMT_BITS_PER_PIN;
> > +
> > +	return 0;
> > +}
> > +
> >=20
> >  #define RK3588_PMU1_IOC_REG		(0x0000)
> >  #define RK3588_PMU2_IOC_REG		(0x4000)
> >  #define RK3588_BUS_IOC_REG		(0x8000)
> >=20
> > @@ -2332,6 +2511,10 @@ static int rockchip_set_drive_perpin(struct
> > rockchip_pin_bank *bank,>=20
> >  		rmask_bits =3D RK3568_DRV_BITS_PER_PIN;
> >  		ret =3D (1 << (strength + 1)) - 1;
> >  		goto config;
> >=20
> > +	} else if (ctrl->type =3D=3D RK3576) {
> > +		rmask_bits =3D RK3576_DRV_BITS_PER_PIN;
> > +		ret =3D ((strength & BIT(2)) >> 2) | ((strength & BIT(0))=20
<< 2) |
> > (strength & BIT(1)); +		goto config;
> >=20
> >  	}
> >  =09
> >  	if (ctrl->type =3D=3D RV1126) {
> >=20
> > @@ -2469,6 +2652,7 @@ static int rockchip_get_pull(struct
> > rockchip_pin_bank *bank, int pin_num)>=20
> >  	case RK3368:
> >  	case RK3399:
> >=20
> >  	case RK3568:
> > +	case RK3576:
> >  	case RK3588:
> >  		pull_type =3D bank->pull_type[pin_num / 8];
> >  		data >>=3D bit;
> >=20
> > @@ -2528,6 +2712,7 @@ static int rockchip_set_pull(struct
> > rockchip_pin_bank *bank,>=20
> >  	case RK3368:
> >  	case RK3399:
> >=20
> >  	case RK3568:
> > +	case RK3576:
> >  	case RK3588:
> >  		pull_type =3D bank->pull_type[pin_num / 8];
> >  		ret =3D -EINVAL;
> >=20
> > @@ -2793,6 +2978,7 @@ static bool rockchip_pinconf_pull_valid(struct
> > rockchip_pin_ctrl *ctrl,>=20
> >  	case RK3368:
> >  	case RK3399:
> >=20
> >  	case RK3568:
> > +	case RK3576:
> >  	case RK3588:
> >  		return (pull !=3D PIN_CONFIG_BIAS_PULL_PIN_DEFAULT);
> >  =09
> >  	}
> >=20
> > @@ -3439,6 +3625,15 @@ static int rockchip_pinctrl_probe(struct
> > platform_device *pdev)>=20
> >  		}
> >  =09
> >  	}
> >=20
> > +	/* try to find the optional reference to the sys_grf syscon */
> > +	node =3D of_parse_phandle(np, "rockchip,sys-grf", 0);
> > +	if (node) {
> > +		info->regmap_sys_grf =3D syscon_node_to_regmap(node);
> > +		of_node_put(node);
> > +		if (IS_ERR(info->regmap_sys_grf))
> > +			return PTR_ERR(info->regmap_sys_grf);
> > +	}
> > +
>=20
> not needed if the i3c stuff moves into the grf driver.
>=20
> >  	/* try to find the optional reference to the pmu syscon */
> >  	node =3D of_parse_phandle(np, "rockchip,pmu", 0);
> >  	if (node) {
> >=20
> > @@ -3949,6 +4144,37 @@ static struct rockchip_pin_ctrl rk3568_pin_ctrl =
=3D {
> >=20
> >  	.schmitt_calc_reg	=3D rk3568_calc_schmitt_reg_and_bit,
> > =20
> >  };
> >=20
> > +#define RK3576_PIN_BANK(ID, LABEL, OFFSET0, OFFSET1, OFFSET2, OFFSET3)=
=09
\
> > +	PIN_BANK_IOMUX_FLAGS_OFFSET_PULL_FLAGS(ID, 32, LABEL,	=09
\
> > +					      =20
IOMUX_WIDTH_4BIT,	\
> > +					      =20
IOMUX_WIDTH_4BIT,	\
> > +					      =20
IOMUX_WIDTH_4BIT,	\
> > +					      =20
IOMUX_WIDTH_4BIT,	\
> > +					       OFFSET0,=20
OFFSET1,	\
> > +					       OFFSET2,=20
OFFSET3,	\
> > +					      =20
PULL_TYPE_IO_1V8_ONLY,	\
> > +					      =20
PULL_TYPE_IO_1V8_ONLY,	\
> > +					      =20
PULL_TYPE_IO_1V8_ONLY,	\
> > +					      =20
PULL_TYPE_IO_1V8_ONLY)
> > +
> > +static struct rockchip_pin_bank rk3576_pin_banks[] =3D {
> > +	RK3576_PIN_BANK(0, "gpio0", 0, 0x8, 0x2004, 0x200C),
> > +	RK3576_PIN_BANK(1, "gpio1", 0x4020, 0x4028, 0x4030, 0x4038),
> > +	RK3576_PIN_BANK(2, "gpio2", 0x4040, 0x4048, 0x4050, 0x4058),
> > +	RK3576_PIN_BANK(3, "gpio3", 0x4060, 0x4068, 0x4070, 0x4078),
> > +	RK3576_PIN_BANK(4, "gpio4", 0x4080, 0x4088, 0xA390, 0xB398),
> > +};
> > +
> > +static struct rockchip_pin_ctrl rk3576_pin_ctrl __maybe_unused =3D {
> > +	.pin_banks		=3D rk3576_pin_banks,
> > +	.nr_banks		=3D ARRAY_SIZE(rk3576_pin_banks),
> > +	.label			=3D "RK3576-GPIO",
> > +	.type			=3D RK3576,
> > +	.pull_calc_reg		=3D=20
rk3576_calc_pull_reg_and_bit,
> > +	.drv_calc_reg		=3D rk3576_calc_drv_reg_and_bit,
> > +	.schmitt_calc_reg	=3D rk3576_calc_schmitt_reg_and_bit,
> > +};
> > +
> >=20
> >  static struct rockchip_pin_bank rk3588_pin_banks[] =3D {
> > =20
> >  	RK3588_PIN_BANK_FLAGS(0, 32, "gpio0",
> >  =09
> >  			      IOMUX_WIDTH_4BIT,=20
PULL_TYPE_IO_1V8_ONLY),
> >=20
> > @@ -4005,6 +4231,8 @@ static const struct of_device_id
> > rockchip_pinctrl_dt_match[] =3D {>=20
> >  		.data =3D &rk3399_pin_ctrl },
> >  =09
> >  	{ .compatible =3D "rockchip,rk3568-pinctrl",
> >  =09
> >  		.data =3D &rk3568_pin_ctrl },
> >=20
> > +	{ .compatible =3D "rockchip,rk3576-pinctrl",
> > +		.data =3D &rk3576_pin_ctrl },
> >=20
> >  	{ .compatible =3D "rockchip,rk3588-pinctrl",
> >  =09
> >  		.data =3D &rk3588_pin_ctrl },
> >  =09
> >  	{},
> >=20
> > diff --git a/drivers/pinctrl/pinctrl-rockchip.h
> > b/drivers/pinctrl/pinctrl-rockchip.h index 849266f8b1913..0b2b56014b173
> > 100644
> > --- a/drivers/pinctrl/pinctrl-rockchip.h
> > +++ b/drivers/pinctrl/pinctrl-rockchip.h
> > @@ -197,6 +197,7 @@ enum rockchip_pinctrl_type {
> >=20
> >  	RK3368,
> >  	RK3399,
> >  	RK3568,
> >=20
> > +	RK3576,
> >=20
> >  	RK3588,
> > =20
> >  };
> >=20
> > @@ -455,6 +456,7 @@ struct rockchip_pinctrl {
> >=20
> >  	int				reg_size;
> >  	struct regmap			*regmap_pull;
> >  	struct regmap			*regmap_pmu;
> >=20
> > +	struct regmap			*regmap_sys_grf;
>=20
> same
>=20
> >  	struct device			*dev;
> >  	struct rockchip_pin_ctrl	*ctrl;
> >  	struct pinctrl_desc		pctl;
>=20
> The pinctrl changes for the core rk3576 parts look fine.
>=20
> Heiko





