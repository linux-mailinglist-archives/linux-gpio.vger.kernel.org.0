Return-Path: <linux-gpio+bounces-7859-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7C791E33D
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2024 17:04:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9F8F31C23357
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2024 15:04:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C102716D326;
	Mon,  1 Jul 2024 15:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B8lFcyjp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B5616C853;
	Mon,  1 Jul 2024 15:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719846233; cv=none; b=lnuRNjy2y2nwxK2zeQuTRmQX89xg+/TKsd64jDku0LVIFii+8IhhAaPn8qriUljvlRPNWlW00MsM3GsHZw3c3oq+nnBT9WiXFCK9XUts9OWotP9LxNX9cC/RxM9RSk+K4L31ADLe7wGSnbiI9bhID/N7DEHMxAdEn8Ld3h8Sfv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719846233; c=relaxed/simple;
	bh=aIjVMAMm23jw4Ye/EfWrLHoksB5uC6PUeTdMLTvMwK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E2OgYXsTg9devqiBjOyhy5L47/Usi65hM31J+eP0PHR8XV0SqXrCt4IootyXHMM4vSF5VYTTF9V9hH0sOGxHGRVAjJMCEt77XiQYqKYG105oYct8u0TCY3WEdqwyzz+PCMG9nFoqfcjJQ+UUOV7YGfTM+JWQGPnniMqM3T4CI4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B8lFcyjp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 254FCC2BD10;
	Mon,  1 Jul 2024 15:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719846233;
	bh=aIjVMAMm23jw4Ye/EfWrLHoksB5uC6PUeTdMLTvMwK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B8lFcyjpOFHidpU54Jv0X+DwclUuGjd/rEaO0s9wGI2b2GxQ6fav9rPiIxlUl08/1
	 UqY6IqODUh4wLaACwHXwT8siWQ+BW2ugltHbf2p1iefWp27nxOvr6D0tilTUAvNiqv
	 QaLFi65+AvpSD5HRS6fKEhFTNdlrmmtw3AK8zHJIVPv4uH6lkYlNbl5WwZc8uWaTVE
	 DY8pw829ZtBcDHO90zrajnJJVLkRc5uRcBYCn3rZRvgvGFG+kCL+RWr2eb/MFoqlun
	 Nsx8WHdKi1cphLz7DvEmYf2AlA4EcrAt28wIEoKAGqKqNtegK3cDAMo7tHSBvg9rMb
	 lacSz75gjvFiw==
Date: Mon, 1 Jul 2024 09:03:51 -0600
From: Rob Herring <robh@kernel.org>
To: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, krzk+dt@kernel.org,
	conor+dt@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	arnd@arndb.de, durai.manickamkr@microchip.com,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] dt-bindings: pinctrl: Convert Atmel PIO3 pinctrl
 to json-schema
Message-ID: <20240701150351.GA4051458-robh@kernel.org>
References: <20240625043525.279711-1-manikandan.m@microchip.com>
 <20240625043525.279711-6-manikandan.m@microchip.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240625043525.279711-6-manikandan.m@microchip.com>

On Tue, Jun 25, 2024 at 10:05:25AM +0530, Manikandan Muralidharan wrote:
> Convert Atmel PIO3 pinctrl binding document to DT schema format
> json-schema.
> 
> Signed-off-by: Manikandan Muralidharan <manikandan.m@microchip.com>
> ---
> changes in v2:
> 
> - Fix bot errors by fixing issues in 4/5 
> - remove qoutes from $ref
> ---
>  .../bindings/pinctrl/atmel,at91-pinctrl.txt   | 178 ----------------
>  .../pinctrl/atmel,at91rm9200-pinctrl.yaml     | 194 ++++++++++++++++++
>  2 files changed, 194 insertions(+), 178 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/atmel,at91rm9200-pinctrl.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
> deleted file mode 100644
> index 0aa1a53012d6..000000000000
> --- a/Documentation/devicetree/bindings/pinctrl/atmel,at91-pinctrl.txt
> +++ /dev/null
> @@ -1,178 +0,0 @@
> -* Atmel AT91 Pinmux Controller
> -
> -The AT91 Pinmux Controller, enables the IC
> -to share one PAD to several functional blocks. The sharing is done by
> -multiplexing the PAD input/output signals. For each PAD there are up to
> -8 muxing options (called periph modes). Since different modules require
> -different PAD settings (like pull up, keeper, etc) the controller controls
> -also the PAD settings parameters.
> -
> -Please refer to pinctrl-bindings.txt in this directory for details of the
> -common pinctrl bindings used by client devices, including the meaning of the
> -phrase "pin configuration node".
> -
> -Atmel AT91 pin configuration node is a node of a group of pins which can be
> -used for a specific device or function. This node represents both mux and config
> -of the pins in that group. The 'pins' selects the function mode(also named pin
> -mode) this pin can work on and the 'config' configures various pad settings
> -such as pull-up, multi drive, etc.
> -
> -Required properties for iomux controller:
> -- compatible: "atmel,at91rm9200-pinctrl" or "atmel,at91sam9x5-pinctrl"
> -		or "atmel,sama5d3-pinctrl" or "microchip,sam9x60-pinctrl"
> -		or "microchip,sam9x7-pinctrl", "microchip,sam9x60-pinctrl"
> -- atmel,mux-mask: array of mask (periph per bank) to describe if a pin can be
> -  configured in this periph mode. All the periph and bank need to be describe.
> -
> -How to create such array:
> -
> -Each column will represent the possible peripheral of the pinctrl
> -Each line will represent a pio bank
> -
> -Take an example on the 9260
> -Peripheral: 2 ( A and B)
> -Bank: 3 (A, B and C)
> -=>
> -
> -  /*    A         B     */
> -  0xffffffff 0xffc00c3b  /* pioA */
> -  0xffffffff 0x7fff3ccf  /* pioB */
> -  0xffffffff 0x007fffff  /* pioC */
> -
> -For each peripheral/bank we will describe in a u32 if a pin can be
> -configured in it by putting 1 to the pin bit (1 << pin)
> -
> -Let's take the pioA on peripheral B
> -From the datasheet Table 10-2.
> -Peripheral B
> -PA0	MCDB0
> -PA1	MCCDB
> -PA2
> -PA3	MCDB3
> -PA4	MCDB2
> -PA5	MCDB1
> -PA6
> -PA7
> -PA8
> -PA9
> -PA10	ETX2
> -PA11	ETX3
> -PA12
> -PA13
> -PA14
> -PA15
> -PA16
> -PA17
> -PA18
> -PA19
> -PA20
> -PA21
> -PA22	ETXER
> -PA23	ETX2
> -PA24	ETX3
> -PA25	ERX2
> -PA26	ERX3
> -PA27	ERXCK
> -PA28	ECRS
> -PA29	ECOL
> -PA30	RXD4
> -PA31	TXD4
> -
> -=> 0xffc00c3b
> -
> -Required properties for pin configuration node:
> -- atmel,pins: 4 integers array, represents a group of pins mux and config
> -  setting. The format is atmel,pins = <PIN_BANK PIN_BANK_NUM PERIPH CONFIG>.
> -  The PERIPH 0 means gpio, PERIPH 1 is periph A, PERIPH 2 is periph B...
> -  PIN_BANK 0 is pioA, PIN_BANK 1 is pioB...
> -
> -Bits used for CONFIG:
> -PULL_UP		(1 << 0): indicate this pin needs a pull up.
> -MULTIDRIVE	(1 << 1): indicate this pin needs to be configured as multi-drive.
> -			Multi-drive is equivalent to open-drain type output.
> -DEGLITCH	(1 << 2): indicate this pin needs deglitch.
> -PULL_DOWN	(1 << 3): indicate this pin needs a pull down.
> -DIS_SCHMIT	(1 << 4): indicate this pin needs to the disable schmitt trigger.
> -DRIVE_STRENGTH (3 << 5): indicate the drive strength of the pin using the
> -			following values:
> -				00 - No change (reset state value kept)
> -				01 - Low
> -				10 - Medium
> -				11 - High
> -OUTPUT		(1 << 7): indicate this pin need to be configured as an output.
> -OUTPUT_VAL	(1 << 8): output val (1 = high, 0 = low)
> -SLEWRATE	(1 << 9): slew rate of the pin: 0 = disable, 1 = enable
> -DEBOUNCE	(1 << 16): indicate this pin needs debounce.
> -DEBOUNCE_VAL	(0x3fff << 17): debounce value.
> -
> -NOTE:
> -Some requirements for using atmel,at91rm9200-pinctrl binding:
> -1. We have pin function node defined under at91 controller node to represent
> -   what pinmux functions this SoC supports.
> -2. The driver can use the function node's name and pin configuration node's
> -   name describe the pin function and group hierarchy.
> -   For example, Linux at91 pinctrl driver takes the function node's name
> -   as the function name and pin configuration node's name as group name to
> -   create the map table.
> -3. Each pin configuration node should have a phandle, devices can set pins
> -   configurations by referring to the phandle of that pin configuration node.
> -4. The gpio controller must be describe in the pinctrl simple-bus.
> -
> -For each bank the required properties are:
> -- compatible: "atmel,at91sam9x5-gpio" or "atmel,at91rm9200-gpio" or
> -  "microchip,sam9x60-gpio"
> -  or "microchip,sam9x7-gpio", "microchip,sam9x60-gpio", "atmel,at91rm9200-gpio"
> -- reg: physical base address and length of the controller's registers
> -- interrupts: interrupt outputs from the controller
> -- interrupt-controller: marks the device node as an interrupt controller
> -- #interrupt-cells: should be 2; refer to ../interrupt-controller/interrupts.txt
> -  for more details.
> -- gpio-controller
> -- #gpio-cells: should be 2; the first cell is the GPIO number and the second
> -  cell specifies GPIO flags as defined in <dt-bindings/gpio/gpio.h>.
> -- clocks: bank clock
> -
> -Examples:
> -
> -pinctrl@fffff400 {
> -	#address-cells = <1>;
> -	#size-cells = <1>;
> -	ranges;
> -	compatible = "atmel,at91rm9200-pinctrl", "simple-bus";
> -	reg = <0xfffff400 0x600>;
> -
> -	pioA: gpio@fffff400 {
> -		compatible = "atmel,at91sam9x5-gpio";
> -		reg = <0xfffff400 0x200>;
> -		interrupts = <2 IRQ_TYPE_LEVEL_HIGH 1>;
> -		#gpio-cells = <2>;
> -		gpio-controller;
> -		interrupt-controller;
> -		#interrupt-cells = <2>;
> -		clocks = <&pmc PMC_TYPE_PERIPHERAL 2>;
> -	};
> -
> -	atmel,mux-mask = <
> -	      /*    A         B     */
> -	       0xffffffff 0xffc00c3b  /* pioA */
> -	       0xffffffff 0x7fff3ccf  /* pioB */
> -	       0xffffffff 0x007fffff  /* pioC */
> -	      >;
> -
> -	/* shared pinctrl settings */
> -	dbgu {
> -		pinctrl_dbgu: dbgu-0 {
> -			atmel,pins =
> -				<1 14 0x1 0x0	/* PB14 periph A */
> -				 1 15 0x1 0x1>;	/* PB15 periph A with pullup */
> -		};
> -	};
> -};
> -
> -dbgu: serial@fffff200 {
> -	compatible = "atmel,at91sam9260-usart";
> -	reg = <0xfffff200 0x200>;
> -	interrupts = <1 4 7>;
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_dbgu>;
> -};
> diff --git a/Documentation/devicetree/bindings/pinctrl/atmel,at91rm9200-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/atmel,at91rm9200-pinctrl.yaml
> new file mode 100644
> index 000000000000..0ed71e22384c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/atmel,at91rm9200-pinctrl.yaml
> @@ -0,0 +1,194 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/atmel,at91rm9200-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip PIO3 Pinmux Controller
> +
> +maintainers:
> +  - Manikandan Muralidharan <manikandan.m@microchip.com>
> +
> +description:
> +  The AT91 Pinmux Controller, enables the IC to share one PAD to several
> +  functional blocks. The sharing is done by multiplexing the PAD input/output
> +  signals. For each PAD there are up to 8 muxing options (called periph modes).
> +  Since different modules require different PAD settings (like pull up, keeper,
> +  etc) the controller controls also the PAD settings parameters.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - atmel,at91rm9200-pinctrl
> +              - atmel,at91sam9x5-pinctrl
> +              - atmel,sama5d3-pinctrl
> +              - microchip,sam9x60-pinctrl
> +          - const: simple-mfd
> +      - items:
> +          - enum:
> +              - microchip,sam9x7-pinctrl
> +          - const: microchip,sam9x60-pinctrl
> +          - const: simple-mfd
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +  ranges: true
> +
> +  atmel,mux-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix

Is there no constraint on the dimensions? Always sets of 2 or 3 entries?

Maybe better to not specify because the tools have some issues if the 
dimensions are variable.

> +    description: |
> +      Array of mask (periph per bank) to describe if a pin can be
> +      configured in this periph mode. All the periph and bank need to
> +      be described.
> +
> +      #How to create such array:
> +
> +      Each column will represent the possible peripheral of the pinctrl
> +      Each line will represent a pio bank
> +
> +      #Example:
> +
> +      In at91sam9260.dtsi,
> +      Peripheral: 2 ( A and B)
> +      Bank: 3 (A, B and C)
> +
> +      #    A          B
> +      0xffffffff 0xffc00c3b  # pioA
> +      0xffffffff 0x7fff3ccf  # pioB
> +      0xffffffff 0x007fffff  # pioC
> +
> +      For each peripheral/bank we will describe in a u32 if a pin can be
> +      configured in it by putting 1 to the pin bit (1 << pin)
> +
> +      Let's take the pioA on peripheral B whose value is 0xffc00c3b
> +      From the datasheet Table 10-2.
> +      Peripheral B
> +      PA0     MCDB0
> +      PA1     MCCDB
> +      PA2
> +      PA3     MCDB3
> +      PA4     MCDB2
> +      PA5     MCDB1
> +      PA6
> +      PA7
> +      PA8
> +      PA9
> +      PA10    ETX2
> +      PA11    ETX3
> +      PA12
> +      PA13
> +      PA14
> +      PA15
> +      PA16
> +      PA17
> +      PA18
> +      PA19
> +      PA20
> +      PA21
> +      PA22    ETXER
> +      PA23    ETX2
> +      PA24    ETX3
> +      PA25    ERX2
> +      PA26    ERX3
> +      PA27    ERXCK
> +      PA28    ECRS
> +      PA29    ECOL
> +      PA30    RXD4
> +      PA31    TXD4
> +
> +patternProperties:
> +  '^[a-z0-9-_]+$':
> +    description:
> +      A pinctrl node should contain at least one subnode representing the
> +      pinctrl group available on the machine.

       type: object

> +    additionalProperties: false
> +
> +    patternProperties:
> +      '^[a-z0-9-_]+$':
> +        type: object
> +        properties:
> +          atmel,pins:
> +            $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +            description: |
> +              Each entry consists of 4 integers and represents the pins
> +              mux and config setting.The format is
> +              atmel,pins = <PIN_BANK PIN_BANK_NUM PERIPH CONFIG>.
> +              Supported pin number and mux varies for different SoCs, and
> +              are defined in <include/dt-bindings/pinctrl/at91.h>.
> +              items:
> +                items:
> +                  - description:
> +                      Pin bank
> +                  - description:
> +                      Pin bank index
> +                  - description:
> +                      Peripheral function
> +                  - description:
> +                      Pad configuration
> +
> +        required:
> +          - atmel,pins
> +
> +        additionalProperties: false
> +
> +  'gpio@[0-9a-f]*$':

'*' means 0 or more. You need '+' for 1 or more

> +    $ref: "/schemas/gpio/atmel,at91rm9200-gpio.yaml"

Don't need quotes. yamllint should have told you this.

> +    unevaluatedProperties: false
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +required:
> +  - compatible
> +  - ranges
> +  - "#address-cells"
> +  - "#size-cells"
> +  - atmel,mux-mask
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/at91.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/pinctrl/at91.h>
> +
> +    pinctrl@fffff400 {
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      compatible = "atmel,at91rm9200-pinctrl", "simple-mfd";
> +      ranges = <0xfffff400 0xfffff400 0x600>;
> +
> +      atmel,mux-mask = <
> +        /*    A         B     */
> +        0xffffffff 0xffc00c3b  /* pioA */
> +        0xffffffff 0x7fff3ccf  /* pioB */
> +        0xffffffff 0x007fffff  /* pioC */
> +        >;
> +
> +      dbgu {
> +        pinctrl_dbgu: dbgu-0 {
> +                        atmel,pins =
> +                          <AT91_PIOB 14 AT91_PERIPH_A AT91_PINCTRL_PULL_UP
> +                           AT91_PIOB 15 AT91_PERIPH_A AT91_PINCTRL_NONE>;
> +        };
> +      };
> +
> +      pioA: gpio@fffff400 {
> +              compatible = "atmel,at91rm9200-gpio";
> +              reg = <0xfffff400 0x200>;
> +              interrupts = <2 IRQ_TYPE_LEVEL_HIGH 1>;
> +              #gpio-cells = <2>;
> +              gpio-controller;
> +              interrupt-controller;
> +              #interrupt-cells = <2>;
> +              clocks = <&pmc PMC_TYPE_PERIPHERAL 2>;
> +      };
> +    };
> +...
> -- 
> 2.25.1
> 

