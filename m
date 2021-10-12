Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61826429B01
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Oct 2021 03:26:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232034AbhJLB2o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 Oct 2021 21:28:44 -0400
Received: from mail-oi1-f174.google.com ([209.85.167.174]:34561 "EHLO
        mail-oi1-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231751AbhJLB2n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 11 Oct 2021 21:28:43 -0400
Received: by mail-oi1-f174.google.com with SMTP id z11so27002037oih.1;
        Mon, 11 Oct 2021 18:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xYWULmZi2gwL6Zs5CDysqFHt9F5WBg3n6QyZkMxdsZg=;
        b=m6E7AUewflPqPMrk+VhjgfMGSGget/hTMBrl5ezr5L3/NsGPkor6dwAvuojhQCDC16
         xIkUhN2/jyouoZ28G+9ry5YFlSwBbteSMi4W4O5yX8SO/qWXcXAYK5o3Us0Xx5tE9oyz
         XKABHXDRSqz88lTU1IqjwLmwKYwNpOPy1SOONXRH6pvfsFLTIlMXifuje3caT7wbvlJX
         A2Qd5xF5iw0FJHzE1AhRX3Mlodi0Pec/xyhuGb159+HQVBra5IpVaas2OchIPIWLzfDW
         kV62G/UVTt6k+3zsaFh5zoQDHD3jaYjcCIf0SLKZyPCEUS4Qm5uIgh1uRJcODUoe21+8
         rSYA==
X-Gm-Message-State: AOAM530WTsZO0UKEXAumDyWATiZjPFOeKcfhnM670vUblHlltAmx2hIW
        QB6Ippsz2YfTfdsmtZSs/Q==
X-Google-Smtp-Source: ABdhPJy3g5tSpc7z/rdo4eBr/EnMTCQPcXwkY4DiMicS1znkv5eJYZS5iW5D5luE/1htopIm91TitA==
X-Received: by 2002:a05:6808:11c9:: with SMTP id p9mr1677076oiv.169.1634002002089;
        Mon, 11 Oct 2021 18:26:42 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id h26sm580253oov.28.2021.10.11.18.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Oct 2021 18:26:41 -0700 (PDT)
Received: (nullmailer pid 1543120 invoked by uid 1000);
        Tue, 12 Oct 2021 01:26:39 -0000
Date:   Mon, 11 Oct 2021 20:26:39 -0500
From:   Rob Herring <robh@kernel.org>
To:     Sam Shih <sam.shih@mediatek.com>
Cc:     Ryder.Lee@mediatek.com, devicetree@vger.kernel.org,
        enric.balletbo@collabora.com, fparent@baylibre.com,
        gregkh@linuxfoundation.org, herbert@gondor.apana.org.au,
        hsinyi@chromium.org, john@phrozen.org, linus.walleij@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux@roeck-us.net, matthias.bgg@gmail.com, mpm@selenic.com,
        mturquette@baylibre.com, sboyd@kernel.org, sean.wang@kernel.org,
        seiya.wang@mediatek.com, wim@linux-watchdog.org
Subject: Re: [v6,5/9] dt-bindings: pinctrl: update bindings for MT7986 SoC
Message-ID: <YWTkT2Oaa5dfnBV6@robh.at.kernel.org>
References: <1632745399.256353.3097151.nullmailer@robh.at.kernel.org>
 <20211004094140.32014-1-sam.shih@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211004094140.32014-1-sam.shih@mediatek.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Oct 04, 2021 at 05:41:40PM +0800, Sam Shih wrote:
> This updates bindings for MT7986 pinctrl driver. The
> difference of pinctrl between mt7986a and mt7986b is that pin-41 to pin-65
> do not exist on mt7986b
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> 
> ---
> v6 : fixed yamllint warnings/errors v2
> v5 : fixed yamllint warnings/errors v1
> v4 : used yaml format instead of txt format document
> v3 : make mt7986 pinctrl bindings as a separate file
> v2 : deleted the redundant description of mt7986a/mt7986b
> ---
>  .../pinctrl/mediatek,mt7986-pinctrl.yaml      | 361 ++++++++++++++++++
>  1 file changed, 361 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
> new file mode 100644
> index 000000000000..cde842d093dc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt7986-pinctrl.yaml
> @@ -0,0 +1,361 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/mediatek,mt7986-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Mediatek MT7986 Pin Controller Device Tree Bindings
> +
> +maintainers:
> +  - Sean Wang <sean.wang@kernel.org>
> +
> +description: |+
> +  The MediaTek's MT7986 Pin controller is used to control SoC pins.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - mediatek,mt7986a-pinctrl
> +      - mediatek,mt7986b-pinctrl
> +
> +  reg:
> +    minItems: 8
> +    maxItems: 8
> +
> +  reg-names:
> +    items:
> +      - const: gpio_base
> +      - const: iocfg_rt_base
> +      - const: iocfg_rb_base
> +      - const: iocfg_lt_base
> +      - const: iocfg_lb_base
> +      - const: iocfg_tr_base
> +      - const: iocfg_tl_base

_base is redundant. Drop.

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
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - gpio-controller
> +  - "#gpio-cells"
> +
> +patternProperties:
> +  '-[0-9]+$':

This could be a bit more specific. Most new bindings use '-pins$' here.

> +    type: object
> +    additionalProperties: false
> +
> +    patternProperties:
> +      'mux':

Do you really mean '.*mux.*' because that's what is allowed here. If the 
node name is really just 'mux', then this isn't a pattern and should be 
under 'properties'.

> +        type: object
> +        additionalProperties: false
> +        description: |
> +          pinmux configuration nodes.
> +
> +          Valid value	      function    pins (in pin#)
> +          ---------------------------------------------------------------------
> +          "watchdog"        "watchdog"  0
> +          "wifi_led"        "led"       1, 2
> +          "i2c"             "i2c"       3, 4
> +          "uart1_0"         "uart"      7, 8, 9, 10
> +          "pcie_clk"        "pcie"      9
> +          "pcie_wake"       "pcie"      10
> +          "spi1_0"          "spi"       11, 12, 13, 14
> +          "pwm1_1"          "pwm"       20,
> +          "pwm0"            "pwm"       21,
> +          "pwm1_0"          "pwm"       22,
> +          "snfi"            "flash"     23, 24, 25, 26, 27, 28
> +          "spi1_2"          "spi"       29, 30, 31, 32
> +          "emmc_45"         "emmc"      22, 23, 24, 25, 26, 27, 28, 29, 30,
> +                                        31, 32
> +          "spi1_1"          "spi"       23, 24, 25, 26
> +          "uart1_2"         "uart"      29, 30, 31, 32
> +          "uart1_1"         "uart"      23, 24, 25, 26
> +          "uart2_0"         "uart"      29, 30, 31, 32
> +          "spi0"            "spi"       33, 34, 35, 36
> +          "spi0_wp_hold"    "spi"       37, 38
> +          "uart1_3_rx_tx"   "uart"      35, 36
> +          "uart1_3_cts_rts" "uart"      37, 38
> +          "uart2_1"         "uart"      33, 34, 35, 36
> +          "spi1_3"          "spi"       33, 34, 35, 36
> +          "uart0"           "uart"      39, 40
> +          "pcie_pereset"    "pcie"      41
> +          "uart1"           "uart"      42, 43, 44, 45
> +          "uart2"           "uart"      46, 47, 48, 49
> +          "emmc_51"         "emmc"      50, 51, 52, 53, 54, 55, 56, 57, 57,
> +                                        59, 60, 61
> +          "pcm"             "audio"     62, 63, 64, 65
> +          "i2s"             "audio"     62, 63, 64, 65
> +          "switch_int"      "eth"       66
> +          "mdc_mdio"        "eth"       67
> +
> +        $ref: "/schemas/pinctrl/pinmux-node.yaml"
> +        properties:
> +          function:
> +            description: |
> +              A string containing the name of the function to mux to the group.
> +              There is no "audio", "pcie" functions on mt7986b, you can only use
> +              those functions on mt7986a.
> +            enum: [audio, emmc, eth, i2c, led, flash, pcie, pwm, spi, uart,
> +                   watchdog, wifi]
> +          groups:
> +            description: |
> +              An array of strings. Each string contains the name of a group.
> +              There is no "pcie_pereset", "uart1", "uart2" "emmc_51", "pcm",
> +              and "i2s" groups on mt7986b, you can only use those groups on
> +              mt7986a.
> +        required:
> +          - function
> +          - groups
> +
> +        allOf:
> +          - if:
> +              properties:
> +                function:
> +                  const: audio
> +            then:
> +              properties:
> +                groups:
> +                  enum: [pcm, i2s]
> +          - if:
> +              properties:
> +                function:
> +                  const: emmc
> +            then:
> +              properties:
> +                groups:
> +                  enum: [emmc, emmc_rst]
> +          - if:
> +              properties:
> +                function:
> +                  const: eth
> +            then:
> +              properties:
> +                groups:
> +                  enum: [switch_int, mdc_mdio]
> +          - if:
> +              properties:
> +                function:
> +                  const: i2c
> +            then:
> +              properties:
> +                groups:
> +                  enum: [i2c]
> +          - if:
> +              properties:
> +                function:
> +                  const: led
> +            then:
> +              properties:
> +                groups:
> +                  enum: [wifi_led]
> +          - if:
> +              properties:
> +                function:
> +                  const: flash
> +            then:
> +              properties:
> +                groups:
> +                  enum: [snfi]
> +          - if:
> +              properties:
> +                function:
> +                  const: pcie
> +            then:
> +              properties:
> +                groups:
> +                  enum: [pcie_clk, pcie_wake, pcie_pereset]
> +          - if:
> +              properties:
> +                function:
> +                  const: pwm
> +            then:
> +              properties:
> +                groups:
> +                  enum: [pwm0, pwm1_0, pwm1_1]
> +          - if:
> +              properties:
> +                function:
> +                  const: spi
> +            then:
> +              properties:
> +                groups:
> +                  enum: [spi0, spi0_wp_hold, spi1_0, spi1_1, spi1_2, spi1_3]
> +          - if:
> +              properties:
> +                function:
> +                  const: uart
> +            then:
> +              properties:
> +                groups:
> +                  enum: [uart1_0, uart1_1, uart1_2, uart1_3_rx_tx,
> +                         uart1_3_cts_rts, uart2_0, uart2_1, uart0, uart1, uart2]
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
> +                  const: wifi
> +            then:
> +              properties:
> +                groups:
> +                  enum: [wf_2g, wf_5g, wf_dbdc]
> +      'conf':

Same here. pattern or not?

> +        type: object
> +        additionalProperties: false
> +        description: |
> +          pinconf configuration nodes.
> +        $ref: "/schemas/pinctrl/pincfg-node.yaml"
> +
> +        properties:
> +          pins:
> +            description: |
> +              An array of strings. Each string contains the name of a pin.
> +              There is no PIN 41 to PIN 65 above on mt7686b, you can only use
> +              those pins on mt7986a.
> +            enum: [SYS_WATCHDOG, WF2G_LED, WF5G_LED, I2C_SCL, I2C_SDA, GPIO_0,
> +                   GPIO_1, GPIO_2, GPIO_3, GPIO_4, GPIO_5, GPIO_6, GPIO_7,
> +                   GPIO_8, GPIO_9, GPIO_10, GPIO_11, GPIO_12, GPIO_13, GPIO_14,
> +                   GPIO_15, PWM0, PWM1, SPI0_CLK, SPI0_MOSI, SPI0_MISO, SPI0_CS,
> +                   SPI0_HOLD, SPI0_WP, SPI1_CLK, SPI1_MOSI, SPI1_MISO, SPI1_CS,
> +                   SPI2_CLK, SPI2_MOSI, SPI2_MISO, SPI2_CS, SPI2_HOLD, SPI2_WP,
> +                   UART0_RXD, UART0_TXD, PCIE_PERESET_N, UART1_RXD, UART1_TXD,
> +                   UART1_CTS, UART1_RTS, UART2_RXD, UART2_TXD, UART2_CTS,
> +                   UART2_RTS, EMMC_DATA_0, EMMC_DATA_1, EMMC_DATA_2,
> +                   EMMC_DATA_3, EMMC_DATA_4, EMMC_DATA_5, EMMC_DATA_6,
> +                   EMMC_DATA_7, EMMC_CMD, EMMC_CK, EMMC_DSL, EMMC_RSTB, PCM_DTX,
> +                   PCM_DRX, PCM_CLK, PCM_FS, MT7531_INT, SMI_MDC, SMI_MDIO,
> +                   WF0_DIG_RESETB, WF0_CBA_RESETB, WF0_XO_REQ, WF0_TOP_CLK,
> +                   WF0_TOP_DATA, WF0_HB1, WF0_HB2, WF0_HB3, WF0_HB4, WF0_HB0,
> +                   WF0_HB0_B, WF0_HB5, WF0_HB6, WF0_HB7, WF0_HB8, WF0_HB9,
> +                   WF0_HB10, WF1_DIG_RESETB, WF1_CBA_RESETB, WF1_XO_REQ,
> +                   WF1_TOP_CLK, WF1_TOP_DATA, WF1_HB1, WF1_HB2, WF1_HB3,
> +                   WF1_HB4, WF1_HB0, WF1_HB0_B, WF1_HB5, WF1_HB6, WF1_HB7,
> +                   WF1_HB8]
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
> +
> +    soc {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +      pio: pinctrl@1001f000 {
> +        compatible = "mediatek,mt7986a-pinctrl";
> +        reg = <0 0x1001f000 0 0x1000>,
> +              <0 0x11c30000 0 0x1000>,
> +              <0 0x11c40000 0 0x1000>,
> +              <0 0x11e20000 0 0x1000>,
> +              <0 0x11e30000 0 0x1000>,
> +              <0 0x11f00000 0 0x1000>,
> +              <0 0x11f10000 0 0x1000>,
> +              <0 0x1000b000 0 0x1000>;
> +        reg-names = "gpio_base", "iocfg_rt_base", "iocfg_rb_base",
> +              "iocfg_lt_base", "iocfg_lb_base", "iocfg_tr_base",
> +              "iocfg_tl_base", "eint";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&pio 0 0 100>;
> +        interrupt-controller;
> +        interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> +        interrupt-parent = <&gic>;
> +        #interrupt-cells = <2>;
> +
> +        uart1_pins: uart1-pins-42-to-45 {
> +          mux {
> +            function = "uart";
> +            groups = "uart1";
> +          };
> +        };
> +
> +        uart2_pins: uart1-pins-46-to-49 {
> +          mux {
> +            function = "uart";
> +            groups = "uart2";
> +          };
> +        };
> +
> +      };
> +    };
> -- 
> 2.29.2
> 
> 
