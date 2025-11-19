Return-Path: <linux-gpio+bounces-28785-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 76182C6F879
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 16:06:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sea.lore.kernel.org (Postfix) with ESMTPS id 2F7672A06D
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 15:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D490D36A00B;
	Wed, 19 Nov 2025 15:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qBuF478Q"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AE4359FA1;
	Wed, 19 Nov 2025 15:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763564591; cv=none; b=DXmqhhDHni97H5SF1vYJZZ+zx+g02pA+AP3PM+79WiwNdvmN6Ta4uHsEPZXzzHd9KcHyPcPOEY1gD7d9KmkMBzS0HVlWwt7OiEPtXgRGjNcLbpMLWba6e8OOhaHP/a+sD841vNCFb4YvIJcR8RjmGSygqY7U7plWb/bLNNJ+uJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763564591; c=relaxed/simple;
	bh=FNQBeICxR0B/d8AdnKKxHZ3C9oJ646yuBJEylmDxAf4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LTFmXWZ5xVMCfwOCxJnZNC1I5mzWujOp1JpLwbxtHHweh+SwqEj8+o8dOnQVm7ikQBxKKIPX+Kb8mtPUPnQ0hFQBHuJ6Iw1gnsm2D+U/PXiCUd7jUNSqwH4I7rOZ9QvJw+LfB3joFPZ1LfktvZ7Pd177uzrUnVsz+1p/0CEYwlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qBuF478Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8712C16AAE;
	Wed, 19 Nov 2025 15:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763564591;
	bh=FNQBeICxR0B/d8AdnKKxHZ3C9oJ646yuBJEylmDxAf4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qBuF478QySTADHYHpuojYYKnlUai66KidfCa0kILAV/j7xfjpU6WiGj6n3Bv6xIPn
	 ht5iEHGyyrb3H98sZfzLPos+iVUKEHso7cOCy0+B4n5lODYJpgjoygTocwvuuGHx7M
	 OffZnwbAlRQy5KuTHFMV8Rkap7p3Ky9z9m+pqGH/Mo7JfSYrA5aMJDhE4u7F6Ia3dI
	 sI+2FZZu9Zc279V90Dq+YzSFWcKuda98PBajRrSL3D+H5FfGCZsu6x3UPyjhS0LuXX
	 urOIdorP/sCw7mUUAguviTjwzpw5iYUBrMr6ySac1jkMesGNKtarUMgQ2wVxVKuKRQ
	 lCNx3uVTzrScg==
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
Subject: [PATCH v3 14/15] gpio: xilinx: Use modern PM macros
Date: Wed, 19 Nov 2025 22:43:26 +0800
Message-ID: <20251119144327.13345-15-jszhang@kernel.org>
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


