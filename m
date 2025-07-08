Return-Path: <linux-gpio+bounces-22927-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFA8AFC969
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 13:20:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3A6056529B
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 11:19:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C83A12DAFC2;
	Tue,  8 Jul 2025 11:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="c9ag3K0f"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2185B2DA771;
	Tue,  8 Jul 2025 11:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751973520; cv=none; b=CvNSLhO7En3ZouYSFAS8FfNe3ziJi4LKPOeIYrRDndpZFQE7q/8Vj1c9kyg9jdQRv8VfzmKKAQzTrHj1lN7eoyCLlwpquSurPs7yDt3uZqUbNtFUcWcrpzt2BxkUqEL9wa82xCwdv7tY6IXs2sn0kCEGVe3hLOaO50kFkiBrNX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751973520; c=relaxed/simple;
	bh=Q4NfR6EcKCQ2nC45w4CAOmjB75WWVOHUVfiOsgRlmng=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=huqxHmPtwlXgHfpJhHXeir6YyKp0HzUBqVz4Gl1LQQtdzh86XyVNJAoNg0dahvJCQrlbD/hCO1ptaZDQKiUjyiD7z1o4W2W9RVmLoNGrdn+k5swz4HLGD1YJGyvH6Xm4uIxk9q/DhBh2KCzSLSkOc5tkJBn5fNbtA5KDEJiXpu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=c9ag3K0f; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 47b162965bed11f0b1510d84776b8c0b-20250708
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=QJT6Hjo2W2cT8kHOk/s+DMEdYQQWVWweuPR62g0sbw4=;
	b=c9ag3K0fEGJCCCeMvD+IWhP14dtT77tk3K9+BpAMxclYbuzgySNSzkOzgZUFA+f0O8pvxRtREQ64XegakWntnOCaBEdWdWAxGZbgTlyj7Rp6ODwCO6NTlMUyb+2l6k94J066RKFqVqhlEJ47Vx6eqk2ZiJw/kWNWst52OPr3dxc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:c789f0d7-a2f9-418d-914b-c9804153990e,IP:0,UR
	L:25,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:20
X-CID-META: VersionHash:9eb4ff7,CLOUDID:7974fbd7-b768-4ffb-8a44-cd8427608ba6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:97|99|83|106|11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 47b162965bed11f0b1510d84776b8c0b-20250708
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw01.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1966805278; Tue, 08 Jul 2025 19:18:31 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 8 Jul 2025 19:18:29 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 8 Jul 2025 19:18:28 +0800
From: Darren.Ye <darren.ye@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Linus
 Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>, Darren Ye
	<darren.ye@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 08/10] ASoC: dt-bindings: mediatek,mt8196-afe: add audio AFE
Date: Tue, 8 Jul 2025 19:16:00 +0800
Message-ID: <20250708111806.3992-9-darren.ye@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250708111806.3992-1-darren.ye@mediatek.com>
References: <20250708111806.3992-1-darren.ye@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N

From: Darren Ye <darren.ye@mediatek.com>

Add mt8196 audio AFE.

Signed-off-by: Darren Ye <darren.ye@mediatek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/sound/mediatek,mt8196-afe.yaml   | 157 ++++++++++++++++++
 1 file changed, 157 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
new file mode 100644
index 000000000000..fe147eddf5e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
@@ -0,0 +1,157 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8196-afe.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: MediaTek Audio Front End PCM controller for MT8196
+
+maintainers:
+  - Darren Ye <darren.ye@mediatek.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8196-afe
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  memory-region:
+    maxItems: 1
+
+  mediatek,vlpcksys:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: To set up the apll12 tuner
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: mux for audio intbus
+      - description: mux for audio engen1
+      - description: mux for audio engen2
+      - description: mux for audio h
+      - description: vlp 26m clock
+      - description: audio apll1 clock
+      - description: audio apll2 clock
+      - description: audio apll1 divide4
+      - description: audio apll2 divide4
+      - description: audio apll12 divide for i2sin0
+      - description: audio apll12 divide for i2sin1
+      - description: audio apll12 divide for fmi2s
+      - description: audio apll12 divide for tdmout mck
+      - description: audio apll12 divide for tdmout bck
+      - description: mux for audio apll1
+      - description: mux for audio apll2
+      - description: mux for i2sin0 mck
+      - description: mux for i2sin1 mck
+      - description: mux for fmi2s mck
+      - description: mux for tdmout mck
+      - description: mux for adsp clock
+      - description: 26m clock
+
+  clock-names:
+    items:
+      - const: top_aud_intbus
+      - const: top_aud_eng1
+      - const: top_aud_eng2
+      - const: top_aud_h
+      - const: vlp_clk26m
+      - const: apll1
+      - const: apll2
+      - const: apll1_d4
+      - const: apll2_d4
+      - const: apll12_div_i2sin0
+      - const: apll12_div_i2sin1
+      - const: apll12_div_fmi2s
+      - const: apll12_div_tdmout_m
+      - const: apll12_div_tdmout_b
+      - const: top_apll1
+      - const: top_apll2
+      - const: top_i2sin0
+      - const: top_i2sin1
+      - const: top_fmi2s
+      - const: top_tdmout
+      - const: top_adsp
+      - const: clk26m
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - memory-region
+  - mediatek,vlpcksys
+  - power-domains
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        afe@1a110000 {
+            compatible = "mediatek,mt8196-afe";
+            reg = <0 0x1a110000 0 0x9000>;
+            interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH 0>;
+            memory-region = <&afe_dma_mem_reserved>;
+            mediatek,vlpcksys = <&vlp_cksys_clk>;
+            power-domains = <&scpsys 14>; //MT8196_POWER_DOMAIN_AUDIO
+            clocks = <&vlp_cksys_clk 40>, //CLK_VLP_CK_AUD_INTBUS_SEL
+                     <&vlp_cksys_clk 38>, //CLK_VLP_CK_AUD_ENGEN1_SEL
+                     <&vlp_cksys_clk 39>, //CLK_VLP_CK_AUD_ENGEN2_SEL
+                     <&vlp_cksys_clk 37>, //CLK_VLP_CK_AUDIO_H_SEL
+                     <&vlp_cksys_clk 45>, //CLK_VLP_CK_CLKSQ
+                     <&cksys_clk 129>, //CLK_CK_APLL1
+                     <&cksys_clk 132>, //CLK_CK_APLL2
+                     <&cksys_clk 130>, //CLK_CK_APLL1_D4
+                     <&cksys_clk 133>, //CLK_CK_APLL2_D4
+                     <&cksys_clk 80>, //CLK_CK_APLL12_CK_DIV_I2SIN0
+                     <&cksys_clk 81>, //CLK_CK_APLL12_CK_DIV_I2SIN1
+                     <&cksys_clk 92>, //CLK_CK_APLL12_CK_DIV_FMI2S
+                     <&cksys_clk 93>, //CLK_CK_APLL12_CK_DIV_TDMOUT_M
+                     <&cksys_clk 94>, //CLK_CK_APLL12_CK_DIV_TDMOUT_B
+                     <&cksys_clk 43>, //CLK_CK_AUD_1_SEL
+                     <&cksys_clk 44>, //CLK_CK_AUD_2_SEL
+                     <&cksys_clk 66>, //CLK_CK_APLL_I2SIN0_MCK_SEL
+                     <&cksys_clk 67>, //CLK_CK_APLL_I2SIN1_MCK_SEL
+                     <&cksys_clk 78>, //CLK_CK_APLL_FMI2S_MCK_SEL
+                     <&cksys_clk 79>, //CLK_CK_APLL_TDMOUT_MCK_SEL
+                     <&cksys_clk 45>, //CLK_CK_ADSP_SEL
+                     <&cksys_clk 140>; //CLK_CK_TCK_26M_MX9
+            clock-names = "top_aud_intbus",
+                          "top_aud_eng1",
+                          "top_aud_eng2",
+                          "top_aud_h",
+                          "vlp_clk26m",
+                          "apll1",
+                          "apll2",
+                          "apll1_d4",
+                          "apll2_d4",
+                          "apll12_div_i2sin0",
+                          "apll12_div_i2sin1",
+                          "apll12_div_fmi2s",
+                          "apll12_div_tdmout_m",
+                          "apll12_div_tdmout_b",
+                          "top_apll1",
+                          "top_apll2",
+                          "top_i2sin0",
+                          "top_i2sin1",
+                          "top_fmi2s",
+                          "top_tdmout",
+                          "top_adsp",
+                          "clk26m";
+        };
+    };
+
+...
-- 
2.45.2


