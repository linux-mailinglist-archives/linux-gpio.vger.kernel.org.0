Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E663E9B05
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 12:44:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726175AbfJ3Lom (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 07:44:42 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:40242 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726646AbfJ3Lok (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Oct 2019 07:44:40 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9UBiXNb059038;
        Wed, 30 Oct 2019 06:44:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1572435873;
        bh=rYSSM4QQvBNxXedZf/JT8Z1wpuviL0uJpGCJLxKXklw=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=fRGd9oslcE/5Oj4ya5QDqId5APqJ+Qb89+qlYIOR4LKb4P/suGYCvLkSYIcET+g7j
         VNezwrm1Axc4ZhCkUicF7weCI51fRc19pusQXMDrzCGnfFIIPwG38qbFU0hRSnAZlY
         rZ10KT82gIGeCPcfJUD19E8JHuJQkM6KhrzbqHes=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9UBiXo7080370
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 30 Oct 2019 06:44:33 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 30
 Oct 2019 06:44:19 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 30 Oct 2019 06:44:19 -0500
Received: from feketebors.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9UBiMSx006902;
        Wed, 30 Oct 2019 06:44:29 -0500
From:   Peter Ujfalusi <peter.ujfalusi@ti.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <m.szyprowski@samsung.com>, <broonie@kernel.org>,
        <t-kristo@ti.com>, <mripard@kernel.org>, <p.zabel@pengutronix.de>
Subject: [RFC 2/2] gpio: Add new driver for handling 'shared' gpio lines on boards
Date:   Wed, 30 Oct 2019 13:45:30 +0200
Message-ID: <20191030114530.872-3-peter.ujfalusi@ti.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191030114530.872-1-peter.ujfalusi@ti.com>
References: <20191030114530.872-1-peter.ujfalusi@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some board design opts to use the same GPIO line routed to different
onboard components.

The GPIO in question might be a reset line, enable line or mode selection
line, etc.
The drivers for the components do not know if in some board they have
dedicated GPIO on other boards they might share a GPIO line with other
entities, not necessary from the same class:

Two codec sharing the same enable line
One codec and one amplifier sharing the same line
Regulators sharing the same line
Display panels, backlights and touchscreen controllers

And any variation of these.

There is one thing usually the board designers make sure that the level
needed for the GPIO is matching for the components.

This driver adds a gpiochip to handle the board level split of a single
GPIO line and based on the active users of the line it will handle the
real GPIO to a level it should be:

We have two cases to take care:
1. GPIO line should be LOW to enable any of the components
if any of the shared line is requested to be LOW, set the GPIO line low

2. GPIO line should be HIGH to enable any of the components
if any of the shared line is requested to be HIGH, set the GPIO line high

At the end it is:
1. logical AND for the shared lines
2. logical OR for the shared lines

Signed-off-by: Peter Ujfalusi <peter.ujfalusi@ti.com>
---
 drivers/gpio/Kconfig       |   6 +
 drivers/gpio/Makefile      |   1 +
 drivers/gpio/gpio-shared.c | 229 +++++++++++++++++++++++++++++++++++++
 3 files changed, 236 insertions(+)
 create mode 100644 drivers/gpio/gpio-shared.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 088a8a0f8add..29585a13670e 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -69,6 +69,12 @@ config GPIO_SYSFS
 	  ioctl() operations instead. The character device is always
 	  available.
 
+config GPIO_SHARED
+	tristate "Driver for handling shared GPIO lines"
+	depends on OF_GPIO
+	help
+	  When a single GPIO line is connected to different peripherals.
+
 config GPIO_GENERIC
 	depends on HAS_IOMEM # Only for IOMEM drivers
 	tristate
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index e4599f90f702..f368268cbd3a 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -123,6 +123,7 @@ obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)	+= gpio-sama5d2-piobu.o
 obj-$(CONFIG_GPIO_SCH311X)		+= gpio-sch311x.o
 obj-$(CONFIG_GPIO_SCH)			+= gpio-sch.o
 obj-$(CONFIG_GPIO_SIOX)			+= gpio-siox.o
+obj-$(CONFIG_GPIO_SHARED)		+= gpio-shared.o
 obj-$(CONFIG_GPIO_SODAVILLE)		+= gpio-sodaville.o
 obj-$(CONFIG_GPIO_SPEAR_SPICS)		+= gpio-spear-spics.o
 obj-$(CONFIG_GPIO_SPRD)			+= gpio-sprd.o
diff --git a/drivers/gpio/gpio-shared.c b/drivers/gpio/gpio-shared.c
new file mode 100644
index 000000000000..37affc40cdf8
--- /dev/null
+++ b/drivers/gpio/gpio-shared.c
@@ -0,0 +1,229 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ *  Copyright (C) 2018 Texas Instruments Incorporated - http://www.ti.com
+ *  Author: Peter Ujfalusi <peter.ujfalusi@ti.com>
+ */
+
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/gpio/consumer.h>
+#include <linux/of.h>
+#include <linux/of_gpio.h>
+#include <linux/of_platform.h>
+#include <dt-bindings/gpio/gpio.h>
+
+enum gpio_shared_mode {
+	GPIO_SHARED_AND = 0,
+	GPIO_SHARED_OR,
+};
+
+struct gpio_client {
+	unsigned requested:1;
+	int value;
+};
+
+struct gpio_shared_priv {
+	struct device *dev;
+	struct gpio_desc *root_gpio;
+
+	struct gpio_chip gpio_chip;
+	enum gpio_shared_mode share_mode;
+	int root_value;
+
+	struct mutex mutex; /* protecting the counters */
+	int high_count;
+	int low_count;
+
+	/* root gpio calbacks */
+	int (*root_get)(const struct gpio_desc *desc);
+	void (*root_set)(struct gpio_desc *desc, int value);
+
+	struct gpio_client *clients;
+};
+
+static int gpio_shared_aggregate_root_value(struct gpio_shared_priv *priv)
+{
+	int value = 0;
+	int i;
+
+	for (i = 0; i < priv->gpio_chip.ngpio; i++) {
+		if (priv->clients[i].requested) {
+			if (priv->share_mode == GPIO_SHARED_AND)
+				value &= priv->clients[i].value;
+			else
+				value |= priv->clients[i].value;
+		}
+	}
+
+	return value;
+}
+
+static int gpio_shared_gpio_request(struct gpio_chip *chip, unsigned int offset)
+{
+	struct gpio_shared_priv *priv = gpiochip_get_data(chip);
+	int ret = 0;
+
+	if (priv->clients[offset].requested) {
+		ret = -EBUSY;
+		goto out;
+	}
+
+	mutex_lock(&priv->mutex);
+	priv->clients[offset].requested = 1;
+	priv->clients[offset].value = priv->root_value;
+
+out:
+	mutex_unlock(&priv->mutex);
+	return ret;
+}
+
+static void gpio_shared_gpio_free(struct gpio_chip *chip, unsigned int offset)
+{
+	struct gpio_shared_priv *priv = gpiochip_get_data(chip);
+
+	priv->clients[offset].requested = 0;
+}
+
+static void gpio_shared_gpio_set(struct gpio_chip *chip, unsigned int offset,
+				 int value)
+{
+	struct gpio_shared_priv *priv = gpiochip_get_data(chip);
+	int root_value;
+
+	mutex_lock(&priv->mutex);
+	priv->clients[offset].value = value;
+
+	root_value = gpio_shared_aggregate_root_value(priv);
+	if (priv->root_value != root_value) {
+		priv->root_set(priv->root_gpio, root_value);
+
+		/* Update the root's and client's value for the change */
+		priv->root_value = root_value;
+	}
+	mutex_unlock(&priv->mutex);
+}
+
+static int gpio_shared_gpio_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct gpio_shared_priv *priv = gpiochip_get_data(chip);
+	int value;
+
+	mutex_lock(&priv->mutex);
+	value = priv->clients[offset].value;
+	mutex_unlock(&priv->mutex);
+
+	return value;
+}
+
+static int gpio_shared_gpio_direction_out(struct gpio_chip *chip,
+					  unsigned int offset, int value)
+{
+	gpio_shared_gpio_set(chip, offset, value);
+
+	return 0;
+}
+
+static const struct gpio_chip gpio_shared_template_chip = {
+	.owner			= THIS_MODULE,
+	.request		= gpio_shared_gpio_request,
+	.free			= gpio_shared_gpio_free,
+	.set			= gpio_shared_gpio_set,
+	.get			= gpio_shared_gpio_get,
+	.direction_output	= gpio_shared_gpio_direction_out,
+	.base			= -1,
+};
+
+static const struct of_device_id gpio_shared_of_match[] = {
+	{ .compatible = "gpio-shared", },
+	{},
+};
+MODULE_DEVICE_TABLE(of, gpio_shared_of_match);
+
+static int gpio_shared_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct gpio_shared_priv *priv;
+	u32 val;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->dev = dev;
+
+	priv->gpio_chip = gpio_shared_template_chip;
+	priv->gpio_chip.label = dev_name(dev);
+	priv->gpio_chip.parent = dev;
+	priv->gpio_chip.of_node = dev->of_node;
+
+	ret = of_property_read_u32(dev->of_node, "branch-count", &val);
+	if (ret) {
+		dev_err(dev, "branch-count is not provided\n");
+		return ret;
+	}
+
+	priv->gpio_chip.ngpio = val;
+
+	priv->clients = devm_kcalloc(dev, priv->gpio_chip.ngpio,
+				     sizeof(*priv->clients), GFP_KERNEL);
+	if (!priv->clients)
+		return -ENOMEM;
+
+	priv->root_gpio = devm_gpiod_get(dev, "root", GPIOD_ASIS);
+	if (IS_ERR(priv->root_gpio)) {
+		ret = PTR_ERR(priv->root_gpio);
+		if (ret != -EPROBE_DEFER)
+			dev_err(&pdev->dev, "Failed to get root GPIO\n");
+
+		return ret;
+	}
+
+	/* If the root GPIO is input, change it to output */
+	if (gpiod_get_direction(priv->root_gpio))
+		gpiod_direction_output(priv->root_gpio, 0);
+
+	priv->gpio_chip.can_sleep = gpiod_cansleep(priv->root_gpio);
+	if (priv->gpio_chip.can_sleep) {
+		priv->root_get = gpiod_get_value_cansleep;
+		priv->root_set = gpiod_set_value_cansleep;
+	} else {
+		priv->root_get = gpiod_get_value;
+		priv->root_set = gpiod_set_value;
+	}
+
+	priv->root_value = priv->root_get(priv->root_gpio);
+
+	ret = of_property_read_u32(dev->of_node, "hold-active-state", &val);
+	if (ret)
+		val = GPIO_ACTIVE_LOW;
+
+	if (val == GPIO_ACTIVE_HIGH)
+		priv->share_mode = GPIO_SHARED_OR;
+
+	dev_set_drvdata(dev, priv);
+	mutex_init(&priv->mutex);
+
+	return devm_gpiochip_add_data(dev, &priv->gpio_chip, priv);
+}
+
+static int gpio_shared_remove(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static struct platform_driver gpio_shared_driver = {
+	.driver = {
+		.name	= "gpio-shared",
+		.of_match_table = gpio_shared_of_match,
+	},
+	.probe		= gpio_shared_probe,
+	.remove		= gpio_shared_remove,
+};
+
+module_platform_driver(gpio_shared_driver);
+
+MODULE_ALIAS("platform:gpio-shared");
+MODULE_DESCRIPTION("Generic shared GPIO driver");
+MODULE_AUTHOR("Peter Ujfalusi <peter.ujfalusi@ti.com>");
+MODULE_LICENSE("GPL v2");
-- 
Peter

Texas Instruments Finland Oy, Porkkalankatu 22, 00180 Helsinki.
Y-tunnus/Business ID: 0615521-4. Kotipaikka/Domicile: Helsinki

