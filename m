Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B61DE41DA00
	for <lists+linux-gpio@lfdr.de>; Thu, 30 Sep 2021 14:39:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350966AbhI3MlW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 30 Sep 2021 08:41:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350963AbhI3MlW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 30 Sep 2021 08:41:22 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B7A0C06176F
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 05:39:39 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id w29so9810348wra.8
        for <linux-gpio@vger.kernel.org>; Thu, 30 Sep 2021 05:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=y6Zw5vGV4wBB593iryFIJ1oUvhj3gXCvlT2YuBiI5Vk=;
        b=wspNYwBb0pdNBBaJ+OxQc9CRnog1NSxtwePpOG8BW8OQ4mONAKykv6Go6SVQJYjuYu
         0bB0jtEf1f5o3HR3ko2Z2aZGTLu/CnJaR/zul4uAgYdN8Pb7zFvgQUEnKD60jD0AMurR
         0wgjcEccprlll+ORjdw3oZasPFy2QGIRxZIYmCRYju1ly5LU8ES2o0zkTg2MYKj+J1pq
         Azc8e5ytOWlPaQTIuRiIQ+2QCMtGUWBiQkSxBu864Am8dhoCkRlWpNXlPuJbCtN+rojd
         0PAF3R8brCiIV6pFfh65IwyLeIpJxc2R5+EDiXVnItANVn8hVLK2jP/5dmoTrxew1cUw
         bQ1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=y6Zw5vGV4wBB593iryFIJ1oUvhj3gXCvlT2YuBiI5Vk=;
        b=VC3toEYcMoH1Sl8z+mIQZ5UpIZZPfcddUYuKN8om54zUuo/PVmKB+BkMms4DvaZ1bv
         wBWll4YTjq+i/+P+C7XkUw4NSNjY39Il2bVVe3G8pu8aHHWWmLgXH/LQfaVig1sGYFMY
         jxIisZT4oumrEcmP60LDaxrajJbNWoUxHg2aGOtKHf/PVrMtmL005XA/hXzsa4ES1GaY
         JQ5DhuzOnV0iUY242W8GSgovjLYW1d1N/I/LekbS2FOAKLziZWlSVTyE6eZSTMAsAhTM
         2roEDyufyDmFWpnTUU9Tw1SN4BYX0aOJQI7MVNRGxaJ7GmTJaPVBN6+8gZicae6PzU5V
         QwZw==
X-Gm-Message-State: AOAM530LGuBm/eLoEq1ZE0JE3uBHUXplGyayjC9lD+cRAK8wlngpeK/I
        cs5GrSwTLH60jc4aChBk4a852Q==
X-Google-Smtp-Source: ABdhPJwaqKGVecsjvlptya3O6PJWSH4P8v5nliYYQ8SIrpDwOrZNbA56RNmczgz9+gqO9+kCmN3NpQ==
X-Received: by 2002:adf:a402:: with SMTP id d2mr5744060wra.266.1633005577899;
        Thu, 30 Sep 2021 05:39:37 -0700 (PDT)
Received: from google.com ([95.148.6.233])
        by smtp.gmail.com with ESMTPSA id n14sm2974159wms.0.2021.09.30.05.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 05:39:37 -0700 (PDT)
Date:   Thu, 30 Sep 2021 13:39:35 +0100
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
Message-ID: <YVWwBz8jrznqXah4@google.com>
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com>
 <CABYd82YodFDwBxexCv+0hpYrdYEX1Z1CvnRkmnBPkEJNJ4bssQ@mail.gmail.com>
 <c65bf0db-6fd1-eb05-f407-37c41f9125f4@canonical.com>
 <YVWCK5QO331rfhJJ@google.com>
 <72d27a82-9d4d-1f91-bd1f-ebead3b75ffa@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <72d27a82-9d4d-1f91-bd1f-ebead3b75ffa@canonical.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, 30 Sep 2021, Krzysztof Kozlowski wrote:

> On 30/09/2021 11:23, Lee Jones wrote:
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
> 
> Side topic, why this patchset is in your scope or Will's/Google's scope?
> Just drop it from Android main kernel, it will not be your problem. I
> mean, really, you don't need this patchset in your tree at all. The only
> platform which needs it, the only platform which will loose something
> will be one specific vendor. Therefore this will be an incentive for
> them to join both discussions and upstream development. :)

How would they fix this besides upstreaming support for unreleased
work-in-progress H/W?

Haven't I explained this several times already? :)

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
