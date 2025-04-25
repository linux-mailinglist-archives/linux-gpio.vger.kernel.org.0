Return-Path: <linux-gpio+bounces-19329-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 574E4A9D5DB
	for <lists+linux-gpio@lfdr.de>; Sat, 26 Apr 2025 00:47:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC08092722F
	for <lists+linux-gpio@lfdr.de>; Fri, 25 Apr 2025 22:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0C412957D1;
	Fri, 25 Apr 2025 22:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Y0MRYNjx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC4D21E086;
	Fri, 25 Apr 2025 22:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745621251; cv=none; b=SyKpqygdafcKGHl3zg1giEJBP/Xz7lrUC4h0vCoLYz9tCQBhR/d0oFaJzoD4xCe81kL73v6GcR/liv6RUAO+qNfiqV0J9M697n/klHRwueJeh+ndxZ0Dv/ntRpVzGKcZNiAweP2ThzPmqIBCPxGfycxxera6I+g4YhkswN42cmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745621251; c=relaxed/simple;
	bh=iCPckNGlCDJnBU6/bcQd7B/IgIqbFWGF9SGWYCj64uo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=i+L0Z+L1pL/pzOdYcR4rRoE0kGab+CaJsR4u+1qT8UjaUUzVilMqhsodhOYzyXmUqo7xMqWk1Z8vFttiRhrSmToMCvFoJDmxOpcQ59aWiOh2EPzXLfjcnljeTUAEaex4UJxbyyNTVSlDelRAMvEZFw7ETfD8U+uhIGcyPxHhqyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Y0MRYNjx; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53PMlAVC3038686
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 25 Apr 2025 17:47:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745621230;
	bh=jjueoLTU8LQ1im3N7LQcZlHwiqmLoT++rzhGz/8/1ls=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=Y0MRYNjxr0LJ8hjuhLyWkWKwNLmdd82ZuU/DkaQXJWQO7w1gt4INJiJhsllFAk4RD
	 1h3dM2/4I9vN42RXrAA8tEE8V4GPl+XWL6F9VqS3WUVzpoFNufqkM46oSGfsqJUxpu
	 Sq0GSir8RxjibCyIlU65guZjNx0xUDuPJixwhUNg=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53PMlA0t007073
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 25 Apr 2025 17:47:10 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 25
 Apr 2025 17:47:10 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 25 Apr 2025 17:47:10 -0500
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53PMl91c073339;
	Fri, 25 Apr 2025 17:47:09 -0500
Message-ID: <313daa6d-c108-44d6-94b7-3b1005e2081c@ti.com>
Date: Fri, 25 Apr 2025 17:47:09 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] gpio: tps65219: Add TPS65215 to platform_device_id
 table
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <linus.walleij@linaro.org>, <brgl@bgdev.pl>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>
References: <20250425203315.71497-1-s-ramamoorthy@ti.com>
 <20250425203315.71497-2-s-ramamoorthy@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250425203315.71497-2-s-ramamoorthy@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 4/25/25 3:33 PM, Shree Ramamoorthy wrote:
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
> index 526640c39a11..996f8deaf03d 100644
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
> +	{ "tps65215-gpio", TPS65215 },

I would have added this TPS65215 item to this table in patch [3/3]
where it is first used, but that's nitpicking,

Reviewed-by: Andrew Davis <afd@ti.com>

> +	{ "tps65219-gpio", TPS65219 },
> +	{ /* sentinel */ }
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

