Return-Path: <linux-gpio+bounces-7426-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0E7906C72
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 13:50:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1C2D81C21CC2
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 11:50:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A78E145323;
	Thu, 13 Jun 2024 11:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="f/hC9/6I"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6161A144D3F
	for <linux-gpio@vger.kernel.org>; Thu, 13 Jun 2024 11:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718279300; cv=none; b=snxsWXqVnGnmpYMWk0O32UC6+eCkUBPj/hOeU3C8m0SGRYkXYvdUqEfR5MoFKQGNUd6nruI+TdpxXnXR0aQDg7yro6uBmAjMcmslJu9S7fqy6mvCUfRY5vvtkSNgBov7eqxC2m8kyOZVDf2Syz9MuP5HqB/HlehqFQucdeu6Lws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718279300; c=relaxed/simple;
	bh=mEnKSiliZqluR7D8mymh7E/FztsajO/rxctxx/3eRxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CPqdxnXeyQCTM/saK1EGURfYkQs48pyrZ2vKLZMdzv+M73HVFK2YnkXDgQ0N+e3NxFSoAnz3AZ2fu8jBu2Jn1V8LizYdcmmVOvCAbeSAiXdtJ1qtIFbQNFqEcdRLDP8zh0FG8dTaQ0PvBOnIVS5M8QndLJ6T7Yw5AnZjHXqPMX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=f/hC9/6I; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=mEnK
	SiliZqluR7D8mymh7E/FztsajO/rxctxx/3eRxw=; b=f/hC9/6IC3+19pGr9FDM
	9cQSiNRimkrJ8UippHw14BaD/vuBRcNZtADW/kfNrdZV88uJcljC6Q2RH1AldBxK
	tsSbf4kFLch/oZ83E2dOOP0WtyupggPyNbSeEZ8jyvMrUgFPzNuq51mH8puNI2RZ
	6eN6B2OSszsr7jzaI7hlpsLe3b2YOgLNmQBUSEve62IYn9MWPwe/KLBOBGF+zKdi
	xFimy16tfpu3i0nrFgvS3+c8EokoMe8/ETIpw17NUzT36CGTYT08nBCdmf9ETkaf
	gq7fbHyPMjzxR5Whta0vFoIliHjPE82k1GDmMI/UN7Z9jlE8daYgfL2NO5tEAZgL
	QA==
Received: (qmail 1159010 invoked from network); 13 Jun 2024 13:48:16 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jun 2024 13:48:16 +0200
X-UD-Smtp-Session: l3s3148p1@hLcQE8QakusgAwDPXzjQABqqX1QYyOSW
Date: Thu, 13 Jun 2024 13:48:15 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Arnd Bergmann <arnd@arndb.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Kent Gibson <warthog618@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v9 1/1] gpio: add sloppy logic analyzer using polling
Message-ID: <odto4ngzk6ee5pqkv5rpm45v54xrizddlacwupvw4e42a3qfgf@lnwuqy3xluzd>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Kent Gibson <warthog618@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
References: <20240610112700.80819-1-wsa+renesas@sang-engineering.com>
 <20240610112700.80819-2-wsa+renesas@sang-engineering.com>
 <CAMRc=MfZ11U+kAh1+K=DxtJ=QL+cY7Q_sBN4sQDF-RNgjpV0QA@mail.gmail.com>
 <jvnvx7a4pn6evrp5ehfrt4qsiuprq6ogvrue2a3uupwtydmgcm@2rvat7ibvgb4>
 <CAMRc=Mc4__0zzJZG3BPnmbua88SLuEbX=Wk=EZnKH5HQvB+JPg@mail.gmail.com>
 <CACRpkda==5S75Bw6F3ZLUmf7kwgi_JkByiizR=m-61nrMDWuvQ@mail.gmail.com>
 <ce1d8150-c595-44d5-b19a-040920481709@app.fastmail.com>
 <CAMRc=McpRjQO8mUrOA4bU_YqO8Tc9-Ujytfy1fcjGUEgH9NW0A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pccqba6xjk4z2fty"
Content-Disposition: inline
In-Reply-To: <CAMRc=McpRjQO8mUrOA4bU_YqO8Tc9-Ujytfy1fcjGUEgH9NW0A@mail.gmail.com>


--pccqba6xjk4z2fty
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > I could also imagine the functionality being exposed
> > through drivers/iio/ in a way that is similar to an
> > adc, but I don't know if that would work in practice or
> > how much of a rewrite that would be.
> >
>=20
> I could see it using configfs instead of DT for configuration and iio
> for presenting the output but - from what Wolfram said - insisting on
> this will simply result in this development being dropped entirely.

Despite that, I'd be afraid that the analyzer looks more trustworthy
than it actually is then. debugfs makes that clearer IMO.


--pccqba6xjk4z2fty
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZq3H8ACgkQFA3kzBSg
KbbVMA/8CIj8IiOugI0npIWh2UHLnGZ7jZ/6z52wfsrsiR5bSRmSdlmUpLPivcqE
3ac2n820JtmhSEiuhIoYLIbwAt+H0sS9Y8laBH+y1g4CL7Wc6QYwPebg5xTwp56Z
plu03Q3xG8c1q3UtJOLwCne0tAqA91C7rUAfUnKd7I4DPHX8zCeU2/XqnDZ/1mmi
zNqIICa+cVAwLYuSmzPXlTGkDN6ooXpXGPNXUbT3+/r2dRvn1/mPF1KES7pl8lpq
G6AdlBk5cm8TGOI1eMx2zzS/1w8YvPs0nSBNN5tJMB7fQF905SlLJC2f7wR3tiD0
2TJ7uVLWwnQSMiZu+5VwLt+9E4aVnVDqbTfSQSmz+EdGKlPM4deglDQK9n5cDsGR
wa+MWHwEMu1X0Z13DuYPicM8ydRvGoSed1HcntTuAGWIrDMT9Ttrj8rrLDWMr3PO
9B49Wa35tzgkLhnUzJdq60AIfPxnMJ6QUFCAMotw54K67GWQ0XsTHnDRDFwXI3rS
Ui43rVROviSMqFQ/m/OEd+33UONiiL2EfD4l3FoKiNqHGlLYBf6MWyihYEmex+Pj
1HmOiRPIc20phXGe/RXdr+dhRPD0Al8bBAIZEn+xDUGM5u1hN64LtvlnQ4CjNwv+
8r4lHSpHmYBqTzytPeNfWENZ7T/79GfAUGjpATdjrAq1eL8hr7A=
=31Jp
-----END PGP SIGNATURE-----

--pccqba6xjk4z2fty--

