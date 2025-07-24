Return-Path: <linux-gpio+bounces-23727-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40079B10474
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 10:48:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 345F058816D
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 08:47:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3895A277C8F;
	Thu, 24 Jul 2025 08:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YUcauFlv"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221E42C1599;
	Thu, 24 Jul 2025 08:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753346427; cv=none; b=Z3GxpldVAX5kWaa//4qralvdSvyl5/oGHoX9/fm9cQynlRYrpMi/CejiLsfjoS+aVCv+sSUtCP+5ncBJ/jEXz2W3ZD5TlmIAXKNKeOSUt5nQhEMZI1pUR7YlbqNoYYlmM7T39toJzSk/4dpJJfgvCOBemohrAfxV3OA39aSN4gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753346427; c=relaxed/simple;
	bh=HmcM0WeCZU7S4LzqqW3oQHysgDBq3tk4yf4yJqDJOZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G9uElcqS/i+UcVxlrShkXMd12imy0aambv5VDi9KBoFyW3KMbLbw9lb5Jb0KUGeo/6WJv+8nGhlA4c/EbMRNl++vPT9wJDgZvWvNOnt/1SJKvSVHjWhBgG1PxAwo0tW1jLhmAwjjKDx91fP+yY4372GncAySShoV3whtAZVj0rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YUcauFlv; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346423;
	bh=HmcM0WeCZU7S4LzqqW3oQHysgDBq3tk4yf4yJqDJOZY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YUcauFlv/b9vDuXRLNiXYP5fX6JLVhE2p5S2nlvhh8SjU50Eebfq3Km5CMp8paEVi
	 xMIYIYOZjSGJ2BmtPCEHEZisaGV2nY2me9bSngW4ysRMzTnLqsfKj47VMO//FEhSZ4
	 wWiz/zHDd18LGWCFuls9E2VjeKey52GoZ7U43O5foDLbDoG3rOJysSu8ZmsJQH1Zgq
	 wdIaPt6lTMkADy/C/REo+6HH4P2zKErEBI3VSFtofio5OdnBqWoiAlffopBK627c0+
	 wSx5wrl8I6jIGHoQjAcyz083dAlke8YtbqxH7JaUzcDsuT4r7dgkPsrElJ8EVmD/Er
	 Cj4JPDO2tipDw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 464D117E1110;
	Thu, 24 Jul 2025 10:40:21 +0200 (CEST)
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
Subject: [PATCH 22/38] arm64: dts: mediatek: Fix node name for SYSIRQ controller on all SoCs
Date: Thu, 24 Jul 2025 10:38:58 +0200
Message-ID: <20250724083914.61351-23-angelogioacchino.delregno@collabora.com>
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

The sysirq has "intpol-controller" as node name, but being this an
interrupt controller, it needs to be named "interrupt-controller"
as per what the bindings (correctly) expect.

This commit brings no functional changes, but fixes a dtbs_check
warning.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6755.dtsi | 2 +-
 arch/arm64/boot/dts/mediatek/mt6779.dtsi | 2 +-
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 2 +-
 arch/arm64/boot/dts/mediatek/mt6797.dtsi | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt6755.dtsi b/arch/arm64/boot/dts/mediatek/mt6755.dtsi
index b55d3fac9bd4..8da5c0a56a02 100644
--- a/arch/arm64/boot/dts/mediatek/mt6755.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6755.dtsi
@@ -98,7 +98,7 @@ timer {
 			     (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
 	};
 
-	sysirq: intpol-controller@10200620 {
+	sysirq: interrupt-controller@10200620 {
 		compatible = "mediatek,mt6755-sysirq",
 			     "mediatek,mt6577-sysirq";
 		interrupt-controller;
diff --git a/arch/arm64/boot/dts/mediatek/mt6779.dtsi b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
index 5c579e88e749..70f3375916e8 100644
--- a/arch/arm64/boot/dts/mediatek/mt6779.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6779.dtsi
@@ -138,7 +138,7 @@ ppi_cluster1: interrupt-partition-1 {
 
 		};
 
-		sysirq: intpol-controller@c53a650 {
+		sysirq: interrupt-controller@c53a650 {
 			compatible = "mediatek,mt6779-sysirq",
 				     "mediatek,mt6577-sysirq";
 			interrupt-controller;
diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index 38f65aad2802..58833e5135c8 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -404,7 +404,7 @@ pwrap: pwrap@1000d000 {
 			clock-names = "spi", "wrap";
 		};
 
-		sysirq: intpol-controller@10200620 {
+		sysirq: interrupt-controller@10200620 {
 			compatible = "mediatek,mt6795-sysirq",
 				     "mediatek,mt6577-sysirq";
 			interrupt-controller;
diff --git a/arch/arm64/boot/dts/mediatek/mt6797.dtsi b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
index f2d93bf6a055..8ac98a378fd6 100644
--- a/arch/arm64/boot/dts/mediatek/mt6797.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6797.dtsi
@@ -228,7 +228,7 @@ apmixedsys: apmixed@1000c000 {
 		#clock-cells = <1>;
 	};
 
-	sysirq: intpol-controller@10200620 {
+	sysirq: interrupt-controller@10200620 {
 		compatible = "mediatek,mt6797-sysirq",
 			     "mediatek,mt6577-sysirq";
 		interrupt-controller;
-- 
2.50.1


