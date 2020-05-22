Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 172411DE7E8
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2020 15:20:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729940AbgEVNUj (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 May 2020 09:20:39 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:59174 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729894AbgEVNUh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 22 May 2020 09:20:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590153637; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Xa/qM4zqWRu1/eInpOYfgqH291JWzSNfqUyeAVg2f5M=; b=K/CYCBuBJ5ZDrF2sk6L1jtZvQoCldiE2obF7bVE9sSONsfY+C7RzUe+VDSwUBQM5Jli39MpQ
 /xkb5mNg16J24+aToShusZorogr5KvXMW9k0oIU7yXc8/nqzA21BFypZ/QwWXEedDlaPP0sB
 JxrZxJBZjiQBJB99wPU2fCIIywE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5ec7d1a22a41f3ed00706b77 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 22 May 2020 13:20:34
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2E53CC433AD; Fri, 22 May 2020 13:20:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DD2A7C433CA;
        Fri, 22 May 2020 13:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DD2A7C433CA
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
Subject: [PATCH 4/4] irqchip: qcom-pdc: Introduce irq_set_wake call
Date:   Fri, 22 May 2020 18:49:29 +0530
Message-Id: <1590153569-21706-5-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590153569-21706-1-git-send-email-mkshah@codeaurora.org>
References: <1590153569-21706-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Remove irq_disable callback to allow lazy disable for pdc interrupts.

Add irq_set_wake callback that unmask interrupt in HW when drivers
mark interrupt for wakeup. Interrupt will be cleared in HW during
lazy disable if its not marked for wakeup.

Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 drivers/irqchip/qcom-pdc.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 6ae9e1f..f7c0662 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -36,6 +36,7 @@ struct pdc_pin_region {
 	u32 cnt;
 };
 
+DECLARE_BITMAP(pdc_wake_irqs, PDC_MAX_IRQS);
 static DEFINE_RAW_SPINLOCK(pdc_lock);
 static void __iomem *pdc_base;
 static struct pdc_pin_region *pdc_region;
@@ -87,22 +88,20 @@ static void pdc_enable_intr(struct irq_data *d, bool on)
 	raw_spin_unlock(&pdc_lock);
 }
 
-static void qcom_pdc_gic_disable(struct irq_data *d)
+static int qcom_pdc_gic_set_wake(struct irq_data *d, unsigned int on)
 {
 	if (d->hwirq == GPIO_NO_WAKE_IRQ)
-		return;
-
-	pdc_enable_intr(d, false);
-	irq_chip_disable_parent(d);
-}
+		return 0;
 
-static void qcom_pdc_gic_enable(struct irq_data *d)
-{
-	if (d->hwirq == GPIO_NO_WAKE_IRQ)
-		return;
+	if (on) {
+		pdc_enable_intr(d, true);
+		irq_chip_enable_parent(d);
+		set_bit(d->hwirq, pdc_wake_irqs);
+	} else {
+		clear_bit(d->hwirq, pdc_wake_irqs);
+	}
 
-	pdc_enable_intr(d, true);
-	irq_chip_enable_parent(d);
+	return irq_chip_set_wake_parent(d, on);
 }
 
 static void qcom_pdc_gic_mask(struct irq_data *d)
@@ -110,6 +109,9 @@ static void qcom_pdc_gic_mask(struct irq_data *d)
 	if (d->hwirq == GPIO_NO_WAKE_IRQ)
 		return;
 
+	if (!test_bit(d->hwirq, pdc_wake_irqs))
+		pdc_enable_intr(d, false);
+
 	irq_chip_mask_parent(d);
 }
 
@@ -118,6 +120,7 @@ static void qcom_pdc_gic_unmask(struct irq_data *d)
 	if (d->hwirq == GPIO_NO_WAKE_IRQ)
 		return;
 
+	pdc_enable_intr(d, true);
 	irq_chip_unmask_parent(d);
 }
 
@@ -197,15 +200,13 @@ static struct irq_chip qcom_pdc_gic_chip = {
 	.irq_eoi		= irq_chip_eoi_parent,
 	.irq_mask		= qcom_pdc_gic_mask,
 	.irq_unmask		= qcom_pdc_gic_unmask,
-	.irq_disable		= qcom_pdc_gic_disable,
-	.irq_enable		= qcom_pdc_gic_enable,
 	.irq_get_irqchip_state	= qcom_pdc_gic_get_irqchip_state,
 	.irq_set_irqchip_state	= qcom_pdc_gic_set_irqchip_state,
 	.irq_retrigger		= irq_chip_retrigger_hierarchy,
 	.irq_set_type		= qcom_pdc_gic_set_type,
+	.irq_set_wake		= qcom_pdc_gic_set_wake,
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

