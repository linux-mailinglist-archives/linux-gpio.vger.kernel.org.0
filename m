Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57B403DF425
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Aug 2021 19:51:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238422AbhHCRvq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 3 Aug 2021 13:51:46 -0400
Received: from relmlor2.renesas.com ([210.160.252.172]:30078 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S238416AbhHCRvp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 3 Aug 2021 13:51:45 -0400
X-IronPort-AV: E=Sophos;i="5.84,292,1620658800"; 
   d="scan'208";a="89686387"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 04 Aug 2021 02:51:32 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id AFCA940BF9F8;
        Wed,  4 Aug 2021 02:51:29 +0900 (JST)
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
Subject: [RFC PATCH 3/4] pinctrl: renesas: pinctrl-rzg2l: Add IRQ domain to handle GPIO interrupt
Date:   Tue,  3 Aug 2021 18:51:08 +0100
Message-Id: <20210803175109.1729-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210803175109.1729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20210803175109.1729-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add IRQ domian to RZ/G2L pinctrl driver to handle GPIO interrupt.

GPIO (0-122) pins can be used as IRQ lines but only 32 pins can be
used as IRQ lines at given time. Selection of pins as IRQ lines
is handled by IA55 (which is the IRQC block) which sits in between the
GPIO and GIC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 205 ++++++++++++++++++++++++
 1 file changed, 205 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index 805117b2106e..1c0828206cea 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -11,6 +11,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/of_irq.h>
 #include <linux/pinctrl/pinconf-generic.h>
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinctrl.h>
@@ -87,6 +88,7 @@
 #define PFC(n)			(0x0400 + 0x40 + (n) * 4)
 #define PIN(n)			(0x0800 + 0x10 + (n))
 #define IEN(n)			(0x1800 + (n) * 8)
+#define ISEL(n)			(0x2C80 + (n) * 8)
 #define PWPR			(0x3014)
 #define SD_CH(n)		(0x3000 + (n) * 4)
 #define QSPI			(0x3008)
@@ -108,6 +110,8 @@
 #define RZG2L_PIN_ID_TO_PORT(id)	((id) / RZG2L_PINS_PER_PORT)
 #define RZG2L_PIN_ID_TO_PIN(id)		((id) % RZG2L_PINS_PER_PORT)
 
+#define RZG2L_TINT_MAX_INTERRUPT	32
+
 struct rzg2l_dedicated_configs {
 	const char *name;
 	u32 config;
@@ -133,6 +137,8 @@ struct rzg2l_pinctrl {
 
 	struct gpio_chip		gpio_chip;
 	struct pinctrl_gpio_range	gpio_range;
+	struct irq_chip			irq_chip;
+	struct irq_domain		*domain;
 
 	spinlock_t			lock;
 };
@@ -782,6 +788,22 @@ static void rzg2l_gpio_free(struct gpio_chip *chip, unsigned int offset)
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
+	 * IRQ_TYPE_NONE is rejected by the parent irq domain. Set LEVEL_HIGH
+	 * temporarily. Anyway, ->irq_set_type() will override it later.
+	 */
+	fwspec.param[1] = IRQ_TYPE_LEVEL_HIGH;
+
+	return irq_create_fwspec_mapping(&fwspec);
+}
+
 static const char * const rzg2l_gpio_names[] = {
 	"P0_0", "P0_1", "P0_2", "P0_3", "P0_4", "P0_5", "P0_6", "P0_7",
 	"P1_0", "P1_1", "P1_2", "P1_3", "P1_4", "P1_5", "P1_6", "P1_7",
@@ -965,14 +987,181 @@ static  struct rzg2l_dedicated_configs rzg2l_dedicated_pins[] = {
 	{ "RIIC1_SCL", RZG2L_SINGLE_PIN_PACK(0xe, 3, PIN_CFG_IEN) },
 };
 
+static int rzg2l_gpio_irq_domain_translate(struct irq_domain *domain,
+					   struct irq_fwspec *fwspec,
+					   unsigned long *out_hwirq,
+					   unsigned int *out_type)
+{
+	if (WARN_ON(fwspec->param_count < 2))
+		return -EINVAL;
+
+	*out_hwirq = fwspec->param[0];
+	*out_type = fwspec->param[1] & IRQ_TYPE_SENSE_MASK;
+
+	return 0;
+}
+
+static int rzg2l_gpio_irq_domain_alloc(struct irq_domain *domain,
+				       unsigned int virq,
+				       unsigned int nr_irqs, void *arg)
+{
+	struct rzg2l_pinctrl *pctrl = domain->host_data;
+	struct irq_fwspec parent_fwspec;
+	irq_hw_number_t hwirq;
+	unsigned int type;
+	int ret;
+
+	if (WARN_ON(nr_irqs != 1))
+		return -EINVAL;
+
+	ret = rzg2l_gpio_irq_domain_translate(domain, arg, &hwirq, &type);
+	if (ret)
+		return ret;
+
+	/* parent is IRQC */
+	parent_fwspec.fwnode = domain->parent->fwnode;
+	parent_fwspec.param_count = 2;
+	parent_fwspec.param[0] = hwirq;
+	parent_fwspec.param[1] = (type == IRQ_TYPE_EDGE_BOTH) ?
+						IRQ_TYPE_EDGE_FALLING : type;
+
+	ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
+					    &pctrl->irq_chip, pctrl);
+	if (ret)
+		return ret;
+
+	return irq_domain_alloc_irqs_parent(domain, virq, 1, &parent_fwspec);
+}
+
+static const struct irq_domain_ops rzg2l_gpio_irq_domain_ops = {
+	.alloc = rzg2l_gpio_irq_domain_alloc,
+	.free = irq_domain_free_irqs_common,
+	.translate = rzg2l_gpio_irq_domain_translate,
+};
+
+static void rzg2l_gpio_irq_disable(struct irq_data *d)
+{
+	struct rzg2l_pinctrl *pctrl = d->chip_data;
+	int hwirq = irqd_to_hwirq(d);
+	unsigned long flags;
+	void __iomem *addr;
+	u32 port;
+	u32 val;
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
+	val = readl(addr);
+	val &= ~BIT(bit * 8);
+	writel(val, addr);
+	spin_unlock_irqrestore(&pctrl->lock, flags);
+
+	irq_chip_disable_parent(d);
+}
+
+static void rzg2l_gpio_irq_enable(struct irq_data *d)
+{
+	struct rzg2l_pinctrl *pctrl = d->chip_data;
+	int hwirq = irqd_to_hwirq(d);
+	unsigned long flags;
+	void __iomem *addr;
+	u32 port;
+	u32 val;
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
+	val = readl(addr);
+	val |= BIT(bit * 8);
+	writel(val, addr);
+	spin_unlock_irqrestore(&pctrl->lock, flags);
+
+	irq_chip_enable_parent(d);
+}
+
+static int rzg2l_gpio_irq_set_type(struct irq_data *d, unsigned int type)
+{
+	struct rzg2l_pinctrl *pctrl = d->chip_data;
+	int hwirq = irqd_to_hwirq(d);
+	unsigned int rzg2_irq_type;
+	u32 port;
+	u8 bit;
+
+	port = RZG2L_PIN_ID_TO_PORT(hwirq);
+	bit = RZG2L_PIN_ID_TO_PIN(hwirq);
+
+	/*
+	 * To handle IRQ_TYPE_EDGE_BOTH which is not natively supported
+	 * by the HW we split the type and pass the current state of
+	 * GPIO PIN BIT(16) to the parent domain and trigger it on
+	 * rising/falling edge depending on the PIN state
+	 */
+	switch (type) {
+	case IRQ_TYPE_EDGE_RISING:
+		rzg2_irq_type = BIT(0);
+		break;
+	case IRQ_TYPE_EDGE_FALLING:
+		rzg2_irq_type = BIT(1);
+		break;
+	case IRQ_TYPE_LEVEL_HIGH:
+		rzg2_irq_type = BIT(2);
+		break;
+	case IRQ_TYPE_LEVEL_LOW:
+		rzg2_irq_type = BIT(3);
+		break;
+	case IRQ_TYPE_EDGE_BOTH:
+		rzg2_irq_type = BIT(4);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (!!(readb(pctrl->base + PIN(port)) & BIT(bit)))
+		rzg2_irq_type |= BIT(16);
+
+	return irq_chip_set_type_parent(d, rzg2_irq_type);
+}
+
+static void rzg2l_gpio_irqc_eoi(struct irq_data *d)
+{
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
@@ -991,6 +1180,7 @@ static int rzg2l_gpio_register(struct rzg2l_pinctrl *pctrl)
 	chip->get_direction = rzg2l_gpio_get_direction;
 	chip->direction_input = rzg2l_gpio_direction_input;
 	chip->direction_output = rzg2l_gpio_direction_output;
+	chip->to_irq = rzg2l_gpio_to_irq;
 	chip->get = rzg2l_gpio_get;
 	chip->set = rzg2l_gpio_set;
 	chip->label = name;
@@ -999,6 +1189,13 @@ static int rzg2l_gpio_register(struct rzg2l_pinctrl *pctrl)
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
@@ -1011,6 +1208,14 @@ static int rzg2l_gpio_register(struct rzg2l_pinctrl *pctrl)
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

