Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6152341E94D
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 11:01:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229710AbhJAJCx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Oct 2021 05:02:53 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:45923 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbhJAJCw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Oct 2021 05:02:52 -0400
Received: from mail-ot1-f48.google.com ([209.85.210.48]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MLzSD-1mEq7W0X7B-00HyMA; Fri, 01 Oct 2021 11:01:07 +0200
Received: by mail-ot1-f48.google.com with SMTP id d12-20020a05683025cc00b0054d8486c6b8so10758832otu.0;
        Fri, 01 Oct 2021 02:01:05 -0700 (PDT)
X-Gm-Message-State: AOAM530tA9E/DBh8gxWxVqEaJoCEyKpxu2zRsjoBEX4XuoqtVKc7TQeX
        Jn1naToK570DFt4sZhNvWzBVRIKcp0A9IGQrI2g=
X-Google-Smtp-Source: ABdhPJwrrQqEv7F64oGZsF1JyOHej2llconZfQnraWBbfjZa9qDw+1LcpZbSuxEjvbdlBxeUtpphqB+NhSpYIemm5VI=
X-Received: by 2002:a05:6830:1098:: with SMTP id y24mr8865313oto.368.1633078864794;
 Fri, 01 Oct 2021 02:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com> <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <CAOesGMgSt_mYvRzF0rC=fnjMYGO9EX0_Ow2cD1d8XKLD5pHsZA@mail.gmail.com>
 <CAGETcx-b0ea-rqH+fj37sq9SLWY=+ePK94Y6rnLPuNbqFVBWmw@mail.gmail.com> <CAMuHMdWhCB_zg6TwjYfz+=vc+_Wd5yzuAAzk=2ToZOQSAyaiJA@mail.gmail.com>
In-Reply-To: <CAMuHMdWhCB_zg6TwjYfz+=vc+_Wd5yzuAAzk=2ToZOQSAyaiJA@mail.gmail.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 1 Oct 2021 11:00:47 +0200
X-Gmail-Original-Message-ID: <CAK8P3a10R-Q8hB-piH_QT0hzkaAZTczLbM=6WmgoMHYL8EhZ4g@mail.gmail.com>
Message-ID: <CAK8P3a10R-Q8hB-piH_QT0hzkaAZTczLbM=6WmgoMHYL8EhZ4g@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select configs
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Saravana Kannan <saravanak@google.com>,
        Olof Johansson <olof@lixom.net>,
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
        linux-rtc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:2o479mjNuqx9rSf+ILcfJiGayRTmk3TpFQEUm6/l6HEDCHqUdKC
 8jsKFJo65wFllF9QPd9sLL3zQsguOGOD2E8GRyRyAigAiJEyW1KsfbdHmIc6p6M5LpUhcqP
 D+PT0dBPXZGUQrIIWpg10RPZzZ82rLqgEVuRE7oHI0l0rq8OMRRS49BECCF5dSuCFRXpcXJ
 SUfmCaP36khl/5Sy/qOmw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+PYnIXbz9l0=:QrrVsjwcxCMWz4tkKQSG1f
 yctEFJwYuE+qfwxpNd/uBGeiLUXSXDhwJtHDKSCAvgyiMdjV7mHyctGP/3by+ISy3q54FWqMh
 WVX+VIRrmwAbZ/oaWl7pys5/S0De7+ES54WydVvCbmQWqJeSZVMl5FFkngsb1L+BN9oRkVjzb
 l6mc2gUStAQ/iDUxMEtE6ziERCbE6to6fGdav8ggMsSEjmcBh1dhxseOnf2gg5vsJGYNc1cfz
 VZp6NknsRuRYmc0YbiqKjnwHq6tBMtRsSre9og4NxYd7DFVFqBJF8FkrZUSeW6urlrTIrAkCl
 GD0W4yu1SC3nw8SIu9CHC50MRE4qvszzCQNCEE2ycpXIrz0m2iUnIqdD3KYMX193r8aOnphAr
 Md+HK30Yb0Yt0AKXlQ8Ku6MFZEnnqbyjVFn91grh5//OBeVpDHTljZ/0qbCwGUfcVii716VAw
 UHt5DUUbCYxQ0T1pq7p3qwZSvJoy1fNE8up7snksLxr15hY+yIESjxNOpZoys0ORe7tGXAl9w
 2yP4JF4gsfagAp/4UaVot1epAKhbZlhIB/KjxUlIcEZg9LlKaXE7qQnNHmFOZdBvcddACMZ6g
 MpE3PsPaPwPo6ORCdvcJx1YDB8vWWlK3QRsbmrG4iKgjE/c3fdeHN9OoH/9RdDkusJ2+TigHd
 QIwjQBINwnIXm7+i9q0itajTdm3TnJr4wY/nATq/H3g6yeKF2WLZVlAEjpHrjLfaQ3HL/wYz/
 m2tOiNXKaXaJuJGyCTfrINOgzU1YUhMg+KEDcQ==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 1, 2021 at 10:19 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> On Fri, Oct 1, 2021 at 7:24 AM Saravana Kannan <saravanak@google.com> wrote:
> > GIC and arch timer. Basically the minimal kernel would need a timer
> > for the scheduler tick and IRQ controller to get the timer IRQ and the
> > fixed clock driver if the archtimer uses one to get its frequency and
> > the early UART console is pointless as a module (so build it in to
> > allow debugging/development).
> >
> > And then all new drivers, we should make sure are implemented as
> > tristate drivers. And we can go back and slowly work on converting
> > existing drivers to modules (community effort -- not one person or
> > entity) -- at least the ones where the author has hardware or ones
> > where the change is very likely to be correct and someone else is
> > willing to test it. We'll never be able to support some/all ARM32 (do
> > they even have a GIC/arch timer standard?), but at least for ARM64,
> > this seems like a viable goal.
>
> Cortex-A7/A15 and later have GIC and architectured timer, so it should
> work for contemporary systems.
> Cortex-A9 systems may have GIC, and TWD and/or Global Timer (but I've
> seen SoCs where the interrupt for the latter was not wired :-(.

There are a number of well-known examples even with 64-bit chips or
Cortex-A7/A15 based SoCs that can't use the architected timer,
irqchip or iommu.

Apple M1, Broadcom BCM283x, Samsung Exynos5 and
some Hisilicon server parts come to mind, I'm sure there
are more.

> What are the plans for other architectures?
> I've seen similar patches being applied for e.g. MIPS.

There is some work in the more actively maintained MIPS
platforms to make those behave more like Arm/powerpc/riscv/m68k
platforms, using a single image and moving drivers into modules.
Most MIPS platforms seem unlikely to get updated to this,
and will continue to require a SoC specific kernel binary forever,
similar to the renesas superh platforms. Most of the less
common architectures (arc, csky, hexagon, nios2, xtensa,
microblaze, nds32, openrisc, sparc/leon) are way behind that
though, and generally don't work at all without out-of-tree
code.

      Arnd
