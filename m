Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ED56B21572A
	for <lists+linux-gpio@lfdr.de>; Mon,  6 Jul 2020 14:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729015AbgGFM1B (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 Jul 2020 08:27:01 -0400
Received: from smtpcmd10101.aruba.it ([62.149.156.101]:45725 "EHLO
        smtpcmd10101.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729005AbgGFM1A (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Jul 2020 08:27:00 -0400
X-Greylist: delayed 426 seconds by postgrey-1.27 at vger.kernel.org; Mon, 06 Jul 2020 08:26:57 EDT
Received: from [192.168.1.129] ([93.146.66.165])
        by smtpcmd10.ad.aruba.it with bizsmtp
        id zoKp2200u3Zw7e501oKp3q; Mon, 06 Jul 2020 14:19:50 +0200
To:     linux-gpio@vger.kernel.org
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
From:   Rodolfo Giometti <giometti@enneenne.com>
Subject: [RFC] GPIO User I/O
Message-ID: <01afcac0-bd34-3fd0-b991-a8b40d4b4561@enneenne.com>
Date:   Mon, 6 Jul 2020 14:19:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------F97AFB3A45417D57663D427F"
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aruba.it; s=a1;
        t=1594037990; bh=jEyaY17giAY/EiDKdKlJ4/UQaU4RFwBbKlVo0IYwRjM=;
        h=To:From:Subject:Date:MIME-Version:Content-Type;
        b=eA7w449L6EIz5AbLMyw47TiRk7hc1JD3B4gRD9br8vY2/v6lBybPcuh0Z7Lord3w7
         DRkRgtk04fFVX+dAenA48lY4LcXbxgPpngy+eTe08TvxPCoOXL/sX++ny/aMqKmwzL
         +2+AKfsIZUqWwPWeU6DP7Wrirxo28rz2fFrtBhXpENt3JARuyFmMsvDQw7pwQrjRkO
         j84hIcZxZy2zTdoHHN0UOf5m3vfzRrkt7Toc2l8DT/KoHKIPwTNQcnlSjr58UkwaFR
         qSglq4p2FUOFs4Q6myW+YsT7Lgehvj67bGfMZkkJII7UUuq80ECCO0WmzFirH+cUmF
         Go3WUOTSca9Mg==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is a multi-part message in MIME format.
--------------F97AFB3A45417D57663D427F
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello,

at the moment if a developer wishes to use a GPIO as output or input with a well
defined name from userspace via the sysfs interface he/she can use,
respectively, the gpio-leds or gpio-uinput devices. However, IMHO, this is not
the best nor a proper way to do it, that's why I'm here to propose this really
simple interface named GPIO_UIO.

That's why I wrote the attached patch (for kernel 4.19) which it's just a
proposal, and the purpose of this message is to collect feedback about this
solution. Of course I'll be happy to port it for latest kernel release and
complete it with all requested documentation and needed modifications, but I'll
do it only if this patch has some changes to be accepted by GPIO subsystem's
maintainers. :)

For the moment here is how it works:

1) The patch is activated by the configuration entry CONFIG_GPIO_UIO.

2) In the device-tree the developer defines all board's GPIO lines with their
names and mode of functioning:

+       gpio_uio {
+               compatible = "gpio-uio";
+
+               bypass0 {
+                       gpios = <&gpionb 10 GPIO_ACTIVE_HIGH>;
+                       mode = "out-low";
+               };
+
+               bypass1 {
+                       gpios = <&gpiosb 11 GPIO_ACTIVE_HIGH>;
+                       mode = "out-low";
+                       label = "bypass-1";
+               };
+        };

Property "mode" can be "asis", "input", "out-low", etc. and the property label
can be used in case the GPIO line's name should be different from the node's name.

3) At boot the GPIO lines are added:

[    2.398902] gpio-uio bypass0: line added
[    2.423558] gpio-uio bypass-1: line added

4) Then users will find a new class with entries, one for each new line:

# ls /sys/class/gpio-uio/
bypass-1  bypass0

5) By using the attribute "line" the users can get or set the line status

# cat /sys/class/gpio-uio/bypass-1/line
0
# echo 1 > /sys/class/gpio-uio/bypass-1/line
# cat /sys/class/gpio-uio/bypass-1/line
1

6) Developers can monitor the GPIO lines via debugfs as for kernel modules:

# cat /sys/kernel/debug/gpio
gpiochip1: GPIOs 446-475, parent: platform/d0018800.pinctrl, GPIO2:
 gpio-457 (                    |bypass-1            ) out lo

gpiochip0: GPIOs 476-511, parent: platform/d0013800.pinctrl, GPIO1:
 gpio-479 (                    |cd                  ) in  hi IRQ
 gpio-480 (                    |vcc_sd1             ) out lo
 gpio-486 (                    |bypass0             ) out lo


The End. :)

Ciao,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming                     skype:  rodolfo.giometti

--------------F97AFB3A45417D57663D427F
Content-Type: text/x-patch; charset=UTF-8;
 name="rfc_gpio-uio.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="rfc_gpio-uio.patch"

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 4f52c3a8ec99..a072b45d7f20 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -73,6 +73,16 @@ config GPIO_SYSFS
 	  Kernel drivers may also request that a particular GPIO be
 	  exported to userspace; this can be useful when debugging.
 
+config GPIO_UIO
+	bool "/sys/class/gpio-uio/... (sysfs user I/O interface)"
+	depends on SYSFS
+	help
+	  Say Y here to add a sysfs interface for I/O activities from userspace.
+
+	  Instead of the GPIO_SYSFS support, by using this support, you'll be
+	  able to use GPIOs from userspace as stated in the device-tree
+	  for well defined pourposes and by using proper names.
+
 config GPIO_GENERIC
 	depends on HAS_IOMEM # Only for IOMEM drivers
 	tristate
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index c256aff66a65..2be35a9df6e0 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_GPIOLIB)		+= gpiolib-legacy.o
 obj-$(CONFIG_GPIOLIB)		+= gpiolib-devprop.o
 obj-$(CONFIG_OF_GPIO)		+= gpiolib-of.o
 obj-$(CONFIG_GPIO_SYSFS)	+= gpiolib-sysfs.o
+obj-$(CONFIG_GPIO_UIO)		+= gpiolib-uio.o
 obj-$(CONFIG_GPIO_ACPI)		+= gpiolib-acpi.o
 
 # Device drivers. Generally keep list sorted alphabetically
diff --git a/drivers/gpio/gpiolib-uio.c b/drivers/gpio/gpiolib-uio.c
new file mode 100644
index 000000000000..8d6f584c710e
--- /dev/null
+++ b/drivers/gpio/gpiolib-uio.c
@@ -0,0 +1,256 @@
+/*
+ * GPIOlib - userspace I/O interface
+ *
+ *
+ * Copyright (C) 2020   Rodolfo Giometti <giometti@linux.it>
+ *
+ *   This program is free software; you can redistribute it and/or modify
+ *   it under the terms of the GNU General Public License as published by
+ *   the Free Software Foundation; either version 2 of the License, or
+ *   (at your option) any later version.
+ *
+ *   This program is distributed in the hope that it will be useful,
+ *   but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *   GNU General Public License for more details.
+ *
+ *   You should have received a copy of the GNU General Public License
+ *   along with this program; if not, write to the Free Software
+ *   Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
+ */
+
+#include <linux/kernel.h>
+#include <linux/init.h>
+#include <linux/device.h>
+#include <linux/idr.h>
+#include <linux/kdev_t.h>
+#include <linux/mutex.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
+
+#define GPIOUIO_MAX_SOURCES       128      /* should be enough... */
+
+/*
+ * Local variables
+ */
+
+static dev_t gpiouio_devt;
+static struct class *gpiouio_class;
+
+static DEFINE_MUTEX(gpiouio_idr_lock);
+static DEFINE_IDR(gpiouio_idr);
+
+struct gpiouio_device {
+	struct gpio_desc *gpiod;
+        const char *name;
+        unsigned int id;
+        struct device *dev;
+};
+
+/*
+ * sysfs methods
+ */
+
+static ssize_t line_store(struct device *dev,
+                                struct device_attribute *attr,
+                                const char *buf, size_t count)
+{
+        struct gpiouio_device *gpiouio = dev_get_drvdata(dev);
+        int status, ret;
+
+        ret = sscanf(buf, "%d", &status);
+        if (ret != 1 && status != 0 && status != 1)
+                return -EINVAL;
+
+	gpiod_set_value_cansleep(gpiouio->gpiod, status);
+
+        return count;
+}
+
+static ssize_t line_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct gpiouio_device *gpiouio = dev_get_drvdata(dev);
+	int status = gpiod_get_value_cansleep(gpiouio->gpiod);
+
+	return sprintf(buf, "%d\n", status);
+}
+static DEVICE_ATTR_RW(line);
+
+/*
+ * Class attributes
+ */
+
+static struct attribute *gpiouio_attrs[] = {
+        &dev_attr_line.attr,
+        NULL,
+};
+
+static const struct attribute_group gpiouio_group = {
+        .attrs = gpiouio_attrs,
+};
+
+static const struct attribute_group *gpiouio_groups[] = {
+        &gpiouio_group,
+        NULL,
+};
+
+/*
+ * Driver stuff
+ */
+
+static int gpiouio_create_entry(const char *name,
+				struct gpio_desc *gpiod,
+				struct device *parent)
+{
+	struct gpiouio_device *gpiouio;
+	dev_t devt;
+	int ret;
+
+	/* First allocate a new gpiouio device */
+	gpiouio = kmalloc(sizeof(struct gpiouio_device), GFP_KERNEL);
+	if (!gpiouio)
+		return -ENOMEM;
+
+        mutex_lock(&gpiouio_idr_lock);
+        /*
+         * Get new ID for the new gpiouio source.  After idr_alloc() calling
+         * the new source will be freely available into the kernel.
+         */
+        ret = idr_alloc(&gpiouio_idr, gpiouio, 0,
+			GPIOUIO_MAX_SOURCES, GFP_KERNEL);
+        if (ret < 0) {
+                if (ret == -ENOSPC) {
+                        pr_err("%s: too many PPS sources in the system\n",
+                               name);
+                        ret = -EBUSY;
+                }
+                goto error_device_create;
+        }
+        gpiouio->id = ret;
+        mutex_unlock(&gpiouio_idr_lock);
+
+	/* Create the device and init the device's data */
+        devt = MKDEV(MAJOR(gpiouio_devt), gpiouio->id);
+	gpiouio->dev = device_create(gpiouio_class, parent, devt, gpiouio,
+				   "%s", name);
+	if (IS_ERR(gpiouio->dev)) {
+		dev_err(gpiouio->dev, "unable to create device %s\n", name);
+		ret = PTR_ERR(gpiouio->dev);
+		goto error_idr_remove;
+	}
+	dev_set_drvdata(gpiouio->dev, gpiouio);
+
+	/* Init the gpiouio data */
+	gpiouio->gpiod = gpiod;
+	gpiouio->name = name;
+
+	dev_info(gpiouio->dev, "line added\n");
+
+	return 0;
+
+error_idr_remove:
+	mutex_lock(&gpiouio_idr_lock);
+        idr_remove(&gpiouio_idr, gpiouio->id);
+
+error_device_create:
+	mutex_unlock(&gpiouio_idr_lock);
+	kfree(gpiouio);
+
+	return ret;
+}
+
+static int gpiouio_gpio_probe(struct platform_device *pdev)
+{
+        struct device *dev = &pdev->dev;
+        struct fwnode_handle *child;
+        int ret;
+
+        device_for_each_child_node(dev, child) {
+		struct device_node *np = to_of_node(child);
+                const char *label;
+		enum gpiod_flags flags = GPIOD_ASIS;
+                const char *mode = "as-is";
+		struct gpio_desc *gpiod;
+
+                ret = fwnode_property_read_string(child, "label", &label);
+                if (ret && IS_ENABLED(CONFIG_OF) && np)
+                        label = np->name;
+                if (!label) {
+                        dev_err(dev,
+				"label property not defined or invalid!\n");
+                        goto skip;
+                }
+
+		ret = fwnode_property_read_string(child, "mode", &mode);
+		if ((ret == 0) && mode) {
+			if (strcmp("as-is", mode) == 0)
+				flags = GPIOD_ASIS;
+			else if (strcmp("input", mode) == 0)
+				flags = GPIOD_IN;
+			else if (strcmp("out-low", mode) == 0)
+				flags = GPIOD_OUT_LOW;
+			else if (strcmp("out-high", mode) == 0)
+				flags = GPIOD_OUT_HIGH;
+			else if (strcmp("out-low-open-drain", mode) == 0)
+				flags = GPIOD_OUT_LOW_OPEN_DRAIN;
+			else if (strcmp("out-high-open-drain", mode) == 0)
+				flags = GPIOD_OUT_HIGH_OPEN_DRAIN;
+		}
+
+                gpiod = devm_fwnode_get_gpiod_from_child(dev, NULL, child,
+                                                         flags, label);
+                if (IS_ERR(gpiod)) {
+                        dev_err(dev, "gpios property not defined!\n");
+                        goto skip;
+                }
+
+                ret = gpiouio_create_entry(label, gpiod, dev);
+                if (ret)
+                        goto skip;
+
+		/* Success, now go to the next child */
+		continue;
+
+skip:		/* Error, skip the child */
+		fwnode_handle_put(child);
+		dev_err(dev, "failed to register GPIO UIO interface\n");
+        }
+
+        return 0;
+}
+
+static const struct of_device_id of_gpio_gpiouio_match[] = {
+        { .compatible = "gpio-uio", },
+        { /* sentinel */ }
+};
+
+static struct platform_driver gpiouio_gpio_driver = {
+        .driver         = {
+                .name   = "gpio-uio",
+                .of_match_table = of_gpio_gpiouio_match,
+        },
+};
+
+builtin_platform_driver_probe(gpiouio_gpio_driver, gpiouio_gpio_probe);
+
+/*
+ * Module stuff
+ */
+
+static int __init gpiolib_uio_init(void)
+{
+	/* Create the new class */
+	gpiouio_class = class_create(THIS_MODULE, "gpio-uio");
+	if (!gpiouio_class) {
+		printk(KERN_ERR "gpiouio: failed to allocate class\n");
+		return -ENOMEM;
+	}
+	gpiouio_class->dev_groups = gpiouio_groups;
+
+	return 0;
+}
+
+postcore_initcall(gpiolib_uio_init);

--------------F97AFB3A45417D57663D427F--
