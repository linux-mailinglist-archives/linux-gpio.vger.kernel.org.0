Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BCAF8D346
	for <lists+linux-gpio@lfdr.de>; Wed, 14 Aug 2019 14:36:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727898AbfHNMgp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 14 Aug 2019 08:36:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:56938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727304AbfHNMgp (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 14 Aug 2019 08:36:45 -0400
Received: from localhost.localdomain (unknown [171.76.115.97])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C0E62214DA;
        Wed, 14 Aug 2019 12:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1565786204;
        bh=wqo1QtxFMdDaXjf0zXYMAwyreNgWwXT2nHsHAmdfdl8=;
        h=From:To:Cc:Subject:Date:From;
        b=bkhWJafs6Zn9rGNJFbbm8hLHdnvq9+YJER6CCcdHZBjJ1Xfr/qoL2koTQivXjo/vG
         CAcYQzavFz/bnEmIm3Zd3SSJ8c+IhVxvxC+gy2f4hqHJyOsKtGDMx/BaEvq+RItXuG
         QwfHah1IhzHorpdFVeOQYMEAumNSQhslAqBlDdRU=
From:   Vinod Koul <vkoul@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: pinctrl: qcom-pmic-gpio: Add pm8150 support
Date:   Wed, 14 Aug 2019 18:05:10 +0530
Message-Id: <20190814123512.6017-1-vkoul@kernel.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for the PM8150 GPIO support to the Qualcomm PMIC GPIO
binding.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 3 +++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c                     | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
index 7f64a7e92c28..56553c06f129 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
@@ -21,6 +21,7 @@ PMIC's from Qualcomm.
 		    "qcom,pmi8994-gpio"
 		    "qcom,pmi8998-gpio"
 		    "qcom,pms405-gpio"
+		    "qcom,pm8150-gpio"
 
 		    And must contain either "qcom,spmi-gpio" or "qcom,ssbi-gpio"
 		    if the device is on an spmi bus or an ssbi bus respectively
@@ -94,6 +95,8 @@ to specify in a pin configuration subnode:
 		    gpio1-gpio22 for pma8084
 		    gpio1-gpio10 for pmi8994
 		    gpio1-gpio12 for pms405 (holes on gpio1, gpio9 and gpio10)
+		    gpio1-gpio10 for pm8150 (holes on gpio2, gpio5, gpio7
+					     and gpio8)
 
 - function:
 	Usage: required
diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index f39da87ea185..5286ec060894 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1155,6 +1155,8 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pma8084-gpio", .data = (void *) 22 },
 	/* pms405 has 12 GPIOs with holes on 1, 9, and 10 */
 	{ .compatible = "qcom,pms405-gpio", .data = (void *) 12 },
+	/* pm8150 has 10 GPIOs with holes on 2, 5, 7 and 8 */
+	{ .compatible = "qcom,pm8150-gpio", .data = (void *) 10 },
 	{ },
 };
 
-- 
2.20.1

