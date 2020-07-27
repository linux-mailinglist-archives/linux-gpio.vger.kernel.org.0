Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5920822F466
	for <lists+linux-gpio@lfdr.de>; Mon, 27 Jul 2020 18:12:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728648AbgG0QMV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 27 Jul 2020 12:12:21 -0400
Received: from mga18.intel.com ([134.134.136.126]:52576 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727975AbgG0QMV (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 27 Jul 2020 12:12:21 -0400
IronPort-SDR: cN4/hN8hmRMRId0fc/1IiEMjGtrqTzWsmo9hpLj3T1/KAkodBsjALBeQ1VoYxTXU1xAjTN/Drh
 EHGtApLPFS9A==
X-IronPort-AV: E=McAfee;i="6000,8403,9694"; a="138566299"
X-IronPort-AV: E=Sophos;i="5.75,402,1589266800"; 
   d="scan'208";a="138566299"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jul 2020 09:12:20 -0700
IronPort-SDR: P4oSVaPC8SCONCqH8pl67q+bL05V2mXOZqxAiT9ncO+90+K0VEQAhHoohn3YBwc42JPU0WgJah
 2YrWoWPp96cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,402,1589266800"; 
   d="scan'208";a="272036800"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 27 Jul 2020 09:12:18 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2191DCB; Mon, 27 Jul 2020 19:12:17 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-gpio@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 2/3] pinctrl: cherryview: Move custom community members to separate data struct
Date:   Mon, 27 Jul 2020 19:12:15 +0300
Message-Id: <20200727161216.67115-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200727161216.67115-1-andriy.shevchenko@linux.intel.com>
References: <20200727161216.67115-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

This is a preparatory patch for bigger clean up pending for Cherryview driver.
There is no functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 45 +++++++++++++++-------
 1 file changed, 31 insertions(+), 14 deletions(-)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index 41708f7ea65c..6b2fbc0ac422 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -72,6 +72,16 @@ struct intel_pad_context {
 	u32 padctrl1;
 };
 
+/**
+ * struct intel_community_context - community context for Cherryview
+ * @intr_lines: Mapping between 16 HW interrupt wires and GPIO offset (in GPIO number space)
+ * @saved_intmask: Interrupt mask saved for system sleep
+ */
+struct intel_community_context {
+	unsigned int intr_lines[16];
+	u32 saved_intmask;
+};
+
 /**
  * struct chv_pinctrl - CHV pinctrl private structure
  * @dev: Pointer to the parent device
@@ -84,8 +94,6 @@ struct intel_pad_context {
  * @ncommunities: Number of communities in this pin controller
  * @context: Configuration saved over system sleep
  * @irq: Our parent irq
- * @intr_lines: Mapping between 16 HW interrupt wires and GPIO offset (in GPIO number space)
- * @saved_intmask: Interrupt mask saved for system sleep
  */
 struct chv_pinctrl {
 	struct device *dev;
@@ -98,9 +106,6 @@ struct chv_pinctrl {
 	size_t ncommunities;
 	struct intel_pinctrl_context context;
 	int irq;
-
-	unsigned int intr_lines[16];
-	u32 saved_intmask;
 };
 
 #define	PINMODE_INVERT_OE	BIT(15)
@@ -815,12 +820,13 @@ static int chv_gpio_request_enable(struct pinctrl_dev *pctldev,
 			return -EBUSY;
 		}
 	} else {
+		struct intel_community_context *cctx = &pctrl->context.communities[0];
 		int i;
 
 		/* Reset the interrupt mapping */
-		for (i = 0; i < ARRAY_SIZE(pctrl->intr_lines); i++) {
-			if (pctrl->intr_lines[i] == offset) {
-				pctrl->intr_lines[i] = 0;
+		for (i = 0; i < ARRAY_SIZE(cctx->intr_lines); i++) {
+			if (cctx->intr_lines[i] == offset) {
+				cctx->intr_lines[i] = 0;
 				break;
 			}
 		}
@@ -1310,6 +1316,7 @@ static unsigned chv_gpio_irq_startup(struct irq_data *d)
 	if (irqd_get_trigger_type(d) == IRQ_TYPE_NONE) {
 		struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 		struct chv_pinctrl *pctrl = gpiochip_get_data(gc);
+		struct intel_community_context *cctx = &pctrl->context.communities[0];
 		unsigned int pin = irqd_to_hwirq(d);
 		irq_flow_handler_t handler;
 		unsigned long flags;
@@ -1326,9 +1333,9 @@ static unsigned chv_gpio_irq_startup(struct irq_data *d)
 		else
 			handler = handle_edge_irq;
 
-		if (!pctrl->intr_lines[intsel]) {
+		if (!cctx->intr_lines[intsel]) {
 			irq_set_handler_locked(d, handler);
-			pctrl->intr_lines[intsel] = pin;
+			cctx->intr_lines[intsel] = pin;
 		}
 		raw_spin_unlock_irqrestore(&chv_lock, flags);
 	}
@@ -1341,6 +1348,7 @@ static int chv_gpio_irq_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct chv_pinctrl *pctrl = gpiochip_get_data(gc);
+	struct intel_community_context *cctx = &pctrl->context.communities[0];
 	unsigned int pin = irqd_to_hwirq(d);
 	unsigned long flags;
 	u32 value;
@@ -1385,7 +1393,7 @@ static int chv_gpio_irq_type(struct irq_data *d, unsigned int type)
 	value &= CHV_PADCTRL0_INTSEL_MASK;
 	value >>= CHV_PADCTRL0_INTSEL_SHIFT;
 
-	pctrl->intr_lines[value] = pin;
+	cctx->intr_lines[value] = pin;
 
 	if (type & IRQ_TYPE_EDGE_BOTH)
 		irq_set_handler_locked(d, handle_edge_irq);
@@ -1402,6 +1410,7 @@ static void chv_gpio_irq_handler(struct irq_desc *desc)
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
 	struct chv_pinctrl *pctrl = gpiochip_get_data(gc);
 	const struct intel_community *community = &pctrl->communities[0];
+	struct intel_community_context *cctx = &pctrl->context.communities[0];
 	struct irq_chip *chip = irq_desc_get_chip(desc);
 	unsigned long pending;
 	unsigned long flags;
@@ -1416,7 +1425,7 @@ static void chv_gpio_irq_handler(struct irq_desc *desc)
 	for_each_set_bit(intr_line, &pending, community->nirqs) {
 		unsigned int irq, offset;
 
-		offset = pctrl->intr_lines[intr_line];
+		offset = cctx->intr_lines[intr_line];
 		irq = irq_find_mapping(gc->irq.domain, offset);
 		generic_handle_irq(irq);
 	}
@@ -1674,6 +1683,12 @@ static int chv_pinctrl_probe(struct platform_device *pdev)
 		return -ENOMEM;
 #endif
 
+	pctrl->context.communities = devm_kcalloc(dev, pctrl->soc->ncommunities,
+						  sizeof(*pctrl->context.communities),
+						  GFP_KERNEL);
+	if (!pctrl->context.communities)
+		return -ENOMEM;
+
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
@@ -1722,12 +1737,13 @@ static int chv_pinctrl_remove(struct platform_device *pdev)
 static int chv_pinctrl_suspend_noirq(struct device *dev)
 {
 	struct chv_pinctrl *pctrl = dev_get_drvdata(dev);
+	struct intel_community_context *cctx = &pctrl->context.communities[0];
 	unsigned long flags;
 	int i;
 
 	raw_spin_lock_irqsave(&chv_lock, flags);
 
-	pctrl->saved_intmask = chv_pctrl_readl(pctrl, CHV_INTMASK);
+	cctx->saved_intmask = chv_pctrl_readl(pctrl, CHV_INTMASK);
 
 	for (i = 0; i < pctrl->soc->npins; i++) {
 		const struct pinctrl_pin_desc *desc;
@@ -1751,6 +1767,7 @@ static int chv_pinctrl_suspend_noirq(struct device *dev)
 static int chv_pinctrl_resume_noirq(struct device *dev)
 {
 	struct chv_pinctrl *pctrl = dev_get_drvdata(dev);
+	struct intel_community_context *cctx = &pctrl->context.communities[0];
 	unsigned long flags;
 	int i;
 
@@ -1794,7 +1811,7 @@ static int chv_pinctrl_resume_noirq(struct device *dev)
 	 * the interrupt mask register as well.
 	 */
 	chv_pctrl_writel(pctrl, CHV_INTSTAT, 0xffff);
-	chv_pctrl_writel(pctrl, CHV_INTMASK, pctrl->saved_intmask);
+	chv_pctrl_writel(pctrl, CHV_INTMASK, cctx->saved_intmask);
 
 	raw_spin_unlock_irqrestore(&chv_lock, flags);
 
-- 
2.27.0

