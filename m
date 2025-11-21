Return-Path: <linux-gpio+bounces-28970-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C837C7B512
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 19:25:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1DAFC35D134
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Nov 2025 18:25:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCFF126E71E;
	Fri, 21 Nov 2025 18:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qMeglU2Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A7936D516;
	Fri, 21 Nov 2025 18:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763749534; cv=none; b=bhDoILuX+ikfn8NRvX23UueFiybLxp0vVjUGnl45iH325kOOgLZYovCBwPDmZP0Q4PHXX/XTJMUPkUi4HNA+QSquKO6DXHN/o+V1mEw4Eeb2dXhQcUDiKvW3ZKpZ0mexOquYbhKv2jCEyQVs+oCLaZx3raAsR2BaGV6c+Kqzr5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763749534; c=relaxed/simple;
	bh=4Tz+I4eYoSnmr24RD9BfJdu+nSlJVfrXpk3I72LkrCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bYi5+0cY8Kc6Z79U2/2Rt1M3+rZmAHXvV68HssQqgzzmZ1EVwJ78KJC3bJ+I18pwdCfP2CyGVfVOV+t3h2N4GeVVHR124/esncuJzCFo0m7QcQNFgh3FbH6qRgtFDnMOqbybI3oDmu3AZgQ7Lw/E1Ceb5Wd1WlxwAA2Ckmy4b5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qMeglU2Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8500FC4CEF1;
	Fri, 21 Nov 2025 18:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763749533;
	bh=4Tz+I4eYoSnmr24RD9BfJdu+nSlJVfrXpk3I72LkrCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qMeglU2Q4mI1NDu27ammerTxEkNwr0vG6ssFUpkGrOfWg/Uroc/8vUsCkvHTVB4og
	 qhiwcMHqDSQdcrboQbRR+nv4Z/WXtqzAuXiIesMmUYCy48igtRDCSGHSwuEaJG+Rpi
	 PGADfShS52unnTY3OB0bATyKxGmiO60c7MjdXKo8l+sM15F+OsFQWHiN7WQNzfqXqF
	 YRCiaF0gOOYDBNbNkGQJqSldP4y4VHfCWlgDO6Al0nauw5n/4p41ta2CQNKP1Eq16r
	 VjRK229b470jW5Ar4dL9gc5aEMh6m8ev6wMjTJAAwqPjfMn40E7XaYse9lwkx/uHX7
	 ZqKAui/ozGjGA==
Date: Fri, 21 Nov 2025 18:25:28 +0000
From: Conor Dooley <conor@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Antoniu Miclaus <antoniu.miclaus@analog.com>,
	Peter Rosin <peda@axentia.se>, Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-gpio@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>, devicetree@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
	David Lechner <dlechner@baylibre.com>
Subject: Re: [PATCH 1/2] dt-bindings: mux: gpio-mux: add support for ADG1712
Message-ID: <20251121-privatize-decibel-72a37d50d269@spud>
References: <20251121115750.20119-1-antoniu.miclaus@analog.com>
 <20251121115750.20119-2-antoniu.miclaus@analog.com>
 <176373269741.263545.10849918874919174841.robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nIJQUNuZx7UupWmJ"
Content-Disposition: inline
In-Reply-To: <176373269741.263545.10849918874919174841.robh@kernel.org>


--nIJQUNuZx7UupWmJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 07:44:57AM -0600, Rob Herring (Arm) wrote:
>=20
> On Fri, 21 Nov 2025 11:57:31 +0000, Antoniu Miclaus wrote:
> > Add support for the Analog Devices ADG1712 quad SPST switch to the
> > existing GPIO multiplexer bindings. The ADG1712 contains four
> > independent single-pole/single-throw (SPST) switches, each controlled
> > by a dedicated GPIO pin.
> >=20
> > Unlike traditional multiplexers that use GPIOs as binary-encoded
> > selectors, the ADG1712 treats each GPIO as a direct switch controller.
> > The mux state represents the combination of all four switches, with
> > values from 0-15 corresponding to different switch combinations.
> >=20
> > For example, state 5 (binary 0101) represents:
> > - SW1: ON (GPIO0 =3D 1)
> > - SW2: OFF (GPIO1 =3D 0)
> > - SW3: ON (GPIO2 =3D 1)
> > - SW4: OFF (GPIO3 =3D 0)
> >=20
> > Signed-off-by: Antoniu Miclaus <antoniu.miclaus@analog.com>
> > ---
> >  .../devicetree/bindings/mux/gpio-mux.yaml     | 24 ++++++++++++++++++-
> >  1 file changed, 23 insertions(+), 1 deletion(-)
> >=20
>=20
> My bot found errors running 'make dt_binding_check' on your patch:
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/m=
ux/gpio-mux.example.dtb: switch-controller (adi,adg1712): $nodename:0: 'swi=
tch-controller' does not match '^mux-controller(@.*|-([0-9]|[1-9][0-9]+))?$'
> 	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml

There's a patch relaxing this restriction here:
https://lore.kernel.org/all/cb7c28ccf3a1b136e793b48720f816de7d5f75b2.176373=
7324.git.tommaso.merciai.xr@bp.renesas.com/

>=20
> doc reference errors (make refcheckdocs):
>=20
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/202511=
21115750.20119-2-antoniu.miclaus@analog.com
>=20
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
>=20
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>=20
> pip3 install dtschema --upgrade
>=20
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.
>=20

--nIJQUNuZx7UupWmJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaSCumAAKCRB4tDGHoIJi
0hHUAP9yXQOncgawwu1dy8HRWrkjDNt+nbdUNblTcKOV5u31AQEAvDhhhMdgj2aG
C6EJH5EKseWikteR/A1z9RqAlc62+QI=
=wum8
-----END PGP SIGNATURE-----

--nIJQUNuZx7UupWmJ--

