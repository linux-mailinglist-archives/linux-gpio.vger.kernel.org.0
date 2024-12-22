Return-Path: <linux-gpio+bounces-14135-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2499FA63C
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Dec 2024 15:49:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EBD1188653C
	for <lists+linux-gpio@lfdr.de>; Sun, 22 Dec 2024 14:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8708E18F2C1;
	Sun, 22 Dec 2024 14:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CwOLa0NH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4D0282EE;
	Sun, 22 Dec 2024 14:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734878941; cv=none; b=EEehqnpLAQZnzztGUSfI9XwvPnYEOiUhcqLWLUO4UtmCcl/8D+YKAsVbVgvCkEQ13kX8HBQE6s0cBWCAqkI/F6nwOModGPZTgQFPrwKzOtO6M1Ea3+ZRHHF1bmY1GIv4Ya3OT3abTwS9IdUwjoqGTsnk8PUsQYkZIuXCvJRc8Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734878941; c=relaxed/simple;
	bh=+0JuRS1+pxAE7ViJS52geGKtFuPTzF7INi/AI1l7fkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RcFHXM6lgK4swJvKspYtLfxJsKiH01qNmeT3qT0TZemA3NCqZd9xyFDbN64sL50L2m5LqURkpkv8X9lh7zQke/VBQEW2DPEZlw9H71AhA/gZxNT/HtxDEesu4RblnMrwE8IbIDZghs0B1sRJkDrYx0nuLRu/YJswNroaSegILBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CwOLa0NH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3BDFC4CECD;
	Sun, 22 Dec 2024 14:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734878940;
	bh=+0JuRS1+pxAE7ViJS52geGKtFuPTzF7INi/AI1l7fkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CwOLa0NHJg75u0bw8qHidkLoSBn5jKkmZC1XT8plBAgmnxG/sNYZiGlOccGTI5au4
	 R5DZYXI8LnEul7stQRXMANXJTpszvPGv1tgzUoI05NzCWx/NdKT6YcqwqU2rMDXYOT
	 SYJrVHIkcPWgafe0I9yxj+9V6OFG8/aGMMXC8xLBWx9kQZ2CEwSB66o7jMle9QuO35
	 PMTBxpTonZtnvnVSjp107MUWp13uevi4ycI+cuMYYDiHkBpk6AIbPWB1iCoPHOafbw
	 FKrCr2E/WL5Oa1B0/4/i/AGfxjRTAKq2wZgzClIo7/e440NCKW2b/rs9lmQGX9XD3C
	 z9IBxv7un4sEg==
Date: Sun, 22 Dec 2024 14:48:56 +0000
From: Conor Dooley <conor@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 04/38] dt-bindings: pinctrl: Add rk3562 pinctrl support
Message-ID: <20241222-moonscape-humongous-65531a3f1f3d@spud>
References: <20241220103825.3509421-1-kever.yang@rock-chips.com>
 <20241220103825.3509421-5-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ALomkr6kdjlU1kTz"
Content-Disposition: inline
In-Reply-To: <20241220103825.3509421-5-kever.yang@rock-chips.com>


--ALomkr6kdjlU1kTz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 20, 2024 at 06:37:50PM +0800, Kever Yang wrote:
> Add the compatible string for the rk3562 SoC.
>=20
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>=20
>  Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.y=
aml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> index 6a23d845f1f2..80a2b1934849 100644
> --- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
> @@ -44,6 +44,7 @@ properties:
>        - rockchip,rk3328-pinctrl
>        - rockchip,rk3368-pinctrl
>        - rockchip,rk3399-pinctrl
> +      - rockchip,rk3562-pinctrl
>        - rockchip,rk3568-pinctrl
>        - rockchip,rk3576-pinctrl
>        - rockchip,rk3588-pinctrl
> --=20
> 2.25.1
>=20

--ALomkr6kdjlU1kTz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2gm2AAKCRB4tDGHoIJi
0rJ+AP9jKt+goJkQoANa5w9EFvOUIPEWZxBmo2FrqduMEy2E+wD/Xk92XG4/tpD1
TvQLAzDCEXwa95oanEMJEx9Ov5WmpQg=
=cZw4
-----END PGP SIGNATURE-----

--ALomkr6kdjlU1kTz--

