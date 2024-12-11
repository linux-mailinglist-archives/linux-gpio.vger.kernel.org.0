Return-Path: <linux-gpio+bounces-13744-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C90D99EC621
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 08:56:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 841BD28212D
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 07:56:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D11CD1CACF3;
	Wed, 11 Dec 2024 07:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WCegzRnH"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B2FB1C6F59;
	Wed, 11 Dec 2024 07:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733903801; cv=none; b=XlJNaoruF2hb6GvQu3veV1Iyn5EEBHS/RF9A5w7vDm8IlmH3XkK7wRSUvoNtgiH2bEKeqn+UQkRP/C5G/1aEJJtR3ZuerhB8Tdlh+0iS+wT+LZQSOOJWv/PrFISUrhzfHAW9eyS+XzzjQqOqZaI3oScpYmvGa3bvGGJVQY6UsK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733903801; c=relaxed/simple;
	bh=J60Zu7bSnYFHO396Do1QTQrSrzlbTFrIHnigijT//ME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BwvrsP0B367GD/2McXNORqKqjpRC+CUyfGw2/6cc3/H+8rLsXauAw8+PSnkS86ITs7KcHDoHK9Ef9SLqRABfDs/4D5eD3Bk4VhPl1rdhSS1B4aiPksv02vsfIG//mgV5+y84ffd2o44beQ/SRGPrFodY7riMnnoVP+zLv3RfdIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WCegzRnH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AAC2C4CED2;
	Wed, 11 Dec 2024 07:56:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733903801;
	bh=J60Zu7bSnYFHO396Do1QTQrSrzlbTFrIHnigijT//ME=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WCegzRnHTjGCRzENBnoUrTn1D3xtBB8zWbAOFj8xU0K5aplTLIf+vYK6n6DE3Uhxh
	 1+YVIn5B6FuHj8NKHXB5EK3IHMawOqf/WNo3rC+fhLWiUlWOYYykfy4QxXCIokbDoy
	 77UchrBvT6xF5b67Is1eLu0KnuuMXQESCEUbX2dcuWhfYEPLCoVEkjVDVl4PjJLuK4
	 YUqNxUuG+uT0PA2c51j0SN5YEWJtnCfa+DqEHxC2l+0IL3g8JF7kOlqiVyrw2KrT/V
	 JNo0Fxu50xApzam6rORxDSTXlz97J0f2Ckz79wtEBcjHkdKDrak846Gq7xTkGW7pfn
	 eQRckg4w+wIQA==
Message-ID: <2a773ddb-2836-40cf-a08b-ac47430aeb78@kernel.org>
Date: Wed, 11 Dec 2024 08:56:34 +0100
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: mediatek: Add support for MT8196
To: ot907280 <ot_cathy.xu@mediatek.com>, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sean.wang@kernel.org,
 linus.walleij@linaro.org
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>,
 Guodong Liu <guodong.liu@mediatek.com>
References: <20241211055454.17120-3-ot_cathy.xu@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241211055454.17120-3-ot_cathy.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/12/2024 06:54, ot907280 wrote:
> From: Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>
> 
> Add pinctrl driver for mt8196
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> Signed-off-by: ot907280 <ot_cathy.xu@mediatek.com>


Please use real names, not logins.

<form letter>
Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC. It might happen, that command when run on an older
kernel, gives you outdated entries. Therefore please be sure you base
your patches on recent Linux kernel.

Tools like b4 or scripts/get_maintainer.pl provide you proper list of
people, so fix your workflow. Tools might also fail if you work on some
ancient tree (don't, instead use mainline) or work on fork of kernel
(don't, instead use mainline). Just use b4 and everything should be
fine, although remember about `b4 prep --auto-to-cc` if you added new
patches to the patchset.

You missed at least devicetree list (maybe more), so this won't be
tested by automated tooling. Performing review on untested code might be
a waste of time.

Please kindly resend and include all necessary To/Cc entries.
</form letter>


> ---
>  drivers/pinctrl/mediatek/Kconfig              |   12 +
>  drivers/pinctrl/mediatek/Makefile             |    1 +
>  drivers/pinctrl/mediatek/pinctrl-mt8196.c     | 1757 +++++++++++
>  drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h | 2791 +++++++++++++++++
>  include/dt-bindings/pinctrl/mt8196-pinfunc.h  | 1572 ++++++++++
>  5 files changed, 6133 insertions(+)
>  create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt8196.c
>  create mode 100644 drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h
>  create mode 100644 include/dt-bindings/pinctrl/mt8196-pinfunc.h

Please run scripts/checkpatch.pl and fix reported warnings. Then please
run `scripts/checkpatch.pl --strict` and (probably) fix more warnings.
Some warnings can be ignored, especially from --strict run, but the code
here looks like it needs a fix. Feel free to get in touch if the warning
is not clear.



> +static const char * const mt8196_pinctrl_register_base_names[] = {
> +	"iocfg0", "iocfg_rt", "iocfg_rm1", "iocfg_rm2",
> +	"iocfg_rb", "iocfg_bm1", "iocfg_bm2", "iocfg_bm3",
> +	"iocfg_lt", "iocfg_lm1", "iocfg_lm2", "iocfg_lb1",
> +	"iocfg_lb2", "iocfg_tm1", "iocfg_tm2", "iocfg_tm3",
> +};
> +
> +static const struct mtk_pin_soc mt8196_data = {
> +	.reg_cal	= mt8196_reg_cals,
> +	.pins	= mtk_pins_mt8196,
> +	.npins	= ARRAY_SIZE(mtk_pins_mt8196),
> +	.ngrps	= ARRAY_SIZE(mtk_pins_mt8196),
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


Please run scripts/checkpatch.pl and fix reported warnings. Then please
run `scripts/checkpatch.pl --strict` and (probably) fix more warnings.
Some warnings can be ignored, especially from --strict run, but the code
here looks like it needs a fix. Feel free to get in touch if the warning
is not clear.

> +	{ }
> +};
> +
> +static struct platform_driver mt8196_pinctrl_driver = {
> +	.driver = {
> +		.name = "mt8196-pinctrl",
> +		.of_match_table = mt8196_pinctrl_of_match,
> +		.pm = &mtk_paris_pinctrl_pm_ops,
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
> +MODULE_LICENSE("GPL");


...

> +#endif /* __PINCTRL_MTK_MT8196_H */
> diff --git a/include/dt-bindings/pinctrl/mt8196-pinfunc.h b/include/dt-bindings/pinctrl/mt8196-pinfunc.h
> new file mode 100644
> index 000000000000..717351b12255
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/mt8196-pinfunc.h
> @@ -0,0 +1,1572 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Copyright (C) 2024 Mediatek Inc.
> + * Author: Guodong Liu <Guodong.Liu@mediatek.com>
> + */
> +
> +#ifndef __MT8196_PINFUNC_H
> +#define __MT8196_PINFUNC_H
> +
> +#include <dt-bindings/pinctrl/mt65xx.h>
> +
> +#define PINMUX_GPIO0__FUNC_GPIO0 (MTK_PIN_NO(0) | 0)
> +#define PINMUX_GPIO0__FUNC_DMIC1_CLK (MTK_PIN_NO(0) | 1)
> +#define PINMUX_GPIO0__FUNC_SPI3_A_MO (MTK_PIN_NO(0) | 3)
> +#define PINMUX_GPIO0__FUNC_FMI2S_B_LRCK (MTK_PIN_NO(0) | 4)
> +#define PINMUX_GPIO0__FUNC_SCP_DMIC1_CLK (MTK_PIN_NO(0) | 5)
> +#define PINMUX_GPIO0__FUNC_TP_GPIO14_AO (MTK_PIN_NO(0) | 6)


These aren't really bindings. If you disagree, point me to the usage in
the driver.



Best regards,
Krzysztof

