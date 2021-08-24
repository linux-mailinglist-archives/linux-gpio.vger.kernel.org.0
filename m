Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6D2D3F6314
	for <lists+linux-gpio@lfdr.de>; Tue, 24 Aug 2021 18:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232732AbhHXQsy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 24 Aug 2021 12:48:54 -0400
Received: from mga02.intel.com ([134.134.136.20]:10207 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232700AbhHXQsw (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 24 Aug 2021 12:48:52 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10086"; a="204550638"
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="204550638"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2021 09:48:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,347,1620716400"; 
   d="scan'208";a="684036652"
Received: from inlubt0177.iind.intel.com ([10.223.67.91])
  by fmsmga006.fm.intel.com with ESMTP; 24 Aug 2021 09:48:04 -0700
From:   lakshmi.sowjanya.d@intel.com
To:     linus.walleij@linaro.org
Cc:     linux-gpio@vger.kernel.org, bgolaszewski@baylibre.com,
        linux-kernel@vger.kernel.org, mgross@linux.intel.com,
        andriy.shevchenko@linux.intel.com, tamal.saha@intel.com,
        bala.senthil@intel.com, lakshmi.sowjanya.d@intel.com
Subject: [RFC PATCH v1 01/20] gpio: Add basic GPIO driver for Intel PMC Timed I/O device
Date:   Tue, 24 Aug 2021 22:17:42 +0530
Message-Id: <20210824164801.28896-2-lakshmi.sowjanya.d@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
References: <20210824164801.28896-1-lakshmi.sowjanya.d@intel.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Christopher Hall <christopher.s.hall@intel.com>

The Intel PMC Timed I/O device provides GPIO-like functionality to
generate and capture I/O timestamped using ART

Several additional GPIO interfaces are needed to enable the device.
Add basic driver initialization, acpi_match_tables and register accessors.

Add entry for INTEL GPIO PMC TIO driver and the test drivers
gpio-event-gen.c and gpio-pwm-mon.c in the MAINTAINERS file.

Signed-off-by: Christopher Hall <christopher.s.hall@intel.com>
Signed-off-by: Tamal Saha <tamal.saha@intel.com>
Co-developed-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Reviewed-by: Mark Gross <mgross@linux.intel.com>
---
 MAINTAINERS                       |   7 ++
 drivers/gpio/Kconfig              |  11 ++
 drivers/gpio/Makefile             |   1 +
 drivers/gpio/gpio-intel-tio-pmc.c | 182 ++++++++++++++++++++++++++++++
 4 files changed, 201 insertions(+)
 create mode 100644 drivers/gpio/gpio-intel-tio-pmc.c

diff --git a/MAINTAINERS b/MAINTAINERS
index c6b8a720c0bc..1b61e80deeae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9311,6 +9311,13 @@ F:	drivers/gpio/gpio-pch.c
 F:	drivers/gpio/gpio-sch.c
 F:	drivers/gpio/gpio-sodaville.c
 
+INTEL GPIO PMC TIO
+M:	Tamal Saha <tamal.saha@intel.com>
+S:	Supported
+F:	drivers/gpio/gpio-intel-tio-pmc.c
+F:	tools/gpio/gpio-event-gen.c
+F:	tools/gpio/gpio-pwm-mon.c
+
 INTEL GVT-g DRIVERS (Intel GPU Virtualization)
 M:	Zhenyu Wang <zhenyuw@linux.intel.com>
 M:	Zhi Wang <zhi.a.wang@intel.com>
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index fab571016adf..962a92db09ba 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -794,6 +794,17 @@ config GPIO_IDT3243X
 	  To compile this driver as a module, choose M here: the module will
 	  be called gpio-idt3243x.
 
+config GPIO_INTEL_PMC_TIO
+	tristate "Intel PMC Time-Aware GPIO"
+	depends on X86
+	select GPIO_GENERIC
+	help
+	  This driver adds support for Intel PMC Timed-Aware GPIO (TGPIO)
+	  controller. The device clock used to drive TGPIO logic is the
+	  Always Running Timer (ART).
+
+	  Say yes here to build support for PMC TGPIO Driver.
+
 endmenu
 
 menu "Port-mapped I/O GPIO drivers"
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 32a32659866a..59bb4e756382 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -183,3 +183,4 @@ obj-$(CONFIG_GPIO_XRA1403)		+= gpio-xra1403.o
 obj-$(CONFIG_GPIO_XTENSA)		+= gpio-xtensa.o
 obj-$(CONFIG_GPIO_ZEVIO)		+= gpio-zevio.o
 obj-$(CONFIG_GPIO_ZYNQ)			+= gpio-zynq.o
+obj-$(CONFIG_GPIO_INTEL_PMC_TIO)	+= gpio-intel-tio-pmc.o
diff --git a/drivers/gpio/gpio-intel-tio-pmc.c b/drivers/gpio/gpio-intel-tio-pmc.c
new file mode 100644
index 000000000000..e6436b56ebea
--- /dev/null
+++ b/drivers/gpio/gpio-intel-tio-pmc.c
@@ -0,0 +1,182 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Intel Time-Aware GPIO Controller Driver
+ * Copyright (C) 2021 Intel Corporation
+ */
+
+#include <linux/acpi.h>
+#include <linux/debugfs.h>
+#include <linux/gpio/driver.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <uapi/linux/gpio.h>
+
+#define TGPIOCTL		0x00
+#define TGPIOCOMPV31_0		0x10
+#define TGPIOCOMPV63_32		0x14
+#define TGPIOPIV31_0		0x18
+#define TGPIOPIV63_32		0x1c
+#define TGPIOTCV31_0		0x20
+#define TGPIOTCV63_32		0x24 /* Not used */
+#define TGPIOECCV31_0		0x28
+#define TGPIOECCV63_32		0x2c
+#define TGPIOEC31_0		0x30
+#define TGPIOEC63_32		0x34
+
+/* Control Register */
+#define TGPIOCTL_EN			BIT(0)
+#define TGPIOCTL_DIR			BIT(1)
+#define TGPIOCTL_EP			GENMASK(3, 2)
+#define TGPIOCTL_EP_RISING_EDGE		(0 << 2)
+#define TGPIOCTL_EP_FALLING_EDGE	BIT(2)
+#define TGPIOCTL_EP_TOGGLE_EDGE		BIT(3)
+#define TGPIOCTL_PM			BIT(4)
+
+#define DRIVER_NAME		"intel-pmc-tio"
+
+struct intel_pmc_tio_chip {
+	struct gpio_chip gch;
+	struct platform_device *pdev;
+	struct dentry *root;
+	struct debugfs_regset32 *regset;
+	void __iomem *base;
+};
+
+static const struct debugfs_reg32 intel_pmc_tio_regs[] = {
+	{
+		.name = "TGPIOCTL",
+		.offset = TGPIOCTL
+	},
+	{
+		.name = "TGPIOCOMPV31_0",
+		.offset = TGPIOCOMPV31_0
+	},
+	{
+		.name = "TGPIOCOMPV63_32",
+		.offset = TGPIOCOMPV63_32
+	},
+	{
+		.name = "TGPIOPIV31_0",
+		.offset = TGPIOPIV31_0
+	},
+	{
+		.name = "TGPIOPIV63_32",
+		.offset = TGPIOPIV63_32
+	},
+	{
+		.name = "TGPIOECCV31_0",
+		.offset = TGPIOECCV31_0
+	},
+	{
+		.name = "TGPIOECCV63_32",
+		.offset = TGPIOECCV63_32
+	},
+	{
+		.name = "TGPIOEC31_0",
+		.offset = TGPIOEC31_0
+	},
+	{
+		.name = "TGPIOEC63_32",
+		.offset = TGPIOEC63_32
+	},
+};
+
+static int intel_pmc_tio_probe(struct platform_device *pdev)
+{
+	struct intel_pmc_tio_chip *tio;
+	int err;
+
+	tio = devm_kzalloc(&pdev->dev, sizeof(*tio), GFP_KERNEL);
+	if (!tio)
+		return -ENOMEM;
+	tio->pdev = pdev;
+
+	tio->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(tio->base))
+		return PTR_ERR(tio->base);
+
+	tio->regset = devm_kzalloc
+		(&pdev->dev, sizeof(*tio->regset), GFP_KERNEL);
+	if (!tio->regset)
+		return -ENOMEM;
+
+	tio->regset->regs = intel_pmc_tio_regs;
+	tio->regset->nregs = ARRAY_SIZE(intel_pmc_tio_regs);
+	tio->regset->base = tio->base;
+
+	tio->root = debugfs_create_dir(pdev->name, NULL);
+	if (IS_ERR(tio->root))
+		return PTR_ERR(tio->root);
+
+	debugfs_create_regset32("regdump", 0444, tio->root, tio->regset);
+
+	tio->gch.label = pdev->name;
+	tio->gch.ngpio = 0;
+	tio->gch.base = -1;
+
+	platform_set_drvdata(pdev, tio);
+
+	err = devm_gpiochip_add_data(&pdev->dev, &tio->gch, tio);
+	if (err < 0)
+		goto out_recurse_remove_tio_root;
+
+	return 0;
+
+out_recurse_remove_tio_root:
+	debugfs_remove_recursive(tio->root);
+
+	return err;
+}
+
+static int intel_pmc_tio_remove(struct platform_device *pdev)
+{
+	struct intel_pmc_tio_chip *tio;
+
+	tio = platform_get_drvdata(pdev);
+	if (!tio)
+		return -ENODEV;
+
+	debugfs_remove_recursive(tio->root);
+
+	return 0;
+}
+
+static const struct acpi_device_id intel_pmc_tio_acpi_match[] = {
+	{ "INTC1021", 0 }, /* EHL */
+	{ "INTC1022", 0 }, /* EHL */
+	{ "INTC1023", 0 }, /* TGL */
+	{ "INTC1024", 0 }, /* TGL */
+	{  }
+};
+
+static struct platform_driver intel_pmc_tio_driver = {
+	.probe          = intel_pmc_tio_probe,
+	.remove         = intel_pmc_tio_remove,
+	.driver         = {
+		.name                   = DRIVER_NAME,
+		.acpi_match_table       = intel_pmc_tio_acpi_match,
+	},
+};
+
+static int intel_pmc_tio_init(void)
+{
+	/* To ensure ART to TSC conversion is correct */
+	if (!boot_cpu_has(X86_FEATURE_TSC_KNOWN_FREQ))
+		return -ENXIO;
+
+	return platform_driver_register(&intel_pmc_tio_driver);
+}
+
+static void intel_pmc_tio_exit(void)
+{
+	platform_driver_unregister(&intel_pmc_tio_driver);
+}
+
+module_init(intel_pmc_tio_init);
+module_exit(intel_pmc_tio_exit);
+
+MODULE_AUTHOR("Christopher Hall <christopher.s.hall@intel.com>");
+MODULE_AUTHOR("Tamal Saha <tamal.saha@intel.com>");
+MODULE_AUTHOR("Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>");
+MODULE_DESCRIPTION("Intel PMC Time-Aware GPIO Controller Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

