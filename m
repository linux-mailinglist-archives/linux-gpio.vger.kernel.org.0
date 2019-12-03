Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D74B10FFAF
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Dec 2019 15:13:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbfLCONQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Dec 2019 09:13:16 -0500
Received: from relay3-d.mail.gandi.net ([217.70.183.195]:46935 "EHLO
        relay3-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726534AbfLCONP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Dec 2019 09:13:15 -0500
X-Originating-IP: 90.76.211.102
Received: from localhost.localdomain (lfbn-1-2154-102.w90-76.abo.wanadoo.fr [90.76.211.102])
        (Authenticated sender: paul.kocialkowski@bootlin.com)
        by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 9B6FC60014;
        Tue,  3 Dec 2019 14:13:12 +0000 (UTC)
From:   Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To:     linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lee Jones <lee.jones@linaro.org>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: [PATCH v5 4/4] gpio: Add support for the Xylon LogiCVC GPIOs
Date:   Tue,  3 Dec 2019 15:12:43 +0100
Message-Id: <20191203141243.251058-5-paul.kocialkowski@bootlin.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191203141243.251058-1-paul.kocialkowski@bootlin.com>
References: <20191203141243.251058-1-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The LogiCVC display hardware block comes with GPIO capabilities
that must be exposed separately from the main driver (as GPIOs) for
use with regulators and panels. A syscon is used to share the same
regmap across the two drivers.

Add a minimalistic GPIO driver to drive these GPIOs, using a syscon
regmap when available.

Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
---
 drivers/gpio/Kconfig        |   6 ++
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-logicvc.c | 170 ++++++++++++++++++++++++++++++++++++
 3 files changed, 177 insertions(+)
 create mode 100644 drivers/gpio/gpio-logicvc.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index e9516393c971..3b0a8cfc5f17 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -312,6 +312,12 @@ config GPIO_IXP4XX
 	  IXP4xx series of chips.
 
 	  If unsure, say N.
+config GPIO_LOGICVC
+	tristate "Xylon LogiCVC GPIO support"
+	depends on MFD_SYSCON && OF
+	help
+	  Say yes here to support GPIO functionality of the Xylon LogiCVC
+	  programmable logic block.
 
 config GPIO_LOONGSON
 	bool "Loongson-2/3 GPIO support"
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 34eb8b2b12dd..ba53f1fcde3a 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -69,6 +69,7 @@ obj-$(CONFIG_GPIO_IT87)			+= gpio-it87.o
 obj-$(CONFIG_GPIO_IXP4XX)		+= gpio-ixp4xx.o
 obj-$(CONFIG_GPIO_JANZ_TTL)		+= gpio-janz-ttl.o
 obj-$(CONFIG_GPIO_KEMPLD)		+= gpio-kempld.o
+obj-$(CONFIG_GPIO_LOGICVC)		+= gpio-logicvc.o
 obj-$(CONFIG_GPIO_LOONGSON1)		+= gpio-loongson1.o
 obj-$(CONFIG_GPIO_LOONGSON)		+= gpio-loongson.o
 obj-$(CONFIG_GPIO_LP3943)		+= gpio-lp3943.o
diff --git a/drivers/gpio/gpio-logicvc.c b/drivers/gpio/gpio-logicvc.c
new file mode 100644
index 000000000000..015632cf159f
--- /dev/null
+++ b/drivers/gpio/gpio-logicvc.c
@@ -0,0 +1,170 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2019 Bootlin
+ * Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
+ */
+
+#include <linux/err.h>
+#include <linux/gpio/driver.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_device.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/mfd/syscon.h>
+
+#define LOGICVC_CTRL_REG		0x40
+#define LOGICVC_CTRL_GPIO_SHIFT		11
+#define LOGICVC_CTRL_GPIO_BITS		5
+
+#define LOGICVC_POWER_CTRL_REG		0x78
+#define LOGICVC_POWER_CTRL_GPIO_SHIFT	0
+#define LOGICVC_POWER_CTRL_GPIO_BITS	4
+
+struct logicvc_gpio {
+	struct gpio_chip chip;
+	struct regmap *regmap;
+};
+
+static void logicvc_gpio_offset(struct logicvc_gpio *logicvc, unsigned offset,
+				unsigned int *reg, unsigned int *bit)
+{
+	if (offset >= LOGICVC_CTRL_GPIO_BITS) {
+		*reg = LOGICVC_POWER_CTRL_REG;
+
+		/* To the (virtual) power ctrl offset. */
+		offset -= LOGICVC_CTRL_GPIO_BITS;
+		/* To the actual bit offset in reg. */
+		offset += LOGICVC_POWER_CTRL_GPIO_SHIFT;
+	} else {
+		*reg = LOGICVC_CTRL_REG;
+
+		/* To the actual bit offset in reg. */
+		offset += LOGICVC_CTRL_GPIO_SHIFT;
+	}
+
+	*bit = BIT(offset);
+}
+
+static int logicvc_gpio_get(struct gpio_chip *chip, unsigned offset)
+{
+	struct logicvc_gpio *logicvc = gpiochip_get_data(chip);
+	unsigned int reg, bit, value;
+	int ret;
+
+	logicvc_gpio_offset(logicvc, offset, &reg, &bit);
+
+	ret = regmap_read(logicvc->regmap, reg, &value);
+	if (ret)
+		return ret;
+
+	return !!(value & bit);
+}
+
+static void logicvc_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+{
+	struct logicvc_gpio *logicvc = gpiochip_get_data(chip);
+	unsigned int reg, bit;
+
+	logicvc_gpio_offset(logicvc, offset, &reg, &bit);
+
+	regmap_update_bits(logicvc->regmap, reg, bit, value ? bit : 0);
+}
+
+static int logicvc_gpio_direction_output(struct gpio_chip *chip,
+					 unsigned offset, int value)
+{
+	/* Pins are always configured as output, so just set the value. */
+	logicvc_gpio_set(chip, offset, value);
+
+	return 0;
+}
+
+static struct regmap_config logicvc_gpio_regmap_config = {
+	.reg_bits	= 32,
+	.val_bits	= 32,
+	.reg_stride	= 4,
+	.name		= "logicvc-gpio",
+};
+
+static int logicvc_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *of_node = dev->of_node;
+	struct logicvc_gpio *logicvc;
+	int ret;
+
+	logicvc = devm_kzalloc(dev, sizeof(*logicvc), GFP_KERNEL);
+	if (!logicvc)
+		return -ENOMEM;
+
+	/* Try to get regmap from parent first. */
+	logicvc->regmap = syscon_node_to_regmap(of_node->parent);
+
+	/* Grab our own regmap if that fails. */
+	if (IS_ERR(logicvc->regmap)) {
+		struct resource res;
+		void __iomem *base;
+
+		ret = of_address_to_resource(of_node, 0, &res);
+		if (ret) {
+			dev_err(dev, "Failed to get resource from address\n");
+			return ret;
+		}
+
+		base = devm_ioremap_resource(dev, &res);
+		if (IS_ERR(base)) {
+			dev_err(dev, "Failed to map I/O base\n");
+			return PTR_ERR(base);
+		}
+
+		logicvc_gpio_regmap_config.max_register = resource_size(&res) -
+			logicvc_gpio_regmap_config.reg_stride;
+
+		logicvc->regmap =
+			devm_regmap_init_mmio(dev, base,
+					      &logicvc_gpio_regmap_config);
+		if (IS_ERR(logicvc->regmap)) {
+			dev_err(dev, "Failed to create regmap for I/O\n");
+			return PTR_ERR(logicvc->regmap);
+		}
+	}
+
+	logicvc->chip.parent = dev;
+	logicvc->chip.owner = THIS_MODULE;
+	logicvc->chip.label = dev_name(dev);
+	logicvc->chip.base = -1;
+	logicvc->chip.ngpio = LOGICVC_CTRL_GPIO_BITS +
+			      LOGICVC_POWER_CTRL_GPIO_BITS;
+	logicvc->chip.get = logicvc_gpio_get;
+	logicvc->chip.set = logicvc_gpio_set;
+	logicvc->chip.direction_output = logicvc_gpio_direction_output;
+
+	platform_set_drvdata(pdev, logicvc);
+
+	return devm_gpiochip_add_data(dev, &logicvc->chip, logicvc);
+}
+
+static const struct of_device_id logicivc_gpio_of_table[] = {
+	{
+		.compatible	= "xylon,logicvc-3.02.a-gpio",
+	},
+	{ }
+};
+
+MODULE_DEVICE_TABLE(of, logicivc_gpio_of_table);
+
+static struct platform_driver logicvc_gpio_driver = {
+	.driver	= {
+		.name		= "gpio-logicvc",
+		.of_match_table	= logicivc_gpio_of_table,
+	},
+	.probe	= logicvc_gpio_probe,
+};
+
+module_platform_driver(logicvc_gpio_driver);
+
+MODULE_AUTHOR("Paul Kocialkowski <paul.kocialkowski@bootlin.com>");
+MODULE_DESCRIPTION("Xylon LogiCVC GPIO driver");
+MODULE_LICENSE("GPL");
-- 
2.24.0

