Return-Path: <linux-gpio+bounces-18166-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FAFA78435
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 23:56:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C8FF16CACE
	for <lists+linux-gpio@lfdr.de>; Tue,  1 Apr 2025 21:56:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7F711EF376;
	Tue,  1 Apr 2025 21:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DBMYtr5U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858711DF258;
	Tue,  1 Apr 2025 21:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743544559; cv=none; b=utN6W38V40Rl+iHXK/TdYnTxLUJW0E7Thy533tijPEW71hfRJkFkQfPXDfBS+gjaUInqGHi2w+YESBWdC321HLpo3POcsTpKIUStUwwK7hlmbQq2TPAJBj/K05YHrbliCXhAx/e/g3A3AgMXL57JDJbVCyETUxp8V1l/xddEKl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743544559; c=relaxed/simple;
	bh=/awk8q2VzVHMPUKfx/9Iif66Moo4kkMLhitLsXMH/d4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HnNd5eSrgKyp1IDIx6OHqLv7JdTSGqLkcD2k/iA0CFXUmzhZzystZkgyvObj8ryCcOFT80rEUfTuv9QphQ4XufqoOgAdgeuemq9rh4btJf28v5+bH+r+U9+GoN6TfsYXOFcH4FDBJI8WFsD5N5CtksivXwguURX7S3rarW+c5fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DBMYtr5U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB007C4CEE4;
	Tue,  1 Apr 2025 21:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743544559;
	bh=/awk8q2VzVHMPUKfx/9Iif66Moo4kkMLhitLsXMH/d4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DBMYtr5U579nX4MhY2RhPddY/KOzTWxbjRZlNC1nQhGlovGuO55rjlQ5ykBTqLuT5
	 JfmkkwIPBalaGo0hEdOfj2jiZ0q5k57dzmUVoxtEDC8wbOv7cQ87CLNDH5wJ7yHL7X
	 f7Fn8ncayHWS2Hu8/8WCuM1YFyT4u+iSVuxWHYTkqJstK72rTquZ0RxWvC2VRMNtPr
	 RCEQuPWLCaafnVxSoFAq0DFZ7dcJpyI7AYYkMEyDVpzDe8HKfr6oc/+IURT35n9VLX
	 AYLZtq2imwU3vIt7E+ep0HlkraIpAhsUciXcmfyHM5/OjC9VZCM83sWwtmMGI5FsSc
	 tDxpd6ZI9s2CA==
Date: Tue, 1 Apr 2025 22:55:55 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 0/4] gpio: deprecate and track the removal of GPIO
 workarounds for regulators
Message-ID: <c3bb82f9-5a2f-4a14-9726-f3e10bf5d427@sirena.org.uk>
References: <20250401-gpio-todo-remove-nonexclusive-v2-0-7c1380797b0d@linaro.org>
 <c8ca3c8a-3201-4dde-9050-69bc2c9152c4@sirena.org.uk>
 <CAMRc=Mcq9yag6yBswhW0OJ8MKzGBpscwo+UGpfCo2aha93LzXA@mail.gmail.com>
 <846010c0-7dc1-421c-8136-9ae2894c9acd@sirena.org.uk>
 <CAMRc=Mff0TkeiHbM3TAJLJ2HYU_nnPFUpUjbWsdCnW6O4E=+gQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zFQ5n9y7oHfzGRRF"
Content-Disposition: inline
In-Reply-To: <CAMRc=Mff0TkeiHbM3TAJLJ2HYU_nnPFUpUjbWsdCnW6O4E=+gQ@mail.gmail.com>
X-Cookie: 15% gratuity added for parties over 8.


--zFQ5n9y7oHfzGRRF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 01, 2025 at 08:57:56PM +0200, Bartosz Golaszewski wrote:
> On Tue, Apr 1, 2025 at 6:00=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:
> > On Tue, Apr 01, 2025 at 04:42:40PM +0200, Bartosz Golaszewski wrote:

> > > You have two users and one goes gpiod_set_value(desc, 0), the other:
> > > gpiod_set_value(desc, 1). Who is right? Depending on the timing the
> > > resulting value may be either.

> > That's why we need to figure out if there's sharing - the usage here is
> > that we have some number of regulators all of which share the same GPIO
> > and we want to know that this is the case, provide our own reference
> > counting and use that to decide when to both update the GPIO and do the
> > additional stuff like delays that are required.  When the API was number
> > based we could look up the GPIO numbers for each regulator, compare them
> > with other GPIOs we've already got to identify sharing and then request
> > only once.

> That's not a good design though either, is it? For one: it relies on
> an implementation detail for which there's no API contract, namely the

There is an API contract as far as I'm concerned, this was discussed
when Russell was converting things over to use descriptors since we need
something to maintain functionality.  I agree that this is an interface
that is more convenient than elegant but it's what was on offer, I think
the enthusiasm for converting to gpiod was such people were OK with it
since it does actually do the right thing.

> idea that the address of the struct gpiod_descr handed out by the call
> to gpiod_get() is the same for the same hardware offset on the same
> chip. It does work like that at the moment but it's a fragile
> assumption. The way pwrseq is implemented for instance, the
> "descriptor" obtained from the call to pwrseq_get() is instantiated
> per-user, meaning that each user of the same sequence has their own,
> unique descriptor. I don't see why such an approach could not be used
> in GPIOLIB one day. IOW: nobody ever said that there's a single struct
> gpiod_desc per GPIO line.

If gpiolib were to change this API we'd need some other way of getting
the same functionality, I'd be totally fine with that happening.  For
regulators we don't really want the pwrseq behaviour, we want to know
that there's a single underlying GPIO that we're updating.

> > That's exactly what the regulator code was doing, as far as the GPIO API
> > saw there was only ever one user at once.  Since we can't look up
> > numbers any more what we now do is use non-exclusive requests and check
> > to see if we already have the GPIO descriptor, if we do then we group
> > together like we were doing based on the GPIO numbers.  The multiple
> > gets are just there because that's how the gpiod API tells us if we've
> > got two references to the same underlying GPIO, only one thing ever
> > actually configures the GPIO.

> That's not an unusual situation. For reset-gpios we now have the
> implicit wrapper in the form of the reset-gpio.c driver. Unfortunately
> we cannot just make it the fallback for all kinds of shared GPIOs so I
> suggested a bit more generalized approach with pwrseq. In any case:
> having this logic in the regulator core is not only wonky but also
> makes it impossible to unduplicate similar use-cases in audio and
> networking where shared GPIOs have nothing to do with regulators.

Impossible seems pretty strong here?  Part of the thing here is that the
higher level users want to understand that there is GPIO sharing going
on and do something about it, the working out that the thing is shared
isn't really the interesting bit it's rather the part where we do
something about that.  It's not that you can't share some code but it
feels more like a library than an opaque abstraction.

> > The sound use cases are roughly the same one - there's a bunch of audio
> > designs where we've got shared reset lines, they're not actually doing
> > the reference counting since the use cases mean that practically
> > speaking all the users will make the same change at the same time (or at
> > least never have actively conflicting needs) so practically it all ends
> > up working fine.  IIRC the long term plan was to move over to the reset
> > API to clean this up rather than redoing the reference counting, if
> > we're doing this properly we do want to get the thing the regulator API
> > has where we know and can control when an actual transition happens.

> If they actually exist as "reset-gpios" in DT then they could probably
> use the reset-gpio.c driver. I will take a look.

Yes, that was the idea - there was some issue I can't remember that
meant it needed a bit of work on the reset API the last time someone
looked at it.  The properties might have different names reflecting the
pins or something but that seems like a readily solvable problem.

Though now I think again some of them might be closer to the regulator
enables rather than resets so those ones would not fit there and would
more want to librify what regulator is doing...  Something like that
would definitely not feel right being described as a power sequence.

> > > 3. Use pwrseq where drivers really need non-exclusive GPIOs.

> > > The power sequencing subsystem seems like a good candidate to fix the
> > > issue. I imagine a faux_bus pwrseq driver that would plug into the
> > > right places and provide pwrseq handles which the affected drivers
> > > could either call directly via the pwrseq_get(), pwrseq_power_on/off()
> > > interfaces, or we could have this pwrseq provider register as a GPIO
> > > chip through which the gpiod_ calls from these consumers would go and
> > > the sharing mediated by pwrseq.

> > This seems complicated, and I'm not sure that obscuring the concrete
> > thing we're dealing with isn't going to store up surprises for
> > ourselves.

> IMO It would be equally as obscured if you used a shared GPIO wrapped
> in a reset driver.

Yeah, it's a bit indirected but it's at least clear that it's just the
reset and not also any other aspect of the power management so you don't
have to worry about timing requirements around enabling supplies or
whatever.

> > It's also not clear to me that pwrseq doesn't just have the same problem
> > with trying to figure out if two GPIO properties are actually pointing
> > to the same underlying GPIO that everything else does?  It seems like
> > the base issue you've got here is that we can't figure out if we've got
> > two things referencing the same GPIO without fully requesting it.

> Whether that's feasible (I think it is but I'll have a definite answer
> once I spend more time on this) is one question. Another is: do you
> have anything against removing this flag given it's replaced with a
> better solution? If not, then I'd still like to apply this series and
> we can discuss the actual solution once I send out the code. I hope
> this will at least start happening this release cycle.

I'm in no way attached to this specific solution, from my point of view
the important thing is that given two devices using GPIOs we have some
reasonably convenient way of telling if they're using the same underlying=
=20
GPIO and can coordinate between the devices appropriately.

--zFQ5n9y7oHfzGRRF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfsYOoACgkQJNaLcl1U
h9DvVAgAgrtmuzz6y9yhOh6n73oARM50aP0pffMcbGXM7V9C+f0QLL/h8nX7nN5M
t605uPAIsGalR/qPDCOttruX03WDaD4qfBqezw9/VbgCy0itTGTibsGk3DaPp+N+
6o+yK9H/4lT8nS7HGrb0sdM5Wv4QTX4NByazDggTf3F5I4aaDxoroEXw+ipbSvT0
+8jQlH1FGuHUsKBD8twJA9tWlQJZJwQnl6hFS7QozEj6HrL1zOwM+MzKqL6sotoz
p/yVxF2eZ8BvKSPQyN07W0M85WQY/20rE1gExJFBAPU9A/Pq5TiuCGl8kJ4+4CoF
F5EE+Z2Oeo4/3fgXWbpSlGb2PVd7Sw==
=0vo/
-----END PGP SIGNATURE-----

--zFQ5n9y7oHfzGRRF--

