Return-Path: <linux-gpio+bounces-24644-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BD312B2E1C8
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 18:05:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6D0B35E33BF
	for <lists+linux-gpio@lfdr.de>; Wed, 20 Aug 2025 15:59:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB7503277AD;
	Wed, 20 Aug 2025 15:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mpYjeVFf"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D8C264F81;
	Wed, 20 Aug 2025 15:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755705540; cv=none; b=gf5EJeriBk0VFaAm8h4Gxe3PZQg6c7V1C00OHTxJWZjaqmgLZxPUDuMQkN0SdUf9xTAvyKLN4xOqw24K1YO8AGfh9PTI/wQuROhI1rUtkDUSOfhMBAuL161cvdGZ/3OkpgrkpHVCLcA2UkbhGsmet7MSNRB6C8zd970h7zQeWa4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755705540; c=relaxed/simple;
	bh=3yUWsIxkW8qzK5gi9AtNqttGslx05/6Cqkuua0jSepg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PbooSCxmKlTp//ri1nSiBgG2oa19OTsS1Wp8r9MEkxDf7DEyIWw1J4QplmyTf9SwzxjFSYUgqShidoAmXyhTi6ggyTS6JsUTgC2yJFtoZrOtJYgVzGnGbCBXpOExuX9sAmv1z9kYN4FBdAVDs+FBm6rZlq6ycgW18iiPXFOG6UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mpYjeVFf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C750C113CF;
	Wed, 20 Aug 2025 15:58:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755705540;
	bh=3yUWsIxkW8qzK5gi9AtNqttGslx05/6Cqkuua0jSepg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mpYjeVFfuND3nz/WtpBTs8CSNdLRsPHIRLDTMSdozP6kGI7Gtj25iygIgYRBwNaOy
	 /eKLo8WA/gRRvPpPhXSW5HqgLCSjc0ps4UnjzhG3QfHczjUKspCgyEMwKnun6TvDry
	 DBRCmmREWc5H3yzP+h5pvCybcFMarNnofKhZN3hseLT8fXyUAY5b0NlEjRRiDR8Lot
	 zu90HmaZzx4aBrRKQvll0EAXNnLL87M9gS+x4iLJVT7TFdV96bdWxtdEC3DRdC4Ixl
	 oQFdP5ggs5YAQDagfjoKx5dlrlHvLITjd1QiuYBR9OQG63j44YXO4b0rlK1L/vT6yR
	 nsd6hJIUhxcCA==
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
Subject: [PATCH 07/16] gpio: ml-ioh: Use modern PM macros
Date: Wed, 20 Aug 2025 23:40:28 +0800
Message-ID: <20250820154037.22228-8-jszhang@kernel.org>
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
2.50.1


