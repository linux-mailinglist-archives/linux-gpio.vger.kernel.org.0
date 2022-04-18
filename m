Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D90E505AE3
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Apr 2022 17:20:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230144AbiDRPWw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Apr 2022 11:22:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345498AbiDRPWj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Apr 2022 11:22:39 -0400
X-Greylist: delayed 401 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 18 Apr 2022 07:21:08 PDT
Received: from mellanox.co.il (mail-il-dmz.mellanox.com [193.47.165.129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8D5B63BBF2
        for <linux-gpio@vger.kernel.org>; Mon, 18 Apr 2022 07:21:08 -0700 (PDT)
Received: from Internal Mail-Server by MTLPINE1 (envelope-from asmaa@mellanox.com)
        with SMTP; 18 Apr 2022 17:14:22 +0300
Received: from farm-0002.mtbu.labs.mlnx (farm-0002.mtbu.labs.mlnx [10.15.2.32])
        by mtbu-labmailer.labs.mlnx (8.14.4/8.14.4) with ESMTP id 23IEELlF026599;
        Mon, 18 Apr 2022 10:14:21 -0400
Received: (from asmaa@localhost)
        by farm-0002.mtbu.labs.mlnx (8.14.7/8.13.8/Submit) id 23IEEK63027577;
        Mon, 18 Apr 2022 10:14:20 -0400
From:   Asmaa Mnebhi <asmaa@nvidia.com>
To:     andy.shevchenko@gmail.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, linux-gpio@vger.kernel.org,
        linux-acpi@vger.kernel.org
Cc:     Asmaa Mnebhi <asmaa@nvidia.com>
Subject: [PATCH v1 1/1] Add driver for Mellanox BlueField-3 GPIO controller
Date:   Mon, 18 Apr 2022 10:14:16 -0400
Message-Id: <20220418141416.27529-1-asmaa@nvidia.com>
X-Mailer: git-send-email 2.30.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNPARSEABLE_RELAY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This patch adds support for the GPIO controller used by Mellanox BlueField-3 SOCs.
By default (after a reset for example), only the hardware has control over the GPIO values.
The GPIOs need to be configured accordingly for the software to control them.
We don't allow the user to manipulate the GPIO pins unless it is allowed by
the ACPI table property "ctrl_gpio_mask".

Signed-off-by: Asmaa Mnebhi <asmaa@nvidia.com>
---
 drivers/gpio/Kconfig       |   7 +
 drivers/gpio/Makefile      |   1 +
 drivers/gpio/gpio-mlxbf3.c | 337 +++++++++++++++++++++++++++++++++++++
 3 files changed, 345 insertions(+)
 create mode 100644 drivers/gpio/gpio-mlxbf3.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 45764ec3b2eb..d470117e7254 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1530,6 +1530,13 @@ config GPIO_MLXBF2
 	help
 	  Say Y here if you want GPIO support on Mellanox BlueField 2 SoC.
 
+config GPIO_MLXBF3
+	tristate "Mellanox BlueField 3 SoC GPIO"
+	depends on (MELLANOX_PLATFORM && ARM64 && ACPI) || (64BIT && COMPILE_TEST)
+	select GPIO_GENERIC
+	help
+	  Say Y here if you want GPIO support on Mellanox BlueField 3 SoC.
+
 config GPIO_ML_IOH
 	tristate "OKI SEMICONDUCTOR ML7213 IOH GPIO support"
 	depends on X86 || COMPILE_TEST
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 14352f6dfe8e..eb24e8e4c4e1 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -97,6 +97,7 @@ obj-$(CONFIG_GPIO_MERRIFIELD)		+= gpio-merrifield.o
 obj-$(CONFIG_GPIO_ML_IOH)		+= gpio-ml-ioh.o
 obj-$(CONFIG_GPIO_MLXBF)		+= gpio-mlxbf.o
 obj-$(CONFIG_GPIO_MLXBF2)		+= gpio-mlxbf2.o
+obj-$(CONFIG_GPIO_MLXBF3)		+= gpio-mlxbf3.o
 obj-$(CONFIG_GPIO_MM_LANTIQ)		+= gpio-mm-lantiq.o
 obj-$(CONFIG_GPIO_MOCKUP)		+= gpio-mockup.o
 obj-$(CONFIG_GPIO_MOXTET)		+= gpio-moxtet.o
diff --git a/drivers/gpio/gpio-mlxbf3.c b/drivers/gpio/gpio-mlxbf3.c
new file mode 100644
index 000000000000..1f576de43680
--- /dev/null
+++ b/drivers/gpio/gpio-mlxbf3.c
@@ -0,0 +1,337 @@
+// SPDX-License-Identifier: GPL-2.0-only or BSD-3-Clause
+
+/*
+ * Copyright (C) 2022 NVIDIA CORPORATION & AFFILIATES
+ */
+
+#include <linux/device.h>
+#include <linux/gpio/driver.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/ioport.h>
+#include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/resource.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+/*
+ * There are 2 YU GPIO blocks:
+ * gpio[0]: HOST_GPIO0->HOST_GPIO31
+ * gpio[1]: HOST_GPIO32->HOST_GPIO55
+ */
+#define MLXBF3_GPIO_MAX_PINS_PER_BLOCK 32
+
+/*
+ * fw_gpio[x] block registers and their offset
+ */
+#define YU_GPIO_FW_CONTROL_SET		0x00
+#define YU_GPIO_FW_OUTPUT_ENABLE_SET	0x04
+#define YU_GPIO_FW_DATA_OUT_SET		0x08
+#define YU_GPIO_FW_CONTROL_CLEAR	0x14
+#define YU_GPIO_FW_OUTPUT_ENABLE_CLEAR	0x18
+#define YU_GPIO_FW_DATA_OUT_CLEAR	0x1c
+#define YU_GPIO_CAUSE_RISE_EN		0x28
+#define YU_GPIO_CAUSE_FALL_EN		0x2c
+#define YU_GPIO_READ_DATA_IN		0x30
+#define YU_GPIO_READ_OUTPUT_ENABLE	0x34
+#define YU_GPIO_READ_DATA_OUT		0x38
+#define YU_GPIO_READ_FW_CONTROL		0x44
+
+#define YU_GPIO_CAUSE_OR_CAUSE_EVTEN0	0x00
+#define YU_GPIO_CAUSE_OR_EVTEN0		0x14
+#define YU_GPIO_CAUSE_OR_CLRCAUSE	0x18
+
+/* BlueField-3 gpio block context structure. */
+struct mlxbf3_gpio_context {
+	struct gpio_chip gc;
+	struct irq_chip irq_chip;
+
+	/* YU GPIO blocks address */
+	void __iomem *gpio_io;
+
+	/* YU GPIO cause block address */
+	void __iomem *gpio_cause_io;
+
+	/* Represents GPIO pins that the user can manipulate */
+	uint32_t ctrl_gpio_mask;
+};
+
+static void mlxbf3_gpio_set(struct gpio_chip *chip, unsigned int offset, int val)
+{
+	struct mlxbf3_gpio_context *gs = gpiochip_get_data(chip);
+
+	/* Software can only control GPIO pins defined by ctrl_gpio_mask */
+	if (!(BIT(offset) & gs->ctrl_gpio_mask))
+		return;
+
+	if (val)
+		writel(BIT(offset), gs->gpio_io + YU_GPIO_FW_DATA_OUT_SET);
+	else
+		writel(BIT(offset), gs->gpio_io + YU_GPIO_FW_DATA_OUT_CLEAR);
+
+	/* Make sure all previous writes are done before changing YU_GPIO_FW_CONTROL_SET */
+	wmb();
+
+	/* This needs to be done last to avoid glitches */
+	writel(BIT(offset), gs->gpio_io + YU_GPIO_FW_CONTROL_SET);
+}
+
+static int mlxbf3_gpio_direction_input(struct gpio_chip *chip,
+				       unsigned int offset)
+{
+	struct mlxbf3_gpio_context *gs = gpiochip_get_data(chip);
+	unsigned long flags;
+
+	spin_lock_irqsave(&gs->gc.bgpio_lock, flags);
+
+	writel(BIT(offset), gs->gpio_io + YU_GPIO_FW_OUTPUT_ENABLE_CLEAR);
+	writel(BIT(offset), gs->gpio_io + YU_GPIO_FW_CONTROL_CLEAR);
+
+	spin_unlock_irqrestore(&gs->gc.bgpio_lock, flags);
+
+	return 0;
+}
+
+static int mlxbf3_gpio_direction_output(struct gpio_chip *chip,
+					unsigned int offset,
+					int value)
+{
+	struct mlxbf3_gpio_context *gs = gpiochip_get_data(chip);
+	unsigned long flags;
+
+	spin_lock_irqsave(&gs->gc.bgpio_lock, flags);
+
+	writel(BIT(offset), gs->gpio_io + YU_GPIO_FW_OUTPUT_ENABLE_SET);
+
+	spin_unlock_irqrestore(&gs->gc.bgpio_lock, flags);
+
+	return 0;
+}
+
+static void mlxbf3_gpio_irq_enable(struct irq_data *irqd)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
+	struct mlxbf3_gpio_context *gs = gpiochip_get_data(gc);
+	int offset = irqd_to_hwirq(irqd);
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&gs->gc.bgpio_lock, flags);
+	val = readl(gs->gpio_cause_io + YU_GPIO_CAUSE_OR_CLRCAUSE);
+	val |= BIT(offset);
+	writel(val, gs->gpio_cause_io + YU_GPIO_CAUSE_OR_CLRCAUSE);
+
+	val = readl(gs->gpio_cause_io + YU_GPIO_CAUSE_OR_EVTEN0);
+	val |= BIT(offset);
+	writel(val, gs->gpio_cause_io + YU_GPIO_CAUSE_OR_EVTEN0);
+	spin_unlock_irqrestore(&gs->gc.bgpio_lock, flags);
+}
+
+static void mlxbf3_gpio_irq_disable(struct irq_data *irqd)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
+	struct mlxbf3_gpio_context *gs = gpiochip_get_data(gc);
+	int offset = irqd_to_hwirq(irqd);
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&gs->gc.bgpio_lock, flags);
+	val = readl(gs->gpio_cause_io + YU_GPIO_CAUSE_OR_EVTEN0);
+	val &= ~BIT(offset);
+	writel(val, gs->gpio_cause_io + YU_GPIO_CAUSE_OR_EVTEN0);
+	spin_unlock_irqrestore(&gs->gc.bgpio_lock, flags);
+}
+
+static irqreturn_t mlxbf3_gpio_irq_handler(int irq, void *ptr)
+{
+	struct mlxbf3_gpio_context *gs = ptr;
+	struct gpio_chip *gc = &gs->gc;
+	unsigned long pending;
+	u32 level;
+
+	pending = readl(gs->gpio_cause_io + YU_GPIO_CAUSE_OR_CAUSE_EVTEN0);
+	writel(pending, gs->gpio_cause_io + YU_GPIO_CAUSE_OR_CLRCAUSE);
+
+	for_each_set_bit(level, &pending, gc->ngpio) {
+		int gpio_irq = irq_find_mapping(gc->irq.domain, level);
+
+		generic_handle_irq(gpio_irq);
+	}
+
+	return IRQ_RETVAL(pending);
+}
+
+static int
+mlxbf3_gpio_irq_set_type(struct irq_data *irqd, unsigned int type)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(irqd);
+	struct mlxbf3_gpio_context *gs = gpiochip_get_data(gc);
+	int offset = irqd_to_hwirq(irqd);
+	unsigned long flags;
+	bool fall = false;
+	bool rise = false;
+	u32 val;
+
+	switch (type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_EDGE_BOTH:
+		fall = true;
+		rise = true;
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+		rise = true;
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		fall = true;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	spin_lock_irqsave(&gs->gc.bgpio_lock, flags);
+	if (fall) {
+		val = readl(gs->gpio_io + YU_GPIO_CAUSE_FALL_EN);
+		val |= BIT(offset);
+		writel(val, gs->gpio_io + YU_GPIO_CAUSE_FALL_EN);
+	}
+
+	if (rise) {
+		val = readl(gs->gpio_io + YU_GPIO_CAUSE_RISE_EN);
+		val |= BIT(offset);
+		writel(val, gs->gpio_io + YU_GPIO_CAUSE_RISE_EN);
+	}
+	spin_unlock_irqrestore(&gs->gc.bgpio_lock, flags);
+
+	return 0;
+}
+
+/* BlueField-3 GPIO driver initialization routine. */
+static int
+mlxbf3_gpio_probe(struct platform_device *pdev)
+{
+	struct mlxbf3_gpio_context *gs;
+	struct device *dev = &pdev->dev;
+	struct gpio_irq_chip *girq;
+	struct gpio_chip *gc;
+	unsigned int npins;
+	const char *name;
+	int ret, irq;
+
+	name = dev_name(dev);
+
+	gs = devm_kzalloc(dev, sizeof(*gs), GFP_KERNEL);
+	if (!gs)
+		return -ENOMEM;
+
+	/* YU GPIO block address */
+	gs->gpio_io = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(gs->gpio_io))
+		return PTR_ERR(gs->gpio_io);
+
+	/* YU GPIO block address */
+	gs->gpio_cause_io = devm_platform_ioremap_resource(pdev, 1);
+	if (IS_ERR(gs->gpio_cause_io))
+		return PTR_ERR(gs->gpio_cause_io);
+
+	if (device_property_read_u32(dev, "npins", &npins))
+		npins = MLXBF3_GPIO_MAX_PINS_PER_BLOCK;
+
+	if (device_property_read_u32(dev, "ctrl_gpio_mask", &gs->ctrl_gpio_mask))
+		gs->ctrl_gpio_mask = 0x0;
+
+	gc = &gs->gc;
+
+	/* To set the direction to input, just give control to HW by setting
+	 * YU_GPIO_FW_CONTROL_CLEAR.
+	 * If the GPIO is controlled by HW, read its value via read_data_in register.
+	 *
+	 * When the direction = output, the GPIO is controlled by SW and
+	 * datain=dataout. If software modifies the value of the GPIO pin,
+	 * the value can be read from read_data_in without changing the direction.
+	 */
+	ret = bgpio_init(gc, dev, 4,
+			gs->gpio_io + YU_GPIO_READ_DATA_IN,
+			NULL,
+			NULL,
+			NULL,
+			NULL,
+			0);
+
+	gc->set = mlxbf3_gpio_set;
+	gc->direction_input = mlxbf3_gpio_direction_input;
+	gc->direction_output = mlxbf3_gpio_direction_output;
+
+	gc->ngpio = npins;
+	gc->owner = THIS_MODULE;
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq >= 0) {
+		gs->irq_chip.name = name;
+		gs->irq_chip.irq_set_type = mlxbf3_gpio_irq_set_type;
+		gs->irq_chip.irq_enable = mlxbf3_gpio_irq_enable;
+		gs->irq_chip.irq_disable = mlxbf3_gpio_irq_disable;
+
+		girq = &gs->gc.irq;
+		girq->chip = &gs->irq_chip;
+		girq->handler = handle_simple_irq;
+		girq->default_type = IRQ_TYPE_NONE;
+		/* This will let us handle the parent IRQ in the driver */
+		girq->num_parents = 0;
+		girq->parents = NULL;
+		girq->parent_handler = NULL;
+
+		/*
+		 * Directly request the irq here instead of passing
+		 * a flow-handler because the irq is shared.
+		 */
+		ret = devm_request_irq(dev, irq, mlxbf3_gpio_irq_handler,
+				       IRQF_SHARED, name, gs);
+		if (ret) {
+			dev_err(dev, "failed to request IRQ");
+			return ret;
+		}
+	}
+
+	platform_set_drvdata(pdev, gs);
+
+	ret = devm_gpiochip_add_data(dev, &gs->gc, gs);
+	if (ret) {
+		dev_err(dev, "Failed adding memory mapped gpiochip\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int mlxbf3_gpio_remove(struct platform_device *pdev)
+{
+	struct mlxbf3_gpio_context *gs = platform_get_drvdata(pdev);
+
+	/* Set the GPIO control back to HW */
+	writel(gs->ctrl_gpio_mask, gs->gpio_io + YU_GPIO_FW_CONTROL_CLEAR);
+
+	return 0;
+}
+
+static const struct acpi_device_id __maybe_unused mlxbf3_gpio_acpi_match[] = {
+	{ "MLNXBF33", 0 },
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, mlxbf3_gpio_acpi_match);
+
+static struct platform_driver mlxbf3_gpio_driver = {
+	.driver = {
+		.name = "mlxbf3_gpio",
+		.acpi_match_table = mlxbf3_gpio_acpi_match,
+	},
+	.probe    = mlxbf3_gpio_probe,
+	.remove   = mlxbf3_gpio_remove,
+};
+
+module_platform_driver(mlxbf3_gpio_driver);
+
+MODULE_DESCRIPTION("Mellanox BlueField-3 GPIO Driver");
+MODULE_AUTHOR("Asmaa Mnebhi <asmaa@nvidia.com>");
+MODULE_LICENSE("Dual BSD/GPL");
-- 
2.30.1

