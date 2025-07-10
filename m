Return-Path: <linux-gpio+bounces-23074-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B53AFFEE3
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 12:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4602E7B9B89
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 10:13:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10BF52D837E;
	Thu, 10 Jul 2025 10:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DyQIaiUs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9326D2D6628;
	Thu, 10 Jul 2025 10:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752142460; cv=none; b=Dro31YAFQ7HfbBEuyeZNW/wWflRYzaK6krr52m3J0R9i7IKGVGd/tGcYdC2OwGaxaJRLYwaRnwbD0tx2MoQFdJJXYoUq33HS0yUK8+kzoaXiJNcq+LXZfdKYHIS6hfBQ60U2NYf4ydPogAEIGRTrN1qjoVnEUJEUcwybTSjQrII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752142460; c=relaxed/simple;
	bh=qATw6ZD37x/XT/B5MCjb1qOwnXiW8HLBo9mIN9I0R3g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eBY+eo5BgshJrVdLmnNfH3MlH6roc/cFeNNjOKj3+rvDCDImsss8M26VYC3IQzwzeo3MANR7UO8Lfxkvrf5Rh6YS1V9cVuK6FQmC9A2pqVEoM1lQi8gDEbAFMa6v1aTtZPpF5uQa8u0NceGjDpF73bws4xcf1BP6SX1KERI2Q9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DyQIaiUs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A02EFC4CEF5;
	Thu, 10 Jul 2025 10:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752142460;
	bh=qATw6ZD37x/XT/B5MCjb1qOwnXiW8HLBo9mIN9I0R3g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DyQIaiUs1pOLCr6gIs/azzr6zC2/moryuNU3UAInevb5nD5O/dcuT8sE8gp8d5ZFl
	 5VNvilLKEPrcZ2R75ojm5IYNV91VLqeOC9kW1B8ZmPpR96HVwZqqE93AofpeH2az7U
	 I/M5XovAKqh3MfW3pt/G59uIxMzKQxKjfK+Z5GbEFZdFeZcosU5kTrGDUj+qHKCKfM
	 quueYdCtq7I9FgyFob+ymo3624rGscjBcGF+IWhRZXA7D6FQYh69zMJMOz7vWzNV8U
	 nTUKsPC5maC1U4GukMIC1sg5fg0fGy6PhNFuiuimPiXm5Ea8SYYncPv9FQrBUguvub
	 DvcK8vYFUJFgA==
Message-ID: <53130960-e054-4de9-b62a-cde384444a78@kernel.org>
Date: Thu, 10 Jul 2025 12:14:10 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 14/16] arm64: dts: axis: Add initial device tree support
To: Arnd Bergmann <arnd@arndb.de>, ksk4725@coasia.com,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa
 <tomasz.figa@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Ravi Patel <ravi.patel@samsung.com>,
 SungMin Park <smn1196@coasia.com>
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
 devicetree@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, soc@lists.linux.dev
References: <20250710002047.1573841-1-ksk4725@coasia.com>
 <20250710002047.1573841-15-ksk4725@coasia.com>
 <5494bedb-6907-43dc-8580-04ef1e47c8d0@app.fastmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <5494bedb-6907-43dc-8580-04ef1e47c8d0@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/07/2025 09:48, Arnd Bergmann wrote:
> On Thu, Jul 10, 2025, at 02:20, ksk4725@coasia.com wrote:
>> From: sungminpark <smn1196@coasia.com>
>>
>> Add initial device tree support for Axis ARTPEC-8 SoC and Grizzly board.
>> This SoC contains four cores of cortex-a53 CPUs and other various
>> peripheral IPs.
> 
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index fa1e04e87d1d..371005f3f41a 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -2320,6 +2320,20 @@ F:	drivers/crypto/axis
>>  F:	drivers/mmc/host/usdhi6rol0.c
>>  F:	drivers/pinctrl/pinctrl-artpec*
>>
>> +ARM/ARTPEC ARM64 MACHINE SUPPORT
>> +M:	Jesper Nilsson <jesper.nilsson@axis.com>
>> +M:	Ravi Patel <ravi.patel@samsung.com>
>> +M:	SeonGu Kang <ksk4725@coasia.com>
>> +M:	SungMin Park <smn1196@coasia.com>
>> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>> +L:	linux-samsung-soc@vger.kernel.org
>> +L:	linux-arm-kernel@axis.com
>> +S:	Maintained
>> +F:	Documentation/devicetree/bindings/clock/axis,artpec*-clock.yaml
>> +F:	arch/arm64/boot/dts/axis/
>> +F:	drivers/clk/samsung/clk-artpec*.c
>> +F:	include/dt-bindings/clock/axis,artpec*-clk.h
> 
> I'm trying to understand the SoC family tree here. I see that
> you have an entry for ARTPEC SoCs above it, which currently
> covers artpec6 (Cortex-A9, apparently not Samsung based).
> 
> Is the reason for having two entries here that artpec6/7 and
> artpec8/9 are two separate SoC families, or is this just because
> they are using 32-bit and 64-bit cores, respectively?

These should be entirely different families. Artpec6 was not done by
Samsung and this one - Artpec 8 - is basically Samsung SoC, just like
they did designs for Tesla and Google GS101.

I don't know about Artpec 9.

All this should be explained in DTS or bindings commit msg, btw.

> 
>>
>> +config ARCH_ARTPEC
>> +	bool "Axis Communications ARTPEC SoC Family"
>> +	help
>> +	   This enables support for the ARMv8 based ARTPEC SoC Family.
>> +
>> +config ARCH_ARTPEC8
>> +	bool "Axis ARTPEC-8 SoC Platform"
>> +	depends on ARCH_ARTPEC
>> +	depends on ARCH_EXYNOS
>> +	select ARM_GIC
>> +	help
>> +	  This enables support for the Axis ARTPEC-8 SoC.
>> +
> 
> I would prefer to be less fine-grained here, especially as
> it seems that ARTPEC9 is again quite similar to ARTPEC8, as
> far as I can guess from public information.
> 
> Could you fold both entries into a single ARCH_ARTPEC?

So far ARCH_ARTPEC = ARCH_ARTPEC8, so obviously it can be folded. I
don't know if Artpec 9 will ever be upstreamed. This Artpec 8 is like 4
or 5 year effort - they sent first patches some years ago, but DTS was
not ready. Therefore I think we should not assume there will be Artpec 9
yet. If it comes, we can always split things.


Best regards,
Krzysztof

