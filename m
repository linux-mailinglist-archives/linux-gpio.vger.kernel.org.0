Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFFC21F170A
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Jun 2020 12:55:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729423AbgFHKzt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Jun 2020 06:55:49 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:7636 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726202AbgFHKzt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 8 Jun 2020 06:55:49 -0400
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 08 Jun 2020 03:55:49 -0700
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
  by ironmsg04-sd.qualcomm.com with ESMTP; 08 Jun 2020 03:55:46 -0700
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
        id 590C021761; Mon,  8 Jun 2020 16:25:44 +0530 (IST)
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        linus.walleij@linaro.org, speriaka@codeaurora.org,
        sricharan@codeaurora.org, arajkuma@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Subject: [PATCH] pinctrl: qcom: ipq6018 Add missing pins in qpic pin group
Date:   Mon,  8 Jun 2020 16:25:42 +0530
Message-Id: <1591613742-1768-1-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The patch adds missing qpic data pins to qpic pingroup. These pins are
necessary for the qpic nand to work.

Fixes: ef1ea54 (pinctrl: qcom: Add ipq6018 pinctrl driver)
Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-ipq6018.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-ipq6018.c b/drivers/pinctrl/qcom/pinctrl-ipq6018.c
index 38c33a7..ec50a3b 100644
--- a/drivers/pinctrl/qcom/pinctrl-ipq6018.c
+++ b/drivers/pinctrl/qcom/pinctrl-ipq6018.c
@@ -367,7 +367,8 @@ static const char * const wci20_groups[] = {
 
 static const char * const qpic_pad_groups[] = {
 	"gpio0", "gpio1", "gpio2", "gpio3", "gpio4", "gpio9", "gpio10",
-	"gpio11", "gpio17",
+	"gpio11", "gpio17", "gpio15", "gpio12", "gpio13", "gpio14", "gpio5",
+	"gpio6", "gpio7", "gpio8",
 };
 
 static const char * const burn0_groups[] = {
-- 
2.7.4

