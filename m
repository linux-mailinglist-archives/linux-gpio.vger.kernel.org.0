Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C76020336B
	for <lists+linux-gpio@lfdr.de>; Mon, 22 Jun 2020 11:33:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbgFVJdI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 22 Jun 2020 05:33:08 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:23064 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726955AbgFVJdH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 22 Jun 2020 05:33:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592818387; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=qY8kwUGUQvJmFqhD+3PhiES4ZiCcfYGjUj/PxGa7Klg=; b=PBzO3XHhgzDK/kSSvY/fpheaQfxMPKAOHAiNtJLO52L81eVIhL5Fy8q7wBttFYrKTSXMi5Fd
 WejdnzRSXiF3rrR1TUMupoDndrI6Z23aD6wcHvOIf24/Irk8cgskTSqDNiqNWWg1yDBhdRpO
 lGOMTkvemJ/6lQxvzIjO8fxeZ/0=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-east-1.postgun.com with SMTP id
 5ef07ad1567385e8e785bafe (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Jun 2020 09:33:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E1FE2C433AD; Mon, 22 Jun 2020 09:33:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 81E5FC43395;
        Mon, 22 Jun 2020 09:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 81E5FC43395
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
Subject: [PATCH v3 5/5] irqchip: qcom-pdc: Reset all pdc interrupts during init
Date:   Mon, 22 Jun 2020 15:01:48 +0530
Message-Id: <1592818308-23001-6-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1592818308-23001-1-git-send-email-mkshah@codeaurora.org>
References: <1592818308-23001-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Clear previous kernel's configuration during init by resetting
all interrupts in enable bank to zero.

Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 drivers/irqchip/qcom-pdc.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 8beb6f7..11a9d3a 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -19,6 +19,7 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
+#define PDC_MAX_IRQS_PER_REG	32
 #define PDC_MAX_IRQS		168
 #define PDC_MAX_GPIO_IRQS	256
 
@@ -339,6 +340,7 @@ static const struct irq_domain_ops qcom_pdc_gpio_ops = {
 static int pdc_setup_pin_mapping(struct device_node *np)
 {
 	int ret, n;
+	u32 reg, max_regs, max_pins = 0;
 
 	n = of_property_count_elems_of_size(np, "qcom,pdc-ranges", sizeof(u32));
 	if (n <= 0 || n % 3)
@@ -367,8 +369,19 @@ static int pdc_setup_pin_mapping(struct device_node *np)
 						 &pdc_region[n].cnt);
 		if (ret)
 			return ret;
+		max_pins += pdc_region[n].cnt;
 	}
 
+	if (max_pins > PDC_MAX_IRQS)
+		return -EINVAL;
+
+	max_regs = max_pins / PDC_MAX_IRQS_PER_REG;
+	if (max_pins % PDC_MAX_IRQS_PER_REG)
+		max_regs++;
+
+	for (reg = 0; reg < max_regs; reg++)
+		pdc_reg_write(IRQ_ENABLE_BANK, reg, 0);
+
 	return 0;
 }
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

