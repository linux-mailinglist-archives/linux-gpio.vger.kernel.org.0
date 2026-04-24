Return-Path: <linux-gpio+bounces-35507-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WHTJHsyk62nIPgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35507-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 19:13:48 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D553F461B17
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 19:13:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10FCB318F716
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 16:57:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5296C33C198;
	Fri, 24 Apr 2026 16:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RCdyJj9f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085A229BDBD;
	Fri, 24 Apr 2026 16:56:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777049816; cv=none; b=XepuVl7l6ENzyNLzasnSiLZ5foBAfyecykN81XcFGpCQvIJ8j3Xmt1ta0iVRPjmk46SJDfbS7Xi5N3awL3p53x2yMg2/WaBcjMYYA5nADo+aeVkeTybgjoFUcjnVJGMf9kapWBWlQj5ZfSP9/BkLqv4GwEyEDXvDpiGAc8Nc7M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777049816; c=relaxed/simple;
	bh=RfjkBzwZ9edtsWXWfoG26jk4sifBG9YcFnA7yXOM/ww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQQjzgmnCeG0vbM/rBZ8iaGIjGv0FmyXXJUekshZ27OTYufaQG7Xmj3Gr872qf0dQ6RlP08yRdDjYvI6yGQz5dv9luFyHuXeyLFUc0MYItU6gb30gQJ0DUHntSYg47tCtKNuFIJ7AX022hrXnIrl17ZjtbzVKhLV/nzKcfkNchA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RCdyJj9f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89D29C19425;
	Fri, 24 Apr 2026 16:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777049815;
	bh=RfjkBzwZ9edtsWXWfoG26jk4sifBG9YcFnA7yXOM/ww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RCdyJj9fNhnq2y2tvCxJyCFSzCyDtzas7v3XsVw++ruxt59N9WECEEAmQxwVhP4uh
	 OBpEWAyeCzwwuJ5f+MZ6Cp0xes6xhmJTePpo7rqgdqdqL+Ox+B5rmXz3MoLwyvK12Q
	 08XlSp1EF427rp3ToZOEI7Bi1cel6CzoP4cCRvqYq8i5S/bowjtWZwBZQTxM+hRj9a
	 kTZN1M6AkDx5Wtdj6MoOVV3+eBAYAKXXshLiFaTBkeVrUpbH01+FJSHNo9cwGMu/Se
	 yM3dEGJCtLZQH+sDsbKDf30MI5yrEAturDsSbeLBSWZc/JCaDvBheAk/AzSdSEaT85
	 L+WS20iHUr2Yw==
Date: Fri, 24 Apr 2026 17:56:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v1 11/20] dt-bindings: pinctrl: Add
 starfive,jhb100-per1-pinctrl
Message-ID: <20260424-mumps-foothill-ef122c1029c0@spud>
References: <20260424111330.702272-1-changhuang.liang@starfivetech.com>
 <20260424111330.702272-12-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+tz+siA7KtiLNcy0"
Content-Disposition: inline
In-Reply-To: <20260424111330.702272-12-changhuang.liang@starfivetech.com>
X-Rspamd-Queue-Id: D553F461B17
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35507-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	TO_DN_SOME(0.00)[]


--+tz+siA7KtiLNcy0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 04:13:21AM -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC Peripheral-1(per1) pinctrl
> controller.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

There's a lot of binding here, and I think a bunch of them have similar
questions to be answered, so I am just going to review this one for now.

> ---
>  .../pinctrl/starfive,jhb100-per1-pinctrl.yaml | 217 ++++++++++++++++++
>  1 file changed, 217 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh=
b100-per1-pinctrl.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-pe=
r1-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100=
-per1-pinctrl.yaml
> new file mode 100644
> index 000000000000..b2af4df874df
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-per1-pinc=
trl.yaml
> @@ -0,0 +1,217 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-per1-pinctrl.=
yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JHB100 Peripheral-1 Pin Controller
> +
> +description: |
> +  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
> +
> +  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0,=
 per1,
> +  per2, per2pok, per3, adc0, adc1, emmc, and vga.
> +  This document provides an overview of the "per1" pinctrl domain.
> +
> +  The "per1" domain has a pin controller which provides
> +  - function selection for GPIO pads.
> +  - GPIO pad configuration.
> +  - GPIO interrupt handling.
> +
> +  In the Peripheral-1 Pin Controller, there are 36 multi-function GPIO_P=
ADs. Each of them
> +  can be multiplexed to several peripherals through function selection. =
Each iopad has a
> +  maximum of up to 3 functions - 0, 1, and 2. Function 0 is the default =
function which is
> +  generally the GPIO function. Function 1 and 2 are the alternate functi=
ons or peripheral
> +  signals that can be routed to the iopad. The function selection can be=
 carried out by
> +  writing the function number to the iopad function select register.
> +  Each iopad is configurable with parameters such as input-enable, inter=
nal pull-up/pull-down
> +  bias, drive strength, schmitt trigger, slew rate, and debounce width.
> +
> +  This domain contains 4 IO groups which support voltage levels 1.8V and=
 3.3V
> +  gpioe-spi - comprises PAD_GPIO_C0 through PAD_GPIO_C4.
> +  gpioe-qspi0 - comprises PAD_GPIO_C5 through PAD_GPIO_C11.
> +  gpioe-qspi1 - comprises PAD_GPIO_C12 through PAD_GPIO_C19.
> +  gpioe-qspi2 - comprises PAD_GPIO_C20 through PAD_GPIO_C27.
> +
> +  Each of the above IO groups must be configured with a voltage setting =
that matches the external
> +  voltage level provided to the IO group.
> +
> +maintainers:
> +  - Alex Soo <yuklin.soo@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: starfive,jhb100-per1-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  gpio-line-names: true
> +
> +  gpioe-spi-vref:

Why are these custom properties required?
This sounds like the sort of information that could be gleaned from the
"power-source" property.

> +    description: |
> +        Voltage reference value for the IO group "gpioe-spi"
> +        0: voltage reference value for 3.3V
> +        2: voltage reference value for 1.8V
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 2]
> +    default: 0
> +
> +  gpioe-qspi0-vref:
> +    description: |
> +        Voltage reference value for the IO group "gpioe-qspi0"
> +        0: voltage reference value for 3.3V
> +        2: voltage reference value for 1.8V
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 2]
> +    default: 0
> +
> +  gpioe-qspi1-vref:
> +    description: |
> +        Voltage reference value for the IO group "gpioe-qspi1"
> +        0: voltage reference value for 3.3V
> +        2: voltage reference value for 1.8V
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 2]
> +    default: 0
> +
> +  gpioe-qspi2-vref:
> +    description: |
> +        Voltage reference value for the IO group "gpioe-qspi2"
> +        0: voltage reference value for 3.3V
> +        2: voltage reference value for 1.8V
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 2]
> +    default: 0
> +
> +patternProperties:
> +  '-grp$':
> +    type: object
> +    additionalProperties: false
> +    patternProperties:
> +      '-pins$':
> +        type: object
> +        description: |
> +          A pinctrl node should contain at least one subnode representin=
g the
> +          pinctrl groups available in the domain. Each subnode will list=
 the
> +          pins it needs, and how they should be configured, with regard =
to
> +          function selection, bias, input enable/disable, input schmitt
> +          trigger enable/disable, slew-rate and drive strength.
> +        allOf:
> +          - $ref: /schemas/pinctrl/pincfg-node.yaml
> +          - $ref: /schemas/pinctrl/pinmux-node.yaml
> +        unevaluatedProperties: false
> +
> +        properties:
> +          pinmux:
> +            description: |
> +              The list of GPIOs and their function select.
> +              The PINMUX macros are used to configure the
> +              function selection.

Why is the pinmux property needed?
Can you use pins and function instead?

Looking at the defines that you have added, it appears that lots of
defines for the same peripheral share the same numerical values,
suggesting that across peripheral, all (or most) pins would share the
same mux setting/"function select", suggesting that pins/function would
suffice.

I'd like to see some justification for pinmux being the right solution
here, like the "function select" used by one peripheral being
significantly different for many of its pins.

> +
> +          bias-disable: true
> +
> +          bias-pull-up:
> +            type: boolean
> +
> +          bias-pull-down:
> +            type: boolean
> +
> +          drive-strength:
> +            enum: [ 2, 4, 8, 12 ]
> +
> +          drive-strength-microamp:
> +            enum: [ 2000, 4000, 8000, 12000 ]
> +
> +          input-enable: true
> +
> +          input-disable: true
> +
> +          input-schmitt-enable: true
> +
> +          input-schmitt-disable: true
> +
> +          slew-rate:
> +            enum: [ 0, 1 ]
> +            default: 0
> +            description: |
> +                0: slow (half frequency)
> +                1: fast
> +
> +          starfive,debounce-width:
> +            $ref: /schemas/types.yaml#/definitions/uint32
> +            default: 0
> +            description:
> +              Debounce width 0 =3D Disabled, Others =3D 80ns*N stages

This sounds like it should be called "debounce-stages".

> +
> +          starfive,drive-i2c-fast-mode:
> +            type: boolean
> +            description:
> +              Enable I2C fast mode drive
> +
> +          starfive,drive-i2c-fast-mode-plus:
> +            type: boolean
> +            description:
> +              Enable I2C fast mode plus drive
> +
> +          starfive,i2c-open-drain-pull-up-ohm:
> +            $ref: /schemas/types.yaml#/definitions/uint32

The unit of resistance is "ohms" in dt-schema, if you swap to that you
won't need the $ref.

> +            description:
> +              open drain pull-up select
> +            enum: [600, 900, 1200, 2000]
> +            default: 600
> +
> +required:
> +  - compatible
> +  - reg
> +  - resets
> +  - interrupts
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - gpio-ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +        #address-cells =3D <2>;
> +        #size-cells =3D <2>;
> +
> +        pinctrl_per1: pinctrl@11b42000 {

Drop the label here, since there's no users.


Cheers,
Conor.

> +            compatible =3D "starfive,jhb100-per1-pinctrl";
> +            reg =3D <0x0 0x11b42000 0x0 0x800>;
> +            resets =3D <&per1crg 0>;
> +            interrupts =3D <61>;
> +            interrupt-controller;
> +            #interrupt-cells =3D <2>;
> +            gpio-controller;
> +            #gpio-cells =3D <2>;
> +            gpio-ranges =3D <&pinctrl_per1 0 0 36>;
> +        };
> +    };
> --=20
> 2.25.1
>=20

--+tz+siA7KtiLNcy0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeugzwAKCRB4tDGHoIJi
0v3fAQDhkw+Bzt68Na1/fsB1WpDiJ8OeoomVlu6nLURmbFc5SgEAzKaRkiDAuMXN
8o8+1ioxYj5PRdVnKVUQX4k0+vO/FQs=
=9eal
-----END PGP SIGNATURE-----

--+tz+siA7KtiLNcy0--

