Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8607B4323D7
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Oct 2021 18:29:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232159AbhJRQbQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Oct 2021 12:31:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231896AbhJRQbP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Oct 2021 12:31:15 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A780C06161C;
        Mon, 18 Oct 2021 09:29:04 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id t16so1422678eds.9;
        Mon, 18 Oct 2021 09:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=go6M/Tog8flAQW1HzW4YFa0p20USW+mf9kFuZcNf8mk=;
        b=jP9HBXYHxZgqk2J+tn5xTCYbPlQepVBxngJycCCgXQg72Arv/y9UFSLe1xxm+E6B4U
         F1xlsuJWqNimxACKALKzC5XS0OvzHdHMBosaEO9sY8yqBw8/8wg0O56yZEHQbJnWf28z
         Sw8ykgl/x/YTy0yNUpV9dCvapB7QZCDTM84AmVV6ikeBq+V2FVmILX2pbJG5MQMYC/Rz
         H5gT3WlA9Q7CwI2fHAX4+34pH84X9TtiSpFivCuga5ajPwahYOp4FvHCNU9VvzygFdCf
         euaRRIrTIkFqGzy2YSToRSBRfA/sheH11LE3kdriHEZgpCLDBOJidiB8t8EEoTtocnUt
         6J2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=go6M/Tog8flAQW1HzW4YFa0p20USW+mf9kFuZcNf8mk=;
        b=6Z71bVolrwctFlsLNBqH2nTV3Ob+QMgpecSajmNB4C0u9fVb61L1JC4A5vekWAD/VQ
         bgSBV8AYBpt1pZMIBGacjAQACAZAQr0QX73SCTTG6fCSosB/MAYxoKhhTbEaJfv6ErD2
         x3NX3rJm6O4QeqvX06cUaeBAgJzumO1iZ0YkfHciqrSRq85DA7+opiKaAWJm75O48n0Z
         0AHP82WtP2C5lTMXbITAkiBBxRoFmSWJb/gtGHDWXGxt46Sv+1Mp/Lr9VdIkud5oxyBJ
         0MUs3INyo/2f9BbAAnS5wPRMe1U9DTiVMKWgnjWd/dMJhsfjYCTW4DLXMHWWu79FBPYx
         dXNw==
X-Gm-Message-State: AOAM533UrWbQ8p3m4mGilgY0Y0i37oxxlR1fQczx/9SN/tmO7/egdnU0
        +adSCQZQXRodNe+/x8JPKUWXq6A48CQSc1aSeVc=
X-Google-Smtp-Source: ABdhPJySQchKlX2Z3vZgM94HVf782asdDHy8KZRlrHXfWgmW5M7pcwBYarJ5l7phz588zZG7XLo36Ras9FTSn01agns=
X-Received: by 2002:a17:906:2887:: with SMTP id o7mr30097276ejd.425.1634574543124;
 Mon, 18 Oct 2021 09:29:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk> <20211012134027.684712-13-kernel@esmil.dk>
 <CAHp75Vep+i+iyJi0LAOKuer-cUZoUoB_ZrWKcmT=EB_4hOgFGw@mail.gmail.com>
 <CANBLGcxHD2vy0+tXYo5Pkqri9mV7aD9jikvs3ygBJRxF4ApLMA@mail.gmail.com>
 <CAHp75Vc65deoHbks-aPmnjEJzm3GdqFMfBCUqw4vVLVr=71Ncg@mail.gmail.com>
 <CANBLGcxriKLZ+CKUsj5sviW8FdHnWTF2koROwmAb=G2tbmE6vQ@mail.gmail.com> <CAHp75VccSDLVbs1sF_-1zghWyLKtKKV1qtxOxZZ-cS0e6S-sBA@mail.gmail.com>
In-Reply-To: <CAHp75VccSDLVbs1sF_-1zghWyLKtKKV1qtxOxZZ-cS0e6S-sBA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 18 Oct 2021 19:28:10 +0300
Message-ID: <CAHp75VcgFRGpca-pSU9T5Oo1fT4aWQJd5EQfyZscGYx0mDMJ_Q@mail.gmail.com>
Subject: Re: [PATCH v1 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
To:     Emil Renner Berthing <kernel@esmil.dk>
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

On Mon, Oct 18, 2021 at 7:23 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Mon, Oct 18, 2021 at 6:56 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > On Mon, 18 Oct 2021 at 17:48, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > On Mon, Oct 18, 2021 at 6:35 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > > On Tue, 12 Oct 2021 at 19:03, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > > On Tue, Oct 12, 2021 at 4:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

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

Having a second look I found even problematic error paths because of
mixing devm_*() with non-devm_*() calls, which only assures me that
your ->probe() error path is broken and should be revisited.

-- 
With Best Regards,
Andy Shevchenko
