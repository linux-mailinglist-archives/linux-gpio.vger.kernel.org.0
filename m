Return-Path: <linux-gpio+bounces-18177-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E1BA790B7
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Apr 2025 16:08:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CD8697A34F4
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Apr 2025 14:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E02D23BD10;
	Wed,  2 Apr 2025 14:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WCgu/xpX"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093A923A58D;
	Wed,  2 Apr 2025 14:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743602905; cv=none; b=flMFCFJTd0zlmmHP0JzLWDDGxBt5U4K41ZHBxveCPzA/kdee4vC77XavHfuKRVJfPpyQjJlv7fN2Us4wgepNi1W3gnqnqUYiHtS5yFSRH8XVbevB9yeimNLrNWNOfPKdCOG8/kxcNu4vVyQNlJQBp1yl1i5dj+5YCJXq3Tmuew8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743602905; c=relaxed/simple;
	bh=Gvnk752YhvtU7ebhJTFn0xvmqjtEjNYKA3D8tTJhnfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e/U/Fa+Tx7aXVg77WkdnWkVtY5xXHmFGT8T4HN/1xtH5Y+3iQMYD3gDD3oH/P7mFRcNgFBLAvNqN0E6ohmxxKVMvr1KqGmzFG1TsenbaiLnNRC9RWgYXtAZ7+nCUIB19ICuNEhQJ7qZtW51iT73R6XtNQzf/bVYHEvaboyk2PC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WCgu/xpX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48CAEC4CEDD;
	Wed,  2 Apr 2025 14:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743602904;
	bh=Gvnk752YhvtU7ebhJTFn0xvmqjtEjNYKA3D8tTJhnfg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WCgu/xpXMDkkrjiFk1GROdt5AbpPIUs+czN3BPDMYh9cBUILzBrGw89LhcTdQNQyi
	 f5ewRSD3+ced21jheKjIKdH26KRRLR5DPDw/idzv6UE0tbk3MJgSiAGu42ro1DiQqf
	 9r37/ezlk/pSRtlKxkJy6ObP7QG2+J4zjoyry0swKHWUPqpzLQOxdQVImkxCdihZv5
	 ih+PQs+4O/VahlAGYLQ7sw6yj1+TQTzuPZMJ+UZLqeBejQsipw6IH5L1JBTxo2UVcG
	 qlm058Np6gbg5mtQBoX/bAB6YbiOa0MBcpl4UUN6qv9bGRt6SyJCMp30/k5cFX9lWe
	 EtYGFNromB2sw==
Date: Wed, 2 Apr 2025 15:08:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 0/4] gpio: deprecate and track the removal of GPIO
 workarounds for regulators
Message-ID: <a484f0b2-c09a-4a6a-a30e-4c8660d755a6@sirena.org.uk>
References: <20250401-gpio-todo-remove-nonexclusive-v2-0-7c1380797b0d@linaro.org>
 <c8ca3c8a-3201-4dde-9050-69bc2c9152c4@sirena.org.uk>
 <CAMRc=Mcq9yag6yBswhW0OJ8MKzGBpscwo+UGpfCo2aha93LzXA@mail.gmail.com>
 <846010c0-7dc1-421c-8136-9ae2894c9acd@sirena.org.uk>
 <CAMRc=Mff0TkeiHbM3TAJLJ2HYU_nnPFUpUjbWsdCnW6O4E=+gQ@mail.gmail.com>
 <c3bb82f9-5a2f-4a14-9726-f3e10bf5d427@sirena.org.uk>
 <CAMRc=Mc_nXwvj_9w6w8cB3K58AVLHBLCV+MOO1z_6y+uuT86Og@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zu/nnPXYuJBRrHqZ"
Content-Disposition: inline
In-Reply-To: <CAMRc=Mc_nXwvj_9w6w8cB3K58AVLHBLCV+MOO1z_6y+uuT86Og@mail.gmail.com>
X-Cookie: To stay youthful, stay useful.


--zu/nnPXYuJBRrHqZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 02, 2025 at 12:05:24PM +0200, Bartosz Golaszewski wrote:
> On Tue, Apr 1, 2025 at 11:55=E2=80=AFPM Mark Brown <broonie@kernel.org> w=
rote:

> > If gpiolib were to change this API we'd need some other way of getting
> > the same functionality, I'd be totally fine with that happening.  For
> > regulators we don't really want the pwrseq behaviour, we want to know
> > that there's a single underlying GPIO that we're updating.

> This is bothering me. This is the abstraction reversal I'm talking
> about. Should the regulator drivers even be concerned about whether
> they share resources or not? It's not like consumers of regulators are

For regulators there's similar issues with needing to know when things
happen (eg, to know if the device actually got reset and needs to be
reintialised) but it's much more likely that we'll both be sharing and
not actually have any control at all even for unshared regulators so we
provide notifiers for this case instead.

> concerned about sharing them with other devices. I'm not saying GPIOs
> should become reference counted - as I said in a previous email, I
> don't believe this makes sense - but GPIOLIB is a lower-level
> abstraction to regulators thus the latter shouldn't really reach into
> the GPIO core and inspect its structures in order to figure out
> whether the lines are shared. This is where an intermediate
> abstraction layer may be helpful. The regulator drivers then just go:

> handle =3D pwrseq_get(dev, "enable-gpios");
> pwrseq_power_on(handle);

> Even if we do it in multiple places, as long as the enable count is
> balanced, we're good. The consumers are not concerned by what's
> happening behind the scenes just as if it was a reset handle.

No, it's important when (or if) the enable was physically released so we
need to know when the actual hardware operation happened - there's some
delay before the hardware has finished implementing the enable.

> > Impossible seems pretty strong here?  Part of the thing here is that the
> > higher level users want to understand that there is GPIO sharing going
> > on and do something about it, the working out that the thing is shared
> > isn't really the interesting bit it's rather the part where we do
> > something about that.  It's not that you can't share some code but it
> > feels more like a library than an opaque abstraction.

> The part where "the higher level users want to understand that there
> is GPIO sharing going on" does not sound correct. Let's take the
> example of drivers/net/phy/mscc/mscc_ptp.c which uses the
> non-exclusive flag for gpiod_get() because on one of the MIPS
> platforms, there are four instances of this PHY that share a GPIO. IMO
> it's a hack, this driver shouldn't care about it. It reverses the idea
> of the DT providing hardware information to drivers and instead the
> driver knows that the DT may describe a shared GPIO.

Knowing if and when a reset line is actually asserted seems like an
important an useful thing for a driver to know, for example if a chip is
actually reset then we may need to do expensive reinitialisation which
could be skipped if that didn't happen. =20

> > Though now I think again some of them might be closer to the regulator
> > enables rather than resets so those ones would not fit there and would
> > more want to librify what regulator is doing...  Something like that
> > would definitely not feel right being described as a power sequence.

> Well, pwrseq is just a naming convention for want of a better one. It
> really is just a subsystem that mediates usage of shared resources and
> doesn't bind to any specific kernel subsystem.

So what's the sequencing bit about then?  Having something that just
shares resources might be useful here, but the sequencing bit seems like
it's asking for landmines.

> > I'm in no way attached to this specific solution, from my point of view
> > the important thing is that given two devices using GPIOs we have some
> > reasonably convenient way of telling if they're using the same underlyi=
ng
> > GPIO and can coordinate between the devices appropriately.

> I think that logically, consumers of GPIOs shouldn't care about
> whether they're shared. IOW: the non-exclusive flag passed to
> gpiod_get() should go. If the opposition to using pwrseq here is
> strong, then I'd suggest at least moving the handling of the
> non-exclusive flag into gpiolib quirks (in gpiolib-of.c or elsewhere)
> and not exposing it to consumers who have no business knowing it.

I don't think the nonexclusive flag is essential so long as we can
provide some way for users to discover what's going on and coordinate
with each other.  I do think it's important for users to know about at
least the impacts of sharing, and I suspect that for GPIOs usability
means knowing about the sharing.

> I believe pwrseq could actually be used to hide the enable counting
> for GPIOs behind a faux GPIO chip and the consumer would never see a
> pwrseq handle - they would instead use GPIO consumer interfaces and
> we'd have to agree on what logic would we put behind gpiod_set_value()
> (should it effectively work as gpiod_enable() meaning: value is 1 as
> long as at least one user sets it to 1?) and
> gpiod_direction_input()/output() (same thing: highest priority is
> gpiod_direction_output(HIGH) and as long as at least one user sets it
> as such, we keep it).

Like I say that doesn't do the right thing since other users need to be
able to see when something changes on the GPIO.  If that just happens on
normal gpiolib then that complicates usage for the default case since
they now have to worry about things not actually happening when
requested which doesn't seem ideal.

--zu/nnPXYuJBRrHqZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmftRNMACgkQJNaLcl1U
h9AybAf7ByZAYiVhzevBnsOl6hxJTH5i8v3qClBzngHAZ/rK8Wtqvwh0+p1D83vm
N0TWkqnEUglWb9qoFg6PTReuM0xrwueCW/cNSszavMlAlyWdC62ZJUHVHu6j1TKg
XtVuFD6Big0Tu41LabKr1WUn0aThgaCbhcIP07PJ7H5DTx6vobmG9qWQ/3XI9nPF
xOL8EUvepBtXCSXUjIm19DjyaYQ/R0uoJhes/SVk1gkg7PFpxKecAiTriGd0jT1N
zXj+oXkiHhp5yP3sITPG0CbHUmzMokokhqBN7ppTVHSlmRjfKBZeWDoTdGoUYz4M
QOoAPNSy5/OG8JeGkR2MZQ/X8mfVxA==
=BgMM
-----END PGP SIGNATURE-----

--zu/nnPXYuJBRrHqZ--

