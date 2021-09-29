Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 987A341CCDA
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Sep 2021 21:48:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345390AbhI2TuC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Sep 2021 15:50:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345332AbhI2TuA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Sep 2021 15:50:00 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D79C061765
        for <linux-gpio@vger.kernel.org>; Wed, 29 Sep 2021 12:48:17 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id g7so12820518edv.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Sep 2021 12:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3th2hUjvmiLPXNLmRnZX/EchQR6aXc4YsFVE304670Q=;
        b=IaYLjPbFd6hwOEKnD3borADXZUAdBFhcU7NQsIc83/Kmivk0MUFZHiLULqzAcZwoYH
         qgly0aAYe4/jrm2dq+AAqH7xrXWTyOu873UoXqA9WMnouuXtrzKdnoLmt/25r2KCYSmy
         JlExGC4JrIen5ukSpZnE5amYh6LCDJ0KQ1XpqVsmk2ejUkv8+jPHPVjKyAOC5Cz4qgpY
         6bT2hVDCBfl9XAYzeR2N0NKYwspYQ9NwfPoMneZu0g8DOzqtaKxaOPwB9oJPa4keQvv2
         2kdnMxrbE2qa97FpIqy4/AppfVkBDN2apsainGdq2uZcZchTkzZ+wH5+vQ5O50wkEC4u
         CZqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3th2hUjvmiLPXNLmRnZX/EchQR6aXc4YsFVE304670Q=;
        b=NpJDnRPOShkCB0K9nETIwZErfFxPEJJOBuiIIsQnMHgwZJj+b+iyKkGxSuetBcwPt3
         A+D+Ix5t7G/+FIdCFsI17iKwYF60PQA7KzGjABQh6Fh/xpqKl+7dFNfrIyRPCeQ76/rs
         qa2Tey8PQHwcJfxupLsLul1GF1o6idxSNoMZX7SiLHGY4kh7wuXXDtxUFSnV/46caPvE
         nWorij7zj+BMRAd2Q98Vo5HtLhv3M0nutuOvvsWuhDDJN49iwKUhuaHRnu3CcuY0zzNz
         UCKMBGHgfn36k2SDr8vDKu8fubBS/IbOBKczlhbhVS8qClJ0LHodCT3rjqtVjz7X6LXw
         Imhw==
X-Gm-Message-State: AOAM533e4fYuTIxwEUvkBEbkqiDksyHwKn6SnjsVo2/Mn8uzIkVHV34y
        lC4qviao/7jTstYjgUbeUVfktDM/9iRmxgzo7nUNmg==
X-Google-Smtp-Source: ABdhPJzXsuFmp5jw2/gm+EE7SK7HrZyR0YkqtXCspdsR4fqquN6AoJLxVqpUYBYuw+OkilrsfXKcWu9Sh8ae4M6O/gs=
X-Received: by 2002:a17:906:fa8c:: with SMTP id lt12mr1832859ejb.204.1632944896124;
 Wed, 29 Sep 2021 12:48:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com> <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com>
In-Reply-To: <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com>
From:   Will McVicker <willmcvicker@google.com>
Date:   Wed, 29 Sep 2021 12:48:00 -0700
Message-ID: <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select configs
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Russell King <linux@armlinux.org.uk>,
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
        Saravana Kannan <saravanak@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 29, 2021 at 6:02 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 29/09/2021 01:56, Will McVicker wrote:
> > This is v2 of the series of patches that modularizes a number of core
> > ARCH_EXYNOS drivers. Based off of the feedback from the v1 series, I have
> > modularized all of the drivers that are removed from the ARCH_EXYNOS
> > series of "select XXX". This includes setting the following configs as
> > tristate:
> >
> >  * COMMON_CLK_SAMSUNG
> >  * EXYNOS_ARM64_COMMON_CLK
> >  * PINCTRL_SAMSUNG
> >  * PINCTRL_EXYNOS
> >  * EXYNOS_PMU_ARM64
> >  * EXYNOS_PM_DOMAINS
> >
> > Additionally, it introduces the config EXYNOS_PMU_ARM64 and EXYNOS_PMU_ARM
> > which was previously EXYNOS_PMU and EXYNOS_PMU_ARM_DRIVERS respectively.
> > The reason for these new configs is because we are not able to easily
> > modularize the ARMv7 PMU driver due to built-in arch dependencies on
> > pmu_base_addr under arch/arm/mach-exynos/*. So the new configs split up
> > the ARM and ARM64 portions into two separate configs.
> >
> > Overall, these drivers didn't require much refactoring and converted to
> > modules relatively easily. However, due to my lack of exynos hardware, I
> > was not able to boot test these changes. I'm mostly concerned about the
> > CLK_OF_DECLARE() changes having dependencies on early timers. So I'm
> > requesting help for testing these changes on the respective hardware.
> >
>
> These are all not tested at all? In such case, since these are not
> trivial changes, please mark the series as RFT.
>
> I will not be able to test these for some days, so it must wait.
>
>
> Best regards,
> Krzysztof

+Cc Arnd and Olof,

Hi Krzysztof,

To avoid the scrambled conversation from the first patchset, I'm going
to address all your general questions here in the cover letter thread
so that it's easier for everyone to follow and reference in the
future.

>What is more, it seems you entirely ignored Geert's comments. I pointed
>attention to it last time and you just said you will send v2 instead of
>joining discussion.
>
>It's a NAK for this reason - ignoring what Geert brought: you just broke
>distro configs for Exynos.

First off I did want to chime into the discussion from the previous
patchset, but I felt that Lee and Saravana addressed all your concerns
regarding the intent and feasibility. You also made it clear what the
next steps were that I needed to take.

>Please also explain why Exynos is so special that we deviate from the
>policy for all SoC that critical SoC-related drivers have to be enabled
>(built-in or as module).

I am not actually changing ANY default build configurations here and
I'm not removing any existing configuration. I tried to make it pretty
clear in my original patch series commit messages that none of my
changes modify the default behavior. The .config is the same with and
without my patches. All of these drivers remain enabled as built-in.
So if there is a distro that requires all of these drivers to be
built-in, then they can continue as is without noticing any
difference. IOW, all of these changes are/should be backwards
compatible.

I really appreciate yours and John Stultz's comments regarding
including the "why" in my commit message wording. I will spend more
time on the next series on trying to write a more meaningful commit
message, but before that we can surely discuss the "why" here.

As mentioned by Lee and Saravana, our common goal is to make it easier
for everyone to contribute upstream. In particular, this series of
patches is laying the ground work for distros to have more flexibility
in supporting a wider range of platforms without forcing everyone to
include unnecessary drivers. You said that upstream supports a generic
kernel, but I argue that the upstream "generic" arm64 kernel can't be
considered generic if it builds in SoC specific drivers that can be
modules. This patch series is addressing exactly that -- allow distros
to move SoC specific drivers out of the core kernel and into modules.
Ultimately, our goal is to be able to directly develop with the
upstream kernel on new and old SoCs by not including SoC specific
drivers in our generic kernel distro. This helps the upstream
community in a number of ways:

(1) It makes the ARM64 generic kernel smaller by converting more
drivers into modules
(2) It makes it a lot easier for everyone to develop upstream if they
can directly use the upstream kernel without carrying downstream
changes.

>Even if there was, I think it is good to have dependencies like
>ARCH_EXYNOS, as they let us partition the (19000, as Arnd said recently)
>Kconfig symbols into better manageable groups.  Without these, we cannot
>do better than "depends on ARM || ARM64 || COMPILE_TEST".

My patch series still keeps the dependencies on ARCH_EXYNOS. I am
totally fine with "depends on ARCH_EXYNOS" and totally fine with
"default ARCH_EXYNOS". The problem we have is that ARCH_EXYNOS
forcefully selects SoC specific drivers to be built-in because it just
adds more and more SoC-specific drivers to a generic kernel.

I know you are asking for me to only push changes that have proven to
work. The theory behind these changes has been proven downstream on
other devices and I'm more than willing to help debug any issues that
arise out of this patch series, but since I don't have the hardware
myself I do need help with device testing these changes. We are not
trying to trick upstream in anyway to accept something that is not
functional or going to hurt the upstream community. I am more than
willing to help upstream and am totally willing to work with upstream
to verify all of these changes before they are accepted (feel free to
send me any dusty, unused hardware lying around if you want the extra
help with device testing).

I hope that helps clarifies things! I will address other patch
specific comments in those threads as well.

Thanks,
Will
