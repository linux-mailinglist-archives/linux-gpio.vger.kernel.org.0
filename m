Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F74A44AB2B
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 11:02:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245203AbhKIKFZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 05:05:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:33138 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245197AbhKIKFS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Nov 2021 05:05:18 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 060D86117A;
        Tue,  9 Nov 2021 10:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636452152;
        bh=fjfhpwVnN6BHfoLcuj4XM+fICatVkggoN+SpWDROPhs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=gqTj3CAQGwE5HpUBXwux4QqvrZ8oU4tHfPDwmnfZLdjTSKu4T7iDh/1kut6FiU/9y
         OEJSVFQBdp1EDlWw1lEhFyigbg1wywdtGkWp1cfrAQpCm4GaWrkYBiPnORTK634uHs
         R97keSIHUrDZRvvgiGz4znqs94v3uE9tEDlFfbSN7VFNJyQY11yRDLVdIbz4cv930H
         X2jvE4EE+0lfekXHcvszzvQqGw3HIJL0C2mRuPnwAYrRErEXrbRskllvXO3/h9sdST
         Tyg9SC9t1nRt0N9lq7nWsPZF8uIFWq2MFEq3tzxAO+URGOLSKuSk0h5eitlWwRXZiz
         8VlKQ37MKa2tQ==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-gpio@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/8] gpiolib: split linux/gpio/driver.h out of linux/gpio.h
Date:   Tue,  9 Nov 2021 11:02:07 +0100
Message-Id: <20211109100207.2474024-9-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211109100207.2474024-1-arnd@kernel.org>
References: <20211109100207.2474024-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

Almost all gpio drivers include linux/gpio/driver.h, and other
files should not rely on includes from this header.

Remove the indirect include from here and include the correct
headers directly from where they are used.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-omap1/irq.c                              | 1 +
 arch/arm/mach-orion5x/board-rd88f5182.c                | 1 +
 arch/arm/mach-pxa/lubbock.c                            | 2 +-
 arch/arm/mach-s3c/mach-h1940.c                         | 1 +
 arch/arm/mach-s3c/s3c64xx.c                            | 1 +
 arch/arm/mach-sa1100/assabet.c                         | 1 +
 arch/arm/plat-orion/gpio.c                             | 1 +
 drivers/gpio/gpio-ucb1400.c                            | 1 +
 drivers/mfd/dm355evm_msp.c                             | 1 +
 drivers/mfd/htc-i2cpld.c                               | 1 +
 drivers/mfd/ucb1400_core.c                             | 1 +
 drivers/net/wireless/broadcom/brcm80211/brcmsmac/led.c | 1 +
 include/linux/bcma/bcma_driver_chipcommon.h            | 2 +-
 include/linux/gpio.h                                   | 3 ---
 include/linux/mfd/ucb1x00.h                            | 1 +
 include/linux/ucb1400.h                                | 1 +
 16 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-omap1/irq.c b/arch/arm/mach-omap1/irq.c
index ee6a93083154..d8c38270867f 100644
--- a/arch/arm/mach-omap1/irq.c
+++ b/arch/arm/mach-omap1/irq.c
@@ -41,6 +41,7 @@
 #include <linux/sched.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/irqdomain.h>
 
 #include <asm/irq.h>
 #include <asm/exception.h>
diff --git a/arch/arm/mach-orion5x/board-rd88f5182.c b/arch/arm/mach-orion5x/board-rd88f5182.c
index b7b0f52f4c0a..99abf6daca77 100644
--- a/arch/arm/mach-orion5x/board-rd88f5182.c
+++ b/arch/arm/mach-orion5x/board-rd88f5182.c
@@ -12,6 +12,7 @@
 #include <linux/gpio.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pci.h>
 #include <linux/irq.h>
diff --git a/arch/arm/mach-pxa/lubbock.c b/arch/arm/mach-pxa/lubbock.c
index 742d18a1f7dc..875b405d9fce 100644
--- a/arch/arm/mach-pxa/lubbock.c
+++ b/arch/arm/mach-pxa/lubbock.c
@@ -9,7 +9,7 @@
  *  Copyright:	MontaVista Software Inc.
  */
 #include <linux/clkdev.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/gpio/gpio-reg.h>
 #include <linux/gpio/machine.h>
 #include <linux/module.h>
diff --git a/arch/arm/mach-s3c/mach-h1940.c b/arch/arm/mach-s3c/mach-h1940.c
index 8a43ed1c4c4d..0cc9f9d08c38 100644
--- a/arch/arm/mach-s3c/mach-h1940.c
+++ b/arch/arm/mach-s3c/mach-h1940.c
@@ -18,6 +18,7 @@
 #include <linux/platform_device.h>
 #include <linux/io.h>
 #include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/gpio/machine.h>
 #include <linux/input.h>
 #include <linux/gpio_keys.h>
diff --git a/arch/arm/mach-s3c/s3c64xx.c b/arch/arm/mach-s3c/s3c64xx.c
index 4dfb648142f2..d098e28bd5dd 100644
--- a/arch/arm/mach-s3c/s3c64xx.c
+++ b/arch/arm/mach-s3c/s3c64xx.c
@@ -24,6 +24,7 @@
 #include <linux/platform_device.h>
 #include <linux/reboot.h>
 #include <linux/io.h>
+#include <linux/of.h>
 #include <linux/clk/samsung.h>
 #include <linux/dma-mapping.h>
 #include <linux/irq.h>
diff --git a/arch/arm/mach-sa1100/assabet.c b/arch/arm/mach-sa1100/assabet.c
index 9919e0f32c4b..4ba2d28c1fd3 100644
--- a/arch/arm/mach-sa1100/assabet.c
+++ b/arch/arm/mach-sa1100/assabet.c
@@ -12,6 +12,7 @@
 #include <linux/errno.h>
 #include <linux/gpio/gpio-reg.h>
 #include <linux/gpio/machine.h>
+#include <linux/gpio/driver.h>
 #include <linux/gpio_keys.h>
 #include <linux/ioport.h>
 #include <linux/platform_data/sa11x0-serial.h>
diff --git a/arch/arm/plat-orion/gpio.c b/arch/arm/plat-orion/gpio.c
index 734f0be4f14a..e21d589ec78a 100644
--- a/arch/arm/plat-orion/gpio.c
+++ b/arch/arm/plat-orion/gpio.c
@@ -19,6 +19,7 @@
 #include <linux/bitops.h>
 #include <linux/io.h>
 #include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/leds.h>
 #include <linux/of.h>
 #include <linux/of_irq.h>
diff --git a/drivers/gpio/gpio-ucb1400.c b/drivers/gpio/gpio-ucb1400.c
index d2a8644864c3..aceac8bb12ff 100644
--- a/drivers/gpio/gpio-ucb1400.c
+++ b/drivers/gpio/gpio-ucb1400.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/gpio/driver.h>
 #include <linux/ucb1400.h>
 
 static int ucb1400_gpio_dir_in(struct gpio_chip *gc, unsigned off)
diff --git a/drivers/mfd/dm355evm_msp.c b/drivers/mfd/dm355evm_msp.c
index 2388fb4d0121..2c82907600f0 100644
--- a/drivers/mfd/dm355evm_msp.c
+++ b/drivers/mfd/dm355evm_msp.c
@@ -13,6 +13,7 @@
 #include <linux/err.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 #include <linux/gpio/machine.h>
 #include <linux/leds.h>
 #include <linux/i2c.h>
diff --git a/drivers/mfd/htc-i2cpld.c b/drivers/mfd/htc-i2cpld.c
index 417b0355d904..d7d0a2e50746 100644
--- a/drivers/mfd/htc-i2cpld.c
+++ b/drivers/mfd/htc-i2cpld.c
@@ -20,6 +20,7 @@
 #include <linux/irq.h>
 #include <linux/spinlock.h>
 #include <linux/htcpld.h>
+#include <linux/gpio/driver.h>
 #include <linux/gpio.h>
 #include <linux/slab.h>
 
diff --git a/drivers/mfd/ucb1400_core.c b/drivers/mfd/ucb1400_core.c
index 8c3832a58ef6..f71ef41ac9dc 100644
--- a/drivers/mfd/ucb1400_core.c
+++ b/drivers/mfd/ucb1400_core.c
@@ -20,6 +20,7 @@
 #include <linux/module.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
+#include <linux/gpio/driver.h>
 #include <linux/ucb1400.h>
 
 unsigned int ucb1400_adc_read(struct snd_ac97 *ac97, u16 adc_channel,
diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/led.c b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/led.c
index c1b9ac692d26..2349fcce37dd 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmsmac/led.c
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmsmac/led.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <net/mac80211.h>
 #include <linux/bcma/bcma_driver_chipcommon.h>
+#include <linux/gpio.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/machine.h>
 #include <linux/gpio/consumer.h>
diff --git a/include/linux/bcma/bcma_driver_chipcommon.h b/include/linux/bcma/bcma_driver_chipcommon.h
index d35b9206096d..9ba1b6311681 100644
--- a/include/linux/bcma/bcma_driver_chipcommon.h
+++ b/include/linux/bcma/bcma_driver_chipcommon.h
@@ -3,7 +3,7 @@
 #define LINUX_BCMA_DRIVER_CC_H_
 
 #include <linux/platform_device.h>
-#include <linux/gpio.h>
+#include <linux/gpio/driver.h>
 
 /** ChipCommon core registers. **/
 #define BCMA_CC_ID			0x0000
diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index 61fb427b4e70..f25546e060e9 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -54,9 +54,6 @@ struct gpio {
 };
 
 #ifdef CONFIG_GPIOLIB
-
-#include <linux/compiler.h>
-#include <linux/gpio/driver.h>
 #include <linux/gpio/consumer.h>
 
 /* Platforms may implement their GPIO interface with library code,
diff --git a/include/linux/mfd/ucb1x00.h b/include/linux/mfd/ucb1x00.h
index 43bcf35afe27..7c0d40ddc674 100644
--- a/include/linux/mfd/ucb1x00.h
+++ b/include/linux/mfd/ucb1x00.h
@@ -9,6 +9,7 @@
 
 #include <linux/device.h>
 #include <linux/mfd/mcp.h>
+#include <linux/gpio/driver.h>
 #include <linux/gpio.h>
 #include <linux/mutex.h>
 
diff --git a/include/linux/ucb1400.h b/include/linux/ucb1400.h
index 0968ef458447..199b1280fa26 100644
--- a/include/linux/ucb1400.h
+++ b/include/linux/ucb1400.h
@@ -23,6 +23,7 @@
 #include <sound/ac97_codec.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
+#include <linux/gpio/driver.h>
 #include <linux/gpio.h>
 
 /*
-- 
2.29.2

