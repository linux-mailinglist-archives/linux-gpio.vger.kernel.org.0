Return-Path: <linux-gpio+bounces-36889-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGloIgbKBmrynwIAu9opvQ
	(envelope-from <linux-gpio+bounces-36889-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 09:23:50 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C5F54A804
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 09:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1A9053004619
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 07:23:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E12243E6381;
	Fri, 15 May 2026 07:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="U/QxoAct"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E664E3E5562;
	Fri, 15 May 2026 07:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778829806; cv=none; b=V2Cr+lP8JTNmE4JX49NvBujG/l6x2uPZxFKUVXhtotWszrJwB8luOihiFjByBVtmWjWW6tBWzmhbr95CD4FzMpoIFzP7sUs782tgXPV3OzidsoK7tRWDujNQ/ap8amwhKwC2tcW0fyJR6pScHitMNvbtmWBRKH5gXCPLcZgzT+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778829806; c=relaxed/simple;
	bh=wPER1cxZKqcS1CaNfmttXC5wbLdKQ5JLuGqR3y/2TP8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E5/gU/K7+DkpRDIaD0IvRpQ/bVUcN8tslV/4lck8NpxtZlZw6S6XY0l614yt19CZg7KbXO8O4yRzDPD1nzLWONn1RLH7EpjKPt3wRy2TpjQVQl6Yg+VW1bBa/RA7Gv7wgifmlGa2a0wiCJQ6ugwE0SX/VOt1iofTZln2TCmKwOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=U/QxoAct; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778829805; x=1810365805;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wPER1cxZKqcS1CaNfmttXC5wbLdKQ5JLuGqR3y/2TP8=;
  b=U/QxoActP6q+8DAkX9vaf5u70QnFwbOl7MrkXUC/RiqqP4uEVWftFE2Z
   NUSInkhQgoMAvstLsR4T4YV5H3yEmznKZhfvm1DcICfR4LK0+5oA/NDZq
   zZ8VK0ryKepqisbqyVNpUrgBrwXfFrQkWT9k0Vg9TPcFe+aqvxVQDPXq2
   rzGMF71br0zZkthS3cULmqWcg9Ud2YiijELg5cCL57YUxt0/Xz2MMxI6I
   3m5WIdQo6lOQ8YUW5KPsfTDZha9+fhTtH7HTWlBHrcyuvUeM5p259VfuM
   z1uVlbpi+poOWWZ6TNfXiGxeUI/HXZV1hsLHv7fo7X0ZSN51zFOfRIw4+
   A==;
X-CSE-ConnectionGUID: sZxHqqzyRZaW9VpTQfRRCQ==
X-CSE-MsgGUID: NN/PVGBKTl20iRvOU+FNsA==
X-IronPort-AV: E=Sophos;i="6.23,236,1770620400"; 
   d="asc'?scan'208";a="56782864"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 15 May 2026 00:23:24 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 15 May 2026 00:23:23 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 15 May 2026 00:23:20 -0700
Date: Fri, 15 May 2026 08:22:42 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
CC: Conor Dooley <conor@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Paul
 Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt
	<palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel
	<p.zabel@pengutronix.de>, Bartosz Golaszewski <brgl@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Lianfeng
 Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v2 04/22] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Message-ID: <20260515-eligible-greasily-257029ab1720@wendy>
References: <20260514111218.94519-1-changhuang.liang@starfivetech.com>
 <20260514111218.94519-5-changhuang.liang@starfivetech.com>
 <20260514-undermost-gray-6c9967b363a3@spud>
 <ZQ4PR01MB1202BD7677ACAF6EE18D062AF2042@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sceamiqloubMEw/P"
Content-Disposition: inline
In-Reply-To: <ZQ4PR01MB1202BD7677ACAF6EE18D062AF2042@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
X-Rspamd-Queue-Id: B6C5F54A804
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36889-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[microchip.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor.dooley@microchip.com,linux-gpio@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.199.149.192:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,starfivetech.com:email,devicetree.org:url,microchip.com:dkim]
X-Rspamd-Action: no action

--sceamiqloubMEw/P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 06:10:28AM +0000, Changhuang Liang wrote:
> Hi, Conor
>=20
> Thanks for the review.
>=20
> > On Thu, May 14, 2026 at 04:12:00AM -0700, Changhuang Liang wrote:
> > > Add pinctrl bindings for StarFive JHB100 SoC System-0(sys0) pinctrl
> > > controller.
> > >
> > > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > > ---
> > >  .../pinctrl/starfive,jhb100-sys0-pinctrl.yaml | 175 ++++++++++++++++=
++
> > >  .../pinctrl/starfive,jhb100-pinctrl.h         |  17 ++
> > >  2 files changed, 192 insertions(+)
> > >  create mode 100644
> > > Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinctrl
> > > .yaml  create mode 100644
> > > include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> > >
> > > diff --git
> > > a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinct
> > > rl.yaml
> > > b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-pinct
> > > rl.yaml
> > > new file mode 100644
> > > index 000000000000..21d3693587fd
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0-p
> > > +++ inctrl.yaml
> > > @@ -0,0 +1,175 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause %YAML 1.2
> > > +---
> > > +$id:
> > > +http://devicetree.org/schemas/pinctrl/starfive,jhb100-sys0-pinctrl.ya
> > > +ml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: StarFive JHB100 System-0 Pin Controller
> > > +
> > > +description: |
> > > +  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Lt=
d.
> > > +
> > > +  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2,
> > > + per0, per1,  per2, per2pok, per3, adc0, adc1, emmc, and vga.
> > > +  This document provides an overview of the "sys0" pinctrl domain.
> > > +
> > > +  The "sys0" domain has a pin controller which provides
> > > +  - function selection for GPIO pads.
> > > +  - GPIO pad configuration.
> > > +  - GPIO interrupt handling.
> > > +
> > > +  In the SYS0 Pin Controller, there are 4 multi-function GPIO_PADs.
> > > + Each of  them can be multiplexed to different hardware blocks
> > > + through function  selection and each iopad has a maximum of up to 2
> > functions - 0 and 1.
> > > +  Function 0 is the default function which is generally the GPIO
> > > + function  (or occasionally, it can be a peripheral signal).
> > > +  Function 1 is the alternate function or peripheral signal that can
> > > + be  routed to the iopad. The function selection is carried out by
> > > + writing  the function number to the iopad function select register.
> > > +
> > > +  Each iopad is configurable with parameters such as input-enable,
> > > + internal  pull-up/pull-down bias, drive strength, schmitt trigger,
> > > + slew rate,  input  debounce nanoseconds, power source and drive type
> > (open-drain or push-pull).
> > > +
> > > +maintainers:
> > > +  - Alex Soo <yuklin.soo@starfivetech.com>
> >=20
> > Why is Alex the maintainer when you are the sole author?
> >=20
> > > +
> > > +properties:
> > > +  compatible:
> > > +    items:
> > > +      - const: starfive,jhb100-sys0-pinctrl
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 1
> > > +
> > > +  resets:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    maxItems: 1
> > > +
> > > +  interrupt-controller: true
> > > +
> > > +  '#interrupt-cells':
> > > +    const: 3
> > > +
> > > +  gpio-controller: true
> > > +
> > > +  '#gpio-cells':
> > > +    const: 3
> > > +
> > > +  gpio-ranges: true
> > > +
> > > +  gpio-line-names: true
> > > +
> > > +patternProperties:
> > > +  '-grp$':
> > > +    type: object
> > > +    additionalProperties: false
> > > +    patternProperties:
> > > +      '-pins$':
> > > +        type: object
> > > +        description: |
> > > +          A pinctrl node should contain at least one subnode
> > representing the
> > > +          pinctrl groups available in the domain. Each subnode will =
list
> > the
> > > +          pins it needs, and how they should be configured, with reg=
ard
> > to
> > > +          function selection, bias, input enable/disable, input schm=
itt
> > > +          trigger enable/disable, slew-rate, input debounce
> > nanoseconds,
> > > +          drive-open-drain, drive-push-pull, power-source and
> > drive-strength.
> > > +        allOf:
> > > +          - $ref: /schemas/pinctrl/pincfg-node.yaml
> > > +          - $ref: /schemas/pinctrl/pinmux-node.yaml
> > > +        unevaluatedProperties: false
> >=20
> > I think this should be additionalProperties, since you're citing all the
> > properties you do support below.
> >=20
> > > +
> > > +        properties:
> > > +          pins:
> > > +            description:
> > > +              The list of IOs that properties in the pincfg node app=
ly to.
> > > +
> > > +          function:
> > > +            description:
> > > +              A string containing the name of the function to mux for
> > these
> > > +              pins.
> > > +            enum: [ auxpwrgood, gpio, hbled, pe2rst_out ]
> > > +
> > > +          bias-disable: true
> > > +
> > > +          bias-pull-down:
> > > +            type: boolean
> > > +
> > > +          bias-pull-up:
> > > +            oneOf:
> > > +              - type: boolean
> > > +              - enum: [ 600, 900, 1200, 2000 ]
> > > +                description: Pull up RSEL type resistance values (in
> > ohms)
> > > +            description:
> > > +              For normal pull up type there is no need to specify a
> > resistance
> > > +              value, hence this can be specified as a boolean proper=
ty.
> > > +              For RSEL pull up type a resistance value (in ohms) can=
 be
> > added.
> > > +
> > > +          drive-open-drain: true
> > > +
> > > +          drive-push-pull: true
> > > +
> > > +          drive-strength:
> > > +            enum: [ 2, 4, 8, 12 ]
> > > +
> > > +          drive-strength-microamp:
> > > +            enum: [ 2000, 4000, 8000, 12000 ]
> > > +
> > > +          input-debounce-nanoseconds:
> > > +            minimum: 0
> > > +            maximum: 4294967295
> > > +
> > > +          input-disable: true
> > > +
> > > +          input-enable: true
> > > +
> > > +          input-schmitt-enable: true
> > > +
> > > +          input-schmitt-disable: true
> > > +
> > > +          power-source:
> > > +             enum: [ 0, 1, 2 ]
> > > +
> > > +          slew-rate:
> > > +            enum: [ 0, 1 ]
> > > +            default: 0
> > > +            description: |
> > > +                0: slow (half frequency)
> > > +                1: fast
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - resets
> > > +  - interrupts
> > > +  - interrupt-controller
> > > +  - '#interrupt-cells'
> > > +  - gpio-controller
> > > +  - '#gpio-cells'
> > > +  - gpio-ranges
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    soc {
> > > +        #address-cells =3D <2>;
> > > +        #size-cells =3D <2>;
> > > +
> > > +        pinctrl_sys0: pinctrl@13080000 {
> > > +            compatible =3D "starfive,jhb100-sys0-pinctrl";
> > > +            reg =3D <0x0 0x13080000 0x0 0x800>;
> > > +            resets =3D <&sys0crg 2>;
> > > +            interrupts =3D <56>;
> > > +            interrupt-controller;
> > > +            #interrupt-cells =3D <3>;
> > > +            gpio-controller;
> > > +            #gpio-cells =3D <3>;
> > > +            gpio-ranges =3D <&pinctrl_sys0 0 0 0 4>;
> > > +        };
> > > +    };
> > > diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> > > b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> > > new file mode 100644
> > > index 000000000000..6d8f5516a178
> > > --- /dev/null
> > > +++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> > > @@ -0,0 +1,17 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> > > +/*
> > > + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> > > + *
> > > + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> > > + */
> > > +
> > > +#ifndef __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
> > > +#define __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
> > > +
> > > +/* sys0 pad numbers */
> > > +#define PADNUM_SYS0_GPIO_A0				0
> > > +#define PADNUM_SYS0_GPIO_A1				1
> > > +#define PADNUM_SYS0_GPIO_A2				2
> > > +#define PADNUM_SYS0_GPIO_A3				3
> >=20
> > Does this provide any actual value? Across the whole series, most numbe=
rs
> > you put in this binding headers do not appear in any drivers at all. Se=
ems like
> > these defines should appear in the dts directly?
>=20
> However, the current series of drivers will use some of these definitions.
>=20
> Copied from patch 12:
> +static const struct pinvref_desc pinvref_desc_sys2[] =3D {
> +	{
> +		.name =3D "gpiow0",
> +		.pin_grp =3D {
> +			PADNUM_SYS2_GPIO_A36,
> +			PADNUM_SYS2_GPIO_A37,
> +			PADNUM_SYS2_GPIO_A38,
> +			PADNUM_SYS2_GPIO_A39
> +		},
> +		.num_pins =3D 4,
> +		.range =3D BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)

Can you explain why you need something like this when you're using pins
and functions? These look a lot like your own home-rolled groups, that
exist just to set the range of permitted values for vref?

As far as I can tell, the only controller that supports something other
than 1.8v and 3.3v is "per2", so you should be able to apply the
restrictions here entirely in the dt-binding?

I notice you have
> > > +          power-source:
> > > +             enum: [ 0, 1, 2 ]
in all bindings, but no explanation of what the values are. That needs
to change, and you should not permit 1 in anything other than "per2",
since that appears to be the only user.

Also, you've not responded to my other comments, one of which was a
question. Why not?

Thanks,
Conor.

> +	},
> +	{
> +		.name =3D "gpiow-inner",
> +		.pin_grp =3D {
> +			PADNUM_SYS2_GPIO_A40,
> +			PADNUM_SYS2_GPIO_A41,
> +			PADNUM_SYS2_GPIO_A42,
> +			PADNUM_SYS2_GPIO_A43
> +		},
> +		.num_pins =3D 4,
> +		.range =3D BIT(JHB100_PINVREF_1_8V) | BIT(JHB100_PINVREF_3_3V)
> +	},
> +	{ NULL },
> +};
>=20
> Therefore, I have uniformly created include/dt-bindings/pinctrl/starfive,=
jhb100-pinctrl.h
>=20
> Best Regards,
> Changhuang
>=20

--sceamiqloubMEw/P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagbJuwAKCRB4tDGHoIJi
0vKZAP93UYHpsiFwsIbT8nCIyOIq7PrtiEIvg72pNnZe8rS6pwD+Mw0r+eFUz/FW
nYYGigbCQ/8gfcNICWqx8xDNK8KMQwk=
=2glK
-----END PGP SIGNATURE-----

--sceamiqloubMEw/P--

