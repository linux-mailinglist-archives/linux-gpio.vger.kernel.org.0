Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5F2842AEE0
	for <lists+linux-gpio@lfdr.de>; Tue, 12 Oct 2021 23:26:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233775AbhJLV2m (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 12 Oct 2021 17:28:42 -0400
Received: from mail-pf1-f171.google.com ([209.85.210.171]:45963 "EHLO
        mail-pf1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233387AbhJLV2l (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 12 Oct 2021 17:28:41 -0400
Received: by mail-pf1-f171.google.com with SMTP id i65so596943pfe.12;
        Tue, 12 Oct 2021 14:26:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=67Wm548vxd64jvyzHGx2cJ1FuE3KgBqc4EcFAWPdars=;
        b=krfrf7NoGFvUZvYJEciVJTAnL3G74+xqXa9jDmkqEoV3S8YbN0EC6R0NfmWTMPZxoM
         n3qMqxwOq3pB56eWLPngeJDiphVt/L9tFRozjz1W40962uvN25rmccaTS8v9vRaoppJJ
         3q9ai6bqTTSkPt4MdVb+G0iifrR+Npfyv3U+LwG+rzvTb12SeyhzJSAp2aIyHggC/c2r
         F0BS8GH2+gK9DLTVJvAGzGDotWFvSINGFcKV+ltYVIjzyI8iO8cY/S2/FlBpBS8UJN9v
         TlWtOQIJ/Qe/uMzNZbV8MI5tNnyBdBzcl4kCQr8+o/mxbQ0kN0/2Zs0uQTGy0PPDrT9a
         soXw==
X-Gm-Message-State: AOAM532eqpUgX+BqLk78L1baeU2udIlW/RK4GuB03nZ3j7g9lYxxwW8X
        Zy+z7gMBm4iJDKm6c65jlZcO7sn/4aDGU++8yDk=
X-Google-Smtp-Source: ABdhPJx3LuMpsgeccnPFD90fzK89K2LwT3vY2QzV1lqSWMBpesQf1r+E1dxT/hIFDwKbjbdR+DVtVdFWffwQUKpsJoE=
X-Received: by 2002:a62:5257:0:b0:44c:ed84:350a with SMTP id
 g84-20020a625257000000b0044ced84350amr22789150pfb.79.1634073999294; Tue, 12
 Oct 2021 14:26:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk> <20211012134027.684712-7-kernel@esmil.dk>
 <CAHp75Vetqi=FMoRxfXHL+d1DhAXgLr+5e7ss1M_Rkhqa07H5Jg@mail.gmail.com>
 <CANBLGcyCpSrxQi7pxLWQLkgbVGAKxJMXhoVbF_DdYDiv5_YJXQ@mail.gmail.com> <CAHp75VcM97vcrNOG_T==E0JyZ_RT_n8MCiVtfmYQM4g8kVtegg@mail.gmail.com>
In-Reply-To: <CAHp75VcM97vcrNOG_T==E0JyZ_RT_n8MCiVtfmYQM4g8kVtegg@mail.gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Tue, 12 Oct 2021 23:26:27 +0200
Message-ID: <CANBLGcxBjrhp6sfLqsKu=0hgYh+oxmozriWVCwdSKFYWtYnPmQ@mail.gmail.com>
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

On Tue, 12 Oct 2021 at 23:21, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
> On Tue, Oct 12, 2021 at 11:08 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > On Tue, 12 Oct 2021 at 17:40, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > On Tue, Oct 12, 2021 at 4:42 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> ...
>
> > > > +       value |= readl_relaxed(reg) & ~mask;
> > >
> > > value is not masked, is it okay?
> > >
> > > Usual pattern for this kind of operations is
> > >
> > > value = (current & ~mask) | (value & mask);
> >
> > This function is only ever called with constants, already masked
> > values or the parent number from the clk framework, so it should be
> > ok.
>
> Up to you, but I think it's better to have a usual pattern.
>
> > > > +       writel_relaxed(value, reg);
>
> ...
>
> > > > +       rate = parent / div;
> > > > +       if (rate < req->min_rate && div > 1) {
> > > > +               div -= 1;
> > > > +               rate = parent / div;
> > > > +       }
> > >
> > > Seems like homegrown DIV_ROUND_UP() or so. Who will guarantee that
> > > decreasing div by 1 will satisfy the conditional again?
> >
> > Maths unless I'm mistaken: div = DIV_ROUND_UP(parent, target), so in
> > rational numbers
> >   div - 1 < parent / target
> > But the target is clamped by min_rate and max_rate, so
> >   min_rate <= target < parent / (div - 1) = rate
> >
> > Sorry, re-using the rate varable for both the target and result is
> > confusing. I'll fix that.
>
> Also needs a comment, I believe.

Will add.

> ...
>
> > > > +#ifdef CONFIG_DEBUG_FS
> > >
> > > Perhaps __maybe_unused?
> >
> > I can definitely use __maybe_unused for the function declaration, but
> > then I'll need a conditional every time clk_ops.debug_init needs to be
> > initialized to either the function or NULL depending on
> > CONFIG_DEBUG_FS below. Is that better?
>
> Actually, why can't you always initialize the field? Shouldn't CLK
> core take care about this conditional?

It could, but I see other drivers avoiding the code bloat when debugfs
is not enabled, so I thought I'd copy that.

> > > > +#else
> > > > +#define jh7100_clk_debug_init NULL
> > > > +#endif
>
> ...
>
> > > > +       while (idx > 0)
> > > > +               clk_hw_unregister(&priv->reg[--idx].hw);
> > >
> > > The
> > >
> > >        while (idx--)
> > >                clk_hw_unregister(&priv->reg[idx].hw);
> > >
> > > is slightly better to read.
> >
> > It's not something I'll insist hard on, but I must admit I disagree.
> > To me the above looks like cartoon characters running off a cliff and
> > back. As a middle ground could we maybe do this?
> >
> >   while (idx)
> >     clk_hw_unregister(&priv->reg[--idx].hw);
>
> My point is exactly in having the common pattern for error paths, i.e.
>
>   while (counter--)
>     ...bla-bla-bla...
>
> Your second approach is better, but I think that proposed by me is even better.
>
> ...
>
> > > > +subsys_initcall(clk_starfive_jh7100_init);
> > >
> > > Any  explanation why subsys_initcall() is in use?
> >
> > TBH I just inherited that from Geert's first mock driver and never
> > thought to question it. What would be a better alternative to try?
>
> At least add a comment to explain the choice.
>
> --
> With Best Regards,
> Andy Shevchenko
