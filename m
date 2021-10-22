Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB55437957
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Oct 2021 16:50:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233073AbhJVOw1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Oct 2021 10:52:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233102AbhJVOwT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Oct 2021 10:52:19 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8E9EC061348;
        Fri, 22 Oct 2021 07:50:01 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id u13so692468edy.10;
        Fri, 22 Oct 2021 07:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=va1CWMK0fvoaygUpYfBZZ7pMG5xay62hu0qP41q24WM=;
        b=CKeP7lytVF2WkjwAJ3hD8Kd6INjvDsFkxaVTxTc8yC/7vZCj1kMaef78g39jBHveY+
         S+AGNMDTKcU/WRpAh0Z2ezSX5BpxMM7ezZvxscn6c1tKQcNK1eM5hsI9Ym32DKcjSVQy
         dphH8+5XgSNA/4PxM217K/JrdtmTdIWlDR4lpZCKYpWMvk04aAkFE27YxQv9I7wpTwGu
         +q1Xew6H4P5lAszpRgfOgkUcckJJHk5qjCC5URaGmUHDjoj7e7aa0VJIJorxpXeC+pKc
         ApBzBILqxGdG03VcdSzpLItUi9rXzigsB3cagUGHuIR2Cj/c5ZIe1LGEPMLaX3tDPefr
         wCSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=va1CWMK0fvoaygUpYfBZZ7pMG5xay62hu0qP41q24WM=;
        b=iSgam4pTZpiH9HfX3DXWrxDd192PSftx9NXiYJfprGN2sMy6/hkadYWnvzth8GuXnn
         YbG0RWOIds0ydHUzRsc2sLzAZh5vQlZycNoem477861iSt8559/LZQbeTr17Zgb/p4qx
         zttzDt65eAniM98O2D4z1fPfb9xgtks5GHqtprVgFBSyYK/ftTY6sGYSELnL/j+nBazE
         sWQv2cnB3h8A7ET+5V9j4qSeK/xK8lFkpavoctHbVIDmJtggddOZQt9KzNDbX63T7PnK
         7MJ0rbOaL05RNbsOuCREEva3BHyUU6S+XRVFibJjRB9NlUpGzMzE97SQoLeXl9O8JGLt
         yB4A==
X-Gm-Message-State: AOAM532klJj0JaVM8wtBqppUrBSo2zESWKmAkFF03pB9TCx6GNCPJIQI
        6BqsCqHHQVJMT3JKZty63hLRDs2WSUtOT7ZPiNA=
X-Google-Smtp-Source: ABdhPJwOiHEsJ4IhKG97eFe3EyClQ4TryP+4xHxPKxWKTF6bELZAON/Gz0kQqsRsMvFmZwAxe1wY02W2uX56jXYO0tk=
X-Received: by 2002:a17:906:a158:: with SMTP id bu24mr58564ejb.356.1634914200398;
 Fri, 22 Oct 2021 07:50:00 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-10-kernel@esmil.dk>
 <CAHp75VcUv6WH0--FANpRExCdEOJNVo8KCtJ2Go090=FZq-Y0UQ@mail.gmail.com>
 <CANBLGcysKdqo+FioSkhd1PZRLzPF=fRJrCTsUGR7vXcn2WpYHg@mail.gmail.com>
 <CAHp75VditKnEcPKgqxz7NfG3ZWLZCu=pW=8qw7HS_iWePTj5Qw@mail.gmail.com> <CANBLGcyaSgbOgA4u_QivUQicyZ0MuUmrSsPq56OAANsav8R=VQ@mail.gmail.com>
In-Reply-To: <CANBLGcyaSgbOgA4u_QivUQicyZ0MuUmrSsPq56OAANsav8R=VQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 22 Oct 2021 17:49:04 +0300
Message-ID: <CAHp75Vf=fGn33JFa-8UwCzv7A6AgHdnvfoabKnCcuKZxOyWX2Q@mail.gmail.com>
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

On Fri, Oct 22, 2021 at 5:25 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Fri, 22 Oct 2021 at 15:39, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Fri, Oct 22, 2021 at 4:35 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > On Fri, 22 Oct 2021 at 14:56, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > On Thu, Oct 21, 2021 at 8:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> > > > Why all these ugly % 32 against constants?
> > >
> > > Because the JH7100_RST_ values goes higher than 31. There is a
> > > BIT_MASK macro, but that does % BITS_PER_LONG and this is a 64bit
> > > machine.
> >
> > And? It's exactly what you have to use!
>
> So you want me to use an unsigned long array or DECLARE_BITMAP and
> juggle two different index and bit offsets?

What are the offsets of those status registers?
AFAICS they are sequential 4 32-bit registers.

So bitmap is exactly what is suitable here, you are right!
See gpio-xilinx and gpio-pca953x on how to use bitmaps in the GPIO drivers.

> Also is there a macro for handling that we'd then need 4 commas on
> 32bit COMPILE_TEST and 2 commas on 64bit?
> If you have some other way in mind you'll have to be a lot more explicit again.
>
> The point of the jh7100_reset_asserted array is that it exactly
> mirrors the values of the status registers when the lines are
> asserted. Maybe writing it like this would be more explicit:
>
> static const u32 jh7100_reset_asserted[4] = {
>         /* STATUS0 register */
>         BIT(JH7100_RST_U74 % 32) |
>         BIT(JH7100_RST_VP6_DRESET % 32) |
>         BIT(JH7100_RST_VP6_BRESET % 32),
>         /* STATUS1 register */
>         BIT(JH7100_RST_HIFI4_DRESET % 32) |
>         BIT(JH7100_RST_HIFI4_BRESET % 32),
>         /* STATUS2 register */
>         BIT(JH7100_RST_E24 % 32),
>         /* STATUS3 register */
>         0,
> };

--
With Best Regards,
Andy Shevchenko
