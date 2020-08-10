Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CA8124053F
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Aug 2020 13:22:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726446AbgHJLWz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Aug 2020 07:22:55 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:50284 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726606AbgHJLVx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 Aug 2020 07:21:53 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597058512; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=KHtJaMwqw4OFU9lDgwQ9JJ7ac4zj7luu1qJVM1mOZyY=; b=GMXFCLADuFux621fAij+9V7jNqEO7ZGJK45gM3jQ90CsLQ8NdiUySucuqlUpeRFR+dWHy1aw
 bING8Ym7zZg+KaSMqK7RRzT0ktVaJ95MVynFy284jFa3ikdKI1fGC2QEDjVOO0SWYHWhmYef
 BhpHxPaXDOM+GSHw6NS23eyL97c=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-west-2.postgun.com with SMTP id
 5f312dcdc85a1092b00bb4d2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 10 Aug 2020 11:21:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 584D7C433AD; Mon, 10 Aug 2020 11:21:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B0A0AC43395;
        Mon, 10 Aug 2020 11:21:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B0A0AC43395
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     bjorn.andersson@linaro.org, maz@kernel.org,
        linus.walleij@linaro.org, swboyd@chromium.org,
        evgreen@chromium.org, mka@chromium.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v4 6/7] irqchip: qcom-pdc: Unmask wake up irqs during suspend
Date:   Mon, 10 Aug 2020 16:50:59 +0530
Message-Id: <1597058460-16211-7-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597058460-16211-1-git-send-email-mkshah@codeaurora.org>
References: <1597058460-16211-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Douglas Anderson <dianders@chromium.org>

An interrupt that is masked but set for wakeup still needs to be able
to wake up the system.  Use the new irq_suspend_one() and
irq_resume_one() callback to handle this by unmasking at the hardware
level at suspend time and putting things back at resume time.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 drivers/irqchip/qcom-pdc.c | 51 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 49 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index c1c5dfa..dfcdfc5 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2017-2019, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/bitops.h>
 #include <linux/err.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
@@ -38,6 +39,9 @@ struct pdc_pin_region {
 	u32 cnt;
 };
 
+static DECLARE_BITMAP(pdc_wake_irqs, PDC_MAX_IRQS);
+static DECLARE_BITMAP(pdc_disabled_irqs, PDC_MAX_IRQS);
+
 static DEFINE_RAW_SPINLOCK(pdc_lock);
 static void __iomem *pdc_base;
 static struct pdc_pin_region *pdc_region;
@@ -89,11 +93,51 @@ static void pdc_enable_intr(struct irq_data *d, bool on)
 	raw_spin_unlock(&pdc_lock);
 }
 
+static void qcom_pdc_irq_suspend_one(struct irq_data *d)
+{
+	if (d->hwirq == GPIO_NO_WAKE_IRQ)
+		return;
+
+	if (test_bit(d->hwirq, pdc_wake_irqs) &&
+	    test_bit(d->hwirq, pdc_disabled_irqs)) {
+		/*
+		 * Disabled interrupts that have wake enabled need to be able
+		 * to wake us up from suspend.  Unmask them now to enable
+		 * this.
+		 */
+		pdc_enable_intr(d, true);
+		irq_chip_unmask_parent(d);
+	}
+}
+
+static void qcom_pdc_irq_resume_one(struct irq_data *d)
+{
+	if (d->hwirq == GPIO_NO_WAKE_IRQ)
+		return;
+
+	if (test_bit(d->hwirq, pdc_wake_irqs) &&
+	    test_bit(d->hwirq, pdc_disabled_irqs)) {
+		irq_chip_mask_parent(d);
+		pdc_enable_intr(d, false);
+	}
+}
+
+static int qcom_pdc_gic_set_wake(struct irq_data *d, unsigned int on)
+{
+	if (on)
+		set_bit(d->hwirq, pdc_wake_irqs);
+	else
+		clear_bit(d->hwirq, pdc_wake_irqs);
+
+	return irq_chip_set_wake_parent(d, on);
+}
+
 static void qcom_pdc_gic_disable(struct irq_data *d)
 {
 	if (d->hwirq == GPIO_NO_WAKE_IRQ)
 		return;
 
+	set_bit(d->hwirq, pdc_disabled_irqs);
 	pdc_enable_intr(d, false);
 	irq_chip_disable_parent(d);
 }
@@ -103,6 +147,7 @@ static void qcom_pdc_gic_enable(struct irq_data *d)
 	if (d->hwirq == GPIO_NO_WAKE_IRQ)
 		return;
 
+	clear_bit(d->hwirq, pdc_disabled_irqs);
 	pdc_enable_intr(d, true);
 	irq_chip_enable_parent(d);
 }
@@ -201,13 +246,15 @@ static struct irq_chip qcom_pdc_gic_chip = {
 	.irq_unmask		= qcom_pdc_gic_unmask,
 	.irq_disable		= qcom_pdc_gic_disable,
 	.irq_enable		= qcom_pdc_gic_enable,
+	.irq_set_wake		= qcom_pdc_gic_set_wake,
+	.irq_suspend_one	= qcom_pdc_irq_suspend_one,
+	.irq_resume_one		= qcom_pdc_irq_resume_one,
 	.irq_get_irqchip_state	= qcom_pdc_gic_get_irqchip_state,
 	.irq_set_irqchip_state	= qcom_pdc_gic_set_irqchip_state,
 	.irq_retrigger		= irq_chip_retrigger_hierarchy,
 	.irq_set_type		= qcom_pdc_gic_set_type,
 	.flags			= IRQCHIP_MASK_ON_SUSPEND |
-				  IRQCHIP_SET_TYPE_MASKED |
-				  IRQCHIP_SKIP_SET_WAKE,
+				  IRQCHIP_SET_TYPE_MASKED,
 	.irq_set_vcpu_affinity	= irq_chip_set_vcpu_affinity_parent,
 	.irq_set_affinity	= irq_chip_set_affinity_parent,
 };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

