Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 022CE4B0620
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Feb 2022 07:13:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235120AbiBJGMm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 10 Feb 2022 01:12:42 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:56096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232667AbiBJGMl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Feb 2022 01:12:41 -0500
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E484910CB;
        Wed,  9 Feb 2022 22:12:38 -0800 (PST)
X-UUID: 1a28371ed71f4b3b81bf7d2c688ce880-20220210
X-UUID: 1a28371ed71f4b3b81bf7d2c688ce880-20220210
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <guodong.liu@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 671854786; Thu, 10 Feb 2022 14:12:35 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 10 Feb 2022 14:12:35 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 10 Feb
 2022 14:12:35 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 10 Feb 2022 14:12:34 +0800
Message-ID: <d32ee4d044da083cdd4611960fd4906bec8fab9a.camel@mediatek.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: mt8186: add pinctrl file
 and binding document
From:   Guodong Liu <guodong.liu@mediatek.com>
To:     Rob Herring <robh@kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        Sean Wang <sean.wang@mediatek.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date:   Thu, 10 Feb 2022 14:12:34 +0800
In-Reply-To: <YgGjaa0lXBCTu7Hm@robh.at.kernel.org>
References: <20220121060120.10683-1-guodong.liu@mediatek.com>
         <20220121060120.10683-2-guodong.liu@mediatek.com>
         <YgGjaa0lXBCTu7Hm@robh.at.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK:  N
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,MAY_BE_FORGED,
        SPF_HELO_NONE,T_SCC_BODY_TEXT_LINE,T_SPF_TEMPERROR,UNPARSEABLE_RELAY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

-----Original Message-----
From: Rob Herring <robh@kernel.org>
To: Guodong Liu <guodong.liu@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <
matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>, Sean Wang <
sean.wang@mediatek.com>, linux-gpio@vger.kernel.org, 
devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: mt8186: add pinctrl
file and binding document
Date: Mon, 7 Feb 2022 16:55:37 -0600

On Fri, Jan 21, 2022 at 02:01:19PM +0800, Guodong Liu wrote:
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

These are banks which are all the same?

Hello Rob

These banks are not the same, and we will update it for next version.

Thanks
Guodong
> +
> +  reg-names:
> +    description: |
> +      Gpio base register names.
> +    maxItems: 8

Need to define the names.

Hello Rob

We will update it for next version.

Thanks
Guodong
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

s/_/-/

Hello Rob

We will update it for next version, include associated file "pinctrl-
paris.c" in pinctrl driver.

Thanks
Guodong

> +    type: boolean
> +    description: |
> +      Identifying i2c pins pull up/down type which is RSEL. It can
> support
> +      RSEL define or si unit value(ohm) to set different resistance.

Can't you tell this with values being >1000 or not?

Hello Rob

This is based on the MT8195 pinctrl driver(upstream to community )
,which use property "mediatek,rsel-resistance-in-si-unit" to identify
rsel define and si unit solution.
Only a small number of pins need to configure this pin config, the
resistance value may be less than 1000 in the future, which will cause
misjudgment.


Thanks
Guodong
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
> +
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

Is this supposed to be valid json-schema? It is, but not with it under 
'description'. And it will always fail because the 'description' lines 
are always true and multiple true cases makes oneOf false.

Hello Rob

We will update it for next version.

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

Dual license please.

Hello Rob

We will update it for next version.

Thanks

