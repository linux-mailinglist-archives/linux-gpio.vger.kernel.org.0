Return-Path: <linux-gpio+bounces-11268-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EC2899C235
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 09:56:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C7046281163
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Oct 2024 07:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5068F148FF3;
	Mon, 14 Oct 2024 07:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="kc4Ur3Wn"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB0E1531E2;
	Mon, 14 Oct 2024 07:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728892512; cv=none; b=Wtd79GWnsNDVeFgoouVLYbhqjD7iE9S1Opgk+jqG02aTRkBKpkwblPYcg6PSN/UcyYQS5sFnSjv2sYvsMeHUcwXMS0+GZhKAn7NUrkKTovJg3sbDWFRhXcLyIXUJ8KUWQAT6BVUxXAMxWUuqdAg9BGYbq6h+rU4LRrNkTcnF2zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728892512; c=relaxed/simple;
	bh=lyY+5pCJTEqtKDO4IDGUo7crF97ivfpsYxSpoaLJzwM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mz3AN9uV/fCeHfnHIb6JrYRyTREAn2SubdFq//i4X9aGo6wgEtvIo8qFAESLFAs1m0cCVM7UlkM+u5Y62BVDqC57t8Cs8MmZtUY6udQSiuwcPrDtC0+Ty6D8m6Euo7YHiiSfi+Z2bjALGTw8ne+g5aSJoR7hcGHeqMEbumCrjQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=kc4Ur3Wn; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728892508;
	bh=lyY+5pCJTEqtKDO4IDGUo7crF97ivfpsYxSpoaLJzwM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kc4Ur3WnZmYwqXum2e65KYNu28CZXXCtPImc2q+0dLYWxog/203HZjF4rvsSkF9Vu
	 xbrHpEemrM2270Cjo1oFKSjB2FqUAQ7WEFGuvaOWclx1vtTmsI3It7dCvEa/wa6vUG
	 LrFTsj4nsq7KFRQsi6K0SNNUHTSIuacyNKnTSHMruMx+hwTKOz5GPtiqXcinEM3rkz
	 Th1JtjvFNV94E6w2y8aOC/Uzccfii1As/sU0irwc78sH+RgDo+dkNkDFo/yJafTj37
	 caHW5ntPdEwUKwPmD5HyiCvgGPUWWZGFCSLOHxS+rH4byGANz01t8QG91wQx0x/GcR
	 drV8K9f65QLJA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B35A517E10B5;
	Mon, 14 Oct 2024 09:55:07 +0200 (CEST)
Message-ID: <099a5360-a42c-4a60-a6e1-08ec6d6162ec@collabora.com>
Date: Mon, 14 Oct 2024 09:55:07 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 8/8] pinctrl: mediatek: Add MT6735 pinctrl driver
To: Yassine Oudjana <yassine.oudjana@gmail.com>,
 Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Yassine Oudjana <y.oudjana@protonmail.com>,
 Andy Teng <andy.teng@mediatek.com>, linux-mediatek@lists.infradead.org,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20241011120520.140318-1-y.oudjana@protonmail.com>
 <20241011120520.140318-9-y.oudjana@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241011120520.140318-9-y.oudjana@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 11/10/24 14:03, Yassine Oudjana ha scritto:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add a driver for the MediaTek MT6735 SoC pin controller. This driver
> also supports the pin controller on MT6735M, which lacks 6 physical
> pins (198-203) used for MSDC2 on MT6735.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>   MAINTAINERS                                   |    3 +
>   drivers/pinctrl/mediatek/Kconfig              |    6 +
>   drivers/pinctrl/mediatek/Makefile             |    1 +
>   drivers/pinctrl/mediatek/pinctrl-mt6735.c     |  880 ++++
>   drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h | 3993 +++++++++++++++++
>   5 files changed, 4883 insertions(+)
>   create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt6735.c
>   create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index f95ae886f9fd8..28de4a76bc05a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18315,6 +18315,9 @@ PIN CONTROLLER - MEDIATEK MT6735
>   M:	Yassine Oudjana <y.oudjana@protonmail.com>
>   L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
>   S:	Maintained
> +F:	Documentation/devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml
> +F:	drivers/pinctrl/mediatek/pinctrl-mt6735.c
> +F:	drivers/pinctrl/mediatek/pinctrl-mtk-mt6735.h
>   F:	include/dt-bindings/pinctrl/mediatek,mt6735-pinctrl.h
>   
>   PIN CONTROLLER - MICROCHIP AT91
> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
> index 7af287252834a..73052dad0e4a1 100644
> --- a/drivers/pinctrl/mediatek/Kconfig
> +++ b/drivers/pinctrl/mediatek/Kconfig
> @@ -133,6 +133,12 @@ config PINCTRL_MT2712
>   	default ARM64 && ARCH_MEDIATEK
>   	select PINCTRL_MTK
>   
> +config PINCTRL_MT6735
> +	bool "MediaTek MT6735(M) pin control"

bool "MediaTek MT6735 and MT6735m pin control"

> +	depends on OF

depends on ARM64 || COMPILE_TEST

> +	default ARM64 && ARCH_MEDIATEK
> +	select PINCTRL_MTK_PARIS
> +
>   config PINCTRL_MT6765
>   	tristate "MediaTek MT6765 pin control"
>   	depends on OF
> diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek/Makefile
> index 680f7e8526e00..f8ea0926b06db 100644
> --- a/drivers/pinctrl/mediatek/Makefile
> +++ b/drivers/pinctrl/mediatek/Makefile
> @@ -18,6 +18,7 @@ obj-$(CONFIG_PINCTRL_MT2701)		+= pinctrl-mt2701.o
>   obj-$(CONFIG_PINCTRL_MT2712)		+= pinctrl-mt2712.o
>   obj-$(CONFIG_PINCTRL_MT8135)		+= pinctrl-mt8135.o
>   obj-$(CONFIG_PINCTRL_MT8127)		+= pinctrl-mt8127.o
> +obj-$(CONFIG_PINCTRL_MT6735)		+= pinctrl-mt6735.o
>   obj-$(CONFIG_PINCTRL_MT6765)		+= pinctrl-mt6765.o
>   obj-$(CONFIG_PINCTRL_MT6779)		+= pinctrl-mt6779.o
>   obj-$(CONFIG_PINCTRL_MT6795)		+= pinctrl-mt6795.o
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6735.c b/drivers/pinctrl/mediatek/pinctrl-mt6735.c
> new file mode 100644
> index 0000000000000..3366860d8b493
> --- /dev/null
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt6735.c
> @@ -0,0 +1,880 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022 Yassine Oudjana <y.oudjana@protonmail.com>
> + */
> +

..snip...


static const unsigned int debounce_time_mt6735[] = {
	1, 1000, 16000, 32000, 64000, 128000, 256000, 0
};

> +
> +static const struct mtk_eint_hw mt6735_eint_hw = {
> +	.port_mask = 7,
> +	.ports     = 6,
> +	.ap_num    = 224,
> +	.db_cnt    = 16,
	.db_time   = debounce_time_mt6735,

> +};

After which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



