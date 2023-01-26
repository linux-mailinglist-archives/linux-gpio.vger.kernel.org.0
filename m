Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13EB267CC1C
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Jan 2023 14:28:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236848AbjAZN2h (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Jan 2023 08:28:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37752 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236668AbjAZN2h (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 26 Jan 2023 08:28:37 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49CEA7282;
        Thu, 26 Jan 2023 05:28:16 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 95FFDB81D98;
        Thu, 26 Jan 2023 13:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41CB0C433D2;
        Thu, 26 Jan 2023 13:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674739693;
        bh=aS6kylYmn924ux3OlisnQEqp3LCBWw+fYnrGBZdDFrk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=EuFeV5AHTIK6Z2L9ygsgp22bb1tWwKzkJNvx06VKrQIk02SWdiUIMsyH5HdbIaCjN
         deNsVlnrd9iw0MuxY9gzFssXEUYyyyIc1ZksZgmHAWEF4Ha4Sn2tMc0FNhgVmvrG6L
         B2VZ7mKHGl4RZDZ64dkkPHvdu/dGcRtbstfn3cKb0tla0pHA+424f6ZnyGqsjyDZxj
         3Oz9cVzBNniGZpGJvXq4D74XItYC8W1Q3F9Hx1KdcPOdlvlM/HMIv0LQTGlVx/A/YU
         70d7DfcRrclL09kVkXvFew6LIVSy/sn2koEavdN213NVYB7H+WLQHOksMJRHXo+Kmt
         1N0P2+KQm0TJw==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-gpio@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH 2/8] gpiolib: coldfire: remove custom asm/gpio.h
Date:   Thu, 26 Jan 2023 14:27:55 +0100
Message-Id: <20230126132801.2042371-3-arnd@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126132801.2042371-1-arnd@kernel.org>
References: <20230126132801.2042371-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
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
index 9380f6e3bb66..96a0fb4f1af5 100644
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
index 218d7e4c27ff..06a268d56800 100644
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
index 85beb236c925..2b75017b3aad 100644
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
2.39.0

