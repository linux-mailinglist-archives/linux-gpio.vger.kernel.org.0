Return-Path: <linux-gpio+bounces-28628-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A478CC66BB0
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 01:54:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 96357363DD1
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 00:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C740F2F6933;
	Tue, 18 Nov 2025 00:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iVNmI0Ip"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5912FC876;
	Tue, 18 Nov 2025 00:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763427073; cv=none; b=mho3gARvXW+iitxatrxEbIwx7dpQeDz137xtf1xk/QoH2r+X5GiLogersnfSvoUHXL3JIpiilZXvX02k5IRQtGbxroXg9T+y43/GMTYtGfs3AwrY7MbC31lqG1XcVf9uSniRDVxAcKTHvoRKXjuCe1+2QDuuQF6L4wKj38jlMyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763427073; c=relaxed/simple;
	bh=uBYzXnNEL/J0rcqGNMQx7tTaHWYqsTP86ap/m0VE1lU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y2ZfyBk3CnINPkkaS3EO9gEeoZcFnUlyCNFT46oYs6J5dULHfGWCqZ6NlJA319wPw1glBrxPqZPam2l3Mdl088UDF5JojT3IWUojnK92MAKXo15oqzJYv4Z6PPCi56gtsekmvsp0x0G560xoLQPB03GHGWmslj1nxU1Dyjfz2MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iVNmI0Ip; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09E31C19421;
	Tue, 18 Nov 2025 00:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763427072;
	bh=uBYzXnNEL/J0rcqGNMQx7tTaHWYqsTP86ap/m0VE1lU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iVNmI0IpY2egn1YXzFocw0Bhlr6eNxhOjrYPQ7WesAekIoWGhmCIiF2Ej5UdMa1je
	 JoOzZuu7t/jHIyvCApCDIihRJTGNtrO7B9sP0eZv/CKMh4m4aufVWm2mKUxW1dBv2K
	 vT3H0NXuKBD6lNywEcRumVCHRmJMjCRrp8lLELmQXtXKKs3pLlOlOsNFaSwhK9TNVN
	 5G2u8c0hxUQz+Lenz4HpNltlT+GV17Q0rd97mHZ8nW3EnpqjUoR5/9MlqDn8/iJSjO
	 H9ZA9xyWWyRjCoJnlIiKyF/WiqcxAz0gID5Jr+3mguGj6UU+8+fElYrTsnLdY17wj4
	 KeEaV76HcJ6mw==
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
Subject: [PATCH v2 09/15] gpio: omap: Use modern PM macros
Date: Tue, 18 Nov 2025 08:32:23 +0800
Message-ID: <20251118003229.26636-10-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251118003229.26636-1-jszhang@kernel.org>
References: <20251118003229.26636-1-jszhang@kernel.org>
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


