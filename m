Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E2AF3F1896
	for <lists+linux-gpio@lfdr.de>; Thu, 19 Aug 2021 13:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239145AbhHSLyV (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 19 Aug 2021 07:54:21 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:15806 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238957AbhHSLyU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Aug 2021 07:54:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629374024; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=i66q2zTCloki0moxZ/u6js2b36dxRdxY0yzFrFjiXLI=; b=CVKsKkICRzVwc9jPIqf4QKz+ODrAaqp1dxu9gHJxR1q1FEsgvTk4Dd7KnGZht8CWX0Ddb7wJ
 NQncP4UhCCy8NRSU3AoMeDytcjHkKkIdNkHRXVWXGipiOpvpfjJR3GeD8lif1/Tj+jPWjW6X
 bXoR1ds/J6D+Oe9ZRgDR9mMpMCE=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 611e46412892f803bcd3de27 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 19 Aug 2021 11:53:37
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A9943C4338F; Thu, 19 Aug 2021 11:53:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CFC4CC43619;
        Thu, 19 Aug 2021 11:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org CFC4CC43619
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     maz@kernel.org, tglx@linutronix.de
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, tkjos@google.com, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v2 3/3] irqchip/qcom-pdc: Start getting rid of the GPIO_NO_WAKE_IRQ
Date:   Thu, 19 Aug 2021 17:23:13 +0530
Message-Id: <1629373993-13370-4-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629373993-13370-1-git-send-email-mkshah@codeaurora.org>
References: <1629373993-13370-1-git-send-email-mkshah@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Marc Zyngier <maz@kernel.org>

gpio_to_irq() reports error at irq_domain_trim_hierarchy() for non
wakeup capable GPIOs that do not have dedicated interrupt at GIC.

Since PDC irqchip do not allocate irq at parent GIC domain for such
GPIOs indicate same by using irq_domain_disconnect_hierarchy() for
PDC and parent GIC domains.

Signed-off-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
[mkshah: Add loop to disconnect for all parents]
Tested-by: Maulik Shah <mkshah@codeaurora.org>
---
 drivers/irqchip/qcom-pdc.c | 75 +++++++++++-----------------------------------
 1 file changed, 18 insertions(+), 57 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 32d5920..696afca 100644
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
@@ -314,22 +268,29 @@ static int qcom_pdc_gpio_alloc(struct irq_domain *domain, unsigned int virq,
 	irq_hw_number_t hwirq, parent_hwirq;
 	unsigned int type;
 	int ret;
+	struct irq_domain *parent;
 
 	ret = qcom_pdc_translate(domain, fwspec, &hwirq, &type);
 	if (ret)
 		return ret;
 
+	if (hwirq == GPIO_NO_WAKE_IRQ) {
+		for (parent = domain; parent; parent = parent->parent) {
+			ret = irq_domain_disconnect_hierarchy(parent, virq);
+			if (ret)
+				return ret;
+		}
+		return 0;
+	}
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

