Return-Path: <linux-gpio+bounces-22520-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BFAAEFF1F
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 18:11:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8559A3BE3F8
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Jul 2025 16:08:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A2427A918;
	Tue,  1 Jul 2025 16:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cuFhaSHD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C85D27703A;
	Tue,  1 Jul 2025 16:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751386130; cv=none; b=fvc2qQgTAe0Jr156hBAPgMexuBfYnwq0iuJTxpTpMFXGaXq/MRAVoCcu/aIoDFv0cyYBdYY+sHvMG1eth/9E3+G9Z7kE8d8B75kSQbipA2eyfsNelpG9O3+i/SBT+iQP2X/doQwbbXMCNf2BYRDkkWaD/1C9rJThqUu8VOR2do8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751386130; c=relaxed/simple;
	bh=cSdRz0+Vph5c0cn4p2UTtWwJEHxmrCBQ1XvTs7jlibo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YEaqc/kqO7qsTDHvuFEBCYRRwlE+uMQq6DN4Vv1K9ZxLDGLdZKNo22MMpSHXqcFdaKjgzI5GoPobh8m21GtNt4uOXWE/RN2eVnWrUd7yRRZxVOoS74torpGTbqVmJtIMbiHcyceJXEz47fNRs9ESsv3rbId4V/y7NF6LB4j6/JE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cuFhaSHD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF49AC4CEEB;
	Tue,  1 Jul 2025 16:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751386129;
	bh=cSdRz0+Vph5c0cn4p2UTtWwJEHxmrCBQ1XvTs7jlibo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cuFhaSHDAVgWvq7HUuEg9fCe8TENJ191iB4eAR5BiE4zempPB55qfMAa0dfP+9hTQ
	 7u4kxMp+rjbHlKajyJkeCs2V5hnnSy9JTL9xYxxQg7fdgdjGl27byVEkKMDe4kZTAr
	 OOWTKdi5//OatEJ22nbaFa4Z+ad1bfEXLqOqevpx/wec9G/jZq79ceqRNfA1jK3ou3
	 ET9Gj/CRwbVHL6vL3Z+GLr/YYQV/vmbCRDAafcMRFhzM3X6CbFx4Bep8lOYbl+02k9
	 5aZjsUOWSLuPzft4TQ9EzLDO6eetUw9Cpfv0WdOvx67iyzfgsj/GPnCNuaznfCGLt2
	 1thNAdRmzTkvw==
Date: Tue, 1 Jul 2025 17:08:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Maria Garcia <mariagarcia7293@gmail.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maria Garcia <mgarcia@qblox.com>
Subject: Re: [PATCH 1/2] dt-bindings: gpio: pca95xx: add TI TCA6418
Message-ID: <20250701-taunt-tasting-71cede1f14c4@spud>
References: <20250701100537.91491-1-mariagarcia7293@gmail.com>
 <20250701100537.91491-2-mariagarcia7293@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hbRYoNHRBHhoLqZ0"
Content-Disposition: inline
In-Reply-To: <20250701100537.91491-2-mariagarcia7293@gmail.com>


--hbRYoNHRBHhoLqZ0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 01, 2025 at 12:05:36PM +0200, Maria Garcia wrote:
> The TCA6418E is a 18-channel I2C I/O expander with integrated ESD
> protection.
>=20
> Signed-off-by: Maria Garcia <mariagarcia7293@gmail.com>
> Acked-by: Conor Dooley <conor@kernel.org>

This tag is fake, I never provide tags using that email address.
Please do not make up tags, instead copy them exactly as they are given
to you:
https://lore.kernel.org/all/20250618-concierge-fencing-e62c1e884ce9@spud/

Additionally, you forgot to mark this patch as v2.

Cheers,
Conor.

> ---
>  Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/D=
ocumentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> index 4d3f52f8d1b8..12134c737ad8 100644
> --- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> +++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
> @@ -68,6 +68,7 @@ properties:
>                - ti,pca9536
>                - ti,tca6408
>                - ti,tca6416
> +              - ti,tca6418
>                - ti,tca6424
>                - ti,tca9535
>                - ti,tca9538
> --=20
> 2.43.0
>=20

--hbRYoNHRBHhoLqZ0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaGQIDQAKCRB4tDGHoIJi
0pAjAQCJWHuKInPaPBiJFtjeWi1Ol/SFGNyOoglbXknEcrinkQEAuHu/YXAKiOZk
uOGnqeXB9iUuU9ptER0lQWwfk9cgbAE=
=pn/Q
-----END PGP SIGNATURE-----

--hbRYoNHRBHhoLqZ0--

