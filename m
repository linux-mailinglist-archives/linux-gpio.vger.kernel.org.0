Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 357B036590E
	for <lists+linux-gpio@lfdr.de>; Tue, 20 Apr 2021 14:39:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231661AbhDTMkH (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 20 Apr 2021 08:40:07 -0400
Received: from mx2.suse.de ([195.135.220.15]:51318 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231462AbhDTMkG (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 20 Apr 2021 08:40:06 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 7F884B229;
        Tue, 20 Apr 2021 12:39:34 +0000 (UTC)
From:   Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [PATCH 1/2] gpio: Add support for IDT 79RC3243x GPIO controller
Date:   Tue, 20 Apr 2021 14:39:30 +0200
Message-Id: <20210420123932.24634-1-tsbogend@alpha.franken.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

IDT 79RC3243x SoCs integrated a gpio controller, which handles up
to 32 gpios. All gpios could be used as interrupt source.

Signed-off-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
---
 drivers/gpio/Kconfig         |  10 ++
 drivers/gpio/Makefile        |   1 +
 drivers/gpio/gpio-idt3243x.c | 210 +++++++++++++++++++++++++++++++++++
 3 files changed, 221 insertions(+)
 create mode 100644 drivers/gpio/gpio-idt3243x.c

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index e3607ec4c2e8..6847a06ffcfe 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -770,6 +770,16 @@ config GPIO_MSC313
 	  Say Y here to support the main GPIO block on MStar/SigmaStar
 	  ARMv7 based SoCs.
 
+config GPIO_IDT3243X
+	bool "IDT 79RC3243X GPIO support"
+	default y if MIKROTIK_RB532
+	depends on MIKROTIK_RB532 || COMPILE_TEST
+	select GPIO_GENERIC
+	select GPIOLIB_IRQCHIP
+	help
+	  Select this option to enable GPIO driver for
+	  IDT 79RC3243X SoC devices.
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
index 000000000000..eaee46480268
--- /dev/null
+++ b/drivers/gpio/gpio-idt3243x.c
@@ -0,0 +1,210 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for IDT/Renesas 79RC3243x Interrupt Controller.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/gpio/driver.h>
+#include <linux/interrupt.h>
+#include <linux/irq.h>
+#include <linux/irqchip.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdomain.h>
+#include <linux/of_address.h>
+#include <linux/of_irq.h>
+
+#define IDT_GPIO_NR_IRQS	32
+
+#define IDT_PIC_IRQ_PEND	0x00
+#define IDT_PIC_IRQ_MASK	0x08
+
+#define IDT_GPIO_DIR		0x04
+#define IDT_GPIO_DATA		0x08
+#define IDT_GPIO_ILEVEL		0x0C
+#define IDT_GPIO_ISTAT		0x10
+
+struct idt_gpio_ctrl {
+	struct gpio_chip gc;
+	void __iomem *pic;
+	void __iomem *gpio;
+	u32 mask_cache;
+};
+
+static struct idt_gpio_ctrl *irq_data_to_idt_gpio(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+
+	return container_of(gc, struct idt_gpio_ctrl, gc);
+}
+
+static void idt_gpio_dispatch(struct irq_desc *desc)
+{
+	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
+	struct idt_gpio_ctrl *ctrl = container_of(gc, struct idt_gpio_ctrl, gc);
+	struct irq_chip *host_chip = irq_desc_get_chip(desc);
+	u32 pending, hwirq, virq;
+
+	chained_irq_enter(host_chip, desc);
+
+	pending = readl(ctrl->pic + IDT_PIC_IRQ_PEND);
+	pending &= ~ctrl->mask_cache;
+	while (pending) {
+		hwirq = __fls(pending);
+		virq = irq_linear_revmap(gc->irq.domain, hwirq);
+		if (virq)
+			generic_handle_irq(virq);
+		pending &= ~(1 << hwirq);
+	}
+
+	chained_irq_exit(host_chip, desc);
+}
+
+static int idt_gpio_irq_set_type(struct irq_data *d, unsigned int flow_type)
+{
+	struct idt_gpio_ctrl *ctrl = irq_data_to_idt_gpio(d);
+	unsigned int sense = flow_type & IRQ_TYPE_SENSE_MASK;
+	u32 ilevel;
+
+	if (sense & ~(IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW))
+		return -EINVAL;
+
+	ilevel = readl(ctrl->gpio + IDT_GPIO_ILEVEL);
+	if (sense & IRQ_TYPE_LEVEL_HIGH)
+		ilevel |= BIT(d->hwirq);
+	else if (sense & IRQ_TYPE_LEVEL_LOW)
+		ilevel &= ~BIT(d->hwirq);
+	else
+		return -EINVAL;
+
+	writel(ilevel, ctrl->gpio + IDT_GPIO_ILEVEL);
+	return 0;
+}
+
+static void idt_gpio_ack(struct irq_data *d)
+{
+	struct idt_gpio_ctrl *ctrl = irq_data_to_idt_gpio(d);
+
+	writel(~BIT(d->hwirq), ctrl->gpio + IDT_GPIO_ISTAT);
+}
+
+static void idt_gpio_mask(struct irq_data *d)
+{
+	struct idt_gpio_ctrl *ctrl = irq_data_to_idt_gpio(d);
+
+	ctrl->mask_cache |= BIT(d->hwirq);
+	writel(ctrl->mask_cache, ctrl->pic + IDT_PIC_IRQ_MASK);
+}
+
+static void idt_gpio_unmask(struct irq_data *d)
+{
+	struct idt_gpio_ctrl *ctrl = irq_data_to_idt_gpio(d);
+
+	ctrl->mask_cache &= ~BIT(d->hwirq);
+	writel(ctrl->mask_cache, ctrl->pic + IDT_PIC_IRQ_MASK);
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
+	parent_irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
+	if (!parent_irq) {
+		dev_err(&pdev->dev, "Failed to map parent IRQ!\n");
+		return -EINVAL;
+	}
+
+	/* Mask interrupts. */
+	ctrl->mask_cache = 0xffffffff;
+	writel(ctrl->mask_cache, ctrl->pic + IDT_PIC_IRQ_MASK);
+
+	girq = &ctrl->gc.irq;
+	girq->chip = &idt_gpio_irqchip;
+	girq->parent_handler = idt_gpio_dispatch;
+	girq->num_parents = 1;
+	girq->parents = devm_kcalloc(dev, 1, sizeof(*girq->parents),
+				     GFP_KERNEL);
+	if (!girq->parents) {
+		ret = -ENOMEM;
+		goto out_unmap_irq;
+	}
+	girq->parents[0] = parent_irq;
+	girq->default_type = IRQ_TYPE_NONE;
+	girq->handler = handle_level_irq;
+
+	ret = devm_gpiochip_add_data(&pdev->dev, &ctrl->gc, NULL);
+	if (ret)
+		goto out_unmap_irq;
+
+	return 0;
+
+out_unmap_irq:
+	irq_dispose_mapping(parent_irq);
+	return ret;
+}
+
+static const struct of_device_id idt_gpio_of_match[] = {
+	{ .compatible = "idt,3243x-gpio" },
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
+
+static int __init idt_gpio_init(void)
+{
+	return platform_driver_register(&idt_gpio_driver);
+}
+
+arch_initcall(idt_gpio_init);
+
+MODULE_DESCRIPTION("IDT 79RC3243x GPIO/PIC Driver");
+MODULE_AUTHOR("Thomas Bogendoerfer <tsbogend@alpha.franken.de>");
+MODULE_LICENSE("GPL");
-- 
2.29.2

