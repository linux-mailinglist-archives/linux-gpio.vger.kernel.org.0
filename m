Return-Path: <linux-gpio+bounces-28633-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B32C66C04
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 01:57:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 0069F343848
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 00:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C30F932938E;
	Tue, 18 Nov 2025 00:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IsWzXRyC"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AC31CEAC2;
	Tue, 18 Nov 2025 00:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763427100; cv=none; b=grxBKOOfG4TdC/s4XGA/LPTQqpzNln8Okw123sPbFKTHdMwVMCbTxs2JQg8vjvw9MWnxSNnXMgj3GZdgskbaRWZkquiIAW8f73bq0Leg7UJ0Y47AkjWuwKTQWVGB2+5iIL8a7nOgO4uPbzlL2dBSjCc9Ch6HTtCqQmh/OJ5mZ7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763427100; c=relaxed/simple;
	bh=sgcrLnGm3+Bbp+1Awn9kwG362Rqp8d/CDhH6WRqtT+E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HX3rn4wUjsNJG2kl7/ORrBOlpev7GeYSt1gpFbmKKAKFC82B5CzFAU7O85wT/Z6zoBlu31eHjYrRNBxS58UKkSp5qMfMNgMWlG56bkhTOGt4VbkT+R9GdC5dmtE0rHw5lPRxYW8yoRzhEvIPVf9Hn7KedLf6sT+xDpzgr7MbQ5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IsWzXRyC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC583C2BCC9;
	Tue, 18 Nov 2025 00:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763427099;
	bh=sgcrLnGm3+Bbp+1Awn9kwG362Rqp8d/CDhH6WRqtT+E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IsWzXRyCK9isjIMpLbbmO/Hhm+emJSuG0Hxpvdr2a2shuyiUk4fuGzYDAmY3no8mL
	 TF0A2V/cJTgHCyafPL25WX7NYstNN2xMxyF98tN9U7oUkTgqqCROSFsCvyxW1KxwlE
	 14+MwomUh0aLK6/A6OtAZOcpM96yMt+Msa0HYrOaDjuV+jlvezjD6Ey7YzXp/UkvRM
	 r7VTcA1EzYQaRSLvMB/EoUCm4Y7vLyVaxqvLjup6m10NzHWWGWx4b3n0GNX29Y2qZ9
	 CYW8FTWzLTI4UpEKejX1hBcdDAH0bJ9aX6pnefslUTO6Z1/K3YQfyRe3zFuGgUYyKv
	 GAi5IApyFLJEw==
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
Subject: [PATCH v2 14/15] gpio: xilinx: Use modern PM macros
Date: Tue, 18 Nov 2025 08:32:28 +0800
Message-ID: <20251118003229.26636-15-jszhang@kernel.org>
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


