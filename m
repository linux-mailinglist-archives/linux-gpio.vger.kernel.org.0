Return-Path: <linux-gpio+bounces-28825-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC0AC70513
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 18:08:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id BD91E3A8426
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 16:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D4C0436CE1A;
	Wed, 19 Nov 2025 16:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yb49jwwp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836613016F0;
	Wed, 19 Nov 2025 16:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763571142; cv=none; b=km/DR44ZxgPV2QJR1Hw5xwf0I/cRXwuezgReu1P1Eu8ihdds0yDtjyl4uDrxHy0q//+2B7tXwnGh3CV/A/xsvW1dI24TLOHrK2vQVfoADA8p0bEHXOTxr5qs4jnEiVu9IYYMWArr2uw/8+7jgvdHqepztekbhs78SoGt+Jo0zXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763571142; c=relaxed/simple;
	bh=FNQBeICxR0B/d8AdnKKxHZ3C9oJ646yuBJEylmDxAf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pHDM9txvp6QkyLsHz80eLA2s21dFHa3H5SZMUZCczEkvQHdGudQXtI6OU3hTj6c1T7d6AUAA4iZLoQtG07m+ZWIvzDmjLkdT/R8XjoWAWQaNdwfIodj7VPRbHqmQQDoCoXeqghC+xmUFxXZWJ3InV76jdUEm//kXLIAgy2qCIms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yb49jwwp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CF00C4CEF5;
	Wed, 19 Nov 2025 16:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763571141;
	bh=FNQBeICxR0B/d8AdnKKxHZ3C9oJ646yuBJEylmDxAf4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yb49jwwpST2ux8ckZGsg/1gtyw9wN6olufZ6YXSKGipXA4zUgT4HOqZxgQyXlQSIS
	 y2HgB1F9gIgk+aSUcyVhqh8q71p6ghOgKN6730frU+xCfEG+CV/jjbY94dRABK6bVG
	 YOD/gg7DyMuepU9ccr+YLYPczaJNZSCfBM2mwwpXDP22jV6yO0LX+vU3eoDzsIsGO8
	 pEygm/EcbtvImoW6YCTOxcSl4RG7Z3U69iai6sblaRgpd61mBHEbAqNWTUOiR4o1wL
	 SXl1YKkq3ItBQumWMhuOsNAMAtJxmb8ujlq49WXOOrca3IRXdHRNu6/cm//Kt+7ahn
	 fRREMTcZd1ZGw==
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
Subject: [PATCH v4 14/15] gpio: xilinx: Use modern PM macros
Date: Thu, 20 Nov 2025 00:33:26 +0800
Message-ID: <20251119163327.16306-15-jszhang@kernel.org>
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
CONFIG_PM_SLEEP are disabled, without having to use __maybe_unused

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-xilinx.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 83675ac81077..be4b4d730547 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -286,7 +286,7 @@ static void xgpio_free(struct gpio_chip *chip, unsigned int offset)
 	pm_runtime_put(chip->parent);
 }
 
-static int __maybe_unused xgpio_suspend(struct device *dev)
+static int xgpio_suspend(struct device *dev)
 {
 	struct xgpio_instance *gpio = dev_get_drvdata(dev);
 	struct irq_data *data = irq_get_irq_data(gpio->irq);
@@ -327,7 +327,7 @@ static void xgpio_irq_ack(struct irq_data *irq_data)
 {
 }
 
-static int __maybe_unused xgpio_resume(struct device *dev)
+static int xgpio_resume(struct device *dev)
 {
 	struct xgpio_instance *gpio = dev_get_drvdata(dev);
 	struct irq_data *data = irq_get_irq_data(gpio->irq);
@@ -343,7 +343,7 @@ static int __maybe_unused xgpio_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused xgpio_runtime_suspend(struct device *dev)
+static int xgpio_runtime_suspend(struct device *dev)
 {
 	struct xgpio_instance *gpio = dev_get_drvdata(dev);
 
@@ -352,7 +352,7 @@ static int __maybe_unused xgpio_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused xgpio_runtime_resume(struct device *dev)
+static int xgpio_runtime_resume(struct device *dev)
 {
 	struct xgpio_instance *gpio = dev_get_drvdata(dev);
 
@@ -360,9 +360,8 @@ static int __maybe_unused xgpio_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops xgpio_dev_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(xgpio_suspend, xgpio_resume)
-	SET_RUNTIME_PM_OPS(xgpio_runtime_suspend,
-			   xgpio_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(xgpio_suspend, xgpio_resume)
+	RUNTIME_PM_OPS(xgpio_runtime_suspend, xgpio_runtime_resume, NULL)
 };
 
 /**
@@ -682,7 +681,7 @@ static struct platform_driver xgpio_plat_driver = {
 	.driver		= {
 			.name = "gpio-xilinx",
 			.of_match_table	= xgpio_of_match,
-			.pm = &xgpio_dev_pm_ops,
+			.pm = pm_ptr(&xgpio_dev_pm_ops),
 	},
 };
 
-- 
2.51.0


