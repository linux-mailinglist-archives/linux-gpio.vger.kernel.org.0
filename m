Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 725934323C2
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Oct 2021 18:24:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232964AbhJRQ0a (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Oct 2021 12:26:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231787AbhJRQ0a (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Oct 2021 12:26:30 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F5D3C06161C;
        Mon, 18 Oct 2021 09:24:18 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id y30so972578edi.0;
        Mon, 18 Oct 2021 09:24:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4AoWD6SUSp4eEkyuJq6IaHqc5Bg04FTz6+o3BhvQ67Y=;
        b=KJqDiPYTT/bMwQDSoKUkqHAP38O8D294FHNqUDp3xA3Z4Pn1mMnr5oawZCV8E+lKmZ
         uFLlOCCBzEQaO9lQya58tUWAQproLR8BKqkir6cY7cOsmW2z5ZME2USL+wFaZ/9dgcfl
         SBzQzLZSJwZEJzar6cDLijRBoz3TH1AoQMLd7RTPZoL8pkbr5Vd7C8S7q2wQn/fS1Kal
         rwgM3GauvFn2rJAn6ZArNfKlK+/qb8HgwvKJ8AtGbgIAhcILUG4GzrKSRqry1ObRyepG
         D44rUAGl8dQbTmbziVLkxfaGDPns+gODuT3QKDJLaObrjYpa210HShFcIX1dsO1D/NWx
         gpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4AoWD6SUSp4eEkyuJq6IaHqc5Bg04FTz6+o3BhvQ67Y=;
        b=Gw88V1hp2WYQu++SB2glQPyYk5eOc7Al5xwAd7CoOqwzDBV1ErDUU4ntZzNc42Fef/
         0WHojodmwh5oxj+c7y97+4LKDnh/gle6BvpzrP0Un0fWrAW/9riR84wa3cJMoN1A1nm5
         SeJJu/Mk25zOu8K7xHqoByDeI6WCsiURCklvmm3czjpqoqnGPW8mH84Dniutdob0la6d
         250KclozGqh9wr3xvCqUT238L14D7WTouA0ogLc4HR4n94LlW51C0CvAkxXSCPaFQzHx
         zOo9yVgnSMwPCbPxDAfrkvjdXYTRHAWvNSK6IuQEioJmp/cnvB+CYQkqOwIwjkGYEN0u
         zHEw==
X-Gm-Message-State: AOAM53335Bw9xjE2RexqEDlD9j7QLlRh9lNJdokWgYikCQ1Dw1CANayU
        Q1JTRCehPRyJVmVFNeyp3jV3BIofRY9l56glRTw=
X-Google-Smtp-Source: ABdhPJyebo/9QgAnb9IJTkImn44hpM+UV1/Wh9aELlMLlpQ7p3Mua6sC+spKPtZOp/U6IHHkhEj3B+z/09rGnN+QAfQ=
X-Received: by 2002:a50:e188:: with SMTP id k8mr47408145edl.119.1634574250577;
 Mon, 18 Oct 2021 09:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk> <20211012134027.684712-13-kernel@esmil.dk>
 <CAHp75Vep+i+iyJi0LAOKuer-cUZoUoB_ZrWKcmT=EB_4hOgFGw@mail.gmail.com>
 <CANBLGcxHD2vy0+tXYo5Pkqri9mV7aD9jikvs3ygBJRxF4ApLMA@mail.gmail.com>
 <CAHp75Vc65deoHbks-aPmnjEJzm3GdqFMfBCUqw4vVLVr=71Ncg@mail.gmail.com> <CANBLGcxriKLZ+CKUsj5sviW8FdHnWTF2koROwmAb=G2tbmE6vQ@mail.gmail.com>
In-Reply-To: <CANBLGcxriKLZ+CKUsj5sviW8FdHnWTF2koROwmAb=G2tbmE6vQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 18 Oct 2021 19:23:17 +0300
Message-ID: <CAHp75VccSDLVbs1sF_-1zghWyLKtKKV1qtxOxZZ-cS0e6S-sBA@mail.gmail.com>
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

On Mon, Oct 18, 2021 at 6:56 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Mon, 18 Oct 2021 at 17:48, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Mon, Oct 18, 2021 at 6:35 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > On Tue, 12 Oct 2021 at 19:03, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > On Tue, Oct 12, 2021 at 4:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> > > > > +               case PIN_CONFIG_BIAS_DISABLE:
> > > >
> > > > > +                       mask |= PAD_BIAS_MASK;
> > > >
> > > > Use it...
> > > >
> > > > > +                       value = (value & ~PAD_BIAS_MASK) | PAD_BIAS_DISABLE;
> > > >
> > > > ...here. Ditto for the similar cases in this function and elsewhere.
> > >
> > > I don't follow. How do you want me to use mask? If I did value =
> > > (value & ~mask) | PAD_BIAS_DISABLE; then I'd wipe the previous
> > > configuration. Eg. suppose the first config is the drive strength and
> > > second disables bias. Then on the 2nd loop mask =
> > > PAD_DRIVE_STRENGTH_MASK | PAD_BIAS_MASK and the drive strength value
> > > would be wiped.
> >
> > Collect masks and new values in temporary variables and apply them
> > once after the loop is done, no?
>
> But that's exactly what the code does. It merges all the config
> options into a single mask and value so we only need to do rmw on the
> register once.

Then masking the value makes no sense.
What you should have is simply as

  mask |= FOO;
  value |= BAR;

...

> > > > > +       ret = clk_prepare_enable(clk);
> > > > > +       if (ret) {
> > > >
> > > > > +               reset_control_deassert(rst);
> > > >
> > > > Use devm_add_action_or_reset().
> > >
> > > I don't see how that is better.
> >
> > Pity. The rule of thumb is to either try to use devm_*() everywhere in
> > the probe, or don't use it at all. Above is the more-or-less standard
> > pattern where devn_add_action_or_reset() is being used in the entire
> > kernel.
> >
> > > Then I'd first need to call that and
> > > check for errors, but just on the line below enabling the clock the
> > > reset line is deasserted anyway, so then the action isn't needed any
> > > longer. So that 3 lines of code for devm_add_action_or_reset +
> > > lingering unneeded action or code to remove it again vs. just the line
> > > above.
> >
> > Then don't use devm_*() at all. What's the point?
>
> I'm confused. So you wan't an unneeded action to linger because the
> probe function temporarily asserts reset for 3 lines of code?

I;m talking about clk_prepare_enable().

...

> > > > > +       sfp->gc.of_node = dev->of_node;
> > > >
> > > > Isn't GPIO library do this for you?
> > >
> > > If it does I can't find it.
> >
> > Heh... `man git grep`
> > Hint: `git grep -n 'of_node = .*of_node' -- drivers/gpio/gpiolib*`
>
> That's exactly what I did.

Now look at the result and find the correct place where it's done.
Btw, all hits are in the very same function.

-- 
With Best Regards,
Andy Shevchenko
