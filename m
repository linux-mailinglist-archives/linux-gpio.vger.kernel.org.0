Return-Path: <linux-gpio+bounces-31516-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EBlNAQaiWlW2gQAu9opvQ
	(envelope-from <linux-gpio+bounces-31516-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Feb 2026 00:19:32 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF7B10A968
	for <lists+linux-gpio@lfdr.de>; Mon, 09 Feb 2026 00:19:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 876D030015B8
	for <lists+linux-gpio@lfdr.de>; Sun,  8 Feb 2026 23:19:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A4F937BE71;
	Sun,  8 Feb 2026 23:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="hXn9oCmS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A58C4086A
	for <linux-gpio@vger.kernel.org>; Sun,  8 Feb 2026 23:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=121.127.44.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770592765; cv=none; b=l8pUi9s4k+Ool3DUX9G6fKdz87RShUoBNE/sf/zcAx3Qo2xo2Y+7lqA+84F/XRBh/YiYCAy5i5QFtWZTWFW7uTjkAJztvSVIO0JHCToEXFTmb7zVuQm211sbO6C5Rs3qa+9D2UGauigceeV+QfUA/7bj8eWpTwxT4GXpG4SDf8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770592765; c=relaxed/simple;
	bh=LRnuii2POXaY3gBTjCueGtwzVUhtQ2N1aQfKbUvIdys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AFgdQ6orMxDdtU8jhQW7R1qkZ0U0pSPDmlZuq7dyqUb8toaBusoA9n4bqWLc99L2N5RPLheCUGuz4m/UOs9rv6gpzI03R+HN3/nHIc9rcxSrga+jpXVTQUBbMrqS1MVZTwndB+/dmkrs6wsHGTrkgtQ8+RN/ITRuuqvZRSztSqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=hXn9oCmS; arc=none smtp.client-ip=121.127.44.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1770592758;
 bh=6DVcU5BMCxLiztutJKgnnqr8rLk1m/R23lPUOG4D52A=;
 b=hXn9oCmSEWeCMKPZnJqi88oBDTHRMweaLz+CtF+F/bB1cD+13Fgv8dlJPT65Rs3+wIYMcOduD
 RJ/XaXh8MCqjGFIdr2bgFFN2CEkc8qsb7By90ZIQ8k/LbfdX7KhskuAK+bqrKTUPnbMp3SmTECj
 tStism7Wa6d46pCWcswY8ZeYJg8RWMJKwMGdbk1X5OM1qrGNSdxELVBKmTz71P/NLErEgkNk7t+
 UOMoDn6vClxGR56v8kUFa51MRY1rU8H5XbqLP1EYG/RC+BHGUL6eucZ3aJKyDch4WeVuI4BZUyf
 0vUZ/KmiAUkayq5/yeDBT4JLrebfZB85z8DDgw2DQlEg==
X-Forward-Email-ID: 698919f1a6487c2810b1e73c
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.6.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <b2990fff-1b93-4a6a-9bfb-fae71ae72a33@kwiboo.se>
Date: Mon, 9 Feb 2026 00:19:10 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: rockchip: Add RV1103B pinctrl support
To: Fabio Estevam <festevam@gmail.com>
Cc: linusw@kernel.org, heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Fabio Estevam <festevam@nabladev.com>
References: <20260207130642.2833312-1-festevam@gmail.com>
 <20260207130642.2833312-2-festevam@gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260207130642.2833312-2-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kwiboo.se,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kwiboo.se:s=fe-e1b5cab7be];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-31516-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.977];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jonas@kwiboo.se,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kwiboo.se:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EAF7B10A968
X-Rspamd-Action: no action

Hi Fabio,

On 2/7/2026 2:06 PM, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@nabladev.com>
> 
> Add pinctrl support for the RV1103B.
> 
> Based on the 5.10 Rockchip vendor kernel driver.
> 
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> ---
> Changes since v1:
>  - None.
>  
>  drivers/pinctrl/pinctrl-rockchip.c | 313 ++++++++++++++++++++++++++++-
>  drivers/pinctrl/pinctrl-rockchip.h |   1 +
>  2 files changed, 313 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index 2fc67aeafdb3..092ce4cac9cf 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -467,6 +467,22 @@ static const struct pinctrl_ops rockchip_pctrl_ops = {
>   * Hardware access
>   */
>  
> +static struct rockchip_mux_recalced_data rv1103b_mux_recalced_data[] = {
> +	{
> +		.num = 1,
> +		.pin = 6,
> +		.reg = 0x10024,
> +		.bit = 8,
> +		.mask = 0xf
> +	}, {
> +		.num = 1,
> +		.pin = 7,
> +		.reg = 0x10024,
> +		.bit = 12,
> +		.mask = 0xf
> +	},
> +};
> +
>  static struct rockchip_mux_recalced_data rv1108_mux_recalced_data[] = {
>  	{
>  		.num = 1,
> @@ -1172,6 +1188,9 @@ static int rockchip_get_mux(struct rockchip_pin_bank *bank, int pin)
>  	else
>  		regmap = info->regmap_base;
>  
> +	if (ctrl->type == RV1103B && bank->bank_num == 2 && pin >= 12)
> +		return 0;

There should not be any need for this special handling here, please use
e.g. IOMUX_UNROUTED or IOMUX_GPIO_ONLY flags for the gpio2 bank.

It also only looks like up to 12 or 13 pins are usable/routed so that
should also be properly described in the bank info.

> +
>  	if (ctrl->type == RK3506) {
>  		if (bank->bank_num == 1)
>  			regmap = info->regmap_ioc1;
> @@ -1298,6 +1317,9 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
>  	else
>  		regmap = info->regmap_base;
>  
> +	if (ctrl->type == RV1103B && bank->bank_num == 2 && pin >= 12)
> +		return 0;

Same here, existing flags and/or limit the number of pins exposed for
the bank.

> +
>  	if (ctrl->type == RK3506) {
>  		if (bank->bank_num == 1)
>  			regmap = info->regmap_ioc1;
> @@ -1495,6 +1517,214 @@ static int px30_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
>  	return 0;
>  }
>  
> +#define RV1103B_DRV_BITS_PER_PIN		8
> +#define RV1103B_DRV_PINS_PER_REG		2
> +#define RV1103B_DRV_GPIO0_A_OFFSET		0x40100
> +#define RV1103B_DRV_GPIO0_B_OFFSET		0x50110
> +#define RV1103B_DRV_GPIO1_A01_OFFSET		0x140
> +#define RV1103B_DRV_GPIO1_A67_OFFSET		0x1014C
> +#define RV1103B_DRV_GPIO2_OFFSET		0x30180
> +#define RV1103B_DRV_GPIO2_SARADC_OFFSET		0x3080C
> +
> +static int rv1103b_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
> +				       int pin_num, struct regmap **regmap,
> +				       int *reg, u8 *bit)
> +{
> +	struct rockchip_pinctrl *info = bank->drvdata;
> +	int ret = 0;
> +
> +	*regmap = info->regmap_base;
> +	switch (bank->bank_num) {
> +	case 0:
> +		if (pin_num < 7)
> +			*reg = RV1103B_DRV_GPIO0_A_OFFSET;
> +		else if (pin_num > 7 && pin_num < 14)
> +			*reg = RV1103B_DRV_GPIO0_B_OFFSET - 0x10;

Why define a constant and then substract another constant from it?

> +		else
> +			ret = -EINVAL;
> +		break;
> +
> +	case 1:
> +		if (pin_num < 6)
> +			*reg = RV1103B_DRV_GPIO1_A01_OFFSET;
> +		else if (pin_num >= 6 && pin_num < 23)
> +			*reg = RV1103B_DRV_GPIO1_A67_OFFSET - 0xc;
> +		else if (pin_num >= 24 && pin_num < 30)
> +			*reg = RV1103B_DRV_GPIO1_A67_OFFSET - 0xc;
> +		else
> +			ret = -EINVAL;

The bank should probably only report up to 29 pins?

> +		break;
> +
> +	case 2:
> +		if (pin_num < 12) {
> +			*reg = RV1103B_DRV_GPIO2_OFFSET;
> +		} else if (pin_num >= 16) {
> +			ret = -EINVAL;

Similar here, gpio2 only seem to support up to 16 pins.

> +		} else {
> +			*reg = RV1103B_DRV_GPIO2_SARADC_OFFSET;
> +			*bit = 10;
> +
> +			return 0;
> +		}
> +		break;
> +
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	if (ret) {
> +		dev_err(info->dev, "unsupported bank_num %d pin_num %d\n", bank->bank_num, pin_num);
> +
> +		return ret;
> +	}
> +
> +	*reg += ((pin_num / RV1103B_DRV_PINS_PER_REG) * 4);
> +	*bit = pin_num % RV1103B_DRV_PINS_PER_REG;
> +	*bit *= RV1103B_DRV_BITS_PER_PIN;
> +
> +	return 0;
> +}
> +
> +#define RV1103B_PULL_BITS_PER_PIN		2
> +#define RV1103B_PULL_PINS_PER_REG		8
> +#define RV1103B_PULL_GPIO0_A_OFFSET		0x40200
> +#define RV1103B_PULL_GPIO0_B_OFFSET		0x50204
> +#define RV1103B_PULL_GPIO1_A01_OFFSET		0x210
> +#define RV1103B_PULL_GPIO1_A67_OFFSET		0x10210
> +#define RV1103B_PULL_GPIO2_OFFSET		0x30220
> +#define RV1103B_PULL_GPIO2_SARADC_OFFSET	0x3080C
> +
> +static int rv1103b_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
> +					int pin_num, struct regmap **regmap,
> +					int *reg, u8 *bit)
> +{
> +	struct rockchip_pinctrl *info = bank->drvdata;
> +	int ret = 0;
> +
> +	*regmap = info->regmap_base;
> +	switch (bank->bank_num) {
> +	case 0:
> +		if (pin_num < 7)
> +			*reg = RV1103B_PULL_GPIO0_A_OFFSET;
> +		else if (pin_num > 7 && pin_num < 14)
> +			*reg = RV1103B_PULL_GPIO0_B_OFFSET - 0x4;
> +		else
> +			ret = -EINVAL;
> +		break;
> +
> +	case 1:
> +		if (pin_num < 6)
> +			*reg = RV1103B_PULL_GPIO1_A01_OFFSET;
> +		else if (pin_num >= 6 && pin_num < 23)
> +			*reg = RV1103B_PULL_GPIO1_A67_OFFSET;
> +		else if (pin_num >= 24 && pin_num < 30)
> +			*reg = RV1103B_PULL_GPIO1_A67_OFFSET;
> +		else
> +			ret = -EINVAL;
> +		break;
> +
> +	case 2:
> +		if (pin_num < 12) {
> +			*reg = RV1103B_PULL_GPIO2_OFFSET;
> +		} else if (pin_num >= 16) {
> +			ret = -EINVAL;
> +		} else {
> +			*reg = RV1103B_PULL_GPIO2_SARADC_OFFSET;
> +			*bit = 13;
> +
> +			return 0;
> +		}
> +		break;
> +
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	if (ret) {
> +		dev_err(info->dev, "unsupported bank_num %d pin_num %d\n", bank->bank_num, pin_num);
> +
> +		return ret;
> +	}
> +
> +	*reg += ((pin_num / RV1103B_PULL_PINS_PER_REG) * 4);
> +	*bit = pin_num % RV1103B_PULL_PINS_PER_REG;
> +	*bit *= RV1103B_PULL_BITS_PER_PIN;
> +
> +	return 0;
> +}
> +
> +#define RV1103B_SMT_BITS_PER_PIN		1
> +#define RV1103B_SMT_PINS_PER_REG		8
> +#define RV1103B_SMT_GPIO0_A_OFFSET		0x40400
> +#define RV1103B_SMT_GPIO0_B_OFFSET		0x50404
> +#define RV1103B_SMT_GPIO1_A01_OFFSET		0x410
> +#define RV1103B_SMT_GPIO1_A67_OFFSET		0x10410
> +#define RV1103B_SMT_GPIO2_OFFSET		0x30420
> +#define RV1103B_SMT_GPIO2_SARADC_OFFSET		0x3080C
> +
> +static int rv1103b_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
> +					   int pin_num,
> +					   struct regmap **regmap,
> +					   int *reg, u8 *bit)
> +{
> +	struct rockchip_pinctrl *info = bank->drvdata;
> +	int ret = 0;
> +
> +	*regmap = info->regmap_base;
> +	switch (bank->bank_num) {
> +	case 0:
> +		if (pin_num < 7)
> +			*reg = RV1103B_SMT_GPIO0_A_OFFSET;
> +		else if (pin_num > 7 && pin_num < 14)
> +			*reg = RV1103B_SMT_GPIO0_B_OFFSET - 0x4;
> +		else
> +			ret = -EINVAL;
> +		break;
> +
> +	case 1:
> +		if (pin_num < 6)
> +			*reg = RV1103B_SMT_GPIO1_A01_OFFSET;
> +		else if (pin_num >= 6 && pin_num < 23)
> +			*reg = RV1103B_SMT_GPIO1_A67_OFFSET;
> +		else if (pin_num >= 24 && pin_num < 30)
> +			*reg = RV1103B_SMT_GPIO1_A67_OFFSET;
> +		else
> +			ret = -EINVAL;
> +		break;
> +
> +	case 2:
> +		if (pin_num < 12) {
> +			*reg = RV1103B_SMT_GPIO2_OFFSET;
> +		} else if (pin_num >= 16) {
> +			ret = -EINVAL;
> +		} else {
> +			*reg = RV1103B_SMT_GPIO2_SARADC_OFFSET;
> +			*bit = 8;
> +
> +			return 0;
> +		}
> +		break;
> +
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	if (ret) {
> +		dev_err(info->dev, "unsupported bank_num %d pin_num %d\n", bank->bank_num, pin_num);
> +
> +		return ret;
> +	}
> +
> +	*reg += ((pin_num / RV1103B_SMT_PINS_PER_REG) * 4);
> +	*bit = pin_num % RV1103B_SMT_PINS_PER_REG;
> +	*bit *= RV1103B_SMT_BITS_PER_PIN;
> +
> +	return 0;
> +}
> +
>  #define RV1108_PULL_PMU_OFFSET		0x10
>  #define RV1108_PULL_OFFSET		0x110
>  #define RV1108_PULL_PINS_PER_REG	8
> @@ -2982,6 +3212,9 @@ static int rockchip_get_drive_perpin(struct rockchip_pin_bank *bank,
>  	u8 bit;
>  	int drv_type = bank->drv[pin_num / 8].drv_type;
>  
> +	if (ctrl->type == RV1103B && pin_num >= 12)
> +		drv_type = DRV_TYPE_IO_LEVEL_2_BIT;

Why is this not properly handled with correct drv_type

> +
>  	ret = ctrl->drv_calc_reg(bank, pin_num, &regmap, &reg, &bit);
>  	if (ret)
>  		return ret;
> @@ -3043,6 +3276,11 @@ static int rockchip_get_drive_perpin(struct rockchip_pin_bank *bank,
>  	if (ret)
>  		return ret;
>  
> +	if (ctrl->type == RV1103B && bank->bank_num == 2 && pin_num >= 12) {
> +		data = data >> 10;
> +		return data & 0x3;

This is only for gpio2 pin 12 and 13 if I read code correct.

Maybe using drv_calc_reg ops and possible a new DRV_TYPE flag could
remove all the soc-specific hacks/workarounds?

> +	}
> +
>  	data >>= bit;
>  	data &= (1 << rmask_bits) - 1;
>  
> @@ -3071,7 +3309,8 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
>  		rmask_bits = RK3588_DRV_BITS_PER_PIN;
>  		ret = strength;
>  		goto config;
> -	} else if (ctrl->type == RK3506 ||
> +	} else if (ctrl->type == RV1103B ||
> +		   ctrl->type == RK3506 ||
>  		   ctrl->type == RK3528 ||
>  		   ctrl->type == RK3562 ||
>  		   ctrl->type == RK3568) {
> @@ -3182,6 +3421,12 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
>  			ret = strength;
>  		}
>  	}
> +
> +	if (ctrl->type == RV1103B && bank->bank_num == 2 && pin_num >= 12) {
> +		rmask_bits = 2;
> +		ret = strength;
> +	}
> +
>  	/* enable the write to the equivalent lower bits */
>  	data = ((1 << rmask_bits) - 1) << (bit + 16);
>  	rmask = data | (data >> 16);
> @@ -3236,6 +3481,7 @@ static int rockchip_get_pull(struct rockchip_pin_bank *bank, int pin_num)
>  				? PIN_CONFIG_BIAS_PULL_PIN_DEFAULT
>  				: PIN_CONFIG_BIAS_DISABLE;
>  	case PX30:
> +	case RV1103B:
>  	case RV1108:
>  	case RK3188:
>  	case RK3288:
> @@ -3251,6 +3497,9 @@ static int rockchip_get_pull(struct rockchip_pin_bank *bank, int pin_num)
>  		pull_type = bank->pull_type[pin_num / 8];
>  		data >>= bit;
>  		data &= (1 << RK3188_PULL_BITS_PER_PIN) - 1;
> +
> +		if (ctrl->type == RV1103B && bank->bank_num == 2 && pin_num >= 12)
> +			pull_type = 1;

Please include comment similar to below descibing why these pins differs.

>  		/*
>  		 * In the TRM, pull-up being 1 for everything except the GPIO0_D3-D6,
>  		 * where that pull up value becomes 3.
> @@ -3297,6 +3546,7 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
>  		ret = regmap_write(regmap, reg, data);
>  		break;
>  	case PX30:
> +	case RV1103B:
>  	case RV1108:
>  	case RV1126:
>  	case RK3188:
> @@ -3312,6 +3562,8 @@ static int rockchip_set_pull(struct rockchip_pin_bank *bank,
>  	case RK3576:
>  	case RK3588:
>  		pull_type = bank->pull_type[pin_num / 8];
> +		if (ctrl->type == RV1103B && bank->bank_num == 2 && pin_num >= 12)
> +			pull_type = 1;

Same here as the RK3568 workaround, please include a comment why this is
needed.

>  		ret = -EINVAL;
>  		for (i = 0; i < ARRAY_SIZE(rockchip_pull_list[pull_type]);
>  			i++) {
> @@ -3417,6 +3669,11 @@ static int rockchip_get_schmitt(struct rockchip_pin_bank *bank, int pin_num)
>  	if (ret)
>  		return ret;
>  
> +	if (ctrl->type == RV1103B && bank->bank_num == 2 && pin_num >= 12) {
> +		data >>= 8;
> +		return data & 0x3;

This workaround should probably be moved into the switch and use
schmitt_calc_reg ops to return correct bit=8.

> +	}
> +
>  	data >>= bit;
>  	switch (ctrl->type) {
>  	case RK3562:
> @@ -3473,6 +3730,12 @@ static int rockchip_set_schmitt(struct rockchip_pin_bank *bank,
>  		}
>  	}
>  
> +	if (ctrl->type == RV1103B && bank->bank_num == 2 && pin_num >= 12) {
> +		data = 0x3 << (bit + 16);
> +		rmask = data | (data >> 16);
> +		data |= ((enable ? 0x3 : 0) << bit);
> +	}

Similar here, please move to the switch.

Looks like there are some RK3506 code that also should be cleaned up
here :-)

> +
>  	return regmap_update_bits(regmap, reg, rmask, data);
>  }
>  
> @@ -3579,6 +3842,7 @@ static bool rockchip_pinconf_pull_valid(struct rockchip_pin_ctrl *ctrl,
>  	case RK3066B:
>  		return pull ? false : true;
>  	case PX30:
> +	case RV1103B:
>  	case RV1108:
>  	case RV1126:
>  	case RK3188:
> @@ -4319,6 +4583,51 @@ static struct rockchip_pin_ctrl px30_pin_ctrl = {
>  		.schmitt_calc_reg	= px30_calc_schmitt_reg_and_bit,
>  };
>  
> +static struct rockchip_pin_bank rv1103b_pin_banks[] = {
> +	PIN_BANK_IOMUX_FLAGS_OFFSET_DRV_FLAGS(0, 32, "gpio0",

The code above and the 32 here does not seem to match, how many pins are
routed? It does not seem to be more than 12-14.

> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    0x40000, 0x50008, 0x50010, 0x50018,
> +				    DRV_TYPE_IO_LEVEL_8_BIT,
> +				    DRV_TYPE_IO_LEVEL_8_BIT,
> +				    DRV_TYPE_IO_LEVEL_8_BIT,
> +				    DRV_TYPE_IO_LEVEL_8_BIT),
> +	PIN_BANK_IOMUX_FLAGS_OFFSET_DRV_FLAGS(1, 32, "gpio1",

Here it is possible all are routed but there are some checks for < 30
above.

> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    0x20, 0x10028, 0x10030, 0x10038,
> +				    DRV_TYPE_IO_LEVEL_8_BIT,
> +				    DRV_TYPE_IO_LEVEL_8_BIT,
> +				    DRV_TYPE_IO_LEVEL_8_BIT,
> +				    DRV_TYPE_IO_LEVEL_8_BIT),
> +	PIN_BANK_IOMUX_FLAGS_OFFSET_DRV_FLAGS(2, 32, "gpio2",

This should likely only be 16 pins.

Regards,
Jonas

> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    IOMUX_WIDTH_4BIT,
> +				    0x30040, 0x30048, 0x30050, 0x30058,
> +				    DRV_TYPE_IO_LEVEL_8_BIT,
> +				    DRV_TYPE_IO_LEVEL_8_BIT,
> +				    DRV_TYPE_IO_LEVEL_8_BIT,
> +				    DRV_TYPE_IO_LEVEL_8_BIT),
> +};
> +
> +static struct rockchip_pin_ctrl rv1103b_pin_ctrl __maybe_unused = {
> +	.pin_banks		= rv1103b_pin_banks,
> +	.nr_banks		= ARRAY_SIZE(rv1103b_pin_banks),
> +	.label			= "RV1103B-GPIO",
> +	.type			= RV1103B,
> +	.iomux_recalced		= rv1103b_mux_recalced_data,
> +	.niomux_recalced	= ARRAY_SIZE(rv1103b_mux_recalced_data),
> +	.pull_calc_reg		= rv1103b_calc_pull_reg_and_bit,
> +	.drv_calc_reg		= rv1103b_calc_drv_reg_and_bit,
> +	.schmitt_calc_reg	= rv1103b_calc_schmitt_reg_and_bit,
> +};
> +
>  static struct rockchip_pin_bank rv1108_pin_banks[] = {
>  	PIN_BANK_IOMUX_FLAGS(0, 32, "gpio0", IOMUX_SOURCE_PMU,
>  					     IOMUX_SOURCE_PMU,
> @@ -4955,6 +5264,8 @@ static struct rockchip_pin_ctrl rk3588_pin_ctrl = {
>  static const struct of_device_id rockchip_pinctrl_dt_match[] = {
>  	{ .compatible = "rockchip,px30-pinctrl",
>  		.data = &px30_pin_ctrl },
> +	{ .compatible = "rockchip,rv1103b-pinctrl",
> +		.data = &rv1103b_pin_ctrl },
>  	{ .compatible = "rockchip,rv1108-pinctrl",
>  		.data = &rv1108_pin_ctrl },
>  	{ .compatible = "rockchip,rv1126-pinctrl",
> diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
> index 4f4aff42a80a..bb0e803e3b8a 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.h
> +++ b/drivers/pinctrl/pinctrl-rockchip.h
> @@ -185,6 +185,7 @@
>  
>  enum rockchip_pinctrl_type {
>  	PX30,
> +	RV1103B,
>  	RV1108,
>  	RV1126,
>  	RK2928,


