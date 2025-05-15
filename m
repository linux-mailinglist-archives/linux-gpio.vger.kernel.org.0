Return-Path: <linux-gpio+bounces-20215-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13618AB80CB
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 10:34:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 506994E1805
	for <lists+linux-gpio@lfdr.de>; Thu, 15 May 2025 08:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2508D288CAD;
	Thu, 15 May 2025 08:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="H80xGFGs"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A1E20E6F3;
	Thu, 15 May 2025 08:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747297833; cv=none; b=kCYEtvUJeoPDs/4DXDQeadYmu2BbbvYkN/9ul9j0F4bn2yRtctWvasGHe8wP0YuC9NYXkVwIFRiHjuqzK0bGQUhqHAxeT7z6X6obbSf+Fs8nwp6AOZPv1z+7dwWgyFwXeTGKpyyTa3gYGZybg2ckCZZKUwrHgNC5gU/Xkh/Xe+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747297833; c=relaxed/simple;
	bh=T7UAFER9GGElwGZNqBkupS10QMkJGwszee8AQk4dR68=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B2B7WwddXSD6Qhz1IzaXwiII5gct7OMeuqY9f89p6AhJRcDU5LmLAu0yaKIydqT2alJDxPS+NR+Y8EsXBuj9mZ+4FvHBfV934ABleiw2RjmMWUdx/mpJ42cq1nEavD9zwPM8ox+yTtR8h2FcGb+nr3cnK+4+I66mVzTsjQP+A9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=H80xGFGs; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747297828;
	bh=T7UAFER9GGElwGZNqBkupS10QMkJGwszee8AQk4dR68=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H80xGFGsutKqgDB7Osf0HYLe5w4eknM6j0M1FqTqSkXuIj6yQhNIoN7/59dhjvYb3
	 inNb6F8kMN+TVgzd8rEwgAONhYxhpaqLKIDNNtHJNOChV2fHfUwwmmiQCYHGL+azs6
	 dAc8KF9m6yHnm9MAeFfqmAZO1N+caj3LB8BeIOVN2yzn56xCmG0T488vY4lbiSzdcT
	 zqlQ3S0MM7HUVmhEpC/2QRwtIOhZn5ITVDyz/ltCvFhM+11/Kd/L5Od+ZhQzW/7h/L
	 3XCO88rafCdyDDcnSkY0/8xOrEETP4oTrQDyDW/e43Q5Nn18uigg9eY5g2aRtP5UlO
	 azgv+F/U+bgPQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 88CC617E0404;
	Thu, 15 May 2025 10:30:27 +0200 (CEST)
Message-ID: <be75ac83-5421-4bb0-a28a-57be639f427c@collabora.com>
Date: Thu, 15 May 2025 10:30:26 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 03/10] ASoC: mediatek: mt8196: support audio clock
 control
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
References: <20250514081125.24475-1-darren.ye@mediatek.com>
 <20250514081125.24475-4-darren.ye@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250514081125.24475-4-darren.ye@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 14/05/25 10:11, Darren.Ye ha scritto:
> From: Darren Ye <darren.ye@mediatek.com>
> 
> Add audio clock wrapper and audio tuner control.
> 
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> ---
>   sound/soc/mediatek/mt8196/mt8196-afe-clk.c    | 723 ++++++++++++++++++
>   sound/soc/mediatek/mt8196/mt8196-afe-clk.h    | 142 ++++
>   sound/soc/mediatek/mt8196/mt8196-audsys-clk.c | 252 ++++++
>   sound/soc/mediatek/mt8196/mt8196-audsys-clk.h |  14 +
>   .../soc/mediatek/mt8196/mt8196-audsys-clkid.h |  78 ++
>   5 files changed, 1209 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-clk.c
>   create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-clk.h
>   create mode 100644 sound/soc/mediatek/mt8196/mt8196-audsys-clk.c
>   create mode 100644 sound/soc/mediatek/mt8196/mt8196-audsys-clk.h
>   create mode 100644 sound/soc/mediatek/mt8196/mt8196-audsys-clkid.h
> 
> diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
> new file mode 100644
> index 000000000000..83b5ee9d30ef
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
> @@ -0,0 +1,723 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  mt8196-afe-clk.c  --  Mediatek 8196 afe clock ctrl

mt8196-afe-clk.c - MediaTek MT8196 AFE Clock Control

> + *
> + *  Copyright (c) 2024 MediaTek Inc.
> + *  Author: Darren Ye <darren.ye@mediatek.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/regmap.h>
> +#include <linux/mfd/syscon.h>
> +#include "mt8196-afe-common.h"
> +#include "mt8196-audsys-clk.h"
> +#include "mt8196-afe-clk.h"
> +

..snip..

> +
> +static int mt8196_afe_disable_apll(struct mtk_base_afe *afe)
> +{
> +	struct mt8196_afe_private *afe_priv = afe->platform_priv;
> +	int ret = 0;
> +
> +	ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
> +	if (ret)
> +		return ret;
> +
> +	ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_1]);
> +	if (ret)
> +		goto clk_ck_mux_aud1_err;
> +
> +	ret = mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_1],
> +					afe_priv->clk[MT8196_CLK_TOP_CLK26M]);
> +	if (ret)
> +		goto clk_ck_mux_aud1_parent_err;
> +
> +	ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_2]);
> +	if (ret)
> +		goto clk_ck_mux_aud2_err;
> +
> +	ret = mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_2],
> +					afe_priv->clk[MT8196_CLK_TOP_CLK26M]);
> +	if (ret)
> +		goto clk_ck_mux_aud2_parent_err;
> +
> +	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_1]);
> +	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_2]);
> +	mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
> +				  afe_priv->clk[MT8196_CLK_VLP_CLK26M]);
> +	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
> +	return 0;
> +
> +clk_ck_mux_aud2_parent_err:
> +	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_2]);
> +clk_ck_mux_aud2_err:
> +	mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_1],
> +				  afe_priv->clk[MT8196_CLK_TOP_APLL1_CK]);
> +clk_ck_mux_aud1_parent_err:
> +	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_MUX_AUD_1]);
> +clk_ck_mux_aud1_err:
> +	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
> +
> +	return ret;
> +}
> +
> +static void mt8196_afe_apll_init(struct mtk_base_afe *afe)
> +{
> +	struct mt8196_afe_private *afe_priv = afe->platform_priv;
> +

if (!afe_priv->vlp_clk) {
	dev_warn...
	return;
}

regmap_write......

> +	if (afe_priv->vlp_ck) {
> +		regmap_write(afe_priv->vlp_ck, VLP_APLL1_TUNER_CON0, VLP_APLL1_TUNER_CON0_VALUE);
> +		regmap_write(afe_priv->vlp_ck, VLP_APLL2_TUNER_CON0, VLP_APLL2_TUNER_CON0_VALUE);
> +	} else {
> +		dev_warn(afe->dev, "vlp_ck regmap is null ptr\n");
> +	}
> +}
> +
> +int mt8196_apll1_enable(struct mtk_base_afe *afe)
> +{
> +	struct mt8196_afe_private *afe_priv = afe->platform_priv;
> +	int ret;
> +
> +	/* setting for APLL */
> +	apll1_mux_setting(afe, true);
> +
> +	ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_APLL1]);
> +	if (ret)
> +		goto ERR_CLK_APLL1;
> +
> +	ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_APLL_TUNER1]);
> +	if (ret)
> +		goto ERR_CLK_APLL1_TUNER;
> +
> +	/* sel 44.1kHz:1, apll_div:7, upper bound:3 */
> +	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
> +			   XTAL_EN_128FS_SEL_MASK_SFT | APLL_DIV_MASK_SFT | UPPER_BOUND_MASK_SFT,
> +			   (0x1 << XTAL_EN_128FS_SEL_SFT) | (7 << APLL_DIV_SFT) |
> +			   (3 << UPPER_BOUND_SFT));
> +
> +	/* apll1 freq tuner enable */
> +	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
> +			   FREQ_TUNER_EN_MASK_SFT,
> +			   0x1 << FREQ_TUNER_EN_SFT);
> +
> +	/* audio apll1 on */
> +	mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_APLL1_EN_ON);
> +
> +	return 0;
> +
> +ERR_CLK_APLL1_TUNER:

lower case for labels please

> +	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_APLL_TUNER1]);
> +ERR_CLK_APLL1:

^^^^^^^^^

> +	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_APLL1]);
> +	return ret;
> +}
> +
> +void mt8196_apll1_disable(struct mtk_base_afe *afe)
> +{
> +	struct mt8196_afe_private *afe_priv = afe->platform_priv;
> +
> +	/* audio apll1 off */
> +	mt8196_afe_disable_top_cg(afe, MT8196_AUDIO_APLL1_EN_ON);
> +
> +	/* apll1 freq tuner disable */
> +	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
> +			   FREQ_TUNER_EN_MASK_SFT,
> +			   0x0);
> +
> +	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_APLL_TUNER1]);
> +	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_APLL1]);
> +	apll1_mux_setting(afe, false);
> +}
> +
> +int mt8196_apll2_enable(struct mtk_base_afe *afe)
> +{
> +	struct mt8196_afe_private *afe_priv = afe->platform_priv;
> +	int ret;
> +
> +	/* setting for APLL */
> +	apll2_mux_setting(afe, true);
> +
> +	ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_APLL2]);
> +	if (ret)
> +		goto ERR_CLK_APLL2;
> +
> +	ret = mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_APLL_TUNER2]);
> +	if (ret)
> +		goto ERR_CLK_APLL2_TUNER;
> +
> +	/* sel 48kHz: 2, apll_div: 7, upper bound: 3*/
> +	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
> +			   XTAL_EN_128FS_SEL_MASK_SFT | APLL_DIV_MASK_SFT | UPPER_BOUND_MASK_SFT,
> +			   (0x2 << XTAL_EN_128FS_SEL_SFT) | (7 << APLL_DIV_SFT) |
> +			   (3 << UPPER_BOUND_SFT));
> +
> +	/* apll2 freq tuner enable */
> +	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
> +			   FREQ_TUNER_EN_MASK_SFT,
> +			   0x1 << FREQ_TUNER_EN_SFT);
> +
> +	/* audio apll2 on */
> +	mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_APLL2_EN_ON);
> +	return 0;
> +
> +ERR_CLK_APLL2_TUNER:

lower case for labels please

> +	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_APLL_TUNER2]);
> +ERR_CLK_APLL2:

ditto

> +	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_APLL2]);
> +	return ret;
> +
> +	return 0;
> +}
> +
> +void mt8196_apll2_disable(struct mtk_base_afe *afe)
> +{
> +	struct mt8196_afe_private *afe_priv = afe->platform_priv;
> +
> +	/* audio apll2 off */
> +	mt8196_afe_disable_top_cg(afe, MT8196_AUDIO_APLL2_EN_ON);
> +
> +	/* apll2 freq tuner disable */
> +	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
> +			   FREQ_TUNER_EN_MASK_SFT,
> +			   0x0);
> +
> +	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_APLL_TUNER2]);
> +	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_APLL2]);
> +	apll2_mux_setting(afe, false);
> +}
> +
> +int mt8196_get_apll_rate(struct mtk_base_afe *afe, int apll)
> +{
> +	struct mt8196_afe_private *afe_priv = afe->platform_priv;
> +	int clk_id = 0;
> +
> +	if (apll < MT8196_APLL1 || apll > MT8196_APLL2) {
> +		dev_warn(afe->dev, "invalid clk id\n");

("invalid clk id %d\n", clk_id)

...otherwise it makes no sense, as it gives no useful information.
Alternatively, just drop the print.

> +		return 0;
> +	}
> +
> +	if (apll == MT8196_APLL1)
> +		clk_id = MT8196_CLK_TOP_APLL1_CK;
> +	else
> +		clk_id = MT8196_CLK_TOP_APLL2_CK;
> +
> +	return clk_get_rate(afe_priv->clk[clk_id]);
> +}
> +
> +int mt8196_get_apll_by_rate(struct mtk_base_afe *afe, int rate)
> +{
> +	return ((rate % 8000) == 0) ? MT8196_APLL2 : MT8196_APLL1;

	return (rate % 8000) ? MT8196_APLL1 : MT8196_APLL2;

> +}
> +
> +int mt8196_get_apll_by_name(struct mtk_base_afe *afe, const char *name)
> +{
> +	if (strcmp(name, APLL1_W_NAME) == 0)
> +		return MT8196_APLL1;
> +	else
> +		return MT8196_APLL2;

	if (strcmp ....)
		return MT8196_APLL1;

	return MT8196_APLL2;

> +}
> +
> +/* mck */
> +struct mt8196_mck_div {
> +	int m_sel_id;
> +	int div_clk_id;
> +};
> +
> +static const struct mt8196_mck_div mck_div[MT8196_MCK_NUM] = {
> +	[MT8196_I2SIN0_MCK] = {
> +		.m_sel_id = MT8196_CLK_TOP_I2SIN0_M_SEL,
> +		.div_clk_id = MT8196_CLK_TOP_APLL12_DIV_I2SIN0,
> +	},
> +	[MT8196_I2SIN1_MCK] = {
> +		.m_sel_id = MT8196_CLK_TOP_I2SIN1_M_SEL,
> +		.div_clk_id = MT8196_CLK_TOP_APLL12_DIV_I2SIN1,
> +	},
> +	[MT8196_FMI2S_MCK] = {
> +		.m_sel_id = MT8196_CLK_TOP_FMI2S_M_SEL,
> +		.div_clk_id = MT8196_CLK_TOP_APLL12_DIV_FMI2S,
> +	},
> +	[MT8196_TDMOUT_MCK] = {
> +		.m_sel_id = MT8196_CLK_TOP_TDMOUT_M_SEL,
> +		.div_clk_id = MT8196_CLK_TOP_APLL12_DIV_TDMOUT_M,
> +	},
> +	[MT8196_TDMOUT_BCK] = {
> +		.m_sel_id = -1,
> +		.div_clk_id = MT8196_CLK_TOP_APLL12_DIV_TDMOUT_B,
> +	},
> +};
> +
> +int mt8196_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate)
> +{
> +	struct mt8196_afe_private *afe_priv = afe->platform_priv;
> +	int apll = mt8196_get_apll_by_rate(afe, rate);
> +	int apll_clk_id = apll == MT8196_APLL1 ?
> +			  MT8196_CLK_TOP_MUX_AUD_1 : MT8196_CLK_TOP_MUX_AUD_2;
> +	int m_sel_id = 0;
> +	int div_clk_id = 0;
> +	int ret = 0;

this gives double initialzation of all m_sel_id, div_clk_id and ret as you are
initializing the first two immediately after the mck_id check, and ret later;
just go for

int m_sel_id, div_clk_id, ret;

or just

int ret;

> +
> +	dev_dbg(afe->dev, "mck_id: %d, rate: %d\n", mck_id, rate);
> +
> +	if (mck_id >= MT8196_MCK_NUM || mck_id < 0)
> +		return -EINVAL;
> +
> +	m_sel_id = mck_div[mck_id].m_sel_id;
> +	div_clk_id = mck_div[mck_id].div_clk_id;
> +
> +	/* select apll */
> +	if (m_sel_id >= 0) {

...because then I don't understand why don't you just use mck_div[mck_id] directly.

	if (mck_div[mck_id].m_sel_id >= 0) {

> +		ret = mt8196_afe_enable_clk(afe, afe_priv->clk[m_sel_id]);
> +		if (ret)
> +			return ret;
> +
> +		ret = mt8196_afe_set_clk_parent(afe, afe_priv->clk[m_sel_id],
> +						afe_priv->clk[apll_clk_id]);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	/* enable div, set rate */
> +	if (div_clk_id < 0) {

if (mck_div[mck_id].div_clk_id == MT8196_CLK_TOP_APLL12_DIV_TDMOUT_B) {
	rate ...
} else if (mck_div[mck_id].div_clk_id < 0) {
	....
}


> +		dev_err(afe->dev, "invalid div_clk_id %d\n", div_clk_id);
> +		return -EINVAL;
> +	}
> +	if (div_clk_id == MT8196_CLK_TOP_APLL12_DIV_TDMOUT_B)
> +		rate = rate * 16;
> +
> +	ret = mt8196_afe_enable_clk(afe, afe_priv->clk[div_clk_id]);
> +	if (ret)
> +		return ret;
> +
> +	ret = mt8196_afe_set_clk_rate(afe, afe_priv->clk[div_clk_id], rate);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +int mt8196_mck_disable(struct mtk_base_afe *afe, int mck_id)
> +{
> +	struct mt8196_afe_private *afe_priv = afe->platform_priv;
> +	int m_sel_id = 0;
> +	int div_clk_id = 0;

Double init again....

> +
> +	dev_dbg(afe->dev, "mck_id: %d.\n", mck_id);
> +
> +	if (mck_id < 0) {
> +		dev_err(afe->dev, "mck_id = %d < 0\n", mck_id);
> +		return -EINVAL;
> +	}
> +
> +	m_sel_id = mck_div[mck_id].m_sel_id;
> +	div_clk_id = mck_div[mck_id].div_clk_id;
> +
> +	if (div_clk_id < 0) {
> +		dev_err(afe->dev, "div_clk_id = %d < 0\n",
> +			div_clk_id);
> +		return -EINVAL;
> +	}
> +
> +	mt8196_afe_disable_clk(afe, afe_priv->clk[div_clk_id]);
> +
> +	if (m_sel_id >= 0)
> +		mt8196_afe_disable_clk(afe, afe_priv->clk[m_sel_id]);
> +
> +	return 0;
> +}
> +
> +int mt8196_afe_enable_reg_rw_clk(struct mtk_base_afe *afe)
> +{
> +	struct mt8196_afe_private *afe_priv = afe->platform_priv;
> +
> +	/* bus clock for AFE external access, like DRAM */
> +	mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_ADSP_SEL]);
> +
> +	/* bus clock for AFE internal access, like AFE SRAM */
> +	mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIOINTBUS]);
> +	mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIOINTBUS],
> +				  afe_priv->clk[MT8196_CLK_VLP_CLK26M]);
> +	/* enable audio vlp clock source */
> +	mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
> +	mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
> +				  afe_priv->clk[MT8196_CLK_VLP_CLK26M]);
> +
> +	/* AFE hw clock */
> +	/* IPM2.0: USE HOPPING & 26M */
> +	mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_AUDIO_HOPPING]);
> +	mt8196_afe_enable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_AUDIO_F26M]);
> +	return 0;
> +}
> +
> +int mt8196_afe_disable_reg_rw_clk(struct mtk_base_afe *afe)
> +{
> +	struct mt8196_afe_private *afe_priv = afe->platform_priv;
> +
> +	/* IPM2.0: Use HOPPING & 26M */
> +	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_AUDIO_HOPPING]);
> +	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_AFE_AUDIO_F26M]);
> +	mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H],
> +				  afe_priv->clk[MT8196_CLK_VLP_CLK26M]);
> +
> +	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIO_H]);
> +	mt8196_afe_set_clk_parent(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIOINTBUS],
> +				  afe_priv->clk[MT8196_CLK_VLP_CLK26M]);
> +	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_VLP_MUX_AUDIOINTBUS]);
> +	mt8196_afe_disable_clk(afe, afe_priv->clk[MT8196_CLK_TOP_ADSP_SEL]);
> +	return 0;
> +}
> +
> +int mt8196_afe_enable_main_clock(struct mtk_base_afe *afe)
> +{

Just directly call

	mt8196_afe_enable_top_cg(afe, MT8196_AUDIO_26M_EN_ON);

...and drop mt8196_afe_enable_afe_on()

> +	mt8196_afe_enable_afe_on(afe);
> +	return 0;
> +}
> +
> +int mt8196_afe_disable_main_clock(struct mtk_base_afe *afe)
> +{
> +	mt8196_afe_disable_afe_on(afe);

mt8196_afe_disable_top_cg(afe, MT8196_AUDIO_26M_EN_ON);


> +	return 0;
> +}
> +
> +int mt8196_init_clock(struct mtk_base_afe *afe)
> +{
> +	struct mt8196_afe_private *afe_priv = afe->platform_priv;
> +	int ret = 0;
> +	int i = 0;
> +
> +	ret = mt8196_audsys_clk_register(afe);
> +	if (ret) {
> +		dev_err(afe->dev, "register audsys clk fail %d\n", ret);
> +		return ret;
> +	}
> +
> +	afe_priv->clk = devm_kcalloc(afe->dev, MT8196_CLK_NUM, sizeof(*afe_priv->clk),
> +				     GFP_KERNEL);
> +	if (!afe_priv->clk)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < MT8196_CLK_NUM; i++) {
> +		afe_priv->clk[i] = devm_clk_get(afe->dev, aud_clks[i]);
> +		if (IS_ERR(afe_priv->clk[i])) {
> +			dev_err(afe->dev, "devm_clk_get %s fail\n", aud_clks[i]);
> +			return PTR_ERR(afe_priv->clk[i]);
> +		}
> +	}
> +
> +	afe_priv->vlp_ck = syscon_regmap_lookup_by_phandle(afe->dev->of_node,
> +							   "vlpcksys");
> +	if (IS_ERR(afe_priv->vlp_ck)) {
> +		dev_err(afe->dev, "Cannot find vlpcksys\n");
> +		return PTR_ERR(afe_priv->vlp_ck);
> +	}
> +
> +	mt8196_afe_apll_init(afe);
> +
> +	ret = mt8196_afe_disable_apll(afe);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.h b/sound/soc/mediatek/mt8196/mt8196-afe-clk.h
> new file mode 100644
> index 000000000000..60f5e5a157d5
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.h
> @@ -0,0 +1,142 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * mt8196-afe-clk.h  --  Mediatek 8196 afe clock ctrl definition

mt8196-afe-clk.h - MediaTek MT8195 AFE Clock Control definitions

> + *
> + * Copyright (c) 2024 MediaTek Inc.
> + *  Author: Darren Ye <darren.ye@mediatek.com>
> + */
> +

..snip..

> diff --git a/sound/soc/mediatek/mt8196/mt8196-audsys-clk.c b/sound/soc/mediatek/mt8196/mt8196-audsys-clk.c
> new file mode 100644
> index 000000000000..aa40f02698ac
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8196/mt8196-audsys-clk.c
> @@ -0,0 +1,252 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * mt8196-audsys-clk.c  --  MediaTek 8196 audsys clock control
> + *
> + * Copyright (c) 2025 MediaTek Inc.
> + * Author: Darren Ye <darren.ye@mediatek.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/clkdev.h>
> +#include "mt8196-afe-common.h"
> +#include "mt8196-audsys-clk.h"
> +#include "mt8196-audsys-clkid.h"
> +#include "mt8196-reg.h"
> +
..snip..


> +};
> +
> +static void mt8196_audsys_clk_unregister(void *data)
> +{
> +	struct mtk_base_afe *afe = data;
> +	struct mt8196_afe_private *afe_priv = afe->platform_priv;
> +	struct clk *clk;
> +	struct clk_lookup *cl;
> +	int i;
> +
> +	if (!afe_priv)
> +		return;
> +
> +	for (i = 0; i < CLK_AFE_NR_CLK; i++) {
> +		cl = afe_priv->lookup[i];
> +		if (!cl)
> +			continue;
> +
> +		clk = cl->clk;
> +		clk_unregister_gate(clk);
> +
> +		clkdev_drop(cl);
> +	}
> +}
> +
> +int mt8196_audsys_clk_register(struct mtk_base_afe *afe)
> +{
> +	struct mt8196_afe_private *afe_priv = afe->platform_priv;
> +	struct clk *clk;
> +	struct clk_lookup *cl;
> +	int i;
> +
> +	afe_priv->lookup = devm_kcalloc(afe->dev, CLK_AFE_NR_CLK,
> +					sizeof(*afe_priv->lookup),
> +					GFP_KERNEL);
> +
> +	if (!afe_priv->lookup)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < ARRAY_SIZE(aud_clks); i++) {
> +		const struct afe_gate *gate = &aud_clks[i];
> +
> +		clk = clk_register_gate(afe->dev, gate->name, gate->parent_name,
> +					gate->flags, afe->base_addr + gate->reg,
> +					gate->bit, gate->cg_flags, NULL);
> +
> +		if (IS_ERR(clk)) {
> +			dev_err(afe->dev, "Failed to register clk %s: %ld\n",
> +				gate->name, PTR_ERR(clk));
> +			continue;
> +		}
> +

All of the above, until...

> +		/* add clk_lookup for devm_clk_get(SND_SOC_DAPM_CLOCK_SUPPLY) */
> +		cl = kzalloc(sizeof(*cl), GFP_KERNEL);
> +		if (!cl)
> +			return -ENOMEM;
> +
> +		cl->clk = clk;
> +		cl->con_id = gate->name;
> +		cl->dev_id = dev_name(afe->dev);
> +		cl->clk_hw = NULL;
> +		clkdev_add(cl);


...here, can be simplified with a single call to

clk_register_clkdev(clk, gate->name, dev_name(afe->dev))

or alternatively, you could simplify it even more:


static void mt8196_audsys_clk_unregister(void *data)
{
	/* nothing to do here, remove this function */
}

int mt8196_audsys_clk_register(struct mtk_base_afe *afe)
{
	struct mt8196_afe_private *afe_priv = afe->platform_priv;
	int i, ret;

	for (i = 0; i < ARRAY_SIZE(aud_clks); i++) {
		const struct afe_gate *gate = &aud_clks[i];
		struct clk_hw *hw;

		hw = devm_clk_hw_register_gate(afe->dev, gate->name, gate->parent_name,
					       gate->flags, afe->base_addr + gate->reg,
					       gate->bit, gate->cg_flags, NULL);
		if (IS_ERR(clk)) {
			dev_err(afe->dev, "Failed to register clk %s: %ld\n",
				gate->name, PTR_ERR(clk));
			continue;
		}

		ret = devm_clk_hw_register_clkdev(afe->dev, hw, gate->name, dev_name(afe->dev));
		if (ret)
			return ret;
	}

	return 0;
}



> +
> +		afe_priv->lookup[i] = cl;
> +	}
> +
> +	return devm_add_action_or_reset(afe->dev, mt8196_audsys_clk_unregister, afe);
> +}

Cheers,
Angelo

