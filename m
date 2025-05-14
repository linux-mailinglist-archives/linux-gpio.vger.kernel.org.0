Return-Path: <linux-gpio+bounces-20128-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E95EAB657D
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 10:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7F9C57B32B1
	for <lists+linux-gpio@lfdr.de>; Wed, 14 May 2025 08:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C968E21C162;
	Wed, 14 May 2025 08:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="SHMcbrbK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFB921ADAB;
	Wed, 14 May 2025 08:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747210392; cv=none; b=Y9i14viSS45o+OLY9cNRxq+bgSPnTVhCPjBFZR2d+11+fG4aSLNjpYbOhf8sb8DUjVjZXldAMQNpRcv4U9ggFQiy2kjE75sxdjO6lLCCCl1IngXBiEPDg9gjWao7N+E4SxO4mEd85YzaWk891hHIWspKylINcgwSCxN9DEoW9mQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747210392; c=relaxed/simple;
	bh=8dNL7qXlUebzURAN5oKFRBZjZl8MG0qJ+nBv83ydV00=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hjkKgCmVhSw0sbQp3Uy9Yh8JaSA/W8abVOT9JK/+CJyTTWB5XCry2S+5LiDwsNNH9ANUgAUTKF+h4LK1yOyRt+oaRLtwhrj3IgFdtnSt8S2FhFuBAhMW2Ms83pS4oDFdjfONco3jBWwRpt+aAPgF5McYTG8HRNd6x/NwrrKnEOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=SHMcbrbK; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 41e9e342309b11f0813e4fe1310efc19-20250514
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GRtRPlRxqcUfH74V+92iACzveKBv6uk8BJlvGn4PRsk=;
	b=SHMcbrbKphac0KydJeo7oxrUgQ5ZHBEH3f2iTUbzxLBYC0Sn71jHHQuz5spJLc15Wl8h56txmdp7JtaElXbqKTfTocfTEuYeqPFzmKRjQbfR0tL8PNLGDot4T6DW0gANRxtMzlSqK/KKNkZKh00n8kZx00JU/lPEqF6+yWcP13c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:d8626e95-f162-48af-8d42-0cbdbe48afc7,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:3fbefd3d-da74-431d-a7be-5e6761de3b64,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 41e9e342309b11f0813e4fe1310efc19-20250514
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1353619536; Wed, 14 May 2025 16:13:03 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Wed, 14 May 2025 16:13:01 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Wed, 14 May 2025 16:13:00 +0800
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
Subject: [PATCH v3 03/10] ASoC: mediatek: mt8196: support audio clock control
Date: Wed, 14 May 2025 16:11:05 +0800
Message-ID: <20250514081125.24475-4-darren.ye@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250514081125.24475-1-darren.ye@mediatek.com>
References: <20250514081125.24475-1-darren.ye@mediatek.com>
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

Add audio clock wrapper and audio tuner control.

Signed-off-by: Darren Ye <darren.ye@mediatek.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c    | 723 ++++++++++++++++++
 sound/soc/mediatek/mt8196/mt8196-afe-clk.h    | 142 ++++
 sound/soc/mediatek/mt8196/mt8196-audsys-clk.c | 252 ++++++
 sound/soc/mediatek/mt8196/mt8196-audsys-clk.h |  14 +
 .../soc/mediatek/mt8196/mt8196-audsys-clkid.h |  78 ++
 5 files changed, 1209 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-clk.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-clk.h
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-audsys-clk.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-audsys-clk.h
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-audsys-clkid.h

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
new file mode 100644
index 000000000000..83b5ee9d30ef
--- /dev/null
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
@@ -0,0 +1,723 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  mt8196-afe-clk.c  --  Mediatek 8196 afe clock ctrl
+ *
+ *  Copyright (c) 2024 MediaTek Inc.
+ *  Author: Darren Ye <darren.ye@mediatek.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
+#include "mt8196-afe-common.h"
+#include "mt8196-audsys-clk.h"
+#include "mt8196-afe-clk.h"
+
+static const char *aud_clks[MT8196_CLK_NUM] = {
+	/* vlp clk */
+	[MT8196_CLK_VLP_MUX_AUDIOINTBUS] = "top_aud_intbus",
+	[MT8196_CLK_VLP_MUX_AUD_ENG1] = "top_aud_eng1",
+	[MT8196_CLK_VLP_MUX_AUD_ENG2] = "top_aud_eng2",
+	[MT8196_CLK_VLP_MUX_AUDIO_H] = "top_aud_h",
+	[MT8196_CLK_VLP_CLK26M] = "vlp_clk26m",
+	/* pll */
+	[MT8196_CLK_TOP_APLL1_CK] = "apll1",
+	[MT8196_CLK_TOP_APLL2_CK] = "apll2",
+	/* divider */
+	[MT8196_CLK_TOP_APLL1_D4] = "apll1_d4",
+	[MT8196_CLK_TOP_APLL2_D4] = "apll2_d4",
+	[MT8196_CLK_TOP_APLL12_DIV_I2SIN0] = "apll12_div_i2sin0",
+	[MT8196_CLK_TOP_APLL12_DIV_I2SIN1] = "apll12_div_i2sin1",
+	[MT8196_CLK_TOP_APLL12_DIV_FMI2S] = "apll12_div_fmi2s",
+	[MT8196_CLK_TOP_APLL12_DIV_TDMOUT_M] = "apll12_div_tdmout_m",
+	[MT8196_CLK_TOP_APLL12_DIV_TDMOUT_B] = "apll12_div_tdmout_b",
+	/* mux */
+	[MT8196_CLK_TOP_MUX_AUD_1] = "top_apll1",
+	[MT8196_CLK_TOP_MUX_AUD_2] = "top_apll2",
+	[MT8196_CLK_TOP_I2SIN0_M_SEL] = "top_i2sin0",
+	[MT8196_CLK_TOP_I2SIN1_M_SEL] = "top_i2sin1",
+	[MT8196_CLK_TOP_FMI2S_M_SEL] = "top_fmi2s",
+	[MT8196_CLK_TOP_TDMOUT_M_SEL] = "top_dptx",
+	[MT8196_CLK_TOP_ADSP_SEL] = "top_adsp",
+	/* top 26m*/
+	[MT8196_CLK_TOP_CLK26M] = "clk26m",
+	/* clock gate */
+	[MT8196_CLK_AFE_AUDIO_HOPPING] = "afe_audio_hopping_ck",
+	[MT8196_CLK_AFE_AUDIO_F26M] = "afe_audio_f26m_ck",
+	[MT8196_CLK_AFE_APLL1] = "afe_apll1_ck",
+	[MT8196_CLK_AFE_APLL2] = "afe_apll2_ck",
+	[MT8196_CLK_AFE_APLL_TUNER1] = "afe_apll_tuner1",
+	[MT8196_CLK_AFE_APLL_TUNER2] = "afe_apll_tuner2",
+	[MT8196_CLK_AFE_ETDM_OUT4] = "afe_etdm_out4",
+	[MT8196_CLK_AFE_ETDM_IN6] = "afe_etdm_in6",
+	[MT8196_CLK_AFE_ETDM_OUT6] = "afe_etdm_out6",
+	[MT8196_CLK_AFE_TDM_OUT] = "afe_tdm_out",
+	[MT8196_CLK_AFE_CM0] = "afe_cm0",
+	[MT8196_CLK_AFE_CM1] = "afe_cm1",
+	[MT8196_CLK_AFE_CM2] = "afe_cm2",
+};
+
+int mt8196_afe_enable_clk(struct mtk_base_afe *afe, struct clk *clk)
+{
+	int ret;
+
+	if (clk) {
+		ret = clk_prepare_enable(clk);
+		if (ret) {
+			dev_dbg(afe->dev, "failed to enable clk\n");
+			return ret;
+		}
+	} else {
+		dev_dbg(afe->dev, "NULL clk\n");
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt8196_afe_enable_clk);
+
+void mt8196_afe_disable_clk(struct mtk_base_afe *afe, struct clk *clk)
+{
+	if (clk)
+		clk_disable_unprepare(clk);
+	else
+		dev_dbg(afe->dev, "NULL clk\n");
+}
+EXPORT_SYMBOL_GPL(mt8196_afe_disable_clk);
+
+static int mt8196_afe_set_clk_rate(struct mtk_base_afe *afe, struct clk *clk,
+				   unsigned int rate)
+{
+	int ret;
+
+	if (clk) {
+		ret = clk_set_rate(clk, rate);
+		if (ret) {
+			dev_dbg(afe->dev, "failed to set clk rate\n");
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static int mt8196_afe_set_clk_parent(struct mtk_base_afe *afe, struct clk *clk,
+				     struct clk *parent)
+{
+	int ret;
+
+	if (clk && parent) {
+		ret = clk_set_parent(clk, parent);
+		if (ret) {
+			dev_dbg(afe->dev, "failed to set clk parent %d\n", ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static unsigned int get_top_cg_reg(unsigned int cg_type)
+{
+	switch (cg_type) {
+	case MT8196_AUDIO_26M_EN_ON:
+	case MT8196_AUDIO_F3P25M_EN_ON:
+	case MT8196_AUDIO_APLL1_EN_ON:
+	case MT8196_AUDIO_APLL2_EN_ON:
+		return AUDIO_ENGEN_CON0;
+	default:
+		return 0;
+	}
+}
+
+static unsigned int get_top_cg_mask(unsigned int cg_type)
+{
+	switch (cg_type) {
+	case MT8196_AUDIO_26M_EN_ON:
+		return AUDIO_26M_EN_ON_MASK_SFT;
+	case MT8196_AUDIO_F3P25M_EN_ON:
+		return AUDIO_F3P25M_EN_ON_MASK_SFT;
+	case MT8196_AUDIO_APLL1_EN_ON:
+		return AUDIO_APLL1_EN_ON_MASK_SFT;
+	case MT8196_AUDIO_APLL2_EN_ON:
+		return AUDIO_APLL2_EN_ON_MASK_SFT;
+	default:
+		return 0;
+	}
+}
+
+static unsigned int get_top_cg_on_val(unsigned int cg_type)
+{
+	switch (cg_type) {
+	case MT8196_AUDIO_26M_EN_ON:
+	case MT8196_AUDIO_F3P25M_EN_ON:
+	case MT8196_AUDIO_APLL1_EN_ON:
+	case MT8196_AUDIO_APLL2_EN_ON:
+		return get_top_cg_mask(cg_type);
+	default:
+		return 0;
+	}
+}
+
+static unsigned int get_top_cg_off_val(unsigned int cg_type)
+{
+	switch (cg_type) {
+	case MT8196_AUDIO_26M_EN_ON:
+	case MT8196_AUDIO_F3P25M_EN_ON:
+	case MT8196_AUDIO_APLL1_EN_ON:
+	case MT8196_AUDIO_APLL2_EN_ON:
+		return 0;
+	default:
+		return get_top_cg_mask(cg_type);
+	}
+}
+
+static int mt8196_afe_enable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type)
+{
+	unsigned int reg = get_top_cg_reg(cg_type);
+	unsigned int mask = get_top_cg_mask(cg_type);
+	unsigned int val = get_top_cg_on_val(cg_type);
+
+	regmap_update_bits(afe->regmap, reg, mask, val);
+	return 0;
+}
+
+static int mt8196_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type)
+{
+	unsigned int reg = get_top_cg_reg(cg_type);
+	unsigned int mask = get_top_cg_mask(cg_type);
+	unsigned int val = get_top_cg_off_val(cg_type);
+
+	regmap_update_bits(afe->regmap, reg, mask, val);
+	return 0;
+}
+
+static int mt8196_afe_enable_afe_on(struct mtk_base_afe *afe)
+{
+	mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_26M_EN_ON);
+	return 0;
+}
+
+static int mt8196_afe_disable_afe_on(struct mtk_base_afe *afe)
+{
+	mt8196_afe_disable_top_cg(afe, MT8196_AUDIO_26M_EN_ON);
+	return 0;
+}
+
+static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	int ret = 0;
+
+	dev_dbg(afe->dev, "enable: %d\n", enable);
+
+	if (enable) {
+		ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_1]);
+		if (ret)
+			return ret;
+
+		ret = mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_1],
+						afe_priv->clk[MT8196_CLK_TOP_APLL1_CK]);
+		if (ret)
+			return ret;
+
+		/* 180.6336 / 4 = 45.1584MHz */
+		ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG1]);
+		if (ret)
+			return ret;
+
+		ret = mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG1],
+						afe_priv->clk[MT8196_CLK_TOP_APLL1_D4]);
+		if (ret)
+			return ret;
+
+		ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+		if (ret)
+			return ret;
+
+		ret = mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
+						afe_priv->clk[MT8196_CLK_TOP_APLL1_CK]);
+		if (ret)
+			return ret;
+	} else {
+		ret = mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG1],
+						afe_priv->clk[MT8196_CLK_VLP_CLK26M]);
+		if (ret)
+			return ret;
+
+		mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG1]);
+
+		ret = mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_1],
+						afe_priv->clk[MT8196_CLK_TOP_CLK26M]);
+		if (ret)
+			return ret;
+
+		mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_1]);
+		mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
+					  afe_priv->clk[MT8196_CLK_VLP_CLK26M]);
+		mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+	}
+
+	return 0;
+}
+
+static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	int ret = 0;
+
+	dev_dbg(afe->dev, "enable: %d\n", enable);
+
+	if (enable) {
+		ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_2]);
+		if (ret)
+			return ret;
+
+		ret = mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_2],
+						afe_priv->clk[MT8196_CLK_TOP_APLL2_CK]);
+		if (ret)
+			return ret;
+
+		/* 196.608 / 4 = 49.152MHz */
+		ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG2]);
+		if (ret)
+			return ret;
+
+		ret = mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG2],
+						afe_priv->clk[MT8196_CLK_TOP_APLL2_D4]);
+		if (ret)
+			return ret;
+
+		ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+		if (ret)
+			return ret;
+
+		ret = mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
+						afe_priv->clk[MT8196_CLK_TOP_APLL2_CK]);
+		if (ret)
+			return ret;
+	} else {
+		ret = mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG2],
+						afe_priv->clk[MT8196_CLK_VLP_CLK26M]);
+		if (ret)
+			return ret;
+
+		mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG2]);
+
+		ret = mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_2],
+						afe_priv->clk[MT8196_CLK_TOP_CLK26M]);
+		if (ret)
+			return ret;
+
+		mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_2]);
+		mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
+					  afe_priv->clk[MT8196_CLK_VLP_CLK26M]);
+		mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+	}
+
+	return 0;
+}
+
+static int mt8196_afe_disable_apll(struct mtk_base_afe *afe)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	int ret = 0;
+
+	ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+	if (ret)
+		return ret;
+
+	ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_1]);
+	if (ret)
+		goto clk_ck_mux_aud1_err;
+
+	ret = mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_1],
+					afe_priv->clk[MT8196_CLK_TOP_CLK26M]);
+	if (ret)
+		goto clk_ck_mux_aud1_parent_err;
+
+	ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_2]);
+	if (ret)
+		goto clk_ck_mux_aud2_err;
+
+	ret = mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_2],
+					afe_priv->clk[MT8196_CLK_TOP_CLK26M]);
+	if (ret)
+		goto clk_ck_mux_aud2_parent_err;
+
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_1]);
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_2]);
+	mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
+				  afe_priv->clk[MT8196_CLK_VLP_CLK26M]);
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+	return 0;
+
+clk_ck_mux_aud2_parent_err:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_2]);
+clk_ck_mux_aud2_err:
+	mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_1],
+				  afe_priv->clk[MT8196_CLK_TOP_APLL1_CK]);
+clk_ck_mux_aud1_parent_err:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_1]);
+clk_ck_mux_aud1_err:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+
+	return ret;
+}
+
+static void mt8196_afe_apll_init(struct mtk_base_afe *afe)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+
+	if (afe_priv->vlp_ck) {
+		regmap_write(afe_priv->vlp_ck, VLP_APLL1_TUNER_CON0, VLP_APLL1_TUNER_CON0_VALUE);
+		regmap_write(afe_priv->vlp_ck, VLP_APLL2_TUNER_CON0, VLP_APLL2_TUNER_CON0_VALUE);
+	} else {
+		dev_warn(afe->dev, "vlp_ck regmap is null ptr\n");
+	}
+}
+
+int mt8196_apll1_enable(struct mtk_base_afe *afe)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	int ret;
+
+	/* setting for APLL */
+	apll1_mux_setting(afe, true);
+
+	ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_APLL1]);
+	if (ret)
+		goto ERR_CLK_APLL1;
+
+	ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_APLL_TUNER1]);
+	if (ret)
+		goto ERR_CLK_APLL1_TUNER;
+
+	/* sel 44.1kHz:1, apll_div:7, upper bound:3 */
+	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
+			   XTAL_EN_128FS_SEL_MASK_SFT | APLL_DIV_MASK_SFT | UPPER_BOUND_MASK_SFT,
+			   (0x1 << XTAL_EN_128FS_SEL_SFT) | (7 << APLL_DIV_SFT) |
+			   (3 << UPPER_BOUND_SFT));
+
+	/* apll1 freq tuner enable */
+	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x1 << FREQ_TUNER_EN_SFT);
+
+	/* audio apll1 on */
+	mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_APLL1_EN_ON);
+
+	return 0;
+
+ERR_CLK_APLL1_TUNER:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_APLL_TUNER1]);
+ERR_CLK_APLL1:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_APLL1]);
+	return ret;
+}
+
+void mt8196_apll1_disable(struct mtk_base_afe *afe)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+
+	/* audio apll1 off */
+	mt8196_afe_disable_top_cg(afe, MT8196_AUDIO_APLL1_EN_ON);
+
+	/* apll1 freq tuner disable */
+	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x0);
+
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_APLL_TUNER1]);
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_APLL1]);
+	apll1_mux_setting(afe, false);
+}
+
+int mt8196_apll2_enable(struct mtk_base_afe *afe)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	int ret;
+
+	/* setting for APLL */
+	apll2_mux_setting(afe, true);
+
+	ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_APLL2]);
+	if (ret)
+		goto ERR_CLK_APLL2;
+
+	ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_APLL_TUNER2]);
+	if (ret)
+		goto ERR_CLK_APLL2_TUNER;
+
+	/* sel 48kHz: 2, apll_div: 7, upper bound: 3*/
+	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
+			   XTAL_EN_128FS_SEL_MASK_SFT | APLL_DIV_MASK_SFT | UPPER_BOUND_MASK_SFT,
+			   (0x2 << XTAL_EN_128FS_SEL_SFT) | (7 << APLL_DIV_SFT) |
+			   (3 << UPPER_BOUND_SFT));
+
+	/* apll2 freq tuner enable */
+	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x1 << FREQ_TUNER_EN_SFT);
+
+	/* audio apll2 on */
+	mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_APLL2_EN_ON);
+	return 0;
+
+ERR_CLK_APLL2_TUNER:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_APLL_TUNER2]);
+ERR_CLK_APLL2:
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_APLL2]);
+	return ret;
+
+	return 0;
+}
+
+void mt8196_apll2_disable(struct mtk_base_afe *afe)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+
+	/* audio apll2 off */
+	mt8196_afe_disable_top_cg(afe, MT8196_AUDIO_APLL2_EN_ON);
+
+	/* apll2 freq tuner disable */
+	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x0);
+
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_APLL_TUNER2]);
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_APLL2]);
+	apll2_mux_setting(afe, false);
+}
+
+int mt8196_get_apll_rate(struct mtk_base_afe *afe, int apll)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	int clk_id = 0;
+
+	if (apll < MT8196_APLL1 || apll > MT8196_APLL2) {
+		dev_warn(afe->dev, "invalid clk id\n");
+		return 0;
+	}
+
+	if (apll == MT8196_APLL1)
+		clk_id = MT8196_CLK_TOP_APLL1_CK;
+	else
+		clk_id = MT8196_CLK_TOP_APLL2_CK;
+
+	return clk_get_rate(afe_priv->clk[clk_id]);
+}
+
+int mt8196_get_apll_by_rate(struct mtk_base_afe *afe, int rate)
+{
+	return ((rate % 8000) == 0) ? MT8196_APLL2 : MT8196_APLL1;
+}
+
+int mt8196_get_apll_by_name(struct mtk_base_afe *afe, const char *name)
+{
+	if (strcmp(name, APLL1_W_NAME) == 0)
+		return MT8196_APLL1;
+	else
+		return MT8196_APLL2;
+}
+
+/* mck */
+struct mt8196_mck_div {
+	int m_sel_id;
+	int div_clk_id;
+};
+
+static const struct mt8196_mck_div mck_div[MT8196_MCK_NUM] = {
+	[MT8196_I2SIN0_MCK] = {
+		.m_sel_id = MT8196_CLK_TOP_I2SIN0_M_SEL,
+		.div_clk_id = MT8196_CLK_TOP_APLL12_DIV_I2SIN0,
+	},
+	[MT8196_I2SIN1_MCK] = {
+		.m_sel_id = MT8196_CLK_TOP_I2SIN1_M_SEL,
+		.div_clk_id = MT8196_CLK_TOP_APLL12_DIV_I2SIN1,
+	},
+	[MT8196_FMI2S_MCK] = {
+		.m_sel_id = MT8196_CLK_TOP_FMI2S_M_SEL,
+		.div_clk_id = MT8196_CLK_TOP_APLL12_DIV_FMI2S,
+	},
+	[MT8196_TDMOUT_MCK] = {
+		.m_sel_id = MT8196_CLK_TOP_TDMOUT_M_SEL,
+		.div_clk_id = MT8196_CLK_TOP_APLL12_DIV_TDMOUT_M,
+	},
+	[MT8196_TDMOUT_BCK] = {
+		.m_sel_id = -1,
+		.div_clk_id = MT8196_CLK_TOP_APLL12_DIV_TDMOUT_B,
+	},
+};
+
+int mt8196_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	int apll = mt8196_get_apll_by_rate(afe, rate);
+	int apll_clk_id = apll == MT8196_APLL1 ?
+			  MT8196_CLK_TOP_MUX_AUD_1 : MT8196_CLK_TOP_MUX_AUD_2;
+	int m_sel_id = 0;
+	int div_clk_id = 0;
+	int ret = 0;
+
+	dev_dbg(afe->dev, "mck_id: %d, rate: %d\n", mck_id, rate);
+
+	if (mck_id >= MT8196_MCK_NUM || mck_id < 0)
+		return -EINVAL;
+
+	m_sel_id = mck_div[mck_id].m_sel_id;
+	div_clk_id = mck_div[mck_id].div_clk_id;
+
+	/* select apll */
+	if (m_sel_id >= 0) {
+		ret = mt8196_afe_enable_clk(afe, afe_priv->clk[m_sel_id]);
+		if (ret)
+			return ret;
+
+		ret = mt8196_afe_set_clk_parent(afe, afe_priv->clk[m_sel_id],
+						afe_priv->clk[apll_clk_id]);
+		if (ret)
+			return ret;
+	}
+
+	/* enable div, set rate */
+	if (div_clk_id < 0) {
+		dev_err(afe->dev, "invalid div_clk_id %d\n", div_clk_id);
+		return -EINVAL;
+	}
+	if (div_clk_id == MT8196_CLK_TOP_APLL12_DIV_TDMOUT_B)
+		rate = rate * 16;
+
+	ret = mt8196_afe_enable_clk(afe, afe_priv->clk[div_clk_id]);
+	if (ret)
+		return ret;
+
+	ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[div_clk_id], rate);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+int mt8196_mck_disable(struct mtk_base_afe *afe, int mck_id)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	int m_sel_id = 0;
+	int div_clk_id = 0;
+
+	dev_dbg(afe->dev, "mck_id: %d.\n", mck_id);
+
+	if (mck_id < 0) {
+		dev_err(afe->dev, "mck_id = %d < 0\n", mck_id);
+		return -EINVAL;
+	}
+
+	m_sel_id = mck_div[mck_id].m_sel_id;
+	div_clk_id = mck_div[mck_id].div_clk_id;
+
+	if (div_clk_id < 0) {
+		dev_err(afe->dev, "div_clk_id = %d < 0\n",
+			div_clk_id);
+		return -EINVAL;
+	}
+
+	mt8196_afe_disable_clk(afe, afe_priv->clk[div_clk_id]);
+
+	if (m_sel_id >= 0)
+		mt8196_afe_disable_clk(afe, afe_priv->clk[m_sel_id]);
+
+	return 0;
+}
+
+int mt8196_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+
+	/* bus clock for AFE external access, like DRAM */
+	mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_ADSP_SEL]);
+
+	/* bus clock for AFE internal access, like AFE SRAM */
+	mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIOINTBUS]);
+	mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIOINTBUS],
+				  afe_priv->clk[MT8196_CLK_VLP_CLK26M]);
+	/* enable audio vlp clock source */
+	mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+	mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
+				  afe_priv->clk[MT8196_CLK_VLP_CLK26M]);
+
+	/* AFE hw clock */
+	/* IPM2.0: USE HOPPING & 26M */
+	mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_AUDIO_HOPPING]);
+	mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_AUDIO_F26M]);
+	return 0;
+}
+
+int mt8196_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+
+	/* IPM2.0: Use HOPPING & 26M */
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_AUDIO_HOPPING]);
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_AUDIO_F26M]);
+	mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
+				  afe_priv->clk[MT8196_CLK_VLP_CLK26M]);
+
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+	mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIOINTBUS],
+				  afe_priv->clk[MT8196_CLK_VLP_CLK26M]);
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIOINTBUS]);
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_ADSP_SEL]);
+	return 0;
+}
+
+int mt8196_afe_enable_main_clock(struct mtk_base_afe *afe)
+{
+	mt8196_afe_enable_afe_on(afe);
+	return 0;
+}
+
+int mt8196_afe_disable_main_clock(struct mtk_base_afe *afe)
+{
+	mt8196_afe_disable_afe_on(afe);
+	return 0;
+}
+
+int mt8196_init_clock(struct mtk_base_afe *afe)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	int ret = 0;
+	int i = 0;
+
+	ret = mt8196_audsys_clk_register(afe);
+	if (ret) {
+		dev_err(afe->dev, "register audsys clk fail %d\n", ret);
+		return ret;
+	}
+
+	afe_priv->clk = devm_kcalloc(afe->dev, MT8196_CLK_NUM, sizeof(*afe_priv->clk),
+				     GFP_KERNEL);
+	if (!afe_priv->clk)
+		return -ENOMEM;
+
+	for (i = 0; i < MT8196_CLK_NUM; i++) {
+		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
+		if (IS_ERR(afe_priv->clk[i])) {
+			dev_err(afe->dev, "devm_clk_get %s fail\n", aud_clks[i]);
+			return PTR_ERR(afe_priv->clk[i]);
+		}
+	}
+
+	afe_priv->vlp_ck = syscon_regmap_lookup_by_phandle(afe->dev->of_node,
+							   "vlpcksys");
+	if (IS_ERR(afe_priv->vlp_ck)) {
+		dev_err(afe->dev, "Cannot find vlpcksys\n");
+		return PTR_ERR(afe_priv->vlp_ck);
+	}
+
+	mt8196_afe_apll_init(afe);
+
+	ret = mt8196_afe_disable_apll(afe);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.h b/sound/soc/mediatek/mt8196/mt8196-afe-clk.h
new file mode 100644
index 000000000000..60f5e5a157d5
--- /dev/null
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.h
@@ -0,0 +1,142 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * mt8196-afe-clk.h  --  Mediatek 8196 afe clock ctrl definition
+ *
+ * Copyright (c) 2024 MediaTek Inc.
+ *  Author: Darren Ye <darren.ye@mediatek.com>
+ */
+
+#ifndef _MT8196_AFE_CLOCK_CTRL_H_
+#define _MT8196_AFE_CLOCK_CTRL_H_
+
+/* vlp_cksys_clk: 0x1c016000 */
+#define VLP_APLL1_TUNER_CON0 0x02a4
+#define VLP_APLL2_TUNER_CON0 0x02a8
+
+/* vlp apll1 tuner default value*/
+#define VLP_APLL1_TUNER_CON0_VALUE 0x6f28bd4d
+/* vlp apll2 tuner default value + 1*/
+#define VLP_APLL2_TUNER_CON0_VALUE 0x78fd5265
+
+/* APLL */
+#define APLL1_W_NAME "APLL1"
+#define APLL2_W_NAME "APLL2"
+
+enum {
+	MT8196_APLL1 = 0,
+	MT8196_APLL2,
+};
+
+enum {
+	/* vlp clk */
+	MT8196_CLK_VLP_MUX_AUDIOINTBUS,
+	MT8196_CLK_VLP_MUX_AUD_ENG1,
+	MT8196_CLK_VLP_MUX_AUD_ENG2,
+	MT8196_CLK_VLP_MUX_AUDIO_H,
+	MT8196_CLK_VLP_CLK26M,
+	/* pll */
+	MT8196_CLK_TOP_APLL1_CK,
+	MT8196_CLK_TOP_APLL2_CK,
+	/* divider */
+	MT8196_CLK_TOP_APLL1_D4,
+	MT8196_CLK_TOP_APLL2_D4,
+	MT8196_CLK_TOP_APLL12_DIV_I2SIN0,
+	MT8196_CLK_TOP_APLL12_DIV_I2SIN1,
+	MT8196_CLK_TOP_APLL12_DIV_FMI2S,
+	MT8196_CLK_TOP_APLL12_DIV_TDMOUT_M,
+	MT8196_CLK_TOP_APLL12_DIV_TDMOUT_B,
+	/* mux */
+	MT8196_CLK_TOP_MUX_AUD_1,
+	MT8196_CLK_TOP_MUX_AUD_2,
+	MT8196_CLK_TOP_I2SIN0_M_SEL,
+	MT8196_CLK_TOP_I2SIN1_M_SEL,
+	MT8196_CLK_TOP_FMI2S_M_SEL,
+	MT8196_CLK_TOP_TDMOUT_M_SEL,
+	MT8196_CLK_TOP_ADSP_SEL,
+	/* top 26m */
+	MT8196_CLK_TOP_CLK26M,
+	/* clock gate */
+	MT8196_CLK_AFE_PCM1,
+	MT8196_CLK_AFE_PCM0,
+	MT8196_CLK_AFE_CM2,
+	MT8196_CLK_AFE_CM1,
+	MT8196_CLK_AFE_CM0,
+	MT8196_CLK_AFE_STF,
+	MT8196_CLK_AFE_HW_GAIN23,
+	MT8196_CLK_AFE_HW_GAIN01,
+	MT8196_CLK_AFE_FM_I2S,
+	MT8196_CLK_AFE_MTKAIFV4,
+	MT8196_CLK_AFE_UL2_ADC_HIRES_TML,
+	MT8196_CLK_AFE_UL2_ADC_HIRES,
+	MT8196_CLK_AFE_UL2_TML,
+	MT8196_CLK_AFE_UL2_ADC,
+	MT8196_CLK_AFE_UL1_ADC_HIRES_TML,
+	MT8196_CLK_AFE_UL1_ADC_HIRES,
+	MT8196_CLK_AFE_UL1_TML,
+	MT8196_CLK_AFE_UL1_ADC,
+	MT8196_CLK_AFE_UL0_ADC_HIRES_TML,
+	MT8196_CLK_AFE_UL0_ADC_HIRES,
+	MT8196_CLK_AFE_UL0_TML,
+	MT8196_CLK_AFE_UL0_ADC,
+	MT8196_CLK_AFE_ETDM_IN6,
+	MT8196_CLK_AFE_ETDM_IN5,
+	MT8196_CLK_AFE_ETDM_IN4,
+	MT8196_CLK_AFE_ETDM_IN3,
+	MT8196_CLK_AFE_ETDM_IN2,
+	MT8196_CLK_AFE_ETDM_IN1,
+	MT8196_CLK_AFE_ETDM_IN0,
+	MT8196_CLK_AFE_ETDM_OUT6,
+	MT8196_CLK_AFE_ETDM_OUT5,
+	MT8196_CLK_AFE_ETDM_OUT4,
+	MT8196_CLK_AFE_ETDM_OUT3,
+	MT8196_CLK_AFE_ETDM_OUT2,
+	MT8196_CLK_AFE_ETDM_OUT1,
+	MT8196_CLK_AFE_ETDM_OUT0,
+	MT8196_CLK_AFE_TDM_OUT,
+	MT8196_CLK_AFE_GENERAL15_ASRC,
+	MT8196_CLK_AFE_GENERAL14_ASRC,
+	MT8196_CLK_AFE_GENERAL13_ASRC,
+	MT8196_CLK_AFE_GENERAL12_ASRC,
+	MT8196_CLK_AFE_GENERAL11_ASRC,
+	MT8196_CLK_AFE_GENERAL10_ASRC,
+	MT8196_CLK_AFE_GENERAL9_ASRC,
+	MT8196_CLK_AFE_GENERAL8_ASRC,
+	MT8196_CLK_AFE_GENERAL7_ASRC,
+	MT8196_CLK_AFE_GENERAL6_ASRC,
+	MT8196_CLK_AFE_GENERAL5_ASRC,
+	MT8196_CLK_AFE_GENERAL4_ASRC,
+	MT8196_CLK_AFE_GENERAL3_ASRC,
+	MT8196_CLK_AFE_GENERAL2_ASRC,
+	MT8196_CLK_AFE_GENERAL1_ASRC,
+	MT8196_CLK_AFE_GENERAL0_ASRC,
+	MT8196_CLK_AFE_CONNSYS_I2S_ASRC,
+	MT8196_CLK_AFE_AUDIO_HOPPING,
+	MT8196_CLK_AFE_AUDIO_F26M,
+	MT8196_CLK_AFE_APLL1,
+	MT8196_CLK_AFE_APLL2,
+	MT8196_CLK_AFE_H208M,
+	MT8196_CLK_AFE_APLL_TUNER2,
+	MT8196_CLK_AFE_APLL_TUNER1,
+	MT8196_CLK_NUM,
+};
+
+struct mtk_base_afe;
+
+int mt8196_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate);
+int mt8196_mck_disable(struct mtk_base_afe *afe, int mck_id);
+int mt8196_get_apll_rate(struct mtk_base_afe *afe, int apll);
+int mt8196_get_apll_by_rate(struct mtk_base_afe *afe, int rate);
+int mt8196_get_apll_by_name(struct mtk_base_afe *afe, const char *name);
+int mt8196_init_clock(struct mtk_base_afe *afe);
+int mt8196_afe_enable_clk(struct mtk_base_afe *afe, struct clk *clk);
+void mt8196_afe_disable_clk(struct mtk_base_afe *afe, struct clk *clk);
+int mt8196_apll1_enable(struct mtk_base_afe *afe);
+void mt8196_apll1_disable(struct mtk_base_afe *afe);
+int mt8196_apll2_enable(struct mtk_base_afe *afe);
+void mt8196_apll2_disable(struct mtk_base_afe *afe);
+int mt8196_afe_enable_main_clock(struct mtk_base_afe *afe);
+int mt8196_afe_disable_main_clock(struct mtk_base_afe *afe);
+int mt8196_afe_enable_reg_rw_clk(struct mtk_base_afe *afe);
+int mt8196_afe_disable_reg_rw_clk(struct mtk_base_afe *afe);
+
+#endif
diff --git a/sound/soc/mediatek/mt8196/mt8196-audsys-clk.c b/sound/soc/mediatek/mt8196/mt8196-audsys-clk.c
new file mode 100644
index 000000000000..aa40f02698ac
--- /dev/null
+++ b/sound/soc/mediatek/mt8196/mt8196-audsys-clk.c
@@ -0,0 +1,252 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * mt8196-audsys-clk.c  --  MediaTek 8196 audsys clock control
+ *
+ * Copyright (c) 2025 MediaTek Inc.
+ * Author: Darren Ye <darren.ye@mediatek.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/clkdev.h>
+#include "mt8196-afe-common.h"
+#include "mt8196-audsys-clk.h"
+#include "mt8196-audsys-clkid.h"
+#include "mt8196-reg.h"
+
+struct afe_gate {
+	int id;
+	const char *name;
+	const char *parent_name;
+	int reg;
+	u8 bit;
+	const struct clk_ops *ops;
+	unsigned long flags;
+	u8 cg_flags;
+};
+
+#define GATE_AFE_FLAGS(_id, _name, _parent, _reg, _bit, _flags, _cgflags) {\
+		.id = _id,					\
+		.name = _name,					\
+		.parent_name = _parent,				\
+		.reg = _reg,					\
+		.bit = _bit,					\
+		.flags = _flags,				\
+		.cg_flags = _cgflags,				\
+	}
+
+#define GATE_AFE(_id, _name, _parent, _reg, _bit)		\
+	GATE_AFE_FLAGS(_id, _name, _parent, _reg, _bit,		\
+		       CLK_SET_RATE_PARENT, CLK_GATE_SET_TO_DISABLE)
+
+#define GATE_AUD0(_id, _name, _parent, _bit)			\
+	GATE_AFE(_id, _name, _parent, AUDIO_TOP_CON0, _bit)
+
+#define GATE_AUD1(_id, _name, _parent, _bit)			\
+	GATE_AFE(_id, _name, _parent, AUDIO_TOP_CON1, _bit)
+
+#define GATE_AUD2(_id, _name, _parent, _bit)			\
+	GATE_AFE(_id, _name, _parent, AUDIO_TOP_CON2, _bit)
+
+#define GATE_AUD3(_id, _name, _parent, _bit)			\
+	GATE_AFE(_id, _name, _parent, AUDIO_TOP_CON3, _bit)
+
+#define GATE_AUD4(_id, _name, _parent, _bit)			\
+	GATE_AFE(_id, _name, _parent, AUDIO_TOP_CON4, _bit)
+
+static const struct afe_gate aud_clks[CLK_AFE_NR_CLK] = {
+	/* AFE0 */
+	GATE_AUD0(CLK_AFE_PCM1, "afe_pcm1",
+		  "vlp_aud_clksq_ck", 13),
+	GATE_AUD0(CLK_AFE_PCM0, "afe_pcm0",
+		  "vlp_aud_clksq_ck", 14),
+	GATE_AUD0(CLK_AFE_CM2, "afe_cm2",
+		  "vlp_aud_clksq_ck", 16),
+	GATE_AUD0(CLK_AFE_CM1, "afe_cm1",
+		  "vlp_aud_clksq_ck", 17),
+	GATE_AUD0(CLK_AFE_CM0, "afe_cm0",
+		  "vlp_aud_clksq_ck", 18),
+	GATE_AUD0(CLK_AFE_STF, "afe_stf",
+		  "vlp_aud_clksq_ck", 19),
+	GATE_AUD0(CLK_AFE_HW_GAIN23, "afe_hw_gain23",
+		  "vlp_aud_clksq_ck", 20),
+	GATE_AUD0(CLK_AFE_HW_GAIN01, "afe_hw_gain01",
+		  "vlp_aud_clksq_ck", 21),
+	GATE_AUD0(CLK_AFE_FM_I2S, "afe_fm_i2s",
+		  "vlp_aud_clksq_ck", 24),
+	GATE_AUD0(CLK_AFE_MTKAIFV4, "afe_mtkaifv4",
+		  "vlp_aud_clksq_ck", 25),
+	/* AFE1 */
+	GATE_AUD1(CLK_AFE_UL2_ADC_HIRES_TML, "afe_ul2_aht",
+		  "vlp_audio_h_ck", 12),
+	GATE_AUD1(CLK_AFE_UL2_ADC_HIRES, "afe_ul2_adc_hires",
+		  "vlp_audio_h_ck", 13),
+	GATE_AUD1(CLK_AFE_UL2_TML, "afe_ul2_tml",
+		  "vlp_aud_clksq_ck", 14),
+	GATE_AUD1(CLK_AFE_UL2_ADC, "afe_ul2_adc",
+		  "vlp_aud_clksq_ck", 15),
+	GATE_AUD1(CLK_AFE_UL1_ADC_HIRES_TML, "afe_ul1_aht",
+		  "vlp_audio_h_ck", 16),
+	GATE_AUD1(CLK_AFE_UL1_ADC_HIRES, "afe_ul1_adc_hires",
+		  "vlp_audio_h_ck", 17),
+	GATE_AUD1(CLK_AFE_UL1_TML, "afe_ul1_tml",
+		  "vlp_aud_clksq_ck", 18),
+	GATE_AUD1(CLK_AFE_UL1_ADC, "afe_ul1_adc",
+		  "vlp_aud_clksq_ck", 19),
+	GATE_AUD1(CLK_AFE_UL0_ADC_HIRES_TML, "afe_ul0_aht",
+		  "vlp_audio_h_ck", 20),
+	GATE_AUD1(CLK_AFE_UL0_ADC_HIRES, "afe_ul0_adc_hires",
+		  "vlp_audio_h_ck", 21),
+	GATE_AUD1(CLK_AFE_UL0_TML, "afe_ul0_tml",
+		  "vlp_aud_clksq_ck", 22),
+	GATE_AUD1(CLK_AFE_UL0_ADC, "afe_ul0_adc",
+		  "vlp_aud_clksq_ck", 23),
+	/* AFE2 */
+	GATE_AUD2(CLK_AFE_ETDM_IN6, "afe_etdm_in6",
+		  "vlp_aud_clksq_ck", 7),
+	GATE_AUD2(CLK_AFE_ETDM_IN5, "afe_etdm_in5",
+		  "vlp_aud_clksq_ck", 8),
+	GATE_AUD2(CLK_AFE_ETDM_IN4, "afe_etdm_in4",
+		  "vlp_aud_clksq_ck", 9),
+	GATE_AUD2(CLK_AFE_ETDM_IN3, "afe_etdm_in3",
+		  "vlp_aud_clksq_ck", 10),
+	GATE_AUD2(CLK_AFE_ETDM_IN2, "afe_etdm_in2",
+		  "vlp_aud_clksq_ck", 11),
+	GATE_AUD2(CLK_AFE_ETDM_IN1, "afe_etdm_in1",
+		  "vlp_aud_clksq_ck", 12),
+	GATE_AUD2(CLK_AFE_ETDM_IN0, "afe_etdm_in0",
+		  "vlp_aud_clksq_ck", 13),
+	GATE_AUD2(CLK_AFE_ETDM_OUT6, "afe_etdm_out6",
+		  "vlp_aud_clksq_ck", 15),
+	GATE_AUD2(CLK_AFE_ETDM_OUT5, "afe_etdm_out5",
+		  "vlp_aud_clksq_ck", 16),
+	GATE_AUD2(CLK_AFE_ETDM_OUT4, "afe_etdm_out4",
+		  "vlp_aud_clksq_ck", 17),
+	GATE_AUD2(CLK_AFE_ETDM_OUT3, "afe_etdm_out3",
+		  "vlp_aud_clksq_ck", 18),
+	GATE_AUD2(CLK_AFE_ETDM_OUT2, "afe_etdm_out2",
+		  "vlp_aud_clksq_ck", 19),
+	GATE_AUD2(CLK_AFE_ETDM_OUT1, "afe_etdm_out1",
+		  "vlp_aud_clksq_ck", 20),
+	GATE_AUD2(CLK_AFE_ETDM_OUT0, "afe_etdm_out0",
+		  "vlp_aud_clksq_ck", 21),
+	GATE_AUD2(CLK_AFE_TDM_OUT, "afe_tdm_out",
+		  "ck_aud_1_ck", 24),
+	/* AFE3 */
+	GATE_AUD3(CLK_AFE_GENERAL15_ASRC, "afe_general15_asrc",
+		  "vlp_aud_clksq_ck", 9),
+	GATE_AUD3(CLK_AFE_GENERAL14_ASRC, "afe_general14_asrc",
+		  "vlp_aud_clksq_ck", 10),
+	GATE_AUD3(CLK_AFE_GENERAL13_ASRC, "afe_general13_asrc",
+		  "vlp_aud_clksq_ck", 11),
+	GATE_AUD3(CLK_AFE_GENERAL12_ASRC, "afe_general12_asrc",
+		  "vlp_aud_clksq_ck", 12),
+	GATE_AUD3(CLK_AFE_GENERAL11_ASRC, "afe_general11_asrc",
+		  "vlp_aud_clksq_ck", 13),
+	GATE_AUD3(CLK_AFE_GENERAL10_ASRC, "afe_general10_asrc",
+		  "vlp_aud_clksq_ck", 14),
+	GATE_AUD3(CLK_AFE_GENERAL9_ASRC, "afe_general9_asrc",
+		  "vlp_aud_clksq_ck", 15),
+	GATE_AUD3(CLK_AFE_GENERAL8_ASRC, "afe_general8_asrc",
+		  "vlp_aud_clksq_ck", 16),
+	GATE_AUD3(CLK_AFE_GENERAL7_ASRC, "afe_general7_asrc",
+		  "vlp_aud_clksq_ck", 17),
+	GATE_AUD3(CLK_AFE_GENERAL6_ASRC, "afe_general6_asrc",
+		  "vlp_aud_clksq_ck", 18),
+	GATE_AUD3(CLK_AFE_GENERAL5_ASRC, "afe_general5_asrc",
+		  "vlp_aud_clksq_ck", 19),
+	GATE_AUD3(CLK_AFE_GENERAL4_ASRC, "afe_general4_asrc",
+		  "vlp_aud_clksq_ck", 20),
+	GATE_AUD3(CLK_AFE_GENERAL3_ASRC, "afe_general3_asrc",
+		  "vlp_aud_clksq_ck", 21),
+	GATE_AUD3(CLK_AFE_GENERAL2_ASRC, "afe_general2_asrc",
+		  "vlp_aud_clksq_ck", 22),
+	GATE_AUD3(CLK_AFE_GENERAL1_ASRC, "afe_general1_asrc",
+		  "vlp_aud_clksq_ck", 23),
+	GATE_AUD3(CLK_AFE_GENERAL0_ASRC, "afe_general0_asrc",
+		  "vlp_aud_clksq_ck", 24),
+	GATE_AUD3(CLK_AFE_CONNSYS_I2S_ASRC, "afe_connsys_i2s_asrc",
+		  "vlp_aud_clksq_ck", 25),
+	/* AFE4 */
+	GATE_AUD4(CLK_AFE_AUDIO_HOPPING, "afe_audio_hopping_ck",
+		  "vlp_aud_clksq_ck", 0),
+	GATE_AUD4(CLK_AFE_AUDIO_F26M, "afe_audio_f26m_ck",
+		  "vlp_aud_clksq_ck", 1),
+	GATE_AUD4(CLK_AFE_APLL1, "afe_apll1_ck",
+		  "ck_aud_1_ck", 2),
+	GATE_AUD4(CLK_AFE_APLL2, "afe_apll2_ck",
+		  "ck_aud_2_ck", 3),
+	GATE_AUD4(CLK_AFE_H208M, "afe_h208m_ck",
+		  "vlp_audio_h_ck", 4),
+	GATE_AUD4(CLK_AFE_APLL_TUNER2, "afe_apll_tuner2",
+		  "vlp_aud_engen2_ck", 12),
+	GATE_AUD4(CLK_AFE_APLL_TUNER1, "afe_apll_tuner1",
+		  "vlp_aud_engen1_ck", 13),
+};
+
+static void mt8196_audsys_clk_unregister(void *data)
+{
+	struct mtk_base_afe *afe = data;
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	struct clk *clk;
+	struct clk_lookup *cl;
+	int i;
+
+	if (!afe_priv)
+		return;
+
+	for (i = 0; i < CLK_AFE_NR_CLK; i++) {
+		cl = afe_priv->lookup[i];
+		if (!cl)
+			continue;
+
+		clk = cl->clk;
+		clk_unregister_gate(clk);
+
+		clkdev_drop(cl);
+	}
+}
+
+int mt8196_audsys_clk_register(struct mtk_base_afe *afe)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	struct clk *clk;
+	struct clk_lookup *cl;
+	int i;
+
+	afe_priv->lookup = devm_kcalloc(afe->dev, CLK_AFE_NR_CLK,
+					sizeof(*afe_priv->lookup),
+					GFP_KERNEL);
+
+	if (!afe_priv->lookup)
+		return -ENOMEM;
+
+	for (i = 0; i < ARRAY_SIZE(aud_clks); i++) {
+		const struct afe_gate *gate = &aud_clks[i];
+
+		clk = clk_register_gate(afe->dev, gate->name, gate->parent_name,
+					gate->flags, afe->base_addr + gate->reg,
+					gate->bit, gate->cg_flags, NULL);
+
+		if (IS_ERR(clk)) {
+			dev_err(afe->dev, "Failed to register clk %s: %ld\n",
+				gate->name, PTR_ERR(clk));
+			continue;
+		}
+
+		/* add clk_lookup for devm_clk_get(SND_SOC_DAPM_CLOCK_SUPPLY) */
+		cl = kzalloc(sizeof(*cl), GFP_KERNEL);
+		if (!cl)
+			return -ENOMEM;
+
+		cl->clk = clk;
+		cl->con_id = gate->name;
+		cl->dev_id = dev_name(afe->dev);
+		cl->clk_hw = NULL;
+		clkdev_add(cl);
+
+		afe_priv->lookup[i] = cl;
+	}
+
+	return devm_add_action_or_reset(afe->dev, mt8196_audsys_clk_unregister, afe);
+}
diff --git a/sound/soc/mediatek/mt8196/mt8196-audsys-clk.h b/sound/soc/mediatek/mt8196/mt8196-audsys-clk.h
new file mode 100644
index 000000000000..fad3a38a5ccb
--- /dev/null
+++ b/sound/soc/mediatek/mt8196/mt8196-audsys-clk.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * mt8196-audsys-clk.h  --  MediaTek 8196 audsys clock definition
+ *
+ * Copyright (c) 2025 MediaTek Inc.
+ * Author: Darren Ye <darren.ye@mediatek.com>
+ */
+
+#ifndef _MT8196_AUDSYS_CLK_H_
+#define _MT8196_AUDSYS_CLK_H_
+
+int mt8196_audsys_clk_register(struct mtk_base_afe *afe);
+
+#endif
diff --git a/sound/soc/mediatek/mt8196/mt8196-audsys-clkid.h b/sound/soc/mediatek/mt8196/mt8196-audsys-clkid.h
new file mode 100644
index 000000000000..b61db004eb2b
--- /dev/null
+++ b/sound/soc/mediatek/mt8196/mt8196-audsys-clkid.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * mt8196-audsys-clkid.h  --  MediaTek 8196 audsys clock id definition
+ *
+ * Copyright (c) 2025 MediaTek Inc.
+ * Author: Darren Ye <darren.ye@mediatek.com>
+ */
+
+#ifndef _MT8196_AUDSYS_CLKID_H_
+#define _MT8196_AUDSYS_CLKID_H_
+
+enum{
+	/* AFE */
+	CLK_AFE_PCM1,
+	CLK_AFE_PCM0,
+	CLK_AFE_CM2,
+	CLK_AFE_CM1,
+	CLK_AFE_CM0,
+	CLK_AFE_STF,
+	CLK_AFE_HW_GAIN23,
+	CLK_AFE_HW_GAIN01,
+	CLK_AFE_FM_I2S,
+	CLK_AFE_MTKAIFV4,
+	CLK_AFE_UL2_ADC_HIRES_TML,
+	CLK_AFE_UL2_ADC_HIRES,
+	CLK_AFE_UL2_TML,
+	CLK_AFE_UL2_ADC,
+	CLK_AFE_UL1_ADC_HIRES_TML,
+	CLK_AFE_UL1_ADC_HIRES,
+	CLK_AFE_UL1_TML,
+	CLK_AFE_UL1_ADC,
+	CLK_AFE_UL0_ADC_HIRES_TML,
+	CLK_AFE_UL0_ADC_HIRES,
+	CLK_AFE_UL0_TML,
+	CLK_AFE_UL0_ADC,
+	CLK_AFE_ETDM_IN6,
+	CLK_AFE_ETDM_IN5,
+	CLK_AFE_ETDM_IN4,
+	CLK_AFE_ETDM_IN3,
+	CLK_AFE_ETDM_IN2,
+	CLK_AFE_ETDM_IN1,
+	CLK_AFE_ETDM_IN0,
+	CLK_AFE_ETDM_OUT6,
+	CLK_AFE_ETDM_OUT5,
+	CLK_AFE_ETDM_OUT4,
+	CLK_AFE_ETDM_OUT3,
+	CLK_AFE_ETDM_OUT2,
+	CLK_AFE_ETDM_OUT1,
+	CLK_AFE_ETDM_OUT0,
+	CLK_AFE_TDM_OUT,
+	CLK_AFE_GENERAL15_ASRC,
+	CLK_AFE_GENERAL14_ASRC,
+	CLK_AFE_GENERAL13_ASRC,
+	CLK_AFE_GENERAL12_ASRC,
+	CLK_AFE_GENERAL11_ASRC,
+	CLK_AFE_GENERAL10_ASRC,
+	CLK_AFE_GENERAL9_ASRC,
+	CLK_AFE_GENERAL8_ASRC,
+	CLK_AFE_GENERAL7_ASRC,
+	CLK_AFE_GENERAL6_ASRC,
+	CLK_AFE_GENERAL5_ASRC,
+	CLK_AFE_GENERAL4_ASRC,
+	CLK_AFE_GENERAL3_ASRC,
+	CLK_AFE_GENERAL2_ASRC,
+	CLK_AFE_GENERAL1_ASRC,
+	CLK_AFE_GENERAL0_ASRC,
+	CLK_AFE_CONNSYS_I2S_ASRC,
+	CLK_AFE_AUDIO_HOPPING,
+	CLK_AFE_AUDIO_F26M,
+	CLK_AFE_APLL1,
+	CLK_AFE_APLL2,
+	CLK_AFE_H208M,
+	CLK_AFE_APLL_TUNER2,
+	CLK_AFE_APLL_TUNER1,
+	CLK_AFE_NR_CLK,
+};
+
+#endif
-- 
2.45.2


