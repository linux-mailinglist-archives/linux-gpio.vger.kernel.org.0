Return-Path: <linux-gpio+bounces-9750-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C895696B253
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 09:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2B4C5B20DBB
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 07:05:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1DDA145B07;
	Wed,  4 Sep 2024 07:05:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 521E91EC01C;
	Wed,  4 Sep 2024 07:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725433526; cv=none; b=ihiG5W07Z52A5cfsDHFxLJg4RHEvHNRXfbEvuTp5cgEIfZub2L1n3UkDMXJ8QdbbVuxQTSDMDjYecvuUMAeAB7QhgDV1bz5hzK1f6lIroo9M40tjSmKcryFWgvxrFyYqGj/lgLPj3hoIxdiaNME7bLrYuJsU2x7J8+SL+DGFtes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725433526; c=relaxed/simple;
	bh=c7qUXUOvGX+WYqEK4G2pw0HsJjV4YrvOvUOiIHnfWT0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mKmAqgKUOEQel5pgb1LVKX56FZW0UZs+ehOdy7yFFXLfIkN6wuIs7Wv+xOIQuCGv+jgAyEdv6PelHfoZY0guCW0gh6CPx2Zo3SYbAAmowxwd9SV+lmKMlVR5j6GNElqT6idPfvXZUEGXX+ZGgBmx7w+v2+Yqr8YUDJsZ1xmjdZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Date: Wed, 4 Sep 2024 07:05:20 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Yangyu Chen <cyy@cyyself.name>,
	Jisheng Zhang <jszhang@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Icenowy Zheng <uwu@icenowy.me>,
	Meng Zhang <zhangmeng.kevin@spacemit.com>,
	Meng Zhang <kevin.z.m@hotmail.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/3] dt-bindings: gpio: spacemit: add support for K1 SoC
Message-ID: <20240904070520-GYA107481@gentoo>
References: <20240904-03-k1-gpio-v1-0-6072ebeecae0@gentoo.org>
 <20240904-03-k1-gpio-v1-1-6072ebeecae0@gentoo.org>
 <ttvqw3hncprtshhdgsnvlfopobqcxtsraxevgxqgnlt6orftkr@ktahud64cczd>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ttvqw3hncprtshhdgsnvlfopobqcxtsraxevgxqgnlt6orftkr@ktahud64cczd>

Hi Krzysztof 

On 08:46 Wed 04 Sep     , Krzysztof Kozlowski wrote:
> On Wed, Sep 04, 2024 at 12:27:23AM +0000, Yixun Lan wrote:
> > The GPIO controller of K1 support basic functions as input/output,
> > all pins can be used as interrupt which route to one IRQ line,
> > trigger type can be select between rising edge, failing edge, or both.
> > There are four GPIO banks, each consisting of 32 pins.
> > 
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
> > ---
> >  .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 95 ++++++++++++++++++++++
> >  1 file changed, 95 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> > new file mode 100644
> > index 0000000000000..db2e62fb452fd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> > @@ -0,0 +1,95 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/gpio/spacemit,k1-gpio.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SpacemiT K1 GPIO controller
> > +
> > +description: >
> 
> Drop >
> 
> > +  The controller's registers are organized as sets of eight 32-bit
> > +  registers with each set controlling a bank of up to 32 pins.  A single
> > +  interrupt is shared for all of the banks handled by the controller.
> > +
> > +maintainers:
> > +  - Yixun Lan <dlan@gentoo.org>
> 
> Maintainers go before description. Use example-schema as template.
> 
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: '^gpio@[0-9a-f]+$'
> 
> 
> No, why? Drop.
> 
> > +
> > +  compatible:
> > +    items:
> 
> and you can drop items as well.
> 
> > +      - const: spacemit,k1-gpio
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: >
> 
> Drop >. Everywhere.
> 
> > +      Define the base and range of the I/O address space containing
> > +      the SpacemiT K1 GPIO controller registers
> 
> Redundant description, drop.
> 
> > +
> > +  ranges: true
> > +
> > +  "#gpio-cells":
> > +    const: 2
> > +    description: >
> > +      The first cell is the pin number (within the controller's
> > +      pin space), and the second is used for the following:
> > +      bit[0]: polarity (0 for active-high, 1 for active-low)
> 
> Rather refer to standard GPIO bindings header.
> 
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
> > +  interrupt-names:
> > +    items:
> > +      - const: gpio_mux
> > +
> > +  "#interrupt-cells":
> > +    const: 2
> > +    description: |
> > +      The first cell is the GPIO number, the second should specify
> > +      flags.  The following subset of flags is supported:
> > +      - bits[3:0] trigger type flags (no level trigger type support)
> > +        1 = low-to-high edge triggered
> > +        2 = high-to-low edge triggered
> > +      Valid combinations are 1, 2, 3
> 
> Hm? No, you must use standard interrupt flags, not custom ones.
> 
It should be same as standard flags, my intention here was try to say
the controller support edge trigger only, but no level trigger flags (4, 8)
should I just replace number to macro, and put it like this:

The value is defined in <dt-bindings/interrupt-controller/irq.h>
Only the following flags are supported:
    IRQ_TYPE_EDGE_RISING
    IRQ_TYPE_EDGE_FALLING
    IRQ_TYPE_EDGE_BOTH


> > +
> > +  interrupt-controller: true
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - gpio-controller
> > +  - '#gpio-cells'
> > +  - interrupts
> > +  - interrupt-names
> > +  - interrupt-controller
> > +  - '#interrupt-cells'
> 
> Use consistent quotes. Either ' or ".
> 
> > +
> > +additionalProperties: false
> 
> Best regards,
> Krzysztof

Ack for other comments, will address them in next version, thanks

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

