Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE14458570F
	for <lists+linux-gpio@lfdr.de>; Sat, 30 Jul 2022 01:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239374AbiG2XEt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 29 Jul 2022 19:04:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232195AbiG2XEs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Jul 2022 19:04:48 -0400
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6E328721E;
        Fri, 29 Jul 2022 16:04:44 -0700 (PDT)
Received: by mail-io1-f41.google.com with SMTP id e69so4667737iof.5;
        Fri, 29 Jul 2022 16:04:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=4SbguU+pHo8xLt0eY5U/MF90XPc3gpnjrM8dbCBb+Po=;
        b=ppPKZt3TkShmEqxtejuZN44e2T5GFLXEwrZf3RplTF9N8H1Lx/gdRMTVDNUTkhWJN3
         ZPbAw95z4342LKVGMw4axpV+ONrf9g6LJGf8/RQyMeqTvFFmihKjiaVVmh/1xrOb9fZ/
         GZF4RKLCON+nvOsTr3E+CykSOeXYKfooDy2Y/4RICj6ed0xF9urD02ZAlvjrR1n8TtVr
         KKVO3pa6rJFoBCI8vP0h3joM1Z5Q7Ei2rzqXj2WhBzw1gKk7TCddfHS/reyAgZz8uqJX
         2r6lm0sOoMJdc6iEthnpjKk1OEzJ856L5Ddid8oCQ7n7eqAF8zXRCFFlr0Q8UFw+/rDZ
         Qkzg==
X-Gm-Message-State: AJIora+c68EeOBvUiR5OJMWI60+kW72bbQbcXQRpcdgaxp/6p2PTOvxx
        GNgGhKxrf5Zss2Xb2Lto8w==
X-Google-Smtp-Source: AGRyM1s3hKuGwf09a5YAVx3E6WDsoP7Nz3v/d3a8CfyblS1jffVzocbUkujCn5RwL5wszZMqnc+eOQ==
X-Received: by 2002:a05:6638:16d0:b0:341:3f31:901c with SMTP id g16-20020a05663816d000b003413f31901cmr2254260jat.94.1659135883278;
        Fri, 29 Jul 2022 16:04:43 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id p14-20020a0566022b0e00b0067bef5b497asm2179886iov.33.2022.07.29.16.04.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 16:04:42 -0700 (PDT)
Received: (nullmailer pid 103775 invoked by uid 1000);
        Fri, 29 Jul 2022 23:04:39 -0000
Date:   Fri, 29 Jul 2022 17:04:39 -0600
From:   Rob Herring <robh@kernel.org>
To:     Hui Liu <hui.liu@mediatek.com>
Cc:     linus.walleij@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        matthias.bgg@gmail.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        jianguo.zhang@mediatek.com, zhiyong.tao@mediatek.com,
        sean.wang@mediatek.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: pinctrl: mediatek: add support for
 mt8188
Message-ID: <20220729230439.GA99380-robh@kernel.org>
References: <20220729102452.9478-1-hui.liu@mediatek.com>
 <20220729102452.9478-2-hui.liu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220729102452.9478-2-hui.liu@mediatek.com>
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS,UPPERCASE_50_75 autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 29, 2022 at 06:24:51PM +0800, Hui Liu wrote:
> From: "Hui.Liu" <hui.liu@mediatek.com>
> 
> Add the pinctrl header file on MediaTek mt8188.
> Add the new binding document for pinctrl on MediaTek mt8188.
> 
> Signed-off-by: Hui.Liu <hui.liu@mediatek.com>
> ---
>  .../pinctrl/mediatek,mt8188-pinctrl.yaml      |  226 +++
>  .../pinctrl/mediatek,mt8188-pinfunc.h         | 1280 +++++++++++++++++
>  2 files changed, 1506 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml
> new file mode 100644
> index 000000000000..f840e9fa7164
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8188-pinctrl.yaml
> @@ -0,0 +1,226 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/mediatek,mt8188-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8188 Pin Controller
> +
> +maintainers:
> +  - Hui Liu <hui.liu@mediatek.com>
> +
> +description: |
> +  The MediaTek's MT8188 Pin controller is used to control SoC pins.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8188-pinctrl
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    description: |
> +      Number of cells in GPIO specifier, should be two. The first cell
> +      is the pin number, the second cell is used to specify optional
> +      parameters which are defined in <dt-bindings/gpio/gpio.h>.
> +    const: 2
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  gpio-line-names: true
> +
> +  reg:
> +    items:
> +      - description: gpio registers base address
> +      - description: rm group io configuration registers base address
> +      - description: lt group io configuration registers base address
> +      - description: lm group io configuration registers base address
> +      - description: rt group io configuration registers base address
> +      - description: eint registers base address
> +
> +  reg-names:
> +    items:
> +      - const: iocfg0
> +      - const: iocfg_rm
> +      - const: iocfg_lt
> +      - const: iocfg_lm
> +      - const: iocfg_rt
> +      - const: eint
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
> +  mediatek,rsel-resistance-in-si-unit:
> +    type: boolean
> +    description: |
> +      We provide two methods to select the resistance for I2C when pull up or pull down.
> +      The first is by RSEL definition value, another one is by resistance value(ohm).
> +      This flag is used to identify if the method is resistance(si unit) value.
> +
> +# PIN CONFIGURATION NODES
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    $ref: "/schemas/pinctrl/pincfg-node.yaml"

Doesn't this belong in the child '^pins' node? There's no properties in 
this node, right?

> +    additionalProperties: false
> +
> +    patternProperties:
> +      '^pins':
> +        type: object
> +        additionalProperties: false
> +        description: |
> +          A pinctrl node should contain at least one subnode representing the
> +          pinctrl groups available on the machine. Each subnode will list the
> +          pins it needs, and how they should be configured, with regard to muxer
> +          configuration, pullups, drive strength, input enable/disable and
> +          input schmitt.
> +
> +        properties:
> +          pinmux:
> +            description: |
> +              Integer array, represents gpio pin number and mux setting.
> +              Supported pin number and mux varies for different SoCs, and are
> +              defined as macros in dt-bindings/pinctrl/mediatek,<soc>-pinfunc.h
> +              directly.
> +
> +          drive-strength:
> +            enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +
> +          drive-strength-microamp:
> +            enum: [125, 250, 500, 1000]
> +
> +          bias-pull-down:
> +            oneOf:
> +              - type: boolean
> +              - enum: [100, 101, 102, 103]
> +                description: mt8188 pull down PUPD/R0/R1 type define value.
> +              - enum: [200, 201, 202, 203, 204, 205, 206, 207]
> +                description: mt8188 pull down RSEL type define value.
> +              - enum: [75000, 5000]
> +                description: mt8188 pull down RSEL type si unit value(ohm).
> +            description: |
> +              For pull down type is normal, it doesn't need add RSEL & R1R0 define
> +              and resistance value.
> +              For pull down type is PUPD/R0/R1 type, it can add R1R0 define to
> +              set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
> +              "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" & "MTK_PUPD_SET_R1R0_11"
> +              define in mt8188.
> +              For pull down type is RSEL, it can add RSEL define & resistance value(ohm)
> +              to set different resistance by identifying property "mediatek,rsel-resistance-in-si-unit".
> +              It can support "MTK_PULL_SET_RSEL_000" & "MTK_PULL_SET_RSEL_001"
> +              & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" & "MTK_PULL_SET_RSEL_100"
> +              & "MTK_PULL_SET_RSEL_101" & "MTK_PULL_SET_RSEL_110" & "MTK_PULL_SET_RSEL_111"
> +              define in mt8188. It can also support resistance value(ohm) "75000" & "5000" in mt8188.
> +
> +          bias-pull-up:
> +            oneOf:
> +              - type: boolean
> +              - enum: [100, 101, 102, 103]
> +                description: mt8188 pull up PUPD/R0/R1 type define value.
> +              - enum: [200, 201, 202, 203, 204, 205, 206, 207]
> +                description: mt8188 pull up RSEL type define value.
> +              - enum: [1000, 1500, 2000, 3000, 4000, 5000, 10000, 75000]
> +                description: mt8188 pull up RSEL type si unit value(ohm).
> +            description: |
> +              For pull up type is normal, it don't need add RSEL & R1R0 define
> +              and resistance value.
> +              For pull up type is PUPD/R0/R1 type, it can add R1R0 define to
> +              set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
> +              "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" & "MTK_PUPD_SET_R1R0_11"
> +              define in mt8188.
> +              For pull up type is RSEL, it can add RSEL define & resistance value(ohm)
> +              to set different resistance by identifying property "mediatek,rsel-resistance-in-si-unit".
> +              It can support "MTK_PULL_SET_RSEL_000" & "MTK_PULL_SET_RSEL_001"
> +              & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" & "MTK_PULL_SET_RSEL_100"
> +              & "MTK_PULL_SET_RSEL_101" & "MTK_PULL_SET_RSEL_110" & "MTK_PULL_SET_RSEL_111"
> +              define in mt8188. It can also support resistance value(ohm)
> +              "1000" & "1500" & "2000" & "3000" & "4000" & "5000" & "10000" & "75000" in mt8188.
> +
> +          bias-disable: true
> +
> +          output-high: true
> +
> +          output-low: true
> +
> +          input-enable: true
> +
> +          input-disable: true
> +
> +          input-schmitt-enable: true
> +
> +          input-schmitt-disable: true
> +
> +        required:
> +          - pinmux
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
> +    #include <dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    pio: pinctrl@10005000 {
> +        compatible = "mediatek,mt8188-pinctrl";
> +        reg = <0x10005000 0x1000>,
> +              <0x11c00000 0x1000>,
> +              <0x11e10000 0x1000>,
> +              <0x11e20000 0x1000>,
> +              <0x11ea0000 0x1000>,
> +              <0x1000b000 0x1000>;
> +        reg-names = "iocfg0", "iocfg_rm",
> +                    "iocfg_lt", "iocfg_lm", "iocfg_rt",
> +                    "eint";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&pio 0 0 176>;
> +        interrupt-controller;
> +        interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH 0>;
> +        #interrupt-cells = <2>;
> +
> +        pio-pins {
> +            pins {
> +                pinmux = <PINMUX_GPIO0__FUNC_B_GPIO0>;
> +                output-low;
> +            };
> +        };
> +
> +        spi0-pins {
> +            pins-spi {
> +                pinmux = <PINMUX_GPIO75__FUNC_O_SPIM1_CSB>,
> +                         <PINMUX_GPIO76__FUNC_O_SPIM1_CLK>,
> +                         <PINMUX_GPIO77__FUNC_B0_SPIM1_MOSI>;
> +                drive-strength = <6>;
> +            };
> +            pins-spi-mi {
> +                pinmux = <PINMUX_GPIO78__FUNC_B0_SPIM1_MISO>;
> +                bias-pull-down = <MTK_PUPD_SET_R1R0_10>;
> +            };
> +        };
> +
> +        i2c0-pins {
> +            pins {
> +                pinmux = <PINMUX_GPIO55__FUNC_B1_SCL0>,
> +                         <PINMUX_GPIO56__FUNC_B1_SDA0>;
> +                bias-disable;
> +                drive-strength-microamp = <1000>;
> +            };
> +        };
> +    };
> diff --git a/include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h b/include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h
> new file mode 100644
> index 000000000000..2688da2f621f
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h
> @@ -0,0 +1,1280 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (C) 2022 MediaTek Inc.
> + * Author: Hui Liu <hui.liu@mediatek.com>
> + */
> +
> +#ifndef __MEDIATEK_MT8188_PINFUNC_H
> +#define __MEDIATEK_MT8188_PINFUNC_H
> +
> +#include "mt65xx.h"
> +
> +#define PINMUX_GPIO0__FUNC_B_GPIO0 (MTK_PIN_NO(0) | 0)
> +#define PINMUX_GPIO0__FUNC_B0_TP_GPIO0_AO (MTK_PIN_NO(0) | 1)
> +#define PINMUX_GPIO0__FUNC_O_SPIM5_CSB (MTK_PIN_NO(0) | 2)
> +#define PINMUX_GPIO0__FUNC_O_UTXD1 (MTK_PIN_NO(0) | 3)
> +#define PINMUX_GPIO0__FUNC_O_DMIC3_CLK (MTK_PIN_NO(0) | 4)
> +#define PINMUX_GPIO0__FUNC_B0_I2SIN_MCK (MTK_PIN_NO(0) | 5)
> +#define PINMUX_GPIO0__FUNC_O_I2SO2_MCK (MTK_PIN_NO(0) | 6)
> +#define PINMUX_GPIO0__FUNC_B0_DBG_MON_A0 (MTK_PIN_NO(0) | 7)
> +
> +#define PINMUX_GPIO1__FUNC_B_GPIO1 (MTK_PIN_NO(1) | 0)
> +#define PINMUX_GPIO1__FUNC_B0_TP_GPIO1_AO (MTK_PIN_NO(1) | 1)
> +#define PINMUX_GPIO1__FUNC_O_SPIM5_CLK (MTK_PIN_NO(1) | 2)
> +#define PINMUX_GPIO1__FUNC_I1_URXD1 (MTK_PIN_NO(1) | 3)
> +#define PINMUX_GPIO1__FUNC_I0_DMIC3_DAT (MTK_PIN_NO(1) | 4)
> +#define PINMUX_GPIO1__FUNC_B0_I2SIN_BCK (MTK_PIN_NO(1) | 5)
> +#define PINMUX_GPIO1__FUNC_B0_I2SO2_BCK (MTK_PIN_NO(1) | 6)
> +#define PINMUX_GPIO1__FUNC_B0_DBG_MON_A1 (MTK_PIN_NO(1) | 7)
> +
> +#define PINMUX_GPIO2__FUNC_B_GPIO2 (MTK_PIN_NO(2) | 0)
> +#define PINMUX_GPIO2__FUNC_B0_TP_GPIO2_AO (MTK_PIN_NO(2) | 1)
> +#define PINMUX_GPIO2__FUNC_B0_SPIM5_MOSI (MTK_PIN_NO(2) | 2)
> +#define PINMUX_GPIO2__FUNC_O_URTS1 (MTK_PIN_NO(2) | 3)
> +#define PINMUX_GPIO2__FUNC_I0_DMIC3_DAT_R (MTK_PIN_NO(2) | 4)
> +#define PINMUX_GPIO2__FUNC_B0_I2SIN_WS (MTK_PIN_NO(2) | 5)
> +#define PINMUX_GPIO2__FUNC_B0_I2SO2_WS (MTK_PIN_NO(2) | 6)
> +#define PINMUX_GPIO2__FUNC_B0_DBG_MON_A2 (MTK_PIN_NO(2) | 7)
> +
> +#define PINMUX_GPIO3__FUNC_B_GPIO3 (MTK_PIN_NO(3) | 0)
> +#define PINMUX_GPIO3__FUNC_B0_TP_GPIO3_AO (MTK_PIN_NO(3) | 1)
> +#define PINMUX_GPIO3__FUNC_B0_SPIM5_MISO (MTK_PIN_NO(3) | 2)
> +#define PINMUX_GPIO3__FUNC_I1_UCTS1 (MTK_PIN_NO(3) | 3)
> +#define PINMUX_GPIO3__FUNC_O_DMIC4_CLK (MTK_PIN_NO(3) | 4)
> +#define PINMUX_GPIO3__FUNC_I0_I2SIN_D0 (MTK_PIN_NO(3) | 5)
> +#define PINMUX_GPIO3__FUNC_O_I2SO2_D0 (MTK_PIN_NO(3) | 6)
> +#define PINMUX_GPIO3__FUNC_B0_DBG_MON_A3 (MTK_PIN_NO(3) | 7)
> +
> +#define PINMUX_GPIO4__FUNC_B_GPIO4 (MTK_PIN_NO(4) | 0)
> +#define PINMUX_GPIO4__FUNC_B0_TP_GPIO4_AO (MTK_PIN_NO(4) | 1)
> +#define PINMUX_GPIO4__FUNC_I0_SPDIF_IN2 (MTK_PIN_NO(4) | 2)
> +#define PINMUX_GPIO4__FUNC_O_I2SO1_MCK (MTK_PIN_NO(4) | 3)
> +#define PINMUX_GPIO4__FUNC_I0_DMIC4_DAT (MTK_PIN_NO(4) | 4)
> +#define PINMUX_GPIO4__FUNC_I0_I2SIN_D1 (MTK_PIN_NO(4) | 5)
> +#define PINMUX_GPIO4__FUNC_O_I2SO2_D1 (MTK_PIN_NO(4) | 6)
> +#define PINMUX_GPIO4__FUNC_B0_DBG_MON_A4 (MTK_PIN_NO(4) | 7)
> +
> +#define PINMUX_GPIO5__FUNC_B_GPIO5 (MTK_PIN_NO(5) | 0)
> +#define PINMUX_GPIO5__FUNC_B0_TP_GPIO5_AO (MTK_PIN_NO(5) | 1)
> +#define PINMUX_GPIO5__FUNC_I0_SPDIF_IN1 (MTK_PIN_NO(5) | 2)
> +#define PINMUX_GPIO5__FUNC_O_I2SO1_BCK (MTK_PIN_NO(5) | 3)
> +#define PINMUX_GPIO5__FUNC_I0_DMIC4_DAT_R (MTK_PIN_NO(5) | 4)
> +#define PINMUX_GPIO5__FUNC_I0_I2SIN_D2 (MTK_PIN_NO(5) | 5)
> +#define PINMUX_GPIO5__FUNC_O_I2SO2_D2 (MTK_PIN_NO(5) | 6)
> +#define PINMUX_GPIO5__FUNC_B0_DBG_MON_A5 (MTK_PIN_NO(5) | 7)
> +
> +#define PINMUX_GPIO6__FUNC_B_GPIO6 (MTK_PIN_NO(6) | 0)
> +#define PINMUX_GPIO6__FUNC_B0_TP_GPIO6_AO (MTK_PIN_NO(6) | 1)
> +#define PINMUX_GPIO6__FUNC_I0_SPDIF_IN0 (MTK_PIN_NO(6) | 2)
> +#define PINMUX_GPIO6__FUNC_O_I2SO1_WS (MTK_PIN_NO(6) | 3)
> +#define PINMUX_GPIO6__FUNC_O_DMIC1_CLK (MTK_PIN_NO(6) | 4)
> +#define PINMUX_GPIO6__FUNC_I0_I2SIN_D3 (MTK_PIN_NO(6) | 5)
> +#define PINMUX_GPIO6__FUNC_O_I2SO2_D3 (MTK_PIN_NO(6) | 6)
> +#define PINMUX_GPIO6__FUNC_B0_MD32_0_GPIO0 (MTK_PIN_NO(6) | 7)
> +
> +#define PINMUX_GPIO7__FUNC_B_GPIO7 (MTK_PIN_NO(7) | 0)
> +#define PINMUX_GPIO7__FUNC_B0_TP_GPIO7_AO (MTK_PIN_NO(7) | 1)
> +#define PINMUX_GPIO7__FUNC_O_SPIM3_CSB (MTK_PIN_NO(7) | 2)
> +#define PINMUX_GPIO7__FUNC_B0_TDMIN_MCK (MTK_PIN_NO(7) | 3)
> +#define PINMUX_GPIO7__FUNC_I0_DMIC1_DAT (MTK_PIN_NO(7) | 4)
> +#define PINMUX_GPIO7__FUNC_O_CMVREF0 (MTK_PIN_NO(7) | 5)
> +#define PINMUX_GPIO7__FUNC_O_CLKM0 (MTK_PIN_NO(7) | 6)
> +#define PINMUX_GPIO7__FUNC_B0_DBG_MON_A6 (MTK_PIN_NO(7) | 7)
> +
> +#define PINMUX_GPIO8__FUNC_B_GPIO8 (MTK_PIN_NO(8) | 0)
> +#define PINMUX_GPIO8__FUNC_B0_TP_GPIO0_AO (MTK_PIN_NO(8) | 1)
> +#define PINMUX_GPIO8__FUNC_O_SPIM3_CLK (MTK_PIN_NO(8) | 2)
> +#define PINMUX_GPIO8__FUNC_B0_TDMIN_BCK (MTK_PIN_NO(8) | 3)
> +#define PINMUX_GPIO8__FUNC_I0_DMIC1_DAT_R (MTK_PIN_NO(8) | 4)
> +#define PINMUX_GPIO8__FUNC_O_CMVREF1 (MTK_PIN_NO(8) | 5)
> +#define PINMUX_GPIO8__FUNC_O_CLKM1 (MTK_PIN_NO(8) | 6)
> +#define PINMUX_GPIO8__FUNC_B0_DBG_MON_A7 (MTK_PIN_NO(8) | 7)
> +
> +#define PINMUX_GPIO9__FUNC_B_GPIO9 (MTK_PIN_NO(9) | 0)
> +#define PINMUX_GPIO9__FUNC_B0_TP_GPIO1_AO (MTK_PIN_NO(9) | 1)
> +#define PINMUX_GPIO9__FUNC_B0_SPIM3_MOSI (MTK_PIN_NO(9) | 2)
> +#define PINMUX_GPIO9__FUNC_B0_TDMIN_LRCK (MTK_PIN_NO(9) | 3)
> +#define PINMUX_GPIO9__FUNC_O_DMIC2_CLK (MTK_PIN_NO(9) | 4)
> +#define PINMUX_GPIO9__FUNC_O_CMFLASH0 (MTK_PIN_NO(9) | 5)
> +#define PINMUX_GPIO9__FUNC_O_PWM_0 (MTK_PIN_NO(9) | 6)
> +#define PINMUX_GPIO9__FUNC_B0_DBG_MON_A8 (MTK_PIN_NO(9) | 7)
> +
> +#define PINMUX_GPIO10__FUNC_B_GPIO10 (MTK_PIN_NO(10) | 0)
> +#define PINMUX_GPIO10__FUNC_B0_TP_GPIO2_AO (MTK_PIN_NO(10) | 1)
> +#define PINMUX_GPIO10__FUNC_B0_SPIM3_MISO (MTK_PIN_NO(10) | 2)
> +#define PINMUX_GPIO10__FUNC_I0_TDMIN_DI (MTK_PIN_NO(10) | 3)
> +#define PINMUX_GPIO10__FUNC_I0_DMIC2_DAT (MTK_PIN_NO(10) | 4)
> +#define PINMUX_GPIO10__FUNC_O_CMFLASH1 (MTK_PIN_NO(10) | 5)
> +#define PINMUX_GPIO10__FUNC_O_PWM_1 (MTK_PIN_NO(10) | 6)
> +#define PINMUX_GPIO10__FUNC_B0_DBG_MON_A9 (MTK_PIN_NO(10) | 7)
> +
> +#define PINMUX_GPIO11__FUNC_B_GPIO11 (MTK_PIN_NO(11) | 0)
> +#define PINMUX_GPIO11__FUNC_B0_TP_GPIO3_AO (MTK_PIN_NO(11) | 1)
> +#define PINMUX_GPIO11__FUNC_O_SPDIF_OUT (MTK_PIN_NO(11) | 2)
> +#define PINMUX_GPIO11__FUNC_O_I2SO1_D0 (MTK_PIN_NO(11) | 3)
> +#define PINMUX_GPIO11__FUNC_I0_DMIC2_DAT_R (MTK_PIN_NO(11) | 4)
> +#define PINMUX_GPIO11__FUNC_I0_DVFSRC_EXT_REQ (MTK_PIN_NO(11) | 5)
> +#define PINMUX_GPIO11__FUNC_O_CMVREF6 (MTK_PIN_NO(11) | 6)
> +#define PINMUX_GPIO11__FUNC_B0_DBG_MON_A10 (MTK_PIN_NO(11) | 7)
> +
> +#define PINMUX_GPIO12__FUNC_B_GPIO12 (MTK_PIN_NO(12) | 0)
> +#define PINMUX_GPIO12__FUNC_B0_TP_GPIO4_AO (MTK_PIN_NO(12) | 1)
> +#define PINMUX_GPIO12__FUNC_O_SPIM4_CSB (MTK_PIN_NO(12) | 2)
> +#define PINMUX_GPIO12__FUNC_B1_JTMS_SEL3 (MTK_PIN_NO(12) | 3)
> +#define PINMUX_GPIO12__FUNC_B1_APU_JTAG_TMS (MTK_PIN_NO(12) | 4)
> +#define PINMUX_GPIO12__FUNC_I0_VPU_UDI_TMS (MTK_PIN_NO(12) | 5)
> +#define PINMUX_GPIO12__FUNC_I0_IPU_JTAG_TMS (MTK_PIN_NO(12) | 6)
> +#define PINMUX_GPIO12__FUNC_I0_HDMITX20_HTPLG (MTK_PIN_NO(12) | 7)
> +
> +#define PINMUX_GPIO13__FUNC_B_GPIO13 (MTK_PIN_NO(13) | 0)
> +#define PINMUX_GPIO13__FUNC_B0_TP_GPIO5_AO (MTK_PIN_NO(13) | 1)
> +#define PINMUX_GPIO13__FUNC_O_SPIM4_CLK (MTK_PIN_NO(13) | 2)
> +#define PINMUX_GPIO13__FUNC_I0_JTCK_SEL3 (MTK_PIN_NO(13) | 3)
> +#define PINMUX_GPIO13__FUNC_I0_APU_JTAG_TCK (MTK_PIN_NO(13) | 4)
> +#define PINMUX_GPIO13__FUNC_I0_VPU_UDI_TCK (MTK_PIN_NO(13) | 5)
> +#define PINMUX_GPIO13__FUNC_I0_IPU_JTAG_TCK (MTK_PIN_NO(13) | 6)
> +#define PINMUX_GPIO13__FUNC_B1_HDMITX20_CEC (MTK_PIN_NO(13) | 7)
> +
> +#define PINMUX_GPIO14__FUNC_B_GPIO14 (MTK_PIN_NO(14) | 0)
> +#define PINMUX_GPIO14__FUNC_B0_TP_GPIO6_AO (MTK_PIN_NO(14) | 1)
> +#define PINMUX_GPIO14__FUNC_B0_SPIM4_MOSI (MTK_PIN_NO(14) | 2)
> +#define PINMUX_GPIO14__FUNC_I1_JTDI_SEL3 (MTK_PIN_NO(14) | 3)
> +#define PINMUX_GPIO14__FUNC_I1_APU_JTAG_TDI (MTK_PIN_NO(14) | 4)
> +#define PINMUX_GPIO14__FUNC_I0_VPU_UDI_TDI (MTK_PIN_NO(14) | 5)
> +#define PINMUX_GPIO14__FUNC_I0_IPU_JTAG_TDI (MTK_PIN_NO(14) | 6)
> +#define PINMUX_GPIO14__FUNC_B1_HDMITX20_SCL (MTK_PIN_NO(14) | 7)
> +
> +#define PINMUX_GPIO15__FUNC_B_GPIO15 (MTK_PIN_NO(15) | 0)
> +#define PINMUX_GPIO15__FUNC_B0_TP_GPIO7_AO (MTK_PIN_NO(15) | 1)
> +#define PINMUX_GPIO15__FUNC_B0_SPIM4_MISO (MTK_PIN_NO(15) | 2)
> +#define PINMUX_GPIO15__FUNC_O_JTDO_SEL3 (MTK_PIN_NO(15) | 3)
> +#define PINMUX_GPIO15__FUNC_O_APU_JTAG_TDO (MTK_PIN_NO(15) | 4)
> +#define PINMUX_GPIO15__FUNC_O_VPU_UDI_TDO (MTK_PIN_NO(15) | 5)
> +#define PINMUX_GPIO15__FUNC_O_IPU_JTAG_TDO (MTK_PIN_NO(15) | 6)
> +#define PINMUX_GPIO15__FUNC_B1_HDMITX20_SDA (MTK_PIN_NO(15) | 7)
> +
> +#define PINMUX_GPIO16__FUNC_B_GPIO16 (MTK_PIN_NO(16) | 0)
> +#define PINMUX_GPIO16__FUNC_B0_TP_GPIO0_AO (MTK_PIN_NO(16) | 1)
> +#define PINMUX_GPIO16__FUNC_O_UTXD3 (MTK_PIN_NO(16) | 2)
> +#define PINMUX_GPIO16__FUNC_I1_JTRSTn_SEL3 (MTK_PIN_NO(16) | 3)
> +#define PINMUX_GPIO16__FUNC_I0_APU_JTAG_TRST (MTK_PIN_NO(16) | 4)
> +#define PINMUX_GPIO16__FUNC_I0_VPU_UDI_NTRST (MTK_PIN_NO(16) | 5)
> +#define PINMUX_GPIO16__FUNC_I0_IPU_JTAG_TRST (MTK_PIN_NO(16) | 6)
> +#define PINMUX_GPIO16__FUNC_O_HDMITX20_PWR5V (MTK_PIN_NO(16) | 7)
> +
> +#define PINMUX_GPIO17__FUNC_B_GPIO17 (MTK_PIN_NO(17) | 0)
> +#define PINMUX_GPIO17__FUNC_B0_TP_GPIO1_AO (MTK_PIN_NO(17) | 1)
> +#define PINMUX_GPIO17__FUNC_I1_URXD3 (MTK_PIN_NO(17) | 2)
> +#define PINMUX_GPIO17__FUNC_O_CMFLASH2 (MTK_PIN_NO(17) | 3)
> +#define PINMUX_GPIO17__FUNC_I0_EDP_TX_HPD (MTK_PIN_NO(17) | 4)
> +#define PINMUX_GPIO17__FUNC_I0_DVFSRC_EXT_REQ (MTK_PIN_NO(17) | 5)
> +#define PINMUX_GPIO17__FUNC_O_CMVREF7 (MTK_PIN_NO(17) | 6)
> +#define PINMUX_GPIO17__FUNC_B0_MD32_0_GPIO1 (MTK_PIN_NO(17) | 7)
> +
> +#define PINMUX_GPIO18__FUNC_B_GPIO18 (MTK_PIN_NO(18) | 0)
> +#define PINMUX_GPIO18__FUNC_B0_TP_GPIO2_AO (MTK_PIN_NO(18) | 1)
> +#define PINMUX_GPIO18__FUNC_O_CMFLASH0 (MTK_PIN_NO(18) | 2)
> +#define PINMUX_GPIO18__FUNC_O_CMVREF4 (MTK_PIN_NO(18) | 3)
> +#define PINMUX_GPIO18__FUNC_B0_TDMIN_MCK (MTK_PIN_NO(18) | 4)
> +#define PINMUX_GPIO18__FUNC_O_UTXD1 (MTK_PIN_NO(18) | 5)
> +#define PINMUX_GPIO18__FUNC_O_TP_UTXD1_AO (MTK_PIN_NO(18) | 6)
> +#define PINMUX_GPIO18__FUNC_B0_DBG_MON_A11 (MTK_PIN_NO(18) | 7)
> +
> +#define PINMUX_GPIO19__FUNC_B_GPIO19 (MTK_PIN_NO(19) | 0)
> +#define PINMUX_GPIO19__FUNC_B0_TP_GPIO3_AO (MTK_PIN_NO(19) | 1)
> +#define PINMUX_GPIO19__FUNC_O_CMFLASH1 (MTK_PIN_NO(19) | 2)
> +#define PINMUX_GPIO19__FUNC_O_CMVREF5 (MTK_PIN_NO(19) | 3)
> +#define PINMUX_GPIO19__FUNC_B0_TDMIN_BCK (MTK_PIN_NO(19) | 4)
> +#define PINMUX_GPIO19__FUNC_I1_URXD1 (MTK_PIN_NO(19) | 5)
> +#define PINMUX_GPIO19__FUNC_I1_TP_URXD1_AO (MTK_PIN_NO(19) | 6)
> +#define PINMUX_GPIO19__FUNC_B0_DBG_MON_A12 (MTK_PIN_NO(19) | 7)
> +
> +#define PINMUX_GPIO20__FUNC_B_GPIO20 (MTK_PIN_NO(20) | 0)
> +#define PINMUX_GPIO20__FUNC_B0_TP_GPIO4_AO (MTK_PIN_NO(20) | 1)
> +#define PINMUX_GPIO20__FUNC_O_CMFLASH2 (MTK_PIN_NO(20) | 2)
> +#define PINMUX_GPIO20__FUNC_O_CLKM2 (MTK_PIN_NO(20) | 3)
> +#define PINMUX_GPIO20__FUNC_B0_TDMIN_LRCK (MTK_PIN_NO(20) | 4)
> +#define PINMUX_GPIO20__FUNC_O_URTS1 (MTK_PIN_NO(20) | 5)
> +#define PINMUX_GPIO20__FUNC_O_TP_URTS1_AO (MTK_PIN_NO(20) | 6)
> +#define PINMUX_GPIO20__FUNC_B0_DBG_MON_A13 (MTK_PIN_NO(20) | 7)
> +
> +#define PINMUX_GPIO21__FUNC_B_GPIO21 (MTK_PIN_NO(21) | 0)
> +#define PINMUX_GPIO21__FUNC_B0_TP_GPIO5_AO (MTK_PIN_NO(21) | 1)
> +#define PINMUX_GPIO21__FUNC_O_CMFLASH3 (MTK_PIN_NO(21) | 2)
> +#define PINMUX_GPIO21__FUNC_O_CLKM3 (MTK_PIN_NO(21) | 3)
> +#define PINMUX_GPIO21__FUNC_I0_TDMIN_DI (MTK_PIN_NO(21) | 4)
> +#define PINMUX_GPIO21__FUNC_I1_UCTS1 (MTK_PIN_NO(21) | 5)
> +#define PINMUX_GPIO21__FUNC_I1_TP_UCTS1_AO (MTK_PIN_NO(21) | 6)
> +#define PINMUX_GPIO21__FUNC_B0_DBG_MON_A14 (MTK_PIN_NO(21) | 7)
> +
> +#define PINMUX_GPIO22__FUNC_B_GPIO22 (MTK_PIN_NO(22) | 0)
> +#define PINMUX_GPIO22__FUNC_O_CMMCLK0 (MTK_PIN_NO(22) | 1)
> +#define PINMUX_GPIO22__FUNC_B0_TP_GPIO6_AO (MTK_PIN_NO(22) | 5)
> +#define PINMUX_GPIO22__FUNC_B0_DBG_MON_A15 (MTK_PIN_NO(22) | 7)
> +
> +#define PINMUX_GPIO23__FUNC_B_GPIO23 (MTK_PIN_NO(23) | 0)
> +#define PINMUX_GPIO23__FUNC_O_CMMCLK1 (MTK_PIN_NO(23) | 1)
> +#define PINMUX_GPIO23__FUNC_O_PWM_2 (MTK_PIN_NO(23) | 3)
> +#define PINMUX_GPIO23__FUNC_B1_PCIE_PHY_I2C_SCL (MTK_PIN_NO(23) | 4)
> +#define PINMUX_GPIO23__FUNC_B0_TP_GPIO7_AO (MTK_PIN_NO(23) | 5)
> +#define PINMUX_GPIO23__FUNC_I0_DP_TX_HPD (MTK_PIN_NO(23) | 6)
> +#define PINMUX_GPIO23__FUNC_B0_DBG_MON_A16 (MTK_PIN_NO(23) | 7)
> +
> +#define PINMUX_GPIO24__FUNC_B_GPIO24 (MTK_PIN_NO(24) | 0)
> +#define PINMUX_GPIO24__FUNC_O_CMMCLK2 (MTK_PIN_NO(24) | 1)
> +#define PINMUX_GPIO24__FUNC_O_PWM_3 (MTK_PIN_NO(24) | 3)
> +#define PINMUX_GPIO24__FUNC_B1_PCIE_PHY_I2C_SDA (MTK_PIN_NO(24) | 4)
> +#define PINMUX_GPIO24__FUNC_I0_DVFSRC_EXT_REQ (MTK_PIN_NO(24) | 5)
> +#define PINMUX_GPIO24__FUNC_I0_EDP_TX_HPD (MTK_PIN_NO(24) | 6)
> +#define PINMUX_GPIO24__FUNC_B0_MD32_0_GPIO2 (MTK_PIN_NO(24) | 7)
> +
> +#define PINMUX_GPIO25__FUNC_B_GPIO25 (MTK_PIN_NO(25) | 0)
> +#define PINMUX_GPIO25__FUNC_O_LCM_RST (MTK_PIN_NO(25) | 1)
> +#define PINMUX_GPIO25__FUNC_O_LCM1_RST (MTK_PIN_NO(25) | 2)
> +#define PINMUX_GPIO25__FUNC_I0_DP_TX_HPD (MTK_PIN_NO(25) | 3)
> +
> +#define PINMUX_GPIO26__FUNC_B_GPIO26 (MTK_PIN_NO(26) | 0)
> +#define PINMUX_GPIO26__FUNC_I0_DSI_TE (MTK_PIN_NO(26) | 1)
> +#define PINMUX_GPIO26__FUNC_I0_DSI1_TE (MTK_PIN_NO(26) | 2)
> +#define PINMUX_GPIO26__FUNC_I0_EDP_TX_HPD (MTK_PIN_NO(26) | 3)
> +
> +#define PINMUX_GPIO27__FUNC_B_GPIO27 (MTK_PIN_NO(27) | 0)
> +#define PINMUX_GPIO27__FUNC_O_LCM1_RST (MTK_PIN_NO(27) | 1)
> +#define PINMUX_GPIO27__FUNC_O_LCM_RST (MTK_PIN_NO(27) | 2)
> +#define PINMUX_GPIO27__FUNC_I0_DP_TX_HPD (MTK_PIN_NO(27) | 3)
> +#define PINMUX_GPIO27__FUNC_O_CMVREF2 (MTK_PIN_NO(27) | 4)
> +#define PINMUX_GPIO27__FUNC_O_mbistwriteen_trigger (MTK_PIN_NO(27) | 5)
> +#define PINMUX_GPIO27__FUNC_O_PWM_2 (MTK_PIN_NO(27) | 6)
> +#define PINMUX_GPIO27__FUNC_B0_DBG_MON_A17 (MTK_PIN_NO(27) | 7)
> +
> +#define PINMUX_GPIO28__FUNC_B_GPIO28 (MTK_PIN_NO(28) | 0)
> +#define PINMUX_GPIO28__FUNC_I0_DSI1_TE (MTK_PIN_NO(28) | 1)
> +#define PINMUX_GPIO28__FUNC_I0_DSI_TE (MTK_PIN_NO(28) | 2)
> +#define PINMUX_GPIO28__FUNC_I0_EDP_TX_HPD (MTK_PIN_NO(28) | 3)
> +#define PINMUX_GPIO28__FUNC_O_CMVREF3 (MTK_PIN_NO(28) | 4)
> +#define PINMUX_GPIO28__FUNC_O_mbistreaden_trigger (MTK_PIN_NO(28) | 5)
> +#define PINMUX_GPIO28__FUNC_O_PWM_3 (MTK_PIN_NO(28) | 6)
> +#define PINMUX_GPIO28__FUNC_B0_DBG_MON_A18 (MTK_PIN_NO(28) | 7)
> +
> +#define PINMUX_GPIO29__FUNC_B_GPIO29 (MTK_PIN_NO(29) | 0)
> +#define PINMUX_GPIO29__FUNC_O_DISP_PWM0 (MTK_PIN_NO(29) | 1)
> +#define PINMUX_GPIO29__FUNC_O_DISP_PWM1 (MTK_PIN_NO(29) | 2)
> +
> +#define PINMUX_GPIO30__FUNC_B_GPIO30 (MTK_PIN_NO(30) | 0)
> +#define PINMUX_GPIO30__FUNC_O_DISP_PWM1 (MTK_PIN_NO(30) | 1)
> +#define PINMUX_GPIO30__FUNC_O_DISP_PWM0 (MTK_PIN_NO(30) | 2)
> +#define PINMUX_GPIO30__FUNC_O_CMFLASH3 (MTK_PIN_NO(30) | 3)
> +#define PINMUX_GPIO30__FUNC_O_PWM_1 (MTK_PIN_NO(30) | 4)
> +#define PINMUX_GPIO30__FUNC_B0_DBG_MON_A19 (MTK_PIN_NO(30) | 7)
> +
> +#define PINMUX_GPIO31__FUNC_B_GPIO31 (MTK_PIN_NO(31) | 0)
> +#define PINMUX_GPIO31__FUNC_O_UTXD0 (MTK_PIN_NO(31) | 1)
> +#define PINMUX_GPIO31__FUNC_O_TP_UTXD1_AO (MTK_PIN_NO(31) | 2)
> +#define PINMUX_GPIO31__FUNC_O_ADSP_UTXD0 (MTK_PIN_NO(31) | 3)
> +#define PINMUX_GPIO31__FUNC_O_TP_UTXD2_AO (MTK_PIN_NO(31) | 4)
> +#define PINMUX_GPIO31__FUNC_O_MD32_0_TXD (MTK_PIN_NO(31) | 5)
> +#define PINMUX_GPIO31__FUNC_O_MD32_1_TXD (MTK_PIN_NO(31) | 6)
> +#define PINMUX_GPIO31__FUNC_O_SSPM_UTXD_AO (MTK_PIN_NO(31) | 7)
> +
> +#define PINMUX_GPIO32__FUNC_B_GPIO32 (MTK_PIN_NO(32) | 0)
> +#define PINMUX_GPIO32__FUNC_I1_URXD0 (MTK_PIN_NO(32) | 1)
> +#define PINMUX_GPIO32__FUNC_I1_TP_URXD1_AO (MTK_PIN_NO(32) | 2)
> +#define PINMUX_GPIO32__FUNC_I1_ADSP_URXD0 (MTK_PIN_NO(32) | 3)
> +#define PINMUX_GPIO32__FUNC_I1_TP_URXD2_AO (MTK_PIN_NO(32) | 4)
> +#define PINMUX_GPIO32__FUNC_I1_MD32_0_RXD (MTK_PIN_NO(32) | 5)
> +#define PINMUX_GPIO32__FUNC_I1_MD32_1_RXD (MTK_PIN_NO(32) | 6)
> +#define PINMUX_GPIO32__FUNC_I1_SSPM_URXD_AO (MTK_PIN_NO(32) | 7)
> +
> +#define PINMUX_GPIO33__FUNC_B_GPIO33 (MTK_PIN_NO(33) | 0)
> +#define PINMUX_GPIO33__FUNC_O_UTXD1 (MTK_PIN_NO(33) | 1)
> +#define PINMUX_GPIO33__FUNC_O_URTS2 (MTK_PIN_NO(33) | 2)
> +#define PINMUX_GPIO33__FUNC_O_ADSP_UTXD0 (MTK_PIN_NO(33) | 3)
> +#define PINMUX_GPIO33__FUNC_O_TP_UTXD1_AO (MTK_PIN_NO(33) | 4)
> +#define PINMUX_GPIO33__FUNC_O_mbistwriteen_trigger (MTK_PIN_NO(33) | 5)
> +#define PINMUX_GPIO33__FUNC_O_MD32_0_TXD (MTK_PIN_NO(33) | 6)
> +#define PINMUX_GPIO33__FUNC_O_SSPM_UTXD_AO (MTK_PIN_NO(33) | 7)
> +
> +#define PINMUX_GPIO34__FUNC_B_GPIO34 (MTK_PIN_NO(34) | 0)
> +#define PINMUX_GPIO34__FUNC_I1_URXD1 (MTK_PIN_NO(34) | 1)
> +#define PINMUX_GPIO34__FUNC_I1_UCTS2 (MTK_PIN_NO(34) | 2)
> +#define PINMUX_GPIO34__FUNC_I1_ADSP_URXD0 (MTK_PIN_NO(34) | 3)
> +#define PINMUX_GPIO34__FUNC_I1_TP_URXD1_AO (MTK_PIN_NO(34) | 4)
> +#define PINMUX_GPIO34__FUNC_O_mbistreaden_trigger (MTK_PIN_NO(34) | 5)
> +#define PINMUX_GPIO34__FUNC_I1_MD32_0_RXD (MTK_PIN_NO(34) | 6)
> +#define PINMUX_GPIO34__FUNC_I1_SSPM_URXD_AO (MTK_PIN_NO(34) | 7)
> +
> +#define PINMUX_GPIO35__FUNC_B_GPIO35 (MTK_PIN_NO(35) | 0)
> +#define PINMUX_GPIO35__FUNC_O_UTXD2 (MTK_PIN_NO(35) | 1)
> +#define PINMUX_GPIO35__FUNC_O_URTS1 (MTK_PIN_NO(35) | 2)
> +#define PINMUX_GPIO35__FUNC_O_ADSP_UTXD0 (MTK_PIN_NO(35) | 3)
> +#define PINMUX_GPIO35__FUNC_O_TP_URTS1_AO (MTK_PIN_NO(35) | 4)
> +#define PINMUX_GPIO35__FUNC_O_TP_UTXD2_AO (MTK_PIN_NO(35) | 5)
> +#define PINMUX_GPIO35__FUNC_O_MD32_1_TXD (MTK_PIN_NO(35) | 6)
> +#define PINMUX_GPIO35__FUNC_B0_DBG_MON_A20 (MTK_PIN_NO(35) | 7)
> +
> +#define PINMUX_GPIO36__FUNC_B_GPIO36 (MTK_PIN_NO(36) | 0)
> +#define PINMUX_GPIO36__FUNC_I1_URXD2 (MTK_PIN_NO(36) | 1)
> +#define PINMUX_GPIO36__FUNC_I1_UCTS1 (MTK_PIN_NO(36) | 2)
> +#define PINMUX_GPIO36__FUNC_I1_ADSP_URXD0 (MTK_PIN_NO(36) | 3)
> +#define PINMUX_GPIO36__FUNC_I1_TP_UCTS1_AO (MTK_PIN_NO(36) | 4)
> +#define PINMUX_GPIO36__FUNC_I1_TP_URXD2_AO (MTK_PIN_NO(36) | 5)
> +#define PINMUX_GPIO36__FUNC_I1_MD32_1_RXD (MTK_PIN_NO(36) | 6)
> +#define PINMUX_GPIO36__FUNC_B0_DBG_MON_A21 (MTK_PIN_NO(36) | 7)
> +
> +#define PINMUX_GPIO37__FUNC_B_GPIO37 (MTK_PIN_NO(37) | 0)
> +#define PINMUX_GPIO37__FUNC_B1_JTMS_SEL1 (MTK_PIN_NO(37) | 1)
> +#define PINMUX_GPIO37__FUNC_I0_UDI_TMS (MTK_PIN_NO(37) | 2)
> +#define PINMUX_GPIO37__FUNC_I1_SPM_JTAG_TMS (MTK_PIN_NO(37) | 3)
> +#define PINMUX_GPIO37__FUNC_I1_ADSP_JTAG0_TMS (MTK_PIN_NO(37) | 4)
> +#define PINMUX_GPIO37__FUNC_I1_SCP_JTAG0_TMS (MTK_PIN_NO(37) | 5)
> +#define PINMUX_GPIO37__FUNC_I1_CCU0_JTAG_TMS (MTK_PIN_NO(37) | 6)
> +#define PINMUX_GPIO37__FUNC_I1_MCUPM_JTAG_TMS (MTK_PIN_NO(37) | 7)
> +
> +#define PINMUX_GPIO38__FUNC_B_GPIO38 (MTK_PIN_NO(38) | 0)
> +#define PINMUX_GPIO38__FUNC_I0_JTCK_SEL1 (MTK_PIN_NO(38) | 1)
> +#define PINMUX_GPIO38__FUNC_I0_UDI_TCK (MTK_PIN_NO(38) | 2)
> +#define PINMUX_GPIO38__FUNC_I1_SPM_JTAG_TCK (MTK_PIN_NO(38) | 3)
> +#define PINMUX_GPIO38__FUNC_I0_ADSP_JTAG0_TCK (MTK_PIN_NO(38) | 4)
> +#define PINMUX_GPIO38__FUNC_I1_SCP_JTAG0_TCK (MTK_PIN_NO(38) | 5)
> +#define PINMUX_GPIO38__FUNC_I1_CCU0_JTAG_TCK (MTK_PIN_NO(38) | 6)
> +#define PINMUX_GPIO38__FUNC_I1_MCUPM_JTAG_TCK (MTK_PIN_NO(38) | 7)
> +
> +#define PINMUX_GPIO39__FUNC_B_GPIO39 (MTK_PIN_NO(39) | 0)
> +#define PINMUX_GPIO39__FUNC_I1_JTDI_SEL1 (MTK_PIN_NO(39) | 1)
> +#define PINMUX_GPIO39__FUNC_I0_UDI_TDI (MTK_PIN_NO(39) | 2)
> +#define PINMUX_GPIO39__FUNC_I1_SPM_JTAG_TDI (MTK_PIN_NO(39) | 3)
> +#define PINMUX_GPIO39__FUNC_I1_ADSP_JTAG0_TDI (MTK_PIN_NO(39) | 4)
> +#define PINMUX_GPIO39__FUNC_I1_SCP_JTAG0_TDI (MTK_PIN_NO(39) | 5)
> +#define PINMUX_GPIO39__FUNC_I1_CCU0_JTAG_TDI (MTK_PIN_NO(39) | 6)
> +#define PINMUX_GPIO39__FUNC_I1_MCUPM_JTAG_TDI (MTK_PIN_NO(39) | 7)
> +
> +#define PINMUX_GPIO40__FUNC_B_GPIO40 (MTK_PIN_NO(40) | 0)
> +#define PINMUX_GPIO40__FUNC_O_JTDO_SEL1 (MTK_PIN_NO(40) | 1)
> +#define PINMUX_GPIO40__FUNC_O_UDI_TDO (MTK_PIN_NO(40) | 2)
> +#define PINMUX_GPIO40__FUNC_O_SPM_JTAG_TDO (MTK_PIN_NO(40) | 3)
> +#define PINMUX_GPIO40__FUNC_O_ADSP_JTAG0_TDO (MTK_PIN_NO(40) | 4)
> +#define PINMUX_GPIO40__FUNC_O_SCP_JTAG0_TDO (MTK_PIN_NO(40) | 5)
> +#define PINMUX_GPIO40__FUNC_O_CCU0_JTAG_TDO (MTK_PIN_NO(40) | 6)
> +#define PINMUX_GPIO40__FUNC_O_MCUPM_JTAG_TDO (MTK_PIN_NO(40) | 7)
> +
> +#define PINMUX_GPIO41__FUNC_B_GPIO41 (MTK_PIN_NO(41) | 0)
> +#define PINMUX_GPIO41__FUNC_I1_JTRSTn_SEL1 (MTK_PIN_NO(41) | 1)
> +#define PINMUX_GPIO41__FUNC_I0_UDI_NTRST (MTK_PIN_NO(41) | 2)
> +#define PINMUX_GPIO41__FUNC_I0_SPM_JTAG_TRSTN (MTK_PIN_NO(41) | 3)
> +#define PINMUX_GPIO41__FUNC_I1_ADSP_JTAG0_TRSTN (MTK_PIN_NO(41) | 4)
> +#define PINMUX_GPIO41__FUNC_I0_SCP_JTAG0_TRSTN (MTK_PIN_NO(41) | 5)
> +#define PINMUX_GPIO41__FUNC_I1_CCU0_JTAG_TRST (MTK_PIN_NO(41) | 6)
> +#define PINMUX_GPIO41__FUNC_I0_MCUPM_JTAG_TRSTN (MTK_PIN_NO(41) | 7)
> +
> +#define PINMUX_GPIO42__FUNC_B_GPIO42 (MTK_PIN_NO(42) | 0)
> +#define PINMUX_GPIO42__FUNC_B1_KPCOL0 (MTK_PIN_NO(42) | 1)
> +
> +#define PINMUX_GPIO43__FUNC_B_GPIO43 (MTK_PIN_NO(43) | 0)
> +#define PINMUX_GPIO43__FUNC_B1_KPCOL1 (MTK_PIN_NO(43) | 1)
> +#define PINMUX_GPIO43__FUNC_I0_DP_TX_HPD (MTK_PIN_NO(43) | 2)
> +#define PINMUX_GPIO43__FUNC_O_CMFLASH2 (MTK_PIN_NO(43) | 3)
> +#define PINMUX_GPIO43__FUNC_I0_DVFSRC_EXT_REQ (MTK_PIN_NO(43) | 4)
> +#define PINMUX_GPIO43__FUNC_O_mbistwriteen_trigger (MTK_PIN_NO(43) | 7)
> +
> +#define PINMUX_GPIO44__FUNC_B_GPIO44 (MTK_PIN_NO(44) | 0)
> +#define PINMUX_GPIO44__FUNC_B1_KPROW0 (MTK_PIN_NO(44) | 1)
> +
> +#define PINMUX_GPIO45__FUNC_B_GPIO45 (MTK_PIN_NO(45) | 0)
> +#define PINMUX_GPIO45__FUNC_B1_KPROW1 (MTK_PIN_NO(45) | 1)
> +#define PINMUX_GPIO45__FUNC_I0_EDP_TX_HPD (MTK_PIN_NO(45) | 2)
> +#define PINMUX_GPIO45__FUNC_O_CMFLASH3 (MTK_PIN_NO(45) | 3)
> +#define PINMUX_GPIO45__FUNC_B0_I2SIN_MCK (MTK_PIN_NO(45) | 4)
> +#define PINMUX_GPIO45__FUNC_O_mbistreaden_trigger (MTK_PIN_NO(45) | 7)
> +
> +#define PINMUX_GPIO46__FUNC_B_GPIO46 (MTK_PIN_NO(46) | 0)
> +#define PINMUX_GPIO46__FUNC_I0_DP_TX_HPD (MTK_PIN_NO(46) | 1)
> +#define PINMUX_GPIO46__FUNC_O_PWM_0 (MTK_PIN_NO(46) | 2)
> +#define PINMUX_GPIO46__FUNC_I0_VBUSVALID_2P (MTK_PIN_NO(46) | 3)
> +#define PINMUX_GPIO46__FUNC_B0_DBG_MON_A22 (MTK_PIN_NO(46) | 7)
> +
> +#define PINMUX_GPIO47__FUNC_B_GPIO47 (MTK_PIN_NO(47) | 0)
> +#define PINMUX_GPIO47__FUNC_I1_WAKEN (MTK_PIN_NO(47) | 1)
> +#define PINMUX_GPIO47__FUNC_O_GDU_TROOPS_DET0 (MTK_PIN_NO(47) | 6)
> +
> +#define PINMUX_GPIO48__FUNC_B_GPIO48 (MTK_PIN_NO(48) | 0)
> +#define PINMUX_GPIO48__FUNC_O_PERSTN (MTK_PIN_NO(48) | 1)
> +#define PINMUX_GPIO48__FUNC_O_GDU_TROOPS_DET1 (MTK_PIN_NO(48) | 6)
> +
> +#define PINMUX_GPIO49__FUNC_B_GPIO49 (MTK_PIN_NO(49) | 0)
> +#define PINMUX_GPIO49__FUNC_B1_CLKREQN (MTK_PIN_NO(49) | 1)
> +#define PINMUX_GPIO49__FUNC_O_GDU_TROOPS_DET2 (MTK_PIN_NO(49) | 6)
> +
> +#define PINMUX_GPIO50__FUNC_B_GPIO50 (MTK_PIN_NO(50) | 0)
> +#define PINMUX_GPIO50__FUNC_O_HDMITX20_PWR5V (MTK_PIN_NO(50) | 1)
> +#define PINMUX_GPIO50__FUNC_I1_IDDIG_1P (MTK_PIN_NO(50) | 3)
> +#define PINMUX_GPIO50__FUNC_I1_SCP_JTAG1_TMS (MTK_PIN_NO(50) | 4)
> +#define PINMUX_GPIO50__FUNC_I1_SSPM_JTAG_TMS (MTK_PIN_NO(50) | 5)
> +#define PINMUX_GPIO50__FUNC_I1_MD32_0_JTAG_TMS (MTK_PIN_NO(50) | 6)
> +#define PINMUX_GPIO50__FUNC_I1_MD32_1_JTAG_TMS (MTK_PIN_NO(50) | 7)
> +
> +#define PINMUX_GPIO51__FUNC_B_GPIO51 (MTK_PIN_NO(51) | 0)
> +#define PINMUX_GPIO51__FUNC_I0_HDMITX20_HTPLG (MTK_PIN_NO(51) | 1)
> +#define PINMUX_GPIO51__FUNC_I0_EDP_TX_HPD (MTK_PIN_NO(51) | 2)
> +#define PINMUX_GPIO51__FUNC_O_USB_DRVVBUS_1P (MTK_PIN_NO(51) | 3)
> +#define PINMUX_GPIO51__FUNC_I1_SCP_JTAG1_TCK (MTK_PIN_NO(51) | 4)
> +#define PINMUX_GPIO51__FUNC_I1_SSPM_JTAG_TCK (MTK_PIN_NO(51) | 5)
> +#define PINMUX_GPIO51__FUNC_I1_MD32_0_JTAG_TCK (MTK_PIN_NO(51) | 6)
> +#define PINMUX_GPIO51__FUNC_I1_MD32_1_JTAG_TCK (MTK_PIN_NO(51) | 7)
> +
> +#define PINMUX_GPIO52__FUNC_B_GPIO52 (MTK_PIN_NO(52) | 0)
> +#define PINMUX_GPIO52__FUNC_B1_HDMITX20_CEC (MTK_PIN_NO(52) | 1)
> +#define PINMUX_GPIO52__FUNC_I0_VBUSVALID_1P (MTK_PIN_NO(52) | 3)
> +#define PINMUX_GPIO52__FUNC_I1_SCP_JTAG1_TDI (MTK_PIN_NO(52) | 4)
> +#define PINMUX_GPIO52__FUNC_I1_SSPM_JTAG_TDI (MTK_PIN_NO(52) | 5)
> +#define PINMUX_GPIO52__FUNC_I1_MD32_0_JTAG_TDI (MTK_PIN_NO(52) | 6)
> +#define PINMUX_GPIO52__FUNC_I1_MD32_1_JTAG_TDI (MTK_PIN_NO(52) | 7)
> +
> +#define PINMUX_GPIO53__FUNC_B_GPIO53 (MTK_PIN_NO(53) | 0)
> +#define PINMUX_GPIO53__FUNC_B1_HDMITX20_SCL (MTK_PIN_NO(53) | 1)
> +#define PINMUX_GPIO53__FUNC_I1_IDDIG_2P (MTK_PIN_NO(53) | 3)
> +#define PINMUX_GPIO53__FUNC_O_SCP_JTAG1_TDO (MTK_PIN_NO(53) | 4)
> +#define PINMUX_GPIO53__FUNC_O_SSPM_JTAG_TDO (MTK_PIN_NO(53) | 5)
> +#define PINMUX_GPIO53__FUNC_O_MD32_0_JTAG_TDO (MTK_PIN_NO(53) | 6)
> +#define PINMUX_GPIO53__FUNC_O_MD32_1_JTAG_TDO (MTK_PIN_NO(53) | 7)
> +
> +#define PINMUX_GPIO54__FUNC_B_GPIO54 (MTK_PIN_NO(54) | 0)
> +#define PINMUX_GPIO54__FUNC_B1_HDMITX20_SDA (MTK_PIN_NO(54) | 1)
> +#define PINMUX_GPIO54__FUNC_O_USB_DRVVBUS_2P (MTK_PIN_NO(54) | 3)
> +#define PINMUX_GPIO54__FUNC_I0_SCP_JTAG1_TRSTN (MTK_PIN_NO(54) | 4)
> +#define PINMUX_GPIO54__FUNC_I0_SSPM_JTAG_TRSTN (MTK_PIN_NO(54) | 5)
> +#define PINMUX_GPIO54__FUNC_I1_MD32_0_JTAG_TRST (MTK_PIN_NO(54) | 6)
> +#define PINMUX_GPIO54__FUNC_I1_MD32_1_JTAG_TRST (MTK_PIN_NO(54) | 7)
> +
> +#define PINMUX_GPIO55__FUNC_B_GPIO55 (MTK_PIN_NO(55) | 0)
> +#define PINMUX_GPIO55__FUNC_B1_SCL0 (MTK_PIN_NO(55) | 1)
> +#define PINMUX_GPIO55__FUNC_B1_SCP_SCL0 (MTK_PIN_NO(55) | 2)
> +#define PINMUX_GPIO55__FUNC_B1_SCP_SCL1 (MTK_PIN_NO(55) | 3)
> +#define PINMUX_GPIO55__FUNC_B1_PCIE_PHY_I2C_SCL (MTK_PIN_NO(55) | 4)
> +
> +#define PINMUX_GPIO56__FUNC_B_GPIO56 (MTK_PIN_NO(56) | 0)
> +#define PINMUX_GPIO56__FUNC_B1_SDA0 (MTK_PIN_NO(56) | 1)
> +#define PINMUX_GPIO56__FUNC_B1_SCP_SDA0 (MTK_PIN_NO(56) | 2)
> +#define PINMUX_GPIO56__FUNC_B1_SCP_SDA1 (MTK_PIN_NO(56) | 3)
> +#define PINMUX_GPIO56__FUNC_B1_PCIE_PHY_I2C_SDA (MTK_PIN_NO(56) | 4)
> +
> +#define PINMUX_GPIO57__FUNC_B_GPIO57 (MTK_PIN_NO(57) | 0)
> +#define PINMUX_GPIO57__FUNC_B1_SCL1 (MTK_PIN_NO(57) | 1)
> +
> +#define PINMUX_GPIO58__FUNC_B_GPIO58 (MTK_PIN_NO(58) | 0)
> +#define PINMUX_GPIO58__FUNC_B1_SDA1 (MTK_PIN_NO(58) | 1)
> +
> +#define PINMUX_GPIO59__FUNC_B_GPIO59 (MTK_PIN_NO(59) | 0)
> +#define PINMUX_GPIO59__FUNC_B1_SCL2 (MTK_PIN_NO(59) | 1)
> +#define PINMUX_GPIO59__FUNC_B1_SCP_SCL0 (MTK_PIN_NO(59) | 2)
> +#define PINMUX_GPIO59__FUNC_B1_SCP_SCL1 (MTK_PIN_NO(59) | 3)
> +
> +#define PINMUX_GPIO60__FUNC_B_GPIO60 (MTK_PIN_NO(60) | 0)
> +#define PINMUX_GPIO60__FUNC_B1_SDA2 (MTK_PIN_NO(60) | 1)
> +#define PINMUX_GPIO60__FUNC_B1_SCP_SDA0 (MTK_PIN_NO(60) | 2)
> +#define PINMUX_GPIO60__FUNC_B1_SCP_SDA1 (MTK_PIN_NO(60) | 3)
> +
> +#define PINMUX_GPIO61__FUNC_B_GPIO61 (MTK_PIN_NO(61) | 0)
> +#define PINMUX_GPIO61__FUNC_B1_SCL3 (MTK_PIN_NO(61) | 1)
> +#define PINMUX_GPIO61__FUNC_B1_SCP_SCL0 (MTK_PIN_NO(61) | 2)
> +#define PINMUX_GPIO61__FUNC_B1_SCP_SCL1 (MTK_PIN_NO(61) | 3)
> +#define PINMUX_GPIO61__FUNC_B1_PCIE_PHY_I2C_SCL (MTK_PIN_NO(61) | 4)
> +
> +#define PINMUX_GPIO62__FUNC_B_GPIO62 (MTK_PIN_NO(62) | 0)
> +#define PINMUX_GPIO62__FUNC_B1_SDA3 (MTK_PIN_NO(62) | 1)
> +#define PINMUX_GPIO62__FUNC_B1_SCP_SDA0 (MTK_PIN_NO(62) | 2)
> +#define PINMUX_GPIO62__FUNC_B1_SCP_SDA1 (MTK_PIN_NO(62) | 3)
> +#define PINMUX_GPIO62__FUNC_B1_PCIE_PHY_I2C_SDA (MTK_PIN_NO(62) | 4)
> +
> +#define PINMUX_GPIO63__FUNC_B_GPIO63 (MTK_PIN_NO(63) | 0)
> +#define PINMUX_GPIO63__FUNC_B1_SCL4 (MTK_PIN_NO(63) | 1)
> +
> +#define PINMUX_GPIO64__FUNC_B_GPIO64 (MTK_PIN_NO(64) | 0)
> +#define PINMUX_GPIO64__FUNC_B1_SDA4 (MTK_PIN_NO(64) | 1)
> +
> +#define PINMUX_GPIO65__FUNC_B_GPIO65 (MTK_PIN_NO(65) | 0)
> +#define PINMUX_GPIO65__FUNC_B1_SCL5 (MTK_PIN_NO(65) | 1)
> +#define PINMUX_GPIO65__FUNC_B1_SCP_SCL0 (MTK_PIN_NO(65) | 2)
> +#define PINMUX_GPIO65__FUNC_B1_SCP_SCL1 (MTK_PIN_NO(65) | 3)
> +
> +#define PINMUX_GPIO66__FUNC_B_GPIO66 (MTK_PIN_NO(66) | 0)
> +#define PINMUX_GPIO66__FUNC_B1_SDA5 (MTK_PIN_NO(66) | 1)
> +#define PINMUX_GPIO66__FUNC_B1_SCP_SDA0 (MTK_PIN_NO(66) | 2)
> +#define PINMUX_GPIO66__FUNC_B1_SCP_SDA1 (MTK_PIN_NO(66) | 3)
> +
> +#define PINMUX_GPIO67__FUNC_B_GPIO67 (MTK_PIN_NO(67) | 0)
> +#define PINMUX_GPIO67__FUNC_B1_SCL6 (MTK_PIN_NO(67) | 1)
> +#define PINMUX_GPIO67__FUNC_B1_SCP_SCL0 (MTK_PIN_NO(67) | 2)
> +#define PINMUX_GPIO67__FUNC_B1_SCP_SCL1 (MTK_PIN_NO(67) | 3)
> +#define PINMUX_GPIO67__FUNC_B1_PCIE_PHY_I2C_SCL (MTK_PIN_NO(67) | 4)
> +
> +#define PINMUX_GPIO68__FUNC_B_GPIO68 (MTK_PIN_NO(68) | 0)
> +#define PINMUX_GPIO68__FUNC_B1_SDA6 (MTK_PIN_NO(68) | 1)
> +#define PINMUX_GPIO68__FUNC_B1_SCP_SDA0 (MTK_PIN_NO(68) | 2)
> +#define PINMUX_GPIO68__FUNC_B1_SCP_SDA1 (MTK_PIN_NO(68) | 3)
> +#define PINMUX_GPIO68__FUNC_B1_PCIE_PHY_I2C_SDA (MTK_PIN_NO(68) | 4)
> +
> +#define PINMUX_GPIO69__FUNC_B_GPIO69 (MTK_PIN_NO(69) | 0)
> +#define PINMUX_GPIO69__FUNC_O_SPIM0_CSB (MTK_PIN_NO(69) | 1)
> +#define PINMUX_GPIO69__FUNC_O_SCP_SPI0_CS (MTK_PIN_NO(69) | 2)
> +#define PINMUX_GPIO69__FUNC_O_DMIC3_CLK (MTK_PIN_NO(69) | 3)
> +#define PINMUX_GPIO69__FUNC_B0_MD32_1_GPIO0 (MTK_PIN_NO(69) | 4)
> +#define PINMUX_GPIO69__FUNC_O_CMVREF0 (MTK_PIN_NO(69) | 5)
> +#define PINMUX_GPIO69__FUNC_O_GDU_SUM_TROOP0_0 (MTK_PIN_NO(69) | 6)
> +#define PINMUX_GPIO69__FUNC_B0_DBG_MON_A23 (MTK_PIN_NO(69) | 7)
> +
> +#define PINMUX_GPIO70__FUNC_B_GPIO70 (MTK_PIN_NO(70) | 0)
> +#define PINMUX_GPIO70__FUNC_O_SPIM0_CLK (MTK_PIN_NO(70) | 1)
> +#define PINMUX_GPIO70__FUNC_O_SCP_SPI0_CK (MTK_PIN_NO(70) | 2)
> +#define PINMUX_GPIO70__FUNC_I0_DMIC3_DAT (MTK_PIN_NO(70) | 3)
> +#define PINMUX_GPIO70__FUNC_B0_MD32_1_GPIO1 (MTK_PIN_NO(70) | 4)
> +#define PINMUX_GPIO70__FUNC_O_CMVREF1 (MTK_PIN_NO(70) | 5)
> +#define PINMUX_GPIO70__FUNC_O_GDU_SUM_TROOP0_1 (MTK_PIN_NO(70) | 6)
> +#define PINMUX_GPIO70__FUNC_B0_DBG_MON_A24 (MTK_PIN_NO(70) | 7)
> +
> +#define PINMUX_GPIO71__FUNC_B_GPIO71 (MTK_PIN_NO(71) | 0)
> +#define PINMUX_GPIO71__FUNC_B0_SPIM0_MOSI (MTK_PIN_NO(71) | 1)
> +#define PINMUX_GPIO71__FUNC_O_SCP_SPI0_MO (MTK_PIN_NO(71) | 2)
> +#define PINMUX_GPIO71__FUNC_I0_DMIC3_DAT_R (MTK_PIN_NO(71) | 3)
> +#define PINMUX_GPIO71__FUNC_B0_MD32_1_GPIO2 (MTK_PIN_NO(71) | 4)
> +#define PINMUX_GPIO71__FUNC_O_CMVREF2 (MTK_PIN_NO(71) | 5)
> +#define PINMUX_GPIO71__FUNC_O_GDU_SUM_TROOP0_2 (MTK_PIN_NO(71) | 6)
> +#define PINMUX_GPIO71__FUNC_B0_DBG_MON_A25 (MTK_PIN_NO(71) | 7)
> +
> +#define PINMUX_GPIO72__FUNC_B_GPIO72 (MTK_PIN_NO(72) | 0)
> +#define PINMUX_GPIO72__FUNC_B0_SPIM0_MISO (MTK_PIN_NO(72) | 1)
> +#define PINMUX_GPIO72__FUNC_I0_SCP_SPI0_MI (MTK_PIN_NO(72) | 2)
> +#define PINMUX_GPIO72__FUNC_O_DMIC4_CLK (MTK_PIN_NO(72) | 3)
> +#define PINMUX_GPIO72__FUNC_O_CMVREF3 (MTK_PIN_NO(72) | 5)
> +#define PINMUX_GPIO72__FUNC_O_GDU_SUM_TROOP1_0 (MTK_PIN_NO(72) | 6)
> +#define PINMUX_GPIO72__FUNC_B0_DBG_MON_A26 (MTK_PIN_NO(72) | 7)
> +
> +#define PINMUX_GPIO73__FUNC_B_GPIO73 (MTK_PIN_NO(73) | 0)
> +#define PINMUX_GPIO73__FUNC_B0_SPIM0_MIO2 (MTK_PIN_NO(73) | 1)
> +#define PINMUX_GPIO73__FUNC_O_UTXD3 (MTK_PIN_NO(73) | 2)
> +#define PINMUX_GPIO73__FUNC_I0_DMIC4_DAT (MTK_PIN_NO(73) | 3)
> +#define PINMUX_GPIO73__FUNC_O_CLKM0 (MTK_PIN_NO(73) | 4)
> +#define PINMUX_GPIO73__FUNC_O_CMVREF4 (MTK_PIN_NO(73) | 5)
> +#define PINMUX_GPIO73__FUNC_O_GDU_SUM_TROOP1_1 (MTK_PIN_NO(73) | 6)
> +#define PINMUX_GPIO73__FUNC_B0_DBG_MON_A27 (MTK_PIN_NO(73) | 7)
> +
> +#define PINMUX_GPIO74__FUNC_B_GPIO74 (MTK_PIN_NO(74) | 0)
> +#define PINMUX_GPIO74__FUNC_B0_SPIM0_MIO3 (MTK_PIN_NO(74) | 1)
> +#define PINMUX_GPIO74__FUNC_I1_URXD3 (MTK_PIN_NO(74) | 2)
> +#define PINMUX_GPIO74__FUNC_I0_DMIC4_DAT_R (MTK_PIN_NO(74) | 3)
> +#define PINMUX_GPIO74__FUNC_O_CLKM1 (MTK_PIN_NO(74) | 4)
> +#define PINMUX_GPIO74__FUNC_O_CMVREF5 (MTK_PIN_NO(74) | 5)
> +#define PINMUX_GPIO74__FUNC_O_GDU_SUM_TROOP1_2 (MTK_PIN_NO(74) | 6)
> +#define PINMUX_GPIO74__FUNC_B0_DBG_MON_A28 (MTK_PIN_NO(74) | 7)
> +
> +#define PINMUX_GPIO75__FUNC_B_GPIO75 (MTK_PIN_NO(75) | 0)
> +#define PINMUX_GPIO75__FUNC_O_SPIM1_CSB (MTK_PIN_NO(75) | 1)
> +#define PINMUX_GPIO75__FUNC_O_SCP_SPI1_A_CS (MTK_PIN_NO(75) | 2)
> +#define PINMUX_GPIO75__FUNC_B0_TDMIN_MCK (MTK_PIN_NO(75) | 3)
> +#define PINMUX_GPIO75__FUNC_B1_SCP_SCL0 (MTK_PIN_NO(75) | 4)
> +#define PINMUX_GPIO75__FUNC_O_CMVREF6 (MTK_PIN_NO(75) | 5)
> +#define PINMUX_GPIO75__FUNC_O_GDU_SUM_TROOP2_0 (MTK_PIN_NO(75) | 6)
> +#define PINMUX_GPIO75__FUNC_B0_DBG_MON_A29 (MTK_PIN_NO(75) | 7)
> +
> +#define PINMUX_GPIO76__FUNC_B_GPIO76 (MTK_PIN_NO(76) | 0)
> +#define PINMUX_GPIO76__FUNC_O_SPIM1_CLK (MTK_PIN_NO(76) | 1)
> +#define PINMUX_GPIO76__FUNC_O_SCP_SPI1_A_CK (MTK_PIN_NO(76) | 2)
> +#define PINMUX_GPIO76__FUNC_B0_TDMIN_BCK (MTK_PIN_NO(76) | 3)
> +#define PINMUX_GPIO76__FUNC_B1_SCP_SDA0 (MTK_PIN_NO(76) | 4)
> +#define PINMUX_GPIO76__FUNC_O_CMVREF7 (MTK_PIN_NO(76) | 5)
> +#define PINMUX_GPIO76__FUNC_O_GDU_SUM_TROOP2_1 (MTK_PIN_NO(76) | 6)
> +#define PINMUX_GPIO76__FUNC_B0_DBG_MON_A30 (MTK_PIN_NO(76) | 7)
> +
> +#define PINMUX_GPIO77__FUNC_B_GPIO77 (MTK_PIN_NO(77) | 0)
> +#define PINMUX_GPIO77__FUNC_B0_SPIM1_MOSI (MTK_PIN_NO(77) | 1)
> +#define PINMUX_GPIO77__FUNC_O_SCP_SPI1_A_MO (MTK_PIN_NO(77) | 2)
> +#define PINMUX_GPIO77__FUNC_B0_TDMIN_LRCK (MTK_PIN_NO(77) | 3)
> +#define PINMUX_GPIO77__FUNC_B1_SCP_SCL1 (MTK_PIN_NO(77) | 4)
> +#define PINMUX_GPIO77__FUNC_O_GDU_SUM_TROOP2_2 (MTK_PIN_NO(77) | 6)
> +#define PINMUX_GPIO77__FUNC_B0_DBG_MON_A31 (MTK_PIN_NO(77) | 7)
> +
> +#define PINMUX_GPIO78__FUNC_B_GPIO78 (MTK_PIN_NO(78) | 0)
> +#define PINMUX_GPIO78__FUNC_B0_SPIM1_MISO (MTK_PIN_NO(78) | 1)
> +#define PINMUX_GPIO78__FUNC_I0_SCP_SPI1_A_MI (MTK_PIN_NO(78) | 2)
> +#define PINMUX_GPIO78__FUNC_I0_TDMIN_DI (MTK_PIN_NO(78) | 3)
> +#define PINMUX_GPIO78__FUNC_B1_SCP_SDA1 (MTK_PIN_NO(78) | 4)
> +#define PINMUX_GPIO78__FUNC_B0_DBG_MON_A32 (MTK_PIN_NO(78) | 7)
> +
> +#define PINMUX_GPIO79__FUNC_B_GPIO79 (MTK_PIN_NO(79) | 0)
> +#define PINMUX_GPIO79__FUNC_O_SPIM2_CSB (MTK_PIN_NO(79) | 1)
> +#define PINMUX_GPIO79__FUNC_O_SCP_SPI2_CS (MTK_PIN_NO(79) | 2)
> +#define PINMUX_GPIO79__FUNC_O_I2SO1_MCK (MTK_PIN_NO(79) | 3)
> +#define PINMUX_GPIO79__FUNC_O_UTXD2 (MTK_PIN_NO(79) | 4)
> +#define PINMUX_GPIO79__FUNC_O_TP_UTXD2_AO (MTK_PIN_NO(79) | 5)
> +#define PINMUX_GPIO79__FUNC_B0_PCM_SYNC (MTK_PIN_NO(79) | 6)
> +#define PINMUX_GPIO79__FUNC_B0_DBG_MON_B0 (MTK_PIN_NO(79) | 7)
> +
> +#define PINMUX_GPIO80__FUNC_B_GPIO80 (MTK_PIN_NO(80) | 0)
> +#define PINMUX_GPIO80__FUNC_O_SPIM2_CLK (MTK_PIN_NO(80) | 1)
> +#define PINMUX_GPIO80__FUNC_O_SCP_SPI2_CK (MTK_PIN_NO(80) | 2)
> +#define PINMUX_GPIO80__FUNC_O_I2SO1_BCK (MTK_PIN_NO(80) | 3)
> +#define PINMUX_GPIO80__FUNC_I1_URXD2 (MTK_PIN_NO(80) | 4)
> +#define PINMUX_GPIO80__FUNC_I1_TP_URXD2_AO (MTK_PIN_NO(80) | 5)
> +#define PINMUX_GPIO80__FUNC_B0_PCM_CLK (MTK_PIN_NO(80) | 6)
> +#define PINMUX_GPIO80__FUNC_B0_DBG_MON_B1 (MTK_PIN_NO(80) | 7)
> +
> +#define PINMUX_GPIO81__FUNC_B_GPIO81 (MTK_PIN_NO(81) | 0)
> +#define PINMUX_GPIO81__FUNC_B0_SPIM2_MOSI (MTK_PIN_NO(81) | 1)
> +#define PINMUX_GPIO81__FUNC_O_SCP_SPI2_MO (MTK_PIN_NO(81) | 2)
> +#define PINMUX_GPIO81__FUNC_O_I2SO1_WS (MTK_PIN_NO(81) | 3)
> +#define PINMUX_GPIO81__FUNC_O_URTS2 (MTK_PIN_NO(81) | 4)
> +#define PINMUX_GPIO81__FUNC_O_TP_URTS2_AO (MTK_PIN_NO(81) | 5)
> +#define PINMUX_GPIO81__FUNC_O_PCM_DO (MTK_PIN_NO(81) | 6)
> +#define PINMUX_GPIO81__FUNC_B0_DBG_MON_B2 (MTK_PIN_NO(81) | 7)
> +
> +#define PINMUX_GPIO82__FUNC_B_GPIO82 (MTK_PIN_NO(82) | 0)
> +#define PINMUX_GPIO82__FUNC_B0_SPIM2_MISO (MTK_PIN_NO(82) | 1)
> +#define PINMUX_GPIO82__FUNC_I0_SCP_SPI2_MI (MTK_PIN_NO(82) | 2)
> +#define PINMUX_GPIO82__FUNC_O_I2SO1_D0 (MTK_PIN_NO(82) | 3)
> +#define PINMUX_GPIO82__FUNC_I1_UCTS2 (MTK_PIN_NO(82) | 4)
> +#define PINMUX_GPIO82__FUNC_I1_TP_UCTS2_AO (MTK_PIN_NO(82) | 5)
> +#define PINMUX_GPIO82__FUNC_I0_PCM_DI (MTK_PIN_NO(82) | 6)
> +#define PINMUX_GPIO82__FUNC_B0_DBG_MON_B3 (MTK_PIN_NO(82) | 7)
> +
> +#define PINMUX_GPIO83__FUNC_B_GPIO83 (MTK_PIN_NO(83) | 0)
> +#define PINMUX_GPIO83__FUNC_I1_IDDIG (MTK_PIN_NO(83) | 1)
> +
> +#define PINMUX_GPIO84__FUNC_B_GPIO84 (MTK_PIN_NO(84) | 0)
> +#define PINMUX_GPIO84__FUNC_O_USB_DRVVBUS (MTK_PIN_NO(84) | 1)
> +
> +#define PINMUX_GPIO85__FUNC_B_GPIO85 (MTK_PIN_NO(85) | 0)
> +#define PINMUX_GPIO85__FUNC_I0_VBUSVALID (MTK_PIN_NO(85) | 1)
> +
> +#define PINMUX_GPIO86__FUNC_B_GPIO86 (MTK_PIN_NO(86) | 0)
> +#define PINMUX_GPIO86__FUNC_I1_IDDIG_1P (MTK_PIN_NO(86) | 1)
> +#define PINMUX_GPIO86__FUNC_O_UTXD1 (MTK_PIN_NO(86) | 2)
> +#define PINMUX_GPIO86__FUNC_O_URTS2 (MTK_PIN_NO(86) | 3)
> +#define PINMUX_GPIO86__FUNC_O_PWM_2 (MTK_PIN_NO(86) | 4)
> +#define PINMUX_GPIO86__FUNC_B0_TP_GPIO4_AO (MTK_PIN_NO(86) | 5)
> +#define PINMUX_GPIO86__FUNC_O_AUXIF_ST0 (MTK_PIN_NO(86) | 6)
> +#define PINMUX_GPIO86__FUNC_B0_DBG_MON_B4 (MTK_PIN_NO(86) | 7)
> +
> +#define PINMUX_GPIO87__FUNC_B_GPIO87 (MTK_PIN_NO(87) | 0)
> +#define PINMUX_GPIO87__FUNC_O_USB_DRVVBUS_1P (MTK_PIN_NO(87) | 1)
> +#define PINMUX_GPIO87__FUNC_I1_URXD1 (MTK_PIN_NO(87) | 2)
> +#define PINMUX_GPIO87__FUNC_I1_UCTS2 (MTK_PIN_NO(87) | 3)
> +#define PINMUX_GPIO87__FUNC_O_PWM_3 (MTK_PIN_NO(87) | 4)
> +#define PINMUX_GPIO87__FUNC_B0_TP_GPIO5_AO (MTK_PIN_NO(87) | 5)
> +#define PINMUX_GPIO87__FUNC_O_AUXIF_CLK0 (MTK_PIN_NO(87) | 6)
> +#define PINMUX_GPIO87__FUNC_B0_DBG_MON_B5 (MTK_PIN_NO(87) | 7)
> +
> +#define PINMUX_GPIO88__FUNC_B_GPIO88 (MTK_PIN_NO(88) | 0)
> +#define PINMUX_GPIO88__FUNC_I0_VBUSVALID_1P (MTK_PIN_NO(88) | 1)
> +#define PINMUX_GPIO88__FUNC_O_UTXD2 (MTK_PIN_NO(88) | 2)
> +#define PINMUX_GPIO88__FUNC_O_URTS1 (MTK_PIN_NO(88) | 3)
> +#define PINMUX_GPIO88__FUNC_O_CLKM2 (MTK_PIN_NO(88) | 4)
> +#define PINMUX_GPIO88__FUNC_B0_TP_GPIO6_AO (MTK_PIN_NO(88) | 5)
> +#define PINMUX_GPIO88__FUNC_O_AUXIF_ST1 (MTK_PIN_NO(88) | 6)
> +#define PINMUX_GPIO88__FUNC_B0_DBG_MON_B6 (MTK_PIN_NO(88) | 7)
> +
> +#define PINMUX_GPIO89__FUNC_B_GPIO89 (MTK_PIN_NO(89) | 0)
> +#define PINMUX_GPIO89__FUNC_I1_IDDIG_2P (MTK_PIN_NO(89) | 1)
> +#define PINMUX_GPIO89__FUNC_I1_URXD2 (MTK_PIN_NO(89) | 2)
> +#define PINMUX_GPIO89__FUNC_I1_UCTS1 (MTK_PIN_NO(89) | 3)
> +#define PINMUX_GPIO89__FUNC_O_CLKM3 (MTK_PIN_NO(89) | 4)
> +#define PINMUX_GPIO89__FUNC_B0_TP_GPIO7_AO (MTK_PIN_NO(89) | 5)
> +#define PINMUX_GPIO89__FUNC_O_AUXIF_CLK1 (MTK_PIN_NO(89) | 6)
> +#define PINMUX_GPIO89__FUNC_B0_DBG_MON_B7 (MTK_PIN_NO(89) | 7)
> +
> +#define PINMUX_GPIO90__FUNC_B_GPIO90 (MTK_PIN_NO(90) | 0)
> +#define PINMUX_GPIO90__FUNC_O_USB_DRVVBUS_2P (MTK_PIN_NO(90) | 1)
> +#define PINMUX_GPIO90__FUNC_O_UTXD3 (MTK_PIN_NO(90) | 2)
> +#define PINMUX_GPIO90__FUNC_O_ADSP_UTXD0 (MTK_PIN_NO(90) | 3)
> +#define PINMUX_GPIO90__FUNC_O_SSPM_UTXD_AO (MTK_PIN_NO(90) | 4)
> +#define PINMUX_GPIO90__FUNC_O_MD32_0_TXD (MTK_PIN_NO(90) | 5)
> +#define PINMUX_GPIO90__FUNC_O_MD32_1_TXD (MTK_PIN_NO(90) | 6)
> +#define PINMUX_GPIO90__FUNC_B0_DBG_MON_B8 (MTK_PIN_NO(90) | 7)
> +
> +#define PINMUX_GPIO91__FUNC_B_GPIO91 (MTK_PIN_NO(91) | 0)
> +#define PINMUX_GPIO91__FUNC_I0_VBUSVALID_2P (MTK_PIN_NO(91) | 1)
> +#define PINMUX_GPIO91__FUNC_I1_URXD3 (MTK_PIN_NO(91) | 2)
> +#define PINMUX_GPIO91__FUNC_I1_ADSP_URXD0 (MTK_PIN_NO(91) | 3)
> +#define PINMUX_GPIO91__FUNC_I1_SSPM_URXD_AO (MTK_PIN_NO(91) | 4)
> +#define PINMUX_GPIO91__FUNC_I1_MD32_0_RXD (MTK_PIN_NO(91) | 5)
> +#define PINMUX_GPIO91__FUNC_I1_MD32_1_RXD (MTK_PIN_NO(91) | 6)
> +#define PINMUX_GPIO91__FUNC_B0_DBG_MON_B9 (MTK_PIN_NO(91) | 7)
> +
> +#define PINMUX_GPIO92__FUNC_B_GPIO92 (MTK_PIN_NO(92) | 0)
> +#define PINMUX_GPIO92__FUNC_O_PWRAP_SPI0_CSN (MTK_PIN_NO(92) | 1)
> +
> +#define PINMUX_GPIO93__FUNC_B_GPIO93 (MTK_PIN_NO(93) | 0)
> +#define PINMUX_GPIO93__FUNC_O_PWRAP_SPI0_CK (MTK_PIN_NO(93) | 1)
> +
> +#define PINMUX_GPIO94__FUNC_B_GPIO94 (MTK_PIN_NO(94) | 0)
> +#define PINMUX_GPIO94__FUNC_B0_PWRAP_SPI0_MO (MTK_PIN_NO(94) | 1)
> +#define PINMUX_GPIO94__FUNC_B0_PWRAP_SPI0_MI (MTK_PIN_NO(94) | 2)
> +
> +#define PINMUX_GPIO95__FUNC_B_GPIO95 (MTK_PIN_NO(95) | 0)
> +#define PINMUX_GPIO95__FUNC_B0_PWRAP_SPI0_MI (MTK_PIN_NO(95) | 1)
> +#define PINMUX_GPIO95__FUNC_B0_PWRAP_SPI0_MO (MTK_PIN_NO(95) | 2)
> +
> +#define PINMUX_GPIO96__FUNC_B_GPIO96 (MTK_PIN_NO(96) | 0)
> +#define PINMUX_GPIO96__FUNC_O_SRCLKENA0 (MTK_PIN_NO(96) | 1)
> +
> +#define PINMUX_GPIO97__FUNC_B_GPIO97 (MTK_PIN_NO(97) | 0)
> +#define PINMUX_GPIO97__FUNC_O_SRCLKENA1 (MTK_PIN_NO(97) | 1)
> +
> +#define PINMUX_GPIO98__FUNC_B_GPIO98 (MTK_PIN_NO(98) | 0)
> +#define PINMUX_GPIO98__FUNC_O_SCP_VREQ_VAO (MTK_PIN_NO(98) | 1)
> +#define PINMUX_GPIO98__FUNC_I0_DVFSRC_EXT_REQ (MTK_PIN_NO(98) | 2)
> +
> +#define PINMUX_GPIO99__FUNC_B_GPIO99 (MTK_PIN_NO(99) | 0)
> +#define PINMUX_GPIO99__FUNC_I0_RTC32K_CK (MTK_PIN_NO(99) | 1)
> +
> +#define PINMUX_GPIO100__FUNC_B_GPIO100 (MTK_PIN_NO(100) | 0)
> +#define PINMUX_GPIO100__FUNC_O_WATCHDOG (MTK_PIN_NO(100) | 1)
> +
> +#define PINMUX_GPIO101__FUNC_B_GPIO101 (MTK_PIN_NO(101) | 0)
> +#define PINMUX_GPIO101__FUNC_O_AUD_CLK_MOSI (MTK_PIN_NO(101) | 1)
> +#define PINMUX_GPIO101__FUNC_O_I2SO1_MCK (MTK_PIN_NO(101) | 2)
> +#define PINMUX_GPIO101__FUNC_B0_I2SIN_BCK (MTK_PIN_NO(101) | 3)
> +
> +#define PINMUX_GPIO102__FUNC_B_GPIO102 (MTK_PIN_NO(102) | 0)
> +#define PINMUX_GPIO102__FUNC_O_AUD_SYNC_MOSI (MTK_PIN_NO(102) | 1)
> +#define PINMUX_GPIO102__FUNC_O_I2SO1_BCK (MTK_PIN_NO(102) | 2)
> +#define PINMUX_GPIO102__FUNC_B0_I2SIN_WS (MTK_PIN_NO(102) | 3)
> +
> +#define PINMUX_GPIO103__FUNC_B_GPIO103 (MTK_PIN_NO(103) | 0)
> +#define PINMUX_GPIO103__FUNC_O_AUD_DAT_MOSI0 (MTK_PIN_NO(103) | 1)
> +#define PINMUX_GPIO103__FUNC_O_I2SO1_WS (MTK_PIN_NO(103) | 2)
> +#define PINMUX_GPIO103__FUNC_I0_I2SIN_D0 (MTK_PIN_NO(103) | 3)
> +
> +#define PINMUX_GPIO104__FUNC_B_GPIO104 (MTK_PIN_NO(104) | 0)
> +#define PINMUX_GPIO104__FUNC_O_AUD_DAT_MOSI1 (MTK_PIN_NO(104) | 1)
> +#define PINMUX_GPIO104__FUNC_O_I2SO1_D0 (MTK_PIN_NO(104) | 2)
> +#define PINMUX_GPIO104__FUNC_I0_I2SIN_D1 (MTK_PIN_NO(104) | 3)
> +
> +#define PINMUX_GPIO105__FUNC_B_GPIO105 (MTK_PIN_NO(105) | 0)
> +#define PINMUX_GPIO105__FUNC_I0_AUD_DAT_MISO0 (MTK_PIN_NO(105) | 1)
> +#define PINMUX_GPIO105__FUNC_I0_VOW_DAT_MISO (MTK_PIN_NO(105) | 2)
> +#define PINMUX_GPIO105__FUNC_I0_I2SIN_D2 (MTK_PIN_NO(105) | 3)
> +
> +#define PINMUX_GPIO106__FUNC_B_GPIO106 (MTK_PIN_NO(106) | 0)
> +#define PINMUX_GPIO106__FUNC_I0_AUD_DAT_MISO1 (MTK_PIN_NO(106) | 1)
> +#define PINMUX_GPIO106__FUNC_I0_VOW_CLK_MISO (MTK_PIN_NO(106) | 2)
> +#define PINMUX_GPIO106__FUNC_I0_I2SIN_D3 (MTK_PIN_NO(106) | 3)
> +
> +#define PINMUX_GPIO107__FUNC_B_GPIO107 (MTK_PIN_NO(107) | 0)
> +#define PINMUX_GPIO107__FUNC_B0_I2SIN_MCK (MTK_PIN_NO(107) | 1)
> +#define PINMUX_GPIO107__FUNC_I0_SPLIN_MCK (MTK_PIN_NO(107) | 2)
> +#define PINMUX_GPIO107__FUNC_I0_SPDIF_IN0 (MTK_PIN_NO(107) | 3)
> +#define PINMUX_GPIO107__FUNC_O_CMVREF4 (MTK_PIN_NO(107) | 4)
> +#define PINMUX_GPIO107__FUNC_O_AUXIF_ST0 (MTK_PIN_NO(107) | 5)
> +#define PINMUX_GPIO107__FUNC_O_PGD_LV_LSC_PWR0 (MTK_PIN_NO(107) | 6)
> +
> +#define PINMUX_GPIO108__FUNC_B_GPIO108 (MTK_PIN_NO(108) | 0)
> +#define PINMUX_GPIO108__FUNC_B0_I2SIN_BCK (MTK_PIN_NO(108) | 1)
> +#define PINMUX_GPIO108__FUNC_I0_SPLIN_LRCK (MTK_PIN_NO(108) | 2)
> +#define PINMUX_GPIO108__FUNC_O_DMIC4_CLK (MTK_PIN_NO(108) | 3)
> +#define PINMUX_GPIO108__FUNC_O_CMVREF5 (MTK_PIN_NO(108) | 4)
> +#define PINMUX_GPIO108__FUNC_O_AUXIF_CLK0 (MTK_PIN_NO(108) | 5)
> +#define PINMUX_GPIO108__FUNC_O_PGD_LV_LSC_PWR1 (MTK_PIN_NO(108) | 6)
> +#define PINMUX_GPIO108__FUNC_B0_DBG_MON_B10 (MTK_PIN_NO(108) | 7)
> +
> +#define PINMUX_GPIO109__FUNC_B_GPIO109 (MTK_PIN_NO(109) | 0)
> +#define PINMUX_GPIO109__FUNC_B0_I2SIN_WS (MTK_PIN_NO(109) | 1)
> +#define PINMUX_GPIO109__FUNC_I0_SPLIN_BCK (MTK_PIN_NO(109) | 2)
> +#define PINMUX_GPIO109__FUNC_I0_DMIC4_DAT (MTK_PIN_NO(109) | 3)
> +#define PINMUX_GPIO109__FUNC_O_CMVREF6 (MTK_PIN_NO(109) | 4)
> +#define PINMUX_GPIO109__FUNC_O_AUXIF_ST1 (MTK_PIN_NO(109) | 5)
> +#define PINMUX_GPIO109__FUNC_O_PGD_LV_LSC_PWR2 (MTK_PIN_NO(109) | 6)
> +#define PINMUX_GPIO109__FUNC_B0_DBG_MON_B11 (MTK_PIN_NO(109) | 7)
> +
> +#define PINMUX_GPIO110__FUNC_B_GPIO110 (MTK_PIN_NO(110) | 0)
> +#define PINMUX_GPIO110__FUNC_I0_I2SIN_D0 (MTK_PIN_NO(110) | 1)
> +#define PINMUX_GPIO110__FUNC_I0_SPLIN_D0 (MTK_PIN_NO(110) | 2)
> +#define PINMUX_GPIO110__FUNC_I0_DMIC4_DAT_R (MTK_PIN_NO(110) | 3)
> +#define PINMUX_GPIO110__FUNC_O_CMVREF7 (MTK_PIN_NO(110) | 4)
> +#define PINMUX_GPIO110__FUNC_O_AUXIF_CLK1 (MTK_PIN_NO(110) | 5)
> +#define PINMUX_GPIO110__FUNC_O_PGD_LV_LSC_PWR3 (MTK_PIN_NO(110) | 6)
> +#define PINMUX_GPIO110__FUNC_B0_DBG_MON_B12 (MTK_PIN_NO(110) | 7)
> +
> +#define PINMUX_GPIO111__FUNC_B_GPIO111 (MTK_PIN_NO(111) | 0)
> +#define PINMUX_GPIO111__FUNC_I0_I2SIN_D1 (MTK_PIN_NO(111) | 1)
> +#define PINMUX_GPIO111__FUNC_I0_SPLIN_D1 (MTK_PIN_NO(111) | 2)
> +#define PINMUX_GPIO111__FUNC_O_DMIC3_CLK (MTK_PIN_NO(111) | 3)
> +#define PINMUX_GPIO111__FUNC_O_SPDIF_OUT (MTK_PIN_NO(111) | 4)
> +#define PINMUX_GPIO111__FUNC_O_PGD_LV_LSC_PWR4 (MTK_PIN_NO(111) | 6)
> +#define PINMUX_GPIO111__FUNC_B0_DBG_MON_B13 (MTK_PIN_NO(111) | 7)
> +
> +#define PINMUX_GPIO112__FUNC_B_GPIO112 (MTK_PIN_NO(112) | 0)
> +#define PINMUX_GPIO112__FUNC_I0_I2SIN_D2 (MTK_PIN_NO(112) | 1)
> +#define PINMUX_GPIO112__FUNC_I0_SPLIN_D2 (MTK_PIN_NO(112) | 2)
> +#define PINMUX_GPIO112__FUNC_I0_DMIC3_DAT (MTK_PIN_NO(112) | 3)
> +#define PINMUX_GPIO112__FUNC_B0_TDMIN_MCK (MTK_PIN_NO(112) | 4)
> +#define PINMUX_GPIO112__FUNC_O_I2SO1_WS (MTK_PIN_NO(112) | 5)
> +#define PINMUX_GPIO112__FUNC_O_PGD_LV_LSC_PWR5 (MTK_PIN_NO(112) | 6)
> +#define PINMUX_GPIO112__FUNC_B0_DBG_MON_B14 (MTK_PIN_NO(112) | 7)
> +
> +#define PINMUX_GPIO113__FUNC_B_GPIO113 (MTK_PIN_NO(113) | 0)
> +#define PINMUX_GPIO113__FUNC_I0_I2SIN_D3 (MTK_PIN_NO(113) | 1)
> +#define PINMUX_GPIO113__FUNC_I0_SPLIN_D3 (MTK_PIN_NO(113) | 2)
> +#define PINMUX_GPIO113__FUNC_I0_DMIC3_DAT_R (MTK_PIN_NO(113) | 3)
> +#define PINMUX_GPIO113__FUNC_B0_TDMIN_BCK (MTK_PIN_NO(113) | 4)
> +#define PINMUX_GPIO113__FUNC_O_I2SO1_D0 (MTK_PIN_NO(113) | 5)
> +#define PINMUX_GPIO113__FUNC_B0_DBG_MON_B15 (MTK_PIN_NO(113) | 7)
> +
> +#define PINMUX_GPIO114__FUNC_B_GPIO114 (MTK_PIN_NO(114) | 0)
> +#define PINMUX_GPIO114__FUNC_O_I2SO2_MCK (MTK_PIN_NO(114) | 1)
> +#define PINMUX_GPIO114__FUNC_B0_I2SIN_MCK (MTK_PIN_NO(114) | 2)
> +#define PINMUX_GPIO114__FUNC_I1_MCUPM_JTAG_TMS (MTK_PIN_NO(114) | 3)
> +#define PINMUX_GPIO114__FUNC_B1_APU_JTAG_TMS (MTK_PIN_NO(114) | 4)
> +#define PINMUX_GPIO114__FUNC_I1_SCP_JTAG1_TMS (MTK_PIN_NO(114) | 5)
> +#define PINMUX_GPIO114__FUNC_I1_SPM_JTAG_TMS (MTK_PIN_NO(114) | 6)
> +#define PINMUX_GPIO114__FUNC_B0_DBG_MON_B16 (MTK_PIN_NO(114) | 7)
> +
> +#define PINMUX_GPIO115__FUNC_B_GPIO115 (MTK_PIN_NO(115) | 0)
> +#define PINMUX_GPIO115__FUNC_B0_I2SO2_BCK (MTK_PIN_NO(115) | 1)
> +#define PINMUX_GPIO115__FUNC_B0_I2SIN_BCK (MTK_PIN_NO(115) | 2)
> +#define PINMUX_GPIO115__FUNC_I1_MCUPM_JTAG_TCK (MTK_PIN_NO(115) | 3)
> +#define PINMUX_GPIO115__FUNC_I0_APU_JTAG_TCK (MTK_PIN_NO(115) | 4)
> +#define PINMUX_GPIO115__FUNC_I1_SCP_JTAG1_TCK (MTK_PIN_NO(115) | 5)
> +#define PINMUX_GPIO115__FUNC_I1_SPM_JTAG_TCK (MTK_PIN_NO(115) | 6)
> +#define PINMUX_GPIO115__FUNC_B0_DBG_MON_B17 (MTK_PIN_NO(115) | 7)
> +
> +#define PINMUX_GPIO116__FUNC_B_GPIO116 (MTK_PIN_NO(116) | 0)
> +#define PINMUX_GPIO116__FUNC_B0_I2SO2_WS (MTK_PIN_NO(116) | 1)
> +#define PINMUX_GPIO116__FUNC_B0_I2SIN_WS (MTK_PIN_NO(116) | 2)
> +#define PINMUX_GPIO116__FUNC_I1_MCUPM_JTAG_TDI (MTK_PIN_NO(116) | 3)
> +#define PINMUX_GPIO116__FUNC_I1_APU_JTAG_TDI (MTK_PIN_NO(116) | 4)
> +#define PINMUX_GPIO116__FUNC_I1_SCP_JTAG1_TDI (MTK_PIN_NO(116) | 5)
> +#define PINMUX_GPIO116__FUNC_I1_SPM_JTAG_TDI (MTK_PIN_NO(116) | 6)
> +#define PINMUX_GPIO116__FUNC_B0_DBG_MON_B18 (MTK_PIN_NO(116) | 7)
> +
> +#define PINMUX_GPIO117__FUNC_B_GPIO117 (MTK_PIN_NO(117) | 0)
> +#define PINMUX_GPIO117__FUNC_O_I2SO2_D0 (MTK_PIN_NO(117) | 1)
> +#define PINMUX_GPIO117__FUNC_I0_I2SIN_D0 (MTK_PIN_NO(117) | 2)
> +#define PINMUX_GPIO117__FUNC_O_MCUPM_JTAG_TDO (MTK_PIN_NO(117) | 3)
> +#define PINMUX_GPIO117__FUNC_O_APU_JTAG_TDO (MTK_PIN_NO(117) | 4)
> +#define PINMUX_GPIO117__FUNC_O_SCP_JTAG1_TDO (MTK_PIN_NO(117) | 5)
> +#define PINMUX_GPIO117__FUNC_O_SPM_JTAG_TDO (MTK_PIN_NO(117) | 6)
> +#define PINMUX_GPIO117__FUNC_B0_DBG_MON_B19 (MTK_PIN_NO(117) | 7)
> +
> +#define PINMUX_GPIO118__FUNC_B_GPIO118 (MTK_PIN_NO(118) | 0)
> +#define PINMUX_GPIO118__FUNC_O_I2SO2_D1 (MTK_PIN_NO(118) | 1)
> +#define PINMUX_GPIO118__FUNC_I0_I2SIN_D1 (MTK_PIN_NO(118) | 2)
> +#define PINMUX_GPIO118__FUNC_I0_MCUPM_JTAG_TRSTN (MTK_PIN_NO(118) | 3)
> +#define PINMUX_GPIO118__FUNC_I0_APU_JTAG_TRST (MTK_PIN_NO(118) | 4)
> +#define PINMUX_GPIO118__FUNC_I0_SCP_JTAG1_TRSTN (MTK_PIN_NO(118) | 5)
> +#define PINMUX_GPIO118__FUNC_I0_SPM_JTAG_TRSTN (MTK_PIN_NO(118) | 6)
> +#define PINMUX_GPIO118__FUNC_B0_DBG_MON_B20 (MTK_PIN_NO(118) | 7)
> +
> +#define PINMUX_GPIO119__FUNC_B_GPIO119 (MTK_PIN_NO(119) | 0)
> +#define PINMUX_GPIO119__FUNC_O_I2SO2_D2 (MTK_PIN_NO(119) | 1)
> +#define PINMUX_GPIO119__FUNC_I0_I2SIN_D2 (MTK_PIN_NO(119) | 2)
> +#define PINMUX_GPIO119__FUNC_O_UTXD3 (MTK_PIN_NO(119) | 3)
> +#define PINMUX_GPIO119__FUNC_B0_TDMIN_LRCK (MTK_PIN_NO(119) | 4)
> +#define PINMUX_GPIO119__FUNC_O_I2SO1_MCK (MTK_PIN_NO(119) | 5)
> +#define PINMUX_GPIO119__FUNC_O_SSPM_UTXD_AO (MTK_PIN_NO(119) | 6)
> +#define PINMUX_GPIO119__FUNC_B0_DBG_MON_B21 (MTK_PIN_NO(119) | 7)
> +
> +#define PINMUX_GPIO120__FUNC_B_GPIO120 (MTK_PIN_NO(120) | 0)
> +#define PINMUX_GPIO120__FUNC_O_I2SO2_D3 (MTK_PIN_NO(120) | 1)
> +#define PINMUX_GPIO120__FUNC_I0_I2SIN_D3 (MTK_PIN_NO(120) | 2)
> +#define PINMUX_GPIO120__FUNC_I1_URXD3 (MTK_PIN_NO(120) | 3)
> +#define PINMUX_GPIO120__FUNC_I0_TDMIN_DI (MTK_PIN_NO(120) | 4)
> +#define PINMUX_GPIO120__FUNC_O_I2SO1_BCK (MTK_PIN_NO(120) | 5)
> +#define PINMUX_GPIO120__FUNC_I1_SSPM_URXD_AO (MTK_PIN_NO(120) | 6)
> +#define PINMUX_GPIO120__FUNC_B0_DBG_MON_B22 (MTK_PIN_NO(120) | 7)
> +
> +#define PINMUX_GPIO121__FUNC_B_GPIO121 (MTK_PIN_NO(121) | 0)
> +#define PINMUX_GPIO121__FUNC_B0_PCM_CLK (MTK_PIN_NO(121) | 1)
> +#define PINMUX_GPIO121__FUNC_O_SPIM4_CSB (MTK_PIN_NO(121) | 2)
> +#define PINMUX_GPIO121__FUNC_O_SCP_SPI1_B_CS (MTK_PIN_NO(121) | 3)
> +#define PINMUX_GPIO121__FUNC_O_TP_UTXD2_AO (MTK_PIN_NO(121) | 4)
> +#define PINMUX_GPIO121__FUNC_O_AUXIF_ST0 (MTK_PIN_NO(121) | 5)
> +#define PINMUX_GPIO121__FUNC_O_PGD_DA_EFUSE_RDY (MTK_PIN_NO(121) | 6)
> +#define PINMUX_GPIO121__FUNC_B0_DBG_MON_B23 (MTK_PIN_NO(121) | 7)
> +
> +#define PINMUX_GPIO122__FUNC_B_GPIO122 (MTK_PIN_NO(122) | 0)
> +#define PINMUX_GPIO122__FUNC_B0_PCM_SYNC (MTK_PIN_NO(122) | 1)
> +#define PINMUX_GPIO122__FUNC_O_SPIM4_CLK (MTK_PIN_NO(122) | 2)
> +#define PINMUX_GPIO122__FUNC_O_SCP_SPI1_B_CK (MTK_PIN_NO(122) | 3)
> +#define PINMUX_GPIO122__FUNC_I1_TP_URXD2_AO (MTK_PIN_NO(122) | 4)
> +#define PINMUX_GPIO122__FUNC_O_AUXIF_CLK0 (MTK_PIN_NO(122) | 5)
> +#define PINMUX_GPIO122__FUNC_O_PGD_DA_EFUSE_RDY_PRE (MTK_PIN_NO(122) | 6)
> +#define PINMUX_GPIO122__FUNC_B0_DBG_MON_B24 (MTK_PIN_NO(122) | 7)
> +
> +#define PINMUX_GPIO123__FUNC_B_GPIO123 (MTK_PIN_NO(123) | 0)
> +#define PINMUX_GPIO123__FUNC_O_PCM_DO (MTK_PIN_NO(123) | 1)
> +#define PINMUX_GPIO123__FUNC_B0_SPIM4_MOSI (MTK_PIN_NO(123) | 2)
> +#define PINMUX_GPIO123__FUNC_O_SCP_SPI1_B_MO (MTK_PIN_NO(123) | 3)
> +#define PINMUX_GPIO123__FUNC_O_TP_URTS2_AO (MTK_PIN_NO(123) | 4)
> +#define PINMUX_GPIO123__FUNC_O_AUXIF_ST1 (MTK_PIN_NO(123) | 5)
> +#define PINMUX_GPIO123__FUNC_O_PGD_DA_PWRGD_RESET (MTK_PIN_NO(123) | 6)
> +#define PINMUX_GPIO123__FUNC_B0_DBG_MON_B25 (MTK_PIN_NO(123) | 7)
> +
> +#define PINMUX_GPIO124__FUNC_B_GPIO124 (MTK_PIN_NO(124) | 0)
> +#define PINMUX_GPIO124__FUNC_I0_PCM_DI (MTK_PIN_NO(124) | 1)
> +#define PINMUX_GPIO124__FUNC_B0_SPIM4_MISO (MTK_PIN_NO(124) | 2)
> +#define PINMUX_GPIO124__FUNC_I0_SCP_SPI1_B_MI (MTK_PIN_NO(124) | 3)
> +#define PINMUX_GPIO124__FUNC_I1_TP_UCTS2_AO (MTK_PIN_NO(124) | 4)
> +#define PINMUX_GPIO124__FUNC_O_AUXIF_CLK1 (MTK_PIN_NO(124) | 5)
> +#define PINMUX_GPIO124__FUNC_O_PGD_DA_PWRGD_ENB (MTK_PIN_NO(124) | 6)
> +#define PINMUX_GPIO124__FUNC_B0_DBG_MON_B26 (MTK_PIN_NO(124) | 7)
> +
> +#define PINMUX_GPIO125__FUNC_B_GPIO125 (MTK_PIN_NO(125) | 0)
> +#define PINMUX_GPIO125__FUNC_O_DMIC1_CLK (MTK_PIN_NO(125) | 1)
> +#define PINMUX_GPIO125__FUNC_O_SPINOR_CK (MTK_PIN_NO(125) | 2)
> +#define PINMUX_GPIO125__FUNC_B0_TDMIN_MCK (MTK_PIN_NO(125) | 3)
> +#define PINMUX_GPIO125__FUNC_O_LVTS_FOUT (MTK_PIN_NO(125) | 6)
> +#define PINMUX_GPIO125__FUNC_B0_DBG_MON_B27 (MTK_PIN_NO(125) | 7)
> +
> +#define PINMUX_GPIO126__FUNC_B_GPIO126 (MTK_PIN_NO(126) | 0)
> +#define PINMUX_GPIO126__FUNC_I0_DMIC1_DAT (MTK_PIN_NO(126) | 1)
> +#define PINMUX_GPIO126__FUNC_O_SPINOR_CS (MTK_PIN_NO(126) | 2)
> +#define PINMUX_GPIO126__FUNC_B0_TDMIN_BCK (MTK_PIN_NO(126) | 3)
> +#define PINMUX_GPIO126__FUNC_O_LVTS_SDO (MTK_PIN_NO(126) | 6)
> +#define PINMUX_GPIO126__FUNC_B0_DBG_MON_B28 (MTK_PIN_NO(126) | 7)
> +
> +#define PINMUX_GPIO127__FUNC_B_GPIO127 (MTK_PIN_NO(127) | 0)
> +#define PINMUX_GPIO127__FUNC_I0_DMIC1_DAT_R (MTK_PIN_NO(127) | 1)
> +#define PINMUX_GPIO127__FUNC_B0_SPINOR_IO0 (MTK_PIN_NO(127) | 2)
> +#define PINMUX_GPIO127__FUNC_B0_TDMIN_LRCK (MTK_PIN_NO(127) | 3)
> +#define PINMUX_GPIO127__FUNC_I0_LVTS_26M (MTK_PIN_NO(127) | 6)
> +#define PINMUX_GPIO127__FUNC_B0_DBG_MON_B29 (MTK_PIN_NO(127) | 7)
> +
> +#define PINMUX_GPIO128__FUNC_B_GPIO128 (MTK_PIN_NO(128) | 0)
> +#define PINMUX_GPIO128__FUNC_O_DMIC2_CLK (MTK_PIN_NO(128) | 1)
> +#define PINMUX_GPIO128__FUNC_B0_SPINOR_IO1 (MTK_PIN_NO(128) | 2)
> +#define PINMUX_GPIO128__FUNC_I0_TDMIN_DI (MTK_PIN_NO(128) | 3)
> +#define PINMUX_GPIO128__FUNC_I0_LVTS_SCF (MTK_PIN_NO(128) | 6)
> +#define PINMUX_GPIO128__FUNC_B0_DBG_MON_B30 (MTK_PIN_NO(128) | 7)
> +
> +#define PINMUX_GPIO129__FUNC_B_GPIO129 (MTK_PIN_NO(129) | 0)
> +#define PINMUX_GPIO129__FUNC_I0_DMIC2_DAT (MTK_PIN_NO(129) | 1)
> +#define PINMUX_GPIO129__FUNC_B0_SPINOR_IO2 (MTK_PIN_NO(129) | 2)
> +#define PINMUX_GPIO129__FUNC_I0_SPDIF_IN1 (MTK_PIN_NO(129) | 3)
> +#define PINMUX_GPIO129__FUNC_I0_LVTS_SCK (MTK_PIN_NO(129) | 6)
> +#define PINMUX_GPIO129__FUNC_B0_DBG_MON_B31 (MTK_PIN_NO(129) | 7)
> +
> +#define PINMUX_GPIO130__FUNC_B_GPIO130 (MTK_PIN_NO(130) | 0)
> +#define PINMUX_GPIO130__FUNC_I0_DMIC2_DAT_R (MTK_PIN_NO(130) | 1)
> +#define PINMUX_GPIO130__FUNC_B0_SPINOR_IO3 (MTK_PIN_NO(130) | 2)
> +#define PINMUX_GPIO130__FUNC_I0_SPDIF_IN2 (MTK_PIN_NO(130) | 3)
> +#define PINMUX_GPIO130__FUNC_I0_LVTS_SDI (MTK_PIN_NO(130) | 6)
> +#define PINMUX_GPIO130__FUNC_B0_DBG_MON_B32 (MTK_PIN_NO(130) | 7)
> +
> +#define PINMUX_GPIO131__FUNC_B_GPIO131 (MTK_PIN_NO(131) | 0)
> +#define PINMUX_GPIO131__FUNC_O_DPI_D0 (MTK_PIN_NO(131) | 1)
> +#define PINMUX_GPIO131__FUNC_O_GBE_TXD3 (MTK_PIN_NO(131) | 2)
> +#define PINMUX_GPIO131__FUNC_O_DMIC1_CLK (MTK_PIN_NO(131) | 3)
> +#define PINMUX_GPIO131__FUNC_O_I2SO2_MCK (MTK_PIN_NO(131) | 4)
> +#define PINMUX_GPIO131__FUNC_B0_TP_GPIO0_AO (MTK_PIN_NO(131) | 5)
> +#define PINMUX_GPIO131__FUNC_O_SPIM5_CSB (MTK_PIN_NO(131) | 6)
> +#define PINMUX_GPIO131__FUNC_O_PGD_LV_HSC_PWR0 (MTK_PIN_NO(131) | 7)
> +
> +#define PINMUX_GPIO132__FUNC_B_GPIO132 (MTK_PIN_NO(132) | 0)
> +#define PINMUX_GPIO132__FUNC_O_DPI_D1 (MTK_PIN_NO(132) | 1)
> +#define PINMUX_GPIO132__FUNC_O_GBE_TXD2 (MTK_PIN_NO(132) | 2)
> +#define PINMUX_GPIO132__FUNC_I0_DMIC1_DAT (MTK_PIN_NO(132) | 3)
> +#define PINMUX_GPIO132__FUNC_B0_I2SO2_BCK (MTK_PIN_NO(132) | 4)
> +#define PINMUX_GPIO132__FUNC_B0_TP_GPIO1_AO (MTK_PIN_NO(132) | 5)
> +#define PINMUX_GPIO132__FUNC_O_SPIM5_CLK (MTK_PIN_NO(132) | 6)
> +#define PINMUX_GPIO132__FUNC_O_PGD_LV_HSC_PWR1 (MTK_PIN_NO(132) | 7)
> +
> +#define PINMUX_GPIO133__FUNC_B_GPIO133 (MTK_PIN_NO(133) | 0)
> +#define PINMUX_GPIO133__FUNC_O_DPI_D2 (MTK_PIN_NO(133) | 1)
> +#define PINMUX_GPIO133__FUNC_O_GBE_TXD1 (MTK_PIN_NO(133) | 2)
> +#define PINMUX_GPIO133__FUNC_I0_DMIC1_DAT_R (MTK_PIN_NO(133) | 3)
> +#define PINMUX_GPIO133__FUNC_B0_I2SO2_WS (MTK_PIN_NO(133) | 4)
> +#define PINMUX_GPIO133__FUNC_B0_TP_GPIO2_AO (MTK_PIN_NO(133) | 5)
> +#define PINMUX_GPIO133__FUNC_B0_SPIM5_MOSI (MTK_PIN_NO(133) | 6)
> +#define PINMUX_GPIO133__FUNC_O_PGD_LV_HSC_PWR2 (MTK_PIN_NO(133) | 7)
> +
> +#define PINMUX_GPIO134__FUNC_B_GPIO134 (MTK_PIN_NO(134) | 0)
> +#define PINMUX_GPIO134__FUNC_O_DPI_D3 (MTK_PIN_NO(134) | 1)
> +#define PINMUX_GPIO134__FUNC_O_GBE_TXD0 (MTK_PIN_NO(134) | 2)
> +#define PINMUX_GPIO134__FUNC_O_DMIC2_CLK (MTK_PIN_NO(134) | 3)
> +#define PINMUX_GPIO134__FUNC_O_I2SO2_D0 (MTK_PIN_NO(134) | 4)
> +#define PINMUX_GPIO134__FUNC_B0_TP_GPIO3_AO (MTK_PIN_NO(134) | 5)
> +#define PINMUX_GPIO134__FUNC_B0_SPIM5_MISO (MTK_PIN_NO(134) | 6)
> +#define PINMUX_GPIO134__FUNC_O_PGD_LV_HSC_PWR3 (MTK_PIN_NO(134) | 7)
> +
> +#define PINMUX_GPIO135__FUNC_B_GPIO135 (MTK_PIN_NO(135) | 0)
> +#define PINMUX_GPIO135__FUNC_O_DPI_D4 (MTK_PIN_NO(135) | 1)
> +#define PINMUX_GPIO135__FUNC_I0_GBE_RXD3 (MTK_PIN_NO(135) | 2)
> +#define PINMUX_GPIO135__FUNC_I0_DMIC2_DAT (MTK_PIN_NO(135) | 3)
> +#define PINMUX_GPIO135__FUNC_O_I2SO2_D1 (MTK_PIN_NO(135) | 4)
> +#define PINMUX_GPIO135__FUNC_B0_TP_GPIO4_AO (MTK_PIN_NO(135) | 5)
> +#define PINMUX_GPIO135__FUNC_I1_WAKEN (MTK_PIN_NO(135) | 6)
> +#define PINMUX_GPIO135__FUNC_O_PGD_LV_HSC_PWR4 (MTK_PIN_NO(135) | 7)
> +
> +#define PINMUX_GPIO136__FUNC_B_GPIO136 (MTK_PIN_NO(136) | 0)
> +#define PINMUX_GPIO136__FUNC_O_DPI_D5 (MTK_PIN_NO(136) | 1)
> +#define PINMUX_GPIO136__FUNC_I0_GBE_RXD2 (MTK_PIN_NO(136) | 2)
> +#define PINMUX_GPIO136__FUNC_I0_DMIC2_DAT_R (MTK_PIN_NO(136) | 3)
> +#define PINMUX_GPIO136__FUNC_O_I2SO2_D2 (MTK_PIN_NO(136) | 4)
> +#define PINMUX_GPIO136__FUNC_B0_TP_GPIO5_AO (MTK_PIN_NO(136) | 5)
> +#define PINMUX_GPIO136__FUNC_O_PERSTN (MTK_PIN_NO(136) | 6)
> +#define PINMUX_GPIO136__FUNC_O_PGD_LV_HSC_PWR5 (MTK_PIN_NO(136) | 7)
> +
> +#define PINMUX_GPIO137__FUNC_B_GPIO137 (MTK_PIN_NO(137) | 0)
> +#define PINMUX_GPIO137__FUNC_O_DPI_D6 (MTK_PIN_NO(137) | 1)
> +#define PINMUX_GPIO137__FUNC_I0_GBE_RXD1 (MTK_PIN_NO(137) | 2)
> +#define PINMUX_GPIO137__FUNC_O_DMIC3_CLK (MTK_PIN_NO(137) | 3)
> +#define PINMUX_GPIO137__FUNC_O_I2SO2_D3 (MTK_PIN_NO(137) | 4)
> +#define PINMUX_GPIO137__FUNC_B0_TP_GPIO6_AO (MTK_PIN_NO(137) | 5)
> +#define PINMUX_GPIO137__FUNC_B1_CLKREQN (MTK_PIN_NO(137) | 6)
> +#define PINMUX_GPIO137__FUNC_O_PWM_0 (MTK_PIN_NO(137) | 7)
> +
> +#define PINMUX_GPIO138__FUNC_B_GPIO138 (MTK_PIN_NO(138) | 0)
> +#define PINMUX_GPIO138__FUNC_O_DPI_D7 (MTK_PIN_NO(138) | 1)
> +#define PINMUX_GPIO138__FUNC_I0_GBE_RXD0 (MTK_PIN_NO(138) | 2)
> +#define PINMUX_GPIO138__FUNC_I0_DMIC3_DAT (MTK_PIN_NO(138) | 3)
> +#define PINMUX_GPIO138__FUNC_O_CLKM2 (MTK_PIN_NO(138) | 4)
> +#define PINMUX_GPIO138__FUNC_B0_TP_GPIO7_AO (MTK_PIN_NO(138) | 5)
> +#define PINMUX_GPIO138__FUNC_B0_MD32_0_GPIO0 (MTK_PIN_NO(138) | 7)
> +
> +#define PINMUX_GPIO139__FUNC_B_GPIO139 (MTK_PIN_NO(139) | 0)
> +#define PINMUX_GPIO139__FUNC_O_DPI_D8 (MTK_PIN_NO(139) | 1)
> +#define PINMUX_GPIO139__FUNC_B0_GBE_TXC (MTK_PIN_NO(139) | 2)
> +#define PINMUX_GPIO139__FUNC_I0_DMIC3_DAT_R (MTK_PIN_NO(139) | 3)
> +#define PINMUX_GPIO139__FUNC_O_CLKM3 (MTK_PIN_NO(139) | 4)
> +#define PINMUX_GPIO139__FUNC_O_TP_UTXD2_AO (MTK_PIN_NO(139) | 5)
> +#define PINMUX_GPIO139__FUNC_O_UTXD2 (MTK_PIN_NO(139) | 6)
> +#define PINMUX_GPIO139__FUNC_B0_MD32_0_GPIO1 (MTK_PIN_NO(139) | 7)
> +
> +#define PINMUX_GPIO140__FUNC_B_GPIO140 (MTK_PIN_NO(140) | 0)
> +#define PINMUX_GPIO140__FUNC_O_DPI_D9 (MTK_PIN_NO(140) | 1)
> +#define PINMUX_GPIO140__FUNC_I0_GBE_RXC (MTK_PIN_NO(140) | 2)
> +#define PINMUX_GPIO140__FUNC_O_DMIC4_CLK (MTK_PIN_NO(140) | 3)
> +#define PINMUX_GPIO140__FUNC_O_PWM_2 (MTK_PIN_NO(140) | 4)
> +#define PINMUX_GPIO140__FUNC_I1_TP_URXD2_AO (MTK_PIN_NO(140) | 5)
> +#define PINMUX_GPIO140__FUNC_I1_URXD2 (MTK_PIN_NO(140) | 6)
> +#define PINMUX_GPIO140__FUNC_B0_MD32_0_GPIO2 (MTK_PIN_NO(140) | 7)
> +
> +#define PINMUX_GPIO141__FUNC_B_GPIO141 (MTK_PIN_NO(141) | 0)
> +#define PINMUX_GPIO141__FUNC_O_DPI_D10 (MTK_PIN_NO(141) | 1)
> +#define PINMUX_GPIO141__FUNC_I0_GBE_RXDV (MTK_PIN_NO(141) | 2)
> +#define PINMUX_GPIO141__FUNC_I0_DMIC4_DAT (MTK_PIN_NO(141) | 3)
> +#define PINMUX_GPIO141__FUNC_O_PWM_3 (MTK_PIN_NO(141) | 4)
> +#define PINMUX_GPIO141__FUNC_O_TP_URTS2_AO (MTK_PIN_NO(141) | 5)
> +#define PINMUX_GPIO141__FUNC_O_URTS2 (MTK_PIN_NO(141) | 6)
> +#define PINMUX_GPIO141__FUNC_B0_MD32_1_GPIO0 (MTK_PIN_NO(141) | 7)
> +
> +#define PINMUX_GPIO142__FUNC_B_GPIO142 (MTK_PIN_NO(142) | 0)
> +#define PINMUX_GPIO142__FUNC_O_DPI_D11 (MTK_PIN_NO(142) | 1)
> +#define PINMUX_GPIO142__FUNC_O_GBE_TXEN (MTK_PIN_NO(142) | 2)
> +#define PINMUX_GPIO142__FUNC_I0_DMIC4_DAT_R (MTK_PIN_NO(142) | 3)
> +#define PINMUX_GPIO142__FUNC_O_PWM_1 (MTK_PIN_NO(142) | 4)
> +#define PINMUX_GPIO142__FUNC_I1_TP_UCTS2_AO (MTK_PIN_NO(142) | 5)
> +#define PINMUX_GPIO142__FUNC_I1_UCTS2 (MTK_PIN_NO(142) | 6)
> +#define PINMUX_GPIO142__FUNC_B0_MD32_1_GPIO1 (MTK_PIN_NO(142) | 7)
> +
> +#define PINMUX_GPIO143__FUNC_B_GPIO143 (MTK_PIN_NO(143) | 0)
> +#define PINMUX_GPIO143__FUNC_O_DPI_D12 (MTK_PIN_NO(143) | 1)
> +#define PINMUX_GPIO143__FUNC_O_GBE_MDC (MTK_PIN_NO(143) | 2)
> +#define PINMUX_GPIO143__FUNC_B0_MD32_0_GPIO0 (MTK_PIN_NO(143) | 3)
> +#define PINMUX_GPIO143__FUNC_O_CLKM0 (MTK_PIN_NO(143) | 4)
> +#define PINMUX_GPIO143__FUNC_O_SPIM3_CSB (MTK_PIN_NO(143) | 5)
> +#define PINMUX_GPIO143__FUNC_O_UTXD1 (MTK_PIN_NO(143) | 6)
> +#define PINMUX_GPIO143__FUNC_B0_MD32_1_GPIO2 (MTK_PIN_NO(143) | 7)
> +
> +#define PINMUX_GPIO144__FUNC_B_GPIO144 (MTK_PIN_NO(144) | 0)
> +#define PINMUX_GPIO144__FUNC_O_DPI_D13 (MTK_PIN_NO(144) | 1)
> +#define PINMUX_GPIO144__FUNC_B1_GBE_MDIO (MTK_PIN_NO(144) | 2)
> +#define PINMUX_GPIO144__FUNC_B0_MD32_0_GPIO1 (MTK_PIN_NO(144) | 3)
> +#define PINMUX_GPIO144__FUNC_O_CLKM1 (MTK_PIN_NO(144) | 4)
> +#define PINMUX_GPIO144__FUNC_O_SPIM3_CLK (MTK_PIN_NO(144) | 5)
> +#define PINMUX_GPIO144__FUNC_I1_URXD1 (MTK_PIN_NO(144) | 6)
> +#define PINMUX_GPIO144__FUNC_O_PGD_HV_HSC_PWR0 (MTK_PIN_NO(144) | 7)
> +
> +#define PINMUX_GPIO145__FUNC_B_GPIO145 (MTK_PIN_NO(145) | 0)
> +#define PINMUX_GPIO145__FUNC_O_DPI_D14 (MTK_PIN_NO(145) | 1)
> +#define PINMUX_GPIO145__FUNC_O_GBE_TXER (MTK_PIN_NO(145) | 2)
> +#define PINMUX_GPIO145__FUNC_B0_MD32_1_GPIO0 (MTK_PIN_NO(145) | 3)
> +#define PINMUX_GPIO145__FUNC_O_CMFLASH0 (MTK_PIN_NO(145) | 4)
> +#define PINMUX_GPIO145__FUNC_B0_SPIM3_MOSI (MTK_PIN_NO(145) | 5)
> +#define PINMUX_GPIO145__FUNC_B0_GBE_AUX_PPS2 (MTK_PIN_NO(145) | 6)
> +#define PINMUX_GPIO145__FUNC_O_PGD_HV_HSC_PWR1 (MTK_PIN_NO(145) | 7)
> +
> +#define PINMUX_GPIO146__FUNC_B_GPIO146 (MTK_PIN_NO(146) | 0)
> +#define PINMUX_GPIO146__FUNC_O_DPI_D15 (MTK_PIN_NO(146) | 1)
> +#define PINMUX_GPIO146__FUNC_I0_GBE_RXER (MTK_PIN_NO(146) | 2)
> +#define PINMUX_GPIO146__FUNC_B0_MD32_1_GPIO1 (MTK_PIN_NO(146) | 3)
> +#define PINMUX_GPIO146__FUNC_O_CMFLASH1 (MTK_PIN_NO(146) | 4)
> +#define PINMUX_GPIO146__FUNC_B0_SPIM3_MISO (MTK_PIN_NO(146) | 5)
> +#define PINMUX_GPIO146__FUNC_B0_GBE_AUX_PPS3 (MTK_PIN_NO(146) | 6)
> +#define PINMUX_GPIO146__FUNC_O_PGD_HV_HSC_PWR2 (MTK_PIN_NO(146) | 7)
> +
> +#define PINMUX_GPIO147__FUNC_B_GPIO147 (MTK_PIN_NO(147) | 0)
> +#define PINMUX_GPIO147__FUNC_O_DPI_HSYNC (MTK_PIN_NO(147) | 1)
> +#define PINMUX_GPIO147__FUNC_I0_GBE_COL (MTK_PIN_NO(147) | 2)
> +#define PINMUX_GPIO147__FUNC_O_I2SO1_MCK (MTK_PIN_NO(147) | 3)
> +#define PINMUX_GPIO147__FUNC_O_CMVREF0 (MTK_PIN_NO(147) | 4)
> +#define PINMUX_GPIO147__FUNC_O_SPDIF_OUT (MTK_PIN_NO(147) | 5)
> +#define PINMUX_GPIO147__FUNC_O_URTS1 (MTK_PIN_NO(147) | 6)
> +#define PINMUX_GPIO147__FUNC_O_PGD_HV_HSC_PWR3 (MTK_PIN_NO(147) | 7)
> +
> +#define PINMUX_GPIO148__FUNC_B_GPIO148 (MTK_PIN_NO(148) | 0)
> +#define PINMUX_GPIO148__FUNC_O_DPI_VSYNC (MTK_PIN_NO(148) | 1)
> +#define PINMUX_GPIO148__FUNC_I0_GBE_INTR (MTK_PIN_NO(148) | 2)
> +#define PINMUX_GPIO148__FUNC_O_I2SO1_BCK (MTK_PIN_NO(148) | 3)
> +#define PINMUX_GPIO148__FUNC_O_CMVREF1 (MTK_PIN_NO(148) | 4)
> +#define PINMUX_GPIO148__FUNC_I0_SPDIF_IN0 (MTK_PIN_NO(148) | 5)
> +#define PINMUX_GPIO148__FUNC_I1_UCTS1 (MTK_PIN_NO(148) | 6)
> +#define PINMUX_GPIO148__FUNC_O_PGD_HV_HSC_PWR4 (MTK_PIN_NO(148) | 7)
> +
> +#define PINMUX_GPIO149__FUNC_B_GPIO149 (MTK_PIN_NO(149) | 0)
> +#define PINMUX_GPIO149__FUNC_O_DPI_DE (MTK_PIN_NO(149) | 1)
> +#define PINMUX_GPIO149__FUNC_B0_GBE_AUX_PPS0 (MTK_PIN_NO(149) | 2)
> +#define PINMUX_GPIO149__FUNC_O_I2SO1_WS (MTK_PIN_NO(149) | 3)
> +#define PINMUX_GPIO149__FUNC_O_CMVREF2 (MTK_PIN_NO(149) | 4)
> +#define PINMUX_GPIO149__FUNC_I0_SPDIF_IN1 (MTK_PIN_NO(149) | 5)
> +#define PINMUX_GPIO149__FUNC_O_UTXD3 (MTK_PIN_NO(149) | 6)
> +#define PINMUX_GPIO149__FUNC_O_PGD_HV_HSC_PWR5 (MTK_PIN_NO(149) | 7)
> +
> +#define PINMUX_GPIO150__FUNC_B_GPIO150 (MTK_PIN_NO(150) | 0)
> +#define PINMUX_GPIO150__FUNC_O_DPI_CK (MTK_PIN_NO(150) | 1)
> +#define PINMUX_GPIO150__FUNC_B0_GBE_AUX_PPS1 (MTK_PIN_NO(150) | 2)
> +#define PINMUX_GPIO150__FUNC_O_I2SO1_D0 (MTK_PIN_NO(150) | 3)
> +#define PINMUX_GPIO150__FUNC_O_CMVREF3 (MTK_PIN_NO(150) | 4)
> +#define PINMUX_GPIO150__FUNC_I0_SPDIF_IN2 (MTK_PIN_NO(150) | 5)
> +#define PINMUX_GPIO150__FUNC_I1_URXD3 (MTK_PIN_NO(150) | 6)
> +
> +#define PINMUX_GPIO151__FUNC_B_GPIO151 (MTK_PIN_NO(151) | 0)
> +#define PINMUX_GPIO151__FUNC_B1_MSDC0_DAT7 (MTK_PIN_NO(151) | 1)
> +
> +#define PINMUX_GPIO152__FUNC_B_GPIO152 (MTK_PIN_NO(152) | 0)
> +#define PINMUX_GPIO152__FUNC_B1_MSDC0_DAT6 (MTK_PIN_NO(152) | 1)
> +
> +#define PINMUX_GPIO153__FUNC_B_GPIO153 (MTK_PIN_NO(153) | 0)
> +#define PINMUX_GPIO153__FUNC_B1_MSDC0_DAT5 (MTK_PIN_NO(153) | 1)
> +
> +#define PINMUX_GPIO154__FUNC_B_GPIO154 (MTK_PIN_NO(154) | 0)
> +#define PINMUX_GPIO154__FUNC_B1_MSDC0_DAT4 (MTK_PIN_NO(154) | 1)
> +
> +#define PINMUX_GPIO155__FUNC_B_GPIO155 (MTK_PIN_NO(155) | 0)
> +#define PINMUX_GPIO155__FUNC_O_MSDC0_RSTB (MTK_PIN_NO(155) | 1)
> +
> +#define PINMUX_GPIO156__FUNC_B_GPIO156 (MTK_PIN_NO(156) | 0)
> +#define PINMUX_GPIO156__FUNC_B1_MSDC0_CMD (MTK_PIN_NO(156) | 1)
> +
> +#define PINMUX_GPIO157__FUNC_B_GPIO157 (MTK_PIN_NO(157) | 0)
> +#define PINMUX_GPIO157__FUNC_B1_MSDC0_CLK (MTK_PIN_NO(157) | 1)
> +
> +#define PINMUX_GPIO158__FUNC_B_GPIO158 (MTK_PIN_NO(158) | 0)
> +#define PINMUX_GPIO158__FUNC_B1_MSDC0_DAT3 (MTK_PIN_NO(158) | 1)
> +
> +#define PINMUX_GPIO159__FUNC_B_GPIO159 (MTK_PIN_NO(159) | 0)
> +#define PINMUX_GPIO159__FUNC_B1_MSDC0_DAT2 (MTK_PIN_NO(159) | 1)
> +
> +#define PINMUX_GPIO160__FUNC_B_GPIO160 (MTK_PIN_NO(160) | 0)
> +#define PINMUX_GPIO160__FUNC_B1_MSDC0_DAT1 (MTK_PIN_NO(160) | 1)
> +
> +#define PINMUX_GPIO161__FUNC_B_GPIO161 (MTK_PIN_NO(161) | 0)
> +#define PINMUX_GPIO161__FUNC_B1_MSDC0_DAT0 (MTK_PIN_NO(161) | 1)
> +
> +#define PINMUX_GPIO162__FUNC_B_GPIO162 (MTK_PIN_NO(162) | 0)
> +#define PINMUX_GPIO162__FUNC_B0_MSDC0_DSL (MTK_PIN_NO(162) | 1)
> +
> +#define PINMUX_GPIO163__FUNC_B_GPIO163 (MTK_PIN_NO(163) | 0)
> +#define PINMUX_GPIO163__FUNC_B1_MSDC1_CMD (MTK_PIN_NO(163) | 1)
> +#define PINMUX_GPIO163__FUNC_O_SPDIF_OUT (MTK_PIN_NO(163) | 2)
> +#define PINMUX_GPIO163__FUNC_I1_MD32_0_JTAG_TMS (MTK_PIN_NO(163) | 3)
> +#define PINMUX_GPIO163__FUNC_I1_ADSP_JTAG0_TMS (MTK_PIN_NO(163) | 4)
> +#define PINMUX_GPIO163__FUNC_I1_SCP_JTAG0_TMS (MTK_PIN_NO(163) | 5)
> +#define PINMUX_GPIO163__FUNC_I1_CCU0_JTAG_TMS (MTK_PIN_NO(163) | 6)
> +#define PINMUX_GPIO163__FUNC_I0_IPU_JTAG_TMS (MTK_PIN_NO(163) | 7)
> +
> +#define PINMUX_GPIO164__FUNC_B_GPIO164 (MTK_PIN_NO(164) | 0)
> +#define PINMUX_GPIO164__FUNC_B1_MSDC1_CLK (MTK_PIN_NO(164) | 1)
> +#define PINMUX_GPIO164__FUNC_I0_SPDIF_IN0 (MTK_PIN_NO(164) | 2)
> +#define PINMUX_GPIO164__FUNC_I1_MD32_0_JTAG_TCK (MTK_PIN_NO(164) | 3)
> +#define PINMUX_GPIO164__FUNC_I0_ADSP_JTAG0_TCK (MTK_PIN_NO(164) | 4)
> +#define PINMUX_GPIO164__FUNC_I1_SCP_JTAG0_TCK (MTK_PIN_NO(164) | 5)
> +#define PINMUX_GPIO164__FUNC_I1_CCU0_JTAG_TCK (MTK_PIN_NO(164) | 6)
> +#define PINMUX_GPIO164__FUNC_I0_IPU_JTAG_TCK (MTK_PIN_NO(164) | 7)
> +
> +#define PINMUX_GPIO165__FUNC_B_GPIO165 (MTK_PIN_NO(165) | 0)
> +#define PINMUX_GPIO165__FUNC_B1_MSDC1_DAT0 (MTK_PIN_NO(165) | 1)
> +#define PINMUX_GPIO165__FUNC_I0_SPDIF_IN1 (MTK_PIN_NO(165) | 2)
> +#define PINMUX_GPIO165__FUNC_I1_MD32_0_JTAG_TDI (MTK_PIN_NO(165) | 3)
> +#define PINMUX_GPIO165__FUNC_I1_ADSP_JTAG0_TDI (MTK_PIN_NO(165) | 4)
> +#define PINMUX_GPIO165__FUNC_I1_SCP_JTAG0_TDI (MTK_PIN_NO(165) | 5)
> +#define PINMUX_GPIO165__FUNC_I1_CCU0_JTAG_TDI (MTK_PIN_NO(165) | 6)
> +#define PINMUX_GPIO165__FUNC_I0_IPU_JTAG_TDI (MTK_PIN_NO(165) | 7)
> +
> +#define PINMUX_GPIO166__FUNC_B_GPIO166 (MTK_PIN_NO(166) | 0)
> +#define PINMUX_GPIO166__FUNC_B1_MSDC1_DAT1 (MTK_PIN_NO(166) | 1)
> +#define PINMUX_GPIO166__FUNC_I0_SPDIF_IN2 (MTK_PIN_NO(166) | 2)
> +#define PINMUX_GPIO166__FUNC_O_MD32_0_JTAG_TDO (MTK_PIN_NO(166) | 3)
> +#define PINMUX_GPIO166__FUNC_O_ADSP_JTAG0_TDO (MTK_PIN_NO(166) | 4)
> +#define PINMUX_GPIO166__FUNC_O_SCP_JTAG0_TDO (MTK_PIN_NO(166) | 5)
> +#define PINMUX_GPIO166__FUNC_O_CCU0_JTAG_TDO (MTK_PIN_NO(166) | 6)
> +#define PINMUX_GPIO166__FUNC_O_IPU_JTAG_TDO (MTK_PIN_NO(166) | 7)
> +
> +#define PINMUX_GPIO167__FUNC_B_GPIO167 (MTK_PIN_NO(167) | 0)
> +#define PINMUX_GPIO167__FUNC_B1_MSDC1_DAT2 (MTK_PIN_NO(167) | 1)
> +#define PINMUX_GPIO167__FUNC_O_PWM_0 (MTK_PIN_NO(167) | 2)
> +#define PINMUX_GPIO167__FUNC_I1_MD32_0_JTAG_TRST (MTK_PIN_NO(167) | 3)
> +#define PINMUX_GPIO167__FUNC_I1_ADSP_JTAG0_TRSTN (MTK_PIN_NO(167) | 4)
> +#define PINMUX_GPIO167__FUNC_I0_SCP_JTAG0_TRSTN (MTK_PIN_NO(167) | 5)
> +#define PINMUX_GPIO167__FUNC_I1_CCU0_JTAG_TRST (MTK_PIN_NO(167) | 6)
> +#define PINMUX_GPIO167__FUNC_I0_IPU_JTAG_TRST (MTK_PIN_NO(167) | 7)
> +
> +#define PINMUX_GPIO168__FUNC_B_GPIO168 (MTK_PIN_NO(168) | 0)
> +#define PINMUX_GPIO168__FUNC_B1_MSDC1_DAT3 (MTK_PIN_NO(168) | 1)
> +#define PINMUX_GPIO168__FUNC_O_PWM_1 (MTK_PIN_NO(168) | 2)
> +#define PINMUX_GPIO168__FUNC_O_CLKM0 (MTK_PIN_NO(168) | 3)
> +
> +#define PINMUX_GPIO169__FUNC_B_GPIO169 (MTK_PIN_NO(169) | 0)
> +#define PINMUX_GPIO169__FUNC_B1_MSDC2_CMD (MTK_PIN_NO(169) | 1)
> +#define PINMUX_GPIO169__FUNC_O_LVTS_FOUT (MTK_PIN_NO(169) | 2)
> +#define PINMUX_GPIO169__FUNC_I1_MD32_1_JTAG_TMS (MTK_PIN_NO(169) | 3)
> +#define PINMUX_GPIO169__FUNC_I0_UDI_TMS (MTK_PIN_NO(169) | 4)
> +#define PINMUX_GPIO169__FUNC_I0_VPU_UDI_TMS (MTK_PIN_NO(169) | 5)
> +#define PINMUX_GPIO169__FUNC_B0_TDMIN_MCK (MTK_PIN_NO(169) | 6)
> +#define PINMUX_GPIO169__FUNC_I1_SSPM_JTAG_TMS (MTK_PIN_NO(169) | 7)
> +
> +#define PINMUX_GPIO170__FUNC_B_GPIO170 (MTK_PIN_NO(170) | 0)
> +#define PINMUX_GPIO170__FUNC_B1_MSDC2_CLK (MTK_PIN_NO(170) | 1)
> +#define PINMUX_GPIO170__FUNC_O_LVTS_SDO (MTK_PIN_NO(170) | 2)
> +#define PINMUX_GPIO170__FUNC_I1_MD32_1_JTAG_TCK (MTK_PIN_NO(170) | 3)
> +#define PINMUX_GPIO170__FUNC_I0_UDI_TCK (MTK_PIN_NO(170) | 4)
> +#define PINMUX_GPIO170__FUNC_I0_VPU_UDI_TCK (MTK_PIN_NO(170) | 5)
> +#define PINMUX_GPIO170__FUNC_B0_TDMIN_BCK (MTK_PIN_NO(170) | 6)
> +#define PINMUX_GPIO170__FUNC_I1_SSPM_JTAG_TCK (MTK_PIN_NO(170) | 7)
> +
> +#define PINMUX_GPIO171__FUNC_B_GPIO171 (MTK_PIN_NO(171) | 0)
> +#define PINMUX_GPIO171__FUNC_B1_MSDC2_DAT0 (MTK_PIN_NO(171) | 1)
> +#define PINMUX_GPIO171__FUNC_I0_LVTS_26M (MTK_PIN_NO(171) | 2)
> +#define PINMUX_GPIO171__FUNC_I1_MD32_1_JTAG_TDI (MTK_PIN_NO(171) | 3)
> +#define PINMUX_GPIO171__FUNC_I0_UDI_TDI (MTK_PIN_NO(171) | 4)
> +#define PINMUX_GPIO171__FUNC_I0_VPU_UDI_TDI (MTK_PIN_NO(171) | 5)
> +#define PINMUX_GPIO171__FUNC_B0_TDMIN_LRCK (MTK_PIN_NO(171) | 6)
> +#define PINMUX_GPIO171__FUNC_I1_SSPM_JTAG_TDI (MTK_PIN_NO(171) | 7)
> +
> +#define PINMUX_GPIO172__FUNC_B_GPIO172 (MTK_PIN_NO(172) | 0)
> +#define PINMUX_GPIO172__FUNC_B1_MSDC2_DAT1 (MTK_PIN_NO(172) | 1)
> +#define PINMUX_GPIO172__FUNC_I0_LVTS_SCF (MTK_PIN_NO(172) | 2)
> +#define PINMUX_GPIO172__FUNC_O_MD32_1_JTAG_TDO (MTK_PIN_NO(172) | 3)
> +#define PINMUX_GPIO172__FUNC_O_UDI_TDO (MTK_PIN_NO(172) | 4)
> +#define PINMUX_GPIO172__FUNC_O_VPU_UDI_TDO (MTK_PIN_NO(172) | 5)
> +#define PINMUX_GPIO172__FUNC_I0_TDMIN_DI (MTK_PIN_NO(172) | 6)
> +#define PINMUX_GPIO172__FUNC_O_SSPM_JTAG_TDO (MTK_PIN_NO(172) | 7)
> +
> +#define PINMUX_GPIO173__FUNC_B_GPIO173 (MTK_PIN_NO(173) | 0)
> +#define PINMUX_GPIO173__FUNC_B1_MSDC2_DAT2 (MTK_PIN_NO(173) | 1)
> +#define PINMUX_GPIO173__FUNC_I0_LVTS_SCK (MTK_PIN_NO(173) | 2)
> +#define PINMUX_GPIO173__FUNC_I1_MD32_1_JTAG_TRST (MTK_PIN_NO(173) | 3)
> +#define PINMUX_GPIO173__FUNC_I0_UDI_NTRST (MTK_PIN_NO(173) | 4)
> +#define PINMUX_GPIO173__FUNC_I0_VPU_UDI_NTRST (MTK_PIN_NO(173) | 5)
> +#define PINMUX_GPIO173__FUNC_I0_SSPM_JTAG_TRSTN (MTK_PIN_NO(173) | 7)
> +
> +#define PINMUX_GPIO174__FUNC_B_GPIO174 (MTK_PIN_NO(174) | 0)
> +#define PINMUX_GPIO174__FUNC_B1_MSDC2_DAT3 (MTK_PIN_NO(174) | 1)
> +#define PINMUX_GPIO174__FUNC_I0_LVTS_SDI (MTK_PIN_NO(174) | 2)
> +
> +#define PINMUX_GPIO175__FUNC_B_GPIO175 (MTK_PIN_NO(175) | 0)
> +#define PINMUX_GPIO175__FUNC_B0_SPMI_M_SCL (MTK_PIN_NO(175) | 1)
> +
> +#define PINMUX_GPIO176__FUNC_B_GPIO176 (MTK_PIN_NO(176) | 0)
> +#define PINMUX_GPIO176__FUNC_B0_SPMI_M_SDA (MTK_PIN_NO(176) | 1)
> +
> +#endif /* __MEDIATEK_MT8188-PINFUNC_H */
> -- 
> 2.18.0
> 
> 
