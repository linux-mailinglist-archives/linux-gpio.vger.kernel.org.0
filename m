Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E25E444AB26
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Nov 2021 11:02:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245184AbhKIKFP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Nov 2021 05:05:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:33014 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245179AbhKIKFO (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 9 Nov 2021 05:05:14 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id EF7A461130;
        Tue,  9 Nov 2021 10:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636452148;
        bh=pwmejsZnkl62Kuuzf1JnZ72Ygl7f6FNKemOPbCL9Ahs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=DOMVkIn9MFZq7++K4ZjBt7bq2AUqKtmwdJj4Q20SEmWa0ig9VlZpwR1vx1fQcmmZg
         xLA872cnuEJQzF/ibG7D7zU3JrNHNTVclUkENwjZGTt7TGEf0TPFBk/miywYld4XoJ
         /0OChCZ6lWPMYDZ4c/KEFd8iKbtST5k9o6ibpLMpX64X18f4tpg4Ge+qxmdDqyxYvD
         olFMlLWYBHBtUxJMHVZGCPMAoaDDm7sNFYlk18s0/5yKApWrdLP5qFAEtLQ9DODi1L
         1XgTZX+0SV5+p1haraxb4g3HDqqY3E2e54+BwrELhcJrfZ436Ad0pHUCd0srOUEhix
         Wu9Tvzt+oZywA==
From:   Arnd Bergmann <arnd@kernel.org>
To:     linux-gpio@vger.kernel.org
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/8] gpiolib: remove legacy gpio_export
Date:   Tue,  9 Nov 2021 11:02:05 +0100
Message-Id: <20211109100207.2474024-7-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211109100207.2474024-1-arnd@kernel.org>
References: <20211109100207.2474024-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

There are only a handful of users of gpio_export() and
related functions.

As these are just wrappers around the modern gpiod_export()
helper, remove the wrappers and open-code the gpio_to_desc
in all callers to shrink the legacy API.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 Documentation/admin-guide/gpio/sysfs.rst  |  2 +-
 Documentation/driver-api/gpio/legacy.rst  | 30 -----------------
 Documentation/translations/zh_CN/gpio.txt | 26 --------------
 Documentation/translations/zh_TW/gpio.txt | 27 ---------------
 arch/arm/mach-davinci/board-dm646x-evm.c  | 28 +++++++++-------
 arch/arm/mach-omap2/pdata-quirks.c        |  9 ++---
 arch/sh/boards/mach-ap325rxa/setup.c      |  7 ++--
 drivers/gpio/gpiolib-sysfs.c              |  4 +--
 drivers/media/i2c/noon010pc30.c           |  5 +--
 drivers/media/i2c/ov9650.c                |  4 +--
 drivers/media/i2c/s5k4ecgx.c              |  3 +-
 drivers/media/pci/sta2x11/sta2x11_vip.c   | 10 ++++--
 drivers/mfd/dm355evm_msp.c                |  3 +-
 drivers/net/ieee802154/ca8210.c           |  3 +-
 include/linux/gpio.h                      | 41 -----------------------
 15 files changed, 45 insertions(+), 157 deletions(-)

diff --git a/Documentation/admin-guide/gpio/sysfs.rst b/Documentation/admin-guide/gpio/sysfs.rst
index ec09ffd983e7..35171d15f78d 100644
--- a/Documentation/admin-guide/gpio/sysfs.rst
+++ b/Documentation/admin-guide/gpio/sysfs.rst
@@ -145,7 +145,7 @@ requested using gpio_request()::
 	/* export the GPIO to userspace */
 	int gpiod_export(struct gpio_desc *desc, bool direction_may_change);
 
-	/* reverse gpio_export() */
+	/* reverse gpiod_export() */
 	void gpiod_unexport(struct gpio_desc *desc);
 
 	/* create a sysfs link to an exported GPIO node */
diff --git a/Documentation/driver-api/gpio/legacy.rst b/Documentation/driver-api/gpio/legacy.rst
index eae185f771d7..34fcb14814db 100644
--- a/Documentation/driver-api/gpio/legacy.rst
+++ b/Documentation/driver-api/gpio/legacy.rst
@@ -717,36 +717,6 @@ gpiochip nodes (possibly in conjunction with schematics) to determine
 the correct GPIO number to use for a given signal.
 
 
-Exporting from Kernel code
---------------------------
-Kernel code can explicitly manage exports of GPIOs which have already been
-requested using gpio_request()::
-
-	/* export the GPIO to userspace */
-	int gpio_export(unsigned gpio, bool direction_may_change);
-
-	/* reverse gpio_export() */
-	void gpio_unexport();
-
-	/* create a sysfs link to an exported GPIO node */
-	int gpio_export_link(struct device *dev, const char *name,
-		unsigned gpio)
-
-After a kernel driver requests a GPIO, it may only be made available in
-the sysfs interface by gpio_export().  The driver can control whether the
-signal direction may change.  This helps drivers prevent userspace code
-from accidentally clobbering important system state.
-
-This explicit exporting can help with debugging (by making some kinds
-of experiments easier), or can provide an always-there interface that's
-suitable for documenting as part of a board support package.
-
-After the GPIO has been exported, gpio_export_link() allows creating
-symlinks from elsewhere in sysfs to the GPIO sysfs node.  Drivers can
-use this to provide the interface under their own device in sysfs with
-a descriptive name.
-
-
 API Reference
 =============
 
diff --git a/Documentation/translations/zh_CN/gpio.txt b/Documentation/translations/zh_CN/gpio.txt
index a23ee14fc927..e49fa88a2804 100644
--- a/Documentation/translations/zh_CN/gpio.txt
+++ b/Documentation/translations/zh_CN/gpio.txt
@@ -622,29 +622,3 @@ GPIO 控制器的路径类似 /sys/class/gpio/gpiochip42/ (对于从#42 GPIO
 固定的,例如在扩展卡上的 GPIO会根据所使用的主板或所在堆叠架构中其他的板子而
 有所不同。在这种情况下,你可能需要使用 gpiochip 节点(尽可能地结合电路图)来
 确定给定信号所用的 GPIO 编号。
-
-
-从内核代码中导出
--------------
-内核代码可以明确地管理那些已通过 gpio_request()申请的 GPIO 的导出:
-
-	/* 导出 GPIO 到用户空间 */
-	int gpio_export(unsigned gpio, bool direction_may_change);
-
-	/* gpio_export()的逆操作 */
-	void gpio_unexport();
-
-	/* 创建一个 sysfs 连接到已导出的 GPIO 节点 */
-	int gpio_export_link(struct device *dev, const char *name,
-		unsigned gpio)
-
-在一个内核驱动申请一个 GPIO 之后，它可以通过 gpio_export()使其在 sysfs
-接口中可见。该驱动可以控制信号方向是否可修改。这有助于防止用户空间代码无意间
-破坏重要的系统状态。
-
-这个明确的导出有助于(通过使某些实验更容易来)调试，也可以提供一个始终存在的接口，
-与文档配合作为板级支持包的一部分。
-
-在 GPIO 被导出之后，gpio_export_link()允许在 sysfs 文件系统的任何地方
-创建一个到这个 GPIO sysfs 节点的符号链接。这样驱动就可以通过一个描述性的
-名字，在 sysfs 中他们所拥有的设备下提供一个(到这个 GPIO sysfs 节点的)接口。
diff --git a/Documentation/translations/zh_TW/gpio.txt b/Documentation/translations/zh_TW/gpio.txt
index e3c076dd75a5..c9bf3ddd08b3 100644
--- a/Documentation/translations/zh_TW/gpio.txt
+++ b/Documentation/translations/zh_TW/gpio.txt
@@ -622,30 +622,3 @@ GPIO 控制器的路徑類似 /sys/class/gpio/gpiochip42/ (對於從#42 GPIO
 固定的,例如在擴展卡上的 GPIO會根據所使用的主板或所在堆疊架構中其他的板子而
 有所不同。在這種情況下,你可能需要使用 gpiochip 節點(儘可能地結合電路圖)來
 確定給定信號所用的 GPIO 編號。
-
-
-從內核代碼中導出
--------------
-內核代碼可以明確地管理那些已通過 gpio_request()申請的 GPIO 的導出:
-
-	/* 導出 GPIO 到用戶空間 */
-	int gpio_export(unsigned gpio, bool direction_may_change);
-
-	/* gpio_export()的逆操作 */
-	void gpio_unexport();
-
-	/* 創建一個 sysfs 連接到已導出的 GPIO 節點 */
-	int gpio_export_link(struct device *dev, const char *name,
-		unsigned gpio)
-
-在一個內核驅動申請一個 GPIO 之後，它可以通過 gpio_export()使其在 sysfs
-接口中可見。該驅動可以控制信號方向是否可修改。這有助於防止用戶空間代碼無意間
-破壞重要的系統狀態。
-
-這個明確的導出有助於(通過使某些實驗更容易來)調試，也可以提供一個始終存在的接口，
-與文檔配合作爲板級支持包的一部分。
-
-在 GPIO 被導出之後，gpio_export_link()允許在 sysfs 文件系統的任何地方
-創建一個到這個 GPIO sysfs 節點的符號連結。這樣驅動就可以通過一個描述性的
-名字，在 sysfs 中他們所擁有的設備下提供一個(到這個 GPIO sysfs 節點的)接口。
-
diff --git a/arch/arm/mach-davinci/board-dm646x-evm.c b/arch/arm/mach-davinci/board-dm646x-evm.c
index ee91d81ebbfd..4a258e33021d 100644
--- a/arch/arm/mach-davinci/board-dm646x-evm.c
+++ b/arch/arm/mach-davinci/board-dm646x-evm.c
@@ -19,7 +19,7 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/leds.h>
-#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/i2c.h>
 #include <linux/property.h>
@@ -249,7 +249,7 @@ static int evm_led_teardown(struct i2c_client *client, int gpio,
 	return 0;
 }
 
-static int evm_sw_gpio[4] = { -EINVAL, -EINVAL, -EINVAL, -EINVAL };
+static struct gpio_desc *evm_sw_gpio[4];
 
 static int evm_sw_setup(struct i2c_client *client, int gpio,
 			unsigned ngpio, void *c)
@@ -259,17 +259,19 @@ static int evm_sw_setup(struct i2c_client *client, int gpio,
 	char label[10];
 
 	for (i = 0; i < 4; ++i) {
+		struct gpio_desc *desc = gpio_to_desc(gpio + i);
+
 		snprintf(label, 10, "user_sw%d", i);
-		status = gpio_request(gpio, label);
+		status = gpio_request(gpio + i, label);
 		if (status)
 			goto out_free;
-		evm_sw_gpio[i] = gpio++;
+		evm_sw_gpio[i] = desc;
 
-		status = gpio_direction_input(evm_sw_gpio[i]);
+		status = gpiod_direction_input(desc);
 		if (status)
 			goto out_free;
 
-		status = gpio_export(evm_sw_gpio[i], 0);
+		status = gpiod_export(desc, 0);
 		if (status)
 			goto out_free;
 	}
@@ -277,9 +279,9 @@ static int evm_sw_setup(struct i2c_client *client, int gpio,
 
 out_free:
 	for (i = 0; i < 4; ++i) {
-		if (evm_sw_gpio[i] != -EINVAL) {
-			gpio_free(evm_sw_gpio[i]);
-			evm_sw_gpio[i] = -EINVAL;
+		if (evm_sw_gpio[i]) {
+			gpio_free(pin + i);
+			evm_sw_gpio[i] = NULL;
 		}
 	}
 	return status;
@@ -291,10 +293,10 @@ static int evm_sw_teardown(struct i2c_client *client, int gpio,
 	int i;
 
 	for (i = 0; i < 4; ++i) {
-		if (evm_sw_gpio[i] != -EINVAL) {
-			gpio_unexport(evm_sw_gpio[i]);
-			gpio_free(evm_sw_gpio[i]);
-			evm_sw_gpio[i] = -EINVAL;
+		if (evm_sw_gpio[i]) {
+			gpiod_unexport(evm_sw_gpio[i]);
+			gpio_free(gpio + i);
+			evm_sw_gpio[i] = NULL;
 		}
 	}
 	return 0;
diff --git a/arch/arm/mach-omap2/pdata-quirks.c b/arch/arm/mach-omap2/pdata-quirks.c
index e7fd29a502a0..1fdf7fcf091e 100644
--- a/arch/arm/mach-omap2/pdata-quirks.c
+++ b/arch/arm/mach-omap2/pdata-quirks.c
@@ -6,6 +6,7 @@
  */
 #include <linux/clk.h>
 #include <linux/davinci_emac.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
@@ -120,7 +121,7 @@ static int omap3_sbc_t3730_twl_callback(struct device *dev,
 	if (res)
 		return res;
 
-	gpio_export(gpio, 0);
+	gpiod_export(gpio_to_desc(gpio), 0);
 
 	return 0;
 }
@@ -135,7 +136,7 @@ static void __init omap3_sbc_t3x_usb_hub_init(int gpio, char *hub_name)
 		return;
 	}
 
-	gpio_export(gpio, 0);
+	gpiod_export(gpio_to_desc(gpio), 0);
 
 	udelay(10);
 	gpio_set_value(gpio, 1);
@@ -212,8 +213,8 @@ static void __init omap3_sbc_t3517_wifi_init(void)
 		return;
 	}
 
-	gpio_export(cm_t3517_wlan_gpios[0].gpio, 0);
-	gpio_export(cm_t3517_wlan_gpios[1].gpio, 0);
+	gpiod_export(gpio_to_desc(cm_t3517_wlan_gpios[0].gpio), 0);
+	gpiod_export(gpio_to_desc(cm_t3517_wlan_gpios[1].gpio), 0);
 
 	msleep(100);
 	gpio_set_value(cm_t3517_wlan_gpios[1].gpio, 0);
diff --git a/arch/sh/boards/mach-ap325rxa/setup.c b/arch/sh/boards/mach-ap325rxa/setup.c
index c77b5f00a66a..151792162152 100644
--- a/arch/sh/boards/mach-ap325rxa/setup.c
+++ b/arch/sh/boards/mach-ap325rxa/setup.c
@@ -18,6 +18,7 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio/machine.h>
 #include <linux/i2c.h>
 #include <linux/init.h>
@@ -411,16 +412,16 @@ static int __init ap325rxa_devices_setup(void)
 	/* LD3 and LD4 LEDs */
 	gpio_request(GPIO_PTX5, NULL); /* RUN */
 	gpio_direction_output(GPIO_PTX5, 1);
-	gpio_export(GPIO_PTX5, 0);
+	gpiod_export(gpio_to_desc(GPIO_PTX5), 0);
 
 	gpio_request(GPIO_PTX4, NULL); /* INDICATOR */
 	gpio_direction_output(GPIO_PTX4, 0);
-	gpio_export(GPIO_PTX4, 0);
+	gpiod_export(gpio_to_desc(GPIO_PTX4), 0);
 
 	/* SW1 input */
 	gpio_request(GPIO_PTF7, NULL); /* MODE */
 	gpio_direction_input(GPIO_PTF7);
-	gpio_export(GPIO_PTF7, 0);
+	gpiod_export(gpio_to_desc(GPIO_PTF7), 0);
 
 	/* LCDC */
 	gpio_request(GPIO_FN_LCDD15, NULL);
diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index 4098bc7f88b7..a83fba3649c4 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -511,7 +511,7 @@ static ssize_t unexport_store(struct class *class,
 		goto done;
 
 	desc = gpio_to_desc(gpio);
-	/* reject bogus commands (gpio_unexport ignores them) */
+	/* reject bogus commands (gpiod_unexport ignores them) */
 	if (!desc) {
 		pr_warn("%s: invalid GPIO %ld\n", __func__, gpio);
 		return -EINVAL;
@@ -814,7 +814,7 @@ static int __init gpiolib_sysfs_init(void)
 	 * early (e.g. before the class_register above was called).
 	 *
 	 * We run before arch_initcall() so chip->dev nodes can have
-	 * registered, and so arch_initcall() can always gpio_export().
+	 * registered, and so arch_initcall() can always gpiod_export().
 	 */
 	spin_lock_irqsave(&gpio_lock, flags);
 	list_for_each_entry(gdev, &gpio_devices, list) {
diff --git a/drivers/media/i2c/noon010pc30.c b/drivers/media/i2c/noon010pc30.c
index f3ac379ef34a..6faa44eb5354 100644
--- a/drivers/media/i2c/noon010pc30.c
+++ b/drivers/media/i2c/noon010pc30.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/slab.h>
@@ -755,7 +756,7 @@ static int noon010_probe(struct i2c_client *client,
 			goto np_err;
 		}
 		info->gpio_nreset = pdata->gpio_nreset;
-		gpio_export(info->gpio_nreset, 0);
+		gpiod_export(gpio_to_desc(info->gpio_nreset), 0);
 	}
 
 	if (gpio_is_valid(pdata->gpio_nstby)) {
@@ -767,7 +768,7 @@ static int noon010_probe(struct i2c_client *client,
 			goto np_err;
 		}
 		info->gpio_nstby = pdata->gpio_nstby;
-		gpio_export(info->gpio_nstby, 0);
+		gpiod_export(gpio_to_desc(info->gpio_nstby), 0);
 	}
 
 	for (i = 0; i < NOON010_NUM_SUPPLIES; i++)
diff --git a/drivers/media/i2c/ov9650.c b/drivers/media/i2c/ov9650.c
index c313e11a9754..021acd20ede2 100644
--- a/drivers/media/i2c/ov9650.c
+++ b/drivers/media/i2c/ov9650.c
@@ -1426,9 +1426,9 @@ static int ov965x_configure_gpios_pdata(struct ov965x *ov965x,
 			return ret;
 		v4l2_dbg(1, debug, &ov965x->sd, "set gpio %d to 1\n", gpio);
 
-		gpio_set_value_cansleep(gpio, 1);
-		gpio_export(gpio, 0);
 		ov965x->gpios[i] = gpio_to_desc(gpio);
+		gpiod_set_value_cansleep(ov965x->gpios[i], 1);
+		gpiod_export(ov965x->gpios[i], 0);
 	}
 
 	return 0;
diff --git a/drivers/media/i2c/s5k4ecgx.c b/drivers/media/i2c/s5k4ecgx.c
index af9a305242cd..419d03fcc978 100644
--- a/drivers/media/i2c/s5k4ecgx.c
+++ b/drivers/media/i2c/s5k4ecgx.c
@@ -15,6 +15,7 @@
 #include <linux/ctype.h>
 #include <linux/delay.h>
 #include <linux/firmware.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
@@ -852,7 +853,7 @@ static int s5k4ecgx_config_gpio(int nr, int val, const char *name)
 		return 0;
 	ret = gpio_request_one(nr, flags, name);
 	if (!ret)
-		gpio_export(nr, 0);
+		gpiod_export(gpio_to_desc(nr), 0);
 
 	return ret;
 }
diff --git a/drivers/media/pci/sta2x11/sta2x11_vip.c b/drivers/media/pci/sta2x11/sta2x11_vip.c
index 524912f20d9f..f7cef598f21d 100644
--- a/drivers/media/pci/sta2x11/sta2x11_vip.c
+++ b/drivers/media/pci/sta2x11/sta2x11_vip.c
@@ -18,6 +18,7 @@
 #include <linux/pci.h>
 #include <linux/interrupt.h>
 #include <linux/io.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio.h>
 #include <linux/i2c.h>
 #include <linux/delay.h>
@@ -893,6 +894,7 @@ static int sta2x11_vip_init_controls(struct sta2x11_vip *vip)
 static int vip_gpio_reserve(struct device *dev, int pin, int dir,
 			    const char *name)
 {
+	struct gpio_desc *desc = gpio_to_desc(pin);
 	int ret = -ENODEV;
 
 	if (!gpio_is_valid(pin))
@@ -904,7 +906,7 @@ static int vip_gpio_reserve(struct device *dev, int pin, int dir,
 		return ret;
 	}
 
-	ret = gpio_direction_output(pin, dir);
+	ret = gpiod_direction_output(desc, dir);
 	if (ret) {
 		dev_err(dev, "Failed to set direction for pin %d (%s)\n",
 			pin, name);
@@ -912,7 +914,7 @@ static int vip_gpio_reserve(struct device *dev, int pin, int dir,
 		return ret;
 	}
 
-	ret = gpio_export(pin, false);
+	ret = gpiod_export(desc, false);
 	if (ret) {
 		dev_err(dev, "Failed to export pin %d (%s)\n", pin, name);
 		gpio_free(pin);
@@ -932,8 +934,10 @@ static int vip_gpio_reserve(struct device *dev, int pin, int dir,
 static void vip_gpio_release(struct device *dev, int pin, const char *name)
 {
 	if (gpio_is_valid(pin)) {
+		struct gpio_desc *desc = gpio_to_desc(pin);
+
 		dev_dbg(dev, "releasing pin %d (%s)\n",	pin, name);
-		gpio_unexport(pin);
+		gpiod_unexport(desc);
 		gpio_free(pin);
 	}
 }
diff --git a/drivers/mfd/dm355evm_msp.c b/drivers/mfd/dm355evm_msp.c
index 54fb6cbd2aa0..2388fb4d0121 100644
--- a/drivers/mfd/dm355evm_msp.c
+++ b/drivers/mfd/dm355evm_msp.c
@@ -11,6 +11,7 @@
 #include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/err.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio.h>
 #include <linux/gpio/machine.h>
 #include <linux/leds.h>
@@ -329,7 +330,7 @@ static int add_children(struct i2c_client *client)
 		gpio_request_one(gpio, GPIOF_IN, config_inputs[i].label);
 
 		/* make it easy for userspace to see these */
-		gpio_export(gpio, false);
+		gpiod_export(gpio_to_desc(gpio), false);
 	}
 
 	/* MMC/SD inputs -- right after the last config input */
diff --git a/drivers/net/ieee802154/ca8210.c b/drivers/net/ieee802154/ca8210.c
index ece6ff6049f6..6252907b2c92 100644
--- a/drivers/net/ieee802154/ca8210.c
+++ b/drivers/net/ieee802154/ca8210.c
@@ -51,6 +51,7 @@
 #include <linux/clk-provider.h>
 #include <linux/debugfs.h>
 #include <linux/delay.h>
+#include <linux/gpio/consumer.h>
 #include <linux/gpio.h>
 #include <linux/ieee802154.h>
 #include <linux/io.h>
@@ -2895,7 +2896,7 @@ static int ca8210_interrupt_init(struct spi_device *spi)
 	);
 	if (ret) {
 		dev_crit(&spi->dev, "request_irq %d failed\n", pdata->irq_id);
-		gpio_unexport(pdata->gpio_irq);
+		gpiod_unexport(gpio_to_desc(pdata->gpio_irq));
 		gpio_free(pdata->gpio_irq);
 	}
 
diff --git a/include/linux/gpio.h b/include/linux/gpio.h
index 64cc8f09eba8..7ceb93678689 100644
--- a/include/linux/gpio.h
+++ b/include/linux/gpio.h
@@ -144,26 +144,6 @@ extern int gpio_request_one(unsigned gpio, unsigned long flags, const char *labe
 extern int gpio_request_array(const struct gpio *array, size_t num);
 extern void gpio_free_array(const struct gpio *array, size_t num);
 
-/*
- * A sysfs interface can be exported by individual drivers if they want,
- * but more typically is configured entirely from userspace.
- */
-static inline int gpio_export(unsigned gpio, bool direction_may_change)
-{
-	return gpiod_export(gpio_to_desc(gpio), direction_may_change);
-}
-
-static inline int gpio_export_link(struct device *dev, const char *name,
-				   unsigned gpio)
-{
-	return gpiod_export_link(dev, name, gpio_to_desc(gpio));
-}
-
-static inline void gpio_unexport(unsigned gpio)
-{
-	gpiod_unexport(gpio_to_desc(gpio));
-}
-
 /* CONFIG_GPIOLIB: bindings for managed devices that want to request gpios */
 
 struct device;
@@ -253,27 +233,6 @@ static inline void gpio_set_value_cansleep(unsigned gpio, int value)
 	WARN_ON(1);
 }
 
-static inline int gpio_export(unsigned gpio, bool direction_may_change)
-{
-	/* GPIO can never have been requested or set as {in,out}put */
-	WARN_ON(1);
-	return -EINVAL;
-}
-
-static inline int gpio_export_link(struct device *dev, const char *name,
-				unsigned gpio)
-{
-	/* GPIO can never have been exported */
-	WARN_ON(1);
-	return -EINVAL;
-}
-
-static inline void gpio_unexport(unsigned gpio)
-{
-	/* GPIO can never have been exported */
-	WARN_ON(1);
-}
-
 static inline int gpio_to_irq(unsigned gpio)
 {
 	/* GPIO can never have been requested or set as input */
-- 
2.29.2

