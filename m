Return-Path: <linux-gpio+bounces-28774-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF91C6F8E2
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 16:10:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 50E184FD942
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 15:02:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CD6728C5B1;
	Wed, 19 Nov 2025 15:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KgkIqwiy"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8252153BE9;
	Wed, 19 Nov 2025 15:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763564506; cv=none; b=qUInjH4M6ie8slcA6ouTZ60YTpOjMX8D4ArXd+8avLtJzOaVYhRTRDPTevN+0DsAHuKN6UXcgLNsH76vwOdyqVpFfb2xBaEK7syTje/I8f4v9b0HbMt/v+hB7JgzTf00jQkn1sWEqohxJgc5HnpUlYGxGXPK/mniWPecTBvbWg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763564506; c=relaxed/simple;
	bh=DI/09/CPRQP8uNpe7E8yAQK0B+90Wi0+Sy091DCDiog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YWFdntAJK3zl+9Eirzto8RunSxjrOT+41RvOlgsJ63vfwvIKyU63wCvwPnn5AorZacYl84zuv2U9GUs5lq7D+4CpTptaiz9+usovuE8VoOHPINPxr9B0sPtLeZ7r60nmaxjNp0z7PO2qI/6pxODvBSIT0ZsiyD6/fV3Ul/y5WPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KgkIqwiy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A102C2BCB1;
	Wed, 19 Nov 2025 15:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763564506;
	bh=DI/09/CPRQP8uNpe7E8yAQK0B+90Wi0+Sy091DCDiog=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KgkIqwiyXSW16mLtBlHhk1qG1iZADqoFq6vuMHGdfV47AKp3EKGgmTpvW/j9SI3PO
	 eyZWOM6NGrRsaHtHjo3mvp7oX8u0XqvJiSYmlqJ7V0WxpLVuI9/OYdyLn6sTioC2bA
	 EqBYU2KDTtcBpbFkSloadk22H2SSRmChuzmMGsJ2iisbXQ+msrkQOO5ORZk4xo4yNy
	 ke/Z/biJBlr87rfRPOg8Ywjma7/F7S9zRFwc0l07OnlL9OqzEAvCamHsUFPfxXUdhi
	 LeB6a7bTI8qra2xMWQ7bkCK9cB+ReJ94goCGGs9hl1gEbGdOOoUsyTz2yfUhmjwxLy
	 n+QllIMNiarRw==
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
Subject: [PATCH v3 03/15] gpio: htc-egpio: Use modern PM macros
Date: Wed, 19 Nov 2025 22:43:15 +0800
Message-ID: <20251119144327.13345-4-jszhang@kernel.org>
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
CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/gpio/gpio-htc-egpio.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-htc-egpio.c b/drivers/gpio/gpio-htc-egpio.c
index 2eaed83214d8..72935d6dbebf 100644
--- a/drivers/gpio/gpio-htc-egpio.c
+++ b/drivers/gpio/gpio-htc-egpio.c
@@ -364,21 +364,20 @@ static int __init egpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM
-static int egpio_suspend(struct platform_device *pdev, pm_message_t state)
+static int egpio_suspend(struct device *dev)
 {
-	struct egpio_info *ei = platform_get_drvdata(pdev);
+	struct egpio_info *ei = dev_get_drvdata(dev);
 
-	if (ei->chained_irq && device_may_wakeup(&pdev->dev))
+	if (ei->chained_irq && device_may_wakeup(dev))
 		enable_irq_wake(ei->chained_irq);
 	return 0;
 }
 
-static int egpio_resume(struct platform_device *pdev)
+static int egpio_resume(struct device *dev)
 {
-	struct egpio_info *ei = platform_get_drvdata(pdev);
+	struct egpio_info *ei = dev_get_drvdata(dev);
 
-	if (ei->chained_irq && device_may_wakeup(&pdev->dev))
+	if (ei->chained_irq && device_may_wakeup(dev))
 		disable_irq_wake(ei->chained_irq);
 
 	/* Update registers from the cache, in case
@@ -386,19 +385,15 @@ static int egpio_resume(struct platform_device *pdev)
 	egpio_write_cache(ei);
 	return 0;
 }
-#else
-#define egpio_suspend NULL
-#define egpio_resume NULL
-#endif
 
+static DEFINE_SIMPLE_DEV_PM_OPS(egpio_pm_ops, egpio_suspend, egpio_resume);
 
 static struct platform_driver egpio_driver = {
 	.driver = {
 		.name = "htc-egpio",
 		.suppress_bind_attrs = true,
+		.pm = pm_sleep_ptr(&egpio_pm_ops),
 	},
-	.suspend      = egpio_suspend,
-	.resume       = egpio_resume,
 };
 
 static int __init egpio_init(void)
-- 
2.51.0


