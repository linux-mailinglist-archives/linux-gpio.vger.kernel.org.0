Return-Path: <linux-gpio+bounces-36865-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hRAFAiEaBmoNewIAu9opvQ
	(envelope-from <linux-gpio+bounces-36865-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 20:53:21 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 57C3B546130
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 20:53:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 60FDE300A133
	for <lists+linux-gpio@lfdr.de>; Thu, 14 May 2026 18:52:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90D8D391835;
	Thu, 14 May 2026 18:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bQLvdkjB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C5833DEE0;
	Thu, 14 May 2026 18:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778784758; cv=none; b=DKXPiOKwnL2QwQ+OQpEFXftZ+0mIAYPs46RllTAZgu0qtDvfXwahkZq7hSVnCHwMJZUVaBqUx4kYMfx7025BOmn8rcNCvAAl28j3uKtyR0O0vRZ9p/azdf5eaBOItQhiRhPqW4X6X6A6+grtkLGbiZOpnC+aux1ENI6BermtWhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778784758; c=relaxed/simple;
	bh=EjjckhqKrEpt2tuinU7XDjnKyA1wZpkbU4cCxxKq8Zk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NP9Ufz20zgaJ2yZh7JSf+PvehXOyQsPix+D3RJceubetdRqjlFNVh9kxs7n93ocuvc9PJPH5up1dSd8UGOQwjVMsfgw8+EMJE757uEBHv+UWqSiNOkh+zjrp3mN2CDFi3cvFdnsHF91crKsmp8wFmMfEdxiixQb9RRUnXKwL9Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bQLvdkjB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7414C2BCB3;
	Thu, 14 May 2026 18:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778784758;
	bh=EjjckhqKrEpt2tuinU7XDjnKyA1wZpkbU4cCxxKq8Zk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bQLvdkjBKplXHSyQPsPUVaUpVCYaGm4kIsGxEJ7c6WznxtKsJ1j4izEIn86kox3Ia
	 lqitdPJcFQrEdXTPdIFQSqCwWXeAg22Nc/bl08Cbv/3EoYdt8nNWe0+U/+g4xVJ+3m
	 aYNzhw73c7lNR1RUkUP2UQa/FCuTb8rzAYswbS7bH8Z6ziu/jbyGCmpxcpG96cgkJX
	 KRgvf/eV5hoYJ/EiRh9+KBOclon3NVRZ2qD2X8qWL1ysjRIDCIjeOMBoXTnfUo9+tu
	 cnaFFSAAwuWoTRtzq259NMaLU6uZx7z7S+EGy4oC2boBpeTGKJIYtr8mdTTExy8D1l
	 xbEdEZ29napGg==
Date: Thu, 14 May 2026 19:52:32 +0100
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
Subject: Re: [PATCH v2 04/22] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Message-ID: <20260514-undermost-gray-6c9967b363a3@spud>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
 <20260514111218.94519-5-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qQBf5GEmk4YQ2r9u"
Content-Disposition: inline
In-Reply-To: <20260514111218.94519-5-changhuang.liang@starfivetech.com>
X-Rspamd-Queue-Id: 57C3B546130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36865-lists,linux-gpio=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
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
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,starfivetech.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,0.199.149.192:email]
X-Rspamd-Action: no action


--qQBf5GEmk4YQ2r9u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 04:12:00AM -0700, Changhuang Liang wrote:
> Add pinctrl bindings for StarFive JHB100 SoC System-0(sys0) pinctrl
> controller.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../pinctrl/starfive,jhb100-sys0-pinctrl.yaml | 175 ++++++++++++++++++
>  .../pinctrl/starfive,jhb100-pinctrl.h         |  17 ++
>  2 files changed, 192 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh=
b100-sys0-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sy=
s0-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100=
-sys0-pinctrl.yaml
> new file mode 100644
> index 000000000000..21d3693587fd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinc=
trl.yaml
> @@ -0,0 +1,175 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/starfive,jhb100-sys0-pinctrl.=
yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JHB100 System-0 Pin Controller
> +
> +description: |
> +  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
> +
> +  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2, per0,=
 per1,
> +  per2, per2pok, per3, adc0, adc1, emmc, and vga.
> +  This document provides an overview of the "sys0" pinctrl domain.
> +
> +  The "sys0" domain has a pin controller which provides
> +  - function selection for GPIO pads.
> +  - GPIO pad configuration.
> +  - GPIO interrupt handling.
> +
> +  In the SYS0 Pin Controller, there are 4 multi-function GPIO_PADs. Each=
 of
> +  them can be multiplexed to different hardware blocks through function
> +  selection and each iopad has a maximum of up to 2 functions - 0 and 1.
> +  Function 0 is the default function which is generally the GPIO function
> +  (or occasionally, it can be a peripheral signal).
> +  Function 1 is the alternate function or peripheral signal that can be
> +  routed to the iopad. The function selection is carried out by writing
> +  the function number to the iopad function select register.
> +
> +  Each iopad is configurable with parameters such as input-enable, inter=
nal
> +  pull-up/pull-down bias, drive strength, schmitt trigger, slew rate,  i=
nput
> +  debounce nanoseconds, power source and drive type  (open-drain or push=
-pull).
> +
> +maintainers:
> +  - Alex Soo <yuklin.soo@starfivetech.com>

Why is Alex the maintainer when you are the sole author?

> +
> +properties:
> +  compatible:
> +    items:
> +      - const: starfive,jhb100-sys0-pinctrl
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
> +    const: 3
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 3
> +
> +  gpio-ranges: true
> +
> +  gpio-line-names: true
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
> +          trigger enable/disable, slew-rate, input debounce nanoseconds,
> +          drive-open-drain, drive-push-pull, power-source and drive-stre=
ngth.
> +        allOf:
> +          - $ref: /schemas/pinctrl/pincfg-node.yaml
> +          - $ref: /schemas/pinctrl/pinmux-node.yaml
> +        unevaluatedProperties: false

I think this should be additionalProperties, since you're citing all the
properties you do support below.

> +
> +        properties:
> +          pins:
> +            description:
> +              The list of IOs that properties in the pincfg node apply t=
o.
> +
> +          function:
> +            description:
> +              A string containing the name of the function to mux for th=
ese
> +              pins.
> +            enum: [ auxpwrgood, gpio, hbled, pe2rst_out ]
> +
> +          bias-disable: true
> +
> +          bias-pull-down:
> +            type: boolean
> +
> +          bias-pull-up:
> +            oneOf:
> +              - type: boolean
> +              - enum: [ 600, 900, 1200, 2000 ]
> +                description: Pull up RSEL type resistance values (in ohm=
s)
> +            description:
> +              For normal pull up type there is no need to specify a resi=
stance
> +              value, hence this can be specified as a boolean property.
> +              For RSEL pull up type a resistance value (in ohms) can be =
added.
> +
> +          drive-open-drain: true
> +
> +          drive-push-pull: true
> +
> +          drive-strength:
> +            enum: [ 2, 4, 8, 12 ]
> +
> +          drive-strength-microamp:
> +            enum: [ 2000, 4000, 8000, 12000 ]
> +
> +          input-debounce-nanoseconds:
> +            minimum: 0
> +            maximum: 4294967295
> +
> +          input-disable: true
> +
> +          input-enable: true
> +
> +          input-schmitt-enable: true
> +
> +          input-schmitt-disable: true
> +
> +          power-source:
> +             enum: [ 0, 1, 2 ]
> +
> +          slew-rate:
> +            enum: [ 0, 1 ]
> +            default: 0
> +            description: |
> +                0: slow (half frequency)
> +                1: fast
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
> +        pinctrl_sys0: pinctrl@13080000 {
> +            compatible =3D "starfive,jhb100-sys0-pinctrl";
> +            reg =3D <0x0 0x13080000 0x0 0x800>;
> +            resets =3D <&sys0crg 2>;
> +            interrupts =3D <56>;
> +            interrupt-controller;
> +            #interrupt-cells =3D <3>;
> +            gpio-controller;
> +            #gpio-cells =3D <3>;
> +            gpio-ranges =3D <&pinctrl_sys0 0 0 0 4>;
> +        };
> +    };
> diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h b/incl=
ude/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> new file mode 100644
> index 000000000000..6d8f5516a178
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> +/*
> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> + *
> + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> + */
> +
> +#ifndef __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
> +#define __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
> +
> +/* sys0 pad numbers */
> +#define PADNUM_SYS0_GPIO_A0				0
> +#define PADNUM_SYS0_GPIO_A1				1
> +#define PADNUM_SYS0_GPIO_A2				2
> +#define PADNUM_SYS0_GPIO_A3				3

Does this provide any actual value? Across the whole series, most
numbers you put in this binding headers do not appear in any drivers
at all. Seems like these defines should appear in the dts directly?

pw-bot: changes-requested

Cheers,
Conor.

> +
> +#endif
> --=20
> 2.25.1
>=20

--qQBf5GEmk4YQ2r9u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagYZ8AAKCRB4tDGHoIJi
0rX3AQDZ/MD1411Omq0iweCXVv8GChspy99U/9p7n6u8LvDW/QD+M2IaZxzEFcB9
9eFs8+joPj8M0GHlb0gA8KKdbMUNxwA=
=k4Xv
-----END PGP SIGNATURE-----

--qQBf5GEmk4YQ2r9u--

