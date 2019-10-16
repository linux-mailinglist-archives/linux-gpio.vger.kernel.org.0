Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C56D4D936E
	for <lists+linux-gpio@lfdr.de>; Wed, 16 Oct 2019 16:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389152AbfJPONf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 16 Oct 2019 10:13:35 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4222 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1733190AbfJPONf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Oct 2019 10:13:35 -0400
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 667E687B94C88BDDAF7F;
        Wed, 16 Oct 2019 22:13:32 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0; Wed, 16 Oct 2019
 22:13:26 +0800
From:   YueHaibing <yuehaibing@huawei.com>
To:     <jason@lakedaemon.net>, <andrew@lunn.ch>,
        <gregory.clement@bootlin.com>, <sebastian.hesselbarth@gmail.com>,
        <linus.walleij@linaro.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-gpio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        YueHaibing <yuehaibing@huawei.com>
Subject: [PATCH -next] pinctrl: mvebu: use devm_platform_ioremap_resource() to simplify code
Date:   Wed, 16 Oct 2019 22:12:17 +0800
Message-ID: <20191016141217.21520-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use devm_platform_ioremap_resource() to simplify the code a bit.
This is detected by coccinelle.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
---
 drivers/pinctrl/mvebu/pinctrl-mvebu.c | 4 +---
 drivers/pinctrl/mvebu/pinctrl-orion.c | 7 ++-----
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-mvebu.c b/drivers/pinctrl/mvebu/pinctrl-mvebu.c
index 00cfaf2..a1f9385 100644
--- a/drivers/pinctrl/mvebu/pinctrl-mvebu.c
+++ b/drivers/pinctrl/mvebu/pinctrl-mvebu.c
@@ -759,12 +759,10 @@ int mvebu_pinctrl_simple_mmio_probe(struct platform_device *pdev)
 {
 	struct mvebu_pinctrl_soc_info *soc = dev_get_platdata(&pdev->dev);
 	struct mvebu_mpp_ctrl_data *mpp_data;
-	struct resource *res;
 	void __iomem *base;
 	int i;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	base = devm_ioremap_resource(&pdev->dev, res);
+	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
 
diff --git a/drivers/pinctrl/mvebu/pinctrl-orion.c b/drivers/pinctrl/mvebu/pinctrl-orion.c
index 29bb9d8..cc97d27 100644
--- a/drivers/pinctrl/mvebu/pinctrl-orion.c
+++ b/drivers/pinctrl/mvebu/pinctrl-orion.c
@@ -220,17 +220,14 @@ static int orion_pinctrl_probe(struct platform_device *pdev)
 {
 	const struct of_device_id *match =
 		of_match_device(orion_pinctrl_of_match, &pdev->dev);
-	struct resource *res;
 
 	pdev->dev.platform_data = (void*)match->data;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	mpp_base = devm_ioremap_resource(&pdev->dev, res);
+	mpp_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(mpp_base))
 		return PTR_ERR(mpp_base);
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
-	high_mpp_base = devm_ioremap_resource(&pdev->dev, res);
+	high_mpp_base = devm_platform_ioremap_resource(pdev, 1);
 	if (IS_ERR(high_mpp_base))
 		return PTR_ERR(high_mpp_base);
 
-- 
2.7.4


