Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC1F415AE9
	for <lists+linux-gpio@lfdr.de>; Thu, 23 Sep 2021 11:26:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240129AbhIWJ2I (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 23 Sep 2021 05:28:08 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:50638 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240088AbhIWJ2I (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 23 Sep 2021 05:28:08 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632389197; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=9lAWu7qXiRa6Lg9nIaX5b3wiRkjVA3UvWRrWVenAW08=; b=ST0ZKD64JRTcaPod41vSeG1/aUdW3O8/z+m1RKbjmjJewFHeatx1LD2Vaww/2fhRhQlDWJIi
 t4m80xtIzdh/oNfVplcx7/OVtcnIo5qhDSL4U0Xt9JVrcTahp+Mf+ZVyXWEyj4s61jIRvteQ
 MX3WD0wZhJe311NJvWh2zEGRvBE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 614c484cec62f57c9a0c65e2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 23 Sep 2021 09:26:36
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B9093C43616; Thu, 23 Sep 2021 09:26:35 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E6C82C43460;
        Thu, 23 Sep 2021 09:26:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org E6C82C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH] pinctrl: qcom: sc7280: Add PM suspend callbacks
Date:   Thu, 23 Sep 2021 14:56:16 +0530
Message-Id: <1632389176-7768-1-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use PM suspend callbacks from msm core, without this the hog_sleep
pins don't change state in suspend.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sc7280-idp2.dts | 6 ++++--
 drivers/char/mem.c                       | 2 +-
 drivers/pinctrl/core.c                   | 9 +++++++--
 drivers/pinctrl/qcom/pinctrl-sc7280.c    | 1 +
 4 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280.c b/drivers/pinctrl/qcom/pinctrl-sc7280.c
index afddf6d..9017ede 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280.c
@@ -1496,6 +1496,7 @@ static const struct of_device_id sc7280_pinctrl_of_match[] = {
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

