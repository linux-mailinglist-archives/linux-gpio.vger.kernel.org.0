Return-Path: <linux-gpio+bounces-16292-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF1FA3DA6A
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 13:50:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6BAE53BFFFB
	for <lists+linux-gpio@lfdr.de>; Thu, 20 Feb 2025 12:49:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B361A1F561B;
	Thu, 20 Feb 2025 12:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qMs84AMW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B6C1F3FCB;
	Thu, 20 Feb 2025 12:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740055750; cv=none; b=gdMV/drx4WaLFdLt9wx43E50nH+Pov8puFeJm0JiPAcmeb7r43u5Czhb4foWLGyPn3L1uOV3ERFgvyXgN//RoRQ5m5mzzntokLVIOoPlNmZO38FQgEeFDCZmT6OhjcQJpCQNtsU4po5IbNN0w86uhnA7UFVaT7LMYK9aDTdHrPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740055750; c=relaxed/simple;
	bh=1EYif3wQJFRdpUCSTBm7AnM6o4coTGFufZMp24neVSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GsXEJPTfrqdsUUdFm1tX1DOB7PMlPXRUpi/0ZfMLN2GYEgj/Ta3rCCfwlXLoM3x3bnUspq3EIu5jelNCKDD/lDICNEZM3HPsLrRqs8iRcEXBPt5l5A5rUqRjuqghjZSRSpUZU+GnQWVqIJs1Ww2sbfy+W8KeUQXtdIsAyGouXNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qMs84AMW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2775C4CED1;
	Thu, 20 Feb 2025 12:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740055750;
	bh=1EYif3wQJFRdpUCSTBm7AnM6o4coTGFufZMp24neVSI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qMs84AMW7ugfVZut9xt/VbJKuvnB72rT5GDRNSA6oauYgcJGHhJgedH9Ed2JhDgM/
	 cyxuyYAkGNWV0cKzH/3ADqhmlYuQzN4uoY7Kw8yoA7M2YFz9921jxxH9t03KQiGQfE
	 TcaAVqsXabSCADVQ3l+nEzs35JUSedwupFzVAN3i9TdWpAnlIdZcNsg4ed7hYIaMBV
	 1L5FVN1P3jbjeE2GsufUM1KfdYU3r/pPnT+OcFi7ALj4OQ7o5uyKhpTuGxHQiXC4Ec
	 vfgIweO/B4cDguGN+5YWRVcCQHDDlkdaDdKq+CCF55R3R4Z2ykbApw/h32jWA2vUfS
	 BrtyHsIVgLCxQ==
Date: Thu, 20 Feb 2025 12:49:06 +0000
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH] gpiolib: don't bail out if get_direction() fails in
 gpiochip_add_data()
Message-ID: <Z7ckwrBUgqLyEBSB@finisterre.sirena.org.uk>
References: <20250219144356.258635-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jF4LZQGo19Kv/6Vc"
Content-Disposition: inline
In-Reply-To: <20250219144356.258635-1-brgl@bgdev.pl>
X-Cookie: Editing is a rewording activity.


--jF4LZQGo19Kv/6Vc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 03:43:56PM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> Since commit 9d846b1aebbe ("gpiolib: check the return value of
> gpio_chip::get_direction()") we check the return value of the
> get_direction() callback as per its API contract. Some drivers have been
> observed to fail to register now as they may call get_direction() in
> gpiochip_add_data() in contexts where it has always silently failed.
> Until we audit all drivers, replace the bail-out to a kernel log
> warning.

For at least one of the affected boards:

Tested-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Mark Brown <broonie@kernel.org>

--jF4LZQGo19Kv/6Vc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAme3JMIACgkQJNaLcl1U
h9Dnmwf4mxcie6ZU6YdgcT3L2CV4nI3moL3OBgFvZnui9t2T55gthTEm2ai576jS
nTbhLwDFKIEZYyNQc0qXDIipNeOKjxYDnImG1KR/F36G7KYNh+NkmsMqZEtRMABB
JukM2ymwJhjs+IBpierG3HChbBfwtYMTJDc7srRPuNeSiaq5w9SbqtRzBrG3vxiT
Cz/Ysw6DRJY0E2h21swc1ORL1SJGEHOqVA5YIMa3A6wVuT93Qak2cGLS3ZHSsHKS
zL4iLkInqBJmJxFmACwTQ9FAsaC1YgQdkNuVYTvQ8iSyzd3i7+0nxp4DfY+AhTfR
fsErt8UF9tCIJL6r0RIRFBYvIzfm
=WTjH
-----END PGP SIGNATURE-----

--jF4LZQGo19Kv/6Vc--

