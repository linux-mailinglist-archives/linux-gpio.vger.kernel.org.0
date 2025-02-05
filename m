Return-Path: <linux-gpio+bounces-15368-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33402A28698
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 10:32:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5A9B37A1099
	for <lists+linux-gpio@lfdr.de>; Wed,  5 Feb 2025 09:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 506AD22A4CB;
	Wed,  5 Feb 2025 09:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ks8NbTrT"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E562021A452;
	Wed,  5 Feb 2025 09:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738747928; cv=none; b=Qdvv5LJcj0sGfwxOQ5wSCvB+/HTWp2v+th59OmGmx75mbe/2o07eLBbmhgE/NhlJcIWNZ7Rck61wMUHiDS28dSldGb4tk0GTBEIGZHKv9K5HdowxHO5ajZ9QRhnUt66FHVS8WsD/NxbFy/gpFXa/qHilhgs6tmDV0Qrr40Cd9M4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738747928; c=relaxed/simple;
	bh=sEL+RL9bkM7/DYpMbQAOmXoxyvdc786QUWh+3yHBmgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XsVmJ3RoOSPhBLV+Uj7FCK9c3irppjaSuMTifMReKbLH10TBA+a+azkrQk2PopJlPFZq3TWLQMEE0RaOAbqCnEOg5n4kyx6V/rBVETOzQwah82nTihDn3cB8PM8w+7HueV70rCrn3UjsUgfhdyMRCyhHY4rbnrH32P3vDbr1Wnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ks8NbTrT; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738747926; x=1770283926;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sEL+RL9bkM7/DYpMbQAOmXoxyvdc786QUWh+3yHBmgM=;
  b=ks8NbTrT2K83A0AnVC9UeorPQUPYGp4bmnBQt61jKyRJtgoucG0DKIGk
   dkCyjcakWKSOJX6CaoMbC6uex6JWJ92/HPP8CezySfQKV1EBEsGhaULaH
   zTf+eJc0N+nFfwmAd8O8A8AvG7mujn/0WypN9AVt9hCdFFNjuErHBGvL8
   I82Yusp36JJ6h8aLctl614sq1TyWx74/xTTQqzs6GaHZHGzPzEtvlNR43
   S46B22JRnsCk928XelwNHzk/EAxE6/R9ap8isgF2+0yiwgo9tGQx6fewc
   OWH1dv7SauVZYCxVCdMyY0Gk9UlkvufMNLGcdsPz8Es8/rg8irgJ2BK8G
   w==;
X-CSE-ConnectionGUID: 70RIU1+xRMGj0OvEWG7lHw==
X-CSE-MsgGUID: XxZ7asdbTrK50lGl8Ytymw==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39189568"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="39189568"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 01:32:05 -0800
X-CSE-ConnectionGUID: 03+xP5BUQFyBZvntu6YzPQ==
X-CSE-MsgGUID: XDFsYrzKTBuaTZIkELaRUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115466169"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 05 Feb 2025 01:32:02 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 21F16299; Wed, 05 Feb 2025 11:32:01 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 1/2] gpio: xilinx: Use better bitmap APIs where appropriate
Date: Wed,  5 Feb 2025 11:31:10 +0200
Message-ID: <20250205093200.373709-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250205093200.373709-1-andriy.shevchenko@linux.intel.com>
References: <20250205093200.373709-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are bitmap_gather() and bitmap_scatter() that are factually
simplified version of the APIs used in the driver. Use them where
appropriate.

While at it, replace bitmap_bitremap() with find_nth_bit()
for the sake of simplification.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-xilinx.c | 68 +++++++++++++++-----------------------
 1 file changed, 27 insertions(+), 41 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 792d94c49077..1ff527ccf6c7 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -45,8 +45,7 @@
  * struct xgpio_instance - Stores information about GPIO device
  * @gc: GPIO chip
  * @regs: register block
- * @hw_map: GPIO pin mapping on hardware side
- * @sw_map: GPIO pin mapping on software side
+ * @map: GPIO pin mapping on hardware side
  * @state: GPIO write state shadow register
  * @last_irq_read: GPIO read state register from last interrupt
  * @dir: GPIO direction shadow register
@@ -60,8 +59,7 @@
 struct xgpio_instance {
 	struct gpio_chip gc;
 	void __iomem *regs;
-	DECLARE_BITMAP(hw_map, 64);
-	DECLARE_BITMAP(sw_map, 64);
+	DECLARE_BITMAP(map, 64);
 	DECLARE_BITMAP(state, 64);
 	DECLARE_BITMAP(last_irq_read, 64);
 	DECLARE_BITMAP(dir, 64);
@@ -73,16 +71,6 @@ struct xgpio_instance {
 	struct clk *clk;
 };
 
-static inline int xgpio_from_bit(struct xgpio_instance *chip, int bit)
-{
-	return bitmap_bitremap(bit, chip->hw_map, chip->sw_map, 64);
-}
-
-static inline int xgpio_to_bit(struct xgpio_instance *chip, int gpio)
-{
-	return bitmap_bitremap(gpio, chip->sw_map, chip->hw_map, 64);
-}
-
 static inline u32 xgpio_get_value32(const unsigned long *map, int bit)
 {
 	const size_t index = BIT_WORD(bit);
@@ -128,7 +116,8 @@ static void xgpio_write_ch(struct xgpio_instance *chip, int reg, int bit, unsign
 
 static void xgpio_read_ch_all(struct xgpio_instance *chip, int reg, unsigned long *a)
 {
-	int bit, lastbit = xgpio_to_bit(chip, chip->gc.ngpio - 1);
+	unsigned long lastbit = find_nth_bit(chip->map, 64, chip->gc.ngpio - 1);
+	int bit;
 
 	for (bit = 0; bit <= lastbit ; bit += 32)
 		xgpio_read_ch(chip, reg, bit, a);
@@ -136,7 +125,8 @@ static void xgpio_read_ch_all(struct xgpio_instance *chip, int reg, unsigned lon
 
 static void xgpio_write_ch_all(struct xgpio_instance *chip, int reg, unsigned long *a)
 {
-	int bit, lastbit = xgpio_to_bit(chip, chip->gc.ngpio - 1);
+	unsigned long lastbit = find_nth_bit(chip->map, 64, chip->gc.ngpio - 1);
+	int bit;
 
 	for (bit = 0; bit <= lastbit ; bit += 32)
 		xgpio_write_ch(chip, reg, bit, a);
@@ -156,7 +146,7 @@ static void xgpio_write_ch_all(struct xgpio_instance *chip, int reg, unsigned lo
 static int xgpio_get(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct xgpio_instance *chip = gpiochip_get_data(gc);
-	int bit = xgpio_to_bit(chip, gpio);
+	unsigned long bit = find_nth_bit(chip->map, 64, gpio);
 	DECLARE_BITMAP(state, 64);
 
 	xgpio_read_ch(chip, XGPIO_DATA_OFFSET, bit, state);
@@ -177,7 +167,7 @@ static void xgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	unsigned long flags;
 	struct xgpio_instance *chip = gpiochip_get_data(gc);
-	int bit = xgpio_to_bit(chip, gpio);
+	unsigned long bit = find_nth_bit(chip->map, 64, gpio);
 
 	raw_spin_lock_irqsave(&chip->gpio_lock, flags);
 
@@ -207,8 +197,8 @@ static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 	unsigned long flags;
 	struct xgpio_instance *chip = gpiochip_get_data(gc);
 
-	bitmap_remap(hw_mask, mask, chip->sw_map, chip->hw_map, 64);
-	bitmap_remap(hw_bits, bits, chip->sw_map, chip->hw_map, 64);
+	bitmap_scatter(hw_mask, mask, chip->map, 64);
+	bitmap_scatter(hw_bits, bits, chip->map, 64);
 
 	raw_spin_lock_irqsave(&chip->gpio_lock, flags);
 
@@ -234,7 +224,7 @@ static int xgpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
 	unsigned long flags;
 	struct xgpio_instance *chip = gpiochip_get_data(gc);
-	int bit = xgpio_to_bit(chip, gpio);
+	unsigned long bit = find_nth_bit(chip->map, 64, gpio);
 
 	raw_spin_lock_irqsave(&chip->gpio_lock, flags);
 
@@ -263,7 +253,7 @@ static int xgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	unsigned long flags;
 	struct xgpio_instance *chip = gpiochip_get_data(gc);
-	int bit = xgpio_to_bit(chip, gpio);
+	unsigned long bit = find_nth_bit(chip->map, 64, gpio);
 
 	raw_spin_lock_irqsave(&chip->gpio_lock, flags);
 
@@ -395,7 +385,7 @@ static void xgpio_irq_mask(struct irq_data *irq_data)
 	unsigned long flags;
 	struct xgpio_instance *chip = irq_data_get_irq_chip_data(irq_data);
 	int irq_offset = irqd_to_hwirq(irq_data);
-	int bit = xgpio_to_bit(chip, irq_offset);
+	unsigned long bit = find_nth_bit(chip->map, 64, irq_offset);
 	u32 mask = BIT(bit / 32), temp;
 
 	raw_spin_lock_irqsave(&chip->gpio_lock, flags);
@@ -422,7 +412,7 @@ static void xgpio_irq_unmask(struct irq_data *irq_data)
 	unsigned long flags;
 	struct xgpio_instance *chip = irq_data_get_irq_chip_data(irq_data);
 	int irq_offset = irqd_to_hwirq(irq_data);
-	int bit = xgpio_to_bit(chip, irq_offset);
+	unsigned long bit = find_nth_bit(chip->map, 64, irq_offset);
 	u32 old_enable = xgpio_get_value32(chip->enable, bit);
 	u32 mask = BIT(bit / 32), val;
 
@@ -462,7 +452,7 @@ static int xgpio_set_irq_type(struct irq_data *irq_data, unsigned int type)
 {
 	struct xgpio_instance *chip = irq_data_get_irq_chip_data(irq_data);
 	int irq_offset = irqd_to_hwirq(irq_data);
-	int bit = xgpio_to_bit(chip, irq_offset);
+	unsigned long bit = find_nth_bit(chip->map, 64, irq_offset);
 
 	/*
 	 * The Xilinx GPIO hardware provides a single interrupt status
@@ -502,10 +492,10 @@ static void xgpio_irqhandler(struct irq_desc *desc)
 	struct irq_chip *irqchip = irq_desc_get_chip(desc);
 	DECLARE_BITMAP(rising, 64);
 	DECLARE_BITMAP(falling, 64);
-	DECLARE_BITMAP(all, 64);
+	DECLARE_BITMAP(hw, 64);
+	DECLARE_BITMAP(sw, 64);
 	int irq_offset;
 	u32 status;
-	u32 bit;
 
 	status = xgpio_readreg(chip->regs + XGPIO_IPISR_OFFSET);
 	xgpio_writereg(chip->regs + XGPIO_IPISR_OFFSET, status);
@@ -514,29 +504,28 @@ static void xgpio_irqhandler(struct irq_desc *desc)
 
 	raw_spin_lock(&chip->gpio_lock);
 
-	xgpio_read_ch_all(chip, XGPIO_DATA_OFFSET, all);
+	xgpio_read_ch_all(chip, XGPIO_DATA_OFFSET, hw);
 
 	bitmap_complement(rising, chip->last_irq_read, 64);
-	bitmap_and(rising, rising, all, 64);
+	bitmap_and(rising, rising, hw, 64);
 	bitmap_and(rising, rising, chip->enable, 64);
 	bitmap_and(rising, rising, chip->rising_edge, 64);
 
-	bitmap_complement(falling, all, 64);
+	bitmap_complement(falling, hw, 64);
 	bitmap_and(falling, falling, chip->last_irq_read, 64);
 	bitmap_and(falling, falling, chip->enable, 64);
 	bitmap_and(falling, falling, chip->falling_edge, 64);
 
-	bitmap_copy(chip->last_irq_read, all, 64);
-	bitmap_or(all, rising, falling, 64);
+	bitmap_copy(chip->last_irq_read, hw, 64);
+	bitmap_or(hw, rising, falling, 64);
 
 	raw_spin_unlock(&chip->gpio_lock);
 
 	dev_dbg(gc->parent, "IRQ rising %*pb falling %*pb\n", 64, rising, 64, falling);
 
-	for_each_set_bit(bit, all, 64) {
-		irq_offset = xgpio_from_bit(chip, bit);
+	bitmap_gather(sw, hw, chip->map, 64);
+	for_each_set_bit(irq_offset, sw, 64)
 		generic_handle_domain_irq(gc->irq.domain, irq_offset);
-	}
 
 	chained_irq_exit(irqchip, desc);
 }
@@ -613,17 +602,14 @@ static int xgpio_probe(struct platform_device *pdev)
 	if (width[1] > 32)
 		return -EINVAL;
 
-	/* Setup software pin mapping */
-	bitmap_set(chip->sw_map, 0, width[0] + width[1]);
-
 	/* Setup hardware pin mapping */
-	bitmap_set(chip->hw_map,  0, width[0]);
-	bitmap_set(chip->hw_map, 32, width[1]);
+	bitmap_set(chip->map,  0, width[0]);
+	bitmap_set(chip->map, 32, width[1]);
 
 	raw_spin_lock_init(&chip->gpio_lock);
 
 	chip->gc.base = -1;
-	chip->gc.ngpio = bitmap_weight(chip->hw_map, 64);
+	chip->gc.ngpio = bitmap_weight(chip->map, 64);
 	chip->gc.parent = dev;
 	chip->gc.direction_input = xgpio_dir_in;
 	chip->gc.direction_output = xgpio_dir_out;
-- 
2.43.0.rc1.1336.g36b5255a03ac


