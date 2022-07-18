Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 608125785D4
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jul 2022 16:52:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230179AbiGROwA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jul 2022 10:52:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234156AbiGROvz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 10:51:55 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 129581EAEE;
        Mon, 18 Jul 2022 07:51:52 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id a5so17389907wrx.12;
        Mon, 18 Jul 2022 07:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=Zwyzja49jTBt5v01ZmoYlLErXPaXS1ddpKN1QWHfErY=;
        b=X8R5n11Ajs6cnyczw/D9MhsD5ziNbwIMfJESuWMeEpjGpWqW7E/TbA5uhDDbTZ3cZp
         AZIOoC8IFjkkqvi7UzKzjim4Qc215+EmMOLe8J/JcBER3Zzbnp1G5rQeR8sHXI3rVtFH
         pt+UJAd4ve5MXGi6579fLgs8a7WOfGHvFCr/Jf8eqx5fKvzbrn8xSWivKY+sP23LV+Zj
         mh97p4XoaJGZ2lUS5Dm57RjOgkjOgpkgd9QruFWOm6ySADzbIb8m4JiMbEuTPo3zLPL7
         EMKkJF5HlLlMkZ6ZJy4uBQhx6mBCJFl3gbGdgp3Kh4H0SgRZkIqdu1JKKbYPP/lPRE3d
         H2ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=Zwyzja49jTBt5v01ZmoYlLErXPaXS1ddpKN1QWHfErY=;
        b=o0RjKevkWXXTZLpRDRK7LZIijbf4USHA1tK5vuBRSAhiFxIKesT1/OR4UILJCv/sSl
         tOvUlm/QGA+34NKERDlNkIwqc4cgUSKHu1R8CL4yUtAJkygFsFDzrOcYGP5lq20v6ZQg
         g8C8sP1dqU9U7gxyLfIKsfpvO0XnATifK4bbDBuTdqsFKqi08JWqjqa1W5Dgt13B15bd
         22oR++2+2G05FzdC4gWaePg9Xr3dNL9Et5OtaTtRNwZ3QF40H0sqAvCL0YPB8mOPdwnB
         HLeKy3KH55+W33Ug7i2ZtaVAYpBhupd2lntm83tEJKkudL6+hAR2q5ltZKl7qWxpiGAL
         H7eQ==
X-Gm-Message-State: AJIora8D6+JAvTkSCmPc3IpuZ82Pqzg8O6uiugCxIO31rgQp3GrFiRVo
        5RfOTcWo1YaI31t84PAPIXI=
X-Google-Smtp-Source: AGRyM1v2WLaMnndYP3Zu5sgujhWallh4uHB0Gzu00kx1NdmLvZa4E7QpVt5I8lfA9wZU6Lt+YDfYBA==
X-Received: by 2002:a5d:64ad:0:b0:21d:adb6:c266 with SMTP id m13-20020a5d64ad000000b0021dadb6c266mr24483156wrp.638.1658155910486;
        Mon, 18 Jul 2022 07:51:50 -0700 (PDT)
Received: from p200300f6ef036f005de6a4d0d791ed01.dip0.t-ipconnect.de (p200300f6ef036f005de6a4d0d791ed01.dip0.t-ipconnect.de. [2003:f6:ef03:6f00:5de6:a4d0:d791:ed01])
        by smtp.gmail.com with ESMTPSA id r8-20020a5d52c8000000b0021d65e9d449sm11578377wrv.73.2022.07.18.07.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:51:50 -0700 (PDT)
Message-ID: <82ed44d4cb90a79109755e1e0b6b2de267462cc7.camel@gmail.com>
Subject: Re: [PATCH v2 05/10] dt-bindings: input: adp5588-keys: add bindings
From:   Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Nuno =?ISO-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
        linux-gpio@vger.kernel.org, linux-input@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date:   Mon, 18 Jul 2022 16:52:54 +0200
In-Reply-To: <1c73fe9e-81f8-3ecd-edd1-60e6ddd548f3@linaro.org>
References: <20220715125138.378632-1-nuno.sa@analog.com>
         <20220715125138.378632-6-nuno.sa@analog.com>
         <1c73fe9e-81f8-3ecd-edd1-60e6ddd548f3@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.3 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 2022-07-18 at 16:27 +0200, Krzysztof Kozlowski wrote:
> On 15/07/2022 14:51, Nuno S=C3=A1 wrote:
> > Add device tree bindings for the adp5588-keys driver.
> >=20
> > Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> > ---
> > =C2=A0.../bindings/input/adi,adp5588-keys.yaml=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 110
> > ++++++++++++++++++
> > =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0=C2=A0 1 +
> > =C2=A02 files changed, 111 insertions(+)
> > =C2=A0create mode 100644
> > Documentation/devicetree/bindings/input/adi,adp5588-keys.yaml
>=20
> Thank you for your patch. There is something to discuss/improve.
>=20
> >=20
> > diff --git a/Documentation/devicetree/bindings/input/adi,adp5588-
> > keys.yaml b/Documentation/devicetree/bindings/input/adi,adp5588-
> > keys.yaml
> > new file mode 100644
> > index 000000000000..0d262b42150a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/input/adi,adp5588-keys.yaml
> > @@ -0,0 +1,110 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/input/adi,adp5588-keys.yaml#
>=20
> Is ADP5588 a multi-function device? If not, I propose to drop the
> "keys"
> suffix.
>=20

I can do that. I just kept the same naming of the c file...

> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Analog Devices ADP5588 Keypad Controller
> > +
> > +maintainers:
> > +=C2=A0 - Nuno S=C3=A1 <nuno.sa@analog.com>
> > +
> > +description: |
> > +=C2=A0 Analog Devices Mobile I/O Expander and QWERTY Keypad Controller
> > +=C2=A0
> > https://www.analog.com/media/en/technical-documentation/data-sheets/ADP=
5588.pdf
> > +
> > +allOf:
> > +=C2=A0 - $ref: matrix-keymap.yaml#
> > +=C2=A0 - $ref: input.yaml#
> > +
> > +properties:
> > +=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0 enum:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - adi,adp5588
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - adi,adp5587
>=20
> Bring some order, like alphabetical.
>=20

ack...

> > +
> > +=C2=A0 reg:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +=C2=A0 vcc-supply:
> > +=C2=A0=C2=A0=C2=A0 description: Supply Voltage Input
> > +
> > +=C2=A0 reset-gpios:
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If specified, it will be asserted durin=
g driver probe. As
> > the line is
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 active low, it should be marked GPIO_AC=
TIVE_LOW.
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +=C2=A0 interrupts:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +=C2=A0 gpio-controller:
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This property applies if either keypad,=
num-rows lower than 8
> > or
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 keypad,num-columns lower than 10.
> > +
> > +=C2=A0 '#gpio-cells':
> > +=C2=A0=C2=A0=C2=A0 const: 2
> > +
> > +=C2=A0 interrupt-controller:
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This property applies if either keypad,=
num-rows lower than 8
> > or
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 keypad,num-columns lower than 10.
> > +
> > +=C2=A0 '#interrupt-cells':
> > +=C2=A0=C2=A0=C2=A0 const: 2
> > +
> > +=C2=A0 adi,unlock-keys:
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Specifies a maximum of 2 keys that can =
be used to unlock the
> > keypad.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If this property is set, the keyboard w=
ill be locked and
> > only unlocked
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 after these keys are pressed. If only o=
ne key is set, a
> > double click is
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 needed to unlock the keypad.
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/uint32-array
> > +=C2=A0=C2=A0=C2=A0 minItems: 1
> > +=C2=A0=C2=A0=C2=A0 maxItems: 2
>=20
> What are the values/units? keycodes? If so, maybe "adi,unlock-
> keycodes"
> and add limit on values (like linux,keycodes).
>=20

They are just key numbers on the matrix. In the driver there's actually
a check so that the value cannot be >=3D keypad,num-rows * keypad,num-
columns. Not sure if there's a way to express this but I can surely
improve the description.

(There's also a comment on the driver regarding why I'm doing this
check).

> > +
> > +required:
> > +=C2=A0 - compatible
> > +=C2=A0 - reg
> > +=C2=A0 - interrupts
> > +=C2=A0 - keypad,num-rows
> > +=C2=A0 - keypad,num-columns
> > +=C2=A0 - linux,keymap
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +=C2=A0 - |
> > +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/interrupt-controller/irq.h>
> > +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/input/input.h>
> > +=C2=A0=C2=A0=C2=A0 #include <dt-bindings/gpio/gpio.h>
> > +=C2=A0=C2=A0=C2=A0 i2c {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #address-cells =
=3D <1>;
>=20
> Wrong indentation. 4 spaces for DTS example.
>=20

ack

> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 #size-cells =3D=
 <0>;
> > +
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 adp5588@34 {
>=20
> Node names should be generic.
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-device=
tree-basics.html#generic-names-recommendation
>=20
>=20

ack

- Nuno S=C3=A1

