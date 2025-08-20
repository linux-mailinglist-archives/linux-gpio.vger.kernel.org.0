Return-Path: <linux-gpio+bounces-24642-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 747E8B2E1BA
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 18:04:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 62802A027F7
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 15:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD2CA327793;
	Wed, 20 Aug 2025 15:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AZTEIJLx"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F5F322552;
	Wed, 20 Aug 2025 15:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755705524; cv=none; b=mhEMulAEZuHlLxYtn4xHUDRpxzIccjctZKp7VQ1ox8CdRWNTDkUNkqhIfuzcNMDRn7ql7MwQpk+fox+E+PZbf+Fo7wOzFJ2jZW/FTZieNsXKEBG4SCTAXAY6Xo5Zw4Yg/MyxPn5pkZu4xzKn9E5nveESSd8C6ytOndxSTlI3Oi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755705524; c=relaxed/simple;
	bh=eaC5Mndp+PmBWbuGuWerLDsOlSXZFVRbJRhuoDO7Lrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h4y6UhOXjDyrO/ao5f5FJogsPSJnr3cv5UXxaWPRYJQW/0CEcPADtL4Kekk/aWCMzo2yppFfmmfWULhd+fApCQLhdrV+zQuAl72fBkLUC/lpE5TZBgDSOICGUV//0mCKR5xZM00NIxDa3ZE/3sFT/7B60U92lu8Pp7S605iM/vA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AZTEIJLx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A8E4C4CEEB;
	Wed, 20 Aug 2025 15:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755705523;
	bh=eaC5Mndp+PmBWbuGuWerLDsOlSXZFVRbJRhuoDO7Lrw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AZTEIJLxD4mBWLOWCTkpbDA7AfdLuBY2oOhqxRG24Ahper15tdfkkifUydndnRl7U
	 6GgLJii/FLsxDEqhzyfHOOvyvhqP/erXCl5oNohAmqMMy3Jq+1bSjf7vMHQkpJrJJ0
	 aR0DyGZji2JrEIlOyiIN6jku3VK4nqWzrOf1NXGJFG6s48iQw5XkrZr6ywMvoOTmJE
	 dz3Kzn8oHgpivKyv0FEXJ+bNUDxYdewAmJapOU5jOnk12AFLrwuy/OqA7MtHaRRdeI
	 jeqPxjB5K4XeI4nCC6MHEONj0CP9b55ImpQ+3cZkl9wCQbpWuA/vi6KmP+Esq/Dlyk
	 VUHt0Cx703AKQ==
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
Subject: [PATCH 05/16] gpio: pl061: Use modern PM macros
Date: Wed, 20 Aug 2025 23:40:26 +0800
Message-ID: <20250820154037.22228-6-jszhang@kernel.org>
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
CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

The pl061_context_save_regs structure is always embedded into struct
pl061 to simplify code, so this brings a tiny 8 bytes memory overhead
for !CONFIG_PM_SLEP.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
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
2.50.1


