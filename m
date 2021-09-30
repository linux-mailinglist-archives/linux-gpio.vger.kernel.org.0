Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75CFC41DE71
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Sep 2021 18:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348608AbhI3QLb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 12:11:31 -0400
Received: from mail-vs1-f48.google.com ([209.85.217.48]:45707 "EHLO
        mail-vs1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348067AbhI3QLb (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Sep 2021 12:11:31 -0400
Received: by mail-vs1-f48.google.com with SMTP id x1so7958662vsp.12;
        Thu, 30 Sep 2021 09:09:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=btWh24rHyubmeV83vibGBCyrXuvNnvx5n7q6pEiaBwg=;
        b=e+hEal/YH+v4c3JlJ58MgJlhty8fAAAhrFBxL8Cbllh1DhHVKbSMcXXB/tKNPCEzmr
         0A6mhB4ThOZKcNK8s+rGArux/mFIj1a0HfEPBl131BlSJZT8G/anQl0Cfu5lj+cGcYnx
         K0uNzaHroZREherwIqcMC8TQ8GBbNr3cs7+gydEXPWz8DDAzgzjedZSEyJYSGpMZa67F
         BYN/w4yv0qFNrhhC03zDbc7/V1Pau4oRNU3RRHDcvFtAiROYyLZNKfJapfnPMpP5eymk
         zCLeIzLVmgEodxge9/wT9VpY8trX30EW0fHu2QwI7hZPUKvd1wU6Qjh6wYgvm9GDenKk
         EIHg==
X-Gm-Message-State: AOAM5305VNWk3WmrOoFARexQRwVbzcKsP0vm58FMpWdGtsNemsLswufP
        xvDr91m/1s1516ov6jrD9SQALlFyLWKac31dWpo=
X-Google-Smtp-Source: ABdhPJx2JJB9HsYLNBhd62Z2YB/HHkr4P/7Y/N+4NCRmU4zcTCZw+cQTvOZ73fbp30VbBcvWLNmTOSqHt7xcVwc7tUM=
X-Received: by 2002:a67:2c58:: with SMTP id s85mr21426vss.35.1633018187955;
 Thu, 30 Sep 2021 09:09:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com> <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <c65bf0db-6fd1-eb05-f407-37c41f9125f4@canonical.com> <YVWCK5QO331rfhJJ@google.com>
 <CAMuHMdVkF--Oq_EBRq-8Wn=E5DyOVzgSNYwo8ujf18zRCJSL9Q@mail.gmail.com>
 <YVWX1fFB1L1K3Mnn@google.com> <CAMuHMdUkP6Jg5sXAXEw7twGqPs8rKftiyh+wYomFVdRHyhUrgQ@mail.gmail.com>
 <YVWoucIlDy/klYnL@google.com>
In-Reply-To: <YVWoucIlDy/klYnL@google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 30 Sep 2021 18:09:36 +0200
Message-ID: <CAMuHMdW96DUXSWOuU3prUAt67pXNe-+CV+6igSuLLwF=k65pUA@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select configs
To:     Lee Jones <lee.jones@linaro.org>
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
        Saravana Kannan <saravanak@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rtc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Lee,

On Thu, Sep 30, 2021 at 2:08 PM Lee Jones <lee.jones@linaro.org> wrote:
> On Thu, 30 Sep 2021, Geert Uytterhoeven wrote:
> > On Thu, Sep 30, 2021 at 12:56 PM Lee Jones <lee.jones@linaro.org> wrote:
> > > On Thu, 30 Sep 2021, Geert Uytterhoeven wrote:
> > > > On Thu, Sep 30, 2021 at 11:23 AM Lee Jones <lee.jones@linaro.org> wrote:
> > > > > I've taken the liberty of cherry-picking some of the points you have
> > > > > reiteratted a few times.  Hopefully I can help to address them
> > > > > adequently.
> > > > >
> > > > > On Thu, 30 Sep 2021, Krzysztof Kozlowski wrote:
> > > > > > Reminder: these are essential drivers and all Exynos platforms must have
> > > > > > them as built-in (at least till someone really tests this on multiple
> > > > > > setups).
> > > > >
> > > > > > Therefore I don't agree with calling it a "problem" that we select
> > > > > > *necessary* drivers for supported platforms. It's by design - supported
> > > > > > platforms should receive them without ability to remove.
> > > > >
> > > > > > The selected drivers are essential for supported platforms.
> > > > >
> > > > > SoC specific drivers are only essential/necessary/required in
> > > > > images designed to execute solely on a platform that requires them.
> > > >
> > > > Why?
> > >
> > > Because without them the image wouldn't functional on any level.
> > >
> > > But you're right, there is still no requirement for it to be built-in.
> > >
> > > > > For a kernel image which is designed to be generic i.e. one that has
> > > > > the ability to boot on vast array of platforms, the drivers simply
> > > > > have to be *available*.
> > > >
> > > > If the drivers are really essential/necessary/required, this precludes
> > > > running the generic kernel image on the platform that requires them,
> > > > making the kernel not sufficiently generic.
> > >
> > > If they are not at all present, then yes.  However that is not what is
> > > being suggested.  The essential functionality will be provided.  Just
> > > not built-in.
> >
> > I really meant "essential/necessary/required to be built-in".
>
> Then I agree with you.  My position is that if they don't *have* to be
> built-in, then why force it?
>
> > > > > Forcing all H/W drivers that are only *potentially* utilised on *some*
> > > > > platforms as core binary built-ins doesn't make any technical sense.
> > > > > The two most important issues this causes are image size and a lack of
> > > > > configurability/flexibility relating to real-world application i.e.
> > > > > the one issue we already agreed upon; H/W or features that are too
> > > > > new (pre-release).
> > > >
> > > > True, if "potentially".  If not potentially, they must be included.
> > >
> > > I'm not sure what you're trying to say here.  Would you mind elaborating?
> >
> > It was a comment to your "*potentially* utilised on *some* platforms".
> > It is clear they are not used on the other ("not *some*") platforms, but your
> > sentence was unclear whether they are always or only sometimes used on
> > "*some*" platforms.
> > "always" => "not potentially"
> > "sometimes" => "potentially".
> >
> > I hope this makes it more clear.
>
> Not really, but I'll try to clean mine up:
>
> The aim is to have a single kernel (image + modules) that can be
> booted on a plethora of platforms.  For the sake of argument say 10.
> Let's also say that each of the platforms are equal and will be booted
> the same amount of times.
>
> Taking the example above, when I say that the H/W specific drivers
> will only be *potentially* utilised, I mean that they will only be
> bound and probed 1/10 times i.e. when booted on the associated
> platform.  Which means that in the vast majority of boots (9/10) they
> will lie dormant, taking up unnecessary space.
>
> Another way to say this would be; the kernel needs to have the
> capability to boot all of the supported platforms, but it will only
> ever be utilised on one at a time.

That's true even for drivers for "generic" hardware, right?
E.g. arm64 selects ARM_GIC and ARM_GIC_V3, where most (all?)
platforms have at most one of them.

> > > > > Bloating a generic kernel with potentially hundreds of unnecessary
> > > > > drivers that will never be executed in the vast majority of instances
> > > > > doesn't achieve anything.  If we have a kernel image that has the
> > > > > ability to boot on 10's of architectures which have 10's of platforms
> > > > > each, that's a whole host of unused/wasted executable space.
> > > >
> > > > The key here is if the driver is required or not to use the platform,
> > > > and why it is required.  If the requirement comes from some deficiency
> > > > in the kernel code or config system, it should be fixed, if possible.
> > > > And the fix should be tested.
> > > > If it cannot be fixed, the driver should be included, else it would
> > > > preclude running the generic kernel on the affected platform.
> > >
> > > Sorry, I'm not following.
> >
> > It all depends on why the driver is "required to be built-in".
> > Depending on the reason behind that requirement, the driver can be
> > changed from built-in to modular without ill effects on functionality.
>
> Absolutely.
>
> There are cases where drivers simply can't be built as modules.  These
> unavoidable situations are legitimate use-cases and the technology/
> code-base will have to work around these as required.
>
> The argument here is that if they can be separated and have been shown
> to work well in either use-case, then it is my opinion that placing an
> artificial barrier up based mostly on politics is not the correct
> approach.

Agreed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
