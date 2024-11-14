Return-Path: <linux-gpio+bounces-12998-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 678E49C8607
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 10:25:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1FBA7B27838
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2024 09:21:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 135691DFD89;
	Thu, 14 Nov 2024 09:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q9QoGo+/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1475B1D1724
	for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 09:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731576107; cv=none; b=SoYqISYcUwaIjZItAOwlIlPXY/JKtFiXzCGSBNfF4A8ynHy6W5z9wXtMB2xF5Yk8H6J97GBInWUliCLsTLQgMqrK+g8E5nYTkid/0/fX9gwp1DIQa4q7l/56RnLfrR/k30o7vDSGeevv0/pS0MFWx+PBQDr7ck83PXiGoV/Labc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731576107; c=relaxed/simple;
	bh=pfQ1EsxFuQyYpQVbYK9aExgCanpy9u/AbGrn6mzrxAM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=SUGmSqgxaX899vdD5R2cJyyxBDBjISetN0x1pkn79atssKvqfZmrqjqY3A51yZ9V6A8fS8kaOR4dRA5ygwOqGWI3+vJDOx1Uf70RwkFz49MkCxhYA6QZ71138LgkYEXdo89MIK6RKQc0QvIVPH319FeXb0PoOELl5CeZVqQs35c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q9QoGo+/; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-37d41894a32so181525f8f.1
        for <linux-gpio@vger.kernel.org>; Thu, 14 Nov 2024 01:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731576104; x=1732180904; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JNbRU7FU8XNSE+dI3k8p5qd8iE3w171o5k5wliBXgFc=;
        b=Q9QoGo+/c9T+OIi80u8FISDlCOBxt3O/OVIOfFGI04lSY9ntJa6z0IDE9BFdaListN
         Lk932VOxpPbih70kLghNJ5zR05UNXN2OPONYbn/F1L/e96eMP25ZMV1g5KVQ7ZGw00zi
         /jHi6lywjMG5i81Au1qdf70aTGZMIxGiFCPXWY8M+zZm1T6o+1nTIGQAysGjVvpm3VSc
         Ap83vLx5bjX8N7ZAwULZqqlSwD55g7eENz/m7SjW9FT8hMMKKA2gfchA9ch1DuToA+ek
         ncmlL8w17fTDfpJVXxl3qjdeAGUYc3o8ZcJeNtghDRZwtyigo2y8udzT/+OSE4JNV0o7
         GUFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731576104; x=1732180904;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JNbRU7FU8XNSE+dI3k8p5qd8iE3w171o5k5wliBXgFc=;
        b=BE7FqRVyHg1g6Na43Kww4rzJ13DaOJdrhfrkkv//S5FXDHCG1dAaPwl5WRp3gop+qa
         knuJXaOQ4h6S05ObNj58CNScWkf4JfOBvhuGUaYAHYjF698WASoaRxEmL6k+wWl0xXFW
         75LaPW6YJcjWj3Y6eXUejj0AQ++UOQsHI+TKKMzxEHBk2R26mhugroeXrBKJO1J//xvk
         0hzBSUQn2Rcmjy9BH3HCfWwBJUDXgtbE77W3HLW7ZWMFqAXSbaeW0Ap+Bm+4nwwgNukF
         ma0A7m/tKg0aX3xkSr2IT/+Z3K2BZnT/3dK7ASgXjzn71Nqd8CBELizvA6UQdpP7t/SP
         nUFg==
X-Forwarded-Encrypted: i=1; AJvYcCWht+kyQfnN+3d8HH/hmzbGpicHPMi91yp6G2bCvMETnJ1Ax7kP0rc3ESKtrVttF+GumBQ0tdLfRLeP@vger.kernel.org
X-Gm-Message-State: AOJu0YxVVC+h3B8uAWrzbgxmU0b/tOZ3XQgf81jtR6NbN7ImwkeQev6/
	j+Tv+mKCqqzjbCTdgijBDoSaqtFfOZeBWbeIM/FFAfeMmlOFpVYt5kjFalA4sE4=
X-Google-Smtp-Source: AGHT+IGM57ayVcNIkg/6jNzPlgjqqAGpWcaIJPQpCV0fYV9Ae2IGCnZ+nme2wZAoiNPas+AMtq+mKw==
X-Received: by 2002:a5d:598c:0:b0:371:8685:84c with SMTP id ffacd0b85a97d-382140394cdmr1793139f8f.15.1731576103705;
        Thu, 14 Nov 2024 01:21:43 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:a62a:6bba:b737:406e? ([2a01:e0a:982:cbb0:a62a:6bba:b737:406e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3821adada24sm936148f8f.40.2024.11.14.01.21.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 01:21:43 -0800 (PST)
Message-ID: <1764b1b4-336d-4ca5-ab21-8213691a9622@linaro.org>
Date: Thu, 14 Nov 2024 10:21:42 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH v6 4/5] pinctrl: meson: Add driver support for Amlogic A4
 SoCs
To: Rob Herring <robh@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241113-a4_pinctrl-v6-0-35ba2401ee35@amlogic.com>
 <20241113-a4_pinctrl-v6-4-35ba2401ee35@amlogic.com>
 <20241113180405.GA653353-robh@kernel.org>
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
In-Reply-To: <20241113180405.GA653353-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/11/2024 19:04, Rob Herring wrote:
> On Wed, Nov 13, 2024 at 03:29:42PM +0800, Xianwei Zhao wrote:
>> Add a new pinctrl driver for Amlogic A4 SoCs which share
>> the same register layout as the previous Amlogic S4.
>>
>> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> ---
>>   drivers/pinctrl/meson/Kconfig              |    6 +
>>   drivers/pinctrl/meson/Makefile             |    1 +
>>   drivers/pinctrl/meson/pinctrl-amlogic-a4.c | 1324 ++++++++++++++++++++++++++++
>>   3 files changed, 1331 insertions(+)
>>
>> diff --git a/drivers/pinctrl/meson/Kconfig b/drivers/pinctrl/meson/Kconfig
>> index cc397896762c..3e90bb5ec442 100644
>> --- a/drivers/pinctrl/meson/Kconfig
>> +++ b/drivers/pinctrl/meson/Kconfig
>> @@ -67,6 +67,12 @@ config PINCTRL_MESON_S4
>>   	select PINCTRL_MESON_AXG_PMX
>>   	default y
>>   
>> +config PINCTRL_AMLOGIC_A4
>> +	tristate "Amlogic A4 SoC pinctrl driver"
>> +	depends on ARM64
>> +	select PINCTRL_MESON_AXG_PMX
>> +	default y
>> +
>>   config PINCTRL_AMLOGIC_C3
>>   	tristate "Amlogic C3 SoC pinctrl driver"
>>   	depends on ARM64
>> diff --git a/drivers/pinctrl/meson/Makefile b/drivers/pinctrl/meson/Makefile
>> index 9e538b9ffb9b..c92a65a83344 100644
>> --- a/drivers/pinctrl/meson/Makefile
>> +++ b/drivers/pinctrl/meson/Makefile
>> @@ -10,5 +10,6 @@ obj-$(CONFIG_PINCTRL_MESON_AXG) += pinctrl-meson-axg.o
>>   obj-$(CONFIG_PINCTRL_MESON_G12A) += pinctrl-meson-g12a.o
>>   obj-$(CONFIG_PINCTRL_MESON_A1) += pinctrl-meson-a1.o
>>   obj-$(CONFIG_PINCTRL_MESON_S4) += pinctrl-meson-s4.o
>> +obj-$(CONFIG_PINCTRL_AMLOGIC_A4) += pinctrl-amlogic-a4.o
>>   obj-$(CONFIG_PINCTRL_AMLOGIC_C3) += pinctrl-amlogic-c3.o
>>   obj-$(CONFIG_PINCTRL_AMLOGIC_T7) += pinctrl-amlogic-t7.o
>> diff --git a/drivers/pinctrl/meson/pinctrl-amlogic-a4.c b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
>> new file mode 100644
>> index 000000000000..edc5f2ba2c8a
>> --- /dev/null
>> +++ b/drivers/pinctrl/meson/pinctrl-amlogic-a4.c
>> @@ -0,0 +1,1324 @@
>> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
>> +/*
>> + * Pin controller and GPIO driver for Amlogic A4 SoC.
>> + *
>> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
>> + * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
>> + *         Huqiang Qin <huqiang.qin@amlogic.com>
>> + */
>> +
>> +#include "pinctrl-meson.h"
>> +#include "pinctrl-meson-axg-pmx.h"
>> +#include <dt-bindings/gpio/amlogic-gpio.h>
>> +
>> +/* Standard port */
>> +
>> +#define GPIOE_0				0
>> +#define GPIOE_1				1
>> +
>> +#define GPIOD_0				2
>> +#define GPIOD_1				3
>> +#define GPIOD_2				4
>> +#define GPIOD_3				5
>> +#define GPIOD_4				6
>> +#define GPIOD_5				7
>> +#define GPIOD_6				8
>> +#define GPIOD_7				9
>> +#define GPIOD_8				10
>> +#define GPIOD_9				11
>> +#define GPIOD_10			12
>> +#define GPIOD_11			13
>> +#define GPIOD_12			14
>> +#define GPIOD_13			15
>> +#define GPIOD_14			16
>> +#define GPIOD_15			17
> 
> The conversion from bank+index to a single index space seems less than
> ideal, and looks like a work-around to fit into the existing driver from
> a brief look at it.

Not really, it simply adds a custom xlate per SoC, nothing particulary hacky.

I was relunctant at first, but since Xianwei added the plumbing for a per-SoC
xlate, then it was easy to add 3-cells support.

> 
> If there's not really banks of GPIOs here, then DT shouldn't have them
> either. The question is does anything need to know the bank number
> and/or index? If it's only for human readability (and matching to
> datasheet), then just something like this can be done:
> 
> #define GPIOD(n) (2 + (n))

There's no linear mapping possible, each set of gpios is grouped into logical
"banks" per group of functions, and this grouping is also in the gpio controller
register space.

So it makes sense to split this in 2 with banks and offset, it maps the architecture
of the SoC, and with this scheme we only need to add the bindings for the
"banks" once since all the SoCs shares the same names.

It simplifies bindings, has minimal cost due to the 3 cells, and only requires slightly
more larger xlate function per SoC family.

Neil

> 
> Rob


