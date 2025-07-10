Return-Path: <linux-gpio+bounces-23075-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C34FAFFF88
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 12:47:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A41EC17BF29
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Jul 2025 10:47:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE2C92DE217;
	Thu, 10 Jul 2025 10:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bTiga/Ok"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D3F2D3ED2;
	Thu, 10 Jul 2025 10:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752144417; cv=none; b=fE+nvP075LYTPYGSoXaU46zj3oLoQyzCCaXCnYZz0GzbwYdZGBLQ8la8C1d4mtre2Vg/gHfNz4ipiQt65dKFb8T5R8B0uk3vWuyF3+0CcHLM2T6vCHEAeJqAqBT0jnQDR0AHL/eEsECmoX/5LLQcO4GArhWS4s47WCOgtXscOBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752144417; c=relaxed/simple;
	bh=GpS7b82GwFBy7s6Gt1hdiRaB+YScMGCEmRwAh7y5fc8=;
	h=Content-Type:Date:Message-Id:Cc:From:To:Subject:References:
	 In-Reply-To; b=ogPPkBapFVThhRlJYgnf3cD2Rb7gawFR8WVxlkisevmgoVQHVbdCILg1exSHEK+ZLHorsKpivjnJoug1qqtN+J2SB+0ljjq7JLZyi7WUJvayMvpdGFPXy444oHYDEKLpes4A8aKSvpWhirJ3MZXkdsh/5UX7wF34QWvKh9Dr4PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bTiga/Ok; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E660C4CEE3;
	Thu, 10 Jul 2025 10:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752144417;
	bh=GpS7b82GwFBy7s6Gt1hdiRaB+YScMGCEmRwAh7y5fc8=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=bTiga/Ok9S6zjGcprB4jTuGjWSz2kQxrwJAKhDC9LyDa61DxU+amsJxpRZHRmQFBZ
	 5gxUPE4d39rO+hNiM3embVeVM7efWmdYcEw0x0pA3Cg9Q0xJbDeo1OH7IbStYVc4y/
	 8YvChpRihJ8TzlSl4w/9qicre223sU56R1n0rcmfBX2Sa73jao5Fz/LJQXolE5UbhM
	 PETxeWxqTd8N1c+WmUYtv8dFz2TjggKAAWPXKhKW0DsT1LzGfxB8QTAWnp7VOM814A
	 8YkhW3nvkl0jTdxv6VrGaZcgj7J9RcQNa3ZEwMc9L2ng2QFn0QSkXuuG8hUPKI/9l/
	 BrRAglN/p3BpQ==
Content-Type: multipart/signed;
 boundary=457ac7dd634462d2cae9a082cc349cd648764669cbd75127613ee86b1b98;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Thu, 10 Jul 2025 12:46:52 +0200
Message-Id: <DB8BCV6V36YE.20KJC5V0BJ1CN@kernel.org>
Cc: "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski"
 <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Arnd Bergmann"
 <arnd@arndb.de>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Linus
 Walleij" <linus.walleij@linaro.org>, "Liam Girdwood" <lgirdwood@gmail.com>,
 "Julien Panis" <jpanis@baylibre.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Mark Brown" <broonie@kernel.org>, "Lee Jones" <lee@kernel.org>
Subject: Re: [GIT PULL] Immutable branch between MFD, Misc and Pinctrl due
 for the v6.17 merge window
X-Mailer: aerc 0.16.0
References: <20250613114518.1772109-1-mwalle@kernel.org>
 <20250710094906.GG1431498@google.com>
 <aG-OmSNn-oULfEuB@finisterre.sirena.org.uk>
In-Reply-To: <aG-OmSNn-oULfEuB@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

--457ac7dd634462d2cae9a082cc349cd648764669cbd75127613ee86b1b98
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Thu Jul 10, 2025 at 11:57 AM CEST, Mark Brown wrote:
> On Thu, Jul 10, 2025 at 10:49:06AM +0100, Lee Jones wrote:
> > Enjoy!
> >=20
> > The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd135=
4494:
> >=20
> >   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)
> >=20
> > are available in the Git repository at:
> >=20
> >   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-misc=
-pinctrl-v6.17
> >=20
> > for you to fetch changes up to d90171bc2e5f69c038d1807e6f64fba3d1ad6bee=
:
> >=20
> >   dt-bindings: mfd: ti,tps6594: Add TI TPS652G1 PMIC (2025-07-10 10:40:=
21 +0100)
> >=20
> > ----------------------------------------------------------------
> > Immutable branch between MFD, Misc and Pinctrl due for the v6.17 merge =
window
>
> Is there some reason you didn't also pick up the regulator patches?

The regulator patches don't apply on the MFD tree because there are
two new patches [1, 2] in the regulator tree. Also my patches rely
on them. Thus, the idea was that Lee will provide an immutable tag,
that you can pull together with the remaining regulator patches.

-michael

https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git/commi=
t/drivers/regulator/tps6594-regulator.c?id=3D9bb3c7df546aac38ea64c736a839ef=
2c75297631
https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regulator.git/commi=
t/drivers/regulator/tps6594-regulator.c?id=3Dc266209eaef4fef863363557817f7d=
6a68314321

--457ac7dd634462d2cae9a082cc349cd648764669cbd75127613ee86b1b98
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaG+aHRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/iMgAGA6gTBKL7PxV268G4uPlzwRYuvRNw/pn3g
WbaytL0Pw/U5x+FfbbffFCCRwIjxE/GJAYCL/iHDoXzXVKlPe9V3nN3o9gPf1IKx
kokPEU+ryQ3X5iiYJsQXeBMMM2nQdCzAWcs=
=Ihnt
-----END PGP SIGNATURE-----

--457ac7dd634462d2cae9a082cc349cd648764669cbd75127613ee86b1b98--

