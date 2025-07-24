Return-Path: <linux-gpio+bounces-23723-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47136B10457
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 10:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1CB4A189FFB4
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 08:46:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDC692BE62F;
	Thu, 24 Jul 2025 08:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="M1PkibsZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B8427144C;
	Thu, 24 Jul 2025 08:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753346416; cv=none; b=mOTB2EOUKks/Dswaa/E7XIqzbcj0iEbiZ+Vl0VKb9gxxlk43DYDIlXUgucTctMeunVlIxPa5m3FowVy0Xo7G7WX0cwbCiGeT3863hW/IE33nGb7V7WWgX1Ksd0F3RXNjW8Z6/VSjZuHL66pt37qUY6iFcZKEYtNaMn+OlNbL2MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753346416; c=relaxed/simple;
	bh=U0NhcerLHh1oCate+eEdvddToxEmvxRAGAsruPXeFfk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s5a772fYphCIn//Gsxpm8Hm2PgV7yy0KC6d+gfiBPad9sAzg8Hj79Tk8DHRoZv5AD2IG0d+ScEzMOBezswK2icrg2/hNwVFp71b1bIIFt061AyEBAC7nZy3EMhjnXozpOeZqUkFObUcdneOxU3LnSq7aG2YO/tfgOAJ/ZWgnLrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=M1PkibsZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346413;
	bh=U0NhcerLHh1oCate+eEdvddToxEmvxRAGAsruPXeFfk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M1PkibsZJVm4lfM/B30w/FE1YR1hdRpr+dgUH6D+9x3tT6+5tdd+5ekkdsFw5YFOt
	 iVmsu1Tib12DcEhckh+r1cx+EIJ9NTC97S1zvhgxFBoV1O+gCGqmRbPnoJgtLN6yN5
	 gK0Tnt8NLLW4CNplefG8yj7yws83ZT5puhFYR/DT5akTyq0UwPkxS1ia4segWdk1IT
	 HNZEIc5PPMCeBU0gAVMLO/5s4UdDcTxbltNXIdjxdM3W4dxib6xUXmKyl9sG6uUKMq
	 VeK5bRPgOxovc9+NtBJUZ8QqBj8VLsw2or3cw6rn45q+UuRUNH6MsUvLL6h4t77Zus
	 EebcnjLnf4a1Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ADD6217E0FC2;
	Thu, 24 Jul 2025 10:40:10 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	robh@kernel.org
Cc: herbert@gondor.apana.org.au,
	davem@davemloft.net,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	jassisinghbrar@gmail.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chunfeng.yun@mediatek.com,
	vkoul@kernel.org,
	kishon@kernel.org,
	sean.wang@kernel.org,
	linus.walleij@linaro.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	atenart@kernel.org,
	jitao.shi@mediatek.com,
	ck.hu@mediatek.com,
	houlong.wei@mediatek.com,
	kyrie.wu@mediatek.corp-partner.google.com,
	andy.teng@mediatek.com,
	tinghan.shen@mediatek.com,
	jiaxin.yu@mediatek.com,
	shane.chien@mediatek.com,
	olivia.wen@mediatek.com,
	granquet@baylibre.com,
	eugen.hristev@linaro.org,
	arnd@arndb.de,
	sam.shih@mediatek.com,
	jieyy.yang@mediatek.com,
	frank-w@public-files.de,
	mwalle@kernel.org,
	fparent@baylibre.com,
	linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 18/38] arm64: dts: mediatek: mt6797: Remove bogus id property in i2c nodes
Date: Thu, 24 Jul 2025 10:38:54 +0200
Message-ID: <20250724083914.61351-19-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

All of the I2C nodes in this devicetree has a bogus "id" property,
which was probably specifying the I2C bus number.

This property was never parsed and never used - and besides, it
also gives dtbs_check warnings: remove it from all i2c nodes.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6797.dtsi | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
index be401617dfd8..f2d93bf6a055 100644
--- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
@@ -285,7 +285,6 @@ uart3: serial@11005000 {
 	i2c0: i2c@11007000 {
 		compatible = "mediatek,mt6797-i2c",
 			     "mediatek,mt6577-i2c";
-		id = <0>;
 		reg = <0 0x11007000 0 0x1000>,
 		      <0 0x11000100 0 0x80>;
 		interrupts = <GIC_SPI 84 IRQ_TYPE_LEVEL_LOW>;
@@ -301,7 +300,6 @@ i2c0: i2c@11007000 {
 	i2c1: i2c@11008000 {
 		compatible = "mediatek,mt6797-i2c",
 			     "mediatek,mt6577-i2c";
-		id = <1>;
 		reg = <0 0x11008000 0 0x1000>,
 		      <0 0x11000180 0 0x80>;
 		interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_LOW>;
@@ -317,7 +315,6 @@ i2c1: i2c@11008000 {
 	i2c8: i2c@11009000 {
 		compatible = "mediatek,mt6797-i2c",
 			     "mediatek,mt6577-i2c";
-		id = <8>;
 		reg = <0 0x11009000 0 0x1000>,
 		      <0 0x11000200 0 0x80>;
 		interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_LOW>;
@@ -334,7 +331,6 @@ i2c8: i2c@11009000 {
 	i2c9: i2c@1100d000 {
 		compatible = "mediatek,mt6797-i2c",
 			     "mediatek,mt6577-i2c";
-		id = <9>;
 		reg = <0 0x1100d000 0 0x1000>,
 		      <0 0x11000280 0 0x80>;
 		interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_LOW>;
@@ -351,7 +347,6 @@ i2c9: i2c@1100d000 {
 	i2c6: i2c@1100e000 {
 		compatible = "mediatek,mt6797-i2c",
 			     "mediatek,mt6577-i2c";
-		id = <6>;
 		reg = <0 0x1100e000 0 0x1000>,
 		      <0 0x11000500 0 0x80>;
 		interrupts = <GIC_SPI 88 IRQ_TYPE_LEVEL_LOW>;
@@ -367,7 +362,6 @@ i2c6: i2c@1100e000 {
 	i2c7: i2c@11010000 {
 		compatible = "mediatek,mt6797-i2c",
 			     "mediatek,mt6577-i2c";
-		id = <7>;
 		reg = <0 0x11010000 0 0x1000>,
 		      <0 0x11000580 0 0x80>;
 		interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_LOW>;
@@ -383,7 +377,6 @@ i2c7: i2c@11010000 {
 	i2c4: i2c@11011000 {
 		compatible = "mediatek,mt6797-i2c",
 			     "mediatek,mt6577-i2c";
-		id = <4>;
 		reg = <0 0x11011000 0 0x1000>,
 		      <0 0x11000300 0 0x80>;
 		interrupts = <GIC_SPI 90 IRQ_TYPE_LEVEL_LOW>;
@@ -399,7 +392,6 @@ i2c4: i2c@11011000 {
 	i2c2: i2c@11013000 {
 		compatible = "mediatek,mt6797-i2c",
 			     "mediatek,mt6577-i2c";
-		id = <2>;
 		reg = <0 0x11013000 0 0x1000>,
 		      <0 0x11000400 0 0x80>;
 		interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_LOW>;
@@ -416,7 +408,6 @@ i2c2: i2c@11013000 {
 	i2c3: i2c@11014000 {
 		compatible = "mediatek,mt6797-i2c",
 			     "mediatek,mt6577-i2c";
-		id = <3>;
 		reg = <0 0x11014000 0 0x1000>,
 		      <0 0x11000480 0 0x80>;
 		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>;
@@ -433,7 +424,6 @@ i2c3: i2c@11014000 {
 	i2c5: i2c@1101c000 {
 		compatible = "mediatek,mt6797-i2c",
 			     "mediatek,mt6577-i2c";
-		id = <5>;
 		reg = <0 0x1101c000 0 0x1000>,
 		      <0 0x11000380 0 0x80>;
 		interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_LOW>;
-- 
2.50.1


