Return-Path: <linux-gpio+bounces-22862-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F47EAFAFF3
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 11:40:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 27B921AA21D2
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 09:40:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A5F3290D97;
	Mon,  7 Jul 2025 09:40:11 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6604C28D849;
	Mon,  7 Jul 2025 09:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751881210; cv=none; b=C+1LB8mN58hU75/+aKUVEPUd3ekn3SPKj9FM5qyiwG/UygsU26ROu33xpKm79uSBSxKLDlPkp3OWk1T4w9P6Z/ejKS1kon8dqoUnmq6v18B3PTuiYhrSUmrqOcRW+q0CrnS6/iX6TK1l1iWjVd5QbrChtbYfjOK3sIFgbfermuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751881210; c=relaxed/simple;
	bh=HqkmcGU9dL/ZH9AJzYzw+pKoFAAO5/uPXfjPh2ihPrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4snKO1F/QA8SEwhBmwuXAghDxB0TN0mvyp+BgbWrEuT4brNXZR2QCVl5baP9HwMpgRStUI6Yqc5AOktpCsTLdlSGXqSiVP55AaHI6hJjLwdznHP/+q6WAUF2rDRjslWoo9F4GJb9ygnd5FQIWGXlBU7GZ5iwqUDuaR/Vln5uvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 3A6DE1F00057;
	Mon,  7 Jul 2025 09:39:50 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 2989EACAC6A; Mon,  7 Jul 2025 09:39:49 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 61394ACAC6F;
	Mon,  7 Jul 2025 09:39:44 +0000 (UTC)
Date: Mon, 7 Jul 2025 11:39:42 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Andre Przywara <andre.przywara@arm.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/5] pinctrl: sunxi: Fix a100 emac pin function name
Message-ID: <aGuV3gcKSRIyey53@collins>
References: <20250626080923.632789-1-paulk@sys-base.io>
 <20250626080923.632789-2-paulk@sys-base.io>
 <20250704233535.4b026641@minigeek.lan>
 <20250705153825.2be2b333@minigeek.lan>
 <aGm8n_wJPiGk85E4@collins>
 <CAGb2v66s-nWA2dFRpgX6DbDET3dWOm1jPKWm1k9SmGSqhTWoWA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XdpP7rZ162aJGq60"
Content-Disposition: inline
In-Reply-To: <CAGb2v66s-nWA2dFRpgX6DbDET3dWOm1jPKWm1k9SmGSqhTWoWA@mail.gmail.com>


--XdpP7rZ162aJGq60
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Chen-Yu,

Le Sun 06 Jul 25, 23:04, Chen-Yu Tsai a =C3=A9crit :
> On Sun, Jul 6, 2025 at 8:00=E2=80=AFAM Paul Kocialkowski <paulk@sys-base.=
io> wrote:
> >
> > Hi Andre,
> >
> > Le Sat 05 Jul 25, 15:38, Andre Przywara a =C3=A9crit :
> > > On Fri, 4 Jul 2025 23:35:35 +0100
> > > Andre Przywara <andre.przywara@arm.com> wrote:
> > >
> > > Hi,
> > >
> > > > On Thu, 26 Jun 2025 10:09:19 +0200
> > > > Paul Kocialkowski <paulk@sys-base.io> wrote:
> > > >
> > > > Hi Paul,
> > > >
> > > > > The Allwinner A100/A133 only has a single emac instance, which is
> > > > > referred to as "emac" everywhere. Fix the pin names to drop the
> > > > > trailing "0" that has no reason to be.
> > > >
> > > > Sorry, but this is wrong. There *is* a second EMAC on the A133 die:=
 it's
> > > > indeed not mentioned in the manual, but you can probe its MMIO
> > > > registers (@0x5030000), and there is a second syscon register
> > > > (@0x03000034). It's mentioned in several BSP code places ([1]).
> > > > It seem like no suitable pins are connected on the A133
> > > > package, but that should not affect the A100 .dtsi (we use a similar
> > > > approach for the H616 and A523).
> > > >
> > > > So I think we should keep the emac0 name.
> > >
> > > just thinking that it's even worse: this changes the DT visible pinct=
rl
> > > function name, so it's a DT ABI change. With the "emac0" function nam=
e,
> > > Ethernet would work with stable kernels already (as everything is
> > > compatible, it's just about DT changes). But with this change, pinctrl
> > > drivers in older kernels would not match.
> >
> > Given that the port is still very early and experimental and has very f=
ew users
> > and no field deployment so I don't really think it would have annoyed a=
nybody in
> > practice. But yes in principle you are right, while the header renames =
keep the
> > same value, the string names are used to match the device-tree definiti=
ons and
> > this constitues ABI that needs to remain stable.
> >
> > > So I would very much like to see this patch moved out. Is it just in
> > > LinusW's tree so far? I don't see it in -next yet.
> >
> > I don't think the patches were accepted for over a week so we can proba=
bly
> > still act. I will send reverts, unless maintainers want to manually rem=
ove
> > these commits?
>=20
> I can drop the dts patches from the sunxi tree. Linus might be able to
> drop the pinctrl patch.
>=20
> You definitely need to send a revert for the DT binding patch that is
> already in net-next.

Should this really affect the bindings though?

=46rom what Andre reported, both EMAC0 and EMAC1 should be the same block s=
o it
doesn't seem particularly necessary to have a different compatible.

Looking at Allwiner's BSP code for the A133[0], I don't see any difference
between the two. While there's device_type property in Allwinner's dt, it's
apparently not used by the driver[1].

So I think we're still fine with a single compatible (without the controller
index in it).

[0]: https://github.com/engSinteck/A133_Image/blob/main/longan/kernel/linux=
-4.9/arch/arm64/boot/dts/sunxi/sun50iw10p1.dtsi#L2016
[1]: https://github.com/engSinteck/A133_Image/blob/main/longan/kernel/linux=
-4.9/drivers/net/ethernet/allwinner/sunxi-gmac.c

All the best,

Paul

>=20
> ChenYu
>=20
>=20
> > Cheers,
> >
> > Paul
> >
> > > Cheers,
> > > Andre.
> > >
> > > > [1]
> > > > https://github.com/qiaoweibiao/T507_Kernel/blob/main/arch/arm64/boo=
t/dts/sunxi/sun50iw10p1.dtsi
> > > >
> > > >
> > > > >
> > > > > Fixes: 473436e7647d ("pinctrl: sunxi: add support for the Allwinn=
er A100 pin controller")
> > > > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > > > > ---
> > > > >  drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 32 ++++++++++-----=
------
> > > > >  1 file changed, 16 insertions(+), 16 deletions(-)
> > > > >
> > > > > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c b/driver=
s/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > index b97de80ae2f3..95b764ee1c0d 100644
> > > > > --- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > @@ -546,33 +546,33 @@ static const struct sunxi_desc_pin a100_pin=
s[] =3D {
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* SCK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD1 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD1 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 0)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 1),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* SDA */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD0 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD0 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 1)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 2),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* SCK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXCTL */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXCTL */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 2)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 3),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* SDA */
> > > > >             SUNXI_FUNCTION(0x3, "cir0"),          /* OUT */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* CLKIN */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* CLKIN */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 3)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 4),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* TX */
> > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* CS */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD1 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD1 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 4)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 5),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > @@ -580,14 +580,14 @@ static const struct sunxi_desc_pin a100_pin=
s[] =3D {
> > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* RX */
> > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* CLK */
> > > > >             SUNXI_FUNCTION(0x4, "ledc"),
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD0 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD0 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 5)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 6),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* RTS */
> > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* MOSI */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXCK */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXCK */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 6)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 7),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > @@ -595,7 +595,7 @@ static const struct sunxi_desc_pin a100_pins[=
] =3D {
> > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* CTS */
> > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* MISO */
> > > > >             SUNXI_FUNCTION(0x4, "spdif"),         /* OUT */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXCTL */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXCTL */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 7)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > @@ -611,7 +611,7 @@ static const struct sunxi_desc_pin a100_pins[=
] =3D {
> > > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* DATA0 */
> > > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* CLK */
> > > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* BCLK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* MDC */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* MDC */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 9)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > @@ -619,7 +619,7 @@ static const struct sunxi_desc_pin a100_pins[=
] =3D {
> > > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* DATA1 */
> > > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* MOSI */
> > > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* LRCK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* MDIO */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* MDIO */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 10)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 11),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > @@ -642,33 +642,33 @@ static const struct sunxi_desc_pin a100_pin=
s[] =3D {
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x3, "i2c3"),          /* SCK */
> > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* MCLK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* EPHY */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* EPHY */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 13)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 14),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* BCLK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD3 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD3 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 14)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 15),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* LRCK */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD2 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD2 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 15)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 16),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout0"),    /* DOUT0 */
> > > > >             SUNXI_FUNCTION(0x4, "i2s3_din1"),     /* DIN1 */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXCK */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXCK */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 16)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 17),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout1"),    /* DOUT1 */
> > > > >             SUNXI_FUNCTION(0x4, "i2s3_din0"),     /* DIN0 */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD3 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD3 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 17)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 18),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > @@ -676,7 +676,7 @@ static const struct sunxi_desc_pin a100_pins[=
] =3D {
> > > > >             SUNXI_FUNCTION(0x2, "cir0"),          /* OUT */
> > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout2"),    /* DOUT2 */
> > > > >             SUNXI_FUNCTION(0x4, "i2s3_din2"),     /* DIN2 */
> > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD2 */
> > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD2 */
> > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 18)),
> > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 19),
> > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > >
> > > >
> > >
> >
> > --
> > Paul Kocialkowski,
> >
> > Independent contractor - sys-base - https://www.sys-base.io/
> > Free software developer - https://www.paulk.fr/
> >
> > Expert in multimedia, graphics and embedded hardware support with Linux.

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--XdpP7rZ162aJGq60
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhrld4ACgkQhP3B6o/u
lQxhGg//RkhulMqu+NDFCtXDYdtwjWBuUBSul6anTse4p1HDcTCsQwm5F9QTP+tZ
dvgl02rfFlH0W/ylYmmN3aFjR3d/EuhicBUiNVpVlSBW2JzZ0EK9ge2ulNkNy0r2
OAyA+SJjVUK4jNN6Cv9TI1C5I0lrTQRhl/RHdjb7lL+8141MChuF1l8PTKstLK+Q
uSxcYr4f2FFssp0ZsaTlTl6YmZHT1MVvMHdpM4KiV/3Nt9HcdlXtQdoB4tpAFNj+
1dSFiF0arpuRVKDMCstvd6QZFdpTfQPWmRB0kvSwlYAWU1bm1JZwW2KG15GoHAnW
BuumXSZvVtKD2oMjtVVKbgJJirquzv0WgUvf6gAjGPcdAYTNJ8Tka78zXcFkkSx5
VwqGI+wiBs/m6ICPVO7UACgjOeZGKUfJ6TuZl/59Em6kGo+AgHP6YK7bV2IlIhJw
GXJSJ7b54rin3O666Aag10RMIWW8s7SzlqmEukbn61nlAPdqvEpCaDqHyTe9XPaJ
HMdA56CxqXIA7SBOky1pP4kUAcATGNYuRjvXfGjVR67UXv+yngOeBNARenWBkTX7
ybRbzcFT/38IifMTxrjc9c0TLtHNFsMUNaXFF5PRRKBsxcSEw+AJ3pCmxVDzpyru
msl7lUFLn0XoV+6PnPRQJ/j4bbSK5mNMVsXUgiOGA1AaQNrlB3E=
=tq5K
-----END PGP SIGNATURE-----

--XdpP7rZ162aJGq60--

