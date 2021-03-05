Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 550EB32E236
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Mar 2021 07:31:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbhCEGas (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Mar 2021 01:30:48 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:46954 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229615AbhCEGar (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Mar 2021 01:30:47 -0500
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 04 Mar 2021 22:30:47 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 04 Mar 2021 22:30:44 -0800
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg01-blr.qualcomm.com with ESMTP; 05 Mar 2021 12:00:18 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 10B223C33; Fri,  5 Mar 2021 12:00:17 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     kgunda@codeaurora.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, satya priya <skakit@codeaurora.org>
Subject: [PATCH 1/3] pinctrl: qcom: spmi-gpio: Add support for four variants
Date:   Fri,  5 Mar 2021 11:59:57 +0530
Message-Id: <1614925799-3172-2-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614925799-3172-1-git-send-email-skakit@codeaurora.org>
References: <1614925799-3172-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add PM7325, PM8350c, PMK8350 and PMR735A compatibles for GPIO
support.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 9801c71..90f4f78 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1131,6 +1131,10 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pm6150l-gpio", .data = (void *) 12 },
 	/* pmx55 has 11 GPIOs with holes on 3, 7, 10, 11 */
 	{ .compatible = "qcom,pmx55-gpio", .data = (void *) 11 },
+	{ .compatible = "qcom,pm7325-gpio", .data = (void *) 10 },
+	{ .compatible = "qcom,pm8350c-gpio", .data = (void *) 9 },
+	{ .compatible = "qcom,pmk8350-gpio", .data = (void *) 4 },
+	{ .compatible = "qcom,pmr735a-gpio", .data = (void *) 4 },
 	{ },
 };
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

