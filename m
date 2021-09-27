Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6143A419094
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Sep 2021 10:16:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233450AbhI0ISC (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Sep 2021 04:18:02 -0400
Received: from mail-vs1-f44.google.com ([209.85.217.44]:39675 "EHLO
        mail-vs1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233337AbhI0ISB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 27 Sep 2021 04:18:01 -0400
Received: by mail-vs1-f44.google.com with SMTP id o124so17216921vsc.6;
        Mon, 27 Sep 2021 01:16:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SkSrzLRRCEtxglHN45gEJ7vXlzyQxRYfqeN16r5ttK4=;
        b=tr22dtcOrPUT3g3Wso1F0wIXAiNu7OW9SSWLYCTMKrw72s5vdeUiH/NNRf5oEPFp0P
         kciBsU83ZOCV5ohiAI47527heH+hfj24gx4C0nVtbjeYCpa3TsxYczUrWxNS3/qV3tem
         bYqBXevzKB9qAC1qVgmTdHpPiMBZ94aeBN1GZi71HXRuNK52E6gqhT6epqIacI51TILh
         uAwwBBaa6MUtUIWgQrqOsYjLMtrdIgYvnURxifUFR2hXvYVbZY/x5mDHx0KsfVQbkdXU
         ie+4sE1gBZ8bhOEQZE7bIo6H0xFSDqTm5pzZzGUI7Gx4BMiULrZauQZMExubgUeXuw/X
         XRJw==
X-Gm-Message-State: AOAM532UaGaMJlwisUGjGBUdle94qYgZURttlF+5b1SFZVuhGWqLY45u
        SQSKbVPFjK8TaADgDMS1PKmvP9Ss36Trw57joRQ=
X-Google-Smtp-Source: ABdhPJzv+gOnCHWhqnX2nJzuiw1pLZl/hx3RKpCY4M1PiufwAVsP/5GrZDWA7t+AXtENLrLjDr1hsNiQGU9BRWcB52I=
X-Received: by 2002:a67:cc1c:: with SMTP id q28mr17238153vsl.37.1632730583484;
 Mon, 27 Sep 2021 01:16:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210920190350.3860821-1-willmcvicker@google.com>
 <7735b09c-cf1c-5e37-a737-9a330fbacf1e@canonical.com> <YUmTwZPqrCfRMekd@google.com>
 <d6212801-f2a0-a6a7-6154-0f99b57f1c4d@canonical.com> <CAGETcx9wp3cbsehODj=oAd658hF6KNL5Qiy2nVc=7Bxqxxwimw@mail.gmail.com>
 <5ec72235-add4-d6dd-f89f-ca3941c9878e@canonical.com>
In-Reply-To: <5ec72235-add4-d6dd-f89f-ca3941c9878e@canonical.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 27 Sep 2021 10:16:12 +0200
Message-ID: <CAMuHMdXU=BKJugMXggyZYBUd+fB7CSd8F5iCWqcBw894OZCZHQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] arm64: Kconfig: Update ARCH_EXYNOS select configs
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Saravana Kannan <saravanak@google.com>,
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

Hi Krzysztof,

On Mon, Sep 27, 2021 at 10:08 AM Krzysztof Kozlowski
<krzysztof.kozlowski@canonical.com> wrote:
> On 25/09/2021 04:17, Saravana Kannan wrote:
> > On Tue, Sep 21, 2021 at 1:25 AM Krzysztof Kozlowski
> > <krzysztof.kozlowski@canonical.com> wrote:
> >> On 21/09/2021 10:11, Lee Jones wrote:
> >>> On Tue, 21 Sep 2021, Krzysztof Kozlowski wrote:
> >>>> On 20/09/2021 21:03, Will McVicker wrote:
> >>>>> This patch series tries to address the issue of ARCH_EXYNOS force selecting
> >>>>> a handful of drivers without allowing the vendor to override any of the
> >>>>> default configs. This takes away from the flexibilty of compiling a generic
> >>>>> kernel with exynos kernel modules. For example, it doesn't allow vendors to
> >>>>> modularize these drivers out of the core kernel in order to share a generic
> >>>>> kernel image across multiple devices that require device-specific kernel
> >>>>> modules.
> >>>>
> >>>> You do not address the issue in these patches. The problem you describe
> >>>> is that drivers are not modules and you are not changing them into modules.
> >>>
> >>> The wording is unfortunate.  The reason for this change doesn't have
> >>> much to do with kernel modules.
> >>>
> >>> Let's go back in time 18 months or so when Greg KH submitted this [0]
> >>> patch, which you Acked.  Greg was trying to solve the problem of not
> >>> having to enable ARCH_EXYNOS on kernels which are designed to be
> >>> platform agnostic (sometimes called Generic Kernels).  For some reason
> >>> SERIAL_SAMSUNG is the only symbol with these dependencies, so the
> >>> solution seemed simple and straight forward at the time.
> >>>
> >>> However, For sound reasons Geert NACKed the patch.
> >>>
> >>> Quoting from [1] he says:
> >>>
> >>>   "A generic kernel will include Samsung SoC support, hence
> >>>   PLAT_SAMSUNG or ARCH_EXYNOS will be enabled."
> >>
> >> Yes, it's correct reasoning. There is also one more use-case -
> >> non-upstreamed (out of tree) platform which wants to use Exynos-specific
> >> drivers. Something like was happening with Apple M1 except that it got
> >> upstreamed and we do not care much about out-of-tree.
> >>
> >>> However, since the entry for ARCH_EXYNOS *insists* on building-in a
> >>> bunch of other symbols (via 'select') which will be unused in most
> >>> cases, this is not a currently acceptable approach for many Generic
> >>> Kernels due to size constraints.
> >>
> >> In the mainline kernel there is no such use case. If you want to have
> >> Exynos-whatever-driver (e.g. SERIAL_SAMSUNG or S3C RTC), you should
> >> select ARCH_EXYNOS because otherwise it does not make any sense. Zero
> >> sense. Such kernel won't work.
> >>
> >> It makes sense only if there is some other work, hidden here, where
> >> someone might want to have SERIAL_SAMSUNG or S3C RTC without
> >> ARCH_EXYNOS. Although GKI is not that work because GKI kernel will
> >> select ARCH_EXYNOS. It must select ARCH_EXYNOS if it wants to support
> >> Exynos platforms.
> >>
> >> Therefore I expect first to bring this "some other work, hidden here" to
> >> broader audience, so we can review its use case.
> >>
> >>> What this patch does is migrates those symbols from being 'select'ed
> >>> (always built-in with no recourse) to 'default y'.  Where the former
> >>> cannot be over-ridden, but the latter can be via a vendor's
> >>> defconfig/fragment.
> >>
> >> It cannot be overridden by vendor fragment because options are not
> >> visible. You cannot change them.
> >>
> >> The patch does nothing in this regard (making them selectable/possible
> >> to disable), which is why I complained.
> >>
> >>> I doubt many (any?) of these symbols can be converted to kernel
> >>> modules anyway, as they are required very early on in the boot
> >>> sequence.
> >>
> >> True, some could, some not. Also some platforms are set up via
> >> bootloader, so actually could "survive" till module is loaded from some
> >> initrd.
> >
> > I was trying to chime in, but the discussion got spread out across all
> > the patches. Since the cover letter seems to have everyone, I thought
> > I'd reply here. Hope you don't mind. I'll try to respond/chime in on
> > the various topics that were raised across the patches.
> >
> > Yes, the next patch series would To/Cc folks correctly. William simply
> > forgot to use the --to-cover and --cc-cover options when using git
> > send-email.
> >
> > I agree with you that it doesn't make sense to have ARCH_EXYNOS
> > enabled but to have all the clock drivers exynos compiled out. Then
> > one obviously can't boot an exynos platform using that kernel.
>
> If downstream kernel does not use any upstream platforms (e.g.
> Exynos5433 or Exynos7) and has its own drivers for everything, then
> downstream does not even need ARCH_EXYNOS. Just disable it.

I guess that's how they got to "[PATCH 1/2] tty: serial: samsung_tty:
build it for any platform"...
https://lore.kernel.org/lkml/20200220102628.3371996-1-gregkh@linuxfoundation.org/

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
