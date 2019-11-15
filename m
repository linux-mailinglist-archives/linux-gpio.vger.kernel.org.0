Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2468FE799
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 23:18:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727202AbfKOWSM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 17:18:12 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:47608 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727164AbfKOWRy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 17:17:54 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id B58596118E; Fri, 15 Nov 2019 22:17:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573856272;
        bh=ckPFG3E3p25KflbdVI3qfJhoSMp6qknjV6SvsZY0W+w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kGwvRKQ0m+Ol5f8MjREF0iAhGX5bK9h0KrdLNhXUWK10s0cV4gRg0JgtEt3kwB+0t
         AXd4qQvslCsCj7IC0bkRfy3j4sTlmEoeiShM6xHtuLXlvOa6t6mpxtpe8j/OpMvLjN
         gY6VRuMR8JuoydPxZ48Ob/o3zCv7dJOf0V0Zfe0Q=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: ilina@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 273C1611AA;
        Fri, 15 Nov 2019 22:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573856271;
        bh=ckPFG3E3p25KflbdVI3qfJhoSMp6qknjV6SvsZY0W+w=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=CMDUlbPDST9pahARz8ZpYm12WnpM3pIPUy7HVkZoKaimbbgIsStspe1UN/BNYGtRe
         VFJ0IZowj/6UgeXyNVzMgPniiCEzEz6rIic0hZxIJY/octXqA+MOT0tTH23jUkxWEw
         op6dmckrWZsXBqZ+KIU5RxY5kwYbtoMcOjEYJ6aM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 273C1611AA
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, maz@kernel.org, linus.walleij@linaro.org,
        bjorn.andersson@linaro.org
Cc:     evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH v2 08/12] drivers: pinctrl: msm: setup GPIO chip in hierarchy
Date:   Fri, 15 Nov 2019 15:11:51 -0700
Message-Id: <1573855915-9841-9-git-send-email-ilina@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573855915-9841-1-git-send-email-ilina@codeaurora.org>
References: <1573855915-9841-1-git-send-email-ilina@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some GPIOs are marked as wakeup capable and are routed to another
interrupt controller that is an always-domain and can detect interrupts
even when most of the SoC is powered off. The wakeup interrupt
controller wakes up the GIC and replays the interrupt at the GIC.

Setup the TLMM irqchip in hierarchy with the wakeup interrupt controller
and ensure the wakeup GPIOs are handled correctly.

Co-developed-by: Maulik Shah <mkshah@codeaurora.org>
Signed-off-by: Lina Iyer <ilina@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
----
Changes in v2:
	- Address review comments
	- Fix Co-developed-by tag
Changes in v1:
	- Address minor review comments
	- Remove redundant call to set irq handler
	- Move irq_domain_qcom_handle_wakeup() to this patch
Changes in RFC v2:
	- Rebase on top of GPIO hierarchy support in linux-next
	- Set the chained irq handler for summary line
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 112 ++++++++++++++++++++++++++++++++++++-
 drivers/pinctrl/qcom/pinctrl-msm.h |  14 +++++
 include/linux/soc/qcom/irq.h       |  13 +++++
 3 files changed, 137 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 763da0b..9788384 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -23,6 +23,8 @@
 #include <linux/pm.h>
 #include <linux/log2.h>
 
+#include <linux/soc/qcom/irq.h>
+
 #include "../core.h"
 #include "../pinconf.h"
 #include "pinctrl-msm.h"
@@ -44,6 +46,7 @@
  * @enabled_irqs:   Bitmap of currently enabled irqs.
  * @dual_edge_irqs: Bitmap of irqs that need sw emulated dual edge
  *                  detection.
+ * @skip_wake_irqs: Skip IRQs that are handled by wakeup interrupt controller
  * @soc;            Reference to soc_data of platform specific data.
  * @regs:           Base addresses for the TLMM tiles.
  */
@@ -61,6 +64,7 @@ struct msm_pinctrl {
 
 	DECLARE_BITMAP(dual_edge_irqs, MAX_NR_GPIO);
 	DECLARE_BITMAP(enabled_irqs, MAX_NR_GPIO);
+	DECLARE_BITMAP(skip_wake_irqs, MAX_NR_GPIO);
 
 	const struct msm_pinctrl_soc_data *soc;
 	void __iomem *regs[MAX_NR_TILES];
@@ -707,6 +711,12 @@ static void msm_gpio_irq_mask(struct irq_data *d)
 	unsigned long flags;
 	u32 val;
 
+	if (d->parent_data)
+		irq_chip_mask_parent(d);
+
+	if (test_bit(d->hwirq, pctrl->skip_wake_irqs))
+		return;
+
 	g = &pctrl->soc->groups[d->hwirq];
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
@@ -751,6 +761,12 @@ static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
 	unsigned long flags;
 	u32 val;
 
+	if (d->parent_data)
+		irq_chip_unmask_parent(d);
+
+	if (test_bit(d->hwirq, pctrl->skip_wake_irqs))
+		return;
+
 	g = &pctrl->soc->groups[d->hwirq];
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
@@ -778,10 +794,35 @@ static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
 
 static void msm_gpio_irq_enable(struct irq_data *d)
 {
+	/*
+	 * Clear the interrupt that may be pending before we enable
+	 * the line.
+	 * This is especially a problem with the GPIOs routed to the
+	 * PDC. These GPIOs are direct-connect interrupts to the GIC.
+	 * Disabling the interrupt line at the PDC does not prevent
+	 * the interrupt from being latched at the GIC. The state at
+	 * GIC needs to be cleared before enabling.
+	 */
+	if (d->parent_data) {
+		irq_chip_set_parent_state(d, IRQCHIP_STATE_PENDING, 0);
+		irq_chip_enable_parent(d);
+	}
 
 	msm_gpio_irq_clear_unmask(d, true);
 }
 
+static void msm_gpio_irq_disable(struct irq_data *d)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
+
+	if (d->parent_data)
+		irq_chip_disable_parent(d);
+
+	if (!test_bit(d->hwirq, pctrl->skip_wake_irqs))
+		msm_gpio_irq_mask(d);
+}
+
 static void msm_gpio_irq_unmask(struct irq_data *d)
 {
 	msm_gpio_irq_clear_unmask(d, false);
@@ -795,6 +836,9 @@ static void msm_gpio_irq_ack(struct irq_data *d)
 	unsigned long flags;
 	u32 val;
 
+	if (test_bit(d->hwirq, pctrl->skip_wake_irqs))
+		return;
+
 	g = &pctrl->soc->groups[d->hwirq];
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
@@ -820,6 +864,12 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 	unsigned long flags;
 	u32 val;
 
+	if (d->parent_data)
+		irq_chip_set_type_parent(d, type);
+
+	if (test_bit(d->hwirq, pctrl->skip_wake_irqs))
+		return 0;
+
 	g = &pctrl->soc->groups[d->hwirq];
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
@@ -912,6 +962,15 @@ static int msm_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
 	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
 	unsigned long flags;
 
+	/*
+	 * While they may not wake up when the TLMM is powered off,
+	 * some GPIOs would like to wakeup the system from suspend
+	 * when TLMM is powered on. To allow that, enable the GPIO
+	 * summary line to be wakeup capable at GIC.
+	 */
+	if (d->parent_data)
+		irq_chip_set_wake_parent(d, on);
+
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
 	irq_set_irq_wake(pctrl->irq, on);
@@ -990,6 +1049,30 @@ static void msm_gpio_irq_handler(struct irq_desc *desc)
 	chained_irq_exit(chip, desc);
 }
 
+static int msm_gpio_wakeirq(struct gpio_chip *gc,
+			    unsigned int child,
+			    unsigned int child_type,
+			    unsigned int *parent,
+			    unsigned int *parent_type)
+{
+	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
+	const struct msm_gpio_wakeirq_map *map;
+	int i;
+
+	*parent = GPIO_NO_WAKE_IRQ;
+	*parent_type = IRQ_TYPE_EDGE_RISING;
+
+	for (i = 0; i < pctrl->soc->nwakeirq_map; i++) {
+		map = &pctrl->soc->wakeirq_map[i];
+		if (map->gpio == child) {
+			*parent = map->wakeirq;
+			break;
+		}
+	}
+
+	return 0;
+}
+
 static bool msm_gpio_needs_valid_mask(struct msm_pinctrl *pctrl)
 {
 	if (pctrl->soc->reserved_gpios)
@@ -1002,8 +1085,10 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 {
 	struct gpio_chip *chip;
 	struct gpio_irq_chip *girq;
-	int ret;
-	unsigned ngpio = pctrl->soc->ngpios;
+	int i, ret;
+	unsigned gpio, ngpio = pctrl->soc->ngpios;
+	struct device_node *np;
+	bool skip;
 
 	if (WARN_ON(ngpio > MAX_NR_GPIO))
 		return -EINVAL;
@@ -1020,17 +1105,40 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 
 	pctrl->irq_chip.name = "msmgpio";
 	pctrl->irq_chip.irq_enable = msm_gpio_irq_enable;
+	pctrl->irq_chip.irq_disable = msm_gpio_irq_disable;
 	pctrl->irq_chip.irq_mask = msm_gpio_irq_mask;
 	pctrl->irq_chip.irq_unmask = msm_gpio_irq_unmask;
 	pctrl->irq_chip.irq_ack = msm_gpio_irq_ack;
+	pctrl->irq_chip.irq_eoi = irq_chip_eoi_parent;
 	pctrl->irq_chip.irq_set_type = msm_gpio_irq_set_type;
 	pctrl->irq_chip.irq_set_wake = msm_gpio_irq_set_wake;
 	pctrl->irq_chip.irq_request_resources = msm_gpio_irq_reqres;
 	pctrl->irq_chip.irq_release_resources = msm_gpio_irq_relres;
 
+	np = of_parse_phandle(pctrl->dev->of_node, "wakeup-parent", 0);
+	if (np) {
+		chip->irq.parent_domain = irq_find_matching_host(np,
+						 DOMAIN_BUS_WAKEUP);
+		of_node_put(np);
+		if (!chip->irq.parent_domain)
+			return -EPROBE_DEFER;
+		chip->irq.child_to_parent_hwirq = msm_gpio_wakeirq;
+
+		/*
+		 * Let's skip handling the GPIOs, if the parent irqchip
+		 * is handling the direct connect IRQ of the GPIO.
+		 */
+		skip = irq_domain_qcom_handle_wakeup(chip->irq.parent_domain);
+		for (i = 0; skip && i < pctrl->soc->nwakeirq_map; i++) {
+			gpio = pctrl->soc->wakeirq_map[i].gpio;
+			set_bit(gpio, pctrl->skip_wake_irqs);
+		}
+	}
+
 	girq = &chip->irq;
 	girq->chip = &pctrl->irq_chip;
 	girq->parent_handler = msm_gpio_irq_handler;
+	girq->fwnode = pctrl->dev->fwnode;
 	girq->num_parents = 1;
 	girq->parents = devm_kcalloc(pctrl->dev, 1, sizeof(*girq->parents),
 				     GFP_KERNEL);
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index 48569cda8..9452da1 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -92,6 +92,16 @@ struct msm_pingroup {
 };
 
 /**
+ * struct msm_gpio_wakeirq_map - Map of GPIOs and their wakeup pins
+ * @gpio:          The GPIOs that are wakeup capable
+ * @wakeirq:       The interrupt at the always-on interrupt controller
+ */
+struct msm_gpio_wakeirq_map {
+	unsigned int gpio;
+	unsigned int wakeirq;
+};
+
+/**
  * struct msm_pinctrl_soc_data - Qualcomm pin controller driver configuration
  * @pins:	    An array describing all pins the pin controller affects.
  * @npins:	    The number of entries in @pins.
@@ -101,6 +111,8 @@ struct msm_pingroup {
  * @ngroups:	    The numbmer of entries in @groups.
  * @ngpio:	    The number of pingroups the driver should expose as GPIOs.
  * @pull_no_keeper: The SoC does not support keeper bias.
+ * @wakeirq_map:    The map of wakeup capable GPIOs and the pin at PDC/MPM
+ * @nwakeirq_map:   The number of entries in @wakeirq_map
  */
 struct msm_pinctrl_soc_data {
 	const struct pinctrl_pin_desc *pins;
@@ -114,6 +126,8 @@ struct msm_pinctrl_soc_data {
 	const char *const *tiles;
 	unsigned int ntiles;
 	const int *reserved_gpios;
+	const struct msm_gpio_wakeirq_map *wakeirq_map;
+	unsigned int nwakeirq_map;
 };
 
 extern const struct dev_pm_ops msm_pinctrl_dev_pm_ops;
diff --git a/include/linux/soc/qcom/irq.h b/include/linux/soc/qcom/irq.h
index 637c0bf..9e1ece5 100644
--- a/include/linux/soc/qcom/irq.h
+++ b/include/linux/soc/qcom/irq.h
@@ -18,4 +18,17 @@
 #define IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP		(IRQ_DOMAIN_FLAG_NONCORE << 0)
 #define IRQ_DOMAIN_FLAG_QCOM_MPM_WAKEUP		(IRQ_DOMAIN_FLAG_NONCORE << 1)
 
+/**
+ * irq_domain_qcom_handle_wakeup: Return if the domain handles interrupt
+ *                                configuration
+ * @d: irq domain
+ *
+ * This QCOM specific irq domain call returns if the interrupt controller
+ * requires the interrupt be masked at the child interrupt controller.
+ */
+static inline bool irq_domain_qcom_handle_wakeup(const struct irq_domain *d)
+{
+	return (d->flags & IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP);
+}
+
 #endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

