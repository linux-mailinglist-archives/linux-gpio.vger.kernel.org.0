Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC2D3F465A
	for <lists+linux-gpio@lfdr.de>; Mon, 23 Aug 2021 10:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235470AbhHWIFx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 Aug 2021 04:05:53 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:53058 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235488AbhHWIFx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 23 Aug 2021 04:05:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629705911; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=liVXi05SB5unm8X7XLacM7I2ln2fD58WOmR6wSA0EJY=; b=DvI98GLnEi279H91ZGyWClGM2o7mkBW1RbchjHhQXtSLmOjtooznO7xxBu/euDj1yUD+aT27
 rQZbYzVq0YDRDHyx76zRkAZvDGQph09vYMvhC7C0yKMP70fbZeXfKrfombKd48KTKl60Vlb1
 sp7t9zduIfdwOupQ2LBcv+GcAyk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 612356aff588e42af10e749c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Aug 2021 08:05:03
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9E049C4361A; Mon, 23 Aug 2021 08:05:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 45191C43618;
        Mon, 23 Aug 2021 08:04:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 45191C43618
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     maz@kernel.org, tglx@linutronix.de
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, tkjos@google.com, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v3 2/2] irqchip/qcom-pdc: Start getting rid of the GPIO_NO_WAKE_IRQ
Date:   Mon, 23 Aug 2021 13:34:40 +0530
Message-Id: <1629705880-27877-3-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629705880-27877-1-git-send-email-mkshah@codeaurora.org>
References: <1629705880-27877-1-git-send-email-mkshah@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Marc Zyngier <maz@kernel.org>

gpio_to_irq() reports error at irq_domain_trim_hierarchy() for non
wakeup capable GPIOs that do not have dedicated interrupt at GIC.

Since PDC irqchip do not allocate irq at parent GIC domain for such
GPIOs indicate same by using irq_domain_disconnect_hierarchy().

Replace qcom_pdc_gic_mask/unmask() and qcom_pdc_gic_get/set_irqchip_state()
with respective parent forward callbacks since all they were doing is to
check for valid irq and forward to parent.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
Tested-by: Maulik Shah <mkshah@codeaurora.org>
---
 drivers/irqchip/qcom-pdc.c | 68 ++++++++--------------------------------------
 1 file changed, 11 insertions(+), 57 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 32d5920..173e652 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -53,26 +53,6 @@ static u32 pdc_reg_read(int reg, u32 i)
 	return readl_relaxed(pdc_base + reg + i * sizeof(u32));
 }
 
-static int qcom_pdc_gic_get_irqchip_state(struct irq_data *d,
-					  enum irqchip_irq_state which,
-					  bool *state)
-{
-	if (d->hwirq == GPIO_NO_WAKE_IRQ)
-		return 0;
-
-	return irq_chip_get_parent_state(d, which, state);
-}
-
-static int qcom_pdc_gic_set_irqchip_state(struct irq_data *d,
-					  enum irqchip_irq_state which,
-					  bool value)
-{
-	if (d->hwirq == GPIO_NO_WAKE_IRQ)
-		return 0;
-
-	return irq_chip_set_parent_state(d, which, value);
-}
-
 static void pdc_enable_intr(struct irq_data *d, bool on)
 {
 	int pin_out = d->hwirq;
@@ -91,38 +71,16 @@ static void pdc_enable_intr(struct irq_data *d, bool on)
 
 static void qcom_pdc_gic_disable(struct irq_data *d)
 {
-	if (d->hwirq == GPIO_NO_WAKE_IRQ)
-		return;
-
 	pdc_enable_intr(d, false);
 	irq_chip_disable_parent(d);
 }
 
 static void qcom_pdc_gic_enable(struct irq_data *d)
 {
-	if (d->hwirq == GPIO_NO_WAKE_IRQ)
-		return;
-
 	pdc_enable_intr(d, true);
 	irq_chip_enable_parent(d);
 }
 
-static void qcom_pdc_gic_mask(struct irq_data *d)
-{
-	if (d->hwirq == GPIO_NO_WAKE_IRQ)
-		return;
-
-	irq_chip_mask_parent(d);
-}
-
-static void qcom_pdc_gic_unmask(struct irq_data *d)
-{
-	if (d->hwirq == GPIO_NO_WAKE_IRQ)
-		return;
-
-	irq_chip_unmask_parent(d);
-}
-
 /*
  * GIC does not handle falling edge or active low. To allow falling edge and
  * active low interrupts to be handled at GIC, PDC has an inverter that inverts
@@ -159,14 +117,10 @@ enum pdc_irq_config_bits {
  */
 static int qcom_pdc_gic_set_type(struct irq_data *d, unsigned int type)
 {
-	int pin_out = d->hwirq;
 	enum pdc_irq_config_bits pdc_type;
 	enum pdc_irq_config_bits old_pdc_type;
 	int ret;
 
-	if (pin_out == GPIO_NO_WAKE_IRQ)
-		return 0;
-
 	switch (type) {
 	case IRQ_TYPE_EDGE_RISING:
 		pdc_type = PDC_EDGE_RISING;
@@ -191,8 +145,8 @@ static int qcom_pdc_gic_set_type(struct irq_data *d, unsigned int type)
 		return -EINVAL;
 	}
 
-	old_pdc_type = pdc_reg_read(IRQ_i_CFG, pin_out);
-	pdc_reg_write(IRQ_i_CFG, pin_out, pdc_type);
+	old_pdc_type = pdc_reg_read(IRQ_i_CFG, d->hwirq);
+	pdc_reg_write(IRQ_i_CFG, d->hwirq, pdc_type);
 
 	ret = irq_chip_set_type_parent(d, type);
 	if (ret)
@@ -216,12 +170,12 @@ static int qcom_pdc_gic_set_type(struct irq_data *d, unsigned int type)
 static struct irq_chip qcom_pdc_gic_chip = {
 	.name			= "PDC",
 	.irq_eoi		= irq_chip_eoi_parent,
-	.irq_mask		= qcom_pdc_gic_mask,
-	.irq_unmask		= qcom_pdc_gic_unmask,
+	.irq_mask		= irq_chip_mask_parent,
+	.irq_unmask		= irq_chip_unmask_parent,
 	.irq_disable		= qcom_pdc_gic_disable,
 	.irq_enable		= qcom_pdc_gic_enable,
-	.irq_get_irqchip_state	= qcom_pdc_gic_get_irqchip_state,
-	.irq_set_irqchip_state	= qcom_pdc_gic_set_irqchip_state,
+	.irq_get_irqchip_state	= irq_chip_get_parent_state,
+	.irq_set_irqchip_state	= irq_chip_set_parent_state,
 	.irq_retrigger		= irq_chip_retrigger_hierarchy,
 	.irq_set_type		= qcom_pdc_gic_set_type,
 	.flags			= IRQCHIP_MASK_ON_SUSPEND |
@@ -282,7 +236,7 @@ static int qcom_pdc_alloc(struct irq_domain *domain, unsigned int virq,
 
 	parent_hwirq = get_parent_hwirq(hwirq);
 	if (parent_hwirq == PDC_NO_PARENT_IRQ)
-		return 0;
+		return irq_domain_disconnect_hierarchy(domain->parent, virq);
 
 	if (type & IRQ_TYPE_EDGE_BOTH)
 		type = IRQ_TYPE_EDGE_RISING;
@@ -319,17 +273,17 @@ static int qcom_pdc_gpio_alloc(struct irq_domain *domain, unsigned int virq,
 	if (ret)
 		return ret;
 
+	if (hwirq == GPIO_NO_WAKE_IRQ)
+		return irq_domain_disconnect_hierarchy(domain, virq);
+
 	ret = irq_domain_set_hwirq_and_chip(domain, virq, hwirq,
 					    &qcom_pdc_gic_chip, NULL);
 	if (ret)
 		return ret;
 
-	if (hwirq == GPIO_NO_WAKE_IRQ)
-		return 0;
-
 	parent_hwirq = get_parent_hwirq(hwirq);
 	if (parent_hwirq == PDC_NO_PARENT_IRQ)
-		return 0;
+		return irq_domain_disconnect_hierarchy(domain->parent, virq);
 
 	if (type & IRQ_TYPE_EDGE_BOTH)
 		type = IRQ_TYPE_EDGE_RISING;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

