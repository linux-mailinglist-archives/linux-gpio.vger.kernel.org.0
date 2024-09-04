Return-Path: <linux-gpio+bounces-9769-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D3496B6E5
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 11:37:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 27C5E1C21605
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Sep 2024 09:37:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66AC41CEEA3;
	Wed,  4 Sep 2024 09:36:51 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD9B189911
	for <linux-gpio@vger.kernel.org>; Wed,  4 Sep 2024 09:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.190
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725442611; cv=none; b=d+TLlAdYDG+I0zrXlSLCp7yDiDstgnXHW6xk2UFUglw3SRHxFPqy8lgPQlzdJ+3Q2flsUvo9R062iLe+Ku/tGZeeQA8Tc1J5w0aB0CQMfxRS/bjObsEnr1juJxPEQWAD6UNGbzN0k2uy0L0U1Dla6WqXfoFIOO8jcDMu7Ie6eFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725442611; c=relaxed/simple;
	bh=nBhRPB/A6MGWJZBH/ew9zHT19JeK7AOx8iAuqZ3vF8M=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AGaohg0ApEyl5WyqWIz4xoc1hTOFDZ+heZer8tcN64JchTHg+Ppj+MPGI7beshPk3/wZkLdVmxIlG6CigSNl7cCgi8AkmjikAZQ5DFiwNZNHIlCKCpSbAukGVh7htrYt1375oYA6UxtvRObbTRRazbzErWmS46/GfgNeZAbdpMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.190
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.234])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WzHLs2Pzmz20nK2;
	Wed,  4 Sep 2024 17:31:49 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 591A71402CC;
	Wed,  4 Sep 2024 17:36:46 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Sep
 2024 17:36:45 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <vz@mleia.com>,
	<linux-gpio@vger.kernel.org>
CC: <zhangzekun11@huawei.com>
Subject: [PATCH v2 2/4] gpio: lpc18xx: Use helper function devm_clk_get_enabled()
Date: Wed, 4 Sep 2024 17:23:09 +0800
Message-ID: <20240904092311.9544-3-zhangzekun11@huawei.com>
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
 drivers/gpio/gpio-lpc18xx.c | 23 ++++++-----------------
 1 file changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/gpio/gpio-lpc18xx.c b/drivers/gpio/gpio-lpc18xx.c
index 5c6bb57a8c99..e7c0ef6e54fa 100644
--- a/drivers/gpio/gpio-lpc18xx.c
+++ b/drivers/gpio/gpio-lpc18xx.c
@@ -47,7 +47,6 @@ struct lpc18xx_gpio_pin_ic {
 struct lpc18xx_gpio_chip {
 	struct gpio_chip gpio;
 	void __iomem *base;
-	struct clk *clk;
 	struct lpc18xx_gpio_pin_ic *pin_ic;
 	spinlock_t lock;
 };
@@ -328,6 +327,7 @@ static int lpc18xx_gpio_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct lpc18xx_gpio_chip *gc;
 	int index, ret;
+	struct clk *clk;
 
 	gc = devm_kzalloc(dev, sizeof(*gc), GFP_KERNEL);
 	if (!gc)
@@ -352,16 +352,10 @@ static int lpc18xx_gpio_probe(struct platform_device *pdev)
 	if (IS_ERR(gc->base))
 		return PTR_ERR(gc->base);
 
-	gc->clk = devm_clk_get(dev, NULL);
-	if (IS_ERR(gc->clk)) {
+	clk = devm_clk_get_enabled(dev, NULL);
+	if (IS_ERR(clk)) {
 		dev_err(dev, "input clock not found\n");
-		return PTR_ERR(gc->clk);
-	}
-
-	ret = clk_prepare_enable(gc->clk);
-	if (ret) {
-		dev_err(dev, "unable to enable clock\n");
-		return ret;
+		return PTR_ERR(clk);
 	}
 
 	spin_lock_init(&gc->lock);
@@ -369,11 +363,8 @@ static int lpc18xx_gpio_probe(struct platform_device *pdev)
 	gc->gpio.parent = dev;
 
 	ret = devm_gpiochip_add_data(dev, &gc->gpio, gc);
-	if (ret) {
-		dev_err(dev, "failed to add gpio chip\n");
-		clk_disable_unprepare(gc->clk);
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add gpio chip\n");
 
 	/* On error GPIO pin interrupt controller just won't be registered */
 	lpc18xx_gpio_pin_ic_probe(gc);
@@ -387,8 +378,6 @@ static void lpc18xx_gpio_remove(struct platform_device *pdev)
 
 	if (gc->pin_ic)
 		irq_domain_remove(gc->pin_ic->domain);
-
-	clk_disable_unprepare(gc->clk);
 }
 
 static const struct of_device_id lpc18xx_gpio_match[] = {
-- 
2.17.1


