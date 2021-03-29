Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 077CB34D1FD
	for <lists+linux-gpio@lfdr.de>; Mon, 29 Mar 2021 15:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbhC2N6x (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 29 Mar 2021 09:58:53 -0400
Received: from mail-oi1-f175.google.com ([209.85.167.175]:46796 "EHLO
        mail-oi1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbhC2N6n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 29 Mar 2021 09:58:43 -0400
Received: by mail-oi1-f175.google.com with SMTP id m13so13114419oiw.13;
        Mon, 29 Mar 2021 06:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9rC/X74azzjRs0pes0OL8Iit7ird9BMRnDmRA641q6s=;
        b=Jzv4+yEw/AHjEnvl8gLAoA45yepfglIZp75DjBnFGt3WBGrJwtR2bb/HMzksHVaWlA
         X1ZLPgQwEHxMru8kcsIGUJRFsIaJWci3h8+8nsc1xNh9sYPrX0tHTGPwe06Tb4j5cA48
         5qc54itWZ2bkqvGAuLvh/ZpTJTQfp9R3LG0IOY4B6kbqsXDJHEFRxRlDSjvLIHSN3/4w
         Gq01Y/opLHniDtJ1n7K3iprt/Dokp4d5HU7pQ0FIadewN6/jQz0TBhaL/BErZ/jNBSQH
         mHYwv3hA9nmUHTJ1g6Zc1tDiERm/jhHxu3LzM3Q/ykkq3F2ilVGbMJFbiILnVXyqfILo
         s+jQ==
X-Gm-Message-State: AOAM531AaYn4FB+T6sXS3tq+gFQhiGlKyZkwzCqz236pZRdE2euy6J7O
        Cx5sOSI4GZmDT6O3mtTwIw==
X-Google-Smtp-Source: ABdhPJxVlDLal90W5oTPDVrZQ7LEnLJ7XkMlsj/bLxyytDHqlctz2hufGT6GQfZKiOBW7lPE6EfWQQ==
X-Received: by 2002:aca:4d8f:: with SMTP id a137mr18442952oib.132.1617026322769;
        Mon, 29 Mar 2021 06:58:42 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v30sm4430627otb.23.2021.03.29.06.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Mar 2021 06:58:40 -0700 (PDT)
Received: (nullmailer pid 2477089 invoked by uid 1000);
        Mon, 29 Mar 2021 13:58:38 -0000
Date:   Mon, 29 Mar 2021 08:58:38 -0500
From:   Rob Herring <robh@kernel.org>
To:     Zhiyong Tao <zhiyong.tao@mediatek.com>
Cc:     linus.walleij@linaro.org, mark.rutland@arm.com,
        matthias.bgg@gmail.com, sean.wang@kernel.org,
        srv_heupstream@mediatek.com, hui.liu@mediatek.com,
        eddie.huang@mediatek.com, jg_poxu@mediatek.com,
        biao.huang@mediatek.com, hongzhou.yang@mediatek.com,
        erin.lo@mediatek.com, sean.wang@mediatek.com,
        seiya.wang@mediatek.com, sj.huang@mediatek.com,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/6] dt-bindings: pinctrl: mt8195: add binding document
Message-ID: <20210329135838.GA2473026@robh.at.kernel.org>
References: <20210329065047.8388-1-zhiyong.tao@mediatek.com>
 <20210329065047.8388-3-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210329065047.8388-3-zhiyong.tao@mediatek.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 29, 2021 at 02:50:43PM +0800, Zhiyong Tao wrote:
> The commit adds mt8195 compatible node in binding document.
> 
> Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8195.yaml      | 152 ++++++++++++++++++
>  1 file changed, 152 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> new file mode 100644
> index 000000000000..7915b9568c29
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8195.yaml
> @@ -0,0 +1,152 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/pinctrl-mt8195.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT8195 Pin Controller
> +
> +maintainers:
> +  - Sean Wang <sean.wang@mediatek.com>
> +
> +description: |
> +  The Mediatek's Pin controller is used to control SoC pins.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8195-pinctrl
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    description: |
> +      Number of cells in GPIO specifier. Since the generic GPIO binding is used,
> +      the amount of cells must be specified as 2. See the below
> +      mentioned gpio binding representation for description of particular cells.
> +    const: 2
> +
> +  gpio-ranges:
> +    description: gpio valid number range.
> +    maxItems: 1
> +
> +  reg:
> +    description: |
> +      Physical address base for gpio base registers. There are 8 GPIO
> +      physical address base in mt8195.
> +    maxItems: 8
> +
> +  reg-names:
> +    description: |
> +      Gpio base register names.
> +    maxItems: 8
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  interrupts:
> +    description: The interrupt outputs to sysirq.
> +    maxItems: 1
> +
> +#PIN CONFIGURATION NODES
> +patternProperties:
> +  '^pins':

Normally we're doing '-pins$'.

> +    type: object
> +    description: |
> +      A pinctrl node should contain at least one subnodes representing the
> +      pinctrl groups available on the machine. Each subnode will list the
> +      pins it needs, and how they should be configured, with regard to muxer
> +      configuration, pullups, drive strength, input enable/disable and
> +      input schmitt.
> +      An example of using macro:
> +      pincontroller {
> +        /* GPIO0 set as multifunction GPIO0 */
> +        state_0_node_a {

Use the node name pattern defined.

> +          pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
> +        };
> +        /* GPIO1 set as multifunction CLKM1 */
> +        state_0_node_b {
> +          pinmux = <PINMUX_GPIO1__FUNC_CLKM1>;
> +        };
> +      };
> +    $ref: "pinmux-node.yaml"
> +
> +    properties:
> +      pinmux:
> +        description: |
> +          Integer array, represents gpio pin number and mux setting.
> +          Supported pin number and mux varies for different SoCs, and are defined
> +          as macros in dt-bindings/pinctrl/<soc>-pinfunc.h directly.
> +
> +      drive-strength:
> +        description: |
> +          It can support some arguments, such as MTK_DRIVE_4mA, MTK_DRIVE_6mA, etc. See
> +          dt-bindings/pinctrl/mt65xx.h. It can only support 2/4/6/8/10/12/14/16mA in mt8195.
> +        enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +
> +      bias-pull-down: true
> +
> +      bias-pull-up: true
> +
> +      bias-disable: true
> +
> +      output-high: true
> +
> +      output-low: true
> +
> +      input-enable: true
> +
> +      input-disable: true
> +
> +      input-schmitt-enable: true
> +
> +      input-schmitt-disable: true
> +
> +    required:
> +      - pinmux
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - gpio-ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +            #include <dt-bindings/pinctrl/mt8195-pinfunc.h>
> +            #include <dt-bindings/interrupt-controller/arm-gic.h>
> +            pio: pinctrl@10005000 {
> +                    compatible = "mediatek,mt8195-pinctrl";
> +                    reg = <0x10005000 0x1000>,
> +                          <0x11d10000 0x1000>,
> +                          <0x11d30000 0x1000>,
> +                          <0x11d40000 0x1000>,
> +                          <0x11e20000 0x1000>,
> +                          <0x11e20000 0x1000>,
> +                          <0x11eb0000 0x1000>,
> +                          <0x11f40000 0x1000>,
> +                          <0x1000b000 0x1000>;
> +                    reg-names = "iocfg0", "iocfg_bm", "iocfg_bl",
> +                          "iocfg_br", "iocfg_lm", "iocfg_rb",
> +                          "iocfg_tl", "eint";
> +                    gpio-controller;
> +                    #gpio-cells = <2>;
> +                    gpio-ranges = <&pio 0 0 144>;
> +                    interrupt-controller;
> +                    interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH 0>;
> +                    #interrupt-cells = <2>;
> +
> +                    pins {
> +                      pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
> +                      output-low;
> +                    };
> +            };
> -- 
> 2.18.0
> 
