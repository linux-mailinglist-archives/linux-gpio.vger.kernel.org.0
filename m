Return-Path: <linux-gpio+bounces-29060-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAABC84518
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 10:56:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 42A8F4E7A29
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Nov 2025 09:56:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFC532ECE8F;
	Tue, 25 Nov 2025 09:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="XswQqcNN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF382ECD37;
	Tue, 25 Nov 2025 09:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764064587; cv=none; b=QUrU9MAqUGrftc1KP6HRh3n31vAL8WrTjC3pbSK9z0h0DS2/IEhvX9DTo0mDD9/i/N7FP1G8MA3bF6wbyxdtqwDjttnLoVY+kb6B/quFgEIvZk+G9RkbuIWAPuZyW2zkgsR5sskt8ACbYdV/NkWo0LsaMpGPLr5jNUR/QTKTWwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764064587; c=relaxed/simple;
	bh=9jl5v4+JdDvgBkvLISMlWWBdoST2HqCbEtgiUfTgVFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p6bfTNZJAZ0VdED/tLOZlPSgVV2juAc241+7R0g4YrHC4qx8xBjzUu+PEM4CCW5vAhjkShwXHliaJdQ+S6OjYihdLwPLpeoc9wJab9OeZPvoc/aonssj6XMOiODnbLR+Zqi/QC1vONZD/PqQLWKVzX0pdJ1TwxZwo2AAytkIoD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=XswQqcNN; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764064583;
	bh=9jl5v4+JdDvgBkvLISMlWWBdoST2HqCbEtgiUfTgVFE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XswQqcNNil2GnAhC8yZSG6Y5ri5h3BzvZMZUGcCflNbZsoi8zhnsw+CQfXm0gubiM
	 iWy7M6CL3WPR4oX0z7JlMfncdSL2cpnx+fmfHIq6bIv37jzl5aU4aca/26A0wZuNgf
	 bG5Db8M3EqlFNyzsMBRbsGpeNh+lYud6YtC8milranEqopv5vsCM38QApottFSW+oH
	 cuYmS4a1/XWIQCHQY57yLHg8OgDGTbhzgo1TSJsfwrYztKFrNLiDUMf3SALDhPgLN8
	 SSV5OtYeWgtkhp366Mq5sH8vumBGxsdYoMeRVpfQTkpZR7hYatYvWnG+56JXd3eWVh
	 JWQrbk//v1w3Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C5D0917E0610;
	Tue, 25 Nov 2025 10:56:22 +0100 (CET)
Message-ID: <df11bbf1-09d1-40fc-be56-6a98d90abcb6@collabora.com>
Date: Tue, 25 Nov 2025 10:56:22 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] pinctrl: mediatek: mt8901: Add pinctrl driver for
 MT8901
To: Lei Xue <lei.xue@mediatek.com>, Sean Wang <sean.wang@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 yong.mao@mediatek.com, qingliang.li@mediatek.com, Fred-WY.Chen@mediatek.com,
 ot_cathy.xu@mediatek.com, ot_shunxi.zhang@mediatek.com,
 ot_yaoy.wang@mediatek.com, ot_ye.wang@mediatek.com
References: <20251125023639.2416546-1-lei.xue@mediatek.com>
 <20251125023639.2416546-4-lei.xue@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251125023639.2416546-4-lei.xue@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 25/11/25 03:36, Lei Xue ha scritto:
> Add mt8901 pinctrl, gpio and eint driver implementation.
> 
> Signed-off-by: Lei Xue <lei.xue@mediatek.com>
> ---
>   drivers/pinctrl/mediatek/Kconfig              |   12 +
>   drivers/pinctrl/mediatek/Makefile             |    1 +
>   drivers/pinctrl/mediatek/mtk-eint.c           |    4 +
>   drivers/pinctrl/mediatek/mtk-eint.h           |    1 +
>   drivers/pinctrl/mediatek/pinctrl-mt8901.c     | 1460 +++++++++++
>   drivers/pinctrl/mediatek/pinctrl-mtk-mt8901.h | 2130 +++++++++++++++++
>   6 files changed, 3608 insertions(+)
>   create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8901.c
>   create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8901.h
> 
> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
> index 4819617d9368..4820ae5197a0 100644
> --- a/drivers/pinctrl/mediatek/Kconfig
> +++ b/drivers/pinctrl/mediatek/Kconfig
> @@ -321,6 +321,18 @@ config PINCTRL_MT8516
>   	default ARM64 && ARCH_MEDIATEK
>   	select PINCTRL_MTK
>   
> +config PINCTRL_MT8901
> +	bool "MediaTek MT8901 pin control"
> +	depends on ACPI
> +	depends on ARM64 || COMPILE_TEST
> +	default ARM64 && ARCH_MEDIATEK
> +	select PINCTRL_MTK_PARIS
> +	help
> +	  Say yes here to support pin controller and gpio driver
> +	  on MediaTek MT8901 SoC.
> +	  In MTK platform, we support virtual gpio and use it to
> +	  map specific eint which doesn't have real gpio pin.
> +
>   # For PMIC
>   config PINCTRL_MT6397
>   	bool "MediaTek MT6397 pin control"
> diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek/Makefile
> index ae765bd99965..57c69b1e5c2d 100644
> --- a/drivers/pinctrl/mediatek/Makefile
> +++ b/drivers/pinctrl/mediatek/Makefile
> @@ -43,3 +43,4 @@ obj-$(CONFIG_PINCTRL_MT8196)		+= pinctrl-mt8196.o
>   obj-$(CONFIG_PINCTRL_MT8365)		+= pinctrl-mt8365.o
>   obj-$(CONFIG_PINCTRL_MT8516)		+= pinctrl-mt8516.o
>   obj-$(CONFIG_PINCTRL_MT6397)		+= pinctrl-mt6397.o
> +obj-$(CONFIG_PINCTRL_MT8901)		+= pinctrl-mt8901.o
> diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
> index c8c5097c11c4..b5a5beebf9cd 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.c
> +++ b/drivers/pinctrl/mediatek/mtk-eint.c
> @@ -71,6 +71,10 @@ const unsigned int debounce_time_mt6878[] = {
>   };
>   EXPORT_SYMBOL_GPL(debounce_time_mt6878);
>   
> +const unsigned int debounce_time_mt8901[] = {
> +	156, 313, 625, 1250, 20000, 40000, 80000, 160000, 320000, 640000, 0};
> +EXPORT_SYMBOL_GPL(debounce_time_mt8901);
> +
>   static void __iomem *mtk_eint_get_offset(struct mtk_eint *eint,
>   					 unsigned int eint_num,
>   					 unsigned int offset)
> diff --git a/drivers/pinctrl/mediatek/mtk-eint.h b/drivers/pinctrl/mediatek/mtk-eint.h
> index 3cdd6f6310cd..1b185f660aff 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.h
> +++ b/drivers/pinctrl/mediatek/mtk-eint.h
> @@ -53,6 +53,7 @@ extern const unsigned int debounce_time_mt2701[];
>   extern const unsigned int debounce_time_mt6765[];
>   extern const unsigned int debounce_time_mt6795[];
>   extern const unsigned int debounce_time_mt6878[];
> +extern const unsigned int debounce_time_mt8901[];
>   
>   struct mtk_eint;
>   
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8901.c b/drivers/pinctrl/mediatek/pinctrl-mt8901.c
> new file mode 100644
> index 000000000000..77dec85fe29b
> --- /dev/null
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8901.c
> @@ -0,0 +1,1460 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2025 MediaTek Inc.
> + *
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/module.h>
> +#include "pinctrl-mtk-mt8901.h"
> +#include "pinctrl-paris.h"
> +

..snip..

> +static const char * const mt8901_pinctrl_register_base_name[] = {
> +	"iocfg0", "iocfg_lt2", "iocfg_lt3", "iocfg_rt1", "iocfg_rt2", "iocfg_rt3",
> +	"iocfg_tr", "iocfg_rt0", "iocfg_lt1", "iocfg_lb", "iocfg_rb",
> +};
> +
> +static const struct mtk_eint_hw mt8901_eint_hw = {
> +	.port_mask = 0xf,
> +	.ports     = 7,
> +	.ap_num    = 209,
> +	.db_cnt    = 32,
> +	.db_time   = debounce_time_mt8901,
> +};
> +
> +static const struct mtk_pin_soc mt8901_data = {
> +	.reg_cal = mt8901_reg_cals,
> +	.pins = mtk_pins_mt8901,
> +	.npins = ARRAY_SIZE(mtk_pins_mt8901),
> +	.ngrps = ARRAY_SIZE(mtk_pins_mt8901),
> +	.eint_hw = &mt8901_eint_hw,
> +	.eint_pin = eint_pins_mt8901,
> +	.nfuncs = 8,
> +	.gpio_m = 0,
> +	.base_names = mt8901_pinctrl_register_base_name,
> +	.nbase_names = ARRAY_SIZE(mt8901_pinctrl_register_base_name),
> +	.pull_type = mt8901_pull_type,
> +	.pin_rsel = mt8901_pin_rsel_val_range,
> +	.npin_rsel = ARRAY_SIZE(mt8901_pin_rsel_val_range), /*numsel*/
> +	.bias_set_combo = mtk_pinconf_bias_set_combo,
> +	.bias_get_combo = mtk_pinconf_bias_get_combo,
> +	.drive_set = mtk_pinconf_drive_set_rev1,
> +	.drive_get = mtk_pinconf_drive_get_rev1,
> +	.adv_drive_set = mtk_pinconf_adv_drive_set_raw,
> +	.adv_drive_get = mtk_pinconf_adv_drive_get_raw,
> +};
> +
> +static const struct acpi_device_id mt8901_pinctrl_acpi_match[] = {
> +	{"NVDA9221", (kernel_ulong_t)&mt8901_data },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, mt8901_pinctrl_acpi_match);
> +
> +static struct platform_driver mt8901_pinctrl_driver = {
> +	.driver = {
> +		.name = "mt8901-pinctrl",
> +		.acpi_match_table = ACPI_PTR(mt8901_pinctrl_acpi_match),

Please also add support for devicetree - I have a hunch (and I'm sure that I am
not the only one) that ACPI may give some issues at the end of the day, on ARM64.

Of course, I'd hope that ACPI is all good on this platform, but still.... :-)

static const struct of_device_id mt8901_pinctrl_of_match[] = {
	{ .compatible = "mediatek,mt8901-pinctrl", .data = &mt8901_data },
	{ /* sentinel */ }
};

	.of_match_table = mt8901_pinctrl_of_match,

> +		.pm = pm_sleep_ptr(&mtk_paris_pinctrl_pm_ops)
> +	},
> +	.probe = mtk_paris_pinctrl_probe,
> +};

Cheers,
Angelo

> +
> +static int __init mt8901_pinctrl_init(void)
> +{
> +	return platform_driver_register(&mt8901_pinctrl_driver);
> +}
> +
> +arch_initcall(mt8901_pinctrl_init);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_DESCRIPTION("MediaTek MT8901 Pinctrl Driver");

