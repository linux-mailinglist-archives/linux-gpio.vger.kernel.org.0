Return-Path: <linux-gpio+bounces-28987-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B9060C7EB0B
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 01:39:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDC343A5104
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 00:39:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8459518D65C;
	Mon, 24 Nov 2025 00:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N3GUd97s"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3976E70809;
	Mon, 24 Nov 2025 00:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763944752; cv=none; b=CNvzBXIG5fJ7PgbdJ+fL42FoZADK/rux1AI9+f+HLyr7swtVsuyvBsVvebhya8vA12YhGi5CxCQDtSB6M6P3ErzHJXTvrSNOh/3UBuX7Nk6eympXHcid5WuxfRh1k6avyRea9iwQM0Cn7fIPd1ctHOX+1jq4sBu1mr0wRWOvcIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763944752; c=relaxed/simple;
	bh=UkCi6spCoGBukorZ8+mAQyPnpIaXJp83L7Ud7SQYBdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FiWtcVExFSKvPNID0Epq+0/7VNnqvS55zEpuHDqSvwGFDRTWQHfxFPu//ZKy2BwaeuIKIL1jIqQ5vgJ7NXK0koMs4d0+73ESTCkmgVH3UaLBHky8qddJe/2h+C8nmqzE10StTB5Yn05ZiX/lvESMkEGbBvjeLizxfvbBqd4hB4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N3GUd97s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34A8DC116D0;
	Mon, 24 Nov 2025 00:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763944752;
	bh=UkCi6spCoGBukorZ8+mAQyPnpIaXJp83L7Ud7SQYBdU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N3GUd97s11C65b3B4qczTaFB/BDMk6u89hqkuACWfPDSZ3+08hQ2INkLoJHrLPy0t
	 wasnmNO3N1CwHmTIkXszdhHaE/81lep+7ox6CPjXOuk5Ou8IMZdu1IbVDvUKYgz8oG
	 HenuTddNMXOJ3La6mK0vOeSO94jPeuIZdOKsE+dFY0o8d9PX3E/EtkGm/fFqXtcDe2
	 4MWqyhZ1Da3wE+HF+gEP82L/BGOFd87sNyDBS7RHLx/gKDRsExDLYezWNfvsCgQKxp
	 mXvwTySfWeIxGcvWH5GGDHyxWixrI5rMgVKSuNlCtHU9uNHh0lKT5vLc/RSx8dTEZx
	 ORfGozdp9b4jQ==
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
	linux-omap@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v5 03/14] gpio: htc-egpio: Use modern PM macros
Date: Mon, 24 Nov 2025 08:20:54 +0800
Message-ID: <20251124002105.25429-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251124002105.25429-1-jszhang@kernel.org>
References: <20251124002105.25429-1-jszhang@kernel.org>
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
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
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


