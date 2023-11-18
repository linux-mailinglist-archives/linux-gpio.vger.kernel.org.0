Return-Path: <linux-gpio+bounces-229-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7CE7EFE3D
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Nov 2023 08:20:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA4D72810FE
	for <lists+linux-gpio@lfdr.de>; Sat, 18 Nov 2023 07:20:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C0463A9;
	Sat, 18 Nov 2023 07:20:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wi08mWIQ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94D4010C1;
	Fri, 17 Nov 2023 23:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700292047; x=1731828047;
  h=from:to:cc:subject:date:message-id;
  bh=/3RNJmy1ggEAgE/GU+rF3svP5lPBkaGraqn1BV5Oe7c=;
  b=Wi08mWIQQZ1WtrZBUvH7h3pyQ9JyJDhxoApELjYOI5VQoC6WlgL0mot0
   ypzYrNA6jQk6DvNhq73BMvHgXZe9w5155JIwXnyrOnqMPJ9VBAiB00B62
   ySf2yCVdY5YpDuJD5iRNkAjv3sP3LKymX7eD8pNO/8uHUDd6J0rYaYyPL
   Ary4pyexp7ZFKfAIkFbij5kRKgTAZXD6Ml3HobGW+zBztR2ObDSxIehXs
   0PnP1CnV45p864VRf+5HeSfM+70q1/orgxSiOv02lkKg+VPn6gDfpnjKW
   sovZI9W5ZS978SagnPZ7y9FhE+N8ktdmejUDxEWZxMRQtayYyAxd2Xky7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="12964370"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="12964370"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2023 23:20:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="831805263"
X-IronPort-AV: E=Sophos;i="6.04,207,1695711600"; 
   d="scan'208";a="831805263"
Received: from inlubt0316.iind.intel.com ([10.191.20.213])
  by fmsmga008.fm.intel.com with ESMTP; 17 Nov 2023 23:20:44 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	mika.westerberg@linux.intel.com,
	andriy.shevchenko@linux.intel.com
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v1] gpio: tangier: simplify locking using cleanup helpers
Date: Sat, 18 Nov 2023 12:50:37 +0530
Message-Id: <20231118072037.10804-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Use lock guards from cleanup.h to simplify locking.

Signed-off-by: Raag Jadav <raag.jadav@intel.com>
---
 drivers/gpio/gpio-tangier.c | 54 ++++++++++---------------------------
 1 file changed, 14 insertions(+), 40 deletions(-)

diff --git a/drivers/gpio/gpio-tangier.c b/drivers/gpio/gpio-tangier.c
index 158fa9054e9c..b75e0b12087a 100644
--- a/drivers/gpio/gpio-tangier.c
+++ b/drivers/gpio/gpio-tangier.c
@@ -10,6 +10,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/errno.h>
 #include <linux/export.h>
@@ -92,37 +93,31 @@ static int tng_gpio_get(struct gpio_chip *chip, unsigned int offset)
 static void tng_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	struct tng_gpio *priv = gpiochip_get_data(chip);
-	unsigned long flags;
 	void __iomem *reg;
 	u8 shift;
 
 	reg = gpio_reg_and_bit(chip, offset, value ? GPSR : GPCR, &shift);
 
-	raw_spin_lock_irqsave(&priv->lock, flags);
+	guard(raw_spinlock_irqsave)(&priv->lock);
 
 	writel(BIT(shift), reg);
-
-	raw_spin_unlock_irqrestore(&priv->lock, flags);
 }
 
 static int tng_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
 	struct tng_gpio *priv = gpiochip_get_data(chip);
-	unsigned long flags;
 	void __iomem *gpdr;
 	u32 value;
 	u8 shift;
 
 	gpdr = gpio_reg_and_bit(chip, offset, GPDR, &shift);
 
-	raw_spin_lock_irqsave(&priv->lock, flags);
+	guard(raw_spinlock_irqsave)(&priv->lock);
 
 	value = readl(gpdr);
 	value &= ~BIT(shift);
 	writel(value, gpdr);
 
-	raw_spin_unlock_irqrestore(&priv->lock, flags);
-
 	return 0;
 }
 
@@ -130,21 +125,18 @@ static int tng_gpio_direction_output(struct gpio_chip *chip, unsigned int offset
 				     int value)
 {
 	struct tng_gpio *priv = gpiochip_get_data(chip);
-	unsigned long flags;
 	void __iomem *gpdr;
 	u8 shift;
 
 	gpdr = gpio_reg_and_bit(chip, offset, GPDR, &shift);
 	tng_gpio_set(chip, offset, value);
 
-	raw_spin_lock_irqsave(&priv->lock, flags);
+	guard(raw_spinlock_irqsave)(&priv->lock);
 
 	value = readl(gpdr);
 	value |= BIT(shift);
 	writel(value, gpdr);
 
-	raw_spin_unlock_irqrestore(&priv->lock, flags);
-
 	return 0;
 }
 
@@ -165,14 +157,13 @@ static int tng_gpio_set_debounce(struct gpio_chip *chip, unsigned int offset,
 				 unsigned int debounce)
 {
 	struct tng_gpio *priv = gpiochip_get_data(chip);
-	unsigned long flags;
 	void __iomem *gfbr;
 	u32 value;
 	u8 shift;
 
 	gfbr = gpio_reg_and_bit(chip, offset, GFBR, &shift);
 
-	raw_spin_lock_irqsave(&priv->lock, flags);
+	guard(raw_spinlock_irqsave)(&priv->lock);
 
 	value = readl(gfbr);
 	if (debounce)
@@ -181,8 +172,6 @@ static int tng_gpio_set_debounce(struct gpio_chip *chip, unsigned int offset,
 		value |= BIT(shift);
 	writel(value, gfbr);
 
-	raw_spin_unlock_irqrestore(&priv->lock, flags);
-
 	return 0;
 }
 
@@ -208,27 +197,25 @@ static void tng_irq_ack(struct irq_data *d)
 {
 	struct tng_gpio *priv = irq_data_get_irq_chip_data(d);
 	irq_hw_number_t gpio = irqd_to_hwirq(d);
-	unsigned long flags;
 	void __iomem *gisr;
 	u8 shift;
 
 	gisr = gpio_reg_and_bit(&priv->chip, gpio, GISR, &shift);
 
-	raw_spin_lock_irqsave(&priv->lock, flags);
+	guard(raw_spinlock_irqsave)(&priv->lock);
+
 	writel(BIT(shift), gisr);
-	raw_spin_unlock_irqrestore(&priv->lock, flags);
 }
 
 static void tng_irq_unmask_mask(struct tng_gpio *priv, u32 gpio, bool unmask)
 {
-	unsigned long flags;
 	void __iomem *gimr;
 	u32 value;
 	u8 shift;
 
 	gimr = gpio_reg_and_bit(&priv->chip, gpio, GIMR, &shift);
 
-	raw_spin_lock_irqsave(&priv->lock, flags);
+	guard(raw_spinlock_irqsave)(&priv->lock);
 
 	value = readl(gimr);
 	if (unmask)
@@ -236,8 +223,6 @@ static void tng_irq_unmask_mask(struct tng_gpio *priv, u32 gpio, bool unmask)
 	else
 		value &= ~BIT(shift);
 	writel(value, gimr);
-
-	raw_spin_unlock_irqrestore(&priv->lock, flags);
 }
 
 static void tng_irq_mask(struct irq_data *d)
@@ -268,10 +253,9 @@ static int tng_irq_set_type(struct irq_data *d, unsigned int type)
 	void __iomem *gitr = gpio_reg(&priv->chip, gpio, GITR);
 	void __iomem *glpr = gpio_reg(&priv->chip, gpio, GLPR);
 	u8 shift = gpio % 32;
-	unsigned long flags;
 	u32 value;
 
-	raw_spin_lock_irqsave(&priv->lock, flags);
+	guard(raw_spinlock_irqsave)(&priv->lock);
 
 	value = readl(grer);
 	if (type & IRQ_TYPE_EDGE_RISING)
@@ -312,8 +296,6 @@ static int tng_irq_set_type(struct irq_data *d, unsigned int type)
 		irq_set_handler_locked(d, handle_edge_irq);
 	}
 
-	raw_spin_unlock_irqrestore(&priv->lock, flags);
-
 	return 0;
 }
 
@@ -325,10 +307,11 @@ static int tng_irq_set_wake(struct irq_data *d, unsigned int on)
 	void __iomem *gwmr = gpio_reg(&priv->chip, gpio, priv->wake_regs.gwmr);
 	void __iomem *gwsr = gpio_reg(&priv->chip, gpio, priv->wake_regs.gwsr);
 	u8 shift = gpio % 32;
-	unsigned long flags;
 	u32 value;
 
-	raw_spin_lock_irqsave(&priv->lock, flags);
+	dev_dbg(priv->dev, "%s wake for gpio %lu\n", str_enable_disable(on), gpio);
+
+	guard(raw_spinlock_irqsave)(&priv->lock);
 
 	/* Clear the existing wake status */
 	writel(BIT(shift), gwsr);
@@ -340,9 +323,6 @@ static int tng_irq_set_wake(struct irq_data *d, unsigned int on)
 		value &= ~BIT(shift);
 	writel(value, gwmr);
 
-	raw_spin_unlock_irqrestore(&priv->lock, flags);
-
-	dev_dbg(priv->dev, "%s wake for gpio %lu\n", str_enable_disable(on), gpio);
 	return 0;
 }
 
@@ -482,10 +462,9 @@ static int tng_gpio_suspend(struct device *dev)
 {
 	struct tng_gpio *priv = dev_get_drvdata(dev);
 	struct tng_gpio_context *ctx = priv->ctx;
-	unsigned long flags;
 	unsigned int base;
 
-	raw_spin_lock_irqsave(&priv->lock, flags);
+	guard(raw_spinlock_irqsave)(&priv->lock);
 
 	for (base = 0; base < priv->chip.ngpio; base += 32, ctx++) {
 		/* GPLR is RO, values read will be restored using GPSR */
@@ -499,8 +478,6 @@ static int tng_gpio_suspend(struct device *dev)
 		ctx->gwmr = readl(gpio_reg(&priv->chip, base, priv->wake_regs.gwmr));
 	}
 
-	raw_spin_unlock_irqrestore(&priv->lock, flags);
-
 	return 0;
 }
 
@@ -508,10 +485,9 @@ static int tng_gpio_resume(struct device *dev)
 {
 	struct tng_gpio *priv = dev_get_drvdata(dev);
 	struct tng_gpio_context *ctx = priv->ctx;
-	unsigned long flags;
 	unsigned int base;
 
-	raw_spin_lock_irqsave(&priv->lock, flags);
+	guard(raw_spinlock_irqsave)(&priv->lock);
 
 	for (base = 0; base < priv->chip.ngpio; base += 32, ctx++) {
 		/* GPLR is RO, values read will be restored using GPSR */
@@ -525,8 +501,6 @@ static int tng_gpio_resume(struct device *dev)
 		writel(ctx->gwmr, gpio_reg(&priv->chip, base, priv->wake_regs.gwmr));
 	}
 
-	raw_spin_unlock_irqrestore(&priv->lock, flags);
-
 	return 0;
 }
 

base-commit: fb77e8a8591512449c6736fd718c33a8afab8b95
-- 
2.17.1


