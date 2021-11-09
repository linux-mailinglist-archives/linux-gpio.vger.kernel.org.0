Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F98644AB20
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 11:02:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245158AbhKIKFH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 05:05:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:32852 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245151AbhKIKFG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Nov 2021 05:05:06 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 10B6161175;
        Tue,  9 Nov 2021 10:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636452140;
        bh=sGyffUbjTsf37wv3qzAs8sgQqDsEN2pyIDKyvecPpwo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TvtQ9DuBYZUdf3Xjd3eAVgH1RgsAReH3QU/kfyrm6R2jZO1UXr1ivQYfNJCdYh4WZ
         7O+xW83W+TJHO3rPvtk3a67aKtoOczKmiuUeI+fY2GQa2cmFkWpowNMT+VOETwr0h5
         8oHCxoYFYT+DXA8GB5xfgW3cvXWKkE/NUFxxBTaBxCvChJ4iP2hAmhjwlzQgEcIevo
         T3xUS6y2K7pWcq8GrY/YtqRjhBiORv1o0nOttCio13P65+ihOJYon8KxMePB0s/urK
         xzxqSqYCFxWBwGBMQLnmEW4yVl/D21kBoE/APDrGeSJVAPCwrd1UgBU8Ehssm25+fc
         BY/x9DmL9Jo4A==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-gpio@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/8] gpiolib: remove empty asm/gpio.h files
Date:   Tue,  9 Nov 2021 11:02:01 +0100
Message-Id: <20211109100207.2474024-3-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211109100207.2474024-1-arnd@kernel.org>
References: <20211109100207.2474024-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The arm and sh versions of this file are identical to the generic
versions and can just be removed.

The drivers that actually use the sh3 specific version also include
cpu/gpio.h directly, with the exception of magicpanelr2, which is
easily fixed. This leaves coldfire as the only gpio driver
that needs something custom for gpiolib.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/Kconfig                    |  1 -
 arch/arm/include/asm/gpio.h         | 22 --------------
 arch/sh/Kconfig                     |  1 -
 arch/sh/boards/board-magicpanelr2.c |  1 +
 arch/sh/include/asm/gpio.h          | 45 -----------------------------
 5 files changed, 1 insertion(+), 69 deletions(-)
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
diff --git a/arch/sh/boards/board-magicpanelr2.c b/arch/sh/boards/board-magicpanelr2.c
index 56bd386ff3b0..75de893152af 100644
--- a/arch/sh/boards/board-magicpanelr2.c
+++ b/arch/sh/boards/board-magicpanelr2.c
@@ -21,6 +21,7 @@
 #include <linux/sh_intc.h>
 #include <mach/magicpanelr2.h>
 #include <asm/heartbeat.h>
+#include <cpu/gpio.h>
 #include <cpu/sh7720.h>
 
 /* Dummy supplies, where voltage doesn't matter */
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

