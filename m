Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2EB7334561
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Mar 2021 18:47:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230477AbhCJRq3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Mar 2021 12:46:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:51140 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231359AbhCJRp5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Mar 2021 12:45:57 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8CAF464F48;
        Wed, 10 Mar 2021 17:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615398356;
        bh=U6ytBYeBdD/aDMKjPInZo1ngnvAJ2clewIczyr53hII=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=ef/5KVEx3LQWCSTPR8v5neJRPWW6VTuYaluLiz7ZHXiAGKCium7wIA4OXuCDE8x/d
         HRlC4LmVN8XgiZzZ+GK/iGt/sm+orLuXJklKG2iimojcviH1d6oqTqu46KmFRdqJrN
         LGLYUrxClfbnfzrevnOdZss7UxbAdxf6IDX7w3hUmqgR3J3QiYNBrbExUnZLHA3K04
         D47OSC5tVcDt0EXOHGxRM9PNMAsQOTHzO7IkfIZ9056XgG8pgFpjrt7IS4dbvde3Rp
         L163gKgFFKP6lM2mKlMZ6wVcW0Kaa5KDnNS07LSn8YozML00I9GVGY0tiPaoohpvaT
         FoEmX4ow28JUg==
Received: by mail-ej1-f50.google.com with SMTP id p8so40387977ejb.10;
        Wed, 10 Mar 2021 09:45:56 -0800 (PST)
X-Gm-Message-State: AOAM533M0Ui/IlQW9u00uZnZhWyL1EuKH/XKQbuJU/D6QfKjHl5RN2jJ
        niQwV8kUV6TfF+mAIHRDVjF25dThVZQi3mWpRQ==
X-Google-Smtp-Source: ABdhPJzhn9gyePa9pqaI1P5IPJEuu0+8OodWzXS1eP0nJjTFn5KQIDk7+vF34ai0qyk/n4U0G+vmCytDzNCpy+CfnXk=
X-Received: by 2002:a17:906:25c4:: with SMTP id n4mr4886767ejb.359.1615398355126;
 Wed, 10 Mar 2021 09:45:55 -0800 (PST)
MIME-Version: 1.0
References: <20210310125504.31886-1-noltari@gmail.com> <20210310125504.31886-5-noltari@gmail.com>
In-Reply-To: <20210310125504.31886-5-noltari@gmail.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Wed, 10 Mar 2021 10:45:43 -0700
X-Gmail-Original-Message-ID: <CAL_JsqK4b+U7cVb04+moB4biGVFC4mr3VGx70KdQKitiCGdtnQ@mail.gmail.com>
Message-ID: <CAL_JsqK4b+U7cVb04+moB4biGVFC4mr3VGx70KdQKitiCGdtnQ@mail.gmail.com>
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
        devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 10, 2021 at 5:55 AM =C3=81lvaro Fern=C3=A1ndez Rojas
<noltari@gmail.com> wrote:
>
> Add binding documentation for the pincontrol core found in BCM6328 SoCs.
>
> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
> Co-developed-by: Jonas Gorski <jonas.gorski@gmail.com>
> Signed-off-by: =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> ---
>  v6: add changes suggested by Rob Herring
>  v5: change Documentation to dt-bindings in commit title
>  v4: no changes
>  v3: add new gpio node
>  v2: remove interrupts
>
>  .../pinctrl/brcm,bcm6328-pinctrl.yaml         | 174 ++++++++++++++++++
>  1 file changed, 174 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm632=
8-pinctrl.yaml
>
> diff --git a/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinct=
rl.yaml b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.ya=
ml
> new file mode 100644
> index 000000000000..471f6efa1754
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/brcm,bcm6328-pinctrl.yaml
> @@ -0,0 +1,174 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/brcm,bcm6328-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Broadcom BCM6328 pin controller
> +
> +maintainers:
> +  - =C3=81lvaro Fern=C3=A1ndez Rojas <noltari@gmail.com>
> +  - Jonas Gorski <jonas.gorski@gmail.com>
> +
> +description: |+
> +  The pin controller node should be the child of a syscon node.
> +
> +  Refer to the the bindings described in
> +  Documentation/devicetree/bindings/mfd/syscon.yaml
> +
> +properties:
> +  compatible:
> +    const: brcm,bcm6328-pinctrl
> +
> +  gpio:
> +    type: object
> +    properties:
> +      compatible:
> +        const: brcm,bcm6328-gpio
> +
> +      data:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: |
> +          Offset in the register map for the data register (in bytes).
> +
> +      dirout:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: |
> +          Offset in the register map for the dirout register (in bytes).
> +
> +      gpio-controller: true
> +
> +      "#gpio-cells":
> +        const: 2
> +
> +      gpio-ranges:
> +        maxItems: 1
> +
> +    required:
> +      - gpio-controller
> +      - gpio-ranges
> +      - '#gpio-cells'
> +
> +    additionalProperties: false
> +
> +patternProperties:
> +  '^.*-pins$':
> +    if:
> +      type: object
> +    then:
> +      properties:
> +        function:
> +          $ref: "pinmux-node.yaml#/properties/function"
> +          enum: [ serial_led_data, serial_led_clk, inet_act_led, pcie_cl=
kreq,
> +                  led, ephy0_act_led, ephy1_act_led, ephy2_act_led,
> +                  ephy3_act_led, hsspi_cs1, usb_device_port, usb_host_po=
rt ]
> +
> +        pins:
> +          $ref: "pinmux-node.yaml#/properties/pins"
> +          enum: [ gpio6, gpio7, gpio11, gpio16, gpio17, gpio18, gpio19,
> +                  gpio20, gpio25, gpio26, gpio27, gpio28, hsspi_cs1,
> +                  usb_port1 ]
> +
> +required:
> +  - compatible
> +  - gpio
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    gpio_cntl@10000080 {
> +      compatible =3D "brcm,bcm6328-gpio-controller", "syscon", "simple-m=
fd";

You just added "brcm,bcm6328-gpio-controller", it would need to be document=
ed.

> +      reg =3D <0x10000080 0x80>;
> +
> +      pinctrl: pinctrl {
> +        compatible =3D "brcm,bcm6328-pinctrl";
> +
> +        gpio {
> +          compatible =3D "brcm,bcm6328-gpio";

I'm still trying to understand why you need 3 levels of nodes here?
The gpio controller contains a pin controller plus other undefined
functions (because of 'syscon') and the pin controller contains a gpio
controller?

I think "brcm,bcm6328-gpio-controller" and "brcm,bcm6328-pinctrl"
should be a single node.

> +          data =3D <0xc>;
> +          dirout =3D <0x4>;

This looks similar to the brcm,bcm6345-gpio.txt binding which then
uses the gpio-mmio driver. Defining addresses with 'reg' is much
preferred over custom properties. That binding also captures the bank
size.

Rob
