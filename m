Return-Path: <linux-gpio+bounces-28816-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 10142C70480
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 18:00:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8A0803A5F11
	for <lists+linux-gpio@lfdr.de>; Wed, 19 Nov 2025 16:54:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965462FF65D;
	Wed, 19 Nov 2025 16:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vDevqylK"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E89533A701;
	Wed, 19 Nov 2025 16:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763571108; cv=none; b=bPbxzeU+fVLBhxQZNg8msXqj19KZpvRXAuSGof/LJMnN2u53jkiT+iyQw8M4crRkb+9WdvfHQ5yBilqfvmll8VDBgrZJTjugpj/qyu2ErvNGloSUFzyCEo0EO/IArc9JtUFhtDqUG0xfv/qIAFL4q6J4uo/t+5GfWL4WqpPPhHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763571108; c=relaxed/simple;
	bh=YeIVTEsOaOeIbWf+hqNeMNj80Z42ha9QYrhd689CXAc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=blfCRPfvLTalYl//zuNSBFkeyX3x4rGU5fzT4TPVq8u5jQ/2HJGioVuAMFg3qsQP7T6+z3gFLqIxK48/Nil5hjxQRtdNl+XLLPTvWNvPVjVMvCZ7JcmMLKQIqIcLgNsBQTVvM6go1VO2yd0JKId5+Pl94liohiosk++8q8lwl08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vDevqylK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFC0AC116C6;
	Wed, 19 Nov 2025 16:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763571106;
	bh=YeIVTEsOaOeIbWf+hqNeMNj80Z42ha9QYrhd689CXAc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vDevqylKPkPCm1qdectUEP5VyqefJian6EOENpuptK58dy6mxPk7HTsazoyGXOTfN
	 FxYKKkom94v3/UbWMdt2TDNQ0oIaiLvbZBmaN+X94IJWdOjzPCZdaY9aa12oyYqj8W
	 V4V3PZqnx+800KBonsaNRwjtJIGBFsLDPwIBAg8pNsGAqi90ldXhFoy7HJeLL1sYdh
	 +0Zj2CK/6CXfxV4cRm1fy1gR8NpD4yiDZxZlY/DDw3lbigzyAgnyolT5GGFjmHDaON
	 E0yTGiZKwCL/VzxoT6Fq5RuMXPKNw+3hyx3lMF6dvGZ6oNaw/Hjf5n3o7mo0D7sXhm
	 DgbV82JISYSVQ==
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
Subject: [PATCH v4 06/15] gpio: ml-ioh: Use modern PM macros
Date: Thu, 20 Nov 2025 00:33:18 +0800
Message-ID: <20251119163327.16306-7-jszhang@kernel.org>
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
Acked-by: Andy Shevchenko <andy@kernel.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/gpio/gpio-ml-ioh.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-ml-ioh.c b/drivers/gpio/gpio-ml-ioh.c
index f6af81bf2b13..6576e5dcb0ee 100644
--- a/drivers/gpio/gpio-ml-ioh.c
+++ b/drivers/gpio/gpio-ml-ioh.c
@@ -160,7 +160,7 @@ static int ioh_gpio_direction_input(struct gpio_chip *gpio, unsigned nr)
 /*
  * Save register configuration and disable interrupts.
  */
-static void __maybe_unused ioh_gpio_save_reg_conf(struct ioh_gpio *chip)
+static void ioh_gpio_save_reg_conf(struct ioh_gpio *chip)
 {
 	int i;
 
@@ -186,7 +186,7 @@ static void __maybe_unused ioh_gpio_save_reg_conf(struct ioh_gpio *chip)
 /*
  * This function restores the register configuration of the GPIO device.
  */
-static void __maybe_unused ioh_gpio_restore_reg_conf(struct ioh_gpio *chip)
+static void ioh_gpio_restore_reg_conf(struct ioh_gpio *chip)
 {
 	int i;
 
@@ -479,7 +479,7 @@ static int ioh_gpio_probe(struct pci_dev *pdev,
 	return 0;
 }
 
-static int __maybe_unused ioh_gpio_suspend(struct device *dev)
+static int ioh_gpio_suspend(struct device *dev)
 {
 	struct ioh_gpio *chip = dev_get_drvdata(dev);
 	unsigned long flags;
@@ -491,7 +491,7 @@ static int __maybe_unused ioh_gpio_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused ioh_gpio_resume(struct device *dev)
+static int ioh_gpio_resume(struct device *dev)
 {
 	struct ioh_gpio *chip = dev_get_drvdata(dev);
 	unsigned long flags;
@@ -505,7 +505,7 @@ static int __maybe_unused ioh_gpio_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(ioh_gpio_pm_ops, ioh_gpio_suspend, ioh_gpio_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ioh_gpio_pm_ops, ioh_gpio_suspend, ioh_gpio_resume);
 
 static const struct pci_device_id ioh_gpio_pcidev_id[] = {
 	{ PCI_DEVICE(PCI_VENDOR_ID_ROHM, 0x802E) },
@@ -518,7 +518,7 @@ static struct pci_driver ioh_gpio_driver = {
 	.id_table = ioh_gpio_pcidev_id,
 	.probe = ioh_gpio_probe,
 	.driver = {
-		.pm = &ioh_gpio_pm_ops,
+		.pm = pm_sleep_ptr(&ioh_gpio_pm_ops),
 	},
 };
 
-- 
2.51.0


