Return-Path: <linux-gpio+bounces-23862-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCB3B13948
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Jul 2025 12:53:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 730FA3B0F8F
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Jul 2025 10:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8508224DFF3;
	Mon, 28 Jul 2025 10:53:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="MlLPVjwz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAFC24A07A
	for <linux-gpio@vger.kernel.org>; Mon, 28 Jul 2025 10:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753700017; cv=none; b=ZoS4YbNn4r7lW5Mra+fo4FS5x1d3bGbgnvpQkpXCq6UEKAjnrWNsSIcmEgrn/uAM9jdApjj3BwHAHqTT8LnoJEL3qnUrPpv2g4bvZjG7TWTFmMpEOaHPzER3BAOutFEOiKYdPLF1ZNjnkQ1epz87kNhIBebyPipR40W/Q3BlcEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753700017; c=relaxed/simple;
	bh=m8eCXO3L+8RijsrHYqj+UEAgze044qzMaTyUrpjUTcM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nZa1IvX8Bd2opgnNjr+qm2VIfMjj5wxUSn+tK17qxlvN/4P+hPPe58O/zdvUHCMyoHP2qrwBHCM+80iahSxIIyJPVepqPf+W3PMjHQgFrTWYBUs8C9260qM7MdrpjYffxGTJlRJ66pXsZKdm+I2wpQgufRUDSBWJV//LLPw67ws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=MlLPVjwz; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-55a4befb8ccso4498757e87.2
        for <linux-gpio@vger.kernel.org>; Mon, 28 Jul 2025 03:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753700012; x=1754304812; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xbEcANya7x8dKqNJP5/IXrYIzyujIU66YYTF0gljpjs=;
        b=MlLPVjwzNWE1Iy1UKYfHBo/ZGJbfMiDftiI/xLZjBr58jE6TNTX1Jcr0+pP4iQiVIQ
         GgItA/khV/wBzIm/FY9UoRLgWIDIRR0MjxE6rL1OH0UwCTU7YzNloTIlytD8cvNP4/0a
         QEuhDc5cJqer8d8tTvxXDtDP/LhY6mugbTUmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753700012; x=1754304812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xbEcANya7x8dKqNJP5/IXrYIzyujIU66YYTF0gljpjs=;
        b=NjxoPqefgiafCcLKcHIw3EV7jriIoB1npOms7MnX3+2dO8D0/uDe6QL7dVUjJFEIrh
         irbJtN52Ltx4Cz4YyUxpPCU7Sz+cn0dAi3lJqp8plH7oDwvFZP6rF+Ae+HlyV9+e3CL0
         QuwhUKhmVUD3vEW9gBYi17A9uZC93QZ20FrLzDw39mAPlKyDQ6yIOhkwGn/3BalSAEj4
         XbPaszIskLjjqFtMywuuTv1wfRwdwqka0jFntmcp7giYOyPCrUAxAeooHGqdSXL4FDdW
         DfO3Zp8y17tVyhlgzXec+4bDxlG4td9p1SivTP8WTLXu2ib1qqS+JoVFHcKScQ8DOESx
         pXjw==
X-Forwarded-Encrypted: i=1; AJvYcCX056ngMI8GnBqzZJFL2lG+hARjNrIDvadzCSM/5ZOKqjz9ou3MFmuirWkVxgKyM2g8LqjXwjSjCq9f@vger.kernel.org
X-Gm-Message-State: AOJu0YzmqOZsJru62h9t687PMXT6hFlh+MhqoxSZhD3GiMYtZl++x2EQ
	jYoG6M2StrXsZvm/i50xxzQ9zWj0Lp1vxaJGG/TuqMOYrS/maFb3oomlGMj8Tf9O+gzSex/nFfO
	Oo0ZdsIcsljKp4iOFA3yAfYc4c256AT77rhWx/bQz
X-Gm-Gg: ASbGnctIj3pDQjdespSVY4bhiqcJL7SG0QPIHhTu2ZIxdcwf3aD6JypWI7DtflX9Fik
	KIQIAEjvR6lMFJzO3seR5fzMLcMXIsO04r59zW8FWw+LocSqnOKOB67SNlp9D3XBMT2hbbgVjOb
	Fe8ENz5ZIYw/16B116spHoC/IeR58jGcuaRV/VFX5yjwOi7zBRcHfASdf5tvPhqZAHisD5WSxI6
	GLlH+vMlgz5mo+oUdx5+Ppo8PHqYYBTpg==
X-Google-Smtp-Source: AGHT+IHvOy29bTUO/0MbozHnDCxAoYyhAjTOQPyV1Fm+FaW+g9GHL39FgPBY7JoQtbvS0svu4Ef0/KyvBpPsY8f8YqI=
X-Received: by 2002:a05:6512:3daa:b0:553:2668:6f34 with SMTP id
 2adb3069b0e04-55b5f4aac43mr2816049e87.45.1753700012135; Mon, 28 Jul 2025
 03:53:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250708111806.3992-1-darren.ye@mediatek.com> <20250708111806.3992-7-darren.ye@mediatek.com>
In-Reply-To: <20250708111806.3992-7-darren.ye@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 28 Jul 2025 18:53:20 +0800
X-Gm-Features: Ac12FXw_98P-cqzhOJhc_X0WTP1HZ0X8o93z68BX-_DzENXnnLfNmr1MN89I0kw
Message-ID: <CAGXv+5Ht8dKb_7KSxqj=Pk+V_7h_N_2YPhTfH9Fr=7TxEqwQKQ@mail.gmail.com>
Subject: Re: [PATCH v6 06/10] ASoC: mediatek: mt8196: support TDM in platform driver
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
> Add mt8196 TDM DAI driver support.
>
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> ---
>  sound/soc/mediatek/mt8196/mt8196-dai-tdm.c | 836 +++++++++++++++++++++
>  1 file changed, 836 insertions(+)
>  create mode 100644 sound/soc/mediatek/mt8196/mt8196-dai-tdm.c
>
> diff --git a/sound/soc/mediatek/mt8196/mt8196-dai-tdm.c b/sound/soc/media=
tek/mt8196/mt8196-dai-tdm.c
> new file mode 100644
> index 000000000000..dcbde41fb61c
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8196/mt8196-dai-tdm.c
> @@ -0,0 +1,836 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  MediaTek ALSA SoC Audio DAI TDM Control
> + *
> + *  Copyright (c) 2024 MediaTek Inc.
> + *  Author: Darren Ye <darren.ye@mediatek.com>
> + */
> +
> +#include <linux/regmap.h>
> +#include <sound/pcm_params.h>
> +#include "mt8196-afe-clk.h"
> +#include "mt8196-afe-common.h"
> +#include "mt8196-interconnection.h"
> +
> +struct mtk_afe_tdm_priv {
> +       int bck_id;
> +       int bck_rate;
> +
> +       int mclk_id;
> +       int mclk_multiple; /* according to sample rate */
> +       int mclk_rate;
> +       int mclk_apll;
> +};
> +
> +enum {
> +       TDM_WLEN_16_BIT =3D 1,
> +       TDM_WLEN_32_BIT =3D 2,

I believe this was mentioned in another patch, but consecutive values
do not need to be assigned. Nor does a 0 starting value. I won't mention
this below, but please check all the enums.

> +};
> +
> +enum {
> +       TDM_CHANNEL_BCK_16 =3D 0,
> +       TDM_CHANNEL_BCK_24 =3D 1,
> +       TDM_CHANNEL_BCK_32 =3D 2,
> +};
> +
> +enum {
> +       TDM_CHANNEL_NUM_2 =3D 0,
> +       TDM_CHANNEL_NUM_4 =3D 1,
> +       TDM_CHANNEL_NUM_8 =3D 2,
> +};
> +
> +enum  {
> +       TDM_CH_START_O30_O31 =3D 0,
> +       TDM_CH_START_O32_O33,
> +       TDM_CH_START_O34_O35,
> +       TDM_CH_START_O36_O37,
> +       TDM_CH_ZERO,
> +};
> +
> +enum {
> +       DPTX_CHANNEL_2,
> +       DPTX_CHANNEL_8,
> +};
> +
> +enum {
> +       DPTX_WLEN_24_BIT,
> +       DPTX_WLEN_16_BIT,
> +};
> +
> +enum {
> +       DPTX_CH_EN_MASK_2CH =3D 0x3,
> +       DPTX_CH_EN_MASK_4CH =3D 0xf,
> +       DPTX_CH_EN_MASK_6CH =3D 0x3f,
> +       DPTX_CH_EN_MASK_8CH =3D 0xff,
> +};

I'm not entirely confident, but I think normally we use macros for register
values, and enums for internal / software state values.

> +
> +static unsigned int get_tdm_wlen(snd_pcm_format_t format)
> +{
> +       return snd_pcm_format_physical_width(format) <=3D 16 ?
> +              TDM_WLEN_16_BIT : TDM_WLEN_32_BIT;

Looking at the datasheet, this also supports 8 bit and 24 bit word lengths?

This could just be written as:

         return snd_pcm_format_physical_width(format) / 8;

> +}
> +
> +static unsigned int get_tdm_channel_bck(snd_pcm_format_t format)
> +{
> +       return snd_pcm_format_physical_width(format) <=3D 16 ?
> +              TDM_CHANNEL_BCK_16 : TDM_CHANNEL_BCK_32;

I don't think this is correct. I believe this refers to the TDM slot
width, which is separate from how wide or how many bits are valid in
a given sample. The TDM slot width is something set by the machine
driver by calling snd_soc_dai_set_tdm_slot(), much like calling
snd_soc_dai_set_sysclk().

The TDM driver here needs to implement the .set_tdm_slot callback,
and store the slot width and slots.

This function here should be something like:

    static unsigned int get_tdm_channel_bck(...)
    {
         return tdm_slot_width;
    }

> +}
> +
> +static unsigned int get_tdm_lrck_width(snd_pcm_format_t format)
> +{
> +       return snd_pcm_format_physical_width(format) - 1;

This needs to be multiplied by the number of channels / 2, since
the LRCK spans the entirety of the odd or even number channels.
Also, it should be based on the TDM slot width, not the sample width.

> +}
> +
> +static unsigned int get_tdm_ch(unsigned int ch)
> +{
> +       switch (ch) {
> +       case 1:
> +       case 2:
> +               return TDM_CHANNEL_NUM_2;
> +       case 3:
> +       case 4:
> +               return TDM_CHANNEL_NUM_4;
> +       case 5:
> +       case 6:
> +       case 7:
> +       case 8:
> +       default:
> +               return TDM_CHANNEL_NUM_8;
> +       }
> +}
> +
> +static unsigned int get_dptx_ch_enable_mask(unsigned int ch)
> +{
> +       switch (ch) {
> +       case 1:
> +       case 2:
> +               return DPTX_CH_EN_MASK_2CH;
> +       case 3:
> +       case 4:
> +               return DPTX_CH_EN_MASK_4CH;
> +       case 5:
> +       case 6:
> +               return DPTX_CH_EN_MASK_6CH;
> +       case 7:
> +       case 8:
> +               return DPTX_CH_EN_MASK_8CH;
> +       default:
> +               pr_info("invalid channel num, default use 2ch\n");

Please pass in |struct device *| and use the dev_printk variants.
And maybe consider making this a warning?

Also there is some inconsistency here,

> +               return DPTX_CH_EN_MASK_2CH;
> +       }
> +}
> +
> +static unsigned int get_dptx_ch(unsigned int ch)
> +{
> +       if (ch =3D=3D 2)
> +               return DPTX_CHANNEL_2;
> +       else
> +               return DPTX_CHANNEL_8;
> +}
> +
> +static unsigned int get_dptx_wlen(snd_pcm_format_t format)
> +{
> +       return snd_pcm_format_physical_width(format) <=3D 16 ?
> +              DPTX_WLEN_16_BIT : DPTX_WLEN_24_BIT;
> +}
> +
> +/* interconnection */
> +enum {
> +       HDMI_CONN_CH0 =3D 0,
> +       HDMI_CONN_CH1,
> +       HDMI_CONN_CH2,
> +       HDMI_CONN_CH3,
> +       HDMI_CONN_CH4,
> +       HDMI_CONN_CH5,
> +       HDMI_CONN_CH6,
> +       HDMI_CONN_CH7,
> +};
> +
> +static const char *const hdmi_conn_mux_map[] =3D {
> +       "CH0", "CH1", "CH2", "CH3",
> +       "CH4", "CH5", "CH6", "CH7",

Nit: This could fit in one line.

> +};
> +
> +static int hdmi_conn_mux_map_value[] =3D {
> +       HDMI_CONN_CH0,
> +       HDMI_CONN_CH1,
> +       HDMI_CONN_CH2,
> +       HDMI_CONN_CH3,
> +       HDMI_CONN_CH4,
> +       HDMI_CONN_CH5,
> +       HDMI_CONN_CH6,
> +       HDMI_CONN_CH7,

Nit: You could fit four values on one line.

> +};
> +
> +static SOC_VALUE_ENUM_SINGLE_DECL(hdmi_ch0_mux_map_enum,
> +                                 AFE_HDMI_CONN0,
> +                                 HDMI_O_0_SFT,
> +                                 HDMI_O_0_MASK,
> +                                 hdmi_conn_mux_map,
> +                                 hdmi_conn_mux_map_value);
> +
> +static const struct snd_kcontrol_new hdmi_ch0_mux_control =3D
> +       SOC_DAPM_ENUM("HDMI_CH0_MUX", hdmi_ch0_mux_map_enum);

Please name the controls based on the standard ALSA control name scheme:

    https://docs.kernel.org/sound/designs/control-names.html

This should be something like "HDMI CH0 Source Playback Route". Same
applies to the other ones.

> +
> +static SOC_VALUE_ENUM_SINGLE_DECL(hdmi_ch1_mux_map_enum,
> +                                 AFE_HDMI_CONN0,
> +                                 HDMI_O_1_SFT,
> +                                 HDMI_O_1_MASK,
> +                                 hdmi_conn_mux_map,
> +                                 hdmi_conn_mux_map_value);
> +
> +static const struct snd_kcontrol_new hdmi_ch1_mux_control =3D
> +       SOC_DAPM_ENUM("HDMI_CH1_MUX", hdmi_ch1_mux_map_enum);
> +
> +static SOC_VALUE_ENUM_SINGLE_DECL(hdmi_ch2_mux_map_enum,
> +                                 AFE_HDMI_CONN0,
> +                                 HDMI_O_2_SFT,
> +                                 HDMI_O_2_MASK,
> +                                 hdmi_conn_mux_map,
> +                                 hdmi_conn_mux_map_value);
> +
> +static const struct snd_kcontrol_new hdmi_ch2_mux_control =3D
> +       SOC_DAPM_ENUM("HDMI_CH2_MUX", hdmi_ch2_mux_map_enum);
> +
> +static SOC_VALUE_ENUM_SINGLE_DECL(hdmi_ch3_mux_map_enum,
> +                                 AFE_HDMI_CONN0,
> +                                 HDMI_O_3_SFT,
> +                                 HDMI_O_3_MASK,
> +                                 hdmi_conn_mux_map,
> +                                 hdmi_conn_mux_map_value);
> +
> +static const struct snd_kcontrol_new hdmi_ch3_mux_control =3D
> +       SOC_DAPM_ENUM("HDMI_CH3_MUX", hdmi_ch3_mux_map_enum);
> +
> +static SOC_VALUE_ENUM_SINGLE_DECL(hdmi_ch4_mux_map_enum,
> +                                 AFE_HDMI_CONN0,
> +                                 HDMI_O_4_SFT,
> +                                 HDMI_O_4_MASK,
> +                                 hdmi_conn_mux_map,
> +                                 hdmi_conn_mux_map_value);
> +
> +static const struct snd_kcontrol_new hdmi_ch4_mux_control =3D
> +       SOC_DAPM_ENUM("HDMI_CH4_MUX", hdmi_ch4_mux_map_enum);
> +
> +static SOC_VALUE_ENUM_SINGLE_DECL(hdmi_ch5_mux_map_enum,
> +                                 AFE_HDMI_CONN0,
> +                                 HDMI_O_5_SFT,
> +                                 HDMI_O_5_MASK,
> +                                 hdmi_conn_mux_map,
> +                                 hdmi_conn_mux_map_value);
> +
> +static const struct snd_kcontrol_new hdmi_ch5_mux_control =3D
> +       SOC_DAPM_ENUM("HDMI_CH5_MUX", hdmi_ch5_mux_map_enum);
> +
> +static SOC_VALUE_ENUM_SINGLE_DECL(hdmi_ch6_mux_map_enum,
> +                                 AFE_HDMI_CONN0,
> +                                 HDMI_O_6_SFT,
> +                                 HDMI_O_6_MASK,
> +                                 hdmi_conn_mux_map,
> +                                 hdmi_conn_mux_map_value);
> +
> +static const struct snd_kcontrol_new hdmi_ch6_mux_control =3D
> +       SOC_DAPM_ENUM("HDMI_CH6_MUX", hdmi_ch6_mux_map_enum);
> +
> +static SOC_VALUE_ENUM_SINGLE_DECL(hdmi_ch7_mux_map_enum,
> +                                 AFE_HDMI_CONN0,
> +                                 HDMI_O_7_SFT,
> +                                 HDMI_O_7_MASK,
> +                                 hdmi_conn_mux_map,
> +                                 hdmi_conn_mux_map_value);
> +
> +static const struct snd_kcontrol_new hdmi_ch7_mux_control =3D
> +       SOC_DAPM_ENUM("HDMI_CH7_MUX", hdmi_ch7_mux_map_enum);
> +
> +static const char *const tdm_out_mux_map[] =3D {
> +       "Disconnect", "Connect",
> +};
> +
> +static int tdm_out_mux_map_value[] =3D {
> +       0, 1,
> +};
> +
> +static SOC_VALUE_ENUM_SINGLE_AUTODISABLE_DECL(hdmi_out_mux_map_enum,
> +               SND_SOC_NOPM,
> +               0,
> +               1,
> +               tdm_out_mux_map,
> +               tdm_out_mux_map_value);

Please align with the left parentheses.

> +static const struct snd_kcontrol_new hdmi_out_mux_control =3D
> +       SOC_DAPM_ENUM("HDMI_OUT_MUX", hdmi_out_mux_map_enum);
> +
> +static SOC_VALUE_ENUM_SINGLE_AUTODISABLE_DECL(dptx_out_mux_map_enum,
> +               SND_SOC_NOPM,
> +               0,
> +               1,
> +               tdm_out_mux_map,
> +               tdm_out_mux_map_value);

Same here.

> +static const struct snd_kcontrol_new dptx_out_mux_control =3D
> +       SOC_DAPM_ENUM("DPTX_OUT_MUX", dptx_out_mux_map_enum);
> +
> +static SOC_VALUE_ENUM_SINGLE_AUTODISABLE_DECL(dptx_virtual_out_mux_map_e=
num,
> +               SND_SOC_NOPM,
> +               0,
> +               1,
> +               tdm_out_mux_map,
> +               tdm_out_mux_map_value);

Same here.

> +
> +static const struct snd_kcontrol_new dptx_virtual_out_mux_control =3D
> +       SOC_DAPM_ENUM("DPTX_VIRTUAL_OUT_MUX", dptx_virtual_out_mux_map_en=
um);
> +
> +enum {
> +       SUPPLY_SEQ_APLL,
> +       SUPPLY_SEQ_TDM_MCK_EN,
> +       SUPPLY_SEQ_TDM_BCK_EN,
> +       SUPPLY_SEQ_TDM_DPTX_MCK_EN,
> +       SUPPLY_SEQ_TDM_DPTX_BCK_EN,
> +       SUPPLY_SEQ_TDM_CG_EN,
> +};
> +
> +static int get_tdm_id_by_name(const char *name)
> +{
> +       if (strstr(name, "DPTX"))
> +               return MT8196_DAI_TDM_DPTX;
> +       else
> +               return MT8196_DAI_TDM;
> +}
> +
> +static int mtk_tdm_bck_en_event(struct snd_soc_dapm_widget *w,
> +                               struct snd_kcontrol *kcontrol,
> +                               int event)
> +{
> +       struct snd_soc_component *cmpnt =3D snd_soc_dapm_to_component(w->=
dapm);
> +       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(cmpnt)=
;
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       int dai_id =3D get_tdm_id_by_name(w->name);
> +       struct mtk_afe_tdm_priv *tdm_priv =3D afe_priv->dai_priv[dai_id];
> +
> +       dev_dbg(cmpnt->dev, "name %s, event 0x%x, dai_id %d\n",
> +               w->name, event, dai_id);
> +
> +       switch (event) {
> +       case SND_SOC_DAPM_PRE_PMU:
> +               mt8196_mck_enable(afe, tdm_priv->bck_id, tdm_priv->bck_ra=
te);
> +               break;
> +       case SND_SOC_DAPM_POST_PMD:
> +               mt8196_mck_disable(afe, tdm_priv->bck_id);
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       return 0;
> +}
> +
> +static int mtk_tdm_mck_en_event(struct snd_soc_dapm_widget *w,
> +                               struct snd_kcontrol *kcontrol,
> +                               int event)
> +{
> +       struct snd_soc_component *cmpnt =3D snd_soc_dapm_to_component(w->=
dapm);
> +       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(cmpnt)=
;
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       int dai_id =3D get_tdm_id_by_name(w->name);
> +       struct mtk_afe_tdm_priv *tdm_priv =3D afe_priv->dai_priv[dai_id];
> +
> +       dev_dbg(cmpnt->dev, "name %s, event 0x%x, dai_id %d\n",
> +               w->name, event, dai_id);
> +
> +       switch (event) {
> +       case SND_SOC_DAPM_PRE_PMU:
> +               mt8196_mck_enable(afe, tdm_priv->mclk_id, tdm_priv->mclk_=
rate);
> +               break;
> +       case SND_SOC_DAPM_POST_PMD:
> +               tdm_priv->mclk_rate =3D 0;
> +               mt8196_mck_disable(afe, tdm_priv->mclk_id);
> +               break;
> +       default:
> +               break;
> +       }
> +
> +       return 0;
> +}
> +
> +static const struct snd_soc_dapm_widget mtk_dai_tdm_widgets[] =3D {
> +       SND_SOC_DAPM_MUX("HDMI_CH0_MUX", SND_SOC_NOPM, 0, 0,
> +                        &hdmi_ch0_mux_control),
> +       SND_SOC_DAPM_MUX("HDMI_CH1_MUX", SND_SOC_NOPM, 0, 0,
> +                        &hdmi_ch1_mux_control),
> +       SND_SOC_DAPM_MUX("HDMI_CH2_MUX", SND_SOC_NOPM, 0, 0,
> +                        &hdmi_ch2_mux_control),
> +       SND_SOC_DAPM_MUX("HDMI_CH3_MUX", SND_SOC_NOPM, 0, 0,
> +                        &hdmi_ch3_mux_control),
> +       SND_SOC_DAPM_MUX("HDMI_CH4_MUX", SND_SOC_NOPM, 0, 0,
> +                        &hdmi_ch4_mux_control),
> +       SND_SOC_DAPM_MUX("HDMI_CH5_MUX", SND_SOC_NOPM, 0, 0,
> +                        &hdmi_ch5_mux_control),
> +       SND_SOC_DAPM_MUX("HDMI_CH6_MUX", SND_SOC_NOPM, 0, 0,
> +                        &hdmi_ch6_mux_control),
> +       SND_SOC_DAPM_MUX("HDMI_CH7_MUX", SND_SOC_NOPM, 0, 0,
> +                        &hdmi_ch7_mux_control),

I don't think we really need these widgets. These select which channel
from the input map to which channel on the output. However AFAIK DAPM
doesn't really do multichannel tracking. Also since at least one channel
is getting passed through, the route is always connected and there
really isn't anything for DAPM to manage. Having simple kcontrols
should be enough.

> +       SND_SOC_DAPM_MUX("HDMI_OUT_MUX", SND_SOC_NOPM, 0, 0,

This should be named "HDMI_OUT Playback Route". This changes the kcontrol
name seen in userspace. AFAICT, for muxes and demuxes the userspace kcontro=
l
name comes from the widget, not the underlying kcontrol definition.

> +                        &hdmi_out_mux_control),
> +       SND_SOC_DAPM_MUX("DPTX_OUT_MUX", SND_SOC_NOPM, 0, 0,

This one "DPTX_OUT Playback Route".

> +                        &dptx_out_mux_control),
> +
> +       SND_SOC_DAPM_SUPPLY_S("TDM_BCK", SUPPLY_SEQ_TDM_BCK_EN,
> +                             SND_SOC_NOPM, 0, 0,
> +                             mtk_tdm_bck_en_event,
> +                             SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PM=
D),
> +
> +       SND_SOC_DAPM_SUPPLY_S("TDM_MCK", SUPPLY_SEQ_TDM_MCK_EN,
> +                             SND_SOC_NOPM, 0, 0,
> +                             mtk_tdm_mck_en_event,
> +                             SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PM=
D),
> +
> +       SND_SOC_DAPM_SUPPLY_S("TDM_DPTX_BCK", SUPPLY_SEQ_TDM_DPTX_BCK_EN,
> +                             SND_SOC_NOPM, 0, 0,
> +                             mtk_tdm_bck_en_event,
> +                             SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PM=
D),
> +
> +       SND_SOC_DAPM_SUPPLY_S("TDM_DPTX_MCK", SUPPLY_SEQ_TDM_DPTX_MCK_EN,
> +                             SND_SOC_NOPM, 0, 0,
> +                             mtk_tdm_mck_en_event,
> +                             SND_SOC_DAPM_PRE_PMU | SND_SOC_DAPM_POST_PM=
D),
> +
> +       /* cg */
> +       SND_SOC_DAPM_SUPPLY_S("TDM_CG", SUPPLY_SEQ_TDM_CG_EN,
> +                             AUDIO_TOP_CON2, PDN_TDM_OUT_SFT, 1,
> +                             NULL, 0),
> +
> +       SND_SOC_DAPM_MUX("DPTX_VIRTUAL_OUT_MUX",
> +                        SND_SOC_NOPM, 0, 0, &dptx_virtual_out_mux_contro=
l),

"DPTX_VIRTUAL_OUT Playback Route"

> +       SND_SOC_DAPM_OUTPUT("DPTX_VIRTUAL_OUT"),
> +};
> +
> +static int mtk_afe_tdm_apll_connect(struct snd_soc_dapm_widget *source,
> +                                   struct snd_soc_dapm_widget *sink)
> +{
> +       struct snd_soc_dapm_widget *w =3D sink;
> +       struct snd_soc_component *cmpnt =3D snd_soc_dapm_to_component(w->=
dapm);

Just combine the two? Having the placeholder `w` doesn't help readability.
Instead you could just slightly go over the 80 character limit here.

> +       struct mtk_base_afe *afe =3D snd_soc_component_get_drvdata(cmpnt)=
;
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       int dai_id =3D get_tdm_id_by_name(w->name);
> +       struct mtk_afe_tdm_priv *tdm_priv =3D afe_priv->dai_priv[dai_id];
> +       int cur_apll;
> +
> +       /* which apll */
> +       cur_apll =3D mt8196_get_apll_by_name(afe, source->name);
> +
> +       return (tdm_priv->mclk_apll =3D=3D cur_apll) ? 1 : 0;
> +}
> +
> +static const struct snd_soc_dapm_route mtk_dai_tdm_routes[] =3D {
> +       {"HDMI_CH0_MUX", "CH0", "HDMI"},
> +       {"HDMI_CH0_MUX", "CH1", "HDMI"},
> +       {"HDMI_CH0_MUX", "CH2", "HDMI"},
> +       {"HDMI_CH0_MUX", "CH3", "HDMI"},
> +       {"HDMI_CH0_MUX", "CH4", "HDMI"},
> +       {"HDMI_CH0_MUX", "CH5", "HDMI"},
> +       {"HDMI_CH0_MUX", "CH6", "HDMI"},
> +       {"HDMI_CH0_MUX", "CH7", "HDMI"},
> +
> +       {"HDMI_CH1_MUX", "CH0", "HDMI"},
> +       {"HDMI_CH1_MUX", "CH1", "HDMI"},
> +       {"HDMI_CH1_MUX", "CH2", "HDMI"},
> +       {"HDMI_CH1_MUX", "CH3", "HDMI"},
> +       {"HDMI_CH1_MUX", "CH4", "HDMI"},
> +       {"HDMI_CH1_MUX", "CH5", "HDMI"},
> +       {"HDMI_CH1_MUX", "CH6", "HDMI"},
> +       {"HDMI_CH1_MUX", "CH7", "HDMI"},
> +
> +       {"HDMI_CH2_MUX", "CH0", "HDMI"},
> +       {"HDMI_CH2_MUX", "CH1", "HDMI"},
> +       {"HDMI_CH2_MUX", "CH2", "HDMI"},
> +       {"HDMI_CH2_MUX", "CH3", "HDMI"},
> +       {"HDMI_CH2_MUX", "CH4", "HDMI"},
> +       {"HDMI_CH2_MUX", "CH5", "HDMI"},
> +       {"HDMI_CH2_MUX", "CH6", "HDMI"},
> +       {"HDMI_CH2_MUX", "CH7", "HDMI"},
> +
> +       {"HDMI_CH3_MUX", "CH0", "HDMI"},
> +       {"HDMI_CH3_MUX", "CH1", "HDMI"},
> +       {"HDMI_CH3_MUX", "CH2", "HDMI"},
> +       {"HDMI_CH3_MUX", "CH3", "HDMI"},
> +       {"HDMI_CH3_MUX", "CH4", "HDMI"},
> +       {"HDMI_CH3_MUX", "CH5", "HDMI"},
> +       {"HDMI_CH3_MUX", "CH6", "HDMI"},
> +       {"HDMI_CH3_MUX", "CH7", "HDMI"},
> +
> +       {"HDMI_CH4_MUX", "CH0", "HDMI"},
> +       {"HDMI_CH4_MUX", "CH1", "HDMI"},
> +       {"HDMI_CH4_MUX", "CH2", "HDMI"},
> +       {"HDMI_CH4_MUX", "CH3", "HDMI"},
> +       {"HDMI_CH4_MUX", "CH4", "HDMI"},
> +       {"HDMI_CH4_MUX", "CH5", "HDMI"},
> +       {"HDMI_CH4_MUX", "CH6", "HDMI"},
> +       {"HDMI_CH4_MUX", "CH7", "HDMI"},
> +
> +       {"HDMI_CH5_MUX", "CH0", "HDMI"},
> +       {"HDMI_CH5_MUX", "CH1", "HDMI"},
> +       {"HDMI_CH5_MUX", "CH2", "HDMI"},
> +       {"HDMI_CH5_MUX", "CH3", "HDMI"},
> +       {"HDMI_CH5_MUX", "CH4", "HDMI"},
> +       {"HDMI_CH5_MUX", "CH5", "HDMI"},
> +       {"HDMI_CH5_MUX", "CH6", "HDMI"},
> +       {"HDMI_CH5_MUX", "CH7", "HDMI"},
> +
> +       {"HDMI_CH6_MUX", "CH0", "HDMI"},
> +       {"HDMI_CH6_MUX", "CH1", "HDMI"},
> +       {"HDMI_CH6_MUX", "CH2", "HDMI"},
> +       {"HDMI_CH6_MUX", "CH3", "HDMI"},
> +       {"HDMI_CH6_MUX", "CH4", "HDMI"},
> +       {"HDMI_CH6_MUX", "CH5", "HDMI"},
> +       {"HDMI_CH6_MUX", "CH6", "HDMI"},
> +       {"HDMI_CH6_MUX", "CH7", "HDMI"},
> +
> +       {"HDMI_CH7_MUX", "CH0", "HDMI"},
> +       {"HDMI_CH7_MUX", "CH1", "HDMI"},
> +       {"HDMI_CH7_MUX", "CH2", "HDMI"},
> +       {"HDMI_CH7_MUX", "CH3", "HDMI"},
> +       {"HDMI_CH7_MUX", "CH4", "HDMI"},
> +       {"HDMI_CH7_MUX", "CH5", "HDMI"},
> +       {"HDMI_CH7_MUX", "CH6", "HDMI"},
> +       {"HDMI_CH7_MUX", "CH7", "HDMI"},
> +
> +       {"HDMI_OUT_MUX", "Connect", "HDMI_CH0_MUX"},
> +       {"HDMI_OUT_MUX", "Connect", "HDMI_CH1_MUX"},
> +       {"HDMI_OUT_MUX", "Connect", "HDMI_CH2_MUX"},
> +       {"HDMI_OUT_MUX", "Connect", "HDMI_CH3_MUX"},
> +       {"HDMI_OUT_MUX", "Connect", "HDMI_CH4_MUX"},
> +       {"HDMI_OUT_MUX", "Connect", "HDMI_CH5_MUX"},
> +       {"HDMI_OUT_MUX", "Connect", "HDMI_CH6_MUX"},
> +       {"HDMI_OUT_MUX", "Connect", "HDMI_CH7_MUX"},
> +
> +       {"DPTX_OUT_MUX", "Connect", "HDMI_CH0_MUX"},
> +       {"DPTX_OUT_MUX", "Connect", "HDMI_CH1_MUX"},
> +       {"DPTX_OUT_MUX", "Connect", "HDMI_CH2_MUX"},
> +       {"DPTX_OUT_MUX", "Connect", "HDMI_CH3_MUX"},
> +       {"DPTX_OUT_MUX", "Connect", "HDMI_CH4_MUX"},
> +       {"DPTX_OUT_MUX", "Connect", "HDMI_CH5_MUX"},
> +       {"DPTX_OUT_MUX", "Connect", "HDMI_CH6_MUX"},
> +       {"DPTX_OUT_MUX", "Connect", "HDMI_CH7_MUX"},

As mentioned above the channel mux widgets don't really do anything.
Just use normal kcontrols and the aboue routes can be simplified to just

          { "HDMI_OUT_MUX", "Connect", "HDMI" }
          { "DPTX_OUT_MUX", "Connect", "HDMI" },

Also note that there should be one space between the braces ("{}") and
the elements.

> +       {"TDM", NULL, "HDMI_OUT_MUX"},
> +       {"TDM", NULL, "TDM_BCK"},
> +       {"TDM", NULL, "TDM_CG"},
> +
> +       {"TDM_DPTX", NULL, "DPTX_OUT_MUX"},
> +       {"TDM_DPTX", NULL, "TDM_DPTX_BCK"},
> +       {"TDM_DPTX", NULL, "TDM_CG"},
> +
> +       {"TDM_BCK", NULL, "TDM_MCK"},
> +       {"TDM_DPTX_BCK", NULL, "TDM_DPTX_MCK"},
> +       {"TDM_MCK", NULL, APLL1_W_NAME, mtk_afe_tdm_apll_connect},
> +       {"TDM_MCK", NULL, APLL2_W_NAME, mtk_afe_tdm_apll_connect},
> +       {"TDM_DPTX_MCK", NULL, APLL1_W_NAME, mtk_afe_tdm_apll_connect},
> +       {"TDM_DPTX_MCK", NULL, APLL2_W_NAME, mtk_afe_tdm_apll_connect},
> +
> +       {"DPTX_VIRTUAL_OUT_MUX", "Connect", "TDM_DPTX"},
> +       {"DPTX_VIRTUAL_OUT", NULL, "DPTX_VIRTUAL_OUT_MUX"},
> +};
> +
> +/* dai ops */
> +static int mtk_dai_tdm_cal_mclk(struct mtk_base_afe *afe,
> +                               struct mtk_afe_tdm_priv *tdm_priv,
> +                               int freq)
> +{
> +       int apll;
> +       int apll_rate;
> +
> +       apll =3D mt8196_get_apll_by_rate(afe, freq);
> +       apll_rate =3D mt8196_get_apll_rate(afe, apll);
> +
> +       if (freq > apll_rate)
> +               return -EINVAL;
> +
> +       if (apll_rate % freq !=3D 0)
> +               return -EINVAL;
> +
> +       tdm_priv->mclk_rate =3D freq;
> +       tdm_priv->mclk_apll =3D apll;
> +
> +       return 0;
> +}
> +
> +static int mtk_dai_tdm_hw_params(struct snd_pcm_substream *substream,
> +                                struct snd_pcm_hw_params *params,
> +                                struct snd_soc_dai *dai)
> +{
> +       struct mtk_base_afe *afe =3D snd_soc_dai_get_drvdata(dai);
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       int tdm_id =3D dai->id;
> +       struct mtk_afe_tdm_priv *tdm_priv;
> +       unsigned int rate =3D params_rate(params);
> +       unsigned int channels =3D params_channels(params);
> +       snd_pcm_format_t format =3D params_format(params);
> +       unsigned int tdm_con =3D 0;
> +
> +       if (tdm_id >=3D MT8196_DAI_NUM || tdm_id < 0)
> +               return -EINVAL;
> +
> +       tdm_priv =3D afe_priv->dai_priv[tdm_id];
> +
> +       if (!tdm_priv)
> +               return -EINVAL;
> +
> +       /* calculate mclk_rate, if not set explicitly */
> +       if (!tdm_priv->mclk_rate) {
> +               tdm_priv->mclk_rate =3D rate * tdm_priv->mclk_multiple;
> +               mtk_dai_tdm_cal_mclk(afe,
> +                                    tdm_priv,
> +                                    tdm_priv->mclk_rate);
> +       }
> +
> +       /* calculate bck */
> +       tdm_priv->bck_rate =3D rate *
> +                            channels *
> +                            snd_pcm_format_physical_width(format);
> +
> +       if (tdm_priv->bck_rate > tdm_priv->mclk_rate)
> +               return -EINVAL;
> +
> +       if (tdm_priv->mclk_rate % tdm_priv->bck_rate !=3D 0)
> +               return -EINVAL;
> +
> +       dev_info(afe->dev, "id %d, rate %d, channels %d, format %d, mclk_=
rate %d, bck_rate %d\n",
> +                tdm_id, rate, channels, format,
> +                tdm_priv->mclk_rate, tdm_priv->bck_rate);

Please make this debug level.

> +
> +       /* set tdm */
> +       tdm_con =3D 0 << BCK_INVERSE_SFT;
> +       tdm_con |=3D 0 << LRCK_INVERSE_SFT;
> +       tdm_con |=3D 0 << DELAY_DATA_SFT;
> +       tdm_con |=3D 1 << LEFT_ALIGN_SFT;
> +       tdm_con |=3D get_tdm_wlen(format) << WLEN_SFT;
> +       tdm_con |=3D get_tdm_ch(channels) << CHANNEL_NUM_SFT;
> +       tdm_con |=3D get_tdm_channel_bck(format) << CHANNEL_BCK_CYCLES_SF=
T;
> +       tdm_con |=3D get_tdm_lrck_width(format) << LRCK_TDM_WIDTH_SFT;
> +       regmap_write(afe->regmap, AFE_TDM_CON1, tdm_con);
> +
> +       /* set dptx */
> +       if (tdm_id =3D=3D MT8196_DAI_TDM_DPTX) {
> +               regmap_update_bits(afe->regmap, AFE_DPTX_CON,
> +                                  DPTX_CHANNEL_ENABLE_MASK_SFT,
> +                                  get_dptx_ch_enable_mask(channels) <<
> +                                  DPTX_CHANNEL_ENABLE_SFT);
> +               regmap_update_bits(afe->regmap, AFE_DPTX_CON,
> +                                  DPTX_CHANNEL_NUMBER_MASK_SFT,
> +                                  get_dptx_ch(channels) <<
> +                                  DPTX_CHANNEL_NUMBER_SFT);
> +               regmap_update_bits(afe->regmap, AFE_DPTX_CON,
> +                                  DPTX_16BIT_MASK_SFT,
> +                                  get_dptx_wlen(format) << DPTX_16BIT_SF=
T);
> +       }


> +               switch (channels) {
> +               case 1:
> +               case 2:
> +                       tdm_con =3D TDM_CH_START_O30_O31 << ST_CH_PAIR_SO=
UT0_SFT;
> +                       tdm_con |=3D TDM_CH_ZERO << ST_CH_PAIR_SOUT1_SFT;
> +                       tdm_con |=3D TDM_CH_ZERO << ST_CH_PAIR_SOUT2_SFT;
> +                       tdm_con |=3D TDM_CH_ZERO << ST_CH_PAIR_SOUT3_SFT;
> +                       break;
> +               case 3:
> +               case 4:
> +                       tdm_con =3D TDM_CH_START_O30_O31 << ST_CH_PAIR_SO=
UT0_SFT;
> +                       tdm_con |=3D TDM_CH_START_O32_O33 << ST_CH_PAIR_S=
OUT1_SFT;
> +                       tdm_con |=3D TDM_CH_ZERO << ST_CH_PAIR_SOUT2_SFT;
> +                       tdm_con |=3D TDM_CH_ZERO << ST_CH_PAIR_SOUT3_SFT;
> +                       break;
> +               case 5:
> +               case 6:
> +                       tdm_con =3D TDM_CH_START_O30_O31 << ST_CH_PAIR_SO=
UT0_SFT;
> +                       tdm_con |=3D TDM_CH_START_O32_O33 << ST_CH_PAIR_S=
OUT1_SFT;
> +                       tdm_con |=3D TDM_CH_START_O34_O35 << ST_CH_PAIR_S=
OUT2_SFT;
> +                       tdm_con |=3D TDM_CH_ZERO << ST_CH_PAIR_SOUT3_SFT;
> +                       break;
> +               case 7:
> +               case 8:
> +                       tdm_con =3D TDM_CH_START_O30_O31 << ST_CH_PAIR_SO=
UT0_SFT;
> +                       tdm_con |=3D TDM_CH_START_O32_O33 << ST_CH_PAIR_S=
OUT1_SFT;
> +                       tdm_con |=3D TDM_CH_START_O34_O35 << ST_CH_PAIR_S=
OUT2_SFT;
> +                       tdm_con |=3D TDM_CH_START_O36_O37 << ST_CH_PAIR_S=
OUT3_SFT;
> +                       break;
> +               default:
> +                       tdm_con =3D 0;
> +               }

The indentation for this block is incorrect.

> +       regmap_write(afe->regmap, AFE_TDM_CON2, tdm_con);
> +       regmap_update_bits(afe->regmap, AFE_HDMI_OUT_CON0,
> +                          HDMI_CH_NUM_MASK_SFT,
> +                          channels << HDMI_CH_NUM_SFT);
> +
> +       return 0;
> +}
> +
> +static int mtk_dai_tdm_trigger(struct snd_pcm_substream *substream,
> +                              int cmd,
> +                              struct snd_soc_dai *dai)
> +{
> +       struct mtk_base_afe *afe =3D snd_soc_dai_get_drvdata(dai);
> +       int tdm_id =3D dai->id;
> +
> +       dev_dbg(afe->dev, "cmd %d, tdm_id %d\n", cmd, tdm_id);
> +
> +       switch (cmd) {
> +       case SNDRV_PCM_TRIGGER_START:
> +       case SNDRV_PCM_TRIGGER_RESUME:
> +               /* enable Out control */
> +               regmap_update_bits(afe->regmap, AFE_HDMI_OUT_CON0,
> +                                  HDMI_OUT_ON_MASK_SFT,
> +                                  0x1 << HDMI_OUT_ON_SFT);

This is already controlled from the "HDMI" PCM component driver.
The DAI driver should not touch it.

> +
> +               /* enable dptx */
> +               if (tdm_id =3D=3D MT8196_DAI_TDM_DPTX) {
> +                       regmap_update_bits(afe->regmap, AFE_DPTX_CON,
> +                                          DPTX_ON_MASK_SFT, 0x1 <<
> +                                          DPTX_ON_SFT);
> +               }
> +
> +               /* enable tdm */
> +               regmap_update_bits(afe->regmap, AFE_TDM_CON1,
> +                                  TDM_EN_MASK_SFT, 0x1 << TDM_EN_SFT);
> +               break;
> +       case SNDRV_PCM_TRIGGER_STOP:
> +       case SNDRV_PCM_TRIGGER_SUSPEND:
> +               /* disable tdm */
> +               regmap_update_bits(afe->regmap, AFE_TDM_CON1,
> +                                  TDM_EN_MASK_SFT, 0);
> +
> +               /* disable dptx */
> +               if (tdm_id =3D=3D MT8196_DAI_TDM_DPTX) {
> +                       regmap_update_bits(afe->regmap, AFE_DPTX_CON,
> +                                          DPTX_ON_MASK_SFT, 0);
> +               }
> +
> +               /* disable Out control */
> +               regmap_update_bits(afe->regmap, AFE_HDMI_OUT_CON0,
> +                                  HDMI_OUT_ON_MASK_SFT, 0);
> +               break;
> +       default:
> +               return -EINVAL;
> +       }
> +
> +       return 0;
> +}
> +
> +static int mtk_dai_tdm_set_sysclk(struct snd_soc_dai *dai,
> +                                 int clk_id, unsigned int freq, int dir)
> +{
> +       struct mtk_base_afe *afe =3D dev_get_drvdata(dai->dev);
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       struct mtk_afe_tdm_priv *tdm_priv;
> +
> +       if (dai->id >=3D MT8196_DAI_NUM || dai->id < 0)
> +               return -EINVAL;
> +
> +       tdm_priv =3D afe_priv->dai_priv[dai->id];
> +
> +       if (!tdm_priv)
> +               return -EINVAL;
> +
> +       if (dir !=3D SND_SOC_CLOCK_OUT)
> +               return -EINVAL;
> +
> +       dev_dbg(afe->dev, "freq %d\n", freq);
> +
> +       return mtk_dai_tdm_cal_mclk(afe, tdm_priv, freq);
> +}
> +
> +static const struct snd_soc_dai_ops mtk_dai_tdm_ops =3D {
> +       .hw_params =3D mtk_dai_tdm_hw_params,
> +       .trigger =3D mtk_dai_tdm_trigger,
> +       .set_sysclk =3D mtk_dai_tdm_set_sysclk,
> +};
> +
> +/* dai driver */
> +#define MTK_TDM_RATES (SNDRV_PCM_RATE_8000_48000 |\
> +                      SNDRV_PCM_RATE_88200 |\
> +                      SNDRV_PCM_RATE_96000 |\
> +                      SNDRV_PCM_RATE_176400 |\
> +                      SNDRV_PCM_RATE_192000)
> +
> +#define MTK_TDM_FORMATS (SNDRV_PCM_FMTBIT_S16_LE |\
> +                        SNDRV_PCM_FMTBIT_S24_LE |\
> +                        SNDRV_PCM_FMTBIT_S32_LE)
> +
> +static struct snd_soc_dai_driver mtk_dai_tdm_driver[] =3D {
> +       {
> +               .name =3D "TDM",
> +               .id =3D MT8196_DAI_TDM,
> +               .playback =3D {
> +                       .stream_name =3D "TDM",
> +                       .channels_min =3D 2,
> +                       .channels_max =3D 8,
> +                       .rates =3D MTK_TDM_RATES,
> +                       .formats =3D MTK_TDM_FORMATS,
> +               },
> +               .ops =3D &mtk_dai_tdm_ops,
> +       },
> +       {
> +               .name =3D "TDM_DPTX",
> +               .id =3D MT8196_DAI_TDM_DPTX,
> +               .playback =3D {
> +                       .stream_name =3D "TDM_DPTX",
> +                       .channels_min =3D 2,
> +                       .channels_max =3D 8,
> +                       .rates =3D MTK_TDM_RATES,
> +                       .formats =3D MTK_TDM_FORMATS,
> +               },
> +               .ops =3D &mtk_dai_tdm_ops,
> +       },
> +};
> +
> +static struct mtk_afe_tdm_priv *init_tdm_priv_data(struct mtk_base_afe *=
afe,
> +                                                  int id)
> +{
> +       struct mtk_afe_tdm_priv *tdm_priv;
> +
> +       tdm_priv =3D devm_kzalloc(afe->dev, sizeof(struct mtk_afe_tdm_pri=
v),
> +                               GFP_KERNEL);
> +       if (!tdm_priv)
> +               return NULL;
> +
> +       if (id =3D=3D MT8196_DAI_TDM_DPTX)
> +               tdm_priv->mclk_multiple =3D 256;
> +       else
> +               tdm_priv->mclk_multiple =3D 128;
> +
> +       tdm_priv->bck_id =3D MT8196_TDMOUT_BCK;
> +       tdm_priv->mclk_id =3D MT8196_TDMOUT_MCK;
> +
> +       return tdm_priv;
> +}
> +
> +int mt8196_dai_tdm_register(struct mtk_base_afe *afe)
> +{
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       struct mtk_afe_tdm_priv *tdm_priv, *tdm_dptx_priv;
> +       struct mtk_base_afe_dai *dai;
> +
> +       dai =3D devm_kzalloc(afe->dev, sizeof(*dai), GFP_KERNEL);
> +       if (!dai)
> +               return -ENOMEM;
> +
> +       list_add(&dai->list, &afe->sub_dais);

This should be the final step in this function, after everything has
been initialized correctly.

> +
> +       dai->dai_drivers =3D mtk_dai_tdm_driver;
> +       dai->num_dai_drivers =3D ARRAY_SIZE(mtk_dai_tdm_driver);
> +
> +       dai->dapm_widgets =3D mtk_dai_tdm_widgets;
> +       dai->num_dapm_widgets =3D ARRAY_SIZE(mtk_dai_tdm_widgets);
> +       dai->dapm_routes =3D mtk_dai_tdm_routes;
> +       dai->num_dapm_routes =3D ARRAY_SIZE(mtk_dai_tdm_routes);
> +
> +       tdm_priv =3D init_tdm_priv_data(afe, MT8196_DAI_TDM);
> +       if (!tdm_priv)
> +               return -ENOMEM;

Or you end up with a bad entry in the list here.

> +
> +       tdm_dptx_priv =3D init_tdm_priv_data(afe, MT8196_DAI_TDM_DPTX);
> +       if (!tdm_dptx_priv)
> +               return -ENOMEM;

Or here.


ChenYu

> +
> +       afe_priv->dai_priv[MT8196_DAI_TDM] =3D tdm_priv;
> +       afe_priv->dai_priv[MT8196_DAI_TDM_DPTX] =3D tdm_dptx_priv;
> +
> +       return 0;
> +}
> +
> --
> 2.45.2
>
>

