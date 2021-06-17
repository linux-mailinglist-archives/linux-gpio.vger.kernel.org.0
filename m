Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80F8E3AB65F
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Jun 2021 16:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231690AbhFQOs4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Jun 2021 10:48:56 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:8518 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S231434AbhFQOsz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 17 Jun 2021 10:48:55 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15HEgZlG011624;
        Thu, 17 Jun 2021 16:46:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=9eAIH/c1C9SoJMJkgfe4NdUCCQ+ZQVB7bmyQrk0Sfcs=;
 b=pubXGlpDeccznFIc17ANWReKErIUzfdXf8xl5diEzX9w3eSTosaoF6+Hv+k6sozjgUU0
 kRPe0KSZ+a17fM6RMQ+HTcc/+WTLiHRcKM5amQxJT8ev4OfmKuqaIGoIVX+rp6winWQ2
 AWJsEZJame4sXpwtpI/apPkq2kXm+5kyljeIXCD60YoBJ3vGDXSYXB8wZUjLZYtOYO8W
 hNLG1qzepspXNaA56LssfzzYoWAD0ZEfshz6x5Wb9VabVDc1z6nDQjxYeDTXFpYBOdF/
 5lj1v+hiJkMRiwWxSM7S62T1Lm0qS5Z5VpuoiaWOmjYjz9BsuY+cScPvaNywyMPtlhUn rg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3984bm1kmg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 17 Jun 2021 16:46:22 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ED1C910002A;
        Thu, 17 Jun 2021 16:46:21 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D892F22AEDB;
        Thu, 17 Jun 2021 16:46:21 +0200 (CEST)
Received: from localhost (10.75.127.46) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 17 Jun 2021 16:46:21
 +0200
From:   Fabien Dessenne <fabien.dessenne@foss.st.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     Fabien Dessenne <fabien.dessenne@foss.st.com>
Subject: [PATCH] pinctrl: stm32: check for IRQ MUX validity during alloc()
Date:   Thu, 17 Jun 2021 16:46:02 +0200
Message-ID: <20210617144602.2557619-1-fabien.dessenne@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.790
 definitions=2021-06-17_13:2021-06-15,2021-06-17 signatures=0
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Considering the following irq_domain_ops call chain:
- .alloc() is called when a clients calls platform_get_irq() or
  gpiod_to_irq()
- .activate() is called next, when the clients calls
  request_threaded_irq()
Check for the IRQ MUX conflict during the first stage (alloc instead of
activate). This avoids to provide the client with an IRQ that can't be
used.

Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 79 ++++++++++++++-------------
 1 file changed, 40 insertions(+), 39 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index ad9eb5ed8e81..63e0c78d4a7e 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -414,57 +414,25 @@ static int stm32_gpio_domain_activate(struct irq_domain *d,
 {
 	struct stm32_gpio_bank *bank = d->host_data;
 	struct stm32_pinctrl *pctl = dev_get_drvdata(bank->gpio_chip.parent);
-	unsigned long flags;
 	int ret = 0;
 
-	/*
-	 * gpio irq mux is shared between several banks, a lock has to be done
-	 * to avoid overriding.
-	 */
-	spin_lock_irqsave(&pctl->irqmux_lock, flags);
-
 	if (pctl->hwlock) {
 		ret = hwspin_lock_timeout_in_atomic(pctl->hwlock,
 						    HWSPNLCK_TIMEOUT);
 		if (ret) {
 			dev_err(pctl->dev, "Can't get hwspinlock\n");
-			goto unlock;
+			return ret;
 		}
 	}
 
-	if (pctl->irqmux_map & BIT(irq_data->hwirq)) {
-		dev_err(pctl->dev, "irq line %ld already requested.\n",
-			irq_data->hwirq);
-		ret = -EBUSY;
-		if (pctl->hwlock)
-			hwspin_unlock_in_atomic(pctl->hwlock);
-		goto unlock;
-	} else {
-		pctl->irqmux_map |= BIT(irq_data->hwirq);
-	}
-
 	regmap_field_write(pctl->irqmux[irq_data->hwirq], bank->bank_ioport_nr);
 
 	if (pctl->hwlock)
 		hwspin_unlock_in_atomic(pctl->hwlock);
 
-unlock:
-	spin_unlock_irqrestore(&pctl->irqmux_lock, flags);
 	return ret;
 }
 
-static void stm32_gpio_domain_deactivate(struct irq_domain *d,
-					 struct irq_data *irq_data)
-{
-	struct stm32_gpio_bank *bank = d->host_data;
-	struct stm32_pinctrl *pctl = dev_get_drvdata(bank->gpio_chip.parent);
-	unsigned long flags;
-
-	spin_lock_irqsave(&pctl->irqmux_lock, flags);
-	pctl->irqmux_map &= ~BIT(irq_data->hwirq);
-	spin_unlock_irqrestore(&pctl->irqmux_lock, flags);
-}
-
 static int stm32_gpio_domain_alloc(struct irq_domain *d,
 				   unsigned int virq,
 				   unsigned int nr_irqs, void *data)
@@ -472,9 +440,28 @@ static int stm32_gpio_domain_alloc(struct irq_domain *d,
 	struct stm32_gpio_bank *bank = d->host_data;
 	struct irq_fwspec *fwspec = data;
 	struct irq_fwspec parent_fwspec;
-	irq_hw_number_t hwirq;
+	struct stm32_pinctrl *pctl = dev_get_drvdata(bank->gpio_chip.parent);
+	irq_hw_number_t hwirq = fwspec->param[0];
+	unsigned long flags;
+	int ret = 0;
+
+	/*
+	 * Check first that the IRQ MUX of that line is free.
+	 * gpio irq mux is shared between several banks, protect with a lock
+	 */
+	spin_lock_irqsave(&pctl->irqmux_lock, flags);
+
+	if (pctl->irqmux_map & BIT(hwirq)) {
+		dev_err(pctl->dev, "irq line %ld already requested.\n", hwirq);
+		ret = -EBUSY;
+	} else {
+		pctl->irqmux_map |= BIT(hwirq);
+	}
+
+	spin_unlock_irqrestore(&pctl->irqmux_lock, flags);
+	if (ret)
+		return ret;
 
-	hwirq = fwspec->param[0];
 	parent_fwspec.fwnode = d->parent->fwnode;
 	parent_fwspec.param_count = 2;
 	parent_fwspec.param[0] = fwspec->param[0];
@@ -486,12 +473,26 @@ static int stm32_gpio_domain_alloc(struct irq_domain *d,
 	return irq_domain_alloc_irqs_parent(d, virq, nr_irqs, &parent_fwspec);
 }
 
+static void stm32_gpio_domain_free(struct irq_domain *d, unsigned int virq,
+				   unsigned int nr_irqs)
+{
+	struct stm32_gpio_bank *bank = d->host_data;
+	struct stm32_pinctrl *pctl = dev_get_drvdata(bank->gpio_chip.parent);
+	struct irq_data *irq_data = irq_domain_get_irq_data(d, virq);
+	unsigned long flags, hwirq = irq_data->hwirq;
+
+	irq_domain_free_irqs_common(d, virq, nr_irqs);
+
+	spin_lock_irqsave(&pctl->irqmux_lock, flags);
+	pctl->irqmux_map &= ~BIT(hwirq);
+	spin_unlock_irqrestore(&pctl->irqmux_lock, flags);
+}
+
 static const struct irq_domain_ops stm32_gpio_domain_ops = {
-	.translate      = stm32_gpio_domain_translate,
-	.alloc          = stm32_gpio_domain_alloc,
-	.free           = irq_domain_free_irqs_common,
+	.translate	= stm32_gpio_domain_translate,
+	.alloc		= stm32_gpio_domain_alloc,
+	.free		= stm32_gpio_domain_free,
 	.activate	= stm32_gpio_domain_activate,
-	.deactivate	= stm32_gpio_domain_deactivate,
 };
 
 /* Pinctrl functions */
-- 
2.25.1

