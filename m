Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 058E841F93D
	for <lists+linux-gpio@lfdr.de>; Sat,  2 Oct 2021 03:47:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbhJBBtU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Oct 2021 21:49:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229961AbhJBBtM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Oct 2021 21:49:12 -0400
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8B00C061775;
        Fri,  1 Oct 2021 18:47:26 -0700 (PDT)
Received: by mail-il1-x129.google.com with SMTP id t11so1865892ilf.11;
        Fri, 01 Oct 2021 18:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3UoglxEss74krNG1eynWphykvKH2L6fTntU5oaLNnbw=;
        b=Vrn4dYKAgwrbO3w0HPzznkiUo3vTIigSgPCFoCGFoAR2vIXOymzGnmktDqOhvduzTq
         1HjL2CLBSJebuZIdqEji+1VxEKMw/47SzZN4BmVnJW5adpUScNo5MpsGB3PhKqCSKy11
         OVLu41mTnz+MRzNcD2iaQmm8bcyfOf7hlEsl7ADn3qYLbVxlqaD/inWwjciCBwOeYPFb
         jj05402G/mBOjrfHGbe/KraIz7zivMDAwmUMTZ0ZcO556KNpJ8+Rigc6CMCrsbKTn/c1
         AkRMFaz3N9Ko6YU+dBG+FMVjfc+Fm995MeCAJpDcFhfVPRehpqdGh98ne286opMF0Pcb
         eeZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3UoglxEss74krNG1eynWphykvKH2L6fTntU5oaLNnbw=;
        b=Xk/95+s5QH7byYbzMnzJni18qPekXRm/MTfzLNxmaIpF0rJDeeV3z6DA6aB8eZR8Ss
         IZX7rWEm5L+ZEA/94sI3ASn/NCtXHoZCvVzjzlZ91ulIDIVTzuxzb2LZpeMHeXyhpF6o
         M+pRoyV/2QW4/UtdlNhxpmsM0lL9vIyoMv5FYBMZ2yrvm6HrrESNpdB3v3uYfvQ/v/I4
         wob0xdYSq9fZfwCymLfc0IjLiLARbwK2kTgnBCXqKI2m0/w0IrR/o69MDIYLTA9m3/ca
         cSQB6kSd2bBzIXRQIqWmdTmOVzm2U2G1hRyCT0eF502IFyZMgV3uhcnv05x9zwp5fHxG
         yyPw==
X-Gm-Message-State: AOAM531o5rIqgYPtbYQa1Gz4uRU2x4yNGGUX0k1wMjJyT0+v3T6smcM5
        Y6uvQYLprqjo8N6Mf/JfRwcIkvUotxOmWk8Q5kA=
X-Google-Smtp-Source: ABdhPJwQl0ivuia+pTQMuJc757dsytyj/kPJe3WLEonpMSWPq9zRT+KgxZPHAwnmT5E4C/jllNr/tLkvq/Lf27m6jhc=
X-Received: by 2002:a05:6e02:106:: with SMTP id t6mr746692ilm.185.1633139245993;
 Fri, 01 Oct 2021 18:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com> <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <CAOesGMgSt_mYvRzF0rC=fnjMYGO9EX0_Ow2cD1d8XKLD5pHsZA@mail.gmail.com>
 <CAGETcx-b0ea-rqH+fj37sq9SLWY=+ePK94Y6rnLPuNbqFVBWmw@mail.gmail.com>
 <CAMuHMdWhCB_zg6TwjYfz+=vc+_Wd5yzuAAzk=2ToZOQSAyaiJA@mail.gmail.com>
 <CAK8P3a10R-Q8hB-piH_QT0hzkaAZTczLbM=6WmgoMHYL8EhZ4g@mail.gmail.com>
 <CAOesGMhHK7Z8Ki+UFRi24dXTdk4=YC6ExneOnfkVmG2HFiVMKw@mail.gmail.com> <CAGETcx_UFLCwmqs_d5c8JY8Je9r=jy=KnELz1h91Qbrw9z+kaw@mail.gmail.com>
In-Reply-To: <CAGETcx_UFLCwmqs_d5c8JY8Je9r=jy=KnELz1h91Qbrw9z+kaw@mail.gmail.com>
From:   Tomasz Figa <tomasz.figa@gmail.com>
Date:   Sat, 2 Oct 2021 10:47:13 +0900
Message-ID: <CA+Ln22FzMvoyANjBN9hPKWXzgDip+Yi3Re3jZf3BdgMywU47xg@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select configs
To:     Saravana Kannan <saravanak@google.com>
Cc:     Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Will McVicker <willmcvicker@google.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

2021=E5=B9=B410=E6=9C=882=E6=97=A5(=E5=9C=9F) 4:26 Saravana Kannan <saravan=
ak@google.com>:
>
> On Fri, Oct 1, 2021 at 8:27 AM Olof Johansson <olof@lixom.net> wrote:
> >
> > On Fri, Oct 1, 2021 at 2:01 AM Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > On Fri, Oct 1, 2021 at 10:19 AM Geert Uytterhoeven <geert@linux-m68k.=
org> wrote:
> > > > On Fri, Oct 1, 2021 at 7:24 AM Saravana Kannan <saravanak@google.co=
m> wrote:
> > > > > GIC and arch timer. Basically the minimal kernel would need a tim=
er
> > > > > for the scheduler tick and IRQ controller to get the timer IRQ an=
d the
> > > > > fixed clock driver if the archtimer uses one to get its frequency=
 and
> > > > > the early UART console is pointless as a module (so build it in t=
o
> > > > > allow debugging/development).
> > > > >
> > > > > And then all new drivers, we should make sure are implemented as
> > > > > tristate drivers. And we can go back and slowly work on convertin=
g
> > > > > existing drivers to modules (community effort -- not one person o=
r
> > > > > entity) -- at least the ones where the author has hardware or one=
s
> > > > > where the change is very likely to be correct and someone else is
> > > > > willing to test it. We'll never be able to support some/all ARM32=
 (do
> > > > > they even have a GIC/arch timer standard?), but at least for ARM6=
4,
> > > > > this seems like a viable goal.
> > > >
> > > > Cortex-A7/A15 and later have GIC and architectured timer, so it sho=
uld
> > > > work for contemporary systems.
> > > > Cortex-A9 systems may have GIC, and TWD and/or Global Timer (but I'=
ve
> > > > seen SoCs where the interrupt for the latter was not wired :-(.
> > >
> > > There are a number of well-known examples even with 64-bit chips or
> > > Cortex-A7/A15 based SoCs that can't use the architected timer,
> > > irqchip or iommu.
> > >
> > > Apple M1, Broadcom BCM283x, Samsung Exynos5 and
> > > some Hisilicon server parts come to mind, I'm sure there
> > > are more.
> >
> > There's also more and more movement towards having coprocessors with
> > standardized interfaces dealing with this functionality. We're
> > currently at the point where they have coprocessors with
> > non-standardized interfaces, and it's useful to keep encouraging
> > convergence in this area to everybody's benefit. I don't find it
> > particularly useful to make life easier for the custom solutions at
> > the expense of others like this patchset does, when that's (just
> > beyond? on?) the horizon.
> >
> > > > What are the plans for other architectures?
> > > > I've seen similar patches being applied for e.g. MIPS.
> > >
> > > There is some work in the more actively maintained MIPS
> > > platforms to make those behave more like Arm/powerpc/riscv/m68k
> > > platforms, using a single image and moving drivers into modules.
> > > Most MIPS platforms seem unlikely to get updated to this,
> > > and will continue to require a SoC specific kernel binary forever,
> > > similar to the renesas superh platforms. Most of the less
> > > common architectures (arc, csky, hexagon, nios2, xtensa,
> > > microblaze, nds32, openrisc, sparc/leon) are way behind that
> > > though, and generally don't work at all without out-of-tree
> > > code.
> >
> > One of the arguments for needing some of these core drivers in-kernel
> > is that some platforms boot at very conservative DVFS operating
> > points, to a degree that you really want to turn up the CPU clocks
> > fairly early during boot.
> >
> > If you don't have the drivers built-in, you can't do that and/or you
> > create possible fragile or awkward inter-module dependencies with
> > deferred probing, etc. We do care about boot time enough to prefer to
> > just build them in for this reason.
>
> Go look at a Pixel 5, we got this working just fine with all these
> drivers as modules and we definitely care about boot time. You just
> need to load your CPU freq driver and the other ones it needs early
> on. And with fw_devlink=3Don (default in upstream), there's hardly any
> deferred probing.
>
> > If vmlinux binary size is a concern, maybe it's time to consider
> > splitting the drivers into a bare-minimum piece that's not a module
> > for early setup, and the rest that can be loaded post-boot.
>
> Isn't this literally what I was suggesting with my
> ARM64_MINIMAL_GENERIC_KERNEL suggestion? Build in all the bare minimum
> drivers that are needed before module loading can happen? You'd just
> select them all under that config. And any existing platform that
> wants to use it would break up their drivers into modules and switch
> to it.

I think the point here is that pinctrl and clk are considered a part
of "bare minimum" for Exynos.
