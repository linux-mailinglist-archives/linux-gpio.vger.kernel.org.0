Return-Path: <linux-gpio+bounces-26731-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 515FCBB13A1
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Oct 2025 18:15:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0CD701C7C6D
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Oct 2025 16:15:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6D11287519;
	Wed,  1 Oct 2025 16:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SR82psbl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6441F27703D;
	Wed,  1 Oct 2025 16:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759335311; cv=none; b=B8wdCbS2yhfnrdavCrAd93lPJ1WPaeNcLgp8olqAeHCfmhr8/a1JIBRJ1ctPb9f/AGEZqeLy+5L0D0ORB2BcPmlLsc8L2YSHxZAuja09Lz5N98j9EunAd3jbwF1VM2sFPnmgIv1etUsUmh6BLVNQtnnP3oSBxBZ2l2/uynLK898=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759335311; c=relaxed/simple;
	bh=aZalLaE3pNBBVcnztrNI7/t8Lx2PoXLwzoQuDrkVXBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MlEotJxf7A3Avl1NILE57YO2rADBjy3vqGDihLGR3G/6PcoYO/Moulpqh3TQtPoYDGBWQGsxpQl9eDjpaZcmxplCwK7a24/sJML65Gpa3r4/ir0hRkQlnPc2d0xr797um8t5u1mo1LpBUlcZwdnEXRW9PHkJmtsI08AreQLNHqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SR82psbl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71DEFC4CEF5;
	Wed,  1 Oct 2025 16:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759335310;
	bh=aZalLaE3pNBBVcnztrNI7/t8Lx2PoXLwzoQuDrkVXBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SR82psblZghYJnKH9dYti8Pt287Wmrk5yFFcGqQhITmBuiBujqt8a1+E2BBOmc1D6
	 siOrzJd+qNS/0L3jOqVuoAy7rjkXvI34Gl4r3GXW4wh76PsuJz4t4rWi8NQpW2EcS2
	 Nw2Ix4hGaJYkEr/KeUbEr1VzQN+v9xE9YctRGMshRFRD0yNq5HnKtSA645gFE5pEnz
	 P9QXYC1Qvs7gnHswhuIoAEqstBz4P6z9oXU/pzLn6hgc13Kp1clcYlQCo6MW5zxxFF
	 OdCimEvENUb3RktIAvvZWd/WHYvWGp+olOmzzItVXk1ImOK0XXtXlDEony0dtU6SBS
	 e4E+jalp3Mflg==
Date: Wed, 1 Oct 2025 17:15:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [RFC 0/5] microchip mpfs/pic64gx pinctrl questions
Message-ID: <20251001-unfreeze-ludicrous-9d744548bf65@spud>
References: <20250926-manpower-glacial-e9756c82b427@spud>
 <CACRpkdYXh2MCs=vAif7BpxfYVRuDTkYYNwpV2t=J_ZRW+N4Vyg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rtp5gPCiSpcL6Uyu"
Content-Disposition: inline
In-Reply-To: <CACRpkdYXh2MCs=vAif7BpxfYVRuDTkYYNwpV2t=J_ZRW+N4Vyg@mail.gmail.com>


--rtp5gPCiSpcL6Uyu
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
> arch/arm/boot/dts/gemini/gemini.dtsi
>=20
> This is another SoC that muxes pins in groups, not in single per-pin
> settings.

This looks like something that the "gpio2" stuff could definitely go to,
since it covers multiple functions trying to access the same pin. Do you
have an "approved" example for a more demultiplexer case, where the
contention is about which of multiple possible pins (or pin analogues)
an IO from a particular block must be routed to?

> Notice that the driver in this case enumerates and registers all 323
> pins on the package! This is done because some of the groups
> are mutually exclusive and this way the pin control framework
> will do its job to detect collisions between pin groups and disallow
> this, and that is what pin control is supposed to be doing.

In that case, the mutual exclusion would be that a function can only be
routed to one "pin", but there's no concern about multiple functions
being routed to any given "pin".

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

--rtp5gPCiSpcL6Uyu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaN1TiwAKCRB4tDGHoIJi
0rsuAP9Awy/VSOHk5xSFlfRSaEp18oj5GA6Djy6JGFkuNArVsAEAwa5jihPfC/Yu
0qmRMUxN0jIs68SwD1bY6bIp76HZHg0=
=Eoh8
-----END PGP SIGNATURE-----

--rtp5gPCiSpcL6Uyu--

