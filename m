Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DE340FE7A2
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 23:18:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727164AbfKOWSW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 17:18:22 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:47306 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbfKOWRs (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 17:17:48 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id C76FF60AA3; Fri, 15 Nov 2019 22:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573856267;
        bh=echEAncTOUJiYJA/bjRD/OX2LN1DEn0t4NPd974kGXg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MtfMEDvugELi+AX5A+0KP8W3d5GVeT32fwQiHTrRG4fxxj7TtR6U3r1JPRHdSXuV8
         aZD0UFQHBYMdmgNxt30vPwpt60SX3d9m4u+nd9zDM/cg31SQOJXyGsWdKumG0ZbWO0
         M9Au5vOduh+YQFBsb8dk12ZUzzPmKW2erb+zjfAg=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 82DCC61015;
        Fri, 15 Nov 2019 22:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573856266;
        bh=echEAncTOUJiYJA/bjRD/OX2LN1DEn0t4NPd974kGXg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ojmKj13Sf5MVBGlf2Sf+H2CC9jTqL/E0Q7bgSuMylegssEqv4yKx/Y1UHT3eD89sO
         3bVgmaj6tH9PkjAoQAyCsPSE33iD5Kz2z9EzZMRXHBagI6Obr+DkDKFmaRWWyWpdiQ
         K378DGHlGfGBnOpTp8JMS1W06fCCOGvL0mSiAjgU=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 82DCC61015
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, maz@kernel.org, linus.walleij@linaro.org,
        bjorn.andersson@linaro.org
Cc:     evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH v2 04/12] drivers: irqchip: add PDC irqdomain for wakeup capable GPIOs
Date:   Fri, 15 Nov 2019 15:11:47 -0700
Message-Id: <1573855915-9841-5-git-send-email-ilina@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573855915-9841-1-git-send-email-ilina@codeaurora.org>
References: <1573855915-9841-1-git-send-email-ilina@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Introduce a new domain for wakeup capable GPIOs. The domain can be
requested using the bus token DOMAIN_BUS_WAKEUP. In the following
patches, we will specify PDC as the wakeup-parent for the TLMM GPIO
irqchip. Requesting a wakeup GPIO will setup the GPIO and the
corresponding PDC interrupt as its parent.

Co-developed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Lina Iyer <ilina@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
Changes in v1:
	- Include irqdomain.h
Changes in RFC v2:
	- Move irq_domain_qcom_handle_wakeup to the patch where it is
	used
	- Replace #define definitons
	- Add Signed-off-by and other minor changes
---
 drivers/irqchip/qcom-pdc.c   | 104 +++++++++++++++++++++++++++++++++++++++----
 include/linux/soc/qcom/irq.h |  21 +++++++++
 2 files changed, 116 insertions(+), 9 deletions(-)
 create mode 100644 include/linux/soc/qcom/irq.h

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 527c29e..4f2c762 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -13,12 +13,13 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_device.h>
+#include <linux/soc/qcom/irq.h>
 #include <linux/spinlock.h>
-#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/types.h>
 
 #define PDC_MAX_IRQS		168
+#define PDC_MAX_GPIO_IRQS	256
 
 #define CLEAR_INTR(reg, intr)	(reg & ~(1 << intr))
 #define ENABLE_INTR(reg, intr)	(reg | (1 << intr))
@@ -26,6 +27,8 @@
 #define IRQ_ENABLE_BANK		0x10
 #define IRQ_i_CFG		0x110
 
+#define PDC_NO_PARENT_IRQ	~0UL
+
 struct pdc_pin_region {
 	u32 pin_base;
 	u32 parent_base;
@@ -65,23 +68,35 @@ static void pdc_enable_intr(struct irq_data *d, bool on)
 
 static void qcom_pdc_gic_disable(struct irq_data *d)
 {
+	if (d->hwirq == GPIO_NO_WAKE_IRQ)
+		return;
+
 	pdc_enable_intr(d, false);
 	irq_chip_disable_parent(d);
 }
 
 static void qcom_pdc_gic_enable(struct irq_data *d)
 {
+	if (d->hwirq == GPIO_NO_WAKE_IRQ)
+		return;
+
 	pdc_enable_intr(d, true);
 	irq_chip_enable_parent(d);
 }
 
 static void qcom_pdc_gic_mask(struct irq_data *d)
 {
+	if (d->hwirq == GPIO_NO_WAKE_IRQ)
+		return;
+
 	irq_chip_mask_parent(d);
 }
 
 static void qcom_pdc_gic_unmask(struct irq_data *d)
 {
+	if (d->hwirq == GPIO_NO_WAKE_IRQ)
+		return;
+
 	irq_chip_unmask_parent(d);
 }
 
@@ -124,6 +139,9 @@ static int qcom_pdc_gic_set_type(struct irq_data *d, unsigned int type)
 	int pin_out = d->hwirq;
 	enum pdc_irq_config_bits pdc_type;
 
+	if (pin_out == GPIO_NO_WAKE_IRQ)
+		return 0;
+
 	switch (type) {
 	case IRQ_TYPE_EDGE_RISING:
 		pdc_type = PDC_EDGE_RISING;
@@ -181,8 +199,7 @@ static irq_hw_number_t get_parent_hwirq(int pin)
 			return (region->parent_base + pin - region->pin_base);
 	}
 
-	WARN_ON(1);
-	return ~0UL;
+	return PDC_NO_PARENT_IRQ;
 }
 
 static int qcom_pdc_translate(struct irq_domain *d, struct irq_fwspec *fwspec,
@@ -211,17 +228,17 @@ static int qcom_pdc_alloc(struct irq_domain *domain, unsigned int virq,
 
 	ret = qcom_pdc_translate(domain, fwspec, &hwirq, &type);
 	if (ret)
-		return -EINVAL;
-
-	parent_hwirq = get_parent_hwirq(hwirq);
-	if (parent_hwirq == ~0UL)
-		return -EINVAL;
+		return ret;
 
 	ret  = irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
 					     &qcom_pdc_gic_chip, NULL);
 	if (ret)
 		return ret;
 
+	parent_hwirq = get_parent_hwirq(hwirq);
+	if (parent_hwirq == PDC_NO_PARENT_IRQ)
+		return 0;
+
 	if (type & IRQ_TYPE_EDGE_BOTH)
 		type = IRQ_TYPE_EDGE_RISING;
 
@@ -244,6 +261,60 @@ static const struct irq_domain_ops qcom_pdc_ops = {
 	.free		= irq_domain_free_irqs_common,
 };
 
+static int qcom_pdc_gpio_alloc(struct irq_domain *domain, unsigned int virq,
+			       unsigned int nr_irqs, void *data)
+{
+	struct irq_fwspec *fwspec = data;
+	struct irq_fwspec parent_fwspec;
+	irq_hw_number_t hwirq, parent_hwirq;
+	unsigned int type;
+	int ret;
+
+	ret = qcom_pdc_translate(domain, fwspec, &hwirq, &type);
+	if (ret)
+		return ret;
+
+	ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
+					    &qcom_pdc_gic_chip, NULL);
+	if (ret)
+		return ret;
+
+	if (hwirq == GPIO_NO_WAKE_IRQ)
+		return 0;
+
+	parent_hwirq = get_parent_hwirq(hwirq);
+	if (parent_hwirq == PDC_NO_PARENT_IRQ)
+		return 0;
+
+	if (type & IRQ_TYPE_EDGE_BOTH)
+		type = IRQ_TYPE_EDGE_RISING;
+
+	if (type & IRQ_TYPE_LEVEL_MASK)
+		type = IRQ_TYPE_LEVEL_HIGH;
+
+	parent_fwspec.fwnode      = domain->parent->fwnode;
+	parent_fwspec.param_count = 3;
+	parent_fwspec.param[0]    = 0;
+	parent_fwspec.param[1]    = parent_hwirq;
+	parent_fwspec.param[2]    = type;
+
+	return irq_domain_alloc_irqs_parent(domain, virq, nr_irqs,
+					    &parent_fwspec);
+}
+
+static int qcom_pdc_gpio_domain_select(struct irq_domain *d,
+				       struct irq_fwspec *fwspec,
+				       enum irq_domain_bus_token bus_token)
+{
+	return bus_token == DOMAIN_BUS_WAKEUP;
+}
+
+static const struct irq_domain_ops qcom_pdc_gpio_ops = {
+	.select		= qcom_pdc_gpio_domain_select,
+	.alloc		= qcom_pdc_gpio_alloc,
+	.free		= irq_domain_free_irqs_common,
+};
+
 static int pdc_setup_pin_mapping(struct device_node *np)
 {
 	int ret, n;
@@ -282,7 +353,7 @@ static int pdc_setup_pin_mapping(struct device_node *np)
 
 static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
 {
-	struct irq_domain *parent_domain, *pdc_domain;
+	struct irq_domain *parent_domain, *pdc_domain, *pdc_gpio_domain;
 	int ret;
 
 	pdc_base = of_iomap(node, 0);
@@ -313,8 +384,23 @@ static int qcom_pdc_init(struct device_node *node, struct device_node *parent)
 		goto fail;
 	}
 
+	pdc_gpio_domain = irq_domain_create_hierarchy(parent_domain,
+					IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP,
+					PDC_MAX_GPIO_IRQS,
+					of_fwnode_handle(node),
+					&qcom_pdc_gpio_ops, NULL);
+	if (!pdc_gpio_domain) {
+		pr_err("%pOF: PDC domain add failed for GPIO domain\n", node);
+		ret = -ENOMEM;
+		goto remove;
+	}
+
+	irq_domain_update_bus_token(pdc_gpio_domain, DOMAIN_BUS_WAKEUP);
+
 	return 0;
 
+remove:
+	irq_domain_remove(pdc_domain);
 fail:
 	kfree(pdc_region);
 	iounmap(pdc_base);
diff --git a/include/linux/soc/qcom/irq.h b/include/linux/soc/qcom/irq.h
new file mode 100644
index 0000000..637c0bf
--- /dev/null
+++ b/include/linux/soc/qcom/irq.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __QCOM_IRQ_H
+#define __QCOM_IRQ_H
+
+#include <linux/irqdomain.h>
+
+#define GPIO_NO_WAKE_IRQ	~0U
+
+/**
+ * QCOM specific IRQ domain flags that distinguishes the handling of wakeup
+ * capable interrupts by different interrupt controllers.
+ *
+ * IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP: Line must be masked at TLMM and the
+ *                                  interrupt configuration is done at PDC
+ * IRQ_DOMAIN_FLAG_QCOM_MPM_WAKEUP: Interrupt configuration is handled at TLMM
+ */
+#define IRQ_DOMAIN_FLAG_QCOM_PDC_WAKEUP		(IRQ_DOMAIN_FLAG_NONCORE << 0)
+#define IRQ_DOMAIN_FLAG_QCOM_MPM_WAKEUP		(IRQ_DOMAIN_FLAG_NONCORE << 1)
+
+#endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

