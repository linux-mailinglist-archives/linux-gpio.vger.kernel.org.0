Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AFD30DEF1A
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Oct 2019 16:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727322AbfJUOPe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 21 Oct 2019 10:15:34 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:37874 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727152AbfJUOPe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Oct 2019 10:15:34 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 0B32560240; Mon, 21 Oct 2019 14:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571667332;
        bh=B9vcv3+VSGqLWBSxMU1TfHAiv6/ddsGG24vM268m8wg=;
        h=From:To:Cc:Subject:Date:From;
        b=Z90NS+kTtHCnZ2Q2bZYw0EkTdXC50ALMTfNYxjZfREFCtMf+FFkLYa+Rtr3wGFez4
         RlysUX8nQgLd2EKtSTEjZ1LHhmTQcRpsb2XfGOSrPbRlPSztJ2BwqvFC/rqT5ZwI66
         RGZ5zsNh5DTKp5DDs1SPJnlJ21WiS807T1Io5cbE=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B51EB60240;
        Mon, 21 Oct 2019 14:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1571667330;
        bh=B9vcv3+VSGqLWBSxMU1TfHAiv6/ddsGG24vM268m8wg=;
        h=From:To:Cc:Subject:Date:From;
        b=cJ2LqN+LdDigNzRphKJHpNfW4D/Y1SD2RxbE71JvtR5TeFBloxtZRsMvh8ArNweaI
         4qhVjiYjXOohb4NwmoWed6UW/BGn9rRj9tEz9HQf7lxanytMEUoCMHbrFF/xTZtuCO
         EefA/gjG1zq6CDbUYEZ3Vdb4aTg3TkMlAZxlFD5k=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B51EB60240
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     linus.walleij@linaro.org, bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Subject: [PATCH] pinctrl: qcom: sc7180: Add missing tile info in SDC_QDSD_PINGROUP/UFS_RESET
Date:   Mon, 21 Oct 2019 19:45:07 +0530
Message-Id: <20191021141507.24066-1-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The SDC_QDSD_PINGROUP/UFS_RESET macros are missing the .tile info needed to
calculate the right register offsets. Adding them here and also
adjusting the offsets accordingly.

Fixes: f2ae04c45b1a ("pinctrl: qcom: Add SC7180 pinctrl driver")

Reported-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-sc7180.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sc7180.c b/drivers/pinctrl/qcom/pinctrl-sc7180.c
index 6399c8a2bc22..d6cfad7417b1 100644
--- a/drivers/pinctrl/qcom/pinctrl-sc7180.c
+++ b/drivers/pinctrl/qcom/pinctrl-sc7180.c
@@ -77,6 +77,7 @@ enum {
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
 		.intr_target_reg = 0,			\
+		.tile = SOUTH,				\
 		.mux_bit = -1,				\
 		.pull_bit = pull,			\
 		.drv_bit = drv,				\
@@ -102,6 +103,7 @@ enum {
 		.intr_cfg_reg = 0,			\
 		.intr_status_reg = 0,			\
 		.intr_target_reg = 0,			\
+		.tile = SOUTH,				\
 		.mux_bit = -1,				\
 		.pull_bit = 3,				\
 		.drv_bit = 0,				\
@@ -1087,14 +1089,14 @@ static const struct msm_pingroup sc7180_groups[] = {
 	[116] = PINGROUP(116, WEST, qup04, qup04, _, _, _, _, _, _, _),
 	[117] = PINGROUP(117, WEST, dp_hot, _, _, _, _, _, _, _, _),
 	[118] = PINGROUP(118, WEST, _, _, _, _, _, _, _, _, _),
-	[119] = UFS_RESET(ufs_reset, 0x97f000),
-	[120] = SDC_QDSD_PINGROUP(sdc1_rclk, 0x97a000, 15, 0),
-	[121] = SDC_QDSD_PINGROUP(sdc1_clk, 0x97a000, 13, 6),
-	[122] = SDC_QDSD_PINGROUP(sdc1_cmd, 0x97a000, 11, 3),
-	[123] = SDC_QDSD_PINGROUP(sdc1_data, 0x97a000, 9, 0),
-	[124] = SDC_QDSD_PINGROUP(sdc2_clk, 0x97b000, 14, 6),
-	[125] = SDC_QDSD_PINGROUP(sdc2_cmd, 0x97b000, 11, 3),
-	[126] = SDC_QDSD_PINGROUP(sdc2_data, 0x97b000, 9, 0),
+	[119] = UFS_RESET(ufs_reset, 0x7f000),
+	[120] = SDC_QDSD_PINGROUP(sdc1_rclk, 0x7a000, 15, 0),
+	[121] = SDC_QDSD_PINGROUP(sdc1_clk, 0x7a000, 13, 6),
+	[122] = SDC_QDSD_PINGROUP(sdc1_cmd, 0x7a000, 11, 3),
+	[123] = SDC_QDSD_PINGROUP(sdc1_data, 0x7a000, 9, 0),
+	[124] = SDC_QDSD_PINGROUP(sdc2_clk, 0x7b000, 14, 6),
+	[125] = SDC_QDSD_PINGROUP(sdc2_cmd, 0x7b000, 11, 3),
+	[126] = SDC_QDSD_PINGROUP(sdc2_data, 0x7b000, 9, 0),
 };
 
 static const struct msm_pinctrl_soc_data sc7180_pinctrl = {
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

