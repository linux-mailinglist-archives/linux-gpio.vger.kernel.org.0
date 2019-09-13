Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7876B27BC
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2019 00:03:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403790AbfIMV7y (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Sep 2019 17:59:54 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:60134 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390564AbfIMV7y (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Sep 2019 17:59:54 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 149FF61418; Fri, 13 Sep 2019 21:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568411993;
        bh=xTGRNviMhGXnSFoKJKqthHSateNRWbIby0VAJSXYSRY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Eeh2x1jf9wTG3FxTje8jsOgK1+evUMQdYDn+1wJF5rQzkaJcYLv4z1ofrR9nRYhnv
         dRnUZWfpBipTl9O8LNLm1kzPVO/+021xzuhe82fGXAkFdlip3jd6/NFYBaFmH3PlQo
         iUM5xGsZhJBQoU15VNf4drXmduwUCNElW/znmwnE=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 907976132B;
        Fri, 13 Sep 2019 21:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568411991;
        bh=xTGRNviMhGXnSFoKJKqthHSateNRWbIby0VAJSXYSRY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=VAnW58aa0lZHjucSNWnbGnQ2sLy5FWNY6z4EqlKiF7z360h9HxJSaaezU5cP78Rkz
         1NYzIKOuZGkcShTw4PJEnIHXlrr8rfCrP3TIc6QZPYcdlNQmXwaVBx8aO6w5vzGGcW
         GtvYfjnS/YbhhzeFe8GU61YruixrhcHALQPRbgoM=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 907976132B
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, maz@kernel.org,
        linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH RFC v2 10/14] drivers: pinctrl: msm: setup GPIO chip in hierarchy
Date:   Fri, 13 Sep 2019 15:59:18 -0600
Message-Id: <1568411962-1022-11-git-send-email-ilina@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568411962-1022-1-git-send-email-ilina@codeaurora.org>
References: <1568411962-1022-1-git-send-email-ilina@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Some GPIOs are marked as wakeup capable and are routed to another
interrupt controller that is an always-domain and can detect interrupts
even most of the SoC is powered off. The wakeup interrupt controller
wakes up the GIC and replays the interrupt at the GIC.

Setup the TLMM irqchip in hierarchy with the wakeup interrupt controller
and ensure the wakeup GPIOs are handled correctly.

Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
Signed-off-by: Lina Iyer <ilina@codeaurora.org>
----
Changes in RFC v2:
	- Define irq_domain_qcom_handle_wakeup()
	- Rebase on top of GPIO hierarchy support in linux-next
	- Set the chained irq handler for summary line
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 119 +++++++++++++++++++++++++++++++++++++
 drivers/pinctrl/qcom/pinctrl-msm.h |  16 +++++
 include/linux/soc/qcom/irq.h       |  13 ++++
 3 files changed, 148 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index f355ddd..c5ba389 100644
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
+ * @skip_wake_irqs: Skip IRQs that are handled by wakeup interrupt contrroller
  * @soc;            Reference to soc_data of platform specific data.
  * @regs:           Base addresses for the TLMM tiles.
  */
@@ -61,6 +64,7 @@ struct msm_pinctrl {
 
 	DECLARE_BITMAP(dual_edge_irqs, MAX_NR_GPIO);
 	DECLARE_BITMAP(enabled_irqs, MAX_NR_GPIO);
+	DECLARE_BITMAP(skip_wake_irqs, MAX_NR_GPIO);
 
 	const struct msm_pinctrl_soc_data *soc;
 	void __iomem *regs[MAX_NR_TILES];
@@ -709,6 +713,12 @@ static void msm_gpio_irq_mask(struct irq_data *d)
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
@@ -753,6 +763,12 @@ static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
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
@@ -780,10 +796,37 @@ static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
 
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
+	if (test_bit(d->hwirq, pctrl->skip_wake_irqs))
+		return;
+
+	msm_gpio_irq_mask(d);
+}
+
 static void msm_gpio_irq_unmask(struct irq_data *d)
 {
 	msm_gpio_irq_clear_unmask(d, false);
@@ -797,6 +840,9 @@ static void msm_gpio_irq_ack(struct irq_data *d)
 	unsigned long flags;
 	u32 val;
 
+	if (test_bit(d->hwirq, pctrl->skip_wake_irqs))
+		return;
+
 	g = &pctrl->soc->groups[d->hwirq];
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
@@ -822,6 +868,12 @@ static int msm_gpio_irq_set_type(struct irq_data *d, unsigned int type)
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
@@ -914,6 +966,15 @@ static int msm_gpio_irq_set_wake(struct irq_data *d, unsigned int on)
 	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
 	unsigned long flags;
 
+	if (d->parent_data)
+		irq_chip_set_wake_parent(d, on);
+
+	/*
+	 * While they may not wake up when the TLMM is powered off,
+	 * some GPIOs would like to wakeup the system from suspend
+	 * when TLMM is powered on. To allow that, enable the GPIO
+	 * summary line to be wakeup capable at GIC.
+	 */
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
 	irq_set_irq_wake(pctrl->irq, on);
@@ -992,6 +1053,30 @@ static void msm_gpio_irq_handler(struct irq_desc *desc)
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
@@ -1006,6 +1091,7 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 	struct gpio_irq_chip *girq;
 	int ret;
 	unsigned ngpio = pctrl->soc->ngpios;
+	struct device_node *dn;
 
 	if (WARN_ON(ngpio > MAX_NR_GPIO))
 		return -EINVAL;
@@ -1021,17 +1107,40 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 
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
 
+	dn = of_parse_phandle(pctrl->dev->of_node, "wakeup-parent", 0);
+	if (dn) {
+		int i;
+		bool skip;
+		unsigned int gpio;
+
+		chip->irq.parent_domain = irq_find_matching_host(dn,
+						 DOMAIN_BUS_WAKEUP);
+		of_node_put(dn);
+		if (!chip->irq.parent_domain)
+			return -EPROBE_DEFER;
+		chip->irq.child_to_parent_hwirq = msm_gpio_wakeirq;
+
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
@@ -1067,6 +1176,16 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 		}
 	}
 
+	/*
+	 * Since we are chained to the GIC using the TLMM summary line
+	 * and in hierarchy with the wakeup parent interrupt controller,
+	 * explicitly set the chained summary line. We need to do this because
+	 * the summary line is not routed to the wakeup parent but directly
+	 * to the GIC.
+	 */
+	gpiochip_set_chained_irqchip(chip, &pctrl->irq_chip, pctrl->irq,
+				     msm_gpio_irq_handler);
+
 	return 0;
 }
 
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index 48569cda8..1547020 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -5,6 +5,8 @@
 #ifndef __PINCTRL_MSM_H__
 #define __PINCTRL_MSM_H__
 
+#include <linux/gpio/driver.h>
+
 struct pinctrl_pin_desc;
 
 /**
@@ -92,6 +94,16 @@ struct msm_pingroup {
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
@@ -101,6 +113,8 @@ struct msm_pingroup {
  * @ngroups:	    The numbmer of entries in @groups.
  * @ngpio:	    The number of pingroups the driver should expose as GPIOs.
  * @pull_no_keeper: The SoC does not support keeper bias.
+ * @wakeirq_map:    The map of wakeup capable GPIOs and the pin at PDC/MPM
+ * @nwakeirq_map:   The number of entries in @hierarchy_map
  */
 struct msm_pinctrl_soc_data {
 	const struct pinctrl_pin_desc *pins;
@@ -114,6 +128,8 @@ struct msm_pinctrl_soc_data {
 	const char *const *tiles;
 	unsigned int ntiles;
 	const int *reserved_gpios;
+	const struct msm_gpio_wakeirq_map *wakeirq_map;
+	unsigned int nwakeirq_map;
 };
 
 extern const struct dev_pm_ops msm_pinctrl_dev_pm_ops;
diff --git a/include/linux/soc/qcom/irq.h b/include/linux/soc/qcom/irq.h
index 85ac4b6..098d57c 100644
--- a/include/linux/soc/qcom/irq.h
+++ b/include/linux/soc/qcom/irq.h
@@ -16,4 +16,17 @@
 #define IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP		(IRQ_DOMAIN_FLAG_NONCORE << 0)
 #define IRQ_DOMAIN_FLAG_QCOM_MPM_WAKEUP		(IRQ_DOMAIN_FLAG_NONCORE << 1)
 
+/**
+ * irq_domain_qcom_handle_wakeup: Return if the domain handles interrupt
+ *                                configuration
+ * @parent: irq domain
+ *
+ * This QCOM specific irq domain call returns if the interrupt controller
+ * requires the interrupt be masked at the child interrupt controller.
+ */
+static inline bool irq_domain_qcom_handle_wakeup(struct irq_domain *parent)
+{
+	return (parent->flags & IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP);
+}
+
 #endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

