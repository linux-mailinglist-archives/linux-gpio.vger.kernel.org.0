Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ECCB1E125C
	for <lists+linux-gpio@lfdr.de>; Mon, 25 May 2020 18:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391179AbgEYQH6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 May 2020 12:07:58 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:42889 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391180AbgEYQH5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 May 2020 12:07:57 -0400
Received: from apollo.fritz.box (unknown [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id A153A2304C;
        Mon, 25 May 2020 18:07:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1590422874;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=GaxtrgiPeDgci4sO61fuSgvtyiVcDmUdje2mw0v1ANo=;
        b=hkYZ7C9hTgdcmRJe3XltAn34ZKKyKhdX4gZC44/6p8kFqXBVOe3ZUEwERM5jUiehxPms+T
        RxEXF2mqHdkJX9t3tjZfAMSudSWaz4VTJ770QiRtSrIiKjovaqPjnAvSLLvOheTo09fRbJ
        soViCCxyrPn3nOLfbx+phBR/w1FLwt0=
From:   Michael Walle <michael@walle.cc>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@intel.com>,
        Michael Walle <michael@walle.cc>
Subject: [PATCH v4 2/2] gpio: add a reusable generic gpio_chip using regmap
Date:   Mon, 25 May 2020 18:07:41 +0200
Message-Id: <20200525160741.21729-3-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200525160741.21729-1-michael@walle.cc>
References: <20200525160741.21729-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There are quite a lot simple GPIO controller which are using regmap to
access the hardware. This driver tries to be a base to unify existing
code into one place. This won't cover everything but it should be a good
starting point.

It does not implement its own irq_chip because there is already a
generic one for regmap based devices. Instead, the irq_chip will be
instantiated in the parent driver and its irq domain will be associate
to this driver.

For now it consists of the usual registers, like set (and an optional
clear) data register, an input register and direction registers.
Out-of-the-box, it supports consecutive register mappings and mappings
where the registers have gaps between them with a linear mapping between
GPIO offset and bit position. For weirder mappings the user can register
its own .xlate().

Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/gpio/Kconfig        |   4 +
 drivers/gpio/Makefile       |   1 +
 drivers/gpio/gpio-regmap.c  | 343 ++++++++++++++++++++++++++++++++++++
 include/linux/gpio-regmap.h |  69 ++++++++
 4 files changed, 417 insertions(+)
 create mode 100644 drivers/gpio/gpio-regmap.c
 create mode 100644 include/linux/gpio-regmap.h

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 03c01f4aa316..77b249fe1412 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -73,6 +73,10 @@ config GPIO_GENERIC
 	depends on HAS_IOMEM # Only for IOMEM drivers
 	tristate
 
+config GPIO_REGMAP
+	depends on REGMAP
+	tristate
+
 # put drivers in the right section, in alphabetical order
 
 # This symbol is selected by both I2C and SPI expanders
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 65bf3940e33c..1e4894e0bf0f 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_GPIO_SYSFS)	+= gpiolib-sysfs.o
 obj-$(CONFIG_GPIO_ACPI)		+= gpiolib-acpi.o
 
 # Device drivers. Generally keep list sorted alphabetically
+obj-$(CONFIG_GPIO_REGMAP)	+= gpio-regmap.o
 obj-$(CONFIG_GPIO_GENERIC)	+= gpio-generic.o
 
 # directly supported by gpio-generic
diff --git a/drivers/gpio/gpio-regmap.c b/drivers/gpio/gpio-regmap.c
new file mode 100644
index 000000000000..3cb0e8493835
--- /dev/null
+++ b/drivers/gpio/gpio-regmap.c
@@ -0,0 +1,343 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * regmap based generic GPIO driver
+ *
+ * Copyright 2019 Michael Walle <michael@walle.cc>
+ */
+
+#include <linux/gpio/driver.h>
+#include <linux/gpio-regmap.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+struct gpio_regmap {
+	struct device *parent;
+	struct regmap *regmap;
+	struct gpio_chip gpio_chip;
+
+	int reg_stride;
+	int ngpio_per_reg;
+	unsigned int reg_dat_base;
+	unsigned int reg_set_base;
+	unsigned int reg_clr_base;
+	unsigned int reg_dir_in_base;
+	unsigned int reg_dir_out_base;
+
+	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
+			      unsigned int offset, unsigned int *reg,
+			      unsigned int *mask);
+
+	void *driver_data;
+};
+
+static unsigned int gpio_regmap_addr(unsigned int addr)
+{
+	return (addr == GPIO_REGMAP_ADDR_ZERO) ? 0 : addr;
+}
+
+/**
+ * gpio_regmap_simple_xlate() - translate base/offset to reg/mask
+ *
+ * Use a simple linear mapping to translate the offset to the bitmask.
+ */
+static int gpio_regmap_simple_xlate(struct gpio_regmap *gpio,
+				    unsigned int base, unsigned int offset,
+				    unsigned int *reg, unsigned int *mask)
+{
+	unsigned int line = offset % gpio->ngpio_per_reg;
+	unsigned int stride = offset / gpio->ngpio_per_reg;
+
+	*reg = base + stride * gpio->reg_stride;
+	*mask = BIT(line);
+
+	return 0;
+}
+
+static int gpio_regmap_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct gpio_regmap *gpio = gpiochip_get_data(chip);
+	unsigned int base, val, reg, mask;
+	int ret;
+
+	/* we might not have an output register if we are input only */
+	if (gpio->reg_dat_base)
+		base = gpio_regmap_addr(gpio->reg_dat_base);
+	else
+		base = gpio_regmap_addr(gpio->reg_set_base);
+
+	ret = gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(gpio->regmap, reg, &val);
+	if (ret)
+		return ret;
+
+	return (val & mask) ? 1 : 0;
+}
+
+static void gpio_regmap_set(struct gpio_chip *chip, unsigned int offset,
+			    int val)
+{
+	struct gpio_regmap *gpio = gpiochip_get_data(chip);
+	unsigned int base = gpio_regmap_addr(gpio->reg_set_base);
+	unsigned int reg, mask;
+
+	gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
+	if (val)
+		regmap_update_bits(gpio->regmap, reg, mask, mask);
+	else
+		regmap_update_bits(gpio->regmap, reg, mask, 0);
+}
+
+static void gpio_regmap_set_with_clear(struct gpio_chip *chip,
+				       unsigned int offset, int val)
+{
+	struct gpio_regmap *gpio = gpiochip_get_data(chip);
+	unsigned int base, reg, mask;
+
+	if (val)
+		base = gpio_regmap_addr(gpio->reg_set_base);
+	else
+		base = gpio_regmap_addr(gpio->reg_clr_base);
+
+	gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
+	regmap_write(gpio->regmap, reg, mask);
+}
+
+static int gpio_regmap_get_direction(struct gpio_chip *chip,
+				     unsigned int offset)
+{
+	struct gpio_regmap *gpio = gpiochip_get_data(chip);
+	unsigned int base, val, reg, mask;
+	int invert, ret;
+
+	if (gpio->reg_dir_out_base) {
+		base = gpio_regmap_addr(gpio->reg_dir_out_base);
+		invert = 0;
+	} else if (gpio->reg_dir_in_base) {
+		base = gpio_regmap_addr(gpio->reg_dir_in_base);
+		invert = 1;
+	} else {
+		return GPIO_LINE_DIRECTION_IN;
+	}
+
+	ret = gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
+	if (ret)
+		return ret;
+
+	ret = regmap_read(gpio->regmap, reg, &val);
+	if (ret)
+		return ret;
+
+	if (!!(val & mask) ^ invert)
+		return GPIO_LINE_DIRECTION_OUT;
+	else
+		return GPIO_LINE_DIRECTION_IN;
+}
+
+static int gpio_regmap_set_direction(struct gpio_chip *chip,
+				     unsigned int offset, bool output)
+{
+	struct gpio_regmap *gpio = gpiochip_get_data(chip);
+	unsigned int base, val, reg, mask;
+	int invert, ret;
+
+	if (gpio->reg_dir_out_base) {
+		base = gpio_regmap_addr(gpio->reg_dir_out_base);
+		invert = 0;
+	} else if (gpio->reg_dir_in_base) {
+		base = gpio_regmap_addr(gpio->reg_dir_in_base);
+		invert = 1;
+	} else {
+		return 0;
+	}
+
+	ret = gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
+	if (ret)
+		return ret;
+
+	if (!invert)
+		val = (output) ? mask : 0;
+	else
+		val = (output) ? 0 : mask;
+
+	return regmap_update_bits(gpio->regmap, reg, mask, val);
+}
+
+static int gpio_regmap_direction_input(struct gpio_chip *chip,
+				       unsigned int offset)
+{
+	return gpio_regmap_set_direction(chip, offset, false);
+}
+
+static int gpio_regmap_direction_output(struct gpio_chip *chip,
+					unsigned int offset, int value)
+{
+	gpio_regmap_set(chip, offset, value);
+
+	return gpio_regmap_set_direction(chip, offset, true);
+}
+
+void gpio_regmap_set_drvdata(struct gpio_regmap *gpio, void *data)
+{
+	gpio->driver_data = data;
+}
+EXPORT_SYMBOL_GPL(gpio_regmap_set_drvdata);
+
+void *gpio_regmap_get_drvdata(struct gpio_regmap *gpio)
+{
+	return gpio->driver_data;
+}
+EXPORT_SYMBOL_GPL(gpio_regmap_get_drvdata);
+
+/**
+ * gpio_regmap_register() - Register a generic regmap GPIO controller
+ *
+ * @gpio: gpio_regmap device to register
+ *
+ * Returns 0 on success or an errno on failure.
+ */
+struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config)
+{
+	struct gpio_regmap *gpio;
+	struct gpio_chip *chip;
+	int ret;
+
+	if (!config->parent)
+		return ERR_PTR(-EINVAL);
+
+	if (!config->ngpio)
+		return ERR_PTR(-EINVAL);
+
+	/* we need at least one */
+	if (!config->reg_dat_base && !config->reg_set_base)
+		return ERR_PTR(-EINVAL);
+
+	/* we don't support having both registers simultaneously for now */
+	if (config->reg_dir_out_base && config->reg_dir_in_base)
+		return ERR_PTR(-EINVAL);
+
+	gpio = kzalloc(sizeof(*gpio), GFP_KERNEL);
+	if (!gpio)
+		return ERR_PTR(-ENOMEM);
+
+	gpio->parent = config->parent;
+	gpio->regmap = config->regmap;
+	gpio->ngpio_per_reg = config->ngpio_per_reg;
+	gpio->reg_stride = config->reg_stride;
+	gpio->reg_mask_xlate = config->reg_mask_xlate;
+	gpio->reg_dat_base = config->reg_dat_base;
+	gpio->reg_set_base = config->reg_set_base;
+	gpio->reg_clr_base = config->reg_clr_base;
+	gpio->reg_dir_in_base = config->reg_dir_in_base;
+	gpio->reg_dir_out_base = config->reg_dir_out_base;
+
+	/* if not set, assume there is only one register */
+	if (!gpio->ngpio_per_reg)
+		gpio->ngpio_per_reg = config->ngpio;
+
+	/* if not set, assume they are consecutive */
+	if (!gpio->reg_stride)
+		gpio->reg_stride = 1;
+
+	if (!gpio->reg_mask_xlate)
+		gpio->reg_mask_xlate = gpio_regmap_simple_xlate;
+
+	chip = &gpio->gpio_chip;
+	chip->parent = config->parent;
+	chip->base = -1;
+	chip->ngpio = config->ngpio;
+	chip->can_sleep = true;
+
+	if (!chip->label)
+		chip->label = dev_name(config->parent);
+	else
+		chip->label = config->label;
+
+	chip->get = gpio_regmap_get;
+	if (gpio->reg_set_base && gpio->reg_clr_base)
+		chip->set = gpio_regmap_set_with_clear;
+	else if (gpio->reg_set_base)
+		chip->set = gpio_regmap_set;
+
+	if (gpio->reg_dir_in_base || gpio->reg_dir_out_base) {
+		chip->get_direction = gpio_regmap_get_direction;
+		chip->direction_input = gpio_regmap_direction_input;
+		chip->direction_output = gpio_regmap_direction_output;
+	}
+
+	ret = gpiochip_add_data(chip, gpio);
+	if (ret < 0)
+		goto err_free_gpio;
+
+	if (config->irq_domain) {
+		ret = gpiochip_irqchip_add_domain(chip, config->irq_domain);
+		if (ret < 0)
+			goto err_remove_gpiochip;
+	}
+
+	return gpio;
+
+err_remove_gpiochip:
+	gpiochip_remove(chip);
+err_free_gpio:
+	kfree(gpio);
+	return ERR_PTR(ret);
+}
+EXPORT_SYMBOL_GPL(gpio_regmap_register);
+
+/**
+ * gpio_regmap_unregister() - Unregister a generic regmap GPIO controller
+ *
+ * @gpio: gpio_regmap device to unregister
+ */
+void gpio_regmap_unregister(struct gpio_regmap *gpio)
+{
+	gpiochip_remove(&gpio->gpio_chip);
+	kfree(gpio);
+}
+EXPORT_SYMBOL_GPL(gpio_regmap_unregister);
+
+static void devm_gpio_regmap_unregister(struct device *dev, void *res)
+{
+	gpio_regmap_unregister(*(struct gpio_regmap **)res);
+}
+
+/**
+ * devm_gpio_regmap_register() - resource managed gpio_regmap_register()
+ *
+ * @dev: device that is registering this GPIO device
+ * @gpio: gpio_regmap device to register
+ *
+ * Managed gpio_regmap_register(). For generic regmap GPIO device registered by
+ * this function, gpio_regmap_unregister() is automatically called on driver
+ * detach. See gpio_regmap_register() for more information.
+ */
+struct gpio_regmap *devm_gpio_regmap_register(struct device *dev,
+					      const struct gpio_regmap_config *config)
+{
+	struct gpio_regmap **ptr, *gpio;
+
+	ptr = devres_alloc(devm_gpio_regmap_unregister, sizeof(*ptr),
+			   GFP_KERNEL);
+	if (!ptr)
+		return ERR_PTR(-ENOMEM);
+
+	gpio = gpio_regmap_register(config);
+
+	if (!IS_ERR(gpio)) {
+		*ptr = gpio;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return gpio;
+}
+EXPORT_SYMBOL_GPL(devm_gpio_regmap_register);
+
+MODULE_AUTHOR("Michael Walle <michael@walle.cc>");
+MODULE_DESCRIPTION("GPIO generic regmap driver core");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/gpio-regmap.h b/include/linux/gpio-regmap.h
new file mode 100644
index 000000000000..bbdb2d79ef8f
--- /dev/null
+++ b/include/linux/gpio-regmap.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _LINUX_GPIO_REGMAP_H
+#define _LINUX_GPIO_REGMAP_H
+
+struct gpio_regmap;
+
+#define GPIO_REGMAP_ADDR_ZERO ((unsigned long)(-1))
+#define GPIO_REGMAP_ADDR(addr) ((addr) ? : GPIO_REGMAP_ADDR_ZERO)
+
+/**
+ * struct gpio_regmap_config - Description of a generic regmap gpio_chip.
+ *
+ * @parent:		The parent device
+ * @regmap:		The regmap used to access the registers
+ *			given, the name of the device is used
+ * @label:		(Optional) Descriptive name for GPIO controller.
+ *			If not given, the name of the device is used.
+ * @ngpio:		Number of GPIOs
+ * @reg_dat_base:	(Optional) (in) register base address
+ * @reg_set_base:	(Optional) set register base address
+ * @reg_clr_base:	(Optional) clear register base address
+ * @reg_dir_in_base:	(Optional) in setting register base address
+ * @reg_dir_out_base:	(Optional) out setting register base address
+ * @reg_stride:		(Optional) May be set if the registers (of the
+ *			same type, dat, set, etc) are not consecutive.
+ * @ngpio_per_reg:	Number of GPIOs per register
+ * @irq_domain:		(Optional) IRQ domain if the controller is
+ *			interrupt-capable
+ * @reg_mask_xlate:     (Optional) Translates base address and GPIO
+ *			offset to a register/bitmask pair. If not
+ *			given the default gpio_regmap_simple_xlate()
+ *			is used.
+ *
+ * The reg_mask_xlate translates a given base address and GPIO offset to
+ * register and mask pair. The base address is one of the given reg_*_base.
+ *
+ * All base addresses may have the special value GPIO_REGMAP_ADDR_ZERO
+ * which forces the address to the value 0.
+ */
+struct gpio_regmap_config {
+	struct device *parent;
+	struct regmap *regmap;
+
+	const char *label;
+	int ngpio;
+
+	unsigned int reg_dat_base;
+	unsigned int reg_set_base;
+	unsigned int reg_clr_base;
+	unsigned int reg_dir_in_base;
+	unsigned int reg_dir_out_base;
+	int reg_stride;
+	int ngpio_per_reg;
+	struct irq_domain *irq_domain;
+
+	int (*reg_mask_xlate)(struct gpio_regmap *gpio, unsigned int base,
+			      unsigned int offset, unsigned int *reg,
+			      unsigned int *mask);
+};
+
+struct gpio_regmap *gpio_regmap_register(const struct gpio_regmap_config *config);
+void gpio_regmap_unregister(struct gpio_regmap *gpio);
+struct gpio_regmap *devm_gpio_regmap_register(struct device *dev,
+					      const struct gpio_regmap_config *config);
+void gpio_regmap_set_drvdata(struct gpio_regmap *gpio, void *data);
+void *gpio_regmap_get_drvdata(struct gpio_regmap *gpio);
+
+#endif /* _LINUX_GPIO_REGMAP_H */
-- 
2.20.1

