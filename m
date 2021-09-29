Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36B3D41C5C5
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Sep 2021 15:37:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344282AbhI2Nim (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Sep 2021 09:38:42 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:55260
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1344278AbhI2Nil (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 29 Sep 2021 09:38:41 -0400
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B400940600
        for <linux-gpio@vger.kernel.org>; Wed, 29 Sep 2021 13:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1632922619;
        bh=IJ3OurHG/eMoa5Ez3cxwk82+OEdomsIA6378FAznzbU=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=Jgcjd3gzUNd9zvgicFXZyfLywA2NCZRDDkZNlb2PygLc8Ec9nYRiTYt2a/jrrOo3g
         kwVf5ZCxCYApy/GLxXRCiAZN6/5NUH42DBwb65Cfg0nBXGZ+f393wvPzRCTZgPlqyT
         ODpFTWYaHn6RQ2bE7y5lIyPajGF9RKcWjXA3vnRWot+wzMGYQjFblcTC7bGnuIc26J
         z1ea8HokGuluH1QzfKTzNz+GBjaZsmq8TONoJBzMM9gX+UbQLFkzvi7sv6cgo7XAT2
         9NtO+0AjczK5oyUM1BzbGN0j7RJY76ETMt2z1TMp4H36pR6bkFe4QVTiBVX3oTSUf4
         9qLIMaZ5kl2Ew==
Received: by mail-lf1-f71.google.com with SMTP id 12-20020ac2484c000000b003fcb3298d00so2386662lfy.13
        for <linux-gpio@vger.kernel.org>; Wed, 29 Sep 2021 06:36:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IJ3OurHG/eMoa5Ez3cxwk82+OEdomsIA6378FAznzbU=;
        b=VhpEVPrHhuX9YEtwleBO/fYJzEr8DdurKPzEzpHNssZt84vMeobhEwX6PCbq7fPUVW
         C5A+qRvbK3NzHA8wTro0eQO//j4dV2aiXp58wyT/sEirJykEnkFJMqSsoH525m1k1hwD
         N0TiK8pgMNvFtVyRXu7Jgkm6YW6ztHSlS4Pb9N6LyYX92Kle/4i9LgQPQc2EWa0e0N5R
         u9rAn7ML4tqOuhpm/9lMFdFqOW9arP7AzUXc+OtGYLC6I/wthZPyHtluZHR0kPn83zRs
         So2EGHBcXFOK/JdhSyCnVjh3Vkh0OG7s0sg7AKEtlpT1jsqmxq101etOQ2T4bK35RlyU
         X+Lw==
X-Gm-Message-State: AOAM530awMoAIq9fACs6AHYu8hfQQecLzMUlnHDNqVtZdsQ0XYspoP6p
        zzJLKYk4cnW3sZ/Lm8jwexIou7QUX7BhTg0W7uwr7qUBe/c/JdhUBgeaGYMsgucYbs1e35r954P
        Kg364OyDxMXjcpQmHAmzG+Si9pSY5J7mKC4TWuzI=
X-Received: by 2002:a05:6512:b0f:: with SMTP id w15mr11643569lfu.164.1632922618897;
        Wed, 29 Sep 2021 06:36:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwV4mq82/bhZJUlEzYmX1tokizPArBTUd0Xy49dVS7VRmuCrClBqisSQWT0uvmf1nzwqca1yA==
X-Received: by 2002:a05:6512:b0f:: with SMTP id w15mr11643554lfu.164.1632922618705;
        Wed, 29 Sep 2021 06:36:58 -0700 (PDT)
Received: from [192.168.0.197] ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id v26sm269056lja.22.2021.09.29.06.36.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Sep 2021 06:36:58 -0700 (PDT)
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
        Thomas Gleixner <tglx@linutronix.de>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <20210928235635.1348330-12-willmcvicker@google.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v2 11/12] soc: samsung: pm_domains: modularize
 EXYNOS_PM_DOMAINS
Message-ID: <976e57f8-07ee-4698-b29d-dd854b79e570@canonical.com>
Date:   Wed, 29 Sep 2021 15:36:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210928235635.1348330-12-willmcvicker@google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 29/09/2021 01:56, Will McVicker wrote:
> Convert the Exynos PM Domains driver into a module. This includes
> setting EXYNOS_PM_DOMAINS as tristate and removing it from being
> auto-selected by ARCH_EXYNOS. Instead, the config will use
> "default y if ARCH_EXYNOS" which allows us to set it to a module via the
> defconfig now.
> 
> Signed-off-by: Will McVicker <willmcvicker@google.com>
> ---
>  arch/arm/mach-exynos/Kconfig     |  1 -
>  arch/arm64/Kconfig.platforms     |  1 -
>  drivers/soc/samsung/Kconfig      |  3 ++-
>  drivers/soc/samsung/pm_domains.c | 12 +++++++-----
>  4 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index e97e1d8f7b00..2ad19a08bf06 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -15,7 +15,6 @@ menuconfig ARCH_EXYNOS
>  	select EXYNOS_THERMAL
>  	select EXYNOS_PMU_ARM
>  	select EXYNOS_SROM
> -	select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
>  	select GPIOLIB
>  	select HAVE_ARM_ARCH_TIMER if ARCH_EXYNOS5
>  	select HAVE_ARM_SCU if SMP
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index e5e4b9b2fb97..e44d5e9f5058 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -91,7 +91,6 @@ config ARCH_BRCMSTB
>  
>  config ARCH_EXYNOS
>  	bool "ARMv8 based Samsung Exynos SoC family"
> -	select EXYNOS_PM_DOMAINS if PM_GENERIC_DOMAINS
>  	select HAVE_S3C_RTC if RTC_CLASS
>  	select PINCTRL
>  	select PM_GENERIC_DOMAINS if PM
> diff --git a/drivers/soc/samsung/Kconfig b/drivers/soc/samsung/Kconfig
> index fdf1162ec98b..e4743c29f73c 100644
> --- a/drivers/soc/samsung/Kconfig
> +++ b/drivers/soc/samsung/Kconfig
> @@ -37,8 +37,9 @@ config EXYNOS_PMU_ARM
>  	depends on ARCH_EXYNOS || (ARM && COMPILE_TEST)
>  
>  config EXYNOS_PM_DOMAINS
> -	bool "Exynos PM domains" if COMPILE_TEST
> +	tristate "Exynos PM domains"

+Cc Arnd and Olof,

Unlike in clocks and soc drivers changes, you mentioned the removal of
"if", however it is not explained why you do it.

Why is the most important part of commit message, not "what". Because
"What" we can easily see. But "why" is sometimes trickier.

Please also explain why Exynos is so special that we deviate from the
policy for all SoC that critical SoC-related drivers have to be enabled
(built-in or as module).
https://lore.kernel.org/lkml/CAK8P3a1TY+XT1vF=wAh0XA5BXU5Z6Ab1d4DekXbVsN9aj3aL5w@mail.gmail.com/

We follow specific convention or policy and changing it requires some
discussion, not silently under the "modularize" hood. It really looks
like you want to sneak it in.

P.S. I recommend also to Cc Soc maintainers, because their point of view
here is crucial.

>  	depends on (ARCH_EXYNOS && PM_GENERIC_DOMAINS) || COMPILE_TEST
> +	default y if ARCH_EXYNOS


Best regards,
Krzysztof
