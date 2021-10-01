Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3353941E720
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 07:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352031AbhJAF0N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Oct 2021 01:26:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352015AbhJAF0M (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Oct 2021 01:26:12 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71B8DC061770
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 22:24:28 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id b82so18086347ybg.1
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 22:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kId/COeOhh/kAGgHulJk60MONB+eztrTX08okhKullo=;
        b=cGy18vWBa0ueLqC6hy/hY+Gl8ugqs8nZ9HOgwS0q3vSxnubUwp9AKg16RlXsP//Zfn
         biil/+kdD9wfBLn0BonGUxxwvlrTPBsn+KRF1IUSnRgINEoJODQwllQ+oSiNbIFWQpEg
         HOVowzx8zz1wLgXRLZKQKLzmPeGryZ+mDkDZHWggA0Hfs/ErLY9u6vpppMH/17DckRpO
         n0nropukwD7U8SnA4Dnk8lsTF3T0l+aqbIdNA5kJTRrB0GhvhbvRhptE0+QEVlD/VQ+T
         Sv8KEGEJJwS1pwtWob/5N0Iuu3ONXQ/WDjxLtd0Ria+S4M0+sNoEFbfyf1lT/WqxIDMr
         AG3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kId/COeOhh/kAGgHulJk60MONB+eztrTX08okhKullo=;
        b=tfJ5tjkZflIGVJC5JfDeBCMMmPbbWbLhtJxAOnx3fi1697Y70w3l3d6c1XSkfgYxxk
         E5nisUH+mxgtlYJv0Rk48HuIqtymda3Y6XWlDZH48Ir3bis4b8AuZr+W7mms8PsC5zpg
         UwNkhhNdvt/+INes9X4gNejnZmAFN1QuRc4bmhc0MZwYlQWKhiC65CsSep+6jNNa0VDV
         7MblL1DhOOnE/8YdWWkKJ4RxA1D1PjdMmRD2LivAaWMC4tWrTszgArTRNwRbxvRG680i
         RVhotGKP99FWMXhxy/fgXa771T9VkySHAIdlaLoyZfvggsfLZzgt0sA7xGt8iVoa2lUw
         eKfA==
X-Gm-Message-State: AOAM530AEyzdUwESpHlmPaMmkT0POgXLOqPLwwSZc0aExlsq7VfvsYJH
        trYcKnUEb+M6kJNzoR0TJE32R45AUNfwR70QvbeRFg==
X-Google-Smtp-Source: ABdhPJwXeoiGNZ3EyKh4Kb1Ib3na33YQT3s/nrU4Sto2Ns9vh2rbSlg70jI3IQaf2mAUQ+MyOUuTqeUu9yES636/V3c=
X-Received: by 2002:a25:db91:: with SMTP id g139mr3541031ybf.391.1633065867358;
 Thu, 30 Sep 2021 22:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com> <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <CAOesGMgSt_mYvRzF0rC=fnjMYGO9EX0_Ow2cD1d8XKLD5pHsZA@mail.gmail.com>
In-Reply-To: <CAOesGMgSt_mYvRzF0rC=fnjMYGO9EX0_Ow2cD1d8XKLD5pHsZA@mail.gmail.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 30 Sep 2021 22:23:50 -0700
Message-ID: <CAGETcx-b0ea-rqH+fj37sq9SLWY=+ePK94Y6rnLPuNbqFVBWmw@mail.gmail.com>
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

On Thu, Sep 30, 2021 at 9:52 PM Olof Johansson <olof@lixom.net> wrote:
>
> On Wed, Sep 29, 2021 at 12:48 PM Will McVicker <willmcvicker@google.com> wrote:
> >
> > On Wed, Sep 29, 2021 at 6:02 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@canonical.com> wrote:
> > >
> > > On 29/09/2021 01:56, Will McVicker wrote:
> > > > This is v2 of the series of patches that modularizes a number of core
> > > > ARCH_EXYNOS drivers. Based off of the feedback from the v1 series, I have
> > > > modularized all of the drivers that are removed from the ARCH_EXYNOS
> > > > series of "select XXX". This includes setting the following configs as
> > > > tristate:
> > > >
> > > >  * COMMON_CLK_SAMSUNG
> > > >  * EXYNOS_ARM64_COMMON_CLK
> > > >  * PINCTRL_SAMSUNG
> > > >  * PINCTRL_EXYNOS
> > > >  * EXYNOS_PMU_ARM64
> > > >  * EXYNOS_PM_DOMAINS
> > > >
> > > > Additionally, it introduces the config EXYNOS_PMU_ARM64 and EXYNOS_PMU_ARM
> > > > which was previously EXYNOS_PMU and EXYNOS_PMU_ARM_DRIVERS respectively.
> > > > The reason for these new configs is because we are not able to easily
> > > > modularize the ARMv7 PMU driver due to built-in arch dependencies on
> > > > pmu_base_addr under arch/arm/mach-exynos/*. So the new configs split up
> > > > the ARM and ARM64 portions into two separate configs.
> > > >
> > > > Overall, these drivers didn't require much refactoring and converted to
> > > > modules relatively easily. However, due to my lack of exynos hardware, I
> > > > was not able to boot test these changes. I'm mostly concerned about the
> > > > CLK_OF_DECLARE() changes having dependencies on early timers. So I'm
> > > > requesting help for testing these changes on the respective hardware.
> > > >
> > >
> > > These are all not tested at all? In such case, since these are not
> > > trivial changes, please mark the series as RFT.
> > >
> > > I will not be able to test these for some days, so it must wait.
> > >
> > >
> > > Best regards,
> > > Krzysztof
> >
> > +Cc Arnd and Olof,
> >
> > Hi Krzysztof,
> >
> > To avoid the scrambled conversation from the first patchset, I'm going
> > to address all your general questions here in the cover letter thread
> > so that it's easier for everyone to follow and reference in the
> > future.
>
> This patchset shouldn't go in.
>
> GKI is a fantastic effort, since it finally seems like Google has the
> backbone to put pressure on the vendors to upstream all their stuff.
>
> This patcheset dilutes and undermines all of that by opening up a
> truck-size loophole, reducing the impact of GKI, and overall removes
> leverage to get vendors to do the right thing.
>
> It's against our interest as a community to have this happen, since
> there's no other reasonably justifiable reason to do this.

Oolf, Geert, Krzysztof, Arnd,

I skimmed through the emails and you all make a lot of good points. It
looks like you all at least like the idea of being able to have a
minimal generic kernel where everything that can be a module is a
module. Please correct me if I'm wrong on that.

I was thinking about this patch series and I was wondering if it'd be
good to come at it from the other end. Instead of taking the mostly
builtin generic kernel and trying to rip out drivers as modules (and
not having enough hardware to test them all) and hitting all these
issues, we could come at it from the other end.

A config like ARM64_MINIMAL_GENERIC_KERNEL that's off by default. But
if it's selected, all the "selects" done by the various ARCH_XXX are
not done any more. Something like:

ARCH_XXX
    select XXX_CLK1 if !ARM64_MINIMAL_GENERIC_KERNEL
    select XXX_PINCTRL1 if !ARM64_MINIMAL_GENERIC_KERNEL

ARCH_YYY
    select YYY_CLK1 if !ARM64_MINIMAL_GENERIC_KERNEL
    select YYY_PINCTRL1 if !ARM64_MINIMAL_GENERIC_KERNEL

And ARM64_MINIMAL_GENERIC_KERNEL itself would select the absolutely
mandatory stuff that can never be made into a module like the GIC,
architectured timer (as Geert mentioned) and UART early console
driver. I'm not sure if ARM32 has an equivalent to the standardized
GIC and arch timer. Basically the minimal kernel would need a timer
for the scheduler tick and IRQ controller to get the timer IRQ and the
fixed clock driver if the archtimer uses one to get its frequency and
the early UART console is pointless as a module (so build it in to
allow debugging/development).

And then all new drivers, we should make sure are implemented as
tristate drivers. And we can go back and slowly work on converting
existing drivers to modules (community effort -- not one person or
entity) -- at least the ones where the author has hardware or ones
where the change is very likely to be correct and someone else is
willing to test it. We'll never be able to support some/all ARM32 (do
they even have a GIC/arch timer standard?), but at least for ARM64,
this seems like a viable goal.

This way, we'll keep the existing model working, while working on a
fully modular kernel from the other end.

Thoughts?

-Saravana
