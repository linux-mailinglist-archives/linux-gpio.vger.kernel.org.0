Return-Path: <linux-gpio+bounces-13771-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C82309ED192
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 17:28:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7593E288240
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Dec 2024 16:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 977541DDC20;
	Wed, 11 Dec 2024 16:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="CxrVOLWN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D531DC1B7;
	Wed, 11 Dec 2024 16:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733934482; cv=none; b=BZGXSihIafeXT2Kj0eZij0jwFZjT4W+SqEm27+GWKo86msoGL+FlG7/Kvhi+r7nJCqcX9JuETSp5VoT9D1uFmltWzwqVsCiN5e/uoLsGgDjfi3fQ8S5BIiZwzq76j8NO6oaw0i/PMgmTvKYwiy98chHKJXc8irsQb+FhpxDhLFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733934482; c=relaxed/simple;
	bh=3xjs8JM7xrDB+RKKUbbFq8j8Qmh7RhryeG6sEN7HOSA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FsMq3AO5rBMyTZQyjx6lZfXv639Rbbd2R2JxCPpKmEiCcXPc/dV8hVhf8BdLWHkz5CM6irk9D9FEriWuxr+8T0/mt6NYXgKTuwLTYoSi0zHJILBxdJS/tXlCrI48mLXZU4LU/vu46kolDM4bIL7WoG9mmYYI3QMP3YSy6Jem3fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=CxrVOLWN; arc=none smtp.client-ip=217.70.183.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 09C8524000B;
	Wed, 11 Dec 2024 16:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733934471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jguxTuNFEAQpHZgdLoSpGo9WKxXnlJWcDc+RcR89HLU=;
	b=CxrVOLWNdlt8jr+l2CygRN2AbnXE05MUbMC/HHRu/Lx6GhLIu3DjU1KpICBekqt0P1Yu4N
	8Avei474A4zyjLA1TVnIwKbuDfj3QDoK1RjdFVJE5Mn7sOBTjxiAHZ0kJUFeRtIdlpuwPv
	a5tj/lWcsEa2+x5M3VywMGIzpLrQN/ijiZuwXtko3XQBHUz5zTWULxfAgUAqqE3dj7xfNA
	Td9Ur8b9pbq7Ud0vNPajP+/yptutq4qqod56vhEikX7jCVsgPL+6DkH8xpXYSodBYzXiZV
	ZTiQnJE7tXgSYgpZbVOVD2XBCki8WSuI68EtqP5Tv2OtJlO2xoqOqWAeiNLD7Q==
From: Thomas Richard <thomas.richard@bootlin.com>
Date: Wed, 11 Dec 2024 17:27:16 +0100
Subject: [PATCH 1/5] mfd: Add support for AAEON UP board FPGA
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-aaeon-up-board-pinctrl-support-v1-1-24719be27631@bootlin.com>
References: <20241211-aaeon-up-board-pinctrl-support-v1-0-24719be27631@bootlin.com>
In-Reply-To: <20241211-aaeon-up-board-pinctrl-support-v1-0-24719be27631@bootlin.com>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@ucw.cz>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-leds@vger.kernel.org, thomas.petazzoni@bootlin.com, 
 DanieleCleri@aaeon.eu, GaryWang@aaeon.com.tw, 
 Thomas Richard <thomas.richard@bootlin.com>
X-Mailer: b4 0.14.1
X-GND-Sasl: thomas.richard@bootlin.com

The UP boards implement some features (pin controller, LEDs) through an
on-board FPGA.

This MFD driver implements the line protocol to communicate with the FPGA
through regmap, and registers pin controller and led cells.

This commit adds support for UP and UP Squared boards.

Based on the work done by Gary Wang <garywang@aaeon.com.tw>.

Signed-off-by: Thomas Richard <thomas.richard@bootlin.com>
---
 drivers/mfd/Kconfig              |  12 ++
 drivers/mfd/Makefile             |   2 +
 drivers/mfd/upboard-fpga.c       | 325 +++++++++++++++++++++++++++++++++++++++
 include/linux/mfd/upboard-fpga.h |  55 +++++++
 4 files changed, 394 insertions(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index ae23b317a64e..3fc8ddac68bf 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -2414,5 +2414,17 @@ config MFD_RSMU_SPI
 	  Additional drivers must be enabled in order to use the functionality
 	  of the device.
 
+config MFD_UPBOARD_FPGA
+	tristate "Support for the AAeon UP board FPGA"
+	depends on (X86 && ACPI)
+	select MFD_CORE
+	help
+	  Select this option to enable the AAEON UP and UP^2 onboard FPGA.
+	  This is the core driver of this FPGA, which has a pin controller and a
+	  LED controller.
+
+	  To compile this driver as a module, choose M here: the module will be
+	  called upboard-fpga.
+
 endmenu
 endif
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index e057d6d6faef..6ce5bbdf078f 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -290,3 +290,5 @@ obj-$(CONFIG_MFD_ATC260X_I2C)	+= atc260x-i2c.o
 
 obj-$(CONFIG_MFD_RSMU_I2C)	+= rsmu_i2c.o rsmu_core.o
 obj-$(CONFIG_MFD_RSMU_SPI)	+= rsmu_spi.o rsmu_core.o
+
+obj-$(CONFIG_MFD_UPBOARD_FPGA)	+= upboard-fpga.o
diff --git a/drivers/mfd/upboard-fpga.c b/drivers/mfd/upboard-fpga.c
new file mode 100644
index 000000000000..5a330e2f2229
--- /dev/null
+++ b/drivers/mfd/upboard-fpga.c
@@ -0,0 +1,325 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * UP Board FPGA driver.
+ *
+ * FPGA provides more GPIO driving power, LEDS and pin mux function.
+ *
+ * Copyright (c) AAEON. All rights reserved.
+ * Copyright (C) 2024 Bootlin
+ *
+ * Author: Gary Wang <garywang@aaeon.com.tw>
+ * Author: Thomas Richard <thomas.richard@bootlin.com>
+ */
+
+#include <linux/acpi.h>
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/upboard-fpga.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/sysfs.h>
+
+#define UPBOARD_AAEON_MANUFACTURER_ID	0x01
+#define UPBOARD_MANUFACTURER_ID_MASK	GENMASK(7, 0)
+
+#define UPBOARD_ADDRESS_SIZE  7
+#define UPBOARD_REGISTER_SIZE 16
+
+#define UPBOARD_READ_FLAG     BIT(UPBOARD_ADDRESS_SIZE)
+
+#define UPBOARD_FW_ID_MAJOR_SUPPORTED	0x0
+
+#define UPBOARD_FW_ID_BUILD_MASK	GENMASK(15, 12)
+#define UPBOARD_FW_ID_MAJOR_MASK	GENMASK(11, 8)
+#define UPBOARD_FW_ID_MINOR_MASK	GENMASK(7, 4)
+#define UPBOARD_FW_ID_PATCH_MASK	GENMASK(3, 0)
+
+static int upboard_fpga_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct upboard_fpga *fpga = context;
+	int i;
+
+	/* Clear to start new transaction */
+	gpiod_set_value(fpga->clear_gpio, 0);
+	gpiod_set_value(fpga->clear_gpio, 1);
+
+	reg |= UPBOARD_READ_FLAG;
+
+	/* Send clock and addr from strobe & datain pins */
+	for (i = UPBOARD_ADDRESS_SIZE; i >= 0; i--) {
+		gpiod_set_value(fpga->strobe_gpio, 0);
+		gpiod_set_value(fpga->datain_gpio, !!(reg & BIT(i)));
+		gpiod_set_value(fpga->strobe_gpio, 1);
+	}
+
+	gpiod_set_value(fpga->strobe_gpio, 0);
+	*val = 0;
+
+	/* Read data from dataout pin */
+	for (i = UPBOARD_REGISTER_SIZE - 1; i >= 0; i--) {
+		gpiod_set_value(fpga->strobe_gpio, 1);
+		gpiod_set_value(fpga->strobe_gpio, 0);
+		*val |= gpiod_get_value(fpga->dataout_gpio) << i;
+	}
+
+	gpiod_set_value(fpga->strobe_gpio, 1);
+
+	return 0;
+}
+
+static int upboard_fpga_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct upboard_fpga *fpga = context;
+	int i;
+
+	/* Clear to start new transcation */
+	gpiod_set_value(fpga->clear_gpio, 0);
+	gpiod_set_value(fpga->clear_gpio, 1);
+
+	/* Send clock and addr from strobe & datain pins */
+	for (i = UPBOARD_ADDRESS_SIZE; i >= 0; i--) {
+		gpiod_set_value(fpga->strobe_gpio, 0);
+		gpiod_set_value(fpga->datain_gpio, !!(reg & BIT(i)));
+		gpiod_set_value(fpga->strobe_gpio, 1);
+	}
+
+	gpiod_set_value(fpga->strobe_gpio, 0);
+
+	/* Write data to datain pin */
+	for (i = UPBOARD_REGISTER_SIZE - 1; i >= 0; i--) {
+		gpiod_set_value(fpga->datain_gpio, !!(val & BIT(i)));
+		gpiod_set_value(fpga->strobe_gpio, 1);
+		gpiod_set_value(fpga->strobe_gpio, 0);
+	}
+
+	gpiod_set_value(fpga->strobe_gpio, 1);
+
+	return 0;
+}
+
+static const struct regmap_range upboard_up_readable_ranges[] = {
+	regmap_reg_range(UPBOARD_REG_PLATFORM_ID, UPBOARD_REG_FIRMWARE_ID),
+	regmap_reg_range(UPBOARD_REG_FUNC_EN0, UPBOARD_REG_FUNC_EN0),
+	regmap_reg_range(UPBOARD_REG_GPIO_EN0, UPBOARD_REG_GPIO_EN1),
+	regmap_reg_range(UPBOARD_REG_GPIO_DIR0, UPBOARD_REG_GPIO_DIR1),
+};
+
+static const struct regmap_range upboard_up_writable_ranges[] = {
+	regmap_reg_range(UPBOARD_REG_FUNC_EN0, UPBOARD_REG_FUNC_EN0),
+	regmap_reg_range(UPBOARD_REG_GPIO_EN0, UPBOARD_REG_GPIO_EN1),
+	regmap_reg_range(UPBOARD_REG_GPIO_DIR0, UPBOARD_REG_GPIO_DIR1),
+};
+
+static const struct regmap_access_table upboard_up_readable_table = {
+	.yes_ranges = upboard_up_readable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(upboard_up_readable_ranges),
+};
+
+static const struct regmap_access_table upboard_up_writable_table = {
+	.yes_ranges = upboard_up_writable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(upboard_up_writable_ranges),
+};
+
+static const struct regmap_config upboard_up_regmap_config = {
+	.reg_bits = UPBOARD_ADDRESS_SIZE,
+	.val_bits = UPBOARD_REGISTER_SIZE,
+	.max_register = UPBOARD_REG_MAX,
+	.reg_read = upboard_fpga_read,
+	.reg_write = upboard_fpga_write,
+	.fast_io = false,
+	.cache_type = REGCACHE_NONE,
+	.rd_table = &upboard_up_readable_table,
+	.wr_table = &upboard_up_writable_table,
+};
+
+static const struct regmap_range upboard_up2_readable_ranges[] = {
+	regmap_reg_range(UPBOARD_REG_PLATFORM_ID, UPBOARD_REG_FIRMWARE_ID),
+	regmap_reg_range(UPBOARD_REG_FUNC_EN0, UPBOARD_REG_FUNC_EN1),
+	regmap_reg_range(UPBOARD_REG_GPIO_EN0, UPBOARD_REG_GPIO_EN2),
+	regmap_reg_range(UPBOARD_REG_GPIO_DIR0, UPBOARD_REG_GPIO_DIR2),
+};
+
+static const struct regmap_range upboard_up2_writable_ranges[] = {
+	regmap_reg_range(UPBOARD_REG_FUNC_EN0, UPBOARD_REG_FUNC_EN1),
+	regmap_reg_range(UPBOARD_REG_GPIO_EN0, UPBOARD_REG_GPIO_EN2),
+	regmap_reg_range(UPBOARD_REG_GPIO_DIR0, UPBOARD_REG_GPIO_DIR2),
+};
+
+static const struct regmap_access_table upboard_up2_readable_table = {
+	.yes_ranges = upboard_up2_readable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(upboard_up2_readable_ranges),
+};
+
+static const struct regmap_access_table upboard_up2_writable_table = {
+	.yes_ranges = upboard_up2_writable_ranges,
+	.n_yes_ranges = ARRAY_SIZE(upboard_up2_writable_ranges),
+};
+
+static const struct regmap_config upboard_up2_regmap_config = {
+	.reg_bits = UPBOARD_ADDRESS_SIZE,
+	.val_bits = UPBOARD_REGISTER_SIZE,
+	.max_register = UPBOARD_REG_MAX,
+	.reg_read = upboard_fpga_read,
+	.reg_write = upboard_fpga_write,
+	.fast_io = false,
+	.cache_type = REGCACHE_NONE,
+	.rd_table = &upboard_up2_readable_table,
+	.wr_table = &upboard_up2_writable_table,
+};
+
+static const struct mfd_cell upboard_up_mfd_cells[] = {
+	{ .name = "upboard-pinctrl" },
+	{ .name = "upboard-leds" },
+};
+
+static const struct upboard_fpga_data upboard_up_fpga_data = {
+	.type = UPBOARD_UP_FPGA,
+	.regmap_config = &upboard_up_regmap_config,
+};
+
+static const struct upboard_fpga_data upboard_up2_fpga_data = {
+	.type = UPBOARD_UP2_FPGA,
+	.regmap_config = &upboard_up2_regmap_config,
+};
+
+static int upboard_fpga_gpio_init(struct upboard_fpga *fpga)
+{
+	fpga->enable_gpio = devm_gpiod_get(fpga->dev, "enable", GPIOD_ASIS);
+	if (IS_ERR(fpga->enable_gpio))
+		return PTR_ERR(fpga->enable_gpio);
+
+	fpga->clear_gpio = devm_gpiod_get(fpga->dev, "clear", GPIOD_OUT_LOW);
+	if (IS_ERR(fpga->clear_gpio))
+		return PTR_ERR(fpga->clear_gpio);
+
+	fpga->strobe_gpio = devm_gpiod_get(fpga->dev, "strobe", GPIOD_OUT_LOW);
+	if (IS_ERR(fpga->strobe_gpio))
+		return PTR_ERR(fpga->strobe_gpio);
+
+	fpga->datain_gpio = devm_gpiod_get(fpga->dev, "datain", GPIOD_OUT_LOW);
+	if (IS_ERR(fpga->datain_gpio))
+		return PTR_ERR(fpga->datain_gpio);
+
+	fpga->dataout_gpio = devm_gpiod_get(fpga->dev, "dataout", GPIOD_IN);
+	if (IS_ERR(fpga->dataout_gpio))
+		return PTR_ERR(fpga->dataout_gpio);
+
+	gpiod_set_value(fpga->enable_gpio, 1);
+
+	return 0;
+}
+
+static int upboard_fpga_get_firmware_version(struct upboard_fpga *fpga)
+{
+	unsigned int platform_id, manufacturer_id;
+	int ret;
+
+	if (!fpga)
+		return -ENOMEM;
+
+	ret = regmap_read(fpga->regmap, UPBOARD_REG_PLATFORM_ID, &platform_id);
+	if (ret)
+		return ret;
+
+	manufacturer_id = platform_id & UPBOARD_MANUFACTURER_ID_MASK;
+	if (manufacturer_id != UPBOARD_AAEON_MANUFACTURER_ID)
+		return dev_err_probe(fpga->dev, -ENODEV,
+				     "driver not compatible with custom FPGA FW from manufacturer id %#02x.",
+				     manufacturer_id);
+
+	ret = regmap_read(fpga->regmap, UPBOARD_REG_FIRMWARE_ID, &fpga->firmware_version);
+	if (ret)
+		return ret;
+
+	if (FIELD_GET(UPBOARD_FW_ID_MAJOR_MASK, fpga->firmware_version) !=
+	    UPBOARD_FW_ID_MAJOR_SUPPORTED)
+		return dev_err_probe(fpga->dev, -ENODEV,
+				     "unsupported FPGA FW v%lu.%lu.%lu build %#02lx",
+				     FIELD_GET(UPBOARD_FW_ID_MAJOR_MASK, fpga->firmware_version),
+				     FIELD_GET(UPBOARD_FW_ID_MINOR_MASK, fpga->firmware_version),
+				     FIELD_GET(UPBOARD_FW_ID_PATCH_MASK, fpga->firmware_version),
+				     FIELD_GET(UPBOARD_FW_ID_BUILD_MASK, fpga->firmware_version));
+	return 0;
+}
+
+static ssize_t upboard_fpga_version_show(struct device *dev, struct device_attribute *attr,
+					 char *buf)
+{
+	struct upboard_fpga *fpga = dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "FPGA FW v%lu.%lu.%lu build %#02lx\n",
+			  FIELD_GET(UPBOARD_FW_ID_MAJOR_MASK, fpga->firmware_version),
+			  FIELD_GET(UPBOARD_FW_ID_MINOR_MASK, fpga->firmware_version),
+			  FIELD_GET(UPBOARD_FW_ID_PATCH_MASK, fpga->firmware_version),
+			  FIELD_GET(UPBOARD_FW_ID_BUILD_MASK, fpga->firmware_version));
+}
+
+static DEVICE_ATTR_RO(upboard_fpga_version);
+
+static struct attribute *upboard_fpga_attrs[] = {
+	&dev_attr_upboard_fpga_version.attr,
+	NULL
+};
+
+ATTRIBUTE_GROUPS(upboard_fpga);
+
+static int upboard_fpga_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct upboard_fpga *fpga;
+	int ret;
+
+	fpga = devm_kzalloc(dev, sizeof(*fpga), GFP_KERNEL);
+	if (!fpga)
+		return -ENOMEM;
+
+	fpga->fpga_data = device_get_match_data(dev);
+
+	fpga->dev = dev;
+
+	platform_set_drvdata(pdev, fpga);
+
+	fpga->regmap = devm_regmap_init(dev, NULL, fpga, fpga->fpga_data->regmap_config);
+	if (IS_ERR(fpga->regmap))
+		return PTR_ERR(fpga->regmap);
+
+	ret = upboard_fpga_gpio_init(fpga);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to initialize FPGA common GPIOs");
+
+	ret = upboard_fpga_get_firmware_version(fpga);
+	if (ret)
+		return ret;
+
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE, upboard_up_mfd_cells,
+				    ARRAY_SIZE(upboard_up_mfd_cells), NULL, 0, NULL);
+}
+
+static const struct acpi_device_id upboard_fpga_acpi_match[] = {
+	{ "AANT0F01", (kernel_ulong_t)&upboard_up2_fpga_data },
+	{ "AANT0F04", (kernel_ulong_t)&upboard_up_fpga_data },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, upboard_fpga_acpi_match);
+
+static struct platform_driver upboard_fpga_driver = {
+	.driver = {
+		.name = "upboard-fpga",
+		.acpi_match_table = ACPI_PTR(upboard_fpga_acpi_match),
+		.dev_groups	= upboard_fpga_groups,
+	},
+	.probe = upboard_fpga_probe,
+};
+
+module_platform_driver(upboard_fpga_driver);
+
+MODULE_AUTHOR("Gary Wang <garywang@aaeon.com.tw>");
+MODULE_AUTHOR("Thomas Richard <thomas.richard@bootlin.com>");
+MODULE_DESCRIPTION("UP Board FPGA driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/mfd/upboard-fpga.h b/include/linux/mfd/upboard-fpga.h
new file mode 100644
index 000000000000..12231e40f5da
--- /dev/null
+++ b/include/linux/mfd/upboard-fpga.h
@@ -0,0 +1,55 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * UP Board CPLD/FPGA driver
+ *
+ * Copyright (c) AAEON. All rights reserved.
+ * Copyright (C) 2024 Bootlin
+ *
+ * Author: Gary Wang <garywang@aaeon.com.tw>
+ * Author: Thomas Richard <thomas.richard@bootlin.com>
+ *
+ */
+
+#ifndef __LINUX_MFD_UPBOARD_FPGA_H
+#define __LINUX_MFD_UPBOARD_FPGA_H
+
+#define UPBOARD_REGISTER_SIZE 16
+
+enum upboard_fpgareg {
+	UPBOARD_REG_PLATFORM_ID   = 0x10,
+	UPBOARD_REG_FIRMWARE_ID   = 0x11,
+	UPBOARD_REG_FUNC_EN0      = 0x20,
+	UPBOARD_REG_FUNC_EN1      = 0x21,
+	UPBOARD_REG_GPIO_EN0      = 0x30,
+	UPBOARD_REG_GPIO_EN1      = 0x31,
+	UPBOARD_REG_GPIO_EN2      = 0x32,
+	UPBOARD_REG_GPIO_DIR0     = 0x40,
+	UPBOARD_REG_GPIO_DIR1     = 0x41,
+	UPBOARD_REG_GPIO_DIR2     = 0x42,
+	UPBOARD_REG_MAX,
+};
+
+enum upboard_fpga_type {
+	UPBOARD_UP_FPGA,
+	UPBOARD_UP2_FPGA,
+};
+
+struct upboard_fpga_data {
+	enum upboard_fpga_type type;
+	const struct regmap_config *regmap_config;
+};
+
+struct upboard_fpga {
+	struct device *dev;
+	struct regmap *regmap;
+	struct gpio_desc *enable_gpio;
+	struct gpio_desc *reset_gpio;
+	struct gpio_desc *clear_gpio;
+	struct gpio_desc *strobe_gpio;
+	struct gpio_desc *datain_gpio;
+	struct gpio_desc *dataout_gpio;
+	unsigned int firmware_version;
+	const struct upboard_fpga_data *fpga_data;
+};
+
+#endif /*  __LINUX_MFD_UPBOARD_FPGA_H */

-- 
2.39.5


