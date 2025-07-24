Return-Path: <linux-gpio+bounces-23724-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D197B10486
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 10:49:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 831827BBD3A
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 08:45:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E38E2BE7D7;
	Thu, 24 Jul 2025 08:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UeuzP731"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A9A2BE643;
	Thu, 24 Jul 2025 08:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753346418; cv=none; b=S080jMCbW88X7YojqXPRLIpRTSUof6Wk15+aEdqCYkAAoUqFUQurPLMM06zdUSIeiua0gcArulEoww5MAmcpnxGTg9Fzd3EGSThA8sad+zzveYDWUFn42gLWDvm0JvwB875RcdMelfXpAqTVOOFpSIAasm6xr4FNxrjJ/0w37l4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753346418; c=relaxed/simple;
	bh=Vv0shnN9g1ePIaORYYq4AyKEuij4pF1KI9I2e0+TYB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ct+ZozQP93+hFFtSKbAsJbma8TVZ6Mj8Mj6MzwsvcOig4hCeiGu45cdIkfT0nu4n9muslmqeqhvA42BQAdCeaOL/vPbv2MrTp32hwq/7IrgsffvTQW6s+0VzShfdBwob3sbRiEfbuXY8rNDTOKu11PwuL7UpR1fn4yFuDvCqQLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UeuzP731; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346415;
	bh=Vv0shnN9g1ePIaORYYq4AyKEuij4pF1KI9I2e0+TYB8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UeuzP731yFY5Q9EFmtrRdH0PJV1QSUFS2GBCAM/cBWNi1E1vp9zrFZVHDkyFncbrp
	 f3SBoo3L88z/N5w8F4+vXn8LYm157by9xTOq/KSHLGEv3jpYm3ZDK73IqzBwQv/Dq7
	 V6S7BW4Wzyj4XjCCNbxUJgWEyrvAP9s+kHr11EzFU3ojylvxr15LpjYoxrx5JcdJ0A
	 vWe8034BRxuhRmDRRQiU18NT/uLkiCWSQtIxA2orLQI5KJI12gJ7OgDdRD52fJFSeP
	 ZVH5LXcOKlws3QAAdxX3mF+b7KIGUH0jpKkbt00fJ7Iyq+bCsfpSIvWeaoYnQizmMp
	 9MlKWkFBk2vJA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5616517E11EE;
	Thu, 24 Jul 2025 10:40:13 +0200 (CEST)
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
Subject: [PATCH 19/38] arm64: dts: mediatek: mt6795: Add mediatek,infracfg to iommu node
Date: Thu, 24 Jul 2025 10:38:55 +0200
Message-ID: <20250724083914.61351-20-angelogioacchino.delregno@collabora.com>
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

The "M4U" IOMMU requires a handle to the infracfg to switch to
the 4gb/pae addressing mode: add it.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index e5e269a660b1..38f65aad2802 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -427,6 +427,7 @@ iommu: iommu@10205000 {
 			clocks = <&infracfg CLK_INFRA_M4U>;
 			clock-names = "bclk";
 			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_LOW>;
+			mediatek,infracfg = <&infracfg>;
 			mediatek,larbs = <&larb0 &larb1 &larb2 &larb3>;
 			power-domains = <&spm MT6795_POWER_DOMAIN_MM>;
 			#iommu-cells = <1>;
-- 
2.50.1


