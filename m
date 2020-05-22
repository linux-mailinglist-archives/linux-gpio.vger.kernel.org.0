Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08EFC1DE7EA
	for <lists+linux-gpio@lfdr.de>; Fri, 22 May 2020 15:20:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729907AbgEVNUn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 22 May 2020 09:20:43 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:13198 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729918AbgEVNUl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 22 May 2020 09:20:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590153640; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=L/4HSIdcavhg+v6lXNMGj8pRMGcr/dkodA8k1pUpmlM=; b=OacV3anpZTo0i+gvBlrYFEAP+VvbYLmcCIlOoN6tySbtvwANcsIwdv33Bd9EmAWkqashuOEA
 qNaHzA/WPmoBc6b4XV/evyhZDbuOrWDEsKHmjmdhrKM6UCwd95ZiQTQAe6+S0s9TV4gyBl6b
 ibiPnc88oEzHHS0Zvlt8kNnORvg=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5ec7d1962a41f3ed007025bd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 22 May 2020 13:20:22
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3DA18C43395; Fri, 22 May 2020 13:20:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7F715C433C8;
        Fri, 22 May 2020 13:20:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7F715C433C8
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
Subject: [PATCH 2/4] pinctrl: qcom: Remove irq_disable callback from msmgpio irqchip
Date:   Fri, 22 May 2020 18:49:27 +0530
Message-Id: <1590153569-21706-3-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590153569-21706-1-git-send-email-mkshah@codeaurora.org>
References: <1590153569-21706-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The gpio can be marked for wakeup and drivers can invoke disable_irq()
during suspend, in such cases unlazy approach will also disable at HW
and such gpios will not wakeup device from suspend to RAM.

Remove irq_disable callback to allow gpio interrupts to lazy disabled.
The gpio interrupts will get disabled during irq_mask callback.

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

