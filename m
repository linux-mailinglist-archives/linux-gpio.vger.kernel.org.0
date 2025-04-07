Return-Path: <linux-gpio+bounces-18336-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A1228A7DCB0
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 13:49:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 882843A8E70
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 11:49:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDBDC24502D;
	Mon,  7 Apr 2025 11:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="CRt3eATI"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964A4248896;
	Mon,  7 Apr 2025 11:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744026509; cv=none; b=bGyumoSDzFFGbgCu88qFkLhlmnX0hBXj29VkIx0Sc6OlyxASZFo8KoNA0d3JT0895uquceSZpdqzF0e0R/sAvIdU20WwSUcMlfER48Ud/a6R88JDbEFPCFVgHK6JRGMlwuv6vXYOL7QYem/LT23AFfK5i84HIIFpxpXinfA6fDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744026509; c=relaxed/simple;
	bh=+fCciRJ30toQYpInKwxzDwIw6KFuNkfs54kfYbLa5MI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DU/q88c+L8gaxDCwMt6Uu5crLVA9EYQFKDI1zDkaMiaWOWRxRr6pld8s18gqAhZuesQXHVV/eDIajuJ0aSRRl2qVeTAan8lWT/BYZiqmj4NfW34oNltyyVRWprzz4M780u+bvQhg3CLpXd3+q47Du4/2D6QYPhpIB3lIBHjC8Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=CRt3eATI; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 33cb00aa13a611f0aae1fd9735fae912-20250407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=HMEoSagkZlzM3yCIa4di89LO/K7nW/KYszOch7eemwI=;
	b=CRt3eATIx22GqMqNyKLLTNWZxaIRAI+roP1RL6qZM8vUfvBIB+M9JFWcETUzb/aeAAlNyDwfBB+jVdvSehTAPqKMf6sET9U22tGNNigWvJlrN8q5Bm4Ri4B0u6B63bA8UALDJn/htS7r5mS7kI8gyQzTT144rwAbqbkjiDmjn9o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:ae71e785-22ac-468a-a62c-801b7cc9f5b5,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:c5c80a4b-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 33cb00aa13a611f0aae1fd9735fae912-20250407
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 200806506; Mon, 07 Apr 2025 19:48:20 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Apr 2025 19:48:19 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Apr 2025 19:48:18 +0800
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
Subject: [PATCH 04/11] ASoC: mediatek: mt8196: support audio clock control
Date: Mon, 7 Apr 2025 19:47:17 +0800
Message-ID: <20250407114759.24835-6-darren.ye@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250407114759.24835-1-darren.ye@mediatek.com>
References: <20250407114759.24835-1-darren.ye@mediatek.com>
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
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 729 +++++++++++++++++++++
 sound/soc/mediatek/mt8196/mt8196-afe-clk.h |  78 +++
 2 files changed, 807 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-clk.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-clk.h

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
new file mode 100644
index 000000000000..10383f0abd9a
--- /dev/null
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
@@ -0,0 +1,729 @@
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
+/* vlp apll1 tuner default value*/
+#define VLP_APLL1_TUNER_CON0_VALUE 0x6f28bd4d
+
+/* vlp apll2 tuner default value + 1*/
+#define VLP_APLL2_TUNER_CON0_VALUE 0x78fd5265
+
+static DEFINE_MUTEX(mutex_request_dram);
+
+static const char *aud_clks[CLK_NUM] = {
+	/* afe clk */
+	[CLK_HOPPING] = "aud_hopping_clk",
+	[CLK_F26M] = "aud_f26m_clk",
+	[CLK_APLL1] = "aud_apll1_clk",
+	[CLK_APLL2] = "aud_apll2_clk",
+	[CLK_APLL1_TUNER] = "aud_apll_tuner1_clk",
+	[CLK_APLL2_TUNER] = "aud_apll_tuner2_clk",
+	/* vlp clk */
+	[CLK_VLP_MUX_AUDIOINTBUS] = "vlp_mux_audio_int",
+	[CLK_VLP_MUX_AUD_ENG1] = "vlp_mux_aud_eng1",
+	[CLK_VLP_MUX_AUD_ENG2] = "vlp_mux_aud_eng2",
+	[CLK_VLP_MUX_AUDIO_H] = "vlp_mux_audio_h",
+	[CLK_VLP_CLK26M] = "vlp_clk26m_clk",
+	/* ck clk */
+	[CLK_CK_MAINPLL_D4_D4] = "ck_mainpll_d4_d4",
+	[CLK_CK_MUX_AUD_1] = "ck_mux_aud_1",
+	[CLK_CK_APLL1_CK] = "ck_apll1_ck",
+	[CLK_CK_MUX_AUD_2] = "ck_mux_aud_2",
+	[CLK_CK_APLL2_CK] = "ck_apll2_ck",
+	[CLK_CK_APLL1_D4] = "ck_apll1_d4",
+	[CLK_CK_APLL2_D4] = "ck_apll2_d4",
+	[CLK_CK_I2SIN0_M_SEL] = "ck_i2sin0_m_sel",
+	[CLK_CK_I2SIN1_M_SEL] = "ck_i2sin1_m_sel",
+	[CLK_CK_FMI2S_M_SEL] = "ck_fmi2s_m_sel",
+	[CLK_CK_TDMOUT_M_SEL] = "ck_tdmout_m_sel",
+	[CLK_CK_APLL12_DIV_I2SIN0] = "ck_apll12_div_i2sin0",
+	[CLK_CK_APLL12_DIV_I2SIN1] = "ck_apll12_div_i2sin1",
+	[CLK_CK_APLL12_DIV_FMI2S] = "ck_apll12_div_fmi2s",
+	[CLK_CK_APLL12_DIV_TDMOUT_M] = "ck_apll12_div_tdmout_m",
+	[CLK_CK_APLL12_DIV_TDMOUT_B] = "ck_apll12_div_tdmout_b",
+	[CLK_CK_ADSP_SEL] = "ck_adsp_sel",
+	[CLK_CLK26M] = "ck_clk26m_clk",
+};
+
+static int mt8196_set_audio_int_bus_parent(struct mtk_base_afe *afe,
+					   int clk_id, bool int_bus)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	struct clk *clk;
+	int ret;
+
+	if (clk_id >= CLK_NUM || clk_id < 0)
+		return -EINVAL;
+
+	clk = int_bus ? afe_priv->clk[CLK_VLP_MUX_AUDIOINTBUS] :
+			afe_priv->clk[CLK_VLP_MUX_AUDIO_H];
+	ret = clk_set_parent(clk, afe_priv->clk[clk_id]);
+	if (ret) {
+		dev_err(afe->dev, "clk_set_parent %s fail, int_bus %d\n",
+			aud_clks[clk_id], int_bus);
+		return ret;
+	}
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
+		ret = clk_prepare_enable(afe_priv->clk[CLK_CK_MUX_AUD_1]);
+		if (ret) {
+			dev_err(afe->dev, "clk_prepare_enable %s fail %d\n",
+				aud_clks[CLK_CK_MUX_AUD_1], ret);
+			return ret;
+		}
+		ret = clk_set_parent(afe_priv->clk[CLK_CK_MUX_AUD_1],
+				     afe_priv->clk[CLK_CK_APLL1_CK]);
+		if (ret) {
+			dev_err(afe->dev, "clk_set_parent %s-%s fail %d\n",
+				aud_clks[CLK_CK_MUX_AUD_1],
+				aud_clks[CLK_CK_APLL1_CK], ret);
+			return ret;
+		}
+
+		/* 180.6336 / 4 = 45.1584MHz */
+		ret = clk_prepare_enable(afe_priv->clk[CLK_VLP_MUX_AUD_ENG1]);
+		if (ret) {
+			dev_err(afe->dev, "clk_prepare_enable %s fail %d\n",
+				aud_clks[CLK_VLP_MUX_AUD_ENG1], ret);
+			return ret;
+		}
+		ret = clk_set_parent(afe_priv->clk[CLK_VLP_MUX_AUD_ENG1],
+				     afe_priv->clk[CLK_CK_APLL1_D4]);
+		if (ret) {
+			dev_err(afe->dev, "clk_set_parent %s-%s fail %d\n",
+				aud_clks[CLK_VLP_MUX_AUD_ENG1],
+				aud_clks[CLK_CK_APLL1_D4], ret);
+			return ret;
+		}
+		ret = clk_prepare_enable(afe_priv->clk[CLK_VLP_MUX_AUDIO_H]);
+		if (ret) {
+			dev_err(afe->dev, "clk_prepare_enable %s fail %d\n",
+				aud_clks[CLK_VLP_MUX_AUDIO_H], ret);
+			return ret;
+		}
+
+		mt8196_set_audio_int_bus_parent(afe, CLK_CK_APLL1_CK, false);
+	} else {
+		ret = clk_set_parent(afe_priv->clk[CLK_VLP_MUX_AUD_ENG1],
+				     afe_priv->clk[CLK_VLP_CLK26M]);
+		if (ret) {
+			dev_err(afe->dev, "clk_set_parent %s-%s fail %d\n",
+				aud_clks[CLK_VLP_MUX_AUD_ENG1],
+				aud_clks[CLK_VLP_CLK26M], ret);
+			return ret;
+		}
+		clk_disable_unprepare(afe_priv->clk[CLK_VLP_MUX_AUD_ENG1]);
+
+		ret = clk_set_parent(afe_priv->clk[CLK_CK_MUX_AUD_1],
+				     afe_priv->clk[CLK_CLK26M]);
+		if (ret) {
+			dev_err(afe->dev, "clk_set_parent %s-%s fail %d\n",
+				aud_clks[CLK_CK_MUX_AUD_1],
+				aud_clks[CLK_CLK26M], ret);
+			return ret;
+		}
+		clk_disable_unprepare(afe_priv->clk[CLK_CK_MUX_AUD_1]);
+
+		mt8196_set_audio_int_bus_parent(afe, CLK_VLP_CLK26M, false);
+		clk_disable_unprepare(afe_priv->clk[CLK_VLP_MUX_AUDIO_H]);
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
+		ret = clk_prepare_enable(afe_priv->clk[CLK_CK_MUX_AUD_2]);
+		if (ret) {
+			dev_err(afe->dev, "clk_prepare_enable %s fail %d\n",
+				aud_clks[CLK_CK_MUX_AUD_2], ret);
+			return ret;
+		}
+		ret = clk_set_parent(afe_priv->clk[CLK_CK_MUX_AUD_2],
+				     afe_priv->clk[CLK_CK_APLL2_CK]);
+		if (ret) {
+			dev_err(afe->dev, "clk_set_parent %s-%s fail %d\n",
+				aud_clks[CLK_CK_MUX_AUD_2],
+				aud_clks[CLK_CK_APLL2_CK], ret);
+			return ret;
+		}
+
+		/* 196.608 / 4 = 49.152MHz */
+		ret = clk_prepare_enable(afe_priv->clk[CLK_VLP_MUX_AUD_ENG2]);
+		if (ret) {
+			dev_err(afe->dev, "clk_prepare_enable %s fail %d\n",
+				aud_clks[CLK_VLP_MUX_AUD_ENG2], ret);
+			return ret;
+		}
+		ret = clk_set_parent(afe_priv->clk[CLK_VLP_MUX_AUD_ENG2],
+				     afe_priv->clk[CLK_CK_APLL2_D4]);
+		if (ret) {
+			dev_err(afe->dev, "clk_set_parent %s-%s fail %d\n",
+				aud_clks[CLK_VLP_MUX_AUD_ENG2],
+				aud_clks[CLK_CK_APLL2_D4], ret);
+			return ret;
+		}
+		ret = clk_prepare_enable(afe_priv->clk[CLK_VLP_MUX_AUDIO_H]);
+		if (ret) {
+			dev_err(afe->dev, "clk_prepare_enable %s fail %d\n",
+				aud_clks[CLK_VLP_MUX_AUDIO_H], ret);
+			return ret;
+		}
+
+		mt8196_set_audio_int_bus_parent(afe, CLK_CK_APLL2_CK, false);
+	} else {
+		ret = clk_set_parent(afe_priv->clk[CLK_VLP_MUX_AUD_ENG2],
+				     afe_priv->clk[CLK_VLP_CLK26M]);
+		if (ret) {
+			dev_err(afe->dev, "clk_set_parent %s-%s fail %d\n",
+				aud_clks[CLK_VLP_MUX_AUD_ENG2],
+				aud_clks[CLK_VLP_CLK26M], ret);
+			return ret;
+		}
+		clk_disable_unprepare(afe_priv->clk[CLK_VLP_MUX_AUD_ENG2]);
+
+		ret = clk_set_parent(afe_priv->clk[CLK_CK_MUX_AUD_2],
+				     afe_priv->clk[CLK_CLK26M]);
+		if (ret) {
+			dev_err(afe->dev, "clk_set_parent %s-%s fail %d\n",
+				aud_clks[CLK_CK_MUX_AUD_2],
+				aud_clks[CLK_CLK26M], ret);
+			return ret;
+		}
+		clk_disable_unprepare(afe_priv->clk[CLK_CK_MUX_AUD_2]);
+
+		mt8196_set_audio_int_bus_parent(afe, CLK_VLP_CLK26M, false);
+		clk_disable_unprepare(afe_priv->clk[CLK_VLP_MUX_AUDIO_H]);
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
+	ret = clk_prepare_enable(afe_priv->clk[CLK_VLP_MUX_AUDIO_H]);
+	if (ret) {
+		dev_err(afe->dev, "clk_prepare_enable %s fail %d\n",
+			aud_clks[CLK_VLP_MUX_AUDIO_H], ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(afe_priv->clk[CLK_CK_MUX_AUD_1]);
+	if (ret) {
+		dev_err(afe->dev, "clk_prepare_enable %s fail %d\n",
+			aud_clks[CLK_CK_MUX_AUD_1], ret);
+		goto clk_ck_mux_aud1_err;
+	}
+
+	ret = clk_set_parent(afe_priv->clk[CLK_CK_MUX_AUD_1],
+			     afe_priv->clk[CLK_CLK26M]);
+	if (ret) {
+		dev_err(afe->dev, "clk_set_parent %s-%s fail %d\n",
+			aud_clks[CLK_CK_MUX_AUD_1],
+			aud_clks[CLK_CLK26M], ret);
+		goto clk_ck_mux_aud1_parent_err;
+	}
+	ret = clk_prepare_enable(afe_priv->clk[CLK_CK_MUX_AUD_2]);
+	if (ret) {
+		dev_err(afe->dev, "clk_prepare_enable %s fail %d\n",
+			aud_clks[CLK_CK_MUX_AUD_2], ret);
+		goto clk_ck_mux_aud2_err;
+	}
+
+	ret = clk_set_parent(afe_priv->clk[CLK_CK_MUX_AUD_2],
+			     afe_priv->clk[CLK_CLK26M]);
+	if (ret) {
+		dev_err(afe->dev, "clk_set_parent %s-%s fail %d\n",
+			aud_clks[CLK_CK_MUX_AUD_2],
+			aud_clks[CLK_CLK26M], ret);
+		goto clk_ck_mux_aud2_parent_err;
+	}
+
+	clk_disable_unprepare(afe_priv->clk[CLK_CK_MUX_AUD_1]);
+	clk_disable_unprepare(afe_priv->clk[CLK_CK_MUX_AUD_2]);
+	mt8196_set_audio_int_bus_parent(afe, CLK_VLP_CLK26M, false);
+	clk_disable_unprepare(afe_priv->clk[CLK_VLP_MUX_AUDIO_H]);
+
+	return 0;
+
+clk_ck_mux_aud2_parent_err:
+	clk_disable_unprepare(afe_priv->clk[CLK_CK_MUX_AUD_2]);
+clk_ck_mux_aud2_err:
+	clk_set_parent(afe_priv->clk[CLK_CK_MUX_AUD_1],
+		       afe_priv->clk[CLK_CK_APLL1_CK]);
+clk_ck_mux_aud1_parent_err:
+	clk_disable_unprepare(afe_priv->clk[CLK_CK_MUX_AUD_1]);
+clk_ck_mux_aud1_err:
+	clk_disable_unprepare(afe_priv->clk[CLK_VLP_MUX_AUDIO_H]);
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
+int mt8196_afe_enable_clock(struct mtk_base_afe *afe)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	int ret = 0;
+
+	ret = clk_prepare_enable(afe_priv->clk[CLK_CK_ADSP_SEL]);
+	if (ret) {
+		dev_err(afe->dev, "clk_prepare_enable %s fail %d\n",
+			aud_clks[CLK_CK_ADSP_SEL], ret);
+		goto CLK_CK_ADSP_SEL_ERR;
+	}
+
+	ret = clk_prepare_enable(afe_priv->clk[CLK_VLP_MUX_AUDIOINTBUS]);
+	if (ret) {
+		dev_err(afe->dev, "clk_prepare_enable %s fail %d\n",
+			aud_clks[CLK_VLP_MUX_AUDIOINTBUS], ret);
+		goto CLK_MUX_AUDIO_INTBUS_ERR;
+	}
+	ret = mt8196_set_audio_int_bus_parent(afe, CLK_VLP_CLK26M, true);
+
+	ret = clk_prepare_enable(afe_priv->clk[CLK_VLP_MUX_AUDIO_H]);
+	if (ret) {
+		dev_err(afe->dev, "clk_prepare_enable %s fail %d\n",
+			aud_clks[CLK_VLP_MUX_AUDIO_H], ret);
+		goto CLK_AUDIO_H_ERR;
+	}
+	mt8196_set_audio_int_bus_parent(afe, CLK_VLP_CLK26M, false);
+
+	/* IPM2.0: USE HOPPING & 26M */
+	ret = clk_prepare_enable(afe_priv->clk[CLK_HOPPING]);
+	if (ret) {
+		dev_err(afe->dev, "clk_prepare_enable %s fail %d\n",
+			aud_clks[CLK_HOPPING], ret);
+		goto CLK_AFE_ERR;
+	}
+	ret = clk_prepare_enable(afe_priv->clk[CLK_F26M]);
+	if (ret) {
+		dev_err(afe->dev, "clk_prepare_enable %s fail %d\n",
+			aud_clks[CLK_F26M], ret);
+		goto CLK_AFE_ERR;
+	}
+
+	return 0;
+
+CLK_AFE_ERR:
+	/* IPM2.0: Use HOPPING & 26M */
+	clk_disable_unprepare(afe_priv->clk[CLK_HOPPING]);
+	clk_disable_unprepare(afe_priv->clk[CLK_F26M]);
+CLK_AUDIO_H_ERR:
+	clk_disable_unprepare(afe_priv->clk[CLK_VLP_MUX_AUDIO_H]);
+CLK_MUX_AUDIO_INTBUS_ERR:
+	clk_disable_unprepare(afe_priv->clk[CLK_VLP_MUX_AUDIOINTBUS]);
+CLK_CK_ADSP_SEL_ERR:
+	clk_disable_unprepare(afe_priv->clk[CLK_CK_ADSP_SEL]);
+	return ret;
+}
+
+void mt8196_afe_disable_clock(struct mtk_base_afe *afe)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+
+	/* IPM2.0: Use HOPPING & 26M */
+	clk_disable_unprepare(afe_priv->clk[CLK_HOPPING]);
+	clk_disable_unprepare(afe_priv->clk[CLK_F26M]);
+	mt8196_set_audio_int_bus_parent(afe, CLK_VLP_CLK26M, false);
+	clk_disable_unprepare(afe_priv->clk[CLK_VLP_MUX_AUDIO_H]);
+	mt8196_set_audio_int_bus_parent(afe, CLK_VLP_CLK26M, true);
+	clk_disable_unprepare(afe_priv->clk[CLK_VLP_MUX_AUDIOINTBUS]);
+	clk_disable_unprepare(afe_priv->clk[CLK_CK_ADSP_SEL]);
+}
+
+int mt8196_afe_dram_request(struct device *dev)
+{
+	struct mtk_base_afe *afe = dev_get_drvdata(dev);
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+
+	mutex_lock(&mutex_request_dram);
+
+	afe_priv->dram_resource_counter++;
+	mutex_unlock(&mutex_request_dram);
+
+	return 0;
+}
+
+int mt8196_afe_dram_release(struct device *dev)
+{
+	struct mtk_base_afe *afe = dev_get_drvdata(dev);
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+
+	mutex_lock(&mutex_request_dram);
+	afe_priv->dram_resource_counter--;
+
+	if (afe_priv->dram_resource_counter < 0) {
+		dev_warn(dev, "dram_resource_counter %d\n",
+			 afe_priv->dram_resource_counter);
+		afe_priv->dram_resource_counter = 0;
+	}
+	mutex_unlock(&mutex_request_dram);
+	return 0;
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
+	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL1]);
+	if (ret) {
+		dev_err(afe->dev, "clk_prepare_enable %s fail %d\n",
+			aud_clks[CLK_APLL1], ret);
+		goto ERR_CLK_APLL1;
+	}
+
+	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL1_TUNER]);
+	if (ret) {
+		dev_err(afe->dev, "clk_prepare_enable %s fail %d\n",
+			aud_clks[CLK_APLL1_TUNER], ret);
+		goto ERR_CLK_APLL1_TUNER;
+	}
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
+	regmap_update_bits(afe->regmap, AUDIO_ENGEN_CON0,
+			   AUDIO_APLL1_EN_ON_MASK_SFT,
+			   0x1 << AUDIO_APLL1_EN_ON_SFT);
+
+	return 0;
+
+ERR_CLK_APLL1_TUNER:
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL1_TUNER]);
+ERR_CLK_APLL1:
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL1]);
+
+	return ret;
+}
+
+void mt8196_apll1_disable(struct mtk_base_afe *afe)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+
+	/* audio apll1 off */
+	regmap_update_bits(afe->regmap, AUDIO_ENGEN_CON0,
+			   AUDIO_APLL1_EN_ON_MASK_SFT,
+			   0x0);
+
+	/* apll1 freq tuner disable */
+	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x0);
+
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL1_TUNER]);
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL1]);
+
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
+	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL2]);
+	if (ret) {
+		dev_err(afe->dev, "clk_prepare_enable %s fail %d\n",
+			aud_clks[CLK_APLL2], ret);
+		goto ERR_CLK_APLL2;
+	}
+
+	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL2_TUNER]);
+	if (ret) {
+		dev_err(afe->dev, "clk_prepare_enable %s fail %d\n",
+			aud_clks[CLK_APLL2_TUNER], ret);
+		goto ERR_CLK_APLL2_TUNER;
+	}
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
+	regmap_update_bits(afe->regmap, AUDIO_ENGEN_CON0,
+			   AUDIO_APLL2_EN_ON_MASK_SFT,
+			   0x1 << AUDIO_APLL2_EN_ON_SFT);
+
+	return 0;
+
+ERR_CLK_APLL2_TUNER:
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL2_TUNER]);
+ERR_CLK_APLL2:
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL2]);
+
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
+	regmap_update_bits(afe->regmap, AUDIO_ENGEN_CON0,
+			   AUDIO_APLL2_EN_ON_MASK_SFT,
+			   0x0);
+
+	/* apll2 freq tuner disable */
+	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
+			   FREQ_TUNER_EN_MASK_SFT,
+			   0x0);
+
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL2_TUNER]);
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL2]);
+
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
+		clk_id = CLK_CK_APLL1_CK;
+	else
+		clk_id = CLK_CK_APLL2_CK;
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
+		.m_sel_id = CLK_CK_I2SIN0_M_SEL,
+		.div_clk_id = CLK_CK_APLL12_DIV_I2SIN0,
+	},
+	[MT8196_I2SIN1_MCK] = {
+		.m_sel_id = CLK_CK_I2SIN1_M_SEL,
+		.div_clk_id = CLK_CK_APLL12_DIV_I2SIN1,
+	},
+	[MT8196_FMI2S_MCK] = {
+		.m_sel_id = CLK_CK_FMI2S_M_SEL,
+		.div_clk_id = CLK_CK_APLL12_DIV_FMI2S,
+	},
+	[MT8196_TDMOUT_MCK] = {
+		.m_sel_id = CLK_CK_TDMOUT_M_SEL,
+		.div_clk_id = CLK_CK_APLL12_DIV_TDMOUT_M,
+	},
+	[MT8196_TDMOUT_BCK] = {
+		.m_sel_id = -1,
+		.div_clk_id = CLK_CK_APLL12_DIV_TDMOUT_B,
+	},
+};
+
+int mt8196_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	int apll = mt8196_get_apll_by_rate(afe, rate);
+	int apll_clk_id = apll == MT8196_APLL1 ?
+			  CLK_CK_MUX_AUD_1 : CLK_CK_MUX_AUD_2;
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
+		ret = clk_prepare_enable(afe_priv->clk[m_sel_id]);
+		if (ret) {
+			dev_err(afe->dev, "clk_prepare_enable %s fail %d\n",
+				aud_clks[m_sel_id], ret);
+			return ret;
+		}
+		ret = clk_set_parent(afe_priv->clk[m_sel_id],
+				     afe_priv->clk[apll_clk_id]);
+		if (ret) {
+			dev_err(afe->dev, "clk_set_parent %s-%s fail %d\n",
+				aud_clks[m_sel_id],
+				aud_clks[apll_clk_id], ret);
+			return ret;
+		}
+	}
+
+	/* enable div, set rate */
+	if (div_clk_id < 0) {
+		dev_err(afe->dev, "invalid div_clk_id %d\n", div_clk_id);
+		return -EINVAL;
+	}
+	if (div_clk_id == CLK_CK_APLL12_DIV_TDMOUT_B)
+		rate = rate * 16;
+	ret = clk_prepare_enable(afe_priv->clk[div_clk_id]);
+	if (ret) {
+		dev_err(afe->dev, "clk_prepare_enable %s fail %d\n",
+			aud_clks[div_clk_id], ret);
+		return ret;
+	}
+	ret = clk_set_rate(afe_priv->clk[div_clk_id], rate);
+	if (ret) {
+		dev_err(afe->dev, "clk_set_rate %s, rate %d, fail %d\n",
+			aud_clks[div_clk_id],
+			rate, ret);
+		return ret;
+	}
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
+	clk_disable_unprepare(afe_priv->clk[div_clk_id]);
+
+	if (m_sel_id >= 0)
+		clk_disable_unprepare(afe_priv->clk[m_sel_id]);
+
+	return 0;
+}
+
+int mt8196_init_clock(struct mtk_base_afe *afe)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	int ret = 0;
+	int i = 0;
+
+	afe_priv->clk = devm_kcalloc(afe->dev, CLK_NUM, sizeof(*afe_priv->clk),
+				     GFP_KERNEL);
+	if (!afe_priv->clk)
+		return -ENOMEM;
+
+	for (i = 0; i < CLK_NUM; i++) {
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
+	afe_priv->cksys_ck = syscon_regmap_lookup_by_phandle(afe->dev->of_node,
+							     "cksys");
+	if (IS_ERR(afe_priv->cksys_ck)) {
+		dev_err(afe->dev, "Cannot find cksys controller\n");
+		return PTR_ERR(afe_priv->cksys_ck);
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
diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.h b/sound/soc/mediatek/mt8196/mt8196-afe-clk.h
new file mode 100644
index 000000000000..e2427e499027
--- /dev/null
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.h
@@ -0,0 +1,78 @@
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
+	/* afe clk */
+	CLK_HOPPING = 0,
+	CLK_F26M,
+	CLK_APLL1,
+	CLK_APLL2,
+	CLK_APLL1_TUNER,
+	CLK_APLL2_TUNER,
+	/* vlp clk */
+	CLK_VLP_MUX_AUDIOINTBUS,
+	CLK_VLP_MUX_AUD_ENG1,
+	CLK_VLP_MUX_AUD_ENG2,
+	CLK_VLP_MUX_AUDIO_H,
+	CLK_VLP_CLK26M,
+	/* ck clk */
+	CLK_CK_MAINPLL_D4_D4,
+	CLK_CK_MUX_AUD_1,
+	CLK_CK_APLL1_CK,
+	CLK_CK_MUX_AUD_2,
+	CLK_CK_APLL2_CK,
+	CLK_CK_APLL1_D4,
+	CLK_CK_APLL2_D4,
+	CLK_CK_I2SIN0_M_SEL,
+	CLK_CK_I2SIN1_M_SEL,
+	CLK_CK_FMI2S_M_SEL,
+	CLK_CK_TDMOUT_M_SEL,
+	CLK_CK_APLL12_DIV_I2SIN0,
+	CLK_CK_APLL12_DIV_I2SIN1,
+	CLK_CK_APLL12_DIV_FMI2S,
+	CLK_CK_APLL12_DIV_TDMOUT_M,
+	CLK_CK_APLL12_DIV_TDMOUT_B,
+	CLK_CK_ADSP_SEL,
+	CLK_CLK26M,
+	CLK_NUM
+};
+
+struct mtk_base_afe;
+
+int mt8196_init_clock(struct mtk_base_afe *afe);
+int mt8196_afe_enable_clock(struct mtk_base_afe *afe);
+void mt8196_afe_disable_clock(struct mtk_base_afe *afe);
+int mt8196_afe_dram_request(struct device *dev);
+int mt8196_afe_dram_release(struct device *dev);
+int mt8196_apll1_enable(struct mtk_base_afe *afe);
+void mt8196_apll1_disable(struct mtk_base_afe *afe);
+int mt8196_apll2_enable(struct mtk_base_afe *afe);
+void mt8196_apll2_disable(struct mtk_base_afe *afe);
+int mt8196_get_apll_rate(struct mtk_base_afe *afe, int apll);
+int mt8196_get_apll_by_rate(struct mtk_base_afe *afe, int rate);
+int mt8196_get_apll_by_name(struct mtk_base_afe *afe, const char *name);
+int mt8196_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate);
+int mt8196_mck_disable(struct mtk_base_afe *afe, int mck_id);
+
+#endif
-- 
2.45.2


