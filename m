Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4732C3CF0D5
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Jul 2021 02:39:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349383AbhGSXhO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jul 2021 19:37:14 -0400
Received: from mail-io1-f44.google.com ([209.85.166.44]:34399 "EHLO
        mail-io1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350764AbhGSWSh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jul 2021 18:18:37 -0400
Received: by mail-io1-f44.google.com with SMTP id g22so21968258iom.1;
        Mon, 19 Jul 2021 15:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=x8FnStsqO07lJSEXVH2fhD2YnsyTXGxzxYo2rndiFjw=;
        b=oFU9d7ug5BgPJESQ1DaDl8tGpXutie8YRwxUZuhOk7sZWNYsL7kvf5qVZx7qM6WiWH
         cbC3dHS4BJMjXQyqFhMukI0WKRMSvTimBOUBtEqZa+ja5xOvGBGQZP+WSm+WCoLE9lKa
         01yQ008Gi5BAI1UPGJZK+hWeeM20rgUzmZh0YgBhf4SaHlLVSkHGjfn2SlSNagpOOc/0
         nf3zwWZNaZg107wtlIIWkBrAvsECUGSvtH1W9A2FuTh+AMoCb7EoIZWf2M2VqQ50xxy/
         qyfoNDzEBDtBcz0nTfsReInp1fTsHSXaLeWwbBHll4juvwNVyigx0BSpVdzPpfWZpCLU
         biIQ==
X-Gm-Message-State: AOAM531+WBBtuQC1ApglQBQ4RbemQY+OOk+9wq3dT4FGBRrQ5wHAfz6X
        i+WPZ/KVKnG2thSRIKDyDA==
X-Google-Smtp-Source: ABdhPJzKEYYZ9HvB9YP4Yl5mDCrRDIc4wH0J8A79h25okpD3UQMyfuLlC0B1lWiH/mWa1hAUjvMU+A==
X-Received: by 2002:a5d:930b:: with SMTP id l11mr21477012ion.177.1626735551513;
        Mon, 19 Jul 2021 15:59:11 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id h1sm5655055ioz.22.2021.07.19.15.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 15:59:10 -0700 (PDT)
Received: (nullmailer pid 2786165 invoked by uid 1000);
        Mon, 19 Jul 2021 22:59:06 -0000
Date:   Mon, 19 Jul 2021 16:59:06 -0600
From:   Rob Herring <robh@kernel.org>
To:     Robert Marko <robert.marko@sartura.hr>
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
Subject: Re: [PATCH v6 5/6] dt-bindings: mfd: Add Delta TN48M CPLD drivers
 bindings
Message-ID: <20210719225906.GA2769608@robh.at.kernel.org>
References: <20210607123317.3242031-1-robert.marko@sartura.hr>
 <20210607123317.3242031-5-robert.marko@sartura.hr>
 <CA+HBbNH7wcpfQOX2=vZmW78GoWy_WL3Pz-dMKe0N0ebZDp+oUw@mail.gmail.com>
 <20210713222528.GA952399@robh.at.kernel.org>
 <CA+HBbNFj5+6sLKxmL8XtsZQ48ch8OjTbJ1bwkDC8dfRiOyWY1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+HBbNFj5+6sLKxmL8XtsZQ48ch8OjTbJ1bwkDC8dfRiOyWY1Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, Jul 18, 2021 at 11:15:38AM +0200, Robert Marko wrote:
> On Wed, Jul 14, 2021 at 12:25 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Fri, Jun 25, 2021 at 01:46:08PM +0200, Robert Marko wrote:
> > > On Mon, Jun 7, 2021 at 2:33 PM Robert Marko <robert.marko@sartura.hr> wrote:
> > > >
> > > > Add binding documents for the Delta TN48M CPLD drivers.
> > > >
> > > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > > ---
> > > > Changes in v3:
> > > > * Include bindings for reset driver
> > > >
> > > > Changes in v2:
> > > > * Implement MFD as a simple I2C MFD
> > > > * Add GPIO bindings as separate
> > > >
> > > >  .../bindings/gpio/delta,tn48m-gpio.yaml       | 42 +++++++++
> > > >  .../bindings/mfd/delta,tn48m-cpld.yaml        | 90 +++++++++++++++++++
> > > >  .../bindings/reset/delta,tn48m-reset.yaml     | 35 ++++++++
> > > >  3 files changed, 167 insertions(+)
> > > >  create mode 100644 Documentation/devicetree/bindings/gpio/delta,tn48m-gpio.yaml
> > > >  create mode 100644 Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml
> > > >  create mode 100644 Documentation/devicetree/bindings/reset/delta,tn48m-reset.yaml
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
> > > > +
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
> > > > index 000000000000..2c6e2adf73ca
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/mfd/delta,tn48m-cpld.yaml
> > > > @@ -0,0 +1,90 @@
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
> > > > +  It is also being used as a GPIO expander for the SFP slots and
> > > > +  reset controller for the switch MAC-s and other peripherals.
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
> > > > +  "^reset-controller?$":
> > > > +    $ref: ../reset/delta,tn48m-reset.yaml
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
> > > > +                gpio-controller;
> > > > +                #gpio-cells = <2>;
> > > > +            };
> > > > +
> > > > +            gpio@3a {
> > > > +                compatible = "delta,tn48m-gpio-sfp-present";
> > > > +                reg = <0x3a>;
> > > > +                gpio-controller;
> > > > +                #gpio-cells = <2>;
> > > > +            };
> > > > +
> > > > +            gpio@40 {
> > > > +                compatible = "delta,tn48m-gpio-sfp-los";
> > > > +                reg = <0x40>;
> > > > +                gpio-controller;
> > > > +                #gpio-cells = <2>;
> > > > +            };
> > > > +
> > > > +            reset-controller {
> > > > +              compatible = "delta,tn48m-reset";
> > > > +              #reset-cells = <1>;
> > > > +            };
> > > > +        };
> > > > +    };
> > > > diff --git a/Documentation/devicetree/bindings/reset/delta,tn48m-reset.yaml b/Documentation/devicetree/bindings/reset/delta,tn48m-reset.yaml
> > > > new file mode 100644
> > > > index 000000000000..0e5ee8decc0d
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/reset/delta,tn48m-reset.yaml
> > > > @@ -0,0 +1,35 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id: http://devicetree.org/schemas/reset/delta,tn48m-reset.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > > +
> > > > +title: Delta Networks TN48M CPLD reset controller
> > > > +
> > > > +maintainers:
> > > > +  - Robert Marko <robert.marko@sartura.hr>
> > > > +
> > > > +description: |
> > > > +  This module is part of the Delta TN48M multi-function device. For more
> > > > +  details see ../mfd/delta,tn48m-cpld.yaml.
> > > > +
> > > > +  Reset controller modules provides resets for the following:
> > > > +  * 88F7040 SoC
> > > > +  * 88F6820 SoC
> > > > +  * 98DX3265 switch MAC-s
> > > > +  * 88E1680 PHY-s
> > > > +  * 88E1512 PHY
> > > > +  * PoE PSE controller
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: delta,tn48m-reset
> > > > +
> > > > +  "#reset-cells":
> > > > +    const: 1
> > > > +
> > > > +required:
> > > > +  - compatible
> > > > +  - "#reset-cells"
> > > > +
> > > > +additionalProperties: false
> > > > --
> > > > 2.31.1
> > > >
> > >
> > > Are there any issues with the bindings?
> >
> > Yes. Primarily the GPIO function being part of the compatible. I'm
> > surprised Linus W is okay with that.
> 
> I think I already explained this before, having a single compatible
> won't work here.
> Then there would not be anything to know whether its input or output
> only as the pins
> have specific purpose.

The client side should tell the direction. Are you using the SFP 
binding?: Documentation/devicetree/bindings/net/sff,sfp.txt

Specific purpose IOs are not general purpose IOs. Repeating Linus W 
here. Maybe his opinion has evolved...

If the programming model of each instance is different, then different 
compatibles are justified. But describe what the difference is, not the 
connection.

> And knowing the capabilites is a requirment of the GPIO regmap driver
> and the GPIO
> core itself as it exposes that information in a generic manner and
> driver like for the
> SFP bus use that.

Driver details aren't justification for bindings.

> Maybe Linus W can chime in here as well.
> 
> >
> > > The patch series is depending on this as the rest has been reviewed.
> >
> > The bindings have been reviewed too, you just didn't like my comments...
> 
> Sorry, I did not pick that up as after my replies there was no further
> discussion.
> 
> I am really hoping that we can find a middle ground here and get this
> merged as the driver code itself has been revied and ACK-ed.
> 
> Regards,
> Robert
> >
> > Rob
> 
> 
> 
> -- 
> Robert Marko
> Staff Embedded Linux Engineer
> Sartura Ltd.
> Lendavska ulica 16a
> 10000 Zagreb, Croatia
> Email: robert.marko@sartura.hr
> Web: www.sartura.hr
> 
