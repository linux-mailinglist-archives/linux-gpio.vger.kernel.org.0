Return-Path: <linux-gpio+bounces-22324-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC6AAEAE98
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 07:58:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E07B1641CD7
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Jun 2025 05:58:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B31151E25F8;
	Fri, 27 Jun 2025 05:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tHM4yWQb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632541DF27D;
	Fri, 27 Jun 2025 05:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751003924; cv=none; b=E9QnVlVU/+vKSJyZxZSIDwAmlrXLCUie10E6uywOR0NLXXExaOrQ9x7l4Vjg1kDhRDJh1RwofV+w4aiZpeJ95PMyazIVzAiCplR0yNwuGm29YX4239tob4vIYDdpm8QK3njTVcJO3/ocmYupfP6GkPLEVWWNBLqupoUtobu2KZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751003924; c=relaxed/simple;
	bh=W8ESEOvTnzlaauZxXbpvnooPguT5UJB6hx9dfTe2kLQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MjLZPNHyJRxgIUFohvo3iwTyUBksl0w9aXwSMr2QBSZtXr+evv2CV0j99AZFnGX33aGsJNaT9ZnIMcKZ3tfs4B2aCvrcJ87fEmd02i7mbD3UNyGYCH8TCBmDMgCC4DmClp11yyBwXLmebFxGDjiEA5iU7knQUO6npYy2szfTTl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tHM4yWQb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D65E2C4CEE3;
	Fri, 27 Jun 2025 05:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751003924;
	bh=W8ESEOvTnzlaauZxXbpvnooPguT5UJB6hx9dfTe2kLQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tHM4yWQb1Li4Zxbg/miQ5CF3lxTnBWVX22rDl0hIbKjudFVrqwM7ZJ4ktt2XvvJ7n
	 MQuLLHS+3FvLlFcXRxA01U9/CTyY8C1QznX/3SxC3uBKgDAwZekBJW9sLpTt/ajfMK
	 NwM/tR7XANh5qs2cYs887oIwH2ILDsIE4KRaqjd4q/qosaH26iWdvjgG34BFvoSsQX
	 UigC8OlJV4tNWB2H2plxaTTUSDmV2i4V9/PRJPo+EiK/qHrsGcbqIxfhQ10msqp5mN
	 amObNoMI1sh3Odld7Fnw3W4+AHk3Sw5e87d5+bWKIcqz16DZcC1/7DZ0OJjsWRIZgF
	 zN0n51nW89IFg==
Message-ID: <4d4bf02a-4c0a-4051-bed2-8a089d310ad2@kernel.org>
Date: Fri, 27 Jun 2025 07:58:36 +0200
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
 <a0feb67f-3a73-4247-8383-7255616cb22b@kernel.org>
 <a6e27c0e-0703-4444-b6e7-d4db1340e802@axiado.com>
 <3660b275-8513-4017-aba4-5c4432eb5b6b@kernel.org>
 <72ac73e7-a201-4001-a3ca-b13fb78c980b@axiado.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <72ac73e7-a201-4001-a3ca-b13fb78c980b@axiado.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 27/06/2025 02:47, Harshit Shah wrote:
>>> Is this name look good?
>> No, all compatibles for SoC must be SoC specific. Take any recent
>> Qualcomm SM8650 or SM8750 as example.
>>
>> I asked to read writing bindings. Did you read it? It covers exactly
>> this case.
>>
>> Best regards,
>> Krzysztof
> 
> 
> Extremely sorry for the last reply. It got messed up in formatting, 
> re-sending the same.
> 
> 
> Thank you for the references.
> 
> Yes, I missed the point in the writing bindings doc. It says the following:
> 
> 
> "For sub-blocks/components of bigger device (e.g. SoC blocks) use rather 
> device-based compatible (e.g. SoC-based compatible),
> 
>   instead of custom versioning of that component. For example use 
> "vendor,soc1234-i2c" instead of "vendor,i2c-v2"."
> 
> 
> (Ref: 
> https://elixir.bootlin.com/linux/v6.15.3/source/Documentation/devicetree/bindings/writing-bindings.rst#L79) 
> 
> 
> # We need to add the full SoC name instead of versioning. e.g. 
> compatible should contain full SoC name ax3000.

Yes.

> 
> 
> Another example, we have seen is the designware I2C IP is used by MSCC, 
> ocelot chipset.
> 
> It is showing as below in the following: 
> (https://elixir.bootlin.com/linux/v6.16-rc3/source/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml) 
> 
> 
>      i2c@100400 {
> 
>        compatible = "mscc,ocelot-i2c", "snps,designware-i2c";
> 
>        reg = <0x100400 0x100>, <0x198 0x8>;
> 
>        pinctrl-0 = <&i2c_pins>;
> 
>        pinctrl-names = "default";
> 
>        interrupts = <8>;
> 
>        clocks = <&ahb_clk>;
> 
>      };
> 
> 
> # We will add this compatible in the existing driver 
> (drivers/tty/serial/xilinx_uartps.c) &
> 
> bindings (Documentation/devicetree/bindings/serial/cdns,uart.yaml) since 
> the IP is common.
> 
> 
> As per the above examples,  I see two types of bindings.
> 
> 1. compatible = "axiado,ax3000-uart", "cdns,uart-r1p12"


This one. Thank you.


Best regards,
Krzysztof

