Return-Path: <linux-gpio+bounces-24647-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0360BB2E1CD
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 18:06:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F5135E4D65
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 16:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 182FF32BF30;
	Wed, 20 Aug 2025 15:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PAKxbBRB"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A81322C7B;
	Wed, 20 Aug 2025 15:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755705561; cv=none; b=h5vU/aBP13/TOrH85e7M8oMFx1X9bPjNs2EI/QX6bTh7qOnVHuP6oqebS1QFd5MyDWBLTBzSw5qLoo1xX4O0tZ3WDWZ2K5yKZjQwEGfR76bRP+l0En3Igxsh46VmBRf0MpN3InciyaPyll/oBPaffpmDbxGuBnIhffynprPvaQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755705561; c=relaxed/simple;
	bh=yEJaUBUTN4hvB89PLKjHtmlEyvDkPTpFPCPmwYFo0u0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HgmqypVLxMmJzItHd1enxV345DCp3+O/Jb1lLErmkFAld5A2rw2z2As7oXy62hWg3/0C2pY4sfVpMD1ALeQrjTaUYXGL7yQvhkI+Gv100Sh57UGhwv4xj55pEaYZAY6dftpD16axoWLl9juQqegpm2kAiEZX3HVVSX9C9n6e5QI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PAKxbBRB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 924A4C4CEE7;
	Wed, 20 Aug 2025 15:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755705561;
	bh=yEJaUBUTN4hvB89PLKjHtmlEyvDkPTpFPCPmwYFo0u0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PAKxbBRB6y4MiWqzIC9/IKG063AAn4UisoWj+NW5+PKN4Lnw3RS8OyyQlPQJA71G+
	 uWhLx9dX47v9vzCZ0QL4gY/Dey+ZH1Xx+lLxKPj5NOMYmVw0LturTgVTb63dqpyn7T
	 lwOkC1McWsbh9PKkhwtRcLEeqG8k6c1X2LjLLlq+vdTzgXj2SRO6IpwmtmhN65XFz/
	 GFGPNKvbKDtfEWu3qjr4StyrDgGCE4cHt8PYxrAjSwFFcTG/IlLvTcP52gyP7vb14R
	 zoY6H1o63UnUewYeBa/7fWYAnVufHicPVrF0uk/qAYxgqrgjgYRT0o0TH/578PVC2r
	 uDeVI8e2mGGlA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Michael Buesch <m@bues.ch>,
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
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 10/16] gpio: omap: Use modern PM macros
Date: Wed, 20 Aug 2025 23:40:31 +0800
Message-ID: <20250820154037.22228-11-jszhang@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250820154037.22228-1-jszhang@kernel.org>
References: <20250820154037.22228-1-jszhang@kernel.org>
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
2.50.1


