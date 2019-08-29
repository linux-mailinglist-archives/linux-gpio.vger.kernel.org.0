Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1ACA7A262A
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2019 20:37:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727986AbfH2Shn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Aug 2019 14:37:43 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:38144 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727899AbfH2Shn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Aug 2019 14:37:43 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id C49C16919A; Thu, 29 Aug 2019 18:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567103861;
        bh=MUMclASLiTgy4Lbihfd3RsX39V5B/DtoaCtXU9g4+3E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=NuoCifD9h0BRcu25r6h4B4ttH3U/aBPEIGWMmHlBatc/4wwSXCnrlvoMSRt+jkbSd
         cPtucwHlcdz6nR+EoWaHBake5vl9rBx0Ipf8L/HXGGpZRgcPyKw8yT0HMICWpJt0/w
         tGIWZYQ4tnhUswfuBIQHqSdUT7w6GSlx84AtBUGs=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C399D68974;
        Thu, 29 Aug 2019 18:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567102344;
        bh=MUMclASLiTgy4Lbihfd3RsX39V5B/DtoaCtXU9g4+3E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ONmK8JYiPgFpRzLr6v1t48svp5CLbD6iVIJE7nbQEMVc6GsQA0Jn76GnNnP9CX2Fv
         77Tt4a+QS5qKLwGXGRNcv6LKke5h93nBQkvR5XvtygBn+Zl9fOF4v6j6UGlmeJ9LF/
         EKcHw4i1QX5J9ESTQ4NsCq4k/QqhhwwogxeuljEU=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C399D68974
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, marc.zyngier@arm.com,
        linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, rnayak@codeaurora.org
Subject: [PATCH RFC 07/14] genirq: Introduce irq_chip_get/set_parent_state calls
Date:   Thu, 29 Aug 2019 12:11:56 -0600
Message-Id: <20190829181203.2660-8-ilina@codeaurora.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190829181203.2660-1-ilina@codeaurora.org>
References: <20190829181203.2660-1-ilina@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Maulik Shah <mkshah@codeaurora.org>

On certain QTI chipsets some GPIOs are direct-connect interrupts
to the GIC.

Even when GPIOs are not used for interrupt generation and interrupt
line is disabled, it does not prevent interrupt to get pending at
GIC_ISPEND. When drivers call enable_irq unwanted interrupt occures.

Introduce irq_chip_get/set_parent_state calls to clear pending irq
which can get called within irq_enable of child irq chip to clear
any pending irq before enabling.

Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 include/linux/irq.h |  6 ++++++
 kernel/irq/chip.c   | 44 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index fb301cf29148..7853eb9301f2 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -610,6 +610,12 @@ extern int irq_chip_pm_put(struct irq_data *data);
 #ifdef	CONFIG_IRQ_DOMAIN_HIERARCHY
 extern void handle_fasteoi_ack_irq(struct irq_desc *desc);
 extern void handle_fasteoi_mask_irq(struct irq_desc *desc);
+extern int irq_chip_set_parent_state(struct irq_data *data,
+				     enum irqchip_irq_state which,
+				     bool val);
+extern int irq_chip_get_parent_state(struct irq_data *data,
+				     enum irqchip_irq_state which,
+				     bool *state);
 extern void irq_chip_enable_parent(struct irq_data *data);
 extern void irq_chip_disable_parent(struct irq_data *data);
 extern void irq_chip_ack_parent(struct irq_data *data);
diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index b76703b2c0af..6bb5b22bb0a7 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -1297,6 +1297,50 @@ EXPORT_SYMBOL_GPL(handle_fasteoi_mask_irq);
 
 #endif /* CONFIG_IRQ_FASTEOI_HIERARCHY_HANDLERS */
 
+/**
+ *	irq_chip_set_parent_state - set the state of a parent interrupt.
+ *	@data: Pointer to interrupt specific data
+ *	@which: State to be restored (one of IRQCHIP_STATE_*)
+ *	@val: Value corresponding to @which
+ *
+ */
+int irq_chip_set_parent_state(struct irq_data *data,
+			      enum irqchip_irq_state which,
+			      bool val)
+{
+	data = data->parent_data;
+	if (!data)
+		return 0;
+
+	if (data->chip->irq_set_irqchip_state)
+		return data->chip->irq_set_irqchip_state(data, which, val);
+
+	return 0;
+}
+EXPORT_SYMBOL(irq_chip_set_parent_state);
+
+/**
+ *	irq_chip_get_parent_state - get the state of a parent interrupt.
+ *	@data: Pointer to interrupt specific data
+ *	@which: one of IRQCHIP_STATE_* the caller wants to know
+ *	@state: a pointer to a boolean where the state is to be stored
+ *
+ */
+int irq_chip_get_parent_state(struct irq_data *data,
+			      enum irqchip_irq_state which,
+			      bool *state)
+{
+	data = data->parent_data;
+	if (!data)
+		return 0;
+
+	if (data->chip->irq_get_irqchip_state)
+		return data->chip->irq_get_irqchip_state(data, which, state);
+
+	return 0;
+}
+EXPORT_SYMBOL(irq_chip_get_parent_state);
+
 /**
  * irq_chip_enable_parent - Enable the parent interrupt (defaults to unmask if
  * NULL)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

