Return-Path: <linux-gpio+bounces-2630-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD1C83DEA7
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jan 2024 17:26:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5BD80B25534
	for <lists+linux-gpio@lfdr.de>; Fri, 26 Jan 2024 16:26:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D81BB1E87E;
	Fri, 26 Jan 2024 16:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b44/OZvQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEB21EA95;
	Fri, 26 Jan 2024 16:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706286346; cv=none; b=fdT5h9vZ5QtY3iIpzdlv9Y+7sOPL/2+FAp5B/7hR8epywnC8KNhHTOhDU2C5Zhok5g5G8ji0XR2pa9mIWFwTRj+86CpZW5P7/mW2qu9sKYJGmlIwnNFHqiXl/Kx7e4EIXeYrRF64C/LTt8LbzR0ySOGWg5b/mTkpPmoLn5ca4g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706286346; c=relaxed/simple;
	bh=tEiTgy5YTgZOJr30W4NNNP6rzoSFPsEg1pnYn4mgZPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZoYx9f+S0myKEgtpBQHq7FylPcwscsKxGZuYxH3tBwoX53TFvch6FugZ5dXc3kSJHQ6uI9qbN4IN0Mhm2rxbJx/gHxifMxx5uW0AE1JaiRKZshl4tODxaGIRrW78f2Se+NG6dwxVtv2C5bnVwcOYu269HupPg2P8z4pY+9iHAHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b44/OZvQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8117EC43390;
	Fri, 26 Jan 2024 16:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706286346;
	bh=tEiTgy5YTgZOJr30W4NNNP6rzoSFPsEg1pnYn4mgZPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b44/OZvQSzZzTSZ/CByymFsJolDprtk18C+RKJojolixC2krVroeopNpTKF78OG9c
	 sZ6kHXUwJPTFTHnqHTJOeW0cPl+YlrHw3bst8pY5WTEclV7K30F/GWH4jU+5G1ls1a
	 YcZBOJyTCPt76GlNH2RGrgyr/6lnc5HArb7fVvC2lobsoZo+qRXbYO04K1P+5JQfW4
	 MEh+lT7zKlRMb1eP/98b2QenX4yD/re8gnwsX72FZfNkqcX+QurDc3BicLaoA94njn
	 TSvJMJnlueGHAnWWvcAl2iACw3lg8qet1P23y8pSG3n3odAjjrEA9RIJcJIfisqekc
	 y+sef4ulsD1EA==
Date: Fri, 26 Jan 2024 16:25:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 01/14] dt-bindings: pinctrl: renesas,pfc: Document R-Car
 V4M support
Message-ID: <20240126-tutu-amusable-b34491e4a840@spud>
References: <cover.1706264667.git.geert+renesas@glider.be>
 <56685dc04af3cee7cb3751e855ed5b3679b14122.1706264667.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6ZCAmEGLm4Y6B1ay"
Content-Disposition: inline
In-Reply-To: <56685dc04af3cee7cb3751e855ed5b3679b14122.1706264667.git.geert+renesas@glider.be>


--6ZCAmEGLm4Y6B1ay
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 11:43:59AM +0100, Geert Uytterhoeven wrote:
> Document support for the Pin Function Controller (PFC) in the Renesas
> R-Car V4M (R8A779H0) SoC.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml b=
/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> index 181cd1676c0a2a36..5d84364d13589c5e 100644
> --- a/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,pfc.yaml
> @@ -46,6 +46,7 @@ properties:
>        - renesas,pfc-r8a779a0    # R-Car V3U
>        - renesas,pfc-r8a779f0    # R-Car S4-8
>        - renesas,pfc-r8a779g0    # R-Car V4H
> +      - renesas,pfc-r8a779h0    # R-Car V4M
>        - renesas,pfc-sh73a0      # SH-Mobile AG5
> =20
>    reg:
> --=20
> 2.34.1
>=20

--6ZCAmEGLm4Y6B1ay
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbPdBgAKCRB4tDGHoIJi
0kYNAP0SiF7Mf5X+Q8dojr23WnI8uM34ozkrFhi1Tt3Pw88GMgEA3qlTW63b4haO
QJgbjYveq6fezm+N/mFyDVDC9ndskAM=
=0aPG
-----END PGP SIGNATURE-----

--6ZCAmEGLm4Y6B1ay--

