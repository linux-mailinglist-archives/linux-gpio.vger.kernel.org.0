Return-Path: <linux-gpio+bounces-8356-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 656A6939FCF
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2024 13:28:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7262B220CB
	for <lists+linux-gpio@lfdr.de>; Tue, 23 Jul 2024 11:28:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA49D1509A1;
	Tue, 23 Jul 2024 11:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="1RcWvmNp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778A78287A;
	Tue, 23 Jul 2024 11:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.153.233
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721734107; cv=none; b=s8dzDfkoJoU997SxbEfJxUsp2jNy6N7KYS1hpOXB/QhTVZcRAVyhsU3eJpJbCZs0neOdIs9Rd4sfgwmXb67g5iqu/ZB90LjGtXbD6fNSD+1c/rTAsS96yEP9O3iFujnx3/WrJUGDR3YrsWwa7KuqPkBwGD3ZQ8nIjmfGQIRmhfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721734107; c=relaxed/simple;
	bh=mwLzMK344LrlkXY++0l/Gj9MNq2rK0oWALq4fCAT0Wc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lxgMFdCB0BpHjsc0zyhiZSd0kA+KbMPnlS5rXhiubnZbzAu3hBrOGBOqHE737DEZJa0okvFL2xPclXvTrKb8KsL2KfoS/QGyzUkJfAd+D60iJ7nj7QmR4dM+o5EmmjQybKZ1+RljwKHkerRg2bXJqW0OQCBe4fgX0BRDQ3NCeic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=1RcWvmNp; arc=none smtp.client-ip=68.232.153.233
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721734106; x=1753270106;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mwLzMK344LrlkXY++0l/Gj9MNq2rK0oWALq4fCAT0Wc=;
  b=1RcWvmNpazGxIZwmD3nsCzfiGaRvaYmTzmsBajZy0NfLhZI5L9/dOAda
   I/c9BQk9/XhQVY9fl/KiUU1YgsQP/fKvVBDsOwCWz7wiJe6CSZvr0l7LI
   sHmWE7wyLUVbptakMQ/81agyPzqmRQqeWzkxoJY8A8jWMz5ujhMbOcXaM
   5IKjH8wStt3zJfLgBYWnFVzLQ6oPtv7hrL3Ln8LQxz/RVHqMNZ+9aDSLN
   MOM8Sn7tX7eNZJRWbWUEVYwcka9tQRwnqie9RxIehgXkkfeVKVAVfTHNa
   avfUG3mnXIYckC4kPhcgyRBSK54jtswucj9y9XysXNdRoLShqPN+h0GJU
   A==;
X-CSE-ConnectionGUID: Bzp89j1bQnG7Qha2jIBWKQ==
X-CSE-MsgGUID: 9Xz4Jg1zS/eGyBpnXKYMhQ==
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="260469138"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 23 Jul 2024 04:28:19 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jul 2024 04:28:16 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Tue, 23 Jul 2024 04:28:14 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-kernel@vger.kernel.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Marc Zyngier
	<maz@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, "Linus
 Walleij" <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
	"Rob Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"Thomas Gleixner" <tglx@linutronix.de>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	<linux-riscv@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, Lewis Hanly <lewis.hanly@microchip.com>
Subject: [RFC v7 4/6] gpio: mpfs: add polarfire soc gpio support
Date: Tue, 23 Jul 2024 12:27:13 +0100
Message-ID: <20240723-underage-wheat-7dd65c2158e7@wendy>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240723-supervise-drown-d5d3b303e7fd@wendy>
References: <20240723-supervise-drown-d5d3b303e7fd@wendy>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11480; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=oRvlKxILF3owTWo7rBvagSB5lR8hjMzfhJvA3BN3F3o=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGnzJ09odPZe6X9rlmqfj8APvQbZhn2Fz1ZPF429MLFs7bnr u4OiO0pZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRB22MDG33FgjbiGk8k56vsGrNJp Y/6QFvzk2cmZrM8y450liDKZ7hv6caf391p3jw85Mfd3G6BllcWxDdraKxv0EvJaBT6NcJNgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Lewis Hanly <lewis.hanly@microchip.com>

Add a driver to support the Polarfire SoC gpio controller

Signed-off-by: Lewis Hanly <lewis.hanly@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Unchanged from last list submission, I'm looking for comments on the
other patches in the series at the moment.
---
 drivers/gpio/Kconfig     |   7 +
 drivers/gpio/Makefile    |   1 +
 drivers/gpio/gpio-mpfs.c | 320 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 328 insertions(+)
 create mode 100644 drivers/gpio/gpio-mpfs.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 3dbddec070281..78fe494e3722c 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -549,6 +549,13 @@ config GPIO_PL061
 	help
 	  Say yes here to support the PrimeCell PL061 GPIO device.
 
+config GPIO_POLARFIRE_SOC
+	bool "Microchip FPGA GPIO support"
+	depends on OF_GPIO
+	select GPIOLIB_IRQCHIP
+	help
+	  Say yes here to support the GPIO device on Microchip FPGAs.
+
 config GPIO_PXA
 	bool "PXA GPIO support"
 	depends on ARCH_PXA || ARCH_MMP || COMPILE_TEST
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index e2a53013780e5..dd6ba21bce76e 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -132,6 +132,7 @@ obj-$(CONFIG_GPIO_PCI_IDIO_16)		+= gpio-pci-idio-16.o
 obj-$(CONFIG_GPIO_PISOSR)		+= gpio-pisosr.o
 obj-$(CONFIG_GPIO_PL061)		+= gpio-pl061.o
 obj-$(CONFIG_GPIO_PMIC_EIC_SPRD)	+= gpio-pmic-eic-sprd.o
+obj-$(CONFIG_GPIO_POLARFIRE_SOC)	+= gpio-mpfs.o
 obj-$(CONFIG_GPIO_PXA)			+= gpio-pxa.o
 obj-$(CONFIG_GPIO_RASPBERRYPI_EXP)	+= gpio-raspberrypi-exp.o
 obj-$(CONFIG_GPIO_RC5T583)		+= gpio-rc5t583.o
diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
new file mode 100644
index 0000000000000..1ac0526ba1029
--- /dev/null
+++ b/drivers/gpio/gpio-mpfs.c
@@ -0,0 +1,320 @@
+// SPDX-License-Identifier: (GPL-2.0)
+/*
+ * Microchip PolarFire SoC (MPFS) GPIO controller driver
+ *
+ * Copyright (c) 2018-2022 Microchip Technology Inc. and its subsidiaries
+ *
+ * Author: Lewis Hanly <lewis.hanly@microchip.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/gpio/driver.h>
+#include <linux/init.h>
+#include <linux/irq.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+
+#define MPFS_GPIO_CTRL(i)		(0x4 * (i))
+#define MAX_NUM_GPIO			32
+#define MPFS_GPIO_EN_INT		3
+#define MPFS_GPIO_EN_OUT_BUF		BIT(2)
+#define MPFS_GPIO_EN_IN			BIT(1)
+#define MPFS_GPIO_EN_OUT		BIT(0)
+
+#define MPFS_GPIO_TYPE_INT_EDGE_BOTH	0x80
+#define MPFS_GPIO_TYPE_INT_EDGE_NEG	0x60
+#define MPFS_GPIO_TYPE_INT_EDGE_POS	0x40
+#define MPFS_GPIO_TYPE_INT_LEVEL_LOW	0x20
+#define MPFS_GPIO_TYPE_INT_LEVEL_HIGH	0x00
+#define MPFS_GPIO_TYPE_INT_MASK		GENMASK(7, 5)
+#define MPFS_IRQ_REG			0x80
+#define MPFS_INP_REG			0x84
+#define MPFS_OUTP_REG			0x88
+
+struct mpfs_gpio_chip {
+	void __iomem *base;
+	struct clk *clk;
+	raw_spinlock_t	lock;
+	struct gpio_chip gc;
+};
+
+static void mpfs_gpio_assign_bit(void __iomem *addr, unsigned int bit_offset, bool value)
+{
+	unsigned long reg = readl(addr);
+
+	__assign_bit(bit_offset, &reg, value);
+	writel(reg, addr);
+}
+
+static int mpfs_gpio_direction_input(struct gpio_chip *gc, unsigned int gpio_index)
+{
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	u32 gpio_cfg;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&mpfs_gpio->lock, flags);
+
+	gpio_cfg = readl(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index));
+	gpio_cfg |= MPFS_GPIO_EN_IN;
+	gpio_cfg &= ~(MPFS_GPIO_EN_OUT | MPFS_GPIO_EN_OUT_BUF);
+	writel(gpio_cfg, mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index));
+
+	raw_spin_unlock_irqrestore(&mpfs_gpio->lock, flags);
+
+	return 0;
+}
+
+static int mpfs_gpio_direction_output(struct gpio_chip *gc, unsigned int gpio_index, int value)
+{
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	u32 gpio_cfg;
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&mpfs_gpio->lock, flags);
+
+	gpio_cfg = readl(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index));
+	gpio_cfg |= MPFS_GPIO_EN_OUT | MPFS_GPIO_EN_OUT_BUF;
+	gpio_cfg &= ~MPFS_GPIO_EN_IN;
+	writel(gpio_cfg, mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index));
+
+	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_OUTP_REG, gpio_index, value);
+
+	raw_spin_unlock_irqrestore(&mpfs_gpio->lock, flags);
+
+	return 0;
+}
+
+static int mpfs_gpio_get_direction(struct gpio_chip *gc,
+				   unsigned int gpio_index)
+{
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	u32 gpio_cfg;
+
+	gpio_cfg = readl(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index));
+	if (gpio_cfg & MPFS_GPIO_EN_IN)
+		return GPIO_LINE_DIRECTION_IN;
+
+	return GPIO_LINE_DIRECTION_OUT;
+}
+
+static int mpfs_gpio_get(struct gpio_chip *gc,
+			 unsigned int gpio_index)
+{
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+
+	return !!(readl(mpfs_gpio->base + MPFS_INP_REG) & BIT(gpio_index));
+}
+
+static void mpfs_gpio_set(struct gpio_chip *gc, unsigned int gpio_index, int value)
+{
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	unsigned long flags;
+
+	raw_spin_lock_irqsave(&mpfs_gpio->lock, flags);
+
+	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_OUTP_REG,
+			     gpio_index, value);
+
+	raw_spin_unlock_irqrestore(&mpfs_gpio->lock, flags);
+}
+
+static int mpfs_gpio_irq_set_type(struct irq_data *data, unsigned int type)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	int gpio_index = irqd_to_hwirq(data);
+	u32 interrupt_type;
+	u32 gpio_cfg;
+	unsigned long flags;
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_BOTH:
+		interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_BOTH;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_NEG;
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+		interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_POS;
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		interrupt_type = MPFS_GPIO_TYPE_INT_LEVEL_HIGH;
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		interrupt_type = MPFS_GPIO_TYPE_INT_LEVEL_LOW;
+		break;
+	}
+
+	raw_spin_lock_irqsave(&mpfs_gpio->lock, flags);
+
+	gpio_cfg = readl(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index));
+	gpio_cfg &= ~MPFS_GPIO_TYPE_INT_MASK;
+	gpio_cfg |= interrupt_type;
+	writel(gpio_cfg, mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index));
+
+	raw_spin_unlock_irqrestore(&mpfs_gpio->lock, flags);
+
+	return 0;
+}
+
+static void mpfs_gpio_irq_unmask(struct irq_data *data)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	int gpio_index = irqd_to_hwirq(data);
+
+	gpiochip_enable_irq(gc, gpio_index);
+	mpfs_gpio_direction_input(gc, gpio_index);
+	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, gpio_index, 1);
+	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index),
+			     MPFS_GPIO_EN_INT, 1);
+}
+
+static void mpfs_gpio_irq_mask(struct irq_data *data)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	int gpio_index = irqd_to_hwirq(data);
+
+	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, gpio_index, 1);
+	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_GPIO_CTRL(gpio_index),
+			     MPFS_GPIO_EN_INT, 0);
+	gpiochip_disable_irq(gc, gpio_index);
+}
+
+static const struct irq_chip mpfs_gpio_irqchip = {
+	.name = "mpfs",
+	.irq_set_type = mpfs_gpio_irq_set_type,
+	.irq_mask	= mpfs_gpio_irq_mask,
+	.irq_unmask	= mpfs_gpio_irq_unmask,
+	.flags = IRQCHIP_IMMUTABLE | IRQCHIP_MASK_ON_SUSPEND,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static void mpfs_gpio_irq_handler(struct irq_desc *desc)
+{
+	struct irq_chip *irqchip = irq_desc_get_chip(desc);
+	struct mpfs_gpio_chip *mpfs_gpio =
+		gpiochip_get_data(irq_desc_get_handler_data(desc));
+	unsigned long status;
+	int offset;
+
+	chained_irq_enter(irqchip, desc);
+
+	status = readl(mpfs_gpio->base + MPFS_IRQ_REG);
+	for_each_set_bit(offset, &status, mpfs_gpio->gc.ngpio) {
+		mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, offset, 1);
+		generic_handle_irq(irq_find_mapping(mpfs_gpio->gc.irq.domain, offset));
+	}
+
+	chained_irq_exit(irqchip, desc);
+}
+
+static int mpfs_gpio_probe(struct platform_device *pdev)
+{
+	struct clk *clk;
+	struct device *dev = &pdev->dev;
+	struct device_node *node = pdev->dev.of_node;
+	struct mpfs_gpio_chip *mpfs_gpio;
+	struct gpio_irq_chip *girq;
+	int i, ret, ngpios, nirqs;
+
+	mpfs_gpio = devm_kzalloc(dev, sizeof(*mpfs_gpio), GFP_KERNEL);
+	if (!mpfs_gpio)
+		return -ENOMEM;
+
+	mpfs_gpio->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(mpfs_gpio->base))
+		return dev_err_probe(dev, PTR_ERR(mpfs_gpio->base), "failed to ioremap memory resource\n");
+
+	clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(dev, PTR_ERR(clk), "devm_clk_get failed\n");
+
+	ret = clk_prepare_enable(clk);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to enable clock\n");
+
+	mpfs_gpio->clk = clk;
+
+	ngpios = MAX_NUM_GPIO;
+	device_property_read_u32(dev, "ngpios", &ngpios);
+	if (ngpios > MAX_NUM_GPIO)
+		ngpios = MAX_NUM_GPIO;
+
+	raw_spin_lock_init(&mpfs_gpio->lock);
+	mpfs_gpio->gc.direction_input = mpfs_gpio_direction_input;
+	mpfs_gpio->gc.direction_output = mpfs_gpio_direction_output;
+	mpfs_gpio->gc.get_direction = mpfs_gpio_get_direction;
+	mpfs_gpio->gc.get = mpfs_gpio_get;
+	mpfs_gpio->gc.set = mpfs_gpio_set;
+	mpfs_gpio->gc.base = -1;
+	mpfs_gpio->gc.ngpio = ngpios;
+	mpfs_gpio->gc.label = dev_name(dev);
+	mpfs_gpio->gc.parent = dev;
+	mpfs_gpio->gc.owner = THIS_MODULE;
+
+	nirqs = of_irq_count(node);
+	if (nirqs > MAX_NUM_GPIO) {
+		ret = -ENXIO;
+		goto cleanup_clock;
+	}
+	girq = &mpfs_gpio->gc.irq;
+	gpio_irq_chip_set_chip(girq, &mpfs_gpio_irqchip);
+	girq->handler = handle_simple_irq;
+	girq->parent_handler = mpfs_gpio_irq_handler;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->num_parents = nirqs;
+	girq->parents = devm_kcalloc(&pdev->dev, nirqs,
+				     sizeof(*girq->parents), GFP_KERNEL);
+	if (!girq->parents) {
+		ret = -ENOMEM;
+		goto cleanup_clock;
+	}
+	for (i = 0; i < nirqs; i++)
+		girq->parents[i] = platform_get_irq(pdev, i);
+
+	ret = gpiochip_add_data(&mpfs_gpio->gc, mpfs_gpio);
+	if (ret)
+		goto cleanup_clock;
+
+	platform_set_drvdata(pdev, mpfs_gpio);
+
+	return 0;
+
+cleanup_clock:
+	clk_disable_unprepare(mpfs_gpio->clk);
+	return ret;
+}
+
+static int mpfs_gpio_remove(struct platform_device *pdev)
+{
+	struct mpfs_gpio_chip *mpfs_gpio = platform_get_drvdata(pdev);
+
+	gpiochip_remove(&mpfs_gpio->gc);
+	clk_disable_unprepare(mpfs_gpio->clk);
+
+	return 0;
+}
+
+static const struct of_device_id mpfs_gpio_of_ids[] = {
+	{ .compatible = "microchip,mpfs-gpio", },
+	{ /* end of list */ }
+};
+
+static struct platform_driver mpfs_gpio_driver = {
+	.probe = mpfs_gpio_probe,
+	.driver = {
+		.name = "microchip,mpfs-gpio",
+		.of_match_table = mpfs_gpio_of_ids,
+	},
+	.remove = mpfs_gpio_remove,
+};
+builtin_platform_driver(mpfs_gpio_driver);
-- 
2.43.2


