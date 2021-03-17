Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2596A33F0B9
	for <lists+linux-gpio@lfdr.de>; Wed, 17 Mar 2021 13:56:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbhCQMz3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 17 Mar 2021 08:55:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230063AbhCQMzQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 17 Mar 2021 08:55:16 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B4AC06174A;
        Wed, 17 Mar 2021 05:55:04 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id u5-20020a7bcb050000b029010e9316b9d5so1234851wmj.2;
        Wed, 17 Mar 2021 05:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=c/iGXO0LQFnltqKfY4yg5UzvSvHRVmZFpZ9ygW/SvpU=;
        b=ZnwUL/ueBD9IyNQXGaSMm7Zkkawj0pWzhNr+VF2gyI3J8JO7SBF8oNG/HzNGvhePA3
         78eKSDeuEotLXVR/KLVCKeOG1GuD/5cJ/ZrQQtnUK4Vr3Yb+vqwiT1iXztmTIluKa3ki
         xYvHuM7d8/50j0oZ4c3CfD00ajAerYhVfu7O/JwojnQk1GHDx0QJzsNPgfDucD/KShsQ
         4PBMwF4PmJTlAToTxB8Ev077FA0xANqTH82HAlrdW85t+8FVq+Z/Fyr7L1yun0OcRO7G
         rdmMdx6Gs//vJ7ec0vr3TDiZEqMWVhMjDIXGmihij+M+1BG/5J0HAYPuPLJ1U3TMdyjU
         xi1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=c/iGXO0LQFnltqKfY4yg5UzvSvHRVmZFpZ9ygW/SvpU=;
        b=DLup9NOekkclkipTSi/DNUJ2SaNW/277BygbxbiNUA0cQYatcmXM/hiYdipqH57j2v
         6NMIc/qT/2nFrVg2yZtfwloApG50vKzPya6V2SwmlIzDkrKUsilJdogIeWubkpGbhG7N
         CiRoCK3n8vpDLckXFZr5L7vq2rtwVZY+iNf7IKV9D4s95D/kO3EyWhD9y878PxcpaGYb
         pQL9CwmR1rRDPOVPcHivGvdi2niwPrUN3sGdT6GLaY4vF6ASL81PnagJnsyqBeNM7Ns1
         9irYvqNpdRfPsgKfwcCErlyjpXk6mxTW4N25ScLbAeLenalETVCzSA1cfOwmVjtzOduj
         5H2A==
X-Gm-Message-State: AOAM53176NkJSN+xYp9cylT0Vdbk/gGH7O9RWHXnfSCuufDtKEHQpNCu
        rhI4pErZlcdcw3E398mThec=
X-Google-Smtp-Source: ABdhPJxpndn1bJZpXDdsJyGhF3hyN3JXTjEp+IS1f408zsg6owR7eyier0QZBE+COLWOk+J1Ul3iQQ==
X-Received: by 2002:a7b:cc84:: with SMTP id p4mr3648503wma.10.1615985702884;
        Wed, 17 Mar 2021 05:55:02 -0700 (PDT)
Received: from macbook-pro-alvaro.lan ([80.31.204.166])
        by smtp.gmail.com with ESMTPSA id u23sm2454109wmn.26.2021.03.17.05.55.01
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Mar 2021 05:55:02 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v7 05/22] dt-bindings: add BCM6328 pincontroller binding
 documentation
From:   =?utf-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>
In-Reply-To: <20210316205905.GB3629500@robh.at.kernel.org>
Date:   Wed, 17 Mar 2021 13:54:59 +0100
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
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <AA04F2C0-89F0-4389-B956-8420E4D88FA6@gmail.com>
References: <20210315114214.3096-1-noltari@gmail.com>
 <20210315114214.3096-6-noltari@gmail.com>
 <20210316205905.GB3629500@robh.at.kernel.org>
To:     Rob Herring <robh@kernel.org>
X-Mailer: Apple Mail (2.3654.60.0.2.21)
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

> El 16 mar 2021, a las 21:59, Rob Herring <robh@kernel.org> escribi=C3=B3=
:
>=20
> On Mon, Mar 15, 2021 at 12:41:57PM +0100, =C3=81lvaro Fern=C3=A1ndez =
Rojas wrote:
>> Add binding documentation for the pincontrol core found in BCM6328 =
SoCs.
>>=20
>> Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
>> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
>> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
>> ---
>> v7: add changes suggested by Rob Herring
>> v6: add changes suggested by Rob Herring
>> v5: change Documentation to dt-bindings in commit title
>> v4: no changes
>> v3: add new gpio node
>> v2: remove interrupts
>>=20
>> .../pinctrl/brcm,bcm6328-pinctrl.yaml         | 132 =
++++++++++++++++++
>> 1 file changed, 132 insertions(+)
>> create mode 100644 =
Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
>>=20
>> diff --git =
a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml =
b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
>> new file mode 100644
>> index 000000000000..e1ecdc578f32
>> --- /dev/null
>> +++ =
b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
>> @@ -0,0 +1,132 @@
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
>> +  reg:
>> +    maxItems: 1
>> +
>> +patternProperties:
>> +  '^.*-pins$':
>=20
> '-pins$' is equivalent.
>=20
>> +    if:
>> +      type: object
>> +    then:
>=20
> You don't need this if/then. This should be:
>=20
> '-pins$':
>  type: object
>  $ref: pinmux-node.yaml#
>=20
>  additionalProperties: false
>  properties:
>    ...

If I add "additionalProperties: false" I get the following error:
=
/home/noltari/workspace/linux/Documentation/devicetree/bindings/pinctrl/br=
cm,bcm6328-pinctrl.example.dt.yaml: pinctrl@18: serial_led-pins: =
'serial_led_clk-pins', 'serial_led_data-pins' do not match any of the =
regexes: 'pinctrl-[0-9]+'
	=46rom schema: =
/home/noltari/workspace/linux/Documentation/devicetree/bindings/pinctrl/br=
cm,bcm6328-pinctrl.yaml

>=20
>> +      properties:
>> +        function:
>> +          $ref: "pinmux-node.yaml#/properties/function"
>=20
> Drop this as you need the $ref up a level.
>=20
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
>> +  - reg
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    pinctrl@18 {
>> +      compatible =3D "brcm,bcm6328-pinctrl";
>> +      reg =3D <0x18 0x10>;
>> +
>> +      pinctrl_serial_led: serial_led-pins {
>> +        pinctrl_serial_led_data: serial_led_data-pins {
>> +          function =3D "serial_led_data";
>> +          pins =3D "gpio6";
>> +        };
>> +
>> +        pinctrl_serial_led_clk: serial_led_clk-pins {
>> +          function =3D "serial_led_clk";
>> +          pins =3D "gpio7";
>> +        };
>> +      };
>> +
>> +      pinctrl_inet_act_led: inet_act_led-pins {
>> +        function =3D "inet_act_led";
>> +        pins =3D "gpio11";
>> +      };
>> +
>> +      pinctrl_pcie_clkreq: pcie_clkreq-pins {
>> +        function =3D "pcie_clkreq";
>> +        pins =3D "gpio16";
>> +      };
>> +
>> +      pinctrl_ephy0_spd_led: ephy0_spd_led-pins {
>> +        function =3D "led";
>> +        pins =3D "gpio17";
>> +      };
>> +
>> +      pinctrl_ephy1_spd_led: ephy1_spd_led-pins {
>> +        function =3D "led";
>> +        pins =3D "gpio18";
>> +      };
>> +
>> +      pinctrl_ephy2_spd_led: ephy2_spd_led-pins {
>> +        function =3D "led";
>> +        pins =3D "gpio19";
>> +      };
>> +
>> +      pinctrl_ephy3_spd_led: ephy3_spd_led-pins {
>> +        function =3D "led";
>> +        pins =3D "gpio20";
>> +      };
>> +
>> +      pinctrl_ephy0_act_led: ephy0_act_led-pins {
>> +        function =3D "ephy0_act_led";
>> +        pins =3D "gpio25";
>> +      };
>> +
>> +      pinctrl_ephy1_act_led: ephy1_act_led-pins {
>> +        function =3D "ephy1_act_led";
>> +        pins =3D "gpio26";
>> +      };
>> +
>> +      pinctrl_ephy2_act_led: ephy2_act_led-pins {
>> +        function =3D "ephy2_act_led";
>> +        pins =3D "gpio27";
>> +      };
>> +
>> +      pinctrl_ephy3_act_led: ephy3_act_led-pins {
>> +        function =3D "ephy3_act_led";
>> +        pins =3D "gpio28";
>> +      };
>> +
>> +      pinctrl_hsspi_cs1: hsspi_cs1-pins {
>> +        function =3D "hsspi_cs1";
>> +        pins =3D "hsspi_cs1";
>> +      };
>> +
>> +      pinctrl_usb_port1_device: usb_port1_device-pins {
>> +        function =3D "usb_device_port";
>> +        pins =3D "usb_port1";
>> +      };
>> +
>> +      pinctrl_usb_port1_host: usb_port1_host-pins {
>> +        function =3D "usb_host_port";
>> +        pins =3D "usb_port1";
>> +      };
>> +    };
>> --=20
>> 2.20.1

