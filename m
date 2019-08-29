Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52C04A2635
	for <lists+linux-gpio@lfdr.de>; Thu, 29 Aug 2019 20:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728137AbfH2SkF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 29 Aug 2019 14:40:05 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:43982 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728109AbfH2SkF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 29 Aug 2019 14:40:05 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 031C0650DF; Thu, 29 Aug 2019 18:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567104004;
        bh=C76NL2lI9WtV1EgLa6yoNbnozvP8sgbuLm9WRaLvPvg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bYvqXYjDnWeZzjOQU5cLwHNrKnS14he2R7ReGf+oorZrUtwhjZBumI/jWp2s5ush/
         ID0Yq+OmPyx6SHB3Qfx3VbG2czTlYQMDTCRi2FMWFmbqPsyKv79C65weM/4LMAKHn4
         BHZ/h3Wv9KpFh+MkvAMULU7/V9XGmpc/fQ5advoo=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 608BD689AE;
        Thu, 29 Aug 2019 18:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1567102345;
        bh=C76NL2lI9WtV1EgLa6yoNbnozvP8sgbuLm9WRaLvPvg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=lu6zKN1SuhMG+doaOMmCq7+3vjTDBuC7tsKHtYSC5kG2dUwAxm6oaxH8cbFdYQW5j
         +4GxMKczPvorDyraVRcgltHA1hhH/6uOssutpV5OcS83V3JBDc9aBmEnmakbGEqla6
         a/FY0LjoJwUnMCTeMU4XJcVsJZ5Uv5YTtKjs3lDk=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 608BD689AE
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=ilina@codeaurora.org
From:   Lina Iyer <ilina@codeaurora.org>
To:     swboyd@chromium.org, evgreen@chromium.org, marc.zyngier@arm.com,
        linus.walleij@linaro.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bjorn.andersson@linaro.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, rnayak@codeaurora.org
Subject: [PATCH RFC 08/14] drivers: irqchip: pdc: Add irqchip set/get state calls
Date:   Thu, 29 Aug 2019 12:11:57 -0600
Message-Id: <20190829181203.2660-9-ilina@codeaurora.org>
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

Add irqchip calls to set/get interrupt status from the parent interrupt
controller.

Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 drivers/irqchip/qcom-pdc.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index bf5f98bb4d2b..ffd5f83d1023 100644
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

