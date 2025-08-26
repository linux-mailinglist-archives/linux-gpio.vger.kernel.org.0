Return-Path: <linux-gpio+bounces-24956-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D19CB355CD
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 09:40:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 944BC1B27A53
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Aug 2025 07:40:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36CF62F83AA;
	Tue, 26 Aug 2025 07:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="orHgeyia"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9A22F49FB;
	Tue, 26 Aug 2025 07:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756193984; cv=none; b=ZxWBTrqV+VKsG/Z+Jsk20xvIBYGBcWOe5aEgiNpdDhY8BDoTXbWSf69QgkhQFS0ayI9Lkl4g7WMYZUkHoarhyJzysx3wuBbtYWwATCBWLdp6nQDKVhWnV//eOeJNNE6XBBOK5b2SWDSUIdef5yqE9uxF5jcKFxPXXy+QhjTMfRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756193984; c=relaxed/simple;
	bh=7+MQceVvkP8ET0L9Vuln7OvfoJf6TtZFZiihe8YHvMw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LuhS7Dw26occQtD74OT75vTZp+xrYFAUXBvERbeU8HvzpUrJjSsbOIb6DeJUlcGmFJyNwPps0tC1JrvHfz+As84hV6h/xa/fWrJ7xJ+jbyrVoqv8lMHKhvPB9YFXq0FBgGQYxredNnoUjBhZF8mStF2/MIj0biVpbJ0QrF2rpiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=orHgeyia; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756193980;
	bh=7+MQceVvkP8ET0L9Vuln7OvfoJf6TtZFZiihe8YHvMw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=orHgeyia5O/S2oc4MXO/ARUY0UqVdiaacW8yTMB11Sj7+ae4dqF8VPXZavEQ1asVR
	 9D+RGEIgt7JE4S2IL1DIYXRLMi97uOTnect87eDVhmfdKduqhKInvS5vtUt7RU9pH8
	 DWsjalPB4Js/tvwGC/ZY1G1Bi+jhxCusBASp+jkjiuc2KOMTzOZpcegJ5PhcY+osRs
	 qSVDTsge78sZjTJOK+7xvVnfCXcfKlhSL6Td5Vkqb7ffyKamWg2NPaMpB62srgZGYL
	 Cug389UJOs9NUwIW5xcVmr5fYieQSuyTRwf8xtFHIGpbfIWT1T7/OffvaEHKt6X+Q9
	 w3acmaaFvTDJQ==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892F2D600C8F85cF092d4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1BD2F17E0A29;
	Tue, 26 Aug 2025 09:39:39 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Tue, 26 Aug 2025 09:39:35 +0200
Subject: [PATCH v3 2/6] ASoC: dt-binding: Convert mt8183-afe-pcm to
 dt-schema
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250826-mtk-dtb-warnings-v3-2-20e89886a20e@collabora.com>
References: <20250826-mtk-dtb-warnings-v3-0-20e89886a20e@collabora.com>
In-Reply-To: <20250826-mtk-dtb-warnings-v3-0-20e89886a20e@collabora.com>
To: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ikjoon Jang <ikjn@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>, 
 Eugen Hristev <eugen.hristev@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Julien Massot <jmassot@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2

Convert the MediaTek MT8183 AFE PCM Device Tree binding from the old
.txt format to dt-schema format to improve validation.

While converting, also document all clock inputs and memory-region
used by the AFE block.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 .../bindings/sound/mediatek,mt8183-audio.yaml      | 228 +++++++++++++++++++++
 .../devicetree/bindings/sound/mt8183-afe-pcm.txt   |  42 ----
 2 files changed, 228 insertions(+), 42 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8183-audio.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8183-audio.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..031b0fa7b4dc1bcb9e258be1801d4bbe4c02af84
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8183-audio.yaml
@@ -0,0 +1,228 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mediatek,mt8183-audio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek AFE PCM controller for mt8183
+
+maintainers:
+  - Julien Massot <jmassot@collabora.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8183-audio
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: audiosys
+
+  power-domains:
+    maxItems: 1
+
+  memory-region:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: AFE clock
+      - description: ADDA DAC clock
+      - description: ADDA DAC pre-distortion clock
+      - description: ADDA ADC clock
+      - description: ADDA6 ADC clock
+      - description: Audio low-jitter 22.5792m clock
+      - description: Audio low-jitter 24.576m clock
+      - description: Audio PLL1 tuner clock
+      - description: Audio PLL2 tuner clock
+      - description: I2S1 bit clock
+      - description: I2S2 bit clock
+      - description: I2S3 bit clock
+      - description: I2S4 bit clock
+      - description: Audio Time-Division Multiplexing interface clock
+      - description: Powerdown Audio test model clock
+      - description: Audio infra sys clock
+      - description: Audio infra 26M clock
+      - description: Mux for audio clock
+      - description: Mux for audio internal bus clock
+      - description: Mux main divider by 4
+      - description: Primary audio mux
+      - description: Primary audio PLL
+      - description: Secondary audio mux
+      - description: Secondary audio PLL
+      - description: Primary audio en-generator clock
+      - description: Primary PLL divider by 4 for IEC
+      - description: Secondary audio en-generator clock
+      - description: Secondary PLL divider by 8 for IEC
+      - description: Mux selector for I2S port 0
+      - description: Mux selector for I2S port 1
+      - description: Mux selector for I2S port 2
+      - description: Mux selector for I2S port 3
+      - description: Mux selector for I2S port 4
+      - description: Mux selector for I2S port 5
+      - description: APLL1 and APLL2 divider for I2S port 0
+      - description: APLL1 and APLL2 divider for I2S port 1
+      - description: APLL1 and APLL2 divider for I2S port 2
+      - description: APLL1 and APLL2 divider for I2S port 3
+      - description: APLL1 and APLL2 divider for I2S port 4
+      - description: APLL1 and APLL2 divider for IEC
+      - description: 26MHz clock for audio subsystem
+
+  clock-names:
+    items:
+      - const: aud_afe_clk
+      - const: aud_dac_clk
+      - const: aud_dac_predis_clk
+      - const: aud_adc_clk
+      - const: aud_adc_adda6_clk
+      - const: aud_apll22m_clk
+      - const: aud_apll24m_clk
+      - const: aud_apll1_tuner_clk
+      - const: aud_apll2_tuner_clk
+      - const: aud_i2s1_bclk_sw
+      - const: aud_i2s2_bclk_sw
+      - const: aud_i2s3_bclk_sw
+      - const: aud_i2s4_bclk_sw
+      - const: aud_tdm_clk
+      - const: aud_tml_clk
+      - const: aud_infra_clk
+      - const: mtkaif_26m_clk
+      - const: top_mux_audio
+      - const: top_mux_aud_intbus
+      - const: top_syspll_d2_d4
+      - const: top_mux_aud_1
+      - const: top_apll1_ck
+      - const: top_mux_aud_2
+      - const: top_apll2_ck
+      - const: top_mux_aud_eng1
+      - const: top_apll1_d8
+      - const: top_mux_aud_eng2
+      - const: top_apll2_d8
+      - const: top_i2s0_m_sel
+      - const: top_i2s1_m_sel
+      - const: top_i2s2_m_sel
+      - const: top_i2s3_m_sel
+      - const: top_i2s4_m_sel
+      - const: top_i2s5_m_sel
+      - const: top_apll12_div0
+      - const: top_apll12_div1
+      - const: top_apll12_div2
+      - const: top_apll12_div3
+      - const: top_apll12_div4
+      - const: top_apll12_divb
+      - const: top_clk26m_clk
+
+required:
+  - compatible
+  - interrupts
+  - resets
+  - reset-names
+  - power-domains
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mt8183-power.h>
+    #include <dt-bindings/reset/mt8183-resets.h>
+
+    audio-controller {
+        compatible = "mediatek,mt8183-audio";
+        interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_LOW>;
+        resets = <&watchdog MT8183_TOPRGU_AUDIO_SW_RST>;
+        reset-names = "audiosys";
+        power-domains = <&spm MT8183_POWER_DOMAIN_AUDIO>;
+        clocks = <&audiosys CLK_AUDIO_AFE>,
+                 <&audiosys CLK_AUDIO_DAC>,
+                 <&audiosys CLK_AUDIO_DAC_PREDIS>,
+                 <&audiosys CLK_AUDIO_ADC>,
+                 <&audiosys CLK_AUDIO_PDN_ADDA6_ADC>,
+                 <&audiosys CLK_AUDIO_22M>,
+                 <&audiosys CLK_AUDIO_24M>,
+                 <&audiosys CLK_AUDIO_APLL_TUNER>,
+                 <&audiosys CLK_AUDIO_APLL2_TUNER>,
+                 <&audiosys CLK_AUDIO_I2S1>,
+                 <&audiosys CLK_AUDIO_I2S2>,
+                 <&audiosys CLK_AUDIO_I2S3>,
+                 <&audiosys CLK_AUDIO_I2S4>,
+                 <&audiosys CLK_AUDIO_TDM>,
+                 <&audiosys CLK_AUDIO_TML>,
+                 <&infracfg CLK_INFRA_AUDIO>,
+                 <&infracfg CLK_INFRA_AUDIO_26M_BCLK>,
+                 <&topckgen CLK_TOP_MUX_AUDIO>,
+                 <&topckgen CLK_TOP_MUX_AUD_INTBUS>,
+                 <&topckgen CLK_TOP_SYSPLL_D2_D4>,
+                 <&topckgen CLK_TOP_MUX_AUD_1>,
+                 <&topckgen CLK_TOP_APLL1_CK>,
+                 <&topckgen CLK_TOP_MUX_AUD_2>,
+                 <&topckgen CLK_TOP_APLL2_CK>,
+                 <&topckgen CLK_TOP_MUX_AUD_ENG1>,
+                 <&topckgen CLK_TOP_APLL1_D8>,
+                 <&topckgen CLK_TOP_MUX_AUD_ENG2>,
+                 <&topckgen CLK_TOP_APLL2_D8>,
+                 <&topckgen CLK_TOP_MUX_APLL_I2S0>,
+                 <&topckgen CLK_TOP_MUX_APLL_I2S1>,
+                 <&topckgen CLK_TOP_MUX_APLL_I2S2>,
+                 <&topckgen CLK_TOP_MUX_APLL_I2S3>,
+                 <&topckgen CLK_TOP_MUX_APLL_I2S4>,
+                 <&topckgen CLK_TOP_MUX_APLL_I2S5>,
+                 <&topckgen CLK_TOP_APLL12_DIV0>,
+                 <&topckgen CLK_TOP_APLL12_DIV1>,
+                 <&topckgen CLK_TOP_APLL12_DIV2>,
+                 <&topckgen CLK_TOP_APLL12_DIV3>,
+                 <&topckgen CLK_TOP_APLL12_DIV4>,
+                 <&topckgen CLK_TOP_APLL12_DIVB>,
+                 <&clk26m>;
+      clock-names = "aud_afe_clk",
+                    "aud_dac_clk",
+                    "aud_dac_predis_clk",
+                    "aud_adc_clk",
+                    "aud_adc_adda6_clk",
+                    "aud_apll22m_clk",
+                    "aud_apll24m_clk",
+                    "aud_apll1_tuner_clk",
+                    "aud_apll2_tuner_clk",
+                    "aud_i2s1_bclk_sw",
+                    "aud_i2s2_bclk_sw",
+                    "aud_i2s3_bclk_sw",
+                    "aud_i2s4_bclk_sw",
+                    "aud_tdm_clk",
+                    "aud_tml_clk",
+                    "aud_infra_clk",
+                    "mtkaif_26m_clk",
+                    "top_mux_audio",
+                    "top_mux_aud_intbus",
+                    "top_syspll_d2_d4",
+                    "top_mux_aud_1",
+                    "top_apll1_ck",
+                    "top_mux_aud_2",
+                    "top_apll2_ck",
+                    "top_mux_aud_eng1",
+                    "top_apll1_d8",
+                    "top_mux_aud_eng2",
+                    "top_apll2_d8",
+                    "top_i2s0_m_sel",
+                    "top_i2s1_m_sel",
+                    "top_i2s2_m_sel",
+                    "top_i2s3_m_sel",
+                    "top_i2s4_m_sel",
+                    "top_i2s5_m_sel",
+                    "top_apll12_div0",
+                    "top_apll12_div1",
+                    "top_apll12_div2",
+                    "top_apll12_div3",
+                    "top_apll12_div4",
+                    "top_apll12_divb",
+                    "top_clk26m_clk";
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/sound/mt8183-afe-pcm.txt b/Documentation/devicetree/bindings/sound/mt8183-afe-pcm.txt
deleted file mode 100644
index 1f1cba4152ceecbe61d0db0b972f98df7d5d91ac..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/sound/mt8183-afe-pcm.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-Mediatek AFE PCM controller for mt8183
-
-Required properties:
-- compatible = "mediatek,mt68183-audio";
-- reg: register location and size
-- interrupts: should contain AFE interrupt
-- resets: Must contain an entry for each entry in reset-names
-  See ../reset/reset.txt for details.
-- reset-names: should have these reset names:
-		"audiosys";
-- power-domains: should define the power domain
-- clocks: Must contain an entry for each entry in clock-names
-- clock-names: should have these clock names:
-		"infra_sys_audio_clk",
-		"mtkaif_26m_clk",
-		"top_mux_audio",
-		"top_mux_aud_intbus",
-		"top_sys_pll3_d4",
-		"top_clk26m_clk";
-
-Example:
-
-	afe: mt8183-afe-pcm@11220000  {
-		compatible = "mediatek,mt8183-audio";
-		reg = <0 0x11220000 0 0x1000>;
-		interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_LOW>;
-		resets = <&watchdog MT8183_TOPRGU_AUDIO_SW_RST>;
-		reset-names = "audiosys";
-		power-domains = <&scpsys MT8183_POWER_DOMAIN_AUDIO>;
-		clocks = <&infrasys CLK_INFRA_AUDIO>,
-			 <&infrasys CLK_INFRA_AUDIO_26M_BCLK>,
-			 <&topckgen CLK_TOP_MUX_AUDIO>,
-			 <&topckgen CLK_TOP_MUX_AUD_INTBUS>,
-			 <&topckgen CLK_TOP_SYSPLL_D2_D4>,
-			 <&clk26m>;
-		clock-names = "infra_sys_audio_clk",
-			      "mtkaif_26m_clk",
-			      "top_mux_audio",
-			      "top_mux_aud_intbus",
-			      "top_sys_pll_d2_d4",
-			      "top_clk26m_clk";
-	};

-- 
2.50.1


