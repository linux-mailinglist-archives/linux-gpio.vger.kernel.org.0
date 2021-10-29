Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45D1D43F495
	for <lists+linux-gpio@lfdr.de>; Fri, 29 Oct 2021 03:50:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231299AbhJ2Bwj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 Oct 2021 21:52:39 -0400
Received: from mail-ot1-f45.google.com ([209.85.210.45]:37759 "EHLO
        mail-ot1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbhJ2Bwi (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 Oct 2021 21:52:38 -0400
Received: by mail-ot1-f45.google.com with SMTP id v40-20020a056830092800b0055591caa9c6so3127029ott.4;
        Thu, 28 Oct 2021 18:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=H3UM1yNKAMv5+ROxM01H3Les+3KYJBWUhYXsGVz9HXI=;
        b=UHx6KF66XSPd6MSmppFeDTNBFjvzb1HKkNUW62AZcvCUxViLyI8IUYSzr/cLw+5e5N
         rG2yHINzBC+IaOaqEe1R03IVWI6u/XXynXL3Hu0t3bdg/4tnphv03PjKyQDRhyWBmYMs
         oROeLQIhJ5yQCQUE9t0WOSIlJa+2sk0zlGIazb2kVi48NUfhxR58aoIOJaWlcunURXWV
         e0eUISbojFGbkp2AKnCb+yXQtpZpchCrcn43kqALkZ2mCb20xmzefLrcxhM+eT1nPzOA
         nmyv2fv0sR/NiAsS19gJRsxXFd3p8gWcE3Ur++8622YF+i1evpeMpGpDHLcNBxqvSgMn
         3lDQ==
X-Gm-Message-State: AOAM533JO91rRAn94ntW7P8gHOJOiYk3ydpD2/Q+QcGunvc32HNmMIPP
        V1cTFPXM///XbCNuPX7gag==
X-Google-Smtp-Source: ABdhPJzeqA4H7YRYKsGQX2iZPlbOJOxccklzl4S8ZEB0QiJVnICczvJHMmJHSe64OxJzbHZY4doVzw==
X-Received: by 2002:a9d:20ea:: with SMTP id x97mr643726ota.152.1635472210373;
        Thu, 28 Oct 2021 18:50:10 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id q2sm1459725ooe.12.2021.10.28.18.50.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 18:50:09 -0700 (PDT)
Received: (nullmailer pid 987313 invoked by uid 1000);
        Fri, 29 Oct 2021 01:50:08 -0000
Date:   Thu, 28 Oct 2021 20:50:08 -0500
From:   Rob Herring <robh@kernel.org>
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-serial@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/16] dt-bindings: pinctrl: Add StarFive JH7100
 bindings
Message-ID: <YXtTUGC5P41JtvoR@robh.at.kernel.org>
References: <20211021174223.43310-1-kernel@esmil.dk>
 <20211021174223.43310-12-kernel@esmil.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021174223.43310-12-kernel@esmil.dk>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Oct 21, 2021 at 07:42:18PM +0200, Emil Renner Berthing wrote:
> Add bindings for the StarFive JH7100 GPIO/pin controller.
> 
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> ---
>  .../pinctrl/starfive,jh7100-pinctrl.yaml      | 274 ++++++++++++++++++
>  1 file changed, 274 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
> new file mode 100644
> index 000000000000..342ecd91a3b0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/starfive,jh7100-pinctrl.yaml
> @@ -0,0 +1,274 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/starfive,jh7100-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7100 Pin Controller Device Tree Bindings
> +
> +maintainers:
> +  - Emil Renner Berthing <kernel@esmil.dk>
> +  - Drew Fustini <drew@beagleboard.org>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7100-pinctrl
> +
> +  reg:
> +    minItems: 2
> +    maxItems: 2
> +
> +  reg-names:
> +    items:
> +      - const: "gpio"
> +      - const: "padctl"

Don't need quotes.

> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +    description: |
> +      Number of cells in GPIO specifier. Since the generic GPIO
> +      binding is used, the amount of cells must be specified as 2.
> +
> +  interrupts:
> +    maxItems: 1
> +    description: The GPIO parent interrupt.
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  starfive,signal-group:
> +    description: |
> +      The SoC has a global setting selecting one of 7 different pinmux
> +      configurations of the pads named GPIO[0:63] and FUNC_SHARE[0:141]. After
> +      this global setting is chosen only the 64 "GPIO" pins can be further
> +      muxed by configuring them to be controlled by certain peripherals rather
> +      than software.
> +      Note that in configuration 0 none of GPIOs are routed to pads, and only
> +      in configuration 1 are the GPIOs routed to the pads named GPIO[0:63].
> +      If this property is not set it defaults to the configuration already
> +      chosen by the earlier boot stages.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 3, 4, 5, 6]
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - clocks
> +  - gpio-controller
> +  - "#gpio-cells"
> +  - interrupts
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +
> +patternProperties:
> +  '-[0-9]*$':

Can you make this more specific. As-is, '-' and 'foo-' are valid.

> +    type: object
> +    patternProperties:
> +      '-pins*$':

So foo-pinsssssss is okay? Drop the '*' or use ? if you intend to 
support 'foo-pin'.

> +        type: object
> +        description: |
> +          A pinctrl node should contain at least one subnode representing the
> +          pinctrl groups available on the machine. Each subnode will list the
> +          pins it needs, and how they should be configured, with regard to
> +          muxer configuration, bias, input enable/disable, input schmitt
> +          trigger enable/disable, slew-rate and drive strength.
> +        $ref: "/schemas/pinctrl/pincfg-node.yaml"
> +
> +        properties:
> +          pins:
> +            description: |
> +              The list of pin identifiers that properties in the node apply to.
> +              This should be set using either the PAD_GPIO or PAD_FUNC_SHARE
> +              macro. Either this or "pinmux" has to be specified.
> +
> +          pinmux:
> +            description: |
> +              The list of GPIO identifiers and their mux settings that
> +              properties in the node apply to. This should be set using the
> +              GPIOMUX macro. Either this or "pins" has to be specified.
> +
> +          bias-disable: true
> +
> +          bias-pull-up:
> +            type: boolean

Already has a type. Need to reference the common schema.

> +
> +          bias-pull-down:
> +            type: boolean
> +
> +          drive-strength:
> +            enum: [ 14, 21, 28, 35, 42, 49, 56, 63 ]
> +
> +          input-enable: true
> +
> +          input-disable: true
> +
> +          input-schmitt-enable: true
> +
> +          input-schmitt-disable: true
> +
> +          slew-rate:
> +            maximum: 7
> +
> +          starfive,strong-pull-up:
> +            description: enable strong pull-up.
> +            type: boolean
> +
> +        additionalProperties: false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/starfive-jh7100.h>
> +    #include <dt-bindings/reset/starfive-jh7100.h>
> +    #include <dt-bindings/pinctrl/pinctrl-starfive.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        gpio: pinctrl@11910000 {
> +            compatible = "starfive,jh7100-pinctrl";
> +            reg = <0x0 0x11910000 0x0 0x10000>,
> +                  <0x0 0x11858000 0x0 0x1000>;
> +            reg-names = "gpio", "padctl";
> +            clocks = <&clkgen JH7100_CLK_GPIO_APB>;
> +            resets = <&clkgen JH7100_RSTN_GPIO_APB>;
> +            interrupts = <32>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            interrupt-controller;
> +            #interrupt-cells = <2>;
> +            starfive,signal-group = <6>;
> +
> +            gmac_pins_default: gmac-0 {
> +                gtxclk-pins {
> +                    pins = <PAD_FUNC_SHARE(115)>;
> +                    bias-pull-up;
> +                    drive-strength = <35>;
> +                    input-enable;
> +                    input-schmitt-enable;
> +                    slew-rate = <0>;
> +                };
> +                miitxclk-pins {
> +                    pins = <PAD_FUNC_SHARE(116)>;
> +                    bias-pull-up;
> +                    drive-strength = <14>;
> +                    input-enable;
> +                    input-schmitt-disable;
> +                    slew-rate = <0>;
> +                };
> +                tx-pins {
> +                    pins = <PAD_FUNC_SHARE(117)>,
> +                           <PAD_FUNC_SHARE(119)>,
> +                           <PAD_FUNC_SHARE(120)>,
> +                           <PAD_FUNC_SHARE(121)>,
> +                           <PAD_FUNC_SHARE(122)>,
> +                           <PAD_FUNC_SHARE(123)>,
> +                           <PAD_FUNC_SHARE(124)>,
> +                           <PAD_FUNC_SHARE(125)>,
> +                           <PAD_FUNC_SHARE(126)>;
> +                    bias-disable;
> +                    drive-strength = <35>;
> +                    input-disable;
> +                    input-schmitt-disable;
> +                    slew-rate = <0>;
> +                };
> +                rxclk-pins {
> +                    pins = <PAD_FUNC_SHARE(127)>;
> +                    bias-pull-up;
> +                    drive-strength = <14>;
> +                    input-enable;
> +                    input-schmitt-disable;
> +                    slew-rate = <6>;
> +                };
> +                rxer-pins {
> +                    pins = <PAD_FUNC_SHARE(129)>;
> +                    bias-pull-up;
> +                    drive-strength = <14>;
> +                    input-enable;
> +                    input-schmitt-disable;
> +                    slew-rate = <0>;
> +                };
> +                rx-pins {
> +                    pins = <PAD_FUNC_SHARE(128)>,
> +                           <PAD_FUNC_SHARE(130)>,
> +                           <PAD_FUNC_SHARE(131)>,
> +                           <PAD_FUNC_SHARE(132)>,
> +                           <PAD_FUNC_SHARE(133)>,
> +                           <PAD_FUNC_SHARE(134)>,
> +                           <PAD_FUNC_SHARE(135)>,
> +                           <PAD_FUNC_SHARE(136)>,
> +                           <PAD_FUNC_SHARE(137)>,
> +                           <PAD_FUNC_SHARE(138)>,
> +                           <PAD_FUNC_SHARE(139)>,
> +                           <PAD_FUNC_SHARE(140)>,
> +                           <PAD_FUNC_SHARE(141)>;
> +                    bias-pull-up;
> +                    drive-strength = <14>;
> +                    input-enable;
> +                    input-schmitt-enable;
> +                    slew-rate = <0>;
> +                };
> +            };
> +
> +            i2c0_pins_default: i2c0-0 {
> +                i2c-pins {
> +                    pinmux = <GPIOMUX(62, GPO_LOW,
> +                              GPO_I2C0_PAD_SCK_OEN,
> +                              GPI_I2C0_PAD_SCK_IN)>,
> +                             <GPIOMUX(61, GPO_LOW,
> +                              GPO_I2C0_PAD_SDA_OEN,
> +                              GPI_I2C0_PAD_SDA_IN)>;
> +                    bias-disable; /* external pull-up */
> +                    input-enable;
> +                    input-schmitt-enable;
> +                };
> +            };
> +
> +            uart3_pins_default: uart3-0 {
> +                rx-pin {
> +                    pinmux = <GPIOMUX(13, GPO_LOW, GPO_DISABLE,
> +                              GPI_UART3_PAD_SIN)>;
> +                    bias-pull-up;
> +                    input-enable;
> +                    input-schmitt-enable;
> +                };
> +                tx-pin {
> +                    pinmux = <GPIOMUX(14, GPO_UART3_PAD_SOUT,
> +                              GPO_ENABLE, GPI_NONE)>;
> +                    bias-disable;
> +                    input-disable;
> +                    input-schmitt-disable;
> +                };
> +            };
> +        };
> +
> +        gmac {
> +            pinctrl-0 = <&gmac_pins_default>;
> +            pinctrl-names = "default";
> +        };
> +
> +        i2c0 {
> +            pinctrl-0 = <&i2c0_pins_default>;
> +            pinctrl-names = "default";
> +        };
> +
> +        uart3 {
> +            pinctrl-0 = <&uart3_pins_default>;
> +            pinctrl-names = "default";
> +        };
> +    };
> +
> +...
> -- 
> 2.33.1
> 
> 
