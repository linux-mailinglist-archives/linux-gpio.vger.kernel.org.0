Return-Path: <linux-gpio+bounces-14047-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 579369F87C1
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 23:19:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 50FCF188F6B8
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Dec 2024 22:19:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34E7D1C5CB6;
	Thu, 19 Dec 2024 22:19:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852E019C56D;
	Thu, 19 Dec 2024 22:19:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734646744; cv=none; b=kNUB0tdty0NIKA4FR9wf2Hwh7ya2hA089HbDJHKTVh05svKW0EX6BlugTEIVXEp2qxJvuXC+pEERvmNpeNlcsYW1qgwkLtP/2mxh+slRhMcfuxvcKhZPPhlxHFHVQHckeZRDt4UuV4GQFTad+iBYYpHZ1xgSVR/h73BlzYo9yXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734646744; c=relaxed/simple;
	bh=IhOKzZ544EBy/3fLZOlhlyonZaEd8yvXs4xoRAQ4kSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sHa9rQ7BfQatgrZa14y3miSgPDhe4TBlZOMJfiOGg3juYnbhQMFd7u76b920/+K5enbM47Mv8GcV5pR7lX+ouUG+cO8eVjrsgUhZeAAGQxRY76YZtuNv1PdNVvs5lTQQZ+MXZg6owd85Xkk7+i4XCOEOsWKrmI/FdYj2uiW4hOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Date: Fri, 20 Dec 2024 06:18:57 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Yangyu Chen <cyy@cyyself.name>,
	Jisheng Zhang <jszhang@kernel.org>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@spacemit.com>,
	Meng Zhang <kevin.z.m@hotmail.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: gpio: spacemit: add support for K1
 SoC
Message-ID: <20241219221857-GYA3769757@gentoo>
References: <20241219-03-k1-gpio-v2-0-28444fd221cd@gentoo.org>
 <20241219-03-k1-gpio-v2-1-28444fd221cd@gentoo.org>
 <20241219-secret-passenger-350d9c54fdf9@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-secret-passenger-350d9c54fdf9@spud>

Hi Conor:

thanks for your review

On 19:52 Thu 19 Dec     , Conor Dooley wrote:
> On Thu, Dec 19, 2024 at 03:17:43PM +0800, Yixun Lan wrote:
> > The GPIO controller of K1 support basic functions as input/output,
> > all pins can be used as interrupt which route to one IRQ line,
> > trigger type can be select between rising edge, failing edge, or both.
> > There are four GPIO banks, each consisting of 32 pins.
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 75 ++++++++++++++++++++++
> >  1 file changed, 75 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..3d3d0b3bf2c144ed57b717bee50064949e26f087
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> > @@ -0,0 +1,75 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/gpio/spacemit,k1-gpio.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SpacemiT K1 GPIO controller
> > +
> > +maintainers:
> > +  - Yixun Lan <dlan@gentoo.org>
> > +
> > +description:
> > +  The controller's registers are organized as sets of eight 32-bit
> > +  registers with each set controlling a bank of up to 32 pins.  A single
> > +  interrupt is shared for all of the banks handled by the controller.
> > +
> > +properties:
> > +  compatible:
> > +    const: spacemit,k1-gpio
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  ranges: true
> 
> What do you need this for?
> 
right, this isn't needed, will drop it.

> > +
> > +  "#gpio-cells":
> > +    const: 2
> > +
> > +  gpio-controller: true
> > +
> > +  gpio-ranges: true
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +    description:
> > +      The interrupt shared by all GPIO lines for this controller.
> > +
> > +  interrupt-names: true
> 
> Not that a name is valuable when you only have one interrupt, but if you
> don't specify what the name is, you cannot interrupt-names!
> 
indeed there is one interrupt, I will drop this property

> Cheers,
> Conor.
> 
> > +
> > +  "#interrupt-cells":
> > +    const: 2
> > +    description:
> > +      The first cell is the GPIO number, the second should specify interrupt
> > +      flag. The controller does not support level interrupts, flags of
> > +      IRQ_TYPE_LEVEL_HIGH, IRQ_TYPE_LEVEL_LOW should not be used.
> > +      Refer <dt-bindings/interrupt-controller/irq.h> for valid flags.
> > +
> > +  interrupt-controller: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - gpio-controller
> > +  - "#gpio-cells"
> > +  - interrupts
> > +  - interrupt-names
> > +  - interrupt-controller
> > +  - "#interrupt-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    gpio@d4019000 {
> > +        compatible = "spacemit,k1-gpio";
> > +        reg = <0xd4019000 0x800>;
> > +        gpio-controller;
> > +        #gpio-cells = <2>;
> > +        interrupts = <58>;
> > +        interrupt-names = "gpio_mux";
> > +        interrupt-parent = <&plic>;
> > +        interrupt-controller;
> > +        #interrupt-cells = <2>;
> > +        gpio-ranges = <&pinctrl 0 0 128>;
> > +    };
> > 
> > -- 
> > 2.47.0
> > 



-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

