Return-Path: <linux-gpio+bounces-13793-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEE89EDF1A
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 06:55:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3DF0F281305
	for <lists+linux-gpio@lfdr.de>; Thu, 12 Dec 2024 05:55:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6888817BB24;
	Thu, 12 Dec 2024 05:55:50 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E73029A9;
	Thu, 12 Dec 2024 05:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.61.185.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733982950; cv=none; b=KCr8nVzmnVI6FLh3Z/GW51YjtP7wXGaDHKGG6orgVqlQPQJIO8TUvYZvEhaawam5+snx8pFzSZgJWL6GAmL5FCwmIYlh4yySc6y5+tqELdmwl1YZP+gkIHquMRe8drJv2V1OG9TIBXiYEQjBKBBM6syRxBuPCMa3w30Ije3pNAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733982950; c=relaxed/simple;
	bh=8Hm8WTAi1BGNvi0XgxS76aT+5hmob1vXXruEwpEQJhc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ehg+tzibjn7bNcvBtwIGnQyWNyQh50eFPoqqw5Etw1pHkGWmRJJV4jN7WJm6dfKPnfpZiH6CCQl/kbgXgAn/Hrye7Raxj1s9B+GB2NrYxbyFl3ymzx4414TS+wc371UKcfnlGX/8YHxYLP9jTOyVcvvzC8X5vXejw4SCC7YgYQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=189.cn; spf=pass smtp.mailfrom=189.cn; arc=none smtp.client-ip=183.61.185.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=189.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=189.cn
HMM_SOURCE_IP:10.158.243.220:20240.1105431354
HMM_ATTACHE_NUM:0000
HMM_SOURCE_TYPE:SMTP
Received: from clientip-123.150.8.42 (unknown [10.158.243.220])
	by 189.cn (HERMES) with SMTP id D2F8A100226;
	Thu, 12 Dec 2024 13:55:36 +0800 (CST)
Received: from  ([123.150.8.42])
	by gateway-153622-dep-5c5f88b874-f78lq with ESMTP id dab4442a05624a978c395d98eac5cdb2 for brgl@bgdev.pl;
	Thu, 12 Dec 2024 13:55:36 CST
X-Transaction-ID: dab4442a05624a978c395d98eac5cdb2
X-Real-From: chensong_2000@189.cn
X-Receive-IP: 123.150.8.42
X-MEDUSA-Status: 0
Sender: chensong_2000@189.cn
Message-ID: <efade71b-76ce-4dfe-949e-b231b3e411f0@189.cn>
Date: Thu, 12 Dec 2024 13:55:35 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] regulator:s5m8767: Fully convert to GPIO descriptors
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: krzk@kernel.org, lgirdwood@gmail.com, broonie@kernel.org, lee@kernel.org,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-samsung-soc@vger.kernel.org
References: <20241211051019.176131-1-chensong_2000@189.cn>
 <CAMRc=MfpwuMh-MH1UEHKky09iAs4g9=iGFPptARXzoZrVS8hdQ@mail.gmail.com>
Content-Language: en-US
From: Song Chen <chensong_2000@189.cn>
In-Reply-To: <CAMRc=MfpwuMh-MH1UEHKky09iAs4g9=iGFPptARXzoZrVS8hdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



在 2024/12/11 21:51, Bartosz Golaszewski 写道:
> On Wed, Dec 11, 2024 at 6:10 AM Song Chen <chensong_2000@189.cn> wrote:
>>
>> This converts s5m8767 regulator driver to use GPIO descriptors.
>>
>> ---
>> v1 - v2:
>> 1, reedit commit message.
>> 2, remove development code.
>> 3, print error msg in dev_err_probe.
>> 4, doesn't set gpiod directions until successfully requesting
>>     all gpiods. It's pretty much equivalent with original code.
>>
>> Signed-off-by: Song Chen <chensong_2000@189.cn>
>> ---
>>   drivers/regulator/s5m8767.c      | 106 ++++++++++++++-----------------
>>   include/linux/mfd/samsung/core.h |   4 +-
>>   2 files changed, 48 insertions(+), 62 deletions(-)
>>
>> diff --git a/drivers/regulator/s5m8767.c b/drivers/regulator/s5m8767.c
>> index d25cd81e3f36..b23df037336b 100644
>> --- a/drivers/regulator/s5m8767.c
>> +++ b/drivers/regulator/s5m8767.c
>> @@ -5,7 +5,7 @@
>>
>>   #include <linux/cleanup.h>
>>   #include <linux/err.h>
>> -#include <linux/of_gpio.h>
>> +#include <linux/of.h>
>>   #include <linux/gpio/consumer.h>
>>   #include <linux/module.h>
>>   #include <linux/platform_device.h>
>> @@ -35,8 +35,8 @@ struct s5m8767_info {
>>          u8 buck2_vol[8];
>>          u8 buck3_vol[8];
>>          u8 buck4_vol[8];
>> -       int buck_gpios[3];
>> -       int buck_ds[3];
>> +       struct gpio_desc *buck_gpios[3];
>> +       struct gpio_desc *buck_ds[3];
>>          int buck_gpioindex;
>>   };
>>
>> @@ -272,9 +272,9 @@ static inline int s5m8767_set_high(struct s5m8767_info *s5m8767)
>>   {
>>          int temp_index = s5m8767->buck_gpioindex;
>>
>> -       gpio_set_value(s5m8767->buck_gpios[0], (temp_index >> 2) & 0x1);
>> -       gpio_set_value(s5m8767->buck_gpios[1], (temp_index >> 1) & 0x1);
>> -       gpio_set_value(s5m8767->buck_gpios[2], temp_index & 0x1);
>> +       gpiod_set_value(s5m8767->buck_gpios[0], (temp_index >> 2) & 0x1);
>> +       gpiod_set_value(s5m8767->buck_gpios[1], (temp_index >> 1) & 0x1);
>> +       gpiod_set_value(s5m8767->buck_gpios[2], temp_index & 0x1);
>>
> 
> It seems to me that these GPIOs are always manipulated at once. Maybe
> consider adding fwnode_gpiod_get_index_array() to GPIO core and using
> it here to shrink the code a bit more?
> 
> Bart
> 

If I understand you correctly, you mean introducing 
devm_fwnode_gpiod_get_index_array and in s5m8767_set_high calling 
gpiod_set_array_value to control s5m8767->buck_gpios.

That is a good point and i can give it a try, but i'm not sure if gpio 
maintainers like it, they are cautious to introduce new helpers.

Or we can use devm_gpiod_get_array, it's pretty much equivalent effect 
in s5m8767 even without fwnode specified.

Furthermore, speaking of shrinking code, i'm thinking about using a 
bitmap to replace buck2_gpiodvs, buck3_gpiodvs and buck4_gpiodvs,

below snippet can be optimized by this bitmap and __builtin_popcount.

     if (pdata->buck2_gpiodvs) {
         if (pdata->buck3_gpiodvs || pdata->buck4_gpiodvs) {
             dev_err(&pdev->dev, "S5M8767 GPIO DVS NOT VALID\n");
             return -EINVAL;
         }
     }

     if (pdata->buck3_gpiodvs) {
         if (pdata->buck2_gpiodvs || pdata->buck4_gpiodvs) {
             dev_err(&pdev->dev, "S5M8767 GPIO DVS NOT VALID\n");
             return -EINVAL;
         }
     }

     if (pdata->buck4_gpiodvs) {
         if (pdata->buck2_gpiodvs || pdata->buck3_gpiodvs) {
             dev_err(&pdev->dev, "S5M8767 GPIO DVS NOT VALID\n");
             return -EINVAL;
         }
     }

what do you think?

Best regards,

Song

