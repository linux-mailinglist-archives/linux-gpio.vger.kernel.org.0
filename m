Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6A4B144AB22
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 11:02:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245159AbhKIKFN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 05:05:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:32906 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245165AbhKIKFI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Nov 2021 05:05:08 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0192461167;
        Tue,  9 Nov 2021 10:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636452142;
        bh=EzXJDdqEufRXNThBmzGwTXvlUQSESBryaJA48Na6KwE=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=H95s8m35vRx7tLVdkW0MOexu7tzjamkXDkcXvtrUacwbN0f6U34bLWd6+NY6vtE1u
         JtzaXgDnpv/02oP+5xL10Jo+IATS3mj8cj5NKevx5OBqgcOemdAKdxfC6KnKoVWIdT
         ECS2XKMy8GXXjSXDLCAs0gMedccvnG1JPaiTKlt4h1+aXBoTBbudAxIMiNegAh8QSy
         ckReEOokawFskRyCFJhICyVBmOMPhdAPh7bzHs2/ijDJv/3F9Pu9Nl+Tp0T3fhnsP7
         Qy2wULGAp9pQp+BjBGOY3McZhc8Ui6zg0lIq1M9tBOhhCDVrVXHJ0taAvLbN3vi3AR
         hXszXMylCOy9Q==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-gpio@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v2 3/8] gpiolib: coldfire: remove custom asm/gpio.h
Date:   Tue,  9 Nov 2021 11:02:02 +0100
Message-Id: <20211109100207.2474024-4-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211109100207.2474024-1-arnd@kernel.org>
References: <20211109100207.2474024-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Now that coldfire is the only user of a custom asm/gpio.h, it seems
better to remove this as well, and have the same interface everywhere.

For the gpio_get_value()/gpio_set_value()/gpio_to_irq(), gpio_cansleep()
functions, the custom version is only a micro-optimization to inline the
function for constant GPIO numbers. However, in the coldfire defconfigs,
I was unable to find a single instance where this micro-optimization
was even used, and according to Geert the only user appears to be the
QSPI chip that is disabled everywhere.

The custom gpio_request_one() function is even less useful, as it is
guarded by an #ifdef that is never true.

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/m68k/Kconfig.cpu        |  1 -
 arch/m68k/include/asm/gpio.h | 95 ------------------------------------
 drivers/gpio/Kconfig         |  8 ---
 include/linux/gpio.h         |  7 ---
 4 files changed, 111 deletions(-)
 delete mode 100644 arch/m68k/include/asm/gpio.h

diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
index 0d00ef5117dc..8256ff6b5b87 100644
--- a/arch/m68k/Kconfig.cpu
+++ b/arch/m68k/Kconfig.cpu
@@ -24,7 +24,6 @@ config M68KCLASSIC
 
 config COLDFIRE
 	bool "Coldfire CPU family support"
-	select ARCH_HAVE_CUSTOM_GPIO_H
 	select CPU_HAS_NO_BITFIELDS
 	select CPU_HAS_NO_CAS
 	select CPU_HAS_NO_MULDIV64
diff --git a/arch/m68k/include/asm/gpio.h b/arch/m68k/include/asm/gpio.h
deleted file mode 100644
index 5cfc0996ba94..000000000000
--- a/arch/m68k/include/asm/gpio.h
+++ /dev/null
@@ -1,95 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Coldfire generic GPIO support
- *
- * (C) Copyright 2009, Steven King <sfking@fdwdc.com>
-*/
-
-#ifndef coldfire_gpio_h
-#define coldfire_gpio_h
-
-#include <linux/io.h>
-#include <asm/coldfire.h>
-#include <asm/mcfsim.h>
-#include <asm/mcfgpio.h>
-/*
- * The Generic GPIO functions
- *
- * If the gpio is a compile time constant and is one of the Coldfire gpios,
- * use the inline version, otherwise dispatch thru gpiolib.
- */
-
-static inline int gpio_get_value(unsigned gpio)
-{
-	if (__builtin_constant_p(gpio) && gpio < MCFGPIO_PIN_MAX)
-		return mcfgpio_read(__mcfgpio_ppdr(gpio)) & mcfgpio_bit(gpio);
-	else
-		return __gpio_get_value(gpio);
-}
-
-static inline void gpio_set_value(unsigned gpio, int value)
-{
-	if (__builtin_constant_p(gpio) && gpio < MCFGPIO_PIN_MAX) {
-		if (gpio < MCFGPIO_SCR_START) {
-			unsigned long flags;
-			MCFGPIO_PORTTYPE data;
-
-			local_irq_save(flags);
-			data = mcfgpio_read(__mcfgpio_podr(gpio));
-			if (value)
-				data |= mcfgpio_bit(gpio);
-			else
-				data &= ~mcfgpio_bit(gpio);
-			mcfgpio_write(data, __mcfgpio_podr(gpio));
-			local_irq_restore(flags);
-		} else {
-			if (value)
-				mcfgpio_write(mcfgpio_bit(gpio),
-						MCFGPIO_SETR_PORT(gpio));
-			else
-				mcfgpio_write(~mcfgpio_bit(gpio),
-						MCFGPIO_CLRR_PORT(gpio));
-		}
-	} else
-		__gpio_set_value(gpio, value);
-}
-
-static inline int gpio_to_irq(unsigned gpio)
-{
-#if defined(MCFGPIO_IRQ_MIN)
-	if ((gpio >= MCFGPIO_IRQ_MIN) && (gpio < MCFGPIO_IRQ_MAX))
-#else
-	if (gpio < MCFGPIO_IRQ_MAX)
-#endif
-		return gpio + MCFGPIO_IRQ_VECBASE;
-	else
-		return __gpio_to_irq(gpio);
-}
-
-static inline int gpio_cansleep(unsigned gpio)
-{
-	return gpio < MCFGPIO_PIN_MAX ? 0 : __gpio_cansleep(gpio);
-}
-
-#ifndef CONFIG_GPIOLIB
-static inline int gpio_request_one(unsigned gpio, unsigned long flags, const char *label)
-{
-	int err;
-
-	err = gpio_request(gpio, label);
-	if (err)
-		return err;
-
-	if (flags & GPIOF_DIR_IN)
-		err = gpio_direction_input(gpio);
-	else
-		err = gpio_direction_output(gpio,
-			(flags & GPIOF_INIT_HIGH) ? 1 : 0);
-
-	if (err)
-		gpio_free(gpio);
-
-	return err;
-}
-#endif /* !CONFIG_GPIOLIB */
-#endif
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 5c3b29bddc5b..e2a3e9b66151 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -3,14 +3,6 @@
 # GPIO infrastructure and drivers
 #
 
-config ARCH_HAVE_CUSTOM_GPIO_H
-	bool
-	help
-	  Selecting this config option from the architecture Kconfig allows
-	  the architecture to provide a custom asm/gpio.h implementation
-	  overriding the default implementations.  New uses of this are
-	  strongly discouraged.
-
 menuconfig GPIOLIB
 	bool "GPIO Support"
 	help
diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index d8d7daa7eb94..7e6b1b8277ca 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -54,11 +54,6 @@ struct gpio {
 };
 
 #ifdef CONFIG_GPIOLIB
-
-#ifdef CONFIG_ARCH_HAVE_CUSTOM_GPIO_H
-#include <asm/gpio.h>
-#else
-
 #include <asm-generic/gpio.h>
 
 static inline int gpio_get_value(unsigned int gpio)
@@ -81,8 +76,6 @@ static inline int gpio_to_irq(unsigned int gpio)
 	return __gpio_to_irq(gpio);
 }
 
-#endif /* ! CONFIG_ARCH_HAVE_CUSTOM_GPIO_H */
-
 /* CONFIG_GPIOLIB: bindings for managed devices that want to request gpios */
 
 struct device;
-- 
2.29.2

