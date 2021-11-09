Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 89EE744AAA0
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 10:34:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244909AbhKIJgv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 04:36:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244908AbhKIJgu (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 04:36:50 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10976C061764;
        Tue,  9 Nov 2021 01:34:05 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id j21so73927512edt.11;
        Tue, 09 Nov 2021 01:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lcKEhYP4+yPtNIxKXGgbgdUfjg0mHGJfVwUnsoOpxAY=;
        b=oBOlsPNFn0gaiki/GKvqQJhMANbtFxOs60cmycBfbRyX7suhZrv7wMadmLWmbukSj0
         WVppmPtJZ6QZzoQmxVXt2p0O/MEph5yQ6OEO0Mq85tIq+XybH2FvFsxa+mV+WC6ntqhX
         Cqn3eUugJJjA2il/u7B3VbpqcJmouLsZX0gwdDQl6qmPuf6++BE8k4aGNeShMRCnyvWP
         FU6osIQjARDVHbACUoCWr6fsdL/wX3pRQfOy0rbHO7zbCF+egA0hXhU43sqZhvH1K6uK
         aXrMvmzo7eqBHdkR2x1eKQd7P2QvL6P/WCK8/cYgqmJc1Mgp1IaP9tRdkLTTxz5la/ve
         xFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lcKEhYP4+yPtNIxKXGgbgdUfjg0mHGJfVwUnsoOpxAY=;
        b=Y+Y+NCFoxgaUMQPeF34VIiSODbxmDhFBYCRLSH3CTavGSuJdV6btbklYG4japLw6vf
         somsTYOTQJ7m73w7otY8a3f/7NrbOtryhlnMiSqOi5i3Gx9+ebCn+d4H661dSg9LLCfM
         x9nU4swCfFaUntmlR7nZqyTU6e7qQhBzXoZPOdf7V55+eoMhPojVV3eIg7GW6bj5h5VB
         ilDsCWOPwaOkNqT3svp2A2JqJKiiroNCkj8LSa3bu/5l065Z5d6xWz7Cyvw83jsxXZJq
         Ul6SA06nPDwbYgvV0/5JEKqS6D+iOhFvm4kM4/7mNNC+ev2PPfoVAiOXC9yzW1opGPxU
         bkuw==
X-Gm-Message-State: AOAM531n34kvUlGqghDz6eQSk0zS4JUVOo4gxdfpWEUo7+wdE+Ceuo1N
        2OByBxgdcXm4JCJ/wHYrpKNLSuIzL3IXLjOXQhs=
X-Google-Smtp-Source: ABdhPJy0dDm/mlyjTZTlzLyJP2VMt8V9BsgSHXvzkfxp3RQMuGYj214mbiDUSn4mWhvgON2nHHH6KEoHezuFlsRgyYI=
X-Received: by 2002:aa7:cb09:: with SMTP id s9mr8212855edt.359.1636450443458;
 Tue, 09 Nov 2021 01:34:03 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk> <20211102161125.1144023-13-kernel@esmil.dk>
 <CAHp75VdmnnrisuP00W0KYta0KgmC+fu3WMxm959dt5X1kpiKTw@mail.gmail.com>
 <CAHp75VcuGdaq_TjjRS0S8R5y-nryLABZSp7ehrXz-fUS2W3vfA@mail.gmail.com>
 <CACRpkdYe-tW2K2eOQa+FYb-ZXzrA95+pPc6kkLB8ZJLAT8G_eA@mail.gmail.com> <CANBLGcyo3YjygkjDmdjt4C_H=MZdHQwqumsxnatuObeP2LADAg@mail.gmail.com>
In-Reply-To: <CANBLGcyo3YjygkjDmdjt4C_H=MZdHQwqumsxnatuObeP2LADAg@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 9 Nov 2021 11:33:18 +0200
Message-ID: <CAHp75VdBaKZVeA7dasHWP4E3c8F2phaGz-90FErj3bB8FJOS9w@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
To:     Emil Renner Berthing <kernel@esmil.dk>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
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

On Tue, Nov 9, 2021 at 11:21 AM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Tue, 9 Nov 2021 at 02:01, Linus Walleij <linus.walleij@linaro.org> wrote:
> > On Tue, Nov 2, 2021 at 9:08 PM Andy Shevchenko
> > <andy.shevchenko@gmail.com> wrote:

...

> > > Linus any comments on this code (sorry if I missed your reply)? The
> > > idea behind above is to skip all settings from the same category and
> > > apply only the last one, e.g. if we have "bias set to X", ..., "bias
> > > disable", ..., "bias set to Y", the hardware will see only the last
> > > operation, i.e. "bias set to Y". I think it may not be the best
> > > approach (theoretically?) since the hardware definitely may behave
> > > differently on the other side in case of such series of the
> > > configurations (yes, I have seen some interesting implementations of
> > > the touchpad / touchscreen GPIOs that may be affected).
> >
> > That sounds weird. I think we need to look at how other drivers
> > deal with this.
> >
> > To me it seems more natural that
> > starfive_padctl_rmw(sfp, group->pins[i], mask, value);
> > would get called at the end of each iteration of the
> > for (i = 0; i < num_configs; i++) loop.
>
> That would work, but when the loop is done the end result would be
> exactly the same.

It seems we interpret the term "result" differently. The result when
we talking about GPIOs is the series of pin state changes incl.
configuration. This is how it should be recognized when programming
hardware.

>  The only difference is that the above would rapidly
> "blink" the different states during the loop until it arrives at the
> result. This would certainly be different, but it can never be the
> intended behaviour and only a side-effect on how the pinctrl framework
> works.

Is it? That's what I'm trying to get an answer to. If you may
guarantee this (the keywords "intended behaviour" and "side effect"),
I wouldn't object.

> The order the different states are blinked depends entirely on
> how the pinctrl framework parses the device tree. I still think it
> would be more natural to cleanly go to the end result without this
> blinking.


-- 
With Best Regards,
Andy Shevchenko
