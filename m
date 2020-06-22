Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2936203360
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 11:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgFVJcu (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 05:32:50 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:28517 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726428AbgFVJct (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Jun 2020 05:32:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592818368; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=kCMlGHm3v2RvmiTd65tVBBeTC8GoTYd/UHLskdGqeIc=; b=j6rQLQ07rixBpJ/CHeAqVXRFVr1yYtb6gEIPTPaxP8M1VNGE8PFgm51oOqSHA1NrxWtm6dOC
 RmyYa0FU8DW+I0x9fr6eAXQ+Tbuc4F2etlTyUSaN6JtL3tW6Ws+QdtHDkdv/jPTyACA0jqtU
 L0ovEPFWebyEGGkL+7R6Oqj06p8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-west-2.postgun.com with SMTP id
 5ef07aba6bebe35deb21ce71 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Jun 2020 09:32:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 091FDC4339C; Mon, 22 Jun 2020 09:32:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 8B02DC433CA;
        Mon, 22 Jun 2020 09:32:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 8B02DC433CA
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
Subject: [PATCH v3 1/5] pinctrl: qcom: Remove irq_disable callback from msmgpio irqchip
Date:   Mon, 22 Jun 2020 15:01:44 +0530
Message-Id: <1592818308-23001-2-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592818308-23001-1-git-send-email-mkshah@codeaurora.org>
References: <1592818308-23001-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The gpio can be marked for wakeup and drivers can invoke disable_irq()
during suspend, in such cases unlazy approach will also disable at HW
and such gpios will not wakeup device from suspend to RAM.

Remove irq_disable callback to allow gpio interrupts to lazy disabled.
The gpio interrupts will get disabled during irq_mask callback.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 83b7d64..2419023 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -815,18 +815,6 @@ static void msm_gpio_irq_enable(struct irq_data *d)
 	msm_gpio_irq_clear_unmask(d, true);
 }
 
-static void msm_gpio_irq_disable(struct irq_data *d)
-{
-	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
-	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
-
-	if (d->parent_data)
-		irq_chip_disable_parent(d);
-
-	if (!test_bit(d->hwirq, pctrl->skip_wake_irqs))
-		msm_gpio_irq_mask(d);
-}
-
 static void msm_gpio_irq_unmask(struct irq_data *d)
 {
 	msm_gpio_irq_clear_unmask(d, false);
@@ -1146,7 +1134,6 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 
 	pctrl->irq_chip.name = "msmgpio";
 	pctrl->irq_chip.irq_enable = msm_gpio_irq_enable;
-	pctrl->irq_chip.irq_disable = msm_gpio_irq_disable;
 	pctrl->irq_chip.irq_mask = msm_gpio_irq_mask;
 	pctrl->irq_chip.irq_unmask = msm_gpio_irq_unmask;
 	pctrl->irq_chip.irq_ack = msm_gpio_irq_ack;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

