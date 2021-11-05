Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03EE84463C8
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Nov 2021 14:03:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232034AbhKENG1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Nov 2021 09:06:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:60544 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231239AbhKENG0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Nov 2021 09:06:26 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id A43D160F9B;
        Fri,  5 Nov 2021 13:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636117427;
        bh=GGdaqM4ZLemAr74nj3CO0oh8DGXzHO2ZiWpz2bA/Q3Q=;
        h=From:To:Cc:Subject:Date:From;
        b=u6myhAUt2cjOuDDabk6BRgRVtQ2o4mLVAZ4UlYg3DPrxXDPfMHXM1jsVdjGiBHxT9
         XXJpwoesp2JI2fnL0o/BMzHzH24tn8VWwCELASFCiqGXao8YP+xDf67DurV72/c649
         LVlfV/FgdsF9SguO9mRmIk/wkC6fO7D011U2+gy7TN25iXfGOL9NRyhOX6L2Qg5isx
         VoWPnwMxoRp1gURGnAWZCjveQmd7MX9ObAsf9w16Z9AsWGfCKQHkALBcFE3KG03ziD
         E9h0cGoY1kBdMGJ/JMj82kaORNJXT56Olfwo2tWTotYekHW9AaSO5n8cIJ6S6me1DC
         EI2UBZMXpx/ug==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-gpio@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-m68k@lists.linux-m68k.org, geert@linux-m68k.org,
        gerg@linux-m68k.org, linux@armlinux.org.uk,
        linux-arm-kernel@lists.infradead.org, linux-sh@vger.kernel.org,
        dalias@libc.org, ysato@users.sourceforge.jp,
        Arnd Bergmann <arnd@arndb.de>,
        Fu Wei <tekkamanninja@gmail.com>, Alex Shi <alexs@kernel.org>,
        Hu Haowen <src.res@email.cn>,
        linux-doc-tw-discuss@lists.sourceforge.net,
        Jonathan Corbet <corbet@lwn.net>,
        Drew Fustini <drew@beagleboard.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC 1/3] gpiolib: remove irq_to_gpio() definition
Date:   Fri,  5 Nov 2021 14:03:03 +0100
Message-Id: <20211105130338.241100-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

All implementations other than coldfire have returned an error since
the avr32 and blackfin architectures got removed, and the last user in
driver code was removed in 2016, so just remove this old interface.

The only reference is now in the Chinese documentation, which should be
changed to remove this reference as well.

Cc: Fu Wei <tekkamanninja@gmail.com>
Cc: Alex Shi <alexs@kernel.org>
Cc: Hu Haowen <src.res@email.cn>
Cc: linux-doc-tw-discuss@lists.sourceforge.net
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 Documentation/driver-api/gpio/legacy.rst | 20 +++++---------------
 arch/m68k/include/asm/gpio.h             |  7 -------
 arch/sh/include/asm/gpio.h               |  5 -----
 include/linux/gpio.h                     | 12 ------------
 4 files changed, 5 insertions(+), 39 deletions(-)

diff --git a/Documentation/driver-api/gpio/legacy.rst b/Documentation/driver-api/gpio/legacy.rst
index 9b12eeb89170..06c05e2d62c1 100644
--- a/Documentation/driver-api/gpio/legacy.rst
+++ b/Documentation/driver-api/gpio/legacy.rst
@@ -382,22 +382,18 @@ GPIOs mapped to IRQs
 --------------------
 GPIO numbers are unsigned integers; so are IRQ numbers.  These make up
 two logically distinct namespaces (GPIO 0 need not use IRQ 0).  You can
-map between them using calls like::
+map between them using::
 
 	/* map GPIO numbers to IRQ numbers */
 	int gpio_to_irq(unsigned gpio);
 
-	/* map IRQ numbers to GPIO numbers (avoid using this) */
-	int irq_to_gpio(unsigned irq);
-
-Those return either the corresponding number in the other namespace, or
+This returns an irq number corresponding to the gpio number, or
 else a negative errno code if the mapping can't be done.  (For example,
 some GPIOs can't be used as IRQs.)  It is an unchecked error to use a GPIO
-number that wasn't set up as an input using gpio_direction_input(), or
-to use an IRQ number that didn't originally come from gpio_to_irq().
+number that wasn't set up as an input using gpio_direction_input().
 
-These two mapping calls are expected to cost on the order of a single
-addition or subtraction.  They're not allowed to sleep.
+The mapping call is expected to cost on the order of a single
+addition or subtraction.  It is not allowed to sleep.
 
 Non-error values returned from gpio_to_irq() can be passed to request_irq()
 or free_irq().  They will often be stored into IRQ resources for platform
@@ -405,12 +401,6 @@ devices, by the board-specific initialization code.  Note that IRQ trigger
 options are part of the IRQ interface, e.g. IRQF_TRIGGER_FALLING, as are
 system wakeup capabilities.
 
-Non-error values returned from irq_to_gpio() would most commonly be used
-with gpio_get_value(), for example to initialize or update driver state
-when the IRQ is edge-triggered.  Note that some platforms don't support
-this reverse mapping, so you should avoid using it.
-
-
 Emulating Open Drain Signals
 ----------------------------
 Sometimes shared signals need to use "open drain" signaling, where only the
diff --git a/arch/m68k/include/asm/gpio.h b/arch/m68k/include/asm/gpio.h
index a50b27719a58..5cfc0996ba94 100644
--- a/arch/m68k/include/asm/gpio.h
+++ b/arch/m68k/include/asm/gpio.h
@@ -66,13 +66,6 @@ static inline int gpio_to_irq(unsigned gpio)
 		return __gpio_to_irq(gpio);
 }
 
-static inline int irq_to_gpio(unsigned irq)
-{
-	return (irq >= MCFGPIO_IRQ_VECBASE &&
-		irq < (MCFGPIO_IRQ_VECBASE + MCFGPIO_IRQ_MAX)) ?
-		irq - MCFGPIO_IRQ_VECBASE : -ENXIO;
-}
-
 static inline int gpio_cansleep(unsigned gpio)
 {
 	return gpio < MCFGPIO_PIN_MAX ? 0 : __gpio_cansleep(gpio);
diff --git a/arch/sh/include/asm/gpio.h b/arch/sh/include/asm/gpio.h
index d643250f0a0f..588c1380e4cb 100644
--- a/arch/sh/include/asm/gpio.h
+++ b/arch/sh/include/asm/gpio.h
@@ -40,11 +40,6 @@ static inline int gpio_to_irq(unsigned gpio)
 	return __gpio_to_irq(gpio);
 }
 
-static inline int irq_to_gpio(unsigned int irq)
-{
-	return -ENOSYS;
-}
-
 #endif /* CONFIG_GPIOLIB */
 
 #endif /* __ASM_SH_GPIO_H */
diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index 008ad3ee56b7..d8d7daa7eb94 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -81,11 +81,6 @@ static inline int gpio_to_irq(unsigned int gpio)
 	return __gpio_to_irq(gpio);
 }
 
-static inline int irq_to_gpio(unsigned int irq)
-{
-	return -EINVAL;
-}
-
 #endif /* ! CONFIG_ARCH_HAVE_CUSTOM_GPIO_H */
 
 /* CONFIG_GPIOLIB: bindings for managed devices that want to request gpios */
@@ -219,13 +214,6 @@ static inline int gpio_to_irq(unsigned gpio)
 	return -EINVAL;
 }
 
-static inline int irq_to_gpio(unsigned irq)
-{
-	/* irq can never have been returned from gpio_to_irq() */
-	WARN_ON(1);
-	return -EINVAL;
-}
-
 static inline int devm_gpio_request(struct device *dev, unsigned gpio,
 				    const char *label)
 {
-- 
2.29.2

