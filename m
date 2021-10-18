Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BE1D43245C
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Oct 2021 19:02:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232752AbhJRRFH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Oct 2021 13:05:07 -0400
Received: from mail-pf1-f173.google.com ([209.85.210.173]:41893 "EHLO
        mail-pf1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232114AbhJRRFG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Oct 2021 13:05:06 -0400
Received: by mail-pf1-f173.google.com with SMTP id y7so15192543pfg.8;
        Mon, 18 Oct 2021 10:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pncH/JsFyTOuX1MFN8WrmdDdgAe+iOiHDqyec0cvtsI=;
        b=jpI6zqbUv5bYjw+0TiJ9PcQLG5GIjIweGDTDknk6tm4ga9WwBQ6AVdYIe0ISeWfDF4
         NoocRpl43EqLFWRNtbTnK3vK9YR86tICdCPUuKYNhSi1Wxke8ZpjrFa1ARcE701irSM/
         aIE7O1rpZj65bgpwdC2QZebC6ZrZ0DNsr+xJFW5NV0Ac2fTkcQhjf8Yd40grYxRvNCuB
         zA0Hb4+e3x17ubmSdScf+Y2g4THsbAc2R2EQN9M0mXFArGqBXKNWMM/CT3uYAMTpKLGa
         YgdDteTV144E4JNJo0m4rsOef9metjGU2dbD27gYF4w+MZm/CbLOdgnmSOZ26aoUDD0G
         RP5g==
X-Gm-Message-State: AOAM530tzxhnQriLZip/hq4OAOqOXE1gw+TiOWFY4GjnqRPYtR0UxDHF
        8PV1K/7je9Z2mvoCSNQxGf87V1go/kFlSTIfUlLUDY+pIn0=
X-Google-Smtp-Source: ABdhPJxBbRec2jyrrXkEQANfBfNhCIEoy1Kd52kI2aZkYtXf49W7q1r7dD5sz5uKW7JBTdSKP3O7I/8meCQjtrHn/bY=
X-Received: by 2002:a05:6a00:1707:b0:44d:47e1:9ffe with SMTP id
 h7-20020a056a00170700b0044d47e19ffemr30112553pfc.53.1634576575002; Mon, 18
 Oct 2021 10:02:55 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk> <20211012134027.684712-13-kernel@esmil.dk>
 <CAHp75Vep+i+iyJi0LAOKuer-cUZoUoB_ZrWKcmT=EB_4hOgFGw@mail.gmail.com>
 <CANBLGcxHD2vy0+tXYo5Pkqri9mV7aD9jikvs3ygBJRxF4ApLMA@mail.gmail.com>
 <CAHp75Vc65deoHbks-aPmnjEJzm3GdqFMfBCUqw4vVLVr=71Ncg@mail.gmail.com>
 <CANBLGcxriKLZ+CKUsj5sviW8FdHnWTF2koROwmAb=G2tbmE6vQ@mail.gmail.com>
 <CAHp75VccSDLVbs1sF_-1zghWyLKtKKV1qtxOxZZ-cS0e6S-sBA@mail.gmail.com> <CAHp75VcgFRGpca-pSU9T5Oo1fT4aWQJd5EQfyZscGYx0mDMJ_Q@mail.gmail.com>
In-Reply-To: <CAHp75VcgFRGpca-pSU9T5Oo1fT4aWQJd5EQfyZscGYx0mDMJ_Q@mail.gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Mon, 18 Oct 2021 19:02:43 +0200
Message-ID: <CANBLGcxHLQZygX9CHsXK4aYS9m4VE5OnLNROOmvP1ps5UP-xAw@mail.gmail.com>
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

On Mon, 18 Oct 2021 at 18:29, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Mon, Oct 18, 2021 at 7:23 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> > On Mon, Oct 18, 2021 at 6:56 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > On Mon, 18 Oct 2021 at 17:48, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > On Mon, Oct 18, 2021 at 6:35 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > > > On Tue, 12 Oct 2021 at 19:03, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > > > On Tue, Oct 12, 2021 at 4:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> ...
>
> > > > > > > +       ret = clk_prepare_enable(clk);
> > > > > > > +       if (ret) {
> > > > > >
> > > > > > > +               reset_control_deassert(rst);
> > > > > >
> > > > > > Use devm_add_action_or_reset().
> > > > >
> > > > > I don't see how that is better.
> > > >
> > > > Pity. The rule of thumb is to either try to use devm_*() everywhere in
> > > > the probe, or don't use it at all. Above is the more-or-less standard
> > > > pattern where devn_add_action_or_reset() is being used in the entire
> > > > kernel.
> > > >
> > > > > Then I'd first need to call that and
> > > > > check for errors, but just on the line below enabling the clock the
> > > > > reset line is deasserted anyway, so then the action isn't needed any
> > > > > longer. So that 3 lines of code for devm_add_action_or_reset +
> > > > > lingering unneeded action or code to remove it again vs. just the line
> > > > > above.
> > > >
> > > > Then don't use devm_*() at all. What's the point?
> > >
> > > I'm confused. So you wan't an unneeded action to linger because the
> > > probe function temporarily asserts reset for 3 lines of code?
> >
> > I;m talking about clk_prepare_enable().
>
> Having a second look I found even problematic error paths because of
> mixing devm_*() with non-devm_*() calls, which only assures me that
> your ->probe() error path is broken and should be revisited.

So do you want to expand on that now or should I send v2 first?
