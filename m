Return-Path: <linux-gpio+bounces-24649-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8147EB2E1D4
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 18:06:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 750EB5E5FA0
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 16:00:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDC2E3277A1;
	Wed, 20 Aug 2025 15:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YJB7FAyJ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87DD0322766;
	Wed, 20 Aug 2025 15:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755705577; cv=none; b=UmK9hrIwPVshJhp9MaB1a21F12MW3ueRtNEDJlcNECbFOK2dNOZcY2hqghA5N/pUsnSwZRo1XgBtLG8TB85jp+XAdmwHqcDs7wsSFQrYnKoJbnB4yYPYKCR7v6OrjJPH3ENohvo0oWc8ai1pGOwMTsD5/RyIY+czUsmNTw4cLCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755705577; c=relaxed/simple;
	bh=Umn5vwhGD2cJbBze7Y+K5YYl5ku0sduec7+7WcHtJDE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kP2gEPr8iGwjG0DXPpzZcOG7N9PMeoefC5uXmJemGc3NMF5FVw5wV/9V338BpaNg74J9fLAyb5VzkBYcWUtr6SM1WBoKZAk8GEmY6pmTUHCDHK0kGY6lhOw3KQIwTBUEnNlH+DIUuum6luMa5ji02+krH+Gidz5DErMsVJZKCd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YJB7FAyJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D717AC116C6;
	Wed, 20 Aug 2025 15:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755705576;
	bh=Umn5vwhGD2cJbBze7Y+K5YYl5ku0sduec7+7WcHtJDE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YJB7FAyJmFIy/7bU6Y6i71u2o8MXfowgFrIDXqIk6YPIU/lj6nyoRUOXhv3daXST0
	 1WRNZLp8D+8M12Ww6v0xaiKqbZ63Ay2gkgmI4XLJImrTQ58j1Ktr1AV/0XU7MPpyWO
	 bIUUL54nRyeY4an1pQCOq2T+0U2v+YdeUlvRUC0gRRY5tcz7O9RNA83vs1smq6pTtb
	 A2BvVA9odZs4EQO3oT9BnUBbeydgFtP9ND05ez31VZ7aI67jCIPD03JgP/shTTLQcv
	 BODBh4bhLBUxCtWuwnlTENxKEq9nErah3SNyaWQaaC5wifuk5ZY5pBZ1a9928FT/RG
	 MVIS2LTeazW6w==
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
Subject: [PATCH 12/16] gpio: tqmx86: Use modern PM macros
Date: Wed, 20 Aug 2025 23:40:33 +0800
Message-ID: <20250820154037.22228-13-jszhang@kernel.org>
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
 drivers/gpio/gpio-tqmx86.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-tqmx86.c b/drivers/gpio/gpio-tqmx86.c
index 27dd09273292..d79f515137a5 100644
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
+		.pm = pm_sleep_ptr(&tqmx86_gpio_dev_pm_ops),
 	},
 	.probe		= tqmx86_gpio_probe,
 };
-- 
2.50.1


