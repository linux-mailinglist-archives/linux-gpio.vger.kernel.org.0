Return-Path: <linux-gpio+bounces-7749-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4C291A5AD
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 13:51:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 54BA31C23189
	for <lists+linux-gpio@lfdr.de>; Thu, 27 Jun 2024 11:51:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C1C14D439;
	Thu, 27 Jun 2024 11:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="f+NHfJZe"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64B514882B
	for <linux-gpio@vger.kernel.org>; Thu, 27 Jun 2024 11:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719489085; cv=none; b=iY+MMlYmOz9nL+RgFpTe7WIiEMvrEs0FLHGn9Yrwhl2BTGpFPv1I2QOyxNzQRQLRIRuC6j4s5Twl/ZTn4QwynFj9H/jKjPFoXs1wcsn5OIanOGk6YwYFd/swoxN56DJg6Ywnea9shGmOC2Z2HHKWtI8dd6Lr4fs40K6KUc7VMO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719489085; c=relaxed/simple;
	bh=c369xfbIMK+SYPki2m7iqgjEBMzy2g4h5p2oEMfPcqo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rBezkrDNzhsWwH10T/Hb29qD6EOwrstdlmrB//w6+6DmNeJwUSPUubFYoGj6MwU1uIW983+62MIocJkUIZ1rSnVACB+m5JifYmZwDthmDU3WIEDq6hFPwPHwXaiWBNwdnsSn8GjWJ3JC9icXqqb0FRK5TGjiv2HSlfLizbH5nPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=f+NHfJZe; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-424a3ccd0c0so24394845e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 27 Jun 2024 04:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719489080; x=1720093880; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J6v0yn/qAttxyEwsY6tvbzrCxCevC46o8t2HSgRyyDg=;
        b=f+NHfJZet9kTmo1BnRCPq9MX8TrLpLtamZ7U3L3agO9w2L48xewvlcDOwTQOnI9pQI
         NJtyQIvgQ/XBlYEdNM53rDWZmqQwL5ZfgchbTahx4rOHFp+85p4+N7Xm/RUn4KzOb+m3
         ckrh/ae1iDq6Eo0W/636SOdPAKsMQHduiCBMmhIlOwGHsyumjFTHfgRjH6F42CW56oXt
         hqHKRf6oWSV4RGZtGj1k9WiPYRV7D1BaIeSSwM2EXhxRcaBEwMDXVCKfnW3OC6cXjn6T
         CeXQK8+9uUnALvpqYuS7yW3pUTiDjVOveOI8lS3VCBoZplPxcX8VePpdN7vP079FlUPi
         8WZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719489080; x=1720093880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J6v0yn/qAttxyEwsY6tvbzrCxCevC46o8t2HSgRyyDg=;
        b=LKPDD9gcn6ajLJRGoFkmteoxEJlu96VSrwIbij4Drx0J4Ic1yfo854IFNYJ+BENTv1
         aEF/90d3A58tqVOr/Ebtc6CdfxBCHJgfTRR4+UTrntiSUqAQR4Ts5N0OdD+hYixv3o60
         dGBaZuNFwnrnGd8d75qrpXZmS7FBXbTf6lktlHKu0ufel8Fcncb2mJAZy5/SzG2TQh5i
         fpPgdyk87I7KB6X7lk7l8cFRGTGj25HVawgUTz/MRwi43agjKv/mB+4Obc7eukWzVR9h
         YEy8tQdK1jlZzlPjchEHPo+J9a31To9fMshEsn3aUscHBwp2xUNRDmNTDN9YDJtuTvih
         HRmA==
X-Gm-Message-State: AOJu0YwO4PhtopBzHEzF4ZCvcpNq2OqOU1qiIfYFIGCAcktu+2DXEvMy
	oQ1MF0q77QkLJtAkwUe8hsN+sNhQFntmEDDfmM2bGnACHue/UvKQJjX0cH4EUgs=
X-Google-Smtp-Source: AGHT+IGFbHgOLpLyPSZtCVZdg0vf/1QWdTTt0hwjgZ7mf9m2htH5Atu+98HVPTt+QvliwbSi97Xcjg==
X-Received: by 2002:a05:600c:4f09:b0:425:680b:a6a8 with SMTP id 5b1f17b1804b1-425680ba7camr2359075e9.15.1719489079711;
        Thu, 27 Jun 2024 04:51:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7fe5:47e9:28c5:7f25])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36743585633sm1614860f8f.59.2024.06.27.04.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 04:51:18 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Wolfram Sang <wsa@the-dreams.de>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v9] gpio: virtuser: new virtual testing driver for the GPIO API
Date: Thu, 27 Jun 2024 13:51:12 +0200
Message-ID: <20240627115112.25769-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The GPIO subsystem used to have a serious problem with undefined behavior
and use-after-free bugs on hot-unplug of GPIO chips. This can be
considered a corner-case by some as most GPIO controllers are enabled
early in the boot process and live until the system goes down but most
GPIO drivers do allow unbind over sysfs, many are loadable modules that
can be (force) unloaded and there are also GPIO devices that can be
dynamically detached, for instance CP2112 which is a USB GPIO expender.

Bugs can be triggered both from user-space as well as by in-kernel users.
We have the means of testing it from user-space via the character device
but the issues manifest themselves differently in the kernel.

This is a proposition of adding a new virtual driver - a configurable
GPIO consumer that can be configured over configfs (similarly to
gpio-sim) or described on the device-tree.

This driver is aimed as a helper in spotting any regressions in
hot-unplug handling in GPIOLIB.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
v8 -> v9:
- use debugfs instead of sysfs for more flexibility on attribute formats
- move the module back to drivers/gpio/
- extend Kconfig description
- minor tweaks and improvements across the driver
Link to v8: https://lore.kernel.org/linux-doc/20240613092830.15761-1-brgl@bgdev.pl/

v7 -> v8:
- move the driver to drivers/misc/ as it's not a GPIO provider and so
  its place is not in drivers/gpio/
- rework the data structures to make them more compact using unions
- use correct string helpers for given use-cases
- drop dependency on the gpio/driver.h, string.h and kernel.h headers
- add a patch exporting to_ext_attribute() to be used by this driver
- various minor improvements suggested by Andy
Link to v7: https://lore.kernel.org/linux-gpio/20240527144054.155503-1-brgl@bgdev.pl/

v6 -> v7:
- this is a complete rewrite of the original idea, the entire interface
  has changed so it warrants a new round of reviews
Link to v6: https://lore.kernel.org/linux-gpio/20230817184356.25020-1-brgl@bgdev.pl/

v5 -> v6:
- initialize the flags temp variables at declaration and hopefully make
  Andy happy finally :)

v4 -> v5:
- add the gpio-consumer docs to the admin-guide/gpio/ index (reported
  by kernel test robot <lkp@intel.com>)

v3 -> v4:
- fix the toggle value assignment
- use guard(mutex)() wherever we can return directly from the subsequent
  function call
- use skip_spaces() + strim() to avoid having to do a memmove() when
  stripping strings off whitespaces
- DON'T try to save a couple LOC in ifdefs if that makes them less
  readable (Andy :) )

v2 -> v3:
- use cleanup.h interfaces
- add some clarifying commets
- more minor code tweaks

RFC -> v2:
- add documentation
- fix various issues pointed out by Andy: use struct_size() where
  applicable, improve the logic when storing the 'live' property,
  improve log messages, remove commas in terminators, etc.

 .../admin-guide/gpio/gpio-virtuser.rst        |  177 ++
 Documentation/admin-guide/gpio/index.rst      |    1 +
 drivers/gpio/Kconfig                          |   16 +
 drivers/gpio/Makefile                         |    1 +
 drivers/gpio/gpio-virtuser.c                  | 1807 +++++++++++++++++
 5 files changed, 2002 insertions(+)
 create mode 100644 Documentation/admin-guide/gpio/gpio-virtuser.rst
 create mode 100644 drivers/gpio/gpio-virtuser.c

diff --git a/Documentation/admin-guide/gpio/gpio-virtuser.rst b/Documentation/admin-guide/gpio/gpio-virtuser.rst
new file mode 100644
index 000000000000..2aca70db9f3b
--- /dev/null
+++ b/Documentation/admin-guide/gpio/gpio-virtuser.rst
@@ -0,0 +1,177 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Virtual GPIO Consumer
+=====================
+
+The virtual GPIO Consumer module allows users to instantiate virtual devices
+that request GPIOs and then control their behavior over debugfs. Virtual
+consumer devices can be instantiated from device-tree or over configfs.
+
+A virtual consumer uses the driver-facing GPIO APIs and allows to cover it with
+automated tests driven by user-space. The GPIOs are requested using
+``gpiod_get_array()`` and so we support multiple GPIOs per connector ID.
+
+Creating GPIO consumers
+-----------------------
+
+The gpio-consumer module registers a configfs subsystem called
+``'gpio-virtuser'``. For details of the configfs filesystem, please refer to
+the configfs documentation.
+
+The user can create a hierarchy of configfs groups and items as well as modify
+values of exposed attributes. Once the consumer is instantiated, this hierarchy
+will be translated to appropriate device properties. The general structure is:
+
+**Group:** ``/config/gpio-virtuser``
+
+This is the top directory of the gpio-consumer configfs tree.
+
+**Group:** ``/config/gpio-consumer/example-name``
+
+**Attribute:** ``/config/gpio-consumer/example-name/live``
+
+**Attribute:** ``/config/gpio-consumer/example-name/dev_name``
+
+This is a directory representing a GPIO consumer device.
+
+The read-only ``dev_name`` attribute exposes the name of the device as it will
+appear in the system on the platform bus. This is useful for locating the
+associated debugfs directory under
+``/sys/kernel/debug/gpio-virtuser/$dev_name``.
+
+The ``'live'`` attribute allows to trigger the actual creation of the device
+once it's fully configured. The accepted values are: ``'1'`` to enable the
+virtual device and ``'0'`` to disable and tear it down.
+
+Creating GPIO lookup tables
+---------------------------
+
+Users can create a number of configfs groups under the device group:
+
+**Group:** ``/config/gpio-consumer/example-name/con_id``
+
+The ``'con_id'`` directory represents a single GPIO lookup and its value maps
+to the ``'con_id'`` argument of the ``gpiod_get()`` function. For example:
+``con_id`` == ``'reset'`` maps to the ``reset-gpios`` device property.
+
+Users can assign a number of GPIOs to each lookup. Each GPIO is a sub-directory
+with a user-defined name under the ``'con_id'`` group.
+
+**Attribute:** ``/config/gpio-consumer/example-name/con_id/0/key``
+
+**Attribute:** ``/config/gpio-consumer/example-name/con_id/0/offset``
+
+**Attribute:** ``/config/gpio-consumer/example-name/con_id/0/drive``
+
+**Attribute:** ``/config/gpio-consumer/example-name/con_id/0/pull``
+
+**Attribute:** ``/config/gpio-consumer/example-name/con_id/0/active_low``
+
+**Attribute:** ``/config/gpio-consumer/example-name/con_id/0/transitory``
+
+This is a group describing a single GPIO in the ``con_id-gpios`` property.
+
+For virtual consumers created using configfs we use machine lookup tables so
+this group can be considered as a mapping between the filesystem and the fields
+of a single entry in ``'struct gpiod_lookup'``.
+
+The ``'key'`` attribute represents either the name of the chip this GPIO
+belongs to or the GPIO line name. This depends on the value of the ``'offset'``
+attribute: if its value is >= 0, then ``'key'`` represents the label of the
+chip to lookup while ``'offset'`` represents the offset of the line in that
+chip. If ``'offset'`` is < 0, then ``'key'`` represents the name of the line.
+
+The remaining attributes map to the ``'flags'`` field of the GPIO lookup
+struct. The first two take string values as arguments:
+
+**``'drive'``:** ``'push-pull'``, ``'open-drain'``, ``'open-source'``
+**``'pull'``:** ``'pull-up'``, ``'pull-down'``, ``'pull-disabled'``, ``'as-is'``
+
+``'active_low'`` and ``'transitory'`` are boolean attributes.
+
+Activating GPIO consumers
+-------------------------
+
+Once the confiuration is complete, the ``'live'`` attribute must be set to 1 in
+order to instantiate the consumer. It can be set back to 0 to destroy the
+virtual device. The module will synchronously wait for the new simulated device
+to be successfully probed and if this doesn't happen, writing to ``'live'`` will
+result in an error.
+
+Device-tree
+-----------
+
+Virtual GPIO consumers can also be defined in device-tree. The compatible string
+must be: ``"gpio-virtuser"`` with at least one property following the
+standardized GPIO pattern.
+
+An example device-tree code defining a virtual GPIO consumer:
+
+.. code-block :: none
+
+    gpio-virt-consumer {
+        compatible = "gpio-virtuser";
+
+        foo-gpios = <&gpio0 5 GPIO_ACTIVE_LOW>, <&gpio1 2 0>;
+        bar-gpios = <&gpio0 6 0>;
+    };
+
+Controlling virtual GPIO consumers
+----------------------------------
+
+Once active, the device will export debugfs attributes for controlling GPIO
+arrays as well as each requested GPIO line separately. Let's consider the
+following device property: ``foo-gpios = <&gpio0 0 0>, <&gpio0 4 0>;``.
+
+The following debugfs attribute groups will be created:
+
+**Group:** ``/sys/kernel/debug/gpio-virtuser/$dev_name/gpiod:foo/``
+
+This is the group that will contain the attributes for the entire GPIO array.
+
+**Attribute:** ``/sys/kernel/debug/gpio-virtuser/$dev_name/gpiod:foo/values``
+
+**Attribute:** ``/sys/kernel/debug/gpio-virtuser/$dev_name/gpiod:foo/values_atomic``
+
+Both attributes allow to read and set arrays of GPIO values. User must pass
+exactly the number of values that the array contains in the form of a string
+containing zeroes and ones representing inactive and active GPIO states
+respectively. In this example: ``echo 11 > values``.
+
+The ``values_atomic`` attribute works the same as ``values`` but the kernel
+will execute the GPIO driver callbacks in interrupt context.
+
+**Group:** ``/sys/kernel/debug/gpio-virtuser/$dev_name/gpiod:foo:$index/``
+
+This is a group that represents a single GPIO with ``$index`` being its offset
+in the array.
+
+**Attribute:** ``/sys/kernel/debug/gpio-virtuser/$dev_name/gpiod:foo:$index/consumer``
+
+Allows to set and read the consumer label of the GPIO line.
+
+**Attribute:** ``/sys/kernel/debug/gpio-virtuser/$dev_name/gpiod:foo:$index/debounce``
+
+Allows to set and read the debounce period of the GPIO line.
+
+**Attribute:** ``/sys/kernel/debug/gpio-virtuser/$dev_name/gpiod:foo:$index/direction``
+
+**Attribute:** ``/sys/kernel/debug/gpio-virtuser/$dev_name/gpiod:foo:$index/direction_atomic``
+
+These two attributes allow to set the direction of the GPIO line. They accept
+"input" and "output" as values. The atomic variant executes the driver callback
+in interrupt context.
+
+**Attribute:** ``/sys/kernel/debug/gpio-virtuser/$dev_name/gpiod:foo:$index/interrupts``
+
+If the line is requested in input mode, writing ``1`` to this attribute will
+make the module listen for edge interrupts on the GPIO. Writing ``0`` disables
+the monitoring. Reading this attribute returns the current number of registered
+interrupts (both edges).
+
+**Attribute:** ``/sys/kernel/debug/gpio-virtuser/$dev_name/gpiod:foo:$index/value``
+
+**Attribute:** ``/sys/kernel/debug/gpio-virtuser/$dev_name/gpiod:foo:$index/value_atomic``
+
+Both attributes allow to read and set values of individual requested GPIO lines.
+They accept the following values: ``1`` and ``0``.
diff --git a/Documentation/admin-guide/gpio/index.rst b/Documentation/admin-guide/gpio/index.rst
index 460afd29617e..712f379731cb 100644
--- a/Documentation/admin-guide/gpio/index.rst
+++ b/Documentation/admin-guide/gpio/index.rst
@@ -10,6 +10,7 @@ GPIO
     Character Device Userspace API <../../userspace-api/gpio/chardev>
     gpio-aggregator
     gpio-sim
+    gpio-virtuser
     Obsolete APIs <obsolete>
 
 .. only::  subproject and html
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index dfb8dc850f3c..412e7a9ec49e 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1891,4 +1891,20 @@ config GPIO_SIM
 
 endmenu
 
+menu "GPIO Debugging utilities"
+
+config GPIO_VIRTUSER
+	tristate "GPIO Virtual User Testing Module"
+	select DEBUG_FS
+	select CONFIGFS_FS
+	select IRQ_WORK
+	help
+	  Say Y here to enable the configurable, configfs-based virtual GPIO
+	  consumer testing driver.
+
+	  This driver is aimed as a helper in spotting any regressions in
+	  hot-unplug handling in GPIOLIB.
+
+endmenu
+
 endif
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index e2a53013780e..7813edd4ed68 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -181,6 +181,7 @@ obj-$(CONFIG_GPIO_TWL6040)		+= gpio-twl6040.o
 obj-$(CONFIG_GPIO_UNIPHIER)		+= gpio-uniphier.o
 obj-$(CONFIG_GPIO_VF610)		+= gpio-vf610.o
 obj-$(CONFIG_GPIO_VIPERBOARD)		+= gpio-viperboard.o
+obj-$(CONFIG_GPIO_VIRTUSER)		+= gpio-virtuser.o
 obj-$(CONFIG_GPIO_VIRTIO)		+= gpio-virtio.o
 obj-$(CONFIG_GPIO_VISCONTI)		+= gpio-visconti.o
 obj-$(CONFIG_GPIO_VX855)		+= gpio-vx855.o
diff --git a/drivers/gpio/gpio-virtuser.c b/drivers/gpio/gpio-virtuser.c
new file mode 100644
index 000000000000..a412b2f5954e
--- /dev/null
+++ b/drivers/gpio/gpio-virtuser.c
@@ -0,0 +1,1807 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Configurable virtual GPIO consumer module.
+ *
+ * Copyright (C) 2023-2024 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/array_size.h>
+#include <linux/atomic.h>
+#include <linux/bitmap.h>
+#include <linux/cleanup.h>
+#include <linux/completion.h>
+#include <linux/configfs.h>
+#include <linux/debugfs.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
+#include <linux/idr.h>
+#include <linux/interrupt.h>
+#include <linux/irq_work.h>
+#include <linux/limits.h>
+#include <linux/list.h>
+#include <linux/lockdep.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/notifier.h>
+#include <linux/of.h>
+#include <linux/overflow.h>
+#include <linux/platform_device.h>
+#include <linux/printk.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+#include <linux/string_helpers.h>
+#include <linux/types.h>
+
+#define GPIO_VIRTUSER_NAME_BUF_LEN 32
+
+static DEFINE_IDA(gpio_virtuser_ida);
+static struct dentry *gpio_virtuser_dbg_root;
+
+struct gpio_virtuser_attr_data {
+	union {
+		struct gpio_desc *desc;
+		struct gpio_descs *descs;
+	};
+	struct dentry *dbgfs_dir;
+};
+
+struct gpio_virtuser_line_array_data {
+	struct gpio_virtuser_attr_data ad;
+};
+
+struct gpio_virtuser_line_data {
+	struct gpio_virtuser_attr_data ad;
+	char consumer[GPIO_VIRTUSER_NAME_BUF_LEN];
+	struct mutex consumer_lock;
+	unsigned int debounce;
+	atomic_t irq;
+	atomic_t irq_count;
+};
+
+struct gpio_virtuser_dbgfs_attr_descr {
+	const char *name;
+	const struct file_operations *fops;
+};
+
+struct gpio_virtuser_irq_work_context {
+	struct irq_work work;
+	struct completion work_completion;
+	union {
+		struct {
+			struct gpio_desc *desc;
+			int dir;
+			int val;
+			int ret;
+		};
+		struct {
+			struct gpio_descs *descs;
+			unsigned long *values;
+		};
+	};
+};
+
+static struct gpio_virtuser_irq_work_context *
+to_gpio_virtuser_irq_work_context(struct irq_work *work)
+{
+	return container_of(work, struct gpio_virtuser_irq_work_context, work);
+}
+
+static void
+gpio_virtuser_init_irq_work_context(struct gpio_virtuser_irq_work_context *ctx)
+{
+	memset(ctx, 0, sizeof(*ctx));
+	init_completion(&ctx->work_completion);
+}
+
+static void
+gpio_virtuser_irq_work_queue_sync(struct gpio_virtuser_irq_work_context *ctx)
+{
+	irq_work_queue(&ctx->work);
+	wait_for_completion(&ctx->work_completion);
+}
+
+static void gpio_virtuser_dbgfs_emit_value_array(char *buf,
+						 unsigned long *values,
+						 size_t num_values)
+{
+	size_t i;
+
+	for (i = 0; i < num_values; i++)
+		buf[i] = test_bit(i, values) ? '1' : '0';
+
+	buf[i++] = '\n';
+}
+
+static void gpio_virtuser_get_value_array_atomic(struct irq_work *work)
+{
+	struct gpio_virtuser_irq_work_context *ctx =
+				to_gpio_virtuser_irq_work_context(work);
+	struct gpio_descs *descs = ctx->descs;
+
+	ctx->ret = gpiod_get_array_value(descs->ndescs, descs->desc,
+					 descs->info, ctx->values);
+	complete(&ctx->work_completion);
+}
+
+static int gpio_virtuser_get_array_value(struct gpio_descs *descs,
+					 unsigned long *values, bool atomic)
+{
+	struct gpio_virtuser_irq_work_context ctx;
+
+	if (!atomic)
+		return gpiod_get_array_value_cansleep(descs->ndescs,
+						      descs->desc,
+						      descs->info, values);
+
+	gpio_virtuser_init_irq_work_context(&ctx);
+	ctx.work = IRQ_WORK_INIT_HARD(gpio_virtuser_get_value_array_atomic);
+	ctx.descs = descs;
+	ctx.values = values;
+
+	gpio_virtuser_irq_work_queue_sync(&ctx);
+
+	return ctx.ret;
+}
+
+static ssize_t gpio_virtuser_value_array_do_read(struct file *file,
+						 char __user *user_buf,
+						 size_t size, loff_t *ppos,
+						 bool atomic)
+{
+	struct gpio_virtuser_line_data *data = file->private_data;
+	struct gpio_descs *descs = data->ad.descs;
+	size_t bufsize;
+	int ret;
+
+	unsigned long *values __free(bitmap) = bitmap_zalloc(descs->ndescs,
+							     GFP_KERNEL);
+	if (!values)
+		return -ENOMEM;
+
+	ret = gpio_virtuser_get_array_value(descs, values, atomic);
+	if (ret)
+		return ret;
+
+	bufsize = descs->ndescs + 2;
+
+	char *buf __free(kfree) = kzalloc(bufsize, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	gpio_virtuser_dbgfs_emit_value_array(buf, values, descs->ndescs);
+
+	return simple_read_from_buffer(user_buf, size, ppos, buf,
+				       descs->ndescs + 1);
+}
+
+static int gpio_virtuser_dbgfs_parse_value_array(const char *buf,
+						 size_t len,
+						 unsigned long *values)
+{
+	size_t i;
+
+	for (i = 0; i < len; i++) {
+		if (buf[i] == '0')
+			clear_bit(i, values);
+		else if (buf[i] == '1')
+			set_bit(i, values);
+		else
+			return -EINVAL;
+	}
+
+	return 0;
+}
+
+static void gpio_virtuser_set_value_array_atomic(struct irq_work *work)
+{
+	struct gpio_virtuser_irq_work_context *ctx =
+				to_gpio_virtuser_irq_work_context(work);
+	struct gpio_descs *descs = ctx->descs;
+
+	ctx->ret = gpiod_set_array_value(descs->ndescs, descs->desc,
+					 descs->info, ctx->values);
+	complete(&ctx->work_completion);
+}
+
+static int gpio_virtuser_set_array_value(struct gpio_descs *descs,
+					 unsigned long *values, bool atomic)
+{
+	struct gpio_virtuser_irq_work_context ctx;
+
+	if (!atomic)
+		return gpiod_set_array_value_cansleep(descs->ndescs,
+						      descs->desc,
+						      descs->info, values);
+
+	gpio_virtuser_init_irq_work_context(&ctx);
+	ctx.work = IRQ_WORK_INIT_HARD(gpio_virtuser_set_value_array_atomic);
+	ctx.descs = descs;
+	ctx.values = values;
+
+	gpio_virtuser_irq_work_queue_sync(&ctx);
+
+	return ctx.ret;
+}
+
+static ssize_t gpio_virtuser_value_array_do_write(struct file *file,
+						  const char __user *user_buf,
+						  size_t count, loff_t *ppos,
+						  bool atomic)
+{
+	struct gpio_virtuser_line_data *data = file->private_data;
+	struct gpio_descs *descs = data->ad.descs;
+	int ret;
+
+	if (count - 1 != descs->ndescs)
+		return -EINVAL;
+
+	char *buf __free(kfree) = kzalloc(count, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = simple_write_to_buffer(buf, count, ppos, user_buf, count);
+	if (ret < 0)
+		return ret;
+
+	unsigned long *values __free(bitmap) = bitmap_zalloc(descs->ndescs,
+							     GFP_KERNEL);
+	if (!values)
+		return -ENOMEM;
+
+	ret = gpio_virtuser_dbgfs_parse_value_array(buf, count - 1, values);
+	if (ret)
+		return ret;
+
+	ret = gpio_virtuser_set_array_value(descs, values, atomic);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static ssize_t gpio_virtuser_value_array_read(struct file *file,
+					      char __user *user_buf,
+					      size_t count, loff_t *ppos)
+{
+	return gpio_virtuser_value_array_do_read(file, user_buf, count, ppos,
+						 false);
+}
+
+static ssize_t gpio_virtuser_value_array_write(struct file *file,
+					       const char __user *user_buf,
+					       size_t count, loff_t *ppos)
+{
+	return gpio_virtuser_value_array_do_write(file, user_buf, count, ppos,
+						  false);
+}
+
+static const struct file_operations gpio_virtuser_value_array_fops = {
+	.read = gpio_virtuser_value_array_read,
+	.write = gpio_virtuser_value_array_write,
+	.open = simple_open,
+	.owner = THIS_MODULE,
+	.llseek = default_llseek,
+};
+
+static ssize_t
+gpio_virtuser_value_array_atomic_read(struct file *file, char __user *user_buf,
+				      size_t count, loff_t *ppos)
+{
+	return gpio_virtuser_value_array_do_read(file, user_buf, count, ppos,
+						 true);
+}
+
+static ssize_t
+gpio_virtuser_value_array_atomic_write(struct file *file,
+				       const char __user *user_buf,
+				       size_t count, loff_t *ppos)
+{
+	return gpio_virtuser_value_array_do_write(file, user_buf, count, ppos,
+						  true);
+}
+
+static const struct file_operations gpio_virtuser_value_array_atomic_fops = {
+	.read = gpio_virtuser_value_array_atomic_read,
+	.write = gpio_virtuser_value_array_atomic_write,
+	.open = simple_open,
+	.owner = THIS_MODULE,
+	.llseek = default_llseek,
+};
+
+static void gpio_virtuser_do_get_direction_atomic(struct irq_work *work)
+{
+	struct gpio_virtuser_irq_work_context *ctx =
+				to_gpio_virtuser_irq_work_context(work);
+
+	ctx->ret = gpiod_get_direction(ctx->desc);
+	complete(&ctx->work_completion);
+}
+
+static int gpio_virtuser_get_direction_atomic(struct gpio_desc *desc)
+{
+	struct gpio_virtuser_irq_work_context ctx;
+
+	gpio_virtuser_init_irq_work_context(&ctx);
+	ctx.work = IRQ_WORK_INIT_HARD(gpio_virtuser_do_get_direction_atomic);
+	ctx.desc = desc;
+
+	gpio_virtuser_irq_work_queue_sync(&ctx);
+
+	return ctx.ret;
+}
+
+static ssize_t gpio_virtuser_direction_do_read(struct file *file,
+					       char __user *user_buf,
+					       size_t size, loff_t *ppos,
+					       bool atomic)
+{
+	struct gpio_virtuser_line_data *data = file->private_data;
+	struct gpio_desc *desc = data->ad.desc;
+	char buf[32];
+	int dir;
+
+	if (!atomic)
+		dir = gpiod_get_direction(desc);
+	else
+		dir = gpio_virtuser_get_direction_atomic(desc);
+	if (dir < 0)
+		return dir;
+
+	snprintf(buf, sizeof(buf), "%s\n", dir ? "input" : "output");
+
+	return simple_read_from_buffer(user_buf, size, ppos, buf, strlen(buf));
+}
+
+static int gpio_virtuser_set_direction(struct gpio_desc *desc, int dir, int val)
+{
+	if (dir)
+		return gpiod_direction_input(desc);
+
+	return gpiod_direction_output(desc, val);
+}
+
+static void gpio_virtuser_do_set_direction_atomic(struct irq_work *work)
+{
+	struct gpio_virtuser_irq_work_context *ctx =
+				to_gpio_virtuser_irq_work_context(work);
+
+	ctx->ret = gpio_virtuser_set_direction(ctx->desc, ctx->dir, ctx->val);
+	complete(&ctx->work_completion);
+}
+
+static int gpio_virtuser_set_direction_atomic(struct gpio_desc *desc,
+					      int dir, int val)
+{
+	struct gpio_virtuser_irq_work_context ctx;
+
+	gpio_virtuser_init_irq_work_context(&ctx);
+	ctx.work = IRQ_WORK_INIT_HARD(gpio_virtuser_do_set_direction_atomic);
+	ctx.desc = desc;
+	ctx.dir = dir;
+	ctx.val = val;
+
+	gpio_virtuser_irq_work_queue_sync(&ctx);
+
+	return ctx.ret;
+}
+
+static ssize_t gpio_virtuser_direction_do_write(struct file *file,
+						const char __user *user_buf,
+						size_t count, loff_t *ppos,
+						bool atomic)
+{
+	struct gpio_virtuser_line_data *data = file->private_data;
+	struct gpio_desc *desc = data->ad.desc;
+	char buf[32], *trimmed;
+	int ret, dir, val = 0;
+
+	ret = simple_write_to_buffer(buf, sizeof(buf), ppos, user_buf, count);
+	if (ret < 0)
+		return ret;
+
+	trimmed = strim(buf);
+
+	if (strcmp(buf, "input") == 0) {
+		dir = 1;
+	} else if (strcmp(buf, "output-high") == 0) {
+		dir = 0;
+		val = 1;
+	} else if (strcmp(buf, "output-low") == 0) {
+		dir = val = 0;
+	} else {
+		return -EINVAL;
+	}
+
+	if (!atomic)
+		ret = gpio_virtuser_set_direction(desc, dir, val);
+	else
+		ret = gpio_virtuser_set_direction_atomic(desc, dir, val);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+static ssize_t gpio_virtuser_direction_read(struct file *file,
+					    char __user *user_buf,
+					    size_t size, loff_t *ppos)
+{
+	return gpio_virtuser_direction_do_read(file, user_buf, size, ppos,
+					       false);
+}
+
+static ssize_t gpio_virtuser_direction_write(struct file *file,
+					     const char __user *user_buf,
+					     size_t count, loff_t *ppos)
+{
+	return gpio_virtuser_direction_do_write(file, user_buf, count, ppos,
+						false);
+}
+
+static const struct file_operations gpio_virtuser_direction_fops = {
+	.read = gpio_virtuser_direction_read,
+	.write = gpio_virtuser_direction_write,
+	.open = simple_open,
+	.owner = THIS_MODULE,
+	.llseek = default_llseek,
+};
+
+static ssize_t gpio_virtuser_direction_atomic_read(struct file *file,
+						   char __user *user_buf,
+						   size_t size, loff_t *ppos)
+{
+	return gpio_virtuser_direction_do_read(file, user_buf, size, ppos,
+					       true);
+}
+
+static ssize_t gpio_virtuser_direction_atomic_write(struct file *file,
+						    const char __user *user_buf,
+						    size_t count, loff_t *ppos)
+{
+	return gpio_virtuser_direction_do_write(file, user_buf, count, ppos,
+						true);
+}
+
+static const struct file_operations gpio_virtuser_direction_atomic_fops = {
+	.read = gpio_virtuser_direction_atomic_read,
+	.write = gpio_virtuser_direction_atomic_write,
+	.open = simple_open,
+	.owner = THIS_MODULE,
+	.llseek = default_llseek,
+};
+
+static int gpio_virtuser_value_get(void *data, u64 *val)
+{
+	struct gpio_virtuser_line_data *ld = data;
+	int ret;
+
+	ret = gpiod_get_value_cansleep(ld->ad.desc);
+	if (ret < 0)
+		return ret;
+
+	*val = ret;
+
+	return 0;
+}
+
+static int gpio_virtuser_value_set(void *data, u64 val)
+{
+	struct gpio_virtuser_line_data *ld = data;
+
+	if (val > 1)
+		return -EINVAL;
+
+	gpiod_set_value_cansleep(ld->ad.desc, (int)val);
+
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(gpio_virtuser_value_fops,
+			 gpio_virtuser_value_get,
+			 gpio_virtuser_value_set,
+			 "%llu\n");
+
+static void gpio_virtuser_get_value_atomic(struct irq_work *work)
+{
+	struct gpio_virtuser_irq_work_context *ctx =
+				to_gpio_virtuser_irq_work_context(work);
+
+	ctx->val = gpiod_get_value(ctx->desc);
+	complete(&ctx->work_completion);
+}
+
+static int gpio_virtuser_value_atomic_get(void *data, u64 *val)
+{
+	struct gpio_virtuser_line_data *ld = data;
+	struct gpio_virtuser_irq_work_context ctx;
+
+	gpio_virtuser_init_irq_work_context(&ctx);
+	ctx.work = IRQ_WORK_INIT_HARD(gpio_virtuser_get_value_atomic);
+	ctx.desc = ld->ad.desc;
+
+	gpio_virtuser_irq_work_queue_sync(&ctx);
+
+	if (ctx.val < 0)
+		return ctx.val;
+
+	*val = ctx.val;
+
+	return 0;
+}
+
+static void gpio_virtuser_set_value_atomic(struct irq_work *work)
+{
+	struct gpio_virtuser_irq_work_context *ctx =
+			to_gpio_virtuser_irq_work_context(work);
+
+	gpiod_set_value(ctx->desc, ctx->val);
+	complete(&ctx->work_completion);
+}
+
+static int gpio_virtuser_value_atomic_set(void *data, u64 val)
+{
+	struct gpio_virtuser_line_data *ld = data;
+	struct gpio_virtuser_irq_work_context ctx;
+
+	if (val > 1)
+		return -EINVAL;
+
+	gpio_virtuser_init_irq_work_context(&ctx);
+	ctx.work = IRQ_WORK_INIT_HARD(gpio_virtuser_set_value_atomic);
+	ctx.desc = ld->ad.desc;
+	ctx.val = (int)val;
+
+	gpio_virtuser_irq_work_queue_sync(&ctx);
+
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(gpio_virtuser_value_atomic_fops,
+			 gpio_virtuser_value_atomic_get,
+			 gpio_virtuser_value_atomic_set,
+			 "%llu\n");
+
+static int gpio_virtuser_debounce_get(void *data, u64 *val)
+{
+	struct gpio_virtuser_line_data *ld = data;
+
+	*val = READ_ONCE(ld->debounce);
+
+	return 0;
+}
+
+static int gpio_virtuser_debounce_set(void *data, u64 val)
+{
+	struct gpio_virtuser_line_data *ld = data;
+	int ret;
+
+	if (val > UINT_MAX)
+		return -E2BIG;
+
+	ret = gpiod_set_debounce(ld->ad.desc, (unsigned int)val);
+	if (ret)
+		/* Don't propagate errno unknown to user-space. */
+		return ret == -ENOTSUPP ? -EOPNOTSUPP : ret;
+
+	WRITE_ONCE(ld->debounce, (unsigned int)val);
+
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(gpio_virtuser_debounce_fops,
+			 gpio_virtuser_debounce_get,
+			 gpio_virtuser_debounce_set,
+			 "%llu\n");
+
+static ssize_t gpio_virtuser_consumer_read(struct file *file,
+					   char __user *user_buf,
+					   size_t size, loff_t *ppos)
+{
+	struct gpio_virtuser_line_data *data = file->private_data;
+	char buf[GPIO_VIRTUSER_NAME_BUF_LEN + 1];
+	ssize_t ret;
+
+	memset(buf, 0x0, sizeof(buf));
+
+	scoped_guard(mutex, &data->consumer_lock)
+		ret = snprintf(buf, sizeof(buf), "%s\n", data->consumer);
+
+	return simple_read_from_buffer(user_buf, size, ppos, buf, ret);
+}
+
+static ssize_t gpio_virtuser_consumer_write(struct file *file,
+					    const char __user *user_buf,
+					    size_t count, loff_t *ppos)
+{
+	struct gpio_virtuser_line_data *data = file->private_data;
+	char buf[GPIO_VIRTUSER_NAME_BUF_LEN + 2];
+	int ret;
+
+	ret = simple_write_to_buffer(buf, GPIO_VIRTUSER_NAME_BUF_LEN, ppos,
+				     user_buf, count);
+	if (ret < 0)
+		return ret;
+
+	buf[strlen(buf) - 1] = '\0';
+
+	ret = gpiod_set_consumer_name(data->ad.desc, buf);
+	if (ret)
+		return ret;
+
+	scoped_guard(mutex, &data->consumer_lock)
+		strscpy(data->consumer, buf, sizeof(buf));
+
+	return count;
+}
+
+static const struct file_operations gpio_virtuser_consumer_fops = {
+	.read = gpio_virtuser_consumer_read,
+	.write = gpio_virtuser_consumer_write,
+	.open = simple_open,
+	.owner = THIS_MODULE,
+	.llseek = default_llseek,
+};
+
+static int gpio_virtuser_interrupts_get(void *data, u64 *val)
+{
+	struct gpio_virtuser_line_data *ld = data;
+
+	*val = atomic_read(&ld->irq_count);
+
+	return 0;
+}
+
+static irqreturn_t gpio_virtuser_irq_handler(int irq, void *data)
+{
+	struct gpio_virtuser_line_data *ld = data;
+
+	atomic_inc(&ld->irq_count);
+
+	return IRQ_HANDLED;
+}
+
+static int gpio_virtuser_interrupts_set(void *data, u64 val)
+{
+	struct gpio_virtuser_line_data *ld = data;
+	int irq, ret;
+
+	if (val > 1)
+		return -EINVAL;
+
+	if (val) {
+		irq = gpiod_to_irq(ld->ad.desc);
+		if (irq < 0)
+			return irq;
+
+		ret = request_threaded_irq(irq, NULL,
+					   gpio_virtuser_irq_handler,
+					   IRQF_TRIGGER_RISING |
+					   IRQF_TRIGGER_FALLING |
+					   IRQF_ONESHOT,
+					   ld->consumer, data);
+		if (ret)
+			return ret;
+
+		atomic_set(&ld->irq, irq);
+	} else {
+		irq = atomic_xchg(&ld->irq, 0);
+		free_irq(irq, ld);
+	}
+
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(gpio_virtuser_interrupts_fops,
+			 gpio_virtuser_interrupts_get,
+			 gpio_virtuser_interrupts_set,
+			 "%llu\n");
+
+static const struct gpio_virtuser_dbgfs_attr_descr
+gpio_virtuser_line_array_dbgfs_attrs[] = {
+	{
+		.name = "values",
+		.fops = &gpio_virtuser_value_array_fops,
+	},
+	{
+		.name = "values_atomic",
+		.fops = &gpio_virtuser_value_array_atomic_fops,
+	},
+};
+
+static const struct gpio_virtuser_dbgfs_attr_descr
+gpio_virtuser_line_dbgfs_attrs[] = {
+	{
+		.name = "direction",
+		.fops = &gpio_virtuser_direction_fops,
+	},
+	{
+		.name = "direction_atomic",
+		.fops = &gpio_virtuser_direction_atomic_fops,
+	},
+	{
+		.name = "value",
+		.fops = &gpio_virtuser_value_fops,
+	},
+	{
+		.name = "value_atomic",
+		.fops = &gpio_virtuser_value_atomic_fops,
+	},
+	{
+		.name = "debounce",
+		.fops = &gpio_virtuser_debounce_fops,
+	},
+	{
+		.name = "consumer",
+		.fops = &gpio_virtuser_consumer_fops,
+	},
+	{
+		.name = "interrupts",
+		.fops = &gpio_virtuser_interrupts_fops,
+	},
+};
+
+static int gpio_virtuser_create_debugfs_attrs(
+			const struct gpio_virtuser_dbgfs_attr_descr *attr,
+			size_t num_attrs, struct dentry *parent, void *data)
+{
+	struct dentry *ret;
+	size_t i;
+
+	for (i = 0; i < num_attrs; i++, attr++) {
+		ret = debugfs_create_file(attr->name, 0644, parent, data,
+					  attr->fops);
+		if (IS_ERR(ret))
+			return PTR_ERR(ret);
+	}
+
+	return 0;
+}
+
+static int gpio_virtuser_dbgfs_init_line_array_attrs(struct device *dev,
+						     struct gpio_descs *descs,
+						     const char *id,
+						     struct dentry *dbgfs_entry)
+{
+	struct gpio_virtuser_line_array_data *data;
+	char *name;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->ad.descs = descs;
+
+	name = devm_kasprintf(dev, GFP_KERNEL, "gpiod:%s", id);
+	if (!name)
+		return -ENOMEM;
+
+	data->ad.dbgfs_dir = debugfs_create_dir(name, dbgfs_entry);
+	if (IS_ERR(data->ad.dbgfs_dir))
+		return PTR_ERR(data->ad.dbgfs_dir);
+
+	return gpio_virtuser_create_debugfs_attrs(
+			gpio_virtuser_line_array_dbgfs_attrs,
+			ARRAY_SIZE(gpio_virtuser_line_array_dbgfs_attrs),
+			data->ad.dbgfs_dir, data);
+}
+
+static int gpio_virtuser_dbgfs_init_line_attrs(struct device *dev,
+					       struct gpio_desc *desc,
+					       const char *id,
+					       unsigned int index,
+					       struct dentry *dbgfs_entry)
+{
+	struct gpio_virtuser_line_data *data;
+	char *name;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->ad.desc = desc;
+	sprintf(data->consumer, id);
+	atomic_set(&data->irq, 0);
+	atomic_set(&data->irq_count, 0);
+
+	name = devm_kasprintf(dev, GFP_KERNEL, "gpiod:%s:%u", id, index);
+	if (!name)
+		return -ENOMEM;
+
+	ret = devm_mutex_init(dev, &data->consumer_lock);
+	if (ret)
+		return ret;
+
+	data->ad.dbgfs_dir = debugfs_create_dir(name, dbgfs_entry);
+	if (IS_ERR(data->ad.dbgfs_dir))
+		return PTR_ERR(data->ad.dbgfs_dir);
+
+	return gpio_virtuser_create_debugfs_attrs(
+				gpio_virtuser_line_dbgfs_attrs,
+				ARRAY_SIZE(gpio_virtuser_line_dbgfs_attrs),
+				data->ad.dbgfs_dir, data);
+}
+
+static void gpio_virtuser_debugfs_remove(void *data)
+{
+	struct dentry *dbgfs_entry = data;
+
+	debugfs_remove_recursive(dbgfs_entry);
+}
+
+static int gpio_virtuser_prop_is_gpio(struct property *prop)
+{
+	char *dash = strrchr(prop->name, '-');
+
+	return dash && strcmp(dash, "-gpios") == 0;
+}
+
+/*
+ * If this is an OF-based system, then we iterate over properties and consider
+ * all whose names end in "-gpios". For configfs we expect an additional string
+ * array property - "gpio-virtuser,ids" - containing the list of all GPIO IDs
+ * to request.
+ */
+static int gpio_virtuser_count_ids(struct device *dev)
+{
+	struct device_node *of_node = dev_of_node(dev);
+	struct property *prop;
+	int ret = 0;
+
+	if (!of_node)
+		return device_property_string_array_count(dev,
+							  "gpio-virtuser,ids");
+
+	for_each_property_of_node(of_node, prop) {
+		if (gpio_virtuser_prop_is_gpio(prop))
+			++ret;
+	}
+
+	return ret;
+}
+
+static int gpio_virtuser_get_ids(struct device *dev, const char **ids,
+				 int num_ids)
+{
+	struct device_node *of_node = dev_of_node(dev);
+	struct property *prop;
+	size_t pos = 0, diff;
+	char *dash, *tmp;
+
+	if (!of_node)
+		return device_property_read_string_array(dev,
+							 "gpio-virtuser,ids",
+							 ids, num_ids);
+
+	for_each_property_of_node(of_node, prop) {
+		if (!gpio_virtuser_prop_is_gpio(prop))
+			continue;
+
+		dash = strrchr(prop->name, '-');
+		diff = dash - prop->name;
+
+		tmp = devm_kmemdup(dev, prop->name, diff + 1,
+				   GFP_KERNEL);
+		if (!tmp)
+			return -ENOMEM;
+
+		tmp[diff] = '\0';
+		ids[pos++] = tmp;
+	}
+
+	return 0;
+}
+
+static int gpio_virtuser_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct dentry *dbgfs_entry;
+	struct gpio_descs *descs;
+	int ret, num_ids = 0, i;
+	const char **ids;
+	unsigned int j;
+
+	num_ids = gpio_virtuser_count_ids(dev);
+	if (num_ids < 0)
+		return dev_err_probe(dev, num_ids,
+				     "Failed to get the number of GPIOs to request\n");
+
+	if (num_ids == 0)
+		return dev_err_probe(dev, -EINVAL, "No GPIO IDs specified\n");
+
+	ids = devm_kcalloc(dev, num_ids, sizeof(*ids), GFP_KERNEL);
+	if (!ids)
+		return -ENOMEM;
+
+	ret = gpio_virtuser_get_ids(dev, ids, num_ids);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "Failed to get the IDs of GPIOs to request\n");
+
+	dbgfs_entry = debugfs_create_dir(dev_name(dev), gpio_virtuser_dbg_root);
+	ret = devm_add_action_or_reset(dev, gpio_virtuser_debugfs_remove,
+				       dbgfs_entry);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < num_ids; i++) {
+		descs = devm_gpiod_get_array(dev, ids[i], GPIOD_ASIS);
+		if (IS_ERR(descs))
+			return dev_err_probe(dev, PTR_ERR(descs),
+					     "Failed to request the '%s' GPIOs\n",
+					     ids[i]);
+
+		ret = gpio_virtuser_dbgfs_init_line_array_attrs(dev, descs,
+								ids[i],
+								dbgfs_entry);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to setup the debugfs array interface for the '%s' GPIOs\n",
+					     ids[i]);
+
+		for (j = 0; j < descs->ndescs; j++) {
+			ret = gpio_virtuser_dbgfs_init_line_attrs(dev,
+							descs->desc[j], ids[i],
+							j, dbgfs_entry);
+			if (ret)
+				return dev_err_probe(dev, ret,
+						     "Failed to setup the debugfs line interface for the '%s' GPIOs\n",
+						     ids[i]);
+		}
+	}
+
+	return 0;
+}
+
+static const struct of_device_id gpio_virtuser_of_match[] = {
+	{ .compatible = "gpio-virtuser" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gpio_virtuser_of_match);
+
+static struct platform_driver gpio_virtuser_driver = {
+	.driver = {
+		.name = "gpio-virtuser",
+		.of_match_table = gpio_virtuser_of_match,
+	},
+	.probe = gpio_virtuser_probe,
+};
+
+struct gpio_virtuser_device {
+	struct config_group group;
+
+	struct platform_device *pdev;
+	int id;
+	struct mutex lock;
+
+	struct notifier_block bus_notifier;
+	struct completion probe_completion;
+	bool driver_bound;
+
+	struct gpiod_lookup_table *lookup_table;
+
+	struct list_head lookup_list;
+};
+
+static int gpio_virtuser_bus_notifier_call(struct notifier_block *nb,
+					   unsigned long action, void *data)
+{
+	struct gpio_virtuser_device *vdev;
+	struct device *dev = data;
+	char devname[32];
+
+	vdev = container_of(nb, struct gpio_virtuser_device, bus_notifier);
+	snprintf(devname, sizeof(devname), "gpio-virtuser.%d", vdev->id);
+
+	if (!device_match_name(dev, devname))
+		return NOTIFY_DONE;
+
+	switch (action) {
+	case BUS_NOTIFY_BOUND_DRIVER:
+		vdev->driver_bound = true;
+		break;
+	case BUS_NOTIFY_DRIVER_NOT_BOUND:
+		vdev->driver_bound = false;
+		break;
+	default:
+		return NOTIFY_DONE;
+	}
+
+	complete(&vdev->probe_completion);
+	return NOTIFY_OK;
+}
+
+static struct gpio_virtuser_device *
+to_gpio_virtuser_device(struct config_item *item)
+{
+	struct config_group *group = to_config_group(item);
+
+	return container_of(group, struct gpio_virtuser_device, group);
+}
+
+static bool
+gpio_virtuser_device_is_live(struct gpio_virtuser_device *dev)
+{
+	lockdep_assert_held(&dev->lock);
+
+	return !!dev->pdev;
+}
+
+struct gpio_virtuser_lookup {
+	struct config_group group;
+
+	struct gpio_virtuser_device *parent;
+	struct list_head siblings;
+
+	char *con_id;
+
+	struct list_head entry_list;
+};
+
+static struct gpio_virtuser_lookup *
+to_gpio_virtuser_lookup(struct config_item *item)
+{
+	struct config_group *group = to_config_group(item);
+
+	return container_of(group, struct gpio_virtuser_lookup, group);
+}
+
+struct gpio_virtuser_lookup_entry {
+	struct config_group group;
+
+	struct gpio_virtuser_lookup *parent;
+	struct list_head siblings;
+
+	char *key;
+	/* Can be negative to indicate lookup by name. */
+	int offset;
+	enum gpio_lookup_flags flags;
+};
+
+static struct gpio_virtuser_lookup_entry *
+to_gpio_virtuser_lookup_entry(struct config_item *item)
+{
+	struct config_group *group = to_config_group(item);
+
+	return container_of(group, struct gpio_virtuser_lookup_entry, group);
+}
+
+static ssize_t
+gpio_virtuser_lookup_entry_config_key_show(struct config_item *item, char *page)
+{
+	struct gpio_virtuser_lookup_entry *entry =
+					to_gpio_virtuser_lookup_entry(item);
+	struct gpio_virtuser_device *dev = entry->parent->parent;
+
+	guard(mutex)(&dev->lock);
+
+	return sprintf(page, "%s\n", entry->key ?: "");
+}
+
+static ssize_t
+gpio_virtuser_lookup_entry_config_key_store(struct config_item *item,
+					    const char *page, size_t count)
+{
+	struct gpio_virtuser_lookup_entry *entry =
+					to_gpio_virtuser_lookup_entry(item);
+	struct gpio_virtuser_device *dev = entry->parent->parent;
+
+	char *key __free(kfree) = kstrndup(skip_spaces(page), count,
+					   GFP_KERNEL);
+	if (!key)
+		return -ENOMEM;
+
+	strim(key);
+
+	guard(mutex)(&dev->lock);
+
+	if (gpio_virtuser_device_is_live(dev))
+		return -EBUSY;
+
+	kfree(entry->key);
+	entry->key = no_free_ptr(key);
+
+	return count;
+}
+
+CONFIGFS_ATTR(gpio_virtuser_lookup_entry_config_, key);
+
+static ssize_t
+gpio_virtuser_lookup_entry_config_offset_show(struct config_item *item,
+					      char *page)
+{
+	struct gpio_virtuser_lookup_entry *entry =
+					to_gpio_virtuser_lookup_entry(item);
+	struct gpio_virtuser_device *dev = entry->parent->parent;
+	unsigned int offset;
+
+	scoped_guard(mutex, &dev->lock)
+		offset = entry->offset;
+
+	return sprintf(page, "%d\n", offset);
+}
+
+static ssize_t
+gpio_virtuser_lookup_entry_config_offset_store(struct config_item *item,
+					       const char *page, size_t count)
+{
+	struct gpio_virtuser_lookup_entry *entry =
+					to_gpio_virtuser_lookup_entry(item);
+	struct gpio_virtuser_device *dev = entry->parent->parent;
+	int offset, ret;
+
+	ret = kstrtoint(page, 0, &offset);
+	if (ret)
+		return ret;
+
+	/*
+	 * Negative number here means: 'key' represents a line name to lookup.
+	 * Non-negative means: 'key' represents the label of the chip with
+	 * the 'offset' value representing the line within that chip.
+	 *
+	 * GPIOLIB uses the U16_MAX value to indicate lookup by line name so
+	 * the greatest offset we can accept is (U16_MAX - 1).
+	 */
+	if (offset > (U16_MAX - 1))
+		return -EINVAL;
+
+	guard(mutex)(&dev->lock);
+
+	if (gpio_virtuser_device_is_live(dev))
+		return -EBUSY;
+
+	entry->offset = offset;
+
+	return count;
+}
+
+CONFIGFS_ATTR(gpio_virtuser_lookup_entry_config_, offset);
+
+static enum gpio_lookup_flags
+gpio_virtuser_lookup_get_flags(struct config_item *item)
+{
+	struct gpio_virtuser_lookup_entry *entry =
+					to_gpio_virtuser_lookup_entry(item);
+	struct gpio_virtuser_device *dev = entry->parent->parent;
+
+	guard(mutex)(&dev->lock);
+
+	return entry->flags;
+}
+
+static ssize_t
+gpio_virtuser_lookup_entry_config_drive_show(struct config_item *item, char *page)
+{
+	enum gpio_lookup_flags flags = gpio_virtuser_lookup_get_flags(item);
+	const char *repr;
+
+	if (flags & GPIO_OPEN_DRAIN)
+		repr = "open-drain";
+	else if (flags & GPIO_OPEN_SOURCE)
+		repr = "open-source";
+	else
+		repr = "push-pull";
+
+	return sprintf(page, "%s\n", repr);
+}
+
+static ssize_t
+gpio_virtuser_lookup_entry_config_drive_store(struct config_item *item,
+					      const char *page, size_t count)
+{
+	struct gpio_virtuser_lookup_entry *entry =
+					to_gpio_virtuser_lookup_entry(item);
+	struct gpio_virtuser_device *dev = entry->parent->parent;
+
+	guard(mutex)(&dev->lock);
+
+	if (gpio_virtuser_device_is_live(dev))
+		return -EBUSY;
+
+	if (sysfs_streq(page, "push-pull")) {
+		entry->flags &= ~(GPIO_OPEN_DRAIN | GPIO_OPEN_SOURCE);
+	} else if (sysfs_streq(page, "open-drain")) {
+		entry->flags &= ~GPIO_OPEN_SOURCE;
+		entry->flags |= GPIO_OPEN_DRAIN;
+	} else if (sysfs_streq(page, "open-source")) {
+		entry->flags &= ~GPIO_OPEN_DRAIN;
+		entry->flags |= GPIO_OPEN_SOURCE;
+	} else {
+		count = -EINVAL;
+	}
+
+	return count;
+}
+
+CONFIGFS_ATTR(gpio_virtuser_lookup_entry_config_, drive);
+
+static ssize_t
+gpio_virtuser_lookup_entry_config_pull_show(struct config_item *item, char *page)
+{
+	enum gpio_lookup_flags flags = gpio_virtuser_lookup_get_flags(item);
+	const char *repr;
+
+	if (flags & GPIO_PULL_UP)
+		repr = "pull-up";
+	else if (flags & GPIO_PULL_DOWN)
+		repr = "pull-down";
+	else if (flags & GPIO_PULL_DISABLE)
+		repr = "pull-disabled";
+	else
+		repr = "as-is";
+
+	return sprintf(page, "%s\n", repr);
+}
+
+static ssize_t
+gpio_virtuser_lookup_entry_config_pull_store(struct config_item *item,
+					     const char *page, size_t count)
+{
+	struct gpio_virtuser_lookup_entry *entry =
+					to_gpio_virtuser_lookup_entry(item);
+	struct gpio_virtuser_device *dev = entry->parent->parent;
+
+	guard(mutex)(&dev->lock);
+
+	if (gpio_virtuser_device_is_live(dev))
+		return -EBUSY;
+
+	if (sysfs_streq(page, "pull-up")) {
+		entry->flags &= ~(GPIO_PULL_DOWN | GPIO_PULL_DISABLE);
+		entry->flags |= GPIO_PULL_UP;
+	} else if (sysfs_streq(page, "pull-down")) {
+		entry->flags &= ~(GPIO_PULL_UP | GPIO_PULL_DISABLE);
+		entry->flags |= GPIO_PULL_DOWN;
+	} else if (sysfs_streq(page, "pull-disabled")) {
+		entry->flags &= ~(GPIO_PULL_UP | GPIO_PULL_DOWN);
+		entry->flags |= GPIO_PULL_DISABLE;
+	} else if (sysfs_streq(page, "as-is")) {
+		entry->flags &= ~(GPIO_PULL_UP | GPIO_PULL_DOWN |
+				  GPIO_PULL_DISABLE);
+	} else {
+		count = -EINVAL;
+	}
+
+	return count;
+}
+
+CONFIGFS_ATTR(gpio_virtuser_lookup_entry_config_, pull);
+
+static ssize_t
+gpio_virtuser_lookup_entry_config_active_low_show(struct config_item *item,
+						  char *page)
+{
+	enum gpio_lookup_flags flags = gpio_virtuser_lookup_get_flags(item);
+
+	return sprintf(page, "%c\n", flags & GPIO_ACTIVE_LOW ? '1' : '0');
+}
+
+static ssize_t
+gpio_virtuser_lookup_entry_config_active_low_store(struct config_item *item,
+						   const char *page,
+						   size_t count)
+{
+	struct gpio_virtuser_lookup_entry *entry =
+					to_gpio_virtuser_lookup_entry(item);
+	struct gpio_virtuser_device *dev = entry->parent->parent;
+	bool active_low;
+	int ret;
+
+	ret = kstrtobool(page, &active_low);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&dev->lock);
+
+	if (gpio_virtuser_device_is_live(dev))
+		return -EBUSY;
+
+	if (active_low)
+		entry->flags |= GPIO_ACTIVE_LOW;
+	else
+		entry->flags &= ~GPIO_ACTIVE_LOW;
+
+	return count;
+}
+
+CONFIGFS_ATTR(gpio_virtuser_lookup_entry_config_, active_low);
+
+static ssize_t
+gpio_virtuser_lookup_entry_config_transitory_show(struct config_item *item,
+						  char *page)
+{
+	enum gpio_lookup_flags flags = gpio_virtuser_lookup_get_flags(item);
+
+	return sprintf(page, "%c\n", flags & GPIO_TRANSITORY ? '1' : '0');
+}
+
+static ssize_t
+gpio_virtuser_lookup_entry_config_transitory_store(struct config_item *item,
+						   const char *page,
+						   size_t count)
+{
+	struct gpio_virtuser_lookup_entry *entry =
+					to_gpio_virtuser_lookup_entry(item);
+	struct gpio_virtuser_device *dev = entry->parent->parent;
+	bool transitory;
+	int ret;
+
+	ret = kstrtobool(page, &transitory);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&dev->lock);
+
+	if (gpio_virtuser_device_is_live(dev))
+		return -EBUSY;
+
+	if (transitory)
+		entry->flags |= GPIO_TRANSITORY;
+	else
+		entry->flags &= ~GPIO_TRANSITORY;
+
+	return count;
+}
+
+CONFIGFS_ATTR(gpio_virtuser_lookup_entry_config_, transitory);
+
+static struct configfs_attribute *gpio_virtuser_lookup_entry_config_attrs[] = {
+	&gpio_virtuser_lookup_entry_config_attr_key,
+	&gpio_virtuser_lookup_entry_config_attr_offset,
+	&gpio_virtuser_lookup_entry_config_attr_drive,
+	&gpio_virtuser_lookup_entry_config_attr_pull,
+	&gpio_virtuser_lookup_entry_config_attr_active_low,
+	&gpio_virtuser_lookup_entry_config_attr_transitory,
+	NULL
+};
+
+static ssize_t
+gpio_virtuser_device_config_dev_name_show(struct config_item *item,
+					  char *page)
+{
+	struct gpio_virtuser_device *dev = to_gpio_virtuser_device(item);
+	struct platform_device *pdev;
+
+	guard(mutex)(&dev->lock);
+
+	pdev = dev->pdev;
+	if (pdev)
+		return sprintf(page, "%s\n", dev_name(&pdev->dev));
+
+	return sprintf(page, "gpio-sim.%d\n", dev->id);
+}
+
+CONFIGFS_ATTR_RO(gpio_virtuser_device_config_, dev_name);
+
+static ssize_t gpio_virtuser_device_config_live_show(struct config_item *item,
+						     char *page)
+{
+	struct gpio_virtuser_device *dev = to_gpio_virtuser_device(item);
+	bool live;
+
+	scoped_guard(mutex, &dev->lock)
+		live = gpio_virtuser_device_is_live(dev);
+
+	return sprintf(page, "%c\n", live ? '1' : '0');
+}
+
+static size_t
+gpio_virtuser_get_lookup_count(struct gpio_virtuser_device *dev)
+{
+	struct gpio_virtuser_lookup *lookup;
+	size_t count = 0;
+
+	lockdep_assert_held(&dev->lock);
+
+	list_for_each_entry(lookup, &dev->lookup_list, siblings)
+		count += list_count_nodes(&lookup->entry_list);
+
+	return count;
+}
+
+static int
+gpio_virtuser_make_lookup_table(struct gpio_virtuser_device *dev)
+{
+	size_t num_entries = gpio_virtuser_get_lookup_count(dev);
+	struct gpio_virtuser_lookup_entry *entry;
+	struct gpio_virtuser_lookup *lookup;
+	struct gpiod_lookup *curr;
+	unsigned int i = 0;
+
+	lockdep_assert_held(&dev->lock);
+
+	struct gpiod_lookup_table *table __free(kfree) =
+		kzalloc(struct_size(table, table, num_entries + 1), GFP_KERNEL);
+	if (!table)
+		return -ENOMEM;
+
+	table->dev_id = kasprintf(GFP_KERNEL, "gpio-virtuser.%d", dev->id);
+	if (!table->dev_id)
+		return -ENOMEM;
+
+	list_for_each_entry(lookup, &dev->lookup_list, siblings) {
+		list_for_each_entry(entry, &lookup->entry_list, siblings) {
+			curr = &table->table[i];
+
+			curr->con_id = lookup->con_id;
+			curr->idx = i;
+			curr->key = entry->key;
+			curr->chip_hwnum = entry->offset < 0 ?
+						U16_MAX : entry->offset;
+			curr->flags = entry->flags;
+			i++;
+		}
+	}
+
+	gpiod_add_lookup_table(table);
+	dev->lookup_table = no_free_ptr(table);
+
+	return 0;
+}
+
+static struct fwnode_handle *
+gpio_virtuser_make_device_swnode(struct gpio_virtuser_device *dev)
+{
+	struct property_entry properties[2];
+	struct gpio_virtuser_lookup *lookup;
+	unsigned int i = 0;
+	size_t num_ids;
+
+	memset(properties, 0, sizeof(properties));
+
+	num_ids = list_count_nodes(&dev->lookup_list);
+	char **ids __free(kfree) = kcalloc(num_ids + 1, sizeof(*ids),
+					   GFP_KERNEL);
+	if (!ids)
+		return ERR_PTR(-ENOMEM);
+
+	list_for_each_entry(lookup, &dev->lookup_list, siblings)
+		ids[i++] = lookup->con_id;
+
+	properties[0] = PROPERTY_ENTRY_STRING_ARRAY_LEN("gpio-virtuser,ids",
+							ids, num_ids);
+
+	return fwnode_create_software_node(properties, NULL);
+}
+
+static int
+gpio_virtuser_device_activate(struct gpio_virtuser_device *dev)
+{
+	struct platform_device_info pdevinfo;
+	struct fwnode_handle *swnode;
+	struct platform_device *pdev;
+	int ret;
+
+	lockdep_assert_held(&dev->lock);
+
+	if (list_empty(&dev->lookup_list))
+		return -ENODATA;
+
+	swnode = gpio_virtuser_make_device_swnode(dev);
+	if (IS_ERR(swnode))
+		return PTR_ERR(swnode);
+
+	memset(&pdevinfo, 0, sizeof(pdevinfo));
+	pdevinfo.name = "gpio-virtuser";
+	pdevinfo.id = dev->id;
+	pdevinfo.fwnode = swnode;
+
+	ret = gpio_virtuser_make_lookup_table(dev);
+	if (ret) {
+		fwnode_remove_software_node(swnode);
+		return ret;
+	}
+
+	reinit_completion(&dev->probe_completion);
+	dev->driver_bound = false;
+	bus_register_notifier(&platform_bus_type, &dev->bus_notifier);
+
+	pdev = platform_device_register_full(&pdevinfo);
+	if (IS_ERR(pdev)) {
+		bus_unregister_notifier(&platform_bus_type, &dev->bus_notifier);
+		fwnode_remove_software_node(swnode);
+		return PTR_ERR(pdev);
+	}
+
+	wait_for_completion(&dev->probe_completion);
+	bus_unregister_notifier(&platform_bus_type, &dev->bus_notifier);
+
+	if (!dev->driver_bound) {
+		platform_device_unregister(pdev);
+		fwnode_remove_software_node(swnode);
+		return -ENXIO;
+	}
+
+	dev->pdev = pdev;
+
+	return 0;
+}
+
+static void
+gpio_virtuser_device_deactivate(struct gpio_virtuser_device *dev)
+{
+	struct fwnode_handle *swnode;
+
+	lockdep_assert_held(&dev->lock);
+
+	swnode = dev_fwnode(&dev->pdev->dev);
+	platform_device_unregister(dev->pdev);
+	fwnode_remove_software_node(swnode);
+	dev->pdev = NULL;
+	gpiod_remove_lookup_table(dev->lookup_table);
+	kfree(dev->lookup_table);
+}
+
+static ssize_t
+gpio_virtuser_device_config_live_store(struct config_item *item,
+				       const char *page, size_t count)
+{
+	struct gpio_virtuser_device *dev = to_gpio_virtuser_device(item);
+	int ret = 0;
+	bool live;
+
+	ret = kstrtobool(page, &live);
+	if (ret)
+		return ret;
+
+	guard(mutex)(&dev->lock);
+
+	if (live == gpio_virtuser_device_is_live(dev))
+		return -EPERM;
+
+	if (live)
+		ret = gpio_virtuser_device_activate(dev);
+	else
+		gpio_virtuser_device_deactivate(dev);
+
+	return ret ?: count;
+}
+
+CONFIGFS_ATTR(gpio_virtuser_device_config_, live);
+
+static struct configfs_attribute *gpio_virtuser_device_config_attrs[] = {
+	&gpio_virtuser_device_config_attr_dev_name,
+	&gpio_virtuser_device_config_attr_live,
+	NULL
+};
+
+static void
+gpio_virtuser_lookup_entry_config_group_release(struct config_item *item)
+{
+	struct gpio_virtuser_lookup_entry *entry =
+					to_gpio_virtuser_lookup_entry(item);
+	struct gpio_virtuser_device *dev = entry->parent->parent;
+
+	guard(mutex)(&dev->lock);
+
+	list_del(&entry->siblings);
+
+	kfree(entry->key);
+	kfree(entry);
+}
+
+static struct
+configfs_item_operations gpio_virtuser_lookup_entry_config_item_ops = {
+	.release	= gpio_virtuser_lookup_entry_config_group_release,
+};
+
+static const struct
+config_item_type gpio_virtuser_lookup_entry_config_group_type = {
+	.ct_item_ops	= &gpio_virtuser_lookup_entry_config_item_ops,
+	.ct_attrs	= gpio_virtuser_lookup_entry_config_attrs,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_group *
+gpio_virtuser_make_lookup_entry_group(struct config_group *group,
+				      const char *name)
+{
+	struct gpio_virtuser_lookup *lookup =
+				to_gpio_virtuser_lookup(&group->cg_item);
+	struct gpio_virtuser_device *dev = lookup->parent;
+
+	guard(mutex)(&dev->lock);
+
+	if (gpio_virtuser_device_is_live(dev))
+		return ERR_PTR(-EBUSY);
+
+	struct gpio_virtuser_lookup_entry *entry __free(kfree) =
+				kzalloc(sizeof(*entry), GFP_KERNEL);
+	if (!entry)
+		return ERR_PTR(-ENOMEM);
+
+	config_group_init_type_name(&entry->group, name,
+			&gpio_virtuser_lookup_entry_config_group_type);
+	entry->flags = GPIO_LOOKUP_FLAGS_DEFAULT;
+	entry->parent = lookup;
+	list_add_tail(&entry->siblings, &lookup->entry_list);
+
+	return &no_free_ptr(entry)->group;
+}
+
+static void gpio_virtuser_lookup_config_group_release(struct config_item *item)
+{
+	struct gpio_virtuser_lookup *lookup = to_gpio_virtuser_lookup(item);
+	struct gpio_virtuser_device *dev = lookup->parent;
+
+	guard(mutex)(&dev->lock);
+
+	list_del(&lookup->siblings);
+
+	kfree(lookup->con_id);
+	kfree(lookup);
+}
+
+static struct configfs_item_operations gpio_virtuser_lookup_config_item_ops = {
+	.release	= gpio_virtuser_lookup_config_group_release,
+};
+
+static struct
+configfs_group_operations gpio_virtuser_lookup_config_group_ops = {
+	.make_group     = gpio_virtuser_make_lookup_entry_group,
+};
+
+static const struct config_item_type gpio_virtuser_lookup_config_group_type = {
+	.ct_group_ops	= &gpio_virtuser_lookup_config_group_ops,
+	.ct_item_ops	= &gpio_virtuser_lookup_config_item_ops,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_group *
+gpio_virtuser_make_lookup_group(struct config_group *group, const char *name)
+{
+	struct gpio_virtuser_device *dev =
+				to_gpio_virtuser_device(&group->cg_item);
+
+	if (strlen(name) > (GPIO_VIRTUSER_NAME_BUF_LEN - 1))
+		return ERR_PTR(-E2BIG);
+
+	guard(mutex)(&dev->lock);
+
+	if (gpio_virtuser_device_is_live(dev))
+		return ERR_PTR(-EBUSY);
+
+	struct gpio_virtuser_lookup *lookup __free(kfree) =
+				kzalloc(sizeof(*lookup), GFP_KERNEL);
+	if (!lookup)
+		return ERR_PTR(-ENOMEM);
+
+	lookup->con_id = kstrdup(name, GFP_KERNEL);
+	if (!lookup->con_id)
+		return ERR_PTR(-ENOMEM);
+
+	config_group_init_type_name(&lookup->group, name,
+				    &gpio_virtuser_lookup_config_group_type);
+	INIT_LIST_HEAD(&lookup->entry_list);
+	lookup->parent = dev;
+	list_add_tail(&lookup->siblings, &dev->lookup_list);
+
+	return &no_free_ptr(lookup)->group;
+}
+
+static void gpio_virtuser_device_config_group_release(struct config_item *item)
+{
+	struct gpio_virtuser_device *dev = to_gpio_virtuser_device(item);
+
+	guard(mutex)(&dev->lock);
+
+	if (gpio_virtuser_device_is_live(dev))
+		gpio_virtuser_device_deactivate(dev);
+
+	mutex_destroy(&dev->lock);
+	ida_free(&gpio_virtuser_ida, dev->id);
+	kfree(dev);
+}
+
+static struct configfs_item_operations gpio_virtuser_device_config_item_ops = {
+	.release	= gpio_virtuser_device_config_group_release,
+};
+
+static struct configfs_group_operations gpio_virtuser_device_config_group_ops = {
+	.make_group	= gpio_virtuser_make_lookup_group,
+};
+
+static const struct config_item_type gpio_virtuser_device_config_group_type = {
+	.ct_group_ops	= &gpio_virtuser_device_config_group_ops,
+	.ct_item_ops	= &gpio_virtuser_device_config_item_ops,
+	.ct_attrs	= gpio_virtuser_device_config_attrs,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct config_group *
+gpio_virtuser_config_make_device_group(struct config_group *group,
+				       const char *name)
+{
+	struct gpio_virtuser_device *dev __free(kfree) = kzalloc(sizeof(*dev),
+								 GFP_KERNEL);
+	if (!dev)
+		return ERR_PTR(-ENOMEM);
+
+	dev->id = ida_alloc(&gpio_virtuser_ida, GFP_KERNEL);
+	if (dev->id < 0)
+		return ERR_PTR(dev->id);
+
+	config_group_init_type_name(&dev->group, name,
+				    &gpio_virtuser_device_config_group_type);
+	mutex_init(&dev->lock);
+	INIT_LIST_HEAD(&dev->lookup_list);
+	dev->bus_notifier.notifier_call = gpio_virtuser_bus_notifier_call;
+	init_completion(&dev->probe_completion);
+
+	return &no_free_ptr(dev)->group;
+}
+
+static struct configfs_group_operations gpio_virtuser_config_group_ops = {
+	.make_group	= gpio_virtuser_config_make_device_group,
+};
+
+static const struct config_item_type gpio_virtuser_config_type = {
+	.ct_group_ops	= &gpio_virtuser_config_group_ops,
+	.ct_owner	= THIS_MODULE,
+};
+
+static struct configfs_subsystem gpio_virtuser_config_subsys = {
+	.su_group = {
+		.cg_item = {
+			.ci_namebuf	= "gpio-virtuser",
+			.ci_type	= &gpio_virtuser_config_type,
+		},
+	},
+};
+
+static int __init gpio_virtuser_init(void)
+{
+	int ret;
+
+	ret = platform_driver_register(&gpio_virtuser_driver);
+	if (ret) {
+		pr_err("Failed to register the platform driver: %d\n", ret);
+		return ret;
+	}
+
+	config_group_init(&gpio_virtuser_config_subsys.su_group);
+	mutex_init(&gpio_virtuser_config_subsys.su_mutex);
+	ret = configfs_register_subsystem(&gpio_virtuser_config_subsys);
+	if (ret) {
+		pr_err("Failed to register the '%s' configfs subsystem: %d\n",
+		       gpio_virtuser_config_subsys.su_group.cg_item.ci_namebuf,
+		       ret);
+		goto err_plat_drv_unreg;
+	}
+
+	gpio_virtuser_dbg_root = debugfs_create_dir("gpio-virtuser", NULL);
+	if (IS_ERR(gpio_virtuser_dbg_root)) {
+		ret = PTR_ERR(gpio_virtuser_dbg_root);
+		pr_err("Failed to create the debugfs tree: %d\n", ret);
+		goto err_configfs_unreg;
+	}
+
+	return 0;
+
+err_configfs_unreg:
+	configfs_unregister_subsystem(&gpio_virtuser_config_subsys);
+err_plat_drv_unreg:
+	mutex_destroy(&gpio_virtuser_config_subsys.su_mutex);
+	platform_driver_unregister(&gpio_virtuser_driver);
+
+	return ret;
+}
+module_init(gpio_virtuser_init);
+
+static void __exit gpio_virtuser_exit(void)
+{
+	configfs_unregister_subsystem(&gpio_virtuser_config_subsys);
+	mutex_destroy(&gpio_virtuser_config_subsys.su_mutex);
+	platform_driver_unregister(&gpio_virtuser_driver);
+	debugfs_remove_recursive(gpio_virtuser_dbg_root);
+}
+module_exit(gpio_virtuser_exit);
+
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@linaro.org>");
+MODULE_DESCRIPTION("Virtual GPIO consumer module");
+MODULE_LICENSE("GPL");
-- 
2.43.0


