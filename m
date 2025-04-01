Return-Path: <linux-gpio+bounces-18157-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D10DAA77FC5
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 18:03:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9D60B3AD3D1
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 16:00:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10A0B207E17;
	Tue,  1 Apr 2025 16:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BxRDrn/Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD82F59B71;
	Tue,  1 Apr 2025 16:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743523227; cv=none; b=GsUuwUMrcFNNHs+6xX9+TiFnY0kaveJzFXBWjPNmvXcu+6kWmSkVL0nqbwreoiMcp+a+jRN2uCsBcUFicAGSr47KAtrB+YV9ZgDYEOyZ4yZbhwkf8p2akr9AZg+0IK0ygjazwGAKj4StqE4Z7ybrNGhLo5rzY1U4pfiX1I1ehyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743523227; c=relaxed/simple;
	bh=lzXvjhNF+5uNT5xjvOP/ET44+QdV0rVIa5hvDb0wIVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LlWNAco109P85cGWI11eH37nB2gDr42rGoFLTT2U3c8S6Zirf9zWBa9zNS2jD/aWv+jlLeOttdcF+6DFuE8TS60bg+fdMaVAP2Oj3lg504MhwNkwBm2N6XhhdNNC6MckrnlQNvyJ2dE0ZnoCLiEbPX6EMpf+d8KL9boEK5WOVFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BxRDrn/Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE326C4CEE4;
	Tue,  1 Apr 2025 16:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743523227;
	bh=lzXvjhNF+5uNT5xjvOP/ET44+QdV0rVIa5hvDb0wIVE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BxRDrn/Q8Kaph31oYCfXPN6BlF3YCUn+rWWyuIaTRlMwZdKF77jkEId/5eBqdzxAU
	 11Qf+jtAyzT1ETEMcrDmeQPFzu+/FgZEFRJdKzjLza3d4TdLnhHvUCRczaZ94nxKaG
	 gjM4nJkOz9Bd+BvQvWsTgHlY9+oLcwTbVk7SdcONzU6qlHVmoYfea4/snA+M9pRrBn
	 XxcLPuvAo5EkVDnxEjzeSm927iPWO1rnyfwP6zkI+nC7C1ZOteMV64goLaKRcmdvth
	 9Bnt/byJtc72AOdVvCTG3ukJyEiNOaDaWasRWNKZjXU0Vv8pWKJaaWtWUD5n8QUBjs
	 3RXF9kqoVXXwQ==
Date: Tue, 1 Apr 2025 17:00:23 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 0/4] gpio: deprecate and track the removal of GPIO
 workarounds for regulators
Message-ID: <846010c0-7dc1-421c-8136-9ae2894c9acd@sirena.org.uk>
References: <20250401-gpio-todo-remove-nonexclusive-v2-0-7c1380797b0d@linaro.org>
 <c8ca3c8a-3201-4dde-9050-69bc2c9152c4@sirena.org.uk>
 <CAMRc=Mcq9yag6yBswhW0OJ8MKzGBpscwo+UGpfCo2aha93LzXA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A+b6PC0Mfhf4pWwa"
Content-Disposition: inline
In-Reply-To: <CAMRc=Mcq9yag6yBswhW0OJ8MKzGBpscwo+UGpfCo2aha93LzXA@mail.gmail.com>
X-Cookie: 15% gratuity added for parties over 8.


--A+b6PC0Mfhf4pWwa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 01, 2025 at 04:42:40PM +0200, Bartosz Golaszewski wrote:
> On Tue, Apr 1, 2025 at 3:27=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
> > On Tue, Apr 01, 2025 at 02:46:41PM +0200, Bartosz Golaszewski wrote:

> > > Let's deprecate both symbols officially, add them to the MAINTAINERS
> > > keywords so that it pops up on our radars when used again, add a task=
 to
> > > track it and I plan to use the power sequencing subsystem to handle t=
he
> > > cases where non-exclusive access to GPIOs is required.

> > What exactly is the plan here?  The regulator (and reset) usage seems
> > like a reasonable one TBH - the real problem is having an API from the
> > GPIO subsystem to discover sharing, at the minute you can't resolve a
> > binding enough to find out if there's sharing without actually
> > requesting the GPIO.

> Hard disagree on the reasonable usage. Let's consider the following:

> You have two users and one goes gpiod_set_value(desc, 0), the other:
> gpiod_set_value(desc, 1). Who is right? Depending on the timing the
> resulting value may be either.

That's why we need to figure out if there's sharing - the usage here is
that we have some number of regulators all of which share the same GPIO
and we want to know that this is the case, provide our own reference
counting and use that to decide when to both update the GPIO and do the
additional stuff like delays that are required.  When the API was number
based we could look up the GPIO numbers for each regulator, compare them
with other GPIOs we've already got to identify sharing and then request
only once.

> For it to make sense, you'd have to add new interfaces:
> gpiod_enable(desc) and gpiod_disable(), that would keep track of the
> enable count. However you can't remove the hundreds of existing users
> of gpiod_set_value() so the problem doesn't go away. But even if you
> did introduce these new routines, what about
> gpiod_direction_input/output()? My point is: the GPIO consumer API is
> designed with exclusive usage in mind and it makes no sense to try to
> ram shared GPIOs into the GPIO core.

That's exactly what the regulator code was doing, as far as the GPIO API
saw there was only ever one user at once.  Since we can't look up
numbers any more what we now do is use non-exclusive requests and check
to see if we already have the GPIO descriptor, if we do then we group
together like we were doing based on the GPIO numbers.  The multiple
gets are just there because that's how the gpiod API tells us if we've
got two references to the same underlying GPIO, only one thing ever
actually configures the GPIO.

> 1. Audit all users of GPIOD_FLAGS_BIT_NONEXCLUSIVE

> Outside of drivers/regulator/ it seems that there are several users
> who don't really needs this (especially under sound/) and where using
> this flag is just a result of a copy-paste.

The sound use cases are roughly the same one - there's a bunch of audio
designs where we've got shared reset lines, they're not actually doing
the reference counting since the use cases mean that practically
speaking all the users will make the same change at the same time (or at
least never have actively conflicting needs) so practically it all ends
up working fine.  IIRC the long term plan was to move over to the reset
API to clean this up rather than redoing the reference counting, if
we're doing this properly we do want to get the thing the regulator API
has where we know and can control when an actual transition happens.

> 3. Use pwrseq where drivers really need non-exclusive GPIOs.

> The power sequencing subsystem seems like a good candidate to fix the
> issue. I imagine a faux_bus pwrseq driver that would plug into the
> right places and provide pwrseq handles which the affected drivers
> could either call directly via the pwrseq_get(), pwrseq_power_on/off()
> interfaces, or we could have this pwrseq provider register as a GPIO
> chip through which the gpiod_ calls from these consumers would go and
> the sharing mediated by pwrseq.

This seems complicated, and I'm not sure that obscuring the concrete
thing we're dealing with isn't going to store up surprises for
ourselves.

It's also not clear to me that pwrseq doesn't just have the same problem
with trying to figure out if two GPIO properties are actually pointing
to the same underlying GPIO that everything else does?  It seems like
the base issue you've got here is that we can't figure out if we've got
two things referencing the same GPIO without fully requesting it.

--A+b6PC0Mfhf4pWwa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfsDZYACgkQJNaLcl1U
h9Bqjgf/RTmzdMDrGAN+FvUOHg34iBCjtDkd4r7H06CU6PebbIW6rBmNdnK9nAKV
Msl7D6435UhRJlDdAWgGQ1ldGMeubfVwNqZ44EECz6013F2vHCkID+JWUFSYI0G1
W/6S9zAuZZ80Eft8YyWayH3/dEItAKKu1dxbGoMGX8xX+0Xny2K8WnCKIkB4D7dB
j4orisgnkMV2k2BnwQimO5j3xmFe54WtHy6H1EXuPpoxvY/SbC47m8UM8nbWnsUE
0VCy9JJ+eNe/fJSETzpu73Y4KJHqEwZACDfRa+MMYdIEED5ruyzM731r7u/ex6I/
iYmcrZ/BIFiMH+q1uOWs1tGHgs3hnw==
=trmI
-----END PGP SIGNATURE-----

--A+b6PC0Mfhf4pWwa--

