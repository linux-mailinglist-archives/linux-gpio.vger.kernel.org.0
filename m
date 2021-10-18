Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 021DC432343
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Oct 2021 17:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232636AbhJRPuZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Oct 2021 11:50:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231986AbhJRPuY (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Oct 2021 11:50:24 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 356E2C06161C;
        Mon, 18 Oct 2021 08:48:13 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id t16so898192eds.9;
        Mon, 18 Oct 2021 08:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=v1PYM9PWLM/0wgTMMikzXAP/o0bC3fPRJxSFK9OzpC8=;
        b=bvoVUSzWgSETBCvh833uiGY27G23tFSf/9WrtIVPLQBgwK6Rj56yHcDtEdcQXJK7Hs
         luhJp0KZGQrxsbfoNkE5RJfauKWl2uWHDlCAiyzsGQSKxcfMUeJGY9OaCPv+uJHOiL+m
         wQAZH9S7oAwhLLA5wx0RUsVDSPnzETI4ObrFTk5aI1/w1NhbWB9qM3MgSHEzB3Ax34jC
         350PxSaiPWENuf/mGCHu/PNN6KbitZl5hauVjU1yPwIwyC2ocMIKVnqOwAyJMPw0zy6B
         PvHK7ZEIoSQUR5ab1xWb+E2xpIJ7jAiZ+3Tn/RUsB66/PcXaznkyvxejJlc+6kqYxjsi
         Ntow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=v1PYM9PWLM/0wgTMMikzXAP/o0bC3fPRJxSFK9OzpC8=;
        b=wXpoiXSN4fgYgxpwUqXYVgUbwpbnQA7Uuq4Al8WMMJIjwzkZPPTVJY83vZhcktt4FJ
         I+saJAfwTur23jEXE0d29i10azHhf+Gn1AhiSAL3rwqGryb3nbPBGH5TXfC7yrdVtN9a
         qMWW44n9n+EqwH5AY99ZzingxGBg6lRJ0Czfw642XCgNFOok7auz96EiYXefyUv5BZt5
         8Nx9rmd/s7iZhU3Gd45aW7+fBxMi7yKXYlFvQLhA6bYu3ynQvOZ94qakaneL6PFtvw5f
         XRLz5HX7ne5Mwi3JzzUqkEPYy2nSjH9QoF1nUx+Ng9+vI2QPNY+qxIN7qXCe0m/kw2d6
         5gdg==
X-Gm-Message-State: AOAM532bHOQAxFHTptv2P3grQzzMKQ2jetE/OuVp540qmRuiqjXl88Vd
        sEnFVKqADnrW4zziDeq/G9tt7j06Vs0YLRw0lCM=
X-Google-Smtp-Source: ABdhPJz+JM3f/n/l/fo/vo7/jjTcnbAe1364W/IPs8Uv1VZE0XQpGmrpDB6SZ/1RGXPV+JzGalz543On+DjMTsOZ3lw=
X-Received: by 2002:a05:6402:2787:: with SMTP id b7mr44842444ede.238.1634572089268;
 Mon, 18 Oct 2021 08:48:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211012134027.684712-1-kernel@esmil.dk> <20211012134027.684712-13-kernel@esmil.dk>
 <CAHp75Vep+i+iyJi0LAOKuer-cUZoUoB_ZrWKcmT=EB_4hOgFGw@mail.gmail.com> <CANBLGcxHD2vy0+tXYo5Pkqri9mV7aD9jikvs3ygBJRxF4ApLMA@mail.gmail.com>
In-Reply-To: <CANBLGcxHD2vy0+tXYo5Pkqri9mV7aD9jikvs3ygBJRxF4ApLMA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 18 Oct 2021 18:47:17 +0300
Message-ID: <CAHp75Vc65deoHbks-aPmnjEJzm3GdqFMfBCUqw4vVLVr=71Ncg@mail.gmail.com>
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

On Mon, Oct 18, 2021 at 6:35 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Tue, 12 Oct 2021 at 19:03, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Tue, Oct 12, 2021 at 4:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

When answering, cut down your message to the point, please! It's a bit
annoying to remove overquoting...

...

> > > +               case PIN_CONFIG_BIAS_DISABLE:
> >
> > > +                       mask |= PAD_BIAS_MASK;
> >
> > Use it...
> >
> > > +                       value = (value & ~PAD_BIAS_MASK) | PAD_BIAS_DISABLE;
> >
> > ...here. Ditto for the similar cases in this function and elsewhere.
>
> I don't follow. How do you want me to use mask? If I did value =
> (value & ~mask) | PAD_BIAS_DISABLE; then I'd wipe the previous
> configuration. Eg. suppose the first config is the drive strength and
> second disables bias. Then on the 2nd loop mask =
> PAD_DRIVE_STRENGTH_MASK | PAD_BIAS_MASK and the drive strength value
> would be wiped.

Collect masks and new values in temporary variables and apply them
once after the loop is done, no?

...

> > > +       ret = clk_prepare_enable(clk);
> > > +       if (ret) {
> >
> > > +               reset_control_deassert(rst);
> >
> > Use devm_add_action_or_reset().
>
> I don't see how that is better.

Pity. The rule of thumb is to either try to use devm_*() everywhere in
the probe, or don't use it at all. Above is the more-or-less standard
pattern where devn_add_action_or_reset() is being used in the entire
kernel.

> Then I'd first need to call that and
> check for errors, but just on the line below enabling the clock the
> reset line is deasserted anyway, so then the action isn't needed any
> longer. So that 3 lines of code for devm_add_action_or_reset +
> lingering unneeded action or code to remove it again vs. just the line
> above.

Then don't use devm_*() at all. What's the point?

...

> > > +       sfp->gc.of_node = dev->of_node;
> >
> > Isn't GPIO library do this for you?
>
> If it does I can't find it.

Heh... `man git grep`
Hint: `git grep -n 'of_node = .*of_node' -- drivers/gpio/gpiolib*`

-- 
With Best Regards,
Andy Shevchenko
