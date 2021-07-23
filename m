Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 704783D36C9
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Jul 2021 10:33:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234648AbhGWHvo (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 23 Jul 2021 03:51:44 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:42291 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234546AbhGWHvk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Jul 2021 03:51:40 -0400
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 23 Jul 2021 01:32:14 -0700
X-QCInternal: smtphost
Received: from ironmsg02-blr.qualcomm.com ([10.86.208.131])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/AES256-SHA; 23 Jul 2021 01:32:12 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg02-blr.qualcomm.com with ESMTP; 23 Jul 2021 14:01:34 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 7205352A5; Fri, 23 Jul 2021 14:01:32 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Das Srinagesh <gurus@codeaurora.org>, kgunda@codeaurora.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        satya priya <skakit@codeaurora.org>
Subject: [PATCH V7 3/3] dt-bindings: pinctrl: qcom-pmic-gpio: Remove the interrupts property
Date:   Fri, 23 Jul 2021 14:01:14 +0530
Message-Id: <1627029074-23449-4-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627029074-23449-1-git-send-email-skakit@codeaurora.org>
References: <1627029074-23449-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Remove the interrupts property as we no longer specify it.

Signed-off-by: satya priya <skakit@codeaurora.org>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
Changes in V5:
 - This is newly added in V5.As per Bjorn's comments on [1]
   removed the interrupts property as it is no longer used.

 [1] https://lore.kernel.org/patchwork/patch/1434144/

Changes in V6:
 - No changes.

Changes in V7:
 - No changes.

 .../bindings/pinctrl/qcom,pmic-gpio.yaml           | 28 ++++------------------
 1 file changed, 4 insertions(+), 24 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
index 7a0d2d8..9bd01db 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
@@ -56,18 +56,11 @@ properties:
   reg:
     maxItems: 1
 
-  interrupts:
-    minItems: 1
-    maxItems: 44
-    description:
-      Must contain an array of encoded interrupt specifiers for
-      each available GPIO
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
   '-state$':
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

