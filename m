Return-Path: <linux-gpio+bounces-28989-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id ED355C7EB1A
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 01:40:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A82A6344F39
	for <lists+linux-gpio@lfdr.de>; Mon, 24 Nov 2025 00:40:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C1DB19FA93;
	Mon, 24 Nov 2025 00:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UZfih/cc"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EBE7E792;
	Mon, 24 Nov 2025 00:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763944761; cv=none; b=P2Y2Brrp0Zdj6ubzgEIet++GBmv4hGDuzgbJAV0aZ608PfZgXSAZ0nQlJCQqHBkfW/BpMxZ7m23TPWT8E2vbtMeXRTRy/k/N1pMM4l7UbUNrT9Jue6zV9dNh8fwZAnZZvxBvgpyWxLvzpZ2bYBFuMM/3ghOr9Rhcfb9viFat4uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763944761; c=relaxed/simple;
	bh=HnR+WaJN4+VRnElA/PD+oRig9aQxOxkPp2zyllWs4o8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=twGbnkTw8N2MgOcUoT66BScuN8cV0CvDoCdLswoTXYSpHnuKafjdJONHwCzkqF13z2LJwevSzxQQbf84x6qOW6D3bXANOn07+75Vc2mAQDiklGkZ18rB9C9Sw0rkv01dGd+TIPGJx7an0XXoOGWpV2ekzTjgi9zobT0Mi2PCk1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UZfih/cc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C085FC113D0;
	Mon, 24 Nov 2025 00:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763944760;
	bh=HnR+WaJN4+VRnElA/PD+oRig9aQxOxkPp2zyllWs4o8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UZfih/ccyLXl61wi/j3VfgOcANTfI7aD3cAzu8wo+bPTu0Wl7jwjRUB8TInvdibOU
	 MHxzvw1yJlT2nIYXK+9YnehjQMKk7fX6DHR1S6vxuuFj3gw9LOSdWssonU0S2OVloT
	 HYJZ9uPQygTHrsXatnWREA0QtzZIotG5Q8pkyPowOM6m6K34aSM9iRVBWOkL3B3kdH
	 HeTwmfV2xykSS9FhPIykT2uKF5y8k0yOWRGZOe+nc/0a+iC986agvz+CmVLyJJucIg
	 L5VoDas8tUzkiH3Fo4vn7yZ5PSc5/zkUKqAcZHlzs7M9oIwDD3kqKHeuQVYHcmSY3V
	 0nTcKD2dh1sNw==
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
Subject: [PATCH v5 05/14] gpio: ml-ioh: Use modern PM macros
Date: Mon, 24 Nov 2025 08:20:56 +0800
Message-ID: <20251124002105.25429-6-jszhang@kernel.org>
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
Acked-by: Andy Shevchenko <andy@kernel.org>
Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
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


