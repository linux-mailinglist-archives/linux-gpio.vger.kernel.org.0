Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F25E27A685
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 06:32:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726590AbgI1Eck (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Sep 2020 00:32:40 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:42529 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726547AbgI1Ecj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 28 Sep 2020 00:32:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601267559; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=KOJOv2wC6wgrBEGh23ZKVp4QHbaD1LwdsyUY4qRvyls=; b=qmwaIsmf2G2TGrDQKaIfxwlMVOOv3HzU0dGXsIDksw28nf9i0a6RPhz79Qleat0l/mweP5Uf
 uIVI8C3aldFSMh2qBS25biz4mIjGGtCDbdCcRc5QyY9LG0WJdFK4PPduEaf4WFiUOeCksbDj
 5Lk/OIC8iOQ4NSMjC+Da1EFHc8c=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f716767a965393f185a2b62 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Sep 2020 04:32:38
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4338FC4339C; Mon, 28 Sep 2020 04:32:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 10111C43385;
        Mon, 28 Sep 2020 04:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 10111C43385
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     bjorn.andersson@linaro.org, maz@kernel.org,
        linus.walleij@linaro.org, swboyd@chromium.org,
        evgreen@chromium.org, mka@chromium.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v6 3/6] genirq/PM: Introduce IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND flag
Date:   Mon, 28 Sep 2020 10:02:01 +0530
Message-Id: <1601267524-20199-4-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601267524-20199-1-git-send-email-mkshah@codeaurora.org>
References: <1601267524-20199-1-git-send-email-mkshah@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

An interrupt that is disabled/masked but set for wakeup still needs to
be able to wake up the system from sleep states like "suspend to RAM".

This change introduces IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND flag. If irqchip
have this flag set then irq PM will enable/unmask irqs that are marked
for wakeup but are in disabled state.

On resume such irqs will be restored back to disabled state.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 include/linux/irq.h  | 49 ++++++++++++++++++++++++++++++-------------------
 kernel/irq/debugfs.c |  3 +++
 kernel/irq/pm.c      | 34 ++++++++++++++++++++++++++++++----
 3 files changed, 63 insertions(+), 23 deletions(-)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 63b9d96..ccd39e2 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -217,6 +217,8 @@ struct irq_data {
  *				  from actual interrupt context.
  * IRQD_AFFINITY_ON_ACTIVATE	- Affinity is set on activation. Don't call
  *				  irq_chip::irq_set_affinity() when deactivated.
+ * IRQD_IRQ_ENABLED_ON_SUSPEND	- Interrupt is enabled on suspend by irq pm if
+ *				  irqchip have flag IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND set.
  */
 enum {
 	IRQD_TRIGGER_MASK		= 0xf,
@@ -242,6 +244,7 @@ enum {
 	IRQD_MSI_NOMASK_QUIRK		= (1 << 27),
 	IRQD_HANDLE_ENFORCE_IRQCTX	= (1 << 28),
 	IRQD_AFFINITY_ON_ACTIVATE	= (1 << 29),
+	IRQD_IRQ_ENABLED_ON_SUSPEND	= (1 << 30),
 };
 
 #define __irqd_to_state(d) ACCESS_PRIVATE((d)->common, state_use_accessors)
@@ -321,6 +324,11 @@ static inline bool irqd_is_handle_enforce_irqctx(struct irq_data *d)
 	return __irqd_to_state(d) & IRQD_HANDLE_ENFORCE_IRQCTX;
 }
 
+static inline bool irqd_is_enabled_on_suspend(struct irq_data *d)
+{
+	return __irqd_to_state(d) & IRQD_IRQ_ENABLED_ON_SUSPEND;
+}
+
 static inline bool irqd_is_wakeup_set(struct irq_data *d)
 {
 	return __irqd_to_state(d) & IRQD_WAKEUP_STATE;
@@ -547,27 +555,30 @@ struct irq_chip {
 /*
  * irq_chip specific flags
  *
- * IRQCHIP_SET_TYPE_MASKED:	Mask before calling chip.irq_set_type()
- * IRQCHIP_EOI_IF_HANDLED:	Only issue irq_eoi() when irq was handled
- * IRQCHIP_MASK_ON_SUSPEND:	Mask non wake irqs in the suspend path
- * IRQCHIP_ONOFFLINE_ENABLED:	Only call irq_on/off_line callbacks
- *				when irq enabled
- * IRQCHIP_SKIP_SET_WAKE:	Skip chip.irq_set_wake(), for this irq chip
- * IRQCHIP_ONESHOT_SAFE:	One shot does not require mask/unmask
- * IRQCHIP_EOI_THREADED:	Chip requires eoi() on unmask in threaded mode
- * IRQCHIP_SUPPORTS_LEVEL_MSI	Chip can provide two doorbells for Level MSIs
- * IRQCHIP_SUPPORTS_NMI:	Chip can deliver NMIs, only for root irqchips
+ * IRQCHIP_SET_TYPE_MASKED:           Mask before calling chip.irq_set_type()
+ * IRQCHIP_EOI_IF_HANDLED:            Only issue irq_eoi() when irq was handled
+ * IRQCHIP_MASK_ON_SUSPEND:           Mask non wake irqs in the suspend path
+ * IRQCHIP_ONOFFLINE_ENABLED:         Only call irq_on/off_line callbacks
+ *                                    when irq enabled
+ * IRQCHIP_SKIP_SET_WAKE:             Skip chip.irq_set_wake(), for this irq chip
+ * IRQCHIP_ONESHOT_SAFE:              One shot does not require mask/unmask
+ * IRQCHIP_EOI_THREADED:              Chip requires eoi() on unmask in threaded mode
+ * IRQCHIP_SUPPORTS_LEVEL_MSI:        Chip can provide two doorbells for Level MSIs
+ * IRQCHIP_SUPPORTS_NMI:              Chip can deliver NMIs, only for root irqchips
+ * IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND:  Invokes __enable_irq()/__disable_irq() for wake irqs
+ *                                    in the suspend path if they are in disabled state
  */
 enum {
-	IRQCHIP_SET_TYPE_MASKED		= (1 <<  0),
-	IRQCHIP_EOI_IF_HANDLED		= (1 <<  1),
-	IRQCHIP_MASK_ON_SUSPEND		= (1 <<  2),
-	IRQCHIP_ONOFFLINE_ENABLED	= (1 <<  3),
-	IRQCHIP_SKIP_SET_WAKE		= (1 <<  4),
-	IRQCHIP_ONESHOT_SAFE		= (1 <<  5),
-	IRQCHIP_EOI_THREADED		= (1 <<  6),
-	IRQCHIP_SUPPORTS_LEVEL_MSI	= (1 <<  7),
-	IRQCHIP_SUPPORTS_NMI		= (1 <<  8),
+	IRQCHIP_SET_TYPE_MASKED			= (1 <<  0),
+	IRQCHIP_EOI_IF_HANDLED			= (1 <<  1),
+	IRQCHIP_MASK_ON_SUSPEND			= (1 <<  2),
+	IRQCHIP_ONOFFLINE_ENABLED		= (1 <<  3),
+	IRQCHIP_SKIP_SET_WAKE			= (1 <<  4),
+	IRQCHIP_ONESHOT_SAFE			= (1 <<  5),
+	IRQCHIP_EOI_THREADED			= (1 <<  6),
+	IRQCHIP_SUPPORTS_LEVEL_MSI		= (1 <<  7),
+	IRQCHIP_SUPPORTS_NMI			= (1 <<  8),
+	IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND	= (1 <<  9),
 };
 
 #include <linux/irqdesc.h>
diff --git a/kernel/irq/debugfs.c b/kernel/irq/debugfs.c
index acabc0c..e4cff35 100644
--- a/kernel/irq/debugfs.c
+++ b/kernel/irq/debugfs.c
@@ -57,6 +57,7 @@ static const struct irq_bit_descr irqchip_flags[] = {
 	BIT_MASK_DESCR(IRQCHIP_EOI_THREADED),
 	BIT_MASK_DESCR(IRQCHIP_SUPPORTS_LEVEL_MSI),
 	BIT_MASK_DESCR(IRQCHIP_SUPPORTS_NMI),
+	BIT_MASK_DESCR(IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND),
 };
 
 static void
@@ -125,6 +126,8 @@ static const struct irq_bit_descr irqdata_states[] = {
 	BIT_MASK_DESCR(IRQD_DEFAULT_TRIGGER_SET),
 
 	BIT_MASK_DESCR(IRQD_HANDLE_ENFORCE_IRQCTX),
+
+	BIT_MASK_DESCR(IRQD_IRQ_ENABLED_ON_SUSPEND),
 };
 
 static const struct irq_bit_descr irqdesc_states[] = {
diff --git a/kernel/irq/pm.c b/kernel/irq/pm.c
index c6c7e18..ce0adb2 100644
--- a/kernel/irq/pm.c
+++ b/kernel/irq/pm.c
@@ -69,12 +69,26 @@ void irq_pm_remove_action(struct irq_desc *desc, struct irqaction *action)
 
 static bool suspend_device_irq(struct irq_desc *desc)
 {
+	unsigned long chipflags = irq_desc_get_chip(desc)->flags;
+	struct irq_data *irqd = &desc->irq_data;
+
 	if (!desc->action || irq_desc_is_chained(desc) ||
 	    desc->no_suspend_depth)
 		return false;
 
-	if (irqd_is_wakeup_set(&desc->irq_data)) {
-		irqd_set(&desc->irq_data, IRQD_WAKEUP_ARMED);
+	if (irqd_is_wakeup_set(irqd)) {
+		irqd_set(irqd, IRQD_WAKEUP_ARMED);
+
+		if ((chipflags & IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND) &&
+		     irqd_irq_disabled(irqd)) {
+			/*
+			 * Interrupt marked for wakeup is in disabled state.
+			 * Enable interrupt here to unmask/enable in irqchip
+			 * to be able to resume with such interrupts.
+			 */
+			__enable_irq(desc);
+			irqd_set(irqd, IRQD_IRQ_ENABLED_ON_SUSPEND);
+		}
 		/*
 		 * We return true here to force the caller to issue
 		 * synchronize_irq(). We need to make sure that the
@@ -93,7 +107,7 @@ static bool suspend_device_irq(struct irq_desc *desc)
 	 * chip level. The chip implementation indicates that with
 	 * IRQCHIP_MASK_ON_SUSPEND.
 	 */
-	if (irq_desc_get_chip(desc)->flags & IRQCHIP_MASK_ON_SUSPEND)
+	if (chipflags & IRQCHIP_MASK_ON_SUSPEND)
 		mask_irq(desc);
 	return true;
 }
@@ -137,7 +151,19 @@ EXPORT_SYMBOL_GPL(suspend_device_irqs);
 
 static void resume_irq(struct irq_desc *desc)
 {
-	irqd_clear(&desc->irq_data, IRQD_WAKEUP_ARMED);
+	struct irq_data *irqd = &desc->irq_data;
+
+	irqd_clear(irqd, IRQD_WAKEUP_ARMED);
+
+	if (irqd_is_enabled_on_suspend(irqd)) {
+		/*
+		 * Interrupt marked for wakeup was enabled during suspend
+		 * entry. Disable such interrupts to restore them back to
+		 * original state.
+		 */
+		__disable_irq(desc);
+		irqd_clear(irqd, IRQD_IRQ_ENABLED_ON_SUSPEND);
+	}
 
 	if (desc->istate & IRQS_SUSPENDED)
 		goto resume;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

