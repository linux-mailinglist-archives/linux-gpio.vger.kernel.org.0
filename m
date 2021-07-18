Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 616AD3CC846
	for <lists+linux-gpio@lfdr.de>; Sun, 18 Jul 2021 11:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbhGRJSr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 18 Jul 2021 05:18:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229578AbhGRJSr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 18 Jul 2021 05:18:47 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C553EC061765
        for <linux-gpio@vger.kernel.org>; Sun, 18 Jul 2021 02:15:49 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id k11so16195340ioa.5
        for <linux-gpio@vger.kernel.org>; Sun, 18 Jul 2021 02:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UY/uuimcwG2QGP6zR2h/qQpbp8YhinG01JRSs5/gTjE=;
        b=gOEVPphpi1VzCpTsAIyxKVFkGHSyEUfzBM3ZTa534U3l+mA5NM5es8Sk+A8Agai92x
         CDP7GTIHQ6Eoj3PifZ2Hieye99sQxBslvMQTo+NGu7GofmhIIqnDHwJp3cyuGEFY2hcO
         m/9mVXK+nx7jO1z5qzWEHzNPKdcTcZjG1uitgmp29t1dFxfea20bq4J+zLIB/EKWfqlf
         o31eb7Ary3+dpu8u+WCE6qARXS3gAU+kBS3kFQFBg2fruszR0XCxFnJLdE884X2eSkZI
         jFBY4PT+MG7RqI7c3u7R7Ns5DOxQczPJ+ybkWE3JMrkkmoPLU8f9T7DIu11UvNDfXnU+
         gJVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UY/uuimcwG2QGP6zR2h/qQpbp8YhinG01JRSs5/gTjE=;
        b=flQmPigwHsvM3PnZFxSToYXxxuV4DQBNkS+c9jqhJ+anFylQls6/UHa1VUeija71/0
         P3VPRFGAmBZBKsB6I+PvPFh8yD8XWtzW0qpXrCakLh8VE/ZBbCvE58OCQEwDHDvl+lv1
         U2cZC3IwugLuZFAXjpRfJsIheF8Lb/7LvFCxf/D+h3N3WI2Ktnkp44G4bVsvmEjxLzDo
         ZOq7JwqMSEq3XWqw0SOrQ1YaOLYIiRIr2K53Vfy0DjkAP1+EhENiJ8wHIJP2HpQHvbwK
         h2kJgPRUWsaZjZZ8FOB+Uv0VuLRYFAjuXU637MHwuQsNQ6Qt1+uqM15hXYP2PHwws0kI
         H8Zw==
X-Gm-Message-State: AOAM532sJAbrK2Nui36beAJ1Y1aj/+cREXUmvOTbZ5toaonRSWhS3ePI
        HyW8Pqfh4TCpOI9IcXqL1RbFirS2+OazaBcctlxu4g==
X-Google-Smtp-Source: ABdhPJxsDlY/mNXq4LhEUBA3aOHiO7SXmodQRqqXcqzbpqtwExP67gls3WehwZ1+DLVas2tPH9/Mi37mr3vRZHMLbqA=
X-Received: by 2002:a6b:1406:: with SMTP id 6mr14481233iou.25.1626599749201;
 Sun, 18 Jul 2021 02:15:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210607123317.3242031-1-robert.marko@sartura.hr>
 <20210607123317.3242031-5-robert.marko@sartura.hr> <CA+HBbNH7wcpfQOX2=vZmW78GoWy_WL3Pz-dMKe0N0ebZDp+oUw@mail.gmail.com>
 <20210713222528.GA952399@robh.at.kernel.org>
In-Reply-To: <20210713222528.GA952399@robh.at.kernel.org>
From:   Robert Marko <robert.marko@sartura.hr>
Date:   Sun, 18 Jul 2021 11:15:38 +0200
Message-ID: <CA+HBbNFj5+6sLKxmL8XtsZQ48ch8OjTbJ1bwkDC8dfRiOyWY1Q@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] dt-bindings: mfd: Add Delta TN48M CPLD drivers bindings
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Luka Perkov <luka.perkov@sartura.hr>, jmp@epiphyte.org,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 14, 2021 at 12:25 AM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Jun 25, 2021 at 01:46:08PM +0200, Robert Marko wrote:
> > On Mon, Jun 7, 2021 at 2:33 PM Robert Marko <robert.marko@sartura.hr> wrote:
> > >
> > > Add binding documents for the Delta TN48M CPLD drivers.
> > >
> > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > ---
> > > Changes in v3:
> > > * Include bindings for reset driver
> > >
> > > Changes in v2:
> > > * Implement MFD as a simple I2C MFD
> > > * Add GPIO bindings as separate
> > >
> > >  .../bindings/gpio/delta,tn48m-gpio.yaml       | 42 +++++++++
> > >  .../bindings/mfd/delta,tn48m-cpld.yaml        | 90 +++++++++++++++++++
> > >  .../bindings/reset/delta,tn48m-reset.yaml     | 35 ++++++++
> > >  3 files changed, 167 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
> > >  create mode 100644 Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml
> > >  create mode 100644 Documentation/devicetree/bindings/reset/delta,tn48m-reset.yaml
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
> > > +
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
> > > index 000000000000..2c6e2adf73ca
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml
> > > @@ -0,0 +1,90 @@
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
> > > +  It is also being used as a GPIO expander for the SFP slots and
> > > +  reset controller for the switch MAC-s and other peripherals.
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
> > > +  "^reset-controller?$":
> > > +    $ref: ../reset/delta,tn48m-reset.yaml
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
> > > +                gpio-controller;
> > > +                #gpio-cells = <2>;
> > > +            };
> > > +
> > > +            gpio@3a {
> > > +                compatible = "delta,tn48m-gpio-sfp-present";
> > > +                reg = <0x3a>;
> > > +                gpio-controller;
> > > +                #gpio-cells = <2>;
> > > +            };
> > > +
> > > +            gpio@40 {
> > > +                compatible = "delta,tn48m-gpio-sfp-los";
> > > +                reg = <0x40>;
> > > +                gpio-controller;
> > > +                #gpio-cells = <2>;
> > > +            };
> > > +
> > > +            reset-controller {
> > > +              compatible = "delta,tn48m-reset";
> > > +              #reset-cells = <1>;
> > > +            };
> > > +        };
> > > +    };
> > > diff --git a/Documentation/devicetree/bindings/reset/delta,tn48m-reset.yaml b/Documentation/devicetree/bindings/reset/delta,tn48m-reset.yaml
> > > new file mode 100644
> > > index 000000000000..0e5ee8decc0d
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/reset/delta,tn48m-reset.yaml
> > > @@ -0,0 +1,35 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/reset/delta,tn48m-reset.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Delta Networks TN48M CPLD reset controller
> > > +
> > > +maintainers:
> > > +  - Robert Marko <robert.marko@sartura.hr>
> > > +
> > > +description: |
> > > +  This module is part of the Delta TN48M multi-function device. For more
> > > +  details see ../mfd/delta,tn48m-cpld.yaml.
> > > +
> > > +  Reset controller modules provides resets for the following:
> > > +  * 88F7040 SoC
> > > +  * 88F6820 SoC
> > > +  * 98DX3265 switch MAC-s
> > > +  * 88E1680 PHY-s
> > > +  * 88E1512 PHY
> > > +  * PoE PSE controller
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: delta,tn48m-reset
> > > +
> > > +  "#reset-cells":
> > > +    const: 1
> > > +
> > > +required:
> > > +  - compatible
> > > +  - "#reset-cells"
> > > +
> > > +additionalProperties: false
> > > --
> > > 2.31.1
> > >
> >
> > Are there any issues with the bindings?
>
> Yes. Primarily the GPIO function being part of the compatible. I'm
> surprised Linus W is okay with that.

I think I already explained this before, having a single compatible
won't work here.
Then there would not be anything to know whether its input or output
only as the pins
have specific purpose.
And knowing the capabilites is a requirment of the GPIO regmap driver
and the GPIO
core itself as it exposes that information in a generic manner and
driver like for the
SFP bus use that.

Maybe Linus W can chime in here as well.

>
> > The patch series is depending on this as the rest has been reviewed.
>
> The bindings have been reviewed too, you just didn't like my comments...

Sorry, I did not pick that up as after my replies there was no further
discussion.

I am really hoping that we can find a middle ground here and get this
merged as the driver code itself has been revied and ACK-ed.

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
