Return-Path: <linux-gpio+bounces-12220-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 317719B2BC8
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 10:46:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5476E1C218BD
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Oct 2024 09:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B1591CF5CA;
	Mon, 28 Oct 2024 09:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KduwlZCD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912791CCB57
	for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 09:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730108790; cv=none; b=LrXA5/qcSGzQGaw76Xx99ASoAWLufJ/Xwa66yzgOfYZ2A35Gve3ACblUx1ajMYOMumKQctYjL7FD7l22vTFxL5P0w3W05SXvxNMLe6Utj7YvHYjZocuMFjByZWt376R5IFjNzjoKvrBh+IlSCqsrU1u0seq4Yfi2MvpTb3EcOU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730108790; c=relaxed/simple;
	bh=v4dpwmXgnuwsF8/yHD3adPEz8Eg0U6STihDIIRZ4nRo=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=R6DAiF5GUn81tcV2pKzHnSJsbQ7RN5B5DVscB6ljHTOaAnDjKf9MnmqDoAe3zjd19FVrP8iuUeKmaHuYynFtXqNsIX2pXtDZmqO7MDLXbzxi+rrUniU2eb5Dvp0fvQdADyrAtD2nsyT38zXvMssGEPX80cjSx6HhPH2VG2HRW4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KduwlZCD; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2fb51f39394so38862511fa.2
        for <linux-gpio@vger.kernel.org>; Mon, 28 Oct 2024 02:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730108787; x=1730713587; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hxtPA/U78ERZ+ppdXXWbhxnMqxfDhJ72xcfBzWrzRXU=;
        b=KduwlZCDpiSWHrxE4TjogmHV0AQ4300WryUpAwNVncBZBXX20M1T5Uz6ftXDQlkGie
         F7RefrfeYA4BhLJdAyNlwJ63RsNALctBYxHrcthH2Cg2Amhn7z4oNKt7tDo3w0Uht9rU
         GMhtZv/uaPrhR+bZxwdy4PpbeeG3m9V0KZLkwZzo+2s/5MU7wULTKqIiRppYZiyIRAZB
         5tIafiG4DS3ZLpSbcSyPfUCeBC3cbzE8II5p0haVZt30T8BtgvQiRIDGqWIQqxXvqmU6
         +JsSWIgq30L7dAi+RkNwR3P6Mx+xKQcrxjjMGC5mEte0uJygvvj+PWePjeFIHhAd5Qlo
         mZig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730108787; x=1730713587;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hxtPA/U78ERZ+ppdXXWbhxnMqxfDhJ72xcfBzWrzRXU=;
        b=qJcQ9SFbVIROwxVz3ubvdXreiqkjZ4Su84tXDirfIxgKF0HdOrX5dEeLk/MRjnZ/X2
         +ENM5HhGWX5i2nF3I1/c9tpmEhF3/gVYhj/ojyYBOgeeCM/DMABdGz/+CdHPIQIXBFsb
         CEvDiD8CXwq3icd8MS5My4TjKg7M7KFpsC3ebZ80i0/BG3nBWTETZLogomrY1o9buIeZ
         d5mOp4WXpGmPUcnQwG99KgAbM3i6aHud0JXgC9QBUCS2J9HAc4sLm6Pbjjfj7KSmUBRU
         3DF9C07sAvLMc9mDMXasgHEalzO6ZMIm05ipAyOJk9JMPU9YZQ/nxS/76r3zJ/cpJ5hM
         sylQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBiMLhRGc6Ox8QpV4kuPVg1l9WYitlR6+W3OakseHuu8SklYTyiEJJU3nO+hNj2HnUIPVxVJOBzjjW@vger.kernel.org
X-Gm-Message-State: AOJu0YzjfUYtrfynBBhmsaKHfQ4zJ+Hn1lAxb0xNhgSLXQE/OWMf25v4
	d5ozeyLbmM23hUV7uuuk+dIS45BLKaUz5gMAorRdkdWxMm7R1LDuKOjErLqsIRM=
X-Google-Smtp-Source: AGHT+IFWhDgOD4KwMZ5u7zjg9xk4YCKQ/VGKmAhMl71E6/XB3UI+mDlDu4avbbZcnOkfYTddUxKcDw==
X-Received: by 2002:a05:651c:b20:b0:2fb:3bc0:9c7c with SMTP id 38308e7fff4ca-2fcbe005e17mr28310221fa.25.1730108786669;
        Mon, 28 Oct 2024 02:46:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:c11d:e163:200e:8a5d? ([2a01:e0a:982:cbb0:c11d:e163:200e:8a5d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431935a4ad8sm103872435e9.23.2024.10.28.02.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 02:46:26 -0700 (PDT)
Message-ID: <a0c30691-ad28-4217-bf46-924fca5f48de@linaro.org>
Date: Mon, 28 Oct 2024 10:46:24 +0100
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
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>
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
 <f6c4cee8-dd22-4b30-a3b2-aee48e2c3611@linaro.org>
 <91bcc765-2e56-433d-a629-c5255fc8d256@kernel.org>
 <24acd645-4094-48aa-82e3-42d30a340884@amlogic.com>
 <78e6ca30-9fd6-4384-9583-440c485fb8ed@linaro.org>
 <d4ae04da-d841-49e8-be88-b0fe0c7b3de5@amlogic.com>
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
In-Reply-To: <d4ae04da-d841-49e8-be88-b0fe0c7b3de5@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 28/10/2024 10:36, Xianwei Zhao wrote:
> Hi Neil,
>     Thanks for your advice.
> 
> On 2024/10/28 17:09, neil.armstrong@linaro.org wrote:
>> [ EXTERNAL EMAIL ]
>>
>> On 28/10/2024 10:07, Xianwei Zhao wrote:
>>> Hi Neil,
>>>      Based on the current discussion results, GPIO index macro definition does not belong to bindings. If so, the pinctrl driver keeps the existing architecture, and use numbers instead in dts file. Or the pinctrl driver use bank mode acess, this may not be compatible with existing frameworks. This is done by adding of_xlate hook functions in pinctrl_chip struct.
>>>
>>> What is your advice that I can implement in the next version. Thanks!
>>
>> Keep the driver as-is, but move the header file into arch/arm64/boot/dts/amlogic like it was done for the last reset controller support:
>> arch/arm64/boot/dts/amlogic/amlogic-t7-reset.h
>>
> 
> I don't see examples C file applies dts header file.
> C file need to be defined once, and this needs to be defined again in dts header file.

Sorry could you rephrase, the sentence isn't clear.

Neil

> 
>> Neil
>>
>>>
>>> On 2024/10/21 23:27, Krzysztof Kozlowski wrote:
>>>> [ EXTERNAL EMAIL ]
>>>>
>>>> On 21/10/2024 12:38, neil.armstrong@linaro.org wrote:
>>>>>>> ====><=================
>>>>>>> +/* Standard port */
>>>>>>> +#define GPIOB_START        0
>>>>>>> +#define GPIOB_NUM  14
>>>>>>> +
>>>>>>> +#define GPIOD_START        (GPIOB_START + GPIOB_NUM)
>>>>>>> +#define GPIOD_NUM  16
>>>>>>> +
>>>>>>> +#define GPIOE_START        (GPIOD_START + GPIOD_NUM)
>>>>>>> +#define GPIOE_NUM  2
>>>>>>> +
>>>>>>> +#define GPIOT_START        (GPIOE_START + GPIOE_NUM)
>>>>>>> +#define GPIOT_NUM  23
>>>>>>> +
>>>>>>> +#define GPIOX_START        (GPIOT_START + GPIOT_NUM)
>>>>>>> +#define GPIOX_NUM  18
>>>>>>> +
>>>>>>> +#define PERIPHS_PIN_NUM    (GPIOX_START + GPIOX_NUM)
>>>>>>> +
>>>>>>> +/* Aobus port */
>>>>>>> +#define GPIOAO_START       0
>>>>>>> +#define GPIOAO_NUM 7
>>>>>>> +
>>>>>>> +/* It's a special definition, put at the end, just 1 num */
>>>>>>> +#define    GPIO_TEST_N     (GPIOAO_START +  GPIOAO_NUM)
>>>>>>> +#define    AOBUS_PIN_NUM   (GPIO_TEST_N + 1)
>>>>>>> +
>>>>>>> +#define AMLOGIC_GPIO(port, offset) (port##_START + (offset))
>>>>>>> ====><=================
>>>>>>>
>>>>>>> is exactly what rob asked for, and you nacked it.
>>>>>>
>>>>>> No, this is not what was asked, at least according to my understanding.
>>>>>> Number of GPIOs is not an ABI. Neither is their relationship, where one
>>>>>> starts and other ends.
>>>>>
>>>>> I confirm this need some work, but it moved the per-pin define to start
>>>>> and ranges, so what did rob expect ?
>>>>>
>>>>>>
>>>>>> Maybe I missed something, but I could not find any users of these in the
>>>>>> DTS. Look:
>>>>>>
>>>>>> https://lore.kernel.org/all/20241014-a4_pinctrl-v2-3-3e74a65c285e@amlogic.com/
>>>>>
>>>>> So you want consumers before the bindings ? strange argument
>>>>>
>>>>>>
>>>>>> Where is any of above defines?
>>>>>>
>>>>>> Maybe they will be visible in the consumer code, but I did not imagine
>>>>>> such use. You expect:
>>>>>> reset-gpios = <&ctrl GPIOAO_START 1>???
>>>>>
>>>>> No I expect:
>>>>> reset-gpios = <&ctrl AMLOGIC_GPIO(B, 0) 1>;
>>>>>
>>>>> but the macro should go along the dts like we did for the reset defines,
>>>>> so perhaps this is the solution ?
>>>>
>>>> OK, so I said it was not a binding:
>>>> https://lore.kernel.org/all/u4afxqc3ludsic4n3hs3r3drg3ftmsbcwfjltic2mb66foo47x@xe57gltl77hq/
>>>>
>>>> and you here confirm, if I understood you correctly, that it goes with
>>>> the DTS like reset defines (I assume non-ID like defines?), so also not
>>>> a binding?
>>>>
>>>> What are we disagreeing with?
>>>>
>>>> Just to recall, Jerome asked whether you have to now use arbitrary
>>>> numbers in DTS and my answer was: not. It's still the same answer.
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>>
>>


