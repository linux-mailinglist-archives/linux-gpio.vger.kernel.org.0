Return-Path: <linux-gpio+bounces-24512-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 614F0B2AF5C
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 19:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 420491BA3E8B
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Aug 2025 17:26:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8171F34573F;
	Mon, 18 Aug 2025 17:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GdcHkq8U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FF5343D82;
	Mon, 18 Aug 2025 17:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755537980; cv=none; b=Vdoh7Ixmhh1AnV5I9TO30irHHzvVXaV+JLc3tuV2J+apREPHg0KD1zZlh+ePU5JFptatS0FFA6YfszcsMtMib6yWrvKFZMNtowEqA4Y216w8g7rnVywBTu5wJNDLWs5FVZdnYQIz4bPcnzM7sshvBK1PkQDzaNhWJwodV/NWJSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755537980; c=relaxed/simple;
	bh=DZrc/xQQUWAtQWUj/brEuNkoWNjVTqKwijAmut0IFhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jwlIi00OsRLS31VWRJ2Qr5a9aPhIZqanFXeqimNAyK6NLgHuIHxzbr5E/ciMP6jOboJHgrRlJxEWAa1mn45aO6N9Ccf4z037AKNMof+IuQaHRMISYznvw84lx5+mDAY0hkN7MOHKRJPU0X1xoO+1Nx+v1g0cHfBDNhqaOE2r+Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GdcHkq8U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81BF1C4CEEB;
	Mon, 18 Aug 2025 17:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755537977;
	bh=DZrc/xQQUWAtQWUj/brEuNkoWNjVTqKwijAmut0IFhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GdcHkq8U2vePf1ul4rUZw+E1iugmay9QuWid9xt5WPfUUR+stb773TL5sstXPlObC
	 aOWFscgzDsgE/x5vJRAdiLmtyX2Se2whC9d8IpXeDWF3mWzk2ZGGgrWAj4AKS9wE9A
	 l50YL3pRSjGlT+UT/pM/pagzyQHw22HSccJiFtQYt3wf+pFYF+J5Z6GjUJKlH3TSpG
	 lW6I8xTTilElClsWnFIjUEdpI0Nz/IAAbrPNpSHSPudapN6iAFyC6tDODXf603C6O/
	 5TJ8bLA68mmF+ZFQWM/gZPx79lzRrnYXpddCcJD6LgP8mHvDpDvZ2o9gfb2/gNy5yS
	 pHlC7dFPRfjHA==
Date: Mon, 18 Aug 2025 18:26:13 +0100
From: Conor Dooley <conor@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/5] soc: fsl: qe: Add support of IRQ in QE GPIO
Message-ID: <20250818-angelfish-jasmine-f48d257a4949@spud>
References: <cover.1755506608.git.christophe.leroy@csgroup.eu>
 <cddc5e900b84826614a63b8b29a048c09dd20853.1755506608.git.christophe.leroy@csgroup.eu>
 <20250818-tyke-pungent-20d9ffd47ecc@spud>
 <732b5fb6-ec38-43d9-b544-b27802a844ab@csgroup.eu>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="srp7PXp30YhJAiJF"
Content-Disposition: inline
In-Reply-To: <732b5fb6-ec38-43d9-b544-b27802a844ab@csgroup.eu>


--srp7PXp30YhJAiJF
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 18, 2025 at 07:08:47PM +0200, Christophe Leroy wrote:
>=20
>=20
> Le 18/08/2025 =E0 19:03, Conor Dooley a =E9crit=A0:
> > On Mon, Aug 18, 2025 at 10:45:57AM +0200, Christophe Leroy wrote:
> > > In the QE, a few GPIOs are IRQ capable. Similarly to
> > > commit 726bd223105c ("powerpc/8xx: Adding support of IRQ in MPC8xx
> > > GPIO"), add IRQ support to QE GPIO.
> > >=20
> > > Add property 'fsl,qe-gpio-irq-mask' similar to
> > > 'fsl,cpm1-gpio-irq-mask' that define which of the GPIOs have IRQs.
> > >=20
> > > Here is an exemple for port B of mpc8323 which has IRQs for
> > > GPIOs PB7, PB9, PB25 and PB27.
> > >=20
> > > 	qe_pio_b: gpio-controller@1418 {
> > > 		#gpio-cells =3D <2>;
> > > 		compatible =3D "fsl,mpc8323-qe-pario-bank";
> > > 		reg =3D <0x1418 0x18>;
> > > 		interrupts =3D <4 5 6 7>;
> > > 		fsl,qe-gpio-irq-mask =3D <0x01400050>;
> > > 		interrupt-parent =3D <&qepic>;
> > > 		gpio-controller;
> > > 	};
> > >=20
> > > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > > ---
> > > v2: Document fsl,qe-gpio-irq-mask
> > > ---
> > >   .../bindings/soc/fsl/cpm_qe/qe/par_io.txt     | 19 ++++++++++++++++=
++
> > >   drivers/soc/fsl/qe/gpio.c                     | 20 ++++++++++++++++=
+++
> > >   2 files changed, 39 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_=
io.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
> > > index 09b1b05fa677..9cd6e5ac2a7b 100644
> > > --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
> > > +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/par_io.txt
> > > @@ -32,6 +32,15 @@ Required properties:
> > >     "fsl,mpc8323-qe-pario-bank".
> > >   - reg : offset to the register set and its length.
> > >   - gpio-controller : node to identify gpio controllers.
> > > +Optional properties:
> > > +- fsl,qe-gpio-irq-mask : For banks having interrupt capability this =
item tells
> > > +  which ports have an associated interrupt (ports are listed in the =
same order
> > > +  QE ports registers)
> > > +- interrupts : This property provides the list of interrupt for each=
 GPIO having
> > > +  one as described by the fsl,cpm1-gpio-irq-mask property. There sho=
uld be as
> > > +  many interrupts as number of ones in the mask property. The first =
interrupt in
> > > +  the list corresponds to the most significant bit of the mask.
> > > +- interrupt-parent : Parent for the above interrupt property.
> > >   Example:
> > >   	qe_pio_a: gpio-controller@1400 {
> > > @@ -42,6 +51,16 @@ Example:
> > >   		gpio-controller;
> > >   	  };
> > > +	qe_pio_b: gpio-controller@1418 {
> > > +		#gpio-cells =3D <2>;
> > > +		compatible =3D "fsl,mpc8323-qe-pario-bank";
> > > +		reg =3D <0x1418 0x18>;
> > > +		interrupts =3D <4 5 6 7>;
> > > +		fsl,qe-gpio-irq-mask =3D <0x01400050>;
> > > +		interrupt-parent =3D <&qepic>;
> > > +		gpio-controller;
> > > +	  };
> > > +
> > >   	qe_pio_e: gpio-controller@1460 {
> > >   		#gpio-cells =3D <2>;
> > >   		compatible =3D "fsl,mpc8360-qe-pario-bank",
> >=20
> > Why is there a binding change hiding in here alongside a driver one?
>=20
> I did the same way as commit 726bd223105c ("powerpc/8xx: Adding support of
> IRQ in MPC8xx GPIO")
>=20
> Should it be done differently ?

Yes, binding changes should not be in with driver changes. Surprised
that checkpatch didn't complain. That commit you mention seems to have
been like 10 years ago and without dt-binding maintainer review so not
the best thing to use as a basis.
Additionally, Rob may require you to covert to yaml to add new
properties, I forget if that is a requirement or not.

--srp7PXp30YhJAiJF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaKNiNQAKCRB4tDGHoIJi
0qKaAP9vS6SisYRcuo6AMAuGe0ztZz+fC4G1/xIXwq8AALY87gD+LY0HpnxB3XP5
3lW31jMJdflZV5qlHjVzpy2H1FJmRQU=
=zKiO
-----END PGP SIGNATURE-----

--srp7PXp30YhJAiJF--

