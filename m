Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15B2944B46F
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 22:04:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244871AbhKIVHW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 16:07:22 -0500
Received: from mail-pf1-f182.google.com ([209.85.210.182]:37585 "EHLO
        mail-pf1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244853AbhKIVHV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Nov 2021 16:07:21 -0500
Received: by mail-pf1-f182.google.com with SMTP id y5so563779pfb.4;
        Tue, 09 Nov 2021 13:04:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E8Y2jyNg7h9soMk4rEm6rzTo1BjlaELOxyIkvTVeIKc=;
        b=qFzg41KmFXXKxf0e7AIwCA80Vj91V/b5yxTOjkUyLj5g3HujBNOJ7qrqd9N4Mwa/P6
         Sfl4ATULDY2ywqS3ruJg80zTSHpWY+zb9UQJHt9dZcQYnLqvb0dXt2mclUIlsiLZQnaV
         vpBioGPkcymA/Ri3sCrAlRn2ZtIKOWZLVgqHuXnDtZ00y1DKMg72Uea8lMEFLivX/r8r
         skk6f/aqTmMGnO0XocjxfLvBrD26RTW9NVGyGIaXbx5VfqMHEQukO8CGEbBUeoprVB4B
         6M8YuUDbHJK5Yc0SNtY0OQt/eMN8VvyubtqwmF3xoltLU/GBmcMOrJ2TjZLYqJvEYcgf
         UCXg==
X-Gm-Message-State: AOAM530BGgMaRBQAP2cGf2AjT2BkjSOVO9gELRy1PUJFVIlumTA8KId7
        /ajj9eER+M1Szon1rqPIXnQN+ZeMNAy0fTh2z6g=
X-Google-Smtp-Source: ABdhPJz1YJYHQflXJx0Bc84bAu1eZK8Iidi5ru1YEkbahK+1/iI8yZB/R/hQC6b2vi+cWBbhfBoFSTKZxNwGdzS5FHg=
X-Received: by 2002:aa7:8883:0:b0:49f:f87a:95de with SMTP id
 z3-20020aa78883000000b0049ff87a95demr9062124pfe.53.1636491875224; Tue, 09 Nov
 2021 13:04:35 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk> <20211102161125.1144023-13-kernel@esmil.dk>
 <CAHp75VdmnnrisuP00W0KYta0KgmC+fu3WMxm959dt5X1kpiKTw@mail.gmail.com>
 <CAHp75VcuGdaq_TjjRS0S8R5y-nryLABZSp7ehrXz-fUS2W3vfA@mail.gmail.com>
 <CACRpkdYe-tW2K2eOQa+FYb-ZXzrA95+pPc6kkLB8ZJLAT8G_eA@mail.gmail.com>
 <CANBLGcyo3YjygkjDmdjt4C_H=MZdHQwqumsxnatuObeP2LADAg@mail.gmail.com>
 <CAHp75VdBaKZVeA7dasHWP4E3c8F2phaGz-90FErj3bB8FJOS9w@mail.gmail.com>
 <CANBLGcw7X9SY3_=A7ZXW60646vconjCbYBsvb=D2a0BPcyn75A@mail.gmail.com> <CACRpkda7b+j1=X9rUrqwEFhxvp2zVTvFkxanjh3hL7AksqCX1g@mail.gmail.com>
In-Reply-To: <CACRpkda7b+j1=X9rUrqwEFhxvp2zVTvFkxanjh3hL7AksqCX1g@mail.gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Tue, 9 Nov 2021 22:04:24 +0100
Message-ID: <CANBLGcxT_a3J+uaaKazRkfJQoBjGGGiz9agAZUzMEmfJiVXXbw@mail.gmail.com>
Subject: Re: [PATCH v3 12/16] pinctrl: starfive: Add pinctrl driver for
 StarFive SoCs
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
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

On Tue, 9 Nov 2021 at 21:29, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Tue, Nov 9, 2021 at 10:40 AM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > On Tue, 9 Nov 2021 at 10:34, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
> > > > The order the different states are blinked depends entirely on
> > > > how the pinctrl framework parses the device tree. I still think it
> > > > would be more natural to cleanly go to the end result without this
> > > > blinking.
> >
> > Hmm.. but if going through the different states is what you want, then
> > wouldn't you need the device tree to have an ordered list of the
> > states rather than just a single node and also a way to tune how long
> > time the different states are blinked?
>
> In a way you are correct that the DT is a functional language and it's
> a bit lite a style sheet or prolog or something in that the end reduction
> is what counts.
>
> In this case, I would say something is weird if there are interim states,
> the yaml validation should not allow you to set the same thing back
> and forth in your DTS file.

Yes, exactly.

> Alas we are not perfect as in yaml validation isn't perfect either.
> I can't see what the problem is really, just write proper DTS files
> and there will not be any interim states, right?

No, I agree. I think it's only that Andy wasn't sure if these interim
states might be meaningful/useful.

> And if it is possible
> to write DTS files that have states and sequence requirements,
> these should be caught in validation. Should be.
>
> Yours,
> Linus Walleij
