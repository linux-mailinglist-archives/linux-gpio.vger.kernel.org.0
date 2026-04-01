Return-Path: <linux-gpio+bounces-34572-lists+linux-gpio=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-gpio@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAOQLnRazWkRcQYAu9opvQ
	(envelope-from <linux-gpio+bounces-34572-lists+linux-gpio=lfdr.de@vger.kernel.org>)
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 19:48:36 +0200
X-Original-To: lists+linux-gpio@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A3B37ECEF
	for <lists+linux-gpio@lfdr.de>; Wed, 01 Apr 2026 19:48:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 3C37730071D9
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Apr 2026 17:45:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B6423081BE;
	Wed,  1 Apr 2026 17:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nakBbfhN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5682F617C
	for <linux-gpio@vger.kernel.org>; Wed,  1 Apr 2026 17:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775065543; cv=none; b=GNIerQc03L2+M1aTyQYgWrrOIFK17FIffYDPjZJBJP32jgxMUOgXa8itYaEIyWgCEribYLyA7EglQKtCZf4+ABygHJ/iCGnU5rZWm/vq+t98Qq5/+Ywmk355VN5k513fGQC7pF+YJ0xm7c+KtbCbvBctSL0F0y0jcnSqxRSz5zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775065543; c=relaxed/simple;
	bh=Pi/0vVH1/iHFLnmsYokmj42zq3kVZFrwpyFlf8cxeTg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iOcNWKjfhnZ0KlGkz+VcxzV/6W4FpaDPrloSLdeiT+LOgSIvPxCB7RKy1Lkjf6hnrvA+jfE8n9aKRMBgpZ6K6tOGWm3CV7cMoQ68NtrD/26O/40VvzUEq+GM5adjSLtsz2dXspIc7rvDhImSZtqkTnsVQr1va7c/kHtKG7k1Eoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nakBbfhN; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775065539; x=1806601539;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Pi/0vVH1/iHFLnmsYokmj42zq3kVZFrwpyFlf8cxeTg=;
  b=nakBbfhN57O+Xa0Z+AmcXCXa5FrTF/51L6af9FdfyRGdFYLzIhMtZ6Lq
   zVWhAO5vP4tBj8W0BzugrdJXtNdm44UAPfNscsBiCTVQRQq6LKBqrFcny
   DcPzxB3c1vDvzscawHat8lHQVLCuwgSf1wKaOpNp9P198MojkPowhhBYZ
   +gu0oMDqgUzEqmeWV6Z0vDyw2mix7WgxOQf7ZcS+1SqGtoGv23P59QqaC
   Q2ex3EkHICHzDie46v/AQ8/X9ErOVe+XR3OyOpvXbwnt+1xcjaDKsLDxY
   u+huhtZQTbDw4wk5FpB98qfeKuLXUOKNQikPSpchlVGSm+aE16I7nnCiU
   g==;
X-CSE-ConnectionGUID: VEf1n/eqRsmq/tRfvaRZbg==
X-CSE-MsgGUID: khpPfGvpQRmBe5RxFFeCFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="86417606"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="86417606"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 10:45:37 -0700
X-CSE-ConnectionGUID: af4Lek4vTna3uiSYsT9NRQ==
X-CSE-MsgGUID: Nr3Nq1smQ96whyHrxS/G0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="226730774"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO aborzesz-mobl2.intel.com) ([10.245.246.170])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2026 10:45:35 -0700
From: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
To: linux-gpio@vger.kernel.org,
	linusw@kernel.org,
	brgl@kernel.org
Cc: mika.westerberg@linux.intel.com,
	andriy.shevchenko@intel.com,
	alan.borzeszkowski@linux.intel.com
Subject: [PATCH v2] gpio: Add Intel Nova Lake ACPI GPIO events driver
Date: Wed,  1 Apr 2026 19:45:26 +0200
Message-ID: <20260401174526.60881-1-alan.borzeszkowski@linux.intel.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34572-lists,linux-gpio=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alan.borzeszkowski@linux.intel.com,linux-gpio@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_RCPT(0.00)[linux-gpio];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 65A3B37ECEF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This driver provides support for new way of handling platform events,
through the use of GPIO-signaled ACPI events. This mechanism is used on
Intel client platforms released in 2026 and later, starting with Intel
Nova Lake.

Signed-off-by: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
---
v1 -> v2:
- formatting changes
- move priv memory alloc after ACPI IO resource validation
v1: https://lore.kernel.org/linux-gpio/20260318142418.48574-1-alan.borzeszkowski@linux.intel.com/

 MAINTAINERS                         |   7 +
 drivers/gpio/Kconfig                |  26 +++
 drivers/gpio/Makefile               |   1 +
 drivers/gpio/gpio-novalake-events.c | 323 ++++++++++++++++++++++++++++
 4 files changed, 357 insertions(+)
 create mode 100644 drivers/gpio/gpio-novalake-events.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 0d718b6274df..039be0519e58 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12847,6 +12847,13 @@ F:	drivers/gpio/gpio-sodaville.c
 F:	drivers/gpio/gpio-tangier.c
 F:	drivers/gpio/gpio-tangier.h
 
+INTEL GPIO GPE DRIVER
+M:	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
+R:	Mika Westerberg <westeri@kernel.org>
+L:	linux-gpio@vger.kernel.org
+S:	Supported
+F:	drivers/gpio/gpio-novalake-events.c
+
 INTEL GVT-g DRIVERS (Intel GPU Virtualization)
 R:	Zhenyu Wang <zhenyuw.linux@gmail.com>
 R:	Zhi Wang <zhi.wang.linux@gmail.com>
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b45fb799e36c..c7a80e5189d8 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1057,6 +1057,32 @@ config GPIO_SCH
 	  The Intel Quark X1000 SoC has 2 GPIOs powered by the core
 	  power well and 6 from the suspend power well.
 
+config GPIO_NOVALAKE
+	tristate "Intel Nova Lake GPIO-signaled ACPI events support"
+	depends on (X86 || COMPILE_TEST) && ACPI
+	select GPIOLIB_IRQCHIP
+	help
+	  Select this to enable GPIO-signaled ACPI events support on platforms
+	  with the following SoCs:
+
+	  - Intel Nova Lake
+
+	  This driver adds support for new mode of handling platform events,
+	  through the use of GPIO-signaled ACPI events. Main purpose is to
+	  handle platform IRQs that originate in PCH components, for example
+	  interrupt triggered by Power Management Event (PME).
+
+	  This driver, at this time, is not required to handle platform events.
+	  Listed platform(s) will stay in legacy mode, handling ACPI events as
+	  in previous generations. However, future platforms will eventually
+	  switch to new handling mode, requiring this driver to run events
+	  properly.
+
+	  Driver supports up to 128 GPIO pins per GPE block.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called gpio-novalake-events.
+
 config GPIO_SCH311X
 	tristate "SMSC SCH311x SuperI/O GPIO"
 	help
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index c05f7d795c43..f563917cda83 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -134,6 +134,7 @@ obj-$(CONFIG_GPIO_MXC)			+= gpio-mxc.o
 obj-$(CONFIG_GPIO_MXS)			+= gpio-mxs.o
 obj-$(CONFIG_GPIO_NCT6694)		+= gpio-nct6694.o
 obj-$(CONFIG_GPIO_NOMADIK)		+= gpio-nomadik.o
+obj-$(CONFIG_GPIO_NOVALAKE)		+= gpio-novalake-events.o
 obj-$(CONFIG_GPIO_NPCM_SGPIO)		+= gpio-npcm-sgpio.o
 obj-$(CONFIG_GPIO_OCTEON)		+= gpio-octeon.o
 obj-$(CONFIG_GPIO_OMAP)			+= gpio-omap.o
diff --git a/drivers/gpio/gpio-novalake-events.c b/drivers/gpio/gpio-novalake-events.c
new file mode 100644
index 000000000000..b3bf0038f84a
--- /dev/null
+++ b/drivers/gpio/gpio-novalake-events.c
@@ -0,0 +1,323 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Intel Nova Lake GPIO-signaled ACPI events driver
+ *
+ * Copyright (c) 2026, Intel Corporation.
+ *
+ * Author: Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>
+ *
+ * Intel client platforms released in 2026 and later (starting with Intel Nova
+ * Lake) support two modes of handling ACPI General Purpose Events (GPE):
+ * exposed GPIO interrupt mode and legacy mode.
+ *
+ * By default, the platform uses legacy mode, handling GPEs as usual. If this
+ * driver is installed, it signals to the platform (on every boot) that exposed
+ * GPIO interrupt mode is supported. The platform then switches to exposed
+ * mode, which takes effect on next boot. From the user perspective, this
+ * change is transparent.
+ *
+ * However, if driver is uninstalled while in exposed interrupt mode, GPEs will
+ * _not_ be handled until platform falls back to legacy mode. This means that
+ * USB keyboard, mouse might not function properly for the fallback duration.
+ * Fallback requires two reboots to take effect: on first reboot, platform no
+ * longer receives signal from this driver and switches to legacy mode, which
+ * takes effect on second boot.
+ *
+ * Example ACPI event: Power Management Event coming from motherboard PCH,
+ * waking system from sleep following USB mouse hotplug.
+ *
+ * This driver supports up to 128 GPIO pins in each GPE block, per ACPI
+ * specification v6.6 section 5.6.4.
+ */
+
+#include <linux/acpi.h>
+#include <linux/bitops.h>
+#include <linux/cleanup.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/gfp_types.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+#include <linux/uuid.h>
+
+#include <linux/gpio/driver.h>
+
+/*
+ * GPE block has two registers, each register takes half the block size.
+ * Convert size to bits to get total GPIO pin count.
+ */
+#define GPE_BLK_REG_SIZE(block_size)	((block_size) / 2)
+#define GPE_REG_PIN_COUNT(block_size)	BYTES_TO_BITS(GPE_BLK_REG_SIZE(block_size))
+#define GPE_STS_REG_OFFSET		0
+#define GPE_EN_REG_OFFSET(block_size)	GPE_BLK_REG_SIZE(block_size)
+
+/**
+ * struct nvl_gpio - Intel Nova Lake GPIO driver state
+ * @gc: GPIO controller interface
+ * @reg_base: Base address of the GPE registers
+ * @lock: Guard register access
+ * @blk_size: GPE block length
+ */
+struct nvl_gpio {
+	struct gpio_chip gc;
+	void __iomem *reg_base;
+	raw_spinlock_t lock;
+	size_t blk_size;
+};
+
+static void __iomem *nvl_gpio_get_byte_addr(struct nvl_gpio *priv,
+					    unsigned int reg_offset,
+					    unsigned long gpio)
+{
+	return priv->reg_base + reg_offset + gpio;
+}
+
+static int nvl_gpio_get(struct gpio_chip *gc, unsigned int gpio)
+{
+	struct nvl_gpio *priv = gpiochip_get_data(gc);
+	unsigned int byte_idx = gpio / BITS_PER_BYTE;
+	unsigned int bit_idx = gpio % BITS_PER_BYTE;
+	void __iomem *addr;
+	u8 reg;
+
+	addr = nvl_gpio_get_byte_addr(priv, GPE_STS_REG_OFFSET, byte_idx);
+
+	guard(raw_spinlock_irqsave)(&priv->lock);
+
+	reg = ioread8(addr);
+
+	return !!(reg & BIT(bit_idx));
+}
+
+static const struct gpio_chip nvl_gpio_chip = {
+	.owner	= THIS_MODULE,
+	.get	= nvl_gpio_get,
+};
+
+static int nvl_gpio_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	if (type & IRQ_TYPE_EDGE_BOTH)
+		irq_set_handler_locked(d, handle_edge_irq);
+	else if (type & IRQ_TYPE_LEVEL_MASK)
+		irq_set_handler_locked(d, handle_level_irq);
+
+	return 0;
+}
+
+static void nvl_gpio_irq_mask_unmask(struct gpio_chip *gc, unsigned long hwirq,
+				     bool mask)
+{
+	struct nvl_gpio *priv = gpiochip_get_data(gc);
+	unsigned int byte_idx = hwirq / BITS_PER_BYTE;
+	unsigned int bit_idx = hwirq % BITS_PER_BYTE;
+	void __iomem *addr;
+	u8 reg;
+
+	addr = nvl_gpio_get_byte_addr(priv, GPE_EN_REG_OFFSET(priv->blk_size), byte_idx);
+
+	guard(raw_spinlock_irqsave)(&priv->lock);
+
+	reg = ioread8(addr);
+	if (mask)
+		reg &= ~BIT(bit_idx);
+	else
+		reg |= BIT(bit_idx);
+	iowrite8(reg, addr);
+}
+
+static void nvl_gpio_irq_unmask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+
+	gpiochip_enable_irq(gc, hwirq);
+	nvl_gpio_irq_mask_unmask(gc, hwirq, false);
+}
+
+static void nvl_gpio_irq_mask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+
+	nvl_gpio_irq_mask_unmask(gc, hwirq, true);
+	gpiochip_disable_irq(gc, hwirq);
+}
+
+static void nvl_gpio_irq_ack(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct nvl_gpio *priv = gpiochip_get_data(gc);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	unsigned int byte_idx = hwirq / BITS_PER_BYTE;
+	unsigned int bit_idx = hwirq % BITS_PER_BYTE;
+	void __iomem *addr;
+	u8 reg;
+
+	addr = nvl_gpio_get_byte_addr(priv, GPE_STS_REG_OFFSET, byte_idx);
+
+	guard(raw_spinlock_irqsave)(&priv->lock);
+
+	reg = ioread8(addr);
+	reg |= BIT(bit_idx);
+	iowrite8(reg, addr);
+}
+
+static const struct irq_chip nvl_gpio_irq_chip = {
+	.name		= "gpio-novalake",
+	.irq_ack	= nvl_gpio_irq_ack,
+	.irq_mask	= nvl_gpio_irq_mask,
+	.irq_unmask	= nvl_gpio_irq_unmask,
+	.irq_set_type	= nvl_gpio_irq_set_type,
+	.flags		= IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static irqreturn_t nvl_gpio_irq(int irq, void *data)
+{
+	struct nvl_gpio *priv = data;
+	const size_t block_size = priv->blk_size;
+	unsigned int handled = 0;
+
+	for (unsigned int i = 0; i < block_size; i++) {
+		const void __iomem *reg = priv->reg_base + i;
+		unsigned long pending;
+		unsigned long enabled;
+		unsigned int bit_idx;
+
+		scoped_guard(raw_spinlock, &priv->lock) {
+			pending = ioread8(reg + GPE_STS_REG_OFFSET);
+			enabled = ioread8(reg + GPE_EN_REG_OFFSET(block_size));
+		}
+		pending &= enabled;
+
+		for_each_set_bit(bit_idx, &pending, BITS_PER_BYTE) {
+			unsigned int hwirq = i * BITS_PER_BYTE + bit_idx;
+
+			generic_handle_domain_irq(priv->gc.irq.domain, hwirq);
+		}
+
+		handled += pending ? 1 : 0;
+	}
+
+	return IRQ_RETVAL(handled);
+}
+
+/* UUID for GPE device _DSM: 079406e6-bdea-49cf-8563-03e2811901cb */
+static const guid_t nvl_gpe_dsm_guid =
+	GUID_INIT(0x079406e6, 0xbdea, 0x49cf,
+		  0x85, 0x63, 0x03, 0xe2, 0x81, 0x19, 0x01, 0xcb);
+
+#define DSM_GPE_MODE_REV	1
+#define DSM_GPE_MODE_FN_INDEX	1
+#define DSM_ENABLE_GPE_MODE	1
+
+static int nvl_acpi_enable_gpe_mode(struct device *dev)
+{
+	union acpi_object argv4[2];
+	union acpi_object *obj;
+
+	argv4[0].type = ACPI_TYPE_PACKAGE;
+	argv4[0].package.count = 1;
+	argv4[0].package.elements = &argv4[1];
+	argv4[1].integer.type = ACPI_TYPE_INTEGER;
+	argv4[1].integer.value = DSM_ENABLE_GPE_MODE;
+
+	obj = acpi_evaluate_dsm_typed(ACPI_HANDLE(dev), &nvl_gpe_dsm_guid,
+				      DSM_GPE_MODE_REV, DSM_GPE_MODE_FN_INDEX,
+				      argv4, ACPI_TYPE_BUFFER);
+	if (!obj)
+		return -EIO;
+	ACPI_FREE(obj);
+
+	return 0;
+}
+
+static int nvl_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	resource_size_t ioresource_size;
+	struct gpio_irq_chip *girq;
+	struct nvl_gpio *priv;
+	struct resource *res;
+	void __iomem *regs;
+	int ret, irq;
+
+	res = platform_get_resource(pdev, IORESOURCE_IO, 0);
+	if (!res)
+		return -ENXIO;
+
+	/*
+	 * GPE block length should be non-negative multiple of two and allow up
+	 * to 128 pins. ACPI v6.6 section 5.2.9 and 5.6.4.
+	 */
+	ioresource_size = resource_size(res);
+	if (!ioresource_size || ioresource_size % 2 || ioresource_size > 0x20)
+		return dev_err_probe(dev, -EINVAL,
+				     "invalid GPE block length, resource: %pR\n",
+				     res);
+
+	regs = devm_ioport_map(dev, res->start, ioresource_size);
+	if (!regs)
+		return -ENOMEM;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+	raw_spin_lock_init(&priv->lock);
+
+	priv->reg_base = regs;
+	priv->blk_size = ioresource_size;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0)
+		return irq;
+
+	ret = devm_request_irq(dev, irq, nvl_gpio_irq, IRQF_SHARED, dev_name(dev), priv);
+	if (ret)
+		return ret;
+
+	priv->gc	= nvl_gpio_chip;
+	priv->gc.label	= dev_name(dev);
+	priv->gc.parent	= dev;
+	priv->gc.ngpio	= GPE_REG_PIN_COUNT(priv->blk_size);
+	priv->gc.base	= -1;
+
+	girq = &priv->gc.irq;
+	gpio_irq_chip_set_chip(girq, &nvl_gpio_irq_chip);
+	girq->parent_handler	= NULL;
+	girq->num_parents	= 0;
+	girq->parents		= NULL;
+	girq->default_type	= IRQ_TYPE_NONE;
+	girq->handler		= handle_bad_irq;
+
+	ret = devm_gpiochip_add_data(dev, &priv->gc, priv);
+	if (ret)
+		return ret;
+
+	return nvl_acpi_enable_gpe_mode(dev);
+}
+
+static const struct acpi_device_id nvl_gpio_acpi_match[] = {
+	{ "INTC1114" },
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, nvl_gpio_acpi_match);
+
+static struct platform_driver nvl_gpio_driver = {
+	.driver = {
+		.name		  = "gpio-novalake-events",
+		.acpi_match_table = nvl_gpio_acpi_match,
+	},
+	.probe = nvl_gpio_probe,
+};
+module_platform_driver(nvl_gpio_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>");
+MODULE_DESCRIPTION("Intel Nova Lake ACPI GPIO events driver");
-- 
2.43.0


