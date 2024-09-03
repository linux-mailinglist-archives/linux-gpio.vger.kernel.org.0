Return-Path: <linux-gpio+bounces-9616-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 062EF9696E3
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 10:20:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 84683B23557
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 08:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABEC6205E07;
	Tue,  3 Sep 2024 08:20:07 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAEA201248
	for <linux-gpio@vger.kernel.org>; Tue,  3 Sep 2024 08:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725351607; cv=none; b=iZ5u7Mc3elqf+6kGYmkOSr51q7kC882id0CHRK48pb2Bv4Gm8xBBtZoOVeRtbVOsIzCG7NKQTwV6wFXwvWuUi/fMdlNlRqCBlE5jZe0umBIyekBPgNYL+Q/wPPwkgfUSQa1KK5A5Pv2p4+Cc1Ot2zn7CmiX9b7fVIK/cT5wVRGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725351607; c=relaxed/simple;
	bh=G8BfkIiGQV8P32DgaMEUvaXHgpxPG8R4uhjactVkhUI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sWl9U5rpP2zOiRbt3dC4QNddMFphO6ISuLharIpNMpatA6kYzYaq6x1Fnq6TOkH011KaWm4tcdujdoQNEpbRn5JvVpBajOiAwfStK5Zq9durywmfNw0uBg7Dnm/IiqbO5Yjj4Co3cvAgeNIUigu9yAeYVERiDmyZcs/MJXYkWkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4WydkW27x4z1HJ80;
	Tue,  3 Sep 2024 16:16:35 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 8BD5B1A0188;
	Tue,  3 Sep 2024 16:20:01 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 3 Sep
 2024 16:20:00 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <vz@mleia.com>,
	<linux-gpio@vger.kernel.org>
CC: <zhangzekun11@huawei.com>
Subject: [PATCH 4/4] gpio: xilinx: Use helper function devm_clk_get_enabled()
Date: Tue, 3 Sep 2024 16:06:27 +0800
Message-ID: <20240903080627.53652-5-zhangzekun11@huawei.com>
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


