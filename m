Return-Path: <linux-gpio+bounces-15351-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A99BA27AC3
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 20:03:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2D2291628E2
	for <lists+linux-gpio@lfdr.de>; Tue,  4 Feb 2025 19:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A05E218ABA;
	Tue,  4 Feb 2025 19:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HM+ah0Ho"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7F1219A91;
	Tue,  4 Feb 2025 19:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738695753; cv=none; b=GSbuddIainKl7tndEkEtKDBABY2FPs2V7x2jXt5LV5z1W208eVu09LEA/Tb9m3Y6U7UDwIAykfE4brF+uHgY7L355p3kg7FHVi9lxVtFBq0f4fqlQrlsNqDr3KuJU+xPp8drMggxraQIN/cnzV3ZiyjYktGGqlmZoD9P0VHDbLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738695753; c=relaxed/simple;
	bh=sEL+RL9bkM7/DYpMbQAOmXoxyvdc786QUWh+3yHBmgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gLVY7+AEzQjPWkYrwQ70K8Jp9T90+S5adRvGgkIfenE/MycMDHP0eUMABLQMOgqoMGtzCKwoAcu0Guh7myBFE7Sc/4JfYm+VO96kzWeCJhBGefeKgLhOPCv9/zAIujZzVIN8ePxCD2qzU+KnvvmOGjjfoW0/0Sy5p4I5vA7vKCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HM+ah0Ho; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738695751; x=1770231751;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sEL+RL9bkM7/DYpMbQAOmXoxyvdc786QUWh+3yHBmgM=;
  b=HM+ah0Ho797Lagod/htwM71eE+LbJ4FgccnmL2OF2h3sZb7l9Y8nTzz0
   /SBBrQ7P6PDq7/BcdEebN+NMPRRreKKkaYF5CXL41CgGa7hkZUTDDCdTT
   HgirnGvz9sf59/LtsUtK0EbN52udvJva5z8cAghilsf81h1dMbbgIcfKI
   LTYB/JqPhCiVUvecLOXCsYMf31bigrCaJo6iClyMeqhoSrhlcF7W/5GW6
   53SeHzFWgDCjCCbcoG5RvA+//FXBdrHusZqCgM7BHq8iuoTxT5lsKV4KA
   PmxdCTQ2htgmSy/KkyJXyy84HWXuHHThAqNgibwIhlmuL4EWC0HgUiGSo
   w==;
X-CSE-ConnectionGUID: ThjemqG5SNmPvVwtRyqNbQ==
X-CSE-MsgGUID: Yw0SA+6XSBeTG0kHgVCl2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="39501850"
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="39501850"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 11:02:25 -0800
X-CSE-ConnectionGUID: nGF7aZEGT7K8/BO1l5r56w==
X-CSE-MsgGUID: mdzd++rxT+CrQizee1bvKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,259,1732608000"; 
   d="scan'208";a="141542480"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa002.jf.intel.com with ESMTP; 04 Feb 2025 11:02:22 -0800
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 8F6C4D2; Tue, 04 Feb 2025 21:02:20 +0200 (EET)
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
Subject: [PATCH v1 1/2] gpio: xilinx: Use better bitmap APIs where appropriate
Date: Tue,  4 Feb 2025 21:00:47 +0200
Message-ID: <20250204190218.243537-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20250204190218.243537-1-andriy.shevchenko@linux.intel.com>
References: <20250204190218.243537-1-andriy.shevchenko@linux.intel.com>
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


