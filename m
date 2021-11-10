Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E323A44BFFF
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Nov 2021 12:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231303AbhKJLSL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Nov 2021 06:18:11 -0500
Received: from mail-pg1-f181.google.com ([209.85.215.181]:41734 "EHLO
        mail-pg1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231131AbhKJLSL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Nov 2021 06:18:11 -0500
Received: by mail-pg1-f181.google.com with SMTP id n23so1947939pgh.8;
        Wed, 10 Nov 2021 03:15:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ClY6fmDoOxt9WGtpyKfVteeYzW6rEuh6CcP1PbPjKLs=;
        b=7KS+mc/zYzu8kWe1NUQc4jnk/Sy956byztMcWbM7RwvQFiOJVQl5fUoE9OjRatzH+A
         xbuPCaaBeT7YGhm1j2Pu152V0l0D3FfYlqSizNg434clsmGbd8M2v05th5sdIYWANjGP
         gDvr8dnVuLq9zfA+CwVlYL/Iwe9aLTR0XQpu+9RHFFvU11nNnjssGiPg7dqRLhcRsZYT
         oVWmZG9ZSHZZJcHzrDGrWZc3TtShH0LkftqjxanVT3X6uD51vHCEylctf1e2tdauMj41
         XoUt8seXiqi+IKvlSGy84rJ4iDlgmbz99QX6EnFgQMMXRKMWFAA2Ius+GttzVf3bML2g
         31eg==
X-Gm-Message-State: AOAM530IrVhFzYkUz0Itl9p+iN/zp2Ei/mRG9ppVE/UZua911IMQ6hYJ
        gJpJhXOPTPMP6TSQL24Fqc6fZtJOhE5Tdvew5+E=
X-Google-Smtp-Source: ABdhPJytXP1IZu85W3D1n2+CMyE8syz896fxWd4se2sx5oabHakMgfHn+iJX8mmbMFqlgMuJ/UaEDepThBex+/NV1Mg=
X-Received: by 2002:aa7:91c5:0:b0:49f:a400:9771 with SMTP id
 z5-20020aa791c5000000b0049fa4009771mr15317197pfa.79.1636542923673; Wed, 10
 Nov 2021 03:15:23 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk> <20211102161125.1144023-13-kernel@esmil.dk>
 <CAHp75VdmnnrisuP00W0KYta0KgmC+fu3WMxm959dt5X1kpiKTw@mail.gmail.com>
 <CAHp75VcuGdaq_TjjRS0S8R5y-nryLABZSp7ehrXz-fUS2W3vfA@mail.gmail.com>
 <CACRpkdYe-tW2K2eOQa+FYb-ZXzrA95+pPc6kkLB8ZJLAT8G_eA@mail.gmail.com>
 <CANBLGcyo3YjygkjDmdjt4C_H=MZdHQwqumsxnatuObeP2LADAg@mail.gmail.com>
 <CAHp75VdBaKZVeA7dasHWP4E3c8F2phaGz-90FErj3bB8FJOS9w@mail.gmail.com>
 <CANBLGcw7X9SY3_=A7ZXW60646vconjCbYBsvb=D2a0BPcyn75A@mail.gmail.com>
 <CACRpkda7b+j1=X9rUrqwEFhxvp2zVTvFkxanjh3hL7AksqCX1g@mail.gmail.com>
 <CANBLGcxT_a3J+uaaKazRkfJQoBjGGGiz9agAZUzMEmfJiVXXbw@mail.gmail.com> <YYt9I7hfugtpeALs@smile.fi.intel.com>
In-Reply-To: <YYt9I7hfugtpeALs@smile.fi.intel.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Wed, 10 Nov 2021 12:15:12 +0100
Message-ID: <CANBLGcwA8q5JRizzaSQKyMAMLmC1eF8tL=z5EJ2PK89488NJFg@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
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

On Wed, 10 Nov 2021 at 09:05, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Tue, Nov 09, 2021 at 10:04:24PM +0100, Emil Renner Berthing wrote:
> > On Tue, 9 Nov 2021 at 21:29, Linus Walleij <linus.walleij@linaro.org> wrote:
> > > On Tue, Nov 9, 2021 at 10:40 AM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> ...
>
> > No, I agree. I think it's only that Andy wasn't sure if these interim
> > states might be meaningful/useful.
>
> Exactly. Because HW could behave differently.

Right. But I think we've now established that what is described in the
device tree is the state the pins should be in after the function has
been called, eg. only the reduction matters, and any interim states
would just be a byproduct of storing the state in the configs list.

> > > And if it is possible
> > > to write DTS files that have states and sequence requirements,
> > > these should be caught in validation. Should be.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
