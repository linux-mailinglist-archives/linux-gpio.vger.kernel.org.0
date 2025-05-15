Return-Path: <linux-gpio+bounces-20219-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D845EAB8178
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 10:52:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 028203A3819
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 08:50:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B9AA288CA8;
	Thu, 15 May 2025 08:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BcSHoCS1"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 495B228C5B8
	for <linux-gpio@vger.kernel.org>; Thu, 15 May 2025 08:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299050; cv=none; b=AUMgSB1m70PANZcJhBu1W+jsIKXtT8hRS4qPyL6B1VBA2+yZzsfiuxOHwQzktNKNq19jIIleeo+GpmFbKhsaCC3rMoou8/HgCm0NlMGTu4TzIGRRYgejlUT2l1Ks3Kqpd7lJ7GzL/FXzylvdKZ3jFZO7m81GkUe7uBXdgqnbMNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299050; c=relaxed/simple;
	bh=Izj5rhooVHmfI6szo6ejWtoCQIeyppNC3Sktbxv2hMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rwIzWSajtK0Er2hyz82bc4Zjzceybq16KE0zYxXd23yfUFSEJZiDaNdaSvqr8LJJnRuI0lpYYkY7tQm4T0SmKrYwrIn5364yfAL53wTVD5Z8I7Taqdk2tEPXi8uqz+HsuHjqpERb9kg+lPf5r48yji/5vsVweOZiSXJ6ED2ZLx8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BcSHoCS1; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-317f68d0dffso8221431fa.2
        for <linux-gpio@vger.kernel.org>; Thu, 15 May 2025 01:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747299045; x=1747903845; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETrFcGOVn8dykq8Hlrt/nnQWW3UgbU4C9dLr5hFwX4s=;
        b=BcSHoCS19OOBkF165mqAJvxo13wrOU6jPOuRtcFepeGZ2cIi3myx+WygTffMupaxkV
         x888XlnRel+H7HD1lI2O2PG0FpboogfQjj9y3qG74yKuHj4QzwLKfpvcxkb576JqohsT
         wTGtAqqGeOx7kBtHgYYTJ3lYVpy5zyx+vSJCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747299045; x=1747903845;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ETrFcGOVn8dykq8Hlrt/nnQWW3UgbU4C9dLr5hFwX4s=;
        b=cVKOsEjU0JBzXjC9WEdBj6QMnkJ0s8RL/1WsAfK7OCCa107/ThGLFGLAbnv5rge4LV
         MjYG4e/Y1KBcpnvFyBJGLz1By5zTW4QSx1HdhtI4A/hQ7AOzPqWHQ8TXsJ21w94DCgRx
         wvGFzMlbLro+J3FRQeeYimSWYO7fOjmayFvWYCKMuJI5sr10T9pLIKeVKuy+gp/RdI1A
         DSbCwKVT58Sm2BV43e8J3QdcwzffM9V1rgKnBFTn4DUSPstic9ty+1ajE3vU+B8rw4vn
         gSeEY/HZmw37zkdAV4sfwoHsHSSlldRn1djPWbxyYusyhHmbkNIHG5dWED5Og5q01Of4
         sI3A==
X-Forwarded-Encrypted: i=1; AJvYcCU8QjZk+LTxQGUp2xmAn+cYZXo1uL9DlFQV68npXwEeVPHgNwk9ABu2R80xenG69jkH6VcZWV1VCSIX@vger.kernel.org
X-Gm-Message-State: AOJu0YyavwvIwPiJrzGT5NGA0r6m9PyFY7FkNYDJfV5KEecOvDt3XJUk
	/FBvVjqAbDLv7iOWAuS6sWVW9eRobGMvCIABksLZPgD1taHgXsLlUCM/YpoO4HXZI87qtjEExvX
	cWvHWpAgNnWYcmLNB8awGGsT0At3Lhksasz7L
X-Gm-Gg: ASbGncu1HwKie/6HBIDT8fn0y+X+RYpQGhUDQZy423dKd6X9IkPvQ7de65Mxhaq1faf
	BDhLZJ+3cRQ2IVGdw9k837DMY05iyiWYrmvnMK+XCm6yXQg7uLrk35sn78+Xs1DVP/HWKUZRhuY
	kMCkiG6lEhhva8Ol0Vj0sEAtcxT+RnUbwwQeEU9Z5dEYQAKP9gnnngBxrVsprofM5LJFviFno=
X-Google-Smtp-Source: AGHT+IGzT9GMa6sQ7RNbvosQ7bf2Z+POIjpLEsnFTR4dAzjK01dA8OBUGTdVUFMOEVcp4R1JF4TSLakLKPMn6UrjTSM=
X-Received: by 2002:a2e:be89:0:b0:30b:d0d5:1fee with SMTP id
 38308e7fff4ca-327ecf64e3dmr27641981fa.0.1747299045162; Thu, 15 May 2025
 01:50:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250514081125.24475-1-darren.ye@mediatek.com>
 <20250514081125.24475-4-darren.ye@mediatek.com> <be75ac83-5421-4bb0-a28a-57be639f427c@collabora.com>
In-Reply-To: <be75ac83-5421-4bb0-a28a-57be639f427c@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 15 May 2025 16:50:33 +0800
X-Gm-Features: AX0GCFt1NtIJu2CaoswanoVIEjAW2DWoyMP5-E8sJorz3919du7pKW8joKPFswo
Message-ID: <CAGXv+5Hj358gOBomY=KdwYojgpwxFP-tiM38Z18b63ie=922mg@mail.gmail.com>
Subject: Re: [PATCH v3 03/10] ASoC: mediatek: mt8196: support audio clock control
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"Darren.Ye" <darren.ye@mediatek.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-sound@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 4:40=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 14/05/25 10:11, Darren.Ye ha scritto:
> > From: Darren Ye <darren.ye@mediatek.com>
> >
> > Add audio clock wrapper and audio tuner control.
> >
> > Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> > ---
> >   sound/soc/mediatek/mt8196/mt8196-afe-clk.c    | 723 +++++++++++++++++=
+
> >   sound/soc/mediatek/mt8196/mt8196-afe-clk.h    | 142 ++++
> >   sound/soc/mediatek/mt8196/mt8196-audsys-clk.c | 252 ++++++
> >   sound/soc/mediatek/mt8196/mt8196-audsys-clk.h |  14 +
> >   .../soc/mediatek/mt8196/mt8196-audsys-clkid.h |  78 ++
> >   5 files changed, 1209 insertions(+)
> >   create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-clk.c
> >   create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-clk.h
> >   create mode 100644 sound/soc/mediatek/mt8196/mt8196-audsys-clk.c
> >   create mode 100644 sound/soc/mediatek/mt8196/mt8196-audsys-clk.h
> >   create mode 100644 sound/soc/mediatek/mt8196/mt8196-audsys-clkid.h
> >
> > diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/med=
iatek/mt8196/mt8196-afe-clk.c
> > new file mode 100644
> > index 000000000000..83b5ee9d30ef
> > --- /dev/null
> > +++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
> > @@ -0,0 +1,723 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + *  mt8196-afe-clk.c  --  Mediatek 8196 afe clock ctrl
>
> mt8196-afe-clk.c - MediaTek MT8196 AFE Clock Control
>
> > + *
> > + *  Copyright (c) 2024 MediaTek Inc.
> > + *  Author: Darren Ye <darren.ye@mediatek.com>
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/regmap.h>
> > +#include <linux/mfd/syscon.h>
> > +#include "mt8196-afe-common.h"
> > +#include "mt8196-audsys-clk.h"
> > +#include "mt8196-afe-clk.h"
> > +
>
> ..snip..
>
> > +
> > +static int mt8196_afe_disable_apll(struct mtk_base_afe *afe)
> > +{
> > +     struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> > +     int ret =3D 0;
> > +
> > +     ret =3D mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_M=
UX_AUDIO_H]);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_M=
UX_AUD_1]);
> > +     if (ret)
> > +             goto clk_ck_mux_aud1_err;
> > +
> > +     ret =3D mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_T=
OP_MUX_AUD_1],
> > +                                     afe_priv->clk[MT8196_CLK_TOP_CLK2=
6M]);
> > +     if (ret)
> > +             goto clk_ck_mux_aud1_parent_err;
> > +
> > +     ret =3D mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_M=
UX_AUD_2]);
> > +     if (ret)
> > +             goto clk_ck_mux_aud2_err;
> > +
> > +     ret =3D mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_T=
OP_MUX_AUD_2],
> > +                                     afe_priv->clk[MT8196_CLK_TOP_CLK2=
6M]);
> > +     if (ret)
> > +             goto clk_ck_mux_aud2_parent_err;
> > +
> > +     mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_=
1]);
> > +     mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_=
2]);
> > +     mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_A=
UDIO_H],
> > +                               afe_priv->clk[MT8196_CLK_VLP_CLK26M]);
> > +     mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDI=
O_H]);
> > +     return 0;
> > +
> > +clk_ck_mux_aud2_parent_err:
> > +     mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_=
2]);
> > +clk_ck_mux_aud2_err:
> > +     mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_A=
UD_1],
> > +                               afe_priv->clk[MT8196_CLK_TOP_APLL1_CK])=
;
> > +clk_ck_mux_aud1_parent_err:
> > +     mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_=
1]);
> > +clk_ck_mux_aud1_err:
> > +     mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDI=
O_H]);
> > +
> > +     return ret;
> > +}
> > +
> > +static void mt8196_afe_apll_init(struct mtk_base_afe *afe)
> > +{
> > +     struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> > +
>
> if (!afe_priv->vlp_clk) {
>         dev_warn...
>         return;
> }
>
> regmap_write......
>
> > +     if (afe_priv->vlp_ck) {
> > +             regmap_write(afe_priv->vlp_ck, VLP_APLL1_TUNER_CON0, VLP_=
APLL1_TUNER_CON0_VALUE);
> > +             regmap_write(afe_priv->vlp_ck, VLP_APLL2_TUNER_CON0, VLP_=
APLL2_TUNER_CON0_VALUE);
> > +     } else {
> > +             dev_warn(afe->dev, "vlp_ck regmap is null ptr\n");
> > +     }
> > +}
> > +
> > +int mt8196_apll1_enable(struct mtk_base_afe *afe)
> > +{
> > +     struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> > +     int ret;
> > +
> > +     /* setting for APLL */
> > +     apll1_mux_setting(afe, true);
> > +
> > +     ret =3D mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_A=
PLL1]);
> > +     if (ret)
> > +             goto ERR_CLK_APLL1;
> > +
> > +     ret =3D mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_A=
PLL_TUNER1]);
> > +     if (ret)
> > +             goto ERR_CLK_APLL1_TUNER;
> > +
> > +     /* sel 44.1kHz:1, apll_div:7, upper bound:3 */
> > +     regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
> > +                        XTAL_EN_128FS_SEL_MASK_SFT | APLL_DIV_MASK_SFT=
 | UPPER_BOUND_MASK_SFT,
> > +                        (0x1 << XTAL_EN_128FS_SEL_SFT) | (7 << APLL_DI=
V_SFT) |
> > +                        (3 << UPPER_BOUND_SFT));
> > +
> > +     /* apll1 freq tuner enable */
> > +     regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
> > +                        FREQ_TUNER_EN_MASK_SFT,
> > +                        0x1 << FREQ_TUNER_EN_SFT);
> > +
> > +     /* audio apll1 on */
> > +     mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_APLL1_EN_ON);
> > +
> > +     return 0;
> > +
> > +ERR_CLK_APLL1_TUNER:
>
> lower case for labels please
>
> > +     mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_APLL_TUN=
ER1]);
> > +ERR_CLK_APLL1:
>
> ^^^^^^^^^
>
> > +     mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_APLL1]);
> > +     return ret;
> > +}
> > +
> > +void mt8196_apll1_disable(struct mtk_base_afe *afe)
> > +{
> > +     struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> > +
> > +     /* audio apll1 off */
> > +     mt8196_afe_disable_top_cg(afe, MT8196_AUDIO_APLL1_EN_ON);
> > +
> > +     /* apll1 freq tuner disable */
> > +     regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
> > +                        FREQ_TUNER_EN_MASK_SFT,
> > +                        0x0);
> > +
> > +     mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_APLL_TUN=
ER1]);
> > +     mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_APLL1]);
> > +     apll1_mux_setting(afe, false);
> > +}
> > +
> > +int mt8196_apll2_enable(struct mtk_base_afe *afe)
> > +{
> > +     struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> > +     int ret;
> > +
> > +     /* setting for APLL */
> > +     apll2_mux_setting(afe, true);
> > +
> > +     ret =3D mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_A=
PLL2]);
> > +     if (ret)
> > +             goto ERR_CLK_APLL2;
> > +
> > +     ret =3D mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_A=
PLL_TUNER2]);
> > +     if (ret)
> > +             goto ERR_CLK_APLL2_TUNER;
> > +
> > +     /* sel 48kHz: 2, apll_div: 7, upper bound: 3*/
> > +     regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
> > +                        XTAL_EN_128FS_SEL_MASK_SFT | APLL_DIV_MASK_SFT=
 | UPPER_BOUND_MASK_SFT,
> > +                        (0x2 << XTAL_EN_128FS_SEL_SFT) | (7 << APLL_DI=
V_SFT) |
> > +                        (3 << UPPER_BOUND_SFT));
> > +
> > +     /* apll2 freq tuner enable */
> > +     regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
> > +                        FREQ_TUNER_EN_MASK_SFT,
> > +                        0x1 << FREQ_TUNER_EN_SFT);
> > +
> > +     /* audio apll2 on */
> > +     mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_APLL2_EN_ON);
> > +     return 0;
> > +
> > +ERR_CLK_APLL2_TUNER:
>
> lower case for labels please
>
> > +     mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_APLL_TUN=
ER2]);
> > +ERR_CLK_APLL2:
>
> ditto
>
> > +     mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_APLL2]);
> > +     return ret;
> > +
> > +     return 0;
> > +}
> > +
> > +void mt8196_apll2_disable(struct mtk_base_afe *afe)
> > +{
> > +     struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> > +
> > +     /* audio apll2 off */
> > +     mt8196_afe_disable_top_cg(afe, MT8196_AUDIO_APLL2_EN_ON);
> > +
> > +     /* apll2 freq tuner disable */
> > +     regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
> > +                        FREQ_TUNER_EN_MASK_SFT,
> > +                        0x0);
> > +
> > +     mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_APLL_TUN=
ER2]);
> > +     mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_APLL2]);
> > +     apll2_mux_setting(afe, false);
> > +}
> > +
> > +int mt8196_get_apll_rate(struct mtk_base_afe *afe, int apll)
> > +{
> > +     struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> > +     int clk_id =3D 0;
> > +
> > +     if (apll < MT8196_APLL1 || apll > MT8196_APLL2) {
> > +             dev_warn(afe->dev, "invalid clk id\n");
>
> ("invalid clk id %d\n", clk_id)
>
> ...otherwise it makes no sense, as it gives no useful information.
> Alternatively, just drop the print.
>
> > +             return 0;
> > +     }
> > +
> > +     if (apll =3D=3D MT8196_APLL1)
> > +             clk_id =3D MT8196_CLK_TOP_APLL1_CK;
> > +     else
> > +             clk_id =3D MT8196_CLK_TOP_APLL2_CK;
> > +
> > +     return clk_get_rate(afe_priv->clk[clk_id]);
> > +}
> > +
> > +int mt8196_get_apll_by_rate(struct mtk_base_afe *afe, int rate)
> > +{
> > +     return ((rate % 8000) =3D=3D 0) ? MT8196_APLL2 : MT8196_APLL1;
>
>         return (rate % 8000) ? MT8196_APLL1 : MT8196_APLL2;
>
> > +}
> > +
> > +int mt8196_get_apll_by_name(struct mtk_base_afe *afe, const char *name=
)
> > +{
> > +     if (strcmp(name, APLL1_W_NAME) =3D=3D 0)
> > +             return MT8196_APLL1;
> > +     else
> > +             return MT8196_APLL2;
>
>         if (strcmp ....)
>                 return MT8196_APLL1;
>
>         return MT8196_APLL2;
>
> > +}
> > +
> > +/* mck */
> > +struct mt8196_mck_div {
> > +     int m_sel_id;
> > +     int div_clk_id;
> > +};
> > +
> > +static const struct mt8196_mck_div mck_div[MT8196_MCK_NUM] =3D {
> > +     [MT8196_I2SIN0_MCK] =3D {
> > +             .m_sel_id =3D MT8196_CLK_TOP_I2SIN0_M_SEL,
> > +             .div_clk_id =3D MT8196_CLK_TOP_APLL12_DIV_I2SIN0,
> > +     },
> > +     [MT8196_I2SIN1_MCK] =3D {
> > +             .m_sel_id =3D MT8196_CLK_TOP_I2SIN1_M_SEL,
> > +             .div_clk_id =3D MT8196_CLK_TOP_APLL12_DIV_I2SIN1,
> > +     },
> > +     [MT8196_FMI2S_MCK] =3D {
> > +             .m_sel_id =3D MT8196_CLK_TOP_FMI2S_M_SEL,
> > +             .div_clk_id =3D MT8196_CLK_TOP_APLL12_DIV_FMI2S,
> > +     },
> > +     [MT8196_TDMOUT_MCK] =3D {
> > +             .m_sel_id =3D MT8196_CLK_TOP_TDMOUT_M_SEL,
> > +             .div_clk_id =3D MT8196_CLK_TOP_APLL12_DIV_TDMOUT_M,
> > +     },
> > +     [MT8196_TDMOUT_BCK] =3D {
> > +             .m_sel_id =3D -1,
> > +             .div_clk_id =3D MT8196_CLK_TOP_APLL12_DIV_TDMOUT_B,
> > +     },
> > +};
> > +
> > +int mt8196_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
> > +{
> > +     struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> > +     int apll =3D mt8196_get_apll_by_rate(afe, rate);
> > +     int apll_clk_id =3D apll =3D=3D MT8196_APLL1 ?
> > +                       MT8196_CLK_TOP_MUX_AUD_1 : MT8196_CLK_TOP_MUX_A=
UD_2;
> > +     int m_sel_id =3D 0;
> > +     int div_clk_id =3D 0;
> > +     int ret =3D 0;
>
> this gives double initialzation of all m_sel_id, div_clk_id and ret as yo=
u are
> initializing the first two immediately after the mck_id check, and ret la=
ter;
> just go for
>
> int m_sel_id, div_clk_id, ret;
>
> or just
>
> int ret;
>
> > +
> > +     dev_dbg(afe->dev, "mck_id: %d, rate: %d\n", mck_id, rate);
> > +
> > +     if (mck_id >=3D MT8196_MCK_NUM || mck_id < 0)
> > +             return -EINVAL;
> > +
> > +     m_sel_id =3D mck_div[mck_id].m_sel_id;
> > +     div_clk_id =3D mck_div[mck_id].div_clk_id;
> > +
> > +     /* select apll */
> > +     if (m_sel_id >=3D 0) {
>
> ...because then I don't understand why don't you just use mck_div[mck_id]=
 directly.
>
>         if (mck_div[mck_id].m_sel_id >=3D 0) {
>
> > +             ret =3D mt8196_afe_enable_clk(afe, afe_priv->clk[m_sel_id=
]);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             ret =3D mt8196_afe_set_clk_parent(afe, afe_priv->clk[m_se=
l_id],
> > +                                             afe_priv->clk[apll_clk_id=
]);
> > +             if (ret)
> > +                     return ret;
> > +     }
> > +
> > +     /* enable div, set rate */
> > +     if (div_clk_id < 0) {
>
> if (mck_div[mck_id].div_clk_id =3D=3D MT8196_CLK_TOP_APLL12_DIV_TDMOUT_B)=
 {
>         rate ...
> } else if (mck_div[mck_id].div_clk_id < 0) {
>         ....
> }
>
>
> > +             dev_err(afe->dev, "invalid div_clk_id %d\n", div_clk_id);
> > +             return -EINVAL;
> > +     }
> > +     if (div_clk_id =3D=3D MT8196_CLK_TOP_APLL12_DIV_TDMOUT_B)
> > +             rate =3D rate * 16;
> > +
> > +     ret =3D mt8196_afe_enable_clk(afe, afe_priv->clk[div_clk_id]);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D mt8196_afe_set_clk_rate(afe, afe_priv->clk[div_clk_id], r=
ate);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return 0;
> > +}
> > +
> > +int mt8196_mck_disable(struct mtk_base_afe *afe, int mck_id)
> > +{
> > +     struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> > +     int m_sel_id =3D 0;
> > +     int div_clk_id =3D 0;
>
> Double init again....
>
> > +
> > +     dev_dbg(afe->dev, "mck_id: %d.\n", mck_id);
> > +
> > +     if (mck_id < 0) {
> > +             dev_err(afe->dev, "mck_id =3D %d < 0\n", mck_id);
> > +             return -EINVAL;
> > +     }
> > +
> > +     m_sel_id =3D mck_div[mck_id].m_sel_id;
> > +     div_clk_id =3D mck_div[mck_id].div_clk_id;
> > +
> > +     if (div_clk_id < 0) {
> > +             dev_err(afe->dev, "div_clk_id =3D %d < 0\n",
> > +                     div_clk_id);
> > +             return -EINVAL;
> > +     }
> > +
> > +     mt8196_afe_disable_clk(afe, afe_priv->clk[div_clk_id]);
> > +
> > +     if (m_sel_id >=3D 0)
> > +             mt8196_afe_disable_clk(afe, afe_priv->clk[m_sel_id]);
> > +
> > +     return 0;
> > +}
> > +
> > +int mt8196_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
> > +{
> > +     struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> > +
> > +     /* bus clock for AFE external access, like DRAM */
> > +     mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_ADSP_SEL]=
);
> > +
> > +     /* bus clock for AFE internal access, like AFE SRAM */
> > +     mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO=
INTBUS]);
> > +     mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_A=
UDIOINTBUS],
> > +                               afe_priv->clk[MT8196_CLK_VLP_CLK26M]);
> > +     /* enable audio vlp clock source */
> > +     mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO=
_H]);
> > +     mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_A=
UDIO_H],
> > +                               afe_priv->clk[MT8196_CLK_VLP_CLK26M]);
> > +
> > +     /* AFE hw clock */
> > +     /* IPM2.0: USE HOPPING & 26M */
> > +     mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_AUDIO_HOP=
PING]);
> > +     mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_AUDIO_F26=
M]);
> > +     return 0;
> > +}
> > +
> > +int mt8196_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
> > +{
> > +     struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> > +
> > +     /* IPM2.0: Use HOPPING & 26M */
> > +     mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_AUDIO_HO=
PPING]);
> > +     mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_AUDIO_F2=
6M]);
> > +     mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_A=
UDIO_H],
> > +                               afe_priv->clk[MT8196_CLK_VLP_CLK26M]);
> > +
> > +     mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDI=
O_H]);
> > +     mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_A=
UDIOINTBUS],
> > +                               afe_priv->clk[MT8196_CLK_VLP_CLK26M]);
> > +     mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDI=
OINTBUS]);
> > +     mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_ADSP_SEL=
]);
> > +     return 0;
> > +}
> > +
> > +int mt8196_afe_enable_main_clock(struct mtk_base_afe *afe)
> > +{
>
> Just directly call
>
>         mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_26M_EN_ON);
>
> ...and drop mt8196_afe_enable_afe_on()
>
> > +     mt8196_afe_enable_afe_on(afe);
> > +     return 0;
> > +}
> > +
> > +int mt8196_afe_disable_main_clock(struct mtk_base_afe *afe)
> > +{
> > +     mt8196_afe_disable_afe_on(afe);
>
> mt8196_afe_disable_top_cg(afe, MT8196_AUDIO_26M_EN_ON);
>
>
> > +     return 0;
> > +}
> > +
> > +int mt8196_init_clock(struct mtk_base_afe *afe)
> > +{
> > +     struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> > +     int ret =3D 0;
> > +     int i =3D 0;
> > +
> > +     ret =3D mt8196_audsys_clk_register(afe);
> > +     if (ret) {
> > +             dev_err(afe->dev, "register audsys clk fail %d\n", ret);
> > +             return ret;
> > +     }
> > +
> > +     afe_priv->clk =3D devm_kcalloc(afe->dev, MT8196_CLK_NUM, sizeof(*=
afe_priv->clk),
> > +                                  GFP_KERNEL);
> > +     if (!afe_priv->clk)
> > +             return -ENOMEM;
> > +
> > +     for (i =3D 0; i < MT8196_CLK_NUM; i++) {
> > +             afe_priv->clk[i] =3D devm_clk_get(afe->dev, aud_clks[i]);
> > +             if (IS_ERR(afe_priv->clk[i])) {
> > +                     dev_err(afe->dev, "devm_clk_get %s fail\n", aud_c=
lks[i]);
> > +                     return PTR_ERR(afe_priv->clk[i]);
> > +             }
> > +     }
> > +
> > +     afe_priv->vlp_ck =3D syscon_regmap_lookup_by_phandle(afe->dev->of=
_node,
> > +                                                        "vlpcksys");
> > +     if (IS_ERR(afe_priv->vlp_ck)) {
> > +             dev_err(afe->dev, "Cannot find vlpcksys\n");
> > +             return PTR_ERR(afe_priv->vlp_ck);
> > +     }
> > +
> > +     mt8196_afe_apll_init(afe);
> > +
> > +     ret =3D mt8196_afe_disable_apll(afe);
> > +     if (ret)
> > +             return ret;
> > +
> > +     return 0;
> > +}
> > +
> > diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.h b/sound/soc/med=
iatek/mt8196/mt8196-afe-clk.h
> > new file mode 100644
> > index 000000000000..60f5e5a157d5
> > --- /dev/null
> > +++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.h
> > @@ -0,0 +1,142 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * mt8196-afe-clk.h  --  Mediatek 8196 afe clock ctrl definition
>
> mt8196-afe-clk.h - MediaTek MT8195 AFE Clock Control definitions
>
> > + *
> > + * Copyright (c) 2024 MediaTek Inc.
> > + *  Author: Darren Ye <darren.ye@mediatek.com>
> > + */
> > +
>
> ..snip..
>
> > diff --git a/sound/soc/mediatek/mt8196/mt8196-audsys-clk.c b/sound/soc/=
mediatek/mt8196/mt8196-audsys-clk.c
> > new file mode 100644
> > index 000000000000..aa40f02698ac
> > --- /dev/null
> > +++ b/sound/soc/mediatek/mt8196/mt8196-audsys-clk.c
> > @@ -0,0 +1,252 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * mt8196-audsys-clk.c  --  MediaTek 8196 audsys clock control
> > + *
> > + * Copyright (c) 2025 MediaTek Inc.
> > + * Author: Darren Ye <darren.ye@mediatek.com>
> > + */
> > +
> > +#include <linux/clk.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/clkdev.h>
> > +#include "mt8196-afe-common.h"
> > +#include "mt8196-audsys-clk.h"
> > +#include "mt8196-audsys-clkid.h"
> > +#include "mt8196-reg.h"
> > +
> ..snip..
>
>
> > +};
> > +
> > +static void mt8196_audsys_clk_unregister(void *data)
> > +{
> > +     struct mtk_base_afe *afe =3D data;
> > +     struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> > +     struct clk *clk;
> > +     struct clk_lookup *cl;
> > +     int i;
> > +
> > +     if (!afe_priv)
> > +             return;
> > +
> > +     for (i =3D 0; i < CLK_AFE_NR_CLK; i++) {
> > +             cl =3D afe_priv->lookup[i];
> > +             if (!cl)
> > +                     continue;
> > +
> > +             clk =3D cl->clk;
> > +             clk_unregister_gate(clk);
> > +
> > +             clkdev_drop(cl);
> > +     }
> > +}
> > +
> > +int mt8196_audsys_clk_register(struct mtk_base_afe *afe)
> > +{
> > +     struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> > +     struct clk *clk;
> > +     struct clk_lookup *cl;
> > +     int i;
> > +
> > +     afe_priv->lookup =3D devm_kcalloc(afe->dev, CLK_AFE_NR_CLK,
> > +                                     sizeof(*afe_priv->lookup),
> > +                                     GFP_KERNEL);
> > +
> > +     if (!afe_priv->lookup)
> > +             return -ENOMEM;
> > +
> > +     for (i =3D 0; i < ARRAY_SIZE(aud_clks); i++) {
> > +             const struct afe_gate *gate =3D &aud_clks[i];
> > +
> > +             clk =3D clk_register_gate(afe->dev, gate->name, gate->par=
ent_name,
> > +                                     gate->flags, afe->base_addr + gat=
e->reg,
> > +                                     gate->bit, gate->cg_flags, NULL);
> > +
> > +             if (IS_ERR(clk)) {
> > +                     dev_err(afe->dev, "Failed to register clk %s: %ld=
\n",
> > +                             gate->name, PTR_ERR(clk));
> > +                     continue;
> > +             }
> > +
>
> All of the above, until...
>
> > +             /* add clk_lookup for devm_clk_get(SND_SOC_DAPM_CLOCK_SUP=
PLY) */
> > +             cl =3D kzalloc(sizeof(*cl), GFP_KERNEL);
> > +             if (!cl)
> > +                     return -ENOMEM;
> > +
> > +             cl->clk =3D clk;
> > +             cl->con_id =3D gate->name;
> > +             cl->dev_id =3D dev_name(afe->dev);
> > +             cl->clk_hw =3D NULL;
> > +             clkdev_add(cl);
>
>
> ...here, can be simplified with a single call to
>
> clk_register_clkdev(clk, gate->name, dev_name(afe->dev))
>
> or alternatively, you could simplify it even more:
>
>
> static void mt8196_audsys_clk_unregister(void *data)
> {
>         /* nothing to do here, remove this function */
> }
>
> int mt8196_audsys_clk_register(struct mtk_base_afe *afe)
> {
>         struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
>         int i, ret;
>
>         for (i =3D 0; i < ARRAY_SIZE(aud_clks); i++) {
>                 const struct afe_gate *gate =3D &aud_clks[i];
>                 struct clk_hw *hw;
>
>                 hw =3D devm_clk_hw_register_gate(afe->dev, gate->name, ga=
te->parent_name,
>                                                gate->flags, afe->base_add=
r + gate->reg,
>                                                gate->bit, gate->cg_flags,=
 NULL);
>                 if (IS_ERR(clk)) {
>                         dev_err(afe->dev, "Failed to register clk %s: %ld=
\n",
>                                 gate->name, PTR_ERR(clk));
>                         continue;
>                 }
>
>                 ret =3D devm_clk_hw_register_clkdev(afe->dev, hw, gate->n=
ame, dev_name(afe->dev));
>                 if (ret)
>                         return ret;
>         }
>
>         return 0;
> }

There is no need to involve the clk subsystem. These are simply supply
gates, be them for power or clks, one per bit. Simply model them as ASoC
supply widgets, add appropriate routes for each so that the dependencies
are correct, and ASoC will deal with them for you. No code is needed,
just descriptions.

_That_ is why I asked for he audio clocks to be integrated into the
AFE driver.

ChenYu

> > +
> > +             afe_priv->lookup[i] =3D cl;
> > +     }
> > +
> > +     return devm_add_action_or_reset(afe->dev, mt8196_audsys_clk_unreg=
ister, afe);
> > +}
>
> Cheers,
> Angelo
>

