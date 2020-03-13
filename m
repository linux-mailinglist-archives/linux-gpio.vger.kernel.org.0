Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C87DE184ECC
	for <lists+linux-gpio@lfdr.de>; Fri, 13 Mar 2020 19:40:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbgCMSkz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Mar 2020 14:40:55 -0400
Received: from mail.baikalelectronics.com ([87.245.175.226]:33304 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726477AbgCMSkz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Mar 2020 14:40:55 -0400
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id 730B4803078D;
        Fri, 13 Mar 2020 18:40:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id yBl59DSEO7c8; Fri, 13 Mar 2020 21:40:46 +0300 (MSK)
Date:   Fri, 13 Mar 2020 21:40:05 +0300
From:   Sergey Semin <Sergey.Semin@baikalelectronics.ru>
To:     Rob Herring <robh+dt@kernel.org>
CC:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: gpio: Replace DW APB GPIO legacy
 bindings with YAML-based one
Message-ID: <20200313184005.gtlwzyak3sp6gier@ubsrv2.baikal.int>
References: <20200306132448.13917-1-Sergey.Semin@baikalelectronics.ru>
 <20200306132510.AC2108030794@mail.baikalelectronics.ru>
 <CAL_JsqKRk+adXnej_XUU3dr9Z9G09oZTY+X1i=gYpD7vrbWCZg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAL_JsqKRk+adXnej_XUU3dr9Z9G09oZTY+X1i=gYpD7vrbWCZg@mail.gmail.com>
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 12, 2020 at 08:47:56AM -0500, Rob Herring wrote:
> On Fri, Mar 6, 2020 at 7:25 AM <Sergey.Semin@baikalelectronics.ru> wrote:
> >
> 
> Subject is kind of long and wordy. Perhaps:
> 
> dt-bindings: gpio: Convert snps,dw-apb-gpio to DT schema
> 

Ok. I'll also do this for all similar patches in another patchsets.

> > From: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> >
> > Modern device tree bindings are supposed to be created as YAML-files
> > in accordance with dt-schema. This commit replaces Synopsys DW GPIO
> > legacy bare text bindings with YAML file. As before the bindings file
> > states that the corresponding dts node is supposed to be compatible
> > with generic DW I2C controller indicated by the "snps,dw-apb-gpio"
> > compatible string and provide a mandatory registers memory range.
> > It may also have an optional clocks and resets phandle references.
> >
> > There must be specified at least one subnode with
> > "snps,dw-apb-gpio-port" compatible string indicating the GPIO port,
> > which would actually export the GPIO controller functionality. Such
> > nodes should have traditional GPIO controller properties together
> > with optional interrupt-controller attributes if the corresponding
> > controller was synthesized to detected and report the input values
> > change to the parental IRQ controller.
> >
> > Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
> > Signed-off-by: Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>
> > Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> > Cc: Paul Burton <paulburton@kernel.org>
> > Cc: Ralf Baechle <ralf@linux-mips.org>
> >
> > ---
> >
> > Synopsis DesignWare APB SSI controller has a bindings property
> > "snps,nr-gpios" of numeric type, which means the number of GPIO pins
> > exported by the corresponding controller port. There is also a generic
> > pattern-property "*-gpios", which corresponds to a GPIOs array. As you
> > can see the GPIOs array property wildcard matches the vendor-specific
> > property "snps,nr-gpios" property while having an incompatible type.
> > Due to this the DW APB GPIO dts-nodes evaluation will report the
> > following error:
> >
> > snps,nr-gpios:0:0: 8 is not valid under any of the given schemas (Possible causes of the failure):
> > snps,nr-gpios:0:0: missing phandle tag in 8
> >
> > I didn't manage to fix the problem by redefining the property schema (this
> > might be impossible anyway). In my opinion the best way to solve it would be
> > to change the DW APB SSI Controller bindings so the driver would accept the
> > standard "ngpios" property for the same purpose. But in this case we would have
> > to alter all the dts files currently having the "snps,dw-apb-ssi" compatible
> > nodes (it's a lot). I know the bindings modifications aren't that much welcome
> > in the kernel community and there are good reasons why. So what do you think
> > would be the better way to fix the problem with the property types collision?
> 
> Does this change (to dt-schema) work for you?
> 
> diff --git a/schemas/gpio/gpio.yaml b/schemas/gpio/gpio.yaml
> index 1d9c109f9791..d1c08ccfdc1a 100644
> --- a/schemas/gpio/gpio.yaml
> +++ b/schemas/gpio/gpio.yaml
> @@ -34,7 +34,7 @@ properties:
>        - $ref: "/schemas/types.yaml#/definitions/phandle-array"
> 
>  patternProperties:
> -  ".*-gpios?$":
> +  "(?<!,nr)-gpios?$":
>      $ref: "/schemas/types.yaml#/definitions/phandle-array"
>    "^gpios$":
>      $ref: "/schemas/types.yaml#/definitions/phandle-array"
> 

It partly fixes the problem. There is meta-schems/gpios.yaml ,
which also has a rule for the properties with "-gpios" suffix. So yours
alteration together with the next one shall fix the problem completely:

--- a/meta-schemas/gpios.yaml	2020-03-13 20:20:10.072900019 +0300
+++ b/meta-schemas/gpios.yaml	2020-03-13 20:20:16.000953216 +0300
@@ -19,9 +19,7 @@
     $ref: "cell.yaml#array"

 patternProperties:
-  '.*-gpio$':
-    $ref: "cell.yaml#array"
-  '.*-gpios$':
+  '(?<!,nr)-gpios?$':
     $ref: "cell.yaml#array"

 dependencies:

Regarding the generic schemas/gpio/gpio.yaml . Do you think I should be
also allOf-ing it in my DT schema?

> 
> > ---
> >  .../bindings/gpio/snps,dw-apb-gpio.yaml       | 136 ++++++++++++++++++
> >  .../bindings/gpio/snps-dwapb-gpio.txt         |  65 ---------
> >  2 files changed, 136 insertions(+), 65 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/gpio/snps-dwapb-gpio.txt
> >
> > diff --git a/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml b/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
> > new file mode 100644
> > index 000000000000..d9bc12e9e515
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/gpio/snps,dw-apb-gpio.yaml
> > @@ -0,0 +1,136 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> 
> Do you have rights to add BSD?

I asked my superviser regarding this. They don't object against using
two licenses for dt-schema files. So I'll update all the schemas I
submit to have dual license header.

If you referring to the original plain text dt bindings file. I don't
really know under what license it was submitted.

> 
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/gpio/snps,dw-apb-gpio.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Synopsys DesignWare APB GPIO controller
> > +
> > +description: |
> > +  Synopsys DesignWare GPIO controllers have a configurable number of ports,
> > +  each of which are intended to be represented as child nodes with the generic
> > +  GPIO-controller properties as desribed in this bindings file.
> > +
> > +maintainers:
> > +  - Hoan Tran <hoan@os.amperecomputing.com>
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^gpio@[0-9a-fA-F]+$"
> 
> Lowercase hex for unit-addresses.
> 

Ok. I'll also make sure the lowercased unit-addresses are used in the
rest of the patchsets.

> > +
> > +  compatible:
> > +    const: snps,dw-apb-gpio
> > +
> > +  "#address-cells":
> > +    const: 1
> > +
> > +  "#size-cells":
> > +    const: 0
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: APB interface clock source
> > +
> > +  clock-names:
> > +    items:
> > +      - const: bus
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +patternProperties:
> > +  "^.*@[0-9a-fA-F]+$":
> 
> Shouldn't it be "^gpio@..." And unit-addresses should be lowercase.

Sub-nodes define the GPIO controller ports, so "^gpio-port@" would be
better. But some available dts-files declares these sub-nodes as
"^gpio-controller@". So in order to have them also compatible we have no
other choice but either to define the property name as
"^gpio-(port|controller)@..." or leave it as suggested in my patch. What
do you think? Anyway to be honest I don't really understand why at all do
we need to have the limitations applied on $nodename . It's just a name
of the node and doesn't participate in any device-driver bindings
or in anything else meaningful.

> 
> > +    type: object
> > +    properties:
> > +      compatible:
> > +        const: snps,dw-apb-gpio-port
> > +
> > +      reg:
> > +        maxItems: 1
> > +
> > +      gpio-controller: true
> > +
> > +      '#gpio-cells':
> > +        const: 2
> > +
> > +      snps,nr-gpios:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: The number of GPIO pins exported by the port.
> > +        default: 32
> > +        minimum: 1
> > +        maximum: 32
> > +
> > +      interrupts:
> > +        description: |
> > +          The interrupts to the parent controller raised when GPIOs generate
> > +          the interrupts. If the controller provides one combined interrupt
> > +          for all GPIOs, specify a single interrupt. If the controller provides
> > +          one interrupt for each GPIO, provide a list of interrupts that
> > +          correspond to each of the GPIO pins.
> > +        minItems: 1
> > +        maxItems: 32
> > +
> > +      interrupts-extended:
> 
> Drop this. It gets added by the tools automatically.
> 

Ok. I'll remove the whole property from the dt schema. But don't you think
since there is "additionalProperties: false" I should have at least left the
"interrupts-extended: true" declaration?

> > +        description: |
> > +          When specifying multiple interrupts, if any are unconnected, use
> > +          this property to specify the interrupts and set the interrupt
> > +          controller handle for unused interrupts to 0.
> > +        minItems: 1
> > +        maxItems: 32
> > +
> > +      interrupt-controller: true
> > +
> > +      '#interrupt-cells':
> > +        const: 2
> > +
> > +    required:
> > +      - compatible
> > +      - reg
> > +      - gpio-controller
> > +      - '#gpio-cells'
> > +
> > +    dependencies:
> > +      interrupt-controller: [ interrupts ]
> > +
> > +    additionalProperties: false
> > +
> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +
> > +examples:
> > +  - |
> > +    gpio: gpio@20000 {
> > +      compatible = "snps,dw-apb-gpio";
> > +      reg = <0x20000 0x1000>;
> > +      #address-cells = <1>;
> > +      #size-cells = <0>;
> > +
> > +      porta: gpio@0 {
> > +        compatible = "snps,dw-apb-gpio-port";
> > +        reg = <0>;
> > +        gpio-controller;
> > +        #gpio-cells = <2>;
> > +        snps,nr-gpios = <8>;
> > +        interrupt-controller;
> > +        #interrupt-cells = <2>;
> > +        interrupt-parent = <&vic1>;
> > +        interrupts = <0>;
> > +      };
> > +
> > +      portb: gpio@1 {
> > +        compatible = "snps,dw-apb-gpio-port";
> > +        reg = <1>;
> > +        gpio-controller;
> > +        #gpio-cells = <2>;
> > +        snps,nr-gpios = <8>;
> > +      };
> > +    };
> > +...
