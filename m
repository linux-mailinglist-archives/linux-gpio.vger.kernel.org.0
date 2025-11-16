Return-Path: <linux-gpio+bounces-28538-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 89065C60E7B
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Nov 2025 02:15:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id ECB35363BED
	for <lists+linux-gpio@lfdr.de>; Sun, 16 Nov 2025 01:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7CA41E7C18;
	Sun, 16 Nov 2025 01:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LiLEi1pC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA8719F12D;
	Sun, 16 Nov 2025 01:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763255680; cv=none; b=ZZUOMQqOnWTO+TBG9hF2PpXqXJyqaHV5DhVOtzAsAvsuLwRV+5BasOYbvNoFBcs6Mzc9MRZscp+7BDbAfi6hwtuW6KImfGoLiQgKgPxN6AMLC0TeSTu0j4EJ6tY3YJfD+6LUlfvyAvNDhLuI7M0/l/7PC9cWSbRgp7QrcjBNndM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763255680; c=relaxed/simple;
	bh=aDXOt4TKtc4srkvAfX9nOndQ22QPuPd8El4sdESS5k8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SyMJYlrcoRfxHnb4sWW+KImkezy7weVX7fQ4KB3qLCocmGmctEN42/d28wYAHRVXuyrw8zX9TVXx9zWh1a20TXkp8zFOGXrSTGVUQRitFNx3d9+AxW9WYJYgTcFMJK//gjVjPVtH7mI9A2iXCKDLjOpBbvP2t9b+RreAjv3LsgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LiLEi1pC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 922C8C4CEF8;
	Sun, 16 Nov 2025 01:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763255679;
	bh=aDXOt4TKtc4srkvAfX9nOndQ22QPuPd8El4sdESS5k8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LiLEi1pCWeal6h0Y6fU3+SPcXq/6JxeMUZYbKl/ASNepMYpZ8WIgjEBsNzAxsvz3f
	 WYAv2BMUi01mNq0d5nBbICpBrnHpHbehzNhjBCZnS0DDteB/NIi90MHTOzjC9IY6Bp
	 /OqBnjPSV4aEPcg/P6TeKG5mEfAYfg+6Pya7kalRr/G0fKqmLzjCqYv3pkBMu3+tMp
	 8yoAiOAa4XPwFxvITr2fI+N2u+u4AlrkvFlMptrUYdxZ7vHsWdT+xJ1aUrZBe56DYk
	 zlhOnUIHMaoreZn93PZptm/D85yIaGJx8/OQvGWLJGYiJDuflRh/P4ZqeRDVn40t7O
	 TDETPcKv9pf9A==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id B9BAE1ACCC93; Sun, 16 Nov 2025 01:14:36 +0000 (GMT)
Date: Sun, 16 Nov 2025 01:14:36 +0000
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Lee Jones <lee@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 09/20] mfd: sec: Add support for S2MPG11 PMIC via ACPM
Message-ID: <aRklfJtOJ_Cy7tEE@sirena.co.uk>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
 <20251103-s2mpg1x-regulators-v3-9-b8b96b79e058@linaro.org>
 <20251113162534.GO1949330@google.com>
 <45ce203c03ec34631a0170baa7e4cf26c98b9cd3.camel@linaro.org>
 <db7e95dd-2361-4579-b52c-b9556da4633a@sirena.org.uk>
 <f1e9a9e35f7c16d8db0e39128eb184f3f42b7d02.camel@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gqV0z7GMKls/V8rk"
Content-Disposition: inline
In-Reply-To: <f1e9a9e35f7c16d8db0e39128eb184f3f42b7d02.camel@linaro.org>
X-Cookie: marriage, n.:


--gqV0z7GMKls/V8rk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 09:56:41PM +0000, Andr=E9 Draszik wrote:

> I'm happy to use an alternative approach that can solve my problem, if th=
ere
> is something that I have missed. I think the commit message for patch 8
> describes the problem in better detail than this one.

The more normal thing would be to just register one child device for all
the regulators and then register them in a loop in the probe function of
that device.

--gqV0z7GMKls/V8rk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkZJXsACgkQJNaLcl1U
h9DE4gf+KxlJY+LmEUkHBmFkqDiXxMrQmAXpoD7X9LQ0MtGOmApJ5QKe+v7zbL67
pZUHO53xYO2GlUs127m7CXVZhPuzwTq6iaz+WGaQkithSkF2LzJJo1CHA+0HrbQz
6ER44pkLuRsQgpL8chiU+TcXXzjIXN3q7Z5MysmpZ106nFU9ApuECFM/iQAuY3Kg
/dDXWKvold2bM783t4YWAiif4oGmwDB8OB+v2IId8SOiC63APhpFcyIA9wsBds8X
wfwAHlpbSrRrGGmDfMe4cQuEHs+u4acF+UqI5gG17EpThFBFPivfJeTrNxrAuA7S
onvO7XLswGrR3pljvPDQYOnxjSJQFw==
=uSCM
-----END PGP SIGNATURE-----

--gqV0z7GMKls/V8rk--

