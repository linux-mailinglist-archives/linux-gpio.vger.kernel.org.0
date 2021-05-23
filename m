Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4792D38D81C
	for <lists+linux-gpio@lfdr.de>; Sun, 23 May 2021 03:52:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231533AbhEWByN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 22 May 2021 21:54:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231495AbhEWByM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 22 May 2021 21:54:12 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44EB8C061574;
        Sat, 22 May 2021 18:52:47 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0EB362A8;
        Sun, 23 May 2021 03:52:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1621734763;
        bh=MeOIR/VQKQIpx1pLUK5IeuUXY2aDFHrvihkPRaJYFvU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QpZmQZ7mQ6+lSdPPFTMsYGjrK0Q3PL9mFkRieKu2iZ8Na0gvGdSPg686dCGltRxfB
         ZkPLbuFRS9xFrkY0UI9Jvzj2KHk7ncdOAkojJDUQi5Gl09Etq6c4CgqSRf+RewuHOR
         jNU6jxG8ESi9mqawleYj5wBkg/fpdPi5YpWb1r34=
Date:   Sun, 23 May 2021 04:52:39 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Jan Tuerk <jan.tuerk@emtrion.com>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] dt-bindings: gpio: pcf857x: Convert to json-schema
Message-ID: <YKm1Z4/xULSzuoVV@pendragon.ideasonboard.com>
References: <cover.1621583562.git.geert+renesas@glider.be>
 <52df0592c81ac000d3f486a9ba5a4d84b0f42c47.1621583562.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <52df0592c81ac000d3f486a9ba5a4d84b0f42c47.1621583562.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

On Fri, May 21, 2021 at 09:54:08AM +0200, Geert Uytterhoeven wrote:
> Convert the PCF857x-compatible I/O expanders Device Tree binding
> documentation to json-schema.
> 
> Document missing compatible values, properties, and gpio hogs.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Perhaps the "ti,pcf8575" construct should be removed, and the few users
> fixed instead?

Given that the driver doesn't match against it, that could be done, if
you're confident enough that there's no difference between the TI and
NXP versions that would need to be taken into account.

> I have listed Laurent as the maintainer, as he wrote the original
> bindings.  Laurent: Please scream if this is inappropriate ;-)

I'm sure I'll regret it later, but I don't mind :-)

> ---
>  .../devicetree/bindings/gpio/gpio-pcf857x.txt |  69 ----------
>  .../devicetree/bindings/gpio/nxp,pcf8575.yaml | 120 ++++++++++++++++++
>  2 files changed, 120 insertions(+), 69 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt
>  create mode 100644 Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt b/Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt
> deleted file mode 100644
> index a482455a205b0855..0000000000000000
> --- a/Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt
> +++ /dev/null
> @@ -1,69 +0,0 @@
> -* PCF857x-compatible I/O expanders
> -
> -The PCF857x-compatible chips have "quasi-bidirectional" I/O lines that can be
> -driven high by a pull-up current source or driven low to ground. This combines
> -the direction and output level into a single bit per line, which can't be read
> -back. We can't actually know at initialization time whether a line is configured
> -(a) as output and driving the signal low/high, or (b) as input and reporting a
> -low/high value, without knowing the last value written since the chip came out
> -of reset (if any). The only reliable solution for setting up line direction is
> -thus to do it explicitly.
> -
> -Required Properties:
> -
> -  - compatible: should be one of the following.
> -    - "maxim,max7328": For the Maxim MAX7378
> -    - "maxim,max7329": For the Maxim MAX7329
> -    - "nxp,pca8574": For the NXP PCA8574
> -    - "nxp,pca8575": For the NXP PCA8575
> -    - "nxp,pca9670": For the NXP PCA9670
> -    - "nxp,pca9671": For the NXP PCA9671
> -    - "nxp,pca9672": For the NXP PCA9672
> -    - "nxp,pca9673": For the NXP PCA9673
> -    - "nxp,pca9674": For the NXP PCA9674
> -    - "nxp,pca9675": For the NXP PCA9675
> -    - "nxp,pcf8574": For the NXP PCF8574
> -    - "nxp,pcf8574a": For the NXP PCF8574A
> -    - "nxp,pcf8575": For the NXP PCF8575
> -
> -  - reg: I2C slave address.
> -
> -  - gpio-controller: Marks the device node as a gpio controller.
> -  - #gpio-cells: Should be 2. The first cell is the GPIO number and the second
> -    cell specifies GPIO flags, as defined in <dt-bindings/gpio/gpio.h>. Only the
> -    GPIO_ACTIVE_HIGH and GPIO_ACTIVE_LOW flags are supported.
> -
> -Optional Properties:
> -
> -  - lines-initial-states: Bitmask that specifies the initial state of each
> -  line. When a bit is set to zero, the corresponding line will be initialized to
> -  the input (pulled-up) state. When the  bit is set to one, the line will be
> -  initialized the low-level output state. If the property is not specified
> -  all lines will be initialized to the input state.
> -
> -  The I/O expander can detect input state changes, and thus optionally act as
> -  an interrupt controller. When the expander interrupt line is connected all the
> -  following properties must be set. For more information please see the
> -  interrupt controller device tree bindings documentation available at
> -  Documentation/devicetree/bindings/interrupt-controller/interrupts.txt.
> -
> -  - interrupt-controller: Identifies the node as an interrupt controller.
> -  - #interrupt-cells: Number of cells to encode an interrupt source, shall be 2.
> -  - interrupts: Interrupt specifier for the controllers interrupt.
> -
> -
> -Please refer to gpio.txt in this directory for details of the common GPIO
> -bindings used by client devices.
> -
> -Example: PCF8575 I/O expander node
> -
> -	pcf8575: gpio@20 {
> -		compatible = "nxp,pcf8575";
> -		reg = <0x20>;
> -		interrupt-parent = <&irqpin2>;
> -		interrupts = <3 0>;
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -		interrupt-controller;
> -		#interrupt-cells = <2>;
> -	};
> diff --git a/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml b/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
> new file mode 100644
> index 0000000000000000..45034be0f8abc961
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/nxp,pcf8575.yaml
> @@ -0,0 +1,120 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/nxp,pcf8575.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: PCF857x-compatible I/O expanders
> +
> +maintainers:
> +  - Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> +
> +description:
> +  The PCF857x-compatible chips have "quasi-bidirectional" I/O lines that can be
> +  driven high by a pull-up current source or driven low to ground. This
> +  combines the direction and output level into a single bit per line, which
> +  can't be read back. We can't actually know at initialization time whether a
> +  line is configured (a) as output and driving the signal low/high, or (b) as
> +  input and reporting a low/high value, without knowing the last value written
> +  since the chip came out of reset (if any). The only reliable solution for
> +  setting up line direction is thus to do it explicitly.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - ti,pcf8575
> +          - const: nxp,pcf8575
> +
> +      - enum:
> +          - maxim,max7328
> +          - maxim,max7329
> +          - nxp,pca8574
> +          - nxp,pca8575
> +          - nxp,pca9670
> +          - nxp,pca9671
> +          - nxp,pca9672
> +          - nxp,pca9673
> +          - nxp,pca9674
> +          - nxp,pca9675
> +          - nxp,pcf8574
> +          - nxp,pcf8574a
> +          - nxp,pcf8575
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +    description:
> +      The first cell is the GPIO number and the second cell specifies GPIO
> +      flags, as defined in <dt-bindings/gpio/gpio.h>. Only the GPIO_ACTIVE_HIGH
> +      and GPIO_ACTIVE_LOW flags are supported.
> +
> +  lines-initial-states:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Bitmask that specifies the initial state of each line.
> +      When a bit is set to zero, the corresponding line will be initialized to
> +      the input (pulled-up) state.
> +      When the  bit is set to one, the line will be initialized to the
> +      low-level output state.
> +      If the property is not specified all lines will be initialized to the
> +      input state.

The line wrapping is weird.

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  wakeup-source: true
> +
> +patternProperties:
> +  "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
> +    type: object
> +
> +    properties:
> +      gpio-hog: true
> +      gpios: true
> +      input: true
> +      output-high: true
> +      output-low: true
> +      line-name: true
> +
> +    required:
> +      - gpio-hog
> +      - gpios
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - '#gpio-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            pcf8575: gpio@20 {
> +                    compatible = "nxp,pcf8575";
> +                    reg = <0x20>;
> +                    interrupt-parent = <&irqpin2>;
> +                    interrupts = <3 0>;
> +                    gpio-controller;
> +                    #gpio-cells = <2>;
> +                    interrupt-controller;
> +                    #interrupt-cells = <2>;
> +            };
> +    };

-- 
Regards,

Laurent Pinchart
