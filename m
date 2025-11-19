Return-Path: <linux-gpio+bounces-28813-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EC8C705EB
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 18:15:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 421194EE557
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 16:53:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E35D0307AD6;
	Wed, 19 Nov 2025 16:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BW05CQie"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5CC3043B2;
	Wed, 19 Nov 2025 16:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763571094; cv=none; b=paHlY+oZGm6b7j1T7gblCJZoOVm16kIpJ01rpZ/MUnSqpEIb8PlsEji5zS4tiknMYBjD8BmS2ZT/1eNxPxMGOkdTaJEle1Dv7OkAAXcKfmQAxlcnnuxtOyxidI2Z3CtzK03DS/shF3EwqqLxorMSEYpz0ERXmvVRCKfC3E1VNmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763571094; c=relaxed/simple;
	bh=DI/09/CPRQP8uNpe7E8yAQK0B+90Wi0+Sy091DCDiog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q21OZQBcudAxAI9XrcicmIoCkrM6NUxjUjTmCs8AQDOhsZx6yjP0IzuortPQdWoR1iMiiGGnH376U7VencOvQk1vlpwD2OA+hO9ACaj5JTgNQFK8v5dYJGwCbU5ngmsXxcPMGztOmrppdekadw+glgpcMjBJs2ImAhpSv+xVBJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BW05CQie; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3952AC116C6;
	Wed, 19 Nov 2025 16:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763571094;
	bh=DI/09/CPRQP8uNpe7E8yAQK0B+90Wi0+Sy091DCDiog=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BW05CQiekCujJ+DBChmUfIDvwC3HVGN89uSLlcAmC9Dg2TssDVC7wxDwfKqfHZqPx
	 TR2/n9i0whY9nCZjKPaPwD5Ykr/d1FPr9mDvAp70mjOeKBrAyRnt5NDH5OFxXAs40X
	 ilW9vL1Lg8a5F64VT1PS2kjKYlga4e7miHLpHWgM7CZKYNs4LuIdN91P0upbd8phhW
	 69r261Yxef5fY7ihSjtRZI+HGCPsIvP1eBLHQUzRjPAN77Djqe0UeDepk9bCnzthiH
	 +KJdqh4RPE2VOF9jsCXcuzwNz49ERKYNgmpnYVM0UxaJ+rptOXCxcKTgzdZvOisp4X
	 kqAwZqAl2YEZw==
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
Subject: [PATCH v4 03/15] gpio: htc-egpio: Use modern PM macros
Date: Thu, 20 Nov 2025 00:33:15 +0800
Message-ID: <20251119163327.16306-4-jszhang@kernel.org>
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


