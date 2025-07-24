Return-Path: <linux-gpio+bounces-23740-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D2AB1050C
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 10:58:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6222B7BE45A
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 08:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CA762D97B0;
	Thu, 24 Jul 2025 08:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="leJi8Mqp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8192A2D8783;
	Thu, 24 Jul 2025 08:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753346461; cv=none; b=TKhPPIVVnoigF3JmG75+0hIEcmiVsFixxiRYXZa9DYSMcJmpNuHqGLO4azbh0HGVMQmSK1wySgFdRnXH741vnae0tGiRFkK3Sds/sE2MKu3wUwoe86Kb1ZP+pcEgH7IWfH5gLnNRp54eh8dHpRrqKceni1gJRE5enXEKKHa8qkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753346461; c=relaxed/simple;
	bh=ujVdYOL/kD6nq4vkzbaijjYm7dNaRsIKSU9o/0er5HI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qy1ezDoWNqqX23COYWW/zmYI5tbGkHclrOVr8DzmRVzp4pNhtCSUVdBDTbxpc5jaU6Xd3AtucvuZxUXKjWM90GkUK/RSxP6IGEN1DUaWAWWZ1hAuNgg6Un1ty0p+ae7/BlameJ77RPajbqN7kFvRbDhej/akEh6Z+J8pyIM29zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=leJi8Mqp; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346458;
	bh=ujVdYOL/kD6nq4vkzbaijjYm7dNaRsIKSU9o/0er5HI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=leJi8MqpM1LFfjdNNUZhgteybFuRy2qMNZ5aNDLl7SrT8+QpHpAG1pu6r3dR4xroT
	 NaaXgJrG9tVUdrw14YtwRdLDJKoEPg0N5w0na+smo0JcnSWzV/XnrteBtQ/By5Fd2z
	 AgZ3xJ1pKafoz927DhxGJ8JsNUYCL/MY0kXOIRwCIdve0aAxOfkZdOEjEF3SAXxri7
	 tJBcl2WMX9ukok/tRPn2vIoBVJm9dtgx8R7sgEl6ogITLwG5XiEeR53+ICQU6IUJy6
	 hHPTg04wXXbLRui45XH28kbMZdNC9nFUVK9IM98TpBNA7IGusA6yf2xYyrdaYjfvS+
	 plLudM1jVUBFg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A60F617E108A;
	Thu, 24 Jul 2025 10:40:55 +0200 (CEST)
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
Subject: [PATCH 35/38] arm64: dts: mediatek: mt8195-cherry: Move VBAT-supply to Tomato R1/R2
Date: Thu, 24 Jul 2025 10:39:11 +0200
Message-ID: <20250724083914.61351-36-angelogioacchino.delregno@collabora.com>
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

Move the VBAT supply to mt8195-cherry-tomato-{r1,r2} as this power
supply is named like that only for the Realtek RT5682i codec.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts | 1 +
 arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts | 1 +
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi          | 1 -
 3 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
index a82d716f10d4..a50b4e8efaba 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r1.dts
@@ -13,6 +13,7 @@ / {
 &audio_codec {
 	compatible = "realtek,rt5682i";
 	realtek,btndet-delay = <16>;
+	VBAT-supply = <&pp3300_z5>;
 };
 
 &sound {
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
index 2d6522c144b7..a8657c0068d5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry-tomato-r2.dts
@@ -13,6 +13,7 @@ / {
 &audio_codec {
 	compatible = "realtek,rt5682i";
 	realtek,btndet-delay = <16>;
+	VBAT-supply = <&pp3300_z5>;
 };
 
 &pio_default {
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index e70599807bb1..d40f4c1b9766 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -535,7 +535,6 @@ audio_codec: codec@1a {
 
 		AVDD-supply = <&mt6359_vio18_ldo_reg>;
 		MICVDD-supply = <&pp3300_z2>;
-		VBAT-supply = <&pp3300_z5>;
 	};
 };
 
-- 
2.50.1


