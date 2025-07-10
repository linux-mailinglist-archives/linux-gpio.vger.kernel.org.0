Return-Path: <linux-gpio+bounces-23072-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3A0AFFE93
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 11:57:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9990B1BC5858
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 09:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 865982D5415;
	Thu, 10 Jul 2025 09:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VG5AImNd"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EFCD1E505;
	Thu, 10 Jul 2025 09:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752141469; cv=none; b=gQz/wgLQasi1t/dVoVKR8WZr2XKGNxmd1wJ3iuQFNB8un4P0EHs/BrcanDE6A4fKtA4/hryhPOFlyoCmxGrRBu74nTKonu2JuPO7Z39Z1SgaOwnuDdneNhuQr4IZAuwhm21l02sCocPx+Dx2BicsLwM9L08/E7iP7giKC3/rAqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752141469; c=relaxed/simple;
	bh=/yShGNEk9UTX6Yk2kGn6nqjCpqsXL4VZjFrHyVgaYm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mekUTC0MNovBkux1h3sPbQWvNVRWr3SBBlfgPT+3DwbFmozXxdtmYa7NQvczIO7oPzrXZzUg6Bfk8DkMMkC+59qexk7Lh3kojcCgCbcg4s/NaAfyUIX/QmlFLAA1gIHf9HZDiNkZRnbgfFhn0rA4ufajGM/+X9qfaHnQQvXYgy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VG5AImNd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6018EC4CEE3;
	Thu, 10 Jul 2025 09:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752141468;
	bh=/yShGNEk9UTX6Yk2kGn6nqjCpqsXL4VZjFrHyVgaYm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VG5AImNdHgSpHCOVk0DfMNni9YbQ7Amu1qdb3FUm4YG16wlEzTEkZ9an+o6vZs4Vc
	 zN3V8JGFv8zzcwjl9K/n7wOf0FCXrT4zHWjE9r3SCF2Q4nfNwZdK9dcvFtCCxnNNYq
	 /IkD1cjm8sjKIDW75jM7zlBr8X4/n92ANMREebshxAw9Lfmn9y+ZPrrg7Sgnx22RMm
	 6erzy7aKMWqTlq4l+h6NZ6DHtV9iJ+E4SSN2KjY6h19EUCVcZc8LV9IQ5SE7HAZ1SO
	 heNdIY2jrx/VJQ+6mZSnw/4+flNyFjFR+kep1MxireRU515/4x3sCg6Hgpauq5hCC+
	 ZEgtj+EZfRw/A==
Date: Thu, 10 Jul 2025 10:57:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Julien Panis <jpanis@baylibre.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [GIT PULL] Immutable branch between MFD, Misc and Pinctrl due
 for the v6.17 merge window
Message-ID: <aG-OmSNn-oULfEuB@finisterre.sirena.org.uk>
References: <20250613114518.1772109-1-mwalle@kernel.org>
 <20250710094906.GG1431498@google.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6GuKZvfhqR+w1mQg"
Content-Disposition: inline
In-Reply-To: <20250710094906.GG1431498@google.com>
X-Cookie: Do not cut switchbacks.


--6GuKZvfhqR+w1mQg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 10, 2025 at 10:49:06AM +0100, Lee Jones wrote:
> Enjoy!
>=20
> The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd13544=
94:
>=20
>   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-misc-p=
inctrl-v6.17
>=20
> for you to fetch changes up to d90171bc2e5f69c038d1807e6f64fba3d1ad6bee:
>=20
>   dt-bindings: mfd: ti,tps6594: Add TI TPS652G1 PMIC (2025-07-10 10:40:21=
 +0100)
>=20
> ----------------------------------------------------------------
> Immutable branch between MFD, Misc and Pinctrl due for the v6.17 merge wi=
ndow

Is there some reason you didn't also pick up the regulator patches?

--6GuKZvfhqR+w1mQg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhvjpgACgkQJNaLcl1U
h9Cu4Qf8DFPE3vhnDpfdDE56jxlkyTLPsMOlk+NoUpDXZxF9WTZ41iXIs0A4QOiA
RqST4Kh9fYJeE+hzkJ2a9LDniBmvCyBMUritQ5uHW75LXYt6EBO85xSmvZQwH1q5
CaLWDsN9lv5C6XcUJLEiIaX2VuhemrCfR+CI9zyfkQHFb6wti9nUv6W062U0qZPk
5z5mfMAmlYhEJFQ08ofdAsv7HVxkpAI+WL0xyE5s4/X8XkY5AE2FtUzNd/Jnd/do
JoUwktNigqdcQGt2XX65PhkkzPXvKiHehGwE8pWBQXLnBcLP694yE6cgE56OD9sq
Oxo/c4xjQpTcimdQydnPx5vAtUJ/qw==
=qm/y
-----END PGP SIGNATURE-----

--6GuKZvfhqR+w1mQg--

