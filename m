Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CBC8041E758
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 07:59:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352136AbhJAGBM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Oct 2021 02:01:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230494AbhJAGBF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Oct 2021 02:01:05 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AA2FC06176F
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 22:59:21 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id dn26so30511395edb.13
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 22:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Wrerzu0eOzULblqI6hcqBoW5s1gAeWyg1d4PDm0YiP0=;
        b=A7NluRHIT9P6ll142j0SyO7hXaBZ3Wm3gFiEtcJj/ODZ7DbVvi6FQp8DHFl4uUWrKE
         A2nXBJk6lYPW1woby8AUcNHisprHtXQlLNTLOA/WOTcfcZK80hQdpbmCqDBame/6jXEJ
         FF0oHRuUpBlvguQGYS73PQGq/v+OreH/y9w1Sx3xPmE0p3yFLP+pKhHODbIEYJoFu/L8
         K+2Cbayc3YOH1cR4X9ZtfjUfLYAhsAZ1XcyvoQrs3xBX1XSQdqPejrN1dslA6egxkQZQ
         Odib8NKeADHaGhHlQME8ssMuM0DjYqVmF6n3BxbLDog3ZeG9JgblBdp8bidhHQKxuVq0
         HadA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wrerzu0eOzULblqI6hcqBoW5s1gAeWyg1d4PDm0YiP0=;
        b=wOqP/ooSnQbCEHKKOXz6V91uUxeb6xuZQYe9T0emauMzIyMBaSSNvCNpw7A2LO2Ghz
         sT0+rBF5PMorLj+x6/rh/u9HlkpnzzQU5+R0x9FTNKneny+enfx71bBxv6JJN5HNWkzc
         fb721+afZ53Hfwq+fQvsfxMq1s2DNFG21IPOCLXWrlxiwV1ofOzJrd17tzKWzpplQVKy
         JuDZfMl9LnhIEEBWzAEILVKTDVmZuU5iI2L4Wzwjmid4QwqoJknXIRzorW+pQjDzBaBX
         gXN5AWFfaggrQ0keqXovJMlNobnwCclw+wHt28dz6H1GGRVsSw6w9wZnou64TrYDEvjz
         mtZA==
X-Gm-Message-State: AOAM531zZt6GI7N9k2G0IJO0Ta7q9PGrZIq2Akv5XVtZw3bNVCy2MxPj
        pHbNodAURsE0tcB+mY9Q/AuEjN4GqETLoHezNGQDTQ==
X-Google-Smtp-Source: ABdhPJzuvodcs8tct+DTVA009d4X4KLuUNmSIlwB3FnuvDUY8NEj4Xa/4ykTuUiOVGOVFV3KFGQS3R125A2/yrLz1SA=
X-Received: by 2002:a50:8405:: with SMTP id 5mr12215046edp.228.1633067959935;
 Thu, 30 Sep 2021 22:59:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com> <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <CAOesGMgSt_mYvRzF0rC=fnjMYGO9EX0_Ow2cD1d8XKLD5pHsZA@mail.gmail.com>
 <CAGETcx-b0ea-rqH+fj37sq9SLWY=+ePK94Y6rnLPuNbqFVBWmw@mail.gmail.com> <CAOesGMhQ3YsLJeQ7aUfb=0oNa3uPCx42wO1U7-ArqJTAUq1G3Q@mail.gmail.com>
In-Reply-To: <CAOesGMhQ3YsLJeQ7aUfb=0oNa3uPCx42wO1U7-ArqJTAUq1G3Q@mail.gmail.com>
From:   Will McVicker <willmcvicker@google.com>
Date:   Thu, 30 Sep 2021 22:59:04 -0700
Message-ID: <CABYd82b7umA2h=b2NTMU7X0u8ABOjMcmh5cHOH_gyWr=QeFFTA@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select configs
To:     Olof Johansson <olof@lixom.net>
Cc:     Saravana Kannan <saravanak@google.com>,
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

On Thu, Sep 30, 2021 at 10:36 PM Olof Johansson <olof@lixom.net> wrote:
>
> On Thu, Sep 30, 2021 at 10:24 PM Saravana Kannan <saravanak@google.com> wrote:
> >
> > On Thu, Sep 30, 2021 at 9:52 PM Olof Johansson <olof@lixom.net> wrote:
> > >
> > > On Wed, Sep 29, 2021 at 12:48 PM Will McVicker <willmcvicker@google.com> wrote:
> > > >
> > > > On Wed, Sep 29, 2021 at 6:02 AM Krzysztof Kozlowski
> > > > <krzysztof.kozlowski@canonical.com> wrote:
> > > > >
> > > > > On 29/09/2021 01:56, Will McVicker wrote:
> > > > > > This is v2 of the series of patches that modularizes a number of core
> > > > > > ARCH_EXYNOS drivers. Based off of the feedback from the v1 series, I have
> > > > > > modularized all of the drivers that are removed from the ARCH_EXYNOS
> > > > > > series of "select XXX". This includes setting the following configs as
> > > > > > tristate:
> > > > > >
> > > > > >  * COMMON_CLK_SAMSUNG
> > > > > >  * EXYNOS_ARM64_COMMON_CLK
> > > > > >  * PINCTRL_SAMSUNG
> > > > > >  * PINCTRL_EXYNOS
> > > > > >  * EXYNOS_PMU_ARM64
> > > > > >  * EXYNOS_PM_DOMAINS
> > > > > >
> > > > > > Additionally, it introduces the config EXYNOS_PMU_ARM64 and EXYNOS_PMU_ARM
> > > > > > which was previously EXYNOS_PMU and EXYNOS_PMU_ARM_DRIVERS respectively.
> > > > > > The reason for these new configs is because we are not able to easily
> > > > > > modularize the ARMv7 PMU driver due to built-in arch dependencies on
> > > > > > pmu_base_addr under arch/arm/mach-exynos/*. So the new configs split up
> > > > > > the ARM and ARM64 portions into two separate configs.
> > > > > >
> > > > > > Overall, these drivers didn't require much refactoring and converted to
> > > > > > modules relatively easily. However, due to my lack of exynos hardware, I
> > > > > > was not able to boot test these changes. I'm mostly concerned about the
> > > > > > CLK_OF_DECLARE() changes having dependencies on early timers. So I'm
> > > > > > requesting help for testing these changes on the respective hardware.
> > > > > >
> > > > >
> > > > > These are all not tested at all? In such case, since these are not
> > > > > trivial changes, please mark the series as RFT.
> > > > >
> > > > > I will not be able to test these for some days, so it must wait.
> > > > >
> > > > >
> > > > > Best regards,
> > > > > Krzysztof
> > > >
> > > > +Cc Arnd and Olof,
> > > >
> > > > Hi Krzysztof,
> > > >
> > > > To avoid the scrambled conversation from the first patchset, I'm going
> > > > to address all your general questions here in the cover letter thread
> > > > so that it's easier for everyone to follow and reference in the
> > > > future.
> > >
> > > This patchset shouldn't go in.
> > >
> > > GKI is a fantastic effort, since it finally seems like Google has the
> > > backbone to put pressure on the vendors to upstream all their stuff.
> > >
> > > This patcheset dilutes and undermines all of that by opening up a
> > > truck-size loophole, reducing the impact of GKI, and overall removes
> > > leverage to get vendors to do the right thing.
> > >
> > > It's against our interest as a community to have this happen, since
> > > there's no other reasonably justifiable reason to do this.

Are you saying that modularizing drivers is opening up a loophole? How
is this different from Krysztof pushing changes to modularize the
Exynos ChipId driver just last week [1].  I understand the push back
on "these aren't tested yet" and I agree that we should not merge them
until they are (I've re-iterated that multiple times and have
requested for testing help multiple times since I can't get my hands
on any Exynos arm64 hardware), but are you saying that if I gather the
test data to prove that these drivers can actually be made into
modules that you will still deny them out of the interest of the
community?

[1] https://lore.kernel.org/linux-samsung-soc/4aee1b0d-91a1-75ac-d2b7-6dab3d7a301f@kernel.org/T/#t

--Will

>
> >
> > Oolf, Geert, Krzysztof, Arnd,
>
> So close.
>
> > I skimmed through the emails and you all make a lot of good points.
>
> I skimmed through this email and I think it adds a lot of new
> complexity and fragility to solve a problem that doesn't really exist
> for upstream, adding yet more config parameter combinations to build
> and test for.
>
> A much more valuable approach would be to work towards being able to
> free up memory by un-probed drivers at the end of boot. That would
> possibly benefit all platforms on all architectures.
>
>
> -Olof
