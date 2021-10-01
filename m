Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 01B9641ED79
	for <lists+linux-gpio@lfdr.de>; Fri,  1 Oct 2021 14:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354372AbhJAMdW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 Oct 2021 08:33:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352491AbhJAMdW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Oct 2021 08:33:22 -0400
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA85BC061775
        for <linux-gpio@vger.kernel.org>; Fri,  1 Oct 2021 05:31:37 -0700 (PDT)
Received: by mail-wm1-x32e.google.com with SMTP id j27so7139370wms.0
        for <linux-gpio@vger.kernel.org>; Fri, 01 Oct 2021 05:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Mu18CAq1hBqJeqwZJAQst74KZfOgiaFerApR3I6y0OU=;
        b=FXQiOVBOuXGIos9ZeYjN3BTAxm8yH1TdT07eKtbvce8xv5IVrtB1Lg4FQNFN9p7TN9
         QkzNV6Ct/N3bi2v03QgZ1xJ+RqGFou/Pao0LO5z6nRQ51/hYNajXGlPREYU8VP7YoD6Y
         vV13HXltj32P+yT4nhrAPpmLdz3iJUMgJuVprWHaBQkgObe1fnscPjuC3mtmfv6wIUB1
         zgZQWcaz0BAljE8CIgE7XCnwZRuScBaNR274lLCpj9jara54mzkZPLfAIs3Ehiyyluo3
         TRuxz5k1l+uYwZM5+DfHuL4h2dX6BIBeF0LRqMKWNoL9E0He3LhLvGa3XQg3e5Yq0tTQ
         9DUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Mu18CAq1hBqJeqwZJAQst74KZfOgiaFerApR3I6y0OU=;
        b=aJtC4nhsmSIoMW6Qj7JjBst7VZqbxPA+1KPL8HNxk/f4gNiJZyyoHD24gVg4qA8ohL
         8sAbnvNhM2SFlLeg2H74Gsnc4BCarYG0d2RRoCYHILG3vChiyXYKvfdmRVZeoW3rFZxY
         zxLqMuTY8J0TBRXAn8hlAuvaDcJ0qMjbLMZCC4hoAp/7Zq91sEHDoaLVAn1RURr5MJnX
         /EujrHw0a9C8B857ktCYHfUGsBg4eTG9jwmEzbAAWrELoLeOPa9sdleMUDerOYRkvXS7
         DloOVvvyTU979b4eLkNVMhLoSyU/6iAD1xrAPj5Th1bdkclP4lfCDCJEuDslxgeqJcSS
         YCmg==
X-Gm-Message-State: AOAM533R+Ib4oP8Lp66s30Sp4MTIghD/mh0Y2u1KH6RI9qX8rWsPUXAd
        XD4WSVJMljG+teMJw/hfNdDD3w==
X-Google-Smtp-Source: ABdhPJyANjmM1xve1FUQ4nbwObWE0NHXAsZCEc1kKceOWCG8u6kOYtyXw5EldAPiHn3NgpgT0bxlGA==
X-Received: by 2002:a05:600c:3646:: with SMTP id y6mr4250718wmq.61.1633091496338;
        Fri, 01 Oct 2021 05:31:36 -0700 (PDT)
Received: from google.com ([95.148.6.233])
        by smtp.gmail.com with ESMTPSA id v18sm5429361wml.44.2021.10.01.05.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 05:31:35 -0700 (PDT)
Date:   Fri, 1 Oct 2021 13:31:33 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Saravana Kannan <saravanak@google.com>,
        Olof Johansson <olof@lixom.net>,
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
        Geert Uytterhoeven <geert@linux-m68k.org>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select
 configs
Message-ID: <YVb/pQ1l34TcP81G@google.com>
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com>
 <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <CAOesGMgSt_mYvRzF0rC=fnjMYGO9EX0_Ow2cD1d8XKLD5pHsZA@mail.gmail.com>
 <CAGETcx-b0ea-rqH+fj37sq9SLWY=+ePK94Y6rnLPuNbqFVBWmw@mail.gmail.com>
 <CAOesGMhQ3YsLJeQ7aUfb=0oNa3uPCx42wO1U7-ArqJTAUq1G3Q@mail.gmail.com>
 <CAGETcx_k2-mo9oUcYhsXhhsazLdwbifjP7ZT8pvyEbWB5k_qQg@mail.gmail.com>
 <CAK8P3a1HtDoEDeqs42s1hDzCZMwU7MhudJ7TVONn6TjoijaWRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK8P3a1HtDoEDeqs42s1hDzCZMwU7MhudJ7TVONn6TjoijaWRw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, 01 Oct 2021, Arnd Bergmann wrote:
> The vmlinux file is clearly too big and includes too much stuff that should
> be in loadable modules

This for me is the crux of the matter.

The ability to replace modules was only brought to light as an "and
also, this is possible".  However in retrospect, given the attention
this has received, it probably shouldn't have even mentioned, as it's
not that important.

We should focus on the benefits of making parts of the kernel modular
if technically possible.  The most prominent of those is core binary
size, since this has a direct impact on boot-time and RAM usage.

Reclaiming dead code after boot is certainly one way to tackle part of
the problem.  Ensuring that it's not even loaded into RAM in the first
place is a better more encompassing solution to both issues IMHO.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
