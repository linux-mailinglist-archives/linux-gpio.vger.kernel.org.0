Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C3A1E1F58
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Oct 2019 17:31:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392449AbfJWPbB (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Oct 2019 11:31:01 -0400
Received: from mga11.intel.com ([192.55.52.93]:9180 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392441AbfJWPbB (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 23 Oct 2019 11:31:01 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Oct 2019 08:31:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,221,1569308400"; 
   d="scan'208";a="203992073"
Received: from black.fi.intel.com ([10.237.72.28])
  by FMSMGA003.fm.intel.com with ESMTP; 23 Oct 2019 08:30:58 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 360A8BD; Wed, 23 Oct 2019 18:30:56 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Yury Norov <yury.norov@gmail.com>,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        William Breathitt Gray <vilhelm.gray@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] gpio: pca953x: Reduce stack usage in couple of functions
Date:   Wed, 23 Oct 2019 18:30:56 +0300
Message-Id: <20191023153056.64262-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Simple bitmap operations are safe against in-place modifications.
Due to above we may get rid of temporary variables in some cases.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

Andrew, it can be folded into "gpio: pca953x: Convert to use bitmap API"

 drivers/gpio/gpio-pca953x.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index f80ed5a43614..b9e326dfed23 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -468,7 +468,6 @@ static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	DECLARE_BITMAP(reg_val, MAX_LINE);
-	DECLARE_BITMAP(new_val, MAX_LINE);
 	int ret;
 
 	mutex_lock(&chip->i2c_lock);
@@ -476,9 +475,9 @@ static void pca953x_gpio_set_multiple(struct gpio_chip *gc,
 	if (ret)
 		goto exit;
 
-	bitmap_replace(new_val, reg_val, bits, mask, gc->ngpio);
+	bitmap_replace(reg_val, reg_val, bits, mask, gc->ngpio);
 
-	pca953x_write_regs(chip, chip->regs->output, new_val);
+	pca953x_write_regs(chip, chip->regs->output, reg_val);
 exit:
 	mutex_unlock(&chip->i2c_lock);
 }
@@ -605,7 +604,6 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
 	DECLARE_BITMAP(irq_mask, MAX_LINE);
 	DECLARE_BITMAP(reg_direction, MAX_LINE);
-	DECLARE_BITMAP(new_irqs, MAX_LINE);
 	int level;
 
 	pca953x_read_regs(chip, chip->regs->direction, reg_direction);
@@ -620,8 +618,8 @@ static void pca953x_irq_bus_sync_unlock(struct irq_data *d)
 		pca953x_write_regs(chip, PCAL953X_INT_MASK, irq_mask);
 	}
 
-	bitmap_or(new_irqs, chip->irq_trig_fall, chip->irq_trig_raise, gc->ngpio);
-	bitmap_and(irq_mask, new_irqs, reg_direction, gc->ngpio);
+	bitmap_or(irq_mask, chip->irq_trig_fall, chip->irq_trig_raise, gc->ngpio);
+	bitmap_and(irq_mask, irq_mask, reg_direction, gc->ngpio);
 
 	/* Look for any newly setup interrupt */
 	for_each_set_bit(level, irq_mask, gc->ngpio)
-- 
2.23.0

