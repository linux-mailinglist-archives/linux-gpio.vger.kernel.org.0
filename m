Return-Path: <linux-gpio+bounces-23730-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D9DB1048F
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 10:49:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C2B57BB6B6
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 08:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32FEA2D1F4A;
	Thu, 24 Jul 2025 08:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XtkoGg1U"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B2B2D12F3;
	Thu, 24 Jul 2025 08:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753346436; cv=none; b=jBzEOvqFX/pQP7vdyvASG1vWv/VxytNHw1odczTeFYbRJauLUZ2idArYHq/feaSTHy54c5mTpb5FqY1/9OSCOOM6NsdnTTPQzZU6guKh4gdl6+1INC/BdaAlbgn7R5stpWVTI3OR12SxhLbcdR1FlqZEjSYCexWSsCMT8FXgna4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753346436; c=relaxed/simple;
	bh=9fKIYjIV4SGt7rPXJPvy/SpLKjsqtMdVmIqKKyBRmX0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t+HyCFVaeIxAQ9GgYxbsN3GR5+LqypaQzE6cBGbFM+aibBai60wZX0ZnrDNNH5UT1+Y2aZjJVhxZRnnJCq+jJBQFOZUGyItXAknfz0jX+xZnG+vwm0lTAQwdKYoz0pwCkNnVbOv7r6Mrm9U03QOuuIffvauPy9+1g88nGqt7z0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XtkoGg1U; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346431;
	bh=9fKIYjIV4SGt7rPXJPvy/SpLKjsqtMdVmIqKKyBRmX0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XtkoGg1UWqDhQ7Vb1svrYHeYg3br8OxgQy7pXTi0Q7POqcmfx6TDd2q6RYEP6/o8l
	 nt1cyFs6YalHENJAuPfpmR9iF1w9p8CLXGMRcLmSdJNRxYqZJkntzFvza82o0rZ1Zd
	 vRJeOq0w+ZSeK/x7achH0qXcSe/2tO2ATNl1A64kUIGmaA76P8zMLGw6EHvkn3K2ut
	 B4f5NUgmsYm/8ab8KzZNnFj9bt3GIbWPvKYcrGyxNoVmtQ0gyiqIaffjHxqW9VewRF
	 5ZCQT/6onF9khBboqUhC81P0zg4Hoq1Mgx51zh1Mx4QoFCDpAb22vUoFg51+gjOzHH
	 Ay2ajyoiVZJbA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 38A9617E128C;
	Thu, 24 Jul 2025 10:40:29 +0200 (CEST)
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
Subject: [PATCH 25/38] arm64: dts: mediatek: mt7986a-bpi-r3: Set interrupt-parent to mdio switch
Date: Thu, 24 Jul 2025 10:39:01 +0200
Message-ID: <20250724083914.61351-26-angelogioacchino.delregno@collabora.com>
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

Being this an interrupt controller, the binding forbids to use
interrupts-extended and wants an `interrupts` property instead.

Since this interrupt controller's parent is on the GPIO controller
set it as interrupt-parent and change interrupts-extended to just
interrupts to silence a dtbs_check warning.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index 6d2762866a1a..e7654dc9a1c9 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -200,8 +200,9 @@ switch: switch@31 {
 		compatible = "mediatek,mt7531";
 		reg = <31>;
 		interrupt-controller;
+		interrupt-parent = <&pio>;
+		interrupts = <66 IRQ_TYPE_LEVEL_HIGH>;
 		#interrupt-cells = <1>;
-		interrupts-extended = <&pio 66 IRQ_TYPE_LEVEL_HIGH>;
 		reset-gpios = <&pio 5 GPIO_ACTIVE_HIGH>;
 	};
 };
-- 
2.50.1


