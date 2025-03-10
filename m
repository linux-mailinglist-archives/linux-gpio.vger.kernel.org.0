Return-Path: <linux-gpio+bounces-17389-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B850FA599DD
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 16:23:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 006137A33A7
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Mar 2025 15:22:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F32822DF8C;
	Mon, 10 Mar 2025 15:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ezMjG42P"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1523622B8AC;
	Mon, 10 Mar 2025 15:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741620201; cv=none; b=Y9vrfULYd159Gzu009FnhMKvG6dLyLHABG5K4jKw1ppFbctw6v9TG7pP3Xz4Gf4tX255+hPG8g1Mqt+2GVD/Hs01ecUHtiSCqQVOpe+EQA3dx/B+KofM2J210YWvmfhn9o/Y7Mof2Gfn8Vz4kfrXK2RHUUmrU4ZEVJXo0gUe3oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741620201; c=relaxed/simple;
	bh=FsrNob6nsYTinqMDLQnwxWB5JuebUVtbm6f9dPHEPmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DgfuI2Tr6pLyJG1S2u784nrajeS9U1M1l8pG1UxyBY1/WGD3Ec4HbO9VcybrSdZ6NH9Qy4JSzRJQpn595bxWvEuITK01OyxgGlW7H/V8zmjyEUdfFF8s4c8GEWpMhTeyCQvGGz9E3bl8ZiZzV3JboX6QVX7WPxxYrCAkSrlD9o8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ezMjG42P; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741620197;
	bh=FsrNob6nsYTinqMDLQnwxWB5JuebUVtbm6f9dPHEPmw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ezMjG42PQoCUvWJwyE1etSVSl2pOVbYTTFBd+tpINRFgO3taiRrn8PtdywMYwaP4x
	 aTwgNJu0MysIGfmJ2Y8sHI64TdtqS5u8bua/d9GF5qTejC+S0qNN5kMlpPQ1fTWlp/
	 NoJJ2+vAM5BdzXw42ug76qMeVZz3GIDlHBhIa5+Si+sSKb+yL1/eypZ/4pm2eYfNaP
	 0slTx2WoQjntpRwnDmIYjn+6I/ng4efwbcW3w+BOM52iCIzH4UWksnoHdIe87SDUQC
	 8R4PYUlwjdJQN+7k76aBvSvQD1IDaLwLSVixwpsgO0iNi0OV7SY/tXsGmptVsYu3rf
	 WCRYwVYeVW+Sg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 54CA417E0649;
	Mon, 10 Mar 2025 16:23:16 +0100 (CET)
Message-ID: <b5fd1376-6abb-40c1-b3f0-238e2b0056fa@collabora.com>
Date: Mon, 10 Mar 2025 16:23:15 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/14] ASoC: mediatek: common: modify mtk afe common
 driver for mt8196
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
 <20250307124841.23777-2-darren.ye@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250307124841.23777-2-darren.ye@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 07/03/25 13:47, Darren.Ye ha scritto:
> From: Darren Ye <darren.ye@mediatek.com>
> 
> Export register read and write interface, add sample reate interface, and
> update the mtk_memif_set_channel interface for the mt8196 platform.
> 
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> ---
>   sound/soc/mediatek/common/mtk-afe-fe-dai.c | 30 ++++++++++++++--------
>   sound/soc/mediatek/common/mtk-afe-fe-dai.h |  6 +++++
>   sound/soc/mediatek/common/mtk-base-afe.h   | 13 ++++++++++
>   3 files changed, 38 insertions(+), 11 deletions(-)
> 
> diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.c b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
> index 3809068f5620..c36dae520f04 100644
> --- a/sound/soc/mediatek/common/mtk-afe-fe-dai.c
> +++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.c
> @@ -18,7 +18,7 @@
>   
>   #define AFE_BASE_END_OFFSET 8
>   
> -static int mtk_regmap_update_bits(struct regmap *map, int reg,
> +int mtk_regmap_update_bits(struct regmap *map, int reg,
>   			   unsigned int mask,
>   			   unsigned int val, int shift)
>   {
> @@ -26,13 +26,16 @@ static int mtk_regmap_update_bits(struct regmap *map, int reg,
>   		return 0;
>   	return regmap_update_bits(map, reg, mask << shift, val << shift);
>   }
> +EXPORT_SYMBOL(mtk_regmap_update_bits);

Please don't export this function: it's not the greatest, `reg` should be unsigned
and so it should the shift - it's kinda wrong in principle, and you can simply use
regmap_update_bits() directly in your drivers. Please, do so.

> +
> +int mtk_regmap_write(struct regmap *map, int reg, unsigned int val)
>   
> -static int mtk_regmap_write(struct regmap *map, int reg, unsigned int val)
>   {
>   	if (reg < 0)
>   		return 0;
>   	return regmap_write(map, reg, val);
>   }
> +EXPORT_SYMBOL(mtk_regmap_write);
>   

Same here

>   int mtk_afe_fe_startup(struct snd_pcm_substream *substream,
>   		       struct snd_soc_dai *dai)
> @@ -459,8 +462,12 @@ int mtk_memif_set_channel(struct mtk_base_afe *afe,
>   	struct mtk_base_afe_memif *memif = &afe->memif[id];
>   	unsigned int mono;
>   
> -	if (memif->data->mono_shift < 0)
> -		return 0;
> +	dev_info(afe->dev, "%s(), id: %d, channel: %d\n", __func__, id, channel);

If you really really really need this print, it's for debugging, so this should be
dev_dbg() instead... but otherwise just delete it.

> +	mono = memif->data->mono_invert ^ (channel == 1);
> +
> +	if (memif->data->mono_shift > 0)
> +		mtk_regmap_update_bits(afe->regmap, memif->data->mono_reg,
> +				       0x1, mono, memif->data->mono_shift);
>   
>   	if (memif->data->quad_ch_mask) {
>   		unsigned int quad_ch = (channel == 4) ? 1 : 0;
> @@ -470,11 +477,6 @@ int mtk_memif_set_channel(struct mtk_base_afe *afe,
>   				       quad_ch, memif->data->quad_ch_shift);
>   	}
>   
> -	if (memif->data->mono_invert)
> -		mono = (channel == 1) ? 0 : 1;
> -	else
> -		mono = (channel == 1) ? 1 : 0;
> -
>   	/* for specific configuration of memif mono mode */
>   	if (memif->data->int_odd_flag_reg)
>   		mtk_regmap_update_bits(afe->regmap,
> @@ -482,8 +484,14 @@ int mtk_memif_set_channel(struct mtk_base_afe *afe,
>   				       1, mono,
>   				       memif->data->int_odd_flag_shift);
>   
> -	return mtk_regmap_update_bits(afe->regmap, memif->data->mono_reg,
> -				      1, mono, memif->data->mono_shift);

Don't break older platforms. You're removing functionality here.

> +	if (memif->data->ch_num_maskbit) {
> +		dev_info(afe->dev, "%s(), set ch num id: %d, channel: %d\n", __func__, id, channel);

Same comment applies (plus, this is a double print, even worse).

> +		mtk_regmap_update_bits(afe->regmap, memif->data->ch_num_reg,
> +				       memif->data->ch_num_maskbit,
> +				       channel, memif->data->ch_num_shift);
> +	}
> +
> +	return 0;
>   }
>   EXPORT_SYMBOL_GPL(mtk_memif_set_channel);
>   
> diff --git a/sound/soc/mediatek/common/mtk-afe-fe-dai.h b/sound/soc/mediatek/common/mtk-afe-fe-dai.h
> index b6d0f2b27e86..64b10ccba291 100644
> --- a/sound/soc/mediatek/common/mtk-afe-fe-dai.h
> +++ b/sound/soc/mediatek/common/mtk-afe-fe-dai.h
> @@ -12,7 +12,13 @@
>   struct snd_soc_dai_ops;
>   struct mtk_base_afe;
>   struct mtk_base_afe_memif;
> +struct mtk_base_irq_data;
>   
> +int mtk_regmap_update_bits(struct regmap *map, int reg,
> +			   unsigned int mask, unsigned int val,
> +			   int shift);
> +int mtk_regmap_write(struct regmap *map, int reg,
> +		     unsigned int val);

No, don't export these. Use regmap directly.

Regards,
Angelo


