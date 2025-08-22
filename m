Return-Path: <linux-gpio+bounces-24800-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7F6B3186E
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 14:55:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 21F901C875CC
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Aug 2025 12:54:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 333AE2FE04C;
	Fri, 22 Aug 2025 12:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="RWO29yOo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F272FD1BE;
	Fri, 22 Aug 2025 12:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755867231; cv=none; b=n7qQSIVorKZE7ov/uv/A9g4b6JLdQgtVHQ5r47s+YRtn7gZzbS6tuyakWddOkzw/grboz+sEzMynSF6sX1Qq03aJKD0sQsBfKFiD8oRMwvlHgv8gCuH/WrX0QEfTK3NQOu5hfxiySTURKUfkGj6qR7mtB11EsspPnZnusXiqJls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755867231; c=relaxed/simple;
	bh=0WUh180N5N5oqFSE4deTNAGRzrEM+lH88ulNnI9SMlo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fomOjgu33ipPMDqs//SiBgDVBydloTuztx8s/R+UKQX9rODa8dzg7Bh40+nykomDlIPhlOxXEXNHech9+s38KNeLFKBybk013u30jFzT3nnOYGBW7CqD3Zft1ilN2v7uM8Wb6M1d1/6MUiA4h2b5FmHRJLDYVC5FJn0Kyodf7Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=RWO29yOo; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 08cdb68c7f5711f0b33aeb1e7f16c2b6-20250822
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=OOYx0NHHCw8jekXWevceY+aYAeABc83YIHxU0FKTj8w=;
	b=RWO29yOoMblNwZAR4EyvpeD84EGnmvW2FDQ8+Rrnf4e7OMUMX+egS8Xjssveu/px8Bxo3SRktzuwiOkziCI2LY4oymAte9UyaiaLcdhYhvGHO8b7ZblqjOv1RjXNhWvQkWcepXODjATW+1d6H1nh1ofAIQotaYEEpqOTpKqa1sQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:3fb479d3-04a2-4d81-b8b1-08a6c727731d,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:61f7c344-18c5-4075-a135-4c0afe29f9d6,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 08cdb68c7f5711f0b33aeb1e7f16c2b6-20250822
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1433470537; Fri, 22 Aug 2025 20:53:43 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS09N1.mediatek.inc (172.21.101.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 22 Aug 2025 20:53:41 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 22 Aug 2025 20:53:39 +0800
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
Subject: [PATCH v7 06/10] ASoC: mediatek: mt8196: support TDM in platform driver
Date: Fri, 22 Aug 2025 20:52:35 +0800
Message-ID: <20250822125301.12333-7-darren.ye@mediatek.com>
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

Add mt8196 TDM DAI driver support.

Signed-off-by: Darren Ye <darren.ye@mediatek.com>
---
 sound/soc/mediatek/mt8196/mt8196-dai-tdm.c | 675 +++++++++++++++++++++
 1 file changed, 675 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-dai-tdm.c

diff --git a/sound/soc/mediatek/mt8196/mt8196-dai-tdm.c b/sound/soc/mediatek/mt8196/mt8196-dai-tdm.c
new file mode 100644
index 000000000000..b7aeee939d88
--- /dev/null
+++ b/sound/soc/mediatek/mt8196/mt8196-dai-tdm.c
@@ -0,0 +1,675 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  MediaTek ALSA SoC Audio DAI TDM Control
+ *
+ *  Copyright (c) 2025 MediaTek Inc.
+ *  Author: Darren Ye <darren.ye@mediatek.com>
+ */
+
+#include <linux/regmap.h>
+#include <sound/pcm_params.h>
+
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
+	TDM_WLEN_8_BIT,
+	TDM_WLEN_16_BIT,
+	TDM_WLEN_24_BIT,
+	TDM_WLEN_32_BIT,
+};
+
+enum {
+	TDM_CHANNEL_BCK_16,
+	TDM_CHANNEL_BCK_24,
+	TDM_CHANNEL_BCK_32,
+};
+
+enum {
+	TDM_CHANNEL_NUM_2,
+	TDM_CHANNEL_NUM_4,
+	TDM_CHANNEL_NUM_8,
+};
+
+enum  {
+	TDM_CH_START_O30_O31,
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
+#define DPTX_CH_EN_MASK_2CH (0x3)
+#define DPTX_CH_EN_MASK_4CH (0xf)
+#define DPTX_CH_EN_MASK_6CH (0x3f)
+#define DPTX_CH_EN_MASK_8CH (0xff)
+
+static unsigned int get_tdm_wlen(snd_pcm_format_t format)
+{
+	return (snd_pcm_format_physical_width(format) / 8) - 1;
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
+static unsigned int get_dptx_ch_enable_mask(struct device *dev, unsigned int ch)
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
+		dev_warn(dev, "invalid channel num, default use 2ch\n");
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
+static const char *const hdmi_conn_mux_map[] = {
+	"CH0", "CH1", "CH2", "CH3", "CH4", "CH5", "CH6", "CH7",
+};
+
+static int hdmi_conn_mux_map_value[] = {
+	HDMI_CONN_CH0, HDMI_CONN_CH1, HDMI_CONN_CH2, HDMI_CONN_CH3,
+	HDMI_CONN_CH4, HDMI_CONN_CH5, HDMI_CONN_CH6, HDMI_CONN_CH7,
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(hdmi_ch0_mux_map_enum,
+				  AFE_HDMI_CONN0, HDMI_O_0_SFT, HDMI_O_0_MASK,
+				  hdmi_conn_mux_map, hdmi_conn_mux_map_value);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(hdmi_ch1_mux_map_enum,
+				  AFE_HDMI_CONN0,
+				  HDMI_O_1_SFT,
+				  HDMI_O_1_MASK,
+				  hdmi_conn_mux_map,
+				  hdmi_conn_mux_map_value);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(hdmi_ch2_mux_map_enum,
+				  AFE_HDMI_CONN0,
+				  HDMI_O_2_SFT,
+				  HDMI_O_2_MASK,
+				  hdmi_conn_mux_map,
+				  hdmi_conn_mux_map_value);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(hdmi_ch3_mux_map_enum,
+				  AFE_HDMI_CONN0,
+				  HDMI_O_3_SFT,
+				  HDMI_O_3_MASK,
+				  hdmi_conn_mux_map,
+				  hdmi_conn_mux_map_value);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(hdmi_ch4_mux_map_enum,
+				  AFE_HDMI_CONN0,
+				  HDMI_O_4_SFT,
+				  HDMI_O_4_MASK,
+				  hdmi_conn_mux_map,
+				  hdmi_conn_mux_map_value);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(hdmi_ch5_mux_map_enum,
+				  AFE_HDMI_CONN0,
+				  HDMI_O_5_SFT,
+				  HDMI_O_5_MASK,
+				  hdmi_conn_mux_map,
+				  hdmi_conn_mux_map_value);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(hdmi_ch6_mux_map_enum,
+				  AFE_HDMI_CONN0,
+				  HDMI_O_6_SFT,
+				  HDMI_O_6_MASK,
+				  hdmi_conn_mux_map,
+				  hdmi_conn_mux_map_value);
+
+static SOC_VALUE_ENUM_SINGLE_DECL(hdmi_ch7_mux_map_enum,
+				  AFE_HDMI_CONN0,
+				  HDMI_O_7_SFT,
+				  HDMI_O_7_MASK,
+				  hdmi_conn_mux_map,
+				  hdmi_conn_mux_map_value);
+
+static const struct snd_kcontrol_new mtk_dai_tdm_controls[] = {
+	SOC_ENUM("HDMI_CH0_MUX", hdmi_ch0_mux_map_enum),
+	SOC_ENUM("HDMI_CH1_MUX", hdmi_ch1_mux_map_enum),
+	SOC_ENUM("HDMI_CH2_MUX", hdmi_ch2_mux_map_enum),
+	SOC_ENUM("HDMI_CH3_MUX", hdmi_ch3_mux_map_enum),
+	SOC_ENUM("HDMI_CH4_MUX", hdmi_ch4_mux_map_enum),
+	SOC_ENUM("HDMI_CH5_MUX", hdmi_ch5_mux_map_enum),
+	SOC_ENUM("HDMI_CH6_MUX", hdmi_ch6_mux_map_enum),
+	SOC_ENUM("HDMI_CH7_MUX", hdmi_ch7_mux_map_enum),
+};
+
+static const char *const tdm_out_demux_texts[] = {
+	"NONE", "TDMOUT", "DPTXOUT",
+};
+
+static SOC_ENUM_SINGLE_DECL(tdm_out_demux_enum,
+					      SND_SOC_NOPM,
+					      0,
+					      tdm_out_demux_texts);
+static const struct snd_kcontrol_new tdm_out_demux_control =
+	SOC_DAPM_ENUM("TDM DEMUX ROUTE", tdm_out_demux_enum);
+
+enum {
+	SUPPLY_SEQ_APLL,
+	SUPPLY_SEQ_TDM_MCK_EN,
+	SUPPLY_SEQ_TDM_BCK_EN,
+	SUPPLY_SEQ_TDM_DPTX_MCK_EN,
+	SUPPLY_SEQ_TDM_DPTX_BCK_EN,
+	SUPPLY_SEQ_TDM_CG_EN,
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
+	SND_SOC_DAPM_DEMUX("TDM_DEMUX", SND_SOC_NOPM, 0, 0,
+			   &tdm_out_demux_control),
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
+	/* cg */
+	SND_SOC_DAPM_SUPPLY_S("TDM_CG", SUPPLY_SEQ_TDM_CG_EN,
+			      AUDIO_TOP_CON2, PDN_TDM_OUT_SFT, 1,
+			      NULL, 0),
+};
+
+static int mtk_afe_tdm_apll_connect(struct snd_soc_dapm_widget *source,
+				    struct snd_soc_dapm_widget *sink)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(sink->dapm);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	int dai_id = get_tdm_id_by_name(sink->name);
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
+	{"TDM_DEMUX", NULL, "HDMI"},
+
+	{"TDM", "TDMOUT", "TDM_DEMUX"},
+	{"TDM", NULL, "TDM_BCK"},
+	{"TDM", NULL, "TDM_CG"},
+
+	{"TDM_DPTX", "DPTXOUT", "TDM_DEMUX"},
+	{"TDM_DPTX", NULL, "TDM_DPTX_BCK"},
+	{"TDM_DPTX", NULL, "TDM_CG"},
+
+	{"TDM_BCK", NULL, "TDM_MCK"},
+	{"TDM_DPTX_BCK", NULL, "TDM_DPTX_MCK"},
+	{"TDM_MCK", NULL, APLL1_W_NAME, mtk_afe_tdm_apll_connect},
+	{"TDM_MCK", NULL, APLL2_W_NAME, mtk_afe_tdm_apll_connect},
+	{"TDM_DPTX_MCK", NULL, APLL1_W_NAME, mtk_afe_tdm_apll_connect},
+	{"TDM_DPTX_MCK", NULL, APLL2_W_NAME, mtk_afe_tdm_apll_connect},
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
+	if (!tdm_priv)
+		return -EINVAL;
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
+	dev_dbg(afe->dev, "id %d, rate %d, ch %d, fmt %d, mclk %d, bck %d\n",
+		tdm_id, rate, channels, format, tdm_priv->mclk_rate, tdm_priv->bck_rate);
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
+				   get_dptx_ch_enable_mask(afe->dev, channels) <<
+				   DPTX_CHANNEL_ENABLE_SFT);
+		regmap_update_bits(afe->regmap, AFE_DPTX_CON,
+				   DPTX_CHANNEL_NUMBER_MASK_SFT,
+				   get_dptx_ch(channels) <<
+				   DPTX_CHANNEL_NUMBER_SFT);
+		regmap_update_bits(afe->regmap, AFE_DPTX_CON,
+				   DPTX_16BIT_MASK_SFT,
+				   get_dptx_wlen(format) << DPTX_16BIT_SFT);
+	}
+	switch (channels) {
+	case 1:
+	case 2:
+		tdm_con = TDM_CH_START_O30_O31 << ST_CH_PAIR_SOUT0_SFT;
+		tdm_con |= TDM_CH_ZERO << ST_CH_PAIR_SOUT1_SFT;
+		tdm_con |= TDM_CH_ZERO << ST_CH_PAIR_SOUT2_SFT;
+		tdm_con |= TDM_CH_ZERO << ST_CH_PAIR_SOUT3_SFT;
+		break;
+	case 3:
+	case 4:
+		tdm_con = TDM_CH_START_O30_O31 << ST_CH_PAIR_SOUT0_SFT;
+		tdm_con |= TDM_CH_START_O32_O33 << ST_CH_PAIR_SOUT1_SFT;
+		tdm_con |= TDM_CH_ZERO << ST_CH_PAIR_SOUT2_SFT;
+		tdm_con |= TDM_CH_ZERO << ST_CH_PAIR_SOUT3_SFT;
+		break;
+	case 5:
+	case 6:
+		tdm_con = TDM_CH_START_O30_O31 << ST_CH_PAIR_SOUT0_SFT;
+		tdm_con |= TDM_CH_START_O32_O33 << ST_CH_PAIR_SOUT1_SFT;
+		tdm_con |= TDM_CH_START_O34_O35 << ST_CH_PAIR_SOUT2_SFT;
+		tdm_con |= TDM_CH_ZERO << ST_CH_PAIR_SOUT3_SFT;
+		break;
+	case 7:
+	case 8:
+		tdm_con = TDM_CH_START_O30_O31 << ST_CH_PAIR_SOUT0_SFT;
+		tdm_con |= TDM_CH_START_O32_O33 << ST_CH_PAIR_SOUT1_SFT;
+		tdm_con |= TDM_CH_START_O34_O35 << ST_CH_PAIR_SOUT2_SFT;
+		tdm_con |= TDM_CH_START_O36_O37 << ST_CH_PAIR_SOUT3_SFT;
+		break;
+	default:
+		tdm_con = 0;
+	}
+
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
+	dai->dai_drivers = mtk_dai_tdm_driver;
+	dai->num_dai_drivers = ARRAY_SIZE(mtk_dai_tdm_driver);
+	dai->controls = mtk_dai_tdm_controls;
+	dai->num_controls = ARRAY_SIZE(mtk_dai_tdm_controls);
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
+	list_add(&dai->list, &afe->sub_dais);
+
+	afe_priv->dai_priv[MT8196_DAI_TDM] = tdm_priv;
+	afe_priv->dai_priv[MT8196_DAI_TDM_DPTX] = tdm_dptx_priv;
+
+	return 0;
+}
+
-- 
2.45.2


