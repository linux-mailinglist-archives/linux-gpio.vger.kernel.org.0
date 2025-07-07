Return-Path: <linux-gpio+bounces-22868-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD88AFB16B
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 12:41:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E44667AB245
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Jul 2025 10:39:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E041295D91;
	Mon,  7 Jul 2025 10:41:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18120279DD1;
	Mon,  7 Jul 2025 10:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751884864; cv=none; b=Ov7OxwCOy2dlfllLWSepCTkSnJmRIxlNPbtCvWPRHDy/qpYiA2zOiLWA2bF3i57rKDuSmorGeIuWIDE1Igf7OvbI6X3Ptd9uZ7wOt+RquqwN/va/W5wPTtemHa68t3o1dI/FxkDEDJl0HlNH1BphoNIKKOHTOCkMxjdBp0FAAjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751884864; c=relaxed/simple;
	bh=bQ9tdkHP6nhBU5MBeF9vDiSoqLcO/Ot5RbMzGtMHupA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qdvqdGPkwAIiqK7AYoSHBn1PiD2WPKPf09atNqwRoqaKTexXJufjTLcvL+JG7eoqxTKv5SyeU3h4R9j961IT1rb0txeo7i5tFEdlTy9yNUJqZK0TyumwhTNO/c2zE3BHoXyD1T+WYAPAcOfvoT3RO2ZAPWG4EwxIY9JrtXQemyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id A2F371F00036;
	Mon,  7 Jul 2025 10:40:53 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id CC830ACACFF; Mon,  7 Jul 2025 10:40:51 +0000 (UTC)
X-Spam-Level: 
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 7063AACACF9;
	Mon,  7 Jul 2025 10:40:48 +0000 (UTC)
Date: Mon, 7 Jul 2025 12:40:46 +0200
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
Message-ID: <aGukLuQ359MOyTqT@collins>
References: <20250626080923.632789-1-paulk@sys-base.io>
 <20250626080923.632789-2-paulk@sys-base.io>
 <20250704233535.4b026641@minigeek.lan>
 <20250705153825.2be2b333@minigeek.lan>
 <aGm8n_wJPiGk85E4@collins>
 <CAGb2v66s-nWA2dFRpgX6DbDET3dWOm1jPKWm1k9SmGSqhTWoWA@mail.gmail.com>
 <aGuV3gcKSRIyey53@collins>
 <CAGb2v66U94RxVTC4O-Z9Pn2RyJK5Xz=pNZCvkFN-5Ax0wG6Cug@mail.gmail.com>
 <aGud0aVLHGoql3Vj@collins>
 <CAGb2v64vCdsY7V2OsJVC+Qy+tbStYSWbh19mBrjuJMwZqUQ=Yw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C9fIKdI7w7sD5bnd"
Content-Disposition: inline
In-Reply-To: <CAGb2v64vCdsY7V2OsJVC+Qy+tbStYSWbh19mBrjuJMwZqUQ=Yw@mail.gmail.com>


--C9fIKdI7w7sD5bnd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Chen-Yu,

> > > The block is the same, but the integration is slightly different, as
> > > the register for the RGMII clock delays and other stuff is at a diffe=
rent
> > > offset in the system controller. The BSP handles this by directly
> > > including the register in the "reg" property.
> >
> > Ah I see, I forgot about the syscon register. However it doesn't seem l=
ike a
> > very good approach to have a different compatible to express the idea t=
hat an
> > external resource is different. Just like we do for clocks, resets and =
other
> > things, we should probably find a way to express the offset via some de=
dicated
> > property instead of spinning a different compatible each time it change=
s.
> >
> > > So yes, you do need a separate compatible string, if only to deal with
> > > the slight difference in the integration layer.
> >
> > So maybe an additional allwinner,syscon-offset property or a new
>=20
> If you can get that accepted, I think that works?
>=20
> > allwinner,syscon that takes the syscon phandle first and the offset sec=
ond?
>=20
> I would prefer to avoid any changes to the syscon reference that would
> require more custom code. I only just recently found that we could use
> the standard syscon code with the provider registering the syscon. We
> could drop the of_parse_phandle() + find device + dev_get_regmap() bits.
> This is partially covered in my GMAC200 series.

There is already syscon_regmap_lookup_by_phandle_args which supports generic
extra arguments to a syscon node. It just requires a custom syscon property.

I personally find this cleaner than adding a property just for the offset.

Paul

> ChenYu
>=20
> > It seems that various other platforms are doing similar things (e.g.
> > ti,syscon-pcie-mode).
> >
> > Thanks
> >
> > Paul
> >
> > >
> > > ChenYu
> > >
> > > > [0]: https://github.com/engSinteck/A133_Image/blob/main/longan/kern=
el/linux-4.9/arch/arm64/boot/dts/sunxi/sun50iw10p1.dtsi#L2016
> > > > [1]: https://github.com/engSinteck/A133_Image/blob/main/longan/kern=
el/linux-4.9/drivers/net/ethernet/allwinner/sunxi-gmac.c
> > > >
> > > > All the best,
> > > >
> > > > Paul
> > > >
> > > > >
> > > > > ChenYu
> > > > >
> > > > >
> > > > > > Cheers,
> > > > > >
> > > > > > Paul
> > > > > >
> > > > > > > Cheers,
> > > > > > > Andre.
> > > > > > >
> > > > > > > > [1]
> > > > > > > > https://github.com/qiaoweibiao/T507_Kernel/blob/main/arch/a=
rm64/boot/dts/sunxi/sun50iw10p1.dtsi
> > > > > > > >
> > > > > > > >
> > > > > > > > >
> > > > > > > > > Fixes: 473436e7647d ("pinctrl: sunxi: add support for the=
 Allwinner A100 pin controller")
> > > > > > > > > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > > > > > > > > ---
> > > > > > > > >  drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c | 32 +++++++=
+++-----------
> > > > > > > > >  1 file changed, 16 insertions(+), 16 deletions(-)
> > > > > > > > >
> > > > > > > > > diff --git a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c =
b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > > > > index b97de80ae2f3..95b764ee1c0d 100644
> > > > > > > > > --- a/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > > > > +++ b/drivers/pinctrl/sunxi/pinctrl-sun50i-a100.c
> > > > > > > > > @@ -546,33 +546,33 @@ static const struct sunxi_desc_pin =
a100_pins[] =3D {
> > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* SCK =
*/
> > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD1=
 */
> > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD1=
 */
> > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 0)),
> > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 1),
> > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > >             SUNXI_FUNCTION(0x2, "i2c0"),          /* SDA =
*/
> > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD0=
 */
> > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD0=
 */
> > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 1)),
> > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 2),
> > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* SCK =
*/
> > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXCT=
L */
> > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXCT=
L */
> > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 2)),
> > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 3),
> > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > >             SUNXI_FUNCTION(0x2, "i2c1"),          /* SDA =
*/
> > > > > > > > >             SUNXI_FUNCTION(0x3, "cir0"),          /* OUT =
*/
> > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* CLKI=
N */
> > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* CLKI=
N */
> > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 3)),
> > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 4),
> > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* TX */
> > > > > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* CS */
> > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD1=
 */
> > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD1=
 */
> > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 4)),
> > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 5),
> > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > @@ -580,14 +580,14 @@ static const struct sunxi_desc_pin =
a100_pins[] =3D {
> > > > > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* RX */
> > > > > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* CLK =
*/
> > > > > > > > >             SUNXI_FUNCTION(0x4, "ledc"),
> > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD0=
 */
> > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD0=
 */
> > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 5)),
> > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 6),
> > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* RTS =
*/
> > > > > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* MOSI=
 */
> > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXCK=
 */
> > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXCK=
 */
> > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 6)),
> > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 7),
> > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > @@ -595,7 +595,7 @@ static const struct sunxi_desc_pin a1=
00_pins[] =3D {
> > > > > > > > >             SUNXI_FUNCTION(0x2, "uart3"),         /* CTS =
*/
> > > > > > > > >             SUNXI_FUNCTION(0x3, "spi1"),          /* MISO=
 */
> > > > > > > > >             SUNXI_FUNCTION(0x4, "spdif"),         /* OUT =
*/
> > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXCT=
L */
> > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXCT=
L */
> > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 7)),
> > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 8),
> > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > @@ -611,7 +611,7 @@ static const struct sunxi_desc_pin a1=
00_pins[] =3D {
> > > > > > > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* DATA=
0 */
> > > > > > > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* CLK =
*/
> > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* BCLK=
 */
> > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* MDC =
*/
> > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* MDC =
*/
> > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 9)),
> > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 10),
> > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > @@ -619,7 +619,7 @@ static const struct sunxi_desc_pin a1=
00_pins[] =3D {
> > > > > > > > >             SUNXI_FUNCTION(0x2, "dmic"),          /* DATA=
1 */
> > > > > > > > >             SUNXI_FUNCTION(0x3, "spi2"),          /* MOSI=
 */
> > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s2"),          /* LRCK=
 */
> > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* MDIO=
 */
> > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* MDIO=
 */
> > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 10)),
> > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 11),
> > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > @@ -642,33 +642,33 @@ static const struct sunxi_desc_pin =
a100_pins[] =3D {
> > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > >             SUNXI_FUNCTION(0x3, "i2c3"),          /* SCK =
*/
> > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* MCLK=
 */
> > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* EPHY=
 */
> > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* EPHY=
 */
> > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 13)),
> > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 14),
> > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* BCLK=
 */
> > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD3=
 */
> > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD3=
 */
> > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 14)),
> > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 15),
> > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3"),          /* LRCK=
 */
> > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXD2=
 */
> > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXD2=
 */
> > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 15)),
> > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 16),
> > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout0"),    /* DOUT=
0 */
> > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din1"),     /* DIN1=
 */
> > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* RXCK=
 */
> > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* RXCK=
 */
> > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 16)),
> > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 17),
> > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > >             SUNXI_FUNCTION(0x1, "gpio_out"),
> > > > > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout1"),    /* DOUT=
1 */
> > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din0"),     /* DIN0=
 */
> > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD3=
 */
> > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD3=
 */
> > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 17)),
> > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 18),
> > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > > > @@ -676,7 +676,7 @@ static const struct sunxi_desc_pin a1=
00_pins[] =3D {
> > > > > > > > >             SUNXI_FUNCTION(0x2, "cir0"),          /* OUT =
*/
> > > > > > > > >             SUNXI_FUNCTION(0x3, "i2s3_dout2"),    /* DOUT=
2 */
> > > > > > > > >             SUNXI_FUNCTION(0x4, "i2s3_din2"),     /* DIN2=
 */
> > > > > > > > > -           SUNXI_FUNCTION(0x5, "emac0"),         /* TXD2=
 */
> > > > > > > > > +           SUNXI_FUNCTION(0x5, "emac"),          /* TXD2=
 */
> > > > > > > > >             SUNXI_FUNCTION_IRQ_BANK(0x6, 6, 18)),
> > > > > > > > >   SUNXI_PIN(SUNXI_PINCTRL_PIN(H, 19),
> > > > > > > > >             SUNXI_FUNCTION(0x0, "gpio_in"),
> > > > > > > >
> > > > > > > >
> > > > > > >
> > > > > >
> > > > > > --
> > > > > > Paul Kocialkowski,
> > > > > >
> > > > > > Independent contractor - sys-base - https://www.sys-base.io/
> > > > > > Free software developer - https://www.paulk.fr/
> > > > > >
> > > > > > Expert in multimedia, graphics and embedded hardware support wi=
th Linux.
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

--C9fIKdI7w7sD5bnd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmhrpC4ACgkQhP3B6o/u
lQy8QA//XenBbpTvLHsGWu9PxUvbf77YvyGDPemCbvMmSpTNxpI05Yym1TOeYzzR
JLtaKAOr7ormM3fPL13Va6oM3RIppzmO4IgzcuwTLo0f+ZIUOLC0JVX9Y6TCng6o
qiuiFkpJsVpXgou5SpL8gXtUUDhL1GoJMH06Kjye2D2TWDej9TbtZyXvq+hyczXm
RabSlwZZAcVZXiG1ss+T/f9zM7DrmIRIgf3XJzRef2ZnWOH6dh/T19xw0xyUDBSM
TDizZSNHNkmRiTgdCzcboPO88LngNIHEOmx01KPv6ZBoRQMLcUnsQtXCGFoNJgMq
nFFHbvE4QHF2NZT2tfbJYV1FC+7vGP0IzNZqZOJd8KK8e+sWvxC56NI5DX8MiVeh
lODOLiucelJdebxha83DhQw6ru9VgqYMbO4mS94CRnA5IbL58t+klgZifcTBPzTl
SnaziS7SFHiewCPD36K46iQBnSozsLiW3aBxxhm/fW+UFbsSuR39rJ7ORk6OP/SD
VPUbywACS3tFITTi2IPFJ6/1N/Aqihkd66H2bJX/W3EVkVmEEauqZWB3zD/76CVJ
wE69p8cbdNoW7SX6PAA1B7MNl30P/OHMsVeO5GK1tkp0TTZhcJyTiD8hGuZArzJU
47HXKePmFcHP3uMQgfn0y/kZYxwcktah7yd39rnKKoqGptXPYRM=
=rH3n
-----END PGP SIGNATURE-----

--C9fIKdI7w7sD5bnd--

