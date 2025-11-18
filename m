Return-Path: <linux-gpio+bounces-28629-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C2659C66BA7
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 01:54:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 718954ED272
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Nov 2025 00:53:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 408B82FD67C;
	Tue, 18 Nov 2025 00:51:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qnDjfK3V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA3F5313274;
	Tue, 18 Nov 2025 00:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763427079; cv=none; b=Zwnm5TtvDVvGqJBsiqvz+4vNRFV39SkDTMreAal+XsZOw/gnJXTH5vhe6rubx3IJK8W6So6L7ewTg91bCDG34R/ZLIUAahlcfT5jCkkwwv2yHGbWr+hNDxAkdTIdYeO8z5vTLUMWU3TYLqMSh1x4Cu3tyNl6aAHoigAsHcLT7ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763427079; c=relaxed/simple;
	bh=P97Bc+5RHWfAXBOfJCvb7Bdf9SK6HWDJUVbNNGzAwjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=s6EIBdsM6yhiBQ3UGhO491xKZdld1oIgbh9ZSXC037yRQr5cCqSjDDimUwaePjDgzJZ1KfFUkOH4H8YunVXGGLEzcZKBPQ2YjnRNn3TqBL0LcAJsK5vOIvQD/NiGjOLSLUvEa/I0VBpUdb77zh6PNys0Cg7RvkBBn4TT8rXNpCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qnDjfK3V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657FBC19425;
	Tue, 18 Nov 2025 00:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763427078;
	bh=P97Bc+5RHWfAXBOfJCvb7Bdf9SK6HWDJUVbNNGzAwjA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qnDjfK3VJgSksrVPwA3G60tXWU7vRHNLrPuIz6+ab+8OuDBDfJ6nmwV6c9cjMVdLD
	 LZCw/N888rLqP8G1mavAtBcqLxldk+9jXWFFN8IzXf1ripj1rx3ciNvWh8bVaPpM6F
	 OJV6iV4crVEK3lItw9ugkMEVLiIbcj0pS4KFjcVJwYKSljvM+0ooQd0sqHIzJ5I7OR
	 ELMicc+f+d9wnSLUl/FCUm/cORCeousRgJ0tH1vg+IOylls+Arw0KX0s92ow/wob/T
	 Gz6iG1y44yugepSVldMI1OLWM1CE0jttz8GLpe0sfyJ3SwkRMnCdUWQlKouapuU4bk
	 RX4JzBqSY1tHQ==
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
Subject: [PATCH v2 10/15] gpio: pch: Use modern PM macros
Date: Tue, 18 Nov 2025 08:32:24 +0800
Message-ID: <20251118003229.26636-11-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251118003229.26636-1-jszhang@kernel.org>
References: <20251118003229.26636-1-jszhang@kernel.org>
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
2.51.0


