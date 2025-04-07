Return-Path: <linux-gpio+bounces-18355-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AAE1A7DD50
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 14:12:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A12883AED97
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 12:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1983B24EA8F;
	Mon,  7 Apr 2025 12:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="TsEBvJr3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BE77248865;
	Mon,  7 Apr 2025 12:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744027879; cv=none; b=nI5yniYg5oFlBWkoLHUGqsqu7ywzzFOL3pAOlmI7b+BWldISb0/xsQX2h9Quc5VZlYyximuTIPH1CPYG/BbCkyzKStz3WepCA8S+UUeBLjGdfITzl7uOcnUoNqPmb/ipxa0FtrBawwtqKS9yCs61hFBGoddL+wKj8algLCYM7VM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744027879; c=relaxed/simple;
	bh=0nz/p0X1v5HhFvnAVD9j0mDBUzNdAwhtxPJKeVWzfi8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QzIAij9KiEcWWbI8Hd3aczx+nfUqlmXi2nQPE1l32pLos4LJtMzpLDcvXrh0iFpVA00Rg3gRoVt/Jdn/HI6+ClhhcE5kGWf2aQlXjvBFPnrC2fhJFM7ANdbiuLC90aO38uCRXPohPkLWrSy0FIUMmzpNUwiiNfTWxy5v1lVNnOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=TsEBvJr3; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 648e33d013a911f08eb9c36241bbb6fb-20250407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=pnK0wj2B2jfMFwrBsHj+ysKsLgGaXPaNSeTDatO6vbg=;
	b=TsEBvJr3AG0S+izvAYqXCRJZ1BjWZhq6S30Ep6vA7LemuhF6HIGY33bL7DfsNo75Au6x5qknUqQucFJmmPLr/Mf1DYuIpM7iLO+i901ftlRt69n6DSsymq7uENTsSh9zwWylyf0dlhYekFaKwgZ+ICBho/V4z9kh8tpPNnvPeRU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:cb65eec9-1d0e-4024-913a-0523561f0ac8,IP:0,UR
	L:25,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:25
X-CID-META: VersionHash:0ef645f,CLOUDID:4f3646c7-16da-468a-87f7-8ca8d6b3b9f7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:83|11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OS
	A:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 648e33d013a911f08eb9c36241bbb6fb-20250407
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1705508885; Mon, 07 Apr 2025 20:11:10 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Apr 2025 20:11:10 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Apr 2025 20:11:09 +0800
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
	<darren.ye@mediatek.com>
Subject: [PATCH v2 09/11] ASoC: dt-bindings: mediatek,mt8196-afe: add audio AFE document
Date: Mon, 7 Apr 2025 20:06:33 +0800
Message-ID: <20250407120708.26495-10-darren.ye@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250407120708.26495-1-darren.ye@mediatek.com>
References: <20250407120708.26495-1-darren.ye@mediatek.com>
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

Add mt8196 audio AFE document.

Signed-off-by: Darren Ye <darren.ye@mediatek.com>
---
 .../bindings/sound/mediatek,mt8196-afe.yaml   | 233 ++++++++++++++++++
 1 file changed, 233 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
new file mode 100644
index 000000000000..44f8847b13a8
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
@@ -0,0 +1,233 @@
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
+    const: mediatek,mt8196-afe-pcm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+  memory-region:
+    maxItems: 1
+    description: |
+      Shared memory region for AFE memif.  A "shared-dma-pool".
+      See dtschema reserved-memory/shared-dma-pool.yaml for details.
+  mediatek,cksys:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the mediatek clk systemd controller
+
+  mediatek,vlpcksys:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: The phandle of the mediatek vlpcksys controller
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: audio hopping clock gate
+      - description: audio f26m clock gate
+      - description: audio apll1 clock gate
+      - description: audio apll2 clock gate
+      - description: audio apll1 tuner gate
+      - description: audio apll2 tuner gate
+      - description: mux for audio vlp int
+      - description: mux for audio vlp engen1
+      - description: mux for audio vlp engen2
+      - description: mux for audio h
+      - description: vlp clock 26m
+      - description: audio mainpll divide 4
+      - description: mux for audio apll1
+      - description: audio apll1
+      - description: mux for audio apll2
+      - description: audio apll2
+      - description: audio apll1 divide 4
+      - description: audio apll2 divide 4
+      - description: mux for i2sin0 mck
+      - description: mux for i2sin1 mck
+      - description: mux for fmi2s mck
+      - description: mux for tdmout mck
+      - description: auido apll12 divide for i2sin0
+      - description: auido apll12 divide for i2sin1
+      - description: auido apll12 divide for fmi2s
+      - description: auido apll12 divide for tdmout mck
+      - description: auido apll12 divide for tdmout bck
+      - description: audio adsp clk
+      - description: 26m clock
+
+  clock-names:
+    items:
+      - const: aud_hopping_clk
+      - const: aud_f26m_clk
+      - const: aud_apll1_clk
+      - const: aud_apll2_clk
+      - const: aud_apll_tuner1_clk
+      - const: aud_apll_tuner2_clk
+      - const: vlp_mux_audio_int
+      - const: vlp_mux_aud_eng1
+      - const: vlp_mux_aud_eng2
+      - const: vlp_mux_audio_h
+      - const: vlp_clk26m_clk
+      - const: ck_mainpll_d4_d4
+      - const: ck_mux_aud_1
+      - const: ck_apll1_ck
+      - const: ck_mux_aud_2
+      - const: ck_apll2_ck
+      - const: ck_apll1_d4
+      - const: ck_apll2_d4
+      - const: ck_i2sin0_m_sel
+      - const: ck_i2sin1_m_sel
+      - const: ck_fmi2s_m_sel
+      - const: ck_tdmout_m_sel
+      - const: ck_apll12_div_i2sin0
+      - const: ck_apll12_div_i2sin1
+      - const: ck_apll12_div_fmi2s
+      - const: ck_apll12_div_tdmout_m
+      - const: ck_apll12_div_tdmout_b
+      - const: ck_adsp_sel
+      - const: ck_clk26m_clk
+
+  mediatek,etdm4-out-ch:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of ETDM4 output channels.
+    minimum: 1
+    maximum: 8
+
+  mediatek,etdm4-in-ch:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Number of ETDM4 input channels.
+    minimum: 1
+    maximum: 8
+
+  mediatek,etdm4-out-sync:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      ETDM4 output and input enable synchronization.
+    enum:
+      - 0 # Enable controlled by itself
+      - 1 # Enable synchronization with ETDM4 input.
+
+  mediatek,etdm4-in-sync:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      ETDM4 input and outpuot enable synchronization.
+    enum:
+      - 0 # Enable controlled by itself
+      - 1 # Enable synchronization with ETDM4 output.
+
+
+
+  mediatek,etdm4-ip-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: ETDM IP mode.
+    enum:
+      - 0 # One ip multi-ch mode
+      - 1 # Multi-ip 2ch mode
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - mediatek,cksys
+  - mediatek,vlpcksys
+  - power-domains
+  - memory-region
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
+        afe: mt8196-afe-pcm@1a110000 {
+            compatible = "mediatek,mt8196-afe-pcm";
+            reg = <0 0x1a110000 0 0x9000>;
+            interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH 0>;
+            memory-region = <&afe_dma_mem_reserved>;
+            mediatek,cksys = <&cksys_clk>;
+            mediatek,vlpcksys = <&vlp_cksys_clk>;
+            power-domains = <&scpsys 14>; //MT8196_POWER_DOMAIN_AUDIO
+            mediatek,etdm4-out-ch = <2>;
+            mediatek,etdm4-in-ch = <2>;
+            mediatek,etdm4-out-sync = <0>;
+            mediatek,etdm4-in-sync = <1>;
+            mediatek,etdm4-ip-mode = <0>;
+            clocks = <&afe_clk 109>, //CLK_AFE_AUDIO_HOPPING_AFE
+                     <&afe_clk 111>, //CLK_AFE_AUDIO_F26M_AFE
+                     <&afe_clk 113>, //CLK_AFE_APLL1_AFE
+                     <&afe_clk 115>, //CLK_AFE_APLL2_AFE
+                     <&afe_clk 121>, //CLK_AFE_APLL_TUNER1_AFE
+                     <&afe_clk 119>, //CLK_AFE_APLL_TUNER2_AFE
+                     <&vlp_cksys_clk 40>, //CLK_VLP_CK_AUD_INTBUS_SEL
+                     <&vlp_cksys_clk 38>, //CLK_VLP_CK_AUD_ENGEN1_SEL
+                     <&vlp_cksys_clk 39>, //CLK_VLP_CK_AUD_ENGEN2_SEL
+                     <&vlp_cksys_clk 37>, //CLK_VLP_CK_AUDIO_H_SEL
+                     <&vlp_cksys_clk 45>, //CLK_VLP_CK_CLKSQ
+                     <&cksys_clk 98>, //CLK_CK_MAINPLL_D4_D4
+                     <&cksys_clk 43>, //CLK_CK_AUD_1_SEL
+                     <&cksys_clk 129>, //CLK_CK_APLL1
+                     <&cksys_clk 44>, //CLK_CK_AUD_2_SEL
+                     <&cksys_clk 132>, //CLK_CK_APLL2
+                     <&cksys_clk 130>, //CLK_CK_APLL1_D4
+                     <&cksys_clk 133>, //CLK_CK_APLL2_D4
+                     <&cksys_clk 66>, //CLK_CK_APLL_I2SIN0_MCK_SEL
+                     <&cksys_clk 67>, //CLK_CK_APLL_I2SIN1_MCK_SEL
+                     <&cksys_clk 78>, //CLK_CK_APLL_FMI2S_MCK_SEL
+                     <&cksys_clk 79>, //CLK_CK_APLL_TDMOUT_MCK_SEL
+                     <&cksys_clk 80>, //CLK_CK_APLL12_CK_DIV_I2SIN0
+                     <&cksys_clk 81>, //CLK_CK_APLL12_CK_DIV_I2SIN1
+                     <&cksys_clk 92>, //CLK_CK_APLL12_CK_DIV_FMI2S
+                     <&cksys_clk 93>, //CLK_CK_APLL12_CK_DIV_TDMOUT_M
+                     <&cksys_clk 94>, //CLK_CK_APLL12_CK_DIV_TDMOUT_B
+                     <&cksys_clk 45>, //CLK_CK_ADSP_SEL
+                     <&cksys_clk 140>; //CLK_CK_TCK_26M_MX9
+            clock-names = "aud_hopping_clk",
+                          "aud_f26m_clk",
+                          "aud_apll1_clk",
+                          "aud_apll2_clk",
+                          "aud_apll_tuner1_clk",
+                          "aud_apll_tuner2_clk",
+                          "vlp_mux_audio_int",
+                          "vlp_mux_aud_eng1",
+                          "vlp_mux_aud_eng2",
+                          "vlp_mux_audio_h",
+                          "vlp_clk26m_clk",
+                          "ck_mainpll_d4_d4",
+                          "ck_mux_aud_1",
+                          "ck_apll1_ck",
+                          "ck_mux_aud_2",
+                          "ck_apll2_ck",
+                          "ck_apll1_d4",
+                          "ck_apll2_d4",
+                          "ck_i2sin0_m_sel",
+                          "ck_i2sin1_m_sel",
+                          "ck_fmi2s_m_sel",
+                          "ck_tdmout_m_sel",
+                          "ck_apll12_div_i2sin0",
+                          "ck_apll12_div_i2sin1",
+                          "ck_apll12_div_fmi2s",
+                          "ck_apll12_div_tdmout_m",
+                          "ck_apll12_div_tdmout_b",
+                          "ck_adsp_sel",
+                          "ck_clk26m_clk";
+        };
+    };
-- 
2.45.2


