Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7BA5B567028
	for <lists+linux-gpio@lfdr.de>; Tue,  5 Jul 2022 16:03:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbiGEODA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 5 Jul 2022 10:03:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233190AbiGEOCk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 5 Jul 2022 10:02:40 -0400
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.153.233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB78721833
        for <linux-gpio@vger.kernel.org>; Tue,  5 Jul 2022 06:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657028964; x=1688564964;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Fy2Oh61932xq3ssh1f8Qkf7jJLRc/My4BkYzus0LA5w=;
  b=NotpAes84Jz8g71ZhsOdO8fUnzYMOpPtMANUYNpQ/VsDQCHwL1itp0j4
   bskt+7uR5+PMCnp5lR6/olw3O3s6OrW6QAXIAAoleFaNFhLwFPlYyWF5i
   L0NvRoa05xi51+vByTwd/LzLdJqQ+xtugOfNdP2QeTDNDmIL8wfghbgm1
   3VDzklFXHTVfhWyQ3wFU4go5a/ziHuJxNlPaxrH0sQnIgK7Z3rfsKPyIh
   eQnKON+scWyaGQVkMktsopUfwV/UYcfJLoogRBkshF5S3afW739PCFk5S
   3oF1IJrZ+RgzigW0BLaTKqf3YltnDK/N6sGHkokO7Xw/aPiLwsKxV+hZT
   Q==;
X-IronPort-AV: E=Sophos;i="5.92,247,1650956400"; 
   d="scan'208";a="171090757"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Jul 2022 06:49:23 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 5 Jul 2022 06:49:23 -0700
Received: from dev-powerhorse.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Tue, 5 Jul 2022 06:49:21 -0700
From:   <lewis.hanly@microchip.com>
To:     <linux-gpio@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <palmer@dabbelt.com>, <maz@kernel.org>
CC:     <paul.walmsley@sifive.com>, <conor.dooley@microchip.com>,
        <daire.mcnamara@microchip.com>, <lewis.hanly@microchip.com>
Subject: [PATCH 1/1] gpio: mpfs - add polarfire soc gpio support
Date:   Tue, 5 Jul 2022 14:49:12 +0100
Message-ID: <20220705134912.2740421-2-lewis.hanly@microchip.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220705134912.2740421-1-lewis.hanly@microchip.com>
References: <20220705134912.2740421-1-lewis.hanly@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Lewis Hanly <lewis.hanly@microchip.com>

Add a driver to support the Polarfire SoC gpio controller.

Signed-off-by: Lewis Hanly <lewis.hanly@microchip.com>
---
 drivers/gpio/Kconfig     |   7 +
 drivers/gpio/Makefile    |   1 +
 drivers/gpio/gpio-mpfs.c | 358 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 366 insertions(+)
 create mode 100644 drivers/gpio/gpio-mpfs.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index b01961999ced..e279eac198da 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -490,6 +490,13 @@ config GPIO_PMIC_EIC_SPRD
 	help
 	  Say yes here to support Spreadtrum PMIC EIC device.
 
+config GPIO_POLARFIRE_SOC
+	bool "Microchip FPGA GPIO support"
+	depends on OF_GPIO
+	select GPIOLIB_IRQCHIP
+	help
+	  Say yes here to support the GPIO device on Microchip FPGAs
+
 config GPIO_PXA
 	bool "PXA GPIO support"
 	depends on ARCH_PXA || ARCH_MMP || COMPILE_TEST
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 14352f6dfe8e..3b8b6703e593 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -119,6 +119,7 @@ obj-$(CONFIG_GPIO_PCI_IDIO_16)		+= gpio-pci-idio-16.o
 obj-$(CONFIG_GPIO_PISOSR)		+= gpio-pisosr.o
 obj-$(CONFIG_GPIO_PL061)		+= gpio-pl061.o
 obj-$(CONFIG_GPIO_PMIC_EIC_SPRD)	+= gpio-pmic-eic-sprd.o
+obj-$(CONFIG_GPIO_POLARFIRE_SOC)	+= gpio-mpfs.o
 obj-$(CONFIG_GPIO_PXA)			+= gpio-pxa.o
 obj-$(CONFIG_GPIO_RASPBERRYPI_EXP)	+= gpio-raspberrypi-exp.o
 obj-$(CONFIG_GPIO_RC5T583)		+= gpio-rc5t583.o
diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
new file mode 100644
index 000000000000..df48f2836e97
--- /dev/null
+++ b/drivers/gpio/gpio-mpfs.c
@@ -0,0 +1,358 @@
+// SPDX-License-Identifier: (GPL-2.0)
+/*
+ * Microchip PolarFire SoC (MPFS) GPIO controller driver
+ *
+ * Copyright (c) 2018-2022 Microchip Technology Inc. and its subsidiaries
+ *
+ * Author: Lewis Hanly <lewis.hanly@microchip.com>
+ *
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
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+
+#define NUM_GPIO			32
+#define BYTE_BOUNDARY			0x04
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
+	spinlock_t lock; /* lock */
+	struct gpio_chip gc;
+};
+
+static void mpfs_gpio_assign_bit(void __iomem *addr, unsigned int bit_offset, int value)
+{
+	u32 output = readl(addr);
+
+	if (value)
+		output |= BIT(bit_offset);
+	else
+		output &= ~BIT(bit_offset);
+
+	writel(output, addr);
+}
+
+static int mpfs_gpio_direction_input(struct gpio_chip *gc, unsigned int gpio_index)
+{
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	u32 gpio_cfg;
+	unsigned long flags;
+
+	if (gpio_index >= NUM_GPIO)
+		return -EINVAL;
+
+	spin_lock_irqsave(&mpfs_gpio->lock, flags);
+
+	gpio_cfg = readl(mpfs_gpio->base + (gpio_index * BYTE_BOUNDARY));
+	gpio_cfg |= MPFS_GPIO_EN_IN;
+	gpio_cfg &= ~(MPFS_GPIO_EN_OUT | MPFS_GPIO_EN_OUT_BUF);
+	writel(gpio_cfg, mpfs_gpio->base + (gpio_index * BYTE_BOUNDARY));
+
+	spin_unlock_irqrestore(&mpfs_gpio->lock, flags);
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
+	if (gpio_index >= NUM_GPIO)
+		return -EINVAL;
+
+	spin_lock_irqsave(&mpfs_gpio->lock, flags);
+
+	gpio_cfg = readl(mpfs_gpio->base + (gpio_index * BYTE_BOUNDARY));
+	gpio_cfg |= MPFS_GPIO_EN_OUT | MPFS_GPIO_EN_OUT_BUF;
+	gpio_cfg &= ~MPFS_GPIO_EN_IN;
+	writel(gpio_cfg, mpfs_gpio->base + (gpio_index * BYTE_BOUNDARY));
+
+	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_OUTP_REG, gpio_index, value);
+
+	spin_unlock_irqrestore(&mpfs_gpio->lock, flags);
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
+	if (gpio_index >= NUM_GPIO)
+		return -EINVAL;
+
+	gpio_cfg = readl(mpfs_gpio->base + (gpio_index * BYTE_BOUNDARY));
+
+	if (gpio_cfg & MPFS_GPIO_EN_IN)
+		return 1;
+
+	return 0;
+}
+
+static int mpfs_gpio_get(struct gpio_chip *gc,
+			 unsigned int gpio_index)
+{
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+
+	if (gpio_index >= NUM_GPIO)
+		return -EINVAL;
+
+	return !!(readl(mpfs_gpio->base + MPFS_INP_REG) & BIT(gpio_index));
+}
+
+static void mpfs_gpio_set(struct gpio_chip *gc, unsigned int gpio_index, int value)
+{
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	unsigned long flags;
+
+	if (gpio_index >= NUM_GPIO)
+		return;
+
+	spin_lock_irqsave(&mpfs_gpio->lock, flags);
+
+	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_OUTP_REG,
+			     gpio_index, value);
+
+	spin_unlock_irqrestore(&mpfs_gpio->lock, flags);
+}
+
+static int mpfs_gpio_irq_set_type(struct irq_data *data, unsigned int type)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	int gpio_index = irqd_to_hwirq(data);
+	u32 interrupt_type;
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	u32 gpio_cfg;
+	unsigned long flags;
+
+	if (gpio_index >= NUM_GPIO)
+		return -EINVAL;
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_BOTH:
+		interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_BOTH;
+		break;
+
+	case IRQ_TYPE_EDGE_FALLING:
+		interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_NEG;
+		break;
+
+	case IRQ_TYPE_EDGE_RISING:
+		interrupt_type = MPFS_GPIO_TYPE_INT_EDGE_POS;
+		break;
+
+	case IRQ_TYPE_LEVEL_HIGH:
+		interrupt_type = MPFS_GPIO_TYPE_INT_LEVEL_HIGH;
+		break;
+
+	case IRQ_TYPE_LEVEL_LOW:
+	default:
+		interrupt_type = MPFS_GPIO_TYPE_INT_LEVEL_LOW;
+		break;
+	}
+
+	spin_lock_irqsave(&mpfs_gpio->lock, flags);
+
+	gpio_cfg = readl(mpfs_gpio->base + (gpio_index * BYTE_BOUNDARY));
+	gpio_cfg &= ~MPFS_GPIO_TYPE_INT_MASK;
+	gpio_cfg |= interrupt_type;
+	writel(gpio_cfg, mpfs_gpio->base + (gpio_index * BYTE_BOUNDARY));
+
+	spin_unlock_irqrestore(&mpfs_gpio->lock, flags);
+
+	return 0;
+}
+
+static void mpfs_gpio_irq_enable(struct irq_data *data)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	int gpio_index = irqd_to_hwirq(data) % NUM_GPIO;
+
+	mpfs_gpio_direction_input(gc, gpio_index);
+	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, gpio_index, 1);
+	mpfs_gpio_assign_bit(mpfs_gpio->base + (gpio_index * BYTE_BOUNDARY),
+			     MPFS_GPIO_EN_INT, 1);
+}
+
+static void mpfs_gpio_irq_disable(struct irq_data *data)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
+	int gpio_index = irqd_to_hwirq(data) % NUM_GPIO;
+
+	mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, gpio_index, 1);
+	mpfs_gpio_assign_bit(mpfs_gpio->base + (gpio_index * BYTE_BOUNDARY),
+			     MPFS_GPIO_EN_INT, 0);
+}
+
+static struct irq_chip mpfs_gpio_irqchip = {
+	.name = "mpfs_gpio_irqchip",
+	.irq_set_type = mpfs_gpio_irq_set_type,
+	.irq_enable = mpfs_gpio_irq_enable,
+	.irq_disable = mpfs_gpio_irq_disable,
+	.flags = IRQCHIP_MASK_ON_SUSPEND,
+};
+
+static irqreturn_t mpfs_gpio_irq_handler(int irq, void *mpfs_gpio_data)
+{
+	struct mpfs_gpio_chip *mpfs_gpio = mpfs_gpio_data;
+	unsigned long status;
+	int offset;
+
+	status = readl(mpfs_gpio->base + MPFS_IRQ_REG);
+
+	for_each_set_bit(offset, &status, mpfs_gpio->gc.ngpio) {
+		mpfs_gpio_assign_bit(mpfs_gpio->base + MPFS_IRQ_REG, offset, 1);
+		generic_handle_irq(irq_find_mapping(mpfs_gpio->gc.irq.domain, offset));
+	}
+	return IRQ_HANDLED;
+}
+
+static int mpfs_gpio_probe(struct platform_device *pdev)
+{
+	struct clk *clk;
+	struct device *dev = &pdev->dev;
+	struct device_node *node = pdev->dev.of_node;
+	struct mpfs_gpio_chip *mpfs_gpio;
+	int i, ret, ngpio;
+	struct gpio_irq_chip *irq_c;
+
+	mpfs_gpio = devm_kzalloc(dev, sizeof(*mpfs_gpio), GFP_KERNEL);
+	if (!mpfs_gpio)
+		return -ENOMEM;
+
+	mpfs_gpio->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(mpfs_gpio->base)) {
+		dev_err(dev, "failed to allocate device memory\n");
+		return PTR_ERR(mpfs_gpio->base);
+	}
+	clk = devm_clk_get(&pdev->dev, NULL);
+	if (IS_ERR(clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk), "failed to get clock\n");
+
+	ret = clk_prepare_enable(clk);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret, "failed to enable clock\n");
+
+	mpfs_gpio->clk = clk;
+
+	spin_lock_init(&mpfs_gpio->lock);
+
+	ngpio = of_irq_count(node);
+	if (ngpio > NUM_GPIO) {
+		dev_err(dev, "too many interrupts\n");
+		goto cleanup_clock;
+	}
+
+	mpfs_gpio->gc.direction_input = mpfs_gpio_direction_input;
+	mpfs_gpio->gc.direction_output = mpfs_gpio_direction_output;
+	mpfs_gpio->gc.get_direction = mpfs_gpio_get_direction;
+	mpfs_gpio->gc.get = mpfs_gpio_get;
+	mpfs_gpio->gc.set = mpfs_gpio_set;
+	mpfs_gpio->gc.base = -1;
+	mpfs_gpio->gc.ngpio = ngpio;
+	mpfs_gpio->gc.label = dev_name(dev);
+	mpfs_gpio->gc.parent = dev;
+	mpfs_gpio->gc.owner = THIS_MODULE;
+
+	irq_c = &mpfs_gpio->gc.irq;
+	irq_c->chip = &mpfs_gpio_irqchip;
+	irq_c->chip->parent_device = dev;
+	irq_c->handler = handle_simple_irq;
+
+	ret = devm_irq_alloc_descs(&pdev->dev, -1, 0, ngpio, 0);
+	if (ret < 0) {
+		dev_err(dev, "failed to allocate descs\n");
+		goto cleanup_clock;
+	}
+
+	/*
+	 * Setup the interrupt handlers. Interrupts can be
+	 * direct and/or non-direct mode, based on register value:
+	 * GPIO_INTERRUPT_FAB_CR.
+	 */
+	for (i = 0; i < ngpio; i++) {
+		int irq = platform_get_irq_optional(pdev, i);
+
+		if (irq < 0)
+			continue;
+
+		ret = devm_request_irq(&pdev->dev, irq,
+				       mpfs_gpio_irq_handler,
+				       IRQF_SHARED, mpfs_gpio->gc.label, mpfs_gpio);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to request irq %d: %d\n",
+				irq, ret);
+			goto cleanup_clock;
+		}
+	}
+
+	ret = gpiochip_add_data(&mpfs_gpio->gc, mpfs_gpio);
+	if (ret)
+		goto cleanup_clock;
+
+	platform_set_drvdata(pdev, mpfs_gpio);
+	dev_info(dev, "Microchip MPFS GPIO registered %d GPIOs\n", ngpio);
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
+static const struct of_device_id mpfs_gpio_match[] = {
+	{ .compatible = "microchip,mpfs-gpio", },
+	{ /* end of list */ },
+};
+
+static struct platform_driver mpfs_gpio_driver = {
+	.probe = mpfs_gpio_probe,
+	.driver = {
+		.name = "microchip,mpfs-gpio",
+		.of_match_table = of_match_ptr(mpfs_gpio_match),
+	},
+	.remove = mpfs_gpio_remove,
+};
+
+builtin_platform_driver(mpfs_gpio_driver);
-- 
2.25.1

