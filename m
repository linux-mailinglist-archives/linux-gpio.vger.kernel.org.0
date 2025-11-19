Return-Path: <linux-gpio+bounces-28779-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A8167C6F939
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 16:13:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B45834EAF53
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 15:04:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D07DB2D0600;
	Wed, 19 Nov 2025 15:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cGhxOM9S"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8411C28853E;
	Wed, 19 Nov 2025 15:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763564542; cv=none; b=rdAlM6eHoclx1JJgRphfRyb+CKyeBkq5oB3oEhEJ7mIGqOgS6O2EX2Riy96ya2hmlnhiKKRYzslcLpnINc2bQyG+nDutHUX3BIk2EjBYftYY3wyyeeF3mT5/DKlfybtLOMmYUucscwS78yNBk/mWth2hYWRMk4d5CG1tfXUnTYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763564542; c=relaxed/simple;
	bh=3m03+o1uul0EMqM9dDxOK/eGbWfiEkDRYFrWiLilPvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QACKK5NdvgOK+ArPWy18pVlpVGwn1x77lwAw6UeZNFV0VMePUNRB8JH///dx6wy0b3Z2AsulvgxN+VLx45h+CV+oBhn5I4CV8jWMWnaHuR28QSp5NuFOGLeK8XuS0ugv5Ugv3LusO1dnuqpCptEKclAIscGKMN/TIwUZTWVGljk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cGhxOM9S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F81C116B1;
	Wed, 19 Nov 2025 15:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763564542;
	bh=3m03+o1uul0EMqM9dDxOK/eGbWfiEkDRYFrWiLilPvE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cGhxOM9SNzjDD67n5mr+GLid5xKqGQowNBajvGUP1MvDgQbBoAwamt+yOlE2C2Epz
	 j9biM4gWKT+FmFb4/ZQTMfGdKSu72FsQo4dGgNGiALkxOAS8MzwtBcdI1Z24ps4gRl
	 LrcyN3sSroKMQ78d8RcBu9vO7IcSMcybVp9cyafklnvO9mQc1QhNTYKLRE18TGCiOC
	 n0+0D+qicXKTk5MjKyGVbLDSJPa4TsndmFxKw3noeOo5rpyhbNjfoXQ5q49hMnqO1a
	 SIMa9piTFWYTm9UXwqV1be3s8efJqNj3xJRuxBZ51tYWohS0FvbgAw4nwedwpIJIcW
	 jatRwmn8FU0/w==
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
Subject: [PATCH v3 08/15] gpio: msc313: Use modern PM macros
Date: Wed, 19 Nov 2025 22:43:20 +0800
Message-ID: <20251119144327.13345-9-jszhang@kernel.org>
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
 drivers/gpio/gpio-msc313.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-msc313.c b/drivers/gpio/gpio-msc313.c
index b0cccd856840..7345afdc78de 100644
--- a/drivers/gpio/gpio-msc313.c
+++ b/drivers/gpio/gpio-msc313.c
@@ -694,7 +694,7 @@ static const struct of_device_id msc313_gpio_of_match[] = {
  * SoC goes into suspend to memory mode so we need to save some
  * of the register bits before suspending and put it back when resuming
  */
-static int __maybe_unused msc313_gpio_suspend(struct device *dev)
+static int msc313_gpio_suspend(struct device *dev)
 {
 	struct msc313_gpio *gpio = dev_get_drvdata(dev);
 	int i;
@@ -705,7 +705,7 @@ static int __maybe_unused msc313_gpio_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused msc313_gpio_resume(struct device *dev)
+static int msc313_gpio_resume(struct device *dev)
 {
 	struct msc313_gpio *gpio = dev_get_drvdata(dev);
 	int i;
@@ -716,13 +716,13 @@ static int __maybe_unused msc313_gpio_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(msc313_gpio_ops, msc313_gpio_suspend, msc313_gpio_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(msc313_gpio_ops, msc313_gpio_suspend, msc313_gpio_resume);
 
 static struct platform_driver msc313_gpio_driver = {
 	.driver = {
 		.name = DRIVER_NAME,
 		.of_match_table = msc313_gpio_of_match,
-		.pm = &msc313_gpio_ops,
+		.pm = pm_sleep_ptr(&msc313_gpio_ops),
 	},
 	.probe = msc313_gpio_probe,
 };
-- 
2.51.0


