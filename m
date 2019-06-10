Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 365253B836
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Jun 2019 17:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391163AbfFJPWH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Jun 2019 11:22:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:38292 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390243AbfFJPWG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 Jun 2019 11:22:06 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 1EC24207E0;
        Mon, 10 Jun 2019 15:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560180125;
        bh=ohOZQ3uSJ69XY58rw6nO7YSebPCTbrdeqXflgbv6YU0=;
        h=In-Reply-To:References:To:From:Subject:Date:From;
        b=TbY/eelfCY3JlfQcTR3Y2+vVNnHbQGqyHdPLLh+4CBVgGG+FS3G40fM/Fg/CsT+PY
         GR4YNBZcXqXqid/3mVqrCf7JE6gmyUdKVVUhz8SewsvPgyFkDghakPZtap9dcuf+tr
         ie39ArNlq+iYb/209aYj5CLM39TMQUPbE5JmwbHo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1559755738-28643-5-git-send-email-sricharan@codeaurora.org>
References: <1559755738-28643-1-git-send-email-sricharan@codeaurora.org> <1559755738-28643-5-git-send-email-sricharan@codeaurora.org>
To:     Sricharan R <sricharan@codeaurora.org>, agross@kernel.org,
        devicetree@vger.kernel.org, linus.walleij@linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-soc@vger.kernel.org, robh+dt@kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 4/6] clk: qcom: Add ipq6018 Global Clock Controller support
User-Agent: alot/0.8.1
Date:   Mon, 10 Jun 2019 08:22:04 -0700
Message-Id: <20190610152205.1EC24207E0@mail.kernel.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Sricharan R (2019-06-05 10:28:56)
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index e1ff83c..e5fb091 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -120,6 +120,15 @@ config IPQ_GCC_8074
>           i2c, USB, SD/eMMC, etc. Select this for the root clock
>           of ipq8074.
> =20
> +config IPQ_GCC_6018
> +       tristate "IPQ6018 Global Clock Controller"
> +       depends on COMMON_CLK_QCOM

Not sure I commented on this, but this should be removed. The whole
thing is inside an if now.

> +       help
> +         Support for global clock controller on ipq6018 devices.
> +         Say Y if you want to use peripheral devices such as UART, SPI,
> +         i2c, USB, SD/eMMC, etc. Select this for the root clock
> +         of ipq6018.
> +
>  config MSM_GCC_8660
>         tristate "MSM8660 Global Clock Controller"
>         help
> diff --git a/drivers/clk/qcom/gcc-ipq6018.c b/drivers/clk/qcom/gcc-ipq601=
8.c
> new file mode 100644
> index 0000000..9f4552b
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-ipq6018.c
> @@ -0,0 +1,5267 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/err.h>
> +#include <linux/platform_device.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/clk-provider.h>
> +#include <linux/regmap.h>
> +
> +#include <linux/reset-controller.h>
> +#include <dt-bindings/clock/qcom,gcc-ipq6018.h>
> +
> +#include "common.h"
> +#include "clk-regmap.h"
> +#include "clk-pll.h"
> +#include "clk-rcg.h"
> +#include "clk-branch.h"
> +#include "clk-alpha-pll.h"
> +#include "clk-regmap-divider.h"
> +#include "clk-regmap-mux.h"
> +#include "reset.h"
> +
> +#define F(f, s, h, m, n) { (f), (s), (2 * (h) - 1), (m), (n) }
[...]
> +
> +static struct clk_alpha_pll gpll0_main =3D {
> +       .offset =3D 0x21000,
> +       .regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> +       .clkr =3D {
> +               .enable_reg =3D 0x0b000,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gpll0_main",
> +                       .parent_names =3D (const char *[]){
> +                               "xo"
> +                       },
> +                       .num_parents =3D 1,
> +                       .ops =3D &clk_alpha_pll_ops,
> +                       .flags =3D CLK_IS_CRITICAL,

Can you add a comment on why this is critical?

> +               },
> +       },
> +};
> +
> +static struct clk_fixed_factor gpll0_out_main_div2 =3D {
> +       .mult =3D 1,
> +       .div =3D 2,
> +       .hw.init =3D &(struct clk_init_data){
> +               .name =3D "gpll0_out_main_div2",
> +               .parent_names =3D (const char *[]){
> +                       "gpll0_main"
> +               },
> +               .num_parents =3D 1,
> +               .ops =3D &clk_fixed_factor_ops,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +       },
> +};
> +
> +static struct clk_alpha_pll_postdiv gpll0 =3D {
> +       .offset =3D 0x21000,
> +       .regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> +       .width =3D 4,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gpll0",
> +               .parent_names =3D (const char *[]){
> +                       "gpll0_main"
> +               },
> +               .num_parents =3D 1,
> +               .ops =3D &clk_alpha_pll_postdiv_ro_ops,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +       },
> +};
> +
> +static struct clk_alpha_pll ubi32_pll_main =3D {
> +       .offset =3D 0x25000,
> +       .regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_HUAYRA],
> +       .flags =3D SUPPORTS_DYNAMIC_UPDATE,
> +       .clkr =3D {
> +               .enable_reg =3D 0x0b000,
> +               .enable_mask =3D BIT(6),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "ubi32_pll_main",
> +                       .parent_names =3D (const char *[]){
> +                               "xo"
> +                       },
> +                       .num_parents =3D 1,
> +                       .ops =3D &clk_alpha_pll_huayra_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_alpha_pll_postdiv ubi32_pll =3D {
> +       .offset =3D 0x25000,
> +       .regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_HUAYRA],
> +       .width =3D 2,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "ubi32_pll",
> +               .parent_names =3D (const char *[]){
> +                       "ubi32_pll_main"
> +               },
> +               .num_parents =3D 1,
> +               .ops =3D &clk_alpha_pll_postdiv_ro_ops,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +       },
> +};
> +
> +static struct clk_alpha_pll gpll6_main =3D {
> +       .offset =3D 0x37000,
> +       .regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_BRAMMO],
> +       .clkr =3D {
> +               .enable_reg =3D 0x0b000,
> +               .enable_mask =3D BIT(7),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gpll6_main",
> +                       .parent_names =3D (const char *[]){
> +                               "xo"
> +                       },
> +                       .num_parents =3D 1,
> +                       .ops =3D &clk_alpha_pll_ops,
> +                       .flags =3D CLK_IS_CRITICAL,

Can you add a comment on why this is critical?

> +               },
> +       },
> +};
> +
> +static struct clk_alpha_pll_postdiv gpll6 =3D {
> +       .offset =3D 0x37000,
> +       .regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_BRAMMO],
> +       .width =3D 2,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gpll6",
> +               .parent_names =3D (const char *[]){
> +                       "gpll6_main"
> +               },
> +               .num_parents =3D 1,
> +               .ops =3D &clk_alpha_pll_postdiv_ro_ops,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +       },
> +};
> +
> +static struct clk_alpha_pll gpll4_main =3D {
> +       .offset =3D 0x24000,
> +       .regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> +       .clkr =3D {
> +               .enable_reg =3D 0x0b000,
> +               .enable_mask =3D BIT(5),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gpll4_main",
> +                       .parent_names =3D (const char *[]){
> +                               "xo"
> +                       },
> +                       .num_parents =3D 1,
> +                       .ops =3D &clk_alpha_pll_ops,
> +                       .flags =3D CLK_IS_CRITICAL,

Can you add a comment on why this is critical?

> +               },
> +       },
> +};
> +
> +static struct clk_alpha_pll_postdiv gpll4 =3D {
> +       .offset =3D 0x24000,
> +       .regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> +       .width =3D 4,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "gpll4",
> +               .parent_names =3D (const char *[]){
> +                       "gpll4_main"
> +               },
> +               .num_parents =3D 1,
> +               .ops =3D &clk_alpha_pll_postdiv_ro_ops,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +       },
> +};
> +
> +static const struct freq_tbl ftbl_pcnoc_bfdcd_clk_src[] =3D {
> +       F(24000000, P_XO, 1, 0, 0),
> +       F(50000000, P_GPLL0, 16, 0, 0),
> +       F(100000000, P_GPLL0, 8, 0, 0),
> +       { }
> +};
> +
> +static struct clk_rcg2 pcnoc_bfdcd_clk_src =3D {
> +       .cmd_rcgr =3D 0x27000,
> +       .freq_tbl =3D ftbl_pcnoc_bfdcd_clk_src,
> +       .hid_width =3D 5,
> +       .parent_map =3D gcc_xo_gpll0_gpll0_out_main_div2_map,
> +       .clkr.hw.init =3D &(struct clk_init_data){
> +               .name =3D "pcnoc_bfdcd_clk_src",
> +               .parent_names =3D gcc_xo_gpll0_gpll0_out_main_div2,
> +               .num_parents =3D 3,
> +               .ops =3D &clk_rcg2_ops,
> +               .flags =3D CLK_IS_CRITICAL,

Can you add a comment on why this is critical?

> +       },
> +};
> +
> +static struct clk_fixed_factor pcnoc_clk_src =3D {
> +       .mult =3D 1,
> +       .div =3D 1,
> +       .hw.init =3D &(struct clk_init_data){
> +               .name =3D "pcnoc_clk_src",
> +               .parent_names =3D (const char *[]){
> +                       "pcnoc_bfdcd_clk_src"
> +               },
> +               .num_parents =3D 1,
> +               .ops =3D &clk_fixed_factor_ops,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +       },
> +};
> +
> +static struct clk_alpha_pll gpll2_main =3D {
> +       .offset =3D 0x4a000,
> +       .regs =3D clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
> +       .clkr =3D {
> +               .enable_reg =3D 0x0b000,
> +               .enable_mask =3D BIT(2),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gpll2_main",
> +                       .parent_names =3D (const char *[]){
> +                               "xo"
> +                       },
> +                       .num_parents =3D 1,
> +                       .ops =3D &clk_alpha_pll_ops,
> +                       .flags =3D CLK_IS_CRITICAL,

Can you add a comment on why this is critical?

> +               },
> +       },
> +};
> +
[...]
> +
> +static struct clk_fixed_factor system_noc_clk_src =3D {
> +       .mult =3D 1,
> +       .div =3D 1,
> +       .hw.init =3D &(struct clk_init_data){
> +               .name =3D "system_noc_clk_src",
> +               .parent_names =3D (const char *[]){
> +                       "system_noc_bfdcd_clk_src"
> +               },
> +               .num_parents =3D 1,
> +               .ops =3D &clk_fixed_factor_ops,
> +               .flags =3D CLK_SET_RATE_PARENT,
> +       },
> +};

What is the point of these fixed factor 1/1 clks? Just to rename things?
Does it matter, or can we just specify system_noc_bfdcd_clk_src as the
parent and drop this intermediate clk?

> +
> +static struct clk_branch gcc_sleep_clk_src =3D {
> +       .halt_reg =3D 0x30000,
> +       .clkr =3D {
> +               .enable_reg =3D 0x30000,
> +               .enable_mask =3D BIT(1),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_sleep_clk_src",
> +                       .parent_names =3D (const char *[]){
> +                               "sleep_clk"
> +                       },
> +                       .num_parents =3D 1,
> +                       .ops =3D &clk_branch2_ops,
> +                       .flags =3D CLK_IS_CRITICAL,
> +               },
> +       },
> +};
> +
[...]
> +
> +static struct clk_branch gcc_qdss_at_clk =3D {
> +       .halt_reg =3D 0x29024,
> +       .clkr =3D {
> +               .enable_reg =3D 0x29024,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_qdss_at_clk",
> +                       .parent_names =3D (const char *[]){
> +                               "qdss_at_clk_src"
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,

Can you add a comment on why this is critical?

> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_qdss_dap_clk =3D {
> +       .halt_reg =3D 0x29084,
> +       .clkr =3D {
> +               .enable_reg =3D 0x29084,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_qdss_dap_clk",
> +                       .parent_names =3D (const char *[]){
> +                               "qdss_dap_sync_clk_src"
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,

Can you add a comment on why this is critical?

> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static struct clk_branch gcc_qpic_ahb_clk =3D {
> +       .halt_reg =3D 0x57024,
> +       .clkr =3D {
> +               .enable_reg =3D 0x57024,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_qpic_ahb_clk",
> +                       .parent_names =3D (const char *[]){
> +                               "pcnoc_clk_src"
> +                       },
> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
[...]
> +static struct clk_branch gcc_dcc_clk =3D {
> +       .halt_reg =3D 0x77004,
> +       .clkr =3D {
> +               .enable_reg =3D 0x77004,
> +               .enable_mask =3D BIT(0),
> +               .hw.init =3D &(struct clk_init_data){
> +                       .name =3D "gcc_dcc_clk",
> +                       .parent_names =3D (const char *[]){
> +                               "pcnoc_clk_src"
> +                       },

Can you use the new method of specifying clk parents here? That will
make this simpler.

> +                       .num_parents =3D 1,
> +                       .flags =3D CLK_SET_RATE_PARENT,
> +                       .ops =3D &clk_branch2_ops,
> +               },
> +       },
> +};
> +
> +static const struct alpha_pll_config ubi32_pll_config =3D {
> +       .l =3D 0x3e,
> +       .alpha =3D 0x57,
> +       .config_ctl_val =3D 0x200d6aa8,
> +       .config_ctl_hi_val =3D 0x3c2,
> +       .main_output_mask =3D BIT(0),
> +       .aux_output_mask =3D BIT(1),
> +       .pre_div_val =3D 0x0,
> +       .pre_div_mask =3D BIT(12),
> +       .post_div_val =3D 0x0,
> +       .post_div_mask =3D GENMASK(9, 8),
> +};
> +
> +static const struct alpha_pll_config nss_crypto_pll_config =3D {
> +       .l =3D 0x32,
> +       .alpha =3D 0x0,
> +       .alpha_hi =3D 0x0,
> +       .config_ctl_val =3D 0x4001055b,
> +       .main_output_mask =3D BIT(0),
> +       .pre_div_val =3D 0x0,
> +       .pre_div_mask =3D GENMASK(14, 12),
> +       .post_div_val =3D 0x1 << 8,
> +       .post_div_mask =3D GENMASK(11, 8),
> +       .vco_mask =3D GENMASK(21, 20),
> +       .vco_val =3D 0x0,
> +       .alpha_en_mask =3D BIT(24),
> +};
> +
> +static struct clk_hw *gcc_ipq6018_hws[] =3D {

It would be nice to trim this down to a list of 0.

> +       &gpll0_out_main_div2.hw,
> +       &pcnoc_clk_src.hw,
> +       &snoc_nssnoc_clk_src.hw,
> +       &system_noc_clk_src.hw,
> +       &gcc_xo_div4_clk_src.hw,
> +       &ubi32_mem_noc_clk_src.hw,
> +       &nss_ppe_cdiv_clk_src.hw,
> +       &gpll6_out_main_div2.hw,

Why do we need this? Does anyone use it?

> +       &qdss_dap_sync_clk_src.hw,
> +       &qdss_tsctr_div2_clk_src.hw,
> +};
> +
