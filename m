Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10BEB41E799
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 08:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352397AbhJAGcn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Oct 2021 02:32:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352316AbhJAGce (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Oct 2021 02:32:34 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E856FC061774
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 23:30:50 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id v19so5849274pjh.2
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 23:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cFaWGqP2C9gymM7/xIsnUKhVwQDKbxB31NvGBdiYcLA=;
        b=4ocJW6VsE5Ak+SaEWbMlGHnwUTU9mu716bs6zxu6tAUfmGk7yE5iplL38jYh3kA/KL
         eeMU7inGCL3k2iHWHOINlMkO3QWTPaoP/nXdQf3VOnRvbkZ+PDCaZrDWCQpx8BsttabS
         CK3d8lKluQkN02sVYw/hGwF/tpcBSvr8qxqIk4zhaudgU111Dl93oeyNYddynt+zKLai
         ICYJOyZMKmY8kOpFOuaGbUylu09CBNQ6PlLnvdtXpWCGSFh5Nu+K08COIIptOvrPuUlM
         zIPgWdgCE7LICZKVNF+RklvjO6335j2YDh9XvAdcavHfeZ6SHHP54wV/uEVdnzLHAyhG
         TGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cFaWGqP2C9gymM7/xIsnUKhVwQDKbxB31NvGBdiYcLA=;
        b=3GYMZF722Og92d63CzYkjPaMr1VjB1KWcFPqY86JrLzvmy88xNpBYr2DutgY6E15iA
         T/on+qyCh22AjUxg4BrO7YkCgvKLKVq+w+dqXn2/CzlbWIuJRkuigT1iBhjvhN421975
         Vftt7lyuLD+e5bRcOkXtGf5eWN1GT7vjtfnohWchVX0dPZPcfRGb4p5NJkhEHWpV7iCA
         2M78YNEisa5YA5LVBBBaM+IzjYm5fzVec7Orulmvc2vemertU/DqK7cvf/dIXsRtRTSO
         tj3qiobHYu1BHgQnJbkwyuW2Lx0wNpmLccfzf9ORUBPxqmbQrdAuAJgPKP+oF3aaXv4J
         2tBQ==
X-Gm-Message-State: AOAM533z/d5qDs01N3b5pqgjktTw7+9zZGogKB9vmnYyJ5bnvJIjYK/W
        0MBGymQdW4R5monrY6QIdUrRkWlVNpqyL3WhqcoB9w==
X-Google-Smtp-Source: ABdhPJzugW2gRpjUhIx7TVpMheVS0CqLw1m8cGY1dM+98GPdSokT3IcybwpvmxO8Q8v7apOWVV89E0+k35pmEy/if2M=
X-Received: by 2002:a17:90a:5ac2:: with SMTP id n60mr11297133pji.184.1633069850324;
 Thu, 30 Sep 2021 23:30:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com> <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <CAOesGMgSt_mYvRzF0rC=fnjMYGO9EX0_Ow2cD1d8XKLD5pHsZA@mail.gmail.com>
 <CAGETcx-b0ea-rqH+fj37sq9SLWY=+ePK94Y6rnLPuNbqFVBWmw@mail.gmail.com>
 <CAOesGMhQ3YsLJeQ7aUfb=0oNa3uPCx42wO1U7-ArqJTAUq1G3Q@mail.gmail.com>
 <CAGETcx_k2-mo9oUcYhsXhhsazLdwbifjP7ZT8pvyEbWB5k_qQg@mail.gmail.com> <CAOesGMhe3MC2LehGrOAaROjwzFGAubxnnC1oTXkkLVVmyTn31A@mail.gmail.com>
In-Reply-To: <CAOesGMhe3MC2LehGrOAaROjwzFGAubxnnC1oTXkkLVVmyTn31A@mail.gmail.com>
From:   Olof Johansson <olof@lixom.net>
Date:   Thu, 30 Sep 2021 23:30:38 -0700
Message-ID: <CAOesGMhGaS+jcAc_AcHX0AG+X5WEo2+83rFi_LcnfHAimO+CYg@mail.gmail.com>
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

On Thu, Sep 30, 2021 at 11:27 PM Olof Johansson <olof@lixom.net> wrote:
>
> On Thu, Sep 30, 2021 at 11:03 PM Saravana Kannan <saravanak@google.com> wrote:
> >
> > On Thu, Sep 30, 2021 at 10:36 PM Olof Johansson <olof@lixom.net> wrote:
> > >
> > > On Thu, Sep 30, 2021 at 10:24 PM Saravana Kannan <saravanak@google.com> wrote:
> > > >
> > > > On Thu, Sep 30, 2021 at 9:52 PM Olof Johansson <olof@lixom.net> wrote:
> > > > >
> > > > > On Wed, Sep 29, 2021 at 12:48 PM Will McVicker <willmcvicker@google.com> wrote:
> > > > > >
> > > > > > On Wed, Sep 29, 2021 at 6:02 AM Krzysztof Kozlowski
> > > > > > <krzysztof.kozlowski@canonical.com> wrote:
> > > > > > >
> > > > > > > On 29/09/2021 01:56, Will McVicker wrote:
> > > > > > > > This is v2 of the series of patches that modularizes a number of core
> > > > > > > > ARCH_EXYNOS drivers. Based off of the feedback from the v1 series, I have
> > > > > > > > modularized all of the drivers that are removed from the ARCH_EXYNOS
> > > > > > > > series of "select XXX". This includes setting the following configs as
> > > > > > > > tristate:
> > > > > > > >
> > > > > > > >  * COMMON_CLK_SAMSUNG
> > > > > > > >  * EXYNOS_ARM64_COMMON_CLK
> > > > > > > >  * PINCTRL_SAMSUNG
> > > > > > > >  * PINCTRL_EXYNOS
> > > > > > > >  * EXYNOS_PMU_ARM64
> > > > > > > >  * EXYNOS_PM_DOMAINS
> > > > > > > >
> > > > > > > > Additionally, it introduces the config EXYNOS_PMU_ARM64 and EXYNOS_PMU_ARM
> > > > > > > > which was previously EXYNOS_PMU and EXYNOS_PMU_ARM_DRIVERS respectively.
> > > > > > > > The reason for these new configs is because we are not able to easily
> > > > > > > > modularize the ARMv7 PMU driver due to built-in arch dependencies on
> > > > > > > > pmu_base_addr under arch/arm/mach-exynos/*. So the new configs split up
> > > > > > > > the ARM and ARM64 portions into two separate configs.
> > > > > > > >
> > > > > > > > Overall, these drivers didn't require much refactoring and converted to
> > > > > > > > modules relatively easily. However, due to my lack of exynos hardware, I
> > > > > > > > was not able to boot test these changes. I'm mostly concerned about the
> > > > > > > > CLK_OF_DECLARE() changes having dependencies on early timers. So I'm
> > > > > > > > requesting help for testing these changes on the respective hardware.
> > > > > > > >
> > > > > > >
> > > > > > > These are all not tested at all? In such case, since these are not
> > > > > > > trivial changes, please mark the series as RFT.
> > > > > > >
> > > > > > > I will not be able to test these for some days, so it must wait.
> > > > > > >
> > > > > > >
> > > > > > > Best regards,
> > > > > > > Krzysztof
> > > > > >
> > > > > > +Cc Arnd and Olof,
> > > > > >
> > > > > > Hi Krzysztof,
> > > > > >
> > > > > > To avoid the scrambled conversation from the first patchset, I'm going
> > > > > > to address all your general questions here in the cover letter thread
> > > > > > so that it's easier for everyone to follow and reference in the
> > > > > > future.
> > > > >
> > > > > This patchset shouldn't go in.
> > > > >
> > > > > GKI is a fantastic effort, since it finally seems like Google has the
> > > > > backbone to put pressure on the vendors to upstream all their stuff.
> > > > >
> > > > > This patcheset dilutes and undermines all of that by opening up a
> > > > > truck-size loophole, reducing the impact of GKI, and overall removes
> > > > > leverage to get vendors to do the right thing.
> > > > >
> > > > > It's against our interest as a community to have this happen, since
> > > > > there's no other reasonably justifiable reason to do this.
> > > >
> > > > Oolf, Geert, Krzysztof, Arnd,
> > >
> > > So close.
> >
> > I'm sorry, it's pretty late here and I'm sleepy and messed it up.
>
> This email thread will be here in the morning too, this is the last
> reply I will make tonight myself.
>
> > > > I skimmed through the emails and you all make a lot of good points.
> > >
> > > I skimmed through this email and I think it adds a lot of new
> > > complexity and fragility to solve a problem that doesn't really exist
> > > for upstream, adding yet more config parameter combinations to build
> > > and test for.
> >
> > How is this not an upstream problem? Having a minimal kernel with as
> > many drivers as modules is of interest to upstream. And what's the
> > complexity in having a config to easily disable a bunch of configs?
> > The new config gives a clear config against which new
> > platforms/systems should be developed against.
>
> The approach for general kernel upstream has been to have the built-in
> drivers needed to reach rootfs and runtime load the rest from there.

Correction: The intent for our own multiconfigs have been this. If
people want to go more granular and allow for modules of their core
drivers, we have never pushed back (but the rest of the argument still
stands).

> For downstream embedded kernels, the right answer is to just exclude
> the drivers you don't need.
>
> I agree, some of this is probably useful work but
> 1) It was posted as a burden on the maintainers of the legacy
> platforms to test and make sure it's not broken
> 2) It regresses distro configs, which we do care about
> 3) Based on the above, it's unclear whether the people pushing for
> this patchset cares about the existing platforms, they're looking to
> solve a different problem
>
> I didn't go back and look at who and where, but the person who started
> justifying this work with making it easier for out-of-tree vendors to
> integrate their non-contributed code killed this patchset.
>
> Would the out-of-tree argument on its own kill it? No, but the above
> complexities/cost, plus the actual intent behind the patchset did.
>
> > > A much more valuable approach would be to work towards being able to
> > > free up memory by un-probed drivers at the end of boot. That would
> > > possibly benefit all platforms on all architectures.
> >
> > Sure it would help memory after boot, but it won't help with size on
> > "disk", kernel load time, etc. And some of the devices have very tight
> > boot requirements. Think battery operated outdoor cameras for example.
>
> I would question the choices made if someone ships a camera with a
> generic kernel (without a generic filesystem which at that point also
> needs sufficient storage such that the kernel image size becomes a
> secondary consideration). Once your storage is that constrained the
> balance shifts towards a custom minimal config.
>
>
> -Olof
