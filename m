Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 724D42D9422
	for <lists+linux-gpio@lfdr.de>; Mon, 14 Dec 2020 09:26:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439245AbgLNIZL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 14 Dec 2020 03:25:11 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:9438 "EHLO
        szxga06-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2439232AbgLNIZE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Dec 2020 03:25:04 -0500
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CvZD32Jf7zhsZZ;
        Mon, 14 Dec 2020 16:23:47 +0800 (CST)
Received: from huawei.com (10.69.192.56) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.498.0; Mon, 14 Dec 2020
 16:24:05 +0800
From:   Luo Jiaxing <luojiaxing@huawei.com>
To:     <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
        <catalin.marinas@arm.com>, <will@kernel.org>,
        <andy.shevchenko@gmail.com>, <andriy.shevchenko@linux.intel.com>
CC:     <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <john.garry@huawei.com>, <linuxarm@huawei.com>
Subject: [PATCH v2 1/3] gpio: gpio-hisi: Add HiSilicon GPIO support
Date:   Mon, 14 Dec 2020 16:24:13 +0800
Message-ID: <1607934255-52544-2-git-send-email-luojiaxing@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607934255-52544-1-git-send-email-luojiaxing@huawei.com>
References: <1607934255-52544-1-git-send-email-luojiaxing@huawei.com>
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
				"ngpios",
				0x20
			}
		})
	}
}

Signed-off-by: Luo Jiaxing <luojiaxing@huawei.com>
---
 drivers/gpio/Kconfig     |  11 ++
 drivers/gpio/Makefile    |   1 +
 drivers/gpio/gpio-hisi.c | 328 +++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 340 insertions(+)
 create mode 100644 drivers/gpio/gpio-hisi.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 5d4de5c..2598209 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -296,6 +296,17 @@ config GPIO_GRGPIO
 	  Select this to support Aeroflex Gaisler GRGPIO cores from the GRLIB
 	  VHDL IP core library.
 
+config GPIO_HISI
+	tristate "HiSilicon GPIO controller driver"
+	depends on (ARM64 || COMPILE_TEST) && ACPI
+	select GPIO_GENERIC
+	select GPIOLIB_IRQCHIP
+	help
+	  Say Y or M here to build support for the HiSilicon GPIO controller
+	  driver GPIO block.
+	  This GPIO controller support double-edge interrupt and multi-core
+	  concurrent access.
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
index 0000000..a389780
--- /dev/null
+++ b/drivers/gpio/gpio-hisi.c
@@ -0,0 +1,328 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright (c) 2020 HiSilicon Limited. */
+#include <linux/gpio/driver.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+
+#define HISI_GPIO_SWPORT_DR_SET_WX	0x000
+#define HISI_GPIO_SWPORT_DR_CLR_WX	0x004
+#define HISI_GPIO_SWPORT_DDR_SET_WX	0x010
+#define HISI_GPIO_SWPORT_DDR_CLR_WX	0x014
+#define HISI_GPIO_SWPORT_DDR_ST_WX	0x018
+#define HISI_GPIO_INTEN_SET_WX		0x020
+#define HISI_GPIO_INTEN_CLR_WX		0x024
+#define HISI_GPIO_INTMASK_SET_WX	0x030
+#define HISI_GPIO_INTMASK_CLR_WX	0x034
+#define HISI_GPIO_INTTYPE_EDGE_SET_WX	0x040
+#define HISI_GPIO_INTTYPE_EDGE_CLR_WX	0x044
+#define HISI_GPIO_INT_POLARITY_SET_WX	0x050
+#define HISI_GPIO_INT_POLARITY_CLR_WX	0x054
+#define HISI_GPIO_DEBOUNCE_SET_WX	0x060
+#define HISI_GPIO_DEBOUNCE_CLR_WX	0x064
+#define HISI_GPIO_INTSTATUS_WX		0x070
+#define HISI_GPIO_PORTA_EOI_WX		0x078
+#define HISI_GPIO_EXT_PORT_WX		0x080
+#define HISI_GPIO_INTCOMB_MASK_WX	0x0a0
+#define HISI_GPIO_INT_DEDGE_SET		0x0b0
+#define HISI_GPIO_INT_DEDGE_CLR		0x0b4
+#define HISI_GPIO_INT_DEDGE_ST		0x0b8
+
+#define HISI_GPIO_LINE_NUM_MAX	32
+#define HISI_GPIO_DRIVER_NAME	"gpio-hisi"
+
+struct hisi_gpio {
+	struct gpio_chip	chip;
+	struct device		*dev;
+	void __iomem		*reg_base;
+	unsigned int		line_num;
+	struct irq_chip		irq_chip;
+	int			irq;
+};
+
+static inline u32 hisi_gpio_read_reg(struct gpio_chip *chip,
+				     unsigned int off)
+{
+	struct hisi_gpio *hisi_gpio =
+			container_of(chip, struct hisi_gpio, chip);
+	void __iomem *reg = hisi_gpio->reg_base + off;
+
+	return readl(reg);
+}
+
+static inline void hisi_gpio_write_reg(struct gpio_chip *chip,
+				       unsigned int off, u32 val)
+{
+	struct hisi_gpio *hisi_gpio =
+			container_of(chip, struct hisi_gpio, chip);
+	void __iomem *reg = hisi_gpio->reg_base + off;
+
+	writel(val, reg);
+}
+
+static void hisi_gpio_set_debounce(struct gpio_chip *chip, unsigned int off,
+				   u32 debounce)
+{
+	if (debounce)
+		hisi_gpio_write_reg(chip, HISI_GPIO_DEBOUNCE_SET_WX, BIT(off));
+	else
+		hisi_gpio_write_reg(chip, HISI_GPIO_DEBOUNCE_CLR_WX, BIT(off));
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
+static void hisi_gpio_set_ack(struct irq_data *d)
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
+		break;
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
+	unsigned long irq_msk = hisi_gpio_read_reg(&hisi_gpio->chip,
+						   HISI_GPIO_INTSTATUS_WX);
+	struct irq_chip *irq_c = irq_desc_get_chip(desc);
+	int hwirq;
+
+	chained_irq_enter(irq_c, desc);
+	for_each_set_bit(hwirq, &irq_msk, HISI_GPIO_LINE_NUM_MAX)
+		generic_handle_irq(irq_find_mapping(hisi_gpio->chip.irq.domain,
+						    hwirq));
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
+		/* Cycle for once, no need for an array to save line_num */
+		if (fwnode_property_read_u32(fwnode, "ngpios",
+					     &hisi_gpio->line_num)) {
+			dev_err(dev,
+				"failed to get number of lines for port%d and use default value instead\n",
+				idx);
+			hisi_gpio->line_num = HISI_GPIO_LINE_NUM_MAX;
+		}
+
+		if (WARN_ON(hisi_gpio->line_num > HISI_GPIO_LINE_NUM_MAX))
+			hisi_gpio->line_num = HISI_GPIO_LINE_NUM_MAX;
+
+		hisi_gpio->irq = platform_get_irq(pdev, idx);
+
+		dev_info(dev,
+			 "get hisi_gpio[%d] with %d lines\n", idx,
+			 hisi_gpio->line_num);
+
+		idx++;
+	}
+}
+
+static int hisi_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	void __iomem *dat, *set, *clr;
+	struct hisi_gpio *hisi_gpio;
+	int port_num;
+	int ret;
+
+	/*
+	 * One GPIO controller own one port currently,
+	 * if we get more from ACPI table, return error.
+	 */
+	port_num = device_get_child_node_count(dev);
+	if (WARN_ON(port_num != 1))
+		return -ENODEV;
+
+	hisi_gpio = devm_kzalloc(dev, sizeof(*hisi_gpio), GFP_KERNEL);
+	if (!hisi_gpio)
+		return -ENOMEM;
+
+	hisi_gpio->reg_base = devm_platform_ioremap_resource(pdev, 0);
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
+	ret = bgpio_init(&hisi_gpio->chip, hisi_gpio->dev, 0x4,
+			 hisi_gpio->reg_base + HISI_GPIO_EXT_PORT_WX,
+			 hisi_gpio->reg_base + HISI_GPIO_SWPORT_DR_SET_WX,
+			 hisi_gpio->reg_base + HISI_GPIO_SWPORT_DR_CLR_WX,
+			 hisi_gpio->reg_base + HISI_GPIO_SWPORT_DDR_SET_WX,
+			 hisi_gpio->reg_base + HISI_GPIO_SWPORT_DDR_CLR_WX,
+			 BGPIOF_NO_SET_ON_INPUT);
+	if (ret) {
+		dev_err(dev, "failed to init, ret = %d\n", ret);
+		return ret;
+	}
+
+	hisi_gpio->chip.set_config = hisi_gpio_set_config;
+	hisi_gpio->chip.ngpio = hisi_gpio->line_num;
+	hisi_gpio->chip.bgpio_dir_unreadable = 1;
+	hisi_gpio->chip.base = -1;
+
+	if (hisi_gpio->irq > 0)
+		hisi_gpio_init_irq(hisi_gpio);
+
+	ret = devm_gpiochip_add_data(dev, &hisi_gpio->chip, hisi_gpio);
+	if (ret) {
+		dev_err(dev, "failed to register gpiochip, ret = %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static struct platform_driver hisi_gpio_driver = {
+	.driver		= {
+		.name	= HISI_GPIO_DRIVER_NAME,
+		.acpi_match_table = hisi_gpio_acpi_match,
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

