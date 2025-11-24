Return-Path: <linux-gpio+bounces-28992-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C9410C7EB35
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 01:40:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5795D344B66
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 00:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34AD01DA60F;
	Mon, 24 Nov 2025 00:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s/krqGe0"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE41678F2F;
	Mon, 24 Nov 2025 00:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763944774; cv=none; b=n4MjhEJQut6sgxY6pl+f4HjDiRKlYSP09D8ghInYhCnybm0YQM1L3SW+YcJ+QnJ1dfeKx5SlPGmbJ2dowyS+U5BnJ4OfEoUbEWMUxuBW87jwtUtgaWIXXwZD/Gz6gIWWqpH/8UHtrlu3EoX7HssZPelY9qPUl2T4+CQAF/MtOEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763944774; c=relaxed/simple;
	bh=kv6Bgi1yHxmGklUE6nerjA6CCGgjdEkA/o1x5keS5d8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K1+JCGYed6uXoQ9ldMKAHO2HgAb7Rwi7QU7eAst7Xx3+5U+Rxtzh/4oiHozpSguOHv3F8rUXi9FQjmm41GspTM7y2TIbairdOJ4wPi1aojjihqTRjKKX5DfKaa4s2NvNIiizXQKi0HVylj95fG6kjwz9xkzaryQ/bZH3BXMSZDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s/krqGe0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1D09C16AAE;
	Mon, 24 Nov 2025 00:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763944773;
	bh=kv6Bgi1yHxmGklUE6nerjA6CCGgjdEkA/o1x5keS5d8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s/krqGe0C/3dVgHPgzKZTe9NmR3K+fYdHcNmadEUxWvbr1oEL6bwTSPhgPhdGL38v
	 OiYsZhWKtpCTvJfHlnfNVNi5KsnPZ7IbJ7aHApScsgj+0AR47MAxv6ZuGTZbLJMe5b
	 EpJChbkTKtzgZID60bqSRJU687UietN7qBk1H8bRr2NDNyNgRJL3uCG33VD7sFn0pF
	 0gOtoM0g5s0aBhTk1+4vc/0/FXtp7iNoZA0qsyUf8y6n7ft+KomRySc0Rq7sfOSxXB
	 Icv30oTHAvObuLWKTAVfvdlT77xwv2gAmLbnmm2Q10Y6ln0+r72iEFu7bLqSBeFARz
	 lWaWByG3eY0sw==
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
Subject: [PATCH v5 08/14] gpio: omap: Use modern PM macros
Date: Mon, 24 Nov 2025 08:20:59 +0800
Message-ID: <20251124002105.25429-9-jszhang@kernel.org>
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
CONFIG_PM_SLEEP are disabled, without having to use __maybe_unused

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
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


