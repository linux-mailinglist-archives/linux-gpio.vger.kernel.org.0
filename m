Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80714413AC5
	for <lists+linux-gpio@lfdr.de>; Tue, 21 Sep 2021 21:30:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234526AbhIUTcR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 21 Sep 2021 15:32:17 -0400
Received: from relmlor1.renesas.com ([210.160.252.171]:29954 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232287AbhIUTcP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 21 Sep 2021 15:32:15 -0400
X-IronPort-AV: E=Sophos;i="5.85,311,1624287600"; 
   d="scan'208";a="94607074"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 22 Sep 2021 04:30:45 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 367CD40E82C9;
        Wed, 22 Sep 2021 04:30:43 +0900 (JST)
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
Subject: [RFC PATCH v2 3/4] pinctrl: renesas: pinctrl-rzg2l: Add IRQ domain to handle GPIO interrupt
Date:   Tue, 21 Sep 2021 20:30:27 +0100
Message-Id: <20210921193028.13099-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210921193028.13099-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210921193028.13099-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add IRQ domian to RZ/G2L pinctrl driver to handle GPIO interrupt.

GPIO0-GPIO122 pins can be used as IRQ lines but only 32 pins can be
used as IRQ lines at given time. Selection of pins as IRQ lines
is handled by IA55 (which is the IRQC block) which sits in between the
GPIO and GIC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 214 ++++++++++++++++++++++++
 1 file changed, 214 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index dbf2f521bb27..222fbcebecde 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -9,8 +9,10 @@
 #include <linux/clk.h>
 #include <linux/gpio/driver.h>
 #include <linux/io.h>
+#include <linux/interrupt.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/of_irq.h>
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinctrl.h>
@@ -87,6 +89,7 @@
 #define PFC(n)			(0x0400 + 0x40 + (n) * 4)
 #define PIN(n)			(0x0800 + 0x10 + (n))
 #define IEN(n)			(0x1800 + (n) * 8)
+#define ISEL(n)			(0x2C80 + (n) * 8)
 #define PWPR			(0x3014)
 #define SD_CH(n)		(0x3000 + (n) * 4)
 #define QSPI			(0x3008)
@@ -108,6 +111,9 @@
 #define RZG2L_PIN_ID_TO_PORT(id)	((id) / RZG2L_PINS_PER_PORT)
 #define RZG2L_PIN_ID_TO_PIN(id)		((id) % RZG2L_PINS_PER_PORT)
 
+#define RZG2L_TINT_MAX_INTERRUPT	32
+#define RZG2L_TINT_IRQ_START_INDEX	9
+
 struct rzg2l_dedicated_configs {
 	const char *name;
 	u32 config;
@@ -133,10 +139,17 @@ struct rzg2l_pinctrl {
 
 	struct gpio_chip		gpio_chip;
 	struct pinctrl_gpio_range	gpio_range;
+	struct irq_chip			irq_chip;
+	struct irq_domain		*domain;
 
 	spinlock_t			lock;
 };
 
+struct rzg2l_pinctrl_irq_chip_data {
+	struct rzg2l_pinctrl *pctrl;
+	unsigned int irq;
+};
+
 static void rzg2l_pinctrl_set_pfc_mode(struct rzg2l_pinctrl *pctrl,
 				       u8 port, u8 pin, u8 func)
 {
@@ -782,6 +795,22 @@ static void rzg2l_gpio_free(struct gpio_chip *chip, unsigned int offset)
 	rzg2l_gpio_direction_input(chip, offset);
 }
 
+static int rzg2l_gpio_to_irq(struct gpio_chip *chip, unsigned int offset)
+{
+	struct irq_fwspec fwspec;
+
+	fwspec.fwnode = of_node_to_fwnode(chip->parent->of_node);
+	fwspec.param_count = 2;
+	fwspec.param[0] = offset;
+	/*
+	 * IRQ_TYPE_NONE is rejected by the parent irq domain. Set EDGE_RISING
+	 * temporarily. Anyway, ->irq_set_type() will override it later.
+	 */
+	fwspec.param[1] = IRQ_TYPE_EDGE_RISING;
+
+	return irq_create_fwspec_mapping(&fwspec);
+}
+
 static const char * const rzg2l_gpio_names[] = {
 	"P0_0", "P0_1", "P0_2", "P0_3", "P0_4", "P0_5", "P0_6", "P0_7",
 	"P1_0", "P1_1", "P1_2", "P1_3", "P1_4", "P1_5", "P1_6", "P1_7",
@@ -965,14 +994,183 @@ static  struct rzg2l_dedicated_configs rzg2l_dedicated_pins[] = {
 	{ "RIIC1_SCL", RZG2L_SINGLE_PIN_PACK(0xe, 3, PIN_CFG_IEN) },
 };
 
+static int rzg2l_gpio_get_gpioint(unsigned int virq)
+{
+	unsigned int gpioint = 0;
+	unsigned int i = 0;
+	u32 port, bit;
+
+	port = virq / 8;
+	bit = virq % 8;
+
+	if (port >= ARRAY_SIZE(rzg2l_gpio_configs))
+		return -EINVAL;
+
+	for (i = 0; i < port; i++)
+		gpioint += RZG2L_GPIO_PORT_GET_PINCNT(rzg2l_gpio_configs[i]);
+
+	if (bit >= RZG2L_GPIO_PORT_GET_PINCNT(rzg2l_gpio_configs[i]))
+		return -EINVAL;
+
+	gpioint += bit;
+
+	return gpioint;
+}
+
+static int rzg2l_gpio_irq_domain_alloc(struct irq_domain *domain,
+				       unsigned int virq,
+				       unsigned int nr_irqs, void *arg)
+{
+	struct rzg2l_pinctrl_irq_chip_data *chip_data = NULL;
+	struct rzg2l_pinctrl *pctrl = domain->host_data;
+	struct irq_fwspec parent_fwspec;
+	irq_hw_number_t hwirq;
+	unsigned int type;
+	int irq, ret;
+	int gpioint;
+
+	if (WARN_ON(nr_irqs != 1))
+		return -EINVAL;
+
+	ret = irq_domain_translate_twocell(domain, arg, &hwirq, &type);
+	if (ret)
+		return ret;
+
+	gpioint = rzg2l_gpio_get_gpioint(hwirq);
+	if (gpioint < 0)
+		return ret;
+
+	chip_data = kzalloc(sizeof(*chip_data), GFP_KERNEL);
+	if (!chip_data)
+		return -ENOMEM;
+
+	chip_data->pctrl = pctrl;
+	chip_data->irq = irq;
+	ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
+					    &pctrl->irq_chip, chip_data);
+	if (ret)
+		goto free_data;
+
+	/* parent is IRQC */
+	parent_fwspec.fwnode = domain->parent->fwnode;
+	parent_fwspec.param_count = 3;
+	parent_fwspec.param[0] = gpioint;
+	parent_fwspec.param[1] = type;
+	parent_fwspec.param[2] = 1;
+	ret = irq_domain_alloc_irqs_parent(domain, virq, 1, &parent_fwspec);
+	if (ret)
+		goto free_data;
+
+	return 0;
+
+free_data:
+	kfree(chip_data);
+	return ret;
+}
+
+static void rzg2l_gpio_irq_domain_free(struct irq_domain *domain, unsigned int virq,
+				       unsigned int nr_irqs)
+{
+	struct rzg2l_pinctrl_irq_chip_data *chip_data;
+	struct irq_data *d;
+
+	d = irq_domain_get_irq_data(domain, virq);
+	if (d) {
+		chip_data = d->chip_data;
+		kfree(chip_data);
+	}
+
+	irq_domain_free_irqs_common(domain, virq, nr_irqs);
+}
+
+static const struct irq_domain_ops rzg2l_gpio_irq_domain_ops = {
+	.alloc = rzg2l_gpio_irq_domain_alloc,
+	.free = rzg2l_gpio_irq_domain_free,
+	.translate = irq_domain_translate_twocell,
+};
+
+static void rzg2l_gpio_irq_disable(struct irq_data *d)
+{
+	struct rzg2l_pinctrl_irq_chip_data *chip_data = d->chip_data;
+	struct rzg2l_pinctrl *pctrl = chip_data->pctrl;
+	int hwirq = irqd_to_hwirq(d);
+	unsigned long flags;
+	void __iomem *addr;
+	u32 port;
+	u8 bit;
+
+	port = RZG2L_PIN_ID_TO_PORT(hwirq);
+	bit = RZG2L_PIN_ID_TO_PIN(hwirq);
+
+	addr = pctrl->base + ISEL(port);
+	if (bit >= 4) {
+		bit -= 4;
+		addr += 4;
+	}
+
+	spin_lock_irqsave(&pctrl->lock, flags);
+	writel(readl(addr) & ~BIT(bit * 8), addr);
+	spin_unlock_irqrestore(&pctrl->lock, flags);
+
+	irq_chip_disable_parent(d);
+}
+
+static void rzg2l_gpio_irq_enable(struct irq_data *d)
+{
+	struct rzg2l_pinctrl_irq_chip_data *chip_data = d->chip_data;
+	struct rzg2l_pinctrl *pctrl = chip_data->pctrl;
+	int hwirq = irqd_to_hwirq(d);
+	unsigned long flags;
+	void __iomem *addr;
+	u32 port;
+	u8 bit;
+
+	port = RZG2L_PIN_ID_TO_PORT(hwirq);
+	bit = RZG2L_PIN_ID_TO_PIN(hwirq);
+
+	addr = pctrl->base + ISEL(port);
+	if (bit >= 4) {
+		bit -= 4;
+		addr += 4;
+	}
+
+	spin_lock_irqsave(&pctrl->lock, flags);
+	writel(readl(addr) | BIT(bit * 8), addr);
+	spin_unlock_irqrestore(&pctrl->lock, flags);
+
+	irq_chip_enable_parent(d);
+}
+
+static int rzg2l_gpio_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	return irq_chip_set_type_parent(d, type);
+}
+
+static void rzg2l_gpio_irqc_eoi(struct irq_data *d)
+{
+	/* we have nothing to do here */
+}
+
 static int rzg2l_gpio_register(struct rzg2l_pinctrl *pctrl)
 {
+	struct irq_chip *irq_chip = &pctrl->irq_chip;
 	struct device_node *np = pctrl->dev->of_node;
 	struct gpio_chip *chip = &pctrl->gpio_chip;
 	const char *name = dev_name(pctrl->dev);
+	struct irq_domain *parent_domain;
 	struct of_phandle_args of_args;
+	struct device_node *parent_np;
 	int ret;
 
+	parent_np = of_irq_find_parent(np);
+	if (!parent_np)
+		return -ENXIO;
+
+	parent_domain = irq_find_host(parent_np);
+	of_node_put(parent_np);
+	if (!parent_domain)
+		return -EPROBE_DEFER;
+
 	ret = of_parse_phandle_with_fixed_args(np, "gpio-ranges", 3, 0, &of_args);
 	if (ret) {
 		dev_err(pctrl->dev, "Unable to parse gpio-ranges\n");
@@ -991,6 +1189,7 @@ static int rzg2l_gpio_register(struct rzg2l_pinctrl *pctrl)
 	chip->get_direction = rzg2l_gpio_get_direction;
 	chip->direction_input = rzg2l_gpio_direction_input;
 	chip->direction_output = rzg2l_gpio_direction_output;
+	chip->to_irq = rzg2l_gpio_to_irq;
 	chip->get = rzg2l_gpio_get;
 	chip->set = rzg2l_gpio_set;
 	chip->label = name;
@@ -999,6 +1198,13 @@ static int rzg2l_gpio_register(struct rzg2l_pinctrl *pctrl)
 	chip->base = -1;
 	chip->ngpio = of_args.args[2];
 
+	irq_chip->name = chip->label;
+	irq_chip->irq_disable = rzg2l_gpio_irq_disable;
+	irq_chip->irq_enable = rzg2l_gpio_irq_enable;
+	irq_chip->irq_set_type = rzg2l_gpio_irq_set_type;
+	irq_chip->irq_eoi = rzg2l_gpio_irqc_eoi;
+	irq_chip->flags = IRQCHIP_SET_TYPE_MASKED;
+
 	pctrl->gpio_range.id = 0;
 	pctrl->gpio_range.pin_base = 0;
 	pctrl->gpio_range.base = 0;
@@ -1011,6 +1217,14 @@ static int rzg2l_gpio_register(struct rzg2l_pinctrl *pctrl)
 		return ret;
 	}
 
+	pctrl->domain = irq_domain_create_hierarchy(parent_domain, 0,
+						    RZG2L_TINT_MAX_INTERRUPT,
+						    of_node_to_fwnode(np),
+						    &rzg2l_gpio_irq_domain_ops,
+						    pctrl);
+	if (!pctrl->domain)
+		return -ENOMEM;
+
 	dev_dbg(pctrl->dev, "Registered gpio controller\n");
 
 	return 0;
-- 
2.17.1

