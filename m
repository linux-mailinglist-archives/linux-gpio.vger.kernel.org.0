Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B30154608CE
	for <lists+linux-gpio@lfdr.de>; Sun, 28 Nov 2021 19:21:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359169AbhK1SYt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 28 Nov 2021 13:24:49 -0500
Received: from mail-pj1-f46.google.com ([209.85.216.46]:35535 "EHLO
        mail-pj1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359174AbhK1SWp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 28 Nov 2021 13:22:45 -0500
Received: by mail-pj1-f46.google.com with SMTP id j6-20020a17090a588600b001a78a5ce46aso13603590pji.0;
        Sun, 28 Nov 2021 10:19:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m5E/2VsB22bAL9LsiGHm8OGiUiuEPFzEndEXLPhvONc=;
        b=VIPNbJuLtIxw9xbbUcd2dJfN4QTP5hvTEdV1P8cTHWXg9nvc6hyA5zoStDaopyXFLB
         NsItm3THS9ekC2gIQUzFXeH/GKVqsxCF/hFbRrTRQQ9Al11b7dukYdDjctcd6F1vavmj
         tiHhEwlOGWhDEUR2MItfPafhL8o8IicHlusQuB3PkdO9LIxuKRAcmNg/QbWteSVaY5aA
         3qojtRLG9BGL+EU6UeCUf41wFFLme2vU/iTb4YaDj2SrjwGAPOvJ2iSImEQjqik4I32O
         kl/RBVzf/hH0s1yDTiu6VpQx/SCPAFr862Tfzrm938TqrAqewOUkYDI/oX9PysURM+bY
         1mlA==
X-Gm-Message-State: AOAM533MOlPW1I3zuETpSk9/wPkh5ykNzj9p6HJzl1ySqTXnGAu9baLi
        pTSh3bFn7MeA4bIUNKcTMCzXbPgtEOj37uC6uFc=
X-Google-Smtp-Source: ABdhPJw/UaRYaYPP7u790TiVEuw+cyKoBT+gz3jjS8ginoOsoo9UsRoKWx6F0Mfo8gbL4qUKLo356lQhYmgTHirR8sQ=
X-Received: by 2002:a17:90a:ab17:: with SMTP id m23mr32269991pjq.194.1638123569367;
 Sun, 28 Nov 2021 10:19:29 -0800 (PST)
MIME-Version: 1.0
References: <CANBLGcykFks+EF2m0bdD+j5w43Qy30LBgVnAYJWU+5-WVJH6PA@mail.gmail.com>
 <mhng-5fc3ff6b-1f6e-4efb-8578-20759733887a@palmer-ri-x1c9>
In-Reply-To: <mhng-5fc3ff6b-1f6e-4efb-8578-20759733887a@palmer-ri-x1c9>
From:   Emil Renner Berthing <kernel@esmil.dk>
Date:   Sun, 28 Nov 2021 19:19:18 +0100
Message-ID: <CANBLGcxdvztD+WBCA4jCBBzPRHC0v7RiVgG_p8RdVpXxCWnHig@mail.gmail.com>
Subject: Re: [PATCH v4 00/16] Basic StarFive JH7100 RISC-V SoC support
To:     Palmer Dabbelt <palmer@rivosinc.com>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Greg KH <gregkh@linuxfoundation.org>,
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
        Matteo Croce <mcroce@microsoft.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, 27 Nov 2021 at 02:30, Palmer Dabbelt <palmer@rivosinc.com> wrote:
> On Tue, 16 Nov 2021 09:28:41 PST (-0800), kernel@esmil.dk wrote:
> > On Tue, 16 Nov 2021 at 17:08, Arnd Bergmann <arnd@arndb.de> wrote:
> >> On Tue, Nov 16, 2021 at 4:01 PM Emil Renner Berthing <kernel@esmil.dk> wrote:
> >> >
> >> > This series adds support for the StarFive JH7100 RISC-V SoC. The SoC has
> >> > many devices that need non-coherent dma operations to work which isn't
> >> > upstream yet[1], so this just adds basic support to boot up, get a
> >> > serial console, blink an LED and reboot itself. Unlike the Allwinner D1
> >> > this chip doesn't use any extra pagetable bits, but instead the DDR RAM
> >> > appears twice in the memory map, with and without the cache.
> >> >
> >> > The JH7100 is a test chip for the upcoming JH7110 and about 300 BeagleV
> >> > Starlight Beta boards were sent out with them as part of a now cancelled
> >> > BeagleBoard.org project. However StarFive has produced more of the
> >> > JH7100s and more boards will be available[2] to buy. I've seen pictures
> >> > of the new boards now, so hopefully before the end of the year.
> >> >
> >> > This series is also available at
> >> > https://github.com/esmil/linux/commits/starlight-minimal
> >> > ..but a more complete kernel including drivers for non-coherent
> >> > peripherals based on this series can be found at
> >> > https://github.com/starfive-tech/linux/tree/visionfive
> >> >
> >> > [1]: https://lore.kernel.org/linux-riscv/20210723214031.3251801-2-atish.patra@wdc.com/
> >> > [2]: https://www.linkedin.com/pulse/starfive-release-open-source-single-board-platform-q3-2021-starfive/
> >>
> >> Thanks for adding me to Cc, I've had a look at the series and didn't
> >> see anything
> >> wrong with it, and I'm happy to merge it through the SoC tree for the
> >> initial support
> >> in 5.17, provided you get an Ack from the arch/riscv maintainers for it.
> >
> > Cool!
> >
> > @Palmer, do you mind looking through this? Probably patch 1, 15 and 16
> > are the most relevant to you.
> >
> >> Regarding the coherency issue, it's a bit sad to see yet another hacky
> >> workaround
> >> in the hardware, but as you say this is unrelated to the driver
> >> series. I'd actually
> >> argue that this one isn't that different from the other hack you
> >> describe, except
> >> this steals the pagetable bits from the address instead of the reserved flags...
> >
> > Yeah, it's definitely a hack, but at least it's not using bits the
> > spec said was reserved. Hopefully the JH7110 will be fully coherent or
> > maybe implement the new Svpbmt extension.
>
> Sorry, this had been sitting on top of my inbox because I hadn't had a
> chance to figure this stuff out.  Emil poked me on IRC about it, but I
> figured I'd just write it here so everyone can see:
>
> IMO there's a huge difference between the StarFive-flavored non-coherent
> stuff (which relies on physical aliasing) and the T-Head-flavored stuff
> (which uses page table bits): the PA-aliasing approach is allowed by the
> ISA, while the page table bits aren't (they're marked as reserved).  IMO
> we should still figure out a way to take the T-Head stuff, as it's the
> real-ist hardware we have, but that's a whole different can of worms.
>
> My worry with this is I've yet to actually be convinced that either of
> these approaches work.  Specifically, neither of them prevents M-mode
> from performing (either directly or as a side effect of something like
> speculation) accesses that violate the attributes we're ascribing to
> regions in Linux.  IIRC I pointed that out in the Svpmbt patch set,
> which has exactly the same set of problems.
>
> That said, I don't really care all that much -- having something here is
> better than nothing, and we've always relied on the HW vendors just
> producing HW that works when it comes to any of the IO stuff (ie, even
> on coherent systems).  These are all drivers so it's really up to those
> folks where the bar is, so as long as everyone's on the page about that
> you're not going to get any objections from me so
>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

Thanks! Yeah, as you say something is better than nothing. I'd think
it's helpful to have something to build and test the non-coherent dma
functionality on, and the nice thing about the Starfive-flavour is
that it will actually boot into an initramfs root and have a working
serial console even without the non-coherent dmas working.

> The SOC tree works for me.  It'd be great to have a shared tag I where I
> can pull in at least the Kconfig.socs stuff, but if that's not easy then
> it's no big deal -- what's in flight there is pretty trivial on my end,
> so we can just deal with the merge conflicts.

I guess this is for the SoC maintainers to consider. Let me know if
that's wrong and I need to do anything.

/Emil
