Return-Path: <linux-gpio+bounces-30196-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D89D4CF84EE
	for <lists+linux-gpio@lfdr.de>; Tue, 06 Jan 2026 13:25:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3287A3060890
	for <lists+linux-gpio@lfdr.de>; Tue,  6 Jan 2026 12:21:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4385032E132;
	Tue,  6 Jan 2026 12:21:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gIbYfj9j"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAB7432D45B;
	Tue,  6 Jan 2026 12:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767702074; cv=none; b=tRbGDKWdsnytHXJallGeuHqG5Ecml0DbY2szzEZhZLWFbIC4tIrttfDpo7u6Uh3+le2X/7iQIsMcS02Djzr3udk7c7mwVG1lH/s4XXAVAwdFDVYgjVrsMAUVLJMzSgVd5Hyz18LovV/aFrs7fEzWz4prtsW8Ha7FbD2dYSVVpiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767702074; c=relaxed/simple;
	bh=/FW8ps6pxXXlw2luJiOk+CvVS5wOhKku3s0GylKczrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nwFJvYiydjKQqdOP1m14C8BZ+VVrS0Y4457S4y3dvP50nPw5y+2eZP/kAbLy1EvIIfd4hVNVGYMBFrvkqd7YyVEkpkJujDHaCTMCl4UsRKdXq36VPmK0gv9vpK2M+FM4whUKGS5sLXk+zmGbWeBqWdyTGVKwDMVwJjLOnENq5hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gIbYfj9j; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50D89C19422;
	Tue,  6 Jan 2026 12:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767702073;
	bh=/FW8ps6pxXXlw2luJiOk+CvVS5wOhKku3s0GylKczrQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gIbYfj9jr+qSj8GCTiUPpvjBGljoFWqdrva81Bd/RRvztIunxIWQ1FzppFxiZg9jc
	 6L36NlfhQwA5/28SdOmdriBM5HG3dC0jPADYnVBUB8pTQPolK7FiVzQtjOfys55M90
	 UvsiAR34wLcv6VyAryKXSnb53Pf2uyQ3oVOAN22CBX/ZqpD7C8lvoHduCGp1FCWkto
	 xr91BgE8bj2kMJxWuP8vvw/1XbEeT0zrbBOZB/uSs1W3fRDcoPDzb18Syn7sMlr7di
	 k9POpE+I5zJrToXKdvM57m/+uwtdtHiAE8wEM4rJg1hv/uX/idXlYJggFZKlvykz+W
	 jz3RLgBo/pAbQ==
Date: Tue, 6 Jan 2026 12:21:09 +0000
From: Mark Brown <broonie@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] gpio: shared: allow sharing a reset-gpios pin
 between reset-gpio and gpiolib
Message-ID: <9948f635-b753-44cf-8977-7fee4cfb6e3d@sirena.org.uk>
References: <20251222-gpio-shared-reset-gpio-proxy-v1-0-8d4bba7d8c14@oss.qualcomm.com>
 <20251222-gpio-shared-reset-gpio-proxy-v1-3-8d4bba7d8c14@oss.qualcomm.com>
 <CGME20260105115023eucas1p1af1f8e80041f94843beb664966894fb9@eucas1p1.samsung.com>
 <00107523-7737-4b92-a785-14ce4e93b8cb@samsung.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l4Fe2VIbQaulikkt"
Content-Disposition: inline
In-Reply-To: <00107523-7737-4b92-a785-14ce4e93b8cb@samsung.com>
X-Cookie: I will not forget you.


--l4Fe2VIbQaulikkt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 05, 2026 at 12:50:22PM +0100, Marek Szyprowski wrote:
> On 22.12.2025 11:01, Bartosz Golaszewski wrote:
> > We currently support sharing GPIOs between multiple devices whose drive=
rs
> > use either the GPIOLIB API *OR* the reset control API but not both at
> > the same time.

> This patch landed in linux-next as commit 49416483a953 ("gpio: shared:=20
> allow sharing a reset-gpios pin between reset-gpio and gpiolib"). In my=
=20
> tests I found that it breaks booting and triggers warnings on some of my=
=20
> test boards. Reverting it on top of next-20260105 fixes those issues.=20
> Let me know if I can help debugging this issue.

Not sure if it's this specific patch (one of the bisects identified it,
but I'm seeing others going to the merge commit for the gpio fixes
branch) but I'm also seeing issues with gpios.  pwrseq is affected on
several platforms after backtraces that look a lot like the one that
Marek is seeing on Raspberry Pi 3B+ (which I also see).  This breaks at
least the WiFi:

[   13.475670] platform wifi-pwrseq: deferred probe pending: pwrseq_simple:=
 reset control not ready

Raspberry Pi 4:

   https://lava.sirena.org.uk/scheduler/job/2335022#L1200

Toradax Mallow (TI K3):
  =20
   https://lava.sirena.org.uk/scheduler/job/2335415#L1457

--l4Fe2VIbQaulikkt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmlc/jQACgkQJNaLcl1U
h9AIQAf+MHrzNu3aysPrnhQZqhc0fQm6gTUePEEZadiJtUxk3MQ1qsyqEjjCyPNN
BXjTDMPPuecS/YQ4TLLfKBC950EHr+eTEakUCUWGimCCD88B+5XeXyxQiK2gFUOl
XqqwQVkAyX4FPFhCCapy2nN+03e7I5K7BQNgtn5TtigI308DjVoW05h/Hn819g1t
9mP8G78lnqtgrWrPRcrJcgdFPmlRyTC1eBJ2e9I4kbNHxOtsL9Rr7fzeBnesqbag
GQXXFtqvNnoVQkW0G+TyceYQi6wkZCJFo/AQ8r8fQ5SVTidcGay07KdFgERW3z8j
WmIbD6AauPGgDfM0t+udTjukPfTJ4A==
=ax5A
-----END PGP SIGNATURE-----

--l4Fe2VIbQaulikkt--

