Return-Path: <linux-gpio+bounces-11710-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 69FB69A5D40
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2024 09:38:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 264B7281B55
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2024 07:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D28A1E0484;
	Mon, 21 Oct 2024 07:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YEOteoyU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AE91DED69
	for <linux-gpio@vger.kernel.org>; Mon, 21 Oct 2024 07:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729496329; cv=none; b=NJAeFuzM0Orq9MqOAA1q9ig84a1TKwOvDcf7iEufDC6+bWi/evpjeypC0X3ygHxV5xQrmljRSK+rxUIHr1q3vMpohu/cndhMt5FQn1GQ0+PQHPQiuUNHUWrGOuCqu1OdMdOq3wI1d32Yb2wckj5f/2fd5+Z/RgjGcrhfo1DMES8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729496329; c=relaxed/simple;
	bh=EOOYepVgtwo6UoPqhkT/0bV6/Hhx4OovJqptdxV0O/s=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=C2Ve4SULDlCMLhVDiizNEt4gcjzm9dTsxQj0OoO9rv3n45Okm621PPvBX3vuvgEH7vkoG3bh/ErUQa+m5NNcbekmIUpYWNHfei+AYADErgeikuvm5g0Xar16pWYauKgLCQ66TimBs0p6IVotkoQ+EYxvU9HkVAmdlu+fZ4mAO8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YEOteoyU; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37d4fd00574so2788959f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 21 Oct 2024 00:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729496325; x=1730101125; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TxYXh/V+6IatSJ291SsvHWPxINcrTow+PNqrMmvAYgI=;
        b=YEOteoyUdN0hDVzKdTspS4+Z0xim0hCp/dM4oj6EIWipZUXwqTTNR/hbpVH6FlgEFs
         YZR2pOyH+sWG0ltUyJNuCEt5JKSI+uUb9wGP8jcLbqwny8G4jEoaL59pcj73QiQBa35Z
         hHyG6dzJpS1XT+Bjr4Zw8E9V5CiFK2tc+3GTfL+SQxu28gy/Nd6/cpuAUgq2+utrP66v
         cPvotgCvzeuHtpkdKqqdiGH0Se04676XTK4xUXrNUyKeYKyFr/YA1K6v74QxCMzo/SoW
         Gb+JhdwDlEM8oHmbd6pmAj6M1VeAYQu2jf9pFSelqUdWpiv13xaxpvtahif7n0Fw8YqO
         fZ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729496325; x=1730101125;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TxYXh/V+6IatSJ291SsvHWPxINcrTow+PNqrMmvAYgI=;
        b=AKDaiYxItEkUoILrypYd5dZdHCY0TOzjw4LBmPAdR2hssOigEtElu554MUkUMbCJEO
         lggNkPzm/ONv3gcZFLFsz/MC1ZAcd9gSNKUcQBu2X8fOno89VxBwmHjldfrp4I0Iu6nG
         k8SGYOXngW+Rpe/M52yFIODjcnVQJEeURMLC6hiBkTQ8BIiuq09q4RINbuovNpLT6x4k
         EqYNMZkRqhXhYsaqelWllLe3PlkpLYtCHyf1R8ANCZ5rT5Uvs0CodNIe277uYdYVtefC
         9XBNyllY78uWK0NKhu+d13v6arJ/KUA1huxk7QxZjMp9z99WXzUZcDengKxnAerQywjB
         lj3w==
X-Forwarded-Encrypted: i=1; AJvYcCWkCczGDRlRu4j43XIpKMkWrbKbGpMHqlDDPp1JKejX7zFrIazheW9Kk1M7i1TryUFDOyHy1nrjw3nY@vger.kernel.org
X-Gm-Message-State: AOJu0YyaIn586UatiCix6xyfV9ZIz0/TZ+Jh3LoM/MGzjy4elO4finLK
	YW5xmfXHCCQE795K1z0Q6wydWguH+y24fxsLGTxQvRcBec90eJHlZTSJV5SEzQoJW7vjM6oLNH7
	AyNE=
X-Google-Smtp-Source: AGHT+IFtLjIEg8RRnj8c2wcjVt5rOHjraFaFABXFVMuRh8JhTW4RU0amqd3QeH7gBtqewoWIpaMXqw==
X-Received: by 2002:adf:e3d1:0:b0:37d:4706:f721 with SMTP id ffacd0b85a97d-37ecf086383mr6426593f8f.27.1729496325397;
        Mon, 21 Oct 2024 00:38:45 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:3908:dea6:2ddd:be97? ([2a01:e0a:982:cbb0:3908:dea6:2ddd:be97])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0a37bb5sm3593696f8f.7.2024.10.21.00.38.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Oct 2024 00:38:45 -0700 (PDT)
Message-ID: <fdb4d0eb-a5e5-4061-b3cc-14958473baf3@linaro.org>
Date: Mon, 21 Oct 2024 09:38:44 +0200
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
In-Reply-To: <e6cd13b5-2f7a-4ab1-899c-5867bc0ea64f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18/10/2024 17:31, Krzysztof Kozlowski wrote:
> On 18/10/2024 14:31, Neil Armstrong wrote:
>> On 18/10/2024 12:13, Krzysztof Kozlowski wrote:
>>> On 18/10/2024 11:20, Jerome Brunet wrote:
>>>> On Fri 18 Oct 2024 at 17:01, Xianwei Zhao <xianwei.zhao@amlogic.com> wrote:
>>>>
>>>>> Hi Jerome,
>>>>>      Thanks for your reply.
>>>>>
>>>>> On 2024/10/18 16:39, Jerome Brunet wrote:
>>>>>> [ EXTERNAL EMAIL ]
>>>>>> On Fri 18 Oct 2024 at 10:28, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>>>
>>>>>>> On 18/10/2024 10:10, Xianwei Zhao via B4 Relay wrote:
>>>>>>>> From: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>>>>>>>
>>>>>>>> Add the new compatible name for Amlogic A4 pin controller, and add
>>>>>>>> a new dt-binding header file which document the detail pin names.
>>>>>> the change does not do what is described here. At least the description
>>>>>> needs updating.
>>>>>>
>>>>>
>>>>> Will do.
>>>>>
>>>>>> So if the pin definition is now in the driver, does it mean that pins have
>>>>>> to be referenced in DT directly using the made up numbers that are
>>>>>> created in pinctrl-amlogic-a4.c at the beginning of patch #2 ?
>>>>>>
>>>>>
>>>>> Yes.
>>>>>
>>>>>> If that's case, it does not look very easy a read.
>>>>>>
>>>>>
>>>>> It does happen. The pin definition does not fall under the category of
>>>>> binding.
>>>>>
>>>>> https://lore.kernel.org/all/106f4321-59e8-49b9-bad3-eeb57627c921@amlogic.com/
>>>>
>>>> So the expectation is that people will write something like:
>>>>
>>>>    reset-gpios = <&gpio 42 GPIO_ACTIVE_LOW>;
>>>>
>>>> And others will go in the driver to see that is maps to GPIOX_10 ? the number
>>>> being completly made up, with no link to anything HW/Datasheet
>>>> whatsoever ?
>>>>
>>>> This is how things should be done now ?
>>>
>>> Why would you need to do this? Why it cannot be <&gpio 10
>>> GPIO_ACTIVE_LOW>, assuming it is GPIO 10?
>>>
>>> Bindings have absolutely nothing to do with it. You have GPIO 10, not
>>> 42, right?
>>
>> There's no 1:1 mapping between the number and the pin on Amlogic platforms,
>> so either a supplementary gpio phandle cell is needed to encode the gpio pin
>> group or some bindings header is needed to map those to well known identifiers.
> 
> So I assume this is not linear mapping (simple offset)? If so, this fits
> the binding header with identifiers, but I have impression these were
> not really used in earlier versions of this patchset. Instead some offsets:
> https://lore.kernel.org/all/20241014-a4_pinctrl-v2-1-3e74a65c285e@amlogic.com/
> 
> and pre-proccessor.
> 
> These looked almost good:
> https://lore.kernel.org/all/20240613170816.GA2020944-robh@kernel.org/
> 
> but then 0 -> 0
> 1 -> 1
> so where is this need for IDs?

???

Of courses the first pins maps to linear values...

> 
> See also last comment from Rob in above email.

OK so I looked and v2 was in fact correct:
https://lore.kernel.org/all/20241014-a4_pinctrl-v2-1-3e74a65c285e@amlogic.com/

====><=================
+/* Standard port */
+#define GPIOB_START	0
+#define GPIOB_NUM	14
+
+#define GPIOD_START	(GPIOB_START + GPIOB_NUM)
+#define GPIOD_NUM	16
+
+#define GPIOE_START	(GPIOD_START + GPIOD_NUM)
+#define GPIOE_NUM	2
+
+#define GPIOT_START	(GPIOE_START + GPIOE_NUM)
+#define GPIOT_NUM	23
+
+#define GPIOX_START	(GPIOT_START + GPIOT_NUM)
+#define GPIOX_NUM	18
+
+#define PERIPHS_PIN_NUM	(GPIOX_START + GPIOX_NUM)
+
+/* Aobus port */
+#define GPIOAO_START	0
+#define GPIOAO_NUM	7
+
+/* It's a special definition, put at the end, just 1 num */
+#define	GPIO_TEST_N	(GPIOAO_START +  GPIOAO_NUM)
+#define	AOBUS_PIN_NUM	(GPIO_TEST_N + 1)
+
+#define AMLOGIC_GPIO(port, offset)	(port##_START + (offset))
====><=================

is exactly what rob asked for, and you nacked it.

Neil


> 
> Best regards,
> Krzysztof
> 


