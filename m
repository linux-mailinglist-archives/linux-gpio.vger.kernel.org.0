Return-Path: <linux-gpio+bounces-28995-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5814EC7EB56
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 01:41:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 78BC13453DD
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 00:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE6D41FE451;
	Mon, 24 Nov 2025 00:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EQQTFBnb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B27178F2F;
	Mon, 24 Nov 2025 00:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763944786; cv=none; b=bjrc9sg6yGb0oQxoZ5H6KeQgsxY0LX1B5rgBv2zMkpmLpdLKrDfeVxFRsOunfTM0nVJrZJ90qBvnhVJVrygfHcvSWubObt8W85PeVeJiL6/xrHOtaWRa3SSHuJtdLe17vlsRFKDLKiVIFR04LJMfvVOxKaTrRTwKwRmSfudi6rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763944786; c=relaxed/simple;
	bh=bsGFhUZVxTm6hQngmTw6wULWw8zijeU06s2+x/P0rs4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LuSAncfdpD9EbEsEUxqA3xXpm3JVYkM+4RBszUs7OZUJKcw9oI4M1Oq6JCznmwJ1AQlwVrI1YZhnJAPNhPX1PpbnWJz1fdZ/xdnXOSxIM7AneC8FroyrGnSLaez0NSLd0cF9+bJ+6hHEMIthjB8/r3ja3GwFm9SfuZN1mjWFPnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EQQTFBnb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57DC0C116D0;
	Mon, 24 Nov 2025 00:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763944786;
	bh=bsGFhUZVxTm6hQngmTw6wULWw8zijeU06s2+x/P0rs4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EQQTFBnbLFdJAELaRIUeFPPW9vl9N6+/J6l/c0bnqtNlWSnl/g7TX12a3BD+g1Bea
	 6y10Trb4s7EjRD5h5NNlSDWxzZCqy90CtPgmWLynxJPfpIgiQuD47s5YgrSeHWlEXj
	 S03+xEfLmaJmoloekQoc+cFDIjhQKMp7Njz9EE+XTNi5pRD3dEvTvAifclWSDzWnF5
	 vmKkKEEdrELZuBEdUYa6JtMuSLqJ25nP0p85amSdau4dTwyqkjFV9fBpIf0Pf/trgW
	 Xsk0YV58gIh8oxWqVAPkp+uXzwyoPP9MsrblEZOoodUKhtTr97uSlfBbzUbqOJf1Vr
	 /squkNdyIxKpA==
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
Subject: [PATCH v5 11/14] gpio: uniphier: Use modern PM macros
Date: Mon, 24 Nov 2025 08:21:02 +0800
Message-ID: <20251124002105.25429-12-jszhang@kernel.org>
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


