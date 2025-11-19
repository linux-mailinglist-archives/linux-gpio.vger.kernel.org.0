Return-Path: <linux-gpio+bounces-28775-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DE824C6F930
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 16:12:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1E0AD4FCBCF
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 15:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44C7029AB07;
	Wed, 19 Nov 2025 15:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HVoSsvhY"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE48A296BB5;
	Wed, 19 Nov 2025 15:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763564515; cv=none; b=fW6Rx6N7Kh4c/VPD04XjVZTwLjOcJkT4SlwShOgcOnEBaohUVzCVTQ6Yd8ZbS+3//1wAP2lx7lPnCzm3uH35nZ3LmDpdHPY0V+v1ZLiaCKqfbbLk0cyiSY/BEQvE3dvfdz3PzaMNGtlcl2sCXP7Z90Q4P120ntyPWhMqgMLB56o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763564515; c=relaxed/simple;
	bh=ayYd92BzXLAvZa6PV9kCTiwUJsvbLOFJ9xxXZLTfmYE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nEKcm/+K+HdasHtuHpAR++SaoLMg4TlUStES1P4e5bdwVzLaHI+ujgy8lK6OK3/DoM7oElwaluUHMVfioP7y6CEfLkaqJLVHS73hYYQK7VjTIzZnj89UaCqpzzNSnTL2p0xpATMg7HlyG3Uy4JbBfLz87WXlPcyMRXOGbhsbNi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HVoSsvhY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5479C2BCF4;
	Wed, 19 Nov 2025 15:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763564514;
	bh=ayYd92BzXLAvZa6PV9kCTiwUJsvbLOFJ9xxXZLTfmYE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HVoSsvhYV2SgT6ZAcvZjUiBtzE0eAMr9Nv0usDcUAuTJR3+1mnFDyehdVnVRd7rfK
	 +fETEwL5UZaDYwrdEs1bpiVlQZUMTnCoNAx3D7lXwogJ2gDfi3QCD3aPYpjs1gEe//
	 OPpnhOsEy7J2VCKdULWzb3oc9uXES1dzC6soESUiixjZhTAa6/KGpZNKo2LW0u7Pbg
	 LxTgn/fDwleAu0tSKqgBrI5st1xw28Vpw77mssYjGLr29596xSioLRGC84n7hykCmI
	 N2BCyuhivoJyh9zBbvPd4cD78edSFor88QlzR5XS0+W+fZZVt38p/rA+lAXBvLt73A
	 IEjQs7FrM5+gg==
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
Subject: [PATCH v3 04/15] gpio: pl061: Use modern PM macros
Date: Wed, 19 Nov 2025 22:43:16 +0800
Message-ID: <20251119144327.13345-5-jszhang@kernel.org>
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
CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

The pl061_context_save_regs structure is always embedded into struct
pl061 to simplify code, so this brings a tiny 8 bytes memory overhead
for !CONFIG_PM_SLEP.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
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


