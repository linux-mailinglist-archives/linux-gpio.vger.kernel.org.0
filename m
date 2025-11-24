Return-Path: <linux-gpio+bounces-28988-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D01EC7EB0F
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 01:39:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B9036344C3B
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 00:39:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C808319DF66;
	Mon, 24 Nov 2025 00:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gsp4l5pF"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E45D13AD26;
	Mon, 24 Nov 2025 00:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763944756; cv=none; b=fc4flXfUzu7yijhymBR6Dy3+nGZFLibS4NH5zRUZgpNnMoCpFr/HYjzipYczlZ8wH0A+eqz4OQeLDm/xiowogAPa6mkxVcXHXVU1nu42BdqnFq6UgotGobEVZK8nHaVwLoTAOwXDMdbMU9Q2llqybk9f5962xaMU7tkqmPobxb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763944756; c=relaxed/simple;
	bh=s7gmAkXYo3rQVJ8An2wM329PekTsogFXN/YDoZN5CkM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gQXQ5ifRme6bsqZrokYwow3TE9uhc8aaUI/vbp7MXvcjocysGRzc9E3lzNu7CHBDKwIqzItRgC9iMiAnTrFLQ72ujRmT6m8imXKLyXYz9Y6fZDiwCmddRVQsPUkaT2frqG7EZJKsJELpUiX/iv/LQi3SUYgy1avhkMGnb9Ed2dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gsp4l5pF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ADC5C116D0;
	Mon, 24 Nov 2025 00:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763944756;
	bh=s7gmAkXYo3rQVJ8An2wM329PekTsogFXN/YDoZN5CkM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gsp4l5pFGdb/D2rE2OGCTtQaBfl2Lker+yqU7k05DSOe8wJuIA4nblIhiGJcmP1MK
	 4OxJWOiugs9ITt1xm/xUBxX3JwS/DvFjTjFdrodWGO3gn5/9Hu9eeGZtTDWqeCZLtM
	 vPTG/owhUQ5C/aBe0Ell8AzSAvHB6SEq4ocur4Z5ahy+vJQC9+ktATJ85i5Khr2Hdo
	 TT7rDY3zwG/JVS/cCaFd4dYpu5xzwar5qQRTmoGuDyC3rhkPn9blfLKGNrzEyoNKSj
	 qWteCNTQRp/xx35OOutNoFN8wgk29z6eOWPLNwd5NuNNvDOz7VC0LkCKU/Tu5/bdXT
	 n0ZZX3piLTErQ==
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
Subject: [PATCH v5 04/14] gpio: pl061: Use modern PM macros
Date: Mon, 24 Nov 2025 08:20:55 +0800
Message-ID: <20251124002105.25429-5-jszhang@kernel.org>
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
CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

The pl061_context_save_regs structure is always embedded into struct
pl061 to simplify code, so this brings a tiny 8 bytes memory overhead
for !CONFIG_PM_SLEEP.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 drivers/gpio/gpio-pl061.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 02e4ffcf5a6f..919cf86fd590 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -37,7 +37,6 @@
 
 #define PL061_GPIO_NR	8
 
-#ifdef CONFIG_PM
 struct pl061_context_save_regs {
 	u8 gpio_data;
 	u8 gpio_dir;
@@ -46,7 +45,6 @@ struct pl061_context_save_regs {
 	u8 gpio_iev;
 	u8 gpio_ie;
 };
-#endif
 
 struct pl061 {
 	raw_spinlock_t		lock;
@@ -55,9 +53,7 @@ struct pl061 {
 	struct gpio_chip	gc;
 	int			parent_irq;
 
-#ifdef CONFIG_PM
 	struct pl061_context_save_regs csave_regs;
-#endif
 };
 
 static int pl061_get_direction(struct gpio_chip *gc, unsigned offset)
@@ -367,7 +363,6 @@ static int pl061_probe(struct amba_device *adev, const struct amba_id *id)
 	return 0;
 }
 
-#ifdef CONFIG_PM
 static int pl061_suspend(struct device *dev)
 {
 	struct pl061 *pl061 = dev_get_drvdata(dev);
@@ -411,13 +406,7 @@ static int pl061_resume(struct device *dev)
 	return 0;
 }
 
-static const struct dev_pm_ops pl061_dev_pm_ops = {
-	.suspend = pl061_suspend,
-	.resume = pl061_resume,
-	.freeze = pl061_suspend,
-	.restore = pl061_resume,
-};
-#endif
+static DEFINE_SIMPLE_DEV_PM_OPS(pl061_dev_pm_ops, pl061_suspend, pl061_resume);
 
 static const struct amba_id pl061_ids[] = {
 	{
@@ -431,9 +420,7 @@ MODULE_DEVICE_TABLE(amba, pl061_ids);
 static struct amba_driver pl061_gpio_driver = {
 	.drv = {
 		.name	= "pl061_gpio",
-#ifdef CONFIG_PM
-		.pm	= &pl061_dev_pm_ops,
-#endif
+		.pm	= pm_sleep_ptr(&pl061_dev_pm_ops),
 	},
 	.id_table	= pl061_ids,
 	.probe		= pl061_probe,
-- 
2.51.0


