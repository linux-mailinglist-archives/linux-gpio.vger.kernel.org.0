Return-Path: <linux-gpio+bounces-22930-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 77049AFC965
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 13:20:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E59B7A76C1
	for <lists+linux-gpio@lfdr.de>; Tue,  8 Jul 2025 11:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1741F2DA771;
	Tue,  8 Jul 2025 11:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="G+qoKcVn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000A02DA740;
	Tue,  8 Jul 2025 11:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751973524; cv=none; b=O4roBiT7st8jp89V97Ni4gdc/kxDXEf7SDL02oPAdt04ueL1GCGVA9qdv//F9tELsYUjQKr/oaufmhVnpsmQF/BjaU1QTpYfm7Acjqef4HWMJZaMvg9wlmTTPSgaXRhsuSjOapx8SgaDVMZDhX6aizrWYp0JsqDGlN2m7N6pazc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751973524; c=relaxed/simple;
	bh=qpNHOxoUqVkTIuVqkHCSxhw9DObpeT90RwOCdH7eYi0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nIf56p70UreKkqugh5IEGxSYkJ+3y76QUZn7KCNVoyHtU+G6783jUTZV4gLyIJLwImDaDmnAuHx3wVJg7pUvMN6m+fypJPOaRO2hFjnAO6gtQ3emkD3q2lnQNmQhC7QSTbcJsd62lTr4PiXnDJ+cHYAjZgYyl/ItXWXvNjGLrSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=G+qoKcVn; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: 44289d425bed11f0b1510d84776b8c0b-20250708
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=rEDkRe4u1AezLkr6K7mB+BKTZ6/UCX4g3PGbbgBu0mo=;
	b=G+qoKcVnYSI3zAyK51RZJJnD7xh3cams8NjFahAuzSKkbdEVz3H3tIa6XbpgrEza8uX3Z0PgZFiLc2HOpIHmSvg0J75iAKRV013q5TMbvf3zGA+buuSXDxbt7DOC9NomMQdHwocYAzsaZU6lm7DlZsHFi7k2eIiOPgiQReYesSc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.2,REQID:fb44beab-e7fa-42a4-ad80-1fcfdc63597c,IP:0,UR
	L:0,TC:0,Content:26,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:26
X-CID-META: VersionHash:9eb4ff7,CLOUDID:50e6a449-3902-4ad6-a511-6378a8132fbf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:4|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:1,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,OSH|NGT
X-CID-BAS: 2,OSH|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 44289d425bed11f0b1510d84776b8c0b-20250708
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 872683260; Tue, 08 Jul 2025 19:18:25 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Tue, 8 Jul 2025 19:18:23 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Tue, 8 Jul 2025 19:18:22 +0800
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
Subject: [PATCH v6 05/10] ASoC: mediatek: mt8196: support I2S in platform driver
Date: Tue, 8 Jul 2025 19:15:57 +0800
Message-ID: <20250708111806.3992-6-darren.ye@mediatek.com>
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

Add mt8196 I2S DAI driver support.

Signed-off-by: Darren Ye <darren.ye@mediatek.com>
---
 sound/soc/mediatek/mt8196/mt8196-dai-i2s.c | 3944 ++++++++++++++++++++
 1 file changed, 3944 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-dai-i2s.c

diff --git a/sound/soc/mediatek/mt8196/mt8196-dai-i2s.c b/sound/soc/mediatek/mt8196/mt8196-dai-i2s.c
new file mode 100644
index 000000000000..59f66ab8fa9f
--- /dev/null
+++ b/sound/soc/mediatek/mt8196/mt8196-dai-i2s.c
@@ -0,0 +1,3944 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  MediaTek ALSA SoC Audio DAI I2S Control
+ *
+ *  Copyright (c) 2024 MediaTek Inc.
+ *  Author: Darren Ye <darren.ye@mediatek.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/regmap.h>
+#include <sound/pcm_params.h>
+#include "mt8196-afe-clk.h"
+#include "mt8196-afe-common.h"
+#include "mt8196-interconnection.h"
+#include "mtk-afe-fe-dai.h"
+
+#define ETDM_22M_CLOCK_THRES 11289600
+
+enum {
+	ETDM_CLK_SOURCE_H26M,
+	ETDM_CLK_SOURCE_APLL,
+	ETDM_CLK_SOURCE_SPDIF,
+	ETDM_CLK_SOURCE_HDMI,
+	ETDM_CLK_SOURCE_EARC,
+	ETDM_CLK_SOURCE_LINEIN,
+};
+
+enum {
+	ETDM_RELATCH_SEL_H26M,
+	ETDM_RELATCH_SEL_APLL,
+};
+
+enum {
+	ETDM_RATE_8K,
+	ETDM_RATE_12K,
+	ETDM_RATE_16K,
+	ETDM_RATE_24K,
+	ETDM_RATE_32K,
+	ETDM_RATE_48K,
+	ETDM_RATE_64K,
+	ETDM_RATE_96K,
+	ETDM_RATE_128K,
+	ETDM_RATE_192K,
+	ETDM_RATE_256K,
+	ETDM_RATE_384K,
+	ETDM_RATE_11025 = 16,
+	ETDM_RATE_22050,
+	ETDM_RATE_44100,
+	ETDM_RATE_88200,
+	ETDM_RATE_176400,
+	ETDM_RATE_352800,
+};
+
+enum {
+	ETDM_CONN_8K,
+	ETDM_CONN_11K,
+	ETDM_CONN_12K,
+	ETDM_CONN_16K = 4,
+	ETDM_CONN_22K,
+	ETDM_CONN_24K,
+	ETDM_CONN_32K = 8,
+	ETDM_CONN_44K,
+	ETDM_CONN_48K,
+	ETDM_CONN_88K = 13,
+	ETDM_CONN_96K,
+	ETDM_CONN_176K = 17,
+	ETDM_CONN_192K,
+	ETDM_CONN_352K = 21,
+	ETDM_CONN_384K,
+};
+
+enum {
+	ETDM_WLEN_8_BIT = 0x7,
+	ETDM_WLEN_16_BIT = 0xf,
+	ETDM_WLEN_32_BIT = 0x1f,
+};
+
+enum {
+	ETDM_SLAVE_SEL_ETDMIN0_MASTER,
+	ETDM_SLAVE_SEL_ETDMIN0_SLAVE,
+	ETDM_SLAVE_SEL_ETDMIN1_MASTER,
+	ETDM_SLAVE_SEL_ETDMIN1_SLAVE,
+	ETDM_SLAVE_SEL_ETDMIN2_MASTER,
+	ETDM_SLAVE_SEL_ETDMIN2_SLAVE,
+	ETDM_SLAVE_SEL_ETDMIN3_MASTER,
+	ETDM_SLAVE_SEL_ETDMIN3_SLAVE,
+	ETDM_SLAVE_SEL_ETDMOUT0_MASTER,
+	ETDM_SLAVE_SEL_ETDMOUT0_SLAVE,
+	ETDM_SLAVE_SEL_ETDMOUT1_MASTER,
+	ETDM_SLAVE_SEL_ETDMOUT1_SLAVE,
+	ETDM_SLAVE_SEL_ETDMOUT2_MASTER,
+	ETDM_SLAVE_SEL_ETDMOUT2_SLAVE,
+	ETDM_SLAVE_SEL_ETDMOUT3_MASTER,
+	ETDM_SLAVE_SEL_ETDMOUT3_SLAVE,
+};
+
+enum {
+	ETDM_SLAVE_SEL_ETDMIN4_MASTER,
+	ETDM_SLAVE_SEL_ETDMIN4_SLAVE,
+	ETDM_SLAVE_SEL_ETDMIN5_MASTER,
+	ETDM_SLAVE_SEL_ETDMIN5_SLAVE,
+	ETDM_SLAVE_SEL_ETDMIN6_MASTER,
+	ETDM_SLAVE_SEL_ETDMIN6_SLAVE,
+	ETDM_SLAVE_SEL_ETDMIN7_MASTER,
+	ETDM_SLAVE_SEL_ETDMIN7_SLAVE,
+	ETDM_SLAVE_SEL_ETDMOUT4_MASTER,
+	ETDM_SLAVE_SEL_ETDMOUT4_SLAVE,
+	ETDM_SLAVE_SEL_ETDMOUT5_MASTER,
+	ETDM_SLAVE_SEL_ETDMOUT5_SLAVE,
+	ETDM_SLAVE_SEL_ETDMOUT6_MASTER,
+	ETDM_SLAVE_SEL_ETDMOUT6_SLAVE,
+	ETDM_SLAVE_SEL_ETDMOUT7_MASTER,
+	ETDM_SLAVE_SEL_ETDMOUT7_SLAVE,
+};
+
+enum {
+	MTK_DAI_ETDM_FORMAT_I2S,
+	MTK_DAI_ETDM_FORMAT_LJ,
+	MTK_DAI_ETDM_FORMAT_RJ,
+	MTK_DAI_ETDM_FORMAT_EIAJ,
+	MTK_DAI_ETDM_FORMAT_DSPA,
+	MTK_DAI_ETDM_FORMAT_DSPB,
+};
+
+static unsigned int get_etdm_wlen(snd_pcm_format_t format)
+{
+	return snd_pcm_format_physical_width(format) < 16 ?
+		ETDM_WLEN_16_BIT : ETDM_WLEN_32_BIT;
+}
+
+static unsigned int get_etdm_lrck_width(snd_pcm_format_t format)
+{
+	/* The valid data bit number should be large than 7 due to hardware limitation. */
+	return snd_pcm_format_physical_width(format) - 1;
+}
+
+static unsigned int get_etdm_rate(unsigned int rate)
+{
+	switch (rate) {
+	case 8000:
+		return ETDM_RATE_8K;
+	case 12000:
+		return ETDM_RATE_12K;
+	case 16000:
+		return ETDM_RATE_16K;
+	case 24000:
+		return ETDM_RATE_24K;
+	case 32000:
+		return ETDM_RATE_32K;
+	case 48000:
+		return ETDM_RATE_48K;
+	case 64000:
+		return ETDM_RATE_64K;
+	case 96000:
+		return ETDM_RATE_96K;
+	case 128000:
+		return ETDM_RATE_128K;
+	case 192000:
+		return ETDM_RATE_192K;
+	case 256000:
+		return ETDM_RATE_256K;
+	case 384000:
+		return ETDM_RATE_384K;
+	case 11025:
+		return ETDM_RATE_11025;
+	case 22050:
+		return ETDM_RATE_22050;
+	case 44100:
+		return ETDM_RATE_44100;
+	case 88200:
+		return ETDM_RATE_88200;
+	case 176400:
+		return ETDM_RATE_176400;
+	case 352800:
+		return ETDM_RATE_352800;
+	default:
+		return 0;
+	}
+}
+
+static unsigned int get_etdm_inconn_rate(unsigned int rate)
+{
+	switch (rate) {
+	case 8000:
+		return ETDM_CONN_8K;
+	case 12000:
+		return ETDM_CONN_12K;
+	case 16000:
+		return ETDM_CONN_16K;
+	case 24000:
+		return ETDM_CONN_24K;
+	case 32000:
+		return ETDM_CONN_32K;
+	case 48000:
+		return ETDM_CONN_48K;
+	case 96000:
+		return ETDM_CONN_96K;
+	case 192000:
+		return ETDM_CONN_192K;
+	case 384000:
+		return ETDM_CONN_384K;
+	case 11025:
+		return ETDM_CONN_11K;
+	case 22050:
+		return ETDM_CONN_22K;
+	case 44100:
+		return ETDM_CONN_44K;
+	case 88200:
+		return ETDM_CONN_88K;
+	case 176400:
+		return ETDM_CONN_176K;
+	case 352800:
+		return ETDM_CONN_352K;
+	default:
+		return 0;
+	}
+}
+
+struct mtk_afe_i2s_priv {
+	u8 id;
+	u32 rate; /* for determine which apll to use */
+	int low_jitter_en;
+	const char *share_property_name;
+	int share_i2s_id;
+	u32 mclk_rate;
+	u8 mclk_id;
+	u8 mclk_apll;
+	u8 ch_num;
+	u8 sync;
+	u8 ip_mode;
+	u8 format;
+};
+
+/* this enum is merely for mtk_afe_i2s_priv & mtk_base_etdm_data declare */
+enum {
+	DAI_I2SIN0,
+	DAI_I2SIN1,
+	DAI_I2SIN2,
+	DAI_I2SIN3,
+	DAI_I2SIN4,
+	DAI_I2SIN6,
+	DAI_I2SOUT0,
+	DAI_I2SOUT1,
+	DAI_I2SOUT2,
+	DAI_I2SOUT3,
+	DAI_I2SOUT4,
+	DAI_I2SOUT6,
+	DAI_FMI2S_MASTER,
+	DAI_I2S_NUM,
+};
+
+static bool is_etdm_in_pad_top(unsigned int dai_num)
+{
+	switch (dai_num) {
+	case DAI_I2SOUT4:
+	case DAI_I2SIN4:
+		return true;
+	default:
+		return false;
+	}
+}
+
+struct mtk_base_etdm_data {
+	u16 enable_reg;
+	u16 enable_mask;
+	u8 enable_shift;
+	u16 sync_reg;
+	u16 sync_mask;
+	u8 sync_shift;
+	u16 ch_reg;
+	u16 ch_mask;
+	u8 ch_shift;
+	u16 ip_mode_reg;
+	u16 ip_mode_mask;
+	u8 ip_mode_shift;
+	u16 init_count_reg;
+	u16 init_count_mask;
+	u8 init_count_shift;
+	u16 init_point_reg;
+	u16 init_point_mask;
+	u8 init_point_shift;
+	u16 lrck_reset_reg;
+	u16 lrck_reset_mask;
+	u8 lrck_reset_shift;
+	u16 clk_source_reg;
+	u16 clk_source_mask;
+	u8 clk_source_shift;
+	u16 ck_en_sel_reg;
+	u16 ck_en_sel_mask;
+	u8 ck_en_sel_shift;
+	u16 fs_timing_reg;
+	u16 fs_timing_mask;
+	u8 fs_timing_shift;
+	u16 relatch_en_sel_reg;
+	u16 relatch_en_sel_mask;
+	u8 relatch_en_sel_shift;
+	u16 use_afifo_reg;
+	u16 use_afifo_mask;
+	u8 use_afifo_shift;
+	u16 afifo_mode_reg;
+	u16 afifo_mode_mask;
+	u8 afifo_mode_shift;
+	u16 almost_end_ch_reg;
+	u16 almost_end_ch_mask;
+	u8 almost_end_ch_shift;
+	u16 almost_end_bit_reg;
+	u16 almost_end_bit_mask;
+	u8 almost_end_bit_shift;
+	u16 out2latch_time_reg;
+	u16 out2latch_time_mask;
+	u8 out2latch_time_shift;
+	u16 tdm_mode_reg;
+	u16 tdm_mode_mask;
+	u8 tdm_mode_shift;
+	u16 relatch_domain_sel_reg;
+	u16 relatch_domain_sel_mask;
+	u8 relatch_domain_sel_shift;
+	u16 bit_length_reg;
+	u16 bit_length_mask;
+	u8 bit_length_shift;
+	u16 word_length_reg;
+	u16 word_length_mask;
+	u8 word_length_shift;
+	u16 cowork_reg;
+	u16 cowork_mask;
+	u8 cowork_shift;
+	u32 cowork_val;
+	u16 in2latch_time_reg;
+	u16 in2latch_time_mask;
+	u8 in2latch_time_shift;
+	u16 pad_top_ck_en_reg;
+	u16 pad_top_ck_en_mask;
+	u8 pad_top_ck_en_shift;
+	u16 master_latch_reg;
+	u16 master_latch_mask;
+	u8 master_latch_shift;
+};
+
+static const struct mtk_base_etdm_data mtk_etdm_data[DAI_I2S_NUM] = {
+	[DAI_I2SIN0] = {
+		.enable_reg = ETDM_IN0_CON0,
+		.enable_mask = REG_ETDM_IN_EN_MASK,
+		.enable_shift = REG_ETDM_IN_EN_SFT,
+		.sync_reg = ETDM_IN0_CON0,
+		.sync_mask = REG_SYNC_MODE_MASK,
+		.sync_shift = REG_SYNC_MODE_SFT,
+		.ch_reg = ETDM_IN0_CON0,
+		.ch_mask = REG_CH_NUM_MASK,
+		.ch_shift = REG_CH_NUM_SFT,
+		.ip_mode_reg = ETDM_IN0_CON2,
+		.ip_mode_mask = REG_MULTI_IP_MODE_MASK,
+		.ip_mode_shift = REG_MULTI_IP_MODE_SFT,
+		.init_count_reg = ETDM_IN0_CON1,
+		.init_count_mask = REG_INITIAL_COUNT_MASK,
+		.init_count_shift = REG_INITIAL_COUNT_SFT,
+		.init_point_reg = ETDM_IN0_CON1,
+		.init_point_mask = REG_INITIAL_POINT_MASK,
+		.init_point_shift = REG_INITIAL_POINT_SFT,
+		.lrck_reset_reg = ETDM_IN0_CON1,
+		.lrck_reset_mask = REG_LRCK_RESET_MASK,
+		.lrck_reset_shift = REG_LRCK_RESET_SFT,
+		.clk_source_reg = ETDM_IN0_CON2,
+		.clk_source_mask = REG_CLOCK_SOURCE_SEL_MASK,
+		.clk_source_shift = REG_CLOCK_SOURCE_SEL_SFT,
+		.ck_en_sel_reg = ETDM_IN0_CON2,
+		.ck_en_sel_mask = REG_CK_EN_SEL_AUTO_MASK,
+		.ck_en_sel_shift = REG_CK_EN_SEL_AUTO_SFT,
+		.fs_timing_reg = ETDM_IN0_CON3,
+		.fs_timing_mask = REG_FS_TIMING_SEL_MASK,
+		.fs_timing_shift = REG_FS_TIMING_SEL_SFT,
+		.relatch_en_sel_reg = ETDM_IN0_CON4,
+		.relatch_en_sel_mask = REG_RELATCH_1X_EN_SEL_MASK,
+		.relatch_en_sel_shift = REG_RELATCH_1X_EN_SEL_SFT,
+		.use_afifo_reg = ETDM_IN0_CON8,
+		.use_afifo_mask = REG_ETDM_USE_AFIFO_MASK,
+		.use_afifo_shift = REG_ETDM_USE_AFIFO_SFT,
+		.afifo_mode_reg = ETDM_IN0_CON8,
+		.afifo_mode_mask = REG_AFIFO_MODE_MASK,
+		.afifo_mode_shift = REG_AFIFO_MODE_SFT,
+		.almost_end_ch_reg = ETDM_IN0_CON9,
+		.almost_end_ch_mask = REG_ALMOST_END_CH_COUNT_MASK,
+		.almost_end_ch_shift = REG_ALMOST_END_CH_COUNT_SFT,
+		.almost_end_bit_reg = ETDM_IN0_CON9,
+		.almost_end_bit_mask = REG_ALMOST_END_BIT_COUNT_MASK,
+		.almost_end_bit_shift = REG_ALMOST_END_BIT_COUNT_SFT,
+		.out2latch_time_reg = ETDM_IN0_CON9,
+		.out2latch_time_mask = REG_OUT2LATCH_TIME_MASK,
+		.out2latch_time_shift = REG_OUT2LATCH_TIME_SFT,
+		.tdm_mode_reg = ETDM_IN0_CON0,
+		.tdm_mode_mask = REG_FMT_MASK,
+		.tdm_mode_shift = REG_FMT_SFT,
+		.relatch_domain_sel_reg = ETDM_IN0_CON0,
+		.relatch_domain_sel_mask = REG_RELATCH_1X_EN_DOMAIN_SEL_MASK,
+		.relatch_domain_sel_shift = REG_RELATCH_1X_EN_DOMAIN_SEL_SFT,
+		.bit_length_reg = ETDM_IN0_CON0,
+		.bit_length_mask = REG_BIT_LENGTH_MASK,
+		.bit_length_shift = REG_BIT_LENGTH_SFT,
+		.word_length_reg = ETDM_IN0_CON0,
+		.word_length_mask = REG_WORD_LENGTH_MASK,
+		.word_length_shift = REG_WORD_LENGTH_SFT,
+		.cowork_reg = ETDM_0_3_COWORK_CON0,
+		.cowork_mask = ETDM_IN0_SLAVE_SEL_MASK,
+		.cowork_shift = ETDM_IN0_SLAVE_SEL_SFT,
+		.cowork_val = ETDM_SLAVE_SEL_ETDMOUT0_MASTER,
+		.pad_top_ck_en_reg = 0,
+		.master_latch_reg = 0,
+	},
+	[DAI_I2SIN1] = {
+		.enable_reg = ETDM_IN1_CON0,
+		.enable_mask = REG_ETDM_IN_EN_MASK,
+		.enable_shift = REG_ETDM_IN_EN_SFT,
+		.sync_reg = ETDM_IN1_CON0,
+		.sync_mask = REG_SYNC_MODE_MASK,
+		.sync_shift = REG_SYNC_MODE_SFT,
+		.ch_reg = ETDM_IN1_CON0,
+		.ch_mask = REG_CH_NUM_MASK,
+		.ch_shift = REG_CH_NUM_SFT,
+		.ip_mode_reg = ETDM_IN1_CON2,
+		.ip_mode_mask = REG_MULTI_IP_MODE_MASK,
+		.ip_mode_shift = REG_MULTI_IP_MODE_SFT,
+		.init_count_reg = ETDM_IN1_CON1,
+		.init_count_mask = REG_INITIAL_COUNT_MASK,
+		.init_count_shift = REG_INITIAL_COUNT_SFT,
+		.init_point_reg = ETDM_IN1_CON1,
+		.init_point_mask = REG_INITIAL_POINT_MASK,
+		.init_point_shift = REG_INITIAL_POINT_SFT,
+		.lrck_reset_reg = ETDM_IN1_CON1,
+		.lrck_reset_mask = REG_LRCK_RESET_MASK,
+		.lrck_reset_shift = REG_LRCK_RESET_SFT,
+		.clk_source_reg = ETDM_IN1_CON2,
+		.clk_source_mask = REG_CLOCK_SOURCE_SEL_MASK,
+		.clk_source_shift = REG_CLOCK_SOURCE_SEL_SFT,
+		.ck_en_sel_reg = ETDM_IN1_CON2,
+		.ck_en_sel_mask = REG_CK_EN_SEL_AUTO_MASK,
+		.ck_en_sel_shift = REG_CK_EN_SEL_AUTO_SFT,
+		.fs_timing_reg = ETDM_IN1_CON3,
+		.fs_timing_mask = REG_FS_TIMING_SEL_MASK,
+		.fs_timing_shift = REG_FS_TIMING_SEL_SFT,
+		.relatch_en_sel_reg = ETDM_IN1_CON4,
+		.relatch_en_sel_mask = REG_RELATCH_1X_EN_SEL_MASK,
+		.relatch_en_sel_shift = REG_RELATCH_1X_EN_SEL_SFT,
+		.use_afifo_reg = ETDM_IN1_CON8,
+		.use_afifo_mask = REG_ETDM_USE_AFIFO_MASK,
+		.use_afifo_shift = REG_ETDM_USE_AFIFO_SFT,
+		.afifo_mode_reg = ETDM_IN1_CON8,
+		.afifo_mode_mask = REG_AFIFO_MODE_MASK,
+		.afifo_mode_shift = REG_AFIFO_MODE_SFT,
+		.almost_end_ch_reg = ETDM_IN1_CON9,
+		.almost_end_ch_mask = REG_ALMOST_END_CH_COUNT_MASK,
+		.almost_end_ch_shift = REG_ALMOST_END_CH_COUNT_SFT,
+		.almost_end_bit_reg = ETDM_IN1_CON9,
+		.almost_end_bit_mask = REG_ALMOST_END_BIT_COUNT_MASK,
+		.almost_end_bit_shift = REG_ALMOST_END_BIT_COUNT_SFT,
+		.out2latch_time_reg = ETDM_IN1_CON9,
+		.out2latch_time_mask = REG_OUT2LATCH_TIME_MASK,
+		.out2latch_time_shift = REG_OUT2LATCH_TIME_SFT,
+		.tdm_mode_reg = ETDM_IN1_CON0,
+		.tdm_mode_mask = REG_FMT_MASK,
+		.tdm_mode_shift = REG_FMT_SFT,
+		.relatch_domain_sel_reg = ETDM_IN1_CON0,
+		.relatch_domain_sel_mask = REG_RELATCH_1X_EN_DOMAIN_SEL_MASK,
+		.relatch_domain_sel_shift = REG_RELATCH_1X_EN_DOMAIN_SEL_SFT,
+		.bit_length_reg = ETDM_IN1_CON0,
+		.bit_length_mask = REG_BIT_LENGTH_MASK,
+		.bit_length_shift = REG_BIT_LENGTH_SFT,
+		.word_length_reg = ETDM_IN1_CON0,
+		.word_length_mask = REG_WORD_LENGTH_MASK,
+		.word_length_shift = REG_WORD_LENGTH_SFT,
+		.cowork_reg = ETDM_0_3_COWORK_CON1,
+		.cowork_mask = ETDM_IN1_SLAVE_SEL_MASK,
+		.cowork_shift = ETDM_IN1_SLAVE_SEL_SFT,
+		.cowork_val = ETDM_SLAVE_SEL_ETDMOUT1_MASTER,
+		.pad_top_ck_en_reg = 0,
+		.master_latch_reg = 0,
+	},
+	[DAI_I2SIN2] = {
+		.enable_reg = ETDM_IN2_CON0,
+		.enable_mask = REG_ETDM_IN_EN_MASK,
+		.enable_shift = REG_ETDM_IN_EN_SFT,
+		.sync_reg = ETDM_IN2_CON0,
+		.sync_mask = REG_SYNC_MODE_MASK,
+		.sync_shift = REG_SYNC_MODE_SFT,
+		.ch_reg = ETDM_IN2_CON0,
+		.ch_mask = REG_CH_NUM_MASK,
+		.ch_shift = REG_CH_NUM_SFT,
+		.ip_mode_reg = ETDM_IN2_CON2,
+		.ip_mode_mask = REG_MULTI_IP_MODE_MASK,
+		.ip_mode_shift = REG_MULTI_IP_MODE_SFT,
+		.init_count_reg = ETDM_IN2_CON1,
+		.init_count_mask = REG_INITIAL_COUNT_MASK,
+		.init_count_shift = REG_INITIAL_COUNT_SFT,
+		.init_point_reg = ETDM_IN2_CON1,
+		.init_point_mask = REG_INITIAL_POINT_MASK,
+		.init_point_shift = REG_INITIAL_POINT_SFT,
+		.lrck_reset_reg = ETDM_IN2_CON1,
+		.lrck_reset_mask = REG_LRCK_RESET_MASK,
+		.lrck_reset_shift = REG_LRCK_RESET_SFT,
+		.clk_source_reg = ETDM_IN2_CON2,
+		.clk_source_mask = REG_CLOCK_SOURCE_SEL_MASK,
+		.clk_source_shift = REG_CLOCK_SOURCE_SEL_SFT,
+		.ck_en_sel_reg = ETDM_IN2_CON2,
+		.ck_en_sel_mask = REG_CK_EN_SEL_AUTO_MASK,
+		.ck_en_sel_shift = REG_CK_EN_SEL_AUTO_SFT,
+		.fs_timing_reg = ETDM_IN2_CON3,
+		.fs_timing_mask = REG_FS_TIMING_SEL_MASK,
+		.fs_timing_shift = REG_FS_TIMING_SEL_SFT,
+		.relatch_en_sel_reg = ETDM_IN2_CON4,
+		.relatch_en_sel_mask = REG_RELATCH_1X_EN_SEL_MASK,
+		.relatch_en_sel_shift = REG_RELATCH_1X_EN_SEL_SFT,
+		.use_afifo_reg = ETDM_IN2_CON8,
+		.use_afifo_mask = REG_ETDM_USE_AFIFO_MASK,
+		.use_afifo_shift = REG_ETDM_USE_AFIFO_SFT,
+		.afifo_mode_reg = ETDM_IN2_CON8,
+		.afifo_mode_mask = REG_AFIFO_MODE_MASK,
+		.afifo_mode_shift = REG_AFIFO_MODE_SFT,
+		.almost_end_ch_reg = ETDM_IN2_CON9,
+		.almost_end_ch_mask = REG_ALMOST_END_CH_COUNT_MASK,
+		.almost_end_ch_shift = REG_ALMOST_END_CH_COUNT_SFT,
+		.almost_end_bit_reg = ETDM_IN2_CON9,
+		.almost_end_bit_mask = REG_ALMOST_END_BIT_COUNT_MASK,
+		.almost_end_bit_shift = REG_ALMOST_END_BIT_COUNT_SFT,
+		.out2latch_time_reg = ETDM_IN2_CON9,
+		.out2latch_time_mask = REG_OUT2LATCH_TIME_MASK,
+		.out2latch_time_shift = REG_OUT2LATCH_TIME_SFT,
+		.tdm_mode_reg = ETDM_IN2_CON0,
+		.tdm_mode_mask = REG_FMT_MASK,
+		.tdm_mode_shift = REG_FMT_SFT,
+		.relatch_domain_sel_reg = ETDM_IN2_CON0,
+		.relatch_domain_sel_mask = REG_RELATCH_1X_EN_DOMAIN_SEL_MASK,
+		.relatch_domain_sel_shift = REG_RELATCH_1X_EN_DOMAIN_SEL_SFT,
+		.bit_length_reg = ETDM_IN2_CON0,
+		.bit_length_mask = REG_BIT_LENGTH_MASK,
+		.bit_length_shift = REG_BIT_LENGTH_SFT,
+		.word_length_reg = ETDM_IN2_CON0,
+		.word_length_mask = REG_WORD_LENGTH_MASK,
+		.word_length_shift = REG_WORD_LENGTH_SFT,
+		.cowork_reg = ETDM_0_3_COWORK_CON2,
+		.cowork_mask = ETDM_IN2_SLAVE_SEL_MASK,
+		.cowork_shift = ETDM_IN2_SLAVE_SEL_SFT,
+		.cowork_val = ETDM_SLAVE_SEL_ETDMOUT2_MASTER,
+		.pad_top_ck_en_reg = 0,
+		.master_latch_reg = 0,
+	},
+	[DAI_I2SIN3] = {
+		.enable_reg = ETDM_IN3_CON0,
+		.enable_mask = REG_ETDM_IN_EN_MASK,
+		.enable_shift = REG_ETDM_IN_EN_SFT,
+		.sync_reg = ETDM_IN3_CON0,
+		.sync_mask = REG_SYNC_MODE_MASK,
+		.sync_shift = REG_SYNC_MODE_SFT,
+		.ch_reg = ETDM_IN3_CON0,
+		.ch_mask = REG_CH_NUM_MASK,
+		.ch_shift = REG_CH_NUM_SFT,
+		.ip_mode_reg = ETDM_IN3_CON2,
+		.ip_mode_mask = REG_MULTI_IP_MODE_MASK,
+		.ip_mode_shift = REG_MULTI_IP_MODE_SFT,
+		.init_count_reg = ETDM_IN3_CON1,
+		.init_count_mask = REG_INITIAL_COUNT_MASK,
+		.init_count_shift = REG_INITIAL_COUNT_SFT,
+		.init_point_reg = ETDM_IN3_CON1,
+		.init_point_mask = REG_INITIAL_POINT_MASK,
+		.init_point_shift = REG_INITIAL_POINT_SFT,
+		.lrck_reset_reg = ETDM_IN3_CON1,
+		.lrck_reset_mask = REG_LRCK_RESET_MASK,
+		.lrck_reset_shift = REG_LRCK_RESET_SFT,
+		.clk_source_reg = ETDM_IN3_CON2,
+		.clk_source_mask = REG_CLOCK_SOURCE_SEL_MASK,
+		.clk_source_shift = REG_CLOCK_SOURCE_SEL_SFT,
+		.ck_en_sel_reg = ETDM_IN3_CON2,
+		.ck_en_sel_mask = REG_CK_EN_SEL_AUTO_MASK,
+		.ck_en_sel_shift = REG_CK_EN_SEL_AUTO_SFT,
+		.fs_timing_reg = ETDM_IN3_CON3,
+		.fs_timing_mask = REG_FS_TIMING_SEL_MASK,
+		.fs_timing_shift = REG_FS_TIMING_SEL_SFT,
+		.relatch_en_sel_reg = ETDM_IN3_CON4,
+		.relatch_en_sel_mask = REG_RELATCH_1X_EN_SEL_MASK,
+		.relatch_en_sel_shift = REG_RELATCH_1X_EN_SEL_SFT,
+		.use_afifo_reg = ETDM_IN3_CON8,
+		.use_afifo_mask = REG_ETDM_USE_AFIFO_MASK,
+		.use_afifo_shift = REG_ETDM_USE_AFIFO_SFT,
+		.afifo_mode_reg = ETDM_IN3_CON8,
+		.afifo_mode_mask = REG_AFIFO_MODE_MASK,
+		.afifo_mode_shift = REG_AFIFO_MODE_SFT,
+		.almost_end_ch_reg = ETDM_IN3_CON9,
+		.almost_end_ch_mask = REG_ALMOST_END_CH_COUNT_MASK,
+		.almost_end_ch_shift = REG_ALMOST_END_CH_COUNT_SFT,
+		.almost_end_bit_reg = ETDM_IN3_CON9,
+		.almost_end_bit_mask = REG_ALMOST_END_BIT_COUNT_MASK,
+		.almost_end_bit_shift = REG_ALMOST_END_BIT_COUNT_SFT,
+		.out2latch_time_reg = ETDM_IN3_CON9,
+		.out2latch_time_mask = REG_OUT2LATCH_TIME_MASK,
+		.out2latch_time_shift = REG_OUT2LATCH_TIME_SFT,
+		.tdm_mode_reg = ETDM_IN3_CON0,
+		.tdm_mode_mask = REG_FMT_MASK,
+		.tdm_mode_shift = REG_FMT_SFT,
+		.relatch_domain_sel_reg = ETDM_IN3_CON0,
+		.relatch_domain_sel_mask = REG_RELATCH_1X_EN_DOMAIN_SEL_MASK,
+		.relatch_domain_sel_shift = REG_RELATCH_1X_EN_DOMAIN_SEL_SFT,
+		.bit_length_reg = ETDM_IN3_CON0,
+		.bit_length_mask = REG_BIT_LENGTH_MASK,
+		.bit_length_shift = REG_BIT_LENGTH_SFT,
+		.word_length_reg = ETDM_IN3_CON0,
+		.word_length_mask = REG_WORD_LENGTH_MASK,
+		.word_length_shift = REG_WORD_LENGTH_SFT,
+		.cowork_reg = ETDM_0_3_COWORK_CON3,
+		.cowork_mask = ETDM_IN3_SLAVE_SEL_MASK,
+		.cowork_shift = ETDM_IN3_SLAVE_SEL_SFT,
+		.cowork_val = ETDM_SLAVE_SEL_ETDMOUT3_MASTER,
+		.pad_top_ck_en_reg = 0,
+		.master_latch_reg = 0,
+	},
+	[DAI_I2SIN4] = {
+		.enable_reg = ETDM_IN4_CON0,
+		.enable_mask = REG_ETDM_IN_EN_MASK,
+		.enable_shift = REG_ETDM_IN_EN_SFT,
+		.sync_reg = ETDM_IN4_CON0,
+		.sync_mask = REG_SYNC_MODE_MASK,
+		.sync_shift = REG_SYNC_MODE_SFT,
+		.ch_reg = ETDM_IN4_CON0,
+		.ch_mask = REG_CH_NUM_MASK,
+		.ch_shift = REG_CH_NUM_SFT,
+		.ip_mode_reg = ETDM_IN4_CON2,
+		.ip_mode_mask = REG_MULTI_IP_MODE_MASK,
+		.ip_mode_shift = REG_MULTI_IP_MODE_SFT,
+		.init_count_reg = ETDM_IN4_CON1,
+		.init_count_mask = REG_INITIAL_COUNT_MASK,
+		.init_count_shift = REG_INITIAL_COUNT_SFT,
+		.init_point_reg = ETDM_IN4_CON1,
+		.init_point_mask = REG_INITIAL_POINT_MASK,
+		.init_point_shift = REG_INITIAL_POINT_SFT,
+		.lrck_reset_reg = ETDM_IN4_CON1,
+		.lrck_reset_mask = REG_LRCK_RESET_MASK,
+		.lrck_reset_shift = REG_LRCK_RESET_SFT,
+		.clk_source_reg = ETDM_IN4_CON2,
+		.clk_source_mask = REG_CLOCK_SOURCE_SEL_MASK,
+		.clk_source_shift = REG_CLOCK_SOURCE_SEL_SFT,
+		.ck_en_sel_reg = ETDM_IN4_CON2,
+		.ck_en_sel_mask = REG_CK_EN_SEL_AUTO_MASK,
+		.ck_en_sel_shift = REG_CK_EN_SEL_AUTO_SFT,
+		.fs_timing_reg = ETDM_IN4_CON3,
+		.fs_timing_mask = REG_FS_TIMING_SEL_MASK,
+		.fs_timing_shift = REG_FS_TIMING_SEL_SFT,
+		.relatch_en_sel_reg = ETDM_IN4_CON4,
+		.relatch_en_sel_mask = REG_RELATCH_1X_EN_SEL_MASK,
+		.relatch_en_sel_shift = REG_RELATCH_1X_EN_SEL_SFT,
+		.use_afifo_reg = ETDM_IN4_CON8,
+		.use_afifo_mask = REG_ETDM_USE_AFIFO_MASK,
+		.use_afifo_shift = REG_ETDM_USE_AFIFO_SFT,
+		.afifo_mode_reg = ETDM_IN4_CON8,
+		.afifo_mode_mask = REG_AFIFO_MODE_MASK,
+		.afifo_mode_shift = REG_AFIFO_MODE_SFT,
+		.almost_end_ch_reg = ETDM_IN4_CON9,
+		.almost_end_ch_mask = REG_ALMOST_END_CH_COUNT_MASK,
+		.almost_end_ch_shift = REG_ALMOST_END_CH_COUNT_SFT,
+		.almost_end_bit_reg = ETDM_IN4_CON9,
+		.almost_end_bit_mask = REG_ALMOST_END_BIT_COUNT_MASK,
+		.almost_end_bit_shift = REG_ALMOST_END_BIT_COUNT_SFT,
+		.out2latch_time_reg = ETDM_IN4_CON9,
+		.out2latch_time_mask = REG_OUT2LATCH_TIME_MASK,
+		.out2latch_time_shift = REG_OUT2LATCH_TIME_SFT,
+		.tdm_mode_reg = ETDM_IN4_CON0,
+		.tdm_mode_mask = REG_FMT_MASK,
+		.tdm_mode_shift = REG_FMT_SFT,
+		.relatch_domain_sel_reg = ETDM_IN4_CON0,
+		.relatch_domain_sel_mask = REG_RELATCH_1X_EN_DOMAIN_SEL_MASK,
+		.relatch_domain_sel_shift = REG_RELATCH_1X_EN_DOMAIN_SEL_SFT,
+		.bit_length_reg = ETDM_IN4_CON0,
+		.bit_length_mask = REG_BIT_LENGTH_MASK,
+		.bit_length_shift = REG_BIT_LENGTH_SFT,
+		.word_length_reg = ETDM_IN4_CON0,
+		.word_length_mask = REG_WORD_LENGTH_MASK,
+		.word_length_shift = REG_WORD_LENGTH_SFT,
+		.cowork_reg = ETDM_4_7_COWORK_CON0,
+		.cowork_mask = ETDM_IN4_SLAVE_SEL_MASK,
+		.cowork_shift = ETDM_IN4_SLAVE_SEL_SFT,
+		.cowork_val = ETDM_SLAVE_SEL_ETDMOUT4_MASTER,
+		.pad_top_ck_en_reg = AUD_TOP_CFG_VLP_RG,
+		.pad_top_ck_en_mask = RG_I2S4_PAD_TOP_CK_EN_MASK,
+		.pad_top_ck_en_shift = RG_I2S4_PAD_TOP_CK_EN_SFT,
+		.master_latch_reg = AUD_TOP_CFG_VLP_RG,
+		.master_latch_mask = RG_I2S4_IN_BCK_NEG_EG_LATCH_MASK,
+		.master_latch_shift = RG_I2S4_IN_BCK_NEG_EG_LATCH_SFT,
+	},
+	[DAI_I2SIN6] = {
+		.enable_reg = ETDM_IN6_CON0,
+		.enable_mask = REG_ETDM_IN_EN_MASK,
+		.enable_shift = REG_ETDM_IN_EN_SFT,
+		.sync_reg = ETDM_IN6_CON0,
+		.sync_mask = REG_SYNC_MODE_MASK,
+		.sync_shift = REG_SYNC_MODE_SFT,
+		.ch_reg = ETDM_IN6_CON0,
+		.ch_mask = REG_CH_NUM_MASK,
+		.ch_shift = REG_CH_NUM_SFT,
+		.ip_mode_reg = ETDM_IN6_CON2,
+		.ip_mode_mask = REG_MULTI_IP_MODE_MASK,
+		.ip_mode_shift = REG_MULTI_IP_MODE_SFT,
+		.init_count_reg = ETDM_IN6_CON1,
+		.init_count_mask = REG_INITIAL_COUNT_MASK,
+		.init_count_shift = REG_INITIAL_COUNT_SFT,
+		.init_point_reg = ETDM_IN6_CON1,
+		.init_point_mask = REG_INITIAL_POINT_MASK,
+		.init_point_shift = REG_INITIAL_POINT_SFT,
+		.lrck_reset_reg = ETDM_IN6_CON1,
+		.lrck_reset_mask = REG_LRCK_RESET_MASK,
+		.lrck_reset_shift = REG_LRCK_RESET_SFT,
+		.clk_source_reg = ETDM_IN6_CON2,
+		.clk_source_mask = REG_CLOCK_SOURCE_SEL_MASK,
+		.clk_source_shift = REG_CLOCK_SOURCE_SEL_SFT,
+		.ck_en_sel_reg = ETDM_IN6_CON2,
+		.ck_en_sel_mask = REG_CK_EN_SEL_AUTO_MASK,
+		.ck_en_sel_shift = REG_CK_EN_SEL_AUTO_SFT,
+		.fs_timing_reg = ETDM_IN6_CON3,
+		.fs_timing_mask = REG_FS_TIMING_SEL_MASK,
+		.fs_timing_shift = REG_FS_TIMING_SEL_SFT,
+		.relatch_en_sel_reg = ETDM_IN6_CON4,
+		.relatch_en_sel_mask = REG_RELATCH_1X_EN_SEL_MASK,
+		.relatch_en_sel_shift = REG_RELATCH_1X_EN_SEL_SFT,
+		.use_afifo_reg = ETDM_IN6_CON8,
+		.use_afifo_mask = REG_ETDM_USE_AFIFO_MASK,
+		.use_afifo_shift = REG_ETDM_USE_AFIFO_SFT,
+		.afifo_mode_reg = ETDM_IN6_CON8,
+		.afifo_mode_mask = REG_AFIFO_MODE_MASK,
+		.afifo_mode_shift = REG_AFIFO_MODE_SFT,
+		.almost_end_ch_reg = ETDM_IN6_CON9,
+		.almost_end_ch_mask = REG_ALMOST_END_CH_COUNT_MASK,
+		.almost_end_ch_shift = REG_ALMOST_END_CH_COUNT_SFT,
+		.almost_end_bit_reg = ETDM_IN6_CON9,
+		.almost_end_bit_mask = REG_ALMOST_END_BIT_COUNT_MASK,
+		.almost_end_bit_shift = REG_ALMOST_END_BIT_COUNT_SFT,
+		.out2latch_time_reg = ETDM_IN6_CON9,
+		.out2latch_time_mask = REG_OUT2LATCH_TIME_MASK,
+		.out2latch_time_shift = REG_OUT2LATCH_TIME_SFT,
+		.tdm_mode_reg = ETDM_IN6_CON0,
+		.tdm_mode_mask = REG_FMT_MASK,
+		.tdm_mode_shift = REG_FMT_SFT,
+		.relatch_domain_sel_reg = ETDM_IN6_CON0,
+		.relatch_domain_sel_mask = REG_RELATCH_1X_EN_DOMAIN_SEL_MASK,
+		.relatch_domain_sel_shift = REG_RELATCH_1X_EN_DOMAIN_SEL_SFT,
+		.bit_length_reg = ETDM_IN6_CON0,
+		.bit_length_mask = REG_BIT_LENGTH_MASK,
+		.bit_length_shift = REG_BIT_LENGTH_SFT,
+		.word_length_reg = ETDM_IN6_CON0,
+		.word_length_mask = REG_WORD_LENGTH_MASK,
+		.word_length_shift = REG_WORD_LENGTH_SFT,
+		.cowork_reg = ETDM_4_7_COWORK_CON2,
+		.cowork_mask = ETDM_IN6_SLAVE_SEL_MASK,
+		.cowork_shift = ETDM_IN6_SLAVE_SEL_SFT,
+		.cowork_val = ETDM_SLAVE_SEL_ETDMOUT6_MASTER,
+		.pad_top_ck_en_reg = 0,
+		.master_latch_reg = 0,
+	},
+	[DAI_I2SOUT0] = {
+		.enable_reg = ETDM_OUT0_CON0,
+		.enable_mask = OUT_REG_ETDM_OUT_EN_MASK,
+		.enable_shift = OUT_REG_ETDM_OUT_EN_SFT,
+		.sync_reg = ETDM_OUT0_CON0,
+		.sync_mask = REG_SYNC_MODE_MASK,
+		.sync_shift = REG_SYNC_MODE_SFT,
+		.ch_reg = ETDM_OUT0_CON0,
+		.ch_mask = REG_CH_NUM_MASK,
+		.ch_shift = REG_CH_NUM_SFT,
+		.init_count_reg = ETDM_OUT0_CON1,
+		.init_count_mask = OUT_REG_INITIAL_COUNT_MASK,
+		.init_count_shift = OUT_REG_INITIAL_COUNT_SFT,
+		.init_point_reg = ETDM_OUT0_CON1,
+		.init_point_mask = OUT_REG_INITIAL_POINT_MASK,
+		.init_point_shift = OUT_REG_INITIAL_POINT_SFT,
+		.lrck_reset_reg = ETDM_OUT0_CON1,
+		.lrck_reset_mask = OUT_REG_LRCK_RESET_MASK,
+		.lrck_reset_shift = OUT_REG_LRCK_RESET_SFT,
+		.clk_source_reg = ETDM_OUT0_CON4,
+		.clk_source_mask = OUT_REG_CLOCK_SOURCE_SEL_MASK,
+		.clk_source_shift = OUT_REG_CLOCK_SOURCE_SEL_SFT,
+		.fs_timing_reg = ETDM_OUT0_CON4,
+		.fs_timing_mask = OUT_REG_FS_TIMING_SEL_MASK,
+		.fs_timing_shift = OUT_REG_FS_TIMING_SEL_SFT,
+		.relatch_en_sel_reg = ETDM_OUT0_CON4,
+		.relatch_en_sel_mask = OUT_REG_RELATCH_EN_SEL_MASK,
+		.relatch_en_sel_shift = OUT_REG_RELATCH_EN_SEL_SFT,
+		.tdm_mode_reg = ETDM_OUT0_CON0,
+		.tdm_mode_mask = OUT_REG_FMT_MASK,
+		.tdm_mode_shift = OUT_REG_FMT_SFT,
+		.relatch_domain_sel_reg = ETDM_OUT0_CON0,
+		.relatch_domain_sel_mask = OUT_REG_RELATCH_DOMAIN_SEL_MASK,
+		.relatch_domain_sel_shift = OUT_REG_RELATCH_DOMAIN_SEL_SFT,
+		.bit_length_reg = ETDM_OUT0_CON0,
+		.bit_length_mask = OUT_REG_BIT_LENGTH_MASK,
+		.bit_length_shift = OUT_REG_BIT_LENGTH_SFT,
+		.word_length_reg = ETDM_OUT0_CON0,
+		.word_length_mask = OUT_REG_WORD_LENGTH_MASK,
+		.word_length_shift = OUT_REG_WORD_LENGTH_SFT,
+		.cowork_reg = ETDM_0_3_COWORK_CON0,
+		.cowork_mask = ETDM_OUT0_SLAVE_SEL_MASK,
+		.cowork_shift = ETDM_OUT0_SLAVE_SEL_SFT,
+		.cowork_val = ETDM_SLAVE_SEL_ETDMIN0_MASTER,
+		.in2latch_time_reg = ETDM_OUT0_CON2,
+		.in2latch_time_mask = OUT_REG_IN2LATCH_TIME_MASK,
+		.in2latch_time_shift = OUT_REG_IN2LATCH_TIME_SFT,
+		.pad_top_ck_en_reg = 0,
+		.master_latch_reg = 0,
+	},
+	[DAI_I2SOUT1] = {
+		.enable_reg = ETDM_OUT1_CON0,
+		.enable_mask = OUT_REG_ETDM_OUT_EN_MASK,
+		.enable_shift = OUT_REG_ETDM_OUT_EN_SFT,
+		.sync_reg = ETDM_OUT1_CON0,
+		.sync_mask = REG_SYNC_MODE_MASK,
+		.sync_shift = REG_SYNC_MODE_SFT,
+		.ch_reg = ETDM_OUT1_CON0,
+		.ch_mask = REG_CH_NUM_MASK,
+		.ch_shift = REG_CH_NUM_SFT,
+		.init_count_reg = ETDM_OUT1_CON1,
+		.init_count_mask = OUT_REG_INITIAL_COUNT_MASK,
+		.init_count_shift = OUT_REG_INITIAL_COUNT_SFT,
+		.init_point_reg = ETDM_OUT1_CON1,
+		.init_point_mask = OUT_REG_INITIAL_POINT_MASK,
+		.init_point_shift = OUT_REG_INITIAL_POINT_SFT,
+		.lrck_reset_reg = ETDM_OUT1_CON1,
+		.lrck_reset_mask = OUT_REG_LRCK_RESET_MASK,
+		.lrck_reset_shift = OUT_REG_LRCK_RESET_SFT,
+		.clk_source_reg = ETDM_OUT1_CON4,
+		.clk_source_mask = OUT_REG_CLOCK_SOURCE_SEL_MASK,
+		.clk_source_shift = OUT_REG_CLOCK_SOURCE_SEL_SFT,
+		.fs_timing_reg = ETDM_OUT1_CON4,
+		.fs_timing_mask = OUT_REG_FS_TIMING_SEL_MASK,
+		.fs_timing_shift = OUT_REG_FS_TIMING_SEL_SFT,
+		.relatch_en_sel_reg = ETDM_OUT1_CON4,
+		.relatch_en_sel_mask = OUT_REG_RELATCH_EN_SEL_MASK,
+		.relatch_en_sel_shift = OUT_REG_RELATCH_EN_SEL_SFT,
+		.tdm_mode_reg = ETDM_OUT1_CON0,
+		.tdm_mode_mask = OUT_REG_FMT_MASK,
+		.tdm_mode_shift = OUT_REG_FMT_SFT,
+		.relatch_domain_sel_reg = ETDM_OUT1_CON0,
+		.relatch_domain_sel_mask = OUT_REG_RELATCH_DOMAIN_SEL_MASK,
+		.relatch_domain_sel_shift = OUT_REG_RELATCH_DOMAIN_SEL_SFT,
+		.bit_length_reg = ETDM_OUT1_CON0,
+		.bit_length_mask = OUT_REG_BIT_LENGTH_MASK,
+		.bit_length_shift = OUT_REG_BIT_LENGTH_SFT,
+		.word_length_reg = ETDM_OUT1_CON0,
+		.word_length_mask = OUT_REG_WORD_LENGTH_MASK,
+		.word_length_shift = OUT_REG_WORD_LENGTH_SFT,
+		.cowork_reg = ETDM_0_3_COWORK_CON0,
+		.cowork_mask = ETDM_OUT1_SLAVE_SEL_MASK,
+		.cowork_shift = ETDM_OUT1_SLAVE_SEL_SFT,
+		.cowork_val = ETDM_SLAVE_SEL_ETDMIN1_MASTER,
+		.in2latch_time_reg = ETDM_OUT1_CON2,
+		.in2latch_time_mask = OUT_REG_IN2LATCH_TIME_MASK,
+		.in2latch_time_shift = OUT_REG_IN2LATCH_TIME_SFT,
+		.pad_top_ck_en_reg = 0,
+		.master_latch_reg = 0,
+	},
+	[DAI_I2SOUT2] = {
+		.enable_reg = ETDM_OUT2_CON0,
+		.enable_mask = OUT_REG_ETDM_OUT_EN_MASK,
+		.enable_shift = OUT_REG_ETDM_OUT_EN_SFT,
+		.sync_reg = ETDM_OUT2_CON0,
+		.sync_mask = REG_SYNC_MODE_MASK,
+		.sync_shift = REG_SYNC_MODE_SFT,
+		.ch_reg = ETDM_OUT2_CON0,
+		.ch_mask = REG_CH_NUM_MASK,
+		.ch_shift = REG_CH_NUM_SFT,
+		.init_count_reg = ETDM_OUT2_CON1,
+		.init_count_mask = OUT_REG_INITIAL_COUNT_MASK,
+		.init_count_shift = OUT_REG_INITIAL_COUNT_SFT,
+		.init_point_reg = ETDM_OUT2_CON1,
+		.init_point_mask = OUT_REG_INITIAL_POINT_MASK,
+		.init_point_shift = OUT_REG_INITIAL_POINT_SFT,
+		.lrck_reset_reg = ETDM_OUT2_CON1,
+		.lrck_reset_mask = OUT_REG_LRCK_RESET_MASK,
+		.lrck_reset_shift = OUT_REG_LRCK_RESET_SFT,
+		.clk_source_reg = ETDM_OUT2_CON4,
+		.clk_source_mask = OUT_REG_CLOCK_SOURCE_SEL_MASK,
+		.clk_source_shift = OUT_REG_CLOCK_SOURCE_SEL_SFT,
+		.fs_timing_reg = ETDM_OUT2_CON4,
+		.fs_timing_mask = OUT_REG_FS_TIMING_SEL_MASK,
+		.fs_timing_shift = OUT_REG_FS_TIMING_SEL_SFT,
+		.relatch_en_sel_reg = ETDM_OUT2_CON4,
+		.relatch_en_sel_mask = OUT_REG_RELATCH_EN_SEL_MASK,
+		.relatch_en_sel_shift = OUT_REG_RELATCH_EN_SEL_SFT,
+		.tdm_mode_reg = ETDM_OUT2_CON0,
+		.tdm_mode_mask = OUT_REG_FMT_MASK,
+		.tdm_mode_shift = OUT_REG_FMT_SFT,
+		.relatch_domain_sel_reg = ETDM_OUT2_CON0,
+		.relatch_domain_sel_mask = OUT_REG_RELATCH_DOMAIN_SEL_MASK,
+		.relatch_domain_sel_shift = OUT_REG_RELATCH_DOMAIN_SEL_SFT,
+		.bit_length_reg = ETDM_OUT2_CON0,
+		.bit_length_mask = OUT_REG_BIT_LENGTH_MASK,
+		.bit_length_shift = OUT_REG_BIT_LENGTH_SFT,
+		.word_length_reg = ETDM_OUT2_CON0,
+		.word_length_mask = OUT_REG_WORD_LENGTH_MASK,
+		.word_length_shift = OUT_REG_WORD_LENGTH_SFT,
+		.cowork_reg = ETDM_0_3_COWORK_CON2,
+		.cowork_mask = ETDM_OUT2_SLAVE_SEL_MASK,
+		.cowork_shift = ETDM_OUT2_SLAVE_SEL_SFT,
+		.cowork_val = ETDM_SLAVE_SEL_ETDMIN2_MASTER,
+		.in2latch_time_reg = ETDM_OUT2_CON2,
+		.in2latch_time_mask = OUT_REG_IN2LATCH_TIME_MASK,
+		.in2latch_time_shift = OUT_REG_IN2LATCH_TIME_SFT,
+		.pad_top_ck_en_reg = 0,
+		.master_latch_reg = 0,
+	},
+	[DAI_I2SOUT3] = {
+		.enable_reg = ETDM_OUT3_CON0,
+		.enable_mask = OUT_REG_ETDM_OUT_EN_MASK,
+		.enable_shift = OUT_REG_ETDM_OUT_EN_SFT,
+		.sync_reg = ETDM_OUT3_CON0,
+		.sync_mask = REG_SYNC_MODE_MASK,
+		.sync_shift = REG_SYNC_MODE_SFT,
+		.ch_reg = ETDM_OUT3_CON0,
+		.ch_mask = REG_CH_NUM_MASK,
+		.ch_shift = REG_CH_NUM_SFT,
+		.init_count_reg = ETDM_OUT3_CON1,
+		.init_count_mask = OUT_REG_INITIAL_COUNT_MASK,
+		.init_count_shift = OUT_REG_INITIAL_COUNT_SFT,
+		.init_point_reg = ETDM_OUT3_CON1,
+		.init_point_mask = OUT_REG_INITIAL_POINT_MASK,
+		.init_point_shift = OUT_REG_INITIAL_POINT_SFT,
+		.lrck_reset_reg = ETDM_OUT3_CON1,
+		.lrck_reset_mask = OUT_REG_LRCK_RESET_MASK,
+		.lrck_reset_shift = OUT_REG_LRCK_RESET_SFT,
+		.clk_source_reg = ETDM_OUT3_CON4,
+		.clk_source_mask = OUT_REG_CLOCK_SOURCE_SEL_MASK,
+		.clk_source_shift = OUT_REG_CLOCK_SOURCE_SEL_SFT,
+		.fs_timing_reg = ETDM_OUT3_CON4,
+		.fs_timing_mask = OUT_REG_FS_TIMING_SEL_MASK,
+		.fs_timing_shift = OUT_REG_FS_TIMING_SEL_SFT,
+		.relatch_en_sel_reg = ETDM_OUT3_CON4,
+		.relatch_en_sel_mask = OUT_REG_RELATCH_EN_SEL_MASK,
+		.relatch_en_sel_shift = OUT_REG_RELATCH_EN_SEL_SFT,
+		.tdm_mode_reg = ETDM_OUT3_CON0,
+		.tdm_mode_mask = OUT_REG_FMT_MASK,
+		.tdm_mode_shift = OUT_REG_FMT_SFT,
+		.relatch_domain_sel_reg = ETDM_OUT3_CON0,
+		.relatch_domain_sel_mask = OUT_REG_RELATCH_DOMAIN_SEL_MASK,
+		.relatch_domain_sel_shift = OUT_REG_RELATCH_DOMAIN_SEL_SFT,
+		.bit_length_reg = ETDM_OUT3_CON0,
+		.bit_length_mask = OUT_REG_BIT_LENGTH_MASK,
+		.bit_length_shift = OUT_REG_BIT_LENGTH_SFT,
+		.word_length_reg = ETDM_OUT3_CON0,
+		.word_length_mask = OUT_REG_WORD_LENGTH_MASK,
+		.word_length_shift = OUT_REG_WORD_LENGTH_SFT,
+		.cowork_reg = ETDM_0_3_COWORK_CON2,
+		.cowork_mask = ETDM_OUT3_SLAVE_SEL_MASK,
+		.cowork_shift = ETDM_OUT3_SLAVE_SEL_SFT,
+		.cowork_val = ETDM_SLAVE_SEL_ETDMIN3_MASTER,
+		.in2latch_time_reg = ETDM_OUT3_CON2,
+		.in2latch_time_mask = OUT_REG_IN2LATCH_TIME_MASK,
+		.in2latch_time_shift = OUT_REG_IN2LATCH_TIME_SFT,
+		.pad_top_ck_en_reg = 0,
+		.master_latch_reg = 0,
+	},
+	[DAI_I2SOUT4] = {
+		.enable_reg = ETDM_OUT4_CON0,
+		.enable_mask = OUT_REG_ETDM_OUT_EN_MASK,
+		.enable_shift = OUT_REG_ETDM_OUT_EN_SFT,
+		.sync_reg = ETDM_OUT4_CON0,
+		.sync_mask = REG_SYNC_MODE_MASK,
+		.sync_shift = REG_SYNC_MODE_SFT,
+		.ch_reg = ETDM_OUT4_CON0,
+		.ch_mask = REG_CH_NUM_MASK,
+		.ch_shift = REG_CH_NUM_SFT,
+		.init_count_reg = ETDM_OUT4_CON1,
+		.init_count_mask = OUT_REG_INITIAL_COUNT_MASK,
+		.init_count_shift = OUT_REG_INITIAL_COUNT_SFT,
+		.init_point_reg = ETDM_OUT4_CON1,
+		.init_point_mask = OUT_REG_INITIAL_POINT_MASK,
+		.init_point_shift = OUT_REG_INITIAL_POINT_SFT,
+		.lrck_reset_reg = ETDM_OUT4_CON1,
+		.lrck_reset_mask = OUT_REG_LRCK_RESET_MASK,
+		.lrck_reset_shift = OUT_REG_LRCK_RESET_SFT,
+		.clk_source_reg = ETDM_OUT4_CON4,
+		.clk_source_mask = OUT_REG_CLOCK_SOURCE_SEL_MASK,
+		.clk_source_shift = OUT_REG_CLOCK_SOURCE_SEL_SFT,
+		.fs_timing_reg = ETDM_OUT4_CON4,
+		.fs_timing_mask = OUT_REG_FS_TIMING_SEL_MASK,
+		.fs_timing_shift = OUT_REG_FS_TIMING_SEL_SFT,
+		.relatch_en_sel_reg = ETDM_OUT4_CON4,
+		.relatch_en_sel_mask = OUT_REG_RELATCH_EN_SEL_MASK,
+		.relatch_en_sel_shift = OUT_REG_RELATCH_EN_SEL_SFT,
+		.tdm_mode_reg = ETDM_OUT4_CON0,
+		.tdm_mode_mask = OUT_REG_FMT_MASK,
+		.tdm_mode_shift = OUT_REG_FMT_SFT,
+		.relatch_domain_sel_reg = ETDM_OUT4_CON0,
+		.relatch_domain_sel_mask = OUT_REG_RELATCH_DOMAIN_SEL_MASK,
+		.relatch_domain_sel_shift = OUT_REG_RELATCH_DOMAIN_SEL_SFT,
+		.bit_length_reg = ETDM_OUT4_CON0,
+		.bit_length_mask = OUT_REG_BIT_LENGTH_MASK,
+		.bit_length_shift = OUT_REG_BIT_LENGTH_SFT,
+		.word_length_reg = ETDM_OUT4_CON0,
+		.word_length_mask = OUT_REG_WORD_LENGTH_MASK,
+		.word_length_shift = OUT_REG_WORD_LENGTH_SFT,
+		.cowork_reg = ETDM_4_7_COWORK_CON0,
+		.cowork_mask = ETDM_OUT4_SLAVE_SEL_MASK,
+		.cowork_shift = ETDM_OUT4_SLAVE_SEL_SFT,
+		.cowork_val = ETDM_SLAVE_SEL_ETDMIN4_MASTER,
+		.in2latch_time_reg = ETDM_OUT4_CON2,
+		.in2latch_time_mask = OUT_REG_IN2LATCH_TIME_MASK,
+		.in2latch_time_shift = OUT_REG_IN2LATCH_TIME_SFT,
+		.pad_top_ck_en_reg = AUD_TOP_CFG_VLP_RG,
+		.pad_top_ck_en_mask = RG_I2S4_PAD_TOP_CK_EN_MASK,
+		.pad_top_ck_en_shift = RG_I2S4_PAD_TOP_CK_EN_SFT,
+		.master_latch_reg = AUD_TOP_CFG_VLP_RG,
+		.master_latch_mask = RG_I2S4_OUT_BCK_NEG_EG_LATCH_MASK,
+		.master_latch_shift = RG_I2S4_OUT_BCK_NEG_EG_LATCH_SFT,
+	},
+	[DAI_I2SOUT6] = {
+		.enable_reg = ETDM_OUT6_CON0,
+		.enable_mask = OUT_REG_ETDM_OUT_EN_MASK,
+		.enable_shift = OUT_REG_ETDM_OUT_EN_SFT,
+		.sync_reg = ETDM_OUT6_CON0,
+		.sync_mask = REG_SYNC_MODE_MASK,
+		.sync_shift = REG_SYNC_MODE_SFT,
+		.ch_reg = ETDM_OUT6_CON0,
+		.ch_mask = REG_CH_NUM_MASK,
+		.ch_shift = REG_CH_NUM_SFT,
+		.init_count_reg = ETDM_OUT6_CON1,
+		.init_count_mask = OUT_REG_INITIAL_COUNT_MASK,
+		.init_count_shift = OUT_REG_INITIAL_COUNT_SFT,
+		.init_point_reg = ETDM_OUT6_CON1,
+		.init_point_mask = OUT_REG_INITIAL_POINT_MASK,
+		.init_point_shift = OUT_REG_INITIAL_POINT_SFT,
+		.lrck_reset_reg = ETDM_OUT6_CON1,
+		.lrck_reset_mask = OUT_REG_LRCK_RESET_MASK,
+		.lrck_reset_shift = OUT_REG_LRCK_RESET_SFT,
+		.clk_source_reg = ETDM_OUT6_CON4,
+		.clk_source_mask = OUT_REG_CLOCK_SOURCE_SEL_MASK,
+		.clk_source_shift = OUT_REG_CLOCK_SOURCE_SEL_SFT,
+		.fs_timing_reg = ETDM_OUT6_CON4,
+		.fs_timing_mask = OUT_REG_FS_TIMING_SEL_MASK,
+		.fs_timing_shift = OUT_REG_FS_TIMING_SEL_SFT,
+		.relatch_en_sel_reg = ETDM_OUT6_CON4,
+		.relatch_en_sel_mask = OUT_REG_RELATCH_EN_SEL_MASK,
+		.relatch_en_sel_shift = OUT_REG_RELATCH_EN_SEL_SFT,
+		.tdm_mode_reg = ETDM_OUT6_CON0,
+		.tdm_mode_mask = OUT_REG_FMT_MASK,
+		.tdm_mode_shift = OUT_REG_FMT_SFT,
+		.relatch_domain_sel_reg = ETDM_OUT6_CON0,
+		.relatch_domain_sel_mask = OUT_REG_RELATCH_DOMAIN_SEL_MASK,
+		.relatch_domain_sel_shift = OUT_REG_RELATCH_DOMAIN_SEL_SFT,
+		.bit_length_reg = ETDM_OUT6_CON0,
+		.bit_length_mask = OUT_REG_BIT_LENGTH_MASK,
+		.bit_length_shift = OUT_REG_BIT_LENGTH_SFT,
+		.word_length_reg = ETDM_OUT6_CON0,
+		.word_length_mask = OUT_REG_WORD_LENGTH_MASK,
+		.word_length_shift = OUT_REG_WORD_LENGTH_SFT,
+		.cowork_reg = ETDM_4_7_COWORK_CON2,
+		.cowork_mask = ETDM_OUT6_SLAVE_SEL_MASK,
+		.cowork_shift = ETDM_OUT6_SLAVE_SEL_SFT,
+		.cowork_val = ETDM_SLAVE_SEL_ETDMIN6_MASTER,
+		.in2latch_time_reg = ETDM_OUT6_CON2,
+		.in2latch_time_mask = OUT_REG_IN2LATCH_TIME_MASK,
+		.in2latch_time_shift = OUT_REG_IN2LATCH_TIME_SFT,
+		.pad_top_ck_en_reg = 0,
+		.master_latch_reg = 0,
+	},
+
+};
+
+/* lpbk */
+static const u8 etdm_lpbk_idx_0[] = {
+	0x0, 0x8,
+};
+
+static const u8 etdm_lpbk_idx_1[] = {
+	0x2, 0xa,
+};
+
+static const u8 etdm_lpbk_idx_2[] = {
+	0x4, 0xc,
+};
+
+static const u8 etdm_lpbk_idx_3[] = {
+	0x6, 0xe,
+};
+
+static int etdm_lpbk_get(struct snd_kcontrol *kcontrol,
+			 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
+	u32 value;
+	u32 value_ipmode;
+	u32 reg;
+	u32 mask;
+	u8 shift;
+
+	if (!strcmp(kcontrol->id.name, "I2SIN0_LPBK")) {
+		reg = ETDM_0_3_COWORK_CON1;
+		mask = ETDM_IN0_SDATA0_SEL_MASK_SFT;
+		shift = ETDM_IN0_SDATA0_SEL_SFT;
+	} else if (!strcmp(kcontrol->id.name, "I2SIN1_LPBK")) {
+		reg = ETDM_0_3_COWORK_CON1;
+		mask = ETDM_IN1_SDATA0_SEL_MASK_SFT;
+		shift = ETDM_IN1_SDATA0_SEL_SFT;
+	} else if (!strcmp(kcontrol->id.name, "I2SIN2_LPBK")) {
+		reg = ETDM_0_3_COWORK_CON3;
+		mask = ETDM_IN2_SDATA0_SEL_MASK_SFT;
+		shift = ETDM_IN2_SDATA0_SEL_SFT;
+	} else if (!strcmp(kcontrol->id.name, "I2SIN3_LPBK")) {
+		reg = ETDM_0_3_COWORK_CON3;
+		mask = ETDM_IN3_SDATA0_SEL_MASK_SFT;
+		shift = ETDM_IN3_SDATA0_SEL_SFT;
+	} else if (!strcmp(kcontrol->id.name, "I2SIN4_LPBK")) {
+		reg = ETDM_4_7_COWORK_CON1;
+
+		// Get I2SIN4 multi-ip mode
+		regmap_read(afe->regmap, ETDM_IN4_CON2, &value_ipmode);
+		value_ipmode = FIELD_GET(BIT(31), value_ipmode);
+
+		if (value_ipmode) {
+			mask = ETDM_IN4_SDATA1_15_SEL_MASK_SFT;
+			shift = ETDM_IN4_SDATA1_15_SEL_SFT;
+		} else {
+			mask = ETDM_IN4_SDATA0_SEL_MASK_SFT;
+			shift = ETDM_IN4_SDATA0_SEL_SFT;
+		}
+	} else if (!strcmp(kcontrol->id.name, "I2SIN6_LPBK")) {
+		reg = ETDM_4_7_COWORK_CON3;
+		mask = ETDM_IN6_SDATA0_SEL_MASK_SFT;
+		shift = ETDM_IN6_SDATA0_SEL_SFT;
+	} else {
+		dev_warn(afe->dev, "i2s lpbk no match\n");
+		return 0;
+	}
+
+	if (reg)
+		regmap_read(afe->regmap, reg, &value);
+	else
+		value = 0;
+
+	value &= mask;
+	value >>= shift;
+	ucontrol->value.enumerated.item[0] = value;
+
+	switch (value) {
+	case 0x8:
+	case 0xa:
+	case 0xc:
+	case 0xe:
+		ucontrol->value.enumerated.item[0] = 1;
+		break;
+	default:
+		ucontrol->value.enumerated.item[0] = 0;
+		break;
+	}
+
+	return 0;
+}
+
+static int etdm_lpbk_put(struct snd_kcontrol *kcontrol,
+			 struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
+	u32 value = ucontrol->value.integer.value[0];
+	u32 value_ipmode;
+	u32 reg;
+	u32 val;
+	u32 mask;
+
+	if (value >= ARRAY_SIZE(etdm_lpbk_idx_0))
+		return -EINVAL;
+
+	if (!strcmp(kcontrol->id.name, "I2SIN0_LPBK")) {
+		reg = ETDM_0_3_COWORK_CON1;
+		mask = ETDM_IN0_SDATA0_SEL_MASK_SFT;
+		val = etdm_lpbk_idx_0[value] << ETDM_IN0_SDATA0_SEL_SFT;
+	} else if (!strcmp(kcontrol->id.name, "I2SIN1_LPBK")) {
+		reg = ETDM_0_3_COWORK_CON1;
+		mask = ETDM_IN1_SDATA0_SEL_MASK_SFT;
+		val = etdm_lpbk_idx_1[value] << ETDM_IN1_SDATA0_SEL_SFT;
+	} else if (!strcmp(kcontrol->id.name, "I2SIN2_LPBK")) {
+		reg = ETDM_0_3_COWORK_CON3;
+		mask = ETDM_IN2_SDATA0_SEL_MASK_SFT;
+		val = etdm_lpbk_idx_2[value] << ETDM_IN2_SDATA0_SEL_SFT;
+	} else if (!strcmp(kcontrol->id.name, "I2SIN3_LPBK")) {
+		reg = ETDM_0_3_COWORK_CON3;
+		mask = ETDM_IN3_SDATA0_SEL_MASK_SFT;
+		val = etdm_lpbk_idx_3[value] << ETDM_IN3_SDATA0_SEL_SFT;
+	} else if (!strcmp(kcontrol->id.name, "I2SIN4_LPBK")) {
+		reg = ETDM_4_7_COWORK_CON1;
+
+		// Get I2SIN4 multi-ip mode
+		regmap_read(afe->regmap, ETDM_IN4_CON2, &value_ipmode);
+		value_ipmode = FIELD_GET(BIT(31), value_ipmode);
+
+		if (!value) {
+			mask = ETDM_IN4_SDATA1_15_SEL_MASK_SFT |
+				ETDM_IN4_SDATA0_SEL_MASK_SFT;
+			val = (etdm_lpbk_idx_0[value] << ETDM_IN4_SDATA1_15_SEL_SFT) |
+				(etdm_lpbk_idx_0[value] << ETDM_IN4_SDATA0_SEL_SFT);
+		} else if (value_ipmode) {
+			mask = ETDM_IN4_SDATA1_15_SEL_MASK_SFT;
+			val = etdm_lpbk_idx_0[value] << ETDM_IN4_SDATA1_15_SEL_SFT;
+		} else {
+			mask = ETDM_IN4_SDATA0_SEL_MASK_SFT;
+			val = etdm_lpbk_idx_0[value] << ETDM_IN4_SDATA0_SEL_SFT;
+		}
+	} else {
+		reg = ETDM_4_7_COWORK_CON3;
+		mask = ETDM_IN6_SDATA0_SEL_MASK_SFT;
+		val = etdm_lpbk_idx_2[value] << ETDM_IN6_SDATA0_SEL_SFT;
+	}
+
+	if (reg)
+		regmap_update_bits(afe->regmap, reg, mask, val);
+
+	return 0;
+}
+
+static const char *const etdm_lpbk_map[] = {
+	"Off", "On",
+};
+
+static SOC_ENUM_SINGLE_EXT_DECL(etdm_lpbk_map_enum,
+				etdm_lpbk_map);
+/* lpbk */
+
+/* multi-ip mode */
+static const int etdm_ip_mode_idx[] = {
+	0x0, 0x1,
+};
+
+static int etdm_ip_mode_get(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_afe_i2s_priv *i2sin4_priv = afe_priv->dai_priv[MT8196_DAI_I2S_IN4];
+
+	ucontrol->value.enumerated.item[0] = i2sin4_priv->ip_mode;
+
+	return 0;
+}
+
+static int etdm_ip_mode_put(struct snd_kcontrol *kcontrol,
+			    struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_afe_i2s_priv *i2sin4_priv = afe_priv->dai_priv[MT8196_DAI_I2S_IN4];
+	unsigned int value = ucontrol->value.integer.value[0];
+
+	if (value >= ARRAY_SIZE(etdm_ip_mode_idx))
+		return -EINVAL;
+
+	/* 0: One IP multi-channel 1: Multi-IP 2-channel */
+	i2sin4_priv->ip_mode = etdm_ip_mode_idx[value];
+
+	return 0;
+}
+
+static const char *const etdm_ip_mode_map[] = {
+	"Off", "On",
+};
+
+static SOC_ENUM_SINGLE_EXT_DECL(etdm_ip_mode_map_enum,
+				etdm_ip_mode_map);
+/* multi-ip mode */
+
+/* ch num */
+static const int etdm_ch_num_idx[] = {
+	0x2, 0x4, 0x6, 0x8,
+};
+
+static int etdm_ch_num_get(struct snd_kcontrol *kcontrol,
+			   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component =
+		snd_soc_kcontrol_component(kcontrol);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_afe_i2s_priv *i2sin4_priv = afe_priv->dai_priv[MT8196_DAI_I2S_IN4];
+	struct mtk_afe_i2s_priv *i2sout4_priv = afe_priv->dai_priv[MT8196_DAI_I2S_OUT4];
+	unsigned int value = 0;
+
+	if (!strcmp(kcontrol->id.name, "I2SIN4_CH_NUM"))
+		value = i2sin4_priv->ch_num;
+	else if (!strcmp(kcontrol->id.name, "I2SOUT4_CH_NUM"))
+		value = i2sout4_priv->ch_num;
+
+	if (value == 0x2)
+		ucontrol->value.enumerated.item[0] = 0;
+	else if (value == 0x4)
+		ucontrol->value.enumerated.item[0] = 1;
+	else if (value == 0x6)
+		ucontrol->value.enumerated.item[0] = 2;
+	else
+		ucontrol->value.enumerated.item[0] = 3;
+
+	return 0;
+}
+
+static int etdm_ch_num_put(struct snd_kcontrol *kcontrol,
+			   struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_afe_i2s_priv *i2sin4_priv = afe_priv->dai_priv[MT8196_DAI_I2S_IN4];
+	struct mtk_afe_i2s_priv *i2sout4_priv = afe_priv->dai_priv[MT8196_DAI_I2S_OUT4];
+	unsigned int value = ucontrol->value.integer.value[0];
+
+	if (value >= ARRAY_SIZE(etdm_ch_num_idx))
+		return -EINVAL;
+
+	if (!strcmp(kcontrol->id.name, "I2SIN4_CH_NUM"))
+		i2sin4_priv->ch_num = etdm_ch_num_idx[value];
+	else if (!strcmp(kcontrol->id.name, "I2SOUT4_CH_NUM"))
+		i2sout4_priv->ch_num = etdm_ch_num_idx[value];
+
+	return 0;
+}
+
+static const char *const etdm_ch_num_map[] = {
+	"2CH", "4CH", "6CH", "8CH",
+};
+
+static SOC_ENUM_SINGLE_EXT_DECL(etdm_ch_num_map_enum,
+				etdm_ch_num_map);
+/* ch num */
+
+enum {
+	I2S_FMT_EIAJ = 0,
+	I2S_FMT_I2S = 1,
+};
+
+enum {
+	I2S_WLEN_16_BIT = 0,
+	I2S_WLEN_32_BIT = 1,
+};
+
+enum {
+	I2S_HD_NORMAL = 0,
+	I2S_HD_LOW_JITTER = 1,
+};
+
+enum {
+	I2S1_SEL_O28_O29 = 0,
+	I2S1_SEL_O03_O04 = 1,
+};
+
+enum {
+	I2S_IN_PAD_CONNSYS = 0,
+	I2S_IN_PAD_IO_MUX = 1,
+};
+
+static unsigned int get_i2s_wlen(snd_pcm_format_t format)
+{
+	return snd_pcm_format_physical_width(format) <= 16 ?
+	       I2S_WLEN_16_BIT : I2S_WLEN_32_BIT;
+}
+
+#define MTK_AFE_I2SIN0_KCONTROL_NAME "I2SIN0_HD_Mux"
+#define MTK_AFE_I2SIN1_KCONTROL_NAME "I2SIN1_HD_Mux"
+#define MTK_AFE_I2SIN2_KCONTROL_NAME "I2SIN2_HD_Mux"
+#define MTK_AFE_I2SIN4_KCONTROL_NAME "I2SIN4_HD_Mux"
+#define MTK_AFE_I2SIN6_KCONTROL_NAME "I2SIN6_HD_Mux"
+#define MTK_AFE_I2SOUT0_KCONTROL_NAME "I2SOUT0_HD_Mux"
+#define MTK_AFE_I2SOUT1_KCONTROL_NAME "I2SOUT1_HD_Mux"
+#define MTK_AFE_I2SOUT2_KCONTROL_NAME "I2SOUT2_HD_Mux"
+#define MTK_AFE_I2SOUT4_KCONTROL_NAME "I2SOUT4_HD_Mux"
+#define MTK_AFE_I2SOUT6_KCONTROL_NAME "I2SOUT6_HD_Mux"
+#define MTK_AFE_FMI2S_MASTER_KCONTROL_NAME "FMI2S_MASTER_HD_Mux"
+
+#define I2SIN0_HD_EN_W_NAME "I2SIN0_HD_EN"
+#define I2SIN1_HD_EN_W_NAME "I2SIN1_HD_EN"
+#define I2SIN2_HD_EN_W_NAME "I2SIN2_HD_EN"
+#define I2SIN3_HD_EN_W_NAME "I2SIN3_HD_EN"
+#define I2SIN4_HD_EN_W_NAME "I2SIN4_HD_EN"
+#define I2SIN6_HD_EN_W_NAME "I2SIN6_HD_EN"
+#define I2SOUT0_HD_EN_W_NAME "I2SOUT0_HD_EN"
+#define I2SOUT1_HD_EN_W_NAME "I2SOUT1_HD_EN"
+#define I2SOUT2_HD_EN_W_NAME "I2SOUT2_HD_EN"
+#define I2SOUT3_HD_EN_W_NAME "I2SOUT3_HD_EN"
+#define I2SOUT4_HD_EN_W_NAME "I2SOUT4_HD_EN"
+#define I2SOUT6_HD_EN_W_NAME "I2SOUT6_HD_EN"
+#define FMI2S_MASTER_HD_EN_W_NAME "FMI2S_MASTER_HD_EN"
+
+#define I2SIN0_MCLK_EN_W_NAME "I2SIN0_MCLK_EN"
+#define I2SIN1_MCLK_EN_W_NAME "I2SIN1_MCLK_EN"
+#define I2SIN2_MCLK_EN_W_NAME "I2SIN2_MCLK_EN"
+#define I2SIN3_MCLK_EN_W_NAME "I2SIN3_MCLK_EN"
+#define I2SIN4_MCLK_EN_W_NAME "I2SIN4_MCLK_EN"
+#define I2SIN6_MCLK_EN_W_NAME "I2SIN6_MCLK_EN"
+#define I2SOUT0_MCLK_EN_W_NAME "I2SOUT0_MCLK_EN"
+#define I2SOUT1_MCLK_EN_W_NAME "I2SOUT1_MCLK_EN"
+#define I2SOUT2_MCLK_EN_W_NAME "I2SOUT2_MCLK_EN"
+#define I2SOUT3_MCLK_EN_W_NAME "I2SOUT3_MCLK_EN"
+#define I2SOUT4_MCLK_EN_W_NAME "I2SOUT4_MCLK_EN"
+#define I2SOUT6_MCLK_EN_W_NAME "I2SOUT6_MCLK_EN"
+#define FMI2S_MASTER_MCLK_EN_W_NAME "FMI2S_MASTER_MCLK_EN"
+
+static int get_i2s_id_by_name(struct mtk_base_afe *afe,
+			      const char *name)
+{
+	if (strncmp(name, "I2SIN0", 6) == 0)
+		return MT8196_DAI_I2S_IN0;
+	else if (strncmp(name, "I2SIN1", 6) == 0)
+		return MT8196_DAI_I2S_IN1;
+	else if (strncmp(name, "I2SIN2", 6) == 0)
+		return MT8196_DAI_I2S_IN2;
+	else if (strncmp(name, "I2SIN3", 6) == 0)
+		return MT8196_DAI_I2S_IN3;
+	else if (strncmp(name, "I2SIN4", 6) == 0)
+		return MT8196_DAI_I2S_IN4;
+	else if (strncmp(name, "I2SIN6", 6) == 0)
+		return MT8196_DAI_I2S_IN6;
+	else if (strncmp(name, "I2SOUT0", 7) == 0)
+		return MT8196_DAI_I2S_OUT0;
+	else if (strncmp(name, "I2SOUT1", 7) == 0)
+		return MT8196_DAI_I2S_OUT1;
+	else if (strncmp(name, "I2SOUT2", 7) == 0)
+		return MT8196_DAI_I2S_OUT2;
+	else if (strncmp(name, "I2SOUT3", 7) == 0)
+		return MT8196_DAI_I2S_OUT3;
+	else if (strncmp(name, "I2SOUT4", 7) == 0)
+		return MT8196_DAI_I2S_OUT4;
+	else if (strncmp(name, "I2SOUT6", 7) == 0)
+		return MT8196_DAI_I2S_OUT6;
+	else if (strncmp(name, "FMI2S_MASTER", 12) == 0)
+		return MT8196_DAI_FM_I2S_MASTER;
+	else
+		return -EINVAL;
+}
+
+static struct mtk_afe_i2s_priv *get_i2s_priv_by_name(struct mtk_base_afe *afe,
+						     const char *name)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	int dai_id = get_i2s_id_by_name(afe, name);
+
+	if (dai_id < 0)
+		return NULL;
+
+	return afe_priv->dai_priv[dai_id];
+}
+
+/*
+ * bit mask for i2s low power control
+ * such as bit0 for i2s0, bit1 for i2s1...
+ * if set 1, means i2s low power mode
+ * if set 0, means i2s low jitter mode
+ * 0 for all i2s bit in default
+ */
+static unsigned int i2s_low_power_mask;
+static int mtk_i2s_low_power_mask_get(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	pr_debug("%s(), mask: %x\n", __func__, i2s_low_power_mask);
+	ucontrol->value.integer.value[0] = i2s_low_power_mask;
+	return 0;
+}
+
+static int mtk_i2s_low_power_mask_set(struct snd_kcontrol *kcontrol,
+				      struct snd_ctl_elem_value *ucontrol)
+{
+	i2s_low_power_mask = ucontrol->value.integer.value[0];
+	return 0;
+}
+
+static int mtk_is_i2s_low_power(int i2s_num)
+{
+	int i2s_bit_shift;
+
+	i2s_bit_shift = i2s_num - MT8196_DAI_I2S_IN0;
+	if (i2s_bit_shift < 0 || i2s_bit_shift > MT8196_DAI_I2S_MAX_NUM)
+		return 0;
+
+	return (i2s_low_power_mask >> i2s_bit_shift) & 0x1;
+}
+
+/* low jitter control */
+static const char *const mt8196_i2s_hd_str[] = {
+	"Normal", "Low_Jitter"
+};
+
+static const struct soc_enum mt8196_i2s_enum[] = {
+	SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(mt8196_i2s_hd_str),
+			    mt8196_i2s_hd_str),
+};
+
+static int mt8196_i2s_hd_get(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mtk_afe_i2s_priv *i2s_priv;
+
+	i2s_priv = get_i2s_priv_by_name(afe, kcontrol->id.name);
+
+	if (!i2s_priv)
+		return -EINVAL;
+
+	ucontrol->value.integer.value[0] = i2s_priv->low_jitter_en;
+
+	return 0;
+}
+
+static int mt8196_i2s_hd_set(struct snd_kcontrol *kcontrol,
+			     struct snd_ctl_elem_value *ucontrol)
+{
+	struct snd_soc_component *cmpnt = snd_soc_kcontrol_component(kcontrol);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mtk_afe_i2s_priv *i2s_priv;
+	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
+	int hd_en;
+
+	if (ucontrol->value.enumerated.item[0] >= e->items)
+		return -EINVAL;
+
+	hd_en = ucontrol->value.integer.value[0];
+
+	dev_dbg(afe->dev, "kcontrol name %s, hd_en %d\n", kcontrol->id.name, hd_en);
+
+	i2s_priv = get_i2s_priv_by_name(afe, kcontrol->id.name);
+
+	if (!i2s_priv)
+		return -EINVAL;
+
+	i2s_priv->low_jitter_en = hd_en;
+
+	return 0;
+}
+
+static const struct snd_kcontrol_new mtk_dai_i2s_controls[] = {
+	SOC_ENUM_EXT(MTK_AFE_I2SIN0_KCONTROL_NAME, mt8196_i2s_enum[0],
+		     mt8196_i2s_hd_get, mt8196_i2s_hd_set),
+	SOC_ENUM_EXT(MTK_AFE_I2SIN1_KCONTROL_NAME, mt8196_i2s_enum[0],
+		     mt8196_i2s_hd_get, mt8196_i2s_hd_set),
+	SOC_ENUM_EXT(MTK_AFE_I2SIN2_KCONTROL_NAME, mt8196_i2s_enum[0],
+		     mt8196_i2s_hd_get, mt8196_i2s_hd_set),
+	SOC_ENUM_EXT(MTK_AFE_I2SIN4_KCONTROL_NAME, mt8196_i2s_enum[0],
+		     mt8196_i2s_hd_get, mt8196_i2s_hd_set),
+	SOC_ENUM_EXT(MTK_AFE_I2SIN6_KCONTROL_NAME, mt8196_i2s_enum[0],
+		     mt8196_i2s_hd_get, mt8196_i2s_hd_set),
+	SOC_ENUM_EXT(MTK_AFE_I2SOUT0_KCONTROL_NAME, mt8196_i2s_enum[0],
+		     mt8196_i2s_hd_get, mt8196_i2s_hd_set),
+	SOC_ENUM_EXT(MTK_AFE_I2SOUT1_KCONTROL_NAME, mt8196_i2s_enum[0],
+		     mt8196_i2s_hd_get, mt8196_i2s_hd_set),
+	SOC_ENUM_EXT(MTK_AFE_I2SOUT2_KCONTROL_NAME, mt8196_i2s_enum[0],
+		     mt8196_i2s_hd_get, mt8196_i2s_hd_set),
+	SOC_ENUM_EXT(MTK_AFE_I2SOUT4_KCONTROL_NAME, mt8196_i2s_enum[0],
+		     mt8196_i2s_hd_get, mt8196_i2s_hd_set),
+	SOC_ENUM_EXT(MTK_AFE_I2SOUT6_KCONTROL_NAME, mt8196_i2s_enum[0],
+		     mt8196_i2s_hd_get, mt8196_i2s_hd_set),
+	SOC_ENUM_EXT(MTK_AFE_FMI2S_MASTER_KCONTROL_NAME, mt8196_i2s_enum[0],
+		     mt8196_i2s_hd_get, mt8196_i2s_hd_set),
+	SOC_SINGLE_EXT("i2s_low_power_mask", SND_SOC_NOPM, 0, 0xffff, 0,
+		       mtk_i2s_low_power_mask_get,
+		       mtk_i2s_low_power_mask_set),
+
+	SOC_ENUM_EXT("I2SIN0_LPBK", etdm_lpbk_map_enum,
+		     etdm_lpbk_get, etdm_lpbk_put),
+	SOC_ENUM_EXT("I2SIN1_LPBK", etdm_lpbk_map_enum,
+		     etdm_lpbk_get, etdm_lpbk_put),
+	SOC_ENUM_EXT("I2SIN2_LPBK", etdm_lpbk_map_enum,
+		     etdm_lpbk_get, etdm_lpbk_put),
+	SOC_ENUM_EXT("I2SIN3_LPBK", etdm_lpbk_map_enum,
+		     etdm_lpbk_get, etdm_lpbk_put),
+	SOC_ENUM_EXT("I2SIN4_LPBK", etdm_lpbk_map_enum,
+		     etdm_lpbk_get, etdm_lpbk_put),
+	SOC_ENUM_EXT("I2SIN6_LPBK", etdm_lpbk_map_enum,
+		     etdm_lpbk_get, etdm_lpbk_put),
+	SOC_ENUM_EXT("I2SIN4_IP_MODE", etdm_ip_mode_map_enum,
+		     etdm_ip_mode_get, etdm_ip_mode_put),
+	SOC_ENUM_EXT("I2SIN4_CH_NUM", etdm_ch_num_map_enum,
+		     etdm_ch_num_get, etdm_ch_num_put),
+	SOC_ENUM_EXT("I2SOUT4_CH_NUM", etdm_ch_num_map_enum,
+		     etdm_ch_num_get, etdm_ch_num_put),
+};
+
+/* dai component */
+/* i2s virtual mux to output widget */
+static const char *const i2s_mux_map[] = {
+	"Normal", "Dummy_Widget",
+};
+
+static int i2s_mux_map_value[] = {
+	0, 1,
+};
+
+static SOC_VALUE_ENUM_SINGLE_AUTODISABLE_DECL(i2s_mux_map_enum,
+		SND_SOC_NOPM,
+		0,
+		1,
+		i2s_mux_map,
+		i2s_mux_map_value);
+
+static const struct snd_kcontrol_new i2s_in0_mux_control =
+	SOC_DAPM_ENUM("I2S IN0 Select", i2s_mux_map_enum);
+static const struct snd_kcontrol_new i2s_in1_mux_control =
+	SOC_DAPM_ENUM("I2S IN1 Select", i2s_mux_map_enum);
+static const struct snd_kcontrol_new i2s_in2_mux_control =
+	SOC_DAPM_ENUM("I2S IN2 Select", i2s_mux_map_enum);
+static const struct snd_kcontrol_new i2s_in3_mux_control =
+	SOC_DAPM_ENUM("I2S IN3 Select", i2s_mux_map_enum);
+static const struct snd_kcontrol_new i2s_in4_mux_control =
+	SOC_DAPM_ENUM("I2S IN4 Select", i2s_mux_map_enum);
+static const struct snd_kcontrol_new i2s_in6_mux_control =
+	SOC_DAPM_ENUM("I2S IN6 Select", i2s_mux_map_enum);
+static const struct snd_kcontrol_new i2s_out0_mux_control =
+	SOC_DAPM_ENUM("I2S OUT0 Select", i2s_mux_map_enum);
+static const struct snd_kcontrol_new i2s_out1_mux_control =
+	SOC_DAPM_ENUM("I2S OUT1 Select", i2s_mux_map_enum);
+static const struct snd_kcontrol_new i2s_out2_mux_control =
+	SOC_DAPM_ENUM("I2S OUT2 Select", i2s_mux_map_enum);
+static const struct snd_kcontrol_new i2s_out3_mux_control =
+	SOC_DAPM_ENUM("I2S OUT3 Select", i2s_mux_map_enum);
+static const struct snd_kcontrol_new i2s_out4_mux_control =
+	SOC_DAPM_ENUM("I2S OUT4 Select", i2s_mux_map_enum);
+static const struct snd_kcontrol_new i2s_out6_mux_control =
+	SOC_DAPM_ENUM("I2S OUT6 Select", i2s_mux_map_enum);
+
+/* interconnection */
+static const struct snd_kcontrol_new mtk_i2sout0_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("DL0_CH1", AFE_CONN108_1, I_DL0_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH1", AFE_CONN108_1, I_DL1_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH1", AFE_CONN108_1, I_DL2_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH1", AFE_CONN108_1, I_DL3_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH1", AFE_CONN108_1, I_DL4_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH1", AFE_CONN108_1, I_DL5_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL6_CH1", AFE_CONN108_1, I_DL6_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL7_CH1", AFE_CONN108_1, I_DL7_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL8_CH1", AFE_CONN108_1, I_DL8_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL_24CH_CH1", AFE_CONN108_1, I_DL_24CH_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL23_CH1", AFE_CONN108_2, I_DL23_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL24_CH1", AFE_CONN108_2, I_DL24_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_GAIN0_OUT_CH1", AFE_CONN108_0,
+				    I_GAIN0_OUT_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN108_0,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN108_0,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN108_0,
+				    I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_0_CAP_CH1", AFE_CONN108_4,
+				    I_PCM_0_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH1", AFE_CONN108_4,
+				    I_PCM_1_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_SRC_2_OUT_CH1", AFE_CONN108_6,
+				    I_SRC_2_OUT_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_i2sout0_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("DL0_CH2", AFE_CONN109_1, I_DL0_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH2", AFE_CONN109_1, I_DL1_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH2", AFE_CONN109_1, I_DL2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH2", AFE_CONN109_1, I_DL3_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH2", AFE_CONN109_1, I_DL4_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH2", AFE_CONN109_1, I_DL5_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL6_CH2", AFE_CONN109_1, I_DL6_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL7_CH2", AFE_CONN109_1, I_DL7_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL8_CH2", AFE_CONN109_1, I_DL8_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL_24CH_CH2", AFE_CONN109_1, I_DL_24CH_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL23_CH2", AFE_CONN109_2, I_DL23_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL24_CH2", AFE_CONN109_2, I_DL24_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_GAIN0_OUT_CH2", AFE_CONN109_0,
+				    I_GAIN0_OUT_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN109_0,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN109_0,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN109_0,
+				    I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_0_CAP_CH1", AFE_CONN109_4,
+				    I_PCM_0_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_0_CAP_CH2", AFE_CONN109_4,
+				    I_PCM_0_CAP_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH1", AFE_CONN109_4,
+				    I_PCM_1_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH2", AFE_CONN109_4,
+				    I_PCM_1_CAP_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_SRC_2_OUT_CH2", AFE_CONN109_6,
+				    I_SRC_2_OUT_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_i2sout1_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("DL0_CH1", AFE_CONN110_1, I_DL0_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH1", AFE_CONN110_1, I_DL1_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH1", AFE_CONN110_1, I_DL2_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH1", AFE_CONN110_1, I_DL3_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH1", AFE_CONN110_1, I_DL4_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH1", AFE_CONN110_1, I_DL5_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL6_CH1", AFE_CONN110_1, I_DL6_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL7_CH1", AFE_CONN110_1, I_DL7_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL8_CH1", AFE_CONN110_1, I_DL8_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL_24CH_CH1", AFE_CONN110_1, I_DL_24CH_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_GAIN0_OUT_CH1", AFE_CONN110_0,
+				    I_GAIN0_OUT_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN110_0,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_0_CAP_CH1", AFE_CONN110_4,
+				    I_PCM_0_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH1", AFE_CONN110_4,
+				    I_PCM_1_CAP_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_i2sout1_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("DL0_CH2", AFE_CONN111_1, I_DL0_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH2", AFE_CONN111_1, I_DL1_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH2", AFE_CONN111_1, I_DL2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH2", AFE_CONN111_1, I_DL3_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH2", AFE_CONN111_1, I_DL4_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH2", AFE_CONN111_1, I_DL5_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL6_CH2", AFE_CONN111_1, I_DL6_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL7_CH2", AFE_CONN111_1, I_DL7_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL8_CH2", AFE_CONN111_1, I_DL8_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL_24CH_CH2", AFE_CONN111_1, I_DL_24CH_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_GAIN0_OUT_CH2", AFE_CONN111_0,
+				    I_GAIN0_OUT_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN111_0,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_0_CAP_CH1", AFE_CONN111_4,
+				    I_PCM_0_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_0_CAP_CH2", AFE_CONN111_4,
+				    I_PCM_0_CAP_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH1", AFE_CONN111_4,
+				    I_PCM_1_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH2", AFE_CONN111_4,
+				    I_PCM_1_CAP_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_i2sout2_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("DL0_CH1", AFE_CONN112_1, I_DL0_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH1", AFE_CONN112_1, I_DL1_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH1", AFE_CONN112_1, I_DL2_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH1", AFE_CONN112_1, I_DL3_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH1", AFE_CONN112_1, I_DL4_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH1", AFE_CONN112_1, I_DL5_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL6_CH1", AFE_CONN112_1, I_DL6_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL7_CH1", AFE_CONN112_1, I_DL7_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL8_CH1", AFE_CONN112_1, I_DL8_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL_24CH_CH1", AFE_CONN112_1, I_DL_24CH_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_GAIN0_OUT_CH1", AFE_CONN112_0,
+				    I_GAIN0_OUT_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN112_0,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_0_CAP_CH1", AFE_CONN112_4,
+				    I_PCM_0_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH1", AFE_CONN112_4,
+				    I_PCM_1_CAP_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_i2sout2_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("DL0_CH2", AFE_CONN113_1, I_DL0_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH2", AFE_CONN113_1, I_DL1_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH2", AFE_CONN113_1, I_DL2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH2", AFE_CONN113_1, I_DL3_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH2", AFE_CONN113_1, I_DL4_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH2", AFE_CONN113_1, I_DL5_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL6_CH2", AFE_CONN113_1, I_DL6_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL7_CH2", AFE_CONN113_1, I_DL7_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL8_CH2", AFE_CONN113_1, I_DL8_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL_24CH_CH2", AFE_CONN113_1, I_DL_24CH_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_GAIN0_OUT_CH2", AFE_CONN113_0,
+				    I_GAIN0_OUT_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN113_0,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_0_CAP_CH1", AFE_CONN113_4,
+				    I_PCM_0_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_0_CAP_CH2", AFE_CONN113_4,
+				    I_PCM_0_CAP_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH1", AFE_CONN113_4,
+				    I_PCM_1_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH2", AFE_CONN113_4,
+				    I_PCM_1_CAP_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_i2sout3_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("DL0_CH1", AFE_CONN114_1, I_DL0_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH1", AFE_CONN114_1, I_DL1_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH1", AFE_CONN114_1, I_DL2_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH1", AFE_CONN114_1, I_DL3_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH1", AFE_CONN114_1, I_DL4_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH1", AFE_CONN114_1, I_DL5_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL6_CH1", AFE_CONN114_1, I_DL6_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL7_CH1", AFE_CONN114_1, I_DL7_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL8_CH1", AFE_CONN114_1, I_DL8_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL_24CH_CH1", AFE_CONN114_1, I_DL_24CH_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_GAIN0_OUT_CH1", AFE_CONN114_0,
+				    I_GAIN0_OUT_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN114_0,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_0_CAP_CH1", AFE_CONN114_4,
+				    I_PCM_0_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH1", AFE_CONN114_4,
+				    I_PCM_1_CAP_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_i2sout3_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("DL0_CH2", AFE_CONN115_1, I_DL0_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH2", AFE_CONN115_1, I_DL1_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH2", AFE_CONN115_1, I_DL2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH2", AFE_CONN115_1, I_DL3_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH2", AFE_CONN115_1, I_DL4_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH2", AFE_CONN115_1, I_DL5_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL6_CH2", AFE_CONN115_1, I_DL6_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL7_CH2", AFE_CONN115_1, I_DL7_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL8_CH2", AFE_CONN115_1, I_DL8_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL_24CH_CH2", AFE_CONN115_1, I_DL_24CH_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_GAIN0_OUT_CH2", AFE_CONN115_0,
+				    I_GAIN0_OUT_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN115_0,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_0_CAP_CH2", AFE_CONN115_4,
+				    I_PCM_0_CAP_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH2", AFE_CONN115_4,
+				    I_PCM_1_CAP_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_i2sout4_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("DL0_CH1", AFE_CONN116_1, I_DL0_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH1", AFE_CONN116_1, I_DL1_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH1", AFE_CONN116_1, I_DL2_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH1", AFE_CONN116_1, I_DL3_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH1", AFE_CONN116_1, I_DL4_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH1", AFE_CONN116_1, I_DL5_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL6_CH1", AFE_CONN116_1, I_DL6_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL7_CH1", AFE_CONN116_1, I_DL7_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL8_CH1", AFE_CONN116_1, I_DL8_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL_24CH_CH1", AFE_CONN116_1, I_DL_24CH_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL24_CH1", AFE_CONN116_2, I_DL24_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_GAIN0_OUT_CH1", AFE_CONN116_0,
+				    I_GAIN0_OUT_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN116_0,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN116_0,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN116_0,
+				    I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_0_CAP_CH1", AFE_CONN116_4,
+				    I_PCM_0_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH1", AFE_CONN116_4,
+				    I_PCM_1_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_SRC_2_OUT_CH1", AFE_CONN116_6,
+				    I_SRC_2_OUT_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_i2sout4_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("DL0_CH2", AFE_CONN117_1, I_DL0_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH2", AFE_CONN117_1, I_DL1_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH2", AFE_CONN117_1, I_DL2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH2", AFE_CONN117_1, I_DL3_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH2", AFE_CONN117_1, I_DL4_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH2", AFE_CONN117_1, I_DL5_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL6_CH2", AFE_CONN117_1, I_DL6_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL7_CH2", AFE_CONN117_1, I_DL7_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL8_CH2", AFE_CONN117_1, I_DL8_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL_24CH_CH2", AFE_CONN117_1, I_DL_24CH_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL24_CH2", AFE_CONN117_2, I_DL24_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_GAIN0_OUT_CH2", AFE_CONN117_0,
+				    I_GAIN0_OUT_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN117_0,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN117_0,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN117_0,
+				    I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_0_CAP_CH1", AFE_CONN117_4,
+				    I_PCM_0_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_0_CAP_CH2", AFE_CONN117_4,
+				    I_PCM_0_CAP_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH1", AFE_CONN117_4,
+				    I_PCM_1_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH2", AFE_CONN117_4,
+				    I_PCM_1_CAP_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_SRC_2_OUT_CH2", AFE_CONN117_6,
+				    I_SRC_2_OUT_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_i2sout4_ch3_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("DL_24CH_CH3", AFE_CONN118_1, I_DL_24CH_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_0_CAP_CH1", AFE_CONN118_4,
+				    I_PCM_0_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH1", AFE_CONN118_4,
+				    I_PCM_1_CAP_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_i2sout4_ch4_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("DL_24CH_CH4", AFE_CONN119_1, I_DL_24CH_CH4, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_0_CAP_CH1", AFE_CONN118_4,
+				    I_PCM_0_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH1", AFE_CONN118_4,
+				    I_PCM_1_CAP_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_i2sout4_ch5_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("DL_24CH_CH5", AFE_CONN120_1, I_DL_24CH_CH5, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_i2sout4_ch6_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("DL_24CH_CH6", AFE_CONN121_1, I_DL_24CH_CH6, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_i2sout4_ch7_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("DL_24CH_CH7", AFE_CONN122_1, I_DL_24CH_CH7, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_i2sout4_ch8_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("DL_24CH_CH8", AFE_CONN123_1, I_DL_24CH_CH8, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_i2sout6_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("DL0_CH1", AFE_CONN148_1, I_DL0_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH1", AFE_CONN148_1, I_DL1_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH1", AFE_CONN148_1, I_DL2_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH1", AFE_CONN148_1, I_DL3_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH1", AFE_CONN148_1, I_DL4_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH1", AFE_CONN148_1, I_DL5_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL6_CH1", AFE_CONN148_1, I_DL6_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL7_CH1", AFE_CONN148_1, I_DL7_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL8_CH1", AFE_CONN148_1, I_DL8_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL23_CH1", AFE_CONN148_2, I_DL23_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL_24CH_CH1", AFE_CONN148_1, I_DL_24CH_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_GAIN0_OUT_CH1", AFE_CONN148_0,
+				    I_GAIN0_OUT_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN148_0,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_0_CAP_CH1", AFE_CONN148_4,
+				    I_PCM_0_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH1", AFE_CONN148_4,
+				    I_PCM_1_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_SRC_1_OUT_CH1", AFE_CONN148_6,
+				    I_SRC_1_OUT_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new mtk_i2sout6_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("DL0_CH2", AFE_CONN149_1, I_DL0_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH2", AFE_CONN149_1, I_DL1_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH2", AFE_CONN149_1, I_DL2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH2", AFE_CONN149_1, I_DL3_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL4_CH2", AFE_CONN149_1, I_DL4_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL5_CH2", AFE_CONN149_1, I_DL5_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL6_CH2", AFE_CONN149_1, I_DL6_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL7_CH2", AFE_CONN149_1, I_DL7_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL8_CH2", AFE_CONN149_1, I_DL8_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL23_CH2", AFE_CONN149_2, I_DL23_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL_24CH_CH2", AFE_CONN149_1, I_DL_24CH_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_GAIN0_OUT_CH2", AFE_CONN149_0,
+				    I_GAIN0_OUT_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN149_0,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_0_CAP_CH1", AFE_CONN149_4,
+				    I_PCM_0_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_0_CAP_CH2", AFE_CONN149_4,
+				    I_PCM_0_CAP_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH1", AFE_CONN149_4,
+				    I_PCM_1_CAP_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("PCM_1_CAP_CH2", AFE_CONN149_4,
+				    I_PCM_1_CAP_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("HW_SRC_1_OUT_CH2", AFE_CONN148_6,
+				    I_SRC_1_OUT_CH2, 1, 0),
+};
+
+enum {
+	SUPPLY_SEQ_APLL,
+	SUPPLY_SEQ_I2S_MCLK_EN,
+	SUPPLY_SEQ_I2S_CG_EN,
+	SUPPLY_SEQ_I2S_HD_EN,
+	SUPPLY_SEQ_I2S_EN,
+};
+
+static int mtk_i2s_hd_en_event(struct snd_soc_dapm_widget *w,
+			       struct snd_kcontrol *kcontrol,
+			       int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+
+	dev_dbg(cmpnt->dev, "name %s, event 0x%x\n", w->name, event);
+
+	return 0;
+}
+
+static int mtk_apll_event(struct snd_soc_dapm_widget *w,
+			  struct snd_kcontrol *kcontrol,
+			  int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+
+	dev_dbg(cmpnt->dev, "name %s, event 0x%x\n", w->name, event);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		if (strcmp(w->name, APLL1_W_NAME) == 0)
+			mt8196_apll1_enable(afe);
+		else
+			mt8196_apll2_enable(afe);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		if (strcmp(w->name, APLL1_W_NAME) == 0)
+			mt8196_apll1_disable(afe);
+		else
+			mt8196_apll2_disable(afe);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
+			     struct snd_kcontrol *kcontrol,
+			     int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mtk_afe_i2s_priv *i2s_priv;
+
+	dev_dbg(cmpnt->dev, "name %s, event 0x%x\n", w->name, event);
+
+	i2s_priv = get_i2s_priv_by_name(afe, w->name);
+
+	if (!i2s_priv)
+		return -EINVAL;
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		mt8196_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_rate);
+		break;
+	case SND_SOC_DAPM_POST_PMD:
+		i2s_priv->mclk_rate = 0;
+		mt8196_mck_disable(afe, i2s_priv->mclk_id);
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_dapm_widget mtk_dai_i2s_widgets[] = {
+	SND_SOC_DAPM_MIXER("I2SOUT0_CH1", SND_SOC_NOPM, 0, 0,
+			   mtk_i2sout0_ch1_mix,
+			   ARRAY_SIZE(mtk_i2sout0_ch1_mix)),
+	SND_SOC_DAPM_MIXER("I2SOUT0_CH2", SND_SOC_NOPM, 0, 0,
+			   mtk_i2sout0_ch2_mix,
+			   ARRAY_SIZE(mtk_i2sout0_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("I2SOUT1_CH1", SND_SOC_NOPM, 0, 0,
+			   mtk_i2sout1_ch1_mix,
+			   ARRAY_SIZE(mtk_i2sout1_ch1_mix)),
+	SND_SOC_DAPM_MIXER("I2SOUT1_CH2", SND_SOC_NOPM, 0, 0,
+			   mtk_i2sout1_ch2_mix,
+			   ARRAY_SIZE(mtk_i2sout1_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("I2SOUT2_CH1", SND_SOC_NOPM, 0, 0,
+			   mtk_i2sout2_ch1_mix,
+			   ARRAY_SIZE(mtk_i2sout2_ch1_mix)),
+	SND_SOC_DAPM_MIXER("I2SOUT2_CH2", SND_SOC_NOPM, 0, 0,
+			   mtk_i2sout2_ch2_mix,
+			   ARRAY_SIZE(mtk_i2sout2_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("I2SOUT3_CH1", SND_SOC_NOPM, 0, 0,
+			   mtk_i2sout3_ch1_mix,
+			   ARRAY_SIZE(mtk_i2sout3_ch1_mix)),
+	SND_SOC_DAPM_MIXER("I2SOUT3_CH2", SND_SOC_NOPM, 0, 0,
+			   mtk_i2sout3_ch2_mix,
+			   ARRAY_SIZE(mtk_i2sout3_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("I2SOUT4_CH1", SND_SOC_NOPM, 0, 0,
+			   mtk_i2sout4_ch1_mix,
+			   ARRAY_SIZE(mtk_i2sout4_ch1_mix)),
+	SND_SOC_DAPM_MIXER("I2SOUT4_CH2", SND_SOC_NOPM, 0, 0,
+			   mtk_i2sout4_ch2_mix,
+			   ARRAY_SIZE(mtk_i2sout4_ch2_mix)),
+	SND_SOC_DAPM_MIXER("I2SOUT4_CH3", SND_SOC_NOPM, 0, 0,
+			   mtk_i2sout4_ch3_mix,
+			   ARRAY_SIZE(mtk_i2sout4_ch3_mix)),
+	SND_SOC_DAPM_MIXER("I2SOUT4_CH4", SND_SOC_NOPM, 0, 0,
+			   mtk_i2sout4_ch4_mix,
+			   ARRAY_SIZE(mtk_i2sout4_ch4_mix)),
+	SND_SOC_DAPM_MIXER("I2SOUT4_CH5", SND_SOC_NOPM, 0, 0,
+			   mtk_i2sout4_ch5_mix,
+			   ARRAY_SIZE(mtk_i2sout4_ch5_mix)),
+	SND_SOC_DAPM_MIXER("I2SOUT4_CH6", SND_SOC_NOPM, 0, 0,
+			   mtk_i2sout4_ch6_mix,
+			   ARRAY_SIZE(mtk_i2sout4_ch6_mix)),
+	SND_SOC_DAPM_MIXER("I2SOUT4_CH7", SND_SOC_NOPM, 0, 0,
+			   mtk_i2sout4_ch7_mix,
+			   ARRAY_SIZE(mtk_i2sout4_ch7_mix)),
+	SND_SOC_DAPM_MIXER("I2SOUT4_CH8", SND_SOC_NOPM, 0, 0,
+			   mtk_i2sout4_ch8_mix,
+			   ARRAY_SIZE(mtk_i2sout4_ch8_mix)),
+
+	SND_SOC_DAPM_MIXER("I2SOUT6_CH1", SND_SOC_NOPM, 0, 0,
+			   mtk_i2sout6_ch1_mix,
+			   ARRAY_SIZE(mtk_i2sout6_ch1_mix)),
+	SND_SOC_DAPM_MIXER("I2SOUT6_CH2", SND_SOC_NOPM, 0, 0,
+			   mtk_i2sout6_ch2_mix,
+			   ARRAY_SIZE(mtk_i2sout6_ch2_mix)),
+
+	/* i2s en*/
+	SND_SOC_DAPM_SUPPLY_S("I2SIN0_EN", SUPPLY_SEQ_I2S_EN,
+			      ETDM_IN0_CON0, REG_ETDM_IN_EN_SFT, 0,
+			      NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("I2SIN1_EN", SUPPLY_SEQ_I2S_EN,
+			      ETDM_IN1_CON0, REG_ETDM_IN_EN_SFT, 0,
+			      NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("I2SIN2_EN", SUPPLY_SEQ_I2S_EN,
+			      ETDM_IN2_CON0, REG_ETDM_IN_EN_SFT, 0,
+			      NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("I2SIN3_EN", SUPPLY_SEQ_I2S_EN,
+			      ETDM_IN3_CON0, REG_ETDM_IN_EN_SFT, 0,
+			      NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("I2SIN4_EN", SUPPLY_SEQ_I2S_EN,
+			      ETDM_IN4_CON0, REG_ETDM_IN_EN_SFT, 0,
+			      NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("I2SIN6_EN", SUPPLY_SEQ_I2S_EN,
+			      ETDM_IN6_CON0, REG_ETDM_IN_EN_SFT, 0,
+			      NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("I2SOUT0_EN", SUPPLY_SEQ_I2S_EN,
+			      ETDM_OUT0_CON0, OUT_REG_ETDM_OUT_EN_SFT, 0,
+			      NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("I2SOUT1_EN", SUPPLY_SEQ_I2S_EN,
+			      ETDM_OUT1_CON0, OUT_REG_ETDM_OUT_EN_SFT, 0,
+			      NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("I2SOUT2_EN", SUPPLY_SEQ_I2S_EN,
+			      ETDM_OUT2_CON0, OUT_REG_ETDM_OUT_EN_SFT, 0,
+			      NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("I2SOUT3_EN", SUPPLY_SEQ_I2S_EN,
+			      ETDM_OUT3_CON0, OUT_REG_ETDM_OUT_EN_SFT, 0,
+			      NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("I2SOUT4_EN", SUPPLY_SEQ_I2S_EN,
+			      ETDM_OUT4_CON0, OUT_REG_ETDM_OUT_EN_SFT, 0,
+			      NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("I2SOUT6_EN", SUPPLY_SEQ_I2S_EN,
+			      ETDM_OUT6_CON0, OUT_REG_ETDM_OUT_EN_SFT, 0,
+			      NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("FMI2S_MASTER_EN", SUPPLY_SEQ_I2S_EN,
+			      AFE_CONNSYS_I2S_CON, I2S_EN_SFT, 0,
+			      NULL, 0),
+
+	/* i2s hd en */
+	SND_SOC_DAPM_SUPPLY_S(I2SIN0_HD_EN_W_NAME, SUPPLY_SEQ_I2S_HD_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_i2s_hd_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S(I2SIN1_HD_EN_W_NAME, SUPPLY_SEQ_I2S_HD_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_i2s_hd_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S(I2SIN2_HD_EN_W_NAME, SUPPLY_SEQ_I2S_HD_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_i2s_hd_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S(I2SIN3_HD_EN_W_NAME, SUPPLY_SEQ_I2S_HD_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_i2s_hd_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S(I2SIN4_HD_EN_W_NAME, SUPPLY_SEQ_I2S_HD_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_i2s_hd_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S(I2SIN6_HD_EN_W_NAME, SUPPLY_SEQ_I2S_HD_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_i2s_hd_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S(I2SOUT0_HD_EN_W_NAME, SUPPLY_SEQ_I2S_HD_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_i2s_hd_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S(I2SOUT1_HD_EN_W_NAME, SUPPLY_SEQ_I2S_HD_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_i2s_hd_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S(I2SOUT2_HD_EN_W_NAME, SUPPLY_SEQ_I2S_HD_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_i2s_hd_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S(I2SOUT3_HD_EN_W_NAME, SUPPLY_SEQ_I2S_HD_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_i2s_hd_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S(I2SOUT4_HD_EN_W_NAME, SUPPLY_SEQ_I2S_HD_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_i2s_hd_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S(I2SOUT6_HD_EN_W_NAME, SUPPLY_SEQ_I2S_HD_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_i2s_hd_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S(FMI2S_MASTER_HD_EN_W_NAME, SUPPLY_SEQ_I2S_HD_EN,
+			      AFE_CONNSYS_I2S_CON, I2S_HDEN_SFT, 0,
+			      mtk_i2s_hd_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	/* i2s mclk en */
+	SND_SOC_DAPM_SUPPLY_S(I2SIN0_MCLK_EN_W_NAME, SUPPLY_SEQ_I2S_MCLK_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_mclk_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S(I2SIN1_MCLK_EN_W_NAME, SUPPLY_SEQ_I2S_MCLK_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_mclk_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S(I2SIN2_MCLK_EN_W_NAME, SUPPLY_SEQ_I2S_MCLK_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_mclk_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S(I2SIN3_MCLK_EN_W_NAME, SUPPLY_SEQ_I2S_MCLK_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_mclk_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S(I2SIN4_MCLK_EN_W_NAME, SUPPLY_SEQ_I2S_MCLK_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_mclk_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S(I2SIN6_MCLK_EN_W_NAME, SUPPLY_SEQ_I2S_MCLK_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_mclk_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S(I2SOUT0_MCLK_EN_W_NAME, SUPPLY_SEQ_I2S_MCLK_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_mclk_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S(I2SOUT1_MCLK_EN_W_NAME, SUPPLY_SEQ_I2S_MCLK_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_mclk_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S(I2SOUT2_MCLK_EN_W_NAME, SUPPLY_SEQ_I2S_MCLK_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_mclk_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S(I2SOUT3_MCLK_EN_W_NAME, SUPPLY_SEQ_I2S_MCLK_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_mclk_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S(I2SOUT4_MCLK_EN_W_NAME, SUPPLY_SEQ_I2S_MCLK_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_mclk_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S(I2SOUT6_MCLK_EN_W_NAME, SUPPLY_SEQ_I2S_MCLK_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_mclk_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S(FMI2S_MASTER_MCLK_EN_W_NAME, SUPPLY_SEQ_I2S_MCLK_EN,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_mclk_en_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	/* cg */
+	SND_SOC_DAPM_SUPPLY_S("I2SOUT0_CG", SUPPLY_SEQ_I2S_CG_EN,
+			      AUDIO_TOP_CON2, PDN_ETDM_OUT0_SFT, 1,
+			      NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("I2SOUT1_CG", SUPPLY_SEQ_I2S_CG_EN,
+			      AUDIO_TOP_CON2, PDN_ETDM_OUT1_SFT, 1,
+			      NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("I2SOUT2_CG", SUPPLY_SEQ_I2S_CG_EN,
+			      AUDIO_TOP_CON2, PDN_ETDM_OUT2_SFT, 1,
+			      NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("I2SOUT3_CG", SUPPLY_SEQ_I2S_CG_EN,
+			      AUDIO_TOP_CON2, PDN_ETDM_OUT3_SFT, 1,
+			      NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("I2SOUT4_CG", SUPPLY_SEQ_I2S_CG_EN,
+			      AUDIO_TOP_CON2, PDN_ETDM_OUT4_SFT, 1,
+			      NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("I2SOUT6_CG", SUPPLY_SEQ_I2S_CG_EN,
+			      AUDIO_TOP_CON2, PDN_ETDM_OUT6_SFT, 1,
+			      NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("I2SIN0_CG", SUPPLY_SEQ_I2S_CG_EN,
+			      AUDIO_TOP_CON2, PDN_ETDM_IN0_SFT, 1,
+			      NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("I2SIN1_CG", SUPPLY_SEQ_I2S_CG_EN,
+			      AUDIO_TOP_CON2, PDN_ETDM_IN1_SFT, 1,
+			      NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("I2SIN2_CG", SUPPLY_SEQ_I2S_CG_EN,
+			      AUDIO_TOP_CON2, PDN_ETDM_IN2_SFT, 1,
+			      NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("I2SIN3_CG", SUPPLY_SEQ_I2S_CG_EN,
+			      AUDIO_TOP_CON2, PDN_ETDM_IN3_SFT, 1,
+			      NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("I2SIN4_CG", SUPPLY_SEQ_I2S_CG_EN,
+			      AUDIO_TOP_CON2, PDN_ETDM_IN4_SFT, 1,
+			      NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("I2SIN6_CG", SUPPLY_SEQ_I2S_CG_EN,
+			      AUDIO_TOP_CON2, PDN_ETDM_IN6_SFT, 1,
+			      NULL, 0),
+	SND_SOC_DAPM_SUPPLY_S("FMI2S_MASTER_CG", SUPPLY_SEQ_I2S_CG_EN,
+			      AUDIO_TOP_CON0, PDN_FM_I2S_SFT, 1,
+			      NULL, 0),
+
+	/* apll */
+	SND_SOC_DAPM_SUPPLY_S(APLL1_W_NAME, SUPPLY_SEQ_APLL,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_apll_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+	SND_SOC_DAPM_SUPPLY_S(APLL2_W_NAME, SUPPLY_SEQ_APLL,
+			      SND_SOC_NOPM, 0, 0,
+			      mtk_apll_event,
+			      SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PMD),
+
+	/* allow i2s on without codec on */
+	SND_SOC_DAPM_OUTPUT("I2S_DUMMY_OUT"),
+	SND_SOC_DAPM_MUX("I2S_OUT0_Mux",
+			 SND_SOC_NOPM, 0, 0, &i2s_out0_mux_control),
+	SND_SOC_DAPM_MUX("I2S_OUT1_Mux",
+			 SND_SOC_NOPM, 0, 0, &i2s_out1_mux_control),
+	SND_SOC_DAPM_MUX("I2S_OUT2_Mux",
+			 SND_SOC_NOPM, 0, 0, &i2s_out2_mux_control),
+	SND_SOC_DAPM_MUX("I2S_OUT3_Mux",
+			 SND_SOC_NOPM, 0, 0, &i2s_out3_mux_control),
+	SND_SOC_DAPM_MUX("I2S_OUT4_Mux",
+			 SND_SOC_NOPM, 0, 0, &i2s_out4_mux_control),
+	SND_SOC_DAPM_MUX("I2S_OUT6_Mux",
+			 SND_SOC_NOPM, 0, 0, &i2s_out6_mux_control),
+
+	SND_SOC_DAPM_INPUT("I2S_DUMMY_IN"),
+	SND_SOC_DAPM_MUX("I2S_IN0_Mux",
+			 SND_SOC_NOPM, 0, 0, &i2s_in0_mux_control),
+	SND_SOC_DAPM_MUX("I2S_IN1_Mux",
+			 SND_SOC_NOPM, 0, 0, &i2s_in1_mux_control),
+	SND_SOC_DAPM_MUX("I2S_IN2_Mux",
+			 SND_SOC_NOPM, 0, 0, &i2s_in2_mux_control),
+	SND_SOC_DAPM_MUX("I2S_IN3_Mux",
+			 SND_SOC_NOPM, 0, 0, &i2s_in3_mux_control),
+	SND_SOC_DAPM_MUX("I2S_IN4_Mux",
+			 SND_SOC_NOPM, 0, 0, &i2s_in4_mux_control),
+	SND_SOC_DAPM_MUX("I2S_IN6_Mux",
+			 SND_SOC_NOPM, 0, 0, &i2s_in6_mux_control),
+
+	SND_SOC_DAPM_MIXER("SOF_DMA_DL_24CH", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("SOF_DMA_DL1", SND_SOC_NOPM, 0, 0, NULL, 0),
+};
+
+static int mtk_afe_i2s_share_connect(struct snd_soc_dapm_widget *source,
+				     struct snd_soc_dapm_widget *sink)
+{
+	struct snd_soc_dapm_widget *w = sink;
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mtk_afe_i2s_priv *i2s_priv;
+	int ret = 0;
+
+	i2s_priv = get_i2s_priv_by_name(afe, sink->name);
+
+	if (!i2s_priv)
+		return 0;
+
+	if (i2s_priv->share_i2s_id < 0)
+		return 0;
+
+	ret = (i2s_priv->share_i2s_id == get_i2s_id_by_name(afe, source->name)) ? 1 : 0;
+
+	return ret;
+}
+
+static int mtk_afe_i2s_hd_connect(struct snd_soc_dapm_widget *source,
+				  struct snd_soc_dapm_widget *sink)
+{
+	struct snd_soc_dapm_widget *w = sink;
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mtk_afe_i2s_priv *i2s_priv;
+	int i2s_num;
+
+	i2s_priv = get_i2s_priv_by_name(afe, sink->name);
+
+	if (!i2s_priv)
+		return 0;
+
+	i2s_num = get_i2s_id_by_name(afe, source->name);
+	if (get_i2s_id_by_name(afe, sink->name) == i2s_num)
+		return !mtk_is_i2s_low_power(i2s_num) ||
+		       i2s_priv->low_jitter_en;
+
+	/* check if share i2s need hd en */
+	if (i2s_priv->share_i2s_id < 0)
+		return 0;
+
+	if (i2s_priv->share_i2s_id == i2s_num)
+		return !mtk_is_i2s_low_power(i2s_num) ||
+		       i2s_priv->low_jitter_en;
+
+	return 0;
+}
+
+static int mtk_afe_i2s_apll_connect(struct snd_soc_dapm_widget *source,
+				    struct snd_soc_dapm_widget *sink)
+{
+	struct snd_soc_dapm_widget *w = sink;
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mtk_afe_i2s_priv *i2s_priv;
+	int cur_apll;
+	int i2s_need_apll;
+
+	i2s_priv = get_i2s_priv_by_name(afe, w->name);
+
+	if (!i2s_priv)
+		return 0;
+
+	/* which apll */
+	cur_apll = mt8196_get_apll_by_name(afe, source->name);
+
+	/* choose APLL from i2s rate */
+	i2s_need_apll = mt8196_get_apll_by_rate(afe, i2s_priv->rate);
+
+	return (i2s_need_apll == cur_apll) ? 1 : 0;
+}
+
+static int mtk_afe_i2s_mclk_connect(struct snd_soc_dapm_widget *source,
+				    struct snd_soc_dapm_widget *sink)
+{
+	struct snd_soc_dapm_widget *w = sink;
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mtk_afe_i2s_priv *i2s_priv;
+
+	i2s_priv = get_i2s_priv_by_name(afe, sink->name);
+
+	if (!i2s_priv)
+		return 0;
+
+	if (get_i2s_id_by_name(afe, sink->name) ==
+	    get_i2s_id_by_name(afe, source->name))
+		return (i2s_priv->mclk_rate > 0) ? 1 : 0;
+
+	/* check if share i2s need mclk */
+	if (i2s_priv->share_i2s_id < 0)
+		return 0;
+
+	if (i2s_priv->share_i2s_id == get_i2s_id_by_name(afe, source->name))
+		return (i2s_priv->mclk_rate > 0) ? 1 : 0;
+
+	return 0;
+}
+
+static int mtk_afe_mclk_apll_connect(struct snd_soc_dapm_widget *source,
+				     struct snd_soc_dapm_widget *sink)
+{
+	struct snd_soc_dapm_widget *w = sink;
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mtk_afe_i2s_priv *i2s_priv;
+	int cur_apll;
+
+	i2s_priv = get_i2s_priv_by_name(afe, w->name);
+
+	if (!i2s_priv)
+		return 0;
+
+	/* which apll */
+	cur_apll = mt8196_get_apll_by_name(afe, source->name);
+
+	return (i2s_priv->mclk_apll == cur_apll) ? 1 : 0;
+}
+
+static const struct snd_soc_dapm_route mtk_dai_i2s_routes[] = {
+	/* i2sin0 */
+	{"I2SIN0", NULL, "I2SIN0_EN"},
+	{"I2SIN0", NULL, "I2SIN1_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN0", NULL, "I2SIN2_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN0", NULL, "I2SIN3_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN0", NULL, "I2SIN4_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN0", NULL, "I2SIN6_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN0", NULL, "I2SOUT0_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN0", NULL, "I2SOUT1_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN0", NULL, "I2SOUT2_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN0", NULL, "I2SOUT3_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN0", NULL, "I2SOUT4_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN0", NULL, "I2SOUT6_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN0", NULL, "FMI2S_MASTER_EN", mtk_afe_i2s_share_connect},
+
+	{"I2SIN0", NULL, I2SIN0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN0", NULL, I2SIN1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN0", NULL, I2SIN2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN0", NULL, I2SIN3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN0", NULL, I2SIN4_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN0", NULL, I2SIN6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN0", NULL, I2SOUT0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN0", NULL, I2SOUT1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN0", NULL, I2SOUT2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN0", NULL, I2SOUT3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN0", NULL, I2SOUT4_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN0", NULL, I2SOUT6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN0", NULL, FMI2S_MASTER_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{I2SIN0_HD_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_i2s_apll_connect},
+	{I2SIN0_HD_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_i2s_apll_connect},
+
+	{"I2SIN0", NULL, I2SIN0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN0", NULL, I2SIN1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN0", NULL, I2SIN2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN0", NULL, I2SIN3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN0", NULL, I2SIN4_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN0", NULL, I2SIN6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN0", NULL, I2SOUT0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN0", NULL, I2SOUT1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN0", NULL, I2SOUT2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN0", NULL, I2SOUT3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN0", NULL, I2SOUT4_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN0", NULL, I2SOUT6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN0", NULL, FMI2S_MASTER_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{I2SIN0_MCLK_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_mclk_apll_connect},
+	{I2SIN0_MCLK_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_mclk_apll_connect},
+	{"I2SIN0", NULL, "I2SIN0_CG"},
+
+	/* i2sin1 */
+	{"I2SIN1", NULL, "I2SIN0_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN1", NULL, "I2SIN1_EN"},
+	{"I2SIN1", NULL, "I2SIN2_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN1", NULL, "I2SIN3_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN1", NULL, "I2SIN4_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN1", NULL, "I2SIN6_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN1", NULL, "I2SOUT0_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN1", NULL, "I2SOUT1_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN1", NULL, "I2SOUT2_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN1", NULL, "I2SOUT3_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN1", NULL, "I2SOUT4_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN1", NULL, "I2SOUT6_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN1", NULL, "FMI2S_MASTER_EN", mtk_afe_i2s_share_connect},
+
+	{"I2SIN1", NULL, I2SIN0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN1", NULL, I2SIN1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN1", NULL, I2SIN2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN1", NULL, I2SIN3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN1", NULL, I2SIN4_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN1", NULL, I2SIN6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN1", NULL, I2SOUT0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN1", NULL, I2SOUT1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN1", NULL, I2SOUT2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN1", NULL, I2SOUT3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN1", NULL, I2SOUT4_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN1", NULL, I2SOUT6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN1", NULL, FMI2S_MASTER_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{I2SIN1_HD_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_i2s_apll_connect},
+	{I2SIN1_HD_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_i2s_apll_connect},
+
+	{"I2SIN1", NULL, I2SIN0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN1", NULL, I2SIN1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN1", NULL, I2SIN2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN1", NULL, I2SIN3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN1", NULL, I2SIN4_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN1", NULL, I2SIN6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN1", NULL, I2SOUT0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN1", NULL, I2SOUT1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN1", NULL, I2SOUT2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN1", NULL, I2SOUT3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN1", NULL, I2SOUT4_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN1", NULL, I2SOUT6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN1", NULL, FMI2S_MASTER_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{I2SIN1_MCLK_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_mclk_apll_connect},
+	{I2SIN1_MCLK_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_mclk_apll_connect},
+	{"I2SIN1", NULL, "I2SIN1_CG"},
+
+	/* i2sin2 */
+	{"I2SIN2", NULL, "I2SIN0_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN2", NULL, "I2SIN1_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN2", NULL, "I2SIN2_EN"},
+	{"I2SIN2", NULL, "I2SIN3_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN2", NULL, "I2SIN4_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN2", NULL, "I2SIN6_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN2", NULL, "I2SOUT0_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN2", NULL, "I2SOUT1_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN2", NULL, "I2SOUT2_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN2", NULL, "I2SOUT3_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN2", NULL, "I2SOUT4_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN2", NULL, "I2SOUT6_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN2", NULL, "FMI2S_MASTER_EN", mtk_afe_i2s_share_connect},
+
+	{"I2SIN2", NULL, I2SIN0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN2", NULL, I2SIN1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN2", NULL, I2SIN2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN2", NULL, I2SIN3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN2", NULL, I2SIN4_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN2", NULL, I2SIN6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN2", NULL, I2SOUT0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN2", NULL, I2SOUT1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN2", NULL, I2SOUT2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN2", NULL, I2SOUT3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN2", NULL, I2SOUT4_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN2", NULL, I2SOUT6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN2", NULL, FMI2S_MASTER_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{I2SIN2_HD_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_i2s_apll_connect},
+	{I2SIN2_HD_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_i2s_apll_connect},
+
+	{"I2SIN2", NULL, I2SIN0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN2", NULL, I2SIN1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN2", NULL, I2SIN2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN2", NULL, I2SIN3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN2", NULL, I2SIN4_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN2", NULL, I2SIN6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN2", NULL, I2SOUT0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN2", NULL, I2SOUT1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN2", NULL, I2SOUT2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN2", NULL, I2SOUT3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN2", NULL, I2SOUT4_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN2", NULL, I2SOUT6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN2", NULL, FMI2S_MASTER_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{I2SIN2_MCLK_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_mclk_apll_connect},
+	{I2SIN2_MCLK_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_mclk_apll_connect},
+	{"I2SIN2", NULL, "I2SIN2_CG"},
+
+	/* i2sin3 */
+	{"I2SIN3", NULL, "I2SIN0_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN3", NULL, "I2SIN1_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN3", NULL, "I2SIN2_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN3", NULL, "I2SIN3_EN"},
+	{"I2SIN3", NULL, "I2SIN4_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN3", NULL, "I2SIN6_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN3", NULL, "I2SOUT0_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN3", NULL, "I2SOUT1_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN3", NULL, "I2SOUT2_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN3", NULL, "I2SOUT3_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN3", NULL, "I2SOUT4_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN3", NULL, "I2SOUT6_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN3", NULL, "FMI2S_MASTER_EN", mtk_afe_i2s_share_connect},
+
+	{"I2SIN3", NULL, I2SIN0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN3", NULL, I2SIN1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN3", NULL, I2SIN2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN3", NULL, I2SIN3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN3", NULL, I2SIN4_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN3", NULL, I2SIN6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN3", NULL, I2SOUT0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN3", NULL, I2SOUT1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN3", NULL, I2SOUT2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN3", NULL, I2SOUT3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN3", NULL, I2SOUT4_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN3", NULL, I2SOUT6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN3", NULL, FMI2S_MASTER_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{I2SIN3_HD_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_i2s_apll_connect},
+	{I2SIN3_HD_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_i2s_apll_connect},
+
+	{"I2SIN3", NULL, I2SIN0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN3", NULL, I2SIN1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN3", NULL, I2SIN2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN3", NULL, I2SIN3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN3", NULL, I2SIN4_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN3", NULL, I2SIN6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN3", NULL, I2SOUT0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN3", NULL, I2SOUT1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN3", NULL, I2SOUT2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN3", NULL, I2SOUT3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN3", NULL, I2SOUT4_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN3", NULL, I2SOUT6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN3", NULL, FMI2S_MASTER_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{I2SIN3_MCLK_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_mclk_apll_connect},
+	{I2SIN3_MCLK_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_mclk_apll_connect},
+	{"I2SIN3", NULL, "I2SIN3_CG"},
+
+	/* i2sin4 */
+	{"I2SIN4", NULL, "I2SIN0_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN4", NULL, "I2SIN1_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN4", NULL, "I2SIN2_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN4", NULL, "I2SIN3_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN4", NULL, "I2SIN4_EN"},
+	{"I2SIN4", NULL, "I2SIN6_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN4", NULL, "I2SOUT0_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN4", NULL, "I2SOUT1_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN4", NULL, "I2SOUT2_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN4", NULL, "I2SOUT3_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN4", NULL, "I2SOUT4_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN4", NULL, "I2SOUT6_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN4", NULL, "FMI2S_MASTER_EN", mtk_afe_i2s_share_connect},
+
+	{"I2SIN4", NULL, I2SIN0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN4", NULL, I2SIN1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN4", NULL, I2SIN2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN4", NULL, I2SIN3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN4", NULL, I2SIN4_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN4", NULL, I2SIN6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN4", NULL, I2SOUT0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN4", NULL, I2SOUT1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN4", NULL, I2SOUT2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN4", NULL, I2SOUT3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN4", NULL, I2SOUT4_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN4", NULL, I2SOUT6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN4", NULL, FMI2S_MASTER_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{I2SIN4_HD_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_i2s_apll_connect},
+	{I2SIN4_HD_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_i2s_apll_connect},
+
+	{"I2SIN4", NULL, I2SIN0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN4", NULL, I2SIN1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN4", NULL, I2SIN2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN4", NULL, I2SIN3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN4", NULL, I2SIN4_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN4", NULL, I2SIN6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN4", NULL, I2SOUT0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN4", NULL, I2SOUT1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN4", NULL, I2SOUT2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN4", NULL, I2SOUT3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN4", NULL, I2SOUT4_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN4", NULL, I2SOUT6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN4", NULL, FMI2S_MASTER_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{I2SIN4_MCLK_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_mclk_apll_connect},
+	{I2SIN4_MCLK_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_mclk_apll_connect},
+	{"I2SIN4", NULL, "I2SIN4_CG"},
+
+	/* i2sin6 */
+	{"I2SIN6", NULL, "I2SIN0_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN6", NULL, "I2SIN1_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN6", NULL, "I2SIN2_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN6", NULL, "I2SIN3_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN6", NULL, "I2SIN4_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN6", NULL, "I2SIN6_EN"},
+	{"I2SIN6", NULL, "I2SOUT0_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN6", NULL, "I2SOUT1_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN6", NULL, "I2SOUT2_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN6", NULL, "I2SOUT3_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN6", NULL, "I2SOUT4_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN6", NULL, "I2SOUT6_EN", mtk_afe_i2s_share_connect},
+	{"I2SIN6", NULL, "FMI2S_MASTER_EN", mtk_afe_i2s_share_connect},
+
+	{"I2SIN6", NULL, I2SIN0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN6", NULL, I2SIN1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN6", NULL, I2SIN2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN6", NULL, I2SIN3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN6", NULL, I2SIN4_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN6", NULL, I2SIN6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN6", NULL, I2SOUT0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN6", NULL, I2SOUT1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN6", NULL, I2SOUT2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN6", NULL, I2SOUT3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN6", NULL, I2SOUT4_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN6", NULL, I2SOUT6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SIN6", NULL, FMI2S_MASTER_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{I2SIN6_HD_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_i2s_apll_connect},
+	{I2SIN6_HD_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_i2s_apll_connect},
+
+	{"I2SIN6", NULL, I2SIN0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN6", NULL, I2SIN1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN6", NULL, I2SIN2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN6", NULL, I2SIN3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN6", NULL, I2SIN4_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN6", NULL, I2SIN6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN6", NULL, I2SOUT0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN6", NULL, I2SOUT1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN6", NULL, I2SOUT2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN6", NULL, I2SOUT3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN6", NULL, I2SOUT4_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN6", NULL, I2SOUT6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SIN6", NULL, FMI2S_MASTER_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{I2SIN6_MCLK_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_mclk_apll_connect},
+	{I2SIN6_MCLK_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_mclk_apll_connect},
+	{"I2SIN6", NULL, "I2SIN6_CG"},
+	{"I2SIN6", NULL, "I2SOUT6_CG"},
+
+	/* i2sout0 */
+	{"I2SOUT0_CH1", "DL0_CH1", "DL0"},
+	{"I2SOUT0_CH2", "DL0_CH2", "DL0"},
+	{"I2SOUT0_CH1", "DL1_CH1", "DL1"},
+	{"I2SOUT0_CH2", "DL1_CH2", "DL1"},
+	{"I2SOUT0_CH1", "DL2_CH1", "DL2"},
+	{"I2SOUT0_CH2", "DL2_CH2", "DL2"},
+	{"I2SOUT0_CH1", "DL3_CH1", "DL3"},
+	{"I2SOUT0_CH2", "DL3_CH2", "DL3"},
+	{"I2SOUT0_CH1", "DL4_CH1", "DL4"},
+	{"I2SOUT0_CH2", "DL4_CH2", "DL4"},
+	{"I2SOUT0_CH1", "DL5_CH1", "DL5"},
+	{"I2SOUT0_CH2", "DL5_CH2", "DL5"},
+	{"I2SOUT0_CH1", "DL6_CH1", "DL6"},
+	{"I2SOUT0_CH2", "DL6_CH2", "DL6"},
+	{"I2SOUT0_CH1", "DL7_CH1", "DL7"},
+	{"I2SOUT0_CH2", "DL7_CH2", "DL7"},
+	{"I2SOUT0_CH1", "DL8_CH1", "DL8"},
+	{"I2SOUT0_CH2", "DL8_CH2", "DL8"},
+	{"I2SOUT0_CH1", "DL23_CH1", "DL23"},
+	{"I2SOUT0_CH2", "DL23_CH2", "DL23"},
+	{"I2SOUT0_CH1", "DL_24CH_CH1", "DL_24CH"},
+	{"I2SOUT0_CH2", "DL_24CH_CH2", "DL_24CH"},
+
+	{"I2SOUT0_CH1", "DL24_CH1", "DL24"},
+	{"I2SOUT0_CH2", "DL24_CH2", "DL24"},
+
+	{"I2SOUT0", NULL, "I2SOUT0_CH1"},
+	{"I2SOUT0", NULL, "I2SOUT0_CH2"},
+
+	{"I2SOUT0", NULL, "I2SIN0_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT0", NULL, "I2SIN1_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT0", NULL, "I2SIN2_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT0", NULL, "I2SIN3_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT0", NULL, "I2SIN4_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT0", NULL, "I2SIN6_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT0", NULL, "I2SOUT0_EN"},
+	{"I2SOUT0", NULL, "I2SOUT1_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT0", NULL, "I2SOUT2_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT0", NULL, "I2SOUT3_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT0", NULL, "I2SOUT4_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT0", NULL, "I2SOUT6_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT0", NULL, "FMI2S_MASTER_EN", mtk_afe_i2s_share_connect},
+
+	{"I2SOUT0", NULL, I2SIN0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT0", NULL, I2SIN1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT0", NULL, I2SIN2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT0", NULL, I2SIN3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT0", NULL, I2SIN4_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT0", NULL, I2SIN6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT0", NULL, I2SOUT0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT0", NULL, I2SOUT1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT0", NULL, I2SOUT2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT0", NULL, I2SOUT3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT0", NULL, I2SOUT4_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT0", NULL, I2SOUT6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT0", NULL, FMI2S_MASTER_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{I2SOUT0_HD_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_i2s_apll_connect},
+	{I2SOUT0_HD_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_i2s_apll_connect},
+
+	{"I2SOUT0", NULL, I2SIN0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT0", NULL, I2SIN1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT0", NULL, I2SIN2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT0", NULL, I2SIN3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT0", NULL, I2SIN4_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT0", NULL, I2SIN6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT0", NULL, I2SOUT0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT0", NULL, I2SOUT1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT0", NULL, I2SOUT2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT0", NULL, I2SOUT3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT0", NULL, I2SOUT4_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT0", NULL, I2SOUT6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT0", NULL, FMI2S_MASTER_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{I2SOUT0_MCLK_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_mclk_apll_connect},
+	{I2SOUT0_MCLK_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_mclk_apll_connect},
+	{"I2SOUT0", NULL, "I2SOUT0_CG"},
+	{"I2SOUT0", NULL, "I2SIN0_CG"},
+
+	/* i2sout1 */
+	{"I2SOUT1_CH1", "DL0_CH1", "DL0"},
+	{"I2SOUT1_CH2", "DL0_CH2", "DL0"},
+	{"I2SOUT1_CH1", "DL1_CH1", "DL1"},
+	{"I2SOUT1_CH2", "DL1_CH2", "DL1"},
+	{"I2SOUT1_CH1", "DL2_CH1", "DL2"},
+	{"I2SOUT1_CH2", "DL2_CH2", "DL2"},
+	{"I2SOUT1_CH1", "DL3_CH1", "DL3"},
+	{"I2SOUT1_CH2", "DL3_CH2", "DL3"},
+	{"I2SOUT1_CH1", "DL4_CH1", "DL4"},
+	{"I2SOUT1_CH2", "DL4_CH2", "DL4"},
+	{"I2SOUT1_CH1", "DL5_CH1", "DL5"},
+	{"I2SOUT1_CH2", "DL5_CH2", "DL5"},
+	{"I2SOUT1_CH1", "DL6_CH1", "DL6"},
+	{"I2SOUT1_CH2", "DL6_CH2", "DL6"},
+	{"I2SOUT1_CH1", "DL7_CH1", "DL7"},
+	{"I2SOUT1_CH2", "DL7_CH2", "DL7"},
+	{"I2SOUT1_CH1", "DL8_CH1", "DL8"},
+	{"I2SOUT1_CH2", "DL8_CH2", "DL8"},
+	{"I2SOUT1_CH1", "DL_24CH_CH1", "DL_24CH"},
+	{"I2SOUT1_CH2", "DL_24CH_CH2", "DL_24CH"},
+
+	{"I2SOUT1", NULL, "I2SOUT1_CH1"},
+	{"I2SOUT1", NULL, "I2SOUT1_CH2"},
+
+	{"I2SOUT1", NULL, "I2SIN0_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT1", NULL, "I2SIN1_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT1", NULL, "I2SIN2_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT1", NULL, "I2SIN3_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT1", NULL, "I2SIN4_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT1", NULL, "I2SIN6_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT1", NULL, "I2SOUT0_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT1", NULL, "I2SOUT1_EN"},
+	{"I2SOUT1", NULL, "I2SOUT2_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT1", NULL, "I2SOUT3_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT1", NULL, "I2SOUT4_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT1", NULL, "I2SOUT6_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT1", NULL, "FMI2S_MASTER_EN", mtk_afe_i2s_share_connect},
+
+	{"I2SOUT1", NULL, I2SIN0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT1", NULL, I2SIN1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT1", NULL, I2SIN2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT1", NULL, I2SIN3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT1", NULL, I2SIN4_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT1", NULL, I2SIN6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT1", NULL, I2SOUT0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT1", NULL, I2SOUT1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT1", NULL, I2SOUT2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT1", NULL, I2SOUT3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT1", NULL, I2SOUT4_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT1", NULL, I2SOUT6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT1", NULL, FMI2S_MASTER_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{I2SOUT1_HD_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_i2s_apll_connect},
+	{I2SOUT1_HD_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_i2s_apll_connect},
+
+	{"I2SOUT1", NULL, I2SIN0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT1", NULL, I2SIN1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT1", NULL, I2SIN2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT1", NULL, I2SIN3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT1", NULL, I2SIN4_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT1", NULL, I2SIN6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT1", NULL, I2SOUT0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT1", NULL, I2SOUT1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT1", NULL, I2SOUT2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT1", NULL, I2SOUT3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT1", NULL, I2SOUT4_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT1", NULL, I2SOUT6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT1", NULL, FMI2S_MASTER_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{I2SOUT1_MCLK_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_mclk_apll_connect},
+	{I2SOUT1_MCLK_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_mclk_apll_connect},
+	{"I2SOUT1", NULL, "I2SOUT1_CG"},
+	{"I2SOUT1", NULL, "I2SIN1_CG"},
+
+	/* i2sout2 */
+	{"I2SOUT2_CH1", "DL0_CH1", "DL0"},
+	{"I2SOUT2_CH2", "DL0_CH2", "DL0"},
+	{"I2SOUT2_CH1", "DL1_CH1", "DL1"},
+	{"I2SOUT2_CH2", "DL1_CH2", "DL1"},
+	{"I2SOUT2_CH1", "DL2_CH1", "DL2"},
+	{"I2SOUT2_CH2", "DL2_CH2", "DL2"},
+	{"I2SOUT2_CH1", "DL3_CH1", "DL3"},
+	{"I2SOUT2_CH2", "DL3_CH2", "DL3"},
+	{"I2SOUT2_CH1", "DL4_CH1", "DL4"},
+	{"I2SOUT2_CH2", "DL4_CH2", "DL4"},
+	{"I2SOUT2_CH1", "DL5_CH1", "DL5"},
+	{"I2SOUT2_CH2", "DL5_CH2", "DL5"},
+	{"I2SOUT2_CH1", "DL6_CH1", "DL6"},
+	{"I2SOUT2_CH2", "DL6_CH2", "DL6"},
+	{"I2SOUT2_CH1", "DL7_CH1", "DL7"},
+	{"I2SOUT2_CH2", "DL7_CH2", "DL7"},
+	{"I2SOUT2_CH1", "DL8_CH1", "DL8"},
+	{"I2SOUT2_CH2", "DL8_CH2", "DL8"},
+	{"I2SOUT2_CH1", "DL_24CH_CH1", "DL_24CH"},
+	{"I2SOUT2_CH2", "DL_24CH_CH2", "DL_24CH"},
+
+	{"I2SOUT2", NULL, "I2SOUT2_CH1"},
+	{"I2SOUT2", NULL, "I2SOUT2_CH2"},
+
+	{"I2SOUT2", NULL, "I2SIN0_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT2", NULL, "I2SIN1_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT2", NULL, "I2SIN2_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT2", NULL, "I2SIN3_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT2", NULL, "I2SIN4_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT2", NULL, "I2SIN6_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT2", NULL, "I2SOUT0_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT2", NULL, "I2SOUT1_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT2", NULL, "I2SOUT2_EN"},
+	{"I2SOUT2", NULL, "I2SOUT3_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT2", NULL, "I2SOUT4_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT2", NULL, "I2SOUT6_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT2", NULL, "FMI2S_MASTER_EN", mtk_afe_i2s_share_connect},
+
+	{"I2SOUT2", NULL, I2SIN0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT2", NULL, I2SIN1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT2", NULL, I2SIN2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT2", NULL, I2SIN3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT2", NULL, I2SIN4_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT2", NULL, I2SIN6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT2", NULL, I2SOUT0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT2", NULL, I2SOUT1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT2", NULL, I2SOUT2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT2", NULL, I2SOUT3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT2", NULL, I2SOUT4_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT2", NULL, I2SOUT6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT2", NULL, FMI2S_MASTER_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{I2SOUT2_HD_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_i2s_apll_connect},
+	{I2SOUT2_HD_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_i2s_apll_connect},
+
+	{"I2SOUT2", NULL, I2SIN0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT2", NULL, I2SIN1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT2", NULL, I2SIN2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT2", NULL, I2SIN3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT2", NULL, I2SIN4_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT2", NULL, I2SIN6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT2", NULL, I2SOUT0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT2", NULL, I2SOUT1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT2", NULL, I2SOUT2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT2", NULL, I2SOUT3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT2", NULL, I2SOUT4_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT2", NULL, I2SOUT6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT2", NULL, FMI2S_MASTER_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{I2SOUT2_MCLK_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_mclk_apll_connect},
+	{I2SOUT2_MCLK_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_mclk_apll_connect},
+	{"I2SOUT2", NULL, "I2SOUT2_CG"},
+	{"I2SOUT2", NULL, "I2SIN2_CG"},
+
+	/* i2sout3 */
+	{"I2SOUT3_CH1", "DL0_CH1", "DL0"},
+	{"I2SOUT3_CH2", "DL0_CH2", "DL0"},
+	{"I2SOUT3_CH1", "DL1_CH1", "DL1"},
+	{"I2SOUT3_CH2", "DL1_CH2", "DL1"},
+	{"I2SOUT3_CH1", "DL2_CH1", "DL2"},
+	{"I2SOUT3_CH2", "DL2_CH2", "DL2"},
+	{"I2SOUT3_CH1", "DL3_CH1", "DL3"},
+	{"I2SOUT3_CH2", "DL3_CH2", "DL3"},
+	{"I2SOUT3_CH1", "DL4_CH1", "DL4"},
+	{"I2SOUT3_CH2", "DL4_CH2", "DL4"},
+	{"I2SOUT3_CH1", "DL5_CH1", "DL5"},
+	{"I2SOUT3_CH2", "DL5_CH2", "DL5"},
+	{"I2SOUT3_CH1", "DL6_CH1", "DL6"},
+	{"I2SOUT3_CH2", "DL6_CH2", "DL6"},
+	{"I2SOUT3_CH1", "DL7_CH1", "DL7"},
+	{"I2SOUT3_CH2", "DL7_CH2", "DL7"},
+	{"I2SOUT3_CH1", "DL8_CH1", "DL8"},
+	{"I2SOUT3_CH2", "DL8_CH2", "DL8"},
+	{"I2SOUT3_CH1", "DL_24CH_CH1", "DL_24CH"},
+	{"I2SOUT3_CH2", "DL_24CH_CH2", "DL_24CH"},
+
+	{"I2SOUT3", NULL, "I2SOUT3_CH1"},
+	{"I2SOUT3", NULL, "I2SOUT3_CH2"},
+
+	{"I2SOUT3", NULL, "I2SIN0_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT3", NULL, "I2SIN1_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT3", NULL, "I2SIN2_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT3", NULL, "I2SIN3_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT3", NULL, "I2SIN4_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT3", NULL, "I2SIN6_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT3", NULL, "I2SOUT0_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT3", NULL, "I2SOUT1_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT3", NULL, "I2SOUT2_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT3", NULL, "I2SOUT3_EN"},
+	{"I2SOUT3", NULL, "I2SOUT4_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT3", NULL, "I2SOUT6_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT3", NULL, "FMI2S_MASTER_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT3", NULL, I2SIN0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT3", NULL, I2SIN1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT3", NULL, I2SIN2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT3", NULL, I2SIN3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT3", NULL, I2SIN4_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT3", NULL, I2SIN6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT3", NULL, I2SOUT0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT3", NULL, I2SOUT1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT3", NULL, I2SOUT2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT3", NULL, I2SOUT3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT3", NULL, I2SOUT4_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT3", NULL, I2SOUT6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT3", NULL, FMI2S_MASTER_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{I2SOUT3_HD_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_i2s_apll_connect},
+	{I2SOUT3_HD_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_i2s_apll_connect},
+
+	{"I2SOUT3", NULL, I2SIN0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT3", NULL, I2SIN1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT3", NULL, I2SIN2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT3", NULL, I2SIN3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT3", NULL, I2SIN4_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT3", NULL, I2SIN6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT3", NULL, I2SOUT0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT3", NULL, I2SOUT1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT3", NULL, I2SOUT2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT3", NULL, I2SOUT3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT3", NULL, I2SOUT4_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT3", NULL, I2SOUT6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT3", NULL, FMI2S_MASTER_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{I2SOUT3_MCLK_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_mclk_apll_connect},
+	{I2SOUT3_MCLK_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_mclk_apll_connect},
+	{"I2SOUT3", NULL, "I2SOUT3_CG"},
+	{"I2SOUT3", NULL, "I2SIN3_CG"},
+
+	/* i2sout4 */
+	{"I2SOUT4_CH1", "DL0_CH1", "DL0"},
+	{"I2SOUT4_CH2", "DL0_CH2", "DL0"},
+	{"I2SOUT4_CH1", "DL1_CH1", "DL1"},
+	{"I2SOUT4_CH2", "DL1_CH2", "DL1"},
+	{"I2SOUT4_CH1", "DL2_CH1", "DL2"},
+	{"I2SOUT4_CH2", "DL2_CH2", "DL2"},
+	{"I2SOUT4_CH1", "DL3_CH1", "DL3"},
+	{"I2SOUT4_CH2", "DL3_CH2", "DL3"},
+	{"I2SOUT4_CH1", "DL4_CH1", "DL4"},
+	{"I2SOUT4_CH2", "DL4_CH2", "DL4"},
+	{"I2SOUT4_CH1", "DL5_CH1", "DL5"},
+	{"I2SOUT4_CH2", "DL5_CH2", "DL5"},
+	{"I2SOUT4_CH1", "DL6_CH1", "DL6"},
+	{"I2SOUT4_CH2", "DL6_CH2", "DL6"},
+	{"I2SOUT4_CH1", "DL7_CH1", "DL7"},
+	{"I2SOUT4_CH2", "DL7_CH2", "DL7"},
+	{"I2SOUT4_CH1", "DL8_CH1", "DL8"},
+	{"I2SOUT4_CH2", "DL8_CH2", "DL8"},
+	{"I2SOUT4_CH1", "DL_24CH_CH1", "DL_24CH"},
+	{"I2SOUT4_CH2", "DL_24CH_CH2", "DL_24CH"},
+	{"I2SOUT4_CH3", "DL_24CH_CH3", "DL_24CH"},
+	{"I2SOUT4_CH4", "DL_24CH_CH4", "DL_24CH"},
+	{"I2SOUT4_CH5", "DL_24CH_CH5", "DL_24CH"},
+	{"I2SOUT4_CH6", "DL_24CH_CH6", "DL_24CH"},
+	{"I2SOUT4_CH7", "DL_24CH_CH7", "DL_24CH"},
+	{"I2SOUT4_CH8", "DL_24CH_CH8", "DL_24CH"},
+	{"I2SOUT4_CH1", "DL24_CH1", "DL24"},
+	{"I2SOUT4_CH2", "DL24_CH2", "DL24"},
+
+	/* SOF Downlink */
+	{"I2SOUT4_CH1", "DL_24CH_CH1", "SOF_DMA_DL_24CH"},
+	{"I2SOUT4_CH2", "DL_24CH_CH2", "SOF_DMA_DL_24CH"},
+	{"I2SOUT4_CH3", "DL_24CH_CH3", "SOF_DMA_DL_24CH"},
+	{"I2SOUT4_CH4", "DL_24CH_CH4", "SOF_DMA_DL_24CH"},
+
+	{"I2SOUT4", NULL, "I2SOUT4_CH1"},
+	{"I2SOUT4", NULL, "I2SOUT4_CH2"},
+	{"I2SOUT4", NULL, "I2SOUT4_CH3"},
+	{"I2SOUT4", NULL, "I2SOUT4_CH4"},
+	{"I2SOUT4", NULL, "I2SOUT4_CH5"},
+	{"I2SOUT4", NULL, "I2SOUT4_CH6"},
+	{"I2SOUT4", NULL, "I2SOUT4_CH7"},
+	{"I2SOUT4", NULL, "I2SOUT4_CH8"},
+
+	{"I2SOUT4", NULL, "I2SIN0_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT4", NULL, "I2SIN1_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT4", NULL, "I2SIN2_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT4", NULL, "I2SIN3_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT4", NULL, "I2SIN4_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT4", NULL, "I2SIN6_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT4", NULL, "I2SOUT0_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT4", NULL, "I2SOUT1_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT4", NULL, "I2SOUT2_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT4", NULL, "I2SOUT3_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT4", NULL, "I2SOUT4_EN"},
+	{"I2SOUT4", NULL, "I2SOUT6_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT4", NULL, "FMI2S_MASTER_EN", mtk_afe_i2s_share_connect},
+
+	{"I2SOUT4", NULL, I2SIN0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT4", NULL, I2SIN1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT4", NULL, I2SIN2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT4", NULL, I2SIN3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT4", NULL, I2SIN4_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT4", NULL, I2SIN6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT4", NULL, I2SOUT0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT4", NULL, I2SOUT1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT4", NULL, I2SOUT2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT4", NULL, I2SOUT3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT4", NULL, I2SOUT4_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT4", NULL, I2SOUT6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT4", NULL, FMI2S_MASTER_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{I2SOUT4_HD_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_i2s_apll_connect},
+	{I2SOUT4_HD_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_i2s_apll_connect},
+
+	{"I2SOUT4", NULL, I2SIN0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT4", NULL, I2SIN1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT4", NULL, I2SIN2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT4", NULL, I2SIN3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT4", NULL, I2SIN4_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT4", NULL, I2SIN6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT4", NULL, I2SOUT0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT4", NULL, I2SOUT1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT4", NULL, I2SOUT2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT4", NULL, I2SOUT3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT4", NULL, I2SOUT4_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT4", NULL, I2SOUT6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT4", NULL, FMI2S_MASTER_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{I2SOUT4_MCLK_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_mclk_apll_connect},
+	{I2SOUT4_MCLK_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_mclk_apll_connect},
+	/* CG */
+	{"I2SOUT4", NULL, "I2SOUT4_CG"},
+	{"I2SOUT4", NULL, "I2SIN4_CG"},
+
+	/* i2sout6 */
+	{"I2SOUT6_CH1", "DL0_CH1", "DL0"},
+	{"I2SOUT6_CH2", "DL0_CH2", "DL0"},
+	{"I2SOUT6_CH1", "DL1_CH1", "DL1"},
+	{"I2SOUT6_CH2", "DL1_CH2", "DL1"},
+	{"I2SOUT6_CH1", "DL2_CH1", "DL2"},
+	{"I2SOUT6_CH2", "DL2_CH2", "DL2"},
+	{"I2SOUT6_CH1", "DL3_CH1", "DL3"},
+	{"I2SOUT6_CH2", "DL3_CH2", "DL3"},
+	{"I2SOUT6_CH1", "DL4_CH1", "DL4"},
+	{"I2SOUT6_CH2", "DL4_CH2", "DL4"},
+	{"I2SOUT6_CH1", "DL5_CH1", "DL5"},
+	{"I2SOUT6_CH2", "DL5_CH2", "DL5"},
+	{"I2SOUT6_CH1", "DL6_CH1", "DL6"},
+	{"I2SOUT6_CH2", "DL6_CH2", "DL6"},
+	{"I2SOUT6_CH1", "DL7_CH1", "DL7"},
+	{"I2SOUT6_CH2", "DL7_CH2", "DL7"},
+	{"I2SOUT6_CH1", "DL8_CH1", "DL8"},
+	{"I2SOUT6_CH2", "DL8_CH2", "DL8"},
+	{"I2SOUT6_CH1", "DL23_CH1", "DL23"},
+	{"I2SOUT6_CH2", "DL23_CH2", "DL23"},
+	{"I2SOUT6_CH1", "DL_24CH_CH1", "DL_24CH"},
+	{"I2SOUT6_CH2", "DL_24CH_CH2", "DL_24CH"},
+
+	/* SOF Downlink */
+	{"I2SOUT6_CH1", "DL1_CH1", "SOF_DMA_DL1"},
+	{"I2SOUT6_CH2", "DL1_CH2", "SOF_DMA_DL1"},
+	{"I2SOUT6_CH1", "DL_24CH_CH1", "SOF_DMA_DL_24CH"},
+	{"I2SOUT6_CH2", "DL_24CH_CH2", "SOF_DMA_DL_24CH"},
+
+	{"I2SOUT6", NULL, "I2SOUT6_CH1"},
+	{"I2SOUT6", NULL, "I2SOUT6_CH2"},
+
+	{"I2SOUT6", NULL, "I2SIN0_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT6", NULL, "I2SIN1_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT6", NULL, "I2SIN2_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT6", NULL, "I2SIN3_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT6", NULL, "I2SIN4_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT6", NULL, "I2SIN6_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT6", NULL, "I2SOUT0_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT6", NULL, "I2SOUT1_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT6", NULL, "I2SOUT2_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT6", NULL, "I2SOUT3_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT6", NULL, "I2SOUT4_EN", mtk_afe_i2s_share_connect},
+	{"I2SOUT6", NULL, "I2SOUT6_EN"},
+	{"I2SOUT6", NULL, "FMI2S_MASTER_EN", mtk_afe_i2s_share_connect},
+
+	{"I2SOUT6", NULL, I2SIN0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT6", NULL, I2SIN1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT6", NULL, I2SIN2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT6", NULL, I2SIN3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT6", NULL, I2SIN4_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT6", NULL, I2SIN6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT6", NULL, I2SOUT0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT6", NULL, I2SOUT1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT6", NULL, I2SOUT2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT6", NULL, I2SOUT3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT6", NULL, I2SOUT4_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT6", NULL, I2SOUT6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"I2SOUT6", NULL, FMI2S_MASTER_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{I2SOUT6_HD_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_i2s_apll_connect},
+	{I2SOUT6_HD_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_i2s_apll_connect},
+
+	{"I2SOUT6", NULL, I2SIN0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT6", NULL, I2SIN1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT6", NULL, I2SIN2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT6", NULL, I2SIN3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT6", NULL, I2SIN4_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT6", NULL, I2SIN6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT6", NULL, I2SOUT0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT6", NULL, I2SOUT1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT6", NULL, I2SOUT2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT6", NULL, I2SOUT3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT6", NULL, I2SOUT4_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT6", NULL, I2SOUT6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"I2SOUT6", NULL, FMI2S_MASTER_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{I2SOUT6_MCLK_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_mclk_apll_connect},
+	{I2SOUT6_MCLK_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_mclk_apll_connect},
+	/* CG */
+	{"I2SOUT6", NULL, "I2SOUT6_CG"},
+	{"I2SOUT6", NULL, "I2SIN6_CG"},
+
+	/* fmi2s */
+	{"FMI2S_MASTER", NULL, "I2SIN0_EN", mtk_afe_i2s_share_connect},
+	{"FMI2S_MASTER", NULL, "I2SIN1_EN", mtk_afe_i2s_share_connect},
+	{"FMI2S_MASTER", NULL, "I2SIN2_EN", mtk_afe_i2s_share_connect},
+	{"FMI2S_MASTER", NULL, "I2SIN3_EN", mtk_afe_i2s_share_connect},
+	{"FMI2S_MASTER", NULL, "I2SIN4_EN", mtk_afe_i2s_share_connect},
+	{"FMI2S_MASTER", NULL, "I2SIN6_EN", mtk_afe_i2s_share_connect},
+	{"FMI2S_MASTER", NULL, "I2SOUT0_EN", mtk_afe_i2s_share_connect},
+	{"FMI2S_MASTER", NULL, "I2SOUT1_EN", mtk_afe_i2s_share_connect},
+	{"FMI2S_MASTER", NULL, "I2SOUT2_EN", mtk_afe_i2s_share_connect},
+	{"FMI2S_MASTER", NULL, "I2SOUT3_EN", mtk_afe_i2s_share_connect},
+	{"FMI2S_MASTER", NULL, "I2SOUT4_EN", mtk_afe_i2s_share_connect},
+	{"FMI2S_MASTER", NULL, "I2SOUT6_EN", mtk_afe_i2s_share_connect},
+	{"FMI2S_MASTER", NULL, "FMI2S_MASTER_EN"},
+
+	{"FMI2S_MASTER", NULL, I2SIN0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"FMI2S_MASTER", NULL, I2SIN1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"FMI2S_MASTER", NULL, I2SIN2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"FMI2S_MASTER", NULL, I2SIN3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"FMI2S_MASTER", NULL, I2SIN4_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"FMI2S_MASTER", NULL, I2SIN6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"FMI2S_MASTER", NULL, I2SOUT0_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"FMI2S_MASTER", NULL, I2SOUT1_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"FMI2S_MASTER", NULL, I2SOUT2_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"FMI2S_MASTER", NULL, I2SOUT3_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"FMI2S_MASTER", NULL, I2SOUT4_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"FMI2S_MASTER", NULL, I2SOUT6_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{"FMI2S_MASTER", NULL, FMI2S_MASTER_HD_EN_W_NAME, mtk_afe_i2s_hd_connect},
+	{FMI2S_MASTER_HD_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_i2s_apll_connect},
+	{FMI2S_MASTER_HD_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_i2s_apll_connect},
+
+	{"FMI2S_MASTER", NULL, I2SIN0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"FMI2S_MASTER", NULL, I2SIN1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"FMI2S_MASTER", NULL, I2SIN2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"FMI2S_MASTER", NULL, I2SIN3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"FMI2S_MASTER", NULL, I2SIN4_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"FMI2S_MASTER", NULL, I2SIN6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"FMI2S_MASTER", NULL, I2SOUT0_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"FMI2S_MASTER", NULL, I2SOUT1_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"FMI2S_MASTER", NULL, I2SOUT2_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"FMI2S_MASTER", NULL, I2SOUT3_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"FMI2S_MASTER", NULL, I2SOUT4_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"FMI2S_MASTER", NULL, I2SOUT6_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{"FMI2S_MASTER", NULL, FMI2S_MASTER_MCLK_EN_W_NAME, mtk_afe_i2s_mclk_connect},
+	{FMI2S_MASTER_MCLK_EN_W_NAME, NULL, APLL1_W_NAME, mtk_afe_mclk_apll_connect},
+	{FMI2S_MASTER_MCLK_EN_W_NAME, NULL, APLL2_W_NAME, mtk_afe_mclk_apll_connect},
+	/* CG */
+	{"FMI2S_MASTER", NULL, "FMI2S_MASTER_CG"},
+
+	/* allow i2s on without codec on */
+	{"I2SIN0", NULL, "I2S_IN0_Mux"},
+	{"I2S_IN0_Mux", "Dummy_Widget", "I2S_DUMMY_IN"},
+
+	{"I2SIN1", NULL, "I2S_IN1_Mux"},
+	{"I2S_IN1_Mux", "Dummy_Widget", "I2S_DUMMY_IN"},
+
+	{"I2SIN2", NULL, "I2S_IN2_Mux"},
+	{"I2S_IN2_Mux", "Dummy_Widget", "I2S_DUMMY_IN"},
+
+	{"I2SIN3", NULL, "I2S_IN3_Mux"},
+	{"I2S_IN3_Mux", "Dummy_Widget", "I2S_DUMMY_IN"},
+
+	{"I2SIN4", NULL, "I2S_IN4_Mux"},
+	{"I2S_IN4_Mux", "Dummy_Widget", "I2S_DUMMY_IN"},
+
+	{"I2SIN6", NULL, "I2S_IN6_Mux"},
+	{"I2S_IN6_Mux", "Dummy_Widget", "I2S_DUMMY_IN"},
+
+	{"I2S_OUT0_Mux", "Dummy_Widget", "I2SOUT0"},
+	{"I2S_DUMMY_OUT", NULL, "I2S_OUT0_Mux"},
+
+	{"I2S_OUT1_Mux", "Dummy_Widget", "I2SOUT1"},
+	{"I2S_DUMMY_OUT", NULL, "I2S_OUT1_Mux"},
+
+	{"I2S_OUT2_Mux", "Dummy_Widget", "I2SOUT2"},
+	{"I2S_DUMMY_OUT", NULL, "I2S_OUT2_Mux"},
+
+	{"I2S_OUT3_Mux", "Dummy_Widget", "I2SOUT3"},
+	{"I2S_DUMMY_OUT", NULL, "I2S_OUT3_Mux"},
+	{"I2S_OUT4_Mux", "Dummy_Widget", "I2SOUT4"},
+	{"I2S_DUMMY_OUT", NULL, "I2S_OUT4_Mux"},
+
+	{"I2S_OUT6_Mux", "Dummy_Widget", "I2SOUT6"},
+	{"I2S_DUMMY_OUT", NULL, "I2S_OUT6_Mux"},
+};
+
+/* i2s dai ops*/
+static int mtk_dai_i2s_config(struct mtk_base_afe *afe,
+			      struct snd_pcm_hw_params *params,
+			      int i2s_id)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_afe_i2s_priv *i2s_priv;
+	struct mtk_afe_i2s_priv *i2sin_priv = NULL;
+	int id = i2s_id - MT8196_DAI_I2S_IN0;
+	struct mtk_base_etdm_data etdm_data;
+	unsigned int rate = params_rate(params);
+	unsigned int rate_reg = get_etdm_inconn_rate(rate);
+	snd_pcm_format_t format = params_format(params);
+	unsigned int channels = params_channels(params);
+	int ret;
+	unsigned int i2s_con;
+	int pad_top;
+
+	if (i2s_id >= MT8196_DAI_NUM || i2s_id < 0 || id < 0 || id >= DAI_I2S_NUM)
+		return -EINVAL;
+
+	i2s_priv = afe_priv->dai_priv[i2s_id];
+
+	if (!i2s_priv)
+		return -EINVAL;
+
+	dev_info(afe->dev, "id: %d, rate: %d, pcm_fmt: %d, fmt: %d, ch: %d\n",
+		 i2s_id, rate, format, i2s_priv->format, channels);
+
+	i2s_priv->rate = rate;
+	etdm_data = mtk_etdm_data[id];
+
+	if (is_etdm_in_pad_top(id))
+		pad_top = 0x3;
+	else
+		pad_top = 0x5;
+
+	switch (id) {
+	case DAI_FMI2S_MASTER:
+		i2s_con = I2S_IN_PAD_IO_MUX << I2SIN_PAD_SEL_SFT;
+		i2s_con |= rate_reg << I2S_MODE_SFT;
+		i2s_con |= I2S_FMT_I2S << I2S_FMT_SFT;
+		i2s_con |= get_i2s_wlen(format) << I2S_WLEN_SFT;
+		regmap_update_bits(afe->regmap, AFE_CONNSYS_I2S_CON,
+				   0xffffeffe, i2s_con);
+		break;
+	case DAI_I2SIN0:
+	case DAI_I2SIN1:
+	case DAI_I2SIN2:
+	case DAI_I2SIN3:
+	case DAI_I2SIN4:
+	case DAI_I2SIN6:
+		/* ---etdm in --- */
+		regmap_update_bits(afe->regmap,
+				   etdm_data.init_count_reg,
+				   etdm_data.init_count_mask << etdm_data.init_count_shift,
+				   0x5 << etdm_data.init_count_shift);
+
+		/* 3: pad top 5: no pad top */
+		regmap_update_bits(afe->regmap,
+				   etdm_data.init_point_reg,
+				   etdm_data.init_point_mask << etdm_data.init_point_shift,
+				   pad_top << etdm_data.init_point_shift);
+
+		regmap_update_bits(afe->regmap,
+				   etdm_data.lrck_reset_reg,
+				   etdm_data.lrck_reset_mask << etdm_data.lrck_reset_shift,
+				   0x1 << etdm_data.lrck_reset_shift);
+
+		regmap_update_bits(afe->regmap,
+				   etdm_data.clk_source_reg,
+				   etdm_data.clk_source_mask << etdm_data.clk_source_shift,
+				   ETDM_CLK_SOURCE_APLL << etdm_data.clk_source_shift);
+
+		/* 0: manual 1: auto */
+		regmap_update_bits(afe->regmap,
+				   etdm_data.ck_en_sel_reg,
+				   etdm_data.ck_en_sel_mask << etdm_data.ck_en_sel_shift,
+				   0x1 << etdm_data.ck_en_sel_shift);
+
+		regmap_update_bits(afe->regmap,
+				   etdm_data.fs_timing_reg,
+				   etdm_data.fs_timing_mask << etdm_data.fs_timing_shift,
+				   get_etdm_rate(rate) << etdm_data.fs_timing_shift);
+
+		regmap_update_bits(afe->regmap,
+				   etdm_data.relatch_en_sel_reg,
+				   etdm_data.relatch_en_sel_mask << etdm_data.relatch_en_sel_shift,
+				   get_etdm_inconn_rate(rate) << etdm_data.relatch_en_sel_shift);
+
+		regmap_update_bits(afe->regmap,
+				   etdm_data.use_afifo_reg,
+				   etdm_data.use_afifo_mask << etdm_data.use_afifo_shift,
+				   0x0);
+
+		regmap_update_bits(afe->regmap,
+				   etdm_data.afifo_mode_reg,
+				   etdm_data.afifo_mode_mask << etdm_data.afifo_mode_shift,
+				   0x0);
+
+		regmap_update_bits(afe->regmap,
+				   etdm_data.almost_end_ch_reg,
+				   etdm_data.almost_end_ch_mask << etdm_data.almost_end_ch_shift,
+				   0x0);
+
+		regmap_update_bits(afe->regmap,
+				   etdm_data.almost_end_bit_reg,
+				   etdm_data.almost_end_bit_mask << etdm_data.almost_end_bit_shift,
+				   0x0);
+
+		if (is_etdm_in_pad_top(id)) {
+			regmap_update_bits(afe->regmap,
+					   etdm_data.out2latch_time_reg,
+					   etdm_data.out2latch_time_mask <<
+					   etdm_data.out2latch_time_shift,
+					   0x6 << etdm_data.out2latch_time_shift);
+		} else {
+			regmap_update_bits(afe->regmap,
+					   etdm_data.out2latch_time_reg,
+					   etdm_data.out2latch_time_mask <<
+					   etdm_data.out2latch_time_shift,
+					   0x4 << etdm_data.out2latch_time_shift);
+		}
+
+		if (id == DAI_I2SIN4) {
+			dev_dbg(afe->dev, "i2sin4, id: %d, fmt: %d, ch: %d, ip_mode: %d, sync: %d\n",
+				id,
+				i2s_priv->format,
+				channels,
+				i2s_priv->ip_mode,
+				i2s_priv->sync);
+
+			/* Fmt Mode: 0x00 i2s, 0x04 adsp_a, DSP_A mode for multi-channel */
+			regmap_update_bits(afe->regmap,
+					   etdm_data.tdm_mode_reg,
+					   etdm_data.tdm_mode_mask << etdm_data.tdm_mode_shift,
+					   i2s_priv->format << etdm_data.tdm_mode_shift);
+
+			/* set etdm ch */
+			regmap_update_bits(afe->regmap,
+					   etdm_data.ch_reg,
+					   etdm_data.ch_mask << etdm_data.ch_shift,
+					   (channels - 1) << etdm_data.ch_shift);
+
+			/* set etdm ip mode */
+			regmap_update_bits(afe->regmap,
+					   etdm_data.ip_mode_reg,
+					   etdm_data.ip_mode_mask << etdm_data.ip_mode_shift,
+					   i2s_priv->ip_mode << etdm_data.ip_mode_shift);
+
+			/* set etdm sync */
+			regmap_update_bits(afe->regmap,
+					   etdm_data.sync_reg,
+					   etdm_data.sync_mask << etdm_data.sync_shift,
+					   i2s_priv->sync << etdm_data.sync_shift);
+		} else {
+			/* default i2s */
+			regmap_update_bits(afe->regmap,
+					   etdm_data.tdm_mode_reg,
+					   etdm_data.tdm_mode_mask << etdm_data.tdm_mode_shift,
+					   0x0 << etdm_data.tdm_mode_shift);
+
+			/* set etdm sync */
+			regmap_update_bits(afe->regmap,
+					   etdm_data.sync_reg,
+					   etdm_data.sync_mask << etdm_data.sync_shift,
+					   0x0 << etdm_data.sync_shift);
+		}
+
+		/* APLL */
+		regmap_update_bits(afe->regmap,
+				   etdm_data.relatch_domain_sel_reg,
+				   etdm_data.relatch_domain_sel_mask <<
+				   etdm_data.relatch_domain_sel_shift,
+				   ETDM_RELATCH_SEL_APLL << etdm_data.relatch_domain_sel_shift);
+
+		regmap_update_bits(afe->regmap,
+				   etdm_data.bit_length_reg,
+				   etdm_data.bit_length_mask << etdm_data.bit_length_shift,
+				   get_etdm_lrck_width(format) << etdm_data.bit_length_shift);
+
+		regmap_update_bits(afe->regmap,
+				   etdm_data.word_length_reg,
+				   etdm_data.word_length_mask << etdm_data.word_length_shift,
+				   get_etdm_wlen(format) << etdm_data.word_length_shift);
+
+		/* ---etdm cowork --- */
+		regmap_update_bits(afe->regmap,
+				   etdm_data.cowork_reg,
+				   etdm_data.cowork_mask << etdm_data.cowork_shift,
+				   etdm_data.cowork_val << etdm_data.cowork_shift);
+
+		/* i2s with pad top setting */
+		if (is_etdm_in_pad_top(id) && etdm_data.pad_top_ck_en_reg != 0) {
+			regmap_update_bits(afe->regmap,
+					   etdm_data.pad_top_ck_en_reg,
+					   etdm_data.pad_top_ck_en_mask <<
+					   etdm_data.pad_top_ck_en_shift,
+					   0x1 << etdm_data.pad_top_ck_en_shift);
+
+			regmap_update_bits(afe->regmap,
+					   etdm_data.master_latch_reg,
+					   etdm_data.master_latch_mask <<
+					   etdm_data.master_latch_shift,
+					   0x0);
+		}
+		break;
+	case DAI_I2SOUT0:
+	case DAI_I2SOUT1:
+	case DAI_I2SOUT2:
+	case DAI_I2SOUT3:
+	case DAI_I2SOUT4:
+	case DAI_I2SOUT6:
+		/* ---etdm out --- */
+		regmap_update_bits(afe->regmap,
+				   etdm_data.init_count_reg,
+				   etdm_data.init_count_mask << etdm_data.init_count_shift,
+				   0x5 << etdm_data.init_count_shift);
+
+		regmap_update_bits(afe->regmap,
+				   etdm_data.init_point_reg,
+				   etdm_data.init_point_mask << etdm_data.init_point_shift,
+				   0x6 << etdm_data.init_point_shift);
+
+		// clock speed > 22M need to set relatch time to avoid duplicate porint
+		if (rate * channels * (get_etdm_wlen(format) + 1) >= ETDM_22M_CLOCK_THRES &&
+		    get_etdm_wlen(format) >= 2) {
+			regmap_update_bits(afe->regmap,
+					   etdm_data.in2latch_time_reg,
+					   etdm_data.in2latch_time_mask <<
+					   etdm_data.in2latch_time_shift,
+					   (get_etdm_wlen(format) - 2) <<
+					   etdm_data.in2latch_time_shift);
+		} else {
+			regmap_update_bits(afe->regmap,
+					   etdm_data.in2latch_time_reg,
+					   etdm_data.in2latch_time_mask <<
+					   etdm_data.in2latch_time_shift,
+					   0x6 << etdm_data.in2latch_time_shift);
+		}
+
+		regmap_update_bits(afe->regmap,
+				   etdm_data.lrck_reset_reg,
+				   etdm_data.lrck_reset_mask << etdm_data.lrck_reset_shift,
+				   0x1 << etdm_data.lrck_reset_shift);
+
+		regmap_update_bits(afe->regmap,
+				   etdm_data.fs_timing_reg,
+				   etdm_data.fs_timing_mask << etdm_data.fs_timing_shift,
+				   get_etdm_rate(rate) << etdm_data.fs_timing_shift);
+
+		regmap_update_bits(afe->regmap,
+				   etdm_data.clk_source_reg,
+				   etdm_data.clk_source_mask << etdm_data.clk_source_shift,
+				   ETDM_CLK_SOURCE_APLL << etdm_data.clk_source_shift);
+
+		regmap_update_bits(afe->regmap,
+				   etdm_data.relatch_en_sel_reg,
+				   etdm_data.relatch_en_sel_mask << etdm_data.relatch_en_sel_shift,
+				   get_etdm_inconn_rate(rate) << etdm_data.relatch_en_sel_shift);
+
+		if (id == DAI_I2SOUT4) {
+			dev_dbg(afe->dev, "i2sout4, id: %d fmt: %d, ch: %d, sync: %d\n",
+				id, i2s_priv->format, channels, i2s_priv->sync);
+
+			/* Fmt Mode: 0x00 i2s, 0x04 adsp_a, DSP_A mode for multi-channel */
+			regmap_update_bits(afe->regmap,
+					   etdm_data.tdm_mode_reg,
+					   etdm_data.tdm_mode_mask << etdm_data.tdm_mode_shift,
+					   i2s_priv->format << etdm_data.tdm_mode_shift);
+
+			/* set etdm ch */
+			regmap_update_bits(afe->regmap,
+					   etdm_data.ch_reg,
+					   etdm_data.ch_mask << etdm_data.ch_shift,
+					   (channels - 1) << etdm_data.ch_shift);
+
+			/* set etdm sync */
+			regmap_update_bits(afe->regmap,
+					   etdm_data.sync_reg,
+					   etdm_data.sync_mask << etdm_data.sync_shift,
+					   i2s_priv->sync << etdm_data.sync_shift);
+		} else {
+			regmap_update_bits(afe->regmap,
+					   etdm_data.tdm_mode_reg,
+					   etdm_data.tdm_mode_mask << etdm_data.tdm_mode_shift,
+					   0x0);
+		}
+
+		/* APLL */
+		regmap_update_bits(afe->regmap,
+				   etdm_data.relatch_domain_sel_reg,
+				   etdm_data.relatch_domain_sel_mask <<
+				   etdm_data.relatch_domain_sel_shift,
+				   ETDM_RELATCH_SEL_APLL << etdm_data.relatch_domain_sel_shift);
+
+		regmap_update_bits(afe->regmap,
+				   etdm_data.bit_length_reg,
+				   etdm_data.bit_length_mask << etdm_data.bit_length_shift,
+				   get_etdm_lrck_width(format) << etdm_data.bit_length_shift);
+
+		regmap_update_bits(afe->regmap,
+				   etdm_data.word_length_reg,
+				   etdm_data.word_length_mask << etdm_data.word_length_shift,
+				   get_etdm_wlen(format) << etdm_data.word_length_shift);
+
+		/* ---etdm cowork --- */
+		regmap_update_bits(afe->regmap,
+				   etdm_data.cowork_reg,
+				   etdm_data.cowork_mask << etdm_data.cowork_shift,
+				   etdm_data.cowork_val << etdm_data.cowork_shift);
+
+		/* i2s with pad top setting */
+		if (is_etdm_in_pad_top(id) && etdm_data.pad_top_ck_en_reg != 0) {
+			regmap_update_bits(afe->regmap,
+					   etdm_data.pad_top_ck_en_reg,
+					   etdm_data.cowork_mask << etdm_data.pad_top_ck_en_shift,
+					   0x1 << etdm_data.pad_top_ck_en_shift);
+
+			regmap_update_bits(afe->regmap,
+					   etdm_data.master_latch_reg,
+					   etdm_data.master_latch_mask <<
+					   etdm_data.master_latch_shift,
+					   0x0);
+		}
+		break;
+	default:
+		dev_err(afe->dev, "id %d not support\n", id);
+		return -EINVAL;
+	}
+
+	/* set share i2s */
+	if (i2s_priv && i2s_priv->share_i2s_id >= 0) {
+		i2sin_priv = afe_priv->dai_priv[i2s_priv->share_i2s_id];
+		i2sin_priv->format = i2s_priv->format;
+		ret = mtk_dai_i2s_config(afe, params, i2s_priv->share_i2s_id);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int mtk_dai_i2s_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params,
+				 struct snd_soc_dai *dai)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+
+	return mtk_dai_i2s_config(afe, params, dai->id);
+}
+
+static int mtk_dai_i2s_set_sysclk(struct snd_soc_dai *dai,
+				  int clk_id, unsigned int freq, int dir)
+{
+	struct mtk_base_afe *afe = dev_get_drvdata(dai->dev);
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_afe_i2s_priv *i2s_priv;
+	int apll;
+	int apll_rate;
+
+	if (dai->id >= MT8196_DAI_NUM || dai->id < 0 || dir != SND_SOC_CLOCK_OUT)
+		return -EINVAL;
+
+	i2s_priv = afe_priv->dai_priv[dai->id];
+
+	dev_dbg(afe->dev, "freq: %u\n", freq);
+
+	if (!i2s_priv)
+		return -EINVAL;
+
+	apll = mt8196_get_apll_by_rate(afe, freq);
+	apll_rate = mt8196_get_apll_rate(afe, apll);
+
+	if (freq > apll_rate || apll_rate % freq)
+		return -EINVAL;
+
+	i2s_priv->mclk_rate = freq;
+	i2s_priv->mclk_apll = apll;
+
+	if (i2s_priv->share_i2s_id > 0) {
+		struct mtk_afe_i2s_priv *share_i2s_priv;
+
+		share_i2s_priv = afe_priv->dai_priv[i2s_priv->share_i2s_id];
+		if (!share_i2s_priv)
+			return -EINVAL;
+
+		share_i2s_priv->mclk_rate = i2s_priv->mclk_rate;
+		share_i2s_priv->mclk_apll = i2s_priv->mclk_apll;
+	}
+	return 0;
+}
+
+static int mtk_dai_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
+{
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_afe_i2s_priv *i2s_priv;
+
+	if (dai->id >= MT8196_DAI_NUM || dai->id < 0)
+		return -EINVAL;
+
+	i2s_priv = afe_priv->dai_priv[dai->id];
+
+	if (!i2s_priv)
+		return -EINVAL;
+
+	dev_dbg(afe->dev, "dai->id: %d, fmt: 0x%x\n", dai->id, fmt);
+
+	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
+	case SND_SOC_DAIFMT_I2S:
+		i2s_priv->format = MTK_DAI_ETDM_FORMAT_I2S;
+		break;
+	case SND_SOC_DAIFMT_LEFT_J:
+		i2s_priv->format = MTK_DAI_ETDM_FORMAT_LJ;
+		break;
+	case SND_SOC_DAIFMT_RIGHT_J:
+		i2s_priv->format = MTK_DAI_ETDM_FORMAT_RJ;
+		break;
+	case SND_SOC_DAIFMT_DSP_A:
+		i2s_priv->format = MTK_DAI_ETDM_FORMAT_DSPA;
+		break;
+	case SND_SOC_DAIFMT_DSP_B:
+		i2s_priv->format = MTK_DAI_ETDM_FORMAT_DSPB;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	dev_dbg(afe->dev, "dai->id: %d, i2s_priv->format: 0x%x\n",
+		dai->id, i2s_priv->format);
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops mtk_dai_i2s_ops = {
+	.hw_params = mtk_dai_i2s_hw_params,
+	.set_sysclk = mtk_dai_i2s_set_sysclk,
+	.set_fmt = mtk_dai_i2s_set_fmt,
+};
+
+/* dai driver */
+#define MTK_ETDM_RATES (SNDRV_PCM_RATE_8000_384000)
+#define MTK_ETDM_FORMATS (SNDRV_PCM_FMTBIT_S8 |\
+			  SNDRV_PCM_FMTBIT_S16_LE |\
+			  SNDRV_PCM_FMTBIT_S24_LE |\
+			  SNDRV_PCM_FMTBIT_S32_LE)
+
+#define MT8196_I2S_DAI(_name, _id, max_ch, dir) \
+{ \
+	.name = #_name, \
+	.id = _id, \
+	.dir = { \
+		.stream_name = #_name, \
+		.channels_min = 1, \
+		.channels_max = max_ch, \
+		.rates = MTK_ETDM_RATES, \
+		.formats = MTK_ETDM_FORMATS, \
+	}, \
+	.ops = &mtk_dai_i2s_ops, \
+}
+
+static struct snd_soc_dai_driver mtk_dai_i2s_driver[] = {
+	/* capture */
+	MT8196_I2S_DAI(I2SIN0, MT8196_DAI_I2S_IN0, 2, capture),
+	MT8196_I2S_DAI(I2SIN1, MT8196_DAI_I2S_IN1, 2, capture),
+	MT8196_I2S_DAI(I2SIN2, MT8196_DAI_I2S_IN2, 2, capture),
+	MT8196_I2S_DAI(I2SIN3, MT8196_DAI_I2S_IN3, 2, capture),
+	MT8196_I2S_DAI(I2SIN4, MT8196_DAI_I2S_IN4, 8, capture),
+	MT8196_I2S_DAI(I2SIN6, MT8196_DAI_I2S_IN6, 2, capture),
+	MT8196_I2S_DAI(FMI2S_MASTER, MT8196_DAI_FM_I2S_MASTER, 2, capture),
+	/* playback */
+	MT8196_I2S_DAI(I2SOUT0, MT8196_DAI_I2S_OUT0, 2, playback),
+	MT8196_I2S_DAI(I2SOUT1, MT8196_DAI_I2S_OUT1, 2, playback),
+	MT8196_I2S_DAI(I2SOUT2, MT8196_DAI_I2S_OUT2, 2, playback),
+	MT8196_I2S_DAI(I2SOUT3, MT8196_DAI_I2S_OUT3, 2, playback),
+	MT8196_I2S_DAI(I2SOUT4, MT8196_DAI_I2S_OUT4, 8, playback),
+	MT8196_I2S_DAI(I2SOUT6, MT8196_DAI_I2S_OUT6, 2, playback),
+};
+
+static const struct mtk_afe_i2s_priv mt8196_i2s_priv[DAI_I2S_NUM] = {
+	[DAI_I2SIN0] = {
+		.id = MT8196_DAI_I2S_IN0,
+		.mclk_id = MT8196_I2SIN0_MCK,
+		.share_property_name = "i2sin0-share",
+		.share_i2s_id = -1,
+	},
+	[DAI_I2SIN1] = {
+		.id = MT8196_DAI_I2S_IN1,
+		.mclk_id = MT8196_I2SIN1_MCK,
+		.share_property_name = "i2sin1-share",
+		.share_i2s_id = -1,
+	},
+	[DAI_I2SIN2] = {
+		.id = MT8196_DAI_I2S_IN2,
+		.mclk_id = MT8196_I2SIN0_MCK,
+		.share_property_name = "i2sin2-share",
+		.share_i2s_id = -1,
+	},
+	[DAI_I2SIN3] = {
+		.id = MT8196_DAI_I2S_IN3,
+		.mclk_id = MT8196_I2SIN0_MCK,
+		.share_property_name = "i2sin3-share",
+		.share_i2s_id = -1,
+	},
+	[DAI_I2SIN4] = {
+		.id = MT8196_DAI_I2S_IN4,
+		.mclk_id = MT8196_I2SIN0_MCK,
+		.share_property_name = "i2sin4-share",
+		.share_i2s_id = -1,
+		.sync = 0,
+		.ip_mode = 0,
+	},
+	[DAI_I2SIN6] = {
+		.id = MT8196_DAI_I2S_IN6,
+		.mclk_id = MT8196_I2SIN0_MCK,
+		.share_property_name = "i2sout6-share",
+		.share_i2s_id = -1,
+	},
+	[DAI_I2SOUT0] = {
+		.id = MT8196_DAI_I2S_OUT0,
+		.mclk_id = MT8196_I2SIN0_MCK,
+		.share_property_name = "i2sout0-share",
+		.share_i2s_id = MT8196_DAI_I2S_IN0,
+	},
+	[DAI_I2SOUT1] = {
+		.id = MT8196_DAI_I2S_OUT1,
+		.mclk_id = MT8196_I2SIN1_MCK,
+		.share_property_name = "i2sout1-share",
+		.share_i2s_id = MT8196_DAI_I2S_IN1,
+	},
+	[DAI_I2SOUT2] = {
+		.id = MT8196_DAI_I2S_OUT2,
+		.mclk_id = MT8196_I2SIN0_MCK,
+		.share_property_name = "i2sout2-share",
+		.share_i2s_id = MT8196_DAI_I2S_IN2,
+	},
+	[DAI_I2SOUT3] = {
+		.id = MT8196_DAI_I2S_OUT3,
+		.mclk_id = MT8196_I2SIN0_MCK,
+		.share_property_name = "i2sout3-share",
+		.share_i2s_id = MT8196_DAI_I2S_IN3,
+	},
+	[DAI_I2SOUT4] = {
+		.id = MT8196_DAI_I2S_OUT4,
+		.mclk_id = MT8196_I2SIN0_MCK,
+		.share_property_name = "i2sout4-share",
+		.share_i2s_id = MT8196_DAI_I2S_IN4,
+		.sync = 0,
+	},
+	[DAI_I2SOUT6] = {
+		.id = MT8196_DAI_I2S_OUT6,
+		.mclk_id = MT8196_I2SIN0_MCK,
+		.share_property_name = "i2sout6-share",
+		.share_i2s_id = MT8196_DAI_I2S_IN6,
+	},
+	[DAI_FMI2S_MASTER] = {
+		.id = MT8196_DAI_FM_I2S_MASTER,
+		.mclk_id = MT8196_FMI2S_MCK,
+		.share_property_name = "fmi2s-share",
+		.share_i2s_id = -1,
+	},
+};
+
+static int mt8196_dai_i2s_get_share(struct mtk_base_afe *afe)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	const struct device_node *of_node = afe->dev->of_node;
+	const char *of_str;
+	const char *property_name;
+	struct mtk_afe_i2s_priv *i2s_priv;
+	int i;
+
+	for (i = 0; i < DAI_I2S_NUM; i++) {
+		i2s_priv = afe_priv->dai_priv[mt8196_i2s_priv[i].id];
+		property_name = mt8196_i2s_priv[i].share_property_name;
+		if (of_property_read_string(of_node, property_name, &of_str))
+			continue;
+		i2s_priv->share_i2s_id = get_i2s_id_by_name(afe, of_str);
+	}
+	return 0;
+}
+
+static int init_i2s_priv_data(struct mtk_base_afe *afe)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	struct mtk_afe_i2s_priv *i2s_priv;
+	int size;
+	int id;
+	int i;
+
+	for (i = 0; i < DAI_I2S_NUM; i++) {
+		id = mt8196_i2s_priv[i].id;
+		size = sizeof(struct mtk_afe_i2s_priv);
+
+		if (id >= MT8196_DAI_NUM || id < 0)
+			return -EINVAL;
+
+		i2s_priv = devm_kzalloc(afe->dev, size, GFP_KERNEL);
+		if (!i2s_priv)
+			return -ENOMEM;
+
+		memcpy(i2s_priv, &mt8196_i2s_priv[i], size);
+
+		afe_priv->dai_priv[id] = i2s_priv;
+	}
+	return 0;
+}
+
+int mt8196_dai_i2s_register(struct mtk_base_afe *afe)
+{
+	struct mtk_base_afe_dai *dai;
+	int ret;
+
+	dai = devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
+	if (!dai)
+		return -ENOMEM;
+
+	list_add(&dai->list, &afe->sub_dais);
+
+	dai->dai_drivers = mtk_dai_i2s_driver;
+	dai->num_dai_drivers = ARRAY_SIZE(mtk_dai_i2s_driver);
+
+	dai->controls = mtk_dai_i2s_controls;
+	dai->num_controls = ARRAY_SIZE(mtk_dai_i2s_controls);
+	dai->dapm_widgets = mtk_dai_i2s_widgets;
+	dai->num_dapm_widgets = ARRAY_SIZE(mtk_dai_i2s_widgets);
+	dai->dapm_routes = mtk_dai_i2s_routes;
+	dai->num_dapm_routes = ARRAY_SIZE(mtk_dai_i2s_routes);
+
+	/* set all dai i2s private data */
+	ret = init_i2s_priv_data(afe);
+	if (ret)
+		return ret;
+
+	/* parse share i2s */
+	ret = mt8196_dai_i2s_get_share(afe);
+	if (ret)
+		return ret;
+
+	return 0;
+}
-- 
2.45.2


