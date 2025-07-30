Return-Path: <linux-gpio+bounces-23891-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB87B15AD5
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jul 2025 10:43:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52E3D172733
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jul 2025 08:43:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACFE8267F57;
	Wed, 30 Jul 2025 08:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LYxTQhYo"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF21026B751
	for <linux-gpio@vger.kernel.org>; Wed, 30 Jul 2025 08:43:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753864984; cv=none; b=KKEocUfmwDEXzzdZokRuWqWL3nrkP58ZkjNkjxV+VCukAMtnpiy+4j5NNaYV8l6CIMtklsC5bRSjADJ3p8jzBzwF4xy5bg9LRQzVYmuCzS58ZULFJk6Sn26wHJ42SBKt2MXmePu5l8CSY5Oc5p9Wa+M8RAVRYrFyTV/Uwylm1fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753864984; c=relaxed/simple;
	bh=tKy/weuZMwFURtolE7S7wtLRpX8fJL/2tRUWkAL2Ddo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HHjeR4HnSj/9aEvupS6Chbqz8BednD/36LBKjoysNV2KEUXT5XquC9yyX2uu5zue0VfpctmeQzayBYxS25M0OcDgWzYC0F50P85MegseaNM3eY4mwVsgOXZ0UUzPWmSCNzyJh/oSYtK5A2XC26Ct17AjoG7G7XcQOKJ15K15BZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LYxTQhYo; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5561d41fc96so7432055e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 30 Jul 2025 01:43:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753864980; x=1754469780; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RCwMDWtoJ6H58L5kBL4cwqw2CDwhxml2txAA6EJBzFE=;
        b=LYxTQhYoyVMknZpfw+sYc6clY8YtkFhMK7fADyjwPT8ft+Jb65acp9n2jr7dhsPRCA
         amlo26TChbu6Y9yh94+oxptSwBLz7CaYNX0UUHQ94GqcXnNWqhl34vfIrgFaEpkoGQR9
         A8b1oSRcxJPW78qPk6HESBEX/ioYUVvLjclNI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753864980; x=1754469780;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RCwMDWtoJ6H58L5kBL4cwqw2CDwhxml2txAA6EJBzFE=;
        b=rq7zcCJmm1jroc3njva7jkxNTT5fi69d8cSPb6YcKg4hSuBU50c02DgUEQkOBPVUqF
         K7pJS2B9xOgdDUgoxUMcf40S0fMNM4jgw+wXUTzni+GRtG083GEIMQaryf/8LUXWkUIE
         ao2Iz3U5QuFO8L42Wr3U1qi7hbdR8xkhdm7idAdnK70BOuNuus8te6IU6CZL58UvYVAo
         ktPIDQeXAyYDXLEF0lwBsQLG/6l/3GJ4O1DbB8W7HeEm5C5s2z1rFzlP90Y9QmwA3rJI
         EbrQajdI4KmezYNTkec1AYRGrq5GMafRDrs9sY34D4HsCEIANmYav8zk2t8mE2hc5/pb
         Ev7g==
X-Forwarded-Encrypted: i=1; AJvYcCWtV3a6Xxr+NdA6Cvta7iPT+kmTa5pWOQgHVUOmQ4xcjCBvghOYIr/3SuB2PogVV//JG/HFpCJhwIOO@vger.kernel.org
X-Gm-Message-State: AOJu0YxiGy+DSNL+EWjiHj0NjRyheDE185WUHA6iFZD92ec+Qv5bo3t/
	YN3HzjsbhqZzlH8ViLl7O71x4yidQ7dNf05yE0p0S+vXzPjlW00FMt6z2dpf/g520S0pNkdlIxS
	H0eVCewpTkAZ6rLqtFyCUKKS+F5fHjTx/A0jG9jS4
X-Gm-Gg: ASbGncspKMINrghMbA8HLhFfNOxXMbSruAyitijR0TjwDgRioAWi53MJGiMa4skXiPh
	ZAxteiGZrDLEyUFS6I7//hEt9CXgsHn3wdiCcRrvwLAsfnxRCTstfks8AHA3uWXKafhaT19x1Un
	PjYVMnijubUw9r26437GjeS7zaI2+G7GNgUqdAnT8+7u6zd5AZBa2S/FsH3PmKq43bQaZLk6n9L
	+OIh6GMZMtTPR3fkpFTMMWuBXOX35Lv33/Koa2N/2jDhg==
X-Google-Smtp-Source: AGHT+IFB/Ct3suqH0gmQXFJmF6MnUkKOGS1aalcnnOjIUVn4PpqF7DlFLlC9o8DP1JFLZSIwsJwu/Elj6xSVQfUrxg0=
X-Received: by 2002:a05:6512:3d94:b0:551:f0ce:80e3 with SMTP id
 2adb3069b0e04-55b7c04363dmr699933e87.25.1753864979699; Wed, 30 Jul 2025
 01:42:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250708111806.3992-1-darren.ye@mediatek.com> <20250708111806.3992-4-darren.ye@mediatek.com>
In-Reply-To: <20250708111806.3992-4-darren.ye@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 30 Jul 2025 16:42:48 +0800
X-Gm-Features: Ac12FXwg35RUtCHSrQDm77AYEC5EjaDvELreyxlzBmCrHt1OYxQRjmdcvB6QXeE
Message-ID: <CAGXv+5EZ99i74_pTp2wKR1ni28K9fwbqo_67CFXwwiN13DB71w@mail.gmail.com>
Subject: Re: [PATCH v6 03/10] ASoC: mediatek: mt8196: support audio clock control
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
> Add audio clock wrapper and audio tuner control.
>
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> ---
>  sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 728 +++++++++++++++++++++
>  sound/soc/mediatek/mt8196/mt8196-afe-clk.h |  80 +++
>  2 files changed, 808 insertions(+)
>  create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-clk.c
>  create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-clk.h
>
> diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/media=
tek/mt8196/mt8196-afe-clk.c
> new file mode 100644
> index 000000000000..00f47b485812
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
> @@ -0,0 +1,728 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  mt8196-afe-clk.c  --  Mediatek 8196 afe clock ctrl
> + *
> + *  Copyright (c) 2024 MediaTek Inc.
> + *  Author: Darren Ye <darren.ye@mediatek.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>

Please add an empty line here for separation.

> +#include "mt8196-afe-common.h"
> +#include "mt8196-afe-clk.h"
> +
> +static const char *aud_clks[MT8196_CLK_NUM] =3D {
> +       /* vlp clk */
> +       [MT8196_CLK_VLP_MUX_AUDIOINTBUS] =3D "top_aud_intbus",
> +       [MT8196_CLK_VLP_MUX_AUD_ENG1] =3D "top_aud_eng1",
> +       [MT8196_CLK_VLP_MUX_AUD_ENG2] =3D "top_aud_eng2",
> +       [MT8196_CLK_VLP_MUX_AUDIO_H] =3D "top_aud_h",
> +       [MT8196_CLK_VLP_CLK26M] =3D "vlp_clk26m",
> +       /* pll */
> +       [MT8196_CLK_TOP_APLL1_CK] =3D "apll1",
> +       [MT8196_CLK_TOP_APLL2_CK] =3D "apll2",
> +       /* divider */
> +       [MT8196_CLK_TOP_APLL1_D4] =3D "apll1_d4",
> +       [MT8196_CLK_TOP_APLL2_D4] =3D "apll2_d4",
> +       [MT8196_CLK_TOP_APLL12_DIV_I2SIN0] =3D "apll12_div_i2sin0",
> +       [MT8196_CLK_TOP_APLL12_DIV_I2SIN1] =3D "apll12_div_i2sin1",
> +       [MT8196_CLK_TOP_APLL12_DIV_FMI2S] =3D "apll12_div_fmi2s",
> +       [MT8196_CLK_TOP_APLL12_DIV_TDMOUT_M] =3D "apll12_div_tdmout_m",
> +       [MT8196_CLK_TOP_APLL12_DIV_TDMOUT_B] =3D "apll12_div_tdmout_b",
> +       /* mux */
> +       [MT8196_CLK_TOP_MUX_AUD_1] =3D "top_apll1",
> +       [MT8196_CLK_TOP_MUX_AUD_2] =3D "top_apll2",
> +       [MT8196_CLK_TOP_I2SIN0_M_SEL] =3D "top_i2sin0",
> +       [MT8196_CLK_TOP_I2SIN1_M_SEL] =3D "top_i2sin1",
> +       [MT8196_CLK_TOP_FMI2S_M_SEL] =3D "top_fmi2s",
> +       [MT8196_CLK_TOP_TDMOUT_M_SEL] =3D "top_dptx",
> +       [MT8196_CLK_TOP_ADSP_SEL] =3D "top_adsp",
> +       /* top 26m*/
> +       [MT8196_CLK_TOP_CLK26M] =3D "clk26m",
> +};
> +
> +int mt8196_afe_enable_clk(struct mtk_base_afe *afe, struct clk *clk)
> +{
> +       int ret;
> +
> +       if (clk) {

There's no need to check the validity of the pointer. The clk prepare
and enable APIs can take NULL pointers and become no-ops.

> +               ret =3D clk_prepare_enable(clk);
> +               if (ret) {
> +                       dev_dbg(afe->dev, "failed to enable clk\n");

This should be a visible error.

> +                       return ret;
> +               }
> +       } else {
> +               dev_dbg(afe->dev, "NULL clk\n");
> +       }
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(mt8196_afe_enable_clk);
> +
> +void mt8196_afe_disable_clk(struct mtk_base_afe *afe, struct clk *clk)
> +{
> +       if (clk)
> +               clk_disable_unprepare(clk);
> +       else
> +               dev_dbg(afe->dev, "NULL clk\n");
> +}
> +EXPORT_SYMBOL_GPL(mt8196_afe_disable_clk);
> +
> +static int mt8196_afe_set_clk_rate(struct mtk_base_afe *afe, struct clk =
*clk,
> +                                  unsigned int rate)
> +{
> +       int ret;
> +
> +       if (clk) {
> +               ret =3D clk_set_rate(clk, rate);
> +               if (ret) {
> +                       dev_dbg(afe->dev, "failed to set clk rate\n");

This should be a visible error.

> +                       return ret;
> +               }
> +       }
> +
> +       return 0;
> +}
> +
> +static int mt8196_afe_set_clk_parent(struct mtk_base_afe *afe, struct cl=
k *clk,
> +                                    struct clk *parent)
> +{
> +       int ret;
> +
> +       if (clk && parent) {
> +               ret =3D clk_set_parent(clk, parent);
> +               if (ret) {
> +                       dev_dbg(afe->dev, "failed to set clk parent %d\n"=
, ret);
> +                       return ret;
> +               }
> +       }
> +
> +       return 0;
> +}

Per our offline discussions, explicitly setting clock parents are not
needed.

> +
> +static unsigned int get_top_cg_reg(unsigned int cg_type)
> +{
> +       switch (cg_type) {
> +       case MT8196_AUDIO_26M_EN_ON:
> +       case MT8196_AUDIO_F3P25M_EN_ON:
> +       case MT8196_AUDIO_APLL1_EN_ON:
> +       case MT8196_AUDIO_APLL2_EN_ON:
> +               return AUDIO_ENGEN_CON0;
> +       case MT8196_CG_AUDIO_HOPPING_CK:
> +       case MT8196_CG_AUDIO_F26M_CK:
> +       case MT8196_CG_APLL1_CK:
> +       case MT8196_CG_APLL2_CK:
> +       case MT8196_PDN_APLL_TUNER2:
> +       case MT8196_PDN_APLL_TUNER1:
> +               return AUDIO_TOP_CON4;
> +       default:
> +               return 0;
> +       }
> +}
> +
> +static unsigned int get_top_cg_mask(unsigned int cg_type)
> +{
> +       switch (cg_type) {
> +       case MT8196_AUDIO_26M_EN_ON:
> +               return AUDIO_26M_EN_ON_MASK_SFT;
> +       case MT8196_AUDIO_F3P25M_EN_ON:
> +               return AUDIO_F3P25M_EN_ON_MASK_SFT;
> +       case MT8196_AUDIO_APLL1_EN_ON:
> +               return AUDIO_APLL1_EN_ON_MASK_SFT;
> +       case MT8196_AUDIO_APLL2_EN_ON:
> +               return AUDIO_APLL2_EN_ON_MASK_SFT;
> +       case MT8196_CG_AUDIO_HOPPING_CK:
> +               return CG_AUDIO_HOPPING_CK_MASK_SFT;
> +       case MT8196_CG_AUDIO_F26M_CK:
> +               return CG_AUDIO_F26M_CK_MASK_SFT;
> +       case MT8196_CG_APLL1_CK:
> +               return CG_APLL1_CK_MASK_SFT;
> +       case MT8196_CG_APLL2_CK:
> +               return CG_APLL2_CK_MASK_SFT;
> +       case MT8196_PDN_APLL_TUNER2:
> +               return PDN_APLL_TUNER2_MASK_SFT;
> +       case MT8196_PDN_APLL_TUNER1:
> +               return PDN_APLL_TUNER1_MASK_SFT;
> +       default:
> +               return 0;
> +       }
> +}
> +
> +static unsigned int get_top_cg_on_val(unsigned int cg_type)
> +{
> +       switch (cg_type) {
> +       case MT8196_AUDIO_26M_EN_ON:
> +       case MT8196_AUDIO_F3P25M_EN_ON:
> +       case MT8196_AUDIO_APLL1_EN_ON:
> +       case MT8196_AUDIO_APLL2_EN_ON:
> +               return get_top_cg_mask(cg_type);
> +       case MT8196_CG_AUDIO_HOPPING_CK:
> +       case MT8196_CG_AUDIO_F26M_CK:
> +       case MT8196_CG_APLL1_CK:
> +       case MT8196_CG_APLL2_CK:
> +       case MT8196_PDN_APLL_TUNER2:
> +       case MT8196_PDN_APLL_TUNER1:
> +               return 0;
> +       default:
> +               return 0;
> +       }
> +}
> +
> +static unsigned int get_top_cg_off_val(unsigned int cg_type)
> +{
> +       switch (cg_type) {
> +       case MT8196_AUDIO_26M_EN_ON:
> +       case MT8196_AUDIO_F3P25M_EN_ON:
> +       case MT8196_AUDIO_APLL1_EN_ON:
> +       case MT8196_AUDIO_APLL2_EN_ON:
> +               return 0;
> +       case MT8196_CG_AUDIO_HOPPING_CK:
> +       case MT8196_CG_AUDIO_F26M_CK:
> +       case MT8196_CG_APLL1_CK:
> +       case MT8196_CG_APLL2_CK:
> +       case MT8196_PDN_APLL_TUNER2:
> +       case MT8196_PDN_APLL_TUNER1:
> +               return get_top_cg_mask(cg_type);
> +       default:
> +               return get_top_cg_mask(cg_type);
> +       }
> +}
> +
> +static int mt8196_afe_enable_top_cg(struct mtk_base_afe *afe, unsigned i=
nt cg_type)
> +{
> +       unsigned int reg =3D get_top_cg_reg(cg_type);
> +       unsigned int mask =3D get_top_cg_mask(cg_type);
> +       unsigned int val =3D get_top_cg_on_val(cg_type);
> +
> +       if (!afe->regmap) {
> +               dev_warn(afe->dev, "skip regmap\n");
> +               return 0;

This should be a fatal error.

> +       }
> +
> +       dev_dbg(afe->dev, "reg: 0x%x, mask: 0x%x, val: 0x%x\n", reg, mask=
, val);
> +       regmap_update_bits(afe->regmap, reg, mask, val);

Should check the return value, since it could fail because these are set as
volatile registers and cannot be updated in cache-only state.

> +       return 0;
> +}
> +
> +static int mt8196_afe_disable_top_cg(struct mtk_base_afe *afe, unsigned =
int cg_type)
> +{
> +       unsigned int reg =3D get_top_cg_reg(cg_type);
> +       unsigned int mask =3D get_top_cg_mask(cg_type);
> +       unsigned int val =3D get_top_cg_off_val(cg_type);
> +
> +       if (!afe->regmap) {
> +               dev_warn(afe->dev, "skip regmap\n");
> +               return 0;
> +       }
> +
> +       dev_dbg(afe->dev, "reg: 0x%x, mask: 0x%x, val: 0x%x\n", reg, mask=
, val);
> +       regmap_update_bits(afe->regmap, reg, mask, val);

Same here.

> +
> +       return 0;
> +}
> +
> +static int apll1_mux_setting(struct mtk_base_afe *afe, bool enable)
> +{
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       int ret =3D 0;
> +
> +       dev_dbg(afe->dev, "enable: %d\n", enable);
> +
> +       if (enable) {
> +               ret =3D mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_C=
LK_TOP_MUX_AUD_1]);
> +               if (ret)
> +                       return ret;
> +
> +               ret =3D mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT81=
96_CLK_TOP_MUX_AUD_1],
> +                                               afe_priv->clk[MT8196_CLK_=
TOP_APLL1_CK]);
> +               if (ret)
> +                       return ret;
> +
> +               /* 180.6336 / 4 =3D 45.1584MHz */
> +               ret =3D mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_C=
LK_VLP_MUX_AUD_ENG1]);
> +               if (ret)
> +                       return ret;
> +
> +               ret =3D mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT81=
96_CLK_VLP_MUX_AUD_ENG1],
> +                                               afe_priv->clk[MT8196_CLK_=
TOP_APLL1_D4]);
> +               if (ret)
> +                       return ret;
> +
> +               ret =3D mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_C=
LK_VLP_MUX_AUDIO_H]);
> +               if (ret)
> +                       return ret;
> +
> +               ret =3D mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT81=
96_CLK_VLP_MUX_AUDIO_H],
> +                                               afe_priv->clk[MT8196_CLK_=
TOP_APLL1_CK]);
> +               if (ret)
> +                       return ret;
> +       } else {
> +               ret =3D mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT81=
96_CLK_VLP_MUX_AUD_ENG1],
> +                                               afe_priv->clk[MT8196_CLK_=
VLP_CLK26M]);
> +               if (ret)
> +                       return ret;
> +
> +               mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_=
MUX_AUD_ENG1]);
> +
> +               ret =3D mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT81=
96_CLK_TOP_MUX_AUD_1],
> +                                               afe_priv->clk[MT8196_CLK_=
TOP_CLK26M]);
> +               if (ret)
> +                       return ret;
> +
> +               mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_=
MUX_AUD_1]);
> +               mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_V=
LP_MUX_AUDIO_H],
> +                                         afe_priv->clk[MT8196_CLK_VLP_CL=
K26M]);
> +               mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_=
MUX_AUDIO_H]);
> +       }

We've talked about this offline. FTR there's no need to enable intermediate
clocks. When the leaf clock is enabled, the CCF also enables all connected
parents. There's also no need to set parents explicitly. When the clock
rate of the leaf clock gets set, the CCF will take care to reparent it
or the sub-tree to the most appropriate clock parent.

> +       return 0;
> +}
> +
> +static int apll2_mux_setting(struct mtk_base_afe *afe, bool enable)
> +{
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       int ret =3D 0;
> +
> +       dev_dbg(afe->dev, "enable: %d\n", enable);
> +
> +       if (enable) {
> +               ret =3D mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_C=
LK_TOP_MUX_AUD_2]);
> +               if (ret)
> +                       return ret;
> +
> +               ret =3D mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT81=
96_CLK_TOP_MUX_AUD_2],
> +                                               afe_priv->clk[MT8196_CLK_=
TOP_APLL2_CK]);
> +               if (ret)
> +                       return ret;
> +
> +               /* 196.608 / 4 =3D 49.152MHz */
> +               ret =3D mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_C=
LK_VLP_MUX_AUD_ENG2]);
> +               if (ret)
> +                       return ret;
> +
> +               ret =3D mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT81=
96_CLK_VLP_MUX_AUD_ENG2],
> +                                               afe_priv->clk[MT8196_CLK_=
TOP_APLL2_D4]);
> +               if (ret)
> +                       return ret;
> +
> +               ret =3D mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_C=
LK_VLP_MUX_AUDIO_H]);
> +               if (ret)
> +                       return ret;
> +
> +               ret =3D mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT81=
96_CLK_VLP_MUX_AUDIO_H],
> +                                               afe_priv->clk[MT8196_CLK_=
TOP_APLL2_CK]);
> +               if (ret)
> +                       return ret;
> +       } else {
> +               ret =3D mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT81=
96_CLK_VLP_MUX_AUD_ENG2],
> +                                               afe_priv->clk[MT8196_CLK_=
VLP_CLK26M]);
> +               if (ret)
> +                       return ret;
> +
> +               mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_=
MUX_AUD_ENG2]);
> +
> +               ret =3D mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT81=
96_CLK_TOP_MUX_AUD_2],
> +                                               afe_priv->clk[MT8196_CLK_=
TOP_CLK26M]);
> +               if (ret)
> +                       return ret;
> +
> +               mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_=
MUX_AUD_2]);
> +               mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_V=
LP_MUX_AUDIO_H],
> +                                         afe_priv->clk[MT8196_CLK_VLP_CL=
K26M]);
> +               mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_=
MUX_AUDIO_H]);
> +       }

Same for this function.

> +       return 0;
> +}
> +
> +static int mt8196_afe_disable_apll(struct mtk_base_afe *afe)
> +{
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       int ret =3D 0;
> +
> +       ret =3D mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_M=
UX_AUDIO_H]);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_M=
UX_AUD_1]);
> +       if (ret)
> +               goto clk_ck_mux_aud1_err;
> +
> +       ret =3D mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_T=
OP_MUX_AUD_1],
> +                                       afe_priv->clk[MT8196_CLK_TOP_CLK2=
6M]);
> +       if (ret)
> +               goto clk_ck_mux_aud1_parent_err;
> +
> +       ret =3D mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_M=
UX_AUD_2]);
> +       if (ret)
> +               goto clk_ck_mux_aud2_err;
> +
> +       ret =3D mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_T=
OP_MUX_AUD_2],
> +                                       afe_priv->clk[MT8196_CLK_TOP_CLK2=
6M]);
> +       if (ret)
> +               goto clk_ck_mux_aud2_parent_err;
> +
> +       mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_=
1]);
> +       mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_=
2]);
> +       mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_A=
UDIO_H],
> +                                 afe_priv->clk[MT8196_CLK_VLP_CLK26M]);
> +       mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDI=
O_H]);

Same here. There's no need to toggle all the intermediate clocks. And since
everything is getting disabled, what parent is selected shouldn't matter.

> +       return 0;
> +
> +clk_ck_mux_aud2_parent_err:
> +       mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_=
2]);
> +clk_ck_mux_aud2_err:
> +       mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_A=
UD_1],
> +                                 afe_priv->clk[MT8196_CLK_TOP_APLL1_CK])=
;
> +clk_ck_mux_aud1_parent_err:
> +       mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_=
1]);
> +clk_ck_mux_aud1_err:
> +       mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDI=
O_H]);
> +
> +       return ret;
> +}
> +
> +static void mt8196_afe_apll_init(struct mtk_base_afe *afe)
> +{
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +
> +       if (!afe_priv->vlp_ck) {
> +               dev_warn(afe->dev, "vlp_ck regmap is null ptr\n");
> +               return;
> +       }
> +
> +       regmap_write(afe_priv->vlp_ck, VLP_APLL1_TUNER_CON0, VLP_APLL1_TU=
NER_CON0_VALUE);
> +       regmap_write(afe_priv->vlp_ck, VLP_APLL2_TUNER_CON0, VLP_APLL2_TU=
NER_CON0_VALUE);

Per offline discussion, this should be moved to the vlp clk driver.
This was already mentioned to the clk patch owners in a recent review.

> +}

[...]

> +/* mck */
> +struct mt8196_mck_div {
> +       int m_sel_id;
> +       int div_clk_id;
> +};
> +
> +static const struct mt8196_mck_div mck_div[MT8196_MCK_NUM] =3D {
> +       [MT8196_I2SIN0_MCK] =3D {
> +               .m_sel_id =3D MT8196_CLK_TOP_I2SIN0_M_SEL,
> +               .div_clk_id =3D MT8196_CLK_TOP_APLL12_DIV_I2SIN0,
> +       },
> +       [MT8196_I2SIN1_MCK] =3D {
> +               .m_sel_id =3D MT8196_CLK_TOP_I2SIN1_M_SEL,
> +               .div_clk_id =3D MT8196_CLK_TOP_APLL12_DIV_I2SIN1,
> +       },
> +       [MT8196_FMI2S_MCK] =3D {
> +               .m_sel_id =3D MT8196_CLK_TOP_FMI2S_M_SEL,
> +               .div_clk_id =3D MT8196_CLK_TOP_APLL12_DIV_FMI2S,
> +       },
> +       [MT8196_TDMOUT_MCK] =3D {
> +               .m_sel_id =3D MT8196_CLK_TOP_TDMOUT_M_SEL,
> +               .div_clk_id =3D MT8196_CLK_TOP_APLL12_DIV_TDMOUT_M,
> +       },
> +       [MT8196_TDMOUT_BCK] =3D {
> +               .m_sel_id =3D -1,
> +               .div_clk_id =3D MT8196_CLK_TOP_APLL12_DIV_TDMOUT_B,
> +       },
> +};

In the upstream clk patch submission, the mux and divider have been
combined. So this part could be simplified a bit. Also...

> +int mt8196_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
> +{
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       int apll =3D mt8196_get_apll_by_rate(afe, rate);
> +       int apll_clk_id =3D apll =3D=3D MT8196_APLL1 ?
> +                         MT8196_CLK_TOP_MUX_AUD_1 : MT8196_CLK_TOP_MUX_A=
UD_2;
> +       int m_sel_id;
> +       int div_clk_id;
> +       int ret;
> +
> +       dev_dbg(afe->dev, "mck_id: %d, rate: %d\n", mck_id, rate);
> +
> +       if (mck_id >=3D MT8196_MCK_NUM || mck_id < 0)
> +               return -EINVAL;
> +
> +       m_sel_id =3D mck_div[mck_id].m_sel_id;
> +       div_clk_id =3D mck_div[mck_id].div_clk_id;
> +
> +       /* select apll */
> +       if (m_sel_id >=3D 0) {
> +               ret =3D mt8196_afe_enable_clk(afe, afe_priv->clk[m_sel_id=
]);
> +               if (ret)
> +                       return ret;
> +
> +               ret =3D mt8196_afe_set_clk_parent(afe, afe_priv->clk[m_se=
l_id],
> +                                               afe_priv->clk[apll_clk_id=
]);

This part would be taken care of by the framework as well. There's no
need to do it explicitly.

> +               if (ret)
> +                       return ret;
> +       }
> +
> +       /* enable div, set rate */
> +       if (div_clk_id < 0) {
> +               dev_err(afe->dev, "invalid div_clk_id %d\n", div_clk_id);
> +               return -EINVAL;
> +       }
> +       if (div_clk_id =3D=3D MT8196_CLK_TOP_APLL12_DIV_TDMOUT_B)
> +               rate =3D rate * 16;

                  rate *=3D 16;

> +
> +       ret =3D mt8196_afe_enable_clk(afe, afe_priv->clk[div_clk_id]);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D mt8196_afe_set_clk_rate(afe, afe_priv->clk[div_clk_id], r=
ate);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
> +int mt8196_mck_disable(struct mtk_base_afe *afe, int mck_id)
> +{
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       int m_sel_id;
> +       int div_clk_id;
> +
> +       dev_dbg(afe->dev, "mck_id: %d.\n", mck_id);
> +
> +       if (mck_id < 0) {
> +               dev_err(afe->dev, "mck_id =3D %d < 0\n", mck_id);
> +               return -EINVAL;
> +       }
> +
> +       m_sel_id =3D mck_div[mck_id].m_sel_id;
> +       div_clk_id =3D mck_div[mck_id].div_clk_id;
> +
> +       if (div_clk_id < 0) {
> +               dev_err(afe->dev, "div_clk_id =3D %d < 0\n",
> +                       div_clk_id);
> +               return -EINVAL;
> +       }
> +
> +       mt8196_afe_disable_clk(afe, afe_priv->clk[div_clk_id]);
> +
> +       if (m_sel_id >=3D 0)
> +               mt8196_afe_disable_clk(afe, afe_priv->clk[m_sel_id]);
> +
> +       return 0;
> +}
> +
> +int mt8196_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
> +{
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +
> +       /* bus clock for AFE external access, like DRAM */
> +       mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_ADSP_SEL]=
);
> +
> +       /* bus clock for AFE internal access, like AFE SRAM */
> +       mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO=
INTBUS]);
> +       mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_A=
UDIOINTBUS],
> +                                 afe_priv->clk[MT8196_CLK_VLP_CLK26M]);

If you are setting it to 26M, then it probably doesn't matter what parent
it uses? I would just drop this.

> +       /* enable audio vlp clock source */
> +       mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO=
_H]);
> +       mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_A=
UDIO_H],
> +                                 afe_priv->clk[MT8196_CLK_VLP_CLK26M]);

Same here.

> +
> +       /* AFE hw clock */
> +       /* IPM2.0: USE HOPPING & 26M */
> +       /* set in the regmap_register_patch */
> +       return 0;
> +}
> +
> +int mt8196_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
> +{
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +
> +       /* IPM2.0: Use HOPPING & 26M */
> +       /* set in the regmap_register_patch */
> +
> +       mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_A=
UDIO_H],
> +                                 afe_priv->clk[MT8196_CLK_VLP_CLK26M]);

There's no point in selecting a parent on a clock that is going to be disab=
led.

> +
> +       mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDI=
O_H]);
> +       mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_A=
UDIOINTBUS],
> +                                 afe_priv->clk[MT8196_CLK_VLP_CLK26M]);
> +       mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDI=
OINTBUS]);
> +       mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_ADSP_SEL=
]);
> +       return 0;
> +}
> +
> +int mt8196_afe_enable_main_clock(struct mtk_base_afe *afe)
> +{
> +       mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_26M_EN_ON);
> +       return 0;
> +}
> +
> +int mt8196_afe_disable_main_clock(struct mtk_base_afe *afe)
> +{
> +       mt8196_afe_disable_top_cg(afe, MT8196_AUDIO_26M_EN_ON);
> +       return 0;
> +}
> +
> +int mt8196_init_clock(struct mtk_base_afe *afe)
> +{
> +       struct mt8196_afe_private *afe_priv =3D afe->platform_priv;
> +       int ret =3D 0;
> +       int i =3D 0;
> +
> +       afe_priv->clk =3D devm_kcalloc(afe->dev, MT8196_CLK_NUM, sizeof(*=
afe_priv->clk),
> +                                    GFP_KERNEL);
> +       if (!afe_priv->clk)
> +               return -ENOMEM;
> +
> +       for (i =3D 0; i < MT8196_CLK_NUM; i++) {
> +               afe_priv->clk[i] =3D devm_clk_get(afe->dev, aud_clks[i]);
> +               if (IS_ERR(afe_priv->clk[i])) {
> +                       dev_err(afe->dev, "devm_clk_get %s fail\n", aud_c=
lks[i]);
> +                       return PTR_ERR(afe_priv->clk[i]);
> +               }
> +       }
> +

> +       afe_priv->vlp_ck =3D syscon_regmap_lookup_by_phandle(afe->dev->of=
_node,
> +                                                          "vlpcksys");
> +       if (IS_ERR(afe_priv->vlp_ck)) {
> +               dev_err(afe->dev, "Cannot find vlpcksys\n");
> +               return PTR_ERR(afe_priv->vlp_ck);
> +       }

As mentioned, the tuner bits will be moved to the clk driver, so this
bit is no longer needed.

> +
> +       mt8196_afe_apll_init(afe);
> +
> +       ret =3D mt8196_afe_disable_apll(afe);
> +       if (ret)
> +               return ret;
> +
> +       return 0;
> +}
> +
> diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.h b/sound/soc/media=
tek/mt8196/mt8196-afe-clk.h
> new file mode 100644
> index 000000000000..854da3844104
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.h
> @@ -0,0 +1,80 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * mt8196-afe-clk.h  --  Mediatek MT8196 AFE Clock Control definitions
> + *
> + * Copyright (c) 2024 MediaTek Inc.
> + *  Author: Darren Ye <darren.ye@mediatek.com>
> + */
> +
> +#ifndef _MT8196_AFE_CLOCK_CTRL_H_
> +#define _MT8196_AFE_CLOCK_CTRL_H_
> +
> +/* vlp_cksys_clk: 0x1c016000 */
> +#define VLP_APLL1_TUNER_CON0 0x02a4
> +#define VLP_APLL2_TUNER_CON0 0x02a8
> +
> +/* vlp apll1 tuner default value*/
> +#define VLP_APLL1_TUNER_CON0_VALUE 0x6f28bd4d
> +/* vlp apll2 tuner default value + 1*/
> +#define VLP_APLL2_TUNER_CON0_VALUE 0x78fd5265
> +
> +/* APLL */
> +#define APLL1_W_NAME "APLL1"
> +#define APLL2_W_NAME "APLL2"
> +
> +enum {
> +       MT8196_APLL1 =3D 0,
> +       MT8196_APLL2,
> +};
> +
> +enum {
> +       /* vlp clk */
> +       MT8196_CLK_VLP_MUX_AUDIOINTBUS,
> +       MT8196_CLK_VLP_MUX_AUD_ENG1,
> +       MT8196_CLK_VLP_MUX_AUD_ENG2,
> +       MT8196_CLK_VLP_MUX_AUDIO_H,
> +       MT8196_CLK_VLP_CLK26M,
> +       /* pll */
> +       MT8196_CLK_TOP_APLL1_CK,
> +       MT8196_CLK_TOP_APLL2_CK,
> +       /* divider */
> +       MT8196_CLK_TOP_APLL1_D4,
> +       MT8196_CLK_TOP_APLL2_D4,
> +       MT8196_CLK_TOP_APLL12_DIV_I2SIN0,
> +       MT8196_CLK_TOP_APLL12_DIV_I2SIN1,
> +       MT8196_CLK_TOP_APLL12_DIV_FMI2S,
> +       MT8196_CLK_TOP_APLL12_DIV_TDMOUT_M,
> +       MT8196_CLK_TOP_APLL12_DIV_TDMOUT_B,
> +       /* mux */
> +       MT8196_CLK_TOP_MUX_AUD_1,
> +       MT8196_CLK_TOP_MUX_AUD_2,
> +       MT8196_CLK_TOP_I2SIN0_M_SEL,
> +       MT8196_CLK_TOP_I2SIN1_M_SEL,
> +       MT8196_CLK_TOP_FMI2S_M_SEL,
> +       MT8196_CLK_TOP_TDMOUT_M_SEL,
> +       MT8196_CLK_TOP_ADSP_SEL,
> +       /* top 26m */
> +       MT8196_CLK_TOP_CLK26M,
> +       MT8196_CLK_NUM,

The list should be reworked based on review comments to the DT bindings
and our offline discussions. Basically only clocks that directly feed
into the hardware, or otherwise have a reason to be referenced should
be listed.


ChenYu

> +};
> +
> +struct mtk_base_afe;
> +
> +int mt8196_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate);
> +int mt8196_mck_disable(struct mtk_base_afe *afe, int mck_id);
> +int mt8196_get_apll_rate(struct mtk_base_afe *afe, int apll);
> +int mt8196_get_apll_by_rate(struct mtk_base_afe *afe, int rate);
> +int mt8196_get_apll_by_name(struct mtk_base_afe *afe, const char *name);
> +int mt8196_init_clock(struct mtk_base_afe *afe);
> +int mt8196_afe_enable_clk(struct mtk_base_afe *afe, struct clk *clk);
> +void mt8196_afe_disable_clk(struct mtk_base_afe *afe, struct clk *clk);
> +int mt8196_apll1_enable(struct mtk_base_afe *afe);
> +void mt8196_apll1_disable(struct mtk_base_afe *afe);
> +int mt8196_apll2_enable(struct mtk_base_afe *afe);
> +void mt8196_apll2_disable(struct mtk_base_afe *afe);
> +int mt8196_afe_enable_main_clock(struct mtk_base_afe *afe);
> +int mt8196_afe_disable_main_clock(struct mtk_base_afe *afe);
> +int mt8196_afe_enable_reg_rw_clk(struct mtk_base_afe *afe);
> +int mt8196_afe_disable_reg_rw_clk(struct mtk_base_afe *afe);
> +
> +#endif
> --
> 2.45.2
>
>

