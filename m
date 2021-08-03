Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5D503DF422
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Aug 2021 19:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238415AbhHCRvm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Aug 2021 13:51:42 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:40647 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S238316AbhHCRvl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Aug 2021 13:51:41 -0400
X-IronPort-AV: E=Sophos;i="5.84,292,1620658800"; 
   d="scan'208";a="89707998"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 04 Aug 2021 02:51:29 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id E661A40BF58E;
        Wed,  4 Aug 2021 02:51:26 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Marc Zyngier <maz@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 2/4] irqchip: Add RZ/G2L IA55 Interrupt Controller driver
Date:   Tue,  3 Aug 2021 18:51:07 +0100
Message-Id: <20210803175109.1729-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210803175109.1729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210803175109.1729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a driver for the Renesas RZ/G2L Interrupt Controller.

This supports external pins being used as interrupts. It supports
one line for NMI, 8 external pins and 32 GPIO pins (GPIOINT0-122)
to be used as IRQ lines.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/irqchip/Kconfig             |   8 +
 drivers/irqchip/Makefile            |   1 +
 drivers/irqchip/irq-renesas-rzg2l.c | 557 ++++++++++++++++++++++++++++
 drivers/soc/renesas/Kconfig         |   1 +
 4 files changed, 567 insertions(+)
 create mode 100644 drivers/irqchip/irq-renesas-rzg2l.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 62543a4eccc0..790c19ad6e39 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -236,6 +236,14 @@ config RENESAS_RZA1_IRQC
 	  Enable support for the Renesas RZ/A1 Interrupt Controller, to use up
 	  to 8 external interrupts with configurable sense select.
 
+config RENESAS_RZG2L_IRQC
+	bool "Renesas RZ/G2L IRQC support" if COMPILE_TEST
+	select GENERIC_IRQ_CHIP
+	select IRQ_DOMAIN_HIERARCHY
+	help
+	  Enable support for the Renesas RZ/G2L Interrupt Controller for external
+	  devices.
+
 config SL28CPLD_INTC
 	bool "Kontron sl28cpld IRQ controller"
 	depends on MFD_SL28CPLD=y || COMPILE_TEST
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index f88cbf36a9d2..8017786fbdac 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -51,6 +51,7 @@ obj-$(CONFIG_RDA_INTC)			+= irq-rda-intc.o
 obj-$(CONFIG_RENESAS_INTC_IRQPIN)	+= irq-renesas-intc-irqpin.o
 obj-$(CONFIG_RENESAS_IRQC)		+= irq-renesas-irqc.o
 obj-$(CONFIG_RENESAS_RZA1_IRQC)		+= irq-renesas-rza1.o
+obj-$(CONFIG_RENESAS_RZG2L_IRQC)	+= irq-renesas-rzg2l.o
 obj-$(CONFIG_VERSATILE_FPGA_IRQ)	+= irq-versatile-fpga.o
 obj-$(CONFIG_ARCH_NSPIRE)		+= irq-zevio.o
 obj-$(CONFIG_ARCH_VT8500)		+= irq-vt8500.o
diff --git a/drivers/irqchip/irq-renesas-rzg2l.c b/drivers/irqchip/irq-renesas-rzg2l.c
new file mode 100644
index 000000000000..abfaaa8a09af
--- /dev/null
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -0,0 +1,557 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/G2L IRQC Driver
+ *
+ * Copyright (C) 2020 Renesas Electronics Corporation.
+ */
+
+#include <linux/init.h>
+#include <linux/platform_device.h>
+#include <linux/interrupt.h>
+#include <linux/ioport.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/clk.h>
+#include <linux/irqdomain.h>
+#include <linux/err.h>
+#include <linux/of_irq.h>
+#include <linux/slab.h>
+#include <linux/module.h>
+#include <linux/pm_runtime.h>
+
+#define RZG2L_IRQC_IRQ_MAX		41
+#define RZG2L_TINT_MAX_INTERRUPTS	32
+#define RZG2L_TINT_IRQ_START_INDEX	9
+
+#define TSCR		0x20
+#define TITSR0		0x24
+#define TITSR1		0x28
+#define TSSR(n)		(0x30 + ((n) * 4))
+#define IRQ_MASK	0x3
+
+#define RISING_EDGE	0
+#define FALLING_EDGE	1
+#define HIGH_LEVEL	2
+#define LOW_LEVEL	3
+
+#define RZG2L_TINT_EDGE_BOTH	BIT(4)
+
+#define RZG2L_MAX_PINS_PER_PORT		8
+#define RZG2L_PIN_ID_TO_PORT(id)	((id) / RZG2L_MAX_PINS_PER_PORT)
+#define RZG2L_PIN_ID_TO_PIN(id)		((id) % RZG2L_MAX_PINS_PER_PORT)
+
+struct irqc_irq {
+	int hw_irq;
+	int requested_irq;
+	struct irqc_priv *p;
+	struct rzg2l_pin_info *pin;
+};
+
+struct rzg2l_pin_info {
+	u32 port;
+	u8 bit;
+	u32 id;
+	u32 trigger_type;
+	unsigned int type;
+	u8 pin_state;
+};
+
+struct irqc_priv {
+	void __iomem *iomem;
+	struct irqc_irq irq[RZG2L_IRQC_IRQ_MAX];
+	DECLARE_BITMAP(tint_slot, RZG2L_TINT_MAX_INTERRUPTS);
+	unsigned int number_of_irqs;
+	struct device *dev;
+	struct irq_chip_generic *gc;
+	struct irq_chip chip;
+	struct irq_domain *irq_domain;
+	struct irq_domain *parent_domain;
+	unsigned int tint_irq_start;
+	atomic_t wakeup_path;
+	struct clk *clk;
+	struct clk *pclk;
+};
+
+static const struct rzg2l_pin_info gpio_pin_info[] = {
+	{ 0, 0, 0 }, { 0, 1, 1 },
+	{ 1, 0, 2 }, { 1, 1, 3 },
+	{ 2, 0, 4 }, { 2, 1, 5 },
+	{ 3, 0, 6 }, { 3, 1, 7 },
+	{ 4, 0, 8 }, { 4, 1, 9 },
+	{ 5, 0, 10 }, { 5, 1, 11 }, { 5, 2, 12 },
+	{ 6, 0, 13 }, { 6, 1, 14 },
+	{ 7, 0, 15 }, { 7, 1, 16 }, { 7, 2, 17 },
+	{ 8, 0, 18 }, { 8, 1, 19 }, { 8, 2, 20 },
+	{ 9, 0, 21 }, { 9, 1, 22 },
+	{ 10, 0, 23 }, { 10, 1, 24 },
+	{ 11, 0, 25 }, { 11, 1, 26 },
+	{ 12, 0, 27 }, { 12, 1, 28 },
+	{ 13, 0, 29 }, { 13, 1, 30 }, { 13, 2, 31 },
+	{ 14, 0, 32 }, { 14, 1, 33 },
+	{ 15, 0, 34 }, { 15, 1, 35 },
+	{ 16, 0, 36 }, { 16, 1, 37 },
+	{ 17, 0, 38 }, { 17, 1, 39 }, { 17, 2, 40 },
+	{ 18, 0, 41 }, { 18, 1, 42 },
+	{ 19, 0, 43 }, { 19, 1, 44 },
+	{ 20, 0, 45 }, { 20, 1, 46 }, { 20, 2, 47 },
+	{ 21, 0, 48 }, { 21, 1, 49 },
+	{ 22, 0, 50 }, { 22, 1, 51 },
+	{ 23, 0, 52 }, { 23, 1, 53 },
+	{ 24, 0, 54 }, { 24, 1, 55 },
+	{ 25, 0, 56 }, { 25, 1, 57 },
+	{ 26, 0, 58 }, { 26, 1, 59 },
+	{ 27, 0, 60 }, { 27, 1, 61 },
+	{ 28, 0, 62 }, { 28, 1, 63 },
+	{ 29, 0, 64 }, { 29, 1, 65 },
+	{ 30, 0, 66 }, { 30, 1, 67 },
+	{ 31, 0, 68 }, { 31, 1, 69 },
+	{ 32, 0, 70 }, { 32, 1, 71 },
+	{ 33, 0, 72 }, { 33, 1, 73 },
+	{ 34, 0, 74 }, { 34, 1, 75 },
+	{ 35, 0, 76 }, { 35, 1, 77 },
+	{ 36, 0, 78 }, { 36, 1, 79 },
+	{ 37, 0, 80 }, { 37, 1, 81 }, { 37, 2, 82 },
+	{ 38, 0, 83 }, { 38, 1, 84 },
+	{ 39, 0, 85 }, { 39, 1, 86 }, { 39, 2, 87 },
+	{ 40, 0, 88 }, { 40, 1, 89 }, { 40, 2, 90 },
+	{ 41, 0, 91 }, { 41, 1, 92 },
+	{ 42, 0, 93 }, { 42, 1, 94 }, { 42, 2, 95 }, { 42, 3, 96 }, { 42, 4, 97 },
+	{ 43, 0, 98 }, { 43, 1, 99 }, { 43, 2, 100 }, { 43, 3, 101 },
+	{ 44, 0, 102 }, { 44, 1, 103 }, { 44, 2, 104 }, { 44, 3, 105 },
+	{ 45, 0, 106 }, { 45, 1, 107 }, { 45, 2, 108 }, { 45, 3, 109 },
+	{ 46, 0, 110 }, { 46, 1, 111 }, { 46, 2, 112 }, { 46, 3, 113 },
+	{ 47, 0, 114 }, { 47, 1, 115 }, { 47, 2, 116 }, { 47, 3, 117 },
+	{ 48, 0, 118 }, { 48, 1, 119 }, { 48, 2, 120 }, { 48, 3, 121 }, { 48, 3, 122 },
+};
+
+static int rzg2l_gpio_irq_validate_id(u32 port, u32 bit)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(gpio_pin_info); i++) {
+		if (gpio_pin_info[i].port == port && gpio_pin_info[i].bit == bit)
+			return gpio_pin_info[i].id;
+	}
+
+	return -EINVAL;
+}
+
+static struct irq_domain *rzg2l_get_pinctrl_domain(struct device *dev)
+{
+	struct device_node *pinctrl_np;
+	struct irq_domain *pinctrl_domain;
+
+	pinctrl_np = of_find_compatible_node(NULL, NULL, "renesas,r9a07g044-pinctrl");
+	if (!pinctrl_np)
+		return NULL;
+
+	pinctrl_domain = irq_find_host(pinctrl_np);
+	of_node_put(pinctrl_np);
+
+	return pinctrl_domain;
+}
+
+static struct irqc_priv *irq_data_to_priv(struct irq_data *data)
+{
+	return data->domain->host_data;
+}
+
+static void rzg2l_tint_set_edge(struct irqc_priv *priv,
+				u32 bit, unsigned int irq_type)
+{
+	u32 port_bit = bit;
+	u32 reg;
+
+	if (port_bit <= 15) {
+		reg = readl(priv->iomem + TITSR0);
+		reg &= ~(IRQ_MASK << (port_bit * 2));
+		reg |= irq_type << (port_bit * 2);
+		writel(reg, priv->iomem + TITSR0);
+	} else {
+		reg = readl(priv->iomem + TITSR1);
+		port_bit = port_bit / 2;
+		reg &= ~(IRQ_MASK << (port_bit * 2));
+		reg |= irq_type << (port_bit * 2);
+		writel(reg, priv->iomem + TITSR1);
+	}
+}
+
+static int rzg2l_tint_set_type(struct irq_data *d, unsigned int type)
+{
+	struct rzg2l_pin_info *pin_info = d->chip_data;
+	struct irqc_priv *priv = irq_data_to_priv(d);
+	u8 irq_type;
+
+	pin_info->trigger_type = type & GENMASK(15, 0);
+	pin_info->pin_state = ((type & ~GENMASK(15, 0)) >> 15);
+	pin_info->type = pin_info->trigger_type;
+
+	if (pin_info->trigger_type & BIT(0))
+		irq_type = RISING_EDGE;
+	else if (pin_info->trigger_type & BIT(1))
+		irq_type = FALLING_EDGE;
+	else if (pin_info->trigger_type & BIT(2))
+		irq_type = HIGH_LEVEL;
+	else if (pin_info->trigger_type & BIT(3))
+		irq_type = LOW_LEVEL;
+	else if (pin_info->trigger_type & BIT(4))
+		irq_type = pin_info->pin_state ? FALLING_EDGE : RISING_EDGE;
+	else
+		return -EINVAL;
+
+	pin_info->trigger_type = irq_type;
+	rzg2l_tint_set_edge(priv, pin_info->bit, irq_type);
+
+	return 0;
+}
+
+static irqreturn_t rzg2l_irqc_tint_irq_handler(int irq, void *dev_id)
+{
+	struct irq_domain *pctl_irq_domain;
+	struct rzg2l_pin_info *pin_info;
+	struct irqc_irq *i = dev_id;
+	struct irqc_priv *priv = i->p;
+	struct irq_data *irq_data;
+	unsigned int offset;
+	u32 reg;
+
+	offset = irq - priv->irq[RZG2L_TINT_IRQ_START_INDEX].requested_irq;
+	pin_info = priv->irq[offset + RZG2L_TINT_IRQ_START_INDEX].pin;
+	if (!pin_info)
+		return IRQ_NONE;
+
+	irq_data = irq_domain_get_irq_data(priv->parent_domain, i->requested_irq);
+	if (!irq_data)
+		return IRQ_NONE;
+
+	pctl_irq_domain = rzg2l_get_pinctrl_domain(priv->dev);
+	if (!pctl_irq_domain)
+		return IRQ_NONE;
+
+	reg = readl(priv->iomem + TSCR);
+	reg &= ~BIT(offset);
+	writel(reg, priv->iomem + TSCR);
+
+	generic_handle_irq(irq_find_mapping(pctl_irq_domain,
+					    ((pin_info->port * 8) + pin_info->bit)));
+
+	if (pin_info->type & BIT(4)) {
+		pin_info->trigger_type = (pin_info->trigger_type == FALLING_EDGE) ?
+					RISING_EDGE : FALLING_EDGE;
+		rzg2l_tint_set_edge(priv, pin_info->bit, pin_info->trigger_type);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static void rzg2l_tint_irq_disable(struct irq_data *d)
+{
+	struct rzg2l_pin_info *pin_info = d->chip_data;
+	struct irqc_priv *priv = irq_data_to_priv(d);
+	u32 reg;
+
+	reg = readl(priv->iomem + TSSR(pin_info->id / 4));
+	reg &= ~(GENMASK(7, 0) << (pin_info->id % 4));
+	writel(reg, priv->iomem + TSSR(pin_info->id / 4));
+}
+
+static void rzg2l_tint_irq_enable(struct irq_data *d)
+{
+	struct rzg2l_pin_info *pin_info = d->chip_data;
+	struct irqc_priv *priv = irq_data_to_priv(d);
+	u32 gpioint;
+	u32 reg;
+
+	gpioint = rzg2l_gpio_irq_validate_id(pin_info->port, pin_info->bit);
+
+	reg = readl(priv->iomem + TSSR(pin_info->id / 4));
+	reg |= (BIT(7) | gpioint) << (8 * (pin_info->id % 4));
+	writel(reg, priv->iomem + TSSR(pin_info->id / 4));
+}
+
+static int rzg2l_irqc_domain_translate(struct irq_domain *domain,
+				       struct irq_fwspec *fwspec,
+				       unsigned long *hwirq,
+				       unsigned int *type)
+{
+	if (WARN_ON(fwspec->param_count < 2))
+		return -EINVAL;
+
+	*hwirq = fwspec->param[0];
+	*type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
+
+	return 0;
+}
+
+static int rzg2l_irqc_domain_alloc(struct irq_domain *domain,
+				   unsigned int virq, unsigned int nr_irqs,
+				   void *arg)
+{
+	struct irqc_priv *priv = domain->host_data;
+	struct irq_fwspec parent_fwspec;
+	struct rzg2l_pin_info *pin_info;
+	struct irq_data *irq_data;
+	irq_hw_number_t hwirq;
+	unsigned int type;
+	int gpioint;
+	u32 port;
+	int irq;
+	int ret;
+	u8 bit;
+
+	ret = rzg2l_irqc_domain_translate(domain, arg, &hwirq, &type);
+	if (ret)
+		return ret;
+
+	port = RZG2L_PIN_ID_TO_PORT(hwirq);
+	bit = RZG2L_PIN_ID_TO_PIN(hwirq);
+
+	switch (type) {
+	case IRQ_TYPE_EDGE_RISING:
+	case IRQ_TYPE_LEVEL_HIGH:
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		type = IRQ_TYPE_EDGE_RISING;
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		type = IRQ_TYPE_LEVEL_HIGH;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	gpioint = rzg2l_gpio_irq_validate_id(port, bit);
+	if (gpioint < 0)
+		return gpioint;
+
+	irq = bitmap_find_free_region(priv->tint_slot, RZG2L_TINT_MAX_INTERRUPTS, get_order(1));
+	if (irq < 0)
+		return -ENOSPC;
+
+	irq_data = irq_domain_get_irq_data(priv->parent_domain,
+			priv->irq[RZG2L_TINT_IRQ_START_INDEX + irq].requested_irq);
+	if (!irq_data) {
+		bitmap_release_region(priv->tint_slot, irq, get_order(1));
+		return -EINVAL;
+	}
+
+	pin_info = kzalloc(sizeof(*pin_info), GFP_KERNEL);
+	if (!pin_info) {
+		bitmap_release_region(priv->tint_slot, irq, get_order(1));
+		return -ENOMEM;
+	}
+
+	priv->irq[RZG2L_TINT_IRQ_START_INDEX + irq].pin = pin_info;
+	pin_info->port = port;
+	pin_info->bit = bit;
+	pin_info->id = irq;
+	ret = irq_domain_set_hwirq_and_chip(domain, virq, irq_data->hwirq,
+					    &priv->chip,
+					    pin_info);
+	if (ret) {
+		bitmap_release_region(priv->tint_slot, irq, get_order(1));
+		return ret;
+	}
+
+	/* parent is GIC */
+	parent_fwspec.fwnode = domain->parent->fwnode;
+	parent_fwspec.param_count = 3;
+	parent_fwspec.param[0] = 0;		/* SPI */
+	parent_fwspec.param[1] = irq_data->hwirq;
+	parent_fwspec.param[2] = type;
+
+	ret = irq_domain_alloc_irqs_parent(domain, virq, 1, &parent_fwspec);
+	if (ret)
+		bitmap_release_region(priv->tint_slot, irq, get_order(1));
+
+	return ret;
+}
+
+static void rzg2l_irqc_domain_free(struct irq_domain *domain, unsigned int virq,
+				   unsigned int nr_irqs)
+{
+	struct rzg2l_pin_info *pin_info;
+	struct irqc_priv *priv;
+	struct irq_data *data;
+
+	/* free the pin_info and release the bitmap */
+	data = irq_domain_get_irq_data(domain, virq);
+	if (data) {
+		priv = irq_data_to_priv(data);
+		pin_info = data->chip_data;
+		bitmap_release_region(priv->tint_slot, pin_info->id, get_order(1));
+		priv->irq[RZG2L_TINT_IRQ_START_INDEX + pin_info->id].pin = NULL;
+		kfree(pin_info);
+	}
+
+	irq_domain_free_irqs_common(domain, virq, nr_irqs);
+}
+
+static const struct irq_domain_ops rzg2l_irqc_domain_ops = {
+	.translate = rzg2l_irqc_domain_translate,
+	.alloc = rzg2l_irqc_domain_alloc,
+	.free = rzg2l_irqc_domain_free,
+};
+
+static int irqc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	const char *name = dev_name(dev);
+	struct irq_domain *parent_domain;
+	struct device_node *parent_np;
+	struct irqc_priv *p;
+	struct resource *irq;
+	int ret;
+	int k;
+
+	parent_np = of_irq_find_parent(dev->of_node);
+	if (!parent_np)
+		return -ENXIO;
+
+	parent_domain = irq_find_host(parent_np);
+	of_node_put(parent_np);
+	if (!parent_domain)
+		return -EPROBE_DEFER;
+
+	p = devm_kzalloc(dev, sizeof(*p), GFP_KERNEL);
+	if (!p)
+		return -ENOMEM;
+
+	p->parent_domain = parent_domain;
+	p->clk = devm_clk_get(&pdev->dev, "clk");
+	if (IS_ERR(p->clk))
+		return PTR_ERR(p->clk);
+
+	p->pclk = devm_clk_get(&pdev->dev, "pclk");
+	if (IS_ERR(p->pclk))
+		return PTR_ERR(p->pclk);
+
+	ret = clk_prepare_enable(p->clk);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to enable main clock, error %d\n", ret);
+		return ret;
+	}
+
+	ret = clk_prepare_enable(p->pclk);
+	if (ret) {
+		clk_disable_unprepare(p->clk);
+		dev_err(&pdev->dev, "failed to enable REG access clock, error %d\n", ret);
+		return ret;
+	}
+
+	p->dev = dev;
+	platform_set_drvdata(pdev, p);
+
+	pm_runtime_enable(dev);
+	pm_runtime_get_sync(dev);
+
+	for (k = 0; k < RZG2L_IRQC_IRQ_MAX; k++) {
+		irq = platform_get_resource(pdev, IORESOURCE_IRQ, k);
+		if (!irq)
+			break;
+
+		p->irq[k].p = p;
+		p->irq[k].hw_irq = k;
+		p->irq[k].requested_irq = irq->start;
+	}
+
+	p->number_of_irqs = k;
+	if (p->number_of_irqs < 1) {
+		dev_err(dev, "not enough IRQ resources\n");
+		ret = -EINVAL;
+		goto err_runtime_pm_disable;
+	}
+
+	p->iomem = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(p->iomem)) {
+		ret = PTR_ERR(p->iomem);
+		goto err_runtime_pm_disable;
+	}
+
+	p->chip.name = "rzg2l-irqc",
+	p->chip.irq_disable = rzg2l_tint_irq_disable,
+	p->chip.irq_enable = rzg2l_tint_irq_enable,
+	p->chip.irq_set_type = rzg2l_tint_set_type,
+	p->chip.flags = IRQCHIP_MASK_ON_SUSPEND;
+
+	p->irq_domain = irq_domain_create_hierarchy(parent_domain, 0,
+						    p->number_of_irqs,
+						    of_node_to_fwnode(dev->of_node),
+						    &rzg2l_irqc_domain_ops, p);
+	if (!p->irq_domain) {
+		ret = -ENXIO;
+		dev_err(dev, "cannot initialize irq domain\n");
+		goto err_runtime_pm_disable;
+	}
+
+	/* request interrupts one by one for TINT */
+	for (k = RZG2L_TINT_IRQ_START_INDEX; k < RZG2L_IRQC_IRQ_MAX; k++) {
+		if (devm_request_irq(dev, p->irq[k].requested_irq,
+				     rzg2l_irqc_tint_irq_handler, IRQF_SHARED, name, &p->irq[k])) {
+			dev_err(dev, "failed to request IRQ\n");
+			ret = -ENOENT;
+			goto err_remove_domain;
+		}
+	}
+
+	dev_info(dev, "driving %d irqs\n", p->number_of_irqs);
+
+	return 0;
+
+err_remove_domain:
+	irq_domain_remove(p->irq_domain);
+err_runtime_pm_disable:
+	pm_runtime_put(dev);
+	pm_runtime_disable(dev);
+	return ret;
+}
+
+static int irqc_remove(struct platform_device *pdev)
+{
+	struct irqc_priv *p = platform_get_drvdata(pdev);
+
+	irq_domain_remove(p->irq_domain);
+	pm_runtime_put(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+	return 0;
+}
+
+static int __maybe_unused irqc_suspend(struct device *dev)
+{
+	struct irqc_priv *p = dev_get_drvdata(dev);
+
+	if (atomic_read(&p->wakeup_path))
+		device_set_wakeup_path(dev);
+
+	return 0;
+}
+
+static SIMPLE_DEV_PM_OPS(irqc_pm_ops, irqc_suspend, NULL);
+
+static const struct of_device_id irqc_dt_ids[] = {
+	{ .compatible = "renesas,rzg2l-irqc", },
+	{}
+};
+MODULE_DEVICE_TABLE(of, irqc_dt_ids);
+
+static struct platform_driver irqc_device_driver = {
+	.probe		= irqc_probe,
+	.remove		= irqc_remove,
+	.driver		= {
+		.name	= "rzg2l_irqc",
+		.of_match_table = irqc_dt_ids,
+		.pm	= &irqc_pm_ops,
+	}
+};
+
+static int __init irqc_init(void)
+{
+	return platform_driver_register(&irqc_device_driver);
+}
+postcore_initcall(irqc_init);
+
+static void __exit irqc_exit(void)
+{
+	platform_driver_unregister(&irqc_device_driver);
+}
+module_exit(irqc_exit);
diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 71b44c31b012..b5059774cb45 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -281,6 +281,7 @@ config ARCH_R8A774B1
 
 config ARCH_R9A07G044
 	bool "ARM64 Platform support for RZ/G2L"
+	select RENESAS_RZG2L_IRQC
 	help
 	  This enables support for the Renesas RZ/G2L SoC variants.
 
-- 
2.17.1

