Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AF48F55153
	for <lists+linux-gpio@lfdr.de>; Tue, 25 Jun 2019 16:15:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729762AbfFYOPB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 25 Jun 2019 10:15:01 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:43524 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727070AbfFYOPB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 10:15:01 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id ACFFE60709; Tue, 25 Jun 2019 14:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561472100;
        bh=l93+BVnlcMYbPv/B3MtkkvFbxlDUUawmAE3SnOFBacw=;
        h=From:To:Cc:Subject:Date:From;
        b=gmgD1+2aDCDUiWfEmSyUPM2v5JWRZ9MF0/0PVeT3NYZKrrJ0qir3b1NSo0RXU0djw
         k1p5dJZ1m7xQOo7myXYz++CU9J7bIDxhQ+nw6eGgRdLqOTUQBquLAXzJuy8w3N0j5q
         3/N3ij91Mao2vPjSzffkhpupgApoYKyV/nBMBjCE=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from neeraju-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: neeraju@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 002576028D;
        Tue, 25 Jun 2019 14:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1561472097;
        bh=l93+BVnlcMYbPv/B3MtkkvFbxlDUUawmAE3SnOFBacw=;
        h=From:To:Cc:Subject:Date:From;
        b=QTDbqujJQ5m8SgLELvYglSZwnr1b8JeXi3vNE7DPxwuQG8B3RxVGjRpG5eRUDmY7c
         rW8NZO8/cv9XYRHRYuk8ktmE/5dfZHXPt0vwV9uJDygk8f7X5n9LrUsYFv28zX4OFF
         8Nxgx1gwa6ApF9TbAmFeDRrbtDPFxt30uILzgMAc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 002576028D
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=neeraju@codeaurora.org
From:   Neeraj Upadhyay <neeraju@codeaurora.org>
To:     linus.walleij@linaro.org, bjorn.andersson@linaro.org,
        sboyd@kernel.org, timur@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Ramana <sramana@codeaurora.org>,
        Neeraj Upadhyay <neeraju@codeaurora.org>
Subject: [PATCH v3] pinctrl: qcom: Add irq_enable callback for msm gpio
Date:   Tue, 25 Jun 2019 19:44:46 +0530
Message-Id: <1561472086-23360-1-git-send-email-neeraju@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Srinivas Ramana <sramana@codeaurora.org>

Introduce the irq_enable callback which will be same as irq_unmask
except that it will also clear the status bit before unmask.

This will help in clearing any erroneous interrupts that would
have got latched when the interrupt is not in use.

There may be devices like UART which can use the same gpio line
for data rx as well as a wakeup gpio when in suspend. The data that
was flowing on the line may latch the interrupt and when we enable
the interrupt before going to suspend, this would trigger the
unexpected interrupt. This change helps clearing the interrupt
so that these unexpected interrupts gets cleared.

Signed-off-by: Srinivas Ramana <sramana@codeaurora.org>
Signed-off-by: Neeraj Upadhyay <neeraju@codeaurora.org>
---

Changes since v2:
- Renamed function to msm_gpio_irq_clear_unmask()

 drivers/pinctrl/qcom/pinctrl-msm.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 6e319bc..0223755 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -729,7 +729,7 @@ static void msm_gpio_irq_mask(struct irq_data *d)
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 }
 
-static void msm_gpio_irq_unmask(struct irq_data *d)
+static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
@@ -741,6 +741,17 @@ static void msm_gpio_irq_unmask(struct irq_data *d)
 
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
+	if (status_clear) {
+		/*
+		 * clear the interrupt status bit before unmask to avoid
+		 * any erroneous interrupts that would have got latched
+		 * when the interrupt is not in use.
+		 */
+		val = msm_readl_intr_status(pctrl, g);
+		val &= ~BIT(g->intr_status_bit);
+		msm_writel_intr_status(val, pctrl, g);
+	}
+
 	val = msm_readl_intr_cfg(pctrl, g);
 	val |= BIT(g->intr_raw_status_bit);
 	val |= BIT(g->intr_enable_bit);
@@ -751,6 +762,17 @@ static void msm_gpio_irq_unmask(struct irq_data *d)
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
 }
 
+static void msm_gpio_irq_enable(struct irq_data *d)
+{
+
+	msm_gpio_irq_clear_unmask(d, true);
+}
+
+static void msm_gpio_irq_unmask(struct irq_data *d)
+{
+	msm_gpio_irq_clear_unmask(d, false);
+}
+
 static void msm_gpio_irq_ack(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
@@ -978,6 +1000,7 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 	chip->need_valid_mask = msm_gpio_needs_valid_mask(pctrl);
 
 	pctrl->irq_chip.name = "msmgpio";
+	pctrl->irq_chip.irq_enable = msm_gpio_irq_enable;
 	pctrl->irq_chip.irq_mask = msm_gpio_irq_mask;
 	pctrl->irq_chip.irq_unmask = msm_gpio_irq_unmask;
 	pctrl->irq_chip.irq_ack = msm_gpio_irq_ack;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a
member of the Code Aurora Forum, hosted by The Linux Foundation

