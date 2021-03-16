Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65E5A33E063
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Mar 2021 22:21:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbhCPVUe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Mar 2021 17:20:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:44284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233050AbhCPVU0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 16 Mar 2021 17:20:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9F0BD64FA7;
        Tue, 16 Mar 2021 21:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615929625;
        bh=WHI+OjrCXmd/mjF+mUbP4j7IzJgzd3UFVp+54tzS4bw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=hr2gyp0uaNMoehC8pOwgIb1RmIkVwcD2zUGVib3pzsnP5ZNXXKrah4SAGtiL0lM6x
         /2PcHiitNRH+7BxMwah6z/nilLrBENQCi3M4YM4ab3ETBxDyr2A8prYLdLcxvu7SkO
         g138wET6eJcnxzjlIKyM99fyCymcZPszrWKuxDc/dC/0HONzkf8RRGwHWHAINo8GG/
         qNZQ1grjTzBENgNxELvnbqE4Fi+09I0HCEdynshQ1D7Y4EL/r5Yti8aLvAkIu2RHYQ
         LPLRYYa4WWF1xOlLWLmDkLVrWbKp3AhY+0iPEz8YioFzZVgAhxUqi0lKZrNgHQbq/q
         x9W33KNlBfCUA==
Received: by mail-qk1-f181.google.com with SMTP id b130so36826763qkc.10;
        Tue, 16 Mar 2021 14:20:25 -0700 (PDT)
X-Gm-Message-State: AOAM53037PaxJydH9xZGnS9N+xJdoCPYH1WdS4/xIyvwNWz4yr7CaEu+
        VfnZXWwdYoxjkeFf6zSEP2+XDAqZblTpEm2uGA==
X-Google-Smtp-Source: ABdhPJyqfKqIYFuiBr340Or67X8rmtghrd5XbCqBEf45clLT2bkojdYSla5iDvNoQUEBjg4yIhW/UNVwjz0no09NQZI=
X-Received: by 2002:a37:d82:: with SMTP id 124mr1050837qkn.311.1615929624797;
 Tue, 16 Mar 2021 14:20:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210315114214.3096-1-noltari@gmail.com> <20210315114214.3096-22-noltari@gmail.com>
In-Reply-To: <20210315114214.3096-22-noltari@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Tue, 16 Mar 2021 15:20:13 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJuj6W=N1ATTYLg_Cz53-F11yz3UBOJd4kUzHfmKWXrLw@mail.gmail.com>
Message-ID: <CAL_JsqJuj6W=N1ATTYLg_Cz53-F11yz3UBOJd4kUzHfmKWXrLw@mail.gmail.com>
Subject: Re: [PATCH v7 21/22] dt-bindings: add BCM6318 GPIO sysctl binding documentation
To:     =?UTF-8?B?w4FsdmFybyBGZXJuw6FuZGV6IFJvamFz?= <noltari@gmail.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Mar 15, 2021 at 5:42 AM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:
>
> Add binding documentation for the GPIO sysctl found in BCM6318 SoCs.
>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> ---
>  v7: add changes suggested by Rob Herring
>
>  .../mfd/brcm,bcm6318-gpio-sysctl.yaml         | 179 ++++++++++++++++++
>  1 file changed, 179 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/brcm,bcm6318-gp=
io-sysctl.yaml
>
> diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysc=
tl.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.ya=
ml
> new file mode 100644
> index 000000000000..7056a490a27d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/brcm,bcm6318-gpio-sysctl.yaml
> @@ -0,0 +1,179 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/brcm,bcm6318-gpio-sysctl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM6318 GPIO System Controller Device Tree Bindings
> +
> +maintainers:
> +  - =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> +  - Jonas Gorski <jonas.gorski@gmail.com>
> +
> +description:
> +  Broadcom BCM6318 SoC GPIO system controller which provides a register =
map
> +  for controlling the GPIO and pins of the SoC.

Perhaps a blurb about other registers in this block. From the
registers, it looked like LED and PHY control at least.

> +
> +properties:
> +  "#address-cells": true
> +
> +  "#size-cells": true
> +
> +  compatible:
> +    items:
> +      - const: brcm,bcm6318-gpio-sysctl
> +      - const: syscon
> +      - const: simple-mfd
> +
> +  ranges:
> +    maxItems: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^gpio@[0-9a-f]+$":
> +    # Child node
> +    type: object
> +    $ref: "../gpio/brcm,bcm63xx-gpio.yaml"
> +    description:
> +      GPIO controller for the SoC GPIOs. This child node definition
> +      should follow the bindings specified in
> +      Documentation/devicetree/bindings/gpio/brcm,bcm63xx-gpio.yaml.
> +
> +  "^pinctrl@[0-9a-f]+$":
> +    # Child node
> +    type: object
> +    $ref: "../pinctrl/brcm,bcm6318-pinctrl.yaml"
> +    description:
> +      Pin controller for the SoC pins. This child node definition
> +      should follow the bindings specified in
> +      Documentation/devicetree/bindings/pinctrl/brcm,bcm6318-pinctrl.yam=
l.
> +
> +required:
> +  - "#address-cells"
> +  - compatible
> +  - ranges
> +  - reg
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    syscon@10000080 {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <1>;
> +      compatible =3D "brcm,bcm6318-gpio-sysctl", "syscon", "simple-mfd";
> +      reg =3D <0x10000080 0x80>;
> +      ranges =3D <0 0x10000080 0x80>;
> +
> +      gpio@0 {
> +        compatible =3D "brcm,bcm6318-gpio";
> +        reg =3D <0x0 0x10>;
> +
> +        data =3D <0xc>;
> +        dirout =3D <0x4>;
> +
> +        gpio-controller;
> +        gpio-ranges =3D <&pinctrl 0 0 50>;
> +        #gpio-cells =3D <2>;
> +      };
> +
> +      pinctrl: pinctrl@10 {
> +        compatible =3D "brcm,bcm6318-pinctrl";
> +        reg =3D <0x18 0x10>, <0x54 0x18>;
> +
> +        pinctrl_ephy0_spd_led: ephy0_spd_led-pins {
> +          function =3D "ephy0_spd_led";
> +          pins =3D "gpio0";
> +        };
> +
> +        pinctrl_ephy1_spd_led: ephy1_spd_led-pins {
> +          function =3D "ephy1_spd_led";
> +          pins =3D "gpio1";
> +        };
> +
> +        pinctrl_ephy2_spd_led: ephy2_spd_led-pins {
> +          function =3D "ephy2_spd_led";
> +          pins =3D "gpio2";
> +        };
> +
> +        pinctrl_ephy3_spd_led: ephy3_spd_led-pins {
> +          function =3D "ephy3_spd_led";
> +          pins =3D "gpio3";
> +        };
> +
> +        pinctrl_ephy0_act_led: ephy0_act_led-pins {
> +          function =3D "ephy0_act_led";
> +          pins =3D "gpio4";
> +        };
> +
> +        pinctrl_ephy1_act_led: ephy1_act_led-pins {
> +          function =3D "ephy1_act_led";
> +          pins =3D "gpio5";
> +        };
> +
> +        pinctrl_ephy2_act_led: ephy2_act_led-pins {
> +          function =3D "ephy2_act_led";
> +          pins =3D "gpio6";
> +        };
> +
> +        pinctrl_ephy3_act_led: ephy3_act_led-pins {
> +          function =3D "ephy3_act_led";
> +          pins =3D "gpio7";
> +        };
> +
> +        pinctrl_serial_led: serial_led-pins {
> +          pinctrl_serial_led_data: serial_led_data-pins {
> +            function =3D "serial_led_data";
> +            pins =3D "gpio6";
> +          };
> +
> +          pinctrl_serial_led_clk: serial_led_clk-pins {
> +            function =3D "serial_led_clk";
> +            pins =3D "gpio7";
> +          };
> +        };
> +
> +        pinctrl_inet_act_led: inet_act_led-pins {
> +          function =3D "inet_act_led";
> +          pins =3D "gpio8";
> +        };
> +
> +        pinctrl_inet_fail_led: inet_fail_led-pins {
> +          function =3D "inet_fail_led";
> +          pins =3D "gpio9";
> +        };
> +
> +        pinctrl_dsl_led: dsl_led-pins {
> +          function =3D "dsl_led";
> +          pins =3D "gpio10";
> +        };
> +
> +        pinctrl_post_fail_led: post_fail_led-pins {
> +          function =3D "post_fail_led";
> +          pins =3D "gpio11";
> +        };
> +
> +        pinctrl_wlan_wps_led: wlan_wps_led-pins {
> +          function =3D "wlan_wps_led";
> +          pins =3D "gpio12";
> +        };
> +
> +        pinctrl_usb_pwron: usb_pwron-pins {
> +          function =3D "usb_pwron";
> +          pins =3D "gpio13";
> +        };
> +
> +        pinctrl_usb_device_led: usb_device_led-pins {
> +          function =3D "usb_device_led";
> +          pins =3D "gpio13";
> +        };
> +
> +        pinctrl_usb_active: usb_active-pins {
> +          function =3D "usb_active";
> +          pins =3D "gpio40";
> +        };
> +      };
> +    };
> --
> 2.20.1
>
