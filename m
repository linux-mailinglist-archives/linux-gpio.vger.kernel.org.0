Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3EA694452CB
	for <lists+linux-gpio@lfdr.de>; Thu,  4 Nov 2021 13:15:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231402AbhKDMSf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 4 Nov 2021 08:18:35 -0400
Received: from mail-pg1-f176.google.com ([209.85.215.176]:36458 "EHLO
        mail-pg1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231312AbhKDMSf (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 4 Nov 2021 08:18:35 -0400
Received: by mail-pg1-f176.google.com with SMTP id 75so5255429pga.3;
        Thu, 04 Nov 2021 05:15:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BbQxkXh1kRX5txg91IzBReR7Etxrh9MaaIL5VubC4mA=;
        b=HwaDncFOGCkngqsx9mhphaCX9kCINHoPVkIt6zwRsCF/XLC2Stu1pMzkcI+laGuggx
         WtNWzQUf2HtiwZIfpaYVa9QyDVnnPIR+Ky9MkxgDEmCIp82Kyo36261eV3WsG8iMsCKy
         5TCL0XWo9yi+TVJKKbpqstz22CmCChIBximeJSIGh5vJ2FMkGGBINKHcxELqzVxdCTxI
         zEKb9sIhDT5YogiZZx/SvRUSADQKYBn/5ScV7KhC7wTRifgwlxz9f4vpPGaCMew6adsC
         ZpyYu7d+Op6oDiH2gPau7GmWP6DWUOtIC48kROCfF0V+ItWTtAmTfdPWBEK3Ime5eJWY
         J06w==
X-Gm-Message-State: AOAM531W3zX6vHHFbMupsQ67P1Kpvc/B/GyqSYBooLA22s889KpCBeeX
        EG8YRrIrekcSgxqj3hSYml4CvAHE1xoEDZYPKWM=
X-Google-Smtp-Source: ABdhPJyU1eOL96q9aeg27rCGRB1DzlV/CdmoIQADJWmiDt4mzuQNX51WDsHXaA6t5irbMhhl52dNgltzzdGXVDztegg=
X-Received: by 2002:a05:6a00:1354:b0:494:5227:42c7 with SMTP id
 k20-20020a056a00135400b00494522742c7mr5310054pfu.53.1636028156990; Thu, 04
 Nov 2021 05:15:56 -0700 (PDT)
MIME-Version: 1.0
References: <20211102161125.1144023-1-kernel@esmil.dk> <20211102161125.1144023-10-kernel@esmil.dk>
 <CAHp75Ve-P8DR00mtRP_NkrXgB4nsZ+qBkgBen94iTcPqxQYUOg@mail.gmail.com>
 <CANBLGcyb=TAP0h2WuxBAjRvpN9n7Dt1Hvh5yE8NMOwm3ixZWuA@mail.gmail.com>
 <CAHp75Vcg3En=xH+kz0GgAMGUoo5FABo2HwGoHd=7QgGVrYkYXg@mail.gmail.com> <CANBLGczrGwexRGvGxa9C+yzaSHZF_d5+AaebeLUX5BXFxipr=A@mail.gmail.com>
In-Reply-To: <CANBLGczrGwexRGvGxa9C+yzaSHZF_d5+AaebeLUX5BXFxipr=A@mail.gmail.com>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Thu, 4 Nov 2021 13:15:46 +0100
Message-ID: <CANBLGcztx0DL=U06QPJ5XT4ra=kx2QAZxxP=0bjfgQ0skhv3Bg@mail.gmail.com>
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

On Tue, 2 Nov 2021 at 22:17, Emil Renner Berthing <kernel@esmil.dk> wrote:
> On Tue, 2 Nov 2021 at 21:14, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > On Tue, Nov 2, 2021 at 9:59 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> > > On Tue, 2 Nov 2021 at 20:43, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
> > > > On Tue, Nov 2, 2021 at 6:50 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> >
> > ...
> >
> > > > > +/*
> > > > > + * the registers work like a 32bit bitmap, so writing a 1 to the m'th bit of
> > > > > + * the n'th ASSERT register asserts line 32n + m, and writing a 0 deasserts the
> > > > > + * same line.
> > > > > + * most reset lines have their status inverted so a 0 in the STATUS register
> > > > > + * means the line is asserted and a 1 means it's deasserted. a few lines don't
> > > > > + * though, so store the expected value of the status registers when all lines
> > > > > + * are asserted.
> > > > > + */
> > > >
> > > > Besides missing capitalization,
> > >
> > > I'm confused. it was you who wanted all comments to capitalized the same..
> >
> > Yes and there are two types of the comments, one-liners and
> > multi-line. In multi-line you usually use proper English grammar,
> > where capitalization means what it means. For the one-liners just
> > choose either small letters or capital letters to start them with.
>
> That sounds reasonable, it was just that you complained about
> inconsistent comments in the pinctrl driver that follows the above.
>
> > > if it sounds like bitmap, use bitmap.
> > > > I have checked DT definitions and it seems you don't even need the
> > > > BIT_MASK() macro,
> > > >
> > > > > +static const u32 jh7100_reset_asserted[4] = {
> > > > > +       /* STATUS0 register */
> > > > > +       BIT_MASK32(JH7100_RST_U74) |
> > > > > +       BIT_MASK32(JH7100_RST_VP6_DRESET) |
> > > > > +       BIT_MASK32(JH7100_RST_VP6_BRESET),
> > > > > +       /* STATUS1 register */
> > > > > +       BIT_MASK32(JH7100_RST_HIFI4_DRESET) |
> > > > > +       BIT_MASK32(JH7100_RST_HIFI4_BRESET),
> > > > > +       /* STATUS2 register */
> > > > > +       BIT_MASK32(JH7100_RST_E24),
> > > > > +       /* STATUS3 register */
> > > > > +       0,
> > > > > +};
> > > >
> > > > Yury, do we have any clever (clean) way to initialize a bitmap with
> > > > particular bits so that it will be a constant from the beginning? If
> > > > no, any suggestion what we can provide to such users?
> > >
> > > The problem is, that even if we could initialize this without the
> > > monstrosity in our last conversation a 64bit bitmap would still
> > > produce worse code. As it is now it's simply a 32bit load and mask
> > > with index and mask already calculated for the registers. In the
> > > status callback the mask can even be folded into the register read
> > > mask. With a 64bit bitmap you'd need to calculate new 64bit index and
> > > masks, and then conditionally shift the bits into position.
> >
> > Why? You may use 8 byte IO (writeq() / readq() or their relaxed versions), no?
> >
> > > If this reflection of the 32bit registers bothers you that much
> >
> > What bothers me is hidden endianess issues (yeah, here it might be
> > theoretical, but consider that somebody will look at your code and use
> > it as the best example ever).
>
> Wouldn't endian issues be a reason to make sure we read 32bit
> registers with 32bit reads? Or do you expect a hypothetical big-endian
> StarFive SoC to also change the order of the registers?

Hi Andy.

I'd really like to understand your reasoning here. As far as I can
tell reading 2 adjacent 32bit registers with a 64bit read as you're
proposing is exactly what would cause endian issues. Eg. on little
endian you'd get reg0 | reg1 << 32 whereas on big-endian you'd get
reg0 << 32 | reg1.

/Emil
