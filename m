Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C79404463CD
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Nov 2021 14:04:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231952AbhKENHL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Nov 2021 09:07:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:60698 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229529AbhKENHK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Nov 2021 09:07:10 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D7CF60F9B;
        Fri,  5 Nov 2021 13:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636117470;
        bh=+PVJdXmBLA/gstw3D36WCQ0Nj/5w+hOzURJoImyixsc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Ji37vi22HiR6CPYz0IHehOb3KXRwUbGtW7Oq4UpSIwq6mrTGWf+pTRPLHwJf6yGZ3
         wPQDDchlaurwxi0Mr0fYQHFvNT82r02uJx3lhSQnJ1xldU0mTs3ExD+goKIp/aNjsd
         wmXuHSakR8RxG1ADmz5Uj5TJMQasa94EF3IDlfnoilBe2Zws0int92Mz1RsGuWyoRg
         1qB7pFhdjHpCtB96J3QPlPnWGgQoho/SP15xcjxIcSW2Jy+/2R+9AVSlHXeE6FjedF
         Fap0sRwsY6YooVjAPYJpBHzdbXchdQ3+UhPWOJSOjwBhwMIGTi9Fs/Wj/OZzrXs2Fq
         rLtiMOtIks1Uw==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-m68k@lists.linux-m68k.org, geert@linux-m68k.org,
        gerg@linux-m68k.org, linux@armlinux.org.uk,
        linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org,
        dalias@libc.org, ysato@users.sourceforge.jp,
        Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org
Subject: [RFC 2/3] gpiolib: remove empty asm/gpio.h files
Date:   Fri,  5 Nov 2021 14:03:04 +0100
Message-Id: <20211105130338.241100-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211105130338.241100-1-arnd@kernel.org>
References: <20211105130338.241100-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The arm and sh versions of this file are identical to the generic
versions and can just be removed.

The drivers that actually use the sh3 specific version also include
cpu/gpio.h directly. This leaves coldfire as the only gpio driver
that needs something custom for gpiolib.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig            |  1 -
 arch/arm/include/asm/gpio.h | 22 ------------------
 arch/sh/Kconfig             |  1 -
 arch/sh/include/asm/gpio.h  | 45 -------------------------------------
 4 files changed, 69 deletions(-)
 delete mode 100644 arch/arm/include/asm/gpio.h
 delete mode 100644 arch/sh/include/asm/gpio.h

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 526ae94b1c9a..80378eeee760 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -23,7 +23,6 @@ config ARM
 	select ARCH_HAS_SYNC_DMA_FOR_CPU if SWIOTLB || !MMU
 	select ARCH_HAS_TEARDOWN_DMA_OPS if MMU
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
-	select ARCH_HAVE_CUSTOM_GPIO_H
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG if CPU_V7 || CPU_V7M || CPU_V6K
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_KEEP_MEMBLOCK
diff --git a/arch/arm/include/asm/gpio.h b/arch/arm/include/asm/gpio.h
deleted file mode 100644
index f3bb8a2bf788..000000000000
--- a/arch/arm/include/asm/gpio.h
+++ /dev/null
@@ -1,22 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ARCH_ARM_GPIO_H
-#define _ARCH_ARM_GPIO_H
-
-/* Note: this may rely upon the value of ARCH_NR_GPIOS set in mach/gpio.h */
-#include <asm-generic/gpio.h>
-
-/* The trivial gpiolib dispatchers */
-#define gpio_get_value  __gpio_get_value
-#define gpio_set_value  __gpio_set_value
-#define gpio_cansleep   __gpio_cansleep
-
-/*
- * Provide a default gpio_to_irq() which should satisfy every case.
- * However, some platforms want to do this differently, so allow them
- * to override it.
- */
-#ifndef gpio_to_irq
-#define gpio_to_irq	__gpio_to_irq
-#endif
-
-#endif /* _ARCH_ARM_GPIO_H */
diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 2474a04ceac4..cebd04314d76 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -4,7 +4,6 @@ config SUPERH
 	select ARCH_32BIT_OFF_T
 	select ARCH_ENABLE_MEMORY_HOTPLUG if SPARSEMEM && MMU
 	select ARCH_ENABLE_MEMORY_HOTREMOVE if SPARSEMEM && MMU
-	select ARCH_HAVE_CUSTOM_GPIO_H
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG if (GUSA_RB || CPU_SH4A)
 	select ARCH_HAS_BINFMT_FLAT if !MMU
 	select ARCH_HAS_GIGANTIC_PAGE
diff --git a/arch/sh/include/asm/gpio.h b/arch/sh/include/asm/gpio.h
deleted file mode 100644
index 588c1380e4cb..000000000000
--- a/arch/sh/include/asm/gpio.h
+++ /dev/null
@@ -1,45 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0
- *
- *  include/asm-sh/gpio.h
- *
- * Generic GPIO API and pinmux table support for SuperH.
- *
- * Copyright (c) 2008 Magnus Damm
- */
-#ifndef __ASM_SH_GPIO_H
-#define __ASM_SH_GPIO_H
-
-#include <linux/kernel.h>
-#include <linux/errno.h>
-
-#if defined(CONFIG_CPU_SH3)
-#include <cpu/gpio.h>
-#endif
-
-#include <asm-generic/gpio.h>
-
-#ifdef CONFIG_GPIOLIB
-
-static inline int gpio_get_value(unsigned gpio)
-{
-	return __gpio_get_value(gpio);
-}
-
-static inline void gpio_set_value(unsigned gpio, int value)
-{
-	__gpio_set_value(gpio, value);
-}
-
-static inline int gpio_cansleep(unsigned gpio)
-{
-	return __gpio_cansleep(gpio);
-}
-
-static inline int gpio_to_irq(unsigned gpio)
-{
-	return __gpio_to_irq(gpio);
-}
-
-#endif /* CONFIG_GPIOLIB */
-
-#endif /* __ASM_SH_GPIO_H */
-- 
2.29.2

