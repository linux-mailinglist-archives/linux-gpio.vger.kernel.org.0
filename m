Return-Path: <linux-gpio+bounces-28824-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE1CC70603
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 18:15:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id B7F4F3A74B1
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 16:57:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4568D36CE1E;
	Wed, 19 Nov 2025 16:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZwLETMT2"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDF4836CDFD;
	Wed, 19 Nov 2025 16:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763571138; cv=none; b=nBJBbgh9GQYsdKCJbkEQYm++eaaZorYWIaa/aLlAHyfh/CiB062Q+9G2ATbvAdWysiny+6zltfnfpu/aHnEUwD0ra4M0u/8/3f7ckEZwfdVz2ij81kXlZhcF2zI3+Ps6u6J+KTS254v0jzu38Y2EUA5L1f/uRRVPpDj+apn3rNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763571138; c=relaxed/simple;
	bh=ubtLg3KUg59lOZoSqAgnUdL4Vryv6Y8AzFbqdyHyiE0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iKdXdHFXnwfwU6CY79BEl36qiq2fYXKqOVdOvyi/PVn5LDYs3UvotrJi43+4lVwLJozj4jFsEjOSRq3910lv0byU7jXI3xRNDeLN7nFUSmVmVodXqBdgsculmN0X1FWHCgh/utXsrdzJIHvCpRIRbbtsQppufexhf+CuVsqTL0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZwLETMT2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02360C113D0;
	Wed, 19 Nov 2025 16:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763571136;
	bh=ubtLg3KUg59lOZoSqAgnUdL4Vryv6Y8AzFbqdyHyiE0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZwLETMT2qY/WTDQajr8TWLWn3R6YIskJJXuNGIrqJhWOBoYZepGoF6rUzFegBn29W
	 BYeyGGd3/4D7BWMGWpb8FgeBMcImYvt6aZYEz0EyF04omx0S5zZcqJcR5X3ImIVf3j
	 tN0dnCTV+Opbf+Wkk8VQJvZAfwkExgRdA9JDpWSV11QXUbEcxGII46qIdLn5PB7aZw
	 S4nr2tfucAvBSqKJiWT3NHsOSGfZLN5o4J4iaLQY3SBCGjwnT5HTNwDQh2P51IrNFQ
	 p4dL60WxPJ+claODHgijoPtVLz0SwEyCJLgp35C8Ftuw5fH/R6OJsPPAT8rWXRpVf2
	 uPO/CPHjB+ctw==
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
Subject: [PATCH v4 13/15] gpio: xgene: Use modern PM macros
Date: Thu, 20 Nov 2025 00:33:25 +0800
Message-ID: <20251119163327.16306-14-jszhang@kernel.org>
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
 drivers/gpio/gpio-xgene.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-xgene.c b/drivers/gpio/gpio-xgene.c
index 4f627de3f56c..809668449dbe 100644
--- a/drivers/gpio/gpio-xgene.c
+++ b/drivers/gpio/gpio-xgene.c
@@ -130,7 +130,7 @@ static int xgene_gpio_dir_out(struct gpio_chip *gc,
 	return 0;
 }
 
-static __maybe_unused int xgene_gpio_suspend(struct device *dev)
+static int xgene_gpio_suspend(struct device *dev)
 {
 	struct xgene_gpio *gpio = dev_get_drvdata(dev);
 	unsigned long bank_offset;
@@ -143,7 +143,7 @@ static __maybe_unused int xgene_gpio_suspend(struct device *dev)
 	return 0;
 }
 
-static __maybe_unused int xgene_gpio_resume(struct device *dev)
+static int xgene_gpio_resume(struct device *dev)
 {
 	struct xgene_gpio *gpio = dev_get_drvdata(dev);
 	unsigned long bank_offset;
@@ -156,7 +156,7 @@ static __maybe_unused int xgene_gpio_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(xgene_gpio_pm, xgene_gpio_suspend, xgene_gpio_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(xgene_gpio_pm, xgene_gpio_suspend, xgene_gpio_resume);
 
 static int xgene_gpio_probe(struct platform_device *pdev)
 {
@@ -204,7 +204,7 @@ static struct platform_driver xgene_gpio_driver = {
 		.name = "xgene-gpio",
 		.of_match_table = xgene_gpio_of_match,
 		.acpi_match_table = ACPI_PTR(xgene_gpio_acpi_match),
-		.pm     = &xgene_gpio_pm,
+		.pm     = pm_sleep_ptr(&xgene_gpio_pm),
 	},
 	.probe = xgene_gpio_probe,
 };
-- 
2.51.0


