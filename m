Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB9F38D1A9
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2019 13:01:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbfHNLBc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Aug 2019 07:01:32 -0400
Received: from mga14.intel.com ([192.55.52.115]:3316 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726263AbfHNLBb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 14 Aug 2019 07:01:31 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 14 Aug 2019 04:01:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,385,1559545200"; 
   d="scan'208";a="376693151"
Received: from rfried-mobl1.iil.intel.com ([143.185.152.137])
  by fmsmga006.fm.intel.com with ESMTP; 14 Aug 2019 04:01:29 -0700
From:   Ramon Fried <ramon.fried@linux.intel.com>
To:     linus.walleij@linaro.org, bgolaszewski@baylibre.com,
        stefan.wahren@i2se.com
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] gpiolib: Take MUX usage into account
Date:   Wed, 14 Aug 2019 14:00:35 +0300
Message-Id: <20190814110035.13451-1-ramon.fried@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Stefan Wahren <stefan.wahren@i2se.com>

The user space like gpioinfo only see the GPIO usage but not the
MUX usage (e.g. I2C or SPI usage) of a pin. As a user we want to know which
pin is free/safe to use. So take the MUX usage of strict pinmux controllers
into account to get a more realistic view for ioctl GPIO_GET_LINEINFO_IOCTL.

Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>
Tested-by: Ramon Fried <rfried.dev@gmail.com>
Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
---
v3:
* Remove the debug message and replace with comment in code.
v2: Address review from linus:
* ** Please notive logic was reversed **
* renamed pinctrl_gpio_is_in_use() to pinctrl_gpio_can_use_line()
* renamed pinmux_is_in_use() to pinmux_can_be_used_for_gpio()
* changed dev_err to dev_dbg (Linus suggested removing it altogether, I
  find it better to keep it for debug).
 drivers/gpio/gpiolib.c           |  3 ++-
 drivers/pinctrl/core.c           | 28 ++++++++++++++++++++++++++++
 drivers/pinctrl/pinmux.c         | 24 ++++++++++++++++++++++++
 drivers/pinctrl/pinmux.h         |  8 ++++++++
 include/linux/pinctrl/consumer.h |  6 ++++++
 5 files changed, 68 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index f497003f119c..52937bf8e514 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1084,7 +1084,8 @@ static long gpio_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		    test_bit(FLAG_IS_HOGGED, &desc->flags) ||
 		    test_bit(FLAG_USED_AS_IRQ, &desc->flags) ||
 		    test_bit(FLAG_EXPORT, &desc->flags) ||
-		    test_bit(FLAG_SYSFS, &desc->flags))
+		    test_bit(FLAG_SYSFS, &desc->flags) ||
+		    !pinctrl_gpio_can_use_line(chip->base + lineinfo.line_offset))
 			lineinfo.flags |= GPIOLINE_FLAG_KERNEL;
 		if (test_bit(FLAG_IS_OUT, &desc->flags))
 			lineinfo.flags |= GPIOLINE_FLAG_IS_OUT;
diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index b70df27874d1..2bbd8ee93507 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -736,6 +736,34 @@ int pinctrl_get_group_selector(struct pinctrl_dev *pctldev,
 	return -EINVAL;
 }
 
+bool pinctrl_gpio_can_use_line(unsigned gpio)
+{
+	struct pinctrl_dev *pctldev;
+	struct pinctrl_gpio_range *range;
+	bool result;
+	int pin;
+
+	/*
+	 * Try to obtain GPIO range, if it fails
+	 * we're probably dealing with GPIO driver
+	 * without a backing pin controller - bail out.
+	 */
+	if (pinctrl_get_device_gpio_range(gpio, &pctldev, &range))
+		return true;
+
+	mutex_lock(&pctldev->mutex);
+
+	/* Convert to the pin controllers number space */
+	pin = gpio_to_pin(range, gpio);
+
+	result = pinmux_can_be_used_for_gpio(pctldev, pin);
+
+	mutex_unlock(&pctldev->mutex);
+
+	return result;
+}
+EXPORT_SYMBOL_GPL(pinctrl_gpio_can_use_line);
+
 /**
  * pinctrl_gpio_request() - request a single pin to be used as GPIO
  * @gpio: the GPIO pin number from the GPIO subsystem number space
diff --git a/drivers/pinctrl/pinmux.c b/drivers/pinctrl/pinmux.c
index 020e54f843f9..e914f6efd39e 100644
--- a/drivers/pinctrl/pinmux.c
+++ b/drivers/pinctrl/pinmux.c
@@ -70,6 +70,30 @@ int pinmux_validate_map(const struct pinctrl_map *map, int i)
 	return 0;
 }
 
+/**
+ * pinmux_can_be_used_for_gpio() - check if a specific pin
+ *	is either muxed to a different function or used as gpio.
+ *
+ * @pin: the pin number in the global pin space
+ *
+ * Controllers not defined as strict will always return true,
+ * menaning that the gpio can be used.
+ */
+bool pinmux_can_be_used_for_gpio(struct pinctrl_dev *pctldev, unsigned pin)
+{
+	struct pin_desc *desc = pin_desc_get(pctldev, pin);
+	const struct pinmux_ops *ops = pctldev->desc->pmxops;
+
+	/* Can't inspect pin, assume it can be used */
+	if (!desc)
+		return true;
+
+	if (ops->strict && desc->mux_usecount)
+		return false;
+
+	return !(ops->strict && !!desc->gpio_owner);
+}
+
 /**
  * pin_request() - request a single pin to be muxed in, typically for GPIO
  * @pin: the pin number in the global pin space
diff --git a/drivers/pinctrl/pinmux.h b/drivers/pinctrl/pinmux.h
index 794cb3a003ff..78c3a31be882 100644
--- a/drivers/pinctrl/pinmux.h
+++ b/drivers/pinctrl/pinmux.h
@@ -15,6 +15,8 @@ int pinmux_check_ops(struct pinctrl_dev *pctldev);
 
 int pinmux_validate_map(const struct pinctrl_map *map, int i);
 
+bool pinmux_can_be_used_for_gpio(struct pinctrl_dev *pctldev, unsigned pin);
+
 int pinmux_request_gpio(struct pinctrl_dev *pctldev,
 			struct pinctrl_gpio_range *range,
 			unsigned pin, unsigned gpio);
@@ -42,6 +44,12 @@ static inline int pinmux_validate_map(const struct pinctrl_map *map, int i)
 	return 0;
 }
 
+static inline bool pinmux_can_be_used_for_gpio(struct pinctrl_dev *pctldev,
+					       unsigned pin)
+{
+	return true;
+}
+
 static inline int pinmux_request_gpio(struct pinctrl_dev *pctldev,
 			struct pinctrl_gpio_range *range,
 			unsigned pin, unsigned gpio)
diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index 86720a5a384f..7f8c7d9583d3 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -24,6 +24,7 @@ struct device;
 #ifdef CONFIG_PINCTRL
 
 /* External interface to pin control */
+extern bool pinctrl_gpio_can_use_line(unsigned gpio);
 extern int pinctrl_gpio_request(unsigned gpio);
 extern void pinctrl_gpio_free(unsigned gpio);
 extern int pinctrl_gpio_direction_input(unsigned gpio);
@@ -61,6 +62,11 @@ static inline int pinctrl_pm_select_idle_state(struct device *dev)
 
 #else /* !CONFIG_PINCTRL */
 
+static inline bool pinctrl_gpio_can_use_line(unsigned gpio)
+{
+	return true;
+}
+
 static inline int pinctrl_gpio_request(unsigned gpio)
 {
 	return 0;
-- 
2.20.1

