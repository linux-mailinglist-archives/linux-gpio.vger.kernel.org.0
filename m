Return-Path: <linux-gpio+bounces-18366-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9941A7DF18
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 15:27:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C82516D88A
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 13:24:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAA1C253B68;
	Mon,  7 Apr 2025 13:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GSWUA/oA"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72156248886;
	Mon,  7 Apr 2025 13:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744032283; cv=none; b=QIS4Hiqm0hgOEhZYhl2Ll7BPZp3Cxi5vyL664uzBRAUC8f01Ic2u1oW3hq5iVyqVSQAWKeRKi2ZqA6YtyysQeMmkyfvLjaPIYUNk0Ue/F067WRAcLbiIgTUhWnmQTAT+1cLTdmrVTBdeE9myBJYslbgygQLND0fXKoCrKKc65Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744032283; c=relaxed/simple;
	bh=+9gPZPSDv2wNcAMbjjivmev/ujdwUF4GBTXDi52r2VI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Auc1D8nW4AF1Kq6GwN5/rWpx6skfb6NCe0IoxnbLcw4Zq12qYH/jjE491cWuViYU3nxizzvGGKWCXCjQuLpHtTFTXQmQmmHXChwXEjRQnCSYSAZ+JqPDU4h8otwRlJroM/oK8IICqPZoLr9ArE7tFS/jcdo8yJVU94jj4LVQDPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GSWUA/oA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF927C4CEDD;
	Mon,  7 Apr 2025 13:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744032281;
	bh=+9gPZPSDv2wNcAMbjjivmev/ujdwUF4GBTXDi52r2VI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GSWUA/oA+LzLk8M6mOf0OxZyK6hM2RXXTf1rLcYdl8VdLnxN9EACrXBcrouSoI79O
	 rWR+NCQK2ZBBi0FtBv+O73+iVK/bKt+ljCEEJQS3NqKnPCZwBijjTeQdSu2TbFWTYR
	 zCvcW2AkVy+OhjmFVt6md3YUsTdhuyEa1mJ+8DywWim3KfCzmWjJmuGgC5QgqStuqk
	 Hm9IS9M2Y8/uZ8ewkAtPMX9t63SRVHocdrVVz12k2IBeuZGaYWiAy4TeWyrKfvLUfB
	 v/AB+0lWR6JRDzgEvLA03dkDG1K9oRGMyhi1whws9B20JbH3UM277k3R3VS5p3fPH1
	 qx70rlmYHJPvA==
Date: Mon, 7 Apr 2025 14:24:38 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 0/4] gpio: deprecate and track the removal of GPIO
 workarounds for regulators
Message-ID: <c16d3116-256d-470d-96dd-7f3dbe3334c3@sirena.org.uk>
References: <20250401-gpio-todo-remove-nonexclusive-v2-0-7c1380797b0d@linaro.org>
 <c8ca3c8a-3201-4dde-9050-69bc2c9152c4@sirena.org.uk>
 <CAMRc=Mcq9yag6yBswhW0OJ8MKzGBpscwo+UGpfCo2aha93LzXA@mail.gmail.com>
 <846010c0-7dc1-421c-8136-9ae2894c9acd@sirena.org.uk>
 <CAMRc=Mff0TkeiHbM3TAJLJ2HYU_nnPFUpUjbWsdCnW6O4E=+gQ@mail.gmail.com>
 <c3bb82f9-5a2f-4a14-9726-f3e10bf5d427@sirena.org.uk>
 <CAMRc=Mc_nXwvj_9w6w8cB3K58AVLHBLCV+MOO1z_6y+uuT86Og@mail.gmail.com>
 <a484f0b2-c09a-4a6a-a30e-4c8660d755a6@sirena.org.uk>
 <CAMRc=MeFqvJ3g3GhrZzto+jfgCUhtcRRyWqx51gCkKhYUqtsGg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8eKsoMU1YD45uGgH"
Content-Disposition: inline
In-Reply-To: <CAMRc=MeFqvJ3g3GhrZzto+jfgCUhtcRRyWqx51gCkKhYUqtsGg@mail.gmail.com>
X-Cookie: Meester, do you vant to buy a duck?


--8eKsoMU1YD45uGgH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 07, 2025 at 03:15:13PM +0200, Bartosz Golaszewski wrote:
> On Wed, Apr 2, 2025 at 4:08=E2=80=AFPM Mark Brown <broonie@kernel.org> wr=
ote:

> > > I believe pwrseq could actually be used to hide the enable counting
> > > for GPIOs behind a faux GPIO chip and the consumer would never see a
> > > pwrseq handle - they would instead use GPIO consumer interfaces and
> > > we'd have to agree on what logic would we put behind gpiod_set_value()
> > > (should it effectively work as gpiod_enable() meaning: value is 1 as
> > > long as at least one user sets it to 1?) and
> > > gpiod_direction_input()/output() (same thing: highest priority is
> > > gpiod_direction_output(HIGH) and as long as at least one user sets it
> > > as such, we keep it).

> > Like I say that doesn't do the right thing since other users need to be
> > able to see when something changes on the GPIO.  If that just happens on
> > normal gpiolib then that complicates usage for the default case since
> > they now have to worry about things not actually happening when
> > requested which doesn't seem ideal.

> If I understand correctly, regulator_ena_gpio_ctrl()[1] changes the
> GPIO value (even if it's shared) and then notifies regulator consumers
> about a DISABLE event. Now if we'd be implicitly sharing the GPIO with
> an enable-counter, we could possibly emit an event that's a
> false-positive?

Yes (or vice versa for enable).  If the device thinks power got pulled
when it didn't it might get confused about what the hardware is doing.

--8eKsoMU1YD45uGgH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfz0hUACgkQJNaLcl1U
h9Cewwf5Ab55AZQCzieD6PAuihjLD8YNWTElHlJkT42x9vbqJ3IYevAHnRrjdyc/
U9Q0uAz1wtG8rZAuGxWXhprjDOi7oikFyTo7zQrvFnplwoYAFZYRdNoacmwCwzFu
XkFJ3aravtqsECl+bap0J++PFCb73gUlL7fUxIH5XoHsrytHpnhn/43I6SliVJJv
zFA3/ex0Jm29yW5NeYuTnAmpOTjQ7JlQBBrs/mC+aNN4MB7/vAXn2cABMkUku5y6
vjYgVc9TUxffkcHOil205YsX+uF/cIBXEZU5pbbgr4oaTKr2RWSe8t+8MNDUPr1A
9k1/BPLc9q6ehqpLJjGNfS1LO97njQ==
=7Xha
-----END PGP SIGNATURE-----

--8eKsoMU1YD45uGgH--

