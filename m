Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 624AA43BB7C
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Oct 2021 22:20:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239144AbhJZUWW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Oct 2021 16:22:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:60458 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231675AbhJZUWT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 26 Oct 2021 16:22:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0584560F21;
        Tue, 26 Oct 2021 20:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635279595;
        bh=Zg6jEoO5uXAqy1nLnuu/ujfQhqIh9OeJS5gJ6lLb+R0=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=TaFOl+osDYLb3fRFEQifch4qSzB1HOJEYvRVQBvQNRDXI0bmVIhoNiGgzVx1+5tKX
         DS9Jsf1xrnVVoguLCKoqPSP76VW+Any+42WHokyMnSkTEmFRFTKxGQo9vP7tcp/gWJ
         7cpDCUpkcm2iPwcmSbNJh0u3HV0IDMXGe7WcjMSj8SThO/iRdJYcfz17bxm79zP4+j
         w8QCJIiYnCBUJG3d4RHfJbA6DmVfLiO3ZyBQgtze1luTc900dG13FMQuLVRFVw5KRO
         q9wMxC0vb/KtaUd7QbJgS5224sv+E7kKvVsVUSb9+aeGAym7yzST6bRXHos62XBgzk
         af2vVmXOqLxhQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211021174223.43310-7-kernel@esmil.dk>
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-7-kernel@esmil.dk>
Subject: Re: [PATCH v2 06/16] clk: starfive: Add JH7100 clock generator driver
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Sagar Kadam <sagar.kadam@sifive.com>,
        Drew Fustini <drew@beagleboard.org>,
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        linux-kernel@vger.kernel.org,
        Emil Renner Berthing <kernel@esmil.dk>
To:     Emil Renner Berthing <kernel@esmil.dk>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org
Date:   Tue, 26 Oct 2021 13:19:52 -0700
Message-ID: <163527959276.15791.14765586510805526101@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Emil Renner Berthing (2021-10-21 10:42:13)
> diff --git a/drivers/clk/starfive/clk-starfive-jh7100.c b/drivers/clk/sta=
rfive/clk-starfive-jh7100.c
> new file mode 100644
> index 000000000000..f109576f18c5
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jh7100.c
> @@ -0,0 +1,776 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * StarFive JH7100 Clock Generator Driver
> + *
> + * Copyright 2021 Ahmad Fatoum, Pengutronix
> + * Copyright (C) 2021 Glider bv
> + * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/clk.h>

Is this include used?

> +#include <linux/clk-provider.h>
> +#include <linux/debugfs.h>
> +#include <linux/device.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/overflow.h>

Is this include used?

> +#include <linux/platform_device.h>
> +
> +#include <dt-bindings/clock/starfive-jh7100.h>
> +
> +#define JH7100_CLK_ENABLE_SHIFT        31
> +#define JH7100_CLK_INVERT_SHIFT        30
> +#define JH7100_CLK_MUX_SHIFT   24
> +
> +#define JH7100_CLK_ENABLE      BIT(31)
> +#define JH7100_CLK_INVERT      BIT(30)
> +#define JH7100_CLK_MUX_MASK    GENMASK(27, 24)
> +#define JH7100_CLK_DIV_MASK    GENMASK(23, 0)
> +
> +static const char *const cpundbus_root_sels[] __initconst =3D {
> +       [0] =3D "osc_sys",
> +       [1] =3D "pll0_out",
> +       [2] =3D "pll1_out",
> +       [3] =3D "pll2_out",
> +};
> +
> +static const char *const dla_root_sels[] __initconst =3D {
> +       [0] =3D "osc_sys",
> +       [1] =3D "pll1_out",
> +       [2] =3D "pll2_out",
> +};
> +
> +static const char *const dsp_root_sels[] __initconst =3D {
> +       [0] =3D "osc_sys",
> +       [1] =3D "pll0_out",
> +       [2] =3D "pll1_out",
> +       [3] =3D "pll2_out",
> +};
> +
> +static const char *const gmacusb_root_sels[] __initconst =3D {
> +       [0] =3D "osc_sys",
> +       [1] =3D "pll0_out",
> +       [2] =3D "pll2_out",
> +};
> +
> +static const char *const perh0_root_sels[] __initconst =3D {
> +       [0] =3D "osc_sys",
> +       [1] =3D "pll0_out",
> +};
> +
> +static const char *const perh1_root_sels[] __initconst =3D {
> +       [0] =3D "osc_sys",
> +       [1] =3D "pll2_out",
> +};
> +
> +static const char *const vin_root_sels[] __initconst =3D {
> +       [0] =3D "osc_sys",
> +       [1] =3D "pll1_out",
> +       [2] =3D "pll2_out",
> +};
> +
> +static const char *const vout_root_sels[] __initconst =3D {
> +       [0] =3D "osc_aud",
> +       [1] =3D "pll0_out",
> +       [2] =3D "pll2_out",
> +};
> +
> +static const char *const cdechifi4_root_sels[] __initconst =3D {
> +       [0] =3D "osc_sys",
> +       [1] =3D "pll1_out",
> +       [2] =3D "pll2_out",
> +};
> +
> +static const char *const cdec_root_sels[] __initconst =3D {
> +       [0] =3D "osc_sys",
> +       [1] =3D "pll0_out",
> +       [2] =3D "pll1_out",
> +};
> +
> +static const char *const voutbus_root_sels[] __initconst =3D {
> +       [0] =3D "osc_aud",
> +       [1] =3D "pll0_out",
> +       [2] =3D "pll2_out",
> +};
> +
> +static const char *const pll2_refclk_sels[] __initconst =3D {
> +       [0] =3D "osc_sys",
> +       [1] =3D "osc_aud",
> +};
> +
> +static const char *const ddrc0_sels[] __initconst =3D {
> +       [0] =3D "ddrosc_div2",
> +       [1] =3D "ddrpll_div2",
> +       [2] =3D "ddrpll_div4",
> +       [3] =3D "ddrpll_div8",
> +};
> +
> +static const char *const ddrc1_sels[] __initconst =3D {
> +       [0] =3D "ddrosc_div2",
> +       [1] =3D "ddrpll_div2",
> +       [2] =3D "ddrpll_div4",
> +       [3] =3D "ddrpll_div8",
> +};
> +
> +static const char *const nne_bus_sels[] __initconst =3D {
> +       [0] =3D "cpu_axi",
> +       [1] =3D "nnebus_src1",
> +};
> +
> +static const char *const usbphy_25m_sels[] __initconst =3D {
> +       [0] =3D "osc_sys",
> +       [1] =3D "usbphy_plldiv25m",
> +};
> +
> +static const char *const gmac_tx_sels[] __initconst =3D {
> +       [0] =3D "gmac_gtxclk",
> +       [1] =3D "gmac_mii_txclk",
> +       [2] =3D "gmac_rmii_txclk",
> +};
> +
> +static const char *const gmac_rx_pre_sels[] __initconst =3D {
> +       [0] =3D "gmac_gr_mii_rxclk",
> +       [1] =3D "gmac_rmii_rxclk",
> +};
> +
> +struct jh7100_clk {
> +       struct clk_hw hw;
> +       unsigned int idx;
> +       u32 max;

Why u32?

> +};
> +
> +struct clk_starfive_jh7100_priv {
> +       /* protect registers against overlapping read-modify-write */
> +       spinlock_t rmw_lock;

Does overlapping mean concurrent? Do different clks share the same
registers?

> +       struct device *dev;
> +       void __iomem *base;
> +       struct clk_hw *pll[3];
> +       struct jh7100_clk reg[JH7100_CLK_PLL0_OUT];
> +};
> +
> +static struct jh7100_clk *jh7100_clk_from(struct clk_hw *hw)
> +{
> +       return container_of(hw, struct jh7100_clk, hw);
> +}
> +
> +static struct clk_starfive_jh7100_priv *jh7100_priv_from(struct jh7100_c=
lk *clk)
> +{
> +       return container_of(clk, struct clk_starfive_jh7100_priv, reg[clk=
->idx]);
> +}
> +
> +static u32 jh7100_clk_reg_get(struct jh7100_clk *clk)
> +{
> +       struct clk_starfive_jh7100_priv *priv =3D jh7100_priv_from(clk);
> +       void __iomem *reg =3D priv->base + 4 * clk->idx;
> +
> +       return readl_relaxed(reg);
> +}
> +
> +static void jh7100_clk_reg_rmw(struct jh7100_clk *clk, u32 mask, u32 val=
ue)
> +{
> +       struct clk_starfive_jh7100_priv *priv =3D jh7100_priv_from(clk);
> +       void __iomem *reg =3D priv->base + 4 * clk->idx;
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&priv->rmw_lock, flags);
> +       value |=3D readl_relaxed(reg) & ~mask;
> +       writel_relaxed(value, reg);
> +       spin_unlock_irqrestore(&priv->rmw_lock, flags);
> +}
> +
> +static int jh7100_clk_enable(struct clk_hw *hw)
> +{
> +       struct jh7100_clk *clk =3D jh7100_clk_from(hw);
> +
> +       dev_dbg(jh7100_priv_from(clk)->dev, "enable(%s)\n", clk_hw_get_na=
me(&clk->hw));
> +
> +       jh7100_clk_reg_rmw(clk, JH7100_CLK_ENABLE, JH7100_CLK_ENABLE);
> +       return 0;
> +}
> +
> +static void jh7100_clk_disable(struct clk_hw *hw)
> +{
> +       struct jh7100_clk *clk =3D jh7100_clk_from(hw);
> +
> +       dev_dbg(jh7100_priv_from(clk)->dev, "disable(%s)\n", clk_hw_get_n=
ame(&clk->hw));
> +
> +       jh7100_clk_reg_rmw(clk, JH7100_CLK_ENABLE, 0);
> +}
> +
> +static int jh7100_clk_is_enabled(struct clk_hw *hw)
> +{
> +       struct jh7100_clk *clk =3D jh7100_clk_from(hw);
> +
> +       return !!(jh7100_clk_reg_get(clk) & JH7100_CLK_ENABLE);
> +}
> +
> +static int jh7100_clk_is_parent_enabled(struct clk_hw *hw)
> +{
> +       return clk_hw_is_enabled(clk_hw_get_parent(hw));

Why do we need this function? The parent being enabled implies this clk
is enabled if this clk can't gate itself but then knowing this clk is
enabled is useful for what?

> +}
> +
> +static unsigned long jh7100_clk_recalc_rate(struct clk_hw *hw,
> +                                           unsigned long parent_rate)
> +{
> +       struct jh7100_clk *clk =3D jh7100_clk_from(hw);
> +       u32 value =3D jh7100_clk_reg_get(clk) & JH7100_CLK_DIV_MASK;
> +       unsigned long rate;
> +
> +       if (value)
> +               rate =3D parent_rate / value;
> +       else
> +               rate =3D 0;
> +
> +       dev_dbg(jh7100_priv_from(clk)->dev, "recalc_rate(%s, %lu) =3D %lu=
 (div %u)\n",
> +               clk_hw_get_name(&clk->hw), parent_rate, rate, value);
> +
> +       return rate;
> +}
> +
> +static unsigned long jh7100_clk_bestdiv(struct jh7100_clk *clk,
> +                                       unsigned long rate, unsigned long=
 parent)
> +{
> +       unsigned long max =3D clk->max & JH7100_CLK_DIV_MASK;
> +       unsigned long div =3D DIV_ROUND_UP(parent, rate);
> +
> +       return min(div, max);
> +}
> +
> +static int jh7100_clk_determine_rate(struct clk_hw *hw,
> +                                    struct clk_rate_request *req)
> +{
> +       struct jh7100_clk *clk =3D jh7100_clk_from(hw);
> +       unsigned long parent =3D req->best_parent_rate;
> +       unsigned long rate =3D clamp(req->rate, req->min_rate, req->max_r=
ate);
> +       unsigned long div =3D jh7100_clk_bestdiv(clk, rate, parent);
> +       unsigned long result =3D parent / div;
> +
> +       /*
> +        * We want the result clamped by min_rate and max_rate if possibl=
e:
> +        * Case 1: div hits the max divider value, which means it's less =
than
> +        * parent / rate, so the result is greater than rate and min_rate=
 in
> +        * particular. We can't do anything about result > max_rate becau=
se the
> +        * divider doesn't go any further.
> +        * Case 2: div =3D DIV_ROUND_UP(parent, rate) which means the res=
ult is
> +        * always lower or equal to rate and max_rate.  However the resul=
t may
> +        * turn out lower than min_rate, but then the next higher rate is=
 fine:
> +        *   div - 1 =3D ceil(parent / rate) - 1 < parent / rate
> +        * and thus
> +        *   min_rate <=3D rate < parent / (div - 1)
> +        */
> +       if (result < req->min_rate && div > 1) {
> +               div -=3D 1;
> +               result =3D parent / div;
> +       }
> +
> +       dev_dbg(jh7100_priv_from(clk)->dev,
> +               "determine_rate(%s, {%lu<=3D%lu<=3D%lu from %lu}) =3D %lu=
 (div %lu)\n",
> +               clk_hw_get_name(&clk->hw), req->min_rate, req->rate, req-=
>max_rate,
> +               parent, result, div);
> +
> +       req->rate =3D result;
> +       return 0;
> +}
> +
> +static int jh7100_clk_set_rate(struct clk_hw *hw,
> +                              unsigned long rate,
> +                              unsigned long parent_rate)
> +{
> +       struct jh7100_clk *clk =3D jh7100_clk_from(hw);
> +       unsigned long div =3D jh7100_clk_bestdiv(clk, rate, parent_rate);
> +
> +       dev_dbg(jh7100_priv_from(clk)->dev,
> +               "set_rate(%s, %lu, %lu) =3D %lu (div %lu)\n",
> +               clk_hw_get_name(&clk->hw), rate, parent_rate,
> +               parent_rate / div, div);
> +
> +       jh7100_clk_reg_rmw(clk, JH7100_CLK_DIV_MASK, div);
> +       return 0;
> +}
> +
> +static u8 jh7100_clk_get_parent(struct clk_hw *hw)
> +{
> +       struct jh7100_clk *clk =3D jh7100_clk_from(hw);
> +       u32 value =3D jh7100_clk_reg_get(clk);
> +
> +       return (value & JH7100_CLK_MUX_MASK) >> JH7100_CLK_MUX_SHIFT;
> +}
> +
> +static int jh7100_clk_set_parent(struct clk_hw *hw, u8 index)
> +{
> +       struct jh7100_clk *clk =3D jh7100_clk_from(hw);
> +       u32 value =3D (u32)index << JH7100_CLK_MUX_SHIFT;
> +
> +       dev_dbg(jh7100_priv_from(clk)->dev, "set_parent(%s, %u)\n",
> +               clk_hw_get_name(&clk->hw), index);

Please remove these dev_dbg() messages. We have tracepoints for general
clk operations and the driver shouldn't duplicate that.

> +
> +       jh7100_clk_reg_rmw(clk, JH7100_CLK_MUX_MASK, value);
> +       return 0;
> +}
> +
> +static int jh7100_clk_mux_determine_rate(struct clk_hw *hw,
> +                                        struct clk_rate_request *req)
> +{
> +       struct jh7100_clk *clk =3D jh7100_clk_from(hw);
> +       int ret =3D clk_mux_determine_rate_flags(&clk->hw, req, 0);
> +
> +       dev_dbg(jh7100_priv_from(clk)->dev, "determine_rate(%s) =3D %d\n",
> +               clk_hw_get_name(&clk->hw), ret);
> +
> +       return ret;
> +}
> +
> +static int jh7100_clk_get_phase(struct clk_hw *hw)
> +{
> +       struct jh7100_clk *clk =3D jh7100_clk_from(hw);
> +       u32 value =3D jh7100_clk_reg_get(clk);
> +
> +       return (value & JH7100_CLK_INVERT) ? 180 : 0;
> +}
> +
> +static int jh7100_clk_set_phase(struct clk_hw *hw, int degrees)
> +{
> +       struct jh7100_clk *clk =3D jh7100_clk_from(hw);
> +       u32 value;
> +
> +       dev_dbg(jh7100_priv_from(clk)->dev, "set_phase(%s, %d)\n",
> +               clk_hw_get_name(&clk->hw), degrees);
> +
> +       if (degrees =3D=3D 0)
> +               value =3D 0;
> +       else if (degrees =3D=3D 180)
> +               value =3D JH7100_CLK_INVERT;
> +       else
> +               return -EINVAL;
> +
> +       jh7100_clk_reg_rmw(clk, JH7100_CLK_INVERT, value);
> +       return 0;
> +}
> +
> +#ifdef CONFIG_DEBUG_FS
> +static void jh7100_clk_debug_init(struct clk_hw *hw, struct dentry *dent=
ry)
> +{
> +       static const struct debugfs_reg32 jh7100_clk_reg =3D {
> +               .name =3D "CTRL",
> +               .offset =3D 0,
> +       };
> +       struct jh7100_clk *clk =3D jh7100_clk_from(hw);
> +       struct clk_starfive_jh7100_priv *priv =3D jh7100_priv_from(clk);
> +       struct debugfs_regset32 *regset;
> +
> +       regset =3D devm_kzalloc(priv->dev, sizeof(*regset), GFP_KERNEL);
> +       if (!regset)
> +               return;
> +
> +       regset->regs =3D &jh7100_clk_reg;
> +       regset->nregs =3D 1;
> +       regset->base =3D priv->base + 4 * clk->idx;
> +
> +       debugfs_create_regset32("registers", 0400, dentry, regset);
> +}
> +#else
> +#define jh7100_clk_debug_init NULL
> +#endif
> +
> +static const struct clk_ops jh7100_clk_gate_ops =3D {
> +       .enable =3D jh7100_clk_enable,
> +       .disable =3D jh7100_clk_disable,
> +       .is_enabled =3D jh7100_clk_is_enabled,
> +       .debug_init =3D jh7100_clk_debug_init,
> +};
> +
> +static const struct clk_ops jh7100_clk_div_ops =3D {
> +       .is_enabled =3D jh7100_clk_is_parent_enabled,
> +       .recalc_rate =3D jh7100_clk_recalc_rate,
> +       .determine_rate =3D jh7100_clk_determine_rate,
> +       .set_rate =3D jh7100_clk_set_rate,
> +       .debug_init =3D jh7100_clk_debug_init,
> +};
> +
> +static const struct clk_ops jh7100_clk_gdiv_ops =3D {
> +       .enable =3D jh7100_clk_enable,
> +       .disable =3D jh7100_clk_disable,
> +       .is_enabled =3D jh7100_clk_is_enabled,
> +       .recalc_rate =3D jh7100_clk_recalc_rate,
> +       .determine_rate =3D jh7100_clk_determine_rate,
> +       .set_rate =3D jh7100_clk_set_rate,
> +       .debug_init =3D jh7100_clk_debug_init,
> +};
> +
> +static const struct clk_ops jh7100_clk_mux_ops =3D {
> +       .is_enabled =3D jh7100_clk_is_parent_enabled,
> +       .get_parent =3D jh7100_clk_get_parent,
> +       .set_parent =3D jh7100_clk_set_parent,
> +       .determine_rate =3D jh7100_clk_mux_determine_rate,
> +       .debug_init =3D jh7100_clk_debug_init,
> +};
> +
> +static const struct clk_ops jh7100_clk_gmux_ops =3D {
> +       .enable =3D jh7100_clk_enable,
> +       .disable =3D jh7100_clk_disable,
> +       .is_enabled =3D jh7100_clk_is_enabled,
> +       .get_parent =3D jh7100_clk_get_parent,
> +       .set_parent =3D jh7100_clk_set_parent,
> +       .determine_rate =3D jh7100_clk_mux_determine_rate,
> +       .debug_init =3D jh7100_clk_debug_init,
> +};
> +
> +static const struct clk_ops jh7100_clk_inv_ops =3D {
> +       .is_enabled =3D jh7100_clk_is_parent_enabled,
> +       .get_phase =3D jh7100_clk_get_phase,
> +       .set_phase =3D jh7100_clk_set_phase,
> +       .debug_init =3D jh7100_clk_debug_init,
> +};
> +
> +#define JH7100_GATE(_idx, _name, _parent, _flags) [_idx] =3D { \

Typical macro style is to tab out the \ to a single column

> +       .name =3D _name, \
> +       .ops =3D &jh7100_clk_gate_ops, \
> +       .parent =3D _parent, \
> +       .flags =3D CLK_SET_RATE_PARENT | (_flags), \
> +       .max =3D JH7100_CLK_ENABLE, \
> +}
> +
> +#define JH7100__DIV(_idx, _name, _parent, _max) [_idx] =3D { \
> +       .name =3D _name, \
> +       .ops =3D &jh7100_clk_div_ops, \
> +       .parent =3D _parent, \
> +       .flags =3D 0, \
> +       .max =3D _max, \
> +}
> +
> +#define JH7100_GDIV(_idx, _name, _parent, _max, _flags) [_idx] =3D { \
> +       .name =3D _name, \
> +       .ops =3D &jh7100_clk_gdiv_ops, \
> +       .parent =3D _parent, \
> +       .flags =3D (_flags), \
> +       .max =3D JH7100_CLK_ENABLE | (_max), \
> +}
> +
> +#define JH7100__MUX(_idx, _name, _parents) [_idx] =3D { \
> +       .name =3D _name, \
> +       .ops =3D &jh7100_clk_mux_ops, \
> +       .parents =3D _parents, \
> +       .flags =3D 0, \
> +       .max =3D (ARRAY_SIZE(_parents) - 1) << JH7100_CLK_MUX_SHIFT, \
> +}
> +
> +#define JH7100_GMUX(_idx, _name, _parents, _flags) [_idx] =3D { \
> +       .name =3D _name, \
> +       .ops =3D &jh7100_clk_gmux_ops, \
> +       .parents =3D _parents, \
> +       .flags =3D (_flags), \
> +       .max =3D JH7100_CLK_ENABLE | \
> +               ((ARRAY_SIZE(_parents) - 1) << JH7100_CLK_MUX_SHIFT), \
> +}
> +
> +#define JH7100__INV(_idx, _name, _parent) [_idx] =3D { \
> +       .name =3D _name, \
> +       .ops =3D &jh7100_clk_inv_ops, \
> +       .parent =3D _parent, \
> +       .flags =3D CLK_SET_RATE_PARENT, \
> +       .max =3D JH7100_CLK_INVERT, \
> +}
> +
> +static const struct {
> +       const char *name;
> +       const struct clk_ops *ops;
> +       union {
> +               const char *parent;
> +               const char *const *parents;
> +       };
> +       unsigned long flags;
> +       u32 max;
> +} jh7100_clk_data[] __initconst =3D {
> +       JH7100__MUX(JH7100_CLK_CPUNDBUS_ROOT, "cpundbus_root", cpundbus_r=
oot_sels),
> +       JH7100__MUX(JH7100_CLK_DLA_ROOT, "dla_root", dla_root_sels),
> +       JH7100__MUX(JH7100_CLK_DSP_ROOT, "dsp_root", dsp_root_sels),
> +       JH7100__MUX(JH7100_CLK_GMACUSB_ROOT, "gmacusb_root", gmacusb_root=
_sels),
> +       JH7100__MUX(JH7100_CLK_PERH0_ROOT, "perh0_root", perh0_root_sels),
> +       JH7100__MUX(JH7100_CLK_PERH1_ROOT, "perh1_root", perh1_root_sels),
> +       JH7100__MUX(JH7100_CLK_VIN_ROOT, "vin_root", vin_root_sels),
> +       JH7100__MUX(JH7100_CLK_VOUT_ROOT, "vout_root", vout_root_sels),
> +       JH7100_GDIV(JH7100_CLK_AUDIO_ROOT, "audio_root", "pll0_out", 8, 0=
),
> +       JH7100__MUX(JH7100_CLK_CDECHIFI4_ROOT, "cdechifi4_root", cdechifi=
4_root_sels),
> +       JH7100__MUX(JH7100_CLK_CDEC_ROOT, "cdec_root", cdec_root_sels),
> +       JH7100__MUX(JH7100_CLK_VOUTBUS_ROOT, "voutbus_root", voutbus_root=
_sels),
> +       JH7100__DIV(JH7100_CLK_CPUNBUS_ROOT_DIV, "cpunbus_root_div", "cpu=
ndbus_root", 2),
> +       JH7100__DIV(JH7100_CLK_DSP_ROOT_DIV, "dsp_root_div", "dsp_root", =
4),
> +       JH7100__DIV(JH7100_CLK_PERH0_SRC, "perh0_src", "perh0_root", 4),
> +       JH7100__DIV(JH7100_CLK_PERH1_SRC, "perh1_src", "perh1_root", 4),
> +       JH7100_GDIV(JH7100_CLK_PLL0_TESTOUT, "pll0_testout", "perh0_src",=
 31, 0),
> +       JH7100_GDIV(JH7100_CLK_PLL1_TESTOUT, "pll1_testout", "dla_root", =
31, 0),
> +       JH7100_GDIV(JH7100_CLK_PLL2_TESTOUT, "pll2_testout", "perh1_src",=
 31, 0),
> +       JH7100__MUX(JH7100_CLK_PLL2_REF, "pll2_refclk", pll2_refclk_sels),
> +       JH7100__DIV(JH7100_CLK_CPU_CORE, "cpu_core", "cpunbus_root_div", =
8),
> +       JH7100__DIV(JH7100_CLK_CPU_AXI, "cpu_axi", "cpu_core", 8),
> +       JH7100__DIV(JH7100_CLK_AHB_BUS, "ahb_bus", "cpunbus_root_div", 8),
> +       JH7100__DIV(JH7100_CLK_APB1_BUS, "apb1_bus", "ahb_bus", 8),
> +       JH7100__DIV(JH7100_CLK_APB2_BUS, "apb2_bus", "ahb_bus", 8),
> +       JH7100_GATE(JH7100_CLK_DOM3AHB_BUS, "dom3ahb_bus", "ahb_bus", CLK=
_IGNORE_UNUSED),
> +       JH7100_GATE(JH7100_CLK_DOM7AHB_BUS, "dom7ahb_bus", "ahb_bus", CLK=
_IGNORE_UNUSED),
> +       JH7100_GATE(JH7100_CLK_U74_CORE0, "u74_core0", "cpu_core", CLK_IG=
NORE_UNUSED),
> +       JH7100_GDIV(JH7100_CLK_U74_CORE1, "u74_core1", "cpu_core", 8, CLK=
_IGNORE_UNUSED),
> +       JH7100_GATE(JH7100_CLK_U74_AXI, "u74_axi", "cpu_axi", CLK_IGNORE_=
UNUSED),
> +       JH7100_GATE(JH7100_CLK_U74RTC_TOGGLE, "u74rtc_toggle", "osc_sys",=
 CLK_IGNORE_UNUSED),
> +       JH7100_GATE(JH7100_CLK_SGDMA2P_AXI, "sgdma2p_axi", "cpu_axi", 0),
> +       JH7100_GATE(JH7100_CLK_DMA2PNOC_AXI, "dma2pnoc_axi", "cpu_axi", 0=
),
> +       JH7100_GATE(JH7100_CLK_SGDMA2P_AHB, "sgdma2p_ahb", "ahb_bus", 0),
> +       JH7100__DIV(JH7100_CLK_DLA_BUS, "dla_bus", "dla_root", 4),
> +       JH7100_GATE(JH7100_CLK_DLA_AXI, "dla_axi", "dla_bus", 0),
> +       JH7100_GATE(JH7100_CLK_DLANOC_AXI, "dlanoc_axi", "dla_bus", 0),
> +       JH7100_GATE(JH7100_CLK_DLA_APB, "dla_apb", "apb1_bus", 0),
> +       JH7100_GDIV(JH7100_CLK_VP6_CORE, "vp6_core", "dsp_root_div", 4, 0=
),
> +       JH7100__DIV(JH7100_CLK_VP6BUS_SRC, "vp6bus_src", "dsp_root", 4),
> +       JH7100_GDIV(JH7100_CLK_VP6_AXI, "vp6_axi", "vp6bus_src", 4, 0),
> +       JH7100__DIV(JH7100_CLK_VCDECBUS_SRC, "vcdecbus_src", "cdechifi4_r=
oot", 4),
> +       JH7100__DIV(JH7100_CLK_VDEC_BUS, "vdec_bus", "vcdecbus_src", 8),
> +       JH7100_GATE(JH7100_CLK_VDEC_AXI, "vdec_axi", "vdec_bus", 0),
> +       JH7100_GATE(JH7100_CLK_VDECBRG_MAIN, "vdecbrg_mainclk", "vdec_bus=
", 0),
> +       JH7100_GDIV(JH7100_CLK_VDEC_BCLK, "vdec_bclk", "vcdecbus_src", 8,=
 0),
> +       JH7100_GDIV(JH7100_CLK_VDEC_CCLK, "vdec_cclk", "cdec_root", 8, 0),
> +       JH7100_GATE(JH7100_CLK_VDEC_APB, "vdec_apb", "apb1_bus", 0),
> +       JH7100_GDIV(JH7100_CLK_JPEG_AXI, "jpeg_axi", "cpunbus_root_div", =
8, 0),
> +       JH7100_GDIV(JH7100_CLK_JPEG_CCLK, "jpeg_cclk", "cpunbus_root_div"=
, 8, 0),
> +       JH7100_GATE(JH7100_CLK_JPEG_APB, "jpeg_apb", "apb1_bus", 0),
> +       JH7100_GDIV(JH7100_CLK_GC300_2X, "gc300_2x", "cdechifi4_root", 8,=
 0),
> +       JH7100_GATE(JH7100_CLK_GC300_AHB, "gc300_ahb", "ahb_bus", 0),
> +       JH7100__DIV(JH7100_CLK_JPCGC300_AXIBUS, "jpcgc300_axibus", "vcdec=
bus_src", 8),
> +       JH7100_GATE(JH7100_CLK_GC300_AXI, "gc300_axi", "jpcgc300_axibus",=
 0),
> +       JH7100_GATE(JH7100_CLK_JPCGC300_MAIN, "jpcgc300_mainclk", "jpcgc3=
00_axibus", 0),
> +       JH7100__DIV(JH7100_CLK_VENC_BUS, "venc_bus", "vcdecbus_src", 8),
> +       JH7100_GATE(JH7100_CLK_VENC_AXI, "venc_axi", "venc_bus", 0),
> +       JH7100_GATE(JH7100_CLK_VENCBRG_MAIN, "vencbrg_mainclk", "venc_bus=
", 0),
> +       JH7100_GDIV(JH7100_CLK_VENC_BCLK, "venc_bclk", "vcdecbus_src", 8,=
 0),
> +       JH7100_GDIV(JH7100_CLK_VENC_CCLK, "venc_cclk", "cdec_root", 8, 0),
> +       JH7100_GATE(JH7100_CLK_VENC_APB, "venc_apb", "apb1_bus", 0),
> +       JH7100_GDIV(JH7100_CLK_DDRPLL_DIV2, "ddrpll_div2", "pll1_out", 2,=
 CLK_IGNORE_UNUSED),
> +       JH7100_GDIV(JH7100_CLK_DDRPLL_DIV4, "ddrpll_div4", "ddrpll_div2",=
 2, CLK_IGNORE_UNUSED),
> +       JH7100_GDIV(JH7100_CLK_DDRPLL_DIV8, "ddrpll_div8", "ddrpll_div4",=
 2, CLK_IGNORE_UNUSED),
> +       JH7100_GDIV(JH7100_CLK_DDROSC_DIV2, "ddrosc_div2", "osc_sys", 2, =
CLK_IGNORE_UNUSED),
> +       JH7100_GMUX(JH7100_CLK_DDRC0, "ddrc0", ddrc0_sels, CLK_IGNORE_UNU=
SED),
> +       JH7100_GMUX(JH7100_CLK_DDRC1, "ddrc1", ddrc1_sels, CLK_IGNORE_UNU=
SED),

Is it really unused? Or it is CLK_IS_CRITICAL?

> +       JH7100_GATE(JH7100_CLK_DDRPHY_APB, "ddrphy_apb", "apb1_bus", CLK_=
IGNORE_UNUSED),
> +       JH7100__DIV(JH7100_CLK_NOC_ROB, "noc_rob", "cpunbus_root_div", 8),
> +       JH7100__DIV(JH7100_CLK_NOC_COG, "noc_cog", "dla_root", 8),
> +       JH7100_GATE(JH7100_CLK_NNE_AHB, "nne_ahb", "ahb_bus", 0),
> +       JH7100__DIV(JH7100_CLK_NNEBUS_SRC1, "nnebus_src1", "dsp_root", 4),
> +       JH7100__MUX(JH7100_CLK_NNE_BUS, "nne_bus", nne_bus_sels),
> +       JH7100_GATE(JH7100_CLK_NNE_AXI, "nne_axi", "nne_bus", 0),
> +       JH7100_GATE(JH7100_CLK_NNENOC_AXI, "nnenoc_axi", "nne_bus", 0),
> +       JH7100_GATE(JH7100_CLK_DLASLV_AXI, "dlaslv_axi", "nne_bus", 0),
> +       JH7100_GATE(JH7100_CLK_DSPX2C_AXI, "dspx2c_axi", "nne_bus", CLK_I=
GNORE_UNUSED),
> +       JH7100__DIV(JH7100_CLK_HIFI4_SRC, "hifi4_src", "cdechifi4_root", =
4),
> +       JH7100__DIV(JH7100_CLK_HIFI4_COREFREE, "hifi4_corefree", "hifi4_s=
rc", 8),
> +       JH7100_GATE(JH7100_CLK_HIFI4_CORE, "hifi4_core", "hifi4_corefree"=
, 0),
> +       JH7100__DIV(JH7100_CLK_HIFI4_BUS, "hifi4_bus", "hifi4_corefree", =
8),
> +       JH7100_GATE(JH7100_CLK_HIFI4_AXI, "hifi4_axi", "hifi4_bus", 0),
> +       JH7100_GATE(JH7100_CLK_HIFI4NOC_AXI, "hifi4noc_axi", "hifi4_bus",=
 0),
> +       JH7100__DIV(JH7100_CLK_SGDMA1P_BUS, "sgdma1p_bus", "cpunbus_root_=
div", 8),
> +       JH7100_GATE(JH7100_CLK_SGDMA1P_AXI, "sgdma1p_axi", "sgdma1p_bus",=
 0),
> +       JH7100_GATE(JH7100_CLK_DMA1P_AXI, "dma1p_axi", "sgdma1p_bus", 0),
> +       JH7100_GDIV(JH7100_CLK_X2C_AXI, "x2c_axi", "cpunbus_root_div", 8,=
 CLK_IGNORE_UNUSED),
> +       JH7100__DIV(JH7100_CLK_USB_BUS, "usb_bus", "cpunbus_root_div", 8),
> +       JH7100_GATE(JH7100_CLK_USB_AXI, "usb_axi", "usb_bus", 0),
> +       JH7100_GATE(JH7100_CLK_USBNOC_AXI, "usbnoc_axi", "usb_bus", 0),
> +       JH7100__DIV(JH7100_CLK_USBPHY_ROOTDIV, "usbphy_rootdiv", "gmacusb=
_root", 4),
> +       JH7100_GDIV(JH7100_CLK_USBPHY_125M, "usbphy_125m", "usbphy_rootdi=
v", 8, 0),
> +       JH7100_GDIV(JH7100_CLK_USBPHY_PLLDIV25M, "usbphy_plldiv25m", "usb=
phy_rootdiv", 32, 0),
> +       JH7100__MUX(JH7100_CLK_USBPHY_25M, "usbphy_25m", usbphy_25m_sels),
> +       JH7100__DIV(JH7100_CLK_AUDIO_DIV, "audio_div", "audio_root", 1310=
72),
> +       JH7100_GATE(JH7100_CLK_AUDIO_SRC, "audio_src", "audio_div", 0),
> +       JH7100_GATE(JH7100_CLK_AUDIO_12288, "audio_12288", "osc_aud", 0),
> +       JH7100_GDIV(JH7100_CLK_VIN_SRC, "vin_src", "vin_root", 4, 0),
> +       JH7100__DIV(JH7100_CLK_ISP0_BUS, "isp0_bus", "vin_src", 8),
> +       JH7100_GATE(JH7100_CLK_ISP0_AXI, "isp0_axi", "isp0_bus", 0),
> +       JH7100_GATE(JH7100_CLK_ISP0NOC_AXI, "isp0noc_axi", "isp0_bus", 0),
> +       JH7100_GATE(JH7100_CLK_ISPSLV_AXI, "ispslv_axi", "isp0_bus", 0),
> +       JH7100__DIV(JH7100_CLK_ISP1_BUS, "isp1_bus", "vin_src", 8),
> +       JH7100_GATE(JH7100_CLK_ISP1_AXI, "isp1_axi", "isp1_bus", 0),
> +       JH7100_GATE(JH7100_CLK_ISP1NOC_AXI, "isp1noc_axi", "isp1_bus", 0),
> +       JH7100__DIV(JH7100_CLK_VIN_BUS, "vin_bus", "vin_src", 8),
> +       JH7100_GATE(JH7100_CLK_VIN_AXI, "vin_axi", "vin_bus", 0),
> +       JH7100_GATE(JH7100_CLK_VINNOC_AXI, "vinnoc_axi", "vin_bus", 0),
> +       JH7100_GDIV(JH7100_CLK_VOUT_SRC, "vout_src", "vout_root", 4, 0),
> +       JH7100__DIV(JH7100_CLK_DISPBUS_SRC, "dispbus_src", "voutbus_root"=
, 4),
> +       JH7100__DIV(JH7100_CLK_DISP_BUS, "disp_bus", "dispbus_src", 4),
> +       JH7100_GATE(JH7100_CLK_DISP_AXI, "disp_axi", "disp_bus", 0),
> +       JH7100_GATE(JH7100_CLK_DISPNOC_AXI, "dispnoc_axi", "disp_bus", 0),
> +       JH7100_GATE(JH7100_CLK_SDIO0_AHB, "sdio0_ahb", "ahb_bus", 0),
> +       JH7100_GDIV(JH7100_CLK_SDIO0_CCLKINT, "sdio0_cclkint", "perh0_src=
", 24, 0),
> +       JH7100__INV(JH7100_CLK_SDIO0_CCLKINT_INV, "sdio0_cclkint_inv", "s=
dio0_cclkint"),
> +       JH7100_GATE(JH7100_CLK_SDIO1_AHB, "sdio1_ahb", "ahb_bus", 0),
> +       JH7100_GDIV(JH7100_CLK_SDIO1_CCLKINT, "sdio1_cclkint", "perh1_src=
", 24, 0),
> +       JH7100__INV(JH7100_CLK_SDIO1_CCLKINT_INV, "sdio1_cclkint_inv", "s=
dio1_cclkint"),
> +       JH7100_GATE(JH7100_CLK_GMAC_AHB, "gmac_ahb", "ahb_bus", 0),
> +       JH7100__DIV(JH7100_CLK_GMAC_ROOT_DIV, "gmac_root_div", "gmacusb_r=
oot", 8),
> +       JH7100_GDIV(JH7100_CLK_GMAC_PTP_REF, "gmac_ptp_refclk", "gmac_roo=
t_div", 31, 0),
> +       JH7100_GDIV(JH7100_CLK_GMAC_GTX, "gmac_gtxclk", "gmac_root_div", =
255, 0),
> +       JH7100_GDIV(JH7100_CLK_GMAC_RMII_TX, "gmac_rmii_txclk", "gmac_rmi=
i_ref", 8, 0),
> +       JH7100_GDIV(JH7100_CLK_GMAC_RMII_RX, "gmac_rmii_rxclk", "gmac_rmi=
i_ref", 8, 0),
> +       JH7100__MUX(JH7100_CLK_GMAC_TX, "gmac_tx", gmac_tx_sels),
> +       JH7100__INV(JH7100_CLK_GMAC_TX_INV, "gmac_tx_inv", "gmac_tx"),
> +       JH7100__MUX(JH7100_CLK_GMAC_RX_PRE, "gmac_rx_pre", gmac_rx_pre_se=
ls),
> +       JH7100__INV(JH7100_CLK_GMAC_RX_INV, "gmac_rx_inv", "gmac_rx_pre"),
> +       JH7100_GATE(JH7100_CLK_GMAC_RMII, "gmac_rmii", "gmac_rmii_ref", 0=
),
> +       JH7100_GDIV(JH7100_CLK_GMAC_TOPHYREF, "gmac_tophyref", "gmac_root=
_div", 127, 0),
> +       JH7100_GATE(JH7100_CLK_SPI2AHB_AHB, "spi2ahb_ahb", "ahb_bus", 0),
> +       JH7100_GDIV(JH7100_CLK_SPI2AHB_CORE, "spi2ahb_core", "perh0_src",=
 31, 0),
> +       JH7100_GATE(JH7100_CLK_EZMASTER_AHB, "ezmaster_ahb", "ahb_bus", 0=
),
> +       JH7100_GATE(JH7100_CLK_E24_AHB, "e24_ahb", "ahb_bus", 0),
> +       JH7100_GATE(JH7100_CLK_E24RTC_TOGGLE, "e24rtc_toggle", "osc_sys",=
 0),
> +       JH7100_GATE(JH7100_CLK_QSPI_AHB, "qspi_ahb", "ahb_bus", 0),
> +       JH7100_GATE(JH7100_CLK_QSPI_APB, "qspi_apb", "apb1_bus", 0),
> +       JH7100_GDIV(JH7100_CLK_QSPI_REF, "qspi_refclk", "perh0_src", 31, =
0),
> +       JH7100_GATE(JH7100_CLK_SEC_AHB, "sec_ahb", "ahb_bus", 0),
> +       JH7100_GATE(JH7100_CLK_AES, "aes_clk", "sec_ahb", 0),
> +       JH7100_GATE(JH7100_CLK_SHA, "sha_clk", "sec_ahb", 0),
> +       JH7100_GATE(JH7100_CLK_PKA, "pka_clk", "sec_ahb", 0),
> +       JH7100_GATE(JH7100_CLK_TRNG_APB, "trng_apb", "apb1_bus", 0),
> +       JH7100_GATE(JH7100_CLK_OTP_APB, "otp_apb", "apb1_bus", 0),
> +       JH7100_GATE(JH7100_CLK_UART0_APB, "uart0_apb", "apb1_bus", 0),
> +       JH7100_GDIV(JH7100_CLK_UART0_CORE, "uart0_core", "perh1_src", 63,=
 0),
> +       JH7100_GATE(JH7100_CLK_UART1_APB, "uart1_apb", "apb1_bus", 0),
> +       JH7100_GDIV(JH7100_CLK_UART1_CORE, "uart1_core", "perh1_src", 63,=
 0),
> +       JH7100_GATE(JH7100_CLK_SPI0_APB, "spi0_apb", "apb1_bus", 0),
> +       JH7100_GDIV(JH7100_CLK_SPI0_CORE, "spi0_core", "perh1_src", 63, 0=
),
> +       JH7100_GATE(JH7100_CLK_SPI1_APB, "spi1_apb", "apb1_bus", 0),
> +       JH7100_GDIV(JH7100_CLK_SPI1_CORE, "spi1_core", "perh1_src", 63, 0=
),
> +       JH7100_GATE(JH7100_CLK_I2C0_APB, "i2c0_apb", "apb1_bus", 0),
> +       JH7100_GDIV(JH7100_CLK_I2C0_CORE, "i2c0_core", "perh1_src", 63, 0=
),
> +       JH7100_GATE(JH7100_CLK_I2C1_APB, "i2c1_apb", "apb1_bus", 0),
> +       JH7100_GDIV(JH7100_CLK_I2C1_CORE, "i2c1_core", "perh1_src", 63, 0=
),
> +       JH7100_GATE(JH7100_CLK_GPIO_APB, "gpio_apb", "apb1_bus", 0),
> +       JH7100_GATE(JH7100_CLK_UART2_APB, "uart2_apb", "apb2_bus", 0),
> +       JH7100_GDIV(JH7100_CLK_UART2_CORE, "uart2_core", "perh0_src", 63,=
 0),
> +       JH7100_GATE(JH7100_CLK_UART3_APB, "uart3_apb", "apb2_bus", 0),
> +       JH7100_GDIV(JH7100_CLK_UART3_CORE, "uart3_core", "perh0_src", 63,=
 0),
> +       JH7100_GATE(JH7100_CLK_SPI2_APB, "spi2_apb", "apb2_bus", 0),
> +       JH7100_GDIV(JH7100_CLK_SPI2_CORE, "spi2_core", "perh0_src", 63, 0=
),
> +       JH7100_GATE(JH7100_CLK_SPI3_APB, "spi3_apb", "apb2_bus", 0),
> +       JH7100_GDIV(JH7100_CLK_SPI3_CORE, "spi3_core", "perh0_src", 63, 0=
),
> +       JH7100_GATE(JH7100_CLK_I2C2_APB, "i2c2_apb", "apb2_bus", 0),
> +       JH7100_GDIV(JH7100_CLK_I2C2_CORE, "i2c2_core", "perh0_src", 63, 0=
),
> +       JH7100_GATE(JH7100_CLK_I2C3_APB, "i2c3_apb", "apb2_bus", 0),
> +       JH7100_GDIV(JH7100_CLK_I2C3_CORE, "i2c3_core", "perh0_src", 63, 0=
),
> +       JH7100_GATE(JH7100_CLK_WDTIMER_APB, "wdtimer_apb", "apb2_bus", 0),
> +       JH7100_GDIV(JH7100_CLK_WDT_CORE, "wdt_coreclk", "perh0_src", 63, =
0),
> +       JH7100_GDIV(JH7100_CLK_TIMER0_CORE, "timer0_coreclk", "perh0_src"=
, 63, 0),
> +       JH7100_GDIV(JH7100_CLK_TIMER1_CORE, "timer1_coreclk", "perh0_src"=
, 63, 0),
> +       JH7100_GDIV(JH7100_CLK_TIMER2_CORE, "timer2_coreclk", "perh0_src"=
, 63, 0),
> +       JH7100_GDIV(JH7100_CLK_TIMER3_CORE, "timer3_coreclk", "perh0_src"=
, 63, 0),
> +       JH7100_GDIV(JH7100_CLK_TIMER4_CORE, "timer4_coreclk", "perh0_src"=
, 63, 0),
> +       JH7100_GDIV(JH7100_CLK_TIMER5_CORE, "timer5_coreclk", "perh0_src"=
, 63, 0),
> +       JH7100_GDIV(JH7100_CLK_TIMER6_CORE, "timer6_coreclk", "perh0_src"=
, 63, 0),
> +       JH7100_GATE(JH7100_CLK_VP6INTC_APB, "vp6intc_apb", "apb2_bus", 0),
> +       JH7100_GATE(JH7100_CLK_PWM_APB, "pwm_apb", "apb2_bus", 0),
> +       JH7100_GATE(JH7100_CLK_MSI_APB, "msi_apb", "apb2_bus", 0),
> +       JH7100_GATE(JH7100_CLK_TEMP_APB, "temp_apb", "apb2_bus", 0),
> +       JH7100_GDIV(JH7100_CLK_TEMP_SENSE, "temp_sense", "osc_sys", 31, 0=
),
> +       JH7100_GATE(JH7100_CLK_SYSERR_APB, "syserr_apb", "apb2_bus", 0),
> +};
> +
> +static struct clk_hw *clk_starfive_jh7100_get(struct of_phandle_args *cl=
kspec, void *data)
> +{
> +       struct clk_starfive_jh7100_priv *priv =3D data;
> +       unsigned int idx =3D clkspec->args[0];
> +
> +       if (idx >=3D JH7100_CLK_END) {
> +               dev_err(priv->dev, "invalid clock index %u\n", idx);

We should pull this sort of error message up into the core instead of
have it in every driver. It also doesn't look very meaningful to print
the name of the device that's providing the clks vs. the name of the
device that's requesting the clk that can't be found.

> +               return ERR_PTR(-EINVAL);
> +       }
> +
> +       if (idx >=3D JH7100_CLK_PLL0_OUT)
> +               return priv->pll[idx - JH7100_CLK_PLL0_OUT];
> +
> +       return &priv->reg[idx].hw;
> +}
> +
> +static int __init clk_starfive_jh7100_probe(struct platform_device *pdev)

Drop __init as this can be called after kernel init is over.

> +{
> +       struct clk_starfive_jh7100_priv *priv;
> +       unsigned int idx;
> +       int ret;
> +
> +       priv =3D devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       spin_lock_init(&priv->rmw_lock);
> +       priv->dev =3D &pdev->dev;
> +       priv->base =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(priv->base))
> +               return PTR_ERR(priv->base);
> +
> +       priv->pll[0] =3D devm_clk_hw_register_fixed_factor(priv->dev, "pl=
l0_out",
> +                                                        "osc_sys", 0, 40=
, 1);
> +       if (IS_ERR(priv->pll[0]))
> +               return PTR_ERR(priv->pll[0]);
> +
> +       priv->pll[1] =3D devm_clk_hw_register_fixed_factor(priv->dev, "pl=
l1_out",
> +                                                        "osc_sys", 0, 64=
, 1);
> +       if (IS_ERR(priv->pll[1]))
> +               return PTR_ERR(priv->pll[1]);
> +
> +       priv->pll[2] =3D devm_clk_hw_register_fixed_factor(priv->dev, "pl=
l2_out",
> +                                                        "pll2_refclk", 0=
, 55, 1);
> +       if (IS_ERR(priv->pll[2]))
> +               return PTR_ERR(priv->pll[2]);
> +
> +       for (idx =3D 0; idx < JH7100_CLK_PLL0_OUT; idx++) {
> +               u32 max_parent =3D (jh7100_clk_data[idx].max & JH7100_CLK=
_MUX_MASK) >>
> +                                JH7100_CLK_MUX_SHIFT;
> +               struct clk_init_data init =3D {
> +                       .name =3D jh7100_clk_data[idx].name,
> +                       .ops =3D jh7100_clk_data[idx].ops,
> +                       .num_parents =3D max_parent + 1,
> +                       .flags =3D jh7100_clk_data[idx].flags,
> +               };
> +               struct jh7100_clk *clk =3D &priv->reg[idx];
> +
> +               if (init.num_parents > 1)
> +                       init.parent_names =3D jh7100_clk_data[idx].parent=
s;
> +               else
> +                       init.parent_names =3D &jh7100_clk_data[idx].paren=
t;

Can you use clk_parent_data instead of parent_names? To make the object
size even smaller you can use the DT index instead of the .fw_name
field.=20

> +
> +               clk->hw.init =3D &init;
> +               clk->idx =3D idx;
> +               clk->max =3D jh7100_clk_data[idx].max;
> +
> +               ret =3D clk_hw_register(priv->dev, &clk->hw);

Why not use devm_clk_hw_register()?

> +               if (ret)
> +                       goto err;
> +       }
> +
> +       ret =3D devm_of_clk_add_hw_provider(priv->dev, clk_starfive_jh710=
0_get, priv);
> +       if (ret)
> +               goto err;
> +
> +       return 0;
> +err:
> +       while (idx)
> +               clk_hw_unregister(&priv->reg[--idx].hw);
> +       return ret;
> +}
> +
> +static const struct of_device_id clk_starfive_jh7100_match[] =3D {
> +       { .compatible =3D "starfive,jh7100-clkgen" },
> +       { /* sentinel */ }
> +};

Please add MODULE_DEVICE_TABLE()

> +
> +static struct platform_driver clk_starfive_jh7100_driver =3D {
> +       .probe =3D clk_starfive_jh7100_probe,
> +       .driver =3D {
