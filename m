Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36A59443714
	for <lists+linux-gpio@lfdr.de>; Tue,  2 Nov 2021 21:14:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230444AbhKBURK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Nov 2021 16:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbhKBURJ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 2 Nov 2021 16:17:09 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 790BEC061714;
        Tue,  2 Nov 2021 13:14:34 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id 5so1596334edw.7;
        Tue, 02 Nov 2021 13:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DJFLiSk1bohG9mZsoNQbF3XHvwqAij8WqFoJj28EDDg=;
        b=iw12nbBwkXxBlIs9kJ77ChJtoTgBhLkikKNBw3ydVms2/+zd4Rpc52iHmLdyamERzo
         mbXMcNtz6C5TdJ31/yl+gsPUEkLWbNC4pXy3I4EE6NDc1Rc/8EDg1uqzxyWGiVCeJXs5
         IbTqvxDb4B1i3gnMMB3swodD7uXYz1YQsXMT2OBct0RMtcaikrhbeSbgR54o1eDNU2kX
         TdQlDpUbA7N2Efiqtwg2fOqZCZcCE/h3MIBzhuF7FN9wAH4UDXijEqmIPpM4HOs3A9XI
         iXkqdoACQpq+rM9mg9wIKuJ/bZQkTW9DJxMLWDEt/i2JoSRWEmF/aO6wt5n4oGz6ALpn
         3RLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DJFLiSk1bohG9mZsoNQbF3XHvwqAij8WqFoJj28EDDg=;
        b=ahzhmVbA6AtsN0lhnswWBeufPij2503199iyAF0a1gTDzYSSd5FKlUghXuLDvmm245
         9k8JDTnOc/nP+laF1qNtTaNkoNdmTpz2TE5iAdap+HpMVwRyOC33zU+N7RS6spzFmpC4
         8SoGCQ9LOcfue/XksMKw6irK8uzCLCJGYHC+SgErSddrEccZOvM/ogVuE8Xy5NS6ptgZ
         8iC+bLiRJPatQMJKeLn9IGKHtXNVuqhKmNXwT1XpFjxr15A57KFZiQamyKOcm670TlpR
         TIGS18CloTBRJRFTleZ9am3PfCwM5gvfC37h4rqbsCUmgt9Yfb0FoSApuFbJqHIcSLns
         b2Dw==
X-Gm-Message-State: AOAM531ieDR17WkASAY+izyzwjbesH3V1YmNe2QBXyib49tmBdYgIdhr
        //xeppHbcuD5M518yxwv/kiy52drM5YhgPiFtB8=
X-Google-Smtp-Source: ABdhPJzCiSq8SUDEahY4JFXuCz6004Aep8GBG6mt9apB6pPfKprIfm9TWaTyyDtYdSgHzOyPQ2onwZ5CPNZ7cVRpjJc=
X-Received: by 2002:a17:907:7601:: with SMTP id jx1mr48190395ejc.69.1635884072980;
 Tue, 02 Nov 2021 13:14:32 -0700 (PDT)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk> <20211102161125.1144023-10-kernel@esmil.dk>
 <CAHp75Ve-P8DR00mtRP_NkrXgB4nsZ+qBkgBen94iTcPqxQYUOg@mail.gmail.com> <CANBLGcyb=TAP0h2WuxBAjRvpN9n7Dt1Hvh5yE8NMOwm3ixZWuA@mail.gmail.com>
In-Reply-To: <CANBLGcyb=TAP0h2WuxBAjRvpN9n7Dt1Hvh5yE8NMOwm3ixZWuA@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 2 Nov 2021 22:13:44 +0200
Message-ID: <CAHp75Vcg3En=xH+kz0GgAMGUoo5FABo2HwGoHd=7QgGVrYkYXg@mail.gmail.com>
Subject: Re: [PATCH v3 09/16] reset: starfive-jh7100: Add StarFive JH7100
 reset driver
To:     Emil Renner Berthing <kernel@esmil.dk>
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

On Tue, Nov 2, 2021 at 9:59 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Tue, 2 Nov 2021 at 20:43, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Tue, Nov 2, 2021 at 6:50 PM Emil Renner Berthing <kernel@esmil.dk> wrote:

...

> > > +/*
> > > + * the registers work like a 32bit bitmap, so writing a 1 to the m'th bit of
> > > + * the n'th ASSERT register asserts line 32n + m, and writing a 0 deasserts the
> > > + * same line.
> > > + * most reset lines have their status inverted so a 0 in the STATUS register
> > > + * means the line is asserted and a 1 means it's deasserted. a few lines don't
> > > + * though, so store the expected value of the status registers when all lines
> > > + * are asserted.
> > > + */
> >
> > Besides missing capitalization,
>
> I'm confused. it was you who wanted all comments to capitalized the same..

Yes and there are two types of the comments, one-liners and
multi-line. In multi-line you usually use proper English grammar,
where capitalization means what it means. For the one-liners just
choose either small letters or capital letters to start them with.

> 64bi

Something is missing here.

> if it sounds like bitmap, use bitmap.
> > I have checked DT definitions and it seems you don't even need the
> > BIT_MASK() macro,
> >
> > > +static const u32 jh7100_reset_asserted[4] = {
> > > +       /* STATUS0 register */
> > > +       BIT_MASK32(JH7100_RST_U74) |
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
>
> The problem is, that even if we could initialize this without the
> monstrosity in our last conversation a 64bit bitmap would still
> produce worse code. As it is now it's simply a 32bit load and mask
> with index and mask already calculated for the registers. In the
> status callback the mask can even be folded into the register read
> mask. With a 64bit bitmap you'd need to calculate new 64bit index and
> masks, and then conditionally shift the bits into position.

Why? You may use 8 byte IO (writeq() / readq() or their relaxed versions), no?

...

> If this reflection of the 32bit registers bothers you that much

What bothers me is hidden endianess issues (yeah, here it might be
theoretical, but consider that somebody will look at your code and use
it as the best example ever).

-- 
With Best Regards,
Andy Shevchenko
