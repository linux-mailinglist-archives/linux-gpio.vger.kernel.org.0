Return-Path: <linux-gpio+bounces-13855-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4292E9F0984
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 11:31:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E82D188CAF6
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Dec 2024 10:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EE231BB6B8;
	Fri, 13 Dec 2024 10:31:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F8351B6CFD;
	Fri, 13 Dec 2024 10:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.61.185.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734085870; cv=none; b=J6vANZLuDZWax10EVwzwXcRH3aDtHUKfRjRODg6mcyED4Zpq19tIeCtkKdCVscz7bHGQK3xTzTx1ItKcAwmKSJ/MgJzIjcSyrWE1gWZu8TdnooASVlJCK7Md68MCqSPMwtJ4JVvyc5dwUilyCQw5WwZNHnPe6ValyMIQxocicUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734085870; c=relaxed/simple;
	bh=YbczaccQQOQhzAwA1asa8/3Jw59z66MFlA9Gr62H1zc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=REGGQNypVgcRRcmpZ5lxDcaLTpicERjxwGMjT7GOfjLn5AaxMDaZP73Be6qqRlFx9LceXbHKxoM1WjeetAj7a3tLTyMEshogbR+zDpLCSRNpgyAACNz/v28DHPqxeX97AKBv2W+XcDQtUNPBpH8y8DlzBDNJJ5/QaVg11PwrVMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=189.cn; spf=pass smtp.mailfrom=189.cn; arc=none smtp.client-ip=183.61.185.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=189.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=189.cn
HMM_SOURCE_IP:10.158.243.18:12554.359801282
HMM_ATTACHE_NUM:0000
HMM_SOURCE_TYPE:SMTP
Received: from clientip-123.150.8.42 (unknown [10.158.243.18])
	by 189.cn (HERMES) with SMTP id 9A021100204;
	Fri, 13 Dec 2024 18:30:57 +0800 (CST)
Received: from  ([123.150.8.42])
	by gateway-153622-dep-5c5f88b874-pd459 with ESMTP id c2a65c2fa6a0433bb15426cf90653fff for krzk@kernel.org;
	Fri, 13 Dec 2024 18:30:58 CST
X-Transaction-ID: c2a65c2fa6a0433bb15426cf90653fff
X-Real-From: chensong_2000@189.cn
X-Receive-IP: 123.150.8.42
X-MEDUSA-Status: 0
Sender: chensong_2000@189.cn
Message-ID: <a06935f7-8d9a-478b-a3a0-25df3f404b44@189.cn>
Date: Fri, 13 Dec 2024 18:30:57 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] regulator:s5m8767 Fully convert to GPIO descriptors
To: Krzysztof Kozlowski <krzk@kernel.org>, lgirdwood@gmail.com,
 broonie@kernel.org, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
References: <20241206051358.496832-1-chensong_2000@189.cn>
 <17a4dbd7-56cb-4c20-a913-0df5c39fc3ff@kernel.org>
 <862662aa-c5a2-4e15-b97f-ca1b4757ab25@189.cn>
 <bf80a815-a602-4bbe-a950-e8b6c1b0789a@kernel.org>
Content-Language: en-US
From: Song Chen <chensong_2000@189.cn>
In-Reply-To: <bf80a815-a602-4bbe-a950-e8b6c1b0789a@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Krzysztof,

I noticed that in s5m8767_set_high and s5m8767_set_low, the code looks 
identical to each other, only order is different. Is there any problem 
here or this way is on purpose correctly.

static inline int s5m8767_set_high(struct s5m8767_info *s5m8767)
{
     int temp_index = s5m8767->buck_gpioindex;

     gpio_set_value(s5m8767->buck_gpios[0], (temp_index >> 2) & 0x1);
     gpio_set_value(s5m8767->buck_gpios[1], (temp_index >> 1) & 0x1);
     gpio_set_value(s5m8767->buck_gpios[2], temp_index & 0x1);

     return 0;
}

static inline int s5m8767_set_low(struct s5m8767_info *s5m8767)
{
     int temp_index = s5m8767->buck_gpioindex;

     gpio_set_value(s5m8767->buck_gpios[2], temp_index & 0x1);
     gpio_set_value(s5m8767->buck_gpios[1], (temp_index >> 1) & 0x1);
     gpio_set_value(s5m8767->buck_gpios[0], (temp_index >> 2) & 0x1);

     return 0;
}

Song



> On 07/12/2024 07:16, Song Chen wrote:
>>>>    		}
>>>> -		pdata->buck_gpios[i] = gpio;
>>>> +
>>>> +		/* SET GPIO*/
>>>
>>> What is a SET GPIO?
>>>
>>>> +		snprintf(label, sizeof(label), "%s%d", "S5M8767 SET", i + 1);
>>>
>>> Why using "SET" as name, not the actual name it is used for? Buck DVS?
>>
>> from below snippets:
>> s5m8767_pmic_probe of drivers/regulator/s5m8767.c
>>           ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[0],
>>                       "S5M8767 SET1");
>>           if (ret)
>>               return ret;
>>
>>           ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[1],
>>                       "S5M8767 SET2");
>>           if (ret)
>>               return ret;
>>
>>           ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[2],
>>                       "S5M8767 SET3");
> 
> 
> Yeah, your code is fine.
> 
>>
>> and arch/arm/boot/dts/samsung/exynos5250-spring.dts
>>
>>           s5m8767,pmic-buck-dvs-gpios = <&gpd1 0 GPIO_ACTIVE_LOW>, /* DVS1 */
>>                             <&gpd1 1 GPIO_ACTIVE_LOW>, /* DVS2 */
>>                             <&gpd1 2 GPIO_ACTIVE_LOW>; /* DVS3 */
>>
>>           s5m8767,pmic-buck-ds-gpios = <&gpx2 3 GPIO_ACTIVE_LOW>, /* SET1 */
>>                            <&gpx2 4 GPIO_ACTIVE_LOW>, /* SET2 */
>>                            <&gpx2 5 GPIO_ACTIVE_LOW>; /* SET3 */
>>
>>>
>>>> +		gpiod_set_consumer_name(pdata->buck_gpios[i], label);
>>>> +		gpiod_direction_output(pdata->buck_gpios[i],
>>>> +					(pdata->buck_default_idx >> (2 - i)) & 0x1);
>>>
>>> This is not an equivalent code. You set values for GPIOs 0-1 even if
>>> requesting GPIO 2 fails.
>>>
>>> On which board did you test it?
>>
>> You are right ,it's not equivalent with original code, i will fix it.
>> but i have a question here:
>>
>>           ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[0],
>>                       "S5M8767 SET1");
>>           if (ret)
>>               return ret;
>>
>>           ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[1],
>>                       "S5M8767 SET2");
>>           if (ret)
>>               return ret;
>>
>>           ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[2],
>>                       "S5M8767 SET3");
>>           if (ret)
>>               return ret;
>>
>> if it fails to request buck_gpios[2] after successfully requests
>> buck_gpios[0] and buck_gpios[1], the probe fails as well, should it call
>> gpiod_put to return gpio resource?
> 
> 
> Aren't you using devm interface? Please read the API. You do not need to
> put anything, unless you use some other interface and I missed the point
> of the question.
> 
> Best regards,
> Krzysztof
> 
> 

