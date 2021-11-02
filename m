Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC9844437B4
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 22:17:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbhKBVTv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 17:19:51 -0400
Received: from mail-pl1-f170.google.com ([209.85.214.170]:36364 "EHLO
        mail-pl1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229931AbhKBVTv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 17:19:51 -0400
Received: by mail-pl1-f170.google.com with SMTP id u11so864484plf.3;
        Tue, 02 Nov 2021 14:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=q3y5UxeQSpLyKQPZY321rv/0ZITkGbCXJhzW/7YHXdo=;
        b=x6QsW+aTrEmPDoDxf/ujFsmJrx7Y8vJFmcoz5NjjOnqjt58UqMhAwgwJMupWDfuae2
         sySplTnaviF7XxdIrW68c7GdChwqFF/VzMtcEfrINSqiv2ZIAayA58lrO6Uy5NXV6ljb
         pG5BGoLWTscbikhcSs5Z4HnyJqkhPrfhQvQBGv+c5oUTWHKPlzGaP361diy/IDoDYdf2
         A3VK82vxtd1ZlTtSitXNLC4nVm2m+1oqElOE10T0Kf6JAZ3ZNVvm2Q4KMEHT1OJD/boO
         raTMXAVzi1fka+bTNsGugF+oFrR+NU2tAp1xvFjGPltAXuk9PmMEykPL5B+rmHX5ofAU
         8NLg==
X-Gm-Message-State: AOAM533KVAY0FQYRRb8z0GznhOxU7FsdwmWDImg8Zyhb1umSQ4OgenAb
        mdtA64RMpAucRfLyH/PvUhSkGod2WDwVdx4UoQc/AjhSjMc=
X-Google-Smtp-Source: ABdhPJz8vya8Pc9vfyjBBnOdrocjtFOk+W75BUtZYClkn8GG2bJFYZJzRCxnG9uqRIRWqGnV1fANTmhWO6L01upvC1k=
X-Received: by 2002:a17:90a:5b0c:: with SMTP id o12mr9978948pji.194.1635887835692;
 Tue, 02 Nov 2021 14:17:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk> <20211102161125.1144023-10-kernel@esmil.dk>
 <CAHp75Ve-P8DR00mtRP_NkrXgB4nsZ+qBkgBen94iTcPqxQYUOg@mail.gmail.com>
 <CANBLGcyb=TAP0h2WuxBAjRvpN9n7Dt1Hvh5yE8NMOwm3ixZWuA@mail.gmail.com> <CAHp75Vcg3En=xH+kz0GgAMGUoo5FABo2HwGoHd=7QgGVrYkYXg@mail.gmail.com>
In-Reply-To: <CAHp75Vcg3En=xH+kz0GgAMGUoo5FABo2HwGoHd=7QgGVrYkYXg@mail.gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Tue, 2 Nov 2021 22:17:04 +0100
Message-ID: <CANBLGczrGwexRGvGxa9C+yzaSHZF_d5+AaebeLUX5BXFxipr=A@mail.gmail.com>
Subject: Re: [PATCH v3 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Yury Norov <yury.norov@gmail.com>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
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
        Geert Uytterhoeven <geert@linux-m68k.org>,
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

On Tue, 2 Nov 2021 at 21:14, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Tue, Nov 2, 2021 at 9:59 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > On Tue, 2 Nov 2021 at 20:43, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > On Tue, Nov 2, 2021 at 6:50 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> ...
>
> > > > +/*
> > > > + * the registers work like a 32bit bitmap, so writing a 1 to the m'th bit of
> > > > + * the n'th ASSERT register asserts line 32n + m, and writing a 0 deasserts the
> > > > + * same line.
> > > > + * most reset lines have their status inverted so a 0 in the STATUS register
> > > > + * means the line is asserted and a 1 means it's deasserted. a few lines don't
> > > > + * though, so store the expected value of the status registers when all lines
> > > > + * are asserted.
> > > > + */
> > >
> > > Besides missing capitalization,
> >
> > I'm confused. it was you who wanted all comments to capitalized the same..
>
> Yes and there are two types of the comments, one-liners and
> multi-line. In multi-line you usually use proper English grammar,
> where capitalization means what it means. For the one-liners just
> choose either small letters or capital letters to start them with.

That sounds reasonable, it was just that you complained about
inconsistent comments in the pinctrl driver that follows the above.

> > if it sounds like bitmap, use bitmap.
> > > I have checked DT definitions and it seems you don't even need the
> > > BIT_MASK() macro,
> > >
> > > > +static const u32 jh7100_reset_asserted[4] = {
> > > > +       /* STATUS0 register */
> > > > +       BIT_MASK32(JH7100_RST_U74) |
> > > > +       BIT_MASK32(JH7100_RST_VP6_DRESET) |
> > > > +       BIT_MASK32(JH7100_RST_VP6_BRESET),
> > > > +       /* STATUS1 register */
> > > > +       BIT_MASK32(JH7100_RST_HIFI4_DRESET) |
> > > > +       BIT_MASK32(JH7100_RST_HIFI4_BRESET),
> > > > +       /* STATUS2 register */
> > > > +       BIT_MASK32(JH7100_RST_E24),
> > > > +       /* STATUS3 register */
> > > > +       0,
> > > > +};
> > >
> > > Yury, do we have any clever (clean) way to initialize a bitmap with
> > > particular bits so that it will be a constant from the beginning? If
> > > no, any suggestion what we can provide to such users?
> >
> > The problem is, that even if we could initialize this without the
> > monstrosity in our last conversation a 64bit bitmap would still
> > produce worse code. As it is now it's simply a 32bit load and mask
> > with index and mask already calculated for the registers. In the
> > status callback the mask can even be folded into the register read
> > mask. With a 64bit bitmap you'd need to calculate new 64bit index and
> > masks, and then conditionally shift the bits into position.
>
> Why? You may use 8 byte IO (writeq() / readq() or their relaxed versions), no?
>
> ...
>
> > If this reflection of the 32bit registers bothers you that much
>
> What bothers me is hidden endianess issues (yeah, here it might be
> theoretical, but consider that somebody will look at your code and use
> it as the best example ever).

Wouldn't endian issues be a reason to make sure we read 32bit
registers with 32bit reads? Or do you expect a hypothetical big-endian
StarFive SoC to also change the order of the registers?
