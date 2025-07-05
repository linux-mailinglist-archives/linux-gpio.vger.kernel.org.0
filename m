Return-Path: <linux-gpio+bounces-22823-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 614F4AFA25B
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Jul 2025 01:53:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DBE9E17DFC8
	for <lists+linux-gpio@lfdr.de>; Sat,  5 Jul 2025 23:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AE8329A9ED;
	Sat,  5 Jul 2025 23:53:27 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB3481EF0B9;
	Sat,  5 Jul 2025 23:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751759607; cv=none; b=PavOqcO+2k5fKPylfFji0P4PIB6qk1ABDIwbjWLZXZWJT1dsh0/VLec0ur4gra85Fyhka4XTI0383Km6Myf4niDqHXqU9FzWaSwZbgXgvVwY/FrURrGCDu1127GFEJiFGA1xUvzGV5kupvGcBnavtSObTA+rlwolScm0dQ2wFKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751759607; c=relaxed/simple;
	bh=GK77VTKBPP0pvCDe6FqmoOSQUT9yAHx8XSkTuaNWHRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUrs/1qXtNTjjN7fpIMU+Cdd6p07J+kTwKMWlUk/9anHBJq5TA5PepD5mxarmA7UvZwrqM225p/GadPKg2HuflQLGF3YVTYly2Nyzi2tb9Ds8c4EB0cbDjMDNMLwl0v3B4ALK/Y/c9DRgIQ2qlrHgpRNvSVBqbyc3eZKCwThGZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 608C71F00056;
	Sat,  5 Jul 2025 23:53:03 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 42564ACA89A; Sat,  5 Jul 2025 23:53:01 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 3DB8CACA87B;
	Sat,  5 Jul 2025 23:52:57 +0000 (UTC)
Date: Sun, 6 Jul 2025 01:52:55 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Andre Przywara <andre.przywara@arm.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: Fix a100 emac pin function name
Message-ID: <aGm61_DLR_h9_dNw@collins>
References: <20250626080923.632789-1-paulk@sys-base.io>
 <20250626080923.632789-2-paulk@sys-base.io>
 <20250704233535.4b026641@minigeek.lan>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l3y7GJdqAmCxlN8u"
Content-Disposition: inline
In-Reply-To: <20250704233535.4b026641@minigeek.lan>


--l3y7GJdqAmCxlN8u
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andre,

Le Fri 04 Jul 25, 23:35, Andre Przywara a =C3=A9crit :
> On Thu, 26 Jun 2025 10:09:19 +0200
> Paul Kocialkowski <paulk@sys-base.io> wrote:
>=20
> Hi Paul,
>=20
> > The Allwinner A100/A133 only has a single emac instance, which is
> > referred to as "emac" everywhere. Fix the pin names to drop the
> > trailing "0" that has no reason to be.
>=20
> Sorry, but this is wrong. There *is* a second EMAC on the A133 die: it's
> indeed not mentioned in the manual, but you can probe its MMIO
> registers (@0x5030000), and there is a second syscon register
> (@0x03000034). It's mentioned in several BSP code places ([1]).

Okay so I looked a bit closer at this and everything hints that you are rig=
ht.
Not the first time Allwinner puts a bunch more blocks into the die and does=
n't
talk about it. For example the H3 has an ISP block but it is not mentionned
anywhere.

It seems that most packages of the sun50iw10 die don't expose the second EM=
AC
controller, but I found some brief info about T509 that indicates it has bo=
th
EMACs exposed at http://rpdzkj.com/copy_2_2198291_151408_4727683.html

As far as I know the packages are: A100, A133, A133P, A53, T509, R818 and
MR813/MR813B.

So yes it seems this was a bad decision, sorry about that.
I will send some revert patches for the whole thing then.

> It seem like no suitable pins are connected on the A133
> package, but that should not affect the A100 .dtsi (we use a similar
> approach for the H616 and A523).

Yes it makes sense to have the most common dtsi file concern the whole die.

Thanks,

Paul

> So I think we should keep the emac0 name.
>=20
> Cheers,
> Andre
>=20
>=20
> [1]
> https://github.com/qiaoweibiao/T507_Kernel/blob/main/arch/arm64/boot/dts/=
sunxi/sun50iw10p1.dtsi
>=20
>=20
> >=20
> > Fixes: 473436e7647d ("pinctrl: sunxi: add support for the Allwinner A10=
0 pin controller")
> > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > ---
> >  drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 32 ++++++++++-----------
> >  1 file changed, 16 insertions(+), 16 deletions(-)
> >=20
> > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c b/drivers/pinc=
trl/sunxi/pinctrl-sun50i-a100.c
> > index b97de80ae2f3..95b764ee1c0d 100644
> > --- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > @@ -546,33 +546,33 @@ static const struct sunxi_desc_pin a100_pins[] =
=3D {
> >  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> >  		  SUNXI_FUNCTION(0x1, "gpio_out"),
> >  		  SUNXI_FUNCTION(0x2, "i2c0"),		/* SCK */
> > -		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXD1 */
> > +		  SUNXI_FUNCTION(0x5, "emac"),		/* RXD1 */
> >  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 0)),
> >  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 1),
> >  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> >  		  SUNXI_FUNCTION(0x1, "gpio_out"),
> >  		  SUNXI_FUNCTION(0x2, "i2c0"),		/* SDA */
> > -		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXD0 */
> > +		  SUNXI_FUNCTION(0x5, "emac"),		/* RXD0 */
> >  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 1)),
> >  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 2),
> >  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> >  		  SUNXI_FUNCTION(0x1, "gpio_out"),
> >  		  SUNXI_FUNCTION(0x2, "i2c1"),		/* SCK */
> > -		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXCTL */
> > +		  SUNXI_FUNCTION(0x5, "emac"),		/* RXCTL */
> >  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 2)),
> >  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 3),
> >  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> >  		  SUNXI_FUNCTION(0x1, "gpio_out"),
> >  		  SUNXI_FUNCTION(0x2, "i2c1"),		/* SDA */
> >  		  SUNXI_FUNCTION(0x3, "cir0"),		/* OUT */
> > -		  SUNXI_FUNCTION(0x5, "emac0"),		/* CLKIN */
> > +		  SUNXI_FUNCTION(0x5, "emac"),		/* CLKIN */
> >  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 3)),
> >  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 4),
> >  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> >  		  SUNXI_FUNCTION(0x1, "gpio_out"),
> >  		  SUNXI_FUNCTION(0x2, "uart3"),		/* TX */
> >  		  SUNXI_FUNCTION(0x3, "spi1"),		/* CS */
> > -		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXD1 */
> > +		  SUNXI_FUNCTION(0x5, "emac"),		/* TXD1 */
> >  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 4)),
> >  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 5),
> >  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> > @@ -580,14 +580,14 @@ static const struct sunxi_desc_pin a100_pins[] =
=3D {
> >  		  SUNXI_FUNCTION(0x2, "uart3"),		/* RX */
> >  		  SUNXI_FUNCTION(0x3, "spi1"),		/* CLK */
> >  		  SUNXI_FUNCTION(0x4, "ledc"),
> > -		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXD0 */
> > +		  SUNXI_FUNCTION(0x5, "emac"),		/* TXD0 */
> >  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 5)),
> >  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 6),
> >  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> >  		  SUNXI_FUNCTION(0x1, "gpio_out"),
> >  		  SUNXI_FUNCTION(0x2, "uart3"),		/* RTS */
> >  		  SUNXI_FUNCTION(0x3, "spi1"),		/* MOSI */
> > -		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXCK */
> > +		  SUNXI_FUNCTION(0x5, "emac"),		/* TXCK */
> >  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 6)),
> >  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 7),
> >  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> > @@ -595,7 +595,7 @@ static const struct sunxi_desc_pin a100_pins[] =3D {
> >  		  SUNXI_FUNCTION(0x2, "uart3"),		/* CTS */
> >  		  SUNXI_FUNCTION(0x3, "spi1"),		/* MISO */
> >  		  SUNXI_FUNCTION(0x4, "spdif"),		/* OUT */
> > -		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXCTL */
> > +		  SUNXI_FUNCTION(0x5, "emac"),		/* TXCTL */
> >  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 7)),
> >  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
> >  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> > @@ -611,7 +611,7 @@ static const struct sunxi_desc_pin a100_pins[] =3D {
> >  		  SUNXI_FUNCTION(0x2, "dmic"),		/* DATA0 */
> >  		  SUNXI_FUNCTION(0x3, "spi2"),		/* CLK */
> >  		  SUNXI_FUNCTION(0x4, "i2s2"),		/* BCLK */
> > -		  SUNXI_FUNCTION(0x5, "emac0"),		/* MDC */
> > +		  SUNXI_FUNCTION(0x5, "emac"),		/* MDC */
> >  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 9)),
> >  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
> >  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> > @@ -619,7 +619,7 @@ static const struct sunxi_desc_pin a100_pins[] =3D {
> >  		  SUNXI_FUNCTION(0x2, "dmic"),		/* DATA1 */
> >  		  SUNXI_FUNCTION(0x3, "spi2"),		/* MOSI */
> >  		  SUNXI_FUNCTION(0x4, "i2s2"),		/* LRCK */
> > -		  SUNXI_FUNCTION(0x5, "emac0"),		/* MDIO */
> > +		  SUNXI_FUNCTION(0x5, "emac"),		/* MDIO */
> >  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 10)),
> >  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 11),
> >  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> > @@ -642,33 +642,33 @@ static const struct sunxi_desc_pin a100_pins[] =
=3D {
> >  		  SUNXI_FUNCTION(0x1, "gpio_out"),
> >  		  SUNXI_FUNCTION(0x3, "i2c3"),		/* SCK */
> >  		  SUNXI_FUNCTION(0x4, "i2s3"),		/* MCLK */
> > -		  SUNXI_FUNCTION(0x5, "emac0"),		/* EPHY */
> > +		  SUNXI_FUNCTION(0x5, "emac"),		/* EPHY */
> >  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 13)),
> >  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 14),
> >  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> >  		  SUNXI_FUNCTION(0x1, "gpio_out"),
> >  		  SUNXI_FUNCTION(0x4, "i2s3"),		/* BCLK */
> > -		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXD3 */
> > +		  SUNXI_FUNCTION(0x5, "emac"),		/* RXD3 */
> >  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 14)),
> >  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 15),
> >  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> >  		  SUNXI_FUNCTION(0x1, "gpio_out"),
> >  		  SUNXI_FUNCTION(0x4, "i2s3"),		/* LRCK */
> > -		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXD2 */
> > +		  SUNXI_FUNCTION(0x5, "emac"),		/* RXD2 */
> >  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 15)),
> >  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 16),
> >  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> >  		  SUNXI_FUNCTION(0x1, "gpio_out"),
> >  		  SUNXI_FUNCTION(0x3, "i2s3_dout0"),	/* DOUT0 */
> >  		  SUNXI_FUNCTION(0x4, "i2s3_din1"),	/* DIN1 */
> > -		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXCK */
> > +		  SUNXI_FUNCTION(0x5, "emac"),		/* RXCK */
> >  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 16)),
> >  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 17),
> >  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> >  		  SUNXI_FUNCTION(0x1, "gpio_out"),
> >  		  SUNXI_FUNCTION(0x3, "i2s3_dout1"),	/* DOUT1 */
> >  		  SUNXI_FUNCTION(0x4, "i2s3_din0"),	/* DIN0 */
> > -		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXD3 */
> > +		  SUNXI_FUNCTION(0x5, "emac"),		/* TXD3 */
> >  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 17)),
> >  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 18),
> >  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> > @@ -676,7 +676,7 @@ static const struct sunxi_desc_pin a100_pins[] =3D {
> >  		  SUNXI_FUNCTION(0x2, "cir0"),		/* OUT */
> >  		  SUNXI_FUNCTION(0x3, "i2s3_dout2"),	/* DOUT2 */
> >  		  SUNXI_FUNCTION(0x4, "i2s3_din2"),	/* DIN2 */
> > -		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXD2 */
> > +		  SUNXI_FUNCTION(0x5, "emac"),		/* TXD2 */
> >  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 18)),
> >  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 19),
> >  		  SUNXI_FUNCTION(0x0, "gpio_in"),
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--l3y7GJdqAmCxlN8u
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhputcACgkQhP3B6o/u
lQwa3Q//VE/OHcgvfhBk2G/gWmHYELo57bl2jhjqRafHEeytpcdEZjTe4/Ft+uqi
AyNNE2Mq2agghzPdf360OGlk7g5pcvi6GgypfNnTUtD1kQ51U5HF7iUHPubV/LMt
rErTh+pGbxogbPaL5h9XfI9Nm06ZVpX4YlDTYkOn3t2lF2JLeL8osvq1QvkftyPu
jdiCfjDgt5+y+44+OARjO5StHMEOAzgagTb/RT1+yqgGyqkSd3eZgM41hzfgGTjp
wyO0ibdy8ElbDO5yr4JjwqdUXIhLOHk+Dlfc//SDg1s/Yz7+vQgbKX0rFN7shc5Q
587cPCpwLhW+LIZGYWkvp5QSqs132Vg2dUA2xwlBzaErUQ3Qs55kCHQUpDtnwRHb
mCuwkcrvgs1SmaKsC/gQEDzOQVk5VXNTo1BPh5P3YNe0SPO3D8yvuYMfk+9TUL12
ysUEBqtTnpr14T4GS4CsM/OLa/DiMZmk94wrToN/1TYqAUIKwRpeVeoTj2SdF0rL
RzxjSFjyTu7RwhNWv2QqFppETLEwTRm+82lyZwwmIFt2IxwtcAFcW5RA3mX9SjEV
ot/s6n6zDhz8fe9LSw1bwPsFPK4mIMZ4P/y3tT0CjbjRxZKOybdx+uDZ4qIbJb55
+n21WbdZtvcEy/Xjmxb3rFWjC8aLYLi5ptl6mgq/4MFUJlG1bR8=
=1Woz
-----END PGP SIGNATURE-----

--l3y7GJdqAmCxlN8u--

