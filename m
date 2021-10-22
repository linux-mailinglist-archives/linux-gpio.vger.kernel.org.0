Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC274379E0
	for <lists+linux-gpio@lfdr.de>; Fri, 22 Oct 2021 17:25:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233427AbhJVP1l (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 Oct 2021 11:27:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233492AbhJVP1h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Oct 2021 11:27:37 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E9B5C061766;
        Fri, 22 Oct 2021 08:25:18 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id w14so4312145edv.11;
        Fri, 22 Oct 2021 08:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kgqxWvGntkbiXk1ztGJLZLwojodbAYgPdM6m7PSmewA=;
        b=WdVC29wguinmC3yuoVUr5ML6+H+CS6ZdeRR/YJeyz0O/ZQo45d8T9XdWhomfnjSVHd
         g3CJy6Nb9uiF/XGvjiN66mba5qCdBkqEstdLIlA5mrZYtzHVIJLvKck4OTuIxKhv+hy/
         dblks/vOB4eLhuwBr6oI5p/CXr+xSl6OSzKu3H43964vdf8hW3biLDa/NgCJHzsrjfGp
         6KAEky8qLzFsCHVc3KJTae2k/jIPB1myunH0C7WztFrMIMLZizaa7vIkPCMOoxpTma5Q
         pSB8OvYKauGBYkVQlMHML+/V0vENhcFHQ1rZeUbDd70KSH0cQMuoQIojhTt9Zl5QRC5l
         Td+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kgqxWvGntkbiXk1ztGJLZLwojodbAYgPdM6m7PSmewA=;
        b=ifoxJ4Tv7J5keVz4E3asRpV8ERcBbjjqSsBFedbMcs/tVOQFecXOxeZO33Y/J5DrwK
         EsfGVVE8uOpZlBwUFeGeV96eOhK4GcYibdi6p9TxBdvK2gP4d7i08/uAxUPqaR+2qDlh
         RkfNHynTQtUhqPX99eh4Msc57tVcjJSYIXWWQoNIX7Pm9DhV184uk3U6CKpmP7JBVDP/
         ZPqfCMX2dIAYK4EStkjNVZZH/pPhuW98dwWysi40itM/7WTu02qiXyxdD6OullnIk9OV
         +RatRlk/e4qzrVdcXaeTKGnndzVoyIgQpz4LRN1qbtRu9Fgsx7n3ENfdfkI7W18gmpYS
         FSew==
X-Gm-Message-State: AOAM532dZwIUHdGGH0WWIOK/2Vg28jNrhVqv6YlUAZsnERtwBO9iq5eW
        0OQQE5/k5qwru1Zfz2abPPJRF0Y4Quwt+PhePbg=
X-Google-Smtp-Source: ABdhPJwutL0TpkILUaJQpT9WTYSqqjzAMw3LFuNwxPeej7qk+YCVJ8tGy2Wz/Dne2ys3IkY8MRAys3VYHZ2n+YrKIm4=
X-Received: by 2002:a17:906:eb86:: with SMTP id mh6mr254287ejb.141.1634916316641;
 Fri, 22 Oct 2021 08:25:16 -0700 (PDT)
MIME-Version: 1.0
References: <20211021174223.43310-1-kernel@esmil.dk> <20211021174223.43310-10-kernel@esmil.dk>
 <CAHp75VcUv6WH0--FANpRExCdEOJNVo8KCtJ2Go090=FZq-Y0UQ@mail.gmail.com>
 <CANBLGcysKdqo+FioSkhd1PZRLzPF=fRJrCTsUGR7vXcn2WpYHg@mail.gmail.com>
 <CAHp75VditKnEcPKgqxz7NfG3ZWLZCu=pW=8qw7HS_iWePTj5Qw@mail.gmail.com>
 <CANBLGcyaSgbOgA4u_QivUQicyZ0MuUmrSsPq56OAANsav8R=VQ@mail.gmail.com>
 <CAHp75Vf=fGn33JFa-8UwCzv7A6AgHdnvfoabKnCcuKZxOyWX2Q@mail.gmail.com> <CANBLGcwZG-HpMuyw0LTGY2fwOJTgcMW7V_6kb=CFhX-Y5RjQSA@mail.gmail.com>
In-Reply-To: <CANBLGcwZG-HpMuyw0LTGY2fwOJTgcMW7V_6kb=CFhX-Y5RjQSA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 22 Oct 2021 18:24:20 +0300
Message-ID: <CAHp75VfwmSfeUPvUXT3TTf0ZYGMfBZ0qaPoB0_SCzyR=Fb_Emw@mail.gmail.com>
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

On Fri, Oct 22, 2021 at 5:56 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Fri, 22 Oct 2021 at 16:50, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Fri, Oct 22, 2021 at 5:25 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > On Fri, 22 Oct 2021 at 15:39, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > On Fri, Oct 22, 2021 at 4:35 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > > > On Fri, 22 Oct 2021 at 14:56, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > > > On Thu, Oct 21, 2021 at 8:43 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> > > > > > Why all these ugly % 32 against constants?
> > > > >
> > > > > Because the JH7100_RST_ values goes higher than 31. There is a
> > > > > BIT_MASK macro, but that does % BITS_PER_LONG and this is a 64bit
> > > > > machine.
> > > >
> > > > And? It's exactly what you have to use!
> > >
> > > So you want me to use an unsigned long array or DECLARE_BITMAP and
> > > juggle two different index and bit offsets?
> >
> > What are the offsets of those status registers?
> > AFAICS they are sequential 4 32-bit registers.
>
> That's right, but we're on a 64bit machine, so DECLARE_BITMAP will
> give us an unsigned long array that doesn't match that.

I didn't get it, sorry.
You will have a bitmap array which you will split to 32-bit values.
What you will probably need is to move  xgpio_get_value32() and void
xgpio_set_value32() to the one of bitmap related headers (look for
bitmap_get_value8() and friends).

> > So bitmap is exactly what is suitable here, you are right!
> > See gpio-xilinx and gpio-pca953x on how to use bitmaps in the GPIO drivers.
>
> None of them has a pre-initialized const DECLARE_BITMAP, so they don't
> have to deal with the 4 vs. 2 commas problem.

I believe it's well possible to refactor this to look much better with
bitmaps (as it represents the hardware very well).

> > > Also is there a macro for handling that we'd then need 4 commas on
> > > 32bit COMPILE_TEST and 2 commas on 64bit?
> > > If you have some other way in mind you'll have to be a lot more explicit again.
> > >
> > > The point of the jh7100_reset_asserted array is that it exactly
> > > mirrors the values of the status registers when the lines are
> > > asserted. Maybe writing it like this would be more explicit:
> > >
> > > static const u32 jh7100_reset_asserted[4] = {
> > >         /* STATUS0 register */
> > >         BIT(JH7100_RST_U74 % 32) |
> > >         BIT(JH7100_RST_VP6_DRESET % 32) |
> > >         BIT(JH7100_RST_VP6_BRESET % 32),
> > >         /* STATUS1 register */
> > >         BIT(JH7100_RST_HIFI4_DRESET % 32) |
> > >         BIT(JH7100_RST_HIFI4_BRESET % 32),
> > >         /* STATUS2 register */
> > >         BIT(JH7100_RST_E24 % 32),
> > >         /* STATUS3 register */
> > >         0,
> > > };

-- 
With Best Regards,
Andy Shevchenko
