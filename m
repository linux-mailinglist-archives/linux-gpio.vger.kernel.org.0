Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15E5CCB904
	for <lists+linux-gpio@lfdr.de>; Fri,  4 Oct 2019 13:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730598AbfJDLUz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 4 Oct 2019 07:20:55 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:45492 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729585AbfJDLUz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Oct 2019 07:20:55 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id AD9756034E; Fri,  4 Oct 2019 11:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570188053;
        bh=13JrP6NAsup1Fp+Re+RfVIJcKlXbS8TUEZmgMR+KpCs=;
        h=From:To:Cc:Subject:Date:From;
        b=gLU47tsMK/5sQwAf2jcRZzGVW0l5rd49H73OaDttdUekdzxKisaK+Vr3o/zGj1Mjj
         /2rYSfYecyxhqadepobOlCYmpekoFBdrsix3IWL1trV9ruswT23NKjlgXRe7vd8l/+
         fNflSgIVTlsw4JZlEwlnGeRJbWJO9CPWqideMdzE=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from kgunda-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A1E7D60A4E;
        Fri,  4 Oct 2019 11:20:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1570188053;
        bh=13JrP6NAsup1Fp+Re+RfVIJcKlXbS8TUEZmgMR+KpCs=;
        h=From:To:Cc:Subject:Date:From;
        b=gLU47tsMK/5sQwAf2jcRZzGVW0l5rd49H73OaDttdUekdzxKisaK+Vr3o/zGj1Mjj
         /2rYSfYecyxhqadepobOlCYmpekoFBdrsix3IWL1trV9ruswT23NKjlgXRe7vd8l/+
         fNflSgIVTlsw4JZlEwlnGeRJbWJO9CPWqideMdzE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A1E7D60A4E
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=kgunda@codeaurora.org
From:   Kiran Gunda <kgunda@codeaurora.org>
To:     bjorn.andersson@linaro.org, Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Kiran Gunda <kgunda@codeaurora.org>
Subject: [PATCH V1] dt-bindings: pinctrl: qcom-pmic-gpio: Add support for pm6150/pm6150l
Date:   Fri,  4 Oct 2019 16:50:39 +0530
Message-Id: <1570188039-22122-1-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for the PM6150 and PM6150L GPIO support to the
Qualcomm PMIC GPIO binding.

Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
---
 Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt | 4 ++++
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c                     | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
index c32bf32..2f48cca 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,pmic-gpio.txt
@@ -23,6 +23,8 @@ PMIC's from Qualcomm.
 		    "qcom,pms405-gpio"
 		    "qcom,pm8150-gpio"
 		    "qcom,pm8150b-gpio"
+		    "qcom,pm6150-gpio"
+		    "qcom,pm6150l-gpio"
 
 		    And must contain either "qcom,spmi-gpio" or "qcom,ssbi-gpio"
 		    if the device is on an spmi bus or an ssbi bus respectively
@@ -100,6 +102,8 @@ to specify in a pin configuration subnode:
 					     and gpio8)
 		    gpio1-gpio12 for pm8150b (holes on gpio3, gpio4, gpio7)
 		    gpio1-gpio12 for pm8150l (hole on gpio7)
+		    gpio1-gpio10 for pm6150
+		    gpio1-gpio12 for pm6150l
 
 - function:
 	Usage: required
diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index f1fece5..387917c 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1121,6 +1121,8 @@ static int pmic_gpio_remove(struct platform_device *pdev)
 	{ .compatible = "qcom,pm8150b-gpio", .data = (void *) 12 },
 	/* pm8150l has 12 GPIOs with holes on 7 */
 	{ .compatible = "qcom,pm8150l-gpio", .data = (void *) 12 },
+	{ .compatible = "qcom,pm6150-gpio", .data = (void *) 10 },
+	{ .compatible = "qcom,pm6150l-gpio", .data = (void *) 12 },
 	{ },
 };
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project

