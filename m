Return-Path: <linux-gpio+bounces-16780-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46928A493F4
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 09:49:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 216973A85BA
	for <lists+linux-gpio@lfdr.de>; Fri, 28 Feb 2025 08:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1768253F3B;
	Fri, 28 Feb 2025 08:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="UimGJTRL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D646276D3B;
	Fri, 28 Feb 2025 08:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740732589; cv=none; b=bOPdXD+bxUwQuNhKfSP2XCbtk2aOQZfkViu2Ji+nlQ9nHeUOVWLimLRWPT8g6WXT3Scqfu6gJfVOBS2/HHyOP348TF4KfnhmasOnG9uztyZCTnwUxHNC5pMyA5Rx6RIOGOiVSP+S79NT0pdPpfAdp1LxM9ggejqJqzsnO+jR5zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740732589; c=relaxed/simple;
	bh=hrumNHzaFlpOdg+6QSUhWy9VTkbT/XcBYRpYCCjZgnA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FD2/DFkhNTIyXwX2jIg8ssoeMz1diWar1tZpEGdAfNzhdk5wRHN+TFkVfxgNhOmD0vbiNi5nCjkOEyBH6Z13t7rMea2JSFcPnxFh0Oc1wXQscL4zBV3DIuMQnIMfM1NdEhzNkd59j+pl/qDyEJwZxwSch2hpUlXu+iqhq363keA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=UimGJTRL; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1740732585;
	bh=hrumNHzaFlpOdg+6QSUhWy9VTkbT/XcBYRpYCCjZgnA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UimGJTRL1tIv6J8a8JGGrwRYcp09VlmGWndhoaSNzJsNgxU7hQA+ao4Hq0/GfWjF/
	 wxZlEyGFhmniAZCDvHnliCz6foiyg93iX2PxNAMnvCVILMxcdbdPtG+v+LzyIa9uVg
	 /cxkO/SDiSu7lp/WfOTz6TvsqMWffZ5CRVsj+kX0m2TqeogpBHN39xDbQ+Hms7RYfF
	 iG7A4vICu1W0aLiHAaY8dHohFzpKOwrgb98xtrrUJU7EXReL6fK+YSac6vO7UgOpFP
	 ltTukYslZX6JP4UFZH5FF2SIQ9aoNvaApYT+K1rM1ucXDqWj0o1flWr/Xc5Zw428CE
	 Qhp9PqIESQVhA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A97DB17E0673;
	Fri, 28 Feb 2025 09:49:44 +0100 (CET)
Message-ID: <4ae2ef45-93c8-4cac-8331-0962085cea10@collabora.com>
Date: Fri, 28 Feb 2025 09:49:43 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] pinctrl: mediatek: Add pinctrl driver on mt8196
To: Cathy Xu <ot_cathy.xu@mediatek.com>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Yong Mao <yong.mao@mediatek.com>,
 Axe Yang <axe.yang@mediatek.com>, Wenbin Mei <wenbin.mei@mediatek.com>,
 Lei Xue <lei.xue@mediatek.com>, Guodong Liu <guodong.liu@mediatek.com>
References: <20250228011702.16493-1-ot_cathy.xu@mediatek.com>
 <20250228011702.16493-4-ot_cathy.xu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250228011702.16493-4-ot_cathy.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 28/02/25 02:16, Cathy Xu ha scritto:
> From: Guodong Liu <guodong.liu@mediatek.com>
> 
> Add pinctrl driver support for MediaTek Soc mt8196.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>
> ---
>   drivers/pinctrl/mediatek/Kconfig              |   12 +
>   drivers/pinctrl/mediatek/Makefile             |    1 +
>   drivers/pinctrl/mediatek/pinctrl-mt8196.c     | 1857 +++++++++++
>   drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h | 2789 +++++++++++++++++
>   4 files changed, 4659 insertions(+)
>   create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8196.c
>   create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h
> 
> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
> index 58f32818a0e6..b59d94a0fe3b 100644
> --- a/drivers/pinctrl/mediatek/Kconfig
> +++ b/drivers/pinctrl/mediatek/Kconfig
> @@ -263,6 +263,18 @@ config PINCTRL_MT8195
>   	default ARM64 && ARCH_MEDIATEK
>   	select PINCTRL_MTK_PARIS
>   
> +config PINCTRL_MT8196
> +	bool "MediaTek MT8196 pin control"
> +	depends on OF
> +	depends on ARM64 || COMPILE_TEST
> +	default ARM64 && ARCH_MEDIATEK
> +	select PINCTRL_MTK_PARIS
> +	help
> +	  Say yes here to support pin controller and gpio driver
> +	  on MediaTek MT8196 SoC.
> +	  In MTK platform, we support virtual gpio and use it to
> +	  map specific eint which doesn't have real gpio pin.
> +
>   config PINCTRL_MT8365
>   	bool "MediaTek MT8365 pin control"
>   	depends on OF
> diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek/Makefile
> index 721ae83476d0..08e7239fcd8b 100644
> --- a/drivers/pinctrl/mediatek/Makefile
> +++ b/drivers/pinctrl/mediatek/Makefile
> @@ -36,6 +36,7 @@ obj-$(CONFIG_PINCTRL_MT8186)		+= pinctrl-mt8186.o
>   obj-$(CONFIG_PINCTRL_MT8188)		+= pinctrl-mt8188.o
>   obj-$(CONFIG_PINCTRL_MT8192)		+= pinctrl-mt8192.o
>   obj-$(CONFIG_PINCTRL_MT8195)		+= pinctrl-mt8195.o
> +obj-$(CONFIG_PINCTRL_MT8196)		+= pinctrl-mt8196.o
>   obj-$(CONFIG_PINCTRL_MT8365)		+= pinctrl-mt8365.o
>   obj-$(CONFIG_PINCTRL_MT8516)		+= pinctrl-mt8516.o
>   obj-$(CONFIG_PINCTRL_MT6397)		+= pinctrl-mt6397.o
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8196.c b/drivers/pinctrl/mediatek/pinctrl-mt8196.c
> new file mode 100644
> index 000000000000..1baefdc7e36d
> --- /dev/null
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8196.c
> @@ -0,0 +1,1857 @@

..snip..

> +
> +static const struct mtk_pin_soc mt8196_data = {
> +	.reg_cal = mt8196_reg_cals,
> +	.pins = mtk_pins_mt8196,
> +	.npins = ARRAY_SIZE(mtk_pins_mt8196),
> +	.ngrps = ARRAY_SIZE(mtk_pins_mt8196),
> +	.eint_hw = &mt8196_eint_hw,
> +	.nfuncs = 8,
> +	.gpio_m = 0,
> +	.base_names = mt8196_pinctrl_register_base_names,
> +	.nbase_names = ARRAY_SIZE(mt8196_pinctrl_register_base_names),
> +	.pull_type = mt8196_pull_type,
> +	.pin_rsel = mt8196_pin_rsel_val_range,
> +	.npin_rsel = ARRAY_SIZE(mt8196_pin_rsel_val_range),
> +	.bias_set_combo = mtk_pinconf_bias_set_combo,
> +	.bias_get_combo = mtk_pinconf_bias_get_combo,
> +	.drive_set = mtk_pinconf_drive_set_rev1,
> +	.drive_get = mtk_pinconf_drive_get_rev1,
> +	.adv_drive_get = mtk_pinconf_adv_drive_get_raw,
> +	.adv_drive_set = mtk_pinconf_adv_drive_set_raw,

In the cover letter, you said:

"Add values in SI units option to |struct mtk_pin_soc| in pinctrl-mt8196.c"

....I don't see that here though?

> +};
> +
> +static const struct of_device_id mt8196_pinctrl_of_match[] = {
> +	{ .compatible = "mediatek,mt8196-pinctrl", .data = &mt8196_data },
> +	{ }

{ /* sentinel */ }

> +};
> +
> +static struct platform_driver mt8196_pinctrl_driver = {
> +	.driver = {
> +		.name = "mt8196-pinctrl",
> +		.of_match_table = mt8196_pinctrl_of_match,
> +		.pm = pm_sleep_ptr(&mtk_paris_pinctrl_pm_ops),
> +	},
> +	.probe = mtk_paris_pinctrl_probe,
> +};
> +
> +static int __init mt8196_pinctrl_init(void)
> +{
> +	return platform_driver_register(&mt8196_pinctrl_driver);
> +}
> +arch_initcall(mt8196_pinctrl_init);
> +
> +MODULE_DESCRIPTION("MediaTek MT8196 Pinctrl Driver");

MODULE_LICENSE is missing!

Cheers,
Angelo

> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h
> new file mode 100644
> index 000000000000..d342d091672c

