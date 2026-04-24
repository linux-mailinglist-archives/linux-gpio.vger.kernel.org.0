Return-Path: <linux-gpio+bounces-35510-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Jj1OsGk62nIPgAAu9opvQ
	(envelope-from <linux-gpio+bounces-35510-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 19:13:37 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E75461B06
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 19:13:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2690E302FA3F
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2026 17:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09AC3E1207;
	Fri, 24 Apr 2026 17:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pqmbg/Lz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3FE33D6F9;
	Fri, 24 Apr 2026 17:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777050572; cv=none; b=j1XXEniByxxPlYs+ZfSQi3wohyDMcmiNJoe08lpwhtEgYs8FUbNTFoacpick1r+6cCe9UXmv8fAXkcBBAz6ASdgQb556IEc+ypE1jJlXks7XSfFXvfxAfNcm2noFGeV/0MTfxfvc80OY457leGJMmdKc3q/vrSM08P8aJPuRL4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777050572; c=relaxed/simple;
	bh=Z54BvUsS5OFxX2yzgABhxCja///K+vPhxenY2v5P+ms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ooGbIzGgaivNwZbMN38Zj0uWL2Udd46ZccOqKaLN3kmNVl/huWh/jf9cgUviTVW5DFb/lxDvSP/dAZ0VETumHmxl5X79mq3LrjiUgJuPdFxZOf4IlAEPJpdX56Ur9Fp048UccJgBHfXHrtE2Jx1cK5du70v8si8yR3dwe8OLnfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pqmbg/Lz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68734C19425;
	Fri, 24 Apr 2026 17:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777050572;
	bh=Z54BvUsS5OFxX2yzgABhxCja///K+vPhxenY2v5P+ms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pqmbg/Lz9C48uYKTZtlMbNufRfa4U91toCpN9NpW3OKppz6pcAHc6qtZ0cqx+wL6H
	 R8To7Pjbx2m88LlhCnG7dWWGzhaJkLFJwayYzoQBFmCkt9x3rkJsLZ8iUSK+8W4i4p
	 EbD9FkBTA4PtatEDEii7e3Lcd3QdqGX9dPaNx699Zv/TnxwjV1f/8Ev/Qerb2Fd7u8
	 K8rRMRbKj32C4y81gBVlotSewZvtN6GUCy06lOb+c+4SRy+MBejv3aAzwGeCoZn7Ar
	 rcHvq4luhKvuG6euObxeg2pEG+8/5ePUYTseuF1EPEufIOAxgxv1iII6LyLH0Xf/Gy
	 j+zloTMVo7rGA==
Date: Fri, 24 Apr 2026 18:09:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-gpio@vger.kernel.org,
	Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v6 1/4] dt-bindings: media: ti,ds90ub953: Add support for
 remote GPIO data source
Message-ID: <20260424-reshoot-postage-7bfe0a5eca80@spud>
References: <20260424-ds90ub953-v6-0-7a84efbab316@oss.nxp.com>
 <20260424-ds90ub953-v6-1-7a84efbab316@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ke8pecYrKCTHWIjs"
Content-Disposition: inline
In-Reply-To: <20260424-ds90ub953-v6-1-7a84efbab316@oss.nxp.com>
X-Rspamd-Queue-Id: 86E75461B06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.26 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-35510-lists,linux-gpio=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_SOME(0.00)[]


--ke8pecYrKCTHWIjs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2026 at 09:42:24AM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
>=20
> The DS90UB953 supports four pins, GPIO0 through GPIO3. When enabled as an
> output, it can be programed to output local data or remote data coming
> from the remote compatible deserializer.
>=20
> Add GPIO flag in second cell to select remote GPIO data source.
>=20
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v6:
> - Added GPIO_DATA_SOURCE_REMOTE flag to dt-bindings/gpio/gpio.h
> - Updated dt-bindings documentation accordingly
> - Dropped Reviewed-by tag from Rob Herring due to significant binding cha=
nge
>=20
> Changes in v5:
> - Improve the description for "#gpio-cells" as commented by Conor.
>=20
> Changes in v4:
> - Use folder block instead of literal block for #gpio-cell property descr=
iption.
>=20
> Changes in v3:
> - Make GPIO range from 0-3 to 0-7 to support GPIO data from remote
>   compatible deserializer suggested by Rob instead of adding third
>   cell for GPIO controller.
>=20
> Changes in v2:
> - Remove new property ti,gpio-data
> - Add third cell for GPIO controller to select GPIO output source.
> ---
>  Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml | 6 ++++--
>  include/dt-bindings/gpio/gpio.h                               | 8 ++++++=
++
>  2 files changed, 12 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yam=
l b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
> index 2e129bf573b7..da63771bc236 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub953.yaml
> @@ -21,8 +21,10 @@ properties:
>    '#gpio-cells':
>      const: 2
>      description:
> -      First cell is the GPIO pin number, second cell is the flags. The G=
PIO pin
> -      number must be in range of [0, 3].
> +      First cell is the GPIO pin number (0-3) and the second cell is used
> +      to specify flags. See <dt-bindings/gpio/gpio.h> for available flags
> +      including GPIO_DATA_SOURCE_REMOTE for remote GPIO data source.
> +      Flags can be OR'd together.
> =20
>    gpio-controller: true
> =20
> diff --git a/include/dt-bindings/gpio/gpio.h b/include/dt-bindings/gpio/g=
pio.h
> index b5d531237448..d04a494d96ad 100644
> --- a/include/dt-bindings/gpio/gpio.h
> +++ b/include/dt-bindings/gpio/gpio.h
> @@ -42,4 +42,12 @@
>  /* Bit 6 express pull disable */
>  #define GPIO_PULL_DISABLE 64
> =20
> +/*
> + * Bit 24 indicates the GPIO data source is from a remote device.

Why 24, not 7?

> + * This is used in serializer/deserializer setups where the GPIO pin
> + * on the local device (e.g., TI DS90UB953 serializer) reflects the
> + * state of a GPIO on the remote device (e.g., TI DS90UB960 deserializer=
).
> + */
> +#define GPIO_DATA_SOURCE_REMOTE		0x01000000

And why the divergent formatting compared to other defines in this file?

> +
>  #endif
>=20
> --=20
> 2.34.1
>=20

--ke8pecYrKCTHWIjs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaeujxwAKCRB4tDGHoIJi
0vuJAP47zBPA0y+EuIonRzyf2LwPm5ZAuhUateuy3Ff6xDmgNAEAi45SLZvA+n/E
F+KyhNtKVNr/JQQtECECpY3kR2qY+Q8=
=XJik
-----END PGP SIGNATURE-----

--ke8pecYrKCTHWIjs--

