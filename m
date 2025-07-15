Return-Path: <linux-gpio+bounces-23294-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A13FB05A97
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 14:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1DE416C9FD
	for <lists+linux-gpio@lfdr.de>; Tue, 15 Jul 2025 12:51:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C0B5274FDB;
	Tue, 15 Jul 2025 12:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O9/iwWRg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556E9246BD7;
	Tue, 15 Jul 2025 12:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752583868; cv=none; b=Xe2G+HM3SW5mB5AMBQULwzWCKHjP/qG3Wn3fonUYALrfsDkIwyALGE6kwY8WKdT0o9GmNULY7Yo0xrSkrU57BSY1T5pfaOcCVF0906GWujXb9e5X26yee+iTEcbYHRc/ecjnC5hxyjHQc1K+BOu811Kh09MPnj08nOMUyJYQYPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752583868; c=relaxed/simple;
	bh=SYqdH0nbo/soJyG407Y7VfgSiFhIAFxZHSCoScU9FK0=;
	h=Content-Type:Date:Message-Id:Cc:From:To:Subject:References:
	 In-Reply-To; b=UnqJ1Vr7cXSILkJ9e5SdMYxjGFj3l9DC2a5Y28bU7/HKJwFC8YRB2bf4iUaVifv8SMszjU433RO9K9JAJ4Hqh8BzOsXSwSNmd986yWL6af54qxBRrO4AvF50V5UnXiOWGtT324k5rXLijGNK9myi1opFwBfXpO6XXq/zwEiRjjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O9/iwWRg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58F67C4CEE3;
	Tue, 15 Jul 2025 12:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752583867;
	bh=SYqdH0nbo/soJyG407Y7VfgSiFhIAFxZHSCoScU9FK0=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=O9/iwWRge4o3xkYF0GIBAevq1B/CZpGE0WPXQr2yKNDytYayI51CvSw1FALWIDe/q
	 sfD6OGm6lZ3ClTA9ZS1MLIpHdn77PfGKzcYSbZUR1Dfuh5EMkwanZXYx7OR7F4SfCD
	 BdNdpJDdGjMkJo+41UhCEVencI0tcu5sViP2tcRIxbuGJahIkv+gsCzw9/VzgWUNAH
	 MU9ha3GNnKWSJlovwr5HHj9m3pM/gWbQwEdNH/0PmUWEwmusGbEmsUTDEPP11BG8Aq
	 OfIey3BylZsQ29U2ljtYbu8IjkfiraOl4EJeEHtW76TLp4AT/WtLab1FRpPYEy3jYd
	 PHYMwoDFdd3kQ==
Content-Type: multipart/signed;
 boundary=ec4565a1291b5d1d81a6a11630de29101cca86d2a1c006a83cf8c92e6fb6;
 micalg=pgp-sha384; protocol="application/pgp-signature"
Date: Tue, 15 Jul 2025 14:51:03 +0200
Message-Id: <DBCN4NYM5NF3.S9SFP077EKFK@kernel.org>
Cc: "Linus Walleij" <linus.walleij@linaro.org>, "Andrew Lunn"
 <andrew@lunn.ch>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Bartosz Golaszewski" <brgl@bgdev.pl>, "Shawn Guo"
 <shawnguo@kernel.org>, "Lee Jones" <lee@kernel.org>, "Frank Li"
 <Frank.Li@nxp.com>
From: "Michael Walle" <mwalle@kernel.org>
To: "Ioana Ciornei" <ioana.ciornei@nxp.com>
Subject: Re: [PATCH 4/9] gpio: regmap: add the .get_direction() callback
X-Mailer: aerc 0.16.0
References: <20250709112658.1987608-1-ioana.ciornei@nxp.com>
 <20250709112658.1987608-5-ioana.ciornei@nxp.com>
 <0d0e9cee-2aaa-402d-a811-8c4704aadd74@lunn.ch>
 <CACRpkdYDTXA7+YN2zRCsQxu2AKEAwbDVq8-m27ah5XTw9iRNPw@mail.gmail.com>
 <55e7aeb5-565f-4452-bc11-55968dcc0a9e@lunn.ch>
 <CACRpkda+=A5R4vZZQZKmF3LnGd6xMYbNomahgTW+j9aX9swBFA@mail.gmail.com>
 <DBBKJ05VNSDG.30MNWDWT9JAEC@kernel.org>
 <c4ff34jwaiyby52ambcxtu2mrjlkcv44scjsveb6s6pvaps33u@bvl3wz6mvsuo>
In-Reply-To: <c4ff34jwaiyby52ambcxtu2mrjlkcv44scjsveb6s6pvaps33u@bvl3wz6mvsuo>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

--ec4565a1291b5d1d81a6a11630de29101cca86d2a1c006a83cf8c92e6fb6
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> > > Then the core can use is_fixed_direction() together
> > > with gpio_get_direction() to check if it can do
> > > a certain set_direction().
> > >
> > > Pseudocode:
> > >
> > > mydir =3D get_direction(line)
> > > if (is_fixed_direction(line) && (mydir !=3D requested_dir)
> > >   return -ERROR;
> >=20
> > You don't need a .is_fixed_direction(). You can deduce that if only
> > .get_direction() is set in the gpio-regmap config.
> >=20
> > mydir =3D get_direction(line)
> > if (!config->set_direction && mydir !=3D requested_dir)
> >   return -ERROR;
>
> This implies that gpio_regmap_config gets two new callbacks
> .get_direction() and .set_direction() and that in case .set_direction()
> is set in gpio-regmap config, then its used directly from
> gpio_regmap_set_direction(), right?

Yes. Or just .get_direction() for now and assume that .set_direction
is NULL, i.e. it just covers your use case for the fixed direction.

.. Oh I just noticed that this will really limit the use to either
all or nothing. You cannot mix set user defined directions with
fixed directions. Linus' .is_fixed_direction() will allow that.

Though I wonder if we really want to let the user override
.get_direction() and .set_direction(). I still prefer the bitmap.

> > That or either Andrew's idea of setting a bitmap within the
> > gpio-regmap config which already tells the gpio-regmap core and then
> > amend gpio_regmap_get_direction() to return that fixed direction if
> > that bitmap is not NULL.
>
> Even though at first glance I was under the impression that the bitmap
> solution is cleaner, how big should the bitmap be knows only the final
> gpio driver. Without this information, we cannot know the bitmap size so
> that we can use the DECLARE_BITMAP macro in gpio-regmap config.

Actually, I had the same thought. But there is also bitmap_alloc()
and friends, no? And the gpio-regmap config contains the ngpios.

In gpio_regmap_get_direction():

if (gpio->fixed_direction_output && test_bit(offset, gpio->fixed_direction_=
output))
	return GPIO_LINE_DIRECTION_OUT;

Which implies that once .fixed_direction is set it will always be
checked. So if someone in the future wants to mix and match
.fixed_direction with .reg_dir_{in,out}_base we have to add a second
bitmap which tells you what pins are fixed.

You'd probably need to make sure offset is smaller than ngpio.

-michael

--ec4565a1291b5d1d81a6a11630de29101cca86d2a1c006a83cf8c92e6fb6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCaHZOuBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jVpQF+NoJo814cmBH+vHHm8ckC5v4daX6Bw6ES
oRBk0K+1tCH3Dj4lZ2+8iHri4IjcdFZhAX9VG0PCxJXduNN2yFaXPrmuMHUuQp1w
LDLbANDZ8lC0qwzD9T/zhyjuqoiIMz/18Zo=
=yvBU
-----END PGP SIGNATURE-----

--ec4565a1291b5d1d81a6a11630de29101cca86d2a1c006a83cf8c92e6fb6--

