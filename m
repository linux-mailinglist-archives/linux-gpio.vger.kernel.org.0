Return-Path: <linux-gpio+bounces-12825-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 315529C3FA3
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 14:39:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54AA61C21827
	for <lists+linux-gpio@lfdr.de>; Mon, 11 Nov 2024 13:39:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 992FF19D091;
	Mon, 11 Nov 2024 13:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="eO2lA6xL"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C1155C29;
	Mon, 11 Nov 2024 13:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731332361; cv=none; b=buQFzbL4ANm8Kr49dDS87knAbXoriCT8fhNDZhlp6wjm8CkPgy6q+fXntWNjp/KZ0MoAZlTTjqHkPI4q1lH2wiYCV7ObRWCNv+rZQf6COxzBp3/pGlR3mn6xyPUL7JwiQS5f54M4+0LqZAU8W62kLICP1Yw2PIV6H9lrlL7jIOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731332361; c=relaxed/simple;
	bh=ZHl9kaQvP87pfaer5ugsO1tp61Mnu5JhljLuzu4Tf/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s/X+SB6nVY8+C+/NYdLG8krmuI95LpgpKHxqQMA2cgX8QN00usG5wLIYDRkMP0k/T9HV903i0OqRLnQJNCD32YV/RQ3WYOyDVtVLLo5d+tFsRHJd00P67iTbkOEC8DBISECo8YXf2gLWF09WeCG7hTMSO6/ubSPChVa/8dXoiiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=eO2lA6xL; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731332357;
	bh=ZHl9kaQvP87pfaer5ugsO1tp61Mnu5JhljLuzu4Tf/Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=eO2lA6xLxjaEd1crnztASfRpL09mogrvcvdzvH11lMQ0O7sS4Jr2QAIrZHgrRLnvS
	 pLY+u2d2lfexmWyO2NGvqwSfeORSJuiraC/RhT9CtuxOZ4vRJ+qEaupO5gr9FUDpYG
	 1DGNqiWBcRB50pL+bFHM4KuTvTYhDMffHIeezJ+RloRUbITa59aSMOSjRLVNUbfVXd
	 ft45Bj4Z7IOxsnoRgnvTFzP6ansQX4jsfKN8+VoJnUvauwxROCnHvGhoGC8DqWrWm4
	 uIcLCqRFMpwFAIK++Ki7q6TTeP7GPjrt9Q9VXXxjIFqZf6ae2erNzQvsIcm2aNLcwa
	 CwlTKxYzPQofg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AEEE117E363A;
	Mon, 11 Nov 2024 14:39:16 +0100 (CET)
Message-ID: <73756cb5-6bd4-4c4e-9d91-1b9c1ca96a37@collabora.com>
Date: Mon, 11 Nov 2024 14:39:15 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: mediatek: Add pinctrl driver
To: ot907280 <ot_cathy.xu@mediatek.com>, matthias.bgg@gmail.com,
 sean.wang@kernel.org, linus.walleij@linaro.org
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>,
 Guodong Liu <guodong.liu@mediatek.com>
References: <20241111074030.25673-1-ot_cathy.xu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241111074030.25673-1-ot_cathy.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 11/11/24 08:40, ot907280 ha scritto:
> From: Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>
> 
> Add pinctrl driver for mt8196
> 

Please fix the commit title, add a meaningful description ... and also please fix
your name, as your email is sent by "ot907280" and not from "Cathy Xu".

> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> Cathy Xu <ot_cathy.xu@mediatek.com>

You're missing the "Signed-off-by: " part before your name.

> ---
>   drivers/pinctrl/mediatek/Kconfig              |   12 +
>   drivers/pinctrl/mediatek/Makefile             |    1 +
>   drivers/pinctrl/mediatek/pinctrl-mt8196.c     | 1757 +++++++++++
>   drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h | 2791 +++++++++++++++++
>   4 files changed, 4561 insertions(+)
>   create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8196.c
>   create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h
> 
> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
> index a417a031659c..149a78e4216e 100644
> --- a/drivers/pinctrl/mediatek/Kconfig
> +++ b/drivers/pinctrl/mediatek/Kconfig
> @@ -256,6 +256,18 @@ config PINCTRL_MT8195
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
> index 1405d434218e..b4a39c1bafb7 100644
> --- a/drivers/pinctrl/mediatek/Makefile
> +++ b/drivers/pinctrl/mediatek/Makefile
> @@ -35,6 +35,7 @@ obj-$(CONFIG_PINCTRL_MT8186)		+= pinctrl-mt8186.o
>   obj-$(CONFIG_PINCTRL_MT8188)		+= pinctrl-mt8188.o
>   obj-$(CONFIG_PINCTRL_MT8192)		+= pinctrl-mt8192.o
>   obj-$(CONFIG_PINCTRL_MT8195)		+= pinctrl-mt8195.o
> +obj-$(CONFIG_PINCTRL_MT8196)		+= pinctrl-mt8196.o
>   obj-$(CONFIG_PINCTRL_MT8365)		+= pinctrl-mt8365.o
>   obj-$(CONFIG_PINCTRL_MT8516)		+= pinctrl-mt8516.o
>   obj-$(CONFIG_PINCTRL_MT6397)		+= pinctrl-mt6397.o
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt8196.c b/drivers/pinctrl/mediatek/pinctrl-mt8196.c
> new file mode 100644
> index 000000000000..6d2bee706718
> --- /dev/null
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt8196.c
> @@ -0,0 +1,1757 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2024 Mediatek Inc.
> + * Author: Guodong Liu <Guodong.Liu@mediatek.com>
> + *
> + */
> +
> +#include <linux/module.h>
> +#include "pinctrl-mtk-mt8196.h"
> +#include "pinctrl-paris.h"
> +
> +#define PIN_FIELD_BASE(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit, x_bits)  \

It doesn't look like there's any s_pin with a different number from e_pin - unless
I am misreading something, you can change `s_pin` to be named `se_pin`, so that we
stop declaring the number twice; makes it a little more readable.

> +	PIN_FIELD_CALC(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit, x_bits, \
> +		32, 0)
> +
> +#define PINS_FIELD_BASE(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit, x_bits) \

Same here.

> +	PIN_FIELD_CALC(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit, x_bits, \
> +		32, 1)
> +
> +static const struct mtk_pin_field_calc mt8196_pin_mode_range[] = {
> +	PIN_FIELD(0, 270, 0x0300, 0x10, 0, 4),
> +};
> +
> +static const struct mtk_pin_field_calc mt8196_pin_dir_range[] = {
> +	PIN_FIELD(0, 270, 0x0000, 0x10, 0, 1),
> +};
> +
> +static const struct mtk_pin_field_calc mt8196_pin_di_range[] = {
> +	PIN_FIELD(0, 270, 0x0200, 0x10, 0, 1),
> +};
> +
> +static const struct mtk_pin_field_calc mt8196_pin_do_range[] = {
> +	PIN_FIELD(0, 270, 0x0100, 0x10, 0, 1),
> +};
> +
..snip..

> +static const unsigned int mt8196_pull_type[] = {
> +	MTK_PULL_PU_PD_TYPE,/*0*/		MTK_PULL_PU_PD_TYPE,/*1*/
> +	MTK_PULL_PU_PD_TYPE,/*2*/		MTK_PULL_PU_PD_TYPE,/*3*/
> +	MTK_PULL_PU_PD_TYPE,/*4*/		MTK_PULL_PU_PD_TYPE,/*5*/
> +	MTK_PULL_PU_PD_TYPE,/*6*/		MTK_PULL_PU_PD_TYPE,/*7*/
> +	MTK_PULL_PU_PD_TYPE,/*8*/		MTK_PULL_PU_PD_TYPE,/*9*/
> +	MTK_PULL_PU_PD_TYPE,/*10*/		MTK_PULL_PU_PD_TYPE,/*11*/
> +	MTK_PULL_PU_PD_TYPE,/*12*/		MTK_PULL_PU_PD_TYPE,/*13*/
> +	MTK_PULL_PU_PD_TYPE,/*14*/		MTK_PULL_PU_PD_TYPE,/*15*/
> +	MTK_PULL_PU_PD_TYPE,/*16*/		MTK_PULL_PU_PD_TYPE,/*17*/
> +	MTK_PULL_PU_PD_TYPE,/*18*/		MTK_PULL_PU_PD_TYPE,/*19*/
> +	MTK_PULL_PU_PD_TYPE,/*20*/		MTK_PULL_PU_PD_TYPE,/*21*/
> +	MTK_PULL_PU_PD_TYPE,/*22*/		MTK_PULL_PU_PD_TYPE,/*23*/
> +	MTK_PULL_PU_PD_TYPE,/*24*/		MTK_PULL_PU_PD_TYPE,/*25*/
> +	MTK_PULL_PU_PD_TYPE,/*26*/		MTK_PULL_PU_PD_TYPE,/*27*/
> +	MTK_PULL_PU_PD_TYPE,/*28*/		MTK_PULL_PU_PD_TYPE,/*29*/
> +	MTK_PULL_PU_PD_TYPE,/*30*/		MTK_PULL_PU_PD_TYPE,/*31*/
> +	MTK_PULL_PU_PD_TYPE,/*32*/		MTK_PULL_PU_PD_TYPE,/*33*/
> +	MTK_PULL_PU_PD_TYPE,/*34*/		MTK_PULL_PU_PD_TYPE,/*35*/
> +	MTK_PULL_PU_PD_TYPE,/*36*/		MTK_PULL_PU_PD_TYPE,/*37*/
> +	MTK_PULL_PU_PD_TYPE,/*38*/		MTK_PULL_PU_PD_TYPE,/*39*/
> +	MTK_PULL_PU_PD_TYPE,/*40*/		MTK_PULL_PU_PD_TYPE,/*41*/
> +	MTK_PULL_PU_PD_TYPE,/*42*/		MTK_PULL_PU_PD_TYPE,/*43*/
> +	MTK_PULL_PU_PD_TYPE,/*44*/		MTK_PULL_PU_PD_TYPE,/*45*/
> +	MTK_PULL_PU_PD_RSEL_TYPE,/*46*/	MTK_PULL_PU_PD_RSEL_TYPE,/*47*/
> +	MTK_PULL_PU_PD_RSEL_TYPE,/*48*/	MTK_PULL_PU_PD_RSEL_TYPE,/*49*/
> +	MTK_PULL_PU_PD_RSEL_TYPE,/*50*/	MTK_PULL_PU_PD_RSEL_TYPE,/*51*/

Please fix the indentation to be consistent.

> +	MTK_PULL_PU_PD_RSEL_TYPE,/*52*/	MTK_PULL_PU_PD_RSEL_TYPE,/*53*/

..snip..

> +
> +static const struct mtk_pin_soc mt8196_data = {
> +	.reg_cal	= mt8196_reg_cals,
> +	.pins	= mtk_pins_mt8196,
> +	.npins	= ARRAY_SIZE(mtk_pins_mt8196),
> +	.ngrps	= ARRAY_SIZE(mtk_pins_mt8196),

Where is eint?!

> +	.nfuncs	= 8,
> +	.gpio_m	= 0,
> +	.base_names	= mt8196_pinctrl_register_base_names,
> +	.nbase_names	= ARRAY_SIZE(mt8196_pinctrl_register_base_names),
> +	.pull_type = mt8196_pull_type,
> +	.bias_set_combo	= mtk_pinconf_bias_set_combo,
> +	.bias_get_combo	= mtk_pinconf_bias_get_combo,
> +	.drive_set	= mtk_pinconf_drive_set_rev1,
> +	.drive_get	= mtk_pinconf_drive_get_rev1,
> +	.adv_drive_get	= mtk_pinconf_adv_drive_get_raw,
> +	.adv_drive_set	= mtk_pinconf_adv_drive_set_raw,
> +};
> +
> +static const struct of_device_id mt8196_pinctrl_of_match[] = {
> +	{ .compatible = "mediatek,mt8196-pinctrl", .data = &mt8196_data },
> +	{ }

	{ /* sentinel */ }

> +};

Regards,
Angelo


