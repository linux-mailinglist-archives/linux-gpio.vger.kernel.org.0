Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 47247486C2
	for <lists+linux-gpio@lfdr.de>; Mon, 17 Jun 2019 17:14:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728170AbfFQPOE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 17 Jun 2019 11:14:04 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:55572 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728254AbfFQPOE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jun 2019 11:14:04 -0400
Received: from nat-ies.mentorg.com ([192.94.31.2] helo=svr-ies-mbx-01.mgc.mentorg.com)
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1hctKZ-0004zr-Dj from Harish_Kandiga@mentor.com ; Mon, 17 Jun 2019 08:13:59 -0700
Received: from hkandiga-VirtualBox.ina-wifi.mentorg.com (137.202.0.90) by
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) with Microsoft SMTP Server
 (TLS) id 15.0.1320.4; Mon, 17 Jun 2019 16:13:55 +0100
From:   Harish Jenny K N <harish_kandiga@mentor.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     <linux-gpio@vger.kernel.org>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>
Subject: [PATCH V2 1/2] gpio: inverter: Add Inverter controller for gpio configuration
Date:   Mon, 17 Jun 2019 20:43:44 +0530
Message-ID: <1560784425-20227-2-git-send-email-harish_kandiga@mentor.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560784425-20227-1-git-send-email-harish_kandiga@mentor.com>
References: <1560784425-20227-1-git-send-email-harish_kandiga@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-07.mgc.mentorg.com (139.181.222.7) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Provides a new inverter gpio controller to configure the polarity
of the gpio pins. This driver enables the consumers to directly
use the gpio pin without worrying about the hardware level
polarity configuration. Polarity configuration will be done by
the inverter gpio controller based on device tree information.

Signed-off-by: Balasubramani Vivekanandan <balasubramani_vivekanandan@mentor.com>
Signed-off-by: Harish Jenny K N <harish_kandiga@mentor.com>
---
 drivers/gpio/Kconfig         |   9 +++
 drivers/gpio/Makefile        |   1 +
 drivers/gpio/gpio-inverter.c | 130 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 140 insertions(+)
 create mode 100644 drivers/gpio/gpio-inverter.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index acd40eb..8978047 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -77,6 +77,15 @@ config GPIO_GENERIC
 	depends on HAS_IOMEM # Only for IOMEM drivers
 	tristate

+config GPIO_INVERTER
+	tristate "Inverter GPIO controller for handling hardware inverters"
+	depends on OF_GPIO
+	help
+	 Enabling this configuration provides an inverter gpio controller to
+	 configure the polarity of the gpio pins.
+	 This enables the consumers to directly use the gpio pin without
+	 worrying about the hardware level polarity configuration.
+
 # put drivers in the right section, in alphabetical order

 # This symbol is selected by both I2C and SPI expanders
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 6700eee..b951b73 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -61,6 +61,7 @@ obj-$(CONFIG_GPIO_HLWD)		+= gpio-hlwd.o
 obj-$(CONFIG_HTC_EGPIO)		+= gpio-htc-egpio.o
 obj-$(CONFIG_GPIO_ICH)		+= gpio-ich.o
 obj-$(CONFIG_GPIO_IOP)		+= gpio-iop.o
+obj-$(CONFIG_GPIO_INVERTER)	+= gpio-inverter.o
 obj-$(CONFIG_GPIO_IXP4XX)	+= gpio-ixp4xx.o
 obj-$(CONFIG_GPIO_IT87)		+= gpio-it87.o
 obj-$(CONFIG_GPIO_JANZ_TTL)	+= gpio-janz-ttl.o
diff --git a/drivers/gpio/gpio-inverter.c b/drivers/gpio/gpio-inverter.c
new file mode 100644
index 0000000..c0b09a8
--- /dev/null
+++ b/drivers/gpio/gpio-inverter.c
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Inverter GPIO controller for configuring the gpio polarity
+ *
+ * Copyright (c) 2019 Mentor Graphics Inc.
+ * Developed using gpiolib and gpio documentation as reference
+ *
+ */
+
+#include <linux/gpio/driver.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_gpio.h>
+#include <linux/platform_device.h>
+
+struct gpio_inverter {
+	struct gpio_chip gpiochip;
+	int count;
+	struct gpio_desc *gpios[];
+};
+
+static int gpio_inverter_direction_input(struct gpio_chip *chip,
+					 unsigned int offset)
+{
+	struct gpio_inverter *inv = gpiochip_get_data(chip);
+
+	return gpiod_direction_input(inv->gpios[offset]);
+}
+
+static int gpio_inverter_direction_output(struct gpio_chip *chip,
+					  unsigned int offset, int value)
+{
+	struct gpio_inverter *inv = gpiochip_get_data(chip);
+
+	return gpiod_direction_output(inv->gpios[offset], value);
+}
+
+static int gpio_inverter_get(struct gpio_chip *chip,
+			     unsigned int offset)
+{
+	struct gpio_inverter *inv = gpiochip_get_data(chip);
+
+	return gpiod_get_value(inv->gpios[offset]);
+}
+
+static void gpio_inverter_set(struct gpio_chip *chip,
+			      unsigned int offset, int value)
+{
+	struct gpio_inverter *inv = gpiochip_get_data(chip);
+
+	return gpiod_set_value(inv->gpios[offset], value);
+}
+
+static int gpio_inverter_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct gpio_inverter *inv;
+	struct gpio_chip *gpio_chip;
+	struct gpio_desc *gpio;
+	int index = 0;
+	int count;
+	int ret;
+
+	count = of_gpio_named_count(dev->of_node, "mapped-gpios");
+	if (count <= 0)
+		return count ? count : -ENOENT;
+
+	inv = devm_kzalloc(dev, struct_size(inv, gpios, count), GFP_KERNEL);
+	if (!inv)
+		return -ENOMEM;
+
+	inv->count = count;
+	gpio_chip = &inv->gpiochip;
+
+	platform_set_drvdata(pdev, inv);
+
+	while (index < count) {
+		gpio = devm_gpiod_get_index(dev, "mapped", index, GPIOD_ASIS);
+
+		if (gpio == ERR_PTR(-ENOENT)) {
+			devm_kfree(dev, inv);
+			return -EPROBE_DEFER;
+		}
+
+		if (IS_ERR(gpio))
+			return PTR_ERR(gpio);
+
+		inv->gpios[index++] = gpio;
+
+		if (!gpio_chip->can_sleep && gpiod_cansleep(gpio))
+			gpio_chip->can_sleep = true;
+	}
+
+	gpio_chip->direction_input = gpio_inverter_direction_input;
+	gpio_chip->direction_output = gpio_inverter_direction_output;
+	gpio_chip->get = gpio_inverter_get;
+	gpio_chip->set = gpio_inverter_set;
+	gpio_chip->label = dev_name(dev);
+	gpio_chip->parent = dev;
+	gpio_chip->owner = THIS_MODULE;
+	gpio_chip->base = -1;
+	gpio_chip->ngpio = count;
+
+	ret = devm_gpiochip_add_data(dev, gpio_chip, inv);
+	if (ret) {
+		dev_err(dev, "failed to add gpio controller\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id gpio_inverter_match[] = {
+	{ .compatible =	"gpio-inverter", }, { },
+};
+
+static struct platform_driver gpio_inverter_driver = {
+	.probe = gpio_inverter_probe,
+	.driver = {
+		.name = "gpio-inverter",
+		.of_match_table = of_match_ptr(gpio_inverter_match),
+	}
+};
+
+module_platform_driver(gpio_inverter_driver);
+
+MODULE_AUTHOR("Harish Jenny K N <harish_kandiga@mentor.com>");
+MODULE_AUTHOR("Balasubramani Vivekanandan <balasubramani_vivekanandan@mentor.com>");
+MODULE_DESCRIPTION("Inverter GPIO controller for configuring the gpio polarity");
+MODULE_LICENSE("GPL v2");
--
2.7.4

