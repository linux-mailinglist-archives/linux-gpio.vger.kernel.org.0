Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5340CE96FC
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Oct 2019 08:07:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbfJ3HHL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Oct 2019 03:07:11 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:43784 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726940AbfJ3HHL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Oct 2019 03:07:11 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 76F8C60F35; Wed, 30 Oct 2019 07:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572419230;
        bh=+8+gAw6pWQHafrFEhVLd4k99qT3R0/1ofa+ZNEqS4K4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=e12MV4GTklT7PEWfDdzH78s1KQSpLWygPABJa69sl5GqBkm+wEPrsw6sr8tiG/Gk6
         3aFopjYcPhXnVdMSHqmKbiassi3OqvT6uKHR/zVKBGu1a2Bjfwy4OL7hhILV5o6ECa
         gfQc/GOyHXa14Zqt+cCLmPTrV3Jc6HKovr3ulCSo=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from mkshah-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 61F9360E41;
        Wed, 30 Oct 2019 07:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572419230;
        bh=+8+gAw6pWQHafrFEhVLd4k99qT3R0/1ofa+ZNEqS4K4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=e12MV4GTklT7PEWfDdzH78s1KQSpLWygPABJa69sl5GqBkm+wEPrsw6sr8tiG/Gk6
         3aFopjYcPhXnVdMSHqmKbiassi3OqvT6uKHR/zVKBGu1a2Bjfwy4OL7hhILV5o6ECa
         gfQc/GOyHXa14Zqt+cCLmPTrV3Jc6HKovr3ulCSo=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 61F9360E41
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
To:     agross@kernel.org, robh+dt@kernel.org, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org, mka@chromium.org,
        swboyd@chromium.org, evgreen@chromium.org, dianders@chromium.org,
        Maulik Shah <mkshah@codeaurora.org>
Subject: [PATCH 1/2] pinctrl: qcom: sc7180: Add GPIO wakeup interrupt map
Date:   Wed, 30 Oct 2019 12:36:17 +0530
Message-Id: <1572419178-5750-2-git-send-email-mkshah@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572419178-5750-1-git-send-email-mkshah@codeaurora.org>
References: <1572419178-5750-1-git-send-email-mkshah@codeaurora.org>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

GPIOs that can be configured as wakeup sources, have their
interrupt lines routed to PDC interrupt controller.

Provide the interrupt map of the GPIO to its wakeup capable
interrupt parent.

Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-sc7180.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-sc7180.c b/drivers/pinctrl/qcom/pinctrl-sc7180.c
index 6399c8a..8a2b97c 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7180.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7180.c
@@ -1097,6 +1097,22 @@ static const struct msm_pingroup sc7180_groups[] = {
 	[126] = SDC_QDSD_PINGROUP(sdc2_data, 0x97b000, 9, 0),
 };
 
+static const struct msm_gpio_wakeirq_map sc7180_pdc_map[] = {
+	{0, 40}, {3, 50}, {4, 42}, {5, 70}, {6, 41}, {9, 35},
+	{10, 80}, {11, 51}, {16, 20}, {21, 55}, {22, 90}, {23, 21},
+	{24, 61}, {26, 52}, {28, 36}, {30, 100}, {31, 33}, {32, 81},
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
 static const struct msm_pinctrl_soc_data sc7180_pinctrl = {
 	.pins = sc7180_pins,
 	.npins = ARRAY_SIZE(sc7180_pins),
@@ -1107,6 +1123,8 @@ static const struct msm_pinctrl_soc_data sc7180_pinctrl = {
 	.ngpios = 120,
 	.tiles = sc7180_tiles,
 	.ntiles = ARRAY_SIZE(sc7180_tiles),
+	.wakeirq_map = sc7180_pdc_map,
+	.nwakeirq_map = ARRAY_SIZE(sc7180_pdc_map),
 };
 
 static int sc7180_pinctrl_probe(struct platform_device *pdev)
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

