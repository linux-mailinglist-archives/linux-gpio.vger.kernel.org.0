Return-Path: <linux-gpio+bounces-6316-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 555A08C314D
	for <lists+linux-gpio@lfdr.de>; Sat, 11 May 2024 14:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F453281FBF
	for <lists+linux-gpio@lfdr.de>; Sat, 11 May 2024 12:41:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6934D42044;
	Sat, 11 May 2024 12:41:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NHQBofdD"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 269793F9FB
	for <linux-gpio@vger.kernel.org>; Sat, 11 May 2024 12:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715431293; cv=none; b=HKsJ9q/A8Sos1Nz2mfgPbagUvd+XFP8tsnWiIWEq6GOkxIwUP0M9lotj2SDKJLihlJzrzV2QULtETwmpjZqkAmFxrxWO//ssU6cJgNSA4yMHz43OeEC62xw5eY0BB4/G6cLDImgYsj9fH97HRHEXTfOeIIvN1WrUEvhpZdoTjCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715431293; c=relaxed/simple;
	bh=avN3Xg3Mbfc96QLRWHhwQNaqyLEHRO9S1hxukvt0CNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qpv9MqvrSeyhB1E60I9/P1UlUrAILcZtfmdllwCiF2yEobhkaJGJVlsJbnjiDhhJw28u89NzXSJ3lbFjfQNAwqh9YZkFgYJb0WwqKH+gNfhb4fshSOXg+4kzYo/U4u5be/mCHPput1AKMT2Rb+28G93xSwFwJB874xF95oPYfRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NHQBofdD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50CF3C2BBFC;
	Sat, 11 May 2024 12:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715431292;
	bh=avN3Xg3Mbfc96QLRWHhwQNaqyLEHRO9S1hxukvt0CNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NHQBofdDefqWJ/XLFYoTiG8KOrkVcCoXGSapOuAxhyEvIFGPO0e5AxGs1awLh7GSX
	 0g8ep98qyZfIUyj6eDSd9acaXsVS0fKryMhVaX6kLaHSutfM41JZnl2t0XtqWmh/Md
	 pFbMpoH992PxYOliMxxGQoH4G8ttoF/g3+ZL9o/4fs1i0M1JE6ranpoA+DJgx74g3m
	 61cSIltsizhSjjHqjvm308C3y4f07YTM6PKuK3zREsBus+9vaHzsFY0Phg0GErepio
	 R8VbG7lQUPFLMML5BtLSGAE0jgogbNlIFw57K/NCM+gI5AdyD4CXSZuKoLgPGmPj7o
	 bmYp+nubkvBLQ==
Date: Sat, 11 May 2024 21:41:28 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: GPIO drivers under drivers/char/
Message-ID: <Zj9neMiKZH9vlsKp@ishi>
References: <Zj5agJGxhpyO4zp-@smile.fi.intel.com>
 <Zj5lce8vzGhJWVeA@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="F5qTcyqTReKKx6d5"
Content-Disposition: inline
In-Reply-To: <Zj5lce8vzGhJWVeA@smile.fi.intel.com>


--F5qTcyqTReKKx6d5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 10, 2024 at 09:20:33PM +0300, Andy Shevchenko wrote:
> (Update William's email; btw, William, it seems MAINTAINERS need an updat=
e, or .mailcap)
>=20
> On Fri, May 10, 2024 at 08:33:53PM +0300, Andy Shevchenko wrote:
> > Hi!
> >=20
> > Due to patch bomb from Jens, I noticed that we have two interesting dri=
vers
> > (and a common library) under drivers/char/. Shouldn't we move them to
> > drivers/gpio/ to keep an eye on that (with the respective update of MAI=
NTAINERS
> > if needed)? Also William might say something about this since those are=
 old ISA
> > (?) related ones and (perhaps?) might utilise PC-104 code.
>=20
> --=20
> With Best Regards,
> Andy Shevchenko

Thank you for the forward; I'm updating MAINTAINERS to match my
kernel.org address from now on so that we don't have this problem again
in the future. :-)

Regarding the gpio char drivers, I take it you are referring to the
nsc_gpio used by scx200_gpio and pc8736x_gpio. I agree, these should be
moved to the GPIO subsystem so they're with the old GPIO drivers (and
ported to the standard GPIO interface we have there if they're not
already).

Taking a quick look, neither of these are PC-104 devices, but rather
appear to be part of the Super I/O chip. Regardless, the driver
interface can be the same since they're both performing ioport
operations over an ISA bus essentially. You can utilize
include/linux/isa.h and leverage the module_isa_driver() like what we do
in the gpio-mm driver.

William Breathitt Gray

--F5qTcyqTReKKx6d5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZj9neAAKCRC1SFbKvhIj
K4iZAQCBp4kX9sMAYppdnYkv3nZ+4PZgbgAm+zb67e4Nk4YjRwEA6GKWBV32IK/k
9yI1hmtbsST+4ibug2yowDgz+h8lRQU=
=FoYW
-----END PGP SIGNATURE-----

--F5qTcyqTReKKx6d5--

