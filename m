Return-Path: <linux-gpio+bounces-28631-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3C9C66BEC
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 01:56:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 50FC2362A98
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 00:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 855543254A9;
	Tue, 18 Nov 2025 00:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fSDicQY2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A35E280A5C;
	Tue, 18 Nov 2025 00:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763427089; cv=none; b=boxoL5LHdeCu+mULy5wBU4p2jMgjdHVwOEiK6LZ0hV4piWiw3ngVadF+cnfuc80PT7s1l18tuGnse+d4evgTFs4lPxwyJwE21wNk1rsBfBNPLq18f2tSl7g+iFGb9fcUcguBaIUwLgQLdWjQkbMerLINkKmeb2hlnWHHOmMGVOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763427089; c=relaxed/simple;
	bh=VPRuMvDGj7ds9h4LXc+zNbk2IceZVhyaJoduENnSGiE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UT2DQFtea+BqyU/CWeP2ZqZdnJw95uSz+hC5qDcZ1xHed0NFHYe9pQk03TgaEJ3UXPc13yYGmYhXcfTzOHnpNlPr0KV+3TJV0SVx2GiEFAZDFLFcANY3WO0Q4S0ir8ElNT78apQEJ2oFqRw8cOBdV4c/x+Wm8fTc/MlTq7TxkXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fSDicQY2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09793C2BCC7;
	Tue, 18 Nov 2025 00:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763427088;
	bh=VPRuMvDGj7ds9h4LXc+zNbk2IceZVhyaJoduENnSGiE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fSDicQY2z7Tn6m96WCY5+zbuY2fv5IxP19yHIjp5HSGY7UT+ztJiObDpY/da70mTo
	 FcoP+CDp1deilWwXcGLrKXUZal1ZWAKf/95OXLDZvxwsC/kFsjMH3wNk91ijSaYY+d
	 lxUzR3DmDN+scmGAr1ipC6oBCDOc6T8f5pd/i3MQejXsf9oTPTkTL8WRfcE96RIKhE
	 NUZVoGLKwHB4MwGUx0+Go9Kv0oAcpapWHKyqBSl9Ax/5Bg5DFlTP/j/GmUyZ1yj6dX
	 O76V4Fv+UALyEkwOcQttDHugvYiKE5IU75ykb0SYstiWwpHEBRnHCQVLan76StYWR6
	 YGn9hKcG4Cf4w==
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
Subject: [PATCH v2 12/15] gpio: uniphier: Use modern PM macros
Date: Tue, 18 Nov 2025 08:32:26 +0800
Message-ID: <20251118003229.26636-13-jszhang@kernel.org>
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
 drivers/gpio/gpio-uniphier.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-uniphier.c b/drivers/gpio/gpio-uniphier.c
index 197bb1d22b3c..0574dde5b5bb 100644
--- a/drivers/gpio/gpio-uniphier.c
+++ b/drivers/gpio/gpio-uniphier.c
@@ -426,7 +426,7 @@ static void uniphier_gpio_remove(struct platform_device *pdev)
 	irq_domain_remove(priv->domain);
 }
 
-static int __maybe_unused uniphier_gpio_suspend(struct device *dev)
+static int uniphier_gpio_suspend(struct device *dev)
 {
 	struct uniphier_gpio_priv *priv = dev_get_drvdata(dev);
 	unsigned int nbanks = uniphier_gpio_get_nbanks(priv->chip.ngpio);
@@ -448,7 +448,7 @@ static int __maybe_unused uniphier_gpio_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused uniphier_gpio_resume(struct device *dev)
+static int uniphier_gpio_resume(struct device *dev)
 {
 	struct uniphier_gpio_priv *priv = dev_get_drvdata(dev);
 	unsigned int nbanks = uniphier_gpio_get_nbanks(priv->chip.ngpio);
@@ -473,8 +473,7 @@ static int __maybe_unused uniphier_gpio_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops uniphier_gpio_pm_ops = {
-	SET_LATE_SYSTEM_SLEEP_PM_OPS(uniphier_gpio_suspend,
-				     uniphier_gpio_resume)
+	LATE_SYSTEM_SLEEP_PM_OPS(uniphier_gpio_suspend, uniphier_gpio_resume)
 };
 
 static const struct of_device_id uniphier_gpio_match[] = {
@@ -489,7 +488,7 @@ static struct platform_driver uniphier_gpio_driver = {
 	.driver = {
 		.name = "uniphier-gpio",
 		.of_match_table = uniphier_gpio_match,
-		.pm = &uniphier_gpio_pm_ops,
+		.pm = pm_sleep_ptr(&uniphier_gpio_pm_ops),
 	},
 };
 module_platform_driver(uniphier_gpio_driver);
-- 
2.51.0


