Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 565C724E8A6
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Aug 2020 18:18:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728409AbgHVQSZ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 22 Aug 2020 12:18:25 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:54795 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728440AbgHVQRp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 22 Aug 2020 12:17:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598113064; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=MUq3BG5FnyYbGkwQnnveP8oZCDd//ZTVeH0v1GFdYps=; b=MrXlcl0E+w4V9pd6M4qXgJwgF+OmLozSrR6xyYXf/oYbGP9nR2R07sR0Tu8QBvJyL3VHH3sT
 w780FfDl/Iw7aPBr+hstvwsZkjRsUTtemIONJQ4OuCUWI40FL7Sq81QlVFbbhzMa1dT4oFPH
 nQv6M8uy3xp5gHfkO2x1h8Dd6dM=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f41451e28b64cff02bb5932 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 22 Aug 2020 16:17:34
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 91CCCC433CB; Sat, 22 Aug 2020 16:17:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8192BC433C6;
        Sat, 22 Aug 2020 16:17:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8192BC433C6
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
Subject: [PATCH v5 3/6] genirq/PM: Introduce IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND flag
Date:   Sat, 22 Aug 2020 21:46:58 +0530
Message-Id: <1598113021-4149-4-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598113021-4149-1-git-send-email-mkshah@codeaurora.org>
References: <1598113021-4149-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

An interrupt that is disabled/masked but set for wakeup still
needs to be able to wake up the system from sleep states like
"suspend to RAM".

Introduce IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND flag. If this flag
is set wake irqs will get enabled/unmasked on suspend entry by
invoking .irq_enable/.irq_unmask callback of irqchip.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 include/linux/irq.h  | 41 ++++++++++++++++++++++-------------------
 kernel/irq/debugfs.c |  1 +
 kernel/irq/pm.c      |  7 ++++++-
 3 files changed, 29 insertions(+), 20 deletions(-)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 1b7f4df..752eb9a 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -545,27 +545,30 @@ struct irq_chip {
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
+ * IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND:  Invoke .irq_enable/.irq_unmask for wake irqs
+ *                                    in the suspend path
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
index b95ff5d..ab4f637 100644
--- a/kernel/irq/debugfs.c
+++ b/kernel/irq/debugfs.c
@@ -57,6 +57,7 @@ static const struct irq_bit_descr irqchip_flags[] = {
 	BIT_MASK_DESCR(IRQCHIP_EOI_THREADED),
 	BIT_MASK_DESCR(IRQCHIP_SUPPORTS_LEVEL_MSI),
 	BIT_MASK_DESCR(IRQCHIP_SUPPORTS_NMI),
+	BIT_MASK_DESCR(IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND),
 };
 
 static void
diff --git a/kernel/irq/pm.c b/kernel/irq/pm.c
index c6c7e18..2cc800b 100644
--- a/kernel/irq/pm.c
+++ b/kernel/irq/pm.c
@@ -69,12 +69,17 @@ void irq_pm_remove_action(struct irq_desc *desc, struct irqaction *action)
 
 static bool suspend_device_irq(struct irq_desc *desc)
 {
+	unsigned long chipflags = irq_desc_get_chip(desc)->flags;
+
 	if (!desc->action || irq_desc_is_chained(desc) ||
 	    desc->no_suspend_depth)
 		return false;
 
 	if (irqd_is_wakeup_set(&desc->irq_data)) {
 		irqd_set(&desc->irq_data, IRQD_WAKEUP_ARMED);
+
+		if (chipflags & IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND)
+			irq_enable(desc);
 		/*
 		 * We return true here to force the caller to issue
 		 * synchronize_irq(). We need to make sure that the
@@ -93,7 +98,7 @@ static bool suspend_device_irq(struct irq_desc *desc)
 	 * chip level. The chip implementation indicates that with
 	 * IRQCHIP_MASK_ON_SUSPEND.
 	 */
-	if (irq_desc_get_chip(desc)->flags & IRQCHIP_MASK_ON_SUSPEND)
+	if (chipflags & IRQCHIP_MASK_ON_SUSPEND)
 		mask_irq(desc);
 	return true;
 }
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

