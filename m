Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9CDF468DAF0
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Feb 2023 15:30:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231779AbjBGO3i (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Feb 2023 09:29:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230080AbjBGO3b (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Feb 2023 09:29:31 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBF2D190;
        Tue,  7 Feb 2023 06:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675780169; x=1707316169;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=7VgWr2VPj8L1NsfjGJ63Vno2YkqOebd37sMf+dqhyeo=;
  b=jscZB0N2UJN/Pc0tXopZRvaT2D3XAhPMfD6oaW4L5byZnnNVyWNCxxub
   IdHtHoQn0vOxJ7lFwzg5kbJegPaGh8leViE2X2/ElmJJeW3JejJboHfhb
   uVp+fWDik0JBd7CBMNdBIFR8+MNTyHNuhTHewhwvJLxQmmgpP3nKgqDcT
   MAmITuzyPvCSveL+lDTbiISrMFloCRf+k+bPpGLuTOTg4l0YoyFpnelhM
   2yWj0R3Xq10GTQ3dXSe0UCNHRxTfG76EoI63ec5WgcJGV6+BCDn1kwm84
   t51yfBmzvkHXx9DnlJr+kOGgvPvrAlTFOdkWON+iw1BKsF+Poga/O/lr1
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="329537331"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="329537331"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 06:29:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10614"; a="790811310"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="790811310"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 07 Feb 2023 06:29:23 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2D031210; Tue,  7 Feb 2023 16:30:02 +0200 (EET)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Devarsh Thakkar <devarsht@ti.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        linux-doc-tw-discuss@lists.sourceforge.net,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
        linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-input@vger.kernel.org,
        linux-media@vger.kernel.org, linux-wpan@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        brcm80211-dev-list.pdl@broadcom.com,
        SHA-cyfmac-dev-list@infineon.com, linux-arch@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Hu Haowen <src.res@email.cn>,
        Russell King <linux@armlinux.org.uk>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Rich Felker <dalias@libc.org>,
        Mun Yew Tham <mun.yew.tham@intel.com>,
        Keerthy <j-keerthy@ti.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Alexander Aring <alex.aring@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Arend van Spriel <aspriel@gmail.com>,
        Franky Lin <franky.lin@broadcom.com>,
        Hante Meuleman <hante.meuleman@broadcom.com>,
        Kalle Valo <kvalo@kernel.org>, Qiang Zhao <qiang.zhao@nxp.com>,
        Li Yang <leoyang.li@nxp.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 01/12] gpiolib: remove empty asm/gpio.h files
Date:   Tue,  7 Feb 2023 16:29:41 +0200
Message-Id: <20230207142952.51844-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207142952.51844-1-andriy.shevchenko@linux.intel.com>
References: <20230207142952.51844-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/arm/Kconfig                    |  1 -
 arch/arm/include/asm/gpio.h         | 21 --------------
 arch/sh/Kconfig                     |  1 -
 arch/sh/boards/board-magicpanelr2.c |  1 +
 arch/sh/include/asm/gpio.h          | 45 -----------------------------
 5 files changed, 1 insertion(+), 68 deletions(-)
 delete mode 100644 arch/arm/include/asm/gpio.h
 delete mode 100644 arch/sh/include/asm/gpio.h

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index e24a9820e12f..1d1a603d964d 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -24,7 +24,6 @@ config ARM
 	select ARCH_HAS_SYNC_DMA_FOR_CPU
 	select ARCH_HAS_TEARDOWN_DMA_OPS if MMU
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
-	select ARCH_HAVE_CUSTOM_GPIO_H
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG if CPU_V7 || CPU_V7M || CPU_V6K
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_KEEP_MEMBLOCK
diff --git a/arch/arm/include/asm/gpio.h b/arch/arm/include/asm/gpio.h
deleted file mode 100644
index 4ebbb58f06ea..000000000000
--- a/arch/arm/include/asm/gpio.h
+++ /dev/null
@@ -1,21 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ARCH_ARM_GPIO_H
-#define _ARCH_ARM_GPIO_H
-
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
index 0665ac0add0b..ccb866750a88 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -4,7 +4,6 @@ config SUPERH
 	select ARCH_32BIT_OFF_T
 	select ARCH_ENABLE_MEMORY_HOTPLUG if SPARSEMEM && MMU
 	select ARCH_ENABLE_MEMORY_HOTREMOVE if SPARSEMEM && MMU
-	select ARCH_HAVE_CUSTOM_GPIO_H
 	select ARCH_HAVE_NMI_SAFE_CMPXCHG if (GUSA_RB || CPU_SH4A)
 	select ARCH_HAS_BINFMT_FLAT if !MMU
 	select ARCH_HAS_CURRENT_STACK_POINTER
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
2.39.1

