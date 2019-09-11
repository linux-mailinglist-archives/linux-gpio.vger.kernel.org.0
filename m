Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 924D4AFEEA
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 16:39:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728182AbfIKOjX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 10:39:23 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:35360 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728053AbfIKOjN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 10:39:13 -0400
Received: from ramsan ([84.194.98.4])
        by michel.telenet-ops.be with bizsmtp
        id 0Ef42100305gfCL06Ef4Rm; Wed, 11 Sep 2019 16:39:10 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i83lv-0006TA-Vs; Wed, 11 Sep 2019 16:39:03 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i83lv-0003PF-UY; Wed, 11 Sep 2019 16:39:03 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, qemu-devel@nongnu.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC v2 4/5] gpio: Add GPIO Forwarder Helper
Date:   Wed, 11 Sep 2019 16:38:57 +0200
Message-Id: <20190911143858.13024-5-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190911143858.13024-1-geert+renesas@glider.be>
References: <20190911143858.13024-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a helper for creating GPIO chips that merely forward all operations
to other GPIOs.

This will be used by the GPIO Aggregator.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
I expect this can be used by the GPIO inverter, too, after adding an
"invert" flag, or a filter function that checks which offsets need
inversion.
---
 drivers/gpio/Kconfig       |   3 +
 drivers/gpio/Makefile      |   1 +
 drivers/gpio/gpiolib-fwd.c | 272 +++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib-fwd.h |  16 +++
 4 files changed, 292 insertions(+)
 create mode 100644 drivers/gpio/gpiolib-fwd.c
 create mode 100644 drivers/gpio/gpiolib-fwd.h

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 38e096e6925fa65d..29d3ce8debcca1f6 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -47,6 +47,9 @@ config GPIOLIB_IRQCHIP
 	select IRQ_DOMAIN
 	bool
 
+config GPIOLIB_FWD
+	tristate
+
 config DEBUG_GPIO
 	bool "Debug GPIO calls"
 	depends on DEBUG_KERNEL
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index d2fd19c15bae3fba..8a0e685c92b69855 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -10,6 +10,7 @@ obj-$(CONFIG_GPIOLIB)		+= gpiolib-devprop.o
 obj-$(CONFIG_OF_GPIO)		+= gpiolib-of.o
 obj-$(CONFIG_GPIO_SYSFS)	+= gpiolib-sysfs.o
 obj-$(CONFIG_GPIO_ACPI)		+= gpiolib-acpi.o
+obj-$(CONFIG_GPIOLIB_FWD)	+= gpiolib-fwd.o
 
 # Device drivers. Generally keep list sorted alphabetically
 obj-$(CONFIG_GPIO_GENERIC)	+= gpio-generic.o
diff --git a/drivers/gpio/gpiolib-fwd.c b/drivers/gpio/gpiolib-fwd.c
new file mode 100644
index 0000000000000000..28dac8c60a981337
--- /dev/null
+++ b/drivers/gpio/gpiolib-fwd.c
@@ -0,0 +1,272 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// GPIO Forwarder Helper
+//
+// Copyright (C) 2019 Glider bvba
+
+#include <linux/bitmap.h>
+#include <linux/bitops.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/overflow.h>
+#include <linux/spinlock.h>
+
+#include "gpiolib.h"
+#include "gpiolib-fwd.h"
+
+struct gpiochip_fwd {
+	struct gpio_chip chip;
+	struct gpio_desc **descs;
+	union {
+		struct mutex mlock;	/* protects tmp[] if can_sleep */
+		spinlock_t slock;	/* protects tmp[] if !can_sleep */
+	};
+	unsigned long tmp[];		/* values and descs for multiple ops */
+};
+
+static int gpio_fwd_get_direction(struct gpio_chip *chip, unsigned int offset)
+{
+	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
+
+	return gpiod_get_direction(fwd->descs[offset]);
+}
+
+static int gpio_fwd_direction_input(struct gpio_chip *chip, unsigned int offset)
+{
+	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
+
+	return gpiod_direction_input(fwd->descs[offset]);
+}
+
+static int gpio_fwd_direction_output(struct gpio_chip *chip,
+				     unsigned int offset, int value)
+{
+	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
+
+	return gpiod_direction_output(fwd->descs[offset], value);
+}
+
+static int gpio_fwd_get(struct gpio_chip *chip, unsigned int offset)
+{
+	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
+
+	return gpiod_get_value(fwd->descs[offset]);
+}
+
+static int gpio_fwd_get_multiple(struct gpio_chip *chip, unsigned long *mask,
+				 unsigned long *bits)
+{
+	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
+	unsigned long *values, flags;
+	struct gpio_desc **descs;
+	unsigned int i, j = 0;
+	int error;
+
+	if (chip->can_sleep)
+		mutex_lock(&fwd->mlock);
+	else
+		spin_lock_irqsave(&fwd->slock, flags);
+
+	values = &fwd->tmp[0];
+	bitmap_clear(values, 0, fwd->chip.ngpio);
+	descs = (void *)&fwd->tmp[BITS_TO_LONGS(fwd->chip.ngpio)];
+
+	for_each_set_bit(i, mask, fwd->chip.ngpio)
+		descs[j++] = fwd->descs[i];
+
+	error = gpiod_get_array_value(j, descs, NULL, values);
+	if (!error) {
+		j = 0;
+		for_each_set_bit(i, mask, fwd->chip.ngpio)
+			__assign_bit(i, bits, test_bit(j++, values));
+	}
+
+	if (chip->can_sleep)
+		mutex_unlock(&fwd->mlock);
+	else
+		spin_unlock_irqrestore(&fwd->slock, flags);
+
+	return error;
+}
+
+static void gpio_fwd_set(struct gpio_chip *chip, unsigned int offset, int value)
+{
+	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
+
+	gpiod_set_value(fwd->descs[offset], value);
+}
+
+static void gpio_fwd_set_multiple(struct gpio_chip *chip, unsigned long *mask,
+				  unsigned long *bits)
+{
+	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
+	unsigned long *values, flags;
+	struct gpio_desc **descs;
+	unsigned int i, j = 0;
+
+	if (chip->can_sleep)
+		mutex_lock(&fwd->mlock);
+	else
+		spin_lock_irqsave(&fwd->slock, flags);
+
+	values = &fwd->tmp[0];
+	descs = (void *)&fwd->tmp[BITS_TO_LONGS(fwd->chip.ngpio)];
+
+	for_each_set_bit(i, mask, fwd->chip.ngpio) {
+		__assign_bit(j, values, test_bit(i, bits));
+		descs[j++] = fwd->descs[i];
+	}
+
+	gpiod_set_array_value(j, descs, NULL, values);
+
+	if (chip->can_sleep)
+		mutex_unlock(&fwd->mlock);
+	else
+		spin_unlock_irqrestore(&fwd->slock, flags);
+}
+
+static int gpio_fwd_set_config(struct gpio_chip *chip, unsigned int offset,
+			       unsigned long config)
+{
+	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
+
+	chip = fwd->descs[offset]->gdev->chip;
+	if (chip->set_config)
+		return chip->set_config(chip, offset, config);
+
+	return -ENOTSUPP;
+}
+
+static int gpio_fwd_init_valid_mask(struct gpio_chip *chip,
+				    unsigned long *valid_mask,
+				    unsigned int ngpios)
+{
+	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
+	unsigned int i;
+
+	for (i = 0; i < ngpios; i++) {
+		if (!gpiochip_line_is_valid(fwd->descs[i]->gdev->chip,
+					    gpio_chip_hwgpio(fwd->descs[i])))
+			clear_bit(i, valid_mask);
+	}
+
+	return 0;
+}
+
+/**
+ * gpiochip_fwd_create() - Create a new GPIO forwarder
+ * @label: Name of the forwarder
+ * @parent: Optional parent device pointer
+ * @ngpios: Number of GPIOs in the forwarder.
+ * @descs: Array containing the GPIO descriptors to forward to.
+ *         This array must contain @ngpios entries, and must not be deallocated
+ *         before the forwarder has been destroyed again.
+ *
+ * This function creates a new gpiochip, which forwards all GPIO operations to
+ * the passed GPIO descriptors.
+ *
+ * Return: An opaque object pointer, or an ERR_PTR()-encoded negative error
+ *         code on failure.
+ */
+struct gpiochip_fwd *gpiochip_fwd_create(const char *label,
+					 struct device *parent,
+					 unsigned int ngpios,
+					 struct gpio_desc *descs[])
+{
+	struct gpiochip_fwd *fwd;
+	struct gpio_chip *chip;
+	unsigned int i;
+	int error;
+
+	fwd = kzalloc(struct_size(fwd, tmp, BITS_TO_LONGS(ngpios) + ngpios),
+		      GFP_KERNEL);
+	if (!fwd)
+		return ERR_PTR(-ENOMEM);
+
+	chip = &fwd->chip;
+
+	for (i = 0; i < ngpios; i++) {
+		pr_debug("%s: gpio %u => gpio-%d (%s)\n", label, i,
+			 desc_to_gpio(descs[i]), descs[i]->label ? : "?");
+
+		error = gpiod_request(descs[i], label);
+		if (error) {
+			gpiod_err(descs[i], "%s: Cannot request GPIO: %d\n",
+				  label, error);
+			goto free;
+		}
+
+		if (gpiod_cansleep(descs[i]))
+			chip->can_sleep = true;
+		if (descs[i]->gdev->chip->set_config)
+			chip->set_config = gpio_fwd_set_config;
+		if (descs[i]->gdev->chip->init_valid_mask)
+			chip->init_valid_mask = gpio_fwd_init_valid_mask;
+	}
+
+	chip->label = label;
+	chip->parent = parent;
+	chip->owner = THIS_MODULE;
+	chip->get_direction = gpio_fwd_get_direction;
+	chip->direction_input = gpio_fwd_direction_input;
+	chip->direction_output = gpio_fwd_direction_output;
+	chip->get = gpio_fwd_get;
+	chip->get_multiple = gpio_fwd_get_multiple;
+	chip->set = gpio_fwd_set;
+	chip->set_multiple = gpio_fwd_set_multiple;
+	chip->base = -1;
+	chip->ngpio = ngpios;
+	fwd->descs = descs;
+
+	if (chip->can_sleep)
+		mutex_init(&fwd->mlock);
+	else
+		spin_lock_init(&fwd->slock);
+
+	error = gpiochip_add_data(chip, fwd);
+	if (error)
+		goto free;
+
+	return fwd;
+
+free:
+	while (i-- > 0)
+		gpiod_free(descs[i]);
+
+	kfree(fwd);
+
+	return ERR_PTR(error);
+}
+EXPORT_SYMBOL_GPL(gpiochip_fwd_create);
+
+/**
+ * gpiochip_fwd_destroy() - Destroy a new GPIO forwarder
+ * @fwd: Opaque object pointer, as returned by gpiochip_fwd_create()
+ *
+ * This function destroys GPIO forwarder gpiochip, previously created by
+ * gpiochip_fwd_create().
+
+ * Return: Zero.
+ */
+int gpiochip_fwd_destroy(struct gpiochip_fwd *fwd)
+{
+	unsigned int i;
+
+	if (IS_ERR_OR_NULL(fwd))
+		return 0;
+
+	gpiochip_remove(&fwd->chip);
+
+	for (i = 0; i < fwd->chip.ngpio; i++)
+		gpiod_free(fwd->descs[i]);
+
+	kfree(fwd);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gpiochip_fwd_destroy);
+
+MODULE_AUTHOR("Geert Uytterhoeven <geert+renesas@glider.be>");
+MODULE_DESCRIPTION("GPIO Forwarder Helper");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpio/gpiolib-fwd.h b/drivers/gpio/gpiolib-fwd.h
new file mode 100644
index 0000000000000000..68d299afc6883a9c
--- /dev/null
+++ b/drivers/gpio/gpiolib-fwd.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * GPIO Forwarder Helper
+ *
+ * Copyright (C) 2019 Glider bvba
+ */
+
+struct device;
+struct gpio_desc;
+struct gpiochip_fwd;
+
+struct gpiochip_fwd *gpiochip_fwd_create(const char *label,
+					 struct device *parent,
+					 unsigned int ngpios,
+					 struct gpio_desc *descs[]);
+int gpiochip_fwd_destroy(struct gpiochip_fwd *fwd);
-- 
2.17.1

