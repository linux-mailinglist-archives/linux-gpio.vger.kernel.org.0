Return-Path: <linux-gpio+bounces-22936-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B4F0AFCBBC
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 15:21:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 41B8E16777A
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 13:21:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D1912DCF68;
	Tue,  8 Jul 2025 13:20:28 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89942DE70F;
	Tue,  8 Jul 2025 13:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751980828; cv=none; b=mvJfNn+twedCX+IMdKvl+OWKrcoRUWqrsOOO0cxq9WMayXTTXGXJH+l51xPzbZ+wIRNetWSoo+4bFOlE7OogM3tci3K5dJIJY5gjDGcyOlZpeVIqerNAI3MEmfnG8dowuxo2O8TKLAJOkI72RvxH2uyaWFlOOcXeYdOyzKsbQSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751980828; c=relaxed/simple;
	bh=UvgYD8yLXTCxrlf/fhUhHV8XKlTVg0GfV4EJFsMydgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rTeNjStllp//BVQR+WmX5nMY6qSxr8GzWeY2SHoy2s1JBhRVXGS85FbPHiZSYNSKwaaIBMVZHN2OzN1tNePHYXoo111dsTSmZn6DcNsIiYB2GrOMawajZd2q6adQXA9bD8UlN1lcx7xhgTgeRL2yY9KXY3nuPiX0Lfrc7xFg2MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 820731F00051;
	Tue,  8 Jul 2025 13:20:18 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 438CFACB30E; Tue,  8 Jul 2025 13:20:16 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id BDF2AACB19F;
	Tue,  8 Jul 2025 13:20:14 +0000 (UTC)
Date: Tue, 8 Jul 2025 15:20:12 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Andre Przywara <andre.przywara@arm.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 4/4] arm64: dts: allwinner: a133-liontron-h-a133l: Add
 Ethernet support
Message-ID: <aG0bDAEdFOGUejxn@collins>
References: <20250707165155.581579-1-paulk@sys-base.io>
 <20250707165155.581579-5-paulk@sys-base.io>
 <20250708003348.58fe509f@minigeek.lan>
 <20250708004731.37fa5129@minigeek.lan>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="UXoQYDNF1awfe9Lb"
Content-Disposition: inline
In-Reply-To: <20250708004731.37fa5129@minigeek.lan>


--UXoQYDNF1awfe9Lb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andre,

Le Tue 08 Jul 25, 00:48, Andre Przywara a =C3=A9crit :
> On Tue, 8 Jul 2025 00:34:25 +0100
> Andre Przywara <andre.przywara@arm.com> wrote:
>=20
> Hi Paul,
>=20
> forgot to mention: can you please add an ethernet0 alias, to make
> U-Boot generate a MAC address, from the SID?

Ah yes, sorry I forgot to do that. Will respin the series then.

Cheers,

Paul

> Cheers,
> Andre
>=20
> > On Mon,  7 Jul 2025 18:51:55 +0200
> > Paul Kocialkowski <paulk@sys-base.io> wrote:
> >=20
> > Hi Paul,
> >=20
> > > The Liontron H-A133L board features an Ethernet controller with a
> > > JLSemi JL1101 PHY. Its reset pin is tied to the PH12 GPIO.
> > >=20
> > > Note that the reset pin must be handled as a bus-wide reset GPIO in
> > > order to let the MDIO core properly reset it before trying to read
> > > its identification registers. There's no other device on the MDIO bus=
=2E =20
> >=20
> > putting the PHY reset GPIO into the MDIO node is a clever solution, I
> > was struggling with putting it either in the MAC or PHY node, though
> > conceptually it would still belong in the latter, I think. But this
> > might be a more generic problem: for most other devices we activate
> > reset and clock gates *before* trying to access them, though this might
> > be historically different for Ethernet PHYs.
> > =20
> > > The datasheet of the PHY mentions that the reset signal must be held
> > > for 1 ms to take effect. Make it 2 ms (and the same for post-delay) to
> > > be on the safe side without wasting too much time during boot.
> > >=20
> > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io> =20
> >=20
> > Despite the above, this looks fine, and works for me:
> >=20
> > Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> > Tested-by: Andre Przywara <andre.przywara@arm.com>
> >=20
> > Cheers,
> > Andre
> >=20
> > > ---
> > >  .../sun50i-a133-liontron-h-a133l.dts          | 19 +++++++++++++++++=
++
> > >  1 file changed, 19 insertions(+)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a13=
3l.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> > > index fe77178d3e33..90a50910f07b 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> > > @@ -65,6 +65,25 @@ &ehci1 {
> > >  	status =3D "okay";
> > >  };
> > > =20
> > > +&emac0 {
> > > +	pinctrl-names =3D "default";
> > > +	pinctrl-0 =3D <&rmii0_pins>;
> > > +	phy-handle =3D <&rmii_phy>;
> > > +	phy-mode =3D "rmii";
> > > +	status =3D "okay";
> > > +};
> > > +
> > > +&mdio0 {
> > > +	reset-gpios =3D <&pio 7 12 GPIO_ACTIVE_LOW>; /* PH12 */
> > > +	reset-delay-us =3D <2000>;
> > > +	reset-post-delay-us =3D <2000>;
> > > +
> > > +	rmii_phy: ethernet-phy@1 {
> > > +		compatible =3D "ethernet-phy-ieee802.3-c22";
> > > +		reg =3D <1>;
> > > +	};
> > > +};
> > > +
> > >  &mmc0 {
> > >  	vmmc-supply =3D <&reg_dcdc1>;
> > >  	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */ =20
> >=20
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--UXoQYDNF1awfe9Lb
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhtGwwACgkQhP3B6o/u
lQzLLQ/+Pw5wVE4z1rxkYQTcF2Mvg737ilRn/gazwASk3lyRmY36noqeBeDrizYW
L8cUAwDU1ggWc0LG+6CYyD0V2jglITFzuHz+5qP1HPZv5unxWPqfl1c0IB6amFVq
+CGP8zlXwMIELM6XhYAhr5QHZcKk/vj9qkJ4GFOJ8c9dKWaFhYBM3DqZeeCaGInG
dSfrAERWYrUxGLnmRf/cYkV4I+VxsJOKAyh9W4BUDrcL/ip6k6KziCJpSx0FvJcy
Dzt33+1trnN2gKW+WMeAFMs2/8ntNYZY8S8idW0SGQ9q6o6iWl/Ppox1h57W7TSi
qzcD7mvoQutYxgNJeoVMT0RSnKnDkzjoxvK7xxLV1zVla7g2q3BtCg0mu8SqY0Fd
VHdJ5CeemfeAQ1268f+P4TCStmNdphhJCiEx62ORkx2k3DbMXfwTkq+MdmNzWLEb
vs1wc3avXcRPZg3ufBNMwkdufbWBJZ2R3qIoyM2rDfWYBo078oFoWmAgvupTly2a
AVSI3stjZQjm4bed/HZR2ZZo5NgmH1AF16hoQo+WjjeS1y0QVjAlw/rxSel6juxx
yPlHa2/5I0oeF9x0gHX0U8AI5nB27/7D0DY+yvtWtbCZIADlQpuMzU17HeDoYZ+K
Ypy3saPmDsSCfvKCqkYveWZq1wRy79iVf4tTyiPQ+fi+Gkamhso=
=2DGs
-----END PGP SIGNATURE-----

--UXoQYDNF1awfe9Lb--

