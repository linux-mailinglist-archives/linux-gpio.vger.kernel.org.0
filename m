Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E5712C50FC
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Nov 2020 10:22:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389214AbgKZJWI (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Nov 2020 04:22:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:33848 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389212AbgKZJWH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 26 Nov 2020 04:22:07 -0500
Received: from localhost.localdomain (unknown [122.179.79.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 46D822173E;
        Thu, 26 Nov 2020 09:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606382526;
        bh=X5uA2KY4wmNaVNxCZXSquWqlKleaRPwKpVHzRFHkSZc=;
        h=From:To:Cc:Subject:Date:From;
        b=KXEndUTzTWiZNjvNOb4xb4bKhIt+2kyr1rFKo1/X0rVn2Wec3E478HYFT6XWjQUlh
         pXakZ5ahboA37Jcing1bDfR5GDf49AJIsN6UNG77aDa+KjO/T6O3FBIcUKyyGiuiMe
         HVgsKELqcQLwbZpFpxe/JUas4ZwAU1NQ99bTIoNg=
From:   Vinod Koul <vkoul@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom-pmic-gpio: Add pmx55 support
Date:   Thu, 26 Nov 2020 14:51:50 +0530
Message-Id: <20201126092151.1082697-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for the PMX55 GPIO support to the Qualcomm PMIC GPIO
binding.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
index c3d1914381ae..7648ab00f4e2 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
@@ -29,6 +29,7 @@ PMIC's from Qualcomm.
 		    "qcom,pm8150b-gpio"
 		    "qcom,pm6150-gpio"
 		    "qcom,pm6150l-gpio"
+		    "qcom,pmx55-gpio"
 
 		    And must contain either "qcom,spmi-gpio" or "qcom,ssbi-gpio"
 		    if the device is on an spmi bus or an ssbi bus respectively
@@ -110,6 +111,8 @@ to specify in a pin configuration subnode:
 		    gpio1-gpio12 for pm8150l (hole on gpio7)
 		    gpio1-gpio10 for pm6150
 		    gpio1-gpio12 for pm6150l
+		    gpio1-gpio11 for pmx55 (holes on gpio3, gpio7, gpio10
+					    and gpio11)
 
 - function:
 	Usage: required
-- 
2.26.2

