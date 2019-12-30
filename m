Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A45F512D4F2
	for <lists+linux-gpio@lfdr.de>; Tue, 31 Dec 2019 00:19:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727763AbfL3XT3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Dec 2019 18:19:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:42640 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727695AbfL3XT3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 30 Dec 2019 18:19:29 -0500
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6F0E62071E;
        Mon, 30 Dec 2019 23:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1577747967;
        bh=+QIOFrt9etoLBiOj6uuWXf/i4xC8UpWLseW/gJpmao4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=e+xkVEwnb0yqrdPNBQpMn8GAtGWeeM/CPRZzbD39bO+Y+aleCj2J7nB4kUuTRmDqd
         nvaBkTI0u6Q1rp4OD3Whyw1U4urFEcfDtEvJZDXV9OnoXGOpwFVcZTIMvW6kp8mFEC
         FMJRU8M58f/kN99/wzGWFBoQgS24MVI1WIwLVnqM=
Received: by mail-qv1-f49.google.com with SMTP id n8so12866559qvg.11;
        Mon, 30 Dec 2019 15:19:27 -0800 (PST)
X-Gm-Message-State: APjAAAXKHVaYzhLDfz7cg2vGg47r4ne+nPoYLXdk7PcTeOG3Pyh3gelo
        eqdQkWnnPgpGTTvpz+xYVm+iQJjmEuLmlTEksQ==
X-Google-Smtp-Source: APXvYqy7OhVWXHqp2fHiMMW2e9aYT9/U34/mjCdUrsJ28v5WD9uGTrdYmVUMPl+rJ2Tu5zJ8bkeOsXCdcZOkTIVaUsc=
X-Received: by 2002:ad4:4511:: with SMTP id k17mr50807105qvu.135.1577747966279;
 Mon, 30 Dec 2019 15:19:26 -0800 (PST)
MIME-Version: 1.0
References: <20191107224254.15712-1-robh@kernel.org>
In-Reply-To: <20191107224254.15712-1-robh@kernel.org>
From:   Rob Herring <robh@kernel.org>
Date:   Mon, 30 Dec 2019 16:19:13 -0700
X-Gmail-Original-Message-ID: <CAL_JsqLn0cUzzVnYostVwdPun1Tu4Y6bx7Xgwjc4_xfVke6gYA@mail.gmail.com>
Message-ID: <CAL_JsqLn0cUzzVnYostVwdPun1Tu4Y6bx7Xgwjc4_xfVke6gYA@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: Convert generic pin mux and config
 properties to schema
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Nov 7, 2019 at 3:42 PM Rob Herring <robh@kernel.org> wrote:
>
> As pinctrl bindings have a flexible structure and no standard child node
> naming convention, creating a single pinctrl schema doesn't work. Instead,
> create schemas for the pin mux and config nodes which device pinctrl schema
> can reference.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>
> We're starting to see pinctrl schema doing their own definitions for
> generic properties, so we need to get something in place to reference.
>
> Maybe this could be combined into a single schema? Spliting it was
> easier in order to just copy over the existing documentation.
>
> Reading thru pinctrl-bindings.txt, I'm wondering if some of it is out
> of date. Do we let new bindings not use the generic muxing properties?
> Do we really need to be so flexible for child node structure?

Ping!

>
> Rob
>
>  .../bindings/pinctrl/pincfg-node.yaml         | 140 +++++++++++++
>  .../bindings/pinctrl/pinctrl-bindings.txt     | 192 +-----------------
>  .../bindings/pinctrl/pinmux-node.yaml         | 132 ++++++++++++
>  3 files changed, 274 insertions(+), 190 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> new file mode 100644
> index 000000000000..13b7ab9dd6d5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/pincfg-node.yaml
> @@ -0,0 +1,140 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/pincfg-node.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic pin configuration node schema
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +description:
> +  Many data items that are represented in a pin configuration node are common
> +  and generic. Pin control bindings should use the properties defined below
> +  where they are applicable; not all of these properties are relevant or useful
> +  for all hardware or binding structures. Each individual binding document
> +  should state which of these generic properties, if any, are used, and the
> +  structure of the DT nodes that contain these properties.
> +
> +properties:
> +  bias-disable:
> +    type: boolean
> +    description: disable any pin bias
> +
> +  bias-high-impedance:
> +    type: boolean
> +    description: high impedance mode ("third-state", "floating")
> +
> +  bias-bus-hold:
> +    type: boolean
> +    description: latch weakly
> +
> +  bias-pull-up:
> +    oneOf:
> +      - type: boolean
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    description: pull up the pin. Takes as optional argument on hardware
> +      supporting it the pull strength in Ohm.
> +
> +  bias-pull-down:
> +    oneOf:
> +      - type: boolean
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    description: pull down the pin. Takes as optional argument on hardware
> +      supporting it the pull strength in Ohm.
> +
> +  bias-pull-pin-default:
> +    oneOf:
> +      - type: boolean
> +      - $ref: /schemas/types.yaml#/definitions/uint32
> +    description: use pin-default pull state. Takes as optional argument on
> +      hardware supporting it the pull strength in Ohm.
> +
> +  drive-push-pull:
> +    type: boolean
> +    description: drive actively high and low
> +
> +  drive-open-drain:
> +    type: boolean
> +    description: drive with open drain
> +
> +  drive-open-source:
> +    type: boolean
> +    description: drive with open source
> +
> +  drive-strength:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: sink or source at most X mA
> +
> +  drive-strength-microamp:
> +    description: sink or source at most X uA
> +
> +  input-enable:
> +    type: boolean
> +    description: enable input on pin (no effect on output, such as
> +      enabling an input buffer)
> +
> +  input-disable:
> +    type: boolean
> +    description: disable input on pin (no effect on output, such as
> +      disabling an input buffer)
> +
> +  input-schmitt-enable:
> +    type: boolean
> +    description: enable schmitt-trigger mode
> +
> +  input-schmitt-disable:
> +    type: boolean
> +    description: disable schmitt-trigger mode
> +
> +  input-debounce:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Takes the debounce time in usec as argument or 0 to disable
> +      debouncing
> +
> +  power-source:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: select between different power supplies
> +
> +  low-power-enable:
> +    type: boolean
> +    description: enable low power mode
> +
> +  low-power-disable:
> +    type: boolean
> +    description: disable low power mode
> +
> +  output-disable:
> +    type: boolean
> +    description: disable output on a pin (such as disable an output buffer)
> +
> +  output-enable:
> +    type: boolean
> +    description: enable output on a pin without actively driving it
> +      (such as enabling an output buffer)
> +
> +  output-low:
> +    type: boolean
> +    description: set the pin to output mode with low level
> +
> +  output-high:
> +    type: boolean
> +    description: set the pin to output mode with high level
> +
> +  sleep-hardware-state:
> +    type: boolean
> +    description: indicate this is sleep related state which will be
> +      programmed into the registers for the sleep state.
> +
> +  slew-rate:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: set the slew rate
> +
> +  skew-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      this affects the expected clock skew on input pins
> +      and the delay before latching a value to an output
> +      pin. Typically indicates how many double-inverters are
> +      used to delay the signal.
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> index fcd37e93ed4d..4613bb17ace3 100644
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-bindings.txt
> @@ -141,196 +141,8 @@ controller device.
>
>  == Generic pin multiplexing node content ==
>
> -pin multiplexing nodes:
> -
> -function               - the mux function to select
> -groups                 - the list of groups to select with this function
> -                         (either this or "pins" must be specified)
> -pins                   - the list of pins to select with this function (either
> -                         this or "groups" must be specified)
> -
> -Example:
> -
> -state_0_node_a {
> -       uart0 {
> -               function = "uart0";
> -               groups = "u0rxtx", "u0rtscts";
> -       };
> -};
> -state_1_node_a {
> -       spi0 {
> -               function = "spi0";
> -               groups = "spi0pins";
> -       };
> -};
> -state_2_node_a {
> -       function = "i2c0";
> -       pins = "mfio29", "mfio30";
> -};
> -
> -Optionally an alternative binding can be used if more suitable depending on the
> -pin controller hardware. For hardware where there is a large number of identical
> -pin controller instances, naming each pin and function can easily become
> -unmaintainable. This is especially the case if the same controller is used for
> -different pins and functions depending on the SoC revision and packaging.
> -
> -For cases like this, the pin controller driver may use pinctrl-pin-array helper
> -binding with a hardware based index and a number of pin configuration values:
> -
> -pincontroller {
> -       ... /* Standard DT properties for the device itself elided */
> -       #pinctrl-cells = <2>;
> -
> -       state_0_node_a {
> -               pinctrl-pin-array = <
> -                       0 A_DELAY_PS(0) G_DELAY_PS(120)
> -                       4 A_DELAY_PS(0) G_DELAY_PS(360)
> -                       ...
> -               >;
> -       };
> -       ...
> -};
> -
> -Above #pinctrl-cells specifies the number of value cells in addition to the
> -index of the registers. This is similar to the interrupts-extended binding with
> -one exception. There is no need to specify the phandle for each entry as that
> -is already known as the defined pins are always children of the pin controller
> -node. Further having the phandle pointing to another pin controller would not
> -currently work as the pinctrl framework uses named modes to group pins for each
> -pin control device.
> -
> -The index for pinctrl-pin-array must relate to the hardware for the pinctrl
> -registers, and must not be a virtual index of pin instances. The reason for
> -this is to avoid mapping of the index in the dts files and the pin controller
> -driver as it can change.
> -
> -For hardware where pin multiplexing configurations have to be specified for
> -each single pin the number of required sub-nodes containing "pin" and
> -"function" properties can quickly escalate and become hard to write and
> -maintain.
> -
> -For cases like this, the pin controller driver may use the pinmux helper
> -property, where the pin identifier is provided with mux configuration settings
> -in a pinmux group. A pinmux group consists of the pin identifier and mux
> -settings represented as a single integer or an array of integers.
> -
> -The pinmux property accepts an array of pinmux groups, each of them describing
> -a single pin multiplexing configuration.
> -
> -pincontroller {
> -       state_0_node_a {
> -               pinmux = <PINMUX_GROUP>, <PINMUX_GROUP>, ...;
> -       };
> -};
> -
> -Each individual pin controller driver bindings documentation shall specify
> -how pin IDs and pin multiplexing configuration are defined and assembled
> -together in a pinmux group.
> +See pinmux-node.yaml
>
>  == Generic pin configuration node content ==
>
> -Many data items that are represented in a pin configuration node are common
> -and generic. Pin control bindings should use the properties defined below
> -where they are applicable; not all of these properties are relevant or useful
> -for all hardware or binding structures. Each individual binding document
> -should state which of these generic properties, if any, are used, and the
> -structure of the DT nodes that contain these properties.
> -
> -Supported generic properties are:
> -
> -pins                   - the list of pins that properties in the node
> -                         apply to (either this, "group" or "pinmux" has to be
> -                         specified)
> -group                  - the group to apply the properties to, if the driver
> -                         supports configuration of whole groups rather than
> -                         individual pins (either this, "pins" or "pinmux" has
> -                         to be specified)
> -pinmux                 - the list of numeric pin ids and their mux settings
> -                         that properties in the node apply to (either this,
> -                         "pins" or "groups" have to be specified)
> -bias-disable           - disable any pin bias
> -bias-high-impedance    - high impedance mode ("third-state", "floating")
> -bias-bus-hold          - latch weakly
> -bias-pull-up           - pull up the pin
> -bias-pull-down         - pull down the pin
> -bias-pull-pin-default  - use pin-default pull state
> -drive-push-pull                - drive actively high and low
> -drive-open-drain       - drive with open drain
> -drive-open-source      - drive with open source
> -drive-strength         - sink or source at most X mA
> -drive-strength-microamp        - sink or source at most X uA
> -input-enable           - enable input on pin (no effect on output, such as
> -                         enabling an input buffer)
> -input-disable          - disable input on pin (no effect on output, such as
> -                         disabling an input buffer)
> -input-schmitt-enable   - enable schmitt-trigger mode
> -input-schmitt-disable  - disable schmitt-trigger mode
> -input-debounce         - debounce mode with debound time X
> -power-source           - select between different power supplies
> -low-power-enable       - enable low power mode
> -low-power-disable      - disable low power mode
> -output-disable         - disable output on a pin (such as disable an output
> -                         buffer)
> -output-enable          - enable output on a pin without actively driving it
> -                         (such as enabling an output buffer)
> -output-low             - set the pin to output mode with low level
> -output-high            - set the pin to output mode with high level
> -sleep-hardware-state   - indicate this is sleep related state which will be programmed
> -                         into the registers for the sleep state.
> -slew-rate              - set the slew rate
> -skew-delay             - this affects the expected clock skew on input pins
> -                         and the delay before latching a value to an output
> -                         pin. Typically indicates how many double-inverters are
> -                         used to delay the signal.
> -
> -For example:
> -
> -state_0_node_a {
> -       cts_rxd {
> -               pins = "GPIO0_AJ5", "GPIO2_AH4"; /* CTS+RXD */
> -               bias-pull-up;
> -       };
> -};
> -state_1_node_a {
> -       rts_txd {
> -               pins = "GPIO1_AJ3", "GPIO3_AH3"; /* RTS+TXD */
> -               output-high;
> -       };
> -};
> -state_2_node_a {
> -       foo {
> -               group = "foo-group";
> -               bias-pull-up;
> -       };
> -};
> -state_3_node_a {
> -       mux {
> -               pinmux = <GPIOx_PINm_MUXn>, <GPIOx_PINj_MUXk)>;
> -               input-enable;
> -       };
> -};
> -
> -Some of the generic properties take arguments. For those that do, the
> -arguments are described below.
> -
> -- pins takes a list of pin names or IDs as a required argument. The specific
> -  binding for the hardware defines:
> -  - Whether the entries are integers or strings, and their meaning.
> -
> -- pinmux takes a list of pin IDs and mux settings as required argument. The
> -  specific bindings for the hardware defines:
> -  - How pin IDs and mux settings are defined and assembled together in a single
> -    integer or an array of integers.
> -
> -- bias-pull-up, -down and -pin-default take as optional argument on hardware
> -  supporting it the pull strength in Ohm. bias-disable will disable the pull.
> -
> -- drive-strength takes as argument the target strength in mA.
> -
> -- drive-strength-microamp takes as argument the target strength in uA.
> -
> -- input-debounce takes the debounce time in usec as argument
> -  or 0 to disable debouncing
> -
> -More in-depth documentation on these parameters can be found in
> -<include/linux/pinctrl/pinconf-generic.h>
> +See pincfg-node.yaml
> diff --git a/Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml b/Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml
> new file mode 100644
> index 000000000000..777623a57fd5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml
> @@ -0,0 +1,132 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/pinmux-node.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Generic pin multiplexing node schema
> +
> +maintainers:
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +description: |
> +  The contents of the pin configuration child nodes are defined by the binding
> +  for the individual pin controller device. The pin configuration nodes need not
> +  be direct children of the pin controller device; they may be grandchildren,
> +  for example. Whether this is legal, and whether there is any interaction
> +  between the child and intermediate parent nodes, is again defined entirely by
> +  the binding for the individual pin controller device.
> +
> +  While not required to be used, there are 3 generic forms of pin muxing nodes
> +  which pin controller devices can use.
> +
> +  pin multiplexing nodes:
> +
> +  Example:
> +
> +  state_0_node_a {
> +    uart0 {
> +      function = "uart0";
> +      groups = "u0rxtx", "u0rtscts";
> +    };
> +  };
> +  state_1_node_a {
> +    spi0 {
> +      function = "spi0";
> +      groups = "spi0pins";
> +    };
> +  };
> +  state_2_node_a {
> +    function = "i2c0";
> +    pins = "mfio29", "mfio30";
> +  };
> +
> +  Optionally an alternative binding can be used if more suitable depending on the
> +  pin controller hardware. For hardware where there is a large number of identical
> +  pin controller instances, naming each pin and function can easily become
> +  unmaintainable. This is especially the case if the same controller is used for
> +  different pins and functions depending on the SoC revision and packaging.
> +
> +  For cases like this, the pin controller driver may use pinctrl-pin-array helper
> +  binding with a hardware based index and a number of pin configuration values:
> +
> +  pincontroller {
> +    ... /* Standard DT properties for the device itself elided */
> +    #pinctrl-cells = <2>;
> +
> +    state_0_node_a {
> +      pinctrl-pin-array = <
> +        0 A_DELAY_PS(0) G_DELAY_PS(120)
> +        4 A_DELAY_PS(0) G_DELAY_PS(360)
> +        ...
> +        >;
> +    };
> +    ...
> +  };
> +
> +  Above #pinctrl-cells specifies the number of value cells in addition to the
> +  index of the registers. This is similar to the interrupts-extended binding with
> +  one exception. There is no need to specify the phandle for each entry as that
> +  is already known as the defined pins are always children of the pin controller
> +  node. Further having the phandle pointing to another pin controller would not
> +  currently work as the pinctrl framework uses named modes to group pins for each
> +  pin control device.
> +
> +  The index for pinctrl-pin-array must relate to the hardware for the pinctrl
> +  registers, and must not be a virtual index of pin instances. The reason for
> +  this is to avoid mapping of the index in the dts files and the pin controller
> +  driver as it can change.
> +
> +  For hardware where pin multiplexing configurations have to be specified for
> +  each single pin the number of required sub-nodes containing "pin" and
> +  "function" properties can quickly escalate and become hard to write and
> +  maintain.
> +
> +  For cases like this, the pin controller driver may use the pinmux helper
> +  property, where the pin identifier is provided with mux configuration settings
> +  in a pinmux group. A pinmux group consists of the pin identifier and mux
> +  settings represented as a single integer or an array of integers.
> +
> +  The pinmux property accepts an array of pinmux groups, each of them describing
> +  a single pin multiplexing configuration.
> +
> +  pincontroller {
> +    state_0_node_a {
> +      pinmux = <PINMUX_GROUP>, <PINMUX_GROUP>, ...;
> +    };
> +  };
> +
> +  Each individual pin controller driver bindings documentation shall specify
> +  how pin IDs and pin multiplexing configuration are defined and assembled
> +  together in a pinmux group.
> +
> +properties:
> +  function:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: The mux function to select
> +
> +  pins:
> +    oneOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32-array
> +      - $ref: /schemas/types.yaml#/definitions/string-array
> +    description:
> +      The list of pin identifiers that properties in the node apply to. The
> +      specific binding for the hardware defines whether the entries are integers
> +      or strings, and their meaning.
> +
> +  group:
> +    $ref: /schemas/types.yaml#/definitions/string-array
> +    description:
> +      the group to apply the properties to, if the driver supports
> +      configuration of whole groups rather than individual pins (either
> +      this, "pins" or "pinmux" has to be specified)
> +
> +  pinmux:
> +    allOf:
> +      - $ref: /schemas/types.yaml#/definitions/uint32-array
> +    description:
> +      The list of numeric pin ids and their mux settings that properties in the
> +      node apply to (either this, "pins" or "groups" have to be specified)
> +
> +  pinctrl-pin-array:
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> --
> 2.20.1
>
