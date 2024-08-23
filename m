Return-Path: <linux-gpio+bounces-9043-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D678195C9A6
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 11:51:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F68B287A5C
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Aug 2024 09:51:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD5FE153800;
	Fri, 23 Aug 2024 09:51:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="aj3S6GiB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4971152178;
	Fri, 23 Aug 2024 09:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724406669; cv=none; b=mITQVJ/D6zZ2ZbSIx4abOs5jlmlNopM/4t2UbkkQBb2HChlhTf+0Tzl051s20aDUk6tmwSvzk25HVFDHoBGeJ7vmVk4iVvI5kpeD1WeHzMfM1PwHYao/0DjNV2uafePFbJV3QYQmiocgtXPu5sxXqkv/BXa/c0maPjLJi4UJdlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724406669; c=relaxed/simple;
	bh=pO1LJH4cGuoH04Vv83yCXJ8/1y+ULeza+tpxWLoFgNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WFMVP2d7fXC+SwDuogDvNzAMSNu5QGiytLzkvHAgnoC6jJu9sNuuoAfiQvLFFt5GVy1DZJDsY2n8746IvxNkNmz7/PNoj4VG5hF0QrbmlmUE4PPjrD5VwNQr8FFWFUttD03n81OFZfhvzcucp2eLs0DI5eafje6arDSc1TD5SJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=aj3S6GiB; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=8fht7tPDE4Rb4t8/JlhV+MxVhM5JCD2k2BTtHt49/fA=; b=aj3S6GiBX9erP58dNs6Lt5qnze
	Hv51aeB//So6Dg55sh5RWtYYxSj3YDu8n51HOezCv9JXD1sgb99dk6V4MjJYhRffgBbkFZnQaY356
	gTclVkw47nqjriK1SrYc7mOS6k9JqlHLsC+yg/4cxktlEwOriZ3Zg2P1KUpaFb4TpbVPzXyVwLCJ6
	yXAYRqowiiIiKCQJnoOvY1mB+z8G0yw6uwQEjafFNaGYtIfQ+vIkrih86syV8vuv4AR4DtuXt+OzB
	RyJk7Y80bUMSQRzuyrKeqDPlWjV/RRGpTcFylEm7oIWLh71SOKlUiUfiFelCQV7lIX/TZGToyCI2Q
	PoTnAHOg==;
Received: from i5e861933.versanet.de ([94.134.25.51] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1shQwh-0003yt-Oy; Fri, 23 Aug 2024 11:51:03 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-kernel@vger.kernel.org,
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Shresth Prasad <shresthprasad7@gmail.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, kernel@collabora.com,
 Steven Liu <steven.liu@rock-chips.com>
Subject: Re: [PATCH v4 4/4] pinctrl: rockchip: Add rk3576 pinctrl support
Date: Fri, 23 Aug 2024 11:51:44 +0200
Message-ID: <13267245.EVyyLHbfrO@diego>
In-Reply-To: <20240822195706.920567-5-detlev.casanova@collabora.com>
References:
 <20240822195706.920567-1-detlev.casanova@collabora.com>
 <20240822195706.920567-5-detlev.casanova@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Am Donnerstag, 22. August 2024, 21:53:39 CEST schrieb Detlev Casanova:
> From: Steven Liu <steven.liu@rock-chips.com>
> 
> Add support for the 5 rk3576 GPIO banks.
> 
> Signed-off-by: Steven Liu <steven.liu@rock-chips.com>
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>

everything looks pretty standard now :-)

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

> ---
>  drivers/pinctrl/pinctrl-rockchip.c | 207 +++++++++++++++++++++++++++++
>  drivers/pinctrl/pinctrl-rockchip.h |   1 +
>  2 files changed, 208 insertions(+)
> 
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index 0eacaf10c640..914b27b5838d 100644
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
> +			reg += 0x1ff4; /* GPIO0_IOC_GPIO0B_IOMUX_SEL_H */
> +	}
> +
>  	if (ctrl->type == RK3588) {
>  		if (bank->bank_num == 0) {
>  			if ((pin >= RK_PB4) && (pin <= RK_PD7)) {
> @@ -1234,6 +1260,11 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
>  	if (bank->recalced_mask & BIT(pin))
>  		rockchip_get_recalced_mux(bank, pin, &reg, &bit, &mask);
>  
> +	if (ctrl->type == RK3576) {
> +		if ((bank->bank_num == 0) && (pin >= RK_PB4) && (pin <= RK_PB7))
> +			reg += 0x1ff4; /* GPIO0_IOC_GPIO0B_IOMUX_SEL_H */
> +	}
> +
>  	if (ctrl->type == RK3588) {
>  		if (bank->bank_num == 0) {
>  			if ((pin >= RK_PB4) && (pin <= RK_PD7)) {
> @@ -2038,6 +2069,142 @@ static int rk3568_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
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
> @@ -2332,6 +2499,10 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
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
> @@ -2469,6 +2640,7 @@ static int rockchip_get_pull(struct rockchip_pin_bank *bank, int pin_num)
>  	case RK3368:
>  	case RK3399:
>  	case RK3568:
> +	case RK3576:
>  	case RK3588:
>  		pull_type = bank->pull_type[pin_num / 8];
>  		data >>= bit;
> @@ -2528,6 +2700,7 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
>  	case RK3368:
>  	case RK3399:
>  	case RK3568:
> +	case RK3576:
>  	case RK3588:
>  		pull_type = bank->pull_type[pin_num / 8];
>  		ret = -EINVAL;
> @@ -2793,6 +2966,7 @@ static bool rockchip_pinconf_pull_valid(struct rockchip_pin_ctrl *ctrl,
>  	case RK3368:
>  	case RK3399:
>  	case RK3568:
> +	case RK3576:
>  	case RK3588:
>  		return (pull != PIN_CONFIG_BIAS_PULL_PIN_DEFAULT);
>  	}
> @@ -3949,6 +4123,37 @@ static struct rockchip_pin_ctrl rk3568_pin_ctrl = {
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
> @@ -4005,6 +4210,8 @@ static const struct of_device_id rockchip_pinctrl_dt_match[] = {
>  		.data = &rk3399_pin_ctrl },
>  	{ .compatible = "rockchip,rk3568-pinctrl",
>  		.data = &rk3568_pin_ctrl },
> +	{ .compatible = "rockchip,rk3576-pinctrl",
> +		.data = &rk3576_pin_ctrl },
>  	{ .compatible = "rockchip,rk3588-pinctrl",
>  		.data = &rk3588_pin_ctrl },
>  	{},
> diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
> index 849266f8b191..6ebbb0a88ce7 100644
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
> 





