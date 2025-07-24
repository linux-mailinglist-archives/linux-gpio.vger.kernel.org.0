Return-Path: <linux-gpio+bounces-23729-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D02E6B10488
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 10:49:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BE624E62FE
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 08:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B02632D12E1;
	Thu, 24 Jul 2025 08:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="LBRcX8RJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952082D0C7F;
	Thu, 24 Jul 2025 08:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753346432; cv=none; b=ItKViK1eppUOB2PG+NGoMCsq/q4l/Yz6PAxn2vSMUE75EyloNKrEmmDaFevzDOXMlzDidTcB72xPQVIeZpvUSefNscBN5P/Nndv2g1mM1f7kYnIju5l1RxbNfnb33QsHlpFBebi1ZcGutGJfmvHn0VR0zpcjArurn6p1t9NUe3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753346432; c=relaxed/simple;
	bh=0DgY9cU46pjIhmPm0+MTo+Bi+k/CtkPLKu052hg+mTE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YsqgI8RavtlErpFsRRFuvPJELAokeqW8wBZtFojfpw/vAbmgXAuFV2t8T0X0C9zUB07dt3OS/QFI0du8FSxcl/57ZWihT0B8oOmE4a9H/wbmrjo2cTHdXxO7DMko1Qdoyu/38lxJqeQabCxPG/aZbjAXzAknpk2hqfhhRVpaiLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=LBRcX8RJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346429;
	bh=0DgY9cU46pjIhmPm0+MTo+Bi+k/CtkPLKu052hg+mTE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LBRcX8RJRFSQT2v9ykuBE9DYadrEmw/VH4l4PViELy9uGyfu7sBNIYEyR3fsx1kiZ
	 yTvrHatS5O6PJ+ii0OMChdf8AzMm0991NFmPobbKE+NoWWszZe2SWf/TXFcYbPs8me
	 r2pv6TlaplaOtPvQKgPCv/j0Cxi/GS9NLiZeu5jESIZvaN6CNjHKFmEE/gTSyex+eX
	 HPnFTVp+sbXcQodsiTdV0ag69QUbgzsuydtrfmkWT8OygG5/mWHQ14ZPG5Ib7icIG9
	 aroAydfviw/i0f495KFi+ws5GHPFcvYGuc902otlo/U7muKMXmD5g9GRAvkpRiokrY
	 u4KPQ8nfoh4rg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8E93B17E11EE;
	Thu, 24 Jul 2025 10:40:26 +0200 (CEST)
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
Subject: [PATCH 24/38] arm64: dts: mediatek: mt7986a-bpi-r3: Fix SFP I2C node names
Date: Thu, 24 Jul 2025 10:39:00 +0200
Message-ID: <20250724083914.61351-25-angelogioacchino.delregno@collabora.com>
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

The binding wants the node to be named "i2c-number", alternatively
"i2c@address", but those are named "i2c-gpio-number" instead.

Rename those to i2c-0, i2c-1 to adhere to the binding and suppress
dtbs_check warnings.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index ed79ad1ae871..6d2762866a1a 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -64,23 +64,19 @@ wps-key {
 	};
 
 	/* i2c of the left SFP cage (wan) */
-	i2c_sfp1: i2c-gpio-0 {
+	i2c_sfp1: i2c-0 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&pio 16 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&pio 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		i2c-gpio,delay-us = <2>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 	};
 
 	/* i2c of the right SFP cage (lan) */
-	i2c_sfp2: i2c-gpio-1 {
+	i2c_sfp2: i2c-1 {
 		compatible = "i2c-gpio";
 		sda-gpios = <&pio 18 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		scl-gpios = <&pio 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
 		i2c-gpio,delay-us = <2>;
-		#address-cells = <1>;
-		#size-cells = <0>;
 	};
 
 	leds {
-- 
2.50.1


