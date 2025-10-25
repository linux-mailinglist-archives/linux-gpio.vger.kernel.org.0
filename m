Return-Path: <linux-gpio+bounces-27600-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E08C08E17
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Oct 2025 10:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFCAF1B26F52
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Oct 2025 08:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C4C5287269;
	Sat, 25 Oct 2025 08:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YLdufXkQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE8D1F4613
	for <linux-gpio@vger.kernel.org>; Sat, 25 Oct 2025 08:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761382380; cv=none; b=XZZQ5NxKP+VhYYx3+bDe/jAC44cy9WWesfoUDuXkY68Cbzcn3vkXYtXsf4suumcZJT4nsj7RJCUJgqhaF1Pb+bp9aSDszp9ar54cwiaJ5v1aHIot+H8/kgobyEUEL4kTR5MZpQ4aCN5xi2IktirIEUpS7zNUdq21tDUyKGrmqzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761382380; c=relaxed/simple;
	bh=e4fs1rDTffaFAjlAd6v7CD0Zj4+8IDvYuQK568nHPls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tjSEPNaL76X1vjLshyYWQ8bYHszVuQQAaoRPKskZVc6gwiIdFtSX0vuihKC7pocHOc0sKB1OVhJuApp6+39huh9LmdZ9m6d2ceNIFxuiKESIgBTvo65xKJt7eWuyuVYWPxdvgASXOxJpC2PFB4WZI0Ch3HUznGHaOfWQDSrYy+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YLdufXkQ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=e4fs
	1rDTffaFAjlAd6v7CD0Zj4+8IDvYuQK568nHPls=; b=YLdufXkQU2IgAYFLJLGQ
	FWUqwWAjEdrz2ClUdDwltATa2NRbkNJh8bb3Jfr0Vh3AR5qj0uvvChwW7xzkVjQW
	dhRHBBbvWkLwEOKis4L2yYT0aM14w7OdOshuoFj0PcNuaAgJRYA+sNs4xnKB/gcc
	alHEISuR4ylVg5i7yaxxqTh+M+5ouHy6qK3VqqgOzde/JP6zOTlTgShVaLGpvTPf
	2Rh+rBqMsUw9Q3JYr2UHVNfHQzCDIKRxDzd6OHOjZQJIXK6OM3RUNKaGJEQu3/0m
	VaWj+0a12C7Fabwfcte2CV9O5WCwixznebX79WkQK97Uu9oa5fwmtUej7BBWCZjv
	nQ==
Received: (qmail 2890520 invoked from network); 25 Oct 2025 10:52:49 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Oct 2025 10:52:49 +0200
X-UD-Smtp-Session: l3s3148p1@65lnyvdBTNgujnvB
Date: Sat, 25 Oct 2025 10:52:48 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: "Herve Codina (Schneider Electric)" <herve.codina@bootlin.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Saravana Kannan <saravanak@google.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Phil Edworthy <phil.edworthy@renesas.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Pascal Eberhard <pascal.eberhard@se.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 0/8] gpio: renesas: Add support for GPIO and related
 interrupts in RZ/N1 SoC
Message-ID: <aPyP4DAy3I4jneXn@ninjato>
References: <20251020080648.13452-1-herve.codina@bootlin.com>
 <aPidGU_4NattHKKG@shikoro>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DMja/h8Whtp0xoJN"
Content-Disposition: inline
In-Reply-To: <aPidGU_4NattHKKG@shikoro>


--DMja/h8Whtp0xoJN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > This series adds support for GPIO and GPIO IRQ mux available in the
> > RZ/N1 SoCs.
>=20
> I definitely want to review and test this series. But I can do this on
> Friday earliest, more likely next Monday.

Since your discussion with Geert lead to changes, I will wait for v6 and
review and test that. I had a glimpse on v5 and have nothing to add now.


--DMja/h8Whtp0xoJN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmj8j9wACgkQFA3kzBSg
KbZcLhAApJ1top6+zlQSawpKgqEOAYxjz2OFNIQeKwv+0nGFSn3EWVxPpRCRVkSr
G02VCYlZlvdmaV2vXdxDHBGaylwZ+zD8q1aDH0cP7QG2BdeGR+j1fn0CuCCgkgwj
CQQD5uCyPynEs3ZjQpE6rshSaKmmZF6cw623eHcO8jttyUU8hHC4jAQa9wEewrMX
LEvDmchThtOCDur1TtK1VhDzBh94XQefn0R1dhcgbcUgCftPhCqMX1eIToVkX99X
BGS/3lrSz3KmjQLPN72nkiy36ZwhHRBuGog847ZILtfxcAexkgXLartbUFcN0UZt
D1QNU6Y4Vf0wmtOTKmCEJNw3tdT5gliOpldG8l4FwBxuQCm8GGvMfKDByPhjV/oX
o88na1el15K/kT7e9ETbMoEKboGyD7NebGo0PUKdvsWmMhzQ4GIiGPq3fTzoMPvi
mLRgEP8aUd4He+NF7Ljtnh6Q4Na0qrVAqgKmA/zHLGbN4toFjKKC3muwqgy9oFqq
0abX2ovdS/sYsroXWt1aU4KbyYZ9JeOHe27I/guwJgc27cDY7s8ltAOGnZUHNwCX
DQ+8YjgvZJn+1HhnwXmn5h6SKOErPRCQLnBLtsaX8YkcLLyvNgZRkSUovyKlRAZ2
iT9XAnoqHIVIaZ7Cus47+R19Y/4obBMxMllMUvSGO/ChhtpPdII=
=1ilY
-----END PGP SIGNATURE-----

--DMja/h8Whtp0xoJN--

