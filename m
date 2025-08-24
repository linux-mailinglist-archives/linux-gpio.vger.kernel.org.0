Return-Path: <linux-gpio+bounces-24860-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D544B33070
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Aug 2025 16:42:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9F3907AC870
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Aug 2025 14:40:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F37222DA749;
	Sun, 24 Aug 2025 14:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l9glV3kK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8CE8179BD;
	Sun, 24 Aug 2025 14:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756046512; cv=none; b=u7It08uyZwmEJlWmujZ8RO9Ex5YBHSmSGOP4GX2wYIOTGbxJo89fHJwDmm+ZjNY57csGNme1siKTlFG+im+Qx9ThVhb8U6oA9tV+2xAubIyqBecTP2ravI6ZAk7sbv4o1Z/rcEeaGDia7sIUtiAE1EUdB2s5Fc9i1xnENqH6tLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756046512; c=relaxed/simple;
	bh=kL1wbSGg2bva1d0/uLmwklt12rLBglri4cRXJQOMN0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+tmg2bp5xSqxeoQZy1JpTna9o/R36cr9OENgN/AkC3ce5fDFA7dz+0qArpKALVfq6NTIFH2+lAeZF67/sbZhd2j6FVzuSdwxLZ7yJO31hXyceTnEqc6zw+xPPTbPHL+yhaLKfUkoWZwK5IJVQmJsbiUluugIe7LgPo9FYV7kl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l9glV3kK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 378E2C19422;
	Sun, 24 Aug 2025 14:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756046512;
	bh=kL1wbSGg2bva1d0/uLmwklt12rLBglri4cRXJQOMN0Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=l9glV3kKN1ORDiTF2zQW0w1iBJEVcfV8WVm/9dScl8NPOumhJCtLmEWC98YdXow9a
	 SQNNdmgstbWnRyXlWsjdfV4/Vg/JK4duGhAWV2Q7kVM3lM3MoLxK9uJKZ3Xo1yLEIS
	 4QVHGRLMTvq5P55ZXK9gv0jIF/2lRZu1fib/gH8NQN2PSgPWgQiAs0k+siHvVzSguM
	 iksbF7seeQV6q0F4yVM1dXrF7u/xq5xmi7ecRmLsU4C0Uxv4NffHed9+cP7Bjqizd2
	 oLRJ3Gp91vJunbD+ln4or0zpznvdYtSOgyr6LvIEUo4wSIj7z/DGl/8Zs1rMWBD2li
	 VZd2BivsksSJg==
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-61c68525abbso257868a12.3;
        Sun, 24 Aug 2025 07:41:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUZlL1YhwRxOxsRZvmCn3h/p7ABs7cAQYMcgxCyIZ1GjP5m/26Vfil2QNfrzGyb1rz+UbFcAqWNaE2A@vger.kernel.org, AJvYcCV7apoZ+MeehEjDNfnyfh5quHhCnjYynjkgoKBRBuNhs22ufyrolepKwDQg1IMmuc3VQ5w7i1Yg1NSwOuZd@vger.kernel.org, AJvYcCVPJ9k+b7/pRmvlY/a4VROfIUBZmdWtJMW7ZoxVRRG/t3dh2Ee4u5vr20311O8M1uecasvA/JK5/Oei3g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOHwFQrYR7WwU78E2Hw/mTnBREHfRbNTR62VBAbv2nv/R8BMHv
	lEQToOkesQ+P9qL5KwEE1wxiT8GaWmiQaeq3AjyJAT+zpE4EB2htSiaVkXTDZ99t8z18ZH9ANcK
	fjjd0Mwx4Ce5nVTIbLyd99ZU9MJgnRzg=
X-Google-Smtp-Source: AGHT+IHkALI6d4oV2+TB+8VkgoKkmGCHLfVRG2C5GAMOuqyPJfaHQbaGJeBvFhH5I9e2NVcqeu5elTYOGD/KNCXIfRg=
X-Received: by 2002:a05:6402:51c8:b0:61c:3ba0:64f4 with SMTP id
 4fb4d7f45d1cf-61c3ba06815mr4011336a12.14.1756046510595; Sun, 24 Aug 2025
 07:41:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250816035027.11727-2-ziyao@disroot.org> <20250816035027.11727-3-ziyao@disroot.org>
 <CAAhV-H5ZQQpHS_b9UL8UNgX9MH8-i4DV8bid00vEDzg76rgebw@mail.gmail.com> <aKCs2jUcYxYHWIB2@pie>
In-Reply-To: <aKCs2jUcYxYHWIB2@pie>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 24 Aug 2025 22:41:39 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7KDgWR0p3jaVSDhAeXtM0Aj-86N1NtK7bEZLScQ8ux9Q@mail.gmail.com>
X-Gm-Features: Ac12FXxEPV31RZBp8d2McHuEBpTKyUbhpdCKfQgd9mWv39TT7jG8ywm2lHDuRPQ
Message-ID: <CAAhV-H7KDgWR0p3jaVSDhAeXtM0Aj-86N1NtK7bEZLScQ8ux9Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: gpio: loongson: Document GPIO controller
 of 2K0300 SoC
To: Yao Zi <ziyao@disroot.org>
Cc: Yinbo Zhu <zhuyinbo@loongson.cn>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	loongarch@lists.linux.dev, Mingcong Bai <jeffbai@aosc.io>, 
	Kexy Biscuit <kexybiscuit@aosc.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 17, 2025 at 12:08=E2=80=AFAM Yao Zi <ziyao@disroot.org> wrote:
>
> On Sat, Aug 16, 2025 at 10:18:57PM +0800, Huacai Chen wrote:
> > On Sat, Aug 16, 2025 at 11:51=E2=80=AFAM Yao Zi <ziyao@disroot.org> wro=
te:
> > >
> > > Loongson 2K0300 ships a GPIO controller whose input/output control lo=
gic
> > > is similar to previous generation of SoCs. Additionally, it acts as a=
n
> > > interrupt-controller supporting both level and edge interrupts and ha=
s a
> > > distinct reset signal.
> > >
> > > Describe its compatible in devicetree. We enlarge the maximum value o=
f
> > > ngpios to 128, since the controller technically supports at most 128
> > > pins, although only 106 are routed out of the package. Properties for
> > > interrupt-controllers and resets are introduced and limited as 2K0300
> > > only.
> > >
> > > Signed-off-by: Yao Zi <ziyao@disroot.org>
> > > ---
> > >  .../bindings/gpio/loongson,ls-gpio.yaml       | 28 +++++++++++++++++=
+-
> > >  1 file changed, 27 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.=
yaml b/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml
> > > index b68159600e2b..69852444df23 100644
> > > --- a/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml
> > > +++ b/Documentation/devicetree/bindings/gpio/loongson,ls-gpio.yaml
> > > @@ -14,6 +14,7 @@ properties:
> > >      oneOf:
> > >        - enum:
> > >            - loongson,ls2k-gpio
> > > +          - loongson,ls2k0300-gpio
> > >            - loongson,ls2k0500-gpio0
> > >            - loongson,ls2k0500-gpio1
> > >            - loongson,ls2k2000-gpio0
> > > @@ -36,7 +37,7 @@ properties:
> > >
> > >    ngpios:
> > >      minimum: 1
> > > -    maximum: 64
> > > +    maximum: 128
> > >
> > >    "#gpio-cells":
> > >      const: 2
> > > @@ -49,6 +50,14 @@ properties:
> > >      minItems: 1
> > >      maxItems: 64
> > >
> > > +  "#interrupt-cells":
> > > +    const: 2
> > > +
> > > +  interrupt-controller: true
> > ls2k300 supports interrupt-controller while others don't?
>
> For these SoCs' GPIO controllers (I didn't carefully check 3A{5,6}00 and
> 7A{1,2}00), there're three different cases,
>
> 1. Controller of 2K0500, 2K1000:
>
>    These controllers have only interrupt enable bits for each GPIO.
>    Interrupts are routed directly to the parent interrupt controller and
>    there're multiple pins share the same interrupt in the parent, e.g.,
>    GPIO 0-31 share interrupt 26 of the second liointc on 2K0500.
>
>    Since we have neither an interrupt status register nor interrupt ack
>    bits, it's hard to tell which GPIO line is triggering the interrupt.
>    And we even cannot configure the polarity/edge for triggering
>    interrupts, thus I don't think these GPIO controller should be
>    described as interrupt controllers.
>
>    For these controllers, gpio-loongson-64bit.c implements GPIO
>    controller's .to_irq() method which translates GPIO descriptor to
>    corresponding IRQ number. This should work as long as there's at most
>    one interrupt consumer for each group of GPIOs that share the same
>    parent interrupt line.
>
> 2. Node controller of 2K1500 and 2K2000:
>
>    These SoCs have GPIO controllers directly attached to the "node" (I
>    think it means the CPU core, but am not sure). These controllers are
>    similar to the first class, but they have an additional feature that
>    the polarity for triggering interrupts could be configured.
>
>    Still we couldn't precisely tell which GPIO line is triggering the
>    interrupt, thus it's hard to implement it as a fully-functional
>    irqchip, either. But if we don't do so, I cannot come up with a way
>    to describe the polarity settings. I'm unsure whether these
>    controllers should be implemented as interrupt controllers.
>
> 3. South-bridge controller of 2K1500 and 2K2000, and 2K0300's
>    controller:
>
>    Reading through the public TRM, I'm sure these're all fully
>    functional interrupt controllers, and should be implemented as
>    interrupt controllers.
>
>    However, this also means the current binding for 2K1500/2K2000's
>    south-bridge controller is WRONG, and a fix it seems to bring in ABI
>    breakages (interrupt-controller/interrupt-cells are a must). But
>    since I don't have these devices on hand, and they are at least not
>    related to the situation of 2K0300, I decided to keep them as-is.
>
> So the answer to the original question is, no, at least 2K1500/2K2000's
> south-bridge GPIO controllers are also interrupt controllers according
> to their public documentation. But I cannot test my GPIO changes against
> them since I don't have such boards, and fixing the binding up may break
> the ABI, thus I leave them as-is in this "support for 2K0300" series.
Then I think more SOCs rather than LS2K0300 support
interrupt-controller. Though the driver is not support yet, they can
be improved later (of course unnecessary in this series), so in my
opinion just keep the dt-binding in the same file is reasonable.


Huacai

>
> > Huacai
>
> Best regards,
> Yao Zi
>
> > > +
> > > +  resets:
> > > +    maxItems: 1
> > > +
> > >  required:
> > >    - compatible
> > >    - reg
> > > @@ -58,6 +67,23 @@ required:
> > >    - gpio-ranges
> > >    - interrupts
> > >
> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            const: loongson,ls2k0300-gpio
> > > +    then:
> > > +      required:
> > > +        - "#interrupt-cells"
> > > +        - interrupt-controller
> > > +        - resets
> > > +    else:
> > > +      properties:
> > > +        "#interrupts-cells": false
> > > +        interrupt-controller: false
> > > +        resets: false
> > > +
> > >  additionalProperties: false
> > >
> > >  examples:
> > > --
> > > 2.50.1
> > >

