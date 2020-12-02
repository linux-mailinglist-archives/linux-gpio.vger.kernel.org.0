Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D83212CB8F3
	for <lists+linux-gpio@lfdr.de>; Wed,  2 Dec 2020 10:34:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388019AbgLBJdE (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 2 Dec 2020 04:33:04 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:8556 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729019AbgLBJcz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 2 Dec 2020 04:32:55 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CmDJ31nQ9zhhwb;
        Wed,  2 Dec 2020 17:31:47 +0800 (CST)
Received: from huawei.com (10.69.192.56) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Wed, 2 Dec 2020
 17:32:05 +0800
From:   Luo Jiaxing <luojiaxing@huawei.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <catalin.marinas@arm.com>, <will@kernel.org>
CC:     <andy.shevchenko@gmail.com>, <andriy.shevchenko@linux.intel.com>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linuxarm@huawei.com>
Subject: [PATCH v1 1/3] gpio: gpio-hisi: Add HiSilicon GPIO support
Date:   Wed, 2 Dec 2020 17:32:21 +0800
Message-ID: <1606901543-8957-2-git-send-email-luojiaxing@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1606901543-8957-1-git-send-email-luojiaxing@huawei.com>
References: <1606901543-8957-1-git-send-email-luojiaxing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This GPIO driver is for HiSilicon's ARM SoC.

HiSilicon's GPIO controller support double-edge interrupt and multi-core
concurrent access.

ACPI table example for this GPIO controller:
Device (GPO0)
{
	Name (_HID, "HISI0184")
	Device (PRTA)
	{
		Name (_ADR, Zero)
		Name (_UID, Zero)
		Name (_DSD, Package (0x01)
		{
			Package (0x02)
			{
				"hisi-ngpio",
				0x20
			}
		})
	}
}

Signed-off-by: Luo Jiaxing <luojiaxing@huawei.com>
---
 drivers/gpio/Kconfig     |  11 ++
 drivers/gpio/Makefile    |   1 +
 drivers/gpio/gpio-hisi.c | 356 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 368 insertions(+)
 create mode 100644 drivers/gpio/gpio-hisi.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 5d4de5c..0f5d4c6 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -296,6 +296,17 @@ config GPIO_GRGPIO
 	  Select this to support Aeroflex Gaisler GRGPIO cores from the GRLIB
 	  VHDL IP core library.
 
+config GPIO_HISI
+	tristate "HISILICON GPIO controller driver"
+	depends on (ARM64 && ACPI) || COMPILE_TEST
+	select GPIO_GENERIC
+	select GENERIC_IRQ_CHIP
+	help
+	  Say Y or M here to build support for the HiSilicon GPIO controller driver
+	  GPIO block.
+	  This controller support double-edge interrupt and multi-core concurrent
+	  access.
+
 config GPIO_HLWD
 	tristate "Nintendo Wii (Hollywood) GPIO"
 	depends on OF_GPIO
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 09dada8..260ae25 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -63,6 +63,7 @@ obj-$(CONFIG_GPIO_GE_FPGA)		+= gpio-ge.o
 obj-$(CONFIG_GPIO_GPIO_MM)		+= gpio-gpio-mm.o
 obj-$(CONFIG_GPIO_GRGPIO)		+= gpio-grgpio.o
 obj-$(CONFIG_GPIO_GW_PLD)		+= gpio-gw-pld.o
+obj-$(CONFIG_GPIO_HISI)                 += gpio-hisi.o
 obj-$(CONFIG_GPIO_HLWD)			+= gpio-hlwd.o
 obj-$(CONFIG_HTC_EGPIO)			+= gpio-htc-egpio.o
 obj-$(CONFIG_GPIO_ICH)			+= gpio-ich.o
diff --git a/drivers/gpio/gpio-hisi.c b/drivers/gpio/gpio-hisi.c
new file mode 100644
index 0000000..ab076ca
--- /dev/null
+++ b/drivers/gpio/gpio-hisi.c
@@ -0,0 +1,356 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2020 HiSilicon Limited.
+ */
+#include <linux/acpi.h>
+#include <linux/gpio/driver.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+
+#include "gpiolib.h"
+#include "gpiolib-acpi.h"
+
+#define HISI_GPIO_SWPORT_DR_SET_WX	0x0
+#define HISI_GPIO_SWPORT_DR_CLR_WX	0x4
+#define HISI_GPIO_SWPORT_DDR_SET_WX	0x10
+#define HISI_GPIO_SWPORT_DDR_CLR_WX	0x14
+#define HISI_GPIO_SWPORT_DDR_ST_WX	0x18
+#define HISI_GPIO_INTEN_SET_WX		0x20
+#define HISI_GPIO_INTEN_CLR_WX		0x24
+#define HISI_GPIO_INTMASK_SET_WX	0x30
+#define HISI_GPIO_INTMASK_CLR_WX	0x34
+#define HISI_GPIO_INTTYPE_EDGE_SET_WX	0x40
+#define HISI_GPIO_INTTYPE_EDGE_CLR_WX	0x44
+#define HISI_GPIO_INT_POLARITY_SET_WX	0x50
+#define HISI_GPIO_INT_POLARITY_CLR_WX	0x54
+#define HISI_GPIO_DEBOUNCE_SET_WX	0x60
+#define HISI_GPIO_DEBOUNCE_CLR_WX	0x64
+#define HISI_GPIO_INTSTATUS_WX		0x70
+#define HISI_GPIO_PORTA_EOI_WX		0x78
+#define HISI_GPIO_EXT_PORT_WX		0x80
+#define HISI_GPIO_INTCOMB_MASK_WX	0xa0
+#define HISI_GPIO_INT_DEDGE_SET		0xb0
+#define HISI_GPIO_INT_DEDGE_CLR		0xb4
+#define HISI_GPIO_INT_DEDGE_ST		0xb8
+
+#define HISI_GPIO_REG_SIZE	0x4
+#define HISI_GPIO_REG_MAX	0x100
+#define HISI_GPIO_PIN_NUM_MAX 32
+
+#define HISI_GPIO_DRIVER_NAME	"gpio-hisi"
+
+struct hisi_gpio {
+	struct device		*dev;
+	void __iomem		*reg_base;
+	unsigned int		pin_num;
+	struct gpio_chip	chip;
+	struct irq_chip		irq_chip;
+	int			irq;
+};
+
+static inline u32 hisi_gpio_read_reg(struct gpio_chip *chip,
+				     unsigned int off)
+{
+	struct hisi_gpio *hisi_gpio =
+			container_of(chip, struct hisi_gpio, chip);
+
+	return chip->read_reg(hisi_gpio->reg_base + off);
+}
+
+static inline void hisi_gpio_write_reg(struct gpio_chip *chip,
+				       unsigned int off, u32 val)
+{
+	struct hisi_gpio *hisi_gpio =
+			container_of(chip, struct hisi_gpio, chip);
+
+	chip->write_reg(hisi_gpio->reg_base + off, val);
+}
+
+static void hisi_gpio_set_debounce(struct gpio_chip *chip, unsigned int off,
+				   u32 debounce)
+{
+	unsigned long mask = BIT(off);
+
+	if (debounce)
+		hisi_gpio_write_reg(chip, HISI_GPIO_DEBOUNCE_SET_WX, mask);
+	else
+		hisi_gpio_write_reg(chip, HISI_GPIO_DEBOUNCE_CLR_WX, mask);
+}
+
+static int hisi_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
+				unsigned long config)
+{
+	u32 config_para = pinconf_to_config_param(config);
+	u32 config_arg;
+
+	switch (config_para) {
+	case PIN_CONFIG_INPUT_DEBOUNCE:
+		config_arg = pinconf_to_config_argument(config);
+		hisi_gpio_set_debounce(chip, offset, config_arg);
+		break;
+	default:
+		return -ENOTSUPP;
+	}
+
+	return 0;
+}
+
+static int hisi_gpio_get_direction(struct gpio_chip *chip, unsigned int gpio)
+{
+	/* Return 0 if output, 1 if input */
+	if (hisi_gpio_read_reg(chip, HISI_GPIO_SWPORT_DDR_ST_WX) & BIT(gpio))
+		return GPIO_LINE_DIRECTION_OUT;
+	return GPIO_LINE_DIRECTION_IN;
+}
+
+static int hisi_gpio_direction_output(struct gpio_chip *chip,
+				      unsigned int gpio,
+				      int val)
+{
+	hisi_gpio_write_reg(chip, HISI_GPIO_SWPORT_DDR_SET_WX, BIT(gpio));
+	chip->set(chip, gpio, val);
+	return 0;
+}
+
+static int hisi_gpio_direction_input(struct gpio_chip *chip,
+				     unsigned int gpio)
+{
+	hisi_gpio_write_reg(chip, HISI_GPIO_SWPORT_DDR_CLR_WX, BIT(gpio));
+	return 0;
+}
+
+void hisi_gpio_set_ack(struct irq_data *d)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+
+	hisi_gpio_write_reg(chip, HISI_GPIO_PORTA_EOI_WX, BIT(irqd_to_hwirq(d)));
+}
+
+static void hisi_gpio_irq_set_mask(struct irq_data *d)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+
+	hisi_gpio_write_reg(chip, HISI_GPIO_INTMASK_SET_WX, BIT(irqd_to_hwirq(d)));
+}
+
+static void hisi_gpio_irq_clr_mask(struct irq_data *d)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+
+	hisi_gpio_write_reg(chip, HISI_GPIO_INTMASK_CLR_WX, BIT(irqd_to_hwirq(d)));
+}
+
+static int hisi_gpio_irq_set_type(struct irq_data *d, u32 type)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+	unsigned int mask = BIT(irqd_to_hwirq(d));
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_BOTH:
+		hisi_gpio_write_reg(chip, HISI_GPIO_INT_DEDGE_SET, mask);
+		break;
+	case IRQ_TYPE_EDGE_RISING:
+		hisi_gpio_write_reg(chip, HISI_GPIO_INTTYPE_EDGE_SET_WX, mask);
+		hisi_gpio_write_reg(chip, HISI_GPIO_INT_POLARITY_SET_WX, mask);
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		hisi_gpio_write_reg(chip, HISI_GPIO_INTTYPE_EDGE_SET_WX, mask);
+		hisi_gpio_write_reg(chip, HISI_GPIO_INT_POLARITY_CLR_WX, mask);
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		hisi_gpio_write_reg(chip, HISI_GPIO_INTTYPE_EDGE_CLR_WX, mask);
+		hisi_gpio_write_reg(chip, HISI_GPIO_INT_POLARITY_SET_WX, mask);
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		hisi_gpio_write_reg(chip, HISI_GPIO_INTTYPE_EDGE_CLR_WX, mask);
+		hisi_gpio_write_reg(chip, HISI_GPIO_INT_POLARITY_CLR_WX, mask);
+	default:
+		return -EINVAL;
+	}
+
+	/*
+	 * The dual-edge interrupt and other interrupt's registers do not
+	 * take effect at the same time. The registers of the two-edge
+	 * interrupts have higher priorities, the configuration of
+	 * the dual-edge interrupts must be disabled before the configuration
+	 * of other kind of interrupts.
+	 */
+	if (type != IRQ_TYPE_EDGE_BOTH) {
+		unsigned int both = hisi_gpio_read_reg(chip, HISI_GPIO_INT_DEDGE_ST);
+
+		if (both & mask)
+			hisi_gpio_write_reg(chip, HISI_GPIO_INT_DEDGE_CLR, mask);
+	}
+
+	if (type & IRQ_TYPE_LEVEL_MASK)
+		irq_set_handler_locked(d, handle_level_irq);
+	else if (type & IRQ_TYPE_EDGE_BOTH)
+		irq_set_handler_locked(d, handle_edge_irq);
+
+	return 0;
+}
+
+static void hisi_gpio_irq_enable(struct irq_data *d)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+
+	hisi_gpio_irq_clr_mask(d);
+	hisi_gpio_write_reg(chip, HISI_GPIO_INTEN_SET_WX, BIT(irqd_to_hwirq(d)));
+}
+
+static void hisi_gpio_irq_disable(struct irq_data *d)
+{
+	struct gpio_chip *chip = irq_data_get_irq_chip_data(d);
+
+	hisi_gpio_irq_set_mask(d);
+	hisi_gpio_write_reg(chip, HISI_GPIO_INTEN_CLR_WX, BIT(irqd_to_hwirq(d)));
+}
+
+static void hisi_gpio_irq_handler(struct irq_desc *desc)
+{
+	struct hisi_gpio *hisi_gpio = irq_desc_get_handler_data(desc);
+	u32 irq_msk = hisi_gpio_read_reg(&hisi_gpio->chip,
+					 HISI_GPIO_INTSTATUS_WX);
+	struct irq_chip *irq_c = irq_desc_get_chip(desc);
+
+	chained_irq_enter(irq_c, desc);
+	while (irq_msk) {
+		int hwirq = fls(irq_msk) - 1;
+		int gpio_irq = irq_find_mapping(hisi_gpio->chip.irq.domain,
+						hwirq);
+
+		generic_handle_irq(gpio_irq);
+		irq_msk &= ~BIT(hwirq);
+	}
+	chained_irq_exit(irq_c, desc);
+}
+
+static void hisi_gpio_init_irq(struct hisi_gpio *hisi_gpio)
+{
+	struct gpio_chip *chip = &hisi_gpio->chip;
+	struct gpio_irq_chip *girq_chip = &chip->irq;
+
+	/* Set hooks for irq_chip */
+	hisi_gpio->irq_chip.irq_ack = hisi_gpio_set_ack;
+	hisi_gpio->irq_chip.irq_mask = hisi_gpio_irq_set_mask;
+	hisi_gpio->irq_chip.irq_unmask = hisi_gpio_irq_clr_mask;
+	hisi_gpio->irq_chip.irq_set_type = hisi_gpio_irq_set_type;
+	hisi_gpio->irq_chip.irq_enable = hisi_gpio_irq_enable;
+	hisi_gpio->irq_chip.irq_disable = hisi_gpio_irq_disable;
+
+	girq_chip->chip = &hisi_gpio->irq_chip;
+	girq_chip->default_type = IRQ_TYPE_NONE;
+	girq_chip->num_parents = 1;
+	girq_chip->parents = &hisi_gpio->irq;
+	girq_chip->parent_handler = hisi_gpio_irq_handler;
+	girq_chip->parent_handler_data = hisi_gpio;
+
+	/* Clear Mask of GPIO controller combine IRQ */
+	hisi_gpio_write_reg(chip, HISI_GPIO_INTCOMB_MASK_WX, 1);
+}
+
+static const struct acpi_device_id hisi_gpio_acpi_match[] = {
+	{"HISI0184", 0},
+	{}
+};
+MODULE_DEVICE_TABLE(acpi, hisi_gpio_acpi_match);
+
+static void hisi_gpio_get_pdata(struct device *dev,
+				struct hisi_gpio *hisi_gpio)
+{
+	struct platform_device *pdev = to_platform_device(dev);
+	struct fwnode_handle *fwnode;
+	int idx = 0;
+
+	device_for_each_child_node(dev, fwnode)  {
+		if (fwnode_property_read_u32(fwnode, "hisi-ngpio",
+					     &hisi_gpio->pin_num)) {
+			dev_err(dev,
+				"failed to get number of gpios for port%d and use default value instead\n",
+				idx);
+			hisi_gpio->pin_num = HISI_GPIO_PIN_NUM_MAX;
+		}
+
+		if (hisi_gpio->pin_num > HISI_GPIO_PIN_NUM_MAX)
+			hisi_gpio->pin_num = HISI_GPIO_PIN_NUM_MAX;
+
+		hisi_gpio->irq = platform_get_irq(pdev, idx);
+
+		dev_info(dev,
+			 "get hisi_gpio[%d] with %d gpios and irq[%d]\n", idx,
+			 hisi_gpio->pin_num, hisi_gpio->irq);
+
+		idx++;
+	}
+}
+
+static int hisi_gpio_probe(struct platform_device *platform_dev)
+{
+	struct device *dev = &platform_dev->dev;
+	void __iomem *dat, *set, *clr;
+	struct hisi_gpio *hisi_gpio;
+	int port_num;
+	int res;
+
+	/* One HiSilicon GPIO controller own one port with 32 pins */
+	port_num = device_get_child_node_count(dev);
+	if (port_num != 1)
+		return -ENODEV;
+
+	hisi_gpio = devm_kzalloc(dev, sizeof(*hisi_gpio), GFP_KERNEL);
+	if (!hisi_gpio)
+		return -ENOMEM;
+
+	hisi_gpio->reg_base = devm_platform_ioremap_resource(platform_dev, 0);
+	if (IS_ERR(hisi_gpio->reg_base))
+		return PTR_ERR(hisi_gpio->reg_base);
+
+	hisi_gpio_get_pdata(dev, hisi_gpio);
+
+	hisi_gpio->dev = dev;
+
+	dat = hisi_gpio->reg_base + HISI_GPIO_EXT_PORT_WX;
+	set = hisi_gpio->reg_base + HISI_GPIO_SWPORT_DR_SET_WX;
+	clr = hisi_gpio->reg_base + HISI_GPIO_SWPORT_DR_CLR_WX;
+
+	res = bgpio_init(&hisi_gpio->chip, hisi_gpio->dev, HISI_GPIO_REG_SIZE, dat, set,
+			 clr, NULL, NULL, 0);
+	if (res) {
+		dev_err(dev, "failed to init\n");
+		return res;
+	}
+
+	hisi_gpio->chip.direction_output = hisi_gpio_direction_output;
+	hisi_gpio->chip.direction_input = hisi_gpio_direction_input;
+	hisi_gpio->chip.get_direction = hisi_gpio_get_direction;
+	hisi_gpio->chip.set_config = hisi_gpio_set_config;
+	hisi_gpio->chip.ngpio = hisi_gpio->pin_num;
+	hisi_gpio->chip.base = -1;
+
+	if (hisi_gpio->irq > 0)
+		hisi_gpio_init_irq(hisi_gpio);
+
+	res = devm_gpiochip_add_data(dev, &hisi_gpio->chip, hisi_gpio);
+	if (res) {
+		dev_err(dev, "failed to register gpiochip\n");
+		return res;
+	}
+
+	return 0;
+}
+
+static struct platform_driver hisi_gpio_driver = {
+	.driver		= {
+		.name	= HISI_GPIO_DRIVER_NAME,
+		.acpi_match_table = ACPI_PTR(hisi_gpio_acpi_match),
+	},
+	.probe		= hisi_gpio_probe,
+};
+
+module_platform_driver(hisi_gpio_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Luo Jiaxing <luojiaxing@huawei.com>");
+MODULE_DESCRIPTION("HiSilicon GPIO controller driver");
+MODULE_ALIAS("platform:" HISI_GPIO_DRIVER_NAME);
-- 
2.7.4

