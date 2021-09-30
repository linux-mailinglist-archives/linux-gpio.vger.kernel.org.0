Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F70E41D82A
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Sep 2021 12:56:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350197AbhI3K6O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 06:58:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350201AbhI3K6I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Sep 2021 06:58:08 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC800C06176E
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 03:56:25 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id t8so9374504wri.1
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 03:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=/VMupglYU4EOxZ9GIvUTD4Oa9Wz9bmjm6P6VPn5LJEQ=;
        b=m1SFtJApbC2xkdEpuLj5DyxW/ZNBB3L7xGICBs7nWMebGOeAqWLF6G98j1uRrydwdz
         kW9Wv8B1NalzEcHPk886QneW10d5dpY+3Cfp5doLRn5nJGPqcxYpgVOrCDaiAkMk35Y+
         cQ1gpG0C3q0MtwU07e4bd2uwrs3jzj+7az1QyIuHHbCmmqs17OG/Caf9trFEvntoVxFc
         enDWOVWJFBMJxHgnMAIenc/2yvQwwVMFRm+mDFqFI0YoriBV8IfPY9Q7E8oAXVvItZ7a
         vbQnrhdeb7cVt2u22M7t3zvtzg4wL1e1HkQNCeqxcHkySWPWv3Ler0H4IflvMKjzDiI7
         jC8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/VMupglYU4EOxZ9GIvUTD4Oa9Wz9bmjm6P6VPn5LJEQ=;
        b=rny2r9qz7jTfUfT6lSVGgAyZQSoboac5xWOah8o3fx/sGfehh7gv/OzFGlhIIfIE9Z
         DtiMAuU+EfR1yF1i/r5pIKC8JR/QxjmQQF3JqwOolt13POxVhZTMDhR0276a1hzOyJff
         zfYgfo4PFJ+oYokvMCiYMS9NBFLCp4Xl9EdZ7OljL8epJavrXLiADbl2I+V8Ji5lVoM1
         4jxwyRsiLZoDFt1Xs6g9y+e01Jn1ZI0XxZyZ38KD9ehYBSXN5yXVQHW5YsMK1nFNli+p
         F/aum+BvDtPd6yQqGirftOI+fxYdZBCoFWrRxBnrThTBtcMty2SY1HAVkWlVz114nJI4
         7d1A==
X-Gm-Message-State: AOAM530tv0SXXp4fPsPYv9v0AtnCCjP4z+0GO/vQpOLXprhZ4CDhHn2E
        J0rDcEGFnicqea2F2gmWn40s8w==
X-Google-Smtp-Source: ABdhPJypOUvaFKcTlUycVS7eKZhECtrth44ZiCPYHEO6MZ0vTZaWDKWjEfaWkJeRfx6pupOWXq6ZEw==
X-Received: by 2002:a5d:47cf:: with SMTP id o15mr989697wrc.394.1632999384182;
        Thu, 30 Sep 2021 03:56:24 -0700 (PDT)
Received: from google.com ([95.148.6.233])
        by smtp.gmail.com with ESMTPSA id c7sm3413926wmq.13.2021.09.30.03.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 03:56:23 -0700 (PDT)
Date:   Thu, 30 Sep 2021 11:56:21 +0100
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
Message-ID: <YVWX1fFB1L1K3Mnn@google.com>
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com>
 <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <c65bf0db-6fd1-eb05-f407-37c41f9125f4@canonical.com>
 <YVWCK5QO331rfhJJ@google.com>
 <CAMuHMdVkF--Oq_EBRq-8Wn=E5DyOVzgSNYwo8ujf18zRCJSL9Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMuHMdVkF--Oq_EBRq-8Wn=E5DyOVzgSNYwo8ujf18zRCJSL9Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 30 Sep 2021, Geert Uytterhoeven wrote:

> Hi Lee,
> 
> On Thu, Sep 30, 2021 at 11:23 AM Lee Jones <lee.jones@linaro.org> wrote:
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
> 
> Why?

Because without them the image wouldn't functional on any level.

But you're right, there is still no requirement for it to be built-in.

> > For a kernel image which is designed to be generic i.e. one that has
> > the ability to boot on vast array of platforms, the drivers simply
> > have to be *available*.
> 
> If the drivers are really essential/necessary/required, this precludes
> running the generic kernel image on the platform that requires them,
> making the kernel not sufficiently generic.

If they are not at all present, then yes.  However that is not what is
being suggested.  The essential functionality will be provided.  Just
not built-in.

> > Forcing all H/W drivers that are only *potentially* utilised on *some*
> > platforms as core binary built-ins doesn't make any technical sense.
> > The two most important issues this causes are image size and a lack of
> > configurability/flexibility relating to real-world application i.e.
> > the one issue we already agreed upon; H/W or features that are too
> > new (pre-release).
> 
> True, if "potentially".  If not potentially, they must be included.

I'm not sure what you're trying to say here.  Would you mind elaborating?

> > Bloating a generic kernel with potentially hundreds of unnecessary
> > drivers that will never be executed in the vast majority of instances
> > doesn't achieve anything.  If we have a kernel image that has the
> > ability to boot on 10's of architectures which have 10's of platforms
> > each, that's a whole host of unused/wasted executable space.
> 
> The key here is if the driver is required or not to use the platform,
> and why it is required.  If the requirement comes from some deficiency
> in the kernel code or config system, it should be fixed, if possible.
> And the fix should be tested.
> If it cannot be fixed, the driver should be included, else it would
> preclude running the generic kernel on the affected platform.

Sorry, I'm not following.

> > In order for vendors to work more closely with upstream, they need the
> > ability to over-ride a *few* drivers to supplement them with some
> > functionality which they believe provides them with a competitive edge
> > (I think you called this "value-add" before) prior to the release of a
> > device.  This is a requirement that cannot be worked around.
> >
> > By insisting on drivers (most of which will not be executed in the
> > vast majority of cases) to be built-in, you are insisting on a
> > downstream kernel fork, which all of us would like to avoid [0].
> >
> > [0] Full disclosure: part of my role at Linaro is to keep the Android
> > kernel running as close to Mainline as possible and encourage/push the
> > upstream-first mantra, hence my involvement with this and other sets.
> > I assure you all intentions are good and honourable.  If you haven't
> > already seen it, please see Todd's most recent update on the goals and
> > status of GKI:
> >
> >   Article: https://tinyurl.com/saaen3sp
> >   Video:   https://youtu.be/O_lCFGinFPM
> >
> > > We don't even know what are these unsupported, downstream platforms
> > > you want customize kernel for. They cannot be audited, cannot be
> > > compared.  Affecting upstream platforms just because
> > > vendor/downstream does not want to mainline some code is
> > > unacceptable. Please upstream your drivers and DTS.
> >
> > > You also mentioned downstream devices but without actually ever defining
> > > them. Please be more specific. What SoC, what hardware?
> >
> > Accepting changes based on the proviso that vendors upstream all of
> > their work-in-progress solutions is an unfair position.  We already
> > discussed why upstreaming support for bleeding edge H/W and
> > functionality is unrealistic in terms of competitive advantage.
> >
> > Besides, we might not be talking about new silicon at all (I don't
> > believe anyone alluded to that).  The flexibility in configuration
> > simply allows for generic upstream drivers to be swapped out for ones
> > which may have more or slightly different functionality (that can't be
> > publicly shared until release).
> 
> The replacement drivers are already a downstream kernel fork, which you
> would like to avoid?

Avoid, yes, absolutely.

However, in the real world of competitive tech, other than in extreme
cases such as; fully open source, community driven, cute embedded
hobby platforms, there will always be changes required on-top of
upstream projects.  Even as upstream kernel developers we need to
understand and respect that.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
