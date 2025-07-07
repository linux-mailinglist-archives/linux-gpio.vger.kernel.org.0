Return-Path: <linux-gpio+bounces-22866-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F00B0AFB0E5
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 12:14:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EB2073AA5E0
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 10:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF75293C58;
	Mon,  7 Jul 2025 10:13:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D3626057F;
	Mon,  7 Jul 2025 10:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751883235; cv=none; b=X1uM31MboLx+NrVn0D5dS/u8NyBRD5V6xlbiJGjqc2mgDMgptJpor7TKfOhbIigNcfTbOpLHm9Cjck4cx/4y1E7895SWy92P004sz4fEQU47OfYaAfP46tI2oZOEnZT8iv9K7GtbDur6f/6skqpuugfEviUzLaQssF0DPgC0TvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751883235; c=relaxed/simple;
	bh=CV1n2Ca1CRz/Vqwuq/jZCCA8Yxvy0aZV9rmI+cWy3c4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p5bwiXyb7qu7y0OvM7H8E2qqB6WagL9c6N4pTOgzZpL/I7iDtPcwe9UnFalzxnIzimC6e8AWqVRiw86nFrjRF3NB/W9fsANws+LYwKHehYqQwa5QOzElEORVQbTCri5Ptwlm1vYCPCtU/Z+XiYY6j5QvJYYPngMEwao86DH1Rb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 42BAD1F00056;
	Mon,  7 Jul 2025 10:13:44 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 91573ACACDB; Mon,  7 Jul 2025 10:13:42 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 98F05ACACD3;
	Mon,  7 Jul 2025 10:13:39 +0000 (UTC)
Date: Mon, 7 Jul 2025 12:13:37 +0200
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
Message-ID: <aGud0aVLHGoql3Vj@collins>
References: <20250626080923.632789-1-paulk@sys-base.io>
 <20250626080923.632789-2-paulk@sys-base.io>
 <20250704233535.4b026641@minigeek.lan>
 <20250705153825.2be2b333@minigeek.lan>
 <aGm8n_wJPiGk85E4@collins>
 <CAGb2v66s-nWA2dFRpgX6DbDET3dWOm1jPKWm1k9SmGSqhTWoWA@mail.gmail.com>
 <aGuV3gcKSRIyey53@collins>
 <CAGb2v66U94RxVTC4O-Z9Pn2RyJK5Xz=pNZCvkFN-5Ax0wG6Cug@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yZa9VLu47USVw4Sh"
Content-Disposition: inline
In-Reply-To: <CAGb2v66U94RxVTC4O-Z9Pn2RyJK5Xz=pNZCvkFN-5Ax0wG6Cug@mail.gmail.com>


--yZa9VLu47USVw4Sh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Le Mon 07 Jul 25, 17:52, Chen-Yu Tsai a =C3=A9crit :
> On Mon, Jul 7, 2025 at 5:39=E2=80=AFPM Paul Kocialkowski <paulk@sys-base.=
io> wrote:
> >
> > Hi Chen-Yu,
> >
> > Le Sun 06 Jul 25, 23:04, Chen-Yu Tsai a =C3=A9crit :
> > > On Sun, Jul 6, 2025 at 8:00=E2=80=AFAM Paul Kocialkowski <paulk@sys-b=
ase.io> wrote:
> > > >
> > > > Hi Andre,
> > > >
> > > > Le Sat 05 Jul 25, 15:38, Andre Przywara a =C3=A9crit :
> > > > > On Fri, 4 Jul 2025 23:35:35 +0100
> > > > > Andre Przywara <andre.przywara@arm.com> wrote:
> > > > >
> > > > > Hi,
> > > > >
> > > > > > On Thu, 26 Jun 2025 10:09:19 +0200
> > > > > > Paul Kocialkowski <paulk@sys-base.io> wrote:
> > > > > >
> > > > > > Hi Paul,
> > > > > >
> > > > > > > The Allwinner A100/A133 only has a single emac instance, whic=
h is
> > > > > > > referred to as "emac" everywhere. Fix the pin names to drop t=
he
> > > > > > > trailing "0" that has no reason to be.
> > > > > >
> > > > > > Sorry, but this is wrong. There *is* a second EMAC on the A133 =
die: it's
> > > > > > indeed not mentioned in the manual, but you can probe its MMIO
> > > > > > registers (@0x5030000), and there is a second syscon register
> > > > > > (@0x03000034). It's mentioned in several BSP code places ([1]).
> > > > > > It seem like no suitable pins are connected on the A133
> > > > > > package, but that should not affect the A100 .dtsi (we use a si=
milar
> > > > > > approach for the H616 and A523).
> > > > > >
> > > > > > So I think we should keep the emac0 name.
> > > > >
> > > > > just thinking that it's even worse: this changes the DT visible p=
inctrl
> > > > > function name, so it's a DT ABI change. With the "emac0" function=
 name,
> > > > > Ethernet would work with stable kernels already (as everything is
> > > > > compatible, it's just about DT changes). But with this change, pi=
nctrl
> > > > > drivers in older kernels would not match.
> > > >
> > > > Given that the port is still very early and experimental and has ve=
ry few users
> > > > and no field deployment so I don't really think it would have annoy=
ed anybody in
> > > > practice. But yes in principle you are right, while the header rena=
mes keep the
> > > > same value, the string names are used to match the device-tree defi=
nitions and
> > > > this constitues ABI that needs to remain stable.
> > > >
> > > > > So I would very much like to see this patch moved out. Is it just=
 in
> > > > > LinusW's tree so far? I don't see it in -next yet.
> > > >
> > > > I don't think the patches were accepted for over a week so we can p=
robably
> > > > still act. I will send reverts, unless maintainers want to manually=
 remove
> > > > these commits?
> > >
> > > I can drop the dts patches from the sunxi tree. Linus might be able to
> > > drop the pinctrl patch.
> > >
> > > You definitely need to send a revert for the DT binding patch that is
> > > already in net-next.
> >
> > Should this really affect the bindings though?
> >
> > From what Andre reported, both EMAC0 and EMAC1 should be the same block=
 so it
> > doesn't seem particularly necessary to have a different compatible.
> >
> > Looking at Allwiner's BSP code for the A133[0], I don't see any differe=
nce
> > between the two. While there's device_type property in Allwinner's dt, =
it's
> > apparently not used by the driver[1].
> >
> > So I think we're still fine with a single compatible (without the contr=
oller
> > index in it).
>=20
> The block is the same, but the integration is slightly different, as
> the register for the RGMII clock delays and other stuff is at a different
> offset in the system controller. The BSP handles this by directly
> including the register in the "reg" property.

Ah I see, I forgot about the syscon register. However it doesn't seem like a
very good approach to have a different compatible to express the idea that =
an
external resource is different. Just like we do for clocks, resets and other
things, we should probably find a way to express the offset via some dedica=
ted
property instead of spinning a different compatible each time it changes.

> So yes, you do need a separate compatible string, if only to deal with
> the slight difference in the integration layer.

So maybe an additional allwinner,syscon-offset property or a new
allwinner,syscon that takes the syscon phandle first and the offset second?
It seems that various other platforms are doing similar things (e.g.
ti,syscon-pcie-mode).

Thanks

Paul

>=20
> ChenYu
>=20
> > [0]: https://github.com/engSinteck/A133_Image/blob/main/longan/kernel/l=
inux-4.9/arch/arm64/boot/dts/sunxi/sun50iw10p1.dtsi#L2016
> > [1]: https://github.com/engSinteck/A133_Image/blob/main/longan/kernel/l=
inux-4.9/drivers/net/ethernet/allwinner/sunxi-gmac.c
> >
> > All the best,
> >
> > Paul
> >
> > >
> > > ChenYu
> > >
> > >
> > > > Cheers,
> > > >
> > > > Paul
> > > >
> > > > > Cheers,
> > > > > Andre.
> > > > >
> > > > > > [1]
> > > > > > https://github.com/qiaoweibiao/T507_Kernel/blob/main/arch/arm64=
/boot/dts/sunxi/sun50iw10p1.dtsi
> > > > > >
> > > > > >
> > > > > > >
> > > > > > > Fixes: 473436e7647d ("pinctrl: sunxi: add support for the All=
winner A100 pin controller")
> > > > > > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > > > > > > ---
> > > > > > >  drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 32 ++++++++++-=
----------
> > > > > > >  1 file changed, 16 insertions(+), 16 deletions(-)
> > > > > > >
> > > > > > > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c b/dr=
ivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > > index b97de80ae2f3..95b764ee1c0d 100644
> > > > > > > --- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > > +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > > @@ -546,33 +546,33 @@ static const struct sunxi_desc_pin a100=
_pins[] =3D {
> > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* SCK */
> > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD1 */
> > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD1 */
> > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 0)),
> > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 1),
> > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* SDA */
> > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD0 */
> > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD0 */
> > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 1)),
> > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 2),
> > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* SCK */
> > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXCTL */
> > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXCTL */
> > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 2)),
> > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 3),
> > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* SDA */
> > > > > > >             SUNXI_FUNCTION(0x3, "cir0"),          /* OUT */
> > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* CLKIN */
> > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* CLKIN */
> > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 3)),
> > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 4),
> > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* TX */
> > > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* CS */
> > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD1 */
> > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD1 */
> > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 4)),
> > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 5),
> > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > @@ -580,14 +580,14 @@ static const struct sunxi_desc_pin a100=
_pins[] =3D {
> > > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* RX */
> > > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* CLK */
> > > > > > >             SUNXI_FUNCTION(0x4, "ledc"),
> > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD0 */
> > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD0 */
> > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 5)),
> > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 6),
> > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* RTS */
> > > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* MOSI */
> > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXCK */
> > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXCK */
> > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 6)),
> > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 7),
> > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > @@ -595,7 +595,7 @@ static const struct sunxi_desc_pin a100_p=
ins[] =3D {
> > > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* CTS */
> > > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* MISO */
> > > > > > >             SUNXI_FUNCTION(0x4, "spdif"),         /* OUT */
> > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXCTL */
> > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXCTL */
> > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 7)),
> > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
> > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > @@ -611,7 +611,7 @@ static const struct sunxi_desc_pin a100_p=
ins[] =3D {
> > > > > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* DATA0 */
> > > > > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* CLK */
> > > > > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* BCLK */
> > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* MDC */
> > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* MDC */
> > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 9)),
> > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
> > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > @@ -619,7 +619,7 @@ static const struct sunxi_desc_pin a100_p=
ins[] =3D {
> > > > > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* DATA1 */
> > > > > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* MOSI */
> > > > > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* LRCK */
> > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* MDIO */
> > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* MDIO */
> > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 10)),
> > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 11),
> > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > @@ -642,33 +642,33 @@ static const struct sunxi_desc_pin a100=
_pins[] =3D {
> > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > >             SUNXI_FUNCTION(0x3, "i2c3"),          /* SCK */
> > > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* MCLK */
> > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* EPHY */
> > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* EPHY */
> > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 13)),
> > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 14),
> > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* BCLK */
> > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD3 */
> > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD3 */
> > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 14)),
> > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 15),
> > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* LRCK */
> > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD2 */
> > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD2 */
> > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 15)),
> > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 16),
> > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout0"),    /* DOUT0 */
> > > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din1"),     /* DIN1 */
> > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXCK */
> > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXCK */
> > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 16)),
> > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 17),
> > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout1"),    /* DOUT1 */
> > > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din0"),     /* DIN0 */
> > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD3 */
> > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD3 */
> > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 17)),
> > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 18),
> > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > @@ -676,7 +676,7 @@ static const struct sunxi_desc_pin a100_p=
ins[] =3D {
> > > > > > >             SUNXI_FUNCTION(0x2, "cir0"),          /* OUT */
> > > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout2"),    /* DOUT2 */
> > > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din2"),     /* DIN2 */
> > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD2 */
> > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD2 */
> > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 18)),
> > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 19),
> > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > >
> > > > > >
> > > > >
> > > >
> > > > --
> > > > Paul Kocialkowski,
> > > >
> > > > Independent contractor - sys-base - https://www.sys-base.io/
> > > > Free software developer - https://www.paulk.fr/
> > > >
> > > > Expert in multimedia, graphics and embedded hardware support with L=
inux.
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

--yZa9VLu47USVw4Sh
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhrndEACgkQhP3B6o/u
lQxU5w//XeJBg1LfklJq+6k5MFiGmENiAMlLOG5lZARbxyA5fB6PA7HVBW22PwSG
ssmozFf/NveM0koeSRSeDFYJ9dhCgEMl3PkC4BWa9ifKawl8C6e1l+ntr6pS3LK8
fgmikJbvGbgpjg/RxafPTcIfo3YGVX/mNKoVJE8kf/n5AiIcG2fVWC/TcWEYuYDf
PPTLT81HrvKqyDMkGw/xt2VceyHJOB0nTNRUVDCf+50qy0k4SE2eJF3Pbj9iN9ZZ
UTj2X/OaTVsJ7ie+LO5xoZNWCUCv/ZiOdDNt+hODF6UbS8QnQdSrQ+/zSKxse6Xm
jHZbYfuTRUKDZSR+EIAt9GDDBlwmqIs5QGGIiJ9GvB0dpAz3ZPgDOIGPtW+RWMqE
jGzM1C+oLTU09V1eAkFj+mI72Wmb1qjHjgoE6x4e99LcAS9V92KwP+aOuJMiVdB8
Wef8haAwKrX3UkFKUv02Hq6vxrrF4CpvdA3RfXShvLjQKow05dmenzc3gpPNYdgV
5/ZAfTOkra5NoX8cnJPJHdbvNaQJxbe/qLQttUs9t2ayaUb2Tdfbji274CBCPDEx
DaOriH8OpJHV8M+fAgk1sRbZyZUX3+2TJ0pbBsHi37B24LY/muiwapqlMSK5dUnb
LEa07CHuUs1R03XGaZRYVjWEGKdF9g7wRprEtxbWYmGXQv+x99o=
=e1Oj
-----END PGP SIGNATURE-----

--yZa9VLu47USVw4Sh--

