Return-Path: <linux-gpio+bounces-15076-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0B54A202B6
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jan 2025 01:44:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1450718843A9
	for <lists+linux-gpio@lfdr.de>; Tue, 28 Jan 2025 00:44:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11C95664C6;
	Tue, 28 Jan 2025 00:43:58 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1CD527452;
	Tue, 28 Jan 2025 00:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738025037; cv=none; b=al4GdNWZSBhoHdnTyZYSrGOkw3MMXsxzoOE34haYTWnj6CiNq2WLr80LBIzrlRDYz74vGM/2mz3NfWi8/1d9Ch5mQVo8r7LncJ3/NnGYySV8YL4tzvKj4wsW6fjFF/9cz0B6gUxW4pyjaHSIqoPI2+mhv/qg+vL+jfhHihXg1Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738025037; c=relaxed/simple;
	bh=7oIIsRxGVclCzffcxNXUhvyz0dfINoq8jry8NFX6pqo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EchW8jvx+2lcRye1YBV/QV4YcFI8zY1HUl1dsOZrxoXnfriwOt85No7N6LkOgFBVjBfmjpmAmD9UBdSVR4lwLsiff1qkd62dKJsQPAJMPpmLcrLb0GZgVkWjcFGukGTOcuWzBlGdDNs6PRYAppjQX8mA9TKFTnLLqAkoL3dGNJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 861C7497;
	Mon, 27 Jan 2025 16:44:18 -0800 (PST)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 450AC3F528;
	Mon, 27 Jan 2025 16:43:48 -0800 (PST)
Date: Tue, 28 Jan 2025 00:42:11 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Andras Szemzo <szemzo.andras@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Linus Walleij <linus.walleij@linaro.org>, Philipp
 Zabel <p.zabel@pengutronix.de>, Maxime Ripard <mripard@kernel.org>, Vinod
 Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Ulf
 Hansson <ulf.hansson@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Uwe
 =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>, Florian
 Fainelli <florian.fainelli@broadcom.com>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 05/12] clk: sunxi-ng: add CCU drivers for V853
Message-ID: <20250128004211.5c6f0158@minigeek.lan>
In-Reply-To: <20250110123923.270626-6-szemzo.andras@gmail.com>
References: <20250110123923.270626-1-szemzo.andras@gmail.com>
 <20250110123923.270626-6-szemzo.andras@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 10 Jan 2025 13:39:16 +0100
Andras Szemzo <szemzo.andras@gmail.com> wrote:

Hi Andras,

oh dear, that's a code line and a half!

First very much for sending this, I know from (recent) experience that
those clock drivers can be very daunting and tedious to write
...which is unfortunately true for the review as well ;-)

So this is the first round, as I was keeping and updating this in my
Drafts folder for almost two weeks now.

> V853 has similar gates/resets like existing Allwinner SOCs. Add support for it's CCU and PRCM CCU.
> 
> Signed-off-by: Andras Szemzo <szemzo.andras@gmail.com>
> ---
>  drivers/clk/sunxi-ng/Kconfig            |   10 +
>  drivers/clk/sunxi-ng/Makefile           |    4 +
>  drivers/clk/sunxi-ng/ccu-sun8i-v853-r.c |   95 ++
>  drivers/clk/sunxi-ng/ccu-sun8i-v853-r.h |   15 +
>  drivers/clk/sunxi-ng/ccu-sun8i-v853.c   | 1145 +++++++++++++++++++++++
>  drivers/clk/sunxi-ng/ccu-sun8i-v853.h   |   14 +
>  6 files changed, 1283 insertions(+)
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-v853-r.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-v853-r.h
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-v853.c
>  create mode 100644 drivers/clk/sunxi-ng/ccu-sun8i-v853.h
> 
> diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
> index b547198a2c65..c43002246b22 100644
> --- a/drivers/clk/sunxi-ng/Kconfig
> +++ b/drivers/clk/sunxi-ng/Kconfig
> @@ -22,6 +22,16 @@ config SUN20I_D1_R_CCU
>  	default y
>  	depends on MACH_SUN8I || RISCV || COMPILE_TEST
>  
> +config SUN8I_V853_CCU
> +	tristate "Support for the Allwinner V853 CCU"
> +	default MACH_SUN8I
> +	depends on MACH_SUN8I || COMPILE_TEST
> +
> +config SUN8I_V853_R_CCU
> +	tristate "Support for the Allwinner V853 PRCM CCU"
> +	default MACH_SUN8I
> +	depends on MACH_SUN8I || COMPILE_TEST
> +
>  config SUN50I_A64_CCU
>  	tristate "Support for the Allwinner A64 CCU"
>  	default y
> diff --git a/drivers/clk/sunxi-ng/Makefile b/drivers/clk/sunxi-ng/Makefile
> index 6b3ae2b620db..c32430d874ea 100644
> --- a/drivers/clk/sunxi-ng/Makefile
> +++ b/drivers/clk/sunxi-ng/Makefile
> @@ -27,6 +27,8 @@ sunxi-ccu-y			+= ccu_mp.o
>  obj-$(CONFIG_SUNIV_F1C100S_CCU)	+= suniv-f1c100s-ccu.o
>  obj-$(CONFIG_SUN20I_D1_CCU)	+= sun20i-d1-ccu.o
>  obj-$(CONFIG_SUN20I_D1_R_CCU)	+= sun20i-d1-r-ccu.o
> +obj-$(CONFIG_SUN8I_V853_CCU)	+= sun8i-v853-ccu.o
> +obj-$(CONFIG_SUN8I_V853_R_CCU)	+= sun8i-v853-r-ccu.o
>  obj-$(CONFIG_SUN50I_A64_CCU)	+= sun50i-a64-ccu.o
>  obj-$(CONFIG_SUN50I_A100_CCU)	+= sun50i-a100-ccu.o
>  obj-$(CONFIG_SUN50I_A100_R_CCU)	+= sun50i-a100-r-ccu.o
> @@ -50,6 +52,8 @@ obj-$(CONFIG_SUN9I_A80_CCU)	+= sun9i-a80-de-ccu.o
>  obj-$(CONFIG_SUN9I_A80_CCU)	+= sun9i-a80-usb-ccu.o
>  
>  suniv-f1c100s-ccu-y		+= ccu-suniv-f1c100s.o
> +sun8i-v853-ccu-y		+= ccu-sun8i-v853.o
> +sun8i-v853-r-ccu-y		+= ccu-sun8i-v853-r.o
>  sun20i-d1-ccu-y			+= ccu-sun20i-d1.o
>  sun20i-d1-r-ccu-y		+= ccu-sun20i-d1-r.o
>  sun50i-a64-ccu-y		+= ccu-sun50i-a64.o
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-v853-r.c b/drivers/clk/sunxi-ng/ccu-sun8i-v853-r.c
> new file mode 100644
> index 000000000000..19a8ba587793
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-v853-r.c
> @@ -0,0 +1,95 @@
> +// SPDX-License-Identifier: GPL-3.0
> +/* Copyright(c) 2020 - 2023 Allwinner Technology Co.,Ltd. All rights reserved.

So does that mean you copied that from the BSP? How much is your own
work then? Should "rengaomin" be then the author?

But more importantly: As far as I know, GPL-3 is NOT compatible with
the kernel. You definitely cannot add code with that license, and from
my understanding cannot copy GPL-3 code without keeping the license,
which means copying is a no-go.
You would need to ask the original author to change the license. I have
seen license changes in github repos mirroring Allwinner's SDK in the
last few months (someone must have told them?), so it's worth checking
back there to see if the license has changed.

But with that header, and with that source (subject to clarification)
this cannot be merged as such.

> + *
> + * Copyright (c) 2023 rengaomin@allwinnertech.com
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/of_address.h>
> +#include <linux/platform_device.h>
> +
> +#include "ccu_common.h"
> +#include "ccu_reset.h"
> +
> +#include "ccu_div.h"
> +#include "ccu_gate.h"
> +#include "ccu_mp.h"
> +#include "ccu_mult.h"
> +#include "ccu_nk.h"
> +#include "ccu_nkm.h"
> +#include "ccu_nkmp.h"
> +#include "ccu_nm.h"
> +
> +#include "ccu-sun8i-v853-r.h"
> +
> +
> +static SUNXI_CCU_GATE(r_twd_clk, "r-twd", "osc24M", 0x012C, BIT(0), 0);
> +static SUNXI_CCU_GATE(r_ppu_clk, "r-ppu", "osc24M", 0x01AC, BIT(0), 0);
> +static SUNXI_CCU_GATE(r_rtc_clk, "r-rtc", "osc24M", 0x020C, BIT(0), 0);
> +static SUNXI_CCU_GATE(r_cpucfg_clk, "r-cpucfg", "osc24M",
> +			0x022C, BIT(0), 0);
> +
> +static struct ccu_reset_map sun8i_v853_r_ccu_resets[] = {
> +	[RST_BUS_R_PPU]		= { 0x01ac, BIT(16) },
> +	[RST_BUS_R_RTC]		= { 0x020c, BIT(16) },
> +	[RST_BUS_R_CPUCFG]	= { 0x022c, BIT(16) },
> +};
> +
> +static struct clk_hw_onecell_data sun8i_v853_r_hw_clks = {
> +	.hws    = {
> +		[CLK_R_TWD]			= &r_twd_clk.common.hw,
> +		[CLK_R_PPU]			= &r_ppu_clk.common.hw,
> +		[CLK_R_RTC]			= &r_rtc_clk.common.hw,
> +		[CLK_R_CPUCFG]			= &r_cpucfg_clk.common.hw,
> +	},
> +	.num = CLK_NUMBER,
> +};
> +
> +static struct ccu_common *sun8i_v853_r_ccu_clks[] = {
> +	&r_twd_clk.common,
> +	&r_ppu_clk.common,
> +	&r_rtc_clk.common,
> +	&r_cpucfg_clk.common,
> +};
> +
> +
> +static const struct sunxi_ccu_desc sun8i_v853_r_ccu_desc = {
> +	.ccu_clks	= sun8i_v853_r_ccu_clks,
> +	.num_ccu_clks	= ARRAY_SIZE(sun8i_v853_r_ccu_clks),
> +
> +	.hw_clks	= &sun8i_v853_r_hw_clks,
> +
> +	.resets		= sun8i_v853_r_ccu_resets,
> +	.num_resets	= ARRAY_SIZE(sun8i_v853_r_ccu_resets),
> +};
> +
> +static int sun8i_v853_r_ccu_probe(struct platform_device *pdev)
> +{
> +	void __iomem *reg;
> +
> +	reg = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(reg))
> +		return PTR_ERR(reg);
> +
> +	return devm_sunxi_ccu_probe(&pdev->dev, reg, &sun8i_v853_r_ccu_desc);
> +}
> +
> +static const struct of_device_id sun8i_v853_r_ccu_ids[] = {
> +	{ .compatible = "allwinner,sun8i-v853-r-ccu" },
> +	{ }
> +};
> +
> +static struct platform_driver sun8i_v853_r_ccu_driver = {
> +	.probe	= sun8i_v853_r_ccu_probe,
> +	.driver	= {
> +		.name			= "sun8i-v853-r-ccu",
> +		.suppress_bind_attrs	= true,
> +		.of_match_table		= sun8i_v853_r_ccu_ids,
> +	},
> +};
> +module_platform_driver(sun8i_v853_r_ccu_driver);
> +
> +MODULE_IMPORT_NS("SUNXI_CCU");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-v853-r.h b/drivers/clk/sunxi-ng/ccu-sun8i-v853-r.h
> new file mode 100644
> index 000000000000..156ca15e8208
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-v853-r.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Here the license looks right, but the authorship and source are still
in question. Looks like the only real code in here is CLK_NUMBER, so if
that is your line, drop all those bogus copyrights, and put in your own.

> +/* Copyright(c) 2020 - 2023 Allwinner Technology Co.,Ltd. All rights reserved.
> + *
> + * Copyright (c) 2023 rengaomin@allwinnertech.com
> + */
> +
> +#ifndef _CCU_SUN8I_V853_R_H
> +#define _CCU_SUN8I_V853_R_H
> +
> +#include <dt-bindings/clock/sun8i-v853-r-ccu.h>
> +#include <dt-bindings/reset/sun8i-v853-r-ccu.h>
> +
> +#define CLK_NUMBER	CLK_R_MAX_NO

What's "CLK_R_MAX_NO"? I think we put in the actual last clock name in,
traditionally?

> +
> +#endif
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-v853.c b/drivers/clk/sunxi-ng/ccu-sun8i-v853.c
> new file mode 100644
> index 000000000000..a1947357a08e
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-v853.c
> @@ -0,0 +1,1145 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2024 Andras Szemzo <szemzo.andras@gmail.com>
> + *
> + * Based on ccu-sun20i-d1.c, which is:
> + * Copyright (C) 2021 Samuel Holland. All rights reserved.

All rights reserved? Where does that come from? Please remove that.

> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/io.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +#include "../clk.h"
> +
> +#include "ccu_common.h"
> +#include "ccu_reset.h"
> +
> +#include "ccu_div.h"
> +#include "ccu_gate.h"
> +#include "ccu_mp.h"
> +#include "ccu_mult.h"
> +#include "ccu_nk.h"
> +#include "ccu_nkm.h"
> +#include "ccu_nkmp.h"
> +#include "ccu_nm.h"
> +
> +#include "ccu-sun8i-v853.h"
> +
> +static const struct clk_parent_data osc24M[] = {
> +	{ .fw_name = "hosc" }
> +};
> +
> +/*
> + * For the CPU PLL, the output divider is described as "only for testing"
> + * in the user manual. So it's not modelled and forced to 0.
> + */
> +#define SUN8I_V853_PLL_CPU_REG		0x000
> +
> +static struct ccu_mult pll_cpu_clk = {
> +	.enable		= BIT(27) | BIT(30) | BIT(31),

But bit 30 and 31 are set already by the PLL loop in the probe routine
below, so we just need bit 27 to gate the output.

> +	.lock		= BIT(28),
> +	.mult		= _SUNXI_CCU_MULT_MIN(8, 8, 12),

technically the manual says the minimum is 11, though this doesn't
really matter, as we will never go that low anyway.

> +	.common		= {
> +		.reg		= 0x000,
> +		.hw.init	= CLK_HW_INIT_PARENTS_DATA("pll-cpu", osc24M,
> +							   &ccu_mult_ops,
> +							   CLK_SET_RATE_UNGATE),

This must be CLK_SET_RATE_GATE, as we figured some weeks ago. The manual
says that for changing the frequency you must leave the PLL enabled
(bits 31 and 30 = 1), but gate the output (bit 27 = 0). The "GATE" in
that flag name here refers to the .enable mask above.
So CLK_SET_RATE_UNGATE would mean: don't touch the enable bit, but keep
it running, which would be correct if the enable bit would be about the
real enable bit (bit 31). But since we model this like "enable means not
gated", we must gate the output, by setting the enable bit to 0.
CLK_SET_RATE_GATE does exactly that.

> +	},
> +};
> +
> +/* Some PLLs are input * N / div1 / P. Model them as NKMP with no K */
> +#define SUN8I_V853_PLL_DDR_REG		0x010
> +static struct ccu_nkmp pll_ddr_clk = {
> +	.enable		= BIT(27) | BIT(30) | BIT(31),

same here, only bit 27 please.

> +	.lock		= BIT(28),
> +	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
> +	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
> +	.p		= _SUNXI_CCU_DIV(0, 1), /* output divider */
> +	.common		= {
> +		.reg		= 0x010,
> +		.hw.init	= CLK_HW_INIT_PARENTS_DATA("pll-ddr", osc24M,
> +							   &ccu_nkmp_ops,
> +							   CLK_SET_RATE_UNGATE),

CLK_SET_RATE_GATE, as above.

> +	},
> +};
> +
> +#define SUN8I_V853_PLL_PERIPH_REG	0x020
> +static struct ccu_nm pll_periph_4x_clk = {
> +	.enable		= BIT(27) | BIT(30) | BIT(31),

BIT(27), as above, and further down as well

> +	.lock		= BIT(28),
> +	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
> +	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
> +	.common		= {
> +		.reg		= 0x020,
> +		.hw.init	= CLK_HW_INIT_PARENTS_DATA("pll-periph-4x", osc24M,
> +							   &ccu_nm_ops,
> +							   CLK_SET_RATE_UNGATE),

you guessed it: CLK_SET_RATE_GATE, here and further below, please

> +	},
> +};
> +
> +static SUNXI_CCU_M(pll_periph_2x_clk, "pll-periph-2x", "pll-periph-4x",
> +		       0x020, 16, 3, 0);

So is there a recommendation about how we reference other clocks? This
one here is using the clock name, which requires a look-up, where we
could use the pointer directly as well, as done down below.

static const struct clk_hw *pll_periph0_4x_hws[] = {
	&pll_periph0_4x_clk.common.hw
};
static SUNXI_CCU_M_HWS(pll_periph0_2x_clk, "pll-periph0-2x",
		       pll_periph0_4x_hws, 0x020, 16, 3, 0);

I have seen both, sun20i-d1 for instance uses this, and I copied from
there for the A523 clock code.

Would be glad to hear some maintainer's opinion.

> +
> +static SUNXI_CCU_M(pll_periph_800M_clk, "pll-periph-800M", "pll-periph-4x",
> +		       0x020, 20, 3, 0);
> +
> +static SUNXI_CCU_M(pll_periph_480M_clk, "pll-periph-480M", "pll-periph-4x",
> +		       0x020, 2, 3, 0);
> +
> +static CLK_FIXED_FACTOR_HW(pll_periph_600M_clk, "pll-periph-600M",
> +			&pll_periph_2x_clk.common.hw, 2, 1, 0);
> +
> +static CLK_FIXED_FACTOR_HW(pll_periph_400M_clk, "pll-periph-400M",
> +			&pll_periph_2x_clk.common.hw, 3, 1, 0);
> +
> +static CLK_FIXED_FACTOR_HW(pll_periph_300M_clk, "pll-periph-300M",
> +			    &pll_periph_600M_clk.hw, 2, 1, 0);
> +
> +static CLK_FIXED_FACTOR_HW(pll_periph_200M_clk, "pll-periph-200M",
> +			    &pll_periph_400M_clk.hw, 2, 1, 0);
> +
> +static CLK_FIXED_FACTOR_HW(pll_periph_160M_clk, "pll-periph-160M",
> +			    &pll_periph_480M_clk.common.hw, 3, 1, 0);
> +
> +static CLK_FIXED_FACTOR_HW(pll_periph_150M_clk, "pll-periph-150M",
> +			    &pll_periph_300M_clk.hw, 2, 1, 0);
> +
> +
> +/*
> + * For Video PLLs, the output divider is described as "only for testing"
> + * in the user manual. So it's not modelled and forced to 0.

That's a bit confusing: the manual says that the default value for bit 0
is 0x1, and that it's "only for testing", which would mean we should
leave it like this, always dividing by 2? In the main description (bit
31) it says:
	VIDEOPLL4X = InputFreq*N/M
but below (bit 0) it's
	VIDEOPLL4X = 24MHz*N/M/D
(with D being "PLL_OUTPUT_DIV_D + 1", so 2 in our case)

Do you have any indication how fast the video PLL really is? If it is
divided by 2 (as we force that bit to 1 down in the probe routine), then
we would need to model this with that CCU_FEATURE_FIXED_POSTDIV flag,
and either leave that bit alone or force it to 1 instead.
Also would be good to see what the BSP does.

> + */
> +#define SUN8I_V853_PLL_VIDEO_REG	0x040
> +static struct ccu_nm pll_video_4x_clk = {
> +	.enable		= BIT(27) | BIT(30) | BIT(31),
> +	.lock		= BIT(28),
> +	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),

The manual says 11 (but again doesn't matter).

> +	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
> +	.common		= {
> +		.reg		= 0x040,
> +		.hw.init	= CLK_HW_INIT_PARENTS_DATA("pll-video-4x", osc24M,
> +							   &ccu_nm_ops,
> +							   CLK_SET_RATE_UNGATE),
> +	},
> +};
> +
> +static const struct clk_hw *pll_video_4x_hws[] = {
> +	&pll_video_4x_clk.common.hw
> +};
> +static CLK_FIXED_FACTOR_HWS(pll_video_2x_clk, "pll-video-2x",
> +			    pll_video_4x_hws, 2, 1, CLK_SET_RATE_PARENT);
> +static CLK_FIXED_FACTOR_HWS(pll_video_1x_clk, "pll-video-1x",
> +			    pll_video_4x_hws, 4, 1, CLK_SET_RATE_PARENT);

Ah, here you are using the pointer reference to the base clock, not the
string, as above. I think we should stick to one method?

> +/*
> + * For CSI PLLs, the output divider is described as "only for testing"
> + * in the user manual. So it's not modelled and forced to 0.

Same situation as for the video PLL: what is the recommended setting of
bit 0, really?

> + */
> +#define SUN8I_V853_PLL_CSI_REG		0x048
> +static struct ccu_nm pll_csi_4x_clk = {
> +	.enable		= BIT(27) | BIT(30) | BIT(31),
> +	.lock		= BIT(28),
> +	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
> +	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
> +	.common		= {
> +		.reg		= 0x048,
> +		.hw.init	= CLK_HW_INIT_PARENTS_DATA("pll-csi-4x", osc24M,
> +							   &ccu_nm_ops,
> +							   CLK_SET_RATE_UNGATE),
> +	},
> +};
> +
> +static CLK_FIXED_FACTOR_HW(pll_csi_clk, "pll-csi",
> +			    &pll_csi_4x_clk.common.hw, 4, 1, CLK_SET_RATE_PARENT);
> +
> +
> +#define SUN8I_V853_PLL_AUDIO_REG		0x78
> +static struct ccu_sdm_setting pll_audio_div5_sdm_table[] = {
> +	{ .rate = 196608000, .pattern = 0xc001eb85, .m = 5, .n = 40 }, /* 24.576 */
> +	{ .rate = 67737600, .pattern = 0xc001288d, .m = 8, .n = 22 }, /* 22.5792 */
> +};
> +
> +static struct ccu_nm pll_audio_div5_clk = {
> +	.enable		= BIT(27) | BIT(30) | BIT(31),
> +	.lock           = BIT(28),
> +	.n              = _SUNXI_CCU_MULT(8, 8),
> +	.m              = _SUNXI_CCU_DIV(20, 3),
> +	.sdm            = _SUNXI_CCU_SDM(pll_audio_div5_sdm_table,
> +				    BIT(24), 0x0178, BIT(31)),
> +	.common         = {
> +		.reg            = 0x0078,
> +		.features       = CCU_FEATURE_SIGMA_DELTA_MOD,
> +		.hw.init        = CLK_HW_INIT_PARENTS_DATA("pll-audio-div5", osc24M,
> +							   &ccu_nm_ops,
> +							   CLK_SET_RATE_UNGATE),
> +	},
> +};
> +static SUNXI_CCU_M(pll_audio_1x_clk, "pll-audio-1x", "pll-audio-div5",
> +		0xe00, 0, 5, CLK_SET_RATE_PARENT);
> +
> +/* pll-audio-div2 and pll-aduio-4x not used, because audio-1x can cover 22.5792M and 24.576M */
> +static SUNXI_CCU_M(pll_audio_div2_clk, "pll-audio-div2", "pll-audio",
> +		0x078, 16, 3, 0);
> +static SUNXI_CCU_M(pll_audio_4x_clk, "pll-audio-4x", "pll-audio-div2",
> +		0xe00, 5, 5, 0);
> +
> +/*
> + * For the NPU PLL, the output divider is described as "only for testing"
> + * in the user manual. So it's not modelled and forced to 0.
> + */
> +#define SUN8I_V853_PLL_NPU_REG		0x080
> +static struct ccu_nm pll_npu_4x_clk = {
> +	.enable		= BIT(27) | BIT(30) | BIT(31),
> +	.lock		= BIT(28),
> +	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
> +	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
> +	.common		= {
> +		.reg		= 0x080,
> +		.hw.init	= CLK_HW_INIT_PARENTS_DATA("pll-npu-4x", osc24M,
> +							   &ccu_nm_ops,
> +							   CLK_SET_RATE_UNGATE),
> +	},
> +};
> +
> +/*
> + * The CPU gate is not modelled - it is in a separate register (0x504)
> + * and has a special key field. The clock does not need to be ungated anyway.

I would believe it should read: "The clock must not be gated anyway by
the kernel". (As it would stop execution on the Arm cores, so it's only
something for the management core).

> + */
> +static const struct clk_parent_data cpu_parents[] = {
> +	{ .fw_name = "hosc" },
> +	{ .fw_name = "losc" },
> +	{ .fw_name = "iosc" },
> +	{ .hw = &pll_cpu_clk.common.hw },

The manual says there is a divider (PLL_CPU_OUT_EXT_DIVP[17:16]),
though the description suggests it should stay as 0. I guess this is
the intention here, but can you please add comment here?

> +	{ .hw = &pll_periph_600M_clk.hw },
> +	{ .hw = &pll_periph_800M_clk.common.hw },
> +};
> +
> +static SUNXI_CCU_MUX_DATA(cpu_clk, "cpu", cpu_parents,
> +			  0x500, 24, 3, CLK_SET_RATE_PARENT | CLK_IS_CRITICAL);
> +
> +static SUNXI_CCU_M(cpu_axi_clk, "cpu-axi", "cpu",

I wonder if it's more efficient to use a pointer to the CPU clock, and
not a string?

> +		       0x500, 0, 2, 0);
> +static SUNXI_CCU_M(cpu_apb_clk, "cpu-apb", "cpu",
> +		       0x500, 8, 2, 0);
> +
> +static const struct clk_parent_data ahb_parents[] = {
> +	{ .fw_name = "hosc" },
> +	{ .fw_name = "losc" },
> +	{ .fw_name = "iosc" },
> +	{ .hw = &pll_periph_600M_clk.hw },
> +};
> +static SUNXI_CCU_MP_DATA_WITH_MUX(ahb_clk, "ahb", ahb_parents, 0x510,
> +				  0, 5,		/* M */
> +				  8, 2,		/* P */
> +				  24, 2,	/* mux */
> +				  0);
> +
> +static SUNXI_CCU_MP_DATA_WITH_MUX(apb0_clk, "apb0", ahb_parents, 0x520,
> +				  0, 5,		/* M */
> +				  8, 2,		/* P */
> +				  24, 2,	/* mux */
> +				  0);
> +
> +static SUNXI_CCU_MP_DATA_WITH_MUX(apb1_clk, "apb1", ahb_parents, 0x524,
> +				  0, 5,		/* M */
> +				  8, 2,		/* P */
> +				  24, 2,	/* mux */
> +				  0);
> +
> +static const struct clk_hw *ahb_hws[] = { &ahb_clk.common.hw };
> +static const struct clk_hw *apb0_hws[] = { &apb0_clk.common.hw };
> +static const struct clk_hw *apb1_hws[] = { &apb1_clk.common.hw };
> +
> +
> +
> +static const struct clk_hw *de_g2d_parents[] = {
> +	&pll_periph_300M_clk.hw,
> +	&pll_video_1x_clk.hw,
> +};
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(de_clk, "de", de_g2d_parents, 0x600,
> +				    0, 5,	/* M */
> +				    24, 1,	/* mux */
> +				    BIT(31),	/* gate */
> +				    CLK_SET_RATE_PARENT);
> +
> +static SUNXI_CCU_GATE_HWS(bus_de_clk, "bus-de", ahb_hws,
> +			  0x60c, BIT(0), 0);
> +
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(g2d_clk, "g2d", de_g2d_parents, 0x630,
> +				    0, 5,	/* M */
> +				    24, 1,	/* mux */
> +				    BIT(31),	/* gate */
> +				    CLK_SET_RATE_PARENT);
> +
> +static SUNXI_CCU_GATE_HWS(bus_g2d_clk, "bus-g2d", ahb_hws,
> +			  0x63c, BIT(0), 0);
> +
> +
> +static const struct clk_parent_data ce_parents[] = {
> +	{ .fw_name = "hosc" },

That parent is not mentioned in the manual, though it looks like an
omission. Did you find the HOSC mentioned somewhere else?

> +	{ .hw = &pll_periph_400M_clk.hw, },
> +	{ .hw = &pll_periph_300M_clk.hw, }
> +};
> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(ce_clk, "ce", ce_parents, 0x680,
> +				       0, 4,	/* M */

looks like the indentation here is a bit off, can you check this? And
for the other clocks as well?

> +				       24, 3,	/* mux */
> +				       BIT(31),	/* gate */
> +				       CLK_SET_RATE_PARENT);
> +
> +static SUNXI_CCU_GATE_HWS(bus_ce_clk, "bus-ce", ahb_hws,
> +			  0x68c, BIT(0) | BIT(1), 0);


(reviewed till here, for now, to keep my sanity. Skipping down to
below, where there are more low-hanging fruits and bits that can be
checked more systematically)

> +
> +static const struct clk_hw *ve_parents[] = {
> +	&pll_periph_300M_clk.hw,
> +	&pll_periph_400M_clk.hw,
> +	&pll_periph_480M_clk.common.hw,
> +	&pll_npu_4x_clk.common.hw,
> +	&pll_video_4x_clk.common.hw,
> +	&pll_csi_4x_clk.common.hw,
> +};
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(ve_clk, "ve", ve_parents, 0x690,
> +				    0, 5,	/* M */
> +				    24, 3,	/* mux */
> +				    BIT(31),	/* gate */
> +				    CLK_SET_RATE_PARENT);
> +
> +static SUNXI_CCU_GATE_HWS(bus_ve_clk, "bus-ve", ahb_hws,
> +			  0x69c, BIT(0), 0);
> +
> +
> +static const struct clk_hw *npu_parents[] = {
> +	&pll_periph_480M_clk.common.hw,
> +	&pll_periph_600M_clk.hw,
> +	&pll_periph_800M_clk.common.hw,
> +	&pll_npu_4x_clk.common.hw,
> +};
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(npu_clk, "npu", npu_parents, 0x6e0,
> +				    0, 5,	/* M */
> +				    24, 3,	/* mux */
> +				    BIT(31),	/* gate */
> +				    0);
> +
> +static SUNXI_CCU_GATE_HWS(bus_npu_clk, "bus-npu", ahb_hws,
> +			  0x6ec, BIT(0), 0);
> +
> +static SUNXI_CCU_GATE_HWS(bus_dma_clk, "bus-dma", ahb_hws,
> +			  0x70c, BIT(0), 0);
> +
> +static SUNXI_CCU_GATE_HWS(bus_msgbox0_clk, "bus-msgbox0", ahb_hws,
> +			  0x71c, BIT(0), 0);
> +static SUNXI_CCU_GATE_HWS(bus_msgbox1_clk, "bus-msgbox1", ahb_hws,
> +			  0x71c, BIT(1), 0);
> +
> +static SUNXI_CCU_GATE_HWS(bus_spinlock_clk, "bus-spinlock", ahb_hws,
> +			  0x72c, BIT(0), 0);
> +
> +static SUNXI_CCU_GATE_HWS(bus_hstimer_clk, "bus-hstimer", ahb_hws,
> +			  0x73c, BIT(0), 0);
> +
> +static SUNXI_CCU_GATE_DATA(avs_clk, "avs", osc24M,
> +			   0x740, BIT(31), 0);
> +
> +static SUNXI_CCU_GATE_HWS(bus_dbg_clk, "bus-dbg", ahb_hws,
> +			  0x78c, BIT(0), 0);
> +
> +static SUNXI_CCU_GATE_HWS(bus_pwm_clk, "bus-pwm", apb0_hws,
> +			  0x7ac, BIT(0), 0);
> +
> +static SUNXI_CCU_GATE_HWS(bus_iommu_clk, "bus-iommu", ahb_hws,
> +			  0x7bc, BIT(0), 0);
> +
> +static const struct clk_hw *dram_parents[] = {
> +	&pll_ddr_clk.common.hw,
> +	&pll_periph_2x_clk.common.hw,
> +	&pll_periph_800M_clk.common.hw,
> +};
> +static SUNXI_CCU_MP_HW_WITH_MUX_GATE(dram_clk, "dram", dram_parents, 0x800,
> +				     0, 5,	/* M */
> +				     8, 2,	/* P */
> +				     24, 3,	/* mux */
> +				     BIT(31), CLK_IS_CRITICAL);
> +
> +static CLK_FIXED_FACTOR_HW(mbus_clk, "mbus",
> +			   &dram_clk.common.hw, 4, 1, 0);
> +
> +static const struct clk_hw *mbus_hws[] = { &mbus_clk.hw };
> +
> +static SUNXI_CCU_GATE_HWS(mbus_dma_clk, "mbus-dma", mbus_hws,
> +			  0x804, BIT(0), 0);
> +static SUNXI_CCU_GATE_HWS(mbus_ve_clk, "mbus-ve", mbus_hws,
> +			  0x804, BIT(1), 0);
> +static SUNXI_CCU_GATE_HWS(mbus_ce_clk, "mbus-ce", mbus_hws,
> +			  0x804, BIT(2), 0);
> +static SUNXI_CCU_GATE_HWS(mbus_csi_clk, "mbus-csi", mbus_hws,
> +			  0x804, BIT(8), 0);
> +static SUNXI_CCU_GATE_HWS(mbus_isp_clk, "mbus-isp", mbus_hws,
> +			  0x804, BIT(9), 0);
> +static SUNXI_CCU_GATE_HWS(mbus_g2d_clk, "mbus-g2d", mbus_hws,
> +			  0x804, BIT(10), 0);
> +
> +static SUNXI_CCU_GATE_HWS(bus_dram_clk, "bus-dram", ahb_hws,
> +			  0x80c, BIT(0), CLK_IS_CRITICAL);
> +
> +
> +static const struct clk_parent_data mmc0_mmc1_parents[] = {
> +	{ .fw_name = "hosc" },
> +	{ .hw = &pll_periph_400M_clk.hw, },
> +	{ .hw = &pll_periph_300M_clk.hw, },
> +};
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(mmc0_clk, "mmc0", mmc0_mmc1_parents, 0x830,
> +				       0, 4,	/* M */
> +				       8, 2,	/* P */
> +				       24, 3,	/* mux */
> +				       BIT(31),	/* gate */
> +				       0);
> +
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(mmc1_clk, "mmc1", mmc0_mmc1_parents, 0x834,
> +				       0, 4,	/* M */
> +				       8, 2,	/* P */
> +				       24, 3,	/* mux */
> +				       BIT(31),	/* gate */
> +				       0);
> +
> +static const struct clk_parent_data mmc2_parents[] = {
> +	{ .fw_name = "hosc" },
> +	{ .hw = &pll_periph_600M_clk.hw, },
> +	{ .hw = &pll_periph_400M_clk.hw, },
> +};
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(mmc2_clk, "mmc2", mmc2_parents, 0x838,
> +				       0, 4,	/* M */
> +				       8, 2,	/* P */
> +				       24, 3,	/* mux */
> +				       BIT(31),	/* gate */
> +				       0);
> +
> +static SUNXI_CCU_GATE_HWS(bus_mmc0_clk, "bus-mmc0", ahb_hws,
> +			  0x84c, BIT(0), 0);
> +static SUNXI_CCU_GATE_HWS(bus_mmc1_clk, "bus-mmc1", ahb_hws,
> +			  0x84c, BIT(1), 0);
> +static SUNXI_CCU_GATE_HWS(bus_mmc2_clk, "bus-mmc2", ahb_hws,
> +			  0x84c, BIT(2), 0);
> +
> +static SUNXI_CCU_GATE_HWS(bus_uart0_clk, "bus-uart0", apb1_hws,
> +			  0x90c, BIT(0), 0);
> +static SUNXI_CCU_GATE_HWS(bus_uart1_clk, "bus-uart1", apb1_hws,
> +			  0x90c, BIT(1), 0);
> +static SUNXI_CCU_GATE_HWS(bus_uart2_clk, "bus-uart2", apb1_hws,
> +			  0x90c, BIT(2), 0);
> +static SUNXI_CCU_GATE_HWS(bus_uart3_clk, "bus-uart3", apb1_hws,
> +			  0x90c, BIT(3), 0);
> +
> +static SUNXI_CCU_GATE_HWS(bus_i2c0_clk, "bus-i2c0", apb1_hws,
> +			  0x91c, BIT(0), 0);
> +static SUNXI_CCU_GATE_HWS(bus_i2c1_clk, "bus-i2c1", apb1_hws,
> +			  0x91c, BIT(1), 0);
> +static SUNXI_CCU_GATE_HWS(bus_i2c2_clk, "bus-i2c2", apb1_hws,
> +			  0x91c, BIT(2), 0);
> +static SUNXI_CCU_GATE_HWS(bus_i2c3_clk, "bus-i2c3", apb1_hws,
> +			  0x91c, BIT(3), 0);
> +static SUNXI_CCU_GATE_HWS(bus_i2c4_clk, "bus-i2c4", apb1_hws,
> +			  0x91c, BIT(4), 0);
> +
> +static const struct clk_parent_data spi_parents[] = {
> +	{ .fw_name = "hosc" },
> +	{ .hw = &pll_periph_300M_clk.hw, },
> +	{ .hw = &pll_periph_200M_clk.hw, },
> +};
> +
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(spi0_clk, "spi0", spi_parents, 0x940,
> +				       0, 4,	/* M */
> +				       8, 2,	/* P */
> +				       24, 3,	/* mux */
> +				       BIT(31),	/* gate */
> +				       0);
> +
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(spi1_clk, "spi1", spi_parents, 0x944,
> +				       0, 4,	/* M */
> +				       8, 2,	/* P */
> +				       24, 3,	/* mux */
> +				       BIT(31),	/* gate */
> +				       0);
> +
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(spi2_clk, "spi2", spi_parents, 0x948,
> +				       0, 4,	/* M */
> +				       8, 2,	/* P */
> +				       24, 3,	/* mux */
> +				       BIT(31),	/* gate */
> +				       0);
> +
> +static SUNXI_CCU_MP_DATA_WITH_MUX_GATE(spi3_clk, "spi3", spi_parents, 0x94c,
> +				       0, 4,	/* M */
> +				       8, 2,	/* P */
> +				       24, 3,	/* mux */
> +				       BIT(31),	/* gate */
> +				       0);
> +
> +static SUNXI_CCU_GATE_HWS(bus_spi0_clk, "bus-spi0", ahb_hws,
> +			  0x96c, BIT(0), 0);
> +static SUNXI_CCU_GATE_HWS(bus_spi1_clk, "bus-spi1", ahb_hws,
> +			  0x96c, BIT(1), 0);
> +static SUNXI_CCU_GATE_HWS(bus_spi2_clk, "bus-spi2", ahb_hws,
> +			  0x96c, BIT(2), 0);
> +static SUNXI_CCU_GATE_HWS(bus_spi3_clk, "bus-spi3", ahb_hws,
> +			  0x96c, BIT(3), 0);
> +
> +
> +static const struct clk_parent_data spif_parents[] = {
> +	{ .fw_name = "hosc" },
> +	{ .hw = &pll_periph_400M_clk.hw, },
> +	{ .hw = &pll_periph_300M_clk.hw, },
> +};
> +
> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(spif_clk, "spif", spif_parents, 0x0950,
> +					0, 4,	 /* M */
> +					24, 3,	 /* mux */
> +					BIT(31), /* gate */
> +					CLK_SET_RATE_PARENT);
> +
> +static SUNXI_CCU_GATE_HWS(bus_spif_clk, "bus-spif", ahb_hws,
> +			    0x096c, BIT(4), 0);
> +
> +
> +static const struct clk_hw *pll_periph_150M_hws[] = { &pll_periph_150M_clk.hw };
> +static SUNXI_CCU_GATE_HWS_WITH_PREDIV(emac_25M_clk, "emac-25M", pll_periph_150M_hws,
> +				      0x970, BIT(31) | BIT(30), 6, 0);
> +
> +static SUNXI_CCU_GATE_HWS(bus_emac_clk, "bus-emac", ahb_hws,
> +			  0x97c, BIT(0), 0);
> +
> +static SUNXI_CCU_GATE_HWS(bus_gpadc_clk, "bus-gpadc", apb0_hws,
> +			  0x9ec, BIT(0), 0);
> +
> +static SUNXI_CCU_GATE_HWS(bus_ths_clk, "bus-ths", ahb_hws,
> +			  0x9fc, BIT(0), 0);
> +
> +
> +static const struct clk_hw *audio_parents[] = {
> +	&pll_audio_1x_clk.common.hw,
> +	&pll_audio_4x_clk.common.hw,
> +};
> +
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(i2s0_clk, "i2s0", audio_parents, 0xa10,
> +				     0, 4,	/* M */
> +				     24, 1,	/* mux */
> +				     BIT(31),	/* gate */
> +				     CLK_SET_RATE_PARENT);
> +
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(i2s1_clk, "i2s1", audio_parents, 0xa14,
> +				     0, 4,	/* M */
> +				     24, 1,	/* mux */
> +				     BIT(31),	/* gate */
> +				     CLK_SET_RATE_PARENT);
> +
> +static SUNXI_CCU_GATE_HWS(bus_i2s1_clk, "bus-i2s1", ahb_hws,
> +			  0xa20, BIT(1), 0);
> +

Just a nit, but those two here  v  and ^  seem to be swapped.

For the records: I extracted the bus gates and massaged them with some
regexps to bring them into a shape where review is more feasible.
They look alright to me. I didn't look at the respective mod clocks in
detail, though.


> +static SUNXI_CCU_GATE_HWS(bus_i2s0_clk, "bus-i2s0", ahb_hws,
> +			  0xa20, BIT(0), 0);
> +
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(dmic_clk, "dmic", audio_parents, 0xa40,
> +				     0, 4,	/* M */
> +				     24, 1,	/* mux */
> +				     BIT(31),	/* gate */
> +				     CLK_SET_RATE_PARENT);
> +
> +static SUNXI_CCU_GATE_HWS(bus_dmic_clk, "bus-dmic", ahb_hws,
> +			  0xa4c, BIT(0), 0);
> +
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(audio_codec_dac_clk, "audio-codec-dac", audio_parents, 0xa50,

I think you should break the line above, to stay within the 80 char
limit.

Fast forwarding to the ccu_resets array ...

> +				     0, 4,	/* M */
> +				     24, 1,	/* mux */
> +				     BIT(31),	/* gate */
> +				     CLK_SET_RATE_PARENT);
> +
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(audio_codec_adc_clk, "audio-codec-adc", audio_parents, 0xa54,
> +				     0, 4,	/* M */
> +				     24, 1,	/* mux */
> +				     BIT(31),	/* gate */
> +				     CLK_SET_RATE_PARENT);
> +
> +static SUNXI_CCU_GATE_HWS(bus_audio_codec_clk, "bus-audio-codec", apb0_hws,
> +			  0xa5c, BIT(0), 0);
> +
> +/*
> + * There are OHCI 12M clock source selection bits for the USB 2.0 port.
> + * We will force them to 0 (12M divided from 48M).
> + */
> +static CLK_FIXED_FACTOR_FW_NAME(osc12M_clk, "osc12M", "hosc", 2, 1, 0);
> +
> +#define SUN8I_V853_USB_CLK_REG		0xa70
> +
> +static SUNXI_CCU_GATE(usb_ohci_clk, "usb", "osc12M", 0x0a70, BIT(31), 0);
> +
> +static SUNXI_CCU_GATE_HWS(bus_ohci_clk, "bus-ohci", ahb_hws, 0xa8c, BIT(0), 0);
> +static SUNXI_CCU_GATE_HWS(bus_ehci_clk, "bus-ehci", ahb_hws, 0xa8c, BIT(4), 0);
> +static SUNXI_CCU_GATE_HWS(bus_otg_clk, "bus-otg", ahb_hws, 0xa8c, BIT(8), 0);
> +
> +static SUNXI_CCU_GATE_HWS(bus_dpss_top_clk, "bus-dpss-top", ahb_hws,
> +			  0xabc, BIT(0), 0);
> +
> +
> +static const struct clk_parent_data mipi_dsi_parents[] = {
> +	{ .fw_name = "hosc" },
> +	{ .hw = &pll_periph_200M_clk.hw },
> +	{ .hw = &pll_periph_150M_clk.hw },
> +};
> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(mipi_dsi_clk, "mipi-dsi", mipi_dsi_parents, 0xb24,
> +				      0, 4,	/* M */
> +				      24, 3,	/* mux */
> +				      BIT(31),	/* gate */
> +				      CLK_SET_RATE_PARENT);
> +
> +static SUNXI_CCU_GATE_HWS(bus_mipi_dsi_clk, "bus-mipi-dsi", ahb_hws,
> +			  0xb4c, BIT(0), 0);
> +
> +
> +static const struct clk_hw *tcon_lcd_parents[] = {
> +	&pll_video_4x_clk.common.hw,
> +	&pll_periph_2x_clk.common.hw,
> +	&pll_csi_4x_clk.common.hw,
> +};
> +static SUNXI_CCU_MP_HW_WITH_MUX_GATE(tcon_lcd_clk, "tcon-lcd", tcon_lcd_parents, 0xb60,
> +				     0, 4,	/* M */
> +				     8, 2,	/* P */
> +				     24, 3,	/* mux */
> +				     BIT(31),	/* gate */
> +				     CLK_SET_RATE_PARENT);
> +
> +static SUNXI_CCU_GATE_HWS(bus_tcon_lcd_clk, "bus-tcon-lcd", ahb_hws,
> +			  0xb7c, BIT(0), 0);
> +
> +
> +static const struct clk_hw *csi_top_parents[] = {
> +	&pll_periph_300M_clk.hw,
> +	&pll_periph_400M_clk.hw,
> +	&pll_video_4x_clk.common.hw,
> +	&pll_csi_4x_clk.common.hw,
> +};
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(csi_top_clk, "csi-top", csi_top_parents, 0xc04,
> +				    0, 5,	/* M */
> +				    24, 3,	/* mux */
> +				    BIT(31),	/* gate */
> +				    0);
> +
> +
> +static const struct clk_parent_data csi_mclk_parents[] = {
> +	{ .fw_name = "hosc" },
> +	{ .hw = &pll_csi_4x_clk.common.hw },
> +	{ .hw = &pll_video_4x_clk.common.hw },
> +	{ .hw = &pll_periph_2x_clk.common.hw },
> +};
> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(csi_mclk0_clk, "csi-mclk0", csi_mclk_parents, 0xc08,
> +				      0, 5,	/* M */
> +				      24, 3,	/* mux */
> +				      BIT(31),	/* gate */
> +				      0);
> +
> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(csi_mclk1_clk, "csi-mclk1", csi_mclk_parents, 0xc0c,
> +				      0, 5,	/* M */
> +				      24, 3,	/* mux */
> +				      BIT(31),	/* gate */
> +				      0);
> +
> +static SUNXI_CCU_M_DATA_WITH_MUX_GATE(csi_mclk2_clk, "csi-mclk2", csi_mclk_parents, 0xc10,
> +				      0, 5,	/* M */
> +				      24, 3,	/* mux */
> +				      BIT(31),	/* gate */
> +				      0);
> +
> +static SUNXI_CCU_GATE_HWS(bus_csi_clk, "bus-csi", ahb_hws,
> +			  0xc2c, BIT(0), 0);
> +
> +
> +static SUNXI_CCU_GATE_HWS(bus_wiegand_clk, "bus-wiegand", ahb_hws,
> +			  0xc7c, BIT(0), 0);
> +
> +
> +static const struct clk_parent_data riscv_parents[] = {
> +	{ .fw_name = "hosc" },
> +	{ .fw_name = "losc" },
> +	{ .fw_name = "iosc" },
> +	{ .hw = &pll_periph_600M_clk.hw },
> +	{ .hw = &pll_periph_480M_clk.common.hw },
> +	{ .hw = &pll_cpu_clk.common.hw },
> +};
> +static SUNXI_CCU_M_DATA_WITH_MUX(riscv_clk, "riscv-cpu", riscv_parents, 0xd00,
> +				 0, 5,	/* M */
> +				 24, 3,	/* mux */
> +				 CLK_SET_RATE_PARENT);
> +
> +/* The riscv-axi clk must be divided by at least 2. */
> +static struct clk_div_table riscv_axi_table[] = {
> +	{ .val = 1, .div = 2 },
> +	{ .val = 2, .div = 3 },
> +	{ .val = 3, .div = 4 },
> +	{ /* Sentinel */ }
> +};
> +static SUNXI_CCU_DIV_TABLE_HW(riscv_axi_clk, "riscv-axi", &riscv_clk.common.hw,
> +			      0xd00, 8, 2, riscv_axi_table, 0);
> +
> +
> +static SUNXI_CCU_GATE_HWS(riscv_cfg, "riscv-cfg", ahb_hws,
> +			 0xd0c, BIT(0), 0);
> +
> +static const struct clk_hw *pll_periph_160M_hws[] = {
> +	&pll_periph_160M_clk.hw,
> +};
> +
> +static SUNXI_CCU_GATE_DATA(fanout_24M_clk, "fanout-24M", osc24M,
> +				0xf30, BIT(0), 0);
> +static SUNXI_CCU_GATE_DATA_WITH_PREDIV(fanout_12M_clk, "fanout-12M", osc24M,
> +				0xf30, BIT(1), 2, 0);
> +static SUNXI_CCU_GATE_HWS_WITH_PREDIV(fanout_16M_clk, "fanout-16M", pll_periph_160M_hws,
> +				0xf30, BIT(2), 10, 0);
> +static SUNXI_CCU_GATE_HWS_WITH_PREDIV(fanout_25M_clk, "fanout-25M", pll_periph_150M_hws,
> +				0xf30, BIT(3), 6, 0);
> +
> +
> +
> +/* This clock has a second divider that is not modelled and forced to 0. */
> +#define SUN8I_V853_FANOUT_27M_REG	0xf34
> +static const struct clk_hw *fanout_27M_parents[] = {
> +	&pll_video_1x_clk.hw,
> +	&pll_csi_clk.hw,
> +	&pll_periph_300M_clk.hw,
> +};
> +static SUNXI_CCU_M_HW_WITH_MUX_GATE(fanout_27M_clk, "fanout-27M", fanout_27M_parents, 0xf34,
> +				    0, 5,	/* M */
> +				    24, 2,	/* mux */
> +				    BIT(31),	/* gate */
> +				    0);
> +static SUNXI_CCU_M_HWS_WITH_GATE(fanout_pclk_clk, "fanout-pclk", apb0_hws, 0xf38,
> +				    0, 5,	/* M */
> +				    BIT(31),	/* gate */
> +				    0);
> +
> +static const struct clk_parent_data fanout_parents[] = {
> +	{ .fw_name = "losc" },
> +	{ .hw = &fanout_12M_clk.common.hw },
> +	{ .hw = &fanout_16M_clk.common.hw },
> +	{ .hw = &fanout_24M_clk.common.hw },
> +	{ .hw = &fanout_25M_clk.common.hw },
> +	{ .hw = &fanout_27M_clk.common.hw },
> +	{ .hw = &fanout_pclk_clk.common.hw },
> +};
> +
> +static SUNXI_CCU_MUX_DATA_WITH_GATE(fanout0_clk, "fanout0", fanout_parents, 0xf3c,
> +				  0, 3,		/* mux */
> +				  BIT(21),	/* gate */
> +				  0);
> +static SUNXI_CCU_MUX_DATA_WITH_GATE(fanout1_clk, "fanout1", fanout_parents, 0xf3c,
> +				  3, 3,		/* mux */
> +				  BIT(22),	/* gate */
> +				  0);
> +static SUNXI_CCU_MUX_DATA_WITH_GATE(fanout2_clk, "fanout2", fanout_parents, 0xf3c,
> +				  6, 3,		/* mux */
> +				  BIT(23),	/* gate */
> +				  0);
> +
> +
> +static struct ccu_common *sun8i_v853_ccu_clks[] = {
> +	&pll_cpu_clk.common,
> +	&pll_ddr_clk.common,
> +	&pll_periph_4x_clk.common,
> +	&pll_periph_2x_clk.common,
> +	&pll_periph_800M_clk.common,
> +	&pll_periph_480M_clk.common,
> +	&pll_video_4x_clk.common,
> +	&pll_csi_4x_clk.common,
> +	&pll_audio_div2_clk.common,
> +	&pll_audio_div5_clk.common,
> +	&pll_audio_4x_clk.common,
> +	&pll_audio_1x_clk.common,
> +	&pll_npu_4x_clk.common,
> +	&cpu_clk.common,
> +	&cpu_axi_clk.common,
> +	&cpu_apb_clk.common,
> +	&ahb_clk.common,
> +	&apb0_clk.common,
> +	&apb1_clk.common,
> +	&de_clk.common,
> +	&bus_de_clk.common,
> +	&g2d_clk.common,
> +	&bus_g2d_clk.common,
> +	&ce_clk.common,
> +	&bus_ce_clk.common,
> +	&ve_clk.common,
> +	&bus_ve_clk.common,
> +	&npu_clk.common,
> +	&bus_npu_clk.common,
> +	&bus_dma_clk.common,
> +	&bus_msgbox0_clk.common,
> +	&bus_msgbox1_clk.common,
> +	&bus_spinlock_clk.common,
> +	&bus_hstimer_clk.common,
> +	&avs_clk.common,
> +	&bus_dbg_clk.common,
> +	&bus_pwm_clk.common,
> +	&bus_iommu_clk.common,
> +	&dram_clk.common,
> +	&mbus_dma_clk.common,
> +	&mbus_ve_clk.common,
> +	&mbus_ce_clk.common,
> +	&mbus_csi_clk.common,
> +	&mbus_isp_clk.common,
> +	&mbus_g2d_clk.common,
> +	&bus_dram_clk.common,
> +	&mmc0_clk.common,
> +	&mmc1_clk.common,
> +	&mmc2_clk.common,
> +	&bus_mmc0_clk.common,
> +	&bus_mmc1_clk.common,
> +	&bus_mmc2_clk.common,
> +	&bus_uart0_clk.common,
> +	&bus_uart1_clk.common,
> +	&bus_uart2_clk.common,
> +	&bus_uart3_clk.common,
> +	&bus_i2c0_clk.common,
> +	&bus_i2c1_clk.common,
> +	&bus_i2c2_clk.common,
> +	&bus_i2c3_clk.common,
> +	&bus_i2c4_clk.common,
> +	&spi0_clk.common,
> +	&spi1_clk.common,
> +	&spi2_clk.common,
> +	&spi3_clk.common,
> +	&bus_spi0_clk.common,
> +	&bus_spi1_clk.common,
> +	&bus_spi2_clk.common,
> +	&bus_spi3_clk.common,
> +	&spif_clk.common,
> +	&bus_spif_clk.common,
> +	&emac_25M_clk.common,
> +	&bus_emac_clk.common,
> +	&bus_gpadc_clk.common,
> +	&bus_ths_clk.common,
> +	&usb_ohci_clk.common,
> +	&bus_ohci_clk.common,
> +	&bus_ehci_clk.common,
> +	&bus_otg_clk.common,
> +	&i2s0_clk.common,
> +	&i2s1_clk.common,
> +	&bus_i2s0_clk.common,
> +	&bus_i2s1_clk.common,
> +	&dmic_clk.common,
> +	&bus_dmic_clk.common,
> +	&audio_codec_dac_clk.common,
> +	&audio_codec_adc_clk.common,
> +	&bus_audio_codec_clk.common,
> +	&bus_dpss_top_clk.common,
> +	&mipi_dsi_clk.common,
> +	&bus_mipi_dsi_clk.common,
> +	&tcon_lcd_clk.common,
> +	&bus_tcon_lcd_clk.common,
> +	&csi_top_clk.common,
> +	&csi_mclk0_clk.common,
> +	&csi_mclk1_clk.common,
> +	&csi_mclk2_clk.common,
> +	&bus_csi_clk.common,
> +	&bus_wiegand_clk.common,
> +	&riscv_clk.common,
> +	&riscv_axi_clk.common,
> +	&riscv_cfg.common,
> +	&fanout_24M_clk.common,
> +	&fanout_12M_clk.common,
> +	&fanout_16M_clk.common,
> +	&fanout_25M_clk.common,
> +	&fanout_27M_clk.common,
> +	&fanout_pclk_clk.common,
> +	&fanout0_clk.common,
> +	&fanout1_clk.common,
> +	&fanout2_clk.common,
> +};
> +
> +static struct clk_hw_onecell_data sun8i_v853_hw_clks = {
> +	.num	= CLK_NUMBER,
> +	.hws	= {
> +		[CLK_OSC12M]            = &osc12M_clk.hw,
> +		[CLK_PLL_CPU]		= &pll_cpu_clk.common.hw,
> +		[CLK_PLL_DDR]		= &pll_ddr_clk.common.hw,
> +		[CLK_PLL_PERIPH_4X]	= &pll_periph_4x_clk.common.hw,
> +		[CLK_PLL_PERIPH_2X]	= &pll_periph_2x_clk.common.hw,
> +		[CLK_PLL_PERIPH_800M]	= &pll_periph_800M_clk.common.hw,
> +		[CLK_PLL_PERIPH_480M]	= &pll_periph_480M_clk.common.hw,
> +		[CLK_PLL_PERIPH_600M]	= &pll_periph_600M_clk.hw,
> +		[CLK_PLL_PERIPH_400M]	= &pll_periph_400M_clk.hw,
> +		[CLK_PLL_PERIPH_300M]	= &pll_periph_300M_clk.hw,
> +		[CLK_PLL_PERIPH_200M]	= &pll_periph_200M_clk.hw,
> +		[CLK_PLL_PERIPH_160M]	= &pll_periph_160M_clk.hw,
> +		[CLK_PLL_PERIPH_150M]	= &pll_periph_150M_clk.hw,
> +		[CLK_PLL_VIDEO_4X]	= &pll_video_4x_clk.common.hw,
> +		[CLK_PLL_VIDEO_2X]	= &pll_video_2x_clk.hw,
> +		[CLK_PLL_VIDEO_1X]	= &pll_video_1x_clk.hw,
> +		[CLK_PLL_CSI_4X]	= &pll_csi_4x_clk.common.hw,
> +		[CLK_PLL_AUDIO_DIV2]	= &pll_audio_div2_clk.common.hw,
> +		[CLK_PLL_AUDIO_DIV5]	= &pll_audio_div5_clk.common.hw,
> +		[CLK_PLL_AUDIO_4X]	= &pll_audio_4x_clk.common.hw,
> +		[CLK_PLL_AUDIO_1X]	= &pll_audio_1x_clk.common.hw,
> +		[CLK_PLL_NPU_4X]	= &pll_npu_4x_clk.common.hw,
> +		[CLK_CPU]		= &cpu_clk.common.hw,
> +		[CLK_CPU_AXI]		= &cpu_axi_clk.common.hw,
> +		[CLK_CPU_APB]		= &cpu_apb_clk.common.hw,
> +		[CLK_AHB]		= &ahb_clk.common.hw,
> +		[CLK_APB0]		= &apb0_clk.common.hw,
> +		[CLK_APB1]		= &apb1_clk.common.hw,
> +		[CLK_MBUS]		= &mbus_clk.hw,
> +		[CLK_DE]		= &de_clk.common.hw,
> +		[CLK_BUS_DE]		= &bus_de_clk.common.hw,
> +		[CLK_G2D]		= &g2d_clk.common.hw,
> +		[CLK_BUS_G2D]		= &bus_g2d_clk.common.hw,
> +		[CLK_CE]		= &ce_clk.common.hw,
> +		[CLK_BUS_CE]		= &bus_ce_clk.common.hw,
> +		[CLK_VE]		= &ve_clk.common.hw,
> +		[CLK_BUS_VE]		= &bus_ve_clk.common.hw,
> +		[CLK_NPU]		= &npu_clk.common.hw,
> +		[CLK_BUS_NPU]		= &bus_npu_clk.common.hw,
> +		[CLK_BUS_DMA]		= &bus_dma_clk.common.hw,
> +		[CLK_BUS_MSGBOX0]	= &bus_msgbox0_clk.common.hw,
> +		[CLK_BUS_MSGBOX1]	= &bus_msgbox1_clk.common.hw,
> +		[CLK_BUS_SPINLOCK]	= &bus_spinlock_clk.common.hw,
> +		[CLK_BUS_HSTIMER]	= &bus_hstimer_clk.common.hw,
> +		[CLK_AVS]		= &avs_clk.common.hw,
> +		[CLK_BUS_DBG]		= &bus_dbg_clk.common.hw,
> +		[CLK_BUS_PWM]		= &bus_pwm_clk.common.hw,
> +		[CLK_BUS_IOMMU]		= &bus_iommu_clk.common.hw,
> +		[CLK_DRAM]		= &dram_clk.common.hw,
> +		[CLK_MBUS_DMA]		= &mbus_dma_clk.common.hw,
> +		[CLK_MBUS_VE]		= &mbus_ve_clk.common.hw,
> +		[CLK_MBUS_CE]		= &mbus_ce_clk.common.hw,
> +		[CLK_MBUS_CSI]		= &mbus_csi_clk.common.hw,
> +		[CLK_MBUS_ISP]		= &mbus_isp_clk.common.hw,
> +		[CLK_MBUS_G2D]		= &mbus_g2d_clk.common.hw,
> +		[CLK_BUS_DRAM]		= &bus_dram_clk.common.hw,
> +		[CLK_MMC0]		= &mmc0_clk.common.hw,
> +		[CLK_MMC1]		= &mmc1_clk.common.hw,
> +		[CLK_MMC2]		= &mmc2_clk.common.hw,
> +		[CLK_BUS_MMC0]		= &bus_mmc0_clk.common.hw,
> +		[CLK_BUS_MMC1]		= &bus_mmc1_clk.common.hw,
> +		[CLK_BUS_MMC2]		= &bus_mmc2_clk.common.hw,
> +		[CLK_BUS_UART0]		= &bus_uart0_clk.common.hw,
> +		[CLK_BUS_UART1]		= &bus_uart1_clk.common.hw,
> +		[CLK_BUS_UART2]		= &bus_uart2_clk.common.hw,
> +		[CLK_BUS_UART3]		= &bus_uart3_clk.common.hw,
> +		[CLK_BUS_I2C0]		= &bus_i2c0_clk.common.hw,
> +		[CLK_BUS_I2C1]		= &bus_i2c1_clk.common.hw,
> +		[CLK_BUS_I2C2]		= &bus_i2c2_clk.common.hw,
> +		[CLK_BUS_I2C3]		= &bus_i2c3_clk.common.hw,
> +		[CLK_BUS_I2C4]		= &bus_i2c4_clk.common.hw,
> +		[CLK_SPI0]		= &spi0_clk.common.hw,
> +		[CLK_SPI1]		= &spi1_clk.common.hw,
> +		[CLK_SPI2]		= &spi2_clk.common.hw,
> +		[CLK_SPI3]		= &spi3_clk.common.hw,
> +		[CLK_BUS_SPI0]		= &bus_spi0_clk.common.hw,
> +		[CLK_BUS_SPI1]		= &bus_spi1_clk.common.hw,
> +		[CLK_BUS_SPI2]		= &bus_spi2_clk.common.hw,
> +		[CLK_BUS_SPI3]		= &bus_spi3_clk.common.hw,
> +		[CLK_SPIF]		= &spif_clk.common.hw,
> +		[CLK_BUS_SPIF]		= &bus_spif_clk.common.hw,
> +		[CLK_EMAC_25M]		= &emac_25M_clk.common.hw,
> +		[CLK_BUS_EMAC]		= &bus_emac_clk.common.hw,
> +		[CLK_BUS_GPADC]		= &bus_gpadc_clk.common.hw,
> +		[CLK_BUS_THS]		= &bus_ths_clk.common.hw,
> +		[CLK_I2S0]		= &i2s0_clk.common.hw,
> +		[CLK_I2S1]		= &i2s1_clk.common.hw,
> +		[CLK_BUS_I2S0]		= &bus_i2s0_clk.common.hw,
> +		[CLK_BUS_I2S1]		= &bus_i2s1_clk.common.hw,
> +		[CLK_DMIC]		= &dmic_clk.common.hw,
> +		[CLK_BUS_DMIC]		= &bus_dmic_clk.common.hw,
> +		[CLK_AUDIO_CODEC_DAC]	= &audio_codec_dac_clk.common.hw,
> +		[CLK_AUDIO_CODEC_ADC]	= &audio_codec_adc_clk.common.hw,
> +		[CLK_BUS_AUDIO_CODEC]	= &bus_audio_codec_clk.common.hw,
> +		[CLK_USB_OHCI]		= &usb_ohci_clk.common.hw,
> +		[CLK_BUS_OHCI]		= &bus_ohci_clk.common.hw,
> +		[CLK_BUS_EHCI]		= &bus_ehci_clk.common.hw,
> +		[CLK_BUS_OTG]		= &bus_otg_clk.common.hw,
> +		[CLK_BUS_DPSS_TOP]	= &bus_dpss_top_clk.common.hw,
> +		[CLK_MIPI_DSI]		= &mipi_dsi_clk.common.hw,
> +		[CLK_BUS_MIPI_DSI]	= &bus_mipi_dsi_clk.common.hw,
> +		[CLK_TCON_LCD]		= &tcon_lcd_clk.common.hw,
> +		[CLK_BUS_TCON_LCD]	= &bus_tcon_lcd_clk.common.hw,
> +		[CLK_CSI_TOP]		= &csi_top_clk.common.hw,
> +		[CLK_CSI_MCLK0]		= &csi_mclk0_clk.common.hw,
> +		[CLK_CSI_MCLK1]		= &csi_mclk1_clk.common.hw,
> +		[CLK_CSI_MCLK2]		= &csi_mclk2_clk.common.hw,
> +		[CLK_BUS_CSI]		= &bus_csi_clk.common.hw,
> +		[CLK_BUS_WIEGAND]	= &bus_wiegand_clk.common.hw,
> +		[CLK_RISCV]		= &riscv_clk.common.hw,
> +		[CLK_RISCV_AXI]		= &riscv_axi_clk.common.hw,
> +		[CLK_RISCV_CFG]         = &riscv_cfg.common.hw,
> +		[CLK_FANOUT_24M]	= &fanout_24M_clk.common.hw,
> +		[CLK_FANOUT_16M]	= &fanout_16M_clk.common.hw,
> +		[CLK_FANOUT_12M]	= &fanout_12M_clk.common.hw,
> +		[CLK_FANOUT_25M]	= &fanout_25M_clk.common.hw,
> +		[CLK_FANOUT_27M]	= &fanout_27M_clk.common.hw,
> +		[CLK_FANOUT_PCLK]	= &fanout_pclk_clk.common.hw,
> +		[CLK_FANOUT0]		= &fanout0_clk.common.hw,
> +		[CLK_FANOUT1]		= &fanout1_clk.common.hw,
> +		[CLK_FANOUT2]		= &fanout2_clk.common.hw,
> +	},
> +};
> +
> +static struct ccu_reset_map sun8i_v853_ccu_resets[] = {
> +	[RST_MBUS]		= { 0x540, BIT(30) },
> +	[RST_BUS_DE]		= { 0x60c, BIT(16) },
> +	[RST_BUS_G2D]		= { 0x63c, BIT(16) },
> +	[RST_BUS_CE]		= { 0x68c, BIT(16) | BIT(17)},
> +	[RST_BUS_VE]		= { 0x69c, BIT(16) },
> +	[RST_BUS_NPU]		= { 0x6ec, BIT(16) },
> +	[RST_BUS_DMA]		= { 0x70c, BIT(16) },
> +	[RST_BUS_MSGBOX0]	= { 0x71c, BIT(16) },
> +	[RST_BUS_MSGBOX1]	= { 0x71c, BIT(17) },
> +	[RST_BUS_SPINLOCK]	= { 0x72c, BIT(16) },
> +	[RST_BUS_HSTIMER]	= { 0x73c, BIT(16) },
> +	[RST_BUS_DBG]		= { 0x78c, BIT(16) },
> +	[RST_BUS_PWM]		= { 0x7ac, BIT(16) },
> +	[RST_BUS_DRAM]		= { 0x80c, BIT(16) },
> +	[RST_BUS_MMC0]		= { 0x84c, BIT(16) },
> +	[RST_BUS_MMC1]		= { 0x84c, BIT(17) },
> +	[RST_BUS_MMC2]		= { 0x84c, BIT(18) },
> +	[RST_BUS_UART0]		= { 0x90c, BIT(16) },
> +	[RST_BUS_UART1]		= { 0x90c, BIT(17) },
> +	[RST_BUS_UART2]		= { 0x90c, BIT(18) },
> +	[RST_BUS_UART3]		= { 0x90c, BIT(19) },
> +	[RST_BUS_I2C0]		= { 0x91c, BIT(16) },
> +	[RST_BUS_I2C1]		= { 0x91c, BIT(17) },
> +	[RST_BUS_I2C2]		= { 0x91c, BIT(18) },
> +	[RST_BUS_I2C3]		= { 0x91c, BIT(19) },
> +	[RST_BUS_I2C4]		= { 0x91c, BIT(20) },
> +	[RST_BUS_SPIF]		= { 0x96c, BIT(20) },

That entry ^^^^ seems out of order.

> +	[RST_BUS_SPI0]		= { 0x96c, BIT(16) },
> +	[RST_BUS_SPI1]		= { 0x96c, BIT(17) },
> +	[RST_BUS_SPI2]		= { 0x96c, BIT(18) },
> +	[RST_BUS_SPI3]		= { 0x96c, BIT(19) },
> +	[RST_BUS_EMAC]		= { 0x97c, BIT(16) },
> +	[RST_BUS_GPADC]		= { 0x9ec, BIT(16) },
> +	[RST_BUS_THS]		= { 0x9fc, BIT(16) },
> +	[RST_BUS_I2S0]		= { 0xa20, BIT(16) },
> +	[RST_BUS_I2S1]		= { 0xa20, BIT(17) },
> +	[RST_BUS_DMIC]		= { 0xa4c, BIT(16) },
> +	[RST_BUS_AUDIO_CODEC]	= { 0xa5c, BIT(16) },
> +	[RST_USB_PHY]		= { 0xa70, BIT(30) },
> +	[RST_BUS_OHCI]		= { 0xa8c, BIT(16) },
> +	[RST_BUS_EHCI]		= { 0xa8c, BIT(20) },
> +	[RST_BUS_OTG]		= { 0xa8c, BIT(24) },
> +	[RST_BUS_DPSS_TOP]	= { 0xabc, BIT(16) },
> +	[RST_BUS_MIPI_DSI]	= { 0xb4c, BIT(16) },
> +	[RST_BUS_TCON_LCD]	= { 0xb7c, BIT(16) },
> +	[RST_BUS_CSI]		= { 0xc2c, BIT(16) },
> +	[RST_BUS_WIEGAND]	= { 0xc7c, BIT(16) },
> +	[RST_RISCV_SYS_APB]	= { 0xd04, BIT(2), CCU_FEATURE_KEY_FIELD },
> +	[RST_RISCV_SOFT]	= { 0xd04, BIT(1), CCU_FEATURE_KEY_FIELD },
> +	[RST_RISCV_CLK_GATING]	= { 0xd04, BIT(0), CCU_FEATURE_KEY_FIELD },

But that's a clock gate, not a reset, right?

> +	[RST_RISCV_CFG]		= { 0xd0c, BIT(16) }

The rest of the reset bits match the manual.

> +};
> +
> +static const struct sunxi_ccu_desc sun8i_v853_ccu_desc = {
> +	.ccu_clks	= sun8i_v853_ccu_clks,
> +	.num_ccu_clks	= ARRAY_SIZE(sun8i_v853_ccu_clks),
> +
> +	.hw_clks	= &sun8i_v853_hw_clks,
> +
> +	.resets		= sun8i_v853_ccu_resets,
> +	.num_resets	= ARRAY_SIZE(sun8i_v853_ccu_resets),
> +};
> +
> +static const u32 pll_regs[] = {
> +	SUN8I_V853_PLL_CPU_REG,
> +	SUN8I_V853_PLL_DDR_REG,
> +	SUN8I_V853_PLL_PERIPH_REG,
> +	SUN8I_V853_PLL_VIDEO_REG,
> +	SUN8I_V853_PLL_CSI_REG,
> +	SUN8I_V853_PLL_AUDIO_REG,
> +	SUN8I_V853_PLL_NPU_REG,
> +};
> +
> +static int sun8i_v853_ccu_probe(struct platform_device *pdev)
> +{
> +	void __iomem *reg;
> +	u32 val;
> +	int i, ret;
> +
> +	reg = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(reg))
> +		return PTR_ERR(reg);
> +
> +	/* Enable the enable, LDO, and lock bits on all PLLs. */
> +	for (i = 0; i < ARRAY_SIZE(pll_regs); i++) {
> +		val = readl(reg + pll_regs[i]);
> +		val |= BIT(31) | BIT(30) | BIT(29);
> +		writel(val, reg + pll_regs[i]);
> +	}
> +
> +	/* Force PLL_CPU factor M to 0. */
> +	val = readl(reg + SUN8I_V853_PLL_CPU_REG);
> +	val &= ~GENMASK(1, 0);
> +	writel(val, reg + SUN8I_V853_PLL_CPU_REG);

Let's just hope it was 0 already, as I guess a sudden jump of
CPU frequency might not be too healthy.

> +	/*
> +	 * Force the output divider of video PLL to 0.

Just a nit, but a "divider of 0" does not sound too healthy. Maybe:
"Force the output divider to 1, by clearing bit 0."

Cheers,
Andre

> +	 *
> +	 * See the comment before pll-video0 definition for the reason.
> +	 */
> +	val = readl(reg + SUN8I_V853_PLL_VIDEO_REG);
> +	val &= ~BIT(0);
> +	writel(val, reg + SUN8I_V853_PLL_VIDEO_REG);
> +
> +	/*
> +	 * Force the output divider of CSI PLL to 0.
> +	 *
> +	 * See the comment before pll-csi definition for the reason.
> +	 */
> +	val = readl(reg + SUN8I_V853_PLL_CSI_REG);
> +	val &= ~BIT(0);
> +	writel(val, reg + SUN8I_V853_PLL_CSI_REG);
> +
> +	/*
> +	 * Force the output divider of NPU PLL to 0.
> +	 *
> +	 * See the comment before pll-npu definition for the reason.
> +	 */
> +	val = readl(reg + SUN8I_V853_PLL_NPU_REG);
> +	val &= ~BIT(0);
> +	writel(val, reg + SUN8I_V853_PLL_NPU_REG);
> +
> +	/*
> +	 * Force OHCI 12M clock source to 00 (12MHz divided from 48MHz)
> +	 *
> +	 * This clock mux is still mysterious, and the code just enforces
> +	 * it to have a valid clock parent.
> +	 */
> +	val = readl(reg + SUN8I_V853_USB_CLK_REG);
> +	val &= ~GENMASK(25, 24);
> +	writel(val, reg + SUN8I_V853_USB_CLK_REG);
> +
> +	/* Force fanout-27M factor N to 0. */
> +	val = readl(reg + SUN8I_V853_FANOUT_27M_REG);
> +	val &= ~GENMASK(9, 8);
> +	writel(val, reg + SUN8I_V853_FANOUT_27M_REG);
> +
> +	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, &sun8i_v853_ccu_desc);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id sun8i_v853_ccu_ids[] = {
> +	{ .compatible = "allwinner,sun8i-v853-ccu" },
> +	{ }
> +};
> +
> +static struct platform_driver sun8i_v853_ccu_driver = {
> +	.probe	= sun8i_v853_ccu_probe,
> +	.driver	= {
> +		.name			= "sun8i-v853-ccu",
> +		.suppress_bind_attrs	= true,
> +		.of_match_table		= sun8i_v853_ccu_ids,
> +	},
> +};
> +module_platform_driver(sun8i_v853_ccu_driver);
> +
> +MODULE_IMPORT_NS("SUNXI_CCU");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-v853.h b/drivers/clk/sunxi-ng/ccu-sun8i-v853.h
> new file mode 100644
> index 000000000000..b6ee1764fe5e
> --- /dev/null
> +++ b/drivers/clk/sunxi-ng/ccu-sun8i-v853.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2024 Andras Szemzo <szemzo.andras@gmail.com>
> + */
> +
> +#ifndef _CCU_SUN8I_V853_H_
> +#define _CCU_SUN8I_V853_H_
> +
> +#include <dt-bindings/clock/sun8i-v853-ccu.h>
> +#include <dt-bindings/reset/sun8i-v853-ccu.h>
> +
> +#define CLK_NUMBER		(CLK_FANOUT2 + 1)
> +
> +#endif /* _CCU_SUN8I_V853_H_ */


