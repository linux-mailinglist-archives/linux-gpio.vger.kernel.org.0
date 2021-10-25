Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 166FC43939C
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Oct 2021 12:24:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232808AbhJYK0g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Oct 2021 06:26:36 -0400
Received: from mail-pl1-f179.google.com ([209.85.214.179]:43748 "EHLO
        mail-pl1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232740AbhJYK0f (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Oct 2021 06:26:35 -0400
Received: by mail-pl1-f179.google.com with SMTP id y1so7578354plk.10;
        Mon, 25 Oct 2021 03:24:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OqpRkNGcBa4r2kC+JorAkGEhmiT7Agi5fOZoubtSR8I=;
        b=GDQMGkseI8BACs+iNndpOE0RSip3VQM4zqWhdZQl3lg/Ym0RkHC4MxS4ibMu9DaHL9
         5E4FZxh4UsjlAK+GiYWXNY2u+BBgBNfKlVDiwXdyEd40xaeT7Oj8bpK+bf6cdXN/fYAQ
         dAEqbhuGCgs5jan5k8pylskONIxOE3sslaXsxQRmV9S/WqT3vPPprr+VzjzUy7O64pqc
         9kScsmIuwKanQR1dXdB4SaAQmDOSWPiF8ga7Wc3VHRgyFYHMZ+CfAsGb1lq3Z4V9tQxd
         3z0E6DYaqlkx0vLKqhKL0YZvgyd6EEEKy72WO5GE9rexo+nRGhGhbVhBRCKtTB+bmEox
         gSow==
X-Gm-Message-State: AOAM533Y9PQCD8kOJVhpH1k6WIFaCvE5sQovm0hBfapXoTm0sIAPpFo7
        tep64KRY/hSmk2xq69JHTq+003KIrM4xjiRSA0s=
X-Google-Smtp-Source: ABdhPJy9SGueiTS1iMnEgVgoxpq3IdFoF9n5zbGrMfnkkwkORjR9dXvyt10AlvWYi11K5yos8TLJ82MKo2jyCe6IJgc=
X-Received: by 2002:a17:90b:4b90:: with SMTP id lr16mr15681569pjb.160.1635157453246;
 Mon, 25 Oct 2021 03:24:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-13-kernel@esmil.dk>
 <CAHp75Vf3yNoKxguHP3EPcRV_3tG++Fd=FVM0MXqW4_SmLA6HEw@mail.gmail.com>
 <CANBLGcxEwkcZn2CC69zLaVqL8ocS6r6HDaaoUF09gg1mpDxFzg@mail.gmail.com>
 <CAHp75Vc5-Sg-0kKN=OMs_2iJbtc+D9=f0-Sp+SpY5O3roU3XdA@mail.gmail.com>
 <CANBLGcxnmt4Ki4EHAXeoJX5mJMyeioZXhGaDsKm_wk86D4js3Q@mail.gmail.com>
 <CANBLGcyOfo3r0Viidf9kyW0Q9yD4uqTLm90+7O=T49v7ZHurfA@mail.gmail.com> <CAHp75Vc1EES8c7XD-MbQNdtCJA3YvvEYd3_e378rVCe6=AmhvQ@mail.gmail.com>
In-Reply-To: <CAHp75Vc1EES8c7XD-MbQNdtCJA3YvvEYd3_e378rVCe6=AmhvQ@mail.gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Mon, 25 Oct 2021 12:24:02 +0200
Message-ID: <CANBLGczXN4JV1Xrym_YGiAvrOFwkd4-PDjfvL93ZMgePb7wFVA@mail.gmail.com>
Subject: Re: [PATCH v2 12/16] pinctrl: starfive: Add pinctrl driver for
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
        Michael Zhu <michael.zhu@starfivetech.com>,
        Fu Wei <tekkamanninja@gmail.com>,
        Anup Patel <anup.patel@wdc.com>,
        Atish Patra <atish.patra@wdc.com>,
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Huan Feng <huan.feng@starfivetech.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 25 Oct 2021 at 12:16, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Sun, Oct 24, 2021 at 12:29 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > On Sat, 23 Oct 2021 at 23:02, Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > On Sat, 23 Oct 2021 at 22:29, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > On Sat, Oct 23, 2021 at 9:46 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> ...
>
> > > So is that a yes or a no to my question? It's not clear to me.
> >
> > I see now that you've probably misunderstood what the code does. It's
> > not one time use. The function parses the device tree and dynamically
> > registers groups and functions with the pinctrl framework. Each group
> > needs a string name, an int array of pins and optionally the pinmux
> > data. Once the group is registered those pieces of data needs to live
> > with the group until the drive is unloaded. But if the device tree
> > parsing fails before the group is registered then those allocations
> > would never be referenced and just hang around as garbage until the
> > driver is unloaded. In such cases fx. pinctrl-single uses devm_free to
> > free them again.
>
> Thank you for elaboration. Please, drop devm_*(). In this case it's
> inappropriate to use it. pinctrl-single should be amended accordingly,
> but it's out of scope here.
>
> ...
>
> > > > > I such cases where you get conflicting PIN_CONFIG_BIAS_* settings I
> > > > > don't see why it's better to do the rmw on the padctl register for the
> > > > > first bias setting only to then change the bits again a few
> > > > > microseconds later when the loop encounters the second bias setting.
> > > > > After the loop is done the end result would still be just the last
> > > > > bias setting.
> > > >
> > > > It could be bias X followed by something else followed by bias Y. You
> > > > will write something else with bias Y. I admit I don't know this
> > > > hardware and you and maintainers are supposed to decide what's better,
> > > > but my guts are telling me that current algo is buggy.
> > >
> > > So there is only one padctl register pr. pin. I don't see why first
> > > setting the bias bits to X, then setting some other bits, and then
> > > setting the bias bits to Y would be different from just setting all
> > > the bits in one go. Except for during that little microsecond window
> > > during the loop that I actually think it's better to avoid.
> >
> > Maybe an example is in order. Suppose we get strong pull-up, drive
> > strength 3 and pull-down config flags (the strong pull-up and pull
> > down flags conflict) and the padctl value is 0x0c0 (pull-up, input and
> > schmitt trigger enabled). With your solution of just altering the
> > padctl bits immediately we'd call starfive_padctl_rmw 3 times in rapid
> > succession like this:
> >
> > starfive_padctl_rmw(pin, 0x130, 0x100);
> > starfive_padctl_rmw(pin, 0x007, 0x003);
> > starfive_padctl_rmw(pin, 0x130, 0x010);
> >
> > ..and the end result would be 0x0d3, although the strong pull-up would
> > be enabled for the microseconds between the 1st and 3nd call.
> > As the code is now it'd just directly do
> >
> > starfive_padctl_rmw(pin, 0x137, 0x013)
> >
> > ..which again results in 0x0d3, only without the microsecond blink of
> > the strong pull-up.
>
> You missed the point. Hardware on the other end may behave well
> differently in these two cases.

Right, but that can never be an intended behaviour. Which of the
conflicting bias settings comes first and is blipped before the 2nd
remains entirely depends on how the pinctrl framework parses the
devicetree. I'd much rather have it cleanly go to just one of the
states, which might be the wrong one, but the conflicting bias
settings are wrong to begin with.
