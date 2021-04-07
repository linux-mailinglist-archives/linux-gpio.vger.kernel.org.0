Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 828393577C8
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Apr 2021 00:35:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230234AbhDGWfQ (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 7 Apr 2021 18:35:16 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:59504 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229615AbhDGWfP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 7 Apr 2021 18:35:15 -0400
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 07 Apr 2021 15:35:05 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com (HELO gurus-linux.localdomain) ([10.46.162.81])
  by ironmsg02-sd.qualcomm.com with ESMTP; 07 Apr 2021 15:35:01 -0700
Received: by gurus-linux.localdomain (Postfix, from userid 383780)
        id 497811A8A; Wed,  7 Apr 2021 15:35:01 -0700 (PDT)
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Guru Das Srinagesh <gurus@codeaurora.org>
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom-pmic-gpio: Add pm8008 support
Date:   Wed,  7 Apr 2021 15:34:59 -0700
Message-Id: <1568107824b071265b5fc3a195a1d91089ad617a.1617834404.git.gurus@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for the PM8008 GPIO support to the Qualcomm PMIC GPIO
binding.

Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
index 70e119b..1818481 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
@@ -36,6 +36,7 @@ PMIC's from Qualcomm.
 		    "qcom,pm6150-gpio"
 		    "qcom,pm6150l-gpio"
 		    "qcom,pmx55-gpio"
+		    "qcom,pm8008-gpio"
 
 		    And must contain either "qcom,spmi-gpio" or "qcom,ssbi-gpio"
 		    if the device is on an spmi bus or an ssbi bus respectively
@@ -125,6 +126,7 @@ to specify in a pin configuration subnode:
 		    gpio1-gpio12 for pm6150l
 		    gpio1-gpio11 for pmx55 (holes on gpio3, gpio7, gpio10
 					    and gpio11)
+		    gpio1-gpio2 for pm8008
 
 - function:
 	Usage: required
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

