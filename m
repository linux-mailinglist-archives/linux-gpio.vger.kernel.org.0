Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C7454529E3
	for <lists+linux-gpio@lfdr.de>; Tue, 16 Nov 2021 06:38:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235459AbhKPFlm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 16 Nov 2021 00:41:42 -0500
Received: from so254-9.mailgun.net ([198.61.254.9]:52594 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235398AbhKPFlX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Nov 2021 00:41:23 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1637041106; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=rnRezh1dn/Uc+3/SygoVMHA3pQwrOPcij5LNbizx4ss=; b=QvGWFeSXxZP2cRyXAw283tD3wwXykpL9C9trcojMRXFGKGSqANtsRIHg494JryGhwoWcH3yx
 sZdt9XXXVc2Wj5YB04ob9Z3nJGj7mnxe6aPbQYcTVlca3K3B02E/gOGz5noDZgDYIKzXq85U
 3a4Z77pyVzmAMPLKFpww+zGBUag=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 619343ced8e58e6de19f4548 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Nov 2021 05:38:22
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BAB94C43617; Tue, 16 Nov 2021 05:38:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E447EC4360D;
        Tue, 16 Nov 2021 05:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E447EC4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        linus.walleij@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, psodagud@codeaurora.org,
        dianders@chromium.org, swboyd@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v3 1/2] pinctrl: qcom: Add egpio feature support
Date:   Tue, 16 Nov 2021 11:08:03 +0530
Message-Id: <1637041084-3299-1-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Prasad Sodagudi <psodagud@codeaurora.org>

egpio is a scheme which allows special power Island Domain IOs
(LPASS,SSC) to be reused as regular chip GPIOs by muxing regular
TLMM functions with Island Domain functions.
With this scheme, an IO can be controlled both by the cpu running
linux and the Island processor. This provides great flexibility to
re-purpose the Island IOs for regular TLMM usecases.

2 new bits are added to ctl_reg, egpio_present is a read only bit
which shows if egpio feature is available or not on a given gpio.
egpio_enable is the read/write bit and only effective if egpio_present
is 1. Once its set, the Island IO is controlled from Chip TLMM.
egpio_enable when set to 0 means the GPIO is used as Island Domain IO.

To support this we add a new function 'egpio' which can be used to
set the egpio_enable to 0, for any other TLMM controlled functions
we set the egpio_enable to 1.

Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 15 +++++++++++++--
 drivers/pinctrl/qcom/pinctrl-msm.h | 10 ++++++++++
 2 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 8476a8a..ae09e2d 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -185,6 +185,7 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
 	unsigned int irq = irq_find_mapping(gc->irq.domain, group);
 	struct irq_data *d = irq_get_irq_data(irq);
 	unsigned int gpio_func = pctrl->soc->gpio_func;
+	unsigned int egpio_func = pctrl->soc->egpio_func;
 	const struct msm_pingroup *g;
 	unsigned long flags;
 	u32 val, mask;
@@ -218,8 +219,18 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
 	val = msm_readl_ctl(pctrl, g);
-	val &= ~mask;
-	val |= i << g->mux_bit;
+
+	if (egpio_func && i == egpio_func) {
+		if (val & BIT(g->egpio_present))
+			val &= ~BIT(g->egpio_enable);
+	} else {
+		val &= ~mask;
+		val |= i << g->mux_bit;
+		/* Claim ownership of pin if egpio capable */
+		if (egpio_func && val & BIT(g->egpio_present))
+			val |= BIT(g->egpio_enable);
+	}
+
 	msm_writel_ctl(val, pctrl, g);
 
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index e31a516..dd0d949 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.h
+++ b/drivers/pinctrl/qcom/pinctrl-msm.h
@@ -77,6 +77,8 @@ struct msm_pingroup {
 	unsigned drv_bit:5;
 
 	unsigned od_bit:5;
+	unsigned egpio_enable:5;
+	unsigned egpio_present:5;
 	unsigned oe_bit:5;
 	unsigned in_bit:5;
 	unsigned out_bit:5;
@@ -119,6 +121,13 @@ struct msm_gpio_wakeirq_map {
  *                            to be aware that their parent can't handle dual
  *                            edge interrupts.
  * @gpio_func: Which function number is GPIO (usually 0).
+ * @egpio_func: If non-zero then this SoC supports eGPIO. Even though in
+ *              hardware this is a mux 1-level above the TLMM, we'll treat
+ *              it as if this is just another mux state of the TLMM. Since
+ *              it doesn't really map to hardware, we'll allocate a virtual
+ *              function number for eGPIO and any time we see that function
+ *              number used we'll treat it as a request to mux away from
+ *              our TLMM towards another owner.
  */
 struct msm_pinctrl_soc_data {
 	const struct pinctrl_pin_desc *pins;
@@ -136,6 +145,7 @@ struct msm_pinctrl_soc_data {
 	unsigned int nwakeirq_map;
 	bool wakeirq_dual_edge_errata;
 	unsigned int gpio_func;
+	unsigned int egpio_func;
 };
 
 extern const struct dev_pm_ops msm_pinctrl_dev_pm_ops;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

