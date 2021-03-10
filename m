Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CDC52334715
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 19:46:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233600AbhCJSqC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 13:46:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:41380 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232898AbhCJSpr (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Mar 2021 13:45:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 533BE64F9A;
        Wed, 10 Mar 2021 18:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615401947;
        bh=/4tVsSht85b9MLgU0lwjqDu6QGPuCM5/FKwIGeWMO2s=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=SYapoUtXtlH90y/nwx57NYaS1I7VnZqq1m40FbXinR9VBq1MTsadjWD9UQCid1kTA
         TEdlPMi69VCyZHeaWxlgJ2ueCZFS2dkCWYB8nSl/JtsIobDnPyzK2i2i3D2hWERPRg
         rN+VqjZENuPE65ClCupXXvIB4k5r9jVAdZdIiw65HtXjGCGAph5MDxiyR1k3QkIWkE
         A9+yyiI2TMbZCMlM9+QyRDggmcSzWjS2Z+tbNrE7PHKV1xIcgzOJHD1KkcXRzm1ymU
         y61g7r1PoYpH6cJwGibmjAa8yirGWvpRYfSnh6QWetWi6dydUQmB1pR+RW+/nPfaBo
         0MyERZiDO8toA==
Received: by mail-ed1-f43.google.com with SMTP id d13so29700340edp.4;
        Wed, 10 Mar 2021 10:45:47 -0800 (PST)
X-Gm-Message-State: AOAM532fsi6EbEgt5QuZiQbLN1twHaod0rOkjZwuIhzoxoXAV5uGE/dJ
        N3D11NIFw9pQm4EV3ZCh1m1g0t7vjs7gPdXBEg==
X-Google-Smtp-Source: ABdhPJxj6NvDcN/saX1zWByVbqDOoJlBWKtJI2h198X1G+YyBKGA9zQacpTp04V3V/aMC/q6kcZdBlG02S5VBBvxFwM=
X-Received: by 2002:a05:6402:c0f:: with SMTP id co15mr4796742edb.373.1615401945895;
 Wed, 10 Mar 2021 10:45:45 -0800 (PST)
MIME-Version: 1.0
References: <20210310125504.31886-1-noltari@gmail.com> <20210310125504.31886-5-noltari@gmail.com>
 <CAL_JsqK4b+U7cVb04+moB4biGVFC4mr3VGx70KdQKitiCGdtnQ@mail.gmail.com> <A2B4813E-4177-4969-9119-A40B39A36948@gmail.com>
In-Reply-To: <A2B4813E-4177-4969-9119-A40B39A36948@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 10 Mar 2021 11:45:34 -0700
X-Gmail-Original-Message-ID: <CAL_JsqL+CwnhKY4bijnp7eGfYLwRpDUK+iFharVW=DWipsvZbg@mail.gmail.com>
Message-ID: <CAL_JsqL+CwnhKY4bijnp7eGfYLwRpDUK+iFharVW=DWipsvZbg@mail.gmail.com>
Subject: Re: [PATCH v6 04/15] dt-bindings: add BCM6328 pincontroller binding documentation
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 10, 2021 at 11:03 AM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:
>
> Hi Rob,
>
> > El 10 mar 2021, a las 18:45, Rob Herring <robh+dt@kernel.org> escribi=
=C3=B3:
> >
> > On Wed, Mar 10, 2021 at 5:55 AM =C3=81lvaro Fern=C3=A1ndez Rojas
> > <noltari@gmail.com> wrote:
> >>
> >> Add binding documentation for the pincontrol core found in BCM6328 SoC=
s.
> >>
> >> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> >> Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
> >> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> >> ---
> >> v6: add changes suggested by Rob Herring
> >> v5: change Documentation to dt-bindings in commit title
> >> v4: no changes
> >> v3: add new gpio node
> >> v2: remove interrupts
> >>
> >> .../pinctrl/brcm,bcm6328-pinctrl.yaml         | 174 ++++++++++++++++++
> >> 1 file changed, 174 insertions(+)
> >> create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm6=
328-pinctrl.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pi=
nctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl=
.yaml
> >> new file mode 100644
> >> index 000000000000..471f6efa1754
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.y=
aml
> >> @@ -0,0 +1,174 @@
> >> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/pinctrl/brcm,bcm6328-pinctrl.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Broadcom BCM6328 pin controller
> >> +
> >> +maintainers:
> >> +  - =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> >> +  - Jonas Gorski <jonas.gorski@gmail.com>
> >> +
> >> +description: |+
> >> +  The pin controller node should be the child of a syscon node.
> >> +
> >> +  Refer to the the bindings described in
> >> +  Documentation/devicetree/bindings/mfd/syscon.yaml
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: brcm,bcm6328-pinctrl
> >> +
> >> +  gpio:
> >> +    type: object
> >> +    properties:
> >> +      compatible:
> >> +        const: brcm,bcm6328-gpio
> >> +
> >> +      data:
> >> +        $ref: /schemas/types.yaml#/definitions/uint32
> >> +        description: |
> >> +          Offset in the register map for the data register (in bytes)=
.
> >> +
> >> +      dirout:
> >> +        $ref: /schemas/types.yaml#/definitions/uint32
> >> +        description: |
> >> +          Offset in the register map for the dirout register (in byte=
s).
> >> +
> >> +      gpio-controller: true
> >> +
> >> +      "#gpio-cells":
> >> +        const: 2
> >> +
> >> +      gpio-ranges:
> >> +        maxItems: 1
> >> +
> >> +    required:
> >> +      - gpio-controller
> >> +      - gpio-ranges
> >> +      - '#gpio-cells'
> >> +
> >> +    additionalProperties: false
> >> +
> >> +patternProperties:
> >> +  '^.*-pins$':
> >> +    if:
> >> +      type: object
> >> +    then:
> >> +      properties:
> >> +        function:
> >> +          $ref: "pinmux-node.yaml#/properties/function"
> >> +          enum: [ serial_led_data, serial_led_clk, inet_act_led, pcie=
_clkreq,
> >> +                  led, ephy0_act_led, ephy1_act_led, ephy2_act_led,
> >> +                  ephy3_act_led, hsspi_cs1, usb_device_port, usb_host=
_port ]
> >> +
> >> +        pins:
> >> +          $ref: "pinmux-node.yaml#/properties/pins"
> >> +          enum: [ gpio6, gpio7, gpio11, gpio16, gpio17, gpio18, gpio1=
9,
> >> +                  gpio20, gpio25, gpio26, gpio27, gpio28, hsspi_cs1,
> >> +                  usb_port1 ]
> >> +
> >> +required:
> >> +  - compatible
> >> +  - gpio
> >> +
> >> +additionalProperties: false
> >> +
> >> +examples:
> >> +  - |
> >> +    gpio_cntl@10000080 {
> >> +      compatible =3D "brcm,bcm6328-gpio-controller", "syscon", "simpl=
e-mfd";
> >
> > You just added "brcm,bcm6328-gpio-controller", it would need to be docu=
mented.
>
> I just added that because you requested me to do it =C2=AF\_(=E3=83=84)_/=
=C2=AF

I said 'syscon' by itself was not allowed, then asked about the multiple le=
vels.

> What should I do to document it?
> I still don=E2=80=99t get most of this .yaml stuff...
>
> >
> >> +      reg =3D <0x10000080 0x80>;
> >> +
> >> +      pinctrl: pinctrl {
> >> +        compatible =3D "brcm,bcm6328-pinctrl";
> >> +
> >> +        gpio {
> >> +          compatible =3D "brcm,bcm6328-gpio";
> >
> > I'm still trying to understand why you need 3 levels of nodes here?
> > The gpio controller contains a pin controller plus other undefined
> > functions (because of 'syscon') and the pin controller contains a gpio
> > controller?
>
> In previous versions the gpio controller was registered along with the pi=
n controller, but @Linus requested me to register the gpio pin controller r=
anges through device tree by using gpio-ranges and I decided to use this ap=
proach, which was already used by other pin controllers.
> However, there aren=E2=80=99t any pinctrl drivers using gpio-regmap, so t=
his is kind of new=E2=80=A6
>
> >
> > I think "brcm,bcm6328-gpio-controller" and "brcm,bcm6328-pinctrl"
> > should be a single node.
>
> I agree, but does it make sense to add gpio-ranges to a pinctrl node refe=
rencing itself?

It wouldn't be. I wasn't saying the pinctrl and gpio controller are
the same node. My suggestion was combining syscon and pinctrl.

> Something like:
> syscon {

Again with the syscon. If pinctrl and GPIO are the only functions
within this h/w block, then this is not a syscon. You are just abusing
that having 'syscon' compatible means you get a regmap created
automagically for you. Nothing here looks like a 'system controller'
to me. A 'system controller' is a random collection of register bits
with functions that don't fit anywhere else.

>         pinctrl: pinctrl {
>                 compatible =E2=80=A6
>
>                 gpio-controller;
>                 gpio-ranges =3D <&pinctrl 0 0 32>;
>                 #gpio-cells =3D <2>;

I was assuming you have multiple GPIO controllers within 1 pinctlr?
The pinctrl and gpio could be a single node like above if there's only
1 GPIO controller. But I'm still somewhat guessing what the h/w looks
like because I have to go searching thru the driver to decipher.
Please describe the h/w in the binding.

If there's more than 1 GPIO controller, then I'd imagine you have
something like this:

pinctrl {
  ...
  reg =3D <base 0x80>;
  ranges =3D <0 base 0x80;
  gpio@4 {
    reg =3D <4 4>, <c 4>;
    reg-names =3D "dirout", "dat";
  };
  gpio@? {};

  foo-pins {};
};

>
>                 =E2=80=A6
>         };
> };
>
> >
> >> +          data =3D <0xc>;
> >> +          dirout =3D <0x4>;
> >
> > This looks similar to the brcm,bcm6345-gpio.txt binding which then
> > uses the gpio-mmio driver. Defining addresses with 'reg' is much
> > preferred over custom properties. That binding also captures the bank
> > size.
>
> It=E2=80=99s similar, but Linus requested to use gpio regmap because we h=
ad a large amount of registers, so we=E2=80=99re not using it.

Looks like you have 2 registers to me.

Rob
