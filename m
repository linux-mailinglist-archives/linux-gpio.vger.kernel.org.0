Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6CA22443784
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 21:56:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230409AbhKBU6o (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 16:58:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbhKBU6o (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 16:58:44 -0400
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C58A7C061714;
        Tue,  2 Nov 2021 13:56:08 -0700 (PDT)
Received: by mail-io1-xd2c.google.com with SMTP id 62so299659iou.2;
        Tue, 02 Nov 2021 13:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5qpSO8WUXhUCrAbZgUnrOJ4l2/cOqHIYTb/IBBg9XxU=;
        b=dYUO/tLaVyPYDeinS3Bci5Y1zgmTYCUUBGwfkUhxhDm6S9KkOcjK8bQl8oEHcC2+ZX
         ET9FkdT7791SO9/NU5VVw7pDfz5Py4ns2fGH+RQKLK4WXEpiLrDGZQbUag5qOjeVJKdY
         +pIl+QoR4ENH464VRVxn01fSLd736ql860MiHqgRzfncsvfHfzNu1+XYXeBycbs4XZfz
         G0Wy2ujTD540hiNf7cB8mwTGkmyEvPXrx8rfK7DEWnDaLkER/vtNYV9X6SzvBm8uVl5E
         BswK0OIp3Q7KrKTqFH6gjVo3aeGhuDeVApKzvZsbq8E7fMjDoAE4DPYmAF5NXblXxw6r
         HCww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5qpSO8WUXhUCrAbZgUnrOJ4l2/cOqHIYTb/IBBg9XxU=;
        b=j1jy2JcuVgV2onzrsKQWsUqiszZfS8Ci4XXTdfQJb9/HOv0oY58xOyZQnMuyIhWyMA
         ZSGMCmoxAOoY+6WqUMNx4SWAKnkLmkARSDKMxX22i+venQepnD4hD7qv1HgeKp6I3GAN
         5/Ac1vZTgfmolPAubv2cQKrcopEADY6LpnZuH2+OZRzrWSqsD88sFys8H/us4MU7VY2G
         dOPk0EoFEv+OqE9JRFarXbLaGKKoogMMIJxlT0AOLbOqmnUD0zBDa0Ge2HkLHoiRYCI4
         ZQcZ2FhRycScTTB1sOdt0WMAXwlDA6vh3oHlDCeysClsaSFfLZRcR/UZyJtV4bSmW1yr
         6KTg==
X-Gm-Message-State: AOAM5305MNuJ3cYSWNVY1OKTNi6Jt9PuVfKk9V0nz5JzhnaxMje2Rc1l
        t9N4W2++TayBA7NpJsHMFUHvgDc7J/vK//Rhdi0=
X-Google-Smtp-Source: ABdhPJygmuBb5+o5lPg7eND5Rtx8YFYElghK2rfOTJ0tMJEFEttP6v8+0uhDe+ZA+pt6kb9Y/WP9MaRcaSIw1/qaGCU=
X-Received: by 2002:a02:6064:: with SMTP id d36mr29827629jaf.80.1635886568112;
 Tue, 02 Nov 2021 13:56:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk> <20211102161125.1144023-10-kernel@esmil.dk>
 <CAHp75Ve-P8DR00mtRP_NkrXgB4nsZ+qBkgBen94iTcPqxQYUOg@mail.gmail.com> <CANBLGcyb=TAP0h2WuxBAjRvpN9n7Dt1Hvh5yE8NMOwm3ixZWuA@mail.gmail.com>
In-Reply-To: <CANBLGcyb=TAP0h2WuxBAjRvpN9n7Dt1Hvh5yE8NMOwm3ixZWuA@mail.gmail.com>
From:   Yury Norov <yury.norov@gmail.com>
Date:   Tue, 2 Nov 2021 13:55:53 -0700
Message-ID: <CAAH8bW-J6Ai+KZFkZ4ELOzD-u7BceZrBqwnCuPH6F-fNQNm3XQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
To:     Emil Renner Berthing <kernel@esmil.dk>
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

On Tue, Nov 2, 2021 at 12:59 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
>
> On Tue, 2 Nov 2021 at 20:43, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > +Cc: Yury (bitmap expert)
> >
> > On Tue, Nov 2, 2021 at 6:50 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > >
> > > Add a driver for the StarFive JH7100 reset controller.
> >
> > ...
> >
> > > +#define BIT_MASK32(x) BIT((x) % 32)
> >
> > Possible namespace collision.
> >
> > ...
> >
> > > +/*
> > > + * the registers work like a 32bit bitmap, so writing a 1 to the m'th bit of
> > > + * the n'th ASSERT register asserts line 32n + m, and writing a 0 deasserts the
> > > + * same line.

We don't have 32-bit bitmaps. Bitmaps are always arrays of unsigned longs. On a
64-bit system this '32-bit bitmap' may be broken due to endianness issues.

> > > + * most reset lines have their status inverted so a 0 in the STATUS register
> > > + * means the line is asserted and a 1 means it's deasserted. a few lines don't
> > > + * though, so store the expected value of the status registers when all lines
> > > + * are asserted.
> > > + */
> >
> > Besides missing capitalization,
>
> I'm confused. it was you who wanted all comments to capitalized the same..
> 64bi
> if it sounds like bitmap, use bitmap.
> > I have checked DT definitions and it seems you don't even need the
> > BIT_MASK() macro,
> >
> > > +static const u32 jh7100_reset_asserted[4] = {
> > > +       /* STATUS0 register */
> > > +       BIT_MASK32(JH7100_RST_U74) |

I think we have no BIT_MASK32() for a good reason. Natural alignment is
always preferable.

> > > +       BIT_MASK32(JH7100_RST_VP6_DRESET) |
> > > +       BIT_MASK32(JH7100_RST_VP6_BRESET),
> > > +       /* STATUS1 register */
> > > +       BIT_MASK32(JH7100_RST_HIFI4_DRESET) |
> > > +       BIT_MASK32(JH7100_RST_HIFI4_BRESET),
> > > +       /* STATUS2 register */
> > > +       BIT_MASK32(JH7100_RST_E24),
> > > +       /* STATUS3 register */
> > > +       0,
> > > +};
> >
> > Yury, do we have any clever (clean) way to initialize a bitmap with
> > particular bits so that it will be a constant from the beginning? If
> > no, any suggestion what we can provide to such users?

If you want your array to be a true bitmap, ie, all bitmap functions should
work with it correctly, you'd initialize it like this:

static const unsigned long jh7100_reset_asserted[] = {
        BITMAP_FROM_U64(BIT_MASK(JH7100_RST_VP6_DRESET) |
                          BIT_MASK(JH7100_RST_VP6_BRESET) |
                          BIT_MASK(JH7100_RST_HIFI4_DRESET) |
                          BIT_MASK(JH7100_RST_HIFI4_BRESET)),
        BITMAP_FROM_U64(BIT_MASK(JH7100_RST_E24)),
}

Look at lib/test_bitmap.c for example, and comment to BITMAP_FROM_U64()
for internal details.

On the other hand, if you hardware has tricky requirements for bit
positions, and they should depend on endianness and/or size of
long in a way not compatible with bitmaps, you probably know better
how to handle this. Just don't refer to your structure as a bitmap.

Thanks,
Yury

> The problem is, that even if we could initialize this without the
> monstrosity in our last conversation a 64bit bitmap would still
> produce worse code. As it is now it's simply a 32bit load and mask
> with index and mask already calculated for the registers. In the
> status callback the mask can even be folded into the register read
> mask. With a 64bit bitmap you'd need to calculate new 64bit index and
> masks, and then conditionally shift the bits into position.
>
> If this reflection of the 32bit registers bothers you that much we
> could alternatively do
>
> static bool jh7100_reset_inverted(unsigned int idx)
> {
>   switch (idx) {
>   case JH7100_RST_U74:
>   case JH7100_RST_VP6_DRESET:
>   ..
>     return false;
>   }
>   return true;
> }
>
> It'd still produce worse code, but at least it would be readable.
>
> /Emil
>
> > ...
> >
> > > +       dev_dbg(rcdev->dev, "reset(%lu)\n", id);
> >
> > These debug messages are useless since one should use ftrace facility instead,
> >
> > --
> > With Best Regards,
> > Andy Shevchenko
