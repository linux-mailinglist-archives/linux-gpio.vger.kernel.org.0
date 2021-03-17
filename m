Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D07EC33EEB2
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 11:49:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbhCQKtT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 06:49:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbhCQKs7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Mar 2021 06:48:59 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16AACC06174A;
        Wed, 17 Mar 2021 03:48:59 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id x13so1309428wrs.9;
        Wed, 17 Mar 2021 03:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=PQXCQSz3WJIrPfIaq4GWlWjxd5ib36K83jVlzvYMprI=;
        b=rVvGVxO2l4iFt8Hk5bN/DtRLpXahm0Kcf+NFQrUOPzWM+bvChlLlLWr3x+joHB+Mtk
         AFTFLTn3b87Vu9v3acRq514LCRZZRRXmWHgMO7sqWNWMe2oJV5AHWU5cUx7Qk/RegfKT
         L8O0MKV9wyAXtmZEVWY4UrdGyUcm5NBQBLf4rTagVyK+xVvNi6nLITXfVPL3pLkuHTuc
         UjUQZfB8cFNZPKoqhOgZlLmsWdXGyFzaUxNesPUIWdtjASRbi2dglgANKj8cB1+EcSqt
         4Ue1menyAfwoW/1+Wmano44ErJ5qAVTk/AqcLSxkbr2YoJXcCBP3SkvScxtvVlkhyGY2
         kt9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=PQXCQSz3WJIrPfIaq4GWlWjxd5ib36K83jVlzvYMprI=;
        b=MPcUbWEAQzDzik8uQW/HCt2/6BST3l12DaS2ooQtmAWk+KPUHdfggRaPSmQe//XDqE
         Xf7ffTG9SDT7oPsdcRop+hKue42rePAInj9aRR4XHTaJxOE4eXlSKuddSYpluL1SS/+A
         ddUb3ylVVvDL+a3+e5qzfsNi1AGM2cjIX3sBeC4nhtykWKM1/UJ+BimAy6w8y8nrpeaT
         JWicyL9NZcXMtyRXU7bXofgHOtKr6YKqJz8yBhQPQ/e9kay1jJZ7cFgi88rXpKrj1KL1
         8SYNXwAmcIdTLzudhN1vTWixqG8Y6TcGMz0eIZLJJOaL9f14SBU5akq32S6uSnUbRkJ+
         4wfQ==
X-Gm-Message-State: AOAM531shqO7Rquznk+K9UGuXacv7pNZjVIw+cbC2wvBZ6vDkghixB9D
        xCfBH5H7DsDqaIxtkDKZUhw=
X-Google-Smtp-Source: ABdhPJwMzaoyLN+O9vg/gmWjRqpblmpCtBuQtyz/JVQVIOzMQGIHhrYYz3fm/GoFupF+p9rF6anSEg==
X-Received: by 2002:adf:82aa:: with SMTP id 39mr3842342wrc.114.1615978137784;
        Wed, 17 Mar 2021 03:48:57 -0700 (PDT)
Received: from macbook-pro-alvaro.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id w11sm26634908wrv.88.2021.03.17.03.48.57
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Mar 2021 03:48:57 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v7 21/22] dt-bindings: add BCM6318 GPIO sysctl binding
 documentation
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <CAL_JsqJuj6W=N1ATTYLg_Cz53-F11yz3UBOJd4kUzHfmKWXrLw@mail.gmail.com>
Date:   Wed, 17 Mar 2021 11:48:55 +0100
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE" 
        <bcm-kernel-feedback-list@broadcom.com>,
        Lee Jones <lee.jones@linaro.org>,
        Michael Walle <michael@walle.cc>,
        Jonas Gorski <jonas.gorski@gmail.com>,
        Necip Fazil Yildiran <fazilyildiran@gmail.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        devicetree@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <DC3CDA11-CD67-474C-99CB-65895AE3EE36@gmail.com>
References: <20210315114214.3096-1-noltari@gmail.com>
 <20210315114214.3096-22-noltari@gmail.com>
 <CAL_JsqJuj6W=N1ATTYLg_Cz53-F11yz3UBOJd4kUzHfmKWXrLw@mail.gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

> El 16 mar 2021, a las 22:20, Rob Herring <robh+dt@kernel.org> =
escribi=C3=B3:
>=20
> On Mon, Mar 15, 2021 at 5:42 AM =C3=81lvaro Fern=C3=A1ndez Rojas
> <noltari@gmail.com> wrote:
>>=20
>> Add binding documentation for the GPIO sysctl found in BCM6318 SoCs.
>>=20
>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>> ---
>> v7: add changes suggested by Rob Herring
>>=20
>> .../mfd/brcm,bcm6318-gpio-sysctl.yaml         | 179 =
++++++++++++++++++
>> 1 file changed, 179 insertions(+)
>> create mode 100644 =
Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml
>>=20
>> diff --git =
a/Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml =
b/Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml
>> new file mode 100644
>> index 000000000000..7056a490a27d
>> --- /dev/null
>> +++ =
b/Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml
>> @@ -0,0 +1,179 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: =
http://devicetree.org/schemas/mfd/brcm,bcm6318-gpio-sysctl.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Broadcom BCM6318 GPIO System Controller Device Tree Bindings
>> +
>> +maintainers:
>> +  - =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>> +  - Jonas Gorski <jonas.gorski@gmail.com>
>> +
>> +description:
>> +  Broadcom BCM6318 SoC GPIO system controller which provides a =
register map
>> +  for controlling the GPIO and pins of the SoC.
>=20
> Perhaps a blurb about other registers in this block. =46rom the
> registers, it looked like LED and PHY control at least.

I think it=E2=80=99s enough if I document this for now and others could =
add more information later on.
I=E2=80=99m not adding any more information about these system =
controllers, sorry.

>=20
>> +
>> +properties:
>> +  "#address-cells": true
>> +
>> +  "#size-cells": true
>> +
>> +  compatible:
>> +    items:
>> +      - const: brcm,bcm6318-gpio-sysctl
>> +      - const: syscon
>> +      - const: simple-mfd
>> +
>> +  ranges:
>> +    maxItems: 1
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +patternProperties:
>> +  "^gpio@[0-9a-f]+$":
>> +    # Child node
>> +    type: object
>> +    $ref: "../gpio/brcm,bcm63xx-gpio.yaml"
>> +    description:
>> +      GPIO controller for the SoC GPIOs. This child node definition
>> +      should follow the bindings specified in
>> +      Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml.
>> +
>> +  "^pinctrl@[0-9a-f]+$":
>> +    # Child node
>> +    type: object
>> +    $ref: "../pinctrl/brcm,bcm6318-pinctrl.yaml"
>> +    description:
>> +      Pin controller for the SoC pins. This child node definition
>> +      should follow the bindings specified in
>> +      =
Documentation/devicetree/bindings/pinctrl/brcm,bcm6318-pinctrl.yaml.
>> +
>> +required:
>> +  - "#address-cells"
>> +  - compatible
>> +  - ranges
>> +  - reg
>> +  - "#size-cells"
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    syscon@10000080 {
>> +      #address-cells =3D <1>;
>> +      #size-cells =3D <1>;
>> +      compatible =3D "brcm,bcm6318-gpio-sysctl", "syscon", =
"simple-mfd";
>> +      reg =3D <0x10000080 0x80>;
>> +      ranges =3D <0 0x10000080 0x80>;
>> +
>> +      gpio@0 {
>> +        compatible =3D "brcm,bcm6318-gpio";
>> +        reg =3D <0x0 0x10>;
>> +
>> +        data =3D <0xc>;
>> +        dirout =3D <0x4>;
>> +
>> +        gpio-controller;
>> +        gpio-ranges =3D <&pinctrl 0 0 50>;
>> +        #gpio-cells =3D <2>;
>> +      };
>> +
>> +      pinctrl: pinctrl@10 {
>> +        compatible =3D "brcm,bcm6318-pinctrl";
>> +        reg =3D <0x18 0x10>, <0x54 0x18>;
>> +
>> +        pinctrl_ephy0_spd_led: ephy0_spd_led-pins {
>> +          function =3D "ephy0_spd_led";
>> +          pins =3D "gpio0";
>> +        };
>> +
>> +        pinctrl_ephy1_spd_led: ephy1_spd_led-pins {
>> +          function =3D "ephy1_spd_led";
>> +          pins =3D "gpio1";
>> +        };
>> +
>> +        pinctrl_ephy2_spd_led: ephy2_spd_led-pins {
>> +          function =3D "ephy2_spd_led";
>> +          pins =3D "gpio2";
>> +        };
>> +
>> +        pinctrl_ephy3_spd_led: ephy3_spd_led-pins {
>> +          function =3D "ephy3_spd_led";
>> +          pins =3D "gpio3";
>> +        };
>> +
>> +        pinctrl_ephy0_act_led: ephy0_act_led-pins {
>> +          function =3D "ephy0_act_led";
>> +          pins =3D "gpio4";
>> +        };
>> +
>> +        pinctrl_ephy1_act_led: ephy1_act_led-pins {
>> +          function =3D "ephy1_act_led";
>> +          pins =3D "gpio5";
>> +        };
>> +
>> +        pinctrl_ephy2_act_led: ephy2_act_led-pins {
>> +          function =3D "ephy2_act_led";
>> +          pins =3D "gpio6";
>> +        };
>> +
>> +        pinctrl_ephy3_act_led: ephy3_act_led-pins {
>> +          function =3D "ephy3_act_led";
>> +          pins =3D "gpio7";
>> +        };
>> +
>> +        pinctrl_serial_led: serial_led-pins {
>> +          pinctrl_serial_led_data: serial_led_data-pins {
>> +            function =3D "serial_led_data";
>> +            pins =3D "gpio6";
>> +          };
>> +
>> +          pinctrl_serial_led_clk: serial_led_clk-pins {
>> +            function =3D "serial_led_clk";
>> +            pins =3D "gpio7";
>> +          };
>> +        };
>> +
>> +        pinctrl_inet_act_led: inet_act_led-pins {
>> +          function =3D "inet_act_led";
>> +          pins =3D "gpio8";
>> +        };
>> +
>> +        pinctrl_inet_fail_led: inet_fail_led-pins {
>> +          function =3D "inet_fail_led";
>> +          pins =3D "gpio9";
>> +        };
>> +
>> +        pinctrl_dsl_led: dsl_led-pins {
>> +          function =3D "dsl_led";
>> +          pins =3D "gpio10";
>> +        };
>> +
>> +        pinctrl_post_fail_led: post_fail_led-pins {
>> +          function =3D "post_fail_led";
>> +          pins =3D "gpio11";
>> +        };
>> +
>> +        pinctrl_wlan_wps_led: wlan_wps_led-pins {
>> +          function =3D "wlan_wps_led";
>> +          pins =3D "gpio12";
>> +        };
>> +
>> +        pinctrl_usb_pwron: usb_pwron-pins {
>> +          function =3D "usb_pwron";
>> +          pins =3D "gpio13";
>> +        };
>> +
>> +        pinctrl_usb_device_led: usb_device_led-pins {
>> +          function =3D "usb_device_led";
>> +          pins =3D "gpio13";
>> +        };
>> +
>> +        pinctrl_usb_active: usb_active-pins {
>> +          function =3D "usb_active";
>> +          pins =3D "gpio40";
>> +        };
>> +      };
>> +    };
>> --
>> 2.20.1

