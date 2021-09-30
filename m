Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EBF841D89F
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Sep 2021 13:25:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350403AbhI3L1B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 07:27:01 -0400
Received: from mail-vs1-f45.google.com ([209.85.217.45]:36374 "EHLO
        mail-vs1-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350389AbhI3L1B (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Sep 2021 07:27:01 -0400
Received: by mail-vs1-f45.google.com with SMTP id h30so6827497vsq.3;
        Thu, 30 Sep 2021 04:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E4u4EeOna6gGNv61tDuQLud+cv6R+yD4WKIZiYqhxYg=;
        b=zn8BNuAI0rLInOaw/ZpK4o1yqL6gKx2eTIvX+mEP1POejojkK7mnyPpUZBgd3kksNb
         /0iC/5xOMt+taNQxtlAVP+sTsfkLEAT8jj/iRXyMVuVgJ4IoqIs9RXLxzivn4VCKGhLp
         ZpC1m/RFtI4Uuqk96wCEXBkbYHs3z0g4GLJI+IqBkdtx5A7jGwqmBJjVSVtwSRBlbyhC
         nwqI6uWzaLPEkBhjgBV841pVhiKHHBoBVZ+a3x2rRFqVO3voF/yRRlBcJQKCCsTydb+q
         IJBj0IvWuROW0MiaDVRnXbR519zsDlOaWZJ17icrwvuE6ZS6ey5bRFu2bUlxJeXzoE3X
         9tJg==
X-Gm-Message-State: AOAM531+GGYarzWxhtSVX3skBlbCqiTuc6gBlmmCj5HDkUv3FyP8J0Ti
        krZH8T03fxMNBuhQGK9d7QK59aMcRtjBTjJpxTM=
X-Google-Smtp-Source: ABdhPJwtYPhT4dVxPEB3GWtrVuwFV+A5f63KMP1Llp8OL6G+fNBMIp1rXsoQDwNXodcMK35TqjyhIHusevl27khUwZg=
X-Received: by 2002:a05:6102:21d4:: with SMTP id r20mr2796665vsg.50.1633001117937;
 Thu, 30 Sep 2021 04:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com> <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <c65bf0db-6fd1-eb05-f407-37c41f9125f4@canonical.com> <YVWCK5QO331rfhJJ@google.com>
 <CAMuHMdVkF--Oq_EBRq-8Wn=E5DyOVzgSNYwo8ujf18zRCJSL9Q@mail.gmail.com> <YVWX1fFB1L1K3Mnn@google.com>
In-Reply-To: <YVWX1fFB1L1K3Mnn@google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 30 Sep 2021 13:25:06 +0200
Message-ID: <CAMuHMdUkP6Jg5sXAXEw7twGqPs8rKftiyh+wYomFVdRHyhUrgQ@mail.gmail.com>
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

On Thu, Sep 30, 2021 at 12:56 PM Lee Jones <lee.jones@linaro.org> wrote:
> On Thu, 30 Sep 2021, Geert Uytterhoeven wrote:
> > On Thu, Sep 30, 2021 at 11:23 AM Lee Jones <lee.jones@linaro.org> wrote:
> > > I've taken the liberty of cherry-picking some of the points you have
> > > reiteratted a few times.  Hopefully I can help to address them
> > > adequently.
> > >
> > > On Thu, 30 Sep 2021, Krzysztof Kozlowski wrote:
> > > > Reminder: these are essential drivers and all Exynos platforms must have
> > > > them as built-in (at least till someone really tests this on multiple
> > > > setups).
> > >
> > > > Therefore I don't agree with calling it a "problem" that we select
> > > > *necessary* drivers for supported platforms. It's by design - supported
> > > > platforms should receive them without ability to remove.
> > >
> > > > The selected drivers are essential for supported platforms.
> > >
> > > SoC specific drivers are only essential/necessary/required in
> > > images designed to execute solely on a platform that requires them.
> >
> > Why?
>
> Because without them the image wouldn't functional on any level.
>
> But you're right, there is still no requirement for it to be built-in.
>
> > > For a kernel image which is designed to be generic i.e. one that has
> > > the ability to boot on vast array of platforms, the drivers simply
> > > have to be *available*.
> >
> > If the drivers are really essential/necessary/required, this precludes
> > running the generic kernel image on the platform that requires them,
> > making the kernel not sufficiently generic.
>
> If they are not at all present, then yes.  However that is not what is
> being suggested.  The essential functionality will be provided.  Just
> not built-in.

I really meant "essential/necessary/required to be built-in".

> > > Forcing all H/W drivers that are only *potentially* utilised on *some*
> > > platforms as core binary built-ins doesn't make any technical sense.
> > > The two most important issues this causes are image size and a lack of
> > > configurability/flexibility relating to real-world application i.e.
> > > the one issue we already agreed upon; H/W or features that are too
> > > new (pre-release).
> >
> > True, if "potentially".  If not potentially, they must be included.
>
> I'm not sure what you're trying to say here.  Would you mind elaborating?

It was a comment to your "*potentially* utilised on *some* platforms".
It is clear they are not used on the other ("not *some*") platforms, but your
sentence was unclear whether they are always or only sometimes used on
"*some*" platforms.
"always" => "not potentially"
"sometimes" => "potentially".

I hope this makes it more clear.

> > > Bloating a generic kernel with potentially hundreds of unnecessary
> > > drivers that will never be executed in the vast majority of instances
> > > doesn't achieve anything.  If we have a kernel image that has the
> > > ability to boot on 10's of architectures which have 10's of platforms
> > > each, that's a whole host of unused/wasted executable space.
> >
> > The key here is if the driver is required or not to use the platform,
> > and why it is required.  If the requirement comes from some deficiency
> > in the kernel code or config system, it should be fixed, if possible.
> > And the fix should be tested.
> > If it cannot be fixed, the driver should be included, else it would
> > preclude running the generic kernel on the affected platform.
>
> Sorry, I'm not following.

It all depends on why the driver is "required to be built-in".
Depending on the reason behind that requirement, the driver can be
changed from built-in to modular without ill effects on functionality.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
