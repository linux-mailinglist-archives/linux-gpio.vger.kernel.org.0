Return-Path: <linux-gpio+bounces-6358-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B40B8C4E37
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 10:55:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D810F284EB2
	for <lists+linux-gpio@lfdr.de>; Tue, 14 May 2024 08:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BDDB22612;
	Tue, 14 May 2024 08:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y5LJNyFm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E4314267;
	Tue, 14 May 2024 08:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715676932; cv=none; b=Wc/Gf/zvlBtEKdcWRHKD45pmR55ggPFNG7rv7XeVTFADogyXFzDdYpIMHaOS486xNN9/5IO7WP2X0k7GgjEtwDt55pKWuzY/h3RpzqDiYkrBw/QCVyieRs7shHMqt5/8BPgGZg8eCYpJhA6Tv0GN6XYiSywW7ENWO1MfV8EtB50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715676932; c=relaxed/simple;
	bh=y1IZls1LWu+iNxoVkU74EoQMsMBFPX6UyBKivRz0/u0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SY2wjctHAR5gTLxMxIVG9QrZoZU/U0V3W6/FLdo7SwTXrKUwpC5WohGiaV+mR+5uy61rGblSVJGqtHoUN9LckwuA5Xg3A4H2WbIos1eBOWfV7qOw9BPOegN/Ocq8KjzJt96IECO+9l+RjhZAmXD0a/JZqEVr0eNzvwJOKGazMGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y5LJNyFm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B0DCC2BD10;
	Tue, 14 May 2024 08:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715676931;
	bh=y1IZls1LWu+iNxoVkU74EoQMsMBFPX6UyBKivRz0/u0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y5LJNyFm/w+Ya1A8GiQW8wl2LWCus9irHNsreHSdoVJFBZeZioJPdZobvSR/HsI0M
	 CPCw32/ENvYD8Xg857bvl4Pykq4LCwQW8VBTs/7JCNjnNxDvf41rdlqtoIEG+9Ho7R
	 ILmGaH+wPfh0oiWyTQme1gVlW7/+AFZHYwAvYoYA/Cbx3NXX1PjvMDYrmJHOC65dwC
	 bxoAIf9/G9XWp8I+1vXMYDk1SdsJVZOJznGQT7pkw1r+mSm+rLZpveuBWzWxAqJm40
	 d+rbr7zgRl18vCpQJkqd3Y/Lxk0bHBNygwdorDrsgRwyAFAD0m5siOosH0/yfVtfYP
	 BnfshcKCVJTxQ==
Date: Tue, 14 May 2024 09:55:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Patrick Rudolph <patrick.rudolph@9elements.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	naresh.solanki@9elements.com, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: cy8c95x0: Cache muxed registers
Message-ID: <85577035-06b0-4059-8092-1b751c2a6b53@sirena.org.uk>
References: <20231219125350.4031370-1-patrick.rudolph@9elements.com>
 <ZkL2Sdf0NcqaZRZ4@surfacebook.localdomain>
 <CACRpkdbUye6RhbRNGn6sapARwVUyi5hKS-5VEVBr6ZR6W_KdQw@mail.gmail.com>
 <CALNFmy33wMHBcoU9ei0vVsn0gUM7-0jdkDDq_Loa3=mMWXiWcw@mail.gmail.com>
 <CACRpkdZhY_Yz2jHGXWO5_t8Qdey8me0Gytds7V64GYOFoEC2Dg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="irJCPoShLSLsA2zF"
Content-Disposition: inline
In-Reply-To: <CACRpkdZhY_Yz2jHGXWO5_t8Qdey8me0Gytds7V64GYOFoEC2Dg@mail.gmail.com>
X-Cookie: In the war of wits, he's unarmed.


--irJCPoShLSLsA2zF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 14, 2024 at 10:51:17AM +0200, Linus Walleij wrote:

> enable caching in the regmap with e.g. .cache_type = REGCACHE_FLAT

Unless you have a specific reason use REGCACHE_MAPLE.

--irJCPoShLSLsA2zF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZDJv4ACgkQJNaLcl1U
h9DJ8Af+OXFu/JbEzYan9rjI/f/vjZWwi9UvDk01MSm+WaEh+ir47AJjYERLPxXZ
5WOdaEdH3rQan32g4IcyyC1hTAokwXt+UFUrZ7rpzlJZ/vremxSuV6hgZBZGUV3K
7U1hExSE9XRQ3p+0sngNJuklSvK9JncwcxiVIbgCF15O7IdtNJs8SxzFo/r7iOPK
iKmelxgu0JmB9U9/E5yTsFcWKOxvvnigCLzhVlohDH3v+OVWGUMsUThU7Ls/ep0O
rpDv455Uz26R3OZg/YzvXUmrfNJWZ50VZpHSBF/baLw3vrtrQrp7xGFVMfmhMpfd
b/7F5gCU56dMVJCs7VG8sfGRFFTYnA==
=ywEN
-----END PGP SIGNATURE-----

--irJCPoShLSLsA2zF--

