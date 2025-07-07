Return-Path: <linux-gpio+bounces-22871-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BDDAFB450
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 15:20:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 35392165B9F
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 13:20:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A71FF2BCF46;
	Mon,  7 Jul 2025 13:20:16 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA0D29DB6C;
	Mon,  7 Jul 2025 13:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751894416; cv=none; b=ZX1v5XeZXgHUclpQ4/MW4T/Ia0s4atw/qr/5mXP1dRPUZw8JMOE2kHsmAEBd1ucvUYZY+0DP/mA7zcJPKQhyBppS9KBKSAwA6MVDJ4jhH/Vd57IsGsP9gluVBe10Ra6pWkJGV+MPlORcSQ2qgsg7flEbYkzzeMZXDsHZZIVjt2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751894416; c=relaxed/simple;
	bh=kQFJqphPLOAg9y+zKXsBeaBja3lReEH3DQTFXcK8hLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RKJsnpK05xz3wYs1yc/ACQAcE01bbt9HT3jWbA+RgnrpdUnv8FXeenQ9wdoP4i/5B3cVkmUCH5NnqoWgb+/4WonWsg92KM0K+xhYqG05fVzSZApN7IEbkCiP9PdEWE1bigfEEiJ0m2oKviTKAseKb153E97lcVR7dAoYi4RvnmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 67FF81F00057;
	Mon,  7 Jul 2025 13:20:04 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id E244CACADAD; Mon,  7 Jul 2025 13:20:02 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 33A59ACADAA;
	Mon,  7 Jul 2025 13:19:59 +0000 (UTC)
Date: Mon, 7 Jul 2025 15:19:57 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>, netdev@vger.kernel.org,
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
Message-ID: <aGvJfcrREOkmBrIm@collins>
References: <20250704233535.4b026641@minigeek.lan>
 <20250705153825.2be2b333@minigeek.lan>
 <aGm8n_wJPiGk85E4@collins>
 <CAGb2v66s-nWA2dFRpgX6DbDET3dWOm1jPKWm1k9SmGSqhTWoWA@mail.gmail.com>
 <aGuV3gcKSRIyey53@collins>
 <CAGb2v66U94RxVTC4O-Z9Pn2RyJK5Xz=pNZCvkFN-5Ax0wG6Cug@mail.gmail.com>
 <aGud0aVLHGoql3Vj@collins>
 <CAGb2v64vCdsY7V2OsJVC+Qy+tbStYSWbh19mBrjuJMwZqUQ=Yw@mail.gmail.com>
 <aGukLuQ359MOyTqT@collins>
 <20250707133806.5bdaa536@donnerap.manchester.arm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l0HpDqj4bHJDcsTC"
Content-Disposition: inline
In-Reply-To: <20250707133806.5bdaa536@donnerap.manchester.arm.com>


--l0HpDqj4bHJDcsTC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Le Mon 07 Jul 25, 13:38, Andre Przywara a =C3=A9crit :
> On Mon, 7 Jul 2025 12:40:46 +0200
> Paul Kocialkowski <paulk@sys-base.io> wrote:
>=20
> > Chen-Yu,
> >=20
> > > > > The block is the same, but the integration is slightly different,=
 as
> > > > > the register for the RGMII clock delays and other stuff is at a d=
ifferent
> > > > > offset in the system controller. The BSP handles this by directly
> > > > > including the register in the "reg" property. =20
> > > >
> > > > Ah I see, I forgot about the syscon register. However it doesn't se=
em like a
> > > > very good approach to have a different compatible to express the id=
ea that an
> > > > external resource is different. Just like we do for clocks, resets =
and other
> > > > things, we should probably find a way to express the offset via som=
e dedicated
> > > > property instead of spinning a different compatible each time it ch=
anges.
> > > > =20
> > > > > So yes, you do need a separate compatible string, if only to deal=
 with
> > > > > the slight difference in the integration layer. =20
> > > >
> > > > So maybe an additional allwinner,syscon-offset property or a new =
=20
> > >=20
> > > If you can get that accepted, I think that works?
> > >  =20
> > > > allwinner,syscon that takes the syscon phandle first and the offset=
 second? =20
> > >=20
> > > I would prefer to avoid any changes to the syscon reference that would
> > > require more custom code. I only just recently found that we could use
> > > the standard syscon code with the provider registering the syscon. We
> > > could drop the of_parse_phandle() + find device + dev_get_regmap() bi=
ts.
> > > This is partially covered in my GMAC200 series. =20
> >=20
> > There is already syscon_regmap_lookup_by_phandle_args which supports ge=
neric
> > extra arguments to a syscon node. It just requires a custom syscon prop=
erty.
> >=20
> > I personally find this cleaner than adding a property just for the offs=
et.
>=20
> Well, I proposed that already for the H616, where the second EMAC has the
> same problem with the syscon at 0x34 instead of 0x30:
>=20
> https://lore.kernel.org/linux-sunxi/20210615110636.23403-10-andre.przywar=
a@arm.com/
>=20
> I don't remember the details, but it got eventually dropped, partly
> because the 2nd EMAC isn't supported yet due to missing AC200/AC300
> support.
> My plan was to let <&syscon> be the same as <&syscon 0>, which would
> preserve compatibility.

Well the syscon property is already defined in the binding as a single phan=
dle
so I'm not sure we could just extend it. It looks like other consumers that
require an extra argument typically have a vendor prefix.

> Though I am not sure the fallback compatible is
> then correct, because it typically means that older driver can cope with
> those devices, which isn't really the case here.
>=20
> But we could postpone this issue as well for the A133, to the day when
> there will be a device using this 2nd MAC.

Yes as long as this opens a way to support both EMACs with the same compati=
ble
it sounds good to me. No need to implement this right now.

So with the sunxi device-tree patches out I think we're only looking at the
pinctrl tree. I can see the patches were pushed on the repo now, so I should
probably better send a revert at this point.

All the best,

Paul

> Cheers,
> Andre
>=20
>=20
> >=20
> > Paul
> >=20
> > > ChenYu
> > >  =20
> > > > It seems that various other platforms are doing similar things (e.g.
> > > > ti,syscon-pcie-mode).
> > > >
> > > > Thanks
> > > >
> > > > Paul
> > > > =20
> > > > >
> > > > > ChenYu
> > > > > =20
> > > > > > [0]: https://github.com/engSinteck/A133_Image/blob/main/longan/=
kernel/linux-4.9/arch/arm64/boot/dts/sunxi/sun50iw10p1.dtsi#L2016
> > > > > > [1]: https://github.com/engSinteck/A133_Image/blob/main/longan/=
kernel/linux-4.9/drivers/net/ethernet/allwinner/sunxi-gmac.c
> > > > > >
> > > > > > All the best,
> > > > > >
> > > > > > Paul
> > > > > > =20
> > > > > > >
> > > > > > > ChenYu
> > > > > > >
> > > > > > > =20
> > > > > > > > Cheers,
> > > > > > > >
> > > > > > > > Paul
> > > > > > > > =20
> > > > > > > > > Cheers,
> > > > > > > > > Andre.
> > > > > > > > > =20
> > > > > > > > > > [1]
> > > > > > > > > > https://github.com/qiaoweibiao/T507_Kernel/blob/main/ar=
ch/arm64/boot/dts/sunxi/sun50iw10p1.dtsi
> > > > > > > > > >
> > > > > > > > > > =20
> > > > > > > > > > >
> > > > > > > > > > > Fixes: 473436e7647d ("pinctrl: sunxi: add support for=
 the Allwinner A100 pin controller")
> > > > > > > > > > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > > > > > > > > > > ---
> > > > > > > > > > >  drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 32 +++=
+++++++-----------
> > > > > > > > > > >  1 file changed, 16 insertions(+), 16 deletions(-)
> > > > > > > > > > >
> > > > > > > > > > > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a10=
0.c b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > > > > > > index b97de80ae2f3..95b764ee1c0d 100644
> > > > > > > > > > > --- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > > > > > > +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > > > > > > @@ -546,33 +546,33 @@ static const struct sunxi_desc_=
pin a100_pins[] =3D {
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* =
SCK */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
RXD1 */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
RXD1 */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 0)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 1),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* =
SDA */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
RXD0 */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
RXD0 */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 1)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 2),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* =
SCK */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
RXCTL */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
RXCTL */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 2)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 3),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* =
SDA */
> > > > > > > > > > >             SUNXI_FUNCTION(0x3, "cir0"),          /* =
OUT */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
CLKIN */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
CLKIN */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 3)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 4),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* =
TX */
> > > > > > > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* =
CS */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
TXD1 */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
TXD1 */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 4)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 5),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > > @@ -580,14 +580,14 @@ static const struct sunxi_desc_=
pin a100_pins[] =3D {
> > > > > > > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* =
RX */
> > > > > > > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* =
CLK */
> > > > > > > > > > >             SUNXI_FUNCTION(0x4, "ledc"),
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
TXD0 */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
TXD0 */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 5)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 6),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* =
RTS */
> > > > > > > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* =
MOSI */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
TXCK */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
TXCK */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 6)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 7),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > > @@ -595,7 +595,7 @@ static const struct sunxi_desc_pi=
n a100_pins[] =3D {
> > > > > > > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* =
CTS */
> > > > > > > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* =
MISO */
> > > > > > > > > > >             SUNXI_FUNCTION(0x4, "spdif"),         /* =
OUT */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
TXCTL */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
TXCTL */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 7)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > > @@ -611,7 +611,7 @@ static const struct sunxi_desc_pi=
n a100_pins[] =3D {
> > > > > > > > > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* =
DATA0 */
> > > > > > > > > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* =
CLK */
> > > > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* =
BCLK */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
MDC */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
MDC */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 9)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > > @@ -619,7 +619,7 @@ static const struct sunxi_desc_pi=
n a100_pins[] =3D {
> > > > > > > > > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* =
DATA1 */
> > > > > > > > > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* =
MOSI */
> > > > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* =
LRCK */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
MDIO */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
MDIO */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 10)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 11),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > > @@ -642,33 +642,33 @@ static const struct sunxi_desc_=
pin a100_pins[] =3D {
> > > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x3, "i2c3"),          /* =
SCK */
> > > > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* =
MCLK */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
EPHY */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
EPHY */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 13)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 14),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* =
BCLK */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
RXD3 */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
RXD3 */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 14)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 15),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* =
LRCK */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
RXD2 */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
RXD2 */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 15)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 16),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout0"),    /* =
DOUT0 */
> > > > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din1"),     /* =
DIN1 */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
RXCK */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
RXCK */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 16)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 17),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout1"),    /* =
DOUT1 */
> > > > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din0"),     /* =
DIN0 */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
TXD3 */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
TXD3 */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 17)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 18),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > > > @@ -676,7 +676,7 @@ static const struct sunxi_desc_pi=
n a100_pins[] =3D {
> > > > > > > > > > >             SUNXI_FUNCTION(0x2, "cir0"),          /* =
OUT */
> > > > > > > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout2"),    /* =
DOUT2 */
> > > > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din2"),     /* =
DIN2 */
> > > > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* =
TXD2 */
> > > > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* =
TXD2 */
> > > > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 18)),
> > > > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 19),
> > > > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"), =20
> > > > > > > > > >
> > > > > > > > > > =20
> > > > > > > > > =20
> > > > > > > >
> > > > > > > > --
> > > > > > > > Paul Kocialkowski,
> > > > > > > >
> > > > > > > > Independent contractor - sys-base - https://www.sys-base.io/
> > > > > > > > Free software developer - https://www.paulk.fr/
> > > > > > > >
> > > > > > > > Expert in multimedia, graphics and embedded hardware suppor=
t with Linux. =20
> > > > > >
> > > > > > --
> > > > > > Paul Kocialkowski,
> > > > > >
> > > > > > Independent contractor - sys-base - https://www.sys-base.io/
> > > > > > Free software developer - https://www.paulk.fr/
> > > > > >
> > > > > > Expert in multimedia, graphics and embedded hardware support wi=
th Linux. =20
> > > >
> > > > --
> > > > Paul Kocialkowski,
> > > >
> > > > Independent contractor - sys-base - https://www.sys-base.io/
> > > > Free software developer - https://www.paulk.fr/
> > > >
> > > > Expert in multimedia, graphics and embedded hardware support with L=
inux. =20
> >=20
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--l0HpDqj4bHJDcsTC
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhryX0ACgkQhP3B6o/u
lQxrqw//d6262Ci1IkaJL4Kme3UFZTwaIIjxHj122293iM6qb6Iy7M+692TlYbZv
AqKuQFxVD4WxdvFutUleyHAjlwCy56qTekAvL8+ReTshxyCW1Yfe34kZm7xNYW1V
4oU0sppuipO5WcF1WZ/L3HldXLRwWeLaLKFiLh/5MxDa5r0u9IXEFIiNr6nbLB4j
QRCAuQKTToeBbWhvH/7+BSQSTdv4XQNmV9hmVBgnnJ9GxaRhGJX3jK6FtQ4kmIyj
9Y9bl+KWPTpxO70/bTG7XEHayvuxkIQL8caPxmF7CEwYT0aRy0ZC3dG4m9eXFYkl
/6B9k83cdfmNdBf0z8l5RKT1ZrghPeY8NdNLmf66uuk5O8KxwtAn3OrvetOPblm/
FiO5+GczLO6VVp63XJt8j121xNaa+hVUuPl2VGM31L3LB/7LC4aU/B+yvorOzvv6
mn5hH5uNNqp2+djF1aQHI6RFBkz7PcVDcvv28jg8gKFuzVnyY9wySsbz3FDL2zGK
c5bnLeBbxthBRofUH/58T8CpVNbcviRY4s8sutjh3LCEf+x044OnjzmZ0E1bhExI
IJOOHiN+Tv9SiNNTdkawWeRKNy5EqcfU3uKyvnwaxTLjs6xidFfWar7d7sf0Jng/
IJp1jm8m9WiAxSTqOaec2bgEkQ8ZGmJ52G2lUM3RxDdKuE58WZY=
=79Bf
-----END PGP SIGNATURE-----

--l0HpDqj4bHJDcsTC--

