Return-Path: <linux-gpio+bounces-23720-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CB30B10461
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 10:46:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 76DA87BA9CF
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 08:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE6B429A9E1;
	Thu, 24 Jul 2025 08:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="K4W8XI2u"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1672777E1;
	Thu, 24 Jul 2025 08:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753346409; cv=none; b=MK7Z1t4deLnfmC6b2JmcMcssJuJOVyQm7QY1s5lZKfeeJtcbTRd8nc0TQeppXfkLiS0WjESt+st0RyBPRG/knUiIRHIGTFalr761ytRRrztAi9w0hWukzLS1JtD4vvrYEhXflRmpbjMRov3fN6KByHOte/hGEsPZ8CAsflok2p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753346409; c=relaxed/simple;
	bh=zcY6uixOKmgsG390lY8yjsxAZ7IOK+MdAKUlFrBCbSE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sZxyR+SoMAzvnfsMzrsR7Yp+tB6V0qV4tCQTUSRHvv0GJOD9MrtmhHis4T/zCrhBe0SA7s1iQNKnG4gGd4KWET40UmbqrdxkDy+q45b6fh+TkSnTSbdb3I8o1CuBCCetA61KsxVbVMpG3eMMGGZz4xUm+pF8pgZ4scdEHuNmWgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=K4W8XI2u; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346405;
	bh=zcY6uixOKmgsG390lY8yjsxAZ7IOK+MdAKUlFrBCbSE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K4W8XI2uE0OOilyU6OFwbaIasgN3IdwzN5wzOns+tcvMWd9KxtwyOS1Y7dMXw8tep
	 pWFlkTvh7lHlM2FlKX3qG+qEqKdz4P6Da+MZDIfGZ9YGA00agCTLQqtAxODCsXLFLJ
	 nmSxSgAr42nlNcPvn7sVQUXrjsUKPASnZqC1Hu7qt/GS+ESCmGQHyQLU3f6DvGAV1b
	 yKJDJ+8hOgj8MDWtyzKc1ORkpFa5eFF3kJJLJobcaztYJHVgwmKgo0q5e8ezMLvNFK
	 Slrn09Q/kh5NpSpakWLJOL/vHgqAI3OwP8tDuUBnvhPFfl1X7rLlgchc4RpGEDJ7fd
	 ebcaqT6JLJlGQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BC34517E1298;
	Thu, 24 Jul 2025 10:40:02 +0200 (CEST)
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
Subject: [PATCH 15/38] dt-bindings: phy: mediatek,hdmi-phy: Fix clock output names for MT8195
Date: Thu, 24 Jul 2025 10:38:51 +0200
Message-ID: <20250724083914.61351-16-angelogioacchino.delregno@collabora.com>
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

For all of the HDMI PHYs compatible with the one found on MT8195
the output clock has a different datasheet name and specifically
it is called "hdmi_txpll", differently from the older HDMI PHYs
which output block is called "hdmitx_dig_cts".

Add a conditional to allow the new clock output name on all of the
HDMI PHY IPs that are perfectly compatible with MT8195.

Fixes: c78fe548b062 ("dt-bindings: phy: mediatek: hdmi-phy: Add mt8195 compatible")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/phy/mediatek,hdmi-phy.yaml       | 25 ++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
index f3a8b0b745d1..f1207aea8605 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
@@ -26,6 +26,10 @@ properties:
           - enum:
               - mediatek,mt7623-hdmi-phy
           - const: mediatek,mt2701-hdmi-phy
+      - items:
+          - enum:
+              - mediatek,mt8188-hdmi-phy
+          - const: mediatek,mt8195-hdmi-phy
       - const: mediatek,mt2701-hdmi-phy
       - const: mediatek,mt8173-hdmi-phy
       - const: mediatek,mt8195-hdmi-phy
@@ -41,9 +45,7 @@ properties:
     items:
       - const: pll_ref
 
-  clock-output-names:
-    items:
-      - const: hdmitx_dig_cts
+  clock-output-names: true
 
   "#phy-cells":
     const: 0
@@ -76,6 +78,23 @@ required:
   - "#phy-cells"
   - "#clock-cells"
 
+if:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - mediatek,mt8195-hdmi-phy
+then:
+  properties:
+    clock-output-names:
+      items:
+        - const: hdmi_txpll
+else:
+  properties:
+    clock-output-names:
+      items:
+        - const: hdmitx_dig_cts
+
 additionalProperties: false
 
 examples:
-- 
2.50.1


