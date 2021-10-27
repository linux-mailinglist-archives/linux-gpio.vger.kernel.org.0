Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7043543C7A1
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Oct 2021 12:24:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241439AbhJ0K0p (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Oct 2021 06:26:45 -0400
Received: from mail-pj1-f43.google.com ([209.85.216.43]:45026 "EHLO
        mail-pj1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239361AbhJ0K0o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Oct 2021 06:26:44 -0400
Received: by mail-pj1-f43.google.com with SMTP id oa12-20020a17090b1bcc00b0019f715462a8so1713597pjb.3;
        Wed, 27 Oct 2021 03:24:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UnmsZvCby2QfeCEq4jG+aVVX0WKqEYUQLOkNbKmiMRI=;
        b=tBHDUDlgf1VA+HWK/exDOlrgkBI8U5YeSrajEbN+7iYPwiN8kti2mtdEEQbuRUm1kI
         uTSWAEbe80ieaQAbLBVljUcKIuk1sQY540edgxF79p4PD4AcMqoC5+uMY9pPb4VvQDu4
         DhHSJkB/fzUFh5c567vDd24vAGLPT9hl5Thadj7isYADByLMfzKPCF+8jM/PLzWGgJLb
         cXWjmWqUov4S0VuPiNpCaoRiZmhBHlrw6TksnbqmFKz+5q/q0+hmv9Q4yJDiQmD/oeex
         Fpm1afKQTzCpnnUdIjwhiWzpLHxc4wUff1sGEjcdiF826EUj2+TYq8dXhtBGYDt3OzLW
         N/+g==
X-Gm-Message-State: AOAM532jlJlokPE1Kv6pexiqdD0FY3QgVqjn942BvVX0slu8tKAsLAyS
        PchJw0vwmG3fPIpQ8Z10qOKqLsb7mV5eFh2p5lI=
X-Google-Smtp-Source: ABdhPJy9gu/cklDFW7ZBJFI7eeGIz+A5/REdeCte6hkFXdam4UvPA67sK7GJF3AQN3H0gdwShtecUWWOG7LdpyM8VEM=
X-Received: by 2002:a17:90b:238a:: with SMTP id mr10mr3053885pjb.185.1635330258733;
 Wed, 27 Oct 2021 03:24:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-7-kernel@esmil.dk>
 <163527959276.15791.14765586510805526101@swboyd.mtv.corp.google.com>
 <CANBLGcyYb3yNit=GCy4w2zf2=CRtCJP7aCisR8=9n1f7okfCSg@mail.gmail.com> <163529604399.15791.378104318036812951@swboyd.mtv.corp.google.com>
In-Reply-To: <163529604399.15791.378104318036812951@swboyd.mtv.corp.google.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Wed, 27 Oct 2021 12:24:07 +0200
Message-ID: <CANBLGcx0Udhaa3S+uSffFcB_KFHXQiMOvn8Fd7ogj+RFxQNAfQ@mail.gmail.com>
Subject: Re: [PATCH v2 06/16] clk: starfive: Add JH7100 clock generator driver
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
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
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, 27 Oct 2021 at 02:54, Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Emil Renner Berthing (2021-10-26 15:35:36)
> > On Tue, 26 Oct 2021 at 22:20, Stephen Boyd <sboyd@kernel.org> wrote:
> > > Quoting Emil Renner Berthing (2021-10-21 10:42:13)
> > > > +};
> > > > +
> > > > +struct clk_starfive_jh7100_priv {
> > > > +       /* protect registers against overlapping read-modify-write */
> > > > +       spinlock_t rmw_lock;
> > >
> > > Does overlapping mean concurrent?
> >
> > Yes, sorry.
> >
> > > Do different clks share the same registers?
> >
> > No, each clock has their own register, but they use that register both
> > to gate the clock and other configuration. The Locking chapter of
> > Documentation/driver-api/clk.rst talks about the prepare lock and the
> > enable lock and then says:
> > "However, access to resources that are shared between operations of
> > the two groups needs to be protected by the drivers. An example of
> > such a resource would be a register that controls both the clock rate
> > and the clock enable/disable state."
>
> Alright got it. Maybe say "protect clk enable and set rate from
> happening at the same time".
>
> >
> > > > +               return ERR_PTR(-EINVAL);
> > > > +       }
> > > > +
> > > > +       if (idx >= JH7100_CLK_PLL0_OUT)
> > > > +               return priv->pll[idx - JH7100_CLK_PLL0_OUT];
> > > > +
> > > > +       return &priv->reg[idx].hw;
> > > > +}
> > > > +
> > > > +static int __init clk_starfive_jh7100_probe(struct platform_device *pdev)
> > >
> > > Drop __init as this can be called after kernel init is over.
> >
> > Oh interesting, I'd like to know when that can happen. The comment for
> > the builtin_platform_driver macro says it's just a wrapper for
>
> I thought this was using module_platform_driver() macro?
>
> > device_initcall.
> >
> > Won't we then need to remove all the __initconst tags too since the
> > probe function walks through jh7100_clk_data which eventually
> > references all __initconst data?
>
> Yes. If it's builtin_platform_driver() it can't be a module/tristate
> Kconfig, in which case all the init markings can stay.

Yes, it's already bool in the Kconfig file. After looking into this I
think it's better to do like the rockchip drivers and use
builtin_platform_driver_probe to make sure the probe function only
called at kernel init time:

static struct platform_driver clk_starfive_jh7100_driver = {
        .driver = {
                .name = "clk-starfive-jh7100",
                .of_match_table = clk_starfive_jh7100_match,
                .suppress_bind_attrs = true,
        },
};
builtin_platform_driver_probe(clk_starfive_jh7100_driver,
clk_starfive_jh7100_probe);

@Andy: is the supress_bind_attrs what you were asking about?

> > > > +
> > > > +               clk->hw.init = &init;
> > > > +               clk->idx = idx;
> > > > +               clk->max = jh7100_clk_data[idx].max;
> > > > +
> > > > +               ret = clk_hw_register(priv->dev, &clk->hw);
> > >
> > > Why not use devm_clk_hw_register()?
> >
> > I probably could. Just for my understanding that's just to avoid the
> > loop on error below, because as a builtin driver the device won't
> > otherwise go away, right?
>
> Yes
>
> >
> > > > +               if (ret)
> > > > +                       goto err;
> > > > +       }
> > > > +
> > > > +       ret = devm_of_clk_add_hw_provider(priv->dev, clk_starfive_jh7100_get, priv);
> > > > +       if (ret)
> > > > +               goto err;
> > > > +
> > > > +       return 0;
> > > > +err:
> > > > +       while (idx)
> > > > +               clk_hw_unregister(&priv->reg[--idx].hw);
> > > > +       return ret;
> > > > +}
> > > > +
> > > > +static const struct of_device_id clk_starfive_jh7100_match[] = {
> > > > +       { .compatible = "starfive,jh7100-clkgen" },
> > > > +       { /* sentinel */ }
> > > > +};
> > >
> > > Please add MODULE_DEVICE_TABLE()
> >
> > Will do!
>
> If it's never going to be a module then don't add any module_* things.

So does that just mean no MODULE_DEVICE_TABLE or should I also remove
MODULE_DESCRIPTION, MODULE_AUTHOR and MODULE_LICENSE? I'm just double
checking because the rockchip drivers seem to have MODULE_DESCRIPTION
and MODULE_LICENSE lines.
