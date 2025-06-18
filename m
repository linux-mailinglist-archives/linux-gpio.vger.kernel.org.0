Return-Path: <linux-gpio+bounces-21803-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE00CADF30E
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 18:54:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B4D71BC2BFB
	for <lists+linux-gpio@lfdr.de>; Wed, 18 Jun 2025 16:53:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9B1D2FEE10;
	Wed, 18 Jun 2025 16:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kt0pW+ZI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 955022FEE01;
	Wed, 18 Jun 2025 16:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750265613; cv=none; b=T8zPvtJB00kZ+TX2UBctJ14N0IIlnIeI2E1nu6LBcWs6Oa1CbHNMNbhnNNeVuWKkSQWElHEz7njZrWYbKtHtEt3kZ+79hWAd4EILtc2CJa30Kp57qnKSE2lmDD+hBy6DPebygTHybwz2ao11WWA4FtWPYeohTSG/y3m22wm+WFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750265613; c=relaxed/simple;
	bh=7JHZ1JIYEO3EYdgf5LTaJMuvW/itgVgyH9exl2xZ5/o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V9LXVhN05Kvy9uLtupYaWFniXtwVs1AXLHyl6sTok0KNM4CFPDePVg9vDiK8+2ESKX5qibLXrok+DBSalGyxF4m3KWDFdDnEXAKLrDTqfMnSCw/0HBIFzFaFfanREB3O8CCYNa7xnQr7ty1s34NWXq1O95S86UofSTweTAKhgYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kt0pW+ZI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91339C4CEE7;
	Wed, 18 Jun 2025 16:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750265613;
	bh=7JHZ1JIYEO3EYdgf5LTaJMuvW/itgVgyH9exl2xZ5/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kt0pW+ZIraWY4kEMPTrowAUeaLRYIHw+wU3miwExFs8QJypayKj6KItziYfLvAZCK
	 9e/miOrm6AXanTp0urZP4zz3UdAQ4bGPVWxZEj4bf8rGoyW5uTEtvxYc9G5+Evs7Ke
	 /NvuzM5QGxdKosf/Zk/vf90IuIQ8hEaVreo/Nr4q6hWVXzk52DE3uKJZ/hYSIubc2u
	 WHWe7nXfnVvrGsOwc7iF7MEVfYnmhdAjQmBFIM0qiFL8Tm8ldrQHt6SjpKhjEeZr6S
	 iGTEjNkn/xCWkKWH1AApJPcS43KZx/Iv1YngoHG6MeMwRUweuTfFP0Hy0jpXlg5jX4
	 Mpmloj0ADFbtw==
Date: Wed, 18 Jun 2025 17:53:27 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Klara Modin <klarasmodin@gmail.com>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Linus Walleij <linus.walleij@linaro.org>, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 2/2] gpio: mmio: don't use legacy GPIO chip setters
Message-ID: <b522222d-f16d-4093-8a63-fc8195ae4c4c@sirena.org.uk>
References: <20250618-gpio-mmio-fix-setter-v1-0-2578ffb77019@linaro.org>
 <20250618-gpio-mmio-fix-setter-v1-2-2578ffb77019@linaro.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IS6dHsJOPgUCFXvr"
Content-Disposition: inline
In-Reply-To: <20250618-gpio-mmio-fix-setter-v1-2-2578ffb77019@linaro.org>
X-Cookie: Is it clean in other dimensions?


--IS6dHsJOPgUCFXvr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 03:02:07PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> We've converted this driver to using the new GPIO line value setters but
> missed the instances where the legacy callback is accessed directly using
> the function pointer. This will lead to a NULL-pointer dereference as
> this pointer is no longer populated. The issue needs fixing locally as
> well as in the already converted previously users of gpio-mmio.

Tested-by: Mark Brown <broonie@kernel.org>

This fixes boot breakage in -next on at least the i.MX6 platforms I
have, I'm also seeing similar issues on a bunch of i.MX8 systems which
look to be due to the same issue but didn't verify them yet.  I'll let
you know if it looks like something else.

--IS6dHsJOPgUCFXvr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhS7wYACgkQJNaLcl1U
h9CkHgf9F8X5HfrdZ8GChs5katxlr+IuyIyHqXJyzBuGdWPO0kPD55IqBkEyfiL7
2KCYhj39ITpMfYx/NwxdO1GJwYijguVODtZGCYSLtzuUmUxian6otd+9+k9Mf3M2
S0HB8OWIQDlrSwr+FwGq097E82gEIqgt0VUgZuVSS3rtE4yy3dOw87S3xnKxzP2y
UFxe4DY0YInzgfFKLCykCHHoaEKlEtSTqeJVZE0fgt4DCUu/j8NTjltdTOLA40ab
4W9cghu4Kmxjc+766PeFMujQgPV1Ys2hH3HM8p3jhmParbnnnNKQ9QeMmL8nVmty
zcS9ws8g45ZC06c8SLDIdVQ5qGeGxA==
=Y9BN
-----END PGP SIGNATURE-----

--IS6dHsJOPgUCFXvr--

