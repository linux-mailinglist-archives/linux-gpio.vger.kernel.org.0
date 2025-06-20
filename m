Return-Path: <linux-gpio+bounces-21929-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1363EAE1806
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 11:45:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4DDB4188628C
	for <lists+linux-gpio@lfdr.de>; Fri, 20 Jun 2025 09:45:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F39828C2B5;
	Fri, 20 Jun 2025 09:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qJbg8j7a"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E085F28AAE1;
	Fri, 20 Jun 2025 09:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.61.82.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750412539; cv=none; b=hkQTDgkMBveUp0uBe7deRcRoogqQ1pWHlkUW0wdvhf+YThekLOLnas/2dsBQcGHqEJtCmh7eDpG5bCONa3evAvxVtEFTM2Ub9QpZVt9MKuUHgCt797HBzlcMs/p1DcVbnFWTwwBROis6hauYhpJLSKfjHmcnY6Ed6iWx+Ggceps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750412539; c=relaxed/simple;
	bh=uCxP9QdHrPS8+boZ1gQoEywXcKYqebEtzvjur05WyKw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rOuy7x65N4JJswH31PJR7+xlFaZU69gBpn5N0xxD0c102jzOYFgmrIpY/CRGixmNJ4k098JZ2O4rsFJq8ABKcOO+E1RAd44nDU4xlv1TEnjjrzdG9wgQCeMCmcK9C4IlCoPPmF8MHBE1+BUYVTJMfvhUUnDfEu1VX8GCnqY8x70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com; spf=pass smtp.mailfrom=mediatek.com; dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b=qJbg8j7a; arc=none smtp.client-ip=210.61.82.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mediatek.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mediatek.com
X-UUID: d454e6f04dba11f0b33aeb1e7f16c2b6-20250620
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=PFfdoEYsyU92PXMYPvEAEdyRVkk9yj5RgSHdXoh/5DI=;
	b=qJbg8j7afbG1Da9E9JTfnejEgsyTJ11OKrfaEGa2HAzeAg1huZrMKvOpD+sWJTypEyiilOXGmgroosQPHf9Cl1SjKAyZMr6jHqiNWV5oANIBuMRQP2ecsd5PxUSzupi9hl9SefrgmfXGiD7AzpymXaB2bIYj5DT7gUD/8ZzB390=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.3,REQID:da348711-e669-40c8-91ee-639bb282ec17,IP:0,UR
	L:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:-5
X-CID-META: VersionHash:09905cf,CLOUDID:55f3ac28-fdd2-4021-9c0c-83548fdcf243,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: d454e6f04dba11f0b33aeb1e7f16c2b6-20250620
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw02.mediatek.com
	(envelope-from <darren.ye@mediatek.com>)
	(Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1755091419; Fri, 20 Jun 2025 17:42:07 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Fri, 20 Jun 2025 17:42:04 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Fri, 20 Jun 2025 17:42:04 +0800
From: Darren.Ye <darren.ye@mediatek.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, "Linus
 Walleij" <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-sound@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>, Darren Ye
	<darren.ye@mediatek.com>
Subject: [PATCH v5 09/10] ASoC: mediatek: mt8196: add machine driver with nau8825
Date: Fri, 20 Jun 2025 17:40:42 +0800
Message-ID: <20250620094140.11093-10-darren.ye@mediatek.com>
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

Add support for mt8196 board with nau8825.

Signed-off-by: Darren Ye <darren.ye@mediatek.com>
---
 sound/soc/mediatek/Kconfig                 |  22 +-
 sound/soc/mediatek/mt8196/Makefile         |   3 +
 sound/soc/mediatek/mt8196/mt8196-nau8825.c | 869 +++++++++++++++++++++
 3 files changed, 893 insertions(+), 1 deletion(-)
 create mode 100644 sound/soc/mediatek/mt8196/mt8196-nau8825.c

diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
index 63d4abebb539..90515f7df2cb 100644
--- a/sound/soc/mediatek/Kconfig
+++ b/sound/soc/mediatek/Kconfig
@@ -328,4 +328,24 @@ config SND_SOC_MT8196
 	  This adds ASoC driver for Mediatek MT8196 boards
 	  that can be used with other codecs.
 	  Select Y if you have such device.
-	  If unsure select "N".
\ No newline at end of file
+	  If unsure select "N".
+
+config SND_SOC_MT8196_NAU8825
+	tristate "ASoc Audio driver for MT8196 with NAU8825 and I2S codec"
+	depends on SND_SOC_MT8196
+	depends on I2C
+	select SND_SOC_HDMI_CODEC
+	select SND_SOC_DMIC
+	select SND_SOC_NAU8315
+	select SND_SOC_NAU8825
+	select SND_SOC_RT5645
+	select SND_SOC_RT5682_I2C
+	select SND_SOC_RT5682S
+	select SND_SOC_TAS2781_COMLIB
+	select SND_SOC_TAS2781_FMWLIB
+	select SND_SOC_TAS2781_I2C
+	help
+	  This adds support for ASoC machine driver for MediaTek MT8196
+	  boards with the NAU8825 and other I2S audio codecs.
+	  Select Y if you have such device.
+	  If unsure select "N".
diff --git a/sound/soc/mediatek/mt8196/Makefile b/sound/soc/mediatek/mt8196/Makefile
index 33f1fc768bd2..5c100040d1fe 100644
--- a/sound/soc/mediatek/mt8196/Makefile
+++ b/sound/soc/mediatek/mt8196/Makefile
@@ -12,3 +12,6 @@ snd-soc-mt8196-afe-objs += \
 	mt8196-dai-tdm.o
 
 obj-$(CONFIG_SND_SOC_MT8196) += snd-soc-mt8196-afe.o
+
+# machine driver
+obj-$(CONFIG_SND_SOC_MT8196_NAU8825) += mt8196-nau8825.o
diff --git a/sound/soc/mediatek/mt8196/mt8196-nau8825.c b/sound/soc/mediatek/mt8196/mt8196-nau8825.c
new file mode 100644
index 000000000000..2c87a4f44a96
--- /dev/null
+++ b/sound/soc/mediatek/mt8196/mt8196-nau8825.c
@@ -0,0 +1,869 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  mt8196-nau8825.c  --  mt8196 nau8825 ALSA SoC machine driver
+ *
+ *  Copyright (c) 2024 MediaTek Inc.
+ *  Author: Darren Ye <darren.ye@mediatek.com>
+ */
+
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+#include <sound/jack.h>
+#include <linux/input.h>
+#include <linux/of_device.h>
+
+#include "mtk-afe-platform-driver.h"
+#include "mt8196-afe-common.h"
+#include "mtk-afe-platform-driver.h"
+#include "mtk-soundcard-driver.h"
+#include "mtk-dsp-sof-common.h"
+#include "mtk-soc-card.h"
+
+#include "../../codecs/nau8825.h"
+#include "../../codecs/rt5682s.h"
+
+#define NAU8825_HS_PRESENT	BIT(0)
+#define RT5682S_HS_PRESENT	BIT(1)
+#define RT5650_HS_PRESENT	BIT(2)
+
+/*
+ * Nau88l25
+ */
+#define NAU8825_CODEC_DAI  "nau8825-hifi"
+
+/*
+ * Rt5682s
+ */
+#define RT5682S_CODEC_DAI     "rt5682s-aif1"
+
+/*
+ * Rt5650
+ */
+#define RT5650_CODEC_DAI     "rt5645-aif1"
+
+#define SOF_DMA_DL1 "SOF_DMA_DL1"
+#define SOF_DMA_DL_24CH "SOF_DMA_DL_24CH"
+#define SOF_DMA_UL0 "SOF_DMA_UL0"
+#define SOF_DMA_UL1 "SOF_DMA_UL1"
+#define SOF_DMA_UL2 "SOF_DMA_UL2"
+
+enum mt8196_jacks {
+	MT8196_JACK_HEADSET,
+	MT8196_JACK_DP,
+	MT8196_JACK_HDMI,
+	MT8196_JACK_MAX,
+};
+
+static struct snd_soc_jack_pin mt8196_dp_jack_pins[] = {
+	{
+		.pin = "DP",
+		.mask = SND_JACK_LINEOUT,
+	},
+};
+
+static struct snd_soc_jack_pin mt8196_hdmi_jack_pins[] = {
+	{
+		.pin = "HDMI",
+		.mask = SND_JACK_LINEOUT,
+	},
+};
+
+static struct snd_soc_jack_pin nau8825_jack_pins[] = {
+	{
+		.pin    = "Headphone Jack",
+		.mask   = SND_JACK_HEADPHONE,
+	},
+	{
+		.pin    = "Headset Mic",
+		.mask   = SND_JACK_MICROPHONE,
+	},
+};
+
+static const struct snd_kcontrol_new mt8196_dumb_spk_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Ext Spk"),
+};
+
+static const struct snd_soc_dapm_widget mt8196_dumb_spk_widgets[] = {
+	SND_SOC_DAPM_SPK("Ext Spk", NULL),
+};
+
+static const struct snd_soc_dapm_widget mt8196_nau8825_widgets[] = {
+	SND_SOC_DAPM_HP("Headphone Jack", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_SINK("DP"),
+};
+
+static const struct snd_kcontrol_new mt8196_nau8825_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Headphone Jack"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+};
+
+#define EXT_SPK_AMP_W_NAME "Ext_Speaker_Amp"
+
+static struct snd_soc_card mt8196_nau8825_soc_card;
+
+static const struct snd_soc_dapm_widget mt8196_nau8825_card_widgets[] = {
+	/* dynamic pinctrl */
+	SND_SOC_DAPM_PINCTRL("ETDMIN_SPK_PIN", "aud-gpio-i2sin4-on", "aud-gpio-i2sin4-off"),
+	SND_SOC_DAPM_PINCTRL("ETDMOUT_SPK_PIN", "aud-gpio-i2sout4-on", "aud-gpio-i2sout4-off"),
+	SND_SOC_DAPM_PINCTRL("ETDMIN_HP_PIN", "aud-gpio-i2sin6-on", "aud-gpio-i2sin6-off"),
+	SND_SOC_DAPM_PINCTRL("ETDMOUT_HP_PIN", "aud-gpio-i2sout6-on", "aud-gpio-i2sout6-off"),
+	SND_SOC_DAPM_PINCTRL("ETDMIN_HDMI_PIN", "aud-gpio-i2sin3-on", "aud-gpio-i2sin3-off"),
+	SND_SOC_DAPM_PINCTRL("ETDMOUT_HDMI_PIN", "aud-gpio-i2sout3-on", "aud-gpio-i2sout3-off"),
+	SND_SOC_DAPM_PINCTRL("AP_DMIC0_PIN", "aud-gpio-ap-dmic-on", "aud-gpio-ap-dmic-off"),
+	SND_SOC_DAPM_PINCTRL("AP_DMIC1_PIN", "aud-gpio-ap-dmic1-on", "aud-gpio-ap-dmic1-off"),
+};
+
+static const struct snd_soc_dapm_route mt8196_nau8825_card_routes[] = {
+};
+
+static const struct snd_kcontrol_new mt8196_nau8825_card_controls[] = {
+	SOC_DAPM_PIN_SWITCH(EXT_SPK_AMP_W_NAME),
+};
+
+/*
+ * define mtk_spk_i2s_mck node in dts when need mclk,
+ * BE i2s need assign snd_soc_ops = mt8196_nau8825_i2s_ops
+ */
+static int mt8196_nau8825_i2s_hw_params(struct snd_pcm_substream *substream,
+					struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	unsigned int rate = params_rate(params);
+	unsigned int mclk_fs_ratio = 128;
+	unsigned int mclk_fs = rate * mclk_fs_ratio;
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+
+	return snd_soc_dai_set_sysclk(cpu_dai,
+				      0, mclk_fs, SND_SOC_CLOCK_OUT);
+}
+
+static const struct snd_soc_ops mt8196_nau8825_i2s_ops = {
+	.hw_params = mt8196_nau8825_i2s_hw_params,
+};
+
+static int mt8196_dptx_hw_params(struct snd_pcm_substream *substream,
+				 struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	unsigned int rate = params_rate(params);
+	unsigned int mclk_fs_ratio = 256;
+	unsigned int mclk_fs = rate * mclk_fs_ratio;
+	struct snd_soc_dai *dai = snd_soc_rtd_to_cpu(rtd, 0);
+
+	return snd_soc_dai_set_sysclk(dai, 0, mclk_fs, SND_SOC_CLOCK_OUT);
+}
+
+static const struct snd_soc_ops mt8196_dptx_ops = {
+	.hw_params = mt8196_dptx_hw_params,
+};
+
+static int mt8196_dptx_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
+				       struct snd_pcm_hw_params *params)
+{
+	dev_info(rtd->dev, "fix format to 32bit\n");
+
+	/* fix BE i2s format to 32bit, clean param mask first */
+	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
+			     0, (__force unsigned int)SNDRV_PCM_FORMAT_LAST);
+
+	params_set_format(params, SNDRV_PCM_FORMAT_S32_LE);
+
+	return 0;
+}
+
+static int mt8196_i2s_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
+				      struct snd_pcm_hw_params *params)
+{
+	dev_info(rtd->dev, "fix format to 32bit\n");
+
+	/* fix BE i2s format to 32bit, clean param mask first */
+	snd_mask_reset_range(hw_param_mask(params, SNDRV_PCM_HW_PARAM_FORMAT),
+			     0, SNDRV_PCM_FORMAT_LAST);
+
+	params_set_format(params, SNDRV_PCM_FORMAT_S32_LE);
+	return 0;
+}
+
+static int mt8196_sof_be_hw_params(struct snd_pcm_substream *substream,
+				   struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_component *cmpnt_afe = NULL;
+	struct snd_soc_pcm_runtime *runtime;
+
+	/* find afe component */
+	for_each_card_rtds(rtd->card, runtime) {
+		cmpnt_afe = snd_soc_rtdcom_lookup(runtime, AFE_PCM_NAME);
+		if (cmpnt_afe) {
+			dev_info(rtd->dev, "component->name: %s\n", cmpnt_afe->name);
+			break;
+		}
+	}
+
+	if (cmpnt_afe && !pm_runtime_active(cmpnt_afe->dev)) {
+		dev_err(rtd->dev, "afe pm runtime is not active!!\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_ops mt8196_sof_be_ops = {
+	.hw_params = mt8196_sof_be_hw_params,
+};
+
+static const struct sof_conn_stream g_sof_conn_streams[] = {
+	{
+		.sof_link = "AFE_SOF_DL1",
+		.sof_dma = SOF_DMA_DL1,
+		.stream_dir = SNDRV_PCM_STREAM_PLAYBACK
+	},
+	{
+		.sof_link = "AFE_SOF_DL_24CH",
+		.sof_dma = SOF_DMA_DL_24CH,
+		.stream_dir = SNDRV_PCM_STREAM_PLAYBACK
+	},
+	{
+		.sof_link = "AFE_SOF_UL0",
+		.sof_dma = SOF_DMA_UL0,
+		.stream_dir = SNDRV_PCM_STREAM_CAPTURE
+	},
+	{
+		.sof_link = "AFE_SOF_UL1",
+		.sof_dma = SOF_DMA_UL1,
+		.stream_dir = SNDRV_PCM_STREAM_CAPTURE
+	},
+	{
+		.sof_link = "AFE_SOF_UL2",
+		.sof_dma = SOF_DMA_UL2,
+		.stream_dir = SNDRV_PCM_STREAM_CAPTURE
+	},
+};
+
+/* FE */
+SND_SOC_DAILINK_DEFS(playback1,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL1")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(playback_24ch,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL_24CH")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(capture0,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL0")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(capture1,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL1")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(capture2,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL2")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(playback_hdmi,
+		     DAILINK_COMP_ARRAY(COMP_CPU("HDMI")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(playback2,
+		     DAILINK_COMP_ARRAY(COMP_CPU("DL2")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(capture_cm0,
+		     DAILINK_COMP_ARRAY(COMP_CPU("UL_CM0")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+/* BE */
+SND_SOC_DAILINK_DEFS(ap_dmic,
+		     DAILINK_COMP_ARRAY(COMP_CPU("AP_DMIC")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(ap_dmic_ch34,
+		     DAILINK_COMP_ARRAY(COMP_CPU("AP_DMIC_CH34")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(ap_dmic_multich,
+		     DAILINK_COMP_ARRAY(COMP_CPU("AP_DMIC_MULTICH")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(i2sin6,
+		     DAILINK_COMP_ARRAY(COMP_CPU("I2SIN6")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(i2sout3,
+		     DAILINK_COMP_ARRAY(COMP_CPU("I2SOUT3")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(i2sout4,
+		     DAILINK_COMP_ARRAY(COMP_CPU("I2SOUT4")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(i2sout6,
+		     DAILINK_COMP_ARRAY(COMP_CPU("I2SOUT6")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(tdm_dptx,
+		     DAILINK_COMP_ARRAY(COMP_CPU("TDM_DPTX")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(AFE_SOF_DL_24CH,
+		     DAILINK_COMP_ARRAY(COMP_CPU("SOF_DL_24CH")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(AFE_SOF_DL1,
+		     DAILINK_COMP_ARRAY(COMP_CPU("SOF_DL1")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(AFE_SOF_UL0,
+		     DAILINK_COMP_ARRAY(COMP_CPU("SOF_UL0")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(AFE_SOF_UL1,
+		     DAILINK_COMP_ARRAY(COMP_CPU("SOF_UL1")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+SND_SOC_DAILINK_DEFS(AFE_SOF_UL2,
+		     DAILINK_COMP_ARRAY(COMP_CPU("SOF_UL2")),
+		     DAILINK_COMP_ARRAY(COMP_DUMMY()),
+		     DAILINK_COMP_ARRAY(COMP_EMPTY()));
+
+static struct snd_soc_dai_link mt8196_nau8825_dai_links[] = {
+	/*
+	 * The SOF topology expects PCM streams 0~4 to be available
+	 * for the SOF PCM streams. Put the SOF BE definitions here
+	 * so that the PCM device numbers are skipped over.
+	 * (BE dailinks do not have PCM devices created.)
+	 */
+	{
+		.name = "AFE_SOF_DL_24CH",
+		.no_pcm = 1,
+		.playback_only = 1,
+		.ops = &mt8196_sof_be_ops,
+		SND_SOC_DAILINK_REG(AFE_SOF_DL_24CH),
+	},
+	{
+		.name = "AFE_SOF_DL1",
+		.no_pcm = 1,
+		.playback_only = 1,
+		.ops = &mt8196_sof_be_ops,
+		SND_SOC_DAILINK_REG(AFE_SOF_DL1),
+	},
+	{
+		.name = "AFE_SOF_UL0",
+		.no_pcm = 1,
+		.capture_only = 1,
+		.ops = &mt8196_sof_be_ops,
+		SND_SOC_DAILINK_REG(AFE_SOF_UL0),
+	},
+	{
+		.name = "AFE_SOF_UL1",
+		.no_pcm = 1,
+		.capture_only = 1,
+		.ops = &mt8196_sof_be_ops,
+		SND_SOC_DAILINK_REG(AFE_SOF_UL1),
+	},
+	{
+		.name = "AFE_SOF_UL2",
+		.no_pcm = 1,
+		.capture_only = 1,
+		.ops = &mt8196_sof_be_ops,
+		SND_SOC_DAILINK_REG(AFE_SOF_UL2),
+	},
+	/* Front End DAI links */
+	{
+		.name = "HDMI_FE",
+		.stream_name = "HDMI Playback",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.playback_only = 1,
+		SND_SOC_DAILINK_REG(playback_hdmi),
+	},
+	{
+		.name = "DL2_FE",
+		.stream_name = "DL2 Playback",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.playback_only = 1,
+		SND_SOC_DAILINK_REG(playback2),
+	},
+	{
+		.name = "UL_CM0_FE",
+		.stream_name = "UL_CM0 Capture",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+			    SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.capture_only = 1,
+		SND_SOC_DAILINK_REG(capture_cm0),
+	},
+	{
+		.name = "DL_24CH_FE",
+		.stream_name = "DL_24CH Playback",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+				SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.playback_only = 1,
+		SND_SOC_DAILINK_REG(playback_24ch),
+	},
+	{
+		.name = "DL1_FE",
+		.stream_name = "DL1 Playback",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+				SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.playback_only = 1,
+		SND_SOC_DAILINK_REG(playback1),
+	},
+	{
+		.name = "UL0_FE",
+		.stream_name = "UL0 Capture",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+				SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.capture_only = 1,
+		SND_SOC_DAILINK_REG(capture0),
+	},
+	{
+		.name = "UL1_FE",
+		.stream_name = "UL1 Capture",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+				SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.capture_only = 1,
+		SND_SOC_DAILINK_REG(capture1),
+	},
+	{
+		.name = "UL2_FE",
+		.stream_name = "UL2 Capture",
+		.trigger = {SND_SOC_DPCM_TRIGGER_PRE,
+				SND_SOC_DPCM_TRIGGER_PRE},
+		.dynamic = 1,
+		.capture_only = 1,
+		SND_SOC_DAILINK_REG(capture2),
+	},
+	/* Back End DAI links */
+	{
+		.name = "I2SIN6_BE",
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBC_CFC
+			| SND_SOC_DAIFMT_GATED,
+		.ops = &mt8196_nau8825_i2s_ops,
+		.no_pcm = 1,
+		.capture_only = 1,
+		.ignore_suspend = 1,
+		.be_hw_params_fixup = mt8196_i2s_hw_params_fixup,
+		SND_SOC_DAILINK_REG(i2sin6),
+	},
+	{
+		.name = "I2SOUT4_BE",
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBC_CFC
+			| SND_SOC_DAIFMT_GATED,
+		.ops = &mt8196_nau8825_i2s_ops,
+		.no_pcm = 1,
+		.playback_only = 1,
+		.ignore_suspend = 1,
+		.ignore_pmdown_time = 1,
+		.be_hw_params_fixup = mt8196_i2s_hw_params_fixup,
+		SND_SOC_DAILINK_REG(i2sout4),
+	},
+	{
+		.name = "I2SOUT6_BE",
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBC_CFC
+			| SND_SOC_DAIFMT_GATED,
+		.ops = &mt8196_nau8825_i2s_ops,
+		.no_pcm = 1,
+		.playback_only = 1,
+		.ignore_suspend = 1,
+		.be_hw_params_fixup = mt8196_i2s_hw_params_fixup,
+		SND_SOC_DAILINK_REG(i2sout6),
+	},
+	{
+		.name = "AP_DMIC_BE",
+		.no_pcm = 1,
+		.capture_only = 1,
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(ap_dmic),
+	},
+	{
+		.name = "AP_DMIC_CH34_BE",
+		.no_pcm = 1,
+		.capture_only = 1,
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(ap_dmic_ch34),
+	},
+	{
+		.name = "AP_DMIC_MULTICH_BE",
+		.no_pcm = 1,
+		.capture_only = 1,
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(ap_dmic_multich),
+	},
+	{
+		.name = "TDM_DPTX_BE",
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBC_CFC
+			| SND_SOC_DAIFMT_GATED,
+		.ops = &mt8196_dptx_ops,
+		.be_hw_params_fixup = mt8196_dptx_hw_params_fixup,
+		.no_pcm = 1,
+		.playback_only = 1,
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(tdm_dptx),
+	},
+	{
+		.name = "I2SOUT3_BE",
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_CBC_CFC
+			| SND_SOC_DAIFMT_GATED,
+		.ops = &mt8196_nau8825_i2s_ops,
+		.no_pcm = 1,
+		.playback_only = 1,
+		.ignore_suspend = 1,
+		SND_SOC_DAILINK_REG(i2sout3),
+	},
+};
+
+static int mt8196_dumb_amp_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	int ret = 0;
+
+	ret = snd_soc_dapm_new_controls(&card->dapm, mt8196_dumb_spk_widgets,
+					ARRAY_SIZE(mt8196_dumb_spk_widgets));
+	if (ret) {
+		dev_err(rtd->dev, "unable to add Dumb Speaker dapm, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_add_card_controls(card, mt8196_dumb_spk_controls,
+					ARRAY_SIZE(mt8196_dumb_spk_controls));
+	if (ret) {
+		dev_err(rtd->dev, "unable to add Dumb card controls, ret %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int mt8196_dptx_codec_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_jack *jack = &soc_card_data->card_data->jacks[MT8196_JACK_DP];
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
+	int ret = 0;
+
+	ret = snd_soc_card_jack_new_pins(rtd->card, "DP Jack", SND_JACK_LINEOUT,
+					 jack, mt8196_dp_jack_pins,
+					 ARRAY_SIZE(mt8196_dp_jack_pins));
+	if (ret) {
+		dev_err(rtd->dev, "new jack failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_component_set_jack(component, jack, NULL);
+	if (ret) {
+		dev_err(rtd->dev, "set jack failed on %s (ret=%d)\n",
+			component->name, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int mt8196_hdmi_codec_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_jack *jack = &soc_card_data->card_data->jacks[MT8196_JACK_HDMI];
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
+	int ret = 0;
+
+	ret = snd_soc_card_jack_new_pins(rtd->card, "HDMI Jack", SND_JACK_LINEOUT,
+					 jack, mt8196_hdmi_jack_pins,
+					 ARRAY_SIZE(mt8196_hdmi_jack_pins));
+	if (ret) {
+		dev_err(rtd->dev, "new jack failed: %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_component_set_jack(component, jack, NULL);
+	if (ret) {
+		dev_err(rtd->dev, "set jack failed on %s (ret=%d)\n",
+			component->name, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int mt8196_headset_codec_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_card *card = rtd->card;
+	struct mtk_soc_card_data *soc_card_data = snd_soc_card_get_drvdata(card);
+	struct snd_soc_jack *jack = &soc_card_data->card_data->jacks[MT8196_JACK_HEADSET];
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
+	int ret;
+	int type;
+
+	ret = snd_soc_dapm_new_controls(&card->dapm, mt8196_nau8825_widgets,
+					ARRAY_SIZE(mt8196_nau8825_widgets));
+	if (ret) {
+		dev_err(rtd->dev, "unable to add nau8825 card widget, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_add_card_controls(card, mt8196_nau8825_controls,
+					ARRAY_SIZE(mt8196_nau8825_controls));
+	if (ret) {
+		dev_err(rtd->dev, "unable to add nau8825 card controls, ret %d\n", ret);
+		return ret;
+	}
+
+	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
+					 SND_JACK_HEADSET | SND_JACK_BTN_0 |
+					 SND_JACK_BTN_1 | SND_JACK_BTN_2 |
+					 SND_JACK_BTN_3,
+					 jack,
+					 nau8825_jack_pins,
+					 ARRAY_SIZE(nau8825_jack_pins));
+	if (ret) {
+		dev_err(rtd->dev, "Headset Jack creation failed: %d\n", ret);
+		return ret;
+	}
+
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_1, KEY_VOICECOMMAND);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_2, KEY_VOLUMEUP);
+	snd_jack_set_key(jack->jack, SND_JACK_BTN_3, KEY_VOLUMEDOWN);
+
+	type = SND_JACK_HEADSET | SND_JACK_BTN_0 | SND_JACK_BTN_1 | SND_JACK_BTN_2 | SND_JACK_BTN_3;
+	ret = snd_soc_component_set_jack(component, jack, (void *)&type);
+
+	if (ret) {
+		dev_err(rtd->dev, "Headset Jack call-back failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+};
+
+static void mt8196_headset_codec_exit(struct snd_soc_pcm_runtime *rtd)
+{
+	struct snd_soc_component *component = snd_soc_rtd_to_codec(rtd, 0)->component;
+
+	snd_soc_component_set_jack(component, NULL, NULL);
+}
+
+static int mt8196_nau8825_hw_params(struct snd_pcm_substream *substream,
+				    struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	unsigned int rate = params_rate(params);
+	unsigned int bit_width = params_width(params);
+	int clk_freq, ret;
+
+	clk_freq = rate * 2 * bit_width;
+
+	/* Configure clock for codec */
+	ret = snd_soc_dai_set_sysclk(codec_dai, NAU8825_CLK_FLL_BLK, 0,
+				     SND_SOC_CLOCK_IN);
+	if (ret < 0) {
+		dev_err(codec_dai->dev, "can't set BCLK clock %d\n", ret);
+		return ret;
+	}
+
+	/* Configure pll for codec */
+	ret = snd_soc_dai_set_pll(codec_dai, 0, 0, clk_freq,
+				  params_rate(params) * 256);
+	if (ret < 0) {
+		dev_err(codec_dai->dev, "can't set BCLK: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_ops mt8196_nau8825_ops = {
+	.hw_params = mt8196_nau8825_hw_params,
+};
+
+static int mt8196_rt5682s_i2s_hw_params(struct snd_pcm_substream *substream,
+					struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_card *card = rtd->card;
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
+	unsigned int rate = params_rate(params);
+	int bitwidth;
+	int ret;
+
+	bitwidth = snd_pcm_format_width(params_format(params));
+	if (bitwidth < 0) {
+		dev_err(card->dev, "invalid bit width: %d\n", bitwidth);
+		return bitwidth;
+	}
+
+	ret = snd_soc_dai_set_tdm_slot(codec_dai, 0x00, 0x0, 0x2, bitwidth);
+	if (ret) {
+		dev_err(card->dev, "failed to set tdm slot\n");
+		return ret;
+	}
+
+	ret = snd_soc_dai_set_pll(codec_dai, RT5682S_PLL1, RT5682S_PLL_S_BCLK1,
+				  rate * 32, rate * 512);
+	if (ret) {
+		dev_err(card->dev, "failed to set pll\n");
+		return ret;
+	}
+
+	dev_info(card->dev, "%s set mclk rate: %d\n", __func__, rate * 512);
+
+	ret = snd_soc_dai_set_sysclk(codec_dai, RT5682S_SCLK_S_MCLK,
+				     rate * 512, SND_SOC_CLOCK_IN);
+	if (ret) {
+		dev_err(card->dev, "failed to set sysclk\n");
+		return ret;
+	}
+
+	return snd_soc_dai_set_sysclk(cpu_dai, 0, rate * 512,
+				      SND_SOC_CLOCK_OUT);
+}
+
+static const struct snd_soc_ops mt8196_rt5682s_i2s_ops = {
+	.hw_params = mt8196_rt5682s_i2s_hw_params,
+};
+
+static int mt8196_nau8825_soc_card_probe(struct mtk_soc_card_data *soc_card_data, bool legacy)
+{
+	struct snd_soc_card *card = soc_card_data->card_data->card;
+	struct snd_soc_dai_link *dai_link;
+	bool init_nau8825 = false;
+	bool init_rt5682s = false;
+	bool init_rt5650 = false;
+	bool init_dumb = false;
+	int i;
+
+	dev_info(card->dev, "legacy: %d\n", legacy);
+
+	for_each_card_prelinks(card, i, dai_link) {
+		if (strcmp(dai_link->name, "TDM_DPTX_BE") == 0) {
+			if (dai_link->num_codecs &&
+			    strcmp(dai_link->codecs->dai_name, "snd-soc-dummy-dai"))
+				dai_link->init = mt8196_dptx_codec_init;
+		} else if (strcmp(dai_link->name, "I2SOUT3_BE") == 0) {
+			if (dai_link->num_codecs &&
+			    strcmp(dai_link->codecs->dai_name, "snd-soc-dummy-dai"))
+				dai_link->init = mt8196_hdmi_codec_init;
+		} else if (strcmp(dai_link->name, "I2SOUT6_BE") == 0 ||
+			   strcmp(dai_link->name, "I2SIN6_BE") == 0) {
+			if (!strcmp(dai_link->codecs->dai_name, NAU8825_CODEC_DAI)) {
+				dai_link->ops = &mt8196_nau8825_ops;
+				if (!init_nau8825) {
+					dai_link->init = mt8196_headset_codec_init;
+					dai_link->exit = mt8196_headset_codec_exit;
+					init_nau8825 = true;
+				}
+			} else if (!strcmp(dai_link->codecs->dai_name, RT5682S_CODEC_DAI)) {
+				dai_link->ops = &mt8196_rt5682s_i2s_ops;
+				if (!init_rt5682s) {
+					dai_link->init = mt8196_headset_codec_init;
+					dai_link->exit = mt8196_headset_codec_exit;
+					init_rt5682s = true;
+				}
+			} else if (!strcmp(dai_link->codecs->dai_name, RT5650_CODEC_DAI)) {
+				dai_link->ops = &mt8196_rt5682s_i2s_ops;
+				if (!init_rt5650) {
+					dai_link->init = mt8196_headset_codec_init;
+					dai_link->exit = mt8196_headset_codec_exit;
+					init_rt5650 = true;
+				}
+			} else {
+				if (strcmp(dai_link->codecs->dai_name, "snd-soc-dummy-dai")) {
+					if (!init_dumb) {
+						dai_link->init = mt8196_dumb_amp_init;
+						init_dumb = true;
+					}
+				}
+			}
+		}
+	}
+
+	return 0;
+}
+
+static const struct mtk_sof_priv mt8196_sof_priv = {
+	.conn_streams = g_sof_conn_streams,
+	.num_streams = ARRAY_SIZE(g_sof_conn_streams),
+};
+
+static struct snd_soc_card mt8196_nau8825_soc_card = {
+	.owner = THIS_MODULE,
+	.dai_link = mt8196_nau8825_dai_links,
+	.num_links = ARRAY_SIZE(mt8196_nau8825_dai_links),
+	.dapm_widgets = mt8196_nau8825_card_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(mt8196_nau8825_card_widgets),
+	.dapm_routes = mt8196_nau8825_card_routes,
+	.num_dapm_routes = ARRAY_SIZE(mt8196_nau8825_card_routes),
+	.controls = mt8196_nau8825_card_controls,
+	.num_controls = ARRAY_SIZE(mt8196_nau8825_card_controls),
+};
+
+static const struct mtk_soundcard_pdata mt8196_nau8825_card = {
+	.card_name = "mt8196_nau8825",
+	.card_data = &(struct mtk_platform_card_data) {
+		.card = &mt8196_nau8825_soc_card,
+		.num_jacks = MT8196_JACK_MAX,
+		.flags = NAU8825_HS_PRESENT
+	},
+	.sof_priv = &mt8196_sof_priv,
+	.soc_probe = mt8196_nau8825_soc_card_probe,
+};
+
+static const struct mtk_soundcard_pdata mt8196_rt5682s_card = {
+	.card_name = "mt8196_rt5682s",
+	.card_data = &(struct mtk_platform_card_data) {
+		.card = &mt8196_nau8825_soc_card,
+		.num_jacks = MT8196_JACK_MAX,
+		.flags = RT5682S_HS_PRESENT
+	},
+	.sof_priv = &mt8196_sof_priv,
+	.soc_probe = mt8196_nau8825_soc_card_probe,
+};
+
+static const struct mtk_soundcard_pdata mt8196_rt5650_card = {
+	.card_name = "mt8196_rt5650",
+	.card_data = &(struct mtk_platform_card_data) {
+		.card = &mt8196_nau8825_soc_card,
+		.num_jacks = MT8196_JACK_MAX,
+		.flags = RT5650_HS_PRESENT
+	},
+	.sof_priv = &mt8196_sof_priv,
+	.soc_probe = mt8196_nau8825_soc_card_probe,
+};
+
+static const struct of_device_id mt8196_nau8825_dt_match[] = {
+	{.compatible = "mediatek,mt8196-nau8825-sound", .data = &mt8196_nau8825_card,},
+	{.compatible = "mediatek,mt8196-rt5682s-sound", .data = &mt8196_rt5682s_card,},
+	{.compatible = "mediatek,mt8196-rt5650-sound", .data = &mt8196_rt5650_card,},
+	{}
+};
+MODULE_DEVICE_TABLE(of, mt8196_nau8825_dt_match);
+
+static struct platform_driver mt8196_nau8825_driver = {
+	.driver = {
+		.name = "mt8196-nau8825",
+		.of_match_table = mt8196_nau8825_dt_match,
+		.pm = &snd_soc_pm_ops,
+	},
+	.probe = mtk_soundcard_common_probe,
+};
+module_platform_driver(mt8196_nau8825_driver);
+
+/* Module information */
+MODULE_DESCRIPTION("MT8196 nau8825 ALSA SoC machine driver");
+MODULE_AUTHOR("Darren Ye <darren.ye@mediatek.com>");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("mt8196 nau8825 soc card");
+
-- 
2.45.2


