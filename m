Return-Path: <linux-gpio+bounces-24160-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6966AB206CB
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 13:03:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 65D4E2A1539
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Aug 2025 11:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BBD22BE63F;
	Mon, 11 Aug 2025 11:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="h58FNRl+"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B012BE64F
	for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 11:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754910205; cv=none; b=PytJTnJrcb7wG2xoiXnHBBh+9xd6islf9pMxyX2Trc0sZ1gJaOKYEjQ7ibGkul7aSnI7H7X5T24WCq1UWJPkZwi01aBrvcPJHsiyFBKXOgbW6KVz4WX6YpKk0kbpBPhCLTYOZekfuJH3yAewgw0LQdfue3EedoQ2Sm9ofBkVczc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754910205; c=relaxed/simple;
	bh=NwxmC8O8KXCpx3TTXRSsBvCds3qFYQNehQ7vq7OfiW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JVgs2CU/IIokZyNNtc4o91gZtZVV9/TJB//4aHESTCLHC+nWyQBVjXgAuXRdjD6conon2YeFIqgAyxvklW59n1A5YTkrLec2O8b0r0O2ACaiytgZXFjQuyhppDu/YdTNp8m/kcbxZCn/v5s03mJy0rTpdP3Y+x7CmJmbgiDdgqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=h58FNRl+; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-332612dc0d1so32398891fa.1
        for <linux-gpio@vger.kernel.org>; Mon, 11 Aug 2025 04:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1754910199; x=1755514999; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U545nr6PUutEvEazYHD2aQlBxJ6xS1nRnRhNpau4D40=;
        b=h58FNRl+jMIEOzYfhqYILpUtIkrWI+UFCHvTFRvQ7wwseI2vypbJwYBz2zFRvazCeZ
         QhQR7sYvd0MKePTZMuaxuEe9KtTjKBykNaPnNWUerTRpX00e/zDAPVQtQfmW7Ixp91jq
         wW8rI6ZTHEcR/PO7Hz9rACpVUQvfp3NgZ/afc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754910199; x=1755514999;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U545nr6PUutEvEazYHD2aQlBxJ6xS1nRnRhNpau4D40=;
        b=gHFCcdIWJt5J4CdNHk4vBIt3O9vm7Lx0iK9xkGl5hUl4urgpQ9CO23eAH8TL3IZ2do
         GXOnJJ4wj8yG5gDkx3EfMOMO9xfzLcvpRAiuLtJIVG2BtcbdAnsPLm4wwDOl7jHAoneU
         KlhRzg3JYccDT8DrkXyemd+JIdyF7jVjh0eXzluqmdlYY5YnipzjVtHP59wXrMRv5mo8
         dmzJ/DfRfU6+wR/t+/wkIgSFSvXVcJ4G0elAej0WAItNAsIKjjs5qXsq1qS5Mauy7S8L
         pL28koYwRda6tiLsaGjjY3yVp5cXc2KPH38cYcV28VWFn4bFTkGgfRSlnRkPeqBwuLfJ
         unqw==
X-Forwarded-Encrypted: i=1; AJvYcCU4QE+3SMr6doU8zp7BzieNj3bjniZbhu9ZHh3ral7+BJ9G1RozjV1xixxB/9D2HzYCeimJ3LMCTX8I@vger.kernel.org
X-Gm-Message-State: AOJu0YxYbSI6JUiL1OPC+km9JJGkHZD+aPbxSwpis0QeY69rAAF+IL3i
	eiw2pMrNFwpzdn8PjXFxLYWt85Zp27ndWPgZ5Aul6vbtIl8JLs+JQJ8DbybO6G7Swus/iZr0AwK
	tTEUlxzlcVCT0DiARximlY7RJMFq4q7UJt/JxmNNg
X-Gm-Gg: ASbGncsWVwDYG355aeWXVEIzJ9aVmrIpl8DotkBU6gu1HfB1+aPfDWCHf1pgop4lZhx
	5FNhN93qPDUXn77ENkBShky81FLFnOeWMa53230u1sxJU9HofqLokwhzIwJFP3eJ1KtqF58w3SV
	zzALwTeM+lYSGNFNsgUREDSsY5eRUHAL8y+si3zZUJuWUUOeYAnlwmthaDBePVMXaBODTCdOBv9
	689z5Kjf6VyBCVjsS4cre4uyaA1yROiiWA=
X-Google-Smtp-Source: AGHT+IF45NYsn3pWZs/DGLokDCzLu+RvRhGETXCglfVBWfxP3YTBHgD5NUDzZRcoAiXNeW0a2IfJQncMcriJBSnLKus=
X-Received: by 2002:a2e:a553:0:b0:32a:739d:fac with SMTP id
 38308e7fff4ca-333a22f6e43mr36449271fa.36.1754910198935; Mon, 11 Aug 2025
 04:03:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250708111806.3992-1-darren.ye@mediatek.com> <20250708111806.3992-6-darren.ye@mediatek.com>
In-Reply-To: <20250708111806.3992-6-darren.ye@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 11 Aug 2025 19:03:07 +0800
X-Gm-Features: Ac12FXzkd3thaShkhbffoUe9SVxdVicunAoAxJgJstECJOsEft-sXq3mw7xVAc0
Message-ID: <CAGXv+5G28aL1-Ucqukt2oMeZ7UjrpT=Hg+wbg465XNK15=XsPQ@mail.gmail.com>
Subject: Re: [PATCH v6 05/10] ASoC: mediatek: mt8196: support I2S in platform driver
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
> Add mt8196 I2S DAI driver support.
>
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> ---
>  sound/soc/mediatek/mt8196/mt8196-dai-i2s.c | 3944 ++++++++++++++++++++
>  1 file changed, 3944 insertions(+)
>  create mode 100644 sound/soc/mediatek/mt8196/mt8196-dai-i2s.c
>
> diff --git a/sound/soc/mediatek/mt8196/mt8196-dai-i2s.c b/sound/soc/media=
tek/mt8196/mt8196-dai-i2s.c
> new file mode 100644
> index 000000000000..59f66ab8fa9f
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8196/mt8196-dai-i2s.c
> @@ -0,0 +1,3944 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  MediaTek ALSA SoC Audio DAI I2S Control
> + *
> + *  Copyright (c) 2024 MediaTek Inc.

                     ^ update to 2025 (for all new files)

> + *  Author: Darren Ye <darren.ye@mediatek.com>
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/regmap.h>
> +#include <sound/pcm_params.h>
> +#include "mt8196-afe-clk.h"
> +#include "mt8196-afe-common.h"
> +#include "mt8196-interconnection.h"
> +#include "mtk-afe-fe-dai.h"

Please add one empty line between each group of headers (linux/*, sound/*,
local). And please use relative paths for the local headers.

> +
> +#define ETDM_22M_CLOCK_THRES 11289600
> +
> +enum {
> +       ETDM_CLK_SOURCE_H26M,
> +       ETDM_CLK_SOURCE_APLL,
> +       ETDM_CLK_SOURCE_SPDIF,
> +       ETDM_CLK_SOURCE_HDMI,
> +       ETDM_CLK_SOURCE_EARC,
> +       ETDM_CLK_SOURCE_LINEIN,
> +};
> +
> +enum {
> +       ETDM_RELATCH_SEL_H26M,
> +       ETDM_RELATCH_SEL_APLL,
> +};
> +
> +enum {
> +       ETDM_RATE_8K,
> +       ETDM_RATE_12K,
> +       ETDM_RATE_16K,
> +       ETDM_RATE_24K,
> +       ETDM_RATE_32K,
> +       ETDM_RATE_48K,
> +       ETDM_RATE_64K,
> +       ETDM_RATE_96K,
> +       ETDM_RATE_128K,
> +       ETDM_RATE_192K,
> +       ETDM_RATE_256K,
> +       ETDM_RATE_384K,
> +       ETDM_RATE_11025 =3D 16,
> +       ETDM_RATE_22050,
> +       ETDM_RATE_44100,
> +       ETDM_RATE_88200,
> +       ETDM_RATE_176400,
> +       ETDM_RATE_352800,
> +};
> +
> +enum {
> +       ETDM_CONN_8K,
> +       ETDM_CONN_11K,
> +       ETDM_CONN_12K,
> +       ETDM_CONN_16K =3D 4,
> +       ETDM_CONN_22K,
> +       ETDM_CONN_24K,
> +       ETDM_CONN_32K =3D 8,
> +       ETDM_CONN_44K,
> +       ETDM_CONN_48K,
> +       ETDM_CONN_88K =3D 13,
> +       ETDM_CONN_96K,
> +       ETDM_CONN_176K =3D 17,
> +       ETDM_CONN_192K,
> +       ETDM_CONN_352K =3D 21,
> +       ETDM_CONN_384K,
> +};
> +
> +enum {
> +       ETDM_WLEN_8_BIT =3D 0x7,
> +       ETDM_WLEN_16_BIT =3D 0xf,
> +       ETDM_WLEN_32_BIT =3D 0x1f,
> +};
> +
> +enum {
> +       ETDM_SLAVE_SEL_ETDMIN0_MASTER,
> +       ETDM_SLAVE_SEL_ETDMIN0_SLAVE,
> +       ETDM_SLAVE_SEL_ETDMIN1_MASTER,
> +       ETDM_SLAVE_SEL_ETDMIN1_SLAVE,
> +       ETDM_SLAVE_SEL_ETDMIN2_MASTER,
> +       ETDM_SLAVE_SEL_ETDMIN2_SLAVE,
> +       ETDM_SLAVE_SEL_ETDMIN3_MASTER,
> +       ETDM_SLAVE_SEL_ETDMIN3_SLAVE,
> +       ETDM_SLAVE_SEL_ETDMOUT0_MASTER,
> +       ETDM_SLAVE_SEL_ETDMOUT0_SLAVE,
> +       ETDM_SLAVE_SEL_ETDMOUT1_MASTER,
> +       ETDM_SLAVE_SEL_ETDMOUT1_SLAVE,
> +       ETDM_SLAVE_SEL_ETDMOUT2_MASTER,
> +       ETDM_SLAVE_SEL_ETDMOUT2_SLAVE,
> +       ETDM_SLAVE_SEL_ETDMOUT3_MASTER,
> +       ETDM_SLAVE_SEL_ETDMOUT3_SLAVE,
> +};
> +
> +enum {
> +       ETDM_SLAVE_SEL_ETDMIN4_MASTER,
> +       ETDM_SLAVE_SEL_ETDMIN4_SLAVE,
> +       ETDM_SLAVE_SEL_ETDMIN5_MASTER,
> +       ETDM_SLAVE_SEL_ETDMIN5_SLAVE,
> +       ETDM_SLAVE_SEL_ETDMIN6_MASTER,
> +       ETDM_SLAVE_SEL_ETDMIN6_SLAVE,
> +       ETDM_SLAVE_SEL_ETDMIN7_MASTER,
> +       ETDM_SLAVE_SEL_ETDMIN7_SLAVE,
> +       ETDM_SLAVE_SEL_ETDMOUT4_MASTER,
> +       ETDM_SLAVE_SEL_ETDMOUT4_SLAVE,
> +       ETDM_SLAVE_SEL_ETDMOUT5_MASTER,
> +       ETDM_SLAVE_SEL_ETDMOUT5_SLAVE,
> +       ETDM_SLAVE_SEL_ETDMOUT6_MASTER,
> +       ETDM_SLAVE_SEL_ETDMOUT6_SLAVE,
> +       ETDM_SLAVE_SEL_ETDMOUT7_MASTER,
> +       ETDM_SLAVE_SEL_ETDMOUT7_SLAVE,
> +};
> +
> +enum {
> +       MTK_DAI_ETDM_FORMAT_I2S,
> +       MTK_DAI_ETDM_FORMAT_LJ,
> +       MTK_DAI_ETDM_FORMAT_RJ,
> +       MTK_DAI_ETDM_FORMAT_EIAJ,
> +       MTK_DAI_ETDM_FORMAT_DSPA,
> +       MTK_DAI_ETDM_FORMAT_DSPB,
> +};
> +
> +static unsigned int get_etdm_wlen(snd_pcm_format_t format)
> +{
> +       return snd_pcm_format_physical_width(format) < 16 ?
> +               ETDM_WLEN_16_BIT : ETDM_WLEN_32_BIT;
> +}
> +
> +static unsigned int get_etdm_lrck_width(snd_pcm_format_t format)
> +{
> +       /* The valid data bit number should be large than 7 due to hardwa=
re limitation. */

                                                 ^ larger?

> +       return snd_pcm_format_physical_width(format) - 1;
> +}
> +
> +static unsigned int get_etdm_rate(unsigned int rate)
> +{
> +       switch (rate) {
> +       case 8000:
> +               return ETDM_RATE_8K;
> +       case 12000:
> +               return ETDM_RATE_12K;
> +       case 16000:
> +               return ETDM_RATE_16K;
> +       case 24000:
> +               return ETDM_RATE_24K;
> +       case 32000:
> +               return ETDM_RATE_32K;
> +       case 48000:
> +               return ETDM_RATE_48K;
> +       case 64000:
> +               return ETDM_RATE_64K;
> +       case 96000:
> +               return ETDM_RATE_96K;
> +       case 128000:
> +               return ETDM_RATE_128K;
> +       case 192000:
> +               return ETDM_RATE_192K;
> +       case 256000:
> +               return ETDM_RATE_256K;
> +       case 384000:
> +               return ETDM_RATE_384K;
> +       case 11025:
> +               return ETDM_RATE_11025;
> +       case 22050:
> +               return ETDM_RATE_22050;
> +       case 44100:
> +               return ETDM_RATE_44100;
> +       case 88200:
> +               return ETDM_RATE_88200;
> +       case 176400:
> +               return ETDM_RATE_176400;
> +       case 352800:
> +               return ETDM_RATE_352800;
> +       default:
> +               return 0;
> +       }
> +}
> +
> +static unsigned int get_etdm_inconn_rate(unsigned int rate)
> +{
> +       switch (rate) {
> +       case 8000:
> +               return ETDM_CONN_8K;
> +       case 12000:
> +               return ETDM_CONN_12K;
> +       case 16000:
> +               return ETDM_CONN_16K;
> +       case 24000:
> +               return ETDM_CONN_24K;
> +       case 32000:
> +               return ETDM_CONN_32K;
> +       case 48000:
> +               return ETDM_CONN_48K;
> +       case 96000:
> +               return ETDM_CONN_96K;
> +       case 192000:
> +               return ETDM_CONN_192K;
> +       case 384000:
> +               return ETDM_CONN_384K;
> +       case 11025:
> +               return ETDM_CONN_11K;
> +       case 22050:
> +               return ETDM_CONN_22K;
> +       case 44100:
> +               return ETDM_CONN_44K;
> +       case 88200:
> +               return ETDM_CONN_88K;
> +       case 176400:
> +               return ETDM_CONN_176K;
> +       case 352800:
> +               return ETDM_CONN_352K;
> +       default:
> +               return 0;
> +       }
> +}
> +
> +struct mtk_afe_i2s_priv {
> +       u8 id;
> +       u32 rate; /* for determine which apll to use */
> +       int low_jitter_en;
> +       const char *share_property_name;
> +       int share_i2s_id;
> +       u32 mclk_rate;
> +       u8 mclk_id;
> +       u8 mclk_apll;
> +       u8 ch_num;
> +       u8 sync;
> +       u8 ip_mode;
> +       u8 format;
> +};
> +
> +/* this enum is merely for mtk_afe_i2s_priv & mtk_base_etdm_data declare=
 */
> +enum {
> +       DAI_I2SIN0,
> +       DAI_I2SIN1,
> +       DAI_I2SIN2,
> +       DAI_I2SIN3,
> +       DAI_I2SIN4,
> +       DAI_I2SIN6,
> +       DAI_I2SOUT0,
> +       DAI_I2SOUT1,
> +       DAI_I2SOUT2,
> +       DAI_I2SOUT3,
> +       DAI_I2SOUT4,
> +       DAI_I2SOUT6,
> +       DAI_FMI2S_MASTER,
> +       DAI_I2S_NUM,
> +};
> +
> +static bool is_etdm_in_pad_top(unsigned int dai_num)
> +{
> +       switch (dai_num) {
> +       case DAI_I2SOUT4:
> +       case DAI_I2SIN4:
> +               return true;
> +       default:
> +               return false;
> +       }
> +}
> +
> +struct mtk_base_etdm_data {
> +       u16 enable_reg;
> +       u16 enable_mask;
> +       u8 enable_shift;
> +       u16 sync_reg;
> +       u16 sync_mask;
> +       u8 sync_shift;
> +       u16 ch_reg;
> +       u16 ch_mask;
> +       u8 ch_shift;
> +       u16 ip_mode_reg;
> +       u16 ip_mode_mask;
> +       u8 ip_mode_shift;
> +       u16 init_count_reg;
> +       u16 init_count_mask;
> +       u8 init_count_shift;
> +       u16 init_point_reg;
> +       u16 init_point_mask;
> +       u8 init_point_shift;
> +       u16 lrck_reset_reg;
> +       u16 lrck_reset_mask;
> +       u8 lrck_reset_shift;
> +       u16 clk_source_reg;
> +       u16 clk_source_mask;
> +       u8 clk_source_shift;
> +       u16 ck_en_sel_reg;
> +       u16 ck_en_sel_mask;
> +       u8 ck_en_sel_shift;
> +       u16 fs_timing_reg;
> +       u16 fs_timing_mask;
> +       u8 fs_timing_shift;
> +       u16 relatch_en_sel_reg;
> +       u16 relatch_en_sel_mask;
> +       u8 relatch_en_sel_shift;
> +       u16 use_afifo_reg;
> +       u16 use_afifo_mask;
> +       u8 use_afifo_shift;
> +       u16 afifo_mode_reg;
> +       u16 afifo_mode_mask;
> +       u8 afifo_mode_shift;
> +       u16 almost_end_ch_reg;
> +       u16 almost_end_ch_mask;
> +       u8 almost_end_ch_shift;
> +       u16 almost_end_bit_reg;
> +       u16 almost_end_bit_mask;
> +       u8 almost_end_bit_shift;
> +       u16 out2latch_time_reg;
> +       u16 out2latch_time_mask;
> +       u8 out2latch_time_shift;
> +       u16 tdm_mode_reg;
> +       u16 tdm_mode_mask;
> +       u8 tdm_mode_shift;
> +       u16 relatch_domain_sel_reg;
> +       u16 relatch_domain_sel_mask;
> +       u8 relatch_domain_sel_shift;
> +       u16 bit_length_reg;
> +       u16 bit_length_mask;
> +       u8 bit_length_shift;
> +       u16 word_length_reg;
> +       u16 word_length_mask;
> +       u8 word_length_shift;
> +       u16 cowork_reg;
> +       u16 cowork_mask;
> +       u8 cowork_shift;
> +       u32 cowork_val;
> +       u16 in2latch_time_reg;
> +       u16 in2latch_time_mask;
> +       u8 in2latch_time_shift;
> +       u16 pad_top_ck_en_reg;
> +       u16 pad_top_ck_en_mask;
> +       u8 pad_top_ck_en_shift;
> +       u16 master_latch_reg;
> +       u16 master_latch_mask;
> +       u8 master_latch_shift;
> +};
> +
> +static const struct mtk_base_etdm_data mtk_etdm_data[DAI_I2S_NUM] =3D {
> +       [DAI_I2SIN0] =3D {
> +               .enable_reg =3D ETDM_IN0_CON0,
> +               .enable_mask =3D REG_ETDM_IN_EN_MASK,
> +               .enable_shift =3D REG_ETDM_IN_EN_SFT,
> +               .sync_reg =3D ETDM_IN0_CON0,
> +               .sync_mask =3D REG_SYNC_MODE_MASK,
> +               .sync_shift =3D REG_SYNC_MODE_SFT,
> +               .ch_reg =3D ETDM_IN0_CON0,
> +               .ch_mask =3D REG_CH_NUM_MASK,
> +               .ch_shift =3D REG_CH_NUM_SFT,
> +               .ip_mode_reg =3D ETDM_IN0_CON2,
> +               .ip_mode_mask =3D REG_MULTI_IP_MODE_MASK,
> +               .ip_mode_shift =3D REG_MULTI_IP_MODE_SFT,
> +               .init_count_reg =3D ETDM_IN0_CON1,
> +               .init_count_mask =3D REG_INITIAL_COUNT_MASK,
> +               .init_count_shift =3D REG_INITIAL_COUNT_SFT,
> +               .init_point_reg =3D ETDM_IN0_CON1,
> +               .init_point_mask =3D REG_INITIAL_POINT_MASK,
> +               .init_point_shift =3D REG_INITIAL_POINT_SFT,
> +               .lrck_reset_reg =3D ETDM_IN0_CON1,
> +               .lrck_reset_mask =3D REG_LRCK_RESET_MASK,
> +               .lrck_reset_shift =3D REG_LRCK_RESET_SFT,
> +               .clk_source_reg =3D ETDM_IN0_CON2,
> +               .clk_source_mask =3D REG_CLOCK_SOURCE_SEL_MASK,
> +               .clk_source_shift =3D REG_CLOCK_SOURCE_SEL_SFT,
> +               .ck_en_sel_reg =3D ETDM_IN0_CON2,
> +               .ck_en_sel_mask =3D REG_CK_EN_SEL_AUTO_MASK,
> +               .ck_en_sel_shift =3D REG_CK_EN_SEL_AUTO_SFT,
> +               .fs_timing_reg =3D ETDM_IN0_CON3,
> +               .fs_timing_mask =3D REG_FS_TIMING_SEL_MASK,
> +               .fs_timing_shift =3D REG_FS_TIMING_SEL_SFT,
> +               .relatch_en_sel_reg =3D ETDM_IN0_CON4,
> +               .relatch_en_sel_mask =3D REG_RELATCH_1X_EN_SEL_MASK,
> +               .relatch_en_sel_shift =3D REG_RELATCH_1X_EN_SEL_SFT,
> +               .use_afifo_reg =3D ETDM_IN0_CON8,
> +               .use_afifo_mask =3D REG_ETDM_USE_AFIFO_MASK,
> +               .use_afifo_shift =3D REG_ETDM_USE_AFIFO_SFT,
> +               .afifo_mode_reg =3D ETDM_IN0_CON8,
> +               .afifo_mode_mask =3D REG_AFIFO_MODE_MASK,
> +               .afifo_mode_shift =3D REG_AFIFO_MODE_SFT,
> +               .almost_end_ch_reg =3D ETDM_IN0_CON9,
> +               .almost_end_ch_mask =3D REG_ALMOST_END_CH_COUNT_MASK,
> +               .almost_end_ch_shift =3D REG_ALMOST_END_CH_COUNT_SFT,
> +               .almost_end_bit_reg =3D ETDM_IN0_CON9,
> +               .almost_end_bit_mask =3D REG_ALMOST_END_BIT_COUNT_MASK,
> +               .almost_end_bit_shift =3D REG_ALMOST_END_BIT_COUNT_SFT,
> +               .out2latch_time_reg =3D ETDM_IN0_CON9,
> +               .out2latch_time_mask =3D REG_OUT2LATCH_TIME_MASK,
> +               .out2latch_time_shift =3D REG_OUT2LATCH_TIME_SFT,
> +               .tdm_mode_reg =3D ETDM_IN0_CON0,
> +               .tdm_mode_mask =3D REG_FMT_MASK,
> +               .tdm_mode_shift =3D REG_FMT_SFT,
> +               .relatch_domain_sel_reg =3D ETDM_IN0_CON0,
> +               .relatch_domain_sel_mask =3D REG_RELATCH_1X_EN_DOMAIN_SEL=
_MASK,
> +               .relatch_domain_sel_shift =3D REG_RELATCH_1X_EN_DOMAIN_SE=
L_SFT,
> +               .bit_length_reg =3D ETDM_IN0_CON0,
> +               .bit_length_mask =3D REG_BIT_LENGTH_MASK,
> +               .bit_length_shift =3D REG_BIT_LENGTH_SFT,
> +               .word_length_reg =3D ETDM_IN0_CON0,
> +               .word_length_mask =3D REG_WORD_LENGTH_MASK,
> +               .word_length_shift =3D REG_WORD_LENGTH_SFT,
> +               .cowork_reg =3D ETDM_0_3_COWORK_CON0,
> +               .cowork_mask =3D ETDM_IN0_SLAVE_SEL_MASK,
> +               .cowork_shift =3D ETDM_IN0_SLAVE_SEL_SFT,
> +               .cowork_val =3D ETDM_SLAVE_SEL_ETDMOUT0_MASTER,
> +               .pad_top_ck_en_reg =3D 0,
> +               .master_latch_reg =3D 0,
> +       },

Could this be compressed somehow with some macro magic? This whole
block is really long. Something like:

#define MTK_ETDM_DATA(_dir, _id) \
        [DAI_I2S##_dir##_id] =3D {
                    .enable_reg =3D ETDM_##_dir##_id##_CON0, \
                    ...

[...]

Add more parameters as needed.

> +

Drop the extra empty line at the end of the list.

> +};
> +
> +/* lpbk */
> +static const u8 etdm_lpbk_idx_0[] =3D {
> +       0x0, 0x8,
> +};
> +
> +static const u8 etdm_lpbk_idx_1[] =3D {
> +       0x2, 0xa,
> +};
> +
> +static const u8 etdm_lpbk_idx_2[] =3D {
> +       0x4, 0xc,
> +};
> +
> +static const u8 etdm_lpbk_idx_3[] =3D {
> +       0x6, 0xe,
> +};
> +
> +static int etdm_lpbk_get(struct snd_kcontrol *kcontrol,
> +                        struct snd_ctl_elem_value *ucontrol)
> +{
> +       struct snd_soc_component *component =3D
> +               snd_soc_kcontrol_component(kcontrol);
> +       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(compon=
ent);
> +       u32 value;
> +       u32 value_ipmode;
> +       u32 reg;
> +       u32 mask;
> +       u8 shift;
> +
> +       if (!strcmp(kcontrol->id.name, "I2SIN0_LPBK")) {
> +               reg =3D ETDM_0_3_COWORK_CON1;
> +               mask =3D ETDM_IN0_SDATA0_SEL_MASK_SFT;
> +               shift =3D ETDM_IN0_SDATA0_SEL_SFT;
> +       } else if (!strcmp(kcontrol->id.name, "I2SIN1_LPBK")) {
> +               reg =3D ETDM_0_3_COWORK_CON1;
> +               mask =3D ETDM_IN1_SDATA0_SEL_MASK_SFT;
> +               shift =3D ETDM_IN1_SDATA0_SEL_SFT;
> +       } else if (!strcmp(kcontrol->id.name, "I2SIN2_LPBK")) {
> +               reg =3D ETDM_0_3_COWORK_CON3;
> +               mask =3D ETDM_IN2_SDATA0_SEL_MASK_SFT;
> +               shift =3D ETDM_IN2_SDATA0_SEL_SFT;
> +       } else if (!strcmp(kcontrol->id.name, "I2SIN3_LPBK")) {
> +               reg =3D ETDM_0_3_COWORK_CON3;
> +               mask =3D ETDM_IN3_SDATA0_SEL_MASK_SFT;
> +               shift =3D ETDM_IN3_SDATA0_SEL_SFT;
> +       } else if (!strcmp(kcontrol->id.name, "I2SIN4_LPBK")) {
> +               reg =3D ETDM_4_7_COWORK_CON1;
> +
> +               // Get I2SIN4 multi-ip mode
> +               regmap_read(afe->regmap, ETDM_IN4_CON2, &value_ipmode);
> +               value_ipmode =3D FIELD_GET(BIT(31), value_ipmode);
> +
> +               if (value_ipmode) {
> +                       mask =3D ETDM_IN4_SDATA1_15_SEL_MASK_SFT;
> +                       shift =3D ETDM_IN4_SDATA1_15_SEL_SFT;
> +               } else {
> +                       mask =3D ETDM_IN4_SDATA0_SEL_MASK_SFT;
> +                       shift =3D ETDM_IN4_SDATA0_SEL_SFT;
> +               }

It seems to me that only I2S4IN_LPBK needs special handling, while
the others can just use enum map values with the standard ENUM control.
That would simplify the code by a lot, and also get rid of all the
string comparisons.

> +       } else if (!strcmp(kcontrol->id.name, "I2SIN6_LPBK")) {
> +               reg =3D ETDM_4_7_COWORK_CON3;
> +               mask =3D ETDM_IN6_SDATA0_SEL_MASK_SFT;
> +               shift =3D ETDM_IN6_SDATA0_SEL_SFT;
> +       } else {
> +               dev_warn(afe->dev, "i2s lpbk no match\n");
> +               return 0;
> +       }
> +
> +       if (reg)
> +               regmap_read(afe->regmap, reg, &value);
> +       else
> +               value =3D 0;
> +
> +       value &=3D mask;
> +       value >>=3D shift;
> +       ucontrol->value.enumerated.item[0] =3D value;
> +
> +       switch (value) {
> +       case 0x8:
> +       case 0xa:
> +       case 0xc:
> +       case 0xe:
> +               ucontrol->value.enumerated.item[0] =3D 1;
> +               break;
> +       default:
> +               ucontrol->value.enumerated.item[0] =3D 0;
> +               break;
> +       }
> +
> +       return 0;
> +}
> +
> +static int etdm_lpbk_put(struct snd_kcontrol *kcontrol,
> +                        struct snd_ctl_elem_value *ucontrol)
> +{
> +       struct snd_soc_component *component =3D snd_kcontrol_chip(kcontro=
l);

Please use snd_soc_kcontrol_component() as seen in the previous function.
They are effectively the same, but this one is part of the ASoC API.

> +       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(compon=
ent);
> +       u32 value =3D ucontrol->value.integer.value[0];
> +       u32 value_ipmode;
> +       u32 reg;
> +       u32 val;
> +       u32 mask;
> +
> +       if (value >=3D ARRAY_SIZE(etdm_lpbk_idx_0))
> +               return -EINVAL;
> +
> +       if (!strcmp(kcontrol->id.name, "I2SIN0_LPBK")) {
> +               reg =3D ETDM_0_3_COWORK_CON1;
> +               mask =3D ETDM_IN0_SDATA0_SEL_MASK_SFT;
> +               val =3D etdm_lpbk_idx_0[value] << ETDM_IN0_SDATA0_SEL_SFT=
;
> +       } else if (!strcmp(kcontrol->id.name, "I2SIN1_LPBK")) {
> +               reg =3D ETDM_0_3_COWORK_CON1;
> +               mask =3D ETDM_IN1_SDATA0_SEL_MASK_SFT;
> +               val =3D etdm_lpbk_idx_1[value] << ETDM_IN1_SDATA0_SEL_SFT=
;
> +       } else if (!strcmp(kcontrol->id.name, "I2SIN2_LPBK")) {
> +               reg =3D ETDM_0_3_COWORK_CON3;
> +               mask =3D ETDM_IN2_SDATA0_SEL_MASK_SFT;
> +               val =3D etdm_lpbk_idx_2[value] << ETDM_IN2_SDATA0_SEL_SFT=
;
> +       } else if (!strcmp(kcontrol->id.name, "I2SIN3_LPBK")) {
> +               reg =3D ETDM_0_3_COWORK_CON3;
> +               mask =3D ETDM_IN3_SDATA0_SEL_MASK_SFT;
> +               val =3D etdm_lpbk_idx_3[value] << ETDM_IN3_SDATA0_SEL_SFT=
;
> +       } else if (!strcmp(kcontrol->id.name, "I2SIN4_LPBK")) {
> +               reg =3D ETDM_4_7_COWORK_CON1;
> +
> +               // Get I2SIN4 multi-ip mode
> +               regmap_read(afe->regmap, ETDM_IN4_CON2, &value_ipmode);
> +               value_ipmode =3D FIELD_GET(BIT(31), value_ipmode);
> +
> +               if (!value) {
> +                       mask =3D ETDM_IN4_SDATA1_15_SEL_MASK_SFT |
> +                               ETDM_IN4_SDATA0_SEL_MASK_SFT;
> +                       val =3D (etdm_lpbk_idx_0[value] << ETDM_IN4_SDATA=
1_15_SEL_SFT) |
> +                               (etdm_lpbk_idx_0[value] << ETDM_IN4_SDATA=
0_SEL_SFT);
> +               } else if (value_ipmode) {
> +                       mask =3D ETDM_IN4_SDATA1_15_SEL_MASK_SFT;
> +                       val =3D etdm_lpbk_idx_0[value] << ETDM_IN4_SDATA1=
_15_SEL_SFT;
> +               } else {
> +                       mask =3D ETDM_IN4_SDATA0_SEL_MASK_SFT;
> +                       val =3D etdm_lpbk_idx_0[value] << ETDM_IN4_SDATA0=
_SEL_SFT;
> +               }
> +       } else {
> +               reg =3D ETDM_4_7_COWORK_CON3;
> +               mask =3D ETDM_IN6_SDATA0_SEL_MASK_SFT;
> +               val =3D etdm_lpbk_idx_2[value] << ETDM_IN6_SDATA0_SEL_SFT=
;
> +       }
> +
> +       if (reg)
> +               regmap_update_bits(afe->regmap, reg, mask, val);
> +
> +       return 0;
> +}
> +
> +static const char *const etdm_lpbk_map[] =3D {
> +       "Off", "On",
> +};
> +
> +static SOC_ENUM_SINGLE_EXT_DECL(etdm_lpbk_map_enum,
> +                               etdm_lpbk_map);
> +/* lpbk */
> +
> +/* multi-ip mode */
> +static const int etdm_ip_mode_idx[] =3D {
> +       0x0, 0x1,
> +};
> +
> +static int etdm_ip_mode_get(struct snd_kcontrol *kcontrol,
> +                           struct snd_ctl_elem_value *ucontrol)
> +{
> +       struct snd_soc_component *component =3D
> +               snd_soc_kcontrol_component(kcontrol);
> +       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(compon=
ent);
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       struct mtk_afe_i2s_priv *i2sin4_priv =3D afe_priv->dai_priv[MT819=
6_DAI_I2S_IN4];
> +
> +       ucontrol->value.enumerated.item[0] =3D i2sin4_priv->ip_mode;
> +
> +       return 0;
> +}
> +
> +static int etdm_ip_mode_put(struct snd_kcontrol *kcontrol,
> +                           struct snd_ctl_elem_value *ucontrol)
> +{
> +       struct snd_soc_component *component =3D snd_kcontrol_chip(kcontro=
l);

Please use snd_soc_kcontrol_component() as seen in the previous function.
They are effectively the same, but this one is part of the ASoC API.

Please replace any other snd_kcontrol_chip() invocations as well.

> +       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(compon=
ent);
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       struct mtk_afe_i2s_priv *i2sin4_priv =3D afe_priv->dai_priv[MT819=
6_DAI_I2S_IN4];
> +       unsigned int value =3D ucontrol->value.integer.value[0];
> +
> +       if (value >=3D ARRAY_SIZE(etdm_ip_mode_idx))
> +               return -EINVAL;
> +
> +       /* 0: One IP multi-channel 1: Multi-IP 2-channel */
> +       i2sin4_priv->ip_mode =3D etdm_ip_mode_idx[value];
> +
> +       return 0;
> +}
> +
> +static const char *const etdm_ip_mode_map[] =3D {
> +       "Off", "On",
> +};
> +
> +static SOC_ENUM_SINGLE_EXT_DECL(etdm_ip_mode_map_enum,
> +                               etdm_ip_mode_map);

Put it on the same line.

> +/* multi-ip mode */
> +
> +/* ch num */
> +static const int etdm_ch_num_idx[] =3D {
> +       0x2, 0x4, 0x6, 0x8,
> +};
> +
> +static int etdm_ch_num_get(struct snd_kcontrol *kcontrol,
> +                          struct snd_ctl_elem_value *ucontrol)
> +{
> +       struct snd_soc_component *component =3D
> +               snd_soc_kcontrol_component(kcontrol);
> +       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(compon=
ent);
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       struct mtk_afe_i2s_priv *i2sin4_priv =3D afe_priv->dai_priv[MT819=
6_DAI_I2S_IN4];
> +       struct mtk_afe_i2s_priv *i2sout4_priv =3D afe_priv->dai_priv[MT81=
96_DAI_I2S_OUT4];
> +       unsigned int value =3D 0;
> +
> +       if (!strcmp(kcontrol->id.name, "I2SIN4_CH_NUM"))
> +               value =3D i2sin4_priv->ch_num;
> +       else if (!strcmp(kcontrol->id.name, "I2SOUT4_CH_NUM"))
> +               value =3D i2sout4_priv->ch_num;
> +

> +       if (value =3D=3D 0x2)
> +               ucontrol->value.enumerated.item[0] =3D 0;
> +       else if (value =3D=3D 0x4)
> +               ucontrol->value.enumerated.item[0] =3D 1;
> +       else if (value =3D=3D 0x6)
> +               ucontrol->value.enumerated.item[0] =3D 2;
> +       else
> +               ucontrol->value.enumerated.item[0] =3D 3;

Replace the if-else if-else blocks with:

          ucontrol->value.enumerated.item[0] =3D (value >> 1) - 1;

The internal value is controlled by the driver and never goes out of range.

> +
> +       return 0;
> +}
> +
> +static int etdm_ch_num_put(struct snd_kcontrol *kcontrol,
> +                          struct snd_ctl_elem_value *ucontrol)
> +{
> +       struct snd_soc_component *component =3D snd_kcontrol_chip(kcontro=
l);
> +       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(compon=
ent);
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       struct mtk_afe_i2s_priv *i2sin4_priv =3D afe_priv->dai_priv[MT819=
6_DAI_I2S_IN4];
> +       struct mtk_afe_i2s_priv *i2sout4_priv =3D afe_priv->dai_priv[MT81=
96_DAI_I2S_OUT4];
> +       unsigned int value =3D ucontrol->value.integer.value[0];
> +
> +       if (value >=3D ARRAY_SIZE(etdm_ch_num_idx))
> +               return -EINVAL;
> +
> +       if (!strcmp(kcontrol->id.name, "I2SIN4_CH_NUM"))
> +               i2sin4_priv->ch_num =3D etdm_ch_num_idx[value];

                  i2sin4_priv->ch_num =3D (value + 1) << 1;

And then etdm_ch_num_idx can be dropped.

> +       else if (!strcmp(kcontrol->id.name, "I2SOUT4_CH_NUM"))
> +               i2sout4_priv->ch_num =3D etdm_ch_num_idx[value];
> +
> +       return 0;
> +}
> +
> +static const char *const etdm_ch_num_map[] =3D {
> +       "2CH", "4CH", "6CH", "8CH",
> +};
> +
> +static SOC_ENUM_SINGLE_EXT_DECL(etdm_ch_num_map_enum,
> +                               etdm_ch_num_map);
> +/* ch num */
> +
> +enum {
> +       I2S_FMT_EIAJ =3D 0,
> +       I2S_FMT_I2S =3D 1,
> +};
> +
> +enum {
> +       I2S_WLEN_16_BIT =3D 0,
> +       I2S_WLEN_32_BIT =3D 1,
> +};
> +
> +enum {
> +       I2S_HD_NORMAL =3D 0,
> +       I2S_HD_LOW_JITTER =3D 1,
> +};
> +
> +enum {
> +       I2S1_SEL_O28_O29 =3D 0,
> +       I2S1_SEL_O03_O04 =3D 1,
> +};
> +
> +enum {
> +       I2S_IN_PAD_CONNSYS =3D 0,
> +       I2S_IN_PAD_IO_MUX =3D 1,
> +};
> +
> +static unsigned int get_i2s_wlen(snd_pcm_format_t format)
> +{
> +       return snd_pcm_format_physical_width(format) <=3D 16 ?
> +              I2S_WLEN_16_BIT : I2S_WLEN_32_BIT;
> +}
> +
> +#define MTK_AFE_I2SIN0_KCONTROL_NAME "I2SIN0_HD_Mux"
> +#define MTK_AFE_I2SIN1_KCONTROL_NAME "I2SIN1_HD_Mux"
> +#define MTK_AFE_I2SIN2_KCONTROL_NAME "I2SIN2_HD_Mux"
> +#define MTK_AFE_I2SIN4_KCONTROL_NAME "I2SIN4_HD_Mux"
> +#define MTK_AFE_I2SIN6_KCONTROL_NAME "I2SIN6_HD_Mux"
> +#define MTK_AFE_I2SOUT0_KCONTROL_NAME "I2SOUT0_HD_Mux"
> +#define MTK_AFE_I2SOUT1_KCONTROL_NAME "I2SOUT1_HD_Mux"
> +#define MTK_AFE_I2SOUT2_KCONTROL_NAME "I2SOUT2_HD_Mux"
> +#define MTK_AFE_I2SOUT4_KCONTROL_NAME "I2SOUT4_HD_Mux"
> +#define MTK_AFE_I2SOUT6_KCONTROL_NAME "I2SOUT6_HD_Mux"
> +#define MTK_AFE_FMI2S_MASTER_KCONTROL_NAME "FMI2S_MASTER_HD_Mux"
> +
> +#define I2SIN0_HD_EN_W_NAME "I2SIN0_HD_EN"
> +#define I2SIN1_HD_EN_W_NAME "I2SIN1_HD_EN"
> +#define I2SIN2_HD_EN_W_NAME "I2SIN2_HD_EN"
> +#define I2SIN3_HD_EN_W_NAME "I2SIN3_HD_EN"
> +#define I2SIN4_HD_EN_W_NAME "I2SIN4_HD_EN"
> +#define I2SIN6_HD_EN_W_NAME "I2SIN6_HD_EN"
> +#define I2SOUT0_HD_EN_W_NAME "I2SOUT0_HD_EN"
> +#define I2SOUT1_HD_EN_W_NAME "I2SOUT1_HD_EN"
> +#define I2SOUT2_HD_EN_W_NAME "I2SOUT2_HD_EN"
> +#define I2SOUT3_HD_EN_W_NAME "I2SOUT3_HD_EN"
> +#define I2SOUT4_HD_EN_W_NAME "I2SOUT4_HD_EN"
> +#define I2SOUT6_HD_EN_W_NAME "I2SOUT6_HD_EN"
> +#define FMI2S_MASTER_HD_EN_W_NAME "FMI2S_MASTER_HD_EN"
> +
> +#define I2SIN0_MCLK_EN_W_NAME "I2SIN0_MCLK_EN"
> +#define I2SIN1_MCLK_EN_W_NAME "I2SIN1_MCLK_EN"
> +#define I2SIN2_MCLK_EN_W_NAME "I2SIN2_MCLK_EN"
> +#define I2SIN3_MCLK_EN_W_NAME "I2SIN3_MCLK_EN"
> +#define I2SIN4_MCLK_EN_W_NAME "I2SIN4_MCLK_EN"
> +#define I2SIN6_MCLK_EN_W_NAME "I2SIN6_MCLK_EN"
> +#define I2SOUT0_MCLK_EN_W_NAME "I2SOUT0_MCLK_EN"
> +#define I2SOUT1_MCLK_EN_W_NAME "I2SOUT1_MCLK_EN"
> +#define I2SOUT2_MCLK_EN_W_NAME "I2SOUT2_MCLK_EN"
> +#define I2SOUT3_MCLK_EN_W_NAME "I2SOUT3_MCLK_EN"
> +#define I2SOUT4_MCLK_EN_W_NAME "I2SOUT4_MCLK_EN"
> +#define I2SOUT6_MCLK_EN_W_NAME "I2SOUT6_MCLK_EN"
> +#define FMI2S_MASTER_MCLK_EN_W_NAME "FMI2S_MASTER_MCLK_EN"
> +
> +static int get_i2s_id_by_name(struct mtk_base_afe *afe,
> +                             const char *name)
> +{
> +       if (strncmp(name, "I2SIN0", 6) =3D=3D 0)
> +               return MT8196_DAI_I2S_IN0;
> +       else if (strncmp(name, "I2SIN1", 6) =3D=3D 0)
> +               return MT8196_DAI_I2S_IN1;
> +       else if (strncmp(name, "I2SIN2", 6) =3D=3D 0)
> +               return MT8196_DAI_I2S_IN2;
> +       else if (strncmp(name, "I2SIN3", 6) =3D=3D 0)
> +               return MT8196_DAI_I2S_IN3;
> +       else if (strncmp(name, "I2SIN4", 6) =3D=3D 0)
> +               return MT8196_DAI_I2S_IN4;
> +       else if (strncmp(name, "I2SIN6", 6) =3D=3D 0)
> +               return MT8196_DAI_I2S_IN6;
> +       else if (strncmp(name, "I2SOUT0", 7) =3D=3D 0)
> +               return MT8196_DAI_I2S_OUT0;
> +       else if (strncmp(name, "I2SOUT1", 7) =3D=3D 0)
> +               return MT8196_DAI_I2S_OUT1;
> +       else if (strncmp(name, "I2SOUT2", 7) =3D=3D 0)
> +               return MT8196_DAI_I2S_OUT2;
> +       else if (strncmp(name, "I2SOUT3", 7) =3D=3D 0)
> +               return MT8196_DAI_I2S_OUT3;
> +       else if (strncmp(name, "I2SOUT4", 7) =3D=3D 0)
> +               return MT8196_DAI_I2S_OUT4;
> +       else if (strncmp(name, "I2SOUT6", 7) =3D=3D 0)
> +               return MT8196_DAI_I2S_OUT6;
> +       else if (strncmp(name, "FMI2S_MASTER", 12) =3D=3D 0)
> +               return MT8196_DAI_FM_I2S_MASTER;
> +       else
> +               return -EINVAL;
> +}
> +
> +static struct mtk_afe_i2s_priv *get_i2s_priv_by_name(struct mtk_base_afe=
 *afe,
> +                                                    const char *name)
> +{
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       int dai_id =3D get_i2s_id_by_name(afe, name);
> +
> +       if (dai_id < 0)
> +               return NULL;
> +
> +       return afe_priv->dai_priv[dai_id];
> +}
> +
> +/*
> + * bit mask for i2s low power control
> + * such as bit0 for i2s0, bit1 for i2s1...
> + * if set 1, means i2s low power mode
> + * if set 0, means i2s low jitter mode
> + * 0 for all i2s bit in default
> + */
> +static unsigned int i2s_low_power_mask;
> +static int mtk_i2s_low_power_mask_get(struct snd_kcontrol *kcontrol,
> +                                     struct snd_ctl_elem_value *ucontrol=
)
> +{
> +       pr_debug("%s(), mask: %x\n", __func__, i2s_low_power_mask);
> +       ucontrol->value.integer.value[0] =3D i2s_low_power_mask;
> +       return 0;
> +}
> +
> +static int mtk_i2s_low_power_mask_set(struct snd_kcontrol *kcontrol,
> +                                     struct snd_ctl_elem_value *ucontrol=
)
> +{
> +       i2s_low_power_mask =3D ucontrol->value.integer.value[0];
> +       return 0;
> +}
> +
> +static int mtk_is_i2s_low_power(int i2s_num)
> +{
> +       int i2s_bit_shift;
> +
> +       i2s_bit_shift =3D i2s_num - MT8196_DAI_I2S_IN0;
> +       if (i2s_bit_shift < 0 || i2s_bit_shift > MT8196_DAI_I2S_MAX_NUM)
> +               return 0;
> +
> +       return (i2s_low_power_mask >> i2s_bit_shift) & 0x1;
> +}

This doesn't really do anything besides block the HD EN route connection.
Is there supposed to be a matching hardware configuration? I don't
understand the purpose of this control. If it serves no purpose, it
might be better to just remove it.

And I think controls shouldn't be just a bitmask. It's hard for users to
understand what bit map to which interface.

> +/* low jitter control */
> +static const char *const mt8196_i2s_hd_str[] =3D {
> +       "Normal", "Low_Jitter"
> +};
> +
> +static const struct soc_enum mt8196_i2s_enum[] =3D {
> +       SOC_ENUM_SINGLE_EXT(ARRAY_SIZE(mt8196_i2s_hd_str),
> +                           mt8196_i2s_hd_str),
> +};
> +
> +static int mt8196_i2s_hd_get(struct snd_kcontrol *kcontrol,
> +                            struct snd_ctl_elem_value *ucontrol)
> +{
> +       struct snd_soc_component *cmpnt =3D snd_soc_kcontrol_component(kc=
ontrol);
> +       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(cmpnt)=
;
> +       struct mtk_afe_i2s_priv *i2s_priv;
> +
> +       i2s_priv =3D get_i2s_priv_by_name(afe, kcontrol->id.name);
> +
> +       if (!i2s_priv)
> +               return -EINVAL;
> +
> +       ucontrol->value.integer.value[0] =3D i2s_priv->low_jitter_en;
> +
> +       return 0;
> +}
> +
> +static int mt8196_i2s_hd_set(struct snd_kcontrol *kcontrol,
> +                            struct snd_ctl_elem_value *ucontrol)
> +{
> +       struct snd_soc_component *cmpnt =3D snd_soc_kcontrol_component(kc=
ontrol);
> +       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(cmpnt)=
;
> +       struct mtk_afe_i2s_priv *i2s_priv;
> +       struct soc_enum *e =3D (struct soc_enum *)kcontrol->private_value=
;
> +       int hd_en;
> +
> +       if (ucontrol->value.enumerated.item[0] >=3D e->items)
> +               return -EINVAL;
> +
> +       hd_en =3D ucontrol->value.integer.value[0];
> +
> +       dev_dbg(afe->dev, "kcontrol name %s, hd_en %d\n", kcontrol->id.na=
me, hd_en);
> +
> +       i2s_priv =3D get_i2s_priv_by_name(afe, kcontrol->id.name);
> +
> +       if (!i2s_priv)
> +               return -EINVAL;
> +
> +       i2s_priv->low_jitter_en =3D hd_en;
> +
> +       return 0;
> +}
> +
> +static const struct snd_kcontrol_new mtk_dai_i2s_controls[] =3D {
> +       SOC_ENUM_EXT(MTK_AFE_I2SIN0_KCONTROL_NAME, mt8196_i2s_enum[0],
> +                    mt8196_i2s_hd_get, mt8196_i2s_hd_set),
> +       SOC_ENUM_EXT(MTK_AFE_I2SIN1_KCONTROL_NAME, mt8196_i2s_enum[0],
> +                    mt8196_i2s_hd_get, mt8196_i2s_hd_set),
> +       SOC_ENUM_EXT(MTK_AFE_I2SIN2_KCONTROL_NAME, mt8196_i2s_enum[0],
> +                    mt8196_i2s_hd_get, mt8196_i2s_hd_set),
> +       SOC_ENUM_EXT(MTK_AFE_I2SIN4_KCONTROL_NAME, mt8196_i2s_enum[0],
> +                    mt8196_i2s_hd_get, mt8196_i2s_hd_set),
> +       SOC_ENUM_EXT(MTK_AFE_I2SIN6_KCONTROL_NAME, mt8196_i2s_enum[0],
> +                    mt8196_i2s_hd_get, mt8196_i2s_hd_set),
> +       SOC_ENUM_EXT(MTK_AFE_I2SOUT0_KCONTROL_NAME, mt8196_i2s_enum[0],
> +                    mt8196_i2s_hd_get, mt8196_i2s_hd_set),
> +       SOC_ENUM_EXT(MTK_AFE_I2SOUT1_KCONTROL_NAME, mt8196_i2s_enum[0],
> +                    mt8196_i2s_hd_get, mt8196_i2s_hd_set),
> +       SOC_ENUM_EXT(MTK_AFE_I2SOUT2_KCONTROL_NAME, mt8196_i2s_enum[0],
> +                    mt8196_i2s_hd_get, mt8196_i2s_hd_set),
> +       SOC_ENUM_EXT(MTK_AFE_I2SOUT4_KCONTROL_NAME, mt8196_i2s_enum[0],
> +                    mt8196_i2s_hd_get, mt8196_i2s_hd_set),
> +       SOC_ENUM_EXT(MTK_AFE_I2SOUT6_KCONTROL_NAME, mt8196_i2s_enum[0],
> +                    mt8196_i2s_hd_get, mt8196_i2s_hd_set),
> +       SOC_ENUM_EXT(MTK_AFE_FMI2S_MASTER_KCONTROL_NAME, mt8196_i2s_enum[=
0],
> +                    mt8196_i2s_hd_get, mt8196_i2s_hd_set),
> +       SOC_SINGLE_EXT("i2s_low_power_mask", SND_SOC_NOPM, 0, 0xffff, 0,
> +                      mtk_i2s_low_power_mask_get,
> +                      mtk_i2s_low_power_mask_set),
> +
> +       SOC_ENUM_EXT("I2SIN0_LPBK", etdm_lpbk_map_enum,
> +                    etdm_lpbk_get, etdm_lpbk_put),
> +       SOC_ENUM_EXT("I2SIN1_LPBK", etdm_lpbk_map_enum,
> +                    etdm_lpbk_get, etdm_lpbk_put),
> +       SOC_ENUM_EXT("I2SIN2_LPBK", etdm_lpbk_map_enum,
> +                    etdm_lpbk_get, etdm_lpbk_put),
> +       SOC_ENUM_EXT("I2SIN3_LPBK", etdm_lpbk_map_enum,
> +                    etdm_lpbk_get, etdm_lpbk_put),
> +       SOC_ENUM_EXT("I2SIN4_LPBK", etdm_lpbk_map_enum,
> +                    etdm_lpbk_get, etdm_lpbk_put),
> +       SOC_ENUM_EXT("I2SIN6_LPBK", etdm_lpbk_map_enum,
> +                    etdm_lpbk_get, etdm_lpbk_put),

Please use a more sane name for the control. Just call it "I2SINx Loopback"=
.

> +       SOC_ENUM_EXT("I2SIN4_IP_MODE", etdm_ip_mode_map_enum,

I2SIN4 IP mode

> +                    etdm_ip_mode_get, etdm_ip_mode_put),
> +       SOC_ENUM_EXT("I2SIN4_CH_NUM", etdm_ch_num_map_enum,

I2SIN4 # of channels

> +                    etdm_ch_num_get, etdm_ch_num_put),
> +       SOC_ENUM_EXT("I2SOUT4_CH_NUM", etdm_ch_num_map_enum,
> +                    etdm_ch_num_get, etdm_ch_num_put),
> +};
> +
> +/* dai component */
> +/* i2s virtual mux to output widget */
> +static const char *const i2s_mux_map[] =3D {
> +       "Normal", "Dummy_Widget",
> +};

I think this needs some explanation about why a dummy widget actually
exists, or why it is needed.

> +
> +static int i2s_mux_map_value[] =3D {
> +       0, 1,
> +};
> +
> +static SOC_VALUE_ENUM_SINGLE_AUTODISABLE_DECL(i2s_mux_map_enum,
> +               SND_SOC_NOPM,
> +               0,
> +               1,
> +               i2s_mux_map,
> +               i2s_mux_map_value);
> +
> +static const struct snd_kcontrol_new i2s_in0_mux_control =3D
> +       SOC_DAPM_ENUM("I2S IN0 Select", i2s_mux_map_enum);
> +static const struct snd_kcontrol_new i2s_in1_mux_control =3D
> +       SOC_DAPM_ENUM("I2S IN1 Select", i2s_mux_map_enum);
> +static const struct snd_kcontrol_new i2s_in2_mux_control =3D
> +       SOC_DAPM_ENUM("I2S IN2 Select", i2s_mux_map_enum);
> +static const struct snd_kcontrol_new i2s_in3_mux_control =3D
> +       SOC_DAPM_ENUM("I2S IN3 Select", i2s_mux_map_enum);
> +static const struct snd_kcontrol_new i2s_in4_mux_control =3D
> +       SOC_DAPM_ENUM("I2S IN4 Select", i2s_mux_map_enum);
> +static const struct snd_kcontrol_new i2s_in6_mux_control =3D
> +       SOC_DAPM_ENUM("I2S IN6 Select", i2s_mux_map_enum);
> +static const struct snd_kcontrol_new i2s_out0_mux_control =3D
> +       SOC_DAPM_ENUM("I2S OUT0 Select", i2s_mux_map_enum);
> +static const struct snd_kcontrol_new i2s_out1_mux_control =3D
> +       SOC_DAPM_ENUM("I2S OUT1 Select", i2s_mux_map_enum);
> +static const struct snd_kcontrol_new i2s_out2_mux_control =3D
> +       SOC_DAPM_ENUM("I2S OUT2 Select", i2s_mux_map_enum);
> +static const struct snd_kcontrol_new i2s_out3_mux_control =3D
> +       SOC_DAPM_ENUM("I2S OUT3 Select", i2s_mux_map_enum);
> +static const struct snd_kcontrol_new i2s_out4_mux_control =3D
> +       SOC_DAPM_ENUM("I2S OUT4 Select", i2s_mux_map_enum);
> +static const struct snd_kcontrol_new i2s_out6_mux_control =3D
> +       SOC_DAPM_ENUM("I2S OUT6 Select", i2s_mux_map_enum);
> +
> +/* interconnection */
> +static const struct snd_kcontrol_new mtk_i2sout0_ch1_mix[] =3D {
> +       SOC_DAPM_SINGLE_AUTODISABLE("DL0_CH1", AFE_CONN108_1, I_DL0_CH1, =
1, 0),

I think there should be some explanation on why these are "AUTODISABLE".

[...]

> +enum {
> +       SUPPLY_SEQ_APLL,
> +       SUPPLY_SEQ_I2S_MCLK_EN,
> +       SUPPLY_SEQ_I2S_CG_EN,
> +       SUPPLY_SEQ_I2S_HD_EN,
> +       SUPPLY_SEQ_I2S_EN,

I'm not sure why explicit sequencing is needed. The DAPM widgets are
connected in a directed graph, and widgets feeding other widgets are
enabled before the ones that are fed.

If the APLL widget feeds the MCLK widget, and the MCLK widget feeds
the I2S widget, then the APLL is enabled first, then the MCLK, then
the I2S.

> +};
> +
> +static int mtk_i2s_hd_en_event(struct snd_soc_dapm_widget *w,
> +                              struct snd_kcontrol *kcontrol,
> +                              int event)
> +{
> +       struct snd_soc_component *cmpnt =3D snd_soc_dapm_to_component(w->=
dapm);
> +
> +       dev_dbg(cmpnt->dev, "name %s, event 0x%x\n", w->name, event);
> +
> +       return 0;
> +}

This doesn't do anything. Please drop it.

> +
> +static int mtk_apll_event(struct snd_soc_dapm_widget *w,
> +                         struct snd_kcontrol *kcontrol,
> +                         int event)
> +{
> +       struct snd_soc_component *cmpnt =3D snd_soc_dapm_to_component(w->=
dapm);
> +       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(cmpnt)=
;
> +
> +       dev_dbg(cmpnt->dev, "name %s, event 0x%x\n", w->name, event);
> +
> +       switch (event) {
> +       case SND_SOC_DAPM_PRE_PMU:
> +               if (strcmp(w->name, APLL1_W_NAME) =3D=3D 0)
> +                       mt8196_apll1_enable(afe);
> +               else
> +                       mt8196_apll2_enable(afe);
> +               break;
> +       case SND_SOC_DAPM_POST_PMD:
> +               if (strcmp(w->name, APLL1_W_NAME) =3D=3D 0)
> +                       mt8196_apll1_disable(afe);
> +               else
> +                       mt8196_apll2_disable(afe);
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       return 0;
> +}
> +
> +static int mtk_mclk_en_event(struct snd_soc_dapm_widget *w,
> +                            struct snd_kcontrol *kcontrol,
> +                            int event)
> +{
> +       struct snd_soc_component *cmpnt =3D snd_soc_dapm_to_component(w->=
dapm);
> +       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(cmpnt)=
;
> +       struct mtk_afe_i2s_priv *i2s_priv;
> +
> +       dev_dbg(cmpnt->dev, "name %s, event 0x%x\n", w->name, event);
> +
> +       i2s_priv =3D get_i2s_priv_by_name(afe, w->name);
> +
> +       if (!i2s_priv)
> +               return -EINVAL;
> +
> +       switch (event) {
> +       case SND_SOC_DAPM_PRE_PMU:
> +               mt8196_mck_enable(afe, i2s_priv->mclk_id, i2s_priv->mclk_=
rate);
> +               break;
> +       case SND_SOC_DAPM_POST_PMD:
> +               i2s_priv->mclk_rate =3D 0;

I think this shouldn't be reset here. It should be done only in .hwparams
and maybe .close or .shutdown callbacks. I believe it's actually possible
to toggle the interface (and thus the mclk) on and off while the stream
is running.

> +               mt8196_mck_disable(afe, i2s_priv->mclk_id);
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       return 0;
> +}
> +
> +static const struct snd_soc_dapm_widget mtk_dai_i2s_widgets[] =3D {

[...]

> +
> +       /* i2s hd en */
> +       SND_SOC_DAPM_SUPPLY_S(I2SIN0_HD_EN_W_NAME, SUPPLY_SEQ_I2S_HD_EN,
> +                             SND_SOC_NOPM, 0, 0,
> +                             mtk_i2s_hd_en_event,
> +                             SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PM=
D),

As mentioned above, please drop the no-op event. Same for the other *_HD_EN
widgets below.

[...]

> +       /* allow i2s on without codec on */
> +       SND_SOC_DAPM_OUTPUT("I2S_DUMMY_OUT"),
> +       SND_SOC_DAPM_MUX("I2S_OUT0_Mux",
> +                        SND_SOC_NOPM, 0, 0, &i2s_out0_mux_control),
> +       SND_SOC_DAPM_MUX("I2S_OUT1_Mux",
> +                        SND_SOC_NOPM, 0, 0, &i2s_out1_mux_control),
> +       SND_SOC_DAPM_MUX("I2S_OUT2_Mux",
> +                        SND_SOC_NOPM, 0, 0, &i2s_out2_mux_control),
> +       SND_SOC_DAPM_MUX("I2S_OUT3_Mux",
> +                        SND_SOC_NOPM, 0, 0, &i2s_out3_mux_control),
> +       SND_SOC_DAPM_MUX("I2S_OUT4_Mux",
> +                        SND_SOC_NOPM, 0, 0, &i2s_out4_mux_control),
> +       SND_SOC_DAPM_MUX("I2S_OUT6_Mux",
> +                        SND_SOC_NOPM, 0, 0, &i2s_out6_mux_control),
> +
> +       SND_SOC_DAPM_INPUT("I2S_DUMMY_IN"),
> +       SND_SOC_DAPM_MUX("I2S_IN0_Mux",
> +                        SND_SOC_NOPM, 0, 0, &i2s_in0_mux_control),
> +       SND_SOC_DAPM_MUX("I2S_IN1_Mux",
> +                        SND_SOC_NOPM, 0, 0, &i2s_in1_mux_control),
> +       SND_SOC_DAPM_MUX("I2S_IN2_Mux",
> +                        SND_SOC_NOPM, 0, 0, &i2s_in2_mux_control),
> +       SND_SOC_DAPM_MUX("I2S_IN3_Mux",
> +                        SND_SOC_NOPM, 0, 0, &i2s_in3_mux_control),
> +       SND_SOC_DAPM_MUX("I2S_IN4_Mux",
> +                        SND_SOC_NOPM, 0, 0, &i2s_in4_mux_control),
> +       SND_SOC_DAPM_MUX("I2S_IN6_Mux",
> +                        SND_SOC_NOPM, 0, 0, &i2s_in6_mux_control),

Same question about dummy widgets.

> +       SND_SOC_DAPM_MIXER("SOF_DMA_DL_24CH", SND_SOC_NOPM, 0, 0, NULL, 0=
),
> +       SND_SOC_DAPM_MIXER("SOF_DMA_DL1", SND_SOC_NOPM, 0, 0, NULL, 0),

SOF widgets belong in the card/machine driver.

> +};

[...]

> +static const struct snd_soc_dapm_route mtk_dai_i2s_routes[] =3D {

[...]

> +       /* SOF Downlink */
> +       {"I2SOUT4_CH1", "DL_24CH_CH1", "SOF_DMA_DL_24CH"},
> +       {"I2SOUT4_CH2", "DL_24CH_CH2", "SOF_DMA_DL_24CH"},
> +       {"I2SOUT4_CH3", "DL_24CH_CH3", "SOF_DMA_DL_24CH"},
> +       {"I2SOUT4_CH4", "DL_24CH_CH4", "SOF_DMA_DL_24CH"},

SOF widgets and routes belong in the card driver.

[...]

> +       /* SOF Downlink */
> +       {"I2SOUT6_CH1", "DL1_CH1", "SOF_DMA_DL1"},
> +       {"I2SOUT6_CH2", "DL1_CH2", "SOF_DMA_DL1"},
> +       {"I2SOUT6_CH1", "DL_24CH_CH1", "SOF_DMA_DL_24CH"},
> +       {"I2SOUT6_CH2", "DL_24CH_CH2", "SOF_DMA_DL_24CH"},

Same comment about SOF.

[...]

> +       /* allow i2s on without codec on */
> +       {"I2SIN0", NULL, "I2S_IN0_Mux"},
> +       {"I2S_IN0_Mux", "Dummy_Widget", "I2S_DUMMY_IN"},
> +
> +       {"I2SIN1", NULL, "I2S_IN1_Mux"},
> +       {"I2S_IN1_Mux", "Dummy_Widget", "I2S_DUMMY_IN"},
> +
> +       {"I2SIN2", NULL, "I2S_IN2_Mux"},
> +       {"I2S_IN2_Mux", "Dummy_Widget", "I2S_DUMMY_IN"},
> +
> +       {"I2SIN3", NULL, "I2S_IN3_Mux"},
> +       {"I2S_IN3_Mux", "Dummy_Widget", "I2S_DUMMY_IN"},
> +
> +       {"I2SIN4", NULL, "I2S_IN4_Mux"},
> +       {"I2S_IN4_Mux", "Dummy_Widget", "I2S_DUMMY_IN"},
> +
> +       {"I2SIN6", NULL, "I2S_IN6_Mux"},
> +       {"I2S_IN6_Mux", "Dummy_Widget", "I2S_DUMMY_IN"},
> +
> +       {"I2S_OUT0_Mux", "Dummy_Widget", "I2SOUT0"},
> +       {"I2S_DUMMY_OUT", NULL, "I2S_OUT0_Mux"},
> +
> +       {"I2S_OUT1_Mux", "Dummy_Widget", "I2SOUT1"},
> +       {"I2S_DUMMY_OUT", NULL, "I2S_OUT1_Mux"},
> +
> +       {"I2S_OUT2_Mux", "Dummy_Widget", "I2SOUT2"},
> +       {"I2S_DUMMY_OUT", NULL, "I2S_OUT2_Mux"},
> +
> +       {"I2S_OUT3_Mux", "Dummy_Widget", "I2SOUT3"},
> +       {"I2S_DUMMY_OUT", NULL, "I2S_OUT3_Mux"},
> +       {"I2S_OUT4_Mux", "Dummy_Widget", "I2SOUT4"},
> +       {"I2S_DUMMY_OUT", NULL, "I2S_OUT4_Mux"},
> +
> +       {"I2S_OUT6_Mux", "Dummy_Widget", "I2SOUT6"},
> +       {"I2S_DUMMY_OUT", NULL, "I2S_OUT6_Mux"},

Same question about dummy widgets.

> +};
> +
> +/* i2s dai ops*/
> +static int mtk_dai_i2s_config(struct mtk_base_afe *afe,
> +                             struct snd_pcm_hw_params *params,
> +                             int i2s_id)
> +{
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       struct mtk_afe_i2s_priv *i2s_priv;
> +       struct mtk_afe_i2s_priv *i2sin_priv =3D NULL;
> +       int id =3D i2s_id - MT8196_DAI_I2S_IN0;
> +       struct mtk_base_etdm_data etdm_data;
> +       unsigned int rate =3D params_rate(params);
> +       unsigned int rate_reg =3D get_etdm_inconn_rate(rate);
> +       snd_pcm_format_t format =3D params_format(params);
> +       unsigned int channels =3D params_channels(params);
> +       int ret;
> +       unsigned int i2s_con;
> +       int pad_top;
> +
> +       if (i2s_id >=3D MT8196_DAI_NUM || i2s_id < 0 || id < 0 || id >=3D=
 DAI_I2S_NUM)
> +               return -EINVAL;
> +
> +       i2s_priv =3D afe_priv->dai_priv[i2s_id];
> +

Drop the empty line here so that the check immediately follows the assignme=
nt.

> +       if (!i2s_priv)
> +               return -EINVAL;
> +
> +       dev_info(afe->dev, "id: %d, rate: %d, pcm_fmt: %d, fmt: %d, ch: %=
d\n",
> +                i2s_id, rate, format, i2s_priv->format, channels);

Make this debug level.

> +       i2s_priv->rate =3D rate;
> +       etdm_data =3D mtk_etdm_data[id];
> +
> +       if (is_etdm_in_pad_top(id))
> +               pad_top =3D 0x3;
> +       else
> +               pad_top =3D 0x5;
> +
> +       switch (id) {
> +       case DAI_FMI2S_MASTER:
> +               i2s_con =3D I2S_IN_PAD_IO_MUX << I2SIN_PAD_SEL_SFT;
> +               i2s_con |=3D rate_reg << I2S_MODE_SFT;
> +               i2s_con |=3D I2S_FMT_I2S << I2S_FMT_SFT;
> +               i2s_con |=3D get_i2s_wlen(format) << I2S_WLEN_SFT;
> +               regmap_update_bits(afe->regmap, AFE_CONNSYS_I2S_CON,
> +                                  0xffffeffe, i2s_con);
> +               break;

Please add an empty line after the "break" statement to clearly separate
each block. Same for the following blocks.

> +       case DAI_I2SIN0:
> +       case DAI_I2SIN1:
> +       case DAI_I2SIN2:
> +       case DAI_I2SIN3:
> +       case DAI_I2SIN4:
> +       case DAI_I2SIN6:
> +               /* ---etdm in --- */
> +               regmap_update_bits(afe->regmap,
> +                                  etdm_data.init_count_reg,
> +                                  etdm_data.init_count_mask << etdm_data=
.init_count_shift,
> +                                  0x5 << etdm_data.init_count_shift);
> +
> +               /* 3: pad top 5: no pad top */
> +               regmap_update_bits(afe->regmap,
> +                                  etdm_data.init_point_reg,
> +                                  etdm_data.init_point_mask << etdm_data=
.init_point_shift,
> +                                  pad_top << etdm_data.init_point_shift)=
;
> +
> +               regmap_update_bits(afe->regmap,
> +                                  etdm_data.lrck_reset_reg,
> +                                  etdm_data.lrck_reset_mask << etdm_data=
.lrck_reset_shift,
> +                                  0x1 << etdm_data.lrck_reset_shift);
> +
> +               regmap_update_bits(afe->regmap,
> +                                  etdm_data.clk_source_reg,
> +                                  etdm_data.clk_source_mask << etdm_data=
.clk_source_shift,
> +                                  ETDM_CLK_SOURCE_APLL << etdm_data.clk_=
source_shift);
> +
> +               /* 0: manual 1: auto */
> +               regmap_update_bits(afe->regmap,
> +                                  etdm_data.ck_en_sel_reg,
> +                                  etdm_data.ck_en_sel_mask << etdm_data.=
ck_en_sel_shift,
> +                                  0x1 << etdm_data.ck_en_sel_shift);
> +
> +               regmap_update_bits(afe->regmap,
> +                                  etdm_data.fs_timing_reg,
> +                                  etdm_data.fs_timing_mask << etdm_data.=
fs_timing_shift,
> +                                  get_etdm_rate(rate) << etdm_data.fs_ti=
ming_shift);
> +
> +               regmap_update_bits(afe->regmap,
> +                                  etdm_data.relatch_en_sel_reg,
> +                                  etdm_data.relatch_en_sel_mask << etdm_=
data.relatch_en_sel_shift,
> +                                  get_etdm_inconn_rate(rate) << etdm_dat=
a.relatch_en_sel_shift);
> +
> +               regmap_update_bits(afe->regmap,
> +                                  etdm_data.use_afifo_reg,
> +                                  etdm_data.use_afifo_mask << etdm_data.=
use_afifo_shift,
> +                                  0x0);
> +
> +               regmap_update_bits(afe->regmap,
> +                                  etdm_data.afifo_mode_reg,
> +                                  etdm_data.afifo_mode_mask << etdm_data=
.afifo_mode_shift,
> +                                  0x0);
> +
> +               regmap_update_bits(afe->regmap,
> +                                  etdm_data.almost_end_ch_reg,
> +                                  etdm_data.almost_end_ch_mask << etdm_d=
ata.almost_end_ch_shift,
> +                                  0x0);
> +
> +               regmap_update_bits(afe->regmap,
> +                                  etdm_data.almost_end_bit_reg,
> +                                  etdm_data.almost_end_bit_mask << etdm_=
data.almost_end_bit_shift,
> +                                  0x0);
> +
> +               if (is_etdm_in_pad_top(id)) {
> +                       regmap_update_bits(afe->regmap,
> +                                          etdm_data.out2latch_time_reg,
> +                                          etdm_data.out2latch_time_mask =
<<
> +                                          etdm_data.out2latch_time_shift=
,
> +                                          0x6 << etdm_data.out2latch_tim=
e_shift);
> +               } else {
> +                       regmap_update_bits(afe->regmap,
> +                                          etdm_data.out2latch_time_reg,
> +                                          etdm_data.out2latch_time_mask =
<<
> +                                          etdm_data.out2latch_time_shift=
,
> +                                          0x4 << etdm_data.out2latch_tim=
e_shift);
> +               }
> +
> +               if (id =3D=3D DAI_I2SIN4) {
> +                       dev_dbg(afe->dev, "i2sin4, id: %d, fmt: %d, ch: %=
d, ip_mode: %d, sync: %d\n",
> +                               id,
> +                               i2s_priv->format,
> +                               channels,
> +                               i2s_priv->ip_mode,
> +                               i2s_priv->sync);

Put more parameters on one line.

[...]

> +static int mtk_dai_i2s_set_sysclk(struct snd_soc_dai *dai,
> +                                 int clk_id, unsigned int freq, int dir)
> +{
> +       struct mtk_base_afe *afe =3D dev_get_drvdata(dai->dev);
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       struct mtk_afe_i2s_priv *i2s_priv;
> +       int apll;
> +       int apll_rate;
> +
> +       if (dai->id >=3D MT8196_DAI_NUM || dai->id < 0 || dir !=3D SND_SO=
C_CLOCK_OUT)
> +               return -EINVAL;
> +
> +       i2s_priv =3D afe_priv->dai_priv[dai->id];
> +
> +       dev_dbg(afe->dev, "freq: %u\n", freq);
> +

Drop empty line here and make the check below immediately follow
the i2s_priv assignment.

You might want to move the debug trace before the assignment and
make it include more information?

> +       if (!i2s_priv)
> +               return -EINVAL;
> +
> +       apll =3D mt8196_get_apll_by_rate(afe, freq);
> +       apll_rate =3D mt8196_get_apll_rate(afe, apll);
> +
> +       if (freq > apll_rate || apll_rate % freq)
> +               return -EINVAL;
> +
> +       i2s_priv->mclk_rate =3D freq;
> +       i2s_priv->mclk_apll =3D apll;
> +
> +       if (i2s_priv->share_i2s_id > 0) {
> +               struct mtk_afe_i2s_priv *share_i2s_priv;
> +
> +               share_i2s_priv =3D afe_priv->dai_priv[i2s_priv->share_i2s=
_id];
> +               if (!share_i2s_priv)
> +                       return -EINVAL;
> +
> +               share_i2s_priv->mclk_rate =3D i2s_priv->mclk_rate;
> +               share_i2s_priv->mclk_apll =3D i2s_priv->mclk_apll;
> +       }

Add empty line here before final return statement.

> +       return 0;
> +}
> +
> +static int mtk_dai_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt=
)
> +{
> +       struct mtk_base_afe *afe =3D snd_soc_dai_get_drvdata(dai);
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       struct mtk_afe_i2s_priv *i2s_priv;
> +
> +       if (dai->id >=3D MT8196_DAI_NUM || dai->id < 0)
> +               return -EINVAL;
> +
> +       i2s_priv =3D afe_priv->dai_priv[dai->id];
> +

Drop empty line here.

> +       if (!i2s_priv)
> +               return -EINVAL;
> +
> +       dev_dbg(afe->dev, "dai->id: %d, fmt: 0x%x\n", dai->id, fmt);
> +
> +       switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> +       case SND_SOC_DAIFMT_I2S:
> +               i2s_priv->format =3D MTK_DAI_ETDM_FORMAT_I2S;
> +               break;
> +       case SND_SOC_DAIFMT_LEFT_J:
> +               i2s_priv->format =3D MTK_DAI_ETDM_FORMAT_LJ;
> +               break;
> +       case SND_SOC_DAIFMT_RIGHT_J:
> +               i2s_priv->format =3D MTK_DAI_ETDM_FORMAT_RJ;
> +               break;
> +       case SND_SOC_DAIFMT_DSP_A:
> +               i2s_priv->format =3D MTK_DAI_ETDM_FORMAT_DSPA;
> +               break;
> +       case SND_SOC_DAIFMT_DSP_B:
> +               i2s_priv->format =3D MTK_DAI_ETDM_FORMAT_DSPB;
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       dev_dbg(afe->dev, "dai->id: %d, i2s_priv->format: 0x%x\n",
> +               dai->id, i2s_priv->format);

Drop this one. One debug trace is enough.

> +
> +       return 0;
> +}
> +
> +static const struct snd_soc_dai_ops mtk_dai_i2s_ops =3D {
> +       .hw_params =3D mtk_dai_i2s_hw_params,
> +       .set_sysclk =3D mtk_dai_i2s_set_sysclk,
> +       .set_fmt =3D mtk_dai_i2s_set_fmt,
> +};
> +
> +/* dai driver */
> +#define MTK_ETDM_RATES (SNDRV_PCM_RATE_8000_384000)
> +#define MTK_ETDM_FORMATS (SNDRV_PCM_FMTBIT_S8 |\
> +                         SNDRV_PCM_FMTBIT_S16_LE |\
> +                         SNDRV_PCM_FMTBIT_S24_LE |\
> +                         SNDRV_PCM_FMTBIT_S32_LE)
> +
> +#define MT8196_I2S_DAI(_name, _id, max_ch, dir) \
> +{ \
> +       .name =3D #_name, \
> +       .id =3D _id, \
> +       .dir =3D { \
> +               .stream_name =3D #_name, \
> +               .channels_min =3D 1, \
> +               .channels_max =3D max_ch, \
> +               .rates =3D MTK_ETDM_RATES, \
> +               .formats =3D MTK_ETDM_FORMATS, \
> +       }, \
> +       .ops =3D &mtk_dai_i2s_ops, \
> +}
> +
> +static struct snd_soc_dai_driver mtk_dai_i2s_driver[] =3D {
> +       /* capture */
> +       MT8196_I2S_DAI(I2SIN0, MT8196_DAI_I2S_IN0, 2, capture),
> +       MT8196_I2S_DAI(I2SIN1, MT8196_DAI_I2S_IN1, 2, capture),
> +       MT8196_I2S_DAI(I2SIN2, MT8196_DAI_I2S_IN2, 2, capture),
> +       MT8196_I2S_DAI(I2SIN3, MT8196_DAI_I2S_IN3, 2, capture),
> +       MT8196_I2S_DAI(I2SIN4, MT8196_DAI_I2S_IN4, 8, capture),
> +       MT8196_I2S_DAI(I2SIN6, MT8196_DAI_I2S_IN6, 2, capture),
> +       MT8196_I2S_DAI(FMI2S_MASTER, MT8196_DAI_FM_I2S_MASTER, 2, capture=
),
> +       /* playback */
> +       MT8196_I2S_DAI(I2SOUT0, MT8196_DAI_I2S_OUT0, 2, playback),
> +       MT8196_I2S_DAI(I2SOUT1, MT8196_DAI_I2S_OUT1, 2, playback),
> +       MT8196_I2S_DAI(I2SOUT2, MT8196_DAI_I2S_OUT2, 2, playback),
> +       MT8196_I2S_DAI(I2SOUT3, MT8196_DAI_I2S_OUT3, 2, playback),
> +       MT8196_I2S_DAI(I2SOUT4, MT8196_DAI_I2S_OUT4, 8, playback),
> +       MT8196_I2S_DAI(I2SOUT6, MT8196_DAI_I2S_OUT6, 2, playback),
> +};
> +
> +static const struct mtk_afe_i2s_priv mt8196_i2s_priv[DAI_I2S_NUM] =3D {
> +       [DAI_I2SIN0] =3D {
> +               .id =3D MT8196_DAI_I2S_IN0,
> +               .mclk_id =3D MT8196_I2SIN0_MCK,
> +               .share_property_name =3D "i2sin0-share",
> +               .share_i2s_id =3D -1,
> +       },
> +       [DAI_I2SIN1] =3D {
> +               .id =3D MT8196_DAI_I2S_IN1,
> +               .mclk_id =3D MT8196_I2SIN1_MCK,
> +               .share_property_name =3D "i2sin1-share",
> +               .share_i2s_id =3D -1,
> +       },
> +       [DAI_I2SIN2] =3D {
> +               .id =3D MT8196_DAI_I2S_IN2,
> +               .mclk_id =3D MT8196_I2SIN0_MCK,
> +               .share_property_name =3D "i2sin2-share",
> +               .share_i2s_id =3D -1,
> +       },
> +       [DAI_I2SIN3] =3D {
> +               .id =3D MT8196_DAI_I2S_IN3,
> +               .mclk_id =3D MT8196_I2SIN0_MCK,
> +               .share_property_name =3D "i2sin3-share",
> +               .share_i2s_id =3D -1,
> +       },
> +       [DAI_I2SIN4] =3D {
> +               .id =3D MT8196_DAI_I2S_IN4,
> +               .mclk_id =3D MT8196_I2SIN0_MCK,
> +               .share_property_name =3D "i2sin4-share",
> +               .share_i2s_id =3D -1,
> +               .sync =3D 0,
> +               .ip_mode =3D 0,
> +       },
> +       [DAI_I2SIN6] =3D {
> +               .id =3D MT8196_DAI_I2S_IN6,
> +               .mclk_id =3D MT8196_I2SIN0_MCK,
> +               .share_property_name =3D "i2sout6-share",
> +               .share_i2s_id =3D -1,
> +       },
> +       [DAI_I2SOUT0] =3D {
> +               .id =3D MT8196_DAI_I2S_OUT0,
> +               .mclk_id =3D MT8196_I2SIN0_MCK,
> +               .share_property_name =3D "i2sout0-share",
> +               .share_i2s_id =3D MT8196_DAI_I2S_IN0,
> +       },
> +       [DAI_I2SOUT1] =3D {
> +               .id =3D MT8196_DAI_I2S_OUT1,
> +               .mclk_id =3D MT8196_I2SIN1_MCK,
> +               .share_property_name =3D "i2sout1-share",
> +               .share_i2s_id =3D MT8196_DAI_I2S_IN1,
> +       },
> +       [DAI_I2SOUT2] =3D {
> +               .id =3D MT8196_DAI_I2S_OUT2,
> +               .mclk_id =3D MT8196_I2SIN0_MCK,
> +               .share_property_name =3D "i2sout2-share",
> +               .share_i2s_id =3D MT8196_DAI_I2S_IN2,
> +       },
> +       [DAI_I2SOUT3] =3D {
> +               .id =3D MT8196_DAI_I2S_OUT3,
> +               .mclk_id =3D MT8196_I2SIN0_MCK,
> +               .share_property_name =3D "i2sout3-share",
> +               .share_i2s_id =3D MT8196_DAI_I2S_IN3,
> +       },
> +       [DAI_I2SOUT4] =3D {
> +               .id =3D MT8196_DAI_I2S_OUT4,
> +               .mclk_id =3D MT8196_I2SIN0_MCK,
> +               .share_property_name =3D "i2sout4-share",
> +               .share_i2s_id =3D MT8196_DAI_I2S_IN4,
> +               .sync =3D 0,
> +       },
> +       [DAI_I2SOUT6] =3D {
> +               .id =3D MT8196_DAI_I2S_OUT6,
> +               .mclk_id =3D MT8196_I2SIN0_MCK,
> +               .share_property_name =3D "i2sout6-share",
> +               .share_i2s_id =3D MT8196_DAI_I2S_IN6,
> +       },
> +       [DAI_FMI2S_MASTER] =3D {
> +               .id =3D MT8196_DAI_FM_I2S_MASTER,
> +               .mclk_id =3D MT8196_FMI2S_MCK,
> +               .share_property_name =3D "fmi2s-share",
> +               .share_i2s_id =3D -1,
> +       },
> +};
> +
> +static int mt8196_dai_i2s_get_share(struct mtk_base_afe *afe)
> +{
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       const struct device_node *of_node =3D afe->dev->of_node;
> +       const char *of_str;
> +       const char *property_name;
> +       struct mtk_afe_i2s_priv *i2s_priv;

of_str, property_name, and i2s_priv declarations can be moved inside the
loop.

> +       int i;
> +
> +       for (i =3D 0; i < DAI_I2S_NUM; i++) {

Here you can write C99 style, and also use unsigned type for index:

        for (unsigned int i =3D 0; i < DAI_I2S_NUM; i++) {

> +               i2s_priv =3D afe_priv->dai_priv[mt8196_i2s_priv[i].id];
> +               property_name =3D mt8196_i2s_priv[i].share_property_name;
> +               if (of_property_read_string(of_node, property_name, &of_s=
tr))
> +                       continue;
> +               i2s_priv->share_i2s_id =3D get_i2s_id_by_name(afe, of_str=
);
> +       }

Nit: add empty line here.

> +       return 0;
> +}
> +
> +static int init_i2s_priv_data(struct mtk_base_afe *afe)
> +{
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       struct mtk_afe_i2s_priv *i2s_priv;
> +       int size;

Please use size_t for size variable.

> +       int id;

You can move i2s_priv, size, and id declarations inside the loop.

> +       int i;
> +
> +       for (i =3D 0; i < DAI_I2S_NUM; i++) {

Here you can write C99 style, and also use unsigned type for index:

        for (unsigned int i =3D 0; i < DAI_I2S_NUM; i++) {

> +               id =3D mt8196_i2s_priv[i].id;
> +               size =3D sizeof(struct mtk_afe_i2s_priv);
> +
> +               if (id >=3D MT8196_DAI_NUM || id < 0)
> +                       return -EINVAL;
> +
> +               i2s_priv =3D devm_kzalloc(afe->dev, size, GFP_KERNEL);
> +               if (!i2s_priv)
> +                       return -ENOMEM;
> +
> +               memcpy(i2s_priv, &mt8196_i2s_priv[i], size);
> +
> +               afe_priv->dai_priv[id] =3D i2s_priv;
> +       }

Nit: add an empty line here.

> +       return 0;
> +}
> +
> +int mt8196_dai_i2s_register(struct mtk_base_afe *afe)
> +{
> +       struct mtk_base_afe_dai *dai;
> +       int ret;
> +
> +       dai =3D devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
> +       if (!dai)
> +               return -ENOMEM;
> +
> +       list_add(&dai->list, &afe->sub_dais);
> +
> +       dai->dai_drivers =3D mtk_dai_i2s_driver;
> +       dai->num_dai_drivers =3D ARRAY_SIZE(mtk_dai_i2s_driver);
> +
> +       dai->controls =3D mtk_dai_i2s_controls;
> +       dai->num_controls =3D ARRAY_SIZE(mtk_dai_i2s_controls);
> +       dai->dapm_widgets =3D mtk_dai_i2s_widgets;
> +       dai->num_dapm_widgets =3D ARRAY_SIZE(mtk_dai_i2s_widgets);
> +       dai->dapm_routes =3D mtk_dai_i2s_routes;
> +       dai->num_dapm_routes =3D ARRAY_SIZE(mtk_dai_i2s_routes);
> +
> +       /* set all dai i2s private data */
> +       ret =3D init_i2s_priv_data(afe);
> +       if (ret)
> +               return ret;
> +
> +       /* parse share i2s */
> +       ret =3D mt8196_dai_i2s_get_share(afe);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> --
> 2.45.2
>
>

