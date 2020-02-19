Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 159E6164841
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2020 16:16:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726777AbgBSPQV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 19 Feb 2020 10:16:21 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:40148 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726691AbgBSPQV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 19 Feb 2020 10:16:21 -0500
Received: by mail-ot1-f65.google.com with SMTP id i6so452004otr.7;
        Wed, 19 Feb 2020 07:16:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9UdK/NvuxAwd8nrf57s06dVQ9BD68d4hTcVv/rTIoIE=;
        b=N6woa1ISTi0GBM0M5jhQiXMGDRpE2Vg+Vz5FU5/WA5FBxh4AAJB/TdcuSztbVs522j
         bGBDdv44Rp8QfIcOWPeuQpqPg8pry06rGneU4vSu83xjdTO9cDDCLifUbMm9Gl8cf0GF
         Y8gtOEXXQhlDpxhJQLmh0fpkwfvLhvHgbQtGxmScnntHkYrsSKhUBaNSI7Eq13J9d+EI
         PUWzzvcvYvd5u5ni2PR3ky8s/KF1o93ifKNdGqShuM1OPhUnwDNjaKJALCH8R+yJIb0R
         8fxoSkt29PDWq1XlFZ3JCuRxzVY1J7RUSRD1aynmpJJ6OVNGNnSrokYCk8EcaBgL8Tm+
         KLHw==
X-Gm-Message-State: APjAAAW87r7t17CL0W8nR8zCED0yN3WpmsthYgCKJ454MPNDjowQt5rF
        PU1kbw0g/lPSzI5wQh+ZJA==
X-Google-Smtp-Source: APXvYqxSw7z3z0fSVI98oBsaiy8eSFW+kYZqvDQzGZYLxH5iuNJf8ccK+XqBOmL+AtyXwEXekqkF0A==
X-Received: by 2002:a9d:62ca:: with SMTP id z10mr3532395otk.263.1582125379181;
        Wed, 19 Feb 2020 07:16:19 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id r17sm749otq.70.2020.02.19.07.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Feb 2020 07:16:18 -0800 (PST)
Received: (nullmailer pid 5117 invoked by uid 1000);
        Wed, 19 Feb 2020 15:16:17 -0000
Date:   Wed, 19 Feb 2020 09:16:17 -0600
From:   Rob Herring <robh@kernel.org>
To:     Benjamin Gaignard <benjamin.gaignard@st.com>
Cc:     lee.jones@linaro.org, mark.rutland@arm.co, alexandre.torgue@st.com,
        linus.walleij@linaro.org, amelie.delaunay@st.com,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: mfd: Convert stmfx bindings to
 json-schema
Message-ID: <20200219151617.GA22892@bogus>
References: <20200207145712.24898-1-benjamin.gaignard@st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200207145712.24898-1-benjamin.gaignard@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Feb 07, 2020 at 03:57:12PM +0100, Benjamin Gaignard wrote:
> Convert stmfx bindings to json-schema
> 
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@st.com>
> ---
> version 2:
> - fix description indentation
> - change pin controller node name to pinctrl
> - document pinctrl subnode properties
> - add pinctrl subnode example
> 
>  Documentation/devicetree/bindings/mfd/stmfx.txt    |  28 -----
>  Documentation/devicetree/bindings/mfd/stmfx.yaml   | 120 +++++++++++++++++++++
>  .../devicetree/bindings/pinctrl/pinctrl-stmfx.txt  | 116 --------------------
>  3 files changed, 120 insertions(+), 144 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mfd/stmfx.txt
>  create mode 100644 Documentation/devicetree/bindings/mfd/stmfx.yaml
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/pinctrl-stmfx.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/stmfx.txt b/Documentation/devicetree/bindings/mfd/stmfx.txt
> deleted file mode 100644
> index f0c2f7fcf5c7..000000000000
> --- a/Documentation/devicetree/bindings/mfd/stmfx.txt
> +++ /dev/null
> @@ -1,28 +0,0 @@
> -STMicroelectonics Multi-Function eXpander (STMFX) Core bindings
> -
> -ST Multi-Function eXpander (STMFX) is a slave controller using I2C for
> -communication with the main MCU. Its main features are GPIO expansion, main
> -MCU IDD measurement (IDD is the amount of current that flows through VDD) and
> -resistive touchscreen controller.
> -
> -Required properties:
> -- compatible: should be "st,stmfx-0300".
> -- reg: I2C slave address of the device.
> -- interrupts: interrupt specifier triggered by MFX_IRQ_OUT signal.
> -  Please refer to ../interrupt-controller/interrupt.txt
> -
> -Optional properties:
> -- drive-open-drain: configure MFX_IRQ_OUT as open drain.
> -- vdd-supply: phandle of the regulator supplying STMFX.
> -
> -Example:
> -
> -	stmfx: stmfx@42 {
> -		compatible = "st,stmfx-0300";
> -		reg = <0x42>;
> -		interrupts = <8 IRQ_TYPE_EDGE_RISING>;
> -		interrupt-parent = <&gpioi>;
> -		vdd-supply = <&v3v3>;
> -	};
> -
> -Please refer to ../pinctrl/pinctrl-stmfx.txt for STMFX GPIO expander function bindings.
> diff --git a/Documentation/devicetree/bindings/mfd/stmfx.yaml b/Documentation/devicetree/bindings/mfd/stmfx.yaml
> new file mode 100644
> index 000000000000..1af906fb876f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/stmfx.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/stmfx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectonics Multi-Function eXpander (STMFX) bindings
> +
> +description: ST Multi-Function eXpander (STMFX) is a slave controller using I2C for
> +               communication with the main MCU. Its main features are GPIO expansion,
> +               main MCU IDD measurement (IDD is the amount of current that flows
> +               through VDD) and resistive touchscreen controller.
> +
> +maintainers:
> +  - Amelie Delaunay <amelie.delaunay@st.com>
> +
> +properties:
> +  compatible:
> +    const: st,stmfx-0300
> +
> +  reg:
> +    enum: [ 0x42, 0x43 ]
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  drive-open-drain: true
> +
> +  vdd-supply:
> +    maxItems: 1
> +
> +  pinctrl:
> +    type: object
> +
> +    $ref: ../pinctrl/pincfg-node.yaml

allOf needed here.

However, this is not in the right spot.

> +
> +    properties:
> +      compatible:
> +        const: st,stmfx-0300-pinctrl
> +
> +      "#gpio-cells":
> +        const: 2
> +
> +      "#interrupt-cells":
> +        const: 2
> +
> +      gpio-controller: true
> +
> +      interrupt-controller: true
> +
> +      gpio-ranges:
> +        description: if all STMFX pins[24:0] are available (no other STMFX function in use),
> +                     you should use gpio-ranges = <&stmfx_pinctrl 0 0 24>;
> +                     if agpio[3:0] are not available (STMFX Touchscreen function in use),
> +                     you should use gpio-ranges = <&stmfx_pinctrl 0 0 16>, <&stmfx_pinctrl 20 20 4>;
> +                     if agpio[7:4] are not available (STMFX IDD function in use),
> +                     you should use gpio-ranges = <&stmfx_pinctrl 0 0 20>;
> +        maxItems: 1
> +
> +    patternProperties:
> +      "^[a-zA-Z][a-zA-Z0-9_]+$":

I'm surprised this works because it is going to match on most of the 
other properties in this node. You really need a node name pattern you 
can match on like '-pins$'. Otherwise, you have to do:

if:
  type: object
then:
  ...

I'd rather see the dts files fixed.

> +        type: object
> +        $ref: ../pinctrl/pinmux-node.yaml

Actually, this is why it doesn't error. With no 'allOf', 'type: object' 
is ignored.

> +
> +        properties:
> +          pins: true
> +          bias-disable: true
> +          bias-pull-up: true
> +          bias-pull-pin-default: true
> +          bias-pull-down: true
> +          drive-open-drain: true
> +          drive-push-pull: true
> +          output-high: true
> +          output-low: true

'additionalProperties: false' needed here.

> +
> +    required:
> +      - compatible
> +      - "#gpio-cells"
> +      - "#interrupt-cells"
> +      - gpio-controller
> +      - interrupt-controller
> +      - gpio-ranges
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    i2c@0 {
> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +      stmfx@42 {
> +        compatible = "st,stmfx-0300";
> +        reg = <0x42>;
> +        interrupts = <8 IRQ_TYPE_EDGE_RISING>;
> +        interrupt-parent = <&gpioi>;
> +        vdd-supply = <&v3v3>;
> +
> +        stmfx_pinctrl: pinctrl {
> +          compatible = "st,stmfx-0300-pinctrl";
> +          #gpio-cells = <2>;
> +          #interrupt-cells = <2>;
> +          gpio-controller;
> +          interrupt-controller;
> +          gpio-ranges = <&stmfx_pinctrl 0 0 24>;
> +
> +          joystick_pins: joystick {
> +            pins = "gpio0", "gpio1", "gpio2", "gpio3", "gpio4";
> +            drive-push-pull;
> +            bias-pull-up;
> +          };
> +        };
> +      };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-stmfx.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-stmfx.txt
> deleted file mode 100644
> index c1b4c1819b84..000000000000
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-stmfx.txt
> +++ /dev/null
> @@ -1,116 +0,0 @@
> -STMicroelectronics Multi-Function eXpander (STMFX) GPIO expander bindings
> -
> -ST Multi-Function eXpander (STMFX) offers up to 24 GPIOs expansion.
> -Please refer to ../mfd/stmfx.txt for STMFX Core bindings.
> -
> -Required properties:
> -- compatible: should be "st,stmfx-0300-pinctrl".
> -- #gpio-cells: should be <2>, the first cell is the GPIO number and the second
> -  cell is the gpio flags in accordance with <dt-bindings/gpio/gpio.h>.
> -- gpio-controller: marks the device as a GPIO controller.
> -- #interrupt-cells: should be <2>, the first cell is the GPIO number and the
> -  second cell is the interrupt flags in accordance with
> -  <dt-bindings/interrupt-controller/irq.h>.
> -- interrupt-controller: marks the device as an interrupt controller.
> -- gpio-ranges: specifies the mapping between gpio controller and pin
> -  controller pins. Check "Concerning gpio-ranges property" below.
> -Please refer to ../gpio/gpio.txt.
> -
> -Please refer to pinctrl-bindings.txt for pin configuration.
> -
> -Required properties for pin configuration sub-nodes:
> -- pins: list of pins to which the configuration applies.
> -
> -Optional properties for pin configuration sub-nodes (pinconf-generic ones):
> -- bias-disable: disable any bias on the pin.
> -- bias-pull-up: the pin will be pulled up.
> -- bias-pull-pin-default: use the pin-default pull state.
> -- bias-pull-down: the pin will be pulled down.
> -- drive-open-drain: the pin will be driven with open drain.
> -- drive-push-pull: the pin will be driven actively high and low.
> -- output-high: the pin will be configured as an output driving high level.
> -- output-low: the pin will be configured as an output driving low level.
> -
> -Note that STMFX pins[15:0] are called "gpio[15:0]", and STMFX pins[23:16] are
> -called "agpio[7:0]". Example, to refer to pin 18 of STMFX, use "agpio2".
> -
> -Concerning gpio-ranges property:
> -- if all STMFX pins[24:0] are available (no other STMFX function in use), you
> -  should use gpio-ranges = <&stmfx_pinctrl 0 0 24>;
> -- if agpio[3:0] are not available (STMFX Touchscreen function in use), you
> -  should use gpio-ranges = <&stmfx_pinctrl 0 0 16>, <&stmfx_pinctrl 20 20 4>;
> -- if agpio[7:4] are not available (STMFX IDD function in use), you
> -  should use gpio-ranges = <&stmfx_pinctrl 0 0 20>;
> -
> -
> -Example:
> -
> -	stmfx: stmfx@42 {
> -		...
> -
> -		stmfx_pinctrl: stmfx-pin-controller {
> -			compatible = "st,stmfx-0300-pinctrl";
> -			#gpio-cells = <2>;
> -			#interrupt-cells = <2>;
> -			gpio-controller;
> -			interrupt-controller;
> -			gpio-ranges = <&stmfx_pinctrl 0 0 24>;
> -
> -			joystick_pins: joystick {
> -				pins = "gpio0", "gpio1", "gpio2", "gpio3", "gpio4";
> -				drive-push-pull;
> -				bias-pull-up;
> -			};
> -		};
> -	};
> -
> -Example of STMFX GPIO consumers:
> -
> -	joystick {
> -		compatible = "gpio-keys";
> -		#address-cells = <1>;
> -		#size-cells = <0>;
> -		pinctrl-0 = <&joystick_pins>;
> -		pinctrl-names = "default";
> -		button-0 {
> -			label = "JoySel";
> -			linux,code = <KEY_ENTER>;
> -			interrupt-parent = <&stmfx_pinctrl>;
> -			interrupts = <0 IRQ_TYPE_EDGE_RISING>;
> -		};
> -		button-1 {
> -			label = "JoyDown";
> -			linux,code = <KEY_DOWN>;
> -			interrupt-parent = <&stmfx_pinctrl>;
> -			interrupts = <1 IRQ_TYPE_EDGE_RISING>;
> -		};
> -		button-2 {
> -			label = "JoyLeft";
> -			linux,code = <KEY_LEFT>;
> -			interrupt-parent = <&stmfx_pinctrl>;
> -			interrupts = <2 IRQ_TYPE_EDGE_RISING>;
> -		};
> -		button-3 {
> -			label = "JoyRight";
> -			linux,code = <KEY_RIGHT>;
> -			interrupt-parent = <&stmfx_pinctrl>;
> -			interrupts = <3 IRQ_TYPE_EDGE_RISING>;
> -		};
> -		button-4 {
> -			label = "JoyUp";
> -			linux,code = <KEY_UP>;
> -			interrupt-parent = <&stmfx_pinctrl>;
> -			interrupts = <4 IRQ_TYPE_EDGE_RISING>;
> -		};
> -	};
> -
> -	leds {
> -		compatible = "gpio-leds";
> -		orange {
> -			gpios = <&stmfx_pinctrl 17 1>;
> -		};
> -
> -		blue {
> -			gpios = <&stmfx_pinctrl 19 1>;
> -		};
> -	}
> -- 
> 2.15.0
> 
