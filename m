Return-Path: <linux-gpio+bounces-14549-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0B5A03246
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 22:50:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC4C71885DC2
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 21:50:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBC901E00AC;
	Mon,  6 Jan 2025 21:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="QtZtl8tp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6BE145A11;
	Mon,  6 Jan 2025 21:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.249
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736200208; cv=none; b=hFh5fRrthtgZ/f31qKQKd6Bwo+Xo1QgMZgio9xoo/Xh1uhCS21Oe4EZxEM0PBz8Eam+OWdNPB0hZjZfrZkEWdMjndl+Fxz+4ZlEpo1S+t3ozECTGitjyUfTX385OuM6ZObIv3LZEH7JMQi+miv6m1ZaP7VqeRfemMQfE2ZfcOn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736200208; c=relaxed/simple;
	bh=XOW72s4FUHoEbescdgyaVenvB/rQKCguEeedpDF6WTg=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=l/MAKjGTTAK/RDPpfXBv1/IqGBv1hYoJcoCia3Mt8pf6Ne9zbENfWJY9uur8UY5gU9QluH+SU/dCYdsrvy5QahpT7S2+Ld4WKC2HFGx0SQmwA8Li28PMCxesbyMz683s6TZTXG//KXcNKX1zPrPePdTRCgPzHZdAtP5+x1WD8Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=QtZtl8tp; arc=none smtp.client-ip=198.47.23.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 506Lndju094535;
	Mon, 6 Jan 2025 15:49:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1736200179;
	bh=q563fYULJ72FmkFCv4sufd3uD0Ub5PR3kVbBDaajo/4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=QtZtl8tpMZLXTFviSAhuUL5HYoExEAPEQhUo5LEGnzD1u/OQwRsizq+hq9bgDI8ES
	 o1okf658XDunlVEgdNz8XitGdFVBtlsNTN1ZWJDoXnTY+QkMduhAtd1Sm8KIcEHvtb
	 ahvOqscXK46FFuCFqInVVbrjH0fvxpUiUOwZtyHk=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 506LndiI003578
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 6 Jan 2025 15:49:39 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 6
 Jan 2025 15:49:39 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 6 Jan 2025 15:49:39 -0600
Received: from [10.250.35.198] ([10.250.35.198])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 506Lnc97035985;
	Mon, 6 Jan 2025 15:49:38 -0600
Message-ID: <d3db0f31-bfc6-465c-a4d6-1db71aed2cd6@ti.com>
Date: Mon, 6 Jan 2025 15:49:38 -0600
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] gpio tps65215: Add support for varying gpio/offset
 values
To: Roger Quadros <rogerq@kernel.org>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <tony@atomide.com>,
        <linus.walleij@linaro.org>, <brgl@bgdev.pl>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <christophe.jaillet@wanadoo.fr>
References: <20250103225407.196068-1-s-ramamoorthy@ti.com>
 <20250103225407.196068-4-s-ramamoorthy@ti.com>
 <a34f42fb-30e0-426b-8efe-9be0c0494fe7@kernel.org>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
In-Reply-To: <a34f42fb-30e0-426b-8efe-9be0c0494fe7@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hi,

On 1/4/2025 12:27 PM, Roger Quadros wrote:
>
> On 04/01/2025 00:54, Shree Ramamoorthy wrote:
>> Add device-specific structs to select the different PMIC .npgio and .offset
>> values. With the chip_data struct values selected based on the match data,
>> having a separate GPIO0_OFFSET macro is no longer needed.
>>
>> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
>> ---
>>  drivers/gpio/gpio-tps65219.c | 27 ++++++++++++++++++++++++---
>>  1 file changed, 24 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpio/gpio-tps65219.c b/drivers/gpio/gpio-tps65219.c
>> index 70a4410c473a..14286dd5fdfb 100644
>> --- a/drivers/gpio/gpio-tps65219.c
>> +++ b/drivers/gpio/gpio-tps65219.c
>> @@ -13,7 +13,6 @@
>>  #include <linux/regmap.h>
>>  
>>  #define TPS65219_GPIO0_DIR_MASK		BIT(3)
>> -#define TPS65219_GPIO0_OFFSET		2
>>  #define TPS6521X_GPIO0_IDX			0
>>  
>>  struct tps65219_gpio {
>> @@ -21,6 +20,11 @@ struct tps65219_gpio {
>>  	struct tps65219 *tps;
>>  };
>>  
>> +struct tps65219_chip_data {
>> +	int ngpio;
>> +	int offset;
>> +};
>> +
>>  static int tps65219_gpio_get_direction(struct gpio_chip *gc, unsigned int offset)
>>  {
>>  	struct tps65219_gpio *gpio = gpiochip_get_data(gc);
>> @@ -71,7 +75,7 @@ static void tps65219_gpio_set(struct gpio_chip *gc, unsigned int offset, int val
>>  	struct device *dev = gpio->tps->dev;
>>  	int v, mask, bit;
>>  
>> -	bit = (offset == TPS6521X_GPIO0_IDX) ? TPS65219_GPIO0_OFFSET : offset - 1;
>> +	bit = (offset == TPS6521X_GPIO0_IDX) ? (gpio->gpio_chip.ngpio - 1) : offset - 1;
> shouldn't this be
> 	bit = (offset == TPS6521X_GPIO0_IDX) ? (gpio->gpio_chip.offset - 1) : offset - 1;

Thank you for catching this! I have applied to the change for the next version sent out.

>>  
>>  	mask = BIT(bit);
>>  	v = value ? mask : 0;
>> @@ -148,14 +152,29 @@ static const struct gpio_chip tps65219_template_chip = {
>>  	.get			= tps65219_gpio_get,
>>  	.set			= tps65219_gpio_set,
>>  	.base			= -1,
>> -	.ngpio			= 3,
>>  	.can_sleep		= true,
>>  };
>>  
>> +static const struct tps65219_chip_data chip_info_table[] = {
>> +	[TPS65215] = {
>> +		.ngpio = 2,
>> +		.offset = 1,
>> +	},
>> +	[TPS65219] = {
>> +		.ngpio = 3,
>> +		.offset = 2,
>> +	},
>> +};
>> +
>>  static int tps65219_gpio_probe(struct platform_device *pdev)
>>  {
>>  	struct tps65219 *tps = dev_get_drvdata(pdev->dev.parent);
>>  	struct tps65219_gpio *gpio;
>> +	const struct tps65219_chip_data *pmic;
>> +
>> +	enum pmic_id chip = platform_get_device_id(pdev)->driver_data;
>> +
> unnecessary newline?
>
>> +	pmic = &chip_info_table[chip];
>>
> here too?

I have reorganized the above section to have the variable declarations separate
from the chunk of code assigning values. Thanks for reviewing!

>>  	gpio = devm_kzalloc(&pdev->dev, sizeof(*gpio), GFP_KERNEL);
>>  	if (!gpio)
>> @@ -164,6 +183,8 @@ static int tps65219_gpio_probe(struct platform_device *pdev)
>>  	gpio->tps = tps;
>>  	gpio->gpio_chip = tps65219_template_chip;
>>  	gpio->gpio_chip.label = dev_name(&pdev->dev);
>> +	gpio->gpio_chip.ngpio =  pmic->ngpio;
>> +	gpio->gpio_chip.offset = pmic->offset;
>>  	gpio->gpio_chip.parent = tps->dev;
>>  
>>  	return devm_gpiochip_add_data(&pdev->dev, &gpio->gpio_chip, gpio);

