Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC2FF3B7D16
	for <lists+linux-gpio@lfdr.de>; Wed, 30 Jun 2021 07:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232235AbhF3Fx5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 30 Jun 2021 01:53:57 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:25432 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232118AbhF3Fxv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Jun 2021 01:53:51 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 29 Jun 2021 22:51:23 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 29 Jun 2021 22:51:21 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 30 Jun 2021 11:20:53 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id ACD584A86; Wed, 30 Jun 2021 11:20:51 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     kgunda@codeaurora.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, satya priya <skakit@codeaurora.org>
Subject: [PATCH V5 2/2] dt-bindings: pinctrl: qcom-pmic-gpio: Remove the interrupts property
Date:   Wed, 30 Jun 2021 11:20:41 +0530
Message-Id: <1625032241-3458-3-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1625032241-3458-1-git-send-email-skakit@codeaurora.org>
References: <1625032241-3458-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Remove the interrupts property as we no longer specify it.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
Changes in V5:
 - This is newly added in V5.As per Bjorn's comments on [1]
   removed the interrupts property as it is no longer used.

   [1] https://lore.kernel.org/patchwork/patch/1434144/

 .../bindings/pinctrl/qcom,pmic-gpio.yaml           | 28 ++++------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 22c58de..d1a5499 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -56,18 +56,11 @@ properties:
   reg:
     maxItems: 1
 
-  interrupts:
-    minItems: 1
-    maxItems: 44
-    description: |
-        Must contain an array of encoded interrupt specifiers for
-        each available GPIO
+  interrupt-controller: true
 
   '#interrupt-cells':
     const: 2
 
-  interrupt-controller: true
-
   gpio-controller: true
 
   gpio-ranges:
@@ -87,6 +80,7 @@ required:
   - gpio-controller
   - '#gpio-cells'
   - gpio-ranges
+  - interrupt-controller
 
 patternProperties:
   '.*':
@@ -223,22 +217,8 @@ examples:
     pm8921_gpio: gpio@150 {
       compatible = "qcom,pm8921-gpio", "qcom,ssbi-gpio";
       reg = <0x150 0x160>;
-      interrupts = <192 1>, <193 1>, <194 1>,
-                   <195 1>, <196 1>, <197 1>,
-                   <198 1>, <199 1>, <200 1>,
-                   <201 1>, <202 1>, <203 1>,
-                   <204 1>, <205 1>, <206 1>,
-                   <207 1>, <208 1>, <209 1>,
-                   <210 1>, <211 1>, <212 1>,
-                   <213 1>, <214 1>, <215 1>,
-                   <216 1>, <217 1>, <218 1>,
-                   <219 1>, <220 1>, <221 1>,
-                   <222 1>, <223 1>, <224 1>,
-                   <225 1>, <226 1>, <227 1>,
-                   <228 1>, <229 1>, <230 1>,
-                   <231 1>, <232 1>, <233 1>,
-                   <234 1>, <235 1>;
-
+      interrupt-controller;
+      #interrupt-cells = <2>;
       gpio-controller;
       gpio-ranges = <&pm8921_gpio 0 0 44>;
       #gpio-cells = <2>;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

