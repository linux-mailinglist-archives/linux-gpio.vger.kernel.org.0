Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0639F40F282
	for <lists+linux-gpio@lfdr.de>; Fri, 17 Sep 2021 08:38:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232688AbhIQGjU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 17 Sep 2021 02:39:20 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:16156 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229600AbhIQGjT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 17 Sep 2021 02:39:19 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1631860677; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=KpNmHEE+/4g91dVa8j0rXZUOEaQm94+OYFqDL1vIVhs=; b=EUM0pZYR0I9ycU9sq1G9wrWsvYdOVuAOZSma4c7EkHWtWXUSUoqvD0dKd5ecCqMCd9D4OQ6P
 8E4nQrX9gBdVLW4TQXPPuSf/N6yzSL1P3t4dzPR2Zc283XDj45MwJ0/vKl4HrN133dRh0oc2
 cLt86cPrKU/KCiL+HC1wtluKN/8=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 614437c2e0f78151d6ad05cd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 17 Sep 2021 06:37:54
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8EA35C4338F; Fri, 17 Sep 2021 06:37:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 47A0AC4338F;
        Fri, 17 Sep 2021 06:37:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 47A0AC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        linus.walleij@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prasad Sodagudi <psodagud@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH] pinctrl: qcom: Add egpio feature support
Date:   Fri, 17 Sep 2021 12:07:28 +0530
Message-Id: <1631860648-31774-1-git-send-email-rnayak@codeaurora.org>
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

The support exists on most recent qcom SoCs, and we add support
for sm8150/sm8250/sm8350 and sc7280 as part of this patch.

Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
[rnayak: rewrite commit log, minor rebase]
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c    | 4 ++++
 drivers/pinctrl/qcom/pinctrl-msm.h    | 2 ++
 drivers/pinctrl/qcom/pinctrl-sc7280.c | 2 ++
 drivers/pinctrl/qcom/pinctrl-sm8150.c | 2 ++
 drivers/pinctrl/qcom/pinctrl-sm8250.c | 2 ++
 drivers/pinctrl/qcom/pinctrl-sm8350.c | 2 ++
 6 files changed, 14 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 8476a8a..f4a2343 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -220,6 +220,10 @@ static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
 	val = msm_readl_ctl(pctrl, g);
 	val &= ~mask;
 	val |= i << g->mux_bit;
+	/* Check if egpio present and enable that feature */
+	if (val & BIT(g->egpio_present))
+		val |= BIT(g->egpio_enable);
+
 	msm_writel_ctl(val, pctrl, g);
 
 	raw_spin_unlock_irqrestore(&pctrl->lock, flags);
diff --git a/drivers/pinctrl/qcom/pinctrl-msm.h b/drivers/pinctrl/qcom/pinctrl-msm.h
index e31a516..3635b31 100644
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
diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280.c b/drivers/pinctrl/qcom/pinctrl-sc7280.c
index afddf6d..607d459 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280.c
@@ -43,6 +43,8 @@
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
+		.egpio_enable = 12,		\
+		.egpio_present = 11,		\
 		.oe_bit = 9,			\
 		.in_bit = 0,			\
 		.out_bit = 1,			\
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8150.c b/drivers/pinctrl/qcom/pinctrl-sm8150.c
index 7359bae..63a625a 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8150.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8150.c
@@ -56,6 +56,8 @@ enum {
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
+		.egpio_enable = 12,		\
+		.egpio_present = 11,		\
 		.oe_bit = 9,			\
 		.in_bit = 0,			\
 		.out_bit = 1,			\
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8250.c b/drivers/pinctrl/qcom/pinctrl-sm8250.c
index af144e7..ad4fd94 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8250.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8250.c
@@ -57,6 +57,8 @@ enum {
 		.mux_bit = 2,				\
 		.pull_bit = 0,				\
 		.drv_bit = 6,				\
+		.egpio_enable = 12,			\
+		.egpio_present = 11,			\
 		.oe_bit = 9,				\
 		.in_bit = 0,				\
 		.out_bit = 1,				\
diff --git a/drivers/pinctrl/qcom/pinctrl-sm8350.c b/drivers/pinctrl/qcom/pinctrl-sm8350.c
index 4d8f863..bb436dc 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8350.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8350.c
@@ -46,6 +46,8 @@
 		.mux_bit = 2,			\
 		.pull_bit = 0,			\
 		.drv_bit = 6,			\
+		.egpio_enable = 12,		\
+		.egpio_present = 11,		\
 		.oe_bit = 9,			\
 		.in_bit = 0,			\
 		.out_bit = 1,			\
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

