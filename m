Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA7539750D
	for <lists+linux-gpio@lfdr.de>; Wed, 21 Aug 2019 10:34:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727409AbfHUId0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 21 Aug 2019 04:33:26 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:35501 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726252AbfHUId0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Aug 2019 04:33:26 -0400
Received: by mail-lf1-f67.google.com with SMTP id p197so1178971lfa.2
        for <linux-gpio@vger.kernel.org>; Wed, 21 Aug 2019 01:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KFK3W9/4sdRlfOaAe5fhQcEvrbyxSgdVXy5dv18HZS8=;
        b=wLX0M2zfGF1mOm5ld2x4BtwZoYfMvtvDbySBnNYXmBvORzy+iwD2mEhwfuHWPP7IGO
         2hh6NBAbBLtwIbWFQUBt9jkvcCp71P1r50ECQjG8uiVZ4cMfTfSehA+fwrAnpPdooeoH
         Pm8G4XWIQjGYnLyLiLsmf9SHCLQl98Sh4ALl72iPryKIA+qBk74xBa5HH7t75yO1854o
         KNimZnR8HFT9/0Sw9UvP+uMsZIsYKCUW6nykukrbq8S4CEoaJOD4br4UwcWLLrzpeu/Z
         KflClLzhMCMmwLuWk+j0+c9InzxRsFGk+337GPL/Uvu4G3Ux6hzSZzLlRW2ptC1zKdGO
         xkAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=KFK3W9/4sdRlfOaAe5fhQcEvrbyxSgdVXy5dv18HZS8=;
        b=gIiSf4nptnAmRxX7bLuoHUuz14tRLJNxvwMHyhbSi53fPGn0PyVJAxPQGmwVusQZ8W
         98U7LKDz1i1sukmllte+v0MNSRtArf1uEVNX5JoX49NjxtBQwzYhhuyTx7TWMf26D7eM
         doq8yFYUZU0QBlSkEUklR9iUCYfE/z6cbGDHXkOje4l8gWjjGW8yxszmg7Y/394SWCuu
         J6yIyMK7wo9xfgKz6OP8nr+npjgN5CWpS/9gM/NO39DTA3bklJ9BvsjmN8Urn/dFzNJx
         OxKlTWMpNZLle4130XDb0PG/kHy69bFXelLloTbhjr1rGRlmKE47rvXgwoBU6hoU3lPz
         7Gqw==
X-Gm-Message-State: APjAAAW5BzepYnvfeihIQeH/3LzJsZbmIgdvUqmVcvtoFPBpeEKgS7b1
        /bQW+hsV7+FYgPaO2s1IX3k5vMZPO5g=
X-Google-Smtp-Source: APXvYqwLu2Y4JCWVU7nVzxuggNLVwazliq8wejaOyF2n/VEOBYdVCVP3jRn/Efn6evgyC8lCmUuF8A==
X-Received: by 2002:ac2:5506:: with SMTP id j6mr18634957lfk.144.1566376403597;
        Wed, 21 Aug 2019 01:33:23 -0700 (PDT)
Received: from genomnajs.ideon.se ([85.235.10.227])
        by smtp.gmail.com with ESMTPSA id j23sm3180992ljc.6.2019.08.21.01.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 01:33:22 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     linux-gpio@vger.kernel.org
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Michal Simek <monstr@monstr.eu>
Subject: [PATCH] RFT: microblaze: Switch to standard restart handler
Date:   Wed, 21 Aug 2019 10:33:20 +0200
Message-Id: <20190821083320.4788-1-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The microblaze uses the legacy APIs to dig out a GPIO pin
defined in the root of the device tree to issue a hard
reset of the platform.

Asserting a hard reset should be done using the standard
DT-enabled and fully GPIO descriptor aware driver in
drivers/power/reset/gpio-restart.c using the bindings
from Documentation/devicetree/bindings/power/reset/gpio-restart.txt

To achieve this, first make sure microblaze makes use of
the standard kernel restart path utilizing do_kernel_restart()
from <linux/reboot.h>. Put in some grace time and an
emergency print if the restart does not properly assert.

As this is basic platform functionality we patch the DTS
file and defconfig in one go for a lockstep change.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Michal Simek <monstr@monstr.eu>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Hi Michal, would be great if you could test and fix this up
so I can get rid of one more site where legacy GPIO is used.
I am unsure of the appropriate polarity and delays, hence the
comments in the DTS file.
---
 arch/microblaze/boot/dts/system.dts     | 16 +++++-
 arch/microblaze/configs/mmu_defconfig   |  2 +
 arch/microblaze/configs/nommu_defconfig |  2 +
 arch/microblaze/include/asm/setup.h     |  1 -
 arch/microblaze/kernel/reset.c          | 76 -------------------------
 arch/microblaze/mm/init.c               | 11 ++++
 6 files changed, 30 insertions(+), 78 deletions(-)

diff --git a/arch/microblaze/boot/dts/system.dts b/arch/microblaze/boot/dts/system.dts
index 5a8a9d090c37..c4e8bed50cb0 100644
--- a/arch/microblaze/boot/dts/system.dts
+++ b/arch/microblaze/boot/dts/system.dts
@@ -18,7 +18,6 @@
 	#address-cells = <1>;
 	#size-cells = <1>;
 	compatible = "xlnx,microblaze";
-	hard-reset-gpios = <&LEDs_8Bit 2 1>;
 	model = "testing";
 	DDR2_SDRAM: memory@90000000 {
 		device_type = "memory";
@@ -281,6 +280,21 @@
 				gpios = <&LEDs_8Bit 7 1>;
 			};
 		} ;
+
+		gpio-restart {
+			compatible = "gpio-restart";
+			/*
+			 * FIXME: is this active low or active high?
+			 * the current flag (1) indicates active low.
+			 * delay measures are templates, should be adjusted
+			 * to datasheet or trial-and-error with real hardware.
+			 */
+			hard-reset-gpios = <&LEDs_8Bit 2 1>;
+			active-delay = <100>;
+			inactive-delay = <10>;
+			wait-delay = <100>;
+		};
+
 		RS232_Uart_1: serial@84000000 {
 			clock-frequency = <125000000>;
 			compatible = "xlnx,xps-uartlite-1.00.a";
diff --git a/arch/microblaze/configs/mmu_defconfig b/arch/microblaze/configs/mmu_defconfig
index 92fd4e95b488..ae8d7d407ff4 100644
--- a/arch/microblaze/configs/mmu_defconfig
+++ b/arch/microblaze/configs/mmu_defconfig
@@ -59,6 +59,8 @@ CONFIG_SPI_XILINX=y
 CONFIG_GPIOLIB=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_XILINX=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_GPIO_RESTART=y
 # CONFIG_HWMON is not set
 CONFIG_WATCHDOG=y
 CONFIG_XILINX_WATCHDOG=y
diff --git a/arch/microblaze/configs/nommu_defconfig b/arch/microblaze/configs/nommu_defconfig
index 06d69a6e192d..a2a6be511551 100644
--- a/arch/microblaze/configs/nommu_defconfig
+++ b/arch/microblaze/configs/nommu_defconfig
@@ -62,6 +62,8 @@ CONFIG_SPI_XILINX=y
 CONFIG_GPIOLIB=y
 CONFIG_GPIO_SYSFS=y
 CONFIG_GPIO_XILINX=y
+CONFIG_POWER_RESET=y
+CONFIG_POWER_RESET_GPIO_RESTART=y
 # CONFIG_HWMON is not set
 CONFIG_WATCHDOG=y
 CONFIG_XILINX_WATCHDOG=y
diff --git a/arch/microblaze/include/asm/setup.h b/arch/microblaze/include/asm/setup.h
index ce9b7b786156..54d634ed98e6 100644
--- a/arch/microblaze/include/asm/setup.h
+++ b/arch/microblaze/include/asm/setup.h
@@ -29,7 +29,6 @@ void machine_early_init(const char *cmdline, unsigned int ram,
 		unsigned int fdt, unsigned int msr, unsigned int tlb0,
 		unsigned int tlb1);
 
-void machine_restart(char *cmd);
 void machine_shutdown(void);
 void machine_halt(void);
 void machine_power_off(void);
diff --git a/arch/microblaze/kernel/reset.c b/arch/microblaze/kernel/reset.c
index fcbe1daf6316..b56af4eb91bf 100644
--- a/arch/microblaze/kernel/reset.c
+++ b/arch/microblaze/kernel/reset.c
@@ -10,82 +10,6 @@
 #include <linux/init.h>
 #include <linux/of_platform.h>
 
-/* Trigger specific functions */
-#ifdef CONFIG_GPIOLIB
-
-#include <linux/of_gpio.h>
-
-static int handle; /* reset pin handle */
-static unsigned int reset_val;
-
-static int of_platform_reset_gpio_probe(void)
-{
-	int ret;
-	handle = of_get_named_gpio(of_find_node_by_path("/"),
-				   "hard-reset-gpios", 0);
-
-	if (!gpio_is_valid(handle)) {
-		pr_info("Skipping unavailable RESET gpio %d (%s)\n",
-				handle, "reset");
-		return -ENODEV;
-	}
-
-	ret = gpio_request(handle, "reset");
-	if (ret < 0) {
-		pr_info("GPIO pin is already allocated\n");
-		return ret;
-	}
-
-	/* get current setup value */
-	reset_val = gpio_get_value(handle);
-	/* FIXME maybe worth to perform any action */
-	pr_debug("Reset: Gpio output state: 0x%x\n", reset_val);
-
-	/* Setup GPIO as output */
-	ret = gpio_direction_output(handle, 0);
-	if (ret < 0)
-		goto err;
-
-	/* Setup output direction */
-	gpio_set_value(handle, 0);
-
-	pr_info("RESET: Registered gpio device: %d, current val: %d\n",
-							handle, reset_val);
-	return 0;
-err:
-	gpio_free(handle);
-	return ret;
-}
-device_initcall(of_platform_reset_gpio_probe);
-
-
-static void gpio_system_reset(void)
-{
-	if (gpio_is_valid(handle))
-		gpio_set_value(handle, 1 - reset_val);
-	else
-		pr_notice("Reset GPIO unavailable - halting!\n");
-}
-#else
-static void gpio_system_reset(void)
-{
-	pr_notice("No reset GPIO present - halting!\n");
-}
-
-void of_platform_reset_gpio_probe(void)
-{
-	return;
-}
-#endif
-
-void machine_restart(char *cmd)
-{
-	pr_notice("Machine restart...\n");
-	gpio_system_reset();
-	while (1)
-		;
-}
-
 void machine_shutdown(void)
 {
 	pr_notice("Machine shutdown...\n");
diff --git a/arch/microblaze/mm/init.c b/arch/microblaze/mm/init.c
index a015a951c8b7..4a45e037107f 100644
--- a/arch/microblaze/mm/init.c
+++ b/arch/microblaze/mm/init.c
@@ -17,6 +17,8 @@
 #include <linux/slab.h>
 #include <linux/swap.h>
 #include <linux/export.h>
+#include <linux/delay.h>
+#include <linux/reboot.h>
 
 #include <asm/page.h>
 #include <asm/mmu_context.h>
@@ -265,6 +267,15 @@ static void __init mmu_init_hw(void)
 			: : : "r11");
 }
 
+void machine_restart(char *cmd)
+{
+	do_kernel_restart(cmd);
+	/* Give the restart hook 1 s to take us down */
+	mdelay(1000);
+	pr_emerg("Reboot failed -- System halted\n");
+	while (1);
+}
+
 /*
  * MMU_init sets up the basic memory mappings for the kernel,
  * including both RAM and possibly some I/O regions,
-- 
2.21.0

