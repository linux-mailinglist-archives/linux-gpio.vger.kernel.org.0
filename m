Return-Path: <linux-gpio+bounces-27779-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B2EC186FB
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 07:25:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71B163A806A
	for <lists+linux-gpio@lfdr.de>; Wed, 29 Oct 2025 06:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CA6C302158;
	Wed, 29 Oct 2025 06:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HGL8CN9X"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD5F3043DC;
	Wed, 29 Oct 2025 06:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761718917; cv=none; b=m/r6PrPPt6ZoGCuGOIUQgnuI87D/znwIV81ORx7lTQjCoOJU7I2CyiL11ixsvlnIHJ0dDiA0dt2LuWv9FatLJZrsEa5xBh0qBxrzuAmHhnEORbmhRzQI56g9IOC875TDdvB2Zcw7XjibSCA3hVZqpw/1woUDCT5xmPXPSl/IXtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761718917; c=relaxed/simple;
	bh=HDcnGGbcbmRoo8z5vK+lo3rzFRrgRcR30x3ZIFXlv60=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q3QeWC8mZhcbWMQ59+IiUvwTwEFNVRXkwQterXwnrApYbMZE2bWdcTlc/SqXlSjBHPcNVdVqFLXhnefW0792e2zx/A4JxJWtGqQH4tiNQPMVXHXrR0brTR3zmPTRQmd1pI3He+5ShjEi4BvtMmPxw6GyuiaKievB4eI8umfEUkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HGL8CN9X; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761718915; x=1793254915;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HDcnGGbcbmRoo8z5vK+lo3rzFRrgRcR30x3ZIFXlv60=;
  b=HGL8CN9XQyOK6PYO75QC9imFBOXmyZl9UQQlTIlYoG/aAMMqKWiQuG+p
   mV4HOEw9eC7uMzwuRsCIXND9Cvgf/+YQxKTw5t281oRpu33VLsTiOzZoN
   q/S1H+XcwvQZtI8NuihBsZhhXfXagR6UYqWaqO6I3lLBZhohSHkIwG0ke
   bTT0QrB8gNTd5c7aDpdEq9Dej64yTIchqceXKjFjpa8BfytVEeMuGAtF/
   WvMoEUhUiI5Ny8J37tgmp9fUZzxpEXoLjri9n89siwfkMHeND6WY9AnxS
   cvz2QuXqI0fmg+16IyCmrEC0wP14+vhJpH54SArvAbXryautX5L9uGyq0
   g==;
X-CSE-ConnectionGUID: HBMxvmJYTraLeQ+lUZqWoQ==
X-CSE-MsgGUID: HrXVrQkASYuEi2n+GgY0cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="66446274"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="66446274"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 23:21:55 -0700
X-CSE-ConnectionGUID: IONHn38ORpWqOpoI6KeePA==
X-CSE-MsgGUID: 4MfqJQuGQxK0dtzVJ9tHNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="185201102"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by orviesa009.jf.intel.com with ESMTP; 28 Oct 2025 23:21:52 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	linus.walleij@linaro.org,
	brgl@bgdev.pl
Cc: platform-driver-x86@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1 1/2] platform/x86/intel: Introduce Intel Elkhart Lake PSE I/O
Date: Wed, 29 Oct 2025 11:50:49 +0530
Message-Id: <20251029062050.4160517-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251029062050.4160517-1-raag.jadav@intel.com>
References: <20251029062050.4160517-1-raag.jadav@intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Intel Elkhart Lake Programmable Service Engine (PSE) includes two PCI
devices that expose two different capabilities of GPIO and Timed I/O
as a single PCI function through shared MMIO with below layout.

GPIO: 0x0000 - 0x1000
TIO:  0x1000 - 0x2000

This driver enumerates the PCI parent device and creates auxiliary child
devices for these capabilities. The actual functionalities are provided
by their respective auxiliary drivers.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 MAINTAINERS                             |   7 ++
 drivers/platform/x86/intel/Kconfig      |  13 +++
 drivers/platform/x86/intel/Makefile     |   1 +
 drivers/platform/x86/intel/ehl_pse_io.c | 128 ++++++++++++++++++++++++
 include/linux/ehl_pse_io_aux.h          |  30 ++++++
 5 files changed, 179 insertions(+)
 create mode 100644 drivers/platform/x86/intel/ehl_pse_io.c
 create mode 100644 include/linux/ehl_pse_io_aux.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 46126ce2f968..bd2a009d73c6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12499,6 +12499,13 @@ F:	drivers/gpu/drm/xe/
 F:	include/drm/intel/
 F:	include/uapi/drm/xe_drm.h
 
+INTEL ELKHART LAKE PSE I/O DRIVER
+M:	Raag Jadav <raag.jadav@intel.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Supported
+F:	drivers/platform/x86/intel/ehl_pse_io.c
+F:	include/linux/ehl_pse_io_aux.h
+
 INTEL ETHERNET DRIVERS
 M:	Tony Nguyen <anthony.l.nguyen@intel.com>
 M:	Przemek Kitszel <przemyslaw.kitszel@intel.com>
diff --git a/drivers/platform/x86/intel/Kconfig b/drivers/platform/x86/intel/Kconfig
index 19a2246f2770..2900407d6095 100644
--- a/drivers/platform/x86/intel/Kconfig
+++ b/drivers/platform/x86/intel/Kconfig
@@ -41,6 +41,19 @@ config INTEL_VBTN
 	  To compile this driver as a module, choose M here: the module will
 	  be called intel_vbtn.
 
+config INTEL_EHL_PSE_IO
+	tristate "Intel Elkhart Lake PSE I/O driver"
+	depends on PCI
+	select AUXILIARY_BUS
+	help
+	  Select this option to enable Intel Elkhart Lake PSE GPIO and Timed
+	  I/O support. This driver enumerates the PCI parent device and
+	  creates auxiliary child devices for these capabilities. The actual
+	  functionalities are provided by their respective auxiliary drivers.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called intel_ehl_pse_io.
+
 config INTEL_INT0002_VGPIO
 	tristate "Intel ACPI INT0002 Virtual GPIO driver"
 	depends on GPIOLIB && ACPI && PM_SLEEP
diff --git a/drivers/platform/x86/intel/Makefile b/drivers/platform/x86/intel/Makefile
index 78acb414e154..138b13756158 100644
--- a/drivers/platform/x86/intel/Makefile
+++ b/drivers/platform/x86/intel/Makefile
@@ -21,6 +21,7 @@ intel-target-$(CONFIG_INTEL_HID_EVENT)		+= hid.o
 intel-target-$(CONFIG_INTEL_VBTN)		+= vbtn.o
 
 # Intel miscellaneous drivers
+intel-target-$(CONFIG_INTEL_EHL_PSE_IO)		+= ehl_pse_io.o
 intel-target-$(CONFIG_INTEL_INT0002_VGPIO)	+= int0002_vgpio.o
 intel-target-$(CONFIG_INTEL_ISHTP_ECLITE)	+= ishtp_eclite.o
 intel-target-$(CONFIG_INTEL_OAKTRAIL)		+= oaktrail.o
diff --git a/drivers/platform/x86/intel/ehl_pse_io.c b/drivers/platform/x86/intel/ehl_pse_io.c
new file mode 100644
index 000000000000..f1cad102f856
--- /dev/null
+++ b/drivers/platform/x86/intel/ehl_pse_io.c
@@ -0,0 +1,128 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Intel Elkhart Lake Programmable Service Engine (PSE) I/O
+ *
+ * Copyright (c) 2025 Intel Corporation.
+ *
+ * Author: Raag Jadav <raag.jadav@intel.com>
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/dev_printk.h>
+#include <linux/device/devres.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/gfp_types.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/sizes.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#include <linux/ehl_pse_io_aux.h>
+
+#define EHL_PSE_IO_DEV_OFFSET	SZ_4K
+#define EHL_PSE_IO_DEV_SIZE	SZ_4K
+
+static void ehl_pse_io_dev_release(struct device *dev)
+{
+	struct auxiliary_device *aux_dev = to_auxiliary_dev(dev);
+	struct ehl_pse_io_dev *io_dev = auxiliary_dev_to_ehl_pse_io_dev(aux_dev);
+
+	kfree(io_dev);
+}
+
+static int ehl_pse_io_dev_add(struct pci_dev *pci, const char *name, int idx)
+{
+	struct auxiliary_device *aux_dev;
+	struct device *dev = &pci->dev;
+	struct ehl_pse_io_dev *io_dev;
+	resource_size_t start;
+	int ret;
+
+	io_dev = kzalloc(sizeof(*io_dev), GFP_KERNEL);
+	if (!io_dev)
+		return -ENOMEM;
+
+	start = pci_resource_start(pci, 0);
+	io_dev->irq = pci_irq_vector(pci, idx);
+	io_dev->mem = DEFINE_RES_MEM(start + (EHL_PSE_IO_DEV_OFFSET * idx), EHL_PSE_IO_DEV_SIZE);
+
+	aux_dev = &io_dev->aux_dev;
+	aux_dev->name = name;
+	aux_dev->id = (pci_domain_nr(pci->bus) << 16) | pci_dev_id(pci);
+	aux_dev->dev.parent = dev;
+	aux_dev->dev.release = ehl_pse_io_dev_release;
+
+	ret = auxiliary_device_init(aux_dev);
+	if (ret)
+		goto free_io_dev;
+
+	ret = __auxiliary_device_add(aux_dev, dev->driver->name);
+	if (ret)
+		goto uninit_aux_dev;
+
+	return 0;
+
+uninit_aux_dev:
+	/* io_dev will be freed with the put_device() and .release sequence */
+	auxiliary_device_uninit(aux_dev);
+free_io_dev:
+	kfree(io_dev);
+	return ret;
+}
+
+static int ehl_pse_io_probe(struct pci_dev *pci, const struct pci_device_id *id)
+{
+	int ret;
+
+	ret = pcim_enable_device(pci);
+	if (ret)
+		return ret;
+
+	pci_set_master(pci);
+
+	ret = pci_alloc_irq_vectors(pci, 2, 2, PCI_IRQ_MSI);
+	if (ret < 0)
+		return ret;
+
+	ret = ehl_pse_io_dev_add(pci, EHL_PSE_GPIO_NAME, 0);
+	if (ret)
+		return ret;
+
+	return ehl_pse_io_dev_add(pci, EHL_PSE_TIO_NAME, 1);
+}
+
+static int ehl_pse_io_dev_destroy(struct device *dev, void *data)
+{
+	auxiliary_device_destroy(to_auxiliary_dev(dev));
+
+	return 0;
+}
+
+static void ehl_pse_io_remove(struct pci_dev *pci)
+{
+	struct device *dev = &pci->dev;
+
+	device_for_each_child_reverse(dev, NULL, ehl_pse_io_dev_destroy);
+}
+
+static const struct pci_device_id ehl_pse_io_ids[] = {
+	{ PCI_VDEVICE(INTEL, 0x4b88) },
+	{ PCI_VDEVICE(INTEL, 0x4b89) },
+	{ }
+};
+MODULE_DEVICE_TABLE(pci, ehl_pse_io_ids);
+
+static struct pci_driver ehl_pse_io_driver = {
+	.name		= EHL_PSE_IO_NAME,
+	.id_table	= ehl_pse_io_ids,
+	.probe		= ehl_pse_io_probe,
+	.remove		= ehl_pse_io_remove,
+};
+module_pci_driver(ehl_pse_io_driver);
+
+MODULE_AUTHOR("Raag Jadav <raag.jadav@intel.com>");
+MODULE_DESCRIPTION("Intel Elkhart Lake PSE I/O driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/ehl_pse_io_aux.h b/include/linux/ehl_pse_io_aux.h
new file mode 100644
index 000000000000..33eb5a86ce36
--- /dev/null
+++ b/include/linux/ehl_pse_io_aux.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Intel Elkhart Lake PSE I/O Auxiliary Device
+ *
+ * Copyright (c) 2025 Intel Corporation.
+ *
+ * Author: Raag Jadav <raag.jadav@intel.com>
+ */
+
+#ifndef _EHL_PSE_IO_AUX_H_
+#define _EHL_PSE_IO_AUX_H_
+
+#include <linux/auxiliary_bus.h>
+#include <linux/container_of.h>
+#include <linux/ioport.h>
+
+#define EHL_PSE_IO_NAME		"ehl-pse-io"
+#define EHL_PSE_GPIO_NAME	"gpio-elkhartlake"
+#define EHL_PSE_TIO_NAME	"pps-tio"
+
+struct ehl_pse_io_dev {
+	struct auxiliary_device aux_dev;
+	struct resource mem;
+	int irq;
+};
+
+#define auxiliary_dev_to_ehl_pse_io_dev(auxiliary_dev) \
+	container_of(auxiliary_dev, struct ehl_pse_io_dev, aux_dev)
+
+#endif /* _EHL_PSE_IO_AUX_H_ */
-- 
2.34.1


