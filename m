Return-Path: <linux-gpio+bounces-28996-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F69C7EB62
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 01:41:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id C3D0A34563B
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 00:41:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F164F21B192;
	Mon, 24 Nov 2025 00:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MwHaorhp"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED0519DF66;
	Mon, 24 Nov 2025 00:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763944790; cv=none; b=dGDa576y9MhwnqzbRzgInM0uxyFVrqlBM6E+8R1J4nKOdj7tSAlhwy6uMNlQGRd/toRK8keH3myOMCgPzE/uMCqeNI4zy+urolf9zsJ3OLqJtc/IfU2MR+PkpGfcQ82slEoZWVeuB+qKgCKz/MR0ooiVHQ0OtEheiNaNXu0RkyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763944790; c=relaxed/simple;
	bh=wdqGkxAtebmF3ixvQNxHJZ8CpzKZyE2eFem6mVWFHIY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YQbQjTKlYm4yDGtkWObxMXyQSMYxQDEWuMyx3ueGi8oaZ56LB9EKnYKo9/CTD4/EVMiJlu9SwwDj0q8+BXhOYQtY2tQsP9WzjJylJPbmMtxGM+tRSTYAOpvnxl87ppQHejibWPrxc4Z3AyokaNTQ71f7igYZSFPfG9+RY0pVgUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MwHaorhp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E0EBC16AAE;
	Mon, 24 Nov 2025 00:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763944790;
	bh=wdqGkxAtebmF3ixvQNxHJZ8CpzKZyE2eFem6mVWFHIY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MwHaorhp7K7GKU6bv7B8rxnADJ4a5Mzzpqy2pmZqVKgEzhikCrgANX4pW/TeHXApV
	 W8/MdexOuhUCQEddYOVDijLQlu8Ohm/Gsn7/mwxo2775F2TgKIWl69YsX2pE0dFuq/
	 kkkFyhWVl3gFr3pGRZfTQJLDGJOjTAVwRq8XCnTOgbJPihyc1ccHBoDNF2S39e1LPN
	 d+rchMf/nOyr7efWB9ePvJeR9qcLKc6vf9K8IoEZqdsPBhxogMlw0mpP5MSnHI7Xnq
	 QxuGRcQjHGYXZ/KBBobJIHoViuV4BSt+jVsGgg+/xUe0GU+2lti+96SRSNXJ/XjJe/
	 SJZxI5KwzefSA==
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
Subject: [PATCH v5 12/14] gpio: xgene: Use modern PM macros
Date: Mon, 24 Nov 2025 08:21:03 +0800
Message-ID: <20251124002105.25429-13-jszhang@kernel.org>
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


