Return-Path: <linux-gpio+bounces-21926-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C04AE17FC
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 11:44:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A4735A7836
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 09:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEC4C28853A;
	Fri, 20 Jun 2025 09:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="AQSAhVC3"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71086283C82;
	Fri, 20 Jun 2025 09:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=60.244.123.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750412534; cv=none; b=iY8Y780C2xDl2SNUTfjSCS05c46mgkTGehqxcSYdpk/bYQIh5EDRunmn/TLVS9xgwImwaj/9mALzaCzWa8Za36wvHvfcgSnWwg8hzWk0B/CVoW5EK0a16I4x5rpXXboo74MOwVQOq5RCLDcKYE77LVBVwhUpE40shvTfgpL86PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750412534; c=relaxed/simple;
	bh=gN9MQCBVQYDBt7N22QgktVTbNIK+XFBZebtav3RDvkk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QAjp8iiAfyWpgTlS59ODPOqN43iKL5G0muQvMUKyAPmP9m1fKzcDQL98jHLLFSUVt7nRRN950XfquLLnqiMxNa1/VHl8aLFEg7YhFkI+8sQ+LXqijwF03ePPtFTt0Rz9hSQ7tioPS3wWQ85qvco4KjCEvhJvtF9J4ZnCI9Yq4F8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=AQSAhVC3; arc=none smtp.client-ip=60.244.123.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: d1e6d5a44dba11f0b910cdf5d4d8066a-20250620
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=WfubXD2YFsGid4qnzTa9vAyobfa8jjRQGD7TqnuSQz8=;
	b=AQSAhVC3FyV8IejdhkIV28aAM0hUTY3JvOhCVCGTzFeKPVZ86AD7wLBJkKk2W1mhmiqWtjrbIg8U36BK8Bm7MNzX4xIGPREcyw5u6bSWECe962r+7VFlk/vQ9dnpmrN2wlCRUu5dyvlAMWexURpnzOy2wSdEBZU+zNe0eMA5cx4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:711035aa-2170-4d0e-8613-5333cf50b747,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:09905cf,CLOUDID:12c2d283-db76-4e00-9dd0-5c1455b2676b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:1,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,OSH|NGT
X-CID-BAS: 2,OSH|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d1e6d5a44dba11f0b910cdf5d4d8066a-20250620
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1481642415; Fri, 20 Jun 2025 17:42:02 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 20 Jun 2025 17:42:00 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 20 Jun 2025 17:41:59 +0800
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
Subject: [PATCH v5 07/10] ASoC: mediatek: mt8196: add platform driver
Date: Fri, 20 Jun 2025 17:40:40 +0800
Message-ID: <20250620094140.11093-8-darren.ye@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250620094140.11093-1-darren.ye@mediatek.com>
References: <20250620094140.11093-1-darren.ye@mediatek.com>
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

Add mt8196 platform driver.

Signed-off-by: Darren Ye <darren.ye@mediatek.com>
---
 sound/soc/mediatek/Kconfig                 |   10 +
 sound/soc/mediatek/Makefile                |    1 +
 sound/soc/mediatek/mt8196/Makefile         |   14 +
 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 2657 ++++++++++++++++++++
 4 files changed, 2682 insertions(+)
 create mode 100644 sound/soc/mediatek/mt8196/Makefile
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 90e367586493..63d4abebb539 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -319,3 +319,13 @@ config SND_SOC_MT8365_MT6357
 	  boards with the MT6357 PMIC codec.
 	  Select Y if you have such device.
 	  If unsure select "N".
+
+config SND_SOC_MT8196
+	tristate "ASoC support for Mediatek MT8196 chip"
+	depends on ARCH_MEDIATEK
+	select SND_SOC_MEDIATEK
+	help
+	  This adds ASoC driver for Mediatek MT8196 boards
+	  that can be used with other codecs.
+	  Select Y if you have such device.
+	  If unsure select "N".
\ No newline at end of file
diff --git a/sound/soc/mediatek/Makefile b/sound/soc/mediatek/Makefile
index 4b55434f2168..11d7c484a5d3 100644
--- a/sound/soc/mediatek/Makefile
+++ b/sound/soc/mediatek/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_SND_SOC_MT8188) += mt8188/
 obj-$(CONFIG_SND_SOC_MT8192) += mt8192/
 obj-$(CONFIG_SND_SOC_MT8195) += mt8195/
 obj-$(CONFIG_SND_SOC_MT8365) += mt8365/
+obj-$(CONFIG_SND_SOC_MT8196) += mt8196/
diff --git a/sound/soc/mediatek/mt8196/Makefile b/sound/soc/mediatek/mt8196/Makefile
new file mode 100644
index 000000000000..33f1fc768bd2
--- /dev/null
+++ b/sound/soc/mediatek/mt8196/Makefile
@@ -0,0 +1,14 @@
+# SPDX-License-Identifier: GPL-2.0
+
+# common include path
+subdir-ccflags-y += -I$(srctree)/sound/soc/mediatek/common
+
+# platform driver
+snd-soc-mt8196-afe-objs += \
+	mt8196-afe-pcm.o \
+	mt8196-afe-clk.o \
+	mt8196-dai-adda.o \
+	mt8196-dai-i2s.o \
+	mt8196-dai-tdm.o
+
+obj-$(CONFIG_SND_SOC_MT8196) += snd-soc-mt8196-afe.o
diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
new file mode 100644
index 000000000000..3f3c8715c2d1
--- /dev/null
+++ b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
@@ -0,0 +1,2657 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  Mediatek ALSA SoC AFE platform driver for 8196
+ *
+ *  Copyright (c) 2024 MediaTek Inc.
+ *  Author: Darren Ye <darren.ye@mediatek.com>
+ */
+
+#include <linux/delay.h>
+#include <linux/dma-mapping.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/pm_runtime.h>
+#include <linux/regmap.h>
+#include <linux/of_device.h>
+#include <sound/soc.h>
+#include <linux/of_reserved_mem.h>
+
+#include "mt8196-afe-clk.h"
+#include "mt8196-afe-common.h"
+#include "mtk-afe-fe-dai.h"
+#include "mtk-afe-platform-driver.h"
+#include "mt8196-interconnection.h"
+
+static const struct snd_pcm_hardware mt8196_afe_hardware = {
+	.info = (SNDRV_PCM_INFO_MMAP |
+		 SNDRV_PCM_INFO_NO_PERIOD_WAKEUP |
+		 SNDRV_PCM_INFO_INTERLEAVED |
+		 SNDRV_PCM_INFO_MMAP_VALID),
+	.formats = (SNDRV_PCM_FMTBIT_S16_LE |
+		    SNDRV_PCM_FMTBIT_S24_LE |
+		    SNDRV_PCM_FMTBIT_S32_LE),
+	.period_bytes_min = 96,
+	.period_bytes_max = 4 * 48 * 1024,
+	.periods_min = 2,
+	.periods_max = 256,
+	.buffer_bytes_max = 256 * 1024,
+	.fifo_size = 0,
+};
+
+static unsigned int mt8196_rate_transform(struct device *dev,
+					  unsigned int rate)
+{
+	switch (rate) {
+	case 8000:
+		return MTK_AFE_IPM2P0_RATE_8K;
+	case 11025:
+		return MTK_AFE_IPM2P0_RATE_11K;
+	case 12000:
+		return MTK_AFE_IPM2P0_RATE_12K;
+	case 16000:
+		return MTK_AFE_IPM2P0_RATE_16K;
+	case 22050:
+		return MTK_AFE_IPM2P0_RATE_22K;
+	case 24000:
+		return MTK_AFE_IPM2P0_RATE_24K;
+	case 32000:
+		return MTK_AFE_IPM2P0_RATE_32K;
+	case 44100:
+		return MTK_AFE_IPM2P0_RATE_44K;
+	case 48000:
+		return MTK_AFE_IPM2P0_RATE_48K;
+	case 88200:
+		return MTK_AFE_IPM2P0_RATE_88K;
+	case 96000:
+		return MTK_AFE_IPM2P0_RATE_96K;
+	case 176400:
+		return MTK_AFE_IPM2P0_RATE_176K;
+	case 192000:
+		return MTK_AFE_IPM2P0_RATE_192K;
+	/* not support 260K */
+	case 352800:
+		return MTK_AFE_IPM2P0_RATE_352K;
+	case 384000:
+		return MTK_AFE_IPM2P0_RATE_384K;
+	default:
+		dev_info(dev, "rate %u invalid, use %d!!!\n",
+			 rate, MTK_AFE_IPM2P0_RATE_48K);
+		return MTK_AFE_IPM2P0_RATE_48K;
+	}
+}
+
+static void mt8196_set_cm_rate(struct mtk_base_afe *afe, int id, unsigned int rate)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+
+	afe_priv->cm_rate[id] = rate;
+}
+
+static int mt8196_convert_cm_ch(unsigned int ch)
+{
+	return ch - 1;
+}
+
+static unsigned int calculate_cm_update(unsigned int rate, unsigned int ch)
+{
+	unsigned int update_val;
+
+	update_val = (((26000000 / rate) - 10) / (ch / 2)) - 1;
+
+	return update_val;
+}
+
+static int mt8196_set_cm(struct mtk_base_afe *afe, int id,
+			 bool update, bool swap, unsigned int ch)
+{
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	unsigned int rate = afe_priv->cm_rate[id];
+	unsigned int rate_val = mt8196_rate_transform(afe->dev, rate);
+	unsigned int update_val = update ? calculate_cm_update(rate, ch) : 0x64;
+	int reg = AFE_CM0_CON0 + 0x10 * id;
+
+	dev_dbg(afe->dev, "CM%d, rate %d, update %d, swap %d, ch %d\n",
+		id, rate, update, swap, ch);
+
+	/* update cnt */
+	regmap_update_bits(afe->regmap,
+			   reg,
+			   AFE_CM_UPDATE_CNT_MASK << AFE_CM_UPDATE_CNT_SFT,
+			   update_val << AFE_CM_UPDATE_CNT_SFT);
+
+	/* rate */
+	regmap_update_bits(afe->regmap,
+			   reg,
+			   AFE_CM_1X_EN_SEL_FS_MASK << AFE_CM_1X_EN_SEL_FS_SFT,
+			   rate_val << AFE_CM_1X_EN_SEL_FS_SFT);
+
+	/* ch num */
+	ch = mt8196_convert_cm_ch(ch);
+	regmap_update_bits(afe->regmap,
+			   reg,
+			   AFE_CM_CH_NUM_MASK << AFE_CM_CH_NUM_SFT,
+			   ch << AFE_CM_CH_NUM_SFT);
+
+	/* swap */
+	regmap_update_bits(afe->regmap,
+			   reg,
+			   AFE_CM_BYTE_SWAP_MASK << AFE_CM_BYTE_SWAP_SFT,
+			   swap << AFE_CM_BYTE_SWAP_SFT);
+
+	return 0;
+}
+
+static int mt8196_enable_cm_bypass(struct mtk_base_afe *afe, int id, bool en)
+{
+	int reg = AFE_CM0_CON0 + 0x10 * id;
+
+	regmap_update_bits(afe->regmap,
+			   reg,
+			   AFE_CM_BYPASS_MODE_MASK << AFE_CM_BYPASS_MODE_SFT,
+			   en << AFE_CM_BYPASS_MODE_SFT);
+
+	return 0;
+}
+
+static int mt8196_fe_startup(struct snd_pcm_substream *substream,
+			     struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct snd_pcm_runtime *runtime = substream->runtime;
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	int memif_num = cpu_dai->id;
+	struct mtk_base_afe_memif *memif = &afe->memif[memif_num];
+	const struct snd_pcm_hardware *mtk_afe_hardware = afe->mtk_afe_hardware;
+	int ret;
+
+	dev_dbg(afe->dev, "memif_num: %d.\n", memif_num);
+
+	memif->substream = substream;
+
+	snd_pcm_hw_constraint_step(substream->runtime, 0,
+				   SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 16);
+
+	snd_soc_set_runtime_hwparams(substream, mtk_afe_hardware);
+
+	ret = snd_pcm_hw_constraint_integer(runtime,
+					    SNDRV_PCM_HW_PARAM_PERIODS);
+	if (ret < 0)
+		dev_info(afe->dev, "snd_pcm_hw_constraint_integer failed\n");
+
+	/* dynamic allocate irq to memif */
+	if (memif->irq_usage < 0) {
+		int irq_id = mtk_dynamic_irq_acquire(afe);
+
+		if (irq_id != afe->irqs_size) {
+			/* link */
+			memif->irq_usage = irq_id;
+		} else {
+			dev_err(afe->dev, "no more asys irq\n");
+			ret = -EBUSY;
+		}
+	}
+	return ret;
+}
+
+static void mt8196_fe_shutdown(struct snd_pcm_substream *substream,
+			       struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	int memif_num = cpu_dai->id;
+	struct mtk_base_afe_memif *memif = &afe->memif[memif_num];
+	int irq_id = memif->irq_usage;
+
+	dev_dbg(afe->dev, "memif_num: %d.\n", memif_num);
+
+	memif->substream = NULL;
+	afe_priv->irq_cnt[memif_num] = 0;
+	afe_priv->xrun_assert[memif_num] = 0;
+
+	if (!memif->const_irq) {
+		mtk_dynamic_irq_release(afe, irq_id);
+		memif->irq_usage = -1;
+		memif->substream = NULL;
+	}
+}
+
+static int mt8196_fe_hw_params(struct snd_pcm_substream *substream,
+			       struct snd_pcm_hw_params *params,
+			       struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	unsigned int channels = params_channels(params);
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
+	struct mtk_base_afe_memif *memif = &afe->memif[id];
+	const struct mtk_base_memif_data *data = memif->data;
+
+	afe_priv->cm_channels = channels;
+
+	/* set channels */
+	if (data->ch_num_shift >= 0) {
+		regmap_update_bits(afe->regmap, data->ch_num_reg,
+				   data->ch_num_maskbit << data->ch_num_shift,
+				   channels << data->ch_num_shift);
+	}
+
+	return mtk_afe_fe_hw_params(substream, params, dai);
+}
+
+static int mt8196_fe_trigger(struct snd_pcm_substream *substream, int cmd,
+			     struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_pcm_runtime *const runtime = substream->runtime;
+	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	int id = cpu_dai->id;
+	struct mtk_base_afe_memif *memif = &afe->memif[id];
+	int irq_id = memif->irq_usage;
+	struct mtk_base_afe_irq *irqs = &afe->irqs[irq_id];
+	const struct mtk_base_irq_data *irq_data = irqs->irq_data;
+	unsigned int counter = runtime->period_size;
+	unsigned int rate = runtime->rate;
+	int fs;
+	int ret = 0;
+	unsigned int tmp_reg = 0;
+
+	dev_info(afe->dev, "%s cmd %d, irq_id %d\n",
+		 memif->data->name, cmd, irq_id);
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+	case SNDRV_PCM_TRIGGER_RESUME:
+		dev_dbg(afe->dev, "%s cmd %d, id %d\n",
+			memif->data->name, cmd, id);
+		ret = mtk_memif_set_enable(afe, id);
+		if (ret) {
+			dev_err(afe->dev, "id %d, memif enable fail.\n", id);
+			return ret;
+		}
+
+		/*
+		 * for small latency record
+		 * ul memif need read some data before irq enable
+		 */
+		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+			if ((runtime->period_size * 1000) / rate <= 10)
+				usleep_range(300, 350);
+		}
+
+		/* set irq counter */
+		if (afe_priv->irq_cnt[id] > 0)
+			counter = afe_priv->irq_cnt[id];
+
+		regmap_update_bits(afe->regmap,
+				   irq_data->irq_cnt_reg,
+				   irq_data->irq_cnt_maskbit << irq_data->irq_cnt_shift,
+				   counter << irq_data->irq_cnt_shift);
+
+		/* set irq fs */
+		fs = afe->irq_fs(substream, runtime->rate);
+		if (fs < 0)
+			return -EINVAL;
+
+		if (irq_data->irq_fs_reg >= 0)
+			regmap_update_bits(afe->regmap,
+					   irq_data->irq_fs_reg,
+					   irq_data->irq_fs_maskbit << irq_data->irq_fs_shift,
+					   fs << irq_data->irq_fs_shift);
+
+		/* enable interrupt */
+		regmap_update_bits(afe->regmap,
+				   irq_data->irq_en_reg,
+				   1 << irq_data->irq_en_shift,
+				   1 << irq_data->irq_en_shift);
+
+		return 0;
+	case SNDRV_PCM_TRIGGER_STOP:
+	case SNDRV_PCM_TRIGGER_SUSPEND:
+		ret = mtk_memif_set_disable(afe, id);
+		if (ret) {
+			dev_warn(afe->dev,
+				 "id %d, memif disable fail\n", id);
+		}
+
+		/* disable interrupt */
+		regmap_update_bits(afe->regmap,
+				   irq_data->irq_en_reg,
+				   1 << irq_data->irq_en_shift,
+				   0 << irq_data->irq_en_shift);
+
+		/* clear pending IRQ */
+		regmap_read(afe->regmap, irq_data->irq_clr_reg, &tmp_reg);
+		regmap_update_bits(afe->regmap, irq_data->irq_clr_reg,
+				   AFE_IRQ_CLR_CFG_MASK_SFT | AFE_IRQ_MISS_FLAG_CLR_CFG_MASK_SFT,
+				   tmp_reg ^ (AFE_IRQ_CLR_CFG_MASK_SFT |
+				   AFE_IRQ_MISS_FLAG_CLR_CFG_MASK_SFT));
+
+		return ret;
+	default:
+		return -EINVAL;
+	}
+}
+
+static int mt8196_memif_fs(struct snd_pcm_substream *substream,
+			   unsigned int rate)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_component *component =
+		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
+	struct mtk_base_afe *afe = NULL;
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	int id = cpu_dai->id;
+	unsigned int rate_reg = 0;
+	int cm = 0;
+
+	if (!component)
+		return -EINVAL;
+
+	afe = snd_soc_component_get_drvdata(component);
+
+	if (!afe)
+		return -EINVAL;
+
+	rate_reg = mt8196_rate_transform(afe->dev, rate);
+
+	switch (id) {
+	case MT8196_MEMIF_VUL8:
+	case MT8196_MEMIF_VUL_CM0:
+		cm = CM0;
+		break;
+	case MT8196_MEMIF_VUL9:
+	case MT8196_MEMIF_VUL_CM1:
+		cm = CM1;
+		break;
+	case MT8196_MEMIF_VUL10:
+	case MT8196_MEMIF_VUL_CM2:
+		cm = CM2;
+		break;
+	default:
+		cm = CM0;
+		break;
+	}
+
+	mt8196_set_cm_rate(afe, cm, rate);
+
+	return rate_reg;
+}
+
+static int mt8196_get_dai_fs(struct mtk_base_afe *afe,
+			     int dai_id, unsigned int rate)
+{
+	return mt8196_rate_transform(afe->dev, rate);
+}
+
+static int mt8196_irq_fs(struct snd_pcm_substream *substream, unsigned int rate)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_component *component =
+		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
+	struct mtk_base_afe *afe = NULL;
+
+	if (!component)
+		return -EINVAL;
+	afe = snd_soc_component_get_drvdata(component);
+	return mt8196_rate_transform(afe->dev, rate);
+}
+
+static int mt8196_get_memif_pbuf_size(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	if ((runtime->period_size * 1000) / runtime->rate > 10)
+		return MT8196_MEMIF_PBUF_SIZE_256_BYTES;
+	else
+		return MT8196_MEMIF_PBUF_SIZE_32_BYTES;
+}
+
+/* FE DAIs */
+static const struct snd_soc_dai_ops mt8196_memif_dai_ops = {
+	.startup        = mt8196_fe_startup,
+	.shutdown       = mt8196_fe_shutdown,
+	.hw_params      = mt8196_fe_hw_params,
+	.hw_free        = mtk_afe_fe_hw_free,
+	.prepare        = mtk_afe_fe_prepare,
+	.trigger        = mt8196_fe_trigger,
+};
+
+#define MTK_PCM_RATES (SNDRV_PCM_RATE_8000_48000 |\
+		       SNDRV_PCM_RATE_88200 |\
+		       SNDRV_PCM_RATE_96000 |\
+		       SNDRV_PCM_RATE_176400 |\
+		       SNDRV_PCM_RATE_192000)
+
+#define MTK_PCM_DAI_RATES (SNDRV_PCM_RATE_8000 |\
+			   SNDRV_PCM_RATE_16000 |\
+			   SNDRV_PCM_RATE_32000 |\
+			   SNDRV_PCM_RATE_48000)
+
+#define MTK_PCM_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
+			 SNDRV_PCM_FMTBIT_S24_LE |\
+			 SNDRV_PCM_FMTBIT_S32_LE)
+
+#define MT8196_FE_DAI_PLAYBACK(_name, _id, max_ch) \
+{ \
+	.name = #_name, \
+	.id = _id, \
+	.playback = { \
+		.stream_name = #_name, \
+		.channels_min = 1, \
+		.channels_max = max_ch, \
+		.rates = MTK_PCM_RATES, \
+		.formats = MTK_PCM_FORMATS, \
+	}, \
+	.ops = &mt8196_memif_dai_ops, \
+}
+
+#define MT8196_FE_DAI_CAPTURE(_name, _id, max_ch) \
+{ \
+	.name = #_name, \
+	.id = _id, \
+	.capture = { \
+		.stream_name = #_name, \
+		.channels_min = 1, \
+		.channels_max = max_ch, \
+		.rates = MTK_PCM_RATES, \
+		.formats = MTK_PCM_FORMATS, \
+	}, \
+	.ops = &mt8196_memif_dai_ops, \
+}
+
+static struct snd_soc_dai_driver mt8196_memif_dai_driver[] = {
+	/* FE DAIs: memory intefaces to CPU */
+	/* Playback */
+	MT8196_FE_DAI_PLAYBACK(DL0, MT8196_MEMIF_DL0, 2),
+	MT8196_FE_DAI_PLAYBACK(DL1, MT8196_MEMIF_DL1, 2),
+	MT8196_FE_DAI_PLAYBACK(DL2, MT8196_MEMIF_DL2, 2),
+	MT8196_FE_DAI_PLAYBACK(DL3, MT8196_MEMIF_DL3, 2),
+	MT8196_FE_DAI_PLAYBACK(DL4, MT8196_MEMIF_DL4, 2),
+	MT8196_FE_DAI_PLAYBACK(DL5, MT8196_MEMIF_DL5, 2),
+	MT8196_FE_DAI_PLAYBACK(DL6, MT8196_MEMIF_DL6, 2),
+	MT8196_FE_DAI_PLAYBACK(DL7, MT8196_MEMIF_DL7, 2),
+	MT8196_FE_DAI_PLAYBACK(DL8, MT8196_MEMIF_DL8, 2),
+	MT8196_FE_DAI_PLAYBACK(DL23, MT8196_MEMIF_DL23, 2),
+	MT8196_FE_DAI_PLAYBACK(DL24, MT8196_MEMIF_DL24, 2),
+	MT8196_FE_DAI_PLAYBACK(DL25, MT8196_MEMIF_DL25, 2),
+	MT8196_FE_DAI_PLAYBACK(DL26, MT8196_MEMIF_DL26, 2),
+	MT8196_FE_DAI_PLAYBACK(DL_4CH, MT8196_MEMIF_DL_4CH, 4),
+	MT8196_FE_DAI_PLAYBACK(DL_24CH, MT8196_MEMIF_DL_24CH, 8),
+	MT8196_FE_DAI_PLAYBACK(HDMI, MT8196_MEMIF_HDMI, 8),
+	/* Capture */
+	MT8196_FE_DAI_CAPTURE(UL0, MT8196_MEMIF_VUL0, 2),
+	MT8196_FE_DAI_CAPTURE(UL1, MT8196_MEMIF_VUL1, 2),
+	MT8196_FE_DAI_CAPTURE(UL2, MT8196_MEMIF_VUL2, 2),
+	MT8196_FE_DAI_CAPTURE(UL3, MT8196_MEMIF_VUL3, 2),
+	MT8196_FE_DAI_CAPTURE(UL4, MT8196_MEMIF_VUL4, 2),
+	MT8196_FE_DAI_CAPTURE(UL5, MT8196_MEMIF_VUL5, 2),
+	MT8196_FE_DAI_CAPTURE(UL6, MT8196_MEMIF_VUL6, 2),
+	MT8196_FE_DAI_CAPTURE(UL7, MT8196_MEMIF_VUL7, 2),
+	MT8196_FE_DAI_CAPTURE(UL8, MT8196_MEMIF_VUL8, 2),
+	MT8196_FE_DAI_CAPTURE(UL9, MT8196_MEMIF_VUL9, 16),
+	MT8196_FE_DAI_CAPTURE(UL10, MT8196_MEMIF_VUL10, 2),
+	MT8196_FE_DAI_CAPTURE(UL24, MT8196_MEMIF_VUL24, 2),
+	MT8196_FE_DAI_CAPTURE(UL25, MT8196_MEMIF_VUL25, 2),
+	MT8196_FE_DAI_CAPTURE(UL26, MT8196_MEMIF_VUL26, 2),
+	MT8196_FE_DAI_CAPTURE(UL_CM0, MT8196_MEMIF_VUL_CM0, 8),
+	MT8196_FE_DAI_CAPTURE(UL_CM1, MT8196_MEMIF_VUL_CM1, 16),
+	MT8196_FE_DAI_CAPTURE(UL_CM2, MT8196_MEMIF_VUL_CM2, 32),
+	MT8196_FE_DAI_CAPTURE(UL_ETDM_IN0, MT8196_MEMIF_ETDM_IN0, 2),
+	MT8196_FE_DAI_CAPTURE(UL_ETDM_IN1, MT8196_MEMIF_ETDM_IN1, 2),
+	MT8196_FE_DAI_CAPTURE(UL_ETDM_IN2, MT8196_MEMIF_ETDM_IN2, 2),
+	MT8196_FE_DAI_CAPTURE(UL_ETDM_IN3, MT8196_MEMIF_ETDM_IN3, 2),
+	MT8196_FE_DAI_CAPTURE(UL_ETDM_IN4, MT8196_MEMIF_ETDM_IN4, 2),
+	MT8196_FE_DAI_CAPTURE(UL_ETDM_IN6, MT8196_MEMIF_ETDM_IN6, 2),
+};
+
+static const struct snd_kcontrol_new mt8196_pcm_kcontrols[] = {
+};
+
+enum {
+	CM0_MUX_VUL8_2CH,
+	CM0_MUX_VUL8_8CH,
+	CM0_MUX_MASK,
+};
+
+enum {
+	CM1_MUX_VUL9_2CH,
+	CM1_MUX_VUL9_16CH,
+	CM1_MUX_MASK,
+};
+
+enum {
+	CM2_MUX_VUL10_2CH,
+	CM2_MUX_VUL10_32CH,
+	CM2_MUX_MASK,
+};
+
+static int ul_cm0_event(struct snd_soc_dapm_widget *w,
+			struct snd_kcontrol *kcontrol,
+			int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	unsigned int channels = afe_priv->cm_channels;
+
+	dev_dbg(afe->dev, "event 0x%x, name %s, channels %u\n",
+		event, w->name, channels);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		mt8196_enable_cm_bypass(afe, CM0, 0x0);
+		mt8196_set_cm(afe, CM0, true, false, channels);
+		regmap_update_bits(afe->regmap, AUDIO_TOP_CON0,
+				   PDN_CM0_MASK_SFT, 0 << PDN_CM0_SFT);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		mt8196_enable_cm_bypass(afe, CM0, 0x1);
+		regmap_update_bits(afe->regmap, AUDIO_TOP_CON0,
+				   PDN_CM0_MASK_SFT, 1 << PDN_CM0_SFT);
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static int ul_cm1_event(struct snd_soc_dapm_widget *w,
+			struct snd_kcontrol *kcontrol,
+			int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	unsigned int channels = afe_priv->cm_channels;
+
+	dev_dbg(afe->dev, "event 0x%x, name %s, channels %u\n",
+		event, w->name, channels);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		mt8196_enable_cm_bypass(afe, CM1, 0x0);
+		mt8196_set_cm(afe, CM1, true, false, channels);
+		regmap_update_bits(afe->regmap, AUDIO_TOP_CON0,
+				   PDN_CM1_MASK_SFT, 0 << PDN_CM1_SFT);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		mt8196_enable_cm_bypass(afe, CM1, 0x1);
+		regmap_update_bits(afe->regmap, AUDIO_TOP_CON0,
+				   PDN_CM1_MASK_SFT, 1 << PDN_CM1_SFT);
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static int ul_cm2_event(struct snd_soc_dapm_widget *w,
+			struct snd_kcontrol *kcontrol,
+			int event)
+{
+	struct snd_soc_component *cmpnt = snd_soc_dapm_to_component(w->dapm);
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(cmpnt);
+	struct mt8196_afe_private *afe_priv = afe->platform_priv;
+	unsigned int channels = afe_priv->cm_channels;
+
+	dev_dbg(afe->dev, "event 0x%x, name %s, channels %u\n",
+		event, w->name, channels);
+
+	switch (event) {
+	case SND_SOC_DAPM_PRE_PMU:
+		mt8196_enable_cm_bypass(afe, CM2, 0x0);
+		mt8196_set_cm(afe, CM2, true, false, channels);
+		regmap_update_bits(afe->regmap, AUDIO_TOP_CON0,
+				   PDN_CM2_MASK_SFT, 0 << PDN_CM2_SFT);
+		break;
+	case SND_SOC_DAPM_PRE_PMD:
+		mt8196_enable_cm_bypass(afe, CM2, 0x1);
+		regmap_update_bits(afe->regmap, AUDIO_TOP_CON0,
+				   PDN_CM2_MASK_SFT, 1 << PDN_CM2_SFT);
+		break;
+	default:
+		break;
+	}
+	return 0;
+}
+
+/* dma widget & routes*/
+static const struct snd_kcontrol_new memif_ul0_ch1_mix[] = {
+	/* Normal record */
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN018_0,
+				    I_ADDA_UL_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul0_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN019_0,
+				    I_ADDA_UL_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul1_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I2SIN4_CH1", AFE_CONN020_4,
+				    I_I2SIN4_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2SIN6_CH1", AFE_CONN020_5,
+				    I_I2SIN6_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul1_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I2SIN4_CH2", AFE_CONN021_4,
+				    I_I2SIN4_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2SIN6_CH2", AFE_CONN021_5,
+				    I_I2SIN6_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul2_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN022_0,
+				    I_ADDA_UL_CH3, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul2_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN023_0,
+				    I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul3_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I2SIN0_CH1", AFE_CONN024_4,
+				    I_I2SIN0_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2SIN1_CH1", AFE_CONN024_4,
+				    I_I2SIN1_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2SIN3_CH1", AFE_CONN024_4,
+				    I_I2SIN3_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2SIN4_CH1", AFE_CONN024_4,
+				    I_I2SIN4_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul3_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I2SIN0_CH2", AFE_CONN025_4,
+				    I_I2SIN0_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2SIN1_CH2", AFE_CONN025_4,
+				    I_I2SIN1_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2SIN3_CH2", AFE_CONN025_4,
+				    I_I2SIN3_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2SIN4_CH2", AFE_CONN025_4,
+				    I_I2SIN4_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul4_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN026_0,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL0_CH1", AFE_CONN026_1,
+				    I_DL0_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH1", AFE_CONN026_1,
+				    I_DL1_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL6_CH1", AFE_CONN026_1,
+				    I_DL6_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH1", AFE_CONN026_1,
+				    I_DL2_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH1", AFE_CONN026_1,
+				    I_DL3_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL_24CH_CH1", AFE_CONN026_1,
+				    I_DL_24CH_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2SIN0_CH1", AFE_CONN026_4,
+				    I_I2SIN0_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul4_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN027_0,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL0_CH2", AFE_CONN027_1,
+				    I_DL0_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL1_CH2", AFE_CONN027_1,
+				    I_DL1_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL6_CH2", AFE_CONN027_1,
+				    I_DL6_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL2_CH2", AFE_CONN027_1,
+				    I_DL2_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL3_CH2", AFE_CONN027_1,
+				    I_DL3_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("DL_24CH_CH2", AFE_CONN027_1,
+				    I_DL_24CH_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2SIN0_CH2", AFE_CONN027_4,
+				    I_I2SIN0_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul5_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I2SIN3_CH1", AFE_CONN028_4,
+				    I_I2SIN3_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul5_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I2SIN3_CH2", AFE_CONN029_4,
+				    I_I2SIN3_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul6_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN030_0,
+				    I_ADDA_UL_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul6_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN031_0,
+				    I_ADDA_UL_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul7_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN032_0,
+				    I_ADDA_UL_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul7_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN033_0,
+				    I_ADDA_UL_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul8_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN034_0,
+				    I_ADDA_UL_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul8_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN035_0,
+				    I_ADDA_UL_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul9_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN036_0,
+				    I_ADDA_UL_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul9_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN037_0,
+				    I_ADDA_UL_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul10_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN038_0,
+				    I_ADDA_UL_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul10_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN039_0,
+				    I_ADDA_UL_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul24_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I2SIN0_CH1", AFE_CONN066_4,
+				    I_I2SIN0_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2SIN6_CH1", AFE_CONN066_5,
+				    I_I2SIN6_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul24_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I2SIN0_CH2", AFE_CONN067_4,
+				    I_I2SIN0_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2SIN6_CH2", AFE_CONN067_5,
+				    I_I2SIN6_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul25_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I2SIN0_CH1", AFE_CONN068_4,
+				    I_I2SIN0_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2SIN6_CH1", AFE_CONN068_5,
+				    I_I2SIN6_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul25_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I2SIN0_CH2", AFE_CONN069_4,
+				    I_I2SIN0_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2SIN6_CH2", AFE_CONN069_5,
+				    I_I2SIN6_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul26_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I2SIN0_CH1", AFE_CONN070_4,
+				    I_I2SIN0_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2SIN6_CH1", AFE_CONN070_5,
+				    I_I2SIN6_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul26_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("I2SIN0_CH2", AFE_CONN071_4,
+				    I_I2SIN0_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("I2SIN6_CH2", AFE_CONN071_5,
+				    I_I2SIN6_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm0_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN040_0,
+				    I_ADDA_UL_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm0_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN041_0,
+				    I_ADDA_UL_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm0_ch3_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN042_0,
+				    I_ADDA_UL_CH3, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm0_ch4_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN043_0,
+				    I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm0_ch5_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN044_0,
+				    I_ADDA_UL_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm0_ch6_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN045_0,
+				    I_ADDA_UL_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm0_ch7_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN046_0,
+				    I_ADDA_UL_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm0_ch8_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN047_0,
+				    I_ADDA_UL_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm1_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN048_0,
+				    I_ADDA_UL_CH1, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm1_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN049_0,
+				    I_ADDA_UL_CH2, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm1_ch3_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN050_0,
+				    I_ADDA_UL_CH3, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm1_ch4_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN051_0,
+				    I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm1_ch5_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN052_0,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN052_0,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN052_0,
+				    I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN052_0,
+				    I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm1_ch6_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN053_0,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN053_0,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN053_0,
+				    I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN053_0,
+				    I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm1_ch7_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN054_0,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN054_0,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN054_0,
+				    I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN054_0,
+				    I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm1_ch8_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN055_0,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN055_0,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN055_0,
+				    I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN055_0,
+				    I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm1_ch9_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN056_0,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN056_0,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN056_0,
+				    I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN056_0,
+				    I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm1_ch10_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN057_0,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN057_0,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN057_0,
+				    I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN057_0,
+				    I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm1_ch11_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN058_0,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN058_0,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN058_0,
+				    I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN058_0,
+				    I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm1_ch12_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN059_0,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN059_0,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN059_0,
+				    I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN059_0,
+				    I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm1_ch13_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN060_0,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN060_0,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN060_0,
+				    I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN060_0,
+				    I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm1_ch14_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN061_0,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN061_0,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN061_0,
+				    I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN061_0,
+				    I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm1_ch15_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN062_0,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN062_0,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN062_0,
+				    I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN062_0,
+				    I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm1_ch16_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN063_0,
+				    I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN063_0,
+				    I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN063_0,
+				    I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN063_0,
+				    I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm2_ch1_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN064_0, I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN064_0, I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN064_0, I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN064_0, I_ADDA_UL_CH4, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH5", AFE_CONN064_0, I_ADDA_UL_CH5, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH6", AFE_CONN064_0, I_ADDA_UL_CH6, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm2_ch2_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN065_0, I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN065_0, I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN065_0, I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN065_0, I_ADDA_UL_CH4, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH5", AFE_CONN065_0, I_ADDA_UL_CH5, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH6", AFE_CONN065_0, I_ADDA_UL_CH6, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm2_ch3_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN066_0, I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN066_0, I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN066_0, I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN066_0, I_ADDA_UL_CH4, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH5", AFE_CONN066_0, I_ADDA_UL_CH5, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH6", AFE_CONN066_0, I_ADDA_UL_CH6, 1, 0)
+};
+
+static const struct snd_kcontrol_new memif_ul_cm2_ch4_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN067_0, I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN067_0, I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN067_0, I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN067_0, I_ADDA_UL_CH4, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH5", AFE_CONN067_0, I_ADDA_UL_CH5, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH6", AFE_CONN067_0, I_ADDA_UL_CH6, 1, 0)
+};
+
+static const struct snd_kcontrol_new memif_ul_cm2_ch5_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN068_0, I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN068_0, I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN068_0, I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN068_0, I_ADDA_UL_CH4, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH5", AFE_CONN068_0, I_ADDA_UL_CH5, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH6", AFE_CONN068_0, I_ADDA_UL_CH6, 1, 0)
+};
+
+static const struct snd_kcontrol_new memif_ul_cm2_ch6_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN069_0, I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN069_0, I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN069_0, I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN069_0, I_ADDA_UL_CH4, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH5", AFE_CONN069_0, I_ADDA_UL_CH5, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH6", AFE_CONN069_0, I_ADDA_UL_CH6, 1, 0)
+};
+
+static const struct snd_kcontrol_new memif_ul_cm2_ch7_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN070_0, I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN070_0, I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN070_0, I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN070_0, I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm2_ch8_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN071_0, I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN071_0, I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN071_0, I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN071_0, I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm2_ch9_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN072_0, I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN072_0, I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN072_0, I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN072_0, I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm2_ch10_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN073_0, I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN073_0, I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN073_0, I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN073_0, I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm2_ch11_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN074_0, I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN074_0, I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN074_0, I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN074_0, I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm2_ch12_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN075_0, I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN075_0, I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN075_0, I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN075_0, I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm2_ch13_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN076_0, I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN076_0, I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN076_0, I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN076_0, I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm2_ch14_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN077_0, I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN077_0, I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN077_0, I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN077_0, I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm2_ch15_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN078_0, I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN078_0, I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN078_0, I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN078_0, I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm2_ch16_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN079_0, I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN079_0, I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN079_0, I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN079_0, I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm2_ch17_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN080_0, I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN080_0, I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN080_0, I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN080_0, I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm2_ch18_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN081_0, I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN081_0, I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN081_0, I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN081_0, I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm2_ch19_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN082_0, I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN082_0, I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN082_0, I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN082_0, I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm2_ch20_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN083_0, I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN083_0, I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN083_0, I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN083_0, I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm2_ch21_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN084_0, I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN084_0, I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN084_0, I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN084_0, I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm2_ch22_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN085_0, I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN085_0, I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN085_0, I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN085_0, I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm2_ch23_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN086_0, I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN086_0, I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN086_0, I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN086_0, I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm2_ch24_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN087_0, I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN087_0, I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN087_0, I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN087_0, I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm2_ch25_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN088_0, I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN088_0, I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN088_0, I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN088_0, I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm2_ch26_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN089_0, I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN089_0, I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN089_0, I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN089_0, I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm2_ch27_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN090_0, I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN090_0, I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN090_0, I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN090_0, I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm2_ch28_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN091_0, I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN091_0, I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN091_0, I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN091_0, I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm2_ch29_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN092_0, I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN092_0, I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN092_0, I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN092_0, I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm2_ch30_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN093_0, I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN093_0, I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN093_0, I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN093_0, I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm2_ch31_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN094_0, I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN094_0, I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN094_0, I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN094_0, I_ADDA_UL_CH4, 1, 0),
+};
+
+static const struct snd_kcontrol_new memif_ul_cm2_ch32_mix[] = {
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN095_0, I_ADDA_UL_CH1, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH2", AFE_CONN095_0, I_ADDA_UL_CH2, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH3", AFE_CONN095_0, I_ADDA_UL_CH3, 1, 0),
+	SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH4", AFE_CONN095_0, I_ADDA_UL_CH4, 1, 0),
+};
+
+static const char * const cm0_mux_map[] = {
+	"CM0_8CH_PATH",
+	"UL8_2CH_PATH",
+};
+
+static const char * const cm1_mux_map[] = {
+	"CM1_16CH_PATH",
+	"UL9_2CH_PATH",
+};
+
+static const char * const cm2_mux_map[] = {
+	"CM2_32CH_PATH",
+	"UL10_2CH_PATH",
+};
+
+static int cm0_mux_map_value[] = {
+	CM0_MUX_VUL8_8CH,
+	CM0_MUX_VUL8_2CH,
+};
+
+static int cm1_mux_map_value[] = {
+	CM1_MUX_VUL9_16CH,
+	CM1_MUX_VUL9_2CH,
+};
+
+static int cm2_mux_map_value[] = {
+	CM2_MUX_VUL10_32CH,
+	CM2_MUX_VUL10_2CH,
+};
+
+static SOC_VALUE_ENUM_SINGLE_DECL(ul_cm0_mux_map_enum,
+				  AFE_CM0_CON0,
+				  AFE_CM0_OUTPUT_MUX_SFT,
+				  AFE_CM0_OUTPUT_MUX_MASK,
+				  cm0_mux_map,
+				  cm0_mux_map_value);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul_cm1_mux_map_enum,
+				  AFE_CM1_CON0,
+				  AFE_CM1_OUTPUT_MUX_SFT,
+				  AFE_CM1_OUTPUT_MUX_MASK,
+				  cm1_mux_map,
+				  cm1_mux_map_value);
+static SOC_VALUE_ENUM_SINGLE_DECL(ul_cm2_mux_map_enum,
+				  AFE_CM2_CON0,
+				  AFE_CM2_OUTPUT_MUX_SFT,
+				  AFE_CM2_OUTPUT_MUX_MASK,
+				  cm2_mux_map,
+				  cm2_mux_map_value);
+
+static const struct snd_kcontrol_new ul_cm0_mux_control =
+	SOC_DAPM_ENUM("CM0_UL_MUX Route", ul_cm0_mux_map_enum);
+
+static const struct snd_kcontrol_new ul_cm1_mux_control =
+	SOC_DAPM_ENUM("CM1_UL_MUX Route", ul_cm1_mux_map_enum);
+
+static const struct snd_kcontrol_new ul_cm2_mux_control =
+	SOC_DAPM_ENUM("CM2_UL_MUX Route", ul_cm2_mux_map_enum);
+
+static const struct snd_soc_dapm_widget mt8196_memif_widgets[] = {
+	/* inter-connections */
+	SND_SOC_DAPM_MIXER("UL0_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul0_ch1_mix, ARRAY_SIZE(memif_ul0_ch1_mix)),
+	SND_SOC_DAPM_MIXER("UL0_CH2", SND_SOC_NOPM, 0, 0,
+			   memif_ul0_ch2_mix, ARRAY_SIZE(memif_ul0_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("UL1_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul1_ch1_mix, ARRAY_SIZE(memif_ul1_ch1_mix)),
+	SND_SOC_DAPM_MIXER("UL1_CH2", SND_SOC_NOPM, 0, 0,
+			   memif_ul1_ch2_mix, ARRAY_SIZE(memif_ul1_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("UL2_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul2_ch1_mix, ARRAY_SIZE(memif_ul2_ch1_mix)),
+	SND_SOC_DAPM_MIXER("UL2_CH2", SND_SOC_NOPM, 0, 0,
+			   memif_ul2_ch2_mix, ARRAY_SIZE(memif_ul2_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("UL3_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul3_ch1_mix, ARRAY_SIZE(memif_ul3_ch1_mix)),
+	SND_SOC_DAPM_MIXER("UL3_CH2", SND_SOC_NOPM, 0, 0,
+			   memif_ul3_ch2_mix, ARRAY_SIZE(memif_ul3_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("UL4_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul4_ch1_mix, ARRAY_SIZE(memif_ul4_ch1_mix)),
+	SND_SOC_DAPM_MIXER("UL4_CH2", SND_SOC_NOPM, 0, 0,
+			   memif_ul4_ch2_mix, ARRAY_SIZE(memif_ul4_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("UL5_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul5_ch1_mix, ARRAY_SIZE(memif_ul5_ch1_mix)),
+	SND_SOC_DAPM_MIXER("UL5_CH2", SND_SOC_NOPM, 0, 0,
+			   memif_ul5_ch2_mix, ARRAY_SIZE(memif_ul5_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("UL6_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul6_ch1_mix, ARRAY_SIZE(memif_ul6_ch1_mix)),
+	SND_SOC_DAPM_MIXER("UL6_CH2", SND_SOC_NOPM, 0, 0,
+			   memif_ul6_ch2_mix, ARRAY_SIZE(memif_ul6_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("UL7_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul7_ch1_mix, ARRAY_SIZE(memif_ul7_ch1_mix)),
+	SND_SOC_DAPM_MIXER("UL7_CH2", SND_SOC_NOPM, 0, 0,
+			   memif_ul7_ch2_mix, ARRAY_SIZE(memif_ul7_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("UL8_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul8_ch1_mix, ARRAY_SIZE(memif_ul8_ch1_mix)),
+	SND_SOC_DAPM_MIXER("UL8_CH2", SND_SOC_NOPM, 0, 0,
+			   memif_ul8_ch2_mix, ARRAY_SIZE(memif_ul8_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("UL9_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul9_ch1_mix, ARRAY_SIZE(memif_ul9_ch1_mix)),
+	SND_SOC_DAPM_MIXER("UL9_CH2", SND_SOC_NOPM, 0, 0,
+			   memif_ul9_ch2_mix, ARRAY_SIZE(memif_ul9_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("UL10_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul10_ch1_mix, ARRAY_SIZE(memif_ul10_ch1_mix)),
+	SND_SOC_DAPM_MIXER("UL10_CH2", SND_SOC_NOPM, 0, 0,
+			   memif_ul10_ch2_mix, ARRAY_SIZE(memif_ul10_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("UL24_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul24_ch1_mix, ARRAY_SIZE(memif_ul24_ch1_mix)),
+	SND_SOC_DAPM_MIXER("UL24_CH2", SND_SOC_NOPM, 0, 0,
+			   memif_ul24_ch2_mix, ARRAY_SIZE(memif_ul24_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("UL25_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul25_ch1_mix, ARRAY_SIZE(memif_ul25_ch1_mix)),
+	SND_SOC_DAPM_MIXER("UL25_CH2", SND_SOC_NOPM, 0, 0,
+			   memif_ul25_ch2_mix, ARRAY_SIZE(memif_ul25_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("UL26_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul26_ch1_mix, ARRAY_SIZE(memif_ul26_ch1_mix)),
+	SND_SOC_DAPM_MIXER("UL26_CH2", SND_SOC_NOPM, 0, 0,
+			   memif_ul26_ch2_mix, ARRAY_SIZE(memif_ul26_ch2_mix)),
+
+	SND_SOC_DAPM_MIXER("UL_CM0_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm0_ch1_mix, ARRAY_SIZE(memif_ul_cm0_ch1_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM0_CH2", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm0_ch2_mix, ARRAY_SIZE(memif_ul_cm0_ch2_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM0_CH3", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm0_ch3_mix, ARRAY_SIZE(memif_ul_cm0_ch3_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM0_CH4", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm0_ch4_mix, ARRAY_SIZE(memif_ul_cm0_ch4_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM0_CH5", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm0_ch5_mix, ARRAY_SIZE(memif_ul_cm0_ch5_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM0_CH6", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm0_ch6_mix, ARRAY_SIZE(memif_ul_cm0_ch6_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM0_CH7", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm0_ch7_mix, ARRAY_SIZE(memif_ul_cm0_ch7_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM0_CH8", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm0_ch8_mix, ARRAY_SIZE(memif_ul_cm0_ch8_mix)),
+	SND_SOC_DAPM_MUX("CM0_UL_MUX", SND_SOC_NOPM, 0, 0,
+			 &ul_cm0_mux_control),
+	SND_SOC_DAPM_MIXER("UL_CM1_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm1_ch1_mix, ARRAY_SIZE(memif_ul_cm1_ch1_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM1_CH2", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm1_ch2_mix, ARRAY_SIZE(memif_ul_cm1_ch2_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM1_CH3", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm1_ch3_mix, ARRAY_SIZE(memif_ul_cm1_ch3_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM1_CH4", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm1_ch4_mix, ARRAY_SIZE(memif_ul_cm1_ch4_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM1_CH5", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm1_ch5_mix, ARRAY_SIZE(memif_ul_cm1_ch5_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM1_CH6", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm1_ch6_mix, ARRAY_SIZE(memif_ul_cm1_ch6_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM1_CH7", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm1_ch7_mix, ARRAY_SIZE(memif_ul_cm1_ch7_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM1_CH8", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm1_ch8_mix, ARRAY_SIZE(memif_ul_cm1_ch8_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM1_CH9", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm1_ch9_mix, ARRAY_SIZE(memif_ul_cm1_ch9_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM1_CH10", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm1_ch10_mix, ARRAY_SIZE(memif_ul_cm1_ch10_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM1_CH11", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm1_ch11_mix, ARRAY_SIZE(memif_ul_cm1_ch11_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM1_CH12", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm1_ch12_mix, ARRAY_SIZE(memif_ul_cm1_ch12_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM1_CH13", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm1_ch13_mix, ARRAY_SIZE(memif_ul_cm1_ch13_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM1_CH14", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm1_ch14_mix, ARRAY_SIZE(memif_ul_cm1_ch14_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM1_CH15", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm1_ch15_mix, ARRAY_SIZE(memif_ul_cm1_ch15_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM1_CH16", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm1_ch16_mix, ARRAY_SIZE(memif_ul_cm1_ch16_mix)),
+	SND_SOC_DAPM_MUX("CM1_UL_MUX", SND_SOC_NOPM, 0, 0,
+			 &ul_cm1_mux_control),
+	SND_SOC_DAPM_MIXER("UL_CM2_CH1", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm2_ch1_mix, ARRAY_SIZE(memif_ul_cm2_ch1_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM2_CH2", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm2_ch2_mix, ARRAY_SIZE(memif_ul_cm2_ch2_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM2_CH3", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm2_ch3_mix, ARRAY_SIZE(memif_ul_cm2_ch3_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM2_CH4", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm2_ch4_mix, ARRAY_SIZE(memif_ul_cm2_ch4_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM2_CH5", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm2_ch5_mix, ARRAY_SIZE(memif_ul_cm2_ch5_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM2_CH6", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm2_ch6_mix, ARRAY_SIZE(memif_ul_cm2_ch6_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM2_CH7", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm2_ch7_mix, ARRAY_SIZE(memif_ul_cm2_ch7_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM2_CH8", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm2_ch8_mix, ARRAY_SIZE(memif_ul_cm2_ch8_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM2_CH9", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm2_ch9_mix, ARRAY_SIZE(memif_ul_cm2_ch9_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM2_CH10", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm2_ch10_mix, ARRAY_SIZE(memif_ul_cm2_ch10_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM2_CH11", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm2_ch11_mix, ARRAY_SIZE(memif_ul_cm2_ch11_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM2_CH12", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm2_ch12_mix, ARRAY_SIZE(memif_ul_cm2_ch12_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM2_CH13", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm2_ch13_mix, ARRAY_SIZE(memif_ul_cm2_ch13_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM2_CH14", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm2_ch14_mix, ARRAY_SIZE(memif_ul_cm2_ch14_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM2_CH15", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm2_ch15_mix, ARRAY_SIZE(memif_ul_cm2_ch15_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM2_CH16", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm2_ch16_mix, ARRAY_SIZE(memif_ul_cm2_ch16_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM2_CH17", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm2_ch17_mix, ARRAY_SIZE(memif_ul_cm2_ch17_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM2_CH18", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm2_ch18_mix, ARRAY_SIZE(memif_ul_cm2_ch18_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM2_CH19", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm2_ch19_mix, ARRAY_SIZE(memif_ul_cm2_ch19_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM2_CH20", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm2_ch20_mix, ARRAY_SIZE(memif_ul_cm2_ch20_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM2_CH21", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm2_ch21_mix, ARRAY_SIZE(memif_ul_cm2_ch21_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM2_CH22", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm2_ch22_mix, ARRAY_SIZE(memif_ul_cm2_ch22_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM2_CH23", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm2_ch23_mix, ARRAY_SIZE(memif_ul_cm2_ch23_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM2_CH24", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm2_ch24_mix, ARRAY_SIZE(memif_ul_cm2_ch24_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM2_CH25", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm2_ch25_mix, ARRAY_SIZE(memif_ul_cm2_ch25_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM2_CH26", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm2_ch26_mix, ARRAY_SIZE(memif_ul_cm2_ch26_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM2_CH27", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm2_ch27_mix, ARRAY_SIZE(memif_ul_cm2_ch27_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM2_CH28", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm2_ch28_mix, ARRAY_SIZE(memif_ul_cm2_ch28_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM2_CH29", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm2_ch29_mix, ARRAY_SIZE(memif_ul_cm2_ch29_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM2_CH30", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm2_ch30_mix, ARRAY_SIZE(memif_ul_cm2_ch30_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM2_CH31", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm2_ch31_mix, ARRAY_SIZE(memif_ul_cm2_ch31_mix)),
+	SND_SOC_DAPM_MIXER("UL_CM2_CH32", SND_SOC_NOPM, 0, 0,
+			   memif_ul_cm2_ch32_mix, ARRAY_SIZE(memif_ul_cm2_ch32_mix)),
+	SND_SOC_DAPM_MUX("CM2_UL_MUX", SND_SOC_NOPM, 0, 0,
+			 &ul_cm2_mux_control),
+
+	SND_SOC_DAPM_SUPPLY("CM0_Enable",
+			    AFE_CM0_CON0, AFE_CM0_ON_SFT, 0,
+			    ul_cm0_event,
+			    SND_SOC_DAPM_PRE_PMU |
+			    SND_SOC_DAPM_PRE_PMD),
+
+	SND_SOC_DAPM_SUPPLY("CM1_Enable",
+			    AFE_CM1_CON0, AFE_CM1_ON_SFT, 0,
+			    ul_cm1_event,
+			    SND_SOC_DAPM_PRE_PMU |
+			    SND_SOC_DAPM_PRE_PMD),
+
+	SND_SOC_DAPM_SUPPLY("CM2_Enable",
+			    AFE_CM2_CON0, AFE_CM2_ON_SFT, 0,
+			    ul_cm2_event,
+			    SND_SOC_DAPM_PRE_PMU |
+			    SND_SOC_DAPM_PRE_PMD),
+
+	SND_SOC_DAPM_MIXER("SOF_DMA_UL0", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("SOF_DMA_UL1", SND_SOC_NOPM, 0, 0, NULL, 0),
+	SND_SOC_DAPM_MIXER("SOF_DMA_UL2", SND_SOC_NOPM, 0, 0, NULL, 0),
+};
+
+static const struct snd_soc_dapm_route mt8196_memif_routes[] = {
+	{"UL0", NULL, "UL0_CH1"},
+	{"UL0", NULL, "UL0_CH2"},
+	/* Normal record */
+	{"UL0_CH1", "ADDA_UL_CH1", "ADDA_UL_Mux"},
+	{"UL0_CH2", "ADDA_UL_CH2", "ADDA_UL_Mux"},
+	/* SOF Uplink */
+	{"SOF_DMA_UL0", NULL, "UL0_CH1"},
+	{"SOF_DMA_UL0", NULL, "UL0_CH2"},
+
+	{"UL1", NULL, "UL1_CH1"},
+	{"UL1", NULL, "UL1_CH2"},
+	{"UL1_CH1", "I2SIN4_CH1", "I2SIN4"},
+	{"UL1_CH2", "I2SIN4_CH2", "I2SIN4"},
+	{"UL1_CH1", "I2SIN6_CH1", "I2SIN6"},
+	{"UL1_CH2", "I2SIN6_CH2", "I2SIN6"},
+	/* SOF Uplink */
+	{"SOF_DMA_UL1", NULL, "UL1_CH1"},
+	{"SOF_DMA_UL1", NULL, "UL1_CH2"},
+
+	{"UL2", NULL, "UL2_CH1"},
+	{"UL2", NULL, "UL2_CH2"},
+	{"UL2_CH1", "ADDA_UL_CH3", "ADDA_CH34_UL_Mux"},
+	{"UL2_CH2", "ADDA_UL_CH4", "ADDA_CH34_UL_Mux"},
+	/* SOF Uplink */
+	{"SOF_DMA_UL2", NULL, "UL2_CH1"},
+	{"SOF_DMA_UL2", NULL, "UL2_CH2"},
+
+	{"UL3", NULL, "UL3_CH1"},
+	{"UL3", NULL, "UL3_CH2"},
+	{"UL3_CH1", "I2SIN0_CH1", "I2SIN0"},
+	{"UL3_CH2", "I2SIN0_CH2", "I2SIN0"},
+	{"UL3_CH1", "I2SIN1_CH1", "I2SIN1"},
+	{"UL3_CH2", "I2SIN1_CH2", "I2SIN1"},
+	{"UL3_CH1", "I2SIN3_CH1", "I2SIN3"},
+	{"UL3_CH2", "I2SIN3_CH2", "I2SIN3"},
+	{"UL3_CH1", "I2SIN4_CH1", "I2SIN4"},
+	{"UL3_CH2", "I2SIN4_CH2", "I2SIN4"},
+
+	{"UL4", NULL, "UL4_CH1"},
+	{"UL4", NULL, "UL4_CH2"},
+	{"UL4_CH1", "ADDA_UL_CH1", "ADDA_UL_Mux"},
+	{"UL4_CH2", "ADDA_UL_CH2", "ADDA_UL_Mux"},
+	{"UL4_CH1", "I2SIN0_CH1", "I2SIN0"},
+	{"UL4_CH2", "I2SIN0_CH2", "I2SIN0"},
+
+	{"UL5", NULL, "UL5_CH1"},
+	{"UL5", NULL, "UL5_CH2"},
+	{"UL5_CH1", "I2SIN3_CH1", "I2SIN3"},
+	{"UL5_CH2", "I2SIN3_CH2", "I2SIN3"},
+
+	{"UL6", NULL, "UL6_CH1"},
+	{"UL6", NULL, "UL6_CH2"},
+	{"UL6_CH1", "ADDA_UL_CH1", "ADDA_UL_Mux"},
+	{"UL6_CH2", "ADDA_UL_CH2", "ADDA_UL_Mux"},
+
+	{"UL7", NULL, "UL7_CH1"},
+	{"UL7", NULL, "UL7_CH2"},
+	{"UL7_CH1", "ADDA_UL_CH1", "ADDA_UL_Mux"},
+	{"UL7_CH2", "ADDA_UL_CH2", "ADDA_UL_Mux"},
+
+	{"UL8", NULL, "CM0_UL_MUX"},
+	{"CM0_UL_MUX", "UL8_2CH_PATH", "UL8_CH1"},
+	{"CM0_UL_MUX", "UL8_2CH_PATH", "UL8_CH2"},
+	{"CM0_UL_MUX", "CM0_8CH_PATH", "UL_CM0_CH1"},
+	{"CM0_UL_MUX", "CM0_8CH_PATH", "UL_CM0_CH2"},
+	{"CM0_UL_MUX", "CM0_8CH_PATH", "UL_CM0_CH3"},
+	{"CM0_UL_MUX", "CM0_8CH_PATH", "UL_CM0_CH4"},
+	{"CM0_UL_MUX", "CM0_8CH_PATH", "UL_CM0_CH5"},
+	{"CM0_UL_MUX", "CM0_8CH_PATH", "UL_CM0_CH6"},
+	{"CM0_UL_MUX", "CM0_8CH_PATH", "UL_CM0_CH7"},
+	{"CM0_UL_MUX", "CM0_8CH_PATH", "UL_CM0_CH8"},
+	{"UL_CM0_CH1", NULL, "CM0_Enable"},
+	{"UL_CM0_CH2", NULL, "CM0_Enable"},
+	{"UL_CM0_CH3", NULL, "CM0_Enable"},
+	{"UL_CM0_CH4", NULL, "CM0_Enable"},
+	{"UL_CM0_CH5", NULL, "CM0_Enable"},
+	{"UL_CM0_CH6", NULL, "CM0_Enable"},
+	{"UL_CM0_CH7", NULL, "CM0_Enable"},
+	{"UL_CM0_CH8", NULL, "CM0_Enable"},
+
+	/* UL9 */
+	{"UL9", NULL, "CM1_UL_MUX"},
+	{"CM1_UL_MUX", "UL9_2CH_PATH", "UL9_CH1"},
+	{"CM1_UL_MUX", "UL9_2CH_PATH", "UL9_CH2"},
+	{"CM1_UL_MUX", "CM1_16CH_PATH", "UL_CM1_CH1"},
+	{"CM1_UL_MUX", "CM1_16CH_PATH", "UL_CM1_CH2"},
+	{"CM1_UL_MUX", "CM1_16CH_PATH", "UL_CM1_CH3"},
+	{"CM1_UL_MUX", "CM1_16CH_PATH", "UL_CM1_CH4"},
+	{"CM1_UL_MUX", "CM1_16CH_PATH", "UL_CM1_CH5"},
+	{"CM1_UL_MUX", "CM1_16CH_PATH", "UL_CM1_CH6"},
+	{"CM1_UL_MUX", "CM1_16CH_PATH", "UL_CM1_CH7"},
+	{"CM1_UL_MUX", "CM1_16CH_PATH", "UL_CM1_CH8"},
+	{"CM1_UL_MUX", "CM1_16CH_PATH", "UL_CM1_CH9"},
+	{"CM1_UL_MUX", "CM1_16CH_PATH", "UL_CM1_CH10"},
+	{"CM1_UL_MUX", "CM1_16CH_PATH", "UL_CM1_CH11"},
+	{"CM1_UL_MUX", "CM1_16CH_PATH", "UL_CM1_CH12"},
+	{"CM1_UL_MUX", "CM1_16CH_PATH", "UL_CM1_CH13"},
+	{"CM1_UL_MUX", "CM1_16CH_PATH", "UL_CM1_CH14"},
+	{"CM1_UL_MUX", "CM1_16CH_PATH", "UL_CM1_CH15"},
+	{"CM1_UL_MUX", "CM1_16CH_PATH", "UL_CM1_CH16"},
+	{"UL_CM1_CH1", NULL, "CM1_Enable"},
+	{"UL_CM1_CH2", NULL, "CM1_Enable"},
+	{"UL_CM1_CH3", NULL, "CM1_Enable"},
+	{"UL_CM1_CH4", NULL, "CM1_Enable"},
+	{"UL_CM1_CH5", NULL, "CM1_Enable"},
+	{"UL_CM1_CH6", NULL, "CM1_Enable"},
+	{"UL_CM1_CH7", NULL, "CM1_Enable"},
+	{"UL_CM1_CH8", NULL, "CM1_Enable"},
+	{"UL_CM1_CH9", NULL, "CM1_Enable"},
+	{"UL_CM1_CH10", NULL, "CM1_Enable"},
+	{"UL_CM1_CH11", NULL, "CM1_Enable"},
+	{"UL_CM1_CH12", NULL, "CM1_Enable"},
+	{"UL_CM1_CH13", NULL, "CM1_Enable"},
+	{"UL_CM1_CH14", NULL, "CM1_Enable"},
+	{"UL_CM1_CH15", NULL, "CM1_Enable"},
+	{"UL_CM1_CH16", NULL, "CM1_Enable"},
+	{"UL9_CH1", "ADDA_UL_CH1", "ADDA_UL_Mux"},
+	{"UL9_CH2", "ADDA_UL_CH2", "ADDA_UL_Mux"},
+
+	{"UL10", NULL, "CM2_UL_MUX"},
+	{"CM2_UL_MUX", "UL10_2CH_PATH", "UL10_CH1"},
+	{"CM2_UL_MUX", "UL10_2CH_PATH", "UL10_CH2"},
+	{"CM2_UL_MUX", "CM2_32CH_PATH", "UL_CM2_CH1"},
+	{"CM2_UL_MUX", "CM2_32CH_PATH", "UL_CM2_CH2"},
+	{"CM2_UL_MUX", "CM2_32CH_PATH", "UL_CM2_CH3"},
+	{"CM2_UL_MUX", "CM2_32CH_PATH", "UL_CM2_CH4"},
+	{"CM2_UL_MUX", "CM2_32CH_PATH", "UL_CM2_CH5"},
+	{"CM2_UL_MUX", "CM2_32CH_PATH", "UL_CM2_CH6"},
+	{"CM2_UL_MUX", "CM2_32CH_PATH", "UL_CM2_CH7"},
+	{"CM2_UL_MUX", "CM2_32CH_PATH", "UL_CM2_CH8"},
+	{"CM2_UL_MUX", "CM2_32CH_PATH", "UL_CM2_CH9"},
+	{"CM2_UL_MUX", "CM2_32CH_PATH", "UL_CM2_CH10"},
+	{"CM2_UL_MUX", "CM2_32CH_PATH", "UL_CM2_CH11"},
+	{"CM2_UL_MUX", "CM2_32CH_PATH", "UL_CM2_CH12"},
+	{"CM2_UL_MUX", "CM2_32CH_PATH", "UL_CM2_CH13"},
+	{"CM2_UL_MUX", "CM2_32CH_PATH", "UL_CM2_CH14"},
+	{"CM2_UL_MUX", "CM2_32CH_PATH", "UL_CM2_CH15"},
+	{"CM2_UL_MUX", "CM2_32CH_PATH", "UL_CM2_CH16"},
+	{"CM2_UL_MUX", "CM2_32CH_PATH", "UL_CM2_CH17"},
+	{"CM2_UL_MUX", "CM2_32CH_PATH", "UL_CM2_CH18"},
+	{"CM2_UL_MUX", "CM2_32CH_PATH", "UL_CM2_CH19"},
+	{"CM2_UL_MUX", "CM2_32CH_PATH", "UL_CM2_CH20"},
+	{"CM2_UL_MUX", "CM2_32CH_PATH", "UL_CM2_CH21"},
+	{"CM2_UL_MUX", "CM2_32CH_PATH", "UL_CM2_CH22"},
+	{"CM2_UL_MUX", "CM2_32CH_PATH", "UL_CM2_CH23"},
+	{"CM2_UL_MUX", "CM2_32CH_PATH", "UL_CM2_CH24"},
+	{"CM2_UL_MUX", "CM2_32CH_PATH", "UL_CM2_CH25"},
+	{"CM2_UL_MUX", "CM2_32CH_PATH", "UL_CM2_CH26"},
+	{"CM2_UL_MUX", "CM2_32CH_PATH", "UL_CM2_CH27"},
+	{"CM2_UL_MUX", "CM2_32CH_PATH", "UL_CM2_CH28"},
+	{"CM2_UL_MUX", "CM2_32CH_PATH", "UL_CM2_CH29"},
+	{"CM2_UL_MUX", "CM2_32CH_PATH", "UL_CM2_CH30"},
+	{"CM2_UL_MUX", "CM2_32CH_PATH", "UL_CM2_CH31"},
+	{"CM2_UL_MUX", "CM2_32CH_PATH", "UL_CM2_CH32"},
+	{"UL_CM2_CH1", NULL, "CM2_Enable"},
+	{"UL_CM2_CH2", NULL, "CM2_Enable"},
+	{"UL_CM2_CH3", NULL, "CM2_Enable"},
+	{"UL_CM2_CH4", NULL, "CM2_Enable"},
+	{"UL_CM2_CH5", NULL, "CM2_Enable"},
+	{"UL_CM2_CH6", NULL, "CM2_Enable"},
+	{"UL_CM2_CH7", NULL, "CM2_Enable"},
+	{"UL_CM2_CH8", NULL, "CM2_Enable"},
+	{"UL_CM2_CH9", NULL, "CM2_Enable"},
+	{"UL_CM2_CH10", NULL, "CM2_Enable"},
+	{"UL_CM2_CH11", NULL, "CM2_Enable"},
+	{"UL_CM2_CH12", NULL, "CM2_Enable"},
+	{"UL_CM2_CH13", NULL, "CM2_Enable"},
+	{"UL_CM2_CH14", NULL, "CM2_Enable"},
+	{"UL_CM2_CH15", NULL, "CM2_Enable"},
+	{"UL_CM2_CH16", NULL, "CM2_Enable"},
+	{"UL_CM2_CH17", NULL, "CM2_Enable"},
+	{"UL_CM2_CH18", NULL, "CM2_Enable"},
+	{"UL_CM2_CH19", NULL, "CM2_Enable"},
+	{"UL_CM2_CH20", NULL, "CM2_Enable"},
+	{"UL_CM2_CH21", NULL, "CM2_Enable"},
+	{"UL_CM2_CH22", NULL, "CM2_Enable"},
+	{"UL_CM2_CH23", NULL, "CM2_Enable"},
+	{"UL_CM2_CH24", NULL, "CM2_Enable"},
+	{"UL_CM2_CH25", NULL, "CM2_Enable"},
+	{"UL_CM2_CH26", NULL, "CM2_Enable"},
+	{"UL_CM2_CH27", NULL, "CM2_Enable"},
+	{"UL_CM2_CH28", NULL, "CM2_Enable"},
+	{"UL_CM2_CH29", NULL, "CM2_Enable"},
+	{"UL_CM2_CH30", NULL, "CM2_Enable"},
+	{"UL_CM2_CH31", NULL, "CM2_Enable"},
+	{"UL_CM2_CH32", NULL, "CM2_Enable"},
+	{"UL10_CH1", "ADDA_UL_CH1", "ADDA_UL_Mux"},
+	{"UL10_CH2", "ADDA_UL_CH2", "ADDA_UL_Mux"},
+
+	{"UL24", NULL, "UL24_CH1"},
+	{"UL24", NULL, "UL24_CH2"},
+	{"UL24_CH1", "I2SIN6_CH1", "I2SIN6"},
+	{"UL24_CH2", "I2SIN6_CH2", "I2SIN6"},
+	{"UL24_CH1", "I2SIN0_CH1", "I2SIN0"},
+	{"UL24_CH2", "I2SIN0_CH2", "I2SIN0"},
+
+	{"UL25", NULL, "UL25_CH1"},
+	{"UL25", NULL, "UL25_CH2"},
+	{"UL25_CH1", "I2SIN6_CH1", "I2SIN6"},
+	{"UL25_CH2", "I2SIN6_CH2", "I2SIN6"},
+	{"UL25_CH1", "I2SIN0_CH1", "I2SIN0"},
+	{"UL25_CH2", "I2SIN0_CH2", "I2SIN0"},
+
+	{"UL26", NULL, "UL26_CH1"},
+	{"UL26", NULL, "UL26_CH2"},
+	{"UL26_CH1", "I2SIN6_CH1", "I2SIN6"},
+	{"UL26_CH2", "I2SIN6_CH2", "I2SIN6"},
+	{"UL26_CH1", "I2SIN0_CH1", "I2SIN0"},
+	{"UL26_CH2", "I2SIN0_CH2", "I2SIN0"},
+
+	{"UL_CM0", NULL, "UL_CM0_CH1"},
+	{"UL_CM0", NULL, "UL_CM0_CH2"},
+	{"UL_CM0", NULL, "UL_CM0_CH3"},
+	{"UL_CM0", NULL, "UL_CM0_CH4"},
+	{"UL_CM0", NULL, "UL_CM0_CH5"},
+	{"UL_CM0", NULL, "UL_CM0_CH6"},
+	{"UL_CM0", NULL, "UL_CM0_CH7"},
+	{"UL_CM0", NULL, "UL_CM0_CH8"},
+	{"UL_CM0_CH1", "ADDA_UL_CH1", "ADDA_UL_Mux"},
+	{"UL_CM0_CH2", "ADDA_UL_CH2", "ADDA_UL_Mux"},
+	{"UL_CM0_CH3", "ADDA_UL_CH3", "ADDA_CH34_UL_Mux"},
+	{"UL_CM0_CH4", "ADDA_UL_CH4", "ADDA_CH34_UL_Mux"},
+
+	{"UL_CM1", NULL, "UL_CM1_CH1"},
+	{"UL_CM1", NULL, "UL_CM1_CH2"},
+	{"UL_CM1", NULL, "UL_CM1_CH3"},
+	{"UL_CM1", NULL, "UL_CM1_CH4"},
+	{"UL_CM1", NULL, "UL_CM1_CH5"},
+	{"UL_CM1", NULL, "UL_CM1_CH6"},
+	{"UL_CM1", NULL, "UL_CM1_CH7"},
+	{"UL_CM1", NULL, "UL_CM1_CH8"},
+	{"UL_CM1", NULL, "UL_CM1_CH9"},
+	{"UL_CM1", NULL, "UL_CM1_CH10"},
+	{"UL_CM1", NULL, "UL_CM1_CH11"},
+	{"UL_CM1", NULL, "UL_CM1_CH12"},
+	{"UL_CM1", NULL, "UL_CM1_CH13"},
+	{"UL_CM1", NULL, "UL_CM1_CH14"},
+	{"UL_CM1", NULL, "UL_CM1_CH15"},
+	{"UL_CM1", NULL, "UL_CM1_CH16"},
+	{"UL_CM1_CH1", "ADDA_UL_CH1", "ADDA_UL_Mux"},
+	{"UL_CM1_CH2", "ADDA_UL_CH2", "ADDA_UL_Mux"},
+	{"UL_CM1_CH3", "ADDA_UL_CH3", "ADDA_CH34_UL_Mux"},
+	{"UL_CM1_CH4", "ADDA_UL_CH4", "ADDA_CH34_UL_Mux"},
+
+	{"UL_CM2", NULL, "UL_CM2_CH1"},
+	{"UL_CM2", NULL, "UL_CM2_CH2"},
+	{"UL_CM2", NULL, "UL_CM2_CH3"},
+	{"UL_CM2", NULL, "UL_CM2_CH4"},
+	{"UL_CM2", NULL, "UL_CM2_CH5"},
+	{"UL_CM2", NULL, "UL_CM2_CH6"},
+	{"UL_CM2", NULL, "UL_CM2_CH7"},
+	{"UL_CM2", NULL, "UL_CM2_CH8"},
+	{"UL_CM2", NULL, "UL_CM2_CH9"},
+	{"UL_CM2", NULL, "UL_CM2_CH10"},
+	{"UL_CM2", NULL, "UL_CM2_CH11"},
+	{"UL_CM2", NULL, "UL_CM2_CH12"},
+	{"UL_CM2", NULL, "UL_CM2_CH13"},
+	{"UL_CM2", NULL, "UL_CM2_CH14"},
+	{"UL_CM2", NULL, "UL_CM2_CH15"},
+	{"UL_CM2", NULL, "UL_CM2_CH16"},
+	{"UL_CM2", NULL, "UL_CM2_CH17"},
+	{"UL_CM2", NULL, "UL_CM2_CH18"},
+	{"UL_CM2", NULL, "UL_CM2_CH19"},
+	{"UL_CM2", NULL, "UL_CM2_CH20"},
+	{"UL_CM2", NULL, "UL_CM2_CH21"},
+	{"UL_CM2", NULL, "UL_CM2_CH22"},
+	{"UL_CM2", NULL, "UL_CM2_CH23"},
+	{"UL_CM2", NULL, "UL_CM2_CH24"},
+	{"UL_CM2", NULL, "UL_CM2_CH25"},
+	{"UL_CM2", NULL, "UL_CM2_CH26"},
+	{"UL_CM2", NULL, "UL_CM2_CH27"},
+	{"UL_CM2", NULL, "UL_CM2_CH28"},
+	{"UL_CM2", NULL, "UL_CM2_CH29"},
+	{"UL_CM2", NULL, "UL_CM2_CH30"},
+	{"UL_CM2", NULL, "UL_CM2_CH31"},
+	{"UL_CM2", NULL, "UL_CM2_CH32"},
+	{"UL_CM2_CH1", "ADDA_UL_CH1", "ADDA_UL_Mux"},
+	{"UL_CM2_CH2", "ADDA_UL_CH2", "ADDA_UL_Mux"},
+	{"UL_CM2_CH3", "ADDA_UL_CH3", "ADDA_CH34_UL_Mux"},
+	{"UL_CM2_CH4", "ADDA_UL_CH4", "ADDA_CH34_UL_Mux"},
+};
+
+#define MT8196_DL_MEMIF(_id) \
+	[MT8196_MEMIF_##_id] = { \
+		.name = #_id, \
+		.id = MT8196_MEMIF_##_id, \
+		.reg_ofs_base = AFE_##_id##_BASE, \
+		.reg_ofs_cur = AFE_##_id##_CUR, \
+		.reg_ofs_end = AFE_##_id##_END, \
+		.reg_ofs_base_msb = AFE_##_id##_BASE_MSB, \
+		.reg_ofs_cur_msb = AFE_##_id##_CUR_MSB, \
+		.reg_ofs_end_msb = AFE_##_id##_END_MSB, \
+		.fs_reg = AFE_##_id##_CON0, \
+		.fs_shift = _id##_SEL_FS_SFT, \
+		.fs_maskbit = _id##_SEL_FS_MASK, \
+		.mono_reg = AFE_##_id##_CON0, \
+		.mono_shift = _id##_MONO_SFT, \
+		.enable_reg = AFE_##_id##_CON0, \
+		.enable_shift = _id##_ON_SFT, \
+		.hd_reg = AFE_##_id##_CON0, \
+		.hd_shift = _id##_HD_MODE_SFT, \
+		.hd_align_reg = AFE_##_id##_CON0, \
+		.hd_align_mshift = _id##_HALIGN_SFT, \
+		.agent_disable_reg = -1, \
+		.agent_disable_shift = -1, \
+		.msb_reg = -1, \
+		.msb_shift = -1, \
+		.pbuf_reg = AFE_##_id##_CON0, \
+		.pbuf_mask = _id##_PBUF_SIZE_MASK, \
+		.pbuf_shift = _id##_PBUF_SIZE_SFT, \
+		.minlen_reg = AFE_##_id##_CON0, \
+		.minlen_mask = _id##_MINLEN_MASK, \
+		.minlen_shift = _id##_MINLEN_SFT, \
+}
+
+#define MT8196_MULTI_DL_MEMIF(_id) \
+	[MT8196_MEMIF_##_id] = { \
+		.name = #_id, \
+		.id = MT8196_MEMIF_##_id, \
+		.reg_ofs_base = AFE_##_id##_BASE, \
+		.reg_ofs_cur = AFE_##_id##_CUR, \
+		.reg_ofs_end = AFE_##_id##_END, \
+		.reg_ofs_base_msb = AFE_##_id##_BASE_MSB, \
+		.reg_ofs_cur_msb = AFE_##_id##_CUR_MSB, \
+		.reg_ofs_end_msb = AFE_##_id##_END_MSB, \
+		.fs_reg = AFE_##_id##_CON0, \
+		.fs_shift = _id##_SEL_FS_SFT, \
+		.fs_maskbit = _id##_SEL_FS_MASK, \
+		.mono_reg = -1, \
+		.mono_shift = -1, \
+		.enable_reg = AFE_##_id##_CON0, \
+		.enable_shift = _id##_ON_SFT, \
+		.hd_reg = AFE_##_id##_CON0, \
+		.hd_shift = _id##_HD_MODE_SFT, \
+		.hd_align_reg = AFE_##_id##_CON0, \
+		.hd_align_mshift = _id##_HALIGN_SFT, \
+		.agent_disable_reg = -1, \
+		.agent_disable_shift = -1, \
+		.msb_reg = -1, \
+		.msb_shift = -1, \
+		.pbuf_reg = AFE_##_id##_CON0, \
+		.pbuf_mask = _id##_PBUF_SIZE_MASK, \
+		.pbuf_shift = _id##_PBUF_SIZE_SFT, \
+		.minlen_reg = AFE_##_id##_CON0, \
+		.minlen_mask = _id##_MINLEN_MASK, \
+		.minlen_shift = _id##_MINLEN_SFT, \
+		.ch_num_reg = AFE_##_id##_CON0, \
+		.ch_num_maskbit = _id##_NUM_MASK, \
+		.ch_num_shift = _id##_NUM_SFT, \
+}
+
+#define MT8196_UL_MEMIF(_id, _fs_shift, _fs_maskbit, _mono_shift) \
+	[MT8196_MEMIF_##_id] = { \
+		.name = #_id, \
+		.id = MT8196_MEMIF_##_id, \
+		.reg_ofs_base = AFE_##_id##_BASE, \
+		.reg_ofs_cur = AFE_##_id##_CUR, \
+		.reg_ofs_end = AFE_##_id##_END, \
+		.reg_ofs_base_msb = AFE_##_id##_BASE_MSB, \
+		.reg_ofs_cur_msb = AFE_##_id##_CUR_MSB, \
+		.reg_ofs_end_msb = AFE_##_id##_END_MSB, \
+		.fs_reg = AFE_##_id##_CON0, \
+		.fs_shift = _fs_shift, \
+		.fs_maskbit = _fs_maskbit, \
+		.mono_reg = AFE_##_id##_CON0, \
+		.mono_shift = _mono_shift, \
+		.enable_reg = AFE_##_id##_CON0, \
+		.enable_shift = _id##_ON_SFT, \
+		.hd_reg = AFE_##_id##_CON0, \
+		.hd_shift = _id##_HD_MODE_SFT, \
+		.hd_align_reg = AFE_##_id##_CON0, \
+		.hd_align_mshift = _id##_HALIGN_SFT, \
+		.agent_disable_reg = -1, \
+		.agent_disable_shift = -1, \
+		.msb_reg = -1, \
+		.msb_shift = -1, \
+	}
+
+/* For convenience with macros: missing register fields */
+#define HDMI_SEL_FS_SFT			-1
+#define HDMI_SEL_FS_MASK		-1
+
+/* For convenience with macros: register name differences */
+#define AFE_HDMI_BASE			AFE_HDMI_OUT_BASE
+#define AFE_HDMI_CUR			AFE_HDMI_OUT_CUR
+#define AFE_HDMI_END			AFE_HDMI_OUT_END
+#define AFE_HDMI_BASE_MSB		AFE_HDMI_OUT_BASE_MSB
+#define AFE_HDMI_CUR_MSB		AFE_HDMI_OUT_CUR_MSB
+#define AFE_HDMI_END_MSB		AFE_HDMI_OUT_END_MSB
+#define AFE_HDMI_CON0			AFE_HDMI_OUT_CON0
+#define HDMI_ON_SFT				HDMI_OUT_ON_SFT
+#define HDMI_HD_MODE_SFT		HDMI_OUT_HD_MODE_SFT
+#define HDMI_HALIGN_SFT			HDMI_OUT_HALIGN_SFT
+#define HDMI_PBUF_SIZE_MASK		HDMI_OUT_PBUF_SIZE_MASK
+#define HDMI_PBUF_SIZE_SFT		HDMI_OUT_PBUF_SIZE_SFT
+#define HDMI_MINLEN_MASK		HDMI_OUT_MINLEN_MASK
+#define HDMI_MINLEN_SFT			HDMI_OUT_MINLEN_SFT
+#define HDMI_NUM_MASK			HDMI_CH_NUM_MASK
+#define HDMI_NUM_SFT			HDMI_CH_NUM_SFT
+
+static const struct mtk_base_memif_data memif_data[MT8196_MEMIF_NUM] = {
+	MT8196_DL_MEMIF(DL0),
+	MT8196_DL_MEMIF(DL1),
+	MT8196_DL_MEMIF(DL2),
+	MT8196_DL_MEMIF(DL3),
+	MT8196_DL_MEMIF(DL4),
+	MT8196_DL_MEMIF(DL5),
+	MT8196_DL_MEMIF(DL6),
+	MT8196_DL_MEMIF(DL7),
+	MT8196_DL_MEMIF(DL8),
+	MT8196_DL_MEMIF(DL23),
+	MT8196_DL_MEMIF(DL24),
+	MT8196_DL_MEMIF(DL25),
+	MT8196_DL_MEMIF(DL26),
+	MT8196_MULTI_DL_MEMIF(DL_4CH),
+	MT8196_MULTI_DL_MEMIF(DL_24CH),
+	MT8196_MULTI_DL_MEMIF(HDMI),
+	MT8196_UL_MEMIF(VUL0, VUL0_SEL_FS_SFT, VUL0_SEL_FS_MASK, VUL0_MONO_SFT),
+	MT8196_UL_MEMIF(VUL1, VUL1_SEL_FS_SFT, VUL1_SEL_FS_MASK, VUL1_MONO_SFT),
+	MT8196_UL_MEMIF(VUL2, VUL2_SEL_FS_SFT, VUL2_SEL_FS_MASK, VUL2_MONO_SFT),
+	MT8196_UL_MEMIF(VUL3, VUL3_SEL_FS_SFT, VUL3_SEL_FS_MASK, VUL3_MONO_SFT),
+	MT8196_UL_MEMIF(VUL4, VUL4_SEL_FS_SFT, VUL4_SEL_FS_MASK, VUL4_MONO_SFT),
+	MT8196_UL_MEMIF(VUL5, VUL5_SEL_FS_SFT, VUL5_SEL_FS_MASK, VUL5_MONO_SFT),
+	MT8196_UL_MEMIF(VUL6, VUL6_SEL_FS_SFT, VUL6_SEL_FS_MASK, VUL6_MONO_SFT),
+	MT8196_UL_MEMIF(VUL7, VUL7_SEL_FS_SFT, VUL7_SEL_FS_MASK, VUL7_MONO_SFT),
+	MT8196_UL_MEMIF(VUL8, VUL8_SEL_FS_SFT, VUL8_SEL_FS_MASK, VUL8_MONO_SFT),
+	MT8196_UL_MEMIF(VUL9, VUL9_SEL_FS_SFT, VUL9_SEL_FS_MASK, VUL9_MONO_SFT),
+	MT8196_UL_MEMIF(VUL10, VUL10_SEL_FS_SFT, VUL10_SEL_FS_MASK, VUL10_MONO_SFT),
+	MT8196_UL_MEMIF(VUL24, VUL24_SEL_FS_SFT, VUL24_SEL_FS_MASK, VUL24_MONO_SFT),
+	MT8196_UL_MEMIF(VUL25, VUL25_SEL_FS_SFT, VUL25_SEL_FS_MASK, VUL25_MONO_SFT),
+	MT8196_UL_MEMIF(VUL26, VUL26_SEL_FS_SFT, VUL26_SEL_FS_MASK, VUL26_MONO_SFT),
+	MT8196_UL_MEMIF(VUL_CM0, -1, -1, -1),
+	MT8196_UL_MEMIF(VUL_CM1, -1, -1, -1),
+	MT8196_UL_MEMIF(VUL_CM2, -1, -1, -1),
+	MT8196_UL_MEMIF(ETDM_IN0, REG_FS_TIMING_SEL_SFT, REG_FS_TIMING_SEL_MASK, -1),
+	MT8196_UL_MEMIF(ETDM_IN1, REG_FS_TIMING_SEL_SFT, REG_FS_TIMING_SEL_MASK, -1),
+	MT8196_UL_MEMIF(ETDM_IN2, REG_FS_TIMING_SEL_SFT, REG_FS_TIMING_SEL_MASK, -1),
+	MT8196_UL_MEMIF(ETDM_IN3, REG_FS_TIMING_SEL_SFT, REG_FS_TIMING_SEL_MASK, -1),
+	MT8196_UL_MEMIF(ETDM_IN4, REG_FS_TIMING_SEL_SFT, REG_FS_TIMING_SEL_MASK, -1),
+	MT8196_UL_MEMIF(ETDM_IN6, REG_FS_TIMING_SEL_SFT, REG_FS_TIMING_SEL_MASK, -1),
+};
+
+#define MT8183_AFE_IRQ_BASE(_id, _fs_reg, _fs_shift, _fs_maskbit)	\
+	[MT8183_IRQ_##_id] = {	\
+		.id = MT8183_IRQ_##_id,			\
+		.irq_cnt_reg = AFE_IRQ_MCU_CNT##_id,	\
+		.irq_cnt_shift = 0,			\
+		.irq_cnt_maskbit = 0x3ffff,		\
+		.irq_fs_reg = _fs_reg,			\
+		.irq_fs_shift = _fs_shift,		\
+		.irq_fs_maskbit = _fs_maskbit,		\
+		.irq_en_reg = AFE_IRQ_MCU_CON0,		\
+		.irq_en_shift = IRQ##_id##_MCU_ON_SFT,	\
+		.irq_clr_reg = AFE_IRQ_MCU_CLR,		\
+		.irq_clr_shift = IRQ##_id##_MCU_CLR_SFT,	\
+	}
+
+#define MT8196_AFE_IRQ(_id)	\
+	[MT8196_IRQ_##_id] = { \
+		.id = MT8196_IRQ_##_id, \
+		.irq_cnt_reg = AFE_IRQ##_id##_MCU_CFG1, \
+		.irq_cnt_shift = AFE_IRQ_CNT_SHIFT, \
+		.irq_cnt_maskbit = AFE_IRQ_CNT_MASK, \
+		.irq_fs_reg = AFE_IRQ##_id##_MCU_CFG0, \
+		.irq_fs_shift = AFE_IRQ##_id##_MCU_FS_SFT, \
+		.irq_fs_maskbit = AFE_IRQ##_id##_MCU_FS_MASK, \
+		.irq_en_reg = AFE_IRQ##_id##_MCU_CFG0, \
+		.irq_en_shift = AFE_IRQ##_id##_MCU_ON_SFT, \
+		.irq_clr_reg = AFE_IRQ##_id##_MCU_CFG1, \
+		.irq_clr_shift = AFE_IRQ##_id##_CLR_CFG_SFT, \
+	}
+
+#define MT8196_AFE_TDM_IRQ(_id)	\
+	[MT8196_IRQ_##_id] = { \
+		.id = MT8196_CUS_IRQ_TDM, \
+		.irq_cnt_reg = AFE_CUSTOM_IRQ0_MCU_CFG1, \
+		.irq_cnt_shift = AFE_CUSTOM_IRQ0_MCU_CNT_SFT, \
+		.irq_cnt_maskbit = AFE_CUSTOM_IRQ0_MCU_CNT_MASK, \
+		.irq_fs_reg = -1, \
+		.irq_fs_shift = -1, \
+		.irq_fs_maskbit = -1, \
+		.irq_en_reg = AFE_CUSTOM_IRQ0_MCU_CFG0, \
+		.irq_en_shift = AFE_CUSTOM_IRQ0_MCU_ON_SFT, \
+		.irq_clr_reg = AFE_CUSTOM_IRQ0_MCU_CFG1, \
+		.irq_clr_shift = AFE_CUSTOM_IRQ0_CLR_CFG_SFT, \
+	}
+
+static const struct mtk_base_irq_data irq_data[MT8196_IRQ_NUM] = {
+	MT8196_AFE_IRQ(0),
+	MT8196_AFE_IRQ(1),
+	MT8196_AFE_IRQ(2),
+	MT8196_AFE_IRQ(3),
+	MT8196_AFE_IRQ(4),
+	MT8196_AFE_IRQ(5),
+	MT8196_AFE_IRQ(6),
+	MT8196_AFE_IRQ(7),
+	MT8196_AFE_IRQ(8),
+	MT8196_AFE_IRQ(9),
+	MT8196_AFE_IRQ(10),
+	MT8196_AFE_IRQ(11),
+	MT8196_AFE_IRQ(12),
+	MT8196_AFE_IRQ(13),
+	MT8196_AFE_IRQ(14),
+	MT8196_AFE_IRQ(15),
+	MT8196_AFE_IRQ(16),
+	MT8196_AFE_IRQ(17),
+	MT8196_AFE_IRQ(18),
+	MT8196_AFE_IRQ(19),
+	MT8196_AFE_IRQ(20),
+	MT8196_AFE_IRQ(21),
+	MT8196_AFE_IRQ(22),
+	MT8196_AFE_IRQ(23),
+	MT8196_AFE_IRQ(24),
+	MT8196_AFE_IRQ(25),
+	MT8196_AFE_IRQ(26),
+	MT8196_AFE_TDM_IRQ(31),
+};
+
+static const int memif_irq_usage[MT8196_MEMIF_NUM] = {
+	/* TODO: verify each memif & irq */
+	[MT8196_MEMIF_DL0] = MT8196_IRQ_0,
+	[MT8196_MEMIF_DL1] = MT8196_IRQ_1,
+	[MT8196_MEMIF_DL2] = MT8196_IRQ_2,
+	[MT8196_MEMIF_DL3] = MT8196_IRQ_3,
+	[MT8196_MEMIF_DL4] = MT8196_IRQ_4,
+	[MT8196_MEMIF_DL5] = MT8196_IRQ_5,
+	[MT8196_MEMIF_DL6] = MT8196_IRQ_6,
+	[MT8196_MEMIF_DL7] = MT8196_IRQ_7,
+	[MT8196_MEMIF_DL8] = MT8196_IRQ_8,
+	[MT8196_MEMIF_DL23] = MT8196_IRQ_9,
+	[MT8196_MEMIF_DL24] = MT8196_IRQ_10,
+	[MT8196_MEMIF_DL25] = MT8196_IRQ_11,
+	[MT8196_MEMIF_DL26] = MT8196_IRQ_0,
+	[MT8196_MEMIF_DL_4CH] = MT8196_IRQ_0,
+	[MT8196_MEMIF_DL_24CH] = MT8196_IRQ_12,
+	[MT8196_MEMIF_VUL0] = MT8196_IRQ_13,
+	[MT8196_MEMIF_VUL1] = MT8196_IRQ_14,
+	[MT8196_MEMIF_VUL2] = MT8196_IRQ_15,
+	[MT8196_MEMIF_VUL3] = MT8196_IRQ_16,
+	[MT8196_MEMIF_VUL4] = MT8196_IRQ_17,
+	[MT8196_MEMIF_VUL5] = MT8196_IRQ_18,
+	[MT8196_MEMIF_VUL6] = MT8196_IRQ_19,
+	[MT8196_MEMIF_VUL7] = MT8196_IRQ_20,
+	[MT8196_MEMIF_VUL8] = MT8196_IRQ_21,
+	[MT8196_MEMIF_VUL9] = MT8196_IRQ_22,
+	[MT8196_MEMIF_VUL10] = MT8196_IRQ_23,
+	[MT8196_MEMIF_VUL24] = MT8196_IRQ_24,
+	[MT8196_MEMIF_VUL25] = MT8196_IRQ_25,
+	[MT8196_MEMIF_VUL26] = MT8196_IRQ_0,
+	[MT8196_MEMIF_VUL_CM0] = MT8196_IRQ_26,
+	[MT8196_MEMIF_VUL_CM1] = MT8196_IRQ_0,
+	[MT8196_MEMIF_VUL_CM2] = MT8196_IRQ_0,
+	[MT8196_MEMIF_ETDM_IN0] = MT8196_IRQ_0,
+	[MT8196_MEMIF_ETDM_IN1] = MT8196_IRQ_0,
+	[MT8196_MEMIF_ETDM_IN2] = MT8196_IRQ_0,
+	[MT8196_MEMIF_ETDM_IN3] = MT8196_IRQ_0,
+	[MT8196_MEMIF_ETDM_IN4] = MT8196_IRQ_0,
+	[MT8196_MEMIF_ETDM_IN6] = MT8196_IRQ_0,
+	[MT8196_MEMIF_HDMI] = MT8196_IRQ_31
+};
+
+static bool mt8196_is_volatile_reg(struct device *dev, unsigned int reg)
+{
+	/* these auto-gen reg has read-only bit, so put it as volatile */
+	/* volatile reg cannot be cached, so cannot be set when power off */
+	switch (reg) {
+	case AUDIO_TOP_CON0 ... AUDIO_TOP_CON4:
+	case AFE_APLL1_TUNER_MON0:
+	case AFE_APLL2_TUNER_MON0:
+	case AFE_SPM_CONTROL_ACK:
+	case AUDIO_TOP_IP_VERSION:
+	case AUDIO_ENGEN_CON0_MON:
+	case AUD_TOP_MON_RG:
+	case AFE_CONNSYS_I2S_IPM_VER_MON:
+	case AFE_CONNSYS_I2S_MON:
+	case AFE_PCM_INTF_MON:
+	case AFE_PCM_TOP_IP_VERSION:
+	case AFE_IRQ_MCU_STATUS:
+	case AFE_CUSTOM_IRQ_MCU_STATUS:
+	case AFE_IRQ_MCU_MON0 ... AFE_IRQ26_CNT_MON:
+	case AFE_CUSTOM_IRQ0_CNT_MON:
+	case AFE_STF_MON:
+	case AFE_STF_IP_VERSION:
+	case AFE_CM0_MON:
+	case AFE_CM0_IP_VERSION:
+	case AFE_CM1_MON:
+	case AFE_CM1_IP_VERSION:
+	case AFE_ADDA_UL0_SRC_DEBUG_MON0 ... AFE_ADDA_UL0_SRC_MON1:
+	case AFE_ADDA_UL0_IP_VERSION:
+	case AFE_ADDA_UL1_SRC_DEBUG_MON0 ... AFE_ADDA_UL1_SRC_MON1:
+	case AFE_ADDA_UL1_IP_VERSION:
+	case AFE_MTKAIF_IPM_VER_MON:
+	case AFE_MTKAIF_MON:
+	case AFE_AUD_PAD_TOP_MON:
+	case AFE_ADDA_MTKAIFV4_MON0 ... AFE_ADDA6_MTKAIFV4_MON0:
+	case ETDM_IN0_MON:
+	case ETDM_IN1_MON:
+	case ETDM_IN2_MON:
+	case ETDM_IN4_MON:
+	case ETDM_IN6_MON:
+	case ETDM_OUT0_MON:
+	case ETDM_OUT1_MON:
+	case ETDM_OUT2_MON:
+	case ETDM_OUT4_MON:
+	case ETDM_OUT6_MON:
+	case AFE_DPTX_MON:
+	case AFE_TDM_TOP_IP_VERSION:
+	case AFE_CONN_MON0 ... AFE_CONN_MON5:
+	case AFE_CBIP_SLV_DECODER_MON0 ... AFE_CBIP_SLV_MUX_MON1:
+	case AFE_DL0_CUR_MSB ... AFE_DL0_CUR:
+	case AFE_DL0_RCH_MON ... AFE_DL0_LCH_MON:
+	case AFE_DL1_CUR_MSB ... AFE_DL1_CUR:
+	case AFE_DL1_RCH_MON ... AFE_DL1_LCH_MON:
+	case AFE_DL2_CUR_MSB ... AFE_DL2_CUR:
+	case AFE_DL2_RCH_MON ... AFE_DL2_LCH_MON:
+	case AFE_DL3_CUR_MSB ... AFE_DL3_CUR:
+	case AFE_DL3_RCH_MON ... AFE_DL3_LCH_MON:
+	case AFE_DL4_CUR_MSB ... AFE_DL4_CUR:
+	case AFE_DL4_RCH_MON ... AFE_DL4_LCH_MON:
+	case AFE_DL5_CUR_MSB ... AFE_DL5_CUR:
+	case AFE_DL5_RCH_MON ... AFE_DL5_LCH_MON:
+	case AFE_DL6_CUR_MSB ... AFE_DL6_CUR:
+	case AFE_DL6_RCH_MON ... AFE_DL6_LCH_MON:
+	case AFE_DL7_CUR_MSB ... AFE_DL7_CUR:
+	case AFE_DL7_RCH_MON ... AFE_DL7_LCH_MON:
+	case AFE_DL8_CUR_MSB ... AFE_DL8_CUR:
+	case AFE_DL8_RCH_MON ... AFE_DL8_LCH_MON:
+	case AFE_DL_24CH_CUR_MSB ... AFE_DL_24CH_CUR:
+	case AFE_DL_4CH_CUR_MSB ... AFE_DL_4CH_CUR:
+	case AFE_DL23_CUR_MSB ... AFE_DL23_CUR:
+	case AFE_DL23_RCH_MON ... AFE_DL23_LCH_MON:
+	case AFE_DL24_CUR_MSB ... AFE_DL24_CUR:
+	case AFE_DL24_RCH_MON ... AFE_DL24_LCH_MON:
+	case AFE_DL25_CUR_MSB ... AFE_DL25_CUR:
+	case AFE_DL25_RCH_MON ... AFE_DL25_LCH_MON:
+	case AFE_DL26_CUR_MSB ... AFE_DL26_CUR:
+	case AFE_DL26_RCH_MON ... AFE_DL26_LCH_MON:
+	case AFE_VUL0_CUR_MSB ... AFE_VUL0_CUR:
+	case AFE_VUL1_CUR_MSB ... AFE_VUL1_CUR:
+	case AFE_VUL2_CUR_MSB ... AFE_VUL2_CUR:
+	case AFE_VUL3_CUR_MSB ... AFE_VUL3_CUR:
+	case AFE_VUL4_CUR_MSB ... AFE_VUL4_CUR:
+	case AFE_VUL5_CUR_MSB ... AFE_VUL5_CUR:
+	case AFE_VUL6_CUR_MSB ... AFE_VUL6_CUR:
+	case AFE_VUL7_CUR_MSB ... AFE_VUL7_CUR:
+	case AFE_VUL8_CUR_MSB ... AFE_VUL8_CUR:
+	case AFE_VUL9_CUR_MSB ... AFE_VUL9_CUR:
+	case AFE_VUL10_CUR_MSB ... AFE_VUL10_CUR:
+	case AFE_VUL24_CUR_MSB ... AFE_VUL24_CUR:
+	case AFE_VUL25_CUR_MSB ... AFE_VUL25_CUR:
+	case AFE_VUL25_RCH_MON ... AFE_VUL25_LCH_MON:
+	case AFE_VUL26_CUR_MSB ... AFE_VUL26_CUR:
+	case AFE_VUL_CM0_BASE_MSB ... AFE_VUL_CM0_CON0:
+	case AFE_VUL_CM1_CUR_MSB ... AFE_VUL_CM1_CUR:
+	case AFE_VUL_CM2_CUR_MSB ... AFE_VUL_CM2_CUR:
+	case AFE_ETDM_IN0_CUR_MSB ... AFE_ETDM_IN0_CUR:
+	case AFE_ETDM_IN1_CUR_MSB ... AFE_ETDM_IN1_CUR:
+	case AFE_ETDM_IN2_CUR_MSB ... AFE_ETDM_IN2_CUR:
+	case AFE_ETDM_IN3_CUR_MSB ... AFE_ETDM_IN3_CUR:
+	case AFE_ETDM_IN4_CUR_MSB ... AFE_ETDM_IN4_CUR:
+	case AFE_ETDM_IN6_CUR_MSB ... AFE_ETDM_IN6_CUR:
+	case AFE_HDMI_OUT_CUR_MSB ... AFE_HDMI_OUT_CUR:
+	case AFE_HDMI_OUT_END:
+	case AFE_PROT_SIDEBAND0_MON ... AFE_DOMAIN_SIDEBAND9_MON:
+	case AFE_PCM0_INTF_CON1_MASK_MON ... AFE_ADDA_UL1_SRC_CON0_MASK_MON:
+	case AFE_IRQ_MCU_EN ... AFE_IRQ_MCU_DSP2_EN:
+	case AFE_CUSTOM_IRQ_MCU_EN:
+	case AFE_DL5_CON0:
+	case AFE_DL6_CON0:
+	case AFE_DL23_CON0:
+	case AFE_DL_24CH_CON0:
+	case AFE_VUL1_CON0:
+	case AFE_VUL3_CON0:
+	case AFE_VUL4_CON0:
+	case AFE_VUL5_CON0:
+	case AFE_VUL9_CON0:
+	case AFE_VUL25_CON0:
+	case AFE_IRQ0_MCU_CFG0 ... AFE_IRQ26_MCU_CFG1:
+		return true;
+	default:
+		return false;
+	};
+}
+
+static const struct regmap_config mt8196_afe_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+
+	.volatile_reg = mt8196_is_volatile_reg,
+
+	.max_register = AFE_MAX_REGISTER,
+	.num_reg_defaults_raw = AFE_MAX_REGISTER,
+
+	.cache_type = REGCACHE_FLAT,
+};
+
+static irqreturn_t mt8196_afe_irq_handler(int irq_id, void *dev)
+{
+	struct mtk_base_afe *afe = dev;
+	struct mtk_base_afe_irq *irq;
+	unsigned int status = 0;
+	unsigned int status_mcu;
+	unsigned int mcu_en = 0;
+	unsigned int cus_status = 0;
+	unsigned int cus_status_mcu;
+	unsigned int cus_mcu_en = 0;
+	unsigned int tmp_reg = 0;
+	int ret, cus_ret;
+	int i;
+	struct timespec64 ts64;
+	unsigned long long t1, t2;
+	/* one interrupt period = 5ms */
+	unsigned long long timeout_limit = 5000000;
+
+	/* get irq that is sent to MCU */
+	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &mcu_en);
+	regmap_read(afe->regmap, AFE_CUSTOM_IRQ_MCU_EN, &cus_mcu_en);
+
+	ret = regmap_read(afe->regmap, AFE_IRQ_MCU_STATUS, &status);
+	cus_ret = regmap_read(afe->regmap, AFE_CUSTOM_IRQ_MCU_STATUS, &cus_status);
+	/* only care IRQ which is sent to MCU */
+	status_mcu = status & mcu_en & AFE_IRQ_STATUS_BITS;
+	cus_status_mcu = cus_status & cus_mcu_en & AFE_IRQ_STATUS_BITS;
+	if ((ret || !status_mcu) &&
+	    (cus_ret || !cus_status_mcu)) {
+		dev_info(afe->dev, "irq status err, ret %d, status 0x%x, mcu_en 0x%x\n",
+			 ret, status, mcu_en);
+		dev_info(afe->dev, "irq status err, ret %d, cus_status_mcu 0x%x, cus_mcu_en 0x%x\n",
+			 ret, cus_status_mcu, cus_mcu_en);
+
+		goto err_irq;
+	}
+
+	ktime_get_ts64(&ts64);
+	t1 = timespec64_to_ns(&ts64);
+
+	for (i = 0; i < MT8196_MEMIF_NUM; i++) {
+		struct mtk_base_afe_memif *memif = &afe->memif[i];
+
+		if (!memif->substream)
+			continue;
+
+		if (memif->irq_usage < 0)
+			continue;
+		irq = &afe->irqs[memif->irq_usage];
+
+		if (i == MT8196_MEMIF_HDMI) {
+			if (cus_status_mcu & (0x1 << irq->irq_data->id))
+				snd_pcm_period_elapsed(memif->substream);
+		} else {
+			if (status_mcu & (0x1 << irq->irq_data->id))
+				snd_pcm_period_elapsed(memif->substream);
+		}
+	}
+
+	ktime_get_ts64(&ts64);
+	t2 = timespec64_to_ns(&ts64);
+	t2 = t2 - t1; /* in ns (10^9) */
+
+	if (t2 > timeout_limit) {
+		dev_warn(afe->dev, "mcu_en 0x%x, cus_mcu_en 0x%x, timeout %llu, limit %llu, ret %d\n",
+			 mcu_en, cus_mcu_en,
+			 t2, timeout_limit, ret);
+	}
+
+err_irq:
+	/* clear irq */
+	for (i = 0; i < MT8196_IRQ_NUM; ++i) {
+		/* cus_status_mcu only bit0 is used for TDM */
+		if ((status_mcu & (0x1 << i)) || (cus_status_mcu & 0x1)) {
+			regmap_read(afe->regmap, irq_data[i].irq_clr_reg, &tmp_reg);
+			regmap_update_bits(afe->regmap, irq_data[i].irq_clr_reg,
+					   AFE_IRQ_CLR_CFG_MASK_SFT |
+					   AFE_IRQ_MISS_FLAG_CLR_CFG_MASK_SFT,
+					   tmp_reg ^ (AFE_IRQ_CLR_CFG_MASK_SFT |
+					   AFE_IRQ_MISS_FLAG_CLR_CFG_MASK_SFT));
+		}
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int mt8196_afe_runtime_suspend(struct device *dev)
+{
+	struct mtk_base_afe *afe = dev_get_drvdata(dev);
+	unsigned int value = 0;
+	unsigned int tmp_reg = 0;
+	int ret = 0, i;
+
+	if (!afe->regmap) {
+		dev_err(afe->dev, "skip regmap\n");
+		goto skip_regmap;
+	}
+
+	/* disable AFE */
+	mt8196_afe_disable_main_clock(afe);
+
+	ret = regmap_read_poll_timeout(afe->regmap,
+				       AUDIO_ENGEN_CON0_MON,
+				       value,
+				       (value & AUDIO_ENGEN_MON_SFT) == 0,
+				       20,
+				       1 * 1000 * 1000);
+	dev_dbg(afe->dev, "read_poll ret %d\n", ret);
+	if (ret)
+		dev_info(afe->dev, "ret %d\n", ret);
+
+	/* make sure all irq status are cleared */
+	for (i = 0; i < MT8196_IRQ_NUM; ++i) {
+		regmap_read(afe->regmap, irq_data[i].irq_clr_reg, &tmp_reg);
+		regmap_update_bits(afe->regmap, irq_data[i].irq_clr_reg,
+				   AFE_IRQ_CLR_CFG_MASK_SFT | AFE_IRQ_MISS_FLAG_CLR_CFG_MASK_SFT,
+				   tmp_reg ^ (AFE_IRQ_CLR_CFG_MASK_SFT |
+				   AFE_IRQ_MISS_FLAG_CLR_CFG_MASK_SFT));
+	}
+
+	/* reset audio 26M request */
+	regmap_update_bits(afe->regmap,
+			   AFE_SPM_CONTROL_REQ, 0x1, 0x0);
+
+	/* cache only */
+	regcache_cache_only(afe->regmap, true);
+	regcache_mark_dirty(afe->regmap);
+
+skip_regmap:
+	mt8196_afe_disable_reg_rw_clk(afe);
+	return 0;
+}
+
+static int mt8196_afe_runtime_resume(struct device *dev)
+{
+	struct mtk_base_afe *afe = dev_get_drvdata(dev);
+	int ret = 0;
+
+	ret = mt8196_afe_enable_reg_rw_clk(afe);
+	if (ret)
+		return ret;
+
+	if (!afe->regmap) {
+		dev_warn(afe->dev, "skip regmap\n");
+		goto skip_regmap;
+	}
+	regcache_cache_only(afe->regmap, false);
+	regcache_sync(afe->regmap);
+
+	/* set audio 26M request */
+	regmap_update_bits(afe->regmap, AFE_SPM_CONTROL_REQ, 0x1, 0x1);
+	regmap_update_bits(afe->regmap, AFE_CBIP_CFG0, 0x1, 0x1);
+
+	/* force cpu use 8_24 format when writing 32bit data */
+	regmap_update_bits(afe->regmap, AFE_MEMIF_CON0,
+			   CPU_HD_ALIGN_MASK_SFT, 0 << CPU_HD_ALIGN_SFT);
+
+	/* enable AFE */
+	mt8196_afe_enable_main_clock(afe);
+
+skip_regmap:
+	return 0;
+}
+
+static int mt8196_afe_component_probe(struct snd_soc_component *component)
+{
+	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
+
+	if (component) {
+		/* enable clock for regcache get default value from hw */
+		pm_runtime_get_sync(afe->dev);
+		mtk_afe_add_sub_dai_control(component);
+		pm_runtime_put_sync(afe->dev);
+	}
+	return 0;
+}
+
+static int mt8196_afe_pcm_open(struct snd_soc_component *component,
+			       struct snd_pcm_substream *substream)
+{
+	/* set the wait_for_avail to 2 sec*/
+	substream->wait_time = msecs_to_jiffies(2 * 1000);
+
+	return 0;
+}
+
+static void mt8196_afe_pcm_free(struct snd_soc_component *component, struct snd_pcm *pcm)
+{
+	snd_pcm_lib_preallocate_free_for_all(pcm);
+}
+
+static const struct snd_soc_component_driver mt8196_afe_component = {
+	.name = AFE_PCM_NAME,
+	.probe = mt8196_afe_component_probe,
+	.pcm_construct = mtk_afe_pcm_new,
+	.pcm_destruct = mt8196_afe_pcm_free,
+	.open = mt8196_afe_pcm_open,
+	.pointer = mtk_afe_pcm_pointer,
+};
+
+static int mt8196_dai_memif_register(struct mtk_base_afe *afe)
+{
+	struct mtk_base_afe_dai *dai;
+
+	dai = devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
+	if (!dai)
+		return -ENOMEM;
+
+	list_add(&dai->list, &afe->sub_dais);
+
+	dai->dai_drivers = mt8196_memif_dai_driver;
+	dai->num_dai_drivers = ARRAY_SIZE(mt8196_memif_dai_driver);
+
+	dai->controls = mt8196_pcm_kcontrols;
+	dai->num_controls = ARRAY_SIZE(mt8196_pcm_kcontrols);
+	dai->dapm_widgets = mt8196_memif_widgets;
+	dai->num_dapm_widgets = ARRAY_SIZE(mt8196_memif_widgets);
+	dai->dapm_routes = mt8196_memif_routes;
+	dai->num_dapm_routes = ARRAY_SIZE(mt8196_memif_routes);
+	return 0;
+}
+
+typedef int (*dai_register_cb)(struct mtk_base_afe *);
+static const dai_register_cb dai_register_cbs[] = {
+	mt8196_dai_adda_register,
+	mt8196_dai_i2s_register,
+	mt8196_dai_tdm_register,
+	mt8196_dai_memif_register,
+};
+
+static const struct reg_sequence mt8196_cg_patch[] = {
+	{ AUDIO_TOP_CON4, 0x361c },
+};
+
+static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
+{
+	int ret, i;
+	unsigned int tmp_reg = 0;
+	int irq_id;
+	struct mtk_base_afe *afe;
+	struct mt8196_afe_private *afe_priv;
+	struct device *dev = &pdev->dev;
+
+	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(34));
+	if (ret)
+		return ret;
+
+	ret = of_reserved_mem_device_init(dev);
+	if (ret)
+		dev_err(dev, "failed to assign memory region: %d\n", ret);
+
+	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
+	if (!afe)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, afe);
+
+	afe->platform_priv = devm_kzalloc(dev, sizeof(*afe_priv),
+					  GFP_KERNEL);
+	if (!afe->platform_priv)
+		return -ENOMEM;
+
+	afe_priv = afe->platform_priv;
+	afe->dev = dev;
+
+	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(afe->base_addr))
+		return dev_err_probe(dev, PTR_ERR(afe->base_addr),
+				     "AFE base_addr not found\n");
+
+	/* init audio related clock */
+	ret = mt8196_init_clock(afe);
+	if (ret)
+		return dev_err_probe(dev, ret, "init clock error.\n");
+
+	/* init memif */
+	/* IPM2.0 no need banding */
+	afe->memif_32bit_supported = 1;
+	afe->memif_size = MT8196_MEMIF_NUM;
+	afe->memif = devm_kcalloc(dev, afe->memif_size, sizeof(*afe->memif),
+				  GFP_KERNEL);
+
+	if (!afe->memif)
+		return -ENOMEM;
+
+	for (i = 0; i < afe->memif_size; i++) {
+		afe->memif[i].data = &memif_data[i];
+		afe->memif[i].irq_usage = memif_irq_usage[i];
+		afe->memif[i].const_irq = 1;
+	}
+
+	mutex_init(&afe->irq_alloc_lock);
+
+	/* init irq */
+	afe->irqs_size = MT8196_IRQ_NUM;
+	afe->irqs = devm_kcalloc(dev, afe->irqs_size, sizeof(*afe->irqs),
+				 GFP_KERNEL);
+
+	if (!afe->irqs)
+		return -ENOMEM;
+
+	for (i = 0; i < afe->irqs_size; i++)
+		afe->irqs[i].irq_data = &irq_data[i];
+
+	/* request irq */
+	irq_id = platform_get_irq(pdev, 0);
+	if (irq_id < 0)
+		return dev_err_probe(dev, irq_id, "no irq found");
+
+	ret = devm_request_irq(dev, irq_id, mt8196_afe_irq_handler,
+			       IRQF_TRIGGER_NONE,
+			       "Afe_ISR_Handle", (void *)afe);
+	if (ret)
+		return dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
+
+	ret = enable_irq_wake(irq_id);
+	if (ret < 0)
+		dev_warn(dev, "enable_irq_wake %d ret: %d\n", irq_id, ret);
+
+	/* init sub_dais */
+	INIT_LIST_HEAD(&afe->sub_dais);
+
+	for (i = 0; i < ARRAY_SIZE(dai_register_cbs); i++) {
+		ret = dai_register_cbs[i](afe);
+		if (ret)
+			return dev_err_probe(dev, ret, "dai register i %d fail\n", i);
+	}
+
+	/* init dai_driver and component_driver */
+	ret = mtk_afe_combine_sub_dai(afe);
+	if (ret)
+		return dev_err_probe(dev, ret, "mtk_afe_combine_sub_dai fail\n");
+
+	/* others */
+	afe->mtk_afe_hardware = &mt8196_afe_hardware;
+	afe->memif_fs = mt8196_memif_fs;
+	afe->irq_fs = mt8196_irq_fs;
+	afe->get_dai_fs = mt8196_get_dai_fs;
+	afe->get_memif_pbuf_size = mt8196_get_memif_pbuf_size;
+
+	afe->runtime_resume = mt8196_afe_runtime_resume;
+	afe->runtime_suspend = mt8196_afe_runtime_suspend;
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	/* Audio device is part of genpd.
+	 * Set audio as syscore device to prevent
+	 * genpd automatically power off audio
+	 * device when suspend
+	 */
+	dev_pm_syscore_device(dev, true);
+
+	/* enable clock for regcache get default value from hw */
+	pm_runtime_get_sync(dev);
+
+	afe->regmap = devm_regmap_init_mmio(dev, afe->base_addr,
+					    &mt8196_afe_regmap_config);
+	if (IS_ERR(afe->regmap))
+		return PTR_ERR(afe->regmap);
+
+	ret = regmap_register_patch(afe->regmap, mt8196_cg_patch,
+				    ARRAY_SIZE(mt8196_cg_patch));
+	if (ret < 0) {
+		dev_info(dev, "Failed to apply cg patch\n");
+		goto err_pm_disable;
+	}
+
+	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
+	regmap_write(afe->regmap, AFE_IRQ_MCU_EN, 0xffffffff);
+	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
+
+	pm_runtime_put_sync(dev);
+
+	regcache_cache_only(afe->regmap, true);
+	regcache_mark_dirty(afe->regmap);
+
+	/* register component */
+	ret = devm_snd_soc_register_component(dev,
+					      &mt8196_afe_component,
+					      afe->dai_drivers,
+					      afe->num_dai_drivers);
+	if (ret) {
+		dev_warn(dev, "afe component err\n");
+		goto err_pm_disable;
+	}
+
+	return 0;
+
+err_pm_disable:
+	pm_runtime_disable(dev);
+	return ret;
+}
+
+static void mt8196_afe_pcm_dev_remove(struct platform_device *pdev)
+{
+	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+
+	pm_runtime_disable(dev);
+	if (!pm_runtime_status_suspended(dev))
+		mt8196_afe_runtime_suspend(dev);
+
+	/* disable afe clock */
+	mt8196_afe_disable_reg_rw_clk(afe);
+	mt8196_afe_disable_main_clock(afe);
+}
+
+static const struct of_device_id mt8196_afe_pcm_dt_match[] = {
+	{ .compatible = "mediatek,mt8196-afe", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, mt8196_afe_pcm_dt_match);
+
+static const struct dev_pm_ops mt8196_afe_pm_ops = {
+	SET_RUNTIME_PM_OPS(mt8196_afe_runtime_suspend,
+			   mt8196_afe_runtime_resume, NULL)
+};
+
+static struct platform_driver mt8196_afe_pcm_driver = {
+	.driver = {
+		.name = "mt8196-afe",
+		.of_match_table = mt8196_afe_pcm_dt_match,
+#if IS_ENABLED(CONFIG_PM)
+		.pm = &mt8196_afe_pm_ops,
+#endif
+	},
+	.probe = mt8196_afe_pcm_dev_probe,
+	.remove = mt8196_afe_pcm_dev_remove,
+};
+
+module_platform_driver(mt8196_afe_pcm_driver);
+
+MODULE_DESCRIPTION("Mediatek ALSA SoC AFE platform driver for 8196");
+MODULE_AUTHOR("Darren Ye <darren.ye@mediatek.com>");
+MODULE_LICENSE("GPL");
-- 
2.45.2


