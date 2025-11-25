Return-Path: <linux-gpio+bounces-29051-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FAEC82F89
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 02:03:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B451234B6C5
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 01:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CAA11A3165;
	Tue, 25 Nov 2025 01:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a/b8LJxw"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32E136D4E8;
	Tue, 25 Nov 2025 01:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764032590; cv=none; b=JW+Cqnw8X8Mw/0udDhVob+huid4wR+CDxeHNptB2waCMFLbD8Cs8WM0IeTBHR+wdFYRW871HqFUnxpFCAOmrmClS/ZC4ue2TBV4AkM/ef4AOmR815z4McLAmQQMXs9UaIjVRClNfQLoHZO/UJanlmi7tt+6Fz14Ev3AK0ae0KhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764032590; c=relaxed/simple;
	bh=TQsjjXEbZyuH4Uh0TUx0pCyqX4lueW+SsVRHxMzIDvs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UArKNC+Eb1ygogIca7ubBSPU/90CE2h2TtI9ttmodWRwpCSBaPZsbbWH7XAy5We8L88P6tpeSY93emsOUA0FnVx72zahUPR232NkWRSWp5OeRclSp7uqaRrTtv9J8XTplBRgz4WSkvry4wYBxixb1mDppBuzYdOnN1dKelzgsxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a/b8LJxw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08C22C4CEF1;
	Tue, 25 Nov 2025 01:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764032587;
	bh=TQsjjXEbZyuH4Uh0TUx0pCyqX4lueW+SsVRHxMzIDvs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a/b8LJxw+as66OaR0YdXOW0mZnSerUPFK2y5YIVQ/TFcBX5D3dgHeIf43rQRgWlay
	 5NZZ4S3NgCJYPG1b8e44co10Fw9NKXEsA8J4NdErI4qlj6KFfCY8i/EVSI5C3zCwl8
	 6IN2FArEBv2sNCVhV5nARlyC2wNeL+khahgnfisjeHiYLOpnXQ0ZgnrvDkK5kMYB/2
	 Gg33kwz/cq+kvNiMRbBcRdTIg4V3QuIbfG7VFLqWxbgJ1YMx8iBFbVNRfWULr8rezA
	 2WKLvyFJugmVOgUO2Q3f7o1sQpxpREhUK4FDOhupgxmIn56s55ZDa9nq/7+FkEkIWM
	 G06JjtVW70d3g==
Date: Tue, 25 Nov 2025 01:03:02 +0000
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, Valentina.FernandezAlanis@microchip.com,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [RFC v1 2/4] pinctrl: add polarfire soc mssio pinctrl driver
Message-ID: <20251125-depravity-proofs-17b8d5dba748@spud>
References: <20251112-improving-tassel-06c6301b3e23@spud>
 <CACRpkdYQ2PO0iysd4L7Qzu6UR1ysHhsUWK6HWeL8rJ_SRqkHYA@mail.gmail.com>
 <20251119-bacterium-banana-abcdf5c9fbc5@spud>
 <CACRpkda3Oz+K1t38QKgWipEseJxxneBSC11sFvzpB7ycnqsjBA@mail.gmail.com>
 <20251120-silicon-oyster-5d973ff822d9@spud>
 <CACRpkdaM3Hkbxx99uXx6OVdSbdhNNc3voS1FoUsz2oAUEc1-qA@mail.gmail.com>
 <20251121-epidermis-overdue-1ebb1bb85e36@spud>
 <20251121-skimpily-flagstone-8b96711443df@spud>
 <20251124-operative-elephant-16c2c18aebde@spud>
 <CAD++jLn4z9KFTRoROZ8aKnK-1v=_magjgSq7JJJYt0=CO=gH4A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="41kgqZ51LVEaWcUV"
Content-Disposition: inline
In-Reply-To: <CAD++jLn4z9KFTRoROZ8aKnK-1v=_magjgSq7JJJYt0=CO=gH4A@mail.gmail.com>


--41kgqZ51LVEaWcUV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 01:31:49AM +0100, Linus Walleij wrote:
> On Mon, Nov 24, 2025 at 6:16=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
>=20
> > I was looking at the kernel part of this today, trying to figure out
> > where it would make sense to actually check this, but I'm not super keen
> > on what has to be done. I think doing it in parse_dt_cfg() makes the
> > most sense, setting flags if the property is one we care about during
> > the loop and then checking mutual exclusion at the end based on the
> > flags? The gpio example you gave has it easy, since they already appear
> > to have these things stored in flag properties.
> > Is there somewhere else, in addition to creating the config from dt that
> > this would have to be checked?
>=20
>=20
> We are right now parsing with an array of
> struct pinconf_generic_params:
>=20
> static const struct pinconf_generic_params dt_params[] =3D {
>     { "input-disable", PIN_CONFIG_INPUT_ENABLE, 0 },
>     (...)
> };
>=20
> (Sorry for not using C99 .initializers on the above array)
>=20
> Struct looks like so:
>=20
> struct pinconf_generic_params {
>         const char * const property;
>         enum pin_config_param param;
>         u32 default_value;
>         const char * const *values;
>         size_t num_values;
> };
>=20
> Can't we add a
>     const enum pin_config_param *conflicts;
>     size_t num_conflicts;
>=20
> And rewrite the parsing table to be more explicit:
>=20
> static const char * const input_disable_conflicts[] =3D {
>     "input-enable",
> };
>=20
> static const struct pinconf_generic_params dt_params[] =3D {
>     {
>         .property =3D "input-disable",
>         .param =3D PIN_CONFIG_INPUT_ENABLE,
>         .default_value =3D 0,
>         .conflicting_properties =3D input_disable_conflicts,
>         .num_conflicting_properties =3D ARRAY_SIZE(input_disable_conflict=
s),
>      },
>     (...)
> };
>=20
> Then in the loop we can use of_property_present(np, ...) to check for
> conflicting properties when we encounter something.

ngl, I didn't consider something along these lines cos I was trying not
to disrupt how things work at the moment and slot in some non-invasive.
That's probably a bad mindset.

I'm not sure how keen I would be on this of_property_present() idea
though, feels like wasteful to search the dt for conflicting properties
when we are already going through all possible properties and can do the
check at the end, when we've got all the information? Could probably
keep a temporay bitmap, using pin_config_param as the index, and use
test_bit() using the known-incompatibles to check it somewhat neatly?

--41kgqZ51LVEaWcUV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSUARgAKCRB4tDGHoIJi
0lIgAQCjnaJxVyxIx2z3F24phJ2S+iFmiVVqEez5nLJmNmdd8wD/RSCMnjWn/Xbk
RMEvpSkiN4NCwwWx+WhG2Ws+Wzqj3gg=
=Gfs+
-----END PGP SIGNATURE-----

--41kgqZ51LVEaWcUV--

