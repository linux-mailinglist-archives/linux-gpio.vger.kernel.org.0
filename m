Return-Path: <linux-gpio+bounces-30613-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B925ED27371
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 19:12:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 83C1430F8549
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 18:04:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF9633D1CDA;
	Thu, 15 Jan 2026 17:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fybKxJu/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4F13D6667;
	Thu, 15 Jan 2026 17:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768499761; cv=none; b=E7rFuRYhmEuK4kx/U31g8u00Vs8n41VjudD0Nj6tRtvetqVfiLa4Z/GBRU+b018BaTtqhrXKi9RSQPAzMrpbxwGvEaEgdEbjePUdyPO9tlFpsOL0n8hQaZp7AwNuqeorf51YqfeVTKgiH7Ov6vCtbl8Kh89mjx25nm4e7jFvAqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768499761; c=relaxed/simple;
	bh=IvYoltmC+bI3hqLQd+e9UfhKIkh3JKTy2Fff9C7sJgU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tN4PHrgUzuKma/OZ6VnyZKFIhsI83ItffUz0sXKLyUsUbTt/t0diZyu5GMy4n3BBFzeVuK3ldW7qFbD48RCUGRClOSjYI8Oao551WpWCGy7h08vER5W2YV/aWyVD8iMHfVxbeiC9OOmAo/obq+7rh9hLm+S2KGghooqTOsKYwxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fybKxJu/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4315C116D0;
	Thu, 15 Jan 2026 17:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768499761;
	bh=IvYoltmC+bI3hqLQd+e9UfhKIkh3JKTy2Fff9C7sJgU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fybKxJu/o1kIocFapw712vol7Q2wh4EGQk1nxS7SmROCWa6AJnlmSJrjkMv8nvR49
	 3d+wV8qiojNkkJ55SIbrW8hslv94pEzcRMJ/Vgx0AQlmgQdJDyEFX8F7hE26Tzk5Hb
	 KfsL3/zuXdMPj9D3RUEzvs+rzvJCjbEmOYCzWE6TClPzolTSgyV/8hr/LzI9ZfH2Bg
	 FuMrafRBUNunjTarWTfRfAo60T7/qPDt0ll9P4aZPcGNAQB1wFTz5EPDPgRgUeC6FG
	 WxGglwEiIl42VPvygw04SKINNJljo7VmU618CW+QeL8dsiUZfBBINZAQkzCINvrgeQ
	 uXPLX7pV6XIvg==
Date: Thu, 15 Jan 2026 17:55:57 +0000
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: linus.walleij@linaro.org, Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, Valentina.FernandezAlanis@microchip.com
Subject: Re: [RFC v2 3/5] pinctrl: add polarfire soc mssio pinctrl driver
Message-ID: <20260115-wired-botanical-042f7cda4449@spud>
References: <20251127-bogged-gauze-74aed9fdac0e@spud>
 <20251127-capped-prewar-99fd94faea24@spud>
 <CAD++jLkxLJRZocHenBASLzoUAbw=oPpMajNF6a5z-Lzds+5Ecw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8PiXYbBVoAfJA0rn"
Content-Disposition: inline
In-Reply-To: <CAD++jLkxLJRZocHenBASLzoUAbw=oPpMajNF6a5z-Lzds+5Ecw@mail.gmail.com>


--8PiXYbBVoAfJA0rn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 26, 2025 at 10:40:07AM +0100, Linus Walleij wrote:
> On Thu, Nov 27, 2025 at 11:58=E2=80=AFAM Conor Dooley <conor@kernel.org> =
wrote:
>=20
> >  drivers/pinctrl/Kconfig              |   7 +-
> >  drivers/pinctrl/Makefile             |   1 +
> >  drivers/pinctrl/pinctrl-mpfs-mssio.c | 750 +++++++++++++++++++++++++++
>=20
> Time to move the drivers to drivers/pinctrl/microchip
> before it becomes an overpopulation problem?

Sure, no problem.

>=20
> (The previous drivers can be moved in a separate patch.)
>=20
>=20
> > +       select GENERIC_PINCTRL_GROUPS
> > +       select GENERIC_PINMUX_FUNCTIONS
> > +       select GENERIC_PINCTRL_BELLS_AND_WHISTLES
>=20
> Just the bottom select will bring it all in, right?

I'll make it do that if it's not already. Just didn't know if you were a
"select everything you use" kinda guy or didn't mind selects selecting.

> > +static int mpfs_pinctrl_pin_to_iocfg_reg(unsigned int pin)
> > +{
> > +       u32 reg =3D MPFS_PINCTRL_IOCFG01_REG;
> > +
> > +       if (pin >=3D MPFS_PINCTRL_BANK2_START)
> > +               reg +=3D MPFS_PINCTRL_INTER_BANK_GAP;
> > +
> > +       // 2 pins per 32-bit register
> > +       reg +=3D (pin / 2) * 0x4;
>=20
> It's helpful with these nice comments that ease the reading of the code
> quite a bit.

Eh, I feel like sometimes a comment like this is just better than trying
to insert silly defines to unmagic the numbers.

>=20
> > +static int mpfs_pinctrl_set_mux(struct pinctrl_dev *pctrl_dev, unsigne=
d int fsel,
> > +                               unsigned int gsel)
> > +{
> > +       struct mpfs_pinctrl *pctrl =3D pinctrl_dev_get_drvdata(pctrl_de=
v);
> > +       const struct group_desc *group;
> > +       const char **functions;
> > +
> > +       group =3D pinctrl_generic_get_group(pctrl_dev, gsel);
> > +       if (!group)
> > +               return -EINVAL;
> > +
> > +       functions =3D group->data;
> > +
> > +       for (int i =3D 0; i < group->grp.npins; i++) {
> > +               u32 function;
> > +
> > +               //TODO @Linus my new function being actually generic me=
ans that
> > +               // the mapping of function string to something the hard=
ware
> > +               // understands only happens at this point.
> > +               // I think this is fine, because dt validation would wh=
inge
> > +               // about something invalid, but it's the "catch" with m=
y approach.
> > +               // The other option I considered was to provide a mappi=
ng
> > +               // function pointer that the driver can populate, but I=
 think
> > +               // that's overkill.
> > +               function =3D mpfs_pinctrl_function_map(functions[i]);
> > +               if (function < 0) {
> > +                       dev_err(pctrl->dev, "invalid function %s\n", fu=
nctions[i]);
> > +                       return function;
> > +               }
>=20
> This is fine with me.
>=20
> Ideally I would like code that does a lot of string stacking and comparing
> to be using Rust, but we cannot yet use that in core code so that is for
> another day.

Yeah, would be nice. My problem with it was more about the point in time
where this happens rather than doing it in the first place though.


--8PiXYbBVoAfJA0rn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaWkqLQAKCRB4tDGHoIJi
0p4kAQDz/vdrHeuN+fcuJHTqhEElz2W9rqbpW43B00tJ8jEPWQD+MQgReOM8TesV
x1/4wrjnkb7Vu0QZNjZQv5m3ik0zHgU=
=YGyr
-----END PGP SIGNATURE-----

--8PiXYbBVoAfJA0rn--

