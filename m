Return-Path: <linux-gpio+bounces-28786-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 68622C6F954
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 16:14:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B83154F6B39
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 15:06:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 032C335E544;
	Wed, 19 Nov 2025 15:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cItYrC/7"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE84D2BF013;
	Wed, 19 Nov 2025 15:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763564600; cv=none; b=pqtGnMH+PlRSQ1CvshpJXzvZDpHS7EK+aRLlqDwj/IF5WsUzfgVxvEIIqstDi+RRwLajymZWzt+X9HwH5jSowsLHT75pmmXJXkpAu5tfreVQ1Y/DeVr9TA6mg6lTTitUWNQXLU5vhDWQn4EEmmK7KEXjZH3L4WabfJeNcw4J8v8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763564600; c=relaxed/simple;
	bh=V41I1DdaKjoguYvIVU3vcsbbLpnEiJ795VwgA1QsjOI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pqmx1xJpRY6aZKTqWCCAel+MCjg38QcMs/3fLUO+nFj2jVrJ/v17G12/otA9tdL7g4wRPKt42RjybcB8WJlxdICwm4okp8Yljnju2SqcdC5ejUPH9bVIIeXzTk6zJ0WxmgAUvWgBpd1aQMVvioHyIMg/vGFeNQAE/bXKsc1IGys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cItYrC/7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 307F3C16AAE;
	Wed, 19 Nov 2025 15:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763564600;
	bh=V41I1DdaKjoguYvIVU3vcsbbLpnEiJ795VwgA1QsjOI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cItYrC/7Gv/oF1ZuZmijwPyTgCtpcQjJvd2KcgR5JnuDtTxgP8bA/oAj9ZoNirK3L
	 91GW/fdqyignkGUcxE9AsI0gAoCki+qIz0QE9d2oKemH7hl8tgSy5tvyJrPY19KahZ
	 Jivm4LCJd3A7+qHtZKNj37tVGWVjuo5VQR9IQ4Hrd1aaheQtMrhYLgPaiRepz6qkQh
	 2DxnxKfQvZTXz3enyhyLLzcaCgJ08+6JpEwL5phWRl8IzbW/Yg5IzVTp+bOw9lbuXf
	 IZ6h66KwznJvN6mcZbuWb2fAZxHjjAXCHQi7dynKhEBGJ2Oq4+2f9ofOUf/CWCsJlh
	 7J0gTDaTK6NHg==
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
Subject: [PATCH v3 15/15] gpio: zynq: Use modern PM macros
Date: Wed, 19 Nov 2025 22:43:27 +0800
Message-ID: <20251119144327.13345-16-jszhang@kernel.org>
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
 drivers/gpio/gpio-zynq.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-zynq.c b/drivers/gpio/gpio-zynq.c
index 0ffd76e8951f..97780c57ab56 100644
--- a/drivers/gpio/gpio-zynq.c
+++ b/drivers/gpio/gpio-zynq.c
@@ -735,7 +735,7 @@ static void zynq_gpio_restore_context(struct zynq_gpio *gpio)
 	}
 }
 
-static int __maybe_unused zynq_gpio_suspend(struct device *dev)
+static int zynq_gpio_suspend(struct device *dev)
 {
 	struct zynq_gpio *gpio = dev_get_drvdata(dev);
 	struct irq_data *data = irq_get_irq_data(gpio->irq);
@@ -756,7 +756,7 @@ static int __maybe_unused zynq_gpio_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused zynq_gpio_resume(struct device *dev)
+static int zynq_gpio_resume(struct device *dev)
 {
 	struct zynq_gpio *gpio = dev_get_drvdata(dev);
 	struct irq_data *data = irq_get_irq_data(gpio->irq);
@@ -779,7 +779,7 @@ static int __maybe_unused zynq_gpio_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused zynq_gpio_runtime_suspend(struct device *dev)
+static int zynq_gpio_runtime_suspend(struct device *dev)
 {
 	struct zynq_gpio *gpio = dev_get_drvdata(dev);
 
@@ -788,7 +788,7 @@ static int __maybe_unused zynq_gpio_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused zynq_gpio_runtime_resume(struct device *dev)
+static int zynq_gpio_runtime_resume(struct device *dev)
 {
 	struct zynq_gpio *gpio = dev_get_drvdata(dev);
 
@@ -814,9 +814,8 @@ static void zynq_gpio_free(struct gpio_chip *chip, unsigned int offset)
 }
 
 static const struct dev_pm_ops zynq_gpio_dev_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(zynq_gpio_suspend, zynq_gpio_resume)
-	SET_RUNTIME_PM_OPS(zynq_gpio_runtime_suspend,
-			   zynq_gpio_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(zynq_gpio_suspend, zynq_gpio_resume)
+	RUNTIME_PM_OPS(zynq_gpio_runtime_suspend, zynq_gpio_runtime_resume, NULL)
 };
 
 static const struct zynq_platform_data versal_gpio_def = {
@@ -1022,7 +1021,7 @@ static void zynq_gpio_remove(struct platform_device *pdev)
 static struct platform_driver zynq_gpio_driver = {
 	.driver	= {
 		.name = DRIVER_NAME,
-		.pm = &zynq_gpio_dev_pm_ops,
+		.pm = pm_ptr(&zynq_gpio_dev_pm_ops),
 		.of_match_table = zynq_gpio_of_match,
 	},
 	.probe = zynq_gpio_probe,
-- 
2.51.0


