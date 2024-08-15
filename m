Return-Path: <linux-gpio+bounces-8759-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F80295328D
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2024 16:07:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B03411C25D14
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Aug 2024 14:07:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F6E41A76A0;
	Thu, 15 Aug 2024 14:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="qcj+x9wb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF8144376;
	Thu, 15 Aug 2024 14:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723730718; cv=none; b=k6xHMTNqATAJRTxWlH0HKZjfDt9hinYZZmNYeWbIXDCX/EVnMSA4qfvgT0zvm7UYW1hz2yEpkvsYK2v4JkU3aU6mH2uWQ4qKFUuik207VROmJaPxABaOfaKyaOcuNQEFCUH8gI9XrSUGOfFoCaWbsTkqYGB1ovUpW7mvY55SM4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723730718; c=relaxed/simple;
	bh=YUNRs6BDq9BMPIUWQ0AtCJao2Y5DHi/4nK9dWgwnc2w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Hg9ajA8aMQ7s67XWU56KvRWaWzpPGcWVuMo1G42Ts0G+Sc0Qbk06RHOlBNHx3FrYAhXhe2JXaOUXds4gb9AWiIfeqgKt7C8naXC8d2PH0orewfPk00ESIiUr3Rh9yUo9fcJ1RfgUf42TcW9kNZ9/2u1hTZ+d3ORSRbwfrUypq6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=qcj+x9wb; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=pd/g4NdIixVnycV+jtpbd814jlvaxwOgs1DMB5K/sxs=; b=qcj+x9wbbS83wYhN4aNgMwfKBR
	IQ7nlnTAfco4P21jkIMsKQLiouneD0tUO3bv3C2wCSmYSB0CtdtYjbayykHAOw+Ns/e/Sk1cpRf1R
	DPD6nll8KwYPCKldPRxeZZj3nJ+yShsq87QV2hAkCmsPO73pmcbODI1KLsSwzl47U97ZRPZ9erUv7
	fC59sPhhpaIZJD/HXs7ITN+bw7BPJrMYqX8OFKBnifOSIyV270M0dBR0Aa6CTIe+6UQ/FO7tr980+
	QoIPv0C4qk7vakDbensKPsKjJCkE8MU1VqOrk8zhbHYJDCb74VfbEohnWzDu97KdmmZTz+vbi4Z0Y
	knlo4Agw==;
Received: from i53875a9f.versanet.de ([83.135.90.159] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1seb6D-0003Q8-AZ; Thu, 15 Aug 2024 16:05:09 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 kernel@collabora.com, Steven Liu <steven.liu@rock-chips.com>,
 Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH v3 2/2] pinctrl: rockchip: Add rk3576 pinctrl support
Date: Thu, 15 Aug 2024 16:05:08 +0200
Message-ID: <5865327.fQeU5cv6pJ@diego>
In-Reply-To: <20240814223217.3498-3-detlev.casanova@collabora.com>
References:
 <20240814223217.3498-1-detlev.casanova@collabora.com>
 <20240814223217.3498-3-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Donnerstag, 15. August 2024, 00:30:39 CEST schrieb Detlev Casanova:
> From: Steven Liu <steven.liu@rock-chips.com>
> 
> Add support for the 5 rk3576 GPIO banks.
> 
> This also adds support for optionnal support of the sys-grf syscon,

only one "n" in optional

> used for i3c software controlled weak pull-up.
> 
> Signed-off-by: Steven Liu <steven.liu@rock-chips.com>
> [rebase, reword commit message]
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  drivers/pinctrl/pinctrl-rockchip.c | 228 +++++++++++++++++++++++++++++
>  drivers/pinctrl/pinctrl-rockchip.h |   2 +
>  2 files changed, 230 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index 0eacaf10c640f..110ed81d650be 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -84,6 +84,27 @@
>  		},							\
>  	}
>  
> +#define PIN_BANK_IOMUX_FLAGS_OFFSET_PULL_FLAGS(id, pins, label, iom0,	\
> +					       iom1, iom2, iom3,	\
> +					       offset0, offset1,	\
> +					       offset2, offset3, pull0,	\
> +					       pull1, pull2, pull3)	\
> +	{								\
> +		.bank_num	= id,					\
> +		.nr_pins	= pins,					\
> +		.name		= label,				\
> +		.iomux		= {					\
> +			{ .type = iom0, .offset = offset0 },		\
> +			{ .type = iom1, .offset = offset1 },		\
> +			{ .type = iom2, .offset = offset2 },		\
> +			{ .type = iom3, .offset = offset3 },		\
> +		},							\
> +		.pull_type[0] = pull0,					\
> +		.pull_type[1] = pull1,					\
> +		.pull_type[2] = pull2,					\
> +		.pull_type[3] = pull3,					\
> +	}
> +
>  #define PIN_BANK_DRV_FLAGS(id, pins, label, type0, type1, type2, type3) \
>  	{								\
>  		.bank_num	= id,					\
> @@ -1120,6 +1141,11 @@ static int rockchip_get_mux(struct rockchip_pin_bank *bank, int pin)
>  	if (bank->recalced_mask & BIT(pin))
>  		rockchip_get_recalced_mux(bank, pin, &reg, &bit, &mask);
>  
> +	if (ctrl->type == RK3576) {
> +		if ((bank->bank_num == 0) && (pin >= RK_PB4) && (pin <= RK_PB7))
> +			reg += 0x1FF4; /* GPIO0_IOC_GPIO0B_IOMUX_SEL_H */

0x1ff4 in lower case please


> +	}
> +
>  	if (ctrl->type == RK3588) {
>  		if (bank->bank_num == 0) {
>  			if ((pin >= RK_PB4) && (pin <= RK_PD7)) {
> @@ -1193,6 +1219,7 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
>  	struct device *dev = info->dev;
>  	int iomux_num = (pin / 8);
>  	struct regmap *regmap;
> +	struct regmap *regmap_sys;
>  	int reg, ret, mask, mux_type;
>  	u8 bit;
>  	u32 data, rmask, route_location, route_reg, route_val;
> @@ -1213,6 +1240,8 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
>  	else
>  		regmap = info->regmap_base;
>  
> +	regmap_sys = info->regmap_sys_grf;
> +
>  	/* get basic quadrupel of mux registers and the correct reg inside */
>  	mux_type = bank->iomux[iomux_num].type;
>  	reg = bank->iomux[iomux_num].offset;
> @@ -1234,6 +1263,20 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
>  	if (bank->recalced_mask & BIT(pin))
>  		rockchip_get_recalced_mux(bank, pin, &reg, &bit, &mask);
>  
> +	if (ctrl->type == RK3576) {
> +		if ((bank->bank_num == 0) && (pin >= RK_PB4) && (pin <= RK_PB7))
> +			reg += 0x1FF4; /* GPIO0_IOC_GPIO0B_IOMUX_SEL_H */

0x1ff4 please

> +		/* i3c0 weakpull controlled by software */
> +		if (((bank->bank_num == 0) && (pin == RK_PC5) && (mux == 0xb)) ||
> +		    ((bank->bank_num == 1) && (pin == RK_PD1) && (mux == 0xa)))
> +			regmap_update_bits(regmap_sys, 0x4, 0xc000c0, 0xc000c0);
> +		/* i3c1 weakpull controlled by software */
> +		if (((bank->bank_num == 2) && (pin == RK_PA5) && (mux == 0xe)) ||
> +		    ((bank->bank_num == 2) && (pin == RK_PD6) && (mux == 0xc)) ||
> +		    ((bank->bank_num == 3) && (pin == RK_PD1) && (mux == 0xb)))
> +			regmap_update_bits(regmap_sys, 0x4, 0x3000300, 0x3000300);

this setting belongs into drivers/soc/rockchip/grf.c .

You want to decide that the i3c controller has no say over the pull
settings, but instead pinctrl should always be in control.

Such default system-wide settings should not clutter up the pinctrl
driver please. The grf-"driver" exists for exactly that case.

That way you also don't need the additional grf-handling here and
in the dt-binding.


> +	}
> +
>  	if (ctrl->type == RK3588) {
>  		if (bank->bank_num == 0) {
>  			if ((pin >= RK_PB4) && (pin <= RK_PD7)) {
> @@ -2038,6 +2081,142 @@ static int rk3568_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
>  	return 0;
>  }
>  
> +#define RK3576_DRV_BITS_PER_PIN		4
> +#define RK3576_DRV_PINS_PER_REG		4
> +#define RK3576_DRV_GPIO0_AL_OFFSET	0x10
> +#define RK3576_DRV_GPIO0_BH_OFFSET	0x2014
> +#define RK3576_DRV_GPIO1_OFFSET		0x6020
> +#define RK3576_DRV_GPIO2_OFFSET		0x6040
> +#define RK3576_DRV_GPIO3_OFFSET		0x6060
> +#define RK3576_DRV_GPIO4_AL_OFFSET	0x6080
> +#define RK3576_DRV_GPIO4_CL_OFFSET	0xA090
> +#define RK3576_DRV_GPIO4_DL_OFFSET	0xB098
> +
> +static int rk3576_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
> +					int pin_num, struct regmap **regmap,
> +					int *reg, u8 *bit)
> +{
> +	struct rockchip_pinctrl *info = bank->drvdata;
> +
> +	*regmap = info->regmap_base;
> +
> +	if (bank->bank_num == 0 && pin_num < 12)
> +		*reg = RK3576_DRV_GPIO0_AL_OFFSET;
> +	else if (bank->bank_num == 0)
> +		*reg = RK3576_DRV_GPIO0_BH_OFFSET - 0xc;
> +	else if (bank->bank_num == 1)
> +		*reg = RK3576_DRV_GPIO1_OFFSET;
> +	else if (bank->bank_num == 2)
> +		*reg = RK3576_DRV_GPIO2_OFFSET;
> +	else if (bank->bank_num == 3)
> +		*reg = RK3576_DRV_GPIO3_OFFSET;
> +	else if (bank->bank_num == 4 && pin_num < 16)
> +		*reg = RK3576_DRV_GPIO4_AL_OFFSET;
> +	else if (bank->bank_num == 4 && pin_num < 24)
> +		*reg = RK3576_DRV_GPIO4_CL_OFFSET - 0x10;
> +	else if (bank->bank_num == 4)
> +		*reg = RK3576_DRV_GPIO4_DL_OFFSET - 0x18;
> +	else
> +		dev_err(info->dev, "unsupported bank_num %d\n", bank->bank_num);
> +
> +	*reg += ((pin_num / RK3576_DRV_PINS_PER_REG) * 4);
> +	*bit = pin_num % RK3576_DRV_PINS_PER_REG;
> +	*bit *= RK3576_DRV_BITS_PER_PIN;
> +
> +	return 0;
> +}
> +
> +#define RK3576_PULL_BITS_PER_PIN	2
> +#define RK3576_PULL_PINS_PER_REG	8
> +#define RK3576_PULL_GPIO0_AL_OFFSET	0x20
> +#define RK3576_PULL_GPIO0_BH_OFFSET	0x2028
> +#define RK3576_PULL_GPIO1_OFFSET	0x6110
> +#define RK3576_PULL_GPIO2_OFFSET	0x6120
> +#define RK3576_PULL_GPIO3_OFFSET	0x6130
> +#define RK3576_PULL_GPIO4_AL_OFFSET	0x6140
> +#define RK3576_PULL_GPIO4_CL_OFFSET	0xA148
> +#define RK3576_PULL_GPIO4_DL_OFFSET	0xB14C
> +
> +static int rk3576_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
> +					 int pin_num, struct regmap **regmap,
> +					 int *reg, u8 *bit)
> +{
> +	struct rockchip_pinctrl *info = bank->drvdata;
> +
> +	*regmap = info->regmap_base;
> +
> +	if (bank->bank_num == 0 && pin_num < 12)
> +		*reg = RK3576_PULL_GPIO0_AL_OFFSET;
> +	else if (bank->bank_num == 0)
> +		*reg = RK3576_PULL_GPIO0_BH_OFFSET - 0x4;
> +	else if (bank->bank_num == 1)
> +		*reg = RK3576_PULL_GPIO1_OFFSET;
> +	else if (bank->bank_num == 2)
> +		*reg = RK3576_PULL_GPIO2_OFFSET;
> +	else if (bank->bank_num == 3)
> +		*reg = RK3576_PULL_GPIO3_OFFSET;
> +	else if (bank->bank_num == 4 && pin_num < 16)
> +		*reg = RK3576_PULL_GPIO4_AL_OFFSET;
> +	else if (bank->bank_num == 4 && pin_num < 24)
> +		*reg = RK3576_PULL_GPIO4_CL_OFFSET - 0x8;
> +	else if (bank->bank_num == 4)
> +		*reg = RK3576_PULL_GPIO4_DL_OFFSET - 0xc;
> +	else
> +		dev_err(info->dev, "unsupported bank_num %d\n", bank->bank_num);
> +
> +	*reg += ((pin_num / RK3576_PULL_PINS_PER_REG) * 4);
> +	*bit = pin_num % RK3576_PULL_PINS_PER_REG;
> +	*bit *= RK3576_PULL_BITS_PER_PIN;
> +
> +	return 0;
> +}
> +
> +#define RK3576_SMT_BITS_PER_PIN		1
> +#define RK3576_SMT_PINS_PER_REG		8
> +#define RK3576_SMT_GPIO0_AL_OFFSET	0x30
> +#define RK3576_SMT_GPIO0_BH_OFFSET	0x2040
> +#define RK3576_SMT_GPIO1_OFFSET		0x6210
> +#define RK3576_SMT_GPIO2_OFFSET		0x6220
> +#define RK3576_SMT_GPIO3_OFFSET		0x6230
> +#define RK3576_SMT_GPIO4_AL_OFFSET	0x6240
> +#define RK3576_SMT_GPIO4_CL_OFFSET	0xA248
> +#define RK3576_SMT_GPIO4_DL_OFFSET	0xB24C
> +
> +static int rk3576_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
> +					   int pin_num,
> +					   struct regmap **regmap,
> +					   int *reg, u8 *bit)
> +{
> +	struct rockchip_pinctrl *info = bank->drvdata;
> +
> +	*regmap = info->regmap_base;
> +
> +	if (bank->bank_num == 0 && pin_num < 12)
> +		*reg = RK3576_SMT_GPIO0_AL_OFFSET;
> +	else if (bank->bank_num == 0)
> +		*reg = RK3576_SMT_GPIO0_BH_OFFSET - 0x4;
> +	else if (bank->bank_num == 1)
> +		*reg = RK3576_SMT_GPIO1_OFFSET;
> +	else if (bank->bank_num == 2)
> +		*reg = RK3576_SMT_GPIO2_OFFSET;
> +	else if (bank->bank_num == 3)
> +		*reg = RK3576_SMT_GPIO3_OFFSET;
> +	else if (bank->bank_num == 4 && pin_num < 16)
> +		*reg = RK3576_SMT_GPIO4_AL_OFFSET;
> +	else if (bank->bank_num == 4 && pin_num < 24)
> +		*reg = RK3576_SMT_GPIO4_CL_OFFSET - 0x8;
> +	else if (bank->bank_num == 4)
> +		*reg = RK3576_SMT_GPIO4_DL_OFFSET - 0xc;
> +	else
> +		dev_err(info->dev, "unsupported bank_num %d\n", bank->bank_num);
> +
> +	*reg += ((pin_num / RK3576_SMT_PINS_PER_REG) * 4);
> +	*bit = pin_num % RK3576_SMT_PINS_PER_REG;
> +	*bit *= RK3576_SMT_BITS_PER_PIN;
> +
> +	return 0;
> +}
> +
>  #define RK3588_PMU1_IOC_REG		(0x0000)
>  #define RK3588_PMU2_IOC_REG		(0x4000)
>  #define RK3588_BUS_IOC_REG		(0x8000)
> @@ -2332,6 +2511,10 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
>  		rmask_bits = RK3568_DRV_BITS_PER_PIN;
>  		ret = (1 << (strength + 1)) - 1;
>  		goto config;
> +	} else if (ctrl->type == RK3576) {
> +		rmask_bits = RK3576_DRV_BITS_PER_PIN;
> +		ret = ((strength & BIT(2)) >> 2) | ((strength & BIT(0)) << 2) | (strength & BIT(1));
> +		goto config;
>  	}
>  
>  	if (ctrl->type == RV1126) {
> @@ -2469,6 +2652,7 @@ static int rockchip_get_pull(struct rockchip_pin_bank *bank, int pin_num)
>  	case RK3368:
>  	case RK3399:
>  	case RK3568:
> +	case RK3576:
>  	case RK3588:
>  		pull_type = bank->pull_type[pin_num / 8];
>  		data >>= bit;
> @@ -2528,6 +2712,7 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
>  	case RK3368:
>  	case RK3399:
>  	case RK3568:
> +	case RK3576:
>  	case RK3588:
>  		pull_type = bank->pull_type[pin_num / 8];
>  		ret = -EINVAL;
> @@ -2793,6 +2978,7 @@ static bool rockchip_pinconf_pull_valid(struct rockchip_pin_ctrl *ctrl,
>  	case RK3368:
>  	case RK3399:
>  	case RK3568:
> +	case RK3576:
>  	case RK3588:
>  		return (pull != PIN_CONFIG_BIAS_PULL_PIN_DEFAULT);
>  	}
> @@ -3439,6 +3625,15 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> +	/* try to find the optional reference to the sys_grf syscon */
> +	node = of_parse_phandle(np, "rockchip,sys-grf", 0);
> +	if (node) {
> +		info->regmap_sys_grf = syscon_node_to_regmap(node);
> +		of_node_put(node);
> +		if (IS_ERR(info->regmap_sys_grf))
> +			return PTR_ERR(info->regmap_sys_grf);
> +	}
> +

not needed if the i3c stuff moves into the grf driver.


>  	/* try to find the optional reference to the pmu syscon */
>  	node = of_parse_phandle(np, "rockchip,pmu", 0);
>  	if (node) {
> @@ -3949,6 +4144,37 @@ static struct rockchip_pin_ctrl rk3568_pin_ctrl = {
>  	.schmitt_calc_reg	= rk3568_calc_schmitt_reg_and_bit,
>  };
>  
> +#define RK3576_PIN_BANK(ID, LABEL, OFFSET0, OFFSET1, OFFSET2, OFFSET3)	\
> +	PIN_BANK_IOMUX_FLAGS_OFFSET_PULL_FLAGS(ID, 32, LABEL,		\
> +					       IOMUX_WIDTH_4BIT,	\
> +					       IOMUX_WIDTH_4BIT,	\
> +					       IOMUX_WIDTH_4BIT,	\
> +					       IOMUX_WIDTH_4BIT,	\
> +					       OFFSET0, OFFSET1,	\
> +					       OFFSET2, OFFSET3,	\
> +					       PULL_TYPE_IO_1V8_ONLY,	\
> +					       PULL_TYPE_IO_1V8_ONLY,	\
> +					       PULL_TYPE_IO_1V8_ONLY,	\
> +					       PULL_TYPE_IO_1V8_ONLY)
> +
> +static struct rockchip_pin_bank rk3576_pin_banks[] = {
> +	RK3576_PIN_BANK(0, "gpio0", 0, 0x8, 0x2004, 0x200C),
> +	RK3576_PIN_BANK(1, "gpio1", 0x4020, 0x4028, 0x4030, 0x4038),
> +	RK3576_PIN_BANK(2, "gpio2", 0x4040, 0x4048, 0x4050, 0x4058),
> +	RK3576_PIN_BANK(3, "gpio3", 0x4060, 0x4068, 0x4070, 0x4078),
> +	RK3576_PIN_BANK(4, "gpio4", 0x4080, 0x4088, 0xA390, 0xB398),
> +};
> +
> +static struct rockchip_pin_ctrl rk3576_pin_ctrl __maybe_unused = {
> +	.pin_banks		= rk3576_pin_banks,
> +	.nr_banks		= ARRAY_SIZE(rk3576_pin_banks),
> +	.label			= "RK3576-GPIO",
> +	.type			= RK3576,
> +	.pull_calc_reg		= rk3576_calc_pull_reg_and_bit,
> +	.drv_calc_reg		= rk3576_calc_drv_reg_and_bit,
> +	.schmitt_calc_reg	= rk3576_calc_schmitt_reg_and_bit,
> +};
> +
>  static struct rockchip_pin_bank rk3588_pin_banks[] = {
>  	RK3588_PIN_BANK_FLAGS(0, 32, "gpio0",
>  			      IOMUX_WIDTH_4BIT, PULL_TYPE_IO_1V8_ONLY),
> @@ -4005,6 +4231,8 @@ static const struct of_device_id rockchip_pinctrl_dt_match[] = {
>  		.data = &rk3399_pin_ctrl },
>  	{ .compatible = "rockchip,rk3568-pinctrl",
>  		.data = &rk3568_pin_ctrl },
> +	{ .compatible = "rockchip,rk3576-pinctrl",
> +		.data = &rk3576_pin_ctrl },
>  	{ .compatible = "rockchip,rk3588-pinctrl",
>  		.data = &rk3588_pin_ctrl },
>  	{},
> diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
> index 849266f8b1913..0b2b56014b173 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.h
> +++ b/drivers/pinctrl/pinctrl-rockchip.h
> @@ -197,6 +197,7 @@ enum rockchip_pinctrl_type {
>  	RK3368,
>  	RK3399,
>  	RK3568,
> +	RK3576,
>  	RK3588,
>  };
>  
> @@ -455,6 +456,7 @@ struct rockchip_pinctrl {
>  	int				reg_size;
>  	struct regmap			*regmap_pull;
>  	struct regmap			*regmap_pmu;
> +	struct regmap			*regmap_sys_grf;

same

>  	struct device			*dev;
>  	struct rockchip_pin_ctrl	*ctrl;
>  	struct pinctrl_desc		pctl;
> 


The pinctrl changes for the core rk3576 parts look fine.

Heiko



