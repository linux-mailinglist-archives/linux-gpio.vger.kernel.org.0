Return-Path: <linux-gpio+bounces-23736-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2B9B104A2
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 10:50:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C486E1CC7C73
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 08:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DDE02D4B4B;
	Thu, 24 Jul 2025 08:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="jcDhqYSI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25182D4B57;
	Thu, 24 Jul 2025 08:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753346450; cv=none; b=hOsGa8W2UnyescP4i2jZXt3/OkR20Ml37SDr2HseyyKqzTEyoQ/zKHUxfU/AqoV+QsZLgIoj43UvuO7yCQA/Nb0YWL5aoA/11OJFW5iFpxh4/Tv02C0cSFS/xiEmchHwJ0hIUeiwhsA+BnXcWEYX8yA4D9Qz20KNYsoTVVW+2MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753346450; c=relaxed/simple;
	bh=nZnHGuuYWTH1zx2DyHhgxmYu9OJdEA9xz3dWYroEllI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=akqKL1fetr9UQCpvj7bXg6nRwtyDDxiXz2zVhKEhjpTxyCiKa/Z01XT8E21iwmTF8eV8xnxD6bDnRb3eh07MCeQA5vbdMj2nS62rPu4SHXPbE6IVZN1s21UcFGf2Rantx7TV5MiwTrAMY7adzfON8JnzwTsRoCK+YZeoJ0unYz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=jcDhqYSI; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346447;
	bh=nZnHGuuYWTH1zx2DyHhgxmYu9OJdEA9xz3dWYroEllI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jcDhqYSIdrwK2mCvZxTpy4ObfcEL3WJnEph9w4Wfhdit0UfyR74/OYWdgSZZSPhoo
	 Y3kigBPXlubGLRnd2Ne/uBtsqfr3mDqkDyMFH3DG5DRfAjKNJ+tCgwo4AoBt0QykTK
	 Z7XXkqzVD/uxxlgf+EO8x2j9R6Ty6yIrPHPh+khYad8AMbjlaHrpkVZ+6+ODpAjgSa
	 nJUiA8lblEOxSOlp3cxc6y3O4cL1Uh7FMlasmyXrKyqbarLXC/PKf2Du9adIlLHd2p
	 R7/PSCWhe0QDAD5DQVHmVEgN9NjjgBJBZS0beExlCu2MMoPK1Ok41Yw6I5QmP/o1AM
	 PYLlNNaWRA+7A==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1C52717E1062;
	Thu, 24 Jul 2025 10:40:45 +0200 (CEST)
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
Subject: [PATCH 31/38] arm64: dts: mediatek: mt8183-pumpkin: Add power supply for CCI
Date: Thu, 24 Jul 2025 10:39:07 +0200
Message-ID: <20250724083914.61351-32-angelogioacchino.delregno@collabora.com>
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

Add a power supply for the Cache Coherent Interconnect node as it
is required to perform CPU DVFS because both are scaling together.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
index dbdee604edab..d5fcb010e1ac 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts
@@ -482,6 +482,10 @@ &mfg {
 	domain-supply = <&mt6358_vgpu_reg>;
 };
 
+&cci {
+	proc-supply = <&mt6358_vproc12_reg>;
+};
+
 &cpu0 {
 	proc-supply = <&mt6358_vproc12_reg>;
 };
-- 
2.50.1


