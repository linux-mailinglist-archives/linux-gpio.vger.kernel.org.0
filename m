Return-Path: <linux-gpio+bounces-30432-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 88317D113C5
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 09:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3C06430006ED
	for <lists+linux-gpio@lfdr.de>; Mon, 12 Jan 2026 08:32:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A55D217F27;
	Mon, 12 Jan 2026 08:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="V7OdAIL9"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4C113FEE;
	Mon, 12 Jan 2026 08:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768206728; cv=none; b=NJPQyL3v+btMoNa8vaQuWfnpOs8yCcH/FyUwq37NOi4yhE4JxiTvWmB3fcPpRiGaJEowiZal2Vsd8ed/ckXwAE6mFr/tmzIUJfXH0I+7hZk5xQ58X/6O4w2IzzVySBLqYt5xh8mvBkX0mxlBqBqtvSISE4qAGMXFy3gQIl7rAww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768206728; c=relaxed/simple;
	bh=0AAFxsOl96Bw3ZZbVQuQJExQevPFRWHXBUba91rknRA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MPo+cfR7NwgY0Ry7WeIi+7KFjinTHgmJ0f/TLxKi9EIRA7xaMpVX58OtjVBlQbmJdokR7Iv004X7mA+jbB0dl5U/SoV4c8D3g45lL18DofXluQnqzkjiqP+CrCAC/nzdGPAebIP8Ww1rIA+MXAattyenEUsa4bUKbCtCgcE4W5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=V7OdAIL9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768206707;
	bh=0AAFxsOl96Bw3ZZbVQuQJExQevPFRWHXBUba91rknRA=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=V7OdAIL9HWeI5621V8/ZnpaOMtRft1mynRJ0KI1e8Jm38OW7EhCgW37IUjoVqfNji
	 xw5DX3sTC2T+2GvFYUAm9wd/Fi84jfaduKJAjWHb3W0f+OHvNLsGXdEwQO6yG/zXCA
	 aqaXYIC0eezUAgZsOZrMEhzlm5zjGpxTIFCz19s+SVrJXSyyyCIW0pI2cSMX3uL/jN
	 sf2OTqLDDaOKs3cz0tZ20hCfPMm8AFpJq7JlmEFS0s+FJBfbShZyXyRGWJGRgLaDYX
	 6uhFTIR2i5Q1x5gRdl4HzfP0QvOSAzvNzTqQ1OthOgPtL5eUgqsWXpbk0QjmRyvE/l
	 TqFMV4mgugeng==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4401C17E1104;
	Mon, 12 Jan 2026 09:31:47 +0100 (CET)
Message-ID: <6a499e1a-80fe-4fc3-af77-b5d31f689d7f@collabora.com>
Date: Mon, 12 Jan 2026 09:31:46 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: mediatek: common-v1: introduce per-function
 multibase control
To: Akari Tsuyukusa <akkun11.open@gmail.com>, Sean Wang
 <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:PIN CONTROLLER - MEDIATEK"
 <linux-mediatek@lists.infradead.org>,
 "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 "open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
References: <20260111092833.466263-1-akkun11.open@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260111092833.466263-1-akkun11.open@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 11/01/26 10:28, Akari Tsuyukusa ha scritto:
> The current common-v1 framework implicitly assumes that certain
> register operations might span across multiple base addresses. This
> logic is currently hardcoded in mtk_get_regmap, where any pin falling
> within the [type1_start, type1_end) range is redirected to regmap2.
> 
> This approach is suboptimal for two reasons:
> 1. It forces all SoCs except MT8135 to define dummy type1_start/end values
>     (set to the last pin number + 1) to avoid unintended regmap switching,
>     which is non-intuitive and cluttering the SoC data.
> 2. It assumes most register types (DRV, IES, SMT, etc.) follow the same
>     splitting rule, even though hardware design might only require it for
>     specific functional registers.
> 
> Refactor the framework by introducing explicit '[func]_multibase' flags
> for each register category in struct mtk_pinctrl_devdata. This allows
> each SoC to explicitly declare which operations require multiple bases.
> 
> For MT8135, which is currently the only multipre regmap user, enable
> needed multibase flags to keep existing behavior.
> 
> For other SoCs, multibase flags will default to false, removing the need
> for fragile range-based workarounds and making the regmap selection logic
> more robust and explicit. Also, delete type1_start and type1_end, which
> are no longer needed by this refactor, from struct mtk_pinctrl_devdata.
> 

Thanks for the patch!
What you're saying here makes a lot of sense, but there's one big question for you.

Have you considered migrating those pinctrl drivers to use a PIN_FIELD_BASE()
like it's being done for all other(/newer) MediaTek SoCs?

Why would this not be applicable for those old ones?

P.S.: Check mt8188, mt8195, mt8196, etc.

Cheers,
Angelo

> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> ---
>   drivers/pinctrl/mediatek/pinctrl-mt2701.c     |  2 -
>   drivers/pinctrl/mediatek/pinctrl-mt2712.c     |  2 -
>   drivers/pinctrl/mediatek/pinctrl-mt6397.c     |  2 -
>   drivers/pinctrl/mediatek/pinctrl-mt8127.c     |  2 -
>   drivers/pinctrl/mediatek/pinctrl-mt8135.c     |  8 +++
>   drivers/pinctrl/mediatek/pinctrl-mt8167.c     |  2 -
>   drivers/pinctrl/mediatek/pinctrl-mt8173.c     |  2 -
>   drivers/pinctrl/mediatek/pinctrl-mt8365.c     |  2 -
>   drivers/pinctrl/mediatek/pinctrl-mt8516.c     |  2 -
>   drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 62 ++++++++++++-------
>   drivers/pinctrl/mediatek/pinctrl-mtk-common.h |  9 +++
>   11 files changed, 57 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt2701.c b/drivers/pinctrl/mediatek/pinctrl-mt2701.c
> index 6b1c7122b0fb..30bec29de9bd 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt2701.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt2701.c
> @@ -504,8 +504,6 @@ static const struct mtk_pinctrl_devdata mt2701_pinctrl_data = {
>   	.dout_offset = 0x0500,
>   	.din_offset = 0x0630,
>   	.pinmux_offset = 0x0760,
> -	.type1_start = 280,
> -	.type1_end = 280,
>   	.port_shf = 4,
>   	.port_mask = 0x1f,
>   	.port_align = 4,
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt2712.c b/drivers/pinctrl/mediatek/pinctrl-mt2712.c
> index bb7394ae252b..eb6ecaa72679 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt2712.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt2712.c
> @@ -553,8 +553,6 @@ static const struct mtk_pinctrl_devdata mt2712_pinctrl_data = {
>   	.dout_offset = 0x0300,
>   	.din_offset = 0x0400,
>   	.pinmux_offset = 0x0500,
> -	.type1_start = 210,
> -	.type1_end = 210,
>   	.port_shf = 4,
>   	.port_mask = 0xf,
>   	.port_align = 4,
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6397.c b/drivers/pinctrl/mediatek/pinctrl-mt6397.c
> index 03d0f65d7bcc..af5f48039895 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt6397.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt6397.c
> @@ -27,8 +27,6 @@ static const struct mtk_pinctrl_devdata mt6397_pinctrl_data = {
>   	.dout_offset = (MT6397_PIN_REG_BASE + 0x080),
>   	.din_offset = (MT6397_PIN_REG_BASE + 0x0a0),
>   	.pinmux_offset = (MT6397_PIN_REG_BASE + 0x0c0),
> -	.type1_start = 41,
> -	.type1_end = 41,
>   	.port_shf = 3,
>   	.port_mask = 0x3,
>   	.port_align = 2,
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8127.c b/drivers/pinctrl/mediatek/pinctrl-mt8127.c
> index f5030a9ea40b..1ec1ddb317c3 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt8127.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8127.c
> @@ -272,8 +272,6 @@ static const struct mtk_pinctrl_devdata mt8127_pinctrl_data = {
>   	.dout_offset = 0x0400,
>   	.din_offset = 0x0500,
>   	.pinmux_offset = 0x0600,
> -	.type1_start = 143,
> -	.type1_end = 143,
>   	.port_shf = 4,
>   	.port_mask = 0xf,
>   	.port_align = 4,
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8135.c b/drivers/pinctrl/mediatek/pinctrl-mt8135.c
> index 77c6ac464e86..9c9689be33be 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt8135.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8135.c
> @@ -292,15 +292,23 @@ static const struct mtk_pinctrl_devdata mt8135_pinctrl_data = {
>   	.n_grp_cls = ARRAY_SIZE(mt8135_drv_grp),
>   	.pin_drv_grp = mt8135_pin_drv,
>   	.n_pin_drv_grps = ARRAY_SIZE(mt8135_pin_drv),
> +	.drv_multibase = true,
>   	.spec_pull_set = spec_pull_set,
>   	.dir_offset = 0x0000,
> +	.dir_multibase = true,
>   	.ies_offset = 0x0100,
> +	.ies_multibase = true,
>   	.pullen_offset = 0x0200,
> +	.pullen_multibase = true,
>   	.smt_offset = 0x0300,
> +	.smt_multibase = true,
>   	.pullsel_offset = 0x0400,
> +	.pullsel_multibase = true,
>   	.dout_offset = 0x0800,
> +	.dout_multibase = true,
>   	.din_offset = 0x0A00,
>   	.pinmux_offset = 0x0C00,
> +	.pinmux_multibase = true,
>   	.type1_start = 34,
>   	.type1_end = 149,
>   	.port_shf = 4,
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8167.c b/drivers/pinctrl/mediatek/pinctrl-mt8167.c
> index 143c26622272..27dfaabbf41e 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt8167.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8167.c
> @@ -305,8 +305,6 @@ static const struct mtk_pinctrl_devdata mt8167_pinctrl_data = {
>   	.dout_offset = 0x0100,
>   	.din_offset = 0x0200,
>   	.pinmux_offset = 0x0300,
> -	.type1_start = 125,
> -	.type1_end = 125,
>   	.port_shf = 4,
>   	.port_mask = 0xf,
>   	.port_align = 4,
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8173.c b/drivers/pinctrl/mediatek/pinctrl-mt8173.c
> index b214deeafbf1..cc1ad8963502 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt8173.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8173.c
> @@ -313,8 +313,6 @@ static const struct mtk_pinctrl_devdata mt8173_pinctrl_data = {
>   	.dout_offset = 0x0400,
>   	.din_offset = 0x0500,
>   	.pinmux_offset = 0x0600,
> -	.type1_start = 135,
> -	.type1_end = 135,
>   	.port_shf = 4,
>   	.port_mask = 0xf,
>   	.port_align = 4,
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8365.c b/drivers/pinctrl/mediatek/pinctrl-mt8365.c
> index e3e0d66cfbbf..b793caac5773 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt8365.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8365.c
> @@ -457,8 +457,6 @@ static const struct mtk_pinctrl_devdata mt8365_pinctrl_data = {
>   	.pullen_offset = 0x0860,
>   	.pullsel_offset = 0x0900,
>   	.drv_offset = 0x0710,
> -	.type1_start = 145,
> -	.type1_end = 145,
>   	.port_shf = 4,
>   	.port_mask = 0x1f,
>   	.port_align = 4,
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8516.c b/drivers/pinctrl/mediatek/pinctrl-mt8516.c
> index abda75d4354e..c91e5f001c10 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mt8516.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8516.c
> @@ -305,8 +305,6 @@ static const struct mtk_pinctrl_devdata mt8516_pinctrl_data = {
>   	.dout_offset = 0x0100,
>   	.din_offset = 0x0200,
>   	.pinmux_offset = 0x0300,
> -	.type1_start = 125,
> -	.type1_end = 125,
>   	.port_shf = 4,
>   	.port_mask = 0xf,
>   	.port_align = 4,
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> index d6a46fe0cda8..032944184a07 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
> @@ -42,14 +42,15 @@ static const char * const mtk_gpio_functions[] = {
>   };
>   
>   /*
> - * There are two base address for pull related configuration
> - * in mt8135, and different GPIO pins use different base address.
> - * When pin number greater than type1_start and less than type1_end,
> - * should use the second base address.
> + * Some chips (e.g., mt8135) have multiple base addresses for pin configuration.
> + * When multibase is true and the pin number falls within the specified range
> + * [type1_start, type1_end), the second base address should be used.
>    */
>   static struct regmap *mtk_get_regmap(struct mtk_pinctrl *pctl,
> -		unsigned long pin)
> +		unsigned long pin, bool multibase)
>   {
> +	if (!multibase)
> +		return pctl->regmap1;
>   	if (pin >= pctl->devdata->type1_start && pin < pctl->devdata->type1_end)
>   		return pctl->regmap2;
>   	return pctl->regmap1;
> @@ -82,7 +83,8 @@ static int mtk_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
>   	else
>   		reg_addr = SET_ADDR(reg_addr, pctl);
>   
> -	regmap_write(mtk_get_regmap(pctl, offset), reg_addr, bit);
> +	regmap_write(mtk_get_regmap(pctl, offset, pctl->devdata->dir_multibase),
> +		     reg_addr, bit);
>   	return 0;
>   }
>   
> @@ -100,7 +102,8 @@ static int mtk_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
>   	else
>   		reg_addr = CLR_ADDR(reg_addr, pctl);
>   
> -	return regmap_write(mtk_get_regmap(pctl, offset), reg_addr, bit);
> +	return regmap_write(mtk_get_regmap(pctl, offset, pctl->devdata->dout_multibase),
> +			    reg_addr, bit);
>   }
>   
>   static int mtk_pconf_set_ies_smt(struct mtk_pinctrl *pctl, unsigned pin,
> @@ -108,6 +111,7 @@ static int mtk_pconf_set_ies_smt(struct mtk_pinctrl *pctl, unsigned pin,
>   {
>   	unsigned int reg_addr, offset;
>   	unsigned int bit;
> +	bool multibase;
>   
>   	/**
>   	 * Due to some soc are not support ies/smt config, add this special
> @@ -123,12 +127,18 @@ static int mtk_pconf_set_ies_smt(struct mtk_pinctrl *pctl, unsigned pin,
>   			arg == PIN_CONFIG_INPUT_SCHMITT_ENABLE)
>   		return -EINVAL;
>   
> +	if (arg == PIN_CONFIG_INPUT_ENABLE)
> +		multibase = pctl->devdata->ies_multibase;
> +	else
> +		multibase = pctl->devdata->smt_multibase;
> +
>   	/*
>   	 * Due to some pins are irregular, their input enable and smt
>   	 * control register are discontinuous, so we need this special handle.
>   	 */
>   	if (pctl->devdata->spec_ies_smt_set) {
> -		return pctl->devdata->spec_ies_smt_set(mtk_get_regmap(pctl, pin),
> +		return pctl->devdata->spec_ies_smt_set(
> +			mtk_get_regmap(pctl, pin, multibase),
>   			pctl->devdata, pin, value, arg);
>   	}
>   
> @@ -144,7 +154,7 @@ static int mtk_pconf_set_ies_smt(struct mtk_pinctrl *pctl, unsigned pin,
>   	else
>   		reg_addr = CLR_ADDR(mtk_get_port(pctl, pin) + offset, pctl);
>   
> -	regmap_write(mtk_get_regmap(pctl, pin), reg_addr, bit);
> +	regmap_write(mtk_get_regmap(pctl, pin, multibase), reg_addr, bit);
>   	return 0;
>   }
>   
> @@ -229,7 +239,8 @@ static int mtk_pconf_set_driving(struct mtk_pinctrl *pctl,
>   		shift = pin_drv->bit + drv_grp->low_bit;
>   		mask <<= shift;
>   		val <<= shift;
> -		return regmap_update_bits(mtk_get_regmap(pctl, pin),
> +		return regmap_update_bits(
> +				mtk_get_regmap(pctl, pin, pctl->devdata->drv_multibase),
>   				pin_drv->offset, mask, val);
>   	}
>   
> @@ -314,9 +325,9 @@ static int mtk_pconf_set_pull_select(struct mtk_pinctrl *pctl,
>   		 * the parameter should be "MTK_PUPD_SET_R1R0_00".
>   		 */
>   		r1r0 = enable ? arg : MTK_PUPD_SET_R1R0_00;
> -		ret = pctl->devdata->spec_pull_set(mtk_get_regmap(pctl, pin),
> -						   pctl->devdata, pin, isup,
> -						   r1r0);
> +		ret = pctl->devdata->spec_pull_set(
> +			mtk_get_regmap(pctl, pin, pctl->devdata->pullsel_multibase),
> +			pctl->devdata, pin, isup, r1r0);
>   		if (!ret)
>   			return 0;
>   	}
> @@ -334,7 +345,8 @@ static int mtk_pconf_set_pull_select(struct mtk_pinctrl *pctl,
>   			pctl->devdata->pullen_offset;
>   		reg_pullsel = mtk_get_port(pctl, pin) +
>   			pctl->devdata->pullsel_offset;
> -		ret = pctl->devdata->mt8365_set_clr_mode(mtk_get_regmap(pctl, pin),
> +		/* MT8365 do not use multibase. */
> +		ret = pctl->devdata->mt8365_set_clr_mode(pctl->regmap1,
>   			bit, reg_pullen, reg_pullsel,
>   			enable, isup);
>   		if (ret)
> @@ -358,8 +370,10 @@ static int mtk_pconf_set_pull_select(struct mtk_pinctrl *pctl,
>   		reg_pullsel = CLR_ADDR(mtk_get_port(pctl, pin) +
>   			pctl->devdata->pullsel_offset, pctl);
>   
> -	regmap_write(mtk_get_regmap(pctl, pin), reg_pullen, bit);
> -	regmap_write(mtk_get_regmap(pctl, pin), reg_pullsel, bit);
> +	regmap_write(mtk_get_regmap(pctl, pin, pctl->devdata->pullen_multibase),
> +		     reg_pullen, bit);
> +	regmap_write(mtk_get_regmap(pctl, pin, pctl->devdata->pullsel_multibase),
> +		     reg_pullsel, bit);
>   	return 0;
>   }
>   
> @@ -710,8 +724,9 @@ static int mtk_pmx_set_mode(struct pinctrl_dev *pctldev,
>   	struct mtk_pinctrl *pctl = pinctrl_dev_get_drvdata(pctldev);
>   
>   	if (pctl->devdata->spec_pinmux_set)
> -		pctl->devdata->spec_pinmux_set(mtk_get_regmap(pctl, pin),
> -					pin, mode);
> +		pctl->devdata->spec_pinmux_set(
> +			mtk_get_regmap(pctl, pin, pctl->devdata->pinmux_multibase),
> +			pin, mode);
>   
>   	reg_addr = ((pin / pctl->devdata->mode_per_reg) << pctl->devdata->port_shf)
>   			+ pctl->devdata->pinmux_offset;
> @@ -720,8 +735,9 @@ static int mtk_pmx_set_mode(struct pinctrl_dev *pctldev,
>   	bit = pin % pctl->devdata->mode_per_reg;
>   	mask <<= (GPIO_MODE_BITS * bit);
>   	val = (mode << (GPIO_MODE_BITS * bit));
> -	return regmap_update_bits(mtk_get_regmap(pctl, pin),
> -			reg_addr, mask, val);
> +	return regmap_update_bits(
> +		mtk_get_regmap(pctl, pin, pctl->devdata->pinmux_multibase),
> +		reg_addr, mask, val);
>   }
>   
>   static const struct mtk_desc_pin *
> @@ -832,7 +848,8 @@ static int mtk_gpio_get_direction(struct gpio_chip *chip, unsigned offset)
>   	if (pctl->devdata->spec_dir_set)
>   		pctl->devdata->spec_dir_set(&reg_addr, offset);
>   
> -	regmap_read(pctl->regmap1, reg_addr, &read_val);
> +	regmap_read(mtk_get_regmap(pctl, offset, pctl->devdata->dir_multibase),
> +		    reg_addr, &read_val);
>   	if (read_val & bit)
>   		return GPIO_LINE_DIRECTION_OUT;
>   
> @@ -850,7 +867,8 @@ static int mtk_gpio_get(struct gpio_chip *chip, unsigned offset)
>   		pctl->devdata->din_offset;
>   
>   	bit = BIT(offset & pctl->devdata->mode_mask);
> -	regmap_read(pctl->regmap1, reg_addr, &read_val);
> +	regmap_read(mtk_get_regmap(pctl, offset, pctl->devdata->din_multibase),
> +		    reg_addr, &read_val);
>   	return !!(read_val & bit);
>   }
>   
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
> index 11afa12a96cb..1c5c956ff33b 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.h
> @@ -277,6 +277,15 @@ struct mtk_pinctrl_devdata {
>   	unsigned int mode_mask;
>   	unsigned int mode_per_reg;
>   	unsigned int mode_shf;
> +	bool dir_multibase;
> +	bool ies_multibase;
> +	bool smt_multibase;
> +	bool pullen_multibase;
> +	bool pullsel_multibase;
> +	bool drv_multibase;
> +	bool dout_multibase;
> +	bool din_multibase;
> +	bool pinmux_multibase;
>   };
>   
>   struct mtk_pinctrl {


-- 
AngeloGioacchino Del Regno
Senior Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

