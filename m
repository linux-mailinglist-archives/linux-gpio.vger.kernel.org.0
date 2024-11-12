Return-Path: <linux-gpio+bounces-12844-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A076B9C5079
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 09:24:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61220285E12
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Nov 2024 08:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D329920B7EE;
	Tue, 12 Nov 2024 08:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lt2oP+J5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA99C20A5E6
	for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2024 08:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731399876; cv=none; b=LD+mNdviiMb6PtADfrqRrnrY9PxgFzJFnNskYyQ3jOF2NLQZUic7KQLcrhp/1OL0d3XEM5zAHv849FS9xVMqYWDENWSlH0dUkQV+kkEnUQTOsIF27JQNR1gKybUi3m2U+RNdwIL2BNJVN1qocEelmSqpXJsaZBxZc9+90olQIe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731399876; c=relaxed/simple;
	bh=jHxYyuw2zVHpcIGpYA5DH8Rcme5IdvR1VCxWiXElzms=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=pEV9nfk3ph15DcTIqWKfFS7prEdcycU61RElvrQ0yGw1e21h0uXJfUFcS/0NtTzyC494PkzBmbwOsYcEU8hPJ4bsUu1l4IP0g8r9VMGV45w1iDz2UF04vBhSQX7l70y1yA2SZSLIjEzIQUnzhCcVOT7Ca/Tevm/r9Y8Rc0pYhAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lt2oP+J5; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43161e7bb25so43455035e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 12 Nov 2024 00:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731399873; x=1732004673; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BHG/302xW3aLkt5O2SfZxjbGRcjYz+4y3Ps37Vgg7Y4=;
        b=Lt2oP+J5Cxk02EmLh1AkfqItEtKxFfHBFoXZYVIV3YJg9JgzwUf831rtdQKF/c1yXR
         z1lSVk2jgC+OT5KNf0QDKo7Ma/eJQSfBJw3n96rDgGWZN31FcUNSPS8n0oEXWQyNFwA+
         KjSiMCLsSUnswxjdlLSOTkp3Xy/PR56Ca0L0uIXa5B67xtOv/yrDtzx5WlOIfzM3AlYu
         6Jlzj6jnO6Jm+01li8asUv/puTioME8nHnbxJL+Uyljc/C2m66lM7fbrJDYkscAfjshi
         CyqZn5zh1BCnIKQrx6RKvSPPoewW2d6f0Q0VxvcbvJyvYxG3Dgnnkq+6OOeDXKXCQ6jJ
         PeHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731399873; x=1732004673;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BHG/302xW3aLkt5O2SfZxjbGRcjYz+4y3Ps37Vgg7Y4=;
        b=blcX5sEtLNz5mkILY9MZsLnZyxEI7EgqR+vpymEmRDS8Z5YdN3+a8qjMW0VI/uMkgC
         yl0Ry14q1+4D41S6qt8Zgd653TRL5EwMSF/1Cd7IImgEjt5c5lMuAIBgLlLb2yATEWNn
         NmQJ/spE9r8XUwcEm0AB8nSDq9trK4Wo3AvrELfCtoz9ra89hktXSunCUH9fR3yDBkWZ
         odVVpuRECnPKYPVbsgy1fFjfSI1OJcEEDTn7M6JwIqoKNf2cqk2RrCk7W1yRKYrhZ0vv
         LvyGib0NIkGe6NuPZvO08rDODdrR+HQFF7Hm9Z5ptHlv9Efc5Bz4LaeHA3/dtxP1R+sp
         2eBA==
X-Gm-Message-State: AOJu0YyfZT2tGDDDSjlskA5pCVU9eCVv2zlJGVJfH6QGw0XC5VohZaC6
	1zIiWPSw7HElfkDqUwDKHti4EGcaJrftRUFs8CUm6f2PsigtSCpXOgABjq5q5qI=
X-Google-Smtp-Source: AGHT+IGZ0+JGsE9MkHXAcU6IkVnXDchLT2F09ZqRiYJ04+9+dW1daenHhuh5nEca5lNjPLx9FocpcA==
X-Received: by 2002:a05:600c:b91:b0:431:5e53:2dc4 with SMTP id 5b1f17b1804b1-432cce680efmr13102955e9.6.1731399872977;
        Tue, 12 Nov 2024 00:24:32 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:860c:aff4:d0e9:9db8? ([2a01:e0a:982:cbb0:860c:aff4:d0e9:9db8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432b0566544sm196515055e9.24.2024.11.12.00.24.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 00:24:32 -0800 (PST)
Message-ID: <97e2b1e4-1763-42c4-a3f0-986492ecfd97@linaro.org>
Date: Tue, 12 Nov 2024 09:24:31 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH RFC v4 0/4] Pinctrl: A4: Add pinctrl driver
To: Xianwei Zhao <xianwei.zhao@amlogic.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20241101-a4_pinctrl-v4-0-efd98edc3ad4@amlogic.com>
 <27aa3716-1d28-4da8-80e6-212d7f94d193@linaro.org>
 <84bbb8b3-d638-47e5-a0e9-371e9e56c89f@amlogic.com>
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
In-Reply-To: <84bbb8b3-d638-47e5-a0e9-371e9e56c89f@amlogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/11/2024 04:26, Xianwei Zhao wrote:
> Hi Neil,
>     Thanks for your reply.
> 
> On 2024/11/10 20:24, Neil Armstrong wrote:
>> [ EXTERNAL EMAIL ]
>>
>> Hi,
>>
>> Le 01/11/2024 à 09:27, Xianwei Zhao via B4 Relay a écrit :
>>> Add pinctrl driver support for Amloigc A4 SoC
>>>
>>> I want to find out what kind of solution is feasible to
>>> meet the needs of all parties. This RFC verion is one of them.
>>>
>>> All of Amogic SoCs GPIO device requirement is met here by
>>> adding GPIO bank definition instead of the pin definition.
>>> Binding header files will no longer be added to future
>>> SoCs's pin devices.
>>>
>>> The pinctrl software only adds insterface of of_xlate to support
>>> for transformation without affecting the overall framework and
>>> is compatible with previous drivers.
>>>
>>> The code in DTS file is also readable when using GPIO, as below:
>>>
>>> reset-gpios = <&gpio AMLOGIC_GPIO(AMLOGIC_GPIO_X, 6) GPIO_ACTIVE_LOW>;
>>
>> Fine, but why not use 3 cells instead of this macro ? Since you introduced the
>> custom xlate, parsing the 3 cells would be easier that using a macro:
>>
>> reset-gpios = <&gpio AMLOGIC_GPIO_X 6 GPIO_ACTIVE_LOW>;
>>
>> Neil
> 
> I was prepared to do this before, mainly later considering incompatible binding, using the original two parameter passing
> 
> If use three parameters, I  need to modify the corresponding binding property. in file:
> Documentation/devicetree/bindings/pinctrl/amlogic,meson-pinctrl-common.yaml
> 
>        "#gpio-cells":
>          const: 2
> It must be compatible with the current number of parameters(3)

Yes, you may move the #gpio-cells definition out of the common yaml
and define them in the soc spefic yaml and set it to 3 for a4.

Neil

> 
>>
>>>
>>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>>> ---
>>> Changes in v4:
>>> - Add interface of of_xlate support.
>>> - Add const for some variable.
>>> - Link to v3: https://lore.kernel.org/r/20241018-a4_pinctrl-v3-0-e76fd1cf01d7@amlogic.com
>>>
>>> Changes in v3:
>>> - Remove head file from binding.
>>> - Move GPIO define to file *.c.
>>> - Link to v2: https://lore.kernel.org/r/20241014-a4_pinctrl-v2-0-3e74a65c285e@amlogic.com
>>>
>>> Changes in v2:
>>> - Use one marco instead of all pin define.
>>> - Add unit name for dts node.
>>> - Link to v1: https://lore.kernel.org/all/20240611-a4_pinctrl-v1-0-dc487b1977b3@amlogic.com/
>>>
>>> ---
>>> Xianwei Zhao (4):
>>>        dt-bindings: pinctrl: Add support for Amlogic A4 SoCs
>>>        pinctrl: meson: add interface of of_xlate
>>>        pinctrl: meson: Add driver support for Amlogic A4 SoCs
>>>        arm64: dts: amlogic: a4: add pinctrl node
>>>
>>>   .../bindings/pinctrl/amlogic,meson-pinctrl-a1.yaml |    2 +
>>>   arch/arm64/boot/dts/amlogic/amlogic-a4.dtsi        |   36 +
>>>   drivers/pinctrl/meson/Kconfig                      |    6 +
>>>   drivers/pinctrl/meson/Makefile                     |    1 +
>>>   drivers/pinctrl/meson/pinctrl-amlogic-a4.c         | 1321 ++++++++++++++++++++
>>>   drivers/pinctrl/meson/pinctrl-meson.c              |    4 +
>>>   drivers/pinctrl/meson/pinctrl-meson.h              |    4 +
>>>   include/dt-bindings/gpio/amlogic-gpio.h            |   50 +
>>>   8 files changed, 1424 insertions(+)
>>> ---
>>> base-commit: 58e2d28ed28e5bc8836f8c14df1f94c27c1f9e2f
>>> change-id: 20241012-a4_pinctrl-09d1b2a17e47
>>>
>>> Best regards,
>>


