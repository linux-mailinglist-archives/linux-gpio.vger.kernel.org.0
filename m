Return-Path: <linux-gpio+bounces-9132-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F1EC695E657
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 03:36:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 57841B2085D
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Aug 2024 01:36:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA8BE4A33;
	Mon, 26 Aug 2024 01:36:41 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F82443D;
	Mon, 26 Aug 2024 01:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724636201; cv=none; b=ZHtyBeMULuNdzZ7cwvQ1jTA+HNInhluoeAGtsOF6Jn24b4PF3hr3rTtMHYxjgM/b6LwXSxKVdN/R1CYi3ErMmnlDom8lmVDPq5pJ53XNOIgXpT6/ZKNwVLQsoax2doXtMUsqzSvyuJS/YSf2+eVVZD9lshgKxkqTjUeAJv+78Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724636201; c=relaxed/simple;
	bh=wd6zZUEd613VvgbUTb6iIUfcvaLsT1imtH42TS06iMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=budZQ7rP62XLqL+6ED5wvwoB80hwCs5SlZKmSrUfloqZreIaTMpfMVj4JBVd94sOo19OcuSYPnJrDJNopoIOzSIXnzSAYQPrP9pZ97rv420ldQeDvc5ZZtXPJ8nLl5f7qlbMLMzd59D2XsK0MeirKa71g+FbOXuyp4wRTy3PV38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Date: Mon, 26 Aug 2024 01:36:35 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Yangyu Chen <cyy@cyyself.name>, Jesse Taube <jesse@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@spacemit.com>,
	Meng Zhang <kevin.z.m@hotmail.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-binding: pinctrl: spacemit: add documents for
 K1 SoC
Message-ID: <20240826013230.GYA22924.dlan.gentoo>
References: <20240825-02-k1-pinctrl-v2-0-ddd38a345d12@gentoo.org>
 <20240825-02-k1-pinctrl-v2-1-ddd38a345d12@gentoo.org>
 <d9a925da-2381-4203-a3b6-4cb892039d23@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d9a925da-2381-4203-a3b6-4cb892039d23@kernel.org>

Hi Krzysztof: 

On 15:48 Sun 25 Aug     , Krzysztof Kozlowski wrote:
> On 25/08/2024 15:10, Yixun Lan wrote:
> > Add dt-binding for the pinctrl driver of SpacemiT's K1 SoC.
> 
> 
> Please use subject prefixes matching the subsystem. You can get them for
> example with `git log --oneline -- DIRECTORY_OR_FILE` on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters
> 
> It's "dt-bindings:"
Ok, will fix in next version

> 
> > 
> > Two vendor specific properties are introduced here, As the pinctrl
> > has dedicated slew rate enable control - bit[7], so we have
> > spacemit,slew-rate-{enable,disable} for this. For the same reason,
> > creating spacemit,strong-pull-up for the strong pull up control.
> 
> Huh, no, use generic properties. More on that below
> 
see my reply below

> 
> 
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  .../bindings/pinctrl/spacemit,k1-pinctrl.yaml      | 134 +++++++++++++++++
> >  include/dt-bindings/pinctrl/spacemit,k1-pinctrl.h  | 161 +++++++++++++++++++++
> >  2 files changed, 295 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> > new file mode 100644
> > index 0000000000000..8adfc5ebbce37
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/spacemit,k1-pinctrl.yaml
> > @@ -0,0 +1,134 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/spacemit,k1-pinctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SpacemiT K1 SoC Pin Controller
> > +
> > +maintainers:
> > +  - Yixun Lan <dlan@gentoo.org>
> > +
> > +properties:
> > +  compatible:
> > +    const: spacemit,k1-pinctrl
> > +
> > +  reg:
> > +    items:
> > +      - description: pinctrl io memory base
> > +
> > +patternProperties:
> > +  '-cfg$':
> > +    type: object
> > +    description: |
> 
> Do not need '|' unless you need to preserve formatting.
> 
Ok
> > +      A pinctrl node should contain at least one subnode representing the
> > +      pinctrl groups available on the machine.
> > +
> > +    additionalProperties: false
> 
> Keep it before description.
Ok
> 
> > +
> > +    patternProperties:
> > +      '-pins$':
> > +        type: object
> > +        description: |
> > +          Each subnode will list the pins it needs, and how they should
> > +          be configured, with regard to muxer configuration, bias, input
> > +          enable/disable, input schmitt trigger, slew-rate enable/disable,
> > +          slew-rate, drive strength, power source.
> > +        $ref: /schemas/pinctrl/pincfg-node.yaml
> > +
> > +        allOf:
> > +          - $ref: pincfg-node.yaml#
> > +          - $ref: pinmux-node.yaml#
> 
> You are duplicating refs.
ok, will fix it
> 
> > +
> > +        properties:
> > +          pinmux:
> > +            description: |
> > +              The list of GPIOs and their mux settings that properties in the
> > +              node apply to. This should be set using the K1_PADCONF macro to
> > +              construct the value.
> > +            $ref: /schemas/pinctrl/pinmux-node.yaml#/properties/pinmux
> 
> Hm why you need the ref?
> 
will drop it
> > +
> > +          bias-disable: true
> > +
> > +          bias-pull-up: true
> > +
> > +          bias-pull-down: true
> > +
> > +          drive-strength-microamp:
> > +            description: |
> > +              typical current when output high level, but in mA.
> > +              1.8V output: 11, 21, 32, 42 (mA)
> > +              3.3V output: 7, 10, 13, 16, 19, 23, 26, 29 (mA)
> > +            $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +          input-schmitt:
> > +            description: |
> > +              typical threshold for schmitt trigger.
> > +              0: buffer mode
> > +              1: trigger mode
> > +              2, 3: trigger mode
> > +            $ref: /schemas/types.yaml#/definitions/uint32
> > +            enum: [0, 1, 2, 3]
> > +
> > +          power-source:
> > +            description: external power supplies at 1.8v or 3.3v.
> > +            enum: [ 1800, 3300 ]
> > +
> > +          slew-rate:
> > +            description: |
> > +              slew rate for output buffer
> > +              0, 1: Slow speed
> 
> Hm? Surprising, 0 is slow speed?
> 
from docs, section 3.3.2.2 MFPR Register Description
0, 1 are same, both for slow speed
https://developer.spacemit.com/documentation?token=An1vwTwKaigaXRkYfwmcznTXned

> > +              2: Medium speed
> > +              3: Fast speed
> > +            $ref: /schemas/types.yaml#/definitions/uint32
> > +            enum: [0, 1, 2, 3]
> > +
> > +          spacemit,slew-rate-enable:
> > +            description: enable slew rate.
> 
> The presence of slew-rate enables it, doesn't it?
> 
yes, this should work, I will take this approach, thanks

> > +            type: boolean
> > +
> > +          spacemit,slew-rate-disable:
> > +            description: disable slew rate.
> > +            type: boolean
> 
> Just use slew-rate, 0 disable, some value to match real slew-rate.
> 
sounds good to me, since 0, 1 indicate same meaning, can re-use 0 for
disabling slew rate.

> > +
> > +          spacemit,strong-pull-up:
> > +            description: enable strong pull up.
> 
> Do not duplicate the property name in description. You did not say
> anything useful here. What is "strong"? bias-pull-up takes also an argument.
> 
there is a dedicated strong pull bit[3] for I2C, SD card kinds of pad
I don't know how 'strong' it is if in ohms, will see if can get
more info on this (may expand the description)

I think using 'bias-pull-up' property with argument should also work,
but it occur to me it's more intuitive to introduce a property here, which
reflect the underlying hardware functionality. this is similar to starfive's jh7100
bindings/pinctrl/starfive,jh7100-pinctrl.yaml:154
(refer to exist code doesn't mean always correct, so I need advice here)

I will keep this property unless there is objection, please let me know

> > +            type: boolean
> > +
> > +        required:
> > +          - pinmux
> > +
> > +        additionalProperties: false
> 
> This goes up, before description.
> 
Ok
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/pinctrl/spacemit,k1-pinctrl.h>
> > +
> > +    soc {
> > +        #address-cells = <2>;
> > +        #size-cells = <2>;
> > +
> > +        pinctrl@d401e000 {
> > +            compatible = "spacemit,k1-pinctrl";
> > +            reg = <0x0 0xd401e000 0x0 0x400>;
> > +            #pinctrl-cells = <2>;
> > +            #gpio-range-cells = <3>;
> 
> This wasn't ever tested... :(
> ...
will drop it
> 
> > diff --git a/include/dt-bindings/pinctrl/spacemit,k1-pinctrl.h b/include/dt-bindings/pinctrl/spacemit,k1-pinctrl.h
> > new file mode 100644
> > index 0000000000000..13ef4aa6c53a3
> > --- /dev/null
> > +++ b/include/dt-bindings/pinctrl/spacemit,k1-pinctrl.h
> > @@ -0,0 +1,161 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > +/*
> > + * Copyright (c) 2022-2024 SpacemiT (Hangzhou) Technology Co. Ltd
> > + * Copyright (c) 2024 Yixun Lan <dlan@gentoo.org>
> > + *
> > + */
> > +
> > +#ifndef _DT_BINDINGS_PINCTRL_K1_H
> > +#define _DT_BINDINGS_PINCTRL_K1_H
> > +
> > +#define PINMUX(pin, mux) \
> > +	(((pin) & 0xffff) | (((mux) & 0xff) << 16))
> > +
> > +/* pin offset */
> > +#define PINID(x)	((x) + 1)
> > +
> > +#define GPIO_INVAL  0
> > +#define GPIO_00     PINID(0)
> 
> Not really, pin numbers are not bindings. Drop entire header.
> 
Ok, I will move them to dts folder, which should be file
arch/riscv/boot/dts/spacemit/k1-pinctrl.h

> ...
> 
> > +
> > +#define SLEW_RATE_SLOW0		0
> > +#define SLEW_RATE_SLOW1		1
> > +#define SLEW_RATE_MEDIUM	2
> > +#define SLEW_RATE_FAST		3
> 
> Not a binding, either. No usage in the driver.
Ok, will drop it

> 
> > +
> > +#define K1_PADCONF(pin, func) (((pin) << 16) | (func))
> 
> Not a binding.
> 
same, move to dts

> 
> 
> Best regards,
> Krzysztof

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

