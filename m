Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E52E41E75F
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 08:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351885AbhJAGFJ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Oct 2021 02:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230488AbhJAGFH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Oct 2021 02:05:07 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B634AC06176A
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 23:03:23 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id s64so15203474yba.11
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 23:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4XHFyIl24a8InBUxS3yTnWfbC5yODh0CS5vqQSj8r7g=;
        b=gQb+46RHjbWREUXxN64U8JEMZdkik3KQ6z1iNq6hiwe3ia9IRlhK/cIzlRCm6yLI3j
         Ov5JSv8j9zBf0hsJXFJuuKPE28Xt1yGKNrngUU1wW/ld2e1sbIqalKLlnWlQBJN5LrEz
         pCRAR95DiSNnLkQ+GHifeJWamz9f6kzVs01jYGK2Tq/9c+fkKloFE/aAtHv1JP84z9pN
         YOmEkZ9MgXjJVHoKJzhQ25qVxZbfCM8XuA4REKHKJ1Es6S9ZC5MFlxdTFWER6/aFZ1rM
         xh2qq6tt5iC3NH2SYC7WKi9pPL06sFWYUKHD1C1ZvMSsdwLkPJgxlvkoE7K3X0oFVc9K
         glPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4XHFyIl24a8InBUxS3yTnWfbC5yODh0CS5vqQSj8r7g=;
        b=gDE+UECgr6GzHPE39cDM/Wuv2tL55yQEYcRhJJrB4khmaIOK8saKgXBQzWelf9dnVx
         RAmlXE+IPbWF7voc4x5g2XWTQwXAuGr1zI1fg+LYZwkuRTNsSIE6dDSDbvRqgK7xoPAQ
         cA/GcrT0RB1g6BWelfjFpc+y8xUD+Q15/tC55xPdMpImBulLPBKi7hS4SHlfjBm5hGFc
         f4NxN+Sp0lHdOsVpSj7Hh//As2kctyd2kxzy8/59mlQ0TPeUrVxRfKH2Pflce0G1jW4K
         Vyq2S2Zq5re/yQZuHiKDZYyzaUAAnZaVrs9fvkKXSLkbNjleHyFwLzC6nVWdvYh5Piy2
         Sj5g==
X-Gm-Message-State: AOAM532Odg6vjgJqtl43aDLAUbVApfmGAr4Yvnv4ZmKhlzngSB35XD1X
        jKb64YaO01QAFDiyJLYQp0gMVr33kKSmPb5eLyyh/A==
X-Google-Smtp-Source: ABdhPJx9japD4n+j+WHfnlr43J1D/KYK6bUrrEfX6nuXVSP7c4eyGu0nzECvXcHIoHBBuvGtgM2VdN5ovzRACmJk+Uc=
X-Received: by 2002:a5b:783:: with SMTP id b3mr3850649ybq.328.1633068202700;
 Thu, 30 Sep 2021 23:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com> <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <CAOesGMgSt_mYvRzF0rC=fnjMYGO9EX0_Ow2cD1d8XKLD5pHsZA@mail.gmail.com>
 <CAGETcx-b0ea-rqH+fj37sq9SLWY=+ePK94Y6rnLPuNbqFVBWmw@mail.gmail.com> <CAOesGMhQ3YsLJeQ7aUfb=0oNa3uPCx42wO1U7-ArqJTAUq1G3Q@mail.gmail.com>
In-Reply-To: <CAOesGMhQ3YsLJeQ7aUfb=0oNa3uPCx42wO1U7-ArqJTAUq1G3Q@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 30 Sep 2021 23:02:46 -0700
Message-ID: <CAGETcx_k2-mo9oUcYhsXhhsazLdwbifjP7ZT8pvyEbWB5k_qQg@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select configs
To:     Olof Johansson <olof@lixom.net>
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
> >
> > Oolf, Geert, Krzysztof, Arnd,
>
> So close.

I'm sorry, it's pretty late here and I'm sleepy and messed it up.

>
> > I skimmed through the emails and you all make a lot of good points.
>
> I skimmed through this email and I think it adds a lot of new
> complexity and fragility to solve a problem that doesn't really exist
> for upstream, adding yet more config parameter combinations to build
> and test for.

How is this not an upstream problem? Having a minimal kernel with as
many drivers as modules is of interest to upstream. And what's the
complexity in having a config to easily disable a bunch of configs?
The new config gives a clear config against which new
platforms/systems should be developed against.

>
> A much more valuable approach would be to work towards being able to
> free up memory by un-probed drivers at the end of boot. That would
> possibly benefit all platforms on all architectures.

Sure it would help memory after boot, but it won't help with size on
"disk", kernel load time, etc. And some of the devices have very tight
boot requirements. Think battery operated outdoor cameras for example.

-Saravana
