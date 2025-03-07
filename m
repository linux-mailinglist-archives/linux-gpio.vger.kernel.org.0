Return-Path: <linux-gpio+bounces-17240-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C3AA5682A
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 13:50:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BAA88189A2FD
	for <lists+linux-gpio@lfdr.de>; Fri,  7 Mar 2025 12:50:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96FE021ADC3;
	Fri,  7 Mar 2025 12:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="SGYXn9V3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 129A721ABB3;
	Fri,  7 Mar 2025 12:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741351751; cv=none; b=n4uf8pNsCtw6wJFLMsTPBtX3UDSuuVW5h+u53zLKq9tyyxwPfgpDX+I4c29Lov1pdVYbsKqCkgBEwwUCJEf710/bAuaWRoaAUJlVjSIJibRmgWBYHJVvd4GUKNwIZjG2n91C8lXj9ztXmViWKOtb6VihmIJ6fERZErGB5pxvIAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741351751; c=relaxed/simple;
	bh=rxWwI1G+Oh/x/vqrC02EjrEJj5Uk0utDermMyyWPRY4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Sdx9DRpMXb4JUuFZEsrGjunVD9HLaVKCkMLJLdacH2zSkMHcQOXOsAgr/+2k4k5wYUWdKG2W8AdLi1NLMbqeTQ7SjiFQn+HE62SB9TOgjdOx+Hi83p886RHY7nCrFX7ZJwq9tru7t7kRUzFxXxqXfaTZIVpTI/YqW0S2Dg39DVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=SGYXn9V3; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 89de17e6fb5211ef8eb9c36241bbb6fb-20250307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GVVvuFqlzvu5sPz8ho1aRl4B81EpOIBwcWCUoVpBuVM=;
	b=SGYXn9V3AGkBmu5P1AdIubJeBdVz2jlm2OArYJcCz/J6kfwFFwS0QPhOuWx/I1F3+5NK5TLPzuLZmEG2CSgZwbbDck+/z5eZGXyVghxqBLfdhTaYnRxvQZE2HThisGAoKA7o4mdgPnpx4vc18WSsQzLufYxtue88UIQy9AkPIo0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:eb126826-def4-4d5e-adf4-051025c56588,IP:0,UR
	L:0,TC:0,Content:0,EDM:-25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-25
X-CID-META: VersionHash:0ef645f,CLOUDID:9113d249-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:1,
	IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:
	0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 89de17e6fb5211ef8eb9c36241bbb6fb-20250307
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 432510310; Fri, 07 Mar 2025 20:48:59 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.28; Fri, 7 Mar 2025 20:48:57 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.28 via Frontend Transport; Fri, 7 Mar 2025 20:48:56 +0800
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
Subject: [PATCH 05/14] ASoC: mediatek: mt8196: support audio clock control
Date: Fri, 7 Mar 2025 20:47:31 +0800
Message-ID: <20250307124841.23777-6-darren.ye@mediatek.com>
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

Add audio clock wrapper and audio tuner control.

Signed-off-by: Darren Ye <darren.ye@mediatek.com>
---
 sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 698 +++++++++++++++++++++
 sound/soc/mediatek/mt8196/mt8196-afe-clk.h | 313 +++++++++
 2 files changed, 1011 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-clk.c
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-clk.h

diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
new file mode 100644
index 000000000000..d1407d7bf775
--- /dev/null
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
@@ -0,0 +1,698 @@
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
+static DEFINE_MUTEX(mutex_request_dram);
+
+static const char *aud_clks[CLK_NUM] = {
+	[CLK_HOPPING] = "aud_hopping_clk",
+	[CLK_F26M] = "aud_f26m_clk",
+	[CLK_UL0_ADC_CLK] = "aud_ul0_adc_clk",
+	[CLK_UL0_ADC_HIRES_CLK] = "aud_ul0_adc_hires_clk",
+	[CLK_UL1_ADC_CLK] = "aud_ul1_adc_clk",
+	[CLK_UL1_ADC_HIRES_CLK] = "aud_ul1_adc_hires_clk",
+	[CLK_APLL1] = "aud_apll1_clk",
+	[CLK_APLL2] = "aud_apll2_clk",
+	[CLK_APLL1_TUNER] = "aud_apll_tuner1_clk",
+	[CLK_APLL2_TUNER] = "aud_apll_tuner2_clk",
+	[CLK_VLP_MUX_AUDIOINTBUS] = "vlp_mux_audio_int",
+	[CLK_VLP_MUX_AUD_ENG1] = "vlp_mux_aud_eng1",
+	[CLK_VLP_MUX_AUD_ENG2] = "vlp_mux_aud_eng2",
+	[CLK_VLP_MUX_AUDIO_H] = "vlp_mux_audio_h",
+	[CLK_VLP_CLK26M] = "vlp_clk26m_clk",
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
+int mt8196_set_audio_int_bus_parent(struct mtk_base_afe *afe,
+				    int clk_id, bool int_bus)
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
+	if (ret)
+		dev_err(afe->dev, "%s() clk_set_parent %s fail %d, int_bus %d\n",
+			__func__, aud_clks[clk_id], ret, int_bus);
+
+	return ret;
+}
+
+static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	int ret = 0;
+
+	dev_dbg(afe->dev, "%s(), enable: %d\n", __func__, enable);
+
+	if (enable) {
+		ret = clk_prepare_enable(afe_priv->clk[CLK_CK_MUX_AUD_1]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
+				__func__, aud_clks[CLK_CK_MUX_AUD_1], ret);
+			goto EXIT;
+		}
+		ret = clk_set_parent(afe_priv->clk[CLK_CK_MUX_AUD_1],
+				     afe_priv->clk[CLK_CK_APLL1_CK]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+				__func__, aud_clks[CLK_CK_MUX_AUD_1],
+				aud_clks[CLK_CK_APLL1_CK], ret);
+			goto EXIT;
+		}
+
+		/* 180.6336 / 4 = 45.1584MHz */
+		ret = clk_prepare_enable(afe_priv->clk[CLK_VLP_MUX_AUD_ENG1]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
+				__func__, aud_clks[CLK_VLP_MUX_AUD_ENG1], ret);
+			goto EXIT;
+		}
+		ret = clk_set_parent(afe_priv->clk[CLK_VLP_MUX_AUD_ENG1],
+				     afe_priv->clk[CLK_CK_APLL1_D4]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+				__func__, aud_clks[CLK_VLP_MUX_AUD_ENG1],
+				aud_clks[CLK_CK_APLL1_D4], ret);
+			goto EXIT;
+		}
+		ret = clk_prepare_enable(afe_priv->clk[CLK_VLP_MUX_AUDIO_H]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
+				__func__, aud_clks[CLK_VLP_MUX_AUDIO_H], ret);
+			goto EXIT;
+		}
+
+		mt8196_set_audio_int_bus_parent(afe, CLK_CK_APLL1_CK, false);
+	} else {
+		ret = clk_set_parent(afe_priv->clk[CLK_VLP_MUX_AUD_ENG1],
+				     afe_priv->clk[CLK_VLP_CLK26M]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+				__func__, aud_clks[CLK_VLP_MUX_AUD_ENG1],
+				aud_clks[CLK_VLP_CLK26M], ret);
+			goto EXIT;
+		}
+		clk_disable_unprepare(afe_priv->clk[CLK_VLP_MUX_AUD_ENG1]);
+
+		ret = clk_set_parent(afe_priv->clk[CLK_CK_MUX_AUD_1],
+				     afe_priv->clk[CLK_CLK26M]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+				__func__, aud_clks[CLK_CK_MUX_AUD_1],
+				aud_clks[CLK_CLK26M], ret);
+			goto EXIT;
+		}
+		clk_disable_unprepare(afe_priv->clk[CLK_CK_MUX_AUD_1]);
+
+		mt8196_set_audio_int_bus_parent(afe, CLK_VLP_CLK26M, false);
+		clk_disable_unprepare(afe_priv->clk[CLK_VLP_MUX_AUDIO_H]);
+	}
+
+EXIT:
+	return 0;
+}
+
+static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	int ret = 0;
+
+	dev_dbg(afe->dev, "%s(), enable: %d\n", __func__, enable);
+
+	if (enable) {
+		ret = clk_prepare_enable(afe_priv->clk[CLK_CK_MUX_AUD_2]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
+				__func__, aud_clks[CLK_CK_MUX_AUD_2], ret);
+			goto EXIT;
+		}
+		ret = clk_set_parent(afe_priv->clk[CLK_CK_MUX_AUD_2],
+				     afe_priv->clk[CLK_CK_APLL2_CK]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+				__func__, aud_clks[CLK_CK_MUX_AUD_2],
+				aud_clks[CLK_CK_APLL2_CK], ret);
+			goto EXIT;
+		}
+
+		/* 196.608 / 4 = 49.152MHz */
+		ret = clk_prepare_enable(afe_priv->clk[CLK_VLP_MUX_AUD_ENG2]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
+				__func__, aud_clks[CLK_VLP_MUX_AUD_ENG2], ret);
+			goto EXIT;
+		}
+		ret = clk_set_parent(afe_priv->clk[CLK_VLP_MUX_AUD_ENG2],
+				     afe_priv->clk[CLK_CK_APLL2_D4]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+				__func__, aud_clks[CLK_VLP_MUX_AUD_ENG2],
+				aud_clks[CLK_CK_APLL2_D4], ret);
+			goto EXIT;
+		}
+		ret = clk_prepare_enable(afe_priv->clk[CLK_VLP_MUX_AUDIO_H]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
+				__func__, aud_clks[CLK_VLP_MUX_AUDIO_H], ret);
+			goto EXIT;
+		}
+
+		mt8196_set_audio_int_bus_parent(afe, CLK_CK_APLL2_CK, false);
+	} else {
+		ret = clk_set_parent(afe_priv->clk[CLK_VLP_MUX_AUD_ENG2],
+				     afe_priv->clk[CLK_VLP_CLK26M]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+				__func__, aud_clks[CLK_VLP_MUX_AUD_ENG2],
+				aud_clks[CLK_VLP_CLK26M], ret);
+			goto EXIT;
+		}
+		clk_disable_unprepare(afe_priv->clk[CLK_VLP_MUX_AUD_ENG2]);
+
+		ret = clk_set_parent(afe_priv->clk[CLK_CK_MUX_AUD_2],
+				     afe_priv->clk[CLK_CLK26M]);
+		if (ret) {
+			dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+				__func__, aud_clks[CLK_CK_MUX_AUD_2],
+				aud_clks[CLK_CLK26M], ret);
+			goto EXIT;
+		}
+		clk_disable_unprepare(afe_priv->clk[CLK_CK_MUX_AUD_2]);
+
+		mt8196_set_audio_int_bus_parent(afe, CLK_VLP_CLK26M, false);
+		clk_disable_unprepare(afe_priv->clk[CLK_VLP_MUX_AUDIO_H]);
+	}
+EXIT:
+	return 0;
+}
+
+int mt8196_afe_disable_apll(struct mtk_base_afe *afe)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	int ret = 0;
+
+	dev_dbg(afe->dev, "%s() successfully start\n", __func__);
+
+	ret = clk_prepare_enable(afe_priv->clk[CLK_VLP_MUX_AUDIO_H]);
+	if (ret) {
+		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
+			__func__, aud_clks[CLK_VLP_MUX_AUDIO_H], ret);
+		goto EXIT;
+	}
+
+	ret = clk_prepare_enable(afe_priv->clk[CLK_CK_MUX_AUD_1]);
+	if (ret) {
+		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
+			__func__, aud_clks[CLK_CK_MUX_AUD_1], ret);
+		goto EXIT;
+	}
+
+	ret = clk_set_parent(afe_priv->clk[CLK_CK_MUX_AUD_1],
+			     afe_priv->clk[CLK_CLK26M]);
+	if (ret) {
+		dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+			__func__, aud_clks[CLK_CK_MUX_AUD_1],
+			aud_clks[CLK_CLK26M], ret);
+		goto EXIT;
+	}
+	ret = clk_prepare_enable(afe_priv->clk[CLK_CK_MUX_AUD_2]);
+	if (ret) {
+		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
+			__func__, aud_clks[CLK_CK_MUX_AUD_2], ret);
+		goto EXIT;
+	}
+
+	ret = clk_set_parent(afe_priv->clk[CLK_CK_MUX_AUD_2],
+			     afe_priv->clk[CLK_CLK26M]);
+	if (ret) {
+		dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
+			__func__, aud_clks[CLK_CK_MUX_AUD_2],
+			aud_clks[CLK_CLK26M], ret);
+		goto EXIT;
+	}
+
+	clk_disable_unprepare(afe_priv->clk[CLK_CK_MUX_AUD_1]);
+	clk_disable_unprepare(afe_priv->clk[CLK_CK_MUX_AUD_2]);
+	mt8196_set_audio_int_bus_parent(afe, CLK_VLP_CLK26M, false);
+	clk_disable_unprepare(afe_priv->clk[CLK_VLP_MUX_AUDIO_H]);
+
+	return 0;
+EXIT:
+	return ret;
+}
+
+static int mt8196_afe_apll_init(struct mtk_base_afe *afe)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+
+	/* VLP_APLL1_CON0 = 0x6f28bd4c
+	 * VLP_APLL2_CON2 = 0x78FD5264
+	 * VLP_APLL1_TUNER_CON0 = 0x6f28bd4d
+	 * VLP_APLL2_TUNER_CON0 = 0x78fd5265
+	 */
+	if (afe_priv->vlp_ck) {
+		regmap_write(afe_priv->vlp_ck, VLP_APLL1_TUNER_CON0, 0x6f28bd4d);
+		regmap_write(afe_priv->vlp_ck, VLP_APLL2_TUNER_CON0, 0x78fd5265);
+	} else {
+		dev_warn(afe->dev, "%s vlp_ck regmap is null ptr\n", __func__);
+	}
+	return 0;
+}
+
+int mt8196_afe_enable_clock(struct mtk_base_afe *afe)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	int ret = 0;
+
+	ret = clk_prepare_enable(afe_priv->clk[CLK_CK_ADSP_SEL]);
+	if (ret) {
+		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
+			__func__, aud_clks[CLK_CK_ADSP_SEL], ret);
+		goto CLK_CK_ADSP_SEL_ERR;
+	}
+
+	ret = clk_prepare_enable(afe_priv->clk[CLK_VLP_MUX_AUDIOINTBUS]);
+	if (ret) {
+		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
+			__func__, aud_clks[CLK_VLP_MUX_AUDIOINTBUS], ret);
+		goto CLK_MUX_AUDIO_INTBUS_ERR;
+	}
+	ret = mt8196_set_audio_int_bus_parent(afe, CLK_VLP_CLK26M, true);
+
+	ret = clk_prepare_enable(afe_priv->clk[CLK_VLP_MUX_AUDIO_H]);
+	if (ret) {
+		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
+			__func__, aud_clks[CLK_VLP_MUX_AUDIO_H], ret);
+		goto CLK_AUDIO_H_ERR;
+	}
+	mt8196_set_audio_int_bus_parent(afe, CLK_VLP_CLK26M, false);
+
+	/* IPM2.0: USE HOPPING & 26M */
+	ret = clk_prepare_enable(afe_priv->clk[CLK_HOPPING]);
+	if (ret) {
+		dev_err(afe->dev, "%s() clk_prepare_enable %s fail %d\n",
+			__func__, aud_clks[CLK_HOPPING], ret);
+		goto CLK_AFE_ERR;
+	}
+	ret = clk_prepare_enable(afe_priv->clk[CLK_F26M]);
+	if (ret) {
+		dev_err(afe->dev, "%s() clk_prepare_enable %s fail %d\n",
+			__func__, aud_clks[CLK_F26M], ret);
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
+	dev_dbg(afe->dev, "%s() successfully start\n", __func__);
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
+	dev_dbg(dev, "%s(), dram_resource_counter %d\n",
+		__func__, afe_priv->dram_resource_counter);
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
+	dev_dbg(dev, "%s(), dram_resource_counter %d\n",
+		__func__, afe_priv->dram_resource_counter);
+
+	mutex_lock(&mutex_request_dram);
+	afe_priv->dram_resource_counter--;
+
+	if (afe_priv->dram_resource_counter < 0) {
+		dev_warn(dev, "%s(), dram_resource_counter %d\n",
+			 __func__, afe_priv->dram_resource_counter);
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
+		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
+			__func__, aud_clks[CLK_APLL1], ret);
+		goto ERR_CLK_APLL1;
+	}
+
+	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL1_TUNER]);
+	if (ret) {
+		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
+			__func__, aud_clks[CLK_APLL1_TUNER], ret);
+		goto ERR_CLK_APLL1_TUNER;
+	}
+
+	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
+			   0x0000FFF7, 0x00000372);
+	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG, 0x1, 0x1);
+
+	regmap_update_bits(afe->regmap, AUDIO_ENGEN_CON0,
+			   AUDIO_APLL1_EN_ON_MASK_SFT,
+			   0x1 << AUDIO_APLL1_EN_ON_SFT);
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
+	regmap_update_bits(afe->regmap, AUDIO_ENGEN_CON0,
+			   AUDIO_APLL1_EN_ON_MASK_SFT,
+			   0x0 << AUDIO_APLL1_EN_ON_SFT);
+
+	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG, 0x1, 0x0);
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
+		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
+			__func__, aud_clks[CLK_APLL2], ret);
+		goto ERR_CLK_APLL2;
+	}
+
+	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL2_TUNER]);
+	if (ret) {
+		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
+			__func__, aud_clks[CLK_APLL2_TUNER], ret);
+		goto ERR_CLK_APLL2_TUNER;
+	}
+
+	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
+			   0x0000FFF7, 0x00000374);
+	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG, 0x1, 0x1);
+
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
+	regmap_update_bits(afe->regmap, AUDIO_ENGEN_CON0,
+			   AUDIO_APLL2_EN_ON_MASK_SFT,
+			   0x0 << AUDIO_APLL2_EN_ON_SFT);
+
+	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG, 0x1, 0x0);
+
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL2_TUNER]);
+	clk_disable_unprepare(afe_priv->clk[CLK_APLL2]);
+
+	apll2_mux_setting(afe, false);
+}
+
+int mt8196_get_apll_rate(struct mtk_base_afe *afe, int apll)
+{
+	return (apll == MT8196_APLL1) ? 180633600 : 196608000;
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
+	dev_dbg(afe->dev, "%s(), mck_id: %d\n", __func__, mck_id);
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
+			dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
+				__func__, aud_clks[m_sel_id], ret);
+			return ret;
+		}
+		ret = clk_set_parent(afe_priv->clk[m_sel_id],
+				     afe_priv->clk[apll_clk_id]);
+		if (ret) {
+			dev_err(afe->dev, "%s(), clk_set_parent %s-%s fail %d\n",
+				__func__, aud_clks[m_sel_id],
+				aud_clks[apll_clk_id], ret);
+			return ret;
+		}
+	}
+
+	/* enable div, set rate */
+	if (div_clk_id < 0) {
+		dev_err(afe->dev, "%s(), invalid div_clk_id %d\n", __func__, div_clk_id);
+		return -EINVAL;
+	}
+	if (div_clk_id == CLK_CK_APLL12_DIV_TDMOUT_B)
+		rate = rate * 16;
+	ret = clk_prepare_enable(afe_priv->clk[div_clk_id]);
+	if (ret) {
+		dev_err(afe->dev, "%s(), clk_prepare_enable %s fail %d\n",
+			__func__, aud_clks[div_clk_id], ret);
+		return ret;
+	}
+	ret = clk_set_rate(afe_priv->clk[div_clk_id], rate);
+	if (ret) {
+		dev_err(afe->dev, "%s(), clk_set_rate %s, rate %d, fail %d\n",
+			__func__, aud_clks[div_clk_id],
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
+	dev_dbg(afe->dev, "%s(), mck_id: %d.\n", __func__, mck_id);
+
+	if (mck_id < 0) {
+		dev_err(afe->dev, "%s(), mck_id = %d < 0\n",
+			__func__, mck_id);
+		return -EINVAL;
+	}
+
+	m_sel_id = mck_div[mck_id].m_sel_id;
+	div_clk_id = mck_div[mck_id].div_clk_id;
+
+	if (div_clk_id < 0) {
+		dev_err(afe->dev, "%s(), div_clk_id = %d < 0\n",
+			__func__, div_clk_id);
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
+	int i = 0;
+
+	afe_priv->clk = devm_kcalloc(afe->dev, CLK_NUM, sizeof(*afe_priv->clk),
+				     GFP_KERNEL);
+	if (!afe_priv->clk)
+		return -ENOMEM;
+
+	for (i = 0; i < CLK_NUM; i++) {
+		if (!aud_clks[i]) {
+			dev_err(afe->dev, "%s(), clk id %d not define!!!\n",
+				__func__, i);
+		}
+
+		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
+		if (IS_ERR(afe_priv->clk[i])) {
+			dev_err(afe->dev, "%s devm_clk_get %s fail, ret %ld\n",
+				__func__,
+				aud_clks[i], PTR_ERR(afe_priv->clk[i]));
+			afe_priv->clk[i] = NULL;
+		}
+	}
+
+	afe_priv->vlp_ck = syscon_regmap_lookup_by_phandle(afe->dev->of_node,
+							   "vlpcksys");
+	if (IS_ERR(afe_priv->vlp_ck)) {
+		dev_err(afe->dev, "%s() Cannot find vlpcksys: %ld\n",
+			__func__, PTR_ERR(afe_priv->vlp_ck));
+		afe_priv->vlp_ck = NULL;
+	}
+
+	afe_priv->cksys_ck = syscon_regmap_lookup_by_phandle(afe->dev->of_node,
+							     "cksys");
+	if (IS_ERR(afe_priv->cksys_ck)) {
+		dev_err(afe->dev, "%s() Cannot find cksys controller: %ld\n",
+			__func__, PTR_ERR(afe_priv->cksys_ck));
+		afe_priv->cksys_ck  = NULL;
+	}
+
+	mt8196_afe_apll_init(afe);
+	mt8196_afe_disable_apll(afe);
+
+	return 0;
+}
diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.h b/sound/soc/mediatek/mt8196/mt8196-afe-clk.h
new file mode 100644
index 000000000000..0094aebc8bba
--- /dev/null
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.h
@@ -0,0 +1,313 @@
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
+// vlp_cksys_clk: 0x1c016000
+#define VLP_AP_PLL_CON3 0x0264
+#define VLP_APLL1_CON0 0x0274
+#define VLP_APLL1_CON1 0x0278
+#define VLP_APLL1_CON2 0x027c
+#define VLP_APLL1_CON4 0x0284
+#define VLP_APLL1_TUNER_CON0 0x02a4
+
+#define VLP_APLL2_CON0 0x028c
+#define VLP_APLL2_CON1 0x0290
+#define VLP_APLL2_CON2 0x0294
+#define VLP_APLL2_CON4 0x029c
+#define VLP_APLL2_TUNER_CON0 0x02a8
+#define VLP_CLK_CFG_UPDATE1 0x0008
+
+// cksys_clk: 0x10000000
+#define CLK_CFG_13 0x00e0
+#define CLK_CFG_UPDATE1 0x0008
+
+#define CLK_AUDDIV_0 0x020c
+#define CLK_AUDDIV_2 0x0214
+#define CLK_AUDDIV_5 0x0228
+
+#define CKSYS_AUD_TOP_CFG 0x0218
+
+/* CLK_AUDDIV_0 */
+#define APLL12_DIV_I2SIN0_PDN_SFT               0
+#define APLL12_DIV_I2SIN0_PDN_MASK              0x1
+#define APLL12_DIV_I2SIN0_PDN_MASK_SFT          (0x1 << 0)
+#define APLL12_DIV_I2SIN1_PDN_SFT               1
+#define APLL12_DIV_I2SIN1_PDN_MASK              0x1
+#define APLL12_DIV_I2SIN1_PDN_MASK_SFT          (0x1 << 1)
+#define APLL12_DIV_I2SIN2_PDN_SFT               2
+#define APLL12_DIV_I2SIN2_PDN_MASK              0x1
+#define APLL12_DIV_I2SIN2_PDN_MASK_SFT          (0x1 << 2)
+#define APLL12_DIV_I2SIN3_PDN_SFT               3
+#define APLL12_DIV_I2SIN3_PDN_MASK              0x1
+#define APLL12_DIV_I2SIN3_PDN_MASK_SFT          (0x1 << 3)
+#define APLL12_DIV_I2SIN4_PDN_SFT               4
+#define APLL12_DIV_I2SIN4_PDN_MASK              0x1
+#define APLL12_DIV_I2SIN4_PDN_MASK_SFT          (0x1 << 4)
+#define APLL12_DIV_I2SIN6_PDN_SFT               5
+#define APLL12_DIV_I2SIN6_PDN_MASK              0x1
+#define APLL12_DIV_I2SIN6_PDN_MASK_SFT          (0x1 << 5)
+#define APLL12_DIV_I2SOUT0_PDN_SFT              6
+#define APLL12_DIV_I2SOUT0_PDN_MASK             0x1
+#define APLL12_DIV_I2SOUT0_PDN_MASK_SFT         (0x1 << 6)
+#define APLL12_DIV_I2SOUT1_PDN_SFT              7
+#define APLL12_DIV_I2SOUT1_PDN_MASK             0x1
+#define APLL12_DIV_I2SOUT1_PDN_MASK_SFT         (0x1 << 7)
+#define APLL12_DIV_I2SOUT2_PDN_SFT              8
+#define APLL12_DIV_I2SOUT2_PDN_MASK             0x1
+#define APLL12_DIV_I2SOUT2_PDN_MASK_SFT         (0x1 << 8)
+#define APLL12_DIV_I2SOUT3_PDN_SFT              9
+#define APLL12_DIV_I2SOUT3_PDN_MASK             0x1
+#define APLL12_DIV_I2SOUT3_PDN_MASK_SFT         (0x1 << 9)
+#define APLL12_DIV_I2SOUT4_PDN_SFT              10
+#define APLL12_DIV_I2SOUT4_PDN_MASK             0x1
+#define APLL12_DIV_I2SOUT4_PDN_MASK_SFT         (0x1 << 10)
+#define APLL12_DIV_I2SOUT6_PDN_SFT              11
+#define APLL12_DIV_I2SOUT6_PDN_MASK             0x1
+#define APLL12_DIV_I2SOUT6_PDN_MASK_SFT         (0x1 << 11)
+#define APLL12_DIV_FMI2S_PDN_SFT                12
+#define APLL12_DIV_FMI2S_PDN_MASK               0x1
+#define APLL12_DIV_FMI2S_PDN_MASK_SFT           (0x1 << 12)
+#define APLL12_DIV_TDMOUT_M_PDN_SFT             13
+#define APLL12_DIV_TDMOUT_M_PDN_MASK            0x1
+#define APLL12_DIV_TDMOUT_M_PDN_MASK_SFT        (0x1 << 13)
+#define APLL12_DIV_TDMOUT_B_PDN_SFT             14
+#define APLL12_DIV_TDMOUT_B_PDN_MASK            0x1
+#define APLL12_DIV_TDMOUT_B_PDN_MASK_SFT        (0x1 << 14)
+#define APLL_I2SIN0_MCK_SEL_SFT                 16
+#define APLL_I2SIN0_MCK_SEL_MASK                0x1
+#define APLL_I2SIN0_MCK_SEL_MASK_SFT            (0x1 << 16)
+#define APLL_I2SIN1_MCK_SEL_SFT                 17
+#define APLL_I2SIN1_MCK_SEL_MASK                0x1
+#define APLL_I2SIN1_MCK_SEL_MASK_SFT            (0x1 << 17)
+#define APLL_I2SIN2_MCK_SEL_SFT                 18
+#define APLL_I2SIN2_MCK_SEL_MASK                0x1
+#define APLL_I2SIN2_MCK_SEL_MASK_SFT            (0x1 << 18)
+#define APLL_I2SIN3_MCK_SEL_SFT                 19
+#define APLL_I2SIN3_MCK_SEL_MASK                0x1
+#define APLL_I2SIN3_MCK_SEL_MASK_SFT            (0x1 << 19)
+#define APLL_I2SIN4_MCK_SEL_SFT                 20
+#define APLL_I2SIN4_MCK_SEL_MASK                0x1
+#define APLL_I2SIN4_MCK_SEL_MASK_SFT            (0x1 << 20)
+#define APLL_I2SIN6_MCK_SEL_SFT                 21
+#define APLL_I2SIN6_MCK_SEL_MASK                0x1
+#define APLL_I2SIN6_MCK_SEL_MASK_SFT            (0x1 << 21)
+#define APLL_I2SOUT0_MCK_SEL_SFT                22
+#define APLL_I2SOUT0_MCK_SEL_MASK               0x1
+#define APLL_I2SOUT0_MCK_SEL_MASK_SFT           (0x1 << 22)
+#define APLL_I2SOUT1_MCK_SEL_SFT                23
+#define APLL_I2SOUT1_MCK_SEL_MASK               0x1
+#define APLL_I2SOUT1_MCK_SEL_MASK_SFT           (0x1 << 23)
+#define APLL_I2SOUT2_MCK_SEL_SFT                24
+#define APLL_I2SOUT2_MCK_SEL_MASK               0x1
+#define APLL_I2SOUT2_MCK_SEL_MASK_SFT           (0x1 << 24)
+#define APLL_I2SOUT3_MCK_SEL_SFT                25
+#define APLL_I2SOUT3_MCK_SEL_MASK               0x1
+#define APLL_I2SOUT3_MCK_SEL_MASK_SFT           (0x1 << 25)
+#define APLL_I2SOUT4_MCK_SEL_SFT                26
+#define APLL_I2SOUT4_MCK_SEL_MASK               0x1
+#define APLL_I2SOUT4_MCK_SEL_MASK_SFT           (0x1 << 26)
+#define APLL_I2SOUT6_MCK_SEL_SFT                27
+#define APLL_I2SOUT6_MCK_SEL_MASK               0x1
+#define APLL_I2SOUT6_MCK_SEL_MASK_SFT           (0x1 << 27)
+#define APLL_FMI2S_MCK_SEL_SFT                  28
+#define APLL_FMI2S_MCK_SEL_MASK                 0x1
+#define APLL_FMI2S_MCK_SEL_MASK_SFT             (0x1 << 28)
+#define APLL_TDMOUT_MCK_SEL_SFT                 29
+#define APLL_TDMOUT_MCK_SEL_MASK                0x1
+#define APLL_TDMOUT_MCK_SEL_MASK_SFT            (0x1 << 29)
+
+/* CLK_AUDDIV_1 */
+#define APLL12_DIV_I2SIN0_INV_SFT               0
+#define APLL12_DIV_I2SIN0_INV_MASK              0x1
+#define APLL12_DIV_I2SIN0_INV_MASK_SFT          (0x1 << 0)
+#define APLL12_DIV_I2SIN1_INV_SFT               1
+#define APLL12_DIV_I2SIN1_INV_MASK              0x1
+#define APLL12_DIV_I2SIN1_INV_MASK_SFT          (0x1 << 1)
+#define APLL12_DIV_I2SIN2_INV_SFT               2
+#define APLL12_DIV_I2SIN2_INV_MASK              0x1
+#define APLL12_DIV_I2SIN2_INV_MASK_SFT          (0x1 << 2)
+#define APLL12_DIV_I2SIN3_INV_SFT               3
+#define APLL12_DIV_I2SIN3_INV_MASK              0x1
+#define APLL12_DIV_I2SIN3_INV_MASK_SFT          (0x1 << 3)
+#define APLL12_DIV_I2SIN4_INV_SFT               4
+#define APLL12_DIV_I2SIN4_INV_MASK              0x1
+#define APLL12_DIV_I2SIN4_INV_MASK_SFT          (0x1 << 4)
+#define APLL12_DIV_I2SIN6_INV_SFT               5
+#define APLL12_DIV_I2SIN6_INV_MASK              0x1
+#define APLL12_DIV_I2SIN6_INV_MASK_SFT          (0x1 << 5)
+#define APLL12_DIV_I2SOUT0_INV_SFT              6
+#define APLL12_DIV_I2SOUT0_INV_MASK             0x1
+#define APLL12_DIV_I2SOUT0_INV_MASK_SFT         (0x1 << 6)
+#define APLL12_DIV_I2SOUT1_INV_SFT              7
+#define APLL12_DIV_I2SOUT1_INV_MASK             0x1
+#define APLL12_DIV_I2SOUT1_INV_MASK_SFT         (0x1 << 7)
+#define APLL12_DIV_I2SOUT2_INV_SFT              8
+#define APLL12_DIV_I2SOUT2_INV_MASK             0x1
+#define APLL12_DIV_I2SOUT2_INV_MASK_SFT         (0x1 << 8)
+#define APLL12_DIV_I2SOUT3_INV_SFT              9
+#define APLL12_DIV_I2SOUT3_INV_MASK             0x1
+#define APLL12_DIV_I2SOUT3_INV_MASK_SFT         (0x1 << 9)
+#define APLL12_DIV_I2SOUT4_INV_SFT              10
+#define APLL12_DIV_I2SOUT4_INV_MASK             0x1
+#define APLL12_DIV_I2SOUT4_INV_MASK_SFT         (0x1 << 10)
+#define APLL12_DIV_I2SOUT6_INV_SFT              11
+#define APLL12_DIV_I2SOUT6_INV_MASK             0x1
+#define APLL12_DIV_I2SOUT6_INV_MASK_SFT         (0x1 << 11)
+#define APLL12_DIV_FMI2S_INV_SFT                12
+#define APLL12_DIV_FMI2S_INV_MASK               0x1
+#define APLL12_DIV_FMI2S_INV_MASK_SFT           (0x1 << 12)
+#define APLL12_DIV_TDMOUT_M_INV_SFT             13
+#define APLL12_DIV_TDMOUT_M_INV_MASK            0x1
+#define APLL12_DIV_TDMOUT_M_INV_MASK_SFT        (0x1 << 13)
+#define APLL12_DIV_TDMOUT_B_INV_SFT             14
+#define APLL12_DIV_TDMOUT_B_INV_MASK            0x1
+#define APLL12_DIV_TDMOUT_B_INV_MASK_SFT        (0x1 << 14)
+
+/* CLK_AUDDIV_2 */
+#define APLL12_CK_DIV_I2SIN0_SFT                0
+#define APLL12_CK_DIV_I2SIN0_MASK               0xff
+#define APLL12_CK_DIV_I2SIN0_MASK_SFT           (0xff << 0)
+#define APLL12_CK_DIV_I2SIN1_SFT                8
+#define APLL12_CK_DIV_I2SIN1_MASK               0xff
+#define APLL12_CK_DIV_I2SIN1_MASK_SFT           (0xff << 8)
+#define APLL12_CK_DIV_I2SIN2_SFT                16
+#define APLL12_CK_DIV_I2SIN2_MASK               0xff
+#define APLL12_CK_DIV_I2SIN2_MASK_SFT           (0xff << 16)
+#define APLL12_CK_DIV_I2SIN3_SFT                24
+#define APLL12_CK_DIV_I2SIN3_MASK               0xff
+#define APLL12_CK_DIV_I2SIN3_MASK_SFT           (0xff << 24)
+
+/* AUD_TOP_CFG */
+#define AUD_TOP_CFG_SFT                         0
+#define AUD_TOP_CFG_MASK                        0xffffffff
+#define AUD_TOP_CFG_MASK_SFT                    (0xffffffff << 0)
+
+/* AUD_TOP_MON */
+#define AUD_TOP_MON_SFT                         0
+#define AUD_TOP_MON_MASK                        0xffffffff
+#define AUD_TOP_MON_MASK_SFT                    (0xffffffff << 0)
+
+/* CLK_AUDDIV_3 */
+#define APLL12_CK_DIV_I2SIN4_SFT                0
+#define APLL12_CK_DIV_I2SIN4_MASK               0xff
+#define APLL12_CK_DIV_I2SIN4_MASK_SFT           (0xff << 0)
+#define APLL12_CK_DIV_I2SIN6_SFT                8
+#define APLL12_CK_DIV_I2SIN6_MASK               0xff
+#define APLL12_CK_DIV_I2SIN6_MASK_SFT           (0xff << 8)
+#define APLL12_CK_DIV_I2SOUT0_SFT               16
+#define APLL12_CK_DIV_I2SOUT0_MASK              0xff
+#define APLL12_CK_DIV_I2SOUT0_MASK_SFT          (0xff << 16)
+#define APLL12_CK_DIV_I2SOUT1_SFT               24
+#define APLL12_CK_DIV_I2SOUT1_MASK              0xff
+#define APLL12_CK_DIV_I2SOUT1_MASK_SFT          (0xff << 24)
+
+/* CLK_AUDDIV_4 */
+#define APLL12_CK_DIV_I2SOUT2_SFT               0
+#define APLL12_CK_DIV_I2SOUT2_MASK              0xff
+#define APLL12_CK_DIV_I2SOUT2_MASK_SFT          (0xff << 0)
+#define APLL12_CK_DIV_I2SOUT3_SFT               8
+#define APLL12_CK_DIV_I2SOUT3_MASK              0xff
+#define APLL12_CK_DIV_I2SOUT3_MASK_SFT          (0xff << 8)
+#define APLL12_CK_DIV_I2SOUT4_SFT               16
+#define APLL12_CK_DIV_I2SOUT4_MASK              0xff
+#define APLL12_CK_DIV_I2SOUT4_MASK_SFT          (0xff << 16)
+#define APLL12_CK_DIV_I2SOUT6_SFT               24
+#define APLL12_CK_DIV_I2SOUT6_MASK              0xff
+#define APLL12_CK_DIV_I2SOUT6_MASK_SFT          (0xff << 24)
+
+/* CLK_AUDDIV_5 */
+#define APLL12_CK_DIV_FMI2S_SFT                 0
+#define APLL12_CK_DIV_FMI2S_MASK                0xff
+#define APLL12_CK_DIV_FMI2S_MASK_SFT            (0xff << 0)
+#define APLL12_CK_DIV_TDMOUT_M_SFT              8
+#define APLL12_CK_DIV_TDMOUT_M_MASK             0xff
+#define APLL12_CK_DIV_TDMOUT_M_MASK_SFT         (0xff << 8)
+#define APLL12_CK_DIV_TDMOUT_B_SFT              16
+#define APLL12_CK_DIV_TDMOUT_B_MASK             0xff
+#define APLL12_CK_DIV_TDMOUT_B_MASK_SFT         (0xff << 16)
+
+/* APLL */
+#define APLL1_W_NAME "APLL1"
+#define APLL2_W_NAME "APLL2"
+enum {
+	MT8196_APLL1 = 0,
+	MT8196_APLL2,
+};
+
+enum {
+	/* afe clk */
+	CLK_HOPPING = 0,
+	CLK_F26M,
+	CLK_UL0_ADC_CLK,
+	CLK_UL0_ADC_HIRES_CLK,
+	CLK_UL1_ADC_CLK,
+	CLK_UL1_ADC_HIRES_CLK,
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
+int mt8196_afe_disable_apll(struct mtk_base_afe *afe);
+
+int mt8196_afe_dram_request(struct device *dev);
+int mt8196_afe_dram_release(struct device *dev);
+
+int mt8196_apll1_enable(struct mtk_base_afe *afe);
+void mt8196_apll1_disable(struct mtk_base_afe *afe);
+
+int mt8196_apll2_enable(struct mtk_base_afe *afe);
+void mt8196_apll2_disable(struct mtk_base_afe *afe);
+
+int mt8196_get_apll_rate(struct mtk_base_afe *afe, int apll);
+int mt8196_get_apll_by_rate(struct mtk_base_afe *afe, int rate);
+int mt8196_get_apll_by_name(struct mtk_base_afe *afe, const char *name);
+
+void aud_intbus_mux_sel(unsigned int aud_idx);
+
+/* these will be replaced by using CCF */
+int mt8196_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate);
+int mt8196_mck_disable(struct mtk_base_afe *afe, int mck_id);
+
+int mt8196_set_audio_int_bus_parent(struct mtk_base_afe *afe,
+				    int clk_id, bool int_bus);
+
+#endif
-- 
2.45.2


