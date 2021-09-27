Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2235419F92
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Sep 2021 21:55:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236677AbhI0T4j (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Sep 2021 15:56:39 -0400
Received: from mail-vs1-f50.google.com ([209.85.217.50]:35487 "EHLO
        mail-vs1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235711AbhI0T4j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Sep 2021 15:56:39 -0400
Received: by mail-vs1-f50.google.com with SMTP id f18so19525067vsp.2;
        Mon, 27 Sep 2021 12:55:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/qYkJdocNMf64y4DQpFrkh7ip501uJ0j8evhtC6TmAM=;
        b=0fIY7wtBFrQO+SJMseuDECznpzHwKHekKh0hLdqAmfbIwq0B6mYPQzgMDu2YxuPqtf
         amtLQq4QS89LY5IjgacQpn7QsqiNBPPSeqcrEz1/F0i09mGdaA37xnPPoJ1AsLpbmLoA
         NiJNivANXR9p/MGRcc4tdm77YIkdyhfG9MSo32tSYU6o+KF4yM366uT6qPOQnwfCI0CO
         4dpj/lq7ugfLv/SmhXgs1WJGZarmOZ4YRmzCa+zzYdriHtgkZ5vY96nbVny+VnqFl7qa
         pxXCvGQnEio1lyLqX9NfneZVH0XFjOj6xS5pdReCzKAXTj56Og/cQfoCrzBuaQICP/tf
         OaXQ==
X-Gm-Message-State: AOAM531kFbQND+BtLqfVYl43pKZXCMPWNYEx6Bxi0KBY5dVNsYimYBPH
        4jUp+sQNEt02YeqhtElmm+rgzXgxYg6dcXeXx2g=
X-Google-Smtp-Source: ABdhPJwPJmXU/Uf1MApSAaImmnQ49AfoZTTvSJ9EYE8DADK73laAy0lsWW8ZIuxb0TKgP4nWS1QiGkDkmY8p1587B1s=
X-Received: by 2002:a67:cc1c:: with SMTP id q28mr1689183vsl.37.1632772500240;
 Mon, 27 Sep 2021 12:55:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210920190350.3860821-1-willmcvicker@google.com>
 <7735b09c-cf1c-5e37-a737-9a330fbacf1e@canonical.com> <YUmTwZPqrCfRMekd@google.com>
 <d6212801-f2a0-a6a7-6154-0f99b57f1c4d@canonical.com> <CAGETcx9wp3cbsehODj=oAd658hF6KNL5Qiy2nVc=7Bxqxxwimw@mail.gmail.com>
 <5ec72235-add4-d6dd-f89f-ca3941c9878e@canonical.com> <CAGETcx-b9nPjq2PqUYoXohU-WE1PAPzy4Mz5M99CzNfqvGTOsA@mail.gmail.com>
In-Reply-To: <CAGETcx-b9nPjq2PqUYoXohU-WE1PAPzy4Mz5M99CzNfqvGTOsA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 27 Sep 2021 21:54:48 +0200
Message-ID: <CAMuHMdXKcbBEpXbbc8eret8oOndwnqRq0d17e5qWpRmLH1SBgg@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] arm64: Kconfig: Update ARCH_EXYNOS select configs
To:     Saravana Kannan <saravanak@google.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Lee Jones <lee.jones@linaro.org>,
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
        Android Kernel Team <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rtc@vger.kernel.org, Kevin Hilman <khilman@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Saravana,

On Mon, Sep 27, 2021 at 8:07 PM Saravana Kannan <saravanak@google.com> wrote:
> On Mon, Sep 27, 2021 at 1:08 AM Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
> > On 25/09/2021 04:17, Saravana Kannan wrote:
> > > On Tue, Sep 21, 2021 at 1:25 AM Krzysztof Kozlowski
> > > <krzysztof.kozlowski@canonical.com> wrote:
> > >> On 21/09/2021 10:11, Lee Jones wrote:
> > >>> On Tue, 21 Sep 2021, Krzysztof Kozlowski wrote:
> > >>>> On 20/09/2021 21:03, Will McVicker wrote:
> > >>>>> This patch series tries to address the issue of ARCH_EXYNOS force selecting
> > >>>>> a handful of drivers without allowing the vendor to override any of the
> > >>>>> default configs. This takes away from the flexibilty of compiling a generic
> > >>>>> kernel with exynos kernel modules. For example, it doesn't allow vendors to
> > >>>>> modularize these drivers out of the core kernel in order to share a generic
> > >>>>> kernel image across multiple devices that require device-specific kernel
> > >>>>> modules.
> > >>>>
> > >>>> You do not address the issue in these patches. The problem you describe
> > >>>> is that drivers are not modules and you are not changing them into modules.
> > >>>
> > >>> The wording is unfortunate.  The reason for this change doesn't have
> > >>> much to do with kernel modules.
> > >>>
> > >>> Let's go back in time 18 months or so when Greg KH submitted this [0]
> > >>> patch, which you Acked.  Greg was trying to solve the problem of not
> > >>> having to enable ARCH_EXYNOS on kernels which are designed to be
> > >>> platform agnostic (sometimes called Generic Kernels).  For some reason
> > >>> SERIAL_SAMSUNG is the only symbol with these dependencies, so the
> > >>> solution seemed simple and straight forward at the time.
> > >>>
> > >>> However, For sound reasons Geert NACKed the patch.
> > >>>
> > >>> Quoting from [1] he says:
> > >>>
> > >>>   "A generic kernel will include Samsung SoC support, hence
> > >>>   PLAT_SAMSUNG or ARCH_EXYNOS will be enabled."
> > >>
> > >> Yes, it's correct reasoning. There is also one more use-case -
> > >> non-upstreamed (out of tree) platform which wants to use Exynos-specific
> > >> drivers. Something like was happening with Apple M1 except that it got
> > >> upstreamed and we do not care much about out-of-tree.
> > >>
> > >>>
> > >>> However, since the entry for ARCH_EXYNOS *insists* on building-in a
> > >>> bunch of other symbols (via 'select') which will be unused in most
> > >>> cases, this is not a currently acceptable approach for many Generic
> > >>> Kernels due to size constraints.
> > >>
> > >> In the mainline kernel there is no such use case. If you want to have
> > >> Exynos-whatever-driver (e.g. SERIAL_SAMSUNG or S3C RTC), you should
> > >> select ARCH_EXYNOS because otherwise it does not make any sense. Zero
> > >> sense. Such kernel won't work.
> > >>
> > >> It makes sense only if there is some other work, hidden here, where
> > >> someone might want to have SERIAL_SAMSUNG or S3C RTC without
> > >> ARCH_EXYNOS. Although GKI is not that work because GKI kernel will
> > >> select ARCH_EXYNOS. It must select ARCH_EXYNOS if it wants to support
> > >> Exynos platforms.
> > >>
> > >> Therefore I expect first to bring this "some other work, hidden here" to
> > >> broader audience, so we can review its use case.
> > >>
> > >>>
> > >>> What this patch does is migrates those symbols from being 'select'ed
> > >>> (always built-in with no recourse) to 'default y'.  Where the former
> > >>> cannot be over-ridden, but the latter can be via a vendor's
> > >>> defconfig/fragment.
> > >>
> > >> It cannot be overridden by vendor fragment because options are not
> > >> visible. You cannot change them.
> > >>
> > >> The patch does nothing in this regard (making them selectable/possible
> > >> to disable), which is why I complained.
> > >>
> > >>>
> > >>> I doubt many (any?) of these symbols can be converted to kernel
> > >>> modules anyway, as they are required very early on in the boot
> > >>> sequence.
> > >>
> > >> True, some could, some not. Also some platforms are set up via
> > >> bootloader, so actually could "survive" till module is loaded from some
> > >> initrd.
> > >
> > > I was trying to chime in, but the discussion got spread out across all
> > > the patches. Since the cover letter seems to have everyone, I thought
> > > I'd reply here. Hope you don't mind. I'll try to respond/chime in on
> > > the various topics that were raised across the patches.
> > >
> > > Yes, the next patch series would To/Cc folks correctly. William simply
> > > forgot to use the --to-cover and --cc-cover options when using git
> > > send-email.
> > >
> > > I agree with you that it doesn't make sense to have ARCH_EXYNOS
> > > enabled but to have all the clock drivers exynos compiled out. Then
> > > one obviously can't boot an exynos platform using that kernel.
> >
> > If downstream kernel does not use any upstream platforms (e.g.
> > Exynos5433 or Exynos7) and has its own drivers for everything, then
> > downstream does not even need ARCH_EXYNOS. Just disable it.
>
> As Geert pointed out in another reply, that prevents the use of
> earlyconsole on an exynos SoC + fully modular generic kernel. Are we
> okay with removing the ARCH_EXYNOS dependency on the early console
> driver now?

IMHO not in upstream, as there is no upstream use yet for not having
the dependencies.

Even if there was, I think it is good to have dependencies like
ARCH_EXYNOS, as they let us partition the (19000, as Arnd said recently)
Kconfig symbols into better manageable groups.  Without these, we cannot
do better than "depends on ARM || ARM64 || COMPILE_TEST".

Greg says that's what defconfig files are for, but the arm64 policy is
to have a single defconfig file only.  But thanks to the ARCH_* symbol,
you can take arm64 defconfig, disable the ARCH_* symbols not applicable
to your platform, and have a good start for a config file tailored to
your platform. Note that works for the arm multi_v*_defconfigs, too.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
