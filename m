Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6CF3217CE
	for <lists+linux-gpio@lfdr.de>; Fri, 17 May 2019 13:34:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728877AbfEQLec (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 May 2019 07:34:32 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:4259 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728103AbfEQLec (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 May 2019 07:34:32 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5cde9c4b0000>; Fri, 17 May 2019 04:34:35 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 17 May 2019 04:34:29 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 17 May 2019 04:34:29 -0700
Received: from [10.24.47.197] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 17 May
 2019 11:34:24 +0000
Subject: Re: [PATCH V3 3/4] pinctrl: tegra: Add Tegra194 pinmux driver
To:     Krishna Yarlagadda <kyarlagadda@nvidia.com>,
        <linus.walleij@linaro.org>, <thierry.reding@gmail.com>,
        <jonathanh@nvidia.com>, <linux-kernel@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <devicetree@vger.kernel.org>
CC:     <pdeschrijver@nvidia.com>, <josephl@nvidia.com>,
        <smangipudi@nvidia.com>, <ldewangan@nvidia.com>
References: <1558007594-14824-1-git-send-email-kyarlagadda@nvidia.com>
 <1558007594-14824-3-git-send-email-kyarlagadda@nvidia.com>
X-Nvconfidentiality: public
From:   Vidya Sagar <vidyas@nvidia.com>
Message-ID: <9066b6bd-c8ca-2d5b-dd1e-20c94a492cbf@nvidia.com>
Date:   Fri, 17 May 2019 17:04:21 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1558007594-14824-3-git-send-email-kyarlagadda@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1558092875; bh=Y9BZ/VKBiBTqykuPOxXX48dcESowFVreE6atkN5q4r0=;
        h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
         Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
         X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=BsUDj2JP+4MavbWeCkanjVpCdVKQ/l9UQ7JSwGY57tMPmAFlIRzHbplcVkCx1Druk
         FQZ5BcaRMGy4VuCPYPdMmi+NdWBZeImWpE5U+Nc19MN5QtWMcFlsIN8tssSNpRG46I
         qBv68PpTdsocvUudwUxOQ4PKexQKqLDtHq+mSSqoydrB1ttSD+ES+GUdD5vHLWF1J1
         qaP18/P95SHz0Fc22/TaJJ+eqCAjLodurb+nfmQChLh36bLrNwO0Gq6VrkV9jmj4Jk
         ZXOekKwl70su7X0p7Ace1vfUBhdGmyTcgIxzHM5A4BGaTPj00HoWC94BMscies35+D
         xIsMq9IDi6MEA==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 5/16/2019 5:23 PM, Krishna Yarlagadda wrote:
> Tegra194 has PCIE L5 rst and clkreq pins which need to be controlled
> dynamically at runtime. This driver supports change pinmux for these
> pins. Pinmux for rest of the pins is set statically by bootloader and
> will not be changed by this driver
> 
> Signed-off-by: Krishna Yarlagadda <kyarlagadda@nvidia.com>
> Signed-off-by: Suresh Mangipudi <smangipudi@nvidia.com>
> ---
> Changes in V3:
> Fix build issue observed with previous version
> 
>   drivers/pinctrl/tegra/Kconfig            |   4 +
>   drivers/pinctrl/tegra/Makefile           |   1 +
>   drivers/pinctrl/tegra/pinctrl-tegra194.c | 170 +++++++++++++++++++++++++++++++
>   3 files changed, 175 insertions(+)
>   create mode 100644 drivers/pinctrl/tegra/pinctrl-tegra194.c
> 
> diff --git a/drivers/pinctrl/tegra/Kconfig b/drivers/pinctrl/tegra/Kconfig
> index 24e20cc..6f79f1f 100644
> --- a/drivers/pinctrl/tegra/Kconfig
> +++ b/drivers/pinctrl/tegra/Kconfig
> @@ -23,6 +23,10 @@ config PINCTRL_TEGRA210
>   	bool
>   	select PINCTRL_TEGRA
>   
> +config PINCTRL_TEGRA194
> +	bool
> +	select PINCTRL_TEGRA
> +
>   config PINCTRL_TEGRA_XUSB
>   	def_bool y if ARCH_TEGRA
>   	select GENERIC_PHY
> diff --git a/drivers/pinctrl/tegra/Makefile b/drivers/pinctrl/tegra/Makefile
> index bbcb043..ead4e10 100644
> --- a/drivers/pinctrl/tegra/Makefile
> +++ b/drivers/pinctrl/tegra/Makefile
> @@ -5,4 +5,5 @@ obj-$(CONFIG_PINCTRL_TEGRA30)		+= pinctrl-tegra30.o
>   obj-$(CONFIG_PINCTRL_TEGRA114)		+= pinctrl-tegra114.o
>   obj-$(CONFIG_PINCTRL_TEGRA124)		+= pinctrl-tegra124.o
>   obj-$(CONFIG_PINCTRL_TEGRA210)		+= pinctrl-tegra210.o
> +obj-$(CONFIG_PINCTRL_TEGRA194)		+= pinctrl-tegra194.o
>   obj-$(CONFIG_PINCTRL_TEGRA_XUSB)	+= pinctrl-tegra-xusb.o
> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra194.c b/drivers/pinctrl/tegra/pinctrl-tegra194.c
> new file mode 100644
> index 0000000..957ef19
> --- /dev/null
> +++ b/drivers/pinctrl/tegra/pinctrl-tegra194.c
> @@ -0,0 +1,170 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Pinctrl data for the NVIDIA Tegra194 pinmux
> + *
> + * Copyright (c) 2019, NVIDIA CORPORATION.  All rights reserved.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope it will be useful, but WITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> + * more details.
> + */
> +
> +#include <linux/init.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/pinctrl/pinctrl.h>
> +#include <linux/pinctrl/pinmux.h>
> +
> +#include "pinctrl-tegra.h"
> +
> +/* Define unique ID for each pins */
> +enum pin_id {
> +	TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0 = 256,
> +	TEGRA_PIN_PEX_L5_RST_N_PGG1 = 257,
> +	TEGRA_PIN_NUM_GPIOS = 258,
> +};
> +
> +/* Table for pin descriptor */
> +static const struct pinctrl_pin_desc tegra194_pins[] = {
> +	PINCTRL_PIN(TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0,
> +		    "TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0"),
> +	PINCTRL_PIN(TEGRA_PIN_PEX_L5_RST_N_PGG1,
> +		    "TEGRA_PIN_PEX_L5_RST_N_PGG1"),
> +};
> +
> +static const unsigned int pex_l5_clkreq_n_pgg0_pins[] = {
> +	TEGRA_PIN_PEX_L5_CLKREQ_N_PGG0,
> +};
> +
> +static const unsigned int pex_l5_rst_n_pgg1_pins[] = {
> +	TEGRA_PIN_PEX_L5_RST_N_PGG1,
> +};
> +
> +/* Define unique ID for each function */
> +enum tegra_mux_dt {
> +	TEGRA_MUX_RSVD0,
> +	TEGRA_MUX_RSVD1,
> +	TEGRA_MUX_RSVD2,
> +	TEGRA_MUX_RSVD3,
> +	TEGRA_MUX_PE5,
> +};
> +
> +/* Make list of each function name */
> +#define TEGRA_PIN_FUNCTION(lid)			\
> +	{					\
> +		.name = #lid,			\
> +	}
> +static struct tegra_function tegra194_functions[] = {
> +	TEGRA_PIN_FUNCTION(rsvd0),
> +	TEGRA_PIN_FUNCTION(rsvd1),
> +	TEGRA_PIN_FUNCTION(rsvd2),
> +	TEGRA_PIN_FUNCTION(rsvd3),
> +	TEGRA_PIN_FUNCTION(pe5),
> +};
> +
> +#define DRV_PINGROUP_ENTRY_Y(r, drvdn_b, drvdn_w, drvup_b,	\
> +			     drvup_w, slwr_b, slwr_w, slwf_b,	\
> +			     slwf_w, bank)			\
> +		.drv_reg = ((r)),			\
> +		.drv_bank = bank,				\
> +		.drvdn_bit = drvdn_b,				\
> +		.drvdn_width = drvdn_w,				\
> +		.drvup_bit = drvup_b,				\
> +		.drvup_width = drvup_w,				\
> +		.slwr_bit = slwr_b,				\
> +		.slwr_width = slwr_w,				\
> +		.slwf_bit = slwf_b,				\
> +		.slwf_width = slwf_w
> +
> +#define PIN_PINGROUP_ENTRY_Y(r, bank, pupd, e_lpbk, e_input,	\
> +			     e_od, schmitt_b, drvtype)		\
> +		.mux_reg = ((r)),				\
> +		.lpmd_bit = -1,					\
> +		.lock_bit = -1,					\
> +		.hsm_bit = -1,					\
> +		.parked_bit = -1,				\
> +		.mux_bank = bank,				\
> +		.mux_bit = 0,					\
> +		.pupd_reg = ((r)),		\
> +		.pupd_bank = bank,				\
> +		.pupd_bit = 2,					\
> +		.tri_reg = ((r)),				\
> +		.tri_bank = bank,				\
> +		.tri_bit = 4,					\
> +		.einput_bit = e_input,				\
> +		.odrain_bit = e_od,				\
> +		.schmitt_bit = schmitt_b,			\
> +		.drvtype_bit = 13,				\
> +		.drv_reg = -1
> +
> +#define drive_pex_l5_clkreq_n_pgg0				\
> +	DRV_PINGROUP_ENTRY_Y(0x14004, 12, 5, 20, 5, -1, -1, -1, -1, 0)
> +#define drive_pex_l5_rst_n_pgg1					\
> +	DRV_PINGROUP_ENTRY_Y(0x1400c, 12, 5, 20, 5, -1, -1, -1, -1, 0)
> +
> +#define PINGROUP(pg_name, f0, f1, f2, f3, r, bank, pupd, e_lpbk,	\
> +		 e_input, e_lpdr, e_od, schmitt_b, drvtype, io_rail)	\
> +	{							\
> +		.name = #pg_name,				\
> +		.pins = pg_name##_pins,				\
> +		.npins = ARRAY_SIZE(pg_name##_pins),		\
> +			.funcs = {				\
> +				TEGRA_MUX_##f0,			\
> +				TEGRA_MUX_##f1,			\
> +				TEGRA_MUX_##f2,			\
> +				TEGRA_MUX_##f3,			\
> +			},					\
> +		PIN_PINGROUP_ENTRY_Y(r, bank, pupd, e_lpbk,	\
> +				     e_input, e_od,		\
> +				     schmitt_b, drvtype),	\
> +		drive_##pg_name,				\
> +	}
> +
> +static const struct tegra_pingroup tegra194_groups[] = {
> +	PINGROUP(pex_l5_clkreq_n_pgg0, PE5, RSVD1, RSVD2, RSVD3, 0x14000, 0,
> +		 Y, -1, 6, 8, 11, 12, N, "vddio_pex_ctl_2"),
> +	PINGROUP(pex_l5_rst_n_pgg1, PE5, RSVD1, RSVD2, RSVD3, 0x14008, 0,
> +		 Y, -1, 6, 8, 11, 12, N, "vddio_pex_ctl_2"),
> +};
> +
> +static const struct tegra_pinctrl_soc_data tegra194_pinctrl = {
> +	.ngpios = TEGRA_PIN_NUM_GPIOS,
> +	.pins = tegra194_pins,
> +	.npins = ARRAY_SIZE(tegra194_pins),
> +	.functions = tegra194_functions,
> +	.nfunctions = ARRAY_SIZE(tegra194_functions),
> +	.groups = tegra194_groups,
> +	.ngroups = ARRAY_SIZE(tegra194_groups),
> +	.hsm_in_mux = true,
> +	.schmitt_in_mux = true,
> +	.drvtype_in_mux = true,
> +};
> +
> +static int tegra194_pinctrl_probe(struct platform_device *pdev)
> +{
> +	return tegra_pinctrl_probe(pdev, &tegra194_pinctrl);
> +}
> +
> +static const struct of_device_id tegra194_pinctrl_of_match[] = {
> +	{ .compatible = "nvidia,tegra194-pinmux", },
> +	{ },
> +};
> +
> +static struct platform_driver tegra194_pinctrl_driver = {
> +	.driver = {
> +		.name = "tegra194-pinctrl",
> +		.of_match_table = tegra194_pinctrl_of_match,
> +	},
> +	.probe = tegra194_pinctrl_probe,
> +};
> +
> +static int __init tegra194_pinctrl_init(void)
> +{
> +	return platform_driver_register(&tegra194_pinctrl_driver);
> +}
> +arch_initcall(tegra194_pinctrl_init);
> 

Tested-by: Vidya Sagar <vidyas@nvidia.com>
