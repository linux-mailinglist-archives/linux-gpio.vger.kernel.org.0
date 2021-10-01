Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D6EE41F284
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 18:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355035AbhJAQxV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Oct 2021 12:53:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354604AbhJAQxU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Oct 2021 12:53:20 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FAC5C06177E
        for <linux-gpio@vger.kernel.org>; Fri,  1 Oct 2021 09:51:36 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id ba1so37045262edb.4
        for <linux-gpio@vger.kernel.org>; Fri, 01 Oct 2021 09:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bBQZZYDYKRJHZigI6OY4bgMOmcGGR9Z1AlvP3TxeSEI=;
        b=s24lK/qyc7Hvu7PHx1upoHIf7M9KheKCgbiY3jC4htqP4K2hL8IPfH4FJA7GIOsfqD
         InRSTPJcDxqgsC+5JApYP6mycmEYweL32Rj80zaqoPRNmAzE9uF9o8YV2QvYI7epa10i
         xNiKV4whJUFQCX5h1Zhutyq8rJZ4tcsRViKX1FRnG18P/nrROuRoNUdFIWlysUPKyvuB
         a2AvXPYhYRbcOS/aWdNQLKv7maeKFw4I5cJg1t9R+SqWRh5cl3aupbc+Fdtg/KDgbbSr
         tO46ZhS1f9zorMIz9hzXLgOnCSew8ryM+60KbdTiQAJltydRYO61mPIrL5JOT6YWHdOF
         rsog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bBQZZYDYKRJHZigI6OY4bgMOmcGGR9Z1AlvP3TxeSEI=;
        b=KDartUvews22rnKysCf8JjFBlQEhd2K81XesJPZdU+ik/nW/m26Zajy85oLdGloqhg
         Bk7GJ3NkmlaiHn2JGHttVbmNboCkg4zfGncqdRYRyEeqLh3nQlOD09ij99AxA1xdrKlN
         /CdXr/dSl6j/jNd7ZS3TLNAZHknbB/QkOumKPIJcnnT8Hy0sTACy/P8hiJFVNpUKXeK2
         xRB6gYHwYxD1usmwJ5jPAYoY2zAalNkT4+qvHw2YyYFfTObPx2Q6CW4wEmq0gDUZkACt
         9P5PmVXdAjDTivuR2qU/SwrFCz6DSiDpZAkXZmbd4CO87EqN9m/2NyQ/nvnnHvWCCnrZ
         mHHw==
X-Gm-Message-State: AOAM531UFgRTJqtx4LGd/eAGLXLBT+L7OzpvnW0/RZCUyqZXxjjw4x+8
        7mvqhSeBo5UNTJPepMWDrlcX6XQhX3zo3KNxSuxxAg==
X-Google-Smtp-Source: ABdhPJxpLQAYt75NaH1vdWxiIroNTAgkPN0fO2kMs4YItEm5vqCDC80CQdBK9C2906B/kcwERy3e2blHW5dUToSMBAs=
X-Received: by 2002:a50:dacf:: with SMTP id s15mr15859419edj.385.1633107094312;
 Fri, 01 Oct 2021 09:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com> <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <CAOesGMgSt_mYvRzF0rC=fnjMYGO9EX0_Ow2cD1d8XKLD5pHsZA@mail.gmail.com>
 <CAGETcx-b0ea-rqH+fj37sq9SLWY=+ePK94Y6rnLPuNbqFVBWmw@mail.gmail.com>
 <CAOesGMhQ3YsLJeQ7aUfb=0oNa3uPCx42wO1U7-ArqJTAUq1G3Q@mail.gmail.com>
 <CAMuHMdUkMwyA-bk7hfr7S7TE-_S9eBUxKWKmpj0rDCUvHL+fxw@mail.gmail.com> <CAOesGMg_eA5PNzsL76xv6kDQ2QUZeCwC04BNeucfGXkFSOE=Tw@mail.gmail.com>
In-Reply-To: <CAOesGMg_eA5PNzsL76xv6kDQ2QUZeCwC04BNeucfGXkFSOE=Tw@mail.gmail.com>
From:   Will McVicker <willmcvicker@google.com>
Date:   Fri, 1 Oct 2021 09:51:17 -0700
Message-ID: <CABYd82YSh=q-QrUN+nbzMZ7Z9SKq8V7eAL1=m1mg-j-f8BCbDg@mail.gmail.com>
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

On Fri, Oct 1, 2021 at 9:00 AM Olof Johansson <olof@lixom.net> wrote:
>
> On Fri, Oct 1, 2021 at 4:59 AM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >
> > Hi Olof,
> >
> > On Fri, Oct 1, 2021 at 7:36 AM Olof Johansson <olof@lixom.net> wrote:
> > > A much more valuable approach would be to work towards being able to
> > > free up memory by un-probed drivers at the end of boot. That would
> > > possibly benefit all platforms on all architectures.
> >
> > We used to have such a functionality in arch/ppc (not arch/powerpc!),
> > where code/data could be tagged __prep, __chrp, or __pmac, to put it
> > in a special section, and to be freed with initdata when unused.  It
> > was removed in v2.6.15[1], as the savings weren't worth the hassle.
> > In a more fragmented space like arm the memory lost due to alignment
> > of the sections would be even more substantial.
>
> Yeah, the balance between per-platform code size and overall kernel
> code size shifted over time to a point where it wasn't as meaningful
> on ppc.
>
> > Another problem is to know when is the end of the boot, especially
> > with deferred probing.
>
> Most of this code either has a module_init() or an initcall that
> actually registers the drivers and/or probes for the platform and does
> the work.
>
> This means you can have a late equivalent hook/initcall that
> determines whether this path ended up being probed/used. If it wasn't,
> you can then unregister and flag the corresponding memory to be freed
> at the end, and would take out the heuristics and guessing on needing
> to do it automatically from the code path that's doing said freeing.
>
>
> -Olof

First off, I appreciate the constructive conversations and I
understand the ask here. So I'd like to close the "we don't want this"
and "this isn't possible" conversation. We have already proven
downstream that it is in fact possible to modularize these drivers on
other SoCs (mentioned earlier if you missed it) and I'd like to direct
the conversation towards verifying/testing here instead of negatively
arguing about how SoC vendors aren't upstreaming their drivers. I
think everyone understands that, but unfortunately I have no control
over that even though I would love everyone to work upstream directly.

I am fine with forcing these drivers to always be enabled in some form
upstream even though it doesn't really make much sense for a generic
kernel that will run on Qualcomm, Exynos, Mediatek, (you name it) SoC
devices. I thought about how to do this yesterday and wasn't able to
come up with a proper solution that didn't always force this driver to
be a module when CONFIG_MODULES is enabled.

For example, if I do this below, then we will be forcing all builds to
use CONFIG_XXX as a module if they want just one driver as a module.

config XXX
  tristate "blah blah" if COMPILE_TEST
  default m if (ARCH_XXX && MODULES)
  default ARCH_XXX

The best I was able to come up with was this below which would allow
the driver to be a module or built-in; however, obviously it lets you
disable it in EXPERT mode.

config XXX
  tristate "blah blah" if COMPILE_TEST || EXPERT
  default ARCH_XXX

Let me know if you have a better solution that doesn't force the
driver to be a module when CONFIG_MODULES=y. Saravana did propose a
MINIMUM_ARM64_GENERIC_KERNEL config that could solve this, but that
too was shot down.

Thanks,
Will
