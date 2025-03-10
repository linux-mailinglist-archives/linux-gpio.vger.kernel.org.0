Return-Path: <linux-gpio+bounces-17388-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F5ECA599DB
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 16:23:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A16F77A32BB
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 15:22:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7F0622D7A6;
	Mon, 10 Mar 2025 15:23:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="cSv3Pkbc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAE7227EBB;
	Mon, 10 Mar 2025 15:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741620200; cv=none; b=qEM9K3N1KmyyZPyk30XjZaMCiydj0vEjtHJ6UWx4MSjHzk2qo/nvaGDf3ETYM0mWNlE6egapjuG1BR1jFx/5hBqhnt0cxwM70C1o3kxtQxBGg1SNc37t+QPPwx8s722+mrY25xvmnuMjLpPhXqBPwu9iV8jeHbAScrVhGuoht5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741620200; c=relaxed/simple;
	bh=kUTwQtxsgK7rxyrpE/72Fu2N4JnF9a71cxgDVKoRydU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bzH6DinSmOYXecyR6bnOQYSlU3PyzE4RJHVFCYesWYgMhGtK5dBt6oDAlqa4XOFz87SpStHEFA3a4PIboJ9HVtnV+AH3pB2ws77qcvJP0ctFIUZmDR25q9lyj32f19mgSl3gKaSuDXYWdpelTum6q+qHYUwudnhE4jroSs5MByg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=cSv3Pkbc; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741620195;
	bh=kUTwQtxsgK7rxyrpE/72Fu2N4JnF9a71cxgDVKoRydU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cSv3PkbcNOYgyxXJqes8cWnEKcYGZMcNxDnvq25RmxH609Vmhqh/w491i+DEjms5r
	 1PTPvIIfXIsQl1xOXHYXR6c/iEJKxXlqCdRdLin0icAo6XxSc7ORWRqjADpO3nwxhM
	 SlaeZP9akkknx7ObrmIO3sa6ZsYE43npbgB4KnH7BHgC2vcouZ5EoT1esE2Wt8yJFC
	 AckbDa/Zrw+Y/0/B7BsEsbVHmDgxKO1JzUO63xwTh1PTHABjIp/WckS2rk3Po2jY8C
	 ihHmUWAIkfWEOa9ndQnqMeSw48XuaWWws3w4T/AUJhB178aND6pISEfi9SDE8JHiG1
	 qDn0snP+h1b4A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F2E4217E05C3;
	Mon, 10 Mar 2025 16:23:13 +0100 (CET)
Message-ID: <d3b7c00a-1d22-47f2-a4da-7062a08c9b12@collabora.com>
Date: Mon, 10 Mar 2025 16:23:13 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/14] ASoC: mediatek: mt8196: support audio clock control
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
References: <20250307124841.23777-1-darren.ye@mediatek.com>
 <20250307124841.23777-6-darren.ye@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250307124841.23777-6-darren.ye@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 07/03/25 13:47, Darren.Ye ha scritto:
> From: Darren Ye <darren.ye@mediatek.com>
> 
> Add audio clock wrapper and audio tuner control.
> 
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> ---
>   sound/soc/mediatek/mt8196/mt8196-afe-clk.c | 698 +++++++++++++++++++++
>   sound/soc/mediatek/mt8196/mt8196-afe-clk.h | 313 +++++++++
>   2 files changed, 1011 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-clk.c
>   create mode 100644 sound/soc/mediatek/mt8196/mt8196-afe-clk.h
> 
> diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.c b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
> new file mode 100644
> index 000000000000..d1407d7bf775
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.c
> @@ -0,0 +1,698 @@
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
> +#include "mt8196-afe-common.h"
> +#include "mt8196-afe-clk.h"
> +
> +static DEFINE_MUTEX(mutex_request_dram);
> +
> +static const char *aud_clks[CLK_NUM] = {
> +	[CLK_HOPPING] = "aud_hopping_clk",
> +	[CLK_F26M] = "aud_f26m_clk",
> +	[CLK_UL0_ADC_CLK] = "aud_ul0_adc_clk",
> +	[CLK_UL0_ADC_HIRES_CLK] = "aud_ul0_adc_hires_clk",
> +	[CLK_UL1_ADC_CLK] = "aud_ul1_adc_clk",
> +	[CLK_UL1_ADC_HIRES_CLK] = "aud_ul1_adc_hires_clk",
> +	[CLK_APLL1] = "aud_apll1_clk",
> +	[CLK_APLL2] = "aud_apll2_clk",
> +	[CLK_APLL1_TUNER] = "aud_apll_tuner1_clk",
> +	[CLK_APLL2_TUNER] = "aud_apll_tuner2_clk",
> +	[CLK_VLP_MUX_AUDIOINTBUS] = "vlp_mux_audio_int",
> +	[CLK_VLP_MUX_AUD_ENG1] = "vlp_mux_aud_eng1",
> +	[CLK_VLP_MUX_AUD_ENG2] = "vlp_mux_aud_eng2",
> +	[CLK_VLP_MUX_AUDIO_H] = "vlp_mux_audio_h",
> +	[CLK_VLP_CLK26M] = "vlp_clk26m_clk",
> +	[CLK_CK_MAINPLL_D4_D4] = "ck_mainpll_d4_d4",
> +	[CLK_CK_MUX_AUD_1] = "ck_mux_aud_1",
> +	[CLK_CK_APLL1_CK] = "ck_apll1_ck",
> +	[CLK_CK_MUX_AUD_2] = "ck_mux_aud_2",
> +	[CLK_CK_APLL2_CK] = "ck_apll2_ck",
> +	[CLK_CK_APLL1_D4] = "ck_apll1_d4",
> +	[CLK_CK_APLL2_D4] = "ck_apll2_d4",
> +	[CLK_CK_I2SIN0_M_SEL] = "ck_i2sin0_m_sel",
> +	[CLK_CK_I2SIN1_M_SEL] = "ck_i2sin1_m_sel",
> +	[CLK_CK_FMI2S_M_SEL] = "ck_fmi2s_m_sel",
> +	[CLK_CK_TDMOUT_M_SEL] = "ck_tdmout_m_sel",
> +	[CLK_CK_APLL12_DIV_I2SIN0] = "ck_apll12_div_i2sin0",
> +	[CLK_CK_APLL12_DIV_I2SIN1] = "ck_apll12_div_i2sin1",
> +	[CLK_CK_APLL12_DIV_FMI2S] = "ck_apll12_div_fmi2s",
> +	[CLK_CK_APLL12_DIV_TDMOUT_M] = "ck_apll12_div_tdmout_m",
> +	[CLK_CK_APLL12_DIV_TDMOUT_B] = "ck_apll12_div_tdmout_b",
> +	[CLK_CK_ADSP_SEL] = "ck_adsp_sel",
> +	[CLK_CLK26M] = "ck_clk26m_clk",
> +};
> +
> +int mt8196_set_audio_int_bus_parent(struct mtk_base_afe *afe,
> +				    int clk_id, bool int_bus)
> +{
> +	struct mt8196_afe_private *afe_priv = afe->platform_priv;
> +	struct clk *clk;
> +	int ret;
> +
> +	if (clk_id >= CLK_NUM || clk_id < 0)
> +		return -EINVAL;
> +
> +	clk = int_bus ? afe_priv->clk[CLK_VLP_MUX_AUDIOINTBUS] :
> +			afe_priv->clk[CLK_VLP_MUX_AUDIO_H];
> +	ret = clk_set_parent(clk, afe_priv->clk[clk_id]);
> +	if (ret)
> +		dev_err(afe->dev, "%s() clk_set_parent %s fail %d, int_bus %d\n",
> +			__func__, aud_clks[clk_id], ret, int_bus);

if (ret) {
	dev_err....
	return ret;
}

return 0;

> +
> +	return ret;
> +}
> +

..snip..

> +
> +int mt8196_afe_disable_apll(struct mtk_base_afe *afe)
> +{
> +	struct mt8196_afe_private *afe_priv = afe->platform_priv;
> +	int ret = 0;
> +
> +	dev_dbg(afe->dev, "%s() successfully start\n", __func__);
> +
> +	ret = clk_prepare_enable(afe_priv->clk[CLK_VLP_MUX_AUDIO_H]);
> +	if (ret) {
> +		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
> +			__func__, aud_clks[CLK_VLP_MUX_AUDIO_H], ret);
> +		goto EXIT;

You don't need the goto here.
Just return ret.

> +	}
> +
> +	ret = clk_prepare_enable(afe_priv->clk[CLK_CK_MUX_AUD_1]);
> +	if (ret) {
> +		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
> +			__func__, aud_clks[CLK_CK_MUX_AUD_1], ret);
> +		goto EXIT;

Here you do need the goto, but that's to revert the changes that you've done
with the previous clk_prepare_enable() call.

> +	}
> +
> +	ret = clk_set_parent(afe_priv->clk[CLK_CK_MUX_AUD_1],
> +			     afe_priv->clk[CLK_CLK26M]);
> +	if (ret) {
> +		dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
> +			__func__, aud_clks[CLK_CK_MUX_AUD_1],
> +			aud_clks[CLK_CLK26M], ret);
> +		goto EXIT;
> +	}
> +	ret = clk_prepare_enable(afe_priv->clk[CLK_CK_MUX_AUD_2]);
> +	if (ret) {
> +		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
> +			__func__, aud_clks[CLK_CK_MUX_AUD_2], ret);
> +		goto EXIT;
> +	}
> +
> +	ret = clk_set_parent(afe_priv->clk[CLK_CK_MUX_AUD_2],
> +			     afe_priv->clk[CLK_CLK26M]);
> +	if (ret) {
> +		dev_err(afe->dev, "%s clk_set_parent %s-%s fail %d\n",
> +			__func__, aud_clks[CLK_CK_MUX_AUD_2],
> +			aud_clks[CLK_CLK26M], ret);
> +		goto EXIT;
> +	}
> +
> +	clk_disable_unprepare(afe_priv->clk[CLK_CK_MUX_AUD_1]);
> +	clk_disable_unprepare(afe_priv->clk[CLK_CK_MUX_AUD_2]);
> +	mt8196_set_audio_int_bus_parent(afe, CLK_VLP_CLK26M, false);
> +	clk_disable_unprepare(afe_priv->clk[CLK_VLP_MUX_AUDIO_H]);
> +
> +	return 0;
> +EXIT:

lower case please.

> +	return ret;
> +}
> +
> +static int mt8196_afe_apll_init(struct mtk_base_afe *afe)
> +{
> +	struct mt8196_afe_private *afe_priv = afe->platform_priv;
> +
> +	/* VLP_APLL1_CON0 = 0x6f28bd4c
> +	 * VLP_APLL2_CON2 = 0x78FD5264
> +	 * VLP_APLL1_TUNER_CON0 = 0x6f28bd4d
> +	 * VLP_APLL2_TUNER_CON0 = 0x78fd5265
> +	 */
> +	if (afe_priv->vlp_ck) {
> +		regmap_write(afe_priv->vlp_ck, VLP_APLL1_TUNER_CON0, 0x6f28bd4d);
> +		regmap_write(afe_priv->vlp_ck, VLP_APLL2_TUNER_CON0, 0x78fd5265);

No magic numbers please.

> +	} else {
> +		dev_warn(afe->dev, "%s vlp_ck regmap is null ptr\n", __func__);
> +	}
> +	return 0;
> +}
> +

..snip..

> +int mt8196_apll1_enable(struct mtk_base_afe *afe)
> +{
> +	struct mt8196_afe_private *afe_priv = afe->platform_priv;
> +	int ret;
> +
> +	/* setting for APLL */
> +	apll1_mux_setting(afe, true);
> +
> +	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL1]);
> +	if (ret) {
> +		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
> +			__func__, aud_clks[CLK_APLL1], ret);
> +		goto ERR_CLK_APLL1;
> +	}
> +
> +	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL1_TUNER]);
> +	if (ret) {
> +		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
> +			__func__, aud_clks[CLK_APLL1_TUNER], ret);
> +		goto ERR_CLK_APLL1_TUNER;
> +	}
> +
> +	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG,
> +			   0x0000FFF7, 0x00000372);

No magic numbers please.

> +	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG, 0x1, 0x1);
> +
> +	regmap_update_bits(afe->regmap, AUDIO_ENGEN_CON0,
> +			   AUDIO_APLL1_EN_ON_MASK_SFT,
> +			   0x1 << AUDIO_APLL1_EN_ON_SFT);
> +	return 0;
> +
> +ERR_CLK_APLL1_TUNER:
> +	clk_disable_unprepare(afe_priv->clk[CLK_APLL1_TUNER]);
> +ERR_CLK_APLL1:
> +	clk_disable_unprepare(afe_priv->clk[CLK_APLL1]);
> +
> +	return ret;
> +}
> +
> +void mt8196_apll1_disable(struct mtk_base_afe *afe)
> +{
> +	struct mt8196_afe_private *afe_priv = afe->platform_priv;
> +
> +	regmap_update_bits(afe->regmap, AUDIO_ENGEN_CON0,
> +			   AUDIO_APLL1_EN_ON_MASK_SFT,
> +			   0x0 << AUDIO_APLL1_EN_ON_SFT);

0 << (anything) is ... zero. Just write 0.

> +
> +	regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG, 0x1, 0x0);

That 0x1 is a mask for a bit

#define SOMETHING BIT(0)

regmap_update_bits(afe->regmap, AFE_APLL1_TUNER_CFG, SOMETHING, 0);

> +
> +	clk_disable_unprepare(afe_priv->clk[CLK_APLL1_TUNER]);
> +	clk_disable_unprepare(afe_priv->clk[CLK_APLL1]);
> +
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
> +	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL2]);
> +	if (ret) {
> +		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
> +			__func__, aud_clks[CLK_APLL2], ret);
> +		goto ERR_CLK_APLL2;
> +	}
> +
> +	ret = clk_prepare_enable(afe_priv->clk[CLK_APLL2_TUNER]);
> +	if (ret) {
> +		dev_err(afe->dev, "%s clk_prepare_enable %s fail %d\n",
> +			__func__, aud_clks[CLK_APLL2_TUNER], ret);
> +		goto ERR_CLK_APLL2_TUNER;
> +	}
> +
> +	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG,
> +			   0x0000FFF7, 0x00000374);
> +	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG, 0x1, 0x1);
> +
> +	regmap_update_bits(afe->regmap, AUDIO_ENGEN_CON0,
> +			   AUDIO_APLL2_EN_ON_MASK_SFT,
> +			   0x1 << AUDIO_APLL2_EN_ON_SFT);
> +
> +	return 0;
> +
> +ERR_CLK_APLL2_TUNER:
> +	clk_disable_unprepare(afe_priv->clk[CLK_APLL2_TUNER]);
> +ERR_CLK_APLL2:
> +	clk_disable_unprepare(afe_priv->clk[CLK_APLL2]);
> +
> +	return ret;
> +
> +	return 0;
> +}
> +
> +void mt8196_apll2_disable(struct mtk_base_afe *afe)
> +{
> +	struct mt8196_afe_private *afe_priv = afe->platform_priv;
> +
> +	regmap_update_bits(afe->regmap, AUDIO_ENGEN_CON0,
> +			   AUDIO_APLL2_EN_ON_MASK_SFT,
> +			   0x0 << AUDIO_APLL2_EN_ON_SFT);
> +
> +	regmap_update_bits(afe->regmap, AFE_APLL2_TUNER_CFG, 0x1, 0x0);
> +
> +	clk_disable_unprepare(afe_priv->clk[CLK_APLL2_TUNER]);
> +	clk_disable_unprepare(afe_priv->clk[CLK_APLL2]);
> +
> +	apll2_mux_setting(afe, false);
> +}
> +
> +int mt8196_get_apll_rate(struct mtk_base_afe *afe, int apll)
> +{
> +	return (apll == MT8196_APLL1) ? 180633600 : 196608000;

If those are PLLs for real (and they are), you should read the rate from the actual
PLL, instead of just ignoring everything and pretending that the rate is either
X or Y.

> +}
> +
> +int mt8196_get_apll_by_rate(struct mtk_base_afe *afe, int rate)
> +{
> +	return ((rate % 8000) == 0) ? MT8196_APLL2 : MT8196_APLL1;
> +}
> +
> +int mt8196_get_apll_by_name(struct mtk_base_afe *afe, const char *name)
> +{
> +	if (strcmp(name, APLL1_W_NAME) == 0)
> +		return MT8196_APLL1;
> +	else
> +		return MT8196_APLL2;
> +}
> +

..snip..

> diff --git a/sound/soc/mediatek/mt8196/mt8196-afe-clk.h b/sound/soc/mediatek/mt8196/mt8196-afe-clk.h
> new file mode 100644
> index 000000000000..0094aebc8bba
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8196/mt8196-afe-clk.h
> @@ -0,0 +1,313 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * mt8196-afe-clk.h  --  Mediatek 8196 afe clock ctrl definition
> + *
> + * Copyright (c) 2024 MediaTek Inc.
> + *  Author: Darren Ye <darren.ye@mediatek.com>
> + */
> +
> +#ifndef _MT8196_AFE_CLOCK_CTRL_H_
> +#define _MT8196_AFE_CLOCK_CTRL_H_
> +
> +// vlp_cksys_clk: 0x1c016000

Consistent comment style please.

> +#define VLP_AP_PLL_CON3 0x0264
> +#define VLP_APLL1_CON0 0x0274
> +#define VLP_APLL1_CON1 0x0278
> +#define VLP_APLL1_CON2 0x027c
> +#define VLP_APLL1_CON4 0x0284
> +#define VLP_APLL1_TUNER_CON0 0x02a4
> +
> +#define VLP_APLL2_CON0 0x028c
> +#define VLP_APLL2_CON1 0x0290
> +#define VLP_APLL2_CON2 0x0294
> +#define VLP_APLL2_CON4 0x029c
> +#define VLP_APLL2_TUNER_CON0 0x02a8
> +#define VLP_CLK_CFG_UPDATE1 0x0008
> +
> +// cksys_clk: 0x10000000
> +#define CLK_CFG_13 0x00e0
> +#define CLK_CFG_UPDATE1 0x0008
> +
> +#define CLK_AUDDIV_0 0x020c
> +#define CLK_AUDDIV_2 0x0214
> +#define CLK_AUDDIV_5 0x0228
> +
> +#define CKSYS_AUD_TOP_CFG 0x0218
> +
> +/* CLK_AUDDIV_0 */
> +#define APLL12_DIV_I2SIN0_PDN_SFT               0
> +#define APLL12_DIV_I2SIN0_PDN_MASK              0x1
> +#define APLL12_DIV_I2SIN0_PDN_MASK_SFT          (0x1 << 0)

This is BIT(0)

> +#define APLL12_DIV_I2SIN1_PDN_SFT               1
> +#define APLL12_DIV_I2SIN1_PDN_MASK              0x1
> +#define APLL12_DIV_I2SIN1_PDN_MASK_SFT          (0x1 << 1)

BIT(1)

> +#define APLL12_DIV_I2SIN2_PDN_SFT               2
> +#define APLL12_DIV_I2SIN2_PDN_MASK              0x1
> +#define APLL12_DIV_I2SIN2_PDN_MASK_SFT          (0x1 << 2)

BIT(2)

> +#define APLL12_DIV_I2SIN3_PDN_SFT               3
> +#define APLL12_DIV_I2SIN3_PDN_MASK              0x1
> +#define APLL12_DIV_I2SIN3_PDN_MASK_SFT          (0x1 << 3)

...etc

> +#define APLL12_DIV_I2SIN4_PDN_SFT               4
> +#define APLL12_DIV_I2SIN4_PDN_MASK              0x1
> +#define APLL12_DIV_I2SIN4_PDN_MASK_SFT          (0x1 << 4)
> +#define APLL12_DIV_I2SIN6_PDN_SFT               5
> +#define APLL12_DIV_I2SIN6_PDN_MASK              0x1
> +#define APLL12_DIV_I2SIN6_PDN_MASK_SFT          (0x1 << 5)
> +#define APLL12_DIV_I2SOUT0_PDN_SFT              6
> +#define APLL12_DIV_I2SOUT0_PDN_MASK             0x1
> +#define APLL12_DIV_I2SOUT0_PDN_MASK_SFT         (0x1 << 6)
> +#define APLL12_DIV_I2SOUT1_PDN_SFT              7
> +#define APLL12_DIV_I2SOUT1_PDN_MASK             0x1
> +#define APLL12_DIV_I2SOUT1_PDN_MASK_SFT         (0x1 << 7)
> +#define APLL12_DIV_I2SOUT2_PDN_SFT              8
> +#define APLL12_DIV_I2SOUT2_PDN_MASK             0x1
> +#define APLL12_DIV_I2SOUT2_PDN_MASK_SFT         (0x1 << 8)
> +#define APLL12_DIV_I2SOUT3_PDN_SFT              9
> +#define APLL12_DIV_I2SOUT3_PDN_MASK             0x1
> +#define APLL12_DIV_I2SOUT3_PDN_MASK_SFT         (0x1 << 9)
> +#define APLL12_DIV_I2SOUT4_PDN_SFT              10
> +#define APLL12_DIV_I2SOUT4_PDN_MASK             0x1
> +#define APLL12_DIV_I2SOUT4_PDN_MASK_SFT         (0x1 << 10)
> +#define APLL12_DIV_I2SOUT6_PDN_SFT              11
> +#define APLL12_DIV_I2SOUT6_PDN_MASK             0x1
> +#define APLL12_DIV_I2SOUT6_PDN_MASK_SFT         (0x1 << 11)
> +#define APLL12_DIV_FMI2S_PDN_SFT                12
> +#define APLL12_DIV_FMI2S_PDN_MASK               0x1
> +#define APLL12_DIV_FMI2S_PDN_MASK_SFT           (0x1 << 12)
> +#define APLL12_DIV_TDMOUT_M_PDN_SFT             13
> +#define APLL12_DIV_TDMOUT_M_PDN_MASK            0x1
> +#define APLL12_DIV_TDMOUT_M_PDN_MASK_SFT        (0x1 << 13)
> +#define APLL12_DIV_TDMOUT_B_PDN_SFT             14
> +#define APLL12_DIV_TDMOUT_B_PDN_MASK            0x1
> +#define APLL12_DIV_TDMOUT_B_PDN_MASK_SFT        (0x1 << 14)
> +#define APLL_I2SIN0_MCK_SEL_SFT                 16
> +#define APLL_I2SIN0_MCK_SEL_MASK                0x1
> +#define APLL_I2SIN0_MCK_SEL_MASK_SFT            (0x1 << 16)
> +#define APLL_I2SIN1_MCK_SEL_SFT                 17
> +#define APLL_I2SIN1_MCK_SEL_MASK                0x1
> +#define APLL_I2SIN1_MCK_SEL_MASK_SFT            (0x1 << 17)
> +#define APLL_I2SIN2_MCK_SEL_SFT                 18
> +#define APLL_I2SIN2_MCK_SEL_MASK                0x1
> +#define APLL_I2SIN2_MCK_SEL_MASK_SFT            (0x1 << 18)
> +#define APLL_I2SIN3_MCK_SEL_SFT                 19
> +#define APLL_I2SIN3_MCK_SEL_MASK                0x1
> +#define APLL_I2SIN3_MCK_SEL_MASK_SFT            (0x1 << 19)
> +#define APLL_I2SIN4_MCK_SEL_SFT                 20
> +#define APLL_I2SIN4_MCK_SEL_MASK                0x1
> +#define APLL_I2SIN4_MCK_SEL_MASK_SFT            (0x1 << 20)
> +#define APLL_I2SIN6_MCK_SEL_SFT                 21
> +#define APLL_I2SIN6_MCK_SEL_MASK                0x1
> +#define APLL_I2SIN6_MCK_SEL_MASK_SFT            (0x1 << 21)
> +#define APLL_I2SOUT0_MCK_SEL_SFT                22
> +#define APLL_I2SOUT0_MCK_SEL_MASK               0x1
> +#define APLL_I2SOUT0_MCK_SEL_MASK_SFT           (0x1 << 22)
> +#define APLL_I2SOUT1_MCK_SEL_SFT                23
> +#define APLL_I2SOUT1_MCK_SEL_MASK               0x1
> +#define APLL_I2SOUT1_MCK_SEL_MASK_SFT           (0x1 << 23)
> +#define APLL_I2SOUT2_MCK_SEL_SFT                24
> +#define APLL_I2SOUT2_MCK_SEL_MASK               0x1
> +#define APLL_I2SOUT2_MCK_SEL_MASK_SFT           (0x1 << 24)
> +#define APLL_I2SOUT3_MCK_SEL_SFT                25
> +#define APLL_I2SOUT3_MCK_SEL_MASK               0x1
> +#define APLL_I2SOUT3_MCK_SEL_MASK_SFT           (0x1 << 25)
> +#define APLL_I2SOUT4_MCK_SEL_SFT                26
> +#define APLL_I2SOUT4_MCK_SEL_MASK               0x1
> +#define APLL_I2SOUT4_MCK_SEL_MASK_SFT           (0x1 << 26)
> +#define APLL_I2SOUT6_MCK_SEL_SFT                27
> +#define APLL_I2SOUT6_MCK_SEL_MASK               0x1
> +#define APLL_I2SOUT6_MCK_SEL_MASK_SFT           (0x1 << 27)
> +#define APLL_FMI2S_MCK_SEL_SFT                  28
> +#define APLL_FMI2S_MCK_SEL_MASK                 0x1
> +#define APLL_FMI2S_MCK_SEL_MASK_SFT             (0x1 << 28)
> +#define APLL_TDMOUT_MCK_SEL_SFT                 29
> +#define APLL_TDMOUT_MCK_SEL_MASK                0x1
> +#define APLL_TDMOUT_MCK_SEL_MASK_SFT            (0x1 << 29)
> +
> +/* CLK_AUDDIV_1 */
> +#define APLL12_DIV_I2SIN0_INV_SFT               0
> +#define APLL12_DIV_I2SIN0_INV_MASK              0x1
> +#define APLL12_DIV_I2SIN0_INV_MASK_SFT          (0x1 << 0)
> +#define APLL12_DIV_I2SIN1_INV_SFT               1
> +#define APLL12_DIV_I2SIN1_INV_MASK              0x1
> +#define APLL12_DIV_I2SIN1_INV_MASK_SFT          (0x1 << 1)
> +#define APLL12_DIV_I2SIN2_INV_SFT               2
> +#define APLL12_DIV_I2SIN2_INV_MASK              0x1
> +#define APLL12_DIV_I2SIN2_INV_MASK_SFT          (0x1 << 2)
> +#define APLL12_DIV_I2SIN3_INV_SFT               3
> +#define APLL12_DIV_I2SIN3_INV_MASK              0x1
> +#define APLL12_DIV_I2SIN3_INV_MASK_SFT          (0x1 << 3)
> +#define APLL12_DIV_I2SIN4_INV_SFT               4
> +#define APLL12_DIV_I2SIN4_INV_MASK              0x1
> +#define APLL12_DIV_I2SIN4_INV_MASK_SFT          (0x1 << 4)
> +#define APLL12_DIV_I2SIN6_INV_SFT               5
> +#define APLL12_DIV_I2SIN6_INV_MASK              0x1
> +#define APLL12_DIV_I2SIN6_INV_MASK_SFT          (0x1 << 5)
> +#define APLL12_DIV_I2SOUT0_INV_SFT              6
> +#define APLL12_DIV_I2SOUT0_INV_MASK             0x1
> +#define APLL12_DIV_I2SOUT0_INV_MASK_SFT         (0x1 << 6)
> +#define APLL12_DIV_I2SOUT1_INV_SFT              7
> +#define APLL12_DIV_I2SOUT1_INV_MASK             0x1
> +#define APLL12_DIV_I2SOUT1_INV_MASK_SFT         (0x1 << 7)
> +#define APLL12_DIV_I2SOUT2_INV_SFT              8
> +#define APLL12_DIV_I2SOUT2_INV_MASK             0x1
> +#define APLL12_DIV_I2SOUT2_INV_MASK_SFT         (0x1 << 8)
> +#define APLL12_DIV_I2SOUT3_INV_SFT              9
> +#define APLL12_DIV_I2SOUT3_INV_MASK             0x1
> +#define APLL12_DIV_I2SOUT3_INV_MASK_SFT         (0x1 << 9)
> +#define APLL12_DIV_I2SOUT4_INV_SFT              10
> +#define APLL12_DIV_I2SOUT4_INV_MASK             0x1
> +#define APLL12_DIV_I2SOUT4_INV_MASK_SFT         (0x1 << 10)
> +#define APLL12_DIV_I2SOUT6_INV_SFT              11
> +#define APLL12_DIV_I2SOUT6_INV_MASK             0x1
> +#define APLL12_DIV_I2SOUT6_INV_MASK_SFT         (0x1 << 11)
> +#define APLL12_DIV_FMI2S_INV_SFT                12
> +#define APLL12_DIV_FMI2S_INV_MASK               0x1
> +#define APLL12_DIV_FMI2S_INV_MASK_SFT           (0x1 << 12)
> +#define APLL12_DIV_TDMOUT_M_INV_SFT             13
> +#define APLL12_DIV_TDMOUT_M_INV_MASK            0x1
> +#define APLL12_DIV_TDMOUT_M_INV_MASK_SFT        (0x1 << 13)
> +#define APLL12_DIV_TDMOUT_B_INV_SFT             14
> +#define APLL12_DIV_TDMOUT_B_INV_MASK            0x1
> +#define APLL12_DIV_TDMOUT_B_INV_MASK_SFT        (0x1 << 14)
> +
> +/* CLK_AUDDIV_2 */
> +#define APLL12_CK_DIV_I2SIN0_SFT                0
> +#define APLL12_CK_DIV_I2SIN0_MASK               0xff
> +#define APLL12_CK_DIV_I2SIN0_MASK_SFT           (0xff << 0)
> +#define APLL12_CK_DIV_I2SIN1_SFT                8
> +#define APLL12_CK_DIV_I2SIN1_MASK               0xff
> +#define APLL12_CK_DIV_I2SIN1_MASK_SFT           (0xff << 8)
> +#define APLL12_CK_DIV_I2SIN2_SFT                16
> +#define APLL12_CK_DIV_I2SIN2_MASK               0xff
> +#define APLL12_CK_DIV_I2SIN2_MASK_SFT           (0xff << 16)
> +#define APLL12_CK_DIV_I2SIN3_SFT                24
> +#define APLL12_CK_DIV_I2SIN3_MASK               0xff
> +#define APLL12_CK_DIV_I2SIN3_MASK_SFT           (0xff << 24)
> +
> +/* AUD_TOP_CFG */
> +#define AUD_TOP_CFG_SFT                         0
> +#define AUD_TOP_CFG_MASK                        0xffffffff
> +#define AUD_TOP_CFG_MASK_SFT                    (0xffffffff << 0)

Both of these are GENMASK(31, 0)

> +
> +/* AUD_TOP_MON */
> +#define AUD_TOP_MON_SFT                         0
> +#define AUD_TOP_MON_MASK                        0xffffffff
> +#define AUD_TOP_MON_MASK_SFT                    (0xffffffff << 0)

same

> +
> +/* CLK_AUDDIV_3 */
> +#define APLL12_CK_DIV_I2SIN4_SFT                0
> +#define APLL12_CK_DIV_I2SIN4_MASK               0xff
> +#define APLL12_CK_DIV_I2SIN4_MASK_SFT           (0xff << 0)

GENMASK(7, 0)

> +#define APLL12_CK_DIV_I2SIN6_SFT                8
> +#define APLL12_CK_DIV_I2SIN6_MASK               0xff
> +#define APLL12_CK_DIV_I2SIN6_MASK_SFT           (0xff << 8)

GENMASK(15, 8)

> +#define APLL12_CK_DIV_I2SOUT0_SFT               16
> +#define APLL12_CK_DIV_I2SOUT0_MASK              0xff
> +#define APLL12_CK_DIV_I2SOUT0_MASK_SFT          (0xff << 16)

...etc

> +#define APLL12_CK_DIV_I2SOUT1_SFT               24
> +#define APLL12_CK_DIV_I2SOUT1_MASK              0xff
> +#define APLL12_CK_DIV_I2SOUT1_MASK_SFT          (0xff << 24)
> +
> +/* CLK_AUDDIV_4 */
> +#define APLL12_CK_DIV_I2SOUT2_SFT               0
> +#define APLL12_CK_DIV_I2SOUT2_MASK              0xff
> +#define APLL12_CK_DIV_I2SOUT2_MASK_SFT          (0xff << 0)
> +#define APLL12_CK_DIV_I2SOUT3_SFT               8
> +#define APLL12_CK_DIV_I2SOUT3_MASK              0xff
> +#define APLL12_CK_DIV_I2SOUT3_MASK_SFT          (0xff << 8)
> +#define APLL12_CK_DIV_I2SOUT4_SFT               16
> +#define APLL12_CK_DIV_I2SOUT4_MASK              0xff
> +#define APLL12_CK_DIV_I2SOUT4_MASK_SFT          (0xff << 16)
> +#define APLL12_CK_DIV_I2SOUT6_SFT               24
> +#define APLL12_CK_DIV_I2SOUT6_MASK              0xff
> +#define APLL12_CK_DIV_I2SOUT6_MASK_SFT          (0xff << 24)
> +
> +/* CLK_AUDDIV_5 */
> +#define APLL12_CK_DIV_FMI2S_SFT                 0
> +#define APLL12_CK_DIV_FMI2S_MASK                0xff
> +#define APLL12_CK_DIV_FMI2S_MASK_SFT            (0xff << 0)
> +#define APLL12_CK_DIV_TDMOUT_M_SFT              8
> +#define APLL12_CK_DIV_TDMOUT_M_MASK             0xff
> +#define APLL12_CK_DIV_TDMOUT_M_MASK_SFT         (0xff << 8)
> +#define APLL12_CK_DIV_TDMOUT_B_SFT              16
> +#define APLL12_CK_DIV_TDMOUT_B_MASK             0xff
> +#define APLL12_CK_DIV_TDMOUT_B_MASK_SFT         (0xff << 16)
> +
> +/* APLL */
> +#define APLL1_W_NAME "APLL1"
> +#define APLL2_W_NAME "APLL2"
> +enum {
> +	MT8196_APLL1 = 0,
> +	MT8196_APLL2,
> +};
> +
> +enum {
> +	/* afe clk */
> +	CLK_HOPPING = 0,
> +	CLK_F26M,
> +	CLK_UL0_ADC_CLK,
> +	CLK_UL0_ADC_HIRES_CLK,
> +	CLK_UL1_ADC_CLK,
> +	CLK_UL1_ADC_HIRES_CLK,
> +	CLK_APLL1,
> +	CLK_APLL2,
> +	CLK_APLL1_TUNER,
> +	CLK_APLL2_TUNER,
> +	/* vlp clk */
> +	CLK_VLP_MUX_AUDIOINTBUS,
> +	CLK_VLP_MUX_AUD_ENG1,
> +	CLK_VLP_MUX_AUD_ENG2,
> +	CLK_VLP_MUX_AUDIO_H,
> +	CLK_VLP_CLK26M,
> +	/* ck clk */
> +	CLK_CK_MAINPLL_D4_D4,
> +	CLK_CK_MUX_AUD_1,
> +	CLK_CK_APLL1_CK,
> +	CLK_CK_MUX_AUD_2,
> +	CLK_CK_APLL2_CK,
> +	CLK_CK_APLL1_D4,
> +	CLK_CK_APLL2_D4,
> +	CLK_CK_I2SIN0_M_SEL,
> +	CLK_CK_I2SIN1_M_SEL,
> +	CLK_CK_FMI2S_M_SEL,
> +	CLK_CK_TDMOUT_M_SEL,
> +	CLK_CK_APLL12_DIV_I2SIN0,
> +	CLK_CK_APLL12_DIV_I2SIN1,
> +	CLK_CK_APLL12_DIV_FMI2S,
> +	CLK_CK_APLL12_DIV_TDMOUT_M,
> +	CLK_CK_APLL12_DIV_TDMOUT_B,
> +	CLK_CK_ADSP_SEL,
> +	CLK_CLK26M,
> +	CLK_NUM
> +};
> +
> +struct mtk_base_afe;
> +
> +int mt8196_init_clock(struct mtk_base_afe *afe);
> +int mt8196_afe_enable_clock(struct mtk_base_afe *afe);
> +void mt8196_afe_disable_clock(struct mtk_base_afe *afe);
> +int mt8196_afe_disable_apll(struct mtk_base_afe *afe);
> +
> +int mt8196_afe_dram_request(struct device *dev);
> +int mt8196_afe_dram_release(struct device *dev);
> +
> +int mt8196_apll1_enable(struct mtk_base_afe *afe);
> +void mt8196_apll1_disable(struct mtk_base_afe *afe);
> +
> +int mt8196_apll2_enable(struct mtk_base_afe *afe);
> +void mt8196_apll2_disable(struct mtk_base_afe *afe);
> +
> +int mt8196_get_apll_rate(struct mtk_base_afe *afe, int apll);
> +int mt8196_get_apll_by_rate(struct mtk_base_afe *afe, int rate);
> +int mt8196_get_apll_by_name(struct mtk_base_afe *afe, const char *name);
> +
> +void aud_intbus_mux_sel(unsigned int aud_idx);
> +
> +/* these will be replaced by using CCF */

Well, just replace them now instead of fixing them later.

Regards,
Angelo

> +int mt8196_mck_enable(struct mtk_base_afe *afe, int mck_id, int rate);
> +int mt8196_mck_disable(struct mtk_base_afe *afe, int mck_id);
> +
> +int mt8196_set_audio_int_bus_parent(struct mtk_base_afe *afe,
> +				    int clk_id, bool int_bus);
> +
> +#endif


