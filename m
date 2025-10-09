Return-Path: <linux-gpio+bounces-26944-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 29ABABC9E8C
	for <lists+linux-gpio@lfdr.de>; Thu, 09 Oct 2025 18:01:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C9A5435408B
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Oct 2025 16:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DA372F6196;
	Thu,  9 Oct 2025 15:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qFCYBu9f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 913E521B9FD;
	Thu,  9 Oct 2025 15:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760025354; cv=none; b=Kek+WYrFR4BJc+py1FrfyIFhpjYd89rMLijkHox4XOXimmuLEMXTFgBiCcmGUHHMAOmrrW1aBBJyVgyCnr+SksY28mWEVXt3aHTHaRu2SLlOvyBwTD1Up+m+saV1zpT7zbRLF/y50XfLWGVw3vIBW3N2wA4Sc7GB42Eta9QHit0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760025354; c=relaxed/simple;
	bh=8oGoJvRM1vOW7gFqrA/ZFkjHDSFZPvrM0HA4eNqKkW0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aFjV5++jVFznGzhlDnrDIKqJVcGbiiLCwpA+HaKe3uHLYYnQKittWp8brpCMR0Q2ZnKHRJy3NuqEPL7F7ohYINvjh1AXJzvd4BznbWsFdh4vbFTvxbYDefGi+Flt8mcY8W3DIKaTL5Qmd45bSFKJClOPTHi8AwetzyQD0TfgSjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qFCYBu9f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD550C4CEF8;
	Thu,  9 Oct 2025 15:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760025354;
	bh=8oGoJvRM1vOW7gFqrA/ZFkjHDSFZPvrM0HA4eNqKkW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qFCYBu9fkjyPBqf8+azk1K4LFI9vzjBAcqwf4NMS2fNYv4J+GSSEBwIvYp3ruw+bB
	 3C3YM6TPrPdT8GG36rO8opzM08ePOHF0vybVQDxEFQSiBxfqdCWU9dillIPNwW7QvS
	 OLfdysdvtn1bEa99sT/n214ktr2+cSHfhMLIh6TMboZKT6QuFYgBe1LFzJv7czJm6W
	 QGlNWtlvXt3RDH27dlug6b/34ZsLrjSV28ycbyuixe3fbZhusDDlWtZOTeV4mpVzCV
	 1a1jnKbO8uEEW62HlodZvfK55lm9EG1XkIV9Es7lZFj+/kydz+E69AFPt31XWrQ3lk
	 ksfgY12P4YMIQ==
Date: Thu, 9 Oct 2025 16:55:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC 0/5] microchip mpfs/pic64gx pinctrl questions
Message-ID: <20251009-amendable-trimming-da31551d730b@spud>
References: <20250926-manpower-glacial-e9756c82b427@spud>
 <CACRpkdYXh2MCs=vAif7BpxfYVRuDTkYYNwpV2t=J_ZRW+N4Vyg@mail.gmail.com>
 <20251001-unfreeze-ludicrous-9d744548bf65@spud>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XWleV0ai0b1XSICZ"
Content-Disposition: inline
In-Reply-To: <20251001-unfreeze-ludicrous-9d744548bf65@spud>


--XWleV0ai0b1XSICZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 01, 2025 at 05:15:07PM +0100, Conor Dooley wrote:
> On Wed, Oct 01, 2025 at 01:29:01PM +0200, Linus Walleij wrote:
> > Hi Conor,
> >=20
> > thanks for your patches!
> >=20
> > looking at the drivers it appears to be trying extensively to make use
> > of the pinmux =3D <>; property to mux entire groups of pins.
> >=20
> > pinmux =3D <nn>; is supposed to mux *one* pin per group, not entire
> > groups of pins from one property. See
> > Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml:
> >=20
> >   The pinmux property accepts an array of pinmux groups, each of them d=
escribing
> >   a single pin multiplexing configuration.
> >=20
> >   pincontroller {
> >     state_0_node_a {
> >       pinmux =3D <PINMUX_GROUP>, <PINMUX_GROUP>, ...;
> >     };
> >   };
> >=20
> > So e.g. when you do this:
> >=20
> >        spi0_mssio: spi0-mssio-pins {
> >          pinmux =3D <MPFS_PINFUNC(0, 0)>;
> >        };
> >=20
> > We all know SPI uses more than one pin so this is clearly abusing
> > the pinmux property.
> >=20
> > It is unfortunate that so many drivers now use this "mux one pin
> > individually" concept that we cannot see the diversity of pin
> > controllers.
> >=20
> > I cannot recommend using the pinmux property for this SoC.
> >=20
> > What you need to do is to define the actual pins and groups
> > that you have.
> >=20
> > Look for example at
> > Documentation/devicetree/bindings/pinctrl/cortina,gemini-pinctrl.txt
> > drivers/pinctrl/pinctrl-gemini.c
> > arch/arm/boot/dts/gemini/gemini.dtsi
> >=20
> > This is another SoC that muxes pins in groups, not in single per-pin
> > settings.
>=20
> This looks like something that the "gpio2" stuff could definitely go to,
> since it covers multiple functions trying to access the same pin. Do you
> have an "approved" example for a more demultiplexer case, where the
> contention is about which of multiple possible pins (or pin analogues)
> an IO from a particular block must be routed to?
>=20
> > Notice that the driver in this case enumerates and registers all 323
> > pins on the package! This is done because some of the groups
> > are mutually exclusive and this way the pin control framework
> > will do its job to detect collisions between pin groups and disallow
> > this, and that is what pin control is supposed to be doing.
>=20
> In that case, the mutual exclusion would be that a function can only be
> routed to one "pin", but there's no concern about multiple functions
> being routed to any given "pin".

So, what I ended up doing is moving the "gpio2" stuff to use
functions/groups as your gemini stuff does, so each function contains
one group containing all the pins it needs - except for the gpio
function which contains analogues for each of the function's groups.
I'll send a patchset next week when the merge window is closed, but for
now that driver is here:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commit/?h=
=3Dpinctrl&id=3D8c0fdf0c76fe99549d293894121d64300dc4057f
Unlike "gpio2", where each pin supports two mutually exclusive
functions and so fits nicely into the pins/groups/functions hierarchy,
for iomux0 each function has two mutually exclusive routings but there's
no contention over the "pins", the corresponding function is either
routed there or it is entirely unused. I implemented this by co-opting
the pin structure to really contain functions, with each appearing in
two groups, one per routing. Each function then contains those two
groups - I think that then takes advantage of the framework's collision
detection like you requested? It's here in case you care enough to take
a look before I send a proper patchset next week:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commit/?h=
=3Dpinctrl&id=3D5aec232c11bd45262fb2cfaf7994e3030fd6d947

Cheers,
Conor.

>=20
> >=20
> > I.e. do not orient your design around which registers and settings
> > you have, and do not model your driver around that, instead
> > model the driver around which actual pins exist on the physical
> > component, how these are sorted into groups, how the groups
> > are related to function (such as the group of SPI pins being
> > related to the spi function) and define these pins, groups
> > and functions in your driver.
> >=20
> > Yours,
> > Linus Walleij



--XWleV0ai0b1XSICZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaOfbBgAKCRB4tDGHoIJi
0qGBAQD1y9nLqbyvpJ79jdRkUjyOPlYwSUZuTTPekLu1YL+RpAD/dmBaD4Y+Zp82
f3lMbxgQuJEfmV4WstAiVyYguQNIUAE=
=Yrun
-----END PGP SIGNATURE-----

--XWleV0ai0b1XSICZ--

