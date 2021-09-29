Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D7DD41C3CF
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Sep 2021 13:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244663AbhI2LyR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 29 Sep 2021 07:54:17 -0400
Received: from relay12.mail.gandi.net ([217.70.178.232]:41739 "EHLO
        relay12.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244263AbhI2LyQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Sep 2021 07:54:16 -0400
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay12.mail.gandi.net (Postfix) with ESMTPSA id E0EBE20000D;
        Wed, 29 Sep 2021 11:52:30 +0000 (UTC)
Date:   Wed, 29 Sep 2021 13:52:30 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Will McVicker <willmcvicker@google.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 12/12] ARM: rtc: remove HAVE_S3C_RTC in favor of
 direct dependencies
Message-ID: <YVRTfuoC8TxtFTEO@piout.net>
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <20210928235635.1348330-13-willmcvicker@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210928235635.1348330-13-willmcvicker@google.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi,

I'd argue that the subject should be rtc: s3c: ...

On 28/09/2021 23:56:29+0000, Will McVicker wrote:
> The config HAVE_S3C_RTC is not really needed since we can simply just
> add the dependencies directly to RTC_DRV_S3C. Also, one less config to
> keep track of!
> 
> Signed-off-by: Will McVicker <willmcvicker@google.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>

> ---
>  arch/arm/Kconfig              |  1 -
>  arch/arm/mach-exynos/Kconfig  |  1 -
>  arch/arm/mach-s5pv210/Kconfig |  1 -
>  arch/arm64/Kconfig.platforms  |  1 -
>  drivers/rtc/Kconfig           | 10 ++--------
>  5 files changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index fc196421b2ce..5ed6b5de981e 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -475,7 +475,6 @@ config ARCH_S3C24XX
>  	select GPIOLIB
>  	select GENERIC_IRQ_MULTI_HANDLER
>  	select HAVE_S3C2410_I2C if I2C
> -	select HAVE_S3C_RTC if RTC_CLASS
>  	select NEED_MACH_IO_H
>  	select S3C2410_WATCHDOG
>  	select SAMSUNG_ATAGS
> diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
> index 2ad19a08bf06..8b72a70b6c43 100644
> --- a/arch/arm/mach-exynos/Kconfig
> +++ b/arch/arm/mach-exynos/Kconfig
> @@ -19,7 +19,6 @@ menuconfig ARCH_EXYNOS
>  	select HAVE_ARM_ARCH_TIMER if ARCH_EXYNOS5
>  	select HAVE_ARM_SCU if SMP
>  	select HAVE_S3C2410_I2C if I2C
> -	select HAVE_S3C_RTC if RTC_CLASS
>  	select PINCTRL
>  	select PM_GENERIC_DOMAINS if PM
>  	select S5P_DEV_MFC
> diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
> index 62b90dda571f..681823687018 100644
> --- a/arch/arm/mach-s5pv210/Kconfig
> +++ b/arch/arm/mach-s5pv210/Kconfig
> @@ -12,7 +12,6 @@ config ARCH_S5PV210
>  	select CLKSRC_SAMSUNG_PWM
>  	select GPIOLIB
>  	select HAVE_S3C2410_I2C if I2C
> -	select HAVE_S3C_RTC if RTC_CLASS
>  	select PINCTRL
>  	select SOC_SAMSUNG
>  	help
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index e44d5e9f5058..02c8637d3f09 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -91,7 +91,6 @@ config ARCH_BRCMSTB
>  
>  config ARCH_EXYNOS
>  	bool "ARMv8 based Samsung Exynos SoC family"
> -	select HAVE_S3C_RTC if RTC_CLASS
>  	select PINCTRL
>  	select PM_GENERIC_DOMAINS if PM
>  	select SOC_SAMSUNG
> diff --git a/drivers/rtc/Kconfig b/drivers/rtc/Kconfig
> index e1bc5214494e..7208eeb8459a 100644
> --- a/drivers/rtc/Kconfig
> +++ b/drivers/rtc/Kconfig
> @@ -1404,16 +1404,10 @@ config RTC_DRV_OMAP
>  	  This driver can also be built as a module, if so, module
>  	  will be called rtc-omap.
>  
> -config HAVE_S3C_RTC
> -	bool
> -	help
> -	  This will include RTC support for Samsung SoCs. If
> -	  you want to include RTC support for any machine, kindly
> -	  select this in the respective mach-XXXX/Kconfig file.
> -
>  config RTC_DRV_S3C
>  	tristate "Samsung S3C series SoC RTC"
> -	depends on ARCH_S3C64XX || HAVE_S3C_RTC || COMPILE_TEST
> +	depends on ARCH_EXYNOS || ARCH_S3C64XX || ARCH_S3C24XX || ARCH_S5PV210 || \
> +		   COMPILE_TEST
>  	help
>  	  RTC (Realtime Clock) driver for the clock inbuilt into the
>  	  Samsung S3C24XX series of SoCs. This can provide periodic
> -- 
> 2.33.0.685.g46640cef36-goog
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
