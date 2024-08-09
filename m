Return-Path: <linux-gpio+bounces-8678-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C6D94C9D4
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2024 07:48:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62E25281379
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Aug 2024 05:48:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C2A716C845;
	Fri,  9 Aug 2024 05:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IyTdpGZf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D22634CDD;
	Fri,  9 Aug 2024 05:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723182490; cv=none; b=j7+mDx2cObzPKdA8lbv5fH7hbKlcekZ8d8tZ7P7NPPlArXt3+54d/2JEjKbAQSnPv+pLTBYcbBBxKL4/3h4xTE21ZFKGeLa9idX2daixODYxLbKA96p113La00BLdQ6RfX133maQ/s7XTx3y+teLjsfQXQm1jWaE2cBup4TuXY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723182490; c=relaxed/simple;
	bh=ZBQK+cbyO3xbcABhYXubKQT9HZMHXAWWe28Kv1YxKDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N5fTrkOJZtVMAHD0+IW6GJnVEIwuVYIol1TdpdlIiVZuPnyIMSz7PCO+bFa2lvWp1p0jTlVMubWoKv6spnhs9e79MDni1dJKDNK5zmLfp9Z/GSc2ZDQgWFoJVBvKWGR56Jz6TtBUQKCTPLs1CCPQiTbxrHNXtwHj+iXYVEdzgcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IyTdpGZf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53B22C4AF0D;
	Fri,  9 Aug 2024 05:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723182489;
	bh=ZBQK+cbyO3xbcABhYXubKQT9HZMHXAWWe28Kv1YxKDE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IyTdpGZfgucxMsMteD4O3tm5OW9PJ32VebeC4RBMNPQ8uRbup0s1+Dhfz0w32G6Eb
	 EZg+uADXGFqBR5ITIVqwI8aLv0e0zq/Edk3sCQPp1N4MfZ4ODTVM4sqJBwgEhLMWQI
	 72CK2Nu2tERBQivQpsgpf9GWjK4cl002xc/2rQ/HzotNnmwIU+bMSsVRrCEMsB05xp
	 BLoFiPXtMxUs03LZ6FY/gJQp4UrfIAV7ZKBFnfMjxkTPoKBleUl7fakDiEWTYq0xdb
	 afmolI9HUpDcd/mzhz4MnLo7J8xYLryd8cm9Hhw3u5SvEJo40et8bB8XBNAd3RwiS+
	 Yu80QZuEY0XyQ==
Message-ID: <24ff07b6-a685-471f-8249-3e3450e2d3d3@kernel.org>
Date: Fri, 9 Aug 2024 07:48:01 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 08/10] arm64: dts: exynos: Add initial support for
 exynos8895 SoC
To: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
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
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <5274b8a1-b81c-3979-ed6c-3572f6a6cfc2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/08/2024 13:20, Ivaylo Ivanov wrote:
> 
> On 8/7/24 12:20, Krzysztof Kozlowski wrote:
>> On 07/08/2024 10:28, ivo.ivanov.ivanov1@gmail.com wrote:
>>> From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>>
>>> Exynos 8895 SoC is an ARMv8 mobile SoC found in the Samsung Galaxy
>>> S8 (dreamlte), S8 Plus (dream2lte), Note 8 (greatlte) and the Meizu
>>> 15 Plus (m1891). Add minimal support for that SoC, including:
>>>
>>> - All 8 cores via PSCI
>>> - ChipID
>>> - Generic ARMV8 Timer
>>> - Enumarate all pinctrl nodes
>>>
>>> Further platform support will be added over time.
>>>
>>> Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>> ---
>>>  .../boot/dts/exynos/exynos8895-pinctrl.dtsi   | 1378 +++++++++++++++++
>>>  arch/arm64/boot/dts/exynos/exynos8895.dtsi    |  253 +++
>>>  2 files changed, 1631 insertions(+)
>>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
>>>  create mode 100644 arch/arm64/boot/dts/exynos/exynos8895.dtsi
>>>
>>> diff --git a/arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
>>> new file mode 100644
>>> index 000000000..1dcb61e2e
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/exynos/exynos8895-pinctrl.dtsi
>>> @@ -0,0 +1,1378 @@
>>> +// SPDX-License-Identifier: BSD-3-Clause
>>> +/*
>>> + * Samsung's Exynos 8895 SoC pin-mux and pin-config device tree source
>>> + *
>>> + * Copyright (c) 2024, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>> + */
>>> +
>>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +#include "exynos-pinctrl.h"
>>> +
>>> +&pinctrl_alive {
>>> +	gpa0: gpa0 {
>> I do not believe this was tested. See maintainer SoC profile for Samsung
>> Exynos.
>>
>> Limited review follows due to lack of testing.
>>
>>
>>> +};
>>> diff --git a/arch/arm64/boot/dts/exynos/exynos8895.dtsi b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
>>> new file mode 100644
>>> index 000000000..3ed381ee5
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/exynos/exynos8895.dtsi
>>> @@ -0,0 +1,253 @@
>>> +// SPDX-License-Identifier: BSD-3-Clause
>>> +/*
>>> + * Samsung's Exynos 8895 SoC device tree source
>>> + *
>>> + * Copyright (c) 2024, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
>>> + */
>>> +
>>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +
>>> +/ {
>>> +	compatible = "samsung,exynos8895";
>>> +	#address-cells = <2>;
>>> +	#size-cells = <1>;
>>> +
>>> +	interrupt-parent = <&gic>;
>>> +
>>> +	aliases {
>>> +		pinctrl0 = &pinctrl_alive;
>>> +		pinctrl1 = &pinctrl_abox;
>>> +		pinctrl2 = &pinctrl_vts;
>>> +		pinctrl3 = &pinctrl_fsys0;
>>> +		pinctrl4 = &pinctrl_fsys1;
>>> +		pinctrl5 = &pinctrl_busc;
>>> +		pinctrl6 = &pinctrl_peric0;
>>> +		pinctrl7 = &pinctrl_peric1;
>>> +	};
>>> +
>>> +	arm-a53-pmu {
>> Are there two pmus?
> 
> Hm. The Downstream kernel has them all under one node with compatible
> 
> 'arm,armv8-pmuv3', same as with Exynos 7885. So it should have two PMUs,
> 
> one for each cluster.
> 
> 
> Considering the second cluster consists of Samsung's custom Mongoose M2
> 
> cores, what would be the most adequate thing to do? Keep the first PMU as
> 
> "arm,cortex-a53-pmu" and use the SW model "arm,armv8-pmuv3" for the
> 
> second PMU? I doubt guessing if these mongoose cores are based on already
> 
> existing cortex cores is a great idea.

I was just wondering why there is only one and called a53. I am not sure
what should be for the second, but rather not a software model.

Best regards,
Krzysztof


