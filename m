Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 76A4344AB1E
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 11:02:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245147AbhKIKFF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 05:05:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:32830 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229845AbhKIKFE (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Nov 2021 05:05:04 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7705561130;
        Tue,  9 Nov 2021 10:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636452138;
        bh=DUehqWf4vbNszyHCVSiu/iWrhygFDGGAmXDS6YG4J44=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YST7JT7IimcM4PZpvx4nixkBdfxoyI3W9rYtID0k3tHTHhTusYZs59m4q9nn++l6A
         bEraa++DgFEBdkHib9c4QgX1+43GMugBhtlfDF1Qx9HUrf+/OCW5OjstP2VXGluTlW
         UBkjtoZFh9rKUOILiXi+dht2+aJvkjWqo51NQNwPuPwus+7zHv4YktVy+N4bKeCSQT
         aqzaLJpcsP2yClo9e/sTQ8itN57rr2lLLUqV7yIasVptcIc+Id5D02WAfr+lZtT0TD
         NPg2BHuW9qMkst4bQgnoW09GfBscyevrMr5mnlR6qxOFvEzPJDooArmoOeiSzUhcc6
         epp9CVhhi5uvA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-gpio@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Fu Wei <tekkamanninja@gmail.com>, Alex Shi <alexs@kernel.org>,
        Hu Haowen <src.res@email.cn>,
        linux-doc-tw-discuss@lists.sourceforge.net
Subject: [PATCH v2 1/8] gpiolib: remove irq_to_gpio() definition
Date:   Tue,  9 Nov 2021 11:02:00 +0100
Message-Id: <20211109100207.2474024-2-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211109100207.2474024-1-arnd@kernel.org>
References: <20211109100207.2474024-1-arnd@kernel.org>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
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

