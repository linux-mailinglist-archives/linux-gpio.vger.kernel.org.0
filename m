Return-Path: <linux-gpio+bounces-16229-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B63DA3C227
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 15:30:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 743703AB271
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Feb 2025 14:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BE341F3B83;
	Wed, 19 Feb 2025 14:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="otuE2GmS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C47AE1F17E8;
	Wed, 19 Feb 2025 14:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739975245; cv=none; b=kCBAp/a6q3PFeuWF3eFjiKmI1mfTxv0DkUkej6Z3apc0abjSzIUz+mMCy4MsI1eFegWpm1RYjpkzf3oxI1x1TUBGImAUn3nSyosk0NykcIEqXt/hIHugDA99OqnRDPF3jbcxletnIbxWr6g7/3XnBaEgq4uJqzcRxy4CjEGIB+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739975245; c=relaxed/simple;
	bh=BQOMI1FyOuS4DlKWkS+K/U5NSss8ae/7nZI8hbei1tc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AkxK8XTPRqBtZaUpXqzcQk0QxzWPpsoomk4M/XCU6jVA9jB5UzQgsdF6HfYYByJ8zC4mXWDnWfovFjfnnL5wkDQpa/USX81bKnvvC7jwiODjNQ1dBINz8XKz8TiWvtX/49CuAQub0OfTy3PP/HfK4514Dz4mcnPgsch+fmLRuSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=otuE2GmS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9266C4CED1;
	Wed, 19 Feb 2025 14:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739975245;
	bh=BQOMI1FyOuS4DlKWkS+K/U5NSss8ae/7nZI8hbei1tc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=otuE2GmSKcq5MR7H6sWYiaCG7LRXKYfvCQpqvJ4gqlYTNKo058XIrJHzuJ9xO2iPI
	 OtCA2XX7c89kXfYFAOchbnaMyve2Giu2CxMmkZ1B05xWpYNDvbA+6ujETq7qmJrGcR
	 VZtGUq9H3KN3ArBhG4EfdriIPx+SHLHf34dssx4Wd28nMHijOcKLvtpX6HOxIhtopG
	 fTr+ISSfUpPk5hDwrqr38J7X1xRjgVgld5khu+jEgZdsyqrOxjFf+Ut+I2Kk/shK+C
	 qvv06HUG6SLBkCEgGJ6vH9x0T0mpPXLTg+BVeICG/g+DyDO1PV6PuepUpt6BqcBRvM
	 p0lJavWqqQ6bA==
Date: Wed, 19 Feb 2025 14:27:21 +0000
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>, Liao Chen <liaochen4@huawei.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [RFC/RFT PATCH] pinctrl: bcm2835: don't -EINVAL on alternate
 funcs from get_direction()
Message-ID: <Z7XqSVfhPGI5J63B@finisterre.sirena.org.uk>
References: <20250219102750.38519-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RyX3R1pbLNLkRqpZ"
Content-Disposition: inline
In-Reply-To: <20250219102750.38519-1-brgl@bgdev.pl>
X-Cookie: Editing is a rewording activity.


--RyX3R1pbLNLkRqpZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 11:27:50AM +0100, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>=20
> Since commit 9d846b1aebbe ("gpiolib: check the return value of
> gpio_chip::get_direction()") we check the return value of the
> get_direction() callback as per its API contract. This driver returns
> -EINVAL if the pin in question is set to one of the alternative
> (non-GPIO) functions. This isn't really an error that should be
> communicated to GPIOLIB so default to returning the "safe" value of
> INPUT in this case. The GPIO subsystem does not have the notion of
> "unknown" direction.

I see this was already tested for these specific boards.  I've also
found that Avenger96 is failing with bisect pointing to the same commit
this is fixing:

    https://lava.sirena.org.uk/scheduler/job/1126314

as is the Libretech Potato:

    https://lava.sirena.org.uk/scheduler/job/1126285

neither of which produce any output before dying, they'll not be fixed
by this change.  Seems like an audit of the drivers might be in order?

--RyX3R1pbLNLkRqpZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAme16kYACgkQJNaLcl1U
h9C7CAf7BdxIloZPelOduxqgYD8I4gVrpuOlA8WSR6iZSEOfanhyMYI1/Ew7Wlai
HtTQO/wDRJceUaqLiBCURcEyp6QAmioChr9noTiwqzeNlZxRBPk0EDKWbHECSe/T
GDKwPAsfsA9hF0zHv8evz+nHpuU65NBM/pQVlzWHtMt9gbcgvU4DZUXU66Nze+xf
lKPtYCJWITisEbCSHxBKawuEkBDR3KZOf1q6/mVfKxIPE9TUGzJ/cbHCWIWw+kD3
qryvmLxCt/2+okVSLADypTowxCEdFYaZ+cWUsMfKloxBKIv+fRkiE+leCA3xrTuE
Zz6mQIP51m80nser/HulYq2kiI2mlg==
=WyAO
-----END PGP SIGNATURE-----

--RyX3R1pbLNLkRqpZ--

