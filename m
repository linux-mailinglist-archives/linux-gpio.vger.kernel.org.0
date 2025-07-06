Return-Path: <linux-gpio+bounces-22824-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F2298AFA266
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Jul 2025 02:00:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4600D3BFD24
	for <lists+linux-gpio@lfdr.de>; Sun,  6 Jul 2025 00:00:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 85AFD3595C;
	Sun,  6 Jul 2025 00:00:49 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26461749C;
	Sun,  6 Jul 2025 00:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751760049; cv=none; b=bEl3xNKjQaIxPK341EJNA14g4Wg47CRvopClQ27cd9J2Kwu2iuVIZ3pbefI0RDVdP6ow6Ub5wJQTawEEX1ks+1e+LMpAEhF89ega1jIT0R9o3DMLZQ6GP3y219ogHqv5wOSjpNjCjCpR5+Mi8d2sD6Fw1jfoT4+9TilBMrw/GsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751760049; c=relaxed/simple;
	bh=yFdf2rWS74rjK0yFUfmROGHGPaKR4KFgmKm/2pp5SRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OTiyEVTq8IhfhqTqB75tsMh1PVIPg77LQaqBL9O3hTR+5UiZB8dS9BKuU1LtcrBfqSKszE82IeSQfcAWQyRTOOMZLCOzt0XahrAPrYj0us1/NaKGHmK0B0Sy1t0VFOj2IhoQgxAD1iTB7cduxKHxyStkdVZEP6JIPBaIokGT8KE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id B58F71F00056;
	Sun,  6 Jul 2025 00:00:38 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id B59A0ACA89C; Sun,  6 Jul 2025 00:00:37 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 2DA0DACA896;
	Sun,  6 Jul 2025 00:00:34 +0000 (UTC)
Date: Sun, 6 Jul 2025 02:00:31 +0200
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
Message-ID: <aGm8n_wJPiGk85E4@collins>
References: <20250626080923.632789-1-paulk@sys-base.io>
 <20250626080923.632789-2-paulk@sys-base.io>
 <20250704233535.4b026641@minigeek.lan>
 <20250705153825.2be2b333@minigeek.lan>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="KXva4tx2gZ5muOeG"
Content-Disposition: inline
In-Reply-To: <20250705153825.2be2b333@minigeek.lan>


--KXva4tx2gZ5muOeG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Andre,

Le Sat 05 Jul 25, 15:38, Andre Przywara a =C3=A9crit :
> On Fri, 4 Jul 2025 23:35:35 +0100
> Andre Przywara <andre.przywara@arm.com> wrote:
>=20
> Hi,
>=20
> > On Thu, 26 Jun 2025 10:09:19 +0200
> > Paul Kocialkowski <paulk@sys-base.io> wrote:
> >=20
> > Hi Paul,
> >=20
> > > The Allwinner A100/A133 only has a single emac instance, which is
> > > referred to as "emac" everywhere. Fix the pin names to drop the
> > > trailing "0" that has no reason to be. =20
> >=20
> > Sorry, but this is wrong. There *is* a second EMAC on the A133 die: it's
> > indeed not mentioned in the manual, but you can probe its MMIO
> > registers (@0x5030000), and there is a second syscon register
> > (@0x03000034). It's mentioned in several BSP code places ([1]).
> > It seem like no suitable pins are connected on the A133
> > package, but that should not affect the A100 .dtsi (we use a similar
> > approach for the H616 and A523).
> >=20
> > So I think we should keep the emac0 name.
>=20
> just thinking that it's even worse: this changes the DT visible pinctrl
> function name, so it's a DT ABI change. With the "emac0" function name,
> Ethernet would work with stable kernels already (as everything is
> compatible, it's just about DT changes). But with this change, pinctrl
> drivers in older kernels would not match.

Given that the port is still very early and experimental and has very few u=
sers
and no field deployment so I don't really think it would have annoyed anybo=
dy in
practice. But yes in principle you are right, while the header renames keep=
 the
same value, the string names are used to match the device-tree definitions =
and
this constitues ABI that needs to remain stable.

> So I would very much like to see this patch moved out. Is it just in
> LinusW's tree so far? I don't see it in -next yet.

I don't think the patches were accepted for over a week so we can probably
still act. I will send reverts, unless maintainers want to manually remove
these commits?

Cheers,

Paul

> Cheers,
> Andre.
>=20
> > [1]
> > https://github.com/qiaoweibiao/T507_Kernel/blob/main/arch/arm64/boot/dt=
s/sunxi/sun50iw10p1.dtsi
> >=20
> >=20
> > >=20
> > > Fixes: 473436e7647d ("pinctrl: sunxi: add support for the Allwinner A=
100 pin controller")
> > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > > ---
> > >  drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 32 ++++++++++---------=
--
> > >  1 file changed, 16 insertions(+), 16 deletions(-)
> > >=20
> > > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c b/drivers/pi=
nctrl/sunxi/pinctrl-sun50i-a100.c
> > > index b97de80ae2f3..95b764ee1c0d 100644
> > > --- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > @@ -546,33 +546,33 @@ static const struct sunxi_desc_pin a100_pins[] =
=3D {
> > >  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> > >  		  SUNXI_FUNCTION(0x1, "gpio_out"),
> > >  		  SUNXI_FUNCTION(0x2, "i2c0"),		/* SCK */
> > > -		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXD1 */
> > > +		  SUNXI_FUNCTION(0x5, "emac"),		/* RXD1 */
> > >  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 0)),
> > >  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 1),
> > >  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> > >  		  SUNXI_FUNCTION(0x1, "gpio_out"),
> > >  		  SUNXI_FUNCTION(0x2, "i2c0"),		/* SDA */
> > > -		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXD0 */
> > > +		  SUNXI_FUNCTION(0x5, "emac"),		/* RXD0 */
> > >  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 1)),
> > >  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 2),
> > >  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> > >  		  SUNXI_FUNCTION(0x1, "gpio_out"),
> > >  		  SUNXI_FUNCTION(0x2, "i2c1"),		/* SCK */
> > > -		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXCTL */
> > > +		  SUNXI_FUNCTION(0x5, "emac"),		/* RXCTL */
> > >  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 2)),
> > >  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 3),
> > >  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> > >  		  SUNXI_FUNCTION(0x1, "gpio_out"),
> > >  		  SUNXI_FUNCTION(0x2, "i2c1"),		/* SDA */
> > >  		  SUNXI_FUNCTION(0x3, "cir0"),		/* OUT */
> > > -		  SUNXI_FUNCTION(0x5, "emac0"),		/* CLKIN */
> > > +		  SUNXI_FUNCTION(0x5, "emac"),		/* CLKIN */
> > >  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 3)),
> > >  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 4),
> > >  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> > >  		  SUNXI_FUNCTION(0x1, "gpio_out"),
> > >  		  SUNXI_FUNCTION(0x2, "uart3"),		/* TX */
> > >  		  SUNXI_FUNCTION(0x3, "spi1"),		/* CS */
> > > -		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXD1 */
> > > +		  SUNXI_FUNCTION(0x5, "emac"),		/* TXD1 */
> > >  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 4)),
> > >  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 5),
> > >  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> > > @@ -580,14 +580,14 @@ static const struct sunxi_desc_pin a100_pins[] =
=3D {
> > >  		  SUNXI_FUNCTION(0x2, "uart3"),		/* RX */
> > >  		  SUNXI_FUNCTION(0x3, "spi1"),		/* CLK */
> > >  		  SUNXI_FUNCTION(0x4, "ledc"),
> > > -		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXD0 */
> > > +		  SUNXI_FUNCTION(0x5, "emac"),		/* TXD0 */
> > >  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 5)),
> > >  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 6),
> > >  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> > >  		  SUNXI_FUNCTION(0x1, "gpio_out"),
> > >  		  SUNXI_FUNCTION(0x2, "uart3"),		/* RTS */
> > >  		  SUNXI_FUNCTION(0x3, "spi1"),		/* MOSI */
> > > -		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXCK */
> > > +		  SUNXI_FUNCTION(0x5, "emac"),		/* TXCK */
> > >  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 6)),
> > >  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 7),
> > >  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> > > @@ -595,7 +595,7 @@ static const struct sunxi_desc_pin a100_pins[] =
=3D {
> > >  		  SUNXI_FUNCTION(0x2, "uart3"),		/* CTS */
> > >  		  SUNXI_FUNCTION(0x3, "spi1"),		/* MISO */
> > >  		  SUNXI_FUNCTION(0x4, "spdif"),		/* OUT */
> > > -		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXCTL */
> > > +		  SUNXI_FUNCTION(0x5, "emac"),		/* TXCTL */
> > >  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 7)),
> > >  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
> > >  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> > > @@ -611,7 +611,7 @@ static const struct sunxi_desc_pin a100_pins[] =
=3D {
> > >  		  SUNXI_FUNCTION(0x2, "dmic"),		/* DATA0 */
> > >  		  SUNXI_FUNCTION(0x3, "spi2"),		/* CLK */
> > >  		  SUNXI_FUNCTION(0x4, "i2s2"),		/* BCLK */
> > > -		  SUNXI_FUNCTION(0x5, "emac0"),		/* MDC */
> > > +		  SUNXI_FUNCTION(0x5, "emac"),		/* MDC */
> > >  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 9)),
> > >  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
> > >  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> > > @@ -619,7 +619,7 @@ static const struct sunxi_desc_pin a100_pins[] =
=3D {
> > >  		  SUNXI_FUNCTION(0x2, "dmic"),		/* DATA1 */
> > >  		  SUNXI_FUNCTION(0x3, "spi2"),		/* MOSI */
> > >  		  SUNXI_FUNCTION(0x4, "i2s2"),		/* LRCK */
> > > -		  SUNXI_FUNCTION(0x5, "emac0"),		/* MDIO */
> > > +		  SUNXI_FUNCTION(0x5, "emac"),		/* MDIO */
> > >  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 10)),
> > >  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 11),
> > >  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> > > @@ -642,33 +642,33 @@ static const struct sunxi_desc_pin a100_pins[] =
=3D {
> > >  		  SUNXI_FUNCTION(0x1, "gpio_out"),
> > >  		  SUNXI_FUNCTION(0x3, "i2c3"),		/* SCK */
> > >  		  SUNXI_FUNCTION(0x4, "i2s3"),		/* MCLK */
> > > -		  SUNXI_FUNCTION(0x5, "emac0"),		/* EPHY */
> > > +		  SUNXI_FUNCTION(0x5, "emac"),		/* EPHY */
> > >  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 13)),
> > >  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 14),
> > >  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> > >  		  SUNXI_FUNCTION(0x1, "gpio_out"),
> > >  		  SUNXI_FUNCTION(0x4, "i2s3"),		/* BCLK */
> > > -		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXD3 */
> > > +		  SUNXI_FUNCTION(0x5, "emac"),		/* RXD3 */
> > >  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 14)),
> > >  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 15),
> > >  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> > >  		  SUNXI_FUNCTION(0x1, "gpio_out"),
> > >  		  SUNXI_FUNCTION(0x4, "i2s3"),		/* LRCK */
> > > -		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXD2 */
> > > +		  SUNXI_FUNCTION(0x5, "emac"),		/* RXD2 */
> > >  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 15)),
> > >  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 16),
> > >  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> > >  		  SUNXI_FUNCTION(0x1, "gpio_out"),
> > >  		  SUNXI_FUNCTION(0x3, "i2s3_dout0"),	/* DOUT0 */
> > >  		  SUNXI_FUNCTION(0x4, "i2s3_din1"),	/* DIN1 */
> > > -		  SUNXI_FUNCTION(0x5, "emac0"),		/* RXCK */
> > > +		  SUNXI_FUNCTION(0x5, "emac"),		/* RXCK */
> > >  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 16)),
> > >  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 17),
> > >  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> > >  		  SUNXI_FUNCTION(0x1, "gpio_out"),
> > >  		  SUNXI_FUNCTION(0x3, "i2s3_dout1"),	/* DOUT1 */
> > >  		  SUNXI_FUNCTION(0x4, "i2s3_din0"),	/* DIN0 */
> > > -		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXD3 */
> > > +		  SUNXI_FUNCTION(0x5, "emac"),		/* TXD3 */
> > >  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 17)),
> > >  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 18),
> > >  		  SUNXI_FUNCTION(0x0, "gpio_in"),
> > > @@ -676,7 +676,7 @@ static const struct sunxi_desc_pin a100_pins[] =
=3D {
> > >  		  SUNXI_FUNCTION(0x2, "cir0"),		/* OUT */
> > >  		  SUNXI_FUNCTION(0x3, "i2s3_dout2"),	/* DOUT2 */
> > >  		  SUNXI_FUNCTION(0x4, "i2s3_din2"),	/* DIN2 */
> > > -		  SUNXI_FUNCTION(0x5, "emac0"),		/* TXD2 */
> > > +		  SUNXI_FUNCTION(0x5, "emac"),		/* TXD2 */
> > >  		  SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 18)),
> > >  	SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 19),
> > >  		  SUNXI_FUNCTION(0x0, "gpio_in"), =20
> >=20
> >=20
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--KXva4tx2gZ5muOeG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhpvJ8ACgkQhP3B6o/u
lQyB8g/+I/IZ0fC9AjtDnEEP7jJBhWGeHIpqQ9M5BPyspxQfF4vMIbTWZeUXpZ6G
1BUjKv2gy3IjuBCtsA6PMLJc1S3iguBdUEcv/BM2TLNlb43qYjimpUqeWURXHAn0
L6DxehUuB2gWTqWLVp9FXxLm9JRMEmIs1791w/ekFFAwcjUpOPmeZqIeHFIlzimn
L9r7EezaHnR4qE6Jj6NrjADZaLMCrhiwwfi3ffKDwPxQQEo+FqA4TdIjldR6btKG
C1Ar3kcV454w6BpnMj+FwwWC5C/0wXYvLGwY0XwpdkO6YGiWh3dG32Ue8A2UKsJD
RKse7l1HlWPicMiQIsqudQ3vLho4OZCXNM1aC5cNZJF3To3sFBUQHaudP6aIoYk1
DNKKqpWSg+bFfsEnHl/eObCO6nZ09d75GOzjuzeM36T5yBy+DRCFUhLNrlaqW26z
ISu/VNvzwopjviLFI/qEboPzd/sj5YRcqI8x4tU9/NyrtUbZkut6/MZXFXYh949t
VSRc1buWvdmOxMib/gLaubktaXCaXQe6lK1j3+tCHw9B/ufjFlklYzWHUCVLg1hd
ushQN0EvgrH8e5aQMfjQIbKm1/0qk4IaoOzK74F9FtxxbxcJbQottKMu1qzA/Hbo
G/X5vgmQ2SuZCYxItiHg8M6KWTw/JxZW1BzaAGs7Rb4piex/tT4=
=oAa6
-----END PGP SIGNATURE-----

--KXva4tx2gZ5muOeG--

