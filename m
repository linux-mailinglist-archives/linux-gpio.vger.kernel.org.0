Return-Path: <linux-gpio+bounces-9137-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7378095E7F5
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 07:37:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 987681C20F46
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 05:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D33247407A;
	Mon, 26 Aug 2024 05:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YFywewTX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EDE8C11;
	Mon, 26 Aug 2024 05:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724650664; cv=none; b=GCqwyjvliPiJ2OX1Q1luGvkKR0X7pzt6PtLEC8TRT7DXBwaFxxXuZ7Y1Y8M9JZ/HPMGUt04MyV5C/o6s95dS8FmyTl1O3r7CPot+QPtMmO+KGdwSRSoZs1MuHwVBh5K8XNdrF5I4qU4nIrPENtHhPjKcuq5KtlxXu266+WRji1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724650664; c=relaxed/simple;
	bh=7o6ye5i/SsfL/3HvmhtG2xS2Nj6hXCUaPE+Z28dhZWk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uNlUzxJQBAxUj3U/2l6cmt1tq2XJJGkrAhHAAYs0afDNLGUY3ehMXny2nZzcBSOojnlyu7uTQfYGmEVohN8CckN0uHZwt8eHQORoUqCwH/0E4jL0YRswQJxs1guYxRGbyyEU7u/eMyhrJHCFWjPM8TFK1N9y0pX8aDvfcHbb9hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YFywewTX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B0D0C32786;
	Mon, 26 Aug 2024 05:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724650664;
	bh=7o6ye5i/SsfL/3HvmhtG2xS2Nj6hXCUaPE+Z28dhZWk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YFywewTXBuuiUfvFC+83I8C44uItl64c5ij70WWXTdYN1zHlBIPkRuapBsMhRpV7C
	 hOYHxmxsQ5iysqsZxHeIxBjGKuduyGZobi30Up/2x90MK7768bkwLayCoc+ru14Fde
	 hRNC31+0d9FPTxaRCzbmZhpB5oSk2tzZazevRz8c8KRpKF6IpgE6677zei37IPeuJ9
	 5+WgnNfZKWqnvmtaw59LzpbdZdDs8jSA9d27cJbIWk4lOD8GzQn+A3n5i5y/gApmvi
	 KsQrW5ff+1e2EYYaEF7lIQ1qhAJsK9DXVKxpgRJKicXT5ZTCvF29I5BpY9+QyEa4cx
	 q75u3GlNsGxNg==
Message-ID: <34a73de2-85b3-4a20-b2b4-6a72622d5abc@kernel.org>
Date: Mon, 26 Aug 2024 07:37:34 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-binding: pinctrl: spacemit: add documents for
 K1 SoC
To: Yixun Lan <dlan@gentoo.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>,
 Jesse Taube <jesse@rivosinc.com>, Jisheng Zhang <jszhang@kernel.org>,
 Inochi Amaoto <inochiama@outlook.com>, Icenowy Zheng <uwu@icenowy.me>,
 Meng Zhang <zhangmeng.kevin@spacemit.com>, Meng Zhang
 <kevin.z.m@hotmail.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20240825-02-k1-pinctrl-v2-0-ddd38a345d12@gentoo.org>
 <20240825-02-k1-pinctrl-v2-1-ddd38a345d12@gentoo.org>
 <d9a925da-2381-4203-a3b6-4cb892039d23@kernel.org>
 <66cbdc2a.050a0220.2d7994.f671SMTPIN_ADDED_BROKEN@mx.google.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <66cbdc2a.050a0220.2d7994.f671SMTPIN_ADDED_BROKEN@mx.google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26/08/2024 03:36, Yixun Lan wrote:
> Hi Krzysztof: 
> 
> On 15:48 Sun 25 Aug     , Krzysztof Kozlowski wrote:
>> On 25/08/2024 15:10, Yixun Lan wrote:
>>> Add dt-binding for the pinctrl driver of SpacemiT's K1 SoC.
>>
>>
>> Please use subject prefixes matching the subsystem. You can get them for
>> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
>> your patch is touching. For bindings, the preferred subjects are
>> explained here:
>> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
>>
>> It's "dt-bindings:"
> Ok, will fix in next version
> 
>>
>>>
>>> Two vendor specific properties are introduced here, As the pinctrl
>>> has dedicated slew rate enable control - bit[7], so we have
>>> spacemit,slew-rate-{enable,disable} for this. For the same reason,
>>> creating spacemit,strong-pull-up for the strong pull up control.
>>
>> Huh, no, use generic properties. More on that below
>>
> see my reply below
> 
>>
>>
>>>
>>> Signed-off-by: Yixun Lan <dlan@gentoo.org>
>>> ---
>>>  .../bindings/pinctrl/spacemit,k1-pinctrl.yaml      | 134 +++++++++++++++++
>>>  include/dt-bindings/pinctrl/spacemit,k1-pinctrl.h  | 161 +++++++++++++++++++++
>>>  2 files changed, 295 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
>>> new file mode 100644
>>> index 0000000000000..8adfc5ebbce37
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
>>> @@ -0,0 +1,134 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>> +%YAML 1.2
>>> +---
>>> +$id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: SpacemiT K1 SoC Pin Controller
>>> +
>>> +maintainers:
>>> +  - Yixun Lan <dlan@gentoo.org>
>>> +
>>> +properties:
>>> +  compatible:
>>> +    const: spacemit,k1-pinctrl
>>> +
>>> +  reg:
>>> +    items:
>>> +      - description: pinctrl io memory base
>>> +
>>> +patternProperties:
>>> +  '-cfg$':
>>> +    type: object
>>> +    description: |
>>
>> Do not need '|' unless you need to preserve formatting.
>>
> Ok
>>> +      A pinctrl node should contain at least one subnode representing the
>>> +      pinctrl groups available on the machine.
>>> +
>>> +    additionalProperties: false
>>
>> Keep it before description.
> Ok
>>
>>> +
>>> +    patternProperties:
>>> +      '-pins$':
>>> +        type: object
>>> +        description: |
>>> +          Each subnode will list the pins it needs, and how they should
>>> +          be configured, with regard to muxer configuration, bias, input
>>> +          enable/disable, input schmitt trigger, slew-rate enable/disable,
>>> +          slew-rate, drive strength, power source.
>>> +        $ref: /schemas/pinctrl/pincfg-node.yaml
>>> +
>>> +        allOf:
>>> +          - $ref: pincfg-node.yaml#
>>> +          - $ref: pinmux-node.yaml#
>>
>> You are duplicating refs.
> ok, will fix it
>>
>>> +
>>> +        properties:
>>> +          pinmux:
>>> +            description: |
>>> +              The list of GPIOs and their mux settings that properties in the
>>> +              node apply to. This should be set using the K1_PADCONF macro to
>>> +              construct the value.
>>> +            $ref: /schemas/pinctrl/pinmux-node.yaml#/properties/pinmux
>>
>> Hm why you need the ref?
>>
> will drop it
>>> +
>>> +          bias-disable: true
>>> +
>>> +          bias-pull-up: true
>>> +
>>> +          bias-pull-down: true
>>> +
>>> +          drive-strength-microamp:
>>> +            description: |
>>> +              typical current when output high level, but in mA.
>>> +              1.8V output: 11, 21, 32, 42 (mA)
>>> +              3.3V output: 7, 10, 13, 16, 19, 23, 26, 29 (mA)
>>> +            $ref: /schemas/types.yaml#/definitions/uint32
>>> +
>>> +          input-schmitt:
>>> +            description: |
>>> +              typical threshold for schmitt trigger.
>>> +              0: buffer mode
>>> +              1: trigger mode
>>> +              2, 3: trigger mode
>>> +            $ref: /schemas/types.yaml#/definitions/uint32
>>> +            enum: [0, 1, 2, 3]
>>> +
>>> +          power-source:
>>> +            description: external power supplies at 1.8v or 3.3v.
>>> +            enum: [ 1800, 3300 ]
>>> +
>>> +          slew-rate:
>>> +            description: |
>>> +              slew rate for output buffer
>>> +              0, 1: Slow speed
>>
>> Hm? Surprising, 0 is slow speed?
>>
> from docs, section 3.3.2.2 MFPR Register Description
> 0, 1 are same, both for slow speed
> https://developer.spacemit.com/documentation?token=An1vwTwKaigaXRkYfwmcznTXned

Don't store here register value.

> 
>>> +              2: Medium speed
>>> +              3: Fast speed
>>> +            $ref: /schemas/types.yaml#/definitions/uint32
>>> +            enum: [0, 1, 2, 3]
>>> +
>>> +          spacemit,slew-rate-enable:
>>> +            description: enable slew rate.
>>
>> The presence of slew-rate enables it, doesn't it?
>>
> yes, this should work, I will take this approach, thanks
> 
>>> +            type: boolean
>>> +
>>> +          spacemit,slew-rate-disable:
>>> +            description: disable slew rate.
>>> +            type: boolean
>>
>> Just use slew-rate, 0 disable, some value to match real slew-rate.
>>
> sounds good to me, since 0, 1 indicate same meaning, can re-use 0 for
> disabling slew rate.
> 
>>> +
>>> +          spacemit,strong-pull-up:
>>> +            description: enable strong pull up.
>>
>> Do not duplicate the property name in description. You did not say
>> anything useful here. What is "strong"? bias-pull-up takes also an argument.
>>
> there is a dedicated strong pull bit[3] for I2C, SD card kinds of pad
> I don't know how 'strong' it is if in ohms, will see if can get
> more info on this (may expand the description)
> 
> I think using 'bias-pull-up' property with argument should also work,
> but it occur to me it's more intuitive to introduce a property here, which
> reflect the underlying hardware functionality. this is similar to starfive's jh7100
> bindings/pinctrl/starfive,jh7100-pinctrl.yaml:154
> (refer to exist code doesn't mean always correct, so I need advice here)

No, avoid introducing properties which duplicate existing generic ones.

Same story was with qualcomm and it was possible to use specific value.

> 
> I will keep this property unless there is objection, please let me know
> 
>>> +            type: boolean
>>> +
>>> +        required:
>>> +          - pinmux
>>> +
>>> +        additionalProperties: false
>>
>> This goes up, before description.
>>
> Ok
>>> +
>>> +required:
>>> +  - compatible
>>> +  - reg
>>> +
>>> +additionalProperties: false
>>> +
>>> +examples:
>>> +  - |
>>> +    #include <dt-bindings/pinctrl/spacemit,k1-pinctrl.h>
>>> +
>>> +    soc {
>>> +        #address-cells = <2>;
>>> +        #size-cells = <2>;
>>> +
>>> +        pinctrl@d401e000 {
>>> +            compatible = "spacemit,k1-pinctrl";
>>> +            reg = <0x0 0xd401e000 0x0 0x400>;
>>> +            #pinctrl-cells = <2>;
>>> +            #gpio-range-cells = <3>;
>>
>> This wasn't ever tested... :(
>> ...
> will drop it

Test your patches instead.



Best regards,
Krzysztof


