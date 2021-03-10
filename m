Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 703B9334799
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 20:11:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbhCJTLO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 14:11:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229602AbhCJTKq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 14:10:46 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 429F0C061760;
        Wed, 10 Mar 2021 11:10:46 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id n11-20020a05600c4f8bb029010e5cf86347so1976340wmq.1;
        Wed, 10 Mar 2021 11:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=o1PtTj0jTygETOJQurlZYvimS4mpT02e9HfelDegbgs=;
        b=a3RDFyFi2udhYrJIIXhK3T/FvKNEQCyfmKX8q+V18LU8RJzrfQn8xyjcBz+aEsNm2D
         k8V0Do5QlQNz2KvQgki6l3OLYLiVg9H+B58RF5lLzXHz+ZcEGWcbYyfuQ4bu1BlOAz1N
         ZDG8deN6U2IyyaO01YV+867H6/6s7REDL2WtC5Xz9iRiEk0Hczl4S/YxLpK9RQAvqP9t
         cJL1Z2YJdTf0jzflnqWn/4JT5AkR3nVhRcssNB73P9ZMXXodhle89d6kMiKpJsI9vPiY
         tbrMQPeBL7GkEvmAnQ+l6R/3bKB0ZCXTMBn/1x6T8q5ZY2LEzM9cNfXl4dQ2tocU41ZF
         fTDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=o1PtTj0jTygETOJQurlZYvimS4mpT02e9HfelDegbgs=;
        b=oQ0zwMg2o2ycNGyoNo+IZ93aHN00RyV5UtOuaxGGNp7rzhk0COKxr+RviS7dcQiBhp
         aoQBsKeHMD05ploC64tx54TnZqLXuH1mUvoM36KJpulia+R9qYD0Vxp1YTwCLRh3Txxy
         4FU/nv3U3YCoHpBRhUaASDTZTe+/zoCc9ARhQie8MkVmLiCguhzyNeD07WzERJIY2IuA
         p+RkBoVhRjI8NnCKyrWrcCr1AtsNwww9bTwy+WSy/Q/bIGJxzvNViOzIajQr7g/aUfLk
         ymVaL4V+K7Gd0p8KgFUTaZiojisNyupuAi+J7qc3cqVRixtS88XQkLLcM/BIQzNXe+nv
         rkAA==
X-Gm-Message-State: AOAM532RMlkrJ3kEY6f82E5FoFLVb1BKXbCvCg6xGSv+YeewseELjBDu
        H104kB42TMn/WtpRIFeh9kQ=
X-Google-Smtp-Source: ABdhPJy/aEjch8DBUfBwszxxo93GurtEUYs63eFZOJtB8oIgHEt5ZKAWbsJtHXy8jnDOVEUaPg39pw==
X-Received: by 2002:a05:600c:4a18:: with SMTP id c24mr4562243wmp.173.1615403444844;
        Wed, 10 Mar 2021 11:10:44 -0800 (PST)
Received: from macbook-pro-alvaro.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id o188sm370874wme.7.2021.03.10.11.10.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Mar 2021 11:10:44 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v6 04/15] dt-bindings: add BCM6328 pincontroller binding
 documentation
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <CAL_JsqL+CwnhKY4bijnp7eGfYLwRpDUK+iFharVW=DWipsvZbg@mail.gmail.com>
Date:   Wed, 10 Mar 2021 20:10:43 +0100
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
Content-Transfer-Encoding: quoted-printable
Message-Id: <693A763C-14D1-47A2-A87E-2358E69DC993@gmail.com>
References: <20210310125504.31886-1-noltari@gmail.com>
 <20210310125504.31886-5-noltari@gmail.com>
 <CAL_JsqK4b+U7cVb04+moB4biGVFC4mr3VGx70KdQKitiCGdtnQ@mail.gmail.com>
 <A2B4813E-4177-4969-9119-A40B39A36948@gmail.com>
 <CAL_JsqL+CwnhKY4bijnp7eGfYLwRpDUK+iFharVW=DWipsvZbg@mail.gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

> El 10 mar 2021, a las 19:45, Rob Herring <robh+dt@kernel.org> =
escribi=C3=B3:
>=20
> On Wed, Mar 10, 2021 at 11:03 AM =C3=81lvaro Fern=C3=A1ndez Rojas
> <noltari@gmail.com> wrote:
>>=20
>> Hi Rob,
>>=20
>>> El 10 mar 2021, a las 18:45, Rob Herring <robh+dt@kernel.org> =
escribi=C3=B3:
>>>=20
>>> On Wed, Mar 10, 2021 at 5:55 AM =C3=81lvaro Fern=C3=A1ndez Rojas
>>> <noltari@gmail.com> wrote:
>>>>=20
>>>> Add binding documentation for the pincontrol core found in BCM6328 =
SoCs.
>>>>=20
>>>> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
>>>> Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
>>>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>>>> ---
>>>> v6: add changes suggested by Rob Herring
>>>> v5: change Documentation to dt-bindings in commit title
>>>> v4: no changes
>>>> v3: add new gpio node
>>>> v2: remove interrupts
>>>>=20
>>>> .../pinctrl/brcm,bcm6328-pinctrl.yaml         | 174 =
++++++++++++++++++
>>>> 1 file changed, 174 insertions(+)
>>>> create mode 100644 =
Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
>>>>=20
>>>> diff --git =
a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml =
b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
>>>> new file mode 100644
>>>> index 000000000000..471f6efa1754
>>>> --- /dev/null
>>>> +++ =
b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
>>>> @@ -0,0 +1,174 @@
>>>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: =
http://devicetree.org/schemas/pinctrl/brcm,bcm6328-pinctrl.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Broadcom BCM6328 pin controller
>>>> +
>>>> +maintainers:
>>>> +  - =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>>>> +  - Jonas Gorski <jonas.gorski@gmail.com>
>>>> +
>>>> +description: |+
>>>> +  The pin controller node should be the child of a syscon node.
>>>> +
>>>> +  Refer to the the bindings described in
>>>> +  Documentation/devicetree/bindings/mfd/syscon.yaml
>>>> +
>>>> +properties:
>>>> +  compatible:
>>>> +    const: brcm,bcm6328-pinctrl
>>>> +
>>>> +  gpio:
>>>> +    type: object
>>>> +    properties:
>>>> +      compatible:
>>>> +        const: brcm,bcm6328-gpio
>>>> +
>>>> +      data:
>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>>> +        description: |
>>>> +          Offset in the register map for the data register (in =
bytes).
>>>> +
>>>> +      dirout:
>>>> +        $ref: /schemas/types.yaml#/definitions/uint32
>>>> +        description: |
>>>> +          Offset in the register map for the dirout register (in =
bytes).
>>>> +
>>>> +      gpio-controller: true
>>>> +
>>>> +      "#gpio-cells":
>>>> +        const: 2
>>>> +
>>>> +      gpio-ranges:
>>>> +        maxItems: 1
>>>> +
>>>> +    required:
>>>> +      - gpio-controller
>>>> +      - gpio-ranges
>>>> +      - '#gpio-cells'
>>>> +
>>>> +    additionalProperties: false
>>>> +
>>>> +patternProperties:
>>>> +  '^.*-pins$':
>>>> +    if:
>>>> +      type: object
>>>> +    then:
>>>> +      properties:
>>>> +        function:
>>>> +          $ref: "pinmux-node.yaml#/properties/function"
>>>> +          enum: [ serial_led_data, serial_led_clk, inet_act_led, =
pcie_clkreq,
>>>> +                  led, ephy0_act_led, ephy1_act_led, =
ephy2_act_led,
>>>> +                  ephy3_act_led, hsspi_cs1, usb_device_port, =
usb_host_port ]
>>>> +
>>>> +        pins:
>>>> +          $ref: "pinmux-node.yaml#/properties/pins"
>>>> +          enum: [ gpio6, gpio7, gpio11, gpio16, gpio17, gpio18, =
gpio19,
>>>> +                  gpio20, gpio25, gpio26, gpio27, gpio28, =
hsspi_cs1,
>>>> +                  usb_port1 ]
>>>> +
>>>> +required:
>>>> +  - compatible
>>>> +  - gpio
>>>> +
>>>> +additionalProperties: false
>>>> +
>>>> +examples:
>>>> +  - |
>>>> +    gpio_cntl@10000080 {
>>>> +      compatible =3D "brcm,bcm6328-gpio-controller", "syscon", =
"simple-mfd";
>>>=20
>>> You just added "brcm,bcm6328-gpio-controller", it would need to be =
documented.
>>=20
>> I just added that because you requested me to do it =C2=AF\_(=E3=83=84)=
_/=C2=AF
>=20
> I said 'syscon' by itself was not allowed, then asked about the =
multiple levels.

Why not?
What if you have several controllers inside a syscon?
The root should also have =E2=80=9Csomething" in it?

>=20
>> What should I do to document it?
>> I still don=E2=80=99t get most of this .yaml stuff...
>>=20
>>>=20
>>>> +      reg =3D <0x10000080 0x80>;
>>>> +
>>>> +      pinctrl: pinctrl {
>>>> +        compatible =3D "brcm,bcm6328-pinctrl";
>>>> +
>>>> +        gpio {
>>>> +          compatible =3D "brcm,bcm6328-gpio";
>>>=20
>>> I'm still trying to understand why you need 3 levels of nodes here?
>>> The gpio controller contains a pin controller plus other undefined
>>> functions (because of 'syscon') and the pin controller contains a =
gpio
>>> controller?
>>=20
>> In previous versions the gpio controller was registered along with =
the pin controller, but @Linus requested me to register the gpio pin =
controller ranges through device tree by using gpio-ranges and I decided =
to use this approach, which was already used by other pin controllers.
>> However, there aren=E2=80=99t any pinctrl drivers using gpio-regmap, =
so this is kind of new=E2=80=A6
>>=20
>>>=20
>>> I think "brcm,bcm6328-gpio-controller" and "brcm,bcm6328-pinctrl"
>>> should be a single node.
>>=20
>> I agree, but does it make sense to add gpio-ranges to a pinctrl node =
referencing itself?
>=20
> It wouldn't be. I wasn't saying the pinctrl and gpio controller are
> the same node. My suggestion was combining syscon and pinctrl.

But that wouldn=E2=80=99t be correct if there were more =E2=80=9Cthings=E2=
=80=9D inside the syscon, right?

>=20
>> Something like:
>> syscon {
>=20
> Again with the syscon. If pinctrl and GPIO are the only functions
> within this h/w block, then this is not a syscon. You are just abusing
> that having 'syscon' compatible means you get a regmap created
> automagically for you. Nothing here looks like a 'system controller'
> to me. A 'system controller' is a random collection of register bits
> with functions that don't fit anywhere else.

pinctrl and GPIO aren=E2=80=99t the only functions within this HW block.
Maybe I didn=E2=80=99t document/code it properly, but I=E2=80=99m sure =
I=E2=80=99m not abusing what a system controller is.
Please, take a look at =
http://www.datashed.science/misc/bcm/gpl/broadcom-sdk-416L05/shared/openso=
urce/include/bcm963xx/6328_map_part.h:
typedef struct GpioControl {
    uint32      GPIODirHi;                  /* 0 */
    uint32      GPIODir;                    /* 4 */
    uint32      GPIOioHi;                   /* 8 */
    uint32      GPIOio;                     /* C */
    uint32      unused0;                    /* 10 */
    uint32      SpiSlaveCfg;                /* 14 */
    uint32      GPIOMode;                   /* 18 */
    uint64      PinMuxSel;                  /* 1C */
    uint32      PinMuxSelOther;             /* 24 */
    uint32      TestControl;                /* 28 */
    uint32      unused2;                    /* 2C */
    uint32      RoboSWLEDControl;           /* 30 */
    uint32      RoboSWLEDLSR;               /* 34 */
    uint32      unused3;                    /* 38 */
    uint32      RoboswEphyCtrl;             /* 3C */
    uint32      RoboswSwitchCtrl;           /* 40 */
    uint32      RegFileTmCtl;               /* 44 */
    uint32      RingOscCtrl0;               /* 48 */
    uint32      RingOscCtrl1;               /* 4C */
    uint32      unused4[6];                 /* 50 - 64 */
    uint32      DieRevID;                   /* 68 */
    uint32      unused5;                    /* 6c */
    uint32      DiagSelControl;             /* 70 */
    uint32      DiagReadBack;               /* 74 */
    uint32      DiagReadBackHi;             /* 78 */
    uint32      DiagMiscControl;            /* 7c */
} GpioControl;

So we=E2=80=99re using GPIODirHi, GPIODir, GPIOioHi and GPIOio registers =
for GPIO regmap driver.
And we=E2=80=99re using GPIOMode, PinMuxSel (u64 -> x2 u32), =
PinMuxSelOther for pinctrl driver.
And this is for BCM6328, but some of the other SoCs are even more =
scattered.

>=20
>>        pinctrl: pinctrl {
>>                compatible =E2=80=A6
>>=20
>>                gpio-controller;
>>                gpio-ranges =3D <&pinctrl 0 0 32>;
>>                #gpio-cells =3D <2>;
>=20
> I was assuming you have multiple GPIO controllers within 1 pinctlr?
> The pinctrl and gpio could be a single node like above if there's only
> 1 GPIO controller. But I'm still somewhat guessing what the h/w looks
> like because I have to go searching thru the driver to decipher.
> Please describe the h/w in the binding.

GPIO dirout and data rely on 2x u32 registers or a single u64 register.
This is can be either be implemented as a single GPIO controller, or as =
2 separate GPIO controllers.
However, since I=E2=80=99m overriding reg_mask_xlate with =
bcm63xx_reg_mask_xlate I can register it as a single GPIO controller, =
which makes more sense to me.

>=20
> If there's more than 1 GPIO controller, then I'd imagine you have
> something like this:
>=20
> pinctrl {
>  ...
>  reg =3D <base 0x80>;
>  ranges =3D <0 base 0x80;
>  gpio@4 {
>    reg =3D <4 4>, <c 4>;
>    reg-names =3D "dirout", "dat";
>  };
>  gpio@? {};
>=20
>  foo-pins {};
> };
>=20
>>=20
>>                =E2=80=A6
>>        };
>> };
>>=20
>>>=20
>>>> +          data =3D <0xc>;
>>>> +          dirout =3D <0x4>;
>>>=20
>>> This looks similar to the brcm,bcm6345-gpio.txt binding which then
>>> uses the gpio-mmio driver. Defining addresses with 'reg' is much
>>> preferred over custom properties. That binding also captures the =
bank
>>> size.
>>=20
>> It=E2=80=99s similar, but Linus requested to use gpio regmap because =
we had a large amount of registers, so we=E2=80=99re not using it.
>=20
> Looks like you have 2 registers to me.

For the GPIO controller there are 4 registers (data high and low, and =
dirout high and low).
For the pinctrl there are 3 registers (Pinmux high, low and other).

>=20
> Rob

Best regards,
=C3=81lvaro.=
