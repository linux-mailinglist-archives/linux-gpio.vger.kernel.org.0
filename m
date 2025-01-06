Return-Path: <linux-gpio+bounces-14529-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD285A021D9
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 10:29:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 493F83A427D
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jan 2025 09:29:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 522721D95A3;
	Mon,  6 Jan 2025 09:29:10 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0182D1D935C;
	Mon,  6 Jan 2025 09:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.61.185.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736155750; cv=none; b=QvxYfee9ZekJAfysff3H6ofJfMFiZEGyGuVcSBM2v+uyPUdYvuPButZt7r0TvHZQZsj3iCk/SOmnLm6WAmLlSXB6UZAicwSRPoEDk62RZazSGm1bW6r2m2vakNEyAvv/kI0cPUUKhL7+SSxS9bVYANU+q/f3rBJfpjYN/lICW6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736155750; c=relaxed/simple;
	bh=gCUAlaY1Sbkejvf11lWp6umo+PrC3NHDHZIrlcoX6zc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=jtPRoPL4lOtX9QKoAi0JMYOZA7wdT5k+EN9bciLKEWJwi2mCsvW6weBDOnSI65q6IqSWdo5Dc67bdKZUSCv6VQ6hJwPV9/0ljgJ80XagyAM+FqyvzzTpAjbyTUPU91k19MUQRMIiQT8AFGyvZIVzuq4jbsu0ckaTsixW5trRssw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=189.cn; spf=pass smtp.mailfrom=189.cn; arc=none smtp.client-ip=183.61.185.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=189.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=189.cn
HMM_SOURCE_IP:10.158.243.220:3813.1464994377
HMM_ATTACHE_NUM:0000
HMM_SOURCE_TYPE:SMTP
Received: from clientip-123.150.8.42 (unknown [10.158.243.220])
	by 189.cn (HERMES) with SMTP id B4A61100238;
	Mon,  6 Jan 2025 17:23:55 +0800 (CST)
Received: from  ([123.150.8.42])
	by gateway-153622-dep-5c5f88b874-f78lq with ESMTP id 7426f46756d24355b7455966eed722a8 for krzk@kernel.org;
	Mon, 06 Jan 2025 17:23:56 CST
X-Transaction-ID: 7426f46756d24355b7455966eed722a8
X-Real-From: chensong_2000@189.cn
X-Receive-IP: 123.150.8.42
X-MEDUSA-Status: 0
Sender: chensong_2000@189.cn
Message-ID: <4fc82b83-d312-4878-96ea-4c6ce7e19631@189.cn>
Date: Mon, 6 Jan 2025 17:23:55 +0800
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] regulator:s5m8767 Fully convert to GPIO descriptors
From: Song Chen <chensong_2000@189.cn>
To: Krzysztof Kozlowski <krzk@kernel.org>, lgirdwood@gmail.com,
 broonie@kernel.org, lee@kernel.org, linus.walleij@linaro.org, brgl@bgdev.pl
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org
References: <20241206051358.496832-1-chensong_2000@189.cn>
 <17a4dbd7-56cb-4c20-a913-0df5c39fc3ff@kernel.org>
 <862662aa-c5a2-4e15-b97f-ca1b4757ab25@189.cn>
 <bf80a815-a602-4bbe-a950-e8b6c1b0789a@kernel.org>
 <a06935f7-8d9a-478b-a3a0-25df3f404b44@189.cn>
Content-Language: en-US
In-Reply-To: <a06935f7-8d9a-478b-a3a0-25df3f404b44@189.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Krzysztof,

Bart and I are talking about using gpiod array in s5m8767 by adding a 
new variant in gpio core, what do you think about that?

what's more, i also have another question about 
s5m8767_set_high/s5m8767_set_low, see detail below, i would appreciate 
it if you could give any comments about that.

Best regards,

Song


在 2024/12/13 18:30, Song Chen 写道:
> Hi Krzysztof,
> 
> I noticed that in s5m8767_set_high and s5m8767_set_low, the code looks 
> identical to each other, only order is different. Is there any problem 
> here or this way is on purpose correctly.
> 
> static inline int s5m8767_set_high(struct s5m8767_info *s5m8767)
> {
>      int temp_index = s5m8767->buck_gpioindex;
> 
>      gpio_set_value(s5m8767->buck_gpios[0], (temp_index >> 2) & 0x1);
>      gpio_set_value(s5m8767->buck_gpios[1], (temp_index >> 1) & 0x1);
>      gpio_set_value(s5m8767->buck_gpios[2], temp_index & 0x1);
> 
>      return 0;
> }
> 
> static inline int s5m8767_set_low(struct s5m8767_info *s5m8767)
> {
>      int temp_index = s5m8767->buck_gpioindex;
> 
>      gpio_set_value(s5m8767->buck_gpios[2], temp_index & 0x1);
>      gpio_set_value(s5m8767->buck_gpios[1], (temp_index >> 1) & 0x1);
>      gpio_set_value(s5m8767->buck_gpios[0], (temp_index >> 2) & 0x1);
> 
>      return 0;
> }
> 
> Song
> 
> 
> 
>> On 07/12/2024 07:16, Song Chen wrote:
>>>>>            }
>>>>> -        pdata->buck_gpios[i] = gpio;
>>>>> +
>>>>> +        /* SET GPIO*/
>>>>
>>>> What is a SET GPIO?
>>>>
>>>>> +        snprintf(label, sizeof(label), "%s%d", "S5M8767 SET", i + 1);
>>>>
>>>> Why using "SET" as name, not the actual name it is used for? Buck DVS?
>>>
>>> from below snippets:
>>> s5m8767_pmic_probe of drivers/regulator/s5m8767.c
>>>           ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[0],
>>>                       "S5M8767 SET1");
>>>           if (ret)
>>>               return ret;
>>>
>>>           ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[1],
>>>                       "S5M8767 SET2");
>>>           if (ret)
>>>               return ret;
>>>
>>>           ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[2],
>>>                       "S5M8767 SET3");
>>
>>
>> Yeah, your code is fine.
>>
>>>
>>> and arch/arm/boot/dts/samsung/exynos5250-spring.dts
>>>
>>>           s5m8767,pmic-buck-dvs-gpios = <&gpd1 0 GPIO_ACTIVE_LOW>, /* 
>>> DVS1 */
>>>                             <&gpd1 1 GPIO_ACTIVE_LOW>, /* DVS2 */
>>>                             <&gpd1 2 GPIO_ACTIVE_LOW>; /* DVS3 */
>>>
>>>           s5m8767,pmic-buck-ds-gpios = <&gpx2 3 GPIO_ACTIVE_LOW>, /* 
>>> SET1 */
>>>                            <&gpx2 4 GPIO_ACTIVE_LOW>, /* SET2 */
>>>                            <&gpx2 5 GPIO_ACTIVE_LOW>; /* SET3 */
>>>
>>>>
>>>>> +        gpiod_set_consumer_name(pdata->buck_gpios[i], label);
>>>>> +        gpiod_direction_output(pdata->buck_gpios[i],
>>>>> +                    (pdata->buck_default_idx >> (2 - i)) & 0x1);
>>>>
>>>> This is not an equivalent code. You set values for GPIOs 0-1 even if
>>>> requesting GPIO 2 fails.
>>>>
>>>> On which board did you test it?
>>>
>>> You are right ,it's not equivalent with original code, i will fix it.
>>> but i have a question here:
>>>
>>>           ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[0],
>>>                       "S5M8767 SET1");
>>>           if (ret)
>>>               return ret;
>>>
>>>           ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[1],
>>>                       "S5M8767 SET2");
>>>           if (ret)
>>>               return ret;
>>>
>>>           ret = devm_gpio_request(&pdev->dev, pdata->buck_gpios[2],
>>>                       "S5M8767 SET3");
>>>           if (ret)
>>>               return ret;
>>>
>>> if it fails to request buck_gpios[2] after successfully requests
>>> buck_gpios[0] and buck_gpios[1], the probe fails as well, should it call
>>> gpiod_put to return gpio resource?
>>
>>
>> Aren't you using devm interface? Please read the API. You do not need to
>> put anything, unless you use some other interface and I missed the point
>> of the question.
>>
>> Best regards,
>> Krzysztof
>>
>>

