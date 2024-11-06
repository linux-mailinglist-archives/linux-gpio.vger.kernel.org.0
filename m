Return-Path: <linux-gpio+bounces-12622-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA1C9BE3BA
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 11:09:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D482C1F23766
	for <lists+linux-gpio@lfdr.de>; Wed,  6 Nov 2024 10:09:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47E531DDC2B;
	Wed,  6 Nov 2024 10:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="Cyj05UIY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-43166.protonmail.ch (mail-43166.protonmail.ch [185.70.43.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ECD91DDC03;
	Wed,  6 Nov 2024 10:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730887750; cv=none; b=nsKHXndIUrXNFx+BywaFiW/x26iTIVnepQh43sBvD9iSSQrhhAetlJmjm4QroEnbdBugBU4QGqiIRHZ2wtDnwd8qrEL4GZpihyElBJIn626gu1gd9kfHXVTcYesiwHBs9HJCra3Ql3NMZCvG3EEPWOAPE/ZpO53OoA/+su6p0yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730887750; c=relaxed/simple;
	bh=w8f6EHwbpuXfJsXd4Hk0fYwMmDt3B1x7ZQQNymSJp28=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nv0Fkdor74GivJDC+Ik8kaznRlCnPwuv8cDcPCc3c9vLEk7R/38qFDEIlSUKbdgq8s1ktON1c2XWpKyinXXbsa8ap2e35StqwalXQzDAs8O9eosuhPZHCbsSTZfY2ubm9yBRqNuc6kVzs8h9ne5/AvuARLHq1ayqs6rHoUUozp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com; spf=pass smtp.mailfrom=protonmail.com; dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com header.b=Cyj05UIY; arc=none smtp.client-ip=185.70.43.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=protonmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1730887746; x=1731146946;
	bh=w8f6EHwbpuXfJsXd4Hk0fYwMmDt3B1x7ZQQNymSJp28=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=Cyj05UIYud+EGWKbDL/T2w+9INhPklVEKHI7ivjAwEMZIpfgBI6O9maYfGY2BeIJn
	 e3xIn6yAisX2lPmR75opQnoz7GMJ2S/KNG2Qo9ewQI4O6cqogYLD7pJG1ScG3REj//
	 NZzqL9qRna02ShS2BgJRkRsekOqZOioNym0LPxBW/goeHMxnPTYV1zK5mPMAA77qkJ
	 mh7X3MIlRHqUe0PKBkIl74IAuZuFzPd3vtVR1fcvu4fIrRZGaWeDgFcEUcZkMeRY8E
	 u3sYeIXcsBq78bbcgYYL0HrEqdCJJ9oEmlUZ/7coCy2sH9uwvhan6wHDbZnVuS3sUQ
	 9gMd2/JqodGYQ==
Date: Wed, 06 Nov 2024 10:09:03 +0000
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andy Teng <andy.teng@mediatek.com>
From: Yassine Oudjana <y.oudjana@protonmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>, Yassine Oudjana <yassine.oudjana@gmail.com>, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH v7 4/7] arm64: dts: mediatek: mt6797: Make pin configuration nodes follow DT bindings
Message-ID: <20241106100741.173825-5-y.oudjana@protonmail.com>
In-Reply-To: <20241106100741.173825-1-y.oudjana@protonmail.com>
References: <20241106100741.173825-1-y.oudjana@protonmail.com>
Feedback-ID: 6882736:user:proton
X-Pm-Message-ID: 16d86c1d179cbb388235fe4342731305526f5975
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add -pins suffix to pin configuration nodes to follow DT bindings
and pass dtbs_check.

Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabor=
a.com>
---
 arch/arm64/boot/dts/mediatek/mt6797.dtsi | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/dts=
/mediatek/mt6797.dtsi
index 0e9d11b4585be..a786d1d08f683 100644
--- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
@@ -135,70 +135,70 @@ pio: pinctrl@10005000 {
 =09=09gpio-controller;
 =09=09#gpio-cells =3D <2>;
=20
-=09=09uart0_pins_a: uart0 {
+=09=09uart0_pins_a: uart0-pins {
 =09=09=09pins0 {
 =09=09=09=09pinmux =3D <MT6797_GPIO234__FUNC_UTXD0>,
 =09=09=09=09=09 <MT6797_GPIO235__FUNC_URXD0>;
 =09=09=09};
 =09=09};
=20
-=09=09uart1_pins_a: uart1 {
+=09=09uart1_pins_a: uart1-pins {
 =09=09=09pins1 {
 =09=09=09=09pinmux =3D <MT6797_GPIO232__FUNC_URXD1>,
 =09=09=09=09=09 <MT6797_GPIO233__FUNC_UTXD1>;
 =09=09=09};
 =09=09};
=20
-=09=09i2c0_pins_a: i2c0 {
+=09=09i2c0_pins_a: i2c0-pins {
 =09=09=09pins0 {
 =09=09=09=09pinmux =3D <MT6797_GPIO37__FUNC_SCL0_0>,
 =09=09=09=09=09 <MT6797_GPIO38__FUNC_SDA0_0>;
 =09=09=09};
 =09=09};
=20
-=09=09i2c1_pins_a: i2c1 {
+=09=09i2c1_pins_a: i2c1-pins {
 =09=09=09pins1 {
 =09=09=09=09pinmux =3D <MT6797_GPIO55__FUNC_SCL1_0>,
 =09=09=09=09=09 <MT6797_GPIO56__FUNC_SDA1_0>;
 =09=09=09};
 =09=09};
=20
-=09=09i2c2_pins_a: i2c2 {
+=09=09i2c2_pins_a: i2c2-pins {
 =09=09=09pins2 {
 =09=09=09=09pinmux =3D <MT6797_GPIO96__FUNC_SCL2_0>,
 =09=09=09=09=09 <MT6797_GPIO95__FUNC_SDA2_0>;
 =09=09=09};
 =09=09};
=20
-=09=09i2c3_pins_a: i2c3 {
+=09=09i2c3_pins_a: i2c3-pins {
 =09=09=09pins3 {
 =09=09=09=09pinmux =3D <MT6797_GPIO75__FUNC_SDA3_0>,
 =09=09=09=09=09 <MT6797_GPIO74__FUNC_SCL3_0>;
 =09=09=09};
 =09=09};
=20
-=09=09i2c4_pins_a: i2c4 {
+=09=09i2c4_pins_a: i2c4-pins {
 =09=09=09pins4 {
 =09=09=09=09pinmux =3D <MT6797_GPIO238__FUNC_SDA4_0>,
 =09=09=09=09=09 <MT6797_GPIO239__FUNC_SCL4_0>;
 =09=09=09};
 =09=09};
=20
-=09=09i2c5_pins_a: i2c5 {
+=09=09i2c5_pins_a: i2c5-pins {
 =09=09=09pins5 {
 =09=09=09=09pinmux =3D <MT6797_GPIO240__FUNC_SDA5_0>,
 =09=09=09=09=09 <MT6797_GPIO241__FUNC_SCL5_0>;
 =09=09=09};
 =09=09};
=20
-=09=09i2c6_pins_a: i2c6 {
+=09=09i2c6_pins_a: i2c6-pins {
 =09=09=09pins6 {
 =09=09=09=09pinmux =3D <MT6797_GPIO152__FUNC_SDA6_0>,
 =09=09=09=09=09 <MT6797_GPIO151__FUNC_SCL6_0>;
 =09=09=09};
 =09=09};
=20
-=09=09i2c7_pins_a: i2c7 {
+=09=09i2c7_pins_a: i2c7-pins {
 =09=09=09pins7 {
 =09=09=09=09pinmux =3D <MT6797_GPIO154__FUNC_SDA7_0>,
 =09=09=09=09=09 <MT6797_GPIO153__FUNC_SCL7_0>;
--=20
2.47.0



