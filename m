Return-Path: <linux-gpio+bounces-20595-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA5BAC5105
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 16:37:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8C2083AC4F8
	for <lists+linux-gpio@lfdr.de>; Tue, 27 May 2025 14:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68E07278153;
	Tue, 27 May 2025 14:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QW86HKcR"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1009C241670;
	Tue, 27 May 2025 14:36:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748356617; cv=none; b=YYNxhgz2eJHmyvKXEmED3ZNYWcp+dTdCESLYGVvi0mWxd/sBQbYy9hIrRYkmbhae57heqv79sSzKjWlXk30oFVuPgr1WJnvKKwXflplUqmYLDvAh499z7HbjE+G3d0kdRLMbf55ILfJ8vvtRKak28u4o8Ivw/oilqD67RDkl1VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748356617; c=relaxed/simple;
	bh=X9Cz2W+jbYe7aO07cnG2QDUmsVTr3qqndf3L1MTM/i8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hpcoX5BhKKjZm85QPYm0Bmz4cS8CSb/4LnO7p8+c/2t83SaHxnv7Eur7QhQRtAEkyn2A/ZTuaRAk8SwWen9CtYyZmaALBiG4bbeHEGAAbDPq2e4EKjYue5KoGFOm4JGJVxA+c0a9nrynJY1r/JEPskkzBPXUnWMHa3oA4ai5v+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QW86HKcR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C4A3C4CEE9;
	Tue, 27 May 2025 14:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748356616;
	bh=X9Cz2W+jbYe7aO07cnG2QDUmsVTr3qqndf3L1MTM/i8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QW86HKcROD0DGPNnxsjOgbD36GlFPL/1ICd6rv3Kq9xiGPkpl3xpI5+NrK3Htq0wp
	 casMjQhmeTbq+sXAyrhFiOYfa8zOUAvN3bo6ekD4gm9jiPFF8g82ztQdS1PzJzIDvZ
	 0SdlNiEWF5pHsYax48PPbApQ/iDaVU3yX22oIyBttk6o/h1relsszsnfAZqx69zRgS
	 boSoAn7mMOX2m3pLjVtrWk6PKzPEWjzmhu4SEctSqSem89iV8vCaQoMrkTj3g0/3q4
	 2gUD63BAZ7z1o5yOwu9k5BZn7/XP6Q0NSybKWA7lLDeXfM8U04PuWpcWqDVT61e6a2
	 E6/XwZWAM/cdg==
Date: Tue, 27 May 2025 15:36:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Ze Huang <huangze@whut.edu.cn>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev
Subject: Re: [PATCH] dt-bindings: pinctrl: k230: fix child node name patterns
Message-ID: <20250527-activism-container-4a9da77a8da1@spud>
References: <20250527-k230-binding-fix-v1-1-3c18ae5221ab@whut.edu.cn>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sa1FTMnuAHPfsB0F"
Content-Disposition: inline
In-Reply-To: <20250527-k230-binding-fix-v1-1-3c18ae5221ab@whut.edu.cn>


--sa1FTMnuAHPfsB0F
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 27, 2025 at 12:23:35AM +0800, Ze Huang wrote:
> Rename child node name patterns to align with conventions.
>=20
>     uart0-pins      =3D>   uart0-cfg
>         uart0-cfg            uart0-pins
>=20
> This avoids potential confusion and improves consistency with existing
> bindings like sophgo,sg2042-pinctrl and starfive,jh7110-aon-pinctrl.
>=20
> Fixes: 561f3e9d21a1 ("dt-bindings: pinctrl: Add support for canaan,k230 S=
oC")

You're changing something merged in October of last year, which is an
ABI break, for what seems like a cosmetic change to me. What makes this
worth it? Consistency with some devices by other vendors isn't a strong
argument I don't think.

> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> ---
>  .../devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml          | 8 ++=
++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctr=
l.yaml b/Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml
> index 0b462eb6dfe169a292bf716503c03d029f1ac7ee..f4e0da0bf7fa30af513264410=
9dbd371ddfc0228 100644
> --- a/Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml
> @@ -22,7 +22,7 @@ properties:
>      maxItems: 1
> =20
>  patternProperties:
> -  '-pins$':
> +  '-cfg$':
>      type: object
>      additionalProperties: false
>      description:
> @@ -30,7 +30,7 @@ patternProperties:
>        pinctrl groups available on the machine.
> =20
>      patternProperties:
> -      '-cfg$':
> +      '-pins$':
>          type: object
>          allOf:
>            - $ref: /schemas/pinctrl/pincfg-node.yaml
> @@ -112,8 +112,8 @@ examples:
>          compatible =3D "canaan,k230-pinctrl";
>          reg =3D <0x91105000 0x100>;
> =20
> -        uart2-pins {
> -            uart2-pins-cfg {
> +        uart2-cfg {
> +            uart2-pins {
>                  pinmux =3D <0x503>, /* uart2 txd */
>                           <0x603>; /* uart2 rxd */
>                  slew-rate =3D <0>;
>=20
> ---
> base-commit: 0a4b866d08c6adaea2f4592d31edac6deeb4dcbd
> change-id: 20250526-k230-binding-fix-3125ff43f930
>=20
> Best regards,
> --=20
> Ze Huang <huangze@whut.edu.cn>
>=20

--sa1FTMnuAHPfsB0F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDXOAwAKCRB4tDGHoIJi
0lIaAP9XPa+r9fmfk69jSeVRmec3TkKNVVWTR2GA9dVUn0HVdQD/Wi7uFOI0aiMA
gqhzTBid+hn53nc3AD29aMz7BofHAAg=
=wJMJ
-----END PGP SIGNATURE-----

--sa1FTMnuAHPfsB0F--

