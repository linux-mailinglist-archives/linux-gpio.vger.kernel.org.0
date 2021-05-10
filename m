Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7EF453794FB
	for <lists+linux-gpio@lfdr.de>; Mon, 10 May 2021 19:06:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231308AbhEJRHS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 May 2021 13:07:18 -0400
Received: from sibelius.xs4all.nl ([83.163.83.176]:63725 "EHLO
        sibelius.xs4all.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231230AbhEJRHR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 May 2021 13:07:17 -0400
Received: from localhost (bloch.sibelius.xs4all.nl [local])
        by bloch.sibelius.xs4all.nl (OpenSMTPD) with ESMTPA id 6706a4c6;
        Mon, 10 May 2021 19:06:10 +0200 (CEST)
Date:   Mon, 10 May 2021 19:06:10 +0200 (CEST)
From:   Mark Kettenis <mark.kettenis@xs4all.nl>
To:     Rob Herring <robh@kernel.org>
Cc:     kettenis@openbsd.org, devicetree@vger.kernel.org, marcan@marcan.st,
        linus.walleij@linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20210510141955.GA58072@robh.at.kernel.org> (message from Rob
        Herring on Mon, 10 May 2021 09:19:55 -0500)
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Add DT bindings for
 apple,pinctrl
References: <20210508142000.85116-1-kettenis@openbsd.org>
 <20210508142000.85116-2-kettenis@openbsd.org> <20210510141955.GA58072@robh.at.kernel.org>
Message-ID: <5612be5a12568600@bloch.sibelius.xs4all.nl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> Date: Mon, 10 May 2021 09:19:55 -0500
> From: Rob Herring <robh@kernel.org>

Hi Rob,

> On Sat, May 08, 2021 at 04:19:55PM +0200, Mark Kettenis wrote:
> > The Apple GPIO controller is a simple combined pin and GPIO conroller
> > present on Apple ARM SoC platforms, including various iPhone and iPad
> > devices and the "Apple Silicon" Macs.
> > 
> > Signed-off-by: Mark Kettenis <kettenis@openbsd.org>
> > ---
> >  .../bindings/pinctrl/apple,pinctrl.yaml       | 103 ++++++++++++++++++
> >  MAINTAINERS                                   |   2 +
> >  include/dt-bindings/pinctrl/apple.h           |  13 +++
> >  3 files changed, 118 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
> >  create mode 100644 include/dt-bindings/pinctrl/apple.h
> > 
> > diff --git a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
> > new file mode 100644
> > index 000000000000..cc7805ca6ba1
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
> > @@ -0,0 +1,103 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Apple GPIO controller
> > +
> > +maintainers:
> > +  - Mark Kettenis <kettenis@openbsd.org>
> > +
> > +description: |
> > +  The Apple GPIO controller is a simple combined pin and GPIO conroller
> > +  present on Apple ARM SoC platforms, including various iPhone and iPad
> > +  devices and the "Apple Silicon" Macs.
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: apple,t8103-pinctrl
> > +      - const: apple,pinctrl
> 
> A genericish fallback is maybe questionable for pinctrl. That's not 
> often the same from one SoC to the next.

Krzysztof raised a similar point.  It seems that Apple isn't in the
habit of changing this aspect of their SoCs.  Judging from

  https://github.com/corellium/linux-sandcastle/blob/sandcastle-5.4/drivers/pinctrl/pinctrl-hx-gpio.c

Apple has been using a controller with the same register layout and
the same known bits in those registers since the T8010 SoC (the A10
used in the iPhone 7).  So there is some confidence that a single
driver will work for many generations of the SoC.  Of course we don't
have any authoritative documentaton on these SoCs so I can't be 100%
sure that there aren't any subtle differences in the behaviour of the
hardware.  That's why I also include a more specific compatible for
the T8103 SoC (the M1 used in the current Macs).

> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  gpio-controller: true
> > +
> > +  '#gpio-cells':
> > +    const: 2
> > +
> > +  gpio-ranges:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    minItems: 1
> > +    maxItems: 7
> > +
> > +  interrupt-controller: true
> > +
> > +patternProperties:
> > +  '-pins$':
> > +    type: object
> > +    $ref: pinmux-node.yaml#
> > +
> > +    properties:
> > +      pinmux:
> > +        description:
> > +          Values are constructed from pin number and alternate function
> > +          configuration number using the APPLE_PINMUX() helper macro
> > +          defined in include/dt-bindings/pinctrl/apple.h.
> > +
> > +    required:
> > +      - pinmux
> > +
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - gpio-controller
> > +  - '#gpio-cells'
> > +  - gpio-ranges
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/interrupt-controller/apple-aic.h>
> > +    #include <dt-bindings/pinctrl/apple.h>
> > +
> > +    soc {
> > +      #address-cells = <2>;
> > +      #size-cells = <2>;
> > +
> > +      pinctrl: pinctrl@23c100000 {
> > +        compatible = "apple,t8103-pinctrl", "apple,pinctrl";
> > +        reg = <0x2 0x3c100000 0x0 0x100000>;
> > +        clocks = <&gpio_clk>;
> > +
> > +        gpio-controller;
> > +        #gpio-cells = <2>;
> > +        gpio-ranges = <&pinctrl 0 0 212>;
> > +
> > +        interrupt-controller;
> > +        interrupt-parent = <&aic>;
> > +        interrupts = <AIC_IRQ 16 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <AIC_IRQ 17 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <AIC_IRQ 18 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <AIC_IRQ 19 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <AIC_IRQ 20 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <AIC_IRQ 21 IRQ_TYPE_LEVEL_HIGH>,
> > +                     <AIC_IRQ 22 IRQ_TYPE_LEVEL_HIGH>;
> > +
> > +        pcie_pins: pcie-pins {
> > +          pinmux = <APPLE_PINMUX(150, 1)>,
> > +                   <APPLE_PINMUX(151, 1)>,
> > +                   <APPLE_PINMUX(32, 1)>;
> > +        };
> > +      };
> > +    };
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index ad0e9be66885..7327c9b778f1 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -1654,9 +1654,11 @@ C:	irc://chat.freenode.net/asahi-dev
> >  T:	git https://github.com/AsahiLinux/linux.git
> >  F:	Documentation/devicetree/bindings/arm/apple.yaml
> >  F:	Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
> > +F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
> >  F:	arch/arm64/boot/dts/apple/
> >  F:	drivers/irqchip/irq-apple-aic.c
> >  F:	include/dt-bindings/interrupt-controller/apple-aic.h
> > +F:	include/dt-bindings/pinctrl/apple.h
> >  
> >  ARM/ARTPEC MACHINE SUPPORT
> >  M:	Jesper Nilsson <jesper.nilsson@axis.com>
> > diff --git a/include/dt-bindings/pinctrl/apple.h b/include/dt-bindings/pinctrl/apple.h
> > new file mode 100644
> > index 000000000000..ea0a6f466592
> > --- /dev/null
> > +++ b/include/dt-bindings/pinctrl/apple.h
> > @@ -0,0 +1,13 @@
> > +/* SPDX-License-Identifier: GPL-2.0+ OR MIT */
> > +/*
> > + * This header provides constants for Apple pinctrl bindings.
> > + */
> > +
> > +#ifndef _DT_BINDINGS_PINCTRL_APPLE_H
> > +#define _DT_BINDINGS_PINCTRL_APPLE_H
> > +
> > +#define APPLE_PINMUX(pin, func) ((pin) | ((func) << 16))
> > +#define APPLE_PIN(pinmux) ((pinmux) & 0xffff)
> > +#define APPLE_FUNC(pinmux) ((pinmux) >> 16)
> > +
> > +#endif /* _DT_BINDINGS_PINCTRL_APPLE_H */
> > -- 
> > 2.31.1
> > 
> 
