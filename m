Return-Path: <linux-gpio+bounces-16888-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6321A4B736
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 05:48:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C70D616C725
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 04:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EB1F1DED52;
	Mon,  3 Mar 2025 04:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PGC3ulXx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05DEC1C3BEE;
	Mon,  3 Mar 2025 04:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740977272; cv=none; b=f5UtbbVu0xg4idmyn/DpsuxRxWsMQtepAHYGkFzuGpaThCkn4mmcb1vKCONS5V1LoB7fhpb2b4EqS8O0zxJKFAkuFPOsV4G/FcEhwXQoAYWf2po72+fyEI8+12NVjV1ny0rPlzPgAuQjobkX6xhsyNV093NduSU3U5eMGXnNSKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740977272; c=relaxed/simple;
	bh=zgp/lBPbKz+16VAdbdVWjEJ14+jqNgFywH05sjjNqpE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JvaHibjcxTkHlIi5C02+m+O7dFA4Pi/34BeGGX4+oHwAy6Pb6gY5Evuvwtfjcb6vfyXHfDeI4Aup6TehgRmx2MYoZCJwBXLh3zHIG15JUl5Gc+rMON2jJSc9Y8mx9wRC13MXsLchsZoWIyeYKk5J4Z5SQxd28hsAFYd27gvJMGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PGC3ulXx; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740977271; x=1772513271;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zgp/lBPbKz+16VAdbdVWjEJ14+jqNgFywH05sjjNqpE=;
  b=PGC3ulXx+QE+kzc2JAKQhoS86JetHPdYqxmwc0MTme2oJkApk3lRbui0
   xsGU0VTaxDMk0T6PaZPVt2HvDT6JDuUP9/eEB/yZ0AqkIivBWOKeG4Gi1
   cx5/VRFJCnRNTrJ7Cfok9Q9ffKANEUEbS2NVYcVn0INwdHR6m2XDuA6kC
   LCSy4oKX7oqWL0CcOD5ipgxKKQB3Mh0WxFWRgoEtN+uP/mZnYBmaGL4U1
   3l8RvRhMYcFCpJRQkLKfm7YGbTAfMftvn/ab6Fyp95vqVHIFwteVezwIU
   rVxTrqt6ltq+qyELxKoupOWVdwyu8+FG6/oz45pmXpVDTeTa5CkdybBLz
   w==;
X-CSE-ConnectionGUID: U4uMmf1PSXKEcdrH+1vJ6w==
X-CSE-MsgGUID: YBK1ApdcTHyI4AXhn4Slyw==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="59382058"
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="59382058"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 20:47:50 -0800
X-CSE-ConnectionGUID: xpXjG9ASQ2iB6hxmjmi+Ag==
X-CSE-MsgGUID: FuluKIpuQyqSc4nJqvGreQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123123932"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by orviesa005.jf.intel.com with ESMTP; 02 Mar 2025 20:47:48 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: lee@kernel.org,
	giometti@enneenne.com,
	gregkh@linuxfoundation.org,
	andriy.shevchenko@linux.intel.com,
	raymond.tan@intel.com
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v2 1/5] mfd: intel_ehl_pse_gpio: Introduce Intel Elkhart Lake PSE GPIO and TIO
Date: Mon,  3 Mar 2025 10:17:41 +0530
Message-Id: <20250303044745.268964-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303044745.268964-1-raag.jadav@intel.com>
References: <20250303044745.268964-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Intel Elkhart Lake Programmable Service Engine (PSE) includes two PCI
devices that expose two different capabilities of GPIO and Timed I/O
as a single PCI function through shared MMIO.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS                      |   5 ++
 drivers/mfd/Kconfig              |  12 ++++
 drivers/mfd/Makefile             |   1 +
 drivers/mfd/intel_ehl_pse_gpio.c | 100 +++++++++++++++++++++++++++++++
 4 files changed, 118 insertions(+)
 create mode 100644 drivers/mfd/intel_ehl_pse_gpio.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d4280facbe51..9077ab11478c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11643,6 +11643,11 @@ F:	drivers/gpio/gpio-sodaville.c
 F:	drivers/gpio/gpio-tangier.c
 F:	drivers/gpio/gpio-tangier.h
 
+INTEL GPIO MFD DRIVER
+M:	Raag Jadav <raag.jadav@intel.com>
+S:	Supported
+F:	drivers/mfd/intel_ehl_pse_gpio.c
+
 INTEL GVT-g DRIVERS (Intel GPU Virtualization)
 M:	Zhenyu Wang <zhenyuw@linux.intel.com>
 M:	Zhi Wang <zhi.wang.linux@gmail.com>
diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 6b0682af6e32..36eac5245179 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -597,6 +597,18 @@ config MFD_HI655X_PMIC
 	help
 	  Select this option to enable Hisilicon hi655x series pmic driver.
 
+config MFD_INTEL_EHL_PSE_GPIO
+	tristate "Intel Elkhart Lake PSE GPIO MFD"
+	depends on PCI && (X86 || COMPILE_TEST)
+	select MFD_CORE
+	help
+	  This MFD provides support for GPIO and TIO that exist on Intel
+	  Elkhart Lake PSE as a single PCI device. It splits the two I/O
+	  devices to their respective I/O drivers.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called intel_ehl_pse_gpio.
+
 config MFD_INTEL_QUARK_I2C_GPIO
 	tristate "Intel Quark MFD I2C GPIO"
 	depends on PCI
diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
index 9220eaf7cf12..8f7d257856db 100644
--- a/drivers/mfd/Makefile
+++ b/drivers/mfd/Makefile
@@ -196,6 +196,7 @@ obj-$(CONFIG_MFD_TIMBERDALE)    += timberdale.o
 obj-$(CONFIG_PMIC_ADP5520)	+= adp5520.o
 obj-$(CONFIG_MFD_ADP5585)	+= adp5585.o
 obj-$(CONFIG_MFD_KEMPLD)	+= kempld-core.o
+obj-$(CONFIG_MFD_INTEL_EHL_PSE_GPIO)	+= intel_ehl_pse_gpio.o
 obj-$(CONFIG_MFD_INTEL_QUARK_I2C_GPIO)	+= intel_quark_i2c_gpio.o
 obj-$(CONFIG_LPC_SCH)		+= lpc_sch.o
 obj-$(CONFIG_LPC_ICH)		+= lpc_ich.o
diff --git a/drivers/mfd/intel_ehl_pse_gpio.c b/drivers/mfd/intel_ehl_pse_gpio.c
new file mode 100644
index 000000000000..6a6ad1390a7b
--- /dev/null
+++ b/drivers/mfd/intel_ehl_pse_gpio.c
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Intel MFD driver for Elkhart Lake - Programmable Service Engine
+ * (PSE) GPIO & TIO
+ *
+ * Copyright (c) 2025 Intel Corporation
+ *
+ * Intel Elkhart Lake PSE includes two PCI devices that expose two
+ * different capabilities of GPIO and Timed I/O as a single PCI
+ * function through shared MMIO.
+ */
+
+#include <linux/array_size.h>
+#include <linux/ioport.h>
+#include <linux/mfd/core.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/platform_device.h>
+#include <linux/stddef.h>
+
+#define PSE_GPIO_OFFSET		0x0000
+#define PSE_GPIO_SIZE		0x0134
+
+#define PSE_TIO_OFFSET		0x1000
+#define PSE_TIO_SIZE		0x06B0
+
+static struct resource ehl_pse_gpio_resources[] = {
+	DEFINE_RES_MEM(PSE_GPIO_OFFSET, PSE_GPIO_SIZE),
+	DEFINE_RES_IRQ(0),
+};
+
+static struct resource ehl_pse_tio_resources[] = {
+	DEFINE_RES_MEM(PSE_TIO_OFFSET, PSE_TIO_SIZE),
+	DEFINE_RES_IRQ(1),
+};
+
+static struct mfd_cell ehl_pse_gpio_devs[] = {
+	{
+		.name = "gpio-elkhartlake",
+		.num_resources = ARRAY_SIZE(ehl_pse_gpio_resources),
+		.resources = ehl_pse_gpio_resources,
+		.ignore_resource_conflicts = true,
+	},
+	{
+		.name = "pps-gen-tio",
+		.num_resources = ARRAY_SIZE(ehl_pse_tio_resources),
+		.resources = ehl_pse_tio_resources,
+		.ignore_resource_conflicts = true,
+	},
+};
+
+static int ehl_pse_gpio_probe(struct pci_dev *pci, const struct pci_device_id *id)
+{
+	int ret;
+
+	ret = pcim_enable_device(pci);
+	if (ret)
+		return ret;
+
+	pci_set_master(pci);
+
+	ret = pci_alloc_irq_vectors(pci, 2, 2, PCI_IRQ_ALL_TYPES);
+	if (ret < 0)
+		return ret;
+
+	ret = mfd_add_devices(&pci->dev, PLATFORM_DEVID_AUTO, ehl_pse_gpio_devs,
+			      ARRAY_SIZE(ehl_pse_gpio_devs), pci_resource_n(pci, 0),
+			      pci_irq_vector(pci, 0), NULL);
+	if (ret)
+		pci_free_irq_vectors(pci);
+
+	return ret;
+}
+
+static void ehl_pse_gpio_remove(struct pci_dev *pdev)
+{
+	mfd_remove_devices(&pdev->dev);
+	pci_free_irq_vectors(pdev);
+}
+
+static const struct pci_device_id ehl_pse_gpio_ids[] = {
+	{ PCI_VDEVICE(INTEL, 0x4b88) },
+	{ PCI_VDEVICE(INTEL, 0x4b89) },
+	{}
+};
+MODULE_DEVICE_TABLE(pci, ehl_pse_gpio_ids);
+
+static struct pci_driver ehl_pse_gpio_driver = {
+	.probe		= ehl_pse_gpio_probe,
+	.remove		= ehl_pse_gpio_remove,
+	.id_table	= ehl_pse_gpio_ids,
+	.name		= "ehl_pse_gpio",
+};
+module_pci_driver(ehl_pse_gpio_driver);
+
+MODULE_AUTHOR("Raymond Tan <raymond.tan@intel.com>");
+MODULE_AUTHOR("Raag Jadav <raag.jadav@intel.com>");
+MODULE_DESCRIPTION("Intel MFD for Elkhart Lake PSE GPIO & TIO");
+MODULE_LICENSE("GPL");
-- 
2.34.1


