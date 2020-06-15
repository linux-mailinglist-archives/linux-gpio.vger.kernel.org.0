Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2940E1F96D1
	for <lists+linux-gpio@lfdr.de>; Mon, 15 Jun 2020 14:42:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728510AbgFOMmi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 15 Jun 2020 08:42:38 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:34047 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728598AbgFOMmh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 15 Jun 2020 08:42:37 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592224957; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=IcH9ie83cqyX2wRpW4LqU8OPLSE6vdIbgqFcdhJpvVk=; b=Vtmh27kxxkMudRBZRg6V18da12WELIPA/FzwQSQLIvVcHq3RJCuHw6J4ZJ53cGKUFpu3yz2s
 FQt5RchEfxl9QGADD3HPTOzULnwqw2//QgKqJmXFkOWYpbuAJacpWKEroaO9Ff/rQN9AMZ59
 2g2XghiZ+wHuF9aAFX1gghjI5sQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5ee76cb2567385e8e76d0812 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 15 Jun 2020 12:42:26
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4D7E5C433CA; Mon, 15 Jun 2020 12:42:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0B53DC433C8;
        Mon, 15 Jun 2020 12:42:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0B53DC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        linus.walleij@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, mkshah@codeaurora.org,
        ilina@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH] pinctrl: qcom: sc7180: Make gpio28 non wakeup capable
Date:   Mon, 15 Jun 2020 18:12:07 +0530
Message-Id: <1592224927-28576-1-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The PDC irqchip driver currently does not handle dual-edge interrupts,
and we have atleast one board with sc7180 designed to configure gpio28
as a dual-edge interrupt. This interrupt is however not expected to be
wakeup capable, so an easy way to fix this, seems to be to make this
gpio non wakeup capable and let TLMM handle it.

It would have been nice to be able to do this only for the particular
board with this design, however this change of removing gpio28 from the
pinctrl SoC file means we end up with one less wakeup capable gpio for
the entire SoC.

Reported-by: Jimmy Cheng-Yi Chiang <cychiang@google.com>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-sc7180.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sc7180.c b/drivers/pinctrl/qcom/pinctrl-sc7180.c
index 1b6465a..3afcc01 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7180.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7180.c
@@ -1122,7 +1122,7 @@ static const struct msm_pingroup sc7180_groups[] = {
 static const struct msm_gpio_wakeirq_map sc7180_pdc_map[] = {
 	{0, 40}, {3, 50}, {4, 42}, {5, 70}, {6, 41}, {9, 35},
 	{10, 80}, {11, 51}, {16, 20}, {21, 55}, {22, 90}, {23, 21},
-	{24, 61}, {26, 52}, {28, 36}, {30, 100}, {31, 33}, {32, 81},
+	{24, 61}, {26, 52}, {30, 100}, {31, 33}, {32, 81},
 	{33, 62}, {34, 43}, {36, 91}, {37, 53}, {38, 63}, {39, 72},
 	{41, 101}, {42, 7}, {43, 34}, {45, 73}, {47, 82}, {49, 17},
 	{52, 109}, {53, 102}, {55, 92}, {56, 56}, {57, 57}, {58, 83},
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

