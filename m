Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9A7C1E90AC
	for <lists+linux-gpio@lfdr.de>; Sat, 30 May 2020 13:04:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728071AbgE3LEp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 30 May 2020 07:04:45 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:40094 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727947AbgE3LEo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 30 May 2020 07:04:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1590836681; h=from:from:sender:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YjKCJ0RKBPq+ZLWgI0sSnhwddRzJYbPqfTycyNegHHA=;
        b=hKqIgArY3Qz31Jz7Z5FSPBZQA7Wq0yYnCcAXAI4DLvRVWkwwDxxMDDgFzdI1uxoKaeYoZQ
        9byBGT5tZ4s2tzTOtRJgCmGqEc5pFQupBQ7mCW4JLvjnV1v+BojxV34S5vYYGzoAGL/+hG
        Ep6KuqIxiR4vN9ZPLCE2RDvW2B+OvVk=
Date:   Sat, 30 May 2020 13:04:30 +0200
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: Convert ingenic,pinctrl.txt
 to YAML
To:     Rob Herring <robh@kernel.org>
Cc:     Boris Brezillon <bbrezillon@kernel.org>, od@zcrc.me,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org, linux-gpio@vger.kernel.org
Message-Id: <IF55BQ.VGY5UC52BWPU1@crapouillou.net>
In-Reply-To: <20200528214243.GA711753@bogus>
References: <20200520002234.418025-1-paul@crapouillou.net>
        <20200528214243.GA711753@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Rob,

Le jeu. 28 mai 2020 =E0 15:42, Rob Herring <robh@kernel.org> a =E9crit :
> On Wed, May 20, 2020 at 02:22:32AM +0200, Paul Cercueil wrote:
>>  Convert the ingenic,pinctrl.txt doc file to ingenic,pinctrl.yaml.
>>=20
>>  In the process, some compatible strings now require a fallback, as=20
>> the
>>  corresponding SoCs are pin-compatible with their fallback variant.
>>=20
>>  Signed-off-by: Paul Cercueil <paul@crapouillou.net>
>>  ---
>>=20
>>  Notes:
>>      v2: - Use 'pinctrl' instead of 'pin-controller' as the node name
>>          - remove 'additionalProperties: false' since we will have=20
>> pin conf nodes
>=20
> You need to describe those nodes and not just allow anything.

These nodes don't have any constraint on their name, so I would need a=20
wildcard property for children nodes. That's not something I can=20
express in YAML right now, is it?

-Paul

>>=20
>>   .../bindings/pinctrl/ingenic,pinctrl.txt      |  81 -----------
>>   .../bindings/pinctrl/ingenic,pinctrl.yaml     | 136=20
>> ++++++++++++++++++
>>   2 files changed, 136 insertions(+), 81 deletions(-)
>>   delete mode 100644=20
>> Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.txt
>>   create mode 100644=20
>> Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
>=20
>=20
>>  diff --git=20
>> a/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml=20
>> b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
>>  new file mode 100644
>>  index 000000000000..5be2b1e95b36
>>  --- /dev/null
>>  +++ b/Documentation/devicetree/bindings/pinctrl/ingenic,pinctrl.yaml
>>  @@ -0,0 +1,136 @@
>>  +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>  +%YAML 1.2
>>  +---
>>  +$id: http://devicetree.org/schemas/pinctrl/ingenic,pinctrl.yaml#
>>  +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>  +
>>  +title: Ingenic SoCs pin controller devicetree bindings
>>  +
>>  +description: >
>>  +  Please refer to pinctrl-bindings.txt in this directory for=20
>> details of the
>>  +  common pinctrl bindings used by client devices, including the=20
>> meaning of the
>>  +  phrase "pin configuration node".
>>  +
>>  +  For the Ingenic SoCs, pin control is tightly bound with GPIO=20
>> ports. All pins
>>  +  may be used as GPIOs, multiplexed device functions are=20
>> configured within the
>>  +  GPIO port configuration registers and it is typical to refer to=20
>> pins using the
>>  +  naming scheme "PxN" where x is a character identifying the GPIO=20
>> port with
>>  +  which the pin is associated and N is an integer from 0 to 31=20
>> identifying the
>>  +  pin within that GPIO port. For example PA0 is the first pin in=20
>> GPIO port A,
>>  +  and PB31 is the last pin in GPIO port B. The JZ4740, the X1000=20
>> and the X1830
>>  +  contains 4 GPIO ports, PA to PD, for a total of 128 pins. The=20
>> JZ4760, the
>>  +  JZ4770 and the JZ4780 contains 6 GPIO ports, PA to PF, for a=20
>> total of 192
>>  +  pins.
>>  +
>>  +maintainers:
>>  +  - Paul Cercueil <paul@crapouillou.net>
>>  +
>>  +properties:
>>  +  nodename:
>=20
> It's $nodename as that's not a real property. And that will expose the
> error in the example for you.
>=20
>>  +    pattern: "^pinctrl@[0-9a-f]+$"
>>  +
>>  +  compatible:
>>  +    oneOf:
>>  +      - enum:
>>  +        - ingenic,jz4740-pinctrl
>>  +        - ingenic,jz4725b-pinctrl
>>  +        - ingenic,jz4760-pinctrl
>>  +        - ingenic,jz4770-pinctrl
>>  +        - ingenic,jz4780-pinctrl
>>  +        - ingenic,x1000-pinctrl
>>  +        - ingenic,x1500-pinctrl
>>  +        - ingenic,x1830-pinctrl
>>  +      - items:
>>  +        - const: ingenic,jz4760b-pinctrl
>>  +        - const: ingenic,jz4760-pinctrl
>>  +      - items:
>>  +        - const: ingenic,x1000e-pinctrl
>>  +        - const: ingenic,x1000-pinctrl
>>  +
>>  +  reg:
>>  +    maxItems: 1
>>  +
>>  +  "#address-cells":
>>  +    const: 1
>>  +
>>  +  "#size-cells":
>>  +    const: 0
>>  +
>>  +patternProperties:
>>  +  "^gpio@[0-9]$":
>>  +    type: object
>>  +    properties:
>>  +      compatible:
>>  +        enum:
>>  +          - ingenic,jz4740-gpio
>>  +          - ingenic,jz4725b-gpio
>>  +          - ingenic,jz4760-gpio
>>  +          - ingenic,jz4770-gpio
>>  +          - ingenic,jz4780-gpio
>>  +          - ingenic,x1000-gpio
>>  +          - ingenic,x1500-gpio
>>  +          - ingenic,x1830-gpio
>>  +
>>  +      reg:
>>  +        items:
>>  +          - description: The GPIO bank number
>>  +
>>  +      gpio-controller: true
>>  +
>>  +      "#gpio-cells":
>>  +        const: 2
>>  +
>>  +      gpio-ranges:
>>  +        maxItems: 1
>>  +
>>  +      interrupt-controller: true
>>  +
>>  +      "#interrupt-cells":
>>  +        const: 2
>>  +        description:
>>  +          Refer to ../interrupt-controller/interrupts.txt for more=20
>> details.
>>  +
>>  +      interrupts:
>>  +        maxItems: 1
>>  +
>>  +    required:
>>  +      - compatible
>>  +      - reg
>>  +      - gpio-controller
>>  +      - "#gpio-cells"
>>  +      - interrupts
>>  +      - interrupt-controller
>>  +      - "#interrupt-cells"
>>  +
>>  +    additionalProperties: false
>>  +
>>  +required:
>>  +  - compatible
>>  +  - reg
>>  +  - "#address-cells"
>>  +  - "#size-cells"
>>  +
>>  +examples:
>>  +  - |
>>  +    pin-controller@10010000 {
>>  +      compatible =3D "ingenic,jz4770-pinctrl";
>>  +      reg =3D <0x10010000 0x600>;
>>  +
>>  +      #address-cells =3D <1>;
>>  +      #size-cells =3D <0>;
>>  +
>>  +      gpio@0 {
>>  +        compatible =3D "ingenic,jz4770-gpio";
>>  +        reg =3D <0>;
>>  +
>>  +        gpio-controller;
>>  +        gpio-ranges =3D <&pinctrl 0 0 32>;
>>  +        #gpio-cells =3D <2>;
>>  +
>>  +        interrupt-controller;
>>  +        #interrupt-cells =3D <2>;
>>  +
>>  +        interrupt-parent =3D <&intc>;
>>  +        interrupts =3D <17>;
>>  +      };
>>  +    };
>>  --
>>  2.26.2
>>=20


