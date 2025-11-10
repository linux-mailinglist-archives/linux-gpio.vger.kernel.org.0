Return-Path: <linux-gpio+bounces-28280-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB91C45043
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 06:29:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CBA183B191E
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Nov 2025 05:28:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CEC52EA16A;
	Mon, 10 Nov 2025 05:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FWBolxy5"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4180E2E8B78;
	Mon, 10 Nov 2025 05:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762752501; cv=none; b=Hztr625crXmdvvB18EKrBNswy9rKeO325F5+Hq98THPcHVF4C82F8TUfjKo6xyNSGjztmNhm3N4Mad8NhdoypR7+kn67J3M3J7UzLLIw1AMPWIQMKu+YuWruGjbN/o4pOQjW8Hm3Ngo3fstunglpdy6zGI/aNXAi8qYWQP/mwqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762752501; c=relaxed/simple;
	bh=1tX3a8K+DodNZRY2qMumeDL7ak7KCFc/lmKScVhUU/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Od57LssZTRqfNMN/dcH/QR9klFUg7QMGSI1Eijm2u5/L4At8JjxXel4kasxCsOPeDq4sAsRw8MYol/zzeVQ9OUsCflLNrNJ7H6W/ma6Rw3CogOMbg0eO99KWqBdFSCxPKJzr/iyq4bMKV236eK6Dgq7GwFjD5upqpigatKQ2xOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FWBolxy5; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762752499; x=1794288499;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1tX3a8K+DodNZRY2qMumeDL7ak7KCFc/lmKScVhUU/Y=;
  b=FWBolxy5M+TDstYxRqwfcyQaiJHb+OQLg25C+JEL/mZZ5DZ9NYLflYWK
   5AwQ2uAPvDR31VIVIYcKUJMWeSNVXKn7DcIS3dAlApn9kPDEfUezVj9/F
   w2wGqkv9KHMH/WxSdn7Rv1NtL2Y0Gt5pu5j3T3zzJ4062uqHQtM6lHU8I
   ELcgdEy9znLDVLuw3RUuyxRpmE+ziU06j6n6gahyiOennnhu4IUEpjTl3
   Jg2y56WuGs1KV6r7yWsuRcRlxvXDuMnooR6nzXzkB7z+UwHpI+tWfS50z
   0CXPvfJcpYgGpkBhSImv5zvBD38JM2A2cspmPHuAnw5DuzH4CnG3SLR7q
   w==;
X-CSE-ConnectionGUID: pttOiBG6Tp2pN+kOm9vXwA==
X-CSE-MsgGUID: MRfCzOD7QdKuZ7/0+IPMYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11608"; a="67405755"
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="67405755"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2025 21:28:19 -0800
X-CSE-ConnectionGUID: 94pOi93QR1a4jcTTcKRNjA==
X-CSE-MsgGUID: xcwryLhIQgi/T5gJSIkJyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,293,1754982000"; 
   d="scan'208";a="192691678"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by orviesa003.jf.intel.com with ESMTP; 09 Nov 2025 21:28:16 -0800
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
Subject: [PATCH v2 1/2] platform/x86/intel: Introduce Intel Elkhart Lake PSE I/O
Date: Mon, 10 Nov 2025 10:56:40 +0530
Message-ID: <20251110052728.383339-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251110052728.383339-1-raag.jadav@intel.com>
References: <20251110052728.383339-1-raag.jadav@intel.com>
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
 drivers/platform/x86/intel/ehl_pse_io.c | 107 ++++++++++++++++++++++++
 include/linux/ehl_pse_io_aux.h          |  30 +++++++
 5 files changed, 158 insertions(+)
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
index 000000000000..9766d5dec1da
--- /dev/null
+++ b/drivers/platform/x86/intel/ehl_pse_io.c
@@ -0,0 +1,107 @@
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
+#include <linux/device/devres.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/gfp_types.h>
+#include <linux/ioport.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/pci.h>
+#include <linux/sizes.h>
+#include <linux/types.h>
+
+#include <linux/ehl_pse_io_aux.h>
+
+#define EHL_PSE_IO_DEV_SIZE	SZ_4K
+
+static void ehl_pse_io_dev_release(struct device *dev) {}
+
+static void ehl_pse_io_dev_destroy(void *aux_dev)
+{
+	auxiliary_device_destroy(aux_dev);
+}
+
+static int ehl_pse_io_dev_add(struct pci_dev *pci, const char *name, int idx)
+{
+	struct auxiliary_device *aux_dev;
+	struct device *dev = &pci->dev;
+	struct ehl_pse_io_dev *io_dev;
+	resource_size_t start, offset;
+	int ret;
+
+	io_dev = devm_kzalloc(dev, sizeof(*io_dev), GFP_KERNEL);
+	if (!io_dev)
+		return -ENOMEM;
+
+	start = pci_resource_start(pci, 0);
+	offset = EHL_PSE_IO_DEV_SIZE * idx;
+
+	io_dev->irq = pci_irq_vector(pci, idx);
+	io_dev->mem = DEFINE_RES_MEM(start + offset, EHL_PSE_IO_DEV_SIZE);
+
+	aux_dev = &io_dev->aux_dev;
+	aux_dev->name = name;
+	aux_dev->id = (pci_domain_nr(pci->bus) << 16) | pci_dev_id(pci);
+	aux_dev->dev.parent = dev;
+	aux_dev->dev.release = ehl_pse_io_dev_release;
+
+	ret = auxiliary_device_init(aux_dev);
+	if (ret)
+		return ret;
+
+	ret = auxiliary_device_add(aux_dev);
+	if (ret) {
+		auxiliary_device_uninit(aux_dev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(dev, ehl_pse_io_dev_destroy, aux_dev);
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
+};
+module_pci_driver(ehl_pse_io_driver);
+
+MODULE_AUTHOR("Raag Jadav <raag.jadav@intel.com>");
+MODULE_DESCRIPTION("Intel Elkhart Lake PSE I/O driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/ehl_pse_io_aux.h b/include/linux/ehl_pse_io_aux.h
new file mode 100644
index 000000000000..fff5effbd7f9
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
+#define EHL_PSE_IO_NAME		"intel_ehl_pse_io"
+#define EHL_PSE_GPIO_NAME	"gpio"
+#define EHL_PSE_TIO_NAME	"pps_tio"
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
2.43.0


