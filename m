Return-Path: <linux-gpio+bounces-9770-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0F696B6E6
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 11:37:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 573321F25A5F
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 09:37:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FB8C1CF5CF;
	Wed,  4 Sep 2024 09:36:52 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A9B1CC16B
	for <linux-gpio@vger.kernel.org>; Wed,  4 Sep 2024 09:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725442611; cv=none; b=HyNbal126VS5Mm+1TzeyGG4iss9ec7wsfCfiSB7b3V7CUicz7JvDVDrGz1DRuwG7wH+pbuFdflZrjv2RVIXpDWIv0KsajUjB6FzHvXJAIDCILvgFPs7WzQJ5qm6ETN0YUMMnxA4tMGd/+qzZbeK3+lemL9btbKPm3oBsf7dH+Z8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725442611; c=relaxed/simple;
	bh=afQ+r20bE1hZSsnheHCvqeE8vwKMkWi6rg8PfJIrnoA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ar9oNlMoEJvIqeHnMdgth30HXR5fEOoiH++QBlsx399YZ9G3Bj+Z1AVvs6Aqei4cva0yMOY3MaKkUa/UVQc/A/WTNupekYcMNagOz67+Hyfz7mkqH2A+CAvErNkEA0oGJnou96m5MPBadayT2/rkvF3BcLTuoXUZA+HpqTUJCW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WzHNZ2nmWz1HJ1D;
	Wed,  4 Sep 2024 17:33:18 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id C7B7E1402C6;
	Wed,  4 Sep 2024 17:36:45 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Sep
 2024 17:36:45 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <vz@mleia.com>,
	<linux-gpio@vger.kernel.org>
CC: <zhangzekun11@huawei.com>
Subject: [PATCH v2 1/4] gpio: cadence: Use helper function devm_clk_get_enabled()
Date: Wed, 4 Sep 2024 17:23:08 +0800
Message-ID: <20240904092311.9544-2-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240904092311.9544-1-zhangzekun11@huawei.com>
References: <20240904092311.9544-1-zhangzekun11@huawei.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemf500003.china.huawei.com (7.202.181.241)

devm_clk_get() and clk_prepare_enable() can be replaced by helper
function devm_clk_get_enabled(). Let's use devm_clk_get_enabled() to
simplify code and avoid calling clk_disable_unprepare().

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 drivers/gpio/gpio-cadence.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-cadence.c b/drivers/gpio/gpio-cadence.c
index 6a439cf78459..1b8ffd0ddab6 100644
--- a/drivers/gpio/gpio-cadence.c
+++ b/drivers/gpio/gpio-cadence.c
@@ -31,7 +31,6 @@
 
 struct cdns_gpio_chip {
 	struct gpio_chip gc;
-	struct clk *pclk;
 	void __iomem *regs;
 	u32 bypass_orig;
 };
@@ -155,6 +154,7 @@ static int cdns_gpio_probe(struct platform_device *pdev)
 	int ret, irq;
 	u32 dir_prev;
 	u32 num_gpios = 32;
+	struct clk *clk;
 
 	cgpio = devm_kzalloc(&pdev->dev, sizeof(*cgpio), GFP_KERNEL);
 	if (!cgpio)
@@ -203,21 +203,14 @@ static int cdns_gpio_probe(struct platform_device *pdev)
 	cgpio->gc.request = cdns_gpio_request;
 	cgpio->gc.free = cdns_gpio_free;
 
-	cgpio->pclk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(cgpio->pclk)) {
-		ret = PTR_ERR(cgpio->pclk);
+	clk = devm_clk_get_enabled(&pdev->dev, NULL);
+	if (IS_ERR(clk)) {
+		ret = PTR_ERR(clk);
 		dev_err(&pdev->dev,
 			"Failed to retrieve peripheral clock, %d\n", ret);
 		goto err_revert_dir;
 	}
 
-	ret = clk_prepare_enable(cgpio->pclk);
-	if (ret) {
-		dev_err(&pdev->dev,
-			"Failed to enable the peripheral clock, %d\n", ret);
-		goto err_revert_dir;
-	}
-
 	/*
 	 * Optional irq_chip support
 	 */
@@ -234,7 +227,7 @@ static int cdns_gpio_probe(struct platform_device *pdev)
 					     GFP_KERNEL);
 		if (!girq->parents) {
 			ret = -ENOMEM;
-			goto err_disable_clk;
+			goto err_revert_dir;
 		}
 		girq->parents[0] = irq;
 		girq->default_type = IRQ_TYPE_NONE;
@@ -244,7 +237,7 @@ static int cdns_gpio_probe(struct platform_device *pdev)
 	ret = devm_gpiochip_add_data(&pdev->dev, &cgpio->gc, cgpio);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Could not register gpiochip, %d\n", ret);
-		goto err_disable_clk;
+		goto err_revert_dir;
 	}
 
 	cgpio->bypass_orig = ioread32(cgpio->regs + CDNS_GPIO_BYPASS_MODE);
@@ -259,9 +252,6 @@ static int cdns_gpio_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, cgpio);
 	return 0;
 
-err_disable_clk:
-	clk_disable_unprepare(cgpio->pclk);
-
 err_revert_dir:
 	iowrite32(dir_prev, cgpio->regs + CDNS_GPIO_DIRECTION_MODE);
 
@@ -273,7 +263,6 @@ static void cdns_gpio_remove(struct platform_device *pdev)
 	struct cdns_gpio_chip *cgpio = platform_get_drvdata(pdev);
 
 	iowrite32(cgpio->bypass_orig, cgpio->regs + CDNS_GPIO_BYPASS_MODE);
-	clk_disable_unprepare(cgpio->pclk);
 }
 
 static const struct of_device_id cdns_of_ids[] = {
-- 
2.17.1


