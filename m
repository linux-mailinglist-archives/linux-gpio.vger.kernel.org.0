Return-Path: <linux-gpio+bounces-37830-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /GskOjUGH2oydgAAu9opvQ
	(envelope-from <linux-gpio+bounces-37830-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 18:35:01 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BF26303CB
	for <lists+linux-gpio@lfdr.de>; Tue, 02 Jun 2026 18:35:01 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=iDHlwG0b;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-37830-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-gpio+bounces-37830-lists+linux-gpio=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 4E5EE30A1FE1
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Jun 2026 16:29:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C57A3655C9;
	Tue,  2 Jun 2026 16:29:00 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A555B36309B;
	Tue,  2 Jun 2026 16:28:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780417739; cv=none; b=Cw9A0ocBD8C6dKuW6E77Ke3a2gsVCDfb0NIq8xnvyCP9smtx8hK9Dlel7Z9r4GzReqgCn0Fn/59L61czdEOZuZxDwSZf+SPZHvkOKDSBQBk1U/evjYGF3nebXjwYXidKH7RWPD94gl4QJ5v5zo3uoPclVhi7z2B6ocrYKh+NeZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780417739; c=relaxed/simple;
	bh=dWBVNkaWH+cn7KtJoq3Qn1frM9TTm76BpGSXA/NleEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lGLrQU7l/NhH1ij24e/gUDaCBUZbgJiz8tQak9W7ro/lrXYtMVitCjHS9M71QrRy1CqyIKIjtYBFKa0XHxvglQ5ov8OqCQ99cTv3YE2wSDXU9+0R6net0N3kJ1vB/F9V6hTpRXGn5+DSusa/BoydwK7c06reCH/WBnFgEl9flSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iDHlwG0b; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1A461F00893;
	Tue,  2 Jun 2026 16:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780417738;
	bh=fX3mxaloZXVdfONlQnBRTNrtTT6d9pOvEBlD8qfbPpk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iDHlwG0bzuh0CFILnENYRBJ3yxmdq0tICesnt1nNqQcdEFTN2Zc2JBchLvWI2WGKo
	 m1EwYKqPw9GrWCg9PhftjYBVq45dMyHN/nk9ZOMtY7URwMiB5O3wWSWKgPHj/H2ov/
	 izi+mBVaQgqh1uCAjurlLHnlodWdhUXd2HZtadgTzVqDsd0lH9XcOU1GOKM038fcHy
	 5KIHFrh4HTQ/BI7bmQcs4DAGLke2MxdrqGALzbEWEB00p2aMJ5bXVNRFCLXImO1TXw
	 Yxpvzqul5pR0R200cUcUjohjuSQZ0vK1za646xfMp+KiWe38EDRz7uSWptdYUWKPxM
	 YzbbnPTU5Eozw==
Date: Tue, 2 Jun 2026 17:28:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.com>
Cc: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Larisa Grigore <larisa.grigore@nxp.com>, Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Alberto Ruiz <aruizrui@redhat.com>,
	Christophe Lizzi <clizzi@redhat.com>, devicetree@vger.kernel.org,
	Enric Balletbo <eballetb@redhat.com>,
	Eric Chanudet <echanude@redhat.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH v10 4/6] dt-bindings: pinctrl: s32g2-siul2: describe GPIO
 and EIRQ resources
Message-ID: <20260602-casualty-overstuff-b46f9c7d7d12@spud>
References: <20260602080132.3256239-1-khristineandreea.barbulescu@oss.nxp.com>
 <20260602080132.3256239-5-khristineandreea.barbulescu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Lx2mHOuNnTOuI0LO"
Content-Disposition: inline
In-Reply-To: <20260602080132.3256239-5-khristineandreea.barbulescu@oss.nxp.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37830-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FORGED_RECIPIENTS(0.00)[m:khristineandreea.barbulescu@oss.nxp.com,m:linusw@kernel.org,m:brgl@bgdev.pl,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:chester62515@gmail.com,m:mbrugger@suse.com,m:ghennadi.procopciuc@nxp.com,m:larisa.grigore@nxp.com,m:lee@kernel.org,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:festevam@gmail.com,m:aisheng.dong@nxp.com,m:ping.bai@nxp.com,m:gregkh@linuxfoundation.org,m:rafael@kernel.org,m:srini@kernel.org,m:aruizrui@redhat.com,m:clizzi@redhat.com,m:devicetree@vger.kernel.org,m:eballetb@redhat.com,m:echanude@redhat.com,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-gpio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:s32@nxp.com,m:kernel@pengutronix.de,m:vincent.guittot@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,bgdev.pl,gmail.com,suse.com,nxp.com,pengutronix.de,linuxfoundation.org,redhat.com,vger.kernel.org,lists.linux.dev,lists.infradead.org,linaro.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,nxp.com:email,spud:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 89BF26303CB


--Lx2mHOuNnTOuI0LO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 02, 2026 at 10:01:30AM +0200, Khristine Andreea Barbulescu wrot=
e:
> Extend the S32G2 SIUL2 pinctrl binding to describe the GPIO data and
> external interrupt resources present in the same SIUL2 hardware block.
>=20
> Besides the MSCR and IMCR registers used for pin multiplexing and pad
> configuration, SIUL2 also contains PGPDO and PGPDI registers
> for GPIO data and EIRQ registers for external interrupt control.
>=20
> Add GPIO controller properties because the SIUL2 block also provides
> GPIO functionality, and gpio-ranges are needed to describe the
> mapping between GPIO lines and pin controller pins.
>=20
> Document the interrupt controller properties. The SIUL2 block
> contains EIRQ hardware as part of the same register space. IRQ support
> itself will be added in a follow-up patch series.
>=20
> Update the example accordingly to show the complete SIUL2 register
> layout, including the GPIO data and EIRQ register windows.
>=20
> Signed-off-by: Khristine Andreea Barbulescu <khristineandreea.barbulescu@=
oss.nxp.com>
> ---
>  .../pinctrl/nxp,s32g2-siul2-pinctrl.yaml      | 83 +++++++++++++++++--
>  1 file changed, 78 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pi=
nctrl.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinc=
trl.yaml
> index a24286e4def6..e4cc1a3a795c 100644
> --- a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.y=
aml
> +++ b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.y=
aml
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> -# Copyright 2022 NXP
> +# Copyright 2022, 2026 NXP
>  %YAML 1.2
>  ---
>  $id: http://devicetree.org/schemas/pinctrl/nxp,s32g2-siul2-pinctrl.yaml#
> @@ -17,8 +17,10 @@ description: |
>      SIUL2_0 @ 0x4009c000
>      SIUL2_1 @ 0x44010000
> =20
> -  Every SIUL2 region has multiple register types, and here only MSCR and
> -  IMCR registers need to be revealed for kernel to configure pinmux.
> +  Every SIUL2 region has multiple register types. MSCR and IMCR registers
> +  need to be revealed for kernel to configure pinmux. PGPDO and PGPDI
> +  registers are used for GPIO output/input operations. EIRQ registers
> +  are used for external interrupt configuration.
> =20
>    Please note that some register indexes are reserved in S32G2, such as
>    MSCR102-MSCR111, MSCR123-MSCR143, IMCR84-IMCR118 and IMCR398-IMCR429.
> @@ -29,14 +31,22 @@ properties:
>        - nxp,s32g2-siul2-pinctrl
> =20
>    reg:
> +    minItems: 6
>      description: |
> -      A list of MSCR/IMCR register regions to be reserved.
> +      A list of MSCR/IMCR/PGPDO/PGPDI/EIRQ register regions to be reserv=
ed.
>        - MSCR (Multiplexed Signal Configuration Register)
>          An MSCR register can configure the associated pin as either a GP=
IO pin
>          or a function output pin depends on the selected signal source.
>        - IMCR (Input Multiplexed Signal Configuration Register)
>          An IMCR register can configure the associated pin as function in=
put
>          pin depends on the selected signal source.
> +      - PGPDO (Parallel GPIO Pad Data Out Register)
> +        A PGPDO register is used to set the output value of a GPIO pin.
> +      - PGPDI (Parallel GPIO Pad Data In Register)
> +        A PGPDI register is used to read the input value of a GPIO pin.
> +      - EIRQ (External Interrupt Request)
> +        EIRQ registers are used to configure and manage external interru=
pts.
> +
>      items:
>        - description: MSCR registers group 0 in SIUL2_0
>        - description: MSCR registers group 1 in SIUL2_1
> @@ -44,6 +54,28 @@ properties:
>        - description: IMCR registers group 0 in SIUL2_0
>        - description: IMCR registers group 1 in SIUL2_1
>        - description: IMCR registers group 2 in SIUL2_1
> +      - description: PGPDO registers in SIUL2_0
> +      - description: PGPDI registers in SIUL2_0
> +      - description: PGPDO registers in SIUL2_1
> +      - description: PGPDI registers in SIUL2_1
> +      - description: EIRQ registers in SIUL2_1
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-ranges:
> +    minItems: 1
> +    maxItems: 4
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  interrupts:
> +    maxItems: 1
> =20
>  patternProperties:
>    '-pins$':
> @@ -86,10 +118,32 @@ required:
>    - compatible
>    - reg
> =20
> +oneOf:
> +  - description: Legacy pinctrl-only node
> +    properties:
> +      reg:
> +        minItems: 6

drop minItems here, since it matches the outer minItems.

> +        maxItems: 6

You're missing having
properties:
   gpio-controller: false
etc here, the condition you have doesn't prevent having them without the
reg properties to support them. E.g. with a diff like this applied:
diff --git a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinc=
trl.yaml b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctr=
l.yaml
index e4cc1a3a795c..f0fc6a771f32 100644
--- a/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/nxp,s32g2-siul2-pinctrl.yaml
@@ -158,17 +158,7 @@ examples:
               /* IMCR119-IMCR397 registers on siul2_1 */
               <0x44010c1c 0x45c>,
               /* IMCR430-IMCR495 registers on siul2_1 */
-              <0x440110f8 0x108>,
-              /* PGPDO registers on siul2_0 */
-              <0x4009d700 0x10>,
-              /* PGPDI registers on siul2_0 */
-              <0x4009d740 0x10>,
-              /* PGPDO registers on siul2_1 */
-              <0x44011700 0x18>,
-              /* PGPDI registers on siul2_1 */
-              <0x44011740 0x18>,
-              /* EIRQ registers on siul2_1 */
-              <0x44010010 0x34>;
+              <0x440110f8 0x108>;

> +
> +  - description: Pinctrl node with GPIO and external interrupt support
> +    required:
> +      - gpio-controller
> +      - "#gpio-cells"
> +      - gpio-ranges
> +      - interrupt-controller
> +      - "#interrupt-cells"
> +      - interrupts
> +    properties:
> +      reg:
> +        minItems: 11
> +        maxItems: 11

And the same here for maxItems.

Cheers,
Conor.

> +
>  additionalProperties: false
> =20
>  examples:
>    - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
>      pinctrl@4009c240 {
>          compatible =3D "nxp,s32g2-siul2-pinctrl";
> =20
> @@ -104,7 +158,26 @@ examples:
>                /* IMCR119-IMCR397 registers on siul2_1 */
>                <0x44010c1c 0x45c>,
>                /* IMCR430-IMCR495 registers on siul2_1 */
> -              <0x440110f8 0x108>;
> +              <0x440110f8 0x108>,
> +              /* PGPDO registers on siul2_0 */
> +              <0x4009d700 0x10>,
> +              /* PGPDI registers on siul2_0 */
> +              <0x4009d740 0x10>,
> +              /* PGPDO registers on siul2_1 */
> +              <0x44011700 0x18>,
> +              /* PGPDI registers on siul2_1 */
> +              <0x44011740 0x18>,
> +              /* EIRQ registers on siul2_1 */
> +              <0x44010010 0x34>;
> +
> +        gpio-controller;
> +        #gpio-cells =3D <2>;
> +        gpio-ranges =3D <&pinctrl 0 0 102>,
> +                      <&pinctrl 112 112 79>;
> +
> +        interrupt-controller;
> +        #interrupt-cells =3D <2>;
> +        interrupts =3D <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>;
> =20
>          llce-can0-pins {
>              llce-can0-grp0 {
> --=20
> 2.34.1
>=20
--
pw-bot: changes-requested

--Lx2mHOuNnTOuI0LO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCah8EwgAKCRB4tDGHoIJi
0rDoAQDdONXb61PReEftXDCleOh95uWQWsiptxxVevCmx/K4vwEAgTlvIEH7BXpy
jTnkORdiRCEP/mgQ7e3y9iz6VwD/Dwg=
=2hLs
-----END PGP SIGNATURE-----

--Lx2mHOuNnTOuI0LO--

