Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E36371F7E6
	for <lists+linux-gpio@lfdr.de>; Fri,  2 Jun 2023 03:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232809AbjFBBbA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Jun 2023 21:31:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232292AbjFBBa7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Jun 2023 21:30:59 -0400
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61F88128
        for <linux-gpio@vger.kernel.org>; Thu,  1 Jun 2023 18:30:57 -0700 (PDT)
Received: from localhost (88-113-26-95.elisa-laajakaista.fi [88.113.26.95])
        by fgw23.mail.saunalahti.fi (Halon) with ESMTP
        id 1e156516-00e5-11ee-b972-005056bdfda7;
        Fri, 02 Jun 2023 04:30:55 +0300 (EEST)
From:   andy.shevchenko@gmail.com
Date:   Fri, 2 Jun 2023 04:30:54 +0300
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 2/3] pinctrl: tegra: Add Tegra234 pinmux driver
Message-ID: <ZHlGTgdsqcGOmVN2@surfacebook>
References: <20230530133654.1296480-1-thierry.reding@gmail.com>
 <20230530133654.1296480-3-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530133654.1296480-3-thierry.reding@gmail.com>
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
        FORGED_GMAIL_RCVD,FREEMAIL_FROM,NML_ADSP_CUSTOM_MED,SPF_HELO_NONE,
        SPF_SOFTFAIL,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Tue, May 30, 2023 at 03:36:53PM +0200, Thierry Reding kirjoitti:
> From: Prathamesh Shete <pshete@nvidia.com>
> 
> This change adds support for the two pin controllers found on Tegra234.

...

> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Pinctrl data for the NVIDIA Tegra234 pinmux
> + *
> + * Copyright (c) 2021-2023, NVIDIA CORPORATION.  All rights reserved.

> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.

The whole SPDX idea is to avoid including this duplication. Is this a
requirement of your company lawers?

> + */
> +
> +#include <linux/module.h>

Missing mod_devicetable.h

> +#include <linux/of.h>
> +#include <linux/of_device.h>

Do you need both for just of_device_get_match_data() call? Note, you may
replace it with device_get_match_data() and property.h and be completely
OF independent.

> +#include <linux/platform_device.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +#include "pinctrl-tegra.h"

...

> +#define PINGROUP(pg_name, f0, f1, f2, f3, r, bank, pupd, e_io_hv, e_lpbk, e_input, e_lpdr, e_pbias_buf,	\
> +			gpio_sfio_sel, schmitt_b)							\
> +	{								\
> +		.name = #pg_name,					\
> +		.pins = pg_name##_pins,					\
> +		.npins = ARRAY_SIZE(pg_name##_pins),			\

Can we use struct pingroup, please?

> +			.funcs = {					\
> +				TEGRA_MUX_##f0,				\
> +				TEGRA_MUX_##f1,				\
> +				TEGRA_MUX_##f2,				\
> +				TEGRA_MUX_##f3,				\
> +			},						\
> +		PIN_PINGROUP_ENTRY_Y(r, bank, pupd, e_io_hv, e_lpbk,	\
> +					e_input, e_lpdr, e_pbias_buf,	\
> +					gpio_sfio_sel, schmitt_b)	\
> +		drive_##pg_name,					\
> +	}

> +static int tegra234_pinctrl_probe(struct platform_device *pdev)
> +{
> +	const struct tegra_pinctrl_soc_data *soc = of_device_get_match_data(&pdev->dev);
> +
> +	return tegra_pinctrl_probe(pdev, soc);
> +}
> +
> +static const struct of_device_id tegra234_pinctrl_of_match[] = {
> +	{ .compatible = "nvidia,tegra234-pinmux", .data = &tegra234_pinctrl},
> +	{ .compatible = "nvidia,tegra234-pinmux-aon", .data = &tegra234_pinctrl_aon },
> +	{ },

No comma for the terminator entry.

> +};

...

> +static struct platform_driver tegra234_pinctrl_driver = {
> +	.driver = {
> +		.name = "tegra234-pinctrl",

> +		.owner = THIS_MODULE,

Approx. 15 years this is _not_ needed.

> +		.of_match_table = tegra234_pinctrl_of_match,
> +	},
> +	.probe = tegra234_pinctrl_probe,
> +};

-- 
With Best Regards,
Andy Shevchenko


