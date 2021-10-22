Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B4514377C5
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Oct 2021 15:14:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232842AbhJVNQO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Oct 2021 09:16:14 -0400
Received: from mail-pl1-f178.google.com ([209.85.214.178]:47074 "EHLO
        mail-pl1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232827AbhJVNQN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Oct 2021 09:16:13 -0400
Received: by mail-pl1-f178.google.com with SMTP id i1so2638895plr.13;
        Fri, 22 Oct 2021 06:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3OEFGu3enLvj4SiHrgtW22LytEptjzZQ2XovqUzzJxs=;
        b=nQlnjLb0xaEQ9s8nFvdNgPY0GIxKJ+7Z/bcDdya4eKXAVWfCFGvLZZthyIrbQLZ1Kd
         /CFPZZJVnIwwKWPJwnh71t5q0m06yH20QsOIYhdnOvwzI4xF94/IeI1Kd6x887c0dIjV
         dP3L/ugz+o8vQ//qfOXfR4RmBwuoIyqJ/oSuaUuFLPphP8OMUGfGrxkhmGBQbXvtpELM
         Db1e6ktKBz6GlGjfO+dUKVkXoLpYppgfwdeU3J38ql9JWS9dbdv6QyRcC6PfEOhx566w
         3Ne734B4tDWmfyCvdkpU/7DNux9zMhpRspT1KR7NAmp9FVBeFXQGvuFifx/SBfMNBT46
         ZA/Q==
X-Gm-Message-State: AOAM5301zVQQROmUIDXdyP4pt2a3x8tyL80ZgytDxmGufo51uyhHKIy9
        i0dg1BkpL9ZpA1MBVQb3/s9oJRwynHd7L1bNijg=
X-Google-Smtp-Source: ABdhPJwdNKuFIRy3q4FG0qUqRpoxDObQ291Tb2SMDa/9Z3I5rVsMLHdpaoevze0fIUT7jxHb62MFoZMSVTU8r0ulBHA=
X-Received: by 2002:a17:90b:98:: with SMTP id bb24mr4342124pjb.194.1634908435520;
 Fri, 22 Oct 2021 06:13:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-7-kernel@esmil.dk>
 <CAHp75VcS7ZZCciAgBH2QU7u8CiHzveAOsvSdv2DQBvpBn_6opQ@mail.gmail.com>
In-Reply-To: <CAHp75VcS7ZZCciAgBH2QU7u8CiHzveAOsvSdv2DQBvpBn_6opQ@mail.gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Fri, 22 Oct 2021 15:13:44 +0200
Message-ID: <CANBLGcyHpxuT9N+H8Lk=5CjMb1=-17_sH3dBzALCMYpAEZfeuw@mail.gmail.com>
Subject: Re: [PATCH v2 06/16] clk: starfive: Add JH7100 clock generator driver
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
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 22 Oct 2021 at 14:34, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Thu, Oct 21, 2021 at 8:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> ...
>
> > +static struct clk_hw *clk_starfive_jh7100_get(struct of_phandle_args *clkspec, void *data)
> > +{
> > +       struct clk_starfive_jh7100_priv *priv = data;
> > +       unsigned int idx = clkspec->args[0];
> > +
> > +       if (idx >= JH7100_CLK_END) {
> > +               dev_err(priv->dev, "invalid clock index %u\n", idx);
> > +               return ERR_PTR(-EINVAL);
>
> After this
> https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git/commit/?h=driver-core-next&id=7065f92255bb2468dbb9aa0537ff186ef64d5a02
> It's okay to use
>
> > +       }
>
>        if (idx >= JH7100_CLK_END)
>                return dev_err_probe(priv->dev, -EINVAL, "invalid clock
> index %u\n", idx);
>
> Ditto for other similar cases.

Hmm.. this function doesn't return int, but struct clk_hw *, hence the ERR_PTR.
Also I don't see any other similar cases in this driver.

> > +       if (idx >= JH7100_CLK_PLL0_OUT)
> > +               return priv->pll[idx - JH7100_CLK_PLL0_OUT];
> > +
> > +       return &priv->reg[idx].hw;
> > +}
>
> ...
>
> > +       while (idx)
> > +               clk_hw_unregister(&priv->reg[--idx].hw);
>
> I still consider that usual pattern, i.e.
>
>        while (idx--)
>                clk_hw_unregister(&priv->reg[idx].hw);
>
> but since you are pushing hard for your variant I'll leave it to the
> maintainers and author.
>
> --
> With Best Regards,
> Andy Shevchenko
