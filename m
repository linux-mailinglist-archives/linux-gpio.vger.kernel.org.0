Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E157741D71C
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Sep 2021 12:05:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349660AbhI3KG6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 06:06:58 -0400
Received: from mail-vs1-f46.google.com ([209.85.217.46]:41525 "EHLO
        mail-vs1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238316AbhI3KG5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Sep 2021 06:06:57 -0400
Received: by mail-vs1-f46.google.com with SMTP id az15so6542332vsb.8;
        Thu, 30 Sep 2021 03:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VccpeQji2hy7yWXLtaE8V95GTOfMBmicTvoIIYKCrK8=;
        b=ZSLFtkL5qFEYXffsO+19P9nahZvfOl+aQSDq1/M+nznd6OPiyUaMlusFVtMVFo9Xpc
         /Bn84jmtRSJUUYj4gZrIA0vl5CEKAYznsroc6ZN7wFV0QrHWLLEaw5S16T/R82lOgFcU
         K+H1tP00GpnCEV3Xzeaglz94gk4mx/q/XNSdV2kfyIgrks1k2zfn/tpi8OvB2EmGKtWe
         ijkXj2MDtmAoX6hu3H5N8VQgwz736MYCkCWfuzc2lSazdN5gBCUMpAFobQhQ9Q5I96IN
         ShN/TU2Ly1FeIwjLsCp0NgSiV4KWM1ymOg4iNvBEhkPlQceP76j3uylDaGAVDvEfMBYf
         yDWA==
X-Gm-Message-State: AOAM533vkGiDAZ8Nht0nkYAEcM02i6roAC36CqpI59pTvsIf6fvW4Jt7
        VbA/k370rpv7lCd93s/EPz/TvnF0LSqD9WxSf4w=
X-Google-Smtp-Source: ABdhPJzD6rww5rdym7fqYLiUgTKhLdrlVDeNx1RyAejSa9k8ku+6oJVHTD7G8k1OdOprw//5eCnEc3DVZMOf743mBRI=
X-Received: by 2002:a67:f147:: with SMTP id t7mr2290466vsm.41.1632996314406;
 Thu, 30 Sep 2021 03:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com> <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <c65bf0db-6fd1-eb05-f407-37c41f9125f4@canonical.com> <CAK8P3a0zezKvexqvL29Oc44uQq-8QG7LwZy31VYJuYAYbh-Utw@mail.gmail.com>
In-Reply-To: <CAK8P3a0zezKvexqvL29Oc44uQq-8QG7LwZy31VYJuYAYbh-Utw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 30 Sep 2021 12:05:02 +0200
Message-ID: <CAMuHMdU_VO1X=fCupgbEL77TrMjdOx0LNdjzk8nXa2skSXNDtg@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select configs
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Will McVicker <willmcvicker@google.com>,
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
        Saravana Kannan <saravanak@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rtc@vger.kernel.org, Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 30, 2021 at 11:01 AM Arnd Bergmann <arnd@arndb.de> wrote:
> On Thu, Sep 30, 2021 at 8:15 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
> > On 29/09/2021 21:48, Will McVicker wrote:
> > > On Wed, Sep 29, 2021 at 6:02 AM Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote:
> > >> What is more, it seems you entirely ignored Geert's comments. I pointed
> > >> attention to it last time and you just said you will send v2 instead of
> > >> joining discussion.
> > >>
> > >> It's a NAK for this reason - ignoring what Geert brought: you just broke
> > >> distro configs for Exynos.
> > >
> > > First off I did want to chime into the discussion from the previous
> > > patchset, but I felt that Lee and Saravana addressed all your concerns
> > > regarding the intent and feasibility. You also made it clear what the
> > > next steps were that I needed to take.
> >
> > One of the steps was problem with distros using everything as modules.
> > They should not receive these drivers as modules.
> > Reminder: these are essential drivers and all Exynos platforms must have
> > them as built-in (at least till someone really tests this on multiple
> > setups).
>
> Agreed. I absolutely love the work of the GKI developers to turn more
> drivers into loadable modules, but the "correctness-first" principle is
> not up for negotiation. If you are uncomfortable with the code or the
> amount of testing because you think it breaks something, you should
> reject the patches. Moving core platform functionality is fundamentally
> hard and it can go wrong in all possible ways where it used to work
> by accident because the init order was fixed.

Exactly.
And patches to change this that haven't been tested at all should be
very clearly marked that way.

> > > You said that upstream supports a generic
> > > kernel, but I argue that the upstream "generic" arm64 kernel can't be
> > > considered generic if it builds in SoC specific drivers that can be
> > > modules.
> >
> > Good point, but since having them as modules was not tested, I consider
> > it as theoretical topic.
>
> I actually disagree strongly with labelling the kernel as "non-generic"
> just because it requires platform specific support to be built-in rather than
> a loadable module. This has never been possible on any platform
> I'm aware of, and likely never will, except for minor variations of
> an existing platform.

There seem to be two different meanings for a "generic" kernel:
  1. To me, a generic kernel is a kernel that can boot on a variety of
     hardware platforms. and will operate correctly with all expected
     functionality.  That is, it should include[1] drivers for all that
     hardware.
     Examples of this are arm/multi_v7_defconfig and arm64/defconfig.
  2. To GKI, a generic kernel is a minimal kernel that doesn't include
     any[2] hardware-specific drivers, and has loadable modules for
     all[2] hardware-specific drivers. Before loading these modules, it
     can run an application on the CPU, but it cannot do any I/O to real
     hardware.

[1] Developers usually want the drivers builtin, distros want them
     modular.
[2] On arm/arm64, this must rely on the GIC and architectured timer
    being built-in (AFAIK these cannot be modules yet), and thus
    precludes booting on Cortex A9 and older that lack GIC and/or
    architectured timer as their primary interrupt controller and timer.
    I'm wondering how this works on other architectures with
    less-standardized interrupt controllers and timers?

> Look at x86 as an example: there are less than a dozen SoC platforms
> supported and they are incredibly similar hardware-wise, but the kernel
> is anything but "generic" in the sense that was mentioned above.
> Most of the platform specific drivers in arch/x86/platform and the
> corresponding bits in drivers/{irqchip,clocksource,iommu} are always
> built-in, and a lot more is hardwired in architecture code as PCI
> quirks or conditional on cpuid or dmi firmware checks.

Indeed. X86 has less variability in the hardware than other
architectures, and has all the critical drivers built-in or in firmware.
Where there have been big differences (remember Voyager?), x86 never
had the option to have a generic (in the meaning of 1 above) kernel
(but James did try, cfr. https://lwn.net/Articles/328469/).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
