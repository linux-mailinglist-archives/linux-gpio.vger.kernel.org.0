Return-Path: <linux-gpio+bounces-10588-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6899798ACA7
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 21:17:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 03405B24124
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Sep 2024 19:16:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82F59183CC5;
	Mon, 30 Sep 2024 19:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hvRcvSW6"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D8715E97
	for <linux-gpio@vger.kernel.org>; Mon, 30 Sep 2024 19:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727723813; cv=none; b=VyuMIIdgzjT6jKo4GPEYreoWv2clQKJx4A+srvoARzBcvPplmVwBhiVQ84cgCojam7SmGnL637iikcotaTcKh1NjDkBy6KBB7NezoU2OQZhDZ1jsZJFZcXYMmILTAmpaTA9Z3JYkaEnJx7CcOVgLCSAa683QjbAJMa6OPv38+8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727723813; c=relaxed/simple;
	bh=KMcM3V/PcoShM4FkRTA/0jvA05JIjw7AaBxg1IXrUuM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kouoF6uBMLtT4XfRVaZyCCgeiyLXKUtA24nOqpFu5Q0+OUq3/2bkL0O+tFj6E7zdLctNruaXIX4nZy8dxfJS2h1j194HC+InGu1gaq+/yOawy/YwzWMryhUYA2zwncSBkTsG0tiO9WvP3w24/HfT6jvM1cwdAbmTwLqnDplZqaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hvRcvSW6; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=VObd
	PJ8Cz0gyn/wczXa1gI9Zs1F4EEVWX8796bzYSwc=; b=hvRcvSW6G1eD2cAzaDNO
	m742OhrFNT/yzn+uzp8a3FqGKrPnz3K0vaOYndB6PeewCcY1NETpnzA782FmP/fV
	6H5dK7s6taxoTJ2oRclVEQi46aEVqTJkzf9VrK6AqTBL+1HjLpqTGTWTV5Nty9uB
	7s+taXhfNENZXyn68ujXkc4AlkrG7ba0rc4gp5b1sfcaegTL1smW1CttnhEyTQ6O
	oCTUehtGmp8azsC+VFvKEuUXREfIKDnT1B3DA4NQ15yXuo6Sf7Bb93Q+d+OpV90+
	gpt3zWCuSEetjuEBYapJb04zoPM9aDzLRsvtCaAlg9unbgEec+0XjwZ0XeCinvR+
	Ew==
Received: (qmail 2280902 invoked from network); 30 Sep 2024 21:16:47 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Sep 2024 21:16:47 +0200
X-UD-Smtp-Session: l3s3148p1@l8HMC1sjiM4gAQnoAH/eAHsKVyf407fR
Date: Mon, 30 Sep 2024 21:16:47 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Chris Brandt <chris.brandt@renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: renesas: rza2: Mark GPIOs as used
Message-ID: <Zvr5H1YR8PEdDTL6@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linus.walleij@linaro.org>,
	Chris Brandt <chris.brandt@renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
References: <2862093f7701dcaf29f37c0b2f9268234168338f.1727711124.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cn96hC/NHhywxwRb"
Content-Disposition: inline
In-Reply-To: <2862093f7701dcaf29f37c0b2f9268234168338f.1727711124.git.geert+renesas@glider.be>


--cn96hC/NHhywxwRb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 30, 2024 at 05:47:19PM +0200, Geert Uytterhoeven wrote:
> GPIOs showed up as unclaimed in debugfs, so they could be muxed to
> something else even though they were in use.  Mark GPIOs as claimed when
> in use to avoid that.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Maybe also?
Reported-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--cn96hC/NHhywxwRb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmb6+RsACgkQFA3kzBSg
KbbdcQ/8DXoSoAvVZShdSinDcGOEhb3qHausK79xrsikiEbr9tyImXFaLQ4Z0DEu
WiYwk6mb+ICEkW71blc059GdBZZ/5pg5pxCm/BgKvDFYiLFuQ3PIxT7iYUzksLkn
kpv2e9K3KaXTbsxcdUHQuOXXyLErfFvaVZEewp+JSVee2p4TsPosWPrwh/mI/31n
abz7Vlx0mzApUqpM1MWIoWogzA8/i4bsZjlKi5ZjfWs0OBJcJB+hIu0KaMNTn5d0
o354CSbCHNuGv+s01sldEqiXRNi2StZxWobQhk6Gy4kk/SPW4sFRRq1f9mRBhOwB
9chu65ad7v/9mwA7ya61YCQ5g3UEdRLtlqpXiUt41dLILWILRIHxcR0N/33gb7v7
ZN33wND/x//7iO7kPEUMf7E0oiLtHHkj70rPvtLt2fYR7xQoWZbyZ6K7JWLoS4sJ
YQt4B6vDqVF1ucJZU5EnTlLoqvS1fXiwBHZUVVLIgenUHz3Un3rDyQUAIuinAgCu
4GG3IRj1weavQl1U3AgEpOs40TTM2BuPPvRE3qUdsktFpqPhsBWY36Oe9imBZ1A9
uNhAP8OA3cWeQOiEl5j7ZsbnhrwQBZGjTKmdArgO19Uwj2o1xi72tEjq1PZ4y1l1
4TOsiH2nbX6I7LO3Nj9ngiaRZfEvQ8eshaNc3z+7CQ83o6QP6ms=
=aZgq
-----END PGP SIGNATURE-----

--cn96hC/NHhywxwRb--

