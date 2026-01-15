Return-Path: <linux-gpio+bounces-30612-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09E0CD27365
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 19:12:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 304AA304349A
	for <lists+linux-gpio@lfdr.de>; Thu, 15 Jan 2026 17:56:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E0BD3E8C4B;
	Thu, 15 Jan 2026 17:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GFbOzEAm"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408CE3D301C;
	Thu, 15 Jan 2026 17:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768499416; cv=none; b=CzUDfAYUH5+7YTRJMhMqdYSZidWUeLshc9TqASOlqhxzNHwSs6+v8jkpYowUxPx1oge2P5510CJPflx0F4sM8CxHFKGGpbKfgDBqtb30gGWrlfT9cG5H4UjywJaGSzt0YbsCGXAEqgg20qqB5btiw2uyDZoGx7y8iRnK1KGlBlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768499416; c=relaxed/simple;
	bh=8VTZE1qAypLISFYE3DXnSHciGtiAd9l8kBlBqwt0Tj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j5IX+MneojU78129L0doTpgJaOikJ95aNqqovMsJE3vGBrGK9mwlNB+DLnj87NYWdApK1m7KRqufQAdNGn3DIDPAbPeZO+sw2WO9HYCSURpdfddW8uz/QB4hvzwLY0j0Nlhlv7OoAuyTfHmxWBuANQWqvP6g4MZVVBYnDMY0ZSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GFbOzEAm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EDBFC2BC86;
	Thu, 15 Jan 2026 17:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768499416;
	bh=8VTZE1qAypLISFYE3DXnSHciGtiAd9l8kBlBqwt0Tj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GFbOzEAmvXk0LSSSh10vGgYVG6L/9EDzb0CBd9ZfuUOHTHqlGzMpC1TbXRfHVCFkW
	 FLz7DcQich97CUvxM89/ATVQ6J+ItRuJq/NJRgSRMATmUP9DATuIBsmqbnWa1mFNhO
	 Oo/Pib7/u7Kk4YOilmzj8jKxUGxx7NsivWg4DTq6RD5AOM1ZCaQscg2DSxPfkXXuj8
	 ht5WSg+uUti6ZYjd70RtzlIHEN2Rm3zWJxSvljKK5VIiE2RR3UFb49aLp2vtphyA4D
	 l2fCvZuIdZtPGCvwsPj30UB3hQRYrQab6Zf8gpt3AzxvSZ66WqNnH1ZGsbMjg+fshN
	 qDcc4eRJ1Dqrg==
Date: Thu, 15 Jan 2026 17:50:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: linus.walleij@linaro.org, Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, Valentina.FernandezAlanis@microchip.com
Subject: Re: [RFC v2 2/5] pinctrl: add generic functions + pins mapper
Message-ID: <20260115-renegade-strangle-43c5222fc070@spud>
References: <20251127-bogged-gauze-74aed9fdac0e@spud>
 <20251127-approve-parsley-49302c061ea1@spud>
 <CAD++jLnLgLHeCjc7HD6KHQ-pWb9TFHbTUC-KB5X8eCFDXNNOBA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fGMnYYUoioCRmWEW"
Content-Disposition: inline
In-Reply-To: <CAD++jLnLgLHeCjc7HD6KHQ-pWb9TFHbTUC-KB5X8eCFDXNNOBA@mail.gmail.com>


--fGMnYYUoioCRmWEW
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 26, 2025 at 10:29:31AM +0100, Linus Walleij wrote:
> Hi Conor,
>=20
> sorry for being slow in reviews!
>=20
> On Thu, Nov 27, 2025 at 11:58=E2=80=AFAM Conor Dooley <conor@kernel.org> =
wrote:
>=20
> > +config GENERIC_PINCTRL_BELLS_AND_WHISTLES
>=20
> Interesting name :D
>=20
> A bit like GENERIC_PINCTRL_LOCK_STOCK_AND_BARREL.
>=20
> Have you considered simply GENERIC_PINCTRL?

Sure, I really didn't know if that was too "core" sounding for something
with almost nothing in it.

> > +obj-$(CONFIG_GENERIC_PINCTRL_BELLS_AND_WHISTLES) +=3D pinctrl-generic.o
>=20
> especially since the file is named like so...
>=20
> > +/*
> > + * For platforms that do not define groups or functions in the driver,=
 but
> > + * instead use the devicetree to describe them. This function will, un=
like
> > + * pinconf_generic_dt_node_to_map() etc which rely on driver defined g=
roups
> > + * and functions, create them in addition to parsing pinconf propertie=
s and
> > + * adding mappings.
> > + */
> > +int pinctrl_generic_pins_function_dt_node_to_map(struct pinctrl_dev *p=
ctldev,
> > +                                                struct device_node *np,
> > +                                                struct pinctrl_map **m=
aps,
> > +                                                unsigned int *num_maps)
>=20
> All code looks fine.
>=20
> There is just the philosophical question whether groups and functions sho=
uld
> really be in the device tree, as they can obviously be statically defined=
 and
> associated with the compatible.
>=20
> I got so much pressure to do it this way because so many driver authors r=
eally
> wanted to keep this in the device tree (usually because it saves memory i=
n the
> kernel) that I eventually caved in, and I have also been criticized for b=
eing to
> lenient on this because the compatible should suffice.
>=20
> For me this is all fine, and with you submitting this I suppose even the =
DT
> maintainers think this is fine to keep groups and functions in the device
> tree, so there it is.

I think that you're mostly right though. There's a lot of situations
where the pinmux-node properties are used because they're easier than
putting functions and groups structs into a devicetree. They're boring
and annoying to write, when a pinmux property can do the job for you,
particularly on bigger devices where there may be lots of them.
My personal take would be that it comes down to complexity, and the
number of possible groups/functions that a pin can belong to. If that
number is very high then it makes sense I think to put it in dt, but if
there's only a small number than spelling them out in the driver I think
makes the most sense.

The pinmux property on the other hand, were I asked to review it as a
new property, I would reject. I'd probably push for not using pinmux, as
you did with my drivers, more. I think finding good examples to copy
=66rom of it being done that way was why I didn't try. The docs that
explain about statically defined functions and groups, IIRC, kinda come
across as being a mach-foo thing, rather than intended for use with dt,
until you pointed out an example and I was able to link the two.
Based on what I've done for this series, I know that what that property
seeks to do can be done using pins and functions, rather than mixing
both up together into a single property - even worse, it's even a single
cell! I only used it myself in the earlier versions cos everyone else
does it and the infra existed to use it already. I've not looked at
every user, but every user I looked at used it to hold the function, not
some additional mux setting.

> I can merge this when it's out of RFC.

Sweet. I'll hopefully get it out in the next day or so.

--fGMnYYUoioCRmWEW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaWkozQAKCRB4tDGHoIJi
0gyWAQDE7siXZK5Q8809+OuPzVpJw5Y0QvMr8rveB5w631wUngEAyMKkjj+dFNyF
de7/j3Cu+xfHjxr2WaFzCmK+dBDJiAg=
=pciE
-----END PGP SIGNATURE-----

--fGMnYYUoioCRmWEW--

