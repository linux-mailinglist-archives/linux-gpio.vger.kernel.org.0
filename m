Return-Path: <linux-gpio+bounces-23721-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C1582B10458
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 10:46:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DA19AC0B4D
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 08:45:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DAF129ACDE;
	Thu, 24 Jul 2025 08:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="lqXA9ki8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B2B29AAE7;
	Thu, 24 Jul 2025 08:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753346412; cv=none; b=GFqV2sIYtSexNB1mo8GoAFSXq66sktrawddcjkGKnVx36YJTJB3jI87dUL+0jwemvLCW2KIqOpY6lNY/H1UEKyhRV/P1brBc1a7ptPIF/zL0kOGFrGB6up7df1YLpA+9EZgL9l8lKSbiKWS7XG5u5dfmRCWKC0NzPKWbK4Zt1pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753346412; c=relaxed/simple;
	bh=gf4raA9j+BGKXJSgdcYYQ5vEY6BH8O/FUlxlqXN71dU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SfpSRiQbCLPxAo/JdPRQnh0kHYfAffI2JYQc3lhFhC1+M1FWGXsPbVpo5Dk3zpoIo5Q3QzTsfSGNpnsMrjfRcakBSdkOPUSccC2M1IBH4AYSaoI1NuG0/hUcwD6ZiKwRj8fQW9I79HkDEKipAhqRny80ireOaDVmy8a5AbHdwwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=lqXA9ki8; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346407;
	bh=gf4raA9j+BGKXJSgdcYYQ5vEY6BH8O/FUlxlqXN71dU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lqXA9ki8jasg9cH7aH4lQyyCLQLCXwU9w46XhkSIqxrQB1khgkTVp4OabvSh24+Wv
	 pbEqBl6+O2Z6lq7EHp0dpDyrUqn0Idf2EBkd4wvKdXNmMLzaHaAiaWUVPX8G4f564x
	 gGQ87t4IqVzCIwjlCZ/sSqaZAfajlOb7O6thWifophHWR2fAgwcWEjiIb/kuqOMRnT
	 Bvv+zXixGeEwNH+BLRCvFK77Rl2NQMtS9lTHcSZFBD/luE5rSMVLYPvR85vmoGugFm
	 Ihgbv5oJytoh987L/n+iQlryDQSfXh4XElhDJ/sNWoLZBHtZ5de0PwaDdoSxdAvOfA
	 Yj7x+H6qfXH3Q==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6388817E128C;
	Thu, 24 Jul 2025 10:40:05 +0200 (CEST)
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
Subject: [PATCH 16/38] arm64: dts: mediatek: mt6331: Fix pmic, regulators, rtc, keys node names
Date: Thu, 24 Jul 2025 10:38:52 +0200
Message-ID: <20250724083914.61351-17-angelogioacchino.delregno@collabora.com>
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

The node names for "pmic", "regulators", "rtc", and "keys" are
dictated by the PMIC MFD binding: change those to adhere to it.

Fixes: aef783f3e0ca ("arm64: dts: mediatek: Add MT6331 PMIC devicetree")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6331.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6331.dtsi b/arch/arm64/boot/dts/mediatek/mt6331.dtsi
index d89858c73ab1..243afbffa21f 100644
--- a/arch/arm64/boot/dts/mediatek/mt6331.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6331.dtsi
@@ -6,12 +6,12 @@
 #include <dt-bindings/input/input.h>
 
 &pwrap {
-	pmic: mt6331 {
+	pmic: pmic {
 		compatible = "mediatek,mt6331";
 		interrupt-controller;
 		#interrupt-cells = <2>;
 
-		mt6331regulator: mt6331regulator {
+		mt6331regulator: regulators {
 			compatible = "mediatek,mt6331-regulator";
 
 			mt6331_vdvfs11_reg: buck-vdvfs11 {
@@ -258,7 +258,7 @@ mt6331_vrtc_reg: ldo-vrtc {
 			};
 
 			mt6331_vdig18_reg: ldo-vdig18 {
-				regulator-name = "dvdd18_dig";
+				regulator-name = "vdig18";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-ramp-delay = <0>;
@@ -266,11 +266,11 @@ mt6331_vdig18_reg: ldo-vdig18 {
 			};
 		};
 
-		mt6331rtc: mt6331rtc {
+		mt6331rtc: rtc {
 			compatible = "mediatek,mt6331-rtc";
 		};
 
-		mt6331keys: mt6331keys {
+		mt6331keys: keys {
 			compatible = "mediatek,mt6331-keys";
 			power {
 				linux,keycodes = <KEY_POWER>;
-- 
2.50.1


