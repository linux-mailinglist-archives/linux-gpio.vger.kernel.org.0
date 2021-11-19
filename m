Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 490A4457372
	for <lists+linux-gpio@lfdr.de>; Fri, 19 Nov 2021 17:52:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233149AbhKSQzK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 19 Nov 2021 11:55:10 -0500
Received: from mail-ot1-f45.google.com ([209.85.210.45]:34704 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231490AbhKSQzJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 Nov 2021 11:55:09 -0500
Received: by mail-ot1-f45.google.com with SMTP id x19-20020a9d7053000000b0055c8b39420bso17710653otj.1;
        Fri, 19 Nov 2021 08:52:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m6dOJqza024zxJcObHIg6hHGrGnAwml5A1GNDr9O/Yw=;
        b=0Do91YQS5nD/kKdJROO1/Ck7klGn9nzO9wE7/U/yTrWLxjGkcVRelE/lTtk3QxuZqQ
         O2AZBfK1QW9XxroVnUa0yB2VgjbW7ZVqVkhGGbJ0Vf9jA9qZNVfhY5eNjxwVSLRMXl1V
         0PdTRhKriq2kvcS8jTiXy7wrQa78Cju1dX+su4byOvgfL1nQlSGWPC8hCZ7z2Nw3tILM
         XLwoaeWic5Xanv9Zu7dZJ+PS47kkiNoSv4XfKgw0uFTNYtkH9Ape8cZqvLdvlADE6q4Z
         tIi4tI5Jw+q9Lc3LokfU4b9kdChC/sG0d4F4chSk5oWC7A5VmEf5DpH5sbofIhDVH7Wp
         w4bw==
X-Gm-Message-State: AOAM532Hd+QH7ogZfBirUCniYuEEpEUKgTJKUkP3JCVensvSv7k/Zply
        TqVLPVaqSFErCiQLnfCP5A==
X-Google-Smtp-Source: ABdhPJxnOLr2iVeUXAhtu2Pkwy7lHu/BG9dVEemniRDcwDU4UbzTISoEVqaeUF4fD47wo/MRoGRqLg==
X-Received: by 2002:a9d:4e97:: with SMTP id v23mr5926644otk.315.1637340727184;
        Fri, 19 Nov 2021 08:52:07 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id 70sm65010otn.74.2021.11.19.08.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Nov 2021 08:52:06 -0800 (PST)
Received: (nullmailer pid 4011827 invoked by uid 1000);
        Fri, 19 Nov 2021 16:52:04 -0000
Date:   Fri, 19 Nov 2021 10:52:04 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [RFC PATCH v3 1/7] dt-bindings: interrupt-controller: Add
 Renesas RZ/G2L Interrupt Controller
Message-ID: <YZfWNNkO1Kcghona@robh.at.kernel.org>
References: <20211110225808.16388-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20211110225808.16388-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110225808.16388-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 10, 2021 at 10:58:02PM +0000, Lad Prabhakar wrote:
> Add DT bindings for the Renesas RZ/G2L Interrupt Controller.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../renesas,rzg2l-irqc.yaml                   | 137 ++++++++++++++++++
>  1 file changed, 137 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
> new file mode 100644
> index 000000000000..ebe318fe336b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
> @@ -0,0 +1,137 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/renesas,rzg2l-irqc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/G2L Interrupt Controller
> +
> +maintainers:
> +  - Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +
> +description: |
> +  The RZ/G2L Interrupt Controller is a front-end for the GIC found on Renesas RZ/G2L SoC's
> +    - IRQ sense select for 8 external interrupts, mapped to 8 GIC SPI interrupts
> +    - GPIO pins used as external interrupt input pins, mapped to 32 GIC SPI interrupts
> +    - NMI edge select (NMI is not treated as NMI exception and supports fall edge and
> +      stand-up edge detection interrupts)
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - renesas,r9a07g044-irqc # RZ/G2L
> +      - const: renesas,rzg2l-irqc
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  '#address-cells':
> +    const: 0
> +
> +  interrupt-controller: true
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupt-map:
> +    maxItems: 41
> +    description: Specifies the mapping from external interrupts to GIC interrupts.
> +
> +  interrupt-map-mask:
> +    items:
> +      - const: 40
> +      - const: 0

Are you sure this is what you want? I'd expect <0xff 0x0> here.

Otherwise, it's kind of pointless to list out 41 interrupt-map entries.

> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: clk
> +      - const: pclk
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - '#interrupt-cells'
> +  - '#address-cells'
> +  - interrupt-controller
> +  - reg
> +  - interrupt-map
> +  - interrupt-map-mask
> +  - clocks
> +  - clock-names
> +  - power-domains
> +  - resets
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/r9a07g044-cpg.h>
> +
> +    irqc: interrupt-controller@110a0000 {
> +            compatible = "renesas,r9a07g044-irqc", "renesas,rzg2l-irqc";
> +            #interrupt-cells = <2>;
> +            #address-cells = <0>;
> +            interrupt-controller;
> +            reg = <0x110a0000 0x10000>;
> +            interrupt-map = <0 0 &gic GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> +                            <1 0 &gic GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
> +                            <2 0 &gic GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
> +                            <3 0 &gic GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> +                            <4 0 &gic GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +                            <5 0 &gic GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
> +                            <6 0 &gic GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> +                            <7 0 &gic GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> +                            <8 0 &gic GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +                            <9 0 &gic GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>,
> +                            <10 0 &gic GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>,
> +                            <11 0 &gic GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>,
> +                            <12 0 &gic GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH>,
> +                            <13 0 &gic GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
> +                            <14 0 &gic GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
> +                            <15 0 &gic GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
> +                            <16 0 &gic GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
> +                            <17 0 &gic GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>,
> +                            <18 0 &gic GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH>,
> +                            <19 0 &gic GIC_SPI 454 IRQ_TYPE_LEVEL_HIGH>,
> +                            <20 0 &gic GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
> +                            <21 0 &gic GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
> +                            <22 0 &gic GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
> +                            <23 0 &gic GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
> +                            <24 0 &gic GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
> +                            <25 0 &gic GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
> +                            <26 0 &gic GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
> +                            <27 0 &gic GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
> +                            <28 0 &gic GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
> +                            <29 0 &gic GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
> +                            <30 0 &gic GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
> +                            <31 0 &gic GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
> +                            <32 0 &gic GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
> +                            <33 0 &gic GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
> +                            <34 0 &gic GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
> +                            <35 0 &gic GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>,
> +                            <36 0 &gic GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>,
> +                            <37 0 &gic GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>,
> +                            <38 0 &gic GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
> +                            <39 0 &gic GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>,
> +                            <40 0 &gic GIC_SPI 475 IRQ_TYPE_LEVEL_HIGH>;
> +                        interrupt-map-mask = <40 0>;
> +                        clocks = <&cpg CPG_MOD R9A07G044_IA55_CLK>,
> +                                 <&cpg CPG_MOD R9A07G044_IA55_PCLK>;
> +                        clock-names = "clk", "pclk";
> +                        power-domains = <&cpg>;
> +                        resets = <&cpg R9A07G044_IA55_RESETN>;
> +    };
> -- 
> 2.17.1
> 
> 
