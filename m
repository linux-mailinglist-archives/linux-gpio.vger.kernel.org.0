Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E19D33EEA3
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 11:47:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230358AbhCQKrL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 06:47:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229952AbhCQKqv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Mar 2021 06:46:51 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C90CDC06174A;
        Wed, 17 Mar 2021 03:46:50 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id p19so1188372wmq.1;
        Wed, 17 Mar 2021 03:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=mBhYd1whOo+t48mTdmJpbe2HyNgyGZFf5/2QgCIN15w=;
        b=E+8UnBvqBwHgWNDYiiDGGavXPU8l6OxlTZq4s3u9CtM09j79Vv4SPCaSsY7dWq9IGo
         +GK/YHoWshQffxDeoJIpDJq3sdt4l2vwh+fncOS3sL7c2gR5EHxiAA/DPaobRUbNFSZu
         SHxpYLx0YkyVRYZkLg6MLRnzyPVVKDxWa/cKKAXn6g3Wsz35n/knZl1UNT9rBh41a3X8
         k49fRVgPB3gvkpug/NWpygedMcX9ibkjL3sv8FihVKrSP3jlVbrCvycUiVjZrq9Cs1ee
         aZwZZc8+qtAs85H64q8DpSyn4d+kvLcCdIVWcMX1KOTFiCsSXlhbNdlyyTJ1RxN/U/2Y
         1Vlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=mBhYd1whOo+t48mTdmJpbe2HyNgyGZFf5/2QgCIN15w=;
        b=VjXZXG24cu5XwpQ1zzMMXK/u8JfVxh32P0Jw+01JbBbmg6GpMoN8Zy8mb+tzEyLmEX
         sbOxhxJG3gTu+JCVV1ixQ73AQbfA3yrt16BP5t5JlbqDlEKgHQjS6wnFroxMyn8w4rLJ
         gwpQDwfUGLXWBKSb++g+yIy/Osj7sZiO1xCXJeQQ1RDW8DE5ujI6ujk5Ss8PBwuWcjVu
         E88Gzy5i1TFL+i9hZqd3Ljry48QjidHomfguSIcwfTAQEYoD+7huJBePtV7WdAL39eIL
         WLGi+YhLzIVQU+URV8QfPq2blWbC0e57jjo5tHU4iAppvJl3zoD1pPWSmLGVwAZ7RWW9
         i3eg==
X-Gm-Message-State: AOAM5307eoE0MikFOlynGXwDYGHovlOpiZScs3GS7ZV2IyoATnVUZnp+
        Jl2uNIXpM2Mvizf9wIbGV8dqX285ZgkoYg==
X-Google-Smtp-Source: ABdhPJzvU+zUdzdQEuvMKKXVkMFzwCcIdjE03EAvmUNWLs/uTk6mEz+K+A4T7ENLNVtNdm3BL9fp5A==
X-Received: by 2002:a05:600c:22c7:: with SMTP id 7mr3096514wmg.85.1615978009406;
        Wed, 17 Mar 2021 03:46:49 -0700 (PDT)
Received: from macbook-pro-alvaro.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id s84sm2095526wme.11.2021.03.17.03.46.48
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Mar 2021 03:46:49 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v7 03/22] dt-bindings: add BCM63XX GPIO binding
 documentation
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <20210316205451.GA3629500@robh.at.kernel.org>
Date:   Wed, 17 Mar 2021 11:46:46 +0100
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <4079680C-60B0-492D-B94A-814EED12F7DF@gmail.com>
References: <20210315114214.3096-1-noltari@gmail.com>
 <20210315114214.3096-4-noltari@gmail.com>
 <20210316205451.GA3629500@robh.at.kernel.org>
To:     Rob Herring <robh@kernel.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

> El 16 mar 2021, a las 21:54, Rob Herring <robh@kernel.org> escribi=C3=B3=
:
>=20
> On Mon, Mar 15, 2021 at 12:41:55PM +0100, =C3=81lvaro Fern=C3=A1ndez =
Rojas wrote:
>> Add binding documentation for the GPIO controller found in BCM6318, =
BCM6328,
>> BCM6358, BCM6362, BCM6368 and BCM63268 SoCs.
>>=20
>> Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
>> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>> ---
>> v7: new patch, splitted from pinctrl documentation
>>=20
>> .../bindings/gpio/brcm,bcm63xx-gpio.yaml      | 83 =
+++++++++++++++++++
>> 1 file changed, 83 insertions(+)
>> create mode 100644 =
Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml
>>=20
>> diff --git =
a/Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml =
b/Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml
>> new file mode 100644
>> index 000000000000..94a4f00ae2c7
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml
>> @@ -0,0 +1,83 @@
>> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/gpio/brcm,bcm63xx-gpio.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Broadcom BCM63xx GPIO controller
>> +
>> +maintainers:
>> +  - =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>> +  - Jonas Gorski <jonas.gorski@gmail.com>
>> +
>> +description: |+
>> +  The GPIO controller node should be the child of a syscon node.
>> +
>> +  Refer to the the bindings described in
>> +  Documentation/devicetree/bindings/mfd/syscon.yaml
>=20
> The above description is not too useful because it should hopefully=20
> later on in the series be expressed as a schema. IOW, the syscon =
schema=20
> should have a gpio child node with a $ref to this schema.

Is the following OK?
description:
  BCM63XX GPIO controller driver which supports the SoC system =
controller supplied GPIO registers.
  The BCM63XX GPIO controller node must be defined as a child node of =
the BCM63XX GPIO system controller node.

>=20
> What would be useful is to say something about the GPIO block.

Something like=E2=80=A6?

>=20
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - brcm,bcm6318-gpio
>> +      - brcm,bcm6328-gpio
>> +      - brcm,bcm6358-gpio
>> +      - brcm,bcm6362-gpio
>> +      - brcm,bcm6368-gpio
>> +      - brcm,bcm63268-gpio
>> +
>> +  data:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: |
>> +      Offset in the register map for the data register (in bytes).
>> +
>> +  dirout:
>> +    $ref: /schemas/types.yaml#/definitions/uint32
>> +    description: |
>> +      Offset in the register map for the dirout register (in bytes).
>=20
> As I said earlier, copy what brcm,bcm6345-gpio.txt did and use reg=20
> instead of data and dirout properties.

Ok, I will remove dirout and data properties.

>=20
> That binding says it is for bcm63xx SoCs, too. So that should be=20
> resolved. It looks like it should be 1 binding IMO. The only =
difference=20
> I see is the number of GPIO lines and register size. The fact that the=20=

> parent is a syscon in some cases is irrelevant.

Please be more specific.
What do you want me to do with this? How should I handle that?

>=20
>> +
>> +  gpio-controller: true
>> +
>> +  "#gpio-cells":
>> +    const: 2
>> +
>> +  gpio-ranges:
>> +    maxItems: 1
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - gpio-controller
>> +  - gpio-ranges
>> +  - '#gpio-cells'
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    gpio@0 {
>> +      compatible =3D "brcm,bcm6328-gpio";
>> +      reg =3D <0x0 0x10>;
>> +
>> +      data =3D <0xc>;
>> +      dirout =3D <0x4>;
>> +
>> +      gpio-controller;
>> +      gpio-ranges =3D <&pinctrl 0 0 32>;
>> +      #gpio-cells =3D <2>;
>> +    };
>> +
>> +  - |
>> +    gpio@0 {
>> +      compatible =3D "brcm,bcm63268-gpio";
>> +      reg =3D <0x0 0x10>;
>> +
>> +      data =3D <0xc>;
>> +      dirout =3D <0x4>;
>> +
>> +      gpio-controller;
>> +      gpio-ranges =3D <&pinctrl 0 0 52>;
>> +      #gpio-cells =3D <2>;
>> +    };
>> --=20
>> 2.20.1

