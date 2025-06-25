Return-Path: <linux-gpio+bounces-22115-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA18AE76B0
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 08:06:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 639D31728E2
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Jun 2025 06:06:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 18D741E47B3;
	Wed, 25 Jun 2025 06:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PxPFDjWo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD068182BC;
	Wed, 25 Jun 2025 06:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750831557; cv=none; b=OM9jOO84kuegFFWJeKVB6qY/GfCT64hoZUTF8BkN5EVHWs0dzh205r7Zy94upkoPOjxA8ags6cCvGjPwB9oLS5Zag+Ut+p1unufdA1iFkrwZSoe07EulybFywouTE0muB/NclKractnyt0hpZtnDh3jLD2C/SsGVTjFujtqMGKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750831557; c=relaxed/simple;
	bh=mlSg9lIHtnrO/DSwiOZdc8wwacrIJ2lGTmmKvsPErCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I0a/wUecBXu/TqgcZpoGZDdj5zhVqF/Y3rNlDfYMeq9dsR4KeRHIYwzauoL0QzZcjLTRZ7bHMc+XYQwSve4Wy6PG9nODOCDQ0Ptqws4htT8QLuB4G7If/Mozq/yWGeUykwsAl0JFAS3u7ShJ7Zt5/4dkYhZXNZckrA5JTORpwPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PxPFDjWo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C814BC4CEEA;
	Wed, 25 Jun 2025 06:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750831557;
	bh=mlSg9lIHtnrO/DSwiOZdc8wwacrIJ2lGTmmKvsPErCo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PxPFDjWocxmsoIWWpzgyx3AmmB7LtjHB8cOR3tTUYprPGkheEEY3xPbyTCvyvqlsj
	 VXYCM6uzQ60no5DzAL/c6jKu3dW8/SsFc0lIJ+kYXfN1TIOKELqESNNsTkpHZS1hqs
	 6UNLEXKo6EUjiAIKzAwH1HUP9eJWaIvVr/jp559ag7T3fi8LeO4p/6bur6WuVYLFOu
	 EQ4Kt11jPO3BkO5qiKKqcmsQV3FbwgtWbGsajfMDcYOHcCaT4yhPzZTcXLIlLwSrKg
	 XD1s9aZpEpcI1lYU7N4C+8Ynua0qB0cNRPbyn3wxtYXHLca2DXwP04/yshsRPqFTOX
	 0EQovDgK+ovMA==
Message-ID: <a0feb67f-3a73-4247-8383-7255616cb22b@kernel.org>
Date: Wed, 25 Jun 2025 08:05:52 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] arm64: dts: axiado: Add initial support for AX3000
 SoC and eval board
To: Harshit Shah <hshah@axiado.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jan Kotas <jank@cadence.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "soc@lists.linux.dev" <soc@lists.linux.dev>
References: <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-0-b3e66a7491f5@axiado.com>
 <20250623-axiado-ax3000-soc-and-evaluation-board-support-v3-5-b3e66a7491f5@axiado.com>
 <0709a0a6-1313-452c-85e7-2926a6a03741@kernel.org>
 <19d78e69-4a38-420b-b9f8-d0eb90cdcaf6@axiado.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <19d78e69-4a38-420b-b9f8-d0eb90cdcaf6@axiado.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 25/06/2025 04:16, Harshit Shah wrote:
> Thank you for the reviews. I have some questions/feedback to clarify 
> before I fix some of them.
> 
> On 6/23/2025 11:45 PM, Krzysztof Kozlowski wrote:
>>
>> On 23/06/2025 19:28, Harshit Shah wrote:
>>> +                     clocks = <&refclk>;
>>> +                     interrupt-parent = <&gic500>;
>>> +                     interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
>>> +                     gpio-controller;
>>> +                     #gpio-cells = <2>;
>>> +                     interrupt-controller;
>>> +                     #interrupt-cells = <2>;
>>> +                     status = "disabled";
>>> +             };
>> Please follow DTS coding style.
> 
> Sorry, I didn't got this comment. Is this for the spaces between the 
> nodes or something else?
> 
> The current GPIO node is as follows:

There is always, always line break between nodes.

> 
> gpio0: gpio-controller@80500000 {
>                          compatible = "cdns,gpio-r1p02";
>                          reg = <0x00 0x80500000 0x00 0x400>;
>                          clocks = <&refclk>;
>                          interrupt-parent = <&gic500>;
>                          interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
>                          gpio-controller;
>                          #gpio-cells = <2>;
>                          interrupt-controller;
>                          #interrupt-cells = <2>;
>                          status = "disabled";
>                  };
> 
> I checked the document: 
> https://elixir.bootlin.com/linux/v6.15/source/Documentation/devicetree/bindings/dts-coding-style.rst#L112.
> 
>>
>>> +             gpio1: gpio-controller@80580000 {
>>> +                     compatible = "cdns,gpio-r1p02";
>> This should not be accepted without specific compatible, but that's some
>> old binding so maybe matters less. Anyway, if you ever need quirk or
>> custom properties they I will reject them based on what you claim here.
> 
> Yes, we are not changing anything on this driver. Is it okay?

I meant for future. I would expect to follow writing bindings now, so
have front specific compatible, but if you do not then whatever issues
you have in the future with this driver, they should be rejected, right?

> 
> 
>>
>>
>>> +             i3c16: i3c@80620400 {
>>> +                     compatible = "cdns,i3c-master";
>>> +                     reg = <0x00 0x80620400 0x00 0x400>;
>>> +                     clocks = <&refclk &clk_xin>;
>>> +                     clock-names = "pclk", "sysclk";
>>> +                     interrupt-parent = <&gic500>;
>>> +                     interrupts = <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>;
>>> +                     i2c-scl-hz = <100000>;
>>> +                     i3c-scl-hz = <400000>;
>>> +                     #address-cells = <3>;
>>> +                     #size-cells = <0>;
>>> +                     status = "disabled";
>>> +             };
>>> +             uart0: serial@80520000 {
>> Looks like not ordered by unit address. What is the ordering rule you
>> are going to adopt for entire arch?
> 
> Apologies for the confusion. I should have updated in last patch-set 
> comments.
> 
> We are following alphabetical ordering rule. In those we are grouping 
> some nodes together based on the numbers.
> 
> cpus
> 
> clocks
> 
> soc {
> 
>     gic500 { }
> 
>     gpio0-7 { }
> 
>     i3c0-16 { }
> 
>     uart0-3 { }
> 
> }
> 
> timer
> 
> 
> Is this okay?

alphabetical ordering is not mentioned in dts coding style. Maybe it
should, but I think the only user of second style with grouping nodes -
Renesas - still uses ordering by unit address in general.

The trouble with your approach is that if you ever need to change the
name, you will need to re-order and move entire node.

Anyway, not a problem for me.

> 
>>
>>> +                     compatible = "xlnx,zynqmp-uart", "cdns,uart-r1p12";
>> NAK, you do not have xlnx here. Look at your SoC: name of vendor is
>> axiado. Not xlnx. How is your SoC called? Also zynqmp? You cannot just
>> randomly pick any compatibles and stuff them around.
>>
>> Please carefully read writing bindings from DT directory.
> 
> 
> We are using the "cdns,uart-r1p12" for the UART. However, that alone 
> can't be added alone in the compatible as per the DT bindings doc.

Exactly. See writing bindings... or any guides/talks.


Best regards,
Krzysztof

