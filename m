Return-Path: <linux-gpio+bounces-22760-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BA2AF81C9
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 22:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 856EB1C867CF
	for <lists+linux-gpio@lfdr.de>; Thu,  3 Jul 2025 20:13:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8626C29B799;
	Thu,  3 Jul 2025 20:13:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="hkIgnWSg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B15829B793;
	Thu,  3 Jul 2025 20:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751573610; cv=none; b=YNuO21Jm4+ZUltfp20+J6Js+nT1OP33KEbfJT9Cqo2slq2LvK7HUlrCsevLgMKYXF7qH7AeR7mjBo+KA/X/fYciNro4Ga5WWllb08ceJkr72o20o4Y2E+JzPAkqQms3u1189RorPRyyrLlZ5d/nas3NRUKlJoOALj/mr+7CEK+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751573610; c=relaxed/simple;
	bh=LCq9a4cW34CaPZRstxuZfpIVgSnBOhPtBk1dbm0I8bU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=oCNc7ynLBaGfO0LOzNC1QfQ3rHdeaLx9lN4Q7DoXnXVOHs7M0coKUG7upvB2zv3bzZkVoat/royjBX3gT3Y+0cTb9DZGwS+5L9wDPzp4iodcLhORMCzdKkpeTS7Sl/t7SbYNJ9Hag0RKYNc/5EiM0dnxTpmQ9BWtBvLWYXw6yO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=hkIgnWSg; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 563KD7u13987265;
	Thu, 3 Jul 2025 15:13:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751573587;
	bh=mXAWnDKvBYL51tefBXkeube2AWz+vgQ8k8NXyfLv/1E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=hkIgnWSgpoFemRx1hGlG8IvHbpbDhzhzSngNR8bzQF9OcpVH6N2rL/ZpJ+/8Rmrhh
	 Bk+3ufEzw3PucLLc0c6f2zmsmayzsxX94CEb9I0AFs0Fo2KDfmIrMx3BDZnPHJXPER
	 aXVVLduEgqepA89DvYrGEMDJNPjhB/0qX+q7aORk=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 563KD6Rt676131
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Thu, 3 Jul 2025 15:13:07 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Thu, 3
 Jul 2025 15:13:06 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Thu, 3 Jul 2025 15:13:06 -0500
Received: from [128.247.29.251] (dmz007xyy.dhcp.ti.com [128.247.29.251])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 563KD6to1412802;
	Thu, 3 Jul 2025 15:13:06 -0500
Message-ID: <95783fa1-017e-46cf-b135-7a797a7f5edd@ti.com>
Date: Thu, 3 Jul 2025 15:13:06 -0500
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/2] gpio: tps65219: Add support for TI TPS65214 PMIC
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, <aaro.koskinen@iki.fi>,
        <andreas@kemnade.info>, <khilman@baylibre.com>, <rogerq@kernel.org>,
        <tony@atomide.com>, <linus.walleij@linaro.org>, <brgl@bgdev.pl>,
        <linux-omap@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>
CC: <m-leonard@ti.com>, <praneeth@ti.com>, <jcormier@criticallink.com>
References: <20250703180751.168755-1-s-ramamoorthy@ti.com>
 <20250703180751.168755-3-s-ramamoorthy@ti.com>
 <780d9307-4c47-4772-b527-bfd94486b931@wanadoo.fr>
Content-Language: en-US
From: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Organization: PMIC
In-Reply-To: <780d9307-4c47-4772-b527-bfd94486b931@wanadoo.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea


On 7/3/25 2:05 PM, Christophe JAILLET wrote:
> Le 03/07/2025 à 20:07, Shree Ramamoorthy a écrit :
>> Add support for the TI TPS65214 PMIC with the addition of an id_table,
>> separate TPS65214 template_chip, and device-specific _change_direction
>> functions.
>>
>> - Use platform_get_device_id() to assign dev-specific information.
>> - Use different change_direction() functions since TPS65214's GPIO
>>    configuration bits are changeable during device operation through bit
>>    GPIO_CONFIG in GENERAL_CONFIG register.
>> - Remove MODULE_ALIAS since it is now generated by MODULE_DEVICE_TABLE.
>>
>> Reviewed-by: Jonathan Cormier <jcormier@criticallink.com>
>> Tested-by: Jonathan Cormier <jcormier@criticallink.com>
>> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
>> ---
>
> ...
>
>> +static int tps65214_gpio_change_direction(struct gpio_chip *gc, 
>> unsigned int offset,
>> +                      unsigned int direction)
>> +{
>> +    struct tps65219_gpio *gpio = gpiochip_get_data(gc);
>> +    struct device *dev = gpio->tps->dev;
>> +    int val, ret;
>> +
>> +    /* Verified if GPIO or GPO in parent function
>
> Nitpick: should the /* be on a separate line?
>
Will fix this.

>> +     * Masked value: 0 = GPIO, 1 = VSEL
>> +     */
>> +    ret = regmap_read(gpio->tps->regmap, TPS65219_REG_MFP_1_CONFIG, 
>> &val);
>> +    if (ret)
>> +        return ret;
>> +
>> +    ret = !!(val & BIT(TPS65219_GPIO0_DIR_MASK));
>> +    if (ret)
>> +        dev_err(dev, "GPIO%d configured as VSEL, not GPIO\n", offset);
>> +
>> +    ret = regmap_update_bits(gpio->tps->regmap, 
>> TPS65219_REG_GENERAL_CONFIG,
>> +                 TPS65214_GPIO0_DIR_MASK, direction);
>> +    if (ret)
>> +        dev_err(dev,
>> +            "Fail to change direction to %u for GPIO%d.\n",
>
> Nitpick: keep it on the previous line?

Will update this as well.

>
>> +            direction, offset);
>> +
>> +    return ret;
>> +}
>
> ...
>
>> +static const struct gpio_chip tps65214_template_chip = {
>> +    .label            = "tps65214-gpio",
>> +    .owner            = THIS_MODULE,
>> +    .get_direction        = tps65214_gpio_get_direction,
>> +    .direction_input    = tps65219_gpio_direction_input,
>> +    .direction_output    = tps65219_gpio_direction_output,
>> +    .get            = tps65219_gpio_get,
>> +    .set_rv            = tps65219_gpio_set,
>> +    .base            = -1,
>> +    .ngpio            = 2,
>> +    .can_sleep        = true,
>> +};
>> +
>>   static const struct gpio_chip tps65219_template_chip = {
>>       .label            = "tps65219-gpio",
>>       .owner            = THIS_MODULE,
>> @@ -154,7 +218,7 @@ static const struct gpio_chip 
>> tps65219_template_chip = {
>>       .direction_input    = tps65219_gpio_direction_input,
>>       .direction_output    = tps65219_gpio_direction_output,
>>       .get            = tps65219_gpio_get,
>> -    .set            = tps65219_gpio_set,
>> +    .set_rv            = tps65219_gpio_set,
>
> Is this correct? Does it even compile?
> tps65219_gpio_set() returns void and .set_rv() expects a return value.
>
> (same for tps65214_template_chip above)

I sent this out too quickly, will add in the corresponding return values & re-test. Thanks for reviewing!

>
>>       .base            = -1,
>>       .ngpio            = 3,
>>       .can_sleep        = true,
>
> ...
>
> CJ

-- 
Best,
Shree Ramamoorthy
PMIC Software Engineer


