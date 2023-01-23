Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 15528678B91
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Jan 2023 00:01:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231842AbjAWXA7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Jan 2023 18:00:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232026AbjAWXAz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Jan 2023 18:00:55 -0500
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B43AC9EEA;
        Mon, 23 Jan 2023 15:00:32 -0800 (PST)
Received: by mail-oi1-f174.google.com with SMTP id s66so11791917oib.7;
        Mon, 23 Jan 2023 15:00:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J3mwv6aV2I7aDotcIvMFL6PmTKQeams3riznbaUkxak=;
        b=soqUQ81nqvFbB2pQkyw0s2EAM7HGKzaBAvh7hGaHDeYDCQ1zjyELgwOZD+Y8VPQdiy
         BNHiBe950NXMI6VGugFpjgg+xV3O2VVQvF0IfXbpUOlAurDzAPjwFoY+8OxxcUkJF0+d
         cKq9hH0EpJ3gxjAOAxRcdyiAbW1j47Zw+LxKFeWA9MOfMTWsgxluVHkxwm5355m4v/fj
         1qFhkRrbmcUvZF6U6x35D0w8EgkYaYlJQSUehFP2tw2uP0H2W/An20U+aM8+xdZe1FEV
         YkwnxUPNrbo6ckcsoRdjWbSXROsRA1TzYYS607tcjmeCgzxJrXNNJo+MiyZK2Gft7VER
         SR5g==
X-Gm-Message-State: AFqh2kpjkFL45p72bTULojc3ziv8BwKQzq3aC5OKH753fI8BOswNGNAy
        SCK77LHITH1urK9krMD1HQ==
X-Google-Smtp-Source: AMrXdXvvU4TXHAC7cQqQ3pXWC/ul4vxlTXcf7kFIrQNAjDpuzrbCFYrB8MBbAx9/4igD7XUJfqb9Tg==
X-Received: by 2002:a05:6808:6d3:b0:35e:d787:ec7f with SMTP id m19-20020a05680806d300b0035ed787ec7fmr11362920oih.50.1674514784603;
        Mon, 23 Jan 2023 14:59:44 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w21-20020a056808091500b0036eafb8eee9sm295670oih.22.2023.01.23.14.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 14:59:44 -0800 (PST)
Received: (nullmailer pid 2793299 invoked by uid 1000);
        Mon, 23 Jan 2023 22:59:43 -0000
Date:   Mon, 23 Jan 2023 16:59:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Daniel Golle <daniel@makrotopia.org>
Cc:     linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Sean Wang <sean.wang@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Sam Shih <sam.shih@mediatek.com>,
        Jianhui Zhao <zhaojh329@gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: add bindings for MT7981 SoC
Message-ID: <20230123225943.GA2781371-robh@kernel.org>
References: <cover.1674409777.git.daniel@makrotopia.org>
 <7c680bf2502ddfd2077306a46c69728d212386f9.1674409777.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7c680bf2502ddfd2077306a46c69728d212386f9.1674409777.git.daniel@makrotopia.org>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jan 22, 2023 at 06:23:55PM +0000, Daniel Golle wrote:
> Add bindings for the MT7981 pinctrl driver, based on existing MT7986
> pinctrl bindings.

What existing bindings? A .txt file you need to remove, or undocumented, 
but in use somewhere (where?)?

> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  .../pinctrl/mediatek,mt7981-pinctrl.yaml      | 475 ++++++++++++++++++
>  1 file changed, 475 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7981-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7981-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7981-pinctrl.yaml
> new file mode 100644
> index 0000000000000..e76fe0d5083a3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7981-pinctrl.yaml
> @@ -0,0 +1,475 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/mediatek,mt7981-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT7981 Pin Controller
> +
> +maintainers:
> +  - Daniel Golle <daniel@makrotopia.org>
> +
> +description: |+

Don't need '|+' unless there are line endings to preserve.

> +  The MediaTek's MT7981 Pin controller is used to control SoC pins.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt7981-pinctrl
> +
> +  reg:
> +    minItems: 9
> +    maxItems: 9
> +
> +  reg-names:
> +    items:
> +      - const: gpio
> +      - const: iocfg_rt
> +      - const: iocfg_rm
> +      - const: iocfg_rb
> +      - const: iocfg_lb
> +      - const: iocfg_bl
> +      - const: iocfg_tm
> +      - const: iocfg_tl
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
> +  gpio-ranges:
> +    minItems: 1
> +    maxItems: 5
> +    description: |
> +      GPIO valid number range.
> +
> +  interrupt-controller: true
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +allOf:
> +  - $ref: "pinctrl.yaml#"

Drop quotes

> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - gpio-controller
> +  - "#gpio-cells"
> +
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    additionalProperties: false
> +
> +    patternProperties:
> +      '.*mux.*':

Just to be really clear: '^.*mux.*$'

Really, if not already in use, it would be preferred if this was either 
a prefix or a suffix.

> +        type: object
> +        additionalProperties: false
> +        description: |
> +          pinmux configuration nodes.
> +
> +          The following table shows the effective values of "group", "function"
> +          properties and chip pinout pins
> +
> +          groups                 function    pins (in pin#)
> +          ---------------------------------------------------------------------
> +          "wa_aice1"             "wa_aice"   0, 1
> +          "wa_aice2"             "wa_aice"   0, 1
> +          "wm_uart_0"            "uart"      0, 1
> +          "dfd"                  "dfd"       0, 1, 4, 5
> +          "watchdog"             "watchdog"  2
> +          "pcie_pereset"         "pcie"      3
> +          "jtag"                 "jtag"      4, 5, 6, 7, 8
> +          "wm_jtag_0"            "jtag"      4, 5, 6, 7, 8
> +          "wo0_jtag_0"           "jtag"      9, 10, 11, 12, 13
> +          "uart2_0"              "uart"      4, 5, 6, 7
> +          "gbe_led0"             "led"       8
> +          "pta_ext_0"            "pta"       4, 5, 6
> +          "pwm2"                 "pwm"       7
> +          "net_wo0_uart_txd_0"   "uart"      8
> +          "spi1_0"               "spi"       4, 5, 6, 7
> +          "i2c0_0"               "i2c"       6, 7
> +          "dfd_ntrst"            "dfd"       8
> +          "wm_aice1"             "wa_aice"   9, 10
> +          "pwm0_0"               "pwm"       13
> +          "pwm0_1"               "pwm"       15
> +          "pwm1_0"               "pwm"       14
> +          "pwm1_1"               "pwm"       15
> +          "net_wo0_uart_txd_1"   "uart"      14
> +          "net_wo0_uart_txd_2"   "uart"      15
> +          "gbe_led1"             "led"       13
> +          "pcm"                  "pcm"       9, 10, 11, 12, 13, 25
> +          "watchdog1"            "watchdog"  13
> +          "udi"                  "udi"       9, 10, 11, 12, 13
> +          "drv_vbus"             "usb"       14
> +          "emmc_45"              "flash"     15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25
> +          "snfi"                 "flash"     16, 17, 18, 19, 20, 21
> +          "spi0"                 "spi"       16, 17, 18, 19
> +          "spi0_wp_hold"         "spi"       20, 21
> +          "spi1_1"               "spi"       22, 23, 24, 25
> +          "spi2"                 "spi"       26, 27, 28, 29
> +          "spi2_wp_hold"         "spi"       30, 31
> +          "uart1_0"              "uart"      16, 17, 18, 19
> +          "uart1_1"              "uart"      26, 27, 28, 29
> +          "uart2_1"              "uart"      22, 23, 24, 25
> +          "pta_ext_1"            "pta"       22, 23, 24
> +          "wm_aurt_1"            "uart"      20, 21
> +          "wm_aurt_2"            "uart"      30, 31
> +          "wm_jtag_1"            "jtag"      20, 21, 22, 23, 24
> +          "wo0_jtag_1"           "jtag"      25, 26, 27, 28, 29
> +          "wa_aice3"             "wa_aice"   28, 20
> +          "wm_aice2"             "wa_aice"   30, 31
> +          "i2c0_1"               "i2c"       30, 31
> +          "u2_phy_i2c"           "i2c"       30, 31
> +          "uart0"                "uart"      32, 33
> +          "sgmii1_phy_i2c"       "i2c"       32, 33
> +          "u3_phy_i2c"           "i2c"       32, 33
> +          "sgmii0_phy_i2c"       "i2c"       32, 33
> +          "pcie_clk"             "pcie"      34
> +          "pcie_wake"            "pcie"      35
> +          "i2c0_2"               "i2c"       36, 37
> +          "smi_mdc_mdio"         "eth"       36, 37
> +          "gbe_ext_mdc_mdio"     "eth"       36, 37
> +          "wf0_mode1"            "eth"       40, 41, 42, 43, 44, 45, 46, 47, 48,
> +                                             49, 50, 51, 52, 53, 54, 55, 56
> +
> +          "wf0_mode3"            "eth"       45, 46, 47, 48, 49, 51
> +          "wf2g_led0"            "led"       30
> +          "wf2g_led1"            "led"       34
> +          "wf5g_led0"            "led"       31
> +          "wf5g_led1"            "led"       35
> +          "mt7531_int"           "eth"       38
> +          "ant_sel"              "ant"       14, 15, 16, 17, 18, 19, 20, 21, 22
> +                                             23, 24, 25, 34, 35
> +
> +        $ref: "/schemas/pinctrl/pinmux-node.yaml"

Drop quotes.

> +        properties:
> +          function:
> +            description: |

Don't need '|'.

> +              A string containing the name of the function to mux to the group.
> +            enum: [wa_aice, dfd, jtag, pta, pcm, udi, usb, ant, eth, i2c, led,
> +                   pwm, spi, uart, watchdog, flash, pcie]
> +          groups:
> +            description: |
> +              An array of strings. Each string contains the name of a group.

Blank line.

> +        required:
> +          - function
> +          - groups
> +
> +        allOf:
> +          - if:
> +              properties:
> +                function:
> +                  const: wa_aice
> +            then:
> +              properties:
> +                groups:
> +                  enum: [wa_aice1, wa_aice2, wm_aice1_1, wa_aice3, wm_aice1_2]
> +          - if:
> +              properties:
> +                function:
> +                  const: dfd
> +            then:
> +              properties:
> +                groups:
> +                  enum: [dfd, dfd_ntrst]
> +          - if:
> +              properties:
> +                function:
> +                  const: jtag
> +            then:
> +              properties:
> +                groups:
> +                  enum: [jtag, wm_jtag_0, wo0_jtag_0, wo0_jtag_1, wm_jtag_1]
> +          - if:
> +              properties:
> +                function:
> +                  const: pta
> +            then:
> +              properties:
> +                groups:
> +                  enum: [pta_ext_0, pta_ext_1]
> +          - if:
> +              properties:
> +                function:
> +                  const: pcm
> +            then:
> +              properties:
> +                groups:
> +                  enum: [pcm]
> +          - if:
> +              properties:
> +                function:
> +                  const: udi
> +            then:
> +              properties:
> +                groups:
> +                  enum: [udi]
> +          - if:
> +              properties:
> +                function:
> +                  const: usb
> +            then:
> +              properties:
> +                groups:
> +                  enum: [drv_vbus]
> +          - if:
> +              properties:
> +                function:
> +                  const: ant
> +            then:
> +              properties:
> +                groups:
> +                  enum: [ant_sel]
> +          - if:
> +              properties:
> +                function:
> +                  const: eth
> +            then:
> +              properties:
> +                groups:
> +                  enum: [smi_mdc_mdio, gbe_ext_mdc_mdio, wf0_mode1, wf0_mode3,
> +                         mt7531_int]
> +          - if:
> +              properties:
> +                function:
> +                  const: i2c
> +            then:
> +              properties:
> +                groups:
> +                  enum: [i2c0_0, i2c0_1, u2_phy_i2c, sgmii1_phy_i2c, u3_phy_i2c,
> +                         sgmii0_phy_i2c, i2c0_2]
> +          - if:
> +              properties:
> +                function:
> +                  const: led
> +            then:
> +              properties:
> +                groups:
> +                  enum: [gbe_led0, gbe_led1, wf2g_led0, wf2g_led1, wf5g_led0, wf5g_led1]
> +          - if:
> +              properties:
> +                function:
> +                  const: pwm
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [pwm2, pwm0_0, pwm0_1, pwm1_0, pwm1_1]
> +                  maxItems: 3
> +          - if:
> +              properties:
> +                function:
> +                  const: spi
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [spi1_0, spi0, spi0_wp_hold, spi1_1, spi2, spi2_wp_hold]
> +                  maxItems: 4
> +          - if:
> +              properties:
> +                function:
> +                  const: uart
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [wm_uart_0, uart2_0, net_wo0_uart_txd_0,
> +                           net_wo0_uart_txd_1, net_wo0_uart_txd_2, uart1_0,
> +                           uart1_1, uart2_1, wm_aurt_1, wm_aurt_2, uart0]
> +          - if:
> +              properties:
> +                function:
> +                  const: watchdog
> +            then:
> +              properties:
> +                groups:
> +                  enum: [watchdog]
> +          - if:
> +              properties:
> +                function:
> +                  const: flash
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [emmc_45, snfi]
> +                  maxItems: 1
> +          - if:
> +              properties:
> +                function:
> +                  const: pcie
> +            then:
> +              properties:
> +                groups:
> +                  items:
> +                    enum: [pcie_clk, pcie_wake, pcie_pereset]
> +                  maxItems: 3
> +      '.*conf.*':

Same comments as 'mux'.

> +        type: object
> +        additionalProperties: false
> +        description: |
> +          pinconf configuration nodes.
> +        $ref: "/schemas/pinctrl/pincfg-node.yaml"

Drop quotes.

> +
> +        properties:
> +          pins:
> +            description: |
> +              An array of strings. Each string contains the name of a pin.
> +            items:
> +              enum: [GPIO_WPS, GPIO_RESET, SYS_WATCHDOG, PCIE_PERESET_N,
> +                     JTAG_JTDO, JTAG_JTDI, JTAG_JTMS, JTAG_JTCLK, JTAG_JTRST_N,
> +                     WO_JTAG_JTDO, WO_JTAG_JTDI, WO_JTAG_JTMS, WO_JTAG_JTCLK,
> +                     WO_JTAG_JTRST_N, USB_VBUS, PWM0, SPI0_CLK, SPI0_MOSI,
> +                     SPI0_MISO, SPI0_CS, SPI0_HOLD, SPI0_WP, SPI1_CLK, SPI1_MOSI,
> +                     SPI1_MISO, SPI1_CS, SPI2_CLK, SPI2_MOSI, SPI2_MISO, SPI2_CS,
> +                     SPI2_HOLD, SPI2_WP, UART0_RXD, UART0_TXD, PCIE_CLK_REQ,
> +                     PCIE_WAKE_N, SMI_MDC, SMI_MDIO, GBE_INT, GBE_RESET,
> +                     WF_DIG_RESETB, WF_CBA_RESETB, WF_XO_REQ, WF_TOP_CLK,
> +                     WF_TOP_DATA, WF_HB1, WF_HB2, WF_HB3, WF_HB4, WF_HB0,
> +                     WF_HB0_B, WF_HB5, WF_HB6, WF_HB7, WF_HB8, WF_HB9, WF_HB10]
> +            maxItems: 57
> +
> +          bias-disable: true
> +
> +          bias-pull-up:
> +            oneOf:
> +              - type: boolean
> +                description: normal pull up.
> +              - enum: [100, 101, 102, 103]
> +                description: |
> +                  PUPD/R1/R0 pull down type. See MTK_PUPD_SET_R1R0 defines in
> +                  dt-bindings/pinctrl/mt65xx.h.
> +
> +          bias-pull-down:
> +            oneOf:
> +              - type: boolean
> +                description: normal pull down.
> +              - enum: [100, 101, 102, 103]
> +                description: |
> +                  PUPD/R1/R0 pull down type. See MTK_PUPD_SET_R1R0 defines in
> +                  dt-bindings/pinctrl/mt65xx.h.
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
> +            enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +
> +          mediatek,pull-up-adv:
> +            description: |
> +              Valid arguments for 'mediatek,pull-up-adv' are '0', '1', '2', '3'
> +              Pull up setings for 2 pull resistors, R0 and R1. Valid arguments
> +              are described as below:
> +              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
> +              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
> +              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
> +              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1, 2, 3]
> +
> +          mediatek,pull-down-adv:
> +            description: |
> +              Valid arguments for 'mediatek,pull-up-adv' are '0', '1', '2', '3'
> +              Pull down setings for 2 pull resistors, R0 and R1. Valid arguments
> +              are described as below:
> +              0: (R1, R0) = (0, 0) which means R1 disabled and R0 disabled.
> +              1: (R1, R0) = (0, 1) which means R1 disabled and R0 enabled.
> +              2: (R1, R0) = (1, 0) which means R1 enabled and R0 disabled.
> +              3: (R1, R0) = (1, 1) which means R1 enabled and R0 enabled.
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            enum: [0, 1, 2, 3]
> +
> +        required:
> +          - pins
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/pinctrl/mt65xx.h>
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +      pio: pinctrl@11d00000 {
> +        compatible = "mediatek,mt7981-pinctrl";
> +        reg = <0 0x11d00000 0 0x1000>,
> +              <0 0x11c00000 0 0x1000>,
> +              <0 0x11c10000 0 0x1000>,
> +              <0 0x11d20000 0 0x1000>,
> +              <0 0x11e00000 0 0x1000>,
> +              <0 0x11e20000 0 0x1000>,
> +              <0 0x11f00000 0 0x1000>,
> +              <0 0x11f10000 0 0x1000>,
> +              <0 0x1000b000 0 0x1000>;
> +        reg-names = "gpio", "iocfg_rt", "iocfg_rm",
> +                    "iocfg_rb", "iocfg_lb", "iocfg_bl",
> +                    "iocfg_tm", "iocfg_tl", "eint";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&pio 0 0 56>;
> +        interrupt-controller;
> +        interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-parent = <&gic>;
> +        #interrupt-cells = <2>;
> +
> +        mdio_pins: mdio-pins {
> +          mux {
> +            function = "eth";
> +            groups = "smi_mdc_mdio";
> +          };
> +        };
> +
> +        spi0_flash_pins: spi0-pins {
> +          mux {
> +            function = "spi";
> +            groups = "spi0", "spi0_wp_hold";
> +          };
> +
> +          conf-pu {
> +            pins = "SPI0_CS", "SPI0_HOLD", "SPI0_WP";
> +            drive-strength = <MTK_DRIVE_8mA>;
> +            bias-pull-up = <MTK_PUPD_SET_R1R0_11>;
> +          };
> +
> +          conf-pd {
> +            pins = "SPI0_CLK", "SPI0_MOSI", "SPI0_MISO";
> +            drive-strength = <MTK_DRIVE_8mA>;
> +            bias-pull-down = <MTK_PUPD_SET_R1R0_11>;
> +          };
> +        };
> +
> +        pcie_pins: pcie-pins {
> +          mux {
> +            function = "pcie";
> +            groups = "pcie_clk", "pcie_wake", "pcie_pereset";
> +          };
> +        };
> +
> +      };
> +    };
> -- 
> 2.39.1
> 
