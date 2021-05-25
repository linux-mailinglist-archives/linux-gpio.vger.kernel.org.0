Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9390E390BBC
	for <lists+linux-gpio@lfdr.de>; Tue, 25 May 2021 23:44:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231634AbhEYVpm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 May 2021 17:45:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:49822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230409AbhEYVpm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 25 May 2021 17:45:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id C8ADB613C1;
        Tue, 25 May 2021 21:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621979051;
        bh=k83Fr7hUqQnLRhpxMm/V43Z9CIFvIcHf1FUgsIpmHxA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rSRGBFEJybtg6h2q/D1uZOGmrpjcSiMelnd6xUo9/R7549G3UNIP+44vxGDrgPqSf
         nritF4WHp8u0VLg1oPLsXmTg99fV6pBJja/v43mY/kcBP0h0Aahojw6pdNmOLknM/J
         rcq7O44Y87+TMhpNLAPG3yte8IbcC1S+GapMKCYW27yV0qWC/JGyRxl9Dg4S2h0ZBm
         dV7fjq7WYCrrOgpSWZ0n9+HKLn3cCF06rTdo8XsZmn21EAjUm3BoXXtbY0LeSpOZW9
         otVFk5caLw+jSp/XEfB3bPbdGaQiiHVeN+v4EO7DupfXCBZQlxFhzWx6kHF1tdCLvo
         r/QWPZDbxvA7w==
Received: by mail-ej1-f48.google.com with SMTP id et19so42566058ejc.4;
        Tue, 25 May 2021 14:44:11 -0700 (PDT)
X-Gm-Message-State: AOAM533ttUjhdZfYYfmvr2Hrn/1PSDffDUBdVcY8sBJa9MQ7hgybDida
        YtxWBnnhetj1/enzs+vJ7kq5aEQSZ2zLgCpX2w==
X-Google-Smtp-Source: ABdhPJzHOnFuxuWWzCIg8ti1N2wYFlcSKU1u4W0UhR+XqzqKbF2Hi1/Er3aAwLHwccql5s9g8uJEUmzL9KltP3MBmss=
X-Received: by 2002:a17:906:1d0a:: with SMTP id n10mr30362198ejh.341.1621979050363;
 Tue, 25 May 2021 14:44:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210524120539.3267145-1-robert.marko@sartura.hr>
 <20210524120539.3267145-3-robert.marko@sartura.hr> <20210524230940.GA1350504@robh.at.kernel.org>
 <CA+HBbNHb71n7GPCPWMivOV5U0RGQnwT054y6U0grQ8Hr=d9geQ@mail.gmail.com>
In-Reply-To: <CA+HBbNHb71n7GPCPWMivOV5U0RGQnwT054y6U0grQ8Hr=d9geQ@mail.gmail.com>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 25 May 2021 16:43:58 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJCrndJpW91i7fbEfzCVPr+k4f-b2gqLRndvUMwSCyCMA@mail.gmail.com>
Message-ID: <CAL_JsqJCrndJpW91i7fbEfzCVPr+k4f-b2gqLRndvUMwSCyCMA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: mfd: Add Delta TN48M CPLD drivers bindings
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Luka Perkov <luka.perkov@sartura.hr>, jmp@epiphyte.org,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 25, 2021 at 4:47 AM Robert Marko <robert.marko@sartura.hr> wrote:
>
> On Tue, May 25, 2021 at 1:09 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Mon, May 24, 2021 at 02:05:38PM +0200, Robert Marko wrote:
> > > Add binding documents for the Delta TN48M CPLD drivers.
> > >
> > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > ---
> > > Changes in v2:
> > > * Implement MFD as a simple I2C MFD
> > > * Add GPIO bindings as separate
> >
> > I don't understand why this changed. This doesn't look like an MFD to
> > me. Make your binding complete if there are missing functions.
> > Otherwise, stick with what I already ok'ed.
>
> It changed because the custom driver was dropped at Lee Jones-es request,
> and simple-mfd-i2c is now used.

To a certain extent, I don't care about the driver. A binding can't
know what an OS wants in terms of structure and driver structure could
evolve.

> > >  .../bindings/gpio/delta,tn48m-gpio.yaml       | 42 ++++++++++
> > >  .../bindings/mfd/delta,tn48m-cpld.yaml        | 81 +++++++++++++++++++
> > >  2 files changed, 123 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
> > >  create mode 100644 Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml b/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
> > > new file mode 100644
> > > index 000000000000..aca646aecb12
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
> > > @@ -0,0 +1,42 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/gpio/delta,tn48m-gpio.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Delta Networks TN48M CPLD GPIO controller
> > > +
> > > +maintainers:
> > > +  - Robert Marko <robert.marko@sartura.hr>
> > > +
> > > +description: |
> > > +  This module is part of the Delta TN48M multi-function device. For more
> > > +  details see ../mfd/delta,tn48m-cpld.yaml.
> > > +
> > > +  GPIO controller module provides GPIO-s for the SFP slots.
> > > +  It is split into 3 controllers, one output only for the SFP TX disable
> > > +  pins, one input only for the SFP present pins and one input only for
> > > +  the SFP LOS pins.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - delta,tn48m-gpio-sfp-tx-disable
> > > +      - delta,tn48m-gpio-sfp-present
> > > +      - delta,tn48m-gpio-sfp-los
> >
> > The function of the 'general purpose' IO should not be encoded into the
> > compatible name. Is each instance.
>
> They are not general-purpose, they are hard-wired pins.
> This is how the driver knows whether its output or input only,

Why does the driver need to know that? The user of the pins (the SFP
cage) knows the direction and should configure them the right way.

> and it's been reviewed by Andy Shevchenko.
> It was weird for me as well, but that is how GPIO regmap works.
>
> It was modeled by the sl28cpld GPIO driver as well as the rest of the docs
> as that CPLD has similar features supported to what this initial support does.

That one is at least just encoding the programming model, not the
connection. Maybe the driver didn't need to know there either, but I
can't study everyone's h/w in depth.

That one is also 8 GPIOs per instance, not 1.

> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  "#gpio-cells":
> > > +    const: 2
> > > +
> > > +  gpio-controller: true
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - "#gpio-cells"
> > > +  - gpio-controller
> > > +
> > > +additionalProperties: false
> > > diff --git a/Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml b/Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml
> > > new file mode 100644
> > > index 000000000000..055e09129f86
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml
> > > @@ -0,0 +1,81 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/mfd/delta,tn48m-cpld.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Delta Networks TN48M CPLD controller
> > > +
> > > +maintainers:
> > > +  - Robert Marko <robert.marko@sartura.hr>
> > > +
> > > +description: |
> > > +  Lattice CPLD onboard the TN48M switches is used for system
> > > +  management.
> > > +
> > > +  It provides information about the hardware model, revision,
> > > +  PSU status etc.
> > > +
> > > +  It is also being used as a GPIO expander for the SFP slots.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: delta,tn48m-cpld
> > > +
> > > +  reg:
> > > +    description:
> > > +      I2C device address.
> > > +    maxItems: 1
> > > +
> > > +  "#address-cells":
> > > +    const: 1
> > > +
> > > +  "#size-cells":
> > > +    const: 0
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - "#address-cells"
> > > +  - "#size-cells"
> > > +
> > > +patternProperties:
> > > +  "^gpio(@[0-9a-f]+)?$":
> > > +    $ref: ../gpio/delta,tn48m-gpio.yaml
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    i2c {
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +
> > > +        cpld@41 {
> > > +            compatible = "delta,tn48m-cpld";
> > > +            reg = <0x41>;
> > > +            #address-cells = <1>;
> > > +            #size-cells = <0>;
> > > +
> > > +            gpio@31 {
> > > +                compatible = "delta,tn48m-gpio-sfp-tx-disable";
> > > +                reg = <0x31>;
> >
> > Encode the register address into the gpio cells.
> Do you have an example of that?

The 'gpio number' in the first cell is totally up to the GPIO provider
(really all the cells are and are opaque to the consumer, but GPIO is
fairly standardized). So most of the time it's just the bit offset or
bit and register offsets when multiple 32-bit registers.

Rob
