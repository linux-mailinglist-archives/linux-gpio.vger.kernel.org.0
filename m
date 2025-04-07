Return-Path: <linux-gpio+bounces-18368-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AC7A7DF86
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 15:38:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 814A43AC132
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 13:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C1A13E41A;
	Mon,  7 Apr 2025 13:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XOD2OUUE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F5D70821;
	Mon,  7 Apr 2025 13:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744032834; cv=none; b=ZbsG+hF4e9qHQNkRq8JF2n/WqGlO9jzOcagaflHCIsWweavXV7Shy80OjYR2b4PC3UIGHY09wQZoHQtr1I0aS8hM1TMaTnSIq4Q0j0sQy30CUqR07VQ4erdUROaFvuOLiplFP+vijiXJcQmeBCPtmyQ2bAoauT9iUnPUlrm4yJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744032834; c=relaxed/simple;
	bh=ssre7dWOLUmh0P2Cs+wzRbF6w6XvOb41xRSZRe5iru4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KGkQtMso8a1ubIxURhXxW1zJ6nOErYHZoqAK4PgQs/Lnc0tbIXs2yX+Z5bax0/5zkseoi1U/+LMQlHGE8lReoMDZ5pqfaMvZZp/nMSBxxADrs2uSVLL2pSfrRq+Mpkx7sXXs3t7ltmCIVM7qkZICB6JEHv8ZwjJ9cQZSZ8Oz/6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XOD2OUUE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E0D8C4CEDD;
	Mon,  7 Apr 2025 13:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744032833;
	bh=ssre7dWOLUmh0P2Cs+wzRbF6w6XvOb41xRSZRe5iru4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XOD2OUUE14ZD12QKEVuKWuwPlqp/0AY5e6g8sKCeqWexPoLyt8YvEj/iTQbjx4BkC
	 MawxETjkipSyXYV5bVlYihf2p9GfLjlLpLXK5Hd/eqJDm/lQUKYJuIMF8fpeGAfZVy
	 fcndhWqNm0gDI8/D8h/BaqlYCdCXCC6B0+Lp0x4IBJBhvgTrANos8WTcbYLYUTbFDn
	 lltgYGXBMCvwVb21VDprak18EGyTxVnMAFJ7c7uNeuj1HGR8VXltSv34Z7un9JhruV
	 hJuxCM2Sg0Nh7lY9qNtyHhF6hG0HPZN/k2tcLCXJE5heEco7qncQcBykzgNjUHSxC+
	 pfvNxbsaNF72g==
Date: Mon, 7 Apr 2025 14:33:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 0/4] gpio: deprecate and track the removal of GPIO
 workarounds for regulators
Message-ID: <df350510-64c9-46b4-9f82-ebd6b04bba36@sirena.org.uk>
References: <c8ca3c8a-3201-4dde-9050-69bc2c9152c4@sirena.org.uk>
 <CAMRc=Mcq9yag6yBswhW0OJ8MKzGBpscwo+UGpfCo2aha93LzXA@mail.gmail.com>
 <846010c0-7dc1-421c-8136-9ae2894c9acd@sirena.org.uk>
 <CAMRc=Mff0TkeiHbM3TAJLJ2HYU_nnPFUpUjbWsdCnW6O4E=+gQ@mail.gmail.com>
 <c3bb82f9-5a2f-4a14-9726-f3e10bf5d427@sirena.org.uk>
 <CAMRc=Mc_nXwvj_9w6w8cB3K58AVLHBLCV+MOO1z_6y+uuT86Og@mail.gmail.com>
 <a484f0b2-c09a-4a6a-a30e-4c8660d755a6@sirena.org.uk>
 <CAMRc=MeFqvJ3g3GhrZzto+jfgCUhtcRRyWqx51gCkKhYUqtsGg@mail.gmail.com>
 <c16d3116-256d-470d-96dd-7f3dbe3334c3@sirena.org.uk>
 <CAMRc=MeYcgje7dFq8WDiTB8mTQ1COv3a_6xhAGkTukD_V25Wgw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ojbQ9hm3JBD68YmZ"
Content-Disposition: inline
In-Reply-To: <CAMRc=MeYcgje7dFq8WDiTB8mTQ1COv3a_6xhAGkTukD_V25Wgw@mail.gmail.com>
X-Cookie: Meester, do you vant to buy a duck?


--ojbQ9hm3JBD68YmZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Apr 07, 2025 at 03:29:09PM +0200, Bartosz Golaszewski wrote:

> Basically: we may set the GPIO to 1 but it was already enabled and we
> tell consumers the regulator was just enabled when it wasn't OR we set
> the GPIO to 0 and tell consumers the regulator was disabled when there
> are still users of this GPIO so it's not true either.

> AFAICT, it's used in a few places to put the regulator consumer in
> reset if the power was *actually* disabled.

Yes, and also do things like not bother to reinitialise the hardware if
we kept the power on.

> I'll think about how that could be improved.

Thanks.

--ojbQ9hm3JBD68YmZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmfz1D0ACgkQJNaLcl1U
h9C+hAf/a+/V8JHF8pKou/Z+4lrcWYnx+fX2dcyamBw3RYIvfUVccE16nx8gOy7K
ODu79W+H3Lv3CAh/cvE3FqRjeI20iogPs3gPOsLEnlr0Ebrb+wj3ZlPHiuCwo53g
TGGV9dk9ot+7aFjKOlwgTnR3nP2o+8qbR4tnxKCtVFjyUWCh9WTjdaHrzlIA17by
/QmNE7bKA/AjE2OpZihbagALdOeSu7YUrhPHaeAp53lWnt4Y7tiqq6PTNhu1dB6+
1KYpcALfpoWIhmPZUkqceNdEf0ETSCPq5uJowqnb2nq/y1RPVH53xeE/ss+SJdk9
D/f76w+JXJ280iVtjp8uiBkA41lp1Q==
=oaLP
-----END PGP SIGNATURE-----

--ojbQ9hm3JBD68YmZ--

