Return-Path: <linux-gpio+bounces-13687-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A168F9EA8F2
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2024 07:52:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 53D21283FE5
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2024 06:52:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0825722CBCC;
	Tue, 10 Dec 2024 06:52:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from 189.cn (ptr.189.cn [183.61.185.104])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 931611D7E31;
	Tue, 10 Dec 2024 06:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=183.61.185.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733813526; cv=none; b=Lz1WbiP9MHeTy4vo6847/sIaW5mOgzO4fWt0NpdlTGdGNlCXyWWeVIT7uSCtng9wqH5i/P/9KN9C8oeZDaDOc8mT3D+boMAUg4psYe9n0J3XBCmiwD6/bMU4kQ4HKPpd4biM6tTUjfExvoBEcJMdpnEHum+S19ZQHPAjHnZtt+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733813526; c=relaxed/simple;
	bh=1wo6h0OJIzB66Qq1Y13/KffCz76yHWcvbhx2dxPieDw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dp0xLyEFV0YedWHN7FcH2V3kUd/1pXs/6JbdtbJt58NwpL10yID9zXMz+K/ANJcBeTwSScSgSQ2ugrbq5jDVvRgTOgOXTGmGRd7RHqHHtKTWwls0LH+2PyWm5pfpYpzxeDtf3bf85B+7jHivnV4uvj5jiWG/yfQLajfKXf6wiJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=189.cn; spf=pass smtp.mailfrom=189.cn; arc=none smtp.client-ip=183.61.185.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=189.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=189.cn
HMM_SOURCE_IP:10.158.243.18:47524.362293956
HMM_ATTACHE_NUM:0000
HMM_SOURCE_TYPE:SMTP
Received: from clientip-123.150.8.42 (unknown [10.158.243.18])
	by 189.cn (HERMES) with SMTP id AA7CD102982;
	Tue, 10 Dec 2024 14:51:53 +0800 (CST)
Received: from  ([123.150.8.42])
	by gateway-153622-dep-5c5f88b874-pd459 with ESMTP id 1a4a4f250c474ca0a0ca5c21d408b4f4 for krzk@kernel.org;
	Tue, 10 Dec 2024 14:51:54 CST
X-Transaction-ID: 1a4a4f250c474ca0a0ca5c21d408b4f4
X-Real-From: chensong_2000@189.cn
X-Receive-IP: 123.150.8.42
X-MEDUSA-Status: 0
Sender: chensong_2000@189.cn
Message-ID: <692f3d4a-dded-4e1b-8bb8-95fd165d2f15@189.cn>
Date: Tue, 10 Dec 2024 14:51:52 +0800
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
Content-Transfer-Encoding: 8bit

hi Krzysztof,

It's clear, will send a v2 soon.

Best regards,

Song

在 2024/12/10 03:50, Krzysztof Kozlowski 写道:
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

Not until you told me, I read the devm code, devres_release_all releases 
gpio resources eventually by calling dr->node.release(devm_gpiod_release).

many thanks.

> Best regards,
> Krzysztof
> 
> 

