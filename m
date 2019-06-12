Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3308241B5D
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 06:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730249AbfFLEvo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 Jun 2019 00:51:44 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:51257 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730017AbfFLEvo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jun 2019 00:51:44 -0400
Received: from nat-ies.mentorg.com ([192.94.31.2] helo=svr-ies-mbx-01.mgc.mentorg.com)
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1havDq-0000fO-Te from Harish_Kandiga@mentor.com ; Tue, 11 Jun 2019 21:50:55 -0700
Received: from hkandiga-VirtualBox.ina-wifi.mentorg.com (137.202.0.90) by
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) with Microsoft SMTP Server
 (TLS) id 15.0.1320.4; Wed, 12 Jun 2019 05:50:50 +0100
From:   Harish Jenny K N <harish_kandiga@mentor.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     <linux-gpio@vger.kernel.org>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Balasubramani Vivekanandan 
        <balasubramani_vivekanandan@mentor.com>
Subject: [PATCH V1 1/2] gpio: inverter: Add virtual controller for gpio configuration
Date:   Wed, 12 Jun 2019 10:20:33 +0530
Message-ID: <1560315034-29712-2-git-send-email-harish_kandiga@mentor.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1560315034-29712-1-git-send-email-harish_kandiga@mentor.com>
References: <1560315034-29712-1-git-send-email-harish_kandiga@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-03.mgc.mentorg.com (139.181.222.3) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Provides a new virtual gpio controller to configure the polarity
of the gpio pins used by the userspace. When there is no kernel
driver using the gpio pin, it becomes necessary for the userspace
to configure the polarity of the gpio pin.
This driver enables the userspace to directly use the gpio pin
without worrying about the hardware level polarity configuration.
Polarity configuration will be done by the virtual gpio controller
based on device tree information

Signed-off-by: Balasubramani Vivekanandan <balasubramani_vivekanandan@mentor.com>
Signed-off-by: Harish Jenny K N <harish_kandiga@mentor.com>
---
 drivers/gpio/Kconfig         |   9 +++
 drivers/gpio/Makefile        |   1 +
 drivers/gpio/gpio-inverter.c | 144 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 154 insertions(+)
 create mode 100644 drivers/gpio/gpio-inverter.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index acd40eb..15893dd 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -77,6 +77,15 @@ config GPIO_GENERIC
 	depends on HAS_IOMEM # Only for IOMEM drivers
 	tristate

+config GPIO_INVERTER
+	tristate "Virtual GPIO controller for configuring the gpio polarity"
+	depends on OF_GPIO
+	help
+	 Enabling this configuration provides a virtual gpio controller to
+	 configure the polarity of the gpio pins used by the userspace.
+	 This enables the userspace to directly use the gpio pin without
+	 worrying about the hardware level polarity configuration
+
 # put drivers in the right section, in alphabetical order

 # This symbol is selected by both I2C and SPI expanders
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 6700eee..63d1bcc8 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -60,6 +60,7 @@ obj-$(CONFIG_GPIO_GW_PLD)	+= gpio-gw-pld.o
 obj-$(CONFIG_GPIO_HLWD)		+= gpio-hlwd.o
 obj-$(CONFIG_HTC_EGPIO)		+= gpio-htc-egpio.o
 obj-$(CONFIG_GPIO_ICH)		+= gpio-ich.o
+obj-$(CONFIG_GPIO_INVERTER)	+= gpio-inverter.o
 obj-$(CONFIG_GPIO_IOP)		+= gpio-iop.o
 obj-$(CONFIG_GPIO_IXP4XX)	+= gpio-ixp4xx.o
 obj-$(CONFIG_GPIO_IT87)		+= gpio-it87.o
diff --git a/drivers/gpio/gpio-inverter.c b/drivers/gpio/gpio-inverter.c
new file mode 100644
index 0000000..2408791
--- /dev/null
+++ b/drivers/gpio/gpio-inverter.c
@@ -0,0 +1,144 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Virtual GPIO controller for configuring the gpio polarity
+ *
+ * Copyright (c) 2019 Mentor Graphics Inc.
+ * Developed using gpiolib and gpio documentation as reference
+ *
+ */
+
+#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_gpio.h>
+#include <linux/platform_device.h>
+
+struct gpio_inverter {
+	struct gpio_chip gpiochip;
+	int count;
+	struct gpio_desc *gpios[0];
+};
+
+static int gpio_inverter_direction_input(struct gpio_chip *chip,
+					 unsigned int offset)
+{
+	struct gpio_inverter *virt = gpiochip_get_data(chip);
+
+	return gpiod_direction_input(virt->gpios[offset]);
+}
+
+static int gpio_inverter_direction_output(struct gpio_chip *chip,
+					  unsigned int offset, int value)
+{
+	struct gpio_inverter *virt = gpiochip_get_data(chip);
+
+	return gpiod_direction_output(virt->gpios[offset], value);
+}
+
+static int gpio_inverter_get(struct gpio_chip *chip,
+			     unsigned int offset)
+{
+	struct gpio_inverter *virt = gpiochip_get_data(chip);
+
+	return gpiod_get_value(virt->gpios[offset]);
+}
+
+static void gpio_inverter_set(struct gpio_chip *chip,
+			      unsigned int offset, int value)
+{
+	struct gpio_inverter *virt = gpiochip_get_data(chip);
+
+	return gpiod_set_value(virt->gpios[offset], value);
+}
+
+static int gpio_inverter_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct gpio_inverter *virt;
+	struct gpio_chip *gpio_chip;
+	struct gpio_desc *gpio;
+	int index = 0;
+	int count;
+	int ret;
+	int size;
+
+	count = of_gpio_named_count(dev->of_node, "mapped-gpios");
+	if (count <= 0)
+		return count ? count : -ENOENT;
+
+	size = sizeof(*virt) + count * sizeof(struct gpio_desc *);
+	virt = devm_kzalloc(dev, size, GFP_KERNEL);
+	if (!virt)
+		return -ENOMEM;
+
+	virt->count = count;
+
+	platform_set_drvdata(pdev, virt);
+
+	while (index < count) {
+		gpio = devm_gpiod_get_index(dev, "mapped", index, GPIOD_ASIS);
+		if (IS_ERR(gpio))
+			return PTR_ERR(gpio);
+
+		virt->gpios[index++] = gpio;
+	}
+
+	gpio_chip = &virt->gpiochip;
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
+	ret = gpiochip_add_data(gpio_chip, virt);
+	if (ret) {
+		dev_err(dev, "failed to add gpio controller\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int gpio_inverter_remove(struct platform_device *pdev)
+{
+	struct gpio_inverter *virt = platform_get_drvdata(pdev);
+
+	gpiochip_remove(&virt->gpiochip);
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
+	.remove = gpio_inverter_remove,
+	.driver = {
+		.name = "gpio-inverter",
+		.of_match_table = of_match_ptr(gpio_inverter_match),
+	}
+};
+
+static int __init gpio_inverter_init(void)
+{
+	return platform_driver_register(&gpio_inverter_driver);
+}
+late_initcall(gpio_inverter_init);
+
+static void __exit gpio_inverter_exit(void)
+{
+	platform_driver_unregister(&gpio_inverter_driver);
+}
+module_exit(gpio_inverter_exit);
+
+MODULE_AUTHOR("Harish Jenny K N <harish_kandiga@mentor.com>");
+MODULE_AUTHOR("Balasubramani Vivekanandan <balasubramani_vivekanandan@mentor.com>");
+MODULE_DESCRIPTION("Virtual GPIO controller for configuring the gpio polarity");
+MODULE_LICENSE("GPL v2");
--
2.7.4

