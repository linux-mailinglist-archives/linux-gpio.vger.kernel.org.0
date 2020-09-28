Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 27A5F27A68A
	for <lists+linux-gpio@lfdr.de>; Mon, 28 Sep 2020 06:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726621AbgI1Ecw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 28 Sep 2020 00:32:52 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:42529 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726578AbgI1Ect (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 28 Sep 2020 00:32:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1601267569; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=0JThWT0sBGIX5Mh42LbktXHjcI/UXdp+gkX8IZumgRs=; b=YEmGCjG6cp57wa8Z/SG+sEMvu4ACY1JaEk63t59bhyrYuC1hLm+ra2PrFe9IUh2E8XsW14Kd
 fMUnofFVa+GL9d/0dRkzqWPpcmAiLIPYwR+ZlO7I59Rva7wMckeKRsQIvkgddPho7mqa+kGr
 Nj0ItNVHAQbC6oeHMJkA23Q8H+4=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f716771a7eb63c698d3c43c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Sep 2020 04:32:49
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4D19DC43382; Mon, 28 Sep 2020 04:32:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6311FC433F1;
        Mon, 28 Sep 2020 04:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6311FC433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     bjorn.andersson@linaro.org, maz@kernel.org,
        linus.walleij@linaro.org, swboyd@chromium.org,
        evgreen@chromium.org, mka@chromium.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, agross@kernel.org, tglx@linutronix.de,
        jason@lakedaemon.net, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH v6 5/6] irqchip: qcom-pdc: Set IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND flag
Date:   Mon, 28 Sep 2020 10:02:03 +0530
Message-Id: <1601267524-20199-6-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601267524-20199-1-git-send-email-mkshah@codeaurora.org>
References: <1601267524-20199-1-git-send-email-mkshah@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Set IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND flag to enable/unmask the
wakeirqs during suspend entry.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 drivers/irqchip/qcom-pdc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 6ae9e1f..acc0620 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -205,7 +205,8 @@ static struct irq_chip qcom_pdc_gic_chip = {
 	.irq_set_type		= qcom_pdc_gic_set_type,
 	.flags			= IRQCHIP_MASK_ON_SUSPEND |
 				  IRQCHIP_SET_TYPE_MASKED |
-				  IRQCHIP_SKIP_SET_WAKE,
+				  IRQCHIP_SKIP_SET_WAKE |
+				  IRQCHIP_ENABLE_WAKEUP_ON_SUSPEND,
 	.irq_set_vcpu_affinity	= irq_chip_set_vcpu_affinity_parent,
 	.irq_set_affinity	= irq_chip_set_affinity_parent,
 };
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

