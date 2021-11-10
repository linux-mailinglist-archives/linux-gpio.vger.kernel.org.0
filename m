Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1602444C516
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Nov 2021 17:35:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230430AbhKJQhr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Nov 2021 11:37:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbhKJQhq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Nov 2021 11:37:46 -0500
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38C34C061764;
        Wed, 10 Nov 2021 08:34:59 -0800 (PST)
Received: by mail-pl1-x62a.google.com with SMTP id n8so3488367plf.4;
        Wed, 10 Nov 2021 08:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6DXVckl0RrIJ/A6i//8yhDMUzs3xEaGmxwAICuDmaY0=;
        b=cOPRQjNEGKQEPMy7//mD6f0tLDX24Mm8d5rNJDt+2a1opUtQHC+gw5B4le5/lOGbn4
         BCJj7Wk2BFBWQ1TDTxYCCRzi5Oh0r289EtA+Brubs1f5mk8MmqLpWcnGEPV19DZ0FPs2
         9ehH94vXiWImscpTc6A9TXvfiE7RYihGjQwJa2OoG8XZzYfk7Fl5ii0TnRVkl8zaSCgD
         1dNSJUK2cvCbOHV1B6Dl4EmipGaAJhnI4tJ1AV2LTe0BG6uBW/R8vGQBgDcdyzCV8PmG
         ZjUc+qlVWqfBLU4x+rG4ukIxOHy7GbUxZPRIyhoTgcAKdfyX7gVywQQCakz1uYbseXc9
         QNnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6DXVckl0RrIJ/A6i//8yhDMUzs3xEaGmxwAICuDmaY0=;
        b=olcaMqZWMKXfJsQj9bu3rxp63XsQbVibgvWK92V5Tjb9LVOZ3CNYaEmk+W8GdZODgV
         quaKnp7Sa4ZyBkOfJgxM1XkYT4dj9mz9siyl/rcvM5DjCTiGlPrFwlEAVISq0+WRa/UL
         DL0wJ5OcAVBy3YIpyzA8KMfXEv2TLIqNo6BullDHDg8K6mdRmVIhK2hGT+k8Z4ond4+b
         vNExpyILXtf6ZO/g5cJ27GBoNXN3ZpmVs5aPLRtgKEcTXBd/WCY0/3IkXP1RUq8dC7TH
         WfBH1yLgxES+Ege+P7cb1GgwjUs8+9MJM6x/u1PsO7c6iLcN8ZiHQNP/7//AK/m5gFeu
         s72Q==
X-Gm-Message-State: AOAM531IZGeEMpZxs2PH7VayyUmUEB5NnAfQerTq0nWpJgTZA++OovoH
        NLuWWdbb9ATY3cwaF4d/1EaTjg5ouyssZOIsQP2JuELK
X-Google-Smtp-Source: ABdhPJzQElKEF1R8wngUwIrsIjZJx9wwapxQuwAsvGzxvSSMRC2g4PylICdvEBrOVH7f25UGO7UscPcqgvHGA3V9Js0=
X-Received: by 2002:a17:902:bd98:b0:13f:9ae7:54d1 with SMTP id
 q24-20020a170902bd9800b0013f9ae754d1mr407705pls.15.1636562098638; Wed, 10 Nov
 2021 08:34:58 -0800 (PST)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk> <20211102161125.1144023-10-kernel@esmil.dk>
 <CAHp75Ve-P8DR00mtRP_NkrXgB4nsZ+qBkgBen94iTcPqxQYUOg@mail.gmail.com>
 <CANBLGcyb=TAP0h2WuxBAjRvpN9n7Dt1Hvh5yE8NMOwm3ixZWuA@mail.gmail.com> <CAAH8bW-J6Ai+KZFkZ4ELOzD-u7BceZrBqwnCuPH6F-fNQNm3XQ@mail.gmail.com>
In-Reply-To: <CAAH8bW-J6Ai+KZFkZ4ELOzD-u7BceZrBqwnCuPH6F-fNQNm3XQ@mail.gmail.com>
From:   Yury Norov <yury.norov@gmail.com>
Date:   Wed, 10 Nov 2021 08:34:39 -0800
Message-ID: <CAAH8bW8=o2ZTWEL8NUHvPE5COZJJ7VnNBKp_rumyXOe6m2q1Jg@mail.gmail.com>
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

On Tue, Nov 2, 2021 at 1:55 PM Yury Norov <yury.norov@gmail.com> wrote:
>
> On Tue, Nov 2, 2021 at 12:59 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> >
> > On Tue, 2 Nov 2021 at 20:43, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > +Cc: Yury (bitmap expert)
> > >
> > > On Tue, Nov 2, 2021 at 6:50 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > >
> > > > Add a driver for the StarFive JH7100 reset controller.
> > >
> > > ...
> > >
> > > > +#define BIT_MASK32(x) BIT((x) % 32)
> > >
> > > Possible namespace collision.
> > >
> > > ...
> > >
> > > > +/*
> > > > + * the registers work like a 32bit bitmap, so writing a 1 to the m'th bit of
> > > > + * the n'th ASSERT register asserts line 32n + m, and writing a 0 deasserts the
> > > > + * same line.
>
> We don't have 32-bit bitmaps. Bitmaps are always arrays of unsigned longs. On a
> 64-bit system this '32-bit bitmap' may be broken due to endianness issues.
>
> > > > + * most reset lines have their status inverted so a 0 in the STATUS register
> > > > + * means the line is asserted and a 1 means it's deasserted. a few lines don't
> > > > + * though, so store the expected value of the status registers when all lines
> > > > + * are asserted.
> > > > + */
> > >
> > > Besides missing capitalization,
> >
> > I'm confused. it was you who wanted all comments to capitalized the same..
> > 64bi
> > if it sounds like bitmap, use bitmap.
> > > I have checked DT definitions and it seems you don't even need the
> > > BIT_MASK() macro,
> > >
> > > > +static const u32 jh7100_reset_asserted[4] = {
> > > > +       /* STATUS0 register */
> > > > +       BIT_MASK32(JH7100_RST_U74) |
>
> I think we have no BIT_MASK32() for a good reason. Natural alignment is
> always preferable.
>
> > > > +       BIT_MASK32(JH7100_RST_VP6_DRESET) |
> > > > +       BIT_MASK32(JH7100_RST_VP6_BRESET),
> > > > +       /* STATUS1 register */
> > > > +       BIT_MASK32(JH7100_RST_HIFI4_DRESET) |
> > > > +       BIT_MASK32(JH7100_RST_HIFI4_BRESET),
> > > > +       /* STATUS2 register */
> > > > +       BIT_MASK32(JH7100_RST_E24),
> > > > +       /* STATUS3 register */
> > > > +       0,
> > > > +};
> > >
> > > Yury, do we have any clever (clean) way to initialize a bitmap with
> > > particular bits so that it will be a constant from the beginning? If
> > > no, any suggestion what we can provide to such users?
>
> If you want your array to be a true bitmap, ie, all bitmap functions should
> work with it correctly, you'd initialize it like this:
>
> static const unsigned long jh7100_reset_asserted[] = {
>         BITMAP_FROM_U64(BIT_MASK(JH7100_RST_VP6_DRESET) |
>                           BIT_MASK(JH7100_RST_VP6_BRESET) |
>                           BIT_MASK(JH7100_RST_HIFI4_DRESET) |
>                           BIT_MASK(JH7100_RST_HIFI4_BRESET)),
>         BITMAP_FROM_U64(BIT_MASK(JH7100_RST_E24)),
> }

My bad, it should be BIT_ULL_MASK.

Thanks,
Yury
