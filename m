Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 534304323EC
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Oct 2021 18:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232251AbhJRQhe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Oct 2021 12:37:34 -0400
Received: from mail-pj1-f50.google.com ([209.85.216.50]:54958 "EHLO
        mail-pj1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229924AbhJRQhd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Oct 2021 12:37:33 -0400
Received: by mail-pj1-f50.google.com with SMTP id np13so12599211pjb.4;
        Mon, 18 Oct 2021 09:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=t0ejuGV5Mekv33Ke5yZ2hDIuNqOJx8vNh5URYlHnJto=;
        b=6gJgbjgOz8H1lvQqWP/wAmtY+y/pqX+6z+6K3PbPnXm+FZqvHp1IfZ3forvshPWJz+
         paM31sN7f7HAKISYLy0CQVSRH9CZWbVn1HNEOpwcaspXayWD83mUDscDhvQTOZossZwB
         9o7z/AoBevUzOramcUFrp1FyxwqHyiUzvtEz1wenNK9NfnY/Y954tyaLw9jCuGUcUORb
         DtJa1VD4ezGvlZiSWQQ/43uHQ6pghFWJ9CeGp00SM2m4AClNnfjBpaatLDQj5dpOFEeO
         gXXYzAa95fdCq5SdaS0JqEfF532DdHwlhTWNQpWVpSqMrv5IRUGt208DnegCkK5pmJ88
         igMA==
X-Gm-Message-State: AOAM532rLKtk1+J952sNkMhbosBBnvWLhRUVNy+OMNnSw+oLmClUur5l
        rwptyeuuLnmZEg8PQ1Ae88R2TDcYVUA+TvxtccA=
X-Google-Smtp-Source: ABdhPJwvaMOxnoenZJe9/ILtrcFiCQv9WRvnnA+r4NIrZLRlZciSQOo/t9cppApR2frz6pS5hFOQgQA/Yz9/Zrjvuhw=
X-Received: by 2002:a17:902:7783:b0:13d:fee6:8095 with SMTP id
 o3-20020a170902778300b0013dfee68095mr28042663pll.7.1634574921896; Mon, 18 Oct
 2021 09:35:21 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk> <20211012134027.684712-13-kernel@esmil.dk>
 <CAHp75Vep+i+iyJi0LAOKuer-cUZoUoB_ZrWKcmT=EB_4hOgFGw@mail.gmail.com>
 <CANBLGcxHD2vy0+tXYo5Pkqri9mV7aD9jikvs3ygBJRxF4ApLMA@mail.gmail.com>
 <CAHp75Vc65deoHbks-aPmnjEJzm3GdqFMfBCUqw4vVLVr=71Ncg@mail.gmail.com>
 <CANBLGcxriKLZ+CKUsj5sviW8FdHnWTF2koROwmAb=G2tbmE6vQ@mail.gmail.com> <CAHp75VccSDLVbs1sF_-1zghWyLKtKKV1qtxOxZZ-cS0e6S-sBA@mail.gmail.com>
In-Reply-To: <CAHp75VccSDLVbs1sF_-1zghWyLKtKKV1qtxOxZZ-cS0e6S-sBA@mail.gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Mon, 18 Oct 2021 18:35:10 +0200
Message-ID: <CANBLGcw1qMB7r7TbuQEevOPHq94wAtZNs=yFQ3UP_DEREvGz6g@mail.gmail.com>
Subject: Re: [PATCH v1 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-riscv <linux-riscv@lists.infradead.org>,
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
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Huan Feng <huan.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 18 Oct 2021 at 18:24, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Mon, Oct 18, 2021 at 6:56 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > On Mon, 18 Oct 2021 at 17:48, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > On Mon, Oct 18, 2021 at 6:35 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > > On Tue, 12 Oct 2021 at 19:03, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > > On Tue, Oct 12, 2021 at 4:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> ...
>
> > > > > > +               case PIN_CONFIG_BIAS_DISABLE:
> > > > >
> > > > > > +                       mask |= PAD_BIAS_MASK;
> > > > >
> > > > > Use it...
> > > > >
> > > > > > +                       value = (value & ~PAD_BIAS_MASK) | PAD_BIAS_DISABLE;
> > > > >
> > > > > ...here. Ditto for the similar cases in this function and elsewhere.
> > > >
> > > > I don't follow. How do you want me to use mask? If I did value =
> > > > (value & ~mask) | PAD_BIAS_DISABLE; then I'd wipe the previous
> > > > configuration. Eg. suppose the first config is the drive strength and
> > > > second disables bias. Then on the 2nd loop mask =
> > > > PAD_DRIVE_STRENGTH_MASK | PAD_BIAS_MASK and the drive strength value
> > > > would be wiped.
> > >
> > > Collect masks and new values in temporary variables and apply them
> > > once after the loop is done, no?
> >
> > But that's exactly what the code does. It merges all the config
> > options into a single mask and value so we only need to do rmw on the
> > register once.
>
> Then masking the value makes no sense.
> What you should have is simply as
>
>   mask |= FOO;
>   value |= BAR;

Yeah, but then we could get into weird states if the device tree
specifies both bias-disable and bias-pull-up by mistake. This code is
written so that only the last valid state is chosen.


> ...
>
> > > > > > +       ret = clk_prepare_enable(clk);
> > > > > > +       if (ret) {
> > > > >
> > > > > > +               reset_control_deassert(rst);
> > > > >
> > > > > Use devm_add_action_or_reset().
> > > >
> > > > I don't see how that is better.
> > >
> > > Pity. The rule of thumb is to either try to use devm_*() everywhere in
> > > the probe, or don't use it at all. Above is the more-or-less standard
> > > pattern where devn_add_action_or_reset() is being used in the entire
> > > kernel.
> > >
> > > > Then I'd first need to call that and
> > > > check for errors, but just on the line below enabling the clock the
> > > > reset line is deasserted anyway, so then the action isn't needed any
> > > > longer. So that 3 lines of code for devm_add_action_or_reset +
> > > > lingering unneeded action or code to remove it again vs. just the line
> > > > above.
> > >
> > > Then don't use devm_*() at all. What's the point?
> >
> > I'm confused. So you wan't an unneeded action to linger because the
> > probe function temporarily asserts reset for 3 lines of code?
>
> I;m talking about clk_prepare_enable().

Ok, you wrote your comment under the reset_control_deassert call. How
would devm_add_action_or_reset for clk_prepare_enable work?

> ...
>
> > > > > > +       sfp->gc.of_node = dev->of_node;
> > > > >
> > > > > Isn't GPIO library do this for you?
> > > >
> > > > If it does I can't find it.
> > >
> > > Heh... `man git grep`
> > > Hint: `git grep -n 'of_node = .*of_node' -- drivers/gpio/gpiolib*`
> >
> > That's exactly what I did.
>
> Now look at the result and find the correct place where it's done.
> Btw, all hits are in the very same function.
>
> --
> With Best Regards,
> Andy Shevchenko
