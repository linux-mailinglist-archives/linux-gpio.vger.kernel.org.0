Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9EED5D8EB
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Jul 2019 02:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727036AbfGCAax (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Jul 2019 20:30:53 -0400
Received: from mail-ot1-f65.google.com ([209.85.210.65]:35051 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726457AbfGCAaw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Jul 2019 20:30:52 -0400
Received: by mail-ot1-f65.google.com with SMTP id j19so489506otq.2;
        Tue, 02 Jul 2019 17:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Q0DTSEoJfAoRh/DNOfvOIAUC0JkelgBbLHyDpxdWx4k=;
        b=aW71dvXzx3/OZ2dyur8K2R3t59hdwnCvtsuhJGdee/nm9r6PCmqTtx+JWgAIJLo2/d
         Y21AhbIEphVmstcZOwfTGkQASbWx10y4fsfburjD7qorfBw7J73NAYnWdXDN5k5epES2
         9xsxotFn9XmfaHw9GsQaebN96U6pHmRUkIvbu0rqpCA3ltYn9AaqBA81bvwfZWb2bRXK
         PGExbAEeQJBbEYszopwMOpV+S9XN0z12R0Vy2r2L+ErpKfnQnxV/0MIwpTrNI/wPBJUQ
         Q4OJpy3R867Yl9+XNBz9RWRkL9MFWnLifF6/SdKW9uCH6tpmnrx4YKPqcv3J2LmnI790
         wFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Q0DTSEoJfAoRh/DNOfvOIAUC0JkelgBbLHyDpxdWx4k=;
        b=JyqDon+pTlje8hOecDtTi3T1tCiHKDoBqevjUXlT0QD1tKYWqRkUhzQiOIu46AsPOC
         7aEf+Xw9mBFZUaueoCQX03NjIg/mlgCQN66hA9SCfLWjrYM8QSL6IdNH75pkWwUq7ngY
         d1S0PqqAoGWjWunvwVCQUeWOgO8l14EX9uVWxX8UK2Y+AysM+Gcvx5al4rBFhQSoYV0/
         YMYyOcenwhKEv3jIepvyC7HlqUf5aNOSLmr6SJvJq3q9aGZs6m5Anom1Xh3RPtXWj34s
         uo8X2+8vK5qH8FaxvIBvC3x3euBkezXX7O073ONwiEhwFWO026xvKCOecHHhB55A+8Wj
         Yc1A==
X-Gm-Message-State: APjAAAXy6O1lSAnOZ4zZQfXUjHvcjK0SaQK1tqhBtMl1fn73k6DskWNj
        OlsdcuHptjogpcmfkBxc3T4yQWJMEOqtsOostw1gH1bH
X-Google-Smtp-Source: APXvYqy/QQUN0J6b4O2bTl3SYceaajLNKXdMQ4/wzOnMkRg4M4DkLByhdEGK3wJrQJDIJWZll9ZaCAX1i1L6mFoN5Ec=
X-Received: by 2002:a9d:39a6:: with SMTP id y35mr27395004otb.81.1562110146329;
 Tue, 02 Jul 2019 16:29:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190701091258.3870-1-narmstrong@baylibre.com> <20190701091258.3870-8-narmstrong@baylibre.com>
In-Reply-To: <20190701091258.3870-8-narmstrong@baylibre.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Wed, 3 Jul 2019 01:28:55 +0200
Message-ID: <CAFBinCAnKeGYkyCmEMugWuQaSxgBp4DqtHN3b0rLJY6jwOF0QA@mail.gmail.com>
Subject: Re: [RFC/RFT v3 07/14] clk: meson: g12a: add notifiers to handle cpu
 clock change
To:     sboyd@codeaurora.org, Neil Armstrong <narmstrong@baylibre.com>
Cc:     jbrunet@baylibre.com, khilman@baylibre.com,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Stephen, Hi Neil,

On Mon, Jul 1, 2019 at 11:13 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> In order to implement clock switching for the CLKID_CPU_CLK and
> CLKID_CPUB_CLK, notifiers are added on specific points of the
> clock tree :
>
> cpu_clk / cpub_clk
> |   \- cpu_clk_dyn
> |      |  \- cpu_clk_premux0
> |      |        |- cpu_clk_postmux0
> |      |        |    |- cpu_clk_dyn0_div
> |      |        |    \- xtal/fclk_div2/fclk_div3
> |      |        \- xtal/fclk_div2/fclk_div3
> |      \- cpu_clk_premux1
> |            |- cpu_clk_postmux1
> |            |    |- cpu_clk_dyn1_div
> |            |    \- xtal/fclk_div2/fclk_div3
> |            \- xtal/fclk_div2/fclk_div3
> \ sys_pll / sys1_pll
>
> This for each cluster, a single one for G12A, two for G12B.
>
> Each cpu_clk_premux1 tree is marked as read-only and CLK_SET_RATE_NO_REPARENT,
> to be used as "parking" clock in a safe clock frequency.
it seems that this is one case where the "coordinated clocks" feature
would come handy: [0]
Stephen, do you know if those patches stopped in March or if there's
still some ongoing effort to get them ready?

[...]
> -/*
> - * Internal sys pll emulation configuration parameters
> - */
> -static const struct reg_sequence g12a_sys_init_regs[] = {
> -       { .reg = HHI_SYS_PLL_CNTL1,     .def = 0x00000000 },
> -       { .reg = HHI_SYS_PLL_CNTL2,     .def = 0x00000000 },
> -       { .reg = HHI_SYS_PLL_CNTL3,     .def = 0x48681c00 },
> -       { .reg = HHI_SYS_PLL_CNTL4,     .def = 0x88770290 },
> -       { .reg = HHI_SYS_PLL_CNTL5,     .def = 0x39272000 },
> -       { .reg = HHI_SYS_PLL_CNTL6,     .def = 0x56540000 },
> +static const struct pll_mult_range g12a_sys_pll_mult_range = {
> +       .min = 128,
> +       .max = 250,
>  };
>
>  static struct clk_regmap g12a_sys_pll_dco = {
> @@ -124,14 +118,15 @@ static struct clk_regmap g12a_sys_pll_dco = {
>                         .shift   = 29,
>                         .width   = 1,
>                 },
> -               .init_regs = g12a_sys_init_regs,
> -               .init_count = ARRAY_SIZE(g12a_sys_init_regs),
> +               .range = &g12a_sys_pll_mult_range,
Neil, I believe that this should be a separate patch with a
description which explains why we don't need the "init regs" anymore

>         },
>         .hw.init = &(struct clk_init_data){
>                 .name = "sys_pll_dco",
> -               .ops = &meson_clk_pll_ro_ops,
> +               .ops = &meson_clk_pll_ops,
>                 .parent_names = (const char *[]){ IN_PREFIX "xtal" },
>                 .num_parents = 1,
> +               /* This clock feeds the CPU, avoid disabling it */
> +               .flags = CLK_IS_CRITICAL,
maybe we should have a separate patch for making the CPU clock tree
mutable as well

[...]
> +/* This divider uses bit 26 to take change in account */
> +static int g12b_cpub_clk_mux0_div_set_rate(struct clk_hw *hw,
> +                                          unsigned long rate,
> +                                          unsigned long parent_rate)
> +{
> +       struct clk_regmap *clk = to_clk_regmap(hw);
> +       struct clk_regmap_div_data *div = clk_get_regmap_div_data(clk);
> +       unsigned int val;
> +       int ret;
> +
> +       ret = divider_get_val(rate, parent_rate, div->table, div->width,
> +                             div->flags);
> +       if (ret < 0)
> +               return ret;
> +
> +       val = (unsigned int)ret << div->shift;
> +
> +       regmap_update_bits(clk->map, HHI_SYS_CPUB_CLK_CNTL,
> +                          SYS_CPU_DYN_ENABLE, SYS_CPU_DYN_ENABLE);
> +
> +       return regmap_update_bits(clk->map, div->offset,
> +                                 clk_div_mask(div->width) << div->shift |
> +                                 SYS_CPU_DYN_ENABLE, val);
> +};
the public S922X datasheet doesn't mention bit 26
do I understand the semantics correctly?:
- set SYS_CPU_DYN_ENABLE
- update the divider
- unset SYS_CPU_DYN_ENABLE

too bad it's not a gate which we could model with
CLK_SET_RATE_GATE/CLK_SET_RATE_UNGATE


Martin

[0] https://patchwork.kernel.org/patch/10838949/
