Return-Path: <linux-gpio+bounces-23728-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1D3B10481
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 10:48:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA1AF4E59DD
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 08:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17C882D0C6E;
	Thu, 24 Jul 2025 08:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="gNyq6E8V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDF62C3761;
	Thu, 24 Jul 2025 08:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753346429; cv=none; b=RxkwYUMtx9kE15sGiCPtroR9zQEqiMIEj5McqaVRuuhx7pZvy76y9D2z/W2gci5YoDoCaJgvPHaY8VtPWALnl/qWtkYE61lkQooGZX0e7wvMIJgP5+wYZkNA7bWsYhiteKMaxzRZE9nF3TOqO9nfvifRNrM8VW2hyJ7qQ5RyFg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753346429; c=relaxed/simple;
	bh=tywNfUc5hMA17GgyzX00W7JAF7OL9B5T8aE+/2RSWWE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WO0PVe/jA+KFb+LCP61MO2AV9eefO0UAR6uigil7vy1RzDayZ4s9aqe8+ZSkIS7JQvEGVU83bVzBGcZFPGdolecMm0nlQ5TZcHUp8uZJDxR1r62Cq0W+GuPoo77CVp1CiKvDej56SbGSPh7g4+2cOpgPoxpqD7FB/kV0i3UGy5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=gNyq6E8V; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346426;
	bh=tywNfUc5hMA17GgyzX00W7JAF7OL9B5T8aE+/2RSWWE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gNyq6E8Vj3fgcYuIbvQjaLEmve4N2FgVaLzaQLVxQ0jEhimWKlbdGQGD3/fZW877l
	 DkOSQEKUzNEaojXUjC7l3yHFTV0F6x54lD1ft0DjYgnYWf1FwRSkF7d9Al1Ri02+lB
	 GZNNT3USU9B9aKflscPMqTgymt6TbFOAo8vwe/+u8CfI99tJKibx61ZM0UdzV72q88
	 9/a/1Jifv3ZAJy9bjQkfopIPxbbEorurjD7EldiS7NptQBmIbTrjFxSX+CgzymFtpg
	 fmNpJnlnFdSLaOmeHEeYYjQd4NYZe6Ov0YKi/E/oVRak2Pgm3513SVt+NePLtBOlbL
	 8SLXVQKs3WRSQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E495217E0FC2;
	Thu, 24 Jul 2025 10:40:23 +0200 (CEST)
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
Subject: [PATCH 23/38] arm64: dts: mediatek: mt7986a: Fix PCI-Express T-PHY node address
Date: Thu, 24 Jul 2025 10:38:59 +0200
Message-ID: <20250724083914.61351-24-angelogioacchino.delregno@collabora.com>
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

The PCIe TPHY is under the soc bus, which provides MMIO, and all
nodes under that must use the bus, otherwise those would clearly
be out of place.

Add ranges to the PCIe tphy and assign the address to the main
node to silence a dtbs_check warning, and fix the children to
use the MMIO range of t-phy.

Fixes: 963c3b0c47ec ("arm64: dts: mediatek: fix t-phy unit name")
Fixes: 918aed7abd2d ("arm64: dts: mt7986: add pcie related device nodes")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 559990dcd1d1..3211905b6f86 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -428,16 +428,16 @@ pcie_intc: interrupt-controller {
 			};
 		};
 
-		pcie_phy: t-phy {
+		pcie_phy: t-phy@11c00000 {
 			compatible = "mediatek,mt7986-tphy",
 				     "mediatek,generic-tphy-v2";
-			ranges;
-			#address-cells = <2>;
-			#size-cells = <2>;
+			ranges = <0 0 0x11c00000 0x20000>;
+			#address-cells = <1>;
+			#size-cells = <1>;
 			status = "disabled";
 
-			pcie_port: pcie-phy@11c00000 {
-				reg = <0 0x11c00000 0 0x20000>;
+			pcie_port: pcie-phy@0 {
+				reg = <0 0x20000>;
 				clocks = <&clk40m>;
 				clock-names = "ref";
 				#phy-cells = <1>;
-- 
2.50.1


