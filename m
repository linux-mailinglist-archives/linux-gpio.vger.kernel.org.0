Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6170387A52
	for <lists+linux-gpio@lfdr.de>; Tue, 18 May 2021 15:44:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233761AbhERNpR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 May 2021 09:45:17 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]:46723 "EHLO
        mail-ot1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233678AbhERNpR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 May 2021 09:45:17 -0400
Received: by mail-ot1-f48.google.com with SMTP id d3-20020a9d29030000b029027e8019067fso8609558otb.13;
        Tue, 18 May 2021 06:43:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4jm0S8ddMwt/uhSM0T7FAx+DzX2TUerJKHM1uev3sJo=;
        b=riw202ukrBM78UBj9hYe4zJU9NOD65jD87FO6+IYAdI8bz3xAK+MoRmtvZazxeQFfh
         mLg+fnbE588xucUhCL95oso0d9rKZM7T7ddxFSAPoW48O7Rjbn263Ak/TkRUTJ8KIiGQ
         lFFgSlL6gAuJxX1axS7LcZz5Z/ZHo5jTC+rc+Gxnjj8xkxhFzy4AAeyyVjSWM5yIWfgd
         JPnse6YJa+yM0uh8IYd00Oi4ETZ3HPQGri5L9tj37mPJMF0I/zJ4k32PR3vSr1lMrR1a
         61wCamM0YbeIdQiC1ZTMs0QA/Q0YScM7ipqKPK0IxfsZTjrjeUNQt7b9zN5Qgb6vGB7J
         3ipA==
X-Gm-Message-State: AOAM5331dWyXRBUxiWUrkvhyJ/vbFFfE0gXvc72poT1H2qTyFF0ZBtMo
        AbMkRu3huQ0kDUPAcG/DeJnYPZPHSg==
X-Google-Smtp-Source: ABdhPJwqRh21mnQ7HNrbhfem5wZW2JCmKm+iiEQPID+joQ5Q/8Y/FKtUHNCGH2kOT/YhySo/mrnZzQ==
X-Received: by 2002:a9d:4617:: with SMTP id y23mr4197255ote.71.1621345438482;
        Tue, 18 May 2021 06:43:58 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id e20sm3610817oot.11.2021.05.18.06.43.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 May 2021 06:43:57 -0700 (PDT)
Received: (nullmailer pid 561495 invoked by uid 1000);
        Tue, 18 May 2021 13:43:56 -0000
Date:   Tue, 18 May 2021 08:43:56 -0500
From:   Rob Herring <robh@kernel.org>
To:     Mark Kettenis <mark.kettenis@xs4all.nl>
Cc:     devicetree@vger.kernel.org, Mark Kettenis <kettenis@openbsd.org>,
        Hector Martin <marcan@marcan.st>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: Add DT bindings for
 apple,pinctrl
Message-ID: <20210518134356.GA553438@robh.at.kernel.org>
References: <20210516183221.93686-1-mark.kettenis@xs4all.nl>
 <20210516183221.93686-2-mark.kettenis@xs4all.nl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210516183221.93686-2-mark.kettenis@xs4all.nl>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, May 16, 2021 at 08:32:17PM +0200, Mark Kettenis wrote:
> From: Mark Kettenis <kettenis@openbsd.org>
> 
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
> index 000000000000..fae23e1d845e
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
> +  The Apple GPIO controller is a simple combined pin and GPIO
> +  controller present on Apple ARM SoC platforms, including various
> +  iPhone and iPad devices and the "Apple Silicon" Macs.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: apple,t8103-pinctrl
> +      - const: apple,pinctrl
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

Add some description about what each interrupt is.

Is this really 1-7 or either 1 or 7?

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
