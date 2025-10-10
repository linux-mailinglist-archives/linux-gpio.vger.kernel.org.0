Return-Path: <linux-gpio+bounces-26974-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A62BBCCD61
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 14:09:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A6FB24E8C71
	for <lists+linux-gpio@lfdr.de>; Fri, 10 Oct 2025 12:09:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C70172ED174;
	Fri, 10 Oct 2025 12:09:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BDgROrDJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77120288CA3
	for <linux-gpio@vger.kernel.org>; Fri, 10 Oct 2025 12:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760098153; cv=none; b=bEa6MZqW8UO2a3bT5cIWzekJDWzDT912HGpBGqdJYn/XLPhxUjZa0+Ep2gvYuwwsmEmj1eTSDOSfnP9yCLcQDFejtADQhbVdV8BKHhr1wtfzbzMK0qT0xhOo3Zf8NYC9Nl8/TloU1ay6953T1YJAzl+D9EEsJSnNj5qRKouo2P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760098153; c=relaxed/simple;
	bh=s9qnktjcv8VtwzZYiATpyxkv376jOmaSks+JF/0i/yY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fTOuKd8NPp9LCwbWYcQrh0xv0I5jeF4XxwB8J2FtQKAqrR/mIYyIlvvQXpFbxB8rr4ufwT5CIL1MTMM2G5ds/p+/Hy2czgimL6V4RqtoYaNqaX5b0CHIjKR/jxW/fm/8PnVa3x824qQlNlp27vAuO77zM1Jl0+UM1fdZ2yzJG1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BDgROrDJ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-57f1b88354eso2173346e87.1
        for <linux-gpio@vger.kernel.org>; Fri, 10 Oct 2025 05:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760098149; x=1760702949; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G4ZKKJF1rgzzv66FdFdHNcRihXsO8tluLNbeNizMoJ0=;
        b=BDgROrDJCwQLBWwJMnmyPI9kmMOnBhP3p+7BnpJgZFRfRd0hn/HcnNQSxPUIWQxbgm
         FRRzAOlZQVCirsVD6TP5nK9RXUEl0BNDK3w9BUwrrJTjKP/j5/HbNz3xIthLbe/vkgcd
         2XQHpMgMcxsolJA6rQ7adMQWC6zA3pNBLe+rrBGWK6vtSkztG1b8emBhATglNijni+R8
         zFPVmllzVWL6L9GJvboZRyg5WUKOaQ3lyJkfQVOgXyM4qDn55wRGD080qsfUjOeTj5em
         vF6+8dMFFJRBKAKGu1Kop2HJ7scmYesnNH0XaFliYnnQ55eXdJR1lcAnhX35mSb+C710
         VgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760098149; x=1760702949;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G4ZKKJF1rgzzv66FdFdHNcRihXsO8tluLNbeNizMoJ0=;
        b=tX9On3MVv8S2ZBkzK1natx/2U79UnhmUcm9zls/NZvQlqdTfnvnyZowxPDLyX//LJc
         vl/7Vhr7enjgHJs5qxW9IM+SeSHNSiq/gyFqd4kA0IAf/KzjTDvN2JtSIu9OV2mU+djS
         lbPDKOAK3N0cc/EjYZhHQvq9jX0hWY3xm7f0EZ1JyJ/FjYY5XCYvTWghzim9heW/yfEx
         b3lncH6+x1V/Tw7EFRGpUczzVFArJnv57QdBkkRa5i239F5q+SzOvlFSAsp3LSpDbW8i
         z6VPUzBukMm0Nzh+05t262q3ZKbrqXm0+LCI3uIwcMcpWl7JrfVkB5/7FAArpsrhLHzh
         jVRQ==
X-Forwarded-Encrypted: i=1; AJvYcCUalvdsDiK2btKfarzxJd1XZhgmvKbifVu5geEM158fBN+Kgy1oL8ldYIhvCYcYU4dLkdkkTIOGuCEc@vger.kernel.org
X-Gm-Message-State: AOJu0YxyQlbeKIc8NlEcSasiqP/oBuF+0V9lZrbZQFaXjR8ZnEoIOnvx
	yCwiraGsMFuCIYWRGO1RwXbmFZTgU5+tzr0vgOrFAT2rflhdptVczkek
X-Gm-Gg: ASbGnctaFZcjL1BfMGPwpWbHOvU+ydU+/spJaH8e0U/qdKFROFeD0NMcSydtrqFRCP0
	4JOKlTDZIRKq4ypLYfa2L8VeBSfpudZMs/xZB+v4gERkLpT1My1EL+Re+oqw/rW1cFZ2iCBOh/d
	suL94D/KPPvBvKtjnUJg8qmlT7ZzMHwwP8mjlvoQzgv7mzu92UzUn4dhsznpqefVnaXHxLJDEe8
	+P+HdCDNHiOYGMCYy/2z3wxzZaDaQIVFpKfJWQbgugxKfC2R/sB6/pwOKxDJckySvKZ3yZCxvaj
	JHqL7eEEAhMoVtEKz+waUbOJYpni1AQiN2q88bWOZyRITgt3qXn46eMsEK2HQJLodq9mMmb6S2R
	MZl13XAPoOdbGaZAMWE6JZB6dxURUxN0BhPdEc2+wwEor2O8hUZsR4rH3+wbys5ZFryPmcPFBf6
	NMNQSF7q6na6BgmGN4k1oyQaH1auxEu63WSg==
X-Google-Smtp-Source: AGHT+IH3knEaO7uQwDSiykr6b7dNy3NcVzjxL7nST2lJTVdnkH3+ref73CXvsxpJUFDrDoKyyQ0hew==
X-Received: by 2002:a05:651c:435c:20b0:376:3a83:428d with SMTP id 38308e7fff4ca-3763a8353e9mr2470301fa.48.1760098149101;
        Fri, 10 Oct 2025 05:09:09 -0700 (PDT)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59088577836sm820546e87.100.2025.10.10.05.09.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Oct 2025 05:09:08 -0700 (PDT)
Message-ID: <8ea507eb-f78c-4a16-882b-112e277fa1b6@gmail.com>
Date: Fri, 10 Oct 2025 15:09:07 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 06/13] mfd: bd71828: Support ROHM BD72720
To: Lee Jones <lee@kernel.org>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Andreas Kemnade <andreas@kemnade.info>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <cover.1759824376.git.mazziesaccount@gmail.com>
 <93142a80d90a0ac80b27090d0c83914675aad94d.1759824376.git.mazziesaccount@gmail.com>
 <20251009161847.GE2890766@google.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20251009161847.GE2890766@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi deee Ho Lee,

And Thanks for the review!

On 09/10/2025 19:18, Lee Jones wrote:
> On Tue, 07 Oct 2025, Matti Vaittinen wrote:
> 
>> The ROHM BD72720 is a power management IC which continues the BD71828
>> family of PMICs. Similarly to the BD71815 and BD71828, the BD72720
>> integrates regulators, charger, RTC, clock gate and GPIOs.
>>
>> The main difference to the earlier PMICs is that the BD72720 has two
>> different I2C slave addresses. In addition to the registers behind the
>> 'main I2C address', most of the charger (and to some extent LED) control
>> is done via registers behind a 'secondary I2C slave address', 0x4c.
>>
>> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
>>
>> ---
>> Note: This patch depends on the series: "power: supply: add charger for
>> BD71828" by Andreas:
>> https://lore.kernel.org/all/20250918-bd71828-charger-v5-0-851164839c28@kemnade.info/
>>
>> There are some new variants being planned. Most notably, the BD73900
>> should be almost identical to the BD72720 - for everything else except
>> the charger block.
>> ---

// snip

>> +
>> +static struct regmap *bd72720_secondary_regmap;
> 
> Dynamically allocate this and add it to .platform_data once it's
> populated.
> 

This can be done but I suppose it's unnecessary churn. This driver does 
not (at the moment) support more than one instance of the PMIC anyways. 
(The button data is not alloacted).

This is not really a problem as typically there is only 1 of these PMICs 
to be controlled.

// snip

>>   
>> +/*
>> + * The BD72720 is an odd beast in that it contains two separate sets of
>> + * registers, both starting from address 0x0. The twist is that these "pages"
>> + * are behind different I2C slave addresses. Most of the registers are behind
>> + * a slave address 0x4b, which will be used as the "main" address for this
>> + * device.
>> + * Most of the charger related registers are located behind slave address 0x4c.
>> + * It is tempting to push the dealing with the charger registers and the extra
>> + * 0x4c device in power-supply driver - but perhaps it's better for the sake of
>> + * the cleaner re-use to deal with setting up all of the regmaps here.
>> + * Furthermore, the LED stuff may need access to both of these devices.
>> + */
>> +#define BD72720_SECONDARY_I2C_SLAVE 0x4c
>> +static const struct regmap_range bd72720_volatile_ranges_4b[] = {
>> +	{
>> +		/* RESETSRC1 and 2 are write '1' to clear */
>> +		.range_min = BD72720_REG_RESETSRC_1,
>> +		.range_max = BD72720_REG_RESETSRC_2,
> 
> regmap_reg_range()?

Ah, thanks. Out of the curiosity - do you know why this macro is written 
on lowercase?

// snip
>> +static int bd72720_set_type_config(unsigned int **buf, unsigned int type,
>> +				   const struct regmap_irq *irq_data,
>> +				   int idx, void *irq_drv_data)
>> +{
>> +	const struct regmap_irq_type *t = &irq_data->type;
>> +
>> +	/*
>> +	 * The regmap IRQ ecpects IRQ_TYPE_EDGE_BOTH to be written to register
>> +	 * as logical OR of the type_falling_val and type_rising_val. This is
>> +	 * not how the BD72720 implements this configuration, hence we need
>> +	 * to handle this specific case separately.
>> +	 */
>> +	if (type == IRQ_TYPE_EDGE_BOTH) {
>> +		buf[0][idx] &= ~t->type_reg_mask;
>> +		buf[0][idx] |= BD72720_GPIO_IRQ_TYPE_BOTH;
>> +
>> +		return 0;
>> +	}
>> +
>> +	return regmap_irq_set_type_config_simple(buf, type, irq_data, idx,
>> +						 irq_drv_data);
> 
> Use 100-chars to avoid these pointless wraps please.

gnarl. I think we have discussed this before :)
I would love to keep the lines short - closer to 80 chars - because that 
way I can fit 3 terminals on my screen. All the years spent staring at 
the monitor are taking their toll, and my vision isn't as good as it 
used to be. Frightening thing being that it seems I will only need to 
increase the font in the future :/

Well, sure the lines can be split if you feel strongly about it - but I 
have a real reason (other than the usual - "they have always been like 
that") to try keep them short...

>> +}
>> +
>>   static const struct regmap_irq_chip bd71828_irq_chip = {
>>   	.name = "bd71828_irq",
>>   	.main_status = BD71828_REG_INT_MAIN,
>> @@ -465,6 +814,28 @@ static const struct regmap_irq_chip bd71815_irq_chip = {
>>   	.irq_reg_stride = 1,
>>   };
>>   
>> +static const unsigned int bd72720_irq_type_base = BD72720_REG_GPIO1_CTRL;
> 
> This makes it look like a global variable, which I am allergic to.
> 
> Perhaps make it clear that this is a single element static array instead.

Ok. Just a comment will do?

>> +static const struct regmap_irq_chip bd72720_irq_chip = {
>> +	.name = "bd72720_irq",
>> +	.main_status = BD72720_REG_INT_LVL1_STAT,
>> +	.irqs = &bd72720_irqs[0],
>> +	.num_irqs = ARRAY_SIZE(bd72720_irqs),
>> +	.status_base = BD72720_REG_INT_PS1_STAT,
>> +	.unmask_base = BD72720_REG_INT_PS1_EN,
>> +	.config_base = &bd72720_irq_type_base,
>> +	.num_config_bases = 1,
>> +	.num_config_regs = 2,
>> +	.set_type_config = bd72720_set_type_config,
>> +	.ack_base = BD72720_REG_INT_PS1_STAT,
>> +	.init_ack_masked = true,
>> +	.num_regs = 12,
>> +	.num_main_regs = 1,
>> +	.sub_reg_offsets = &bd72720_sub_irq_offsets[0],
>> +	.num_main_status_bits = 8,
>> +	.irq_reg_stride = 1,
>> +};
>> +
>>   static int set_clk_mode(struct device *dev, struct regmap *regmap,
>>   			int clkmode_reg)
>>   {
>> @@ -511,6 +882,25 @@ static void bd71828_remove_poweroff(void *data)
>>   	pm_power_off = NULL;
>>   }
>>   
>> +static int bd72720_get_secondary_regmap(struct i2c_client *i2c,
> 
> Does this 'secondary' have a specific purpose or a better name?

I am not entirely sure. When I asked this from the designers they just 
told me that they needed more than 255 registers so they added another 
slave address... (I'm not sure what would have been wrong with using a 
page register). So, I assume they just placed stuff that didn't fit in 
first 255 register there. But yeah, it looks like most of the registers 
there are related to the charger. So, perhaps it isn't completely 
misleading to use "charger regmap"? The data-sheet seems to be just 
using "Register map 1" and "Register map 2" in the tables listing these 
registers. I kind of like using something which maps easily to the 
data-sheet, but I really have no strong opinion on this.

>> +					const struct mfd_cell *mfd, int cells)
>> +{

// snip

>> diff --git a/include/linux/mfd/rohm-bd72720.h b/include/linux/mfd/rohm-bd72720.h
>> new file mode 100644
>> index 000000000000..856a6962b1b2
>> --- /dev/null
>> +++ b/include/linux/mfd/rohm-bd72720.h
>> @@ -0,0 +1,632 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +/*
>> + * Copyright 2024 ROHM Semiconductors.
> 
> Seems odd to introduce a new file with an old date.

I originally wrote this last year :) I can it update though. Thanks.

> 
>> + *
>> + * Author: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
>> + */
>> +
>> +#ifndef _MFD_BD72720_H
>> +#define _MFD_BD72720_H
>> +
>> +#include <linux/regmap.h>
>> +
>> +enum {
>> +	BD72720_BUCK1,
>> +	BD72720_BUCK2,
>> +	BD72720_BUCK3,
>> +	BD72720_BUCK4,
>> +	BD72720_BUCK5,
>> +	BD72720_BUCK6,
>> +	BD72720_BUCK7,
>> +	BD72720_BUCK8,
>> +	BD72720_BUCK9,
>> +	BD72720_BUCK10,
>> +	BD72720_BUCK11,
>> +	BD72720_LDO1,
>> +	BD72720_LDO2,
>> +	BD72720_LDO3,
>> +	BD72720_LDO4,
>> +	BD72720_LDO5,
>> +	BD72720_LDO6,
>> +	BD72720_LDO7,
>> +	BD72720_LDO8,
>> +	BD72720_LDO9,
>> +	BD72720_LDO10,
>> +	BD72720_LDO11,
>> +	BD72720_REGULATOR_AMOUNT,
>> +};
>> +
>> +/* BD72720 interrupts */
>> +#define BD72720_INT_LONGPUSH_MASK BIT(0)
> 
> Tab out the values please.

Ok, sure.

Ps.
I do really appreciate you going through RFCs :) Kudos!

Yours,
	-- Matti


