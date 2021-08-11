Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 298DA3E97C5
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Aug 2021 20:39:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230309AbhHKSkG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Aug 2021 14:40:06 -0400
Received: from mail-pj1-f49.google.com ([209.85.216.49]:50786 "EHLO
        mail-pj1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229791AbhHKSkG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Aug 2021 14:40:06 -0400
Received: by mail-pj1-f49.google.com with SMTP id bo18so5025042pjb.0;
        Wed, 11 Aug 2021 11:39:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pTvPSpyC9Nkqmh26QibnatD/9/QImOoArLrGrnL4t8w=;
        b=JtRZ+20AQYpecRZi5+/VCEGiByvDKlxWw6781JGk7o81XLt04sWhaR0EmmypK/izpn
         SRpR1oqvS02CKcrTQZBwLHxl5yv9jqEuZnRuaSR+gLKJsVOB/3i83dg6FoPO2VSq35Xp
         C7ZCVeh7IjOwadnICviasXcfE8K1ePj9ZlBdI9u4L8Z+2glwzxjGshlxqIPeYkR8jIdz
         sehAqwXSqEix1C1jBJkstifYCBpR5gLl5+a2lkL6ABnA9XFi8ui9MvB3SAhvcTeBdJGl
         HzQAs5VjJuGYZrTL7+sNLQC1oM9F7iE4nBcZm4IVNFx2eH/4D1a7BW6LoQtuuOViOJ5G
         yIpA==
X-Gm-Message-State: AOAM530I/cSxy5IdU2mO21tJaTQ3d4I4MZycKHCjyhu6NLdHSwyG00Kc
        VtluE8s06gh1i6GXybpt4g==
X-Google-Smtp-Source: ABdhPJwr4EgItXiSwO0bYJJciunVaXIhobyIaWPupUJn9fbWFlzykLQChGDz7koabuVeLkEloglNhg==
X-Received: by 2002:a05:6a00:1245:b029:30f:2098:fcf4 with SMTP id u5-20020a056a001245b029030f2098fcf4mr197390pfi.66.1628707182000;
        Wed, 11 Aug 2021 11:39:42 -0700 (PDT)
Received: from robh.at.kernel.org ([208.184.162.215])
        by smtp.gmail.com with ESMTPSA id v10sm7530697pjd.29.2021.08.11.11.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 11:39:41 -0700 (PDT)
Received: (nullmailer pid 65519 invoked by uid 1000);
        Wed, 11 Aug 2021 18:39:37 -0000
Date:   Wed, 11 Aug 2021 12:39:37 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [RFC PATCH 1/4] dt-bindings: interrupt-controller: Add Renesas
 RZ/G2L Interrupt Controller
Message-ID: <YRQZaTg2j4VSfQsF@robh.at.kernel.org>
References: <20210803175109.1729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210803175109.1729-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803175109.1729-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 03, 2021 at 06:51:06PM +0100, Lad Prabhakar wrote:
> Add DT bindings for the Renesas RZ/G2L Interrupt Controller.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
>  .../renesas,rzg2l-irqc.yaml                   | 129 ++++++++++++++++++
>  1 file changed, 129 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
> new file mode 100644
> index 000000000000..66d6a0ebe128
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
> @@ -0,0 +1,129 @@
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

missing 'with below pins:"?

> +    - IRQ sense select for 8 external interrupts, mapped to 8 GIC SPI interrupts,
> +    - GPIO pins used as external interrupt input pins, mapped to 32 GIC SPI interrupts,
> +    - NMI edge select.
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
> +  interrupts:
> +    description: Specifies the GIC interrupts.
> +    maxItems: 41
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
> +  - interrupts
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
> +            interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 445 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 446 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 447 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 448 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 452 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 453 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 454 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 459 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 460 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 463 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 474 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 475 IRQ_TYPE_LEVEL_HIGH>;
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
