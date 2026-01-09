Return-Path: <linux-gpio+bounces-30360-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A7D9D0AB44
	for <lists+linux-gpio@lfdr.de>; Fri, 09 Jan 2026 15:44:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B956E301E917
	for <lists+linux-gpio@lfdr.de>; Fri,  9 Jan 2026 14:40:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA43835E529;
	Fri,  9 Jan 2026 14:40:13 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01B373612F3;
	Fri,  9 Jan 2026 14:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767969613; cv=none; b=P7G/pcTR+vEzXp17yR1oT1jmfpNqiDLg5LRNKDh7CjTjRiuW+x9KRFeULAvZU7ess6EYjhwjGCKMvyeI9DfVfxRbP71XA7zSeE4U9leSE60o849jmS32h9ITb1GtfPX2UW4/7HbqU8BINRk/bj9K8mcEKuQiKVuM/dkU21mAtjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767969613; c=relaxed/simple;
	bh=kcKVZVxZyod1iuhbR4DeOG0lWwoa23P8dvJ9jDW9xYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DsmuVjqQDjz3HfoHF8rLc/UpXmxbVaQLxIYYTn2gefCdo/3pMxQ7Vfit/HlU3Bt9OOnWAL1JVBMYYmViiemcpsrecBkPBmj7nptCASrLoLKEUHY2eEtZVSrZpoNZlBvg3gA32OFbL8Y9SQSc4ePgDygUecCoPfwoqmtkH+1vblo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; arc=none smtp.client-ip=210.160.252.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
X-CSE-ConnectionGUID: WYyJuuAiRfCeezmo+Ht2YA==
X-CSE-MsgGUID: K3YVNjEKRiqQg16vTxNZ7A==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 09 Jan 2026 23:40:09 +0900
Received: from demon-pc.localdomain (unknown [10.226.93.195])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id E2AF84027252;
	Fri,  9 Jan 2026 23:40:07 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Subject: [PATCH v3 1/1] pinctrl: renesas: rzt2h: add GPIO IRQ chip to handle interrupts
Date: Fri,  9 Jan 2026 16:39:10 +0200
Message-ID: <20260109143910.645628-2-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260109143910.645628-1-cosmin-gabriel.tanislav.xa@renesas.com>
References: <20260109143910.645628-1-cosmin-gabriel.tanislav.xa@renesas.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Renesas RZ/T2H (R9A09G077) and Renesas RZ/N2H (R9A09G087) SoCs have
IRQ-capable pins handled by the ICU, which forwards them to the GIC.

The ICU supports 16 IRQ lines, the pins map to these lines arbitrarily,
and the mapping is not configurable.

Add a GPIO IRQ chip to the pin controller that can be used to configure
these pins as IRQ lines.

The pin controller places the requested pins into IRQ function,
disabling GPIO mode. A hierarchical IRQ domain is used to forward other
functionality to the parent IRQ domain, the ICU. The ICU does level
translation and then forwards other functionality to the GIC.

Wakeup capability is implemented by placing the entire pin controller on
the wakeup path if any pins are requested to be wakeup-capable.

Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---

V3:
 * adjust comment describing the source of truth for the data inside
   rzt2h_gpio_irq_map
 * check if interrupt-controller property is present before populating
   GPIO's IRQ chip
 * move rzt2h_pinctrl_suspend_noirq() above rzt2h_pinctrl_pm_ops

V2:
 * select GPIOLIB_IRQCHIP
 * select IRQ_DOMAIN_HIERARCHY
 * add comment to clarify wakeup_path atomic usage
 * add more details to the commit message, including usage of the
   hierarchical IRQ domain and wakeup capability implementation

 drivers/pinctrl/renesas/Kconfig         |   2 +
 drivers/pinctrl/renesas/pinctrl-rzt2h.c | 203 ++++++++++++++++++++++++
 2 files changed, 205 insertions(+)

diff --git a/drivers/pinctrl/renesas/Kconfig b/drivers/pinctrl/renesas/Kconfig
index 8cbd79a13414..d979e25e5088 100644
--- a/drivers/pinctrl/renesas/Kconfig
+++ b/drivers/pinctrl/renesas/Kconfig
@@ -308,9 +308,11 @@ config PINCTRL_RZT2H
 	bool "pin control support for RZ/N2H and RZ/T2H" if COMPILE_TEST
 	depends on 64BIT && OF
 	select GPIOLIB
+	select GPIOLIB_IRQCHIP
 	select GENERIC_PINCTRL_GROUPS
 	select GENERIC_PINMUX_FUNCTIONS
 	select GENERIC_PINCONF
+	select IRQ_DOMAIN_HIERARCHY
 	help
 	  This selects GPIO and pinctrl driver for Renesas RZ/T2H
 	  platforms.
diff --git a/drivers/pinctrl/renesas/pinctrl-rzt2h.c b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
index 722551723e06..9949108a35bb 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
@@ -18,6 +18,7 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/of_device.h>
+#include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/spinlock.h>
@@ -65,6 +66,9 @@
 
 #define RZT2H_MAX_SAFETY_PORTS		12
 
+#define RZT2H_INTERRUPTS_START		16
+#define RZT2H_INTERRUPTS_NUM		17
+
 struct rzt2h_pinctrl_data {
 	unsigned int n_port_pins;
 	const u8 *port_pin_configs;
@@ -80,9 +84,11 @@ struct rzt2h_pinctrl {
 	struct device			*dev;
 	struct gpio_chip		gpio_chip;
 	struct pinctrl_gpio_range	gpio_range;
+	DECLARE_BITMAP(used_irqs, RZT2H_INTERRUPTS_NUM);
 	spinlock_t			lock; /* lock read/write registers */
 	struct mutex			mutex; /* serialize adding groups and functions */
 	bool				safety_port_enabled;
+	atomic_t			wakeup_path;
 };
 
 #define RZT2H_GET_BASE(pctrl, port) \
@@ -644,14 +650,185 @@ static const char * const rzt2h_gpio_names[] = {
 	"P35_0", "P35_1", "P35_2", "P35_3", "P35_4", "P35_5", "P35_6", "P35_7",
 };
 
+/*
+ * Interrupts 0-15 are for INTCPUn, which are not exposed externally.
+ * Interrupts 16-31 are for IRQn. SEI is 32.
+ * This table matches the information found in User Manual's Section
+ * 17.5, Multiplexed Pin Configurations, Tables 17.5 to 17.40, on the
+ * Interrupt rows.
+ * RZ/N2H has the same GPIO to IRQ mapping, except for the pins which
+ * are not present.
+ */
+static const u8 rzt2h_gpio_irq_map[] = {
+	32, 16, 17, 18, 19,  0, 20, 21,
+	22,  0,  0,  0,  0,  0,  0,  0,
+	23, 24, 25, 26, 27,  0,  0,  0,
+	 0,  0, 28, 29, 30, 31,  0,  0,
+	 0,  0,  0,  0,  0, 32, 16, 17,
+	18, 19, 20, 21, 22,  0,  0,  0,
+	 0,  0, 24, 25, 26, 27,  0, 28,
+	29, 30, 31,  0,  0,  0,  0,  0,
+	 0,  0,  0,  0,  0, 24, 32, 16,
+	 0,  0,  0,  0,  0,  0,  0,  0,
+	20, 23, 17, 18, 19,  0, 16, 25,
+	29, 20, 21, 22, 23,  0,  0,  0,
+	 0,  0,  0,  0, 17,  0,  0, 18,
+	 0,  0, 19,  0,  0, 20,  0, 30,
+	21,  0,  0, 22,  0,  0, 24, 25,
+	 0,  0,  0,  0,  0, 16, 17,  0,
+	18,  0,  0, 26, 27,  0,  0,  0,
+	28, 29, 30, 31,  0,  0,  0,  0,
+	23, 31, 32, 16, 17, 18, 19, 20,
+	 0,  0,  0,  0,  0,  0,  0,  0,
+	 0,  0,  0,  0,  0,  0,  0,  0,
+	 0,  0,  0,  0,  0,  0,  0,  0,
+	27,  0,  0, 21, 22, 23, 24, 25,
+	26,  0,  0,  0,  0,  0,  0,  0,
+	27, 28, 29, 30, 31,  0,  0,  0,
+	 0,  0,  0,  0,  0,  0,  0,  0,
+	 0,  0,  0,  0,  0, 28, 32, 16,
+	17, 18, 19,  0,  0,  0,  0, 20,
+	21, 22, 23,  0,  0,  0,  0,  0,
+	 0,  0,  0,  0, 24, 25,  0,  0,
+	 0,  0, 26, 27,  0,  0,  0, 30,
+	 0, 29,  0,  0,  0,  0,  0,  0,
+	 0,  0,  0,  0,  0,  0,  0,  0,
+	 0,  0,  0, 28, 29, 30, 31,  0,
+	 0,  0,  0,  0,  0,  0,  0, 30,
+	 0,  0,  0,  0,  0,  0,  0,  0,
+};
+
+static void rzt2h_gpio_irq_disable(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	unsigned int hwirq = irqd_to_hwirq(d);
+
+	irq_chip_disable_parent(d);
+	gpiochip_disable_irq(gc, hwirq);
+}
+
+static void rzt2h_gpio_irq_enable(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	unsigned int hwirq = irqd_to_hwirq(d);
+
+	gpiochip_enable_irq(gc, hwirq);
+	irq_chip_enable_parent(d);
+}
+
+static int rzt2h_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct rzt2h_pinctrl *pctrl = container_of(gc, struct rzt2h_pinctrl, gpio_chip);
+	int ret;
+
+	ret = irq_chip_set_wake_parent(d, on);
+	if (ret)
+		return ret;
+
+	/*
+	 * If any of the IRQs are in use, put the entire pin controller on the
+	 * device wakeup path.
+	 */
+	if (on)
+		atomic_inc(&pctrl->wakeup_path);
+	else
+		atomic_dec(&pctrl->wakeup_path);
+
+	return 0;
+}
+
+static const struct irq_chip rzt2h_gpio_irqchip = {
+	.name = "rzt2h-gpio",
+	.irq_disable = rzt2h_gpio_irq_disable,
+	.irq_enable = rzt2h_gpio_irq_enable,
+	.irq_mask = irq_chip_mask_parent,
+	.irq_unmask = irq_chip_unmask_parent,
+	.irq_set_type = irq_chip_set_type_parent,
+	.irq_set_wake = rzt2h_gpio_irq_set_wake,
+	.irq_eoi = irq_chip_eoi_parent,
+	.irq_set_affinity = irq_chip_set_affinity_parent,
+	.flags = IRQCHIP_IMMUTABLE,
+	GPIOCHIP_IRQ_RESOURCE_HELPERS,
+};
+
+static int rzt2h_gpio_child_to_parent_hwirq(struct gpio_chip *gc,
+					    unsigned int child,
+					    unsigned int child_type,
+					    unsigned int *parent,
+					    unsigned int *parent_type)
+{
+	struct rzt2h_pinctrl *pctrl = gpiochip_get_data(gc);
+	u8 port = RZT2H_PIN_ID_TO_PORT(child);
+	u8 pin = RZT2H_PIN_ID_TO_PIN(child);
+	u8 parent_irq;
+
+	parent_irq = rzt2h_gpio_irq_map[child];
+	if (parent_irq < RZT2H_INTERRUPTS_START)
+		return -EINVAL;
+
+	if (test_and_set_bit(parent_irq - RZT2H_INTERRUPTS_START,
+			     pctrl->used_irqs))
+		return -EBUSY;
+
+	rzt2h_pinctrl_set_pfc_mode(pctrl, port, pin, PFC_FUNC_INTERRUPT);
+
+	*parent = parent_irq;
+	*parent_type = child_type;
+
+	return 0;
+}
+
+static void rzt2h_gpio_irq_domain_free(struct irq_domain *domain, unsigned int virq,
+				       unsigned int nr_irqs)
+{
+	struct irq_data *d = irq_domain_get_irq_data(domain, virq);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct rzt2h_pinctrl *pctrl = container_of(gc, struct rzt2h_pinctrl, gpio_chip);
+	irq_hw_number_t hwirq = irqd_to_hwirq(d);
+	u8 port = RZT2H_PIN_ID_TO_PORT(hwirq);
+	u8 pin = RZT2H_PIN_ID_TO_PIN(hwirq);
+
+	if (test_and_clear_bit(hwirq - RZT2H_INTERRUPTS_START, pctrl->used_irqs))
+		rzt2h_pinctrl_set_gpio_en(pctrl, port, pin, false);
+
+	irq_domain_free_irqs_common(domain, virq, nr_irqs);
+}
+
+static void rzt2h_gpio_init_irq_valid_mask(struct gpio_chip *gc,
+					   unsigned long *valid_mask,
+					   unsigned int ngpios)
+{
+	struct rzt2h_pinctrl *pctrl = gpiochip_get_data(gc);
+	unsigned int offset;
+
+	for (offset = 0; offset < ngpios; offset++) {
+		if (!rzt2h_gpio_irq_map[offset] || rzt2h_validate_pin(pctrl, offset))
+			clear_bit(offset, valid_mask);
+	}
+}
+
 static int rzt2h_gpio_register(struct rzt2h_pinctrl *pctrl)
 {
 	struct pinctrl_gpio_range *range = &pctrl->gpio_range;
 	struct gpio_chip *chip = &pctrl->gpio_chip;
+	struct device_node *np = pctrl->dev->of_node;
+	struct irq_domain *parent_domain;
 	struct device *dev = pctrl->dev;
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
 	ret = of_parse_phandle_with_fixed_args(dev->of_node, "gpio-ranges", 3, 0, &of_args);
 	if (ret)
 		return dev_err_probe(dev, ret, "Unable to parse gpio-ranges\n");
@@ -675,6 +852,17 @@ static int rzt2h_gpio_register(struct rzt2h_pinctrl *pctrl)
 	chip->set = rzt2h_gpio_set;
 	chip->label = dev_name(dev);
 
+	if (of_property_present(np, "interrupt-controller")) {
+		girq = &chip->irq;
+		gpio_irq_chip_set_chip(girq, &rzt2h_gpio_irqchip);
+		girq->fwnode = dev_fwnode(pctrl->dev);
+		girq->parent_domain = parent_domain;
+		girq->child_to_parent_hwirq = rzt2h_gpio_child_to_parent_hwirq;
+		girq->populate_parent_alloc_arg = gpiochip_populate_parent_fwspec_twocell;
+		girq->child_irq_domain_ops.free = rzt2h_gpio_irq_domain_free;
+		girq->init_valid_mask = rzt2h_gpio_init_irq_valid_mask;
+	}
+
 	range->id = 0;
 	range->pin_base = 0;
 	range->base = 0;
@@ -819,10 +1007,25 @@ static const struct of_device_id rzt2h_pinctrl_of_table[] = {
 	{ /* sentinel */ }
 };
 
+static int rzt2h_pinctrl_suspend_noirq(struct device *dev)
+{
+	struct rzt2h_pinctrl *pctrl = dev_get_drvdata(dev);
+
+	if (atomic_read(&pctrl->wakeup_path))
+		device_set_wakeup_path(dev);
+
+	return 0;
+}
+
+static const struct dev_pm_ops rzt2h_pinctrl_pm_ops = {
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(rzt2h_pinctrl_suspend_noirq, NULL)
+};
+
 static struct platform_driver rzt2h_pinctrl_driver = {
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = of_match_ptr(rzt2h_pinctrl_of_table),
+		.pm = pm_sleep_ptr(&rzt2h_pinctrl_pm_ops),
 		.suppress_bind_attrs = true,
 	},
 	.probe = rzt2h_pinctrl_probe,
-- 
2.52.0

