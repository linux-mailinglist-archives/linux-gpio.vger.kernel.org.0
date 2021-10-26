Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF2E543B1FD
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Oct 2021 14:09:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234523AbhJZMMQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Oct 2021 08:12:16 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:57935 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233577AbhJZMMQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Oct 2021 08:12:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635250192; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Wi2g9oaHJT7mM82NA73R8R3pp1Mfzb/U/GZ9dKT5FOc=; b=jy4y0q8rnWtHpcsokn2qNMneMeZiOVx651scTCeqEk4yqJ+fWBSrxe+4kIovkz2qCIjwIHz7
 RlxbW5+g6vO4mbSHiWCVcGtaOOZxWBt0XSOnbjZh1tgwFQjPrrkC+zzuaadxNEUR1DK+rwFj
 LAuVff3ncHbxjKonkYUpCcyGskk=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6177f002b03398c06cb31c3e (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 26 Oct 2021 12:09:38
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4B978C4338F; Tue, 26 Oct 2021 12:09:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id AE3DDC4338F;
        Tue, 26 Oct 2021 12:09:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org AE3DDC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        linus.walleij@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, psodagud@codeaurora.org,
        dianders@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2 1/2] pinctrl: qcom: Add egpio feature support
Date:   Tue, 26 Oct 2021 17:37:35 +0530
Message-Id: <1635250056-20274-1-git-send-email-rnayak@codeaurora.org>
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
 drivers/pinctrl/qcom/pinctrl-msm.c | 17 +++++++++++++++--
 drivers/pinctrl/qcom/pinctrl-msm.h |  4 ++++
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 8476a8a..bfdba3a 100644
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
@@ -218,8 +219,20 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
 	raw_spin_lock_irqsave(&pctrl->lock, flags);
 
 	val = msm_readl_ctl(pctrl, g);
-	val &= ~mask;
-	val |= i << g->mux_bit;
+
+	if (egpio_func && i == egpio_func) {
+		if (val & BIT(g->egpio_present))
+			val &= ~BIT(g->egpio_enable);
+		else
+			return -EINVAL;
+	} else {
+		val &= ~mask;
+		val |= i << g->mux_bit;
+		/* Check if egpio present and enable that feature */
+		if (egpio_func && (val & BIT(g->egpio_present)))
+			val |= BIT(g->egpio_enable);
+	}
+
 	msm_writel_ctl(val, pctrl, g);
 
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index e31a516..b7110ac 100644
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
@@ -119,6 +121,7 @@ struct msm_gpio_wakeirq_map {
  *                            to be aware that their parent can't handle dual
  *                            edge interrupts.
  * @gpio_func: Which function number is GPIO (usually 0).
+ * @egpio_func: Which function number is eGPIO
  */
 struct msm_pinctrl_soc_data {
 	const struct pinctrl_pin_desc *pins;
@@ -136,6 +139,7 @@ struct msm_pinctrl_soc_data {
 	unsigned int nwakeirq_map;
 	bool wakeirq_dual_edge_errata;
 	unsigned int gpio_func;
+	unsigned int egpio_func;
 };
 
 extern const struct dev_pm_ops msm_pinctrl_dev_pm_ops;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

