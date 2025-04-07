Return-Path: <linux-gpio+bounces-18371-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 976B2A7E033
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 15:58:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82DDA17EFB1
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 13:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 248AD1ADC78;
	Mon,  7 Apr 2025 13:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XiXOjgvI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39731A8F6D;
	Mon,  7 Apr 2025 13:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033981; cv=none; b=e7AwPPkk12IKH8KsPMpv1m6/t2n7SuBlPioN2r76HKhNRfTmplP3HmIAX3thV8Is4QD+8GxQn8NhNULYEPb6t5avw1ddDaQnkyPQXjA1REQbjtTRgmcv564GocmvNpQiWS1c7GzNyjTMx9VUG79S7qN5Q2Q7wPJYoB0S0Of3hAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033981; c=relaxed/simple;
	bh=r7kBNPEW0WRcFadtyDS13FnmZe7b22hJY5aSsMgnt7w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W92Hd6jBvZq1H3OwNuGZqRIrhD4qT/Vi2FW0vaWhzWnYm/lOFECo7j4azRxxiJuj1X2jCfgTo3oa/944tGb4LOGuBim0Z1UudOOwe/MXs9sK9WGFh9ggSYklsehEbmwAHBCNgnT2K2Wx00DaJ28EDMxymZcI58VyTNCETiX29AU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XiXOjgvI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 288BBC4CEDD;
	Mon,  7 Apr 2025 13:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744033981;
	bh=r7kBNPEW0WRcFadtyDS13FnmZe7b22hJY5aSsMgnt7w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XiXOjgvIyF/YAsvifGIAgwZSmdMPUBs8MUAv5WO/tTM9zgRdJRpJBzggWfyrE/SL5
	 tCfb08yJ/tEtFrD/THXLhPl+W5894aOVGSDQ4iRTTEaVLeu50TiepYFrg0+TuqDPJ1
	 wTODaQJPKl+6BwavHCB2cm0+s1ZNkVv+voYlkQhx76VkFanddVLnPQToXYip7+XX5T
	 FKE1n/oIFxIYofFZM9Mb5TbFAO5QNWoni1tEUSjT5PYTilyuSFhBPcj5WDQZ5i080f
	 7jvXdKmc17n+jVe4MESYfaRv0txDi8UbvQOiTz68KnUJH8oXvhS0+LeEIQXSHI5lW8
	 FAu79b4Bzwzng==
Date: Mon, 7 Apr 2025 14:52:57 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 0/4] gpio: deprecate and track the removal of GPIO
 workarounds for regulators
Message-ID: <841a919f-2a13-4488-aa1e-a5a07824ed76@sirena.org.uk>
References: <CAMRc=Mcq9yag6yBswhW0OJ8MKzGBpscwo+UGpfCo2aha93LzXA@mail.gmail.com>
 <846010c0-7dc1-421c-8136-9ae2894c9acd@sirena.org.uk>
 <CAMRc=Mff0TkeiHbM3TAJLJ2HYU_nnPFUpUjbWsdCnW6O4E=+gQ@mail.gmail.com>
 <c3bb82f9-5a2f-4a14-9726-f3e10bf5d427@sirena.org.uk>
 <CAMRc=Mc_nXwvj_9w6w8cB3K58AVLHBLCV+MOO1z_6y+uuT86Og@mail.gmail.com>
 <a484f0b2-c09a-4a6a-a30e-4c8660d755a6@sirena.org.uk>
 <CAMRc=MeFqvJ3g3GhrZzto+jfgCUhtcRRyWqx51gCkKhYUqtsGg@mail.gmail.com>
 <c16d3116-256d-470d-96dd-7f3dbe3334c3@sirena.org.uk>
 <CAMRc=MeYcgje7dFq8WDiTB8mTQ1COv3a_6xhAGkTukD_V25Wgw@mail.gmail.com>
 <df350510-64c9-46b4-9f82-ebd6b04bba36@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TF6//jndVbndOY/a"
Content-Disposition: inline
In-Reply-To: <df350510-64c9-46b4-9f82-ebd6b04bba36@sirena.org.uk>
X-Cookie: Meester, do you vant to buy a duck?


--TF6//jndVbndOY/a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 07, 2025 at 02:33:53PM +0100, Mark Brown wrote:
> On Mon, Apr 07, 2025 at 03:29:09PM +0200, Bartosz Golaszewski wrote:
>=20
> > Basically: we may set the GPIO to 1 but it was already enabled and we
> > tell consumers the regulator was just enabled when it wasn't OR we set
> > the GPIO to 0 and tell consumers the regulator was disabled when there
> > are still users of this GPIO so it's not true either.
>=20
> > AFAICT, it's used in a few places to put the regulator consumer in
> > reset if the power was *actually* disabled.
>=20
> Yes, and also do things like not bother to reinitialise the hardware if
> we kept the power on.

BTW, as an example of something that might go wrong if we didn't get
reset when we expected to be one common thing the would be for the
driver to reset it's register cache back to the hardware defaults but if
the power wasn't really lost that won't reflect the actual hardware
state.
back to the hardware defaults=20

--TF6//jndVbndOY/a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfz2LgACgkQJNaLcl1U
h9C9LQf/QIbHAWF8EhP1Wt/gpFzue7lJKceOhlLYJjD+nWLSTIf1Zo150javMGDs
5hBNLfTaO/d3NSMGpuORvgBz1ru2whiyrNwKg4ndu8FrIWEIABVrD4uC31ysLSkG
xfp2n01IzTMjNzdxGi5R1xkfNvjeR2DdAgAMigQAO3mPFDByyWH4SPQGP+v4EVyg
r03ykaChJRYGrsnHFycyJoOXoTLZUp9UMLin09Phrie2B8Q8LnzFP+QOC1GOOyAf
b06g8VSpODI9e4cC4VuTpTWcW3uOHh4iER4tAQfFzHKiZKK1RkZ4Vkf0+wAUn9eR
HivJKdAAYzF8mM1lnGi6X5d/ji6p/A==
=21A3
-----END PGP SIGNATURE-----

--TF6//jndVbndOY/a--

