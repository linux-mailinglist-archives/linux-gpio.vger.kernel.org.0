Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A5BF2A7818
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Nov 2020 08:38:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727114AbgKEHie (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Nov 2020 02:38:34 -0500
Received: from z5.mailgun.us ([104.130.96.5]:38052 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725287AbgKEHie (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 5 Nov 2020 02:38:34 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604561913; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=jrJcmf3UQJ0AFxNzksWVPLzLFiGbLtv+PPF03P26Zy0=; b=LD4v+qBjpwJcgMLi6hbGF+v40zuKADb6sls29Y2UchPZIHJimkvu91mO2+QLBW3m/rDJODFc
 E9VbKAbU68Yv2Y9Xbkw3qZlRboQKMWAApZvy+OpC9Fkssu+Hs8KeJdymDd8S++8J1xbtZLl1
 +xelLtLiEWzMc+HOoEj8llIJfew=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5fa3abec5a326dd91f1aeb24 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 05 Nov 2020 07:38:20
 GMT
Sender: mkshah=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5F42FC433CB; Thu,  5 Nov 2020 07:38:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mkshah-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E082DC433C8;
        Thu,  5 Nov 2020 07:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E082DC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     linus.walleij@linaro.org, bjorn.andersson@linaro.org,
        agross@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, dianders@chromium.org,
        swboyd@chromium.org, evgreen@chromium.org, mka@chromium.org,
        rnayak@codeaurora.org, ilina@codeaurora.org, lsrao@codeaurora.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH] pinctrl: qcom: Move clearing pending IRQ to .irq_request_resources callback
Date:   Thu,  5 Nov 2020 13:08:04 +0530
Message-Id: <1604561884-10166-1-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

When GPIOs that are routed to PDC are used as output they can still latch
the IRQ pending at GIC. As a result the spurious IRQ was handled when the
client driver change the direction to input to starts using it as IRQ.

Currently such erroneous latched IRQ are cleared with .irq_enable callback
however if the driver continue to use GPIO as interrupt and invokes
disable_irq() followed by enable_irq() then everytime during enable_irq()
previously latched interrupt gets cleared.

This can make edge IRQs not seen after enable_irq() if they had arrived
after the driver has invoked disable_irq() and were pending at GIC.

Move clearing erroneous IRQ to .irq_request_resources callback as this is
the place where GPIO direction is changed as input and its locked as IRQ.

While at this add a missing check to invoke msm_gpio_irq_clear_unmask()
from .irq_enable callback only when GPIO is not routed to PDC.

Fixes: e35a6ae0eb3a ("pinctrl/msm: Setup GPIO chip in hierarchy")
Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 32 +++++++++++++++++++-------------
 1 file changed, 19 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index c4bcda9..77a25bd 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -815,21 +815,14 @@ static void msm_gpio_irq_clear_unmask(struct irq_data *d, bool status_clear)
 
 static void msm_gpio_irq_enable(struct irq_data *d)
 {
-	/*
-	 * Clear the interrupt that may be pending before we enable
-	 * the line.
-	 * This is especially a problem with the GPIOs routed to the
-	 * PDC. These GPIOs are direct-connect interrupts to the GIC.
-	 * Disabling the interrupt line at the PDC does not prevent
-	 * the interrupt from being latched at the GIC. The state at
-	 * GIC needs to be cleared before enabling.
-	 */
-	if (d->parent_data) {
-		irq_chip_set_parent_state(d, IRQCHIP_STATE_PENDING, 0);
+	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
+	struct msm_pinctrl *pctrl = gpiochip_get_data(gc);
+
+	if (d->parent_data)
 		irq_chip_enable_parent(d);
-	}
 
-	msm_gpio_irq_clear_unmask(d, true);
+	if (!test_bit(d->hwirq, pctrl->skip_wake_irqs))
+		msm_gpio_irq_clear_unmask(d, true);
 }
 
 static void msm_gpio_irq_disable(struct irq_data *d)
@@ -1104,6 +1097,19 @@ static int msm_gpio_irq_reqres(struct irq_data *d)
 		ret = -EINVAL;
 		goto out;
 	}
+
+	/*
+	 * Clear the interrupt that may be pending before we enable
+	 * the line.
+	 * This is especially a problem with the GPIOs routed to the
+	 * PDC. These GPIOs are direct-connect interrupts to the GIC.
+	 * Disabling the interrupt line at the PDC does not prevent
+	 * the interrupt from being latched at the GIC. The state at
+	 * GIC needs to be cleared before enabling.
+	 */
+	if (d->parent_data && test_bit(d->hwirq, pctrl->skip_wake_irqs))
+		irq_chip_set_parent_state(d, IRQCHIP_STATE_PENDING, 0);
+
 	return 0;
 out:
 	module_put(gc->owner);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

