Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C4A841ECBE
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 14:00:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354197AbhJAMBm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Oct 2021 08:01:42 -0400
Received: from mail-vs1-f42.google.com ([209.85.217.42]:37424 "EHLO
        mail-vs1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230510AbhJAMBl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Oct 2021 08:01:41 -0400
Received: by mail-vs1-f42.google.com with SMTP id f2so10080626vsj.4;
        Fri, 01 Oct 2021 04:59:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WR3+MFp1ibU3x0ZkDpZ824RbuuABr+gcaM86vEqsRNo=;
        b=BRh0WV659CFjH7+kssWg1sAcI9VqDTEcTsFY/uFEZGBqu8/7+TuPXPinTIa1/wJrnS
         iaiez80AjRm92GWRM12qn63IJbZWUGT0/w3QUZfF/LoPpHlu7AptnSbeGqx7+OzRfDiq
         vd84ZzWCt2JSrUYQI8GfWXfJmeDIGDU/2c8+qhAd6UvHDFFhz6Jv3ylVr9znvDop++J5
         NOOuGU2OGRtbpPd/1ZPSaW6WlpmNkjzv9sAZ2y37s4b5seSmb3yqu9nyJAt/GVjhXjI2
         xOvbBq4ekPSAQbKG3E2xUx5wbbdIkzlhmhLs39t4PKwsdamsWbcUDmlYomyKH1M6cYou
         UR3w==
X-Gm-Message-State: AOAM532SJsWlWQWH3XCjBJyJ+ckkJqC43di0zIo8UqKsqo5CnnhP+44f
        Q0rjRhKskBdTAkGHK7jnL2gFKcvhb/Vn2R1VGIeDsmsBGiY=
X-Google-Smtp-Source: ABdhPJyx7zg5kQJYsNSRRoL0YNyux79qxJGzafd5NYmhZJ2xCJLygfQPVXUiK/lmOsYXRavGy+aJ1Mf8eL4lb+ZaszY=
X-Received: by 2002:a67:c295:: with SMTP id k21mr790199vsj.37.1633089597139;
 Fri, 01 Oct 2021 04:59:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com> <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <CAOesGMgSt_mYvRzF0rC=fnjMYGO9EX0_Ow2cD1d8XKLD5pHsZA@mail.gmail.com>
 <CAGETcx-b0ea-rqH+fj37sq9SLWY=+ePK94Y6rnLPuNbqFVBWmw@mail.gmail.com> <CAOesGMhQ3YsLJeQ7aUfb=0oNa3uPCx42wO1U7-ArqJTAUq1G3Q@mail.gmail.com>
In-Reply-To: <CAOesGMhQ3YsLJeQ7aUfb=0oNa3uPCx42wO1U7-ArqJTAUq1G3Q@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 1 Oct 2021 13:59:45 +0200
Message-ID: <CAMuHMdUkMwyA-bk7hfr7S7TE-_S9eBUxKWKmpj0rDCUvHL+fxw@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select configs
To:     Olof Johansson <olof@lixom.net>
Cc:     Saravana Kannan <saravanak@google.com>,
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

Hi Olof,

On Fri, Oct 1, 2021 at 7:36 AM Olof Johansson <olof@lixom.net> wrote:
> A much more valuable approach would be to work towards being able to
> free up memory by un-probed drivers at the end of boot. That would
> possibly benefit all platforms on all architectures.

We used to have such a functionality in arch/ppc (not arch/powerpc!),
where code/data could be tagged __prep, __chrp, or __pmac, to put it
in a special section, and to be freed with initdata when unused.  It
was removed in v2.6.15[1], as the savings weren't worth the hassle.
In a more fragmented space like arm the memory lost due to alignment
of the sections would be even more substantial.

Another problem is to know when is the end of the boot, especially
with deferred probing.

[1] 6c45ab992e4299c8 ("[PATCH] powerpc: Remove section free() and
linker script bits")

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
