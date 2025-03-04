Return-Path: <linux-gpio+bounces-17067-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BBCA4E689
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 17:45:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C8E8425308
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Mar 2025 16:39:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEC5C280CCC;
	Tue,  4 Mar 2025 16:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dpvztu/U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B86259CA0;
	Tue,  4 Mar 2025 16:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741105106; cv=none; b=YjPA/uGAqaSmMZ5Z1UgQ3DBHrgAurfXHUcl2lplC5DZsSUq7KQm7JE3sGMuteT1GiEcteXBFrZqgQqlCgZjE8SBnpbgALAbovJrIblf6UI5FH7yMGJqPFfJliadUNubIMz1Xf/USTsVy/EE9X60iPxKdK57oPhD+tVN7LB/3wb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741105106; c=relaxed/simple;
	bh=XhtYLV02qtbsJ7+TV85fVvw/Qxk6F/Hh9cvsI0OjeqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=boeYWl3E3q/5pp0qEp7uZImZzWKyWxEeLvIJCtOd8Xu88mIJF+IwR2tL7bAsAeLFZ0LkfPoMD0HocLxk7twwYtNYfVpPRRkVTSjg/VwhDnPr/3zOmErS0bY79HzOwH6zj0SHRCc++aCDCsB+xpqGK4cdKvc0Bk34X4SFHV0qxis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dpvztu/U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 000EFC4CEE5;
	Tue,  4 Mar 2025 16:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741105104;
	bh=XhtYLV02qtbsJ7+TV85fVvw/Qxk6F/Hh9cvsI0OjeqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Dpvztu/URG1nraLrZK66ui8QddhoqBabtvjnTJ45RdC3oW/wrWuuoM/q1Pq+7B97d
	 P/NuEzIsAX7tegU4t6n9LSh1DViOr2G2n8vMDOSgZLfo9xPHm3FEdxAiVcwiZgdlHT
	 980Weqz3d1eL4c3JeVxQwTH1duzb3mH3zayiKFEmG6fz/4bX7Wl/NKPmoBw1riJuJc
	 66v4Fi94oEo8SEYU1/7RIBUzTSrcWYcFJUAMgdZno8OYZiAtJ1jhH7s1jJmQ0wlbSZ
	 e7gAIvKWkl2qP1FjQLsyCs9EAE5sgUjRBD95IA5CqGlgpZgnRJtezba1T4ObgSDQNB
	 FC62RSs+eu4bA==
Date: Tue, 4 Mar 2025 16:18:20 +0000
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 0/6] ASoC: samsung: GPIO descriptor conversion
Message-ID: <7da76b50-67fd-4273-83a3-300f734f7922@sirena.org.uk>
References: <20250303-samsung-codecs-v1-0-56a2299dd928@linaro.org>
 <174110255924.87345.17067818310965896666.b4-ty@kernel.org>
 <CAMRc=MfqNSZeQxBuEfM1nAo0F3NmEkyG-Les3dyxxuun=4XpuQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+ZFwNRSVfzGqExSp"
Content-Disposition: inline
In-Reply-To: <CAMRc=MfqNSZeQxBuEfM1nAo0F3NmEkyG-Les3dyxxuun=4XpuQ@mail.gmail.com>
X-Cookie: Do not disturb.


--+ZFwNRSVfzGqExSp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 04, 2025 at 04:48:54PM +0100, Bartosz Golaszewski wrote:
> On Tue, Mar 4, 2025 at 4:36=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:

> > [4/6] ASoC: samsung: speyside: Convert to GPIO descriptor
> >       commit: da9146c19b1774926148ff271c4a3dc8d7891b18

> I pointed out an issue with patch 4. :(

Oh, sorry - you didn't cut any context so I think it just flashed by
while paging through the entire message as I was scanning for responses.
One of the reasons for cutting uneeded context is it makes it easier to
spot the new content in your message.  It's an issue which can be easily
addressed incrementally in any case.

--+ZFwNRSVfzGqExSp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfHJ8sACgkQJNaLcl1U
h9DH9gf+OVJU37vK8yaU3Mz+qk5DhrweZGTM0BSg//dtPms0VpXZBfsfYezs+Ok8
o06hRnLequ9qlMSYpbCZKTlIUD/VLWxtamnw+qQByA4UtUGoaCyaHafblWNii8Pt
szMAIGyzN+Px7YCqVUe1OH0kJNThyGmx6OAnOFfqTuDHzGXEFnJ5FUoxfEZlFcFp
GBB/Q7XZDebfnMpdzY54PCiNl+yHYJ1UwczZMqlEULygHg8/IGa++nsHXm+ciOJF
il1UQ/GHk5e9CXm2cdYp38Bj2UmN6Zs3hmkWuVE34+gTcAc2si3QW2tD8LhTeFrr
WLOhgUgjBEd1+bA99iuE7JdJjec3FQ==
=Qt2b
-----END PGP SIGNATURE-----

--+ZFwNRSVfzGqExSp--

