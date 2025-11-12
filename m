Return-Path: <linux-gpio+bounces-28372-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA7DC506E2
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 04:42:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66D4A189323B
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Nov 2025 03:42:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D3522D23AD;
	Wed, 12 Nov 2025 03:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZTocwu5/"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17BC72C11C4;
	Wed, 12 Nov 2025 03:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762918898; cv=none; b=Ec/nASRFmbMBiiY7XTf+6xjmuZVbKi2trHgWYZ2Oy64IoCZAm87iQyhNZChLErGXPHMMy22qAVxSmdMbvAZqeQVkrQm9Jf4CGPHUNVEvkcL+UivBMpgHZRb7SdOctkmRRRWkoJ0e169VY4nXTk08H7XFklZlk3QtpVMC8hn+sBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762918898; c=relaxed/simple;
	bh=JcyC3jYPkYxGqLIHUa1cSPrnz2LGoNNjJ8bjhu8dicw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ioFtQW0ucS/Yy4nGQsP7Ve13Ngy5dBlsC02pb9wcBFDwTH78F4eYp4ichiGO08UD6u1jnQcKJT+imXOv9H+FhOdl4SZZQSLzgZ6avpkFVYDtGNo4yeNfVTbWFr2q1Zm/AlSwBLFraTm1vNRbehCtRGoMFd+UrSopg5E5bu3CkKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZTocwu5/; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762918896; x=1794454896;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JcyC3jYPkYxGqLIHUa1cSPrnz2LGoNNjJ8bjhu8dicw=;
  b=ZTocwu5/sYxDmaSqVeXdEqSP5s/km+gP/AZV2SnakE5dciIX9QDH1f7A
   1BNAy32soAhe5zYo0em8VZfxjht0Rw3UyEPpnT0YuAni13Y2CAnB63kmt
   25ogyn4KqxqfOQEtq3amUB0ka96grHAHH34nu6+dFBf0F7MTETQr8hx0D
   gCfFPVmfsnJwu+0m+ndA8ErttUKfuQ8DLMqzHrsZf9ZgFexSl0w3dI0UB
   N7VB6SZfXgi31mN7pYj04MFcjUD4D5+7tuA4HXCIx5KBOiKsG+V8iFCnY
   Bufrs29BdTcCClFtRisuo2bQdDuitsQEuw5aMm6PL0jNMl0mPm3mQYXsi
   A==;
X-CSE-ConnectionGUID: 4+8uIeLLSrCEvJK3OG2bMA==
X-CSE-MsgGUID: 057Z0OouTA+XR/kv/kxkUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11610"; a="90450218"
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="90450218"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2025 19:41:36 -0800
X-CSE-ConnectionGUID: n5VHYhqqSKGSXGTaO6BqqA==
X-CSE-MsgGUID: azzac8KhR12BmwIYv7vthQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,298,1754982000"; 
   d="scan'208";a="188752296"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
  by fmviesa007.fm.intel.com with ESMTP; 11 Nov 2025 19:41:33 -0800
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
Subject: [PATCH v3 1/2] platform/x86/intel: Introduce Intel Elkhart Lake PSE I/O
Date: Wed, 12 Nov 2025 09:10:10 +0530
Message-ID: <20251112034040.457801-2-raag.jadav@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112034040.457801-1-raag.jadav@intel.com>
References: <20251112034040.457801-1-raag.jadav@intel.com>
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
 MAINTAINERS                             |  7 ++
 drivers/platform/x86/intel/Kconfig      | 13 ++++
 drivers/platform/x86/intel/Makefile     |  1 +
 drivers/platform/x86/intel/ehl_pse_io.c | 86 +++++++++++++++++++++++++
 include/linux/ehl_pse_io_aux.h          | 24 +++++++
 5 files changed, 131 insertions(+)
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
index 000000000000..861e14808b35
--- /dev/null
+++ b/drivers/platform/x86/intel/ehl_pse_io.c
@@ -0,0 +1,86 @@
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
+static int ehl_pse_io_dev_create(struct pci_dev *pci, const char *name, int idx)
+{
+	struct device *dev = &pci->dev;
+	struct auxiliary_device *adev;
+	struct ehl_pse_io_data *data;
+	resource_size_t start, offset;
+	u32 id;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	id = (pci_domain_nr(pci->bus) << 16) | pci_dev_id(pci);
+	start = pci_resource_start(pci, 0);
+	offset = EHL_PSE_IO_DEV_SIZE * idx;
+
+	data->mem = DEFINE_RES_MEM(start + offset, EHL_PSE_IO_DEV_SIZE);
+	data->irq = pci_irq_vector(pci, idx);
+
+	adev = __devm_auxiliary_device_create(dev, EHL_PSE_IO_NAME, name, data, id);
+
+	return adev ? 0 : -ENODEV;
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
+	ret = ehl_pse_io_dev_create(pci, EHL_PSE_GPIO_NAME, 0);
+	if (ret)
+		return ret;
+
+	return ehl_pse_io_dev_create(pci, EHL_PSE_TIO_NAME, 1);
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
index 000000000000..afb8587ee5fb
--- /dev/null
+++ b/include/linux/ehl_pse_io_aux.h
@@ -0,0 +1,24 @@
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
+#include <linux/ioport.h>
+
+#define EHL_PSE_IO_NAME		"ehl_pse_io"
+#define EHL_PSE_GPIO_NAME	"gpio"
+#define EHL_PSE_TIO_NAME	"pps_tio"
+
+struct ehl_pse_io_data {
+	struct resource mem;
+	int irq;
+};
+
+#endif /* _EHL_PSE_IO_AUX_H_ */
-- 
2.43.0


