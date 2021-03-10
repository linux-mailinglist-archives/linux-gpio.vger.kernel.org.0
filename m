Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE7733463C
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 19:04:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233414AbhCJSDg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 13:03:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233386AbhCJSDZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Mar 2021 13:03:25 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6516C061760;
        Wed, 10 Mar 2021 10:03:24 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id l11so20970051wrp.7;
        Wed, 10 Mar 2021 10:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=E4uiOuXTxitIxLgWp2WTavq5l74uLFIFW+TA7gLmgh0=;
        b=vAcdt2UG52Rwa6LmtIVDNcORbDPb5/bktA2vPvNOncHGSD9cGNgnEbZwAP5Xu7fY+M
         hicTJQfVDdLZZKwbFyerzhxfLINBpsFH3WUK+rqjeFiy+Q46i4vv6BnyqMCdPk3An8tq
         03CNHKkY1U7Pajnv68wIafcxQUygew1vzKREJbLKFaGzP99MuHh59Sg/nKH44A+wtgAC
         YO7f0RvmZzV0OBPqvp2Z1WjK5FunY+Ze3I9kgeVSYK0GH9F15ITJ/8gt9NIWNvtrtviR
         1nazkTAnRDiunZ9b0UEtB6j1H+MKq0e227jETRoJq8dc3lCJkLYafqNdu7fEGSmvpPb4
         0FDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=E4uiOuXTxitIxLgWp2WTavq5l74uLFIFW+TA7gLmgh0=;
        b=mqBllJjXq9VEBK3hIvzh6sfN1GnY5kdgYu8a3UE/O3/2a45Setw3VgmZOsao5QivEa
         dOXpXV2+dBB9PxCxaMQg2HOMVJwMRnJ7LS4YEmhsG7P/6+6/XIF5uuIxqTnI2uyGOuiI
         f6/QBqdyEsHU4gCSkwaGkjjHChHqsVHFmepT+bFyP2dFXKBCgEKRNlHU7vi77DjJvSJ3
         yL1PxKqw/wCHIg6G9n3KMczEICtmFYiEg54u7BmTu4BiklqiTmtt3FVfUPAv/WT6PLtO
         GqFsIoFaY8OGenV8BS3Rcz5AoByuwgr55dS4xQGQMlVnLMjq7dxN00kOw52TpLAk0wCe
         6l/w==
X-Gm-Message-State: AOAM530wCLK7N6481wZX63DuygBRc3YzBtSekIsen6iHpj6IVh7HOdV8
        CQemMr4MoAk1ygcS3QY3ZE0l1J+b1MdB+w==
X-Google-Smtp-Source: ABdhPJwA5IqS/48F81e83HzpaAiXSLgf4skXvAb3hc8mZdCmd61T1U1hWtfOBM7CGr3F8UXM3IdqtA==
X-Received: by 2002:a5d:4ec5:: with SMTP id s5mr4848023wrv.168.1615399403348;
        Wed, 10 Mar 2021 10:03:23 -0800 (PST)
Received: from macbook-pro-alvaro.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id f14sm228413wmf.7.2021.03.10.10.03.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 10 Mar 2021 10:03:22 -0800 (PST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v6 04/15] dt-bindings: add BCM6328 pincontroller binding
 documentation
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <CAL_JsqK4b+U7cVb04+moB4biGVFC4mr3VGx70KdQKitiCGdtnQ@mail.gmail.com>
Date:   Wed, 10 Mar 2021 19:03:20 +0100
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
Message-Id: <A2B4813E-4177-4969-9119-A40B39A36948@gmail.com>
References: <20210310125504.31886-1-noltari@gmail.com>
 <20210310125504.31886-5-noltari@gmail.com>
 <CAL_JsqK4b+U7cVb04+moB4biGVFC4mr3VGx70KdQKitiCGdtnQ@mail.gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

> El 10 mar 2021, a las 18:45, Rob Herring <robh+dt@kernel.org> =
escribi=C3=B3:
>=20
> On Wed, Mar 10, 2021 at 5:55 AM =C3=81lvaro Fern=C3=A1ndez Rojas
> <noltari@gmail.com> wrote:
>>=20
>> Add binding documentation for the pincontrol core found in BCM6328 =
SoCs.
>>=20
>> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
>> Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>> ---
>> v6: add changes suggested by Rob Herring
>> v5: change Documentation to dt-bindings in commit title
>> v4: no changes
>> v3: add new gpio node
>> v2: remove interrupts
>>=20
>> .../pinctrl/brcm,bcm6328-pinctrl.yaml         | 174 =
++++++++++++++++++
>> 1 file changed, 174 insertions(+)
>> create mode 100644 =
Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
>>=20
>> diff --git =
a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml =
b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
>> new file mode 100644
>> index 000000000000..471f6efa1754
>> --- /dev/null
>> +++ =
b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
>> @@ -0,0 +1,174 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: =
http://devicetree.org/schemas/pinctrl/brcm,bcm6328-pinctrl.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Broadcom BCM6328 pin controller
>> +
>> +maintainers:
>> +  - =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>> +  - Jonas Gorski <jonas.gorski@gmail.com>
>> +
>> +description: |+
>> +  The pin controller node should be the child of a syscon node.
>> +
>> +  Refer to the the bindings described in
>> +  Documentation/devicetree/bindings/mfd/syscon.yaml
>> +
>> +properties:
>> +  compatible:
>> +    const: brcm,bcm6328-pinctrl
>> +
>> +  gpio:
>> +    type: object
>> +    properties:
>> +      compatible:
>> +        const: brcm,bcm6328-gpio
>> +
>> +      data:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description: |
>> +          Offset in the register map for the data register (in =
bytes).
>> +
>> +      dirout:
>> +        $ref: /schemas/types.yaml#/definitions/uint32
>> +        description: |
>> +          Offset in the register map for the dirout register (in =
bytes).
>> +
>> +      gpio-controller: true
>> +
>> +      "#gpio-cells":
>> +        const: 2
>> +
>> +      gpio-ranges:
>> +        maxItems: 1
>> +
>> +    required:
>> +      - gpio-controller
>> +      - gpio-ranges
>> +      - '#gpio-cells'
>> +
>> +    additionalProperties: false
>> +
>> +patternProperties:
>> +  '^.*-pins$':
>> +    if:
>> +      type: object
>> +    then:
>> +      properties:
>> +        function:
>> +          $ref: "pinmux-node.yaml#/properties/function"
>> +          enum: [ serial_led_data, serial_led_clk, inet_act_led, =
pcie_clkreq,
>> +                  led, ephy0_act_led, ephy1_act_led, ephy2_act_led,
>> +                  ephy3_act_led, hsspi_cs1, usb_device_port, =
usb_host_port ]
>> +
>> +        pins:
>> +          $ref: "pinmux-node.yaml#/properties/pins"
>> +          enum: [ gpio6, gpio7, gpio11, gpio16, gpio17, gpio18, =
gpio19,
>> +                  gpio20, gpio25, gpio26, gpio27, gpio28, hsspi_cs1,
>> +                  usb_port1 ]
>> +
>> +required:
>> +  - compatible
>> +  - gpio
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    gpio_cntl@10000080 {
>> +      compatible =3D "brcm,bcm6328-gpio-controller", "syscon", =
"simple-mfd";
>=20
> You just added "brcm,bcm6328-gpio-controller", it would need to be =
documented.

I just added that because you requested me to do it =C2=AF\_(=E3=83=84)_/=C2=
=AF
What should I do to document it?
I still don=E2=80=99t get most of this .yaml stuff...

>=20
>> +      reg =3D <0x10000080 0x80>;
>> +
>> +      pinctrl: pinctrl {
>> +        compatible =3D "brcm,bcm6328-pinctrl";
>> +
>> +        gpio {
>> +          compatible =3D "brcm,bcm6328-gpio";
>=20
> I'm still trying to understand why you need 3 levels of nodes here?
> The gpio controller contains a pin controller plus other undefined
> functions (because of 'syscon') and the pin controller contains a gpio
> controller?

In previous versions the gpio controller was registered along with the =
pin controller, but @Linus requested me to register the gpio pin =
controller ranges through device tree by using gpio-ranges and I decided =
to use this approach, which was already used by other pin controllers.
However, there aren=E2=80=99t any pinctrl drivers using gpio-regmap, so =
this is kind of new=E2=80=A6

>=20
> I think "brcm,bcm6328-gpio-controller" and "brcm,bcm6328-pinctrl"
> should be a single node.

I agree, but does it make sense to add gpio-ranges to a pinctrl node =
referencing itself?
Something like:
syscon {
	pinctrl: pinctrl {
		compatible =E2=80=A6

		gpio-controller;
		gpio-ranges =3D <&pinctrl 0 0 32>;
		#gpio-cells =3D <2>;

		=E2=80=A6
	};
};

>=20
>> +          data =3D <0xc>;
>> +          dirout =3D <0x4>;
>=20
> This looks similar to the brcm,bcm6345-gpio.txt binding which then
> uses the gpio-mmio driver. Defining addresses with 'reg' is much
> preferred over custom properties. That binding also captures the bank
> size.

It=E2=80=99s similar, but Linus requested to use gpio regmap because we =
had a large amount of registers, so we=E2=80=99re not using it.

>=20
> Rob

Best regards,
=C3=81lvaro.=
