Return-Path: <linux-gpio+bounces-22923-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0DE1AFC95E
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 13:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 42C0F562525
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 11:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 646142D9ED9;
	Tue,  8 Jul 2025 11:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="RDULqtuu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97F02D9ECE;
	Tue,  8 Jul 2025 11:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751973511; cv=none; b=fZmLjQ2vQuC9DyTJY0EODFQi9QX9ZnsdcBEkrRBsrtyWsZm3FT/nqws6DomwFFPqXixkQqlK/oTlBGttZpB5yx8l4oF61KgyaF9RDZSixpTw/dgXHXWsVhvygHO5aL/xTTvtNILkPbpw/nJPNPuTe8k5+lDNIsUR5xhTxWbWCQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751973511; c=relaxed/simple;
	bh=w/bRa8PNaHVsdPiRgU/+g5yyTSxVRQn8VUMBXdzf2S4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mIYNA8ZWllsUwvNSU56JXad9tA7iv1kShii5agAQtkzOD3TQAFDO6WShiNcrBOioErSLx6fR0U3xV5bANr36yU4EpPkq5Cg+HwAwJ2md8xmZhlkBbA2FBabN0eN05sDc8jble/XjWLFEF5C4DLE5AyL4Avm8sGw1mixuGo6JXWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=RDULqtuu; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 4188deb25bed11f0b1510d84776b8c0b-20250708
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=nlkxHpivT3eQaSHQAL5DlPdg116SyZ6cCuEDcGZquSU=;
	b=RDULqtuuMEkgtAokiTnwQik1S0mhkO5JuwYJ23gG94yRWkNm5c87PSOzkiXQeRbOeXsmiE/r96ufu+2GlAFnz5J05M04s0jOQjZhxRy1+JzVs5tdPzRfdeJqje+WcCVlOxEViALt5b0lG1raBVlyA456mgc0cEiuS8VLAnJaAhE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:8d17e0f3-8c3d-4a46-bbcd-50e021e1e0d6,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:9eb4ff7,CLOUDID:3274fbd7-b768-4ffb-8a44-cd8427608ba6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 4188deb25bed11f0b1510d84776b8c0b-20250708
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw01.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1716159002; Tue, 08 Jul 2025 19:18:21 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 8 Jul 2025 19:18:19 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 8 Jul 2025 19:18:18 +0800
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
Subject: [PATCH v6 03/10] ASoC: mediatek: mt8196: support audio clock control
Date: Tue, 8 Jul 2025 19:15:55 +0800
Message-ID: <20250708111806.3992-4-darren.ye@mediatek.com>
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

Add audio clock wrapper and audio tuner control.

Signed-off-by: Darren Ye <darren.ye@mediatek.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 728 +++++++++++++++++++++
 sound/soc/mediatek/mt8196/mt8196-afe-clk.h |  80 +++
 2 files changed, 808 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-clk.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-clk.h

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
new file mode 100644
index 000000000000..00f47b485812
--- /dev/null
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
@@ -0,0 +1,728 @@
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
+	case MT8196_CG_AUDIO_HOPPING_CK:
+	case MT8196_CG_AUDIO_F26M_CK:
+	case MT8196_CG_APLL1_CK:
+	case MT8196_CG_APLL2_CK:
+	case MT8196_PDN_APLL_TUNER2:
+	case MT8196_PDN_APLL_TUNER1:
+		return AUDIO_TOP_CON4;
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
+	case MT8196_CG_AUDIO_HOPPING_CK:
+		return CG_AUDIO_HOPPING_CK_MASK_SFT;
+	case MT8196_CG_AUDIO_F26M_CK:
+		return CG_AUDIO_F26M_CK_MASK_SFT;
+	case MT8196_CG_APLL1_CK:
+		return CG_APLL1_CK_MASK_SFT;
+	case MT8196_CG_APLL2_CK:
+		return CG_APLL2_CK_MASK_SFT;
+	case MT8196_PDN_APLL_TUNER2:
+		return PDN_APLL_TUNER2_MASK_SFT;
+	case MT8196_PDN_APLL_TUNER1:
+		return PDN_APLL_TUNER1_MASK_SFT;
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
+	case MT8196_CG_AUDIO_HOPPING_CK:
+	case MT8196_CG_AUDIO_F26M_CK:
+	case MT8196_CG_APLL1_CK:
+	case MT8196_CG_APLL2_CK:
+	case MT8196_PDN_APLL_TUNER2:
+	case MT8196_PDN_APLL_TUNER1:
+		return 0;
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
+	case MT8196_CG_AUDIO_HOPPING_CK:
+	case MT8196_CG_AUDIO_F26M_CK:
+	case MT8196_CG_APLL1_CK:
+	case MT8196_CG_APLL2_CK:
+	case MT8196_PDN_APLL_TUNER2:
+	case MT8196_PDN_APLL_TUNER1:
+		return get_top_cg_mask(cg_type);
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
+	if (!afe->regmap) {
+		dev_warn(afe->dev, "skip regmap\n");
+		return 0;
+	}
+
+	dev_dbg(afe->dev, "reg: 0x%x, mask: 0x%x, val: 0x%x\n", reg, mask, val);
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
+	if (!afe->regmap) {
+		dev_warn(afe->dev, "skip regmap\n");
+		return 0;
+	}
+
+	dev_dbg(afe->dev, "reg: 0x%x, mask: 0x%x, val: 0x%x\n", reg, mask, val);
+	regmap_update_bits(afe->regmap, reg, mask, val);
+
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
+	if (!afe_priv->vlp_ck) {
+		dev_warn(afe->dev, "vlp_ck regmap is null ptr\n");
+		return;
+	}
+
+	regmap_write(afe_priv->vlp_ck, VLP_APLL1_TUNER_CON0, VLP_APLL1_TUNER_CON0_VALUE);
+	regmap_write(afe_priv->vlp_ck, VLP_APLL2_TUNER_CON0, VLP_APLL2_TUNER_CON0_VALUE);
+}
+
+int mt8196_apll1_enable(struct mtk_base_afe *afe)
+{
+	int ret;
+
+	/* setting for APLL */
+	apll1_mux_setting(afe, true);
+
+	ret = mt8196_afe_enable_top_cg(afe, MT8196_CG_APLL1_CK);
+	if (ret)
+		goto err_clk_apll1;
+
+	ret = mt8196_afe_enable_top_cg(afe, MT8196_PDN_APLL_TUNER1);
+	if (ret)
+		goto err_clk_apll1_tuner;
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
+err_clk_apll1_tuner:
+	mt8196_afe_disable_top_cg(afe, MT8196_PDN_APLL_TUNER1);
+err_clk_apll1:
+	mt8196_afe_disable_top_cg(afe, MT8196_CG_APLL1_CK);
+	return ret;
+}
+
+void mt8196_apll1_disable(struct mtk_base_afe *afe)
+{
+	/* audio apll1 off */
+	mt8196_afe_disable_top_cg(afe, MT8196_AUDIO_APLL1_EN_ON);
+
+	/* apll1 freq tuner disable */
+	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x0);
+
+	mt8196_afe_disable_top_cg(afe, MT8196_PDN_APLL_TUNER1);
+	mt8196_afe_disable_top_cg(afe, MT8196_CG_APLL1_CK);
+	apll1_mux_setting(afe, false);
+}
+
+int mt8196_apll2_enable(struct mtk_base_afe *afe)
+{
+	int ret;
+
+	/* setting for APLL */
+	apll2_mux_setting(afe, true);
+
+	ret = mt8196_afe_enable_top_cg(afe, MT8196_CG_APLL2_CK);
+	if (ret)
+		goto err_clk_apll2;
+
+	ret = mt8196_afe_enable_top_cg(afe, MT8196_PDN_APLL_TUNER2);
+	if (ret)
+		goto err_clk_apll2_tuner;
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
+err_clk_apll2_tuner:
+	mt8196_afe_disable_top_cg(afe, MT8196_PDN_APLL_TUNER2);
+err_clk_apll2:
+	mt8196_afe_disable_top_cg(afe, MT8196_CG_APLL2_CK);
+	return 0;
+}
+
+void mt8196_apll2_disable(struct mtk_base_afe *afe)
+{
+	/* audio apll2 off */
+	mt8196_afe_disable_top_cg(afe, MT8196_AUDIO_APLL2_EN_ON);
+
+	/* apll2 freq tuner disable */
+	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x0);
+
+	mt8196_afe_disable_top_cg(afe, MT8196_PDN_APLL_TUNER2);
+	mt8196_afe_disable_top_cg(afe, MT8196_CG_APLL2_CK);
+	apll2_mux_setting(afe, false);
+}
+
+int mt8196_get_apll_rate(struct mtk_base_afe *afe, int apll)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	int clk_id = 0;
+
+	if (apll < MT8196_APLL1 || apll > MT8196_APLL2) {
+		dev_warn(afe->dev, "invalid clk id %d\n", apll);
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
+	return (rate % 8000) ? MT8196_APLL1 : MT8196_APLL2;
+}
+
+int mt8196_get_apll_by_name(struct mtk_base_afe *afe, const char *name)
+{
+	if (strcmp(name, APLL1_W_NAME) == 0)
+		return MT8196_APLL1;
+
+	return MT8196_APLL2;
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
+	int m_sel_id;
+	int div_clk_id;
+	int ret;
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
+	int m_sel_id;
+	int div_clk_id;
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
+	/* set in the regmap_register_patch */
+	return 0;
+}
+
+int mt8196_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+
+	/* IPM2.0: Use HOPPING & 26M */
+	/* set in the regmap_register_patch */
+
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
+	mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_26M_EN_ON);
+	return 0;
+}
+
+int mt8196_afe_disable_main_clock(struct mtk_base_afe *afe)
+{
+	mt8196_afe_disable_top_cg(afe, MT8196_AUDIO_26M_EN_ON);
+	return 0;
+}
+
+int mt8196_init_clock(struct mtk_base_afe *afe)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	int ret = 0;
+	int i = 0;
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
index 000000000000..854da3844104
--- /dev/null
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.h
@@ -0,0 +1,80 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * mt8196-afe-clk.h  --  Mediatek MT8196 AFE Clock Control definitions
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
-- 
2.45.2


