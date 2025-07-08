Return-Path: <linux-gpio+bounces-22935-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D29D0AFCBBB
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 15:20:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18D153A3A5B
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 13:19:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 476AA2DCF5E;
	Tue,  8 Jul 2025 13:19:56 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6E32DCBFD;
	Tue,  8 Jul 2025 13:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751980796; cv=none; b=jrNuhDBPibsRAyAzTWHggqdxpT0k/DTPDKouSlL95lOcWqDOHjuIKNrwMOWbBn/HxSyyAJCwBmPTsiltLOzFnrJoP+JSs7Byk0mG9+kxu6mPLaxw0KbbJWHKT3WjMCdge4HvNqyJp7gg8ChGVdHRrzanm0CR6zQXX+1KrcaK5RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751980796; c=relaxed/simple;
	bh=0nlY8CDQezFWuJjfY0m2t/U5Zl4jJT2CDVBEUbuyS80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iDf2n5lWtsxkQxFspKiEMe/TSqNmZAAcwYU9n1OCVKNKaiyAYcEaNviebbR1V+v9Eq+TkaxtgEzaFjYMEIvH2HKYxaFTNuw2ufLZ5xK6FTqgpcY2snlhq1Ps/c3aZoaAWmkfo2/3g/+BnkqCnMkbgyuSLarRbUKMdSYFbwfxNu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id B92D31F00053;
	Tue,  8 Jul 2025 13:19:33 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 834F3ACB310; Tue,  8 Jul 2025 13:19:32 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id E2662ACB19F;
	Tue,  8 Jul 2025 13:19:29 +0000 (UTC)
Date: Tue, 8 Jul 2025 15:19:27 +0200
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
Message-ID: <aG0a32kcpVC6z--Y@collins>
References: <20250707165155.581579-1-paulk@sys-base.io>
 <20250707165155.581579-5-paulk@sys-base.io>
 <20250708003348.58fe509f@minigeek.lan>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/WDuu8c/WC4JUJfs"
Content-Disposition: inline
In-Reply-To: <20250708003348.58fe509f@minigeek.lan>


--/WDuu8c/WC4JUJfs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andre,

Le Tue 08 Jul 25, 00:34, Andre Przywara a =C3=A9crit :
> On Mon,  7 Jul 2025 18:51:55 +0200
> Paul Kocialkowski <paulk@sys-base.io> wrote:
>=20
> Hi Paul,
>=20
> > The Liontron H-A133L board features an Ethernet controller with a
> > JLSemi JL1101 PHY. Its reset pin is tied to the PH12 GPIO.
> >=20
> > Note that the reset pin must be handled as a bus-wide reset GPIO in
> > order to let the MDIO core properly reset it before trying to read
> > its identification registers. There's no other device on the MDIO bus.
>=20
> putting the PHY reset GPIO into the MDIO node is a clever solution, I
> was struggling with putting it either in the MAC or PHY node, though
> conceptually it would still belong in the latter, I think. But this
> might be a more generic problem: for most other devices we activate
> reset and clock gates *before* trying to access them, though this might
> be historically different for Ethernet PHYs.

Yes this feels a bit unusual. Unfortunately the mdio bus performs probing on
the PHYs before registering them as devices, which gives us no hope of
running driver-specific code to power the PHY up.

So the only device we can hold on to is the mdio bus. I think there was an
initial design assumption that 1 mdio bus =3D=3D 1 PHY device

> > The datasheet of the PHY mentions that the reset signal must be held
> > for 1 ms to take effect. Make it 2 ms (and the same for post-delay) to
> > be on the safe side without wasting too much time during boot.
> >=20
> > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
>=20
> Despite the above, this looks fine, and works for me:
>=20
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Tested-by: Andre Przywara <andre.przywara@arm.com>

Thanks for the review and test!

Paul

> Cheers,
> Andre
>=20
> > ---
> >  .../sun50i-a133-liontron-h-a133l.dts          | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l=
=2Edts b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> > index fe77178d3e33..90a50910f07b 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
> > @@ -65,6 +65,25 @@ &ehci1 {
> >  	status =3D "okay";
> >  };
> > =20
> > +&emac0 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&rmii0_pins>;
> > +	phy-handle =3D <&rmii_phy>;
> > +	phy-mode =3D "rmii";
> > +	status =3D "okay";
> > +};
> > +
> > +&mdio0 {
> > +	reset-gpios =3D <&pio 7 12 GPIO_ACTIVE_LOW>; /* PH12 */
> > +	reset-delay-us =3D <2000>;
> > +	reset-post-delay-us =3D <2000>;
> > +
> > +	rmii_phy: ethernet-phy@1 {
> > +		compatible =3D "ethernet-phy-ieee802.3-c22";
> > +		reg =3D <1>;
> > +	};
> > +};
> > +
> >  &mmc0 {
> >  	vmmc-supply =3D <&reg_dcdc1>;
> >  	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--/WDuu8c/WC4JUJfs
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhtGt8ACgkQhP3B6o/u
lQxZHg/9EwszmN3aDU+OiXu8tTOc4l2TJWU+RqEc7GO8jrinRJzX901buoDkDHus
whw1p6WJkvJLBdI8TZwJTeLcyYoM4z6KC9v3DsdGR2NYCNcYWnCeziO1r6MbKI92
6rfFyNaXne1bALzkXaBO5BaqWHE5W+huTWUCcwJyb4NcGOMHF6X9hKh1bzXJ0ME0
iCjaOhZaLQ9375xID4ag3bkzMj9AYQDO72J3xpLb6hujTnG3KoY/FVu4QgDLFMdz
CmmwvMrxCp5B0FOBD9tkVs7rrKSvMUFnsu9qxhlbpC7IAs5cxzPXeptSn6wzClx2
YHEdQ65lDRaYHyvZA0lL2r0QgYXFM/Gsh3naKH7OSAt06Q6QxOTwHsf5bp72yhKi
VugpNBZe2/5MZ7BRbaDOuvOTbgmuS64BkCHa8hzgqNbX0OkQi1YgPrpX5IXbcW/x
wo7KvUJgENgEokT53qBLlqgA9I6ntONo7J/eomRqDJbG4ub0VzxGf9MYf0L/YUSw
TndjoRB0+CJa4o/LUqKM8JfRLy/SNeYyD96n/5LID2WjiVVszRcPOkazZwQgQ27g
ABzbmBYZ3X5C6coK5/2zrdj0h0M/Av5XgMP2kbfLWei8OK+DS7lA9rAnIbr18ypI
1Y0dDcLET7EFMS9iJaGQyTJpbkj/k5OD+Timq/ShLjadaYWaYpw=
=At94
-----END PGP SIGNATURE-----

--/WDuu8c/WC4JUJfs--

