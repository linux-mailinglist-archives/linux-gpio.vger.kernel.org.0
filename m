Return-Path: <linux-gpio+bounces-24014-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 54880B1B222
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Aug 2025 12:41:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5503F165B0B
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Aug 2025 10:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E0AD38FA6;
	Tue,  5 Aug 2025 10:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kwLpzLs8"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7979D21771A
	for <linux-gpio@vger.kernel.org>; Tue,  5 Aug 2025 10:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754390453; cv=none; b=J37jp30WkG2PJlCuucUl6dhlGfMmMhEN+pur7PU8brK1r/NqHTP8Ys4wNAfDOdlgNtYsJiK8ha3OLg+ZYhFmX6q8/leOyph69mYblYIRN244Uc3KVuKTeV+iiVnLGUdlYREn2MaCVbf/NZqeuz2mrvnFpPs0FIT+pZiqhE3pUcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754390453; c=relaxed/simple;
	bh=9lrKEunOsXmLBA6FoHgGVuOWi5aftvr4W+Oig8aLSeA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sWJIoX5y0RMGgpfwzL1V7Pxf8dXn9ZM7QihFpCNx4/nJcInH1uNeYkYxq8gjwAL+narfPIr25RSuaKmdzDHNXeamLcJTVcq9KOSBFGyXba0BaQf96oMMLfDwXjdimMuTdFzPDF9O/sFDyGRRgHWmdu0+z8hyqAL24p+t/dgWBzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kwLpzLs8; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54b10594812so5131408e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 05 Aug 2025 03:40:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754390448; x=1754995248; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Sk7TSDHZ12oeQjPDIch1Xju/yd7kRHFeB3e3HyOuU0=;
        b=kwLpzLs8veoh6R/sb/Ow0ldYFmEkZP+olbFh6aIGUC4lA9xsLLtEH1oVusuhOi9Vi3
         OVseBzPjKWcYFNhCoQS1BmiXN2Cjbwgcs7GGASYsjynEgaSnMOlmiDlmQnEtY9of0D+g
         TZEvJ+JkB4Z5L/kTt5pQH74wd4X4PGpxZnZuQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754390448; x=1754995248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Sk7TSDHZ12oeQjPDIch1Xju/yd7kRHFeB3e3HyOuU0=;
        b=O2U6Fq0HN+/FeIza3VDvVHTqAIrgM6oGy/TJV5Qyjcp40jHQSGGKrNextpdlFj6gQE
         VaaM/3gcdz9A6FV+HmhjZd4YOhrnpg6OMbOeLZYU9JcZljj6Rq4N2NB8chjwwrOzozS1
         ITLr4lKaVWMqSTxVXixz39nQtmesoWxT5uPbPG6nLS9a08fBxJZA/M0Rpg+YAig+21lg
         W3Ys1WUeRs8ADjtUqaJAaRg1lPvf72RlOh6UsqxhzdMm9edJcNQGU5ve8eYqskTz8OAL
         WqdPK0tLWZFJWGjDwxw8YfUJ7hk93Xz4HTEMgt43+6G4OXZICC772WIfJLcB8BYQSkAV
         a+3w==
X-Forwarded-Encrypted: i=1; AJvYcCVbTyT1lz/1lo4F2rPOVFwyrq91zj6KLxiD9D46++ayEh1iZSvinwK/lVlRHGIAnlZRGVLaLzjop87A@vger.kernel.org
X-Gm-Message-State: AOJu0YwIyhbgAJCtV2yM+Ag8GDK9ZVPnUNrM+bjLjuYSk1UjgJUneLoL
	9oaO7/g32xZ15u9EBHPqQVus9CWAiwhowM5sfo+ZYGDw2zkA7tIav1Tp+V1Ndl3045STPxYtt9b
	d+S5GwsnPdR8Ba2iFxc4Pnn5YWXI3b1CpqS06b3FV8WD+5ASFB4cKSA==
X-Gm-Gg: ASbGncuK1oH1nBKWbJ2QzMjZqjm4SMeZ+ltpYP6HowjyEpLVPF4+LB1ZwlyDzwBdfKj
	yxl19Ko+rnvSAp4X6lR2lLJxpzeLoK/7x6fUCs0WHegJlOej/kqtFWUCGyMCiUhff63oQ9JyuMw
	UxqhTR4ZnDTwhDzyuVnM9WNNAOpt6hoAIAUA+OMa7ExkiU57ECIG3qytNaSCIVbDPBXD4ByYs5b
	5KT0+JLvuxUi5U6IkqfCPk3eyfyEn6Yr1jA76HOeq4I
X-Google-Smtp-Source: AGHT+IFp/hAtlnbTp2dlSGA9A0YTIzGvzg7plcAE/SEL2yeZe/hex5wW7qm8ilxK5zLLL9cewMaMKoIw6//bu3jrXsM=
X-Received: by 2002:a05:6512:6d3:b0:55b:89ce:8b18 with SMTP id
 2adb3069b0e04-55b97b50f74mr4501550e87.32.1754390447284; Tue, 05 Aug 2025
 03:40:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250708111806.3992-1-darren.ye@mediatek.com> <20250708111806.3992-8-darren.ye@mediatek.com>
In-Reply-To: <20250708111806.3992-8-darren.ye@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 5 Aug 2025 18:40:35 +0800
X-Gm-Features: Ac12FXxE8BnunJ4TDsDybFXheCCr5-60a02YDs1KEAqtd87v1W6dS5FlyPNTkYk
Message-ID: <CAGXv+5EqVekZ9xoWt7ZGYYStnvDOzHfSNe9ar9XkYAjawYMpjg@mail.gmail.com>
Subject: Re: [PATCH v6 07/10] ASoC: mediatek: mt8196: add platform driver
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

On Tue, Jul 8, 2025 at 7:34=E2=80=AFPM Darren.Ye <darren.ye@mediatek.com> w=
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
>  sound/soc/mediatek/mt8196/Makefile         |   15 +
>  sound/soc/mediatek/mt8196/mt8196-afe-pcm.c | 2632 ++++++++++++++++++++
>  4 files changed, 2658 insertions(+)
>  create mode 100644 sound/soc/mediatek/mt8196/Makefile
>  create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
>
> diff --git a/sound/soc/mediatek/Kconfig b/sound/soc/mediatek/Kconfig
> index 10ca8bccabdd..7003d71b847c 100644
> --- a/sound/soc/mediatek/Kconfig
> +++ b/sound/soc/mediatek/Kconfig
> @@ -322,4 +322,14 @@ config SND_SOC_MT8365_MT6357
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
>  endmenu
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
> index 000000000000..af41ece87672
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8196/Makefile
> @@ -0,0 +1,15 @@
> +# SPDX-License-Identifier: GPL-2.0
> +
> +# common include path
> +subdir-ccflags-y +=3D -I$(srctree)/sound/soc/mediatek/common

Please avoid using include paths. Simply use the relative path in
each include statement.

> +
> +# platform driver
> +snd-soc-mt8196-afe-objs +=3D \
> +       mt8196-afe-pcm.o \
> +       mt8196-afe-clk.o \
> +       mt8196-dai-adda.o \
> +       mt8196-dai-i2s.o \
> +       mt8196-dai-tdm.o

There's no need to have just one entry per line.

> +
> +obj-$(CONFIG_SND_SOC_MT8196) +=3D snd-soc-mt8196-afe.o
> +
> diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c b/sound/soc/media=
tek/mt8196/mt8196-afe-pcm.c
> new file mode 100644
> index 000000000000..41a48ba89b95
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8196/mt8196-afe-pcm.c
> @@ -0,0 +1,2632 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  Mediatek ALSA SoC AFE platform driver for 8196
> + *
> + *  Copyright (c) 2024 MediaTek Inc.

Please update to 2025.

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

Please sort, and also split out the sound header to a separate group.

> +
> +#include "mt8196-afe-clk.h"
> +#include "mt8196-afe-common.h"
> +#include "mtk-afe-fe-dai.h"
> +#include "mtk-afe-platform-driver.h"
> +#include "mt8196-interconnection.h"
> +
> +static const struct snd_pcm_hardware mt8196_afe_hardware =3D {

You should directly include <sound/pcm.h> for the definition of this
structure.

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
> +               dev_err(dev, "rate %u invalid, use %d!!!\n",
> +                       rate, MTK_AFE_IPM2P0_RATE_48K);
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

This is only one line, and only used once. I would just inline it directly.

> +
> +static inline int mt8196_convert_cm_ch(unsigned int ch)
> +{
> +       return ch - 1;

This is only one line and only used once. Just inline it.

> +}
> +
> +static unsigned int calculate_cm_update(unsigned int rate, unsigned int =
ch)
> +{
> +       return (((26000000 / rate) - 10) / (ch / 2)) - 1;

This is only one line and only used once. Just inline it.

> +}
> +
> +static int mt8196_set_cm(struct mtk_base_afe *afe, int id,
> +                        bool update, bool swap, unsigned int ch)
> +{
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       unsigned int rate =3D afe_priv->cm_rate[id];
> +       unsigned int rate_val =3D mt8196_rate_transform(afe->dev, rate);
> +       unsigned int update_val =3D update ? calculate_cm_update(rate, ch=
) : 0x64;
> +       int reg =3D AFE_CM0_CON0 + 0x10 * id;
> +
> +       dev_dbg(afe->dev, "CM%d, rate %d, update %d, swap %d, ch %d\n",
> +               id, rate, update, swap, ch);
> +
> +       /* update cnt */
> +       regmap_update_bits(afe->regmap,
> +                          reg,

This can be one the first line. Same for the other calls in this function.

> +                          AFE_CM_UPDATE_CNT_MASK << AFE_CM_UPDATE_CNT_SF=
T,
> +                          update_val << AFE_CM_UPDATE_CNT_SFT);
> +
> +       /* rate */
> +       regmap_update_bits(afe->regmap,
> +                          reg,
> +                          AFE_CM_1X_EN_SEL_FS_MASK << AFE_CM_1X_EN_SEL_F=
S_SFT,
> +                          rate_val << AFE_CM_1X_EN_SEL_FS_SFT);
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
> +       return regmap_update_bits(afe->regmap,
> +                          AFE_CM0_CON0 + 0x10 * id,
> +                          AFE_CM_BYPASS_MODE_MASK << AFE_CM_BYPASS_MODE_=
SFT,
> +                          en << AFE_CM_BYPASS_MODE_SFT);

Please align the start of the line with the left parenthesis.

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

This should be a warning at least. Otherwise just ignore any error.

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
> +       struct snd_soc_pcm_runtime *rtd =3D snd_soc_substream_to_rtd(subs=
tream);
> +       struct mtk_base_afe *afe =3D snd_soc_dai_get_drvdata(dai);
> +       unsigned int channels =3D params_channels(params);
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       int id =3D snd_soc_rtd_to_cpu(rtd, 0)->id;
> +       struct mtk_base_afe_memif *memif =3D &afe->memif[id];
> +       const struct mtk_base_memif_data *data =3D memif->data;
> +
> +       afe_priv->cm_channels =3D channels;
> +
> +       /* set channels */
> +       if (data->ch_num_shift >=3D 0) {
> +               regmap_update_bits(afe->regmap, data->ch_num_reg,
> +                                  data->ch_num_maskbit << data->ch_num_s=
hift,
> +                                  channels << data->ch_num_shift);
> +       }
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
> +       unsigned int tmp_reg;
> +       int fs;
> +       int ret;
> +
> +       dev_info(afe->dev, "%s cmd %d, irq_id %d\n",
> +                memif->data->name, cmd, irq_id);

Make it debug level.

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
> +                               udelay(300);
> +               }

Curly braces are not needed here.

Also, please consider generalizing this part. This is the only difference
between this version and the common FE trigger function. The MT8189 driver
also contains this, so this should somehow be shared.

Maybe add .capture_prefill_* fields to |struct mtk_base_afe| to model it.

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

Return `fs` directly, since it should be a valid error number?

Also, please add an error message.

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

Curly braces not needed.

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

Why is this an XOR?

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
> +       unsigned int rate_reg;
> +       int cm;
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
> +       mt8196_set_cm_rate(afe, cm, rate);

Please move the CM parts to mt8196_fe_hw_params(). You already have
a custom version of .hw_params. The .memif_fs callback is supposed
to be a pure (no side effect) function that converts one value to
another.

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

Please add a space betwee '|' and '\'. Same for the next few blocks.

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

[...]

> +static const struct snd_kcontrol_new mt8196_pcm_kcontrols[] =3D {
> +};

Drop the empty variable.

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

As mentioned below, these aren't needed.

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

The last parameter is of type bool. Please use "true" or "false".

> +               mt8196_set_cm(afe, CM0, true, false, channels);
> +               regmap_update_bits(afe->regmap, AUDIO_TOP_CON0,
> +                                  PDN_CM0_MASK_SFT, 0 << PDN_CM0_SFT);
> +               break;
> +       case SND_SOC_DAPM_PRE_PMD:

Why is it PRE_PMD and not POST_PMD? Seems out of sequence.

> +               mt8196_enable_cm_bypass(afe, CM0, 0x1);
> +               regmap_update_bits(afe->regmap, AUDIO_TOP_CON0,
> +                                  PDN_CM0_MASK_SFT, 1 << PDN_CM0_SFT);
> +               break;
> +       default:
> +               break;
> +       }

Add an empty line here.

Above comments apply to the other CM event callbacks below.

> +       return 0;
> +}

[...]

> +
> +/* dma widget & routes*/

You should mention in a comment here and in the commit message that the
mixer controls and routes are by no means fully implemented; only the
ones that are intended to be used are, as other wise a fully interconnected
switch bar mixer would introduce way too many unused controls.

[...]

> +static const char * const cm0_mux_map[] =3D {
> +       "CM0_8CH_PATH",
> +       "UL8_2CH_PATH",
> +};
> +
> +static const char * const cm1_mux_map[] =3D {
> +       "CM1_16CH_PATH",
> +       "UL9_2CH_PATH",
> +};
> +
> +static const char * const cm2_mux_map[] =3D {
> +       "CM2_32CH_PATH",
> +       "UL10_2CH_PATH",
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

Since the values are just 0 and 1, the simplified version can be used here:

static SOC_ENUM_SINGLE_DECL(ul_cm0_mux_map_enum, AFE_CM0_CON0,
                            AFE_CM0_OUTPUT_MUX_SFT, cm0_mux_map);

The enum for the values and mask, and the map_value array can then be dropp=
ed.
Same thing applies to CM1 and CM2.

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
> +       SOC_DAPM_ENUM("CM0_UL_MUX Route", ul_cm0_mux_map_enum);
> +
> +static const struct snd_kcontrol_new ul_cm1_mux_control =3D
> +       SOC_DAPM_ENUM("CM1_UL_MUX Route", ul_cm1_mux_map_enum);
> +
> +static const struct snd_kcontrol_new ul_cm2_mux_control =3D
> +       SOC_DAPM_ENUM("CM2_UL_MUX Route", ul_cm2_mux_map_enum);
> +
> +static const struct snd_soc_dapm_widget mt8196_memif_widgets[] =3D {

[...]

> +       SND_SOC_DAPM_MIXER("UL_CM0_CH1", SND_SOC_NOPM, 0, 0,
> +                          memif_ul_cm0_ch1_mix, ARRAY_SIZE(memif_ul_cm0_=
ch1_mix)),
> +       SND_SOC_DAPM_MIXER("UL_CM0_CH2", SND_SOC_NOPM, 0, 0,
> +                          memif_ul_cm0_ch2_mix, ARRAY_SIZE(memif_ul_cm0_=
ch2_mix)),
> +       SND_SOC_DAPM_MIXER("UL_CM0_CH3", SND_SOC_NOPM, 0, 0,
> +                          memif_ul_cm0_ch3_mix, ARRAY_SIZE(memif_ul_cm0_=
ch3_mix)),
> +       SND_SOC_DAPM_MIXER("UL_CM0_CH4", SND_SOC_NOPM, 0, 0,
> +                          memif_ul_cm0_ch4_mix, ARRAY_SIZE(memif_ul_cm0_=
ch4_mix)),
> +       SND_SOC_DAPM_MIXER("UL_CM0_CH5", SND_SOC_NOPM, 0, 0,
> +                          memif_ul_cm0_ch5_mix, ARRAY_SIZE(memif_ul_cm0_=
ch5_mix)),
> +       SND_SOC_DAPM_MIXER("UL_CM0_CH6", SND_SOC_NOPM, 0, 0,
> +                          memif_ul_cm0_ch6_mix, ARRAY_SIZE(memif_ul_cm0_=
ch6_mix)),
> +       SND_SOC_DAPM_MIXER("UL_CM0_CH7", SND_SOC_NOPM, 0, 0,
> +                          memif_ul_cm0_ch7_mix, ARRAY_SIZE(memif_ul_cm0_=
ch7_mix)),
> +       SND_SOC_DAPM_MIXER("UL_CM0_CH8", SND_SOC_NOPM, 0, 0,
> +                          memif_ul_cm0_ch8_mix, ARRAY_SIZE(memif_ul_cm0_=
ch8_mix)),
> +       SND_SOC_DAPM_MUX("CM0_UL_MUX", SND_SOC_NOPM, 0, 0,
> +                        &ul_cm0_mux_control),

Please add an empty line here for separation.

> +       SND_SOC_DAPM_MIXER("UL_CM1_CH1", SND_SOC_NOPM, 0, 0,
> +                          memif_ul_cm1_ch1_mix, ARRAY_SIZE(memif_ul_cm1_=
ch1_mix)),
> +       SND_SOC_DAPM_MIXER("UL_CM1_CH2", SND_SOC_NOPM, 0, 0,
> +                          memif_ul_cm1_ch2_mix, ARRAY_SIZE(memif_ul_cm1_=
ch2_mix)),
> +       SND_SOC_DAPM_MIXER("UL_CM1_CH3", SND_SOC_NOPM, 0, 0,
> +                          memif_ul_cm1_ch3_mix, ARRAY_SIZE(memif_ul_cm1_=
ch3_mix)),
> +       SND_SOC_DAPM_MIXER("UL_CM1_CH4", SND_SOC_NOPM, 0, 0,
> +                          memif_ul_cm1_ch4_mix, ARRAY_SIZE(memif_ul_cm1_=
ch4_mix)),
> +       SND_SOC_DAPM_MIXER("UL_CM1_CH5", SND_SOC_NOPM, 0, 0,
> +                          memif_ul_cm1_ch5_mix, ARRAY_SIZE(memif_ul_cm1_=
ch5_mix)),
> +       SND_SOC_DAPM_MIXER("UL_CM1_CH6", SND_SOC_NOPM, 0, 0,
> +                          memif_ul_cm1_ch6_mix, ARRAY_SIZE(memif_ul_cm1_=
ch6_mix)),
> +       SND_SOC_DAPM_MIXER("UL_CM1_CH7", SND_SOC_NOPM, 0, 0,
> +                          memif_ul_cm1_ch7_mix, ARRAY_SIZE(memif_ul_cm1_=
ch7_mix)),
> +       SND_SOC_DAPM_MIXER("UL_CM1_CH8", SND_SOC_NOPM, 0, 0,
> +                          memif_ul_cm1_ch8_mix, ARRAY_SIZE(memif_ul_cm1_=
ch8_mix)),
> +       SND_SOC_DAPM_MIXER("UL_CM1_CH9", SND_SOC_NOPM, 0, 0,
> +                          memif_ul_cm1_ch9_mix, ARRAY_SIZE(memif_ul_cm1_=
ch9_mix)),
> +       SND_SOC_DAPM_MIXER("UL_CM1_CH10", SND_SOC_NOPM, 0, 0,
> +                          memif_ul_cm1_ch10_mix, ARRAY_SIZE(memif_ul_cm1=
_ch10_mix)),
> +       SND_SOC_DAPM_MIXER("UL_CM1_CH11", SND_SOC_NOPM, 0, 0,
> +                          memif_ul_cm1_ch11_mix, ARRAY_SIZE(memif_ul_cm1=
_ch11_mix)),
> +       SND_SOC_DAPM_MIXER("UL_CM1_CH12", SND_SOC_NOPM, 0, 0,
> +                          memif_ul_cm1_ch12_mix, ARRAY_SIZE(memif_ul_cm1=
_ch12_mix)),
> +       SND_SOC_DAPM_MIXER("UL_CM1_CH13", SND_SOC_NOPM, 0, 0,
> +                          memif_ul_cm1_ch13_mix, ARRAY_SIZE(memif_ul_cm1=
_ch13_mix)),
> +       SND_SOC_DAPM_MIXER("UL_CM1_CH14", SND_SOC_NOPM, 0, 0,
> +                          memif_ul_cm1_ch14_mix, ARRAY_SIZE(memif_ul_cm1=
_ch14_mix)),
> +       SND_SOC_DAPM_MIXER("UL_CM1_CH15", SND_SOC_NOPM, 0, 0,
> +                          memif_ul_cm1_ch15_mix, ARRAY_SIZE(memif_ul_cm1=
_ch15_mix)),
> +       SND_SOC_DAPM_MIXER("UL_CM1_CH16", SND_SOC_NOPM, 0, 0,
> +                          memif_ul_cm1_ch16_mix, ARRAY_SIZE(memif_ul_cm1=
_ch16_mix)),
> +       SND_SOC_DAPM_MUX("CM1_UL_MUX", SND_SOC_NOPM, 0, 0,
> +                        &ul_cm1_mux_control),

And here as well.

[...]

> +       SND_SOC_DAPM_MIXER("SOF_DMA_UL0", SND_SOC_NOPM, 0, 0, NULL, 0),
> +       SND_SOC_DAPM_MIXER("SOF_DMA_UL1", SND_SOC_NOPM, 0, 0, NULL, 0),
> +       SND_SOC_DAPM_MIXER("SOF_DMA_UL2", SND_SOC_NOPM, 0, 0, NULL, 0),
> +};
> +
> +static const struct snd_soc_dapm_route mt8196_memif_routes[] =3D {
> +       {"UL0", NULL, "UL0_CH1"},
> +       {"UL0", NULL, "UL0_CH2"},
> +       /* Normal record */
> +       {"UL0_CH1", "ADDA_UL_CH1", "ADDA_UL_Mux"},
> +       {"UL0_CH2", "ADDA_UL_CH2", "ADDA_UL_Mux"},
> +       /* SOF Uplink */
> +       {"SOF_DMA_UL0", NULL, "UL0_CH1"},
> +       {"SOF_DMA_UL0", NULL, "UL0_CH2"},

Somehow this is weird. SOF_DMA_UL0 is a dummy widget created above,
while SOF somehow creates a widget named AFE2.IN which goes to the
same SOF buffer widget. The AFE2.IN widget remains unused.

> +
> +       {"UL1", NULL, "UL1_CH1"},
> +       {"UL1", NULL, "UL1_CH2"},
> +       {"UL1_CH1", "I2SIN4_CH1", "I2SIN4"},
> +       {"UL1_CH2", "I2SIN4_CH2", "I2SIN4"},
> +       {"UL1_CH1", "I2SIN6_CH1", "I2SIN6"},
> +       {"UL1_CH2", "I2SIN6_CH2", "I2SIN6"},
> +       /* SOF Uplink */
> +       {"SOF_DMA_UL1", NULL, "UL1_CH1"},
> +       {"SOF_DMA_UL1", NULL, "UL1_CH2"},
> +
> +       {"UL2", NULL, "UL2_CH1"},
> +       {"UL2", NULL, "UL2_CH2"},
> +       {"UL2_CH1", "ADDA_UL_CH3", "ADDA_CH34_UL_Mux"},
> +       {"UL2_CH2", "ADDA_UL_CH4", "ADDA_CH34_UL_Mux"},
> +       /* SOF Uplink */
> +       {"SOF_DMA_UL2", NULL, "UL2_CH1"},
> +       {"SOF_DMA_UL2", NULL, "UL2_CH2"},

[...]

> +       {"UL8", NULL, "CM0_UL_MUX"},
> +       {"CM0_UL_MUX", "UL8_2CH_PATH", "UL8_CH1"},
> +       {"CM0_UL_MUX", "UL8_2CH_PATH", "UL8_CH2"},
> +       {"CM0_UL_MUX", "CM0_8CH_PATH", "UL_CM0_CH1"},
> +       {"CM0_UL_MUX", "CM0_8CH_PATH", "UL_CM0_CH2"},
> +       {"CM0_UL_MUX", "CM0_8CH_PATH", "UL_CM0_CH3"},
> +       {"CM0_UL_MUX", "CM0_8CH_PATH", "UL_CM0_CH4"},
> +       {"CM0_UL_MUX", "CM0_8CH_PATH", "UL_CM0_CH5"},
> +       {"CM0_UL_MUX", "CM0_8CH_PATH", "UL_CM0_CH6"},
> +       {"CM0_UL_MUX", "CM0_8CH_PATH", "UL_CM0_CH7"},
> +       {"CM0_UL_MUX", "CM0_8CH_PATH", "UL_CM0_CH8"},
> +       {"UL_CM0_CH1", NULL, "CM0_Enable"},
> +       {"UL_CM0_CH2", NULL, "CM0_Enable"},
> +       {"UL_CM0_CH3", NULL, "CM0_Enable"},
> +       {"UL_CM0_CH4", NULL, "CM0_Enable"},
> +       {"UL_CM0_CH5", NULL, "CM0_Enable"},
> +       {"UL_CM0_CH6", NULL, "CM0_Enable"},
> +       {"UL_CM0_CH7", NULL, "CM0_Enable"},
> +       {"UL_CM0_CH8", NULL, "CM0_Enable"},

As mentioned in the review of another patch, you can tie "CM0_Enable"
to "UL_CM0", the widget for the DAI, which actually maps to a hardware
engine. This also reduces the number of routes needed.

Same goes for all the other MEMIFs.

[...]

> +#define MT8183_AFE_IRQ_BASE(_id, _fs_reg, _fs_shift, _fs_maskbit)      \
> +       [MT8183_IRQ_##_id] =3D {  \
> +               .id =3D MT8183_IRQ_##_id,                 \
> +               .irq_cnt_reg =3D AFE_IRQ_MCU_CNT##_id,    \
> +               .irq_cnt_shift =3D 0,                     \
> +               .irq_cnt_maskbit =3D 0x3ffff,             \
> +               .irq_fs_reg =3D _fs_reg,                  \
> +               .irq_fs_shift =3D _fs_shift,              \
> +               .irq_fs_maskbit =3D _fs_maskbit,          \
> +               .irq_en_reg =3D AFE_IRQ_MCU_CON0,         \
> +               .irq_en_shift =3D IRQ##_id##_MCU_ON_SFT,  \
> +               .irq_clr_reg =3D AFE_IRQ_MCU_CLR,         \
> +               .irq_clr_shift =3D IRQ##_id##_MCU_CLR_SFT,        \
> +       }

Please remove. This seems like it was copied over as a reference?

[...]

> +static irqreturn_t mt8196_afe_irq_handler(int irq_id, void *dev)
> +{
> +       struct mtk_base_afe *afe =3D dev;
> +       struct mtk_base_afe_irq *irq;
> +       unsigned int status;
> +       unsigned int status_mcu;
> +       unsigned int mcu_en;
> +       unsigned int cus_status;
> +       unsigned int cus_status_mcu;
> +       unsigned int cus_mcu_en;
> +       unsigned int tmp_reg;
> +       int ret, cus_ret;
> +       int i;
> +       struct timespec64 ts64;
> +       unsigned long long t1, t2;
> +       /* one interrupt period =3D 5ms */
> +       const unsigned long long timeout_limit =3D 5000000;
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

This can be on the same line.

> +               dev_err(afe->dev, "ret %d, sat 0x%x, en 0x%x,csat 0x%x, c=
en 0x%x\n",
> +                       ret, status, mcu_en, cus_status_mcu, cus_mcu_en);
> +               goto err_irq;

Just return IRQ_NONE here, because nothing was handled.

> +       }
> +
> +       ktime_get_ts64(&ts64);
> +       t1 =3D timespec64_to_ns(&ts64);

u64 t1 =3D ktime_get_ns();

Maybe t1 should be at the start of the function, if the time limit
is for the whole interrupt handler, which I think it is?

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

Please use BIT(x).

> +                               snd_pcm_period_elapsed(memif->substream);
> +               } else {
> +                       if (status_mcu & (0x1 << irq->irq_data->id))

BIT(irq->irq_data->id)

> +                               snd_pcm_period_elapsed(memif->substream);
> +               }
> +       }
> +
> +       ktime_get_ts64(&ts64);
> +       t2 =3D timespec64_to_ns(&ts64);

u64 t2 =3D ktime_get_ns();

> +       t2 =3D t2 - t1; /* in ns (10^9) */
> +
> +       if (t2 > timeout_limit) {
> +               dev_warn(afe->dev, "mcu_en 0x%x, cus_mcu_en 0x%x, timeout=
 %llu, limit %llu, ret %d\n",

Please make the message more meaningful, such as

         dev_warn(afe->dev, "IRQ handler exceeded time limit by %llu ns",
                  t2 - timeout_limit);

Also, ret's value probably doesn't factor in here, so I don't think it need=
s
to be included in the message.

> +                        mcu_en, cus_mcu_en,
> +                        t2, timeout_limit, ret);
> +       }

Curly braces are not required here.

> +
> +err_irq:
> +       /* clear irq */
> +       for (i =3D 0; i < MT8196_IRQ_NUM; ++i) {
> +               /* cus_status_mcu only bit0 is used for TDM */
> +               if ((status_mcu & (0x1 << i)) || (cus_status_mcu & 0x1)) =
{

BIT(i)

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

Same question as the trigger callback. Why is it XOR?

> +               }
> +       }
> +
> +       return IRQ_HANDLED;
> +}
> +
> +static int mt8196_afe_runtime_suspend(struct device *dev)
> +{
> +       struct mtk_base_afe *afe =3D dev_get_drvdata(dev);
> +       unsigned int value;
> +       unsigned int tmp_reg;
> +       int ret, i;
> +
> +       if (!afe->regmap) {
> +               dev_err(afe->dev, "skip regmap\n");
> +               goto skip_regmap;
> +       }
> +
> +       /* disable AFE */
> +       mt8196_afe_disable_main_clock(afe);
> +
> +       ret =3D regmap_read_poll_timeout(afe->regmap,
> +                                      AUDIO_ENGEN_CON0_MON,
> +                                      value,
> +                                      (value & AUDIO_ENGEN_MON_SFT) =3D=
=3D 0,
> +                                      20,
> +                                      1 * 1000 * 1000);

This timeout is a bit long.

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

Same thing here about the XOR.

> +                                  AFE_IRQ_MISS_FLAG_CLR_CFG_MASK_SFT));
> +       }
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
> +       mt8196_afe_disable_reg_rw_clk(afe);
> +       return 0;
> +}
> +
> +static int mt8196_afe_runtime_resume(struct device *dev)
> +{
> +       struct mtk_base_afe *afe =3D dev_get_drvdata(dev);
> +       int ret =3D 0;
> +
> +       ret =3D mt8196_afe_enable_reg_rw_clk(afe);
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
> +       regmap_update_bits(afe->regmap, AFE_CBIP_CFG0, 0x1, 0x1);
> +
> +       /* force cpu use 8_24 format when writing 32bit data */
> +       regmap_update_bits(afe->regmap, AFE_MEMIF_CON0,
> +                          CPU_HD_ALIGN_MASK_SFT, 0 << CPU_HD_ALIGN_SFT);
> +
> +       /* enable AFE */
> +       mt8196_afe_enable_main_clock(afe);
> +
> +skip_regmap:
> +       return 0;
> +}
> +
> +static int mt8196_afe_component_probe(struct snd_soc_component *componen=
t)
> +{
> +       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(compon=
ent);
> +
> +       if (component) {
> +               /* enable clock for regcache get default value from hw */
> +               pm_runtime_get_sync(afe->dev);
> +               mtk_afe_add_sub_dai_control(component);
> +               pm_runtime_put_sync(afe->dev);
> +       }
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
> +static const struct reg_sequence mt8196_cg_patch[] =3D {
> +       { AUDIO_TOP_CON4, 0x361c },
> +};
> +
> +static int mt8196_afe_pcm_dev_probe(struct platform_device *pdev)
> +{
> +       int ret, i;
> +       unsigned int tmp_reg;
> +       int irq_id;
> +       struct mtk_base_afe *afe;
> +       struct mt8196_afe_private *afe_priv;
> +       struct device *dev =3D &pdev->dev;
> +
> +       ret =3D dma_set_mask_and_coherent(dev, DMA_BIT_MASK(34));
> +       if (ret)
> +               return ret;
> +
> +       ret =3D of_reserved_mem_device_init(dev);
> +       if (ret)
> +               dev_err(dev, "failed to assign memory region: %d\n", ret)=
;
> +
> +       afe =3D devm_kzalloc(dev, sizeof(*afe), GFP_KERNEL);
> +       if (!afe)
> +               return -ENOMEM;
> +
> +       platform_set_drvdata(pdev, afe);
> +
> +       afe->platform_priv =3D devm_kzalloc(dev, sizeof(*afe_priv),
> +                                         GFP_KERNEL);
> +       if (!afe->platform_priv)
> +               return -ENOMEM;
> +
> +       afe_priv =3D afe->platform_priv;
> +       afe->dev =3D dev;
> +
> +       afe->base_addr =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(afe->base_addr))
> +               return dev_err_probe(dev, PTR_ERR(afe->base_addr),
> +                                    "AFE base_addr not found\n");
> +
> +       /* init audio related clock */
> +       ret =3D mt8196_init_clock(afe);
> +       if (ret)
> +               return dev_err_probe(dev, ret, "init clock error.\n");
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

Just pass zero.

> +                              "Afe_ISR_Handle", (void *)afe);

Cast to void * is not necessary.

> +       if (ret)
> +               return dev_err_probe(dev, ret, "could not request_irq for=
 Afe_ISR_Handle\n");
> +
> +       ret =3D enable_irq_wake(irq_id);

This needs a matching disable_irq_wake() in the error path and remove path.

Also, is this even valid? What in the audio block would trigger a wakeup?

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
> +       ret =3D devm_pm_runtime_enable(dev);
> +       if (ret)
> +               return ret;
> +
> +       /* Audio device is part of genpd.
> +        * Set audio as syscore device to prevent
> +        * genpd automatically power off audio
> +        * device when suspend

Multi-line comment blocks should start with /* empty line. Comment text
starts on the second line, i.e. the opening and closing /* */ should
not have text on the same line.

This needs more context. Why can't it be powered off?

Please reformat the comment and make it wider.

> +        */
> +       dev_pm_syscore_device(dev, true);
> +
> +       /* enable clock for regcache get default value from hw */
> +       pm_runtime_get_sync(dev);
> +
> +       afe->regmap =3D devm_regmap_init_mmio(dev, afe->base_addr,
> +                                           &mt8196_afe_regmap_config);
> +       if (IS_ERR(afe->regmap))
> +               return PTR_ERR(afe->regmap);
> +
> +       ret =3D regmap_register_patch(afe->regmap, mt8196_cg_patch,
> +                                   ARRAY_SIZE(mt8196_cg_patch));
> +       if (ret < 0) {
> +               dev_info(dev, "Failed to apply cg patch\n");

This should be an error message.

> +               goto err_pm_disable;
> +       }
> +
> +       regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
> +       regmap_write(afe->regmap, AFE_IRQ_MCU_EN, 0xffffffff);
> +       regmap_read(afe->regmap, AFE_IRQ_MCU_EN, &tmp_reg);
> +
> +       pm_runtime_put_sync(dev);
> +
> +       regcache_cache_only(afe->regmap, true);
> +       regcache_mark_dirty(afe->regmap);
> +
> +       /* register component */
> +       ret =3D devm_snd_soc_register_component(dev,
> +                                             &mt8196_afe_component,
> +                                             afe->dai_drivers,
> +                                             afe->num_dai_drivers);
> +       if (ret) {
> +               dev_warn(dev, "afe component err\n");

This should be an error message.

> +               goto err_pm_disable;
> +       }
> +
> +       return 0;
> +
> +err_pm_disable:
> +       pm_runtime_disable(dev);

This is not needed since you use the devm version above. What you do need
to do is

    pm_runtime_put_sync(dev);

when jumping from devm_regmap_init_mmio() or regmap_register_patch()
failures.

> +       return ret;
> +}
> +
> +static void mt8196_afe_pcm_dev_remove(struct platform_device *pdev)
> +{
> +       struct mtk_base_afe *afe =3D platform_get_drvdata(pdev);
> +       struct device *dev =3D &pdev->dev;
> +
> +       pm_runtime_disable(dev);

Not needed since it is enabled with devm version.

> +       if (!pm_runtime_status_suspended(dev))
> +               mt8196_afe_runtime_suspend(dev);
> +
> +       /* disable afe clock */
> +       mt8196_afe_disable_reg_rw_clk(afe);
> +       mt8196_afe_disable_main_clock(afe);

It is generally not a good idea to mix devm and non-devm stuff. The
release functions of devm get called _after_ the remove function returns,
so it is very easy to do things out of order and cause errors or lockups.

Also I wonder if this is necessary, but I'm not that familiar with runtime
PM. I would think that since ASoC is the only entry point into this driver
and ASoC does power sequencing, it shouldn't leave components enabled on
removal.

> +}
> +
> +static const struct of_device_id mt8196_afe_pcm_dt_match[] =3D {
> +       { .compatible =3D "mediatek,mt8196-afe", },
> +       { /* sentinel */ },
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
> +               .name =3D "mt8196-afe",
> +               .of_match_table =3D mt8196_afe_pcm_dt_match,
> +#if IS_ENABLED(CONFIG_PM)

Drop the #if around this. The field is always available.

> +               .pm =3D &mt8196_afe_pm_ops,
> +#endif
> +       },
> +       .probe =3D mt8196_afe_pcm_dev_probe,
> +       .remove =3D mt8196_afe_pcm_dev_remove,
> +};
> +

Don't need this empty line.

> +module_platform_driver(mt8196_afe_pcm_driver);
> +
> +MODULE_DESCRIPTION("Mediatek ALSA SoC AFE platform driver for 8196");
> +MODULE_AUTHOR("Darren Ye <darren.ye@mediatek.com>");
> +MODULE_LICENSE("GPL");


Thanks
ChenYu

> --
> 2.45.2
>
>

