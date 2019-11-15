Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EEB1EFE795
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 23:18:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727170AbfKOWRx (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 17:17:53 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:47448 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727075AbfKOWRv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 17:17:51 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 9E576611A6; Fri, 15 Nov 2019 22:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573856269;
        bh=kvfbMSlyjRr428zvEa7lwNZjaJQ2PcG+aqcLq/uH3ms=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=S59ij60HnxwJWXy/k5H6eJ2lQpOtK764LwQq25NdTCBf4Ec9zGZ4SPRQ9CSJn9YOk
         MsQ/8In5ctmIWuC3FXe1qRG5gjJJljVDCCb35bkeeET5ieTS0XQALQu8VUTOFBpJaf
         BwtRC+B6Slz0gkOWsEhG7cOOonJC4hos0/E+PpJY=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D7BA36118E;
        Fri, 15 Nov 2019 22:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573856268;
        bh=kvfbMSlyjRr428zvEa7lwNZjaJQ2PcG+aqcLq/uH3ms=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZIQe7049s/2ZY6AkDiIvDCRleiWKd5bpPfmJmsPgilJxEJvN4zgIbLV7x0gQjypWY
         JZld9HJtOfcnm07jwIcBsD/WkifQL5M8SbZoQHLqyyYzsFybCIoLUX42fjMasMg3E8
         JsCQGyr4WwNr7kvlgZnOYenSdxcwgaKtMYYIww3M=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D7BA36118E
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, maz@kernel.org, linus.walleij@linaro.org,
        bjorn.andersson@linaro.org
Cc:     evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH v2 06/12] genirq: Introduce irq_chip_get/set_parent_state calls
Date:   Fri, 15 Nov 2019 15:11:49 -0700
Message-Id: <1573855915-9841-7-git-send-email-ilina@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573855915-9841-1-git-send-email-ilina@codeaurora.org>
References: <1573855915-9841-1-git-send-email-ilina@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Maulik Shah <mkshah@codeaurora.org>

On certain QTI chipsets some GPIOs are direct-connect interrupts to the
GIC to be used as regular interrupt lines. When the GPIOs are not used
for interrupt generation the interrupt line is disabled. But disabling
the interrupt at GIC does not prevent the interrupt to be reported as
pending at GIC_ISPEND. Later, when drivers call enable_irq() on the
interrupt, an unwanted interrupt occurs.

Introduce get and set methods for irqchip's parent to clear it's pending
irq state. This then can be invoked by the GPIO interrupt controller on
the parents in it hierarchy to clear the interrupt before enabling the
interrupt.

Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
[updated commit text and minor code fixes]
Signed-off-by: Lina Iyer <ilina@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
Changes in RFC v2 -
	- Rephrase commit text
	- Address code review comments
---
 include/linux/irq.h |  6 ++++++
 kernel/irq/chip.c   | 44 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index fb301cf..7853eb9 100644
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
index b76703b..b3fa2d8 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -1298,6 +1298,50 @@ EXPORT_SYMBOL_GPL(handle_fasteoi_mask_irq);
 #endif /* CONFIG_IRQ_FASTEOI_HIERARCHY_HANDLERS */
 
 /**
+ * irq_chip_set_parent_state - set the state of a parent interrupt.
+ *
+ * @data: Pointer to interrupt specific data
+ * @which: State to be restored (one of IRQCHIP_STATE_*)
+ * @val: Value corresponding to @which
+ *
+ * Conditional success, if the underlying irqchip does not implement it.
+ */
+int irq_chip_set_parent_state(struct irq_data *data,
+			      enum irqchip_irq_state which,
+			      bool val)
+{
+	data = data->parent_data;
+
+	if (!data || !data->chip->irq_set_irqchip_state)
+		return 0;
+
+	return data->chip->irq_set_irqchip_state(data, which, val);
+}
+EXPORT_SYMBOL_GPL(irq_chip_set_parent_state);
+
+/**
+ * irq_chip_get_parent_state - get the state of a parent interrupt.
+ *
+ * @data: Pointer to interrupt specific data
+ * @which: one of IRQCHIP_STATE_* the caller wants to know
+ * @state: a pointer to a boolean where the state is to be stored
+ *
+ * Conditional success, if the underlying irqchip does not implement it.
+ */
+int irq_chip_get_parent_state(struct irq_data *data,
+			      enum irqchip_irq_state which,
+			      bool *state)
+{
+	data = data->parent_data;
+
+	if (!data || !data->chip->irq_get_irqchip_state)
+		return 0;
+
+	return data->chip->irq_get_irqchip_state(data, which, state);
+}
+EXPORT_SYMBOL_GPL(irq_chip_get_parent_state);
+
+/**
  * irq_chip_enable_parent - Enable the parent interrupt (defaults to unmask if
  * NULL)
  * @data:	Pointer to interrupt specific data
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

