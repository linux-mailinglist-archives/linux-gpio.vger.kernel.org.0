Return-Path: <linux-gpio+bounces-18946-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EE1A8B7E4
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 13:52:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9D3604429C8
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Apr 2025 11:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 383F324169C;
	Wed, 16 Apr 2025 11:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hEOlciUf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0294323C8B6
	for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 11:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744804313; cv=none; b=R1VVzeLY7V5Gx8qF2fZRTeCwYd85zSwzUR6HODXIv5vb6yd67ediIBVaigihC3wHSrKZ2/uJYtBia8SpODP/0U5t2yeUOGhEiu7VnSWWaE+1qenA41oz2HjaqLr2+MdU85Y/M1wbVNMbE0q4iGaV75+EPr3h6O/5XAiEhbjiK48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744804313; c=relaxed/simple;
	bh=EVNFSeKW2Qx+N+e8XFyUkerLEmCyh5k8jXWhG1884Wo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RjXqC6hzMAqAdxnbvXCcnnKUA1q+Jd4wq42TuO8pGXd2X5RYQvfnVIWU5plSUEmlvujTk+d77KQLmIeDeOLizBxKaUZk5+Q4GfVLxVhFAMBQJC57kBUr0xzZcVwkzqQh/5hwB8/cqHc5GvtbBHUqTEWpugcsu4J6Id7H9ulZJNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hEOlciUf; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30beedb99c9so58944401fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 16 Apr 2025 04:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744804306; x=1745409106; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IN9oVWw2THGH4XxDg3MRszFkbozgPLFV1uHjTl1OHio=;
        b=hEOlciUfOyvwFM0NQ/ntch9J89saRu96N6NgKkOnuh7HFrxZjwYmByQ67VrBz53STl
         9HnI7Iopx7083QkUEpI/a0H0BrvXSYWQ6pkevmLJxRKnnUBhdjKoXdRrw/HkyeI3+LL6
         sLL4NpWwytnn9/nHRCC+6MAdeFL1+lG6IBQV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744804306; x=1745409106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IN9oVWw2THGH4XxDg3MRszFkbozgPLFV1uHjTl1OHio=;
        b=DK6/49NuHPfEBP9x/W5hxqpNXwJWjtxfRK13ZteocR5+ySi9prfYMnFpwOwllC1Na1
         UXKBxDbVv+efrB+Hu7Z3Ja/G6G8Dtf3wD8G7IWa7CSuj64egrG8JkwJ7qCRYuXQxmQKc
         d5iTwfQtrTtJKfmgP571yoxdGYfcy35BwVH1vd0UexTOKH+VcwGDEutrFRmUs+8dnBFH
         gplXdAjQBTOCJdUmZ7Clrcj4xMvdXNJYEgLM0L9Jl06V/Wic6CeWTAZczMPETOhiXiqn
         /O5JwS9+IzVhMridRrwcCUt4jFYbNesoUQoBYRXFzvcKXtWVlLZjd65MKNm6uwFypPJq
         +kPg==
X-Forwarded-Encrypted: i=1; AJvYcCVqCYdllevPsBoE+MH7IhZ8XMeSFLU0Pa0MZhwEn28OHmAoRGzF1UV/S5XQnb4eOcdBHVUONFZ5o/PD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6HFbEZeVk3j4/oIlpLbF6LklLN9jBHxN6WfEbZ62+zjfyJQZw
	7D/qSK41rw7P1nZ5cMJaIKQvGkf4iJfc15H2+9J4aQpyq4tEDFAdUtOR8QQyEPFe3kpHXAwQGUw
	iPB9b3Z9Vl6xSJeWrbVOqPeuB9iqMrEYcT80R
X-Gm-Gg: ASbGncvVij05h0vPqlLFIAdwtCkkASO2R/JEXokCYy/csLICp1eS5Q4MY9P/x4Hqzdb
	CsI2AIRGpAoyG0tTot4FWw3HifPqTeZoVSVmp4WJ2wXjXQDs+goSFsvRqOCk1h0JbKIvtTVpIdk
	7IxhO35sIzawiXlE+TUOcGzLNq+P5s7leHlsJN1QqQwKdCFralNA==
X-Google-Smtp-Source: AGHT+IFWxEE4cmwXkxDykJf+MZ2M0rvSiqfkBpgar++Udf5FK/Yy++oQZ4MEBTzlLq0tj4/EU8m2bxiHEOUuSwzEM2c=
X-Received: by 2002:a05:651c:146b:b0:30b:d0d5:1fee with SMTP id
 38308e7fff4ca-3107f5a505dmr5597041fa.0.1744804305657; Wed, 16 Apr 2025
 04:51:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407120708.26495-1-darren.ye@mediatek.com> <20250407120708.26495-9-darren.ye@mediatek.com>
In-Reply-To: <20250407120708.26495-9-darren.ye@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 16 Apr 2025 19:51:33 +0800
X-Gm-Features: ATxdqUG02_MjMBJ9plRPOJoNQj-pukcD3shIcHJOuAmwmLyzj1pb9F38mipCPrg
Message-ID: <CAGXv+5G_8gQKMt4aok3sPyD_zvQ1awcaEqH-kJD=HpA2qAFBMA@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] ASoC: mediatek: mt8196: add platform driver
To: "Darren.Ye" <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 7, 2025 at 8:37=E2=80=AFPM Darren.Ye <darren.ye@mediatek.com> w=
rote:
>
> From: Darren Ye <darren.ye@mediatek.com>
>
> Add mt8196 platform driver.
>
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> ---
>  sound/soc/mediatek/Kconfig                 |   10 +
>  sound/soc/mediatek/Makefile                |    1 +
>  sound/soc/mediatek/mt8196/Makefile         |   14 +
>  sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 5070 ++++++++++++++++++++
>  4 files changed, 5095 insertions(+)
>  create mode 100644 sound/soc/mediatek/mt8196/Makefile
>  create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
>
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index 3033e2d3fe16..606f221e238c 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -204,6 +204,16 @@ config SND_SOC_MT8186_MT6366
>           Select Y if you have such device.
>           If unsure select "N".
>
> +config SND_SOC_MT8196
> +       tristate "ASoC support for Mediatek MT8196 chip"
> +       depends on ARCH_MEDIATEK
> +       select SND_SOC_MEDIATEK
> +       help
> +         This adds ASoC driver for Mediatek MT8196 boards
> +         that can be used with other codecs.
> +         Select Y if you have such device.
> +         If unsure select "N".
> +
>  config SND_SOC_MTK_BTCVSD
>         tristate "ALSA BT SCO CVSD/MSBC Driver"
>         help
> diff --git a/sound/soc/mediatek/Makefile b/sound/soc/mediatek/Makefile
> index 4b55434f2168..11d7c484a5d3 100644
> --- a/sound/soc/mediatek/Makefile
> +++ b/sound/soc/mediatek/Makefile
> @@ -10,3 +10,4 @@ obj-$(CONFIG_SND_SOC_MT8188) +=3D mt8188/
>  obj-$(CONFIG_SND_SOC_MT8192) +=3D mt8192/
>  obj-$(CONFIG_SND_SOC_MT8195) +=3D mt8195/
>  obj-$(CONFIG_SND_SOC_MT8365) +=3D mt8365/
> +obj-$(CONFIG_SND_SOC_MT8196) +=3D mt8196/
> diff --git a/sound/soc/mediatek/mt8196/Makefile b/sound/soc/mediatek/mt81=
96/Makefile
> new file mode 100644
> index 000000000000..9bcc09a9a94d
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8196/Makefile
> @@ -0,0 +1,14 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +# common include path
> +subdir-ccflags-y +=3D -I$(srctree)/sound/soc/mediatek/common
> +
> +# platform driver
> +obj-$(CONFIG_SND_SOC_MT8196) +=3D snd-soc-mt8196-afe.o
> +snd-soc-mt8196-afe-objs +=3D \
> +       mt8196-afe-pcm.o \
> +       mt8196-afe-clk.o \
> +       mt8196-dai-adda.o \
> +       mt8196-dai-i2s.o \
> +       mt8196-dai-tdm.o
> +
> diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c b/sound/soc/media=
tek/mt8196/mt8196-afe-pcm.c
> new file mode 100644
> index 000000000000..84ccbc7419c7
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
> @@ -0,0 +1,5070 @@
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
> +#include "mt8196-afe-common.h"
> +#include "mtk-afe-platform-driver.h"
> +#include "mtk-afe-fe-dai.h"
> +#include "mt8196-afe-clk.h"
> +#include "mt8196-interconnection.h"
> +
> +static const struct snd_pcm_hardware mt8196_afe_hardware =3D {
> +       .info =3D (SNDRV_PCM_INFO_MMAP |
> +                SNDRV_PCM_INFO_NO_PERIOD_WAKEUP |
> +                SNDRV_PCM_INFO_INTERLEAVED |
> +                SNDRV_PCM_INFO_MMAP_VALID),
> +       .formats =3D (SNDRV_PCM_FMTBIT_S16_LE |
> +                   SNDRV_PCM_FMTBIT_S24_LE |
> +                   SNDRV_PCM_FMTBIT_S32_LE),
> +       .period_bytes_min =3D 96,
> +       .period_bytes_max =3D 4 * 48 * 1024,
> +       .periods_min =3D 2,
> +       .periods_max =3D 256,
> +       .buffer_bytes_max =3D 256 * 1024,
> +       .fifo_size =3D 0,
> +};
> +
> +static unsigned int mt8196_rate_transform(struct device *dev,
> +                                         unsigned int rate)
> +{
> +       switch (rate) {
> +       case 8000:
> +               return MTK_AFE_IPM2P0_RATE_8K;
> +       case 11025:
> +               return MTK_AFE_IPM2P0_RATE_11K;
> +       case 12000:
> +               return MTK_AFE_IPM2P0_RATE_12K;
> +       case 16000:
> +               return MTK_AFE_IPM2P0_RATE_16K;
> +       case 22050:
> +               return MTK_AFE_IPM2P0_RATE_22K;
> +       case 24000:
> +               return MTK_AFE_IPM2P0_RATE_24K;
> +       case 32000:
> +               return MTK_AFE_IPM2P0_RATE_32K;
> +       case 44100:
> +               return MTK_AFE_IPM2P0_RATE_44K;
> +       case 48000:
> +               return MTK_AFE_IPM2P0_RATE_48K;
> +       case 88200:
> +               return MTK_AFE_IPM2P0_RATE_88K;
> +       case 96000:
> +               return MTK_AFE_IPM2P0_RATE_96K;
> +       case 176400:
> +               return MTK_AFE_IPM2P0_RATE_176K;
> +       case 192000:
> +               return MTK_AFE_IPM2P0_RATE_192K;
> +       /* not support 260K */
> +       case 352800:
> +               return MTK_AFE_IPM2P0_RATE_352K;
> +       case 384000:
> +               return MTK_AFE_IPM2P0_RATE_384K;
> +       default:
> +               dev_info(dev, "rate %u invalid, use %d!!!\n",
> +                        rate, MTK_AFE_IPM2P0_RATE_48K);
> +               return MTK_AFE_IPM2P0_RATE_48K;
> +       }
> +}
> +
> +static void mt8196_set_cm_rate(struct mtk_base_afe *afe, int id, unsigne=
d int rate)
> +{
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +
> +       afe_priv->cm_rate[id] =3D rate;
> +}
> +
> +static int mt8196_convert_cm_ch(unsigned int ch)
> +{
> +       return ch - 1;
> +}
> +
> +static unsigned int calculate_cm_update(int rate, int ch)
> +{
> +       unsigned int update_val;
> +
> +       update_val =3D 26000000 / rate / (ch / 2);
> +       update_val =3D update_val * 10 / 7;
> +       if (update_val > 100)
> +               update_val =3D 100;
> +       if (update_val < 7)
> +               update_val =3D 7;
> +
> +       return update_val;
> +}
> +
> +static int mt8196_set_cm(struct mtk_base_afe *afe, int id,
> +                        bool update, bool swap, unsigned int ch)
> +{
> +       unsigned int rate =3D 0;
> +       unsigned int update_val =3D 0;
> +       int reg;
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +
> +       dev_dbg(afe->dev, "CM%d, rate %d, update %d, swap %d, ch %d\n",
> +               id, rate, update, swap, ch);
> +
> +       rate =3D afe_priv->cm_rate[id];
> +       update_val =3D update ? calculate_cm_update(rate, (int)ch) : 0x64=
;
> +
> +       reg =3D AFE_CM0_CON0 + 0x10 * id;
> +       /* update cnt */
> +       regmap_update_bits(afe->regmap,
> +                          reg,
> +                          AFE_CM_UPDATE_CNT_MASK << AFE_CM_UPDATE_CNT_SF=
T,
> +                          update_val << AFE_CM_UPDATE_CNT_SFT);
> +
> +       /* rate */
> +       regmap_update_bits(afe->regmap,
> +                          reg,
> +                          AFE_CM_1X_EN_SEL_FS_MASK << AFE_CM_1X_EN_SEL_F=
S_SFT,
> +                          rate << AFE_CM_1X_EN_SEL_FS_SFT);
> +
> +       /* ch num */
> +       ch =3D mt8196_convert_cm_ch(ch);
> +       regmap_update_bits(afe->regmap,
> +                          reg,
> +                          AFE_CM_CH_NUM_MASK << AFE_CM_CH_NUM_SFT,
> +                          ch << AFE_CM_CH_NUM_SFT);
> +
> +       /* swap */
> +       regmap_update_bits(afe->regmap,
> +                          reg,
> +                          AFE_CM_BYTE_SWAP_MASK << AFE_CM_BYTE_SWAP_SFT,
> +                          swap << AFE_CM_BYTE_SWAP_SFT);
> +
> +       return 0;
> +}
> +
> +static int mt8196_enable_cm_bypass(struct mtk_base_afe *afe, int id, boo=
l en)
> +{
> +       int reg =3D AFE_CM0_CON0 + 0x10 * id;
> +
> +       regmap_update_bits(afe->regmap,
> +                          reg,
> +                          AFE_CM_BYPASS_MODE_MASK << AFE_CM_BYPASS_MODE_=
SFT,
> +                          en << AFE_CM_BYPASS_MODE_SFT);
> +
> +       return 0;
> +}
> +
> +static int mt8196_fe_startup(struct snd_pcm_substream *substream,
> +                            struct snd_soc_dai *dai)
> +{
> +       struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(subs=
tream);
> +       struct mtk_base_afe *afe =3D snd_soc_dai_get_drvdata(dai);
> +       struct snd_pcm_runtime *runtime =3D substream->runtime;
> +       struct snd_soc_dai *cpu_dai =3D snd_soc_rtd_to_cpu(rtd, 0);
> +       int memif_num =3D cpu_dai->id;
> +       struct mtk_base_afe_memif *memif =3D &afe->memif[memif_num];
> +       const struct snd_pcm_hardware *mtk_afe_hardware =3D afe->mtk_afe_=
hardware;
> +       int ret;
> +
> +       dev_dbg(afe->dev, "memif_num: %d.\n", memif_num);
> +
> +       memif->substream =3D substream;
> +
> +       snd_pcm_hw_constraint_step(substream->runtime, 0,
> +                                  SNDRV_PCM_HW_PARAM_BUFFER_BYTES, 16);
> +
> +       snd_soc_set_runtime_hwparams(substream, mtk_afe_hardware);
> +
> +       ret =3D snd_pcm_hw_constraint_integer(runtime,
> +                                           SNDRV_PCM_HW_PARAM_PERIODS);
> +       if (ret < 0)
> +               dev_info(afe->dev, "snd_pcm_hw_constraint_integer failed\=
n");
> +
> +       /* dynamic allocate irq to memif */
> +       if (memif->irq_usage < 0) {
> +               int irq_id =3D mtk_dynamic_irq_acquire(afe);
> +
> +               if (irq_id !=3D afe->irqs_size) {
> +                       /* link */
> +                       memif->irq_usage =3D irq_id;
> +               } else {
> +                       dev_err(afe->dev, "no more asys irq\n");
> +                       ret =3D -EBUSY;
> +               }
> +       }
> +       return ret;
> +}
> +
> +static void mt8196_fe_shutdown(struct snd_pcm_substream *substream,
> +                              struct snd_soc_dai *dai)
> +{
> +       struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(subs=
tream);
> +       struct mtk_base_afe *afe =3D snd_soc_dai_get_drvdata(dai);
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       struct snd_soc_dai *cpu_dai =3D snd_soc_rtd_to_cpu(rtd, 0);
> +       int memif_num =3D cpu_dai->id;
> +       struct mtk_base_afe_memif *memif =3D &afe->memif[memif_num];
> +       int irq_id =3D memif->irq_usage;
> +
> +       dev_dbg(afe->dev, "memif_num: %d.\n", memif_num);
> +
> +       memif->substream =3D NULL;
> +       afe_priv->irq_cnt[memif_num] =3D 0;
> +       afe_priv->xrun_assert[memif_num] =3D 0;
> +
> +       if (!memif->const_irq) {
> +               mtk_dynamic_irq_release(afe, irq_id);
> +               memif->irq_usage =3D -1;
> +               memif->substream =3D NULL;
> +       }
> +}
> +
> +static int mt8196_fe_hw_params(struct snd_pcm_substream *substream,
> +                              struct snd_pcm_hw_params *params,
> +                              struct snd_soc_dai *dai)
> +{
> +       struct mtk_base_afe *afe =3D snd_soc_dai_get_drvdata(dai);
> +       unsigned int channels =3D params_channels(params);
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +
> +       afe_priv->cm_channels =3D channels;
> +
> +       return mtk_afe_fe_hw_params(substream, params, dai);
> +}
> +
> +static int mt8196_fe_trigger(struct snd_pcm_substream *substream, int cm=
d,
> +                            struct snd_soc_dai *dai)
> +{
> +       struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(subs=
tream);
> +       struct snd_pcm_runtime *const runtime =3D substream->runtime;
> +       struct mtk_base_afe *afe =3D snd_soc_dai_get_drvdata(dai);
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       struct snd_soc_dai *cpu_dai =3D snd_soc_rtd_to_cpu(rtd, 0);
> +       int id =3D cpu_dai->id;
> +       struct mtk_base_afe_memif *memif =3D &afe->memif[id];
> +       int irq_id =3D memif->irq_usage;
> +       struct mtk_base_afe_irq *irqs =3D &afe->irqs[irq_id];
> +       const struct mtk_base_irq_data *irq_data =3D irqs->irq_data;
> +       unsigned int counter =3D runtime->period_size;
> +       unsigned int rate =3D runtime->rate;
> +       int fs;
> +       int ret =3D 0;
> +       unsigned int tmp_reg =3D 0;
> +
> +       dev_info(afe->dev, "%s cmd %d, irq_id %d\n",
> +                memif->data->name, cmd, irq_id);
> +
> +       switch (cmd) {
> +       case SNDRV_PCM_TRIGGER_START:
> +       case SNDRV_PCM_TRIGGER_RESUME:
> +               dev_dbg(afe->dev, "%s cmd %d, id %d\n",
> +                       memif->data->name, cmd, id);
> +               ret =3D mtk_memif_set_enable(afe, id);
> +               if (ret) {
> +                       dev_err(afe->dev, "id %d, memif enable fail.\n", =
id);
> +                       return ret;
> +               }
> +
> +               /*
> +                * for small latency record
> +                * ul memif need read some data before irq enable
> +                */
> +               if (substream->stream =3D=3D SNDRV_PCM_STREAM_CAPTURE) {
> +                       if ((runtime->period_size * 1000) / rate <=3D 10)
> +                               usleep_range(300, 350);
> +               }
> +
> +               /* set irq counter */
> +               if (afe_priv->irq_cnt[id] > 0)
> +                       counter =3D afe_priv->irq_cnt[id];
> +
> +               regmap_update_bits(afe->regmap,
> +                                  irq_data->irq_cnt_reg,
> +                                  irq_data->irq_cnt_maskbit << irq_data-=
>irq_cnt_shift,
> +                                  counter << irq_data->irq_cnt_shift);
> +
> +               /* set irq fs */
> +               fs =3D afe->irq_fs(substream, runtime->rate);
> +               if (fs < 0)
> +                       return -EINVAL;
> +
> +               if (irq_data->irq_fs_reg >=3D 0)
> +                       regmap_update_bits(afe->regmap,
> +                                          irq_data->irq_fs_reg,
> +                                          irq_data->irq_fs_maskbit << ir=
q_data->irq_fs_shift,
> +                                          fs << irq_data->irq_fs_shift);
> +
> +               /* enable interrupt */
> +               regmap_update_bits(afe->regmap,
> +                                  irq_data->irq_en_reg,
> +                                  1 << irq_data->irq_en_shift,
> +                                  1 << irq_data->irq_en_shift);
> +
> +               return 0;
> +       case SNDRV_PCM_TRIGGER_STOP:
> +       case SNDRV_PCM_TRIGGER_SUSPEND:
> +               ret =3D mtk_memif_set_disable(afe, id);
> +               if (ret) {
> +                       dev_warn(afe->dev,
> +                                "id %d, memif disable fail\n", id);
> +               }
> +
> +               /* disable interrupt */
> +               regmap_update_bits(afe->regmap,
> +                                  irq_data->irq_en_reg,
> +                                  1 << irq_data->irq_en_shift,
> +                                  0 << irq_data->irq_en_shift);
> +
> +               /* clear pending IRQ */
> +               regmap_read(afe->regmap, irq_data->irq_clr_reg, &tmp_reg)=
;
> +               regmap_update_bits(afe->regmap, irq_data->irq_clr_reg,
> +                                  AFE_IRQ_CLR_CFG_MASK_SFT | AFE_IRQ_MIS=
S_FLAG_CLR_CFG_MASK_SFT,
> +                                  tmp_reg ^ (AFE_IRQ_CLR_CFG_MASK_SFT |
> +                                  AFE_IRQ_MISS_FLAG_CLR_CFG_MASK_SFT));
> +
> +               return ret;
> +       default:
> +               return -EINVAL;
> +       }
> +}
> +
> +static int mt8196_memif_fs(struct snd_pcm_substream *substream,
> +                          unsigned int rate)
> +{
> +       struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(subs=
tream);
> +       struct snd_soc_component *component =3D
> +               snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
> +       struct mtk_base_afe *afe =3D NULL;
> +       struct snd_soc_dai *cpu_dai =3D snd_soc_rtd_to_cpu(rtd, 0);
> +       int id =3D cpu_dai->id;
> +       unsigned int rate_reg =3D 0;
> +       int cm =3D 0;
> +
> +       if (!component)
> +               return -EINVAL;
> +
> +       afe =3D snd_soc_component_get_drvdata(component);
> +
> +       if (!afe)
> +               return -EINVAL;
> +
> +       rate_reg =3D mt8196_rate_transform(afe->dev, rate);
> +
> +       switch (id) {
> +       case MT8196_MEMIF_VUL8:
> +       case MT8196_MEMIF_VUL_CM0:
> +               cm =3D CM0;
> +               break;
> +       case MT8196_MEMIF_VUL9:
> +       case MT8196_MEMIF_VUL_CM1:
> +               cm =3D CM1;
> +               break;
> +       case MT8196_MEMIF_VUL10:
> +       case MT8196_MEMIF_VUL_CM2:
> +               cm =3D CM2;
> +               break;
> +       default:
> +               cm =3D CM0;
> +               break;
> +       }
> +
> +       mt8196_set_cm_rate(afe, cm, rate_reg);
> +
> +       return rate_reg;
> +}
> +
> +static int mt8196_get_dai_fs(struct mtk_base_afe *afe,
> +                            int dai_id, unsigned int rate)
> +{
> +       return mt8196_rate_transform(afe->dev, rate);
> +}
> +
> +static int mt8196_irq_fs(struct snd_pcm_substream *substream, unsigned i=
nt rate)
> +{
> +       struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(subs=
tream);
> +       struct snd_soc_component *component =3D
> +               snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
> +       struct mtk_base_afe *afe =3D NULL;
> +
> +       if (!component)
> +               return -EINVAL;
> +       afe =3D snd_soc_component_get_drvdata(component);
> +       return mt8196_rate_transform(afe->dev, rate);
> +}
> +
> +static int mt8196_get_memif_pbuf_size(struct snd_pcm_substream *substrea=
m)
> +{
> +       struct snd_pcm_runtime *runtime =3D substream->runtime;
> +
> +       if ((runtime->period_size * 1000) / runtime->rate > 10)
> +               return MT8196_MEMIF_PBUF_SIZE_256_BYTES;
> +       else
> +               return MT8196_MEMIF_PBUF_SIZE_32_BYTES;
> +}
> +
> +/* FE DAIs */
> +static const struct snd_soc_dai_ops mt8196_memif_dai_ops =3D {
> +       .startup        =3D mt8196_fe_startup,
> +       .shutdown       =3D mt8196_fe_shutdown,
> +       .hw_params      =3D mt8196_fe_hw_params,
> +       .hw_free        =3D mtk_afe_fe_hw_free,
> +       .prepare        =3D mtk_afe_fe_prepare,
> +       .trigger        =3D mt8196_fe_trigger,
> +};
> +
> +#define MTK_PCM_RATES (SNDRV_PCM_RATE_8000_48000 |\
> +                      SNDRV_PCM_RATE_88200 |\
> +                      SNDRV_PCM_RATE_96000 |\
> +                      SNDRV_PCM_RATE_176400 |\
> +                      SNDRV_PCM_RATE_192000)
> +
> +#define MTK_PCM_DAI_RATES (SNDRV_PCM_RATE_8000 |\
> +                          SNDRV_PCM_RATE_16000 |\
> +                          SNDRV_PCM_RATE_32000 |\
> +                          SNDRV_PCM_RATE_48000)
> +
> +#define MTK_PCM_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
> +                        SNDRV_PCM_FMTBIT_S24_LE |\
> +                        SNDRV_PCM_FMTBIT_S32_LE)
> +

The following section is very repetitive and takes up a lot of space.
Please wrap things in a macro such as:

#define MT8196_FE_DAI_PLAYBACK(name, id, max_ch) \
    { \
        .name =3D name, \
        .id =3D id, \
        .playback =3D { \
            .stream_name =3D name, \
            .channels_min =3D 1, \
            .channels_max =3D max_ch, \
            .rates =3D MTK_PCM_RATES, \
            .formats =3D MTK_PCM_FORMATS, \
        }, \
        .ops =3D &mt8196_memif_dai_ops, \
    }

#define MT8196_FE_DAI_CAPTURE(name, id, max_ch) \
    { \
        .name =3D name, \
        .id =3D id, \
        .capture =3D { \
            .stream_name =3D name, \
            .channels_min =3D 1, \
            .channels_max =3D max_ch, \
            .rates =3D MTK_PCM_RATES, \
            .formats =3D MTK_PCM_FORMATS, \
        }, \
        .ops =3D &mt8196_memif_dai_ops, \
    }



And the list can be considerably shortened:

    static struct snd_soc_dai_driver mt8196_memif_dai_driver[] =3D {
        /* FE DAIs: memory intefaces to CPU */
        MT8196_FE_DAI_PLAYBACK("DL0", MT8196_MEMIF_DL0, 2),
        MT8196_FE_DAI_PLAYBACK("DL1", MT8196_MEMIF_DL1, 2),
        ...
        MT8196_FE_DAI_CAPTURE("UL0", MT8196_MEMIF_UL0, 2),
        ...
    };

...
> +
> +static const struct snd_kcontrol_new mt8196_pcm_kcontrols[] =3D {
> +};
> +
> +enum {
> +       CM0_MUX_VUL8_2CH,
> +       CM0_MUX_VUL8_8CH,
> +       CM0_MUX_MASK,
> +};
> +
> +enum {
> +       CM1_MUX_VUL9_2CH,
> +       CM1_MUX_VUL9_16CH,
> +       CM1_MUX_MASK,
> +};
> +
> +enum {
> +       CM2_MUX_VUL10_2CH,
> +       CM2_MUX_VUL10_32CH,
> +       CM2_MUX_MASK,
> +};
> +
> +static int ul_cm0_event(struct snd_soc_dapm_widget *w,
> +                       struct snd_kcontrol *kcontrol,
> +                       int event)
> +{
> +       struct snd_soc_component *cmpnt =3D snd_soc_dapm_to_component(w->=
dapm);
> +       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(cmpnt)=
;
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       unsigned int channels =3D afe_priv->cm_channels;
> +
> +       dev_dbg(afe->dev, "event 0x%x, name %s, channels %u\n",
> +               event, w->name, channels);
> +
> +       switch (event) {
> +       case SND_SOC_DAPM_PRE_PMU:
> +               mt8196_enable_cm_bypass(afe, CM0, 0x0);
> +               mt8196_set_cm(afe, CM0, true, false, channels);
> +               break;
> +       case SND_SOC_DAPM_PRE_PMD:
> +               mt8196_enable_cm_bypass(afe, CM0, 0x1);
> +               break;
> +       default:
> +               break;
> +       }
> +       return 0;
> +}
> +
> +static int ul_cm1_event(struct snd_soc_dapm_widget *w,
> +                       struct snd_kcontrol *kcontrol,
> +                       int event)
> +{
> +       struct snd_soc_component *cmpnt =3D snd_soc_dapm_to_component(w->=
dapm);
> +       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(cmpnt)=
;
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       unsigned int channels =3D afe_priv->cm_channels;
> +
> +       dev_dbg(afe->dev, "event 0x%x, name %s, channels %u\n",
> +               event, w->name, channels);
> +
> +       switch (event) {
> +       case SND_SOC_DAPM_PRE_PMU:
> +               mt8196_enable_cm_bypass(afe, CM1, 0x0);
> +               mt8196_set_cm(afe, CM1, true, false, channels);
> +               break;
> +       case SND_SOC_DAPM_PRE_PMD:
> +               mt8196_enable_cm_bypass(afe, CM1, 0x1);
> +               break;
> +       default:
> +               break;
> +       }
> +       return 0;
> +}
> +
> +static int ul_cm2_event(struct snd_soc_dapm_widget *w,
> +                       struct snd_kcontrol *kcontrol,
> +                       int event)
> +{
> +       struct snd_soc_component *cmpnt =3D snd_soc_dapm_to_component(w->=
dapm);
> +       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(cmpnt)=
;
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       unsigned int channels =3D afe_priv->cm_channels;
> +
> +       dev_dbg(afe->dev, "event 0x%x, name %s, channels %u\n",
> +               event, w->name, channels);
> +
> +       switch (event) {
> +       case SND_SOC_DAPM_PRE_PMU:
> +               mt8196_enable_cm_bypass(afe, CM2, 0x0);
> +               mt8196_set_cm(afe, CM2, true, false, channels);
> +               break;
> +       case SND_SOC_DAPM_PRE_PMD:
> +               mt8196_enable_cm_bypass(afe, CM2, 0x1);
> +               break;
> +       default:
> +               break;
> +       }
> +       return 0;
> +}
> +
> +/* dma widget & routes*/
> +static const struct snd_kcontrol_new memif_ul0_ch1_mix[] =3D {
> +       /* Normal record */
> +       SOC_DAPM_SINGLE_AUTODISABLE("ADDA_UL_CH1", AFE_CONN018_0,
> +                                   I_ADDA_UL_CH1, 1, 0),

Kcontrol names for mixer switches should have the suffix "Switch".

And since this is for capture (recording) only, it should have "Capture"
in the name as well. Conversely, for playback only controls, it should
contain the "Playback" keyword. If the kcontrol applies to both paths
the keyword shall be left out. For example a switch for a microphone
input could be considered to apply to both paths since in many designs
the microphone could also be routed to the output mixer.

So this should be named "ADDA_UL_CH1 Capture Switch". And since this
group of kcontrols feed a capture interface, all of them should be
named "XXX Capture Switch". This applies to all the memif_ulXXX_mix
lists.

This allows the ALSA userspace libraries to properly parse and
group controls for the "simple mixer" interface.

[...]

> +static const char * const cm0_mux_map[] =3D {
> +       "CM0_8CH_PATH",
> +       "CM0_2CH_PATH",
> +};

This is misleading. The register definition says that this selects VUL_2CH_=
8
input from "O34, O35" or "CM0". So it should probably say "Mixer" and "CM0"=
.

> +
> +static const char * const cm1_mux_map[] =3D {
> +       "CM1_16CH_PATH",
> +       "CM1_2CH_PATH",
> +};
> +
> +static const char * const cm2_mux_map[] =3D {
> +       "CM2_32CH_PATH",
> +       "CM2_2CH_PATH",
> +};
> +
> +static int cm0_mux_map_value[] =3D {
> +       CM0_MUX_VUL8_8CH,
> +       CM0_MUX_VUL8_2CH,
> +};
> +
> +static int cm1_mux_map_value[] =3D {
> +       CM1_MUX_VUL9_16CH,
> +       CM1_MUX_VUL9_2CH,
> +};
> +
> +static int cm2_mux_map_value[] =3D {
> +       CM2_MUX_VUL10_32CH,
> +       CM2_MUX_VUL10_2CH,
> +};
> +
> +static SOC_VALUE_ENUM_SINGLE_DECL(ul_cm0_mux_map_enum,
> +                                 AFE_CM0_CON0,
> +                                 AFE_CM0_OUTPUT_MUX_SFT,
> +                                 AFE_CM0_OUTPUT_MUX_MASK,
> +                                 cm0_mux_map,
> +                                 cm0_mux_map_value);
> +static SOC_VALUE_ENUM_SINGLE_DECL(ul_cm1_mux_map_enum,
> +                                 AFE_CM1_CON0,
> +                                 AFE_CM1_OUTPUT_MUX_SFT,
> +                                 AFE_CM1_OUTPUT_MUX_MASK,
> +                                 cm1_mux_map,
> +                                 cm1_mux_map_value);
> +static SOC_VALUE_ENUM_SINGLE_DECL(ul_cm2_mux_map_enum,
> +                                 AFE_CM2_CON0,
> +                                 AFE_CM2_OUTPUT_MUX_SFT,
> +                                 AFE_CM2_OUTPUT_MUX_MASK,
> +                                 cm2_mux_map,
> +                                 cm2_mux_map_value);
> +
> +static const struct snd_kcontrol_new ul_cm0_mux_control =3D
> +       SOC_DAPM_ENUM("CM0_UL_MUX Select", ul_cm0_mux_map_enum);
> +static const struct snd_kcontrol_new ul_cm1_mux_control =3D
> +       SOC_DAPM_ENUM("CM1_UL_MUX Select", ul_cm1_mux_map_enum);
> +static const struct snd_kcontrol_new ul_cm2_mux_control =3D
> +       SOC_DAPM_ENUM("CM2_UL_MUX Select", ul_cm2_mux_map_enum);

Again this is misleading. This is selecting the input for VUL_2CH_8~10.

Muxes shall be named "xxx Route", not "xxx Select".

And the same rule applies for capture or playback specific controls.

So this should likely be named "VUL_2CH_x Source Capture Route".

> +static const struct snd_soc_dapm_widget mt8196_memif_widgets[] =3D {
> +       /* inter-connections */
> +       SND_SOC_DAPM_MIXER("UL0_CH1", SND_SOC_NOPM, 0, 0,
> +                          memif_ul0_ch1_mix, ARRAY_SIZE(memif_ul0_ch1_mi=
x)),

Please consider adding "Mixer" to the name of MIXER widgets. It helps
differentiate them from other widgets, especially in this case where
there is also ULn widgets for the actual DAIs.

> +       SND_SOC_DAPM_MIXER("UL0_CH2", SND_SOC_NOPM, 0, 0,
> +                          memif_ul0_ch2_mix, ARRAY_SIZE(memif_ul0_ch2_mi=
x)),

FYI the DAPM framework supports "stereo" or 2-channel widgets and kcontrols=
.
Please consider using them to reduce the number of widgets and kcontrols.
You can use this feature at least for the all UL or capture interfaces,
which AFAICT are all 2 channel only.

[...]

> +       SND_SOC_DAPM_MUX_E("CM0_UL_MUX", SND_SOC_NOPM, 0, 0,
> +                          &ul_cm0_mux_control,
> +                          ul_cm0_event,
> +                          SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_PRE_PMD),

Why does this CM mux have an event, but the other two don't? Plus
there are already CM supply widgets that have event callbacks tied to
them, so this one shouldn't need the event callback either?

[...]

> +       SND_SOC_DAPM_MUX("CM1_UL_MUX", SND_SOC_NOPM, 0, 0,
> +                        &ul_cm1_mux_control),

[...]

> +       SND_SOC_DAPM_MUX("CM2_UL_MUX", SND_SOC_NOPM, 0, 0,
> +                        &ul_cm2_mux_control),
> +
> +       SND_SOC_DAPM_SUPPLY("CM0_Enable",
> +                           AFE_CM0_CON0, AFE_CM0_ON_SFT, 0,
> +                           ul_cm0_event,
> +                           SND_SOC_DAPM_PRE_PMU |
> +                           SND_SOC_DAPM_PRE_PMD),
> +
> +       SND_SOC_DAPM_SUPPLY("CM1_Enable",
> +                           AFE_CM1_CON0, AFE_CM1_ON_SFT, 0,
> +                           ul_cm1_event,
> +                           SND_SOC_DAPM_PRE_PMU |
> +                           SND_SOC_DAPM_PRE_PMD),
> +
> +       SND_SOC_DAPM_SUPPLY("CM2_Enable",
> +                           AFE_CM2_CON0, AFE_CM2_ON_SFT, 0,
> +                           ul_cm2_event,
> +                           SND_SOC_DAPM_PRE_PMU |
> +                           SND_SOC_DAPM_PRE_PMD),

^^^

[...]

> +       {"UL2", NULL, "UL2_CH1"},
> +       {"UL2", NULL, "UL2_CH2"},
> +       {"UL2_CH1", "ADDA_UL_CH1", "ADDA_UL_Mux"},
> +       {"UL2_CH2", "ADDA_UL_CH2", "ADDA_UL_Mux"},
> +       {"UL2_CH1", "ADDA_UL_CH3", "ADDA_CH34_UL_Mux"},

Why is one channel missing here?

> +       {"UL2_CH2", "ADDA_UL_CH1", "ADDA_UL_Mux"},
> +       {"UL2_CH2", "ADDA_UL_CH2", "ADDA_UL_Mux"},
> +       {"UL2_CH2", "ADDA_UL_CH3", "ADDA_CH34_UL_Mux"},
> +       {"UL2_CH2", "ADDA_UL_CH4", "ADDA_CH34_UL_Mux"},

While it is present here?

Same applies to UL7, UL9, UL10 and UL24.

[...]

> +static const struct mtk_base_memif_data memif_data[MT8196_MEMIF_NUM] =3D=
 {
> +       [MT8196_MEMIF_DL0] =3D {
> +               .name =3D "DL0",
> +               .id =3D MT8196_MEMIF_DL0,
> +               .reg_ofs_base =3D AFE_DL0_BASE,
> +               .reg_ofs_cur =3D AFE_DL0_CUR,
> +               .reg_ofs_end =3D AFE_DL0_END,
> +               .reg_ofs_base_msb =3D AFE_DL0_BASE_MSB,
> +               .reg_ofs_cur_msb =3D AFE_DL0_CUR_MSB,
> +               .reg_ofs_end_msb =3D AFE_DL0_END_MSB,
> +               .fs_reg =3D AFE_DL0_CON0,
> +               .fs_shift =3D DL0_SEL_FS_SFT,
> +               .fs_maskbit =3D DL0_SEL_FS_MASK,
> +               .mono_reg =3D AFE_DL0_CON0,
> +               .mono_shift =3D DL0_MONO_SFT,
> +               .enable_reg =3D AFE_DL0_CON0,
> +               .enable_shift =3D DL0_ON_SFT,
> +               .hd_reg =3D AFE_DL0_CON0,
> +               .hd_mask =3D DL0_HD_MODE_MASK,
> +               .hd_shift =3D DL0_HD_MODE_SFT,
> +               .hd_align_reg =3D AFE_DL0_CON0,
> +               .hd_align_mshift =3D DL0_HALIGN_SFT,
> +               .agent_disable_reg =3D -1,
> +               .agent_disable_shift =3D -1,
> +               .msb_reg =3D -1,
> +               .msb_shift =3D -1,
> +               .pbuf_reg =3D AFE_DL0_CON0,
> +               .pbuf_mask =3D DL0_PBUF_SIZE_MASK,
> +               .pbuf_shift =3D DL0_PBUF_SIZE_SFT,
> +               .minlen_reg =3D AFE_DL0_CON0,
> +               .minlen_mask =3D DL0_MINLEN_MASK,
> +               .minlen_shift =3D DL0_MINLEN_SFT,
> +               .maxlen_reg =3D AFE_DL0_CON0,
> +               .maxlen_mask =3D DL0_MAXLEN_MASK,
> +               .maxlen_shift =3D DL0_MAXLEN_SFT,
> +       },

This table is very repetitive as well. This can be compacted with some
macro magic.

For example, the following:

    #define MT8196_MEMIF(id)    \
        [MT8196_MEMIF_##id] =3D { \
                .name =3D #id,    \
                .id =3D MT8196_MEMIF_##id,        \
                .reg_ofs_base =3D AFE_##id##_base,        \
    }

    MT8196_MEMIF(DL0)

expands into:

    [MT8196_MEMIF_DL0] =3D { .name =3D "DL0", .DL0 =3D MT8196_MEMIF_DL0,
.reg_ofs_base =3D AFE_DL0_base, }

I will leave it to you to complete the macro and define different variants
for the different cases.

[...]

> +static const struct mtk_base_irq_data irq_data[MT8196_IRQ_NUM] =3D {
> +       [MT8196_IRQ_0] =3D {
> +               .id =3D MT8196_IRQ_0,
> +               .irq_cnt_reg =3D AFE_IRQ0_MCU_CFG1,
> +               .irq_cnt_shift =3D AFE_IRQ_CNT_SHIFT,
> +               .irq_cnt_maskbit =3D AFE_IRQ_CNT_MASK,
> +               .irq_fs_reg =3D AFE_IRQ0_MCU_CFG0,
> +               .irq_fs_shift =3D AFE_IRQ0_MCU_FS_SFT,
> +               .irq_fs_maskbit =3D AFE_IRQ0_MCU_FS_MASK,
> +               .irq_en_reg =3D AFE_IRQ0_MCU_CFG0,
> +               .irq_en_shift =3D AFE_IRQ0_MCU_ON_SFT,
> +               .irq_clr_reg =3D AFE_IRQ0_MCU_CFG1,
> +               .irq_clr_shift =3D AFE_IRQ0_CLR_CFG_SFT,
> +               .irq_ap_en_reg =3D AFE_IRQ_MCU_EN,
> +               .irq_scp_en_reg =3D AFE_IRQ_MCU_SCP_EN,
> +               .irq_scp_en_shift =3D IRQ0_MCU_SCP_EN_SFT,
> +       },

Same here. This can also be compacted with macros.

[...]

> +static const int memif_irq_usage[MT8196_MEMIF_NUM] =3D {
> +       /* TODO: verify each memif & irq */
> +       [MT8196_MEMIF_DL0] =3D MT8196_IRQ_0,
> +       [MT8196_MEMIF_DL1] =3D MT8196_IRQ_1,
> +       [MT8196_MEMIF_DL2] =3D MT8196_IRQ_2,
> +       [MT8196_MEMIF_DL3] =3D MT8196_IRQ_3,
> +       [MT8196_MEMIF_DL4] =3D MT8196_IRQ_4,
> +       [MT8196_MEMIF_DL5] =3D MT8196_IRQ_5,
> +       [MT8196_MEMIF_DL6] =3D MT8196_IRQ_6,
> +       [MT8196_MEMIF_DL7] =3D MT8196_IRQ_7,
> +       [MT8196_MEMIF_DL8] =3D MT8196_IRQ_8,
> +       [MT8196_MEMIF_DL23] =3D MT8196_IRQ_9,
> +       [MT8196_MEMIF_DL24] =3D MT8196_IRQ_10,
> +       [MT8196_MEMIF_DL25] =3D MT8196_IRQ_11,
> +       [MT8196_MEMIF_DL26] =3D MT8196_IRQ_0,
> +       [MT8196_MEMIF_DL_4CH] =3D MT8196_IRQ_0,
> +       [MT8196_MEMIF_DL_24CH] =3D MT8196_IRQ_12,
> +       [MT8196_MEMIF_VUL0] =3D MT8196_IRQ_13,
> +       [MT8196_MEMIF_VUL1] =3D MT8196_IRQ_14,
> +       [MT8196_MEMIF_VUL2] =3D MT8196_IRQ_15,
> +       [MT8196_MEMIF_VUL3] =3D MT8196_IRQ_16,
> +       [MT8196_MEMIF_VUL4] =3D MT8196_IRQ_17,
> +       [MT8196_MEMIF_VUL5] =3D MT8196_IRQ_18,
> +       [MT8196_MEMIF_VUL6] =3D MT8196_IRQ_19,
> +       [MT8196_MEMIF_VUL7] =3D MT8196_IRQ_20,
> +       [MT8196_MEMIF_VUL8] =3D MT8196_IRQ_21,
> +       [MT8196_MEMIF_VUL9] =3D MT8196_IRQ_22,
> +       [MT8196_MEMIF_VUL10] =3D MT8196_IRQ_23,
> +       [MT8196_MEMIF_VUL24] =3D MT8196_IRQ_24,
> +       [MT8196_MEMIF_VUL25] =3D MT8196_IRQ_25,
> +       [MT8196_MEMIF_VUL26] =3D MT8196_IRQ_0,
> +       [MT8196_MEMIF_VUL_CM0] =3D MT8196_IRQ_26,
> +       [MT8196_MEMIF_VUL_CM1] =3D MT8196_IRQ_0,
> +       [MT8196_MEMIF_VUL_CM2] =3D MT8196_IRQ_0,
> +       [MT8196_MEMIF_ETDM_IN0] =3D MT8196_IRQ_0,
> +       [MT8196_MEMIF_ETDM_IN1] =3D MT8196_IRQ_0,
> +       [MT8196_MEMIF_ETDM_IN2] =3D MT8196_IRQ_0,
> +       [MT8196_MEMIF_ETDM_IN3] =3D MT8196_IRQ_0,
> +       [MT8196_MEMIF_ETDM_IN4] =3D MT8196_IRQ_0,
> +       [MT8196_MEMIF_ETDM_IN6] =3D MT8196_IRQ_0,
> +       [MT8196_MEMIF_HDMI] =3D MT8196_IRQ_31
> +};
> +
> +static bool mt8196_is_volatile_reg(struct device *dev, unsigned int reg)
> +{
> +       /* these auto-gen reg has read-only bit, so put it as volatile */
> +       /* volatile reg cannot be cached, so cannot be set when power off=
 */
> +       switch (reg) {
> +       case AUDIO_TOP_CON0:    /* reg bit controlled by CCF */
> +       case AUDIO_TOP_CON1:    /* reg bit controlled by CCF */

Please consider moving the clock bits into the AFE driver. They are
the same hardware block, and you don't really need a clock driver
to control simple gates. Just define supply widgets for them.

> +       case AUDIO_TOP_CON2:
> +       case AUDIO_TOP_CON3:
> +       case AUDIO_TOP_CON4:

Many of these values are consecutive. Please use the ellipis notation
to shorten this:

switch (reg) {
    case AUDIO_TOP_CON0 ... AUDIO_TOP_CON4:
        return true;
}

Or you could use the |struct regmap_range| and |struct regmap_access_table|
if that is shorter.

[...]

> +
> +static irqreturn_t mt8196_afe_irq_handler(int irq_id, void *dev)
> +{
> +       struct mtk_base_afe *afe =3D dev;
> +       struct mtk_base_afe_irq *irq;
> +       unsigned int status =3D 0;
> +       unsigned int status_mcu;
> +       unsigned int mcu_en =3D 0;
> +       unsigned int cus_status =3D 0;
> +       unsigned int cus_status_mcu;
> +       unsigned int cus_mcu_en =3D 0;
> +       unsigned int tmp_reg =3D 0;
> +       int ret, cus_ret;
> +       int i;
> +       struct timespec64 ts64;
> +       unsigned long long t1, t2;
> +       /* one interrupt period =3D 5ms */
> +       unsigned long long timeout_limit =3D 5000000;
> +
> +       /* get irq that is sent to MCU */
> +       regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &mcu_en);
> +       regmap_read(afe->regmap, AFE_CUSTOM_IRQ_MCU_EN, &cus_mcu_en);
> +
> +       ret =3D regmap_read(afe->regmap, AFE_IRQ_MCU_STATUS, &status);
> +       cus_ret =3D regmap_read(afe->regmap, AFE_CUSTOM_IRQ_MCU_STATUS, &=
cus_status);
> +       /* only care IRQ which is sent to MCU */
> +       status_mcu =3D status & mcu_en & AFE_IRQ_STATUS_BITS;
> +       cus_status_mcu =3D cus_status & cus_mcu_en & AFE_IRQ_STATUS_BITS;
> +       if ((ret || !status_mcu) &&
> +           (cus_ret || !cus_status_mcu)) {
> +               dev_info(afe->dev, "irq status err, ret %d, status 0x%x, =
mcu_en 0x%x\n",
> +                        ret, status, mcu_en);
> +               dev_info(afe->dev, "irq status err, ret %d, cus_status_mc=
u 0x%x, cus_mcu_en 0x%x\n",
> +                        ret, cus_status_mcu, cus_mcu_en);
> +
> +               goto err_irq;
> +       }
> +
> +       ktime_get_ts64(&ts64);
> +       t1 =3D timespec64_to_ns(&ts64);
> +
> +       for (i =3D 0; i < MT8196_MEMIF_NUM; i++) {
> +               struct mtk_base_afe_memif *memif =3D &afe->memif[i];
> +
> +               if (!memif->substream)
> +                       continue;
> +
> +               if (memif->irq_usage < 0)
> +                       continue;
> +               irq =3D &afe->irqs[memif->irq_usage];
> +
> +               if (i =3D=3D MT8196_MEMIF_HDMI) {
> +                       if (cus_status_mcu & (0x1 << irq->irq_data->id))
> +                               snd_pcm_period_elapsed(memif->substream);
> +               } else {
> +                       if (status_mcu & (0x1 << irq->irq_data->id))
> +                               snd_pcm_period_elapsed(memif->substream);
> +               }
> +       }
> +
> +       ktime_get_ts64(&ts64);
> +       t2 =3D timespec64_to_ns(&ts64);
> +       t2 =3D t2 - t1; /* in ns (10^9) */
> +
> +       if (t2 > timeout_limit) {
> +               dev_warn(afe->dev, "mcu_en 0x%x, cus_mcu_en 0x%x, timeout=
 %llu, limit %llu, ret %d\n",
> +                        mcu_en, cus_mcu_en,
> +                        t2, timeout_limit, ret);
> +       }
> +
> +err_irq:
> +       /* clear irq */
> +       for (i =3D 0; i < MT8196_IRQ_NUM; ++i) {
> +               /* cus_status_mcu only bit0 is used for TDM */
> +               if ((status_mcu & (0x1 << i)) || (cus_status_mcu & 0x1)) =
{
> +                       regmap_read(afe->regmap, irq_data[i].irq_clr_reg,=
 &tmp_reg);
> +                       regmap_update_bits(afe->regmap, irq_data[i].irq_c=
lr_reg,
> +                                          AFE_IRQ_CLR_CFG_MASK_SFT |
> +                                          AFE_IRQ_MISS_FLAG_CLR_CFG_MASK=
_SFT,
> +                                          tmp_reg ^ (AFE_IRQ_CLR_CFG_MAS=
K_SFT |
> +                                          AFE_IRQ_MISS_FLAG_CLR_CFG_MASK=
_SFT));
> +               }
> +       }
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static int mt8196_afe_runtime_suspend(struct device *dev)
> +{
> +       struct mtk_base_afe *afe =3D dev_get_drvdata(dev);
> +       unsigned int value =3D 0;
> +       unsigned int tmp_reg =3D 0;
> +       int ret =3D 0, i;
> +
> +       if (!afe->regmap) {
> +               dev_err(afe->dev, "skip regmap\n");
> +               goto skip_regmap;
> +       }
> +
> +       /* Add to be off for free run*/
> +       /* disable AFE */
> +       regmap_update_bits(afe->regmap, AUDIO_ENGEN_CON0, 0x1, 0x0);
> +
> +       ret =3D regmap_read_poll_timeout(afe->regmap,
> +                                      AUDIO_ENGEN_CON0_MON,
> +                                      value,
> +                                      (value & AUDIO_ENGEN_MON_SFT) =3D=
=3D 0,
> +                                      20,
> +                                      1 * 1000 * 1000);
> +       dev_dbg(afe->dev, "read_poll ret %d\n", ret);
> +       if (ret)
> +               dev_info(afe->dev, "ret %d\n", ret);
> +
> +       /* make sure all irq status are cleared */
> +       for (i =3D 0; i < MT8196_IRQ_NUM; ++i) {
> +               regmap_read(afe->regmap, irq_data[i].irq_clr_reg, &tmp_re=
g);
> +               regmap_update_bits(afe->regmap, irq_data[i].irq_clr_reg,
> +                                  AFE_IRQ_CLR_CFG_MASK_SFT | AFE_IRQ_MIS=
S_FLAG_CLR_CFG_MASK_SFT,
> +                                  tmp_reg ^ (AFE_IRQ_CLR_CFG_MASK_SFT |
> +                                  AFE_IRQ_MISS_FLAG_CLR_CFG_MASK_SFT));
> +       }
> +
> +       /* reset sgen */
> +       regmap_write(afe->regmap, AFE_SINEGEN_CON0, 0x0);
> +       regmap_update_bits(afe->regmap, AFE_SINEGEN_CON1,
> +                          SINE_DOMAIN_MASK_SFT,
> +                          0x0 << SINE_DOMAIN_SFT);
> +       regmap_update_bits(afe->regmap, AFE_SINEGEN_CON1,
> +                          SINE_MODE_MASK_SFT,
> +                          0x0 << SINE_MODE_SFT);
> +       regmap_update_bits(afe->regmap, AFE_SINEGEN_CON1,
> +                          INNER_LOOP_BACKI_SEL_MASK_SFT,
> +                          0x0 << INNER_LOOP_BACKI_SEL_SFT);
> +       regmap_update_bits(afe->regmap, AFE_SINEGEN_CON1,
> +                          INNER_LOOP_BACK_MODE_MASK_SFT,
> +                          0xff << INNER_LOOP_BACK_MODE_SFT);
> +
> +       regmap_write(afe->regmap, AUDIO_TOP_CON4, 0x3fff);
> +
> +       /* reset audio 26M request */
> +       regmap_update_bits(afe->regmap,
> +                          AFE_SPM_CONTROL_REQ, 0x1, 0x0);
> +
> +       /* cache only */
> +       regcache_cache_only(afe->regmap, true);
> +       regcache_mark_dirty(afe->regmap);
> +
> +skip_regmap:
> +       mt8196_afe_disable_clock(afe);
> +       return 0;
> +}
> +
> +static int mt8196_afe_runtime_resume(struct device *dev)
> +{
> +       struct mtk_base_afe *afe =3D dev_get_drvdata(dev);
> +       int ret =3D 0;
> +
> +       ret =3D mt8196_afe_enable_clock(afe);
> +       if (ret)
> +               return ret;
> +
> +       if (!afe->regmap) {
> +               dev_warn(afe->dev, "skip regmap\n");
> +               goto skip_regmap;
> +       }
> +       regcache_cache_only(afe->regmap, false);
> +       regcache_sync(afe->regmap);
> +
> +       /* set audio 26M request */
> +       regmap_update_bits(afe->regmap, AFE_SPM_CONTROL_REQ, 0x1, 0x1);
> +
> +       /* IPM2.0: Clear AUDIO_TOP_CON4 for enabling AP side module clk *=
/
> +       regmap_write(afe->regmap, AUDIO_TOP_CON4, 0x0);
> +
> +       /* Add to be on for free run */
> +       regmap_write(afe->regmap, AUDIO_TOP_CON0, 0x0);
> +       regmap_write(afe->regmap, AUDIO_TOP_CON1, 0x0);
> +       regmap_write(afe->regmap, AUDIO_TOP_CON2, 0x0);
> +
> +       /* Can't set AUDIO_TOP_CON3 to be 0x0, it will hang in FPGA env *=
/
> +       regmap_write(afe->regmap, AUDIO_TOP_CON3, 0x0);
> +
> +       regmap_update_bits(afe->regmap, AFE_CBIP_CFG0, 0x1, 0x1);
> +
> +       /* force cpu use 8_24 format when writing 32bit data */
> +       regmap_update_bits(afe->regmap, AFE_MEMIF_CON0,
> +                          CPU_HD_ALIGN_MASK_SFT, 0 << CPU_HD_ALIGN_SFT);
> +
> +       /* enable AFE */
> +       regmap_update_bits(afe->regmap, AUDIO_ENGEN_CON0, 0x1, 0x1);
> +
> +skip_regmap:
> +       return 0;
> +}
> +
> +static int mt8196_afe_component_probe(struct snd_soc_component *componen=
t)
> +{
> +       if (component)
> +               mtk_afe_add_sub_dai_control(component);
> +
> +       return 0;
> +}
> +
> +static int mt8196_afe_pcm_open(struct snd_soc_component *component,
> +                              struct snd_pcm_substream *substream)
> +{
> +       /* set the wait_for_avail to 2 sec*/
> +       substream->wait_time =3D msecs_to_jiffies(2 * 1000);
> +
> +       return 0;
> +}
> +
> +static void mt8196_afe_pcm_free(struct snd_soc_component *component, str=
uct snd_pcm *pcm)
> +{
> +       snd_pcm_lib_preallocate_free_for_all(pcm);
> +}
> +
> +static const struct snd_soc_component_driver mt8196_afe_component =3D {
> +       .name =3D AFE_PCM_NAME,
> +       .probe =3D mt8196_afe_component_probe,
> +       .pcm_construct =3D mtk_afe_pcm_new,
> +       .pcm_destruct =3D mt8196_afe_pcm_free,
> +       .open =3D mt8196_afe_pcm_open,
> +       .pointer =3D mtk_afe_pcm_pointer,
> +};
> +
> +static int mt8196_dai_memif_register(struct mtk_base_afe *afe)
> +{
> +       struct mtk_base_afe_dai *dai;
> +
> +       dai =3D devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
> +       if (!dai)
> +               return -ENOMEM;
> +
> +       list_add(&dai->list, &afe->sub_dais);
> +
> +       dai->dai_drivers =3D mt8196_memif_dai_driver;
> +       dai->num_dai_drivers =3D ARRAY_SIZE(mt8196_memif_dai_driver);
> +
> +       dai->controls =3D mt8196_pcm_kcontrols;
> +       dai->num_controls =3D ARRAY_SIZE(mt8196_pcm_kcontrols);
> +       dai->dapm_widgets =3D mt8196_memif_widgets;
> +       dai->num_dapm_widgets =3D ARRAY_SIZE(mt8196_memif_widgets);
> +       dai->dapm_routes =3D mt8196_memif_routes;
> +       dai->num_dapm_routes =3D ARRAY_SIZE(mt8196_memif_routes);
> +       return 0;
> +}
> +
> +typedef int (*dai_register_cb)(struct mtk_base_afe *);
> +static const dai_register_cb dai_register_cbs[] =3D {
> +       mt8196_dai_adda_register,
> +       mt8196_dai_i2s_register,
> +       mt8196_dai_tdm_register,
> +       mt8196_dai_memif_register,
> +};
> +
> +static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
> +{
> +       int ret, i;
> +       unsigned int tmp_reg =3D 0;
> +       int irq_id;
> +       struct mtk_base_afe *afe;
> +       struct mt8196_afe_private *afe_priv;
> +       struct device *dev;

Assign `dev` here and use that instead of doing a dereference every time.

> +       ret =3D of_reserved_mem_device_init(&pdev->dev);
> +       if (ret)
> +               dev_dbg(&pdev->dev, "failed to assign memory region: %d\n=
", ret);

This should be a visible error message.

We might be adding checks against the DMA mask in the reserved memory code.
So please move this call after dma_set_mask_and_coherent().

> +
> +       ret =3D dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(34));

The datasheet shows that the DMA address register is 41 bits wide combined.

> +       if (ret)
> +               return ret;
> +
> +       afe =3D devm_kzalloc(&pdev->dev, sizeof(*afe), GFP_KERNEL);
> +       if (!afe)
> +               return -ENOMEM;
> +
> +       platform_set_drvdata(pdev, afe);
> +
> +       afe->platform_priv =3D devm_kzalloc(&pdev->dev, sizeof(*afe_priv)=
,
> +                                         GFP_KERNEL);
> +       if (!afe->platform_priv)
> +               return -ENOMEM;
> +
> +       afe_priv =3D afe->platform_priv;
> +
> +       afe->dev =3D &pdev->dev;
> +       dev =3D afe->dev;
> +
> +       /* init audio related clock */
> +       ret =3D mt8196_init_clock(afe);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "init clock error.\n");
> +
> +       pm_runtime_enable(&pdev->dev);

Consider using devm_pm_runtime_enable() if possible.


ChenYu

> +       if (!pm_runtime_enabled(&pdev->dev))
> +               goto err_pm_disable;
> +
> +       /* Audio device is part of genpd.
> +        * Set audio as syscore device to prevent
> +        * genpd automatically power off audio
> +        * device when suspend
> +        */
> +       dev_pm_syscore_device(&pdev->dev, true);
> +
> +       afe->base_addr =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(afe->base_addr))
> +               return dev_err_probe(dev, PTR_ERR(afe->base_addr),
> +                                    "AFE base_addr not found\n");
> +
> +       /* enable clock for regcache get default value from hw */
> +       pm_runtime_get_sync(&pdev->dev);
> +
> +       afe->regmap =3D devm_regmap_init_mmio(&pdev->dev, afe->base_addr,
> +                                           &mt8196_afe_regmap_config);
> +       if (IS_ERR(afe->regmap))
> +               return PTR_ERR(afe->regmap);
> +
> +       /* IPM2.0 clock flow, need debug */
> +       regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
> +       regmap_write(afe->regmap, AFE_IRQ_MCU_EN, 0xffffffff);
> +       regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
> +       /* IPM2.0 clock flow, need debug */
> +
> +       pm_runtime_put_sync(&pdev->dev);
> +
> +       regcache_cache_only(afe->regmap, true);
> +       regcache_mark_dirty(afe->regmap);
> +
> +       /* init memif */
> +       /* IPM2.0 no need banding */
> +       afe->memif_32bit_supported =3D 1;
> +       afe->memif_size =3D MT8196_MEMIF_NUM;
> +       afe->memif =3D devm_kcalloc(dev, afe->memif_size, sizeof(*afe->me=
mif),
> +                                 GFP_KERNEL);
> +
> +       if (!afe->memif)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < afe->memif_size; i++) {
> +               afe->memif[i].data =3D &memif_data[i];
> +               afe->memif[i].irq_usage =3D memif_irq_usage[i];
> +               afe->memif[i].const_irq =3D 1;
> +       }
> +
> +       mutex_init(&afe->irq_alloc_lock);
> +
> +       /* init irq */
> +       afe->irqs_size =3D MT8196_IRQ_NUM;
> +       afe->irqs =3D devm_kcalloc(dev, afe->irqs_size, sizeof(*afe->irqs=
),
> +                                GFP_KERNEL);
> +
> +       if (!afe->irqs)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < afe->irqs_size; i++)
> +               afe->irqs[i].irq_data =3D &irq_data[i];
> +
> +       /* request irq */
> +       irq_id =3D platform_get_irq(pdev, 0);
> +       if (irq_id < 0)
> +               return dev_err_probe(dev, irq_id, "no irq found");
> +
> +       ret =3D devm_request_irq(dev, irq_id, mt8196_afe_irq_handler,
> +                              IRQF_TRIGGER_NONE,
> +                              "Afe_ISR_Handle", (void *)afe);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "could not request_irq for=
 Afe_ISR_Handle\n");
> +
> +       ret =3D enable_irq_wake(irq_id);
> +       if (ret < 0)
> +               dev_warn(dev, "enable_irq_wake %d ret: %d\n", irq_id, ret=
);
> +
> +       /* init sub_dais */
> +       INIT_LIST_HEAD(&afe->sub_dais);
> +
> +       for (i =3D 0; i < ARRAY_SIZE(dai_register_cbs); i++) {
> +               ret =3D dai_register_cbs[i](afe);
> +               if (ret)
> +                       return dev_err_probe(dev, ret, "dai register i %d=
 fail\n", i);
> +       }
> +
> +       /* init dai_driver and component_driver */
> +       ret =3D mtk_afe_combine_sub_dai(afe);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "mtk_afe_combine_sub_dai f=
ail\n");
> +
> +       /* others */
> +       afe->mtk_afe_hardware =3D &mt8196_afe_hardware;
> +       afe->memif_fs =3D mt8196_memif_fs;
> +       afe->irq_fs =3D mt8196_irq_fs;
> +       afe->get_dai_fs =3D mt8196_get_dai_fs;
> +       afe->get_memif_pbuf_size =3D mt8196_get_memif_pbuf_size;
> +
> +       afe->runtime_resume =3D mt8196_afe_runtime_resume;
> +       afe->runtime_suspend =3D mt8196_afe_runtime_suspend;
> +
> +       afe->request_dram_resource =3D mt8196_afe_dram_request;
> +       afe->release_dram_resource =3D mt8196_afe_dram_release;
> +
> +       /* register component */
> +       ret =3D devm_snd_soc_register_component(&pdev->dev,
> +                                             &mt8196_afe_component,
> +                                             afe->dai_drivers,
> +                                             afe->num_dai_drivers);
> +       if (ret) {
> +               dev_warn(dev, "afe component err\n");
> +               goto err_pm_disable;
> +       }
> +       return 0;
> +
> +err_pm_disable:
> +       pm_runtime_disable(&pdev->dev);
> +       return ret;
> +}
> +
> +static void mt8196_afe_pcm_dev_remove(struct platform_device *pdev)
> +{
> +       struct mtk_base_afe *afe =3D platform_get_drvdata(pdev);
> +
> +       pm_runtime_disable(&pdev->dev);
> +       if (!pm_runtime_status_suspended(&pdev->dev))
> +               mt8196_afe_runtime_suspend(&pdev->dev);
> +
> +       /* disable afe clock */
> +       mt8196_afe_disable_clock(afe);
> +}
> +
> +static const struct of_device_id mt8196_afe_pcm_dt_match[] =3D {
> +       { .compatible =3D "mediatek,mt8196-afe-pcm", },
> +       {},
> +};
> +MODULE_DEVICE_TABLE(of, mt8196_afe_pcm_dt_match);
> +
> +static const struct dev_pm_ops mt8196_afe_pm_ops =3D {
> +       SET_RUNTIME_PM_OPS(mt8196_afe_runtime_suspend,
> +                          mt8196_afe_runtime_resume, NULL)
> +};
> +
> +static struct platform_driver mt8196_afe_pcm_driver =3D {
> +       .driver =3D {
> +               .name =3D "mt8196-afe-pcm",
> +               .of_match_table =3D mt8196_afe_pcm_dt_match,
> +#if IS_ENABLED(CONFIG_PM)
> +               .pm =3D &mt8196_afe_pm_ops,
> +#endif
> +       },
> +       .probe =3D mt8196_afe_pcm_dev_probe,
> +       .remove =3D mt8196_afe_pcm_dev_remove,
> +};
> +
> +module_platform_driver(mt8196_afe_pcm_driver);
> +
> +MODULE_DESCRIPTION("Mediatek ALSA SoC AFE platform driver for 8196");
> +MODULE_AUTHOR("Darren Ye <darren.ye@mediatek.com>");
> +MODULE_LICENSE("GPL");
> --
> 2.45.2
>
>

