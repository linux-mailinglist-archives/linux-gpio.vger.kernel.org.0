Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4F25821A1D3
	for <lists+linux-gpio@lfdr.de>; Thu,  9 Jul 2020 16:11:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726410AbgGIOL0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 9 Jul 2020 10:11:26 -0400
Received: from smtpcmd0871.aruba.it ([62.149.156.71]:44321 "EHLO
        smtpcmd0871.aruba.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726340AbgGIOL0 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Jul 2020 10:11:26 -0400
Received: from [192.168.1.129] ([93.146.66.165])
        by smtpcmd08.ad.aruba.it with bizsmtp
        id 12BL2300W3Zw7e5012BL0F; Thu, 09 Jul 2020 16:11:22 +0200
Subject: [RFC] GPIO lines [was: GPIO User I/O]
From:   Rodolfo Giometti <giometti@enneenne.com>
To:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
References: <01afcac0-bd34-3fd0-b991-a8b40d4b4561@enneenne.com>
 <CACRpkdbX9T9EuN-nxkMPC=sN74PEdoLuWurNLdGCzZJwwFrdpQ@mail.gmail.com>
 <1c4f1a83-835a-9317-3647-b55f6f39c0ba@enneenne.com>
 <CACRpkdZPjJSryJc+RtYjRN=X7xKMcao5pYek1fUM2+sE9xgdFQ@mail.gmail.com>
 <CAMuHMdUtguuu4FWU4nRS=pBUyEwKM1JZ8DYPdCQHXBYN0i_Frg@mail.gmail.com>
 <87efe96c-3679-14d5-4d79-569b6c047b00@enneenne.com>
 <CAMuHMdUght0hkJT1N8ub5xR5GB+U18MAhAg+zDmAAuxoRSRaYg@mail.gmail.com>
 <d30e64c9-ad7f-7cd5-51a4-3f37d6f1e3d8@enneenne.com>
Message-ID: <070fa558-6e20-0fbf-d3e4-0a0eca4fe82c@enneenne.com>
Date:   Thu, 9 Jul 2020 16:11:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <d30e64c9-ad7f-7cd5-51a4-3f37d6f1e3d8@enneenne.com>
Content-Type: multipart/mixed;
 boundary="------------349B4E7446A5F5834C3D4114"
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aruba.it; s=a1;
        t=1594303882; bh=LOxFIL0PHXNvH1kGqXseY7KgCXD1XJDLmod1oNyXSNg=;
        h=Subject:From:To:Date:MIME-Version:Content-Type;
        b=R/GU4pKzwwYt2C2bpISsg9knuRBDqcSFK9BiLnZaNO/SmfKeex8FcqK2tg/eyWmPB
         wPz8mn6l8DWJbMapjZG6Sj400EejmryTw7kxN6ikqNDsATDvwcRGxPHL+96vvKQ7wL
         TwIU5OdGK9NX7gyO9iytMim+PW9FtrGGsDJknjcOEgGnATqhVo7M3SAKVU9anBLgOg
         xMC1SX6qMnWysI05LV87atW5NQtGzk/oitUR8mNKvLlrC3RdgheNxQ7cIsdhZq1cdC
         3UurcZ8NJnyMQpgOPW4SK+9nNfbHkqsHNTYThrR7M6W/KH9N2Y7U++1Mk+na5NwpR0
         4D6Lnygdhn7sQ==
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is a multi-part message in MIME format.
--------------349B4E7446A5F5834C3D4114
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hello,

I reworked a bit my proposal due to the fact that the name "GPIO User I/O" is
not so clear as I supposed to be... so I renamed it as "GPIO lines". :)

Since this support is intended to allow boards developers to easily define their
GPIO lines for a well defined purpose from the userspace I thing this last name
is more appropriate.

Within the device tree we have to specify each line:

        gpio_lines {
                compatible = "gpio-line";

                bypass0 {
                        gpios = <&gpionb 10 GPIO_ACTIVE_HIGH>;
                        mode = "out-low";
                };

                bypass1 {
                        gpios = <&gpiosb 11 GPIO_ACTIVE_HIGH>;
                        mode = "out-low";
                };

                key {
                        gpios = <&gpionb 4 GPIO_ACTIVE_HIGH>;
                        mode = "input";
                };

                motor {
                        gpios = <&gpionb 8 GPIO_ACTIVE_HIGH>;
                        mode = "out-high-open-drain";
                };
        };

Then we enable the configuration settings CONFIG_GPIO_LINE so at boot we have:

[    2.377401] line bypass0: added
[    2.411496] line bypass1: added
[    2.416141] line key: added
[    2.419758] line motor: added

Then, when the boot is finished, we have the following entries in the new "line"
class:

# ls /sys/class/line/
bypass0  bypass1  key  motor

Now each line can be read and written by using the "state" attribute:

# cat /sys/class/line/bypass0/state
0
# echo 1 > /sys/class/line/bypass0/state
# cat /sys/class/line/bypass0/state
1

Hope it could be more acceptable now.

Please, let me know if should I propose a proper patch for inclusion or
something must be changed/added/fixed.

Ciao,

Rodolfo

-- 
GNU/Linux Solutions                  e-mail: giometti@enneenne.com
Linux Device Driver                          giometti@linux.it
Embedded Systems                     phone:  +39 349 2432127
UNIX programming                     skype:  rodolfo.giometti

--------------349B4E7446A5F5834C3D4114
Content-Type: text/x-patch; charset=UTF-8;
 name="gpio-lines.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="gpio-lines.patch"

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 4f52c3a8ec99..f117b0b9d33e 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -73,6 +73,16 @@ config GPIO_SYSFS
 	  Kernel drivers may also request that a particular GPIO be
 	  exported to userspace; this can be useful when debugging.
 
+config GPIO_LINE
+	bool "/sys/class/line/... (GPIO lines interface)"
+	depends on SYSFS
+	help
+	  Say Y here to add a sysfs interface to manage system's GPIO lines.
+
+	  Instead of the GPIO_SYSFS support, by using this support, you'll be
+	  able to use GPIOs from userspace as stated in the device-tree
+	  for well defined pourposes and by using proper names.
+
 config GPIO_GENERIC
 	depends on HAS_IOMEM # Only for IOMEM drivers
 	tristate
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index c256aff66a65..033a6b836dec 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_GPIOLIB)		+= gpiolib-legacy.o
 obj-$(CONFIG_GPIOLIB)		+= gpiolib-devprop.o
 obj-$(CONFIG_OF_GPIO)		+= gpiolib-of.o
 obj-$(CONFIG_GPIO_SYSFS)	+= gpiolib-sysfs.o
+obj-$(CONFIG_GPIO_LINE)		+= gpiolib-line.o
 obj-$(CONFIG_GPIO_ACPI)		+= gpiolib-acpi.o
 
 # Device drivers. Generally keep list sorted alphabetically
diff --git a/drivers/gpio/gpiolib-line.c b/drivers/gpio/gpiolib-line.c
new file mode 100644
index 000000000000..8abd08c1a5e3
--- /dev/null
+++ b/drivers/gpio/gpiolib-line.c
@@ -0,0 +1,256 @@
+/*
+ * GPIOlib - userspace I/O line interface
+ *
+ *
+ * Copyright (C) 2020   Rodolfo Giometti <giometti@enneenne.com>
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
+#define GPIO_LINE_MAX_SOURCES       128      /* should be enough... */
+
+/*
+ * Local variables
+ */
+
+static dev_t gpio_line_devt;
+static struct class *gpio_line_class;
+
+static DEFINE_MUTEX(gpio_line_idr_lock);
+static DEFINE_IDR(gpio_line_idr);
+
+struct gpio_line_device {
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
+static ssize_t state_store(struct device *dev,
+                                struct device_attribute *attr,
+                                const char *buf, size_t count)
+{
+        struct gpio_line_device *gpio_line = dev_get_drvdata(dev);
+        int status, ret;
+
+        ret = sscanf(buf, "%d", &status);
+        if (ret != 1 && status != 0 && status != 1)
+                return -EINVAL;
+
+	gpiod_set_value_cansleep(gpio_line->gpiod, status);
+
+        return count;
+}
+
+static ssize_t state_show(struct device *dev,
+				struct device_attribute *attr, char *buf)
+{
+	struct gpio_line_device *gpio_line = dev_get_drvdata(dev);
+	int status = gpiod_get_value_cansleep(gpio_line->gpiod);
+
+	return sprintf(buf, "%d\n", status);
+}
+static DEVICE_ATTR_RW(state);
+
+/*
+ * Class attributes
+ */
+
+static struct attribute *gpio_line_attrs[] = {
+        &dev_attr_state.attr,
+        NULL,
+};
+
+static const struct attribute_group gpio_line_group = {
+        .attrs = gpio_line_attrs,
+};
+
+static const struct attribute_group *gpio_line_groups[] = {
+        &gpio_line_group,
+        NULL,
+};
+
+/*
+ * Driver stuff
+ */
+
+static int gpio_line_create_entry(const char *name,
+				struct gpio_desc *gpiod,
+				struct device *parent)
+{
+	struct gpio_line_device *gpio_line;
+	dev_t devt;
+	int ret;
+
+	/* First allocate a new gpio_line device */
+	gpio_line = kmalloc(sizeof(struct gpio_line_device), GFP_KERNEL);
+	if (!gpio_line)
+		return -ENOMEM;
+
+        mutex_lock(&gpio_line_idr_lock);
+        /*
+         * Get new ID for the new gpio_line source.  After idr_alloc() calling
+         * the new source will be freely available into the kernel.
+         */
+        ret = idr_alloc(&gpio_line_idr, gpio_line, 0,
+			GPIO_LINE_MAX_SOURCES, GFP_KERNEL);
+        if (ret < 0) {
+                if (ret == -ENOSPC) {
+                        pr_err("%s: too many GPIO lines in the system\n",
+                               name);
+                        ret = -EBUSY;
+                }
+                goto error_device_create;
+        }
+        gpio_line->id = ret;
+        mutex_unlock(&gpio_line_idr_lock);
+
+	/* Create the device and init the device's data */
+        devt = MKDEV(MAJOR(gpio_line_devt), gpio_line->id);
+	gpio_line->dev = device_create(gpio_line_class, parent, devt, gpio_line,
+				   "%s", name);
+	if (IS_ERR(gpio_line->dev)) {
+		dev_err(gpio_line->dev, "unable to create device %s\n", name);
+		ret = PTR_ERR(gpio_line->dev);
+		goto error_idr_remove;
+	}
+	dev_set_drvdata(gpio_line->dev, gpio_line);
+
+	/* Init the gpio_line data */
+	gpio_line->gpiod = gpiod;
+	gpio_line->name = name;
+
+	dev_info(gpio_line->dev, "added\n");
+
+	return 0;
+
+error_idr_remove:
+	mutex_lock(&gpio_line_idr_lock);
+        idr_remove(&gpio_line_idr, gpio_line->id);
+
+error_device_create:
+	mutex_unlock(&gpio_line_idr_lock);
+	kfree(gpio_line);
+
+	return ret;
+}
+
+static int gpio_line_gpio_probe(struct platform_device *pdev)
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
+                ret = gpio_line_create_entry(label, gpiod, dev);
+                if (ret)
+                        goto skip;
+
+		/* Success, now go to the next child */
+		continue;
+
+skip:		/* Error, skip the child */
+		fwnode_handle_put(child);
+		dev_err(dev, "failed to register GPIO lines interface\n");
+        }
+
+        return 0;
+}
+
+static const struct of_device_id of_gpio_gpio_line_match[] = {
+        { .compatible = "gpio-line", },
+        { /* sentinel */ }
+};
+
+static struct platform_driver gpio_line_gpio_driver = {
+        .driver         = {
+                .name   = "gpio-line",
+                .of_match_table = of_gpio_gpio_line_match,
+        },
+};
+
+builtin_platform_driver_probe(gpio_line_gpio_driver, gpio_line_gpio_probe);
+
+/*
+ * Module stuff
+ */
+
+static int __init gpiolib_line_init(void)
+{
+	/* Create the new class */
+	gpio_line_class = class_create(THIS_MODULE, "line");
+	if (!gpio_line_class) {
+		printk(KERN_ERR "gpio_line: failed to create class\n");
+		return -ENOMEM;
+	}
+	gpio_line_class->dev_groups = gpio_line_groups;
+
+	return 0;
+}
+
+postcore_initcall(gpiolib_line_init);

--------------349B4E7446A5F5834C3D4114--
