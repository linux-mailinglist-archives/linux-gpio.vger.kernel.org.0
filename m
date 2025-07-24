Return-Path: <linux-gpio+bounces-23709-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5EDB10408
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 10:41:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EA8F01CC4BCA
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Jul 2025 08:42:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F95C2750F8;
	Thu, 24 Jul 2025 08:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="YqSRG/fC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FBD027FB2A;
	Thu, 24 Jul 2025 08:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753346382; cv=none; b=fDfo5UgDdaNBAhq5PvyXQqpQT9uRPb69gSo9b62kwv3Jrif2HCAIlGisyrzgTBGeCredCk/rz2BxPFJgnrl9MEZpE4hA1vWMvz+HTxH2VnjibsA16Psj/qhUSJBMqBOb+a+XFZG0Bs+f3lkpLQTR23DOOvza+2EhlXTgokuLVdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753346382; c=relaxed/simple;
	bh=TGYeEn4rASoelIzUMmy2maV8vGwdr+8gRNZVgzYxZXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ytbv3ar/1FBe7Ie0BhzToXxYW8nTOmnAJ9bS1kKoKuQTrotFL3d+ZKIjnPDxHe78pEPXh8zIs7CIj5RJRADEwdd4p3Y9jSyyooRhnd5xt4C8w8QjMF1CFgcCAO1tbAeJc43NmXuBiplevwc2YqKIN7dmmqtbj7hml7qD/ZW+qLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=YqSRG/fC; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346376;
	bh=TGYeEn4rASoelIzUMmy2maV8vGwdr+8gRNZVgzYxZXU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YqSRG/fCxQRunFFV1yGdU6hNqpqitP4mUJtNHR93jnSyNVDd3Sk8tGhDtEzxJAMXQ
	 sD6xmva1gESfpH1fDDwHsbrXi/KruWYbrpyQ8GdEfI05FnHdMGF7BApomejzwxxRaC
	 HLJEp2BhbB1VDYvszNp7zyD/wPULNWnqTwE2Il5GdP527r78pWae5QbIZqg5VybC5f
	 bRpZckGWQBfIPfyc3KDRBE2QYnr1yv1p/lmfjDVSDwu2i160GYGFAc3fPu/aDKZtYu
	 6S4GPENKRehIwdZjMcl0r1qzPbMClhKcA8bXFW9WoAEV1n7RYt3nelGmR3E6gWHV0E
	 0vM1jkRwenw3g==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9C4ED17E129C;
	Thu, 24 Jul 2025 10:39:33 +0200 (CEST)
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
Subject: [PATCH 04/38] ASoC: dt-bindings: mt8192-afe-pcm: Fix clocks and clock-names
Date: Thu, 24 Jul 2025 10:38:40 +0200
Message-ID: <20250724083914.61351-5-angelogioacchino.delregno@collabora.com>
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

Both clocks and clock-names are missing (a lot of) entries: add
all the used audio clocks and their description and also fix the
example node.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/sound/mt8192-afe-pcm.yaml        | 106 +++++++++++++++++-
 1 file changed, 104 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
index 8ddf49b0040d..96ee0a47360d 100644
--- a/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8192-afe-pcm.yaml
@@ -47,16 +47,118 @@ properties:
       - description: AFE clock
       - description: ADDA DAC clock
       - description: ADDA DAC pre-distortion clock
-      - description: audio infra sys clock
-      - description: audio infra 26M clock
+      - description: ADDA ADC clock
+      - description: ADDA6 ADC clock
+      - description: Audio low-jitter 22.5792m clock
+      - description: Audio low-jitter 24.576m clock
+      - description: Audio PLL1 tuner clock
+      - description: Audio PLL2 tuner clock
+      - description: Audio Time-Division Multiplexing interface clock
+      - description: ADDA ADC Sine Generator clock
+      - description: audio Non-LE clock
+      - description: Audio DAC High-Resolution clock
+      - description: Audio High-Resolution ADC clock
+      - description: Audio High-Resolution ADC SineGen clock
+      - description: Audio ADDA6 High-Resolution ADC clock
+      - description: Tertiary ADDA DAC clock
+      - description: Tertiary ADDA DAC pre-distortion clock
+      - description: Tertiary ADDA DAC Sine Generator clock
+      - description: Tertiary ADDA DAC High-Resolution clock
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
+      - description: Secondary PLL divider by 4 for IEC
+      - description: Mux selector for I2S port 0
+      - description: Mux selector for I2S port 1
+      - description: Mux selector for I2S port 2
+      - description: Mux selector for I2S port 3
+      - description: Mux selector for I2S port 4
+      - description: Mux selector for I2S port 5
+      - description: Mux selector for I2S port 6
+      - description: Mux selector for I2S port 7
+      - description: Mux selector for I2S port 8
+      - description: Mux selector for I2S port 9
+      - description: APLL1 and APLL2 divider for I2S port 0
+      - description: APLL1 and APLL2 divider for I2S port 1
+      - description: APLL1 and APLL2 divider for I2S port 2
+      - description: APLL1 and APLL2 divider for I2S port 3
+      - description: APLL1 and APLL2 divider for I2S port 4
+      - description: APLL1 and APLL2 divider for IEC
+      - description: APLL1 and APLL2 divider for I2S port 5
+      - description: APLL1 and APLL2 divider for I2S port 6
+      - description: APLL1 and APLL2 divider for I2S port 7
+      - description: APLL1 and APLL2 divider for I2S port 8
+      - description: APLL1 and APLL2 divider for I2S port 9
+      - description: Top mux for audio subsystem
+      - description: 26MHz clock for audio subsystem
 
   clock-names:
     items:
       - const: aud_afe_clk
       - const: aud_dac_clk
       - const: aud_dac_predis_clk
+      - const: aud_adc_clk
+      - const: aud_adda6_adc_clk
+      - const: aud_apll22m_clk
+      - const: aud_apll24m_clk
+      - const: aud_apll1_tuner_clk
+      - const: aud_apll2_tuner_clk
+      - const: aud_tdm_clk
+      - const: aud_tml_clk
+      - const: aud_nle
+      - const: aud_dac_hires_clk
+      - const: aud_adc_hires_clk
+      - const: aud_adc_hires_tml
+      - const: aud_adda6_adc_hires_clk
+      - const: aud_3rd_dac_clk
+      - const: aud_3rd_dac_predis_clk
+      - const: aud_3rd_dac_tml
+      - const: aud_3rd_dac_hires_clk
       - const: aud_infra_clk
       - const: aud_infra_26m_clk
+      - const: top_mux_audio
+      - const: top_mux_audio_int
+      - const: top_mainpll_d4_d4
+      - const: top_mux_aud_1
+      - const: top_apll1_ck
+      - const: top_mux_aud_2
+      - const: top_apll2_ck
+      - const: top_mux_aud_eng1
+      - const: top_apll1_d4
+      - const: top_mux_aud_eng2
+      - const: top_apll2_d4
+      - const: top_i2s0_m_sel
+      - const: top_i2s1_m_sel
+      - const: top_i2s2_m_sel
+      - const: top_i2s3_m_sel
+      - const: top_i2s4_m_sel
+      - const: top_i2s5_m_sel
+      - const: top_i2s6_m_sel
+      - const: top_i2s7_m_sel
+      - const: top_i2s8_m_sel
+      - const: top_i2s9_m_sel
+      - const: top_apll12_div0
+      - const: top_apll12_div1
+      - const: top_apll12_div2
+      - const: top_apll12_div3
+      - const: top_apll12_div4
+      - const: top_apll12_divb
+      - const: top_apll12_div5
+      - const: top_apll12_div6
+      - const: top_apll12_div7
+      - const: top_apll12_div8
+      - const: top_apll12_div9
+      - const: top_mux_audio_h
+      - const: top_clk26m_clk
 
 required:
   - compatible
-- 
2.50.1


