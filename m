Return-Path: <linux-gpio+bounces-11714-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1589A6432
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2024 12:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 46D54282FD2
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2024 10:44:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0725B1EC010;
	Mon, 21 Oct 2024 10:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Bunadi0R"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 591C21E6325
	for <linux-gpio@vger.kernel.org>; Mon, 21 Oct 2024 10:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729507126; cv=none; b=OVcWa/zH+k5/4BkeUj11MvUhm2i5K0oKaAwhHw0ec719RcUc9ZtF0pzBU0LekFgqmg59xRhjXSicta24knSFDdydQfndkKyG2nAkTcGT4be+7dazWqhMPuuy7n/43JsHYdaY/Qfhb4IyLsZmbZTTMxSNrRotwr2ZWrwdQ6guVDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729507126; c=relaxed/simple;
	bh=OtAbMeazYZxPVYU5/7ohPXTaGyps2mbNAHyWMRwAYXs=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=kMjj7DYbFMTnvhplYCmBdG22oZ3ifNeVgzk/p3+tEyYoDfQydw4dORf6qepJvciPQE7eMS5YckgHZiYY9UPlRMMwpfgafjOHDMC4Xl6Fdtyy+I3fic7oMzlxmFjfwtFu2mGGvVEadsZyclfreJLTEbCYBB7r3kWcjK29IkE3zU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Bunadi0R; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43152b79d25so41369365e9.1
        for <linux-gpio@vger.kernel.org>; Mon, 21 Oct 2024 03:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729507122; x=1730111922; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ySuw8D8jWEN/9YhfbV0Sya+B2jTWI3nM02ykj7+cy8=;
        b=Bunadi0RhCr6FL+KpNcBauqqipnpTGK56jzQI788HniDrZ7xzJ5VsSyXacwo0GxkJm
         gBkx2nnRYLzS9L+KbWhvrJ4G00KrOUlyw14iB602a6YTDcMxcOxOI5rnCeQOQKx7ixdv
         9YNzHOh1cPCrppPuK0/eCHNrwJsrOBKdpK9hsfDJCOSWhnvwgwN2BXiU/hXxDNoC9M9W
         klLPko3k10SbjelHbuYVW5UVOG0JX255Sr4neFjbTvs75E//rHdWlcYC/3FGLqccz768
         ftvvvcgirT85lamSEpARBh4ySG0w+aPuDZKLi8LvfSnNcKwRgHIeHwKD2ZMC1k2VaxZZ
         dEqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729507122; x=1730111922;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2ySuw8D8jWEN/9YhfbV0Sya+B2jTWI3nM02ykj7+cy8=;
        b=acekOrWLPTJFZzb3u9qxgIlKEFS5D1T8m39mWtcYRYoO2FkzAzHxoWkUscyWirtvru
         tsA1YQi4aMPsGWOrT5KAB3KCEoP6l0POX1yPRyCfcxvsHK6plGSUJWKWEHXX0+Mw7P6j
         afob3GrbmLXhaooQxB6qH/0D9F15ycd6xGDQvz2np/6VuyCkOqYX/5KSJ1KaSshqSL58
         4OWm0bs7c4e5yjsiDB3DF9INklVmzvDU1IFe5o3LMwZu+o7V1fYUbWjbedYFj4YOjiVL
         NmUrthA2/X8vgOkEDUKwk5KvVYD/Nbi2jU9dyuUhO4oAhsIGwuCOAD5iarQAqKbjH2BT
         megw==
X-Forwarded-Encrypted: i=1; AJvYcCXsvG2D/mB0/xjqbSGDkzN6mUSTTL8uCOvPDNS8tLNcnA2hhTQ1sRu0hcWTPk7jPGE5egeaGw1GHqrN@vger.kernel.org
X-Gm-Message-State: AOJu0YxFJSlN9sNUsFpnvWKvbpO2a+JUE0oVEByRbOZ9519dCmFA8frJ
	KatmSb2V/WvyKdRsCsTxSV7gU6exIdEpNx1OVM+YG4xjFYzcun9MSH9qEWK6dj/7KzXZZA1OCCW
	dBAE=
X-Google-Smtp-Source: AGHT+IEdepbcnTwYewoqxOwDr6bbpP0LoiIrLZO/s1iPNW7F3xJuePF3p6zuXgXPdml/hpNXA/PR6g==
X-Received: by 2002:a05:600c:35d3:b0:431:5f9e:3f76 with SMTP id 5b1f17b1804b1-43161669464mr96932435e9.16.1729507122510;
        Mon, 21 Oct 2024 03:38:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:3908:dea6:2ddd:be97? ([2a01:e0a:982:cbb0:3908:dea6:2ddd:be97])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f5c3497sm52743365e9.29.2024.10.21.03.38.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 03:38:42 -0700 (PDT)
Message-ID: <f6c4cee8-dd22-4b30-a3b2-aee48e2c3611@linaro.org>
Date: Mon, 21 Oct 2024 12:38:40 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v3 1/3] dt-bindings: pinctrl: Add support for Amlogic A4
 SoCs
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Jerome Brunet <jbrunet@baylibre.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com>
 <20241018-a4_pinctrl-v3-1-e76fd1cf01d7@amlogic.com>
 <4a79f996-9d82-48b2-8a93-d7917413ed8c@kernel.org>
 <1jttd9rein.fsf@starbuckisacylon.baylibre.com>
 <4127b448-a914-4c69-b938-29512995326f@amlogic.com>
 <1jmsj1rclh.fsf@starbuckisacylon.baylibre.com>
 <d654d2b2-977b-44c0-8b01-b26f5eb0a3fe@kernel.org>
 <5ad8f396-84a5-486d-b90d-98fbf8882d1b@linaro.org>
 <e6cd13b5-2f7a-4ab1-899c-5867bc0ea64f@kernel.org>
 <fdb4d0eb-a5e5-4061-b3cc-14958473baf3@linaro.org>
 <c8a03fa6-9ac5-434f-ba13-78e47ad341b8@kernel.org>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <c8a03fa6-9ac5-434f-ba13-78e47ad341b8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21/10/2024 11:56, Krzysztof Kozlowski wrote:
> On 21/10/2024 09:38, neil.armstrong@linaro.org wrote:
>> On 18/10/2024 17:31, Krzysztof Kozlowski wrote:
>>> On 18/10/2024 14:31, Neil Armstrong wrote:
>>>> On 18/10/2024 12:13, Krzysztof Kozlowski wrote:
>>>>> On 18/10/2024 11:20, Jerome Brunet wrote:
>>>>>> On Fri 18 Oct 2024 at 17:01, Xianwei Zhao <xianwei.zhao@amlogic.com> wrote:
>>>>>>
>>>>>>> Hi Jerome,
>>>>>>>       Thanks for your reply.
>>>>>>>
>>>>>>> On 2024/10/18 16:39, Jerome Brunet wrote:
>>>>>>>> [ EXTERNAL EMAIL ]
>>>>>>>> On Fri 18 Oct 2024 at 10:28, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>>>>>
>>>>>>>>> On 18/10/2024 10:10, Xianwei Zhao via B4 Relay wrote:
>>>>>>>>>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>>>>>>>>
>>>>>>>>>> Add the new compatible name for Amlogic A4 pin controller, and add
>>>>>>>>>> a new dt-binding header file which document the detail pin names.
>>>>>>>> the change does not do what is described here. At least the description
>>>>>>>> needs updating.
>>>>>>>>
>>>>>>>
>>>>>>> Will do.
>>>>>>>
>>>>>>>> So if the pin definition is now in the driver, does it mean that pins have
>>>>>>>> to be referenced in DT directly using the made up numbers that are
>>>>>>>> created in pinctrl-amlogic-a4.c at the beginning of patch #2 ?
>>>>>>>>
>>>>>>>
>>>>>>> Yes.
>>>>>>>
>>>>>>>> If that's case, it does not look very easy a read.
>>>>>>>>
>>>>>>>
>>>>>>> It does happen. The pin definition does not fall under the category of
>>>>>>> binding.
>>>>>>>
>>>>>>> https://lore.kernel.org/all/106f4321-59e8-49b9-bad3-eeb57627c921@amlogic.com/
>>>>>>
>>>>>> So the expectation is that people will write something like:
>>>>>>
>>>>>>     reset-gpios = <&gpio 42 GPIO_ACTIVE_LOW>;
>>>>>>
>>>>>> And others will go in the driver to see that is maps to GPIOX_10 ? the number
>>>>>> being completly made up, with no link to anything HW/Datasheet
>>>>>> whatsoever ?
>>>>>>
>>>>>> This is how things should be done now ?
>>>>>
>>>>> Why would you need to do this? Why it cannot be <&gpio 10
>>>>> GPIO_ACTIVE_LOW>, assuming it is GPIO 10?
>>>>>
>>>>> Bindings have absolutely nothing to do with it. You have GPIO 10, not
>>>>> 42, right?
>>>>
>>>> There's no 1:1 mapping between the number and the pin on Amlogic platforms,
>>>> so either a supplementary gpio phandle cell is needed to encode the gpio pin
>>>> group or some bindings header is needed to map those to well known identifiers.
>>>
>>> So I assume this is not linear mapping (simple offset)? If so, this fits
>>> the binding header with identifiers, but I have impression these were
>>> not really used in earlier versions of this patchset. Instead some offsets:
>>> https://lore.kernel.org/all/20241014-a4_pinctrl-v2-1-3e74a65c285e@amlogic.com/
>>>
>>> and pre-proccessor.
>>>
>>> These looked almost good:
>>> https://lore.kernel.org/all/20240613170816.GA2020944-robh@kernel.org/
>>>
>>> but then 0 -> 0
>>> 1 -> 1
>>> so where is this need for IDs?
>>
>> ???
>>
>> Of courses the first pins maps to linear values...
>>
>>>
>>> See also last comment from Rob in above email.
>>
>> OK so I looked and v2 was in fact correct:
>> https://lore.kernel.org/all/20241014-a4_pinctrl-v2-1-3e74a65c285e@amlogic.com/
>>
>> ====><=================
>> +/* Standard port */
>> +#define GPIOB_START	0
>> +#define GPIOB_NUM	14
>> +
>> +#define GPIOD_START	(GPIOB_START + GPIOB_NUM)
>> +#define GPIOD_NUM	16
>> +
>> +#define GPIOE_START	(GPIOD_START + GPIOD_NUM)
>> +#define GPIOE_NUM	2
>> +
>> +#define GPIOT_START	(GPIOE_START + GPIOE_NUM)
>> +#define GPIOT_NUM	23
>> +
>> +#define GPIOX_START	(GPIOT_START + GPIOT_NUM)
>> +#define GPIOX_NUM	18
>> +
>> +#define PERIPHS_PIN_NUM	(GPIOX_START + GPIOX_NUM)
>> +
>> +/* Aobus port */
>> +#define GPIOAO_START	0
>> +#define GPIOAO_NUM	7
>> +
>> +/* It's a special definition, put at the end, just 1 num */
>> +#define	GPIO_TEST_N	(GPIOAO_START +  GPIOAO_NUM)
>> +#define	AOBUS_PIN_NUM	(GPIO_TEST_N + 1)
>> +
>> +#define AMLOGIC_GPIO(port, offset)	(port##_START + (offset))
>> ====><=================
>>
>> is exactly what rob asked for, and you nacked it.
> 
> No, this is not what was asked, at least according to my understanding.
> Number of GPIOs is not an ABI. Neither is their relationship, where one
> starts and other ends.

I confirm this need some work, but it moved the per-pin define to start
and ranges, so what did rob expect ?

> 
> Maybe I missed something, but I could not find any users of these in the
> DTS. Look:
> 
> https://lore.kernel.org/all/20241014-a4_pinctrl-v2-3-3e74a65c285e@amlogic.com/

So you want consumers before the bindings ? strange argument

> 
> Where is any of above defines?
> 
> Maybe they will be visible in the consumer code, but I did not imagine
> such use. You expect:
> reset-gpios = <&ctrl GPIOAO_START 1>???

No I expect:
reset-gpios = <&ctrl AMLOGIC_GPIO(B, 0) 1>;

but the macro should go along the dts like we did for the reset defines,
so perhaps this is the solution ?

> 
> How this is anyway close to what we have for Aspeed or Tegra? I
> understand that there was no consumer DTS, but you have also cover
> letter which could bring some answers in case reviewer is confused. What
> did cover letter say? Let me quote:
> 
> "Add pinctrl driver support for Amloigc A4 SoC"

Well he didn't expect a such sudden radical change in maintainers
requirements! Neither did I.

Neil

> 
> 
> 
> 
> Best regards,
> Krzysztof
> 


