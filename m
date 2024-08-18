Return-Path: <linux-gpio+bounces-8787-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCBF955F2A
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Aug 2024 23:06:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E44971C20958
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Aug 2024 21:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7717E1552EB;
	Sun, 18 Aug 2024 21:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g5KSCcd2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B44433C1;
	Sun, 18 Aug 2024 21:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724015181; cv=none; b=CbAkHn6TgkME3cbUuLzYSba8bOK8M53D1dPpyMC5yEUzp+gqJqV3IYjH1RCIo5VWgLR06tttYsQ76vbaR1eQnLECYvVvpbYOr++onvrxnMGyZXnkjE2BwsMvBcFEWoAVNDc7Wp7zkOWwK3Gf6/Bw9AOs9X3nrGQKJ7IemywuUmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724015181; c=relaxed/simple;
	bh=ObcgLOxpgK8bY4SRE/eMxIPMQ4LCDmvUN8zXv0v2ZnI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZhaLakQec7GVo/ixSLuO+5G0owIl8T95DcYwIYd1WYCWuiB3XGHMKg2ESz/Z1qhNn3+gIJgwI3EVErPBI795+HaUuOQZY0IllqS0XYcRGPRgrO547lhNvWbz0eeVr5EB2W55wg9iDtgpQNCinFzib2a3KbbsAJxSDygOfLLydWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g5KSCcd2; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a77ec5d3b0dso412074766b.0;
        Sun, 18 Aug 2024 14:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724015178; x=1724619978; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZbDQHOHZYxmYfyPdBHO+9gNiu0eiIio1Te+MtdXcM8U=;
        b=g5KSCcd2T0HAe2MfkRFvBOgba4eEnFAVBHRhjcWyQ49jDl20zu8fyu3GuzrKbHjf53
         0aF3BF4HOK3Lx5siK9EXXZLIQuMEoDs+aQ/2uHRuYt3lEwRELMVcycNubdK6beTSWKsP
         9B3TGEtENEa/NaAohQSK/2wHvAK2i+ioHmsk7VgCjrRiNQ2LaU3IOBpm6Z4U63rPkrUV
         3M/kM6mXuJCfJnRkftKW8BdoqSWLkDqrqtZd5p5XQcls52LvsHQH48+cedJH01/jtPRY
         xHvIJPNo2v8SWebPPuun3yCb2MYclB8Ey4E3GqmIyilwmj9PDNqHBwhvLfEF1BVjUoAO
         lwZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724015178; x=1724619978;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZbDQHOHZYxmYfyPdBHO+9gNiu0eiIio1Te+MtdXcM8U=;
        b=uhq8n/DZjdR0TJMqFlL9rkQubdncMSVyq+tspG+4wK0lfHwYSy1cj/iVR5GTm5j13w
         EXlEMSB2hLIRe5yQXbJBnYvepQ1eajaC9CW5p/wVlExABLpFVIl6TNBhuBmS92WGfjxB
         xzLzjsIhQ+Gr6GQUkmS49+V3Hi8Q3h54M6ZgQahsizqj108XSyRj0/XsAP5G3pWaHWZb
         ZDfxJfO9DayXeeiO8RAurDqh9LSX4gq1JpeRHF1dmq54yO4iMAFhFit1GomL97tFwVYo
         uEUesE4rPFK/46YIO+HdXs7+Nh3XrnZxSNz0QOY38rjCiuE1BsV5AYEi2a6riOlu5kjK
         dMFA==
X-Forwarded-Encrypted: i=1; AJvYcCV8bNB6KNnJJQDXuVMyefnqPhYXJWYVKPwwYq8HbF9VKo3wODPkgi+talkUuir3mlFlyrn+dzZL31BMT1DK2glH02iMTcoVHOpk24c3io5zN37xFzoYgA7m+nB8b1GHdCwxubcXLT4F+1ZGUTGUsKmf5yXWE6TSkMDwj1RyWrtsHEFonwo=
X-Gm-Message-State: AOJu0Yyxxbbn99bLb2Q9R+Pjv4xks183KDkBe2xJfGpY4l01+8DIClio
	GDhVILvp/68I+0tTP70B4SDsM6fxfBOC1W+kLZWZeSjh2oTSDPPT
X-Google-Smtp-Source: AGHT+IF1jpbpV9chD1AVHYHSsvGDUDeitGvGSxeyTW1Z7qojasi9ONoPCxeVydF8RcshQWv04vAxhw==
X-Received: by 2002:a17:907:f786:b0:a7a:83f8:cfcf with SMTP id a640c23a62f3a-a8392954409mr666255666b.35.1724015177386;
        Sun, 18 Aug 2024 14:06:17 -0700 (PDT)
Received: from [192.168.1.106] (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838d023dsm549401766b.64.2024.08.18.14.06.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Aug 2024 14:06:17 -0700 (PDT)
Message-ID: <2bc3b0fa-2cd1-e5d2-c324-ad466537d1b3@gmail.com>
Date: Mon, 19 Aug 2024 00:06:15 +0300
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 08/10] arm64: dts: exynos: Add initial support for
 exynos8895 SoC
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240807082843.352937-1-ivo.ivanov.ivanov1@gmail.com>
 <20240807082843.352937-9-ivo.ivanov.ivanov1@gmail.com>
 <e6b4e0d8-7183-4ff4-a373-cb1c0c98d993@kernel.org>
 <5274b8a1-b81c-3979-ed6c-3572f6a6cfc2@gmail.com>
 <24ff07b6-a685-471f-8249-3e3450e2d3d3@kernel.org>
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
In-Reply-To: <24ff07b6-a685-471f-8249-3e3450e2d3d3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 8/9/24 08:48, Krzysztof Kozlowski wrote:
> On 07/08/2024 13:20, Ivaylo Ivanov wrote:
>> On 8/7/24 12:20, Krzysztof Kozlowski wrote:
>>> On 07/08/2024 10:28, ivo.ivanov.ivanov1@gmail.com wrote:
>>>> From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>>>
>>>> Exynos 8895 SoC is an ARMv8 mobile SoC found in the Samsung Galaxy
>>>> S8 (dreamlte), S8 Plus (dream2lte), Note 8 (greatlte) and the Meizu
>>>> 15 Plus (m1891). Add minimal support for that SoC, including:
>>>>
>>>> - All 8 cores via PSCI
>>>> - ChipID
>>>> - Generic ARMV8 Timer
>>>> - Enumarate all pinctrl nodes
>>>>
>>>> Further platform support will be added over time.
>>>>
>>>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>>> ---
>>>>  .../boot/dts/exynos/exynos8895-pinctrl.dtsi   | 1378 +++++++++++++++++
>>>>  arch/arm64/boot/dts/exynos/exynos8895.dtsi    |  253 +++
>>>>  2 files changed, 1631 insertions(+)
>>>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
>>>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8895.dtsi
>>>>
>>>> diff --git a/arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
>>>> new file mode 100644
>>>> index 000000000..1dcb61e2e
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
>>>> @@ -0,0 +1,1378 @@
>>>> +// SPDX-License-Identifier: BSD-3-Clause
>>>> +/*
>>>> + * Samsung's Exynos 8895 SoC pin-mux and pin-config device tree source
>>>> + *
>>>> + * Copyright (c) 2024, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>>> + */
>>>> +
>>>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>>>> +#include "exynos-pinctrl.h"
>>>> +
>>>> +&pinctrl_alive {
>>>> +	gpa0: gpa0 {
>>> I do not believe this was tested. See maintainer SoC profile for Samsung
>>> Exynos.
>>>
>>> Limited review follows due to lack of testing.
>>>
>>>
>>>> +};
>>>> diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
>>>> new file mode 100644
>>>> index 000000000..3ed381ee5
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
>>>> @@ -0,0 +1,253 @@
>>>> +// SPDX-License-Identifier: BSD-3-Clause
>>>> +/*
>>>> + * Samsung's Exynos 8895 SoC device tree source
>>>> + *
>>>> + * Copyright (c) 2024, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>>> + */
>>>> +
>>>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>>>> +
>>>> +/ {
>>>> +	compatible = "samsung,exynos8895";
>>>> +	#address-cells = <2>;
>>>> +	#size-cells = <1>;
>>>> +
>>>> +	interrupt-parent = <&gic>;
>>>> +
>>>> +	aliases {
>>>> +		pinctrl0 = &pinctrl_alive;
>>>> +		pinctrl1 = &pinctrl_abox;
>>>> +		pinctrl2 = &pinctrl_vts;
>>>> +		pinctrl3 = &pinctrl_fsys0;
>>>> +		pinctrl4 = &pinctrl_fsys1;
>>>> +		pinctrl5 = &pinctrl_busc;
>>>> +		pinctrl6 = &pinctrl_peric0;
>>>> +		pinctrl7 = &pinctrl_peric1;
>>>> +	};
>>>> +
>>>> +	arm-a53-pmu {
>>> Are there two pmus?
>> Hm. The Downstream kernel has them all under one node with compatible
>>
>> 'arm,armv8-pmuv3', same as with Exynos 7885. So it should have two PMUs,
>>
>> one for each cluster.
>>
>>
>> Considering the second cluster consists of Samsung's custom Mongoose M2
>>
>> cores, what would be the most adequate thing to do? Keep the first PMU as
>>
>> "arm,cortex-a53-pmu" and use the SW model "arm,armv8-pmuv3" for the
>>
>> second PMU? I doubt guessing if these mongoose cores are based on already
>>
>> existing cortex cores is a great idea.
> I was just wondering why there is only one and called a53. I am not sure
> what should be for the second, but rather not a software model.
>
> Best regards,
> Krzysztof
>
Well, as far as I can tell there are 3 options:

- use an already defined PMU model for another core (ex. A73)

- submit another patch to add a custom mongoose-specific PMU model

- omit the mongoose cores PMU entirely

My guess is that omitting it entirely with a comment that mentions the

issue will be good enough, at least for now. Is that OK for the v3?


Best regards,

Ivaylo


