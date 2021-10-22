Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB85A437A86
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Oct 2021 18:00:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233577AbhJVQCK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Oct 2021 12:02:10 -0400
Received: from mail-pg1-f182.google.com ([209.85.215.182]:40452 "EHLO
        mail-pg1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233539AbhJVQCD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Oct 2021 12:02:03 -0400
Received: by mail-pg1-f182.google.com with SMTP id q5so3703244pgr.7;
        Fri, 22 Oct 2021 08:59:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ve3WMv+ekDk2TdI4V72WJsoDE4qRPggIm2D4MYgIa/s=;
        b=YoSiSqNcsi/ce2Uu1fcFeaqpii6hTMjVDm7gJVw9xDH7AdC8PIx4gZ6uPuL7xRMfKC
         54vOTvPfjthY2XSwrFXUfAZ2vUmPFxcdmIjrVK9CB27pMhIzll+qEDfnDQXo0s/LiDVf
         dWF8W7ei5gGRo647Wr5c6gl5mtJtGFEoXxxy8I01BTGmgrqSaevViH5qTX9xyNlbam7d
         jERbu6pqN3qPhlmXHpFpLvtQmdhKZJ7K4Xyx36X/iWI8B0kd/8j/TebiebSz9ztK3k5i
         8REQfczYggfpmdnmJptxwh77Sesn5dLd6oDTEceHOpqJAhKrDemxDA0/Hs/W3CJl4d3m
         uGwg==
X-Gm-Message-State: AOAM532FBU6tFdSW+DWL7GGC++DXZ0CowbtFTlczbdBiSIOgY3GHbEGa
        d7+gGptSPuK9PthIGgoSDNCFIkrkN41OTYu6xCQ=
X-Google-Smtp-Source: ABdhPJytmeUKXJ3sdL/RoZcFfoUxkwHNf715Lzot8ru5O13Qs3evLOYJia2m3U02KPExB+40zvfLAu1iZcMn5ibdDp4=
X-Received: by 2002:a63:2d46:: with SMTP id t67mr414276pgt.15.1634918385517;
 Fri, 22 Oct 2021 08:59:45 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-10-kernel@esmil.dk>
 <CAHp75VcUv6WH0--FANpRExCdEOJNVo8KCtJ2Go090=FZq-Y0UQ@mail.gmail.com>
 <CANBLGcysKdqo+FioSkhd1PZRLzPF=fRJrCTsUGR7vXcn2WpYHg@mail.gmail.com>
 <CAHp75VditKnEcPKgqxz7NfG3ZWLZCu=pW=8qw7HS_iWePTj5Qw@mail.gmail.com>
 <CANBLGcyaSgbOgA4u_QivUQicyZ0MuUmrSsPq56OAANsav8R=VQ@mail.gmail.com>
 <CAHp75Vf=fGn33JFa-8UwCzv7A6AgHdnvfoabKnCcuKZxOyWX2Q@mail.gmail.com>
 <CANBLGcwZG-HpMuyw0LTGY2fwOJTgcMW7V_6kb=CFhX-Y5RjQSA@mail.gmail.com>
 <CAHp75VfwmSfeUPvUXT3TTf0ZYGMfBZ0qaPoB0_SCzyR=Fb_Emw@mail.gmail.com>
 <CANBLGcwz7s5OJer-37mQC2r_H0trec04S69ovYdU2_LbiVrtYw@mail.gmail.com> <YXLenBb21jTZlGu0@smile.fi.intel.com>
In-Reply-To: <YXLenBb21jTZlGu0@smile.fi.intel.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Fri, 22 Oct 2021 17:59:34 +0200
Message-ID: <CANBLGcyOiOCeSg0ZHxHjOcpHT9HQ0X3_8Ovff4u2qOnB7BWOsw@mail.gmail.com>
Subject: Re: [PATCH v2 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
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

On Fri, 22 Oct 2021 at 17:55, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Fri, Oct 22, 2021 at 05:36:21PM +0200, Emil Renner Berthing wrote:
> > On Fri, 22 Oct 2021 at 17:25, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > On Fri, Oct 22, 2021 at 5:56 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > > On Fri, 22 Oct 2021 at 16:50, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > > On Fri, Oct 22, 2021 at 5:25 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> ...
>
> > > > > AFAICS they are sequential 4 32-bit registers.
> > > >
> > > > That's right, but we're on a 64bit machine, so DECLARE_BITMAP will
> > > > give us an unsigned long array that doesn't match that.
> > >
> > > I didn't get it, sorry.
> > > You will have a bitmap array which you will split to 32-bit values.
> > > What you will probably need is to move  xgpio_get_value32() and void
> > > xgpio_set_value32() to the one of bitmap related headers (look for
> > > bitmap_get_value8() and friends).
> > >
> > > > > So bitmap is exactly what is suitable here, you are right!
> > > > > See gpio-xilinx and gpio-pca953x on how to use bitmaps in the GPIO drivers.
> > > >
> > > > None of them has a pre-initialized const DECLARE_BITMAP, so they don't
> > > > have to deal with the 4 vs. 2 commas problem.
> > >
> > > I believe it's well possible to refactor this to look much better with
> > > bitmaps (as it represents the hardware very well).
> >
> > Right, but how exactly? This works on on 64bit, but not with 32bit COMPILE_TEST:
> >
> > static const DECLARE_BITMAP(jh7100_reset_asserted, JH7100_RSTN_END) = {
> >         /* STATUS0 register */
> >         BIT_MASK(JH7100_RST_U74) |
> >         BIT_MASK(JH7100_RST_VP6_DRESET) |
> >         BIT_MASK(JH7100_RST_VP6_BRESET) |
> >         /* STATUS1 register */
> >         BIT_MASK(JH7100_RST_HIFI4_DRESET) |
> >         BIT_MASK(JH7100_RST_HIFI4_BRESET),
> >         /* STATUS2 register */
> >         BIT_MASK(JH7100_RST_E24) |
> >         /* STATUS3 register */
> >         0,
> > };
>
> BITMAP_FROM_U64() ?

So you think this is better?

static const DECLARE_BITMAP(jh7100_reset_asserted, JH7100_RSTN_END) = {
        BITMAP_FROM_U64(
                /* STATUS0 register */
                BIT_MASK(JH7100_RST_U74) |
                BIT_MASK(JH7100_RST_VP6_DRESET) |
                BIT_MASK(JH7100_RST_VP6_BRESET) |
                /* STATUS1 register */
                BIT_MASK(JH7100_RST_HIFI4_DRESET) |
                BIT_MASK(JH7100_RST_HIFI4_BRESET)
        ),
        BITMAP_FROM_U64(
                /* STATUS2 register */
                BIT_MASK(JH7100_RST_E24) |
                /* STATUS3 register */
                0
        ),
};

> > > > > > Also is there a macro for handling that we'd then need 4 commas on
> > > > > > 32bit COMPILE_TEST and 2 commas on 64bit?
> > > > > > If you have some other way in mind you'll have to be a lot more explicit again.
> > > > > >
> > > > > > The point of the jh7100_reset_asserted array is that it exactly
> > > > > > mirrors the values of the status registers when the lines are
> > > > > > asserted.
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
