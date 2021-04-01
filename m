Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD2D3351D0E
	for <lists+linux-gpio@lfdr.de>; Thu,  1 Apr 2021 20:48:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237847AbhDASXk (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 1 Apr 2021 14:23:40 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:34157 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237665AbhDASTt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Apr 2021 14:19:49 -0400
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 01 Apr 2021 05:36:19 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 01 Apr 2021 05:36:17 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg01-blr.qualcomm.com with ESMTP; 01 Apr 2021 18:05:49 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 1C9104A49; Thu,  1 Apr 2021 18:05:48 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     kgunda@codeaurora.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, satya priya <skakit@codeaurora.org>
Subject: [PATCH V2 2/3] dt-bindings: pinctrl: qcom-pmic-gpio: Update the binding to add four new variants
Date:   Thu,  1 Apr 2021 18:05:44 +0530
Message-Id: <1617280546-9583-3-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1617280546-9583-1-git-send-email-skakit@codeaurora.org>
References: <1617280546-9583-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Update the binding to add PM7325, PM8350C, PMK8350 and PMR735A GPIO support.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
Changes in V2:
 - Placed this patch before conversion patch and updated commit text
   to be more clear.

 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
index 7648ab0..da7c35e 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
@@ -30,6 +30,10 @@ PMIC's from Qualcomm.
 		    "qcom,pm6150-gpio"
 		    "qcom,pm6150l-gpio"
 		    "qcom,pmx55-gpio"
+		    "qcom,pm7325-gpio"
+		    "qcom,pm8350c-gpio"
+		    "qcom,pmk8350-gpio"
+		    "qcom,pmr735a-gpio"
 
 		    And must contain either "qcom,spmi-gpio" or "qcom,ssbi-gpio"
 		    if the device is on an spmi bus or an ssbi bus respectively
@@ -113,6 +117,10 @@ to specify in a pin configuration subnode:
 		    gpio1-gpio12 for pm6150l
 		    gpio1-gpio11 for pmx55 (holes on gpio3, gpio7, gpio10
 					    and gpio11)
+		    gpio1-gpio10 for pm7325
+		    gpio1-gpio9 for pm8350c
+		    gpio1-gpio4 for pmk8350
+		    gpio1-gpio4 for pmr735a
 
 - function:
 	Usage: required
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

