Return-Path: <linux-gpio+bounces-28811-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 06F84C7063E
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 18:17:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5BF974FA2B4
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 16:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6188030277D;
	Wed, 19 Nov 2025 16:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vCaA6Cbu"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D5D302758;
	Wed, 19 Nov 2025 16:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763571086; cv=none; b=u80ob2K03IdzxFBjiowVpk6Ov/N2mmTU4RLgHvDs0dHKEiC7UTatJt7k2l+5ieO8IRohQoAcmIq1/khbpsmmJi3Zd/2ecibyWpkE7niAp/Qrp+LziOt6iI6MFjys5x3HcqwHnCVwTB4OZFyBa7SgUm13PC+dJIoW4tmkhpWmwiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763571086; c=relaxed/simple;
	bh=v9W8D36bTqpg+f65pHNpmPN8TfSCoWh/X0xcXoN9wTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iHS4ydZGvLd2CwFoBnIUPr9F7SJhYP8+ykI8c9OeUvUgPktahru0dzR4gUJn938CMrS703vindtX8bit6G9r3n9lBhFGr+mg1aHNEPDRFRzD5W/Pv+dFH7kkPs0drUYZD32Zavguw7A7wqCFiAMeJap4E4lsib+hfhuI+U6QTXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vCaA6Cbu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F90C113D0;
	Wed, 19 Nov 2025 16:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763571085;
	bh=v9W8D36bTqpg+f65pHNpmPN8TfSCoWh/X0xcXoN9wTA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vCaA6Cbu6O5VFQw6OV8BcwcM+AGuQWdxwus610ipNhwk8zV9BuDJra5OShfuRRukZ
	 vpRHtrnWbdf+C3PzqmFlfb3q4Y/zI2NHACW4ie3s6RetsHZRh0FnhM2tQTIp8WuxgI
	 6zt/kHP4Oee64A7OPFzZPrRmOa7aPxegjXbsWf4C9wvagjQDGqz5dxSz22AJmvS64Q
	 tc8oNvRF7nTOUc1o4//Lz4FhofRvRyTxShMrSZkvk75lcpE4Y9ezz/JgbtgILFGrmR
	 o0n+Pgi4OhZyMFIMM2SQa7bvVTGHWQJdgKLqxvr0p5N84qBRrojVWOuMFQkVVVhzTH
	 m7IudkjPw9wMw==
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
Subject: [PATCH v4 01/15] gpio: dwapb: Use modern PM macros
Date: Thu, 20 Nov 2025 00:33:13 +0800
Message-ID: <20251119163327.16306-2-jszhang@kernel.org>
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
CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-dwapb.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
index b42ff46d292b..4986c465c9a8 100644
--- a/drivers/gpio/gpio-dwapb.c
+++ b/drivers/gpio/gpio-dwapb.c
@@ -79,7 +79,6 @@ struct dwapb_platform_data {
 	unsigned int nports;
 };
 
-#ifdef CONFIG_PM_SLEEP
 /* Store GPIO context across system-wide suspend/resume transitions */
 struct dwapb_context {
 	u32 data;
@@ -92,7 +91,6 @@ struct dwapb_context {
 	u32 int_deb;
 	u32 wake_en;
 };
-#endif
 
 struct dwapb_gpio_port_irqchip {
 	unsigned int		nr_irqs;
@@ -103,9 +101,7 @@ struct dwapb_gpio_port {
 	struct gpio_generic_chip chip;
 	struct dwapb_gpio_port_irqchip *pirq;
 	struct dwapb_gpio	*gpio;
-#ifdef CONFIG_PM_SLEEP
 	struct dwapb_context	*ctx;
-#endif
 	unsigned int		idx;
 };
 
@@ -363,7 +359,6 @@ static int dwapb_irq_set_type(struct irq_data *d, u32 type)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int dwapb_irq_set_wake(struct irq_data *d, unsigned int enable)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
@@ -378,9 +373,6 @@ static int dwapb_irq_set_wake(struct irq_data *d, unsigned int enable)
 
 	return 0;
 }
-#else
-#define dwapb_irq_set_wake	NULL
-#endif
 
 static const struct irq_chip dwapb_irq_chip = {
 	.name		= DWAPB_DRIVER_NAME,
@@ -390,7 +382,7 @@ static const struct irq_chip dwapb_irq_chip = {
 	.irq_set_type	= dwapb_irq_set_type,
 	.irq_enable	= dwapb_irq_enable,
 	.irq_disable	= dwapb_irq_disable,
-	.irq_set_wake	= dwapb_irq_set_wake,
+	.irq_set_wake	= pm_sleep_ptr(dwapb_irq_set_wake),
 	.flags		= IRQCHIP_IMMUTABLE,
 	GPIOCHIP_IRQ_RESOURCE_HELPERS,
 };
@@ -759,7 +751,6 @@ static int dwapb_gpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int dwapb_gpio_suspend(struct device *dev)
 {
 	struct dwapb_gpio *gpio = dev_get_drvdata(dev);
@@ -844,15 +835,14 @@ static int dwapb_gpio_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(dwapb_gpio_pm_ops, dwapb_gpio_suspend,
-			 dwapb_gpio_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(dwapb_gpio_pm_ops,
+				dwapb_gpio_suspend, dwapb_gpio_resume);
 
 static struct platform_driver dwapb_gpio_driver = {
 	.driver		= {
 		.name	= DWAPB_DRIVER_NAME,
-		.pm	= &dwapb_gpio_pm_ops,
+		.pm	= pm_sleep_ptr(&dwapb_gpio_pm_ops),
 		.of_match_table = dwapb_of_match,
 		.acpi_match_table = dwapb_acpi_match,
 	},
-- 
2.51.0


