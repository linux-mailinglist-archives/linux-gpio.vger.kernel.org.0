Return-Path: <linux-gpio+bounces-14542-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6EAA02EFC
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 18:30:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A81581885D28
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 17:31:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 708181C5F11;
	Mon,  6 Jan 2025 17:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="yLBX9tmX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D311547F3;
	Mon,  6 Jan 2025 17:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736184655; cv=none; b=Lb+w3iq4bjY4hak6UKuEQi0st80DMvGMFGtMjJFd7ljUFxNnE7NGetM7naiLE4xOzpHWd6tE3ZawVGp5QIKIwUBbgQvDDmrT/tUWBRPWb/QF9eRB5edPVq/SX+P5mXOvS+r6VhdxAvlwVA+wG8lgR/VseZg3WOEC8zmpooQJNHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736184655; c=relaxed/simple;
	bh=KaukF65UEMxAuZYUcY6U0PzBhJcP+/JFuwNB+HihAT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=JyTsLXwjf/Oa8GqM8ezU8yCPzUjPCWuqV8UCkOdXwqZLnfvT53vktBB4Jtcf3LK3207glJ6jboqStOw9LhDvTkUkbK4ymmpLXCM0mdz8Erw3//ZD1cLkMH+fS+Un3L5bBWaCu/KOlBI4hfcVAgPG94wI4ELagSs32VOfYWI6u64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=yLBX9tmX; arc=none smtp.client-ip=198.47.23.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 506HUShI2518076
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Jan 2025 11:30:28 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736184628;
	bh=+ADsFbmXzYhXfwhFh120dXVuucmxz048jM6qEiJ7Cbw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=yLBX9tmXzumsfuB+DuhDzR8Y8rVecEZ8GaXHKDpfhPpEfXCb5+R8F4/KAqtKceiKx
	 118J8DRBsGEzGGrhCtDsaiPYtxVv+VZQNLvc+so8dz6xLb6BZ9hcmplrPPJBI41b2N
	 rBfLn0RoA+RdvEavnss5WbnThqCY7f5rhu7v937A=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 506HUSSt002820
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 Jan 2025 11:30:28 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 6
 Jan 2025 11:30:28 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 6 Jan 2025 11:30:27 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 506HURa0028759;
	Mon, 6 Jan 2025 11:30:27 -0600
Message-ID: <eddc0ba3-1023-4bad-88df-de17c28877e4@ti.com>
Date: Mon, 6 Jan 2025 11:30:27 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] gpio: tps65215: Add TPS65215 to platform_device_id
 table
To: Roger Quadros <rogerq@kernel.org>,
        Shree Ramamoorthy
	<s-ramamoorthy@ti.com>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <tony@atomide.com>,
        <linus.walleij@linaro.org>, <brgl@bgdev.pl>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
References: <20250103225407.196068-1-s-ramamoorthy@ti.com>
 <20250103225407.196068-2-s-ramamoorthy@ti.com>
 <707925ce-b76e-470a-921f-7ac165a04d69@kernel.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <707925ce-b76e-470a-921f-7ac165a04d69@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 1/4/25 12:21 PM, Roger Quadros wrote:
> 
> 
> On 04/01/2025 00:54, Shree Ramamoorthy wrote:
>> Add platform_device_id struct and use the platform_get_device_id() output
>> to match which PMIC device is in use. With new name options, the gpio_chip
>> .label field is now assigned to the platform_device name match.
>>
>> Remove MODULE_ALIAS since it is now generated by MODULE_DEVICE_TABLE.
>>
>> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
>> ---
>>   drivers/gpio/gpio-tps65219.c | 17 ++++++++++++-----
>>   1 file changed, 12 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-tps65219.c b/drivers/gpio/gpio-tps65219.c
>> index 526640c39a11..7e03be0c7c92 100644
>> --- a/drivers/gpio/gpio-tps65219.c
>> +++ b/drivers/gpio/gpio-tps65219.c
>> @@ -1,8 +1,8 @@
>>   // SPDX-License-Identifier: GPL-2.0
>>   /*
>> - * GPIO driver for TI TPS65219 PMICs
>> + * GPIO driver for TI TPS65215/TPS65219 PMICs
>>    *
>> - * Copyright (C) 2022 Texas Instruments Incorporated - http://www.ti.com/
>> + * Copyright (C) 2024 Texas Instruments Incorporated - http://www.ti.com/
>>    */
>>   
>>   #include <linux/bits.h>
>> @@ -141,7 +141,6 @@ static int tps65219_gpio_direction_output(struct gpio_chip *gc, unsigned int off
>>   }
>>   
>>   static const struct gpio_chip tps65219_template_chip = {
>> -	.label			= "tps65219-gpio",
>>   	.owner			= THIS_MODULE,
>>   	.get_direction		= tps65219_gpio_get_direction,
>>   	.direction_input	= tps65219_gpio_direction_input,
>> @@ -164,20 +163,28 @@ static int tps65219_gpio_probe(struct platform_device *pdev)
>>   
>>   	gpio->tps = tps;
>>   	gpio->gpio_chip = tps65219_template_chip;
>> +	gpio->gpio_chip.label = dev_name(&pdev->dev);
>>   	gpio->gpio_chip.parent = tps->dev;
>>   
>>   	return devm_gpiochip_add_data(&pdev->dev, &gpio->gpio_chip, gpio);
>>   }
>>   
>> +static const struct platform_device_id tps6521x_gpio_id_table[] = {
>> +	{ "tps65215-gpio", TPS65215 },
>> +	{ "tps65219-gpio", TPS65219 },
>> +	{ }
>> +};
>> +MODULE_DEVICE_TABLE(platform, tps6521x_gpio_id_table);
>> +
>>   static struct platform_driver tps65219_gpio_driver = {
>>   	.driver = {
>>   		.name = "tps65219-gpio",
>>   	},
>>   	.probe = tps65219_gpio_probe,
>> +	.id_table = tps6521x_gpio_id_table,
>>   };
>>   module_platform_driver(tps65219_gpio_driver);
>>   
>> -MODULE_ALIAS("platform:tps65219-gpio");
> 
> Why do you drop the MODULE_ALIAS?
> You can add multiple MODULE_ALIASES if needed.
> 

The new MODULE_DEVICE_TABLE() above causes all the needed
module aliases to be made for us automatically.

>>   MODULE_AUTHOR("Jonathan Cormier <jcormier@criticallink.com>");
>> -MODULE_DESCRIPTION("TPS65219 GPIO driver");
>> +MODULE_DESCRIPTION("TPS65215/TPS65219 GPIO driver");
> 
> "TPS6521x GPIO driver"?
> 
> I also see a product named TPS65216.
> By any chance can that be also supported by this driver?
> 

That is kinda the issue with "x" in the name, TPS65216 might
need a different driver, in which case the x here would mislead
folks into thinking this driver covers the whole family.

Andrew

>>   MODULE_LICENSE("GPL");
> 

