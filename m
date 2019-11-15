Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7751CFE794
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Nov 2019 23:18:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727121AbfKOWRw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Nov 2019 17:17:52 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:47528 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727146AbfKOWRw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 17:17:52 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id BF4D4611B4; Fri, 15 Nov 2019 22:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573856270;
        bh=nbNFiDBcfX6ZqXmll/SdzG8LzXJgn1NrzNnskwwtMM8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=guIrLa2aw9nOjgQFn/7iHXkgq3v4DnmSuPvw5yiZ3I9yd4UJ880IAXoDXJKYk1TUs
         RR1et2bnOCSmHMZ/ct2DTaMHsPfOUx/9fjGAA4l57MWTmWTK6NbQ6G6zHQQWW9E0gz
         g9k7ZpK9dzIJT434yFxqmI5WLOBSIP0lytDMXCyQ=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 084B3611A2;
        Fri, 15 Nov 2019 22:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573856269;
        bh=nbNFiDBcfX6ZqXmll/SdzG8LzXJgn1NrzNnskwwtMM8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YtnHxcy5zzQoO3xXZn/xJPc6HNXGTXMBnGTkR4unbF6m2kOQvuNqxtaI/S/zoI6no
         rBND7xP/m/F8W2L4fTlpLwrPl8HCamrRXKDxqyfvhbC06E+T91uKGj9W7j8mHD2DrU
         2KhUdMO8XpdXISEREEn/A65PWbvJLFWprS6XKycg=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 084B3611A2
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, maz@kernel.org, linus.walleij@linaro.org,
        bjorn.andersson@linaro.org
Cc:     evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH v2 07/12] drivers: irqchip: pdc: Add irqchip set/get state calls
Date:   Fri, 15 Nov 2019 15:11:50 -0700
Message-Id: <1573855915-9841-8-git-send-email-ilina@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573855915-9841-1-git-send-email-ilina@codeaurora.org>
References: <1573855915-9841-1-git-send-email-ilina@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Maulik Shah <mkshah@codeaurora.org>

Add irqchip calls to set/get interrupt state from the parent interrupt
controller. When GPIOs are renabled as interrupt lines, it is desirable
to clear the interrupt state at the GIC. This avoids any unwanted
interrupt as a result of stale pending state recorded when the line was
used as a GPIO.

Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
[updated commit text, rearranged code]
Signed-off-by: Lina Iyer <ilina@codeaurora.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/irqchip/qcom-pdc.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 4f2c762..6ae9e1f 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -5,6 +5,7 @@
 
 #include <linux/err.h>
 #include <linux/init.h>
+#include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
 #include <linux/irqdomain.h>
@@ -50,6 +51,26 @@ static u32 pdc_reg_read(int reg, u32 i)
 	return readl_relaxed(pdc_base + reg + i * sizeof(u32));
 }
 
+static int qcom_pdc_gic_get_irqchip_state(struct irq_data *d,
+					  enum irqchip_irq_state which,
+					  bool *state)
+{
+	if (d->hwirq == GPIO_NO_WAKE_IRQ)
+		return 0;
+
+	return irq_chip_get_parent_state(d, which, state);
+}
+
+static int qcom_pdc_gic_set_irqchip_state(struct irq_data *d,
+					  enum irqchip_irq_state which,
+					  bool value)
+{
+	if (d->hwirq == GPIO_NO_WAKE_IRQ)
+		return 0;
+
+	return irq_chip_set_parent_state(d, which, value);
+}
+
 static void pdc_enable_intr(struct irq_data *d, bool on)
 {
 	int pin_out = d->hwirq;
@@ -178,6 +199,8 @@ static struct irq_chip qcom_pdc_gic_chip = {
 	.irq_unmask		= qcom_pdc_gic_unmask,
 	.irq_disable		= qcom_pdc_gic_disable,
 	.irq_enable		= qcom_pdc_gic_enable,
+	.irq_get_irqchip_state	= qcom_pdc_gic_get_irqchip_state,
+	.irq_set_irqchip_state	= qcom_pdc_gic_set_irqchip_state,
 	.irq_retrigger		= irq_chip_retrigger_hierarchy,
 	.irq_set_type		= qcom_pdc_gic_set_type,
 	.flags			= IRQCHIP_MASK_ON_SUSPEND |
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

