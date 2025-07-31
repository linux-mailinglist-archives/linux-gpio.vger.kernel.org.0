Return-Path: <linux-gpio+bounces-23924-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF280B174CD
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Jul 2025 18:16:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65FD0545F6E
	for <lists+linux-gpio@lfdr.de>; Thu, 31 Jul 2025 16:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EC1E23A563;
	Thu, 31 Jul 2025 16:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P3splCKJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262912222D4;
	Thu, 31 Jul 2025 16:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753978580; cv=none; b=XiZZ5MbAlWg1KdvF2jSRW6gnUHcTZDFotMWvVEVRMX2dRxC1uEbY5/sLweEyak3hfDhQE5xUQEQPRscLHSiiPhVu/PvADNwYEMBs+Mpr7LBCFdbX8TEWf7MqjPIdTI2fCJyMwnkKqnPPo018NtiCTAZxwVo3zFOZUAExP8//REI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753978580; c=relaxed/simple;
	bh=p3cf8J6rM1P3RGVhPv6cLXHP0636yx/YFTRRf6vxbys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dz4G06xWwsFYs5vz19OAN4Lu1dVP4xhUG1PXUzJ3jPQ/eGc8dgGyyhQPywyDzOtbS8s9SxjvfF9EA9DQz8DNY6HaswyUfThPXDDpBQP44lOkPDnJjacVFfP8Km75Wb7HBgcOUhi/DXH0kqbCJQCUqod5/ZFKiIMqd9RsH8vTbaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P3splCKJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FC63C4CEEF;
	Thu, 31 Jul 2025 16:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753978578;
	bh=p3cf8J6rM1P3RGVhPv6cLXHP0636yx/YFTRRf6vxbys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P3splCKJekZSpimcCF4ACgG+B2qwzpMFvRMBvxiN7RcyN5P5uCvuSs/w2QrXgZ8m4
	 TpsHRSsXk5oBCzH2+S7JFAyR42yO7sv8sK+Eg4XyhdNsb5Ru1/et15ztBbIblOFZ1e
	 v/DPnp3jljjlMlrwRaD4H9sZChI5ckLYtdkZBvdGUPdY4whB80usg+U2pDDGqUxXCy
	 OYe0+lNoQNa9uA51E9vnE4TlUsr87Z+l6Xvffdj9XonZ8C86wyo3gBYfR2Lye9MTVc
	 6wJou9hrW8BJLZXg8x3Nq77v+GgRaY9BGR2qdamAkFsTDsajGz4Tl3V9qvHvUrCu9R
	 i+8uXoDw093BA==
Date: Thu, 31 Jul 2025 17:16:13 +0100
From: Mark Brown <broonie@kernel.org>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [BUG] 6.16-rc7: lockdep failure with max77620-gpio/max77686-rtc
Message-ID: <14c68c29-68d8-4119-8f70-616c07397dc4@sirena.org.uk>
References: <aIpdVejR3Jkh9Z_I@shell.armlinux.org.uk>
 <97f0e27f-3128-4821-bc09-2acde1ebf81a@kernel.org>
 <aItfC4AjjH-IdBfy@shell.armlinux.org.uk>
 <68c210a2-49b2-4fd2-97ad-27af85369d9f@sirena.org.uk>
 <aItk4vWPnFk6lYjn@shell.armlinux.org.uk>
 <4f80be02-0bbe-4c10-a3d2-324916ea2ca4@sirena.org.uk>
 <aIuSdnV8sWnUqLOq@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/VQROS4r+R15ZpR1"
Content-Disposition: inline
In-Reply-To: <aIuSdnV8sWnUqLOq@shell.armlinux.org.uk>
X-Cookie: Gloffing is a state of mine.


--/VQROS4r+R15ZpR1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 04:57:42PM +0100, Russell King (Oracle) wrote:
> On Thu, Jul 31, 2025 at 02:18:24PM +0100, Mark Brown wrote:

> > I *think* mutex_lock_nested() is what we're looking for here, with the
> > depth information from the irq_desc but I'm also not super familiar with
> > this stuff.

> I'm not sure about that, because the irq_desc locks don't nest:

>         raw_spin_lock_init(&desc->lock);
>         lockdep_set_class(&desc->lock, &irq_desc_lock_class);

> What saves irq_desc lock nesting in this case is that
> __irq_put_desc_unlock() unlocks desc->lock calling the
> irq_bus_sync_unlock() method. So, I don't think we have anything at
> the irq_desc level which deals with lock-nesting.

Yeah, and that's all internals which we're not super encouraged to peer
at.  There should be something that'll give us a nesting level
somewhere... =20

Lockdep's handling of nesting is generally fun.

--/VQROS4r+R15ZpR1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiLls0ACgkQJNaLcl1U
h9A+SAf7B7jos8DzkR+u2AIRqqoHJKtQ4mIjywbYG/mQPFXjMNGRVYv5ZvZHzKxu
GXuwMMVkvpw/nSf6ZI5CBbGU1CkJ68PBsx0h3cc1jkuKXbLy3dw42Pvg/UGyVLEz
wZT9ZsKldfqiHpLFB4dyini5bbMOJ/ru0QuwojjfC3QO5shccp3eKbVynCNULY2R
3goXYu7yRUK7GJt/BIuftvSVrok0Fb4ugs53WsoLNKTQmYq5bZBZMjzW4At7PQc3
Jpv2DpgTVNK7SCSP/Ing7K74/ibC3PT2/AIfSK1VCAlaDDzYg3dmrlX2lm9H5fJw
UmAnrqTWjYYCYA9Qrf+uhIKFZVmIMA==
=+qIz
-----END PGP SIGNATURE-----

--/VQROS4r+R15ZpR1--

