Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 421C241D8C4
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Sep 2021 13:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350420AbhI3L3U convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-gpio@lfdr.de>); Thu, 30 Sep 2021 07:29:20 -0400
Received: from mail-vs1-f54.google.com ([209.85.217.54]:38590 "EHLO
        mail-vs1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350416AbhI3L3U (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Sep 2021 07:29:20 -0400
Received: by mail-vs1-f54.google.com with SMTP id y141so6829599vsy.5;
        Thu, 30 Sep 2021 04:27:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=R0n80uXJhjvsdb8nwwGcbOkkET0omNYYJeYTRDyy/SI=;
        b=yS26ctsKeX57aAlqf7NDam9jPkw5ohC09ymZYj4vIJp2uhNaZOg3h6VJrGm914h1WT
         qznn/oG+2k35rk1uGid1H6Jm335JsLlOtim9EP8mZ3QqqQwV6qaoTS2ZDS3Ghb/XirpL
         BYocf6z00jZ0DVR6eGtM6cryTi3RcTTSmUDPlhsKoM3bQ14TgLr+eD+2U7OKGEXGcgS/
         mCCLw/4HoR9nz5FcXbkcHya/WxNQAHTqbCuNDNldQlrjarVHhfxSgcsP5FXCIpQQmQbS
         47FKRYHwVyHDsJC6Opf6nj3Us/olWRyLeAwFlfBw+sAK5wmIUTIIQ1XDHbloX5ZEBHbU
         5NBQ==
X-Gm-Message-State: AOAM5329iBddJ6wd5bqD36SqOu5JGk9+teRNkepMASFFUyesx2gKyRtW
        NOaba5DTotbe8ph+N5U9yvqExj3EI0GQaOrlxqM=
X-Google-Smtp-Source: ABdhPJyXAN0F5dsiwjAjlfy6er6qYnriP1vB7GdQ+i/Kg/UMjTKXQJReCJpTewOKooCa0vrxgqXzqX6uevEBzNVhCpw=
X-Received: by 2002:a67:cb0a:: with SMTP id b10mr3191112vsl.9.1633001257163;
 Thu, 30 Sep 2021 04:27:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com> <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <c65bf0db-6fd1-eb05-f407-37c41f9125f4@canonical.com> <YVWCK5QO331rfhJJ@google.com>
 <CA+Ln22EbXKsRFZ=3L4A_jqciRxG2hnAh9iKTfQ_Ypr2NJgDzQQ@mail.gmail.com>
In-Reply-To: <CA+Ln22EbXKsRFZ=3L4A_jqciRxG2hnAh9iKTfQ_Ypr2NJgDzQQ@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 30 Sep 2021 13:27:25 +0200
Message-ID: <CAMuHMdWRhNPUyWJ5f8V-w8TCw+AjF8EXC5RZ_9h7JLvJ4RvkEA@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select configs
To:     Tomasz Figa <tomasz.figa@gmail.com>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Will McVicker <willmcvicker@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
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
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Tomasz,

On Thu, Sep 30, 2021 at 1:01 PM Tomasz Figa <tomasz.figa@gmail.com> wrote:
> 2021年9月30日(木) 18:23 Lee Jones <lee.jones@linaro.org>:
> > I've taken the liberty of cherry-picking some of the points you have
> > reiteratted a few times.  Hopefully I can help to address them
> > adequently.
> >
> > On Thu, 30 Sep 2021, Krzysztof Kozlowski wrote:
> > > Reminder: these are essential drivers and all Exynos platforms must have
> > > them as built-in (at least till someone really tests this on multiple
> > > setups).
> >
> > > Therefore I don't agree with calling it a "problem" that we select
> > > *necessary* drivers for supported platforms. It's by design - supported
> > > platforms should receive them without ability to remove.
> >
> > > The selected drivers are essential for supported platforms.
> >
> > SoC specific drivers are only essential/necessary/required in
> > images designed to execute solely on a platform that requires them.
> > For a kernel image which is designed to be generic i.e. one that has
> > the ability to boot on vast array of platforms, the drivers simply
> > have to be *available*.
> >
> > Forcing all H/W drivers that are only *potentially* utilised on *some*
> > platforms as core binary built-ins doesn't make any technical sense.
> > The two most important issues this causes are image size and a lack of
> > configurability/flexibility relating to real-world application i.e.
> > the one issue we already agreed upon; H/W or features that are too
> > new (pre-release).
> >
> > Bloating a generic kernel with potentially hundreds of unnecessary
> > drivers that will never be executed in the vast majority of instances
> > doesn't achieve anything.  If we have a kernel image that has the
> > ability to boot on 10's of architectures which have 10's of platforms
> > each, that's a whole host of unused/wasted executable space.
> >
> > In order for vendors to work more closely with upstream, they need the
> > ability to over-ride a *few* drivers to supplement them with some
> > functionality which they believe provides them with a competitive edge
> > (I think you called this "value-add" before) prior to the release of a
> > device.  This is a requirement that cannot be worked around.
>
> [Chiming in as a clock driver sub-maintainer and someone who spent a
> non-insignificant part of his life on SoC driver bring-up - not as a
> Google employee.]
>
> I'd argue that the proper way for them to achieve it would be to
> extend the upstream frameworks and/or existing drivers with
> appropriate APIs to allow their downstream modules to plug into what's
> already available upstream.

Yes, that's one possible solution.
We do have to be careful this would not just become some fishy API
to touch deeply buried internals, and for which there are no valid use
cases in upstream.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
