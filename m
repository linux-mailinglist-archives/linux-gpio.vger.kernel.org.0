Return-Path: <linux-gpio+bounces-18353-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79923A7DD51
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 14:12:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7769189057D
	for <lists+linux-gpio@lfdr.de>; Mon,  7 Apr 2025 12:11:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 310B524DFE8;
	Mon,  7 Apr 2025 12:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="OEHdHGJo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C12624C081;
	Mon,  7 Apr 2025 12:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744027874; cv=none; b=i73ESf/ZxNu5L3qTA4FJReJ5eqebxa+NrvFRG7W6pkDoqbwRc1ET/TEma4jvhad0JRHTvtnmNNMKJCL9qg6tbFrZwJL2rN+awVrdOvck6AjKT2FuOQbV0kaAt7DmgV5vcUV+0ybOvx/sU6CNRHzI5PIvuzeRNVZcYnB4UuqN7sI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744027874; c=relaxed/simple;
	bh=0d06+9SfOGFJ7+V7WbTqQsWJAo+Ld4vxTHlGytWy/Fc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZOHcoQXXJQNIClHshXdExu+9bGgaOVjqvbb9/n4R1JNGhUUWaw6QvOraQVGO/hwBTO0yMYutA5nRdNNSKXnnZkh0YTuVqfSFI04ThSi2Me8dpF3f9HgiitRyOa/5VCCgwzcRrhZHyWZKiDupA+M/JBcY0M1NDGz82CYGm2whpIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=OEHdHGJo; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 6279ca3213a911f0aae1fd9735fae912-20250407
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=J1eVfZEQ8s7ljXVqy6sWIWPpYaMa73Vszzhla+u/OUI=;
	b=OEHdHGJojKIPGrcHM8FWRFGHZNdHxXtvMTWbhfGxNAb6bnJn+uaPdGuhkcTy3ITNC44KNfvAkXUZhisLRX2Tzq6K6ufvWO/le8qt7NXnTMuWeH2HavC5Dw3dGRJdVs+aXQV8wDyrWJCZLSmDEuaTgUeO6LWfJImRZkxwGEgoOiM=;
X-CID-CACHE: Type:Local,Time:202504071948+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:a0879ab7-0b5f-43f5-948d-e91617f792e7,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:f0c80a4b-a527-43d8-8af6-bc8b32d9f5e9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 6279ca3213a911f0aae1fd9735fae912-20250407
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw01.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1301066279; Mon, 07 Apr 2025 20:11:07 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 7 Apr 2025 20:11:05 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 7 Apr 2025 20:11:04 +0800
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
Subject: [PATCH v2 07/11] ASoC: mediatek: mt8196: support TDM in platform driver
Date: Mon, 7 Apr 2025 20:06:31 +0800
Message-ID: <20250407120708.26495-8-darren.ye@mediatek.com>
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

Add mt8196 TDM DAI driver support.

Signed-off-by: Darren Ye <darren.ye@mediatek.com>
---
 sound/soc/mediatek/mt8196/mt8196-dai-tdm.c | 825 +++++++++++++++++++++
 1 file changed, 825 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-dai-tdm.c

diff --git a/sound/soc/mediatek/mt8196/mt8196-dai-tdm.c b/sound/soc/mediatek/mt8196/mt8196-dai-tdm.c
new file mode 100644
index 000000000000..b1ff8480907f
--- /dev/null
+++ b/sound/soc/mediatek/mt8196/mt8196-dai-tdm.c
@@ -0,0 +1,825 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  MediaTek ALSA SoC Audio DAI TDM Control
+ *
+ *  Copyright (c) 2024 MediaTek Inc.
+ *  Author: Darren Ye <darren.ye@mediatek.com>
+ */
+
+#include <linux/regmap.h>
+#include <sound/pcm_params.h>
+#include "mt8196-afe-clk.h"
+#include "mt8196-afe-common.h"
+#include "mt8196-interconnection.h"
+
+struct mtk_afe_tdm_priv {
+	int bck_id;
+	int bck_rate;
+
+	int mclk_id;
+	int mclk_multiple; /* according to sample rate */
+	int mclk_rate;
+	int mclk_apll;
+};
+
+enum {
+	TDM_WLEN_16_BIT = 1,
+	TDM_WLEN_32_BIT = 2,
+};
+
+enum {
+	TDM_CHANNEL_BCK_16 = 0,
+	TDM_CHANNEL_BCK_24 = 1,
+	TDM_CHANNEL_BCK_32 = 2,
+};
+
+enum {
+	TDM_CHANNEL_NUM_2 = 0,
+	TDM_CHANNEL_NUM_4 = 1,
+	TDM_CHANNEL_NUM_8 = 2,
+};
+
+enum  {
+	TDM_CH_START_O30_O31 = 0,
+	TDM_CH_START_O32_O33,
+	TDM_CH_START_O34_O35,
+	TDM_CH_START_O36_O37,
+	TDM_CH_ZERO,
+};
+
+enum {
+	DPTX_CHANNEL_2,
+	DPTX_CHANNEL_8,
+};
+
+enum {
+	DPTX_WLEN_24_BIT,
+	DPTX_WLEN_16_BIT,
+};
+
+enum {
+	DPTX_CH_EN_MASK_2CH = 0x3,
+	DPTX_CH_EN_MASK_4CH = 0xf,
+	DPTX_CH_EN_MASK_6CH = 0x3f,
+	DPTX_CH_EN_MASK_8CH = 0xff,
+};
+
+static unsigned int get_tdm_wlen(snd_pcm_format_t format)
+{
+	return snd_pcm_format_physical_width(format) <= 16 ?
+	       TDM_WLEN_16_BIT : TDM_WLEN_32_BIT;
+}
+
+static unsigned int get_tdm_channel_bck(snd_pcm_format_t format)
+{
+	return snd_pcm_format_physical_width(format) <= 16 ?
+	       TDM_CHANNEL_BCK_16 : TDM_CHANNEL_BCK_32;
+}
+
+static unsigned int get_tdm_lrck_width(snd_pcm_format_t format)
+{
+	return snd_pcm_format_physical_width(format) - 1;
+}
+
+static unsigned int get_tdm_ch(unsigned int ch)
+{
+	switch (ch) {
+	case 1:
+	case 2:
+		return TDM_CHANNEL_NUM_2;
+	case 3:
+	case 4:
+		return TDM_CHANNEL_NUM_4;
+	case 5:
+	case 6:
+	case 7:
+	case 8:
+	default:
+		return TDM_CHANNEL_NUM_8;
+	}
+}
+
+static unsigned int get_dptx_ch_enable_mask(unsigned int ch)
+{
+	switch (ch) {
+	case 1:
+	case 2:
+		return DPTX_CH_EN_MASK_2CH;
+	case 3:
+	case 4:
+		return DPTX_CH_EN_MASK_4CH;
+	case 5:
+	case 6:
+		return DPTX_CH_EN_MASK_6CH;
+	case 7:
+	case 8:
+		return DPTX_CH_EN_MASK_8CH;
+	default:
+		pr_info("invalid channel num, default use 2ch\n");
+		return DPTX_CH_EN_MASK_2CH;
+	}
+}
+
+static unsigned int get_dptx_ch(unsigned int ch)
+{
+	if (ch == 2)
+		return DPTX_CHANNEL_2;
+	else
+		return DPTX_CHANNEL_8;
+}
+
+static unsigned int get_dptx_wlen(snd_pcm_format_t format)
+{
+	return snd_pcm_format_physical_width(format) <= 16 ?
+	       DPTX_WLEN_16_BIT : DPTX_WLEN_24_BIT;
+}
+
+/* interconnection */
+enum {
+	HDMI_CONN_CH0 = 0,
+	HDMI_CONN_CH1,
+	HDMI_CONN_CH2,
+	HDMI_CONN_CH3,
+	HDMI_CONN_CH4,
+	HDMI_CONN_CH5,
+	HDMI_CONN_CH6,
+	HDMI_CONN_CH7,
+};
+
+static const char *const hdmi_conn_mux_map[] = {
+	"CH0", "CH1", "CH2", "CH3",
+	"CH4", "CH5", "CH6", "CH7",
+};
+
+static int hdmi_conn_mux_map_value[] = {
+	HDMI_CONN_CH0,
+	HDMI_CONN_CH1,
+	HDMI_CONN_CH2,
+	HDMI_CONN_CH3,
+	HDMI_CONN_CH4,
+	HDMI_CONN_CH5,
+	HDMI_CONN_CH6,
+	HDMI_CONN_CH7,
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(hdmi_ch0_mux_map_enum,
+				  AFE_HDMI_CONN0,
+				  HDMI_O_0_SFT,
+				  HDMI_O_0_MASK,
+				  hdmi_conn_mux_map,
+				  hdmi_conn_mux_map_value);
+
+static const struct snd_kcontrol_new hdmi_ch0_mux_control =
+	SOC_DAPM_ENUM("HDMI_CH0_MUX", hdmi_ch0_mux_map_enum);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(hdmi_ch1_mux_map_enum,
+				  AFE_HDMI_CONN0,
+				  HDMI_O_1_SFT,
+				  HDMI_O_1_MASK,
+				  hdmi_conn_mux_map,
+				  hdmi_conn_mux_map_value);
+
+static const struct snd_kcontrol_new hdmi_ch1_mux_control =
+	SOC_DAPM_ENUM("HDMI_CH1_MUX", hdmi_ch1_mux_map_enum);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(hdmi_ch2_mux_map_enum,
+				  AFE_HDMI_CONN0,
+				  HDMI_O_2_SFT,
+				  HDMI_O_2_MASK,
+				  hdmi_conn_mux_map,
+				  hdmi_conn_mux_map_value);
+
+static const struct snd_kcontrol_new hdmi_ch2_mux_control =
+	SOC_DAPM_ENUM("HDMI_CH2_MUX", hdmi_ch2_mux_map_enum);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(hdmi_ch3_mux_map_enum,
+				  AFE_HDMI_CONN0,
+				  HDMI_O_3_SFT,
+				  HDMI_O_3_MASK,
+				  hdmi_conn_mux_map,
+				  hdmi_conn_mux_map_value);
+
+static const struct snd_kcontrol_new hdmi_ch3_mux_control =
+	SOC_DAPM_ENUM("HDMI_CH3_MUX", hdmi_ch3_mux_map_enum);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(hdmi_ch4_mux_map_enum,
+				  AFE_HDMI_CONN0,
+				  HDMI_O_4_SFT,
+				  HDMI_O_4_MASK,
+				  hdmi_conn_mux_map,
+				  hdmi_conn_mux_map_value);
+
+static const struct snd_kcontrol_new hdmi_ch4_mux_control =
+	SOC_DAPM_ENUM("HDMI_CH4_MUX", hdmi_ch4_mux_map_enum);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(hdmi_ch5_mux_map_enum,
+				  AFE_HDMI_CONN0,
+				  HDMI_O_5_SFT,
+				  HDMI_O_5_MASK,
+				  hdmi_conn_mux_map,
+				  hdmi_conn_mux_map_value);
+
+static const struct snd_kcontrol_new hdmi_ch5_mux_control =
+	SOC_DAPM_ENUM("HDMI_CH5_MUX", hdmi_ch5_mux_map_enum);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(hdmi_ch6_mux_map_enum,
+				  AFE_HDMI_CONN0,
+				  HDMI_O_6_SFT,
+				  HDMI_O_6_MASK,
+				  hdmi_conn_mux_map,
+				  hdmi_conn_mux_map_value);
+
+static const struct snd_kcontrol_new hdmi_ch6_mux_control =
+	SOC_DAPM_ENUM("HDMI_CH6_MUX", hdmi_ch6_mux_map_enum);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(hdmi_ch7_mux_map_enum,
+				  AFE_HDMI_CONN0,
+				  HDMI_O_7_SFT,
+				  HDMI_O_7_MASK,
+				  hdmi_conn_mux_map,
+				  hdmi_conn_mux_map_value);
+
+static const struct snd_kcontrol_new hdmi_ch7_mux_control =
+	SOC_DAPM_ENUM("HDMI_CH7_MUX", hdmi_ch7_mux_map_enum);
+
+static const char *const tdm_out_mux_map[] = {
+	"Disconnect", "Connect",
+};
+
+static int tdm_out_mux_map_value[] = {
+	0, 1,
+};
+
+static SOC_VALUE_ENUM_SINGLE_AUTODISABLE_DECL(hdmi_out_mux_map_enum,
+		SND_SOC_NOPM,
+		0,
+		1,
+		tdm_out_mux_map,
+		tdm_out_mux_map_value);
+static const struct snd_kcontrol_new hdmi_out_mux_control =
+	SOC_DAPM_ENUM("HDMI_OUT_MUX", hdmi_out_mux_map_enum);
+
+static SOC_VALUE_ENUM_SINGLE_AUTODISABLE_DECL(dptx_out_mux_map_enum,
+		SND_SOC_NOPM,
+		0,
+		1,
+		tdm_out_mux_map,
+		tdm_out_mux_map_value);
+static const struct snd_kcontrol_new dptx_out_mux_control =
+	SOC_DAPM_ENUM("DPTX_OUT_MUX", dptx_out_mux_map_enum);
+
+static SOC_VALUE_ENUM_SINGLE_AUTODISABLE_DECL(dptx_virtual_out_mux_map_enum,
+		SND_SOC_NOPM,
+		0,
+		1,
+		tdm_out_mux_map,
+		tdm_out_mux_map_value);
+
+static const struct snd_kcontrol_new dptx_virtual_out_mux_control =
+	SOC_DAPM_ENUM("DPTX_VIRTUAL_OUT_MUX", dptx_virtual_out_mux_map_enum);
+
+enum {
+	SUPPLY_SEQ_APLL,
+	SUPPLY_SEQ_TDM_MCK_EN,
+	SUPPLY_SEQ_TDM_BCK_EN,
+	SUPPLY_SEQ_TDM_DPTX_MCK_EN,
+	SUPPLY_SEQ_TDM_DPTX_BCK_EN,
+};
+
+static int get_tdm_id_by_name(const char *name)
+{
+	if (strstr(name, "DPTX"))
+		return MT8196_DAI_TDM_DPTX;
+	else
+		return MT8196_DAI_TDM;
+}
+
+static int mtk_tdm_bck_en_event(struct snd_soc_dapm_widget *w,
+				struct snd_kcontrol *kcontrol,
+				int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	int dai_id = get_tdm_id_by_name(w->name);
+	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+
+	dev_dbg(cmpnt->dev, "name %s, event 0x%x, dai_id %d\n",
+		w->name, event, dai_id);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		mt8196_mck_enable(afe, tdm_priv->bck_id, tdm_priv->bck_rate);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		mt8196_mck_disable(afe, tdm_priv->bck_id);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mtk_tdm_mck_en_event(struct snd_soc_dapm_widget *w,
+				struct snd_kcontrol *kcontrol,
+				int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	int dai_id = get_tdm_id_by_name(w->name);
+	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+
+	dev_dbg(cmpnt->dev, "name %s, event 0x%x, dai_id %d\n",
+		w->name, event, dai_id);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		mt8196_mck_enable(afe, tdm_priv->mclk_id, tdm_priv->mclk_rate);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		tdm_priv->mclk_rate = 0;
+		mt8196_mck_disable(afe, tdm_priv->mclk_id);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget mtk_dai_tdm_widgets[] = {
+	SND_SOC_DAPM_MUX("HDMI_CH0_MUX", SND_SOC_NOPM, 0, 0,
+			 &hdmi_ch0_mux_control),
+	SND_SOC_DAPM_MUX("HDMI_CH1_MUX", SND_SOC_NOPM, 0, 0,
+			 &hdmi_ch1_mux_control),
+	SND_SOC_DAPM_MUX("HDMI_CH2_MUX", SND_SOC_NOPM, 0, 0,
+			 &hdmi_ch2_mux_control),
+	SND_SOC_DAPM_MUX("HDMI_CH3_MUX", SND_SOC_NOPM, 0, 0,
+			 &hdmi_ch3_mux_control),
+	SND_SOC_DAPM_MUX("HDMI_CH4_MUX", SND_SOC_NOPM, 0, 0,
+			 &hdmi_ch4_mux_control),
+	SND_SOC_DAPM_MUX("HDMI_CH5_MUX", SND_SOC_NOPM, 0, 0,
+			 &hdmi_ch5_mux_control),
+	SND_SOC_DAPM_MUX("HDMI_CH6_MUX", SND_SOC_NOPM, 0, 0,
+			 &hdmi_ch6_mux_control),
+	SND_SOC_DAPM_MUX("HDMI_CH7_MUX", SND_SOC_NOPM, 0, 0,
+			 &hdmi_ch7_mux_control),
+	SND_SOC_DAPM_MUX("HDMI_OUT_MUX", SND_SOC_NOPM, 0, 0,
+			 &hdmi_out_mux_control),
+	SND_SOC_DAPM_MUX("DPTX_OUT_MUX", SND_SOC_NOPM, 0, 0,
+			 &dptx_out_mux_control),
+
+	SND_SOC_DAPM_SUPPLY_S("TDM_BCK", SUPPLY_SEQ_TDM_BCK_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_tdm_bck_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_SUPPLY_S("TDM_MCK", SUPPLY_SEQ_TDM_MCK_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_tdm_mck_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_SUPPLY_S("TDM_DPTX_BCK", SUPPLY_SEQ_TDM_DPTX_BCK_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_tdm_bck_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_SUPPLY_S("TDM_DPTX_MCK", SUPPLY_SEQ_TDM_DPTX_MCK_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_tdm_mck_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	SND_SOC_DAPM_MUX("DPTX_VIRTUAL_OUT_MUX",
+			 SND_SOC_NOPM, 0, 0, &dptx_virtual_out_mux_control),
+	SND_SOC_DAPM_OUTPUT("DPTX_VIRTUAL_OUT"),
+};
+
+static int mtk_afe_tdm_apll_connect(struct snd_soc_dapm_widget *source,
+				    struct snd_soc_dapm_widget *sink)
+{
+	struct snd_soc_dapm_widget *w = sink;
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	int dai_id = get_tdm_id_by_name(w->name);
+	struct mtk_afe_tdm_priv *tdm_priv = afe_priv->dai_priv[dai_id];
+	int cur_apll;
+
+	/* which apll */
+	cur_apll = mt8196_get_apll_by_name(afe, source->name);
+
+	return (tdm_priv->mclk_apll == cur_apll) ? 1 : 0;
+}
+
+static const struct snd_soc_dapm_route mtk_dai_tdm_routes[] = {
+	{"HDMI_CH0_MUX", "CH0", "HDMI"},
+	{"HDMI_CH0_MUX", "CH1", "HDMI"},
+	{"HDMI_CH0_MUX", "CH2", "HDMI"},
+	{"HDMI_CH0_MUX", "CH3", "HDMI"},
+	{"HDMI_CH0_MUX", "CH4", "HDMI"},
+	{"HDMI_CH0_MUX", "CH5", "HDMI"},
+	{"HDMI_CH0_MUX", "CH6", "HDMI"},
+	{"HDMI_CH0_MUX", "CH7", "HDMI"},
+
+	{"HDMI_CH1_MUX", "CH0", "HDMI"},
+	{"HDMI_CH1_MUX", "CH1", "HDMI"},
+	{"HDMI_CH1_MUX", "CH2", "HDMI"},
+	{"HDMI_CH1_MUX", "CH3", "HDMI"},
+	{"HDMI_CH1_MUX", "CH4", "HDMI"},
+	{"HDMI_CH1_MUX", "CH5", "HDMI"},
+	{"HDMI_CH1_MUX", "CH6", "HDMI"},
+	{"HDMI_CH1_MUX", "CH7", "HDMI"},
+
+	{"HDMI_CH2_MUX", "CH0", "HDMI"},
+	{"HDMI_CH2_MUX", "CH1", "HDMI"},
+	{"HDMI_CH2_MUX", "CH2", "HDMI"},
+	{"HDMI_CH2_MUX", "CH3", "HDMI"},
+	{"HDMI_CH2_MUX", "CH4", "HDMI"},
+	{"HDMI_CH2_MUX", "CH5", "HDMI"},
+	{"HDMI_CH2_MUX", "CH6", "HDMI"},
+	{"HDMI_CH2_MUX", "CH7", "HDMI"},
+
+	{"HDMI_CH3_MUX", "CH0", "HDMI"},
+	{"HDMI_CH3_MUX", "CH1", "HDMI"},
+	{"HDMI_CH3_MUX", "CH2", "HDMI"},
+	{"HDMI_CH3_MUX", "CH3", "HDMI"},
+	{"HDMI_CH3_MUX", "CH4", "HDMI"},
+	{"HDMI_CH3_MUX", "CH5", "HDMI"},
+	{"HDMI_CH3_MUX", "CH6", "HDMI"},
+	{"HDMI_CH3_MUX", "CH7", "HDMI"},
+
+	{"HDMI_CH4_MUX", "CH0", "HDMI"},
+	{"HDMI_CH4_MUX", "CH1", "HDMI"},
+	{"HDMI_CH4_MUX", "CH2", "HDMI"},
+	{"HDMI_CH4_MUX", "CH3", "HDMI"},
+	{"HDMI_CH4_MUX", "CH4", "HDMI"},
+	{"HDMI_CH4_MUX", "CH5", "HDMI"},
+	{"HDMI_CH4_MUX", "CH6", "HDMI"},
+	{"HDMI_CH4_MUX", "CH7", "HDMI"},
+
+	{"HDMI_CH5_MUX", "CH0", "HDMI"},
+	{"HDMI_CH5_MUX", "CH1", "HDMI"},
+	{"HDMI_CH5_MUX", "CH2", "HDMI"},
+	{"HDMI_CH5_MUX", "CH3", "HDMI"},
+	{"HDMI_CH5_MUX", "CH4", "HDMI"},
+	{"HDMI_CH5_MUX", "CH5", "HDMI"},
+	{"HDMI_CH5_MUX", "CH6", "HDMI"},
+	{"HDMI_CH5_MUX", "CH7", "HDMI"},
+
+	{"HDMI_CH6_MUX", "CH0", "HDMI"},
+	{"HDMI_CH6_MUX", "CH1", "HDMI"},
+	{"HDMI_CH6_MUX", "CH2", "HDMI"},
+	{"HDMI_CH6_MUX", "CH3", "HDMI"},
+	{"HDMI_CH6_MUX", "CH4", "HDMI"},
+	{"HDMI_CH6_MUX", "CH5", "HDMI"},
+	{"HDMI_CH6_MUX", "CH6", "HDMI"},
+	{"HDMI_CH6_MUX", "CH7", "HDMI"},
+
+	{"HDMI_CH7_MUX", "CH0", "HDMI"},
+	{"HDMI_CH7_MUX", "CH1", "HDMI"},
+	{"HDMI_CH7_MUX", "CH2", "HDMI"},
+	{"HDMI_CH7_MUX", "CH3", "HDMI"},
+	{"HDMI_CH7_MUX", "CH4", "HDMI"},
+	{"HDMI_CH7_MUX", "CH5", "HDMI"},
+	{"HDMI_CH7_MUX", "CH6", "HDMI"},
+	{"HDMI_CH7_MUX", "CH7", "HDMI"},
+
+	{"HDMI_OUT_MUX", "Connect", "HDMI_CH0_MUX"},
+	{"HDMI_OUT_MUX", "Connect", "HDMI_CH1_MUX"},
+	{"HDMI_OUT_MUX", "Connect", "HDMI_CH2_MUX"},
+	{"HDMI_OUT_MUX", "Connect", "HDMI_CH3_MUX"},
+	{"HDMI_OUT_MUX", "Connect", "HDMI_CH4_MUX"},
+	{"HDMI_OUT_MUX", "Connect", "HDMI_CH5_MUX"},
+	{"HDMI_OUT_MUX", "Connect", "HDMI_CH6_MUX"},
+	{"HDMI_OUT_MUX", "Connect", "HDMI_CH7_MUX"},
+
+	{"DPTX_OUT_MUX", "Connect", "HDMI_CH0_MUX"},
+	{"DPTX_OUT_MUX", "Connect", "HDMI_CH1_MUX"},
+	{"DPTX_OUT_MUX", "Connect", "HDMI_CH2_MUX"},
+	{"DPTX_OUT_MUX", "Connect", "HDMI_CH3_MUX"},
+	{"DPTX_OUT_MUX", "Connect", "HDMI_CH4_MUX"},
+	{"DPTX_OUT_MUX", "Connect", "HDMI_CH5_MUX"},
+	{"DPTX_OUT_MUX", "Connect", "HDMI_CH6_MUX"},
+	{"DPTX_OUT_MUX", "Connect", "HDMI_CH7_MUX"},
+
+	{"TDM", NULL, "HDMI_OUT_MUX"},
+	{"TDM", NULL, "TDM_BCK"},
+
+	{"TDM_DPTX", NULL, "DPTX_OUT_MUX"},
+	{"TDM_DPTX", NULL, "TDM_DPTX_BCK"},
+
+	{"TDM_BCK", NULL, "TDM_MCK"},
+	{"TDM_DPTX_BCK", NULL, "TDM_DPTX_MCK"},
+	{"TDM_MCK", NULL, APLL1_W_NAME, mtk_afe_tdm_apll_connect},
+	{"TDM_MCK", NULL, APLL2_W_NAME, mtk_afe_tdm_apll_connect},
+	{"TDM_DPTX_MCK", NULL, APLL1_W_NAME, mtk_afe_tdm_apll_connect},
+	{"TDM_DPTX_MCK", NULL, APLL2_W_NAME, mtk_afe_tdm_apll_connect},
+
+	{"DPTX_VIRTUAL_OUT_MUX", "Connect", "TDM_DPTX"},
+	{"DPTX_VIRTUAL_OUT", NULL, "DPTX_VIRTUAL_OUT_MUX"},
+};
+
+/* dai ops */
+static int mtk_dai_tdm_cal_mclk(struct mtk_base_afe *afe,
+				struct mtk_afe_tdm_priv *tdm_priv,
+				int freq)
+{
+	int apll;
+	int apll_rate;
+
+	apll = mt8196_get_apll_by_rate(afe, freq);
+	apll_rate = mt8196_get_apll_rate(afe, apll);
+
+	if (freq > apll_rate)
+		return -EINVAL;
+
+	if (apll_rate % freq != 0)
+		return -EINVAL;
+
+	tdm_priv->mclk_rate = freq;
+	tdm_priv->mclk_apll = apll;
+
+	return 0;
+}
+
+static int mtk_dai_tdm_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params,
+				 struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	int tdm_id = dai->id;
+	struct mtk_afe_tdm_priv *tdm_priv;
+	unsigned int rate = params_rate(params);
+	unsigned int channels = params_channels(params);
+	snd_pcm_format_t format = params_format(params);
+	unsigned int tdm_con = 0;
+
+	if (tdm_id >= MT8196_DAI_NUM || tdm_id < 0)
+		return -EINVAL;
+
+	tdm_priv = afe_priv->dai_priv[tdm_id];
+
+	/* calculate mclk_rate, if not set explicitly */
+	if (!tdm_priv->mclk_rate) {
+		tdm_priv->mclk_rate = rate * tdm_priv->mclk_multiple;
+		mtk_dai_tdm_cal_mclk(afe,
+				     tdm_priv,
+				     tdm_priv->mclk_rate);
+	}
+
+	/* calculate bck */
+	tdm_priv->bck_rate = rate *
+			     channels *
+			     snd_pcm_format_physical_width(format);
+
+	if (tdm_priv->bck_rate > tdm_priv->mclk_rate)
+		return -EINVAL;
+
+	if (tdm_priv->mclk_rate % tdm_priv->bck_rate != 0)
+		return -EINVAL;
+
+	dev_info(afe->dev, "id %d, rate %d, channels %d, format %d, mclk_rate %d, bck_rate %d\n",
+		 tdm_id, rate, channels, format,
+		 tdm_priv->mclk_rate, tdm_priv->bck_rate);
+
+	/* set tdm */
+	tdm_con = 0 << BCK_INVERSE_SFT;
+	tdm_con |= 0 << LRCK_INVERSE_SFT;
+	tdm_con |= 0 << DELAY_DATA_SFT;
+	tdm_con |= 1 << LEFT_ALIGN_SFT;
+	tdm_con |= get_tdm_wlen(format) << WLEN_SFT;
+	tdm_con |= get_tdm_ch(channels) << CHANNEL_NUM_SFT;
+	tdm_con |= get_tdm_channel_bck(format) << CHANNEL_BCK_CYCLES_SFT;
+	tdm_con |= get_tdm_lrck_width(format) << LRCK_TDM_WIDTH_SFT;
+	regmap_write(afe->regmap, AFE_TDM_CON1, tdm_con);
+
+	/* set dptx */
+	if (tdm_id == MT8196_DAI_TDM_DPTX) {
+		regmap_update_bits(afe->regmap, AFE_DPTX_CON,
+				   DPTX_CHANNEL_ENABLE_MASK_SFT,
+				   get_dptx_ch_enable_mask(channels) <<
+				   DPTX_CHANNEL_ENABLE_SFT);
+		regmap_update_bits(afe->regmap, AFE_DPTX_CON,
+				   DPTX_CHANNEL_NUMBER_MASK_SFT,
+				   get_dptx_ch(channels) <<
+				   DPTX_CHANNEL_NUMBER_SFT);
+		regmap_update_bits(afe->regmap, AFE_DPTX_CON,
+				   DPTX_16BIT_MASK_SFT,
+				   get_dptx_wlen(format) << DPTX_16BIT_SFT);
+	}
+		switch (channels) {
+		case 1:
+		case 2:
+			tdm_con = TDM_CH_START_O30_O31 << ST_CH_PAIR_SOUT0_SFT;
+			tdm_con |= TDM_CH_ZERO << ST_CH_PAIR_SOUT1_SFT;
+			tdm_con |= TDM_CH_ZERO << ST_CH_PAIR_SOUT2_SFT;
+			tdm_con |= TDM_CH_ZERO << ST_CH_PAIR_SOUT3_SFT;
+			break;
+		case 3:
+		case 4:
+			tdm_con = TDM_CH_START_O30_O31 << ST_CH_PAIR_SOUT0_SFT;
+			tdm_con |= TDM_CH_START_O32_O33 << ST_CH_PAIR_SOUT1_SFT;
+			tdm_con |= TDM_CH_ZERO << ST_CH_PAIR_SOUT2_SFT;
+			tdm_con |= TDM_CH_ZERO << ST_CH_PAIR_SOUT3_SFT;
+			break;
+		case 5:
+		case 6:
+			tdm_con = TDM_CH_START_O30_O31 << ST_CH_PAIR_SOUT0_SFT;
+			tdm_con |= TDM_CH_START_O32_O33 << ST_CH_PAIR_SOUT1_SFT;
+			tdm_con |= TDM_CH_START_O34_O35 << ST_CH_PAIR_SOUT2_SFT;
+			tdm_con |= TDM_CH_ZERO << ST_CH_PAIR_SOUT3_SFT;
+			break;
+		case 7:
+		case 8:
+			tdm_con = TDM_CH_START_O30_O31 << ST_CH_PAIR_SOUT0_SFT;
+			tdm_con |= TDM_CH_START_O32_O33 << ST_CH_PAIR_SOUT1_SFT;
+			tdm_con |= TDM_CH_START_O34_O35 << ST_CH_PAIR_SOUT2_SFT;
+			tdm_con |= TDM_CH_START_O36_O37 << ST_CH_PAIR_SOUT3_SFT;
+			break;
+		default:
+			tdm_con = 0;
+		}
+	regmap_write(afe->regmap, AFE_TDM_CON2, tdm_con);
+	regmap_update_bits(afe->regmap, AFE_HDMI_OUT_CON0,
+			   HDMI_CH_NUM_MASK_SFT,
+			   channels << HDMI_CH_NUM_SFT);
+
+	return 0;
+}
+
+static int mtk_dai_tdm_trigger(struct snd_pcm_substream *substream,
+			       int cmd,
+			       struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	int tdm_id = dai->id;
+
+	dev_dbg(afe->dev, "cmd %d, tdm_id %d\n", cmd, tdm_id);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+		/* enable Out control */
+		regmap_update_bits(afe->regmap, AFE_HDMI_OUT_CON0,
+				   HDMI_OUT_ON_MASK_SFT,
+				   0x1 << HDMI_OUT_ON_SFT);
+
+		/* enable dptx */
+		if (tdm_id == MT8196_DAI_TDM_DPTX) {
+			regmap_update_bits(afe->regmap, AFE_DPTX_CON,
+					   DPTX_ON_MASK_SFT, 0x1 <<
+					   DPTX_ON_SFT);
+		}
+
+		/* enable tdm */
+		regmap_update_bits(afe->regmap, AFE_TDM_CON1,
+				   TDM_EN_MASK_SFT, 0x1 << TDM_EN_SFT);
+		break;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+		/* disable tdm */
+		regmap_update_bits(afe->regmap, AFE_TDM_CON1,
+				   TDM_EN_MASK_SFT, 0);
+
+		/* disable dptx */
+		if (tdm_id == MT8196_DAI_TDM_DPTX) {
+			regmap_update_bits(afe->regmap, AFE_DPTX_CON,
+					   DPTX_ON_MASK_SFT, 0);
+		}
+
+		/* disable Out control */
+		regmap_update_bits(afe->regmap, AFE_HDMI_OUT_CON0,
+				   HDMI_OUT_ON_MASK_SFT, 0);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int mtk_dai_tdm_set_sysclk(struct snd_soc_dai *dai,
+				  int clk_id, unsigned int freq, int dir)
+{
+	struct mtk_base_afe *afe = dev_get_drvdata(dai->dev);
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_afe_tdm_priv *tdm_priv;
+
+	if (dai->id >= MT8196_DAI_NUM || dai->id < 0)
+		return -EINVAL;
+
+	tdm_priv = afe_priv->dai_priv[dai->id];
+
+	if (!tdm_priv)
+		return -EINVAL;
+
+	if (dir != SND_SOC_CLOCK_OUT)
+		return -EINVAL;
+
+	dev_dbg(afe->dev, "freq %d\n", freq);
+
+	return mtk_dai_tdm_cal_mclk(afe, tdm_priv, freq);
+}
+
+static const struct snd_soc_dai_ops mtk_dai_tdm_ops = {
+	.hw_params = mtk_dai_tdm_hw_params,
+	.trigger = mtk_dai_tdm_trigger,
+	.set_sysclk = mtk_dai_tdm_set_sysclk,
+};
+
+/* dai driver */
+#define MTK_TDM_RATES (SNDRV_PCM_RATE_8000_48000 |\
+		       SNDRV_PCM_RATE_88200 |\
+		       SNDRV_PCM_RATE_96000 |\
+		       SNDRV_PCM_RATE_176400 |\
+		       SNDRV_PCM_RATE_192000)
+
+#define MTK_TDM_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
+			 SNDRV_PCM_FMTBIT_S24_LE |\
+			 SNDRV_PCM_FMTBIT_S32_LE)
+
+static struct snd_soc_dai_driver mtk_dai_tdm_driver[] = {
+	{
+		.name = "TDM",
+		.id = MT8196_DAI_TDM,
+		.playback = {
+			.stream_name = "TDM",
+			.channels_min = 2,
+			.channels_max = 8,
+			.rates = MTK_TDM_RATES,
+			.formats = MTK_TDM_FORMATS,
+		},
+		.ops = &mtk_dai_tdm_ops,
+	},
+	{
+		.name = "TDM_DPTX",
+		.id = MT8196_DAI_TDM_DPTX,
+		.playback = {
+			.stream_name = "TDM_DPTX",
+			.channels_min = 2,
+			.channels_max = 8,
+			.rates = MTK_TDM_RATES,
+			.formats = MTK_TDM_FORMATS,
+		},
+		.ops = &mtk_dai_tdm_ops,
+	},
+};
+
+static struct mtk_afe_tdm_priv *init_tdm_priv_data(struct mtk_base_afe *afe,
+						   int id)
+{
+	struct mtk_afe_tdm_priv *tdm_priv;
+
+	tdm_priv = devm_kzalloc(afe->dev, sizeof(struct mtk_afe_tdm_priv),
+				GFP_KERNEL);
+	if (!tdm_priv)
+		return NULL;
+
+	if (id == MT8196_DAI_TDM_DPTX)
+		tdm_priv->mclk_multiple = 256;
+	else
+		tdm_priv->mclk_multiple = 128;
+
+	tdm_priv->bck_id = MT8196_TDMOUT_BCK;
+	tdm_priv->mclk_id = MT8196_TDMOUT_MCK;
+
+	return tdm_priv;
+}
+
+int mt8196_dai_tdm_register(struct mtk_base_afe *afe)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_afe_tdm_priv *tdm_priv, *tdm_dptx_priv;
+	struct mtk_base_afe_dai *dai;
+
+	dai = devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
+	if (!dai)
+		return -ENOMEM;
+
+	list_add(&dai->list, &afe->sub_dais);
+
+	dai->dai_drivers = mtk_dai_tdm_driver;
+	dai->num_dai_drivers = ARRAY_SIZE(mtk_dai_tdm_driver);
+
+	dai->dapm_widgets = mtk_dai_tdm_widgets;
+	dai->num_dapm_widgets = ARRAY_SIZE(mtk_dai_tdm_widgets);
+	dai->dapm_routes = mtk_dai_tdm_routes;
+	dai->num_dapm_routes = ARRAY_SIZE(mtk_dai_tdm_routes);
+
+	tdm_priv = init_tdm_priv_data(afe, MT8196_DAI_TDM);
+	if (!tdm_priv)
+		return -ENOMEM;
+
+	tdm_dptx_priv = init_tdm_priv_data(afe, MT8196_DAI_TDM_DPTX);
+	if (!tdm_dptx_priv)
+		return -ENOMEM;
+
+	afe_priv->dai_priv[MT8196_DAI_TDM] = tdm_priv;
+	afe_priv->dai_priv[MT8196_DAI_TDM_DPTX] = tdm_dptx_priv;
+
+	return 0;
+}
+
-- 
2.45.2


