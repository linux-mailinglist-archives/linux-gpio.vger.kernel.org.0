Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4A93E1EC9
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Aug 2021 00:34:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240156AbhHEWew (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Aug 2021 18:34:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231679AbhHEWev (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Aug 2021 18:34:51 -0400
X-Greylist: delayed 484 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 05 Aug 2021 15:34:37 PDT
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09C14C0613D5
        for <linux-gpio@vger.kernel.org>; Thu,  5 Aug 2021 15:34:36 -0700 (PDT)
Received: from localhost.localdomain (83.6.167.155.neoplus.adsl.tpnet.pl [83.6.167.155])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 07B7E3F402;
        Fri,  6 Aug 2021 00:26:30 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] pinctrl: qcom-pmic-gpio: Add support for pm8019
Date:   Fri,  6 Aug 2021 00:26:25 +0200
Message-Id: <20210805222625.40236-2-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210805222625.40236-1-konrad.dybcio@somainline.org>
References: <20210805222625.40236-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

PM8019 provides 6 GPIOs. Add a compatible to support that.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
index a89d24a040af..dbb3d2e3c0b0 100644
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
2.32.0

