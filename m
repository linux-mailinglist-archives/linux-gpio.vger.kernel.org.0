Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AC3143940C
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Oct 2021 12:52:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232934AbhJYKyl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Oct 2021 06:54:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbhJYKye (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Oct 2021 06:54:34 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7B0DC061224;
        Mon, 25 Oct 2021 03:52:10 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id z20so18161979edc.13;
        Mon, 25 Oct 2021 03:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NjHry8Fv5zzV/JAApPjcefE7M+AQEl6U+mJvNnu7wyQ=;
        b=dFzeI9cZ5SddbIq480bmLmsT5M6Xll/8SFcq3UuBf1wdp8GUojw8+x0SEbwRukMVUh
         ALRnhxIHX6VZSIVB1copUjNOho/p5Ovbb96iZ5MA1o7ObzxZmg/a9bURhISSEIglU+A0
         myBzjtbmqWBKgZ3GGZdGmM/t3fOS33lyUvrVU9nboK7WJq0gKRSQKbGsxeaAWKez2iqt
         FyQuG147gFRbdne++zH7gwQT0kCgQYRLYqMGivJBFk23QcMQRdvVhT2ZeTSXMlsADgaW
         w+te6n8Dr/kp2kro+JMpnjcjrvvPcJLuWGPj1JUo1LSfsADYHTUEfwBXz4XS7UDs7V8q
         mIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NjHry8Fv5zzV/JAApPjcefE7M+AQEl6U+mJvNnu7wyQ=;
        b=XAMSLaVrFuEgZfXmDoAN2J0qAVw0fXcN57IKBXM/Rogfj2xNiGpds5irFUllhNPyR/
         kSH0MD+T33DlbqdXdrkGSZBG/v/6ZrW9KNu6ZH1pk8wAy5SB8ANV9QSB11wqyyzZqrmU
         wdLbUgk4RcAsU0oPRaV7x3R0KQj+JuASpPvPdgUnDqVlG6AemamIfaI38LUAc/uKQnDr
         vssrq3sRi+F9mKt0uhAzrNACtkcaPLjADrUuXnQS57kXniZRHoEcF5v22riGh5Wpvnlo
         qeSaJthTY8LlVtgdu6nbbz4+9lGUyDytoqsPwVyDM1AIV5CflKOtRhCAj3mrR8M34+0T
         T2dQ==
X-Gm-Message-State: AOAM531+dI0T91bwgsHBKZbGjZwmHBWKyINgevj+MfrEbznur0tO1hys
        0spd2n0Rzk6eonWRFNju1oFMeFu4MPHxer4KvwA=
X-Google-Smtp-Source: ABdhPJzr/m0IXbfrBpHO+bWETekwH+mW5UDrGhdzAB/d5gzJ6NqY7h/m5pCFxn3ZIU5LNm2oLXH1TnyiqSFFdtv5ff0=
X-Received: by 2002:a17:907:7601:: with SMTP id jx1mr21787575ejc.69.1635159129379;
 Mon, 25 Oct 2021 03:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-13-kernel@esmil.dk>
 <CAHp75Vf3yNoKxguHP3EPcRV_3tG++Fd=FVM0MXqW4_SmLA6HEw@mail.gmail.com>
 <CANBLGcxEwkcZn2CC69zLaVqL8ocS6r6HDaaoUF09gg1mpDxFzg@mail.gmail.com>
 <CAHp75Vc5-Sg-0kKN=OMs_2iJbtc+D9=f0-Sp+SpY5O3roU3XdA@mail.gmail.com>
 <CANBLGcxnmt4Ki4EHAXeoJX5mJMyeioZXhGaDsKm_wk86D4js3Q@mail.gmail.com>
 <CANBLGcyOfo3r0Viidf9kyW0Q9yD4uqTLm90+7O=T49v7ZHurfA@mail.gmail.com>
 <CAHp75Vc1EES8c7XD-MbQNdtCJA3YvvEYd3_e378rVCe6=AmhvQ@mail.gmail.com> <CANBLGczXN4JV1Xrym_YGiAvrOFwkd4-PDjfvL93ZMgePb7wFVA@mail.gmail.com>
In-Reply-To: <CANBLGczXN4JV1Xrym_YGiAvrOFwkd4-PDjfvL93ZMgePb7wFVA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 25 Oct 2021 13:51:15 +0300
Message-ID: <CAHp75VdufyQpMVqhXK_UmOmsHSd8v2aDA-hKQNeQQfQF2-gJFA@mail.gmail.com>
Subject: Re: [PATCH v2 12/16] pinctrl: starfive: Add pinctrl driver for
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

On Mon, Oct 25, 2021 at 1:24 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Mon, 25 Oct 2021 at 12:16, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Sun, Oct 24, 2021 at 12:29 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > On Sat, 23 Oct 2021 at 23:02, Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > > On Sat, 23 Oct 2021 at 22:29, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > > On Sat, Oct 23, 2021 at 9:46 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> > > > > > I such cases where you get conflicting PIN_CONFIG_BIAS_* settings I
> > > > > > don't see why it's better to do the rmw on the padctl register for the
> > > > > > first bias setting only to then change the bits again a few
> > > > > > microseconds later when the loop encounters the second bias setting.
> > > > > > After the loop is done the end result would still be just the last
> > > > > > bias setting.
> > > > >
> > > > > It could be bias X followed by something else followed by bias Y. You
> > > > > will write something else with bias Y. I admit I don't know this
> > > > > hardware and you and maintainers are supposed to decide what's better,
> > > > > but my guts are telling me that current algo is buggy.
> > > >
> > > > So there is only one padctl register pr. pin. I don't see why first
> > > > setting the bias bits to X, then setting some other bits, and then
> > > > setting the bias bits to Y would be different from just setting all
> > > > the bits in one go. Except for during that little microsecond window
> > > > during the loop that I actually think it's better to avoid.
> > >
> > > Maybe an example is in order. Suppose we get strong pull-up, drive
> > > strength 3 and pull-down config flags (the strong pull-up and pull
> > > down flags conflict) and the padctl value is 0x0c0 (pull-up, input and
> > > schmitt trigger enabled). With your solution of just altering the
> > > padctl bits immediately we'd call starfive_padctl_rmw 3 times in rapid
> > > succession like this:
> > >
> > > starfive_padctl_rmw(pin, 0x130, 0x100);
> > > starfive_padctl_rmw(pin, 0x007, 0x003);
> > > starfive_padctl_rmw(pin, 0x130, 0x010);
> > >
> > > ..and the end result would be 0x0d3, although the strong pull-up would
> > > be enabled for the microseconds between the 1st and 3nd call.
> > > As the code is now it'd just directly do
> > >
> > > starfive_padctl_rmw(pin, 0x137, 0x013)
> > >
> > > ..which again results in 0x0d3, only without the microsecond blink of
> > > the strong pull-up.
> >
> > You missed the point. Hardware on the other end may behave well
> > differently in these two cases.
>
> Right, but that can never be an intended behaviour. Which of the
> conflicting bias settings comes first and is blipped before the 2nd
> remains entirely depends on how the pinctrl framework parses the
> devicetree. I'd much rather have it cleanly go to just one of the
> states, which might be the wrong one, but the conflicting bias
> settings are wrong to begin with.

That's why I said that is up to you and maintainers and people who
know hardware better than me.

-- 
With Best Regards,
Andy Shevchenko
