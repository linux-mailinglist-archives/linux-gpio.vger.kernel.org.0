Return-Path: <linux-gpio+bounces-36912-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KOPqJ1fzBmohpQIAu9opvQ
	(envelope-from <linux-gpio+bounces-36912-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 12:20:07 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C45E154D344
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 12:20:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 09B64305F790
	for <lists+linux-gpio@lfdr.de>; Fri, 15 May 2026 10:13:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCF0744A710;
	Fri, 15 May 2026 10:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="Ht4LX0dR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0191843CED6;
	Fri, 15 May 2026 10:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778840004; cv=none; b=SNvtyrRXMfAH5G3/E/DOEyPDnBAv8OhxkaFogPF27N+CUR72MDAuzQxZprPdtIm/WwOqWJTDQKCKI9FFTmyX5rbBYJylC9tG/AxCCljUPvIG3ZLvt9Pvp/Vx6zxvZqmvbuxcxL1VQ6RI/vosRmVkDZscaeCRKBVvoD20NcpQbZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778840004; c=relaxed/simple;
	bh=evQX+4ofonjzB1hQTvK0ltGR/Y5Sa64Uh561hOVtgMA=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X2d/fTHxje6PwrxToSoNB1gSMGvwBeV7tzcgjqbgWg9/B9PtcaHA1VI/9JPGjtk1UPaluL2YoH6rh6aUOxJ4RVNEfWwKShDYd9Tcwl7MJQRIIppMeuZK81d8VabWC2QVKyoXVw7nLORGXmX7Fypq1R5FA4aZk03J0cZDeVCj9+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=Ht4LX0dR; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1778840003; x=1810376003;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=evQX+4ofonjzB1hQTvK0ltGR/Y5Sa64Uh561hOVtgMA=;
  b=Ht4LX0dRrSQ4G7J0cofVladEWHDWfxJLibv/UidgPzyJpFDgokczi9wN
   GRL8twLZAp45kywdxwoDQ5cMe2D9vk2RRqG+1DU8XPNdZGFDOkK0U5Am2
   RLDlP71ahDMQOqp4G0E3DZ9PAqa8K11mWZFzgjra4OeJmIQEHK6mk3u0L
   dRFfvjxQ+maj5s7omeNN0mo+DX0CfjzwX+9fDo7plB7wKxpaKNt0ATI+Z
   ZFNYThCgEtb5N3Pxnnr35FwzE9JqvDwjrRXMRW8s8iXbHHcKeOLihkpJM
   KTT1CtukNB1q3uN33ldpOEPxmvt2M39qOCj46Ca1gSXXZX9BDzQKdBeWt
   w==;
X-CSE-ConnectionGUID: 6wFzbMQaTSC3kZhzRYr1Uw==
X-CSE-MsgGUID: bjSFnhTDSWeIQeux3JDtew==
X-IronPort-AV: E=Sophos;i="6.23,236,1770620400"; 
   d="asc'?scan'208";a="288921741"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 03:13:22 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.37; Fri, 15 May 2026 03:13:21 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex03.mchp-main.com (10.10.85.151)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.58 via Frontend
 Transport; Fri, 15 May 2026 03:13:17 -0700
Date: Fri, 15 May 2026 11:12:39 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jia Wang <wangjia@ultrarisc.com>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre
 Ghiti <alex@ghiti.fr>, Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski
	<brgl@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, Conor Dooley
	<conor@kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 4/9] dt-bindings: pinctrl: Add UltraRISC DP1000 pinctrl
 bindings
Message-ID: <20260515-fragrant-anyplace-e69a7d3e205d@wendy>
References: <20260515-ultrarisc-pinctrl-v1-0-bf559589ea8a@ultrarisc.com>
 <20260515-ultrarisc-pinctrl-v1-4-bf559589ea8a@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sT3yokN64rYA2jYt"
Content-Disposition: inline
In-Reply-To: <20260515-ultrarisc-pinctrl-v1-4-bf559589ea8a@ultrarisc.com>
X-Rspamd-Queue-Id: C45E154D344
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36912-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	DKIM_TRACE(0.00)[microchip.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor.dooley@microchip.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[18];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

--sT3yokN64rYA2jYt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 09:18:00AM +0800, Jia Wang wrote:
> Add bindings for the pin controllers on the UltraRISC DP1000 RISC-V SoC.
>=20
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---
>  .../bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml | 168 +++++++++++++++=
++++++
>  MAINTAINERS                                        |   7 +
>  .../dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h |  65 ++++++++
>  3 files changed, 240 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-p=
inctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pi=
nctrl.yaml
> new file mode 100644
> index 000000000000..c7ed1f96382a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.=
yaml
> @@ -0,0 +1,168 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/ultrarisc,dp1000-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: UltraRISC DP1000 Pin Controller
> +maintainers:
> +  - Jia Wang <wangjia@ultrarisc.com>
> +
> +description: |
> +  UltraRISC RISC-V SoC DP1000 pin controller.
> +
> +  The binding supports two child node styles under the same controller
> +  compatible:
> +
> +  - legacy DP1000-specific nodes using phandle-array properties
> +    `pinctrl-pins` and `pinconf-pins`
> +  - generic pinctrl nodes using `pins`, `function` and generic pin
> +    configuration properties
> +
> +properties:
> +  compatible:
> +    const: ultrarisc,dp1000-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#pinctrl-cells":
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +patternProperties:
> +  '.*-pins$':
> +    type: object
> +    allOf:
> +      - $ref: /schemas/pinctrl/pincfg-node.yaml#
> +      - $ref: /schemas/pinctrl/pinmux-node.yaml#
> +    additionalProperties: false
> +    properties:
> +      pinctrl-pins:
> +        description: |
> +          The list of pins and their mux settings that properties in the=
 node
> +          apply to. The format: `PORT  PIN  FUNCTION`.
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        minItems: 1
> +        maxItems: 32
> +      pinconf-pins:
> +        description: |
> +          The list of pins and their pad configuration that properties i=
n the
> +          node apply to. The format: `PORT  PIN  CONF`.
> +          CONF is a DP1000-specific encoding of pull and drive strength =
as
> +          defined in dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h.
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        minItems: 1
> +        maxItems: 32

These two "legacy" properties are not acceptable, sorry.

> +      pins:
> +        description: List of pins affected by this state node.
> +        minItems: 1
> +        uniqueItems: true
> +        items:
> +          type: string
> +          pattern: '^(PA([0-9]|1[0-5])|P[BCD][0-7]|LPC([0-9]|1[0-2]))$'

The regex might be neat, but I don't think that it is very
user-friendly. It's hard to read this and understand what the pin
namings actually are. Could you break this down into multiple patterns,
one for each type of pin?
I think that would make reading it much simpler.

> +
> +      function:
> +        description: |
> +          Mux function to select for the listed pins.
> +          gpio maps to the hardware default mode. The default mode is
> +          GPIO for PA/PB/PC/PD pins and LPC for LPC pins.
> +          func1 is not supported on LPC pins.
> +        enum:
> +          - gpio

> +          - func0
> +          - func1

These two do no seem to be very useful to people writing devicetrees.
What do func0 and func1 represent? I assume that they represent
something different for different pins? For example, maybe qspi for LPC
or i2c for PC?

pw-bot: changes-requested

Cheers,
Conor.

> +
> +      bias-disable: true
> +      bias-high-impedance: true
> +      bias-pull-up: true
> +      bias-pull-down: true
> +
> +      drive-strength:
> +        description: Output drive strength in mA.
> +        enum: [20, 27, 33, 40]
> +
> +    oneOf:
> +      - allOf:
> +          - anyOf:
> +              - required: [pinctrl-pins]
> +              - required: [pinconf-pins]
> +          - not:
> +              required: [pins]
> +      - allOf:
> +          - required: [pins]
> +          - not:
> +              anyOf:
> +                - required: [pinctrl-pins]
> +                - required: [pinconf-pins]
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +
> +      pinmux@11081000 {
> +        compatible =3D "ultrarisc,dp1000-pinctrl";
> +        reg =3D <0x0 0x11081000  0x0 0x1000>;
> +        #pinctrl-cells =3D <2>;
> +
> +        i2c0-pins {
> +          pins =3D "PA12", "PA13";
> +          function =3D "func0";
> +          bias-pull-up;
> +          drive-strength =3D <33>;
> +        };
> +
> +        uart0-pins {
> +          pins =3D "PA8", "PA9";
> +          function =3D "func1";
> +          bias-pull-up;
> +          drive-strength =3D <33>;
> +        };
> +      };
> +    };
> +
> +  - |
> +    /* Legacy example */
> +    #include <dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h>
> +
> +    soc {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +
> +      pinmux@11081000 {
> +        compatible =3D "ultrarisc,dp1000-pinctrl";
> +        reg =3D <0x0 0x11081000  0x0 0x1000>;
> +        #pinctrl-cells =3D <2>;
> +
> +        i2c0-pins {
> +          pinctrl-pins =3D <
> +            UR_DP1000_IOMUX_A  12  UR_DP1000_FUNC0
> +            UR_DP1000_IOMUX_A  13  UR_DP1000_FUNC0
> +          >;
> +
> +          pinconf-pins =3D <
> +            UR_DP1000_IOMUX_A  12  UR_DP1000_BIAS(UR_DP1000_PULL_UP,
> +                                                  UR_DP1000_DRIVE_DEF)
> +            UR_DP1000_IOMUX_A  13  UR_DP1000_BIAS(UR_DP1000_PULL_UP,
> +                                                  UR_DP1000_DRIVE_DEF)
> +          >;
> +        };
> +
> +        uart0-pins {
> +          pinctrl-pins =3D <
> +            UR_DP1000_IOMUX_A  8  UR_DP1000_FUNC1
> +            UR_DP1000_IOMUX_A  9  UR_DP1000_FUNC1
> +          >;
> +
> +          pinconf-pins =3D <
> +            UR_DP1000_IOMUX_A  8   UR_DP1000_BIAS(UR_DP1000_PULL_UP,
> +                                                  UR_DP1000_DRIVE_DEF)
> +            UR_DP1000_IOMUX_A  9   UR_DP1000_BIAS(UR_DP1000_PULL_UP,
> +                                                  UR_DP1000_DRIVE_DEF)
> +          >;
> +        };
> +      };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5bf971ff48b2..baaaa46b1a56 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27358,6 +27358,13 @@ S:	Maintained
>  F:	drivers/usb/common/ulpi.c
>  F:	include/linux/ulpi/
> =20
> +ULTRARISC DP1000 PINCTRL DRIVER
> +M:	Jia Wang <wangjia@ultrarisc.com>
> +L:	linux-gpio@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.ya=
ml
> +F:	include/dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h
> +
>  ULTRATRONIK BOARD SUPPORT
>  M:	Goran Ra=C4=91enovi=C4=87 <goran.radni@gmail.com>
>  M:	B=C3=B6rge Str=C3=BCmpfel <boerge.struempfel@gmail.com>
> diff --git a/include/dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h b/inc=
lude/dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h
> new file mode 100644
> index 000000000000..bef28115898d
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/ultrarisc,dp1000-pinctrl.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * UltraRISC DP1000 pinctrl header.
> + *
> + * Copyright (C) 2026 UltraRISC Technology (Shanghai) Co., Ltd.
> + */
> +
> +#ifndef _DT_BINDINGS_PINCTRL_ULTRARISC_DP1000_PINCTRL_H
> +#define _DT_BINDINGS_PINCTRL_ULTRARISC_DP1000_PINCTRL_H
> +
> +/**
> + * UltraRISC DP1000 IO pad configuration
> + * port: A, B, C, D, LPC
> + *     Pin in the port
> + * pin:
> + *     PA: 0 - 15
> + *     PB-PD: 0 - 7
> + *     LPC: 0 - 12
> + * func:
> + *     UR_DP1000_FUNC_DEF: default
> + *     UR_DP1000_FUNC0: func0
> + *     UR_DP1000_FUNC1: func1
> + */
> +#define UR_DP1000_IOMUX_A		0x0
> +#define UR_DP1000_IOMUX_B		0x1
> +#define UR_DP1000_IOMUX_C		0x2
> +#define UR_DP1000_IOMUX_D		0x3
> +#define UR_DP1000_IOMUX_LPC		0x4
> +
> +#define UR_DP1000_FUNC_DEF		0
> +#define UR_DP1000_FUNC0			1
> +#define UR_DP1000_FUNC1			0x10000
> +
> +/**
> + * Configure pull up/down resistor of the IO pin
> + * UR_DP1000_PULL_DIS: disable pull-up and pull-down
> + * UR_DP1000_PULL_UP: enable pull-up
> + * UR_DP1000_PULL_DOWN: enable pull-down
> + */
> +#define UR_DP1000_PULL_DIS	0
> +#define UR_DP1000_PULL_UP	1
> +#define UR_DP1000_PULL_DOWN	2
> +/**
> + * Configure drive strength of the IO pin
> + * UR_DP1000_DRIVE_DEF: default value, reset value is 2
> + * UR_DP1000_DRIVE_0: 20mA
> + * UR_DP1000_DRIVE_1: 27mA
> + * UR_DP1000_DRIVE_2: 33mA
> + * UR_DP1000_DRIVE_3: 40mA
> + */
> +#define UR_DP1000_DRIVE_DEF	2
> +#define UR_DP1000_DRIVE_0	0
> +#define UR_DP1000_DRIVE_1	1
> +#define UR_DP1000_DRIVE_2	2
> +#define UR_DP1000_DRIVE_3	3
> +
> +/**
> + * Combine the pull-up/down resistor and drive strength
> + * pull: UR_DP1000_PULL_DIS, UR_DP1000_PULL_UP, UR_DP1000_PULL_DOWN
> + * drive: UR_DP1000_DRIVE_DEF, UR_DP1000_DRIVE_0, UR_DP1000_DRIVE_1,
> + *        UR_DP1000_DRIVE_2, UR_DP1000_DRIVE_3
> + */
> +#define UR_DP1000_BIAS(pull, drive)		(((pull) << 2) | (drive))
> +
> +#endif /* _DT_BINDINGS_PINCTRL_ULTRARISC_DP1000_PINCTRL_H */
>=20
> --=20
> 2.34.1
>=20

--sT3yokN64rYA2jYt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagbxlwAKCRB4tDGHoIJi
0podAQD7GF/lKiqNyCikUEzAv4zfP11Bt7aAu+k3VMrb6Lq8zQD8C14tBDOTIRF3
5G4VZMFnlPtSHlBfPmEUuBt6F7y6ogs=
=L0rM
-----END PGP SIGNATURE-----

--sT3yokN64rYA2jYt--

