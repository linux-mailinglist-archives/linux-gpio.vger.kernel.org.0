Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 333F021357D
	for <lists+linux-gpio@lfdr.de>; Fri,  3 Jul 2020 09:49:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725764AbgGCHtI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 3 Jul 2020 03:49:08 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:49173 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725960AbgGCHtH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Jul 2020 03:49:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593762547; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=F8C4p45eDeF3kiFralAK4R76DZV1JAilKVV14GqSHNI=; b=UHsZnHy0bZfHTSvhAnfZ2P4iV2sNSUPAzp2SMlbqiqyJ9et4S48za1Fw4POFL/6ss+dFm6o2
 lMBoIOe83xQ3NWn8YAAUbFGbi6iDCdyX0CIqbNMyQgtvM5+d/WSZr2vA5tpPz7HQE8Glp+Gx
 rQ4Sxtx9N6h+7oZqr6Db21N/scU=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n12.prod.us-west-2.postgun.com with SMTP id
 5efee2e6117610c7ff3e9ec0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 03 Jul 2020 07:48:54
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8F366C433CB; Fri,  3 Jul 2020 07:48:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6199CC433CA;
        Fri,  3 Jul 2020 07:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6199CC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        agross@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, mkshah@codeaurora.org,
        ilina@codeaurora.org, Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2] pinctrl: qcom: sc7180: Make gpio28 non wakeup capable for google,lazor
Date:   Fri,  3 Jul 2020 13:18:26 +0530
Message-Id: <1593762506-32680-1-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The PDC irqchip driver currently does not handle dual-edge interrupts,
and we have google,lazor board with sc7180 designed to configure gpio28
as a dual-edge interrupt. This interrupt is however not expected to be
wakeup capable on this board, so an easy way to fix this, seems to be to
make this gpio non wakeup capable and let TLMM handle it (which is capable
of handling dual-edge irqs)

To be able to do so only on this board, so other boards designed with
this SoC can continue to use gpio28 as a wakeup capable one, make a
copy of msm_gpio_wakeirq_map for lazor and remove gpio28 from the
list.

Reported-by: Jimmy Cheng-Yi Chiang <cychiang@google.com>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-sc7180.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sc7180.c b/drivers/pinctrl/qcom/pinctrl-sc7180.c
index 1b6465a..0668933 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7180.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7180.c
@@ -1135,7 +1135,24 @@ static const struct msm_gpio_wakeirq_map sc7180_pdc_map[] = {
 	{117, 114}, {118, 119},
 };
 
-static const struct msm_pinctrl_soc_data sc7180_pinctrl = {
+/* Dropped gpio28 from the map for the google,lazor board */
+static const struct msm_gpio_wakeirq_map sc7180_lazor_pdc_map[] = {
+	{0, 40}, {3, 50}, {4, 42}, {5, 70}, {6, 41}, {9, 35},
+	{10, 80}, {11, 51}, {16, 20}, {21, 55}, {22, 90}, {23, 21},
+	{24, 61}, {26, 52}, {30, 100}, {31, 33}, {32, 81},
+	{33, 62}, {34, 43}, {36, 91}, {37, 53}, {38, 63}, {39, 72},
+	{41, 101}, {42, 7}, {43, 34}, {45, 73}, {47, 82}, {49, 17},
+	{52, 109}, {53, 102}, {55, 92}, {56, 56}, {57, 57}, {58, 83},
+	{59, 37}, {62, 110}, {63, 111}, {64, 74}, {65, 44}, {66, 93},
+	{67, 58}, {68, 112}, {69, 32}, {70, 54}, {72, 59}, {73, 64},
+	{74, 71}, {78, 31}, {82, 30}, {85, 103}, {86, 38}, {87, 39},
+	{88, 45}, {89, 46}, {90, 47}, {91, 48}, {92, 60}, {93, 49},
+	{94, 84}, {95, 94}, {98, 65}, {101, 66}, {104, 67}, {109, 104},
+	{110, 68}, {113, 69}, {114, 113}, {115, 108}, {116, 121},
+	{117, 114}, {118, 119},
+};
+
+static struct msm_pinctrl_soc_data sc7180_pinctrl = {
 	.pins = sc7180_pins,
 	.npins = ARRAY_SIZE(sc7180_pins),
 	.functions = sc7180_functions,
@@ -1151,6 +1168,10 @@ static const struct msm_pinctrl_soc_data sc7180_pinctrl = {
 
 static int sc7180_pinctrl_probe(struct platform_device *pdev)
 {
+	if (of_machine_is_compatible("google,lazor")) {
+		sc7180_pinctrl.wakeirq_map = sc7180_lazor_pdc_map;
+		sc7180_pinctrl.nwakeirq_map = ARRAY_SIZE(sc7180_lazor_pdc_map);
+	}
 	return msm_pinctrl_probe(pdev, &sc7180_pinctrl);
 }
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

