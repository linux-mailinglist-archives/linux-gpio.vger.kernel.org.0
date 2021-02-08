Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 17CE93142E7
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Feb 2021 23:26:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231618AbhBHWZW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Feb 2021 17:25:22 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:41129 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231518AbhBHWZE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Feb 2021 17:25:04 -0500
Received: from orion.localdomain ([95.115.15.83]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Mf0yy-1lpQQN3nSc-00gcBn; Mon, 08 Feb 2021 23:22:18 +0100
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
To:     linux-kernel@vger.kernel.org
Cc:     rafael@kernel.org, info@metux.net, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, robh+dt@kernel.org,
        frowand.list@gmail.com, pantelis.antoniou@konsulko.com,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Subject: [RFC PATCH 11/12] platform/x86: skeleton for oftree based board device initialization
Date:   Mon,  8 Feb 2021 23:22:02 +0100
Message-Id: <20210208222203.22335-12-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210208222203.22335-1-info@metux.net>
References: <20210208222203.22335-1-info@metux.net>
X-Provags-ID: V03:K1:5KSHO+mZyjEhDezzvwlTZtaq1BeKWhLjf5NtiYXIs+OFGBPy7EN
 l1EpRKIOv8DC5JQZYZ4QQHdDC3f8UR4I2F/jkZ0aERqtQ8Mp/InvotLjkTmqi0pVp1hXlAr
 Sy46hIhNUb8Yp+E/wqhUaaP21HkYGk8Ig6/PwmgoVHaZAxFlXFPBppI/z3bY9Dj0w063RFN
 g49/Zgi270Mr1SU2U0oEw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:vPnCi//+1uw=:oDvmtkqLFE+8f70CNahU/3
 j+u1BKblgDLihU5g8YskOzPKg03rnnW+X0AIqPunJelZ8nlgiI7s09vkC49kK5yplL/mJ82dG
 iwGK9QBVDGO6hSST2DYzqAEMVtdXiNw4JOPmFriVN29OExEJserhEVv7kPe+laPSmbAgJoqCj
 i5jxkx30VqHNXaYOrPxE/2D75P7Rtb508bbe1P4WSP6vJxPKnGqkFwbnU9pAjEV6z6nVPHIBV
 xXaRWaZZvflWs2UIiM6ymBvDzOYEv3/5xh2AjRxWjFSbZYCCWH17wSo2lVhQSwqYOWMkfM+CD
 VrWLeqqzpKEXdfB9QbAxSYLjyV4s2lYTdNLg2tZbq/uA99Ld/wwnvdwr6/upbiJwFMOO53kBK
 4uUYtD4EPz97t7uap3JkPo26X48GrXbePqMkDm4kVuHnxDxZvuHmpm64VbE84
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Lots of boards have extra devices that can't be fully probed via bus'es
(like PCI) or generic firmware mechanisms like ACPI. Often those capabilities
are just partial or even highly depend on firmware version.

Instead of hand-writing board specific drivers merely for the correct
initialization / parameterization of generic drivers, hereby introducing
a generic mechanism, using the already well supported oftree.

These oftrees are compiled into the driver, which first tries to match
machine identifications (eg. DMI strings) against rules defined in the
individual oftrees, and on success, probes the devices that are defined
by them.

For the time being, we just support matching on DMI_BOARD_NAME and
DMI_SYS_VENDOR - other criteria, even bus- or ACPI-id's can be added later,
when needed.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 drivers/platform/Kconfig      |   2 +
 drivers/platform/Makefile     |   1 +
 drivers/platform/of/Kconfig   |  41 ++++++++++++++
 drivers/platform/of/Makefile  |   5 ++
 drivers/platform/of/drv.c     | 123 +++++++++++++++++++++++++++++++++++++++++
 drivers/platform/of/init.c    | 126 ++++++++++++++++++++++++++++++++++++++++++
 drivers/platform/of/ofboard.h |   8 +++
 7 files changed, 306 insertions(+)
 create mode 100644 drivers/platform/of/Kconfig
 create mode 100644 drivers/platform/of/Makefile
 create mode 100644 drivers/platform/of/drv.c
 create mode 100644 drivers/platform/of/init.c
 create mode 100644 drivers/platform/of/ofboard.h

diff --git a/drivers/platform/Kconfig b/drivers/platform/Kconfig
index 18fc6a08569e..9ac6d4e2a762 100644
--- a/drivers/platform/Kconfig
+++ b/drivers/platform/Kconfig
@@ -15,3 +15,5 @@ source "drivers/platform/mellanox/Kconfig"
 source "drivers/platform/olpc/Kconfig"
 
 source "drivers/platform/surface/Kconfig"
+
+source "drivers/platform/of/Kconfig"
diff --git a/drivers/platform/Makefile b/drivers/platform/Makefile
index 4de08ef4ec9d..ca4d74701fd7 100644
--- a/drivers/platform/Makefile
+++ b/drivers/platform/Makefile
@@ -10,3 +10,4 @@ obj-$(CONFIG_OLPC_EC)		+= olpc/
 obj-$(CONFIG_GOLDFISH)		+= goldfish/
 obj-$(CONFIG_CHROME_PLATFORMS)	+= chrome/
 obj-$(CONFIG_SURFACE_PLATFORMS)	+= surface/
+obj-$(CONFIG_PLATFORM_OF_DRV)	+= of/
diff --git a/drivers/platform/of/Kconfig b/drivers/platform/of/Kconfig
new file mode 100644
index 000000000000..a0b5a641a7c6
--- /dev/null
+++ b/drivers/platform/of/Kconfig
@@ -0,0 +1,41 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# X86 Platform Specific Drivers
+#
+
+menuconfig PLATFORM_OF_DRV
+	tristate "Platform support via device tree"
+	select OF
+	select OF_FLATTREE
+	help
+	  Say Y here to get to see options for board support that's initialized
+	  via compiled-in flattened device trees.
+
+	  This is entirely independent from traditional DT-based booting (or DT
+	  overlays) and meant for additional devices on non-OF-based (eg. APCI)
+	  boards or composite devices behind probing-capable busses (eg. PCI).
+
+	  Instead of writing individual drivers for just the initialization of
+	  subdevices, this option provides a generic mechanism for describing
+	  these devices via device tree.
+
+	  If you say N, all options in this submenu will be skipped and disabled.
+
+if PLATFORM_OF_DRV
+
+config PLATFORM_OF_DRV_SYSFS_DTB
+	bool "Expose device tree binaries in sysfs"
+	default y
+	depends on SYSFS
+	help
+	  Say Y here to enable exposing device tree binaries at /sys/firmware.
+
+config PLATFORM_OF_DRV_SYSFS_DT
+	bool "Expose parsed device tree in sysfs"
+	default y
+	depends on SYSFS
+	help
+	  Say Y here to enable exposing device tree nodes at
+	  /sys/firmware/devicetree.
+
+endif # PLATFORM_OF_DRV
diff --git a/drivers/platform/of/Makefile b/drivers/platform/of/Makefile
new file mode 100644
index 000000000000..84cf3003c500
--- /dev/null
+++ b/drivers/platform/of/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+
+ofboard-y := init.o drv.o
+
+obj-$(CONFIG_PLATFORM_OF_DRV) += ofboard.o
diff --git a/drivers/platform/of/drv.c b/drivers/platform/of/drv.c
new file mode 100644
index 000000000000..ff7006c24cf7
--- /dev/null
+++ b/drivers/platform/of/drv.c
@@ -0,0 +1,123 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright (C) 2021 metux IT consult
+ * Author: Enrico Weigelt <info@metux.net>
+ */
+
+#include <linux/dmi.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/slab.h>
+
+#include "ofboard.h"
+
+static bool __init ofboard_match_dmi(struct device *dev)
+{
+#ifdef CONFIG_DMI
+	const char *board = dmi_get_system_info(DMI_BOARD_NAME);
+	const char *vendor = dmi_get_system_info(DMI_SYS_VENDOR);
+	const struct device_node *node = dev->of_node;
+
+	if (!of_match_string(node, "dmi-sys-vendor", vendor))
+		return false;
+
+	if (!of_match_string(node, "dmi-board-name", board))
+		return false;
+
+	dev_info(dev, "matched dmi: vendor=\"%s\" board=\"%s\"\n", vendor,
+		 board);
+
+	return true;
+#else
+	return false;
+#endif
+}
+
+static void __init ofboard_kick_devs(struct device *dev,
+				     struct device_node *np,
+				     const char *bus_name)
+{
+	struct property *prop;
+	const char *walk;
+	struct bus_type *bus;
+	int ret;
+
+	if (strcmp(bus_name, "name")==0)
+		return;
+
+	bus = find_bus(bus_name);
+	if (!bus) {
+		dev_warn(dev, "cant find bus \"%s\"\n", bus_name);
+		return;
+	}
+
+	of_property_for_each_string(np, bus_name, prop, walk) {
+		ret = bus_unregister_device_by_name(bus, walk);
+		if (ret)
+			dev_warn(dev, "failed removing device \"%s\" on bus "
+				 "\"%s\": %d\n", walk, bus_name, ret);
+		else
+			dev_info(dev, "removed device \"%s\" from bus "
+				 "\"%s\"\n", walk, bus_name);
+	}
+
+	bus_put(bus);
+}
+
+static void __init ofboard_unbind(struct device *dev)
+{
+	struct property *pr;
+	struct device_node *np = of_get_child_by_name(dev->of_node, "unbind");
+
+	if (!IS_ERR_OR_NULL(np))
+		for_each_property_of_node(np, pr)
+			ofboard_kick_devs(dev, np, pr->name);
+}
+
+static int ofboard_populate(struct device *dev)
+{
+	int ret;
+	struct device_node *of_node = dev->of_node;
+	struct device_node *np = of_get_child_by_name(of_node, "devices");
+
+	if (IS_ERR_OR_NULL(np)) {
+		dev_info(dev, "board oftree has no devices\n");
+		return -ENOENT;
+	}
+
+	ret = of_platform_populate(np, NULL, NULL, dev);
+	if (ret) {
+		dev_err(dev, "failed probing of childs: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int ofboard_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+
+	if (!ofboard_match_dmi(dev))
+		return -EINVAL;
+
+	ofboard_unbind(&pdev->dev);
+
+	return ofboard_populate(dev);
+}
+
+static const struct of_device_id ofboard_of_match[] = {
+	{ .compatible = "virtual,dmi-board" },
+	{}
+};
+
+struct platform_driver ofboard_driver = {
+	.driver = {
+		.name = "ofboard",
+		.of_match_table = ofboard_of_match,
+	},
+	.probe = ofboard_probe,
+};
diff --git a/drivers/platform/of/init.c b/drivers/platform/of/init.c
new file mode 100644
index 000000000000..3b8373cda77a
--- /dev/null
+++ b/drivers/platform/of/init.c
@@ -0,0 +1,126 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+/*
+ * Copyright (C) 2021 metux IT consult
+ * Author: Enrico Weigelt <info@metux.net>
+ */
+
+#define pr_fmt(fmt)	KBUILD_MODNAME ": " fmt
+
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of_fdt.h>
+#include <linux/libfdt.h>
+#include <linux/of_platform.h>
+#include <linux/slab.h>
+#include "ofboard.h"
+
+#define DECLARE_FDT_EXTERN(n) \
+	extern char __dtb_##n##_begin[]; \
+	static struct bin_attribute __dtb_##n##_attr = { \
+		.attr = { .name = "fdt-" #n, .mode = S_IRUSR }, \
+		.private = __dtb_##n##_begin, \
+		.read = fdt_image_raw_read, \
+	};
+
+struct fdt_image {
+	char *begin;
+	size_t size;
+	char *basename;
+	struct bin_attribute *bin_attr;
+	struct device_node *root;
+};
+
+#define FDT_IMAGE_ENT(n)			\
+	{					\
+		.begin = __dtb_##n##_begin,	\
+		.bin_attr = &__dtb_##n##_attr,	\
+		.basename = "ofboard-" #n	\
+	}
+
+static ssize_t fdt_image_raw_read(struct file *filep, struct kobject *kobj,
+				  struct bin_attribute *bin_attr, char *buf,
+				  loff_t off, size_t count)
+{
+	memcpy(buf, bin_attr->private + off, count);
+	return count;
+}
+
+static struct fdt_image fdt[] = {
+};
+
+static int __init ofdrv_init_sysfs(struct fdt_image *image)
+{
+	image->bin_attr->size = image->size;
+	image->bin_attr->private = image->begin;
+
+	if (sysfs_create_bin_file(firmware_kobj, image->bin_attr))
+		pr_warn("failed creating sysfs bin_file\n");
+
+	of_attach_tree_sysfs(image->root, image->basename);
+
+	return 0;
+}
+
+static int __init ofdrv_parse_image(struct fdt_image *image)
+{
+	struct device_node* root;
+	void *new_fdt;
+
+	image->size = fdt_totalsize(image->begin);
+	new_fdt = kmemdup(image->begin, image->size, GFP_KERNEL);
+	if (!new_fdt)
+		return -ENOMEM;
+
+	image->begin = new_fdt;
+	of_fdt_unflatten_tree(new_fdt, NULL, &root);
+
+	if (IS_ERR_OR_NULL(root))
+		return PTR_ERR(root);
+
+	image->root = root;
+
+	return 0;
+}
+
+static int __init ofdrv_init_image(struct fdt_image *image)
+{
+	struct device_node *np;
+	int ret;
+
+	ret = ofdrv_parse_image(image);
+	if (ret)
+		return ret;
+
+	ofdrv_init_sysfs(image);
+
+	for_each_child_of_node(image->root, np) {
+		struct platform_device_info pdevinfo = {
+			.name = np->name,
+			.fwnode = &np->fwnode,
+			.id = PLATFORM_DEVID_NONE,
+		};
+		platform_device_register_full(&pdevinfo);
+	}
+
+	return 0;
+}
+
+static int __init ofdrv_init(void)
+{
+	int x;
+
+	platform_driver_register(&ofboard_driver);
+
+	for (x=0; x<ARRAY_SIZE(fdt); x++)
+		ofdrv_init_image(&fdt[x]);
+
+	return 0;
+}
+
+module_init(ofdrv_init);
+
+MODULE_AUTHOR("Enrico Weigelt, metux IT consult <info@metux.net>");
+MODULE_DESCRIPTION("Generic oftree based initialization of custom board devices");
+MODULE_LICENSE("GPL");
diff --git a/drivers/platform/of/ofboard.h b/drivers/platform/of/ofboard.h
new file mode 100644
index 000000000000..7516e5df4f18
--- /dev/null
+++ b/drivers/platform/of/ofboard.h
@@ -0,0 +1,8 @@
+#ifndef __DRIVERS_PLATFORM_OFBOARD_H
+#define __DRIVERS_PLATFORM_OFBOARD_H
+
+#include <linux/platform_device.h>
+
+extern struct platform_driver ofboard_driver;
+
+#endif
-- 
2.11.0

