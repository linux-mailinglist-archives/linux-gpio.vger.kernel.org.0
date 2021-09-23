Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8BB1415AFA
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Sep 2021 11:31:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240033AbhIWJdP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Sep 2021 05:33:15 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:28501 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240164AbhIWJdP (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 23 Sep 2021 05:33:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632389504; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=HUjX19DF/7HCrz+wEr0zp2J5Mmr+3WVnjRWsuaUlPGM=; b=CO5sI5qFiWspvZfEiDArkahSLJAgNlE0REEod4Vpe3A0/mSIAVWK/Qq+MlZ22PSmD2MLh9KD
 imRIsmq0Jr+nUehgUOlr8rq69B84jvpxdKt7eujPBUyEOaQRNM3LlNXqoRN2YOZ273oJF5e1
 2iDYEZDu5O5FsZiJHtTvLpeLitI=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 614c497ebd6681d8ed829b44 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 23 Sep 2021 09:31:42
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C5B5DC4360C; Thu, 23 Sep 2021 09:31:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        SORTED_RECIPS,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EE825C4338F;
        Thu, 23 Sep 2021 09:31:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org EE825C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2] pinctrl: qcom: sc7280: Add PM suspend callbacks
Date:   Thu, 23 Sep 2021 15:01:27 +0530
Message-Id: <1632389487-11283-1-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use PM suspend callbacks from msm core, without this the hog_sleep
pins don't change state in suspend.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
v2: removed some stale diffstat

 drivers/pinctrl/qcom/pinctrl-sc7280.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280.c b/drivers/pinctrl/qcom/pinctrl-sc7280.c
index 607d459..1cbf2cc 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280.c
@@ -1498,6 +1498,7 @@ static const struct of_device_id sc7280_pinctrl_of_match[] = {
 static struct platform_driver sc7280_pinctrl_driver = {
 	.driver = {
 		.name = "sc7280-pinctrl",
+		.pm = &msm_pinctrl_dev_pm_ops,
 		.of_match_table = sc7280_pinctrl_of_match,
 	},
 	.probe = sc7280_pinctrl_probe,
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

