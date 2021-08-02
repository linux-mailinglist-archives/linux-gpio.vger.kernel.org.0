Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A3D43DD6EB
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Aug 2021 15:22:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233939AbhHBNWR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Aug 2021 09:22:17 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:1522 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233887AbhHBNWR (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Aug 2021 09:22:17 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 02 Aug 2021 06:22:08 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 02 Aug 2021 06:22:04 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg01-blr.qualcomm.com with ESMTP; 02 Aug 2021 18:51:25 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 4FC705368; Mon,  2 Aug 2021 18:51:24 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Lee Jones <lee.jones@linaro.org>
Cc:     bhupesh.sharma@linaro.org, Das Srinagesh <gurus@codeaurora.org>,
        kgunda@codeaurora.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, satya priya <skakit@codeaurora.org>
Subject: [RESEND PATCH V7 1/3] dt-bindings: mfd: pm8008: Add gpio-ranges and spmi-gpio compatible
Date:   Mon,  2 Aug 2021 18:51:02 +0530
Message-Id: <1627910464-19363-2-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627910464-19363-1-git-send-email-skakit@codeaurora.org>
References: <1627910464-19363-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add gpio-ranges and "qcom,spmi-gpio" compatible to match with the
parent qcom,pmic-gpio.yaml binding.

Signed-off-by: satya priya <skakit@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Guru Das Srinagesh <gurus@codeaurora.org>
---
Changes in V7:
 - This is newly added in V7 to resolve below error.
 dtschema/dtc warnings/errors:
 /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/qcom,pm8008.example.dt.yaml: gpio@c000: compatible: ['qcom,pm8008-gpio'] is too short
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml
 /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/mfd/qcom,pm8008.example.dt.yaml: gpio@c000: 'gpio-ranges' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.yaml

Changes in RESEND V7:
 - Rebased on linux-next.

 Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
index 7799368..ec3138c 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,pm8008.yaml
@@ -53,7 +53,9 @@ patternProperties:
 
     properties:
       compatible:
-        const: qcom,pm8008-gpio
+        items:
+          - const: qcom,pm8008-gpio
+          - const: qcom,spmi-gpio
 
       reg:
         description: Peripheral address of one of the two GPIO peripherals.
@@ -61,6 +63,9 @@ patternProperties:
 
       gpio-controller: true
 
+      gpio-ranges:
+        maxItems: 1
+
       interrupt-controller: true
 
       "#interrupt-cells":
@@ -75,6 +80,7 @@ patternProperties:
       - gpio-controller
       - interrupt-controller
       - "#gpio-cells"
+      - gpio-ranges
       - "#interrupt-cells"
 
     additionalProperties: false
@@ -107,10 +113,11 @@ examples:
         interrupt-parent = <&tlmm>;
         interrupts = <32 IRQ_TYPE_EDGE_RISING>;
 
-        gpio@c000 {
-          compatible = "qcom,pm8008-gpio";
+        pm8008_gpios: gpio@c000 {
+          compatible = "qcom,pm8008-gpio", "qcom,spmi-gpio";
           reg = <0xc000>;
           gpio-controller;
+          gpio-ranges = <&pm8008_gpios 0 0 2>;
           #gpio-cells = <2>;
           interrupt-controller;
           #interrupt-cells = <2>;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

