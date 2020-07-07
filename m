Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81EFC2165AF
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Jul 2020 06:58:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727850AbgGGE66 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Jul 2020 00:58:58 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:57587 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726961AbgGGE66 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 7 Jul 2020 00:58:58 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594097937; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=kUhlvX5z1O4iL5BZbmyHLAQK/NkvrRKZF2CvSmXuoOU=; b=J1Jud0KOakjMm0m2W8PeRY4nEObFsF5chXWn2r6fTx+TUH78W05jJMZiOaBnk+INy4V+fmIY
 zqtJE9AJ5KdNPqd+vgV3sexqQYNMOsxnhjE7tw3KZFhqE2vgoeM+Ng+rDdOLXVgoVGl/0q9r
 XJgWl+6/aVFGkRei+0JHNagYtC0=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n12.prod.us-east-1.postgun.com with SMTP id
 5f04010e1daed08ee0ac8aba (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 07 Jul 2020 04:58:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A6049C43391; Tue,  7 Jul 2020 04:58:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from kathirav-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kathirav)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E7F76C433C6;
        Tue,  7 Jul 2020 04:58:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E7F76C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=kathirav@codeaurora.org
From:   Kathiravan T <kathirav@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     sivaprak@codeaurora.org, sricharan@codeaurora.org,
        Kathiravan T <kathirav@codeaurora.org>,
        Rajkumar Ayyasamy <arajkuma@codeaurora.org>
Subject: [PATCH] pinctrl: qcom: ipq8074: route gpio interrupts to APPS
Date:   Tue,  7 Jul 2020 10:28:35 +0530
Message-Id: <1594097915-26725-1-git-send-email-kathirav@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

set target proc as APPS to route the gpio interrupts to APPS

Signed-off-by: Rajkumar Ayyasamy <arajkuma@codeaurora.org>
Signed-off-by: Kathiravan T <kathirav@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-ipq8074.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-ipq8074.c b/drivers/pinctrl/qcom/pinctrl-ipq8074.c
index 0edd41c..aec68b1 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq8074.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq8074.c
@@ -50,6 +50,7 @@
 		.intr_enable_bit = 0,		\
 		.intr_status_bit = 0,		\
 		.intr_target_bit = 5,		\
+		.intr_target_kpss_val = 3,	\
 		.intr_raw_status_bit = 4,	\
 		.intr_polarity_bit = 1,		\
 		.intr_detection_bit = 2,	\
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

