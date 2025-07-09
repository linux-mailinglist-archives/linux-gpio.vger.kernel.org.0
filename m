Return-Path: <linux-gpio+bounces-23034-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B67A6AFF104
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 20:44:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A577618924C0
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Jul 2025 18:44:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54AA623A9AB;
	Wed,  9 Jul 2025 18:44:04 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2785A21B8FE;
	Wed,  9 Jul 2025 18:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752086644; cv=none; b=O4Nr52jbdYoHyMB1qgvdsTkjI/YMo80eCYzxV50nPzh0nXxFbsMhET4sHi3vekb1cPi5OW/DQkpyUN95oC96Y1dWrXL5b9PEbGFX5Y7UeXngM2Q4b4nrp9np5bNseSz3NtBHR5RJkHnNaG8PwcRux4cXdglwJDxGwjHH7zZ5oOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752086644; c=relaxed/simple;
	bh=NaamJAiQ/uPd2cn/PhgvymbWIOuMwRjtrg10NpXj0ms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wre7FigRAu9T7dHoO96L9A5GdIhnLSEgMCHR7uKL2APNWv2hO8NCQE9NU5zkLX8gXECem67dUQ4R302WGyDhOStGSArbbnkoAks3+Zm9qsc+uT1w/se3O/WkK73HM27nQWwCEFc4ZZZAi6DhEhN9ur2ZN+sh3UZdOI2/O/K5cbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 374C8C4CEEF;
	Wed,  9 Jul 2025 18:44:02 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-gpio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: rcar: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
Date: Wed,  9 Jul 2025 20:43:59 +0200
Message-ID: <e201140426daacaa799d73e2f76bfd96b6f5718f.1752086619.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Renesas R-Car GPIO driver from SIMPLE_DEV_PM_OPS() to
DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr().  This lets us drop the
check for CONFIG_PM_SLEEP, and reduces kernel size in case CONFIG_PM or
CONFIG_PM_SLEEP is disabled, while increasing build coverage.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpio-rcar.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-rcar.c b/drivers/gpio/gpio-rcar.c
index 1d121a4275905e09..cd31580effa9037f 100644
--- a/drivers/gpio/gpio-rcar.c
+++ b/drivers/gpio/gpio-rcar.c
@@ -592,7 +592,6 @@ static void gpio_rcar_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int gpio_rcar_suspend(struct device *dev)
 {
 	struct gpio_rcar_priv *p = dev_get_drvdata(dev);
@@ -651,16 +650,16 @@ static int gpio_rcar_resume(struct device *dev)
 
 	return 0;
 }
-#endif /* CONFIG_PM_SLEEP*/
 
-static SIMPLE_DEV_PM_OPS(gpio_rcar_pm_ops, gpio_rcar_suspend, gpio_rcar_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(gpio_rcar_pm_ops, gpio_rcar_suspend,
+				gpio_rcar_resume);
 
 static struct platform_driver gpio_rcar_device_driver = {
 	.probe		= gpio_rcar_probe,
 	.remove		= gpio_rcar_remove,
 	.driver		= {
 		.name	= "gpio_rcar",
-		.pm     = &gpio_rcar_pm_ops,
+		.pm     = pm_sleep_ptr(&gpio_rcar_pm_ops),
 		.of_match_table = gpio_rcar_of_table,
 	}
 };
-- 
2.43.0


