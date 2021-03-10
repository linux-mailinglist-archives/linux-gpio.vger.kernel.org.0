Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 075A0334927
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 21:53:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231207AbhCJUwh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 15:52:37 -0500
Received: from mail.kernel.org ([198.145.29.99]:59682 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231221AbhCJUw1 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Mar 2021 15:52:27 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 21D1564FD3;
        Wed, 10 Mar 2021 20:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615409546;
        bh=Y4IMzhmR/i1bJAbgSwEeGG96iVso6yxIJraC9k8LMGc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=cozP1j/I8aoiMuv2YDdfZMwfvQnR9fOloGYNzB1dOTWXhtvRovQu7ysheAQ+YlWPN
         7neeYzxAhbhteWzGT0Zht986ZNKck2IXicsJ5UFndHYjByTvmIK+vhBNrL0vT79Qgt
         4ZyeWG8M89UhsXBZ+ESnNm7YXuIjLVFj11k/519dDevNyEKTvkFLszcGDwKXA+63/2
         tUOls9+v9yAFQOShfksjPsePPlARzMy111x0QGFgn6/oIW+ex3KktF6OStGH5SAVOJ
         IRbEfIEb2icqkhDopx+wSwTBToSh6ONuNcYuPOeKZKNJMhfjKc2gDHavc4CE1I+iS3
         I6MLsR4B78HPA==
Received: by mail-ed1-f44.google.com with SMTP id x9so30134857edd.0;
        Wed, 10 Mar 2021 12:52:26 -0800 (PST)
X-Gm-Message-State: AOAM53323ShBKjmFcrlK6EcCRKRUKBv6SgCJw9qFDmQhTYl3cOytpofe
        H/cqEbqwCgX/ejSNL2ApO+ltAUdp6qoCOnuMqA==
X-Google-Smtp-Source: ABdhPJyqvdBSso9F9AtZeY6JBcCbY7CEai8YQatiruukELq+qfsHLH5PwrvEch/SixqjKv/wR0J3ksZ0hNrx+x537j4=
X-Received: by 2002:a05:6402:c88:: with SMTP id cm8mr5316532edb.62.1615409544408;
 Wed, 10 Mar 2021 12:52:24 -0800 (PST)
MIME-Version: 1.0
References: <20210310125504.31886-1-noltari@gmail.com> <20210310125504.31886-5-noltari@gmail.com>
 <CAL_JsqK4b+U7cVb04+moB4biGVFC4mr3VGx70KdQKitiCGdtnQ@mail.gmail.com>
 <A2B4813E-4177-4969-9119-A40B39A36948@gmail.com> <CAL_JsqL+CwnhKY4bijnp7eGfYLwRpDUK+iFharVW=DWipsvZbg@mail.gmail.com>
 <693A763C-14D1-47A2-A87E-2358E69DC993@gmail.com>
In-Reply-To: <693A763C-14D1-47A2-A87E-2358E69DC993@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 10 Mar 2021 13:52:12 -0700
X-Gmail-Original-Message-ID: <CAL_JsqJzDj6bKwEfWzoa_m8HjP2VbZH21wYXXEUUEmLwHjrY_A@mail.gmail.com>
Message-ID: <CAL_JsqJzDj6bKwEfWzoa_m8HjP2VbZH21wYXXEUUEmLwHjrY_A@mail.gmail.com>
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

On Wed, Mar 10, 2021 at 12:10 PM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:
>
> Hi Rob,
>
> > El 10 mar 2021, a las 19:45, Rob Herring <robh+dt@kernel.org> escribi=
=C3=B3:
> >
> > On Wed, Mar 10, 2021 at 11:03 AM =C3=81lvaro Fern=C3=A1ndez Rojas
> > <noltari@gmail.com> wrote:
> >>
> >> Hi Rob,
> >>
> >>> El 10 mar 2021, a las 18:45, Rob Herring <robh+dt@kernel.org> escribi=
=C3=B3:
> >>>
> >>> On Wed, Mar 10, 2021 at 5:55 AM =C3=81lvaro Fern=C3=A1ndez Rojas
> >>> <noltari@gmail.com> wrote:
> >>>>
> >>>> Add binding documentation for the pincontrol core found in BCM6328 S=
oCs.
> >>>>
> >>>> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> >>>> Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
> >>>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> >>>> ---
> >>>> v6: add changes suggested by Rob Herring
> >>>> v5: change Documentation to dt-bindings in commit title
> >>>> v4: no changes
> >>>> v3: add new gpio node
> >>>> v2: remove interrupts
> >>>>
> >>>> .../pinctrl/brcm,bcm6328-pinctrl.yaml         | 174 ++++++++++++++++=
++
> >>>> 1 file changed, 174 insertions(+)
> >>>> create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bc=
m6328-pinctrl.yaml
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-=
pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinct=
rl.yaml
> >>>> new file mode 100644
> >>>> index 000000000000..471f6efa1754
> >>>> --- /dev/null
> >>>> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl=
.yaml
> >>>> @@ -0,0 +1,174 @@
> >>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> >>>> +%YAML 1.2
> >>>> +---
> >>>> +$id: http://devicetree.org/schemas/pinctrl/brcm,bcm6328-pinctrl.yam=
l#
> >>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>> +
> >>>> +title: Broadcom BCM6328 pin controller
> >>>> +
> >>>> +maintainers:
> >>>> +  - =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> >>>> +  - Jonas Gorski <jonas.gorski@gmail.com>
> >>>> +
> >>>> +description: |+
> >>>> +  The pin controller node should be the child of a syscon node.
> >>>> +
> >>>> +  Refer to the the bindings described in
> >>>> +  Documentation/devicetree/bindings/mfd/syscon.yaml
> >>>> +
> >>>> +properties:
> >>>> +  compatible:
> >>>> +    const: brcm,bcm6328-pinctrl
> >>>> +
> >>>> +  gpio:
> >>>> +    type: object
> >>>> +    properties:
> >>>> +      compatible:
> >>>> +        const: brcm,bcm6328-gpio
> >>>> +
> >>>> +      data:
> >>>> +        $ref: /schemas/types.yaml#/definitions/uint32
> >>>> +        description: |
> >>>> +          Offset in the register map for the data register (in byte=
s).
> >>>> +
> >>>> +      dirout:
> >>>> +        $ref: /schemas/types.yaml#/definitions/uint32
> >>>> +        description: |
> >>>> +          Offset in the register map for the dirout register (in by=
tes).
> >>>> +
> >>>> +      gpio-controller: true
> >>>> +
> >>>> +      "#gpio-cells":
> >>>> +        const: 2
> >>>> +
> >>>> +      gpio-ranges:
> >>>> +        maxItems: 1
> >>>> +
> >>>> +    required:
> >>>> +      - gpio-controller
> >>>> +      - gpio-ranges
> >>>> +      - '#gpio-cells'
> >>>> +
> >>>> +    additionalProperties: false
> >>>> +
> >>>> +patternProperties:
> >>>> +  '^.*-pins$':
> >>>> +    if:
> >>>> +      type: object
> >>>> +    then:
> >>>> +      properties:
> >>>> +        function:
> >>>> +          $ref: "pinmux-node.yaml#/properties/function"
> >>>> +          enum: [ serial_led_data, serial_led_clk, inet_act_led, pc=
ie_clkreq,
> >>>> +                  led, ephy0_act_led, ephy1_act_led, ephy2_act_led,
> >>>> +                  ephy3_act_led, hsspi_cs1, usb_device_port, usb_ho=
st_port ]
> >>>> +
> >>>> +        pins:
> >>>> +          $ref: "pinmux-node.yaml#/properties/pins"
> >>>> +          enum: [ gpio6, gpio7, gpio11, gpio16, gpio17, gpio18, gpi=
o19,
> >>>> +                  gpio20, gpio25, gpio26, gpio27, gpio28, hsspi_cs1=
,
> >>>> +                  usb_port1 ]
> >>>> +
> >>>> +required:
> >>>> +  - compatible
> >>>> +  - gpio
> >>>> +
> >>>> +additionalProperties: false
> >>>> +
> >>>> +examples:
> >>>> +  - |
> >>>> +    gpio_cntl@10000080 {
> >>>> +      compatible =3D "brcm,bcm6328-gpio-controller", "syscon", "sim=
ple-mfd";
> >>>
> >>> You just added "brcm,bcm6328-gpio-controller", it would need to be do=
cumented.
> >>
> >> I just added that because you requested me to do it =C2=AF\_(=E3=83=84=
)_/=C2=AF
> >
> > I said 'syscon' by itself was not allowed, then asked about the multipl=
e levels.
>
> Why not?

Because 'syscon' alone doesn't mean anything and doesn't describe what
registers it contains. You need something that says this is the XYZ
block in the ABC SoC.

> What if you have several controllers inside a syscon?

You either just add properties (e.g. just add #clock-cells and it's a
clock provider) or you have child nodes. Which one you do generally
depends on if the providers have DT resources themselves.

> The root should also have =E2=80=9Csomething" in it?
>
> >
> >> What should I do to document it?
> >> I still don=E2=80=99t get most of this .yaml stuff...
> >>
> >>>
> >>>> +      reg =3D <0x10000080 0x80>;
> >>>> +
> >>>> +      pinctrl: pinctrl {
> >>>> +        compatible =3D "brcm,bcm6328-pinctrl";
> >>>> +
> >>>> +        gpio {
> >>>> +          compatible =3D "brcm,bcm6328-gpio";
> >>>
> >>> I'm still trying to understand why you need 3 levels of nodes here?
> >>> The gpio controller contains a pin controller plus other undefined
> >>> functions (because of 'syscon') and the pin controller contains a gpi=
o
> >>> controller?
> >>
> >> In previous versions the gpio controller was registered along with the=
 pin controller, but @Linus requested me to register the gpio pin controlle=
r ranges through device tree by using gpio-ranges and I decided to use this=
 approach, which was already used by other pin controllers.
> >> However, there aren=E2=80=99t any pinctrl drivers using gpio-regmap, s=
o this is kind of new=E2=80=A6
> >>
> >>>
> >>> I think "brcm,bcm6328-gpio-controller" and "brcm,bcm6328-pinctrl"
> >>> should be a single node.
> >>
> >> I agree, but does it make sense to add gpio-ranges to a pinctrl node r=
eferencing itself?
> >
> > It wouldn't be. I wasn't saying the pinctrl and gpio controller are
> > the same node. My suggestion was combining syscon and pinctrl.
>
> But that wouldn=E2=80=99t be correct if there were more =E2=80=9Cthings=
=E2=80=9D inside the syscon, right?

Right.

> >> Something like:
> >> syscon {
> >
> > Again with the syscon. If pinctrl and GPIO are the only functions
> > within this h/w block, then this is not a syscon. You are just abusing
> > that having 'syscon' compatible means you get a regmap created
> > automagically for you. Nothing here looks like a 'system controller'
> > to me. A 'system controller' is a random collection of register bits
> > with functions that don't fit anywhere else.
>
> pinctrl and GPIO aren=E2=80=99t the only functions within this HW block.
> Maybe I didn=E2=80=99t document/code it properly, but I=E2=80=99m sure I=
=E2=80=99m not abusing what a system controller is.

Okay, that's the detail missing from this patch.

> Please, take a look at http://www.datashed.science/misc/bcm/gpl/broadcom-=
sdk-416L05/shared/opensource/include/bcm963xx/6328_map_part.h:
> typedef struct GpioControl {
>     uint32      GPIODirHi;                  /* 0 */
>     uint32      GPIODir;                    /* 4 */
>     uint32      GPIOioHi;                   /* 8 */
>     uint32      GPIOio;                     /* C */
>     uint32      unused0;                    /* 10 */
>     uint32      SpiSlaveCfg;                /* 14 */
>     uint32      GPIOMode;                   /* 18 */
>     uint64      PinMuxSel;                  /* 1C */
>     uint32      PinMuxSelOther;             /* 24 */
>     uint32      TestControl;                /* 28 */
>     uint32      unused2;                    /* 2C */
>     uint32      RoboSWLEDControl;           /* 30 */
>     uint32      RoboSWLEDLSR;               /* 34 */
>     uint32      unused3;                    /* 38 */
>     uint32      RoboswEphyCtrl;             /* 3C */
>     uint32      RoboswSwitchCtrl;           /* 40 */
>     uint32      RegFileTmCtl;               /* 44 */
>     uint32      RingOscCtrl0;               /* 48 */
>     uint32      RingOscCtrl1;               /* 4C */
>     uint32      unused4[6];                 /* 50 - 64 */
>     uint32      DieRevID;                   /* 68 */
>     uint32      unused5;                    /* 6c */
>     uint32      DiagSelControl;             /* 70 */
>     uint32      DiagReadBack;               /* 74 */
>     uint32      DiagReadBackHi;             /* 78 */
>     uint32      DiagMiscControl;            /* 7c */
> } GpioControl;
>
> So we=E2=80=99re using GPIODirHi, GPIODir, GPIOioHi and GPIOio registers =
for GPIO regmap driver.
> And we=E2=80=99re using GPIOMode, PinMuxSel (u64 -> x2 u32), PinMuxSelOth=
er for pinctrl driver.
> And this is for BCM6328, but some of the other SoCs are even more scatter=
ed.

So based on this I'd do something like this:

syscon {
  reg =3D <base 0x80>;
  ranges =3D <0 base 0x80>;
  pinctrl@18 {
    reg =3D <0x18 0x10>;
    foo-pins {};
  gpio@0 {
    reg =3D <0x0 0x10>;
  };
};

If things are more scattered within gpio or pinctrl, then maybe you
need multiple reg entries. Whether the OS uses 'reg' and mmio or a
regmap from the syscon is up to you. That's independent of the
binding.

> >>        pinctrl: pinctrl {
> >>                compatible =E2=80=A6
> >>
> >>                gpio-controller;
> >>                gpio-ranges =3D <&pinctrl 0 0 32>;
> >>                #gpio-cells =3D <2>;
> >
> > I was assuming you have multiple GPIO controllers within 1 pinctlr?
> > The pinctrl and gpio could be a single node like above if there's only
> > 1 GPIO controller. But I'm still somewhat guessing what the h/w looks
> > like because I have to go searching thru the driver to decipher.
> > Please describe the h/w in the binding.
>
> GPIO dirout and data rely on 2x u32 registers or a single u64 register.
> This is can be either be implemented as a single GPIO controller, or as 2=
 separate GPIO controllers.
> However, since I=E2=80=99m overriding reg_mask_xlate with bcm63xx_reg_mas=
k_xlate I can register it as a single GPIO controller, which makes more sen=
se to me.

I think 1 makes more sense.

Rob
