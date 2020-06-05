Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C02B11EF973
	for <lists+linux-gpio@lfdr.de>; Fri,  5 Jun 2020 15:40:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726844AbgFENkl (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 5 Jun 2020 09:40:41 -0400
Received: from mga06.intel.com ([134.134.136.31]:61677 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726553AbgFENkk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 5 Jun 2020 09:40:40 -0400
IronPort-SDR: yu1F1gpBxLw0VcljA6GsIuNvJmQAFH9W5Y8wj68qv/3hPxnGRHF2gaQk9xQwzVy9c77DHkEoRH
 +w4RlV4UWrMw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2020 06:40:39 -0700
IronPort-SDR: ds+TaJtRvlShUDrfzmkqUPJGYmNiL8dav8nGpC+LLXtruJ/jmFZ9orQ0mPgWS54xzu2x9fFgWU
 0HgUHNB0tcWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,476,1583222400"; 
   d="scan'208";a="258033471"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 05 Jun 2020 06:40:37 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 1BB57190; Fri,  5 Jun 2020 16:40:37 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        Roland Stigge <stigge@antcom.de>
Subject: [PATCH v1 1/4] gpio: pca953x: Synchronize interrupt handler properly
Date:   Fri,  5 Jun 2020 16:40:33 +0300
Message-Id: <20200605134036.9013-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.27.0.rc2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since the commit aa58a21ae378 ("gpio: pca953x: disable regmap locking")
the locking of regmap is disabled and that immediately introduces
a synchronization issue. It's easy to see when we try to monitor
more than one interrupt from the same chip.

It seems that the problem exists from the day one and even commit
6e20fb18054c ("drivers/gpio/pca953x.c: add a mutex to fix race condition")
missed this.

Below are the traces and shell reproducers before and after proposed change.
Note duplicates in the IRQ events. /proc/interrupts also shows a deviation,
i.e. sum of children interrupts higher than parent's one.

When locking is disabled for regmap and no protection in IRQ handler
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ...
 gpioset-194          regmap_hw_write_start: i2c-INT3491:02 reg=2 count=1
 irq/31-i2c-INT3-139  regmap_hw_read_start: i2c-INT3491:02 reg=4c count=2
 gpioset-194          regmap_hw_write_done: i2c-INT3491:02 reg=2 count=1
 gpioset-194          regmap_reg_read_cache: i2c-INT3491:02 reg=6 val=f5
 gpioset-194          regmap_reg_write: i2c-INT3491:02 reg=6 val=f5
 gpioset-194          regmap_hw_write_start: i2c-INT3491:02 reg=6 count=1
 irq/31-i2c-INT3-139  regmap_hw_read_done: i2c-INT3491:02 reg=4c count=2
 ...

 % gpiomon gpiochip3 0 &
 % gpioset gpiochip3 1=0
 % gpioset gpiochip3 1=1
 event:  RISING EDGE offset: 0 timestamp: [     302.782583765]
 % gpiomon gpiochip3 2 &
 % gpioset gpiochip3 1=0
 event:  RISING EDGE offset: 2 timestamp: [     312.033148829]
 event: FALLING EDGE offset: 0 timestamp: [     312.022757525]
 % gpioset gpiochip3 1=1
 event:  RISING EDGE offset: 2 timestamp: [     316.201148473]
 event:  RISING EDGE offset: 0 timestamp: [     316.191759599]

When locking is disabled for regmap and protection in IRQ handler
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 ...
 gpioset-202          regmap_hw_write_start: i2c-INT3491:02 reg=2 count=1
 gpioset-202          regmap_hw_write_done: i2c-INT3491:02 reg=2 count=1
 gpioset-202          regmap_reg_read_cache: i2c-INT3491:02 reg=6 val=fd
 gpioset-202          regmap_reg_write: i2c-INT3491:02 reg=6 val=fd
 gpioset-202          regmap_hw_write_start: i2c-INT3491:02 reg=6 count=1
 gpioset-202          regmap_hw_write_done: i2c-INT3491:02 reg=6 count=1
 irq/31-i2c-INT3-139  regmap_hw_read_start: i2c-INT3491:02 reg=4c count=2
 irq/31-i2c-INT3-139  regmap_hw_read_done: i2c-INT3491:02 reg=4c count=2
 ...

 % gpiomon gpiochip3 0 &
 % gpioset gpiochip3 1=0
 event: FALLING EDGE offset: 0 timestamp: [     531.330078107]
 % gpioset gpiochip3 1=1
 event:  RISING EDGE offset: 0 timestamp: [     532.912239128]
 % gpiomon gpiochip3 2 &
 % gpioset gpiochip3 1=0
 event: FALLING EDGE offset: 0 timestamp: [     539.633669484]
 % gpioset gpiochip3 1=1
 event:  RISING EDGE offset: 0 timestamp: [     542.256978461]

Fixes: 6e20fb18054c ("drivers/gpio/pca953x.c: add a mutex to fix race condition")
Depends-on: 35d13d94893f ("gpio: pca953x: convert to use bitmap API")
Depends-on: 49427232764d ("gpio: pca953x: Perform basic regmap conversion")
Cc: Marek Vasut <marek.vasut@gmail.com>
Cc: Roland Stigge <stigge@antcom.de>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pca953x.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 1fca8dd7824f..afe78639ec58 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -734,14 +734,16 @@ static irqreturn_t pca953x_irq_handler(int irq, void *devid)
 	struct gpio_chip *gc = &chip->gpio_chip;
 	DECLARE_BITMAP(pending, MAX_LINE);
 	int level;
+	bool ret;
 
-	if (!pca953x_irq_pending(chip, pending))
-		return IRQ_NONE;
+	mutex_lock(&chip->i2c_lock);
+	ret = pca953x_irq_pending(chip, pending);
+	mutex_unlock(&chip->i2c_lock);
 
 	for_each_set_bit(level, pending, gc->ngpio)
 		handle_nested_irq(irq_find_mapping(gc->irq.domain, level));
 
-	return IRQ_HANDLED;
+	return IRQ_RETVAL(ret);
 }
 
 static int pca953x_irq_setup(struct pca953x_chip *chip, int irq_base)
-- 
2.27.0.rc2

