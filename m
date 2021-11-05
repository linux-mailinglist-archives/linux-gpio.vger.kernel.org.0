Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 516C14463D0
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Nov 2021 14:05:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232304AbhKENHv (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Nov 2021 09:07:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:60820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229529AbhKENHu (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Nov 2021 09:07:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D853960F9B;
        Fri,  5 Nov 2021 13:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636117511;
        bh=6FVtM7FUSM088mvn0cSNCSb+1cHuf9j6YMD9UfEWxos=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=G9wm9iv+hMWobcEhD6wsKAjW2dqjJx20+PEb2ackVBCZXzll27QaTjRZ/VFOfh7x+
         dprj/odm+VLFlGkARMvdB4CeQjMOy4TQ/SKIokFc0j4RStxQOdGJM2G/LoD69/LO0j
         OQsPAYCtQoQhWXmhmi4AQbs7wDDKVfzrotvydL0/fi0QdhPvedfJZUho2W6GXc4s9G
         mBT1Igpyjhv+B1wMMJTYc18BHLHt+eSByUpWz94wKscY2owY+E6MbTr40bz9ONkkB6
         8gkEGOBIxN1/L30D++/hlnWS2+bcs0hBXMyvoLx8+TI2ArS6+nQYYIR3//Pf/LMCqP
         CC/mK1jDCeuJw==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-m68k@lists.linux-m68k.org, geert@linux-m68k.org,
        gerg@linux-m68k.org, linux@armlinux.org.uk,
        linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org,
        dalias@libc.org, ysato@users.sourceforge.jp,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org
Subject: [RFC 3/3] gpiolib: coldfire: remove custom asm/gpio.h
Date:   Fri,  5 Nov 2021 14:03:05 +0100
Message-Id: <20211105130338.241100-3-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211105130338.241100-1-arnd@kernel.org>
References: <20211105130338.241100-1-arnd@kernel.org>
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
was even used, so to my best knowledge removing this has no downsides.

The custom gpio_request_one() function is even less useful, as it is
guarded by an #ifdef that is never true.

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
index 9ef5d3fdd405..5b233e69a98f 100644
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

