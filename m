Return-Path: <linux-gpio+bounces-23741-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E37B104E9
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 10:54:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 266E77B96E8
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 08:50:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 502922DAFBE;
	Thu, 24 Jul 2025 08:41:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YPe5uV2p"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75866279917;
	Thu, 24 Jul 2025 08:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753346464; cv=none; b=B+eZpPStTuZmwkjc5SRX0Ine6s9bJlB0I8/df2rZ7FrNyunbVEp+jYflzMSMw+1OUJTFhX1Yofkf8T0R0367R4uzt+LkTVRjnrp6iBEpW3aA5vjkqiZuQMxfk5WLy3Db5DItLHyRpMyHP4vrJEPIj5SOqSrJIFXTQxQh9nY/rq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753346464; c=relaxed/simple;
	bh=isBcp22K4ow+WwdLtmfT8eS5RNhAYShdyGLUfi1Qu/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mE4p2Eju6yzsC+htDG04Ht1NvY6Z7gVbIyCQrOcMI7Kh/eKkgXVrCNzojIBmKjFgMyw5Jcy262zF3e0ANHZSwe4VYiN9nPMzqpWUvih1X7X7rkM9TFF4IY4YOgP8CVRwIwcszFxLQgpvsgyjyjqvprnwlN8OYrN6nffmSxtbFt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YPe5uV2p; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346460;
	bh=isBcp22K4ow+WwdLtmfT8eS5RNhAYShdyGLUfi1Qu/k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YPe5uV2pDuw1U0jY1d+yJY6bMNp5dERWkNdlL0QglioHjCPsArwEd8SCpGPQWqTo+
	 SYyhQJRBE3rDdl/X0TwKbAK1Q2LxbUrcBIfsRS/tcv1ZfleQVz5NJeycQkeWpc5laf
	 CJaUbz5jXjGDXOdhYNHBgXrjwdqiWugCM+JwQA8PIa8pYSoqY55Jcoe421gxT75fzP
	 ll8zcQEA7XpjYXvVHtT409AUyVdIoV31Hct0g3E+5Ol9bf9qjL4l8KEcGrEfPXzS5n
	 gTN0A7Zi7EKqqiCbViC43QCktjNSZzZpGt83FIntyVCF52O+SWLYC8kznPUjdWoqCw
	 H1i7Vlgwyr1Pg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4DFFC17E0C96;
	Thu, 24 Jul 2025 10:40:58 +0200 (CEST)
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
Subject: [PATCH 36/38] arm64: dts: mediatek: mt8195-cherry: Add missing regulators to rt5682
Date: Thu, 24 Jul 2025 10:39:12 +0200
Message-ID: <20250724083914.61351-37-angelogioacchino.delregno@collabora.com>
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

Add the missing DBVDD and LDO1-IN power supplies to the codec
node as both RT5682i and RT5682s require those.

This commit only fixes a dtbs_check warning but doesn't produce
any functional changes because the VIO18 LDO is already powered
on because it's assigned as AVDD supply anyway.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
index d40f4c1b9766..b3761b80cac7 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
@@ -534,7 +534,9 @@ audio_codec: codec@1a {
 		realtek,jd-src = <1>;
 
 		AVDD-supply = <&mt6359_vio18_ldo_reg>;
+		DBVDD-supply = <&mt6359_vio18_ldo_reg>;
 		MICVDD-supply = <&pp3300_z2>;
+		LDO1-IN-supply = <&mt6359_vio18_ldo_reg>;
 	};
 };
 
-- 
2.50.1


