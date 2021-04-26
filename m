Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 695A936B11A
	for <lists+linux-gpio@lfdr.de>; Mon, 26 Apr 2021 11:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232333AbhDZJzP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 26 Apr 2021 05:55:15 -0400
Received: from mx2.suse.de ([195.135.220.15]:35114 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232376AbhDZJzM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 26 Apr 2021 05:55:12 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 6CA1CAFC4;
        Mon, 26 Apr 2021 09:54:30 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH v4 1/2] gpio: Add support for IDT 79RC3243x GPIO controller
Date:   Mon, 26 Apr 2021 11:54:25 +0200
Message-Id: <20210426095426.118356-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

IDT 79RC3243x SoCs integrated a gpio controller, which handles up
to 32 gpios. All gpios could be used as an interrupt source.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
Changes in v4:
 - added spinlock to serialize access to irq registers
 - reworked checking of irq sense bits
 - start with handle_bad_irq and set handle_level_irq in idt_gpio_irq_set_type
 - cleaned up #includes
 - use platform_get_irq

Changes in v3:
 - changed compatible string to idt,32434-gpio
 - registers now start with gpio direction register and leaves
   out alternate function register for pinmux/pinctrl driver

Changes in v2:
 - made driver buildable as module
 - use for_each_set_bit() in irq dispatch handler
 - use gpiochip_get_data instead of own container_of helper
 - use module_platform_driver() instead of arch_initcall
 - don't default y for Mikrotik RB532

 drivers/gpio/Kconfig         |  12 ++
 drivers/gpio/Makefile        |   1 +
 drivers/gpio/gpio-idt3243x.c | 209 +++++++++++++++++++++++++++++++++++
 3 files changed, 222 insertions(+)
 create mode 100644 drivers/gpio/gpio-idt3243x.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index e3607ec4c2e8..90543a95dbb8 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -770,6 +770,18 @@ config GPIO_MSC313
 	  Say Y here to support the main GPIO block on MStar/SigmaStar
 	  ARMv7 based SoCs.
 
+config GPIO_IDT3243X
+	tristate "IDT 79RC3243X GPIO support"
+	depends on MIKROTIK_RB532 || COMPILE_TEST
+	select GPIO_GENERIC
+	select GPIOLIB_IRQCHIP
+	help
+	  Select this option to enable GPIO driver for
+	  IDT 79RC3243X based devices like Mikrotik RB532.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called gpio-idt3243x.
+
 endmenu
 
 menu "Port-mapped I/O GPIO drivers"
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index c58a90a3c3b1..75dd9c5665c5 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -67,6 +67,7 @@ obj-$(CONFIG_GPIO_HISI)                 += gpio-hisi.o
 obj-$(CONFIG_GPIO_HLWD)			+= gpio-hlwd.o
 obj-$(CONFIG_HTC_EGPIO)			+= gpio-htc-egpio.o
 obj-$(CONFIG_GPIO_ICH)			+= gpio-ich.o
+obj-$(CONFIG_GPIO_IDT3243X)		+= gpio-idt3243x.o
 obj-$(CONFIG_GPIO_IOP)			+= gpio-iop.o
 obj-$(CONFIG_GPIO_IT87)			+= gpio-it87.o
 obj-$(CONFIG_GPIO_IXP4XX)		+= gpio-ixp4xx.o
diff --git a/drivers/gpio/gpio-idt3243x.c b/drivers/gpio/gpio-idt3243x.c
new file mode 100644
index 000000000000..62e5643a0228
--- /dev/null
+++ b/drivers/gpio/gpio-idt3243x.c
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Driver for IDT/Renesas 79RC3243x Interrupt Controller  */
+
+#include <linux/gpio/driver.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+
+#define IDT_PIC_IRQ_PEND	0x00
+#define IDT_PIC_IRQ_MASK	0x08
+
+#define IDT_GPIO_DIR		0x00
+#define IDT_GPIO_DATA		0x04
+#define IDT_GPIO_ILEVEL		0x08
+#define IDT_GPIO_ISTAT		0x0C
+
+struct idt_gpio_ctrl {
+	struct gpio_chip gc;
+	void __iomem *pic;
+	void __iomem *gpio;
+	u32 mask_cache;
+	spinlock_t irq_lock; /* serialize access to irq registers */
+};
+
+static void idt_gpio_dispatch(struct irq_desc *desc)
+{
+	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
+	struct idt_gpio_ctrl *ctrl = gpiochip_get_data(gc);
+	struct irq_chip *host_chip = irq_desc_get_chip(desc);
+	unsigned int bit, virq;
+	unsigned long pending;
+
+	chained_irq_enter(host_chip, desc);
+
+	pending = readl(ctrl->pic + IDT_PIC_IRQ_PEND);
+	pending &= ~ctrl->mask_cache;
+	for_each_set_bit(bit, &pending, gc->ngpio) {
+		virq = irq_linear_revmap(gc->irq.domain, bit);
+		if (virq)
+			generic_handle_irq(virq);
+	}
+
+	chained_irq_exit(host_chip, desc);
+}
+
+static int idt_gpio_irq_set_type(struct irq_data *d, unsigned int flow_type)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct idt_gpio_ctrl *ctrl = gpiochip_get_data(gc);
+	unsigned int sense = flow_type & IRQ_TYPE_SENSE_MASK;
+	unsigned long flags;
+	u32 ilevel;
+
+	/* hardware only supports level triggered */
+	if (sense & IRQ_TYPE_EDGE_BOTH)
+		return -EINVAL;
+
+	if (sense == 0 || sense == IRQ_TYPE_LEVEL_MASK)
+		return -EINVAL;
+
+	spin_lock_irqsave(&ctrl->irq_lock, flags);
+
+	ilevel = readl(ctrl->gpio + IDT_GPIO_ILEVEL);
+	if (sense & IRQ_TYPE_LEVEL_HIGH)
+		ilevel |= BIT(d->hwirq);
+	else if (sense & IRQ_TYPE_LEVEL_LOW)
+		ilevel &= ~BIT(d->hwirq);
+
+	writel(ilevel, ctrl->gpio + IDT_GPIO_ILEVEL);
+	irq_set_handler_locked(d, handle_level_irq);
+
+	spin_unlock_irqrestore(&ctrl->irq_lock, flags);
+	return 0;
+}
+
+static void idt_gpio_ack(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct idt_gpio_ctrl *ctrl = gpiochip_get_data(gc);
+
+	writel(~BIT(d->hwirq), ctrl->gpio + IDT_GPIO_ISTAT);
+}
+
+static void idt_gpio_mask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct idt_gpio_ctrl *ctrl = gpiochip_get_data(gc);
+	unsigned long flags;
+
+	spin_lock_irqsave(&ctrl->irq_lock, flags);
+
+	ctrl->mask_cache |= BIT(d->hwirq);
+	writel(ctrl->mask_cache, ctrl->pic + IDT_PIC_IRQ_MASK);
+
+	spin_unlock_irqrestore(&ctrl->irq_lock, flags);
+}
+
+static void idt_gpio_unmask(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct idt_gpio_ctrl *ctrl = gpiochip_get_data(gc);
+	unsigned long flags;
+
+	spin_lock_irqsave(&ctrl->irq_lock, flags);
+
+	ctrl->mask_cache &= ~BIT(d->hwirq);
+	writel(ctrl->mask_cache, ctrl->pic + IDT_PIC_IRQ_MASK);
+
+	spin_unlock_irqrestore(&ctrl->irq_lock, flags);
+}
+
+static int idt_gpio_irq_init_hw(struct gpio_chip *gc)
+{
+	struct idt_gpio_ctrl *ctrl = gpiochip_get_data(gc);
+
+	/* Mask interrupts. */
+	ctrl->mask_cache = 0xffffffff;
+	writel(ctrl->mask_cache, ctrl->pic + IDT_PIC_IRQ_MASK);
+
+	return 0;
+}
+
+static struct irq_chip idt_gpio_irqchip = {
+	.name = "IDTGPIO",
+	.irq_mask = idt_gpio_mask,
+	.irq_ack = idt_gpio_ack,
+	.irq_unmask = idt_gpio_unmask,
+	.irq_set_type = idt_gpio_irq_set_type
+};
+
+static int idt_gpio_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct gpio_irq_chip *girq;
+	struct idt_gpio_ctrl *ctrl;
+	unsigned int parent_irq;
+	int ngpios;
+	int ret;
+
+	ret = device_property_read_u32(dev, "ngpios", &ngpios);
+	if (ret) {
+		dev_err(dev, "ngpios property is not valid\n");
+		return ret;
+	}
+
+	ctrl = devm_kzalloc(dev, sizeof(*ctrl), GFP_KERNEL);
+	if (!ctrl)
+		return -ENOMEM;
+
+	ctrl->gpio = devm_platform_ioremap_resource_byname(pdev, "gpio");
+	if (!ctrl->gpio)
+		return -ENOMEM;
+
+	ctrl->gc.parent = dev;
+
+	ret = bgpio_init(&ctrl->gc, &pdev->dev, 4, ctrl->gpio + IDT_GPIO_DATA,
+			 NULL, NULL, ctrl->gpio + IDT_GPIO_DIR, NULL, 0);
+	if (ret) {
+		dev_err(dev, "bgpio_init failed\n");
+		return ret;
+	}
+	ctrl->gc.ngpio = ngpios;
+
+	ctrl->pic = devm_platform_ioremap_resource_byname(pdev, "pic");
+	if (!ctrl->pic)
+		return -ENOMEM;
+
+	parent_irq = platform_get_irq(pdev, 0);
+	if (!parent_irq)
+		return -EINVAL;
+
+	girq = &ctrl->gc.irq;
+	girq->chip = &idt_gpio_irqchip;
+	girq->init_hw = idt_gpio_irq_init_hw;
+	girq->parent_handler = idt_gpio_dispatch;
+	girq->num_parents = 1;
+	girq->parents = devm_kcalloc(dev, girq->num_parents,
+				     sizeof(*girq->parents), GFP_KERNEL);
+	if (!girq->parents)
+		return -ENOMEM;
+
+	girq->parents[0] = parent_irq;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_bad_irq;
+
+	spin_lock_init(&ctrl->irq_lock);
+
+	return devm_gpiochip_add_data(&pdev->dev, &ctrl->gc, ctrl);
+}
+
+static const struct of_device_id idt_gpio_of_match[] = {
+	{ .compatible = "idt,32434-gpio" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, idt_gpio_of_match);
+
+static struct platform_driver idt_gpio_driver = {
+	.probe = idt_gpio_probe,
+	.driver = {
+		.name = "idt3243x-gpio",
+		.of_match_table = idt_gpio_of_match,
+	},
+};
+module_platform_driver(idt_gpio_driver);
+
+MODULE_DESCRIPTION("IDT 79RC3243x GPIO/PIC Driver");
+MODULE_AUTHOR("Thomas Bogendoerfer <tsbogend@alpha.franken.de>");
+MODULE_LICENSE("GPL");
-- 
2.29.2

