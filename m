Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB1E73AA0EC
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Jun 2021 18:09:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234624AbhFPQLq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Jun 2021 12:11:46 -0400
Received: from mail-io1-f49.google.com ([209.85.166.49]:46078 "EHLO
        mail-io1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229503AbhFPQLp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Jun 2021 12:11:45 -0400
Received: by mail-io1-f49.google.com with SMTP id k5so3566553iow.12;
        Wed, 16 Jun 2021 09:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=q+56tVICKSu3/WUc3w3PdrmWTWQjS52Q8ri2IrqkoZM=;
        b=YT+lcabTHk+DuGC1rgvxDOWxYLls6AFG8g/hY9/4v72YCdw30d4VHDxGkI/TcpDwen
         AGvuqcPTPZvEG1RzwYZUdrN2xIjlgrIex7LzFGjRMzw81d7sro8KZ3uVsb/JSZkq6ayk
         MTXe+AnwjytPsM+beow3eYLISXom9en2sJbB8SpyS+reTXQJjVkOVAZQyGe3CWe+t5vh
         2XwWZ75i6En0BMdn57wMno/T9+LdvtNdrjd4v14iw5I+Nfw46Nln38UhQnR9hUfwsmsu
         mPNgIk0r23fYztyCep5+Wffc/ygXWbNzW4CfNYDux7VpAmYB02o0wwXjf2Xet1EmcWb9
         I8yg==
X-Gm-Message-State: AOAM531wWGeDgWqDCBn4m5VrkxDR6Dzohst5T18/8q4YugMWzSGKwft+
        GZGFZhDt3VEq53fAueJJT1JE173FsA==
X-Google-Smtp-Source: ABdhPJzqiNu8Z30iASLehTSs3tCs9HDsnzIfNY6i5/c43SMGHmLhomJd713auE9kf3sCB8K3ipcs9A==
X-Received: by 2002:a05:6638:1202:: with SMTP id n2mr155587jas.57.1623859779020;
        Wed, 16 Jun 2021 09:09:39 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id c19sm1383584ili.62.2021.06.16.09.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 09:09:38 -0700 (PDT)
Received: (nullmailer pid 3479329 invoked by uid 1000);
        Wed, 16 Jun 2021 16:09:36 -0000
Date:   Wed, 16 Jun 2021 10:09:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Add DT
 bindings for RZ/G2L pinctrl
Message-ID: <20210616160936.GA3475696@robh.at.kernel.org>
References: <20210616132641.29087-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20210616132641.29087-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210616132641.29087-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jun 16, 2021 at 02:26:39PM +0100, Lad Prabhakar wrote:
> Add device tree binding documentation and header file for Renesas
> RZ/G2L pinctrl.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  .../pinctrl/renesas,rzg2l-pinctrl.yaml        | 121 ++++++++++++++++++
>  include/dt-bindings/pinctrl/pinctrl-rzg2l.h   |  16 +++
>  2 files changed, 137 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/pinctrl-rzg2l.h
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
> new file mode 100644
> index 000000000000..e8ab5a0a46b3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzg2l-pinctrl.yaml
> @@ -0,0 +1,121 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/renesas,rzg2l-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/G2L combined Pin and GPIO controller
> +
> +maintainers:
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +
> +description:
> +  The Renesas SoCs of the RZ/G2L series feature a combined Pin and GPIO
> +  controller.
> +  Pin multiplexing and GPIO configuration is performed on a per-pin basis.
> +  Each port features up to 8 pins, each of them configurable for GPIO function
> +  (port mode) or in alternate function mode.
> +  Up to 8 different alternate function modes exist for each single pin.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,r9a07g044-pinctrl # RZ/G2{L,LC}
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +    description:
> +      The first cell contains the global GPIO port index, constructed using the
> +      RZG2L_GPIO() helper macro in <dt-bindings/pinctrl/pinctrl-rzg2l.h> and the
> +      second cell represents consumer flag as mentioned in ../gpio/gpio.txt
> +      E.g. "RZG2L_GPIO(39, 1)" for P39_1.
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +additionalProperties:
> +  anyOf:
> +    - type: object

Define a node name pattern for child nodes to match on rather than using 
'additionalProperties'. '-pins$' for example.


> +      allOf:
> +        - $ref: pincfg-node.yaml#
> +        - $ref: pinmux-node.yaml#
> +
> +      description:
> +        Pin controller client devices use pin configuration subnodes (children
> +        and grandchildren) for desired pin configuration.
> +        Client device subnodes use below standard properties.
> +
> +      properties:
> +        phandle: true
> +        function: true
> +        groups: true
> +        pins: true
> +        bias-disable: true
> +        bias-pull-down: true
> +        bias-pull-up: true
> +        drive-strength:
> +          enum: [ 2, 4, 8, 12 ]
> +        power-source:
> +          enum: [ 1800, 2500, 3300 ]
> +        slew-rate: true
> +        gpio-hog: true
> +        gpios: true
> +        input-enable: true
> +        output-high: true
> +        output-low: true
> +        line-name: true
> +
> +      additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - gpio-ranges
> +  - clocks
> +  - power-domains
> +  - resets
> +
> +examples:
> +  - |
> +    #include <dt-bindings/pinctrl/pinctrl-rzg2l.h>
> +    #include <dt-bindings/clock/r9a07g044-cpg.h>
> +
> +    pinctrl: pinctrl@11030000 {
> +            compatible = "renesas,r9a07g044l-pinctrl";
> +            reg = <0x11030000 0x10000>;
> +
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            gpio-ranges = <&pinctrl 0 0 392>;
> +            clocks = <&cpg CPG_MOD R9A07G044_CLK_GPIO>;
> +            resets = <&cpg R9A07G044_CLK_GPIO>;
> +            power-domains = <&cpg>;
> +
> +            scif0_pins: scif0 {
> +                    groups = "scif0_data";
> +                    function = "scif0";
> +            };
> +
> +            sd1-pwr-en-hog {
> +                    gpio-hog;
> +                    gpios = <RZG2L_GPIO(39, 2) 0>;
> +                    output-high;
> +                    line-name = "sd1_pwr_en";
> +            };
> +    };
> diff --git a/include/dt-bindings/pinctrl/pinctrl-rzg2l.h b/include/dt-bindings/pinctrl/pinctrl-rzg2l.h
> new file mode 100644
> index 000000000000..d285d9e8c60a
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/pinctrl-rzg2l.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * This header provides constants for Renesas RZ/G2{L,LC} pinctrl bindings.
> + *
> + * Copyright (C) 2021 Renesas Electronics Corp.
> + *
> + */
> +
> +#ifndef __DT_BINDINGS_PINCTRL_RZG2L_H
> +#define __DT_BINDINGS_PINCTRL_RZG2L_H
> +
> +#define RZG2L_PINS_PER_PORT	8
> +
> +#define RZG2L_GPIO(port, pos)	((port) * RZG2L_PINS_PER_PORT + (pos))
> +
> +#endif /* __DT_BINDINGS_PINCTRL_RZG2L_H */
> -- 
> 2.17.1
