Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CCD01337BB
	for <lists+linux-gpio@lfdr.de>; Wed,  8 Jan 2020 00:52:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727134AbgAGXwC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jan 2020 18:52:02 -0500
Received: from mail-lf1-f66.google.com ([209.85.167.66]:43336 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727091AbgAGXwC (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 18:52:02 -0500
Received: by mail-lf1-f66.google.com with SMTP id 9so1024733lfq.10
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 15:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=he0D2W1ydjsWVzB7tv2sGhN1kd69y35QXDm3LVmjQ8Q=;
        b=maqxRz5Vfu2Rqu5nCsCVAHLHwE/A1KMfqJAgUQPK48IJ/PNEe+VRub8Vj5SbW1KqaG
         BbK1lrrDTnnHSL4siX5i6I8ylYJXwLBNN/ShbSAJVtDUKNvp/cRFam/c44lkp09mopSD
         e+bHO6ti5OqN9q5chm49BBa349ZUIBWLTKZRLatx3ZAFF61zNUCO6JRv2elSNcB4JcRp
         vU1iNEOwyH4F8S9De219vHYB5fBKaxdLZAALFxG2tIbcvmQgQVeR0fLdOljvOLR0sCp0
         9ytgZynXN2bKFUE9ogix5BhUcPWrZQ7uvV1AwGnkfPsmELbPRahRPduHZ0q5yB1ExspR
         iOWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=he0D2W1ydjsWVzB7tv2sGhN1kd69y35QXDm3LVmjQ8Q=;
        b=cM2zW4s4AIPkmzdw+eTZ8sDpsZNp3G/NXnUpze2J8hD7tNCvi5p+RPByphZ0CxsUGC
         5wCrukKzs4gYgbeswGw7i8z51dmTTPNTTxORv2HwOixPv3pYDNwDAUSNJxwN6KhKEVW2
         VR7vaaxVNkJoCGzyxKkJTbzgg3Y/sAYR0u0MQYC1MA3IP5sFVJSmCmAmXwoOGi3lTZ2f
         nmhR8YVimc66Rul4m71KDMUG3Emg9sOxhKhkjZ4n6GRVqJJ5/IaDgRvEEW++VCm84QQ3
         9Kss4QdQu1dk2HHpCFjO5QFvpgwPcRUiVGQbOcfdFOPp2Ydwjl/1LH7bZBgcLa6J09+s
         2Ulg==
X-Gm-Message-State: APjAAAWYaegdtMqNu2nZiVua0+H913+t/YJ32ZJvF0Xh4TSd9pm22wbQ
        corbJJlZLxAg9Nj1CN7tblaeYw==
X-Google-Smtp-Source: APXvYqxb3R40Pxt6Z1JVoqswszZ8HgYDOsJH4BjMbtk2ScMJo4lRbViRrnmc8V1yfENPGK7Y6GiAdw==
X-Received: by 2002:ac2:44a3:: with SMTP id c3mr1135700lfm.1.1578441119345;
        Tue, 07 Jan 2020 15:51:59 -0800 (PST)
Received: from localhost (h-93-159.A463.priv.bahnhof.se. [46.59.93.159])
        by smtp.gmail.com with ESMTPSA id u3sm482003lfm.37.2020.01.07.15.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2020 15:51:58 -0800 (PST)
Date:   Wed, 8 Jan 2020 00:51:57 +0100
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2] pinctrl: sh-pfc: Split R-Car H3 support in two
 independent drivers
Message-ID: <20200107235157.GT533370@oden.dyn.berto.se>
References: <20191230083156.19191-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191230083156.19191-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Geert,

Thanks for your patch.

On 2019-12-30 09:31:56 +0100, Geert Uytterhoeven wrote:
> Despite using the same compatible values ("r8a7795"-based) because of
> historical reasons, R-Car H3 ES1.x (R8A77950) and R-Car H3 ES2.0+
> (R8A77951) are really different SoCs, with different part numbers, and
> with different Pin Function Controller blocks.
> 
> Reflect this in the pinctrl configuration, by replacing the existing
> CONFIG_PINCTRL_PFC_R8A7795 symbol by two new config symbols:
> CONFIG_PINCTRL_PFC_R8A77950 and CONFIG_PINCTRL_PFC_R8A77951.  The latter
> are selected automatically, depending on the soon-to-be-introduced
> corresponding SoC-specific config options, and on the current common
> config option, to relax dependencies.
> 
> Rename the individual pin control driver source files from
> pfc-r8a7795-es1.c to pfc-r8a77950.c, and from pfc-r8a7795.c to
> pfc-r8a77951.c, and make them truly independent.
> As both SoCs share the same compatible value, special care must be taken
> to match them to the correct pin control driver, if support for it is
> included in the running kernel.
> 
> This will allow making support for early R-Car H3 revisions optional,
> the largest share of which is taken by the pin control driver.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Tested-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in sh-pfc-for-v5.6.
> 
> This complements, but has no dependencies on "[PATCH 0/5] arm64:
> renesas: Split/rename R-Car H3 support"
> https://lore.kernel.org/linux-renesas-soc/20191217183841.432-1-geert+renesas@glider.be
> 
> v2:
>   - Add Reviewed-by, Tested-by,
>   - Reduce #ifdef clutter by marking r8a7795[01]_pinmux_info __weak, at
>     the expense of adding an extra runtime check, increasing kernel size
>     by 8 bytes.
> ---
>  drivers/pinctrl/sh-pfc/Kconfig                | 10 +++-
>  drivers/pinctrl/sh-pfc/Makefile               |  4 +-
>  drivers/pinctrl/sh-pfc/core.c                 | 57 ++++++++++++++-----
>  .../{pfc-r8a7795-es1.c => pfc-r8a77950.c}     | 26 ++++-----
>  .../sh-pfc/{pfc-r8a7795.c => pfc-r8a77951.c}  | 39 +++++--------
>  drivers/pinctrl/sh-pfc/sh_pfc.h               |  4 +-
>  6 files changed, 81 insertions(+), 59 deletions(-)
>  rename drivers/pinctrl/sh-pfc/{pfc-r8a7795-es1.c => pfc-r8a77950.c} (99%)
>  rename drivers/pinctrl/sh-pfc/{pfc-r8a7795.c => pfc-r8a77951.c} (99%)
> 
> diff --git a/drivers/pinctrl/sh-pfc/Kconfig b/drivers/pinctrl/sh-pfc/Kconfig
> index ecf3b045bf755008..cf0e0dc42b84c06f 100644
> --- a/drivers/pinctrl/sh-pfc/Kconfig
> +++ b/drivers/pinctrl/sh-pfc/Kconfig
> @@ -26,7 +26,8 @@ config PINCTRL_SH_PFC
>  	select PINCTRL_PFC_R8A7792 if ARCH_R8A7792
>  	select PINCTRL_PFC_R8A7793 if ARCH_R8A7793
>  	select PINCTRL_PFC_R8A7794 if ARCH_R8A7794
> -	select PINCTRL_PFC_R8A7795 if ARCH_R8A7795
> +	select PINCTRL_PFC_R8A77950 if ARCH_R8A77950 || ARCH_R8A7795
> +	select PINCTRL_PFC_R8A77951 if ARCH_R8A77951 || ARCH_R8A7795
>  	select PINCTRL_PFC_R8A77960 if ARCH_R8A77960
>  	select PINCTRL_PFC_R8A77961 if ARCH_R8A77961
>  	select PINCTRL_PFC_R8A77965 if ARCH_R8A77965
> @@ -115,8 +116,11 @@ config PINCTRL_PFC_R8A7793
>  config PINCTRL_PFC_R8A7794
>  	bool "R-Car E2 pin control support" if COMPILE_TEST
>  
> -config PINCTRL_PFC_R8A7795
> -	bool "R-Car H3 pin control support" if COMPILE_TEST
> +config PINCTRL_PFC_R8A77950
> +	bool "R-Car H3 ES1.x pin control support" if COMPILE_TEST
> +
> +config PINCTRL_PFC_R8A77951
> +	bool "R-Car H3 ES2.0+ pin control support" if COMPILE_TEST
>  
>  config PINCTRL_PFC_R8A77960
>  	bool "R-Car M3-W pin control support" if COMPILE_TEST
> diff --git a/drivers/pinctrl/sh-pfc/Makefile b/drivers/pinctrl/sh-pfc/Makefile
> index 3bc05666e1a6652e..9ebe321d24c488b0 100644
> --- a/drivers/pinctrl/sh-pfc/Makefile
> +++ b/drivers/pinctrl/sh-pfc/Makefile
> @@ -18,8 +18,8 @@ obj-$(CONFIG_PINCTRL_PFC_R8A7791)	+= pfc-r8a7791.o
>  obj-$(CONFIG_PINCTRL_PFC_R8A7792)	+= pfc-r8a7792.o
>  obj-$(CONFIG_PINCTRL_PFC_R8A7793)	+= pfc-r8a7791.o
>  obj-$(CONFIG_PINCTRL_PFC_R8A7794)	+= pfc-r8a7794.o
> -obj-$(CONFIG_PINCTRL_PFC_R8A7795)	+= pfc-r8a7795.o
> -obj-$(CONFIG_PINCTRL_PFC_R8A7795)	+= pfc-r8a7795-es1.o
> +obj-$(CONFIG_PINCTRL_PFC_R8A77950)	+= pfc-r8a77950.o
> +obj-$(CONFIG_PINCTRL_PFC_R8A77951)	+= pfc-r8a77951.o
>  obj-$(CONFIG_PINCTRL_PFC_R8A77960)	+= pfc-r8a7796.o
>  obj-$(CONFIG_PINCTRL_PFC_R8A77961)	+= pfc-r8a7796.o
>  obj-$(CONFIG_PINCTRL_PFC_R8A77965)	+= pfc-r8a77965.o
> diff --git a/drivers/pinctrl/sh-pfc/core.c b/drivers/pinctrl/sh-pfc/core.c
> index 65e52688f0916cbf..82209116955b153a 100644
> --- a/drivers/pinctrl/sh-pfc/core.c
> +++ b/drivers/pinctrl/sh-pfc/core.c
> @@ -23,6 +23,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/psci.h>
>  #include <linux/slab.h>
> +#include <linux/sys_soc.h>
>  
>  #include "core.h"
>  
> @@ -568,18 +569,18 @@ static const struct of_device_id sh_pfc_of_table[] = {
>  		.data = &r8a7794_pinmux_info,
>  	},
>  #endif
> -#ifdef CONFIG_PINCTRL_PFC_R8A7795
> +/* Both r8a7795 entries must be present to make sanity checks work */
> +#ifdef CONFIG_PINCTRL_PFC_R8A77950
>  	{
>  		.compatible = "renesas,pfc-r8a7795",
> -		.data = &r8a7795_pinmux_info,
> +		.data = &r8a77950_pinmux_info,
>  	},
> -#ifdef DEBUG
> +#endif
> +#ifdef CONFIG_PINCTRL_PFC_R8A77951
>  	{
> -		/* For sanity checks only (nothing matches against this) */
> -		.compatible = "renesas,pfc-r8a77950",	/* R-Car H3 ES1.0 */
> -		.data = &r8a7795es1_pinmux_info,
> +		.compatible = "renesas,pfc-r8a7795",
> +		.data = &r8a77951_pinmux_info,
>  	},
> -#endif /* DEBUG */
>  #endif
>  #ifdef CONFIG_PINCTRL_PFC_R8A77960
>  	{
> @@ -886,19 +887,49 @@ static void __init sh_pfc_check_driver(const struct platform_driver *pdrv)
>  static inline void sh_pfc_check_driver(struct platform_driver *pdrv) {}
>  #endif /* !DEBUG */
>  
> +#ifdef CONFIG_OF
> +static const void *sh_pfc_quirk_match(void)
> +{
> +#if defined(CONFIG_PINCTRL_PFC_R8A77950) || \
> +    defined(CONFIG_PINCTRL_PFC_R8A77951)
> +	const struct soc_device_attribute *match;
> +	static const struct soc_device_attribute quirks[] = {
> +		{
> +			.soc_id = "r8a7795", .revision = "ES1.*",
> +			.data = &r8a77950_pinmux_info,
> +		},
> +		{
> +			.soc_id = "r8a7795",
> +			.data = &r8a77951_pinmux_info,
> +		},
> +
> +		{ /* sentinel */ }
> +	};
> +
> +	match = soc_device_match(quirks);
> +	if (match)
> +		return match->data ?: ERR_PTR(-ENODEV);
> +#endif /* CONFIG_PINCTRL_PFC_R8A77950 || CONFIG_PINCTRL_PFC_R8A77951 */
> +
> +	return NULL;
> +}
> +#endif /* CONFIG_OF */
> +
>  static int sh_pfc_probe(struct platform_device *pdev)
>  {
> -#ifdef CONFIG_OF
> -	struct device_node *np = pdev->dev.of_node;
> -#endif
>  	const struct sh_pfc_soc_info *info;
>  	struct sh_pfc *pfc;
>  	int ret;
>  
>  #ifdef CONFIG_OF
> -	if (np)
> -		info = of_device_get_match_data(&pdev->dev);
> -	else
> +	if (pdev->dev.of_node) {
> +		info = sh_pfc_quirk_match();
> +		if (IS_ERR(info))
> +			return PTR_ERR(info);
> +
> +		if (!info)
> +			info = of_device_get_match_data(&pdev->dev);
> +	} else
>  #endif
>  		info = (const void *)platform_get_device_id(pdev)->driver_data;
>  
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c b/drivers/pinctrl/sh-pfc/pfc-r8a77950.c
> similarity index 99%
> rename from drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
> rename to drivers/pinctrl/sh-pfc/pfc-r8a77950.c
> index ad05da8f65161c3d..04812e62f3a476a8 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7795-es1.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77950.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * R8A7795 ES1.x processor support - PFC hardware block.
> + * R8A77950 processor support - PFC hardware block.
>   *
>   * Copyright (C) 2015-2017  Renesas Electronics Corporation
>   */
> @@ -5562,8 +5562,8 @@ static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
>  	{ /* sentinel */ },
>  };
>  
> -static int r8a7795es1_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin,
> -				     u32 *pocctrl)
> +static int r8a77950_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin,
> +				   u32 *pocctrl)
>  {
>  	int bit = -EINVAL;
>  
> @@ -5820,8 +5820,8 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
>  	{ /* sentinel */ },
>  };
>  
> -static unsigned int r8a7795es1_pinmux_get_bias(struct sh_pfc *pfc,
> -					       unsigned int pin)
> +static unsigned int r8a77950_pinmux_get_bias(struct sh_pfc *pfc,
> +					     unsigned int pin)
>  {
>  	const struct pinmux_bias_reg *reg;
>  	unsigned int bit;
> @@ -5838,8 +5838,8 @@ static unsigned int r8a7795es1_pinmux_get_bias(struct sh_pfc *pfc,
>  		return PIN_CONFIG_BIAS_PULL_DOWN;
>  }
>  
> -static void r8a7795es1_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
> -				       unsigned int bias)
> +static void r8a77950_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
> +				     unsigned int bias)
>  {
>  	const struct pinmux_bias_reg *reg;
>  	u32 enable, updown;
> @@ -5861,15 +5861,15 @@ static void r8a7795es1_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
>  	sh_pfc_write(pfc, reg->puen, enable);
>  }
>  
> -static const struct sh_pfc_soc_operations r8a7795es1_pinmux_ops = {
> -	.pin_to_pocctrl = r8a7795es1_pin_to_pocctrl,
> -	.get_bias = r8a7795es1_pinmux_get_bias,
> -	.set_bias = r8a7795es1_pinmux_set_bias,
> +static const struct sh_pfc_soc_operations r8a77950_pinmux_ops = {
> +	.pin_to_pocctrl = r8a77950_pin_to_pocctrl,
> +	.get_bias = r8a77950_pinmux_get_bias,
> +	.set_bias = r8a77950_pinmux_set_bias,
>  };
>  
> -const struct sh_pfc_soc_info r8a7795es1_pinmux_info = {
> +const struct sh_pfc_soc_info r8a77950_pinmux_info = {
>  	.name = "r8a77950_pfc",
> -	.ops = &r8a7795es1_pinmux_ops,
> +	.ops = &r8a77950_pinmux_ops,
>  	.unlock_reg = 0xe6060000, /* PMMR */
>  
>  	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
> diff --git a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c b/drivers/pinctrl/sh-pfc/pfc-r8a77951.c
> similarity index 99%
> rename from drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> rename to drivers/pinctrl/sh-pfc/pfc-r8a77951.c
> index d3145aa135d0fdcd..256fab4b03d35621 100644
> --- a/drivers/pinctrl/sh-pfc/pfc-r8a7795.c
> +++ b/drivers/pinctrl/sh-pfc/pfc-r8a77951.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0
>  /*
> - * R8A7795 ES2.0+ processor support - PFC hardware block.
> + * R8A77951 processor support - PFC hardware block.
>   *
>   * Copyright (C) 2015-2019 Renesas Electronics Corporation
>   */
> @@ -5915,7 +5915,8 @@ static const struct pinmux_ioctrl_reg pinmux_ioctrl_regs[] = {
>  	{ /* sentinel */ },
>  };
>  
> -static int r8a7795_pin_to_pocctrl(struct sh_pfc *pfc, unsigned int pin, u32 *pocctrl)
> +static int r8a77951_pin_to_pocctrl(struct sh_pfc *pfc,
> +				   unsigned int pin, u32 *pocctrl)
>  {
>  	int bit = -EINVAL;
>  
> @@ -6172,8 +6173,8 @@ static const struct pinmux_bias_reg pinmux_bias_regs[] = {
>  	{ /* sentinel */ },
>  };
>  
> -static unsigned int r8a7795_pinmux_get_bias(struct sh_pfc *pfc,
> -					    unsigned int pin)
> +static unsigned int r8a77951_pinmux_get_bias(struct sh_pfc *pfc,
> +					     unsigned int pin)
>  {
>  	const struct pinmux_bias_reg *reg;
>  	unsigned int bit;
> @@ -6190,8 +6191,8 @@ static unsigned int r8a7795_pinmux_get_bias(struct sh_pfc *pfc,
>  		return PIN_CONFIG_BIAS_PULL_DOWN;
>  }
>  
> -static void r8a7795_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
> -				   unsigned int bias)
> +static void r8a77951_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
> +				     unsigned int bias)
>  {
>  	const struct pinmux_bias_reg *reg;
>  	u32 enable, updown;
> @@ -6213,29 +6214,15 @@ static void r8a7795_pinmux_set_bias(struct sh_pfc *pfc, unsigned int pin,
>  	sh_pfc_write(pfc, reg->puen, enable);
>  }
>  
> -static const struct soc_device_attribute r8a7795es1[] = {
> -	{ .soc_id = "r8a7795", .revision = "ES1.*" },
> -	{ /* sentinel */ }
> +static const struct sh_pfc_soc_operations r8a77951_pinmux_ops = {
> +	.pin_to_pocctrl = r8a77951_pin_to_pocctrl,
> +	.get_bias = r8a77951_pinmux_get_bias,
> +	.set_bias = r8a77951_pinmux_set_bias,
>  };
>  
> -static int r8a7795_pinmux_init(struct sh_pfc *pfc)
> -{
> -	if (soc_device_match(r8a7795es1))
> -		pfc->info = &r8a7795es1_pinmux_info;
> -
> -	return 0;
> -}
> -
> -static const struct sh_pfc_soc_operations r8a7795_pinmux_ops = {
> -	.init = r8a7795_pinmux_init,
> -	.pin_to_pocctrl = r8a7795_pin_to_pocctrl,
> -	.get_bias = r8a7795_pinmux_get_bias,
> -	.set_bias = r8a7795_pinmux_set_bias,
> -};
> -
> -const struct sh_pfc_soc_info r8a7795_pinmux_info = {
> +const struct sh_pfc_soc_info r8a77951_pinmux_info = {
>  	.name = "r8a77951_pfc",
> -	.ops = &r8a7795_pinmux_ops,
> +	.ops = &r8a77951_pinmux_ops,
>  	.unlock_reg = 0xe6060000, /* PMMR */
>  
>  	.function = { PINMUX_FUNCTION_BEGIN, PINMUX_FUNCTION_END },
> diff --git a/drivers/pinctrl/sh-pfc/sh_pfc.h b/drivers/pinctrl/sh-pfc/sh_pfc.h
> index 640d2a4cb838804f..d57e633e99c0ce66 100644
> --- a/drivers/pinctrl/sh-pfc/sh_pfc.h
> +++ b/drivers/pinctrl/sh-pfc/sh_pfc.h
> @@ -318,8 +318,8 @@ extern const struct sh_pfc_soc_info r8a7791_pinmux_info;
>  extern const struct sh_pfc_soc_info r8a7792_pinmux_info;
>  extern const struct sh_pfc_soc_info r8a7793_pinmux_info;
>  extern const struct sh_pfc_soc_info r8a7794_pinmux_info;
> -extern const struct sh_pfc_soc_info r8a7795_pinmux_info;
> -extern const struct sh_pfc_soc_info r8a7795es1_pinmux_info;
> +extern const struct sh_pfc_soc_info r8a77950_pinmux_info __weak;
> +extern const struct sh_pfc_soc_info r8a77951_pinmux_info __weak;
>  extern const struct sh_pfc_soc_info r8a77960_pinmux_info;
>  extern const struct sh_pfc_soc_info r8a77961_pinmux_info;
>  extern const struct sh_pfc_soc_info r8a77965_pinmux_info;
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
