Return-Path: <linux-gpio+bounces-9614-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F24F49696E0
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 10:20:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 313BC1C238C4
	for <lists+linux-gpio@lfdr.de>; Tue,  3 Sep 2024 08:20:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A04F201279;
	Tue,  3 Sep 2024 08:20:06 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A9419C562
	for <linux-gpio@vger.kernel.org>; Tue,  3 Sep 2024 08:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725351606; cv=none; b=uZiy3uY2/z6mAz/7XClroAYwnnyQ5LQEH7+COET9hEDP9hFLJZD8cco8NCm7Qgqok/ZmSTSMwCA1E7ciXiyQnqnBFjGbEWpk2nLhp7lvIUUJM/qElpvGbJ38IudZMREeQjdN3V8PggIJBVI3xS0gjpC0I6EubLuRjSU+WA4Nyhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725351606; c=relaxed/simple;
	bh=BmF0oMaxHQcXR8aL7cfftPtnHhFxT2xqIMXf7hdZyJ0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Y0aWGCqGwOTnp+2IDlSbHvSmX6F0jA35/ZU7q27pGdFEFYB1QoYrQaNV7QUYbK69FeyRZRr5oUqxMY4TwB7aS7WIK1lDgS2I6Vwm3rgiP3avdAA+YC8t2yCYFAcKTuXHq1F/we5W2g8UQNYX8E3chdvu2a62CMt2hE9fAI+WaCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Wydhm5BkRz69Xd;
	Tue,  3 Sep 2024 16:15:04 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 076AA1402CC;
	Tue,  3 Sep 2024 16:20:01 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 3 Sep
 2024 16:20:00 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <vz@mleia.com>,
	<linux-gpio@vger.kernel.org>
CC: <zhangzekun11@huawei.com>
Subject: [PATCH 3/4] gpio: mb86s7x: Use helper function devm_clk_get_enabled()
Date: Tue, 3 Sep 2024 16:06:26 +0800
Message-ID: <20240903080627.53652-4-zhangzekun11@huawei.com>
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
 drivers/gpio/gpio-mb86s7x.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-mb86s7x.c b/drivers/gpio/gpio-mb86s7x.c
index 7fb298b4571b..ccbb63c21d6f 100644
--- a/drivers/gpio/gpio-mb86s7x.c
+++ b/drivers/gpio/gpio-mb86s7x.c
@@ -35,7 +35,6 @@
 struct mb86s70_gpio_chip {
 	struct gpio_chip gc;
 	void __iomem *base;
-	struct clk *clk;
 	spinlock_t lock;
 };
 
@@ -157,6 +156,7 @@ static int mb86s70_gpio_to_irq(struct gpio_chip *gc, unsigned int offset)
 static int mb86s70_gpio_probe(struct platform_device *pdev)
 {
 	struct mb86s70_gpio_chip *gchip;
+	struct clk *clk;
 	int ret;
 
 	gchip = devm_kzalloc(&pdev->dev, sizeof(*gchip), GFP_KERNEL);
@@ -169,13 +169,9 @@ static int mb86s70_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(gchip->base))
 		return PTR_ERR(gchip->base);
 
-	gchip->clk = devm_clk_get_optional(&pdev->dev, NULL);
-	if (IS_ERR(gchip->clk))
-		return PTR_ERR(gchip->clk);
-
-	ret = clk_prepare_enable(gchip->clk);
-	if (ret)
-		return ret;
+	clk = devm_clk_get_optional_enabled(&pdev->dev, NULL);
+	if (IS_ERR(clk))
+		return PTR_ERR(clk);
 
 	spin_lock_init(&gchip->lock);
 
@@ -193,11 +189,9 @@ static int mb86s70_gpio_probe(struct platform_device *pdev)
 	gchip->gc.base = -1;
 
 	ret = gpiochip_add_data(&gchip->gc, gchip);
-	if (ret) {
-		dev_err(&pdev->dev, "couldn't register gpio driver\n");
-		clk_disable_unprepare(gchip->clk);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "couldn't register gpio driver\n");
 
 	acpi_gpiochip_request_interrupts(&gchip->gc);
 
@@ -210,7 +204,6 @@ static void mb86s70_gpio_remove(struct platform_device *pdev)
 
 	acpi_gpiochip_free_interrupts(&gchip->gc);
 	gpiochip_remove(&gchip->gc);
-	clk_disable_unprepare(gchip->clk);
 }
 
 static const struct of_device_id mb86s70_gpio_dt_ids[] = {
-- 
2.17.1


