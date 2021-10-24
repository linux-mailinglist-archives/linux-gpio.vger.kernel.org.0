Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAB624387EB
	for <lists+linux-gpio@lfdr.de>; Sun, 24 Oct 2021 11:29:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbhJXJbf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 24 Oct 2021 05:31:35 -0400
Received: from mail-pl1-f180.google.com ([209.85.214.180]:42958 "EHLO
        mail-pl1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229886AbhJXJbe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 24 Oct 2021 05:31:34 -0400
Received: by mail-pl1-f180.google.com with SMTP id v16so463818ple.9;
        Sun, 24 Oct 2021 02:29:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AtnhJDg1yXoN87a6f65ZXajgyzKarXRMIiguSWzzW8o=;
        b=iNSgHiUPDPivEFQwBveI/h9upZJiPGv+1cnuN4eqH5eYpcZsUHKjMbigNZeos9CKVZ
         psIIrmZm+WfxvQ6ngj5AYVrVhc43idSWWTuI1IP9/6Jpf8TgxtfgE90S+9rxObMfVhtb
         vRn5/25hlazO8DX0iDfwkpfeAHezJpOK4ABzxmOPBVtDy8NQXSvGwVQxGzu4DxsK40bK
         iTziZ2DmRXuEQQCWG1x8VNh9vZXizOXtu/iEGywor0KYf/SaDXZksThZ34NOY4zGBKXb
         ksE3rnB60EPFVpHgVbb8m3VKNym/kg/yqE/NmIqP98IqETay7q2fkigHR5Mj5xRQ2ah2
         RyvA==
X-Gm-Message-State: AOAM533kq1fYdPUxM0vVChWq4YYynMlEM7A55e6BdJ76m2yQWKGB4qJ+
        sylcenp+zJ9Lx0c/fsZG7MrKpnRf0sJnF+sfIkI=
X-Google-Smtp-Source: ABdhPJz/lfKDFYDalcNbEuT9HXlt+qKuPzUIloGK4jMf0z9sSyZLZVrBF5kFG87Y6hx3GLBuxXgcfEV+akBG6htbcZo=
X-Received: by 2002:a17:90b:390f:: with SMTP id ob15mr26111167pjb.185.1635067753381;
 Sun, 24 Oct 2021 02:29:13 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-13-kernel@esmil.dk>
 <CAHp75Vf3yNoKxguHP3EPcRV_3tG++Fd=FVM0MXqW4_SmLA6HEw@mail.gmail.com>
 <CANBLGcxEwkcZn2CC69zLaVqL8ocS6r6HDaaoUF09gg1mpDxFzg@mail.gmail.com>
 <CAHp75Vc5-Sg-0kKN=OMs_2iJbtc+D9=f0-Sp+SpY5O3roU3XdA@mail.gmail.com> <CANBLGcxnmt4Ki4EHAXeoJX5mJMyeioZXhGaDsKm_wk86D4js3Q@mail.gmail.com>
In-Reply-To: <CANBLGcxnmt4Ki4EHAXeoJX5mJMyeioZXhGaDsKm_wk86D4js3Q@mail.gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Sun, 24 Oct 2021 11:29:02 +0200
Message-ID: <CANBLGcyOfo3r0Viidf9kyW0Q9yD4uqTLm90+7O=T49v7ZHurfA@mail.gmail.com>
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

On Sat, 23 Oct 2021 at 23:02, Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Sat, 23 Oct 2021 at 22:29, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Sat, Oct 23, 2021 at 9:46 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > On Fri, 22 Oct 2021 at 15:32, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > On Thu, Oct 21, 2021 at 8:44 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > So I asked you if you thought it was better to leave these unused
> > > allocations when parsing the device tree node fails but you never
> > > answered that. I didn't want put words in your mouth so I could only
> > > assume you didn't. I'd really like a straight answer to that so I have
> > > something to refer to when people ask why this driver doesn't do the
> > > same as fx. the pinctrl-single. So just to be clear: do you think it's
> > > better to leave this unused garbage allocated if parsing the device
> > > tree node fails?
> >
> > If it's only one time use, I don't think it's good to have it hanging
> > around, BUT at the same time devm_*() is not suitable for such
> > allocations.
>
> So is that a yes or a no to my question? It's not clear to me.

I see now that you've probably misunderstood what the code does. It's
not one time use. The function parses the device tree and dynamically
registers groups and functions with the pinctrl framework. Each group
needs a string name, an int array of pins and optionally the pinmux
data. Once the group is registered those pieces of data needs to live
with the group until the drive is unloaded. But if the device tree
parsing fails before the group is registered then those allocations
would never be referenced and just hang around as garbage until the
driver is unloaded. In such cases fx. pinctrl-single uses devm_free to
free them again.

> > > > > +               if (reg_din)
> > > > > +                       writel_relaxed(gpio + 2, reg_din);
> > > >
> > > > Why 0 can't be written?
> > >
> > > Because signal 0 is a special "always 0" signal and signal 1 is a
> > > special "always 1" signal, and after that signal n is the input value
> > > of GPIO n - 2. We don't want to overwrite the PoR defaults.
> >
> > Okay, this, perhaps, needs a comment (if I have not missed the existing one).
> >
> > And what about checking for reg_din? Do you have some blocks output-only?
>
> I don't know know what you mean by the first question, but yes fx. the
> uart tx pins would be an example of pins that have their output signal
> set to the uart peripheral, the output enable set to the special
> "always enabled" signal, and no input signal is set to any of the tx
> pins.
>
> > > > > +               case PIN_CONFIG_BIAS_DISABLE:
> > > > > +                       mask |= PAD_BIAS_MASK;
> > > > > +                       value = (value & ~PAD_BIAS_MASK) | PAD_BIAS_DISABLE;
> > > >
> > > > Okay, I have got why you are masking on each iteration, but here is
> > > > the question, shouldn't you apply the cnages belonged to each of the
> > > > group of options as it's requested by the user? Here you basically
> > > > ignore all previous changes to bias.
> > > >
> > > > I would expect that you have something like
> > > >
> > > > for () {
> > > >   switch (type) {
> > > >   case BIAS*:
> > > >     return apply_bias();
> > > >   ...other types...
> > > >   default:
> > > >     return err;
> > > >   }
> > > > }
> > >
> > > I such cases where you get conflicting PIN_CONFIG_BIAS_* settings I
> > > don't see why it's better to do the rmw on the padctl register for the
> > > first bias setting only to then change the bits again a few
> > > microseconds later when the loop encounters the second bias setting.
> > > After the loop is done the end result would still be just the last
> > > bias setting.
> >
> > It could be bias X followed by something else followed by bias Y. You
> > will write something else with bias Y. I admit I don't know this
> > hardware and you and maintainers are supposed to decide what's better,
> > but my guts are telling me that current algo is buggy.
>
> So there is only one padctl register pr. pin. I don't see why first
> setting the bias bits to X, then setting some other bits, and then
> setting the bias bits to Y would be different from just setting all
> the bits in one go. Except for during that little microsecond window
> during the loop that I actually think it's better to avoid.

Maybe an example is in order. Suppose we get strong pull-up, drive
strength 3 and pull-down config flags (the strong pull-up and pull
down flags conflict) and the padctl value is 0x0c0 (pull-up, input and
schmitt trigger enabled). With your solution of just altering the
padctl bits immediately we'd call starfive_padctl_rmw 3 times in rapid
succession like this:

starfive_padctl_rmw(pin, 0x130, 0x100);
starfive_padctl_rmw(pin, 0x007, 0x003);
starfive_padctl_rmw(pin, 0x130, 0x010);

..and the end result would be 0x0d3, although the strong pull-up would
be enabled for the microseconds between the 1st and 3nd call.
As the code is now it'd just directly do

starfive_padctl_rmw(pin, 0x137, 0x013)

..which again results in 0x0d3, only without the microsecond blink of
the strong pull-up.
