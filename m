Return-Path: <linux-gpio+bounces-17246-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC131A5683A
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 13:51:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 86DF33B6D78
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 12:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F394321CA0A;
	Fri,  7 Mar 2025 12:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dxTsgkpS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E3221C9E3;
	Fri,  7 Mar 2025 12:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741351762; cv=none; b=M9EQt86OOW78ZlOl47Z0n7/u/p2diprnBBeRcdMaUDjcXadZOXDNVSAOhDq4vxZjJBZZHm0sJYFytwc/jFShNGi2wQF2vRhwLwxeMxklMTJbZsIUDKJKc0vg31WYWI3y6Vnvn06Oma6GSfMLNCA5WLeI2ehv9oFPwt7iU3SQn1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741351762; c=relaxed/simple;
	bh=GhKJAtvXlolAoa+DOoAnKNooIXfM5CBUP1us/5dog6A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Eibp/zi6mn2IDbET9LObYwZERiRuHCs10HBTe4ENrdJS/ZWHaWOCVrsPZ4CbtiZFsAWXZAQHtBNTwWiox8aoE4AE4sdug5OquA55pzJySAgBa4tAKKMKTBWNjN1aJg/AOjiL29xuP9xTzVA4lGNz4f9JTBz50IEf+0Bz1/MHRXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=dxTsgkpS; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 92e9dc8afb5211efaae1fd9735fae912-20250307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=EmVWGVqGAI4TJUrJeI78GsI2NoWqQfInVXjGf3G+b4I=;
	b=dxTsgkpSKvefllj9izOFuDNCb+INt1pwVEugG2lOhorqAPdhRZN0zzGENcB68Hz36WjXeTUzShHbQ63ktcR/eKHM0F6u7P1SUk19J0BcIKuRmSoB4hH2xSXpKqZqQnGLhe3Mo3UpbM49TcQn89fzz6MdA5AyO2G2hgMrUEPGONA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:5ec712db-80cc-4d3a-bfed-1afe5be0cd98,IP:0,UR
	L:25,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:0314d249-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1|
	19,IP:nil,URL:11|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA
	:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULN
X-UUID: 92e9dc8afb5211efaae1fd9735fae912-20250307
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 713032918; Fri, 07 Mar 2025 20:49:14 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Mar 2025 20:49:12 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Mar 2025 20:49:12 +0800
From: Darren.Ye <darren.ye@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Linus
 Walleij" <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>, Darren Ye
	<darren.ye@mediatek.com>
Subject: [PATCH 12/14] dt-bindings: mediatek: mt8196: add audio AFE document
Date: Fri, 7 Mar 2025 20:47:38 +0800
Message-ID: <20250307124841.23777-13-darren.ye@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250307124841.23777-1-darren.ye@mediatek.com>
References: <20250307124841.23777-1-darren.ye@mediatek.com>
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
 .../bindings/sound/mediatek,mt8196-afe.yaml   | 259 ++++++++++++++++++
 1 file changed, 259 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
new file mode 100644
index 000000000000..59f8fdf3167c
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8196-afe.yaml
@@ -0,0 +1,259 @@
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
+  "#sound-dai-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: audio hopping clock
+      - description: audio f26m clock
+      - description: audio ul0 adc clock
+      - description: audio ul0 adc hires clock
+      - description: audio ul1 adc clock
+      - description: audio ul1 adc hires clock
+      - description: audio apll1 clock
+      - description: audio apll2 clock
+      - description: audio apll tuner1 clock
+      - description: audio apll tuner2 clock
+      - description: vlp mux audio int
+      - description: vlp mux aud engen1
+      - description: vlp mux aud engen2
+      - description: vlp mux audio h
+      - description: vlp clock 26m
+      - description: ck mainpll d4 d4
+      - description: ck mux aud 1
+      - description: ck apll1
+      - description: ck mux aud 2
+      - description: ck apll2
+      - description: ck apll1 d4
+      - description: ck apll2 d4
+      - description: ck i2sin0 m sel
+      - description: ck i2sin1 m sel
+      - description: ck fmi2s m sel
+      - description: ck tdmout m sel
+      - description: ck apll12 div i2sin0
+      - description: ck apll12 div i2sin1
+      - description: ck apll12 div fmi2s
+      - description: ck apll12 div tdmout m
+      - description: ck apll12 div tdmout b
+      - description: ck adsp sel
+      - description: ck clock 26m
+
+  clock-names:
+    items:
+      - const: aud_hopping_clk
+      - const: aud_f26m_clk
+      - const: aud_ul0_adc_clk
+      - const: aud_ul0_adc_hires_clk
+      - const: aud_ul1_adc_clk
+      - const: aud_ul1_adc_hires_clk
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
+  interrupts:
+    maxItems: 1
+
+  power-domains:
+    maxItems: 1
+
+  cksys:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the cksys clock controller.
+
+  vlpcksys:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the vlpcksys clock controller.
+
+  memory-region:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the reserved memory region for AFE DMA.
+
+  pinctrl-names:
+    items:
+      - const: default
+
+  pinctrl-0:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Phandle to the pin control group for default state.
+
+  mediatek,etdm-out-ch:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Number of ETDM output channels.
+    enum: [2]
+
+  mediatek,etdm-in-ch:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Number of ETDM input channels.
+    enum: [2]
+
+  mediatek,etdm-out-sync:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: ETDM output synchronization.
+    enum: [0, 1]
+
+  mediatek,etdm-in-sync:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: ETDM input synchronization.
+    enum: [0, 1]
+
+  mediatek,etdm-ip-mode:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: ETDM IP mode.
+    enum: [0, 1]
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - power-domains
+  - cksys
+  - vlpcksys
+  - memory-region
+  - pinctrl-names
+  - pinctrl-0
+  - mediatek,etdm-out-ch
+  - mediatek,etdm-in-ch
+  - mediatek,etdm-out-sync
+  - mediatek,etdm-in-sync
+  - mediatek,etdm-ip-mode
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8196-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mt8196-power.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        afe: mt8196-afe-pcm@1a110000 {
+            compatible = "mediatek,mt8196-afe-pcm";
+            reg = <0 0x1a110000 0 0x9000>;
+            interrupts = <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH 0>;
+            cksys = <&cksys_clk>;
+            vlpcksys = <&vlp_cksys_clk>;
+            power-domains = <&scpsys MT8196_POWER_DOMAIN_AUDIO>;
+            memory-region = <&afe_dma_mem_reserved>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&aud_pins_default>;
+            /* Only for ETDM in/out 4 */
+            mediatek,etdm-out-ch = <2>;
+            mediatek,etdm-in-ch = <2>;
+            mediatek,etdm-out-sync = <0>;
+            mediatek,etdm-in-sync = <1>;
+            mediatek,etdm-ip-mode = <0>;
+            clocks = <&afe_clk CLK_AFE_AUDIO_HOPPING_AFE>,
+                     <&afe_clk CLK_AFE_AUDIO_F26M_AFE>,
+                     <&afe_clk CLK_AFE_UL0_ADC_AFE>,
+                     <&afe_clk CLK_AFE_UL0_ADC_HIRES_AFE>,
+                     <&afe_clk CLK_AFE_UL1_ADC_AFE>,
+                     <&afe_clk CLK_AFE_UL1_ADC_HIRES_AFE>,
+                     <&afe_clk CLK_AFE_APLL1_AFE>,
+                     <&afe_clk CLK_AFE_APLL2_AFE>,
+                     <&afe_clk CLK_AFE_APLL_TUNER1_AFE>,
+                     <&afe_clk CLK_AFE_APLL_TUNER2_AFE>,
+                     <&vlp_cksys_clk CLK_VLP_CK_AUD_INTBUS_SEL>,
+                     <&vlp_cksys_clk CLK_VLP_CK_AUD_ENGEN1_SEL>,
+                     <&vlp_cksys_clk CLK_VLP_CK_AUD_ENGEN2_SEL>,
+                     <&vlp_cksys_clk CLK_VLP_CK_AUDIO_H_SEL>,
+                     <&vlp_cksys_clk CLK_VLP_CK_CLKSQ>,
+                     <&cksys_clk CLK_CK_MAINPLL_D4_D4>,
+                     <&cksys_clk CLK_CK_AUD_1_SEL>,
+                     <&cksys_clk CLK_CK_APLL1>,
+                     <&cksys_clk CLK_CK_AUD_2_SEL>,
+                     <&cksys_clk CLK_CK_APLL2>,
+                     <&cksys_clk CLK_CK_APLL1_D4>,
+                     <&cksys_clk CLK_CK_APLL2_D4>,
+                     <&cksys_clk CLK_CK_APLL_I2SIN0_MCK_SEL>,
+                     <&cksys_clk CLK_CK_APLL_I2SIN1_MCK_SEL>,
+                     <&cksys_clk CLK_CK_APLL_FMI2S_MCK_SEL>,
+                     <&cksys_clk CLK_CK_APLL_TDMOUT_MCK_SEL>,
+                     <&cksys_clk CLK_CK_APLL12_CK_DIV_I2SIN0>,
+                     <&cksys_clk CLK_CK_APLL12_CK_DIV_I2SIN1>,
+                     <&cksys_clk CLK_CK_APLL12_CK_DIV_FMI2S>,
+                     <&cksys_clk CLK_CK_APLL12_CK_DIV_TDMOUT_M>,
+                     <&cksys_clk CLK_CK_APLL12_CK_DIV_TDMOUT_B>,
+                     <&cksys_clk CLK_CK_ADSP_SEL>,
+                     <&cksys_clk CLK_CK_TCK_26M_MX9>;
+            clock-names = "aud_hopping_clk",
+                          "aud_f26m_clk",
+                          "aud_ul0_adc_clk",
+                          "aud_ul0_adc_hires_clk",
+                          "aud_ul1_adc_clk",
+                          "aud_ul1_adc_hires_clk",
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


