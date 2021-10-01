Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79F7441E740
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 07:36:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351961AbhJAFh5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Oct 2021 01:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351785AbhJAFhx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Oct 2021 01:37:53 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A953C06176D
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 22:36:10 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id c4so5580493pls.6
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 22:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lwPyxDqaGBhT92QACUI/bh+VkUYF5Oo/5CIkAxgdtZ0=;
        b=x4+eS/mPHFSaWAR3xsBgO23T1i0mXQSg5zBlZyUWrRmossN4sDE/RgApQuGNJSyKlx
         LRsdEA+fHhNG7b37ubODdSxT8Bf61fc21oJV4cGXpJkBnDvVg9UMLor5aANUxLMedr2U
         +4HtKL/belqPrhzcWZUz40RVVQaz/86inqcF15fBdN0ujQStvUBFnBY3/Z9OOntVQa+5
         BbeZX0aEr6/mohhEefytrMODC7pyF+qHZR1t4VPvZGC75jGvIy9pllZ1e1zV6aIbzo8P
         ED8gZPdtk/O1HyOl+alpfG38L+LhsnZN6H74QHGaNOZIdj3Bu+r/bbX89ffqFthfzbgn
         6A6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lwPyxDqaGBhT92QACUI/bh+VkUYF5Oo/5CIkAxgdtZ0=;
        b=vTpvdm44QMlaWPFbYMgc0jHUJcJKAcJ/nzqRfHyovq6K9uAd82nbxftDcyHQmqOWyM
         80Kxc2T0FkoVMKN7ocDbF+0DhD4brLOdmE/djKP68DWfPRwERy7OwUEO/ma+BiqLNG65
         R3yljT2GT1D87eAA7PGSTXkhoavdNZ0lb8bdCFhu5B5XXijZu+BZU2/2s4O3sFnvTO3Y
         SAJYWuxF+gGoYXt8glpYDefNPXvSuXRt7/mz8FEs0MVsq61tO/EnCMDyY16sJpDa3WSU
         AjrVX8cNMWCD4e20jO4ddoKyqxhyeha52WxexCvXvHinQGEHgjkh9Gmp+RiJt3znDA/I
         T6LQ==
X-Gm-Message-State: AOAM5307SuSbdRO64kHwnwVX8jL2yRJnW8s+HuZSByuYLvD94STmey+D
        Ai4v4X1E0OJi950yT//EUlkeQP0oS3H2uD1S9uy2vA==
X-Google-Smtp-Source: ABdhPJyXrHEjSRsbvGuDy1U26vszb5TEBTH/srDHAuSr9YR7iT8IG7gbwvXgl1d4rlALNdae0jk7Dkp7FchFO9bSadM=
X-Received: by 2002:a17:90a:9317:: with SMTP id p23mr11101909pjo.151.1633066567459;
 Thu, 30 Sep 2021 22:36:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com> <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <CAOesGMgSt_mYvRzF0rC=fnjMYGO9EX0_Ow2cD1d8XKLD5pHsZA@mail.gmail.com> <CAGETcx-b0ea-rqH+fj37sq9SLWY=+ePK94Y6rnLPuNbqFVBWmw@mail.gmail.com>
In-Reply-To: <CAGETcx-b0ea-rqH+fj37sq9SLWY=+ePK94Y6rnLPuNbqFVBWmw@mail.gmail.com>
From:   Olof Johansson <olof@lixom.net>
Date:   Thu, 30 Sep 2021 22:35:55 -0700
Message-ID: <CAOesGMhQ3YsLJeQ7aUfb=0oNa3uPCx42wO1U7-ArqJTAUq1G3Q@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select configs
To:     Saravana Kannan <saravanak@google.com>
Cc:     Will McVicker <willmcvicker@google.com>,
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
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 30, 2021 at 10:24 PM Saravana Kannan <saravanak@google.com> wrote:
>
> On Thu, Sep 30, 2021 at 9:52 PM Olof Johansson <olof@lixom.net> wrote:
> >
> > On Wed, Sep 29, 2021 at 12:48 PM Will McVicker <willmcvicker@google.com> wrote:
> > >
> > > On Wed, Sep 29, 2021 at 6:02 AM Krzysztof Kozlowski
> > > <krzysztof.kozlowski@canonical.com> wrote:
> > > >
> > > > On 29/09/2021 01:56, Will McVicker wrote:
> > > > > This is v2 of the series of patches that modularizes a number of core
> > > > > ARCH_EXYNOS drivers. Based off of the feedback from the v1 series, I have
> > > > > modularized all of the drivers that are removed from the ARCH_EXYNOS
> > > > > series of "select XXX". This includes setting the following configs as
> > > > > tristate:
> > > > >
> > > > >  * COMMON_CLK_SAMSUNG
> > > > >  * EXYNOS_ARM64_COMMON_CLK
> > > > >  * PINCTRL_SAMSUNG
> > > > >  * PINCTRL_EXYNOS
> > > > >  * EXYNOS_PMU_ARM64
> > > > >  * EXYNOS_PM_DOMAINS
> > > > >
> > > > > Additionally, it introduces the config EXYNOS_PMU_ARM64 and EXYNOS_PMU_ARM
> > > > > which was previously EXYNOS_PMU and EXYNOS_PMU_ARM_DRIVERS respectively.
> > > > > The reason for these new configs is because we are not able to easily
> > > > > modularize the ARMv7 PMU driver due to built-in arch dependencies on
> > > > > pmu_base_addr under arch/arm/mach-exynos/*. So the new configs split up
> > > > > the ARM and ARM64 portions into two separate configs.
> > > > >
> > > > > Overall, these drivers didn't require much refactoring and converted to
> > > > > modules relatively easily. However, due to my lack of exynos hardware, I
> > > > > was not able to boot test these changes. I'm mostly concerned about the
> > > > > CLK_OF_DECLARE() changes having dependencies on early timers. So I'm
> > > > > requesting help for testing these changes on the respective hardware.
> > > > >
> > > >
> > > > These are all not tested at all? In such case, since these are not
> > > > trivial changes, please mark the series as RFT.
> > > >
> > > > I will not be able to test these for some days, so it must wait.
> > > >
> > > >
> > > > Best regards,
> > > > Krzysztof
> > >
> > > +Cc Arnd and Olof,
> > >
> > > Hi Krzysztof,
> > >
> > > To avoid the scrambled conversation from the first patchset, I'm going
> > > to address all your general questions here in the cover letter thread
> > > so that it's easier for everyone to follow and reference in the
> > > future.
> >
> > This patchset shouldn't go in.
> >
> > GKI is a fantastic effort, since it finally seems like Google has the
> > backbone to put pressure on the vendors to upstream all their stuff.
> >
> > This patcheset dilutes and undermines all of that by opening up a
> > truck-size loophole, reducing the impact of GKI, and overall removes
> > leverage to get vendors to do the right thing.
> >
> > It's against our interest as a community to have this happen, since
> > there's no other reasonably justifiable reason to do this.
>
> Oolf, Geert, Krzysztof, Arnd,

So close.

> I skimmed through the emails and you all make a lot of good points.

I skimmed through this email and I think it adds a lot of new
complexity and fragility to solve a problem that doesn't really exist
for upstream, adding yet more config parameter combinations to build
and test for.

A much more valuable approach would be to work towards being able to
free up memory by un-probed drivers at the end of boot. That would
possibly benefit all platforms on all architectures.


-Olof
