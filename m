Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 744DF41F133
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 17:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232344AbhJAP27 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Oct 2021 11:28:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232086AbhJAP27 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Oct 2021 11:28:59 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A26D0C06177E
        for <linux-gpio@vger.kernel.org>; Fri,  1 Oct 2021 08:27:14 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id qe4-20020a17090b4f8400b0019f663cfcd1so3124195pjb.1
        for <linux-gpio@vger.kernel.org>; Fri, 01 Oct 2021 08:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NDBF0d4bKXIj7mL5yYNHBXYAg7HQa1G1QOL0lrIIjuQ=;
        b=vyCE1SjTyUO59YshqoxCZREYCGmX1MLlD2wPH86txBGh9li4OkL1kVFk49gHlm1VaD
         ftZLw4tkzhpF5hlX2FiAddEp3MvH4L4Fg1Mu1TLOsaieKla+AmpvH5c4iQ3aOZdX7oJz
         J/pGhZFBosmhuydsPFT3/19gQUVWyqr0eY8Ghyjckm8+STHJ+H6Q3LINLYMkm4Tb/VWo
         NQFkzjZU7JhIkTJrzj0vuwTjz49j6dfiPPG5QsH1KGBsWpu6suruD2Zoqy6ujUV0mXRr
         zpx/0+szWfgVfjxzN57nEoskVnF5Aq/8+LXxY5e8sLc4+/IuGcxQc+oC0D/0qQqUcHIX
         l9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NDBF0d4bKXIj7mL5yYNHBXYAg7HQa1G1QOL0lrIIjuQ=;
        b=7IOOOX+Ds/F1XF1TLG+YajE/giTEsrFW2zw1V2Hxqoxby2xD6LBfdY1YbTX2OJrjpX
         8GEIM3B6+xVlRPi0ru4mfFItcaIlDK/n6DaAjt6LkEdkjDQWRyLrFKtw16KDv58hs3gr
         bVcOse0LQndJPHmZA9fOy9tapLLk9TmkS20PW/ZB+ST/rcbuTIGBEvZfx4w8osNTtgIR
         z9SMVipv9rcoaCffv1kjCkSG/plZ+9kp7RE3ArJSC3AgujgSDEhByRQeJl4XZfeSLks1
         nYGcUzXGTM0IOyGoHe94MKWL1dk12maJVRhI/TGsBRBa04Xtp/bzlsehWTWVdvxJEm/x
         4dFQ==
X-Gm-Message-State: AOAM530q/BvWd8Poiobf3rnD7CTtf7jbsTta3GNo9hdBAdR0vOxevrS8
        62MHgkqNWAaje2YrGSdnzTd3GPUvyW6Gw60Uy/f1hA==
X-Google-Smtp-Source: ABdhPJw+H/uBI4TBsasR8eBHLbgky559HD5gbdguuPNsq60YvUyVD3gt7UgsIT81kS73NIa4qmiR13/eOF+1CUlO760=
X-Received: by 2002:a17:902:c193:b0:13e:8e77:6c82 with SMTP id
 d19-20020a170902c19300b0013e8e776c82mr1802110pld.29.1633102033855; Fri, 01
 Oct 2021 08:27:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com> <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <CAOesGMgSt_mYvRzF0rC=fnjMYGO9EX0_Ow2cD1d8XKLD5pHsZA@mail.gmail.com>
 <CAGETcx-b0ea-rqH+fj37sq9SLWY=+ePK94Y6rnLPuNbqFVBWmw@mail.gmail.com>
 <CAMuHMdWhCB_zg6TwjYfz+=vc+_Wd5yzuAAzk=2ToZOQSAyaiJA@mail.gmail.com> <CAK8P3a10R-Q8hB-piH_QT0hzkaAZTczLbM=6WmgoMHYL8EhZ4g@mail.gmail.com>
In-Reply-To: <CAK8P3a10R-Q8hB-piH_QT0hzkaAZTczLbM=6WmgoMHYL8EhZ4g@mail.gmail.com>
From:   Olof Johansson <olof@lixom.net>
Date:   Fri, 1 Oct 2021 08:27:02 -0700
Message-ID: <CAOesGMhHK7Z8Ki+UFRi24dXTdk4=YC6ExneOnfkVmG2HFiVMKw@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select configs
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
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

On Fri, Oct 1, 2021 at 2:01 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Fri, Oct 1, 2021 at 10:19 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Fri, Oct 1, 2021 at 7:24 AM Saravana Kannan <saravanak@google.com> wrote:
> > > GIC and arch timer. Basically the minimal kernel would need a timer
> > > for the scheduler tick and IRQ controller to get the timer IRQ and the
> > > fixed clock driver if the archtimer uses one to get its frequency and
> > > the early UART console is pointless as a module (so build it in to
> > > allow debugging/development).
> > >
> > > And then all new drivers, we should make sure are implemented as
> > > tristate drivers. And we can go back and slowly work on converting
> > > existing drivers to modules (community effort -- not one person or
> > > entity) -- at least the ones where the author has hardware or ones
> > > where the change is very likely to be correct and someone else is
> > > willing to test it. We'll never be able to support some/all ARM32 (do
> > > they even have a GIC/arch timer standard?), but at least for ARM64,
> > > this seems like a viable goal.
> >
> > Cortex-A7/A15 and later have GIC and architectured timer, so it should
> > work for contemporary systems.
> > Cortex-A9 systems may have GIC, and TWD and/or Global Timer (but I've
> > seen SoCs where the interrupt for the latter was not wired :-(.
>
> There are a number of well-known examples even with 64-bit chips or
> Cortex-A7/A15 based SoCs that can't use the architected timer,
> irqchip or iommu.
>
> Apple M1, Broadcom BCM283x, Samsung Exynos5 and
> some Hisilicon server parts come to mind, I'm sure there
> are more.

There's also more and more movement towards having coprocessors with
standardized interfaces dealing with this functionality. We're
currently at the point where they have coprocessors with
non-standardized interfaces, and it's useful to keep encouraging
convergence in this area to everybody's benefit. I don't find it
particularly useful to make life easier for the custom solutions at
the expense of others like this patchset does, when that's (just
beyond? on?) the horizon.

> > What are the plans for other architectures?
> > I've seen similar patches being applied for e.g. MIPS.
>
> There is some work in the more actively maintained MIPS
> platforms to make those behave more like Arm/powerpc/riscv/m68k
> platforms, using a single image and moving drivers into modules.
> Most MIPS platforms seem unlikely to get updated to this,
> and will continue to require a SoC specific kernel binary forever,
> similar to the renesas superh platforms. Most of the less
> common architectures (arc, csky, hexagon, nios2, xtensa,
> microblaze, nds32, openrisc, sparc/leon) are way behind that
> though, and generally don't work at all without out-of-tree
> code.

One of the arguments for needing some of these core drivers in-kernel
is that some platforms boot at very conservative DVFS operating
points, to a degree that you really want to turn up the CPU clocks
fairly early during boot.

If you don't have the drivers built-in, you can't do that and/or you
create possible fragile or awkward inter-module dependencies with
deferred probing, etc. We do care about boot time enough to prefer to
just build them in for this reason.

If vmlinux binary size is a concern, maybe it's time to consider
splitting the drivers into a bare-minimum piece that's not a module
for early setup, and the rest that can be loaded post-boot.


-Olof
