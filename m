Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 213BE417F49
	for <lists+linux-gpio@lfdr.de>; Sat, 25 Sep 2021 04:18:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347505AbhIYCTn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Sep 2021 22:19:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347456AbhIYCTm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 24 Sep 2021 22:19:42 -0400
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com [IPv6:2607:f8b0:4864:20::b36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 443F3C061571
        for <linux-gpio@vger.kernel.org>; Fri, 24 Sep 2021 19:18:08 -0700 (PDT)
Received: by mail-yb1-xb36.google.com with SMTP id r4so9800488ybp.4
        for <linux-gpio@vger.kernel.org>; Fri, 24 Sep 2021 19:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Di1Rj4i8NNjxp2cBpfWHuge/r4aFHPc9tdM1Aqn2uaQ=;
        b=RULTTSYMpzcMqu/lH9m6RVVkMZSgo7xVxk3vvJHNciAYlpw3OcPwxtQgIXTjpe38RX
         7l8F3CYKnC/ZqznIXnYleT84WVwUYxQWbpL/QRwl1zVAnxB1+6i6CfmJ+l6HWo5ZzwVI
         egpZWT1Cxk4+oj2abOTPYGu5ux4vFsUGgBrbXySios1hXai0Z5G88cVwzn8M92umkF6W
         q7jlU9+lrFzukDQxNIqE5/k2NjtLs0l6gj6Lvvc6BVOn3FH2Mg1nCkXQuYbnmG+mI4N6
         AZoG5Ip7TZZ+8R8kTqhCmei83qs1dDLiIBtw80jdRQAsDoL3gz22daS5g7ihzFvsVaNK
         ASdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Di1Rj4i8NNjxp2cBpfWHuge/r4aFHPc9tdM1Aqn2uaQ=;
        b=flX21aJgHElUOH5FtUkAEbo9VT1dsxDvrVATrnn1mEKrQTpa6VisUumEOcrAxRIhJm
         ZGoUrMRd11M282G80BNPsFpaqpL3mRwel/wfcyIPbXw2vSQ7R3ohMJok5I054EgUpgcJ
         hhPiBvIn8GXjlVr6tH1H5OKerUz1EMlzZGXJgeOguumU0llAGy6egmB3SmYEi5Lyoqxf
         xWDJ8Ossn1Z4s8L1/ubpXxfiDmca5zhfw7y7oUuzdOoKCDpgqHwI5ZeVY2prNfPQ34hb
         H5Coe7XjxYRrNVcC5ywd/rYwUdN4x7xwLXoNAugMgTgmtDDjg+ficuRTPNAvjcpH3ABl
         LcYQ==
X-Gm-Message-State: AOAM533uxcI/ba0NINach6NrWKwd/2i1FEbGY22aBskC2VEUfGm8jmNI
        1JnRgsSUuMTHnbi7VULwFce2aBUHVvlEGB2f8Q3voA==
X-Google-Smtp-Source: ABdhPJwpkpI/4ynNoGZO3Tt2LHq14lHoq8y03inXj18wPF7a5sbJjd+FrJ61pEThOJCudT8JzVygtlCV8utFiPdOG1E=
X-Received: by 2002:a25:5606:: with SMTP id k6mr15946697ybb.476.1632536287181;
 Fri, 24 Sep 2021 19:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210920190350.3860821-1-willmcvicker@google.com>
 <7735b09c-cf1c-5e37-a737-9a330fbacf1e@canonical.com> <YUmTwZPqrCfRMekd@google.com>
 <d6212801-f2a0-a6a7-6154-0f99b57f1c4d@canonical.com>
In-Reply-To: <d6212801-f2a0-a6a7-6154-0f99b57f1c4d@canonical.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Fri, 24 Sep 2021 19:17:30 -0700
Message-ID: <CAGETcx9wp3cbsehODj=oAd658hF6KNL5Qiy2nVc=7Bxqxxwimw@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] arm64: Kconfig: Update ARCH_EXYNOS select configs
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Will McVicker <willmcvicker@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Sep 21, 2021 at 1:25 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
>
> On 21/09/2021 10:11, Lee Jones wrote:
> > On Tue, 21 Sep 2021, Krzysztof Kozlowski wrote:
> >
> >> On 20/09/2021 21:03, Will McVicker wrote:
> >>> This patch series tries to address the issue of ARCH_EXYNOS force selecting
> >>> a handful of drivers without allowing the vendor to override any of the
> >>> default configs. This takes away from the flexibilty of compiling a generic
> >>> kernel with exynos kernel modules. For example, it doesn't allow vendors to
> >>> modularize these drivers out of the core kernel in order to share a generic
> >>> kernel image across multiple devices that require device-specific kernel
> >>> modules.
> >>
> >> You do not address the issue in these patches. The problem you describe
> >> is that drivers are not modules and you are not changing them into modules.
> >
> > The wording is unfortunate.  The reason for this change doesn't have
> > much to do with kernel modules.
> >
> > Let's go back in time 18 months or so when Greg KH submitted this [0]
> > patch, which you Acked.  Greg was trying to solve the problem of not
> > having to enable ARCH_EXYNOS on kernels which are designed to be
> > platform agnostic (sometimes called Generic Kernels).  For some reason
> > SERIAL_SAMSUNG is the only symbol with these dependencies, so the
> > solution seemed simple and straight forward at the time.
> >
> > However, For sound reasons Geert NACKed the patch.
> >
> > Quoting from [1] he says:
> >
> >   "A generic kernel will include Samsung SoC support, hence
> >   PLAT_SAMSUNG or ARCH_EXYNOS will be enabled."
>
> Yes, it's correct reasoning. There is also one more use-case -
> non-upstreamed (out of tree) platform which wants to use Exynos-specific
> drivers. Something like was happening with Apple M1 except that it got
> upstreamed and we do not care much about out-of-tree.
>
> >
> > However, since the entry for ARCH_EXYNOS *insists* on building-in a
> > bunch of other symbols (via 'select') which will be unused in most
> > cases, this is not a currently acceptable approach for many Generic
> > Kernels due to size constraints.
>
> In the mainline kernel there is no such use case. If you want to have
> Exynos-whatever-driver (e.g. SERIAL_SAMSUNG or S3C RTC), you should
> select ARCH_EXYNOS because otherwise it does not make any sense. Zero
> sense. Such kernel won't work.
>
> It makes sense only if there is some other work, hidden here, where
> someone might want to have SERIAL_SAMSUNG or S3C RTC without
> ARCH_EXYNOS. Although GKI is not that work because GKI kernel will
> select ARCH_EXYNOS. It must select ARCH_EXYNOS if it wants to support
> Exynos platforms.
>
> Therefore I expect first to bring this "some other work, hidden here" to
> broader audience, so we can review its use case.
>
> >
> > What this patch does is migrates those symbols from being 'select'ed
> > (always built-in with no recourse) to 'default y'.  Where the former
> > cannot be over-ridden, but the latter can be via a vendor's
> > defconfig/fragment.
>
> It cannot be overridden by vendor fragment because options are not
> visible. You cannot change them.
>
> The patch does nothing in this regard (making them selectable/possible
> to disable), which is why I complained.
>
> >
> > I doubt many (any?) of these symbols can be converted to kernel
> > modules anyway, as they are required very early on in the boot
> > sequence.
>
> True, some could, some not. Also some platforms are set up via
> bootloader, so actually could "survive" till module is loaded from some
> initrd.

Hi Krzysztof,

I was trying to chime in, but the discussion got spread out across all
the patches. Since the cover letter seems to have everyone, I thought
I'd reply here. Hope you don't mind. I'll try to respond/chime in on
the various topics that were raised across the patches.

Yes, the next patch series would To/Cc folks correctly. William simply
forgot to use the --to-cover and --cc-cover options when using git
send-email.

I agree with you that it doesn't make sense to have ARCH_EXYNOS
enabled but to have all the clock drivers exynos compiled out. Then
one obviously can't boot an exynos platform using that kernel. I think
William is going to send out a new patch series with a few drivers
modularized. That'll ensure all the common exynos clock code is
modularized and we have a few examples of exynos clock modules.

Speaking of modules, a fully modularized generic ARM64 kernel where
everything is modularized out and we only load the necessary modules
is a great goal. And this is where I can chime in the most since I
wrote fw_devlink and tested this out. Such a kernel is not
hypothetical. IIRC hikey960 can already do this. There's an upstream
amlogic(?) board that can do this (Kevin Hilman has done that). A more
complex/recent/powerful, but downstream example is the Pixel 5 -- it
has a fully modular kernel. 320+ modules! Including interrupt
controllers, timers, pinctrl and clocks.

I can assure you any of the framework code related to pulling off
booting a fully modular ARM64 kernel is already upstreamed
(fw_devlink, irq framework changes, etc) or sent upstream (timer -- by
a SoC vendor, etc) and being worked on. As for fw_devlink, I've
extended it way past what GKI or Android would need. It would have
been super trivial if all I wanted to do was support Android devices.
I've also upstreamed changes that improve module loading time for all
ARM64 modules. All of this and more upstream work came out of GKI and
our push to be upstream first -- so I think it's reasonable to say the
GKI effort helps and cares to get more work upstreamed.

Speaking of GKI, let's not speak of it. It really doesn't matter.
Android is just yet another distribution (albeit a very popular one).
The part that's relevant to upstream/all the other distributions is
the fully modular generic ARM64 kernel and that's what we should focus
on.

In that context, I think William's attempts are reasonable and I think
he'll be glad to fix up any technical issues that people point out. So
hopefully we can focus on that?

Cheers,
Saravana
