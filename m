Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12FCB33307C
	for <lists+linux-gpio@lfdr.de>; Tue,  9 Mar 2021 22:00:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232063AbhCIVAN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 9 Mar 2021 16:00:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231970AbhCIU7m (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Mar 2021 15:59:42 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66973C06175F
        for <linux-gpio@vger.kernel.org>; Tue,  9 Mar 2021 12:59:41 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id l11so15126925wrp.7
        for <linux-gpio@vger.kernel.org>; Tue, 09 Mar 2021 12:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ItiZOkb9LXwdXIAzNxaU55PAysGpACGNcO54wLmkmU0=;
        b=DU8DyLD+0C8D3ukYtrlE783YpBa0ILCNShFqQF2Gk1krfu7VdOB45AAvmiurTutyEm
         gpoa0AVs2u7qX+lGg7wz5GJi299gJFAih+i8mud90+J6n1nCA/ktMT026EGas2sXe4Yy
         TxO0cOdh9dTrGVUUG2gx0yaTeuWycJCIL2Isugf4lTeCWU0HnwBh6c2ImjcgI1u9HQ+4
         xhKylfkRLqIm98DhdVIQUMqDWKnpGb/LVVx/mr/B8x42d6bVNVQYtAKklNcRp8TneJkR
         KZ+6s+jj72QbTLJJUuh41vZxd+neW6yO4VvT6lBVoVNR1L1AobX8aSEZrSoHsBO/dFBu
         kBoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ItiZOkb9LXwdXIAzNxaU55PAysGpACGNcO54wLmkmU0=;
        b=uD5k6JSBD5LiFzp1o3UQUmnZ/rEPXequdX0sMkT33UCWoSr+w79A19xN+JTUeBWqmU
         Vs7ARkLTTbcvAzguOuVk6Kaix/p3PTsp+r7kflmwKPgJgH6KToPqxZWhCQWii8EwbleT
         i7brNcI6dbaQhYpobSHqcSIYy5fBo5AYnGgpQkmHKC2MPnlRBd2VPsdB6YHLrrTd0aAx
         QGWsd49eamufO6Pkdim3gjEF6Oq9sHCs3BWv1ETSQJYysuJO0x9UQtq+y1eMvILReVva
         zD4EguaKLcjPjbabYvSTeHh90wwCtij9Tl8qEsoEuqI7XduL0L0u5FQ2SZqoPn/sE5SF
         9e0g==
X-Gm-Message-State: AOAM533yoNKMaQh0xVObbR4kSzFdI03mxGvvocFW2NjmeFhv3AVSp0TT
        F4HDdUx+N3/2aJQybLQyPG1RAg==
X-Google-Smtp-Source: ABdhPJzAvqvQ14Pa7hGqRwzPSN++HYdTTN5BKp0V9kjwj51LgN+D0zRlgoIv2A0IeKPLO3VpKdtaaw==
X-Received: by 2002:adf:f711:: with SMTP id r17mr30431852wrp.358.1615323580008;
        Tue, 09 Mar 2021 12:59:40 -0800 (PST)
Received: from debian-brgl.home (amarseille-656-1-4-167.w90-8.abo.wanadoo.fr. [90.8.158.167])
        by smtp.gmail.com with ESMTPSA id j6sm5501305wmq.16.2021.03.09.12.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Mar 2021 12:59:39 -0800 (PST)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Joel Becker <jlbec@evilplan.org>, Christoph Hellwig <hch@lst.de>,
        Shuah Khan <shuah@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH v3 08/11] gpio: sim: new testing module
Date:   Tue,  9 Mar 2021 21:59:18 +0100
Message-Id: <20210309205921.15992-9-brgl@bgdev.pl>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210309205921.15992-1-brgl@bgdev.pl>
References: <20210309205921.15992-1-brgl@bgdev.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Implement a new, modern GPIO testing module controlled by configfs
attributes instead of module parameters. The goal of this driver is
to provide a replacement for gpio-mockup that will be easily extensible
with new features and doesn't require reloading the module to change
the setup.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 Documentation/admin-guide/gpio/gpio-sim.rst |  72 ++
 drivers/gpio/Kconfig                        |   8 +
 drivers/gpio/Makefile                       |   1 +
 drivers/gpio/gpio-sim.c                     | 879 ++++++++++++++++++++
 4 files changed, 960 insertions(+)
 create mode 100644 Documentation/admin-guide/gpio/gpio-sim.rst
 create mode 100644 drivers/gpio/gpio-sim.c

diff --git a/Documentation/admin-guide/gpio/gpio-sim.rst b/Documentation/admin-guide/gpio/gpio-sim.rst
new file mode 100644
index 000000000000..08eac487e35e
--- /dev/null
+++ b/Documentation/admin-guide/gpio/gpio-sim.rst
@@ -0,0 +1,72 @@
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
+The gpio-sim module registers a configfs subsystem called 'gpio-sim'. It's a
+subsystem with committable items which means two subdirectories are created in
+the filesystem: pending and live. For more information on configfs and
+committable items, please refer to Documentation/filesystems/configfs.rst.
+
+In order to instantiate a new simulated chip, the user needs to mkdir() a new
+directory in pending/. Inside each new directory, there's a set of attributes
+that can be used to configure the new chip. Once the configuration is complete,
+the user needs to use rename() to move the chip to the live/ directory. This
+creates and registers the new device.
+
+In order to destroy a simulated chip, it has to be moved back to pending first
+and then removed using rmdir().
+
+Currently supported configuration attributes are:
+
+  num_lines - an unsigned integer value defining the number of GPIO lines to
+              export
+
+  label - a string defining the label for the GPIO chip
+
+  line_names - a list of GPIO line names in the form of quoted strings
+               separated by commas, e.g.: '"foo", "bar", "", "foobar"'. The
+               number of strings doesn't have to be equal to the value set in
+               the num_lines attribute. If it's lower than the number of lines,
+               the remaining lines are unnamed. If it's larger, the superfluous
+               lines are ignored. A name of the form: '""' means the line
+               should be unnamed.
+
+Additionally two read-only attributes named 'chip_name' and 'dev_name' are
+exposed in order to provide users with a mapping from configfs directories to
+the actual devices created in the kernel. The former returns the name of the
+GPIO device as assigned by gpiolib (i.e. "gpiochip0", "gpiochip1", etc.). The
+latter returns the parent device name as defined by the gpio-sim driver (i.e.
+"gpio-sim.0", "gpio-sim.1", etc.). This allows user-space to map the configfs
+items both to the correct character device file as well as the associated entry
+in sysfs.
+
+Simulated GPIO chips can also be defined in device-tree. The compatible string
+must be: "gpio-simulator". Supported properties are:
+
+  "gpio-sim,label" - chip label
+
+  "gpio-sim,nr-gpios" - number of lines
+
+Other standard GPIO properties (like "gpio-line-names" and gpio-hog) are also
+supported.
+
+Manipulating simulated lines
+----------------------------
+
+Each simulated GPIO chip creates a sysfs attribute group under its device
+directory called 'line-ctrl'. Inside each group, there's a separate attribute
+for each GPIO line. The name of the attribute is of the form 'gpioX' where X
+is the line's offset in the chip.
+
+Reading from a line attribute returns the current value. Writing to it (0 or 1)
+changes the configuration of the simulated pull-up/pull-down resistor
+(1 - pull-up, 0 - pull-down).
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index e3607ec4c2e8..b6b6150d0d04 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1633,6 +1633,14 @@ config GPIO_MOCKUP
 	  tools/testing/selftests/gpio/gpio-mockup.sh. Reference the usage in
 	  it.
 
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
index c58a90a3c3b1..d717aa85f8e1 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -130,6 +130,7 @@ obj-$(CONFIG_GPIO_SAMA5D2_PIOBU)	+= gpio-sama5d2-piobu.o
 obj-$(CONFIG_GPIO_SCH311X)		+= gpio-sch311x.o
 obj-$(CONFIG_GPIO_SCH)			+= gpio-sch.o
 obj-$(CONFIG_GPIO_SIFIVE)		+= gpio-sifive.o
+obj-$(CONFIG_GPIO_SIM)			+= gpio-sim.o
 obj-$(CONFIG_GPIO_SIOX)			+= gpio-siox.o
 obj-$(CONFIG_GPIO_SL28CPLD)		+= gpio-sl28cpld.o
 obj-$(CONFIG_GPIO_SODAVILLE)		+= gpio-sodaville.o
diff --git a/drivers/gpio/gpio-sim.c b/drivers/gpio/gpio-sim.c
new file mode 100644
index 000000000000..253f5b4bd1f5
--- /dev/null
+++ b/drivers/gpio/gpio-sim.c
@@ -0,0 +1,879 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * GPIO testing driver based on configfs.
+ *
+ * Copyright (C) 2021 Bartosz Golaszewski <bgolaszewski@baylibre.com>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/bitmap.h>
+#include <linux/configfs.h>
+#include <linux/device.h>
+#include <linux/gpio/driver.h>
+#include <linux/idr.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irq_sim.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/string_helpers.h>
+#include <linux/sysfs.h>
+
+#include "gpiolib.h"
+
+/*
+ * This normally should correspond with the number of attributes exposed over
+ * configfs + sentinel.
+ */
+#define GPIO_SIM_MAX_PROP 4
+
+static DEFINE_IDA(gpio_sim_ida);
+
+struct gpio_sim_chip {
+	struct gpio_chip gc;
+	unsigned long *directions;
+	unsigned long *values;
+	unsigned long *pulls;
+	struct irq_domain *irq_sim;
+	struct mutex lock;
+	struct attribute_group attr_group;
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
+		curr_val = !!test_bit(offset, chip->values);
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
+		__assign_bit(offset, chip->values, value);
+
+set_pull:
+	__assign_bit(offset, chip->pulls, value);
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
+	ret = !!test_bit(offset, chip->values);
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
+	__assign_bit(offset, chip->values, value);
+	mutex_unlock(&chip->lock);
+}
+
+static int gpio_sim_get_multiple(struct gpio_chip *gc,
+				 unsigned long *mask, unsigned long *bits)
+{
+	struct gpio_sim_chip *chip = gpiochip_get_data(gc);
+
+	mutex_lock(&chip->lock);
+	bitmap_copy(bits, chip->values, gc->ngpio);
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
+	bitmap_copy(chip->values, bits, gc->ngpio);
+	mutex_unlock(&chip->lock);
+}
+
+static int gpio_sim_direction_output(struct gpio_chip *gc,
+				     unsigned int offset, int value)
+{
+	struct gpio_sim_chip *chip = gpiochip_get_data(gc);
+
+	mutex_lock(&chip->lock);
+	__clear_bit(offset, chip->directions);
+	__assign_bit(offset, chip->values, value);
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
+	__set_bit(offset, chip->directions);
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
+	direction = !!test_bit(offset, chip->directions);
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
+	__assign_bit(offset, chip->values, !!test_bit(offset, chip->pulls));
+	mutex_unlock(&chip->lock);
+}
+
+static ssize_t gpio_sim_sysfs_line_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
+	struct gpio_sim_chip *chip = dev_get_drvdata(dev);
+	int ret;
+
+	mutex_lock(&chip->lock);
+	ret = sprintf(buf, "%u\n", !!test_bit(line_attr->offset, chip->values));
+	mutex_unlock(&chip->lock);
+
+	return ret;
+}
+
+static ssize_t gpio_sim_sysfs_line_store(struct device *dev,
+					 struct device_attribute *attr,
+					 const char *buf, size_t len)
+{
+	struct gpio_sim_attribute *line_attr = to_gpio_sim_attr(attr);
+	struct gpio_sim_chip *chip = dev_get_drvdata(dev);
+	int ret, val;
+
+	if (len > 2 || (buf[0] != '0' && buf[0] != '1'))
+		return -EINVAL;
+
+	val = buf[0] == '0' ? 0 : 1;
+
+	ret = gpio_sim_apply_pull(chip, line_attr->offset, val);
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
+	sysfs_remove_group(&chip->gc.parent->kobj, &chip->attr_group);
+}
+
+static int gpio_sim_setup_sysfs(struct gpio_sim_chip *chip)
+{
+	unsigned int i, num_lines = chip->gc.ngpio;
+	struct device *dev = chip->gc.parent;
+	struct gpio_sim_attribute *line_attr;
+	struct device_attribute *dev_attr;
+	struct attribute **attrs;
+	int ret;
+
+	attrs = devm_kcalloc(dev, sizeof(*attrs), num_lines + 1, GFP_KERNEL);
+	if (!attrs)
+		return -ENOMEM;
+
+	for (i = 0; i < num_lines; i++) {
+		line_attr = devm_kzalloc(dev, sizeof(*line_attr), GFP_KERNEL);
+		if (!line_attr)
+			return -ENOMEM;
+
+		line_attr->offset = i;
+
+		dev_attr = &line_attr->dev_attr;
+
+		dev_attr->attr.name = devm_kasprintf(dev, GFP_KERNEL,
+						     "gpio%u", i);
+		if (!dev_attr->attr.name)
+			return -ENOMEM;
+
+		dev_attr->attr.mode = 0644;
+
+		dev_attr->show = gpio_sim_sysfs_line_show;
+		dev_attr->store = gpio_sim_sysfs_line_store;
+
+		attrs[i] = &dev_attr->attr;
+	}
+
+	chip->attr_group.name = "line-ctrl";
+	chip->attr_group.attrs = attrs;
+
+	ret = sysfs_create_group(&dev->kobj, &chip->attr_group);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev, gpio_sim_sysfs_remove, chip);
+}
+
+static int gpio_sim_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct gpio_sim_chip *chip;
+	struct gpio_chip *gc;
+	const char *label;
+	u32 num_lines;
+	int ret;
+
+	ret = device_property_read_u32(dev, "gpio-sim,nr-gpios", &num_lines);
+	if (ret)
+		return ret;
+
+	ret = device_property_read_string(dev, "gpio-sim,label", &label);
+	if (ret)
+		label = dev_name(dev);
+
+	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
+	if (!chip)
+		return -ENOMEM;
+
+	chip->directions = devm_bitmap_alloc(dev, num_lines, GFP_KERNEL);
+	if (!chip->directions)
+		return -ENOMEM;
+
+	/* Default to input mode. */
+	bitmap_fill(chip->directions, num_lines);
+
+	chip->values = devm_bitmap_zalloc(dev, num_lines, GFP_KERNEL);
+	if (!chip->values)
+		return -ENOMEM;
+
+	chip->pulls = devm_bitmap_zalloc(dev, num_lines, GFP_KERNEL);
+	if (!chip->pulls)
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
+	dev_set_drvdata(dev, chip);
+
+	ret = gpio_sim_setup_sysfs(chip);
+	if (ret)
+		return ret;
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
+	},
+	.probe = gpio_sim_probe,
+};
+
+struct gpio_sim_chip_config {
+	struct config_item item;
+
+	/*
+	 * If pdev is NULL, the item is 'pending' (waiting for configuration).
+	 * Once the pointer is assigned, the device has been created and the
+	 * item is 'live'.
+	 */
+	struct platform_device *pdev;
+
+	/*
+	 * Each configfs filesystem operation is protected with the subsystem
+	 * mutex. Each separate attribute is protected with the buffer mutex.
+	 * This structure however can be modified by callbacks of different
+	 * attributes so we need another lock.
+	 */
+	struct mutex lock;
+
+	char label[32];
+	unsigned int num_lines;
+	char **line_names;
+	unsigned int num_line_names;
+};
+
+static struct gpio_sim_chip_config *
+to_gpio_sim_chip_config(struct config_item *item)
+{
+	return container_of(item, struct gpio_sim_chip_config, item);
+}
+
+static ssize_t gpio_sim_config_dev_name_show(struct config_item *item,
+					     char *page)
+{
+	struct gpio_sim_chip_config *config = to_gpio_sim_chip_config(item);
+	struct platform_device *pdev;
+	int ret;
+
+	mutex_lock(&config->lock);
+	pdev = config->pdev;
+	if (pdev)
+		ret = sprintf(page, "%s\n", dev_name(&pdev->dev));
+	else
+		ret = sprintf(page, "n/a\n");
+	mutex_unlock(&config->lock);
+
+	return ret;
+}
+
+CONFIGFS_ATTR_RO(gpio_sim_config_, dev_name);
+
+static ssize_t gpio_sim_config_chip_name_show(struct config_item *item,
+					      char *page)
+{
+	struct gpio_sim_chip_config *config = to_gpio_sim_chip_config(item);
+	struct gpio_sim_chip *chip = NULL;
+	struct platform_device *pdev;
+	int ret;
+
+	mutex_lock(&config->lock);
+	pdev = config->pdev;
+	if (pdev)
+		chip = dev_get_drvdata(&pdev->dev);
+
+	if (chip)
+		ret = sprintf(page, "%s\n", dev_name(&chip->gc.gpiodev->dev));
+	else
+		ret = sprintf(page, "n/a\n");
+	mutex_unlock(&config->lock);
+
+	return ret;
+}
+
+CONFIGFS_ATTR_RO(gpio_sim_config_, chip_name);
+
+static ssize_t gpio_sim_config_label_show(struct config_item *item, char *page)
+{
+	struct gpio_sim_chip_config *config = to_gpio_sim_chip_config(item);
+	int ret;
+
+	mutex_lock(&config->lock);
+	ret = sprintf(page, "%s\n", config->label);
+	mutex_unlock(&config->lock);
+
+	return ret;
+}
+
+static ssize_t gpio_sim_config_label_store(struct config_item *item,
+					   const char *page, size_t count)
+{
+	struct gpio_sim_chip_config *config = to_gpio_sim_chip_config(item);
+	char *dup, *trimmed;
+	int ret;
+
+	mutex_lock(&config->lock);
+
+	if (config->pdev) {
+		mutex_unlock(&config->lock);
+		return -EBUSY;
+	}
+
+	dup = kstrndup(page, count, GFP_KERNEL);
+	if (!dup) {
+		mutex_unlock(&config->lock);
+		return -ENOMEM;
+	}
+
+	trimmed = strstrip(dup);
+	ret = snprintf(config->label, sizeof(config->label), "%s", trimmed);
+	kfree(dup);
+	if (ret < 0) {
+		mutex_unlock(&config->lock);
+		return ret;
+	}
+
+	mutex_unlock(&config->lock);
+	return count;
+}
+
+CONFIGFS_ATTR(gpio_sim_config_, label);
+
+static ssize_t gpio_sim_config_num_lines_show(struct config_item *item,
+					      char *page)
+{
+	struct gpio_sim_chip_config *config = to_gpio_sim_chip_config(item);
+	int ret;
+
+	mutex_lock(&config->lock);
+	ret = sprintf(page, "%u\n", config->num_lines);
+	mutex_unlock(&config->lock);
+
+	return ret;
+}
+
+static ssize_t gpio_sim_config_num_lines_store(struct config_item *item,
+					       const char *page, size_t count)
+{
+	struct gpio_sim_chip_config *config = to_gpio_sim_chip_config(item);
+	unsigned int num_lines;
+	int ret;
+
+	mutex_lock(&config->lock);
+
+	if (config->pdev) {
+		mutex_unlock(&config->lock);
+		return -EBUSY;
+	}
+
+	ret = kstrtouint(page, 10, &num_lines);
+	if (ret) {
+		mutex_unlock(&config->lock);
+		return ret;
+	}
+
+	if (num_lines == 0) {
+		mutex_unlock(&config->lock);
+		return -EINVAL;
+	}
+
+	config->num_lines = num_lines;
+
+	mutex_unlock(&config->lock);
+	return count;
+}
+
+CONFIGFS_ATTR(gpio_sim_config_, num_lines);
+
+static ssize_t gpio_sim_config_line_names_show(struct config_item *item,
+					       char *page)
+{
+	struct gpio_sim_chip_config *config = to_gpio_sim_chip_config(item);
+	int ret, i, written = 0;
+
+	mutex_lock(&config->lock);
+
+	if (!config->line_names) {
+		mutex_unlock(&config->lock);
+		return sprintf(page, "\n");
+	}
+
+	for (i = 0; i < config->num_line_names; i++) {
+		ret = sprintf(page + written,
+			i < config->num_line_names - 1 ? "\"%s\", " : "\"%s\"\n",
+			config->line_names[i] ?: "");
+		if (ret < 0) {
+			mutex_unlock(&config->lock);
+			return ret;
+		}
+
+		written += ret;
+	}
+
+	mutex_unlock(&config->lock);
+	return written;
+}
+
+static ssize_t gpio_sim_config_line_names_store(struct config_item *item,
+						const char *page, size_t count)
+{
+	struct gpio_sim_chip_config *config = to_gpio_sim_chip_config(item);
+	unsigned int num_new_names = 1, num_old_names, name_idx = 0;
+	bool in_quote = false, got_comma = true;
+	char **new_names, **old_names, *name, c;
+	const char *start = page;
+	size_t pos, name_len;
+	int err = -EINVAL;
+
+	mutex_lock(&config->lock);
+
+	if (config->pdev) {
+		mutex_unlock(&config->lock);
+		return -EBUSY;
+	}
+
+	/*
+	 * Line names are stored in a pointer array so that we can easily
+	 * pass them down to the GPIO subsystem in a "gpio-line-names"
+	 * property.
+	 *
+	 * Line names must be passed as a list of quoted names separated by
+	 * commas, for example: '"foo", "bar", "foobar"'.
+	 */
+
+	for (pos = 0; pos < count; pos++) {
+		/*
+		 * Just count the commas and assume the number if strings
+		 * equals the number of commas + 1. If the format is wrong
+		 * we'll bail out anyway.
+		 */
+		if (page[pos] == ',')
+			num_new_names++;
+	}
+
+	new_names = kcalloc(num_new_names, sizeof(char *), GFP_KERNEL);
+	if (!new_names) {
+		mutex_unlock(&config->lock);
+		return -ENOMEM;
+	}
+
+	/*
+	 * REVISIT There are more users in the kernel that want to split
+	 * comma-separated strings into tokens. We should generalize it and
+	 * put it into lib/.
+	 */
+	for (pos = 0; pos < count; pos++) {
+		c = page[pos];
+
+		if (in_quote) {
+			if (c == '"') {
+				/* This is the end of the name. */
+				in_quote = got_comma = false;
+				name_len = (page + pos) - start;
+				if (name_len == 0) {
+					/* Name is empty (passed as ""). */
+					name_idx++;
+					continue;
+				}
+
+				name = kmemdup(start, name_len + 1, GFP_KERNEL);
+				if (!name) {
+					err = -ENOMEM;
+					goto err_out;
+				}
+
+				name[name_len] = '\0';
+				new_names[name_idx++] = name;
+			}
+		} else {
+			if (c == '"') {
+				/* Enforce separating names with commas. */
+				if (!got_comma)
+					goto err_out;
+
+				start = page + pos + 1;
+				in_quote = true;
+			} else if (c == ',') {
+				if (!got_comma)
+					got_comma = true;
+				else
+					/* Double commas are not allowed. */
+					goto err_out;
+			} else if (!isspace(c)) {
+				goto err_out;
+			}
+		}
+	}
+
+	/*
+	 * End of input sanity checks, must not have a comma at the end and
+	 * must have finished scanning the last name.
+	 */
+	if (in_quote || got_comma)
+		goto err_out;
+
+	old_names = config->line_names;
+	num_old_names = config->num_line_names;
+	config->line_names = new_names;
+	config->num_line_names = num_new_names;
+
+	mutex_unlock(&config->lock);
+	kfree_strarray(old_names, num_old_names);
+	return count;
+
+err_out:
+	mutex_unlock(&config->lock);
+	kfree_strarray(new_names, name_idx);
+	return err;
+}
+
+CONFIGFS_ATTR(gpio_sim_config_, line_names);
+
+static struct configfs_attribute *gpio_sim_config_attrs[] = {
+	&gpio_sim_config_attr_dev_name,
+	&gpio_sim_config_attr_chip_name,
+	&gpio_sim_config_attr_label,
+	&gpio_sim_config_attr_num_lines,
+	&gpio_sim_config_attr_line_names,
+	NULL
+};
+
+static void gpio_sim_chip_config_release(struct config_item *item)
+{
+	struct gpio_sim_chip_config *config = to_gpio_sim_chip_config(item);
+
+	mutex_destroy(&config->lock);
+	kfree_strarray(config->line_names, config->num_line_names);
+	kfree(config);
+}
+
+static struct configfs_item_operations gpio_sim_config_item_ops = {
+	.release	= gpio_sim_chip_config_release,
+};
+
+static const struct config_item_type gpio_sim_chip_config_type = {
+	.ct_item_ops	= &gpio_sim_config_item_ops,
+	.ct_attrs	= gpio_sim_config_attrs,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_item *
+gpio_sim_config_make_item(struct config_group *group, const char *name)
+{
+	struct gpio_sim_chip_config *config;
+
+	config = kzalloc(sizeof(*config), GFP_KERNEL);
+	if (!config)
+		return ERR_PTR(-ENOMEM);
+
+	config_item_init_type_name(&config->item, name,
+				   &gpio_sim_chip_config_type);
+	config->num_lines = 1;
+	mutex_init(&config->lock);
+
+	return &config->item;
+}
+
+static int gpio_sim_config_commit_item(struct config_item *item)
+{
+	struct gpio_sim_chip_config *config = to_gpio_sim_chip_config(item);
+	struct property_entry properties[GPIO_SIM_MAX_PROP];
+	struct platform_device_info pdevinfo;
+	struct platform_device *pdev;
+	unsigned int prop_idx = 0;
+
+	memset(&pdevinfo, 0, sizeof(pdevinfo));
+	memset(properties, 0, sizeof(properties));
+
+	mutex_lock(&config->lock);
+
+	properties[prop_idx++] = PROPERTY_ENTRY_U32("gpio-sim,nr-gpios",
+						    config->num_lines);
+
+	if (config->label[0] != '\0')
+		properties[prop_idx++] = PROPERTY_ENTRY_STRING("gpio-sim,label",
+							       config->label);
+
+	if (config->line_names)
+		properties[prop_idx++] = PROPERTY_ENTRY_STRING_ARRAY_LEN(
+						"gpio-line-names",
+						config->line_names,
+						config->num_line_names);
+
+	pdevinfo.id = ida_alloc(&gpio_sim_ida, GFP_KERNEL);
+	if (pdevinfo.id < 0) {
+		mutex_unlock(&config->lock);
+		return pdevinfo.id;
+	}
+
+	pdevinfo.name = "gpio-sim";
+	pdevinfo.properties = properties;
+
+	pdev = platform_device_register_full(&pdevinfo);
+	if (IS_ERR(pdev)) {
+		ida_free(&gpio_sim_ida, pdevinfo.id);
+		mutex_unlock(&config->lock);
+		return PTR_ERR(pdev);
+	}
+
+	config->pdev = pdev;
+	mutex_unlock(&config->lock);
+
+	return 0;
+}
+
+static int gpio_sim_config_uncommit_item(struct config_item *item)
+{
+	struct gpio_sim_chip_config *config = to_gpio_sim_chip_config(item);
+	int id;
+
+	mutex_lock(&config->lock);
+	id = config->pdev->id;
+	platform_device_unregister(config->pdev);
+	config->pdev = NULL;
+	mutex_unlock(&config->lock);
+
+	ida_free(&gpio_sim_ida, id);
+	return 0;
+}
+
+static struct configfs_group_operations gpio_sim_config_group_ops = {
+	.make_item	= gpio_sim_config_make_item,
+	.commit_item	= gpio_sim_config_commit_item,
+	.uncommit_item	= gpio_sim_config_uncommit_item,
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
+MODULE_AUTHOR("Bartosz Golaszewski <bgolaszewski@baylibre.com>");
+MODULE_DESCRIPTION("GPIO Simulator Module");
+MODULE_LICENSE("GPL");
-- 
2.30.1

