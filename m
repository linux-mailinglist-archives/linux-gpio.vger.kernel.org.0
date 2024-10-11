Return-Path: <linux-gpio+bounces-11188-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0946099A438
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 14:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8890F1F23AB3
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Oct 2024 12:54:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 435112178FF;
	Fri, 11 Oct 2024 12:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="VbVHhWG9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA732141B5;
	Fri, 11 Oct 2024 12:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728651250; cv=none; b=irnQLVS28giAFBl/F7n/OxN1zFp5ROKbT+a3m7EKDZc3DouAUVpLoiIuM5KQFEWRwhlriaq9A426mJsGuqUB+NyjvJUhqyZnZDp4MULlyQ2cMM684UQGZsDWJ6w9YaoCkXEFHWxzDZBYG3qit/s0R940H28Rlg3FH9Z3ucfVg34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728651250; c=relaxed/simple;
	bh=MPJGN4wESKD2gf1aeyittLoAkXe9uQPgjXC70LtSMww=;
	h=MIME-Version:Message-ID:From:To:Cc:Subject:Content-Type:Date:
	 In-Reply-To:References; b=WUObPLlbpEqO8aVLQyki08//B6G/q0frOifja9YOPZ3X1RoonWemzatYexkcWwIV6cp5/2BXz+aeiXBTqgEjGASgr8ma+5PDdUwkf8KxeOjDdnMvNOcpB+LKAW0wju9HSs60Vo0lRX9O4DeRZeeYjoTITbhA3GAhNkysfxo4gb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=VbVHhWG9; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1728651225; x=1729256025; i=frank-w@public-files.de;
	bh=pqvc/oNdc0PsTL4Mg/npxkx7wLb4cU550Stv88W38fY=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=VbVHhWG9+1LYA64yWGRqSuFuTZcKnbTMJ8xHVIzVFCVSSBgU8c5IbpTHIYrSD4GX
	 Hqlm9X/rRBn+uLYkMrqNjShSMMM1HnGIQRBqmmqMAofMqkuuh6POzQeV6L5nbVwQE
	 gKOctFEK9wQshGuL4ryAWGjN0cMdN3oiBg+64TAvkfKU6kE356/v+Hbyj18U28pXu
	 lQQFQMeX3lgMl/wLgCkBZ2Q1J8kYy9YAnr0Ns+hURU+ncsibAaGlYDS6Kh2Mc0vdm
	 WhVqLV5iCMv/CZHSUQA3S3nhRq1yC2aqDdEH7sO55EUsPgzmX/2nsIehssqTN61yz
	 vTOR00LqC6/TosoGYg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.153.152] ([217.61.153.152]) by web-mail.gmx.net
 (3c-app-gmx-bs32.server.lan [172.19.170.84]) (via HTTP); Fri, 11 Oct 2024
 14:53:45 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <trinity-090e30b8-45a9-4a2b-98f1-e34904616b2d-1728651225070@3c-app-gmx-bs32>
From: Frank Wunderlich <frank-w@public-files.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <linux@fw-web.de>, Linus Walleij
 <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang
 <sean.wang@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 daniel@makrotopia.org, john@phrozen.org, ansuelsmth@gmail.com,
 eladwf@gmail.com
Subject: Aw: Re: [PATCH v4 4/4] arm64: dts: mediatek: mt7988: add pinctrl
 support
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Oct 2024 14:53:45 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <4ac4c8ab-4180-4fcc-9e48-6dede7448dee@collabora.com>
References: <20241009165222.5670-1-linux@fw-web.de>
 <20241009165222.5670-5-linux@fw-web.de>
 <4ac4c8ab-4180-4fcc-9e48-6dede7448dee@collabora.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:VxR+ZCvzqrITMlxMKyyrVv8NDsGfVlHJ/2Z23LevYUCc5uV8UGtaX6lN/ACVGdM03ILKp
 bOgLorgQbXbzYxD2pyvuSfOyfquZSDSHGu91cK0Njkk8EoGf5++nrgQyLSGy/8H0J8IZ/X5DnJGw
 wg0W4NB8dwPR5ewIk7yABHDMYo38Jm4Icwru1ycLZ7yB/qC4B8P5faVOmeyCwtfNKVo3roSH6B9m
 weglWLqYNQDRScUgpPT/FYUzVRIQ5SvLlUpzjLaKDbMa5BPjszG6r6znArn2a+pb9pPX4eI5Xnn5
 2I=
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:HIN9WLpnYPY=;Jq8RJJfCG9pX1doLo0aeI2OltCi
 32OT7k4Bii7ka3FBvIrwHGBuuKkkt8EDbnrTzTfoY/3cPtm51HIu6OGD2DO1JU7I6N5Uw+6wr
 0y8J8x4A3Nxq8909Rqh2MosGf/qmWMM2cK+ToFU34s3tnAzKVGaL1HNYmms9AKX3cFyj4gM48
 qi5eWI4Li46x6mRJj90UETSmoidoTVwnJdvQTVtUwx9hNS99fylk+j1bkn3Slgyo/ajqPfFZM
 8EgB0UWZLzbjnPKneDkccEpTuaYDLP4KW/7aKuod3rTlha7TPs9PSGaeI99wwATa7oW3mlCtW
 h/pE7eOOWkmA87oJjDU5tkmwsk0gkUyTDmH6a8HqC3EVKCWeLxlMLKPRqLHGLbsGzkscw02uc
 ZOih3uPLU9VVVSPY+0fIZrcth87O2F4buyZKyMaCmH2eZ0eK7P3HJVMamLdiIGOfqYS+JMf1G
 h3QK3qoMzggDSIiN2/CRq+dEDHssQZuTc0ncM65Y8OdfAylj6deNIyXVYBaYjfj839QcAn1xR
 hfTeVsAYs38ciejWOIfqUGAMJhzk0tB/1ZJjen8sGD8d3Wt2qJHH8K/yz+YwFA0VnMzRbp+8W
 tDS4IFgmNMllbGvgOu11VPJHO1Ctjj4wOQbY7181TdCKrlnyjkLuRB+RsB7KVNAJkT8Z/1IFD
 nHNQLNudg3oqNFLd+aK/hjDQp6S230E+dmwCHOg0rw==
Content-Transfer-Encoding: quoted-printable

Hi

> Gesendet: Donnerstag, 10. Oktober 2024 um 14:36 Uhr
> Von: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.c=
om>
> Betreff: Re: [PATCH v4 4/4] arm64: dts: mediatek: mt7988: add pinctrl su=
pport
>
> Il 09/10/24 18:52, Frank Wunderlich ha scritto:
> > From: Frank Wunderlich <frank-w@public-files.de>
> >
> > Add mt7988a pinctrl node.
> >
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > ---
> > v2:
> > - fix wrong alignment of reg values
> > ---
> >   arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 241 ++++++++++++++++++++=
++
> >   1 file changed, 241 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/bo=
ot/dts/mediatek/mt7988a.dtsi
> > index c9649b815276..7e15934efe0b 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
> > @@ -3,6 +3,7 @@
> >   #include <dt-bindings/clock/mediatek,mt7988-clk.h>
> >   #include <dt-bindings/interrupt-controller/arm-gic.h>
> >   #include <dt-bindings/phy/phy.h>
> > +#include <dt-bindings/pinctrl/mt65xx.h>
> >
> >   / {
> >   	compatible =3D "mediatek,mt7988a";
> > @@ -105,6 +106,246 @@ clock-controller@1001e000 {
> >   			#clock-cells =3D <1>;
> >   		};
> >
> > +		pio: pinctrl@1001f000 {
> > +			compatible =3D "mediatek,mt7988-pinctrl";
> > +			reg =3D <0 0x1001f000 0 0x1000>,
> > +			      <0 0x11c10000 0 0x1000>,
> > +			      <0 0x11d00000 0 0x1000>,
> > +			      <0 0x11d20000 0 0x1000>,
> > +			      <0 0x11e00000 0 0x1000>,
> > +			      <0 0x11f00000 0 0x1000>,
> > +			      <0 0x1000b000 0 0x1000>;
> > +			reg-names =3D "gpio", "iocfg_tr",
> > +				    "iocfg_br", "iocfg_rb",
> > +				    "iocfg_lb", "iocfg_tl", "eint";
> > +			gpio-controller;
> > +			#gpio-cells =3D <2>;
> > +			gpio-ranges =3D <&pio 0 0 84>;
> > +			interrupt-controller;
> > +			interrupts =3D <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-parent =3D <&gic>;
> > +			#interrupt-cells =3D <2>;
> > +
> > +			mdio0_pins: mdio0-pins {
> > +				mux {
> > +					function =3D "eth";
> > +					groups =3D "mdc_mdio0";
> > +				};
> > +
> > +				conf {
> > +					pins =3D "SMI_0_MDC", "SMI_0_MDIO";
> > +					drive-strength =3D <MTK_DRIVE_8mA>;
>
> Please do *not* use the MTK_DRIVE_(x)mA definitions anymore.
>
> Here it is `drive-strength =3D <8>`.

OK

> > +				};
> > +			};
> > +
> > +			i2c0_pins: i2c0-g0-pins {
> > +				mux {
> > +					function =3D "i2c";
> > +					groups =3D "i2c0_1";
> > +				};
> > +			};
> > +
> > +			i2c1_pins: i2c1-g0-pins {
> > +				mux {
> > +					function =3D "i2c";
> > +					groups =3D "i2c1_0";
> > +				};
> > +			};
>
> Whatever pin can be configured with one or multiple groups that can be d=
ifferent
> must *not* be in the SoC dtsi, but rather in the *board* dts(i) file, as=
 the wanted
> configuration of those pins is *not* soc-specific but board-specific.
>
>  From a fast look, I can see that at least the I2C pins can be assigned =
to different
> functions: for example, pins 15+16 can be either of i2c0_1, *or* u30_phy=
_i2c0, *or*
> u32_phy_i2c0, *or* xfi_phy0_i2c1 ... or others, even.
>
> Finally - I think that *most* of the muxing that you're declaring here m=
ust instead
> go to your board specific devicetree and not in mt7988a.dtsi.

As far as i see also mdio and uart0 sharing pins with other pin definition=
s.
It looks for me that nearly all (except pcie) needs to go in board(s) dts =
then...
imho this creates duplicates of same nodes, if 2 boards using the same pin=
conf.
But if it is the way to go, i drop all subnodes except the pcie-pins.

> Cheers,
> Angelo

regards Frank

