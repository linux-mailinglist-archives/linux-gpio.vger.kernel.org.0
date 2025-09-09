Return-Path: <linux-gpio+bounces-25780-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 84ACCB4A45F
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 09:59:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 29CAB161691
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Sep 2025 07:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BAB023D7F5;
	Tue,  9 Sep 2025 07:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="of5I2iUl"
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD85723ABBD;
	Tue,  9 Sep 2025 07:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757404755; cv=none; b=ZumqxR/MkYdtrizleDYdfBGMQE19I7LXqY/FVTgRykKGiS9C3N+oWjh9gpkgOZXQZjJO1Gmk9VWTfYf9BCYHKYMKMmEQWSm5lcGOglxf/KH9P1Mcs+IQjaCo5F99ZsIy1gZpK5EEzxOZ8J9sGY/in+GBTI7cNQ/wLRa97eKQDX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757404755; c=relaxed/simple;
	bh=ezmPJPATVpxEPaL3/q3GEBcgrwXxc5Z5xRTcPSLDI/k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OHparnaDUCoy7elMrzEAGgK18c94YUrqKvV4m7mjnJ39yjNh49payxvlqu9gtiHXbJnrVLJzETMD37rOJ6rYT0XvQUkGeP9J0HrSSUruFPyTzm2/d9KWMK1Re5HHyUd8UPiJhM+OYqBBWV5h9CC9kzQBasSBIe0ijbCU3eI1Y2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=of5I2iUl; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757404751;
	bh=ezmPJPATVpxEPaL3/q3GEBcgrwXxc5Z5xRTcPSLDI/k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=of5I2iUlQY9YgzjwZ2j22zgbccbrKeKmvhbkFjpr2FHc6J55xKAMHLcEjZdCXwada
	 +2kf5rznOimB2ny4xzZAF2i3n8uOteQYFRclAUcxQ+gK/k7BGxN49wA9mk6Rb4byft
	 5vVl4p92ZfZg+Gd8IDtVtNxzZtSfGZWqSk+oBwbDVo4fyKoa1xT+YapbmGaTLZPIdo
	 5/rCwxUA6hJwz5J8cSlDJHWLnCvkN94c6jJh7F5RtY2bi3LelwRCEbp59tx/XB3ABm
	 PcGLgqL9OyM4I/tWb5hclcq/P0eCmBRqVcCB1hfxnps/VWOxzI4s+rqrxbxb70SALi
	 AZQSadpuUel9A==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8D0C817E0C96;
	Tue,  9 Sep 2025 09:59:10 +0200 (CEST)
Message-ID: <e1de6c65-b002-47db-b591-18613009f5c6@collabora.com>
Date: Tue, 9 Sep 2025 09:59:10 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] pinctrl: mediatek: Add support for MT6878 pinctrl
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20250908-mt6878-pinctrl-support-v1-0-3fb78c8ab4e8@mentallysanemainliners.org>
 <20250908-mt6878-pinctrl-support-v1-4-3fb78c8ab4e8@mentallysanemainliners.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250908-mt6878-pinctrl-support-v1-4-3fb78c8ab4e8@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 08/09/25 21:17, Igor Belwon ha scritto:
> Add driver support for the pin controller found in the MediaTek
> Dimensity 7300 (MT6878) SoC.
> 
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---
>   drivers/pinctrl/mediatek/Kconfig              |   10 +
>   drivers/pinctrl/mediatek/Makefile             |    1 +
>   drivers/pinctrl/mediatek/pinctrl-mt6878.c     | 1559 +++++++++++++++++
>   drivers/pinctrl/mediatek/pinctrl-mtk-mt6878.h | 2248 +++++++++++++++++++++++++
>   4 files changed, 3818 insertions(+)
> 
> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
> index 5b191e12a8aa9d19f05bfbc51037aa788e9a3c36..4819617d936836eca59e8cc8c4ee8323ba92604f 100644
> --- a/drivers/pinctrl/mediatek/Kconfig
> +++ b/drivers/pinctrl/mediatek/Kconfig
> @@ -181,6 +181,16 @@ config PINCTRL_MT6797
>   	default ARM64 && ARCH_MEDIATEK
>   	select PINCTRL_MTK_PARIS
>   
> +config PINCTRL_MT6878
> +	bool "MediaTek MT6878 pin control"
> +	depends on OF
> +	depends on ARM64 || COMPILE_TEST
> +	default ARM64 && ARCH_MEDIATEK
> +	select PINCTRL_MTK_PARIS
> +	help
> +	  Say yes here to support pin controller and gpio driver
> +	  on the MediaTek MT6878 SoC.
> +
>   config PINCTRL_MT6893
>   	bool "MediaTek Dimensity MT6893 pin control"
>   	depends on OF
> diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek/Makefile
> index 5d4646939ba3ab3586483d36acf5cd701b3bf0dc..ae765bd999657cd887b605e201290c041efd020e 100644
> --- a/drivers/pinctrl/mediatek/Makefile
> +++ b/drivers/pinctrl/mediatek/Makefile
> @@ -23,6 +23,7 @@ obj-$(CONFIG_PINCTRL_MT6765)		+= pinctrl-mt6765.o
>   obj-$(CONFIG_PINCTRL_MT6779)		+= pinctrl-mt6779.o
>   obj-$(CONFIG_PINCTRL_MT6795)		+= pinctrl-mt6795.o
>   obj-$(CONFIG_PINCTRL_MT6797)		+= pinctrl-mt6797.o
> +obj-$(CONFIG_PINCTRL_MT6878)		+= pinctrl-mt6878.o
>   obj-$(CONFIG_PINCTRL_MT6893)		+= pinctrl-mt6893.o
>   obj-$(CONFIG_PINCTRL_MT7622)		+= pinctrl-mt7622.o
>   obj-$(CONFIG_PINCTRL_MT7623)		+= pinctrl-mt7623.o
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6878.c b/drivers/pinctrl/mediatek/pinctrl-mt6878.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..679f8cff1c516565daf9cd85f7b5036b0bcbd159
> --- /dev/null
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt6878.c
> @@ -0,0 +1,1559 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2023 MediaTek Inc.
> + * Author: Light Hsieh <light.hsieh@mediatek.com>
> + *
> + * Copyright (C) 2025 Igor Belwon <igor.belwon@mentallysanemainliners.org>
> + */
> +
> +#include <linux/module.h>
> +#include "pinctrl-mtk-mt6878.h"
> +#include "pinctrl-paris.h"
> +
> +/* MT6878 have multiple bases to program pin configuration listed as the below:
> + * GPIO_BASE: 0x10005000
> + * IOCFG_BL_BASE: 0x11D10000
> + * IOCFG_BM_BASE: 0x11D30000
> + * IOCFG_BR_BASE: 0x11D40000
> + * IOCFG_BL1_BASE: 0x11D50000
> + * IOCFG_BR1_BASE: 0x11D60000
> + * IOCFG_LM_BASE: 0x11E20000
> + * IOCFG_LT_BASE: 0x11E30000
> + * IOCFG_RM_BASE: 0x11EB0000
> + * IOCFG_RT_BASE: 0x11EC0000
> + * _i_based could be used to indicate what base the pin should be mapped into.
> + */
> +
> +#define PIN_FIELD_BASE(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit, x_bits) \
> +	PIN_FIELD_CALC(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit, x_bits, \
> +			32, 0)
> +
> +#define PINS_FIELD_BASE(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit, x_bits) \
> +	PIN_FIELD_CALC(s_pin, e_pin, i_base, s_addr, x_addrs, s_bit, x_bits,  \
> +			32, 1)
> +
> +static const struct mtk_pin_field_calc mt6878_pin_mode_range[] = {

The mode range can be also written simply as:


static const struct mtk_pin_field_calc mt6878_pin_mode_range[] = {
	PIN_FIELD(0, 195, 0x0300, 0x10, 0, 4),
};


> +	PIN_FIELD_BASE(0, 7, 0, 0x0300, 0x10, 0, 4),
> +	PIN_FIELD_BASE(8, 15, 0, 0x0310, 0x10, 0, 4),
> +	PIN_FIELD_BASE(16, 23, 0, 0x0320, 0x10, 0, 4),
> +	PIN_FIELD_BASE(24, 31, 0, 0x0330, 0x10, 0, 4),
> +	PIN_FIELD_BASE(32, 39, 0, 0x0340, 0x10, 0, 4),
> +	PIN_FIELD_BASE(40, 47, 0, 0x0350, 0x10, 0, 4),
> +	PIN_FIELD_BASE(48, 55, 0, 0x0360, 0x10, 0, 4),
> +	PIN_FIELD_BASE(56, 63, 0, 0x0370, 0x10, 0, 4),
> +	PIN_FIELD_BASE(64, 71, 0, 0x0380, 0x10, 0, 4),
> +	PIN_FIELD_BASE(72, 79, 0, 0x0390, 0x10, 0, 4),
> +	PIN_FIELD_BASE(80, 87, 0, 0x03a0, 0x10, 0, 4),
> +	PIN_FIELD_BASE(88, 95, 0, 0x03b0, 0x10, 0, 4),
> +	PIN_FIELD_BASE(96, 103, 0, 0x03c0, 0x10, 0, 4),
> +	PIN_FIELD_BASE(104, 111, 0, 0x03d0, 0x10, 0, 4),
> +	PIN_FIELD_BASE(112, 119, 0, 0x03e0, 0x10, 0, 4),
> +	PIN_FIELD_BASE(120, 127, 0, 0x03f0, 0x10, 0, 4),
> +	PIN_FIELD_BASE(128, 135, 0, 0x0400, 0x10, 0, 4),
> +	PIN_FIELD_BASE(136, 143, 0, 0x0410, 0x10, 0, 4),
> +	PIN_FIELD_BASE(144, 151, 0, 0x0420, 0x10, 0, 4),
> +	PIN_FIELD_BASE(152, 159, 0, 0x0430, 0x10, 0, 4),
> +	PIN_FIELD_BASE(160, 167, 0, 0x0440, 0x10, 0, 4),
> +	PIN_FIELD_BASE(168, 175, 0, 0x0450, 0x10, 0, 4),
> +	PIN_FIELD_BASE(176, 183, 0, 0x0460, 0x10, 0, 4),
> +	PIN_FIELD_BASE(184, 191, 0, 0x0470, 0x10, 0, 4),
> +	PIN_FIELD_BASE(192, 195, 0, 0x0480, 0x10, 0, 4),
> +};
> +
> +static const struct mtk_pin_field_calc mt6878_pin_dir_range[] = {

Same for direction
> +	PIN_FIELD_BASE(0, 31, 0, 0x0000, 0x10, 0, 1),
> +	PIN_FIELD_BASE(32, 63, 0, 0x0010, 0x10, 0, 1),
> +	PIN_FIELD_BASE(64, 95, 0, 0x0020, 0x10, 0, 1),
> +	PIN_FIELD_BASE(96, 127, 0, 0x0030, 0x10, 0, 1),
> +	PIN_FIELD_BASE(128, 159, 0, 0x0040, 0x10, 0, 1),
> +	PIN_FIELD_BASE(160, 191, 0, 0x0050, 0x10, 0, 1),
> +	PIN_FIELD_BASE(192, 195, 0, 0x0060, 0x10, 0, 1),
> +};
> +
> +static const struct mtk_pin_field_calc mt6878_pin_di_range[] = {

Same here again

> +	PIN_FIELD_BASE(0, 31, 0, 0x0200, 0x10, 0, 1),
> +	PIN_FIELD_BASE(32, 63, 0, 0x0210, 0x10, 0, 1),
> +	PIN_FIELD_BASE(64, 95, 0, 0x0220, 0x10, 0, 1),
> +	PIN_FIELD_BASE(96, 127, 0, 0x0230, 0x10, 0, 1),
> +	PIN_FIELD_BASE(128, 159, 0, 0x0240, 0x10, 0, 1),
> +	PIN_FIELD_BASE(160, 191, 0, 0x0250, 0x10, 0, 1),
> +	PIN_FIELD_BASE(192, 195, 0, 0x0260, 0x10, 0, 1),
> +};
> +
> +static const struct mtk_pin_field_calc mt6878_pin_do_range[] = {

And here.

> +	PIN_FIELD_BASE(0, 31, 0, 0x0100, 0x10, 0, 1),
> +	PIN_FIELD_BASE(32, 63, 0, 0x0110, 0x10, 0, 1),
> +	PIN_FIELD_BASE(64, 95, 0, 0x0120, 0x10, 0, 1),
> +	PIN_FIELD_BASE(96, 127, 0, 0x0130, 0x10, 0, 1),
> +	PIN_FIELD_BASE(128, 159, 0, 0x0140, 0x10, 0, 1),
> +	PIN_FIELD_BASE(160, 191, 0, 0x0150, 0x10, 0, 1),
> +	PIN_FIELD_BASE(192, 195, 0, 0x0160, 0x10, 0, 1),
> +};
> +
> +static const struct mtk_pin_field_calc mt6878_pin_ies_range[] = {

..snip..

> +};
> +
> +static const struct mtk_pin_field_calc mt6878_pin_smt_range[] = {

..snip..

> +static const struct mtk_pin_field_calc mt6878_pin_eh_range[] = {

This is mt6878_pin_drv_adv_range[]

> +	PIN_FIELD_BASE(19, 19, 3, 0x0030, 0x10, 0, 3),
> +	PIN_FIELD_BASE(24, 24, 5, 0x0020, 0x10, 0, 3),
> +	PIN_FIELD_BASE(25, 25, 3, 0x0030, 0x10, 3, 3),
> +	PIN_FIELD_BASE(26, 26, 3, 0x0030, 0x10, 6, 3),
> +	PIN_FIELD_BASE(52, 52, 3, 0x0030, 0x10, 12, 3),
> +	PIN_FIELD_BASE(53, 53, 3, 0x0030, 0x10, 15, 3),
> +	PIN_FIELD_BASE(55, 55, 3, 0x0030, 0x10, 9, 3),
> +	PIN_FIELD_BASE(60, 60, 8, 0x0050, 0x10, 12, 3),
> +	PIN_FIELD_BASE(61, 61, 8, 0x0050, 0x10, 15, 3),
> +	PIN_FIELD_BASE(62, 62, 8, 0x0050, 0x10, 21, 3),
> +	PIN_FIELD_BASE(63, 63, 8, 0x0050, 0x10, 18, 3),
> +	PIN_FIELD_BASE(64, 64, 8, 0x0050, 0x10, 24, 3),
> +	PIN_FIELD_BASE(65, 65, 8, 0x0050, 0x10, 27, 3),
> +	PIN_FIELD_BASE(66, 66, 8, 0x0060, 0x10, 3, 3),
> +	PIN_FIELD_BASE(67, 67, 8, 0x0060, 0x10, 0, 3),
> +	PIN_FIELD_BASE(92, 92, 8, 0x0040, 0x10, 0, 3),
> +	PIN_FIELD_BASE(93, 93, 8, 0x0040, 0x10, 3, 3),
> +	PIN_FIELD_BASE(94, 94, 8, 0x0040, 0x10, 6, 3),
> +	PIN_FIELD_BASE(95, 95, 8, 0x0040, 0x10, 9, 3),
> +	PIN_FIELD_BASE(96, 96, 8, 0x0040, 0x10, 12, 3),
> +	PIN_FIELD_BASE(125, 125, 8, 0x0050, 0x10, 9, 3),
> +	PIN_FIELD_BASE(126, 126, 8, 0x0060, 0x10, 6, 3),
> +	PIN_FIELD_BASE(127, 127, 8, 0x0060, 0x10, 9, 3),
> +	PIN_FIELD_BASE(128, 128, 8, 0x0060, 0x10, 12, 3),
> +	PIN_FIELD_BASE(129, 129, 8, 0x0040, 0x10, 15, 3),
> +	PIN_FIELD_BASE(130, 130, 8, 0x0040, 0x10, 24, 3),
> +	PIN_FIELD_BASE(131, 131, 6, 0x0030, 0x10, 12, 3),
> +	PIN_FIELD_BASE(132, 132, 6, 0x0030, 0x10, 21, 3),
> +	PIN_FIELD_BASE(133, 133, 8, 0x0040, 0x10, 18, 3),
> +	PIN_FIELD_BASE(134, 134, 8, 0x0040, 0x10, 27, 3),
> +	PIN_FIELD_BASE(135, 135, 6, 0x0030, 0x10, 15, 3),
> +	PIN_FIELD_BASE(136, 136, 6, 0x0030, 0x10, 24, 3),
> +	PIN_FIELD_BASE(137, 137, 6, 0x0030, 0x10, 18, 3),
> +	PIN_FIELD_BASE(138, 138, 6, 0x0030, 0x10, 27, 3),
> +	PIN_FIELD_BASE(139, 139, 6, 0x0030, 0x10, 0, 3),
> +	PIN_FIELD_BASE(140, 140, 6, 0x0030, 0x10, 6, 3),
> +	PIN_FIELD_BASE(141, 141, 6, 0x0030, 0x10, 3, 3),
> +	PIN_FIELD_BASE(142, 142, 6, 0x0030, 0x10, 9, 3),
> +	PIN_FIELD_BASE(143, 143, 8, 0x0040, 0x10, 21, 3),
> +	PIN_FIELD_BASE(144, 144, 8, 0x0050, 0x10, 0, 3),
> +	PIN_FIELD_BASE(145, 145, 5, 0x0020, 0x10, 3, 3),
> +	PIN_FIELD_BASE(146, 146, 5, 0x0020, 0x10, 6, 3),
> +	PIN_FIELD_BASE(147, 147, 3, 0x0030, 0x10, 18, 3),
> +	PIN_FIELD_BASE(148, 148, 3, 0x0030, 0x10, 21, 3),
> +	PIN_FIELD_BASE(149, 149, 8, 0x0050, 0x10, 3, 3),
> +	PIN_FIELD_BASE(150, 150, 8, 0x0050, 0x10, 6, 3),
> +	PIN_FIELD_BASE(156, 156, 9, 0x0020, 0x10, 0, 5),
> +	PIN_FIELD_BASE(157, 157, 9, 0x0020, 0x10, 5, 5),
> +	PIN_FIELD_BASE(158, 158, 9, 0x0020, 0x10, 10, 5),
> +	PIN_FIELD_BASE(159, 159, 9, 0x0020, 0x10, 15, 5),
> +};
> +

> +
> +static const struct mtk_eh_pin_pinmux mt6878_eh_pin_pinmux_list[] = {

This can be removed entirely

> +	PIN_MUX_EH(19, 3),
> +	PIN_MUX_EH(24, 2),
> +	PIN_MUX_EH(24, 3),
> +	PIN_MUX_EH(25, 2),
> +	PIN_MUX_EH(26, 2),
> +	PIN_MUX_EH(52, 3),
> +	PIN_MUX_EH(53, 3),
> +	PIN_MUX_EH(55, 3),
> +	PIN_MUX_EH(125, 1),
> +	PIN_MUX_EH(126, 1),
> +	PIN_MUX_EH(127, 1),
> +	PIN_MUX_EH(128, 1),
> +	PIN_MUX_EH(129, 1),
> +	PIN_MUX_EH(130, 1),
> +	PIN_MUX_EH(131, 1),
> +	PIN_MUX_EH(132, 1),
> +	PIN_MUX_EH(133, 1),
> +	PIN_MUX_EH(134, 1),
> +	PIN_MUX_EH(135, 1),
> +	PIN_MUX_EH(136, 1),
> +	PIN_MUX_EH(137, 1),
> +	PIN_MUX_EH(138, 1),
> +	PIN_MUX_EH(139, 1),
> +	PIN_MUX_EH(140, 1),
> +	PIN_MUX_EH(141, 1),
> +	PIN_MUX_EH(142, 1),
> +	PIN_MUX_EH(143, 1),
> +	PIN_MUX_EH(144, 1),
> +	PIN_MUX_EH(145, 1),
> +	PIN_MUX_EH(146, 1),
> +	PIN_MUX_EH(147, 1),
> +	PIN_MUX_EH(148, 1),
> +	PIN_MUX_EH(149, 6),
> +	PIN_MUX_EH(150, 6),
> +};
> +
> +static const char * const mt6878_pinctrl_register_base_names[] = {
> +	"gpio", "iocfg_bl", "iocfg_bm", "iocfg_br",
> +	"iocfg_bl1", "iocfg_br1", "iocfg_lm", "iocfg_lt",
> +	"iocfg_rm", "iocfg_rt",
> +};
> +
> +static const struct mtk_eint_hw mt6878_eint_hw = {
> +	.port_mask = 31,
> +	.ports     = 1,
> +	.ap_num    = 216,
> +	.db_cnt    = 36,
> +	.db_time   = debounce_time_mt6878,
> +};
> +
> +static const struct mtk_pin_reg_calc mt6878_reg_cals[PINCTRL_PIN_REG_MAX] = {
> +	[PINCTRL_PIN_REG_MODE] = MTK_RANGE(mt6878_pin_mode_range),
> +	[PINCTRL_PIN_REG_DIR] = MTK_RANGE(mt6878_pin_dir_range),
> +	[PINCTRL_PIN_REG_DI] = MTK_RANGE(mt6878_pin_di_range),
> +	[PINCTRL_PIN_REG_DO] = MTK_RANGE(mt6878_pin_do_range),
> +	[PINCTRL_PIN_REG_SR] = MTK_RANGE(mt6878_pin_dir_range),
> +	[PINCTRL_PIN_REG_SMT] = MTK_RANGE(mt6878_pin_smt_range),
> +	[PINCTRL_PIN_REG_IES] = MTK_RANGE(mt6878_pin_ies_range),
> +	[PINCTRL_PIN_REG_PU] = MTK_RANGE(mt6878_pin_pu_range),
> +	[PINCTRL_PIN_REG_PD] = MTK_RANGE(mt6878_pin_pd_range),
> +	[PINCTRL_PIN_REG_DRV] = MTK_RANGE(mt6878_pin_drv_range),
> +	[PINCTRL_PIN_REG_PUPD] = MTK_RANGE(mt6878_pin_pupd_range),
> +	[PINCTRL_PIN_REG_R0] = MTK_RANGE(mt6878_pin_r0_range),
> +	[PINCTRL_PIN_REG_R1] = MTK_RANGE(mt6878_pin_r1_range),
> +	[PINCTRL_PIN_REG_DRV_EH] = MTK_RANGE(mt6878_pin_eh_range),

[PINCTRL_PIN_REG_DRV_ADV] = MTK_RANGE(mt6878_pin_drv_adv_range),

> +	[PINCTRL_PIN_REG_RSEL] = MTK_RANGE(mt6878_pin_rsel_range),
> +};
> +
> +static const struct mtk_pin_soc mt6878_data = {
> +	.reg_cal = mt6878_reg_cals,
> +	.pins = mtk_pins_mt6878,
> +	.npins = ARRAY_SIZE(mtk_pins_mt6878),
> +	.ngrps = ARRAY_SIZE(mtk_pins_mt6878),
> +	.eint_pin = eint_pins_mt6878,
> +	.eint_hw = &mt6878_eint_hw,
> +	.nfuncs = 8,
> +	.gpio_m = 0,
> +	.base_names = mt6878_pinctrl_register_base_names,
> +	.nbase_names = ARRAY_SIZE(mt6878_pinctrl_register_base_names),
> +	.bias_set_combo = mtk_pinconf_bias_set_combo,
> +	.bias_get_combo = mtk_pinconf_bias_get_combo,
> +	.pull_type = mt6878_pull_type,

vvvvvvvvvvvvvvvvvvvvvvvvvv

> +	.eh_pin_pinmux = mt6878_eh_pin_pinmux_list,
> +	.neh_pins = ARRAY_SIZE(mt6878_eh_pin_pinmux_list),

...and this can be removed as well.

> +	.adv_drive_get = mtk_pinconf_adv_drive_get,
> +	.adv_drive_set = mtk_pinconf_adv_drive_set,
> +};

Cheers,
Angelo


