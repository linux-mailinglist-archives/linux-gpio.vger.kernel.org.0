Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7C541D9D9
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Sep 2021 14:32:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350353AbhI3MeX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 08:34:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350326AbhI3MeX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Sep 2021 08:34:23 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8918CC06176D
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 05:32:40 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 205-20020a1c01d6000000b0030cd17ffcf8so8287969wmb.3
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 05:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=En+5YrjM9LlGpDVk1qLlFN9D0UbWW1q5lQuQYRqATW0=;
        b=yfsE6YBweYWAU+QUeuH3l8VsYBkS4YRRfFTAUbjlBj1cbRhLGuilAthUvCDsjVG6qG
         dh7Un3DHfvuQkyyrFJFwq8AhY5EmkfL6gZH3T0qH6kCuP3dY11JPJ+zYBLNlHJOa4WbJ
         WDoUGO7Mwssy6Pk5zzLVJuz5p4EHEt91JchNU2FJrwVuE4ymbJdvsdY1Lid6mWlO8oMD
         CvwDNMTaO4Fkcb4/5p5pN7CsXquoA27mdQL5XssFNF+X5SmKC+b4vhrZvb9Bq6SVzKQE
         4O+RpT/FLQgl5/RMerb1fzqgCamevlhivoXdQi+9CIBJcpRSYPnYF0EsbwK16966zetB
         t16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=En+5YrjM9LlGpDVk1qLlFN9D0UbWW1q5lQuQYRqATW0=;
        b=lcwTneqoNm54akyXPOWwGspB+QA9/pV9vfwyaOfR2u1bYKf0XqByO8jKw2/+Cdb4DZ
         O6Ih8QNqvyTEaX3M36xt+7dzIDP0KPv3rJwj+RvD/XRS2k2UYKEFPV4aVoKRG3drKsCj
         NYBEDFa8YHLktmZuAYn6PYZavRV9h/xnV9HGzz6ev9r9h4n01E6yjxUJNlI3b/cX3Odk
         LTCrJbJ6vgzzPKO0rdbcw9TFEKWFIi9lSxwgkS1wE0aIiA4Y2smc/26HQ+UFU8s/daFw
         lMlcXXBK4rfY77NzDoyh2RPYuHAnbSCtmJ+0epAUrXKzwo8t2GSwzcqPkxAz/18qTkKS
         G3Tg==
X-Gm-Message-State: AOAM533/VMkdYMG4j3Wd4MAf77SnCEVnTg+THEm4CDU8BjAQZJ7fDWyM
        oesx4eokiSLBIMqYTUmuebGjbg==
X-Google-Smtp-Source: ABdhPJypzNOV6MSKCZRk58YQppRsxlxVtOIMAQuJ+ppbdRDySWcSJDA77/Nq8JTkyQcJRwpBLZSNMg==
X-Received: by 2002:a05:600c:1911:: with SMTP id j17mr2845306wmq.149.1633005159069;
        Thu, 30 Sep 2021 05:32:39 -0700 (PDT)
Received: from google.com ([95.148.6.233])
        by smtp.gmail.com with ESMTPSA id i7sm2958529wrp.5.2021.09.30.05.32.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 05:32:38 -0700 (PDT)
Date:   Thu, 30 Sep 2021 13:32:36 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Will McVicker <willmcvicker@google.com>,
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
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select
 configs
Message-ID: <YVWuZN/CcApCDE0g@google.com>
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com>
 <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <c65bf0db-6fd1-eb05-f407-37c41f9125f4@canonical.com>
 <YVWCK5QO331rfhJJ@google.com>
 <d79df9ff-fc22-8d29-011d-c3cb7dbbfa4e@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d79df9ff-fc22-8d29-011d-c3cb7dbbfa4e@canonical.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 30 Sep 2021, Krzysztof Kozlowski wrote:

> On 30/09/2021 11:23, Lee Jones wrote:
> > I've taken the liberty of cherry-picking some of the points you have
> > reiteratted a few times.  Hopefully I can help to address them
> > adequently.
> > 
> > On Thu, 30 Sep 2021, Krzysztof Kozlowski wrote:
> >> Reminder: these are essential drivers and all Exynos platforms must have
> >> them as built-in (at least till someone really tests this on multiple
> >> setups).
> > 
> >> Therefore I don't agree with calling it a "problem" that we select
> >> *necessary* drivers for supported platforms. It's by design - supported
> >> platforms should receive them without ability to remove.
> > 
> >> The selected drivers are essential for supported platforms.
> > 
> > SoC specific drivers are only essential/necessary/required in
> > images designed to execute solely on a platform that requires them.
> > For a kernel image which is designed to be generic i.e. one that has
> > the ability to boot on vast array of platforms, the drivers simply
> > have to be *available*.
> 
> By "essential", I meant drivers which are needed for supported platform
> to boot properly.

Yes, I know what you meant by essential.

My comment still stands.  As long as they are provided, it should work.

> Also without significant performance penalty due to
> probe deferrals.

Agreed.  We will try to find a way to test this.

> > Forcing all H/W drivers that are only *potentially* utilised on *some*
> > platforms as core binary built-ins doesn't make any technical sense.
> > The two most important issues this causes are image size and a lack of
> > configurability/flexibility relating to real-world application i.e.
> > the one issue we already agreed upon; H/W or features that are too
> > new (pre-release).
> 
> Geert responded here. If drivers are essential for supported platforms
> to boot, having them built-in has technical sense.

We're going to have to agree to disagree here.

None of us are currently aware of any technical reasons why these
particular drivers have to be built-in.  Hopefully we can prove this
out with testing.

> > By insisting on drivers (most of which will not be executed in the
> > vast majority of cases) to be built-in, you are insisting on a
> > downstream kernel fork, which all of us would like to avoid [0].
> 
> The same with all the DTS and hundreds of drivers you keep out of tree.

I do not keep any drivers out of tree. :)

> >> We don't even know what are these unsupported, downstream platforms
> >> you want customize kernel for. They cannot be audited, cannot be
> >> compared.  Affecting upstream platforms just because
> >> vendor/downstream does not want to mainline some code is
> >> unacceptable.
> >>
> >> Please upstream your drivers and DTS.
> > 
> > Accepting changes based on the proviso that vendors upstream all of
> > their work-in-progress solutions is an unfair position.  
> 
> You twisted (or ignored) my words here. I said before - sacrificing any
> mainline platform (e.g. reliable boot for distro) for an out-of-tree
> vendor which does no want to upstream drivers is the unfair position.
> One of the incentives of upstreaming is to be able to shape kernel and
> be considered in kernel upstream decisions. That's the privileged for
> upstreamed platforms - they have an impact.
> 
> Vendor decides to stay out - fine, vendor's choice. You loose impact.
> Any sad words like "oh upstream does not want to change for me" should
> receive a message: "please join the upstream :), so we will change
> together".

No one is proposing to sacrifice anything.

This change is believed to be benign.

> > We already
> > discussed why upstreaming support for bleeding edge H/W and
> > functionality is unrealistic in terms of competitive advantage.
> 
> Nope, my last point was not responded to. You said that there is no
> point for vendor to upstream bleeding edge HW. Then you said that there
> is also little point to upstream older HW.

The driver in question is already upstream.

It is my hope that the vendor will realign with Mainline and upstream
the differences (providing the current competitive edge).  Although I
have no real influence in this regard, as I have no contact with
them.

> Basically following this approach you agree that vendor does not have to
> do anything because it is inconvenient for him.
> 
> However upstream has to adapt to downstream vendor, right?
> 
> No, this is *unfair to all the platforms we upstreamed*.

The point here is that this change should not be a determent to
anyone.

> > Exynos isn't special in this regard.  This applies to any vendor who
> > releases Android images and wishes to be solve all of the issues the
> > GKI project addresses (please read the article above for more about
> > this).
> 
> We have then slightly different goals, because you are driven by Android
> release images and this is why you are less interested in NXP and
> Renesas. Only some vendors should receive such changes? No, in upstream
> we are not focusing on any specific distro and there are other uses of
> Exynos (and NXP and Renesas) platforms. Therefore the choice/policy and
> overall design tries to match all vendors, not only some subset
> convenient to Android.
> 
> If Android (or some vendor) wants to have exception for a specific
> driver/platform, it must do it in upstream way, by contributing, not by
> changing to match downstream needs while ignoring other users.

No users are being ignored.  No damaging changes are being proposed.

This has little to do with Android and everything to do with the
possibly of a more generic kernel.  Moving drivers out of platform
code and into /drivers along with enabling components as modules has
been an on-going effort for many years now.

I'm struggling to see how this is different.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
