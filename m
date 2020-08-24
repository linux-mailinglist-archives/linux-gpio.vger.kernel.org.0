Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2180F24F72D
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Aug 2020 11:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729171AbgHXJKH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 24 Aug 2020 05:10:07 -0400
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:57587 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729369AbgHXJKA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Aug 2020 05:10:00 -0400
X-Originating-IP: 93.34.118.233
Received: from uno.localdomain (93-34-118-233.ip49.fastwebnet.it [93.34.118.233])
        (Authenticated sender: jacopo@jmondi.org)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 44C6F1BF203;
        Mon, 24 Aug 2020 09:09:54 +0000 (UTC)
Date:   Mon, 24 Aug 2020 11:13:40 +0200
From:   Jacopo Mondi <jacopo@jmondi.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: rza1: Convert to json-schema
Message-ID: <20200824091340.htydmmo2fazq2gku@uno.localdomain>
References: <20200821111956.4989-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200821111956.4989-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 21, 2020 at 01:19:56PM +0200, Geert Uytterhoeven wrote:
> Convert the Renesas RZ/A1 combined Pin and GPIO controller Device Tree
> binding documentation to json-schema.
>
> Rename "rza1-pinctrl" to "rza1-ports", to match the compatible value
> scheme.
> Use "pinctrl" generic node name.
> Drop generic and consumer examples, as they do not belong here.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Note: "phandle: true" is needed because dt-schema does not add it
>       automatically to subnodes.
>
> This depends on "[PATCH] pinctrl: rza1: Switch to using "output-enable".
> To be queued in sh-pfc for v5.10.
> ---
>  .../bindings/pinctrl/renesas,rza1-pinctrl.txt | 222 ------------------
>  .../bindings/pinctrl/renesas,rza1-ports.yaml  | 190 +++++++++++++++
>  2 files changed, 190 insertions(+), 222 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,rza1-ports.yaml
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
> deleted file mode 100644
> index 38cdd23d3498e74a..0000000000000000
> --- a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-pinctrl.txt
> +++ /dev/null
> @@ -1,222 +0,0 @@
> -Renesas RZ/A1 combined Pin and GPIO controller
> -
> -The Renesas SoCs of the RZ/A1 family feature a combined Pin and GPIO controller,
> -named "Ports" in the hardware reference manual.
> -Pin multiplexing and GPIO configuration is performed on a per-pin basis
> -writing configuration values to per-port register sets.
> -Each "port" features up to 16 pins, each of them configurable for GPIO
> -function (port mode) or in alternate function mode.
> -Up to 8 different alternate function modes exist for each single pin.
> -
> -Pin controller node
> --------------------
> -
> -Required properties:
> -  - compatible: should be:
> -    - "renesas,r7s72100-ports": for RZ/A1H
> -    - "renesas,r7s72101-ports", "renesas,r7s72100-ports": for RZ/A1M
> -    - "renesas,r7s72102-ports": for RZ/A1L
> -
> -  - reg
> -    address base and length of the memory area where the pin controller
> -    hardware is mapped to.
> -
> -Example:
> -Pin controller node for RZ/A1H SoC (r7s72100)
> -
> -pinctrl: pin-controller@fcfe3000 {
> -	compatible = "renesas,r7s72100-ports";
> -
> -	reg = <0xfcfe3000 0x4230>;
> -};
> -
> -Sub-nodes
> ----------
> -
> -The child nodes of the pin controller node describe a pin multiplexing
> -function or a GPIO controller alternatively.
> -
> -- Pin multiplexing sub-nodes:
> -  A pin multiplexing sub-node describes how to configure a set of
> -  (or a single) pin in some desired alternate function mode.
> -  A single sub-node may define several pin configurations.
> -  A few alternate function require special pin configuration flags to be
> -  supplied along with the alternate function configuration number.
> -  The hardware reference manual specifies when a pin function requires
> -  "software IO driven" mode to be specified. To do so use the generic
> -  properties from the <include/linux/pinctrl/pinconf_generic.h> header file
> -  to instruct the pin controller to perform the desired pin configuration
> -  operation.
> -  Please refer to pinctrl-bindings.txt to get to know more on generic
> -  pin properties usage.
> -
> -  The allowed generic formats for a pin multiplexing sub-node are the
> -  following ones:
> -
> -  node-1 {
> -      pinmux = <PIN_ID_AND_MUX>, <PIN_ID_AND_MUX>, ... ;
> -      GENERIC_PINCONFIG;
> -  };
> -
> -  node-2 {
> -      sub-node-1 {
> -          pinmux = <PIN_ID_AND_MUX>, <PIN_ID_AND_MUX>, ... ;
> -          GENERIC_PINCONFIG;
> -      };
> -
> -      sub-node-2 {
> -          pinmux = <PIN_ID_AND_MUX>, <PIN_ID_AND_MUX>, ... ;
> -          GENERIC_PINCONFIG;
> -      };
> -
> -      ...
> -
> -      sub-node-n {
> -          pinmux = <PIN_ID_AND_MUX>, <PIN_ID_AND_MUX>, ... ;
> -          GENERIC_PINCONFIG;
> -      };
> -  };
> -
> -  Use the second format when pins part of the same logical group need to have
> -  different generic pin configuration flags applied.
> -
> -  Client sub-nodes shall refer to pin multiplexing sub-nodes using the phandle
> -  of the most external one.
> -
> -  Eg.
> -
> -  client-1 {
> -      ...
> -      pinctrl-0 = <&node-1>;
> -      ...
> -  };
> -
> -  client-2 {
> -      ...
> -      pinctrl-0 = <&node-2>;
> -      ...
> -  };
> -
> -  Required properties:
> -    - pinmux:
> -      integer array representing pin number and pin multiplexing configuration.
> -      When a pin has to be configured in alternate function mode, use this
> -      property to identify the pin by its global index, and provide its
> -      alternate function configuration number along with it.
> -      When multiple pins are required to be configured as part of the same
> -      alternate function they shall be specified as members of the same
> -      argument list of a single "pinmux" property.
> -      Helper macros to ease assembling the pin index from its position
> -      (port where it sits on and pin number) and alternate function identifier
> -      are provided by the pin controller header file at:
> -      <include/dt-bindings/pinctrl/r7s72100-pinctrl.h>
> -      Integers values in "pinmux" argument list are assembled as:
> -      ((PORT * 16 + PIN) | MUX_FUNC << 16)
> -
> -  Optional generic properties:
> -    - input-enable:
> -      enable input bufer for pins requiring software driven IO input
> -      operations.
> -    - output-enable:
> -      enable output buffer for pins requiring software driven IO output
> -      operations.
> -
> -  The hardware reference manual specifies when a pin has to be configured to
> -  work in bi-directional mode and when the IO direction has to be specified
> -  by software. Bi-directional pins are managed by the pin controller driver
> -  internally, while software driven IO direction has to be explicitly
> -  selected when multiple options are available.
> -
> -  Example:
> -  A serial communication interface with a TX output pin and an RX input pin.
> -
> -  &pinctrl {
> -	scif2_pins: serial2 {
> -		pinmux = <RZA1_PINMUX(3, 0, 6)>, <RZA1_PINMUX(3, 2, 4)>;
> -	};
> -  };
> -
> -  Pin #0 on port #3 is configured as alternate function #6.
> -  Pin #2 on port #3 is configured as alternate function #4.
> -
> -  Example 2:
> -  I2c master: both SDA and SCL pins need bi-directional operations
> -
> -  &pinctrl {
> -	i2c2_pins: i2c2 {
> -		pinmux = <RZA1_PINMUX(1, 4, 1)>, <RZA1_PINMUX(1, 5, 1)>;
> -	};
> -  };
> -
> -  Pin #4 on port #1 is configured as alternate function #1.
> -  Pin #5 on port #1 is configured as alternate function #1.
> -  Both need to work in bi-directional mode, the driver manages this internally.
> -
> -  Example 3:
> -  Multi-function timer input and output compare pins.
> -  Configure TIOC0A as software driven input and TIOC0B as software driven
> -  output.
> -
> -  &pinctrl {
> -	tioc0_pins: tioc0 {
> -		tioc0_input_pins {
> -			pinumx = <RZA1_PINMUX(4, 0, 2)>;
> -			input-enable;
> -		};
> -
> -		tioc0_output_pins {
> -			pinmux = <RZA1_PINMUX(4, 1, 1)>;
> -			output-enable;
> -		};
> -	};
> -  };
> -
> -  &tioc0 {
> -	...
> -	pinctrl-0 = <&tioc0_pins>;
> -	...
> -  };
> -
> -  Pin #0 on port #4 is configured as alternate function #2 with IO direction
> -  specified by software as input.
> -  Pin #1 on port #4 is configured as alternate function #1 with IO direction
> -  specified by software as output.
> -
> -- GPIO controller sub-nodes:
> -  Each port of the r7s72100 pin controller hardware is itself a GPIO controller.
> -  Different SoCs have different numbers of available pins per port, but
> -  generally speaking, each of them can be configured in GPIO ("port") mode
> -  on this hardware.
> -  Describe GPIO controllers using sub-nodes with the following properties.
> -
> -  Required properties:
> -    - gpio-controller
> -      empty property as defined by the GPIO bindings documentation.
> -    - #gpio-cells
> -      number of cells required to identify and configure a GPIO.
> -      Shall be 2.
> -    - gpio-ranges
> -      Describes a GPIO controller specifying its specific pin base, the pin
> -      base in the global pin numbering space, and the number of controlled
> -      pins, as defined by the GPIO bindings documentation. Refer to
> -      Documentation/devicetree/bindings/gpio/gpio.txt file for a more detailed
> -      description.
> -
> -  Example:
> -  A GPIO controller node, controlling 16 pins indexed from 0.
> -  The GPIO controller base in the global pin indexing space is pin 48, thus
> -  pins [0 - 15] on this controller map to pins [48 - 63] in the global pin
> -  indexing space.
> -
> -  port3: gpio-3 {
> -	gpio-controller;
> -	#gpio-cells = <2>;
> -	gpio-ranges = <&pinctrl 0 48 16>;
> -  };
> -
> -  A device node willing to use pins controlled by this GPIO controller, shall
> -  refer to it as follows:
> -
> -  led1 {
> -	gpios = <&port3 10 GPIO_ACTIVE_LOW>;
> -  };
> diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rza1-ports.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-ports.yaml
> new file mode 100644
> index 0000000000000000..7f80578dc229fb84
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rza1-ports.yaml
> @@ -0,0 +1,190 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/renesas,rza1-ports.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas RZ/A1 combined Pin and GPIO controller
> +
> +maintainers:
> +  - Jacopo Mondi <jacopo+renesas@jmondi.org>
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +
> +description:
> +  The Renesas SoCs of the RZ/A1 family feature a combined Pin and GPIO
> +  controller, named "Ports" in the hardware reference manual.
> +  Pin multiplexing and GPIO configuration is performed on a per-pin basis
> +  writing configuration values to per-port register sets.
> +  Each "port" features up to 16 pins, each of them configurable for GPIO
> +  function (port mode) or in alternate function mode.
> +  Up to 8 different alternate function modes exist for each single pin.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: renesas,r7s72100-ports     # RZ/A1H
> +      - items:
> +          - const: renesas,r7s72101-ports # RZ/A1M
> +          - const: renesas,r7s72100-ports # fallback
> +      - const: renesas,r7s72102-ports     # RZ/A1L
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +patternProperties:
> +  "^gpio-[0-9]*$":
> +    type: object
> +
> +    description:
> +      Each port of the r7s72100 pin controller hardware is itself a GPIO
> +      controller.
> +      Different SoCs have different numbers of available pins per port, but
> +      generally speaking, each of them can be configured in GPIO ("port") mode
> +      on this hardware.
> +      Describe GPIO controllers using sub-nodes with the following properties.
> +
> +    properties:
> +      gpio-controller: true
> +
> +      '#gpio-cells':
> +        const: 2
> +
> +      gpio-ranges:
> +        maxItems: 1
> +
> +    required:
> +      - gpio-controller

Doesn't 'true' imply required ?

> +      - '#gpio-cells'
> +      - gpio-ranges
> +
> +
> +additionalProperties:
> +  anyOf:

Confused by this part. This describes a GPIO consumer, doesn't it ?
Does this part belong here ?

Thanks
  j

> +    - type: object
> +      allOf:
> +        - $ref: pincfg-node.yaml#
> +        - $ref: pinmux-node.yaml#
> +
> +      description:
> +        A pin multiplexing sub-node describes how to configure a set of (or a
> +        single) pin in some desired alternate function mode.
> +        A single sub-node may define several pin configurations.
> +        A few alternate function require special pin configuration flags to be
> +        supplied along with the alternate function configuration number.
> +        The hardware reference manual specifies when a pin function requires
> +        "software IO driven" mode to be specified. To do so use the generic
> +        properties from the <include/linux/pinctrl/pinconf_generic.h> header
> +        file to instruct the pin controller to perform the desired pin
> +        configuration operation.
> +        The hardware reference manual specifies when a pin has to be configured
> +        to work in bi-directional mode and when the IO direction has to be
> +        specified by software. Bi-directional pins must be managed by the pin
> +        controller driver internally, while software driven IO direction has to
> +        be explicitly selected when multiple options are available.
> +
> +      properties:
> +        pinmux:
> +          description: |
> +            Integer array representing pin number and pin multiplexing
> +            configuration.
> +            When a pin has to be configured in alternate function mode, use
> +            this property to identify the pin by its global index, and provide
> +            its alternate function configuration number along with it.
> +            When multiple pins are required to be configured as part of the
> +            same alternate function they shall be specified as members of the
> +            same argument list of a single "pinmux" property.
> +            Helper macros to ease assembling the pin index from its position
> +            (port where it sits on and pin number) and alternate function
> +            identifier are provided by the pin controller header file at:
> +            <include/dt-bindings/pinctrl/r7s72100-pinctrl.h>
> +            Integers values in "pinmux" argument list are assembled as:
> +            ((PORT * 16 + PIN) | MUX_FUNC << 16)
> +
> +        phandle: true
> +        input-enable: true
> +        output-enable: true
> +
> +      required:
> +        - pinmux
> +
> +      additionalProperties: false
> +
> +    - type: object
> +      properties:
> +        phandle: true
> +
> +      additionalProperties:
> +        $ref: "#/additionalProperties/anyOf/0"
> +
> +examples:
> +  - |
> +    #include <dt-bindings/pinctrl/r7s72100-pinctrl.h>
> +    pinctrl: pinctrl@fcfe3000 {
> +            compatible = "renesas,r7s72100-ports";
> +
> +            reg = <0xfcfe3000 0x4230>;
> +
> +            /*
> +             * A GPIO controller node, controlling 16 pins indexed from 0.
> +             * The GPIO controller base in the global pin indexing space is pin
> +             * 48, thus pins [0 - 15] on this controller map to pins [48 - 63]
> +             * in the global pin indexing space.
> +             */
> +            port3: gpio-3 {
> +                    gpio-controller;
> +                    #gpio-cells = <2>;
> +                    gpio-ranges = <&pinctrl 0 48 16>;
> +            };
> +
> +            /*
> +             * A serial communication interface with a TX output pin and an RX
> +             * input pin.
> +             * Pin #0 on port #3 is configured as alternate function #6.
> +             * Pin #2 on port #3 is configured as alternate function #4.
> +             */
> +            scif2_pins: serial2 {
> +                    pinmux = <RZA1_PINMUX(3, 0, 6)>, <RZA1_PINMUX(3, 2, 4)>;
> +            };
> +
> +
> +            /*
> +             * I2c master: both SDA and SCL pins need bi-directional operations
> +             * Pin #4 on port #1 is configured as alternate function #1.
> +             * Pin #5 on port #1 is configured as alternate function #1.
> +             * Both need to work in bi-directional mode, the driver must manage
> +             * this internally.
> +             */
> +            i2c2_pins: i2c2 {
> +                    pinmux = <RZA1_PINMUX(1, 4, 1)>, <RZA1_PINMUX(1, 5, 1)>;
> +            };
> +
> +
> +            /*
> +             * Multi-function timer input and output compare pins.
> +             */
> +            tioc0_pins: tioc0 {
> +                    /*
> +                     * Configure TIOC0A as software driven input
> +                     * Pin #0 on port #4 is configured as alternate function #2
> +                     * with IO direction specified by software as input.
> +                     */
> +                    tioc0_input_pins {
> +                            pinmux = <RZA1_PINMUX(4, 0, 2)>;
> +                            input-enable;
> +                    };
> +
> +                    /*
> +                     * Configure TIOC0B as software driven output
> +                     * Pin #1 on port #4 is configured as alternate function #1
> +                     * with IO direction specified by software as output.
> +                     */
> +                    tioc0_output_pins {
> +                            pinmux = <RZA1_PINMUX(4, 1, 1)>;
> +                            output-enable;
> +                    };
> +            };
> +    };
> --
> 2.17.1
>
