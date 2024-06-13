Return-Path: <linux-gpio+bounces-7418-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7F79068B9
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 11:29:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40E0C285A42
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2024 09:29:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67AC1411CF;
	Thu, 13 Jun 2024 09:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="TJxbXrBg"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD41513E3EF
	for <linux-gpio@vger.kernel.org>; Thu, 13 Jun 2024 09:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718270928; cv=none; b=htKk+U7eRhKcZypx2LrsC6VoUOAwOG9jZo13YskKnKibDeJwSLcUSq7rE+tst/rO0/S3GqkxhY5AomCz3xneHzsSvvt95QWmZMmiE5ja5KR73njc39OR1wXYoOw5eIBA0vcJEE6GrjfKfo7wabrXPZOVzCu3iFhbQij2RcVcc6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718270928; c=relaxed/simple;
	bh=jLxzlEAd8vKv1riVy/m4K6BTn0qX5JKkmwDrt6JFWTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EML0fnDjY4qqsCz9FWZcV7F7Ad+Q+5K0TlCEVpoTehGvapJDr7owF1n2mdCY9K2J4qf1keTf3JDGl2sib3RrFYaxTxlHRsnwo13Jqp6SfGyHCOY9xiWYWh2MfgThCYQXIgdvss6ovb7eMmyeNVvSFe9bp4fH9W8E5KRS/7atnS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=TJxbXrBg; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52c7f7fdd24so1186216e87.1
        for <linux-gpio@vger.kernel.org>; Thu, 13 Jun 2024 02:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1718270923; x=1718875723; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pExuKsqjZ6boqARYAuD6MV9MkrrBUfX/7+AIQATI4uY=;
        b=TJxbXrBgVLTcme1X3ZJhxVeuezYHR9rTZefdVDxV7yjHRxwQlS8P9DKrAfqiDI9f/+
         VMvQmS85ryIkYG4rnDtv4mOujtkT1BUxqDd+XpMEWZpIScFaJ36weDPvBf5NS7MLsn7F
         SRH0+qTzKSvJPvdaAYJlTbUnzqzvrhOzFgKs62YLsVB9CYk63I9wGBGWRFNXby+PSmw3
         a/QvJqEvviYAgf5WDnKVewF9Dmf6RyqirHdkzi4t2G+1OrrQ2t4XWAl+nH1r/AwQHleW
         eXDhh/uOpe3DrhQ9xqhzlicbvX2naIVbGL3khiRQT2xXE/NYLeOlL5dEkrbcXZBgVj/x
         91kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718270923; x=1718875723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pExuKsqjZ6boqARYAuD6MV9MkrrBUfX/7+AIQATI4uY=;
        b=NVNz+wo3y17573gE/ooXjTLAjT5GIOEf3FI4RhR25o6Ub/yycI3iPAuz4gL8cZ1bp4
         D2SFr/7UN62ZCnmreUzs5CFebzRxHrFkvFQkfVxtlSzgzmdQahi+7n1/Zqbqzi2ZsqHM
         qKJnYlozQfdaM4TbGy95FWFP1GogJrtVv1bdO8sGTw/7+pobumcj4nbIhUqgaQx+2O95
         0GcS3uJihRpLicOovJUJa7E6RSHkKyl25gXslZS+9k4t0e+T9b7VYd/7lvcIzAxrzFIr
         bNMyc79SA+4Fp4TRxqWL5rhje90jbyr3F9WwchfIE09NA5CoIxHez01TKn66FKJaCNmP
         j1Xw==
X-Gm-Message-State: AOJu0Yw+oz8MFROHhflc3Po6lkpM1rQJ2N+Uw5QJqV4zsxZn3ZuPQzP7
	LKhl8UAD++d93hnJJTbXVC79z2xocda3bsUVHOmtmlgKuwBPoDoO0Kr/YeQHJ1A=
X-Google-Smtp-Source: AGHT+IEF2BzmwVVMpAJE58Txtu8epDM0aiOMJIylKYvaFWlxQKOTOI+tXlI+Ln6pUWdpJJk5xqn7Aw==
X-Received: by 2002:a05:6512:33d1:b0:52b:af74:4c0f with SMTP id 2adb3069b0e04-52c9a3df5demr2671990e87.37.1718270922556;
        Thu, 13 Jun 2024 02:28:42 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:8d3:3800:875c:e292:3280:ccac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-422874e73e8sm54990205e9.43.2024.06.13.02.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jun 2024 02:28:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH v8 2/2] misc: gpio-virtuser: new virtual testing driver for the GPIO API
Date: Thu, 13 Jun 2024 11:28:30 +0200
Message-ID: <20240613092830.15761-3-brgl@bgdev.pl>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240613092830.15761-1-brgl@bgdev.pl>
References: <20240613092830.15761-1-brgl@bgdev.pl>
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
 .../admin-guide/gpio/gpio-virtuser.rst        |  176 ++
 Documentation/admin-guide/gpio/index.rst      |    1 +
 MAINTAINERS                                   |    8 +
 drivers/misc/Kconfig                          |    8 +
 drivers/misc/Makefile                         |    1 +
 drivers/misc/gpio-virtuser.c                  | 1790 +++++++++++++++++
 6 files changed, 1984 insertions(+)
 create mode 100644 Documentation/admin-guide/gpio/gpio-virtuser.rst
 create mode 100644 drivers/misc/gpio-virtuser.c

diff --git a/Documentation/admin-guide/gpio/gpio-virtuser.rst b/Documentation/admin-guide/gpio/gpio-virtuser.rst
new file mode 100644
index 000000000000..d0d4712cf394
--- /dev/null
+++ b/Documentation/admin-guide/gpio/gpio-virtuser.rst
@@ -0,0 +1,176 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+Virtual GPIO Consumer
+=====================
+
+The virtual GPIO Consumer module allows users to instantiate virtual devices
+that request GPIOs and then control their behavior over sysfs. Virtual consumer
+devices can be instantiated from device-tree or over configfs.
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
+associated sysfs group under ``/sys/bus/platform/devices/$dev_name``.
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
+Once active, the device will export sysfs attributes for controlling GPIO
+arrays as well as each requested GPIO line separately. Let's consider the
+following device property: ``foo-gpios = <&gpio0 0 0>, <&gpio0 4 0>;``.
+
+The following sysfs attribute groups will be created:
+
+**Group:** ``/sys/bus/platform/device/$dev_name/gpiod:foo/``
+
+This is the group that will contain the attributes for the entire GPIO array.
+
+**Attribute:** ``/sys/bus/platform/device/$dev_name/gpiod:foo/values``
+
+**Attribute:** ``/sys/bus/platform/device/$dev_name/gpiod:foo/values_atomic``
+
+Both attributes allow to read and set arrays of GPIO values. User must pass
+exactly the number of values that the array contains in the form of a string
+containing zeroes and ones representing inactive and active GPIO states
+respectively. In this example: ``echo 11 > values``.
+
+The ``values_atomic`` attribute works the same as ``values`` but the kernel
+will execute the GPIO driver callbacks in interrupt context.
+
+**Group:** ``/sys/bus/platform/device/$dev_name/gpiod:foo:$index/``
+
+This is a group that represents a single GPIO with ``$index`` being its offset
+in the array.
+
+**Attribute:** ``/sys/bus/platform/device/$dev_name/gpiod:foo:$index/consumer``
+
+Allows to set and read the consumer label of the GPIO line.
+
+**Attribute:** ``/sys/bus/platform/device/$dev_name/gpiod:foo:$index/debounce``
+
+Allows to set and read the debounce period of the GPIO line.
+
+**Attribute:** ``/sys/bus/platform/device/$dev_name/gpiod:foo:$index/direction``
+
+**Attribute:** ``/sys/bus/platform/device/$dev_name/gpiod:foo:$index/direction_atomic``
+
+These two attributes allow to set the direction of the GPIO line. They accept
+"input" and "output" as values. The atomic variant executes the driver callback
+in interrupt context.
+
+**Attribute:** ``/sys/bus/platform/device/$dev_name/gpiod:foo:$index/interrupts``
+
+If the line is requested in input mode, writing ``1`` to this attribute will
+make the module listen for edge interrupts on the GPIO. Writing ``0`` disables
+the monitoring. Reading this attribute returns the current number of registered
+interrupts (both edges).
+
+**Attribute:** ``/sys/bus/platform/device/$dev_name/gpiod:foo:$index/value``
+
+**Attribute:** ``/sys/bus/platform/device/$dev_name/gpiod:foo:$index/value_atomic``
+
+Both attributes allow to read and set values of individual requested GPIO lines.
+They accept the following values: ``active``, ``1``, ``inactive`` and ``0``.
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
diff --git a/MAINTAINERS b/MAINTAINERS
index d6c90161c7bf..3a5a83fdceea 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9427,6 +9427,14 @@ F:	drivers/gpio/gpiolib-cdev.c
 F:	include/uapi/linux/gpio.h
 F:	tools/gpio/
 
+GPIO VIRTUSER
+M:	Bartosz Golaszewski <brgl@bgdev.pl>
+L:	linux-gpio@vger.kernel.org
+S:	Maintained
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git
+F:	Documentation/admin-guide/gpio/gpio-virtuser.rst
+F:	drivers/misc/gpio-virtuser.c
+
 GRE DEMULTIPLEXER DRIVER
 M:	Dmitry Kozlov <xeb@mail.ru>
 L:	netdev@vger.kernel.org
diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
index faf983680040..0e705b7d0762 100644
--- a/drivers/misc/Kconfig
+++ b/drivers/misc/Kconfig
@@ -585,6 +585,14 @@ config NSM
 	  To compile this driver as a module, choose M here.
 	  The module will be called nsm.
 
+config GPIO_VIRTUSER
+	tristate "GPIO Virtual User Testing Module"
+	select CONFIGFS_FS
+	select IRQ_WORK
+	help
+	  This enables the configurable, configfs-based virtual GPIO consumer
+	  testing driver.
+
 source "drivers/misc/c2port/Kconfig"
 source "drivers/misc/eeprom/Kconfig"
 source "drivers/misc/cb710/Kconfig"
diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
index 153a3f4837e8..963307d4e69b 100644
--- a/drivers/misc/Makefile
+++ b/drivers/misc/Makefile
@@ -69,3 +69,4 @@ obj-$(CONFIG_TMR_INJECT)	+= xilinx_tmr_inject.o
 obj-$(CONFIG_TPS6594_ESM)	+= tps6594-esm.o
 obj-$(CONFIG_TPS6594_PFSM)	+= tps6594-pfsm.o
 obj-$(CONFIG_NSM)		+= nsm.o
+obj-$(CONFIG_GPIO_VIRTUSER)	+= gpio-virtuser.o
diff --git a/drivers/misc/gpio-virtuser.c b/drivers/misc/gpio-virtuser.c
new file mode 100644
index 000000000000..85539e8ec647
--- /dev/null
+++ b/drivers/misc/gpio-virtuser.c
@@ -0,0 +1,1790 @@
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
+#include <linux/sysfs.h>
+#include <linux/types.h>
+
+#define GPIO_VIRTUSER_NAME_BUF_LEN 32
+
+static DEFINE_IDA(gpio_virtuser_ida);
+
+enum gpio_virtuser_line_array_attr_id {
+	GPIO_CONSUMER_LINE_ARRAY_ATTR_VALUES,
+	GPIO_CONSUMER_LINE_ARRAY_ATTR_VALUES_ATOMIC,
+	GPIO_CONSUMER_LINE_ARRAY_ATTR_COUNT,
+};
+
+enum gpio_virtuser_line_attr_id {
+	GPIO_CONSUMER_LINE_ATTR_DIRECTION,
+	GPIO_CONSUMER_LINE_ATTR_DIRECTION_ATOMIC,
+	GPIO_CONSUMER_LINE_ATTR_VALUE,
+	GPIO_CONSUMER_LINE_ATTR_VALUE_ATOMIC,
+	GPIO_CONSUMER_LINE_ATTR_DEBOUNCE,
+	GPIO_CONSUMER_LINE_ATTR_CONSUMER,
+	GPIO_CONSUMER_LINE_ATTR_INTERRUPTS,
+	GPIO_CONSUMER_LINE_ATTR_COUNT,
+};
+
+struct gpio_virtuser_sysfs_data {
+	union {
+		struct gpio_desc *desc;
+		struct gpio_descs *descs;
+	};
+	struct kobject *kobj;
+	struct attribute_group *attr_group;
+};
+
+struct gpio_virtuser_line_array_data {
+	struct gpio_virtuser_sysfs_data sd;
+};
+
+struct gpio_virtuser_line_data {
+	struct gpio_virtuser_sysfs_data sd;
+	char consumer[GPIO_VIRTUSER_NAME_BUF_LEN];
+	struct mutex consumer_lock;
+	unsigned int debounce;
+	atomic_t irq;
+	atomic_t irq_count;
+};
+
+static void *to_gpio_virtuser_data(struct device_attribute *attr)
+{
+	struct dev_ext_attribute *ea = to_ext_attr(attr);
+
+	return ea->var;
+}
+
+struct gpio_virtuser_attr_descr {
+	const char *name;
+	ssize_t (*show)(struct device *, struct device_attribute *, char *);
+	ssize_t (*store)(struct device *, struct device_attribute *,
+			 const char *, size_t);
+};
+
+struct gpio_virtuser_irq_work_context {
+	struct irq_work work;
+	struct completion work_completion;
+
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
+static ssize_t gpio_virtuser_sysfs_emit_value_array(char *buf,
+						    unsigned long *values,
+						    size_t num_values)
+{
+	ssize_t len = 0;
+	size_t i;
+
+	for (i = 0; i < num_values; i++)
+		len += sysfs_emit_at(buf, len, "%d",
+				     test_bit(i, values) ? 1 : 0);
+
+	return len + sysfs_emit_at(buf, len, "\n");
+}
+
+static int gpio_virtuser_sysfs_parse_value_array(const char *buf, size_t len,
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
+static ssize_t
+gpio_virtuser_sysfs_value_array_show(struct device *dev,
+				     struct device_attribute *attr, char *buf)
+{
+	struct gpio_virtuser_line_array_data *data = to_gpio_virtuser_data(attr);
+	struct gpio_descs *descs = data->sd.descs;
+	int ret;
+
+	unsigned long *values __free(bitmap) = bitmap_zalloc(descs->ndescs,
+							     GFP_KERNEL);
+	if (!values)
+		return -ENOMEM;
+
+	ret = gpiod_get_array_value_cansleep(descs->ndescs, descs->desc,
+					     descs->info, values);
+	if (ret)
+		return ret;
+
+	return gpio_virtuser_sysfs_emit_value_array(buf, values, descs->ndescs);
+}
+
+static ssize_t
+gpio_virtuser_sysfs_value_array_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf, size_t len)
+{
+	struct gpio_virtuser_line_array_data *data = to_gpio_virtuser_data(attr);
+	struct gpio_descs *descs = data->sd.descs;
+	int ret;
+
+	if (len - 1 != descs->ndescs)
+		return -EINVAL;
+
+	unsigned long *values __free(bitmap) = bitmap_alloc(descs->ndescs,
+							    GFP_KERNEL);
+	if (!values)
+		return -ENOMEM;
+
+	ret = gpio_virtuser_sysfs_parse_value_array(buf, descs->ndescs, values);
+	if (ret)
+		return ret;
+
+	ret = gpiod_set_array_value_cansleep(descs->ndescs, descs->desc,
+					     descs->info, values);
+	if (ret)
+		return ret;
+
+	return len;
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
+static ssize_t
+gpio_virtuser_sysfs_value_array_atomic_show(struct device *dev,
+					    struct device_attribute *attr,
+					    char *buf)
+{
+	struct gpio_virtuser_line_array_data *data = to_gpio_virtuser_data(attr);
+	struct gpio_virtuser_irq_work_context ctx;
+	struct gpio_descs *descs = data->sd.descs;
+
+	unsigned long *values __free(bitmap) = bitmap_zalloc(descs->ndescs,
+							     GFP_KERNEL);
+	if (!values)
+		return -ENOMEM;
+
+	gpio_virtuser_init_irq_work_context(&ctx);
+	ctx.work = IRQ_WORK_INIT_HARD(gpio_virtuser_get_value_array_atomic);
+	ctx.descs = data->sd.descs;
+	ctx.values = values;
+
+	gpio_virtuser_irq_work_queue_sync(&ctx);
+
+	if (ctx.ret)
+		return ctx.ret;
+
+	return gpio_virtuser_sysfs_emit_value_array(buf, values, descs->ndescs);
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
+static ssize_t
+gpio_virtuser_sysfs_value_array_atomic_store(struct device *dev,
+					     struct device_attribute *attr,
+					     const char *buf, size_t len)
+{
+	struct gpio_virtuser_line_array_data *data = to_gpio_virtuser_data(attr);
+	struct gpio_virtuser_irq_work_context ctx;
+	struct gpio_descs *descs = data->sd.descs;
+	int ret;
+
+	unsigned long *values __free(bitmap) = bitmap_zalloc(descs->ndescs,
+							     GFP_KERNEL);
+	if (!values)
+		return -ENOMEM;
+
+	ret = gpio_virtuser_sysfs_parse_value_array(buf, descs->ndescs, values);
+	if (ret)
+		return ret;
+
+	gpio_virtuser_init_irq_work_context(&ctx);
+	ctx.work = IRQ_WORK_INIT_HARD(gpio_virtuser_set_value_array_atomic);
+	ctx.descs = data->sd.descs;
+	ctx.values = values;
+
+	gpio_virtuser_irq_work_queue_sync(&ctx);
+
+	if (ctx.ret)
+		return ctx.ret;
+
+	return len;
+}
+
+static ssize_t gpio_virtuser_emit_direction(char *buf, int dir)
+{
+	return sysfs_emit(buf, "%s\n", dir ? "input" : "output");
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
+static int gpio_virtuser_parse_direction(const char *buf, int *dir, int *val)
+{
+	if (sysfs_streq(buf, "input")) {
+		*dir = 1;
+		return 0;
+	}
+
+	if (sysfs_streq(buf, "output-high"))
+		*val = 1;
+	else if (sysfs_streq(buf, "output-low"))
+		*val = 0;
+	else
+		return -EINVAL;
+
+	*dir = 0;
+	return 0;
+}
+
+static ssize_t
+gpio_virtuser_sysfs_direction_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	struct gpio_virtuser_line_data *data = to_gpio_virtuser_data(attr);
+	int dir;
+
+	dir = gpiod_get_direction(data->sd.desc);
+	if (dir < 0)
+		return dir;
+
+	return gpio_virtuser_emit_direction(buf, dir);
+}
+
+static ssize_t
+gpio_virtuser_sysfs_direction_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf, size_t len)
+{
+	struct gpio_virtuser_line_data *data = to_gpio_virtuser_data(attr);
+	int ret, dir, val;
+
+	ret = gpio_virtuser_parse_direction(buf, &dir, &val);
+	if (ret)
+		return ret;
+
+	ret = gpio_virtuser_set_direction(data->sd.desc, dir, val);
+	if (ret)
+		return ret;
+
+	return len;
+}
+
+static void gpio_virtuser_get_direction_atomic(struct irq_work *work)
+{
+	struct gpio_virtuser_irq_work_context *ctx =
+					to_gpio_virtuser_irq_work_context(work);
+
+	ctx->dir = gpiod_get_direction(ctx->desc);
+
+	complete(&ctx->work_completion);
+}
+
+static ssize_t
+gpio_virtuser_sysfs_direction_atomic_show(struct device *dev,
+					  struct device_attribute *attr,
+					  char *buf)
+{
+	struct gpio_virtuser_line_data *data = to_gpio_virtuser_data(attr);
+	struct gpio_virtuser_irq_work_context ctx;
+
+	gpio_virtuser_init_irq_work_context(&ctx);
+	ctx.work = IRQ_WORK_INIT_HARD(gpio_virtuser_get_direction_atomic);
+	ctx.desc = data->sd.desc;
+
+	gpio_virtuser_irq_work_queue_sync(&ctx);
+
+	return gpio_virtuser_emit_direction(buf, ctx.dir);
+}
+
+static void gpio_virtuser_set_direction_atomic(struct irq_work *work)
+{
+	struct gpio_virtuser_irq_work_context *ctx =
+				to_gpio_virtuser_irq_work_context(work);
+
+	ctx->ret = gpio_virtuser_set_direction(ctx->desc, ctx->dir, ctx->val);
+	complete(&ctx->work_completion);
+}
+
+static ssize_t
+gpio_virtuser_sysfs_direction_atomic_store(struct device *dev,
+					   struct device_attribute *attr,
+					   const char *buf, size_t len)
+{
+	struct gpio_virtuser_line_data *data = to_gpio_virtuser_data(attr);
+	struct gpio_virtuser_irq_work_context ctx;
+	int ret, dir, val;
+
+	ret = gpio_virtuser_parse_direction(buf, &dir, &val);
+	if (ret)
+		return ret;
+
+	gpio_virtuser_init_irq_work_context(&ctx);
+	ctx.work = IRQ_WORK_INIT_HARD(gpio_virtuser_set_direction_atomic);
+	ctx.desc = data->sd.desc;
+	ctx.dir = dir;
+	ctx.val = val;
+
+	gpio_virtuser_irq_work_queue_sync(&ctx);
+
+	return len;
+}
+
+static const char *const gpio_virtuser_sysfs_value_strings[] = {
+	[0]	= "inactive",
+	[1]	= "active",
+};
+
+static ssize_t gpio_virtuser_emit_value(char *buf, int value)
+{
+	return sysfs_emit(buf, "%s\n",
+			  gpio_virtuser_sysfs_value_strings[value]);
+}
+
+static int gpio_virtuser_parse_value(const char *buf)
+{
+	int value, ret;
+
+	value = sysfs_match_string(gpio_virtuser_sysfs_value_strings, buf);
+	if (value < 0) {
+		/* Can be 0 or 1 too. */
+		ret = kstrtoint(buf, 0, &value);
+		if (ret)
+			return ret;
+		if (value != 0 && value != 1)
+			return -EINVAL;
+	}
+
+	return value;
+}
+
+static ssize_t
+gpio_virtuser_sysfs_value_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct gpio_virtuser_line_data *data = to_gpio_virtuser_data(attr);
+	int value;
+
+	value = gpiod_get_value_cansleep(data->sd.desc);
+	if (value < 0)
+		return value;
+
+	return gpio_virtuser_emit_value(buf, value);
+}
+
+static ssize_t
+gpio_virtuser_sysfs_value_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf, size_t len)
+{
+
+	struct gpio_virtuser_line_data *data = to_gpio_virtuser_data(attr);
+	int value;
+
+	value = gpio_virtuser_parse_value(buf);
+	if (value < 0)
+		return value;
+
+	gpiod_set_value_cansleep(data->sd.desc, value);
+
+	return len;
+}
+
+static void gpio_virtuser_get_value_atomic(struct irq_work *work)
+{
+	struct gpio_virtuser_irq_work_context *ctx =
+					to_gpio_virtuser_irq_work_context(work);
+
+	ctx->val = gpiod_get_value(ctx->desc);
+	complete(&ctx->work_completion);
+}
+
+static ssize_t
+gpio_virtuser_sysfs_value_atomic_show(struct device *dev,
+				      struct device_attribute *attr, char *buf)
+{
+	struct gpio_virtuser_line_data *data = to_gpio_virtuser_data(attr);
+	struct gpio_virtuser_irq_work_context ctx;
+
+	gpio_virtuser_init_irq_work_context(&ctx);
+	ctx.work = IRQ_WORK_INIT_HARD(gpio_virtuser_get_value_atomic);
+	ctx.desc = data->sd.desc;
+
+	gpio_virtuser_irq_work_queue_sync(&ctx);
+
+	return gpio_virtuser_emit_value(buf, ctx.val);
+}
+
+static void gpio_virtuser_set_value_atomic(struct irq_work *work)
+{
+	struct gpio_virtuser_irq_work_context *ctx =
+				to_gpio_virtuser_irq_work_context(work);
+
+	gpiod_set_value(ctx->desc, ctx->val);
+	complete(&ctx->work_completion);
+}
+
+static ssize_t
+gpio_virtuser_sysfs_value_atomic_store(struct device *dev,
+				       struct device_attribute *attr,
+				       const char *buf, size_t len)
+{
+	struct gpio_virtuser_line_data *data = to_gpio_virtuser_data(attr);
+	struct gpio_virtuser_irq_work_context ctx;
+	int val;
+
+	val = gpio_virtuser_parse_value(buf);
+	if (val < 0)
+		return val;
+
+	gpio_virtuser_init_irq_work_context(&ctx);
+	ctx.work = IRQ_WORK_INIT_HARD(gpio_virtuser_set_value_atomic);
+	ctx.desc = data->sd.desc;
+	ctx.val = val;
+
+	gpio_virtuser_irq_work_queue_sync(&ctx);
+
+	return len;
+}
+
+static ssize_t
+gpio_virtuser_sysfs_debounce_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct gpio_virtuser_line_data *data = to_gpio_virtuser_data(attr);
+
+	return sysfs_emit(buf, "%u\n", READ_ONCE(data->debounce));
+}
+
+static ssize_t
+gpio_virtuser_sysfs_debounce_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t len)
+{
+	struct gpio_virtuser_line_data *data = to_gpio_virtuser_data(attr);
+	unsigned int debounce;
+	int ret;
+
+	ret = kstrtouint(buf, 0, &debounce);
+	if (ret)
+		return ret;
+
+	ret = gpiod_set_debounce(data->sd.desc, debounce);
+	if (ret)
+		return ret;
+
+	WRITE_ONCE(data->debounce, debounce);
+
+	return len;
+}
+
+static ssize_t
+gpio_virtuser_sysfs_consumer_show(struct device *dev,
+				  struct device_attribute *attr, char *buf)
+{
+	struct gpio_virtuser_line_data *data = to_gpio_virtuser_data(attr);
+
+	guard(mutex)(&data->consumer_lock);
+
+	return sysfs_emit(buf, "%s\n", data->consumer);
+}
+
+static ssize_t
+gpio_virtuser_sysfs_consumer_store(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t len)
+{
+	struct gpio_virtuser_line_data *data = to_gpio_virtuser_data(attr);
+	int ret;
+
+	guard(mutex)(&data->consumer_lock);
+
+	ret = gpiod_set_consumer_name(data->sd.desc, buf);
+	if (ret)
+		return ret;
+
+	ret = strscpy(data->consumer, buf, GPIO_VIRTUSER_NAME_BUF_LEN);
+
+	return ret < 0 ? ret : len;
+}
+
+static ssize_t
+gpio_virtuser_sysfs_interrupts_show(struct device *dev,
+				    struct device_attribute *attr, char *buf)
+{
+	struct gpio_virtuser_line_data *data = to_gpio_virtuser_data(attr);
+
+	return sysfs_emit(buf, "%u\n", atomic_read(&data->irq_count));
+}
+
+static irqreturn_t gpio_virtuser_irq_handler(int irq, void *data)
+{
+	struct gpio_virtuser_line_data *line = data;
+
+	atomic_inc(&line->irq_count);
+
+	return IRQ_HANDLED;
+}
+
+static ssize_t
+gpio_virtuser_sysfs_interrupts_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf, size_t len)
+{
+	struct gpio_virtuser_line_data *data = to_gpio_virtuser_data(attr);
+	int ret, irq;
+	bool enable;
+
+	ret = kstrtobool(buf, &enable);
+	if (ret)
+		return ret;
+
+	if (enable) {
+		irq = gpiod_to_irq(data->sd.desc);
+		if (irq < 0)
+			return irq;
+
+		ret = request_threaded_irq(irq, NULL,
+					   gpio_virtuser_irq_handler,
+					   IRQF_TRIGGER_RISING |
+					   IRQF_TRIGGER_FALLING |
+					   IRQF_ONESHOT,
+					   data->consumer, data);
+		if (ret)
+			return ret;
+
+		atomic_set(&data->irq, irq);
+	} else {
+		irq = atomic_xchg(&data->irq, 0);
+		free_irq(irq, data);
+	}
+
+	return len;
+}
+
+static const struct gpio_virtuser_attr_descr gpio_virtuser_line_array_attrs[] = {
+	[GPIO_CONSUMER_LINE_ARRAY_ATTR_VALUES] = {
+		.name		= "values",
+		.show		= gpio_virtuser_sysfs_value_array_show,
+		.store		= gpio_virtuser_sysfs_value_array_store,
+	},
+	[GPIO_CONSUMER_LINE_ARRAY_ATTR_VALUES_ATOMIC] = {
+		.name		= "values_atomic",
+		.show		= gpio_virtuser_sysfs_value_array_atomic_show,
+		.store		= gpio_virtuser_sysfs_value_array_atomic_store,
+	},
+};
+
+static const struct gpio_virtuser_attr_descr gpio_virtuser_line_attrs[] = {
+	[GPIO_CONSUMER_LINE_ATTR_DIRECTION] = {
+		.name		= "direction",
+		.show		= gpio_virtuser_sysfs_direction_show,
+		.store		= gpio_virtuser_sysfs_direction_store,
+	},
+	[GPIO_CONSUMER_LINE_ATTR_DIRECTION_ATOMIC] = {
+		.name		= "direction_atomic",
+		.show		= gpio_virtuser_sysfs_direction_atomic_show,
+		.store		= gpio_virtuser_sysfs_direction_atomic_store,
+	},
+	[GPIO_CONSUMER_LINE_ATTR_VALUE] = {
+		.name		= "value",
+		.show		= gpio_virtuser_sysfs_value_show,
+		.store		= gpio_virtuser_sysfs_value_store,
+	},
+	[GPIO_CONSUMER_LINE_ATTR_VALUE_ATOMIC] = {
+		.name		= "value_atomic",
+		.show		= gpio_virtuser_sysfs_value_atomic_show,
+		.store		= gpio_virtuser_sysfs_value_atomic_store,
+	},
+	[GPIO_CONSUMER_LINE_ATTR_DEBOUNCE] = {
+		.name		= "debounce",
+		.show		= gpio_virtuser_sysfs_debounce_show,
+		.store		= gpio_virtuser_sysfs_debounce_store,
+	},
+	[GPIO_CONSUMER_LINE_ATTR_CONSUMER] = {
+		.name		= "consumer",
+		.show		= gpio_virtuser_sysfs_consumer_show,
+		.store		= gpio_virtuser_sysfs_consumer_store,
+	},
+	[GPIO_CONSUMER_LINE_ATTR_INTERRUPTS] = {
+		.name		= "interrupts",
+		.show		= gpio_virtuser_sysfs_interrupts_show,
+		.store		= gpio_virtuser_sysfs_interrupts_store,
+	},
+};
+
+static void gpio_virtuser_line_array_attr_remove(void *data)
+{
+	struct gpio_virtuser_line_array_data *lines = data;
+
+	sysfs_remove_group(lines->sd.kobj, lines->sd.attr_group);
+}
+
+static void gpio_virtuser_line_attr_remove(void *data)
+{
+	struct gpio_virtuser_line_data *line = data;
+
+	sysfs_remove_group(line->sd.kobj, line->sd.attr_group);
+}
+
+static struct attribute *
+gpio_virtuser_make_attribute(struct device *dev, void *data,
+			     const struct gpio_virtuser_attr_descr *descr)
+{
+	struct dev_ext_attribute *ea;
+
+	ea = devm_kzalloc(dev, sizeof(*ea), GFP_KERNEL);
+	if (!ea)
+		return ERR_PTR(-ENOMEM);
+
+	ea->var = data;
+	sysfs_attr_init(&ea->attr.attr);
+	ea->attr.attr.name = descr->name;
+	ea->attr.attr.mode = 0644;
+	ea->attr.show = descr->show;
+	ea->attr.store = descr->store;
+
+	return &ea->attr.attr;
+}
+
+static int gpio_virtuser_sysfs_init_line_array_attrs(struct device *dev,
+						     struct gpio_descs *descs,
+						     const char *id)
+
+{
+	struct gpio_virtuser_line_array_data *data;
+	struct attribute **attrs;
+	unsigned int i;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->sd.kobj = &dev->kobj;
+	data->sd.descs = descs;
+
+	data->sd.attr_group = devm_kzalloc(dev, sizeof(*data->sd.attr_group),
+					GFP_KERNEL);
+	if (!data->sd.attr_group)
+		return -ENOMEM;
+
+	data->sd.attr_group->name = devm_kasprintf(dev, GFP_KERNEL,
+						"gpiod:%s", id);
+	if (!data->sd.attr_group->name)
+		return -ENOMEM;
+
+	attrs = devm_kcalloc(dev, GPIO_CONSUMER_LINE_ARRAY_ATTR_COUNT + 1,
+			     sizeof(*attrs), GFP_KERNEL);
+	if (!attrs)
+		return -ENOMEM;
+
+	for (i = 0; i < GPIO_CONSUMER_LINE_ARRAY_ATTR_COUNT; i++) {
+		attrs[i] = gpio_virtuser_make_attribute(dev, data,
+					&gpio_virtuser_line_array_attrs[i]);
+		if (IS_ERR(attrs[i]))
+			return PTR_ERR(attrs[i]);
+	}
+
+	data->sd.attr_group->attrs = attrs;
+	ret = sysfs_create_group(&dev->kobj, data->sd.attr_group);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev,
+					gpio_virtuser_line_array_attr_remove,
+					data);
+}
+
+static int gpio_virtuser_sysfs_init_line_attrs(struct device *dev,
+					       struct gpio_desc *desc,
+					       const char *id,
+					       unsigned int index)
+{
+	struct gpio_virtuser_line_data *data;
+	struct attribute **attrs;
+	unsigned int i;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->sd.kobj = &dev->kobj;
+	data->sd.desc = desc;
+	sprintf(data->consumer, id);
+	atomic_set(&data->irq, 0);
+	atomic_set(&data->irq_count, 0);
+
+	ret = devm_mutex_init(dev, &data->consumer_lock);
+	if (ret)
+		return ret;
+
+	data->sd.attr_group = devm_kzalloc(dev, sizeof(*data->sd.attr_group),
+					GFP_KERNEL);
+	if (!data->sd.attr_group)
+		return -ENOMEM;
+
+	data->sd.attr_group->name = devm_kasprintf(dev, GFP_KERNEL, "gpiod:%s:%u",
+						id, index);
+	if (!data->sd.attr_group->name)
+		return -ENOMEM;
+
+	attrs = devm_kcalloc(dev, GPIO_CONSUMER_LINE_ATTR_COUNT + 1,
+			     sizeof(*attrs), GFP_KERNEL);
+	if (!attrs)
+		return -ENOMEM;
+
+	for (i = 0; i < GPIO_CONSUMER_LINE_ATTR_COUNT; i++) {
+		attrs[i] = gpio_virtuser_make_attribute(dev, data,
+						&gpio_virtuser_line_attrs[i]);
+		if (IS_ERR(attrs[i]))
+			return PTR_ERR(attrs[i]);
+	}
+
+	data->sd.attr_group->attrs = attrs;
+	ret = sysfs_create_group(&dev->kobj, data->sd.attr_group);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev, gpio_virtuser_line_attr_remove,
+					data);
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
+	for (i = 0; i < num_ids; i++) {
+		descs = devm_gpiod_get_array(dev, ids[i], GPIOD_ASIS);
+		if (IS_ERR(descs))
+			return dev_err_probe(dev, PTR_ERR(descs),
+					     "Failed to request the '%s' GPIOs\n",
+					     ids[i]);
+
+		ret = gpio_virtuser_sysfs_init_line_array_attrs(dev, descs,
+								ids[i]);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "Failed to setup the sysfs array interface for the '%s' GPIOs\n",
+					     ids[i]);
+
+		for (j = 0; j < descs->ndescs; j++) {
+			ret = gpio_virtuser_sysfs_init_line_attrs(dev,
+							descs->desc[j],
+							ids[i], j);
+			if (ret)
+				return dev_err_probe(dev, ret,
+						     "Failed to setup the sysfs line interface for the '%s' GPIOs\n",
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
+		mutex_destroy(&gpio_virtuser_config_subsys.su_mutex);
+		platform_driver_unregister(&gpio_virtuser_driver);
+		return ret;
+	}
+
+	return 0;
+}
+module_init(gpio_virtuser_init);
+
+static void __exit gpio_virtuser_exit(void)
+{
+	configfs_unregister_subsystem(&gpio_virtuser_config_subsys);
+	mutex_destroy(&gpio_virtuser_config_subsys.su_mutex);
+	platform_driver_unregister(&gpio_virtuser_driver);
+}
+module_exit(gpio_virtuser_exit);
+
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@linaro.org>");
+MODULE_DESCRIPTION("Virtual GPIO consumer module");
+MODULE_LICENSE("GPL");
-- 
2.43.0


