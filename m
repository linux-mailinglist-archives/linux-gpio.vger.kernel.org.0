Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 513E5240549
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Aug 2020 13:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbgHJLXs (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Aug 2020 07:23:48 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:40431 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726524AbgHJLVp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 Aug 2020 07:21:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597058501; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=N7UD2Mvt7iBQIpHCuSnZLXwyg7B5AmY3wCQNnHXQzbs=; b=v0+sNGfvgxgWYfKRJlgJkZuY+vzWKDf3vE4K2UFxplPAh6opD4qBxM5PfKxOx+r2GmtsPWMp
 LKRwLWxuTjN8CgQczqcpmOpxZi3UII2k7dV8Fpyau5zTmKsHZ0xyXjBysy+xJYx9/4PxDLkJ
 kRrVrCQp9eg+5+fjWX7jF33SnE4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n18.prod.us-west-2.postgun.com with SMTP id
 5f312dbd2f4952907d7e21b6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 10 Aug 2020 11:21:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2378CC433C9; Mon, 10 Aug 2020 11:21:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 00C52C4339C;
        Mon, 10 Aug 2020 11:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 00C52C4339C
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
Subject: [PATCH v4 3/7] genirq: Introduce irq_suspend_one() and irq_resume_one() callbacks
Date:   Mon, 10 Aug 2020 16:50:56 +0530
Message-Id: <1597058460-16211-4-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597058460-16211-1-git-send-email-mkshah@codeaurora.org>
References: <1597058460-16211-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Douglas Anderson <dianders@chromium.org>

The "struct irq_chip" has two callbacks in it: irq_suspend() and
irq_resume().  These two callbacks are interesting because sometimes
an irq chip needs to know about suspend/resume, but they are a bit
awkward because:
1. They are called once for the whole irq_chip, not once per IRQ.
   It's passed data for one of the IRQs enabled on that chip.  That
   means it's up to the irq_chip driver to aggregate.
2. They are only called if you're using "generic-chip", which not
   everyone is.
3. The implementation uses syscore ops, which apparently have problems
   with s2idle.

Probably the old irq_suspend() and irq_resume() callbacks should be
deprecated.

Let's introcuce a nicer API that works for all irq_chip devices.  This
will be called by the core and is called once per IRQ.  The core will
call the suspend callback after doing its normal suspend operations
and the resume before its normal resume operations.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 include/linux/irq.h    | 13 +++++++++++--
 kernel/irq/chip.c      | 16 ++++++++++++++++
 kernel/irq/internals.h |  2 ++
 kernel/irq/pm.c        | 15 ++++++++++++---
 4 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 1b7f4df..8d37b32 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -468,10 +468,16 @@ static inline irq_hw_number_t irqd_to_hwirq(struct irq_data *d)
  * @irq_bus_sync_unlock:function to sync and unlock slow bus (i2c) chips
  * @irq_cpu_online:	configure an interrupt source for a secondary CPU
  * @irq_cpu_offline:	un-configure an interrupt source for a secondary CPU
+ * @irq_suspend_one:	called on an every irq to suspend it; called even if
+ *			this IRQ is configured for wakeup
+ * @irq_resume_one:	called on an every irq to resume it; called even if
+ *			this IRQ is configured for wakeup
  * @irq_suspend:	function called from core code on suspend once per
- *			chip, when one or more interrupts are installed
+ *			chip, when one or more interrupts are installed;
+ *			only works if using irq/generic-chip
  * @irq_resume:		function called from core code on resume once per chip,
- *			when one ore more interrupts are installed
+ *			when one ore more interrupts are installed;
+ *			only works if using irq/generic-chip
  * @irq_pm_shutdown:	function called from core code on shutdown once per chip
  * @irq_calc_mask:	Optional function to set irq_data.mask for special cases
  * @irq_print_chip:	optional to print special chip info in show_interrupts
@@ -515,6 +521,9 @@ struct irq_chip {
 	void		(*irq_cpu_online)(struct irq_data *data);
 	void		(*irq_cpu_offline)(struct irq_data *data);
 
+	void		(*irq_suspend_one)(struct irq_data *data);
+	void		(*irq_resume_one)(struct irq_data *data);
+
 	void		(*irq_suspend)(struct irq_data *data);
 	void		(*irq_resume)(struct irq_data *data);
 	void		(*irq_pm_shutdown)(struct irq_data *data);
diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 857f5f4..caf80c1 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -447,6 +447,22 @@ void unmask_threaded_irq(struct irq_desc *desc)
 	unmask_irq(desc);
 }
 
+void suspend_one_irq(struct irq_desc *desc)
+{
+	struct irq_chip *chip = desc->irq_data.chip;
+
+	if (chip->irq_suspend_one)
+		chip->irq_suspend_one(&desc->irq_data);
+}
+
+void resume_one_irq(struct irq_desc *desc)
+{
+	struct irq_chip *chip = desc->irq_data.chip;
+
+	if (chip->irq_resume_one)
+		chip->irq_resume_one(&desc->irq_data);
+}
+
 /*
  *	handle_nested_irq - Handle a nested irq from a irq thread
  *	@irq:	the interrupt number
diff --git a/kernel/irq/internals.h b/kernel/irq/internals.h
index 7db284b..11c2dac 100644
--- a/kernel/irq/internals.h
+++ b/kernel/irq/internals.h
@@ -90,6 +90,8 @@ extern void irq_percpu_disable(struct irq_desc *desc, unsigned int cpu);
 extern void mask_irq(struct irq_desc *desc);
 extern void unmask_irq(struct irq_desc *desc);
 extern void unmask_threaded_irq(struct irq_desc *desc);
+extern void suspend_one_irq(struct irq_desc *desc);
+extern void resume_one_irq(struct irq_desc *desc);
 
 #ifdef CONFIG_SPARSE_IRQ
 static inline void irq_mark_irq(unsigned int irq) { }
diff --git a/kernel/irq/pm.c b/kernel/irq/pm.c
index 8f557fa..b9e5338 100644
--- a/kernel/irq/pm.c
+++ b/kernel/irq/pm.c
@@ -69,19 +69,23 @@ void irq_pm_remove_action(struct irq_desc *desc, struct irqaction *action)
 
 static bool suspend_device_irq(struct irq_desc *desc)
 {
+	bool sync = false;
+
 	if (!desc->action || irq_desc_is_chained(desc) ||
 	    desc->no_suspend_depth)
-		return false;
+		goto exit;
 
 	if (irqd_is_wakeup_set(&desc->irq_data)) {
 		irqd_set(&desc->irq_data, IRQD_WAKEUP_ARMED);
+
 		/*
 		 * We return true here to force the caller to issue
 		 * synchronize_irq(). We need to make sure that the
 		 * IRQD_WAKEUP_ARMED is visible before we return from
 		 * suspend_device_irqs().
 		 */
-		return true;
+		sync = true;
+		goto exit;
 	}
 
 	desc->istate |= IRQS_SUSPENDED;
@@ -95,7 +99,10 @@ static bool suspend_device_irq(struct irq_desc *desc)
 	 */
 	if (irq_desc_get_chip(desc)->flags & IRQCHIP_MASK_ON_SUSPEND)
 		mask_irq(desc);
-	return true;
+
+exit:
+	suspend_one_irq(desc);
+	return sync;
 }
 
 /**
@@ -137,6 +144,8 @@ EXPORT_SYMBOL_GPL(suspend_device_irqs);
 
 static void resume_irq(struct irq_desc *desc)
 {
+	resume_one_irq(desc);
+
 	irqd_clear(&desc->irq_data, IRQD_WAKEUP_ARMED);
 
 	if (desc->istate & IRQS_SUSPENDED)
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

