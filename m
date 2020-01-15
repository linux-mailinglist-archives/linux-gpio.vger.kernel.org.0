Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5B3913CBDC
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jan 2020 19:16:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729293AbgAOSPp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jan 2020 13:15:45 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:46346 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729214AbgAOSPl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jan 2020 13:15:41 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id qiFR2100S5USYZQ06iFRNh; Wed, 15 Jan 2020 19:15:38 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1irnCP-00012b-H4; Wed, 15 Jan 2020 19:15:25 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1irnCP-000698-FU; Wed, 15 Jan 2020 19:15:25 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        qemu-devel@nongnu.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v4 3/5] gpio: Add GPIO Aggregator
Date:   Wed, 15 Jan 2020 19:15:21 +0100
Message-Id: <20200115181523.23556-4-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200115181523.23556-1-geert+renesas@glider.be>
References: <20200115181523.23556-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

GPIO controllers are exported to userspace using /dev/gpiochip*
character devices.  Access control to these devices is provided by
standard UNIX file system permissions, on an all-or-nothing basis:
either a GPIO controller is accessible for a user, or it is not.
Currently no mechanism exists to control access to individual GPIOs.

Hence add a GPIO driver to aggregate existing GPIOs, and expose them as
a new gpiochip.

This supports the following use cases:
  - Aggregating GPIOs using Sysfs
    This is useful for implementing access control, and assigning a set
    of GPIOs to a specific user or virtual machine.
  - Generic GPIO Driver
    This is useful for industrial control, where it can provide
    userspace access to a simple GPIO-operated device described in DT,
    cfr. e.g. spidev for SPI-operated devices.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v4:
  - Remove unused assignment to n in isrange(),
  - Check correct pointer after aggr->lookups->dev_id allocation,
  - Preinitialize flags to 0 in gpio_fwd_[gs]et_multiple() to avoid
    may-be-used-uninitialized warning,
  - Drop controversial GPIO repeater,
  - Update for gpiod_lookup.chip_label rename,
  - Use %pe to format error pointers,
  - Use U16_MAX instead of (u16)-1,
  - Correct comment indentation,
  - Use skip_spaces() helper,
  - Rename a and b to first_index resp. last_index,
  - Add comment to tmp[] use,
  - Improve Kconfig help text,
  - Include <linux/gpio/consumer.h> for gpiod_[gs]et_*(),
  - Drop unneeded valid_mask handling,
  - Add comment about sleeping and .set_config() support,

v3:
  - Absorb GPIO forwarder,
  - Integrate GPIO Repeater and Generic GPIO driver functionality,
  - Use the aggregator parameters to create a GPIO lookup table instead
    of an array of GPIO descriptors, which allows to simplify the code:
      1. This removes the need for calling gpio_name_to_desc(),
         gpiochip_find(), gpiochip_get_desc(), and gpiod_request(),
      2. This allows the platform device to always use
         devm_gpiod_get_index(), regardless of the origin of the GPIOs,
  - Move parameter parsing from platform device probe to sysfs attribute
    store, removing the need for platform data passing,
  - Use more devm_*() functions to simplify cleanup,
  - Add pr_fmt(),
  - General refactoring,

v2:
  - Add missing initialization of i in gpio_virt_agg_probe(),
  - Update for removed .need_valid_mask field and changed
    .init_valid_mask() signature,
  - Drop "virtual", rename to gpio-aggregator,
  - Drop bogus FIXME related to gpiod_set_transitory() expectations,
  - Use new GPIO Forwarder Helper,
  - Lift limit on the maximum number of GPIOs,
  - Improve parsing:
      - add support for specifying GPIOs by line name,
      - add support for specifying GPIO chips by ID,
      - add support for GPIO offset ranges,
      - names and offset specifiers must be separated by whitespace,
      - GPIO offsets must separated by spaces,
  - Use str_has_prefix() and kstrtouint().
---
 drivers/gpio/Kconfig           |  12 +
 drivers/gpio/Makefile          |   1 +
 drivers/gpio/gpio-aggregator.c | 574 +++++++++++++++++++++++++++++++++
 3 files changed, 587 insertions(+)
 create mode 100644 drivers/gpio/gpio-aggregator.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 64661b49a4c32874..e4fc7ce98734d918 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1514,6 +1514,18 @@ config GPIO_VIPERBOARD
 
 endmenu
 
+config GPIO_AGGREGATOR
+	tristate "GPIO Aggregator"
+	help
+	  Say yes here to enable the GPIO Aggregator, which provides a way to
+	  aggregate existing GPIO lines into a new virtual GPIO chip.
+	  This can serve the following purposes:
+	    - Assign permissions for a collection of GPIO lines to a user,
+	    - Export a collection of GPIO lines to a virtual machine,
+	    - Provide a generic driver for a GPIO-operated device in an
+	      industrial control context, to be operated from userspace using
+	      the GPIO chardev interface.
+
 config GPIO_MOCKUP
 	tristate "GPIO Testing Driver"
 	select IRQ_SIM
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index ba53f1fcde3a3591..60071fd1290a375c 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_GPIO_74XX_MMIO)		+= gpio-74xx-mmio.o
 obj-$(CONFIG_GPIO_ADNP)			+= gpio-adnp.o
 obj-$(CONFIG_GPIO_ADP5520)		+= gpio-adp5520.o
 obj-$(CONFIG_GPIO_ADP5588)		+= gpio-adp5588.o
+obj-$(CONFIG_GPIO_AGGREGATOR)		+= gpio-aggregator.o
 obj-$(CONFIG_GPIO_ALTERA_A10SR)		+= gpio-altera-a10sr.o
 obj-$(CONFIG_GPIO_ALTERA)  		+= gpio-altera.o
 obj-$(CONFIG_GPIO_AMD8111)		+= gpio-amd8111.o
diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
new file mode 100644
index 0000000000000000..339335660d1c40c2
--- /dev/null
+++ b/drivers/gpio/gpio-aggregator.c
@@ -0,0 +1,574 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// GPIO Aggregator
+//
+// Copyright (C) 2019 Glider bvba
+
+#define DRV_NAME       "gpio-aggregator"
+#define pr_fmt(fmt)	DRV_NAME ": " fmt
+
+#include <linux/bitmap.h>
+#include <linux/bitops.h>
+#include <linux/ctype.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/driver.h>
+#include <linux/gpio/machine.h>
+#include <linux/idr.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/overflow.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+#include <linux/string.h>
+
+#include "gpiolib.h"
+
+
+/*
+ * GPIO Aggregator sysfs interface
+ */
+
+struct gpio_aggregator {
+	struct gpiod_lookup_table *lookups;
+	struct platform_device *pdev;
+	char args[];
+};
+
+static DEFINE_MUTEX(gpio_aggregator_lock);	/* protects idr */
+static DEFINE_IDR(gpio_aggregator_idr);
+
+static char *get_arg(char **args)
+{
+	char *start = *args, *end;
+
+	start = skip_spaces(start);
+	if (!*start)
+		return NULL;
+
+	if (*start == '"') {
+		/* Quoted arg */
+		end = strchr(++start, '"');
+		if (!end)
+			return ERR_PTR(-EINVAL);
+	} else {
+		/* Unquoted arg */
+		for (end = start; *end && !isspace(*end); end++) ;
+	}
+
+	if (*end)
+		*end++ = '\0';
+
+	*args = end;
+	return start;
+}
+
+static bool isrange(const char *s)
+{
+	size_t n;
+
+	if (IS_ERR_OR_NULL(s))
+		return false;
+
+	while (1) {
+		n = strspn(s, "0123456789");
+		if (!n)
+			return false;
+
+		s += n;
+
+		switch (*s++) {
+		case '\0':
+			return true;
+
+		case '-':
+		case ',':
+			break;
+
+		default:
+			return false;
+		}
+	}
+}
+
+static int aggr_add_gpio(struct gpio_aggregator *aggr, const char *key,
+			 int hwnum, unsigned int *n)
+{
+	struct gpiod_lookup_table *lookups;
+
+	lookups = krealloc(aggr->lookups, struct_size(lookups, table, *n + 2),
+			   GFP_KERNEL);
+	if (!lookups)
+		return -ENOMEM;
+
+	lookups->table[*n].key = key;
+	lookups->table[*n].chip_hwnum = hwnum;
+	lookups->table[*n].idx = *n;
+
+	(*n)++;
+	memset(&lookups->table[*n], 0, sizeof(lookups->table[*n]));
+
+	aggr->lookups = lookups;
+	return 0;
+}
+
+static int aggr_parse(struct gpio_aggregator *aggr)
+{
+	unsigned int first_index, last_index, i, n = 0;
+	char *name, *offsets, *first, *last, *next;
+	char *args = aggr->args;
+	int error;
+
+	for (name = get_arg(&args), offsets = get_arg(&args); name;
+	     offsets = get_arg(&args)) {
+		if (IS_ERR(name)) {
+			pr_err("Cannot get GPIO specifier: %pe\n", name);
+			return PTR_ERR(name);
+		}
+
+		if (!isrange(offsets)) {
+			/* Named GPIO line */
+			error = aggr_add_gpio(aggr, name, U16_MAX, &n);
+			if (error)
+				return error;
+
+			name = offsets;
+			continue;
+		}
+
+		/* GPIO chip + offset(s) */
+		for (first = offsets; *first; first = next) {
+			next = strchrnul(first, ',');
+			if (*next)
+				*next++ = '\0';
+
+			last = strchr(first, '-');
+			if (last)
+				*last++ = '\0';
+
+			if (kstrtouint(first, 10, &first_index)) {
+				pr_err("Cannot parse GPIO index %s\n", first);
+				return -EINVAL;
+			}
+
+			if (!last) {
+				last_index = first_index;
+			} else if (kstrtouint(last, 10, &last_index)) {
+				pr_err("Cannot parse GPIO index %s\n", last);
+				return -EINVAL;
+			}
+
+			for (i = first_index; i <= last_index; i++) {
+				error = aggr_add_gpio(aggr, name, i, &n);
+				if (error)
+					return error;
+			}
+		}
+
+		name = get_arg(&args);
+	}
+
+	if (!n) {
+		pr_err("No GPIOs specified\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static ssize_t new_device_store(struct device_driver *driver, const char *buf,
+				size_t count)
+{
+	struct gpio_aggregator *aggr;
+	struct platform_device *pdev;
+	int res, id;
+
+	/* kernfs guarantees string termination, so count + 1 is safe */
+	aggr = kzalloc(sizeof(*aggr) + count + 1, GFP_KERNEL);
+	if (!aggr)
+		return -ENOMEM;
+
+	memcpy(aggr->args, buf, count + 1);
+
+	aggr->lookups = kzalloc(struct_size(aggr->lookups, table, 1),
+				GFP_KERNEL);
+	if (!aggr->lookups) {
+		res = -ENOMEM;
+		goto free_ga;
+	}
+
+	mutex_lock(&gpio_aggregator_lock);
+	id = idr_alloc(&gpio_aggregator_idr, aggr, 0, 0, GFP_KERNEL);
+	mutex_unlock(&gpio_aggregator_lock);
+
+	if (id < 0) {
+		res = id;
+		goto free_table;
+	}
+
+	aggr->lookups->dev_id = kasprintf(GFP_KERNEL, "%s.%d", DRV_NAME, id);
+	if (!aggr->lookups->dev_id) {
+		res = -ENOMEM;
+		goto remove_idr;
+	}
+
+	res = aggr_parse(aggr);
+	if (res)
+		goto free_dev_id;
+
+	gpiod_add_lookup_table(aggr->lookups);
+
+	pdev = platform_device_register_simple(DRV_NAME, id, NULL, 0);
+	if (IS_ERR(pdev)) {
+		res = PTR_ERR(pdev);
+		goto remove_table;
+	}
+
+	aggr->pdev = pdev;
+	return count;
+
+remove_table:
+	gpiod_remove_lookup_table(aggr->lookups);
+free_dev_id:
+	kfree(aggr->lookups->dev_id);
+remove_idr:
+	mutex_lock(&gpio_aggregator_lock);
+	idr_remove(&gpio_aggregator_idr, id);
+	mutex_unlock(&gpio_aggregator_lock);
+free_table:
+	kfree(aggr->lookups);
+free_ga:
+	kfree(aggr);
+	return res;
+}
+
+static DRIVER_ATTR_WO(new_device);
+
+static void gpio_aggregator_free(struct gpio_aggregator *aggr)
+{
+	platform_device_unregister(aggr->pdev);
+	gpiod_remove_lookup_table(aggr->lookups);
+	kfree(aggr->lookups->dev_id);
+	kfree(aggr->lookups);
+	kfree(aggr);
+}
+
+static ssize_t delete_device_store(struct device_driver *driver,
+				   const char *buf, size_t count)
+{
+	struct gpio_aggregator *aggr;
+	unsigned int id;
+	int error;
+
+	if (!str_has_prefix(buf, DRV_NAME "."))
+		return -EINVAL;
+
+	error = kstrtouint(buf + strlen(DRV_NAME "."), 10, &id);
+	if (error)
+		return error;
+
+	mutex_lock(&gpio_aggregator_lock);
+	aggr = idr_remove(&gpio_aggregator_idr, id);
+	mutex_unlock(&gpio_aggregator_lock);
+	if (!aggr)
+		return -ENOENT;
+
+	gpio_aggregator_free(aggr);
+	return count;
+}
+static DRIVER_ATTR_WO(delete_device);
+
+static struct attribute *gpio_aggregator_attrs[] = {
+	&driver_attr_new_device.attr,
+	&driver_attr_delete_device.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(gpio_aggregator);
+
+static int __exit gpio_aggregator_idr_remove(int id, void *p, void *data)
+{
+	gpio_aggregator_free(p);
+	return 0;
+}
+
+static void __exit gpio_aggregator_remove_all(void)
+{
+	mutex_lock(&gpio_aggregator_lock);
+	idr_for_each(&gpio_aggregator_idr, gpio_aggregator_idr_remove, NULL);
+	idr_destroy(&gpio_aggregator_idr);
+	mutex_unlock(&gpio_aggregator_lock);
+}
+
+
+/*
+ *  GPIO Forwarder
+ */
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
+	unsigned long *values, flags = 0;
+	struct gpio_desc **descs;
+	unsigned int i, j = 0;
+	int error;
+
+	if (chip->can_sleep)
+		mutex_lock(&fwd->mlock);
+	else
+		spin_lock_irqsave(&fwd->slock, flags);
+
+	/* Both values bitmap and desc pointers are stored in tmp[] */
+	values = &fwd->tmp[0];
+	descs = (void *)&fwd->tmp[BITS_TO_LONGS(fwd->chip.ngpio)];
+
+	bitmap_clear(values, 0, fwd->chip.ngpio);
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
+	unsigned long *values, flags = 0;
+	struct gpio_desc **descs;
+	unsigned int i, j = 0;
+
+	if (chip->can_sleep)
+		mutex_lock(&fwd->mlock);
+	else
+		spin_lock_irqsave(&fwd->slock, flags);
+
+	/* Both values bitmap and desc pointers are stored in tmp[] */
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
+/**
+ * gpiochip_fwd_create() - Create a new GPIO forwarder
+ * @dev: Parent device pointer
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
+static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
+						unsigned int ngpios,
+						struct gpio_desc *descs[])
+{
+	const char *label = dev_name(dev);
+	struct gpiochip_fwd *fwd;
+	struct gpio_chip *chip;
+	unsigned int i;
+	int error;
+
+	fwd = devm_kzalloc(dev, struct_size(fwd, tmp,
+			   BITS_TO_LONGS(ngpios) + ngpios), GFP_KERNEL);
+	if (!fwd)
+		return ERR_PTR(-ENOMEM);
+
+	chip = &fwd->chip;
+
+	/*
+	 * If any of the GPIO lines are sleeping, then the entire forwarder
+	 * will be sleeping.
+	 * If any of the chips support .set_config(), then the forwarder will
+	 * support setting configs.
+	 */
+	for (i = 0; i < ngpios; i++) {
+		dev_dbg(dev, "gpio %u => gpio-%d (%s)\n", i,
+			desc_to_gpio(descs[i]), descs[i]->label ? : "?");
+
+		if (gpiod_cansleep(descs[i]))
+			chip->can_sleep = true;
+		if (descs[i]->gdev->chip->set_config)
+			chip->set_config = gpio_fwd_set_config;
+	}
+
+	chip->label = label;
+	chip->parent = dev;
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
+	error = devm_gpiochip_add_data(dev, chip, fwd);
+	if (error)
+		return ERR_PTR(error);
+
+	return fwd;
+}
+
+
+/*
+ *  GPIO Aggregator platform device
+ */
+
+static int gpio_aggregator_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct gpio_desc **descs;
+	struct gpiochip_fwd *fwd;
+	int i, n;
+
+	n = gpiod_count(dev, NULL);
+	if (n < 0)
+		return n;
+
+	descs = devm_kmalloc_array(dev, n, sizeof(*descs), GFP_KERNEL);
+	if (!descs)
+		return -ENOMEM;
+
+	for (i = 0; i < n; i++) {
+		descs[i] = devm_gpiod_get_index(dev, NULL, i, GPIOD_ASIS);
+		if (IS_ERR(descs[i]))
+			return PTR_ERR(descs[i]);
+	}
+
+	fwd = gpiochip_fwd_create(dev, n, descs);
+	if (IS_ERR(fwd))
+		return PTR_ERR(fwd);
+
+	platform_set_drvdata(pdev, fwd);
+	return 0;
+}
+
+#ifdef CONFIG_OF
+static const struct of_device_id gpio_aggregator_dt_ids[] = {
+	/*
+	 * Add GPIO-operated devices controlled from userspace below,
+	 * or use "driver_override" in sysfs
+	 */
+	{},
+};
+MODULE_DEVICE_TABLE(of, gpio_aggregator_dt_ids);
+#endif
+
+static struct platform_driver gpio_aggregator_driver = {
+	.probe = gpio_aggregator_probe,
+	.driver = {
+		.name = DRV_NAME,
+		.groups = gpio_aggregator_groups,
+		.of_match_table = of_match_ptr(gpio_aggregator_dt_ids),
+	},
+};
+
+static int __init gpio_aggregator_init(void)
+{
+	return platform_driver_register(&gpio_aggregator_driver);
+}
+module_init(gpio_aggregator_init);
+
+static void __exit gpio_aggregator_exit(void)
+{
+	gpio_aggregator_remove_all();
+	platform_driver_unregister(&gpio_aggregator_driver);
+}
+module_exit(gpio_aggregator_exit);
+
+MODULE_AUTHOR("Geert Uytterhoeven <geert+renesas@glider.be>");
+MODULE_DESCRIPTION("GPIO Aggregator");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

