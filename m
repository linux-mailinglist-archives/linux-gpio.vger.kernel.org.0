Return-Path: <linux-gpio+bounces-31452-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHiANuuLg2lWpAMAu9opvQ
	(envelope-from <linux-gpio+bounces-31452-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 19:11:55 +0100
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC7EEB769
	for <lists+linux-gpio@lfdr.de>; Wed, 04 Feb 2026 19:11:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B64C33013A58
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Feb 2026 18:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67F2040756F;
	Wed,  4 Feb 2026 18:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DBQayiqj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D302DFA4A;
	Wed,  4 Feb 2026 18:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770228711; cv=none; b=bapQVyF6vvaHgXOeJh1mCRHcX5g0dYJxk/V7EJAcjH680fTbgSkopnhl/X7XqYAt4xCrgwDio0PkqBF/adqd1kQioSp9l/kJvUtd8hYXPKFgBUUL9HLm7/K9017fyIcLaZD9KimHmu84TQotrTS2PvoNZSSPjafgKY4kP7uoHTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770228711; c=relaxed/simple;
	bh=qCuNCw5IkJNixUvOBqrReN5HqNAq3KCu5sG7c619BoA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AAQcJgN+/T13xIJSwa07AUmhK/Rm46wviO8Klyb66bOWpoa1iWfqyatm23VEp/eo46fR+NIfXilYUy3Hpqgxyi8v+9AaJw0zyDFJlgWRVy4qVhl0dbXJOCaZJ6TwzsaB9TwOPDrhlgZLbOuh9omUVxKVwtA16K/0DmW6z/CF/YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DBQayiqj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF901C4CEF7;
	Wed,  4 Feb 2026 18:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770228710;
	bh=qCuNCw5IkJNixUvOBqrReN5HqNAq3KCu5sG7c619BoA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DBQayiqjrTOR6s+iPhx0yVASon0LRlZgSCzxydu5vTbotYR8Oc+yeHSv9sCh8BQWm
	 Ye53SZFibKIuXdefnyTN5bJJnMmAHIrjnAehj7I130jis5FTKJIaLro273Yr2nXf74
	 VX7JJTAkkNrR7+oxxLTgW7FMYHU04LASVyDGr/6K8YKnq8dNSxm//z5YKTG6Vid5W2
	 7DG/LwE6w7Y1/eK8wuND7aOeOwtJFTYVLjjD30uIoYUfQ1KjYmzlOevtFn9osFdOUF
	 1nSSRSfqY7iyYE3VcWQoOm6gWYWaKS1yjWk4zOIAQ+tHeng3hgOsT7VaEgyvzm4j8w
	 24py92m7Age6Q==
Date: Wed, 4 Feb 2026 18:11:44 +0000
From: Conor Dooley <conor@kernel.org>
To: "Thomas Perrot (Schneider Electric)" <thomas.perrot@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	=?iso-8859-1?Q?J=E9r=E9mie?= Dautheribes <jeremie.dautheribes@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>, Lee Jones <lee@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v3 2/5] dt-bindings: mfd: Add AAEON embedded controller
Message-ID: <20260204-feminize-agility-60c8463b849f@spud>
References: <20260203-dev-b4-aaeon-mcu-driver-v3-0-0a19432076ac@bootlin.com>
 <20260203-dev-b4-aaeon-mcu-driver-v3-2-0a19432076ac@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HXLOdRZlhDXypzvT"
Content-Disposition: inline
In-Reply-To: <20260203-dev-b4-aaeon-mcu-driver-v3-2-0a19432076ac@bootlin.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TAGGED_FROM(0.00)[bounces-31452-lists,linux-gpio=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,bootlin.com,linux-watchdog.org,roeck-us.net,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[conor@kernel.org,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-gpio,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 3AC7EEB769
X-Rspamd-Action: no action


--HXLOdRZlhDXypzvT
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 03, 2026 at 05:21:11PM +0100, Thomas Perrot (Schneider Electric=
) wrote:
> Add device tree binding documentation for the AAEON embedded controller
> (MCU). This microcontroller is found on AAEON embedded boards, it is
> connected via I2C and  and provides a GPIO control and watchdog timer.
>=20
> Signed-off-by: Thomas Perrot (Schneider Electric) <thomas.perrot@bootlin.=
com>
> ---
>  .../bindings/mfd/aaeon,srg-imx8p-mcu.yaml          | 67 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  6 ++
>  2 files changed, 73 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/aaeon,srg-imx8p-mcu.ya=
ml b/Documentation/devicetree/bindings/mfd/aaeon,srg-imx8p-mcu.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..9d109fb0d53cb2a859f5a908a=
35611394eb87807
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/aaeon,srg-imx8p-mcu.yaml
> @@ -0,0 +1,67 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/aaeon,srg-imx8p-mcu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: AAEON Embedded Controller
> +
> +maintainers:
> +  - J=E9r=E9mie Dautheribes <jeremie.dautheribes@bootlin.com>
> +  - Thomas Perrot <thomas.perrot@bootlin.com>
> +
> +description:
> +  AAEON embeds a microcontroller on Standard RISC Gateway with ARM i.MX8=
M Plus
> +  Quad-Core boards providing GPIO control and watchdog timer.
> +
> +  This MCU is connected via I2C bus.
> +
> +  Its GPIO controller provides 7 GPOs and 12 GPIOs.
> +
> +  Its watchdog has a fixed maximum hardware heartbeat of 25 seconds and =
supports
> +  a timeout of 240 seconds through automatic pinging.
> +  The timeout is not programmable and cannot be changed via device tree =
properties.
> +
> +properties:
> +  compatible:
> +    const: aaeon,srg-imx8p-mcu
> +
> +  reg:
> +    maxItems: 1
> +
> +  gpio-controller: true
> +
> +  "#gpio-cells":
> +    const: 2
> +
> +  gpio-line-names:
> +    minItems: 1
> +    maxItems: 19
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - "#gpio-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    i2c {
> +      #address-cells =3D <1>;
> +      #size-cells =3D <0>;
> +
> +      aaeon_mcu: embedded-controller@62 {

Drop the label here if you respin,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

Cheers,
Conor.

--HXLOdRZlhDXypzvT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYOL4AAKCRB4tDGHoIJi
0me5AP0Q4Vynal5/kaTGfbXrTSrgT5VjBcR+EW/KnfBt6y4CjgEA6Q3hjEEHMGbs
fKUHq0HWTVrOfpWRRc0bmTyLQLv51wk=
=0QQX
-----END PGP SIGNATURE-----

--HXLOdRZlhDXypzvT--

