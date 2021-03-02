Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAA0632ACDF
	for <lists+linux-gpio@lfdr.de>; Wed,  3 Mar 2021 03:09:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383720AbhCBVRS (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 2 Mar 2021 16:17:18 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:30578 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1576939AbhCBFfM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 2 Mar 2021 00:35:12 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614663286; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=qrnccJJtl6xl/gjlaFUu+QbAU2qldweGFvJZ9NL5wsk=; b=GVQj28u9XO9Sq3fcqXEUp0E7aILOOEyuHJlSZW6w6BalNUscbRjgnXIy5HJwt3GUMxz4GoND
 cYCqrHDGUr+VjBsKZeNT8RMM9gS1Nmv9irUlcsazWLn0BjBy56UdofyvkXtEdf7uexb7hXjd
 osDsW+aEjCZiFxBmqDtFNsMmcJE=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 603dcb8a1d4da3b75dcc864b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 02 Mar 2021 05:22:18
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0A5A6C43462; Tue,  2 Mar 2021 05:22:18 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3C364C43461;
        Tue,  2 Mar 2021 05:22:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3C364C43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH 2/2] pinctrl: qcom: sc7280: Fix SDC1_RCLK configurations
Date:   Tue,  2 Mar 2021 10:51:51 +0530
Message-Id: <1614662511-26519-2-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614662511-26519-1-git-send-email-rnayak@codeaurora.org>
References: <1614662511-26519-1-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Fix SDC1_RCLK configurations which are in a different register so fix the
offset from 0xb3000 to 0xb3004.

Fixes: ecb454594c43: ("pinctrl: qcom: Add sc7280 pinctrl driver")

Reported-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-sc7280.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280.c b/drivers/pinctrl/qcom/pinctrl-sc7280.c
index 49c4347..9d41abf 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280.c
@@ -1440,7 +1440,7 @@ static const struct msm_pingroup sc7280_groups[] = {
 	[173] = PINGROUP(173, qdss, _, _, _, _, _, _, _, _),
 	[174] = PINGROUP(174, qdss, _, _, _, _, _, _, _, _),
 	[175] = UFS_RESET(ufs_reset, 0xbe000),
-	[176] = SDC_QDSD_PINGROUP(sdc1_rclk, 0xb3000, 15, 0),
+	[176] = SDC_QDSD_PINGROUP(sdc1_rclk, 0xb3004, 0, 6),
 	[177] = SDC_QDSD_PINGROUP(sdc1_clk, 0xb3000, 13, 6),
 	[178] = SDC_QDSD_PINGROUP(sdc1_cmd, 0xb3000, 11, 3),
 	[179] = SDC_QDSD_PINGROUP(sdc1_data, 0xb3000, 9, 0),
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

