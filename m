Return-Path: <linux-gpio+bounces-28817-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E23CC7055E
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 18:10:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 403B23647BE
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 16:55:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFE7E35F8A3;
	Wed, 19 Nov 2025 16:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cKJI00eY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFFF35BDAB;
	Wed, 19 Nov 2025 16:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763571111; cv=none; b=GedUayQ1fpAqYF5tXuoA5COLnyjSSYummz2g5pIyjcgRnC52jaWGQQxcN6hpAXjFXpeIEc/bxxrW1mMGc0vYVBGXAUwkdZQ5SpJU2cYMTY/2EBnRANKcaD9gk0/69e9s0Ml1M7/AvKzZUHik8Gj985iOVkS3jl1d6Bb9c3Hbu2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763571111; c=relaxed/simple;
	bh=O5fL211jY64gu41HAFIXUFvgC/PevKGGEhVmfu+o420=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gkwQE0EPfmg3Mf2XydcVglwVhJH7Sr2zLUDbi2+MWLAWOWHMbmMUjkjz/9dWNpzqIbX/gQHyVGMwIY8xfzLfiktQ8KZxtuyFrLvV9co3r3sHUckgj2RTapuM1BT9DSTN8s30YvDnJQRT5iKAt8+1+R6QxFHhzYEGWaGUvx2/j8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cKJI00eY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 343E8C16AAE;
	Wed, 19 Nov 2025 16:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763571111;
	bh=O5fL211jY64gu41HAFIXUFvgC/PevKGGEhVmfu+o420=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cKJI00eYxEG5Ab5cjpMf2CrISnmWOu7mUgGXZohhlsPd3jN7tuPS3jvVK0oXN8CYX
	 xfPV0WeRWIEfM4b4ZB4XlyxI7ZXKU77Jhmb68jm08LecRVVqyiStiXMdNY2pn85XsK
	 WLSOHySjYauCpJlOV9MrFtHrPGFcZLB9kI0qZlUo0s5WTXt4j8953yeCQhvLdiIXkT
	 /xACrZb0Sw+tXsQFuoAEhmOpDWgEh0ukxsf3+y+nFd0aViidrpilACxYOSkJrFlxd0
	 m5rmAzkY2J/VHlnbqejWEX6doX0G85sVhEKBFSUNueDuwMkrxEJpVN0mvKS6IYMAqa
	 lWpXaGnW1ji7Q==
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
Subject: [PATCH v4 07/15] gpio: mlxbf2: Use modern PM macros
Date: Thu, 20 Nov 2025 00:33:19 +0800
Message-ID: <20251119163327.16306-8-jszhang@kernel.org>
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


