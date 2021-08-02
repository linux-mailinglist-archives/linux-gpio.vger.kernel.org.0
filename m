Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 54D173DDF20
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Aug 2021 20:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhHBS3Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Aug 2021 14:29:16 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:37578 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229722AbhHBS3P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Aug 2021 14:29:15 -0400
Received: by mail-io1-f51.google.com with SMTP id r18so21425698iot.4;
        Mon, 02 Aug 2021 11:29:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7+tOOHaxwPSrU49hRCCqH93xx1HETPlPYXYMuNfevBY=;
        b=HI3XKoEYwFkloTdtUtjWPsKJ6k8e7bJANskqYAehHq6Z/kE/DqQf+8yZ1ht4XdX4eg
         EkVD4nW/d8BNPGeaEiY+JSdGwG5Md1s10OH3Y3TsewU67w4Hj/VkDDJRGstSrMwikO6U
         twZJKhlfSxlGFn4fOVIO+NgOkysPpDIdcxh0E738OuJ0yMW6tdkUvaEJycmKQilhXQ2c
         0UKZ4fIaNvlruba+yu6ZsECu3GNowQ0odvTUyINbesnn7+Hnp/O2zYmNlML6CJ0OHpcA
         s0eczk5KDySKf6UUixGuvbQZx72w+13ufUOnVt6JSi7F9LJXAT8qvyqHD5iN4Chj2sAf
         0PRA==
X-Gm-Message-State: AOAM533VsISyzra+5rivOskH/9xsQuNjAhQ4UkD18FPhGWwoBlHfPFAh
        WjoDt030t6t12McDHh6lTg==
X-Google-Smtp-Source: ABdhPJxnL/CVhlH7Tg1JsZ3n6Y33Yvj05/KPtsjypQChy4ojfeUC3Kndz0y1KJAv1N4/wQMJ86W1eQ==
X-Received: by 2002:a6b:e70f:: with SMTP id b15mr3728269ioh.67.1627928944806;
        Mon, 02 Aug 2021 11:29:04 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id m26sm7636748ioo.23.2021.08.02.11.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 11:29:04 -0700 (PDT)
Received: (nullmailer pid 1360624 invoked by uid 1000);
        Mon, 02 Aug 2021 18:29:02 -0000
Date:   Mon, 2 Aug 2021 12:29:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Hsin-Yi Wang <hsinyi@chromium.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Enric Balletbo Serra <eballetbo@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Sean Wang <sean.wang@kernel.org>,
        Andy Teng <andy.teng@mediatek.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] dt-bindings: mediatek: convert pinctrl to yaml
Message-ID: <YQg5bjYwCCZQ7bR9@robh.at.kernel.org>
References: <20210730120937.1435204-1-hsinyi@chromium.org>
 <20210730120937.1435204-3-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210730120937.1435204-3-hsinyi@chromium.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jul 30, 2021 at 08:09:37PM +0800, Hsin-Yi Wang wrote:
> Convert mt65xx, mt6796, mt7622, mt8183 bindings to yaml.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> ---
> v1->v2:
> - fix comments in v1.
> - fix mt7622 where groups is not required for conf node.
> ---
>  .../pinctrl/mediatek,mt65xx-pinctrl.yaml      | 206 ++++++++
>  .../pinctrl/mediatek,mt6797-pinctrl.yaml      | 173 +++++++
>  .../pinctrl/mediatek,mt7622-pinctrl.yaml      | 416 +++++++++++++++
>  .../pinctrl/mediatek,mt8183-pinctrl.yaml      | 228 ++++++++
>  .../bindings/pinctrl/pinctrl-mt65xx.txt       | 156 ------
>  .../bindings/pinctrl/pinctrl-mt6797.txt       |  83 ---
>  .../bindings/pinctrl/pinctrl-mt7622.txt       | 490 ------------------
>  .../bindings/pinctrl/pinctrl-mt8183.txt       | 132 -----
>  8 files changed, 1023 insertions(+), 861 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt6797-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt65xx.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt6797.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt7622.txt
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-mt8183.txt
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> new file mode 100644
> index 0000000000000..f76c2c9cabe25
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml
> @@ -0,0 +1,206 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT65xx Pin Controller Device Tree Bindings
> +
> +maintainers:
> +  - Andy Teng <andy.teng@mediatek.com>
> +
> +description: |+
> +  The Mediatek's Pin controller is used to control SoC pins.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt2701-pinctrl
> +      - mediatek,mt2712-pinctrl
> +      - mediatek,mt6397-pinctrl
> +      - mediatek,mt7623-pinctrl
> +      - mediatek,mt8127-pinctrl
> +      - mediatek,mt8135-pinctrl
> +      - mediatek,mt8167-pinctrl
> +      - mediatek,mt8173-pinctrl
> +      - mediatek,mt8516-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  pins-are-numbered:
> +    $ref: /schemas/types.yaml#/definitions/flag
> +    description: |
> +      Specify the subnodes are using numbered pinmux to specify pins.
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +    description: |
> +      Number of cells in GPIO specifier. Since the generic GPIO
> +      binding is used, the amount of cells must be specified as 2. See the below
> +      mentioned gpio binding representation for description of particular cells.
> +
> +  mediatek,pctl-regmap:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 1
> +    maxItems: 2
> +    description: |
> +      Should be phandles of the syscfg node.
> +
> +  interrupt-controller: true
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 3
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - pins-are-numbered
> +  - gpio-controller
> +  - "#gpio-cells"
> +
> +patternProperties:
> +  '-[0-9]+$':
> +    type: object

       additionalProperties: false

That's going to cause validation failures as the pattern below doesn't 
match 'pins1' or 'pins'.

> +    patternProperties:
> +      '-pins':
> +        type: object

I recommend moving the 'additionalProperties' below to here. Easier to 
follow the indentation.

Same issues on the rest of the schemas.

> +        description: |
> +          A pinctrl node should contain at least one subnodes representing the
> +          pinctrl groups available on the machine. Each subnode will list the
> +          pins it needs, and how they should be configured, with regard to muxer
> +          configuration, pullups, drive strength, input enable/disable and input
> +          schmitt.
> +        $ref: "/schemas/pinctrl/pincfg-node.yaml"
> +
> +        properties:
> +          pinmux:
> +            description:
> +              integer array, represents gpio pin number and mux setting.
> +              Supported pin number and mux varies for different SoCs, and are
> +              defined as macros in <soc>-pinfunc.h directly.
> +
> +          bias-disable: true
> +
> +          bias-pull-up:
> +            description: |
> +              Besides generic pinconfig options, it can be used as the pull up
> +              settings for 2 pull resistors, R0 and R1. User can configure those
> +              special pins. Some macros have been defined for this usage, such
> +              as MTK_PUPD_SET_R1R0_00. See dt-bindings/pinctrl/mt65xx.h for
> +              valid arguments.
> +
> +          bias-pull-down: true
> +
> +          input-enable: true
> +
> +          input-disable: true
> +
> +          output-low: true
> +
> +          output-high: true
> +
> +          input-schmitt-enable: true
> +
> +          input-schmitt-disable: true
> +
> +          drive-strength:
> +            description: |
> +              Can support some arguments, such as MTK_DRIVE_4mA, MTK_DRIVE_6mA,
> +              etc. See dt-bindings/pinctrl/mt65xx.h for valid arguments.
> +
> +        required:
> +          - pinmux
> +
> +        additionalProperties: false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/pinctrl/mt8135-pinfunc.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        syscfg_pctl_a: syscfg-pctl-a@10005000 {
> +          compatible = "mediatek,mt8135-pctl-a-syscfg", "syscon";
> +          reg = <0 0x10005000 0 0x1000>;
> +        };
> +
> +        syscfg_pctl_b: syscfg-pctl-b@1020c020 {
> +          compatible = "mediatek,mt8135-pctl-b-syscfg", "syscon";
> +          reg = <0 0x1020C020 0 0x1000>;
> +        };
> +
> +        pinctrl@1c20800 {
> +          compatible = "mediatek,mt8135-pinctrl";
> +          reg = <0 0x1000B000 0 0x1000>;
> +          mediatek,pctl-regmap = <&syscfg_pctl_a>, <&syscfg_pctl_b>;
> +          pins-are-numbered;
> +          gpio-controller;
> +          #gpio-cells = <2>;
> +          interrupt-controller;
> +          #interrupt-cells = <2>;
> +          interrupts = <GIC_SPI 116 IRQ_TYPE_LEVEL_HIGH>,
> +              <GIC_SPI 117 IRQ_TYPE_LEVEL_HIGH>,
> +              <GIC_SPI 118 IRQ_TYPE_LEVEL_HIGH>;
> +
> +          i2c0_pins_a: i2c0-0 {
> +            pins1 {
> +              pinmux = <MT8135_PIN_100_SDA0__FUNC_SDA0>,
> +                <MT8135_PIN_101_SCL0__FUNC_SCL0>;
> +              bias-disable;
> +            };
> +          };
> +
> +          i2c1_pins_a: i2c1-0 {
> +            pins {
> +              pinmux = <MT8135_PIN_195_SDA1__FUNC_SDA1>,
> +                <MT8135_PIN_196_SCL1__FUNC_SCL1>;
> +              bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +            };
> +          };
> +
> +          i2c2_pins_a: i2c2-0 {
> +            pins1 {
> +              pinmux = <MT8135_PIN_193_SDA2__FUNC_SDA2>;
> +              bias-pull-down;
> +            };
> +
> +            pins2 {
> +              pinmux = <MT8135_PIN_49_WATCHDOG__FUNC_GPIO49>;
> +              bias-pull-up;
> +            };
> +          };
> +
> +          i2c3_pins_a: i2c3-0 {
> +            pins1 {
> +              pinmux = <MT8135_PIN_40_DAC_CLK__FUNC_GPIO40>,
> +                <MT8135_PIN_41_DAC_WS__FUNC_GPIO41>;
> +              bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +            };
> +
> +            pins2 {
> +              pinmux = <MT8135_PIN_35_SCL3__FUNC_SCL3>,
> +                <MT8135_PIN_36_SDA3__FUNC_SDA3>;
> +              output-low;
> +              bias-pull-up = <MTK_PUPD_SET_R1R0_01>;
> +            };
> +
> +            pins3 {
> +              pinmux = <MT8135_PIN_57_JTCK__FUNC_GPIO57>,
> +                <MT8135_PIN_60_JTDI__FUNC_JTDI>;
> +              drive-strength = <32>;
> +            };
> +          };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6797-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6797-pinctrl.yaml
> new file mode 100644
> index 0000000000000..55e47c1e42f6c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6797-pinctrl.yaml
> @@ -0,0 +1,173 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/mediatek,mt6797-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT6797 Pin Controller Device Tree Bindings
> +
> +maintainers:
> +  - Andy Teng <andy.teng@mediatek.com>
> +
> +description: |+
> +  The MediaTek's MT6797 Pin controller is used to control SoC pins.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6797-pinctrl
> +
> +  reg:
> +    minItems: 5
> +    maxItems: 5
> +
> +  reg-names:
> +    items:
> +      - const: gpio
> +      - const: iocfgl
> +      - const: iocfgb
> +      - const: iocfgr
> +      - const: iocfgt
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +    description: |
> +      Number of cells in GPIO specifier. Since the generic GPIO
> +      binding is used, the amount of cells must be specified as 2. See the below
> +      mentioned gpio binding representation for description of particular cells.
> +
> +  interrupt-controller: true
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - gpio-controller
> +  - "#gpio-cells"
> +
> +patternProperties:
> +  '-[0-9]+$':
> +    type: object
> +    patternProperties:
> +      '-pins':
> +        type: object
> +        description: |
> +          A pinctrl node should contain at least one subnodes representing the
> +          pinctrl groups available on the machine. Each subnode will list the
> +          pins it needs, and how they should be configured, with regard to muxer
> +          configuration, pullups, drive strength, input enable/disable and input
> +          schmitt.
> +        $ref: "/schemas/pinctrl/pincfg-node.yaml"
> +
> +        properties:
> +          pinmux:
> +            description:
> +              integer array, represents gpio pin number and mux setting.
> +              Supported pin number and mux varies for different SoCs, and are
> +              defined as macros in <soc>-pinfunc.h directly.
> +
> +          bias-disable: true
> +
> +          bias-pull-up: true
> +
> +          bias-pull-down: true
> +
> +          input-enable: true
> +
> +          input-disable: true
> +
> +          output-enable: true
> +
> +          output-low: true
> +
> +          output-high: true
> +
> +          input-schmitt-enable: true
> +
> +          input-schmitt-disable: true
> +
> +          drive-strength:
> +            enum: [2, 4, 8, 12, 16]
> +
> +          slew-rate:
> +            enum: [0, 1]
> +
> +          mediatek,pull-up-adv:
> +            description: |
> +              Pull up setings for 2 pull resistors, R0 and R1. User can
> +              configure those special pins. Valid arguments are described as below:
> +              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
> +              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
> +              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
> +              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1, 2, 3]
> +
> +          mediatek,pull-down-adv:
> +            description: |
> +              Pull down settings for 2 pull resistors, R0 and R1. User can
> +              configure those special pins. Valid arguments are described as below:
> +              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
> +              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
> +              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
> +              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1, 2, 3]
> +
> +          mediatek,tdsel:
> +            description: |
> +              An integer describing the steps for output level shifter duty
> +              cycle when asserted (high pulse width adjustment). Valid arguments
> +              are from 0 to 15.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +
> +          mediatek,rdsel:
> +            description: |
> +              An integer describing the steps for input level shifter duty cycle
> +              when asserted (high pulse width adjustment). Valid arguments are
> +              from 0 to 63.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +
> +        required:
> +          - pinmux
> +
> +        additionalProperties: false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/pinctrl/mt6797-pinfunc.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        pio: pinctrl@10005000 {
> +            compatible = "mediatek,mt6797-pinctrl";
> +            reg = <0 0x10005000 0 0x1000>,
> +                  <0 0x10002000 0 0x400>,
> +                  <0 0x10002400 0 0x400>,
> +                  <0 0x10002800 0 0x400>,
> +                  <0 0x10002C00 0 0x400>;
> +            reg-names = "gpio", "iocfgl", "iocfgb", "iocfgr", "iocfgt";
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +
> +            uart_pins_a: uart-0 {
> +                pins1 {
> +                    pinmux = <MT6797_GPIO232__FUNC_URXD1>,
> +                            <MT6797_GPIO233__FUNC_UTXD1>;
> +                };
> +            };
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
> new file mode 100644
> index 0000000000000..a01c81895fb95
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7622-pinctrl.yaml
> @@ -0,0 +1,416 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/mediatek,mt7622-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT7622 Pin Controller Device Tree Bindings
> +
> +maintainers:
> +  - Andy Teng <andy.teng@mediatek.com>
> +
> +description: |+
> +  The MediaTek's MT7622 Pin controller is used to control SoC pins.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt7622-pinctrl
> +      - mediatek,mt7629-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  reg-names:
> +    items:
> +      - const: eint
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +    description: |
> +      Number of cells in GPIO specifier. Since the generic GPIO
> +      binding is used, the amount of cells must be specified as 2. See the below
> +      mentioned gpio binding representation for description of particular cells.
> +
> +  interrupt-controller: true
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - "#gpio-cells"
> +
> +if:
> +  required:
> +    - interrupt-controller
> +then:
> +  required:
> +    - reg-names
> +    - interrupts
> +    - "#interrupt-cells"
> +
> +patternProperties:
> +  '-[0-9]+$':
> +    type: object
> +    patternProperties:
> +      'mux':
> +        type: object
> +        description: |
> +          pinmux configuration nodes.
> +        $ref: "/schemas/pinctrl/pinmux-node.yaml"
> +        properties:
> +          function:
> +            description: |
> +              A string containing the name of the function to mux to the group.
> +            enum: [emmc, eth, i2c, i2s, ir, led, flash, pcie, pmic, pwm, sd,
> +                   spi, tdm, uart, watchdog, wifi]
> +
> +          groups:
> +            description: |
> +              An array of strings. Each string contains the name of a group.
> +            enum: [emmc, emmc_rst, esw, esw_p0_p1, esw_p2_p3_p4, rgmii_via_esw,
> +                   rgmii_via_gmac1, rgmii_via_gmac2, mdc_mdio, i2c0, i2c1_0,
> +                   i2c1_1, i2c1_2, i2c2_0, i2c2_1, i2c2_2, i2s_in_mclk_bclk_ws,
> +                   i2s1_in_data, i2s2_in_data, i2s3_in_data, i2s4_in_data,
> +                   i2s_out_mclk_bclk_ws, i2s1_out_data, i2s2_out_data,
> +                   i2s3_out_data, i2s4_out_data, ir_0_tx, ir_1_tx, ir_2_tx,
> +                   ir_0_rx, ir_1_rx, ir_2_rx, ephy_leds, ephy0_led, ephy1_led,
> +                   ephy2_led, ephy3_led, ephy4_led, wled, par_nand, snfi,
> +                   spi_nor, pcie0_0_waken, pcie0_1_waken, pcie1_0_waken,
> +                   pcie0_0_clkreq, pcie0_1_clkreq, pcie1_0_clkreq,
> +                   pcie0_pad_perst, pcie1_pad_perst, pmic_bus, pwm_ch1_0,
> +                   pwm_ch1_1, pwm_ch1_2, pwm_ch2_0, pwm_ch2_1, pwm_ch2_2,
> +                   pwm_ch3_0, pwm_ch3_1, pwm_ch3_2, pwm_ch4_0, pwm_ch4_1,
> +                   pwm_ch4_2, pwm_ch4_3, pwm_ch5_0, pwm_ch5_1, pwm_ch5_2,
> +                   pwm_ch6_0, pwm_ch6_1, pwm_ch6_2, pwm_ch6_3, pwm_ch7_0,
> +                   pwm_ch7_1, pwm_ch7_2, sd_0, sd_1, spic0_0, spic0_1, spic1_0,
> +                   spic1_1, spic2_0_wp_hold, spic2_0, tdm_0_out_mclk_bclk_ws,
> +                   tdm_0_in_mclk_bclk_ws, tdm_0_out_data, tdm_0_in_data,
> +                   tdm_1_out_mclk_bclk_ws, tdm_1_in_mclk_bclk_ws,
> +                   tdm_1_out_data, tdm_1_in_data, uart0_0_tx_rx, uart1_0_tx_rx,
> +                   uart1_0_rts_cts, uart1_1_tx_rx, uart1_1_rts_cts,
> +                   uart2_0_tx_rx, uart2_0_rts_cts, uart2_1_tx_rx,
> +                   uart2_1_rts_cts, uart2_2_tx_rx, uart2_2_rts_cts,
> +                   uart2_3_tx_rx, uart3_0_tx_rx, uart3_1_tx_rx, uart3_1_rts_cts,
> +                   uart4_0_tx_rx, uart4_1_tx_rx, uart4_1_rts_cts, uart4_2_tx_rx,
> +                   uart4_2_rts_cts, watchdog, i2c_0, i2c_1, wf2g_led, wf5g_led,
> +                   pcie_pereset, pcie_wake, pcie_clkreq, pwm_0, pwm_1, spi_0,
> +                   spi_1, spi_wp, spi_hold, uart0_txd_rxd, uart1_0_txd_rxd,
> +                   uart1_0_cts_rts, uart1_1_txd_rxd, uart1_1_cts_rts,
> +                   uart2_0_txd_rxd, uart2_0_cts_rts, uart2_1_txd_rxd,
> +                   uart2_1_cts_rts, wf0_2g, wf0_5g]

You are listing the same strings twice. So I'd drop this one and leave 
the if/then schemas below. (Though just the above is good enough.)

> +
> +        required:
> +          - groups
> +          - function
> +        
> +        allOf:
> +          - if:
> +              properties:
> +                functions:

function or functions? 

> +                  contains:
> +                    const: emmc

It's only a single string entry, right? So drop 'contains'

> +            then:
> +              properties:
> +                groups:
> +                  enum: [emmc, emmc_rst]
> +          - if:
> +              properties:
> +                functions:
> +                  contains:
> +                    const: eth
> +            then:
> +              properties:
> +                groups:
> +                  enum: [esw, esw_p0_p1, esw_p2_p3_p4, rgmii_via_esw,
> +                         rgmii_via_gmac1, rgmii_via_gmac2, mdc_mdio]
> +          - if:
> +              properties:
> +                functions:
> +                  contains:
> +                    const: i2c
> +            then:
> +              properties:
> +                groups:
> +                  enum: [i2c0, i2c_0, i2c_1, i2c1_0, i2c1_1, i2c1_2, i2c2_0,
> +                         i2c2_1, i2c2_2]
> +          - if:
> +              properties:
> +                functions:
> +                  contains:
> +                    const: i2s
> +            then:
> +              properties:
> +                groups:
> +                  enum: [i2s_in_mclk_bclk_ws, i2s1_in_data, i2s2_in_data,
> +                         i2s3_in_data, i2s4_in_data, i2s_out_mclk_bclk_ws,
> +                         i2s1_out_data, i2s2_out_data, i2s3_out_data,
> +                         i2s4_out_data]
> +          - if:
> +              properties:
> +                functions:
> +                  contains:
> +                    const: ir
> +            then:
> +              properties:
> +                groups:
> +                  enum: [ir_0_tx, ir_1_tx, ir_2_tx, ir_0_rx, ir_1_rx, ir_2_rx]
> +          - if:
> +              properties:
> +                functions:
> +                  contains:
> +                    const: led
> +            then:
> +              properties:
> +                groups:
> +                  enum: [ephy_leds, ephy0_led, ephy1_led, ephy2_led, ephy3_led,
> +                         ephy4_led, wled, wf2g_led, wf5g_led]
> +          - if:
> +              properties:
> +                functions:
> +                  contains:
> +                    const: flash
> +            then:
> +              properties:
> +                groups:
> +                  enum: [par_nand, snfi, spi_nor]
> +          - if:
> +              properties:
> +                functions:
> +                  contains:
> +                    const: pcie
> +            then:
> +              properties:
> +                groups:
> +                  enum: [pcie0_0_waken, pcie0_1_waken, pcie1_0_waken,
> +                         pcie0_0_clkreq, pcie0_1_clkreq, pcie1_0_clkreq,
> +                         pcie0_pad_perst, pcie1_pad_perst, pcie_pereset,
> +                         pcie_wake, pcie_clkreq]
> +          - if:
> +              properties:
> +                functions:
> +                  contains:
> +                    const: pmic
> +            then:
> +              properties:
> +                groups:
> +                  enum: [pmic_bus]
> +          - if:
> +              properties:
> +                functions:
> +                  contains:
> +                    const: pwm
> +            then:
> +              properties:
> +                groups:
> +                  enum: [pwm_ch1_0, pwm_ch1_1, pwm_ch1_2, pwm_ch2_0, pwm_ch2_1,
> +                         pwm_ch2_2, pwm_ch3_0, pwm_ch3_1, pwm_ch3_2, pwm_ch4_0,
> +                         pwm_ch4_1, pwm_ch4_2, pwm_ch4_3, pwm_ch5_0, pwm_ch5_1,
> +                         pwm_ch5_2, pwm_ch6_0, pwm_ch6_1, pwm_ch6_2, pwm_ch6_3,
> +                         pwm_ch7_0, pwm_0, pwm_1]
> +          - if:
> +              properties:
> +                functions:
> +                  contains:
> +                    const: sd
> +            then:
> +              properties:
> +                groups:
> +                  enum: [sd_0, sd_1]
> +          - if:
> +              properties:
> +                functions:
> +                  contains:
> +                    const: spi
> +            then:
> +              properties:
> +                groups:
> +                  enum: [spic0_0, spic0_1, spic1_0, spic1_1, spic2_0_wp_hold,
> +                         spic2_0, spi_0, spi_1, spi_wp, spi_hold]
> +          - if:
> +              properties:
> +                functions:
> +                  contains:
> +                    const: tdm
> +            then:
> +              properties:
> +                groups:
> +                  enum: [tdm_0_out_mclk_bclk_ws, tdm_0_in_mclk_bclk_ws,
> +                         tdm_0_out_data, tdm_0_in_data, tdm_1_out_mclk_bclk_ws,
> +                         tdm_1_in_mclk_bclk_ws, tdm_1_out_data, tdm_1_in_data]
> +          - if:
> +              properties:
> +                functions:
> +                  contains:
> +                    const: uart
> +            then:
> +              properties:
> +                groups:
> +                  enum: [uart0_0_tx_rx, uart1_0_tx_rx, uart1_0_rts_cts,
> +                         uart1_1_tx_rx, uart1_1_rts_cts, uart2_0_tx_rx,
> +                         uart2_0_rts_cts, uart2_1_tx_rx, uart2_1_rts_cts,
> +                         uart2_2_tx_rx, uart2_2_rts_cts, uart2_3_tx_rx,
> +                         uart3_0_tx_rx, uart3_1_tx_rx, uart3_1_rts_cts,
> +                         uart4_0_tx_rx, uart4_1_tx_rx, uart4_1_rts_cts,
> +                         uart4_2_tx_rx, uart4_2_rts_cts, uart0_txd_rxd,
> +                         uart1_0_txd_rxd, uart1_0_cts_rts, uart1_1_txd_rxd,
> +                         uart1_1_cts_rts, uart2_0_txd_rxd, uart2_0_cts_rts,
> +                         uart2_1_txd_rxd, uart2_1_cts_rts]
> +          - if:
> +              properties:
> +                functions:
> +                  contains:
> +                    const: watchdog
> +            then:
> +              properties:
> +                groups:
> +                  enum: [watchdog]
> +          - if:
> +              properties:
> +                functions:
> +                  contains:
> +                    const: wifi
> +            then:
> +              properties:
> +                groups:
> +                  enum: [wf0_2g, wf0_5g]
> +          
> +      'conf':
> +        type: object
> +        description: |
> +          pinconf configuration nodes.
> +        $ref: "/schemas/pinctrl/pincfg-node.yaml"
> +
> +        properties:
> +          groups:
> +            description: |
> +              An array of strings. Each string contains the name of a group.
> +              Valid values are the same as the pinmux node.
> +
> +          pins:
> +            description: |
> +              An array of strings. Each string contains the name of a pin.
> +            enum: [GPIO_A, I2S1_IN, I2S1_OUT, I2S_BCLK, I2S_WS, I2S_MCLK, TXD0,
> +                   RXD0, SPI_WP, SPI_HOLD, SPI_CLK, SPI_MOSI, SPI_MISO, SPI_CS,
> +                   I2C_SDA, I2C_SCL, I2S2_IN, I2S3_IN, I2S4_IN, I2S2_OUT,
> +                   I2S3_OUT, I2S4_OUT, GPIO_B, MDC, MDIO, G2_TXD0, G2_TXD1,
> +                   G2_TXD2, G2_TXD3, G2_TXEN, G2_TXC, G2_RXD0, G2_RXD1, G2_RXD2,
> +                   G2_RXD3, G2_RXDV, G2_RXC, NCEB, NWEB, NREB, NDL4, NDL5, NDL6,
> +                   NDL7, NRB, NCLE, NALE, NDL0, NDL1, NDL2, NDL3, MDI_TP_P0,
> +                   MDI_TN_P0, MDI_RP_P0, MDI_RN_P0, MDI_TP_P1, MDI_TN_P1,
> +                   MDI_RP_P1, MDI_RN_P1, MDI_RP_P2, MDI_RN_P2, MDI_TP_P2,
> +                   MDI_TN_P2, MDI_TP_P3, MDI_TN_P3, MDI_RP_P3, MDI_RN_P3,
> +                   MDI_RP_P4, MDI_RN_P4, MDI_TP_P4, MDI_TN_P4, PMIC_SCL,
> +                   PMIC_SDA, SPIC1_CLK, SPIC1_MOSI, SPIC1_MISO, SPIC1_CS,
> +                   GPIO_D, WATCHDOG, RTS3_N, CTS3_N, TXD3, RXD3, PERST0_N,
> +                   PERST1_N, WLED_N, EPHY_LED0_N, AUXIN0, AUXIN1, AUXIN2,
> +                   AUXIN3, TXD4, RXD4, RTS4_N, CST4_N, PWM1, PWM2, PWM3, PWM4,
> +                   PWM5, PWM6, PWM7, GPIO_E, TOP_5G_CLK, TOP_5G_DATA,
> +                   WF0_5G_HB0, WF0_5G_HB1, WF0_5G_HB2, WF0_5G_HB3, WF0_5G_HB4,
> +                   WF0_5G_HB5, WF0_5G_HB6, XO_REQ, TOP_RST_N, SYS_WATCHDOG,
> +                   EPHY_LED0_N_JTDO, EPHY_LED1_N_JTDI, EPHY_LED2_N_JTMS,
> +                   EPHY_LED3_N_JTCLK, EPHY_LED4_N_JTRST_N, WF2G_LED_N,
> +                   WF5G_LED_N, GPIO_9, GPIO_10, GPIO_11, GPIO_12, UART1_TXD,
> +                   UART1_RXD, UART1_CTS, UART1_RTS, UART2_TXD, UART2_RXD,
> +                   UART2_CTS, UART2_RTS, SMI_MDC, SMI_MDIO, PCIE_PERESET_N,
> +                   PWM_0, GPIO_0, GPIO_1, GPIO_2, GPIO_3, GPIO_4, GPIO_5,
> +                   GPIO_6, GPIO_7, GPIO_8, UART0_TXD, UART0_RXD, TOP_2G_CLK,
> +                   TOP_2G_DATA, WF0_2G_HB0, WF0_2G_HB1, WF0_2G_HB2, WF0_2G_HB3,
> +                   WF0_2G_HB4, WF0_2G_HB5, WF0_2G_HB6]
> +              
> +          bias-disable: true
> +
> +          bias-pull-up: true
> +
> +          bias-pull-down: true
> +
> +          input-enable: true
> +
> +          input-disable: true
> +
> +          output-enable: true
> +
> +          output-low: true
> +
> +          output-high: true
> +
> +          input-schmitt-enable: true
> +
> +          input-schmitt-disable: true
> +
> +          drive-strength:
> +            enum: [4, 8, 12, 16]
> +
> +          slew-rate:
> +            enum: [0, 1]
> +
> +          mediatek,tdsel:
> +            description: |
> +              An integer describing the steps for output level shifter duty
> +              cycle when asserted (high pulse width adjustment). Valid arguments
> +              are from 0 to 15.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +
> +          mediatek,rdsel:
> +            description: |
> +              An integer describing the steps for input level shifter duty cycle
> +              when asserted (high pulse width adjustment). Valid arguments are
> +              from 0 to 63.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +
> +        required:
> +          - pins
> +
> +        additionalProperties: false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        pio: pinctrl@10211000 {
> +          compatible = "mediatek,mt7622-pinctrl";
> +          reg = <0 0x10211000 0 0x1000>;
> +          gpio-controller;
> +          #gpio-cells = <2>;
> +
> +          pinctrl_eth_default: eth-0 {
> +            mux-mdio {
> +              groups = "mdc_mdio";
> +              function = "eth";
> +              drive-strength = <12>;
> +            };
> +
> +            mux-gmac2 {
> +              groups = "rgmii_via_gmac2";
> +              function = "eth";
> +              drive-strength = <12>;
> +            };
> +
> +            mux-esw {
> +              groups = "esw";
> +              function = "eth";
> +              drive-strength = <8>;
> +            };
> +
> +            conf-mdio {
> +              pins = "MDC";
> +              bias-pull-up;
> +            };
> +          };
> +        };
> +    };
