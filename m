Return-Path: <linux-gpio+bounces-23777-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC22AB107DB
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 12:36:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3225BAA4A98
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 10:35:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C46312673B9;
	Thu, 24 Jul 2025 10:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b="J9z+BkZj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2A08218E91;
	Thu, 24 Jul 2025 10:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753353373; cv=none; b=F+Nffg6mAskTvHBgNuYLQ/x0VZirE8us+ES0cXXVcrXGlnt4hZQrqSy6BMwiQH10Tx3XRjpBg/IKbKHV/KliMgZz44Xw3PEWysX9B0WL2cRJEbGIajlJITs7RefFQbKqIadCp0kQmD+qrA+tc9uaP3Vigk1YdDgYef8gnALzvoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753353373; c=relaxed/simple;
	bh=od/xtHdR76xA66uiqHmn0euNvOxFQUSMktMhwNkDo3M=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=P19+nrV6xo+SaiKJTBlQWr48gLoaKC3ccC0gr4ClEgHePb6wO00nftaCNpJWR02PCE9zJRiGhQvwIqx1XXHU5ECwwFPlSAO/m/Jtt3I4iJOjZy7joXsjhlWQzl4UURy9neHzvMyqf6+hftkX0B/Bpf0dEn5WpOFZRU+SCJL12xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de; spf=pass smtp.mailfrom=public-files.de; dkim=pass (2048-bit key) header.d=public-files.de header.i=frank-w@public-files.de header.b=J9z+BkZj; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=public-files.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=public-files.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1753353342; x=1753958142; i=frank-w@public-files.de;
	bh=qwlcmLAbRr/MQRSxhxjFBqTr2CYUizJoPcZmxNDBDks=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=J9z+BkZjf/3pjoMBKQ93ZNsxGhw7Zxdh8y4xg7zbiy4DSaQ1ePRJQs2YkfcpTYnb
	 md8nMxMdY/TMXuKoKHkEywgXE1w3+wVBUaABS2tZDmZ/YV7QRCaBfY4JnvXC9jKPi
	 RT1tq8gcEqqjnIn/R/Bk8j1AvE0+xGYiYLVL2dnqPhYZEyAzkzu6COE0HC1y36Ulc
	 /u9ZFI0u75euPWamsARzcyiKWc4oVSCPhLUeK0iNoZHOvZDZezygyLhA0rrvOJtfl
	 rDmc9aAW05+fe4eC3lwaLN9Z0yxZPLdeXPoLJMUxd80i33UCjtqbV2MZ9vKeiI6BR
	 vuJDYtLquF2SrGnqpg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [IPv6:::1] ([80.187.69.140]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MzhnN-1uSBvr1TE1-00qu8U; Thu, 24
 Jul 2025 12:35:42 +0200
Date: Thu, 24 Jul 2025 12:35:32 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, robh@kernel.org
CC: herbert@gondor.apana.org.au, davem@davemloft.net, krzk+dt@kernel.org,
 conor+dt@kernel.org, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, jassisinghbrar@gmail.com,
 mchehab@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, chunfeng.yun@mediatek.com,
 vkoul@kernel.org, kishon@kernel.org, sean.wang@kernel.org,
 linus.walleij@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
 andersson@kernel.org, mathieu.poirier@linaro.org, daniel.lezcano@linaro.org,
 tglx@linutronix.de, atenart@kernel.org, jitao.shi@mediatek.com,
 ck.hu@mediatek.com, houlong.wei@mediatek.com,
 kyrie.wu@mediatek.corp-partner.google.com, andy.teng@mediatek.com,
 tinghan.shen@mediatek.com, jiaxin.yu@mediatek.com, shane.chien@mediatek.com,
 olivia.wen@mediatek.com, granquet@baylibre.com, eugen.hristev@linaro.org,
 arnd@arndb.de, sam.shih@mediatek.com, jieyy.yang@mediatek.com,
 mwalle@kernel.org, fparent@baylibre.com, linux-crypto@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_27/38=5D_arm64=3A_dts=3A_mediatek=3A_m?=
 =?US-ASCII?Q?t7988a=3A_Fix_PCI-Express_T-PHY_node_address?=
User-Agent: K-9 Mail for Android
Reply-to: frank-w@public-files.de
In-Reply-To: <20250724083914.61351-28-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-28-angelogioacchino.delregno@collabora.com>
Message-ID: <E00D9C7A-CEC6-4BB3-8568-CC54C80E1F9F@public-files.de>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:nkz0xBWOn6njT18nQoUfw6V1GVlL8WpIemZpMHLlbE8QqNvMruQ
 Dw1Pn/9vrDC5T+QE1uC+gQrBvCbuCBubKZuNY/QtmAr8uYJpemV1UWgy1GRhjhzujMe4Sno
 OFT//bgrHPOQkyWfSsQl5jIAop0RmK2bQYCM8GBsuQbZ18A3HnORU53wBCWooCm/gqkZStX
 r26BYjnhKxDQSZciDLXoQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LqPQEsDz8IY=;vMKO03lm15WSc5MEUEg0Iky4Zzx
 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

Am 24=2E Juli 2025 10:39:03 MESZ schrieb AngeloGioacchino Del Regno <angelo=
gioacchino=2Edelregno@collabora=2Ecom>:
>The PCIe and USB TPHYs are under the soc bus, which provides MMIO,
>and all nodes under that must use the bus, otherwise those would
>clearly be out of place=2E
>
>Add ranges to both the tphy(s) and assign the address to the main
>node to silence a dtbs_check warning, and fix the children to
>use the MMIO range of t-phy=2E
>
>Fixes: ("f693e6ba55ae arm64: dts: mediatek: mt7988: Add t-phy for ssusb1"=
)
>Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino=2Edelregno@co=
llabora=2Ecom>
>---
> arch/arm64/boot/dts/mediatek/mt7988a=2Edtsi | 28 +++++++++++------------
> 1 file changed, 14 insertions(+), 14 deletions(-)
>
>diff --git a/arch/arm64/boot/dts/mediatek/mt7988a=2Edtsi b/arch/arm64/boo=
t/dts/mediatek/mt7988a=2Edtsi
>index 560ec86dbec0=2E=2Ecc0d3e3f4374 100644
>--- a/arch/arm64/boot/dts/mediatek/mt7988a=2Edtsi
>+++ b/arch/arm64/boot/dts/mediatek/mt7988a=2Edtsi
>@@ -629,20 +629,20 @@ pcie_intc1: interrupt-controller {
> 		tphy: t-phy@11c50000 {
> 			compatible =3D "mediatek,mt7986-tphy",
> 				     "mediatek,generic-tphy-v2";
>-			#address-cells =3D <2>;
>-			#size-cells =3D <2>;
>-			ranges;
>+			#address-cells =3D <1>;
>+			#size-cells =3D <1>;
>+			ranges =3D <0 0 0x11c50000 0x1000>;
> 			status =3D "disabled";
>=20
>-			tphyu2port0: usb-phy@11c50000 {
>-				reg =3D <0 0x11c50000 0 0x700>;
>+			tphyu2port0: usb-phy@0 {
>+				reg =3D <0 0x700>;
> 				clocks =3D <&infracfg CLK_INFRA_USB_UTMI_CK_P1>;
> 				clock-names =3D "ref";
> 				#phy-cells =3D <1>;
> 			};
>=20
>-			tphyu3port0: usb-phy@11c50700 {
>-				reg =3D <0 0x11c50700 0 0x900>;
>+			tphyu3port0: usb-phy@700 {
>+				reg =3D <0 0x700 0 0x900>;

This one looks wrong to me

I guess it should be=20

reg =3D <0x700 0x900>;

> 				clocks =3D <&infracfg CLK_INFRA_USB_PIPE_CK_P1>;
> 				clock-names =3D "ref";
> 				#phy-cells =3D <1>;
>@@ -659,20 +659,20 @@ topmisc: system-controller@11d10084 {
> 		xsphy: xs-phy@11e10000 {
> 			compatible =3D "mediatek,mt7988-xsphy",
> 				     "mediatek,xsphy";
>-			#address-cells =3D <2>;
>-			#size-cells =3D <2>;
>-			ranges;
>+			#address-cells =3D <1>;
>+			#size-cells =3D <1>;
>+			ranges =3D <0 0 0x11e10000 0x3900>;
> 			status =3D "disabled";
>=20
>-			xphyu2port0: usb-phy@11e10000 {
>-				reg =3D <0 0x11e10000 0 0x400>;
>+			xphyu2port0: usb-phy@0 {
>+				reg =3D <0 0x400>;
> 				clocks =3D <&infracfg CLK_INFRA_USB_UTMI>;
> 				clock-names =3D "ref";
> 				#phy-cells =3D <1>;
> 			};
>=20
>-			xphyu3port0: usb-phy@11e13000 {
>-				reg =3D <0 0x11e13400 0 0x500>;
>+			xphyu3port0: usb-phy@3400 {
>+				reg =3D <0x3400 0x500>;
> 				clocks =3D <&infracfg CLK_INFRA_USB_PIPE>;
> 				clock-names =3D "ref";
> 				#phy-cells =3D <1>;

Hi Angelo,

thanks for taking case of many of current binding errors (only wondering a=
bout this one as i had checked it before sending upstream)=2E
regards Frank

