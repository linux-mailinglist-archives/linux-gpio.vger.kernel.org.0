Return-Path: <linux-gpio+bounces-28520-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A7F8C5E591
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 17:53:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 826F33B5911
	for <lists+linux-gpio@lfdr.de>; Fri, 14 Nov 2025 16:47:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 983922BDC2F;
	Fri, 14 Nov 2025 16:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K30ipYDu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1F929A30A;
	Fri, 14 Nov 2025 16:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763138821; cv=none; b=jycAZ5Ztcjwj7iExcHkhoAfHmCmrDmfG/4xA21/GRVTyeeYKziwNDo5rsqUTNJp6zXkIv51YE392e18LCGVNuDX4PrehAPWQ5gK5/h1XJdP36UUlCiHFwiECgoUL6QBV1EypVShRLgXV85DeGPFGO3kau5z6L2DXespyLq8eQvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763138821; c=relaxed/simple;
	bh=4EpMRFeYHj1in4XKS+Dlo+4mLzX8SiIfcEMg1hebD0A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rYoxFhl2f91KOSJJM6msPQmF6JNWTAWaAyPKjW0R7fwNnbas0Ac/6asf8Y0URNZrvuZDALP3DPhYBdxBgMfO/1CJCfzsK3InR5+s5+NN6DvWAELnSBsUuFibIBNW1VPfk1NzlFa4FVTODSQfH3PYklyyUpzxH7dTFkMN08gzru0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K30ipYDu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52E88C4CEFB;
	Fri, 14 Nov 2025 16:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763138820;
	bh=4EpMRFeYHj1in4XKS+Dlo+4mLzX8SiIfcEMg1hebD0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K30ipYDuR/RUrNmkVc7gm/zBnjjveNhFDABC4izAmhLcDJUFonKiI0G5vLlL6u/LO
	 TeJ0wYSOE73rEdYcMoA6nR3i496qxne3PZihBlID9tEPoXOaTyt4ie3uyyIq9BgLBw
	 PZJSb75fArEiccCcnjRALq60MFwd8TEqtK++9S5GnJ9RD62wbNFzJCGXVewGTrOZZ6
	 mFU4euj93FqTdJfqoyGkaIjeSl5gcbO46LE2c6jjvEi4BnfXDk3zaMeKxwPTQr7zEQ
	 gERyKvSX5UerE+mDcfN45nfSgQ+bg4rUomyFKu5AHF775QwAbx8ZkDuCYTamt4cTbJ
	 ea3KEVbFnM+jw==
Date: Fri, 14 Nov 2025 16:46:54 +0000
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
Message-ID: <db7e95dd-2361-4579-b52c-b9556da4633a@sirena.org.uk>
References: <20251103-s2mpg1x-regulators-v3-0-b8b96b79e058@linaro.org>
 <20251103-s2mpg1x-regulators-v3-9-b8b96b79e058@linaro.org>
 <20251113162534.GO1949330@google.com>
 <45ce203c03ec34631a0170baa7e4cf26c98b9cd3.camel@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qn5lIfBNzUCscegG"
Content-Disposition: inline
In-Reply-To: <45ce203c03ec34631a0170baa7e4cf26c98b9cd3.camel@linaro.org>
X-Cookie: Causes moderate eye irritation.


--Qn5lIfBNzUCscegG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 09:43:29PM +0000, Andr=E9 Draszik wrote:
> On Thu, 2025-11-13 at 16:25 +0000, Lee Jones wrote:

> > > +static const struct mfd_cell s2mpg11_devs[] =3D {
> > > +	MFD_CELL_NAME("s2mpg11-meter"),
> > > +	MFD_CELL_BASIC("s2mpg11-regulator", NULL, NULL, 0, S2MPG11_BUCKBOOS=
T),

> > This is highly irregular - in that, we've never done this before.

> > We're going to need to have Mark look at this.

> I did see this in at least one other driver, ah yes at least
> drivers/mfd/88pm860x-core.c is doing something similar, maybe others, too
> (I stopped there).

Other drivers doing something doesn't mean that they're following good
practice.  We do also have drivers which have multiple identical IP
blocks and are passing in resources with base address, interrupt and
whatever for the IP blocks which is different to just passing a Linux
internal ID number through.

--Qn5lIfBNzUCscegG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkXXP0ACgkQJNaLcl1U
h9AEDQf/fuZp1M50wSKQchrgoKDudU423oxJuyVfXaRPVzOrj/euxCZ6NgE4HQbM
88EwVcbDcWsGa/wH6JjZBKW5qr6T+16zJZYTNf1RlE1pTa2OY0hDI2wRxdlfhIJ7
QmM4+GxY2iW/cTfL27Vc/ViELbaD9XDlNkHUQTTnB9EE52zHIHj87ZJsRolF8Uls
HkAomvBJm6QxzNsqc3qqnwOxeybUwvOh+v/lKkChUYwCkX0YE3ubgJXdapAcqeEA
3dNCryPywswLotFv8Az/W35UNEFyLAsoMrkpdgc7Ef0qIXNiLZfRXdrragi0m4xz
jDcoIxDQkU5bP6Ql0JiUhFxi4XhBJg==
=QkOk
-----END PGP SIGNATURE-----

--Qn5lIfBNzUCscegG--

