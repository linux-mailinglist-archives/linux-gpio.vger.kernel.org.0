Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 439B63EEACC
	for <lists+linux-gpio@lfdr.de>; Tue, 17 Aug 2021 12:19:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbhHQKUQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 17 Aug 2021 06:20:16 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:30995 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234632AbhHQKUQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Aug 2021 06:20:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629195583; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=/YQlYBOjwBJ+7NfOnYyDE5dO/Re4iHoVSVeAwLV1xhc=; b=eSfOBbJ6EhJp4dSa4IDCHOsbRZiL/RzKeHIzVBmutrYR5AbUV23L+8Gky2BLRbJE0M57IZU3
 kpdWIU16OAGdkGmeBPrAqmTdjw8uhnEuKB9+QcjfZJoy79WEB2fp6O6NB+TjndNO8nWldHA0
 VWcnOcHiN/hfCnkympaozqNS9Q8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 611b8d2c9507ca1a34c48c5c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 17 Aug 2021 10:19:24
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AA8CDC43460; Tue, 17 Aug 2021 10:19:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2E0B4C43619;
        Tue, 17 Aug 2021 10:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 2E0B4C43619
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     maz@kernel.org, tglx@linutronix.de
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, tkjos@google.com, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH 2/2] irqchip: qcom-pdc: Disconnect domain hierarchy for GPIO_NO_WAKE_IRQs
Date:   Tue, 17 Aug 2021 15:49:06 +0530
Message-Id: <1629195546-27811-2-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629195546-27811-1-git-send-email-mkshah@codeaurora.org>
References: <1629195546-27811-1-git-send-email-mkshah@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

gpio_to_irq() reports error at irq_domain_trim_hierarchy() for non wakeup
capable GPIOs that do not have dedicated interrupt at GIC.

Since PDC irqchip do not allocate irq at parent GIC domain for such GPIOs
indicate same by using irq_domain_disconnect_hierarchy().

Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 drivers/irqchip/qcom-pdc.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 32d5920..0ba0461 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -324,8 +324,11 @@ static int qcom_pdc_gpio_alloc(struct irq_domain *domain, unsigned int virq,
 	if (ret)
 		return ret;
 
-	if (hwirq == GPIO_NO_WAKE_IRQ)
+	if (hwirq == GPIO_NO_WAKE_IRQ) {
+		if (domain->parent)
+			irq_domain_disconnect_hierarchy(domain->parent, virq);
 		return 0;
+	}
 
 	parent_hwirq = get_parent_hwirq(hwirq);
 	if (parent_hwirq == PDC_NO_PARENT_IRQ)
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

