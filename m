Return-Path: <linux-gpio+bounces-29466-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C73FCB7A11
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 03:09:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0144D301EC6A
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Dec 2025 02:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317E927702E;
	Fri, 12 Dec 2025 02:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X9JkZXlE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2281205E25;
	Fri, 12 Dec 2025 02:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765505347; cv=none; b=vCOLXmCLyilpI4vL25sWw+sUpsFitYOoafL2jnKMbYIixCaCmnk99NxUIPod7SdaD+t2+NruPFOGj8ezzUvQ7gbSa5FvEs2wylRx+qfIy/T3BqnS7HpKmyWTDvTHpsSD1X3m+otr9vFPJwlF3UJ+ZGIsfgpoZlvcGDKhG1VNblw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765505347; c=relaxed/simple;
	bh=b/6MF9dZ7kt81ABG2Zt6Y944fvYJeF2HF+f1Yn9JLnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IdTctYHWWDD0eXkH/rCSfexEsmlwnqtAF8VrbVuRkpZaqp4khyE+bwkQpVYVeeHmznqO2xhv3SXVOIdShcV7o8FSN+z0aOnDhIwOSdKxmeNlfAUpg/7LyK6Yh3jk0y3KVOPaYkOnO1vGGWtqRw29u4CPdjf7t+AZhb1Q+ZSNtGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X9JkZXlE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF1AC113D0;
	Fri, 12 Dec 2025 02:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765505346;
	bh=b/6MF9dZ7kt81ABG2Zt6Y944fvYJeF2HF+f1Yn9JLnY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X9JkZXlEDbv8+wlOyhsGiced7J/rLCxmifkwW1xP8RU0POQ0aS0Swo9WJ0qOxe3OO
	 RHxs1rjsPD6fRfW5tIg56uDGQZhL7ztBNgrQ60mcB9wDwDWBUReKbs6wF1mMMd5ysE
	 gvoV/qpRez7AMrf6qd6os/zOUUjcUZCg7Ku6za8u/Dw7/jRDEOuVtCULo9mSFWjWJD
	 RPrKwr4fTcfW8mh6dbZr/pQuJRuXxIHBeRajSCqn0V7VTOOkfcw169FlPKjjxgTQEQ
	 w6mOj3qItrsxZdEVGafpuu30SlEgZiQs1yt1LXI18yzLPWFWJSmgXvjvQBgSBxsZiQ
	 5Ildums3HD8EQ==
Received: from johan by theta with local (Exim 4.99)
	(envelope-from <johan@kernel.org>)
	id 1vTsdG-000000007Uu-0nQk;
	Fri, 12 Dec 2025 11:11:46 +0900
Date: Fri, 12 Dec 2025 11:11:46 +0900
From: Johan Hovold <johan@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH] pinctrl: fix compile test defaults
Message-ID: <aTt54n03zxkY3joO@hovoldconsulting.com>
References: <20251210034148.34447-1-johan@kernel.org>
 <20251210-judiciary-borough-1c28d14b9a3f@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j8Lwa6L/2Jjyg0Yo"
Content-Disposition: inline
In-Reply-To: <20251210-judiciary-borough-1c28d14b9a3f@spud>


--j8Lwa6L/2Jjyg0Yo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 10, 2025 at 02:22:02PM +0000, Conor Dooley wrote:
> On Wed, Dec 10, 2025 at 12:41:48PM +0900, Johan Hovold wrote:
> > Enabling compile testing should not enable every individual driver (we
> > have "allyesconfig" for that) but two new drivers got this wrong.
> >=20
> > Fixes: 38cf9d641314 ("pinctrl: add pic64gx "gpio2" pinmux driver")
> > Fixes: 46397274da22 ("pinctrl: add polarfire soc iomux0 pinmux driver")
> > Cc: Conor Dooley <conor.dooley@microchip.com>
> > Signed-off-by: Johan Hovold <johan@kernel.org>
> > ---
> >  drivers/pinctrl/Kconfig | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
> > index bc7f37afc48b..ce5685215b92 100644
> > --- a/drivers/pinctrl/Kconfig
> > +++ b/drivers/pinctrl/Kconfig
> > @@ -491,7 +491,7 @@ config PINCTRL_PIC64GX
> >  	depends on ARCH_MICROCHIP || COMPILE_TEST
> >  	depends on OF
> >  	select GENERIC_PINCONF
> > -	default y
> > +	default ARCH_MICROCHIP
>=20
> Nah, not a fan of this kind of thing, please just make it default n if
> this compile test behaviour bothers you.

Sure, I guess that's better here as these drivers are not needed in
every Microchip build either.

Johan

--j8Lwa6L/2Jjyg0Yo
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCaTt51wAKCRALxc3C7H1l
CNDLAPoC6kOi6ju/VsMBiVo8OA4tsZaNChH3crF4HQPratmzNQEAu/Ww2NLKxAKB
a2gWJsxInYEIxU6+Qrs9sxCIOi49mAk=
=jrPg
-----END PGP SIGNATURE-----

--j8Lwa6L/2Jjyg0Yo--

