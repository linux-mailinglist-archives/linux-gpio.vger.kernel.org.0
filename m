Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F2F041E089
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Sep 2021 20:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352974AbhI3SET (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 14:04:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236609AbhI3SET (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Sep 2021 14:04:19 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D56DC06176A
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 11:02:36 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id g41so28575662lfv.1
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 11:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dUhjkiUkO5I2gtWdIxEyHz4heTocnFLTG0gdIYBH7Fs=;
        b=KIDcqn81Sg2UQ1zgtYLS8/gOtvnCl5foO15Oov8fENG2j/KJhIMpX7gpi8/3NsjI+S
         urLk6nrb8vsm+4RC5gacoMznmqvjwK4eflApBMOpXV6InvV+mjjEfUZN4g1SbpIk1KJS
         64e4OOWuzUb1VVTJPXy9Ev+paKLrpNG7qWCr+lJk0YBXINY8+BnEX5xIu+kjgtlI6HCT
         iuV9h569AeNUhY4rA7lfd839Zv8hvYNXnd2eDTaiNyBm91DGfMFVvriT/fJEnVOGxOxX
         9gU97UrmSeik8lCVLC6wieTSc0SWN4t3/kf3/kQaiMBjzWZUa5RyXSivb8xwX8Zg5klk
         VKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dUhjkiUkO5I2gtWdIxEyHz4heTocnFLTG0gdIYBH7Fs=;
        b=oHDTYWnBIDYGBw6Ea+U0cX2xmIpZZFYtXI0X4lKm8cyBu7v02RuoUYHOWsakWHdt7m
         l4rbmW9wYuffoYimzX/TJKQv6reJIqKUILOzXmve42VxkaeLaJoV1HpHWRlU5aiRxgCq
         i2crhNt9J4X/YCYgV6RPsq9Uu/XU8OUJpmSGgPxe0PjZO/acFj6/nm5p0Bzd9scQNI7Q
         uodB+RmP3xJrjE/vaaexR5r0afDK+QhSiLaBL2J2WVfktVfNm8EqCgfZRgymAPb0zU58
         FUdyRcH9gSFju8t1B3Bn0XRtPgr1gvGQVD6u6PDMyGFihzTCzTuDw6+Ah5l/gB9XptNA
         bzFg==
X-Gm-Message-State: AOAM532TU79NuTAuukgb8ch1KhXubG0WEsv0EA9nXzhOIKuKqVbpC5WS
        JSqtnm3z+HVtO0meVfNRET65Cv4owv6xJyofMuYnFw==
X-Google-Smtp-Source: ABdhPJwFzeI5sjPMfTasnMbbhqM/NDtim2bc2OhsLak9gYNJ3UgL2h5e5BJWFK7ZtTnHct/UqSlCzvBcjYmWDbD3SFk=
X-Received: by 2002:a05:6512:12d6:: with SMTP id p22mr629668lfg.42.1633024954260;
 Thu, 30 Sep 2021 11:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com> <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <c65bf0db-6fd1-eb05-f407-37c41f9125f4@canonical.com> <YVWCK5QO331rfhJJ@google.com>
 <72d27a82-9d4d-1f91-bd1f-ebead3b75ffa@canonical.com> <YVWwBz8jrznqXah4@google.com>
 <8d260548-176e-d76b-6f05-d4d02ddd4f67@canonical.com> <YVW7xoHaLdGHBoEQ@google.com>
 <CAMuHMdU_dbQYHF=8uOZ3e_v4+Li0bHfQABdLVSpJJPG4XkwhZw@mail.gmail.com>
 <YVXkGiwAV3kGiBd3@google.com> <CAMuHMdXTp_cv4Ry0XBzCkv+-Gh3RY-HPZ8uDiNkxqK227+cozw@mail.gmail.com>
In-Reply-To: <CAMuHMdXTp_cv4Ry0XBzCkv+-Gh3RY-HPZ8uDiNkxqK227+cozw@mail.gmail.com>
From:   Will McVicker <willmcvicker@google.com>
Date:   Thu, 30 Sep 2021 11:02:18 -0700
Message-ID: <CABYd82b9wmzZHAQwBqn-6uJupEV=r6Zx7fiaz+o4Xxt8RQppUA@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select configs
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
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

On Thu, Sep 30, 2021 at 9:26 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Lee,
>
> On Thu, Sep 30, 2021 at 6:21 PM Lee Jones <lee.jones@linaro.org> wrote:
> > On Thu, 30 Sep 2021, Geert Uytterhoeven wrote:
> > > On Thu, Sep 30, 2021 at 3:29 PM Lee Jones <lee.jones@linaro.org> wrote:
> > > > On Thu, 30 Sep 2021, Krzysztof Kozlowski wrote:
> > > > > On 30/09/2021 14:39, Lee Jones wrote:
> > > > > > On Thu, 30 Sep 2021, Krzysztof Kozlowski wrote:
> > > > > >> On 30/09/2021 11:23, Lee Jones wrote:
> > > > > >>> [0] Full disclosure: part of my role at Linaro is to keep the Android
> > > > > >>> kernel running as close to Mainline as possible and encourage/push the
> > > > > >>> upstream-first mantra, hence my involvement with this and other sets.
> > > > > >>> I assure you all intentions are good and honourable.  If you haven't
> > > > > >>> already seen it, please see Todd's most recent update on the goals and
> > > > > >>> status of GKI:
> > > > > >>>
> > > > > >>>   Article: https://tinyurl.com/saaen3sp
> > > > > >>>   Video:   https://youtu.be/O_lCFGinFPM
> > > > > >>>
> > > > > >>
> > > > > >> Side topic, why this patchset is in your scope or Will's/Google's scope?
> > > > > >> Just drop it from Android main kernel, it will not be your problem. I
> > > > > >> mean, really, you don't need this patchset in your tree at all. The only
> > > > > >> platform which needs it, the only platform which will loose something
> > > > > >> will be one specific vendor. Therefore this will be an incentive for
> > > > > >> them to join both discussions and upstream development. :)
> > > > > >
> > > > > > How would they fix this besides upstreaming support for unreleased
> > > > > > work-in-progress H/W?
> > > > > >
> > > > > > Haven't I explained this several times already? :)
> > > > >
> > > > > Either that way or the same as Will's doing but that's not my question.
> > > > > I understand you flush the queue of your GKI patches to be closer to
> > > > > upstream. Reduce the backlog/burden. you can achieve your goal by simply
> > > > > dropping such patch and making it not your problem. :)
> > > >
> > > > git reset --hard mainline/master   # job done - tea break  :)
> > > >
> > > > Seriously though, we wish to encourage the use of GKI so all vendors
> > > > can enjoy the benefits of more easily updateable/secure code-bases.
> > > >
> > > > I can't see how pushing back on seamlessly benign changes would
> > > > benefit them or anyone else.
> > >
> > > I like your wording ;-)
> > >
> > > Indeed, seamlessly benign changes, which are (1) not tested, and (2)
> > > some believed by the platform maintainer to break the platform.
> > > What can possibly go wrong? ;-)
> >
> > William has already shown a willingness to test the series.
>
> I'm looking forward to the results!
>
> Gr{oetje,eeting}s,
>
>                         Geert
>
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
>
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

Hi Krzysztof and Geert,

Thanks for all the responses! There are a few things I want to respond
to. Since this thread is 32 responses deep, I'm copying and pasting
the parts I'm responding to. I hope that isn't an issue.

>You are changing not default, but selectability which is part of the
>enforced configuration to make platforms working. The distros do not
>always choose defaults but rather all as modules.

I'm guessing you are referring to distros using the "allmodconfig". I
agree that this would affect their platforms in the sense that they
would get a module vs built-in, but obviously that is the choice they
are making by using "allmodconfig". I also agree that my changes
should not break any distros. I definitely don't want you or anyone
else to accept these without them being tested and verified.

>I don't understand the point (2) here. Anyone can use upstream kernel
>for supported and unsupported platforms. How upstream benefits from a
>change affecting supported platforms made for unsupported, downstream
>platforms.

We believe that if we make it easier for SoC vendors to directly use
the upstream kernel during bring-up and during the development stages
of their project, then that will decrease the friction of working with
upstream (less downstream changes) and increase the upstream
contributions. As mentioned in the LPC talk by Todd, the Android
kernel team is constantly pushing to reduce the number of out-of-tree
changes we carry so that we can ultimately use the upstream kernel
directly.

>You also mentioned downstream devices but without actually ever defining
>them. Please be more specific. What SoC, what hardware?

Saravana provided 2 platforms in his response. The first one is
hikey960 devboard and the second one is the Pixel 5 which uses the
Qualcomm sm7250 chipset. In particular the Pixel 5 is running a fully
modular kernel. It has 320+ modules including interrupt controllers,
timers, pinctrl and clocks.

To address your question regarding if Exynos is special? No, Exynos
isn't special. There is a long road ahead of us to get to where we'd
ultimately like to be and ARCH_EXYNOS happens to be along the way.
Currently, we are working through the arm64 ARCH_XXX configs that are
supported by Android to make sure that all drivers included by any
ARCH_XXX are modularized if they can be which benefits all parties.
From my understanding upstream does support modularizing drivers and
we can help with that. I believe this also kind of addresses Geert's
comments regarding what a generic kernel is. We look at it as a kernel
that only includes the absolutely necessary SoC drivers as built-in.
Obviously we can't go back and change older hardware like Cortex A9 to
support this, but we can do our best to support future SoCs.

Lastly, you mentioned a couple of times that we should just disable
ARCH_EXYNOS and move on. At the moment we are not able to do that
because some SoC specific drivers actually do need to be built-in to
the kernel (tainting it's generic-ness unfortunately) and are
protected by these ARCH_XXX configs. One example that you or Geert
pointed out is the early console serial driver which Greg did try to
decouple from ARCH_EXYNOS but was turned down. There are likely other
reasons as well that I don't know of off hand.

I hope Lee and I answered all your questions. Ultimately, I think we
all understand what is being debated here and it sounds like we all
agree that we are okay with modules as long as (1) they are proven to
work as both built-in and as modules and (2) can't be disabled if they
are required by the platform, but can be built-in or modular. Let me
know if I misunderstood that.

Regarding the testing, I will look around for a devboard that I can
test my clock driver changes on since those are the most contested
ones. I obviously am not going to be able to find all the HW variants
you mentioned, but I will try to find an ARM64 Exynos7 or Exynos5433
devboard since my patchset only modifies the clocks for these SoCs
which seem to be the most contested. Once I provide some testing
results, I'm hoping someone upstream can help verify that on the other
affected hardware. Of course this will take some time though.

In the meantime, I will try to push some of these easier patches that
don't need extensive testing, but are required before modularizing the
drivers.

Thanks,
Will
