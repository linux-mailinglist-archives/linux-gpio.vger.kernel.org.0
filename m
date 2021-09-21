Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7359C413ACB
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Sep 2021 21:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232183AbhIUTeM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Sep 2021 15:34:12 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:18568 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S234535AbhIUTcM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Sep 2021 15:32:12 -0400
X-IronPort-AV: E=Sophos;i="5.85,311,1624287600"; 
   d="scan'208";a="94721291"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 22 Sep 2021 04:30:42 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 3FB3F40E82D8;
        Wed, 22 Sep 2021 04:30:40 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH v2 2/4] irqchip: Add RZ/G2L IA55 Interrupt Controller driver
Date:   Tue, 21 Sep 2021 20:30:26 +0100
Message-Id: <20210921193028.13099-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210921193028.13099-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210921193028.13099-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a driver for the Renesas RZ/G2L Interrupt Controller.

This supports external pins being used as interrupts. It supports
one line for NMI, 8 external pins and 32 GPIO pins (out of 123)
to be used as IRQ lines.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/irqchip/Kconfig             |   9 +
 drivers/irqchip/Makefile            |   1 +
 drivers/irqchip/irq-renesas-rzg2l.c | 393 ++++++++++++++++++++++++++++
 drivers/soc/renesas/Kconfig         |   1 +
 4 files changed, 404 insertions(+)
 create mode 100644 drivers/irqchip/irq-renesas-rzg2l.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 4d5924e9f766..b61dceac8628 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -236,6 +236,15 @@ config RENESAS_RZA1_IRQC
 	  Enable support for the Renesas RZ/A1 Interrupt Controller, to use up
 	  to 8 external interrupts with configurable sense select.
 
+config RENESAS_RZG2L_IRQC
+	bool "Renesas RZ/G2L IRQC support" if COMPILE_TEST
+	select GENERIC_IRQ_CHIP
+	select IRQ_DOMAIN
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
index 000000000000..8057fdf6781b
--- /dev/null
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -0,0 +1,393 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/G2L IRQC Driver
+ *
+ * Copyright (C) 2021 Renesas Electronics Corporation.
+ */
+
+#include <linux/err.h>
+#include <linux/init.h>
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/irq.h>
+#include <linux/irqchip/chained_irq.h>
+#include <linux/irqdesc.h>
+#include <linux/irqdomain.h>
+#include <linux/module.h>
+#include <linux/of_irq.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#define IRQC_IRQ_START			1
+#define IRQC_IRQ_COUNT			8
+#define IRQC_TINT_START			9
+#define IRQC_TINT_COUNT			32
+#define IRQC_NUM_IRQ			41
+
+#define ISCR				0x10
+#define IITSR				0x14
+#define TSCR				0x20
+#define TITSR0				0x24
+#define TITSR1				0x28
+#define TITSR0_MAX_INT			16
+#define TITSEL_WIDTH			0x2
+#define TSSR(n)				(0x30 + ((n) * 4))
+#define TIEN				BIT(7)
+#define TSSEL_SHIFT(n)			(8 * (n))
+#define TSSEL_MASK			GENMASK(7, 0)
+#define IRQ_MASK			0x3
+
+#define TSSR_OFFSET(n)			((n) % 4)
+#define TSSR_INDEX(n)			((n) / 4)
+
+#define TITSR_TITSEL_EDGE_RISING	0
+#define TITSR_TITSEL_EDGE_FALLING	1
+#define TITSR_TITSEL_LEVEL_HIGH		2
+#define TITSR_TITSEL_LEVEL_LOW		3
+
+struct rzg2l_irqc_priv {
+	void __iomem *base;
+	struct device *dev;
+	struct irq_chip chip;
+	struct irq_domain *irq_domain;
+	struct resource *irq[IRQC_NUM_IRQ];
+	struct mutex irqc_mutex;
+	struct mutex tint_mutex; /* Mutex to protect tint_slot bitmap */
+	DECLARE_BITMAP(tint_slot, IRQC_TINT_COUNT);
+};
+
+struct rzg2l_irqc_chip_data {
+	struct rzg2l_irqc_priv *priv;
+	int tint;
+	int hwirq;
+};
+
+static int rzg2l_tint_set_edge(struct rzg2l_irqc_priv *priv,
+			       unsigned int hwirq, unsigned int type)
+{
+	u32 port = hwirq - IRQC_TINT_START;
+	u8 sense;
+	u32 reg;
+
+	switch (type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_EDGE_RISING:
+		sense = TITSR_TITSEL_EDGE_RISING;
+		break;
+
+	case IRQ_TYPE_EDGE_FALLING:
+		sense = TITSR_TITSEL_EDGE_FALLING;
+		break;
+
+	case IRQ_TYPE_LEVEL_HIGH:
+		sense = TITSR_TITSEL_LEVEL_HIGH;
+		break;
+
+	case IRQ_TYPE_LEVEL_LOW:
+		sense = TITSR_TITSEL_LEVEL_LOW;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	mutex_lock(&priv->irqc_mutex);
+	if (port < TITSR0_MAX_INT) {
+		reg = readl_relaxed(priv->base + TITSR0);
+		reg &= ~(IRQ_MASK << (port * TITSEL_WIDTH));
+		reg |= sense << (port * TITSEL_WIDTH);
+		writel_relaxed(reg, priv->base + TITSR0);
+	} else {
+		port = port / TITSEL_WIDTH;
+		reg = readl_relaxed(priv->base + TITSR1);
+		reg &= ~(IRQ_MASK << (port * TITSEL_WIDTH));
+		reg |= sense << (port * TITSEL_WIDTH);
+		writel_relaxed(reg, priv->base + TITSR1);
+	}
+	mutex_unlock(&priv->irqc_mutex);
+
+	return 0;
+}
+
+static void rzg2l_irqc_tint_irq_handler(struct irq_desc *desc)
+{
+	unsigned int irq = irq_desc_get_irq(desc);
+	struct irq_chip *chip = irq_desc_get_chip(desc);
+	struct rzg2l_irqc_chip_data *chip_data = irq_get_handler_data(irq);
+	struct rzg2l_irqc_priv *priv = chip_data->priv;
+	unsigned int offset;
+	u32 reg;
+
+	chained_irq_enter(chip, desc);
+	offset = chip_data->hwirq - IRQC_TINT_START;
+	generic_handle_domain_irq(priv->irq_domain, chip_data->hwirq);
+	reg = readl_relaxed(priv->base + TSCR) & ~BIT(offset);
+	writel_relaxed(reg, priv->base + TSCR);
+	chained_irq_exit(chip, desc);
+}
+
+static void rzg2l_irqc_irq_disable(struct irq_data *d)
+{
+	struct rzg2l_irqc_chip_data *chip_data = d->chip_data;
+	struct rzg2l_irqc_priv *priv = chip_data->priv;
+
+	if (chip_data->tint != -EINVAL) {
+		u32 offset = chip_data->hwirq - IRQC_TINT_START;
+		u32 tssr_offset = TSSR_OFFSET(offset);
+		u8 tssr_index = TSSR_INDEX(offset);
+		u32 reg;
+
+		irq_set_chained_handler_and_data(priv->irq[chip_data->hwirq]->start,
+						 NULL, NULL);
+
+		mutex_lock(&priv->irqc_mutex);
+		reg = readl_relaxed(priv->base + TSSR(tssr_index));
+		reg &= ~(TSSEL_MASK << tssr_offset);
+		writel_relaxed(reg, priv->base + TSSR(tssr_index));
+		mutex_unlock(&priv->irqc_mutex);
+	}
+}
+
+static void rzg2l_irqc_irq_enable(struct irq_data *d)
+{
+	struct rzg2l_irqc_chip_data *chip_data = d->chip_data;
+	struct rzg2l_irqc_priv *priv = chip_data->priv;
+
+	if (chip_data->tint != -EINVAL) {
+		u32 offset = chip_data->hwirq - IRQC_TINT_START;
+		u32 tssr_offset = TSSR_OFFSET(offset);
+		u8 tssr_index = TSSR_INDEX(offset);
+		u32 reg;
+
+		irq_set_chained_handler_and_data(priv->irq[chip_data->hwirq]->start,
+						 rzg2l_irqc_tint_irq_handler,
+						 chip_data);
+
+		mutex_lock(&priv->irqc_mutex);
+		reg = readl_relaxed(priv->base + TSSR(tssr_index));
+		reg |= (TIEN | chip_data->tint) << TSSEL_SHIFT(tssr_offset);
+		writel_relaxed(reg, priv->base + TSSR(tssr_index));
+		mutex_unlock(&priv->irqc_mutex);
+	}
+}
+
+static int rzg2l_irqc_set_type(struct irq_data *d, unsigned int type)
+{
+	struct rzg2l_irqc_chip_data *chip_data = d->chip_data;
+	struct rzg2l_irqc_priv *priv = chip_data->priv;
+
+	if (chip_data->tint != EINVAL)
+		return rzg2l_tint_set_edge(priv, chip_data->hwirq, type);
+
+	return -EINVAL;
+}
+
+static int rzg2l_irqc_domain_alloc(struct irq_domain *domain, unsigned int virq,
+				   unsigned int nr_irqs, void *arg)
+{
+	struct rzg2l_irqc_priv *priv = domain->host_data;
+	struct rzg2l_irqc_chip_data *chip_data = NULL;
+	struct irq_fwspec parent_fwspec;
+	struct irq_fwspec *fwspec = arg;
+	int tint = -EINVAL;
+	irq_hw_number_t hwirq;
+	int irq = -EINVAL;
+	unsigned int type;
+	int ret;
+
+	chip_data = kzalloc(sizeof(*chip_data), GFP_KERNEL);
+	if (!chip_data)
+		return -ENOMEM;
+
+	ret = irq_domain_translate_twocell(domain, arg, &hwirq, &type);
+	if (ret)
+		return ret;
+
+	/*
+	 * When alloc has landed from pinctrl driver:
+	 * fwspec->param_count = 3
+	 * fwspec->param[0] = tint
+	 * fwspec->param[1] = type
+	 * fwspec->param[2] = 1
+	 */
+	if (fwspec->param_count == 3 && fwspec->param[2]) {
+		mutex_lock(&priv->tint_mutex);
+		irq = bitmap_find_free_region(priv->tint_slot, IRQC_TINT_COUNT, get_order(1));
+		if (irq < 0) {
+			mutex_unlock(&priv->tint_mutex);
+			return -ENOSPC;
+		}
+		mutex_unlock(&priv->tint_mutex);
+		tint = hwirq;
+		hwirq = irq + IRQC_TINT_START;
+	}
+
+	chip_data->priv = priv;
+	chip_data->tint = tint;
+	chip_data->hwirq = hwirq;
+	ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq, &priv->chip, chip_data);
+	if (ret)
+		goto release_bitmap;
+
+	/* parent is GIC */
+	parent_fwspec.fwnode = domain->parent->fwnode;
+	parent_fwspec.param_count = 3;
+	parent_fwspec.param[0] = 0; /* SPI */
+	parent_fwspec.param[1] = priv->irq[hwirq]->start;
+	parent_fwspec.param[2] = IRQ_TYPE_LEVEL_HIGH;
+	ret = irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, &parent_fwspec);
+	if (ret)
+		goto release_bitmap;
+
+	return 0;
+
+release_bitmap:
+	if (tint != -EINVAL) {
+		mutex_lock(&priv->tint_mutex);
+		bitmap_release_region(priv->tint_slot, irq, get_order(1));
+		mutex_unlock(&priv->tint_mutex);
+	}
+	kfree(chip_data);
+	return ret;
+}
+
+static void rzg2l_irqc_domain_free(struct irq_domain *domain, unsigned int virq,
+				   unsigned int nr_irqs)
+{
+	struct rzg2l_irqc_chip_data *chip_data;
+	struct rzg2l_irqc_priv *priv;
+	struct irq_data *d;
+
+	d = irq_domain_get_irq_data(domain, virq);
+	if (d) {
+		chip_data = d->chip_data;
+		priv = chip_data->priv;
+		if (chip_data) {
+			if (chip_data->tint != -EINVAL) {
+				mutex_lock(&priv->tint_mutex);
+				bitmap_release_region(priv->tint_slot,
+						      chip_data->hwirq - IRQC_TINT_START,
+						      get_order(1));
+				mutex_unlock(&priv->tint_mutex);
+			}
+			kfree(chip_data);
+		}
+	}
+
+	irq_domain_free_irqs_common(domain, virq, nr_irqs);
+}
+
+static const struct irq_domain_ops rzg2l_irqc_domain_ops = {
+	.alloc = rzg2l_irqc_domain_alloc,
+	.free = rzg2l_irqc_domain_free,
+	.translate = irq_domain_translate_twocell,
+};
+
+static int rzg2l_irqc_probe(struct platform_device *pdev)
+{
+	struct irq_domain *parent_irq_domain;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct device_node *gic_node;
+	struct rzg2l_irqc_priv *priv;
+	unsigned int i;
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	platform_set_drvdata(pdev, priv);
+	priv->dev = dev;
+
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(priv->base))
+		return PTR_ERR(priv->base);
+
+	gic_node = of_irq_find_parent(np);
+	if (gic_node)
+		parent_irq_domain = irq_find_host(gic_node);
+
+	if (!parent_irq_domain) {
+		dev_err(dev, "cannot find parent domain\n");
+		ret = -ENODEV;
+		goto out_put_node;
+	}
+
+	for (i = 0; i < IRQC_NUM_IRQ; i++) {
+		priv->irq[i] = platform_get_resource(pdev, IORESOURCE_IRQ, i);
+		if (!priv->irq[i]) {
+			ret = -ENOENT;
+			dev_err(dev, "failed to get irq resource(%u)", i);
+			goto out_put_node;
+		}
+	}
+
+	mutex_init(&priv->irqc_mutex);
+	mutex_init(&priv->tint_mutex);
+	pm_runtime_enable(&pdev->dev);
+	pm_runtime_resume_and_get(&pdev->dev);
+
+	priv->chip.name = "rzg2l-irqc";
+	priv->chip.irq_mask = irq_chip_mask_parent;
+	priv->chip.irq_unmask = irq_chip_unmask_parent;
+	priv->chip.irq_enable = rzg2l_irqc_irq_enable;
+	priv->chip.irq_disable = rzg2l_irqc_irq_disable;
+	priv->chip.irq_retrigger = irq_chip_retrigger_hierarchy;
+	priv->chip.irq_set_type = rzg2l_irqc_set_type;
+	priv->chip.flags = IRQCHIP_MASK_ON_SUSPEND | IRQCHIP_SKIP_SET_WAKE;
+	priv->irq_domain = irq_domain_add_hierarchy(parent_irq_domain, 0,
+						    IRQC_NUM_IRQ, np,
+						    &rzg2l_irqc_domain_ops,
+						    priv);
+	if (!priv->irq_domain) {
+		dev_err(dev, "cannot initialize irq domain\n");
+		ret = -ENOMEM;
+		pm_runtime_put(&pdev->dev);
+		pm_runtime_disable(&pdev->dev);
+		goto out_put_node;
+	}
+
+out_put_node:
+	of_node_put(gic_node);
+	return ret;
+}
+
+static int rzg2l_irqc_remove(struct platform_device *pdev)
+{
+	struct rzg2l_irqc_priv *priv = platform_get_drvdata(pdev);
+
+	irq_domain_remove(priv->irq_domain);
+	pm_runtime_put(&pdev->dev);
+	pm_runtime_disable(&pdev->dev);
+	return 0;
+}
+
+static const struct of_device_id rzg2l_irqc_dt_ids[] = {
+	{ .compatible = "renesas,rzg2l-irqc" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, rzg2l_irqc_dt_ids);
+
+static struct platform_driver rzg2l_irqc_device_driver = {
+	.probe		= rzg2l_irqc_probe,
+	.remove		= rzg2l_irqc_remove,
+	.driver		= {
+		.name	= "renesas_rzg2l_irqc",
+		.of_match_table	= rzg2l_irqc_dt_ids,
+	}
+};
+
+static int __init rzg2l_irqc_init(void)
+{
+	return platform_driver_register(&rzg2l_irqc_device_driver);
+}
+postcore_initcall(rzg2l_irqc_init);
+
+static void __exit rzg2l_irqc_exit(void)
+{
+	platform_driver_unregister(&rzg2l_irqc_device_driver);
+}
+module_exit(rzg2l_irqc_exit);
+
+MODULE_DESCRIPTION("Renesas RZ/G2L IRQC Driver");
+MODULE_LICENSE("GPL v2");
diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index ce16ef5c939c..fec93883c3b8 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -286,6 +286,7 @@ config ARCH_R8A774B1
 
 config ARCH_R9A07G044
 	bool "ARM64 Platform support for RZ/G2L"
+	select RENESAS_RZG2L_IRQC
 	help
 	  This enables support for the Renesas RZ/G2L SoC variants.
 
-- 
2.17.1

