Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E23EA41D77E
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Sep 2021 12:17:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349863AbhI3KTP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 06:19:15 -0400
Received: from mail-vk1-f180.google.com ([209.85.221.180]:38508 "EHLO
        mail-vk1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349855AbhI3KTO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Sep 2021 06:19:14 -0400
Received: by mail-vk1-f180.google.com with SMTP id g15so2557560vke.5;
        Thu, 30 Sep 2021 03:17:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xww07Zb9oxWhnQt3Rf+43gxWzamezvsJhiLH6/udH8Q=;
        b=A8kRsP9q5b2QqSrxsEJYbTgSq1UxfuhVedYJKsU0AglowwAxoNq2HKbnay26aNUAhV
         veHYqdqQeqtfW6OeN3HRmz2icKWpqRrlGQVXZ9baLrxep9CvvjQQzfRx5XIG09FbU5Lk
         wO/88GZrBNSCGmZTow8qLY6walzTHgi7UznQNhGse3ldvzrLDzootyIiEgRZ/I1nY1jD
         fofmI04YCQ0a4h4hN2IqM4gNxBCVIWhx556nXCdWgnLhDp7SURMYud5fH5mcqqk40Vxb
         z7NcYX0Pba6r7sY4D5HIFH/IbGU/+XrqtCXB67aKqSpt5IkmuUjXUmBOSvUVyH6j+fBk
         XekQ==
X-Gm-Message-State: AOAM530XQ9p4ofC+Uvk7h3f0Fvs4FUcUoKy4vHJpzb2kFFeothLf0Szb
        J9POIjAdMOMxjF9GXgC5vxUPbcOzTEE2Cbo2+Nc=
X-Google-Smtp-Source: ABdhPJwTYjczjYTcnfC37BMSYK9ULqTz9w0E7VOsP/0+7WFo4h24H4I63g8feMLnecpnafjFzdml9kY82wunsCV3SHY=
X-Received: by 2002:a1f:230c:: with SMTP id j12mr2451761vkj.11.1632997050760;
 Thu, 30 Sep 2021 03:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com> <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <c65bf0db-6fd1-eb05-f407-37c41f9125f4@canonical.com> <YVWCK5QO331rfhJJ@google.com>
In-Reply-To: <YVWCK5QO331rfhJJ@google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 30 Sep 2021 12:17:16 +0200
Message-ID: <CAMuHMdVkF--Oq_EBRq-8Wn=E5DyOVzgSNYwo8ujf18zRCJSL9Q@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select configs
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Will McVicker <willmcvicker@google.com>,
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

Hi Lee,

On Thu, Sep 30, 2021 at 11:23 AM Lee Jones <lee.jones@linaro.org> wrote:
> I've taken the liberty of cherry-picking some of the points you have
> reiteratted a few times.  Hopefully I can help to address them
> adequently.
>
> On Thu, 30 Sep 2021, Krzysztof Kozlowski wrote:
> > Reminder: these are essential drivers and all Exynos platforms must have
> > them as built-in (at least till someone really tests this on multiple
> > setups).
>
> > Therefore I don't agree with calling it a "problem" that we select
> > *necessary* drivers for supported platforms. It's by design - supported
> > platforms should receive them without ability to remove.
>
> > The selected drivers are essential for supported platforms.
>
> SoC specific drivers are only essential/necessary/required in
> images designed to execute solely on a platform that requires them.

Why?

> For a kernel image which is designed to be generic i.e. one that has
> the ability to boot on vast array of platforms, the drivers simply
> have to be *available*.

If the drivers are really essential/necessary/required, this precludes
running the generic kernel image on the platform that requires them,
making the kernel not sufficiently generic.

> Forcing all H/W drivers that are only *potentially* utilised on *some*
> platforms as core binary built-ins doesn't make any technical sense.
> The two most important issues this causes are image size and a lack of
> configurability/flexibility relating to real-world application i.e.
> the one issue we already agreed upon; H/W or features that are too
> new (pre-release).

True, if "potentially".  If not potentially, they must be included.

> Bloating a generic kernel with potentially hundreds of unnecessary
> drivers that will never be executed in the vast majority of instances
> doesn't achieve anything.  If we have a kernel image that has the
> ability to boot on 10's of architectures which have 10's of platforms
> each, that's a whole host of unused/wasted executable space.

The key here is if the driver is required or not to use the platform,
and why it is required.  If the requirement comes from some deficiency
in the kernel code or config system, it should be fixed, if possible.
And the fix should be tested.
If it cannot be fixed, the driver should be included, else it would
preclude running the generic kernel on the affected platform.

> In order for vendors to work more closely with upstream, they need the
> ability to over-ride a *few* drivers to supplement them with some
> functionality which they believe provides them with a competitive edge
> (I think you called this "value-add" before) prior to the release of a
> device.  This is a requirement that cannot be worked around.
>
> By insisting on drivers (most of which will not be executed in the
> vast majority of cases) to be built-in, you are insisting on a
> downstream kernel fork, which all of us would like to avoid [0].
>
> [0] Full disclosure: part of my role at Linaro is to keep the Android
> kernel running as close to Mainline as possible and encourage/push the
> upstream-first mantra, hence my involvement with this and other sets.
> I assure you all intentions are good and honourable.  If you haven't
> already seen it, please see Todd's most recent update on the goals and
> status of GKI:
>
>   Article: https://tinyurl.com/saaen3sp
>   Video:   https://youtu.be/O_lCFGinFPM
>
> > We don't even know what are these unsupported, downstream platforms
> > you want customize kernel for. They cannot be audited, cannot be
> > compared.  Affecting upstream platforms just because
> > vendor/downstream does not want to mainline some code is
> > unacceptable. Please upstream your drivers and DTS.
>
> > You also mentioned downstream devices but without actually ever defining
> > them. Please be more specific. What SoC, what hardware?
>
> Accepting changes based on the proviso that vendors upstream all of
> their work-in-progress solutions is an unfair position.  We already
> discussed why upstreaming support for bleeding edge H/W and
> functionality is unrealistic in terms of competitive advantage.
>
> Besides, we might not be talking about new silicon at all (I don't
> believe anyone alluded to that).  The flexibility in configuration
> simply allows for generic upstream drivers to be swapped out for ones
> which may have more or slightly different functionality (that can't be
> publicly shared until release).

The replacement drivers are already a downstream kernel fork, which you
would like to avoid?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
