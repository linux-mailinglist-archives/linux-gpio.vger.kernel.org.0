Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FD5C437A15
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Oct 2021 17:37:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233557AbhJVPiz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Oct 2021 11:38:55 -0400
Received: from mail-pl1-f170.google.com ([209.85.214.170]:38638 "EHLO
        mail-pl1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233354AbhJVPiv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Oct 2021 11:38:51 -0400
Received: by mail-pl1-f170.google.com with SMTP id i5so2951767pla.5;
        Fri, 22 Oct 2021 08:36:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uc+CptoK4CgF4ldWzulgeZP99XuQqA9dacbA2WJ+66A=;
        b=kpO8SLR2FFeulrrm3oR7iGjZmB/8/VvE1SgNtwJmYqna5pU8+CWv84W5T9soT7NClO
         ZZAaLoByALm+owp9SQsk0Hi1qOJgDUpw8nVaDhJ69imyrUK1IVBMnp+doc2rvW8BDp4H
         ipjaLNy/N+zNnzpvVWpMGhc4bYdp94tQdfrAhglTBsFpTWTCT53HCLKRL8hYVHQjy7Jz
         iAMcdgrPRQuELyew8YdpYe6c9z8VFGUVz+llLOmU6wyhDgb6QLUkoh2u0yVFHe5fQmyx
         xW/qvSEg1rIuJ6qURD5YAdr/azuMtBZyXdH7qB6X+oqgWVECfr2MkPgtBALP8pZEoQ3G
         4BVA==
X-Gm-Message-State: AOAM533eN4sisD98ugLXN7ulwaESboddTaxZFtStJiZEVHWChlZCU/LV
        2MnhgD++JDQSZDCe4FNNXTRIdaLDvtq66X1lqXU=
X-Google-Smtp-Source: ABdhPJwHDTxa4dCWQm1cgcpbHpLrGKYplB+GwvTwZZOODB2ZaW4AXitDmRyAhOnm9r5bKQ+Czw+ekExtq8CteP1Wahw=
X-Received: by 2002:a17:902:b102:b0:134:a329:c2f8 with SMTP id
 q2-20020a170902b10200b00134a329c2f8mr505153plr.71.1634916992946; Fri, 22 Oct
 2021 08:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-10-kernel@esmil.dk>
 <CAHp75VcUv6WH0--FANpRExCdEOJNVo8KCtJ2Go090=FZq-Y0UQ@mail.gmail.com>
 <CANBLGcysKdqo+FioSkhd1PZRLzPF=fRJrCTsUGR7vXcn2WpYHg@mail.gmail.com>
 <CAHp75VditKnEcPKgqxz7NfG3ZWLZCu=pW=8qw7HS_iWePTj5Qw@mail.gmail.com>
 <CANBLGcyaSgbOgA4u_QivUQicyZ0MuUmrSsPq56OAANsav8R=VQ@mail.gmail.com>
 <CAHp75Vf=fGn33JFa-8UwCzv7A6AgHdnvfoabKnCcuKZxOyWX2Q@mail.gmail.com>
 <CANBLGcwZG-HpMuyw0LTGY2fwOJTgcMW7V_6kb=CFhX-Y5RjQSA@mail.gmail.com> <CAHp75VfwmSfeUPvUXT3TTf0ZYGMfBZ0qaPoB0_SCzyR=Fb_Emw@mail.gmail.com>
In-Reply-To: <CAHp75VfwmSfeUPvUXT3TTf0ZYGMfBZ0qaPoB0_SCzyR=Fb_Emw@mail.gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Fri, 22 Oct 2021 17:36:21 +0200
Message-ID: <CANBLGcwz7s5OJer-37mQC2r_H0trec04S69ovYdU2_LbiVrtYw@mail.gmail.com>
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

On Fri, 22 Oct 2021 at 17:25, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Fri, Oct 22, 2021 at 5:56 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > On Fri, 22 Oct 2021 at 16:50, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > On Fri, Oct 22, 2021 at 5:25 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > > On Fri, 22 Oct 2021 at 15:39, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > > On Fri, Oct 22, 2021 at 4:35 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > > > > On Fri, 22 Oct 2021 at 14:56, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > > > > On Thu, Oct 21, 2021 at 8:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> ...
>
> > > > > > > Why all these ugly % 32 against constants?
> > > > > >
> > > > > > Because the JH7100_RST_ values goes higher than 31. There is a
> > > > > > BIT_MASK macro, but that does % BITS_PER_LONG and this is a 64bit
> > > > > > machine.
> > > > >
> > > > > And? It's exactly what you have to use!
> > > >
> > > > So you want me to use an unsigned long array or DECLARE_BITMAP and
> > > > juggle two different index and bit offsets?
> > >
> > > What are the offsets of those status registers?
> > > AFAICS they are sequential 4 32-bit registers.
> >
> > That's right, but we're on a 64bit machine, so DECLARE_BITMAP will
> > give us an unsigned long array that doesn't match that.
>
> I didn't get it, sorry.
> You will have a bitmap array which you will split to 32-bit values.
> What you will probably need is to move  xgpio_get_value32() and void
> xgpio_set_value32() to the one of bitmap related headers (look for
> bitmap_get_value8() and friends).
>
> > > So bitmap is exactly what is suitable here, you are right!
> > > See gpio-xilinx and gpio-pca953x on how to use bitmaps in the GPIO drivers.
> >
> > None of them has a pre-initialized const DECLARE_BITMAP, so they don't
> > have to deal with the 4 vs. 2 commas problem.
>
> I believe it's well possible to refactor this to look much better with
> bitmaps (as it represents the hardware very well).

Right, but how exactly? This works on on 64bit, but not with 32bit COMPILE_TEST:

static const DECLARE_BITMAP(jh7100_reset_asserted, JH7100_RSTN_END) = {
        /* STATUS0 register */
        BIT_MASK(JH7100_RST_U74) |
        BIT_MASK(JH7100_RST_VP6_DRESET) |
        BIT_MASK(JH7100_RST_VP6_BRESET) |
        /* STATUS1 register */
        BIT_MASK(JH7100_RST_HIFI4_DRESET) |
        BIT_MASK(JH7100_RST_HIFI4_BRESET),
        /* STATUS2 register */
        BIT_MASK(JH7100_RST_E24) |
        /* STATUS3 register */
        0,
};


> > > > Also is there a macro for handling that we'd then need 4 commas on
> > > > 32bit COMPILE_TEST and 2 commas on 64bit?
> > > > If you have some other way in mind you'll have to be a lot more explicit again.
> > > >
> > > > The point of the jh7100_reset_asserted array is that it exactly
> > > > mirrors the values of the status registers when the lines are
> > > > asserted. Maybe writing it like this would be more explicit:
> > > >
> > > > static const u32 jh7100_reset_asserted[4] = {
> > > >         /* STATUS0 register */
> > > >         BIT(JH7100_RST_U74 % 32) |
> > > >         BIT(JH7100_RST_VP6_DRESET % 32) |
> > > >         BIT(JH7100_RST_VP6_BRESET % 32),
> > > >         /* STATUS1 register */
> > > >         BIT(JH7100_RST_HIFI4_DRESET % 32) |
> > > >         BIT(JH7100_RST_HIFI4_BRESET % 32),
> > > >         /* STATUS2 register */
> > > >         BIT(JH7100_RST_E24 % 32),
> > > >         /* STATUS3 register */
> > > >         0,
> > > > };
>
> --
> With Best Regards,
> Andy Shevchenko
