Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5913926D3FA
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Sep 2020 08:55:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbgIQGz2 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Sep 2020 02:55:28 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:13209 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726106AbgIQGzZ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 17 Sep 2020 02:55:25 -0400
X-Greylist: delayed 946 seconds by postgrey-1.27 at vger.kernel.org; Thu, 17 Sep 2020 02:55:25 EDT
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id DCF45C1115718EE0FF4F;
        Thu, 17 Sep 2020 14:39:36 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Thu, 17 Sep 2020
 14:39:29 +0800
From:   Wang Xiaojun <wangxiaojun11@huawei.com>
To:     <sean.wang@kernel.org>, <linus.walleij@linaro.org>,
        <matthias.bgg@gmail.com>
CC:     <linux-mediatek@lists.infradead.org>, <linux-gpio@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH -next] pinctrl: mediatek: use devm_platform_ioremap_resource_byname()
Date:   Thu, 17 Sep 2020 14:41:51 +0800
Message-ID: <20200917064151.2184010-1-wangxiaojun11@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use the devm_platform_ioremap_resource_byname() helper instead of
calling platform_get_resource_byname() and devm_ioremap_resource()
separately.

Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>
---
 drivers/pinctrl/mediatek/pinctrl-moore.c         | 11 ++---------
 drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c |  9 +--------
 drivers/pinctrl/mediatek/pinctrl-paris.c         | 11 ++---------
 3 files changed, 5 insertions(+), 26 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-moore.c b/drivers/pinctrl/mediatek/pinctrl-moore.c
index aa1068d2867f..5e00f93ac998 100644
--- a/drivers/pinctrl/mediatek/pinctrl-moore.c
+++ b/drivers/pinctrl/mediatek/pinctrl-moore.c
@@ -589,7 +589,6 @@ int mtk_moore_pinctrl_probe(struct platform_device *pdev,
 			    const struct mtk_pin_soc *soc)
 {
 	struct pinctrl_pin_desc *pins;
-	struct resource *res;
 	struct mtk_pinctrl *hw;
 	int err, i;
 
@@ -612,14 +611,8 @@ int mtk_moore_pinctrl_probe(struct platform_device *pdev,
 		return -ENOMEM;
 
 	for (i = 0; i < hw->soc->nbase_names; i++) {
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						   hw->soc->base_names[i]);
-		if (!res) {
-			dev_err(&pdev->dev, "missing IO resource\n");
-			return -ENXIO;
-		}
-
-		hw->base[i] = devm_ioremap_resource(&pdev->dev, res);
+		hw->base[i] = devm_platform_ioremap_resource_byname(pdev,
+						hw->soc->base_names[i]);
 		if (IS_ERR(hw->base[i]))
 			return PTR_ERR(hw->base[i]);
 	}
diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
index 2f3dfb56c3fa..e8622c7e117a 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
@@ -354,7 +354,6 @@ static const struct mtk_eint_xt mtk_eint_xt = {
 int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	struct resource *res;
 
 	if (!IS_ENABLED(CONFIG_EINT_MTK))
 		return 0;
@@ -366,13 +365,7 @@ int mtk_build_eint(struct mtk_pinctrl *hw, struct platform_device *pdev)
 	if (!hw->eint)
 		return -ENOMEM;
 
-	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "eint");
-	if (!res) {
-		dev_err(&pdev->dev, "Unable to get eint resource\n");
-		return -ENODEV;
-	}
-
-	hw->eint->base = devm_ioremap_resource(&pdev->dev, res);
+	hw->eint->base = devm_platform_ioremap_resource_byname(pdev, "eint");
 	if (IS_ERR(hw->eint->base))
 		return PTR_ERR(hw->eint->base);
 
diff --git a/drivers/pinctrl/mediatek/pinctrl-paris.c b/drivers/pinctrl/mediatek/pinctrl-paris.c
index a23c18251965..623af4410b07 100644
--- a/drivers/pinctrl/mediatek/pinctrl-paris.c
+++ b/drivers/pinctrl/mediatek/pinctrl-paris.c
@@ -940,7 +940,6 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
 {
 	struct pinctrl_pin_desc *pins;
 	struct mtk_pinctrl *hw;
-	struct resource *res;
 	int err, i;
 
 	hw = devm_kzalloc(&pdev->dev, sizeof(*hw), GFP_KERNEL);
@@ -963,14 +962,8 @@ int mtk_paris_pinctrl_probe(struct platform_device *pdev,
 		return -ENOMEM;
 
 	for (i = 0; i < hw->soc->nbase_names; i++) {
-		res = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-						   hw->soc->base_names[i]);
-		if (!res) {
-			dev_err(&pdev->dev, "missing IO resource\n");
-			return -ENXIO;
-		}
-
-		hw->base[i] = devm_ioremap_resource(&pdev->dev, res);
+		hw->base[i] = devm_platform_ioremap_resource_byname(pdev,
+					hw->soc->base_names[i]);
 		if (IS_ERR(hw->base[i]))
 			return PTR_ERR(hw->base[i]);
 	}
-- 
2.25.1

