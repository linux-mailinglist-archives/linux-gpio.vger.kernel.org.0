Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1EE17319967
	for <lists+linux-gpio@lfdr.de>; Fri, 12 Feb 2021 06:01:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229499AbhBLFBQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 12 Feb 2021 00:01:16 -0500
Received: from so15.mailgun.net ([198.61.254.15]:28162 "EHLO so15.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229450AbhBLFBH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 12 Feb 2021 00:01:07 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613106036; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=TeOP1sX3sE49jC/4ISLDzgsH1ouPFQt5neym8SKA4zE=; b=O47hr9xoZ5YJfJ2WLGdKyj+O9SrmtOu8mg1haTsHHWpoCx00cepN8gJba7LYYbBJ2nyoYXZ7
 oBWqSjL5sN6rWfVAcOAVqo2aihsKbL8pvIGFr8OJTlihicaY4CsCqSpykZJEtRRXQYd3WeTj
 QTtEg1J2xuNjKgo0gCLhrChB22E=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 60260b503919dfb4551997da (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 12 Feb 2021 05:00:00
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id F39A3C43462; Fri, 12 Feb 2021 04:59:59 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A9C2CC433C6;
        Fri, 12 Feb 2021 04:59:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A9C2CC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, Maulik Shah <mkshah@codeaurora.org>,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH] pinctrl: qcom: sc7280: Add GPIO wakeup interrupt map
Date:   Fri, 12 Feb 2021 10:29:34 +0530
Message-Id: <1613105974-28181-1-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Maulik Shah <mkshah@codeaurora.org>

GPIOs that can be configured as wakeup sources, have their
interrupt lines routed to PDC interrupt controller.

Provide the interrupt map of the GPIO to its wakeup capable
interrupt parent.

Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-sc7280.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280.c b/drivers/pinctrl/qcom/pinctrl-sc7280.c
index 8daccd5..99c416e 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7280.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7280.c
@@ -1449,6 +1449,28 @@ static const struct msm_pingroup sc7280_groups[] = {
 	[182] = SDC_QDSD_PINGROUP(sdc2_data, 0x1b4000, 9, 0),
 };
 
+static const struct msm_gpio_wakeirq_map sc7280_pdc_map[] = {
+	{ 0, 134 }, { 3, 131 }, { 4, 121 }, { 7, 103 }, { 8, 155 },
+	{ 11, 93 }, { 12, 78 }, { 15, 79 }, { 16, 80 }, { 18, 81 },
+	{ 19, 107 }, { 20, 82 }, { 21, 83 }, { 23, 99 }, { 24, 86 },
+	{ 25, 95 }, { 27, 158 }, { 28, 159 }, { 31, 90 }, { 32, 144 },
+	{ 34, 77 }, { 35, 92 }, { 36, 157 }, { 39, 73 }, { 40, 97 },
+	{ 41, 98 }, { 43, 85 }, { 44, 100 }, { 45, 101 }, { 47, 102 },
+	{ 48, 74 }, { 51, 112 }, { 52, 156 }, { 54, 117 }, { 55, 84 },
+	{ 56, 108 }, { 59, 110 }, { 60, 111 }, { 61, 123 }, { 63, 104 },
+	{ 68, 127 }, { 72, 150 }, { 75, 133 }, { 77, 125 }, { 78, 105 },
+	{ 79, 106 }, { 80, 118 }, { 81, 119 }, { 82, 162 }, { 83, 122 },
+	{ 86, 75 }, { 88, 154 }, { 89, 124 }, { 90, 149 }, { 91, 76 },
+	{ 93, 128 }, { 95, 160 }, { 101, 126 }, { 102, 96 }, { 103, 116 },
+	{ 104, 114 }, { 112, 72 }, { 116, 135 }, { 117, 163 }, { 119, 137 },
+	{ 121, 138 }, { 123, 139 }, { 125, 140 }, { 127, 141 }, { 128, 165 },
+	{ 129, 143 }, { 130, 94 }, { 131, 145 }, { 133, 146 }, { 136, 147 },
+	{ 140, 148 }, { 141, 115 }, { 142, 113 }, { 145, 130 }, { 148, 132 },
+	{ 150, 87 }, { 151, 88 }, { 153, 89 }, { 155, 164 }, { 156, 129 },
+	{ 157, 161 }, { 158, 120 }, { 161, 136 }, { 163, 142 }, { 172, 166 },
+	{ 174, 167 },
+};
+
 static const struct msm_pinctrl_soc_data sc7280_pinctrl = {
 	.pins = sc7280_pins,
 	.npins = ARRAY_SIZE(sc7280_pins),
@@ -1457,6 +1479,8 @@ static const struct msm_pinctrl_soc_data sc7280_pinctrl = {
 	.groups = sc7280_groups,
 	.ngroups = ARRAY_SIZE(sc7280_groups),
 	.ngpios = 176,
+	.wakeirq_map = sc7280_pdc_map,
+	.nwakeirq_map = ARRAY_SIZE(sc7280_pdc_map),
 };
 
 static int sc7280_pinctrl_probe(struct platform_device *pdev)
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

