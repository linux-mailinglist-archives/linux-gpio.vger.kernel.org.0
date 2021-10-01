Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75AAB41E900
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 10:20:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352290AbhJAIVz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Oct 2021 04:21:55 -0400
Received: from mail-vs1-f46.google.com ([209.85.217.46]:39687 "EHLO
        mail-vs1-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352084AbhJAIVy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Oct 2021 04:21:54 -0400
Received: by mail-vs1-f46.google.com with SMTP id o124so10401459vsc.6;
        Fri, 01 Oct 2021 01:20:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DfZkNDXprgFeEDtNW0IpliJa71/Awrmxhz88BlTWGSM=;
        b=7kmU7W9iHr2BQkCi+E53QhN9EabBeiwczez91w7THyDdWd/4LT5GJRGqgRAgxqfZkL
         mB4j+6ftYZwJ3s13k4n1ejnq3rHZEQqXd1lbPLl6N0fWiKbZvkQRCdlxgrw0LDZRFQ/X
         vFhERethevDWJwG8wali/rky1AclbsQMlSaeat1hYoWb/RUUUHa0Yk1JrzP0cl7CQaMA
         pKSHXNIOtccO7ABk9G3sGcV+Wkrn8f1s8HUs3reQeuHoCw0pGXCBD5a0GgvFqdJOQbEM
         35zhIVZlnnqIZoDyOuCM3YWcTWtKEsJfuDqKjxvIHpG446dU9wHvIuNpqA0Mrj10ag4C
         waLg==
X-Gm-Message-State: AOAM533O3CucH6rKXJ9YwQZXjDcOKBxpSZHkoJbfUvZZwMd+cSYaS4Tp
        vtP209jgrdMec5QIaPJW0/hUWrhwjmQNXhDYRpA=
X-Google-Smtp-Source: ABdhPJyNLAjrm2t54Xsm+4NoybmQdD783UH99/hZ003FsF/8QUgG9DfzJ5Ksgdg20mcspR3qLQDBaKgpvLEQU5Ud4Q0=
X-Received: by 2002:a67:e15a:: with SMTP id o26mr1277792vsl.50.1633076409679;
 Fri, 01 Oct 2021 01:20:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com> <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <CAOesGMgSt_mYvRzF0rC=fnjMYGO9EX0_Ow2cD1d8XKLD5pHsZA@mail.gmail.com> <CAGETcx-b0ea-rqH+fj37sq9SLWY=+ePK94Y6rnLPuNbqFVBWmw@mail.gmail.com>
In-Reply-To: <CAGETcx-b0ea-rqH+fj37sq9SLWY=+ePK94Y6rnLPuNbqFVBWmw@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Oct 2021 10:19:58 +0200
Message-ID: <CAMuHMdWhCB_zg6TwjYfz+=vc+_Wd5yzuAAzk=2ToZOQSAyaiJA@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select configs
To:     Saravana Kannan <saravanak@google.com>
Cc:     Olof Johansson <olof@lixom.net>,
        Will McVicker <willmcvicker@google.com>,
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

Hi Saravana,

On Fri, Oct 1, 2021 at 7:24 AM Saravana Kannan <saravanak@google.com> wrote:
> I skimmed through the emails and you all make a lot of good points. It
> looks like you all at least like the idea of being able to have a
> minimal generic kernel where everything that can be a module is a
> module. Please correct me if I'm wrong on that.
>
> I was thinking about this patch series and I was wondering if it'd be
> good to come at it from the other end. Instead of taking the mostly
> builtin generic kernel and trying to rip out drivers as modules (and
> not having enough hardware to test them all) and hitting all these
> issues, we could come at it from the other end.
>
> A config like ARM64_MINIMAL_GENERIC_KERNEL that's off by default. But
> if it's selected, all the "selects" done by the various ARCH_XXX are
> not done any more. Something like:
>
> ARCH_XXX
>     select XXX_CLK1 if !ARM64_MINIMAL_GENERIC_KERNEL
>     select XXX_PINCTRL1 if !ARM64_MINIMAL_GENERIC_KERNEL
>
> ARCH_YYY
>     select YYY_CLK1 if !ARM64_MINIMAL_GENERIC_KERNEL
>     select YYY_PINCTRL1 if !ARM64_MINIMAL_GENERIC_KERNEL
>
> And ARM64_MINIMAL_GENERIC_KERNEL itself would select the absolutely
> mandatory stuff that can never be made into a module like the GIC,
> architectured timer (as Geert mentioned) and UART early console
> driver. I'm not sure if ARM32 has an equivalent to the standardized

While the UART early console can work (assuming the related hardware
setup has been done by the boot loader), the actual serial driver
usually cannot, as it relies on clocks, PM Domains, pin control, which
won't be available until the corresponding modular drivers are loaded.
Actually earlycon is a debug feature, so I'm wondering if you actually
want that in your GKI kernel?

> GIC and arch timer. Basically the minimal kernel would need a timer
> for the scheduler tick and IRQ controller to get the timer IRQ and the
> fixed clock driver if the archtimer uses one to get its frequency and
> the early UART console is pointless as a module (so build it in to
> allow debugging/development).
>
> And then all new drivers, we should make sure are implemented as
> tristate drivers. And we can go back and slowly work on converting
> existing drivers to modules (community effort -- not one person or
> entity) -- at least the ones where the author has hardware or ones
> where the change is very likely to be correct and someone else is
> willing to test it. We'll never be able to support some/all ARM32 (do
> they even have a GIC/arch timer standard?), but at least for ARM64,
> this seems like a viable goal.

Cortex-A7/A15 and later have GIC and architectured timer, so it should
work for contemporary systems.
Cortex-A9 systems may have GIC, and TWD and/or Global Timer (but I've
seen SoCs where the interrupt for the latter was not wired :-(.

What are the plans for other architectures?
I've seen similar patches being applied for e.g. MIPS.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
