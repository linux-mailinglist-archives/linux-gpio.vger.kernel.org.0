Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1F7FE0AA5
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2019 19:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388135AbfJVR3f (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Oct 2019 13:29:35 -0400
Received: from mga07.intel.com ([134.134.136.100]:29854 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388369AbfJVR3c (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 22 Oct 2019 13:29:32 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Oct 2019 10:29:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,217,1569308400"; 
   d="scan'208";a="203706926"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 22 Oct 2019 10:29:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 393194F8; Tue, 22 Oct 2019 20:29:24 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Yury Norov <yury.norov@gmail.com>,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        William Breathitt Gray <vilhelm.gray@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: [PATCH v2 10/11] gpio: pca953x: Convert to use bitmap API
Date:   Tue, 22 Oct 2019 20:29:21 +0300
Message-Id: <20191022172922.61232-11-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191022172922.61232-1-andriy.shevchenko@linux.intel.com>
References: <20191022172922.61232-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Instead of customized approach convert the driver to use bitmap API.

Depends-on: 6e9c6674d1bf ("gpio: pca953x: utilize the for_each_set_clump8 macro")
Cc: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pca953x.c | 168 ++++++++++++++++--------------------
 1 file changed, 73 insertions(+), 95 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 7a57304b5c31..774e4c69df03 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -9,8 +9,7 @@
  */
 
 #include <linux/acpi.h>
-#include <linux/bits.h>
-#include <linux/bitops.h>
+#include <linux/bitmap.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
@@ -116,6 +115,7 @@ MODULE_DEVICE_TABLE(acpi, pca953x_acpi_ids);
 
 #define MAX_BANK 5
 #define BANK_SZ 8
+#define MAX_LINE	(MAX_BANK * BANK_SZ)
 
 #define NBANK(chip) DIV_ROUND_UP(chip->gpio_chip.ngpio, BANK_SZ)
 
@@ -147,10 +147,10 @@ struct pca953x_chip {
 
 #ifdef CONFIG_GPIO_PCA953X_IRQ
 	struct mutex irq_lock;
-	u8 irq_mask[MAX_BANK];
-	u8 irq_stat[MAX_BANK];
-	u8 irq_trig_raise[MAX_BANK];
-	u8 irq_trig_fall[MAX_BANK];
+	DECLARE_BITMAP(irq_mask, MAX_LINE);
+	DECLARE_BITMAP(irq_stat, MAX_LINE);
+	DECLARE_BITMAP(irq_trig_raise, MAX_LINE);
+	DECLARE_BITMAP(irq_trig_fall, MAX_LINE);
 	struct irq_chip irq_chip;
 #endif
 	atomic_t wakeup_path;
@@ -334,12 +334,16 @@ static u8 pca953x_recalc_addr(struct pca953x_chip *chip, int reg, int off,
 	return regaddr;
 }
 
-static int pca953x_write_regs(struct pca953x_chip *chip, int reg, u8 *val)
+static int pca953x_write_regs(struct pca953x_chip *chip, int reg, unsigned long *val)
 {
 	u8 regaddr = pca953x_recalc_addr(chip, reg, 0, true, true);
-	int ret;
+	u8 value[MAX_BANK];
+	int i, ret;
+
+	for (i = 0; i < NBANK(chip); i++)
+		value[i] = bitmap_get_value8(val, i * BANK_SZ);
 
-	ret = regmap_bulk_write(chip->regmap, regaddr, val, NBANK(chip));
+	ret = regmap_bulk_write(chip->regmap, regaddr, value, NBANK(chip));
 	if (ret < 0) {
 		dev_err(&chip->client->dev, "failed writing register\n");
 		return ret;
@@ -348,17 +352,21 @@ static int pca953x_write_regs(struct pca953x_chip *chip, int reg, u8 *val)
 	return 0;
 }
 
-static int pca953x_read_regs(struct pca953x_chip *chip, int reg, u8 *val)
+static int pca953x_read_regs(struct pca953x_chip *chip, int reg, unsigned long *val)
 {
 	u8 regaddr = pca953x_recalc_addr(chip, reg, 0, false, true);
-	int ret;
+	u8 value[MAX_BANK];
+	int i, ret;
 
-	ret = regmap_bulk_read(chip->regmap, regaddr, val, NBANK(chip));
+	ret = regmap_bulk_read(chip->regmap, regaddr, value, NBANK(chip));
 	if (ret < 0) {
 		dev_err(&chip->client->dev, "failed reading register\n");
 		return ret;
 	}
 
+	for (i = 0; i < NBANK(chip); i++)
+		bitmap_set_value8(val, value[i], i * BANK_SZ);
+
 	return 0;
 }
 
@@ -457,10 +465,8 @@ static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
 				      unsigned long *mask, unsigned long *bits)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
-	unsigned long offset;
-	unsigned long bank_mask;
-	int bank;
-	u8 reg_val[MAX_BANK];
+	DECLARE_BITMAP(reg_val, MAX_LINE);
+	DECLARE_BITMAP(new_val, MAX_LINE);
 	int ret;
 
 	mutex_lock(&chip->i2c_lock);
@@ -468,13 +474,9 @@ static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
 	if (ret)
 		goto exit;
 
-	for_each_set_clump8(offset, bank_mask, mask, gc->ngpio) {
-		bank = offset / 8;
-		reg_val[bank] &= ~bank_mask;
-		reg_val[bank] |= bitmap_get_value8(bits, offset) & bank_mask;
-	}
+	bitmap_replace(new_val, reg_val, bits, mask, gc->ngpio);
 
-	pca953x_write_regs(chip, chip->regs->output, reg_val);
+	pca953x_write_regs(chip, chip->regs->output, new_val);
 exit:
 	mutex_unlock(&chip->i2c_lock);
 }
@@ -599,10 +601,10 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 {
 	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
-	u8 new_irqs;
-	int level, i;
-	u8 invert_irq_mask[MAX_BANK];
-	u8 reg_direction[MAX_BANK];
+	DECLARE_BITMAP(irq_mask, MAX_LINE);
+	DECLARE_BITMAP(reg_direction, MAX_LINE);
+	DECLARE_BITMAP(new_irqs, MAX_LINE);
+	int level;
 
 	pca953x_read_regs(chip, chip->regs->direction, reg_direction);
 
@@ -610,25 +612,18 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 		/* Enable latch on interrupt-enabled inputs */
 		pca953x_write_regs(chip, PCAL953X_IN_LATCH, chip->irq_mask);
 
-		for (i = 0; i < NBANK(chip); i++)
-			invert_irq_mask[i] = ~chip->irq_mask[i];
+		bitmap_complement(irq_mask, chip->irq_mask, gc->ngpio);
 
 		/* Unmask enabled interrupts */
-		pca953x_write_regs(chip, PCAL953X_INT_MASK, invert_irq_mask);
+		pca953x_write_regs(chip, PCAL953X_INT_MASK, irq_mask);
 	}
 
+	bitmap_or(new_irqs, chip->irq_trig_fall, chip->irq_trig_raise, gc->ngpio);
+	bitmap_and(irq_mask, new_irqs, reg_direction, gc->ngpio);
+
 	/* Look for any newly setup interrupt */
-	for (i = 0; i < NBANK(chip); i++) {
-		new_irqs = chip->irq_trig_fall[i] | chip->irq_trig_raise[i];
-		new_irqs &= reg_direction[i];
-
-		while (new_irqs) {
-			level = __ffs(new_irqs);
-			pca953x_gpio_direction_input(&chip->gpio_chip,
-							level + (BANK_SZ * i));
-			new_irqs &= ~(1 << level);
-		}
-	}
+	for_each_set_bit(level, irq_mask, gc->ngpio)
+		pca953x_gpio_direction_input(&chip->gpio_chip, level);
 
 	mutex_unlock(&chip->irq_lock);
 }
@@ -669,15 +664,15 @@ static void pca953x_irq_shutdown(struct irq_data *d)
 	chip->irq_trig_fall[d->hwirq / BANK_SZ] &= ~mask;
 }
 
-static bool pca953x_irq_pending(struct pca953x_chip *chip, u8 *pending)
+static bool pca953x_irq_pending(struct pca953x_chip *chip, unsigned long *pending)
 {
-	u8 cur_stat[MAX_BANK];
-	u8 old_stat[MAX_BANK];
-	bool pending_seen = false;
-	bool trigger_seen = false;
-	u8 trigger[MAX_BANK];
-	u8 reg_direction[MAX_BANK];
-	int ret, i;
+	struct gpio_chip *gc = &chip->gpio_chip;
+	DECLARE_BITMAP(reg_direction, MAX_LINE);
+	DECLARE_BITMAP(old_stat, MAX_LINE);
+	DECLARE_BITMAP(cur_stat, MAX_LINE);
+	DECLARE_BITMAP(new_stat, MAX_LINE);
+	DECLARE_BITMAP(trigger, MAX_LINE);
+	int ret;
 
 	if (chip->driver_data & PCA_PCAL) {
 		/* Read the current interrupt status from the device */
@@ -690,16 +685,12 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, u8 *pending)
 		if (ret)
 			return false;
 
-		for (i = 0; i < NBANK(chip); i++) {
-			/* Apply filter for rising/falling edge selection */
-			pending[i] = (~cur_stat[i] & chip->irq_trig_fall[i]) |
-				(cur_stat[i] & chip->irq_trig_raise[i]);
-			pending[i] &= trigger[i];
-			if (pending[i])
-				pending_seen = true;
-		}
+		/* Apply filter for rising/falling edge selection */
+		bitmap_replace(new_stat, chip->irq_trig_fall, chip->irq_trig_raise, cur_stat, gc->ngpio);
+
+		bitmap_and(pending, new_stat, trigger, gc->ngpio);
 
-		return pending_seen;
+		return !bitmap_empty(pending, gc->ngpio);
 	}
 
 	ret = pca953x_read_regs(chip, chip->regs->input, cur_stat);
@@ -708,51 +699,38 @@ static bool pca953x_irq_pending(struct pca953x_chip *chip, u8 *pending)
 
 	/* Remove output pins from the equation */
 	pca953x_read_regs(chip, chip->regs->direction, reg_direction);
-	for (i = 0; i < NBANK(chip); i++)
-		cur_stat[i] &= reg_direction[i];
 
-	memcpy(old_stat, chip->irq_stat, NBANK(chip));
+	bitmap_copy(old_stat, chip->irq_stat, gc->ngpio);
 
-	for (i = 0; i < NBANK(chip); i++) {
-		trigger[i] = (cur_stat[i] ^ old_stat[i]) & chip->irq_mask[i];
-		if (trigger[i])
-			trigger_seen = true;
-	}
+	bitmap_and(new_stat, cur_stat, reg_direction, gc->ngpio);
+	bitmap_xor(cur_stat, new_stat, old_stat, gc->ngpio);
+	bitmap_and(trigger, cur_stat, chip->irq_mask, gc->ngpio);
 
-	if (!trigger_seen)
+	if (bitmap_empty(trigger, gc->ngpio))
 		return false;
 
-	memcpy(chip->irq_stat, cur_stat, NBANK(chip));
+	bitmap_copy(chip->irq_stat, new_stat, gc->ngpio);
 
-	for (i = 0; i < NBANK(chip); i++) {
-		pending[i] = (old_stat[i] & chip->irq_trig_fall[i]) |
-			(cur_stat[i] & chip->irq_trig_raise[i]);
-		pending[i] &= trigger[i];
-		if (pending[i])
-			pending_seen = true;
-	}
+	bitmap_and(cur_stat, chip->irq_trig_fall, old_stat, gc->ngpio);
+	bitmap_and(old_stat, chip->irq_trig_raise, new_stat, gc->ngpio);
+	bitmap_or(new_stat, old_stat, cur_stat, gc->ngpio);
+	bitmap_and(pending, new_stat, trigger, gc->ngpio);
 
-	return pending_seen;
+	return !bitmap_empty(pending, gc->ngpio);
 }
 
 static irqreturn_t pca953x_irq_handler(int irq, void *devid)
 {
 	struct pca953x_chip *chip = devid;
-	u8 pending[MAX_BANK];
-	u8 level;
-	int i;
+	struct gpio_chip *gc = &chip->gpio_chip;
+	DECLARE_BITMAP(pending, MAX_LINE);
+	int level;
 
 	if (!pca953x_irq_pending(chip, pending))
 		return IRQ_NONE;
 
-	for (i = 0; i < NBANK(chip); i++) {
-		while (pending[i]) {
-			level = __ffs(pending[i]);
-			handle_nested_irq(irq_find_mapping(chip->gpio_chip.irq.domain,
-							level + (BANK_SZ * i)));
-			pending[i] &= ~(1 << level);
-		}
-	}
+	for_each_set_bit(level, pending, gc->ngpio)
+		handle_nested_irq(irq_find_mapping(gc->irq.domain, level));
 
 	return IRQ_HANDLED;
 }
@@ -762,8 +740,9 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
 {
 	struct i2c_client *client = chip->client;
 	struct irq_chip *irq_chip = &chip->irq_chip;
-	u8 reg_direction[MAX_BANK];
-	int ret, i;
+	DECLARE_BITMAP(reg_direction, MAX_LINE);
+	DECLARE_BITMAP(irq_stat, MAX_LINE);
+	int ret;
 
 	if (!client->irq)
 		return 0;
@@ -774,7 +753,7 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
 	if (!(chip->driver_data & PCA_INT))
 		return 0;
 
-	ret = pca953x_read_regs(chip, chip->regs->input, chip->irq_stat);
+	ret = pca953x_read_regs(chip, chip->regs->input, irq_stat);
 	if (ret)
 		return ret;
 
@@ -784,8 +763,7 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
 	 * this purpose.
 	 */
 	pca953x_read_regs(chip, chip->regs->direction, reg_direction);
-	for (i = 0; i < NBANK(chip); i++)
-		chip->irq_stat[i] &= reg_direction[i];
+	bitmap_and(chip->irq_stat, irq_stat, reg_direction, chip->gpio_chip.ngpio);
 	mutex_init(&chip->irq_lock);
 
 	ret = devm_request_threaded_irq(&client->dev, client->irq,
@@ -837,8 +815,8 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
 
 static int device_pca95xx_init(struct pca953x_chip *chip, u32 invert)
 {
+	DECLARE_BITMAP(val, MAX_LINE);
 	int ret;
-	u8 val[MAX_BANK];
 
 	ret = regcache_sync_region(chip->regmap, chip->regs->output,
 				   chip->regs->output + NBANK(chip));
@@ -852,9 +830,9 @@ static int device_pca95xx_init(struct pca953x_chip *chip, u32 invert)
 
 	/* set platform specific polarity inversion */
 	if (invert)
-		memset(val, 0xFF, NBANK(chip));
+		bitmap_fill(val, MAX_LINE);
 	else
-		memset(val, 0, NBANK(chip));
+		bitmap_zero(val, MAX_LINE);
 
 	ret = pca953x_write_regs(chip, chip->regs->invert, val);
 out:
@@ -863,8 +841,8 @@ static int device_pca95xx_init(struct pca953x_chip *chip, u32 invert)
 
 static int device_pca957x_init(struct pca953x_chip *chip, u32 invert)
 {
+	DECLARE_BITMAP(val, MAX_LINE);
 	int ret;
-	u8 val[MAX_BANK];
 
 	ret = device_pca95xx_init(chip, invert);
 	if (ret)
-- 
2.23.0

