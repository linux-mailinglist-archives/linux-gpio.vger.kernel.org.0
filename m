Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 549B2412F11
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Sep 2021 09:09:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230078AbhIUHKe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Sep 2021 03:10:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230107AbhIUHK3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 21 Sep 2021 03:10:29 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 047E0C061575
        for <linux-gpio@vger.kernel.org>; Tue, 21 Sep 2021 00:08:49 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id q11so36191601wrr.9
        for <linux-gpio@vger.kernel.org>; Tue, 21 Sep 2021 00:08:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Cyc6wAvsiYvYVdHCei88zIBgag7U9mJqxcUyH3r1CWM=;
        b=EQ6/tvjLOGJ2R/hFuNnnTCnC3AcN5Ge1Dz3gKT8j2pYOuibo305AQJBZ28DeSmOwey
         kgy2cyVUs/8oOsaprC3nuq2fBpukx47phqrIvU2glPkoMWq6t2gzOWSs0Mn+9RwHiJN+
         lwvpXENzFUrZYGWwtwbWjOxPsO5d32qtFdDIca8DcC8yUYzTKLm63eiTUO0iUM/NkMiG
         OzuWjrwmGZWqvOiP7z+RCa6OI/vzA19wb+zFsyJeiYrIVOOEepCGECJ4jmHQ61b9k+8p
         pATfcSEH8tYyMdeTvkMn76kTisaNd4zYTqVyTA7j7Ir+87DSM8yr6SBWe01TN3GpzQ+T
         VlNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Cyc6wAvsiYvYVdHCei88zIBgag7U9mJqxcUyH3r1CWM=;
        b=FLgom/vMxZwlkeDNLLL8wPxE4w2sJL0DTOe3jVNONhmCy9+BM6oOb0qcMh27kcRuML
         R+r2HFMzVRjRrvtm4imh40P5bXUVfHBunls4ihTvE4ihMa4lvbib1DvEpN1M9YGmHhJ1
         9LEOn0MmgFzpIJEdBBr5ra9wwRKjbWVRuPG5Ivt7FZYF1IN1UY+rtpzM5P/ixZmvxuSQ
         4Q3SWoXqmRpVA9uLOlm8XeZ98bIJMusR72SRqKMkXBkaiLdKaKK8IVX/ojv43FHj55QY
         GvQQiIcgred573v6DKofxJQPEV6DR57Bc5PMSpZ3mfD1uH/KlZ0uAb/L//T0qXZf0Plo
         vP/w==
X-Gm-Message-State: AOAM533KA9yPNMCJ8r0GpyX9KaKOw2A5y5kEXtMu3obuqmUaRnSuXImW
        aC3jpi8E5TPw2QMCeVHzVBxaEA==
X-Google-Smtp-Source: ABdhPJyPQ/o1Rh01pdww1XQiFIlGSq+2ub4xW3Lao90e3fivXN469GPYJVCY/MaD/ditL/22MZeDcw==
X-Received: by 2002:a1c:28b:: with SMTP id 133mr2886271wmc.14.1632208127619;
        Tue, 21 Sep 2021 00:08:47 -0700 (PDT)
Received: from google.com ([95.148.6.233])
        by smtp.gmail.com with ESMTPSA id g22sm1654479wmp.39.2021.09.21.00.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Sep 2021 00:08:47 -0700 (PDT)
Date:   Tue, 21 Sep 2021 08:08:44 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Will McVicker <willmcvicker@google.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v1 0/4] arm64: Kconfig: Update ARCH_EXYNOS select configs
Message-ID: <YUmE/LqlFCiongfn@google.com>
References: <20210920190350.3860821-1-willmcvicker@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210920190350.3860821-1-willmcvicker@google.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 20 Sep 2021, Will McVicker wrote:

> This patch series tries to address the issue of ARCH_EXYNOS force selecting
> a handful of drivers without allowing the vendor to override any of the
> default configs. This takes away from the flexibilty of compiling a generic
> kernel with exynos kernel modules. For example, it doesn't allow vendors to
> modularize these drivers out of the core kernel in order to share a generic
> kernel image across multiple devices that require device-specific kernel
> modules.
> 
> To address this without impacting the existing behavior, this series
> switches the default config logic for the offending configs to use "default
> y if ARCH_EXYNOS" versus having ARCH_EXYNOS directly select them. I have
> verified that these patches do not impact the default aarch64 .config.
> 
> Will McVicker (4):
>   clk: samsung: change COMMON_CLK_SAMSUNG default config logic
>   soc: samsung: change SOC_SAMSUNG default config logic
>   pinctrl: samsung: change PINCTRL_EXYNOS default config logic
>   rtc: change HAVE_S3C_RTC default config logic
> 
>  arch/arm64/Kconfig.platforms    | 7 -------
>  drivers/clk/samsung/Kconfig     | 1 +
>  drivers/pinctrl/samsung/Kconfig | 1 +
>  drivers/rtc/Kconfig             | 1 +
>  drivers/soc/samsung/Kconfig     | 4 ++++
>  5 files changed, 7 insertions(+), 7 deletions(-)

For all patches in the series:

Reviewed-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
