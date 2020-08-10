Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFFF0240547
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Aug 2020 13:23:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbgHJLXq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Aug 2020 07:23:46 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:32183 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726582AbgHJLVr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 Aug 2020 07:21:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597058506; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=mqnn1tcO31+McILWR4pyqetsbXKoTzHXqLT8TDtPAjM=; b=kRgeWb/C34Fq3KWT7jhyMI3vMepKfz+6Sgqa7ODLDZVPK1ikH4QYOSH6J0eOhJ/ayAcK04ja
 0kkdD8cpLGLSG2HGUBfFWhEhsO/tlniJVMI8pzsOlfKxTV3Ff5s2AzxX/Slu1Zz0F+ECUFLv
 dVtKAIG4scKU0rHRWVoqJOutAgg=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n11.prod.us-west-2.postgun.com with SMTP id
 5f312dc72889723bf8070752 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 10 Aug 2020 11:21:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B9B69C433CA; Mon, 10 Aug 2020 11:21:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 75A96C433C9;
        Mon, 10 Aug 2020 11:21:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 75A96C433C9
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
Subject: [PATCH v4 5/7] pinctrl: qcom: Call our parent for irq_suspend_one / irq_resume_one
Date:   Mon, 10 Aug 2020 16:50:58 +0530
Message-Id: <1597058460-16211-6-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1597058460-16211-1-git-send-email-mkshah@codeaurora.org>
References: <1597058460-16211-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Douglas Anderson <dianders@chromium.org>

The parent (PDC) needs to handle this.  Call it.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index c264561..eaad229 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1237,6 +1237,8 @@ static int msm_gpio_init(struct msm_pinctrl *pctrl)
 	pctrl->irq_chip.irq_ack = msm_gpio_irq_ack;
 	pctrl->irq_chip.irq_set_type = msm_gpio_irq_set_type;
 	pctrl->irq_chip.irq_set_wake = msm_gpio_irq_set_wake;
+	pctrl->irq_chip.irq_suspend_one = irq_chip_suspend_one_parent;
+	pctrl->irq_chip.irq_resume_one = irq_chip_resume_one_parent;
 	pctrl->irq_chip.irq_request_resources = msm_gpio_irq_reqres;
 	pctrl->irq_chip.irq_release_resources = msm_gpio_irq_relres;
 	pctrl->irq_chip.irq_set_affinity = msm_gpio_irq_set_affinity;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

