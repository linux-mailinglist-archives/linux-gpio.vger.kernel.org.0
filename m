Return-Path: <linux-gpio+bounces-26730-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BAF5BB132D
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Oct 2025 18:00:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38C3019470F1
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 16:01:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B9F280A52;
	Wed,  1 Oct 2025 16:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TQEOLb47"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B7E8C1F;
	Wed,  1 Oct 2025 16:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759334445; cv=none; b=ZGwVb2DdSxTX1bjS1YP1ESKVMdQD8sppHN+l2PE7LJX16Kv8NS/puivduIPT1o31FZwTjKqkW5NusuJSr5pXYP7bqy78CwksITWq9XljHBVMvybaOuhsO4LrCgWUv01mP4hLzKnGek9c65qpECYH2R6NIce9G4ogumrMUvMjspE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759334445; c=relaxed/simple;
	bh=Kud95JC/kjSqNGKVDEUj/bvmtU8GRAMh83YGQzqneJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q0OUPhp+lpD9jMYNx+b56OaQH6G/JW/fGdUbKoJNl5fesEGvq5mcyYqEDkbEc8HqOWZTsqIJr0EF5zTu2MM+VhDLYro1qkwIAZC/OzmVS7GaMg4zVHhA7bUIgurQdS79ilOqDGT9gy3zL34wdWuk3x3+Viz1OndePslJgKEtBSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TQEOLb47; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEBEDC4CEF1;
	Wed,  1 Oct 2025 16:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759334445;
	bh=Kud95JC/kjSqNGKVDEUj/bvmtU8GRAMh83YGQzqneJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TQEOLb47JDBAkewsxigiu5rhZVNxM2UcNNg3ZD4pNbO8guqcsvDgHWgQCv5YhqPsE
	 NUOOERaKMuVDCP+3kTB1q3uoGC/y4nujBPF4g+cWHhSlPCOr4iTjYnlyaojvUsoMmP
	 uUi6PVtSbHIaRwpZw50mtY0WYwrQHcyt9qrd4B2Ity3T8EfQ2lk13xnEaBGZAZOPvS
	 buIrs2xRqbKD33BkXXD+7ffy/gqSWbRjWw6ryEF/55us0q9mbEQQEP4zSujFtGKDlp
	 sNCeOwe/Hj4I2qg46Mn+94rump9n9I/4s61gsuYRkmJvOmce6vg50Nn7KV3FqZSPiZ
	 m/kn4aaUoKFQg==
Date: Wed, 1 Oct 2025 17:00:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC 0/5] microchip mpfs/pic64gx pinctrl questions
Message-ID: <20251001-arrive-tattle-2dafbd375da0@spud>
References: <20250926-manpower-glacial-e9756c82b427@spud>
 <CACRpkdYXh2MCs=vAif7BpxfYVRuDTkYYNwpV2t=J_ZRW+N4Vyg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zSArzN4a0ml7zZ+a"
Content-Disposition: inline
In-Reply-To: <CACRpkdYXh2MCs=vAif7BpxfYVRuDTkYYNwpV2t=J_ZRW+N4Vyg@mail.gmail.com>


--zSArzN4a0ml7zZ+a
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 01, 2025 at 01:29:01PM +0200, Linus Walleij wrote:
> Hi Conor,
>=20
> thanks for your patches!
>=20
> looking at the drivers it appears to be trying extensively to make use
> of the pinmux =3D <>; property to mux entire groups of pins.
>=20
> pinmux =3D <nn>; is supposed to mux *one* pin per group, not entire
> groups of pins from one property. See
> Documentation/devicetree/bindings/pinctrl/pinmux-node.yaml:
>=20
>   The pinmux property accepts an array of pinmux groups, each of them des=
cribing
>   a single pin multiplexing configuration.
>=20
>   pincontroller {
>     state_0_node_a {
>       pinmux =3D <PINMUX_GROUP>, <PINMUX_GROUP>, ...;
>     };
>   };
>=20
> So e.g. when you do this:
>=20
>        spi0_mssio: spi0-mssio-pins {
>          pinmux =3D <MPFS_PINFUNC(0, 0)>;
>        };
>=20
> We all know SPI uses more than one pin so this is clearly abusing
> the pinmux property.
>=20
> It is unfortunate that so many drivers now use this "mux one pin
> individually" concept that we cannot see the diversity of pin
> controllers.
>=20
> I cannot recommend using the pinmux property for this SoC.
>=20
> What you need to do is to define the actual pins and groups
> that you have.
>=20
> Look for example at
> Documentation/devicetree/bindings/pinctrl/cortina,gemini-pinctrl.txt
> drivers/pinctrl/pinctrl-gemini.c

Does this driver have a mistake in L2074, using ARRAY_SIZE(idegrps) for
dram?

> arch/arm/boot/dts/gemini/gemini.dtsi
>=20
> This is another SoC that muxes pins in groups, not in single per-pin
> settings.
>=20
> Notice that the driver in this case enumerates and registers all 323
> pins on the package! This is done because some of the groups
> are mutually exclusive and this way the pin control framework
> will do its job to detect collisions between pin groups and disallow
> this, and that is what pin control is supposed to be doing.
>=20
> I.e. do not orient your design around which registers and settings
> you have, and do not model your driver around that, instead
> model the driver around which actual pins exist on the physical
> component, how these are sorted into groups, how the groups
> are related to function (such as the group of SPI pins being
> related to the spi function) and define these pins, groups
> and functions in your driver.
>=20
> Yours,
> Linus Walleij

--zSArzN4a0ml7zZ+a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaN1QKQAKCRB4tDGHoIJi
0puOAQDMo5Bj9XIN7xULUdx0oMVaQc5LjDG9IFOX/1SCEL5IrQD8DmsobD2MGHc/
ptOwAaumG6nss81NMRYXb1jRXfLSTQg=
=IZ1k
-----END PGP SIGNATURE-----

--zSArzN4a0ml7zZ+a--

