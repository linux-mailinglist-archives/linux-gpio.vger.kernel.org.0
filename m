Return-Path: <linux-gpio+bounces-23560-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 37620B0BD87
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 09:18:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CAE717BA32
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Jul 2025 07:18:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75D1428030C;
	Mon, 21 Jul 2025 07:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HT2WtPZp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D126BA36;
	Mon, 21 Jul 2025 07:18:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753082284; cv=none; b=iFa7xMfc2XpXmttFMTKKqwENDxeKEx6g3Jo0ALQ/oNPS2wfLLlsV8Ts7GZUecVQ6879AWSDD2yj4c/mG9fIQZC7jRCD754ukR0xdsaAH2Zy2ha3IHXqAt5Hu71vPIaJcX29H05arCaPM5G4w72KElEXAdpsfSTzaeb0WUnpeqRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753082284; c=relaxed/simple;
	bh=1s2KWA7tcb/MOyIOVFgvc6VCEGCoanOpC0pWVed+jWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lKjpRYRR0PBPzO58bB4jo//xnkHkWTQzOqfguIGJ2RwIIShk7Kbh4Eepycu/pWmO8+jLwMXKH9o3otqi3imegWxBf40HWwcBYdvvk/CnyN5CKg65kqKrUGTlf/M6vJebFBr3pnRP0uDSV4g63AAAiHAlshQET0bn3o6Lwv429MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HT2WtPZp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07355C4CEED;
	Mon, 21 Jul 2025 07:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753082283;
	bh=1s2KWA7tcb/MOyIOVFgvc6VCEGCoanOpC0pWVed+jWM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HT2WtPZpN58l+taN0yRBydcUEukBxJNSQtelllZMQs6BB2IaOMCXK16LojQHy2Kpw
	 bJxJ3eN9z3TPTYq064MEcEZneXeSq2mh7Y1ejCTVk1Uh0XwTlUPhQYkAdVPC/Ieix3
	 gUjnvYWMD/PDEz7UGfjmdE6cDJWoekgKEC51yAL4dhsLmWedWbcau5zxiY2KnTSV/a
	 AbpeD0MWRzGjrg8QGI+FPtObFMJzFq35ZLYJ7DM0Pa0PsMPwLkRGkkOdEqpNBXVAir
	 mLJKMM1CvCuTLtxAr8bCFPw6nCq/FBTIrL3F/a4V0EOrU6mCEWD+7etGruH4dNKbmc
	 +lhuZ2h2rUGNQ==
Message-ID: <d0d55fe7-27d5-47e2-9c64-aa0f01eaa772@kernel.org>
Date: Mon, 21 Jul 2025 09:17:53 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/16] arm64: dts: axis: Add initial device tree support
To: sungmin park <smn1196@coasia.com>, ksk4725@coasia.com,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa
 <tomasz.figa@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Ravi Patel <ravi.patel@samsung.com>
Cc: kenkim <kenkim@coasia.com>, Jongshin Park <pjsin865@coasia.com>,
 GunWoo Kim <gwk1013@coasia.com>, HaGyeong Kim <hgkim05@coasia.com>,
 GyoungBo Min <mingyoungbo@coasia.com>,
 Pankaj Dubey <pankaj.dubey@samsung.com>, Shradha Todi
 <shradha.t@samsung.com>, Inbaraj E <inbaraj.e@samsung.com>,
 Swathi K S <swathi.ks@samsung.com>, Hrishikesh <hrishikesh.d@samsung.com>,
 Dongjin Yang <dj76.yang@samsung.com>, Sang Min Kim
 <hypmean.kim@samsung.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@axis.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, soc@lists.linux.dev
References: <20250710002047.1573841-1-ksk4725@coasia.com>
 <20250710002047.1573841-15-ksk4725@coasia.com>
 <5998de2a-f3ae-46bf-a975-081da20bab03@kernel.org>
 <79482a4ec841743af1ef13ea9eea58bada47c42f.camel@coasia.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <79482a4ec841743af1ef13ea9eea58bada47c42f.camel@coasia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 21/07/2025 09:08, sungmin park wrote:
>>> index fa1e04e87d1d..371005f3f41a 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -2320,6 +2320,20 @@ F:       drivers/crypto/axis
>>>  F:     drivers/mmc/host/usdhi6rol0.c
>>>  F:     drivers/pinctrl/pinctrl-artpec*
>>>  
>>> +ARM/ARTPEC ARM64 MACHINE SUPPORT
>>
>> This is samsung soc, so I need a pattern for that as well as I will
>> be
>> handling patches.
> 
> Can you please explain what you mean to say?


Something like I sent for Tesla the same day or shortly after I
commented on this.

>  
>>
>>> +M:     Jesper Nilsson <jesper.nilsson@axis.com>
>>> +M:     Ravi Patel <ravi.patel@samsung.com>
>>> +M:     SeonGu Kang <ksk4725@coasia.com>
>>> +M:     SungMin Park <smn1196@coasia.com>
>>
>> Please keep only maintainers who will actually perform reviews of the
>> code. I am not even sure if this is worth separate entry outside of
>> Samsung. Please list the IP blocks which are not Samsung here.

Are you going to implement this in the next patch?

> 
> Is it fine if I merge the list with existing ARTPEC entry?

No. Did you read my message? I am not maintainer of existing ARTPEC SoC.


> Samsung and Coasia entry can be removed from list as Axis will be only
> maintaining the ARTPEC-8 SoC in future.
> Please suggest your opinion here.
> 
>>
>>> +L:     linux-arm-kernel@lists.infradead.org (moderated for non-
>>> subscribers)
>>> +L:     linux-samsung-soc@vger.kernel.org
>>> +L:     linux-arm-kernel@axis.com
>>> +S:     Maintained
>>> +F:     Documentation/devicetree/bindings/clock/axis,artpec*-
>>> clock.yaml
>>> +F:     arch/arm64/boot/dts/axis/
>>> +F:     drivers/clk/samsung/clk-artpec*.c
>>> +F:     include/dt-bindings/clock/axis,artpec*-clk.h
>>> +
>>>  ARM/ASPEED I2C DRIVER
>>>  M:     Ryan Chen <ryan_chen@aspeedtech.com>
>>>  R:     Benjamin Herrenschmidt <benh@kernel.crashing.org>
>>> diff --git a/arch/arm64/Kconfig.platforms
>>> b/arch/arm64/Kconfig.platforms
>>> index 8b76821f190f..418ee47227c1 100644
>>> --- a/arch/arm64/Kconfig.platforms
>>> +++ b/arch/arm64/Kconfig.platforms
>>> @@ -40,6 +40,19 @@ config ARCH_APPLE
>>>           This enables support for Apple's in-house ARM SoC family,
>>> such
>>>           as the Apple M1.
>>>  
>>> +config ARCH_ARTPEC
>>> +       bool "Axis Communications ARTPEC SoC Family"
>>> +       help
>>> +          This enables support for the ARMv8 based ARTPEC SoC
>>> Family.
>>> +
>>> +config ARCH_ARTPEC8
>>
>> No, drop. One ARCH symbol.
>>
>>> +       bool "Axis ARTPEC-8 SoC Platform"
>>> +       depends on ARCH_ARTPEC
>>> +       depends on ARCH_EXYNOS
>>
>> And that's the proof that this is Samsung SoC.
> 
> Should I move the axis folder inside exynos just like google did? In
> that case we don't need separate ARCH entry anymore.
> Or should I follow the tesla FSD style to add axis folder outside
> exynos? In that case I will keep ARCH_ARTPEC entry only.
> Please suggest your opinion here.


You did not describe the hardware really. Neither in commit msg, nor in
cover letter nor here where I asked to list the non-Samsung IP blocks. I
will not provide you guidelines based on magic crystal ball guesses.


Best regards,
Krzysztof

