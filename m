Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39136467853
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Dec 2021 14:30:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381054AbhLCNdz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Dec 2021 08:33:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381035AbhLCNdx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Dec 2021 08:33:53 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 794BFC061759
        for <linux-gpio@vger.kernel.org>; Fri,  3 Dec 2021 05:30:29 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id j3so5808450wrp.1
        for <linux-gpio@vger.kernel.org>; Fri, 03 Dec 2021 05:30:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ykRGKSkLc55F978Xk44Vc42Jrx1JowFN66EHjwv71Jc=;
        b=S9jc2gLnOESfEdkZfRY8NneDWnz4YK93zbA0jBoS7s0iqaNm/YD+3EqGtyPb4BaTgE
         4HPSt+onHAYnu0XzIKeUTZcyi/2mI3yd4ejAjRWHsAjC/4q45GYUY1YzZyZmV1HL/Ahy
         iZUTwpVHgJEQngzIdUVWKvur75qQP56QK1QoxLmFfAoVIOVVX51dNCkvW6QiE31CRmFi
         9oO05iuvnoEEluW7WW1GIl6lSXDs8DKuPjpe/F30+okIjSyxKVE8/71o2+dgPWLcHwhL
         JtjeqdUk3B6HDOXXHk8lEZw0w9MjcpJVL5T77TVimqp7hibZkyjmEadoRRJPtmkuTsLi
         xjrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ykRGKSkLc55F978Xk44Vc42Jrx1JowFN66EHjwv71Jc=;
        b=RGaq2xpyoo0YTScNGiTbE4kmnh9l1wDPfLsDJyTnIFsEcCQbOzl3ly2+hgERsCekDN
         ZRb87BiczBVPhz5iZC54CML+iL5Nz2HJ8NJaGWSiZ6N0u22ULIfDFulzBuIrtdNd2/EY
         m0B+ry47aVvBqzdDn8E/W17yDS3GSAh+ySNcnZ2m2IrlDkomjQSys9MDTQKHK6yW517g
         bVL2IGpxRE4uGyYCfhOMv9BduXmgiDUm+29yHXYAn+Znjs6uxj07qXDHv0jcQ+ahuXue
         E+NV2G/RCwxFZT7qRBpoUdNaql6W5PK7VAQLaumOxehv9Fm5z5kVrzW1r17psbTqh2bi
         xb7Q==
X-Gm-Message-State: AOAM53226MCvbz62CbDjIrUCT65Px6QImdKdLOSGFAig/xkJLKVQXehj
        dRRdCQc1S3G3ia97F1yxPidUsQ==
X-Google-Smtp-Source: ABdhPJy7jCFUyP6fFECbedCN3przVZJLQzgr0RKd3r8BuuWOeuUrTHUmqeCYdzfFKubnn8WUhRUPAg==
X-Received: by 2002:adf:ed83:: with SMTP id c3mr20937264wro.169.1638538227495;
        Fri, 03 Dec 2021 05:30:27 -0800 (PST)
Received: from debian-brgl.home ([2a01:cb1d:334:ac00:7d50:ff5:f5c1:e225])
        by smtp.gmail.com with ESMTPSA id j11sm2755910wrt.3.2021.12.03.05.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 05:30:27 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Shuah Khan <shuah@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v12 4/7] gpio: sim: new testing module
Date:   Fri,  3 Dec 2021 14:30:00 +0100
Message-Id: <20211203133003.31786-5-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20211203133003.31786-1-brgl@bgdev.pl>
References: <20211203133003.31786-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Implement a new, modern GPIO testing module controlled by configfs
attributes instead of module parameters. The goal of this driver is
to provide a replacement for gpio-mockup that will be easily extensible
with new features and doesn't require reloading the module to change
the setup.

Signed-off-by: Bartosz Golaszewski <brgl@bgdev.pl>
---
 Documentation/admin-guide/gpio/gpio-sim.rst |  134 ++
 drivers/gpio/Kconfig                        |    8 +
 drivers/gpio/Makefile                       |    1 +
 drivers/gpio/gpio-sim.c                     | 1594 +++++++++++++++++++
 4 files changed, 1737 insertions(+)
 create mode 100644 Documentation/admin-guide/gpio/gpio-sim.rst
 create mode 100644 drivers/gpio/gpio-sim.c

diff --git a/Documentation/admin-guide/gpio/gpio-sim.rst b/Documentation/admin-guide/gpio/gpio-sim.rst
new file mode 100644
index 000000000000..d8a90c81b9ee
--- /dev/null
+++ b/Documentation/admin-guide/gpio/gpio-sim.rst
@@ -0,0 +1,134 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+Configfs GPIO Simulator
+=======================
+
+The configfs GPIO Simulator (gpio-sim) provides a way to create simulated GPIO
+chips for testing purposes. The lines exposed by these chips can be accessed
+using the standard GPIO character device interface as well as manipulated
+using sysfs attributes.
+
+Creating simulated chips
+------------------------
+
+The gpio-sim module registers a configfs subsystem called ``'gpio-sim'``. For
+details of the configfs filesystem, please refer to the configfs documentation.
+
+The user can create a hierarchy of configfs groups and items as well as modify
+values of exposed attributes. Once the chip is instantiated, this hierarchy
+will be translated to appropriate device properties. The general structure is:
+
+**Group:** ``/config/gpio-sim``
+
+This is the top directory of the gpio-sim configfs tree.
+
+**Group:** ``/config/gpio-sim/gpio-device``
+
+**Attribute:** ``/config/gpio-sim/gpio-device/dev_name``
+
+**Attribute:** ``/config/gpio-sim/gpio-device/live``
+
+This is a directory representing a GPIO platform device. The ``'dev_name'``
+attribute is read-only and allows the user-space to read the platform device
+name (e.g. ``'gpio-sim.0'``). The ``'live'`` attribute allows to trigger the
+actual creation of the device once it's fully configured. The accepted values
+are: ``'1'`` to enable the simulated device and ``'0'`` to disable and tear
+it down.
+
+**Group:** ``/config/gpio-sim/gpio-device/gpio-bankX``
+
+**Attribute:** ``/config/gpio-sim/gpio-device/gpio-bankX/chip_name``
+
+**Attribute:** ``/config/gpio-sim/gpio-device/gpio-bankX/num_lines``
+
+This group represents a bank of GPIOs under the top platform device. The
+``'chip_name'`` attribute is read-only and allows the user-space to read the
+device name of the bank device. The ``'num_lines'`` attribute allows to specify
+the number of lines exposed by this bank.
+
+**Group:** ``/config/gpio-sim/gpio-device/gpio-bankX/lineY``
+
+**Attribute:** ``/config/gpio-sim/gpio-device/gpio-bankX/lineY/name``
+
+This group represents a single line at the offset Y. The 'name' attribute
+allows to set the line name as represented by the 'gpio-line-names' property.
+
+**Item:** ``/config/gpio-sim/gpio-device/gpio-bankX/lineY/hog``
+
+**Attribute:** ``/config/gpio-sim/gpio-device/gpio-bankX/lineY/hog/name``
+
+**Attribute:** ``/config/gpio-sim/gpio-device/gpio-bankX/lineY/hog/direction``
+
+This item makes the gpio-sim module hog the associated line. The ``'name'``
+attribute specifies the in-kernel consumer name to use. The ``'direction'``
+attribute specifies the hog direction and must be one of: ``'input'``,
+``'output-high'`` and ``'output-low'``.
+
+Inside each bank directory, there's a set of attributes that can be used to
+configure the new chip. Additionally the user can ``mkdir()`` subdirectories
+inside the chip's directory that allow to pass additional configuration for
+specific lines. The name of those subdirectories must take the form of:
+``'line<offset>'`` (e.g. ``'line0'``, ``'line20'``, etc.) as the name will be
+used by the module to assign the config to the specific line at given offset.
+
+Once the confiuration is complete, the ``'live'`` attribute must be set to 1 in
+order to instantiate the chip. It can be set back to 0 to destroy the simulated
+chip. The module will synchronously wait for the new simulated device to be
+successfully probed and if this doesn't happen, writing to ``'live'`` will
+result in an error.
+
+Simulated GPIO chips can also be defined in device-tree. The compatible string
+must be: ``"gpio-simulator"``. Supported properties are:
+
+  ``"gpio-sim,label"`` - chip label
+
+Other standard GPIO properties (like ``"gpio-line-names"``, ``"ngpios"`` or
+``"gpio-hog"``) are also supported. Please refer to the GPIO documentation for
+details.
+
+An example device-tree code defining a GPIO simulator:
+
+.. code-block :: none
+
+    gpio-sim {
+        compatible = "gpio-simulator";
+
+        bank0 {
+            gpio-controller;
+            #gpio-cells = <2>;
+            ngpios = <16>;
+            gpio-sim,label = "dt-bank0";
+            gpio-line-names = "", "sim-foo", "", "sim-bar";
+        };
+
+        bank1 {
+            gpio-controller;
+            #gpio-cells = <2>;
+            ngpios = <8>;
+            gpio-sim,label = "dt-bank1";
+
+            line3 {
+                gpio-hog;
+                gpios = <3 0>;
+                output-high;
+                line-name = "sim-hog-from-dt";
+            };
+        };
+    };
+
+Manipulating simulated lines
+----------------------------
+
+Each simulated GPIO chip creates a separate sysfs group under its device
+directory for each exposed line
+(e.g. ``/sys/devices/platform/gpio-sim.X/gpiochipY/``). The name of each group
+is of the form: ``'sim_gpioX'`` where X is the offset of the line. Inside each
+group there are two attibutes:
+
+    ``pull`` - allows to read and set the current simulated pull setting for
+               every line, when writing the value must be one of: ``'pull-up'``,
+               ``'pull-down'``
+
+    ``value`` - allows to read the current value of the line which may be
+                different from the pull if the line is being driven from
+                user-space
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 60d9374c72c0..9acdb4d1047b 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1694,6 +1694,14 @@ config GPIO_VIRTIO
 	  These virtual GPIOs can be routed to real GPIOs or attached to
 	  simulators on the host (like QEMU).
 
+config GPIO_SIM
+	tristate "GPIO Simulator Module"
+	select IRQ_SIM
+	select CONFIGFS_FS
+	help
+	  This enables the GPIO simulator - a configfs-based GPIO testing
+	  driver.
+
 endmenu
 
 endif
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 71ee9fc2ff83..f21577de2474 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -133,6 +133,7 @@ obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)	+= gpio-sama5d2-piobu.o
 obj-$(CONFIG_GPIO_SCH311X)		+= gpio-sch311x.o
 obj-$(CONFIG_GPIO_SCH)			+= gpio-sch.o
 obj-$(CONFIG_GPIO_SIFIVE)		+= gpio-sifive.o
+obj-$(CONFIG_GPIO_SIM)			+= gpio-sim.o
 obj-$(CONFIG_GPIO_SIOX)			+= gpio-siox.o
 obj-$(CONFIG_GPIO_SL28CPLD)		+= gpio-sl28cpld.o
 obj-$(CONFIG_GPIO_SODAVILLE)		+= gpio-sodaville.o
diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
new file mode 100644
index 000000000000..0f8399a61733
--- /dev/null
+++ b/drivers/gpio/gpio-sim.c
@@ -0,0 +1,1594 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * GPIO testing driver based on configfs.
+ *
+ * Copyright (C) 2021 Bartosz Golaszewski <brgl@bgdev.pl>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/bitmap.h>
+#include <linux/completion.h>
+#include <linux/configfs.h>
+#include <linux/device.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/machine.h>
+#include <linux/idr.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irq_sim.h>
+#include <linux/list.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/notifier.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/string_helpers.h>
+#include <linux/sysfs.h>
+
+#include "gpiolib.h"
+
+#define GPIO_SIM_PROP_MAX	4 /* Max 3 properties + sentinel. */
+#define GPIO_SIM_NUM_ATTRS	3 /* value, pull and sentinel */
+
+static DEFINE_IDA(gpio_sim_ida);
+
+struct gpio_sim_chip {
+	struct gpio_chip gc;
+	unsigned long *direction_map;
+	unsigned long *value_map;
+	unsigned long *pull_map;
+	struct irq_domain *irq_sim;
+	struct mutex lock;
+	const struct attribute_group **attr_groups;
+};
+
+struct gpio_sim_attribute {
+	struct device_attribute dev_attr;
+	unsigned int offset;
+};
+
+static struct gpio_sim_attribute *
+to_gpio_sim_attr(struct device_attribute *dev_attr)
+{
+	return container_of(dev_attr, struct gpio_sim_attribute, dev_attr);
+}
+
+static int gpio_sim_apply_pull(struct gpio_sim_chip *chip,
+			       unsigned int offset, int value)
+{
+	int curr_val, irq, irq_type, ret;
+	struct gpio_desc *desc;
+	struct gpio_chip *gc;
+
+	gc = &chip->gc;
+	desc = &gc->gpiodev->descs[offset];
+
+	mutex_lock(&chip->lock);
+
+	if (test_bit(FLAG_REQUESTED, &desc->flags) &&
+	    !test_bit(FLAG_IS_OUT, &desc->flags)) {
+		curr_val = !!test_bit(offset, chip->value_map);
+		if (curr_val == value)
+			goto set_pull;
+
+		/*
+		 * This is fine - it just means, nobody is listening
+		 * for interrupts on this line, otherwise
+		 * irq_create_mapping() would have been called from
+		 * the to_irq() callback.
+		 */
+		irq = irq_find_mapping(chip->irq_sim, offset);
+		if (!irq)
+			goto set_value;
+
+		irq_type = irq_get_trigger_type(irq);
+
+		if ((value && (irq_type & IRQ_TYPE_EDGE_RISING)) ||
+		    (!value && (irq_type & IRQ_TYPE_EDGE_FALLING))) {
+			ret = irq_set_irqchip_state(irq, IRQCHIP_STATE_PENDING,
+						    true);
+			if (ret)
+				goto set_pull;
+		}
+	}
+
+set_value:
+	/* Change the value unless we're actively driving the line. */
+	if (!test_bit(FLAG_REQUESTED, &desc->flags) ||
+	    !test_bit(FLAG_IS_OUT, &desc->flags))
+		__assign_bit(offset, chip->value_map, value);
+
+set_pull:
+	__assign_bit(offset, chip->pull_map, value);
+	mutex_unlock(&chip->lock);
+	return 0;
+}
+
+static int gpio_sim_get(struct gpio_chip *gc, unsigned int offset)
+{
+	struct gpio_sim_chip *chip = gpiochip_get_data(gc);
+	int ret;
+
+	mutex_lock(&chip->lock);
+	ret = !!test_bit(offset, chip->value_map);
+	mutex_unlock(&chip->lock);
+
+	return ret;
+}
+
+static void gpio_sim_set(struct gpio_chip *gc, unsigned int offset, int value)
+{
+	struct gpio_sim_chip *chip = gpiochip_get_data(gc);
+
+	mutex_lock(&chip->lock);
+	__assign_bit(offset, chip->value_map, value);
+	mutex_unlock(&chip->lock);
+}
+
+static int gpio_sim_get_multiple(struct gpio_chip *gc,
+				 unsigned long *mask, unsigned long *bits)
+{
+	struct gpio_sim_chip *chip = gpiochip_get_data(gc);
+
+	mutex_lock(&chip->lock);
+	bitmap_copy(bits, chip->value_map, gc->ngpio);
+	mutex_unlock(&chip->lock);
+
+	return 0;
+}
+
+static void gpio_sim_set_multiple(struct gpio_chip *gc,
+				  unsigned long *mask, unsigned long *bits)
+{
+	struct gpio_sim_chip *chip = gpiochip_get_data(gc);
+
+	mutex_lock(&chip->lock);
+	bitmap_copy(chip->value_map, bits, gc->ngpio);
+	mutex_unlock(&chip->lock);
+}
+
+static int gpio_sim_direction_output(struct gpio_chip *gc,
+				     unsigned int offset, int value)
+{
+	struct gpio_sim_chip *chip = gpiochip_get_data(gc);
+
+	mutex_lock(&chip->lock);
+	__clear_bit(offset, chip->direction_map);
+	__assign_bit(offset, chip->value_map, value);
+	mutex_unlock(&chip->lock);
+
+	return 0;
+}
+
+static int gpio_sim_direction_input(struct gpio_chip *gc, unsigned int offset)
+{
+	struct gpio_sim_chip *chip = gpiochip_get_data(gc);
+
+	mutex_lock(&chip->lock);
+	__set_bit(offset, chip->direction_map);
+	mutex_unlock(&chip->lock);
+
+	return 0;
+}
+
+static int gpio_sim_get_direction(struct gpio_chip *gc, unsigned int offset)
+{
+	struct gpio_sim_chip *chip = gpiochip_get_data(gc);
+	int direction;
+
+	mutex_lock(&chip->lock);
+	direction = !!test_bit(offset, chip->direction_map);
+	mutex_unlock(&chip->lock);
+
+	return direction ? GPIO_LINE_DIRECTION_IN : GPIO_LINE_DIRECTION_OUT;
+}
+
+static int gpio_sim_set_config(struct gpio_chip *gc,
+				  unsigned int offset, unsigned long config)
+{
+	struct gpio_sim_chip *chip = gpiochip_get_data(gc);
+
+	switch (pinconf_to_config_param(config)) {
+	case PIN_CONFIG_BIAS_PULL_UP:
+		return gpio_sim_apply_pull(chip, offset, 1);
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+		return gpio_sim_apply_pull(chip, offset, 0);
+	default:
+		break;
+	}
+
+	return -ENOTSUPP;
+}
+
+static int gpio_sim_to_irq(struct gpio_chip *gc, unsigned int offset)
+{
+	struct gpio_sim_chip *chip = gpiochip_get_data(gc);
+
+	return irq_create_mapping(chip->irq_sim, offset);
+}
+
+static void gpio_sim_free(struct gpio_chip *gc, unsigned int offset)
+{
+	struct gpio_sim_chip *chip = gpiochip_get_data(gc);
+
+	mutex_lock(&chip->lock);
+	__assign_bit(offset, chip->value_map, !!test_bit(offset, chip->pull_map));
+	mutex_unlock(&chip->lock);
+}
+
+static ssize_t gpio_sim_sysfs_val_show(struct device *dev,
+				       struct device_attribute *attr, char *buf)
+{
+	struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
+	struct gpio_sim_chip *chip = dev_get_drvdata(dev);
+	int val;
+
+	mutex_lock(&chip->lock);
+	val = !!test_bit(line_attr->offset, chip->value_map);
+	mutex_unlock(&chip->lock);
+
+	return sysfs_emit(buf, "%d\n", val);
+}
+
+static ssize_t gpio_sim_sysfs_val_store(struct device *dev,
+					struct device_attribute *attr,
+					const char *buf, size_t count)
+{
+	/*
+	 * Not assigning this function will result in write() returning -EIO
+	 * which is confusing. Return -EPERM explicitly.
+	 */
+	return -EPERM;
+}
+
+static ssize_t gpio_sim_sysfs_pull_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
+	struct gpio_sim_chip *chip = dev_get_drvdata(dev);
+	char *repr;
+	int pull;
+
+	mutex_lock(&chip->lock);
+	pull = !!test_bit(line_attr->offset, chip->pull_map);
+	mutex_unlock(&chip->lock);
+
+	if (pull)
+		repr = "pull-up";
+	else
+		repr = "pull-down";
+
+	return sysfs_emit(buf, "%s\n", repr);
+}
+
+static ssize_t gpio_sim_sysfs_pull_store(struct device *dev,
+					 struct device_attribute *attr,
+					 const char *buf, size_t len)
+{
+	struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
+	struct gpio_sim_chip *chip = dev_get_drvdata(dev);
+	int ret, pull;
+
+	if (sysfs_streq(buf, "pull-down"))
+		pull = 0;
+	else if (sysfs_streq(buf, "pull-up"))
+		pull = 1;
+	else
+		return -EINVAL;
+
+	ret = gpio_sim_apply_pull(chip, line_attr->offset, pull);
+	if (ret)
+		return ret;
+
+	return len;
+}
+
+static void gpio_sim_mutex_destroy(void *data)
+{
+	struct mutex *lock = data;
+
+	mutex_destroy(lock);
+}
+
+static void gpio_sim_sysfs_remove(void *data)
+{
+	struct gpio_sim_chip *chip = data;
+
+	sysfs_remove_groups(&chip->gc.gpiodev->dev.kobj, chip->attr_groups);
+}
+
+static int gpio_sim_setup_sysfs(struct gpio_sim_chip *chip)
+{
+	struct device_attribute *val_dev_attr, *pull_dev_attr;
+	struct gpio_sim_attribute *val_attr, *pull_attr;
+	unsigned int num_lines = chip->gc.ngpio;
+	struct device *dev = chip->gc.parent;
+	struct attribute_group *attr_group;
+	struct attribute **attrs;
+	int i, ret;
+
+	chip->attr_groups = devm_kcalloc(dev, sizeof(*chip->attr_groups),
+					 num_lines + 1, GFP_KERNEL);
+	if (!chip->attr_groups)
+		return -ENOMEM;
+
+	for (i = 0; i < num_lines; i++) {
+		attr_group = devm_kzalloc(dev, sizeof(*attr_group), GFP_KERNEL);
+		attrs = devm_kcalloc(dev, sizeof(*attrs),
+				     GPIO_SIM_NUM_ATTRS, GFP_KERNEL);
+		val_attr = devm_kzalloc(dev, sizeof(*val_attr), GFP_KERNEL);
+		pull_attr = devm_kzalloc(dev, sizeof(*pull_attr), GFP_KERNEL);
+		if (!attr_group || !attrs || !val_attr || !pull_attr)
+			return -ENOMEM;
+
+		attr_group->name = devm_kasprintf(dev, GFP_KERNEL,
+						  "sim_gpio%u", i);
+		if (!attr_group->name)
+			return -ENOMEM;
+
+		val_attr->offset = pull_attr->offset = i;
+
+		val_dev_attr = &val_attr->dev_attr;
+		pull_dev_attr = &pull_attr->dev_attr;
+
+		sysfs_attr_init(&val_dev_attr->attr);
+		sysfs_attr_init(&pull_dev_attr->attr);
+
+		val_dev_attr->attr.name = "value";
+		pull_dev_attr->attr.name = "pull";
+
+		val_dev_attr->attr.mode = pull_dev_attr->attr.mode = 0644;
+
+		val_dev_attr->show = gpio_sim_sysfs_val_show;
+		val_dev_attr->store = gpio_sim_sysfs_val_store;
+		pull_dev_attr->show = gpio_sim_sysfs_pull_show;
+		pull_dev_attr->store = gpio_sim_sysfs_pull_store;
+
+		attrs[0] = &val_dev_attr->attr;
+		attrs[1] = &pull_dev_attr->attr;
+
+		attr_group->attrs = attrs;
+		chip->attr_groups[i] = attr_group;
+	}
+
+	ret = sysfs_create_groups(&chip->gc.gpiodev->dev.kobj,
+				  chip->attr_groups);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev, gpio_sim_sysfs_remove, chip);
+}
+
+static int gpio_sim_add_bank(struct fwnode_handle *swnode, struct device *dev)
+{
+	struct gpio_sim_chip *chip;
+	struct gpio_chip *gc;
+	const char *label;
+	u32 num_lines;
+	int ret;
+
+	ret = fwnode_property_read_u32(swnode, "ngpios", &num_lines);
+	if (ret)
+		return ret;
+
+	ret = fwnode_property_read_string(swnode, "gpio-sim,label", &label);
+	if (ret) {
+		label = devm_kasprintf(dev, GFP_KERNEL, "%s-%s",
+				       dev_name(dev), fwnode_get_name(swnode));
+		if (!label)
+			return -ENOMEM;
+	}
+
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->direction_map = devm_bitmap_alloc(dev, num_lines, GFP_KERNEL);
+	if (!chip->direction_map)
+		return -ENOMEM;
+
+	/* Default to input mode. */
+	bitmap_fill(chip->direction_map, num_lines);
+
+	chip->value_map = devm_bitmap_zalloc(dev, num_lines, GFP_KERNEL);
+	if (!chip->value_map)
+		return -ENOMEM;
+
+	chip->pull_map = devm_bitmap_zalloc(dev, num_lines, GFP_KERNEL);
+	if (!chip->pull_map)
+		return -ENOMEM;
+
+	chip->irq_sim = devm_irq_domain_create_sim(dev, NULL, num_lines);
+	if (IS_ERR(chip->irq_sim))
+		return PTR_ERR(chip->irq_sim);
+
+	mutex_init(&chip->lock);
+	ret = devm_add_action_or_reset(dev, gpio_sim_mutex_destroy,
+				       &chip->lock);
+	if (ret)
+		return ret;
+
+	gc = &chip->gc;
+	gc->base = -1;
+	gc->ngpio = num_lines;
+	gc->label = label;
+	gc->owner = THIS_MODULE;
+	gc->parent = dev;
+	gc->fwnode = swnode;
+	gc->get = gpio_sim_get;
+	gc->set = gpio_sim_set;
+	gc->get_multiple = gpio_sim_get_multiple;
+	gc->set_multiple = gpio_sim_set_multiple;
+	gc->direction_output = gpio_sim_direction_output;
+	gc->direction_input = gpio_sim_direction_input;
+	gc->get_direction = gpio_sim_get_direction;
+	gc->set_config = gpio_sim_set_config;
+	gc->to_irq = gpio_sim_to_irq;
+	gc->free = gpio_sim_free;
+
+	ret = devm_gpiochip_add_data(dev, gc, chip);
+	if (ret)
+		return ret;
+
+	/* Used by sysfs and configfs callbacks. */
+	dev_set_drvdata(&gc->gpiodev->dev, chip);
+
+	return gpio_sim_setup_sysfs(chip);
+}
+
+static int gpio_sim_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct fwnode_handle *swnode;
+	int ret;
+
+	device_for_each_child_node(dev, swnode) {
+		ret = gpio_sim_add_bank(swnode, dev);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static const struct of_device_id gpio_sim_of_match[] = {
+	{ .compatible = "gpio-simulator" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gpio_sim_of_match);
+
+static struct platform_driver gpio_sim_driver = {
+	.driver = {
+		.name = "gpio-sim",
+		.of_match_table = gpio_sim_of_match,
+	},
+	.probe = gpio_sim_probe,
+};
+
+struct gpio_sim_device {
+	struct config_group group;
+
+	/*
+	 * If pdev is NULL, the device is 'pending' (waiting for configuration).
+	 * Once the pointer is assigned, the device has been created and the
+	 * item is 'live'.
+	 */
+	struct platform_device *pdev;
+	int id;
+
+	/*
+	 * Each configfs filesystem operation is protected with the subsystem
+	 * mutex. Each separate attribute is protected with the buffer mutex.
+	 * This structure however can be modified by callbacks of different
+	 * attributes so we need another lock.
+	 *
+	 * We use this lock fo protecting all data structures owned by this
+	 * object too.
+	 */
+	struct mutex lock;
+
+	/*
+	 * This is used to synchronously wait for the driver's probe to complete
+	 * and notify the user-space about any errors.
+	 */
+	struct notifier_block bus_notifier;
+	struct completion probe_completion;
+	bool driver_bound;
+
+	struct gpiod_hog *hogs;
+
+	struct list_head bank_list;
+};
+
+/* This is called with dev->lock already taken. */
+static int gpio_sim_bus_notifier_call(struct notifier_block *nb,
+				      unsigned long action, void *data)
+{
+	struct gpio_sim_device *simdev = container_of(nb,
+						      struct gpio_sim_device,
+						      bus_notifier);
+	struct device *dev = data;
+	char devname[32];
+
+	snprintf(devname, sizeof(devname), "gpio-sim.%u", simdev->id);
+
+	if (strcmp(dev_name(dev), devname) == 0) {
+		if (action == BUS_NOTIFY_BOUND_DRIVER)
+			simdev->driver_bound = true;
+		else if (action == BUS_NOTIFY_DRIVER_NOT_BOUND)
+			simdev->driver_bound = false;
+		else
+			return NOTIFY_DONE;
+
+		complete(&simdev->probe_completion);
+		return NOTIFY_OK;
+	}
+
+	return NOTIFY_DONE;
+}
+
+static struct gpio_sim_device *to_gpio_sim_device(struct config_item *item)
+{
+	struct config_group *group = to_config_group(item);
+
+	return container_of(group, struct gpio_sim_device, group);
+}
+
+struct gpio_sim_bank {
+	struct config_group group;
+
+	/*
+	 * We could have used the ci_parent field of the config_item but
+	 * configfs is stupid and calls the item's release callback after
+	 * already having cleared the parent pointer even though the parent
+	 * is guaranteed to survive the child...
+	 *
+	 * So we need to store the pointer to the parent struct here. We can
+	 * dereference it anywhere we need with no checks and no locking as
+	 * it's guaranteed to survive the childred and protected by configfs
+	 * locks.
+	 *
+	 * Same for other structures.
+	 */
+	struct gpio_sim_device *parent;
+	struct list_head siblings;
+
+	char *label;
+	unsigned int num_lines;
+
+	struct list_head line_list;
+
+	struct fwnode_handle *swnode;
+};
+
+static struct gpio_sim_bank *to_gpio_sim_bank(struct config_item *item)
+{
+	struct config_group *group = to_config_group(item);
+	return container_of(group, struct gpio_sim_bank, group);
+}
+
+static struct gpio_sim_device *
+gpio_sim_bank_get_device(struct gpio_sim_bank *bank)
+{
+	return bank->parent;
+}
+
+struct gpio_sim_hog;
+
+struct gpio_sim_line {
+	struct config_group group;
+
+	struct gpio_sim_bank *parent;
+	struct list_head siblings;
+
+	unsigned int offset;
+	char *name;
+
+	/* There can only be one hog per line. */
+	struct gpio_sim_hog *hog;
+};
+
+static struct gpio_sim_line *to_gpio_sim_line(struct config_item *item)
+{
+	struct config_group *group = to_config_group(item);
+
+	return container_of(group, struct gpio_sim_line, group);
+}
+
+static struct gpio_sim_device *
+gpio_sim_line_get_device(struct gpio_sim_line *line)
+{
+	struct gpio_sim_bank *bank = line->parent;
+
+	return gpio_sim_bank_get_device(bank);
+}
+
+struct gpio_sim_hog {
+	struct config_item item;
+	struct gpio_sim_line *parent;
+
+	char *name;
+	int dir;
+};
+
+static struct gpio_sim_hog *to_gpio_sim_hog(struct config_item *item)
+{
+	return container_of(item, struct gpio_sim_hog, item);
+}
+
+static struct gpio_sim_device *gpio_sim_hog_get_device(struct gpio_sim_hog *hog)
+{
+	struct gpio_sim_line *line = hog->parent;
+
+	return gpio_sim_line_get_device(line);
+}
+
+static bool gpio_sim_device_is_live_unlocked(struct gpio_sim_device *dev)
+{
+	return !!dev->pdev;
+}
+
+static char *gpio_sim_strdup_trimmed(const char *str, size_t count)
+{
+	char *dup, *trimmed, *ret;
+
+	dup = kstrndup(str, count, GFP_KERNEL);
+	if (!dup)
+		return NULL;
+
+	trimmed = strstrip(dup);
+	ret = kstrdup(trimmed, GFP_KERNEL);
+	kfree(dup);
+	return ret;
+}
+
+static ssize_t gpio_sim_device_config_dev_name_show(struct config_item *item,
+						    char *page)
+{
+	struct gpio_sim_device *dev = to_gpio_sim_device(item);
+	struct platform_device *pdev;
+	int ret;
+
+	mutex_lock(&dev->lock);
+	pdev = dev->pdev;
+	if (pdev)
+		ret = sprintf(page, "%s\n", dev_name(&pdev->dev));
+	else
+		ret = sprintf(page, "gpio-sim.%d\n", dev->id);
+	mutex_unlock(&dev->lock);
+
+	return ret;
+}
+
+CONFIGFS_ATTR_RO(gpio_sim_device_config_, dev_name);
+
+static ssize_t
+gpio_sim_device_config_live_show(struct config_item *item, char *page)
+{
+	struct gpio_sim_device *dev = to_gpio_sim_device(item);
+	bool live;
+
+	mutex_lock(&dev->lock);
+	live = gpio_sim_device_is_live_unlocked(dev);
+	mutex_unlock(&dev->lock);
+
+	return sprintf(page, "%c\n", live ? '1' : '0');
+}
+
+static char **gpio_sim_make_line_names(struct gpio_sim_bank *bank,
+				       unsigned int *line_names_size)
+{
+	unsigned int max_offset = 0;
+	bool has_line_names = false;
+	struct gpio_sim_line *line;
+	char **line_names;
+
+	list_for_each_entry(line, &bank->line_list, siblings) {
+		if (line->name) {
+			if (line->offset > max_offset)
+				max_offset = line->offset;
+
+			/*
+			 * max_offset can stay at 0 so it's not an indicator
+			 * of whether line names were configured at all.
+			 */
+			has_line_names = true;
+		}
+	}
+
+	if (!has_line_names)
+		/*
+		 * This is not an error - NULL means, there are no line
+		 * names configured.
+		 */
+		return NULL;
+
+	*line_names_size = max_offset + 1;
+
+	line_names = kcalloc(*line_names_size, sizeof(*line_names), GFP_KERNEL);
+	if (!line_names)
+		return ERR_PTR(-ENOMEM);
+
+	list_for_each_entry(line, &bank->line_list, siblings)
+		line_names[line->offset] = line->name;
+
+	return line_names;
+}
+
+static void gpio_sim_remove_hogs(struct gpio_sim_device *dev)
+{
+	struct gpiod_hog *hog;
+
+	if (!dev->hogs)
+		return;
+
+	gpiod_remove_hogs(dev->hogs);
+
+	for (hog = dev->hogs; !hog->chip_label; hog++) {
+		kfree(hog->chip_label);
+		kfree(hog->line_name);
+	}
+
+	kfree(dev->hogs);
+	dev->hogs = NULL;
+}
+
+static int gpio_sim_add_hogs(struct gpio_sim_device *dev)
+{
+	unsigned int num_hogs = 0, idx = 0;
+	struct gpio_sim_bank *bank;
+	struct gpio_sim_line *line;
+	struct gpiod_hog *hog;
+
+	list_for_each_entry(bank, &dev->bank_list, siblings) {
+		list_for_each_entry(line, &bank->line_list, siblings) {
+			if (line->hog)
+				num_hogs++;
+		}
+	}
+
+	if (!num_hogs)
+		return 0;
+
+	/* Allocate one more for the sentinel. */
+	dev->hogs = kcalloc(num_hogs + 1, sizeof(*dev->hogs), GFP_KERNEL);
+	if (!dev->hogs)
+		return -ENOMEM;
+
+	list_for_each_entry(bank, &dev->bank_list, siblings) {
+		list_for_each_entry(line, &bank->line_list, siblings) {
+			if (!line->hog)
+				continue;
+
+			hog = &dev->hogs[idx++];
+
+			/*
+			 * We need to make this string manually because at this
+			 * point the device doesn't exist yet and so dev_name()
+			 * is not available.
+			 */
+			hog->chip_label = kasprintf(GFP_KERNEL,
+						    "gpio-sim.%u-%s", dev->id,
+						    fwnode_get_name(bank->swnode));
+			if (!hog->chip_label) {
+				gpio_sim_remove_hogs(dev);
+				return -ENOMEM;
+			}
+
+			/*
+			 * We need to duplicate this because the hog config
+			 * item can be removed at any time (and we can't block
+			 * it) and gpiolib doesn't make a deep copy of the hog
+			 * data.
+			 */
+			if (line->hog->name) {
+				hog->line_name = kstrdup(line->hog->name,
+							 GFP_KERNEL);
+				if (!hog->line_name) {
+					gpio_sim_remove_hogs(dev);
+					return -ENOMEM;
+				}
+			}
+
+			hog->chip_hwnum = line->offset;
+			hog->dflags = line->hog->dir;
+		}
+	}
+
+	gpiod_add_hogs(dev->hogs);
+
+	return 0;
+}
+
+static struct fwnode_handle *
+gpio_sim_make_bank_swnode(struct gpio_sim_bank *bank,
+			  struct fwnode_handle *parent)
+{
+	struct property_entry properties[GPIO_SIM_PROP_MAX];
+	unsigned int prop_idx = 0, line_names_size = 0;
+	struct fwnode_handle *swnode;
+	char **line_names;
+
+	memset(properties, 0, sizeof(properties));
+
+	properties[prop_idx++] = PROPERTY_ENTRY_U32("ngpios", bank->num_lines);
+
+	if (bank->label)
+		properties[prop_idx++] = PROPERTY_ENTRY_STRING("gpio-sim,label",
+							       bank->label);
+
+	line_names = gpio_sim_make_line_names(bank, &line_names_size);
+	if (IS_ERR(line_names))
+		return ERR_CAST(line_names);
+
+	if (line_names)
+		properties[prop_idx++] = PROPERTY_ENTRY_STRING_ARRAY_LEN(
+						"gpio-line-names",
+						line_names, line_names_size);
+
+	swnode = fwnode_create_software_node(properties, parent);
+	kfree(line_names);
+	return swnode;
+}
+
+static void gpio_sim_remove_swnode_recursive(struct fwnode_handle *swnode)
+{
+	struct fwnode_handle *child;
+
+	fwnode_for_each_child_node(swnode, child)
+		fwnode_remove_software_node(child);
+
+	fwnode_remove_software_node(swnode);
+}
+
+static bool gpio_sim_bank_labels_non_unique(struct gpio_sim_device *dev)
+{
+	struct gpio_sim_bank *this, *pos;
+
+	list_for_each_entry(this, &dev->bank_list, siblings) {
+		list_for_each_entry(pos, &dev->bank_list, siblings) {
+			if (this == pos || (!this->label || !pos->label))
+				continue;
+
+			if (strcmp(this->label, pos->label) == 0)
+				return true;
+		}
+	}
+
+	return false;
+}
+
+static int gpio_sim_device_activate_unlocked(struct gpio_sim_device *dev)
+{
+	struct platform_device_info pdevinfo;
+	struct fwnode_handle *swnode;
+	struct platform_device *pdev;
+	struct gpio_sim_bank *bank;
+	int ret;
+
+	if (list_empty(&dev->bank_list))
+		return -ENODATA;
+
+	/*
+	 * Non-unique GPIO device labels are a corner-case we don't support
+	 * as it would interfere with machine hogging mechanism and has little
+	 * use in real life.
+	 */
+	if (gpio_sim_bank_labels_non_unique(dev))
+		return -EINVAL;
+
+	memset(&pdevinfo, 0, sizeof(pdevinfo));
+
+	swnode = fwnode_create_software_node(NULL, NULL);
+	if (IS_ERR(swnode))
+		return PTR_ERR(swnode);
+
+	list_for_each_entry(bank, &dev->bank_list, siblings) {
+		bank->swnode = gpio_sim_make_bank_swnode(bank, swnode);
+		if (ret) {
+			gpio_sim_remove_swnode_recursive(swnode);
+			return ret;
+		}
+	}
+
+	ret = gpio_sim_add_hogs(dev);
+	if (ret) {
+		gpio_sim_remove_swnode_recursive(swnode);
+		return ret;
+	}
+
+	pdevinfo.name = "gpio-sim";
+	pdevinfo.fwnode = swnode;
+	pdevinfo.id = dev->id;
+
+	reinit_completion(&dev->probe_completion);
+	dev->driver_bound = false;
+	bus_register_notifier(&platform_bus_type, &dev->bus_notifier);
+
+	pdev = platform_device_register_full(&pdevinfo);
+	if (IS_ERR(pdev)) {
+		bus_unregister_notifier(&platform_bus_type, &dev->bus_notifier);
+		gpio_sim_remove_hogs(dev);
+		gpio_sim_remove_swnode_recursive(swnode);
+		return PTR_ERR(pdev);
+	}
+
+	wait_for_completion(&dev->probe_completion);
+	bus_unregister_notifier(&platform_bus_type, &dev->bus_notifier);
+
+	if (!dev->driver_bound) {
+		/* Probe failed, check kernel log. */
+		platform_device_unregister(pdev);
+		gpio_sim_remove_hogs(dev);
+		gpio_sim_remove_swnode_recursive(swnode);
+		return -ENXIO;
+	}
+
+	dev->pdev = pdev;
+
+	return 0;
+}
+
+static void gpio_sim_device_deactivate_unlocked(struct gpio_sim_device *dev)
+{
+	struct fwnode_handle *swnode;
+
+	swnode = dev_fwnode(&dev->pdev->dev);
+	platform_device_unregister(dev->pdev);
+	gpio_sim_remove_swnode_recursive(swnode);
+	dev->pdev = NULL;
+	gpio_sim_remove_hogs(dev);
+}
+
+static ssize_t
+gpio_sim_device_config_live_store(struct config_item *item,
+				  const char *page, size_t count)
+{
+	struct gpio_sim_device *dev = to_gpio_sim_device(item);
+	int live, ret;
+
+	ret = kstrtouint(page, 10, &live);
+	if (ret)
+		return ret;
+
+	mutex_lock(&dev->lock);
+
+	if ((live == 0 && !gpio_sim_device_is_live_unlocked(dev)) ||
+	    (live == 1 && gpio_sim_device_is_live_unlocked(dev)))
+		ret = -EPERM;
+	else if (live == 1)
+		ret = gpio_sim_device_activate_unlocked(dev);
+	else if (live == 0)
+		gpio_sim_device_deactivate_unlocked(dev);
+	else
+		ret = -EINVAL;
+
+	mutex_unlock(&dev->lock);
+
+	return ret ?: count;
+}
+
+CONFIGFS_ATTR(gpio_sim_device_config_, live);
+
+static struct configfs_attribute *gpio_sim_device_config_attrs[] = {
+	&gpio_sim_device_config_attr_dev_name,
+	&gpio_sim_device_config_attr_live,
+	NULL
+};
+
+struct gpio_sim_chip_name_ctx {
+	struct gpio_sim_device *dev;
+	char *page;
+};
+
+static int gpio_sim_emit_chip_name(struct device *dev, void *data)
+{
+	struct gpio_sim_chip_name_ctx *ctx = data;
+	struct fwnode_handle *swnode;
+	struct gpio_sim_bank *bank;
+
+	/* This would be the sysfs device exported in /sys/class/gpio. */
+	if (dev->class)
+		return 0;
+
+	swnode = dev_fwnode(dev);
+
+	list_for_each_entry(bank, &ctx->dev->bank_list, siblings) {
+		if (bank->swnode == swnode)
+			return sprintf(ctx->page, "%s\n", dev_name(dev));
+	}
+
+	return -ENODATA;
+}
+
+static ssize_t gpio_sim_bank_config_chip_name_show(struct config_item *item,
+						   char *page)
+{
+	struct gpio_sim_bank *bank = to_gpio_sim_bank(item);
+	struct gpio_sim_device *dev = gpio_sim_bank_get_device(bank);
+	struct gpio_sim_chip_name_ctx ctx = { dev, page };
+	int ret;
+
+	mutex_lock(&dev->lock);
+	if (gpio_sim_device_is_live_unlocked(dev))
+		ret = device_for_each_child(&dev->pdev->dev, &ctx,
+					    gpio_sim_emit_chip_name);
+	else
+		ret = sprintf(page, "none\n");
+	mutex_unlock(&dev->lock);
+
+	return ret;
+}
+
+CONFIGFS_ATTR_RO(gpio_sim_bank_config_, chip_name);
+
+static ssize_t
+gpio_sim_bank_config_label_show(struct config_item *item, char *page)
+{
+	struct gpio_sim_bank *bank = to_gpio_sim_bank(item);
+	struct gpio_sim_device *dev = gpio_sim_bank_get_device(bank);
+	int ret;
+
+	mutex_lock(&dev->lock);
+	ret = sprintf(page, "%s\n", bank->label ?: "");
+	mutex_unlock(&dev->lock);
+
+	return ret;
+}
+
+static ssize_t gpio_sim_bank_config_label_store(struct config_item *item,
+						const char *page, size_t count)
+{
+	struct gpio_sim_bank *bank = to_gpio_sim_bank(item);
+	struct gpio_sim_device *dev = gpio_sim_bank_get_device(bank);
+	char *trimmed;
+
+	mutex_lock(&dev->lock);
+
+	if (gpio_sim_device_is_live_unlocked(dev)) {
+		mutex_unlock(&dev->lock);
+		return -EBUSY;
+	}
+
+	trimmed = gpio_sim_strdup_trimmed(page, count);
+	if (!trimmed) {
+		mutex_unlock(&dev->lock);
+		return -ENOMEM;
+	}
+
+	kfree(bank->label);
+	bank->label = trimmed;
+
+	mutex_unlock(&dev->lock);
+	return count;
+}
+
+CONFIGFS_ATTR(gpio_sim_bank_config_, label);
+
+static ssize_t
+gpio_sim_bank_config_num_lines_show(struct config_item *item, char *page)
+{
+	struct gpio_sim_bank *bank = to_gpio_sim_bank(item);
+	struct gpio_sim_device *dev = gpio_sim_bank_get_device(bank);
+	int ret;
+
+	mutex_lock(&dev->lock);
+	ret = sprintf(page, "%u\n", bank->num_lines);
+	mutex_unlock(&dev->lock);
+
+	return ret;
+}
+
+static ssize_t
+gpio_sim_bank_config_num_lines_store(struct config_item *item,
+				     const char *page, size_t count)
+{
+	struct gpio_sim_bank *bank = to_gpio_sim_bank(item);
+	struct gpio_sim_device *dev = gpio_sim_bank_get_device(bank);
+	unsigned int num_lines;
+	int ret;
+
+	ret = kstrtouint(page, 10, &num_lines);
+	if (ret)
+		return ret;
+
+	if (num_lines == 0)
+		return -EINVAL;
+
+	mutex_lock(&dev->lock);
+
+	if (gpio_sim_device_is_live_unlocked(dev)) {
+		mutex_unlock(&dev->lock);
+		return -EBUSY;
+	}
+
+	bank->num_lines = num_lines;
+
+	mutex_unlock(&dev->lock);
+	return count;
+}
+
+CONFIGFS_ATTR(gpio_sim_bank_config_, num_lines);
+
+static struct configfs_attribute *gpio_sim_bank_config_attrs[] = {
+	&gpio_sim_bank_config_attr_chip_name,
+	&gpio_sim_bank_config_attr_label,
+	&gpio_sim_bank_config_attr_num_lines,
+	NULL
+};
+
+static ssize_t
+gpio_sim_line_config_name_show(struct config_item *item, char *page)
+{
+	struct gpio_sim_line *line = to_gpio_sim_line(item);
+	struct gpio_sim_device *dev = gpio_sim_line_get_device(line);
+	int ret;
+
+	mutex_lock(&dev->lock);
+	ret = sprintf(page, "%s\n", line->name ?: "");
+	mutex_unlock(&dev->lock);
+
+	return ret;
+}
+
+static ssize_t gpio_sim_line_config_name_store(struct config_item *item,
+					       const char *page, size_t count)
+{
+	struct gpio_sim_line *line = to_gpio_sim_line(item);
+	struct gpio_sim_device *dev = gpio_sim_line_get_device(line);
+	char *trimmed;
+
+	mutex_lock(&dev->lock);
+
+	if (gpio_sim_device_is_live_unlocked(dev)) {
+		mutex_unlock(&dev->lock);
+		return -EBUSY;
+	}
+
+	trimmed = gpio_sim_strdup_trimmed(page, count);
+	if (!trimmed) {
+		mutex_unlock(&dev->lock);
+		return -ENOMEM;
+	}
+
+	kfree(line->name);
+	line->name = trimmed;
+
+	mutex_unlock(&dev->lock);
+
+	return count;
+}
+
+CONFIGFS_ATTR(gpio_sim_line_config_, name);
+
+static struct configfs_attribute *gpio_sim_line_config_attrs[] = {
+	&gpio_sim_line_config_attr_name,
+	NULL,
+};
+
+static ssize_t gpio_sim_hog_config_name_show(struct config_item *item,
+					     char *page)
+{
+	struct gpio_sim_hog *hog = to_gpio_sim_hog(item);
+	struct gpio_sim_device *dev = gpio_sim_hog_get_device(hog);
+	int ret;
+
+	mutex_lock(&dev->lock);
+	ret = sprintf(page, "%s\n", hog->name ?: "");
+	mutex_unlock(&dev->lock);
+
+	return ret;
+}
+
+static ssize_t gpio_sim_hog_config_name_store(struct config_item *item,
+					      const char *page, size_t count)
+{
+	struct gpio_sim_hog *hog = to_gpio_sim_hog(item);
+	struct gpio_sim_device *dev = gpio_sim_hog_get_device(hog);
+	char *trimmed;
+
+	mutex_lock(&dev->lock);
+
+	if (gpio_sim_device_is_live_unlocked(dev)) {
+		mutex_unlock(&dev->lock);
+		return -EBUSY;
+	}
+
+	trimmed = gpio_sim_strdup_trimmed(page, count);
+	if (!trimmed) {
+		mutex_unlock(&dev->lock);
+		return -ENOMEM;
+	}
+
+	kfree(hog->name);
+	hog->name = trimmed;
+
+	mutex_unlock(&dev->lock);
+
+	return count;
+}
+
+CONFIGFS_ATTR(gpio_sim_hog_config_, name);
+
+static ssize_t gpio_sim_hog_config_direction_show(struct config_item *item,
+						  char *page)
+{
+	struct gpio_sim_hog *hog = to_gpio_sim_hog(item);
+	struct gpio_sim_device *dev = gpio_sim_hog_get_device(hog);
+	char *repr;
+	int dir;
+
+	mutex_lock(&dev->lock);
+	dir = hog->dir;
+	mutex_unlock(&dev->lock);
+
+	switch (dir) {
+	case GPIOD_IN:
+		repr = "input";
+		break;
+	case GPIOD_OUT_HIGH:
+		repr = "output-high";
+		break;
+	case GPIOD_OUT_LOW:
+		repr = "output-low";
+		break;
+	default:
+		/* This would be a programmer bug. */
+		WARN(1, "Unexpected hog direction value: %d", dir);
+		return -EINVAL;
+	}
+
+	return sprintf(page, "%s\n", repr);
+}
+
+static ssize_t
+gpio_sim_hog_config_direction_store(struct config_item *item,
+				    const char *page, size_t count)
+{
+	struct gpio_sim_hog *hog = to_gpio_sim_hog(item);
+	struct gpio_sim_device *dev = gpio_sim_hog_get_device(hog);
+	char *trimmed;
+	int dir;
+
+	mutex_lock(&dev->lock);
+
+	if (gpio_sim_device_is_live_unlocked(dev)) {
+		mutex_unlock(&dev->lock);
+		return -EBUSY;
+	}
+
+	trimmed = gpio_sim_strdup_trimmed(page, count);
+	if (!trimmed) {
+		mutex_unlock(&dev->lock);
+		return -ENOMEM;
+	}
+
+	if (strcmp(trimmed, "input") == 0)
+		dir = GPIOD_IN;
+	else if (strcmp(trimmed, "output-high") == 0)
+		dir = GPIOD_OUT_HIGH;
+	else if (strcmp(trimmed, "output-low") == 0)
+		dir = GPIOD_OUT_LOW;
+	else
+		dir = -EINVAL;
+
+	kfree(trimmed);
+
+	if (dir < 0) {
+		mutex_unlock(&dev->lock);
+		return dir;
+	}
+
+	hog->dir = dir;
+
+	mutex_unlock(&dev->lock);
+
+	return count;
+}
+
+CONFIGFS_ATTR(gpio_sim_hog_config_, direction);
+
+static struct configfs_attribute *gpio_sim_hog_config_attrs[] = {
+	&gpio_sim_hog_config_attr_name,
+	&gpio_sim_hog_config_attr_direction,
+	NULL,
+};
+
+static void gpio_sim_hog_config_item_release(struct config_item *item)
+{
+	struct gpio_sim_hog *hog = to_gpio_sim_hog(item);
+	struct gpio_sim_line *line = hog->parent;
+	struct gpio_sim_device *dev = gpio_sim_hog_get_device(hog);
+
+	mutex_lock(&dev->lock);
+	line->hog = NULL;
+	mutex_unlock(&dev->lock);
+
+	kfree(hog->name);
+	kfree(hog);
+}
+
+struct configfs_item_operations gpio_sim_hog_config_item_ops = {
+	.release	= gpio_sim_hog_config_item_release,
+};
+
+static const struct config_item_type gpio_sim_hog_config_type = {
+	.ct_item_ops	= &gpio_sim_hog_config_item_ops,
+	.ct_attrs	= gpio_sim_hog_config_attrs,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_item *
+gpio_sim_line_config_make_hog_item(struct config_group *group, const char *name)
+{
+	struct gpio_sim_line *line = to_gpio_sim_line(&group->cg_item);
+	struct gpio_sim_device *dev = gpio_sim_line_get_device(line);
+	struct gpio_sim_hog *hog;
+
+	if (strcmp(name, "hog") != 0)
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&dev->lock);
+
+	hog = kzalloc(sizeof(*hog), GFP_KERNEL);
+	if (!hog) {
+		mutex_unlock(&dev->lock);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	config_item_init_type_name(&hog->item, name,
+				   &gpio_sim_hog_config_type);
+
+	hog->dir = GPIOD_IN;
+	hog->name = NULL;
+	hog->parent = line;
+	line->hog = hog;
+
+	mutex_unlock(&dev->lock);
+
+	return &hog->item;
+}
+
+static void gpio_sim_line_config_group_release(struct config_item *item)
+{
+	struct gpio_sim_line *line = to_gpio_sim_line(item);
+	struct gpio_sim_device *dev = gpio_sim_line_get_device(line);
+
+	mutex_lock(&dev->lock);
+	list_del(&line->siblings);
+	mutex_unlock(&dev->lock);
+
+	kfree(line->name);
+	kfree(line);
+}
+
+static struct configfs_item_operations gpio_sim_line_config_item_ops = {
+	.release	= gpio_sim_line_config_group_release,
+};
+
+static struct configfs_group_operations gpio_sim_line_config_group_ops = {
+	.make_item	= gpio_sim_line_config_make_hog_item,
+};
+
+static const struct config_item_type gpio_sim_line_config_type = {
+	.ct_item_ops	= &gpio_sim_line_config_item_ops,
+	.ct_group_ops	= &gpio_sim_line_config_group_ops,
+	.ct_attrs	= gpio_sim_line_config_attrs,
+	.ct_owner       = THIS_MODULE,
+};
+
+static struct config_group *
+gpio_sim_bank_config_make_line_group(struct config_group *group,
+				     const char *name)
+{
+	struct gpio_sim_bank *bank = to_gpio_sim_bank(&group->cg_item);
+	struct gpio_sim_device *dev = gpio_sim_bank_get_device(bank);
+	struct gpio_sim_line *line;
+	unsigned int offset;
+	int ret, nchar;
+
+	ret = sscanf(name, "line%u%n", &offset, &nchar);
+	if (ret != 1 || nchar != strlen(name))
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&dev->lock);
+
+	if (gpio_sim_device_is_live_unlocked(dev)) {
+		mutex_unlock(&dev->lock);
+		return ERR_PTR(-EBUSY);
+	}
+
+	line = kzalloc(sizeof(*line), GFP_KERNEL);
+	if (!line) {
+		mutex_unlock(&dev->lock);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	config_group_init_type_name(&line->group, name,
+				    &gpio_sim_line_config_type);
+
+	line->parent = bank;
+	line->offset = offset;
+	list_add_tail(&line->siblings, &bank->line_list);
+
+	mutex_unlock(&dev->lock);
+
+	return &line->group;
+}
+
+static void gpio_sim_bank_config_group_release(struct config_item *item)
+{
+	struct gpio_sim_bank *bank = to_gpio_sim_bank(item);
+	struct gpio_sim_device *dev = gpio_sim_bank_get_device(bank);
+
+	mutex_lock(&dev->lock);
+	list_del(&bank->siblings);
+	mutex_unlock(&dev->lock);
+
+	kfree(bank->label);
+	kfree(bank);
+}
+
+static struct configfs_item_operations gpio_sim_bank_config_item_ops = {
+	.release	= gpio_sim_bank_config_group_release,
+};
+
+static struct configfs_group_operations gpio_sim_bank_config_group_ops = {
+	.make_group	= gpio_sim_bank_config_make_line_group,
+};
+
+static const struct config_item_type gpio_sim_bank_config_group_type = {
+	.ct_item_ops	= &gpio_sim_bank_config_item_ops,
+	.ct_group_ops	= &gpio_sim_bank_config_group_ops,
+	.ct_attrs	= gpio_sim_bank_config_attrs,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_group *
+gpio_sim_device_config_make_bank_group(struct config_group *group,
+				       const char *name)
+{
+	struct gpio_sim_device *dev = to_gpio_sim_device(&group->cg_item);
+	struct gpio_sim_bank *bank;
+
+	mutex_lock(&dev->lock);
+
+	if (gpio_sim_device_is_live_unlocked(dev)) {
+		mutex_unlock(&dev->lock);
+		return ERR_PTR(-EBUSY);
+	}
+
+	bank = kzalloc(sizeof(*bank), GFP_KERNEL);
+	if (!bank) {
+		mutex_unlock(&dev->lock);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	config_group_init_type_name(&bank->group, name,
+				    &gpio_sim_bank_config_group_type);
+	bank->num_lines = 1;
+	bank->parent = dev;
+	INIT_LIST_HEAD(&bank->line_list);
+	list_add_tail(&bank->siblings, &dev->bank_list);
+
+	mutex_unlock(&dev->lock);
+
+	return &bank->group;
+}
+
+static void gpio_sim_device_config_group_release(struct config_item *item)
+{
+	struct gpio_sim_device *dev = to_gpio_sim_device(item);
+
+	mutex_lock(&dev->lock);
+	if (gpio_sim_device_is_live_unlocked(dev))
+		gpio_sim_device_deactivate_unlocked(dev);
+	mutex_unlock(&dev->lock);
+
+	mutex_destroy(&dev->lock);
+	ida_free(&gpio_sim_ida, dev->id);
+	kfree(dev);
+}
+
+static struct configfs_item_operations gpio_sim_device_config_item_ops = {
+	.release	= gpio_sim_device_config_group_release,
+};
+
+static struct configfs_group_operations gpio_sim_device_config_group_ops = {
+	.make_group	= gpio_sim_device_config_make_bank_group,
+};
+
+static const struct config_item_type gpio_sim_device_config_group_type = {
+	.ct_item_ops	= &gpio_sim_device_config_item_ops,
+	.ct_group_ops	= &gpio_sim_device_config_group_ops,
+	.ct_attrs	= gpio_sim_device_config_attrs,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_group *
+gpio_sim_config_make_device_group(struct config_group *group, const char *name)
+{
+	struct gpio_sim_device *dev;
+	int id;
+
+	dev = kzalloc(sizeof(*dev), GFP_KERNEL);
+	if (!dev)
+		return ERR_PTR(-ENOMEM);
+
+	id = ida_alloc(&gpio_sim_ida, GFP_KERNEL);
+	if (id < 0) {
+		kfree(dev);
+		return ERR_PTR(id);
+	}
+
+	config_group_init_type_name(&dev->group, name,
+				    &gpio_sim_device_config_group_type);
+	dev->id = id;
+	mutex_init(&dev->lock);
+	INIT_LIST_HEAD(&dev->bank_list);
+
+	dev->bus_notifier.notifier_call = gpio_sim_bus_notifier_call;
+	init_completion(&dev->probe_completion);
+
+	return &dev->group;
+}
+
+static struct configfs_group_operations gpio_sim_config_group_ops = {
+	.make_group	= gpio_sim_config_make_device_group,
+};
+
+static const struct config_item_type gpio_sim_config_type = {
+	.ct_group_ops	= &gpio_sim_config_group_ops,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct configfs_subsystem gpio_sim_config_subsys = {
+	.su_group = {
+		.cg_item = {
+			.ci_namebuf	= "gpio-sim",
+			.ci_type	= &gpio_sim_config_type,
+		},
+	},
+};
+
+static int __init gpio_sim_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&gpio_sim_driver);
+	if (ret) {
+		pr_err("Error %d while registering the platform driver\n", ret);
+		return ret;
+	}
+
+	config_group_init(&gpio_sim_config_subsys.su_group);
+	mutex_init(&gpio_sim_config_subsys.su_mutex);
+	ret = configfs_register_subsystem(&gpio_sim_config_subsys);
+	if (ret) {
+		pr_err("Error %d while registering the configfs subsystem %s\n",
+		       ret, gpio_sim_config_subsys.su_group.cg_item.ci_namebuf);
+		mutex_destroy(&gpio_sim_config_subsys.su_mutex);
+		platform_driver_unregister(&gpio_sim_driver);
+		return ret;
+	}
+
+	return 0;
+}
+module_init(gpio_sim_init);
+
+static void __exit gpio_sim_exit(void)
+{
+	configfs_unregister_subsystem(&gpio_sim_config_subsys);
+	mutex_destroy(&gpio_sim_config_subsys.su_mutex);
+	platform_driver_unregister(&gpio_sim_driver);
+}
+module_exit(gpio_sim_exit);
+
+MODULE_AUTHOR("Bartosz Golaszewski <brgl@bgdev.pl");
+MODULE_DESCRIPTION("GPIO Simulator Module");
+MODULE_LICENSE("GPL");
-- 
2.25.1

