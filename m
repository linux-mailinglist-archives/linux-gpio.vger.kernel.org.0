Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C09CB43796D
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Oct 2021 16:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233132AbhJVO7Q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Oct 2021 10:59:16 -0400
Received: from mail-pl1-f177.google.com ([209.85.214.177]:46955 "EHLO
        mail-pl1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233102AbhJVO7P (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Oct 2021 10:59:15 -0400
Received: by mail-pl1-f177.google.com with SMTP id i1so2840164plr.13;
        Fri, 22 Oct 2021 07:56:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bP/PBZ5dE4p5HX2+QicYK3rA0pH5Cba6d4G9S+AUf1E=;
        b=Je9zJuspXn4Spq26r2VAWVcdx4rDKm1V5uKeXekx6DwyqvfgYcec088ZUaBmSesZsc
         6L2gNIKufUPe+Aj6VIncal8qM9ILX1o6Xqz2u4Tro3NOiybYPgi/KtuhjhSsw736vKwL
         xD8KtICfSDOvFXLOcnds0lsJCilAL6cEDG7PpWNyTFjHrowaVpP1qU8WQQPiw+jOOAPj
         AoYYMXZbKqX+qgqgvai8fHPvzKliRt5bEK1FL2sQP+V8Y3nyxKx5xPqbmMDnaJRF9Toh
         uehjGN6retNIFXMS87SUzVljhb/aoVbBZPzpktSsMAoLpVRPsSEw/3J/Lcn/VZh7UodN
         ILQw==
X-Gm-Message-State: AOAM533YbKZARQ+UCOgfqxeGHwrbL0xtfjeFmhejhsyFk+HM8IHtsfLp
        1fX1HAerJgkpBnAm3guHc8rQMjVLnRpHycPZwpA=
X-Google-Smtp-Source: ABdhPJwB+UUuFlxzIiKUXd5KRD9w1J7GsVmq0SJSBFy8jKVC7XgO/aG+zbPd6g7s+pWXzJt2gXXzIfD/CsG7XKZCsEc=
X-Received: by 2002:a17:902:7783:b0:13d:fee6:8095 with SMTP id
 o3-20020a170902778300b0013dfee68095mr453870pll.7.1634914616930; Fri, 22 Oct
 2021 07:56:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-10-kernel@esmil.dk>
 <CAHp75VcUv6WH0--FANpRExCdEOJNVo8KCtJ2Go090=FZq-Y0UQ@mail.gmail.com>
 <CANBLGcysKdqo+FioSkhd1PZRLzPF=fRJrCTsUGR7vXcn2WpYHg@mail.gmail.com>
 <CAHp75VditKnEcPKgqxz7NfG3ZWLZCu=pW=8qw7HS_iWePTj5Qw@mail.gmail.com>
 <CANBLGcyaSgbOgA4u_QivUQicyZ0MuUmrSsPq56OAANsav8R=VQ@mail.gmail.com> <CAHp75Vf=fGn33JFa-8UwCzv7A6AgHdnvfoabKnCcuKZxOyWX2Q@mail.gmail.com>
In-Reply-To: <CAHp75Vf=fGn33JFa-8UwCzv7A6AgHdnvfoabKnCcuKZxOyWX2Q@mail.gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Fri, 22 Oct 2021 16:56:45 +0200
Message-ID: <CANBLGcwZG-HpMuyw0LTGY2fwOJTgcMW7V_6kb=CFhX-Y5RjQSA@mail.gmail.com>
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

On Fri, 22 Oct 2021 at 16:50, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> On Fri, Oct 22, 2021 at 5:25 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > On Fri, 22 Oct 2021 at 15:39, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > On Fri, Oct 22, 2021 at 4:35 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > > On Fri, 22 Oct 2021 at 14:56, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > > On Thu, Oct 21, 2021 at 8:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> ...
>
> > > > > Why all these ugly % 32 against constants?
> > > >
> > > > Because the JH7100_RST_ values goes higher than 31. There is a
> > > > BIT_MASK macro, but that does % BITS_PER_LONG and this is a 64bit
> > > > machine.
> > >
> > > And? It's exactly what you have to use!
> >
> > So you want me to use an unsigned long array or DECLARE_BITMAP and
> > juggle two different index and bit offsets?
>
> What are the offsets of those status registers?
> AFAICS they are sequential 4 32-bit registers.

That's right, but we're on a 64bit machine, so DECLARE_BITMAP will
give us an unsigned long array that doesn't match that.

> So bitmap is exactly what is suitable here, you are right!
> See gpio-xilinx and gpio-pca953x on how to use bitmaps in the GPIO drivers.

None of them has a pre-initialized const DECLARE_BITMAP, so they don't
have to deal with the 4 vs. 2 commas problem.

> > Also is there a macro for handling that we'd then need 4 commas on
> > 32bit COMPILE_TEST and 2 commas on 64bit?
> > If you have some other way in mind you'll have to be a lot more explicit again.
> >
> > The point of the jh7100_reset_asserted array is that it exactly
> > mirrors the values of the status registers when the lines are
> > asserted. Maybe writing it like this would be more explicit:
> >
> > static const u32 jh7100_reset_asserted[4] = {
> >         /* STATUS0 register */
> >         BIT(JH7100_RST_U74 % 32) |
> >         BIT(JH7100_RST_VP6_DRESET % 32) |
> >         BIT(JH7100_RST_VP6_BRESET % 32),
> >         /* STATUS1 register */
> >         BIT(JH7100_RST_HIFI4_DRESET % 32) |
> >         BIT(JH7100_RST_HIFI4_BRESET % 32),
> >         /* STATUS2 register */
> >         BIT(JH7100_RST_E24 % 32),
> >         /* STATUS3 register */
> >         0,
> > };
>
> --
> With Best Regards,
> Andy Shevchenko
