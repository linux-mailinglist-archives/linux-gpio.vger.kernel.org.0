Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC6D824E89F
	for <lists+linux-gpio@lfdr.de>; Sat, 22 Aug 2020 18:18:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728502AbgHVQSG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 22 Aug 2020 12:18:06 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:20655 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728478AbgHVQSF (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 22 Aug 2020 12:18:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1598113085; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=6CK3GhJoJ54IkukAZoKwFfsGZ9K0U13iWkuTPb/0AKs=; b=qF93VePZe/mB5EsrpVcyhJQFgcBZeh/S6ODu7LOOO0sm0VBuIys6wk1r7IWi8iACMaZ3Du8p
 8shhVtZ+5Bps0j0xfmnwPlo8vHhphMtGSZcf8w5pVK92IjnNvyvlxHxdbSw6b8SRgJy1hMxo
 +8YlbLnBuwFcldnG27Saw3U95rQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f41452fa0b59f2b43554d4c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 22 Aug 2020 16:17:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DB590C433A0; Sat, 22 Aug 2020 16:17:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 409E7C433AD;
        Sat, 22 Aug 2020 16:17:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 409E7C433AD
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
Subject: [PATCH v5 6/6] irqchip: qcom-pdc: Reset PDC interrupts during init
Date:   Sat, 22 Aug 2020 21:47:01 +0530
Message-Id: <1598113021-4149-7-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1598113021-4149-1-git-send-email-mkshah@codeaurora.org>
References: <1598113021-4149-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Kexec can directly boot into a new kernel without going to complete
reboot. This can leave the previous kernel's configuration for PDC
interrupts as is.

Clear previous kernel's configuration during init by setting interrupts
in enable bank to zero. The IRQs specified in qcom,pdc-ranges property
are the only ones that can be used by the new kernel so clear only those
IRQs. The remaining ones may be in use by a different kernel and should
not be set by new kernel.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 drivers/irqchip/qcom-pdc.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/qcom-pdc.c b/drivers/irqchip/qcom-pdc.c
index 052a20d..7b40f07 100644
--- a/drivers/irqchip/qcom-pdc.c
+++ b/drivers/irqchip/qcom-pdc.c
@@ -343,7 +343,8 @@ static const struct irq_domain_ops qcom_pdc_gpio_ops = {
 
 static int pdc_setup_pin_mapping(struct device_node *np)
 {
-	int ret, n;
+	int ret, n, i;
+	u32 irq_index, reg_index, val;
 
 	n = of_property_count_elems_of_size(np, "qcom,pdc-ranges", sizeof(u32));
 	if (n <= 0 || n % 3)
@@ -372,6 +373,14 @@ static int pdc_setup_pin_mapping(struct device_node *np)
 						 &pdc_region[n].cnt);
 		if (ret)
 			return ret;
+
+		for (i = 0; i < pdc_region[n].cnt; i++) {
+			reg_index = (i + pdc_region[n].pin_base) >> 5;
+			irq_index = (i + pdc_region[n].pin_base) & 0x1f;
+			val = pdc_reg_read(IRQ_ENABLE_BANK, reg_index);
+			val &= ~BIT(irq_index);
+			pdc_reg_write(IRQ_ENABLE_BANK, reg_index, val);
+		}
 	}
 
 	return 0;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

