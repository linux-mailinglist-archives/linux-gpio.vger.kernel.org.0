Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58AC237BB81
	for <lists+linux-gpio@lfdr.de>; Wed, 12 May 2021 13:13:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230115AbhELLOt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 12 May 2021 07:14:49 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:49396 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbhELLOt (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 May 2021 07:14:49 -0400
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 12 May 2021 04:13:41 -0700
X-QCInternal: smtphost
Received: from ironmsg01-blr.qualcomm.com ([10.86.208.130])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/AES256-SHA; 12 May 2021 04:13:38 -0700
X-QCInternal: smtphost
Received: from c-skakit-linux.ap.qualcomm.com (HELO c-skakit-linux.qualcomm.com) ([10.242.51.242])
  by ironmsg01-blr.qualcomm.com with ESMTP; 12 May 2021 16:43:14 +0530
Received: by c-skakit-linux.qualcomm.com (Postfix, from userid 2344709)
        id 95EE74F44; Wed, 12 May 2021 16:43:13 +0530 (IST)
From:   satya priya <skakit@codeaurora.org>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     kgunda@codeaurora.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, satya priya <skakit@codeaurora.org>
Subject: [PATCH V3 2/3] dt-bindings: pinctrl: qcom-pmic-gpio: Add pm7325 support
Date:   Wed, 12 May 2021 16:43:07 +0530
Message-Id: <1620817988-18809-3-git-send-email-skakit@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1620817988-18809-1-git-send-email-skakit@codeaurora.org>
References: <1620817988-18809-1-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add compatible string for PM7325 pmic GPIO support to the
Qualcomm PMIC GPIO binding.

Signed-off-by: satya priya <skakit@codeaurora.org>
---
Changes in V2:
 - Placed this patch before conversion patch and updated commit text
   to be more clear.

Changes in V3:
 - Rebased the patch and added pm7325 as others are already present.
   updated the commit text accordingly.

 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
index f6a97605..161216d 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
@@ -31,6 +31,7 @@ PMIC's from Qualcomm.
 		    "qcom,pm8350b-gpio"
 		    "qcom,pm8350c-gpio"
 		    "qcom,pmk8350-gpio"
+		    "qcom,pm7325-gpio"
 		    "qcom,pmr735a-gpio"
 		    "qcom,pmr735b-gpio"
 		    "qcom,pm6150-gpio"
@@ -120,6 +121,7 @@ to specify in a pin configuration subnode:
 		    gpio1-gpio8 for pm8350b
 		    gpio1-gpio9 for pm8350c
 		    gpio1-gpio4 for pmk8350
+		    gpio1-gpio10 for pm7325
 		    gpio1-gpio4 for pmr735a
 		    gpio1-gpio4 for pmr735b
 		    gpio1-gpio10 for pm6150
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
of Code Aurora Forum, hosted by The Linux Foundation

