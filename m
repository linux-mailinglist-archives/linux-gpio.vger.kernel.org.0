Return-Path: <linux-gpio+bounces-22012-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 614DBAE3A49
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 11:30:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F94D16C319
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 09:30:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D6D239E6A;
	Mon, 23 Jun 2025 09:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="B43e1nc+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EF6235044;
	Mon, 23 Jun 2025 09:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750671003; cv=none; b=D3RJz61Zzxyo6440r1lqCRKBL4flpNQUiQ4hgOOkgCiLbsuvnl7NHsZAl5wrogRFiM9rRTYLPrzzluY9fBLK6QR5TjWAIqW0srZJZ4gFCUnmzT+YzhNWinL04VsEZk54gCIAR8sHs97KmRt9fXWu7bzyiIW2985s6fKNy0gO3Ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750671003; c=relaxed/simple;
	bh=93LvT2AyDuZLCkQY4pcrxtgY+4xqSrj/F2js6dy7NLc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OHM8YjdOVG6BBc2vkw+3hg6wg50xxXosRvEZ1T31wx5RsL8FuX1xElFD/MViWdqifcSbQJugHF2Tr5mb3feNiXLrZ5lGnoK0VqJE/WIcK4S16mJCmf5hwUrUNVN/nuOXzHq1uGqK4kFmSp7qQjG3oqzOsIjPEjASgQ5unnGGnyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=B43e1nc+; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750670997;
	bh=93LvT2AyDuZLCkQY4pcrxtgY+4xqSrj/F2js6dy7NLc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B43e1nc+8u8xc3ZSQsLIvfdR4IT47N8C105njen/znscR7m9r3XPf9OSsSXYg5Dhu
	 GbF42+9aQXC5aAm7ehKReyr0B2GVOwMpGVeF+TAmAdQsjLddOCawSoERhwUlACeYX6
	 uiICdFopniqOxcWd+mV0GRk7M6vjf6vjVmUTpc50aDeEEsvEVymLILQtR81uFWGUrX
	 5pwKd4bhpJzbDV3Amwwl5RC2lqgyndzsujTX+veJfxhVKDfIwu21+iwicAhKQEqpkV
	 ccptGFADPuAYZ26avbCI2G6sPvu+2mkXyZL+LzsyhxtVNodR4UF3Pv5rGVyRb40ZAw
	 5DvLPDAPqlJEA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0748717E0CE6;
	Mon, 23 Jun 2025 11:29:56 +0200 (CEST)
Message-ID: <141c1501-6dd0-442b-8156-95497eb6c866@collabora.com>
Date: Mon, 23 Jun 2025 11:29:56 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 07/10] ASoC: mediatek: mt8196: add platform driver
To: "Darren.Ye" <darren.ye@mediatek.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
References: <20250620094140.11093-1-darren.ye@mediatek.com>
 <20250620094140.11093-8-darren.ye@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250620094140.11093-8-darren.ye@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 20/06/25 11:40, Darren.Ye ha scritto:
> From: Darren Ye <darren.ye@mediatek.com>
> 
> Add mt8196 platform driver.
> 
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> ---
>   sound/soc/mediatek/Kconfig                 |   10 +
>   sound/soc/mediatek/Makefile                |    1 +
>   sound/soc/mediatek/mt8196/Makefile         |   14 +
>   sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 2657 ++++++++++++++++++++
>   4 files changed, 2682 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt8196/Makefile
>   create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
> 
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index 90e367586493..63d4abebb539 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -319,3 +319,13 @@ config SND_SOC_MT8365_MT6357
>   	  boards with the MT6357 PMIC codec.
>   	  Select Y if you have such device.
>   	  If unsure select "N".
> +
> +config SND_SOC_MT8196
> +	tristate "ASoC support for Mediatek MT8196 chip"
> +	depends on ARCH_MEDIATEK
> +	select SND_SOC_MEDIATEK
> +	help
> +	  This adds ASoC driver for Mediatek MT8196 boards
> +	  that can be used with other codecs.
> +	  Select Y if you have such device.
> +	  If unsure select "N".
> \ No newline at end of file
> diff --git a/sound/soc/mediatek/Makefile b/sound/soc/mediatek/Makefile
> index 4b55434f2168..11d7c484a5d3 100644
> --- a/sound/soc/mediatek/Makefile
> +++ b/sound/soc/mediatek/Makefile
> @@ -10,3 +10,4 @@ obj-$(CONFIG_SND_SOC_MT8188) += mt8188/
>   obj-$(CONFIG_SND_SOC_MT8192) += mt8192/
>   obj-$(CONFIG_SND_SOC_MT8195) += mt8195/
>   obj-$(CONFIG_SND_SOC_MT8365) += mt8365/
> +obj-$(CONFIG_SND_SOC_MT8196) += mt8196/
> diff --git a/sound/soc/mediatek/mt8196/Makefile b/sound/soc/mediatek/mt8196/Makefile
> new file mode 100644
> index 000000000000..33f1fc768bd2
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8196/Makefile
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +# common include path
> +subdir-ccflags-y += -I$(srctree)/sound/soc/mediatek/common
> +
> +# platform driver
> +snd-soc-mt8196-afe-objs += \
> +	mt8196-afe-pcm.o \
> +	mt8196-afe-clk.o \
> +	mt8196-dai-adda.o \
> +	mt8196-dai-i2s.o \
> +	mt8196-dai-tdm.o
> +
> +obj-$(CONFIG_SND_SOC_MT8196) += snd-soc-mt8196-afe.o
> diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
> new file mode 100644
> index 000000000000..3f3c8715c2d1
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
> @@ -0,0 +1,2657 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  Mediatek ALSA SoC AFE platform driver for 8196
> + *
> + *  Copyright (c) 2024 MediaTek Inc.
> + *  Author: Darren Ye <darren.ye@mediatek.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/of_device.h>
> +#include <sound/soc.h>
> +#include <linux/of_reserved_mem.h>
> +
> +#include "mt8196-afe-clk.h"
> +#include "mt8196-afe-common.h"
> +#include "mtk-afe-fe-dai.h"
> +#include "mtk-afe-platform-driver.h"
> +#include "mt8196-interconnection.h"
> +
> +static const struct snd_pcm_hardware mt8196_afe_hardware = {
> +	.info = (SNDRV_PCM_INFO_MMAP |
> +		 SNDRV_PCM_INFO_NO_PERIOD_WAKEUP |
> +		 SNDRV_PCM_INFO_INTERLEAVED |
> +		 SNDRV_PCM_INFO_MMAP_VALID),
> +	.formats = (SNDRV_PCM_FMTBIT_S16_LE |
> +		    SNDRV_PCM_FMTBIT_S24_LE |
> +		    SNDRV_PCM_FMTBIT_S32_LE),
> +	.period_bytes_min = 96,
> +	.period_bytes_max = 4 * 48 * 1024,
> +	.periods_min = 2,
> +	.periods_max = 256,
> +	.buffer_bytes_max = 256 * 1024,
> +	.fifo_size = 0,
> +};
> +
> +static unsigned int mt8196_rate_transform(struct device *dev,
> +					  unsigned int rate)
> +{
> +	switch (rate) {
> +	case 8000:
> +		return MTK_AFE_IPM2P0_RATE_8K;
> +	case 11025:
> +		return MTK_AFE_IPM2P0_RATE_11K;
> +	case 12000:
> +		return MTK_AFE_IPM2P0_RATE_12K;
> +	case 16000:
> +		return MTK_AFE_IPM2P0_RATE_16K;
> +	case 22050:
> +		return MTK_AFE_IPM2P0_RATE_22K;
> +	case 24000:
> +		return MTK_AFE_IPM2P0_RATE_24K;
> +	case 32000:
> +		return MTK_AFE_IPM2P0_RATE_32K;
> +	case 44100:
> +		return MTK_AFE_IPM2P0_RATE_44K;
> +	case 48000:
> +		return MTK_AFE_IPM2P0_RATE_48K;
> +	case 88200:
> +		return MTK_AFE_IPM2P0_RATE_88K;
> +	case 96000:
> +		return MTK_AFE_IPM2P0_RATE_96K;
> +	case 176400:
> +		return MTK_AFE_IPM2P0_RATE_176K;
> +	case 192000:
> +		return MTK_AFE_IPM2P0_RATE_192K;
> +	/* not support 260K */
> +	case 352800:
> +		return MTK_AFE_IPM2P0_RATE_352K;
> +	case 384000:
> +		return MTK_AFE_IPM2P0_RATE_384K;
> +	default:
> +		dev_info(dev, "rate %u invalid, use %d!!!\n",

dev_err

> +			 rate, MTK_AFE_IPM2P0_RATE_48K);
> +		return MTK_AFE_IPM2P0_RATE_48K;
> +	}
> +}
> +
> +static void mt8196_set_cm_rate(struct mtk_base_afe *afe, int id, unsigned int rate)
> +{
> +	struct mt8196_afe_private *afe_priv = afe->platform_priv;
> +
> +	afe_priv->cm_rate[id] = rate;
> +}
> +
> +static int mt8196_convert_cm_ch(unsigned int ch)

static inline int....

> +{
> +	return ch - 1;
> +}
> +
> +static unsigned int calculate_cm_update(unsigned int rate, unsigned int ch)
> +{
> +	unsigned int update_val;
> +
> +	update_val = (((26000000 / rate) - 10) / (ch / 2)) - 1;
> +
> +	return update_val;

	return (((26000000 / rate) - 10) / (ch / 2)) - 1;

> +}
> +

..snip..

> +
> +static int mt8196_enable_cm_bypass(struct mtk_base_afe *afe, int id, bool en)
> +{
> +	int reg = AFE_CM0_CON0 + 0x10 * id;
> +
> +	regmap_update_bits(afe->regmap,
> +			   reg,
> +			   AFE_CM_BYPASS_MODE_MASK << AFE_CM_BYPASS_MODE_SFT,
> +			   en << AFE_CM_BYPASS_MODE_SFT);
> +
> +	return 0;

return regmap_update_bits(afe->regmap, AFE_CM0_CON0 + 0x10 * id,
			  AFE_CM_BYPASS_MODE_MASK ... etc

> +}
> +

..snip..

> +
> +static int mt8196_fe_trigger(struct snd_pcm_substream *substream, int cmd,
> +			     struct snd_soc_dai *dai)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct snd_pcm_runtime *const runtime = substream->runtime;
> +	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
> +	struct mt8196_afe_private *afe_priv = afe->platform_priv;
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	int id = cpu_dai->id;
> +	struct mtk_base_afe_memif *memif = &afe->memif[id];
> +	int irq_id = memif->irq_usage;
> +	struct mtk_base_afe_irq *irqs = &afe->irqs[irq_id];
> +	const struct mtk_base_irq_data *irq_data = irqs->irq_data;
> +	unsigned int counter = runtime->period_size;
> +	unsigned int rate = runtime->rate;
> +	int fs;
> +	int ret = 0;
> +	unsigned int tmp_reg = 0;

please avoid variables double initialization.

> +
> +	dev_info(afe->dev, "%s cmd %d, irq_id %d\n",
> +		 memif->data->name, cmd, irq_id);
> +
> +	switch (cmd) {
> +	case SNDRV_PCM_TRIGGER_START:
> +	case SNDRV_PCM_TRIGGER_RESUME:
> +		dev_dbg(afe->dev, "%s cmd %d, id %d\n",
> +			memif->data->name, cmd, id);
> +		ret = mtk_memif_set_enable(afe, id);
> +		if (ret) {
> +			dev_err(afe->dev, "id %d, memif enable fail.\n", id);
> +			return ret;
> +		}
> +
> +		/*
> +		 * for small latency record
> +		 * ul memif need read some data before irq enable
> +		 */
> +		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
> +			if ((runtime->period_size * 1000) / rate <= 10)
> +				usleep_range(300, 350);
> +		}
> +
> +		/* set irq counter */
> +		if (afe_priv->irq_cnt[id] > 0)
> +			counter = afe_priv->irq_cnt[id];
> +
> +		regmap_update_bits(afe->regmap,
> +				   irq_data->irq_cnt_reg,
> +				   irq_data->irq_cnt_maskbit << irq_data->irq_cnt_shift,
> +				   counter << irq_data->irq_cnt_shift);
> +
> +		/* set irq fs */
> +		fs = afe->irq_fs(substream, runtime->rate);
> +		if (fs < 0)
> +			return -EINVAL;
> +
> +		if (irq_data->irq_fs_reg >= 0)
> +			regmap_update_bits(afe->regmap,
> +					   irq_data->irq_fs_reg,
> +					   irq_data->irq_fs_maskbit << irq_data->irq_fs_shift,
> +					   fs << irq_data->irq_fs_shift);
> +
> +		/* enable interrupt */
> +		regmap_update_bits(afe->regmap,
> +				   irq_data->irq_en_reg,
> +				   1 << irq_data->irq_en_shift,
> +				   1 << irq_data->irq_en_shift);
> +
> +		return 0;
> +	case SNDRV_PCM_TRIGGER_STOP:
> +	case SNDRV_PCM_TRIGGER_SUSPEND:
> +		ret = mtk_memif_set_disable(afe, id);
> +		if (ret) {
> +			dev_warn(afe->dev,
> +				 "id %d, memif disable fail\n", id);
> +		}
> +
> +		/* disable interrupt */
> +		regmap_update_bits(afe->regmap,
> +				   irq_data->irq_en_reg,
> +				   1 << irq_data->irq_en_shift,
> +				   0 << irq_data->irq_en_shift);
> +
> +		/* clear pending IRQ */
> +		regmap_read(afe->regmap, irq_data->irq_clr_reg, &tmp_reg);
> +		regmap_update_bits(afe->regmap, irq_data->irq_clr_reg,
> +				   AFE_IRQ_CLR_CFG_MASK_SFT | AFE_IRQ_MISS_FLAG_CLR_CFG_MASK_SFT,
> +				   tmp_reg ^ (AFE_IRQ_CLR_CFG_MASK_SFT |
> +				   AFE_IRQ_MISS_FLAG_CLR_CFG_MASK_SFT));
> +
> +		return ret;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
> +static int mt8196_memif_fs(struct snd_pcm_substream *substream,
> +			   unsigned int rate)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_component *component =
> +		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
> +	struct mtk_base_afe *afe = NULL;
> +	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
> +	int id = cpu_dai->id;
> +	unsigned int rate_reg = 0;
> +	int cm = 0;

Please avoid variables double initialization.

> +
> +	if (!component)
> +		return -EINVAL;
> +
> +	afe = snd_soc_component_get_drvdata(component);
> +
> +	if (!afe)
> +		return -EINVAL;
> +
> +	rate_reg = mt8196_rate_transform(afe->dev, rate);
> +
> +	switch (id) {
> +	case MT8196_MEMIF_VUL8:
> +	case MT8196_MEMIF_VUL_CM0:
> +		cm = CM0;
> +		break;
> +	case MT8196_MEMIF_VUL9:
> +	case MT8196_MEMIF_VUL_CM1:
> +		cm = CM1;
> +		break;
> +	case MT8196_MEMIF_VUL10:
> +	case MT8196_MEMIF_VUL_CM2:
> +		cm = CM2;
> +		break;
> +	default:
> +		cm = CM0;
> +		break;
> +	}
> +
> +	mt8196_set_cm_rate(afe, cm, rate);
> +
> +	return rate_reg;
> +}
> +
> +static int mt8196_get_dai_fs(struct mtk_base_afe *afe,
> +			     int dai_id, unsigned int rate)
> +{
> +	return mt8196_rate_transform(afe->dev, rate);
> +}
> +
> +static int mt8196_irq_fs(struct snd_pcm_substream *substream, unsigned int rate)
> +{
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
> +	struct snd_soc_component *component =
> +		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
> +	struct mtk_base_afe *afe = NULL;
> +
> +	if (!component)
> +		return -EINVAL;
> +	afe = snd_soc_component_get_drvdata(component);
> +	return mt8196_rate_transform(afe->dev, rate);
> +}
> +
> +static int mt8196_get_memif_pbuf_size(struct snd_pcm_substream *substream)
> +{
> +	struct snd_pcm_runtime *runtime = substream->runtime;
> +
> +	if ((runtime->period_size * 1000) / runtime->rate > 10)
> +		return MT8196_MEMIF_PBUF_SIZE_256_BYTES;
> +	else
> +		return MT8196_MEMIF_PBUF_SIZE_32_BYTES;
> +}
> +
> +/* FE DAIs */
> +static const struct snd_soc_dai_ops mt8196_memif_dai_ops = {
> +	.startup        = mt8196_fe_startup,
> +	.shutdown       = mt8196_fe_shutdown,
> +	.hw_params      = mt8196_fe_hw_params,
> +	.hw_free        = mtk_afe_fe_hw_free,
> +	.prepare        = mtk_afe_fe_prepare,
> +	.trigger        = mt8196_fe_trigger,
> +};
> +
> +#define MTK_PCM_RATES (SNDRV_PCM_RATE_8000_48000 |\
> +		       SNDRV_PCM_RATE_88200 |\
> +		       SNDRV_PCM_RATE_96000 |\
> +		       SNDRV_PCM_RATE_176400 |\
> +		       SNDRV_PCM_RATE_192000)
> +
> +#define MTK_PCM_DAI_RATES (SNDRV_PCM_RATE_8000 |\
> +			   SNDRV_PCM_RATE_16000 |\
> +			   SNDRV_PCM_RATE_32000 |\
> +			   SNDRV_PCM_RATE_48000)
> +
> +#define MTK_PCM_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
> +			 SNDRV_PCM_FMTBIT_S24_LE |\
> +			 SNDRV_PCM_FMTBIT_S32_LE)
> +
> +#define MT8196_FE_DAI_PLAYBACK(_name, _id, max_ch) \
> +{ \
> +	.name = #_name, \
> +	.id = _id, \
> +	.playback = { \
> +		.stream_name = #_name, \
> +		.channels_min = 1, \
> +		.channels_max = max_ch, \
> +		.rates = MTK_PCM_RATES, \
> +		.formats = MTK_PCM_FORMATS, \
> +	}, \
> +	.ops = &mt8196_memif_dai_ops, \
> +}

Those two macros are the same.

> +
> +#define MT8196_FE_DAI_CAPTURE(_name, _id, max_ch) \
> +{ \
> +	.name = #_name, \
> +	.id = _id, \
> +	.capture = { \
> +		.stream_name = #_name, \
> +		.channels_min = 1, \
> +		.channels_max = max_ch, \
> +		.rates = MTK_PCM_RATES, \
> +		.formats = MTK_PCM_FORMATS, \
> +	}, \
> +	.ops = &mt8196_memif_dai_ops, \
> +}
> +

..snip..

> +
> +static const struct regmap_config mt8196_afe_regmap_config = {
> +	.reg_bits = 32,
> +	.reg_stride = 4,
> +	.val_bits = 32,
> +
> +	.volatile_reg = mt8196_is_volatile_reg,
> +
> +	.max_register = AFE_MAX_REGISTER,
> +	.num_reg_defaults_raw = AFE_MAX_REGISTER,
> +
> +	.cache_type = REGCACHE_FLAT,
> +};
> +
> +static irqreturn_t mt8196_afe_irq_handler(int irq_id, void *dev)
> +{
> +	struct mtk_base_afe *afe = dev;
> +	struct mtk_base_afe_irq *irq;
> +	unsigned int status = 0;
> +	unsigned int status_mcu;
> +	unsigned int mcu_en = 0;
> +	unsigned int cus_status = 0;
> +	unsigned int cus_status_mcu;
> +	unsigned int cus_mcu_en = 0;
> +	unsigned int tmp_reg = 0;
> +	int ret, cus_ret;
> +	int i;
> +	struct timespec64 ts64;
> +	unsigned long long t1, t2;
> +	/* one interrupt period = 5ms */
> +	unsigned long long timeout_limit = 5000000;

const unsigned ....

> +
> +	/* get irq that is sent to MCU */
> +	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &mcu_en);
> +	regmap_read(afe->regmap, AFE_CUSTOM_IRQ_MCU_EN, &cus_mcu_en);
> +
> +	ret = regmap_read(afe->regmap, AFE_IRQ_MCU_STATUS, &status);
> +	cus_ret = regmap_read(afe->regmap, AFE_CUSTOM_IRQ_MCU_STATUS, &cus_status);
> +	/* only care IRQ which is sent to MCU */
> +	status_mcu = status & mcu_en & AFE_IRQ_STATUS_BITS;
> +	cus_status_mcu = cus_status & cus_mcu_en & AFE_IRQ_STATUS_BITS;
> +	if ((ret || !status_mcu) &&
> +	    (cus_ret || !cus_status_mcu)) {
> +		dev_info(afe->dev, "irq status err, ret %d, status 0x%x, mcu_en 0x%x\n",
> +			 ret, status, mcu_en);
> +		dev_info(afe->dev, "irq status err, ret %d, cus_status_mcu 0x%x, cus_mcu_en 0x%x\n",
> +			 ret, cus_status_mcu, cus_mcu_en);

dev_err, and use just one print please.

> +
> +		goto err_irq;
> +	}
> +
> +	ktime_get_ts64(&ts64);
> +	t1 = timespec64_to_ns(&ts64);
> +
> +	for (i = 0; i < MT8196_MEMIF_NUM; i++) {
> +		struct mtk_base_afe_memif *memif = &afe->memif[i];
> +
> +		if (!memif->substream)
> +			continue;
> +
> +		if (memif->irq_usage < 0)
> +			continue;
> +		irq = &afe->irqs[memif->irq_usage];
> +
> +		if (i == MT8196_MEMIF_HDMI) {
> +			if (cus_status_mcu & (0x1 << irq->irq_data->id))
> +				snd_pcm_period_elapsed(memif->substream);
> +		} else {
> +			if (status_mcu & (0x1 << irq->irq_data->id))
> +				snd_pcm_period_elapsed(memif->substream);
> +		}
> +	}
> +
> +	ktime_get_ts64(&ts64);
> +	t2 = timespec64_to_ns(&ts64);
> +	t2 = t2 - t1; /* in ns (10^9) */
> +
> +	if (t2 > timeout_limit) {
> +		dev_warn(afe->dev, "mcu_en 0x%x, cus_mcu_en 0x%x, timeout %llu, limit %llu, ret %d\n",
> +			 mcu_en, cus_mcu_en,
> +			 t2, timeout_limit, ret);
> +	}
> +
> +err_irq:
> +	/* clear irq */
> +	for (i = 0; i < MT8196_IRQ_NUM; ++i) {
> +		/* cus_status_mcu only bit0 is used for TDM */
> +		if ((status_mcu & (0x1 << i)) || (cus_status_mcu & 0x1)) {
> +			regmap_read(afe->regmap, irq_data[i].irq_clr_reg, &tmp_reg);
> +			regmap_update_bits(afe->regmap, irq_data[i].irq_clr_reg,
> +					   AFE_IRQ_CLR_CFG_MASK_SFT |
> +					   AFE_IRQ_MISS_FLAG_CLR_CFG_MASK_SFT,
> +					   tmp_reg ^ (AFE_IRQ_CLR_CFG_MASK_SFT |
> +					   AFE_IRQ_MISS_FLAG_CLR_CFG_MASK_SFT));
> +		}
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int mt8196_afe_runtime_suspend(struct device *dev)
> +{
> +	struct mtk_base_afe *afe = dev_get_drvdata(dev);
> +	unsigned int value = 0;
> +	unsigned int tmp_reg = 0;
> +	int ret = 0, i;

avoid double init.

> +
> +	if (!afe->regmap) {
> +		dev_err(afe->dev, "skip regmap\n");
> +		goto skip_regmap;
> +	}
> +
> +	/* disable AFE */
> +	mt8196_afe_disable_main_clock(afe);
> +
> +	ret = regmap_read_poll_timeout(afe->regmap,
> +				       AUDIO_ENGEN_CON0_MON,
> +				       value,
> +				       (value & AUDIO_ENGEN_MON_SFT) == 0,
> +				       20,
> +				       1 * 1000 * 1000);
> +	dev_dbg(afe->dev, "read_poll ret %d\n", ret);
> +	if (ret)
> +		dev_info(afe->dev, "ret %d\n", ret);
> +
> +	/* make sure all irq status are cleared */
> +	for (i = 0; i < MT8196_IRQ_NUM; ++i) {
> +		regmap_read(afe->regmap, irq_data[i].irq_clr_reg, &tmp_reg);
> +		regmap_update_bits(afe->regmap, irq_data[i].irq_clr_reg,
> +				   AFE_IRQ_CLR_CFG_MASK_SFT | AFE_IRQ_MISS_FLAG_CLR_CFG_MASK_SFT,
> +				   tmp_reg ^ (AFE_IRQ_CLR_CFG_MASK_SFT |
> +				   AFE_IRQ_MISS_FLAG_CLR_CFG_MASK_SFT));
> +	}
> +
> +	/* reset audio 26M request */
> +	regmap_update_bits(afe->regmap,
> +			   AFE_SPM_CONTROL_REQ, 0x1, 0x0);
> +
> +	/* cache only */
> +	regcache_cache_only(afe->regmap, true);
> +	regcache_mark_dirty(afe->regmap);
> +
> +skip_regmap:
> +	mt8196_afe_disable_reg_rw_clk(afe);
> +	return 0;
> +}
> +
> +static int mt8196_afe_runtime_resume(struct device *dev)
> +{
> +	struct mtk_base_afe *afe = dev_get_drvdata(dev);
> +	int ret = 0;
> +
> +	ret = mt8196_afe_enable_reg_rw_clk(afe);
> +	if (ret)
> +		return ret;
> +
> +	if (!afe->regmap) {
> +		dev_warn(afe->dev, "skip regmap\n");
> +		goto skip_regmap;
> +	}
> +	regcache_cache_only(afe->regmap, false);
> +	regcache_sync(afe->regmap);
> +
> +	/* set audio 26M request */
> +	regmap_update_bits(afe->regmap, AFE_SPM_CONTROL_REQ, 0x1, 0x1);
> +	regmap_update_bits(afe->regmap, AFE_CBIP_CFG0, 0x1, 0x1);
> +
> +	/* force cpu use 8_24 format when writing 32bit data */
> +	regmap_update_bits(afe->regmap, AFE_MEMIF_CON0,
> +			   CPU_HD_ALIGN_MASK_SFT, 0 << CPU_HD_ALIGN_SFT);
> +
> +	/* enable AFE */
> +	mt8196_afe_enable_main_clock(afe);
> +
> +skip_regmap:
> +	return 0;
> +}
> +
> +static int mt8196_afe_component_probe(struct snd_soc_component *component)
> +{
> +	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
> +
> +	if (component) {
> +		/* enable clock for regcache get default value from hw */
> +		pm_runtime_get_sync(afe->dev);
> +		mtk_afe_add_sub_dai_control(component);
> +		pm_runtime_put_sync(afe->dev);
> +	}
> +	return 0;
> +}
> +
> +static int mt8196_afe_pcm_open(struct snd_soc_component *component,
> +			       struct snd_pcm_substream *substream)
> +{
> +	/* set the wait_for_avail to 2 sec*/
> +	substream->wait_time = msecs_to_jiffies(2 * 1000);
> +
> +	return 0;
> +}
> +
> +static void mt8196_afe_pcm_free(struct snd_soc_component *component, struct snd_pcm *pcm)
> +{
> +	snd_pcm_lib_preallocate_free_for_all(pcm);
> +}
> +
> +static const struct snd_soc_component_driver mt8196_afe_component = {
> +	.name = AFE_PCM_NAME,
> +	.probe = mt8196_afe_component_probe,
> +	.pcm_construct = mtk_afe_pcm_new,
> +	.pcm_destruct = mt8196_afe_pcm_free,
> +	.open = mt8196_afe_pcm_open,
> +	.pointer = mtk_afe_pcm_pointer,
> +};
> +
> +static int mt8196_dai_memif_register(struct mtk_base_afe *afe)
> +{
> +	struct mtk_base_afe_dai *dai;
> +
> +	dai = devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
> +	if (!dai)
> +		return -ENOMEM;
> +
> +	list_add(&dai->list, &afe->sub_dais);
> +
> +	dai->dai_drivers = mt8196_memif_dai_driver;
> +	dai->num_dai_drivers = ARRAY_SIZE(mt8196_memif_dai_driver);
> +
> +	dai->controls = mt8196_pcm_kcontrols;
> +	dai->num_controls = ARRAY_SIZE(mt8196_pcm_kcontrols);
> +	dai->dapm_widgets = mt8196_memif_widgets;
> +	dai->num_dapm_widgets = ARRAY_SIZE(mt8196_memif_widgets);
> +	dai->dapm_routes = mt8196_memif_routes;
> +	dai->num_dapm_routes = ARRAY_SIZE(mt8196_memif_routes);
> +	return 0;
> +}
> +
> +typedef int (*dai_register_cb)(struct mtk_base_afe *);
> +static const dai_register_cb dai_register_cbs[] = {
> +	mt8196_dai_adda_register,
> +	mt8196_dai_i2s_register,
> +	mt8196_dai_tdm_register,
> +	mt8196_dai_memif_register,
> +};
> +
> +static const struct reg_sequence mt8196_cg_patch[] = {
> +	{ AUDIO_TOP_CON4, 0x361c },
> +};
> +
> +static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
> +{
> +	int ret, i;
> +	unsigned int tmp_reg = 0;

avoid double init.

> +	int irq_id;
> +	struct mtk_base_afe *afe;
> +	struct mt8196_afe_private *afe_priv;
> +	struct device *dev = &pdev->dev;
> +
> +	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(34));
> +	if (ret)
> +		return ret;
> +
> +	ret = of_reserved_mem_device_init(dev);
> +	if (ret)
> +		dev_err(dev, "failed to assign memory region: %d\n", ret);
> +
> +	afe = devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
> +	if (!afe)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, afe);
> +
> +	afe->platform_priv = devm_kzalloc(dev, sizeof(*afe_priv),
> +					  GFP_KERNEL);
> +	if (!afe->platform_priv)
> +		return -ENOMEM;
> +
> +	afe_priv = afe->platform_priv;
> +	afe->dev = dev;
> +
> +	afe->base_addr = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(afe->base_addr))
> +		return dev_err_probe(dev, PTR_ERR(afe->base_addr),
> +				     "AFE base_addr not found\n");
> +
> +	/* init audio related clock */
> +	ret = mt8196_init_clock(afe);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "init clock error.\n");
> +
> +	/* init memif */
> +	/* IPM2.0 no need banding */
> +	afe->memif_32bit_supported = 1;
> +	afe->memif_size = MT8196_MEMIF_NUM;
> +	afe->memif = devm_kcalloc(dev, afe->memif_size, sizeof(*afe->memif),
> +				  GFP_KERNEL);
> +
> +	if (!afe->memif)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < afe->memif_size; i++) {
> +		afe->memif[i].data = &memif_data[i];
> +		afe->memif[i].irq_usage = memif_irq_usage[i];
> +		afe->memif[i].const_irq = 1;
> +	}
> +
> +	mutex_init(&afe->irq_alloc_lock);
> +
> +	/* init irq */
> +	afe->irqs_size = MT8196_IRQ_NUM;
> +	afe->irqs = devm_kcalloc(dev, afe->irqs_size, sizeof(*afe->irqs),
> +				 GFP_KERNEL);
> +
> +	if (!afe->irqs)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < afe->irqs_size; i++)
> +		afe->irqs[i].irq_data = &irq_data[i];
> +
> +	/* request irq */
> +	irq_id = platform_get_irq(pdev, 0);
> +	if (irq_id < 0)
> +		return dev_err_probe(dev, irq_id, "no irq found");
> +
> +	ret = devm_request_irq(dev, irq_id, mt8196_afe_irq_handler,
> +			       IRQF_TRIGGER_NONE,
> +			       "Afe_ISR_Handle", (void *)afe);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "could not request_irq for Afe_ISR_Handle\n");
> +
> +	ret = enable_irq_wake(irq_id);
> +	if (ret < 0)
> +		dev_warn(dev, "enable_irq_wake %d ret: %d\n", irq_id, ret);
> +
> +	/* init sub_dais */
> +	INIT_LIST_HEAD(&afe->sub_dais);
> +
> +	for (i = 0; i < ARRAY_SIZE(dai_register_cbs); i++) {
> +		ret = dai_register_cbs[i](afe);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "dai register i %d fail\n", i);
> +	}
> +
> +	/* init dai_driver and component_driver */
> +	ret = mtk_afe_combine_sub_dai(afe);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "mtk_afe_combine_sub_dai fail\n");
> +
> +	/* others */
> +	afe->mtk_afe_hardware = &mt8196_afe_hardware;
> +	afe->memif_fs = mt8196_memif_fs;
> +	afe->irq_fs = mt8196_irq_fs;
> +	afe->get_dai_fs = mt8196_get_dai_fs;
> +	afe->get_memif_pbuf_size = mt8196_get_memif_pbuf_size;
> +
> +	afe->runtime_resume = mt8196_afe_runtime_resume;
> +	afe->runtime_suspend = mt8196_afe_runtime_suspend;
> +
> +	ret = devm_pm_runtime_enable(dev);
> +	if (ret)
> +		return ret;
> +
> +	/* Audio device is part of genpd.
> +	 * Set audio as syscore device to prevent
> +	 * genpd automatically power off audio
> +	 * device when suspend
> +	 */
> +	dev_pm_syscore_device(dev, true);
> +
> +	/* enable clock for regcache get default value from hw */
> +	pm_runtime_get_sync(dev);
> +
> +	afe->regmap = devm_regmap_init_mmio(dev, afe->base_addr,
> +					    &mt8196_afe_regmap_config);
> +	if (IS_ERR(afe->regmap))
> +		return PTR_ERR(afe->regmap);
> +
> +	ret = regmap_register_patch(afe->regmap, mt8196_cg_patch,
> +				    ARRAY_SIZE(mt8196_cg_patch));
> +	if (ret < 0) {
> +		dev_info(dev, "Failed to apply cg patch\n");
> +		goto err_pm_disable;
> +	}
> +
> +	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
> +	regmap_write(afe->regmap, AFE_IRQ_MCU_EN, 0xffffffff);
> +	regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
> +
> +	pm_runtime_put_sync(dev);
> +
> +	regcache_cache_only(afe->regmap, true);
> +	regcache_mark_dirty(afe->regmap);
> +
> +	/* register component */
> +	ret = devm_snd_soc_register_component(dev,
> +					      &mt8196_afe_component,
> +					      afe->dai_drivers,
> +					      afe->num_dai_drivers);
> +	if (ret) {
> +		dev_warn(dev, "afe component err\n");
> +		goto err_pm_disable;
> +	}
> +
> +	return 0;
> +
> +err_pm_disable:
> +	pm_runtime_disable(dev);
> +	return ret;
> +}
> +
> +static void mt8196_afe_pcm_dev_remove(struct platform_device *pdev)
> +{
> +	struct mtk_base_afe *afe = platform_get_drvdata(pdev);
> +	struct device *dev = &pdev->dev;
> +
> +	pm_runtime_disable(dev);
> +	if (!pm_runtime_status_suspended(dev))
> +		mt8196_afe_runtime_suspend(dev);
> +
> +	/* disable afe clock */
> +	mt8196_afe_disable_reg_rw_clk(afe);
> +	mt8196_afe_disable_main_clock(afe);
> +}
> +
> +static const struct of_device_id mt8196_afe_pcm_dt_match[] = {
> +	{ .compatible = "mediatek,mt8196-afe", },
> +	{},

  { /* sentinel */ }

> +};
> +MODULE_DEVICE_TABLE(of, mt8196_afe_pcm_dt_match);
> +

Regards,
Angelo


