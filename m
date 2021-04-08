Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C53F135879B
	for <lists+linux-gpio@lfdr.de>; Thu,  8 Apr 2021 16:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231370AbhDHO4G (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 8 Apr 2021 10:56:06 -0400
Received: from mga18.intel.com ([134.134.136.126]:10662 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231944AbhDHO4F (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 8 Apr 2021 10:56:05 -0400
IronPort-SDR: PuEtk4t5/b5e5ZTBC3+1HQ8pbCGMqiC2L6+TPmQEON/nrlfgG53JLa9NGVlILfCD4eIA8HvpYN
 3W5SwRpvjBjw==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="181094277"
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; 
   d="scan'208";a="181094277"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2021 07:55:53 -0700
IronPort-SDR: EEX3VAhkDUiFbAe2G+UdaW6g/WyY6lPK3kVNkc1tGT/dRh4zXTAL44U6RLn2eB30CutvxH7Aal
 HNIimKL+v5Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,206,1613462400"; 
   d="scan'208";a="380282808"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga003.jf.intel.com with ESMTP; 08 Apr 2021 07:55:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 2A4D459A; Thu,  8 Apr 2021 17:56:05 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Syed Nayyar Waris <syednwaris@gmail.com>,
        vilhelm.gray@gmail.com
Subject: [PATCH v1 4/5] gpio: xilinx: Switch to use bitmap APIs
Date:   Thu,  8 Apr 2021 17:56:00 +0300
Message-Id: <20210408145601.68651-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210408145601.68651-1-andriy.shevchenko@linux.intel.com>
References: <20210408145601.68651-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

It seems that Xilinx GPIO driver operates with bit arrays longer than 32 and
thus can leverage bitmap APIs for that. It makes code better to understand.

The ->probe() function is modified to try read properties for both channels
since is_dual check makes only sense for the amount of pins used for the second
channel. On top of that kzalloc() guarantees zero initial values for the fields
in the private data structure, hence drop unneeded conditionals and assignments.

The change is inspired by Syed Nayyar Waris' ideas about bitmap API extension.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-xilinx.c | 350 ++++++++++++++++++-------------------
 1 file changed, 171 insertions(+), 179 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index e6c78409ab3a..98d90b4c4d2b 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -5,6 +5,7 @@
  * Copyright 2008 - 2013 Xilinx, Inc.
  */
 
+#include <linux/bitmap.h>
 #include <linux/bitops.h>
 #include <linux/clk.h>
 #include <linux/errno.h>
@@ -44,40 +45,56 @@
  * struct xgpio_instance - Stores information about GPIO device
  * @gc: GPIO chip
  * @regs: register block
- * @gpio_width: GPIO width for every channel
- * @gpio_state: GPIO write state shadow register
- * @gpio_last_irq_read: GPIO read state register from last interrupt
- * @gpio_dir: GPIO direction shadow register
+ * @hw_map: GPIO pin mapping on hardware side
+ * @sw_map: GPIO pin mapping on software side
+ * @state: GPIO write state shadow register
+ * @last_irq_read: GPIO read state register from last interrupt
+ * @dir: GPIO direction shadow register
  * @gpio_lock: Lock used for synchronization
  * @irq: IRQ used by GPIO device
  * @irqchip: IRQ chip
- * @irq_enable: GPIO IRQ enable/disable bitfield
- * @irq_rising_edge: GPIO IRQ rising edge enable/disable bitfield
- * @irq_falling_edge: GPIO IRQ falling edge enable/disable bitfield
+ * @enable: GPIO IRQ enable/disable bitfield
+ * @rising_edge: GPIO IRQ rising edge enable/disable bitfield
+ * @falling_edge: GPIO IRQ falling edge enable/disable bitfield
  * @clk: clock resource for this driver
  */
 struct xgpio_instance {
 	struct gpio_chip gc;
 	void __iomem *regs;
-	unsigned int gpio_width[2];
-	u32 gpio_state[2];
-	u32 gpio_last_irq_read[2];
-	u32 gpio_dir[2];
+	DECLARE_BITMAP(hw_map, 64);
+	DECLARE_BITMAP(sw_map, 64);
+	DECLARE_BITMAP(state, 64);
+	DECLARE_BITMAP(last_irq_read, 64);
+	DECLARE_BITMAP(dir, 64);
 	spinlock_t gpio_lock;	/* For serializing operations */
 	int irq;
 	struct irq_chip irqchip;
-	u32 irq_enable[2];
-	u32 irq_rising_edge[2];
-	u32 irq_falling_edge[2];
+	DECLARE_BITMAP(enable, 64);
+	DECLARE_BITMAP(rising_edge, 64);
+	DECLARE_BITMAP(falling_edge, 64);
 	struct clk *clk;
 };
 
-static inline int xgpio_index(struct xgpio_instance *chip, int gpio)
+static inline int xgpio_to_bit(struct xgpio_instance *chip, int gpio)
 {
-	if (gpio >= chip->gpio_width[0])
-		return 1;
+	return bitmap_bitremap(gpio, chip->sw_map, chip->hw_map, chip->gc.ngpio);
+}
 
-	return 0;
+static inline u32 xgpio_get_value32(const unsigned long *map, int bit)
+{
+	const size_t index = BIT_WORD(bit);
+	const unsigned long offset = (bit % BITS_PER_LONG) & BIT(5);
+
+	return (map[index] >> offset) & 0xFFFFFFFFul;
+}
+
+static inline void xgpio_set_value32(unsigned long *map, int bit, u32 v)
+{
+	const size_t index = BIT_WORD(bit);
+	const unsigned long offset = (bit % BITS_PER_LONG) & BIT(5);
+
+	map[index] &= ~(0xFFFFFFFFul << offset);
+	map[index] |= v << offset;
 }
 
 static inline int xgpio_regoffset(struct xgpio_instance *chip, int ch)
@@ -92,22 +109,32 @@ static inline int xgpio_regoffset(struct xgpio_instance *chip, int ch)
 	}
 }
 
-static inline u32 xgpio_read_chan(struct xgpio_instance *chip, int reg, int ch)
+static void xgpio_read_ch(struct xgpio_instance *chip, int reg, int bit, unsigned long *a)
 {
-	return xgpio_readreg(chip->regs + reg + xgpio_regoffset(chip, ch));
+	void __iomem *addr = chip->regs + reg + xgpio_regoffset(chip, bit / 32);
+	xgpio_set_value32(a, bit, xgpio_readreg(addr));
 }
 
-static inline void xgpio_write_chan(struct xgpio_instance *chip, int reg, int ch, u32 v)
+static void xgpio_write_ch(struct xgpio_instance *chip, int reg, int bit, unsigned long *a)
 {
-	xgpio_writereg(chip->regs + reg + xgpio_regoffset(chip, ch), v);
+	void __iomem *addr = chip->regs + reg + xgpio_regoffset(chip, bit / 32);
+	xgpio_writereg(addr, xgpio_get_value32(a, bit));
 }
 
-static inline int xgpio_offset(struct xgpio_instance *chip, int gpio)
+static void xgpio_read_ch_all(struct xgpio_instance *chip, int reg, unsigned long *a)
 {
-	if (xgpio_index(chip, gpio))
-		return gpio - chip->gpio_width[0];
+	int bit, lastbit = xgpio_to_bit(chip, chip->gc.ngpio - 1);
 
-	return gpio;
+	for (bit = 0; bit <= lastbit ; bit += 32)
+		xgpio_read_ch(chip, reg, bit, a);
+}
+
+static void xgpio_write_ch_all(struct xgpio_instance *chip, int reg, unsigned long *a)
+{
+	int bit, lastbit = xgpio_to_bit(chip, chip->gc.ngpio - 1);
+
+	for (bit = 0; bit <= lastbit ; bit += 32)
+		xgpio_write_ch(chip, reg, bit, a);
 }
 
 /**
@@ -124,13 +151,12 @@ static inline int xgpio_offset(struct xgpio_instance *chip, int gpio)
 static int xgpio_get(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct xgpio_instance *chip = gpiochip_get_data(gc);
-	int index = xgpio_index(chip, gpio);
-	int offset = xgpio_offset(chip, gpio);
-	u32 val;
+	int bit = xgpio_to_bit(chip, gpio);
+	DECLARE_BITMAP(state, 64);
 
-	val = xgpio_read_chan(chip, XGPIO_DATA_OFFSET, index);
+	xgpio_read_ch(chip, XGPIO_DATA_OFFSET, bit, state);
 
-	return !!(val & BIT(offset));
+	return test_bit(bit, state);
 }
 
 /**
@@ -146,18 +172,14 @@ static void xgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	unsigned long flags;
 	struct xgpio_instance *chip = gpiochip_get_data(gc);
-	int index =  xgpio_index(chip, gpio);
-	int offset =  xgpio_offset(chip, gpio);
+	int bit = xgpio_to_bit(chip, gpio);
 
 	spin_lock_irqsave(&chip->gpio_lock, flags);
 
 	/* Write to GPIO signal and set its direction to output */
-	if (val)
-		chip->gpio_state[index] |= BIT(offset);
-	else
-		chip->gpio_state[index] &= ~BIT(offset);
+	__assign_bit(bit, chip->state, val);
 
-	xgpio_write_chan(chip, XGPIO_DATA_OFFSET, index, chip->gpio_state[index]);
+	xgpio_write_ch(chip, XGPIO_DATA_OFFSET, bit, chip->state);
 
 	spin_unlock_irqrestore(&chip->gpio_lock, flags);
 }
@@ -174,35 +196,22 @@ static void xgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 			       unsigned long *bits)
 {
+	DECLARE_BITMAP(hw_mask, 64);
+	DECLARE_BITMAP(hw_bits, 64);
+	DECLARE_BITMAP(state, 64);
 	unsigned long flags;
 	struct xgpio_instance *chip = gpiochip_get_data(gc);
-	int index = xgpio_index(chip, 0);
-	int offset, i;
+
+	bitmap_remap(hw_mask, mask, chip->sw_map, chip->hw_map, 64);
+	bitmap_remap(hw_bits, bits, chip->sw_map, chip->hw_map, 64);
 
 	spin_lock_irqsave(&chip->gpio_lock, flags);
 
-	/* Write to GPIO signals */
-	for (i = 0; i < gc->ngpio; i++) {
-		if (*mask == 0)
-			break;
-		/* Once finished with an index write it out to the register */
-		if (index !=  xgpio_index(chip, i)) {
-			xgpio_write_chan(chip, XGPIO_DATA_OFFSET, index,
-					 chip->gpio_state[index]);
-			spin_unlock_irqrestore(&chip->gpio_lock, flags);
-			index =  xgpio_index(chip, i);
-			spin_lock_irqsave(&chip->gpio_lock, flags);
-		}
-		if (__test_and_clear_bit(i, mask)) {
-			offset =  xgpio_offset(chip, i);
-			if (test_bit(i, bits))
-				chip->gpio_state[index] |= BIT(offset);
-			else
-				chip->gpio_state[index] &= ~BIT(offset);
-		}
-	}
+	bitmap_replace(state, chip->state, hw_bits, hw_mask, gc->ngpio);
 
-	xgpio_write_chan(chip, XGPIO_DATA_OFFSET, index, chip->gpio_state[index]);
+	xgpio_write_ch_all(chip, XGPIO_DATA_OFFSET, state);
+
+	bitmap_copy(chip->state, state, gc->ngpio);
 
 	spin_unlock_irqrestore(&chip->gpio_lock, flags);
 }
@@ -220,14 +229,13 @@ static int xgpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 {
 	unsigned long flags;
 	struct xgpio_instance *chip = gpiochip_get_data(gc);
-	int index =  xgpio_index(chip, gpio);
-	int offset =  xgpio_offset(chip, gpio);
+	int bit = xgpio_to_bit(chip, gpio);
 
 	spin_lock_irqsave(&chip->gpio_lock, flags);
 
 	/* Set the GPIO bit in shadow register and set direction as input */
-	chip->gpio_dir[index] |= BIT(offset);
-	xgpio_write_chan(chip, XGPIO_TRI_OFFSET, index, chip->gpio_dir[index]);
+	__set_bit(bit, chip->dir);
+	xgpio_write_ch(chip, XGPIO_TRI_OFFSET, bit, chip->dir);
 
 	spin_unlock_irqrestore(&chip->gpio_lock, flags);
 
@@ -250,21 +258,17 @@ static int xgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	unsigned long flags;
 	struct xgpio_instance *chip = gpiochip_get_data(gc);
-	int index =  xgpio_index(chip, gpio);
-	int offset =  xgpio_offset(chip, gpio);
+	int bit = xgpio_to_bit(chip, gpio);
 
 	spin_lock_irqsave(&chip->gpio_lock, flags);
 
 	/* Write state of GPIO signal */
-	if (val)
-		chip->gpio_state[index] |= BIT(offset);
-	else
-		chip->gpio_state[index] &= ~BIT(offset);
-	xgpio_write_chan(chip, XGPIO_DATA_OFFSET, index, chip->gpio_state[index]);
+	__assign_bit(bit, chip->state, val);
+	xgpio_write_ch(chip, XGPIO_DATA_OFFSET, bit, chip->state);
 
 	/* Clear the GPIO bit in shadow register and set direction as output */
-	chip->gpio_dir[index] &= ~BIT(offset);
-	xgpio_write_chan(chip, XGPIO_TRI_OFFSET, index, chip->gpio_dir[index]);
+	__clear_bit(bit, chip->dir);
+	xgpio_write_ch(chip, XGPIO_TRI_OFFSET, bit, chip->dir);
 
 	spin_unlock_irqrestore(&chip->gpio_lock, flags);
 
@@ -277,14 +281,8 @@ static int xgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
  */
 static void xgpio_save_regs(struct xgpio_instance *chip)
 {
-	xgpio_write_chan(chip, XGPIO_DATA_OFFSET, 0, chip->gpio_state[0]);
-	xgpio_write_chan(chip, XGPIO_TRI_OFFSET, 0, chip->gpio_dir[0]);
-
-	if (!chip->gpio_width[1])
-		return;
-
-	xgpio_write_chan(chip, XGPIO_DATA_OFFSET, 1, chip->gpio_state[1]);
-	xgpio_write_chan(chip, XGPIO_TRI_OFFSET, 1, chip->gpio_dir[1]);
+	xgpio_write_ch_all(chip, XGPIO_DATA_OFFSET, chip->state);
+	xgpio_write_ch_all(chip, XGPIO_TRI_OFFSET, chip->dir);
 }
 
 static int xgpio_request(struct gpio_chip *chip, unsigned int offset)
@@ -399,18 +397,17 @@ static void xgpio_irq_mask(struct irq_data *irq_data)
 	unsigned long flags;
 	struct xgpio_instance *chip = irq_data_get_irq_chip_data(irq_data);
 	int irq_offset = irqd_to_hwirq(irq_data);
-	int index = xgpio_index(chip, irq_offset);
-	int offset = xgpio_offset(chip, irq_offset);
+	int bit = xgpio_to_bit(chip, irq_offset);
+	u32 mask = BIT(bit / 32), temp;
 
 	spin_lock_irqsave(&chip->gpio_lock, flags);
 
-	chip->irq_enable[index] &= ~BIT(offset);
+	__clear_bit(bit, chip->enable);
 
-	if (!chip->irq_enable[index]) {
+	if (xgpio_get_value32(chip->enable, bit) == 0) {
 		/* Disable per channel interrupt */
-		u32 temp = xgpio_readreg(chip->regs + XGPIO_IPIER_OFFSET);
-
-		temp &= ~BIT(index);
+		temp = xgpio_readreg(chip->regs + XGPIO_IPIER_OFFSET);
+		temp &= ~mask;
 		xgpio_writereg(chip->regs + XGPIO_IPIER_OFFSET, temp);
 	}
 	spin_unlock_irqrestore(&chip->gpio_lock, flags);
@@ -425,29 +422,26 @@ static void xgpio_irq_unmask(struct irq_data *irq_data)
 	unsigned long flags;
 	struct xgpio_instance *chip = irq_data_get_irq_chip_data(irq_data);
 	int irq_offset = irqd_to_hwirq(irq_data);
-	int index = xgpio_index(chip, irq_offset);
-	int offset = xgpio_offset(chip, irq_offset);
-	u32 old_enable = chip->irq_enable[index];
+	int bit = xgpio_to_bit(chip, irq_offset);
+	u32 old_enable = xgpio_get_value32(chip->enable, bit);
+	u32 mask = BIT(bit / 32), val;
 
 	spin_lock_irqsave(&chip->gpio_lock, flags);
 
-	chip->irq_enable[index] |= BIT(offset);
+	__set_bit(bit, chip->enable);
 
-	if (!old_enable) {
+	if (old_enable == 0) {
 		/* Clear any existing per-channel interrupts */
-		u32 val = xgpio_readreg(chip->regs + XGPIO_IPISR_OFFSET) &
-			BIT(index);
-
-		if (val)
-			xgpio_writereg(chip->regs + XGPIO_IPISR_OFFSET, val);
+		val = xgpio_readreg(chip->regs + XGPIO_IPISR_OFFSET);
+		val &= mask;
+		xgpio_writereg(chip->regs + XGPIO_IPISR_OFFSET, val);
 
 		/* Update GPIO IRQ read data before enabling interrupt*/
-		val = xgpio_read_chan(chip, XGPIO_DATA_OFFSET, index);
-		chip->gpio_last_irq_read[index] = val;
+		xgpio_read_ch(chip, XGPIO_DATA_OFFSET, bit, chip->last_irq_read);
 
 		/* Enable per channel interrupt */
 		val = xgpio_readreg(chip->regs + XGPIO_IPIER_OFFSET);
-		val |= BIT(index);
+		val |= mask;
 		xgpio_writereg(chip->regs + XGPIO_IPIER_OFFSET, val);
 	}
 
@@ -466,8 +460,7 @@ static int xgpio_set_irq_type(struct irq_data *irq_data, unsigned int type)
 {
 	struct xgpio_instance *chip = irq_data_get_irq_chip_data(irq_data);
 	int irq_offset = irqd_to_hwirq(irq_data);
-	int index = xgpio_index(chip, irq_offset);
-	int offset = xgpio_offset(chip, irq_offset);
+	int bit = xgpio_to_bit(chip, irq_offset);
 
 	/*
 	 * The Xilinx GPIO hardware provides a single interrupt status
@@ -477,16 +470,16 @@ static int xgpio_set_irq_type(struct irq_data *irq_data, unsigned int type)
 	 */
 	switch (type & IRQ_TYPE_SENSE_MASK) {
 	case IRQ_TYPE_EDGE_BOTH:
-		chip->irq_rising_edge[index] |= BIT(offset);
-		chip->irq_falling_edge[index] |= BIT(offset);
+		__set_bit(bit, chip->rising_edge);
+		__set_bit(bit, chip->falling_edge);
 		break;
 	case IRQ_TYPE_EDGE_RISING:
-		chip->irq_rising_edge[index] |= BIT(offset);
-		chip->irq_falling_edge[index] &= ~BIT(offset);
+		__set_bit(bit, chip->rising_edge);
+		__clear_bit(bit, chip->falling_edge);
 		break;
 	case IRQ_TYPE_EDGE_FALLING:
-		chip->irq_rising_edge[index] &= ~BIT(offset);
-		chip->irq_falling_edge[index] |= BIT(offset);
+		__clear_bit(bit, chip->rising_edge);
+		__set_bit(bit, chip->falling_edge);
 		break;
 	default:
 		return -EINVAL;
@@ -503,46 +496,43 @@ static int xgpio_set_irq_type(struct irq_data *irq_data, unsigned int type)
 static void xgpio_irqhandler(struct irq_desc *desc)
 {
 	struct xgpio_instance *chip = irq_desc_get_handler_data(desc);
+	struct gpio_chip *gc = &chip->gc;
 	struct irq_chip *irqchip = irq_desc_get_chip(desc);
-	u32 num_channels = chip->gpio_width[1] ? 2 : 1;
-	u32 offset = 0, index;
-	u32 status = xgpio_readreg(chip->regs + XGPIO_IPISR_OFFSET);
+	DECLARE_BITMAP(rising, 64);
+	DECLARE_BITMAP(falling, 64);
+	DECLARE_BITMAP(all, 64);
+	u32 status;
+	u32 bit;
+	unsigned long flags;
 
+	status = xgpio_readreg(chip->regs + XGPIO_IPISR_OFFSET);
 	xgpio_writereg(chip->regs + XGPIO_IPISR_OFFSET, status);
 
 	chained_irq_enter(irqchip, desc);
-	for (index = 0; index < num_channels; index++) {
-		if ((status & BIT(index))) {
-			unsigned long rising_events, falling_events, all_events;
-			unsigned long flags;
-			u32 data, bit;
-			unsigned int irq;
-
-			spin_lock_irqsave(&chip->gpio_lock, flags);
-			data = xgpio_read_chan(chip, XGPIO_DATA_OFFSET, index);
-			rising_events = data &
-					~chip->gpio_last_irq_read[index] &
-					chip->irq_enable[index] &
-					chip->irq_rising_edge[index];
-			falling_events = ~data &
-					 chip->gpio_last_irq_read[index] &
-					 chip->irq_enable[index] &
-					 chip->irq_falling_edge[index];
-			dev_dbg(chip->gc.parent,
-				"IRQ chan %u rising 0x%lx falling 0x%lx\n",
-				index, rising_events, falling_events);
-			all_events = rising_events | falling_events;
-			chip->gpio_last_irq_read[index] = data;
-			spin_unlock_irqrestore(&chip->gpio_lock, flags);
-
-			for_each_set_bit(bit, &all_events, 32) {
-				irq = irq_find_mapping(chip->gc.irq.domain,
-						       offset + bit);
-				generic_handle_irq(irq);
-			}
-		}
-		offset += chip->gpio_width[index];
-	}
+
+	spin_lock_irqsave(&chip->gpio_lock, flags);
+
+	xgpio_read_ch_all(chip, XGPIO_DATA_OFFSET, all);
+
+	bitmap_complement(rising, chip->last_irq_read, 64);
+	bitmap_and(rising, rising, all, 64);
+	bitmap_and(rising, rising, chip->enable, 64);
+	bitmap_and(rising, rising, chip->rising_edge, 64);
+
+	bitmap_complement(falling, all, 64);
+	bitmap_and(falling, falling, chip->last_irq_read, 64);
+	bitmap_and(falling, falling, chip->enable, 64);
+	bitmap_and(falling, falling, chip->falling_edge, 64);
+
+	bitmap_copy(chip->last_irq_read, all, 64);
+	bitmap_or(all, rising, falling, 64);
+
+	spin_unlock_irqrestore(&chip->gpio_lock, flags);
+
+	dev_dbg(gc->parent, "IRQ rising %*pb falling %*pb\n", 64, rising, 64, falling);
+
+	for_each_set_bit(bit, all, 64)
+		generic_handle_irq(irq_find_mapping(gc->irq.domain, bit));
 
 	chained_irq_exit(irqchip, desc);
 }
@@ -562,6 +552,9 @@ static int xgpio_probe(struct platform_device *pdev)
 	struct device_node *np = pdev->dev.of_node;
 	u32 is_dual = 0;
 	u32 cells = 2;
+	u32 width[2];
+	u32 state[2];
+	u32 dir[2];
 	struct gpio_irq_chip *girq;
 	u32 temp;
 
@@ -571,13 +564,25 @@ static int xgpio_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, chip);
 
+	/* First, check if the device is dual-channel */
+	of_property_read_u32(np, "xlnx,is-dual", &is_dual);
+
+	/* Setup defaults */
+	memset32(width, 0, ARRAY_SIZE(width));
+	memset32(state, 0, ARRAY_SIZE(state));
+	memset32(dir, 0xFFFFFFFF, ARRAY_SIZE(dir));
+
 	/* Update GPIO state shadow register with default value */
-	if (of_property_read_u32(np, "xlnx,dout-default", &chip->gpio_state[0]))
-		chip->gpio_state[0] = 0x0;
+	of_property_read_u32(np, "xlnx,dout-default", &state[0]);
+	of_property_read_u32(np, "xlnx,dout-default-2", &state[1]);
+
+	bitmap_from_arr32(chip->state, state, 64);
 
 	/* Update GPIO direction shadow register with default value */
-	if (of_property_read_u32(np, "xlnx,tri-default", &chip->gpio_dir[0]))
-		chip->gpio_dir[0] = 0xFFFFFFFF;
+	of_property_read_u32(np, "xlnx,tri-default", &dir[0]);
+	of_property_read_u32(np, "xlnx,tri-default-2", &dir[1]);
+
+	bitmap_from_arr32(chip->dir, dir, 64);
 
 	/* Update cells with gpio-cells value */
 	if (of_property_read_u32(np, "#gpio-cells", &cells))
@@ -592,42 +597,29 @@ static int xgpio_probe(struct platform_device *pdev)
 	 * Check device node and parent device node for device width
 	 * and assume default width of 32
 	 */
-	if (of_property_read_u32(np, "xlnx,gpio-width", &chip->gpio_width[0]))
-		chip->gpio_width[0] = 32;
+	if (of_property_read_u32(np, "xlnx,gpio-width", &width[0]))
+		width[0] = 32;
 
-	if (chip->gpio_width[0] > 32)
+	if (width[0] > 32)
 		return -EINVAL;
 
-	spin_lock_init(&chip->gpio_lock);
+	if (is_dual && of_property_read_u32(np, "xlnx,gpio2-width", &width[1]))
+		width[1] = 32;
 
-	if (of_property_read_u32(np, "xlnx,is-dual", &is_dual))
-		is_dual = 0;
-
-	if (is_dual) {
-		/* Update GPIO state shadow register with default value */
-		if (of_property_read_u32(np, "xlnx,dout-default-2",
-					 &chip->gpio_state[1]))
-			chip->gpio_state[1] = 0x0;
-
-		/* Update GPIO direction shadow register with default value */
-		if (of_property_read_u32(np, "xlnx,tri-default-2",
-					 &chip->gpio_dir[1]))
-			chip->gpio_dir[1] = 0xFFFFFFFF;
-
-		/*
-		 * Check device node and parent device node for device width
-		 * and assume default width of 32
-		 */
-		if (of_property_read_u32(np, "xlnx,gpio2-width",
-					 &chip->gpio_width[1]))
-			chip->gpio_width[1] = 32;
-
-		if (chip->gpio_width[1] > 32)
-			return -EINVAL;
-	}
+	if (width[1] > 32)
+		return -EINVAL;
+
+	/* Setup software pin mapping */
+	bitmap_set(chip->sw_map, 0, width[0] + width[1]);
+
+	/* Setup hardware pin mapping */
+	bitmap_set(chip->hw_map,  0, width[0]);
+	bitmap_set(chip->hw_map, 32, width[1]);
+
+	spin_lock_init(&chip->gpio_lock);
 
 	chip->gc.base = -1;
-	chip->gc.ngpio = chip->gpio_width[0] + chip->gpio_width[1];
+	chip->gc.ngpio = bitmap_weight(chip->hw_map, 64);
 	chip->gc.parent = &pdev->dev;
 	chip->gc.direction_input = xgpio_dir_in;
 	chip->gc.direction_output = xgpio_dir_out;
-- 
2.30.2

