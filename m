Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AECC6426AA8
	for <lists+linux-gpio@lfdr.de>; Fri,  8 Oct 2021 14:25:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240689AbhJHM1O (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 8 Oct 2021 08:27:14 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:38622 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S240457AbhJHM1N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 8 Oct 2021 08:27:13 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1989g3K9023582;
        Fri, 8 Oct 2021 14:25:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=selector1;
 bh=o5dnBVGOI0j0+u6Bn/o8WUIi3ZFLpUM04QJe3Cs6AOU=;
 b=CcP90rnzgOfMswdXew1Gty1D3hFwatW0LQWG+5gCTjZ/m3O0ZhKnsOIEJpheJqIjzAQ5
 M7nR4HZK2hLbP3dBitNKsCjPr2XwnPgUkFCptyw4zf0OoktWVbFlWEaCzuus0raBRCEk
 AoouUv04z5CBISwMizuVIWshx1y0t7jksrcfvpozpEINdMQeuucatnhGsJCfms+HeVmB
 TGTX26htQbJO3RFnr4GJzUEU4sQ4IMkGtxBlQMEhpYntKk0X6tCAU16Mgh4ptII2Lr9t
 62OVerJBsf0MMUoSsICXYgO8LwJi5i73kxxex73JiQ06+sn9qv0gCxmVqBnnqZxo7Zbd DQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3bjkk78vnk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 08 Oct 2021 14:25:07 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id CDE2F10002A;
        Fri,  8 Oct 2021 14:25:04 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C1527229A85;
        Fri,  8 Oct 2021 14:25:04 +0200 (CEST)
Received: from localhost (10.75.127.49) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 8 Oct 2021 14:25:02
 +0200
From:   Fabien Dessenne <fabien.dessenne@foss.st.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <linux-gpio@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
CC:     Fabien Dessenne <fabien.dessenne@foss.st.com>
Subject: [PATCH] pinctrl: stm32: do not warn when 'st,package' is absent
Date:   Fri, 8 Oct 2021 14:24:54 +0200
Message-ID: <20211008122454.617556-1-fabien.dessenne@foss.st.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-08_03,2021-10-07_02,2020-04-07_01
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since the 'st,package' property is optional, outputting the "No package
detected" warning-level log when the property is absent is unsuitable.
Remove that log.

Signed-off-by: Fabien Dessenne <fabien.dessenne@foss.st.com>
---
 drivers/pinctrl/stm32/pinctrl-stm32.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index 68b3886f9f0f..ac82570e46be 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -1415,17 +1415,6 @@ static int stm32_pctrl_create_pins_tab(struct stm32_pinctrl *pctl,
 	return 0;
 }
 
-static void stm32_pctl_get_package(struct device_node *np,
-				   struct stm32_pinctrl *pctl)
-{
-	if (of_property_read_u32(np, "st,package", &pctl->pkg)) {
-		pctl->pkg = 0;
-		dev_warn(pctl->dev, "No package detected, use default one\n");
-	} else {
-		dev_dbg(pctl->dev, "package detected: %x\n", pctl->pkg);
-	}
-}
-
 int stm32_pctl_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1473,8 +1462,9 @@ int stm32_pctl_probe(struct platform_device *pdev)
 	pctl->dev = dev;
 	pctl->match_data = match->data;
 
-	/*  get package information */
-	stm32_pctl_get_package(np, pctl);
+	/*  get optional package information */
+	if (!of_property_read_u32(np, "st,package", &pctl->pkg))
+		dev_dbg(pctl->dev, "package detected: %x\n", pctl->pkg);
 
 	pctl->pins = devm_kcalloc(pctl->dev, pctl->match_data->npins,
 				  sizeof(*pctl->pins), GFP_KERNEL);
-- 
2.25.1

