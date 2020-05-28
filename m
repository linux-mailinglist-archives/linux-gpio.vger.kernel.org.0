Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CB741E6512
	for <lists+linux-gpio@lfdr.de>; Thu, 28 May 2020 16:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403972AbgE1O7Z (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 28 May 2020 10:59:25 -0400
Received: from ssl.serverraum.org ([176.9.125.105]:59163 "EHLO
        ssl.serverraum.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2403965AbgE1O7Y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 28 May 2020 10:59:24 -0400
Received: from apollo.fritz.box (unknown [IPv6:2a02:810c:c200:2e91:6257:18ff:fec4:ca34])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id CFE8222FAD;
        Thu, 28 May 2020 16:59:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1590677961;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+/xdAmmvOZMIOvXM81kea2dwwdiYWxi4TjqawRXgs4M=;
        b=QfkUJ26fcAOR5WC1SiZueM4kXa6EYd+5GqkpAJcIDHFwHzA5VTiSvwlEtgq/k4+FiSJQfV
        IQ5+7afEou3eqzcGoJbcuiNtZPnxsaH/RCavYyz3gFYUN/Udx5SWt7b4icnkzlMNYb3BYO
        mfaYMXExZ6Su6zsa3+MqX+Hjj7UO2oQ=
From:   Michael Walle <michael@walle.cc>
To:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Mark Brown <broonie@kernel.org>,
        Pierre-Louis Bossart <pierre-louis.bossart@intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Michael Walle <michael@walle.cc>
Subject: [PATCH v6 2/3] gpio: add a reusable generic gpio_chip using regmap
Date:   Thu, 28 May 2020 16:58:44 +0200
Message-Id: <20200528145845.31436-3-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200528145845.31436-1-michael@walle.cc>
References: <20200528145845.31436-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam: Yes
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
 drivers/gpio/gpio-regmap.c  | 349 ++++++++++++++++++++++++++++++++++++
 include/linux/gpio/regmap.h |  86 +++++++++
 4 files changed, 440 insertions(+)
 create mode 100644 drivers/gpio/gpio-regmap.c
 create mode 100644 include/linux/gpio/regmap.h

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 7d077be10a0f..bcacd9c74aa8 100644
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
index 000000000000..5412cb3b0b2a
--- /dev/null
+++ b/drivers/gpio/gpio-regmap.c
@@ -0,0 +1,349 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * regmap based generic GPIO driver
+ *
+ * Copyright 2020 Michael Walle <michael@walle.cc>
+ */
+
+#include <linux/gpio/driver.h>
+#include <linux/gpio/regmap.h>
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
+	if (addr == GPIO_REGMAP_ADDR_ZERO)
+		return 0;
+
+	return addr;
+}
+
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
+	return !!(val & mask);
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
+		return -EOPNOTSUPP;
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
+		return -EOPNOTSUPP;
+	}
+
+	ret = gpio->reg_mask_xlate(gpio, base, offset, &reg, &mask);
+	if (ret)
+		return ret;
+
+	if (invert)
+		val = output ? 0 : mask;
+	else
+		val = output ? mask : 0;
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
+ * @config: configuration for gpio_regmap
+ *
+ * Return: A pointer to the registered gpio_regmap or ERR_PTR error value.
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
+	/* if we have a direction register we need both input and output */
+	if ((config->reg_dir_out_base || config->reg_dir_in_base) &&
+	    (!config->reg_dat_base || !config->reg_set_base))
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
+	chip->names = config->names;
+	chip->label = config->label ?: dev_name(config->parent);
+
+	/*
+	 * If our regmap is fast_io we should probably set can_sleep to false.
+	 * Right now, the regmap doesn't save this property, nor is there any
+	 * access function for it.
+	 * The only regmap type which uses fast_io is regmap-mmio. For now,
+	 * assume a safe default of true here.
+	 */
+	chip->can_sleep = true;
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
+		if (ret)
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
+ * @dev: device that is registering this GPIO device
+ * @config: configuration for gpio_regmap
+ *
+ * Managed gpio_regmap_register(). For generic regmap GPIO device registered by
+ * this function, gpio_regmap_unregister() is automatically called on driver
+ * detach. See gpio_regmap_register() for more information.
+ *
+ * Return: A pointer to the registered gpio_regmap or ERR_PTR error value.
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
diff --git a/include/linux/gpio/regmap.h b/include/linux/gpio/regmap.h
new file mode 100644
index 000000000000..4c1e6b34e824
--- /dev/null
+++ b/include/linux/gpio/regmap.h
@@ -0,0 +1,86 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _LINUX_GPIO_REGMAP_H
+#define _LINUX_GPIO_REGMAP_H
+
+struct device;
+struct gpio_regmap;
+struct irq_domain;
+struct regmap;
+
+#define GPIO_REGMAP_ADDR_ZERO ((unsigned long)(-1))
+#define GPIO_REGMAP_ADDR(addr) ((addr) ? : GPIO_REGMAP_ADDR_ZERO)
+
+/**
+ * struct gpio_regmap_config - Description of a generic regmap gpio_chip.
+ * @parent:		The parent device
+ * @regmap:		The regmap used to access the registers
+ *			given, the name of the device is used
+ * @label:		(Optional) Descriptive name for GPIO controller.
+ *			If not given, the name of the device is used.
+ * @ngpio:		Number of GPIOs
+ * @names:		(Optional) Array of names for gpios
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
+ * The ->reg_mask_xlate translates a given base address and GPIO offset to
+ * register and mask pair. The base address is one of the given register
+ * base addresses in this structure.
+ *
+ * Although all register base addresses are marked as optional, there are
+ * several rules:
+ *     1. if you only have @reg_dat_base set, then it is input-only
+ *     2. if you only have @reg_set_base set, then it is output-only
+ *     3. if you have either @reg_dir_in_base or @reg_dir_out_base set, then
+ *        you have to set both @reg_dat_base and @reg_set_base
+ *     4. if you have @reg_set_base set, you may also set @reg_clr_base to have
+ *        two different registers for setting and clearing the output. This is
+ *        also valid for the output-only case.
+ *     5. @reg_dir_in_base and @reg_dir_out_base are exclusive; is there really
+ *        hardware which has redundant registers?
+ *
+ * Note: All base addresses may have the special value %GPIO_REGMAP_ADDR_ZERO
+ * which forces the address to the value 0.
+ */
+struct gpio_regmap_config {
+	struct device *parent;
+	struct regmap *regmap;
+
+	const char *label;
+	int ngpio;
+	const char *const *names;
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

