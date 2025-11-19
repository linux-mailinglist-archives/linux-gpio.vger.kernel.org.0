Return-Path: <linux-gpio+bounces-28780-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DE232C6F9F7
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 16:21:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B93763C0DB2
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 15:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFF0B366DDD;
	Wed, 19 Nov 2025 15:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j6rtBjHK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC572C3244;
	Wed, 19 Nov 2025 15:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763564548; cv=none; b=rEgjJhs/cI1E2VdH//0W5vQ5flVB1hEc20HmuuSzhvouWegzFN01lud8G42C1RVHrKloOZ712+4ueZ6nlu0sIHW8I5CnvT+sNvuASZL5/YyJuRCS9fZ5Bi8tJXgvvIfPTBW3jnjPGXderB9Ck99yORHkTKSEN8BTxM1tF3NUtRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763564548; c=relaxed/simple;
	bh=ylQueHQq0vE869TT1EQhJyrzWInPZ0un96UL9qOXAPE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lg9/OLTBqXCyuNHkmsX5uFelkOluts3IWPW001zci6pWqhGJa0/3H+QVfv8vXW2aapVVYL/Ajr686q2fVC8LlgilyrtbUA7ROD/8W2brJpin4XHJHmlgkaM+1G6C7MHk2s8eIK90P/2ZCNy/tAk8ElbMTniXvJFIElCSdIbKrnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j6rtBjHK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D242BC19424;
	Wed, 19 Nov 2025 15:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763564548;
	bh=ylQueHQq0vE869TT1EQhJyrzWInPZ0un96UL9qOXAPE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j6rtBjHKND7phZMOqBW5X3diZ1CivRDJyE2Y5R/JFLTJ4Flq/XKWWKO/yXnTvbBJB
	 8tjK13NOuK5NjQfhBDjVVIsGPTBjJUhtD5REq5R6VrxDyepmb20fG5cfhLj8SPVzej
	 5V4xEFxme/mnFyWupRWuVRl60lxRr0dpALrWhkANFIeTQqLtN8rOBdtoUJB0XlMZS/
	 jMnrkVPnIqGbsKL4xuzYVRfEZOwy/V5g4l28L+YYrulWHbT+o6HMBupA48qFsfH2mk
	 i86hP+4YGcYYtY1zrJVofpeA4QET8mki+JWPeCWk1LoFa52x4/8EoYzkNS4oi/cU+n
	 lNmHYjBJ2zljg==
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
Subject: [PATCH v3 09/15] gpio: omap: Use modern PM macros
Date: Wed, 19 Nov 2025 22:43:21 +0800
Message-ID: <20251119144327.13345-10-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251119144327.13345-1-jszhang@kernel.org>
References: <20251119144327.13345-1-jszhang@kernel.org>
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


