Return-Path: <linux-gpio+bounces-28783-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E1FC6F8E6
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 16:10:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id B38022E4F7
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 15:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C07662ECE85;
	Wed, 19 Nov 2025 15:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uiSZHAhN"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775E7293B75;
	Wed, 19 Nov 2025 15:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763564575; cv=none; b=cD280KfdJbZXhMjpp/tpugdL0U6r+p2lS2NWxaI1jJjHpzkjv0UVBliARi3m/5X/RrIOLWtNNberJgkkRjR7u/I+WFvqYtZDU4hXSA3wGqz98QIiLau2YbccGonEnQVpIfeaZdSQb0FBju0DvV1g36TdG0+qUn1S+lL/oIsexdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763564575; c=relaxed/simple;
	bh=Os+tBdcRNnMldaZHL0II0bLpAzonGthp4S2yNOuQoUg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mgMpmV0+LY9UX/PZzJEVNNZgkTR3rZ4WzHrQjkoB+UPzhweFxzX2smpd+x4/K1b7yYqrcbnWjwYwNThtlbnHNqKjjOwEeWR3kuoKvfWvqMAvAat1JcdGO/tZwiaOBWzndin4VHbMlOwXaVWRAaDrCae+Cce47qKWpHGD9ZJ5IFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uiSZHAhN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87D5DC113D0;
	Wed, 19 Nov 2025 15:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763564574;
	bh=Os+tBdcRNnMldaZHL0II0bLpAzonGthp4S2yNOuQoUg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uiSZHAhNRZfGjEuVovTiI4milsyYoDWr0fmeBulJYJ9B+EOPDWLIbK/dKJ8siG1SX
	 m4nHj28g/fHQ0D2zv4ygBhsaE49kkqTULffHF2cz/XYU8Fu5yu1lQ+7D1d0tUQ/agx
	 ZJO1VxPsHeE0UMistGeEPWLOIRuG23EAwEHJQQg+PQD204BG/q67UTIwPNwXo16XxT
	 aMCXHu1qiwe8heGYlW9O3HMc4A+3Ucnmh0HWGk2QYeFSac+25sQRmhjU/K69qBkTlC
	 JAJJNn2WtKMHcYY5GXmgMd2NqrRcXac+t+S8s4J+oywXJQ+PqxdT+iBqUFRlqmRDg2
	 8cbQArBu+CZig==
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
Subject: [PATCH v3 12/15] gpio: uniphier: Use modern PM macros
Date: Wed, 19 Nov 2025 22:43:24 +0800
Message-ID: <20251119144327.13345-13-jszhang@kernel.org>
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


