Return-Path: <linux-gpio+bounces-9613-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5720A9696DF
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 10:20:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 899ED1C23925
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 08:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A985201276;
	Tue,  3 Sep 2024 08:20:05 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778521D67AC
	for <linux-gpio@vger.kernel.org>; Tue,  3 Sep 2024 08:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725351605; cv=none; b=up+CwE0hLddsodZB2p0DVwosfHaJjo8CXkxqE0O7TWsSyJBIPKQETRFXXf1STanyyXOKfPCbHx0BMW05XU4JMNZXTAHNMHSRQ0cfXNjDnwpMn9+KCMt3TnptrFv03vjO8v4MUywZr0NZqFDCLRGgzlF18iC63NC4JpUC12b0t+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725351605; c=relaxed/simple;
	bh=afQ+r20bE1hZSsnheHCvqeE8vwKMkWi6rg8PfJIrnoA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Q2jBGOjSug/nafhRN3iSD0c5c8ni5xxNt+i0Rya03PuCYUxLTIjPApJt7AdzTFc1u5CFgHTiCCRClbKjSN9Q3LqviVbvCJV7SfmnSc2LV9+36X+liyGkc+zarnXnJGYc4xHd1WN0VQVqH3NGcIOeq6tmFw8vyRuRNcBqtw2KJGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Wydm11xCYzgYw5;
	Tue,  3 Sep 2024 16:17:53 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id EEBF61800A0;
	Tue,  3 Sep 2024 16:19:59 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 3 Sep
 2024 16:19:59 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <vz@mleia.com>,
	<linux-gpio@vger.kernel.org>
CC: <zhangzekun11@huawei.com>
Subject: [PATCH 1/4] gpio: cadence: Use helper function devm_clk_get_enabled()
Date: Tue, 3 Sep 2024 16:06:24 +0800
Message-ID: <20240903080627.53652-2-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240903080627.53652-1-zhangzekun11@huawei.com>
References: <20240903080627.53652-1-zhangzekun11@huawei.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
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


