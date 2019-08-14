Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20BDD8D348
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2019 14:37:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727932AbfHNMgt (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Aug 2019 08:36:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:56998 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726721AbfHNMgs (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 14 Aug 2019 08:36:48 -0400
Received: from localhost.localdomain (unknown [171.76.115.97])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C468D21721;
        Wed, 14 Aug 2019 12:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565786208;
        bh=N+bESiPHdBuUSXfODkzFtGLhH2/mdS9C7M3DN19vQC8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=f7n7REfud2nmzAOkRdjU/gg2LpxyolmZMimtTo3WA8mySoaEcpNCCkolx+HxsrAG6
         LUKiILBoBW12upKDPCBDR1G194XDriSGTmvFtO2Fdm23vjiF494Ac93/59lpbgoWlL
         boFd+xKWtkTwL0SfXX9daNFWdGccriG5Qkkr20iE=
From:   Vinod Koul <vkoul@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: pinctrl: qcom-pmic-gpio: Add pm8150b support
Date:   Wed, 14 Aug 2019 18:05:11 +0530
Message-Id: <20190814123512.6017-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190814123512.6017-1-vkoul@kernel.org>
References: <20190814123512.6017-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for the PM8150b GPIO support to the Qualcomm PMIC GPIO
binding.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 2 ++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c                     | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
index 56553c06f129..457459d17e79 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
@@ -22,6 +22,7 @@ PMIC's from Qualcomm.
 		    "qcom,pmi8998-gpio"
 		    "qcom,pms405-gpio"
 		    "qcom,pm8150-gpio"
+		    "qcom,pm8150b-gpio"
 
 		    And must contain either "qcom,spmi-gpio" or "qcom,ssbi-gpio"
 		    if the device is on an spmi bus or an ssbi bus respectively
@@ -97,6 +98,7 @@ to specify in a pin configuration subnode:
 		    gpio1-gpio12 for pms405 (holes on gpio1, gpio9 and gpio10)
 		    gpio1-gpio10 for pm8150 (holes on gpio2, gpio5, gpio7
 					     and gpio8)
+		    gpio1-gpio12 for pm8150b (holes on gpio3, gpio4, gpio7)
 
 - function:
 	Usage: required
diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 5286ec060894..931c9349f145 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1157,6 +1157,8 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pms405-gpio", .data = (void *) 12 },
 	/* pm8150 has 10 GPIOs with holes on 2, 5, 7 and 8 */
 	{ .compatible = "qcom,pm8150-gpio", .data = (void *) 10 },
+	/* pm8150b has 12 GPIOs with holes on 3, r and 7 */
+	{ .compatible = "qcom,pm8150b-gpio", .data = (void *) 12 },
 	{ },
 };
 
-- 
2.20.1

