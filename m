Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65FBB37908B
	for <lists+linux-gpio@lfdr.de>; Mon, 10 May 2021 16:22:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234940AbhEJOXB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 May 2021 10:23:01 -0400
Received: from mail-oi1-f170.google.com ([209.85.167.170]:37784 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236516AbhEJOVE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 10 May 2021 10:21:04 -0400
Received: by mail-oi1-f170.google.com with SMTP id k25so15938532oic.4;
        Mon, 10 May 2021 07:19:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Xxim8cHyuv3aQsXeyTGVS5baHIbON8x4VQ5A3cTb2no=;
        b=Uj0H+cyu8EHliIUbpr07jbdqrMdN/puGQj68Dop/9n1Z1Q/MbHClZos1LxSQIaMObu
         xPi/gXpynlelVWIKJufDzMveNPGygoAMo9innoREPzn/7IO+tfT6IobJ6Xc3Cyt7AVRC
         Wr9k4G201NpE/sDLQNcwpCiY8K7i4D2X3XIckpREyamCfw8tsDelpxZE6UtfGjLNo1Ab
         DJEFTbnav8AOJbeGUk/B7iUDmU4+QGfzXkuqN+/iYzPiuZMhOm3QPwRNQScl6kI2JiiA
         J3+IXHgAg/FB4eaKYgZHzFOw6tUj/zKgozk9D+J+2hbQY0EpNaS61yXyCF50KtEF491i
         1x1A==
X-Gm-Message-State: AOAM5320nWakDfzjFnrvzc09oXRJSRF0CoR0fHEGsPasAkgVrrklysaw
        ORsPeUul9j9txUkN4pJ6KsGcNChAgQ==
X-Google-Smtp-Source: ABdhPJzpnx1I/ZpiefM9HtU5dweQEqfetQ9/ccma/JHf2wc3p3czuN58xU+6pgRViMkLpmnbxMkA9A==
X-Received: by 2002:a54:4e96:: with SMTP id c22mr18128078oiy.176.1620656398438;
        Mon, 10 May 2021 07:19:58 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e6sm786334otk.64.2021.05.10.07.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 May 2021 07:19:56 -0700 (PDT)
Received: (nullmailer pid 65223 invoked by uid 1000);
        Mon, 10 May 2021 14:19:55 -0000
Date:   Mon, 10 May 2021 09:19:55 -0500
From:   Rob Herring <robh@kernel.org>
To:     Mark Kettenis <kettenis@openbsd.org>
Cc:     devicetree@vger.kernel.org, Hector Martin <marcan@marcan.st>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: Add DT bindings for
 apple,pinctrl
Message-ID: <20210510141955.GA58072@robh.at.kernel.org>
References: <20210508142000.85116-1-kettenis@openbsd.org>
 <20210508142000.85116-2-kettenis@openbsd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210508142000.85116-2-kettenis@openbsd.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, May 08, 2021 at 04:19:55PM +0200, Mark Kettenis wrote:
> The Apple GPIO controller is a simple combined pin and GPIO conroller
> present on Apple ARM SoC platforms, including various iPhone and iPad
> devices and the "Apple Silicon" Macs.
> 
> Signed-off-by: Mark Kettenis <kettenis@openbsd.org>
> ---
>  .../bindings/pinctrl/apple,pinctrl.yaml       | 103 ++++++++++++++++++
>  MAINTAINERS                                   |   2 +
>  include/dt-bindings/pinctrl/apple.h           |  13 +++
>  3 files changed, 118 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/apple.h
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
> new file mode 100644
> index 000000000000..cc7805ca6ba1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple GPIO controller
> +
> +maintainers:
> +  - Mark Kettenis <kettenis@openbsd.org>
> +
> +description: |
> +  The Apple GPIO controller is a simple combined pin and GPIO conroller
> +  present on Apple ARM SoC platforms, including various iPhone and iPad
> +  devices and the "Apple Silicon" Macs.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: apple,t8103-pinctrl
> +      - const: apple,pinctrl

A genericish fallback is maybe questionable for pinctrl. That's not 
often the same from one SoC to the next.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 7
> +
> +  interrupt-controller: true
> +
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    $ref: pinmux-node.yaml#
> +
> +    properties:
> +      pinmux:
> +        description:
> +          Values are constructed from pin number and alternate function
> +          configuration number using the APPLE_PINMUX() helper macro
> +          defined in include/dt-bindings/pinctrl/apple.h.
> +
> +    required:
> +      - pinmux
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - gpio-ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/apple-aic.h>
> +    #include <dt-bindings/pinctrl/apple.h>
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      pinctrl: pinctrl@23c100000 {
> +        compatible = "apple,t8103-pinctrl", "apple,pinctrl";
> +        reg = <0x2 0x3c100000 0x0 0x100000>;
> +        clocks = <&gpio_clk>;
> +
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&pinctrl 0 0 212>;
> +
> +        interrupt-controller;
> +        interrupt-parent = <&aic>;
> +        interrupts = <AIC_IRQ 16 IRQ_TYPE_LEVEL_HIGH>,
> +                     <AIC_IRQ 17 IRQ_TYPE_LEVEL_HIGH>,
> +                     <AIC_IRQ 18 IRQ_TYPE_LEVEL_HIGH>,
> +                     <AIC_IRQ 19 IRQ_TYPE_LEVEL_HIGH>,
> +                     <AIC_IRQ 20 IRQ_TYPE_LEVEL_HIGH>,
> +                     <AIC_IRQ 21 IRQ_TYPE_LEVEL_HIGH>,
> +                     <AIC_IRQ 22 IRQ_TYPE_LEVEL_HIGH>;
> +
> +        pcie_pins: pcie-pins {
> +          pinmux = <APPLE_PINMUX(150, 1)>,
> +                   <APPLE_PINMUX(151, 1)>,
> +                   <APPLE_PINMUX(32, 1)>;
> +        };
> +      };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ad0e9be66885..7327c9b778f1 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1654,9 +1654,11 @@ C:	irc://chat.freenode.net/asahi-dev
>  T:	git https://github.com/AsahiLinux/linux.git
>  F:	Documentation/devicetree/bindings/arm/apple.yaml
>  F:	Documentation/devicetree/bindings/interrupt-controller/apple,aic.yaml
> +F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
>  F:	arch/arm64/boot/dts/apple/
>  F:	drivers/irqchip/irq-apple-aic.c
>  F:	include/dt-bindings/interrupt-controller/apple-aic.h
> +F:	include/dt-bindings/pinctrl/apple.h
>  
>  ARM/ARTPEC MACHINE SUPPORT
>  M:	Jesper Nilsson <jesper.nilsson@axis.com>
> diff --git a/include/dt-bindings/pinctrl/apple.h b/include/dt-bindings/pinctrl/apple.h
> new file mode 100644
> index 000000000000..ea0a6f466592
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/apple.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0+ OR MIT */
> +/*
> + * This header provides constants for Apple pinctrl bindings.
> + */
> +
> +#ifndef _DT_BINDINGS_PINCTRL_APPLE_H
> +#define _DT_BINDINGS_PINCTRL_APPLE_H
> +
> +#define APPLE_PINMUX(pin, func) ((pin) | ((func) << 16))
> +#define APPLE_PIN(pinmux) ((pinmux) & 0xffff)
> +#define APPLE_FUNC(pinmux) ((pinmux) >> 16)
> +
> +#endif /* _DT_BINDINGS_PINCTRL_APPLE_H */
> -- 
> 2.31.1
> 
