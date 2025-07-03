Return-Path: <linux-gpio+bounces-22758-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB1CAF8129
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 21:15:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BB0724E1AA9
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 19:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 170E02F2C7D;
	Thu,  3 Jul 2025 19:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="aLJoApOJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-81.smtpout.orange.fr [80.12.242.81])
	(using TLSv1.2 with cipher AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA5B2F2347;
	Thu,  3 Jul 2025 19:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751570108; cv=none; b=QldXQG7cldBSChFgfuAeetA+kf7vRvJdERXYCrt82PGfi6G3m6bBoTawXRaj1PjSwOBV1ckBI4PYPQas7XR3U2aOVQrWOsnMctEiULi/MvBu85dGfOWMQb4159573j2ILo7svh/xykTG93xjb5yS1D7tDSgylfKym9DF5h5kw7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751570108; c=relaxed/simple;
	bh=quFgesJQX765rdt1fi6yptGzSszZVEQ2BE38W+7Yywk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LRdQT+Uwt9HSPGLGyRq/V+XuhewYQyCrABRGuwpUHDj02S/uYb0+DnvEuAsaOm5gsOjOVSJE4LVkoFxBFrUGWunKxVGd/fdAl4ObF4sVrBKjsdNMPObss1KoE1n/E2XWpFiNGVtH0gtf2r9N6ugVRr1rYuxFbh1ecFqo/47ble4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=aLJoApOJ; arc=none smtp.client-ip=80.12.242.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
 ([IPv6:2a01:cb10:785:b00:8347:f260:7456:7662])
	by smtp.orange.fr with ESMTPA
	id XPFcu2Q1bTY5mXPFcuUi59; Thu, 03 Jul 2025 21:05:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1751569542;
	bh=T8p3xjVqVI/tRIrpOi6EWSLUaRRZHSg1oPB+NKQ4tT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=aLJoApOJfC6omuYxSn1+vmUuNYrypDQEEoM3f0OWfzxsEmISQXjGij2N/4M/lTk0Q
	 ao6hbI0J8bKuSOPE5uugku/f2A0kkYpCKLoNGs9h16IQP5nBFrpM5JiICj3cG3cvM1
	 iDf1ayrJfEl2uUf1nXDei44tw2J6mN6znK1izNLqzvQ5qv9arDZT9ot7GMWHHRqwlf
	 CuxtpEc9CLimno2lpDsfnfnmpqjJDnpkDyFZZdaP4iApk+DDjJUEfmBRr6b7MY0zEc
	 iONE+jOJ8VKAE2RmDD7OfcXl1MzjwS81N5R0M3ARiXTypkO0hIHFG0Y9jGvMEmaRap
	 XrC8SDkAA+u6g==
X-ME-Helo: [IPV6:2a01:cb10:785:b00:8347:f260:7456:7662]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 03 Jul 2025 21:05:42 +0200
X-ME-IP: 2a01:cb10:785:b00:8347:f260:7456:7662
Message-ID: <780d9307-4c47-4772-b527-bfd94486b931@wanadoo.fr>
Date: Thu, 3 Jul 2025 21:05:40 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] gpio: tps65219: Add support for TI TPS65214 PMIC
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>, aaro.koskinen@iki.fi,
 andreas@kemnade.info, khilman@baylibre.com, rogerq@kernel.org,
 tony@atomide.com, linus.walleij@linaro.org, brgl@bgdev.pl,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Cc: m-leonard@ti.com, praneeth@ti.com, jcormier@criticallink.com
References: <20250703180751.168755-1-s-ramamoorthy@ti.com>
 <20250703180751.168755-3-s-ramamoorthy@ti.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250703180751.168755-3-s-ramamoorthy@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 03/07/2025 à 20:07, Shree Ramamoorthy a écrit :
> Add support for the TI TPS65214 PMIC with the addition of an id_table,
> separate TPS65214 template_chip, and device-specific _change_direction
> functions.
> 
> - Use platform_get_device_id() to assign dev-specific information.
> - Use different change_direction() functions since TPS65214's GPIO
>    configuration bits are changeable during device operation through bit
>    GPIO_CONFIG in GENERAL_CONFIG register.
> - Remove MODULE_ALIAS since it is now generated by MODULE_DEVICE_TABLE.
> 
> Reviewed-by: Jonathan Cormier <jcormier@criticallink.com>
> Tested-by: Jonathan Cormier <jcormier@criticallink.com>
> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
> ---

...

> +static int tps65214_gpio_change_direction(struct gpio_chip *gc, unsigned int offset,
> +					  unsigned int direction)
> +{
> +	struct tps65219_gpio *gpio = gpiochip_get_data(gc);
> +	struct device *dev = gpio->tps->dev;
> +	int val, ret;
> +
> +	/* Verified if GPIO or GPO in parent function

Nitpick: should the /* be on a separate line?

> +	 * Masked value: 0 = GPIO, 1 = VSEL
> +	 */
> +	ret = regmap_read(gpio->tps->regmap, TPS65219_REG_MFP_1_CONFIG, &val);
> +	if (ret)
> +		return ret;
> +
> +	ret = !!(val & BIT(TPS65219_GPIO0_DIR_MASK));
> +	if (ret)
> +		dev_err(dev, "GPIO%d configured as VSEL, not GPIO\n", offset);
> +
> +	ret = regmap_update_bits(gpio->tps->regmap, TPS65219_REG_GENERAL_CONFIG,
> +				 TPS65214_GPIO0_DIR_MASK, direction);
> +	if (ret)
> +		dev_err(dev,
> +			"Fail to change direction to %u for GPIO%d.\n",

Nitpick: keep it on the previous line?

> +			direction, offset);
> +
> +	return ret;
> +}

...

> +static const struct gpio_chip tps65214_template_chip = {
> +	.label			= "tps65214-gpio",
> +	.owner			= THIS_MODULE,
> +	.get_direction		= tps65214_gpio_get_direction,
> +	.direction_input	= tps65219_gpio_direction_input,
> +	.direction_output	= tps65219_gpio_direction_output,
> +	.get			= tps65219_gpio_get,
> +	.set_rv			= tps65219_gpio_set,
> +	.base			= -1,
> +	.ngpio			= 2,
> +	.can_sleep		= true,
> +};
> +
>   static const struct gpio_chip tps65219_template_chip = {
>   	.label			= "tps65219-gpio",
>   	.owner			= THIS_MODULE,
> @@ -154,7 +218,7 @@ static const struct gpio_chip tps65219_template_chip = {
>   	.direction_input	= tps65219_gpio_direction_input,
>   	.direction_output	= tps65219_gpio_direction_output,
>   	.get			= tps65219_gpio_get,
> -	.set			= tps65219_gpio_set,
> +	.set_rv			= tps65219_gpio_set,

Is this correct? Does it even compile?
tps65219_gpio_set() returns void and .set_rv() expects a return value.

(same for tps65214_template_chip above)

>   	.base			= -1,
>   	.ngpio			= 3,
>   	.can_sleep		= true,

...

CJ

