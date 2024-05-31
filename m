Return-Path: <linux-gpio+bounces-7019-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 661C78D679A
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 19:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 186471F26869
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2024 17:04:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4726171644;
	Fri, 31 May 2024 17:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G71wsKMY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EED7770F3;
	Fri, 31 May 2024 17:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717175040; cv=none; b=kIe91jLmKgA/GnVlFAB+12GQC5Z48QGZ23XQJCvy6XH5UtQJXu4l8eHgVXimyBTegLOWRCkhmwhRK5HS5cWMWgxk6NgtTHsGLpXefGchSIw1aM5h5wVU0Cu6k9MPaJ5dKuj+JqroNlluqvXHBmVv2TwHnirr4At3GkMfqfjaepY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717175040; c=relaxed/simple;
	bh=0YvlLspqtLIryUdRJ9NcPOInVAGbrmGXs+zKX9/mp5U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O0TIHAYUjtF/NtgJyQkn+Umociz4DNUaItiXUPsfmqFTYkIOZAqc/3XL8hZnTdrkcWztaIYMdGg3OPol7cZmLy3ypuUiSqIcy1eXFd65gSH6qrltIZVGzge51S0VfuBiQWpWigM7/mXyuh6dwz8bJ1OTlnC/dVcnPC3//HOg/yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G71wsKMY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BFE4C116B1;
	Fri, 31 May 2024 17:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717175040;
	bh=0YvlLspqtLIryUdRJ9NcPOInVAGbrmGXs+zKX9/mp5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G71wsKMYMF/A3oTgEmvH6NnN+Si6Cay7mE1t+advWfGF9GaR5IVC756gEjUbDIrMH
	 yC2R+wd7saUIaPMyoc7grmg3o/sIn3t0BqHm4jtQW5Sm48D2i08oZ5rj3iMNHrbxeV
	 GRV+smQ2abOEJKv0PoM93MPRzam6sSp7S/USNp5zebrcFF+viQKUbh4f5epF1BSPWK
	 KrIkMYik7lVQ1CkTCGhwsR/+j1FuKUAHh1eo0M3d7JojvWS9Z4VgthfdahXoYo6mT4
	 fJJD0yWUXfkZELKoPK1QXg8N6rlZ1rfxTi5NUrm6aG+AFbro7+N2NU7mER6Z+BVhuZ
	 nbqxgFn7nO3sg==
Date: Fri, 31 May 2024 18:03:53 +0100
From: Lee Jones <lee@kernel.org>
To: Johan Hovold <johan+linaro@kernel.org>
Cc: Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 02/14] mfd: pm8008: fix regmap irq chip initialisation
Message-ID: <20240531170353.GB1204315@google.com>
References: <20240529162958.18081-1-johan+linaro@kernel.org>
 <20240529162958.18081-3-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240529162958.18081-3-johan+linaro@kernel.org>

On Wed, 29 May 2024, Johan Hovold wrote:

> The regmap irq array is potentially shared between multiple PMICs and
> should only contain static data.
> 
> Use a custom macro to initialise also the type fields and drop the
> unnecessary updates on each probe.
> 
> Fixes: 6b149f3310a4 ("mfd: pm8008: Add driver for QCOM PM8008 PMIC")
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/mfd/qcom-pm8008.c | 64 ++++++++++++++-------------------------
>  1 file changed, 23 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/mfd/qcom-pm8008.c b/drivers/mfd/qcom-pm8008.c
> index 3ac3742f438b..f71c490f25c8 100644
> --- a/drivers/mfd/qcom-pm8008.c
> +++ b/drivers/mfd/qcom-pm8008.c
> @@ -56,15 +56,25 @@ static unsigned int pm8008_config_regs[] = {
>  	INT_POL_LOW_OFFSET,
>  };
>  
> -static struct regmap_irq pm8008_irqs[] = {
> -	REGMAP_IRQ_REG(PM8008_IRQ_MISC_UVLO,	PM8008_MISC,	BIT(0)),
> -	REGMAP_IRQ_REG(PM8008_IRQ_MISC_OVLO,	PM8008_MISC,	BIT(1)),
> -	REGMAP_IRQ_REG(PM8008_IRQ_MISC_OTST2,	PM8008_MISC,	BIT(2)),
> -	REGMAP_IRQ_REG(PM8008_IRQ_MISC_OTST3,	PM8008_MISC,	BIT(3)),
> -	REGMAP_IRQ_REG(PM8008_IRQ_MISC_LDO_OCP,	PM8008_MISC,	BIT(4)),
> -	REGMAP_IRQ_REG(PM8008_IRQ_TEMP_ALARM,	PM8008_TEMP_ALARM, BIT(0)),
> -	REGMAP_IRQ_REG(PM8008_IRQ_GPIO1,	PM8008_GPIO1,	BIT(0)),
> -	REGMAP_IRQ_REG(PM8008_IRQ_GPIO2,	PM8008_GPIO2,	BIT(0)),
> +#define _IRQ(_irq, _off, _mask, _types)			\
> +	[_irq] = {					\
> +		.reg_offset = (_off),			\
> +		.mask = (_mask),			\
> +		.type = {				\
> +			.type_reg_offset = (_off),	\
> +			.types_supported = (_types),	\
> +		},					\
> +	}

Any reason why this can't be generic and be tucked away somewhere in a
header file?

> +static const struct regmap_irq pm8008_irqs[] = {
> +	_IRQ(PM8008_IRQ_MISC_UVLO,    PM8008_MISC,	BIT(0), IRQ_TYPE_EDGE_RISING),
> +	_IRQ(PM8008_IRQ_MISC_OVLO,    PM8008_MISC,	BIT(1), IRQ_TYPE_EDGE_RISING),
> +	_IRQ(PM8008_IRQ_MISC_OTST2,   PM8008_MISC,	BIT(2), IRQ_TYPE_EDGE_RISING),
> +	_IRQ(PM8008_IRQ_MISC_OTST3,   PM8008_MISC,	BIT(3), IRQ_TYPE_EDGE_RISING),
> +	_IRQ(PM8008_IRQ_MISC_LDO_OCP, PM8008_MISC,	BIT(4), IRQ_TYPE_EDGE_RISING),
> +	_IRQ(PM8008_IRQ_TEMP_ALARM,   PM8008_TEMP_ALARM,BIT(0), IRQ_TYPE_SENSE_MASK),
> +	_IRQ(PM8008_IRQ_GPIO1,	      PM8008_GPIO1,	BIT(0), IRQ_TYPE_SENSE_MASK),
> +	_IRQ(PM8008_IRQ_GPIO2,	      PM8008_GPIO2,	BIT(0), IRQ_TYPE_SENSE_MASK),
>  };
>  
>  static const unsigned int pm8008_periph_base[] = {
> @@ -143,38 +153,9 @@ static struct regmap_config qcom_mfd_regmap_cfg = {
>  	.max_register	= 0xFFFF,
>  };
>  
> -static int pm8008_probe_irq_peripherals(struct device *dev,
> -					struct regmap *regmap,
> -					int client_irq)
> -{
> -	int rc, i;
> -	struct regmap_irq_type *type;
> -	struct regmap_irq_chip_data *irq_data;
> -
> -	for (i = 0; i < ARRAY_SIZE(pm8008_irqs); i++) {
> -		type = &pm8008_irqs[i].type;
> -
> -		type->type_reg_offset = pm8008_irqs[i].reg_offset;
> -
> -		if (type->type_reg_offset == PM8008_MISC)
> -			type->types_supported = IRQ_TYPE_EDGE_RISING;
> -		else
> -			type->types_supported = (IRQ_TYPE_EDGE_BOTH |
> -				IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW);
> -	}
> -
> -	rc = devm_regmap_add_irq_chip(dev, regmap, client_irq,
> -			IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
> -	if (rc) {
> -		dev_err(dev, "Failed to add IRQ chip: %d\n", rc);
> -		return rc;
> -	}
> -
> -	return 0;
> -}
> -
>  static int pm8008_probe(struct i2c_client *client)
>  {
> +	struct regmap_irq_chip_data *irq_data;
>  	int rc;
>  	struct device *dev;
>  	struct regmap *regmap;
> @@ -187,9 +168,10 @@ static int pm8008_probe(struct i2c_client *client)
>  	i2c_set_clientdata(client, regmap);
>  
>  	if (of_property_read_bool(dev->of_node, "interrupt-controller")) {
> -		rc = pm8008_probe_irq_peripherals(dev, regmap, client->irq);
> +		rc = devm_regmap_add_irq_chip(dev, regmap, client->irq,
> +				IRQF_SHARED, 0, &pm8008_irq_chip, &irq_data);
>  		if (rc)
> -			dev_err(dev, "Failed to probe irq periphs: %d\n", rc);
> +			dev_err(dev, "failed to add IRQ chip: %d\n", rc);
>  	}
>  
>  	return devm_of_platform_populate(dev);
> -- 
> 2.44.1
> 

-- 
Lee Jones [李琼斯]

