Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACA75437886
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Oct 2021 15:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233086AbhJVOAA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Oct 2021 10:00:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233082AbhJVN7i (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Oct 2021 09:59:38 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FDFDC061224;
        Fri, 22 Oct 2021 06:57:21 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id y12so1476121eda.4;
        Fri, 22 Oct 2021 06:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N2LgKJHjAxWATzIP8s9Chgsauqr0Jq39ANiFQNTNdvA=;
        b=atHm7dWYDFc+xMMI0nEXnjBKGmTe3Mhj3j44gptKPmL3yZSmcfPhGBE64YsimpDkRj
         3JNapsquzvEaRN4rlLZm/e3gAK6PuH4inkVvuQzMmWJD4Fw6FTtWQPCXkgqDCuh7EULb
         yNTTsoQRo9uDej/o2MZxfOP65jPJvwE94CFsaqfNuZNaXjAjM/EmrMyiG4Xju744vWFB
         MF6JOygy44c4b8O8vYFaLC36mbgBaHx84E22kFUgJLaYtkfz/IR1K5WkWIspkHAhxZrf
         ER3rtRGr7XHV0NpNgjyePT0QzWIZ2EsAHQ7higGfSHKW8azFx28d7dx9gfAmHjBCNF4f
         aSGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N2LgKJHjAxWATzIP8s9Chgsauqr0Jq39ANiFQNTNdvA=;
        b=ZMzIZWuHq8dylZDyJQL0nkdIu3LzEe9anQzZDUefznPDs6C2WvVkHUP4nUAy6gPVr9
         bd/FUyxPhKdOsyRFlAJRCesh5tHbYHIQY4MbHyr3uKhMUqnnDch5lqSdtbMsPnOlKwUN
         N9D2jxQReN/p+84V9cGDG4Zu/99SF/lzqEfDADXPsu8nL5kOcJl5V7AaMMgwfMEG7u6t
         rRhoU8XxpbfAjcYbIC5A5PhTlqODCsYCawshXeanh2MMLcl0JXhFkFuKkcvx6jy/J8Kj
         2yWy3Xo0qgZinWemmU1QuPhwQ6gYyjb4F0VzVliyGltML2hV69QxU105aMxGRpbqc6jR
         x2mg==
X-Gm-Message-State: AOAM530mKf3C1OszVnLru0OzkCgv8pmJytzeOoVXspmmCk3VjNJDW/ln
        t4VPhm0RNaqmWC4DscYWzBQe52tnvfsMBV7hJG0=
X-Google-Smtp-Source: ABdhPJxJM2m9jS5DjeNSJjBC4XIn4RTOgPs/zblzns86IWUdsSxE0UfgtL48RUJSZS0ETv3HMiVmN+oWWEz4xXDFYeE=
X-Received: by 2002:a17:906:2887:: with SMTP id o7mr15492300ejd.425.1634911039873;
 Fri, 22 Oct 2021 06:57:19 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-10-kernel@esmil.dk>
 <CAHp75VcUv6WH0--FANpRExCdEOJNVo8KCtJ2Go090=FZq-Y0UQ@mail.gmail.com>
 <CANBLGcysKdqo+FioSkhd1PZRLzPF=fRJrCTsUGR7vXcn2WpYHg@mail.gmail.com>
 <CAHp75VditKnEcPKgqxz7NfG3ZWLZCu=pW=8qw7HS_iWePTj5Qw@mail.gmail.com> <CANBLGcxDUNib4C0mrP1bYnJSLyZn7rmV1wwJyj5tK4-nbMnu9g@mail.gmail.com>
In-Reply-To: <CANBLGcxDUNib4C0mrP1bYnJSLyZn7rmV1wwJyj5tK4-nbMnu9g@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 22 Oct 2021 16:56:24 +0300
Message-ID: <CAHp75VfcTkpq17fzVmzdZVC=xCBFEajxmG2C79TkD1S5+9BNqg@mail.gmail.com>
Subject: Re: [PATCH v2 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
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
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 22, 2021 at 4:50 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Fri, 22 Oct 2021 at 15:39, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Fri, Oct 22, 2021 at 4:35 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > On Fri, 22 Oct 2021 at 14:56, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > On Thu, Oct 21, 2021 at 8:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> > > > Can you convert this to simple
> > > >
> > > >   if (assert)
> > > >     ret = readl_...
> > > >   else
> > > >     ret = readl_...
> > > >
> > > > below?
> > >
> > > I don't see how that would work. We're using the done value in in the
> > > readl_poll_timeout. Maybe you can be a bit more explicit.
> >
> > Supply done either == mask or == ^mask. Try it.
>
> So you want this?
> if (assert)
>   ret = readl_poll_timeout_atomic(reg_status, value, (value & mask) ==
> done, 0, 1000);
> else
>   ret = readl_poll_timeout_atomic(reg_status, value, (value & mask) ==
> ^done, 0, 1000);
>
> The compiler might be clever enough, but I'd worry the long body of
> the readl_poll_timeout_atomic macro is inline twice. Rather than just
> flipping the bit in `done`.

You have a point, although it would be nice to have confirmation of either.

-- 
With Best Regards,
Andy Shevchenko
