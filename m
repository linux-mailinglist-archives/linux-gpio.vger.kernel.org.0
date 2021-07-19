Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DA0E3CD2A1
	for <lists+linux-gpio@lfdr.de>; Mon, 19 Jul 2021 12:59:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236649AbhGSKF6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 19 Jul 2021 06:05:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236570AbhGSKF5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jul 2021 06:05:57 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 615A1C061766
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jul 2021 02:54:24 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id m2so21480909wrq.2
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jul 2021 03:46:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=5ncXnlqgE4q5bQDJOQx33EL294v17db91qKDspkowjQ=;
        b=ungfp4cTXQ44y4KuTxVLcf1GGvurYO8TLwbQKMgP74ALdslAVaFdsPuMlRxU4pAnmK
         pC8mWs7URc3r9WRx9HHTjmk0zhwg1j0IT7BhQMGvZCeVXavOxFIYi+hry5cTouXjXSM4
         f6rQm5cM+95BGiGzy3N/qEj32mPCJz9J83bmarGUZEJc63/4Gts/KZUMV0Aakubh5RAL
         4WHg7eSvlxej3s8fQbXp4K7cunElN+xETCQOt3HRChnKs7inGvfYgistkjmHgCoU8Rb9
         f2c0EtA5ywUpQ19Ec0+XwOo2qS2AzVpGR8RWQiYz+rXGOmzWoWxnG8cqGGnRUk6zKxD7
         SfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=5ncXnlqgE4q5bQDJOQx33EL294v17db91qKDspkowjQ=;
        b=oMYrGJ3mjGExtK6mzAPyha3L159I8Nwmhbm3M30W5dTufMMFUOAaNVYPaGSnwqqlMK
         Xe8ROQ0iNooSdfXGMzZv7xuABKOwART23dmVE9PbVEYtTal/WsT+ApUIn1TTH2KQn+rA
         rhT19Pwwcw8oGEOUh2zl5tUaudMX+h6pILgOnOfWtjCfT2KnmHltwH9cspBIv2xVThGq
         HUdhSVfIgdEoGJZq3fxqlqtMNU34HdLPjCI9N4ZZ0N7QDDQvfS7Lw3Cj4WuIvLH6gyhe
         Ben8Ynfa/S/0MRoRMyCBlwGXgJfIAftP2PNRkVauTNPTChA5Umbsgdv7fHlZdoLPhtIj
         U+kw==
X-Gm-Message-State: AOAM530kYylAGVHYWacPPsIvEY+WwIaDJHEoVBOmTxaBu0iKwpesnWO4
        o+DwO0k03KTtEOjKj4DQ4zN/EA==
X-Google-Smtp-Source: ABdhPJwUaYjrRPSzqoEsjQXPLH0r3dGAN4SRfhoJE2clHeZ1L9JYNPGK0AECgxfvyguoDFVppkgFFw==
X-Received: by 2002:a5d:598f:: with SMTP id n15mr10849112wri.133.1626691594242;
        Mon, 19 Jul 2021 03:46:34 -0700 (PDT)
Received: from google.com ([31.124.24.141])
        by smtp.gmail.com with ESMTPSA id h20sm12758613wmb.17.2021.07.19.03.46.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 03:46:33 -0700 (PDT)
Date:   Mon, 19 Jul 2021 11:46:31 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Robert Marko <robert.marko@sartura.hr>
Cc:     Rob Herring <robh@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Luka Perkov <luka.perkov@sartura.hr>, jmp@epiphyte.org,
        Paul Menzel <pmenzel@molgen.mpg.de>,
        Donald Buczek <buczek@molgen.mpg.de>
Subject: Re: [PATCH v6 5/6] dt-bindings: mfd: Add Delta TN48M CPLD drivers
 bindings
Message-ID: <YPVYB/biVd4/Z1wn@google.com>
References: <20210607123317.3242031-1-robert.marko@sartura.hr>
 <20210607123317.3242031-5-robert.marko@sartura.hr>
 <CA+HBbNH7wcpfQOX2=vZmW78GoWy_WL3Pz-dMKe0N0ebZDp+oUw@mail.gmail.com>
 <20210713222528.GA952399@robh.at.kernel.org>
 <CA+HBbNFj5+6sLKxmL8XtsZQ48ch8OjTbJ1bwkDC8dfRiOyWY1Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+HBbNFj5+6sLKxmL8XtsZQ48ch8OjTbJ1bwkDC8dfRiOyWY1Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sun, 18 Jul 2021, Robert Marko wrote:

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
> only as the pins have specific purpose.

Properties?

> And knowing the capabilites is a requirment of the GPIO regmap driver
> and the GPIO
> core itself as it exposes that information in a generic manner and
> driver like for the
> SFP bus use that.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
