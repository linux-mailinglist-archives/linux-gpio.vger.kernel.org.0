Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 746B541BB79
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Sep 2021 01:57:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243497AbhI1X7X (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 28 Sep 2021 19:59:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243556AbhI1X66 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Sep 2021 19:58:58 -0400
Received: from mail-pl1-x649.google.com (mail-pl1-x649.google.com [IPv6:2607:f8b0:4864:20::649])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 899D5C061760
        for <linux-gpio@vger.kernel.org>; Tue, 28 Sep 2021 16:57:12 -0700 (PDT)
Received: by mail-pl1-x649.google.com with SMTP id c11-20020a170902724b00b0013ca44249e9so104086pll.10
        for <linux-gpio@vger.kernel.org>; Tue, 28 Sep 2021 16:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=yFM0rI/DSUBlzQ9GKRkScVVqCCNg3Z7W7rCmp+m4CSs=;
        b=gyrFEOaSYsXhV8YsKduwaWzhKSJ6k7GHoLRL6593PhVeQGouKwStHntpTzB/MmXR//
         F6TJWR6likxQhzJ9IylIMNOhspu5V7VDDdinqg+9qCwrishZhgU2lYbdrygBl7ffRaLK
         7DDHag/RWHvNAo7+QxO9MzrUJNLtDnP8DsBIo5Xy9GYdDrpd43nZIFUfjlcJDfFo+NeF
         zx0vGMXeyMfyt653sqR9mLxM2tUWCn7sPRQMs7/Fh2bbwiOje3tE4g5m9at338j1LKUe
         ulRgMUdKhxbIgU0D66N8LJu2fCOVH+/G3E7y83bEEjfX6FvRUyO9JP+C0ZMcbjanaoGh
         aGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=yFM0rI/DSUBlzQ9GKRkScVVqCCNg3Z7W7rCmp+m4CSs=;
        b=IUOTcWni+kVCcHrJjjfuDgLv8zQ5GQ8akgr6XKKO9SLLkaYpJdsXJ1Q6UJyZMqoGZz
         2jap+LPGENoLWpiXFk6fIAggDdc72Ss4bZg2d095Fgpyf/ekzckAy+3eBgV/ErnQEXYi
         oi5R+Gzxu3hf7oTHAGbdemyhb6Qqe4stJYip+Uf7xDpwl1xiFPdtoX8UV9WA24GFO8Gz
         4zzz7DfO2UH8dlP+f2XVUm80Lo5YPsn9lEB2omxLcV08J5WxAIzz/kDeeDjFcq9a1SG+
         CrDUY2aQmEm63ukS4pV7WDabjyKsci22wHJYJ/9Js2Z2jS8IiBQuDD+rPzHKjzhAzoWT
         xapg==
X-Gm-Message-State: AOAM53090X2JPj0IPn6DOYIbU8BUO3vh76sZAJztB4xQ4ey1SGQ+a/G1
        ESxmQdHVLbUxXIe1CswC51EZpaCXob/ZkdgVN4M=
X-Google-Smtp-Source: ABdhPJxEudKi1cUEbRA6bTOrvgi3KIFrvopbvp+YQ/eHfD9nlnHBdrQ6ErZG7x39c7dBUY6sZjPAWArCTDlaPDw0ebg=
X-Received: from willmcvicker.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:2dd0])
 (user=willmcvicker job=sendgmr) by 2002:a17:902:7ec2:b0:13d:b563:c39 with
 SMTP id p2-20020a1709027ec200b0013db5630c39mr7512039plb.14.1632873432022;
 Tue, 28 Sep 2021 16:57:12 -0700 (PDT)
Date:   Tue, 28 Sep 2021 23:56:26 +0000
In-Reply-To: <20210928235635.1348330-1-willmcvicker@google.com>
Message-Id: <20210928235635.1348330-10-willmcvicker@google.com>
Mime-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
X-Mailer: git-send-email 2.33.0.685.g46640cef36-goog
Subject: [PATCH v2 09/12] pinctrl: samsung: set PINCTRL_EXYNOS and
 PINCTRL_SAMSUNG as tristate
From:   Will McVicker <willmcvicker@google.com>
To:     Russell King <linux@armlinux.org.uk>,
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
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        John Stultz <john.stultz@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        Will McVicker <willmcvicker@google.com>,
        kernel-team@android.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Make PINCTRL_EXYNOS and PINCTRL_SAMSUNG tristate so that we can compile
them as modules. Also don't have ARCH_EXYNOS directly select them, but
use "default y if ARCH_EXYNOS || ARCH_S5PV210" instead.

Signed-off-by: Will McVicker <willmcvicker@google.com>
---
 arch/arm/mach-exynos/Kconfig    | 1 -
 arch/arm/mach-s5pv210/Kconfig   | 1 -
 arch/arm64/Kconfig.platforms    | 1 -
 drivers/pinctrl/samsung/Kconfig | 5 +++--
 4 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-exynos/Kconfig b/arch/arm/mach-exynos/Kconfig
index 01b8e8b8d95d..afc8cd062605 100644
--- a/arch/arm/mach-exynos/Kconfig
+++ b/arch/arm/mach-exynos/Kconfig
@@ -22,7 +22,6 @@ menuconfig ARCH_EXYNOS
 	select HAVE_S3C2410_I2C if I2C
 	select HAVE_S3C_RTC if RTC_CLASS
 	select PINCTRL
-	select PINCTRL_EXYNOS
 	select PM_GENERIC_DOMAINS if PM
 	select S5P_DEV_MFC
 	select SAMSUNG_MC
diff --git a/arch/arm/mach-s5pv210/Kconfig b/arch/arm/mach-s5pv210/Kconfig
index 3d7e0b5739d8..62b90dda571f 100644
--- a/arch/arm/mach-s5pv210/Kconfig
+++ b/arch/arm/mach-s5pv210/Kconfig
@@ -14,7 +14,6 @@ config ARCH_S5PV210
 	select HAVE_S3C2410_I2C if I2C
 	select HAVE_S3C_RTC if RTC_CLASS
 	select PINCTRL
-	select PINCTRL_EXYNOS
 	select SOC_SAMSUNG
 	help
 	  Samsung S5PV210/S5PC110 series based systems
diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index e6d4abadacd8..67f60cc3c723 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -95,7 +95,6 @@ config ARCH_EXYNOS
 	select EXYNOS_PMU
 	select HAVE_S3C_RTC if RTC_CLASS
 	select PINCTRL
-	select PINCTRL_EXYNOS
 	select PM_GENERIC_DOMAINS if PM
 	select SOC_SAMSUNG
 	help
diff --git a/drivers/pinctrl/samsung/Kconfig b/drivers/pinctrl/samsung/Kconfig
index dfd805e76862..caeb865cfa21 100644
--- a/drivers/pinctrl/samsung/Kconfig
+++ b/drivers/pinctrl/samsung/Kconfig
@@ -3,15 +3,16 @@
 # Samsung Pin control drivers
 #
 config PINCTRL_SAMSUNG
-	bool
+	tristate "Pinctrl common driver for Exynos, S3C24XX, and S3C64XX SoCs" if COMPILE_TEST
 	depends on OF_GPIO
 	select PINMUX
 	select PINCONF
 
 config PINCTRL_EXYNOS
-	bool "Pinctrl common driver part for Samsung Exynos SoCs"
+	tristate "Pinctrl common driver part for Samsung Exynos ARM and ARM64 SoCs"
 	depends on OF_GPIO
 	depends on ARCH_EXYNOS || ARCH_S5PV210 || COMPILE_TEST
+	default y if (ARCH_EXYNOS || ARCH_S5PV210)
 	select PINCTRL_SAMSUNG
 	select PINCTRL_EXYNOS_ARM if ARM && (ARCH_EXYNOS || ARCH_S5PV210)
 	select PINCTRL_EXYNOS_ARM64 if ARM64 && ARCH_EXYNOS
-- 
2.33.0.685.g46640cef36-goog

