Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B5E3744CD3D
	for <lists+linux-gpio@lfdr.de>; Wed, 10 Nov 2021 23:58:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234032AbhKJXBQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 10 Nov 2021 18:01:16 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:38670 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S233848AbhKJXBO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 10 Nov 2021 18:01:14 -0500
X-IronPort-AV: E=Sophos;i="5.87,225,1631545200"; 
   d="scan'208";a="99834525"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 11 Nov 2021 07:58:24 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id BF8884006CC7;
        Thu, 11 Nov 2021 07:58:21 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Marc Zyngier <maz@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc:     devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH v3 2/7] irqchip: Add RZ/G2L IA55 Interrupt Controller driver
Date:   Wed, 10 Nov 2021 22:58:03 +0000
Message-Id: <20211110225808.16388-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211110225808.16388-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20211110225808.16388-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add a driver for the Renesas RZ/G2L Interrupt Controller.

This supports external pins being used as interrupts. It supports
one line for NMI, 8 external pins and 32 GPIO pins (out of 123)
to be used as IRQ lines.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/irqchip/Kconfig             |   8 +
 drivers/irqchip/Makefile            |   1 +
 drivers/irqchip/irq-renesas-rzg2l.c | 465 ++++++++++++++++++++++++++++
 3 files changed, 474 insertions(+)
 create mode 100644 drivers/irqchip/irq-renesas-rzg2l.c

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 4d5924e9f766..79b8c9274fd7 100644
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
index 000000000000..4258b9752c3b
--- /dev/null
+++ b/drivers/irqchip/irq-renesas-rzg2l.c
@@ -0,0 +1,465 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Renesas RZ/G2L IRQC Driver
+ *
+ * Copyright (C) 2021 Renesas Electronics Corporation.
+ *
+ * Author: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/irqchip.h>
+#include <linux/irqdomain.h>
+#include <linux/of_address.h>
+#include <linux/reset.h>
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
+#define IITSR_IITSEL(n, sense)		((sense) << ((n) * 2))
+#define IITSR_IITSEL_LEVEL_LOW		0
+#define IITSR_IITSEL_EDGE_FALLING	1
+#define IITSR_IITSEL_EDGE_RISING	2
+#define IITSR_IITSEL_EDGE_BOTH		3
+#define IITSR_IITSEL_MASK(n)		IITSR_IITSEL((n), 3)
+
+#define TINT_EXTRACT_HWIRQ(x)		((x) & ~GENMASK(31, 16))
+#define TINT_EXTRACT_GPIOINT(x)		((x) >> 16)
+
+struct rzg2l_irqc_priv {
+	void __iomem *base;
+	struct of_phandle_args map[IRQC_NUM_IRQ];
+};
+
+struct rzg2l_irqc_chip_data {
+	int tint;
+};
+
+static struct rzg2l_irqc_priv *irq_data_to_priv(struct irq_data *data)
+{
+	return data->domain->host_data;
+}
+
+static void rzg2l_irq_eoi(struct irq_data *d)
+{
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+	unsigned int hw_irq = irqd_to_hwirq(d) - IRQC_IRQ_START;
+	u16 bit = BIT(hw_irq);
+	u32 reg;
+
+	reg = readl_relaxed(priv->base + ISCR);
+	if (reg & bit)
+		writel_relaxed(GENMASK(IRQC_IRQ_COUNT - 1, 0) & ~bit,
+			       priv->base + ISCR);
+
+	irq_chip_eoi_parent(d);
+}
+
+static void rzg2l_tint_eoi(struct irq_data *d)
+{
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+	unsigned int hw_irq = irqd_to_hwirq(d);
+	u32 bit = BIT(hw_irq - IRQC_TINT_START);
+	u32 reg;
+
+	reg = readl_relaxed(priv->base + TSCR);
+	if (reg & bit)
+		writel_relaxed(GENMASK(IRQC_TINT_COUNT - 1, 0) & ~bit,
+			       priv->base + TSCR);
+
+	irq_chip_eoi_parent(d);
+}
+
+static void rzg2l_irqc_eoi(struct irq_data *d)
+{
+	unsigned int hw_irq = irqd_to_hwirq(d);
+
+	if (hw_irq >= IRQC_IRQ_START && hw_irq <= IRQC_IRQ_COUNT)
+		return rzg2l_irq_eoi(d);
+	else if (hw_irq >= IRQC_TINT_START && hw_irq <= IRQC_TINT_COUNT)
+		return rzg2l_tint_eoi(d);
+}
+
+static void rzg2l_irqc_irq_disable(struct irq_data *d)
+{
+	unsigned int hw_irq = irqd_to_hwirq(d);
+
+	if (hw_irq >= IRQC_TINT_START && hw_irq <= IRQC_TINT_COUNT) {
+		struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+		u32 offset = hw_irq - IRQC_TINT_START;
+		u32 tssr_offset = TSSR_OFFSET(offset);
+		u8 tssr_index = TSSR_INDEX(offset);
+		u32 reg;
+
+		reg = readl_relaxed(priv->base + TSSR(tssr_index));
+		reg &= ~(TSSEL_MASK << tssr_offset);
+		writel_relaxed(reg, priv->base + TSSR(tssr_index));
+	}
+	irq_chip_disable_parent(d);
+}
+
+static void rzg2l_irqc_irq_enable(struct irq_data *d)
+{
+	unsigned int hw_irq = irqd_to_hwirq(d);
+
+	if (hw_irq >= IRQC_TINT_START && hw_irq <= IRQC_TINT_COUNT) {
+		struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+		struct rzg2l_irqc_chip_data *chip_data = d->chip_data;
+		u32 offset = hw_irq - IRQC_TINT_START;
+		u32 tssr_offset = TSSR_OFFSET(offset);
+		u8 tssr_index = TSSR_INDEX(offset);
+		u32 reg;
+
+		reg = readl_relaxed(priv->base + TSSR(tssr_index));
+		reg |= (TIEN | chip_data->tint) << TSSEL_SHIFT(tssr_offset);
+		writel_relaxed(reg, priv->base + TSSR(tssr_index));
+	}
+	irq_chip_enable_parent(d);
+}
+
+static int rzg2l_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+	unsigned int hw_irq = irqd_to_hwirq(d) - IRQC_IRQ_START;
+	u16 sense, tmp;
+
+	switch (type & IRQ_TYPE_SENSE_MASK) {
+	case IRQ_TYPE_LEVEL_LOW:
+		sense = IITSR_IITSEL_LEVEL_LOW;
+		break;
+
+	case IRQ_TYPE_EDGE_FALLING:
+		sense = IITSR_IITSEL_EDGE_FALLING;
+		break;
+
+	case IRQ_TYPE_EDGE_RISING:
+		sense = IITSR_IITSEL_EDGE_RISING;
+		break;
+
+	case IRQ_TYPE_EDGE_BOTH:
+		sense = IITSR_IITSEL_EDGE_BOTH;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	tmp = readl_relaxed(priv->base + IITSR);
+	tmp &= ~IITSR_IITSEL_MASK(hw_irq);
+	tmp |= IITSR_IITSEL(hw_irq, sense);
+	writel_relaxed(tmp, priv->base + IITSR);
+
+	return 0;
+}
+
+static int rzg2l_tint_set_edge(struct irq_data *d, unsigned int type)
+{
+	struct rzg2l_irqc_priv *priv = irq_data_to_priv(d);
+	unsigned int hwirq = irqd_to_hwirq(d);
+	u32 titseln = hwirq - IRQC_TINT_START;
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
+	default:
+		return -EINVAL;
+	}
+
+	if (titseln < TITSR0_MAX_INT) {
+		reg = readl_relaxed(priv->base + TITSR0);
+		reg &= ~(IRQ_MASK << (titseln * TITSEL_WIDTH));
+		reg |= sense << (titseln * TITSEL_WIDTH);
+		writel_relaxed(reg, priv->base + TITSR0);
+	} else {
+		titseln = titseln / TITSEL_WIDTH;
+		reg = readl_relaxed(priv->base + TITSR1);
+		reg &= ~(IRQ_MASK << (titseln * TITSEL_WIDTH));
+		reg |= sense << (titseln * TITSEL_WIDTH);
+		writel_relaxed(reg, priv->base + TITSR1);
+	}
+
+	return 0;
+}
+
+static int rzg2l_irqc_set_type(struct irq_data *d, unsigned int type)
+{
+	unsigned int hw_irq = irqd_to_hwirq(d);
+
+	if (hw_irq >= IRQC_IRQ_START && hw_irq <= IRQC_IRQ_COUNT)
+		return rzg2l_irq_set_type(d, type);
+	else if (hw_irq >= IRQC_TINT_START && hw_irq <= IRQC_TINT_COUNT)
+		return rzg2l_tint_set_edge(d, type);
+
+	return -EINVAL;
+}
+
+static struct irq_chip irqc_chip = {
+	.name			= "rzg2l-irqc",
+	.irq_eoi		= rzg2l_irqc_eoi,
+	.irq_mask		= irq_chip_mask_parent,
+	.irq_unmask		= irq_chip_unmask_parent,
+	.irq_disable		= rzg2l_irqc_irq_disable,
+	.irq_enable		= rzg2l_irqc_irq_enable,
+	.irq_get_irqchip_state	= irq_chip_get_parent_state,
+	.irq_set_irqchip_state	= irq_chip_set_parent_state,
+	.irq_retrigger		= irq_chip_retrigger_hierarchy,
+	.irq_set_type		= rzg2l_irqc_set_type,
+	.flags			= IRQCHIP_MASK_ON_SUSPEND |
+				  IRQCHIP_SET_TYPE_MASKED |
+				  IRQCHIP_SKIP_SET_WAKE,
+};
+
+static int rzg2l_irqc_alloc(struct irq_domain *domain, unsigned int virq,
+			    unsigned int nr_irqs, void *arg)
+{
+	struct rzg2l_irqc_priv *priv = domain->host_data;
+	struct rzg2l_irqc_chip_data *chip_data = NULL;
+	struct irq_fwspec spec;
+	irq_hw_number_t hwirq;
+	int tint = -EINVAL;
+	unsigned int type;
+	unsigned int i;
+	int ret;
+
+	ret = irq_domain_translate_twocell(domain, arg, &hwirq, &type);
+	if (ret)
+		return ret;
+
+	/*
+	 * For TINIT interrupts ie where pinctrl driver is child of irqc domain
+	 * the hwirq and TINT are encoded in fwspec->param[0].
+	 * hwirq for TINIT range from 9-40, hwirq is embedded 0-15 bits and TINT
+	 * from 16-31 bits. TINIT from the pinctrl drivers needs to be programmed
+	 * in IRQC registers to enable a given gpio pin as interrupt.
+	 */
+	if (hwirq > IRQC_IRQ_COUNT) {
+		tint = TINT_EXTRACT_GPIOINT(hwirq);
+		hwirq = TINT_EXTRACT_HWIRQ(hwirq);
+	}
+
+	if (hwirq > (IRQC_NUM_IRQ - 1))
+		return -EINVAL;
+
+	if (tint != -EINVAL && (hwirq < IRQC_TINT_START || hwirq > (IRQC_NUM_IRQ - 1)))
+		return -EINVAL;
+
+	chip_data = kzalloc(sizeof(*chip_data), GFP_KERNEL);
+	if (!chip_data)
+		return -ENOMEM;
+	chip_data->tint = tint;
+
+	ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq, &irqc_chip,
+					    chip_data);
+	if (ret) {
+		kfree(chip_data);
+		return ret;
+	}
+
+	spec.fwnode = domain->parent->fwnode;
+	spec.param_count = priv->map[hwirq].args_count;
+	for (i = 0; i < spec.param_count; i++)
+		spec.param[i] = priv->map[hwirq].args[i];
+
+	ret = irq_domain_alloc_irqs_parent(domain, virq, nr_irqs, &spec);
+	if (ret)
+		kfree(chip_data);
+
+	return ret;
+}
+
+static void rzg2l_irqc_domain_free(struct irq_domain *domain, unsigned int virq,
+				   unsigned int nr_irqs)
+{
+	struct irq_data *d;
+
+	d = irq_domain_get_irq_data(domain, virq);
+	if (d) {
+		struct rzg2l_irqc_chip_data *chip_data = d->chip_data;
+
+		kfree(chip_data);
+	}
+	irq_domain_free_irqs_common(domain, virq, nr_irqs);
+}
+
+static const struct irq_domain_ops rzg2l_irqc_domain_ops = {
+	.alloc = rzg2l_irqc_alloc,
+	.free = rzg2l_irqc_domain_free,
+	.translate = irq_domain_translate_twocell,
+};
+
+static int rzg2l_irqc_parse_map(struct rzg2l_irqc_priv *priv,
+				struct device_node *np,
+				struct device_node *parent)
+{
+	unsigned int imaplen, i, j, ret;
+	struct device_node *ipar;
+	const __be32 *imap;
+	u32 intsize;
+
+	imap = of_get_property(np, "interrupt-map", &imaplen);
+	if (!imap)
+		return -EINVAL;
+
+	for (i = 0; i < IRQC_NUM_IRQ; i++) {
+		if (imaplen < 3)
+			return -EINVAL;
+
+		/* Check interrupt number, ignore sense */
+		if (be32_to_cpup(imap) != i)
+			return -EINVAL;
+
+		ipar = of_find_node_by_phandle(be32_to_cpup(imap + 2));
+		if (ipar != parent) {
+			of_node_put(ipar);
+			return -EINVAL;
+		}
+
+		imap += 3;
+		imaplen -= 3;
+
+		ret = of_property_read_u32(ipar, "#interrupt-cells", &intsize);
+		of_node_put(ipar);
+		if (ret)
+			return ret;
+
+		if (imaplen < intsize)
+			return -EINVAL;
+
+		priv->map[i].args_count = intsize;
+		for (j = 0; j < intsize; j++)
+			priv->map[i].args[j] = be32_to_cpup(imap++);
+
+		imaplen -= intsize;
+	}
+
+	return 0;
+}
+
+static int rzg2l_irqc_init(struct device_node *node, struct device_node *parent)
+{
+	struct irq_domain *irq_domain, *parent_domain;
+	struct reset_control *resetn;
+	struct rzg2l_irqc_priv *priv;
+	struct clk *clk;
+	struct clk *pclk;
+	int ret;
+
+	priv = kzalloc(sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->base = of_iomap(node, 0);
+	if (!priv->base) {
+		ret = -ENXIO;
+		goto free_priv;
+	}
+
+	clk = of_clk_get_by_name(node, "clk");
+	if (IS_ERR(clk)) {
+		ret = IS_ERR(clk);
+		goto iounmap_base;
+	}
+
+	pclk = of_clk_get_by_name(node, "pclk");
+	if (IS_ERR(pclk)) {
+		ret = IS_ERR(pclk);
+		goto iounmap_base;
+	}
+
+	resetn = of_reset_control_get_exclusive_by_index(node, 0);
+	if (IS_ERR(resetn)) {
+		ret = IS_ERR(resetn);
+		goto iounmap_base;
+	}
+
+	parent_domain = irq_find_host(parent);
+	if (!parent_domain) {
+		pr_err("%pOF: cannot find parent domain\n", node);
+		ret = -ENODEV;
+		goto iounmap_base;
+	}
+
+	ret = rzg2l_irqc_parse_map(priv, node, parent);
+	if (ret) {
+		pr_err("%pOF: cannot parse interrupt-map: %d\n", node, ret);
+		goto iounmap_base;
+	}
+
+	ret = reset_control_deassert(resetn);
+	if (ret) {
+		pr_err("%pOF: failed to deassert resetn pin, %d\n", node, ret);
+		goto iounmap_base;
+	}
+
+	ret = clk_prepare_enable(clk);
+	if (ret)
+		goto assert_reset;
+
+	ret = clk_prepare_enable(pclk);
+	if (ret)
+		goto disable_clk;
+
+	irq_domain = irq_domain_add_hierarchy(parent_domain, 0, IRQC_NUM_IRQ,
+					      node, &rzg2l_irqc_domain_ops,
+					      priv);
+	if (!irq_domain) {
+		pr_err("%pOF: cannot initialize irq domain\n", node);
+		ret = -ENOMEM;
+		goto fail_irq_domain;
+	}
+
+	return 0;
+
+fail_irq_domain:
+	clk_disable_unprepare(pclk);
+disable_clk:
+	clk_disable_unprepare(clk);
+assert_reset:
+	reset_control_assert(resetn);
+iounmap_base:
+	iounmap(priv->base);
+free_priv:
+	kfree(priv);
+	return ret;
+}
+
+IRQCHIP_PLATFORM_DRIVER_BEGIN(rzg2l_irqc)
+IRQCHIP_MATCH("renesas,rzg2l-irqc", rzg2l_irqc_init)
+IRQCHIP_PLATFORM_DRIVER_END(rzg2l_irqc)
+MODULE_AUTHOR("Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>");
+MODULE_DESCRIPTION("Renesas RZ/G2L IRQC Driver");
+MODULE_LICENSE("GPL v2");
-- 
2.17.1

