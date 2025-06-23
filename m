Return-Path: <linux-gpio+bounces-22011-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67725AE3964
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 11:05:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6EB3188B521
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Jun 2025 09:05:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AE3522FE0A;
	Mon, 23 Jun 2025 09:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qJXocqVJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F41D1F542E;
	Mon, 23 Jun 2025 09:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750669515; cv=none; b=Ryoxy8/AdzIhl7kWJ4eYB6DUTwgv9Xu8O4k2G5U1SPECKDDcv7ratdVYT9J9BHvqPIGb26t9uUv5xf69sClgqBHIS/vBLZK9YRKukF8DwDvC9Rv1asw0n0dSk1OeeQyZSsHhF8hnESW2D4YxULIAbqyko8lROQIsxB/CvK6t104=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750669515; c=relaxed/simple;
	bh=dzUo6R62Pf1NBNpaqBk1+vlvYSpBOm9JYC73dp+SeYA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KCsqpd+RdoIeVPnm2mfPY6duZ3zGQpdMiAAeR8h9KyRvbcp45zQPZQiRzA3CRAwHpzPiHbD/SdaO5PNIvrOSALHBNTiREl5TuVdfk14bjwKwfjTzOql6ucz+xOuyHLgXmJcaQCUu+HCsxIKruEby2Fgv3k3HcE9CKxHKsCNQh9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qJXocqVJ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750669510;
	bh=dzUo6R62Pf1NBNpaqBk1+vlvYSpBOm9JYC73dp+SeYA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qJXocqVJeh9j2VyX+F96yYK/oJP6pkdqoY4a4duDw7gtxA063+9m5xvzC5Nvl60s/
	 DLj8dc7q97mfpkTUBftz+ho0WYANyhrHYXchk5t4lrjeKjhoSD7BvsSPn6hHzv4IC3
	 ONEBH0ijYORKlWf72qNB5kCIn3p0AOlgvdWIih0MBH/sp4eljbLpP3Sl+T4A3MhvYz
	 FcYiy03DDV1g7CObPumjyIV2kbgtrjPwIdd4hP1XtBf2fO7+qF34LLcNLrrGvpCtpC
	 Rhn1pW3knm0Yj6piyFKvH3InQm441zNlFfuf5lwtznT+oamhG0ZAtpth5tj0X/s/uD
	 4zbEkwbWwz6iA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BAD9E17E0202;
	Mon, 23 Jun 2025 11:05:09 +0200 (CEST)
Message-ID: <ff7049b0-9145-4dc8-8dd3-51f54c108b98@collabora.com>
Date: Mon, 23 Jun 2025 11:05:08 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 05/10] ASoC: mediatek: mt8196: support I2S in platform
 driver
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
 <20250620094140.11093-6-darren.ye@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250620094140.11093-6-darren.ye@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 20/06/25 11:40, Darren.Ye ha scritto:
> From: Darren Ye <darren.ye@mediatek.com>
> 
> Add mt8196 I2S DAI driver support.
> 
> Signed-off-by: Darren Ye <darren.ye@mediatek.com>
> ---
>   sound/soc/mediatek/mt8196/mt8196-dai-i2s.c | 3970 ++++++++++++++++++++
>   1 file changed, 3970 insertions(+)
>   create mode 100644 sound/soc/mediatek/mt8196/mt8196-dai-i2s.c
> 
> diff --git a/sound/soc/mediatek/mt8196/mt8196-dai-i2s.c b/sound/soc/mediatek/mt8196/mt8196-dai-i2s.c
> new file mode 100644
> index 000000000000..56c4ddfc1bdd
> --- /dev/null
> +++ b/sound/soc/mediatek/mt8196/mt8196-dai-i2s.c
> @@ -0,0 +1,3970 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + *  MediaTek ALSA SoC Audio DAI I2S Control
> + *
> + *  Copyright (c) 2024 MediaTek Inc.
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
> +
> +#define ETDM_22M_CLOCK_THRES 11289600
> +
> +#define FM_SRC_CAIL

What's that? I don't see any usage of this, and if I did, I'd anyway tell you to
remove this define and ifdefs.
Drop.

> +enum {
> +	ETDM_CLK_SOURCE_H26M = 0,

The first entry of an enumeration is always zero, and

> +	ETDM_CLK_SOURCE_APLL = 1,

any other entry is always +1. You don't need to assign values, unless
there is a hole in between.

> +	ETDM_CLK_SOURCE_SPDIF = 2,
> +	ETDM_CLK_SOURCE_HDMI = 3,
> +	ETDM_CLK_SOURCE_EARC = 4,
> +	ETDM_CLK_SOURCE_LINEIN = 5,
> +};
> +
> +enum {
> +	ETDM_RELATCH_SEL_H26M = 0,
> +	ETDM_RELATCH_SEL_APLL = 1,
> +};
> +
> +enum {
> +	ETDM_RATE_8K = 0,
> +	ETDM_RATE_12K = 1,
> +	ETDM_RATE_16K = 2,
> +	ETDM_RATE_24K = 3,
> +	ETDM_RATE_32K = 4,
> +	ETDM_RATE_48K = 5,
> +	ETDM_RATE_64K = 6, //not support

If it's not supported, why is this entry here?

...

ETDM_RATE_8K,
ETDM_RATE_12K
....
ETDM_RATE_48K, (implicitly == 5)
ETDM_RATE_96K = 7,
ETDM_RATE_192K = 9,
ETDM_RATE_384K = 11,
ETDM_RATE_11025 = 16,
ETDM_RATE_22050,
ETDM.....


> +	ETDM_RATE_96K = 7,
> +	ETDM_RATE_128K = 8, //not support
> +	ETDM_RATE_192K = 9,
> +	ETDM_RATE_256K = 10, //not support
> +	ETDM_RATE_384K = 11,
> +	ETDM_RATE_11025 = 16,
> +	ETDM_RATE_22050 = 17,
> +	ETDM_RATE_44100 = 18,
> +	ETDM_RATE_88200 = 19,
> +	ETDM_RATE_176400 = 20,
> +	ETDM_RATE_352800 = 21,
> +};
> +
> +enum {
> +	ETDM_CONN_8K = 0,
> +	ETDM_CONN_11K = 1,
> +	ETDM_CONN_12K = 2,
> +	ETDM_CONN_16K = 4,
> +	ETDM_CONN_22K = 5,
> +	ETDM_CONN_24K = 6,
> +	ETDM_CONN_32K = 8,
> +	ETDM_CONN_44K = 9,
> +	ETDM_CONN_48K = 10,
> +	ETDM_CONN_88K = 13,
> +	ETDM_CONN_96K = 14,
> +	ETDM_CONN_176K = 17,
> +	ETDM_CONN_192K = 18,
> +	ETDM_CONN_352K = 21,
> +	ETDM_CONN_384K = 22,
> +};
> +
> +enum {
> +	ETDM_WLEN_8_BIT = 0x7,
> +	ETDM_WLEN_16_BIT = 0xf,
> +	ETDM_WLEN_32_BIT = 0x1f,
> +};
> +
> +enum {
> +	ETDM_SLAVE_SEL_ETDMIN0_MASTER = 0,
> +	ETDM_SLAVE_SEL_ETDMIN0_SLAVE = 1,
> +	ETDM_SLAVE_SEL_ETDMIN1_MASTER = 2,
> +	ETDM_SLAVE_SEL_ETDMIN1_SLAVE = 3,
> +	ETDM_SLAVE_SEL_ETDMIN2_MASTER = 4,
> +	ETDM_SLAVE_SEL_ETDMIN2_SLAVE = 5,
> +	ETDM_SLAVE_SEL_ETDMIN3_MASTER = 6,
> +	ETDM_SLAVE_SEL_ETDMIN3_SLAVE = 7,
> +	ETDM_SLAVE_SEL_ETDMOUT0_MASTER = 8,
> +	ETDM_SLAVE_SEL_ETDMOUT0_SLAVE = 9,
> +	ETDM_SLAVE_SEL_ETDMOUT1_MASTER = 10,
> +	ETDM_SLAVE_SEL_ETDMOUT1_SLAVE = 11,
> +	ETDM_SLAVE_SEL_ETDMOUT2_MASTER = 12,
> +	ETDM_SLAVE_SEL_ETDMOUT2_SLAVE = 13,
> +	ETDM_SLAVE_SEL_ETDMOUT3_MASTER = 14,
> +	ETDM_SLAVE_SEL_ETDMOUT3_SLAVE = 15,
> +};
> +
> +enum {
> +	ETDM_SLAVE_SEL_ETDMIN4_MASTER = 0,
> +	ETDM_SLAVE_SEL_ETDMIN4_SLAVE = 1,
> +	ETDM_SLAVE_SEL_ETDMIN5_MASTER = 2,
> +	ETDM_SLAVE_SEL_ETDMIN5_SLAVE = 3,
> +	ETDM_SLAVE_SEL_ETDMIN6_MASTER = 4,
> +	ETDM_SLAVE_SEL_ETDMIN6_SLAVE = 5,
> +	ETDM_SLAVE_SEL_ETDMIN7_MASTER = 6,
> +	ETDM_SLAVE_SEL_ETDMIN7_SLAVE = 7,
> +	ETDM_SLAVE_SEL_ETDMOUT4_MASTER = 8,
> +	ETDM_SLAVE_SEL_ETDMOUT4_SLAVE = 9,
> +	ETDM_SLAVE_SEL_ETDMOUT5_MASTER = 10,
> +	ETDM_SLAVE_SEL_ETDMOUT5_SLAVE = 11,
> +	ETDM_SLAVE_SEL_ETDMOUT6_MASTER = 12,
> +	ETDM_SLAVE_SEL_ETDMOUT6_SLAVE = 13,
> +	ETDM_SLAVE_SEL_ETDMOUT7_MASTER = 14,
> +	ETDM_SLAVE_SEL_ETDMOUT7_SLAVE = 15,
> +};
> +
> +enum {
> +	MTK_DAI_ETDM_FORMAT_I2S = 0,
> +	MTK_DAI_ETDM_FORMAT_LJ,
> +	MTK_DAI_ETDM_FORMAT_RJ,
> +	MTK_DAI_ETDM_FORMAT_EIAJ,
> +	MTK_DAI_ETDM_FORMAT_DSPA,
> +	MTK_DAI_ETDM_FORMAT_DSPB,
> +};
> +
> +static unsigned int get_etdm_wlen(snd_pcm_format_t format)
> +{
> +	unsigned int wlen = 0;
> +
> +	/* The reg_word_length should be >= reg_bit_length */
> +	wlen = snd_pcm_format_physical_width(format);
> +
> +	if (wlen < 16)
> +		return ETDM_WLEN_16_BIT;
> +	else
> +		return ETDM_WLEN_32_BIT;

	return snd_pcm_format_physical_width(format) < 16 ? ETDM_WLEN_16_BIT : 
ETDM_WLEN_32_BIT;

> +}
> +
> +static unsigned int get_etdm_lrck_width(snd_pcm_format_t format)
> +{
> +	/* The valid data bit number should be large than 7 due to hardware limitation. */
> +	return snd_pcm_format_physical_width(format) - 1;
> +}
> +
> +static unsigned int get_etdm_rate(unsigned int rate)
> +{
> +	switch (rate) {
> +	case 8000:
> +		return ETDM_RATE_8K;
> +	case 12000:
> +		return ETDM_RATE_12K;
> +	case 16000:
> +		return ETDM_RATE_16K;
> +	case 24000:
> +		return ETDM_RATE_24K;
> +	case 32000:
> +		return ETDM_RATE_32K;
> +	case 48000:
> +		return ETDM_RATE_48K;
> +	case 64000:
> +		return ETDM_RATE_64K;
> +	case 96000:
> +		return ETDM_RATE_96K;
> +	case 128000:
> +		return ETDM_RATE_128K;
> +	case 192000:
> +		return ETDM_RATE_192K;
> +	case 256000:
> +		return ETDM_RATE_256K;
> +	case 384000:
> +		return ETDM_RATE_384K;
> +	case 11025:
> +		return ETDM_RATE_11025;
> +	case 22050:
> +		return ETDM_RATE_22050;
> +	case 44100:
> +		return ETDM_RATE_44100;
> +	case 88200:
> +		return ETDM_RATE_88200;
> +	case 176400:
> +		return ETDM_RATE_176400;
> +	case 352800:
> +		return ETDM_RATE_352800;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +static unsigned int get_etdm_inconn_rate(unsigned int rate)
> +{
> +	switch (rate) {
> +	case 8000:
> +		return ETDM_CONN_8K;
> +	case 12000:
> +		return ETDM_CONN_12K;
> +	case 16000:
> +		return ETDM_CONN_16K;
> +	case 24000:
> +		return ETDM_CONN_24K;
> +	case 32000:
> +		return ETDM_CONN_32K;
> +	case 48000:
> +		return ETDM_CONN_48K;
> +	case 96000:
> +		return ETDM_CONN_96K;
> +	case 192000:
> +		return ETDM_CONN_192K;
> +	case 384000:
> +		return ETDM_CONN_384K;
> +	case 11025:
> +		return ETDM_CONN_11K;
> +	case 22050:
> +		return ETDM_CONN_22K;
> +	case 44100:
> +		return ETDM_CONN_44K;
> +	case 88200:
> +		return ETDM_CONN_88K;
> +	case 176400:
> +		return ETDM_CONN_176K;
> +	case 352800:
> +		return ETDM_CONN_352K;
> +	default:
> +		return 0;
> +	}
> +}
> +
> +struct mtk_afe_i2s_priv {
> +	int id;
> +	int rate; /* for determine which apll to use */
> +	int low_jitter_en;
> +
> +	const char *share_property_name;
> +	int share_i2s_id;
> +
> +	int mclk_id;

mclk_id can never be a negative number, and it can never be very large.
Either u8 or unsigned short would be better.


> +	int mclk_rate;

same here, but probably u32.

> +	int mclk_apll;

> +
> +	int ch_num;
> +	int sync;
> +	int ip_mode;
> +	int lpbk_mode;

no idea about those, but I think you got the point - please, use the
right types.

> +	unsigned int format;
> +};
> +
> +/* this enum is merely for mtk_afe_i2s_priv & mtk_base_etdm_data declare */
> +enum {
> +	DAI_I2SIN0 = 0,
> +	DAI_I2SIN1,
> +	DAI_I2SIN2,
> +	DAI_I2SIN3,
> +	DAI_I2SIN4,
> +	DAI_I2SIN6,
> +	DAI_I2SOUT0,
> +	DAI_I2SOUT1,
> +	DAI_I2SOUT2,
> +	DAI_I2SOUT3,
> +	DAI_I2SOUT4,
> +	DAI_I2SOUT6,
> +	DAI_FMI2S_MASTER,
> +	DAI_I2S_NUM,
> +};
> +
> +static bool is_etdm_in_pad_top(unsigned int dai_num)
> +{
> +	if (dai_num >= DAI_I2S_NUM)
> +		return false;

This if branch is useless, because you already have a default case in the
switch that covers the same. Please drop.

> +
> +	switch (dai_num) {
> +	case DAI_I2SOUT4:
> +	case DAI_I2SIN4:
> +		return true;
> +	default:
> +		return false;
> +	}
> +}
> +
> +struct mtk_base_etdm_data {
> +	int enable_reg;

Apparently, all of those xxxx_reg are register offsets, and all seem to fit in
a u16: that's a lot of memory, as you have *lots* of entries.


> +	int enable_mask;
> +	int enable_shift;

.... and all of the xxxx_shift can be u8 - even more memory to spare.

> +	int sync_reg;
> +	int sync_mask;
> +	int sync_shift;
> +	int ch_reg;
> +	int ch_mask;
> +	int ch_shift;
> +	int ip_mode_reg;
> +	int ip_mode_mask;
> +	int ip_mode_shift;
> +	int init_count_reg;
> +	int init_count_mask;
> +	int init_count_shift;
> +	int init_point_reg;
> +	int init_point_mask;
> +	int init_point_shift;
> +	int lrck_reset_reg;
> +	int lrck_reset_mask;
> +	int lrck_reset_shift;
> +	int clk_source_reg;
> +	int clk_source_mask;
> +	int clk_source_shift;
> +	int ck_en_sel_reg;
> +	int ck_en_sel_mask;
> +	int ck_en_sel_shift;
> +	int fs_timing_reg;
> +	int fs_timing_mask;
> +	int fs_timing_shift;
> +	int relatch_en_sel_reg;
> +	int relatch_en_sel_mask;
> +	int relatch_en_sel_shift;
> +	int use_afifo_reg;
> +	int use_afifo_mask;
> +	int use_afifo_shift;
> +	int afifo_mode_reg;
> +	int afifo_mode_mask;
> +	int afifo_mode_shift;
> +	int almost_end_ch_reg;
> +	int almost_end_ch_mask;
> +	int almost_end_ch_shift;
> +	int almost_end_bit_reg;
> +	int almost_end_bit_mask;
> +	int almost_end_bit_shift;
> +	int out2latch_time_reg;
> +	int out2latch_time_mask;
> +	int out2latch_time_shift;
> +	int tdm_mode_reg;
> +	int tdm_mode_mask;
> +	int tdm_mode_shift;
> +	int relatch_domain_sel_reg;
> +	int relatch_domain_sel_mask;
> +	int relatch_domain_sel_shift;
> +	int bit_length_reg;
> +	int bit_length_mask;
> +	int bit_length_shift;
> +	int word_length_reg;
> +	int word_length_mask;
> +	int word_length_shift;
> +	int cowork_reg;
> +	int cowork_mask;
> +	int cowork_shift;
> +	int cowork_val;
> +	int in2latch_time_reg;
> +	int in2latch_time_mask;
> +	int in2latch_time_shift;


> +	int pad_top_ck_en_reg;
> +	int pad_top_ck_en_mask;
> +	int pad_top_ck_en_shift;
> +	int master_latch_reg;
> +	int master_latch_mask;
> +	int master_latch_shift;

pad_top_ck and master_latch register offset can never be zero; you could still
use a u16 for those, and check if they're zero instead of -1.

> +};
> +

...snip..

> +};
> +
> +/* lpbk */
> +static const int etdm_lpbk_idx_0[] = {

static const u8

> +	0x0, 0x8,
> +};
> +
> +static const int etdm_lpbk_idx_1[] = {
> +	0x2, 0xa,
> +};
> +
> +static const int etdm_lpbk_idx_2[] = {
> +	0x4, 0xc,
> +};
> +
> +static const int etdm_lpbk_idx_3[] = {
> +	0x6, 0xe,
> +};
> +
> +static int etdm_lpbk_get(struct snd_kcontrol *kcontrol,
> +			 struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component =
> +		snd_soc_kcontrol_component(kcontrol);
> +	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);


> +	unsigned int value = 0;
> +	unsigned int value_ipmode = 0;
> +	unsigned int reg = 0;
> +	unsigned int mask = 0;
> +	unsigned int shift = 0;

there's no need to initialize any of those unsigned int vars here, as you're
double-initializing them later on.

Besides, please use fixed types (u32?).

> +
> +	if (!strcmp(kcontrol->id.name, "I2SIN0_LPBK")) {
> +		reg = ETDM_0_3_COWORK_CON1;
> +		mask = ETDM_IN0_SDATA0_SEL_MASK_SFT;
> +		shift = ETDM_IN0_SDATA0_SEL_SFT;
> +	} else if (!strcmp(kcontrol->id.name, "I2SIN1_LPBK")) {
> +		reg = ETDM_0_3_COWORK_CON1;
> +		mask = ETDM_IN1_SDATA0_SEL_MASK_SFT;
> +		shift = ETDM_IN1_SDATA0_SEL_SFT;
> +	} else if (!strcmp(kcontrol->id.name, "I2SIN2_LPBK")) {
> +		reg = ETDM_0_3_COWORK_CON3;
> +		mask = ETDM_IN2_SDATA0_SEL_MASK_SFT;
> +		shift = ETDM_IN2_SDATA0_SEL_SFT;
> +	} else if (!strcmp(kcontrol->id.name, "I2SIN3_LPBK")) {
> +		reg = ETDM_0_3_COWORK_CON3;
> +		mask = ETDM_IN3_SDATA0_SEL_MASK_SFT;
> +		shift = ETDM_IN3_SDATA0_SEL_SFT;
> +	} else if (!strcmp(kcontrol->id.name, "I2SIN4_LPBK")) {
> +		reg = ETDM_4_7_COWORK_CON1;
> +
> +		// Get I2SIN4 multi-ip mode
> +		regmap_read(afe->regmap, ETDM_IN4_CON2, &value_ipmode);
> +		value_ipmode &= REG_MULTI_IP_MODE_MASK_SFT;
> +		value_ipmode >>= REG_MULTI_IP_MODE_SFT;

You can use the FIELD_GET() macro here.

> +
> +		if (value_ipmode) {
> +			mask = ETDM_IN4_SDATA1_15_SEL_MASK_SFT;
> +			shift = ETDM_IN4_SDATA1_15_SEL_SFT;
> +		} else {
> +			mask = ETDM_IN4_SDATA0_SEL_MASK_SFT;
> +			shift = ETDM_IN4_SDATA0_SEL_SFT;
> +		}
> +	} else if (!strcmp(kcontrol->id.name, "I2SIN6_LPBK")) {
> +		reg = ETDM_4_7_COWORK_CON3;
> +		mask = ETDM_IN6_SDATA0_SEL_MASK_SFT;
> +		shift = ETDM_IN6_SDATA0_SEL_SFT;
> +	}
> +
> +	if (reg)
> +		regmap_read(afe->regmap, reg, &value);

	else
		value = 0;

> +
> +	value &= mask;
> +	value >>= shift;
> +	ucontrol->value.enumerated.item[0] = value;
> +
> +	if (value == 0x8 || value == 0xa || value == 0xc || value == 0xe)

switch (value)
.... etc

> +		ucontrol->value.enumerated.item[0] = 1;
> +	else
> +		ucontrol->value.enumerated.item[0] = 0;
> +
> +	return 0;
> +}
> +
> +static int etdm_lpbk_put(struct snd_kcontrol *kcontrol,
> +			 struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> +	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
> +	unsigned int value = ucontrol->value.integer.value[0];
> +	unsigned int value_ipmode = 0;
> +	unsigned int reg = 0;
> +	unsigned int val = 0;
> +	unsigned int mask = 0;

same comments as before

> +
> +	if (value >= ARRAY_SIZE(etdm_lpbk_idx_0))
> +		return -EINVAL;
> +
> +	if (!strcmp(kcontrol->id.name, "I2SIN0_LPBK")) {
> +		reg = ETDM_0_3_COWORK_CON1;
> +		mask = ETDM_IN0_SDATA0_SEL_MASK_SFT;
> +		val = etdm_lpbk_idx_0[value] << ETDM_IN0_SDATA0_SEL_SFT;
> +	} else if (!strcmp(kcontrol->id.name, "I2SIN1_LPBK")) {
> +		reg = ETDM_0_3_COWORK_CON1;
> +		mask = ETDM_IN1_SDATA0_SEL_MASK_SFT;
> +		val = etdm_lpbk_idx_1[value] << ETDM_IN1_SDATA0_SEL_SFT;
> +	} else if (!strcmp(kcontrol->id.name, "I2SIN2_LPBK")) {
> +		reg = ETDM_0_3_COWORK_CON3;
> +		mask = ETDM_IN2_SDATA0_SEL_MASK_SFT;
> +		val = etdm_lpbk_idx_2[value] << ETDM_IN2_SDATA0_SEL_SFT;
> +	} else if (!strcmp(kcontrol->id.name, "I2SIN3_LPBK")) {
> +		reg = ETDM_0_3_COWORK_CON3;
> +		mask = ETDM_IN3_SDATA0_SEL_MASK_SFT;
> +		val = etdm_lpbk_idx_3[value] << ETDM_IN3_SDATA0_SEL_SFT;
> +	} else if (!strcmp(kcontrol->id.name, "I2SIN4_LPBK")) {
> +		reg = ETDM_4_7_COWORK_CON1;
> +
> +		// Get I2SIN4 multi-ip mode
> +		regmap_read(afe->regmap, ETDM_IN4_CON2, &value_ipmode);
> +		value_ipmode &= REG_MULTI_IP_MODE_MASK_SFT;
> +		value_ipmode >>= REG_MULTI_IP_MODE_SFT;

FIELD_GET()

> +
> +		if (!value) {
> +			mask = ETDM_IN4_SDATA1_15_SEL_MASK_SFT |
> +				ETDM_IN4_SDATA0_SEL_MASK_SFT;
> +			val = (etdm_lpbk_idx_0[value] << ETDM_IN4_SDATA1_15_SEL_SFT) |
> +				(etdm_lpbk_idx_0[value] << ETDM_IN4_SDATA0_SEL_SFT);
> +		} else if (value_ipmode) {
> +			mask = ETDM_IN4_SDATA1_15_SEL_MASK_SFT;
> +			val = etdm_lpbk_idx_0[value] << ETDM_IN4_SDATA1_15_SEL_SFT;
> +		} else {
> +			mask = ETDM_IN4_SDATA0_SEL_MASK_SFT;
> +			val = etdm_lpbk_idx_0[value] << ETDM_IN4_SDATA0_SEL_SFT;
> +		}
> +	} else {
> +		reg = ETDM_4_7_COWORK_CON3;
> +		mask = ETDM_IN6_SDATA0_SEL_MASK_SFT;
> +		val = etdm_lpbk_idx_2[value] << ETDM_IN6_SDATA0_SEL_SFT;
> +	}
> +
> +	if (reg)
> +		regmap_update_bits(afe->regmap, reg, mask, val);
> +
> +	return 0;
> +}
> +
> +static const char *const etdm_lpbk_map[] = {
> +	"Off", "On",
> +};
> +

..snip..

> +/* i2s dai ops*/
> +static int mtk_dai_i2s_config(struct mtk_base_afe *afe,
> +			      struct snd_pcm_hw_params *params,
> +			      int i2s_id)
> +{
> +	struct mt8196_afe_private *afe_priv = afe->platform_priv;
> +	struct mtk_afe_i2s_priv *i2s_priv;
> +	struct mtk_afe_i2s_priv *i2sin_priv = NULL;
> +	int id = i2s_id - MT8196_DAI_I2S_IN0; //47
> +	struct mtk_base_etdm_data etdm_data;
> +	unsigned int rate = params_rate(params);
> +	unsigned int rate_reg = get_etdm_inconn_rate(rate);
> +	snd_pcm_format_t format = params_format(params);
> +	unsigned int channels = params_channels(params);
> +	unsigned int i2s_con = 0;
> +	int ret = 0;

don't initialize i2s_con, ret and pad_top, or those will be double-initialized in
this function.

> +	int pad_top = 0;
> +
> +	if (i2s_id >= MT8196_DAI_NUM || i2s_id < 0)

if (i2s_id >= MT8196_DAI_NUM || i2s_id < 0 || id < 0 || id >= DAI_I2S_NUM)

> +		return -EINVAL;
> +	i2s_priv = afe_priv->dai_priv[i2s_id];
> +
> +	if (!i2s_priv)
> +		return -EINVAL;
> +
> +	if (id < 0 || id >= DAI_I2S_NUM) {
> +		dev_err(afe->dev, "i2s id is invalid\n");
> +		return -EINVAL;
> +	}
> +
> +	dev_info(afe->dev, "id: %d, rate: %d, pcm_fmt: %d, fmt: %d, ch: %d\n",
> +		 i2s_id, rate, format, i2s_priv->format, channels);
> +
> +	i2s_priv->rate = rate;
> +	etdm_data = mtk_etdm_data[id];
> +
> +	if (is_etdm_in_pad_top(id))
> +		pad_top = 0x3;
> +	else
> +		pad_top = 0x5;
> +
> +	switch (id) {
> +	case DAI_FMI2S_MASTER:
> +		i2s_con = I2S_IN_PAD_IO_MUX << I2SIN_PAD_SEL_SFT;
> +		i2s_con |= rate_reg << I2S_MODE_SFT;
> +		i2s_con |= I2S_FMT_I2S << I2S_FMT_SFT;
> +		i2s_con |= get_i2s_wlen(format) << I2S_WLEN_SFT;
> +		regmap_update_bits(afe->regmap, AFE_CONNSYS_I2S_CON,
> +				   0xffffeffe, i2s_con);
> +		break;
> +	case DAI_I2SIN0:
> +	case DAI_I2SIN1:
> +	case DAI_I2SIN2:
> +	case DAI_I2SIN3:
> +	case DAI_I2SIN4:
> +	case DAI_I2SIN6:
> +		/* ---etdm in --- */
> +		regmap_update_bits(afe->regmap,
> +				   etdm_data.init_count_reg,
> +				   etdm_data.init_count_mask << etdm_data.init_count_shift,
> +				   0x5 << etdm_data.init_count_shift);
> +
> +		/* 3: pad top 5: no pad top */
> +		regmap_update_bits(afe->regmap,
> +				   etdm_data.init_point_reg,
> +				   etdm_data.init_point_mask << etdm_data.init_point_shift,
> +				   pad_top << etdm_data.init_point_shift);
> +
> +		regmap_update_bits(afe->regmap,
> +				   etdm_data.lrck_reset_reg,
> +				   etdm_data.lrck_reset_mask << etdm_data.lrck_reset_shift,
> +				   0x1 << etdm_data.lrck_reset_shift);
> +
> +		regmap_update_bits(afe->regmap,
> +				   etdm_data.clk_source_reg,
> +				   etdm_data.clk_source_mask << etdm_data.clk_source_shift,
> +				   ETDM_CLK_SOURCE_APLL << etdm_data.clk_source_shift);
> +
> +		/* 0: manual 1: auto */
> +		regmap_update_bits(afe->regmap,
> +				   etdm_data.ck_en_sel_reg,
> +				   etdm_data.ck_en_sel_mask << etdm_data.ck_en_sel_shift,
> +				   0x1 << etdm_data.ck_en_sel_shift);
> +
> +		regmap_update_bits(afe->regmap,
> +				   etdm_data.fs_timing_reg,
> +				   etdm_data.fs_timing_mask << etdm_data.fs_timing_shift,
> +				   get_etdm_rate(rate) << etdm_data.fs_timing_shift);
> +
> +		regmap_update_bits(afe->regmap,
> +				   etdm_data.relatch_en_sel_reg,
> +				   etdm_data.relatch_en_sel_mask << etdm_data.relatch_en_sel_shift,
> +				   get_etdm_inconn_rate(rate) << etdm_data.relatch_en_sel_shift);
> +
> +		regmap_update_bits(afe->regmap,
> +				   etdm_data.use_afifo_reg,
> +				   etdm_data.use_afifo_mask << etdm_data.use_afifo_shift,
> +				   0x0 << etdm_data.use_afifo_shift);

zero, bit-shifted to the left by a million bits, is still zero... :-)

> +
> +		regmap_update_bits(afe->regmap,
> +				   etdm_data.afifo_mode_reg,
> +				   etdm_data.afifo_mode_mask << etdm_data.afifo_mode_shift,
> +				   0x0 << etdm_data.afifo_mode_shift);
> +
> +		regmap_update_bits(afe->regmap,
> +				   etdm_data.almost_end_ch_reg,
> +				   etdm_data.almost_end_ch_mask << etdm_data.almost_end_ch_shift,
> +				   0x0 << etdm_data.almost_end_ch_shift);
> +
> +		regmap_update_bits(afe->regmap,
> +				   etdm_data.almost_end_bit_reg,
> +				   etdm_data.almost_end_bit_mask << etdm_data.almost_end_bit_shift,
> +				   0x0 << etdm_data.almost_end_bit_shift);

Same for all those other 3, just say 0, don't shift zeroes.

> +
> +		if (is_etdm_in_pad_top(id)) {
> +			regmap_update_bits(afe->regmap,
> +					   etdm_data.out2latch_time_reg,
> +					   etdm_data.out2latch_time_mask <<
> +					   etdm_data.out2latch_time_shift,
> +					   0x6 << etdm_data.out2latch_time_shift);
> +		} else {
> +			regmap_update_bits(afe->regmap,
> +					   etdm_data.out2latch_time_reg,
> +					   etdm_data.out2latch_time_mask <<
> +					   etdm_data.out2latch_time_shift,
> +					   0x4 << etdm_data.out2latch_time_shift);
> +		}


..snip..

> +		break;
> +	default:
> +		dev_err(afe->dev, "id %d not support\n", id);
> +		return -EINVAL;
> +	}
> +
> +	/* set share i2s */
> +	if (i2s_priv && i2s_priv->share_i2s_id >= 0) {
> +		i2sin_priv = afe_priv->dai_priv[i2s_priv->share_i2s_id];
> +		i2sin_priv->format = i2s_priv->format;
> +		ret = mtk_dai_i2s_config(afe, params, i2s_priv->share_i2s_id);

		if (ret)
			return ret;

> +	}
> +
> +	return ret;

return 0;

> +}
> +
> +static int mtk_dai_i2s_hw_params(struct snd_pcm_substream *substream,
> +				 struct snd_pcm_hw_params *params,
> +				 struct snd_soc_dai *dai)
> +{
> +	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
> +
> +	return mtk_dai_i2s_config(afe, params, dai->id);
> +}
> +
> +static int mtk_dai_i2s_set_sysclk(struct snd_soc_dai *dai,
> +				  int clk_id, unsigned int freq, int dir)
> +{
> +	struct mtk_base_afe *afe = dev_get_drvdata(dai->dev);
> +	struct mt8196_afe_private *afe_priv = afe->platform_priv;
> +	struct mtk_afe_i2s_priv *i2s_priv;
> +	int apll;
> +	int apll_rate;
> +
> +	if (dai->id >= MT8196_DAI_NUM || dai->id < 0)

dai->id >= MT8196_DAI_NUM || dai->id < 0 || dir != SND_SOC_CLOCK_OUT

> +		return -EINVAL;
> +	i2s_priv = afe_priv->dai_priv[dai->id];
> +
> +	dev_dbg(afe->dev, "freq: %u\n", freq);
> +
> +	if (!i2s_priv)
> +		return -EINVAL;
> +
> +	if (dir != SND_SOC_CLOCK_OUT)
> +		return -EINVAL;
> +
> +	apll = mt8196_get_apll_by_rate(afe, freq);
> +	apll_rate = mt8196_get_apll_rate(afe, apll);
> +
> +	if (freq > apll_rate)

if (freq > apll_rate || apll_rate % freq)
	return -EINVAL;

> +		return -EINVAL;
> +
> +	if (apll_rate % freq != 0)
> +		return -EINVAL;
> +
> +	i2s_priv->mclk_rate = freq;
> +	i2s_priv->mclk_apll = apll;
> +
> +	if (i2s_priv->share_i2s_id > 0) {
> +		struct mtk_afe_i2s_priv *share_i2s_priv;
> +
> +		share_i2s_priv = afe_priv->dai_priv[i2s_priv->share_i2s_id];
> +		if (!share_i2s_priv)
> +			return -EINVAL;
> +
> +		share_i2s_priv->mclk_rate = i2s_priv->mclk_rate;
> +		share_i2s_priv->mclk_apll = i2s_priv->mclk_apll;
> +	}
> +	return 0;
> +}
> +
> +static int mtk_dai_i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
> +{
> +	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
> +	struct mt8196_afe_private *afe_priv = afe->platform_priv;
> +	struct mtk_afe_i2s_priv *i2s_priv;
> +
> +	if (dai->id >= MT8196_DAI_NUM || dai->id < 0)
> +		return -EINVAL;
> +
> +	i2s_priv = afe_priv->dai_priv[dai->id];
> +
> +	if (!i2s_priv)
> +		return -EINVAL;
> +
> +	dev_dbg(afe->dev, "dai->id: %d, fmt: 0x%x\n", dai->id, fmt);
> +
> +	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
> +	case SND_SOC_DAIFMT_I2S:
> +		i2s_priv->format = MTK_DAI_ETDM_FORMAT_I2S;
> +		break;
> +	case SND_SOC_DAIFMT_LEFT_J:
> +		i2s_priv->format = MTK_DAI_ETDM_FORMAT_LJ;
> +		break;
> +	case SND_SOC_DAIFMT_RIGHT_J:
> +		i2s_priv->format = MTK_DAI_ETDM_FORMAT_RJ;
> +		break;
> +	case SND_SOC_DAIFMT_DSP_A:
> +		i2s_priv->format = MTK_DAI_ETDM_FORMAT_DSPA;
> +		break;
> +	case SND_SOC_DAIFMT_DSP_B:
> +		i2s_priv->format = MTK_DAI_ETDM_FORMAT_DSPB;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	dev_dbg(afe->dev, "dai->id: %d, i2s_priv->format: 0x%x\n",
> +		dai->id, i2s_priv->format);
> +
> +	return 0;
> +}
> +
> +static const struct snd_soc_dai_ops mtk_dai_i2s_ops = {
> +	.hw_params = mtk_dai_i2s_hw_params,
> +	.set_sysclk = mtk_dai_i2s_set_sysclk,
> +	.set_fmt = mtk_dai_i2s_set_fmt,
> +};
> +
> +/* dai driver */
> +#define MTK_ETDM_RATES (SNDRV_PCM_RATE_8000_384000)
> +#define MTK_ETDM_FORMATS (SNDRV_PCM_FMTBIT_S8 |\
> +			  SNDRV_PCM_FMTBIT_S16_LE |\
> +			  SNDRV_PCM_FMTBIT_S24_LE |\
> +			  SNDRV_PCM_FMTBIT_S32_LE)
> +
> +#define MT8196_I2S_DAI_PLAYBACK(_name, _id, max_ch) \
> +{ \
> +	.name = #_name, \
> +	.id = _id, \
> +	.playback = { \
> +		.stream_name = #_name, \
> +		.channels_min = 1, \
> +		.channels_max = max_ch, \
> +		.rates = MTK_ETDM_RATES, \
> +		.formats = MTK_ETDM_FORMATS, \
> +	}, \
> +	.ops = &mtk_dai_i2s_ops, \
> +}
> +
> +#define MT8196_I2S_DAI_CAPTURE(_name, _id, max_ch) \
> +{ \
> +	.name = #_name, \
> +	.id = _id, \
> +	.capture = { \
> +		.stream_name = #_name, \
> +		.channels_min = 1, \
> +		.channels_max = max_ch, \
> +		.rates = MTK_ETDM_RATES, \
> +		.formats = MTK_ETDM_FORMATS, \
> +	}, \
> +	.ops = &mtk_dai_i2s_ops, \
> +}

Those two macros seem to be *exactly* the same, and you don't need to have two.

> +
> +static struct snd_soc_dai_driver mtk_dai_i2s_driver[] = {
> +	/* capture */
> +	MT8196_I2S_DAI_CAPTURE(I2SIN0, MT8196_DAI_I2S_IN0, 2),
> +	MT8196_I2S_DAI_CAPTURE(I2SIN1, MT8196_DAI_I2S_IN1, 2),
> +	MT8196_I2S_DAI_CAPTURE(I2SIN2, MT8196_DAI_I2S_IN2, 2),
> +	MT8196_I2S_DAI_CAPTURE(I2SIN3, MT8196_DAI_I2S_IN3, 2),
> +	MT8196_I2S_DAI_CAPTURE(I2SIN4, MT8196_DAI_I2S_IN4, 8),
> +	MT8196_I2S_DAI_CAPTURE(I2SIN6, MT8196_DAI_I2S_IN6, 2),
> +	MT8196_I2S_DAI_CAPTURE(FMI2S_MASTER, MT8196_DAI_FM_I2S_MASTER, 2),
> +	/* playback */
> +	MT8196_I2S_DAI_PLAYBACK(I2SOUT0, MT8196_DAI_I2S_OUT0, 2),
> +	MT8196_I2S_DAI_PLAYBACK(I2SOUT1, MT8196_DAI_I2S_OUT1, 2),
> +	MT8196_I2S_DAI_PLAYBACK(I2SOUT2, MT8196_DAI_I2S_OUT2, 2),
> +	MT8196_I2S_DAI_PLAYBACK(I2SOUT3, MT8196_DAI_I2S_OUT3, 2),
> +	MT8196_I2S_DAI_PLAYBACK(I2SOUT4, MT8196_DAI_I2S_OUT4, 8),
> +	MT8196_I2S_DAI_PLAYBACK(I2SOUT6, MT8196_DAI_I2S_OUT6, 2),
> +};
> +
Cheers,
Angelo

