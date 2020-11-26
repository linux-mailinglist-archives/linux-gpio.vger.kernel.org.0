Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DD052C50FE
	for <lists+linux-gpio@lfdr.de>; Thu, 26 Nov 2020 10:22:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389236AbgKZJWM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 26 Nov 2020 04:22:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:33910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2389212AbgKZJWM (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 26 Nov 2020 04:22:12 -0500
Received: from localhost.localdomain (unknown [122.179.79.180])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9756D21D81;
        Thu, 26 Nov 2020 09:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606382531;
        bh=J7Ny/AexIoe1mEfGuqNRg5LPcj8KfibZXHtUVvVaILg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=WRusDJSNfT8FWqvcy9Zg8smd+greMbrafqj53rzgm3Qbt+LWpensf3icjph8/jGe9
         eNx4phgnKfqUQ0V321gmfCyIkoo6n4ewSb9SSAuxvN/+4Duw04vc0WWrIfSncKOrbD
         qyEamw8MiwWPmR98ys4ChqA7rC4+5P6iM93aXnaA=
From:   Vinod Koul <vkoul@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] pinctrl: qcom-pmic-gpio: Add support for pmx55
Date:   Thu, 26 Nov 2020 14:51:51 +0530
Message-Id: <20201126092151.1082697-2-vkoul@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201126092151.1082697-1-vkoul@kernel.org>
References: <20201126092151.1082697-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PM55 pmic support gpio controller so add compatible and comment for gpio
holes

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index 17441388ce8f..9801c717e311 100644
--- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
+++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
@@ -1129,6 +1129,8 @@ static const struct of_device_id pmic_gpio_of_match[] = {
 	{ .compatible = "qcom,pm8150l-gpio", .data = (void *) 12 },
 	{ .compatible = "qcom,pm6150-gpio", .data = (void *) 10 },
 	{ .compatible = "qcom,pm6150l-gpio", .data = (void *) 12 },
+	/* pmx55 has 11 GPIOs with holes on 3, 7, 10, 11 */
+	{ .compatible = "qcom,pmx55-gpio", .data = (void *) 11 },
 	{ },
 };
 
-- 
2.26.2

