Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80587B27AB
	for <lists+linux-gpio@lfdr.de>; Sat, 14 Sep 2019 00:03:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390259AbfIMV7q (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 13 Sep 2019 17:59:46 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:59584 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390018AbfIMV7q (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 13 Sep 2019 17:59:46 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 01543607C6; Fri, 13 Sep 2019 21:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568411985;
        bh=mJ6ERleIUVuaUxsJYCNgiuvwDk4I+BHBd01lZAWccGo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=d6lpwxSYc+zd5X0IcJDdYCozHY4WhBW/Tx/zkIZz/rddzXOY0Xqhy4tR88hnN3T42
         utY4T9CXiXBVsh9v6ZjKUH6skna3erY1mbtOGTrGRMbXPnv358SsWM3QuIiky8KBdU
         dk4SCxceuz+aol45an39SMkUzdG5MtmOzjOERe+c=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 66F3E607C6;
        Fri, 13 Sep 2019 21:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1568411984;
        bh=mJ6ERleIUVuaUxsJYCNgiuvwDk4I+BHBd01lZAWccGo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=II/NOksbYtlYfHVAXo4v22YeoSLlO1vjfyL5pBMTAH2FFZ4O1nI8UHl6Yl6vtIa/1
         O1FmWfkjsrGVldlxZ5aKi0pBUcdkbOzHZdnBMYdPc0pLp00i48bkgn6zB/Ziha8QfV
         o0O0qG10yoU8DwtuL+VFVBawXwo99vbs9rBxTC08=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 66F3E607C6
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, maz@kernel.org,
        linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH RFC v2 03/14] drivers: irqchip: pdc: Do not toggle IRQ_ENABLE during mask/unmask
Date:   Fri, 13 Sep 2019 15:59:11 -0600
Message-Id: <1568411962-1022-4-git-send-email-ilina@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568411962-1022-1-git-send-email-ilina@codeaurora.org>
References: <1568411962-1022-1-git-send-email-ilina@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When an interrupt is to be serviced, the convention is to mask the
interrupt at the chip and unmask after servicing the interrupt. Enabling
and disabling the interrupt at the PDC irqchip causes an interrupt storm
due to the way dual edge interrupts are handled in hardware.

Skip configuring the PDC when the IRQ is masked and unmasked, instead
use the irq_enable/irq_disable callbacks to toggle the IRQ_ENABLE
register at the PDC. The PDC's IRQ_ENABLE register is only used during
the monitoring mode when the system is asleep and is not needed for
active mode detection.

Signed-off-by: Lina Iyer <ilina@codeaurora.org>
---
 drivers/irqchip/qcom-pdc.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index b230794..5eef5ea 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -63,15 +63,25 @@ static void pdc_enable_intr(struct irq_data *d, bool on)
 	raw_spin_unlock(&pdc_lock);
 }
 
-static void qcom_pdc_gic_mask(struct irq_data *d)
+static void qcom_pdc_gic_disable(struct irq_data *d)
 {
 	pdc_enable_intr(d, false);
+	irq_chip_disable_parent(d);
+}
+
+static void qcom_pdc_gic_enable(struct irq_data *d)
+{
+	pdc_enable_intr(d, true);
+	irq_chip_enable_parent(d);
+}
+
+static void qcom_pdc_gic_mask(struct irq_data *d)
+{
 	irq_chip_mask_parent(d);
 }
 
 static void qcom_pdc_gic_unmask(struct irq_data *d)
 {
-	pdc_enable_intr(d, true);
 	irq_chip_unmask_parent(d);
 }
 
@@ -148,6 +158,8 @@ static struct irq_chip qcom_pdc_gic_chip = {
 	.irq_eoi		= irq_chip_eoi_parent,
 	.irq_mask		= qcom_pdc_gic_mask,
 	.irq_unmask		= qcom_pdc_gic_unmask,
+	.irq_disable		= qcom_pdc_gic_disable,
+	.irq_enable		= qcom_pdc_gic_enable,
 	.irq_retrigger		= irq_chip_retrigger_hierarchy,
 	.irq_set_type		= qcom_pdc_gic_set_type,
 	.flags			= IRQCHIP_MASK_ON_SUSPEND |
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

