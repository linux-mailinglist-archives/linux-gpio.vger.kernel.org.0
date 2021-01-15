Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B99CD2F81D7
	for <lists+linux-gpio@lfdr.de>; Fri, 15 Jan 2021 18:13:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727876AbhAORMc (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 15 Jan 2021 12:12:32 -0500
Received: from relay05.th.seeweb.it ([5.144.164.166]:37633 "EHLO
        relay05.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730423AbhAORMc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Jan 2021 12:12:32 -0500
Received: from localhost.localdomain (abaf224.neoplus.adsl.tpnet.pl [83.6.169.224])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 270D53E9B5;
        Fri, 15 Jan 2021 18:11:32 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: qcom-pmic-gpio: Add support for pm8019
Date:   Fri, 15 Jan 2021 18:11:13 +0100
Message-Id: <20210115171115.123155-1-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PM8019 provides 6 GPIOs. Add a compatible to support that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 1 +
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c                     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
index 7648ab00f4e2..c4de3be1d7be 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
@@ -9,6 +9,7 @@ PMIC's from Qualcomm.
 	Definition: must be one of:
 		    "qcom,pm8005-gpio"
 		    "qcom,pm8018-gpio"
+		    "qcom,pm8019-gpio"
 		    "qcom,pm8038-gpio"
 		    "qcom,pm8058-gpio"
 		    "qcom,pm8916-gpio"
diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 9801c717e311..4018c64011f8 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1105,6 +1105,7 @@ static int pmic_gpio_remove(struct platform_device *pdev)
 
 static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pm8005-gpio", .data = (void *) 4 },
+	{ .compatible = "qcom,pm8019-gpio", .data = (void *) 6 },
 	{ .compatible = "qcom,pm8916-gpio", .data = (void *) 4 },
 	{ .compatible = "qcom,pm8941-gpio", .data = (void *) 36 },
 	/* pm8950 has 8 GPIOs with holes on 3 */
-- 
2.29.2

