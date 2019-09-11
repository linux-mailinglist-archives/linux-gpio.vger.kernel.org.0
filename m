Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4B58FAFEF2
	for <lists+linux-gpio@lfdr.de>; Wed, 11 Sep 2019 16:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728032AbfIKOji (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 11 Sep 2019 10:39:38 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:33370 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728085AbfIKOjN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2019 10:39:13 -0400
Received: from ramsan ([84.194.98.4])
        by xavier.telenet-ops.be with bizsmtp
        id 0Ef42100405gfCL01Ef4Mv; Wed, 11 Sep 2019 16:39:10 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i83lw-0006TC-16; Wed, 11 Sep 2019 16:39:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i83lv-0003PI-VI; Wed, 11 Sep 2019 16:39:03 +0200
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
Subject: [PATCH/RFC v2 5/5] gpio: Add GPIO Aggregator Driver
Date:   Wed, 11 Sep 2019 16:38:58 +0200
Message-Id: <20190911143858.13024-6-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190911143858.13024-1-geert+renesas@glider.be>
References: <20190911143858.13024-1-geert+renesas@glider.be>
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
a new gpiochip.  This is useful for implementing access control, and
assigning a set of GPIOs to a specific user.
Furthermore, this simplifies and hardens exporting GPIOs to a virtual
machine, as the VM can just grab the full GPIO controller, and no longer
needs to care about which GPIOs to grab and which not, reducing the
attack surface.

Aggregated GPIO controllers are instantiated by writing to the
"new_device" attribute file in sysfs:

    $ echo [<gpioA>] [<gpiochipB> <offsets>] ...
            > /sys/bus/platform/drivers/gpio-aggregator/new_device

Where <gpioA> is a GPIO line name, <gpiochipB> is a GPIO chip label or
name, and <offsets> is a comma-separated list of GPIO offsets and/or
GPIO offset ranges.

Likewise, aggregated GPIO controllers can be destroyed after use:

    $ echo gpio-aggregator.<N> \
            > /sys/bus/platform/drivers/gpio-aggregator/delete_device

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
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

I didn't use argv_split(), as it doesn't support quoted strings yet,
and GPIO line names can contain spaces.  Perhaps I should enhance
argv_split() first, and use that?
---
 drivers/gpio/Kconfig           |   9 +
 drivers/gpio/Makefile          |   1 +
 drivers/gpio/gpio-aggregator.c | 333 +++++++++++++++++++++++++++++++++
 3 files changed, 343 insertions(+)
 create mode 100644 drivers/gpio/gpio-aggregator.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 29d3ce8debcca1f6..058aa68fd7015e7c 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1483,6 +1483,15 @@ config GPIO_VIPERBOARD
 
 endmenu
 
+config GPIO_AGGREGATOR
+	tristate "GPIO Aggregator"
+	select GPIOLIB_FWD
+	help
+	  This enabled the GPIO Aggregator, which provides a way to aggregate
+	  existing GPIOs into a new GPIO device.
+	  This is useful for assigning a collection of GPIOs to a user, or
+	  exported them to a virtual machine.
+
 config GPIO_MOCKUP
 	tristate "GPIO Testing Driver"
 	select IRQ_SIM
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 8a0e685c92b69855..2ec9128bcfefa40a 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -26,6 +26,7 @@ obj-$(CONFIG_GPIO_74XX_MMIO)		+= gpio-74xx-mmio.o
 obj-$(CONFIG_GPIO_ADNP)			+= gpio-adnp.o
 obj-$(CONFIG_GPIO_ADP5520)		+= gpio-adp5520.o
 obj-$(CONFIG_GPIO_ADP5588)		+= gpio-adp5588.o
+obj-$(CONFIG_GPIO_AGGREGATOR)		+= gpio-aggregator.o
 obj-$(CONFIG_GPIO_ALTERA_A10SR)		+= gpio-altera-a10sr.o
 obj-$(CONFIG_GPIO_ALTERA)  		+= gpio-altera.o
 obj-$(CONFIG_GPIO_AMD8111)		+= gpio-amd8111.o
diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
new file mode 100644
index 0000000000000000..42485735bd823e02
--- /dev/null
+++ b/drivers/gpio/gpio-aggregator.c
@@ -0,0 +1,333 @@
+// SPDX-License-Identifier: GPL-2.0-only
+//
+// GPIO Aggregator
+//
+// Copyright (C) 2019 Glider bvba
+
+#include <linux/ctype.h>
+#include <linux/gpio/driver.h>
+#include <linux/idr.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/string.h>
+
+#include "gpiolib.h"
+#include "gpiolib-fwd.h"
+
+#define DRV_NAME	"gpio-aggregator"
+
+struct gpio_aggregator {
+	struct platform_device *pdev;
+};
+
+static DEFINE_MUTEX(gpio_aggregator_lock);	/* protects idr */
+static DEFINE_IDR(gpio_aggregator_idr);
+
+static int gpiochip_match_label(struct gpio_chip *chip, void *data)
+{
+	return !strcmp(chip->label, data);
+}
+
+static struct gpio_chip *gpiochip_find_by_label(const char *label)
+{
+	return gpiochip_find((void *)label, gpiochip_match_label);
+}
+
+static int gpiochip_match_id(struct gpio_chip *chip, void *data)
+{
+	unsigned int id = (uintptr_t)data;
+
+	return id == chip->base || id == chip->gpiodev->id;
+}
+
+static struct gpio_chip *gpiochip_find_by_id(const char *id)
+{
+	unsigned int x;
+
+	if (!str_has_prefix(id, "gpiochip"))
+		return NULL;
+
+	if (kstrtouint(id + strlen("gpiochip"), 10, &x))
+		return NULL;
+
+	return gpiochip_find((void *)(uintptr_t)x, gpiochip_match_id);
+}
+
+static ssize_t new_device_store(struct device_driver *driver, const char *buf,
+				size_t count)
+{
+	struct platform_device *pdev;
+	struct gpio_aggregator *aggr;
+	int res, id;
+
+	aggr = kzalloc(sizeof(*aggr), GFP_KERNEL);
+	if (!aggr)
+		return -ENOMEM;
+
+	mutex_lock(&gpio_aggregator_lock);
+	id = idr_alloc(&gpio_aggregator_idr, aggr, 0, 0, GFP_KERNEL);
+	mutex_unlock(&gpio_aggregator_lock);
+
+	if (id < 0) {
+		res = id;
+		goto free_ga;
+	}
+
+	/* kernfs guarantees string termination, so count + 1 is safe */
+	pdev = platform_device_register_data(NULL, DRV_NAME, id, buf,
+					     count + 1);
+	if (IS_ERR(pdev)) {
+		res = PTR_ERR(pdev);
+		goto remove_idr;
+	}
+
+	aggr->pdev = pdev;
+	return count;
+
+remove_idr:
+	mutex_lock(&gpio_aggregator_lock);
+	idr_remove(&gpio_aggregator_idr, id);
+	mutex_unlock(&gpio_aggregator_lock);
+free_ga:
+	kfree(aggr);
+	return res;
+}
+
+static DRIVER_ATTR_WO(new_device);
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
+	platform_device_unregister(aggr->pdev);
+	kfree(aggr);
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
+static char *get_arg(struct device *dev, const char **args)
+{
+	const char *start = *args, *end;
+	char *arg;
+
+	if (*start == '"') {
+		/* Quoted arg */
+		end = strchr(++start, '"');
+		if (!end)
+			return ERR_PTR(-EINVAL);
+
+		arg = devm_kasprintf(dev, GFP_KERNEL, "%.*s",
+				     (int)(end++ - start), start);
+	} else {
+		/* Unquoted arg */
+		for (end = start; *end && !isspace(*end); end++) ;
+
+		if (end == start)
+			return ERR_PTR(-ENOENT);
+
+		arg = devm_kasprintf(dev, GFP_KERNEL, "%.*s",
+				     (int)(end - start), start);
+	}
+	if (!arg)
+		return ERR_PTR(-ENOMEM);
+
+	while (isspace(*end))
+		end++;
+
+	*args = end;
+	return arg;
+}
+
+static int add_gpio(struct device *dev, struct gpio_desc ***descs,
+		    unsigned int *n, struct gpio_desc *desc)
+{
+	struct gpio_desc **new_descs;
+
+	new_descs = devm_kmalloc_array(dev, *n + 1, sizeof(desc), GFP_KERNEL);
+	if (!new_descs)
+		return -ENOMEM;
+
+	if (*descs) {
+		memcpy(new_descs, *descs, *n * sizeof(desc));
+		devm_kfree(dev, *descs);
+	}
+
+	new_descs[(*n)++] = desc;
+	*descs = new_descs;
+	return 0;
+}
+
+static int gpio_aggregator_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	char *name, *offsets, *first, *last, *next;
+	const char *args = dev_get_platdata(dev);
+	struct gpio_desc **descs = NULL, *desc;
+	unsigned int a, b, i, n = 0;
+	struct gpiochip_fwd *fwd;
+	struct gpio_chip *chip;
+	int error;
+
+	while (isspace(*args))
+		args++;
+
+	while (*args) {
+		name = get_arg(dev, &args);
+		if (IS_ERR(name)) {
+			dev_err(dev, "Cannot get GPIO specifier: %ld\n",
+				PTR_ERR(name));
+			return PTR_ERR(name);
+		}
+
+		desc = gpio_name_to_desc(name);
+		if (desc) {
+			/* Named GPIO line */
+			error = add_gpio(dev, &descs, &n, desc);
+			if (error)
+				return error;
+
+			devm_kfree(dev, name);
+			continue;
+		}
+
+		/* GPIO chip + offsets */
+		chip = gpiochip_find_by_label(name);
+		if (!chip)
+			chip = gpiochip_find_by_id(name);
+		if (!chip) {
+			dev_err(dev, "Cannot find gpiochip %s\n", name);
+			return -EINVAL;
+		}
+
+		offsets = get_arg(dev, &args);
+		if (IS_ERR(offsets)) {
+			dev_err(dev, "Cannot get GPIO offsets: %ld\n",
+				PTR_ERR(offsets));
+			return PTR_ERR(offsets);
+		}
+
+		for (first = offsets; *first; first = next) {
+			next = strchrnul(first, ',');
+			if (*next)
+				*next++ = '\0';
+
+			last = strchr(first, '-');
+			if (last)
+				*last++ = '\0';
+
+			if (kstrtouint(first, 10, &a)) {
+				dev_err(dev, "Cannot parse gpio index %s\n",
+					first);
+				return -EINVAL;
+			}
+
+			if (!last) {
+				b = a;
+			} else if (kstrtouint(last, 10, &b)) {
+				dev_err(dev, "Cannot parse gpio index %s\n",
+					last);
+				return -EINVAL;
+			}
+
+			for (i = a; i <= b; i++) {
+				desc = gpiochip_get_desc(chip, i);
+				if (IS_ERR(desc)) {
+					dev_err(dev,
+						"Cannot get GPIO %s/%u: %ld\n",
+						name, i, PTR_ERR(desc));
+					return PTR_ERR(desc);
+				}
+
+				error = add_gpio(dev, &descs, &n, desc);
+				if (error)
+					return error;
+			}
+		}
+
+		devm_kfree(dev, offsets);
+		devm_kfree(dev, name);
+	}
+
+	if (!descs) {
+		dev_err(dev, "No GPIOs specified\n");
+		return -EINVAL;
+	}
+
+	fwd = gpiochip_fwd_create(dev_name(dev), dev, n, descs);
+	if (IS_ERR(fwd))
+		return PTR_ERR(fwd);
+
+	platform_set_drvdata(pdev, fwd);
+	return 0;
+}
+
+static int gpio_aggregator_remove(struct platform_device *pdev)
+{
+	struct gpiochip_fwd *fwd = platform_get_drvdata(pdev);
+
+	return gpiochip_fwd_destroy(fwd);
+}
+
+static struct platform_driver gpio_aggregator_driver = {
+	.probe = gpio_aggregator_probe,
+	.remove = gpio_aggregator_remove,
+	.driver = {
+		.name = DRV_NAME,
+		.groups = gpio_aggregator_groups,
+	},
+};
+
+static int __init gpio_aggregator_init(void)
+{
+	return platform_driver_register(&gpio_aggregator_driver);
+}
+module_init(gpio_aggregator_init);
+
+static int __exit gpio_aggregator_idr_remove(int id, void *p, void *data)
+{
+	struct gpio_aggregator *aggr = p;
+
+	platform_device_unregister(aggr->pdev);
+	kfree(aggr);
+	return 0;
+}
+
+static void __exit gpio_aggregator_exit(void)
+{
+	mutex_lock(&gpio_aggregator_lock);
+	idr_for_each(&gpio_aggregator_idr, gpio_aggregator_idr_remove, NULL);
+	idr_destroy(&gpio_aggregator_idr);
+	mutex_unlock(&gpio_aggregator_lock);
+
+	platform_driver_unregister(&gpio_aggregator_driver);
+}
+module_exit(gpio_aggregator_exit);
+
+MODULE_AUTHOR("Geert Uytterhoeven <geert+renesas@glider.be>");
+MODULE_DESCRIPTION("GPIO Aggregator");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

