Return-Path: <linux-gpio+bounces-24652-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E050DB2E1DA
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 18:07:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 787FEA22014
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 16:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BD3133438F;
	Wed, 20 Aug 2025 15:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dzj53rDi"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50832E8B60;
	Wed, 20 Aug 2025 15:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755705595; cv=none; b=Z58P34j/VSF/pXgvx+FH8GV9mIaycx3bV8i033rcbeticrf3i9s+/LCr2jVTZJ5Ck+rkm1F/j4ktucxcoBG9r2A4MI7NiwUsL3b/XHSMihWrzrEb0Ah9EUSzgTxRX4ZLWNAz571tkRqvIbpMzMHXGm53me5HtzpsbDYu45ttlAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755705595; c=relaxed/simple;
	bh=uil8ZdRjg4HFrRJeLS26HOwIZusTXb+xLTXvjBw8om4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RkyRHMkRRWmxw5acWopkrbqy/RMhOOa1p729vhz3IXXWmDFqOfsqTV1IrSLgnm80SWnQ7Evz/FIuodnM+JfYmDkLfmkIXPBbyLo4tGj9TgT1we8RShD2xpUFP+ARdpUOkz3Ec8NZa7xIvRTqaMADeAFXoaoT3A5BJtkAl9nKip4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dzj53rDi; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF6C9C4CEEB;
	Wed, 20 Aug 2025 15:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755705595;
	bh=uil8ZdRjg4HFrRJeLS26HOwIZusTXb+xLTXvjBw8om4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dzj53rDiYwXvWskMsVLAaz4vmIFVf5W8xckeEZ/ZahMIv02o2UU7KMUO1IFwTJ21x
	 dYKdxngWr8sb8tXV99EgmwY4Hz+YlETAlMEZK3dOtrep5IqwjmN5a2RkHW8WO9jfwh
	 7JvN4FO8LwSH+CFm8JT2ye+XZyUyDIPtOOLw3T5dgzB8+PoVvFf/Oeu7GvDz5U0/3d
	 evfCspyI87F/IjzqI6GVaWniR1G3ldgqEic1CCSWGnnV9xxODKFnt+7FTtdJdX/Upi
	 AOlfN8Kg8GgB02PXRlz41Mfk0i7qGaQvitlyERI1biLUhbsEG16QjlsiIoizFRQHz3
	 o/eGiYnrQoJFg==
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
Subject: [PATCH 15/16] gpio: xilinx: Use modern PM macros
Date: Wed, 20 Aug 2025 23:40:36 +0800
Message-ID: <20250820154037.22228-16-jszhang@kernel.org>
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
2.50.1


