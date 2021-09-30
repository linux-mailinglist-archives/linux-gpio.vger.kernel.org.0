Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6462141D5E8
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Sep 2021 11:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349014AbhI3JDT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 05:03:19 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:48817 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348335AbhI3JDQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Sep 2021 05:03:16 -0400
Received: from mail-wr1-f53.google.com ([209.85.221.53]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mw9oq-1mmQpD2nfY-00s3oH; Thu, 30 Sep 2021 11:01:31 +0200
Received: by mail-wr1-f53.google.com with SMTP id w29so8803322wra.8;
        Thu, 30 Sep 2021 02:01:31 -0700 (PDT)
X-Gm-Message-State: AOAM531iAiDf7iXw/4+ULXT+sxSp9GGZ92rgLA+pqE26jmFg56hj5ykv
        CoFsr3dmdlPjF2O1IFcOB/aNAHvoCo4oFPabOHo=
X-Google-Smtp-Source: ABdhPJwWKjQ90At9Bd49JUadsSeK5bLQR/gdefHEd1fOpPYQ4q9piPUpP57abtSqimsk+s5XO5tOXqlmr6GKDTSD2Qg=
X-Received: by 2002:a5d:6cb4:: with SMTP id a20mr4872968wra.428.1632992490983;
 Thu, 30 Sep 2021 02:01:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com> <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <c65bf0db-6fd1-eb05-f407-37c41f9125f4@canonical.com>
In-Reply-To: <c65bf0db-6fd1-eb05-f407-37c41f9125f4@canonical.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Thu, 30 Sep 2021 11:01:14 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0zezKvexqvL29Oc44uQq-8QG7LwZy31VYJuYAYbh-Utw@mail.gmail.com>
Message-ID: <CAK8P3a0zezKvexqvL29Oc44uQq-8QG7LwZy31VYJuYAYbh-Utw@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select configs
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Will McVicker <willmcvicker@google.com>,
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
X-Provags-ID: V03:K1:mtxwc1xwxUaleFuDPnJU0y8zzXMba4CJ2T8I1XFMSaTWSlafiU9
 5pYdr2Z6IamVOxRUqTN0cW+JWQYKVxv68XfrCBlUgO40AEVHnMAgE2y1SfgUipcF3YJA3ms
 HlSfOPulPraUSnOWf4b0CqfL0oOmqlHQeo/NQ7OVwk0QGSnHgjcAcRBnVIg7MK5x3XUCIAG
 utqrZmiWDKFhWM9i0fysw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+JSCoqpf8Ak=:87zpoadebqS8UvBdJNLWct
 GJY2hT/y4wqjd0O4njVVts1uK6Ys3fIJFVqthqHGqDGQAnH73o/P4apV911oMeKzJNc5rPF3x
 1Heiw5yWcGNFz6zCHSCZvx3UU5SiKBiI/aQr+KKCJhFqqBDlnj6UvSwOWFfUWUZj3kbilxOvV
 +xZmNp3RNv0+tSzyHGudHi7xxWofr4eYwVckjc/8gQGl6eK9N007mM/IjeooWuB7Sy9VAssGq
 oYNP2t7XV3H5RTYhBcVVLrZj8OWQcu0rYyaBY9MIhqDKgex2Ctp/KT+yhLgDVlBRGfstdMyz3
 OXYefSmCu0TyqEJWH+w2s/o2TuX5TyhvzpbEw+R12D8pDrJEc8Szs8YdpdNas+wCI/ZOdc71W
 Vv/eTu0yH30Mr7K8tA3Y4NUNHOPQB9iEWLk/0aUBHqsheIDNydxzns+DZWl6js92E8QOj1cFV
 joVIbjf06UzcafWrLKTWEMqgBS2l7BdtoiKV6bf2SXOJKHeYuGnVe2H5WW7Y1G7gI7PkvJQ6S
 2ib6di8nAOLAh5X7mW4MitV8E08pouVRBg7dzaQLsLDBTUenXMKi6LAu/+epdg0fX6b2FWWjO
 0yG3yOIpkLR6Ik1ykI67HngYCkMpSaM3HS8WCPjyJ+0Urcq1mBzc+mMiHRc39Z7MuZjdPaW08
 hQTRXr0hLm7j8Yv6Auh7lxFmwje7diqHbWUB+MOZjzHh2NgnqIodAr4vPKHKES9oWmzHqCEG1
 dEwaBSRvYuR+qR5wkJ8yBBbse2EJDUQRogc4Yn51MfwuEFEpKzGfvsRS/ZrUvgRr9X6sLGted
 PfX9bBeTU29C2p4mu9qJ5G8ZUevK4QNpd1TbML/C1qzNqkY4aJgz9MXQH08RJA69d1PTpzvVe
 3O+uoovHoTm/cCBsGNbg==
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 30, 2021 at 8:15 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
> On 29/09/2021 21:48, Will McVicker wrote:
> > On Wed, Sep 29, 2021 at 6:02 AM Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com> wrote:
> >> What is more, it seems you entirely ignored Geert's comments. I pointed
> >> attention to it last time and you just said you will send v2 instead of
> >> joining discussion.
> >>
> >> It's a NAK for this reason - ignoring what Geert brought: you just broke
> >> distro configs for Exynos.
> >
> > First off I did want to chime into the discussion from the previous
> > patchset, but I felt that Lee and Saravana addressed all your concerns
> > regarding the intent and feasibility. You also made it clear what the
> > next steps were that I needed to take.
>
> One of the steps was problem with distros using everything as modules.
> They should not receive these drivers as modules.
> Reminder: these are essential drivers and all Exynos platforms must have
> them as built-in (at least till someone really tests this on multiple
> setups).

Agreed. I absolutely love the work of the GKI developers to turn more
drivers into loadable modules, but the "correctness-first" principle is
not up for negotiation. If you are uncomfortable with the code or the
amount of testing because you think it breaks something, you should
reject the patches. Moving core platform functionality is fundamentally
hard and it can go wrong in all possible ways where it used to work
by accident because the init order was fixed.

> >> Please also explain why Exynos is so special that we deviate from the
> >> policy for all SoC that critical SoC-related drivers have to be enabled
> >> (built-in or as module).
> >
> > I am not actually changing ANY default build configurations here and
> > I'm not removing any existing configuration.
>
> You are changing not default, but selectability which is part of the
> enforced configuration to make platforms working. The distros do not
> always choose defaults but rather all as modules. Kernel configuration
> is huge and complex, so by mistake they could now even disable
> potentially essential driver. There is no need to disable for example
> essential clock driver on a supported Exynos platform.

I'm not overly worried about the defaults. If the drivers work as loadable
modules, I'm happy with them being loadable modules in distros.
If they don't work this way, then the patches are broken and should
not get merged.

I don't even mind having essential drivers that can be turned off,
since we already have a ton of those (e.g. serial ports on most platforms).
It's up to distros to know which drivers to enable, though having
either reasonable defaults or fail-safe Kconfig dependencies (e.g.
making it impossible to turn off but allowing modules) is clearly
best.

> > I tried to make it pretty
> > clear in my original patch series commit messages that none of my
> > changes modify the default behavior. The .config is the same with and
> > without my patches. All of these drivers remain enabled as built-in.
> > So if there is a distro that requires all of these drivers to be
> > built-in, then they can continue as is without noticing any
> > difference. IOW, all of these changes are/should be backwards
> > compatible.
>
> I was not referring to default neither to backwards compatibility.
> Please explain why Exynos is special that it does not require essential
> drivers to be selected as built-in. For example why aren't same changes
> done for Renesas?
>
> Is that now a new global approach that all SoC drivers should be allowed
> to be disabled for ARCH_XXX?

I wouldn't enforce it either way across platforms. I would prefer drivers
to be loadable modules where possible (and tested), rather than
selected by the platform Kconfig. If you want to ensure the exynos
drivers are impossible to turn into a nonworking state, that's up to you.

> > You said that upstream supports a generic
> > kernel, but I argue that the upstream "generic" arm64 kernel can't be
> > considered generic if it builds in SoC specific drivers that can be
> > modules.
>
> Good point, but since having them as modules was not tested, I consider
> it as theoretical topic.

I actually disagree strongly with labelling the kernel as "non-generic"
just because it requires platform specific support to be built-in rather than
a loadable module. This has never been possible on any platform
I'm aware of, and likely never will, except for minor variations of
an existing platform.

Look at x86 as an example: there are less than a dozen SoC platforms
supported and they are incredibly similar hardware-wise, but the kernel
is anything but "generic" in the sense that was mentioned above.
Most of the platform specific drivers in arch/x86/platform and the
corresponding bits in drivers/{irqchip,clocksource,iommu} are always
built-in, and a lot more is hardwired in architecture code as PCI
quirks or conditional on cpuid or dmi firmware checks.

> >> Even if there was, I think it is good to have dependencies like
> >> ARCH_EXYNOS, as they let us partition the (19000, as Arnd said recently)
> >> Kconfig symbols into better manageable groups.  Without these, we cannot
> >> do better than "depends on ARM || ARM64 || COMPILE_TEST".
> >
> > My patch series still keeps the dependencies on ARCH_EXYNOS. I am
> > totally fine with "depends on ARCH_EXYNOS" and totally fine with
> > "default ARCH_EXYNOS". The problem we have is that ARCH_EXYNOS
> > forcefully selects SoC specific drivers to be built-in because it just
> > adds more and more SoC-specific drivers to a generic kernel.
>
> The selected drivers are essential for supported platforms. We don't
> even know what are these unsupported, downstream platforms you want
> customize kernel for. They cannot be audited, cannot be compared.
>
> Therefore I don't agree with calling it a "problem" that we select
> *necessary* drivers for supported platforms. It's by design - supported
> platforms should receive them without ability to remove.
>
> If you want to change it, let me paste from previous discussion:
>
> Affecting upstream platforms just because vendor/downstream does not
> want to mainline some code is unacceptable. Please upstream your drivers
> and DTS.

Agreed. I understand that it would be convenient for SoC vendors to
never have to upstream their platform code again, and that Android
would benefit from this in the short run.

From my upstream perspective, this is absolutely a non-goal. If it becomes
easier as a side-effect of making the kernel more modular, that's fine.
The actual goal should be to get more people to contribute upstream so
devices run code that has been reviewed and integrated into new kernels.

> > I know you are asking for me to only push changes that have proven to
> > work.
>
> Yep, tested.

I'm generally fine with "obviously correct" ones as well, but it's up to
you to categorize them ;-)

         Arnd
