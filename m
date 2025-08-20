Return-Path: <linux-gpio+bounces-24646-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 676B4B2E1C1
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 18:05:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 70E361C259B7
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 16:00:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8038322A13;
	Wed, 20 Aug 2025 15:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lRolVLcS"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C161DDC33;
	Wed, 20 Aug 2025 15:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755705556; cv=none; b=BBJBwn7eC3Y4YtqAKGxufAGFwJAZiGzTr9aRbW5cfa6IK7TzuDv0Br1bHiR5su5a5ftRW0LolbZoMKXV/dtXjdGxjVDZBDjFJKT/AJQLxwomZb3d7SONtL0iPEhsIiswPBgvTIrGS+wWRoVhjKPQ3NuegUqWedZKC2joyqXzDAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755705556; c=relaxed/simple;
	bh=wkl4DXPPdGwmHjimbd9ZFWcVgpEJQkpRzejBsRDeBw4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N9qdQvQwrJmy/nDfxX2sQqZCOVP5pMk2yZnkdNJ9Adkip3GBJjMAozGYRmXEmOFZRLrk/P9zPHFhmOd3cBN9pAj+6p4B7U+hkcRJWA1H0heaBEp4Yseh98B2nQkYyRiBzkd5toqdkEiaZmcGV3BkcHeMxE2PWBd8Qd8N1bbXHpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lRolVLcS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE8D6C113CF;
	Wed, 20 Aug 2025 15:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755705555;
	bh=wkl4DXPPdGwmHjimbd9ZFWcVgpEJQkpRzejBsRDeBw4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lRolVLcSW27Lqstu8xK9aeo87ZQJtYgMERie+2UpOGzDIPFx0bF+4GS+xp8Dc1wye
	 9DaZNaKDAKiaUA1GcDQ6UjSqGibiSuhyP1PLCGKhXIYTqVeTk/DOolMnOiwZ1KeyVq
	 UwK+SMLr3PYFku2bBy5XTe5VPJN6f24dasxmWRBzkuuCXEZXYdW8GGjKCH4afscL5G
	 WFpfzcxqS7I3zp1pRUFNgWDeWMCYUC3c9Hl6QmnFGjMMOz8n7vINvyIFveF028/cTY
	 IOplQneAIXen6mstXfM9HCoVSnTx6PfN5WgKHaI/mWezld00EcjYVo5mj2GMQlmLBr
	 IlAORuM1lQFfA==
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
Subject: [PATCH 09/16] gpio: msc313: Use modern PM macros
Date: Wed, 20 Aug 2025 23:40:30 +0800
Message-ID: <20250820154037.22228-10-jszhang@kernel.org>
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
2.50.1


