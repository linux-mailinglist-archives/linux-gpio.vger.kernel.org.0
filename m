Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE8E6432361
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Oct 2021 17:56:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233141AbhJRP62 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Oct 2021 11:58:28 -0400
Received: from mail-pl1-f169.google.com ([209.85.214.169]:42978 "EHLO
        mail-pl1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232019AbhJRP62 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Oct 2021 11:58:28 -0400
Received: by mail-pl1-f169.google.com with SMTP id l6so11536201plh.9;
        Mon, 18 Oct 2021 08:56:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Sz77FGY3TYZu+DudMczIxYP7Uz431ugMBdntq9R2j6g=;
        b=fMWAyxCGyUQl41hh95+Y8oHBNoYwVoSs00yjW8OGqOvMGdwcOk4D0Jz0g1PxnwdVqa
         RdcB8gwaQys115HjZ5tgNbVvMZldZbwHan8ozsqWBLY+7JA5L03Dvyf79URvd/cU97yq
         DgFrbqLL26i1Kjzcr9PJ1Yx8BrAuYdUcTITtI+aO+j/viJVpR+M9JKFVaVsq2EY/wrwQ
         L8i4oaGaRjwkpr+jzqaIe1viP0ACpSGFteZ1h5H+cTpJXkKMUlo5joU2PZAwc/lA8noc
         v4awG+mUghOaHChEh/Syghmeqdu66bufJUn51UqpIIwHaPxWcTvgyadhc5vHsyzd4Gkp
         gn1w==
X-Gm-Message-State: AOAM533gppni8c+ydFOYQ0Hwgd/4LX1H5lgnCEvY+GckzDtuWMdfstti
        zgd6Shj/5bhKxpOjMtIH0BijAQLjl9LtovCkKEg=
X-Google-Smtp-Source: ABdhPJytbrnjvXDqXeJ32Cr4x0roS+Ri36aOfdjuS8Ff/22AEVjBwE3WwhfM7pfyCnhYscJ4ErQEhShdpzuzuK3o9YA=
X-Received: by 2002:a17:90b:694:: with SMTP id m20mr48766296pjz.160.1634572576629;
 Mon, 18 Oct 2021 08:56:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk> <20211012134027.684712-13-kernel@esmil.dk>
 <CAHp75Vep+i+iyJi0LAOKuer-cUZoUoB_ZrWKcmT=EB_4hOgFGw@mail.gmail.com>
 <CANBLGcxHD2vy0+tXYo5Pkqri9mV7aD9jikvs3ygBJRxF4ApLMA@mail.gmail.com> <CAHp75Vc65deoHbks-aPmnjEJzm3GdqFMfBCUqw4vVLVr=71Ncg@mail.gmail.com>
In-Reply-To: <CAHp75Vc65deoHbks-aPmnjEJzm3GdqFMfBCUqw4vVLVr=71Ncg@mail.gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Mon, 18 Oct 2021 17:56:05 +0200
Message-ID: <CANBLGcxriKLZ+CKUsj5sviW8FdHnWTF2koROwmAb=G2tbmE6vQ@mail.gmail.com>
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

On Mon, 18 Oct 2021 at 17:48, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Mon, Oct 18, 2021 at 6:35 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > On Tue, 12 Oct 2021 at 19:03, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > On Tue, Oct 12, 2021 at 4:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> When answering, cut down your message to the point, please! It's a bit
> annoying to remove overquoting...
>
> ...
>
> > > > +               case PIN_CONFIG_BIAS_DISABLE:
> > >
> > > > +                       mask |= PAD_BIAS_MASK;
> > >
> > > Use it...
> > >
> > > > +                       value = (value & ~PAD_BIAS_MASK) | PAD_BIAS_DISABLE;
> > >
> > > ...here. Ditto for the similar cases in this function and elsewhere.
> >
> > I don't follow. How do you want me to use mask? If I did value =
> > (value & ~mask) | PAD_BIAS_DISABLE; then I'd wipe the previous
> > configuration. Eg. suppose the first config is the drive strength and
> > second disables bias. Then on the 2nd loop mask =
> > PAD_DRIVE_STRENGTH_MASK | PAD_BIAS_MASK and the drive strength value
> > would be wiped.
>
> Collect masks and new values in temporary variables and apply them
> once after the loop is done, no?

But that's exactly what the code does. It merges all the config
options into a single mask and value so we only need to do rmw on the
register once.

> ...
>
> > > > +       ret = clk_prepare_enable(clk);
> > > > +       if (ret) {
> > >
> > > > +               reset_control_deassert(rst);
> > >
> > > Use devm_add_action_or_reset().
> >
> > I don't see how that is better.
>
> Pity. The rule of thumb is to either try to use devm_*() everywhere in
> the probe, or don't use it at all. Above is the more-or-less standard
> pattern where devn_add_action_or_reset() is being used in the entire
> kernel.
>
> > Then I'd first need to call that and
> > check for errors, but just on the line below enabling the clock the
> > reset line is deasserted anyway, so then the action isn't needed any
> > longer. So that 3 lines of code for devm_add_action_or_reset +
> > lingering unneeded action or code to remove it again vs. just the line
> > above.
>
> Then don't use devm_*() at all. What's the point?

I'm confused. So you wan't an unneeded action to linger because the
probe function temporarily asserts reset for 3 lines of code?

> ...
>
> > > > +       sfp->gc.of_node = dev->of_node;
> > >
> > > Isn't GPIO library do this for you?
> >
> > If it does I can't find it.
>
> Heh... `man git grep`
> Hint: `git grep -n 'of_node = .*of_node' -- drivers/gpio/gpiolib*`

That's exactly what I did.

> --
> With Best Regards,
> Andy Shevchenko
