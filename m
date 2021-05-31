Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 730E2395B1C
	for <lists+linux-gpio@lfdr.de>; Mon, 31 May 2021 15:09:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231327AbhEaNKx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 31 May 2021 09:10:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231436AbhEaNKv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 31 May 2021 09:10:51 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B855C061574
        for <linux-gpio@vger.kernel.org>; Mon, 31 May 2021 06:09:11 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id v9so11861183ion.11
        for <linux-gpio@vger.kernel.org>; Mon, 31 May 2021 06:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9d53VYJFHWARQy9topfwOXbjQ0bIZRs2DU18D2KXAa8=;
        b=amIdx9qPHSL5wLI1nbQZ3XQsrZhpkI0zTlN46c1MiJfJyU5eO1jrwWRezIfj/rDPg6
         TiaYdk8FTz+uWVsDZKTqPuY1auR05BHT1vyD+seMqw2beoTOYrFH6vgHlep4UqTULIJp
         rERhjkD8nzKKuartg5q6uhmTTv9xjMIziMz5tXCFcVp1h9tSANvH5z5bNsnIZUPJR9Br
         Tji3crAGIfy5v1tagPd2+C9Pi9DR1B440o8B6E+NZwAMQ+pALsGwLv5EgoH6YQyyUpqM
         Ia0ir2U/jmTrMCvXPiOTKEKH/ktZkizwwcwL4EGbP4fuqVWozmKQUapiUWgnR7+z8Ef/
         wTLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9d53VYJFHWARQy9topfwOXbjQ0bIZRs2DU18D2KXAa8=;
        b=flL3kuXj41QZkM4wdHEa4ZdpIqMPvQ66ntpvIIYgNplqwoBUNUOGrZNMhRk3BLphZL
         NlAHq/g7yMkFxblze7Sz5qnexAPyuyEDqJv3cznA4Y2F4yCv2+vip29p+wI0Rah4Ufcb
         R9k6pQwxXOOIrPx9qTfCJ+p//bpdCRuZzzQ0a+Ta+4otKqZoE+C/4MjATTPHnB+DhuIS
         zKA/5fgjnHMhmDkUnY2H+Bkh4f+mwiSg6G7nrMZ7wL3tQmMA3fGGalpZl5N2Mw7MVVfv
         Jvsu+Z97Ae3dKfXx+JJZA7MYBYcj031Btuo9BZ6kbsFdT2Nr87klrdmYhspPA99FHhn2
         MzPA==
X-Gm-Message-State: AOAM532eMdJ1FJPM+I3IPtI+F9BwyVQjnqFWd7G+CdJ6kGD8t5aY9XON
        pqEpw5ZbXkNNRotuIZL89LMpKtmOah6g4QejwGncAg==
X-Google-Smtp-Source: ABdhPJw7xwXA7/GIcJxM/KiJnXx1jN8kMpl7N+zYmE+3hheG9YF/E+xnqu1w3ffTL16/kHT8Q9pxRai9SrehIXjyWIo=
X-Received: by 2002:a02:2a0b:: with SMTP id w11mr21053709jaw.22.1622466550308;
 Mon, 31 May 2021 06:09:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210524120539.3267145-1-robert.marko@sartura.hr>
 <20210524120539.3267145-3-robert.marko@sartura.hr> <20210524230940.GA1350504@robh.at.kernel.org>
 <CA+HBbNHb71n7GPCPWMivOV5U0RGQnwT054y6U0grQ8Hr=d9geQ@mail.gmail.com> <CAL_JsqJCrndJpW91i7fbEfzCVPr+k4f-b2gqLRndvUMwSCyCMA@mail.gmail.com>
In-Reply-To: <CAL_JsqJCrndJpW91i7fbEfzCVPr+k4f-b2gqLRndvUMwSCyCMA@mail.gmail.com>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Mon, 31 May 2021 15:08:59 +0200
Message-ID: <CA+HBbNFP6JAPaGvmqHT1wRoqQ6yLnrwEJ=Dk+EFGW3uttiEXAA@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] dt-bindings: mfd: Add Delta TN48M CPLD drivers bindings
To:     Rob Herring <robh@kernel.org>
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

On Tue, May 25, 2021 at 11:44 PM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, May 25, 2021 at 4:47 AM Robert Marko <robert.marko@sartura.hr> wrote:
> >
> > On Tue, May 25, 2021 at 1:09 AM Rob Herring <robh@kernel.org> wrote:
> > >
> > > On Mon, May 24, 2021 at 02:05:38PM +0200, Robert Marko wrote:
> > > > Add binding documents for the Delta TN48M CPLD drivers.
> > > >
> > > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > > ---
> > > > Changes in v2:
> > > > * Implement MFD as a simple I2C MFD
> > > > * Add GPIO bindings as separate
> > >
> > > I don't understand why this changed. This doesn't look like an MFD to
> > > me. Make your binding complete if there are missing functions.
> > > Otherwise, stick with what I already ok'ed.
> >
> > It changed because the custom driver was dropped at Lee Jones-es request,
> > and simple-mfd-i2c is now used.
>
> To a certain extent, I don't care about the driver. A binding can't
> know what an OS wants in terms of structure and driver structure could
> evolve.

To a certain degree, I also agree, but in this case, it had to change.
Otherwise, it would not represent the actual driver and its requirements.

I agree that it was not a true MFD with only one consumer, I have
added a reset driver
in v3.
I was planning on adding it later anyway.

>
> > > >  .../bindings/gpio/delta,tn48m-gpio.yaml       | 42 ++++++++++
> > > >  .../bindings/mfd/delta,tn48m-cpld.yaml        | 81 +++++++++++++++++++
> > > >  2 files changed, 123 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
> > > >  create mode 100644 Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml b/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
> > > > new file mode 100644
> > > > index 000000000000..aca646aecb12
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
> > > > @@ -0,0 +1,42 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/gpio/delta,tn48m-gpio.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Delta Networks TN48M CPLD GPIO controller
> > > > +
> > > > +maintainers:
> > > > +  - Robert Marko <robert.marko@sartura.hr>
> > > > +
> > > > +description: |
> > > > +  This module is part of the Delta TN48M multi-function device. For more
> > > > +  details see ../mfd/delta,tn48m-cpld.yaml.
> > > > +
> > > > +  GPIO controller module provides GPIO-s for the SFP slots.
> > > > +  It is split into 3 controllers, one output only for the SFP TX disable
> > > > +  pins, one input only for the SFP present pins and one input only for
> > > > +  the SFP LOS pins.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    enum:
> > > > +      - delta,tn48m-gpio-sfp-tx-disable
> > > > +      - delta,tn48m-gpio-sfp-present
> > > > +      - delta,tn48m-gpio-sfp-los
> > >
> > > The function of the 'general purpose' IO should not be encoded into the
> > > compatible name. Is each instance.
> >
> > They are not general-purpose, they are hard-wired pins.
> > This is how the driver knows whether its output or input only,
>
> Why does the driver need to know that? The user of the pins (the SFP
> cage) knows the direction and should configure them the right way.

Because the GPIO regmap driver requires this information as well as setting
the register for the directions it supports, the GPIO core requires it as well.
You cant allow setting a direction that is not supported as GPIO core
and other subsystems depend on knowing what directions are supported.

>
> > and it's been reviewed by Andy Shevchenko.
> > It was weird for me as well, but that is how GPIO regmap works.
> >
> > It was modeled by the sl28cpld GPIO driver as well as the rest of the docs
> > as that CPLD has similar features supported to what this initial support does.
>
> That one is at least just encoding the programming model, not the
> connection. Maybe the driver didn't need to know there either, but I
> can't study everyone's h/w in depth.

Understood, but the driver received 2 reviews and one ACK, so the code is
good and reviewed.

>
> That one is also 8 GPIOs per instance, not 1.

In this case, it's 4 pins per instance.

>
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  "#gpio-cells":
> > > > +    const: 2
> > > > +
> > > > +  gpio-controller: true
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - "#gpio-cells"
> > > > +  - gpio-controller
> > > > +
> > > > +additionalProperties: false
> > > > diff --git a/Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml b/Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml
> > > > new file mode 100644
> > > > index 000000000000..055e09129f86
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml
> > > > @@ -0,0 +1,81 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/mfd/delta,tn48m-cpld.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Delta Networks TN48M CPLD controller
> > > > +
> > > > +maintainers:
> > > > +  - Robert Marko <robert.marko@sartura.hr>
> > > > +
> > > > +description: |
> > > > +  Lattice CPLD onboard the TN48M switches is used for system
> > > > +  management.
> > > > +
> > > > +  It provides information about the hardware model, revision,
> > > > +  PSU status etc.
> > > > +
> > > > +  It is also being used as a GPIO expander for the SFP slots.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: delta,tn48m-cpld
> > > > +
> > > > +  reg:
> > > > +    description:
> > > > +      I2C device address.
> > > > +    maxItems: 1
> > > > +
> > > > +  "#address-cells":
> > > > +    const: 1
> > > > +
> > > > +  "#size-cells":
> > > > +    const: 0
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - reg
> > > > +  - "#address-cells"
> > > > +  - "#size-cells"
> > > > +
> > > > +patternProperties:
> > > > +  "^gpio(@[0-9a-f]+)?$":
> > > > +    $ref: ../gpio/delta,tn48m-gpio.yaml
> > > > +
> > > > +additionalProperties: false
> > > > +
> > > > +examples:
> > > > +  - |
> > > > +    i2c {
> > > > +        #address-cells = <1>;
> > > > +        #size-cells = <0>;
> > > > +
> > > > +        cpld@41 {
> > > > +            compatible = "delta,tn48m-cpld";
> > > > +            reg = <0x41>;
> > > > +            #address-cells = <1>;
> > > > +            #size-cells = <0>;
> > > > +
> > > > +            gpio@31 {
> > > > +                compatible = "delta,tn48m-gpio-sfp-tx-disable";
> > > > +                reg = <0x31>;
> > >
> > > Encode the register address into the gpio cells.
> > Do you have an example of that?
>
> The 'gpio number' in the first cell is totally up to the GPIO provider
> (really all the cells are and are opaque to the consumer, but GPIO is
> fairly standardized). So most of the time it's just the bit offset or
> bit and register offsets when multiple 32-bit registers.

As the GPIO regmap is the ideal use case for using "reg" to get the
register address
and the driver itself has received multiple reviews and has been ACK-ed I would
prefer to leave it as is.

Regards,
Robert

>
> Rob



-- 
Robert Marko
Staff Embedded Linux Engineer
Sartura Ltd.
Lendavska ulica 16a
10000 Zagreb, Croatia
Email: robert.marko@sartura.hr
Web: www.sartura.hr
