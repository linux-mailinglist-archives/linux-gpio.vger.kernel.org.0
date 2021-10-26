Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D1BA143B1FA
	for <lists+linux-gpio@lfdr.de>; Tue, 26 Oct 2021 14:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234211AbhJZMMN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 26 Oct 2021 08:12:13 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:43390 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234106AbhJZMMM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 26 Oct 2021 08:12:12 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1635250189; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Yhu65kOnhRjMskvrTljCHTcbch1sK2G5FCxTmknipIE=; b=UtL4R+BHwLpi8wZ2lJ30xV7mKrVCH9Sw/a/ExX1NYjQNLN1rDaLJvjCrsh7K805XP9EifMpx
 XV2P28HPGN5ntsTleUEXPa4SnOvZnWnE6hHuJYGhybGx+tXtR2WGnyqrFtdP3iAol3lagpcK
 N8SxLwtqXIZ2LCiDPSMf2nPYYVU=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI0ZDgwZiIsICJsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 6177f00467f107c611639e98 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 26 Oct 2021 12:09:40
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7852DC43460; Tue, 26 Oct 2021 12:09:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 166ECC4360D;
        Tue, 26 Oct 2021 12:09:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 166ECC4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        linus.walleij@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, psodagud@codeaurora.org,
        dianders@chromium.org, Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2 2/2] pinctrl: qcom: sc7280: Add egpio support
Date:   Tue, 26 Oct 2021 17:37:36 +0530
Message-Id: <1635250056-20274-2-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1635250056-20274-1-git-send-email-rnayak@codeaurora.org>
References: <1635250056-20274-1-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

sc7280 supports the egpio feature, GPIOs ranging from 144 to 174
(31 GPIOs) support it, we define gpio_func to 9, which
is an unused function for all these pins on sc7280.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-sc7280.c | 75 ++++++++++++++++++++---------------
 1 file changed, 44 insertions(+), 31 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sc7280.c b/drivers/pinctrl/qcom/pinctrl-sc7280.c
index 9017ede..31df55c 100644
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
@@ -520,6 +522,7 @@ enum sc7280_functions {
 	msm_mux_dp_lcd,
 	msm_mux_edp_hot,
 	msm_mux_edp_lcd,
+	msm_mux_egpio,
 	msm_mux_gcc_gp1,
 	msm_mux_gcc_gp2,
 	msm_mux_gcc_gp3,
@@ -658,6 +661,14 @@ static const char * const gpio_groups[] = {
 	"gpio165", "gpio166", "gpio167", "gpio168", "gpio169", "gpio170",
 	"gpio171", "gpio172", "gpio173", "gpio174",
 };
+static const char * const egpio_groups[] = {
+	"gpio144", "gpio145", "gpio146", "gpio147", "gpio148", "gpio149",
+	"gpio150", "gpio151", "gpio152", "gpio153", "gpio154", "gpio155",
+	"gpio156", "gpio157", "gpio158", "gpio159", "gpio160", "gpio161",
+	"gpio162", "gpio163", "gpio164", "gpio165", "gpio166", "gpio167",
+	"gpio168", "gpio169", "gpio170", "gpio171", "gpio172", "gpio173",
+	"gpio174",
+};
 static const char * const atest_char_groups[] = {
 	"gpio81",
 };
@@ -1150,6 +1161,7 @@ static const struct msm_function sc7280_functions[] = {
 	FUNCTION(dp_lcd),
 	FUNCTION(edp_hot),
 	FUNCTION(edp_lcd),
+	FUNCTION(egpio),
 	FUNCTION(gcc_gp1),
 	FUNCTION(gcc_gp2),
 	FUNCTION(gcc_gp3),
@@ -1408,37 +1420,37 @@ static const struct msm_pingroup sc7280_groups[] = {
 	[141] = PINGROUP(141, _, _, _, _, _, _, _, _, _),
 	[142] = PINGROUP(142, _, _, _, _, _, _, _, _, _),
 	[143] = PINGROUP(143, _, _, _, _, _, _, _, _, _),
-	[144] = PINGROUP(144, _, _, _, _, _, _, _, _, _),
-	[145] = PINGROUP(145, _, _, _, _, _, _, _, _, _),
-	[146] = PINGROUP(146, _, _, _, _, _, _, _, _, _),
-	[147] = PINGROUP(147, _, _, _, _, _, _, _, _, _),
-	[148] = PINGROUP(148, _, _, _, _, _, _, _, _, _),
-	[149] = PINGROUP(149, _, _, _, _, _, _, _, _, _),
-	[150] = PINGROUP(150, qdss, _, _, _, _, _, _, _, _),
-	[151] = PINGROUP(151, qdss, _, _, _, _, _, _, _, _),
-	[152] = PINGROUP(152, qdss, _, _, _, _, _, _, _, _),
-	[153] = PINGROUP(153, qdss, _, _, _, _, _, _, _, _),
-	[154] = PINGROUP(154, _, _, _, _, _, _, _, _, _),
-	[155] = PINGROUP(155, _, _, _, _, _, _, _, _, _),
-	[156] = PINGROUP(156, qdss_cti, _, _, _, _, _, _, _, _),
-	[157] = PINGROUP(157, qdss_cti, _, _, _, _, _, _, _, _),
-	[158] = PINGROUP(158, _, _, _, _, _, _, _, _, _),
-	[159] = PINGROUP(159, _, _, _, _, _, _, _, _, _),
-	[160] = PINGROUP(160, _, _, _, _, _, _, _, _, _),
-	[161] = PINGROUP(161, _, _, _, _, _, _, _, _, _),
-	[162] = PINGROUP(162, _, _, _, _, _, _, _, _, _),
-	[163] = PINGROUP(163, _, _, _, _, _, _, _, _, _),
-	[164] = PINGROUP(164, _, _, _, _, _, _, _, _, _),
-	[165] = PINGROUP(165, qdss_cti, _, _, _, _, _, _, _, _),
-	[166] = PINGROUP(166, qdss_cti, _, _, _, _, _, _, _, _),
-	[167] = PINGROUP(167, _, _, _, _, _, _, _, _, _),
-	[168] = PINGROUP(168, _, _, _, _, _, _, _, _, _),
-	[169] = PINGROUP(169, _, _, _, _, _, _, _, _, _),
-	[170] = PINGROUP(170, _, _, _, _, _, _, _, _, _),
-	[171] = PINGROUP(171, qdss, _, _, _, _, _, _, _, _),
-	[172] = PINGROUP(172, qdss, _, _, _, _, _, _, _, _),
-	[173] = PINGROUP(173, qdss, _, _, _, _, _, _, _, _),
-	[174] = PINGROUP(174, qdss, _, _, _, _, _, _, _, _),
+	[144] = PINGROUP(144, _, _, _, _, _, _, _, _, egpio),
+	[145] = PINGROUP(145, _, _, _, _, _, _, _, _, egpio),
+	[146] = PINGROUP(146, _, _, _, _, _, _, _, _, egpio),
+	[147] = PINGROUP(147, _, _, _, _, _, _, _, _, egpio),
+	[148] = PINGROUP(148, _, _, _, _, _, _, _, _, egpio),
+	[149] = PINGROUP(149, _, _, _, _, _, _, _, _, egpio),
+	[150] = PINGROUP(150, qdss, _, _, _, _, _, _, _, egpio),
+	[151] = PINGROUP(151, qdss, _, _, _, _, _, _, _, egpio),
+	[152] = PINGROUP(152, qdss, _, _, _, _, _, _, _, egpio),
+	[153] = PINGROUP(153, qdss, _, _, _, _, _, _, _, egpio),
+	[154] = PINGROUP(154, _, _, _, _, _, _, _, _, egpio),
+	[155] = PINGROUP(155, _, _, _, _, _, _, _, _, egpio),
+	[156] = PINGROUP(156, qdss_cti, _, _, _, _, _, _, _, egpio),
+	[157] = PINGROUP(157, qdss_cti, _, _, _, _, _, _, _, egpio),
+	[158] = PINGROUP(158, _, _, _, _, _, _, _, _, egpio),
+	[159] = PINGROUP(159, _, _, _, _, _, _, _, _, egpio),
+	[160] = PINGROUP(160, _, _, _, _, _, _, _, _, egpio),
+	[161] = PINGROUP(161, _, _, _, _, _, _, _, _, egpio),
+	[162] = PINGROUP(162, _, _, _, _, _, _, _, _, egpio),
+	[163] = PINGROUP(163, _, _, _, _, _, _, _, _, egpio),
+	[164] = PINGROUP(164, _, _, _, _, _, _, _, _, egpio),
+	[165] = PINGROUP(165, qdss_cti, _, _, _, _, _, _, _, egpio),
+	[166] = PINGROUP(166, qdss_cti, _, _, _, _, _, _, _, egpio),
+	[167] = PINGROUP(167, _, _, _, _, _, _, _, _, egpio),
+	[168] = PINGROUP(168, _, _, _, _, _, _, _, _, egpio),
+	[169] = PINGROUP(169, _, _, _, _, _, _, _, _, egpio),
+	[170] = PINGROUP(170, _, _, _, _, _, _, _, _, egpio),
+	[171] = PINGROUP(171, qdss, _, _, _, _, _, _, _, egpio),
+	[172] = PINGROUP(172, qdss, _, _, _, _, _, _, _, egpio),
+	[173] = PINGROUP(173, qdss, _, _, _, _, _, _, _, egpio),
+	[174] = PINGROUP(174, qdss, _, _, _, _, _, _, _, egpio),
 	[175] = UFS_RESET(ufs_reset, 0xbe000),
 	[176] = SDC_QDSD_PINGROUP(sdc1_rclk, 0xb3004, 0, 6),
 	[177] = SDC_QDSD_PINGROUP(sdc1_clk, 0xb3000, 13, 6),
@@ -1481,6 +1493,7 @@ static const struct msm_pinctrl_soc_data sc7280_pinctrl = {
 	.ngpios = 176,
 	.wakeirq_map = sc7280_pdc_map,
 	.nwakeirq_map = ARRAY_SIZE(sc7280_pdc_map),
+	.egpio_func = 9,
 };
 
 static int sc7280_pinctrl_probe(struct platform_device *pdev)
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

