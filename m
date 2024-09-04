Return-Path: <linux-gpio+bounces-9772-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C9C96B6EA
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 11:37:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 962B71C203E6
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 09:37:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10FF71CF5FB;
	Wed,  4 Sep 2024 09:36:55 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B131CF5D3
	for <linux-gpio@vger.kernel.org>; Wed,  4 Sep 2024 09:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725442614; cv=none; b=ulux7BnM0K4yESuAYHb8zsfheOG/l637Dqpe48IjmBPgjm9o6rIrHxOX5vYyoz/osB8+hSk1jRijOTUEnzpU1myUIepJopqCEWEiURqGnYBcvKYsT5e4pzXKy3Fj9IVGgiEoIwWFYTNhSksRVxwLVEIJITfsFmNAe9BlCuDM9fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725442614; c=relaxed/simple;
	bh=CD55yfZlnP1jMSLGd5ANfSngXSjrsXH240hVY5QEa9Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T93+N3mZJRWCgI3nyONu3r6lJ25QxvgUcAKEBqfHj+IDdCm4E0DSN1Du5XLK/63WgDUA/u/hCTiPxyUdEjsR1jWfa7uhgsC7wC8RIoT0qCoYCaRPcscFkO4hywsEWTuIHeLw9YsrqjRGFB03/D5h4diQaCt8wxMLeb8ere/HqiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4WzHLs7254z69NB;
	Wed,  4 Sep 2024 17:31:49 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 6C82E14011A;
	Wed,  4 Sep 2024 17:36:47 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Sep
 2024 17:36:46 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <vz@mleia.com>,
	<linux-gpio@vger.kernel.org>
CC: <zhangzekun11@huawei.com>
Subject: [PATCH v2 4/4] gpio: xilinx: Use helper function devm_clk_get_optional_enabled()
Date: Wed, 4 Sep 2024 17:23:11 +0800
Message-ID: <20240904092311.9544-5-zhangzekun11@huawei.com>
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

devm_clk_get_optional() and clk_prepare_enable() can be replaced by helper
function devm_clk_get_optional_enabled(). Let's simplify code with use of
devm_clk_get_optional_enabled() and avoid calling clk_disable_unprepare().

Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
v2: Fix mistakes in commit message.

 drivers/gpio/gpio-xilinx.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 7348df385198..afcf432a1573 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -333,12 +333,9 @@ static int __maybe_unused xgpio_suspend(struct device *dev)
  */
 static void xgpio_remove(struct platform_device *pdev)
 {
-	struct xgpio_instance *gpio = platform_get_drvdata(pdev);
-
 	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
-	clk_disable_unprepare(gpio->clk);
 }
 
 /**
@@ -644,15 +641,10 @@ static int xgpio_probe(struct platform_device *pdev)
 		return PTR_ERR(chip->regs);
 	}
 
-	chip->clk = devm_clk_get_optional(&pdev->dev, NULL);
+	chip->clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
 	if (IS_ERR(chip->clk))
 		return dev_err_probe(&pdev->dev, PTR_ERR(chip->clk), "input clock not found.\n");
 
-	status = clk_prepare_enable(chip->clk);
-	if (status < 0) {
-		dev_err(&pdev->dev, "Failed to prepare clk\n");
-		return status;
-	}
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
@@ -699,7 +691,6 @@ static int xgpio_probe(struct platform_device *pdev)
 err_pm_put:
 	pm_runtime_disable(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
-	clk_disable_unprepare(chip->clk);
 	return status;
 }
 
-- 
2.17.1


