Return-Path: <linux-gpio+bounces-22611-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 316C6AF1545
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 14:18:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4205A3B8C3E
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Jul 2025 12:16:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F5082701C3;
	Wed,  2 Jul 2025 12:16:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14AE4264F8A;
	Wed,  2 Jul 2025 12:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751458571; cv=none; b=ix7R5+R12xzgxb9i4+5mGKPkdt07z6Vtte9HoK58JtK83dG6Qy6w2FVpLBx3jRfOxvEWDfxEZsNQ9rdR4Tr73RA1c+EYtS5qMWQcwjKD/PtrdLZKfV7Am2BHxaXhap7gDoq3ua18LrhjEJdfItEP6Kq4gnPvrWsZtRafROfc3L4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751458571; c=relaxed/simple;
	bh=Yk7dR2itmICJrASu1wQYTL0JAgzGuSjOR7cDtLlcqMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FwUs1N9oSxfmxiVc1W2Q8ApVnK4MNjm0g0MWYylD4C/ExDR8DHvKmqFnE0WdejWj0g1ces7K3CIEKQH4TqotX2/3FiRmNl7wYoVDV/jHQQF+JPh7yEjfRDPv/fBGQTEoJrWX7b+ZivoMPrWIQJkQhnBgIlF3jkEQ4wHz2z2pir4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id C3B4B1F00057;
	Wed,  2 Jul 2025 12:15:54 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 1A9CFAC9A6F; Wed,  2 Jul 2025 12:15:52 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id B1D2AAC9A5F;
	Wed,  2 Jul 2025 12:15:48 +0000 (UTC)
Date: Wed, 2 Jul 2025 14:15:46 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Maxime Ripard <mripard@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-gpio@vger.kernel.org,
	Yong Deng <yong.deng@magewell.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Linus Walleij <linus.walleij@linaro.org>,
	Icenowy Zheng <icenowy@aosc.xyz>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH 5/5] drm/sun4i: Run the mixer clock at 297 MHz on V3s
Message-ID: <aGUi8ot1-0WaReyp@collins>
References: <20250701201124.812882-1-paulk@sys-base.io>
 <20250701201124.812882-6-paulk@sys-base.io>
 <20250702-psychedelic-stalwart-jerboa-a626eb@houat>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VVuCxM2QjPKpSc9g"
Content-Disposition: inline
In-Reply-To: <20250702-psychedelic-stalwart-jerboa-a626eb@houat>


--VVuCxM2QjPKpSc9g
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Maxime,

Le Wed 02 Jul 25, 13:36, Maxime Ripard a =C3=A9crit :
> On Tue, Jul 01, 2025 at 10:11:24PM +0200, Paul Kocialkowski wrote:
> > The DE mixer clock is currently set to run at 150 MHz, while the
> > Allwinner BSP configures it at 300 MHz and other platforms typically
> > run at 297 MHz.
> >=20
> > 150 MHz appears to be enough given the restricted graphics capabilities
> > of the SoC (with a work area of only 1024x1024). However it typically
> > causes the DE clock to be parented to the periph0 pll instead of the
> > video PLL.
> >=20
> > While this should generally not be a concern, it appears (based on
> > experimentation) that both the DE and TCON clocks need to be parented
> > to the same PLL for these units to work. While we cannot represent this
> > constraint in the clock driver, it appears that the TCON clock will
> > often get parented to the video pll (typically running at 297 MHz for
> > the CSI units needs), for instance when driving displays with a 33 MHz
> > pixel clock (33 being a natural divider of 297).
> >=20
> > Running the DE clock at 297 MHz will typically result in parenting to
> > the video pll instead of the periph0 pll, thus making the display
> > output functional.
> >=20
> > This is all a bit fragile but it solves the issue with displays running
> > at 33 Mhz and brings V3s to use the same frequency as other platforms,
> > making support more unified.
>=20
> It's beyond fragile, and doesn't have anything to do with the DRM driver.
>=20
> You should set up the clock tree properly in the clock driver, and then
> add NO_REPARENT to the DE clock to make sure it stays that way.

Thanks for the suggestion! I wasn't aware there was a flag to avoid
reparenting, sounds like the most reasonable way to solve this issue then.

I'll send another iteration reworking the clock tree then.

> And then, you can change the clock rate if you want to, but at least you
> don't set a rate and hope that the side effects work your way, and won't
> happen again.

We might as well still change it. To be honest I don't really see why it was
set to 150 MHz in the first place.

Cheers,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--VVuCxM2QjPKpSc9g
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhlIvIACgkQhP3B6o/u
lQyH5w/+JIxMLNpE+lve3HbxC4wqX2HIz1pGfWw1ZFhfrKgJmKhN4IiqfmZpGnPe
mC+U8F1T4hnqbmEc57eIo6Q1C3hEncq7EyY3oN0TJj7N5MM81Z/eVP1JUZ7XHq3V
q4Xy9b8/Zm5gDakbUe8ZZD4mLaugMafHA0lQK7OmKd75MeqP+OV68OPpuXCTCQnA
pVL7vDw19P0paH9sIUOe0NQ0SWYbFYZExVsOxoQnfT1BHz6ltM4bCyTdRNKDcakp
j56Yd0hPMnlV0khThy0+3tDenkUjPgiznqTzC6pWzhtysXvT4XRQOWQGXaN9C/w5
BrPbm79yFJ4UOZE0YBIcQNEvpNLP/7ApnMstKs2B4PlU1B6zJeYRWuPWmj7ZJIiO
H4ckfdJN0+KMtWsm/qOGQ95PgfE2ZjZX17NRq742azRJ/i+YvdjLQQS/BkflehU6
PUKcSgVecGQU8FXeU3da6ZMViNjy8xalVFceDaoLOMMruRA7dY1hJnRhawQIGJd1
1soYIRsyZq3y9F+Ij05BxC8TVp5rarfwlwDGdA/53ghGd0/uTikAMzsxpY+HKlCi
z+JXYN6BqGkUQ7YnqtRU0NoDcKwDWjiinOGaypzT9ULFaPhglmUkHfofqP7R1S7w
NCbV9amc9uAOOaFNSLb+zIYpYIPr0UPaQ8xCkwJJ1cPHGTUPQgQ=
=z/Ou
-----END PGP SIGNATURE-----

--VVuCxM2QjPKpSc9g--

