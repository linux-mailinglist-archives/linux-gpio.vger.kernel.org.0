Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9002241D95B
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Sep 2021 14:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348326AbhI3MKN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 08:10:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348209AbhI3MKM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Sep 2021 08:10:12 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AB6BC06176E
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 05:08:29 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id m22so4219630wrb.0
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 05:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=5fh0H0/jWr4jNH0+hAgBKwSacygBp5h9lUF6Rwc7alg=;
        b=HIqt7cGoqJJQIOdZP/Foj7lyVcPXpPckL+e8J8hEPS4X5BlSOs75D2MjxEHS9sXSue
         nbXyguX+HL4GYHA7dWpjKcBET3bGYvPe72KAAwoANqo6Btaq5vPwpia5jJrEDeWEDktW
         0HMh+lyxzlPBtMhRT9B0ZQvWnBV7LHyDFydMdObVoa5g8IGlAYhW08hb5bCVt1Qy0jWj
         6k2dsf5VdMaSCvk7oZJoneYuu7ltzLCKfRmauxvWtELLuhjTNmsorbLqrSE7QHPUVsQx
         kIcJcP3UTpwijuDznHqx/qf1fHaST4O4HxV4+34cyYnzeVI5LyzyRaLVYyOlVAxli8dZ
         5kwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=5fh0H0/jWr4jNH0+hAgBKwSacygBp5h9lUF6Rwc7alg=;
        b=IYWOsXftnkXeUc+CQWVYQSDCkWnKclbm7MXi3QlwRPl10DyDXb8YOm2EVXv/7SQCv4
         jfmMZ4H5tuoSEd6Mo19erB9Rlt3uyoqyJKvaMg6vgXIOapoQW4hepIylVYACKFMSNLd+
         Dc35PtcJ+8Lcsh1MYKF0ga9wkW8427XeGOTNzn+Mqo5RNnfCWKYOzkX63FBXHInYW7JP
         WTkIBlIzJYsXole/BBnZPElbpkiSszUUDUwMDorkxG+cbNxKRhC2friz2KYjHG/L90DR
         /TZBkgurci6puUX7lDp5vp4YQNe7njnoZGuWiSLIuNd++M5E1SM2T8SW9QyyDgRA7HdB
         6QhQ==
X-Gm-Message-State: AOAM532y8dDwOxqsc6o1tsfh45h9s18OgJxKiEIB/fb5DfO0mLDWMjZI
        cz+VLmuGm8GNs9OQd4fZX/E79g==
X-Google-Smtp-Source: ABdhPJybI7D4Op6CUpT3YQKDibjf3O8iYGR2Haw/KF8+iMJzOVuX0RjVV9HDMl4I/r5lf64HRvJ5gQ==
X-Received: by 2002:a5d:6c65:: with SMTP id r5mr5727101wrz.85.1633003708018;
        Thu, 30 Sep 2021 05:08:28 -0700 (PDT)
Received: from google.com ([95.148.6.233])
        by smtp.gmail.com with ESMTPSA id k22sm2928865wrd.59.2021.09.30.05.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 05:08:27 -0700 (PDT)
Date:   Thu, 30 Sep 2021 13:08:25 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
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
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select
 configs
Message-ID: <YVWoucIlDy/klYnL@google.com>
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com>
 <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <c65bf0db-6fd1-eb05-f407-37c41f9125f4@canonical.com>
 <YVWCK5QO331rfhJJ@google.com>
 <CAMuHMdVkF--Oq_EBRq-8Wn=E5DyOVzgSNYwo8ujf18zRCJSL9Q@mail.gmail.com>
 <YVWX1fFB1L1K3Mnn@google.com>
 <CAMuHMdUkP6Jg5sXAXEw7twGqPs8rKftiyh+wYomFVdRHyhUrgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdUkP6Jg5sXAXEw7twGqPs8rKftiyh+wYomFVdRHyhUrgQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 30 Sep 2021, Geert Uytterhoeven wrote:

> Hi Lee,
> 
> On Thu, Sep 30, 2021 at 12:56 PM Lee Jones <lee.jones@linaro.org> wrote:
> > On Thu, 30 Sep 2021, Geert Uytterhoeven wrote:
> > > On Thu, Sep 30, 2021 at 11:23 AM Lee Jones <lee.jones@linaro.org> wrote:
> > > > I've taken the liberty of cherry-picking some of the points you have
> > > > reiteratted a few times.  Hopefully I can help to address them
> > > > adequently.
> > > >
> > > > On Thu, 30 Sep 2021, Krzysztof Kozlowski wrote:
> > > > > Reminder: these are essential drivers and all Exynos platforms must have
> > > > > them as built-in (at least till someone really tests this on multiple
> > > > > setups).
> > > >
> > > > > Therefore I don't agree with calling it a "problem" that we select
> > > > > *necessary* drivers for supported platforms. It's by design - supported
> > > > > platforms should receive them without ability to remove.
> > > >
> > > > > The selected drivers are essential for supported platforms.
> > > >
> > > > SoC specific drivers are only essential/necessary/required in
> > > > images designed to execute solely on a platform that requires them.
> > >
> > > Why?
> >
> > Because without them the image wouldn't functional on any level.
> >
> > But you're right, there is still no requirement for it to be built-in.
> >
> > > > For a kernel image which is designed to be generic i.e. one that has
> > > > the ability to boot on vast array of platforms, the drivers simply
> > > > have to be *available*.
> > >
> > > If the drivers are really essential/necessary/required, this precludes
> > > running the generic kernel image on the platform that requires them,
> > > making the kernel not sufficiently generic.
> >
> > If they are not at all present, then yes.  However that is not what is
> > being suggested.  The essential functionality will be provided.  Just
> > not built-in.
> 
> I really meant "essential/necessary/required to be built-in".

Then I agree with you.  My position is that if they don't *have* to be
built-in, then why force it?

> > > > Forcing all H/W drivers that are only *potentially* utilised on *some*
> > > > platforms as core binary built-ins doesn't make any technical sense.
> > > > The two most important issues this causes are image size and a lack of
> > > > configurability/flexibility relating to real-world application i.e.
> > > > the one issue we already agreed upon; H/W or features that are too
> > > > new (pre-release).
> > >
> > > True, if "potentially".  If not potentially, they must be included.
> >
> > I'm not sure what you're trying to say here.  Would you mind elaborating?
> 
> It was a comment to your "*potentially* utilised on *some* platforms".
> It is clear they are not used on the other ("not *some*") platforms, but your
> sentence was unclear whether they are always or only sometimes used on
> "*some*" platforms.
> "always" => "not potentially"
> "sometimes" => "potentially".
> 
> I hope this makes it more clear.

Not really, but I'll try to clean mine up:

The aim is to have a single kernel (image + modules) that can be
booted on a plethora of platforms.  For the sake of argument say 10.
Let's also say that each of the platforms are equal and will be booted
the same amount of times.

Taking the example above, when I say that the H/W specific drivers
will only be *potentially* utilised, I mean that they will only be
bound and probed 1/10 times i.e. when booted on the associated
platform.  Which means that in the vast majority of boots (9/10) they
will lie dormant, taking up unnecessary space.

Another way to say this would be; the kernel needs to have the
capability to boot all of the supported platforms, but it will only
ever be utilised on one at a time.

> > > > Bloating a generic kernel with potentially hundreds of unnecessary
> > > > drivers that will never be executed in the vast majority of instances
> > > > doesn't achieve anything.  If we have a kernel image that has the
> > > > ability to boot on 10's of architectures which have 10's of platforms
> > > > each, that's a whole host of unused/wasted executable space.
> > >
> > > The key here is if the driver is required or not to use the platform,
> > > and why it is required.  If the requirement comes from some deficiency
> > > in the kernel code or config system, it should be fixed, if possible.
> > > And the fix should be tested.
> > > If it cannot be fixed, the driver should be included, else it would
> > > preclude running the generic kernel on the affected platform.
> >
> > Sorry, I'm not following.
> 
> It all depends on why the driver is "required to be built-in".
> Depending on the reason behind that requirement, the driver can be
> changed from built-in to modular without ill effects on functionality.

Absolutely.

There are cases where drivers simply can't be built as modules.  These
unavoidable situations are legitimate use-cases and the technology/
code-base will have to work around these as required.

The argument here is that if they can be separated and have been shown
to work well in either use-case, then it is my opinion that placing an
artificial barrier up based mostly on politics is not the correct
approach. 

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
