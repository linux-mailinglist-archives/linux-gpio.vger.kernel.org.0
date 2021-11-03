Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7FA44441A7
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Nov 2021 13:35:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231975AbhKCMi2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 3 Nov 2021 08:38:28 -0400
Received: from mail-pf1-f171.google.com ([209.85.210.171]:39933 "EHLO
        mail-pf1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231993AbhKCMiL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Nov 2021 08:38:11 -0400
Received: by mail-pf1-f171.google.com with SMTP id x64so2161555pfd.6;
        Wed, 03 Nov 2021 05:35:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JE/2edLy6usLclELy9HdQo+SFIip3f5Fv/danfH38Us=;
        b=MqdddXuI5fFJnjftC8vLsoy2ixpIPYuFiM8V4oraxQUT2habCa1/OyVh9Or5gfhlsh
         54/3R9jpxylyL59NOJYqx8AUw6mSbJYhw3biuhKm2adWmuVZACknH8ZNuHnUZ/0uG02b
         OmCWlvN9TX3iMY7IGv/WKbv/v474vSrqB5kS2c3wn0ULhRtAyJOknq+t95nW0Lk3Zy95
         LwBc1lj4j6oz9UtSbAf4l+osDv3bZAC0xQrNf+PSeygV8MS7manzlCFKNnK9bygpN0nV
         urkvQwnd3LfAxkZ1ViFujKVTKGi7EUHwsYYGz9KDcDPuWp7eSZpDHhlHPFqipgi5r+y/
         CwVA==
X-Gm-Message-State: AOAM5311AHT7zBa2IzVqTifPUN7BErbjkrw5HebaKSMTVY+NoFg2980c
        p0zTd45IlXYqMXRDyQCC7ZeMNrxMoUunQXhJGPU=
X-Google-Smtp-Source: ABdhPJxYbn79vSJ2NRtioaA8LqjYkpfmXUk5eC68C/FQfgWNHpS1VH42PtOSnEicWrsOvNwI2un3ZgJ4IhQvUwx3oI0=
X-Received: by 2002:a63:2d46:: with SMTP id t67mr32735713pgt.15.1635942934696;
 Wed, 03 Nov 2021 05:35:34 -0700 (PDT)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk> <20211102161125.1144023-13-kernel@esmil.dk>
 <CAHp75VdmnnrisuP00W0KYta0KgmC+fu3WMxm959dt5X1kpiKTw@mail.gmail.com>
 <CANBLGczn8+po09wF_uEvvU8tLCn0ahY+Gkj9JJLxOcj1LC1aLA@mail.gmail.com> <CAHp75VetDHt9G+PT77_py8N4Z06j7oytnXgQq8zss_xZBBeEng@mail.gmail.com>
In-Reply-To: <CAHp75VetDHt9G+PT77_py8N4Z06j7oytnXgQq8zss_xZBBeEng@mail.gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Wed, 3 Nov 2021 13:35:23 +0100
Message-ID: <CANBLGczTnf1UrRt=d-czaG-CE=Rwb1x6MV4c97ia+P3u5Mt8Jg@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] pinctrl: starfive: Add pinctrl driver for
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

On Wed, 3 Nov 2021 at 10:13, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Tue, Nov 2, 2021 at 10:35 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > On Tue, 2 Nov 2021 at 21:02, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > On Tue, Nov 2, 2021 at 6:50 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> > > > +       switch (trigger) {
>
> > > > +       default:
> > >
> > > > +               irq_set_handler_locked(d, handle_bad_irq);
> > >
> > > Why? You have it already in ->probe(), what's the point?
> >
> > So last time you asked about this, I explained a situation where
> > userspace first grabs a GPIO, set the interrupt to edge triggered, and
> > then later loads a driver that requests an unsupported IRQ type.
>
> I didn't get this scenario. Is it real?

No, it's totally made up, but I mean we even have tools like fuzzing
to help us find bugs that would never happen in real use cases.

> > Then
> > I'd like to set the handler back to handle_bad_irq so we don't get
> > weird interrupts, but maybe now you know a reason why that doesn't
> > matter or can't happen?
>
> In ->probe() you set _default_ handler to bad(), what do you mean by
> 'set the handler back to bad()'? How is it otherwise if you free an
> interrupt?

It might not be, but when not sure I thought it better to error on the
safe side.

> So, please elaborate with call traces what the scenario / use case you
> are talking about. If it's true what you are saying, we have a
> situation (plenty of GPIO drivers don't do what you are suggesting
> here).
>
> > > > +               return -EINVAL;
> > > > +       }
>
> ...
>
> > > > +       ret = reset_control_deassert(rst);
> > > > +       if (ret)
> > > > +               return dev_err_probe(dev, ret, "could not deassert resetd\n");
> > >
> > > > +       ret = devm_pinctrl_register_and_init(dev, &starfive_desc, sfp, &sfp->pctl);
> > > > +       if (ret)
> > >
> > > I don't see who will assert reset here.
> >
> > No, so originally this driver would first assert and then deassert
> > reset. I decided against that because in all likelyhood earlier boot
> > stages would have set pinmux up for a serial port, and we don't want
> > to interrupt the serial debug output. The only reason I make sure the
> > reset line is deasserted is in case someone makes a really minimal
> > bootloader that just does the absolute minimal to load a Linux kernel
> > and doesn't even log any anything.
> >
> > By the same token we also don't want to assert reset on error in case
> > it resets pin muxing for the the serial line that was supposed to log
> > the error.
>
> Perhaps comment in the code explaining this?

Sure.
