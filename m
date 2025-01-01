Return-Path: <linux-gpio+bounces-14386-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D74A59FF3B6
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jan 2025 11:49:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A44B0161B43
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jan 2025 10:49:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FC427DA66;
	Wed,  1 Jan 2025 10:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="dKuLzjDY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-77.smtpout.orange.fr [80.12.242.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB494C92;
	Wed,  1 Jan 2025 10:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735728582; cv=none; b=a+fJGNQqBnPjIEPYdg85qkcEk7sj7fd5ZRBlBPNCu3+bOI1vPIUiimDv8oMn7CmQIf2QPDOKxbMg5nPb9XyVb3TViS0qRuM/IUfw5NZ2E6kbbYfgg2uibvpVgoPaBKlnoV0Mo5QwX9sCyI6kNA4L3KVylA4D0+jOVfqp/KpAPR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735728582; c=relaxed/simple;
	bh=8caSlvBOROoHflR2xlL/1kmpHoDNA9EmC0obCTWlkHg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UebuF2evEXM0wcN13mQ3RCxf2scOS4gfRDrCj/z3hX9LoROyHnTHmbKXooyB8dB/gNyOoupKCd820Y/XlKrvTyDS3a5Aco4/cWGk2kiJdswO9G7u20IQIB+iau8jMIyK6k1IhMpY24FRW9PXU+qoFpsn+DSkoAK33lRw6+yUZS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=dKuLzjDY; arc=none smtp.client-ip=80.12.242.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id SwGvtbAkQJiySSwGzteN7D; Wed, 01 Jan 2025 11:48:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1735728504;
	bh=/TTVHBk4SlY8Q+CF0/mA75pGmScSjl/6QA6ZhVUOzHE=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=dKuLzjDYFiAtPLQnHXJQqE1K8pVCtbyIwSW1VKQJc6my4pxWBKoX7TC+uKkCcgw7F
	 1PjEdfskGWum7i9zGMTRmGqP/sQcbZ5ViHgdXD8CeLT9MggIAnM2ZX6p3mIqnmvFNA
	 fljPiqGACqLHxc68oXpWIBBFAAVsHIOKXUiYBpI2wrhpa1zqECS4e7V7JR2HS8iGJU
	 HbZ3ZDwlLc5TSPrQOQYT9NlXRT7L5NWMyJlypp+0+oJN8CnuZlLxFyrjUr4hfCeCn1
	 509PAG0KAdFJdEgOBJWXGWGHJuNMKhBBtvfwEy1At0p5PEzympQZMdX3NZ5ZocAjz+
	 56MA6QKXsASNA==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Wed, 01 Jan 2025 11:48:24 +0100
X-ME-IP: 90.11.132.44
Message-ID: <0f7c0363-2b65-4d46-b83d-17ca8d07474b@wanadoo.fr>
Date: Wed, 1 Jan 2025 11:48:15 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] gpio: tps65215: Add TPS65215 to platform_device_id
 table
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>, aaro.koskinen@iki.fi,
 andreas@kemnade.info, khilman@baylibre.com, rogerq@kernel.org,
 tony@atomide.com, linus.walleij@linaro.org, brgl@bgdev.pl,
 linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
Cc: m-leonard@ti.com, praneeth@ti.com
Newsgroups: gmane.linux.kernel.gpio,gmane.linux.ports.arm.omap,gmane.linux.kernel
References: <20241226215858.397054-1-s-ramamoorthy@ti.com>
 <20241226215858.397054-2-s-ramamoorthy@ti.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20241226215858.397054-2-s-ramamoorthy@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 26/12/2024 à 22:58, Shree Ramamoorthy a écrit :
> Add platform_device_id struct and use the platform_get_device_id() output
> to match which PMIC device is in use. With new name options, the gpio_chip
> .label field is now assigned to the platform_device name match.
> 
> Remove MODULE_ALIAS since it is now generated by MODULE_DEVICE_TABLE.
> 
> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
> ---
>   drivers/gpio/gpio-tps65219.c | 17 ++++++++++++-----
>   1 file changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpio/gpio-tps65219.c b/drivers/gpio/gpio-tps65219.c
> index 526640c39a11..8508c8f320d0 100644
> --- a/drivers/gpio/gpio-tps65219.c
> +++ b/drivers/gpio/gpio-tps65219.c
> @@ -1,8 +1,8 @@
>   // SPDX-License-Identifier: GPL-2.0
>   /*
> - * GPIO driver for TI TPS65219 PMICs
> + * GPIO driver for TI TPS65215/TPS65219 PMICs
>    *
> - * Copyright (C) 2022 Texas Instruments Incorporated - http://www.ti.com/
> + * Copyright (C) 2024 Texas Instruments Incorporated - http://www.ti.com/
>    */
>   
>   #include <linux/bits.h>
> @@ -141,7 +141,6 @@ static int tps65219_gpio_direction_output(struct gpio_chip *gc, unsigned int off
>   }
>   
>   static const struct gpio_chip tps65219_template_chip = {
> -	.label			= "tps65219-gpio",
>   	.owner			= THIS_MODULE,
>   	.get_direction		= tps65219_gpio_get_direction,
>   	.direction_input	= tps65219_gpio_direction_input,
> @@ -164,20 +163,28 @@ static int tps65219_gpio_probe(struct platform_device *pdev)
>   
>   	gpio->tps = tps;
>   	gpio->gpio_chip = tps65219_template_chip;
> +	gpio->gpio_chip.label = dev_name(&pdev->dev);
>   	gpio->gpio_chip.parent = tps->dev;
>   
>   	return devm_gpiochip_add_data(&pdev->dev, &gpio->gpio_chip, gpio);
>   }
>   
> +static const struct platform_device_id tps6521x_gpio_id_table[] = {
> +	{ "tps65219-gpio", TPS65219 },
> +	{ "tps65215-gpio", TPS65215 },

Maybe, keep alphabetical order? TPS65215, then TPS65219.

> +	{ },

No need for ending comma after a terminator.

CJ

> +};
> +MODULE_DEVICE_TABLE(platform, tps6521x_gpio_id_table);
> +
>   static struct platform_driver tps65219_gpio_driver = {
>   	.driver = {
>   		.name = "tps65219-gpio",
>   	},
>   	.probe = tps65219_gpio_probe,
> +	.id_table = tps6521x_gpio_id_table,
>   };
>   module_platform_driver(tps65219_gpio_driver);
>   
> -MODULE_ALIAS("platform:tps65219-gpio");
>   MODULE_AUTHOR("Jonathan Cormier <jcormier@criticallink.com>");
> -MODULE_DESCRIPTION("TPS65219 GPIO driver");
> +MODULE_DESCRIPTION("TPS65215/TPS65219 GPIO driver");
>   MODULE_LICENSE("GPL");


