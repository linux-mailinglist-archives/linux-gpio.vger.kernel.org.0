Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BBF84436DC
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 20:59:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230155AbhKBUBo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 16:01:44 -0400
Received: from mail-pl1-f175.google.com ([209.85.214.175]:33296 "EHLO
        mail-pl1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbhKBUBn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 16:01:43 -0400
Received: by mail-pl1-f175.google.com with SMTP id s24so617319plp.0;
        Tue, 02 Nov 2021 12:59:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RkF10ejv+ZfbbBVLr9JViJZH+YXp2/4h2Ubp9f1gi2c=;
        b=mc7wf9S3vGDNWjNgPTnaD5ghHG98OpxUGSiTEfwtyeU5sls3AGHrhR7gFuK7F4AwdJ
         tTITkyIRovka5daBa0lqOS3NqA6sHBNwdiGvtBp41KP5xSOo+kLJByf/IFRTOQtmu2fU
         kHFQQV0pfX1T+dXoZwEY2VJLZPG6GRqtywPHgdRCaAyBwrV2J5aNuP3ahc1+nieeoYpy
         idck+y2EdfvRsA+iYx8HKTD4ztf6FygMgffKsg8re0h5L9UBZNnJ90ahqgVuN2V4Mdi8
         FANMx4ATyYy5Yww90SNtTY8Ye7bFrix/1EG5jZ7olpeZjql5J7QTJNZ/2Z8+X5dt7HHo
         HcUQ==
X-Gm-Message-State: AOAM531k+kF1pOdnmbwhvEJRnLCzYmTHEFE02Kh7MwV257GEThRaEOoA
        Lovu4RwQjbJctSwJJGThvwRdCIJwO/oYUiTdLuo=
X-Google-Smtp-Source: ABdhPJzAfyeKaGl5VCZ/L0KzMJgJN7/MZZr3d178DvhBBn4vWjScd0QbjXhDeG6xtMzYne48NrYC54CQIPNWsHmSO+U=
X-Received: by 2002:a17:903:11c5:b0:13f:ef40:e319 with SMTP id
 q5-20020a17090311c500b0013fef40e319mr33828546plh.33.1635883148168; Tue, 02
 Nov 2021 12:59:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk> <20211102161125.1144023-10-kernel@esmil.dk>
 <CAHp75Ve-P8DR00mtRP_NkrXgB4nsZ+qBkgBen94iTcPqxQYUOg@mail.gmail.com>
In-Reply-To: <CAHp75Ve-P8DR00mtRP_NkrXgB4nsZ+qBkgBen94iTcPqxQYUOg@mail.gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Tue, 2 Nov 2021 20:58:57 +0100
Message-ID: <CANBLGcyb=TAP0h2WuxBAjRvpN9n7Dt1Hvh5yE8NMOwm3ixZWuA@mail.gmail.com>
Subject: Re: [PATCH v3 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Yury Norov <yury.norov@gmail.com>,
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

On Tue, 2 Nov 2021 at 20:43, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> +Cc: Yury (bitmap expert)
>
> On Tue, Nov 2, 2021 at 6:50 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> >
> > Add a driver for the StarFive JH7100 reset controller.
>
> ...
>
> > +#define BIT_MASK32(x) BIT((x) % 32)
>
> Possible namespace collision.
>
> ...
>
> > +/*
> > + * the registers work like a 32bit bitmap, so writing a 1 to the m'th bit of
> > + * the n'th ASSERT register asserts line 32n + m, and writing a 0 deasserts the
> > + * same line.
> > + * most reset lines have their status inverted so a 0 in the STATUS register
> > + * means the line is asserted and a 1 means it's deasserted. a few lines don't
> > + * though, so store the expected value of the status registers when all lines
> > + * are asserted.
> > + */
>
> Besides missing capitalization,

I'm confused. it was you who wanted all comments to capitalized the same..
64bi
if it sounds like bitmap, use bitmap.
> I have checked DT definitions and it seems you don't even need the
> BIT_MASK() macro,
>
> > +static const u32 jh7100_reset_asserted[4] = {
> > +       /* STATUS0 register */
> > +       BIT_MASK32(JH7100_RST_U74) |
> > +       BIT_MASK32(JH7100_RST_VP6_DRESET) |
> > +       BIT_MASK32(JH7100_RST_VP6_BRESET),
> > +       /* STATUS1 register */
> > +       BIT_MASK32(JH7100_RST_HIFI4_DRESET) |
> > +       BIT_MASK32(JH7100_RST_HIFI4_BRESET),
> > +       /* STATUS2 register */
> > +       BIT_MASK32(JH7100_RST_E24),
> > +       /* STATUS3 register */
> > +       0,
> > +};
>
> Yury, do we have any clever (clean) way to initialize a bitmap with
> particular bits so that it will be a constant from the beginning? If
> no, any suggestion what we can provide to such users?

The problem is, that even if we could initialize this without the
monstrosity in our last conversation a 64bit bitmap would still
produce worse code. As it is now it's simply a 32bit load and mask
with index and mask already calculated for the registers. In the
status callback the mask can even be folded into the register read
mask. With a 64bit bitmap you'd need to calculate new 64bit index and
masks, and then conditionally shift the bits into position.

If this reflection of the 32bit registers bothers you that much we
could alternatively do

static bool jh7100_reset_inverted(unsigned int idx)
{
  switch (idx) {
  case JH7100_RST_U74:
  case JH7100_RST_VP6_DRESET:
  ..
    return false;
  }
  return true;
}

It'd still produce worse code, but at least it would be readable.

/Emil

> ...
>
> > +       dev_dbg(rcdev->dev, "reset(%lu)\n", id);
>
> These debug messages are useless since one should use ftrace facility instead,
>
> --
> With Best Regards,
> Andy Shevchenko
