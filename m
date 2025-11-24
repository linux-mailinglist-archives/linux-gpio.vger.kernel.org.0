Return-Path: <linux-gpio+bounces-28994-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24A3AC7EB65
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 01:41:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52A8E3A5034
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 00:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B15F71F1315;
	Mon, 24 Nov 2025 00:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rFlaZeef"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AC686359;
	Mon, 24 Nov 2025 00:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763944782; cv=none; b=BdaNQZyn1uKH7GT+66JK74NEnPRwKttDdcbEK0IayPQdqQ1zIrQwEeR0voY1yDInPObLiY9MkWv5AAOZ4E0vibc8K6CEVRXbJcpqmupt6EW+1gl+Q/at5xMF5GWt5DvIQ83DzBfd6ZoRuh8My20Waa8iEmQ7B9kgVRoOWYM9u0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763944782; c=relaxed/simple;
	bh=m+0s3zR3Jimd2DLICKq/0mKXn1YtbWJGpOHLKqx4PmE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HYQXvT9Xqg5fzYYqHisvh8RUimOVv8WryvnJO8S/E4p/39Xw1sEVV3NrWO2uqxU59STsOhK+srnG7b+HHNXd62ENybRX2RhQfLGW4bAo2soKzHc/6IAqh9lsa7+Rf4rHHPlonCRNxMyjvsjI2GC3akklaRDREp5pDFAYe4YjkhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rFlaZeef; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38862C19421;
	Mon, 24 Nov 2025 00:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763944781;
	bh=m+0s3zR3Jimd2DLICKq/0mKXn1YtbWJGpOHLKqx4PmE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rFlaZeef+FfC49uYvW+DiJPLHwNO1nfTB7xhSDgl8bGejLmyjtK0dTNE8jl1hmNw+
	 aleoV1tCfvhmyHqeTYmoCnL+mMujbz7LF2rET4bcPi8J4UJnFMy52UIyN0mKN8V0P1
	 ZB4TJb1zy7FNZU4v8l8VopT4m3SizwjwJzcGflfNGcpQ9QtcsWaMBXMxvvjhOB48Sj
	 w3HxNIXMhZ+Q38BSFLl3f+B3ktYSbANwMQIzQzrkHOnuPbd5eHn5ofwwhLIcwLUrts
	 nCFQ2+Hh+OQ+kI4NXzKHDoRFElmy93dOXeGLJbB46xOw/Qq6ap2v7FigDLGGtH96iS
	 N8d4DwOLyG1rw==
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
Subject: [PATCH v5 10/14] gpio: tqmx86: Use modern PM macros
Date: Mon, 24 Nov 2025 08:21:01 +0800
Message-ID: <20251124002105.25429-11-jszhang@kernel.org>
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
---
 drivers/gpio/gpio-tqmx86.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index 27dd09273292..eedfc0e371e3 100644
--- a/drivers/gpio/gpio-tqmx86.c
+++ b/drivers/gpio/gpio-tqmx86.c
@@ -279,19 +279,18 @@ static void tqmx86_gpio_irq_handler(struct irq_desc *desc)
 }
 
 /* Minimal runtime PM is needed by the IRQ subsystem */
-static int __maybe_unused tqmx86_gpio_runtime_suspend(struct device *dev)
+static int tqmx86_gpio_runtime_suspend(struct device *dev)
 {
 	return 0;
 }
 
-static int __maybe_unused tqmx86_gpio_runtime_resume(struct device *dev)
+static int tqmx86_gpio_runtime_resume(struct device *dev)
 {
 	return 0;
 }
 
 static const struct dev_pm_ops tqmx86_gpio_dev_pm_ops = {
-	SET_RUNTIME_PM_OPS(tqmx86_gpio_runtime_suspend,
-			   tqmx86_gpio_runtime_resume, NULL)
+	RUNTIME_PM_OPS(tqmx86_gpio_runtime_suspend, tqmx86_gpio_runtime_resume, NULL)
 };
 
 static void tqmx86_init_irq_valid_mask(struct gpio_chip *chip,
@@ -425,7 +424,7 @@ static int tqmx86_gpio_probe(struct platform_device *pdev)
 static struct platform_driver tqmx86_gpio_driver = {
 	.driver = {
 		.name = "tqmx86-gpio",
-		.pm = &tqmx86_gpio_dev_pm_ops,
+		.pm = pm_ptr(&tqmx86_gpio_dev_pm_ops),
 	},
 	.probe		= tqmx86_gpio_probe,
 };
-- 
2.51.0


