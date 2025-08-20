Return-Path: <linux-gpio+bounces-24648-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3701B2E1CA
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 18:05:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A8C251C81C30
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 16:01:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD787322DBE;
	Wed, 20 Aug 2025 15:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dhnIqRFb"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B75322766;
	Wed, 20 Aug 2025 15:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755705569; cv=none; b=AZp3VhpTiLfamYsKq+70/EOgLib5JyRFx6ZdPkY7bdinL6nziXJWML6bUl5N4I7Ed9tUSXscENZheecL5Y5thI5CHlcvX4IEkMWMAhhUxBU/cig3U3FJoF3ad7yX5OhZW7I474P7NdJ0Q78DQgkRISNHTF55V+XyOt6f2iuEBf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755705569; c=relaxed/simple;
	bh=Y36HuswNodbrKyVb7di2itIAsIENlff5yeL0ohIKL+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nRK8++pMnvCR+oUXQJfjSYgYYSJGu6U6/+Y94Hl+QIaYo8rL2ZSBSLGUhyORX6FhPLhYvJ0SKtI6AESVx3U/aebVk0sFMbC0wk5sdBzEsQ6NrbESo69MFLxPRg6vnBf5v55fkweKZRy9sZWBb9+hFL2HtdvwTaOOazCmpa6wr6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dhnIqRFb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C13C7C4CEEB;
	Wed, 20 Aug 2025 15:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755705569;
	bh=Y36HuswNodbrKyVb7di2itIAsIENlff5yeL0ohIKL+c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dhnIqRFbolFKv669g/NhMWBFRHr/HWpQODcjF/txYp2sHqjmyPE+idjqIBAmjca28
	 g8JbQObc+iVBY4jupekGiywCUR6Jsa7Kr4b8rzbcsUWiMkuK8dHObBKor1ThgtfsZo
	 ZPbooLJ6ONssJHGvDUC1BJxKjvYjjVCZcvFeUFKaZ9JfgfJ82Iyg/dUO+DcoRuq526
	 62TCon+/GRMSRZWRGCCTmFi1bHBY+1soNPeSq9t/3aohhWz8+58o7ce9xumqlRUMm+
	 659LoLVxp+YgMM15sJbMO1BS7EIiJKHCKhFXSHa0LeLpBk3StrPq3kLScaHxkM10w7
	 c4pDUY86uymLg==
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
Subject: [PATCH 11/16] gpio: pch: Use modern PM macros
Date: Wed, 20 Aug 2025 23:40:32 +0800
Message-ID: <20250820154037.22228-12-jszhang@kernel.org>
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
 drivers/gpio/gpio-pch.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-pch.c b/drivers/gpio/gpio-pch.c
index 9925687e05fb..4ffa0955a9e3 100644
--- a/drivers/gpio/gpio-pch.c
+++ b/drivers/gpio/gpio-pch.c
@@ -171,7 +171,7 @@ static int pch_gpio_direction_input(struct gpio_chip *gpio, unsigned int nr)
 /*
  * Save register configuration and disable interrupts.
  */
-static void __maybe_unused pch_gpio_save_reg_conf(struct pch_gpio *chip)
+static void pch_gpio_save_reg_conf(struct pch_gpio *chip)
 {
 	chip->pch_gpio_reg.ien_reg = ioread32(&chip->reg->ien);
 	chip->pch_gpio_reg.imask_reg = ioread32(&chip->reg->imask);
@@ -187,7 +187,7 @@ static void __maybe_unused pch_gpio_save_reg_conf(struct pch_gpio *chip)
 /*
  * This function restores the register configuration of the GPIO device.
  */
-static void __maybe_unused pch_gpio_restore_reg_conf(struct pch_gpio *chip)
+static void pch_gpio_restore_reg_conf(struct pch_gpio *chip)
 {
 	iowrite32(chip->pch_gpio_reg.ien_reg, &chip->reg->ien);
 	iowrite32(chip->pch_gpio_reg.imask_reg, &chip->reg->imask);
@@ -402,7 +402,7 @@ static int pch_gpio_probe(struct pci_dev *pdev,
 	return pch_gpio_alloc_generic_chip(chip, irq_base, gpio_pins[chip->ioh]);
 }
 
-static int __maybe_unused pch_gpio_suspend(struct device *dev)
+static int pch_gpio_suspend(struct device *dev)
 {
 	struct pch_gpio *chip = dev_get_drvdata(dev);
 	unsigned long flags;
@@ -414,7 +414,7 @@ static int __maybe_unused pch_gpio_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused pch_gpio_resume(struct device *dev)
+static int pch_gpio_resume(struct device *dev)
 {
 	struct pch_gpio *chip = dev_get_drvdata(dev);
 	unsigned long flags;
@@ -428,7 +428,7 @@ static int __maybe_unused pch_gpio_resume(struct device *dev)
 	return 0;
 }
 
-static SIMPLE_DEV_PM_OPS(pch_gpio_pm_ops, pch_gpio_suspend, pch_gpio_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(pch_gpio_pm_ops, pch_gpio_suspend, pch_gpio_resume);
 
 static const struct pci_device_id pch_gpio_pcidev_id[] = {
 	{ PCI_DEVICE_DATA(INTEL, EG20T_PCH, INTEL_EG20T_PCH) },
@@ -444,7 +444,7 @@ static struct pci_driver pch_gpio_driver = {
 	.id_table = pch_gpio_pcidev_id,
 	.probe = pch_gpio_probe,
 	.driver = {
-		.pm = &pch_gpio_pm_ops,
+		.pm = pm_sleep_ptr(&pch_gpio_pm_ops),
 	},
 };
 
-- 
2.50.1


