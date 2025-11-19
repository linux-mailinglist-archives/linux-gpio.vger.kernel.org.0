Return-Path: <linux-gpio+bounces-28819-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C57DC704D4
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 18:04:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3E5CF3C4166
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 16:56:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B9A5366548;
	Wed, 19 Nov 2025 16:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jnfUFH7b"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F85301002;
	Wed, 19 Nov 2025 16:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763571120; cv=none; b=PfSt/4E33COly6MAA8XuRvylve9JvLCKTG8TMS/1f85lHwoFPo6vr1a8MJxyDm67eDsKsa53V3bOTAQLTtw9b8qNINmPpVMfMFO2Cnwt/bomTCDpdncgdXkjvPi4lYBEoc7P5l5uS/VxdjzXQyvhFwmwd8nEL6V3ak1dJwwBJcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763571120; c=relaxed/simple;
	bh=ylQueHQq0vE869TT1EQhJyrzWInPZ0un96UL9qOXAPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YQWH0jR4OVDH2d7g2n8bbe2gL6XX4usX42CTSmr695InJIw1WAtxDlqV6CQenitFnjUti8G4qMen6pZkrdpmRfT97G/iBwchpSdcdz0NEbPYU5VHGM5vqWv5vqLVxLdKam+0URtdUXvmcJPxpNqxl5q0pvRMdu2Iw+qvgGYFIgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jnfUFH7b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A57CDC116B1;
	Wed, 19 Nov 2025 16:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763571119;
	bh=ylQueHQq0vE869TT1EQhJyrzWInPZ0un96UL9qOXAPE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jnfUFH7bCDMpjoAy7UZiCRZp1tbM63OJHTgBv01qYSViy40CfvNVH4o8iuF7ovE5T
	 cw8EEdTkizq6dUdG0yrKXtj46JQAB9Gpotj2dYqW5IwD1Hlt2zJh+jmAxM63UBKV8x
	 /3USsajeoAyaCxHzULgSehXi2Qyfuqf0LY7crOYOUDszPH8ChSOitXZu27eBr7wDq0
	 s2+wIgxiJruNI7I6rwB/5snPPOzwh+N5TqWi/ZR6fPlyU7+5g7G9+zNYv6Td/R2al3
	 7l7EqT8R4T0Y55xUiGS/mScqyFSAXNa4j6/Ivt73gMWV7WsDw2Cjdfkbw6A4E7Lhqn
	 XMt0mXPSeifrg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH v4 09/15] gpio: omap: Use modern PM macros
Date: Thu, 20 Nov 2025 00:33:21 +0800
Message-ID: <20251119163327.16306-10-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251119163327.16306-1-jszhang@kernel.org>
References: <20251119163327.16306-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use the modern PM macros for the suspend and resume functions to be
automatically dropped by the compiler when CONFIG_PM or
CONFIG_PM_SLEEP are disabled, without having to use __maybe_unused

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-omap.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index a268c76bdca6..e136e81794df 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -1503,7 +1503,7 @@ static void omap_gpio_remove(struct platform_device *pdev)
 		clk_unprepare(bank->dbck);
 }
 
-static int __maybe_unused omap_gpio_runtime_suspend(struct device *dev)
+static int omap_gpio_runtime_suspend(struct device *dev)
 {
 	struct gpio_bank *bank = dev_get_drvdata(dev);
 	unsigned long flags;
@@ -1516,7 +1516,7 @@ static int __maybe_unused omap_gpio_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused omap_gpio_runtime_resume(struct device *dev)
+static int omap_gpio_runtime_resume(struct device *dev)
 {
 	struct gpio_bank *bank = dev_get_drvdata(dev);
 	unsigned long flags;
@@ -1529,7 +1529,7 @@ static int __maybe_unused omap_gpio_runtime_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused omap_gpio_suspend(struct device *dev)
+static int omap_gpio_suspend(struct device *dev)
 {
 	struct gpio_bank *bank = dev_get_drvdata(dev);
 
@@ -1541,7 +1541,7 @@ static int __maybe_unused omap_gpio_suspend(struct device *dev)
 	return omap_gpio_runtime_suspend(dev);
 }
 
-static int __maybe_unused omap_gpio_resume(struct device *dev)
+static int omap_gpio_resume(struct device *dev)
 {
 	struct gpio_bank *bank = dev_get_drvdata(dev);
 
@@ -1554,9 +1554,8 @@ static int __maybe_unused omap_gpio_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops gpio_pm_ops = {
-	SET_RUNTIME_PM_OPS(omap_gpio_runtime_suspend, omap_gpio_runtime_resume,
-									NULL)
-	SET_LATE_SYSTEM_SLEEP_PM_OPS(omap_gpio_suspend, omap_gpio_resume)
+	RUNTIME_PM_OPS(omap_gpio_runtime_suspend, omap_gpio_runtime_resume, NULL)
+	LATE_SYSTEM_SLEEP_PM_OPS(omap_gpio_suspend, omap_gpio_resume)
 };
 
 static struct platform_driver omap_gpio_driver = {
@@ -1564,7 +1563,7 @@ static struct platform_driver omap_gpio_driver = {
 	.remove		= omap_gpio_remove,
 	.driver		= {
 		.name	= "omap_gpio",
-		.pm	= &gpio_pm_ops,
+		.pm	= pm_ptr(&gpio_pm_ops),
 		.of_match_table = omap_gpio_match,
 	},
 };
-- 
2.51.0


