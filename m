Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C33C0B27CC
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2019 00:03:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403905AbfIMWAN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Sep 2019 18:00:13 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:59988 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390350AbfIMV7w (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Sep 2019 17:59:52 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id EC264613A6; Fri, 13 Sep 2019 21:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568411990;
        bh=PdwMJsA9h89YRbDUO1YMlOlH2+m9AQqQkm7xDJFf0jQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KsllB6EmSPRPeZKRIyykgAO0eUava43hncoPY7JCxMPWRh1fGinfiQc28YDpQmCGl
         IQv1/oEZHRK2dJK2XpsZLsQkJtIQnuYwD55zFjH+oq9UF9DIM2yxOCw4z+FMBqMm1N
         8NG+2/UZhCkOmXubu5dicruAO8gOwSKDJXxL45Ag=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9132A611CE;
        Fri, 13 Sep 2019 21:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568411990;
        bh=PdwMJsA9h89YRbDUO1YMlOlH2+m9AQqQkm7xDJFf0jQ=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KsllB6EmSPRPeZKRIyykgAO0eUava43hncoPY7JCxMPWRh1fGinfiQc28YDpQmCGl
         IQv1/oEZHRK2dJK2XpsZLsQkJtIQnuYwD55zFjH+oq9UF9DIM2yxOCw4z+FMBqMm1N
         8NG+2/UZhCkOmXubu5dicruAO8gOwSKDJXxL45Ag=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9132A611CE
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, maz@kernel.org,
        linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH RFC v2 09/14] drivers: irqchip: pdc: Add irqchip set/get state calls
Date:   Fri, 13 Sep 2019 15:59:17 -0600
Message-Id: <1568411962-1022-10-git-send-email-ilina@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568411962-1022-1-git-send-email-ilina@codeaurora.org>
References: <1568411962-1022-1-git-send-email-ilina@codeaurora.org>
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
[updated commit text]
Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
 drivers/irqchip/qcom-pdc.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index affb0bfa..2b49e70 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -5,6 +5,7 @@
 
 #include <linux/err.h>
 #include <linux/init.h>
+#include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/irqchip.h>
 #include <linux/irqdomain.h>
@@ -87,6 +88,24 @@ static void qcom_pdc_gic_disable(struct irq_data *d)
 	irq_chip_disable_parent(d);
 }
 
+static int qcom_pdc_gic_get_irqchip_state(struct irq_data *d,
+		enum irqchip_irq_state which, bool *state)
+{
+	if (d->hwirq == GPIO_NO_WAKE_IRQ)
+		return 0;
+
+	return irq_chip_get_parent_state(d, which, state);
+}
+
+static int qcom_pdc_gic_set_irqchip_state(struct irq_data *d,
+		enum irqchip_irq_state which, bool value)
+{
+	if (d->hwirq == GPIO_NO_WAKE_IRQ)
+		return 0;
+
+	return irq_chip_set_parent_state(d, which, value);
+}
+
 static void qcom_pdc_gic_enable(struct irq_data *d)
 {
 	if (d->hwirq == GPIO_NO_WAKE_IRQ)
@@ -248,6 +267,8 @@ static struct irq_chip qcom_pdc_gic_chip = {
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

