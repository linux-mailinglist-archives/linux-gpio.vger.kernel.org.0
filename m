Return-Path: <linux-gpio+bounces-24797-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30ED2B31873
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 14:56:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A752B5A4E2F
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 12:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 361182FC03A;
	Fri, 22 Aug 2025 12:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="iuMg5LXP"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2AA257448;
	Fri, 22 Aug 2025 12:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755867225; cv=none; b=gH5aI7SHJ8uXtQr8YmBwrCmH+gsQqQ2rb0+tbZHzOPAsnmkyIxAp1Pgh9Zs0pKH4LHqR6EASkKLHGHDbqJspmNtq66xDuV0a5LpJQpRknIZQjdMf/uY89d7PEiWdGiTxg6xHPGtcdiyWbu23zFxI/9BPRAthG4RVXY3upDcezWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755867225; c=relaxed/simple;
	bh=d6zzBNWKE+6nb+fa7EXKGQEEQh62lQSIU07SN44AloU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LgLK+xtOSHx2fcxN3Z4H/6Gw4PffXFo9dhlPRpgcQoEvOOU9ZoRYUP1vm38Jk48wl/tsIcfQkbuyNXmCQgQnIu1MgPK6ivopii1XAoBpq5pPpgFxWQG3WSq9ZambwbLnjxerKD39ZZAD+pKBIaw4sD5fgrOLUK2vUBGsqQCUEZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=iuMg5LXP; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 048b6bdc7f5711f0b33aeb1e7f16c2b6-20250822
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=WG7/zNQZqDhYBGvRgpDodgyxqcJ2uteywX/oT6dXdeQ=;
	b=iuMg5LXPHnIuzD7INFQT7T18Nzr6IEBNJ7QcwwGPwWFzJBJGLhIQexbDH7E0RfoCK7Y6aiV5h7m19TQRH/bphcSsftJ+W9YbKxkj3LW9/CO5x3W01Pfi3d4j20gdYa34qA0S/UzQLxrAySKLdCzR1pqszz5yrjz97m/N7WigxoQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:5292a712-c650-4752-800a-8a547e604623,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:42f7c344-18c5-4075-a135-4c0afe29f9d6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 048b6bdc7f5711f0b33aeb1e7f16c2b6-20250822
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 140311896; Fri, 22 Aug 2025 20:53:36 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 22 Aug 2025 20:53:34 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 22 Aug 2025 20:53:32 +0800
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
Subject: [PATCH v7 03/10] ASoC: mediatek: mt8196: support audio clock control
Date: Fri, 22 Aug 2025 20:52:32 +0800
Message-ID: <20250822125301.12333-4-darren.ye@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250822125301.12333-1-darren.ye@mediatek.com>
References: <20250822125301.12333-1-darren.ye@mediatek.com>
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
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 580 +++++++++++++++++++++
 sound/soc/mediatek/mt8196/mt8196-afe-clk.h |  64 +++
 2 files changed, 644 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-clk.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-clk.h

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
new file mode 100644
index 000000000000..d7f48f62ddc6
--- /dev/null
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
@@ -0,0 +1,580 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  mt8196-afe-clk.c  --  Mediatek 8196 afe clock ctrl
+ *
+ *  Copyright (c) 2025 MediaTek Inc.
+ *  Author: Darren Ye <darren.ye@mediatek.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
+
+#include "mt8196-afe-clk.h"
+#include "mt8196-afe-common.h"
+
+static const char *aud_clks[MT8196_CLK_NUM] = {
+	/* vlp clk */
+	[MT8196_CLK_VLP_MUX_AUDIOINTBUS] = "top_aud_intbus",
+	[MT8196_CLK_VLP_MUX_AUD_ENG1] = "top_aud_eng1",
+	[MT8196_CLK_VLP_MUX_AUD_ENG2] = "top_aud_eng2",
+	[MT8196_CLK_VLP_MUX_AUDIO_H] = "top_aud_h",
+	/* pll */
+	[MT8196_CLK_TOP_APLL1_CK] = "apll1",
+	[MT8196_CLK_TOP_APLL2_CK] = "apll2",
+	/* divider */
+	[MT8196_CLK_TOP_APLL12_DIV_I2SIN0] = "apll12_div_i2sin0",
+	[MT8196_CLK_TOP_APLL12_DIV_I2SIN1] = "apll12_div_i2sin1",
+	[MT8196_CLK_TOP_APLL12_DIV_FMI2S] = "apll12_div_fmi2s",
+	[MT8196_CLK_TOP_APLL12_DIV_TDMOUT_M] = "apll12_div_tdmout_m",
+	[MT8196_CLK_TOP_APLL12_DIV_TDMOUT_B] = "apll12_div_tdmout_b",
+	/* mux */
+	[MT8196_CLK_TOP_ADSP_SEL] = "top_adsp",
+};
+
+int mt8196_afe_enable_clk(struct mtk_base_afe *afe, struct clk *clk)
+{
+	int ret;
+
+	ret = clk_prepare_enable(clk);
+	if (ret) {
+		dev_err(afe->dev, "failed to enable clk\n");
+		return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(mt8196_afe_enable_clk);
+
+void mt8196_afe_disable_clk(struct mtk_base_afe *afe, struct clk *clk)
+{
+	if (clk)
+		clk_disable_unprepare(clk);
+	else
+		dev_err(afe->dev, "NULL clk\n");
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
+			dev_err(afe->dev, "failed to set clk rate\n");
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
+	int ret;
+	unsigned int reg = get_top_cg_reg(cg_type);
+	unsigned int mask = get_top_cg_mask(cg_type);
+	unsigned int val = get_top_cg_on_val(cg_type);
+
+	if (!afe->regmap) {
+		dev_err(afe->dev, "afe regmap is null !!!\n");
+		return 0;
+	}
+
+	dev_dbg(afe->dev, "reg: 0x%x, mask: 0x%x, val: 0x%x\n", reg, mask, val);
+
+	ret = regmap_update_bits(afe->regmap, reg, mask, val);
+	if (ret)
+		dev_err(afe->dev, "regmap_update_bits failed: %d\n", ret);
+
+	return ret;
+}
+
+static int mt8196_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned int cg_type)
+{
+	int ret;
+	unsigned int reg = get_top_cg_reg(cg_type);
+	unsigned int mask = get_top_cg_mask(cg_type);
+	unsigned int val = get_top_cg_off_val(cg_type);
+
+	if (!afe->regmap) {
+		dev_err(afe->dev, "afe regmap is null !!!\n");
+		return 0;
+	}
+
+	dev_dbg(afe->dev, "reg: 0x%x, mask: 0x%x, val: 0x%x\n", reg, mask, val);
+
+	ret = regmap_update_bits(afe->regmap, reg, mask, val);
+	if (ret)
+		dev_err(afe->dev, "regmap_update_bits failed: %d\n", ret);
+
+	return ret;
+}
+
+static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	int apll_rate;
+	int ret;
+
+	dev_dbg(afe->dev, "enable: %d\n", enable);
+
+	if (enable) {
+		apll_rate = mt8196_get_apll_rate(afe, MT8196_APLL1);
+
+		/* 180.6336 / 4 = 45.1584MHz */
+		ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG1]);
+		if (ret)
+			return ret;
+
+		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG1],
+					      MT8196_AUD_ENG1_CLK);
+		if (ret)
+			return ret;
+
+		ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+		if (ret)
+			return ret;
+
+		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
+					      apll_rate);
+		if (ret)
+			return ret;
+	} else {
+		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG1],
+					      MT8196_AFE_26M);
+		if (ret)
+			return ret;
+
+		mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG1]);
+
+		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
+					      MT8196_AFE_26M);
+		if (ret)
+			return ret;
+
+		mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+	}
+
+	return 0;
+}
+
+static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	int apll_rate;
+	int ret;
+
+	dev_dbg(afe->dev, "enable: %d\n", enable);
+
+	if (enable) {
+		apll_rate = mt8196_get_apll_rate(afe, MT8196_APLL2);
+
+		/* 196.608 / 4 = 49.152MHz */
+		ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG2]);
+		if (ret)
+			return ret;
+
+		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG2],
+					      MT8196_AUD_ENG2_CLK);
+		if (ret)
+			return ret;
+
+		ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+		if (ret)
+			return ret;
+
+		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H], apll_rate);
+		if (ret)
+			return ret;
+	} else {
+		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG2],
+					      MT8196_AFE_26M);
+		if (ret)
+			return ret;
+
+		mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUD_ENG2]);
+
+		ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
+					      MT8196_AFE_26M);
+		if (ret)
+			return ret;
+
+		mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+	}
+
+	return 0;
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
+/* 48K: select APLL2; 44.1k: select APLL1 */
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
+static const int mck_div[MT8196_MCK_NUM] = {
+	[MT8196_I2SIN0_MCK] = MT8196_CLK_TOP_APLL12_DIV_I2SIN0,
+	[MT8196_I2SIN1_MCK] = MT8196_CLK_TOP_APLL12_DIV_I2SIN1,
+	[MT8196_FMI2S_MCK] = MT8196_CLK_TOP_APLL12_DIV_FMI2S,
+	[MT8196_TDMOUT_MCK] = MT8196_CLK_TOP_APLL12_DIV_TDMOUT_M,
+	[MT8196_TDMOUT_BCK] = MT8196_CLK_TOP_APLL12_DIV_TDMOUT_B,
+};
+
+int mt8196_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	int div_clk_id;
+	int ret;
+
+	dev_dbg(afe->dev, "mck_id: %d, rate: %d\n", mck_id, rate);
+
+	if (mck_id >= MT8196_MCK_NUM || mck_id < 0)
+		return -EINVAL;
+
+	div_clk_id = mck_div[mck_id];
+
+	/* enable div, set rate */
+	if (div_clk_id < 0) {
+		dev_err(afe->dev, "invalid div_clk_id %d\n", div_clk_id);
+		return -EINVAL;
+	}
+
+	if (div_clk_id == MT8196_CLK_TOP_APLL12_DIV_TDMOUT_B)
+		rate *= 16;
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
+	int div_clk_id;
+	int ret;
+
+	dev_dbg(afe->dev, "mck_id: %d.\n", mck_id);
+
+	if (mck_id < 0) {
+		dev_err(afe->dev, "mck_id = %d < 0\n", mck_id);
+		return -EINVAL;
+	}
+
+	div_clk_id = mck_div[mck_id];
+
+	if (div_clk_id < 0) {
+		dev_err(afe->dev, "div_clk_id = %d < 0\n",
+			div_clk_id);
+		return -EINVAL;
+	}
+
+	ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[div_clk_id], MT8196_AFE_26M);
+	if (ret)
+		return ret;
+
+	mt8196_afe_disable_clk(afe, afe_priv->clk[div_clk_id]);
+
+	return 0;
+}
+
+int mt8196_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	int ret;
+
+	/* bus clock for AFE external access, like DRAM */
+	mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_ADSP_SEL]);
+
+	/* bus clock for AFE internal access, like AFE SRAM */
+	mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIOINTBUS]);
+	ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIOINTBUS],
+				      MT8196_AFE_26M);
+	if (ret)
+		return ret;
+
+	/* enable audio h clock */
+	mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
+	ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
+				      MT8196_AFE_26M);
+	if (ret)
+		return ret;
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
+	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
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
+	int i;
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
+	return 0;
+}
+
diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.h b/sound/soc/mediatek/mt8196/mt8196-afe-clk.h
new file mode 100644
index 000000000000..7d47dcff768b
--- /dev/null
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.h
@@ -0,0 +1,64 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * mt8196-afe-clk.h  --  Mediatek MT8196 AFE Clock Control definitions
+ *
+ * Copyright (c) 2025 MediaTek Inc.
+ *  Author: Darren Ye <darren.ye@mediatek.com>
+ */
+
+#ifndef _MT8196_AFE_CLOCK_CTRL_H_
+#define _MT8196_AFE_CLOCK_CTRL_H_
+
+#define MT8196_AFE_26M 26000000
+#define MT8196_AUD_ENG1_CLK 45158400
+#define MT8196_AUD_ENG2_CLK 49152000
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
+	/* pll */
+	MT8196_CLK_TOP_APLL1_CK,
+	MT8196_CLK_TOP_APLL2_CK,
+	/* divider */
+	MT8196_CLK_TOP_APLL12_DIV_I2SIN0,
+	MT8196_CLK_TOP_APLL12_DIV_I2SIN1,
+	MT8196_CLK_TOP_APLL12_DIV_FMI2S,
+	MT8196_CLK_TOP_APLL12_DIV_TDMOUT_M,
+	MT8196_CLK_TOP_APLL12_DIV_TDMOUT_B,
+	/* mux */
+	MT8196_CLK_TOP_ADSP_SEL,
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


