Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4A3E1DF890
	for <lists+linux-gpio@lfdr.de>; Sat, 23 May 2020 19:13:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728310AbgEWRLn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 23 May 2020 13:11:43 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:18631 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728757AbgEWRLm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 23 May 2020 13:11:42 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590253902; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=q0utGiyDt8WT0d1no5dYJq9oKXeMrSH7v6XiMw0CH6w=; b=RO639A5BL0w1WWVKlUM4NVqQ+h4viTFGKNBKPYXBloTa+7LISJj76lAbP6g4fSHdl0kB5tIG
 zRcWP+X9R4SsVgdkyNM4mhMBZ9rJvhVVwFMXN54oODaNUbg+NXhrQl+vYkyCNQCx4H5BuSxT
 JXQGjRsb3KFYkI4HZ9S0tZBRc7I=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec9594d.7fdc6139adc0-smtp-out-n05;
 Sat, 23 May 2020 17:11:41 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A9002C4339C; Sat, 23 May 2020 17:11:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E3AB8C433C9;
        Sat, 23 May 2020 17:11:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E3AB8C433C9
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
Subject: [PATCH v2 3/4] pinctrl: qcom: Add msmgpio irqchip flags
Date:   Sat, 23 May 2020 22:41:12 +0530
Message-Id: <1590253873-11556-4-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1590253873-11556-1-git-send-email-mkshah@codeaurora.org>
References: <1590253873-11556-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add irqchip specific flags for msmgpio irqchip to mask non wakeirqs
during suspend and mask before setting irq type.

Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 2419023..b909ffe 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1143,6 +1143,8 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 	pctrl->irq_chip.irq_release_resources = msm_gpio_irq_relres;
 	pctrl->irq_chip.irq_set_affinity = msm_gpio_irq_set_affinity;
 	pctrl->irq_chip.irq_set_vcpu_affinity = msm_gpio_irq_set_vcpu_affinity;
+	pctrl->irq_chip.flags = IRQCHIP_MASK_ON_SUSPEND
+				| IRQCHIP_SET_TYPE_MASKED;
 
 	np = of_parse_phandle(pctrl->dev->of_node, "wakeup-parent", 0);
 	if (np) {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
