Return-Path: <linux-gpio+bounces-28990-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 10392C7EB32
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 01:40:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DC1C3A553F
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 00:40:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E2191B0439;
	Mon, 24 Nov 2025 00:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PrGkBTCh"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230AB153598;
	Mon, 24 Nov 2025 00:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763944765; cv=none; b=DeN3iCnHEA8roP/uvzYBqgl0Hn5sJF1kaKCA5tAwVTLys+PZpkNYfuq0gL6xNH11RDaV+8aMhII4f1Mx47tDfWoI3H4m+NRl17zeW5/V1uOK2zFtNk/ypWnlzxh/1bnIx+J1FQV5ZlAA+kXHGT5tWdk83UV7Bgt44H2hNmBDy88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763944765; c=relaxed/simple;
	bh=1DVXPtxdqGsGdWZ+RiugkVEmTnGiv1c2Unvq2pfYDBU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qhixq42O6HEX3gUl6gnB0QN9zMFD4d7Ka/IvhMoOKmMQhUqn7eKK89tsoiD1yPaZJom/tqGCtolWf32SMMYSLr99hUdw1Zg7x4/lBdJAvT2e1xPn3FZyeEb7GPMHJKq2H6e3mHtI0eIKxdSAE5A8rgF8+w/xui16XH4tsaPxTiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PrGkBTCh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 111EBC116D0;
	Mon, 24 Nov 2025 00:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763944765;
	bh=1DVXPtxdqGsGdWZ+RiugkVEmTnGiv1c2Unvq2pfYDBU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PrGkBTChhgq3q5vIkTgzD0Z3MaRQOaCWoyCz/eapHuKz1KS3I42wM0yTecZzIbkCV
	 aLRAoByPnS9CqjfI7pWLk5IHlw5POIPkXRXEoX3X1bdfJ7EX3Y3l6SNqsyOgAr9H/r
	 /++wm0dEpTDqfVIC/tjkIsxlXol4/abqTBX1lKAJVFE4Xou9nq6eM9JL3Fc7oRoDG4
	 9T0jwLl1I1WRgDr7oNea7f6/2OHLEDnU2KdfUNR4CIDiMVFHQxk+Ijt8sfxyNRrSQL
	 2HCkhIdpcsvO1j1qzllTG7x3fZrwiXD83fY1ZVK5QE39mveWukecGlqTEM+LwLrnD1
	 w6XE9YbzzpJVg==
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
Subject: [PATCH v5 06/14] gpio: mlxbf2: Use modern PM macros
Date: Mon, 24 Nov 2025 08:20:57 +0800
Message-ID: <20251124002105.25429-7-jszhang@kernel.org>
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
 drivers/gpio/gpio-mlxbf2.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-mlxbf2.c b/drivers/gpio/gpio-mlxbf2.c
index abffce3894fc..6668686a28ff 100644
--- a/drivers/gpio/gpio-mlxbf2.c
+++ b/drivers/gpio/gpio-mlxbf2.c
@@ -424,7 +424,7 @@ mlxbf2_gpio_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static int __maybe_unused mlxbf2_gpio_suspend(struct device *dev)
+static int mlxbf2_gpio_suspend(struct device *dev)
 {
 	struct mlxbf2_gpio_context *gs = dev_get_drvdata(dev);
 
@@ -436,7 +436,7 @@ static int __maybe_unused mlxbf2_gpio_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused mlxbf2_gpio_resume(struct device *dev)
+static int mlxbf2_gpio_resume(struct device *dev)
 {
 	struct mlxbf2_gpio_context *gs = dev_get_drvdata(dev);
 
@@ -447,7 +447,7 @@ static int __maybe_unused mlxbf2_gpio_resume(struct device *dev)
 
 	return 0;
 }
-static SIMPLE_DEV_PM_OPS(mlxbf2_pm_ops, mlxbf2_gpio_suspend, mlxbf2_gpio_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(mlxbf2_pm_ops, mlxbf2_gpio_suspend, mlxbf2_gpio_resume);
 
 static const struct acpi_device_id __maybe_unused mlxbf2_gpio_acpi_match[] = {
 	{ "MLNXBF22", 0 },
@@ -459,7 +459,7 @@ static struct platform_driver mlxbf2_gpio_driver = {
 	.driver = {
 		.name = "mlxbf2_gpio",
 		.acpi_match_table = mlxbf2_gpio_acpi_match,
-		.pm = &mlxbf2_pm_ops,
+		.pm = pm_sleep_ptr(&mlxbf2_pm_ops),
 	},
 	.probe    = mlxbf2_gpio_probe,
 };
-- 
2.51.0


