Return-Path: <linux-gpio+bounces-29069-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id DFCC6C86531
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 18:50:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E86833537B2
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 17:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86B6432B9B3;
	Tue, 25 Nov 2025 17:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aN1Lm//W"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DFC1EDA2C;
	Tue, 25 Nov 2025 17:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764092868; cv=none; b=kpQMTYhbZK9FD2Ax8G7Rqe/ojiWOWDxg10yodltYgmNsVQLqgt3GBCurxFkDo6l8ny3o9rAH3erbnllyXpoBkTbZ/dm5sPMb1eE5tJDD8GRGcyDce+/m9z7ZGSv8up7On0hbkq4+Mu89WjMJja+5kB77lbnVFtVzFv15HPOBtdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764092868; c=relaxed/simple;
	bh=AMsvzxoa3i5wH8GnQblfvnwTIe/CSJ4OuVeraCfAFf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i6ULvu/BTUyBKrN31nGX6fmOX4BNxKeOLndI3NIuApexC4KDeam0PA751JLuvxxPvwmZwyf9PWOZtCCWjKNSPTViQWhTOT5yH/EyNfxYhyTmU+jCaHeXTM0dFBMb8MXjcymNAArtjpv9FEj1CT6C21gWv+TQDRAlqpsPb8jDDvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aN1Lm//W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5422C4CEF1;
	Tue, 25 Nov 2025 17:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764092866;
	bh=AMsvzxoa3i5wH8GnQblfvnwTIe/CSJ4OuVeraCfAFf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aN1Lm//W2pXkKt5C8FlGVKZWlu+zVHMWJvzPsN5uCE9rT4Iztppad/aRCcz+33R5H
	 JL2hpDwW8IIzeUoi2qKSKWxUT6d7fHSS9vSNO1LY9FIqYjgb9pkrgPykTx5vuEVZo/
	 Z65g/rXw5pebm/xxFPDYmgYHGv7peN+E4yuVIaAhiUqj9PrL7W1lmYDtEX5+Eep77r
	 AQEooCY9oOhv+pV2XnyUYc7UQvBleL9slwhw5lrqrWQMmw5V9u8+k9VollUuCpz2rD
	 HUN78hTML/jdfaTz5TDIhFK9TgzlzHWAKGQxDxbJ+LTk7MW+sK4nAYbpq6XaLsNfNE
	 bgQkd6EVu23Kg==
Date: Tue, 25 Nov 2025 17:47:42 +0000
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
Message-ID: <20251125-kindness-quicken-a70e3fdd0b8c@spud>
References: <20251112-lantern-sappy-bea86ff2a7f4@spud>
 <20251112-improving-tassel-06c6301b3e23@spud>
 <CACRpkdYQ2PO0iysd4L7Qzu6UR1ysHhsUWK6HWeL8rJ_SRqkHYA@mail.gmail.com>
 <20251124-crayfish-lard-cc7519e1119e@spud>
 <CAD++jLkehJNGxxQJV6vOA9xurBjwpYcL1ufYBQEOqRjNG-h-fg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zNM9q8Zr23TkU7Ww"
Content-Disposition: inline
In-Reply-To: <CAD++jLkehJNGxxQJV6vOA9xurBjwpYcL1ufYBQEOqRjNG-h-fg@mail.gmail.com>


--zNM9q8Zr23TkU7Ww
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 02:24:55PM +0100, Linus Walleij wrote:
> On Mon, Nov 24, 2025 at 8:14=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:
>=20
> > Started looking at this today too, and I found one of my sources of
> > confusion - the recently added helper which I think is confusingly
> > named. pinconf_generic_dt_node_to_map_pinmux() works differently to
> > pinconf_generic_dt_node_to_map(), because it only works if you have
> > the following setup:
> >
> > label: group {
> >         pinmux =3D <asjhdasjhlajskd>;
> >         config-item1;
> > };
> >
> > It does not work if you have:
> >
> > label: cfg {
> >         group1 {
> >                 pinmux =3D <dsjhlfka>;
> >                 config-item2;
> >         };
> >         group2 {
> >                 pinmux =3D <lsdjhaf>;
> >                 config-item1;
> >         };
> > };
> >
> > Specifically, the label must point to a group.
> > pinconf_generic_dt_node_to_map() does not work like this, it accepts bo=
th!
>=20
> My feeling is that this is a bug, it should certainly handle configs
> with subnodes.
>=20
> > I think the pinconf_generic_dt_node_to_map_pinmux() function should
> > actually be called pinconf_generic_dt_subnode_to_map_pinmux(), because
> > it operates at the same level as pinconf_generic_dt_subnode_to_map().
>=20
> If it should be renamed, yes. But I think it should be fixed to
> parse subnodes, if present.
>=20
> > Probably there should be a "real" pinconf_generic_dt_node_to_map() that
> > accepts both setups, since AFAICT it is pretty normal to have different
> > pins in a group that get different pinconf settings. Obviously
>=20
> I think it should be fine to augment the existing function to handle
> both cases? (configs inside the current node or in subnodes
> alike) I don't see it causing any regressions.

I think the rename to add subnode actually makes sense, as it would
match how the code is broken down for pinconf_generic_dt_node_to_map(),
since the code in the current pinconf_generic_dt_node_to_map_pinmux()
would have to be executed in two different places. That'd be invisible
to the amlogic driver though, if done properly, since a
pinconf_generic_dt_node_to_map_pinmux() would still exist.

>=20
> > label: cfg {
> >         group1 {
> >                 pinmux =3D <dsjhlfka>;
> >                 config-item2;
> >         };
> >         group2 {
> >                 pinmux =3D <lsdjhaf>;
> >                 config-item1;
> >         };
> > };
> >
> > peripheral {
> >         pinctrl-0 =3D <&label>;
> > }
> >
> > isn't the only way to do things, and the amlogic user of the current
> > setup could just go and do
> >
> > cfg {
> >         label1: group1 {
> >                 pinmux =3D <dsjhlfka>;
> >                 config-item2;
> >         };
> >         label2: group2 {
> >                 pinmux =3D <lsdjhaf>;
> >                 config-item1;
> >         };
> > };
> >
> > peripheral {
> >         pinctrl-0 =3D <&label1>, <&label2>;
> > }
>=20
> That works too, because sometimes you want to pick a few
> different configs and collect them as one.
>=20
> > Even then though, I'm not really sure that this function does what I
> > would have expected it to do, because it won't work as a replacement for
> > the custom dt_node_to_map in the spacemit k1 driver, for example, even
> > ignoring the requirement about how the labels are done in the dt. That's
> > because it doesn't actually do anything with the pinmux property, despi=
te
> > that being in the name. It never actually interacts with the pinmux pro=
perty
> > at all AFAICT!
>=20
> I think it's unfortunate naming, people sometimes use the word
> "pinmux" as a DT property, sometimes to describe the subsystem,
> sometimes a part of the subsystem, sometimes anything related
> to pins.

I think I actually understand the naming now. It's called pinmux because
the existing function pinconf_generic_dt_node_to_map() doesn't support
pinmux, so this is the version you need for platforms that are using
pinmux. But then nothing about it limits it actually to pinmuxes, other
than arbitrary property checks, it could actually be used for my pins +
functions use-case, if I added similar code to amlogics in my probe
function that creates the functions and groups.

I still think the naming is poor though, and that it is not as generic as
it purports to be, since it depends on having the exact dt configuration
that amlogic has, and wouldn't work for spacemit that use the first
multi-group example that I gave above. I'd be inclined to say that it
should be shunted back to the amlogic driver, to avoid baiting people
into trying to use it because of the label position problem, the fact
that it requires parsing the dt twice (the first time in probe to
generate the groups/functions), and because the code uses the parent
of node as the pinmux function. IOW, it needs:

pinctrl@bla {

	func-foo {
		label: group-default {
			pinmuxes =3D <lskdf>;
		};
	};
};

and couldn't be used somewhere like:

pinctrl@bla {

	label: group-default {
		pinmuxes =3D <lskdf>;
	};
};

Probably there's very few places where this second example makes sense
(cos it requires all pins in a group to always have the same config
parameters, but I could definitely see that being possible.

So ye, proposing moving it back from whence it came, rather than
actually making it work for both label positions.

> I know I should perhaps have shepherded this better :/

idk, I think this is the usual "creating something generic but with only
one user" problem. Hard to know if it actually is generic at all.

> > It seems to depend on aml_pctl_parse_functions() being called
> > during probe which creates the groups and functions.
> > There's a weird warning about expecting a function parent node that see=
ms
> > very amlogic specific too.
> >
> > In my eyes, there should be some generic dt_node_to_map helpers that
> > do it all for you on the "configuration entirely described in dt"
> > platforms because that's what stuff like spacemit k1 driver that do
> > this in their dt_node_to_map implementations.
>=20
> I think you're right!

My dilemma now is what to call them and where to put them.
pinconf_generic_dt_node_to_map<something>() feels weird for something
that is also creating functions and groups, which I noticed because I
was having to include pinmux.h in pinconf.c so that I could call
pinmux_generic_add_function().

>=20
> > I'm not gonna get in over my head, and just make a helper for doing the
> > pins + function thing that I need for my driver, but would you be open
> > to an equivalent for the pinmux scenario?
>=20
> Yes!
>=20
> > I'm thinking of something
> > that'd work for both the amlogic platform and for the spacemit k1.
>=20
> That's a good start!
>=20
> Yours,
> Linus Walleij

--zNM9q8Zr23TkU7Ww
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSXrugAKCRB4tDGHoIJi
0o1jAP9gd34aLTQsCAVSkNTrX40lkHmgGWdEAl84xA1OCSyjYgD/aipTVpVuFCao
JZW5U/Hzfv8dlYXYQZt6uxptcL+jLAs=
=C4Nx
-----END PGP SIGNATURE-----

--zNM9q8Zr23TkU7Ww--

