Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D1DC22C4FD
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Jul 2020 14:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726841AbgGXMTd (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Jul 2020 08:19:33 -0400
Received: from esa4.microchip.iphmx.com ([68.232.154.123]:50589 "EHLO
        esa4.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726258AbgGXMTc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Jul 2020 08:19:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1595593171; x=1627129171;
  h=references:from:to:cc:subject:in-reply-to:date:
   message-id:mime-version;
  bh=ISuDDEl19t08M8JPm6jVLTyCet67H+72ia5n8gxdcy0=;
  b=eut4Rjd/H2QDL+stj0+Wmih2t5ybBq3jz5BLNlSnVH6bUzJyxcRYmGoE
   H3yOsQVqDRHMxgJbEfXtqWiUu9c1uA19ISB7PJJtguIypfB2xjFspuPxp
   BnCNab1Q9YgixOFlpTXtPm1bSKeD7O+Bc16PaKrVr89/+C5APNLNR0Ovn
   EyVopeVulbX3ldNBTvG22ncv6JS7Ydn+0+0RgbgxrPeyyIyx1I78wVogT
   iRgAcDFNTDcz1rQkT/pORfCSZa82lIRI0xODpOObo3WU8jhbriD6+ZCHt
   cvmTKMiLibuEN3gVgc/EwfJcgnD21+o5wyAzN6K7BTPKkCb6MkdASRmTf
   w==;
IronPort-SDR: jscqJuo6YhQJCxuxaedGkwuf8YsvXzeKCApKuQ2q6/L7mA3W1jMw6qT+3+Pm5BO7+c6Eqc4kUE
 hv5g9PLWV3y6wM6fYYyh4rWLMQSDcIRBrdnkLZvWdp2AkElU1vtNvCfXblzKTEDwNkOmgOu136
 l1I0pBDZBmqUjEZ6kvlz01aulaVJVLfsk90LdzSQHSA3v6mGLttoZ8H6f/M7m31MviDmofILVM
 Bg+1wrpft5VaPCyqIBPhY8bn65pG3z6XBG96J9u2lbih1OI/DJ+moADBnREzT0Awvs7jZ4iAXd
 4Ko=
X-IronPort-AV: E=Sophos;i="5.75,390,1589266800"; 
   d="scan'208";a="81163375"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Jul 2020 05:19:30 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Fri, 24 Jul 2020 05:18:47 -0700
Received: from soft-dev15.microsemi.net.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1979.3
 via Frontend Transport; Fri, 24 Jul 2020 05:18:44 -0700
References: <20200615133242.24911-1-lars.povlsen@microchip.com> <20200615133242.24911-9-lars.povlsen@microchip.com> <159558008977.3847286.10561464126267966931@swboyd.mtv.corp.google.com>
From:   Lars Povlsen <lars.povlsen@microchip.com>
To:     Stephen Boyd <sboyd@kernel.org>
CC:     Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        SoC Team <soc@kernel.org>,
        Lars Povlsen <lars.povlsen@microchip.com>,
        "Steen Hegelund" <Steen.Hegelund@microchip.com>,
        Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
        Olof Johansson <olof@lixom.net>,
        "Michael Turquette" <mturquette@baylibre.com>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v3 08/10] clk: sparx5: Add Sparx5 SoC DPLL clock driver
In-Reply-To: <159558008977.3847286.10561464126267966931@swboyd.mtv.corp.google.com>
Date:   Fri, 24 Jul 2020 14:19:25 +0200
Message-ID: <87y2n9f6lu.fsf@soft-dev15.microsemi.net>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org


Hi Stephen!

Thank you for your comments!

Stephen Boyd writes:

> Quoting Lars Povlsen (2020-06-15 06:32:40)
>> diff --git a/drivers/clk/clk-sparx5.c b/drivers/clk/clk-sparx5.c
>> new file mode 100644
>> index 0000000000000..c2e7aa0214ebd
>> --- /dev/null
>> +++ b/drivers/clk/clk-sparx5.c
>> @@ -0,0 +1,312 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Microchip Sparx5 SoC Clock driver.
>> + *
>> + * Copyright (c) 2019 Microchip Inc.
>> + *
>> + * Author: Lars Povlsen <lars.povlsen@microchip.com>
>> + */
>> +
>> +#include <linux/io.h>
>> +#include <linux/module.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/bitfield.h>
>> +#include <linux/of.h>
>> +#include <linux/of_address.h>
>
> Is this include used?

Nope, gone now.

>
>> +#include <linux/slab.h>
>> +#include <linux/platform_device.h>
>> +#include <dt-bindings/clock/microchip,sparx5.h>
>> +
>> +#define PLL_DIV                GENMASK(7, 0)
>> +#define PLL_PRE_DIV    GENMASK(10, 8)
>> +#define PLL_ROT_DIR    BIT(11)
>> +#define PLL_ROT_SEL    GENMASK(13, 12)
>> +#define PLL_ROT_ENA    BIT(14)
>> +#define PLL_CLK_ENA    BIT(15)
>> +
>> +#define MAX_SEL 4
>> +#define MAX_PRE BIT(3)
>> +
>> +static const u8 sel_rates[MAX_SEL] = { 0, 2*8, 2*4, 2*2 };
>> +
>> +static const char *clk_names[N_CLOCKS] = {
>> +       "core", "ddr", "cpu2", "arm2",
>> +       "aux1", "aux2", "aux3", "aux4",
>> +       "synce",
>> +};
>> +
>> +struct s5_hw_clk {
>> +       struct clk_hw hw;
>> +       void __iomem *reg;
>> +       int index;
>
> This looks unused. Drop it?
>

Yes, that was a leftover. Good find.

>> +};
>> +
>> +struct s5_clk_data {
>> +       void __iomem *base;
>> +       struct s5_hw_clk s5_hw[N_CLOCKS];
>> +};
>> +
>> +struct s5_pll_conf {
>> +       int freq;
>
> Why not unsigned long like the type that s5_calc_freq() returns?
>

Good point, changed it.

>> +       u8 div;
>> +       bool rot_ena;
>> +       u8 rot_sel;
>> +       u8 rot_dir;
>> +       u8 pre_div;
>> +};
>> +
>> +#define to_s5_pll(hw) container_of(hw, struct s5_hw_clk, hw)
>> +
>> +static unsigned long s5_calc_freq(unsigned long parent_rate,
>> +                                 const struct s5_pll_conf *conf)
>> +{
>> +       unsigned long rate = parent_rate / conf->div;
>> +
>> +       if (conf->rot_ena) {
>> +               int sign = conf->rot_dir ? -1 : 1;
>> +               int divt = sel_rates[conf->rot_sel] * (1 + conf->pre_div);
>> +               int divb = divt + sign;
>> +
>> +               rate = mult_frac(rate, divt, divb);
>> +               rate = roundup(rate, 1000);
>> +       }
>> +
>> +       return rate;
>> +}
>> +
>> +static void s5_search_fractional(unsigned long rate,
>> +                                unsigned long parent_rate,
>> +                                int div,
>> +                                struct s5_pll_conf *conf)
>> +{
>> +       struct s5_pll_conf best;
>> +       ulong cur_offset, best_offset = rate;
>> +       int d, i, j;
>> +
>> +       memset(conf, 0, sizeof(*conf));
>> +       conf->div = div;
>> +       conf->rot_ena = 1;      /* Fractional rate */
>> +
>> +       for (d = 0; best_offset > 0 && d <= 1 ; d++) {
>> +               conf->rot_dir = !!d;
>> +               for (i = 0; best_offset > 0 && i < MAX_PRE; i++) {
>> +                       conf->pre_div = i;
>> +                       for (j = 1; best_offset > 0 && j < MAX_SEL; j++) {
>> +                               conf->rot_sel = j;
>> +                               conf->freq = s5_calc_freq(parent_rate, conf);
>> +                               cur_offset = abs(rate - conf->freq);
>> +                               if (cur_offset < best_offset) {
>> +                                       best_offset = cur_offset;
>> +                                       best = *conf;
>> +                               }
>> +                       }
>> +               }
>> +       }
>> +
>> +       /* Best match */
>> +       *conf = best;
>> +}
>> +
>> +static unsigned long s5_calc_params(unsigned long rate,
>> +                                   unsigned long parent_rate,
>> +                                   struct s5_pll_conf *conf)
>> +{
>> +       if (parent_rate % rate) {
>> +               struct s5_pll_conf alt1, alt2;
>> +               int div;
>> +
>> +               div = DIV_ROUND_CLOSEST_ULL(parent_rate, rate);
>> +               s5_search_fractional(rate, parent_rate, div, &alt1);
>> +
>> +               /* Straight match? */
>> +               if (alt1.freq == rate) {
>> +                       *conf = alt1;
>> +               } else {
>> +                       /* Try without rounding divider */
>> +                       div = parent_rate / rate;
>> +                       if (div != alt1.div) {
>> +                               s5_search_fractional(rate, parent_rate, div,
>> +                                                    &alt2);
>> +                               /* Select the better match */
>> +                               if (abs(rate - alt1.freq) <
>> +                                   abs(rate - alt2.freq))
>> +                                       *conf = alt1;
>> +                               else
>> +                                       *conf = alt2;
>> +                       }
>> +               }
>> +       } else {
>> +               /* Straight fit */
>> +               memset(conf, 0, sizeof(*conf));
>> +               conf->div = parent_rate / rate;
>> +       }
>> +
>> +       return conf->freq;
>> +}
>> +
>> +static int s5_pll_enable(struct clk_hw *hw)
>> +{
>> +       struct s5_hw_clk *pll = to_s5_pll(hw);
>> +       u32 val = readl(pll->reg);
>> +
>> +       val |= PLL_CLK_ENA;
>> +       writel(val, pll->reg);
>> +
>> +       return 0;
>> +}
>> +
>> +static void s5_pll_disable(struct clk_hw *hw)
>> +{
>> +       struct s5_hw_clk *pll = to_s5_pll(hw);
>> +       u32 val = readl(pll->reg);
>> +
>> +       val &= ~PLL_CLK_ENA;
>> +       writel(val, pll->reg);
>> +}
>> +
>> +static int s5_pll_set_rate(struct clk_hw *hw,
>> +                          unsigned long rate,
>> +                          unsigned long parent_rate)
>> +{
>> +       struct s5_hw_clk *pll = to_s5_pll(hw);
>> +       struct s5_pll_conf conf;
>> +       unsigned long eff_rate;
>> +       u32 val;
>> +
>> +       eff_rate = s5_calc_params(rate, parent_rate, &conf);
>> +       if (eff_rate != rate)
>> +               return -EOPNOTSUPP;
>> +
>> +       val = readl(pll->reg) & PLL_CLK_ENA;
>> +       val |= FIELD_PREP(PLL_DIV, conf.div);
>> +       if (conf.rot_ena) {
>> +               val |= PLL_ROT_ENA;
>> +               val |= FIELD_PREP(PLL_ROT_SEL, conf.rot_sel);
>> +               val |= FIELD_PREP(PLL_PRE_DIV, conf.pre_div);
>> +               if (conf.rot_dir)
>> +                       val |= PLL_ROT_DIR;
>> +       }
>> +       writel(val, pll->reg);
>> +
>> +       return 0;
>> +}
>> +
>> +static unsigned long s5_pll_recalc_rate(struct clk_hw *hw,
>> +                                       unsigned long parent_rate)
>> +{
>> +       struct s5_hw_clk *pll = to_s5_pll(hw);
>> +       struct s5_pll_conf conf;
>> +       u32 val;
>> +
>> +       val = readl(pll->reg);
>> +
>> +       if (val & PLL_CLK_ENA) {
>> +               conf.div     = FIELD_GET(PLL_DIV, val);
>> +               conf.pre_div = FIELD_GET(PLL_PRE_DIV, val);
>> +               conf.rot_ena = FIELD_GET(PLL_ROT_ENA, val);
>> +               conf.rot_dir = FIELD_GET(PLL_ROT_DIR, val);
>> +               conf.rot_sel = FIELD_GET(PLL_ROT_SEL, val);
>> +
>> +               conf.freq = s5_calc_freq(parent_rate, &conf);
>> +       } else
>> +               conf.freq = 0;
>
> Nitpick: Please add braces on single line else statements when the if is
> multiline.
>

Done.

>> +
>> +       return conf.freq;
>> +}
>> +
>> +static long s5_pll_round_rate(struct clk_hw *hw, unsigned long rate,
>> +                             unsigned long *parent_rate)
>> +{
>> +       struct s5_pll_conf conf;
>> +
>> +       return s5_calc_params(rate, *parent_rate, &conf);
>> +}
>> +
>> +static const struct clk_ops s5_pll_ops = {
>> +       .enable         = s5_pll_enable,
>> +       .disable        = s5_pll_disable,
>> +       .set_rate       = s5_pll_set_rate,
>> +       .round_rate     = s5_pll_round_rate,
>> +       .recalc_rate    = s5_pll_recalc_rate,
>> +};
>> +
>> +static struct clk_hw *s5_clk_hw_get(struct of_phandle_args *clkspec, void *data)
>> +{
>> +       struct s5_clk_data *s5_clk = data;
>> +       unsigned int idx = clkspec->args[0];
>> +
>> +       if (idx >= N_CLOCKS) {
>> +               pr_err("%s: invalid index %u\n", __func__, idx);
>> +               return ERR_PTR(-EINVAL);
>> +       }
>> +
>> +       return &s5_clk->s5_hw[idx].hw;
>> +}
>> +
>> +static int s5_clk_probe(struct platform_device *pdev)
>> +{
>> +       struct device *dev = &pdev->dev;
>> +       struct device_node *np = dev->of_node;
>> +       int i, ret;
>> +       struct s5_clk_data *s5_clk;
>> +       const char *parent_name;
>> +       struct clk_init_data init = {
>> +               .ops = &s5_pll_ops,
>> +               .parent_names = &parent_name,
>
> It looks like with the binding you can drop parent_name and just use
> .parent_data = { .index = 0 } and event drop the .index = 0 bit because
> that's the default valjue.
>

Ok, I got rid of the parent_name and used .parent_data instead.


>> +               .num_parents = 1,
>> +       };
>> +
>> +       s5_clk = devm_kzalloc(dev, sizeof(*s5_clk), GFP_KERNEL);
>> +       if (!s5_clk)
>> +               return -ENOMEM;
>> +
>> +       s5_clk->base = devm_platform_ioremap_resource(pdev, 0);
>> +       if (IS_ERR(s5_clk->base))
>> +               return PTR_ERR(s5_clk->base);
>> +
>> +       parent_name = of_clk_get_parent_name(np, 0);
>> +       if (!parent_name) {
>> +               dev_err(dev, "%pOFn: missing parent clock\n", np);
>> +               return -EINVAL;
>> +       }
>
> It's nice because then this call goes away.
>

Yes.

>> +
>> +       for (i = 0; i < N_CLOCKS; i++) {
>> +               struct s5_hw_clk *s5_hw = &s5_clk->s5_hw[i];
>> +
>> +               init.name = clk_names[i];
>> +               s5_hw->index = i;
>> +               s5_hw->reg = s5_clk->base + (i * sizeof(u32));
>
> I'd prefer i * 4 because the hardware engineers probably don't care
> about the size of a u32 in bytes.
>

Sure.

>> +               s5_hw->hw.init = &init;
>> +               ret = devm_clk_hw_register(dev, &s5_hw->hw);
>> +               if (ret) {
>> +                       dev_err(dev, "failed to register %s clock\n",
>> +                               init.name);
>
> init.name will be destroyed. Just drop this error message? Maybe we
> should add it into the core framework because quite a few driver authors
> want it.
>
>> +                       return ret;
>> +               }
>> +       }
>> +
>> +       return of_clk_add_hw_provider(np, s5_clk_hw_get, s5_clk);
>
> Use devm_of_clk_add_hw_provider()?

Yes. Also removes 'np' variable.

>
>> +}
>> +
>> +static int s5_clk_remove(struct platform_device *pdev)
>> +{
>> +       of_clk_del_provider(pdev->dev.of_node);
>> +
>> +       return 0;
>> +}
>> +
>
> And then remove this whole remove function?
>

And yes.

>> +static const struct of_device_id s5_clk_dt_ids[] = {
>> +       { .compatible = "microchip,sparx5-dpll", },
>> +       { }
>> +};
>> +MODULE_DEVICE_TABLE(of, s5_clk_dt_ids);
>> +
>> +static struct platform_driver s5_clk_driver = {
>> +       .probe  = s5_clk_probe,
>> +       .remove = s5_clk_remove,
>> +       .driver = {
>> +               .name = "sparx5-clk",
>> +               .of_match_table = s5_clk_dt_ids,
>> +       },
>> +};

Thanks a lot for your comments - that shaved off some code!

I'll be refreshing the series shortly.

Cheers,

-- 
Lars Povlsen,
Microchip
