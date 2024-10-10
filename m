Return-Path: <linux-gpio+bounces-11140-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCF6998299
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 11:42:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 68E2A287152
	for <lists+linux-gpio@lfdr.de>; Thu, 10 Oct 2024 09:42:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6559BE6F;
	Thu, 10 Oct 2024 09:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="H63Qc4Ou"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755B21BC061;
	Thu, 10 Oct 2024 09:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728553333; cv=none; b=U5HvSqzlUuj1yQo3WvnB2ehTewrsQbwkckkJRmA49qZmQZsjV9wiczLvD84DDcAajf5YXEMDQowiuEyRKTNSAOpcnXmEfBy/Rlv1OPnPKtsAIUFMkZTmytjZSXoKkMcmPcgnFSjCeZNyaLBPNSkC0Hjsoif28Ld0ZNrB6sHc3h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728553333; c=relaxed/simple;
	bh=8lRmGtzpKCSbPzQOWXLMKG/S0oTwOaaGGVrYaPtPoSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XpQepd89AEFuRM5bjFOfSFfbDNY1RiLQgLyIEs5JNbRHIvAidYIC9NeEoKGKVKQ/QO7hIYl8VVZJJDBSaKfS8Vr0EGP2YkZ6Ki+A8oOhE3B0oT98HApvLZjRPAxqLePkgehNWu/DrAbdP+feICe8MGc7mfK+fFsM2pRBK3U+lqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=H63Qc4Ou; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728553329;
	bh=8lRmGtzpKCSbPzQOWXLMKG/S0oTwOaaGGVrYaPtPoSM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=H63Qc4OuDKzaagf/6BEAZRRH+6/bh9qoTk5fwBELyvN7HuZ1N426BHSVDHjrMboVA
	 jpQ6ynBGIqwoFtXp+/juLmnYn4gF+lYD3bljIxs7YAeAeSY2WEpPjUPPCkrI/vOs8K
	 dARCVpxi71vTHCKJzHOxI4UcXUR4WkJNy0VAKHR+kRVJ0moftd2gNYGDvyTS5pWi8u
	 MpsAO5QLTlZOGySic6Adqj46+cFkAl1alipi28pfxJzZT/a1OGQufUCiXuIwLuU4V4
	 DdJUvuMMxakPt838tOflXlfXT5IYkksCYSSVaU1PG9pHXGPVXNYmYEB3C7LdKCSJMr
	 tw5jTJUTHc0oQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E458717E120F;
	Thu, 10 Oct 2024 11:42:08 +0200 (CEST)
Message-ID: <ce926e0c-74f3-4c7b-987f-3dc50b81a3aa@collabora.com>
Date: Thu, 10 Oct 2024 11:42:08 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] pinctrl: mediatek: add support for
 MTK_PULL_PD_TYPE
To: Frank Wunderlich <linux@fw-web.de>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 daniel@makrotopia.org, john@phrozen.org, ansuelsmth@gmail.com,
 eladwf@gmail.com
References: <20241009165222.5670-1-linux@fw-web.de>
 <20241009165222.5670-2-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241009165222.5670-2-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 09/10/24 18:52, Frank Wunderlich ha scritto:
> From: Daniel Golle <daniel@makrotopia.org>
> 
> The MediaTek MT7988 SoC got some pins which only got configurable
> pull-down but unlike previous designs there is no pull-up option.
> Add new type MTK_PULL_PD_TYPE to support configuring such pins.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>   .../pinctrl/mediatek/pinctrl-mtk-common-v2.c  | 59 +++++++++++++++++++
>   .../pinctrl/mediatek/pinctrl-mtk-common-v2.h  |  1 +
>   2 files changed, 60 insertions(+)
> 
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> index 54301fbba524..eff2aecd31dd 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> @@ -601,6 +601,30 @@ static int mtk_pinconf_bias_set_pu_pd(struct mtk_pinctrl *hw,
>   	return err;
>   }
>   
> +static int mtk_pinconf_bias_set_pd(struct mtk_pinctrl *hw,
> +				const struct mtk_pin_desc *desc,
> +				u32 pullup, u32 arg)
> +{
> +	int err, pd;
> +
> +	if (arg == MTK_DISABLE)

if (arg != MTK_DISABLE && arg != MTK_ENABLE)
	return -EINVAL

/* Either this */
if (arg == MTK_DISABLE || pullup)
	pd = 0;
else if (!pullup)
	pd = 1

/* Or this (but it's probably a bit too cryptic) */
pd = !(arg == MTK_DISABLE || pullup);

return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PD, pd);



...but then, you could otherwise modify mtk_pinconf_bias_set_pu_pd(), so that

static int mtk_pinconf_bias_set_pu_pd(struct mtk_pinctrl *hw,
				const struct mtk_pin_desc *desc,
				u32 pullup, u32 arg, bool pd_only)
{
	int err, pu, pd;

	if (arg == MTK_DISABLE) {
		pu = 0;
		pd = 0;
	} else if ((arg == MTK_ENABLE) && pullup) {
		pu = 1;
		pd = 0;
	} else if ((arg == MTK_ENABLE) && !pullup) {
		pu = 0;
		pd = 1;
	} else {
		return -EINVAL;
	}

	if (!pd_only) {
		err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PU, pu);
		if (err)
			return err;
	}

	return mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PD, pd);
}

> +		pd = 0;
> +	else if ((arg == MTK_ENABLE) && pullup)
> +		pd = 0;
> +	else if ((arg == MTK_ENABLE) && !pullup)
> +		pd = 1;
> +	else {
> +		err = -EINVAL;
> +		goto out;
> +	}
> +
> +	err = mtk_hw_set_value(hw, desc, PINCTRL_PIN_REG_PD, pd);
> +
> +out:
> +	return err;
> +
> +}
> +
>   static int mtk_pinconf_bias_set_pullsel_pullen(struct mtk_pinctrl *hw,
>   				const struct mtk_pin_desc *desc,
>   				u32 pullup, u32 arg)
> @@ -758,6 +782,12 @@ int mtk_pinconf_bias_set_combo(struct mtk_pinctrl *hw,
>   			return 0;
>   	}
>   
> +	if (try_all_type & MTK_PULL_PD_TYPE) {
> +		err = mtk_pinconf_bias_set_pd(hw, desc, pullup, arg);

so if it is PD_TYPE, mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, arg, true);

> +		if (!err)
> +			return err;
> +	}
> +
>   	if (try_all_type & MTK_PULL_PU_PD_TYPE) {
>   		err = mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, arg);

mtk_pinconf_bias_set_pu_pd(hw, desc, pullup, arg, false);

>   		if (!err)
> @@ -878,6 +908,29 @@ static int mtk_pinconf_bias_get_pu_pd(struct mtk_pinctrl *hw,
>   	return err;
>   }
>   
> +static int mtk_pinconf_bias_get_pd(struct mtk_pinctrl *hw,
> +				const struct mtk_pin_desc *desc,
> +				u32 *pullup, u32 *enable)
> +{

this one you can keep it as it is, because I don't think that you can get
the get_pu_pd function to work with pd_only without making it .. well, messy.

> +	int err, pd;
> +
> +	err = mtk_hw_get_value(hw, desc, PINCTRL_PIN_REG_PD, &pd);
> +	if (err)
> +		goto out;
> +
> +	if (pd == 0) {
> +		*pullup = 0;
> +		*enable = MTK_DISABLE;
> +	} else if (pd == 1) {
> +		*pullup = 0;
> +		*enable = MTK_ENABLE;
> +	} else
> +		err = -EINVAL;
> +
> +out:
> +	return err;
> +}
> +
>   static int mtk_pinconf_bias_get_pullsel_pullen(struct mtk_pinctrl *hw,
>   				const struct mtk_pin_desc *desc,
>   				u32 *pullup, u32 *enable)
> @@ -947,6 +1000,12 @@ int mtk_pinconf_bias_get_combo(struct mtk_pinctrl *hw,
>   			return 0;
>   	}
>   
> +	if (try_all_type & MTK_PULL_PD_TYPE) {
> +		err = mtk_pinconf_bias_get_pd(hw, desc, pullup, enable);
> +		if (!err)
> +			return err;
> +	}
> +
>   	if (try_all_type & MTK_PULL_PU_PD_TYPE) {
>   		err = mtk_pinconf_bias_get_pu_pd(hw, desc, pullup, enable);
>   		if (!err)
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> index 23688ca6d04e..9c271dc2b521 100644
> --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.h
> @@ -24,6 +24,7 @@
>    * turned on/off itself. But it can't be selected pull up/down
>    */
>   #define MTK_PULL_RSEL_TYPE		BIT(3)
> +#define MTK_PULL_PD_TYPE        BIT(4)
>   /* MTK_PULL_PU_PD_RSEL_TYPE is a type which is controlled by
>    * MTK_PULL_PU_PD_TYPE and MTK_PULL_RSEL_TYPE.
>    */


Cheers,
Angelo



