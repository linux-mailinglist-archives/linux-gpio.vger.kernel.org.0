Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8EA42AD99
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Oct 2021 22:08:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233507AbhJLUKN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Oct 2021 16:10:13 -0400
Received: from mail-pg1-f181.google.com ([209.85.215.181]:35780 "EHLO
        mail-pg1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232145AbhJLUKM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Oct 2021 16:10:12 -0400
Received: by mail-pg1-f181.google.com with SMTP id e7so178187pgk.2;
        Tue, 12 Oct 2021 13:08:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bbdMoLR3MNqiC0LoQYT4MoOoKEf+V9eiB1j1hxhS9ig=;
        b=gSKInIkfSZRroPqODLpmYD4IwDzkCuJg6h8Tc0kUlF6O/uCH/StdwHxA4mX+9exZn2
         UiTFRHj2qzeFkpmG5f5woUY2pTiMDF5alwqgygQmBVEprO0x80sq3P5XAHlYtWxlbIJ7
         W3XhMD2HZhsb8b0LLZjpSUDj9DP6SptOQ16loWyMEF35gg/tFXYLEcTWfuRahi+wbXTo
         kWfZHyjeMUCr9b5c8tgoODO07PVS3YxRwuW3aVx/M8lK+TZoLLUMyGBZm0VuWHfqikM/
         QP/sF29C97GKNF4xrj4tXxBs6Cycbr4KNuegRLkwQRs8CR8UNqTeowUWK8UTHBC0mPOD
         pr4g==
X-Gm-Message-State: AOAM533T5RSVPSSNrB+Er3ngqezBykvabcql3czaMdW7iMV21VRZsObN
        7+FpM/nxuBUjUriNbwNnZhCOdDpDUEkySHpyiqQ=
X-Google-Smtp-Source: ABdhPJxIEhT0A0wVpkAWyb3hc4t9hpN8499Vhqb8Bd3ysP1JQepCnuyK3svchcCWMyR37vDvVIpRQ22WzQAamqTLU+8=
X-Received: by 2002:a63:b11:: with SMTP id 17mr24269485pgl.51.1634069289917;
 Tue, 12 Oct 2021 13:08:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk> <20211012134027.684712-7-kernel@esmil.dk>
 <CAHp75Vetqi=FMoRxfXHL+d1DhAXgLr+5e7ss1M_Rkhqa07H5Jg@mail.gmail.com>
In-Reply-To: <CAHp75Vetqi=FMoRxfXHL+d1DhAXgLr+5e7ss1M_Rkhqa07H5Jg@mail.gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Tue, 12 Oct 2021 22:07:58 +0200
Message-ID: <CANBLGcyCpSrxQi7pxLWQLkgbVGAKxJMXhoVbF_DdYDiv5_YJXQ@mail.gmail.com>
Subject: Re: [PATCH v1 06/16] clk: starfive: Add JH7100 clock generator driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-riscv <linux-riscv@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
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
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, 12 Oct 2021 at 17:40, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
> On Tue, Oct 12, 2021 at 4:42 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> >
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> >
> > Add a driver for the StarFive JH7100 clock generator.
>
> ...
>
> > +config CLK_STARFIVE_JH7100
> > +       bool "StarFive JH7100 clock support"
> > +       depends on SOC_STARFIVE || COMPILE_TEST
>
> > +       depends on OF
>
> Why? I haven't found a compile dependency, so you reduce the test
> scope (when COMPILE_TEST=y).

My thinking was that it can't ever be loaded on a !OF system, but
you're right it'll just restrict compile testing. I'll remove, thanks.

> ...
>
> You are using
> bits.h
> mod_devicetable.h
> which are not here
>
> > +#include <linux/clk.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/debugfs.h>
> > +#include <linux/device.h>
> > +#include <linux/init.h>
> > +#include <linux/io.h>
> > +#include <linux/kernel.h>
> > +#include <linux/module.h>
> > +#include <linux/overflow.h>
> > +#include <linux/platform_device.h>
>
> ...
>
> > +       value |= readl_relaxed(reg) & ~mask;
>
> value is not masked, is it okay?
>
> Usual pattern for this kind of operations is
>
> value = (current & ~mask) | (value & mask);

This function is only ever called with constants, already masked
values or the parent number from the clk framework, so it should be
ok.

> > +       writel_relaxed(value, reg);
>
> ...
>
> > +       if (div > max)
> > +               div = max;
> > +
> > +       return div;
>
> return min(div, max); ?
>
> ...
>
> > +       rate = parent / div;
> > +       if (rate < req->min_rate && div > 1) {
> > +               div -= 1;
> > +               rate = parent / div;
> > +       }
>
> Seems like homegrown DIV_ROUND_UP() or so. Who will guarantee that
> decreasing div by 1 will satisfy the conditional again?

Maths unless I'm mistaken: div = DIV_ROUND_UP(parent, target), so in
rational numbers
  div - 1 < parent / target
But the target is clamped by min_rate and max_rate, so
  min_rate <= target < parent / (div - 1) = rate

Sorry, re-using the rate varable for both the target and result is
confusing. I'll fix that.

> ...
>
> > +#ifdef CONFIG_DEBUG_FS
>
> Perhaps __maybe_unused?

I can definitely use __maybe_unused for the function declaration, but
then I'll need a conditional every time clk_ops.debug_init needs to be
initialized to either the function or NULL depending on
CONFIG_DEBUG_FS below. Is that better?

> > +#else
> > +#define jh7100_clk_debug_init NULL
> > +#endif
>
> ...
>
> > +       if (idx >= JH7100_CLK_END) {
>
> > +               dev_err(priv->dev, "%s: invalid index %u\n", __func__, idx);
>
> __func__ means that the message has no value on its own. Make it
> unique without using __func__, or drop completely.
>
> > +               return ERR_PTR(-EINVAL);
> > +       }
>
> ...
>
> > +       for (idx = 0; idx < JH7100_CLK_PLL0_OUT; idx++) {
> > +               struct clk_init_data init = {
> > +                       .name = jh7100_clk_data[idx].name,
> > +                       .ops = jh7100_clk_data[idx].ops,
>
> > +                       .num_parents = ((jh7100_clk_data[idx].max & JH7100_CLK_MUX_MASK)
> > +                                       >> JH7100_CLK_MUX_SHIFT) + 1,
>
> With temporary variable this can be better written, or consider
> something like this
>
>                        .num_parents =
>                                ((jh7100_clk_data[idx].max &
> JH7100_CLK_MUX_MASK) >> JH7100_CLK_MUX_SHIFT) + 1,
>
> > +                       .flags = jh7100_clk_data[idx].flags,
> > +               };
> > +               struct jh7100_clk *clk = &priv->reg[idx];
>
> ...
>
> > +       while (idx > 0)
> > +               clk_hw_unregister(&priv->reg[--idx].hw);
>
> The
>
>        while (idx--)
>                clk_hw_unregister(&priv->reg[idx].hw);
>
> is slightly better to read.

It's not something I'll insist hard on, but I must admit I disagree.
To me the above looks like cartoon characters running off a cliff and
back. As a middle ground could we maybe do this?

  while (idx)
    clk_hw_unregister(&priv->reg[--idx].hw);

> > +       return ret;
> > +}
>
> ...
>
> > +static int __init clk_starfive_jh7100_init(void)
> > +{
> > +       return platform_driver_probe(&clk_starfive_jh7100_driver,
> > +                                    clk_starfive_jh7100_probe);
> > +}
>
> > +
>
> No need to have this blank line.
> > +subsys_initcall(clk_starfive_jh7100_init);
>
> Any  explanation why subsys_initcall() is in use?

TBH I just inherited that from Geert's first mock driver and never
thought to question it. What would be a better alternative to try?

Thanks!
/Emil
