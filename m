Return-Path: <linux-gpio+bounces-29422-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A3324CB320D
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Dec 2025 15:22:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 687C1304D9F6
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Dec 2025 14:22:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CFFA21423C;
	Wed, 10 Dec 2025 14:22:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J+YNsYTC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FA6770FE;
	Wed, 10 Dec 2025 14:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765376526; cv=none; b=eyU1A8HYO/8Edfegcxr8/vkTxkXqBZq681OuJMY5XlfAApu/r0+vE0gvfLw7/C3yDLrNnogHfG33N6ZDa4jm2c0ZdfJzQyR/5FbFh8gpXoRnlVTDq/R0GQX8WW+Tn18riga9LcVqmALRPq1eRhWPjW4ay0kf99/Wa0srBAy4QgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765376526; c=relaxed/simple;
	bh=bBr7KcBbuoQDAneXGSb6gOD25yKQkRm86VgMyLp7SLk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VKpndLA+2O1fentCcX1gsw9FcmUWrjCVE4fKVOoi4JWz0UfZf3LLZSCKpUfEkjkGilbZAKOmc3R0jih9VMxydtM7VySuGtCsebJbnFIO6xI5mMqRAh75lrYXYBC0mjx5M5QvwSjQX+BFqfuljNtOVDbxqHdGArnOiAC67Cc2qhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J+YNsYTC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E257C4CEF1;
	Wed, 10 Dec 2025 14:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765376525;
	bh=bBr7KcBbuoQDAneXGSb6gOD25yKQkRm86VgMyLp7SLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J+YNsYTCf23lo0sNPYycdOB4QfzU5NmqdYVc+Ob6I0gha7Y97fPtmfarlftFO0LUr
	 O61XSxaJOBMnoGr5obL9TbQ0CX/QHVCMGAR1MdAi2bWSjgyjCkKI5WWC2l1Qg+55JU
	 DMPis0BokqVVTEOKaZkTOokgqVq/ZZn0PMKqfVl9M+7dHInNN1XQWQNhkX2V7ZsGFH
	 XDTGK9el5neJbdYebe9m76SSFLbDmOpq0TNVKMGSkgKs4HmwLZp3IZqgVcBH6cSUTi
	 xLxxKLmPNPAnnEBM/wBNH1HFyMW5xiNBNFl4hS5DyfKD6L4J0lbYS8WLoeHRtV3Hmt
	 3gFXxI1N02KNw==
Date: Wed, 10 Dec 2025 14:22:02 +0000
From: Conor Dooley <conor@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH] pinctrl: fix compile test defaults
Message-ID: <20251210-judiciary-borough-1c28d14b9a3f@spud>
References: <20251210034148.34447-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s2hysrZfZNo1cFt2"
Content-Disposition: inline
In-Reply-To: <20251210034148.34447-1-johan@kernel.org>


--s2hysrZfZNo1cFt2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 10, 2025 at 12:41:48PM +0900, Johan Hovold wrote:
> Enabling compile testing should not enable every individual driver (we
> have "allyesconfig" for that) but two new drivers got this wrong.
>=20
> Fixes: 38cf9d641314 ("pinctrl: add pic64gx "gpio2" pinmux driver")
> Fixes: 46397274da22 ("pinctrl: add polarfire soc iomux0 pinmux driver")
> Cc: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/pinctrl/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> index bc7f37afc48b..ce5685215b92 100644
> --- a/drivers/pinctrl/Kconfig
> +++ b/drivers/pinctrl/Kconfig
> @@ -491,7 +491,7 @@ config PINCTRL_PIC64GX
>  	depends on ARCH_MICROCHIP || COMPILE_TEST
>  	depends on OF
>  	select GENERIC_PINCONF
> -	default y
> +	default ARCH_MICROCHIP

Nah, not a fan of this kind of thing, please just make it default n if
this compile test behaviour bothers you.

>  	help
>  	  This selects the pinctrl driver for gpio2 on pic64gx.
> =20
> @@ -511,7 +511,7 @@ config PINCTRL_POLARFIRE_SOC
>  	depends on ARCH_MICROCHIP || COMPILE_TEST
>  	depends on OF
>  	select GENERIC_PINCONF
> -	default y
> +	default ARCH_MICROCHIP
>  	help
>  	  This selects the pinctrl driver for Microchip Polarfire SoC.
> =20
> --=20
> 2.52.0
>=20

--s2hysrZfZNo1cFt2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaTmCBQAKCRB4tDGHoIJi
0sY8AP40UGW5QvAO4lgcrnPYI6YaKkZriKLkdzN9W7P/OOcBcwD/WA7/7mkx2/D4
vPxPNz+y8yZjLTHGPO/ZbAJw7LN5TwA=
=FiVi
-----END PGP SIGNATURE-----

--s2hysrZfZNo1cFt2--

