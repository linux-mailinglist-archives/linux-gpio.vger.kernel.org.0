Return-Path: <linux-gpio+bounces-39949-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id IqJhCFSbVGrCoAMAu9opvQ
	(envelope-from <linux-gpio+bounces-39949-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 10:01:24 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E580874875C
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 10:01:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=collabora.com header.s=mail header.b=Q538i5cP;
	dmarc=pass (policy=none) header.from=collabora.com;
	spf=pass (mail.lfdr.de: domain of "linux-gpio+bounces-39949-lists+linux-gpio=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-gpio+bounces-39949-lists+linux-gpio=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 60ED5300681A
	for <lists+linux-gpio@lfdr.de>; Mon, 13 Jul 2026 08:01:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5F9F33A4523;
	Mon, 13 Jul 2026 08:01:17 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 928AF33FE0A;
	Mon, 13 Jul 2026 08:01:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783929677; cv=none; b=hj8p2qf2mGdawBI6dSUtR8w5NljGNF902NLnAN/Fbw1Yg3wG0XXasyxI7N1xiVfUla7vOlOYEg2sLQn4mAgnFvg9L3KElSqoAtATOCjAFPdtV/iog1QNDY6QxhKQ3HIZ/7iq5UYU8pthNqox4lTmbevA+CIehyJYL6dSLFWY2R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783929677; c=relaxed/simple;
	bh=boNSAPHabbNMFLaiiOKh1JEp4/UvbPj3aYE4dAGKnec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AjbNrnC4ba1n9UPogsBC904kiVzqFyAYQgFeDHgS2f59/wqytC6uCHoG5+09panVBmqnBLrrZ0gYlU556ik8kF0c9jmgwqgAn/+GDEWmytRbKUHGx6dUeUcLxoXbZMkwWCMjdJw4e5+YZJbUIOGvf5V/s7l6DHGA1cUSWIV2KG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Q538i5cP; arc=none smtp.client-ip=148.251.105.195
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783929673;
	bh=boNSAPHabbNMFLaiiOKh1JEp4/UvbPj3aYE4dAGKnec=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q538i5cPbR+VD5oXM9u2/HO4AYtcZbmWXBWp2sJP5DYFBOSs1c+RrY7rGas1U62E2
	 19IIHLUCTX8j383cf49dCNpXO2Wtcn4EJVBz+kXwIoxfY9+OdAbK5hWINPUGOvoI3e
	 epL1LuZ0xzTaMlUej9MhdY//HuKv8eI6rzPvPwnIUekhywc8pabFr/5eKKzM7DK4va
	 1ifDhoeFyP2qTb6jfPGLMD1t3XDuUqRPfe6ayK4idDeXNKEQFjzxjg6J8Qb2ouz8Kl
	 8kywXXpZbUGAS9jqzVsJHKET8vqVQBJ6lrQL9TUXAWAEzNRgzHkFX9FpEZq+yePQCk
	 wlIeQnkC2e01w==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B31E717E0076;
	Mon, 13 Jul 2026 10:01:12 +0200 (CEST)
Message-ID: <89e4eb3d-a61c-410e-8ad5-e845b07f8029@collabora.com>
Date: Mon, 13 Jul 2026 10:01:12 +0200
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] pinctrl: mediatek: Add driver for MT6858
To: nikolai.burov@jolla.com, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Nikolai Burov <nikolai.burov+review@abscue.de>
References: <20260710-mt6858-pinctrl-v1-0-f75ab558f0df@jolla.com>
 <20260710-mt6858-pinctrl-v1-2-f75ab558f0df@jolla.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260710-mt6858-pinctrl-v1-2-f75ab558f0df@jolla.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:nikolai.burov@jolla.com,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:matthias.bgg@gmail.com,m:sean.wang@kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-mediatek@lists.infradead.org,m:nikolai.burov+review@abscue.de,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,m:nikolai.burov@abscue.de,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[jolla.com,kernel.org,gmail.com];
	RSPAMD_URIBL_FAIL(0.00)[jolla.com:query timed out];
	FORGED_SENDER(0.00)[angelogioacchino.delregno@collabora.com,linux-gpio@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-39949-lists,linux-gpio=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[angelogioacchino.delregno@collabora.com,linux-gpio@vger.kernel.org];
	DKIM_TRACE(0.00)[collabora.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-gpio,dt,review];
	RSPAMD_EMAILBL_FAIL(0.00)[linux-gpio@vger.kernel.org:query timed out,angelogioacchino.delregno@collabora.com:query timed out];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,collabora.com:from_mime,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E580874875C

On 7/10/26 17:00, Nikolai Burov via B4 Relay wrote:
> From: Nikolai Burov <nikolai.burov@jolla.com>
> 
> Add a pinctrl driver for the MT6858 (MediaTek Dimensity 7100) SoC.
> 
> Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>

Thanks for the patch!

However, there are a few things to improve; check below.

> ---
>   drivers/pinctrl/mediatek/Kconfig              |   10 +
>   drivers/pinctrl/mediatek/Makefile             |    1 +
>   drivers/pinctrl/mediatek/pinctrl-mt6858.c     | 1408 +++++++++++++++
>   drivers/pinctrl/mediatek/pinctrl-mtk-mt6858.h | 2301 +++++++++++++++++++++++++
>   4 files changed, 3720 insertions(+)
> 
> diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
> index 97980cc28b9c..95c5250150d7 100644
> --- a/drivers/pinctrl/mediatek/Kconfig
> +++ b/drivers/pinctrl/mediatek/Kconfig
> @@ -166,6 +166,16 @@ config PINCTRL_MT6797
>   	default ARM64 && ARCH_MEDIATEK
>   	select PINCTRL_MTK_PARIS
>   
> +config PINCTRL_MT6858
> +	bool "MediaTek MT6858 pin control"
> +	depends on OF
> +	depends on ARM64 || COMPILE_TEST
> +	default ARM64 && ARCH_MEDIATEK
> +	select PINCTRL_MTK_PARIS
> +	help
> +	  Say yes here to support pin controller and gpio driver
> +	  on the MediaTek MT6858 SoC.
> +
>   config PINCTRL_MT6878
>   	bool "MediaTek MT6878 pin control"
>   	depends on OF
> diff --git a/drivers/pinctrl/mediatek/Makefile b/drivers/pinctrl/mediatek/Makefile
> index 6dc17b0c23f9..6ee3833dc6e2 100644
> --- a/drivers/pinctrl/mediatek/Makefile
> +++ b/drivers/pinctrl/mediatek/Makefile
> @@ -22,6 +22,7 @@ obj-$(CONFIG_PINCTRL_MT6765)		+= pinctrl-mt6765.o
>   obj-$(CONFIG_PINCTRL_MT6779)		+= pinctrl-mt6779.o
>   obj-$(CONFIG_PINCTRL_MT6795)		+= pinctrl-mt6795.o
>   obj-$(CONFIG_PINCTRL_MT6797)		+= pinctrl-mt6797.o
> +obj-$(CONFIG_PINCTRL_MT6858)		+= pinctrl-mt6858.o
>   obj-$(CONFIG_PINCTRL_MT6878)		+= pinctrl-mt6878.o
>   obj-$(CONFIG_PINCTRL_MT6893)		+= pinctrl-mt6893.o
>   obj-$(CONFIG_PINCTRL_MT7622)		+= pinctrl-mt7622.o
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6858.c b/drivers/pinctrl/mediatek/pinctrl-mt6858.c
> new file mode 100644
> index 000000000000..eeb4a6bbc0fe
> --- /dev/null
> +++ b/drivers/pinctrl/mediatek/pinctrl-mt6858.c
> @@ -0,0 +1,1408 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + *               Alice Chao <alice.chao@mediatek.com>
> + * Copyright (c) 2026 Jolla Mobile Ltd
> + *               Nikolai Burov <nikolai.burov@jolla.com>
> + */
> +
> +#include <linux/module.h>
> +#include "pinctrl-mtk-mt6858.h"
> +#include "pinctrl-paris.h"
> +

..snip..

> +static const struct mtk_pin_reg_calc mt6858_reg_cals[PINCTRL_PIN_REG_MAX] = {
> +	[PINCTRL_PIN_REG_MODE] = MTK_RANGE(mt6858_pin_mode_range),
> +	[PINCTRL_PIN_REG_DIR] = MTK_RANGE(mt6858_pin_dir_range),
> +	[PINCTRL_PIN_REG_DI] = MTK_RANGE(mt6858_pin_di_range),
> +	[PINCTRL_PIN_REG_DO] = MTK_RANGE(mt6858_pin_do_range),
> +	[PINCTRL_PIN_REG_SR] = MTK_RANGE(mt6858_pin_dir_range),

This is Slew Rate, not Direction... And I think this is wrong.

If you don't know where the slew rate registers are, or if that is an unsupported
operation, just omit PINCTRL_PIN_REG_SR.

> +	[PINCTRL_PIN_REG_SMT] = MTK_RANGE(mt6858_pin_smt_range),
> +	[PINCTRL_PIN_REG_IES] = MTK_RANGE(mt6858_pin_ies_range),
> +	[PINCTRL_PIN_REG_PU] = MTK_RANGE(mt6858_pin_pu_range),
> +	[PINCTRL_PIN_REG_PD] = MTK_RANGE(mt6858_pin_pd_range),
> +	[PINCTRL_PIN_REG_DRV] = MTK_RANGE(mt6858_pin_drv_range),
> +	[PINCTRL_PIN_REG_PUPD] = MTK_RANGE(mt6858_pin_pupd_range),
> +	[PINCTRL_PIN_REG_R0] = MTK_RANGE(mt6858_pin_r0_range),
> +	[PINCTRL_PIN_REG_R1] = MTK_RANGE(mt6858_pin_r1_range),
> +	[PINCTRL_PIN_REG_DRV_ADV] = MTK_RANGE(mt6858_pin_drv_adv_range),
> +	[PINCTRL_PIN_REG_RSEL] = MTK_RANGE(mt6858_pin_rsel_range),
> +};
> +
> +static const char * const mt6858_pinctrl_register_base_names[] = {
> +	"base", "lm", "rb", "bm2", "bm", "bm1", "lt", "lt1", "rt", "rt1",

Fix ordering:

"base", "lm", "rb", "bm", "bm1", "bm2", "lt", "lt1", "rt", "rt1",

> +};
> +
> +static const struct mtk_eint_hw mt6858_eint_hw = {
> +	.port_mask = 0xf,
> +	.ports     = 3,
> +	.ap_num    = 217,
> +	.db_cnt    = 36,
> +	.db_time   = debounce_time_mt6878,
> +};
> +
> +static const struct mtk_pin_soc mt6858_data = {
> +	.reg_cal = mt6858_reg_cals,
> +	.pins = mtk_pins_mt6858,
> +	.npins = ARRAY_SIZE(mtk_pins_mt6858),
> +	.ngrps = ARRAY_SIZE(mtk_pins_mt6858),
> +	.eint_hw = &mt6858_eint_hw,
> +	.eint_pin = eint_pins_mt6858,
> +	.nfuncs = 16,
> +	.gpio_m = 0,
> +	.base_names = mt6858_pinctrl_register_base_names,
> +	.nbase_names = ARRAY_SIZE(mt6858_pinctrl_register_base_names),
> +	.pull_type = mt6858_pull_type,
> +	.bias_set_combo = mtk_pinconf_bias_set_combo,
> +	.bias_get_combo = mtk_pinconf_bias_get_combo,
> +	.drive_set = mtk_pinconf_drive_set_rev1,
> +	.drive_get = mtk_pinconf_drive_get_rev1,
> +	.adv_drive_get = mtk_pinconf_adv_drive_get_raw,
> +	.adv_drive_set = mtk_pinconf_adv_drive_set_raw,
> +};
> +
> +static const struct of_device_id mt6858_pinctrl_of_match[] = {
> +	{ .compatible = "mediatek,mt6858-pinctrl", .data = &mt6858_data },
> +	{ }

	{ /* sentinel */ }

> +};
> +
> +static struct platform_driver mt6858_pinctrl_driver = {
> +	.driver = {
> +		.name = "mt6858-pinctrl",
> +		.of_match_table = mt6858_pinctrl_of_match,
> +		.pm = &mtk_paris_pinctrl_pm_ops,

.pm = pm_sleep_ptr(&mtk_paris_pinctrl_pm_ops),

> +	},
> +	.probe = mtk_paris_pinctrl_probe,
> +};
> +
> +static int __init mt6858_pinctrl_init(void)
> +{
> +	return platform_driver_register(&mt6858_pinctrl_driver);
> +}
> +arch_initcall(mt6858_pinctrl_init);
> +
> +MODULE_DESCRIPTION("MediaTek MT6858 Pinctrl Driver");
> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt6858.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt6858.h
> new file mode 100644
> index 000000000000..f6d2ae2fd07e
> --- /dev/null
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt6858.h
> @@ -0,0 +1,2301 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + *               Alice Chao <alice.chao@mediatek.com>
> + * Copyright (c) 2026 Jolla Mobile Ltd
> + *               Nikolai Burov <nikolai.burov@jolla.com>
> + */
> +
> +#ifndef __PINCTRL_MTK_MT6858_H
> +#define __PINCTRL_MTK_MT6858_H
> +
> +#include "pinctrl-paris.h"
> +
> +#define MTK_PIN_VEINT(_number)			\
> +	MTK_PIN(				\
> +		_number, "veint" #_number,	\
> +		MTK_EINT_FUNCTION(0, _number),	\
> +		DRV_GRP4,			\
> +		MTK_FUNCTION(0, NULL)		\
> +	)
> +
> +static const struct mtk_pin_desc mtk_pins_mt6858[] = {

..snip..

> +
> +static struct mtk_eint_pin eint_pins_mt6858[] = {

..snip..

> +	MTK_EINT_PIN(119, 0, 72, 0),
> +	MTK_EINT_PIN(120, 0, 73, 0),
> +	MTK_EINT_PIN(121, 0, 74, 0),

Looks like you're missing ~70 pins here?

If those have no EINT support, you can declare them as

	MTK_EINT_PIN(122, EINT_INVALID_BASE, 0, 0),

...or you can add a macro to add a (sequential) range of pins with no EINT support.

Cheers,
Angelo

> +	MTK_EINT_PIN(197, 3, 0, 0),
> +	MTK_EINT_PIN(198, 3, 1, 0),
> +	MTK_EINT_PIN(199, 3, 2, 0),
> +	MTK_EINT_PIN(200, 3, 3, 0),
> +	MTK_EINT_PIN(201, 3, 4, 0),
> +	MTK_EINT_PIN(202, 3, 5, 0),
> +	MTK_EINT_PIN(203, 3, 6, 0),
> +	MTK_EINT_PIN(204, 3, 7, 0),
> +	MTK_EINT_PIN(205, 3, 8, 0),
> +	MTK_EINT_PIN(206, 3, 9, 0),
> +	MTK_EINT_PIN(207, 3, 10, 0),
> +	MTK_EINT_PIN(208, 3, 11, 0),
> +	MTK_EINT_PIN(209, 3, 12, 0),
> +	MTK_EINT_PIN(210, 3, 13, 0),
> +	MTK_EINT_PIN(211, 3, 14, 0),
> +	MTK_EINT_PIN(212, 3, 15, 0),
> +	MTK_EINT_PIN(213, 3, 16, 0),
> +	MTK_EINT_PIN(214, 3, 17, 0),
> +	MTK_EINT_PIN(215, 3, 18, 0),
> +	MTK_EINT_PIN(216, 3, 19, 0),
> +};
> +
> +#endif /* __PINCTRL_MTK_MT6858_H */
> 


