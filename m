Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD822437752
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Oct 2021 14:41:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232323AbhJVMnn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Oct 2021 08:43:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231474AbhJVMnj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Oct 2021 08:43:39 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26E7CC061220;
        Fri, 22 Oct 2021 05:41:22 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id g10so1076064edj.1;
        Fri, 22 Oct 2021 05:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tHQR2Z1qPtXtLpD0ldcO3jwebCIJGWS4TZ77ng4RLWk=;
        b=REF5yOX879PB3VexQN+8YNPVZ8RLatORYZww04QHrDlIRQM7I4x6kER2e5a6EhqPX5
         xkmWjyoVWZn+LPnptkCjqJ1fgLohJn3/jJ2tu+oTZKvBHoECP1XK1g30HssJ2oewzFRK
         r2ffSYJBdijXbAOvef5h34X0+ZvvlEihjm2tBaehkcOlOVpyM7cWJ4Ly4z3m2naCmpHY
         xjULUeXBNPPdi8pPRJqk/Cws5on4ye04LWF5yxlWBbxQgS7oaINKqymuwYmr2QSuuv1O
         cDPAf+BPabV0KHeH5oXH6alCa+AIiTFU28gVJNnuAV/Z9fqyzYvKZfIsEBmGONkYzdVQ
         7Q1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tHQR2Z1qPtXtLpD0ldcO3jwebCIJGWS4TZ77ng4RLWk=;
        b=laVRjrCTLcFKGPTa0iPmsBpYOFQFwIJXFiN+MOxLSuYhy9Z3yDuHrvf2RriwzQEqLe
         sbH8Xyx+R1ToLLW4qJZC2IUrojh5EkATfEC/x6bf6wVKGLkbm23TiPWSCbABvLqNZt4m
         Wu+UyJtuYr9Lo3CFV8DKEHRL9icj8iGP9aqQmgP4qVTc0bfsbj+grpQzoBF4xePDjhuG
         8CKqhtIr1c1AfWCL9Z30mCymQcUVSVcdIA5BFzp6VgoaDjDAE/quDc5ESGtgMGVjF8j7
         KaOKLXTBg4i1rSP+e1sYmrdj6lmGB0gDQcqro2JmHjDuQXctSnIjGEXfOrPVnrqY28zv
         Cifw==
X-Gm-Message-State: AOAM533IGgRt0uX2wbYkyeH1OamP+HICyD/9IF3Fd6fwIhDaumqg1okq
        /5jc4yHwgN18WyTYAYl2Gd0OFcaOl6jngOJGAxg=
X-Google-Smtp-Source: ABdhPJwiFLRfZxQa56LwZ/jlFLeGcQX5OKJGaYAlbeJ1xllTBp0a3m0uOfcMCb4u/khczTjeZS6N2tacQalYzsvXwkU=
X-Received: by 2002:aa7:c0d2:: with SMTP id j18mr17090901edp.107.1634906480674;
 Fri, 22 Oct 2021 05:41:20 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-2-kernel@esmil.dk>
 <CAHp75VfD73Nsrp-3hMzFtuEAfka+rRc=2m0ZZYddhWBAzg=QAw@mail.gmail.com> <CANBLGcxJGgi9nuT6LpjGgPj1bg0aW-ELRCAO0Csv3xi82gTCnQ@mail.gmail.com>
In-Reply-To: <CANBLGcxJGgi9nuT6LpjGgPj1bg0aW-ELRCAO0Csv3xi82gTCnQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 22 Oct 2021 15:40:24 +0300
Message-ID: <CAHp75Ve400r6GCeROhX3XF7KSjA=HKpDoR9ip+efYtPS9FRahg@mail.gmail.com>
Subject: Re: [PATCH v2 01/16] RISC-V: Add StarFive SoC Kconfig option
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

On Fri, Oct 22, 2021 at 12:40 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Fri, 22 Oct 2021 at 10:51, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Thu, Oct 21, 2021 at 8:42 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> > > +config SOC_STARFIVE
> > > +       bool "StarFive SoCs"
> > > +       select PINCTRL
> > > +       select RESET_CONTROLLER
> >
> > > +       select SIFIVE_PLIC
> >
> > If this is well understood and platform related the above two are too
> > generic. Why have you selected them?
>
> From your last comments the criterion seemed to be to only add it here
> if it would otherwise fail to boot. Well it does fail to boot without
> the reset and pinctrl drivers. The clock driver too, but RISCV already
> selects COMMON_CLK. Once PINCTRL and RESET_CONTROLLER is selected the
> specific drivers defaults to SOC_STARFIVE.
>
> Alternatively we'd select the drivers too, but I can't promise that
> future StarFive chips will need the same JH7100 clock and reset
> drivers. Doing it this way means that selecting SOC_STARFIVE by
> default gives you a kernel that will boot on all StarFive SoCs, but
> you can still customise it further to your particular chip. It seems
> like SOC_SIFIVE is doing the same.

Okay, please add this justification to the commit message in the next version.

...

> > > +       help
> > > +         This enables support for StarFive SoC platform hardware.
> >
> > Not too much to read here. What is the point of this help?
> > I would elaborate what kind of platform it may support, what kind of
> > drivers it selects due to necessity of the accomplishing the boot
> > process, etc.
>
> This is exactly as the other descriptions in this file. I don't know
> why SOC_STARFIVE should be special.

OK.

-- 
With Best Regards,
Andy Shevchenko
