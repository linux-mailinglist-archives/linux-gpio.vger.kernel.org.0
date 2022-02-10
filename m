Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4DEC14B0593
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Feb 2022 06:44:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234767AbiBJFoR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Feb 2022 00:44:17 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234653AbiBJFnL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Feb 2022 00:43:11 -0500
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9A2F10CC;
        Wed,  9 Feb 2022 21:42:36 -0800 (PST)
X-UUID: f690d5138a21418dae983758685925fe-20220210
X-UUID: f690d5138a21418dae983758685925fe-20220210
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
        (envelope-from <guodong.liu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
        with ESMTP id 602736012; Thu, 10 Feb 2022 13:42:32 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Feb 2022 13:42:31 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 10 Feb
 2022 13:42:30 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Feb 2022 13:42:29 +0800
Message-ID: <3dc3f603ffcf06ef9bbc58f0ec24eb676cbf7e01.camel@mediatek.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: mt8186: add pinctrl file
 and binding document
From:   Guodong Liu <guodong.liu@mediatek.com>
To:     Chen-Yu Tsai <wenst@chromium.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        Sean Wang <sean.wang@mediatek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date:   Thu, 10 Feb 2022 13:42:29 +0800
In-Reply-To: <CAGXv+5EDcRwgg5swe+D40+K608_1PyfprwXdPmSyd0VrTCVpXw@mail.gmail.com>
References: <20220121060120.10683-1-guodong.liu@mediatek.com>
         <20220121060120.10683-2-guodong.liu@mediatek.com>
         <CAGXv+5EDcRwgg5swe+D40+K608_1PyfprwXdPmSyd0VrTCVpXw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,MAY_BE_FORGED,
        SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR,UNPARSEABLE_RELAY,
        UPPERCASE_50_75 autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

-----Original Message-----
From: Chen-Yu Tsai <wenst@chromium.org>
To: Guodong Liu <guodong.liu@mediatek.com>, Linus Walleij <
linus.walleij@linaro.org>, Rob Herring <robh+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <
sean.wang@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
linux-arm-kernel@lists.infradead.org, 
linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: mt8186: add pinctrl
file and binding document
Date: Wed, 2 Feb 2022 23:44:00 +0800

Hi,

On Fri, Jan 21, 2022 at 2:09 PM Guodong Liu <guodong.liu@mediatek.com>
wrote:
> 
> 1. This patch adds pinctrl file for mt8186.
> 2. This patch adds mt8186 compatible node in binding document.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> ---
>  .../bindings/pinctrl/pinctrl-mt8186.yaml      |  303 +++++
>  include/dt-bindings/pinctrl/mt8186-pinfunc.h  | 1174
> +++++++++++++++++
>  2 files changed, 1477 insertions(+)
>  create mode 100644
> Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml
>  create mode 100644 include/dt-bindings/pinctrl/mt8186-pinfunc.h
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-
> mt8186.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-
> mt8186.yaml
> new file mode 100644
> index 000000000000..0a1154faca29
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml
> @@ -0,0 +1,303 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/pinctrl-mt8186.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT8186 Pin Controller
> +
> +maintainers:
> +  - Sean Wang <sean.wang@mediatek.com>
> +
> +description: |
> +  The Mediatek's Pin controller is used to control SoC pins.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8186-pinctrl
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    description: |
> +      Number of cells in GPIO specifier. Since the generic GPIO
> binding is used,
> +      the amount of cells must be specified as 2. See the below
> +      mentioned gpio binding representation for description of
> particular cells.
> +    const: 2
> +
> +  gpio-ranges:
> +    description: gpio valid number range.
> +    maxItems: 1
> +
> +  reg:
> +    description: |
> +      Physical address base for gpio base registers. There are 8
> GPIO
> +      physical address base in mt8186.
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
> +  mediatek,rsel_resistance_in_si_unit:
> +    type: boolean
> +    description: |
> +      Identifying i2c pins pull up/down type which is RSEL. It can
> support
> +      RSEL define or si unit value(ohm) to set different resistance.
> +
> +# PIN CONFIGURATION NODES
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    additionalProperties: false
> +    patternProperties:
> +      '^pins':
> +        type: object
> +        additionalProperties: false
> +        description: |
> +          A pinctrl node should contain at least one subnodes
> representing the
> +          pinctrl groups available on the machine. Each subnode will
> list the
> +          pins it needs, and how they should be configured, with
> regard to muxer
> +          configuration, pullups, drive strength, input
> enable/disable and
> +          input schmitt.
> +          An example of using macro:
> +          pincontroller {
> +            /* GPIO0 set as multifunction GPIO0 */
> +            gpio-pins {
> +              pins {
> +                pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
> +              }
> +            };
> +            /* GPIO128 set as multifunction SDA0 */
> +            i2c0-pins {
> +              pins {
> +                pinmux = <PINMUX_GPIO128__FUNC_SDA0>;
> +              }
> +            };
> +          };
> +        $ref: "pinmux-node.yaml"
> +
> +        properties:
> +          pinmux:
> +            description: |
> +              Integer array, represents gpio pin number and mux
> setting.
> +              Supported pin number and mux varies for different
> SoCs, and are
> +              defined as macros in dt-bindings/pinctrl/<soc>-
> pinfunc.h
> +              directly.
> +
> +          drive-strength:
> +            enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +
> +          mediatek,drive-strength-adv:
> +            description: |
> +              Describe the specific driving setup property.
> +              For I2C pins, the existing generic driving setup can
> only support
> +              2/4/6/8/10/12/14/16mA driving. But in specific driving
> setup, they
> +              can support 0.125/0.25/0.5/1mA adjustment. If we
> enable specific
> +              driving setup, the existing generic setup will be
> disabled.
> +              The specific driving setup is controlled by E1E0EN.
> +              When E1=0/E0=0, the strength is 0.125mA.
> +              When E1=0/E0=1, the strength is 0.25mA.
> +              When E1=1/E0=0, the strength is 0.5mA.
> +              When E1=1/E0=1, the strength is 1mA.
> +              EN is used to enable or disable the specific driving
> setup.
> +              Valid arguments are described as below:
> +              0: (E1, E0, EN) = (0, 0, 0)
> +              1: (E1, E0, EN) = (0, 0, 1)
> +              2: (E1, E0, EN) = (0, 1, 0)
> +              3: (E1, E0, EN) = (0, 1, 1)
> +              4: (E1, E0, EN) = (1, 0, 0)
> +              5: (E1, E0, EN) = (1, 0, 1)
> +              6: (E1, E0, EN) = (1, 1, 0)
> +              7: (E1, E0, EN) = (1, 1, 1)
> +              So the valid arguments are from 0 to 7.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1, 2, 3, 4, 5, 6, 7]

I have some thoughts about moving this to the "drive-strength-
microamps"
pin config property, but I've not yet fully thought out how it's
supposed
to be combined with "drive-strength".

My original design was to have the presence of "drive-strength-
microamps"
also signal the use of the extra driving setup, but that might be dual-
purposing the property. Also, having

    drive-strength-microamps = <1000>;

instead of

    drive-strength = <1>;

might be a bit odd.

I would rather not block this and the MT8195 drive-strength-adv patch.


Hello ChenYu

Yes, this is based on the MT8195 pinctrl driver, 
this processing method is more convenient for driver maintenance, and
the compatibility of drivers will be better.

Thanks
Guodong


> +          bias-pull-down:
> +            description: |
> +              For pull down type is normal, it don't need add RSEL &
> R1R0 define
> +              and resistance value.
> +              For pull down type is PUPD/R0/R1 type, it can add R1R0
> define to
> +              set different resistance. It can support
> "MTK_PUPD_SET_R1R0_00" &
> +              "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" &
> +              "MTK_PUPD_SET_R1R0_11" define in mt8186.
> +              For pull down type is RSEL, it can add RSEL define &
> resistance
> +              value(ohm) to set different resistance by identifying
> property
> +              "mediatek,rsel_resistance_in_si_unit".
> +              It can support "MTK_PULL_SET_RSEL_000" &
> "MTK_PULL_SET_RSEL_001"
> +              & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011"
> +              & "MTK_PULL_SET_RSEL_100" & "MTK_PULL_SET_RSEL_101"
> +              & "MTK_PULL_SET_RSEL_110" & "MTK_PULL_SET_RSEL_111"
> +              define in mt8186. It can also support resistance
> value(ohm)
> +              "75000" & "5000" in mt8186.
> +              oneOf:
> +                - enum: [100, 101, 102, 103]
> +                - description: mt8186 pull down PUPD/R0/R1 type
> define value.
> +                - enum: [200, 201, 202, 203, 204, 205, 206, 207]
> +                - description: mt8186 pull down RSEL type define
> value.
> +                - enum: [75000, 5000]
> +                - description: mt8186 pull down RSEL type si unit
> value(ohm).

As far as I can tell, this is based on the MT8195 binding, which
unfortunately
has these DT constraints indented incorrectly, making them ineffective.

Please see the fix for the MT8195 I just sent:


https://lore.kernel.org/linux-gpio/20220202153528.707185-1-wenst@chromium.org/


ChenYu

Hello ChenYu

I will update it for next version.

Thanks
Guodong

> +
> +              An example of using RSEL define:
> +              pincontroller {
> +                i2c0_pin {
> +                  pins {
> +                    pinmux = <PINMUX_GPIO128__FUNC_SDA0>;
> +                    bias-pull-down = <MTK_PULL_SET_RSEL_001>;
> +                  }
> +                };
> +              };
> +              An example of using si unit resistance value(ohm):
> +              &pio {
> +                mediatek,rsel_resistance_in_si_unit;
> +              }
> +              pincontroller {
> +                i2c0_pin {
> +                  pins {
> +                    pinmux = <PINMUX_GPIO128__FUNC_SDA0>;
> +                    bias-pull-down = <75000>;
> +                  }
> +                };
> +              };
> +
> +          bias-pull-up:
> +            description: |
> +              For pull up type is normal, it don't need add RSEL &
> R1R0 define
> +              and resistance value.
> +              For pull up type is PUPD/R0/R1 type, it can add R1R0
> define to
> +              set different resistance. It can support
> "MTK_PUPD_SET_R1R0_00" &
> +              "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" &
> +              "MTK_PUPD_SET_R1R0_11" define in mt8186.
> +              For pull up type is RSEL, it can add RSEL define &
> resistance
> +              value(ohm) to set different resistance by identifying
> property
> +              "mediatek,rsel_resistance_in_si_unit".
> +              It can support "MTK_PULL_SET_RSEL_000" &
> "MTK_PULL_SET_RSEL_001"
> +              & "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011"
> +              & "MTK_PULL_SET_RSEL_100" & "MTK_PULL_SET_RSEL_101"
> +              & "MTK_PULL_SET_RSEL_110" & "MTK_PULL_SET_RSEL_111"
> +              define in mt8186. It can also support resistance
> value(ohm)
> +              "1000" & "1500" & "2000" & "3000" & "4000" & "5000" &
> "10000" &
> +              "75000" in mt8186.
> +              oneOf:
> +                - enum: [100, 101, 102, 103]
> +                - description: mt8186 pull up PUPD/R0/R1 type define
> value.
> +                - enum: [200, 201, 202, 203, 204, 205, 206, 207]
> +                - description: mt8186 pull up RSEL type define
> value.
> +                - enum: [1000, 1500, 2000, 3000, 4000, 5000, 10000,
> 75000]
> +                - description: mt8186 pull up RSEL type si unit
> value(ohm).
> +              An example of using RSEL define:
> +              pincontroller {
> +                i2c0-pins {
> +                  pins {
> +                    pinmux = <PINMUX_GPIO128__FUNC_SDA0>;
> +                    bias-pull-up = <MTK_PULL_SET_RSEL_001>;
> +                  }
> +                };
> +              };
> +              An example of using si unit resistance value(ohm):
> +              &pio {
> +                mediatek,rsel_resistance_in_si_unit;
> +              }
> +              pincontroller {
> +                i2c0-pins {
> +                  pins {
> +                    pinmux = <PINMUX_GPIO128__FUNC_SDA0>;
> +                    bias-pull-up = <1000>;
> +                  }
> +                };
> +              };
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
> +    #include <dt-bindings/pinctrl/mt8186-pinfunc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    pio: pinctrl@10005000 {
> +      compatible = "mediatek,mt8186-pinctrl";
> +      reg = <0x10005000 0x1000>,
> +            <0x10002000 0x0200>,
> +            <0x10002200 0x0200>,
> +            <0x10002400 0x0200>,
> +            <0x10002600 0x0200>,
> +            <0x10002A00 0x0200>,
> +            <0x10002c00 0x0200>,
> +            <0x1000b000 0x1000>;
> +      reg-names = "iocfg0", "iocfg_bm", "iocfg_bl",
> +                  "iocfg_br", "iocfg_lm", "iocfg_rb",
> +                  "iocfg_tl", "eint";
> +      gpio-controller;
> +      #gpio-cells = <2>;
> +      gpio-ranges = <&pio 0 0 185>;
> +      interrupt-controller;
> +      interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH 0>;
> +      #interrupt-cells = <2>;
> +
> +      pio-pins {
> +        pins {
> +          pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
> +          output-low;
> +        };
> +      };
> +
> +      spi0-pins {
> +        pins-spi {
> +          pinmux = <PINMUX_GPIO0__FUNC_SPI0_CLK_B>,
> +                   <PINMUX_GPIO1__FUNC_SPI0_CSB_B>,
> +                   <PINMUX_GPIO2__FUNC_SPI0_MO_B>;
> +          bias-disable;
> +        };
> +        pins-spi-mi {
> +          pinmux = <PINMUX_GPIO3__FUNC_SPI0_MI_B>;
> +          bias-pull-down;
> +        };
> +      };
> +
> +      i2c0-pins {
> +        pins {
> +          pinmux = <PINMUX_GPIO127__FUNC_SCL0>,
> +                   <PINMUX_GPIO128__FUNC_SDA0>;
> +          bias-disable;
> +          mediatek,drive-strength-adv = <7>;
> +        };
> +      };
> +    };
> diff --git a/include/dt-bindings/pinctrl/mt8186-pinfunc.h
> b/include/dt-bindings/pinctrl/mt8186-pinfunc.h
> new file mode 100644
> index 000000000000..f58983d11bca
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/mt8186-pinfunc.h
> @@ -0,0 +1,1174 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2021 MediaTek Inc.
> + * Author: Guodong Liu <Guodong.Liu@mediatek.com>
> + *
> + */
> +
> +#ifndef __MT8168_PINFUNC_H
> +#define __MT8168_PINFUNC_H
> +
> +#include "mt65xx.h"
> +
> +#define PINMUX_GPIO0__FUNC_GPIO0 (MTK_PIN_NO(0) | 0)
> +#define PINMUX_GPIO0__FUNC_I2S0_MCK (MTK_PIN_NO(0) | 1)
> +#define PINMUX_GPIO0__FUNC_SPI0_CLK_B (MTK_PIN_NO(0) | 2)
> +#define PINMUX_GPIO0__FUNC_I2S2_MCK (MTK_PIN_NO(0) | 3)
> +#define PINMUX_GPIO0__FUNC_CMFLASH0 (MTK_PIN_NO(0) | 4)
> +#define PINMUX_GPIO0__FUNC_SCP_SPI0_CK (MTK_PIN_NO(0) | 5)
> +#define PINMUX_GPIO0__FUNC_TP_GPIO0_AO (MTK_PIN_NO(0) | 6)
> +#define PINMUX_GPIO0__FUNC_DBG_MON_A0 (MTK_PIN_NO(0) | 7)
> +
> +#define PINMUX_GPIO1__FUNC_GPIO1 (MTK_PIN_NO(1) | 0)
> +#define PINMUX_GPIO1__FUNC_I2S0_BCK (MTK_PIN_NO(1) | 1)
> +#define PINMUX_GPIO1__FUNC_SPI0_CSB_B (MTK_PIN_NO(1) | 2)
> +#define PINMUX_GPIO1__FUNC_I2S2_BCK (MTK_PIN_NO(1) | 3)
> +#define PINMUX_GPIO1__FUNC_CMFLASH1 (MTK_PIN_NO(1) | 4)
> +#define PINMUX_GPIO1__FUNC_SCP_SPI0_CS (MTK_PIN_NO(1) | 5)
> +#define PINMUX_GPIO1__FUNC_TP_GPIO1_AO (MTK_PIN_NO(1) | 6)
> +
> +#define PINMUX_GPIO2__FUNC_GPIO2 (MTK_PIN_NO(2) | 0)
> +#define PINMUX_GPIO2__FUNC_I2S0_LRCK (MTK_PIN_NO(2) | 1)
> +#define PINMUX_GPIO2__FUNC_SPI0_MO_B (MTK_PIN_NO(2) | 2)
> +#define PINMUX_GPIO2__FUNC_I2S2_LRCK (MTK_PIN_NO(2) | 3)
> +#define PINMUX_GPIO2__FUNC_CMFLASH2 (MTK_PIN_NO(2) | 4)
> +#define PINMUX_GPIO2__FUNC_SCP_SPI0_MO (MTK_PIN_NO(2) | 5)
> +#define PINMUX_GPIO2__FUNC_TP_GPIO2_AO (MTK_PIN_NO(2) | 6)
> +
> +#define PINMUX_GPIO3__FUNC_GPIO3 (MTK_PIN_NO(3) | 0)
> +#define PINMUX_GPIO3__FUNC_I2S0_DI (MTK_PIN_NO(3) | 1)
> +#define PINMUX_GPIO3__FUNC_SPI0_MI_B (MTK_PIN_NO(3) | 2)
> +#define PINMUX_GPIO3__FUNC_I2S2_DI (MTK_PIN_NO(3) | 3)
> +#define PINMUX_GPIO3__FUNC_SRCLKENAI1 (MTK_PIN_NO(3) | 4)
> +#define PINMUX_GPIO3__FUNC_SCP_SPI0_MI (MTK_PIN_NO(3) | 5)
> +#define PINMUX_GPIO3__FUNC_TP_GPIO3_AO (MTK_PIN_NO(3) | 6)
> +
> +#define PINMUX_GPIO4__FUNC_GPIO4 (MTK_PIN_NO(4) | 0)
> +#define PINMUX_GPIO4__FUNC_I2S3_DO (MTK_PIN_NO(4) | 1)
> +#define PINMUX_GPIO4__FUNC_I2S1_DO (MTK_PIN_NO(4) | 3)
> +#define PINMUX_GPIO4__FUNC_TP_GPIO4_AO (MTK_PIN_NO(4) | 6)
> +
> +#define PINMUX_GPIO5__FUNC_GPIO5 (MTK_PIN_NO(5) | 0)
> +#define PINMUX_GPIO5__FUNC_EXT_FRAME_SYNC (MTK_PIN_NO(5) | 1)
> +#define PINMUX_GPIO5__FUNC_TP_GPIO5_AO (MTK_PIN_NO(5) | 6)
> +
> +#define PINMUX_GPIO6__FUNC_GPIO6 (MTK_PIN_NO(6) | 0)
> +#define PINMUX_GPIO6__FUNC_I2S3_MCK (MTK_PIN_NO(6) | 1)
> +#define PINMUX_GPIO6__FUNC_SPI1_CLK_B (MTK_PIN_NO(6) | 2)
> +#define PINMUX_GPIO6__FUNC_I2S1_MCK (MTK_PIN_NO(6) | 3)
> +#define PINMUX_GPIO6__FUNC_DPI_DATA22 (MTK_PIN_NO(6) | 4)
> +#define PINMUX_GPIO6__FUNC_TP_GPIO6_AO (MTK_PIN_NO(6) | 6)
> +
> +#define PINMUX_GPIO7__FUNC_GPIO7 (MTK_PIN_NO(7) | 0)
> +#define PINMUX_GPIO7__FUNC_I2S3_BCK (MTK_PIN_NO(7) | 1)
> +#define PINMUX_GPIO7__FUNC_SPI1_CSB_B (MTK_PIN_NO(7) | 2)
> +#define PINMUX_GPIO7__FUNC_I2S1_BCK (MTK_PIN_NO(7) | 3)
> +#define PINMUX_GPIO7__FUNC_DPI_DATA23 (MTK_PIN_NO(7) | 4)
> +#define PINMUX_GPIO7__FUNC_TP_GPIO7_AO (MTK_PIN_NO(7) | 6)
> +
> +#define PINMUX_GPIO8__FUNC_GPIO8 (MTK_PIN_NO(8) | 0)
> +#define PINMUX_GPIO8__FUNC_I2S3_LRCK (MTK_PIN_NO(8) | 1)
> +#define PINMUX_GPIO8__FUNC_SPI1_MO_B (MTK_PIN_NO(8) | 2)
> +#define PINMUX_GPIO8__FUNC_I2S1_LRCK (MTK_PIN_NO(8) | 3)
> +#define PINMUX_GPIO8__FUNC_CONN_UART0_RXD (MTK_PIN_NO(8) | 4)
> +#define PINMUX_GPIO8__FUNC_SSPM_URXD_AO (MTK_PIN_NO(8) | 5)
> +#define PINMUX_GPIO8__FUNC_ADSP_UART_RX (MTK_PIN_NO(8) | 6)
> +#define PINMUX_GPIO8__FUNC_CONN_MCU_DBGACK_N (MTK_PIN_NO(8) | 7)
> +
> +#define PINMUX_GPIO9__FUNC_GPIO9 (MTK_PIN_NO(9) | 0)
> +#define PINMUX_GPIO9__FUNC_I2S3_DO (MTK_PIN_NO(9) | 1)
> +#define PINMUX_GPIO9__FUNC_SPI1_MI_B (MTK_PIN_NO(9) | 2)
> +#define PINMUX_GPIO9__FUNC_I2S1_DO (MTK_PIN_NO(9) | 3)
> +#define PINMUX_GPIO9__FUNC_CONN_UART0_TXD (MTK_PIN_NO(9) | 4)
> +#define PINMUX_GPIO9__FUNC_SSPM_UTXD_AO (MTK_PIN_NO(9) | 5)
> +#define PINMUX_GPIO9__FUNC_ADSP_UART_TX (MTK_PIN_NO(9) | 6)
> +#define PINMUX_GPIO9__FUNC_CONN_MCU_DBGI_N (MTK_PIN_NO(9) | 7)
> +
> +#define PINMUX_GPIO10__FUNC_GPIO10 (MTK_PIN_NO(10) | 0)
> +#define PINMUX_GPIO10__FUNC_I2S0_MCK (MTK_PIN_NO(10) | 1)
> +#define PINMUX_GPIO10__FUNC_SPI4_CLK_A (MTK_PIN_NO(10) | 2)
> +#define PINMUX_GPIO10__FUNC_I2S2_MCK (MTK_PIN_NO(10) | 3)
> +#define PINMUX_GPIO10__FUNC_SPM_JTAG_TDI (MTK_PIN_NO(10) | 4)
> +#define PINMUX_GPIO10__FUNC_SCP_JTAG_TDI (MTK_PIN_NO(10) | 5)
> +#define PINMUX_GPIO10__FUNC_ADSP_JTAG_TDI (MTK_PIN_NO(10) | 6)
> +#define PINMUX_GPIO10__FUNC_CONN_MCU_TDI (MTK_PIN_NO(10) | 7)
> +
> +#define PINMUX_GPIO11__FUNC_GPIO11 (MTK_PIN_NO(11) | 0)
> +#define PINMUX_GPIO11__FUNC_I2S0_BCK (MTK_PIN_NO(11) | 1)
> +#define PINMUX_GPIO11__FUNC_SPI4_CSB_A (MTK_PIN_NO(11) | 2)
> +#define PINMUX_GPIO11__FUNC_I2S2_BCK (MTK_PIN_NO(11) | 3)
> +#define PINMUX_GPIO11__FUNC_SPM_JTAG_TRSTN (MTK_PIN_NO(11) | 4)
> +#define PINMUX_GPIO11__FUNC_SCP_JTAG_TRSTN (MTK_PIN_NO(11) | 5)
> +#define PINMUX_GPIO11__FUNC_ADSP_JTAG_TRSTN (MTK_PIN_NO(11) | 6)
> +#define PINMUX_GPIO11__FUNC_CONN_MCU_TRST_B (MTK_PIN_NO(11) | 7)
> +
> +#define PINMUX_GPIO12__FUNC_GPIO12 (MTK_PIN_NO(12) | 0)
> +#define PINMUX_GPIO12__FUNC_I2S0_LRCK (MTK_PIN_NO(12) | 1)
> +#define PINMUX_GPIO12__FUNC_SPI4_MO_A (MTK_PIN_NO(12) | 2)
> +#define PINMUX_GPIO12__FUNC_I2S2_LRCK (MTK_PIN_NO(12) | 3)
> +#define PINMUX_GPIO12__FUNC_SPM_JTAG_TCK (MTK_PIN_NO(12) | 4)
> +#define PINMUX_GPIO12__FUNC_SCP_JTAG_TCK (MTK_PIN_NO(12) | 5)
> +#define PINMUX_GPIO12__FUNC_ADSP_JTAG_TCK (MTK_PIN_NO(12) | 6)
> +#define PINMUX_GPIO12__FUNC_CONN_MCU_TCK (MTK_PIN_NO(12) | 7)
> +
> +#define PINMUX_GPIO13__FUNC_GPIO13 (MTK_PIN_NO(13) | 0)
> +#define PINMUX_GPIO13__FUNC_I2S0_DI (MTK_PIN_NO(13) | 1)
> +#define PINMUX_GPIO13__FUNC_SPI4_MI_A (MTK_PIN_NO(13) | 2)
> +#define PINMUX_GPIO13__FUNC_I2S2_DI (MTK_PIN_NO(13) | 3)
> +#define PINMUX_GPIO13__FUNC_SPM_JTAG_TDO (MTK_PIN_NO(13) | 4)
> +#define PINMUX_GPIO13__FUNC_SCP_JTAG_TDO (MTK_PIN_NO(13) | 5)
> +#define PINMUX_GPIO13__FUNC_ADSP_JTAG_TDO (MTK_PIN_NO(13) | 6)
> +#define PINMUX_GPIO13__FUNC_CONN_MCU_TDO (MTK_PIN_NO(13) | 7)
> +
> +#define PINMUX_GPIO14__FUNC_GPIO14 (MTK_PIN_NO(14) | 0)
> +#define PINMUX_GPIO14__FUNC_CLKM0 (MTK_PIN_NO(14) | 3)
> +#define PINMUX_GPIO14__FUNC_SPM_JTAG_TMS (MTK_PIN_NO(14) | 4)
> +#define PINMUX_GPIO14__FUNC_SCP_JTAG_TMS (MTK_PIN_NO(14) | 5)
> +#define PINMUX_GPIO14__FUNC_ADSP_JTAG_TMS (MTK_PIN_NO(14) | 6)
> +#define PINMUX_GPIO14__FUNC_CONN_MCU_TMS (MTK_PIN_NO(14) | 7)
> +
> +#define PINMUX_GPIO15__FUNC_GPIO15 (MTK_PIN_NO(15) | 0)
> +#define PINMUX_GPIO15__FUNC_EXT_FRAME_SYNC (MTK_PIN_NO(15) | 1)
> +#define PINMUX_GPIO15__FUNC_SRCLKENAI1 (MTK_PIN_NO(15) | 2)
> +#define PINMUX_GPIO15__FUNC_CLKM1 (MTK_PIN_NO(15) | 3)
> +#define PINMUX_GPIO15__FUNC_PWM0 (MTK_PIN_NO(15) | 4)
> +
> +#define PINMUX_GPIO16__FUNC_GPIO16 (MTK_PIN_NO(16) | 0)
> +#define PINMUX_GPIO16__FUNC_CONN_WIFI_TXD (MTK_PIN_NO(16) | 1)
> +#define PINMUX_GPIO16__FUNC_SRCLKENAI0 (MTK_PIN_NO(16) | 2)
> +#define PINMUX_GPIO16__FUNC_CLKM2 (MTK_PIN_NO(16) | 3)
> +#define PINMUX_GPIO16__FUNC_PWM1 (MTK_PIN_NO(16) | 4)
> +
> +#define PINMUX_GPIO17__FUNC_GPIO17 (MTK_PIN_NO(17) | 0)
> +#define PINMUX_GPIO17__FUNC_CLKM3 (MTK_PIN_NO(17) | 3)
> +#define PINMUX_GPIO17__FUNC_PWM2 (MTK_PIN_NO(17) | 4)
> +#define PINMUX_GPIO17__FUNC_DBG_MON_A32 (MTK_PIN_NO(17) | 7)
> +
> +#define PINMUX_GPIO18__FUNC_GPIO18 (MTK_PIN_NO(18) | 0)
> +#define PINMUX_GPIO18__FUNC_CMVREF0 (MTK_PIN_NO(18) | 2)
> +#define PINMUX_GPIO18__FUNC_SPI2_CLK_B (MTK_PIN_NO(18) | 6)
> +#define PINMUX_GPIO18__FUNC_DBG_MON_A26 (MTK_PIN_NO(18) | 7)
> +
> +#define PINMUX_GPIO19__FUNC_GPIO19 (MTK_PIN_NO(19) | 0)
> +#define PINMUX_GPIO19__FUNC_CMVREF1 (MTK_PIN_NO(19) | 2)
> +#define PINMUX_GPIO19__FUNC_ANT_SEL3 (MTK_PIN_NO(19) | 5)
> +#define PINMUX_GPIO19__FUNC_SPI2_CSB_B (MTK_PIN_NO(19) | 6)
> +#define PINMUX_GPIO19__FUNC_DBG_MON_A2 (MTK_PIN_NO(19) | 7)
> +
> +#define PINMUX_GPIO20__FUNC_GPIO20 (MTK_PIN_NO(20) | 0)
> +#define PINMUX_GPIO20__FUNC_CMVREF2 (MTK_PIN_NO(20) | 2)
> +#define PINMUX_GPIO20__FUNC_ANT_SEL4 (MTK_PIN_NO(20) | 5)
> +#define PINMUX_GPIO20__FUNC_SPI2_MO_B (MTK_PIN_NO(20) | 6)
> +#define PINMUX_GPIO20__FUNC_DBG_MON_A3 (MTK_PIN_NO(20) | 7)
> +
> +#define PINMUX_GPIO21__FUNC_GPIO21 (MTK_PIN_NO(21) | 0)
> +#define PINMUX_GPIO21__FUNC_I2S0_MCK (MTK_PIN_NO(21) | 1)
> +#define PINMUX_GPIO21__FUNC_I2S1_MCK (MTK_PIN_NO(21) | 2)
> +#define PINMUX_GPIO21__FUNC_I2S3_MCK (MTK_PIN_NO(21) | 3)
> +#define PINMUX_GPIO21__FUNC_ANT_SEL5 (MTK_PIN_NO(21) | 5)
> +#define PINMUX_GPIO21__FUNC_SPI2_MI_B (MTK_PIN_NO(21) | 6)
> +#define PINMUX_GPIO21__FUNC_DBG_MON_A4 (MTK_PIN_NO(21) | 7)
> +
> +#define PINMUX_GPIO22__FUNC_GPIO22 (MTK_PIN_NO(22) | 0)
> +#define PINMUX_GPIO22__FUNC_I2S0_BCK (MTK_PIN_NO(22) | 1)
> +#define PINMUX_GPIO22__FUNC_I2S1_BCK (MTK_PIN_NO(22) | 2)
> +#define PINMUX_GPIO22__FUNC_I2S3_BCK (MTK_PIN_NO(22) | 3)
> +#define PINMUX_GPIO22__FUNC_TDM_RX_LRCK (MTK_PIN_NO(22) | 4)
> +#define PINMUX_GPIO22__FUNC_ANT_SEL6 (MTK_PIN_NO(22) | 5)
> +#define PINMUX_GPIO22__FUNC_DBG_MON_A5 (MTK_PIN_NO(22) | 7)
> +
> +#define PINMUX_GPIO23__FUNC_GPIO23 (MTK_PIN_NO(23) | 0)
> +#define PINMUX_GPIO23__FUNC_I2S0_LRCK (MTK_PIN_NO(23) | 1)
> +#define PINMUX_GPIO23__FUNC_I2S1_LRCK (MTK_PIN_NO(23) | 2)
> +#define PINMUX_GPIO23__FUNC_I2S3_LRCK (MTK_PIN_NO(23) | 3)
> +#define PINMUX_GPIO23__FUNC_TDM_RX_BCK (MTK_PIN_NO(23) | 4)
> +#define PINMUX_GPIO23__FUNC_ANT_SEL7 (MTK_PIN_NO(23) | 5)
> +#define PINMUX_GPIO23__FUNC_DBG_MON_A6 (MTK_PIN_NO(23) | 7)
> +
> +#define PINMUX_GPIO24__FUNC_GPIO24 (MTK_PIN_NO(24) | 0)
> +#define PINMUX_GPIO24__FUNC_I2S0_DI (MTK_PIN_NO(24) | 1)
> +#define PINMUX_GPIO24__FUNC_I2S1_DO (MTK_PIN_NO(24) | 2)
> +#define PINMUX_GPIO24__FUNC_I2S3_DO (MTK_PIN_NO(24) | 3)
> +#define PINMUX_GPIO24__FUNC_TDM_RX_MCK (MTK_PIN_NO(24) | 4)
> +#define PINMUX_GPIO24__FUNC_DBG_MON_A7 (MTK_PIN_NO(24) | 7)
> +
> +#define PINMUX_GPIO25__FUNC_GPIO25 (MTK_PIN_NO(25) | 0)
> +#define PINMUX_GPIO25__FUNC_I2S2_MCK (MTK_PIN_NO(25) | 1)
> +#define PINMUX_GPIO25__FUNC_PCM_CLK (MTK_PIN_NO(25) | 2)
> +#define PINMUX_GPIO25__FUNC_SPI4_CLK_B (MTK_PIN_NO(25) | 3)
> +#define PINMUX_GPIO25__FUNC_TDM_RX_DATA0 (MTK_PIN_NO(25) | 4)
> +#define PINMUX_GPIO25__FUNC_DBG_MON_A8 (MTK_PIN_NO(25) | 7)
> +
> +#define PINMUX_GPIO26__FUNC_GPIO26 (MTK_PIN_NO(26) | 0)
> +#define PINMUX_GPIO26__FUNC_I2S2_BCK (MTK_PIN_NO(26) | 1)
> +#define PINMUX_GPIO26__FUNC_PCM_SYNC (MTK_PIN_NO(26) | 2)
> +#define PINMUX_GPIO26__FUNC_SPI4_CSB_B (MTK_PIN_NO(26) | 3)
> +#define PINMUX_GPIO26__FUNC_TDM_RX_DATA1 (MTK_PIN_NO(26) | 4)
> +#define PINMUX_GPIO26__FUNC_DBG_MON_A9 (MTK_PIN_NO(26) | 7)
> +
> +#define PINMUX_GPIO27__FUNC_GPIO27 (MTK_PIN_NO(27) | 0)
> +#define PINMUX_GPIO27__FUNC_I2S2_LRCK (MTK_PIN_NO(27) | 1)
> +#define PINMUX_GPIO27__FUNC_PCM_DI (MTK_PIN_NO(27) | 2)
> +#define PINMUX_GPIO27__FUNC_SPI4_MO_B (MTK_PIN_NO(27) | 3)
> +#define PINMUX_GPIO27__FUNC_TDM_RX_DATA2 (MTK_PIN_NO(27) | 4)
> +#define PINMUX_GPIO27__FUNC_DBG_MON_A10 (MTK_PIN_NO(27) | 7)
> +
> +#define PINMUX_GPIO28__FUNC_GPIO28 (MTK_PIN_NO(28) | 0)
> +#define PINMUX_GPIO28__FUNC_I2S2_DI (MTK_PIN_NO(28) | 1)
> +#define PINMUX_GPIO28__FUNC_PCM_DO (MTK_PIN_NO(28) | 2)
> +#define PINMUX_GPIO28__FUNC_SPI4_MI_B (MTK_PIN_NO(28) | 3)
> +#define PINMUX_GPIO28__FUNC_TDM_RX_DATA3 (MTK_PIN_NO(28) | 4)
> +
> +#define PINMUX_GPIO29__FUNC_GPIO29 (MTK_PIN_NO(29) | 0)
> +#define PINMUX_GPIO29__FUNC_ANT_SEL0 (MTK_PIN_NO(29) | 1)
> +#define PINMUX_GPIO29__FUNC_GPS_L1_ELNA_EN (MTK_PIN_NO(29) | 2)
> +
> +#define PINMUX_GPIO30__FUNC_GPIO30 (MTK_PIN_NO(30) | 0)
> +#define PINMUX_GPIO30__FUNC_ANT_SEL1 (MTK_PIN_NO(30) | 1)
> +
> +#define PINMUX_GPIO31__FUNC_GPIO31 (MTK_PIN_NO(31) | 0)
> +#define PINMUX_GPIO31__FUNC_ANT_SEL2 (MTK_PIN_NO(31) | 1)
> +#define PINMUX_GPIO31__FUNC_EXT_FRAME_SYNC (MTK_PIN_NO(31) | 2)
> +#define PINMUX_GPIO31__FUNC_SRCLKENAI1 (MTK_PIN_NO(31) | 3)
> +
> +#define PINMUX_GPIO32__FUNC_GPIO32 (MTK_PIN_NO(32) | 0)
> +#define PINMUX_GPIO32__FUNC_URXD0 (MTK_PIN_NO(32) | 1)
> +#define PINMUX_GPIO32__FUNC_UTXD0 (MTK_PIN_NO(32) | 2)
> +#define PINMUX_GPIO32__FUNC_ADSP_UART_RX (MTK_PIN_NO(32) | 3)
> +#define PINMUX_GPIO32__FUNC_TP_URXD1_AO (MTK_PIN_NO(32) | 4)
> +
> +#define PINMUX_GPIO33__FUNC_GPIO33 (MTK_PIN_NO(33) | 0)
> +#define PINMUX_GPIO33__FUNC_UTXD0 (MTK_PIN_NO(33) | 1)
> +#define PINMUX_GPIO33__FUNC_URXD0 (MTK_PIN_NO(33) | 2)
> +#define PINMUX_GPIO33__FUNC_ADSP_UART_TX (MTK_PIN_NO(33) | 3)
> +#define PINMUX_GPIO33__FUNC_TP_UTXD1_AO (MTK_PIN_NO(33) | 4)
> +
> +#define PINMUX_GPIO34__FUNC_GPIO34 (MTK_PIN_NO(34) | 0)
> +#define PINMUX_GPIO34__FUNC_URXD1 (MTK_PIN_NO(34) | 1)
> +#define PINMUX_GPIO34__FUNC_TP_URXD2_AO (MTK_PIN_NO(34) | 2)
> +#define PINMUX_GPIO34__FUNC_SSPM_URXD_AO (MTK_PIN_NO(34) | 3)
> +#define PINMUX_GPIO34__FUNC_ADSP_UART_RX (MTK_PIN_NO(34) | 4)
> +#define PINMUX_GPIO34__FUNC_CONN_UART0_RXD (MTK_PIN_NO(34) | 5)
> +
> +#define PINMUX_GPIO35__FUNC_GPIO35 (MTK_PIN_NO(35) | 0)
> +#define PINMUX_GPIO35__FUNC_UTXD1 (MTK_PIN_NO(35) | 1)
> +#define PINMUX_GPIO35__FUNC_TP_UTXD2_AO (MTK_PIN_NO(35) | 2)
> +#define PINMUX_GPIO35__FUNC_SSPM_UTXD_AO (MTK_PIN_NO(35) | 3)
> +#define PINMUX_GPIO35__FUNC_ADSP_UART_TX (MTK_PIN_NO(35) | 4)
> +#define PINMUX_GPIO35__FUNC_CONN_UART0_TXD (MTK_PIN_NO(35) | 5)
> +#define PINMUX_GPIO35__FUNC_CONN_WIFI_TXD (MTK_PIN_NO(35) | 6)
> +
> +#define PINMUX_GPIO36__FUNC_GPIO36 (MTK_PIN_NO(36) | 0)
> +#define PINMUX_GPIO36__FUNC_SPI0_CLK_A (MTK_PIN_NO(36) | 1)
> +#define PINMUX_GPIO36__FUNC_CLKM0 (MTK_PIN_NO(36) | 2)
> +#define PINMUX_GPIO36__FUNC_SCP_SPI0_CK (MTK_PIN_NO(36) | 4)
> +#define PINMUX_GPIO36__FUNC_SPINOR_CK (MTK_PIN_NO(36) | 5)
> +#define PINMUX_GPIO36__FUNC_DBG_MON_A11 (MTK_PIN_NO(36) | 7)
> +
> +#define PINMUX_GPIO37__FUNC_GPIO37 (MTK_PIN_NO(37) | 0)
> +#define PINMUX_GPIO37__FUNC_SPI0_CSB_A (MTK_PIN_NO(37) | 1)
> +#define PINMUX_GPIO37__FUNC_CLKM1 (MTK_PIN_NO(37) | 2)
> +#define PINMUX_GPIO37__FUNC_PWM0 (MTK_PIN_NO(37) | 3)
> +#define PINMUX_GPIO37__FUNC_SCP_SPI0_CS (MTK_PIN_NO(37) | 4)
> +#define PINMUX_GPIO37__FUNC_SPINOR_CS (MTK_PIN_NO(37) | 5)
> +#define PINMUX_GPIO37__FUNC_DBG_MON_A12 (MTK_PIN_NO(37) | 7)
> +
> +#define PINMUX_GPIO38__FUNC_GPIO38 (MTK_PIN_NO(38) | 0)
> +#define PINMUX_GPIO38__FUNC_SPI0_MO_A (MTK_PIN_NO(38) | 1)
> +#define PINMUX_GPIO38__FUNC_CLKM2 (MTK_PIN_NO(38) | 2)
> +#define PINMUX_GPIO38__FUNC_PWM1 (MTK_PIN_NO(38) | 3)
> +#define PINMUX_GPIO38__FUNC_SCP_SPI0_MO (MTK_PIN_NO(38) | 4)
> +#define PINMUX_GPIO38__FUNC_SPINOR_IO0 (MTK_PIN_NO(38) | 5)
> +#define PINMUX_GPIO38__FUNC_DBG_MON_A13 (MTK_PIN_NO(38) | 7)
> +
> +#define PINMUX_GPIO39__FUNC_GPIO39 (MTK_PIN_NO(39) | 0)
> +#define PINMUX_GPIO39__FUNC_SPI0_MI_A (MTK_PIN_NO(39) | 1)
> +#define PINMUX_GPIO39__FUNC_CLKM3 (MTK_PIN_NO(39) | 2)
> +#define PINMUX_GPIO39__FUNC_PWM2 (MTK_PIN_NO(39) | 3)
> +#define PINMUX_GPIO39__FUNC_SCP_SPI0_MI (MTK_PIN_NO(39) | 4)
> +#define PINMUX_GPIO39__FUNC_SPINOR_IO1 (MTK_PIN_NO(39) | 5)
> +#define PINMUX_GPIO39__FUNC_DBG_MON_A14 (MTK_PIN_NO(39) | 7)
> +
> +#define PINMUX_GPIO40__FUNC_GPIO40 (MTK_PIN_NO(40) | 0)
> +#define PINMUX_GPIO40__FUNC_SPI1_CLK_A (MTK_PIN_NO(40) | 1)
> +#define PINMUX_GPIO40__FUNC_SCP_SPI1_CK (MTK_PIN_NO(40) | 2)
> +#define PINMUX_GPIO40__FUNC_UCTS0 (MTK_PIN_NO(40) | 4)
> +#define PINMUX_GPIO40__FUNC_SPINOR_IO2 (MTK_PIN_NO(40) | 5)
> +#define PINMUX_GPIO40__FUNC_TP_UCTS1_AO (MTK_PIN_NO(40) | 6)
> +#define PINMUX_GPIO40__FUNC_DBG_MON_A15 (MTK_PIN_NO(40) | 7)
> +
> +#define PINMUX_GPIO41__FUNC_GPIO41 (MTK_PIN_NO(41) | 0)
> +#define PINMUX_GPIO41__FUNC_SPI1_CSB_A (MTK_PIN_NO(41) | 1)
> +#define PINMUX_GPIO41__FUNC_SCP_SPI1_CS (MTK_PIN_NO(41) | 2)
> +#define PINMUX_GPIO41__FUNC_PWM0 (MTK_PIN_NO(41) | 3)
> +#define PINMUX_GPIO41__FUNC_URTS0 (MTK_PIN_NO(41) | 4)
> +#define PINMUX_GPIO41__FUNC_SPINOR_IO3 (MTK_PIN_NO(41) | 5)
> +#define PINMUX_GPIO41__FUNC_TP_URTS1_AO (MTK_PIN_NO(41) | 6)
> +#define PINMUX_GPIO41__FUNC_DBG_MON_A16 (MTK_PIN_NO(41) | 7)
> +
> +#define PINMUX_GPIO42__FUNC_GPIO42 (MTK_PIN_NO(42) | 0)
> +#define PINMUX_GPIO42__FUNC_SPI1_MO_A (MTK_PIN_NO(42) | 1)
> +#define PINMUX_GPIO42__FUNC_SCP_SPI1_MO (MTK_PIN_NO(42) | 2)
> +#define PINMUX_GPIO42__FUNC_PWM1 (MTK_PIN_NO(42) | 3)
> +#define PINMUX_GPIO42__FUNC_UCTS1 (MTK_PIN_NO(42) | 4)
> +#define PINMUX_GPIO42__FUNC_TP_UCTS2_AO (MTK_PIN_NO(42) | 6)
> +#define PINMUX_GPIO42__FUNC_DBG_MON_A17 (MTK_PIN_NO(42) | 7)
> +
> +#define PINMUX_GPIO43__FUNC_GPIO43 (MTK_PIN_NO(43) | 0)
> +#define PINMUX_GPIO43__FUNC_SPI1_MI_A (MTK_PIN_NO(43) | 1)
> +#define PINMUX_GPIO43__FUNC_SCP_SPI1_MI (MTK_PIN_NO(43) | 2)
> +#define PINMUX_GPIO43__FUNC_PWM2 (MTK_PIN_NO(43) | 3)
> +#define PINMUX_GPIO43__FUNC_URTS1 (MTK_PIN_NO(43) | 4)
> +#define PINMUX_GPIO43__FUNC_TP_URTS2_AO (MTK_PIN_NO(43) | 6)
> +#define PINMUX_GPIO43__FUNC_DBG_MON_A18 (MTK_PIN_NO(43) | 7)
> +
> +#define PINMUX_GPIO44__FUNC_GPIO44 (MTK_PIN_NO(44) | 0)
> +#define PINMUX_GPIO44__FUNC_SPI2_CLK_A (MTK_PIN_NO(44) | 1)
> +#define PINMUX_GPIO44__FUNC_SCP_SPI0_CK (MTK_PIN_NO(44) | 2)
> +#define PINMUX_GPIO44__FUNC_DBG_MON_A19 (MTK_PIN_NO(44) | 7)
> +
> +#define PINMUX_GPIO45__FUNC_GPIO45 (MTK_PIN_NO(45) | 0)
> +#define PINMUX_GPIO45__FUNC_SPI2_CSB_A (MTK_PIN_NO(45) | 1)
> +#define PINMUX_GPIO45__FUNC_SCP_SPI0_CS (MTK_PIN_NO(45) | 2)
> +#define PINMUX_GPIO45__FUNC_DBG_MON_A20 (MTK_PIN_NO(45) | 7)
> +
> +#define PINMUX_GPIO46__FUNC_GPIO46 (MTK_PIN_NO(46) | 0)
> +#define PINMUX_GPIO46__FUNC_SPI2_MO_A (MTK_PIN_NO(46) | 1)
> +#define PINMUX_GPIO46__FUNC_SCP_SPI0_MO (MTK_PIN_NO(46) | 2)
> +#define PINMUX_GPIO46__FUNC_DBG_MON_A21 (MTK_PIN_NO(46) | 7)
> +
> +#define PINMUX_GPIO47__FUNC_GPIO47 (MTK_PIN_NO(47) | 0)
> +#define PINMUX_GPIO47__FUNC_SPI2_MI_A (MTK_PIN_NO(47) | 1)
> +#define PINMUX_GPIO47__FUNC_SCP_SPI0_MI (MTK_PIN_NO(47) | 2)
> +#define PINMUX_GPIO47__FUNC_DBG_MON_A22 (MTK_PIN_NO(47) | 7)
> +
> +#define PINMUX_GPIO48__FUNC_GPIO48 (MTK_PIN_NO(48) | 0)
> +#define PINMUX_GPIO48__FUNC_SPI3_CLK (MTK_PIN_NO(48) | 1)
> +#define PINMUX_GPIO48__FUNC_TP_URXD1_AO (MTK_PIN_NO(48) | 2)
> +#define PINMUX_GPIO48__FUNC_TP_URXD2_AO (MTK_PIN_NO(48) | 3)
> +#define PINMUX_GPIO48__FUNC_URXD1 (MTK_PIN_NO(48) | 4)
> +#define PINMUX_GPIO48__FUNC_I2S2_MCK (MTK_PIN_NO(48) | 5)
> +#define PINMUX_GPIO48__FUNC_SCP_SPI0_CK (MTK_PIN_NO(48) | 6)
> +
> +#define PINMUX_GPIO49__FUNC_GPIO49 (MTK_PIN_NO(49) | 0)
> +#define PINMUX_GPIO49__FUNC_SPI3_CSB (MTK_PIN_NO(49) | 1)
> +#define PINMUX_GPIO49__FUNC_TP_UTXD1_AO (MTK_PIN_NO(49) | 2)
> +#define PINMUX_GPIO49__FUNC_TP_UTXD2_AO (MTK_PIN_NO(49) | 3)
> +#define PINMUX_GPIO49__FUNC_UTXD1 (MTK_PIN_NO(49) | 4)
> +#define PINMUX_GPIO49__FUNC_I2S2_BCK (MTK_PIN_NO(49) | 5)
> +#define PINMUX_GPIO49__FUNC_SCP_SPI0_CS (MTK_PIN_NO(49) | 6)
> +
> +#define PINMUX_GPIO50__FUNC_GPIO50 (MTK_PIN_NO(50) | 0)
> +#define PINMUX_GPIO50__FUNC_SPI3_MO (MTK_PIN_NO(50) | 1)
> +#define PINMUX_GPIO50__FUNC_I2S2_LRCK (MTK_PIN_NO(50) | 5)
> +#define PINMUX_GPIO50__FUNC_SCP_SPI0_MO (MTK_PIN_NO(50) | 6)
> +
> +#define PINMUX_GPIO51__FUNC_GPIO51 (MTK_PIN_NO(51) | 0)
> +#define PINMUX_GPIO51__FUNC_SPI3_MI (MTK_PIN_NO(51) | 1)
> +#define PINMUX_GPIO51__FUNC_I2S2_DI (MTK_PIN_NO(51) | 5)
> +#define PINMUX_GPIO51__FUNC_SCP_SPI0_MI (MTK_PIN_NO(51) | 6)
> +
> +#define PINMUX_GPIO52__FUNC_GPIO52 (MTK_PIN_NO(52) | 0)
> +#define PINMUX_GPIO52__FUNC_SPI5_CLK (MTK_PIN_NO(52) | 1)
> +#define PINMUX_GPIO52__FUNC_I2S2_MCK (MTK_PIN_NO(52) | 2)
> +#define PINMUX_GPIO52__FUNC_I2S1_MCK (MTK_PIN_NO(52) | 3)
> +#define PINMUX_GPIO52__FUNC_SCP_SPI1_CK (MTK_PIN_NO(52) | 4)
> +#define PINMUX_GPIO52__FUNC_LVTS_26M (MTK_PIN_NO(52) | 5)
> +#define PINMUX_GPIO52__FUNC_DFD_TCK_XI (MTK_PIN_NO(52) | 6)
> +#define PINMUX_GPIO52__FUNC_DBG_MON_B30 (MTK_PIN_NO(52) | 7)
> +
> +#define PINMUX_GPIO53__FUNC_GPIO53 (MTK_PIN_NO(53) | 0)
> +#define PINMUX_GPIO53__FUNC_SPI5_CSB (MTK_PIN_NO(53) | 1)
> +#define PINMUX_GPIO53__FUNC_I2S2_BCK (MTK_PIN_NO(53) | 2)
> +#define PINMUX_GPIO53__FUNC_I2S1_BCK (MTK_PIN_NO(53) | 3)
> +#define PINMUX_GPIO53__FUNC_SCP_SPI1_CS (MTK_PIN_NO(53) | 4)
> +#define PINMUX_GPIO53__FUNC_LVTS_FOUT (MTK_PIN_NO(53) | 5)
> +#define PINMUX_GPIO53__FUNC_DFD_TDI (MTK_PIN_NO(53) | 6)
> +#define PINMUX_GPIO53__FUNC_DBG_MON_B31 (MTK_PIN_NO(53) | 7)
> +
> +#define PINMUX_GPIO54__FUNC_GPIO54 (MTK_PIN_NO(54) | 0)
> +#define PINMUX_GPIO54__FUNC_SPI5_MO (MTK_PIN_NO(54) | 1)
> +#define PINMUX_GPIO54__FUNC_I2S2_LRCK (MTK_PIN_NO(54) | 2)
> +#define PINMUX_GPIO54__FUNC_I2S1_LRCK (MTK_PIN_NO(54) | 3)
> +#define PINMUX_GPIO54__FUNC_SCP_SPI1_MO (MTK_PIN_NO(54) | 4)
> +#define PINMUX_GPIO54__FUNC_LVTS_SCK (MTK_PIN_NO(54) | 5)
> +#define PINMUX_GPIO54__FUNC_DFD_TDO (MTK_PIN_NO(54) | 6)
> +#define PINMUX_GPIO54__FUNC_DBG_MON_A1 (MTK_PIN_NO(54) | 7)
> +
> +#define PINMUX_GPIO55__FUNC_GPIO55 (MTK_PIN_NO(55) | 0)
> +#define PINMUX_GPIO55__FUNC_SPI5_MI (MTK_PIN_NO(55) | 1)
> +#define PINMUX_GPIO55__FUNC_I2S2_DI (MTK_PIN_NO(55) | 2)
> +#define PINMUX_GPIO55__FUNC_I2S1_DO (MTK_PIN_NO(55) | 3)
> +#define PINMUX_GPIO55__FUNC_SCP_SPI1_MI (MTK_PIN_NO(55) | 4)
> +#define PINMUX_GPIO55__FUNC_LVTS_SDO (MTK_PIN_NO(55) | 5)
> +#define PINMUX_GPIO55__FUNC_DFD_TMS (MTK_PIN_NO(55) | 6)
> +#define PINMUX_GPIO55__FUNC_DBG_MON_B32 (MTK_PIN_NO(55) | 7)
> +
> +#define PINMUX_GPIO56__FUNC_GPIO56 (MTK_PIN_NO(56) | 0)
> +#define PINMUX_GPIO56__FUNC_I2S1_DO (MTK_PIN_NO(56) | 1)
> +#define PINMUX_GPIO56__FUNC_I2S3_DO (MTK_PIN_NO(56) | 2)
> +#define PINMUX_GPIO56__FUNC_DBG_MON_A23 (MTK_PIN_NO(56) | 7)
> +
> +#define PINMUX_GPIO57__FUNC_GPIO57 (MTK_PIN_NO(57) | 0)
> +#define PINMUX_GPIO57__FUNC_I2S1_BCK (MTK_PIN_NO(57) | 1)
> +#define PINMUX_GPIO57__FUNC_I2S3_BCK (MTK_PIN_NO(57) | 2)
> +#define PINMUX_GPIO57__FUNC_DBG_MON_A24 (MTK_PIN_NO(57) | 7)
> +
> +#define PINMUX_GPIO58__FUNC_GPIO58 (MTK_PIN_NO(58) | 0)
> +#define PINMUX_GPIO58__FUNC_I2S1_LRCK (MTK_PIN_NO(58) | 1)
> +#define PINMUX_GPIO58__FUNC_I2S3_LRCK (MTK_PIN_NO(58) | 2)
> +#define PINMUX_GPIO58__FUNC_DBG_MON_A25 (MTK_PIN_NO(58) | 7)
> +
> +#define PINMUX_GPIO59__FUNC_GPIO59 (MTK_PIN_NO(59) | 0)
> +#define PINMUX_GPIO59__FUNC_I2S1_MCK (MTK_PIN_NO(59) | 1)
> +#define PINMUX_GPIO59__FUNC_I2S3_MCK (MTK_PIN_NO(59) | 2)
> +#define PINMUX_GPIO59__FUNC_DBG_MON_A27 (MTK_PIN_NO(59) | 7)
> +
> +#define PINMUX_GPIO60__FUNC_GPIO60 (MTK_PIN_NO(60) | 0)
> +#define PINMUX_GPIO60__FUNC_TDM_RX_LRCK (MTK_PIN_NO(60) | 1)
> +#define PINMUX_GPIO60__FUNC_ANT_SEL3 (MTK_PIN_NO(60) | 2)
> +#define PINMUX_GPIO60__FUNC_CONN_MCU_DBGACK_N (MTK_PIN_NO(60) | 5)
> +
> +#define PINMUX_GPIO61__FUNC_GPIO61 (MTK_PIN_NO(61) | 0)
> +#define PINMUX_GPIO61__FUNC_TDM_RX_BCK (MTK_PIN_NO(61) | 1)
> +#define PINMUX_GPIO61__FUNC_ANT_SEL4 (MTK_PIN_NO(61) | 2)
> +#define PINMUX_GPIO61__FUNC_SPINOR_CK (MTK_PIN_NO(61) | 4)
> +#define PINMUX_GPIO61__FUNC_CONN_MCU_DBGI_N (MTK_PIN_NO(61) | 5)
> +
> +#define PINMUX_GPIO62__FUNC_GPIO62 (MTK_PIN_NO(62) | 0)
> +#define PINMUX_GPIO62__FUNC_TDM_RX_MCK (MTK_PIN_NO(62) | 1)
> +#define PINMUX_GPIO62__FUNC_ANT_SEL5 (MTK_PIN_NO(62) | 2)
> +#define PINMUX_GPIO62__FUNC_SPINOR_CS (MTK_PIN_NO(62) | 4)
> +#define PINMUX_GPIO62__FUNC_CONN_MCU_TDI (MTK_PIN_NO(62) | 5)
> +
> +#define PINMUX_GPIO63__FUNC_GPIO63 (MTK_PIN_NO(63) | 0)
> +#define PINMUX_GPIO63__FUNC_TDM_RX_DATA0 (MTK_PIN_NO(63) | 1)
> +#define PINMUX_GPIO63__FUNC_ANT_SEL6 (MTK_PIN_NO(63) | 2)
> +#define PINMUX_GPIO63__FUNC_SPINOR_IO0 (MTK_PIN_NO(63) | 4)
> +#define PINMUX_GPIO63__FUNC_CONN_MCU_TRST_B (MTK_PIN_NO(63) | 5)
> +
> +#define PINMUX_GPIO64__FUNC_GPIO64 (MTK_PIN_NO(64) | 0)
> +#define PINMUX_GPIO64__FUNC_TDM_RX_DATA1 (MTK_PIN_NO(64) | 1)
> +#define PINMUX_GPIO64__FUNC_ANT_SEL7 (MTK_PIN_NO(64) | 2)
> +#define PINMUX_GPIO64__FUNC_PWM0 (MTK_PIN_NO(64) | 3)
> +#define PINMUX_GPIO64__FUNC_SPINOR_IO1 (MTK_PIN_NO(64) | 4)
> +#define PINMUX_GPIO64__FUNC_CONN_MCU_TCK (MTK_PIN_NO(64) | 5)
> +
> +#define PINMUX_GPIO65__FUNC_GPIO65 (MTK_PIN_NO(65) | 0)
> +#define PINMUX_GPIO65__FUNC_TDM_RX_DATA2 (MTK_PIN_NO(65) | 1)
> +#define PINMUX_GPIO65__FUNC_UCTS0 (MTK_PIN_NO(65) | 2)
> +#define PINMUX_GPIO65__FUNC_PWM1 (MTK_PIN_NO(65) | 3)
> +#define PINMUX_GPIO65__FUNC_SPINOR_IO2 (MTK_PIN_NO(65) | 4)
> +#define PINMUX_GPIO65__FUNC_CONN_MCU_TDO (MTK_PIN_NO(65) | 5)
> +#define PINMUX_GPIO65__FUNC_TP_UCTS1_AO (MTK_PIN_NO(65) | 6)
> +#define PINMUX_GPIO65__FUNC_TP_UCTS2_AO (MTK_PIN_NO(65) | 7)
> +
> +#define PINMUX_GPIO66__FUNC_GPIO66 (MTK_PIN_NO(66) | 0)
> +#define PINMUX_GPIO66__FUNC_TDM_RX_DATA3 (MTK_PIN_NO(66) | 1)
> +#define PINMUX_GPIO66__FUNC_URTS0 (MTK_PIN_NO(66) | 2)
> +#define PINMUX_GPIO66__FUNC_PWM2 (MTK_PIN_NO(66) | 3)
> +#define PINMUX_GPIO66__FUNC_SPINOR_IO3 (MTK_PIN_NO(66) | 4)
> +#define PINMUX_GPIO66__FUNC_CONN_MCU_TMS (MTK_PIN_NO(66) | 5)
> +#define PINMUX_GPIO66__FUNC_TP_URTS1_AO (MTK_PIN_NO(66) | 6)
> +#define PINMUX_GPIO66__FUNC_TP_URTS2_AO (MTK_PIN_NO(66) | 7)
> +
> +#define PINMUX_GPIO67__FUNC_GPIO67 (MTK_PIN_NO(67) | 0)
> +#define PINMUX_GPIO67__FUNC_MSDC0_DSL (MTK_PIN_NO(67) | 1)
> +
> +#define PINMUX_GPIO68__FUNC_GPIO68 (MTK_PIN_NO(68) | 0)
> +#define PINMUX_GPIO68__FUNC_MSDC0_CLK (MTK_PIN_NO(68) | 1)
> +
> +#define PINMUX_GPIO69__FUNC_GPIO69 (MTK_PIN_NO(69) | 0)
> +#define PINMUX_GPIO69__FUNC_MSDC0_CMD (MTK_PIN_NO(69) | 1)
> +
> +#define PINMUX_GPIO70__FUNC_GPIO70 (MTK_PIN_NO(70) | 0)
> +#define PINMUX_GPIO70__FUNC_MSDC0_RSTB (MTK_PIN_NO(70) | 1)
> +
> +#define PINMUX_GPIO71__FUNC_GPIO71 (MTK_PIN_NO(71) | 0)
> +#define PINMUX_GPIO71__FUNC_MSDC0_DAT0 (MTK_PIN_NO(71) | 1)
> +
> +#define PINMUX_GPIO72__FUNC_GPIO72 (MTK_PIN_NO(72) | 0)
> +#define PINMUX_GPIO72__FUNC_MSDC0_DAT1 (MTK_PIN_NO(72) | 1)
> +
> +#define PINMUX_GPIO73__FUNC_GPIO73 (MTK_PIN_NO(73) | 0)
> +#define PINMUX_GPIO73__FUNC_MSDC0_DAT2 (MTK_PIN_NO(73) | 1)
> +
> +#define PINMUX_GPIO74__FUNC_GPIO74 (MTK_PIN_NO(74) | 0)
> +#define PINMUX_GPIO74__FUNC_MSDC0_DAT3 (MTK_PIN_NO(74) | 1)
> +
> +#define PINMUX_GPIO75__FUNC_GPIO75 (MTK_PIN_NO(75) | 0)
> +#define PINMUX_GPIO75__FUNC_MSDC0_DAT4 (MTK_PIN_NO(75) | 1)
> +
> +#define PINMUX_GPIO76__FUNC_GPIO76 (MTK_PIN_NO(76) | 0)
> +#define PINMUX_GPIO76__FUNC_MSDC0_DAT5 (MTK_PIN_NO(76) | 1)
> +
> +#define PINMUX_GPIO77__FUNC_GPIO77 (MTK_PIN_NO(77) | 0)
> +#define PINMUX_GPIO77__FUNC_MSDC0_DAT6 (MTK_PIN_NO(77) | 1)
> +
> +#define PINMUX_GPIO78__FUNC_GPIO78 (MTK_PIN_NO(78) | 0)
> +#define PINMUX_GPIO78__FUNC_MSDC0_DAT7 (MTK_PIN_NO(78) | 1)
> +
> +#define PINMUX_GPIO79__FUNC_GPIO79 (MTK_PIN_NO(79) | 0)
> +#define PINMUX_GPIO79__FUNC_KPCOL0 (MTK_PIN_NO(79) | 1)
> +
> +#define PINMUX_GPIO80__FUNC_GPIO80 (MTK_PIN_NO(80) | 0)
> +#define PINMUX_GPIO80__FUNC_KPCOL1 (MTK_PIN_NO(80) | 1)
> +#define PINMUX_GPIO80__FUNC_GPS_L1_ELNA_EN (MTK_PIN_NO(80) | 2)
> +#define PINMUX_GPIO80__FUNC_PWM0 (MTK_PIN_NO(80) | 3)
> +#define PINMUX_GPIO80__FUNC_CLKM0 (MTK_PIN_NO(80) | 4)
> +
> +#define PINMUX_GPIO81__FUNC_GPIO81 (MTK_PIN_NO(81) | 0)
> +#define PINMUX_GPIO81__FUNC_KPROW0 (MTK_PIN_NO(81) | 1)
> +#define PINMUX_GPIO81__FUNC_PWM1 (MTK_PIN_NO(81) | 3)
> +#define PINMUX_GPIO81__FUNC_CLKM1 (MTK_PIN_NO(81) | 4)
> +
> +#define PINMUX_GPIO82__FUNC_GPIO82 (MTK_PIN_NO(82) | 0)
> +#define PINMUX_GPIO82__FUNC_KPROW1 (MTK_PIN_NO(82) | 1)
> +#define PINMUX_GPIO82__FUNC_PWM2 (MTK_PIN_NO(82) | 3)
> +#define PINMUX_GPIO82__FUNC_CLKM2 (MTK_PIN_NO(82) | 4)
> +
> +#define PINMUX_GPIO83__FUNC_GPIO83 (MTK_PIN_NO(83) | 0)
> +#define PINMUX_GPIO83__FUNC_AP_GOOD (MTK_PIN_NO(83) | 1)
> +#define PINMUX_GPIO83__FUNC_GPS_PPS (MTK_PIN_NO(83) | 2)
> +#define PINMUX_GPIO83__FUNC_EXT_FRAME_SYNC (MTK_PIN_NO(83) | 4)
> +#define PINMUX_GPIO83__FUNC_DBG_MON_A28 (MTK_PIN_NO(83) | 7)
> +
> +#define PINMUX_GPIO84__FUNC_GPIO84 (MTK_PIN_NO(84) | 0)
> +#define PINMUX_GPIO84__FUNC_MSDC1_CLK (MTK_PIN_NO(84) | 1)
> +#define PINMUX_GPIO84__FUNC_ADSP_JTAG_TCK (MTK_PIN_NO(84) | 2)
> +#define PINMUX_GPIO84__FUNC_UDI_TCK (MTK_PIN_NO(84) | 4)
> +#define PINMUX_GPIO84__FUNC_CONN_DSP_JCK (MTK_PIN_NO(84) | 5)
> +#define PINMUX_GPIO84__FUNC_SSPM_JTAG_TCK (MTK_PIN_NO(84) | 6)
> +#define PINMUX_GPIO84__FUNC_DFD_TCK_XI (MTK_PIN_NO(84) | 7)
> +
> +#define PINMUX_GPIO85__FUNC_GPIO85 (MTK_PIN_NO(85) | 0)
> +#define PINMUX_GPIO85__FUNC_MSDC1_CMD (MTK_PIN_NO(85) | 1)
> +#define PINMUX_GPIO85__FUNC_ADSP_JTAG_TMS (MTK_PIN_NO(85) | 2)
> +#define PINMUX_GPIO85__FUNC_CONN_MCU_AICE_TMSC (MTK_PIN_NO(85) | 3)
> +#define PINMUX_GPIO85__FUNC_UDI_TMS (MTK_PIN_NO(85) | 4)
> +#define PINMUX_GPIO85__FUNC_CONN_DSP_JMS (MTK_PIN_NO(85) | 5)
> +#define PINMUX_GPIO85__FUNC_SSPM_JTAG_TMS (MTK_PIN_NO(85) | 6)
> +#define PINMUX_GPIO85__FUNC_DFD_TMS (MTK_PIN_NO(85) | 7)
> +
> +#define PINMUX_GPIO86__FUNC_GPIO86 (MTK_PIN_NO(86) | 0)
> +#define PINMUX_GPIO86__FUNC_MSDC1_DAT0 (MTK_PIN_NO(86) | 1)
> +#define PINMUX_GPIO86__FUNC_ADSP_JTAG_TDI (MTK_PIN_NO(86) | 2)
> +#define PINMUX_GPIO86__FUNC_UDI_TDI (MTK_PIN_NO(86) | 4)
> +#define PINMUX_GPIO86__FUNC_CONN_DSP_JDI (MTK_PIN_NO(86) | 5)
> +#define PINMUX_GPIO86__FUNC_SSPM_JTAG_TDI (MTK_PIN_NO(86) | 6)
> +#define PINMUX_GPIO86__FUNC_DFD_TDI (MTK_PIN_NO(86) | 7)
> +
> +#define PINMUX_GPIO87__FUNC_GPIO87 (MTK_PIN_NO(87) | 0)
> +#define PINMUX_GPIO87__FUNC_MSDC1_DAT1 (MTK_PIN_NO(87) | 1)
> +#define PINMUX_GPIO87__FUNC_ADSP_JTAG_TDO (MTK_PIN_NO(87) | 2)
> +#define PINMUX_GPIO87__FUNC_UDI_TDO (MTK_PIN_NO(87) | 4)
> +#define PINMUX_GPIO87__FUNC_CONN_DSP_JDO (MTK_PIN_NO(87) | 5)
> +#define PINMUX_GPIO87__FUNC_SSPM_JTAG_TDO (MTK_PIN_NO(87) | 6)
> +#define PINMUX_GPIO87__FUNC_DFD_TDO (MTK_PIN_NO(87) | 7)
> +
> +#define PINMUX_GPIO88__FUNC_GPIO88 (MTK_PIN_NO(88) | 0)
> +#define PINMUX_GPIO88__FUNC_MSDC1_DAT2 (MTK_PIN_NO(88) | 1)
> +#define PINMUX_GPIO88__FUNC_ADSP_JTAG_TRSTN (MTK_PIN_NO(88) | 2)
> +#define PINMUX_GPIO88__FUNC_CONN_MCU_AICE_TCKC (MTK_PIN_NO(88) | 3)
> +#define PINMUX_GPIO88__FUNC_UDI_NTRST (MTK_PIN_NO(88) | 4)
> +#define PINMUX_GPIO88__FUNC_CONN_WIFI_TXD (MTK_PIN_NO(88) | 5)
> +#define PINMUX_GPIO88__FUNC_SSPM_JTAG_TRSTN (MTK_PIN_NO(88) | 6)
> +
> +#define PINMUX_GPIO89__FUNC_GPIO89 (MTK_PIN_NO(89) | 0)
> +#define PINMUX_GPIO89__FUNC_MSDC1_DAT3 (MTK_PIN_NO(89) | 1)
> +#define PINMUX_GPIO89__FUNC_CONN_DSP_JINTP (MTK_PIN_NO(89) | 5)
> +
> +#define PINMUX_GPIO90__FUNC_GPIO90 (MTK_PIN_NO(90) | 0)
> +#define PINMUX_GPIO90__FUNC_IDDIG_P0 (MTK_PIN_NO(90) | 1)
> +#define PINMUX_GPIO90__FUNC_PGD_HV_HSC_PWR4 (MTK_PIN_NO(90) | 4)
> +#define PINMUX_GPIO90__FUNC_GDU_SUM_TROOP2_2 (MTK_PIN_NO(90) | 5)
> +
> +#define PINMUX_GPIO91__FUNC_GPIO91 (MTK_PIN_NO(91) | 0)
> +#define PINMUX_GPIO91__FUNC_USB_DRVVBUS_P0 (MTK_PIN_NO(91) | 1)
> +#define PINMUX_GPIO91__FUNC_PGD_HV_HSC_PWR5 (MTK_PIN_NO(91) | 4)
> +#define PINMUX_GPIO91__FUNC_GDU_TROOPS_DET0 (MTK_PIN_NO(91) | 5)
> +
> +#define PINMUX_GPIO92__FUNC_GPIO92 (MTK_PIN_NO(92) | 0)
> +#define PINMUX_GPIO92__FUNC_VBUS_VALID_P0 (MTK_PIN_NO(92) | 1)
> +#define PINMUX_GPIO92__FUNC_PGD_DA_EFUSE_RDY (MTK_PIN_NO(92) | 4)
> +#define PINMUX_GPIO92__FUNC_GDU_TROOPS_DET1 (MTK_PIN_NO(92) | 5)
> +
> +#define PINMUX_GPIO93__FUNC_GPIO93 (MTK_PIN_NO(93) | 0)
> +#define PINMUX_GPIO93__FUNC_IDDIG_P1 (MTK_PIN_NO(93) | 1)
> +#define PINMUX_GPIO93__FUNC_PWM0 (MTK_PIN_NO(93) | 2)
> +#define PINMUX_GPIO93__FUNC_CLKM0 (MTK_PIN_NO(93) | 3)
> +#define PINMUX_GPIO93__FUNC_PGD_DA_EFUSE_RDY_PRE (MTK_PIN_NO(93) |
> 4)
> +#define PINMUX_GPIO93__FUNC_GDU_TROOPS_DET2 (MTK_PIN_NO(93) | 5)
> +
> +#define PINMUX_GPIO94__FUNC_GPIO94 (MTK_PIN_NO(94) | 0)
> +#define PINMUX_GPIO94__FUNC_USB_DRVVBUS_P1 (MTK_PIN_NO(94) | 1)
> +#define PINMUX_GPIO94__FUNC_PWM1 (MTK_PIN_NO(94) | 2)
> +#define PINMUX_GPIO94__FUNC_CLKM1 (MTK_PIN_NO(94) | 3)
> +#define PINMUX_GPIO94__FUNC_PGD_DA_PWRGD_RESET (MTK_PIN_NO(94) | 4)
> +
> +#define PINMUX_GPIO95__FUNC_GPIO95 (MTK_PIN_NO(95) | 0)
> +#define PINMUX_GPIO95__FUNC_VBUS_VALID_P1 (MTK_PIN_NO(95) | 1)
> +#define PINMUX_GPIO95__FUNC_PWM2 (MTK_PIN_NO(95) | 2)
> +#define PINMUX_GPIO95__FUNC_CLKM2 (MTK_PIN_NO(95) | 3)
> +#define PINMUX_GPIO95__FUNC_PGD_DA_PWRGD_ENB (MTK_PIN_NO(95) | 4)
> +
> +#define PINMUX_GPIO96__FUNC_GPIO96 (MTK_PIN_NO(96) | 0)
> +#define PINMUX_GPIO96__FUNC_DSI_TE (MTK_PIN_NO(96) | 1)
> +#define PINMUX_GPIO96__FUNC_DBG_MON_A29 (MTK_PIN_NO(96) | 7)
> +
> +#define PINMUX_GPIO97__FUNC_GPIO97 (MTK_PIN_NO(97) | 0)
> +#define PINMUX_GPIO97__FUNC_DISP_PWM (MTK_PIN_NO(97) | 1)
> +#define PINMUX_GPIO97__FUNC_DBG_MON_A30 (MTK_PIN_NO(97) | 7)
> +
> +#define PINMUX_GPIO98__FUNC_GPIO98 (MTK_PIN_NO(98) | 0)
> +#define PINMUX_GPIO98__FUNC_LCM_RST (MTK_PIN_NO(98) | 1)
> +
> +#define PINMUX_GPIO99__FUNC_GPIO99 (MTK_PIN_NO(99) | 0)
> +#define PINMUX_GPIO99__FUNC_DPI_PCLK (MTK_PIN_NO(99) | 1)
> +#define PINMUX_GPIO99__FUNC_GPS_L1_ELNA_EN (MTK_PIN_NO(99) | 2)
> +#define PINMUX_GPIO99__FUNC_SSPM_JTAG_TCK (MTK_PIN_NO(99) | 3)
> +#define PINMUX_GPIO99__FUNC_ANT_SEL0 (MTK_PIN_NO(99) | 5)
> +#define PINMUX_GPIO99__FUNC_TP_GPIO0_AO (MTK_PIN_NO(99) | 6)
> +#define PINMUX_GPIO99__FUNC_PGD_LV_LSC_PWR0 (MTK_PIN_NO(99) | 7)
> +
> +#define PINMUX_GPIO100__FUNC_GPIO100 (MTK_PIN_NO(100) | 0)
> +#define PINMUX_GPIO100__FUNC_DPI_VSYNC (MTK_PIN_NO(100) | 1)
> +#define PINMUX_GPIO100__FUNC_KPCOL2 (MTK_PIN_NO(100) | 2)
> +#define PINMUX_GPIO100__FUNC_SSPM_JTAG_TMS (MTK_PIN_NO(100) | 3)
> +#define PINMUX_GPIO100__FUNC_ANT_SEL1 (MTK_PIN_NO(100) | 5)
> +#define PINMUX_GPIO100__FUNC_TP_GPIO1_AO (MTK_PIN_NO(100) | 6)
> +#define PINMUX_GPIO100__FUNC_PGD_LV_LSC_PWR1 (MTK_PIN_NO(100) | 7)
> +
> +#define PINMUX_GPIO101__FUNC_GPIO101 (MTK_PIN_NO(101) | 0)
> +#define PINMUX_GPIO101__FUNC_DPI_HSYNC (MTK_PIN_NO(101) | 1)
> +#define PINMUX_GPIO101__FUNC_KPROW2 (MTK_PIN_NO(101) | 2)
> +#define PINMUX_GPIO101__FUNC_SSPM_JTAG_TDI (MTK_PIN_NO(101) | 3)
> +#define PINMUX_GPIO101__FUNC_ANT_SEL2 (MTK_PIN_NO(101) | 5)
> +#define PINMUX_GPIO101__FUNC_TP_GPIO2_AO (MTK_PIN_NO(101) | 6)
> +#define PINMUX_GPIO101__FUNC_PGD_LV_LSC_PWR2 (MTK_PIN_NO(101) | 7)
> +
> +#define PINMUX_GPIO102__FUNC_GPIO102 (MTK_PIN_NO(102) | 0)
> +#define PINMUX_GPIO102__FUNC_DPI_DE (MTK_PIN_NO(102) | 1)
> +#define PINMUX_GPIO102__FUNC_SSPM_JTAG_TDO (MTK_PIN_NO(102) | 3)
> +#define PINMUX_GPIO102__FUNC_ANT_SEL3 (MTK_PIN_NO(102) | 5)
> +#define PINMUX_GPIO102__FUNC_TP_GPIO3_AO (MTK_PIN_NO(102) | 6)
> +#define PINMUX_GPIO102__FUNC_PGD_LV_LSC_PWR3 (MTK_PIN_NO(102) | 7)
> +
> +#define PINMUX_GPIO103__FUNC_GPIO103 (MTK_PIN_NO(103) | 0)
> +#define PINMUX_GPIO103__FUNC_DPI_DATA0 (MTK_PIN_NO(103) | 1)
> +#define PINMUX_GPIO103__FUNC_SSPM_JTAG_TRSTN (MTK_PIN_NO(103) | 3)
> +#define PINMUX_GPIO103__FUNC_CLKM0 (MTK_PIN_NO(103) | 4)
> +#define PINMUX_GPIO103__FUNC_ANT_SEL4 (MTK_PIN_NO(103) | 5)
> +#define PINMUX_GPIO103__FUNC_TP_GPIO4_AO (MTK_PIN_NO(103) | 6)
> +#define PINMUX_GPIO103__FUNC_PGD_LV_LSC_PWR4 (MTK_PIN_NO(103) | 7)
> +
> +#define PINMUX_GPIO104__FUNC_GPIO104 (MTK_PIN_NO(104) | 0)
> +#define PINMUX_GPIO104__FUNC_DPI_DATA1 (MTK_PIN_NO(104) | 1)
> +#define PINMUX_GPIO104__FUNC_GPS_PPS (MTK_PIN_NO(104) | 2)
> +#define PINMUX_GPIO104__FUNC_UCTS2 (MTK_PIN_NO(104) | 3)
> +#define PINMUX_GPIO104__FUNC_CLKM1 (MTK_PIN_NO(104) | 4)
> +#define PINMUX_GPIO104__FUNC_ANT_SEL5 (MTK_PIN_NO(104) | 5)
> +#define PINMUX_GPIO104__FUNC_TP_GPIO5_AO (MTK_PIN_NO(104) | 6)
> +#define PINMUX_GPIO104__FUNC_PGD_LV_LSC_PWR5 (MTK_PIN_NO(104) | 7)
> +
> +#define PINMUX_GPIO105__FUNC_GPIO105 (MTK_PIN_NO(105) | 0)
> +#define PINMUX_GPIO105__FUNC_DPI_DATA2 (MTK_PIN_NO(105) | 1)
> +#define PINMUX_GPIO105__FUNC_CONN_TCXOENA_REQ (MTK_PIN_NO(105) | 2)
> +#define PINMUX_GPIO105__FUNC_URTS2 (MTK_PIN_NO(105) | 3)
> +#define PINMUX_GPIO105__FUNC_CLKM2 (MTK_PIN_NO(105) | 4)
> +#define PINMUX_GPIO105__FUNC_ANT_SEL6 (MTK_PIN_NO(105) | 5)
> +#define PINMUX_GPIO105__FUNC_TP_GPIO6_AO (MTK_PIN_NO(105) | 6)
> +#define PINMUX_GPIO105__FUNC_PGD_LV_HSC_PWR0 (MTK_PIN_NO(105) | 7)
> +
> +#define PINMUX_GPIO106__FUNC_GPIO106 (MTK_PIN_NO(106) | 0)
> +#define PINMUX_GPIO106__FUNC_DPI_DATA3 (MTK_PIN_NO(106) | 1)
> +#define PINMUX_GPIO106__FUNC_TP_UTXD1_AO (MTK_PIN_NO(106) | 2)
> +#define PINMUX_GPIO106__FUNC_UTXD2 (MTK_PIN_NO(106) | 3)
> +#define PINMUX_GPIO106__FUNC_PWM0 (MTK_PIN_NO(106) | 4)
> +#define PINMUX_GPIO106__FUNC_ANT_SEL7 (MTK_PIN_NO(106) | 5)
> +#define PINMUX_GPIO106__FUNC_TP_GPIO7_AO (MTK_PIN_NO(106) | 6)
> +#define PINMUX_GPIO106__FUNC_PGD_LV_HSC_PWR1 (MTK_PIN_NO(106) | 7)
> +
> +#define PINMUX_GPIO107__FUNC_GPIO107 (MTK_PIN_NO(107) | 0)
> +#define PINMUX_GPIO107__FUNC_DPI_DATA4 (MTK_PIN_NO(107) | 1)
> +#define PINMUX_GPIO107__FUNC_TP_URXD1_AO (MTK_PIN_NO(107) | 2)
> +#define PINMUX_GPIO107__FUNC_URXD2 (MTK_PIN_NO(107) | 3)
> +#define PINMUX_GPIO107__FUNC_PWM1 (MTK_PIN_NO(107) | 4)
> +#define PINMUX_GPIO107__FUNC_GDU_SUM_TROOP0_0 (MTK_PIN_NO(107) | 6)
> +#define PINMUX_GPIO107__FUNC_PGD_LV_HSC_PWR2 (MTK_PIN_NO(107) | 7)
> +
> +#define PINMUX_GPIO108__FUNC_GPIO108 (MTK_PIN_NO(108) | 0)
> +#define PINMUX_GPIO108__FUNC_DPI_DATA5 (MTK_PIN_NO(108) | 1)
> +#define PINMUX_GPIO108__FUNC_TP_UCTS1_AO (MTK_PIN_NO(108) | 2)
> +#define PINMUX_GPIO108__FUNC_UCTS0 (MTK_PIN_NO(108) | 3)
> +#define PINMUX_GPIO108__FUNC_PWM2 (MTK_PIN_NO(108) | 4)
> +#define PINMUX_GPIO108__FUNC_GDU_SUM_TROOP0_1 (MTK_PIN_NO(108) | 6)
> +#define PINMUX_GPIO108__FUNC_PGD_LV_HSC_PWR3 (MTK_PIN_NO(108) | 7)
> +
> +#define PINMUX_GPIO109__FUNC_GPIO109 (MTK_PIN_NO(109) | 0)
> +#define PINMUX_GPIO109__FUNC_DPI_DATA6 (MTK_PIN_NO(109) | 1)
> +#define PINMUX_GPIO109__FUNC_TP_URTS1_AO (MTK_PIN_NO(109) | 2)
> +#define PINMUX_GPIO109__FUNC_URTS0 (MTK_PIN_NO(109) | 3)
> +#define PINMUX_GPIO109__FUNC_I2S0_DI (MTK_PIN_NO(109) | 4)
> +#define PINMUX_GPIO109__FUNC_I2S2_DI (MTK_PIN_NO(109) | 5)
> +#define PINMUX_GPIO109__FUNC_GDU_SUM_TROOP0_2 (MTK_PIN_NO(109) | 6)
> +#define PINMUX_GPIO109__FUNC_PGD_LV_HSC_PWR4 (MTK_PIN_NO(109) | 7)
> +
> +#define PINMUX_GPIO110__FUNC_GPIO110 (MTK_PIN_NO(110) | 0)
> +#define PINMUX_GPIO110__FUNC_DPI_DATA7 (MTK_PIN_NO(110) | 1)
> +#define PINMUX_GPIO110__FUNC_TP_UCTS2_AO (MTK_PIN_NO(110) | 2)
> +#define PINMUX_GPIO110__FUNC_UCTS1 (MTK_PIN_NO(110) | 3)
> +#define PINMUX_GPIO110__FUNC_I2S3_BCK (MTK_PIN_NO(110) | 4)
> +#define PINMUX_GPIO110__FUNC_I2S1_BCK (MTK_PIN_NO(110) | 5)
> +#define PINMUX_GPIO110__FUNC_GDU_SUM_TROOP1_0 (MTK_PIN_NO(110) | 6)
> +#define PINMUX_GPIO110__FUNC_PGD_LV_HSC_PWR5 (MTK_PIN_NO(110) | 7)
> +
> +#define PINMUX_GPIO111__FUNC_GPIO111 (MTK_PIN_NO(111) | 0)
> +#define PINMUX_GPIO111__FUNC_DPI_DATA8 (MTK_PIN_NO(111) | 1)
> +#define PINMUX_GPIO111__FUNC_TP_URTS2_AO (MTK_PIN_NO(111) | 2)
> +#define PINMUX_GPIO111__FUNC_URTS1 (MTK_PIN_NO(111) | 3)
> +#define PINMUX_GPIO111__FUNC_I2S3_MCK (MTK_PIN_NO(111) | 4)
> +#define PINMUX_GPIO111__FUNC_I2S1_MCK (MTK_PIN_NO(111) | 5)
> +#define PINMUX_GPIO111__FUNC_GDU_SUM_TROOP1_1 (MTK_PIN_NO(111) | 6)
> +#define PINMUX_GPIO111__FUNC_PGD_HV_HSC_PWR0 (MTK_PIN_NO(111) | 7)
> +
> +#define PINMUX_GPIO112__FUNC_GPIO112 (MTK_PIN_NO(112) | 0)
> +#define PINMUX_GPIO112__FUNC_DPI_DATA9 (MTK_PIN_NO(112) | 1)
> +#define PINMUX_GPIO112__FUNC_TP_URXD2_AO (MTK_PIN_NO(112) | 2)
> +#define PINMUX_GPIO112__FUNC_URXD1 (MTK_PIN_NO(112) | 3)
> +#define PINMUX_GPIO112__FUNC_I2S3_LRCK (MTK_PIN_NO(112) | 4)
> +#define PINMUX_GPIO112__FUNC_I2S1_LRCK (MTK_PIN_NO(112) | 5)
> +#define PINMUX_GPIO112__FUNC_GDU_SUM_TROOP1_2 (MTK_PIN_NO(112) | 6)
> +#define PINMUX_GPIO112__FUNC_PGD_HV_HSC_PWR1 (MTK_PIN_NO(112) | 7)
> +
> +#define PINMUX_GPIO113__FUNC_GPIO113 (MTK_PIN_NO(113) | 0)
> +#define PINMUX_GPIO113__FUNC_DPI_DATA10 (MTK_PIN_NO(113) | 1)
> +#define PINMUX_GPIO113__FUNC_TP_UTXD2_AO (MTK_PIN_NO(113) | 2)
> +#define PINMUX_GPIO113__FUNC_UTXD1 (MTK_PIN_NO(113) | 3)
> +#define PINMUX_GPIO113__FUNC_I2S3_DO (MTK_PIN_NO(113) | 4)
> +#define PINMUX_GPIO113__FUNC_I2S1_DO (MTK_PIN_NO(113) | 5)
> +#define PINMUX_GPIO113__FUNC_GDU_SUM_TROOP2_0 (MTK_PIN_NO(113) | 6)
> +#define PINMUX_GPIO113__FUNC_PGD_HV_HSC_PWR2 (MTK_PIN_NO(113) | 7)
> +
> +#define PINMUX_GPIO114__FUNC_GPIO114 (MTK_PIN_NO(114) | 0)
> +#define PINMUX_GPIO114__FUNC_DPI_DATA11 (MTK_PIN_NO(114) | 1)
> +#define PINMUX_GPIO114__FUNC_GDU_SUM_TROOP2_1 (MTK_PIN_NO(114) | 6)
> +#define PINMUX_GPIO114__FUNC_PGD_HV_HSC_PWR3 (MTK_PIN_NO(114) | 7)
> +
> +#define PINMUX_GPIO115__FUNC_GPIO115 (MTK_PIN_NO(115) | 0)
> +#define PINMUX_GPIO115__FUNC_PCM_CLK (MTK_PIN_NO(115) | 1)
> +#define PINMUX_GPIO115__FUNC_I2S0_BCK (MTK_PIN_NO(115) | 2)
> +#define PINMUX_GPIO115__FUNC_I2S2_BCK (MTK_PIN_NO(115) | 3)
> +
> +#define PINMUX_GPIO116__FUNC_GPIO116 (MTK_PIN_NO(116) | 0)
> +#define PINMUX_GPIO116__FUNC_PCM_SYNC (MTK_PIN_NO(116) | 1)
> +#define PINMUX_GPIO116__FUNC_I2S0_LRCK (MTK_PIN_NO(116) | 2)
> +#define PINMUX_GPIO116__FUNC_I2S2_LRCK (MTK_PIN_NO(116) | 3)
> +
> +#define PINMUX_GPIO117__FUNC_GPIO117 (MTK_PIN_NO(117) | 0)
> +#define PINMUX_GPIO117__FUNC_PCM_DI (MTK_PIN_NO(117) | 1)
> +#define PINMUX_GPIO117__FUNC_I2S0_DI (MTK_PIN_NO(117) | 2)
> +#define PINMUX_GPIO117__FUNC_I2S2_DI (MTK_PIN_NO(117) | 3)
> +
> +#define PINMUX_GPIO118__FUNC_GPIO118 (MTK_PIN_NO(118) | 0)
> +#define PINMUX_GPIO118__FUNC_PCM_DO (MTK_PIN_NO(118) | 1)
> +#define PINMUX_GPIO118__FUNC_I2S0_MCK (MTK_PIN_NO(118) | 2)
> +#define PINMUX_GPIO118__FUNC_I2S2_MCK (MTK_PIN_NO(118) | 3)
> +#define PINMUX_GPIO118__FUNC_I2S3_DO (MTK_PIN_NO(118) | 4)
> +#define PINMUX_GPIO118__FUNC_I2S1_DO (MTK_PIN_NO(118) | 5)
> +
> +#define PINMUX_GPIO119__FUNC_GPIO119 (MTK_PIN_NO(119) | 0)
> +#define PINMUX_GPIO119__FUNC_JTMS_SEL1 (MTK_PIN_NO(119) | 1)
> +#define PINMUX_GPIO119__FUNC_UDI_TMS (MTK_PIN_NO(119) | 2)
> +#define PINMUX_GPIO119__FUNC_DFD_TMS (MTK_PIN_NO(119) | 3)
> +#define PINMUX_GPIO119__FUNC_SPM_JTAG_TMS (MTK_PIN_NO(119) | 4)
> +#define PINMUX_GPIO119__FUNC_SCP_JTAG_TMS (MTK_PIN_NO(119) | 5)
> +#define PINMUX_GPIO119__FUNC_ADSP_JTAG_TMS (MTK_PIN_NO(119) | 6)
> +
> +#define PINMUX_GPIO120__FUNC_GPIO120 (MTK_PIN_NO(120) | 0)
> +#define PINMUX_GPIO120__FUNC_JTCK_SEL1 (MTK_PIN_NO(120) | 1)
> +#define PINMUX_GPIO120__FUNC_UDI_TCK (MTK_PIN_NO(120) | 2)
> +#define PINMUX_GPIO120__FUNC_DFD_TCK_XI (MTK_PIN_NO(120) | 3)
> +#define PINMUX_GPIO120__FUNC_SPM_JTAG_TCK (MTK_PIN_NO(120) | 4)
> +#define PINMUX_GPIO120__FUNC_SCP_JTAG_TCK (MTK_PIN_NO(120) | 5)
> +#define PINMUX_GPIO120__FUNC_ADSP_JTAG_TCK (MTK_PIN_NO(120) | 6)
> +
> +#define PINMUX_GPIO121__FUNC_GPIO121 (MTK_PIN_NO(121) | 0)
> +#define PINMUX_GPIO121__FUNC_JTDI_SEL1 (MTK_PIN_NO(121) | 1)
> +#define PINMUX_GPIO121__FUNC_UDI_TDI (MTK_PIN_NO(121) | 2)
> +#define PINMUX_GPIO121__FUNC_DFD_TDI (MTK_PIN_NO(121) | 3)
> +#define PINMUX_GPIO121__FUNC_SPM_JTAG_TDI (MTK_PIN_NO(121) | 4)
> +#define PINMUX_GPIO121__FUNC_SCP_JTAG_TDI (MTK_PIN_NO(121) | 5)
> +#define PINMUX_GPIO121__FUNC_ADSP_JTAG_TDI (MTK_PIN_NO(121) | 6)
> +
> +#define PINMUX_GPIO122__FUNC_GPIO122 (MTK_PIN_NO(122) | 0)
> +#define PINMUX_GPIO122__FUNC_JTDO_SEL1 (MTK_PIN_NO(122) | 1)
> +#define PINMUX_GPIO122__FUNC_UDI_TDO (MTK_PIN_NO(122) | 2)
> +#define PINMUX_GPIO122__FUNC_DFD_TDO (MTK_PIN_NO(122) | 3)
> +#define PINMUX_GPIO122__FUNC_SPM_JTAG_TDO (MTK_PIN_NO(122) | 4)
> +#define PINMUX_GPIO122__FUNC_SCP_JTAG_TDO (MTK_PIN_NO(122) | 5)
> +#define PINMUX_GPIO122__FUNC_ADSP_JTAG_TDO (MTK_PIN_NO(122) | 6)
> +
> +#define PINMUX_GPIO123__FUNC_GPIO123 (MTK_PIN_NO(123) | 0)
> +#define PINMUX_GPIO123__FUNC_JTRSTN_SEL1 (MTK_PIN_NO(123) | 1)
> +#define PINMUX_GPIO123__FUNC_UDI_NTRST (MTK_PIN_NO(123) | 2)
> +#define PINMUX_GPIO123__FUNC_SPM_JTAG_TRSTN (MTK_PIN_NO(123) | 4)
> +#define PINMUX_GPIO123__FUNC_SCP_JTAG_TRSTN (MTK_PIN_NO(123) | 5)
> +#define PINMUX_GPIO123__FUNC_ADSP_JTAG_TRSTN (MTK_PIN_NO(123) | 6)
> +
> +#define PINMUX_GPIO124__FUNC_GPIO124 (MTK_PIN_NO(124) | 0)
> +#define PINMUX_GPIO124__FUNC_CMMCLK0 (MTK_PIN_NO(124) | 1)
> +#define PINMUX_GPIO124__FUNC_CLKM0 (MTK_PIN_NO(124) | 2)
> +#define PINMUX_GPIO124__FUNC_PWM0 (MTK_PIN_NO(124) | 3)
> +
> +#define PINMUX_GPIO125__FUNC_GPIO125 (MTK_PIN_NO(125) | 0)
> +#define PINMUX_GPIO125__FUNC_CMMCLK1 (MTK_PIN_NO(125) | 1)
> +#define PINMUX_GPIO125__FUNC_CLKM1 (MTK_PIN_NO(125) | 2)
> +#define PINMUX_GPIO125__FUNC_PWM1 (MTK_PIN_NO(125) | 3)
> +#define PINMUX_GPIO125__FUNC_DBG_MON_B0 (MTK_PIN_NO(125) | 7)
> +
> +#define PINMUX_GPIO126__FUNC_GPIO126 (MTK_PIN_NO(126) | 0)
> +#define PINMUX_GPIO126__FUNC_CMMCLK2 (MTK_PIN_NO(126) | 1)
> +#define PINMUX_GPIO126__FUNC_CLKM2 (MTK_PIN_NO(126) | 2)
> +#define PINMUX_GPIO126__FUNC_PWM2 (MTK_PIN_NO(126) | 3)
> +#define PINMUX_GPIO126__FUNC_DBG_MON_B1 (MTK_PIN_NO(126) | 7)
> +
> +#define PINMUX_GPIO127__FUNC_GPIO127 (MTK_PIN_NO(127) | 0)
> +#define PINMUX_GPIO127__FUNC_SCL0 (MTK_PIN_NO(127) | 1)
> +#define PINMUX_GPIO127__FUNC_SCP_SCL0 (MTK_PIN_NO(127) | 4)
> +#define PINMUX_GPIO127__FUNC_SCP_SCL1 (MTK_PIN_NO(127) | 5)
> +
> +#define PINMUX_GPIO128__FUNC_GPIO128 (MTK_PIN_NO(128) | 0)
> +#define PINMUX_GPIO128__FUNC_SDA0 (MTK_PIN_NO(128) | 1)
> +#define PINMUX_GPIO128__FUNC_SCP_SDA0 (MTK_PIN_NO(128) | 4)
> +#define PINMUX_GPIO128__FUNC_SCP_SDA1 (MTK_PIN_NO(128) | 5)
> +
> +#define PINMUX_GPIO129__FUNC_GPIO129 (MTK_PIN_NO(129) | 0)
> +#define PINMUX_GPIO129__FUNC_SCL1 (MTK_PIN_NO(129) | 1)
> +#define PINMUX_GPIO129__FUNC_SCP_SCL0 (MTK_PIN_NO(129) | 4)
> +#define PINMUX_GPIO129__FUNC_SCP_SCL1 (MTK_PIN_NO(129) | 5)
> +#define PINMUX_GPIO129__FUNC_DBG_MON_B4 (MTK_PIN_NO(129) | 7)
> +
> +#define PINMUX_GPIO130__FUNC_GPIO130 (MTK_PIN_NO(130) | 0)
> +#define PINMUX_GPIO130__FUNC_SDA1 (MTK_PIN_NO(130) | 1)
> +#define PINMUX_GPIO130__FUNC_SCP_SDA0 (MTK_PIN_NO(130) | 4)
> +#define PINMUX_GPIO130__FUNC_SCP_SDA1 (MTK_PIN_NO(130) | 5)
> +#define PINMUX_GPIO130__FUNC_DBG_MON_B5 (MTK_PIN_NO(130) | 7)
> +
> +#define PINMUX_GPIO131__FUNC_GPIO131 (MTK_PIN_NO(131) | 0)
> +#define PINMUX_GPIO131__FUNC_SCL2 (MTK_PIN_NO(131) | 1)
> +#define PINMUX_GPIO131__FUNC_SSPM_UTXD_AO (MTK_PIN_NO(131) | 2)
> +#define PINMUX_GPIO131__FUNC_CONN_UART0_TXD (MTK_PIN_NO(131) | 3)
> +#define PINMUX_GPIO131__FUNC_SCP_SCL0 (MTK_PIN_NO(131) | 4)
> +#define PINMUX_GPIO131__FUNC_SCP_SCL1 (MTK_PIN_NO(131) | 5)
> +#define PINMUX_GPIO131__FUNC_DBG_MON_B6 (MTK_PIN_NO(131) | 7)
> +
> +#define PINMUX_GPIO132__FUNC_GPIO132 (MTK_PIN_NO(132) | 0)
> +#define PINMUX_GPIO132__FUNC_SDA2 (MTK_PIN_NO(132) | 1)
> +#define PINMUX_GPIO132__FUNC_SSPM_URXD_AO (MTK_PIN_NO(132) | 2)
> +#define PINMUX_GPIO132__FUNC_CONN_UART0_RXD (MTK_PIN_NO(132) | 3)
> +#define PINMUX_GPIO132__FUNC_SCP_SDA0 (MTK_PIN_NO(132) | 4)
> +#define PINMUX_GPIO132__FUNC_SCP_SDA1 (MTK_PIN_NO(132) | 5)
> +#define PINMUX_GPIO132__FUNC_DBG_MON_B7 (MTK_PIN_NO(132) | 7)
> +
> +#define PINMUX_GPIO133__FUNC_GPIO133 (MTK_PIN_NO(133) | 0)
> +#define PINMUX_GPIO133__FUNC_SCL3 (MTK_PIN_NO(133) | 1)
> +#define PINMUX_GPIO133__FUNC_SCP_SCL0 (MTK_PIN_NO(133) | 4)
> +#define PINMUX_GPIO133__FUNC_SCP_SCL1 (MTK_PIN_NO(133) | 5)
> +#define PINMUX_GPIO133__FUNC_DBG_MON_B8 (MTK_PIN_NO(133) | 7)
> +
> +#define PINMUX_GPIO134__FUNC_GPIO134 (MTK_PIN_NO(134) | 0)
> +#define PINMUX_GPIO134__FUNC_SDA3 (MTK_PIN_NO(134) | 1)
> +#define PINMUX_GPIO134__FUNC_GPS_PPS (MTK_PIN_NO(134) | 3)
> +#define PINMUX_GPIO134__FUNC_SCP_SDA0 (MTK_PIN_NO(134) | 4)
> +#define PINMUX_GPIO134__FUNC_SCP_SDA1 (MTK_PIN_NO(134) | 5)
> +#define PINMUX_GPIO134__FUNC_DBG_MON_B9 (MTK_PIN_NO(134) | 7)
> +
> +#define PINMUX_GPIO135__FUNC_GPIO135 (MTK_PIN_NO(135) | 0)
> +#define PINMUX_GPIO135__FUNC_SCL4 (MTK_PIN_NO(135) | 1)
> +#define PINMUX_GPIO135__FUNC_TP_UTXD1_AO (MTK_PIN_NO(135) | 2)
> +#define PINMUX_GPIO135__FUNC_UTXD1 (MTK_PIN_NO(135) | 3)
> +#define PINMUX_GPIO135__FUNC_SCP_SCL0 (MTK_PIN_NO(135) | 4)
> +#define PINMUX_GPIO135__FUNC_SCP_SCL1 (MTK_PIN_NO(135) | 5)
> +#define PINMUX_GPIO135__FUNC_DBG_MON_B10 (MTK_PIN_NO(135) | 7)
> +
> +#define PINMUX_GPIO136__FUNC_GPIO136 (MTK_PIN_NO(136) | 0)
> +#define PINMUX_GPIO136__FUNC_SDA4 (MTK_PIN_NO(136) | 1)
> +#define PINMUX_GPIO136__FUNC_TP_URXD1_AO (MTK_PIN_NO(136) | 2)
> +#define PINMUX_GPIO136__FUNC_URXD1 (MTK_PIN_NO(136) | 3)
> +#define PINMUX_GPIO136__FUNC_SCP_SDA0 (MTK_PIN_NO(136) | 4)
> +#define PINMUX_GPIO136__FUNC_SCP_SDA1 (MTK_PIN_NO(136) | 5)
> +#define PINMUX_GPIO136__FUNC_DBG_MON_B11 (MTK_PIN_NO(136) | 7)
> +
> +#define PINMUX_GPIO137__FUNC_GPIO137 (MTK_PIN_NO(137) | 0)
> +#define PINMUX_GPIO137__FUNC_SCL5 (MTK_PIN_NO(137) | 1)
> +#define PINMUX_GPIO137__FUNC_UTXD2 (MTK_PIN_NO(137) | 2)
> +#define PINMUX_GPIO137__FUNC_UCTS1 (MTK_PIN_NO(137) | 3)
> +#define PINMUX_GPIO137__FUNC_SCP_SCL0 (MTK_PIN_NO(137) | 4)
> +#define PINMUX_GPIO137__FUNC_SCP_SCL1 (MTK_PIN_NO(137) | 5)
> +
> +#define PINMUX_GPIO138__FUNC_GPIO138 (MTK_PIN_NO(138) | 0)
> +#define PINMUX_GPIO138__FUNC_SDA5 (MTK_PIN_NO(138) | 1)
> +#define PINMUX_GPIO138__FUNC_URXD2 (MTK_PIN_NO(138) | 2)
> +#define PINMUX_GPIO138__FUNC_URTS1 (MTK_PIN_NO(138) | 3)
> +#define PINMUX_GPIO138__FUNC_SCP_SDA0 (MTK_PIN_NO(138) | 4)
> +#define PINMUX_GPIO138__FUNC_SCP_SDA1 (MTK_PIN_NO(138) | 5)
> +
> +#define PINMUX_GPIO139__FUNC_GPIO139 (MTK_PIN_NO(139) | 0)
> +#define PINMUX_GPIO139__FUNC_SCL6 (MTK_PIN_NO(139) | 1)
> +#define PINMUX_GPIO139__FUNC_UTXD1 (MTK_PIN_NO(139) | 2)
> +#define PINMUX_GPIO139__FUNC_TP_UTXD1_AO (MTK_PIN_NO(139) | 3)
> +#define PINMUX_GPIO139__FUNC_SCP_SCL0 (MTK_PIN_NO(139) | 4)
> +#define PINMUX_GPIO139__FUNC_SCP_SCL1 (MTK_PIN_NO(139) | 5)
> +#define PINMUX_GPIO139__FUNC_DBG_MON_B12 (MTK_PIN_NO(139) | 7)
> +
> +#define PINMUX_GPIO140__FUNC_GPIO140 (MTK_PIN_NO(140) | 0)
> +#define PINMUX_GPIO140__FUNC_SDA6 (MTK_PIN_NO(140) | 1)
> +#define PINMUX_GPIO140__FUNC_URXD1 (MTK_PIN_NO(140) | 2)
> +#define PINMUX_GPIO140__FUNC_TP_URXD1_AO (MTK_PIN_NO(140) | 3)
> +#define PINMUX_GPIO140__FUNC_SCP_SDA0 (MTK_PIN_NO(140) | 4)
> +#define PINMUX_GPIO140__FUNC_SCP_SDA1 (MTK_PIN_NO(140) | 5)
> +#define PINMUX_GPIO140__FUNC_DBG_MON_B13 (MTK_PIN_NO(140) | 7)
> +
> +#define PINMUX_GPIO141__FUNC_GPIO141 (MTK_PIN_NO(141) | 0)
> +#define PINMUX_GPIO141__FUNC_SCL7 (MTK_PIN_NO(141) | 1)
> +#define PINMUX_GPIO141__FUNC_URTS0 (MTK_PIN_NO(141) | 2)
> +#define PINMUX_GPIO141__FUNC_TP_URTS1_AO (MTK_PIN_NO(141) | 3)
> +#define PINMUX_GPIO141__FUNC_SCP_SCL0 (MTK_PIN_NO(141) | 4)
> +#define PINMUX_GPIO141__FUNC_SCP_SCL1 (MTK_PIN_NO(141) | 5)
> +#define PINMUX_GPIO141__FUNC_UDI_TCK (MTK_PIN_NO(141) | 6)
> +#define PINMUX_GPIO141__FUNC_DBG_MON_B14 (MTK_PIN_NO(141) | 7)
> +
> +#define PINMUX_GPIO142__FUNC_GPIO142 (MTK_PIN_NO(142) | 0)
> +#define PINMUX_GPIO142__FUNC_SDA7 (MTK_PIN_NO(142) | 1)
> +#define PINMUX_GPIO142__FUNC_UCTS0 (MTK_PIN_NO(142) | 2)
> +#define PINMUX_GPIO142__FUNC_TP_UCTS1_AO (MTK_PIN_NO(142) | 3)
> +#define PINMUX_GPIO142__FUNC_SCP_SDA0 (MTK_PIN_NO(142) | 4)
> +#define PINMUX_GPIO142__FUNC_SCP_SDA1 (MTK_PIN_NO(142) | 5)
> +
> +#define PINMUX_GPIO143__FUNC_GPIO143 (MTK_PIN_NO(143) | 0)
> +#define PINMUX_GPIO143__FUNC_SCL8 (MTK_PIN_NO(143) | 1)
> +#define PINMUX_GPIO143__FUNC_SCP_SCL0 (MTK_PIN_NO(143) | 4)
> +#define PINMUX_GPIO143__FUNC_SCP_SCL1 (MTK_PIN_NO(143) | 5)
> +#define PINMUX_GPIO143__FUNC_DBG_MON_B16 (MTK_PIN_NO(143) | 7)
> +
> +#define PINMUX_GPIO144__FUNC_GPIO144 (MTK_PIN_NO(144) | 0)
> +#define PINMUX_GPIO144__FUNC_SDA8 (MTK_PIN_NO(144) | 1)
> +#define PINMUX_GPIO144__FUNC_SCP_SDA0 (MTK_PIN_NO(144) | 4)
> +#define PINMUX_GPIO144__FUNC_SCP_SDA1 (MTK_PIN_NO(144) | 5)
> +#define PINMUX_GPIO144__FUNC_DBG_MON_B17 (MTK_PIN_NO(144) | 7)
> +
> +#define PINMUX_GPIO145__FUNC_GPIO145 (MTK_PIN_NO(145) | 0)
> +#define PINMUX_GPIO145__FUNC_SCL9 (MTK_PIN_NO(145) | 1)
> +#define PINMUX_GPIO145__FUNC_CMVREF1 (MTK_PIN_NO(145) | 2)
> +#define PINMUX_GPIO145__FUNC_GPS_PPS (MTK_PIN_NO(145) | 3)
> +#define PINMUX_GPIO145__FUNC_SCP_SCL0 (MTK_PIN_NO(145) | 4)
> +#define PINMUX_GPIO145__FUNC_SCP_SCL1 (MTK_PIN_NO(145) | 5)
> +#define PINMUX_GPIO145__FUNC_DBG_MON_B18 (MTK_PIN_NO(145) | 7)
> +
> +#define PINMUX_GPIO146__FUNC_GPIO146 (MTK_PIN_NO(146) | 0)
> +#define PINMUX_GPIO146__FUNC_SDA9 (MTK_PIN_NO(146) | 1)
> +#define PINMUX_GPIO146__FUNC_CMVREF0 (MTK_PIN_NO(146) | 2)
> +#define PINMUX_GPIO146__FUNC_SCP_SDA0 (MTK_PIN_NO(146) | 4)
> +#define PINMUX_GPIO146__FUNC_SCP_SDA1 (MTK_PIN_NO(146) | 5)
> +#define PINMUX_GPIO146__FUNC_DBG_MON_B19 (MTK_PIN_NO(146) | 7)
> +
> +#define PINMUX_GPIO147__FUNC_GPIO147 (MTK_PIN_NO(147) | 0)
> +#define PINMUX_GPIO147__FUNC_CMFLASH0 (MTK_PIN_NO(147) | 1)
> +#define PINMUX_GPIO147__FUNC_LVTS_SDI (MTK_PIN_NO(147) | 2)
> +#define PINMUX_GPIO147__FUNC_DPI_DATA12 (MTK_PIN_NO(147) | 3)
> +#define PINMUX_GPIO147__FUNC_TP_GPIO0_AO (MTK_PIN_NO(147) | 4)
> +#define PINMUX_GPIO147__FUNC_ANT_SEL3 (MTK_PIN_NO(147) | 5)
> +#define PINMUX_GPIO147__FUNC_DFD_TCK_XI (MTK_PIN_NO(147) | 6)
> +#define PINMUX_GPIO147__FUNC_DBG_MON_B20 (MTK_PIN_NO(147) | 7)
> +
> +#define PINMUX_GPIO148__FUNC_GPIO148 (MTK_PIN_NO(148) | 0)
> +#define PINMUX_GPIO148__FUNC_CMFLASH1 (MTK_PIN_NO(148) | 1)
> +#define PINMUX_GPIO148__FUNC_LVTS_SCF (MTK_PIN_NO(148) | 2)
> +#define PINMUX_GPIO148__FUNC_DPI_DATA13 (MTK_PIN_NO(148) | 3)
> +#define PINMUX_GPIO148__FUNC_TP_GPIO1_AO (MTK_PIN_NO(148) | 4)
> +#define PINMUX_GPIO148__FUNC_ANT_SEL4 (MTK_PIN_NO(148) | 5)
> +#define PINMUX_GPIO148__FUNC_DFD_TMS (MTK_PIN_NO(148) | 6)
> +#define PINMUX_GPIO148__FUNC_DBG_MON_B21 (MTK_PIN_NO(148) | 7)
> +
> +#define PINMUX_GPIO149__FUNC_GPIO149 (MTK_PIN_NO(149) | 0)
> +#define PINMUX_GPIO149__FUNC_CMFLASH2 (MTK_PIN_NO(149) | 1)
> +#define PINMUX_GPIO149__FUNC_CLKM0 (MTK_PIN_NO(149) | 2)
> +#define PINMUX_GPIO149__FUNC_DPI_DATA14 (MTK_PIN_NO(149) | 3)
> +#define PINMUX_GPIO149__FUNC_TP_GPIO2_AO (MTK_PIN_NO(149) | 4)
> +#define PINMUX_GPIO149__FUNC_ANT_SEL5 (MTK_PIN_NO(149) | 5)
> +#define PINMUX_GPIO149__FUNC_DFD_TDI (MTK_PIN_NO(149) | 6)
> +#define PINMUX_GPIO149__FUNC_DBG_MON_B22 (MTK_PIN_NO(149) | 7)
> +
> +#define PINMUX_GPIO150__FUNC_GPIO150 (MTK_PIN_NO(150) | 0)
> +#define PINMUX_GPIO150__FUNC_CLKM1 (MTK_PIN_NO(150) | 2)
> +#define PINMUX_GPIO150__FUNC_DPI_DATA15 (MTK_PIN_NO(150) | 3)
> +#define PINMUX_GPIO150__FUNC_TP_GPIO3_AO (MTK_PIN_NO(150) | 4)
> +#define PINMUX_GPIO150__FUNC_ANT_SEL6 (MTK_PIN_NO(150) | 5)
> +#define PINMUX_GPIO150__FUNC_DFD_TDO (MTK_PIN_NO(150) | 6)
> +#define PINMUX_GPIO150__FUNC_DBG_MON_B23 (MTK_PIN_NO(150) | 7)
> +
> +#define PINMUX_GPIO151__FUNC_GPIO151 (MTK_PIN_NO(151) | 0)
> +#define PINMUX_GPIO151__FUNC_GPS_L1_ELNA_EN (MTK_PIN_NO(151) | 1)
> +#define PINMUX_GPIO151__FUNC_CLKM2 (MTK_PIN_NO(151) | 2)
> +#define PINMUX_GPIO151__FUNC_DPI_DATA16 (MTK_PIN_NO(151) | 3)
> +#define PINMUX_GPIO151__FUNC_TP_GPIO4_AO (MTK_PIN_NO(151) | 4)
> +#define PINMUX_GPIO151__FUNC_ANT_SEL7 (MTK_PIN_NO(151) | 5)
> +#define PINMUX_GPIO151__FUNC_UDI_TMS (MTK_PIN_NO(151) | 6)
> +#define PINMUX_GPIO151__FUNC_DBG_MON_B24 (MTK_PIN_NO(151) | 7)
> +
> +#define PINMUX_GPIO152__FUNC_GPIO152 (MTK_PIN_NO(152) | 0)
> +#define PINMUX_GPIO152__FUNC_CLKM3 (MTK_PIN_NO(152) | 2)
> +#define PINMUX_GPIO152__FUNC_DPI_DATA17 (MTK_PIN_NO(152) | 3)
> +#define PINMUX_GPIO152__FUNC_TP_GPIO5_AO (MTK_PIN_NO(152) | 4)
> +
> +#define PINMUX_GPIO153__FUNC_GPIO153 (MTK_PIN_NO(153) | 0)
> +#define PINMUX_GPIO153__FUNC_CONN_TCXOENA_REQ (MTK_PIN_NO(153) | 1)
> +#define PINMUX_GPIO153__FUNC_DPI_DATA18 (MTK_PIN_NO(153) | 3)
> +#define PINMUX_GPIO153__FUNC_TP_GPIO6_AO (MTK_PIN_NO(153) | 4)
> +#define PINMUX_GPIO153__FUNC_UDI_TDI (MTK_PIN_NO(153) | 6)
> +#define PINMUX_GPIO153__FUNC_DBG_MON_B26 (MTK_PIN_NO(153) | 7)
> +
> +#define PINMUX_GPIO154__FUNC_GPIO154 (MTK_PIN_NO(154) | 0)
> +#define PINMUX_GPIO154__FUNC_PWM0 (MTK_PIN_NO(154) | 1)
> +#define PINMUX_GPIO154__FUNC_CMVREF2 (MTK_PIN_NO(154) | 2)
> +#define PINMUX_GPIO154__FUNC_DPI_DATA19 (MTK_PIN_NO(154) | 3)
> +#define PINMUX_GPIO154__FUNC_TP_GPIO7_AO (MTK_PIN_NO(154) | 4)
> +#define PINMUX_GPIO154__FUNC_UDI_TDO (MTK_PIN_NO(154) | 6)
> +#define PINMUX_GPIO154__FUNC_DBG_MON_B27 (MTK_PIN_NO(154) | 7)
> +
> +#define PINMUX_GPIO155__FUNC_GPIO155 (MTK_PIN_NO(155) | 0)
> +#define PINMUX_GPIO155__FUNC_PWM1 (MTK_PIN_NO(155) | 1)
> +#define PINMUX_GPIO155__FUNC_CMVREF1 (MTK_PIN_NO(155) | 2)
> +#define PINMUX_GPIO155__FUNC_DPI_DATA20 (MTK_PIN_NO(155) | 3)
> +#define PINMUX_GPIO155__FUNC_UDI_NTRST (MTK_PIN_NO(155) | 6)
> +#define PINMUX_GPIO155__FUNC_DBG_MON_B28 (MTK_PIN_NO(155) | 7)
> +
> +#define PINMUX_GPIO156__FUNC_GPIO156 (MTK_PIN_NO(156) | 0)
> +#define PINMUX_GPIO156__FUNC_PWM2 (MTK_PIN_NO(156) | 1)
> +#define PINMUX_GPIO156__FUNC_CMVREF0 (MTK_PIN_NO(156) | 2)
> +#define PINMUX_GPIO156__FUNC_DPI_DATA21 (MTK_PIN_NO(156) | 3)
> +
> +#define PINMUX_GPIO157__FUNC_GPIO157 (MTK_PIN_NO(157) | 0)
> +#define PINMUX_GPIO157__FUNC_PWRAP_SPI0_CSN (MTK_PIN_NO(157) | 1)
> +
> +#define PINMUX_GPIO158__FUNC_GPIO158 (MTK_PIN_NO(158) | 0)
> +#define PINMUX_GPIO158__FUNC_PWRAP_SPI0_CK (MTK_PIN_NO(158) | 1)
> +
> +#define PINMUX_GPIO159__FUNC_GPIO159 (MTK_PIN_NO(159) | 0)
> +#define PINMUX_GPIO159__FUNC_PWRAP_SPI0_MO (MTK_PIN_NO(159) | 1)
> +#define PINMUX_GPIO159__FUNC_PWRAP_SPI0_MI (MTK_PIN_NO(159) | 2)
> +
> +#define PINMUX_GPIO160__FUNC_GPIO160 (MTK_PIN_NO(160) | 0)
> +#define PINMUX_GPIO160__FUNC_PWRAP_SPI0_MI (MTK_PIN_NO(160) | 1)
> +#define PINMUX_GPIO160__FUNC_PWRAP_SPI0_MO (MTK_PIN_NO(160) | 2)
> +
> +#define PINMUX_GPIO161__FUNC_GPIO161 (MTK_PIN_NO(161) | 0)
> +#define PINMUX_GPIO161__FUNC_SRCLKENA0 (MTK_PIN_NO(161) | 1)
> +
> +#define PINMUX_GPIO162__FUNC_GPIO162 (MTK_PIN_NO(162) | 0)
> +#define PINMUX_GPIO162__FUNC_SRCLKENA1 (MTK_PIN_NO(162) | 1)
> +#define PINMUX_GPIO162__FUNC_DBG_MON_A31 (MTK_PIN_NO(162) | 7)
> +
> +#define PINMUX_GPIO163__FUNC_GPIO163 (MTK_PIN_NO(163) | 0)
> +#define PINMUX_GPIO163__FUNC_SCP_VREQ_VAO (MTK_PIN_NO(163) | 1)
> +#define PINMUX_GPIO163__FUNC_DVFSRC_EXT_REQ (MTK_PIN_NO(163) | 2)
> +
> +#define PINMUX_GPIO164__FUNC_GPIO164 (MTK_PIN_NO(164) | 0)
> +#define PINMUX_GPIO164__FUNC_RTC32K_CK (MTK_PIN_NO(164) | 1)
> +
> +#define PINMUX_GPIO165__FUNC_GPIO165 (MTK_PIN_NO(165) | 0)
> +#define PINMUX_GPIO165__FUNC_WATCHDOG (MTK_PIN_NO(165) | 1)
> +
> +#define PINMUX_GPIO166__FUNC_GPIO166 (MTK_PIN_NO(166) | 0)
> +#define PINMUX_GPIO166__FUNC_AUD_CLK_MOSI (MTK_PIN_NO(166) | 1)
> +#define PINMUX_GPIO166__FUNC_AUD_CLK_MISO (MTK_PIN_NO(166) | 2)
> +#define PINMUX_GPIO166__FUNC_I2S1_MCK (MTK_PIN_NO(166) | 3)
> +
> +#define PINMUX_GPIO167__FUNC_GPIO167 (MTK_PIN_NO(167) | 0)
> +#define PINMUX_GPIO167__FUNC_AUD_SYNC_MOSI (MTK_PIN_NO(167) | 1)
> +#define PINMUX_GPIO167__FUNC_AUD_SYNC_MISO (MTK_PIN_NO(167) | 2)
> +#define PINMUX_GPIO167__FUNC_I2S1_BCK (MTK_PIN_NO(167) | 3)
> +
> +#define PINMUX_GPIO168__FUNC_GPIO168 (MTK_PIN_NO(168) | 0)
> +#define PINMUX_GPIO168__FUNC_AUD_DAT_MOSI0 (MTK_PIN_NO(168) | 1)
> +#define PINMUX_GPIO168__FUNC_AUD_DAT_MISO0 (MTK_PIN_NO(168) | 2)
> +#define PINMUX_GPIO168__FUNC_I2S1_LRCK (MTK_PIN_NO(168) | 3)
> +
> +#define PINMUX_GPIO169__FUNC_GPIO169 (MTK_PIN_NO(169) | 0)
> +#define PINMUX_GPIO169__FUNC_AUD_DAT_MOSI1 (MTK_PIN_NO(169) | 1)
> +#define PINMUX_GPIO169__FUNC_AUD_DAT_MISO1 (MTK_PIN_NO(169) | 2)
> +#define PINMUX_GPIO169__FUNC_I2S1_DO (MTK_PIN_NO(169) | 3)
> +
> +#define PINMUX_GPIO170__FUNC_GPIO170 (MTK_PIN_NO(170) | 0)
> +#define PINMUX_GPIO170__FUNC_AUD_CLK_MISO (MTK_PIN_NO(170) | 1)
> +#define PINMUX_GPIO170__FUNC_AUD_CLK_MOSI (MTK_PIN_NO(170) | 2)
> +#define PINMUX_GPIO170__FUNC_I2S2_MCK (MTK_PIN_NO(170) | 3)
> +
> +#define PINMUX_GPIO171__FUNC_GPIO171 (MTK_PIN_NO(171) | 0)
> +#define PINMUX_GPIO171__FUNC_AUD_SYNC_MISO (MTK_PIN_NO(171) | 1)
> +#define PINMUX_GPIO171__FUNC_AUD_SYNC_MOSI (MTK_PIN_NO(171) | 2)
> +#define PINMUX_GPIO171__FUNC_I2S2_BCK (MTK_PIN_NO(171) | 3)
> +
> +#define PINMUX_GPIO172__FUNC_GPIO172 (MTK_PIN_NO(172) | 0)
> +#define PINMUX_GPIO172__FUNC_AUD_DAT_MISO0 (MTK_PIN_NO(172) | 1)
> +#define PINMUX_GPIO172__FUNC_AUD_DAT_MOSI0 (MTK_PIN_NO(172) | 2)
> +#define PINMUX_GPIO172__FUNC_I2S2_LRCK (MTK_PIN_NO(172) | 3)
> +#define PINMUX_GPIO172__FUNC_VOW_DAT_MISO (MTK_PIN_NO(172) | 4)
> +
> +#define PINMUX_GPIO173__FUNC_GPIO173 (MTK_PIN_NO(173) | 0)
> +#define PINMUX_GPIO173__FUNC_AUD_DAT_MISO1 (MTK_PIN_NO(173) | 1)
> +#define PINMUX_GPIO173__FUNC_AUD_DAT_MOSI1 (MTK_PIN_NO(173) | 2)
> +#define PINMUX_GPIO173__FUNC_I2S2_DI (MTK_PIN_NO(173) | 3)
> +#define PINMUX_GPIO173__FUNC_VOW_CLK_MISO (MTK_PIN_NO(173) | 4)
> +
> +#define PINMUX_GPIO174__FUNC_GPIO174 (MTK_PIN_NO(174) | 0)
> +#define PINMUX_GPIO174__FUNC_CONN_TOP_CLK (MTK_PIN_NO(174) | 1)
> +#define PINMUX_GPIO174__FUNC_AUXIF_CLK (MTK_PIN_NO(174) | 2)
> +#define PINMUX_GPIO174__FUNC_DFD_TCK_XI (MTK_PIN_NO(174) | 3)
> +#define PINMUX_GPIO174__FUNC_DBG_MON_B3 (MTK_PIN_NO(174) | 7)
> +
> +#define PINMUX_GPIO175__FUNC_GPIO175 (MTK_PIN_NO(175) | 0)
> +#define PINMUX_GPIO175__FUNC_CONN_TOP_DATA (MTK_PIN_NO(175) | 1)
> +#define PINMUX_GPIO175__FUNC_AUXIF_ST (MTK_PIN_NO(175) | 2)
> +#define PINMUX_GPIO175__FUNC_DFD_TMS (MTK_PIN_NO(175) | 3)
> +#define PINMUX_GPIO175__FUNC_DBG_MON_B15 (MTK_PIN_NO(175) | 7)
> +
> +#define PINMUX_GPIO176__FUNC_GPIO176 (MTK_PIN_NO(176) | 0)
> +#define PINMUX_GPIO176__FUNC_CONN_BT_CLK (MTK_PIN_NO(176) | 1)
> +#define PINMUX_GPIO176__FUNC_DFD_TDI (MTK_PIN_NO(176) | 3)
> +#define PINMUX_GPIO176__FUNC_DBG_MON_B2 (MTK_PIN_NO(176) | 7)
> +
> +#define PINMUX_GPIO177__FUNC_GPIO177 (MTK_PIN_NO(177) | 0)
> +#define PINMUX_GPIO177__FUNC_CONN_BT_DATA (MTK_PIN_NO(177) | 1)
> +#define PINMUX_GPIO177__FUNC_DFD_TDO (MTK_PIN_NO(177) | 3)
> +
> +#define PINMUX_GPIO178__FUNC_GPIO178 (MTK_PIN_NO(178) | 0)
> +#define PINMUX_GPIO178__FUNC_CONN_HRST_B (MTK_PIN_NO(178) | 1)
> +#define PINMUX_GPIO178__FUNC_UDI_TMS (MTK_PIN_NO(178) | 3)
> +#define PINMUX_GPIO178__FUNC_DBG_MON_B25 (MTK_PIN_NO(178) | 7)
> +
> +#define PINMUX_GPIO179__FUNC_GPIO179 (MTK_PIN_NO(179) | 0)
> +#define PINMUX_GPIO179__FUNC_CONN_WB_PTA (MTK_PIN_NO(179) | 1)
> +#define PINMUX_GPIO179__FUNC_UDI_TCK (MTK_PIN_NO(179) | 3)
> +#define PINMUX_GPIO179__FUNC_DBG_MON_B29 (MTK_PIN_NO(179) | 7)
> +
> +#define PINMUX_GPIO180__FUNC_GPIO180 (MTK_PIN_NO(180) | 0)
> +#define PINMUX_GPIO180__FUNC_CONN_WF_CTRL0 (MTK_PIN_NO(180) | 1)
> +#define PINMUX_GPIO180__FUNC_UDI_TDI (MTK_PIN_NO(180) | 3)
> +
> +#define PINMUX_GPIO181__FUNC_GPIO181 (MTK_PIN_NO(181) | 0)
> +#define PINMUX_GPIO181__FUNC_CONN_WF_CTRL1 (MTK_PIN_NO(181) | 1)
> +#define PINMUX_GPIO181__FUNC_UDI_TDO (MTK_PIN_NO(181) | 3)
> +
> +#define PINMUX_GPIO182__FUNC_GPIO182 (MTK_PIN_NO(182) | 0)
> +#define PINMUX_GPIO182__FUNC_CONN_WF_CTRL2 (MTK_PIN_NO(182) | 1)
> +#define PINMUX_GPIO182__FUNC_UDI_NTRST (MTK_PIN_NO(182) | 3)
> +
> +#define PINMUX_GPIO183__FUNC_GPIO183 (MTK_PIN_NO(183) | 0)
> +#define PINMUX_GPIO183__FUNC_SPMI_SCL (MTK_PIN_NO(183) | 1)
> +
> +#define PINMUX_GPIO184__FUNC_GPIO184 (MTK_PIN_NO(184) | 0)
> +#define PINMUX_GPIO184__FUNC_SPMI_SDA (MTK_PIN_NO(184) | 1)
> +
> +#endif /* __MT8168-PINFUNC_H */
> --
> 2.25.5
> 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

