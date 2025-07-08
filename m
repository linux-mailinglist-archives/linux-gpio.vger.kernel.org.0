Return-Path: <linux-gpio+bounces-22937-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE80AFCBC9
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 15:23:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 701B57B1898
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 13:21:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC51C2DCBF7;
	Tue,  8 Jul 2025 13:23:03 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6D532DC32E;
	Tue,  8 Jul 2025 13:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751980983; cv=none; b=sHfhNBSApGfsXhUByUDFKXZ9PiJYdz7FmB9C2+WjBwzQQD+UrfYWLzalaNI04aq4lgnDbq8c4AfBOMNFWbENfQDNDiC6MVhGXqJhSyKbkHTj+74FlGwtPQIL0uthvJ3ICv95AJ/CYZy2hSuM58xgZNPl4rzB+eJZSUslkHsEHhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751980983; c=relaxed/simple;
	bh=FtLE0RISCQiIlj28mcdE/l6rPIAYAGJuDLAz4eL2YbA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VDjn9Mw0Vy0GMERFabgAPlU+zi7XBBhO8LYTXxma4IIPwrO7xb+IiP7ZASEDVbPD2gh15S7s3GZz5Fk+TptFFBwkVLTpX8juJRK/V4LqOYT1YA9qsZ9SkOZMp5LnkPVcI2J5WI3tqMnh1JnluSxzOjwicLJTfZa7zAlyyX3r86A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id F0E9C1F00051;
	Tue,  8 Jul 2025 13:22:54 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 9B221ACB315; Tue,  8 Jul 2025 13:22:53 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id EF06CACB30D;
	Tue,  8 Jul 2025 13:22:51 +0000 (UTC)
Date: Tue, 8 Jul 2025 15:22:49 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 4/4] arm64: dts: allwinner: a133-liontron-h-a133l: Add
 Ethernet support
Message-ID: <aG0bqasOYUwwgiQY@collins>
References: <20250707165155.581579-1-paulk@sys-base.io>
 <20250707165155.581579-5-paulk@sys-base.io>
 <20250708003348.58fe509f@minigeek.lan>
 <CAGb2v650h05aNvsQeQOjg63Ljcarxy2zqXnvNnjJ5+5ooGOELQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AKuaO1c0htNCAj0c"
Content-Disposition: inline
In-Reply-To: <CAGb2v650h05aNvsQeQOjg63Ljcarxy2zqXnvNnjJ5+5ooGOELQ@mail.gmail.com>


--AKuaO1c0htNCAj0c
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Le Tue 08 Jul 25, 16:18, Chen-Yu Tsai a =C3=A9crit :
> On Tue, Jul 8, 2025 at 7:36=E2=80=AFAM Andre Przywara <andre.przywara@arm=
=2Ecom> wrote:
> >
> > On Mon,  7 Jul 2025 18:51:55 +0200
> > Paul Kocialkowski <paulk@sys-base.io> wrote:
> >
> > Hi Paul,
> >
> > > The Liontron H-A133L board features an Ethernet controller with a
> > > JLSemi JL1101 PHY. Its reset pin is tied to the PH12 GPIO.
> > >
> > > Note that the reset pin must be handled as a bus-wide reset GPIO in
> > > order to let the MDIO core properly reset it before trying to read
> > > its identification registers. There's no other device on the MDIO bus.
> >
> > putting the PHY reset GPIO into the MDIO node is a clever solution, I
> > was struggling with putting it either in the MAC or PHY node, though
> > conceptually it would still belong in the latter, I think. But this
> > might be a more generic problem: for most other devices we activate
> > reset and clock gates *before* trying to access them, though this might
> > be historically different for Ethernet PHYs.
>=20
> The phylib core has code to deal with reset GPIOs listed under the PHY no=
de.
> It might be worth checking why that doesn't work.

While this code does exist, it's too early to be called when the mdio bus is
trying to probe the phy. I was also surprised the existing reset gpio suppo=
rt
in the phylib core didn't take effect (that's how I tried to implement it f=
irst)
only to find that the code was never called. It's only called once the phy =
was
probed and registered.

Cheers,

Paul

> OOTH, there's no code to deal with regulator supplies for PHYs.
>=20
> ChenYu
>=20
> > > The datasheet of the PHY mentions that the reset signal must be held
> > > for 1 ms to take effect. Make it 2 ms (and the same for post-delay) to
> > > be on the safe side without wasting too much time during boot.
> > >
> > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> >
> > Despite the above, this looks fine, and works for me:
> >
> > Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> > Tested-by: Andre Przywara <andre.przywara@arm.com>
> >
> > Cheers,
> > Andre
> >
> > > ---
> > >  .../sun50i-a133-liontron-h-a133l.dts          | 19 +++++++++++++++++=
++
> > >  1 file changed, 19 insertions(+)
> > >
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a13=
3l.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> > > index fe77178d3e33..90a50910f07b 100644
> > > --- a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> > > @@ -65,6 +65,25 @@ &ehci1 {
> > >       status =3D "okay";
> > >  };
> > >
> > > +&emac0 {
> > > +     pinctrl-names =3D "default";
> > > +     pinctrl-0 =3D <&rmii0_pins>;
> > > +     phy-handle =3D <&rmii_phy>;
> > > +     phy-mode =3D "rmii";
> > > +     status =3D "okay";
> > > +};
> > > +
> > > +&mdio0 {
> > > +     reset-gpios =3D <&pio 7 12 GPIO_ACTIVE_LOW>; /* PH12 */
> > > +     reset-delay-us =3D <2000>;
> > > +     reset-post-delay-us =3D <2000>;
> > > +
> > > +     rmii_phy: ethernet-phy@1 {
> > > +             compatible =3D "ethernet-phy-ieee802.3-c22";
> > > +             reg =3D <1>;
> > > +     };
> > > +};
> > > +
> > >  &mmc0 {
> > >       vmmc-supply =3D <&reg_dcdc1>;
> > >       cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
> >
> >

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--AKuaO1c0htNCAj0c
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhtG6kACgkQhP3B6o/u
lQxyDQ//cjeBa5VAClnAeDGIbRC52Ala2SFJm9pL1Kkm6GPyKpaAbDPz4DkKtZqD
Rwt9Ti1nxSCtuhIg7pkHcAw0TSroMTZNFtQu4Y15216kq9bGylwSHVCMnWBCmpbz
SSps3qJzNVrIHJuPizt+Mc07Cl9ub18D1AoEgnIVmPRQwLI9UC9YPA7YpG2uO1fc
L+SQHu60k24t+5wDAWCs6YsTJhmkrDynisOiWD69By1idydb5pWdQJmWnUIHN6ep
y+B2E748yLeNcBVjnvW9oyIPUXk0sl/KuhnI5DVsHzvL2qIZc+qirsMMatC3soZC
rCRW3ggnKt0Ug7trxK0fR8/oEexl3q19uQcsJNH0U4a5qqDNvGWw1sYxBObQGjX9
Byyupz8Ob3q3ylq+KNTxXqXVmnGLqRf+RTaCuCs8ludvdc4aPsZvvLbZpbbYRBpM
GNaEFZafjW7eza5M/fvKvirSi8V9MrZbLfYS9ouN8Ge5qIYWl+1uZOjt1zSSj0SQ
LSmdHfKAVJ/0cNXp4x25AMb7GG0P/B/FdunNgLz+hPazZMKgAiyEcxDV5NeIQ48x
WVRb21+ijbWDrDM6p2VN+7+FNbnovBrbCxErK3QyrE1v9Om7pOHIFXpsUEX1RZOg
DR/j1w2Z8WoWAK45XWj6Ex9finr12EICE6OJUjw2zoI+smniwbs=
=O4+y
-----END PGP SIGNATURE-----

--AKuaO1c0htNCAj0c--

