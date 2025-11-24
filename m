Return-Path: <linux-gpio+bounces-29044-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B972C823E4
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 20:14:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BEE0B3AB3DF
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 19:14:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C6522D3750;
	Mon, 24 Nov 2025 19:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="re1arGzk"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC562C3272;
	Mon, 24 Nov 2025 19:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764011669; cv=none; b=RkNpda7B7j/vRJ4f8vWrJxvgOuqrvmaSAYF9Vaf0Lhkx13I/qr+EGHfFeO9StVSQTNdpGpfOkGDAG6eS+F4Z/a2lbjxew0bVXnzl52VAwHk1Pv2YKnP545mLQNHIzRxVkc5KilzWIj3kvak8wQTrRuHNeRvippCH0ONrCNbhEOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764011669; c=relaxed/simple;
	bh=IGS//uS2mC9xTjWUgsup5D+zQDZI9ZYBkqzdAiM2/7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lzZAJ7tmiV/gSPx67Bkh1EClI91/2CJjwSTf9dPJpwj98D52H56ypYDRx65Iq23jRSG1NbEZz5zAryjqjGfJ+rXtjLJQgB8Rmx3L+m97mW8HCvSkm1mqQ6yoB/7BiPHs4K/ISwQat1iR1EB8zOGiNVdsREc5UVISha8gobQDtLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=re1arGzk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF4E5C4CEF1;
	Mon, 24 Nov 2025 19:14:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764011668;
	bh=IGS//uS2mC9xTjWUgsup5D+zQDZI9ZYBkqzdAiM2/7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=re1arGzkZNmD6U366m/hQS9SBEHp000Tv5oZeYdtpTZvuCFu874FDLSmHXfAeMgyP
	 0u9pla9Hss5+Dsnq7I52wTAdXX/vvoQ6dGsGDl96cP1n4TrE61A8qwDyu+s4XSnmd4
	 JUYWLdf76ey4S6B6yIFW5GnpVEuZ/DVO2BfSR6nnWi+a/QTjsO/5/NSowbPhSrT1ku
	 QlkH+yhTRfcENlcsR/d+pnPADtCZNkDB9Ell7QyRasYCBv5Km1nYD6xihhocm6g238
	 i9G9YCbBqk7d4yAN3DsmwFakyQC6FbFwk7xaTBpyeiZNKs/REikx5P5GS2Q5BG2KdB
	 TOY7WwlLwfilg==
Date: Mon, 24 Nov 2025 19:14:24 +0000
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, Valentina.FernandezAlanis@microchip.com,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [RFC v1 2/4] pinctrl: add polarfire soc mssio pinctrl driver
Message-ID: <20251124-crayfish-lard-cc7519e1119e@spud>
References: <20251112-lantern-sappy-bea86ff2a7f4@spud>
 <20251112-improving-tassel-06c6301b3e23@spud>
 <CACRpkdYQ2PO0iysd4L7Qzu6UR1ysHhsUWK6HWeL8rJ_SRqkHYA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rmbc813uVSMJILcK"
Content-Disposition: inline
In-Reply-To: <CACRpkdYQ2PO0iysd4L7Qzu6UR1ysHhsUWK6HWeL8rJ_SRqkHYA@mail.gmail.com>


--rmbc813uVSMJILcK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 19, 2025 at 01:08:26PM +0100, Linus Walleij wrote:

> On Wed, Nov 12, 2025 at 3:33=E2=80=AFPM Conor Dooley <conor@kernel.org> w=
rote:

> > +static int mpfs_pinctrl_dt_node_to_map(struct pinctrl_dev *pctrl_dev, =
struct device_node *np,
> > +                                      struct pinctrl_map **maps, unsig=
ned int *num_maps)
>=20
> I saw in the cover letter that you wanted this to use more generic helper=
s.
>=20
> If you see room for improvement of the generic code, do not hesitate.
> Doing a new driver is the only time when you actually have all these
> details in your head and can create good helpers.

Started looking at this today too, and I found one of my sources of
confusion - the recently added helper which I think is confusingly
named. pinconf_generic_dt_node_to_map_pinmux() works differently to
pinconf_generic_dt_node_to_map(), because it only works if you have
the following setup:

label: group {
	pinmux =3D <asjhdasjhlajskd>;
	config-item1;
};

It does not work if you have:

label: cfg {
	group1 {
		pinmux =3D <dsjhlfka>;
		config-item2;
	};
	group2 {
		pinmux =3D <lsdjhaf>;
		config-item1;
	};
};

Specifically, the label must point to a group.
pinconf_generic_dt_node_to_map() does not work like this, it accepts both!
I think the pinconf_generic_dt_node_to_map_pinmux() function should
actually be called pinconf_generic_dt_subnode_to_map_pinmux(), because
it operates at the same level as pinconf_generic_dt_subnode_to_map().

Probably there should be a "real" pinconf_generic_dt_node_to_map() that
accepts both setups, since AFAICT it is pretty normal to have different
pins in a group that get different pinconf settings. Obviously

label: cfg {
	group1 {
		pinmux =3D <dsjhlfka>;
		config-item2;
	};
	group2 {
		pinmux =3D <lsdjhaf>;
		config-item1;
	};
};

peripheral {
	pinctrl-0 =3D <&label>;
}

isn't the only way to do things, and the amlogic user of the current
setup could just go and do

cfg {
	label1: group1 {
		pinmux =3D <dsjhlfka>;
		config-item2;
	};
	label2: group2 {
		pinmux =3D <lsdjhaf>;
		config-item1;
	};
};

peripheral {
	pinctrl-0 =3D <&label1>, <&label2>;
}

if it never needs more than one set of configs so this isn't a bug in
the amlogic stuff, just something I found misleading while trying to
make my own helper.

Even then though, I'm not really sure that this function does what I
would have expected it to do, because it won't work as a replacement for
the custom dt_node_to_map in the spacemit k1 driver, for example, even
ignoring the requirement about how the labels are done in the dt. That's
because it doesn't actually do anything with the pinmux property, despite
that being in the name. It never actually interacts with the pinmux property
at all AFAICT! It seems to depend on aml_pctl_parse_functions() being called
during probe which creates the groups and functions.
There's a weird warning about expecting a function parent node that seems
very amlogic specific too.

In my eyes, there should be some generic dt_node_to_map helpers that
do it all for you on the "configuration entirely described in dt"
platforms because that's what stuff like spacemit k1 driver that do
this in their dt_node_to_map implementations.

I'm not gonna get in over my head, and just make a helper for doing the
pins + function thing that I need for my driver, but would you be open
to an equivalent for the pinmux scenario? I'm thinking of something
that'd work for both the amlogic platform and for the spacemit k1.

Cheers,
Conor.

--rmbc813uVSMJILcK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSSukAAKCRB4tDGHoIJi
0v7tAQCE+f8Vu6sOG5cOAzVKQr8MbErGz6Y2M6fG3MXHAQl10AD/Ya51G8APuv5f
kKCgNoA0MYNJkYeUaYwlwvSo11z7GQc=
=Ax6Z
-----END PGP SIGNATURE-----

--rmbc813uVSMJILcK--

