Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67E603142DC
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Feb 2021 23:25:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231439AbhBHWY7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 17:24:59 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:40847 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231243AbhBHWYy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2021 17:24:54 -0500
Received: from orion.localdomain ([95.115.15.83]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MHWvH-1l4Vpb1y9R-00DYpE; Mon, 08 Feb 2021 23:22:18 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     rafael@kernel.org, info@metux.net, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        frowand.list@gmail.com, pantelis.antoniou@konsulko.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: [RFC PATCH 12/12] platform/x86/of: add support for PC Engines APU v2/3/4 boards
Date:   Mon,  8 Feb 2021 23:22:03 +0100
Message-Id: <20210208222203.22335-13-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210208222203.22335-1-info@metux.net>
References: <20210208222203.22335-1-info@metux.net>
X-Provags-ID: V03:K1:8voYo/lO6B6/0O0ejkXg6WyIxjmfqfu0KrstP1wAK9IPrXfjknO
 e8xQ2QnJZfpS+53a2DqZQ3/cE/M/5VU63xtsmnXjG+0xkueiICrRltIszgqUcBgVRrfsQTP
 S/irinwdJhe8tkv+7teK9hxZidhn4e1w8p0HV+uCY0cJdkpvrx2JwyDCwjpiuapnFJcu43Z
 2iDZMb+BitooMtEtBDQIQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:K+1rOvTtpI8=:nDO2tq0z1i4Ki499omWlw0
 2Di3wGsWFLe40rSklPL8terWi4QNYf9/CWVYtJD5xTSoT4HBUYYWaFZjkLL5/s9GLqqEQrwoQ
 p0V3JHgFHC1vWl+XLgIP/9ct4uWQFLpU1uVd5vR5bRiUeLQyol/S4gaogSrl7h0xVT6AG7btF
 z2ztsmZHyXoEh2sC1p9zR14kLGD4WvyjBpLL9yRFtK9pRfUMnXDDIc0uZqAT3KrsZDJPYMY1a
 J3iYXDCPxveGEv0w3JA8xveybwsQZffKg+qdQra5VyoIqehW2I05kkPlT2BgPa8Szhe0gOovG
 5pMpLr4oiHlxcgkfj2fUi1+oEOdiB76jiLNc4UD2tn7/4D6nL1wBR78CPZeuh7QjRfxqdb/gx
 3iUTXLpZAP2js0LHBilJV4LWBmxbXsMy0L4vvNtvLYGjBNiH5ErrqThZ72+Cl
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add oftree based support for PC Engines APUv2/3/4 board family.
This is entirely separate from the existing pcengines-apuv2 driver.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/platform/of/Kconfig   | 15 ++++++++
 drivers/platform/of/Makefile  |  2 +
 drivers/platform/of/apu2x.dts | 86 +++++++++++++++++++++++++++++++++++++++++++
 drivers/platform/of/init.c    |  7 ++++
 4 files changed, 110 insertions(+)
 create mode 100644 drivers/platform/of/apu2x.dts

diff --git a/drivers/platform/of/Kconfig b/drivers/platform/of/Kconfig
index a0b5a641a7c6..e13b6ee8c316 100644
--- a/drivers/platform/of/Kconfig
+++ b/drivers/platform/of/Kconfig
@@ -38,4 +38,19 @@ config PLATFORM_OF_DRV_SYSFS_DT
 	  Say Y here to enable exposing device tree nodes at
 	  /sys/firmware/devicetree.
 
+config PLATFORM_OF_DRV_PCENGINES_APU2
+	bool "Support PC Engines APU2/3/4 mainboards"
+	depends on INPUT
+	depends on GPIOLIB
+	depends on X86
+	select GPIO_AMD_FCH
+	select KEYBOARD_GPIO_POLLED
+	select LEDS_GPIO
+	select INPUT_KEYBOARD
+	help
+	  Say Y to enable devicetree based support for PC Engines APU2/3/4
+	  mainboards. This supersedes the older pcengines-apu2 driver.
+
+	  Supports Gpios, front panel LEDs and front button.
+
 endif # PLATFORM_OF_DRV
diff --git a/drivers/platform/of/Makefile b/drivers/platform/of/Makefile
index 84cf3003c500..dd4a13c18f16 100644
--- a/drivers/platform/of/Makefile
+++ b/drivers/platform/of/Makefile
@@ -2,4 +2,6 @@
 
 ofboard-y := init.o drv.o
 
+ofboard-$(CONFIG_PLATFORM_OF_DRV_PCENGINES_APU2) += apu2x.dtb.o
+
 obj-$(CONFIG_PLATFORM_OF_DRV) += ofboard.o
diff --git a/drivers/platform/of/apu2x.dts b/drivers/platform/of/apu2x.dts
new file mode 100644
index 000000000000..c16a59eb2a0e
--- /dev/null
+++ b/drivers/platform/of/apu2x.dts
@@ -0,0 +1,86 @@
+/dts-v1/;
+
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/gpio/amd-fch-gpio.h>
+
+/ {
+    apu2x {
+        compatible = "virtual,dmi-board";
+        dmi-sys-vendor = "PC engines";
+        dmi-board-name =
+          "APU2",
+          "apu2",
+          "PC engines apu2",
+          "APU3",
+          "apu3",
+          "PC engines apu3",
+          "APU4",
+          "apu4",
+          "PC engines apu4";
+        unbind {
+            acpi = "PNP0076:00", "PNP0B00:00";
+            platform = "platform-framebuffer.0", "PNP0103:00";
+        };
+        devices {
+            gpio1: gpio1 {
+                compatible = "amd,fch-gpio";
+                gpio-controller;
+                status = "okay";
+                ngpios=<7>;
+                #gpio-cells=<2>;
+                gpio-regs = <
+                    AMD_FCH_GPIO_REG_GPIO57 // led1
+                    AMD_FCH_GPIO_REG_GPIO58 // led2
+                    AMD_FCH_GPIO_REG_GPIO59_DEVSLP1 // led3
+                    AMD_FCH_GPIO_REG_GPIO32_GE1 // modesw
+                    AMD_FCH_GPIO_REG_GPIO33_GE2 // simawap
+                    AMD_FCH_GPIO_REG_GPIO55_DEVSLP0 // mpcie2
+                    AMD_FCH_GPIO_REG_GPIO51 // mpcie3
+                >;
+                gpio-line-names =
+                    "front-led1",
+                    "front-led2",
+                    "front-led3",
+                    "front-button",
+                    "simswap",
+                    "mpcie2_reset",
+                    "mpcie3_reset";
+            };
+            front-leds {
+                compatible = "gpio-leds";
+                led@0 {
+                    gpios = <&gpio1 0 GPIO_ACTIVE_HIGH>;
+                    color = <LED_COLOR_ID_GREEN>;
+                    default-state = "keep";
+                    label = "apu:green:1";
+                };
+                led@1 {
+                    gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
+                    color = <LED_COLOR_ID_GREEN>;
+                    default-state = "keep";
+                    label = "apu:green:2";
+                };
+                led@2 {
+                    gpios = <&gpio1 2 GPIO_ACTIVE_HIGH>;
+                    color = <LED_COLOR_ID_GREEN>;
+                    default-state = "keep";
+                    label = "apu:green:3";
+                };
+            };
+            front-keys {
+                compatible = "gpio-keys-polled";
+                address-cells = <1>;
+                size-cells = <0>;
+                poll-interval = <100>;
+                button@1 {
+                    linux,code = <KEY_RESTART>;
+                    label = "front button";
+                    debounce-interval = <10>;
+                    gpios = <&gpio1 3 GPIO_ACTIVE_HIGH>;
+                };
+            };
+        };
+    };
+};
diff --git a/drivers/platform/of/init.c b/drivers/platform/of/init.c
index 3b8373cda77a..195120dad26d 100644
--- a/drivers/platform/of/init.c
+++ b/drivers/platform/of/init.c
@@ -47,7 +47,14 @@ static ssize_t fdt_image_raw_read(struct file *filep, struct kobject *kobj,
 	return count;
 }
 
+#ifdef CONFIG_PLATFORM_OF_DRV_PCENGINES_APU2
+DECLARE_FDT_EXTERN(apu2x);
+#endif
+
 static struct fdt_image fdt[] = {
+#ifdef CONFIG_PLATFORM_OF_DRV_PCENGINES_APU2
+	FDT_IMAGE_ENT(apu2x)
+#endif
 };
 
 static int __init ofdrv_init_sysfs(struct fdt_image *image)
-- 
2.11.0

