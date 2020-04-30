Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F4741BEE54
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Apr 2020 04:32:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbgD3Ccl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Apr 2020 22:32:41 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:32910 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726620AbgD3Ccl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Apr 2020 22:32:41 -0400
Received: by mail-ot1-f65.google.com with SMTP id j26so3675923ots.0;
        Wed, 29 Apr 2020 19:32:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mYHX4LF9hVH/oR4VKEaf+ofdtqvCQ9cUbvGYlUqbAjs=;
        b=qp3xNM1A9v4qib9nOj6a3FGZcyjOb4KUn8jMwtrXQeIyX7hPtuKFXxj/J1ZU4BGoQ7
         00dqu5X7pZUOeV+J5kuC6zGrRvm7nsj4GKanx0823aM3bpgTv/vF0aAjf9B+jUWIouG1
         VA5Lf7ci/ZjE3oWt7mxHgtFhW2xMHYQxjtaQWZqHx0UrfcUMR8I0mcX7gWlG10B4xGX3
         gwjcUkgLne1dp+H14tz5hd5Ql0c53nCgOH9m3pXaaneQssiIZSA8dF1pCJnYYsZtbUec
         dRwhH9s6IFM69ITcYvF+XoEC3Zrd206O8/ZDpA8weIBWksPLaAo/2i9zRFmsaJNs7N2q
         uSnA==
X-Gm-Message-State: AGi0PuZIzAJr6otpxndx1AKE4qexad64VT22C/u5szHNB/COL6PN8c/d
        aJ5C8SGVNouiK4vAsPOdbcb1ES8=
X-Google-Smtp-Source: APiQypJTNPTUmzc8GtdxII0qxddbgs/EMo0ckja9/Si33b2OyrMGnOGcdvIyEAoFkCAiPhg4zmbO7A==
X-Received: by 2002:a9d:6142:: with SMTP id c2mr853507otk.92.1588213958999;
        Wed, 29 Apr 2020 19:32:38 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t9sm908805oie.24.2020.04.29.19.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 19:32:38 -0700 (PDT)
Received: (nullmailer pid 3430 invoked by uid 1000);
        Thu, 30 Apr 2020 02:32:37 -0000
Date:   Wed, 29 Apr 2020 21:32:37 -0500
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH RFC] dt-bindings: pinctrl: sh-pfc: Convert to json-schema
Message-ID: <20200430023237.GA23316@bogus>
References: <20200417140920.22596-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200417140920.22596-1-geert+renesas@glider.be>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Apr 17, 2020 at 04:09:20PM +0200, Geert Uytterhoeven wrote:
> Convert the Renesas Pin Function Controller (PFC) Device Tree binding
> documentation to json-schema.
> 
> Document missing properties.
> Drop deprecated and obsolete #gpio-range-cells property.
> Update the example to match reality.
> Drop consumer examples, as they do not belong here.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> How to describe that pin configuration nodes can have subnodes?
> E.g.
> 
>     arch/arm/boot/dts/sh73a0-kzm9g.dt.yaml: pin-controller@e6050000: mmc: Additional properties are not allowed ('cfg', 'mux' were unexpected)

I shouldn't tell you so no one does this again...

I think you want something like this assuming you have either 
grandchildren or properties, but not both in the child nodes:

patternProperties:
  ".*":
    if:
      type: object
    then:
      oneOf:
        - allOf:
            - $ref: pincfg-node.yaml#
            - $ref: pinmux-node.yaml#
          ...
        - patternProperties:
            ".*":
              type: object
              allOf:
                - $ref: pincfg-node.yaml#
                - $ref: pinmux-node.yaml#

If you did have a mixture, then you'd need the same if/then construct.

Now it probably ends up that the 'allOf' and everything else with it are 
duplicated. If so you can do:

definitions:
  pin-nodes:
    allOf:
    ...

And use '$ref: #/definitions/pin-nodes' where you need it. 

That probably is not going to work with the fixups the tooling does, but 
we could fix that.


> Dropping "additionalProperties: false" from the patternProperties
> section gets rid of these warnings, but of course it would be better if
> the subnodes would be validated, too.
> 
> Thanks!
> ---
>  .../bindings/pinctrl/renesas,pfc-pinctrl.txt  | 186 ------------------
>  .../bindings/pinctrl/renesas,pfc.yaml         | 145 ++++++++++++++
>  2 files changed, 145 insertions(+), 186 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
> deleted file mode 100644
> index 6eada23eaa31e430..0000000000000000
> --- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc-pinctrl.txt
> +++ /dev/null
> @@ -1,186 +0,0 @@
> -* Renesas Pin Function Controller (GPIO and Pin Mux/Config)
> -
> -The Pin Function Controller (PFC) is a Pin Mux/Config controller. On SH73A0,
> -R8A73A4 and R8A7740 it also acts as a GPIO controller.
> -
> -
> -Pin Control
> ------------
> -
> -Required Properties:
> -
> -  - compatible: should be one of the following.
> -    - "renesas,pfc-emev2": for EMEV2 (EMMA Mobile EV2) compatible pin-controller.
> -    - "renesas,pfc-r8a73a4": for R8A73A4 (R-Mobile APE6) compatible pin-controller.
> -    - "renesas,pfc-r8a7740": for R8A7740 (R-Mobile A1) compatible pin-controller.
> -    - "renesas,pfc-r8a7743": for R8A7743 (RZ/G1M) compatible pin-controller.
> -    - "renesas,pfc-r8a7744": for R8A7744 (RZ/G1N) compatible pin-controller.
> -    - "renesas,pfc-r8a7745": for R8A7745 (RZ/G1E) compatible pin-controller.
> -    - "renesas,pfc-r8a77470": for R8A77470 (RZ/G1C) compatible pin-controller.
> -    - "renesas,pfc-r8a774a1": for R8A774A1 (RZ/G2M) compatible pin-controller.
> -    - "renesas,pfc-r8a774b1": for R8A774B1 (RZ/G2N) compatible pin-controller.
> -    - "renesas,pfc-r8a774c0": for R8A774C0 (RZ/G2E) compatible pin-controller.
> -    - "renesas,pfc-r8a7778": for R8A7778 (R-Car M1) compatible pin-controller.
> -    - "renesas,pfc-r8a7779": for R8A7779 (R-Car H1) compatible pin-controller.
> -    - "renesas,pfc-r8a7790": for R8A7790 (R-Car H2) compatible pin-controller.
> -    - "renesas,pfc-r8a7791": for R8A7791 (R-Car M2-W) compatible pin-controller.
> -    - "renesas,pfc-r8a7792": for R8A7792 (R-Car V2H) compatible pin-controller.
> -    - "renesas,pfc-r8a7793": for R8A7793 (R-Car M2-N) compatible pin-controller.
> -    - "renesas,pfc-r8a7794": for R8A7794 (R-Car E2) compatible pin-controller.
> -    - "renesas,pfc-r8a7795": for R8A7795 (R-Car H3) compatible pin-controller.
> -    - "renesas,pfc-r8a7796": for R8A77960 (R-Car M3-W) compatible pin-controller.
> -    - "renesas,pfc-r8a77961": for R8A77961 (R-Car M3-W+) compatible pin-controller.
> -    - "renesas,pfc-r8a77965": for R8A77965 (R-Car M3-N) compatible pin-controller.
> -    - "renesas,pfc-r8a77970": for R8A77970 (R-Car V3M) compatible pin-controller.
> -    - "renesas,pfc-r8a77980": for R8A77980 (R-Car V3H) compatible pin-controller.
> -    - "renesas,pfc-r8a77990": for R8A77990 (R-Car E3) compatible pin-controller.
> -    - "renesas,pfc-r8a77995": for R8A77995 (R-Car D3) compatible pin-controller.
> -    - "renesas,pfc-sh73a0": for SH73A0 (SH-Mobile AG5) compatible pin-controller.
> -
> -  - reg: Base address and length of each memory resource used by the pin
> -    controller hardware module.
> -
> -Optional properties:
> -
> -  - #gpio-range-cells: Mandatory when the PFC doesn't handle GPIO, forbidden
> -    otherwise. Should be 3.
> -
> -  - interrupts-extended: Specify the interrupts associated with external
> -    IRQ pins. This property is mandatory when the PFC handles GPIOs and
> -    forbidden otherwise. When specified, it must contain one interrupt per
> -    external IRQ, sorted by external IRQ number.
> -
> -The PFC node also acts as a container for pin configuration nodes. Please refer
> -to pinctrl-bindings.txt in this directory for the definition of the term "pin
> -configuration node" and for the common pinctrl bindings used by client devices.
> -
> -Each pin configuration node represents a desired configuration for a pin, a
> -pin group, or a list of pins or pin groups. The configuration can include the
> -function to select on those pin(s) and pin configuration parameters (such as
> -pull-up and pull-down).
> -
> -Pin configuration nodes contain pin configuration properties, either directly
> -or grouped in child subnodes. Both pin muxing and configuration parameters can
> -be grouped in that way and referenced as a single pin configuration node by
> -client devices.
> -
> -A configuration node or subnode must reference at least one pin (through the
> -pins or pin groups properties) and contain at least a function or one
> -configuration parameter. When the function is present only pin groups can be
> -used to reference pins.
> -
> -All pin configuration nodes and subnodes names are ignored. All of those nodes
> -are parsed through phandles and processed purely based on their content.
> -
> -Pin Configuration Node Properties:
> -
> -- pins : An array of strings, each string containing the name of a pin.
> -- groups : An array of strings, each string containing the name of a pin
> -  group.
> -
> -- function: A string containing the name of the function to mux to the pin
> -  group(s) specified by the groups property.
> -
> -  Valid values for pin, group and function names can be found in the group and
> -  function arrays of the PFC data file corresponding to the SoC
> -  (drivers/pinctrl/sh-pfc/pfc-*.c)
> -
> -The pin configuration parameters use the generic pinconf bindings defined in
> -pinctrl-bindings.txt in this directory. The supported parameters are
> -bias-disable, bias-pull-up, bias-pull-down, drive-strength and power-source. For
> -pins that have a configurable I/O voltage, the power-source value should be the
> -nominal I/O voltage in millivolts.
> -
> -
> -GPIO
> -----
> -
> -On SH73A0, R8A73A4 and R8A7740 the PFC node is also a GPIO controller node.
> -
> -Required Properties:
> -
> -  - gpio-controller: Marks the device node as a gpio controller.
> -
> -  - #gpio-cells: Should be 2. The first cell is the GPIO number and the second
> -    cell specifies GPIO flags, as defined in <dt-bindings/gpio/gpio.h>. Only the
> -    GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW flags are supported.
> -
> -The syntax of the gpio specifier used by client nodes should be the following
> -with values derived from the SoC user manual.
> -
> -  <[phandle of the gpio controller node]
> -   [pin number within the gpio controller]
> -   [flags]>
> -
> -On other mach-shmobile platforms GPIO is handled by the gpio-rcar driver.
> -Please refer to Documentation/devicetree/bindings/gpio/renesas,gpio-rcar.txt
> -for documentation of the GPIO device tree bindings on those platforms.
> -
> -
> -Examples
> ---------
> -
> -Example 1: SH73A0 (SH-Mobile AG5) pin controller node
> -
> -	pfc: pin-controller@e6050000 {
> -		compatible = "renesas,pfc-sh73a0";
> -		reg = <0xe6050000 0x8000>,
> -		      <0xe605801c 0x1c>;
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -		interrupts-extended =
> -			<&irqpin0 0 0>, <&irqpin0 1 0>, <&irqpin0 2 0>, <&irqpin0 3 0>,
> -			<&irqpin0 4 0>, <&irqpin0 5 0>, <&irqpin0 6 0>, <&irqpin0 7 0>,
> -			<&irqpin1 0 0>, <&irqpin1 1 0>, <&irqpin1 2 0>, <&irqpin1 3 0>,
> -			<&irqpin1 4 0>, <&irqpin1 5 0>, <&irqpin1 6 0>, <&irqpin1 7 0>,
> -			<&irqpin2 0 0>, <&irqpin2 1 0>, <&irqpin2 2 0>, <&irqpin2 3 0>,
> -			<&irqpin2 4 0>, <&irqpin2 5 0>, <&irqpin2 6 0>, <&irqpin2 7 0>,
> -			<&irqpin3 0 0>, <&irqpin3 1 0>, <&irqpin3 2 0>, <&irqpin3 3 0>,
> -			<&irqpin3 4 0>, <&irqpin3 5 0>, <&irqpin3 6 0>, <&irqpin3 7 0>;
> -	};
> -
> -Example 2: A GPIO LED node that references a GPIO
> -
> -	#include <dt-bindings/gpio/gpio.h>
> -
> -	leds {
> -		compatible = "gpio-leds";
> -		led1 {
> -			gpios = <&pfc 20 GPIO_ACTIVE_LOW>;
> -		};
> -	};
> -
> -Example 3: KZM-A9-GT (SH-Mobile AG5) default pin state hog and pin control maps
> -           for the MMCIF and SCIFA4 devices
> -
> -	&pfc {
> -		pinctrl-0 = <&scifa4_pins>;
> -		pinctrl-names = "default";
> -
> -		mmcif_pins: mmcif {
> -			mux {
> -				groups = "mmc0_data8_0", "mmc0_ctrl_0";
> -				function = "mmc0";
> -			};
> -			cfg {
> -				groups = "mmc0_data8_0";
> -				pins = "PORT279";
> -				bias-pull-up;
> -			};
> -		};
> -
> -		scifa4_pins: scifa4 {
> -			groups = "scifa4_data", "scifa4_ctrl";
> -			function = "scifa4";
> -		};
> -	};
> -
> -Example 4: KZM-A9-GT (SH-Mobile AG5) default pin state for the MMCIF device
> -
> -	&mmcif {
> -		pinctrl-0 = <&mmcif_pins>;
> -		pinctrl-names = "default";
> -
> -		bus-width = <8>;
> -		vmmc-supply = <&reg_1p8v>;
> -	};
> diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> new file mode 100644
> index 0000000000000000..d6a536001a3a970e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> @@ -0,0 +1,145 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/renesas,pfc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Renesas Pin Function Controller (GPIO and Pin Mux/Config)
> +
> +maintainers:
> +  - Geert Uytterhoeven <geert+renesas@glider.be>
> +
> +description:
> +  The Pin Function Controller (PFC) is a Pin Mux/Config controller.
> +  On SH/R-Mobile SoCs it also acts as a GPIO controller.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - renesas,pfc-emev2       # EMMA Mobile EV2
> +      - renesas,pfc-r8a73a4     # R-Mobile APE6
> +      - renesas,pfc-r8a7740     # R-Mobile A1
> +      - renesas,pfc-r8a7743     # RZ/G1M
> +      - renesas,pfc-r8a7744     # RZ/G1N
> +      - renesas,pfc-r8a7745     # RZ/G1E
> +      - renesas,pfc-r8a77470    # RZ/G1C
> +      - renesas,pfc-r8a774a1    # RZ/G2M
> +      - renesas,pfc-r8a774b1    # RZ/G2N
> +      - renesas,pfc-r8a774c0    # RZ/G2E
> +      - renesas,pfc-r8a7778     # R-Car M1
> +      - renesas,pfc-r8a7779     # R-Car H1
> +      - renesas,pfc-r8a7790     # R-Car H2
> +      - renesas,pfc-r8a7791     # R-Car M2-W
> +      - renesas,pfc-r8a7792     # R-Car V2H
> +      - renesas,pfc-r8a7793     # R-Car M2-N
> +      - renesas,pfc-r8a7794     # R-Car E2
> +      - renesas,pfc-r8a7795     # R-Car H3
> +      - renesas,pfc-r8a7796     # R-Car M3-W
> +      - renesas,pfc-r8a77961    # R-Car M3-W+
> +      - renesas,pfc-r8a77965    # R-Car M3-N
> +      - renesas,pfc-r8a77970    # R-Car V3M
> +      - renesas,pfc-r8a77980    # R-Car V3H
> +      - renesas,pfc-r8a77990    # R-Car E3
> +      - renesas,pfc-r8a77995    # R-Car D3
> +      - renesas,pfc-sh73a0      # SH-Mobile AG5
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-ranges:
> +    minItems: 1
> +    maxItems: 16
> +
> +  interrupts-extended:

Just do 'interrupts'. It's fixed up in the tooling.

> +    minItems: 32
> +    maxItems: 64
> +    description:
> +      Specify the interrupts associated with external IRQ pins on SoCs where
> +      the PFC acts as a GPIO controller.  It must contain one interrupt per
> +      external IRQ, sorted by external IRQ number.
> +
> +  power-domains:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^.*$":
> +    if:
> +      type: object
> +    then:
> +      allOf:
> +        - $ref: pincfg-node.yaml#
> +        - $ref: pinmux-node.yaml#
> +      description:
> +        Pinctrl node's client devices use subnodes for desired pin
> +        configuration.
> +        Client device subnodes use below standard properties.
> +
> +      properties:
> +        phandle: true
> +        pins: true
> +        groups: true
> +        function: true
> +        bias-disable: true
> +        bias-pull-down: true
> +        bias-pull-up: true
> +        drive-strength:
> +          enum: [ 3, 6, 9, 12, 15, 18, 21, 24 ] # Superset of supported values
> +        power-source:
> +          enum: [ 1800, 3300 ]
> +        gpio-hog: true
> +        gpios: true
> +        output-high: true
> +        output-low: true
> +
> +      additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +
> +if:
> +  properties:
> +    compatible:
> +      items:
> +        enum:
> +          - renesas,pfc-r8a73a4
> +          - renesas,pfc-r8a7740
> +          - renesas,pfc-sh73a0
> +then:
> +  required:
> +    - interrupts-extended
> +    - gpio-controller
> +    - '#gpio-cells'
> +    - gpio-ranges
> +    - power-domains
> +
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pfc: pin-controller@e6050000 {
> +            compatible = "renesas,pfc-sh73a0";
> +            reg = <0xe6050000 0x8000>, <0xe605801c 0x1c>;
> +            gpio-controller;
> +            #gpio-cells = <2>;
> +            gpio-ranges =
> +                <&pfc 0 0 119>, <&pfc 128 128 37>, <&pfc 192 192 91>,
> +                <&pfc 288 288 22>;
> +            interrupts-extended =
> +                <&irqpin0 0 0>, <&irqpin0 1 0>, <&irqpin0 2 0>, <&irqpin0 3 0>,
> +                <&irqpin0 4 0>, <&irqpin0 5 0>, <&irqpin0 6 0>, <&irqpin0 7 0>,
> +                <&irqpin1 0 0>, <&irqpin1 1 0>, <&irqpin1 2 0>, <&irqpin1 3 0>,
> +                <&irqpin1 4 0>, <&irqpin1 5 0>, <&irqpin1 6 0>, <&irqpin1 7 0>,
> +                <&irqpin2 0 0>, <&irqpin2 1 0>, <&irqpin2 2 0>, <&irqpin2 3 0>,
> +                <&irqpin2 4 0>, <&irqpin2 5 0>, <&irqpin2 6 0>, <&irqpin2 7 0>,
> +                <&irqpin3 0 0>, <&irqpin3 1 0>, <&irqpin3 2 0>, <&irqpin3 3 0>,
> +                <&irqpin3 4 0>, <&irqpin3 5 0>, <&irqpin3 6 0>, <&irqpin3 7 0>;
> +            power-domains = <&pd_c5>;
> +    };
> -- 
> 2.17.1
> 
