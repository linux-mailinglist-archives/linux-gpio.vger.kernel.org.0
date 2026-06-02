Return-Path: <linux-gpio+bounces-37832-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8J8QC8cKH2rYeAAAu9opvQ
	(envelope-from <linux-gpio+bounces-37832-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 18:54:31 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF2B63068D
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 18:54:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=iXzF5zb4;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37832-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37832-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C48FB303127F
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 16:53:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4930385D66;
	Tue,  2 Jun 2026 16:53:48 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CC8437DEBC;
	Tue,  2 Jun 2026 16:53:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780419228; cv=none; b=igAVCLNI8fvAhs9p9DU9M+jdBbbGCG8ZrSAhV+M1s1nFvv7bBLBqZvk5kRz8+p7y0GF+NDfYPAkKlputUeaLJDz/pBelbaYfHteASGLG66kllKNe4F7iqc/Dbzr/aehGmpJDv2gscnVXS9MGIZx4J9CeYX5so10KaEjrGEJn0Q4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780419228; c=relaxed/simple;
	bh=kRUqhA6CT8jYevxAj3eLidl85jth0GnIztFZmis9UIs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WAYHDlRiXAMmUTXQqOSWVpZGiXGU4xyPv0Iws2YxmkH/bQNqmL+5MtSPQBPuntI9dwEfCs1qXqFo28aqb3A3gIeehay2eExfe5dsAuZi1G5qZj79dcozP0/VmL8UvJ2Vi1Wq2OKdG7jitAcaP7Z/IVnFVnq6Pr9DxIPJT4jz+oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iXzF5zb4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57CF01F00893;
	Tue,  2 Jun 2026 16:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780419227;
	bh=sNR6m5slCh5aFrIej8LtoAl6ZQkku+eb1lZYSXVxYb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iXzF5zb4/73OrDVlXopSph0rNOJ3R3aEpSI68VTT5VW/0N6uK72WAouNuZmC3YN53
	 1xszAGiLoabHaspu8CGH+LQ57NCPgqjkT0L/+yJ5YRPHNRoeDfHVuqDAzIkzFJ2o5M
	 glEjSenZjlf+f7/wGH6asmOf6oQhYAx4hhqKabNku/6mMfa6iJjgdAC23rwAQJXzNB
	 5Gsv6jdJBfBRZDZQXLWy56zq4BMhbsD9ZyGwVPYXI/yDd/DQzd91TypKhYbI/QicNy
	 9GpE6nLJTRIRhqokn5PjxvkvatFw2tXcKGK7yMjKM7Ff0z3nCnR9isUERO8ntVs6uW
	 UAQ97CKuLv1Zw==
Date: Tue, 2 Jun 2026 17:53:43 +0100
From: Conor Dooley <conor@kernel.org>
To: wangjia@ultrarisc.com
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: Add UltraRISC DP1000
 pinctrl controller
Message-ID: <20260602-clause-mortify-a0e474334cfe@spud>
References: <20260601-ultrarisc-pinctrl-v2-0-07ac5130a96d@ultrarisc.com>
 <20260601-ultrarisc-pinctrl-v2-1-07ac5130a96d@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GMF3Sr7spSBp+L7u"
Content-Disposition: inline
In-Reply-To: <20260601-ultrarisc-pinctrl-v2-1-07ac5130a96d@ultrarisc.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.76 / 15.00];
	SIGNED_PGP(-2.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-37832-lists,linux-gpio=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:wangjia@ultrarisc.com,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:brgl@kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,spud:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,ultrarisc.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CFF2B63068D


--GMF3Sr7spSBp+L7u
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 01, 2026 at 05:56:34PM +0800, Jia Wang via B4 Relay wrote:
> From: Jia Wang <wangjia@ultrarisc.com>
>=20
> Add doc for the pinctrl controllers on the UltraRISC DP1000 RISC-V SoC.
>=20
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---
>  .../bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml | 128 +++++++++++++++=
++++++
>  MAINTAINERS                                        |   6 +
>  2 files changed, 134 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-p=
inctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pi=
nctrl.yaml
> new file mode 100644
> index 000000000000..5100033c18c3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.=
yaml
> @@ -0,0 +1,128 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/ultrarisc,dp1000-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: UltraRISC DP1000 Pin Controller
> +
> +maintainers:
> +  - Jia Wang <wangjia@ultrarisc.com>
> +
> +description: |
> +  UltraRISC RISC-V SoC DP1000 pin controller.
> +  The controller manages ports A, B, C, D and LPC. Ports A-D default to
> +  GPIO and provide additional SPI, UART, I2C, and PWM mux functions.
> +  LPC pins default to the LPC interface and can be muxed to eSPI.
> +  All pins also support pin configuration, including drive strength,
> +  pull-up, and pull-down settings.
> +
> +properties:
> +  compatible:
> +    const: ultrarisc,dp1000-pinctrl
> +
> +  reg:
> +    items:
> +      - description: pin controller registers
> +
> +required:
> +  - compatible
> +  - reg
> +
> +patternProperties:
> +  '.*-pins$':
> +    type: object
> +    unevaluatedProperties: false
> +    allOf:
> +      - $ref: /schemas/pinctrl/pincfg-node.yaml#
> +      - $ref: /schemas/pinctrl/pinmux-node.yaml#
> +      - if:
> +          properties:
> +            pins:
> +              contains:
> +                pattern: '^LPC([0-9]|1[0-2])$'
> +        then:
> +          properties:
> +            function:
> +              enum:
> +                - lpc
> +                - espi
> +
> +    properties:
> +      pins:
> +        description: List of pins affected by this state node.
> +        minItems: 1
> +        uniqueItems: true
> +        items:
> +          type: string
> +          oneOf:
> +            - pattern: '^PA([0-9]|1[0-5])$'
> +            - pattern: '^PB[0-7]$'
> +            - pattern: '^PC[0-7]$'
> +            - pattern: '^PD[0-7]$'
> +            - pattern: '^LPC([0-9]|1[0-2])$'
> +
> +      function:
> +        description: |
> +          Mux function to select for the listed pins. Supported functions
> +          depend on the selected pins and match the DP1000 hardware mux
> +          table.
> +        enum:
> +          - gpio
> +          - i2c0
> +          - i2c1
> +          - i2c2
> +          - i2c3

Why do you need to know which i2c, pwm etc is being used here?
If don't need to differentiate, then drop the numeric.
Only spi and uart seem to have more than one "UR_FUNC" associated with
them.

Cheers,
Conor.

> +          - pwm0
> +          - pwm1
> +          - pwm2
> +          - pwm3
> +          - spi0
> +          - spi1
> +          - uart0
> +          - uart1
> +          - uart2
> +          - uart3
> +          - lpc
> +          - espi
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
> +    required:
> +      - pins
> +      - function
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    soc {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;
> +
> +      pinctrl@11081000 {
> +        compatible =3D "ultrarisc,dp1000-pinctrl";
> +        reg =3D <0x0 0x11081000 0x0 0x1000>;
> +
> +        i2c0-pins {
> +          pins =3D "PA12", "PA13";
> +          function =3D "i2c0";
> +          bias-pull-up;
> +          drive-strength =3D <33>;
> +        };
> +
> +        uart0-pins {
> +          pins =3D "PA8", "PA9";
> +          function =3D "uart0";
> +          bias-pull-up;
> +          drive-strength =3D <33>;
> +        };
> +      };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 461a3eed6129..6fd7ce6365fb 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -27356,6 +27356,12 @@ S:	Maintained
>  F:	drivers/usb/common/ulpi.c
>  F:	include/linux/ulpi/
> =20
> +ULTRARISC DP1000 PINCTRL DRIVER
> +M:	Jia Wang <wangjia@ultrarisc.com>
> +L:	linux-gpio@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.ya=
ml
> +
>  ULTRATRONIK BOARD SUPPORT
>  M:	Goran Ra=C4=91enovi=C4=87 <goran.radni@gmail.com>
>  M:	B=C3=B6rge Str=C3=BCmpfel <boerge.struempfel@gmail.com>
>=20
> --=20
> 2.34.1
>=20
>=20

--GMF3Sr7spSBp+L7u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCah8KlwAKCRB4tDGHoIJi
0vPKAP48/a1vhgqvE4w51hesZUJ3dFjRzgvajavKJI3IeIVpLQEAsnuVhZF/FaVc
Oym4doNCanYj9DEAT8mxijXS+/ypyAU=
=Zjp9
-----END PGP SIGNATURE-----

--GMF3Sr7spSBp+L7u--

