Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F07AB531AC3
	for <lists+linux-gpio@lfdr.de>; Mon, 23 May 2022 22:56:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241200AbiEWR65 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 May 2022 13:58:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244605AbiEWR6K (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 May 2022 13:58:10 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 36C11C9663;
        Mon, 23 May 2022 10:43:26 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.91,246,1647270000"; 
   d="scan'208";a="120623478"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 24 May 2022 02:43:21 +0900
Received: from localhost.localdomain (unknown [10.226.36.204])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 6CAB2400E8E8;
        Tue, 24 May 2022 02:43:15 +0900 (JST)
From:   Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To:     Marc Zyngier <maz@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org,
        Prabhakar <prabhakar.csengg@gmail.com>,
        linux-renesas-soc@vger.kernel.org,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 5/5] pinctrl: renesas: pinctrl-rzg2l: Add IRQ domain to handle GPIO interrupt
Date:   Mon, 23 May 2022 18:42:38 +0100
Message-Id: <20220523174238.28942-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220523174238.28942-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20220523174238.28942-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add IRQ domain to RZ/G2L pinctrl driver to handle GPIO interrupt.

GPIO0-GPIO122 pins can be used as IRQ lines but only 32 pins can be
used as IRQ lines at a given time. Selection of pins as IRQ lines
is handled by IA55 (which is the IRQC block) which sits in between the
GPIO and GIC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 236 ++++++++++++++++++++++++
 1 file changed, 236 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index a48cac55152c..0793b5718f68 100644
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
@@ -89,6 +91,7 @@
 #define PIN(n)			(0x0800 + 0x10 + (n))
 #define IOLH(n)			(0x1000 + (n) * 8)
 #define IEN(n)			(0x1800 + (n) * 8)
+#define ISEL(n)			(0x2c80 + (n) * 8)
 #define PWPR			(0x3014)
 #define SD_CH(n)		(0x3000 + (n) * 4)
 #define QSPI			(0x3008)
@@ -112,6 +115,10 @@
 #define RZG2L_PIN_ID_TO_PORT_OFFSET(id)	(RZG2L_PIN_ID_TO_PORT(id) + 0x10)
 #define RZG2L_PIN_ID_TO_PIN(id)		((id) % RZG2L_PINS_PER_PORT)
 
+#define RZG2L_TINT_MAX_INTERRUPT	32
+#define RZG2L_TINT_IRQ_START_INDEX	9
+#define RZG2L_PACK_HWIRQ(t, i)		(((t) << 16) | (i))
+
 struct rzg2l_dedicated_configs {
 	const char *name;
 	u32 config;
@@ -137,6 +144,9 @@ struct rzg2l_pinctrl {
 
 	struct gpio_chip		gpio_chip;
 	struct pinctrl_gpio_range	gpio_range;
+	DECLARE_BITMAP(tint_slot, RZG2L_TINT_MAX_INTERRUPT);
+	spinlock_t			bitmap_lock;
+	unsigned int			hwirq[RZG2L_TINT_MAX_INTERRUPT];
 
 	spinlock_t			lock;
 };
@@ -883,8 +893,14 @@ static int rzg2l_gpio_get(struct gpio_chip *chip, unsigned int offset)
 
 static void rzg2l_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
+	unsigned int virq;
+
 	pinctrl_gpio_free(chip->base + offset);
 
+	virq = irq_find_mapping(chip->irq.domain, offset);
+	if (virq)
+		irq_dispose_mapping(virq);
+
 	/*
 	 * Set the GPIO as an input to ensure that the next GPIO request won't
 	 * drive the GPIO pin as an output.
@@ -1104,14 +1120,224 @@ static struct {
 	}
 };
 
+static int rzg2l_gpio_get_gpioint(unsigned int virq)
+{
+	unsigned int gpioint;
+	unsigned int i;
+	u32 port, bit;
+
+	port = virq / 8;
+	bit = virq % 8;
+
+	if (port >= ARRAY_SIZE(rzg2l_gpio_configs) ||
+	    bit >= RZG2L_GPIO_PORT_GET_PINCNT(rzg2l_gpio_configs[port]))
+		return -EINVAL;
+
+	gpioint = bit;
+	for (i = 0; i < port; i++)
+		gpioint += RZG2L_GPIO_PORT_GET_PINCNT(rzg2l_gpio_configs[i]);
+
+	return gpioint;
+}
+
+static void rzg2l_gpio_irq_disable(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct rzg2l_pinctrl *pctrl = container_of(gc, struct rzg2l_pinctrl, gpio_chip);
+	unsigned int hwirq = irqd_to_hwirq(d);
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
+	gpiochip_disable_irq(gc, hwirq);
+	irq_chip_disable_parent(d);
+}
+
+static void rzg2l_gpio_irq_enable(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct rzg2l_pinctrl *pctrl = container_of(gc, struct rzg2l_pinctrl, gpio_chip);
+	unsigned int hwirq = irqd_to_hwirq(d);
+	unsigned long flags;
+	void __iomem *addr;
+	u32 port;
+	u8 bit;
+
+	gpiochip_enable_irq(gc, hwirq);
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
+	irq_chip_eoi_parent(d);
+}
+
+static void rzg2l_gpio_irq_print_chip(struct irq_data *data, struct seq_file *p)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(data);
+
+	seq_printf(p, dev_name(gc->parent));
+}
+
+static const struct irq_chip rzg2l_gpio_irqchip = {
+	.name = "rzg2l-gpio",
+	.irq_disable = rzg2l_gpio_irq_disable,
+	.irq_enable = rzg2l_gpio_irq_enable,
+	.irq_mask = irq_chip_mask_parent,
+	.irq_unmask = irq_chip_unmask_parent,
+	.irq_set_type = rzg2l_gpio_irq_set_type,
+	.irq_eoi = rzg2l_gpio_irqc_eoi,
+	.irq_print_chip = rzg2l_gpio_irq_print_chip,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static int rzg2l_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
+					    unsigned int child,
+					    unsigned int child_type,
+					    unsigned int *parent,
+					    unsigned int *parent_type)
+{
+	struct rzg2l_pinctrl *pctrl = gpiochip_get_data(gc);
+	unsigned long flags;
+	int gpioint, irq;
+
+	gpioint = rzg2l_gpio_get_gpioint(child);
+	if (gpioint < 0)
+		return gpioint;
+
+	spin_lock_irqsave(&pctrl->bitmap_lock, flags);
+	irq = bitmap_find_free_region(pctrl->tint_slot, RZG2L_TINT_MAX_INTERRUPT, get_order(1));
+	spin_unlock_irqrestore(&pctrl->bitmap_lock, flags);
+	if (irq < 0)
+		return -ENOSPC;
+	pctrl->hwirq[irq] = child;
+	irq += RZG2L_TINT_IRQ_START_INDEX;
+
+	/* All these interrupts are level high in the CPU */
+	*parent_type = IRQ_TYPE_LEVEL_HIGH;
+	*parent = RZG2L_PACK_HWIRQ(gpioint, irq);
+	return 0;
+}
+
+static void *rzg2l_gpio_populate_parent_fwspec(struct gpio_chip *chip,
+					       unsigned int parent_hwirq,
+					       unsigned int parent_type)
+{
+	struct irq_fwspec *fwspec;
+
+	fwspec = kzalloc(sizeof(*fwspec), GFP_KERNEL);
+	if (!fwspec)
+		return NULL;
+
+	fwspec->fwnode = chip->irq.parent_domain->fwnode;
+	fwspec->param_count = 2;
+	fwspec->param[0] = parent_hwirq;
+	fwspec->param[1] = parent_type;
+
+	return fwspec;
+}
+
+static void rzg2l_gpio_irq_domain_free(struct irq_domain *domain, unsigned int virq,
+				       unsigned int nr_irqs)
+{
+	struct irq_data *d;
+
+	d = irq_domain_get_irq_data(domain, virq);
+	if (d) {
+		struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+		struct rzg2l_pinctrl *pctrl = container_of(gc, struct rzg2l_pinctrl, gpio_chip);
+		irq_hw_number_t hwirq = irqd_to_hwirq(d);
+		unsigned long flags;
+		unsigned int i;
+
+		for (i = 0; i < RZG2L_TINT_MAX_INTERRUPT; i++) {
+			if (pctrl->hwirq[i] == hwirq) {
+				spin_lock_irqsave(&pctrl->bitmap_lock, flags);
+				bitmap_release_region(pctrl->tint_slot, i, get_order(1));
+				spin_unlock_irqrestore(&pctrl->bitmap_lock, flags);
+				pctrl->hwirq[i] = 0;
+				break;
+			}
+		}
+	}
+	irq_domain_free_irqs_common(domain, virq, nr_irqs);
+}
+
+static void rzg2l_init_irq_valid_mask(struct gpio_chip *gc,
+				      unsigned long *valid_mask,
+				      unsigned int ngpios)
+{
+	struct rzg2l_pinctrl *pctrl = gpiochip_get_data(gc);
+	struct gpio_chip *chip = &pctrl->gpio_chip;
+	unsigned int offset;
+
+	/* Forbid unused lines to be mapped as IRQs */
+	for (offset = 0; offset < chip->ngpio; offset++) {
+		u32 port, bit;
+
+		port = offset / 8;
+		bit = offset % 8;
+
+		if (port >= ARRAY_SIZE(rzg2l_gpio_configs) ||
+		    bit >= RZG2L_GPIO_PORT_GET_PINCNT(rzg2l_gpio_configs[port]))
+			clear_bit(offset, valid_mask);
+	}
+}
+
 static int rzg2l_gpio_register(struct rzg2l_pinctrl *pctrl)
 {
 	struct device_node *np = pctrl->dev->of_node;
 	struct gpio_chip *chip = &pctrl->gpio_chip;
 	const char *name = dev_name(pctrl->dev);
+	struct irq_domain *parent_domain;
 	struct of_phandle_args of_args;
+	struct device_node *parent_np;
+	struct gpio_irq_chip *girq;
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
@@ -1138,6 +1364,15 @@ static int rzg2l_gpio_register(struct rzg2l_pinctrl *pctrl)
 	chip->base = -1;
 	chip->ngpio = of_args.args[2];
 
+	girq = &chip->irq;
+	gpio_irq_chip_set_chip(girq, &rzg2l_gpio_irqchip);
+	girq->fwnode = of_node_to_fwnode(np);
+	girq->parent_domain = parent_domain;
+	girq->child_to_parent_hwirq = rzg2l_gpio_child_to_parent_hwirq;
+	girq->populate_parent_alloc_arg = rzg2l_gpio_populate_parent_fwspec;
+	girq->child_irq_domain_ops.free = rzg2l_gpio_irq_domain_free;
+	girq->init_valid_mask = rzg2l_init_irq_valid_mask;
+
 	pctrl->gpio_range.id = 0;
 	pctrl->gpio_range.pin_base = 0;
 	pctrl->gpio_range.base = 0;
@@ -1253,6 +1488,7 @@ static int rzg2l_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	spin_lock_init(&pctrl->lock);
+	spin_lock_init(&pctrl->bitmap_lock);
 
 	platform_set_drvdata(pdev, pctrl);
 
-- 
2.25.1

