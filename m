Return-Path: <linux-gpio+bounces-23718-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D7047B10454
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 10:46:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 93F307B93A1
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 08:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7542F29008E;
	Thu, 24 Jul 2025 08:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="AZP0rKQE"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6388128D8EF;
	Thu, 24 Jul 2025 08:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753346403; cv=none; b=NkT1QliNN+6B8tNIRy6TmIdCz0rOQ9MjVkpxTQOYzbpNtGNCcLT2AbXUPOeyhfNI8N+Kb1Iv7mk6mpG4qaj2EIAStG2UQ523MjM2d+dkvY6ucN5eYxjSn5OqLWfp2q1wyJa0COG9sAZmXtLsjDP0vA+v8RyQs0GG7uMwpD/cpeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753346403; c=relaxed/simple;
	bh=QX1FQ2dQ3CDRcwAseOl4+lBWXKhUPzCWrrc3PxSdZb4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lFTSjaJiTTkghlQl930sU2cvAkBHS9gER8fhBOCXYCoP6FGPIeTT73MbWNAP9UeqZ7LJft5dNZht32XvWLUqFARoI13JPt5VZXu1+wdP6L9Y3R9loIha1FgDHFFQfH8mg6XiXXjS9vepbx+tQ9zh+uz6rIhtTrLX74WXA4VXVgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=AZP0rKQE; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346399;
	bh=QX1FQ2dQ3CDRcwAseOl4+lBWXKhUPzCWrrc3PxSdZb4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AZP0rKQEsd8gKWsnWrNx5jYZI+QwjSgLO3Ra9NwcCWUuOP8Gw0/5LCtyQPe/kX8Ey
	 QfgUv8gJ1MfDSPBc0fJcENbXWAV0r58Z4il5SfG7vjVTGnfMbpeTDF8vFvEUw0pBNe
	 p5Ne4UAFRp75hFM0dPNHFAi9zH3SpOoXhP7TGfnL7e+IRp6ER4KV1IYnJ7mYDLNcJ7
	 d1a/hkv9XZH95W/p2R92uSmtaTSy1NlxfiDSh8+/h9IRspptBEg9SB5GvAsY+kFpiG
	 eJWjiv1xoSl/WnZej+zmI3zoQ70PzyveyIEvyVhOfE5OOEiK+lPIJ27rh10jYrAdJ4
	 XHvuXt/wDhp8w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7239617E0FC2;
	Thu, 24 Jul 2025 10:39:57 +0200 (CEST)
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
Subject: [PATCH 13/38] dt-bindings: remoteproc: mediatek: Remove l1tcm MMIO from MT8188 dual
Date: Thu, 24 Jul 2025 10:38:49 +0200
Message-ID: <20250724083914.61351-14-angelogioacchino.delregno@collabora.com>
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

Even though the MT8188 SoC's Dual-Core SCP IP is practically the
same as the one found on MT8195, it doesn't have a dedicated L1
TCM and relies only on SRAM.

Set reg/reg-names minItems to 1 globally and override it in all of
the conditionals for the SoCs that require more, and then split
the mt8195/8188 conditionals to allow specifying only the cfg MMIO
on MT8188.

Fixes: 91e0d560b9fd ("dt-bindings: remoteproc: mediatek: Support MT8188 dual-core SCP")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/remoteproc/mtk,scp.yaml          | 23 ++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
index adc6b3f36fde..6818a6052be0 100644
--- a/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml
@@ -28,11 +28,11 @@ properties:
     description:
       Should contain the address ranges for memory regions SRAM, CFG, and,
       on some platforms, L1TCM.
-    minItems: 2
+    minItems: 1
     maxItems: 3
 
   reg-names:
-    minItems: 2
+    minItems: 1
     maxItems: 3
 
   clocks:
@@ -171,8 +171,10 @@ allOf:
     then:
       properties:
         reg:
+          minItems: 2
           maxItems: 2
         reg-names:
+          minItems: 2
           items:
             - const: sram
             - const: cfg
@@ -185,8 +187,10 @@ allOf:
     then:
       properties:
         reg:
+          minItems: 2
           maxItems: 3
         reg-names:
+          minItems: 2
           items:
             - const: sram
             - const: cfg
@@ -196,12 +200,25 @@ allOf:
         compatible:
           enum:
             - mediatek,mt8188-scp-dual
+    then:
+      properties:
+        reg:
+          minItems: 1
+        reg-names:
+          minItems: 1
+          items:
+            - const: cfg
+  - if:
+      properties:
+        compatible:
+          enum:
             - mediatek,mt8195-scp-dual
     then:
       properties:
         reg:
-          maxItems: 2
+          minItems: 2
         reg-names:
+          minItems: 2
           items:
             - const: cfg
             - const: l1tcm
-- 
2.50.1


