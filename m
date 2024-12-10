Return-Path: <linux-gpio+bounces-13717-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E70489EB98E
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2024 19:46:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 736901885F96
	for <lists+linux-gpio@lfdr.de>; Tue, 10 Dec 2024 18:46:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1FEB214207;
	Tue, 10 Dec 2024 18:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="ZQr52uRj"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr [80.12.242.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D0D3226862;
	Tue, 10 Dec 2024 18:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.12.242.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733856355; cv=none; b=PBu5ZfFgqcbt/FWa2NSj57aWb5FTxGBliKrCvvTbwj47EYuzM3bKNh1+j7x5tJLJBu4pt83w/Xs1HYB7NMd0MHWr0XABr3R2yMcPbyUfCOBUXecjz2RPMz7Gjvucr5EoUsN0qANu7wcE3aPqGoziLjnfNhoQ5TCsZvvoLcTqwJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733856355; c=relaxed/simple;
	bh=nGM6e7q2n+Rg31Ry+dAXzwwRGvB+Bz3Tc3E4fftYX2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T0bE8+N+nF3jPjfil/JJcurTfF+V1dkxTR+eLg2fksrr4YNc6Bg7yLC+bYVVh8tEVpcGmLnNzRgISy0J0iChLdA9mQ9UijLguwG2rjoX078AO+r4JySpbZh5hjfEoI/srzFPfhUYJ/S/5UTGjrgwXcZN5dxa39hYv0lyQbl4P9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr; spf=pass smtp.mailfrom=wanadoo.fr; dkim=pass (2048-bit key) header.d=wanadoo.fr header.i=@wanadoo.fr header.b=ZQr52uRj; arc=none smtp.client-ip=80.12.242.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wanadoo.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wanadoo.fr
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id L5EotBIgE01M2L5EotfE5j; Tue, 10 Dec 2024 19:45:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1733856342;
	bh=o/qM869MCmQZkRsPpCevAXNj2FXSE3qMjToZGsvPE8I=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=ZQr52uRj3DCZS904wPu9oO3He4yPgn4PkS2eoS14L924pm6/3GFbuRKA0gVxK62lE
	 YcpeFbwShTcxSGCoFi59YGdorMjjicdzgbyRG1dMGBxyC0Bt3U9FNUm21MmcLUwSs5
	 IW6mdXYyCnSEdO1ntkwjXE8H88rjXAbhoMLgm2kxBtZrca8nB2JlVpMujmDE2NDNeg
	 fM1st214JoIHg3VdZR7yngsugauVnKWR9NMRVuLZSEaZgSnKKkF7tj5qwvIMHB5R/0
	 dWCDEPJ4f0VCwTI8Z1MWhrwU0WqTYsdXly05mbhwOeKTRBRWDYNeYswTWNb33/mDAP
	 UXAbWMjvBEO4A==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Tue, 10 Dec 2024 19:45:42 +0100
X-ME-IP: 90.11.132.44
Message-ID: <32201aec-f3d2-49a7-b0ca-2ede10fec103@wanadoo.fr>
Date: Tue, 10 Dec 2024 19:45:33 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/5] pinctrl: mediatek: add MT7988 pinctrl driver
To: Frank Wunderlich <linux@fw-web.de>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: Frank Wunderlich <frank-w@public-files.de>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Daniel Golle <daniel@makrotopia.org>, Sam Shih <sam.shih@mediatek.com>,
 =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
References: <20241202110045.22084-1-linux@fw-web.de>
 <20241202110045.22084-3-linux@fw-web.de>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20241202110045.22084-3-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Le 02/12/2024 à 12:00, Frank Wunderlich a écrit :
> From: Daniel Golle <daniel@makrotopia.org>
> 
> Add pinctrl driver for the MediaTek MT7988 SoC.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> [correctly initialise for the function_desc structure]
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> 
> ---

...

> +/* flash */
> +static int mt7988_snfi_pins[] = { 22, 23, 24, 25, 26, 27 };
> +static int mt7988_snfi_funcs[] = { 2, 2, 2, 2, 2, 2 };
> +
> +static int mt7988_emmc_45_pins[] = {
> +	21, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37
> +};
> +static int mt7988_emmc_45_funcs[] = { 5, 5, 5, 5, 5, 5, 5, 5, 5, 5, 5 };
> +
> +static int mt7988_sdcard_pins[] = { 32, 33, 34, 35, 36, 37 };
> +static int mt7988_sdcard_funcs[] = { 5, 5, 5, 5, 5, 5 };
> +
> +static int mt7988_emmc_51_pins[] = { 38, 39, 40, 41, 42, 43,
> +				     44, 45, 46, 47, 48, 49 };
> +static int mt7988_emmc_51_funcs[] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 };

At least all the _pins arrays could be const.
Maybe we could also make it possible to have _funcs const as well.

...

> +static struct mtk_pin_soc mt7988_data = {

const?

> +	.reg_cal = mt7988_reg_cals,
> +	.pins = mt7988_pins,
> +	.npins = ARRAY_SIZE(mt7988_pins),
> +	.grps = mt7988_groups,
> +	.ngrps = ARRAY_SIZE(mt7988_groups),
> +	.funcs = mt7988_functions,
> +	.nfuncs = ARRAY_SIZE(mt7988_functions),
> +	.eint_hw = &mt7988_eint_hw,
> +	.gpio_m = 0,
> +	.ies_present = false,
> +	.base_names = mt7988_pinctrl_register_base_names,
> +	.nbase_names = ARRAY_SIZE(mt7988_pinctrl_register_base_names),
> +	.bias_disable_set = mtk_pinconf_bias_disable_set,
> +	.bias_disable_get = mtk_pinconf_bias_disable_get,
> +	.bias_set = mtk_pinconf_bias_set,
> +	.bias_get = mtk_pinconf_bias_get,
> +	.pull_type = mt7988_pull_type,
> +	.bias_set_combo = mtk_pinconf_bias_set_combo,
> +	.bias_get_combo = mtk_pinconf_bias_get_combo,
> +	.drive_set = mtk_pinconf_drive_set_rev1,
> +	.drive_get = mtk_pinconf_drive_get_rev1,
> +	.adv_pull_get = mtk_pinconf_adv_pull_get,
> +	.adv_pull_set = mtk_pinconf_adv_pull_set,
> +};

...

CJ

