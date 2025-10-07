Return-Path: <linux-gpio+bounces-26875-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D8BBC1770
	for <lists+linux-gpio@lfdr.de>; Tue, 07 Oct 2025 15:18:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C94A034ED77
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Oct 2025 13:18:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F15362E0935;
	Tue,  7 Oct 2025 13:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u/OPe73Y"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E6D2D9497;
	Tue,  7 Oct 2025 13:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759843091; cv=none; b=R3aK3IpWBmb2kM5q4LlQkbaRQ23P/+emKrosTNLjgbFb9UnIRBnlCmCvyvjRehqZQF3tO4Tm+RkWoSKuBpZrQe8nNEC5CZkwmau2QCi6Jm9DH9pcoI1JclZtbU9KlOlYzf/sqVSGwelNtbY1u3sg2WzpPVjj4AuQ07xxRIbPSyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759843091; c=relaxed/simple;
	bh=ROB3wlEWOzXAJwBh1qm1R6lseFVqsndr6PEwvgYDBYU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ghZ/INxScrZdejhQIcpfiEV1N78MUQ2wZ+kbQtfBXjB3WfTKXNXtgDLHzLWkUQ4zRc3VOQt4qAtn98WKj2rbxHJBWsyfkunhzttGER8wreIZWlKyi/favMPd2FIfkPOxLhAuh8wsYx3WOPQiwCPw/9O3rXFRovhytzDyxtH4F0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u/OPe73Y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0654C4CEF1;
	Tue,  7 Oct 2025 13:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759843091;
	bh=ROB3wlEWOzXAJwBh1qm1R6lseFVqsndr6PEwvgYDBYU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u/OPe73Yuq+jYwS/iZhhQZMiPxNGXAkDbDfIouyky571NFqTqJSkk9IhCRB9s/Ntu
	 U+l7EgZNGiFtvrWn9PdJoN40o10zPvgl5MlBmtIsvvbNI/qI6hEpkyGaVli6AfcKlR
	 OAdTydJl+rEyYRa2YMrd6mVstlbhVxkQ/857uFGby+IIoHcsCTBRaD101Mpoo8D51o
	 hIxqCC+EodZ10aCeIPQCElFA74nuyD7+SXLgUCpP8Q52KYSL4qhbDZ2qrILE2JyRwi
	 3n7HaYZweb6M9CgaWiOgxaplPRgJVhG4bWp2qKTWPt6FlfIKD9Ssv56c4h9iypq/dj
	 OnphxE7Wb4o3w==
Date: Tue, 7 Oct 2025 14:18:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Srinivas Kandagatla <srini@kernel.org>, Kees Cook <kees@kernel.org>,
	Mika Westerberg <westeri@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH RFC 0/9] gpio: improve support for shared GPIOs
Message-ID: <a9a4f33f-b6c5-4c25-8321-7b08a2afb8a0@sirena.org.uk>
References: <20250924-gpio-shared-v1-0-775e7efeb1a3@linaro.org>
 <0b402bba-0399-4f93-873e-890a78570ff7@kernel.org>
 <CAMRc=MfwEHGV-HZQURR3JNg1HatAeWO17qbRmkWUXTSBWj5jSg@mail.gmail.com>
 <80347dcf-419b-489e-9b0e-d901fbacc71a@kernel.org>
 <CAMRc=McaZV=tUkzDGMYxXqkuEYw_KasKcv8QGdjw709UYZuGhg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+soYglqC22/n5wEt"
Content-Disposition: inline
In-Reply-To: <CAMRc=McaZV=tUkzDGMYxXqkuEYw_KasKcv8QGdjw709UYZuGhg@mail.gmail.com>
X-Cookie: Teachers have class.


--+soYglqC22/n5wEt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 07, 2025 at 03:13:29PM +0200, Bartosz Golaszewski wrote:
> On Mon, Oct 6, 2025 at 11:55=E2=80=AFPM Srinivas Kandagatla <srini@kernel=
=2Eorg> wrote:

> > Yes, these codec drivers are due to be moved to use reset-gpios.

=2E..

> anything. And what about shared pins other than reset? 'dc-gpios' for
> display, other 'powerdown' instances, 'enable-gpios', all kinds of
> uncommon names like: `dlg,cs`, `wlf,ldo2ena`, `speaker-enable`,
> `maxim,enable`? It's not likely we will create a separate abstraction

Many of which, crucially, don't actually reset the device.

--+soYglqC22/n5wEt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjlEwkACgkQJNaLcl1U
h9CCzQf7Bncfs5WXAs3r5vAGgmMUJo/gZu8vwflStoT02OjudlAyN52XX/Ddf3z5
QXLXvR2X8rQdiG44lFaOVpNKFPMwEaBSOPqnfw6xC6iaC0r00qkfq1wnmCluy8Uc
GH8fRxQaZSl25laa2GBST1WJsH912QI3fWlhqEtgUl5/zY2VnVz/QNdFFS1TwL0+
SE6hw0hdTJL8UJSFQumw7FohV7A80u+3V3Xs3rvOJKnaOFEPLfOQdWw9/TZi0UuE
q1lPaj7gmq1VEgxDdPSIHzzZv3fSQQCtP+1MTi+oQ8LMxElcnPOny0c4stKH0P9T
bNI4srPGEXT8UtZkh8pXTJMNrRKmMA==
=2iBf
-----END PGP SIGNATURE-----

--+soYglqC22/n5wEt--

