Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2CF81C0E34
	for <lists+linux-gpio@lfdr.de>; Fri,  1 May 2020 08:31:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728296AbgEAGbW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 1 May 2020 02:31:22 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:50862 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728304AbgEAGbW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 1 May 2020 02:31:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588314681; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=+ZeZENPKHRVIAyX18Mb1d2RgeUC/KuHefKXYMNBHvno=; b=mKUxJ140H56/k+WV3z+MP4t+uVDAeWS1JWATbl3Idfn2ynk3cH1M3uaBJfhSXfDjXE4uD+wl
 TdZdbiXX1KDxPeKl9QCP5aYKlSRZqM8kvTPRx/Tj49NNxbcq0N+3MEthDFtLTwuCKk0MKCqc
 oSkG60yZdjP5Hu0d7WyQyfQ7oqk=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eabc22c.7f0f9389e3e8-smtp-out-n01;
 Fri, 01 May 2020 06:31:08 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 885D1C433CB; Fri,  1 May 2020 06:31:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E2741C433D2;
        Fri,  1 May 2020 06:31:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E2741C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     andy.gross@linaro.org, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, dianders@chromium.org,
        swboyd@chromium.org, rnayak@codeaurora.org, ilina@codeaurora.org,
        lsrao@codeaurora.org,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH] pinctrl: qcom: Add affinity callbacks to msmgpio IRQ chip
Date:   Fri,  1 May 2020 12:00:17 +0530
Message-Id: <1588314617-4556-1-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>

Wakeup capable GPIO IRQs routed via PDC are not being migrated when a CPU
is hotplugged. Add affinity callbacks to msmgpio IRQ chip to update the
affinity of wakeup capable IRQs.

Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
[mkshah: updated commit text and minor code fixes]
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 29259fe..83b7d64 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1033,6 +1033,29 @@ static void msm_gpio_irq_relres(struct irq_data *d)
 	module_put(gc->owner);
 }
 
+static int msm_gpio_irq_set_affinity(struct irq_data *d,
+				const struct cpumask *dest, bool force)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
+
+	if (d->parent_data && test_bit(d->hwirq, pctrl->skip_wake_irqs))
+		return irq_chip_set_affinity_parent(d, dest, force);
+
+	return 0;
+}
+
+static int msm_gpio_irq_set_vcpu_affinity(struct irq_data *d, void *vcpu_info)
+{
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
+
+	if (d->parent_data && test_bit(d->hwirq, pctrl->skip_wake_irqs))
+		return irq_chip_set_vcpu_affinity_parent(d, vcpu_info);
+
+	return 0;
+}
+
 static void msm_gpio_irq_handler(struct irq_desc *desc)
 {
 	struct gpio_chip *gc = irq_desc_get_handler_data(desc);
@@ -1131,6 +1154,8 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 	pctrl->irq_chip.irq_set_wake = msm_gpio_irq_set_wake;
 	pctrl->irq_chip.irq_request_resources = msm_gpio_irq_reqres;
 	pctrl->irq_chip.irq_release_resources = msm_gpio_irq_relres;
+	pctrl->irq_chip.irq_set_affinity = msm_gpio_irq_set_affinity;
+	pctrl->irq_chip.irq_set_vcpu_affinity = msm_gpio_irq_set_vcpu_affinity;
 
 	np = of_parse_phandle(pctrl->dev->of_node, "wakeup-parent", 0);
 	if (np) {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
