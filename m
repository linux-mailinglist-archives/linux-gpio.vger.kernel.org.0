Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB71032E231
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Mar 2021 07:30:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229616AbhCEGar (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Mar 2021 01:30:47 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:14893 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229608AbhCEGaq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 5 Mar 2021 01:30:46 -0500
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 04 Mar 2021 22:30:46 -0800
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 04 Mar 2021 22:30:45 -0800
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg01-blr.qualcomm.com with ESMTP; 05 Mar 2021 12:00:20 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 9B5523C33; Fri,  5 Mar 2021 12:00:18 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     kgunda@codeaurora.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, satya priya <skakit@codeaurora.org>
Subject: [PATCH 3/3] dt-bindings: pinctrl: qcom-pmic-gpio: Add pmic gpio support
Date:   Fri,  5 Mar 2021 11:59:59 +0530
Message-Id: <1614925799-3172-4-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614925799-3172-1-git-send-email-skakit@codeaurora.org>
References: <1614925799-3172-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add compatibles for PM7325, PM8350C, PMK8350 and PMR735A GPIO support to the
Qualcomm technologies Inc PMIC GPIO binding.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index fc787aa..37a4333 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -40,6 +40,10 @@ properties:
           - qcom,pm6150-gpio
           - qcom,pm6150l-gpio
           - qcom,pmx55-gpio
+          - qcom,pm7325-gpio
+          - qcom,pm8350c-gpio
+          - qcom,pmk8350-gpio
+          - qcom,pmr735a-gpio
 
       - enum:
           - qcom,spmi-gpio
@@ -102,6 +106,10 @@ properties:
                      - gpio1-gpio12 for pm8150l (hole on gpio7)
                      - gpio1-gpio10 for pm6150
                      - gpio1-gpio12 for pm6150l
+                     - gpio1-gpio10 for pm7325
+                     - gpio1-gpio9 for pm8350c
+                     - gpio1-gpio4 for pmk8350
+                     - gpio1-gpio4 for pmr735a
 
             $ref: /schemas/types.yaml#/definitions/string-array
             items:
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

