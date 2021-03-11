Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5992337CC0
	for <lists+linux-gpio@lfdr.de>; Thu, 11 Mar 2021 19:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbhCKSgd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 11 Mar 2021 13:36:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbhCKSfE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 11 Mar 2021 13:35:04 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43349C061574;
        Thu, 11 Mar 2021 10:34:50 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id j4-20020a05600c4104b029010c62bc1e20so13525051wmi.3;
        Thu, 11 Mar 2021 10:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=OgioLDe9FjvkXOXRdpcqwo3XY/TqI3Digf4ZsuY4VOY=;
        b=R39PqM0JuRJxD9DwHGmIjFCZlkzqDZvYIk+GOAxuIdgpox07AA8fq+iT2sdKt6cJCk
         cSSErN1h0Ck8QoqPv/d3/jNIT32Kh7twbMuH6ISfpY+H0VFtqd0ad4RMJsan2WtCEK66
         W1ZO+YX6tyDmP6wOZzBWXfNvo71NpA8l1Eac9C1bQJhw1K1zsQoOXdbgBezSCOM/PxC0
         b0D00m/GDLXv4funEnelEAPnMXDy35Yrgn+39cXyL7GMoUG8ulGF+P1ge1Kodze7oRjb
         uLu9qZtnc+TA2FTyM1CubMDmL5x9jx1z+aBodMRidoUMdoeFah2EJ+JdqbLKdcKVxoBd
         Khyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=OgioLDe9FjvkXOXRdpcqwo3XY/TqI3Digf4ZsuY4VOY=;
        b=WdS5ZGRdBNar7TNanB0OipZ9THa206NUQrdAz9Yb5AotWoJ/W8qgbwjCoIbB2fKhMc
         BnJ2Q/5aX3Ms5YAC254JWcLjvPNIPIGtqGojhQsloiSBr7AKbiQT0oC0lEgBbVLDeQ5S
         mF/09qLi0T7uhe5ovDycpn2cph/n5C3zPt8Cs0k24+cRQMZKQcPXqzjOfkNWlqvaSxA0
         b2xiv48omJtwKPtVtUZ5KFJCPwqygb9p6WMkTAijj9t+uMzwIEZKjYBmgfQVuXbxfJ2P
         UvQ9oFElf+vURvdHgUlf5XDh32DHAt1d0Ep4hm54mBvfOCTpWK8oG6JNucznXjmQJWPJ
         P/+Q==
X-Gm-Message-State: AOAM533i6KS6hpJ5vU/tcVRTKo4UeFP26jR7Z9qCe+RN186zBZ7Pn/7m
        Fz4w+fu5OfYTcxRT1qCM+M8=
X-Google-Smtp-Source: ABdhPJz38GRE4fZICvyVm9wJpTgsfRWJOHwuirF9Im8WicHQksH7LS9wUmdIWYLw3+ptjqTzODS6rA==
X-Received: by 2002:a05:600c:287:: with SMTP id 7mr9948751wmk.23.1615487688852;
        Thu, 11 Mar 2021 10:34:48 -0800 (PST)
Received: from macbook-pro-alvaro.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id w131sm5033850wmb.8.2021.03.11.10.34.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Mar 2021 10:34:48 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v6 04/15] dt-bindings: add BCM6328 pincontroller binding
 documentation
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <CAL_JsqK_00BQ4DkO8KUF1+TzxwCfU-=9tck7gdFL3Fh6mktHMg@mail.gmail.com>
Date:   Thu, 11 Mar 2021 19:34:46 +0100
Cc:     Michael Walle <michael@walle.cc>,
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
Content-Transfer-Encoding: quoted-printable
Message-Id: <3DED7410-5FCB-403D-BFB5-B8694133DADA@gmail.com>
References: <20210310125504.31886-1-noltari@gmail.com>
 <20210310125504.31886-5-noltari@gmail.com>
 <CAL_JsqK4b+U7cVb04+moB4biGVFC4mr3VGx70KdQKitiCGdtnQ@mail.gmail.com>
 <A2B4813E-4177-4969-9119-A40B39A36948@gmail.com>
 <CAL_JsqL+CwnhKY4bijnp7eGfYLwRpDUK+iFharVW=DWipsvZbg@mail.gmail.com>
 <693A763C-14D1-47A2-A87E-2358E69DC993@gmail.com>
 <CAL_JsqJzDj6bKwEfWzoa_m8HjP2VbZH21wYXXEUUEmLwHjrY_A@mail.gmail.com>
 <90994df6-9d7d-686f-8668-a1cf5267aa16@gmail.com>
 <CAL_JsqK_00BQ4DkO8KUF1+TzxwCfU-=9tck7gdFL3Fh6mktHMg@mail.gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

> El 11 mar 2021, a las 19:14, Rob Herring <robh+dt@kernel.org> =
escribi=C3=B3:
>=20
> On Thu, Mar 11, 2021 at 10:09 AM =C3=81lvaro Fern=C3=A1ndez Rojas
> <noltari@gmail.com> wrote:
>>=20
>> Hi Rob,
>>=20
>> El 10/03/2021 a las 21:52, Rob Herring escribi=C3=B3:
>>> On Wed, Mar 10, 2021 at 12:10 PM =C3=81lvaro Fern=C3=A1ndez Rojas
>>> <noltari@gmail.com> wrote:
>>>>=20
>>>> Hi Rob,
>>>>=20
>>>>> El 10 mar 2021, a las 19:45, Rob Herring <robh+dt@kernel.org> =
escribi=C3=B3:
>>>>>=20
>>>>> On Wed, Mar 10, 2021 at 11:03 AM =C3=81lvaro Fern=C3=A1ndez Rojas
>>>>> <noltari@gmail.com> wrote:
>>>>>>=20
>>>>>> Hi Rob,
>>>>>>=20
>>>>>>> El 10 mar 2021, a las 18:45, Rob Herring <robh+dt@kernel.org> =
escribi=C3=B3:
>>>>>>>=20
>>>>>>> On Wed, Mar 10, 2021 at 5:55 AM =C3=81lvaro Fern=C3=A1ndez Rojas
>>>>>>> <noltari@gmail.com> wrote:
>>>>>>>>=20
>>>>>>>> Add binding documentation for the pincontrol core found in =
BCM6328 SoCs.
>>>>>>>>=20
>>>>>>>> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
>>>>>>>> Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
>>>>>>>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas =
<noltari@gmail.com>
>>>>>>>> ---
>>>>>>>> v6: add changes suggested by Rob Herring
>>>>>>>> v5: change Documentation to dt-bindings in commit title
>>>>>>>> v4: no changes
>>>>>>>> v3: add new gpio node
>>>>>>>> v2: remove interrupts
>>>>>>>>=20
>>>>>>>> .../pinctrl/brcm,bcm6328-pinctrl.yaml         | 174 =
++++++++++++++++++
>>>>>>>> 1 file changed, 174 insertions(+)
>>>>>>>> create mode 100644 =
Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
>>>>>>>>=20
>>>>>>>> diff --git =
a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml =
b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
>>>>>>>> new file mode 100644
>>>>>>>> index 000000000000..471f6efa1754
>>>>>>>> --- /dev/null
>>>>>>>> +++ =
b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
>>>>>>>> @@ -0,0 +1,174 @@
>>>>>>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>>>>>>> +%YAML 1.2
>>>>>>>> +---
>>>>>>>> +$id: =
http://devicetree.org/schemas/pinctrl/brcm,bcm6328-pinctrl.yaml#
>>>>>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>>>>>> +
>>>>>>>> +title: Broadcom BCM6328 pin controller
>>>>>>>> +
>>>>>>>> +maintainers:
>>>>>>>> +  - =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>>>>>>>> +  - Jonas Gorski <jonas.gorski@gmail.com>
>>>>>>>> +
>>>>>>>> +description: |+
>>>>>>>> +  The pin controller node should be the child of a syscon =
node.
>>>>>>>> +
>>>>>>>> +  Refer to the the bindings described in
>>>>>>>> +  Documentation/devicetree/bindings/mfd/syscon.yaml
>>>>>>>> +
>>>>>>>> +properties:
>>>>>>>> +  compatible:
>>>>>>>> +    const: brcm,bcm6328-pinctrl
>>>>>>>> +
>>>>>>>> +  gpio:
>>>>>>>> +    type: object
>>>>>>>> +    properties:
>>>>>>>> +      compatible:
>>>>>>>> +        const: brcm,bcm6328-gpio
>>>>>>>> +
>>>>>>>> +      data:
>>>>>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>>>>>>> +        description: |
>>>>>>>> +          Offset in the register map for the data register (in =
bytes).
>>>>>>>> +
>>>>>>>> +      dirout:
>>>>>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>>>>>>> +        description: |
>>>>>>>> +          Offset in the register map for the dirout register =
(in bytes).
>>>>>>>> +
>>>>>>>> +      gpio-controller: true
>>>>>>>> +
>>>>>>>> +      "#gpio-cells":
>>>>>>>> +        const: 2
>>>>>>>> +
>>>>>>>> +      gpio-ranges:
>>>>>>>> +        maxItems: 1
>>>>>>>> +
>>>>>>>> +    required:
>>>>>>>> +      - gpio-controller
>>>>>>>> +      - gpio-ranges
>>>>>>>> +      - '#gpio-cells'
>>>>>>>> +
>>>>>>>> +    additionalProperties: false
>>>>>>>> +
>>>>>>>> +patternProperties:
>>>>>>>> +  '^.*-pins$':
>>>>>>>> +    if:
>>>>>>>> +      type: object
>>>>>>>> +    then:
>>>>>>>> +      properties:
>>>>>>>> +        function:
>>>>>>>> +          $ref: "pinmux-node.yaml#/properties/function"
>>>>>>>> +          enum: [ serial_led_data, serial_led_clk, =
inet_act_led, pcie_clkreq,
>>>>>>>> +                  led, ephy0_act_led, ephy1_act_led, =
ephy2_act_led,
>>>>>>>> +                  ephy3_act_led, hsspi_cs1, usb_device_port, =
usb_host_port ]
>>>>>>>> +
>>>>>>>> +        pins:
>>>>>>>> +          $ref: "pinmux-node.yaml#/properties/pins"
>>>>>>>> +          enum: [ gpio6, gpio7, gpio11, gpio16, gpio17, =
gpio18, gpio19,
>>>>>>>> +                  gpio20, gpio25, gpio26, gpio27, gpio28, =
hsspi_cs1,
>>>>>>>> +                  usb_port1 ]
>>>>>>>> +
>>>>>>>> +required:
>>>>>>>> +  - compatible
>>>>>>>> +  - gpio
>>>>>>>> +
>>>>>>>> +additionalProperties: false
>>>>>>>> +
>>>>>>>> +examples:
>>>>>>>> +  - |
>>>>>>>> +    gpio_cntl@10000080 {
>>>>>>>> +      compatible =3D "brcm,bcm6328-gpio-controller", "syscon", =
"simple-mfd";
>>>>>>>=20
>>>>>>> You just added "brcm,bcm6328-gpio-controller", it would need to =
be documented.
>>>>>>=20
>>>>>> I just added that because you requested me to do it =C2=AF\_(=E3=83=
=84)_/=C2=AF
>>>>>=20
>>>>> I said 'syscon' by itself was not allowed, then asked about the =
multiple levels.
>>>>=20
>>>> Why not?
>>>=20
>>> Because 'syscon' alone doesn't mean anything and doesn't describe =
what
>>> registers it contains. You need something that says this is the XYZ
>>> block in the ABC SoC.
>>>=20
>>>> What if you have several controllers inside a syscon?
>>>=20
>>> You either just add properties (e.g. just add #clock-cells and it's =
a
>>> clock provider) or you have child nodes. Which one you do generally
>>> depends on if the providers have DT resources themselves.
>>>=20
>>>> The root should also have =E2=80=9Csomething" in it?
>>>>=20
>>>>>=20
>>>>>> What should I do to document it?
>>=20
>> You didn't answer my question about adding documentation...
>=20
> You have to document it. Whether it's 1 or 3 schema files depends on
> where we end up, but the top-level one should reference the others if
> it's more than 1 file:
>=20
> child-node:
>  type: object
>  $ref: "/schemas/foo/child-node.yaml#"

Can you give me an example of a driver which is documenting that?
I=E2=80=99m sorry, but I still don=E2=80=99t know how to do it =
properly...

>=20
>> An example driver which adds a custom compatible string and doesn't
>> document it:
>> =
https://github.com/torvalds/linux/blob/a74e6a014c9d4d4161061f770c9b4f98372=
ac778/Documentation/devicetree/bindings/clock/sprd%2Csc9863a-clk.yaml#L90
>=20
> *it Happens.
>=20
> Those cases are now blocking my adding a check that they are
> undocumented. There's no shortage of examples of what not to do.
>=20
>>=20
>>>>>> I still don=E2=80=99t get most of this .yaml stuff...
>>>>>>=20
>>>>>>>=20
>>>>>>>> +      reg =3D <0x10000080 0x80>;
>>>>>>>> +
>>>>>>>> +      pinctrl: pinctrl {
>>>>>>>> +        compatible =3D "brcm,bcm6328-pinctrl";
>>>>>>>> +
>>>>>>>> +        gpio {
>>>>>>>> +          compatible =3D "brcm,bcm6328-gpio";
>>>>>>>=20
>>>>>>> I'm still trying to understand why you need 3 levels of nodes =
here?
>>>>>>> The gpio controller contains a pin controller plus other =
undefined
>>>>>>> functions (because of 'syscon') and the pin controller contains =
a gpio
>>>>>>> controller?
>>>>>>=20
>>>>>> In previous versions the gpio controller was registered along =
with the pin controller, but @Linus requested me to register the gpio =
pin controller ranges through device tree by using gpio-ranges and I =
decided to use this approach, which was already used by other pin =
controllers.
>>>>>> However, there aren=E2=80=99t any pinctrl drivers using =
gpio-regmap, so this is kind of new=E2=80=A6
>>>>>>=20
>>>>>>>=20
>>>>>>> I think "brcm,bcm6328-gpio-controller" and =
"brcm,bcm6328-pinctrl"
>>>>>>> should be a single node.
>>>>>>=20
>>>>>> I agree, but does it make sense to add gpio-ranges to a pinctrl =
node referencing itself?
>>>>>=20
>>>>> It wouldn't be. I wasn't saying the pinctrl and gpio controller =
are
>>>>> the same node. My suggestion was combining syscon and pinctrl.
>>>>=20
>>>> But that wouldn=E2=80=99t be correct if there were more =
=E2=80=9Cthings=E2=80=9D inside the syscon, right?
>>>=20
>>> Right.
>>>=20
>>>>>> Something like:
>>>>>> syscon {
>>>>>=20
>>>>> Again with the syscon. If pinctrl and GPIO are the only functions
>>>>> within this h/w block, then this is not a syscon. You are just =
abusing
>>>>> that having 'syscon' compatible means you get a regmap created
>>>>> automagically for you. Nothing here looks like a 'system =
controller'
>>>>> to me. A 'system controller' is a random collection of register =
bits
>>>>> with functions that don't fit anywhere else.
>>>>=20
>>>> pinctrl and GPIO aren=E2=80=99t the only functions within this HW =
block.
>>>> Maybe I didn=E2=80=99t document/code it properly, but I=E2=80=99m =
sure I=E2=80=99m not abusing what a system controller is.
>>>=20
>>> Okay, that's the detail missing from this patch.
>>>=20
>>>> Please, take a look at =
http://www.datashed.science/misc/bcm/gpl/broadcom-sdk-416L05/shared/openso=
urce/include/bcm963xx/6328_map_part.h:
>>>> typedef struct GpioControl {
>>>>     uint32      GPIODirHi;                  /* 0 */
>>>>     uint32      GPIODir;                    /* 4 */
>>>>     uint32      GPIOioHi;                   /* 8 */
>>>>     uint32      GPIOio;                     /* C */
>>>>     uint32      unused0;                    /* 10 */
>>>>     uint32      SpiSlaveCfg;                /* 14 */
>>>>     uint32      GPIOMode;                   /* 18 */
>>>>     uint64      PinMuxSel;                  /* 1C */
>>>>     uint32      PinMuxSelOther;             /* 24 */
>>>>     uint32      TestControl;                /* 28 */
>>>>     uint32      unused2;                    /* 2C */
>>>>     uint32      RoboSWLEDControl;           /* 30 */
>>>>     uint32      RoboSWLEDLSR;               /* 34 */
>>>>     uint32      unused3;                    /* 38 */
>>>>     uint32      RoboswEphyCtrl;             /* 3C */
>>>>     uint32      RoboswSwitchCtrl;           /* 40 */
>>>>     uint32      RegFileTmCtl;               /* 44 */
>>>>     uint32      RingOscCtrl0;               /* 48 */
>>>>     uint32      RingOscCtrl1;               /* 4C */
>>>>     uint32      unused4[6];                 /* 50 - 64 */
>>>>     uint32      DieRevID;                   /* 68 */
>>>>     uint32      unused5;                    /* 6c */
>>>>     uint32      DiagSelControl;             /* 70 */
>>>>     uint32      DiagReadBack;               /* 74 */
>>>>     uint32      DiagReadBackHi;             /* 78 */
>>>>     uint32      DiagMiscControl;            /* 7c */
>>>> } GpioControl;
>>>>=20
>>>> So we=E2=80=99re using GPIODirHi, GPIODir, GPIOioHi and GPIOio =
registers for GPIO regmap driver.
>>>> And we=E2=80=99re using GPIOMode, PinMuxSel (u64 -> x2 u32), =
PinMuxSelOther for pinctrl driver.
>>>> And this is for BCM6328, but some of the other SoCs are even more =
scattered.
>>>=20
>>> So based on this I'd do something like this:
>>>=20
>>> syscon {
>>>   reg =3D <base 0x80>;
>>>   ranges =3D <0 base 0x80>;
>>>   pinctrl@18 {
>>>     reg =3D <0x18 0x10>;
>>>     foo-pins {};
>>>   gpio@0 {
>>>     reg =3D <0x0 0x10>;
>>>   };
>>> };
>>=20
>> You're missing a "};", so I'm not sure if you want me to go this way =
(1):
>> syscon {
>>        compatible =3D "brcm,bcm6328-gpio-regs", "syscon", =
"simple-mfd";
>>        reg =3D <0x10000080 0x80>;
>>        ranges =3D <0 0x10000080 0x80>;
>>=20
>>        gpio: gpio@0 {
>>                compatible =3D "brcm,bcm6328-gpio";
>>                reg =3D <0x0 0x10>;
>>=20
>>                data =3D <0xc>;
>>                dirout =3D <0x4>;
>>=20
>>                gpio-controller;
>>                gpio-ranges =3D <&pinctrl 0 0 32>;
>>                #gpio-cells =3D <2>;
>>        };
>>=20
>>        pinctrl: pinctrl@18 {
>>                compatible =3D "brcm,bcm6328-pinctrl";
>>                reg =3D <0x18 0x10>;
>>=20
>>                foo-pins {};
>>                ...
>>        };
>> };
>=20
> This way.
>=20
>>=20
>> Or this way (2):
>> syscon {
>>        compatible =3D "brcm,bcm6328-gpio-regs", "syscon", =
"simple-mfd";
>>        reg =3D <0x10000080 0x80>;
>>        ranges =3D <0 0x10000080 0x80>;
>>=20
>>        pinctrl: pinctrl@18 {
>>                compatible =3D "brcm,bcm6328-pinctrl";
>>                reg =3D <0x0 0x28>;
>>=20
>>                gpio: gpio@0 {
>=20
> This doesn't make sense IMO because GPIO is not a sub-function of the
> pinctrl h/w. They are peers.

Well, that=E2=80=99s where @Linus and I disagree...

>=20
>>                        compatible =3D "brcm,bcm6328-gpio";
>>                        reg =3D <0x0 0x10>;
>>=20
>>                        data =3D <0xc>;
>>                        dirout =3D <0x4>;
>>=20
>>                        gpio-controller;
>>                        gpio-ranges =3D <&pinctrl 0 0 32>;
>>                        #gpio-cells =3D <2>;
>>                };
>>=20
>>                foo-pins {};
>>                ...
>>        };
>> };

