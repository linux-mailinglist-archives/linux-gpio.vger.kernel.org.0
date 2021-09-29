Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEE0141C525
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Sep 2021 15:02:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344027AbhI2NE0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Sep 2021 09:04:26 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:53248
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1343978AbhI2NE0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Sep 2021 09:04:26 -0400
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5A088402E0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Sep 2021 13:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632920563;
        bh=WQyoXTmGnA/i0/fq7CgN6IL65bEbPjXgHhQsmbo9nvw=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=ntM3YNvaqE7sVx1hQXbkrEaQcp5wxiSEzIJgFDRUEK1pD29NlLwrWnIIOoZg6XCTx
         OizZMXO4qm1Hsx6wz5JiTZnbPMy+AeSQMquL05q58NqfIkt2dstC5oFZYr+z8AzNTU
         QuYY2g8pZXchZGZFogA4hMuw+K4UbPKUI10gzN1b+oD0SlHFfHCQ5bytDFnjRziAXP
         vdTIXhq+DIJyuF6zNvGr0eLcuy931EqF3hCTmaFfSXdayEg+RT8Xg1BxyaTEiixtO2
         r2XmBcMYs9o1IA/fNO+z26uGLQpefWbnH46/z8oHXevIrR1wrMILUyGT/cbs6Lmr+m
         WJ7+l2RzS7p8w==
Received: by mail-lf1-f72.google.com with SMTP id x33-20020a0565123fa100b003fcfd99073dso2337807lfa.6
        for <linux-gpio@vger.kernel.org>; Wed, 29 Sep 2021 06:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WQyoXTmGnA/i0/fq7CgN6IL65bEbPjXgHhQsmbo9nvw=;
        b=WXonVBngE9lkBzaPfxpCvpg11Tpz7aQTvyJX9mRXQFYoDIYV8muYM2PFACR+BO7LCj
         yeeC3UigVbHwcL6m8radTlyL7Nala9w6lJD9sWMEIPBhiCRaRki+o9RfKhHKI9o22MVX
         CTS2QOr16phM6zi4Dgd/U2GW8jGXEZR2NCLRT1qpBXFZnf3N6mdef7y3DTlImzMMj40i
         BKQsRK86LxazjLnhtfKllL27zaizu9uM+6rpXHmAPZd1KfZnmjCrCRORKVIVsf+fNMIz
         6wWSwlNoaxdV2n6PfN2YU6E1gxGOzr5gYJBD8GAmMW5OIUkY8pBTEqdfn1G8keVlcLZS
         tIoQ==
X-Gm-Message-State: AOAM533W3/mWAvlYiYHz3sN9dSj2oZjIb1y9rlYS7TbLgkAaUtpSyaoI
        fm/qJKw2cWsyMoThpjEmqFRpHjXRj0z4H/mWJz17cNjyqcPd70YAx4INXdLvos7ODJFNg/ZvxbX
        rlLjXDnx4fwZ3LqE2yNvZdVAP+ZUW2614TQrjvfo=
X-Received: by 2002:ac2:5978:: with SMTP id h24mr11376836lfp.426.1632920562460;
        Wed, 29 Sep 2021 06:02:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0mrG6dmWb7waqTSD14bTgiM+wUm0WGoJ0bh+iZA1uG9aiIPJT8ie5QjhcT5bRPUqMJ0Rmww==
X-Received: by 2002:ac2:5978:: with SMTP id h24mr11376781lfp.426.1632920562152;
        Wed, 29 Sep 2021 06:02:42 -0700 (PDT)
Received: from [192.168.0.197] ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id q30sm158216lfb.108.2021.09.29.06.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 06:02:41 -0700 (PDT)
Subject: Re: [PATCH v2 00/12] arm64: Kconfig: Update ARCH_EXYNOS select
 configs
To:     Will McVicker <willmcvicker@google.com>,
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
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
References: <20210928235635.1348330-1-willmcvicker@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <7766faf8-2dd1-6525-3b9a-8ba790c29cff@canonical.com>
Date:   Wed, 29 Sep 2021 15:02:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210928235635.1348330-1-willmcvicker@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 29/09/2021 01:56, Will McVicker wrote:
> This is v2 of the series of patches that modularizes a number of core
> ARCH_EXYNOS drivers. Based off of the feedback from the v1 series, I have
> modularized all of the drivers that are removed from the ARCH_EXYNOS
> series of "select XXX". This includes setting the following configs as
> tristate:
> 
>  * COMMON_CLK_SAMSUNG
>  * EXYNOS_ARM64_COMMON_CLK
>  * PINCTRL_SAMSUNG
>  * PINCTRL_EXYNOS
>  * EXYNOS_PMU_ARM64
>  * EXYNOS_PM_DOMAINS
> 
> Additionally, it introduces the config EXYNOS_PMU_ARM64 and EXYNOS_PMU_ARM
> which was previously EXYNOS_PMU and EXYNOS_PMU_ARM_DRIVERS respectively.
> The reason for these new configs is because we are not able to easily
> modularize the ARMv7 PMU driver due to built-in arch dependencies on
> pmu_base_addr under arch/arm/mach-exynos/*. So the new configs split up
> the ARM and ARM64 portions into two separate configs.
> 
> Overall, these drivers didn't require much refactoring and converted to
> modules relatively easily. However, due to my lack of exynos hardware, I
> was not able to boot test these changes. I'm mostly concerned about the
> CLK_OF_DECLARE() changes having dependencies on early timers. So I'm
> requesting help for testing these changes on the respective hardware.
> 

These are all not tested at all? In such case, since these are not
trivial changes, please mark the series as RFT.

I will not be able to test these for some days, so it must wait.


Best regards,
Krzysztof
