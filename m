Return-Path: <linux-gpio+bounces-24023-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D9AB1C23E
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 10:36:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E059017B004
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Aug 2025 08:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E2A2882BE;
	Wed,  6 Aug 2025 08:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YsUQtvZ5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6991A221275;
	Wed,  6 Aug 2025 08:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754469395; cv=none; b=jFy/5oBOycUSEG+ObAK5PB1+Bsl4NLxQg2jj4mYE9J/8pdw3eLCiDQ9lXuyT6Xctu5VDY74iQWjzJCs710DRRgThCSq7SdkN425V5y7A/OySctVS1CrMVSwYkbO/7s1a3saIBAyz+jZiArdqkz3jCAkODeD+ATBv4KpQ8yxYZsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754469395; c=relaxed/simple;
	bh=2vwmHfFUjvP9cAgG8fEZyvs48df+B/ns2gsYriOZ+u4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qxX4aoK0ECIgtir5+9OWgcRFkgrdGbnqdW8bGHc4TerPkjDleOWpIsewJUYfvmXnILO1hu1Rj/pmCF9L2iD9p36m1/QUpU04DL2u9EBZaXfaoLzZ34XTzvckJ1DUQjoPqWwZANzDzz0PZyxiGx/0x3DoEU2B19X547fiX+h2pLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YsUQtvZ5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA69C4CEF6;
	Wed,  6 Aug 2025 08:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754469395;
	bh=2vwmHfFUjvP9cAgG8fEZyvs48df+B/ns2gsYriOZ+u4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YsUQtvZ5pRJAcnvzdkIcHGT59XQwKXvQUS9noMo5dvbrK1UFWaX+8a0enDW3+tmKE
	 GYP7gb38xGpXnJZ+RaApC4tlOCjJV9q6Gh3zcWtueQiQlwYnauKgmfHvso8Vc7c1Rz
	 bmvQwDFR3+Xp95zdtbE2sXczUUg/1Rwpr+6qTWQF38V01kwfYWsyNE9Oe6eUDi8ex5
	 2085h3ygdrQWsTaYwSWfzWS6suhhmtsJDd6L+LFyZC/ZgVgRIkh+a/yX3EJ8q/PXZJ
	 EuRZE7m9zzIHEku2JP/ioDiB0X//4pYmCKbS6EOPwE65oO7UTWPSMrOu2quputKxIC
	 ttOsqV0WXt5Pg==
Message-ID: <e334f106-d9f3-4a21-8cdd-e9d23dd2755d@kernel.org>
Date: Wed, 6 Aug 2025 10:36:25 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/16] Add support for the Axis ARTPEC-8 SoC
To: Pankaj Dubey <pankaj.dubey@samsung.com>,
 'SeonGu Kang' <ksk4725@coasia.com>,
 'Jesper Nilsson' <jesper.nilsson@axis.com>,
 'Michael Turquette' <mturquette@baylibre.com>,
 'Stephen Boyd' <sboyd@kernel.org>, 'Rob Herring' <robh@kernel.org>,
 'Krzysztof Kozlowski' <krzk+dt@kernel.org>,
 'Conor Dooley' <conor+dt@kernel.org>,
 'Sylwester Nawrocki' <s.nawrocki@samsung.com>,
 'Chanwoo Choi' <cw00.choi@samsung.com>,
 'Alim Akhtar' <alim.akhtar@samsung.com>,
 'Linus Walleij' <linus.walleij@linaro.org>,
 'Tomasz Figa' <tomasz.figa@gmail.com>,
 'Catalin Marinas' <catalin.marinas@arm.com>, 'Will Deacon'
 <will@kernel.org>, 'Arnd Bergmann' <arnd@arndb.de>
Cc: 'kenkim' <kenkim@coasia.com>, 'Jongshin Park' <pjsin865@coasia.com>,
 'GunWoo Kim' <gwk1013@coasia.com>, 'HaGyeong Kim' <hgkim05@coasia.com>,
 'GyoungBo Min' <mingyoungbo@coasia.com>, 'SungMin Park'
 <smn1196@coasia.com>, 'Shradha Todi' <shradha.t@samsung.com>,
 'Ravi Patel' <ravi.patel@samsung.com>, 'Inbaraj E' <inbaraj.e@samsung.com>,
 'Swathi K S' <swathi.ks@samsung.com>, 'Hrishikesh'
 <hrishikesh.d@samsung.com>, 'Dongjin Yang' <dj76.yang@samsung.com>,
 'Sang Min Kim' <hypmean.kim@samsung.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@axis.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, soc@lists.linux.dev
References: <20250710002047.1573841-1-ksk4725@coasia.com>
 <847e908b-1073-46ea-93f3-1f36cc93d8b8@kernel.org>
 <bfdc2eddde554e1d1808dd8399bc6a693f681c9b.camel@coasia.com>
 <CGME20250721064006epcas5p4617b0450e69f72c94d2b3ae7b1d200e7@epcas5p4.samsung.com>
 <99977f38-f055-46ed-8eb0-4b757da2bcdd@kernel.org>
 <000501dc06ab$37f09440$a7d1bcc0$@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <000501dc06ab$37f09440$a7d1bcc0$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 06/08/2025 10:22, Pankaj Dubey wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzk@kernel.org>
>> Sent: Monday, July 21, 2025 12:10 PM
>> To: SeonGu Kang <ksk4725@coasia.com>; Jesper Nilsson
>> <jesper.nilsson@axis.com>; Michael Turquette <mturquette@baylibre.com>;
>> Stephen Boyd <sboyd@kernel.org>; Rob Herring <robh@kernel.org>;
>> Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley
>> <conor+dt@kernel.org>; Sylwester Nawrocki <s.nawrocki@samsung.com>;
>> Chanwoo Choi <cw00.choi@samsung.com>; Alim Akhtar
>> <alim.akhtar@samsung.com>; Linus Walleij <linus.walleij@linaro.org>;
>> Tomasz Figa <tomasz.figa@gmail.com>; Catalin Marinas
>> <catalin.marinas@arm.com>; Will Deacon <will@kernel.org>; Arnd Bergmann
>> <arnd@arndb.de>
>> Cc: kenkim <kenkim@coasia.com>; Jongshin Park <pjsin865@coasia.com>;
>> GunWoo Kim <gwk1013@coasia.com>; HaGyeong Kim
>> <hgkim05@coasia.com>; GyoungBo Min <mingyoungbo@coasia.com>;
>> SungMin Park <smn1196@coasia.com>; Pankaj Dubey
>> <pankaj.dubey@samsung.com>; Shradha Todi <shradha.t@samsung.com>;
>> Ravi Patel <ravi.patel@samsung.com>; Inbaraj E <inbaraj.e@samsung.com>;
>> Swathi K S <swathi.ks@samsung.com>; Hrishikesh
>> <hrishikesh.d@samsung.com>; Dongjin Yang <dj76.yang@samsung.com>;
>> Sang Min Kim <hypmean.kim@samsung.com>; linux-kernel@vger.kernel.org;
>> linux-arm-kernel@lists.infradead.org; linux-samsung-soc@vger.kernel.org;
>> linux-arm-kernel@axis.com; linux-clk@vger.kernel.org;
>> devicetree@vger.kernel.org; linux-gpio@vger.kernel.org; soc@lists.linux.dev
>> Subject: Re: [PATCH 00/16] Add support for the Axis ARTPEC-8 SoC
>>
>> On 21/07/2025 06:50, SeonGu Kang wrote:
>>> 2025-07-10 (목), 09:07 +0200, Krzysztof Kozlowski:
>>>> On 10/07/2025 02:20, ksk4725@coasia.com wrote:
>>>>> From: SeonGu Kang <ksk4725@coasia.com>
>>>>>
>>>>> Add basic support for the Axis ARTPEC-8 SoC.
>>>>> This SoC contains four Cortex-A53 CPUs and other several IPs.
>>>>>
>>>>> Patches 1 to 10 provide the support for the clock controller, which
>>>>> is similar to other Samsung SoCs.
>>>>>
>>>> You should explain here (and in DTS patches or the bindings) the
>>>> hardware, that this is Samsung SoC.
>>>>
>>>> You could also explain the differences from Exynos and proposed
>>>> handling of patches (because this is odd)
>>>>
>>>> Also, entire patchset has wrong and incomplete SoBs. Your SoB is
>>>> missing everywhere, others have wrong order.
>>>>
>>>> Please read submitting patches first.
>>>>
>>>
>>> This Custom SoC is owned by the Axis (OEM) and manufactured by the
>>> Samsung (ODM). It has standard Samsung specific IP blocks.
>>
>>
>> It is designed by Samsung. It is Samsung SoC.
>>
>> Anyway, don't explain to me, but in your patchset.
> 
> Hi Krzysztof,
> 
> Thank you for your review comments on the ARTPEC-8 platform patches.
> I'd like to add more context about the ARTPEC-8 SoC to help clarify its
> relationship with Exynos.
> 
> Here are the key details about ARTPEC-8:
>    - Manufactured by Samsung Foundry
>    - SoC architecture is owned by Axis Communications
> 	- On similar model as Tesla's FSD chip owned by Tesla and 
>               manufactured and  by Samsung
>    - IPs from both Samsung and Axis Communications
> 
> Samsung-provided IPs:
>   - UART
>   - Ethernet (Vendor: Synopsys)
>        - Same IP has been integrated as integrated in FSD Chip
>   - SDIO
>   - SPI
>   - HSI2C
>   - I2S
>   - CMU (Clock Management Unit)
>        Follows same CMU HW architecture as Exynos SoC have
>   - Pinctrl (GPIO)
>   - PCIe (Vendor: Synopsys)
>        Though Exynos, FSD, ARTPEC have same DesignWare Controller, 
>        the glue/wrapper layer around DWC Core has differences across
>        these SoCs. All manufactured by Samsung, but differences are there
>        in HW design and for different products. For the same reason PCIe patch
>        refactoring effort is being put by us [1] to streamline single Exynos driver
>        which can support all Samsung manufactured SoCs having DWC PCIe controller.
>       [1]: https://patchwork.ozlabs.org/project/linux-pci/patch/20250625165229.3458-2-shradha.t@samsung.com/

So entire base of the SoC is Samsung.

> 
> Axis-provided IPs:
>     - VIP (Image Sensor Processing IP)
>     - VPP (Video Post Processing)
>     - GPU
>     - CDC (Video Encoder)
> 
> As part of the upstreaming effort, Samsung and Coasia (DSP) team will work together
> to upstream basic SoC support and Samsung IPs support.
> The Axis team will be the primary maintainer for the ARTPEC-8 SoC codebase.

Don't know what do you mean by "primary", but I want to be clear: this
classifies as Samsung SoC, so I will be maintaining and overlooking it
just like I maintain and take care about all Samsung SoCs. Otherwise you
will be introducing errors and warnings or, in best case different
style. And this already happened if I did not object!

Also SAME strict DT compliance profile will be applied. (see more on
that below)

> 
> Given that ARTPEC-8 is a distinct SoC with its own set of IPs, we believe it's reasonable
> to create a separate directory for it, similar to FSD.

No. It was a mistake for FSD to keep it separate why? Because there is
no single non-Samsung stuff there. I am afraid exactly the same will
happen there.

Based on above list of blocks this should be done like Google is done,
so it goes as subdirectory of samsung (exynos). Can be called axis or
artpec-8.

To clarify: Only this SoC, not others which are not Samsung.

> 
> We will remove Samsung and Coasia teams from the maintainers list in v2 and only
> Axis team will be maintainer.

A bit unexpected or rather: just use names of people who WILL be
maintaining it. If this is Jesper and Lars, great. Just don't add
entries just because they are managers.

> 
> Maintainer list for previous generation of Axis chips (ARM based) is already present,
> so this will be merged into that.

Existing Artpec entry does not have tree mentioned, so if you choose
above, you must not add the tree, since the tree is provided by Samsung SoC.

OTOH, how are you going to add there strict DT compliance? Existing axis
is not following this, but artpec-8, as a Samsung derivative, MUST
FOLLOW strict DT compliance. And this should be clearly marked in
maintainer entry, just like everywhere else.


> 
> Please let us know if this explanation addresses your concerns. 
> We'll update the commit message and cover letter accordingly.


Best regards,
Krzysztof

