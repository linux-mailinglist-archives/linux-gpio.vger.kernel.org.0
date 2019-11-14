Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 38212FCDCA
	for <lists+linux-gpio@lfdr.de>; Thu, 14 Nov 2019 19:36:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726598AbfKNSfn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 14 Nov 2019 13:35:43 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:55806 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727135AbfKNSfn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Nov 2019 13:35:43 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 4CE6361204; Thu, 14 Nov 2019 18:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573756542;
        bh=R1rxmSTHgqlaRZ55YLFsSuuTMYGKyL4GiFq9O9APVvY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=OXKkcg3WJ3ldd3uYoKgFboV316H7F/0c2YWMguXy7pu5OqZ1LnMJGatJekfo7tni8
         SP4N7YiA+GBNeqd5ToLG5z2QU28bOZpe8340UihJtIehduPhjN4b2J9UW5sdA9X4m8
         FPb8svcC5rTwAbC11Kd7m+FN6mTwoDaoIHznlNrU=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 54C62611AD;
        Thu, 14 Nov 2019 18:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573756538;
        bh=R1rxmSTHgqlaRZ55YLFsSuuTMYGKyL4GiFq9O9APVvY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hHWj26L7rzDueRrR8a//QOmSo5A1TgyC7J1DYlvqY2ZB3qU20U7hPQjLFiBMTpSHF
         ySmuXFhlk4vknLIDx7TvcmUJyWTcrvSt2ss8XitlCNygU2HU+sVm6b6xIQIpjRm1kX
         rx/IHklb0+HcOkR9Ba+69BiKPaHnFGi27YgqPxnA=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 54C62611AD
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, maz@kernel.org, linus.walleij@linaro.org,
        bjorn.andersson@linaro.org
Cc:     evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
Subject: [PATCH 03/12] drivers: irqchip: pdc: Do not toggle IRQ_ENABLE during mask/unmask
Date:   Thu, 14 Nov 2019 11:35:12 -0700
Message-Id: <1573756521-27373-4-git-send-email-ilina@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573756521-27373-1-git-send-email-ilina@codeaurora.org>
References: <1573756521-27373-1-git-send-email-ilina@codeaurora.org>
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
index 690cf10..527c29e 100644
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

