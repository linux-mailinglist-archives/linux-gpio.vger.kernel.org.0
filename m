Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6FE5F337C38
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Mar 2021 19:15:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229607AbhCKSOq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Mar 2021 13:14:46 -0500
Received: from mail.kernel.org ([198.145.29.99]:57740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229879AbhCKSOg (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 11 Mar 2021 13:14:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id EDA3364F94;
        Thu, 11 Mar 2021 18:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615486476;
        bh=fnIyaQSNSoS5csMa3BqRS4kNBN6Oc82Gp2xlTe9yhpQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=nB1BW14la14ND5S/yHHExVO3B8QRx8fyJVhLXG5rSSU3HSnkKfhbO5OVYt9phXzA6
         T5ihQHxzII6ih99A4StvvCO0qZzeFLMwxfLs9YOqsYe4v1Rg4PVWC3BGLO9UgORE5o
         2Ud1Ku/zHioPZesaqmJLO2Y0923L9ETxeEi7BB8qyhxUDh+LuCP+9LCVNP0g6/gzx6
         4BcoC+7+4dm7Nxna7AmmFIh+XtnFNBQkw3kxW9G3IMvMAQTpC69yWltpy9J7svID1V
         mG0NDFBonrF8so2vqN9LOIDiZmGlQaKDUYf3jSLP8H57WKiGZJL+ffFI8WFgRPpOmu
         dFzMo3oqNgWBQ==
Received: by mail-ej1-f47.google.com with SMTP id bm21so48180026ejb.4;
        Thu, 11 Mar 2021 10:14:35 -0800 (PST)
X-Gm-Message-State: AOAM532JBEojB1qjRCBX0PCwqyMK2iuvsC4E3Mv4iYBC1ja84d7ZX/f/
        2U+FhuRFhYO+MgttraEEIZW/KA8i2XohON4PSA==
X-Google-Smtp-Source: ABdhPJyOfoYxH4s2woXBe0Yc7wIiStzEQU9+kXsEdSGUYwlvOlzK0j1k2O9+0XwF6mSx9s8tvMvgpIxucUIbli3918I=
X-Received: by 2002:a17:906:1d44:: with SMTP id o4mr4042865ejh.130.1615486474307;
 Thu, 11 Mar 2021 10:14:34 -0800 (PST)
MIME-Version: 1.0
References: <20210310125504.31886-1-noltari@gmail.com> <20210310125504.31886-5-noltari@gmail.com>
 <CAL_JsqK4b+U7cVb04+moB4biGVFC4mr3VGx70KdQKitiCGdtnQ@mail.gmail.com>
 <A2B4813E-4177-4969-9119-A40B39A36948@gmail.com> <CAL_JsqL+CwnhKY4bijnp7eGfYLwRpDUK+iFharVW=DWipsvZbg@mail.gmail.com>
 <693A763C-14D1-47A2-A87E-2358E69DC993@gmail.com> <CAL_JsqJzDj6bKwEfWzoa_m8HjP2VbZH21wYXXEUUEmLwHjrY_A@mail.gmail.com>
 <90994df6-9d7d-686f-8668-a1cf5267aa16@gmail.com>
In-Reply-To: <90994df6-9d7d-686f-8668-a1cf5267aa16@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Thu, 11 Mar 2021 11:14:20 -0700
X-Gmail-Original-Message-ID: <CAL_JsqK_00BQ4DkO8KUF1+TzxwCfU-=9tck7gdFL3Fh6mktHMg@mail.gmail.com>
Message-ID: <CAL_JsqK_00BQ4DkO8KUF1+TzxwCfU-=9tck7gdFL3Fh6mktHMg@mail.gmail.com>
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

On Thu, Mar 11, 2021 at 10:09 AM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:
>
> Hi Rob,
>
> El 10/03/2021 a las 21:52, Rob Herring escribi=C3=B3:
> > On Wed, Mar 10, 2021 at 12:10 PM =C3=81lvaro Fern=C3=A1ndez Rojas
> > <noltari@gmail.com> wrote:
> >>
> >> Hi Rob,
> >>
> >>> El 10 mar 2021, a las 19:45, Rob Herring <robh+dt@kernel.org> escribi=
=C3=B3:
> >>>
> >>> On Wed, Mar 10, 2021 at 11:03 AM =C3=81lvaro Fern=C3=A1ndez Rojas
> >>> <noltari@gmail.com> wrote:
> >>>>
> >>>> Hi Rob,
> >>>>
> >>>>> El 10 mar 2021, a las 18:45, Rob Herring <robh+dt@kernel.org> escri=
bi=C3=B3:
> >>>>>
> >>>>> On Wed, Mar 10, 2021 at 5:55 AM =C3=81lvaro Fern=C3=A1ndez Rojas
> >>>>> <noltari@gmail.com> wrote:
> >>>>>>
> >>>>>> Add binding documentation for the pincontrol core found in BCM6328=
 SoCs.
> >>>>>>
> >>>>>> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> >>>>>> Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
> >>>>>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com=
>
> >>>>>> ---
> >>>>>> v6: add changes suggested by Rob Herring
> >>>>>> v5: change Documentation to dt-bindings in commit title
> >>>>>> v4: no changes
> >>>>>> v3: add new gpio node
> >>>>>> v2: remove interrupts
> >>>>>>
> >>>>>> .../pinctrl/brcm,bcm6328-pinctrl.yaml         | 174 ++++++++++++++=
++++
> >>>>>> 1 file changed, 174 insertions(+)
> >>>>>> create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,=
bcm6328-pinctrl.yaml
> >>>>>>
> >>>>>> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm632=
8-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pin=
ctrl.yaml
> >>>>>> new file mode 100644
> >>>>>> index 000000000000..471f6efa1754
> >>>>>> --- /dev/null
> >>>>>> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinct=
rl.yaml
> >>>>>> @@ -0,0 +1,174 @@
> >>>>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> >>>>>> +%YAML 1.2
> >>>>>> +---
> >>>>>> +$id: http://devicetree.org/schemas/pinctrl/brcm,bcm6328-pinctrl.y=
aml#
> >>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>>>> +
> >>>>>> +title: Broadcom BCM6328 pin controller
> >>>>>> +
> >>>>>> +maintainers:
> >>>>>> +  - =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> >>>>>> +  - Jonas Gorski <jonas.gorski@gmail.com>
> >>>>>> +
> >>>>>> +description: |+
> >>>>>> +  The pin controller node should be the child of a syscon node.
> >>>>>> +
> >>>>>> +  Refer to the the bindings described in
> >>>>>> +  Documentation/devicetree/bindings/mfd/syscon.yaml
> >>>>>> +
> >>>>>> +properties:
> >>>>>> +  compatible:
> >>>>>> +    const: brcm,bcm6328-pinctrl
> >>>>>> +
> >>>>>> +  gpio:
> >>>>>> +    type: object
> >>>>>> +    properties:
> >>>>>> +      compatible:
> >>>>>> +        const: brcm,bcm6328-gpio
> >>>>>> +
> >>>>>> +      data:
> >>>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
> >>>>>> +        description: |
> >>>>>> +          Offset in the register map for the data register (in by=
tes).
> >>>>>> +
> >>>>>> +      dirout:
> >>>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
> >>>>>> +        description: |
> >>>>>> +          Offset in the register map for the dirout register (in =
bytes).
> >>>>>> +
> >>>>>> +      gpio-controller: true
> >>>>>> +
> >>>>>> +      "#gpio-cells":
> >>>>>> +        const: 2
> >>>>>> +
> >>>>>> +      gpio-ranges:
> >>>>>> +        maxItems: 1
> >>>>>> +
> >>>>>> +    required:
> >>>>>> +      - gpio-controller
> >>>>>> +      - gpio-ranges
> >>>>>> +      - '#gpio-cells'
> >>>>>> +
> >>>>>> +    additionalProperties: false
> >>>>>> +
> >>>>>> +patternProperties:
> >>>>>> +  '^.*-pins$':
> >>>>>> +    if:
> >>>>>> +      type: object
> >>>>>> +    then:
> >>>>>> +      properties:
> >>>>>> +        function:
> >>>>>> +          $ref: "pinmux-node.yaml#/properties/function"
> >>>>>> +          enum: [ serial_led_data, serial_led_clk, inet_act_led, =
pcie_clkreq,
> >>>>>> +                  led, ephy0_act_led, ephy1_act_led, ephy2_act_le=
d,
> >>>>>> +                  ephy3_act_led, hsspi_cs1, usb_device_port, usb_=
host_port ]
> >>>>>> +
> >>>>>> +        pins:
> >>>>>> +          $ref: "pinmux-node.yaml#/properties/pins"
> >>>>>> +          enum: [ gpio6, gpio7, gpio11, gpio16, gpio17, gpio18, g=
pio19,
> >>>>>> +                  gpio20, gpio25, gpio26, gpio27, gpio28, hsspi_c=
s1,
> >>>>>> +                  usb_port1 ]
> >>>>>> +
> >>>>>> +required:
> >>>>>> +  - compatible
> >>>>>> +  - gpio
> >>>>>> +
> >>>>>> +additionalProperties: false
> >>>>>> +
> >>>>>> +examples:
> >>>>>> +  - |
> >>>>>> +    gpio_cntl@10000080 {
> >>>>>> +      compatible =3D "brcm,bcm6328-gpio-controller", "syscon", "s=
imple-mfd";
> >>>>>
> >>>>> You just added "brcm,bcm6328-gpio-controller", it would need to be =
documented.
> >>>>
> >>>> I just added that because you requested me to do it =C2=AF\_(=E3=83=
=84)_/=C2=AF
> >>>
> >>> I said 'syscon' by itself was not allowed, then asked about the multi=
ple levels.
> >>
> >> Why not?
> >
> > Because 'syscon' alone doesn't mean anything and doesn't describe what
> > registers it contains. You need something that says this is the XYZ
> > block in the ABC SoC.
> >
> >> What if you have several controllers inside a syscon?
> >
> > You either just add properties (e.g. just add #clock-cells and it's a
> > clock provider) or you have child nodes. Which one you do generally
> > depends on if the providers have DT resources themselves.
> >
> >> The root should also have =E2=80=9Csomething" in it?
> >>
> >>>
> >>>> What should I do to document it?
>
> You didn't answer my question about adding documentation...

You have to document it. Whether it's 1 or 3 schema files depends on
where we end up, but the top-level one should reference the others if
it's more than 1 file:

child-node:
  type: object
  $ref: "/schemas/foo/child-node.yaml#"

> An example driver which adds a custom compatible string and doesn't
> document it:
> https://github.com/torvalds/linux/blob/a74e6a014c9d4d4161061f770c9b4f9837=
2ac778/Documentation/devicetree/bindings/clock/sprd%2Csc9863a-clk.yaml#L90

*it Happens.

Those cases are now blocking my adding a check that they are
undocumented. There's no shortage of examples of what not to do.

>
> >>>> I still don=E2=80=99t get most of this .yaml stuff...
> >>>>
> >>>>>
> >>>>>> +      reg =3D <0x10000080 0x80>;
> >>>>>> +
> >>>>>> +      pinctrl: pinctrl {
> >>>>>> +        compatible =3D "brcm,bcm6328-pinctrl";
> >>>>>> +
> >>>>>> +        gpio {
> >>>>>> +          compatible =3D "brcm,bcm6328-gpio";
> >>>>>
> >>>>> I'm still trying to understand why you need 3 levels of nodes here?
> >>>>> The gpio controller contains a pin controller plus other undefined
> >>>>> functions (because of 'syscon') and the pin controller contains a g=
pio
> >>>>> controller?
> >>>>
> >>>> In previous versions the gpio controller was registered along with t=
he pin controller, but @Linus requested me to register the gpio pin control=
ler ranges through device tree by using gpio-ranges and I decided to use th=
is approach, which was already used by other pin controllers.
> >>>> However, there aren=E2=80=99t any pinctrl drivers using gpio-regmap,=
 so this is kind of new=E2=80=A6
> >>>>
> >>>>>
> >>>>> I think "brcm,bcm6328-gpio-controller" and "brcm,bcm6328-pinctrl"
> >>>>> should be a single node.
> >>>>
> >>>> I agree, but does it make sense to add gpio-ranges to a pinctrl node=
 referencing itself?
> >>>
> >>> It wouldn't be. I wasn't saying the pinctrl and gpio controller are
> >>> the same node. My suggestion was combining syscon and pinctrl.
> >>
> >> But that wouldn=E2=80=99t be correct if there were more =E2=80=9Cthing=
s=E2=80=9D inside the syscon, right?
> >
> > Right.
> >
> >>>> Something like:
> >>>> syscon {
> >>>
> >>> Again with the syscon. If pinctrl and GPIO are the only functions
> >>> within this h/w block, then this is not a syscon. You are just abusin=
g
> >>> that having 'syscon' compatible means you get a regmap created
> >>> automagically for you. Nothing here looks like a 'system controller'
> >>> to me. A 'system controller' is a random collection of register bits
> >>> with functions that don't fit anywhere else.
> >>
> >> pinctrl and GPIO aren=E2=80=99t the only functions within this HW bloc=
k.
> >> Maybe I didn=E2=80=99t document/code it properly, but I=E2=80=99m sure=
 I=E2=80=99m not abusing what a system controller is.
> >
> > Okay, that's the detail missing from this patch.
> >
> >> Please, take a look at http://www.datashed.science/misc/bcm/gpl/broadc=
om-sdk-416L05/shared/opensource/include/bcm963xx/6328_map_part.h:
> >> typedef struct GpioControl {
> >>      uint32      GPIODirHi;                  /* 0 */
> >>      uint32      GPIODir;                    /* 4 */
> >>      uint32      GPIOioHi;                   /* 8 */
> >>      uint32      GPIOio;                     /* C */
> >>      uint32      unused0;                    /* 10 */
> >>      uint32      SpiSlaveCfg;                /* 14 */
> >>      uint32      GPIOMode;                   /* 18 */
> >>      uint64      PinMuxSel;                  /* 1C */
> >>      uint32      PinMuxSelOther;             /* 24 */
> >>      uint32      TestControl;                /* 28 */
> >>      uint32      unused2;                    /* 2C */
> >>      uint32      RoboSWLEDControl;           /* 30 */
> >>      uint32      RoboSWLEDLSR;               /* 34 */
> >>      uint32      unused3;                    /* 38 */
> >>      uint32      RoboswEphyCtrl;             /* 3C */
> >>      uint32      RoboswSwitchCtrl;           /* 40 */
> >>      uint32      RegFileTmCtl;               /* 44 */
> >>      uint32      RingOscCtrl0;               /* 48 */
> >>      uint32      RingOscCtrl1;               /* 4C */
> >>      uint32      unused4[6];                 /* 50 - 64 */
> >>      uint32      DieRevID;                   /* 68 */
> >>      uint32      unused5;                    /* 6c */
> >>      uint32      DiagSelControl;             /* 70 */
> >>      uint32      DiagReadBack;               /* 74 */
> >>      uint32      DiagReadBackHi;             /* 78 */
> >>      uint32      DiagMiscControl;            /* 7c */
> >> } GpioControl;
> >>
> >> So we=E2=80=99re using GPIODirHi, GPIODir, GPIOioHi and GPIOio registe=
rs for GPIO regmap driver.
> >> And we=E2=80=99re using GPIOMode, PinMuxSel (u64 -> x2 u32), PinMuxSel=
Other for pinctrl driver.
> >> And this is for BCM6328, but some of the other SoCs are even more scat=
tered.
> >
> > So based on this I'd do something like this:
> >
> > syscon {
> >    reg =3D <base 0x80>;
> >    ranges =3D <0 base 0x80>;
> >    pinctrl@18 {
> >      reg =3D <0x18 0x10>;
> >      foo-pins {};
> >    gpio@0 {
> >      reg =3D <0x0 0x10>;
> >    };
> > };
>
> You're missing a "};", so I'm not sure if you want me to go this way (1):
> syscon {
>         compatible =3D "brcm,bcm6328-gpio-regs", "syscon", "simple-mfd";
>         reg =3D <0x10000080 0x80>;
>         ranges =3D <0 0x10000080 0x80>;
>
>         gpio: gpio@0 {
>                 compatible =3D "brcm,bcm6328-gpio";
>                 reg =3D <0x0 0x10>;
>
>                 data =3D <0xc>;
>                 dirout =3D <0x4>;
>
>                 gpio-controller;
>                 gpio-ranges =3D <&pinctrl 0 0 32>;
>                 #gpio-cells =3D <2>;
>         };
>
>         pinctrl: pinctrl@18 {
>                 compatible =3D "brcm,bcm6328-pinctrl";
>                 reg =3D <0x18 0x10>;
>
>                 foo-pins {};
>                 ...
>         };
> };

This way.

>
> Or this way (2):
> syscon {
>         compatible =3D "brcm,bcm6328-gpio-regs", "syscon", "simple-mfd";
>         reg =3D <0x10000080 0x80>;
>         ranges =3D <0 0x10000080 0x80>;
>
>         pinctrl: pinctrl@18 {
>                 compatible =3D "brcm,bcm6328-pinctrl";
>                 reg =3D <0x0 0x28>;
>
>                 gpio: gpio@0 {

This doesn't make sense IMO because GPIO is not a sub-function of the
pinctrl h/w. They are peers.

>                         compatible =3D "brcm,bcm6328-gpio";
>                         reg =3D <0x0 0x10>;
>
>                         data =3D <0xc>;
>                         dirout =3D <0x4>;
>
>                         gpio-controller;
>                         gpio-ranges =3D <&pinctrl 0 0 32>;
>                         #gpio-cells =3D <2>;
>                 };
>
>                 foo-pins {};
>                 ...
>         };
> };
