Return-Path: <linux-gpio+bounces-12464-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B22799B9325
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 15:28:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3EAC1C20DA9
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Nov 2024 14:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4923419D891;
	Fri,  1 Nov 2024 14:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g5a69qAS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AA81BF24
	for <linux-gpio@vger.kernel.org>; Fri,  1 Nov 2024 14:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730471290; cv=none; b=Lf2SiCesMRbqySKJoSMG8/RR16L6K7R4WA/yA8LzdpkOPYrLiT4XMDbkKv8PC0IqTxNNnv0A9jNfcRWmxBm/sFOzeXEbDWFHTXQrZpRokFvJIXLZ1s/7FM8wDGwWZZFYXbnwKLPyycraHnIbiXAjvkEX6V9duISpaMqs9zeHFLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730471290; c=relaxed/simple;
	bh=AjAIF85z5Uxz+x4ccS2cpLYgMjub5frwQOz5VRwAuac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PTsGxDAeD1jDLT/cxqVBMpAAn1Jv49ff4Ht/4U0z9fthDTzTroF60f62CX1DDjKv0Ro/4wNqKqlHVYW8VI+ohGispjsQu9H6iKv0rDj9eS75+/V1/KkMX6WaWKDmB5J8ugPcO2u7htfsxWXrWCIvJKxf1wWTNnZeOLiZ7+Yx8lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g5a69qAS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E73DC4CECD;
	Fri,  1 Nov 2024 14:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730471289;
	bh=AjAIF85z5Uxz+x4ccS2cpLYgMjub5frwQOz5VRwAuac=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g5a69qASmXc7336pZD18TTbtcSQSE0TwiC/NEjYgymyAC5W3P4+L3AFJvUTXUQkDe
	 dXv4POevhDcZ7SACrSGqN5yMDYIV3x9u3dVi1P1Z52PfOjuGppRnl5f3fguXsj3DDb
	 mMphP2ayeSzsdIxixb6DneLIOurgo5V8Ab8W0gSlFdiN8zZKCwoeLlzBxpEjJWkaxH
	 GeeeTYC12pVln2LbF14vmGQQW0GdigrwYVzSaW0P97mMPgoRbouYNmu9THBV0KSYYh
	 qOSF1zeCfpDDNRv9RXRHaI1GQ4nTMs7Hr9yGgDTydFdWjv+xzphzyjeU0AnyVgGx1O
	 LTrm2gnVYNpBg==
Date: Fri, 1 Nov 2024 14:28:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	valentina.fernandezalanis@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Lewis Hanly <lewis.hanly@microchip.com>
Subject: Re: [PATCH v9 1/1] gpio: mpfs: add polarfire soc gpio support
Message-ID: <20241101-culprit-ascend-de1a8f1967d7@spud>
References: <20241031-scouting-earmark-6b4dfc6bc6e2@spud>
 <20241031-appease-purse-55145b5dfba4@spud>
 <CAMRc=Men4sxFdSVR_WaJEG1UM7dXeGxTbw0=M_y3NsBmEOZzmQ@mail.gmail.com>
 <20241101-cadmium-speed-78ff7577347a@spud>
 <CAMRc=Mccc2tD2ZNQWpf6_wFt76p1ckyAqw-u6DBObgJV3n50CQ@mail.gmail.com>
 <20241101-affirm-evict-bbd862b08832@spud>
 <CAMRc=MfSOUCFBjqeHwyMgKmNWb4==4=kwdT+aUtPHWKuiWm0aA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0Mkmi9kIVRq62HD2"
Content-Disposition: inline
In-Reply-To: <CAMRc=MfSOUCFBjqeHwyMgKmNWb4==4=kwdT+aUtPHWKuiWm0aA@mail.gmail.com>


--0Mkmi9kIVRq62HD2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 01, 2024 at 02:47:51PM +0100, Bartosz Golaszewski wrote:
> On Fri, Nov 1, 2024 at 2:37=E2=80=AFPM Conor Dooley <conor@kernel.org> wr=
ote:
> >
> > On Fri, Nov 01, 2024 at 02:09:06PM +0100, Bartosz Golaszewski wrote:
> > > On Fri, Nov 1, 2024 at 1:17=E2=80=AFPM Conor Dooley <conor@kernel.org=
> wrote:
> > > >
> > > > On Thu, Oct 31, 2024 at 02:00:22PM +0100, Bartosz Golaszewski wrote:
> > > > > On Thu, Oct 31, 2024 at 1:04=E2=80=AFPM Conor Dooley <conor@kerne=
l.org> wrote:
> > > >
> > > > > > +       mpfs_gpio->gc.direction_input =3D mpfs_gpio_direction_i=
nput;
> > > > > > +       mpfs_gpio->gc.direction_output =3D mpfs_gpio_direction_=
output;
> > > > > > +       mpfs_gpio->gc.get_direction =3D mpfs_gpio_get_direction;
> > > > > > +       mpfs_gpio->gc.get =3D mpfs_gpio_get;
> > > > > > +       mpfs_gpio->gc.set =3D mpfs_gpio_set;
> > > > > > +       mpfs_gpio->gc.base =3D -1;
> > > > > > +       mpfs_gpio->gc.ngpio =3D ngpios;
> > > > >
> > > > > The "ngpios" property will be parsed by GPIO core so no need to s=
et it.
> > > >
> > > > Are you sure it'll work here? I tried dropping the ngpios parsing, =
but I
> > > > get:
> > > > gpiochip_add_data_with_key: GPIOs 0..-1 (20122000.gpio) failed to r=
egister, -22
> > > >
> > > > That's coming from the device_property_read_u32(dev, "ngpios", &ngp=
ios);
> > > > in gpiochip_get_ngpios(). Checking against the bluefield driver and=
 the
> > > > code in gpiochip_add_data_with_key(), it's not immediately obvious =
what
> > > > I am missing.
> > >
> > > Does dev have an fwnode correctly assigned? What does dev_fwnode(dev)=
 return?
> >
> > It's not a null pointer or something obviously wrong by virtue of being
> > null-adjacent, it is a virtual address but not one that %ps can identif=
y.
>=20
> This is an OF system right? If you do dev_of_node(dev), does the
> returned node->name show the OF node you expect?

Yes.

> Does it have the
> "ngpios" property? Can you read it with of_property_read_u32()?

No, EINVAL there too.

--0Mkmi9kIVRq62HD2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZyTldQAKCRB4tDGHoIJi
0jqrAP9fVyzZnwRdworyCk0pT5EJIiGLJy3JJv8aknCCIHjEdQD/ammOS960I4zL
5OsNS6ynU2pP64Buvva4f9LSe08NRgs=
=XEKz
-----END PGP SIGNATURE-----

--0Mkmi9kIVRq62HD2--

