Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 049DF3090E
	for <lists+linux-gpio@lfdr.de>; Fri, 31 May 2019 08:58:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbfEaG6N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 31 May 2019 02:58:13 -0400
Received: from alexa-out-tai-01.qualcomm.com ([103.229.16.226]:10736 "EHLO
        alexa-out-tai-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725963AbfEaG6N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 31 May 2019 02:58:13 -0400
X-Greylist: delayed 366 seconds by postgrey-1.27 at vger.kernel.org; Fri, 31 May 2019 02:58:12 EDT
Received: from ironmsg02-tai.qualcomm.com ([10.249.140.7])
  by alexa-out-tai-01.qualcomm.com with ESMTP; 31 May 2019 14:52:04 +0800
X-IronPort-AV: E=McAfee;i="5900,7806,9273"; a="30797288"
Received: from c-fan-gv.ap.qualcomm.com (HELO c-fan-gv) ([10.231.253.105])
  by ironmsg02-tai.qualcomm.com with ESMTP/TLS/DHE-RSA-AES256-SHA; 31 May 2019 14:51:55 +0800
From:   Tengfei Fan <tengfeif@codeaurora.org>
To:     bjorn.andersson@linaro.org, andy.gross@linaro.org,
        david.brown@linaro.org, linus.walleij@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tengfei Fan <tengfeif@codeaurora.org>
Subject: [PATCH] pinctrl: qcom: Clear status bit on irq_unmask
Date:   Fri, 31 May 2019 14:51:52 +0800
Message-Id: <1559285512-27784-1-git-send-email-tengfeif@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The gpio interrupt status bit is getting set after the
irq is disabled and causing an immediate interrupt after
enablling the irq, so clear status bit on irq_unmask.

Signed-off-by: Tengfei Fan <tengfeif@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index ee81198..7283c50 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -740,6 +740,7 @@ static void msm_gpio_irq_mask(struct irq_data *d)
 static void msm_gpio_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	uint32_t irqtype = irqd_get_trigger_type(d);
 	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
 	const struct msm_pingroup *g;
 	unsigned long flags;
@@ -749,6 +750,12 @@ static void msm_gpio_irq_unmask(struct irq_data *d)
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
+	if (irqtype & (IRQF_TRIGGER_HIGH | IRQF_TRIGGER_LOW)) {
+		val = readl_relaxed(pctrl->regs + g->intr_status_reg);
+		val &= ~BIT(g->intr_status_bit);
+		 writel_relaxed(val, pctrl->regs + g->intr_status_reg);
+	}
+
 	val = msm_readl_intr_cfg(pctrl, g);
 	val |= BIT(g->intr_raw_status_bit);
 	val |= BIT(g->intr_enable_bit);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

