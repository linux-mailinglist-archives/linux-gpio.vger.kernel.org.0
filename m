Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA97A41F391
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 19:48:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354136AbhJARuO (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Oct 2021 13:50:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232413AbhJARuM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Oct 2021 13:50:12 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52703C06177F
        for <linux-gpio@vger.kernel.org>; Fri,  1 Oct 2021 10:48:28 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id s17so36772460edd.8
        for <linux-gpio@vger.kernel.org>; Fri, 01 Oct 2021 10:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E435VevWHNvFfwzbwrSEsjtgrZwBjPFMUID//rqAmHc=;
        b=HrAVVITqn8UALvaJMLEFX1IEvob89yUVhXwoNDpJg2aBCxAEgrEksiWwl/Pr+Hxc+3
         3RVhXkMCRrBwLVNDhch3zhiHFzIOOlRJ43XQEf2/qVzwZWoM4xh5uiPYcItFTNLYWqgN
         zJYjgi49ajbjRRiITLovVYrTLgWqIYL+DdavFCwUGZNXs8U2nYCNEZ7zf3dTADSfYOfE
         dvmto4Slm0JeiFuzCB/HUvabALZvuz1ENrxPhlr87swuBhd8mcRoUFk0X1t9n+u+gkxA
         S1OAGY5w7NyVZNtD0UqccaAqAJWMZiyKOF0s0xVpbKbwkfTU7fVFJFTTCMfdlK2Q9aAN
         1hsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E435VevWHNvFfwzbwrSEsjtgrZwBjPFMUID//rqAmHc=;
        b=GPD95h2LtaAjq1Zjlm+pYtaZn4T4cVOGeZRRw2AjxsuZhwAoQdrG931xOrUOP0Rjvv
         /b3bgp/1/n2x1isyXFs/tc+wfw538sTKo2ijsIgd7vxFGGwoyQ++5n6Am5BTtPCyC/3t
         IDbeMUiyEgf/FuTA7MoWmW3F6zcfRAKkdGuxixAIg8yl0Qc7pSJJ1kb2nAKCULaRev/w
         JkvE0yV/DbtNjUGPgu6/Gq23q2dbjx54Lp3B2Ug1VeX2xa0DigbRfHaRVWFk6lDKNnoy
         hc5Pz19DmrbvBWTh6Nt1A6gVVGoL/v1ls8O8wOGmCva1yVa85EfUKms9fLzqMt+eKUUt
         KVCg==
X-Gm-Message-State: AOAM530Y+ZN8F5ukt981IPDThdvbaEF74FfCWXiRjhE4RP3ZamhbIOSL
        5jk78w774tDO9cG+gAepMtcY8IGh9huxkcjiEWG8wA==
X-Google-Smtp-Source: ABdhPJx2UKqAdOO40LH0YnQG+0frDPf32/9ThPP5PQp8PkBdz4P4kYMJpQVj2Lm4c8EVFOtz5hRi6xe/znckYZs8U8o=
X-Received: by 2002:a17:906:3a58:: with SMTP id a24mr7926006ejf.67.1633110506264;
 Fri, 01 Oct 2021 10:48:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com> <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <CAOesGMgSt_mYvRzF0rC=fnjMYGO9EX0_Ow2cD1d8XKLD5pHsZA@mail.gmail.com>
 <CAGETcx-b0ea-rqH+fj37sq9SLWY=+ePK94Y6rnLPuNbqFVBWmw@mail.gmail.com>
 <CAOesGMhQ3YsLJeQ7aUfb=0oNa3uPCx42wO1U7-ArqJTAUq1G3Q@mail.gmail.com>
 <CAMuHMdUkMwyA-bk7hfr7S7TE-_S9eBUxKWKmpj0rDCUvHL+fxw@mail.gmail.com>
 <CAOesGMg_eA5PNzsL76xv6kDQ2QUZeCwC04BNeucfGXkFSOE=Tw@mail.gmail.com>
 <CABYd82YSh=q-QrUN+nbzMZ7Z9SKq8V7eAL1=m1mg-j-f8BCbDg@mail.gmail.com> <CAOesGMiubqENbGSuQ_FQA59vA897R5nkgq5vu5Tg6kqbEVdz0A@mail.gmail.com>
In-Reply-To: <CAOesGMiubqENbGSuQ_FQA59vA897R5nkgq5vu5Tg6kqbEVdz0A@mail.gmail.com>
From:   Will McVicker <willmcvicker@google.com>
Date:   Fri, 1 Oct 2021 10:48:09 -0700
Message-ID: <CABYd82ZHCrd5qhFUCTFPxPXn69LgdfWbW7zSMoTKaKq7FXvx=g@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select configs
To:     Olof Johansson <olof@lixom.net>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
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
        "Cc: Android Kernel" <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rtc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 1, 2021 at 10:16 AM Olof Johansson <olof@lixom.net> wrote:
>
> On Fri, Oct 1, 2021 at 9:51 AM Will McVicker <willmcvicker@google.com> wrote:
> >
> > On Fri, Oct 1, 2021 at 9:00 AM Olof Johansson <olof@lixom.net> wrote:
> > >
> > > On Fri, Oct 1, 2021 at 4:59 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > >
> > > > Hi Olof,
> > > >
> > > > On Fri, Oct 1, 2021 at 7:36 AM Olof Johansson <olof@lixom.net> wrote:
> > > > > A much more valuable approach would be to work towards being able to
> > > > > free up memory by un-probed drivers at the end of boot. That would
> > > > > possibly benefit all platforms on all architectures.
> > > >
> > > > We used to have such a functionality in arch/ppc (not arch/powerpc!),
> > > > where code/data could be tagged __prep, __chrp, or __pmac, to put it
> > > > in a special section, and to be freed with initdata when unused.  It
> > > > was removed in v2.6.15[1], as the savings weren't worth the hassle.
> > > > In a more fragmented space like arm the memory lost due to alignment
> > > > of the sections would be even more substantial.
> > >
> > > Yeah, the balance between per-platform code size and overall kernel
> > > code size shifted over time to a point where it wasn't as meaningful
> > > on ppc.
> > >
> > > > Another problem is to know when is the end of the boot, especially
> > > > with deferred probing.
> > >
> > > Most of this code either has a module_init() or an initcall that
> > > actually registers the drivers and/or probes for the platform and does
> > > the work.
> > >
> > > This means you can have a late equivalent hook/initcall that
> > > determines whether this path ended up being probed/used. If it wasn't,
> > > you can then unregister and flag the corresponding memory to be freed
> > > at the end, and would take out the heuristics and guessing on needing
> > > to do it automatically from the code path that's doing said freeing.
> > >
> > >
> > > -Olof
> >
> > First off, I appreciate the constructive conversations and I
> > understand the ask here. So I'd like to close the "we don't want this"
> > and "this isn't possible" conversation. We have already proven
> > downstream that it is in fact possible to modularize these drivers on
> > other SoCs (mentioned earlier if you missed it) and I'd like to direct
> > the conversation towards verifying/testing here instead of negatively
> > arguing about how SoC vendors aren't upstreaming their drivers. I
> > think everyone understands that, but unfortunately I have no control
> > over that even though I would love everyone to work upstream directly.
> >
> > I am fine with forcing these drivers to always be enabled in some form
> > upstream even though it doesn't really make much sense for a generic
> > kernel that will run on Qualcomm, Exynos, Mediatek, (you name it) SoC
> > devices. I thought about how to do this yesterday and wasn't able to
> > come up with a proper solution that didn't always force this driver to
> > be a module when CONFIG_MODULES is enabled.
>
> This line of reasoning: "I couldn't think of a better option" made us
> merge a userspace ABI some time ago that within a few months was
> replaced with a better solution. In that case it was the kernel
> headers bundling with a build (extending the vmlinux size by a lot),
> that seemed to have no concerns about binary growth. Not all that far
> after that went in, the BPF folks came up with a solid solution for
> CO-RE by introducing BTF, etc.
>
> So, the argument "I can't think of a better solution" is a local
> maxima that we shouldn't settle for if there's a likely better global
> maxima available with a bit more time/effort. If we say "this problem
> is worth solving but this doesn't seem to be the solution we want to
> go for" we might actually be better off long-term.
>
>
> -Olof

If the answer is, "we don't have a solution for that" then that's
fine. I'm not an expert at Kconfig configurations and am asking if
there is already a way to handle this. To me it sounded like there
might be a solution already due to this policy of "we don't allow
disabling drivers that are essential." I'll wait for Krysztof to
respond (or someone who has a potential solution) before I dig into
this deeper.

--Will
