Return-Path: <linux-gpio+bounces-27386-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAFFBF6F90
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 16:09:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6665E354FD0
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Oct 2025 14:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C7833CEA0;
	Tue, 21 Oct 2025 14:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h9EoWC/m"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE55E33B946;
	Tue, 21 Oct 2025 14:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761055731; cv=none; b=MZox9sSUU4FlMj86ujsCpCbhWSmydHwMMzlQooNagndfB1HccebzoBSZdlDyvPLBXnuDGA2J+JrXE+8HDYtXVFGTzfsETBsomHqnocQbKiex9h4aHvStGa7zxdK8V1nv6xh4XeZX20Xl7X/pjjpHvisQo2gt4ZQ0IeHpNPTZmQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761055731; c=relaxed/simple;
	bh=6wiuS401xDdRYtvpYyrKEXyzFHQauHIZFmJ3uP/Anok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FHIZo5HfGM2jbfIFJIbeAwHnUMKqH1WUpSyTWwaC+z00BeXdV+cOWj/aviGAzG/9TQ1EMmlGD0CVaF5a+jOTXTTGSo+JKQUqTfgA1wI/yA+6OCPkOeWW/TpEKndweTPbXDSVkA2ztT2BzqDuFup6JdKImRdaiUB2BUD0CKRI2kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h9EoWC/m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5FE2C4CEF1;
	Tue, 21 Oct 2025 14:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761055730;
	bh=6wiuS401xDdRYtvpYyrKEXyzFHQauHIZFmJ3uP/Anok=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h9EoWC/mq7Q8GB3952OE3all4Y/oQD5FJazcpywTYBebX9RoedVedxpDNHS4PVCJB
	 clvxh71HKix+go+cCL2UzMsHzRMMZ8ruBpQT5N9lcglWN/kJN7EEWIY1SawDc/vy3o
	 VEaepM0CQ2LtsiW8Ij1TwZBblsp9XkcJQJ2+x5rfrSWun323p0OHBWApqr0f0X4D65
	 nRVaaS9OnWqUfefZN1x3dgzkoRCJkh33bjuP8nnXxDN1utdIlbi21X8qf6xPys6ote
	 HgFMOa390SZZ1ZUrb4qxdlFJIwD91zhb2ENSsirE6jUOlefx5ZFECqK9n6xSPOSLdy
	 +Xmkzd4fZE6oA==
Date: Tue, 21 Oct 2025 15:08:43 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Takashi Iwai <tiwai@suse.com>, Rob Herring <robh@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Will Deacon <will@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
Message-ID: <0e1f3a1b-46ab-4eb5-ad05-70784f9b9103@sirena.org.uk>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <CAMRc=Me4Fh5pDOF8Z2XY4MG_DYqPRN+UJh_BzKvmULL96wciYw@mail.gmail.com>
 <81bda56c-f18b-4bd9-abf9-9da7c2251f42@sirena.org.uk>
 <CAMRc=MdOCHJEyPxN+-g71ux68=Mt_Q5P9611QO7Q8J9e8UJv_A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="be2R75B6whIQ+eJQ"
Content-Disposition: inline
In-Reply-To: <CAMRc=MdOCHJEyPxN+-g71ux68=Mt_Q5P9611QO7Q8J9e8UJv_A@mail.gmail.com>
X-Cookie: Accordion, n.:


--be2R75B6whIQ+eJQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 20, 2025 at 11:41:52AM +0200, Bartosz Golaszewski wrote:
> On Fri, Oct 17, 2025 at 7:32=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:

> > It really should be the actual physical state change that triggers the
> > event.

> I guess so, but this would require some non-trivial rework of the
> regulator core. We'd need some list of deferred notifications stored
> in memory for when the physical state actually changes.

I'm not sure I see the need for deferred notifications?  We'd need to go
round all the users whenever a physical change to the GPIO happens but
it's not clear what we'd need to store beyond the list of users?

--be2R75B6whIQ+eJQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmj3k+oACgkQJNaLcl1U
h9BE1wf/fE5s96hdrurlAFqdd32+YZYJUqEYFJu5LZKnjuA1wTr1MHfqMigev/B6
b/Jr686Hrm/k7WS6R4q0VG8c660FzZ1zdSt/M3AoQXiQ24DcYxb8MbAexAKFbc6g
2UYm/hbZOIK49A5XX4XBSm+zUG7c6gII9SKcovXcNVb9N3mRnsiFmnOkyTkBnFJr
97coLg4GMr7Hh1YQLC1dAXjdfkyttrF0R5/JiVabTqQfyD27tYYedFbfSjChRVA8
Gw7oS3+X70V6zrG/w/9Pxq2R7ikYQSZoIt9BWSh7mGFcMVudZ/QlT1P1u9q0PpLP
avLCRl+U9JHws84L5zHfZKX0vHlk7w==
=8Lgz
-----END PGP SIGNATURE-----

--be2R75B6whIQ+eJQ--

