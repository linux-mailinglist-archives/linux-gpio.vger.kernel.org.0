Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EAF241F5B6
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 21:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231527AbhJAT2q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Oct 2021 15:28:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229618AbhJAT2n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Oct 2021 15:28:43 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D02BC06177E
        for <linux-gpio@vger.kernel.org>; Fri,  1 Oct 2021 12:26:58 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id r1so22700689ybo.10
        for <linux-gpio@vger.kernel.org>; Fri, 01 Oct 2021 12:26:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+I3d1su/KvdHqod/jvZj4lVFL3MuIPfZCays9g7CN7k=;
        b=EneX9Nz+akqriwHswlfP+5z4mszZUBt5tejoF6pkNPF4ct3GPQNHTy1gLNzJq7fhV5
         Q3tNAAhnrbl2HAPqbX8HMMmI1D4l2VwdFNQK1rW1Lu+WxG36WHsJLmeRJ13tN85QPbR6
         cyiOz85aw1l/YHU1853UOnyKSoEmVMMIHawKdQUekUrMJZRrAEykcvYaROArZIcTq1uF
         ptpZKieD7AvZ/dcJtDOtylXMuHp0m7OWsyjH4WX1poQZPbals+M4U4iVxckbt+J3JcjR
         k1NWIDAsCe9KtV59TJkdQs4MFoiN25XNYfxr1X3qGzMXRl550k6H94RilzZ/fJhr8lE6
         5b2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+I3d1su/KvdHqod/jvZj4lVFL3MuIPfZCays9g7CN7k=;
        b=hPJe9CpgptH/ZyQQgVJ+UhTHDtgOUgWFqvY864x/8DtX+CVGkgSA1lAEeS48JBd3ct
         pmI0cv3ujB514JnUE52FVCfcVoEoaIF4DTAW7ONRRhIfqSSaYSQZEupfZkQnU/f1gf8H
         4oNrqTfXCPzgiXfxJwIxN13ECG/rDu3+bNbSN0FpKGqT0qNTbnZmnkDH182P8VuWcJHB
         TmBxNuUpQ5wgBB5MKuYTH7fz2De/Kpdr3vf6XrAzg4d6ZM4NdKG4wEpLTC9XRrduaCZs
         0A+gfN8fXTgA7JQT7cBqHCrekfBFXA7vH3QJs08a6UvaMYGz8mbnEnAYsoImq9tfHaz8
         Vm6g==
X-Gm-Message-State: AOAM53104NN5G7pmyPwApZzKB3W/LwbRN39+pgEjmsc7/7yNKXOTl1y7
        tRF5grXut1lTRUvcBDVimFTkyBmjXh08OeMfDOSvMA==
X-Google-Smtp-Source: ABdhPJzEY4QNq5SWV1QbRoyFZtAgKfhNOJD2XXMlINUwQzL6veYPMvaJGswNlhCCzflMkhboQW0Q6R+GxM38wqKTb/A=
X-Received: by 2002:a25:1dd7:: with SMTP id d206mr5271610ybd.486.1633116416960;
 Fri, 01 Oct 2021 12:26:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com> <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <CAOesGMgSt_mYvRzF0rC=fnjMYGO9EX0_Ow2cD1d8XKLD5pHsZA@mail.gmail.com>
 <CAGETcx-b0ea-rqH+fj37sq9SLWY=+ePK94Y6rnLPuNbqFVBWmw@mail.gmail.com>
 <CAMuHMdWhCB_zg6TwjYfz+=vc+_Wd5yzuAAzk=2ToZOQSAyaiJA@mail.gmail.com>
 <CAK8P3a10R-Q8hB-piH_QT0hzkaAZTczLbM=6WmgoMHYL8EhZ4g@mail.gmail.com> <CAOesGMhHK7Z8Ki+UFRi24dXTdk4=YC6ExneOnfkVmG2HFiVMKw@mail.gmail.com>
In-Reply-To: <CAOesGMhHK7Z8Ki+UFRi24dXTdk4=YC6ExneOnfkVmG2HFiVMKw@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Fri, 1 Oct 2021 12:26:20 -0700
Message-ID: <CAGETcx_UFLCwmqs_d5c8JY8Je9r=jy=KnELz1h91Qbrw9z+kaw@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select configs
To:     Olof Johansson <olof@lixom.net>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Will McVicker <willmcvicker@google.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
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
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 1, 2021 at 8:27 AM Olof Johansson <olof@lixom.net> wrote:
>
> On Fri, Oct 1, 2021 at 2:01 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Fri, Oct 1, 2021 at 10:19 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > On Fri, Oct 1, 2021 at 7:24 AM Saravana Kannan <saravanak@google.com> wrote:
> > > > GIC and arch timer. Basically the minimal kernel would need a timer
> > > > for the scheduler tick and IRQ controller to get the timer IRQ and the
> > > > fixed clock driver if the archtimer uses one to get its frequency and
> > > > the early UART console is pointless as a module (so build it in to
> > > > allow debugging/development).
> > > >
> > > > And then all new drivers, we should make sure are implemented as
> > > > tristate drivers. And we can go back and slowly work on converting
> > > > existing drivers to modules (community effort -- not one person or
> > > > entity) -- at least the ones where the author has hardware or ones
> > > > where the change is very likely to be correct and someone else is
> > > > willing to test it. We'll never be able to support some/all ARM32 (do
> > > > they even have a GIC/arch timer standard?), but at least for ARM64,
> > > > this seems like a viable goal.
> > >
> > > Cortex-A7/A15 and later have GIC and architectured timer, so it should
> > > work for contemporary systems.
> > > Cortex-A9 systems may have GIC, and TWD and/or Global Timer (but I've
> > > seen SoCs where the interrupt for the latter was not wired :-(.
> >
> > There are a number of well-known examples even with 64-bit chips or
> > Cortex-A7/A15 based SoCs that can't use the architected timer,
> > irqchip or iommu.
> >
> > Apple M1, Broadcom BCM283x, Samsung Exynos5 and
> > some Hisilicon server parts come to mind, I'm sure there
> > are more.
>
> There's also more and more movement towards having coprocessors with
> standardized interfaces dealing with this functionality. We're
> currently at the point where they have coprocessors with
> non-standardized interfaces, and it's useful to keep encouraging
> convergence in this area to everybody's benefit. I don't find it
> particularly useful to make life easier for the custom solutions at
> the expense of others like this patchset does, when that's (just
> beyond? on?) the horizon.
>
> > > What are the plans for other architectures?
> > > I've seen similar patches being applied for e.g. MIPS.
> >
> > There is some work in the more actively maintained MIPS
> > platforms to make those behave more like Arm/powerpc/riscv/m68k
> > platforms, using a single image and moving drivers into modules.
> > Most MIPS platforms seem unlikely to get updated to this,
> > and will continue to require a SoC specific kernel binary forever,
> > similar to the renesas superh platforms. Most of the less
> > common architectures (arc, csky, hexagon, nios2, xtensa,
> > microblaze, nds32, openrisc, sparc/leon) are way behind that
> > though, and generally don't work at all without out-of-tree
> > code.
>
> One of the arguments for needing some of these core drivers in-kernel
> is that some platforms boot at very conservative DVFS operating
> points, to a degree that you really want to turn up the CPU clocks
> fairly early during boot.
>
> If you don't have the drivers built-in, you can't do that and/or you
> create possible fragile or awkward inter-module dependencies with
> deferred probing, etc. We do care about boot time enough to prefer to
> just build them in for this reason.

Go look at a Pixel 5, we got this working just fine with all these
drivers as modules and we definitely care about boot time. You just
need to load your CPU freq driver and the other ones it needs early
on. And with fw_devlink=on (default in upstream), there's hardly any
deferred probing.

> If vmlinux binary size is a concern, maybe it's time to consider
> splitting the drivers into a bare-minimum piece that's not a module
> for early setup, and the rest that can be loaded post-boot.

Isn't this literally what I was suggesting with my
ARM64_MINIMAL_GENERIC_KERNEL suggestion? Build in all the bare minimum
drivers that are needed before module loading can happen? You'd just
select them all under that config. And any existing platform that
wants to use it would break up their drivers into modules and switch
to it.

-Saravana
