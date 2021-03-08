Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97AED3313C6
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Mar 2021 17:49:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230126AbhCHQtW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 8 Mar 2021 11:49:22 -0500
Received: from mail.kernel.org ([198.145.29.99]:51968 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230453AbhCHQs4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 8 Mar 2021 11:48:56 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4B85C6518D;
        Mon,  8 Mar 2021 16:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1615222136;
        bh=1sJP0A1ykSZC1GASB0lTJr+JzrmjpwHCZUx6r9lCowk=;
        h=From:To:Cc:Subject:Date:From;
        b=j7VmwyqH5W47cGgHc1JQN+T+OHW99tMpBLdgza6daA13dg9pfK7zJJU3De0FDyclS
         VD46v3CFl01yPtwvJQ4nM7nkgeA+cWj3Wnh6ApTmPtHmChijd3FP4GelGxr6KHvnj/
         QuAMG/mAg1DDKvdIbBYW2304YuyTyrJQHPIH3wBF1KVzu/ZSp6TwxGAqYAQ6LK4j9N
         RMGkxjvcs7/woLxTNW+vs9sTqQndq6tk6+nNfXDMd7Iem7Q94mlnWWMnvXJClDDfWu
         8MtzDboPQRcf7FS75e5bG0TYF2i31o9Qaftbc7uRGeZxbkHOyRofaWNBB4nrQgnIRD
         u4MIiTfn7os8Q==
From:   Vinod Koul <vkoul@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: pinctrl: qcom-pmic-gpio: Add pm8350 and friends
Date:   Mon,  8 Mar 2021 22:18:44 +0530
Message-Id: <20210308164845.3210393-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for the PM8350, PM8350B, PM8350C, PMK8350, PMR735A and
PMR735B GPIO support to the Qualcomm PMIC GPIO binding.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 .../devicetree/bindings/pinctrl/qcom,pmic-gpio.txt   | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
index 7648ab00f4e2..70e119b39c48 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
@@ -27,6 +27,12 @@ PMIC's from Qualcomm.
 		    "qcom,pm660l-gpio"
 		    "qcom,pm8150-gpio"
 		    "qcom,pm8150b-gpio"
+		    "qcom,pm8350-gpio"
+		    "qcom,pm8350b-gpio"
+		    "qcom,pm8350c-gpio"
+		    "qcom,pmk8350-gpio"
+		    "qcom,pmr735a-gpio"
+		    "qcom,pmr735b-gpio"
 		    "qcom,pm6150-gpio"
 		    "qcom,pm6150l-gpio"
 		    "qcom,pmx55-gpio"
@@ -109,6 +115,12 @@ to specify in a pin configuration subnode:
 					     and gpio8)
 		    gpio1-gpio12 for pm8150b (holes on gpio3, gpio4, gpio7)
 		    gpio1-gpio12 for pm8150l (hole on gpio7)
+		    gpio1-gpio10 for pm8350
+		    gpio1-gpio8 for pm8350b
+		    gpio1-gpio9 for pm8350c
+		    gpio1-gpio4 for pmk8350
+		    gpio1-gpio4 for pmr735a
+		    gpio1-gpio4 for pmr735b
 		    gpio1-gpio10 for pm6150
 		    gpio1-gpio12 for pm6150l
 		    gpio1-gpio11 for pmx55 (holes on gpio3, gpio7, gpio10
-- 
2.26.2

