Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21DA524056D
	for <lists+linux-gpio@lfdr.de>; Mon, 10 Aug 2020 13:43:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbgHJLn5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 Aug 2020 07:43:57 -0400
Received: from mga17.intel.com ([192.55.52.151]:38092 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726141AbgHJLn5 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 Aug 2020 07:43:57 -0400
IronPort-SDR: vp85RRV6W5cvuxOONXFuDvnbo5xuuCtBVGbuDECBE0DLshbF5M3mVHSFYNs7ANOJ7Lxspd9hYS
 Gs0hQk81FRGQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9708"; a="133570629"
X-IronPort-AV: E=Sophos;i="5.75,457,1589266800"; 
   d="scan'208";a="133570629"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2020 04:43:56 -0700
IronPort-SDR: 9+k0PKqF2ju37RgsV6Y1ey9nQ8BPI8ZhXC9T5L1KPB26xoldPhm9MXPH22F3IT8w52BIddKX+e
 cF3+2DtAAY6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,457,1589266800"; 
   d="scan'208";a="334205848"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 10 Aug 2020 04:43:55 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 53DA2190; Mon, 10 Aug 2020 14:43:54 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] gpio: aggregator: Refactor ->{get,set}_multiple() to make Sparse happy
Date:   Mon, 10 Aug 2020 14:43:53 +0300
Message-Id: <20200810114353.48761-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Sparse can't see locking scheme used in ->get_multiple() and
->set_multiple() callbacks.
  CHECK   .../drivers/gpio/gpio-aggregator.c
  .../spinlock.h:409:9: warning: context imbalance in 'gpio_fwd_get_multiple' - unexpected unlock
  .../spinlock.h:409:9: warning: context imbalance in 'gpio_fwd_set_multiple' - unexpected unlock

Refactor them to have better readability and make Sparse happy.

Code size impact is +52 bytes with arm-linux-gnueabihf-gcc 7.5.0.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2: fixed indentation, added tag and code size summary (Geert)
 drivers/gpio/gpio-aggregator.c | 70 +++++++++++++++++++++-------------
 1 file changed, 43 insertions(+), 27 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 424a3d25350b..dfd8a4876a27 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -333,20 +333,14 @@ static int gpio_fwd_get(struct gpio_chip *chip, unsigned int offset)
 	return gpiod_get_value(fwd->descs[offset]);
 }
 
-static int gpio_fwd_get_multiple(struct gpio_chip *chip, unsigned long *mask,
+static int gpio_fwd_get_multiple(struct gpiochip_fwd *fwd, unsigned long *mask,
 				 unsigned long *bits)
 {
-	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
-	unsigned long *values, flags = 0;
 	struct gpio_desc **descs;
+	unsigned long *values;
 	unsigned int i, j = 0;
 	int error;
 
-	if (chip->can_sleep)
-		mutex_lock(&fwd->mlock);
-	else
-		spin_lock_irqsave(&fwd->slock, flags);
-
 	/* Both values bitmap and desc pointers are stored in tmp[] */
 	values = &fwd->tmp[0];
 	descs = (void *)&fwd->tmp[BITS_TO_LONGS(fwd->chip.ngpio)];
@@ -356,16 +350,32 @@ static int gpio_fwd_get_multiple(struct gpio_chip *chip, unsigned long *mask,
 		descs[j++] = fwd->descs[i];
 
 	error = gpiod_get_array_value(j, descs, NULL, values);
-	if (!error) {
-		j = 0;
-		for_each_set_bit(i, mask, fwd->chip.ngpio)
-			__assign_bit(i, bits, test_bit(j++, values));
-	}
+	if (error)
+		return error;
 
-	if (chip->can_sleep)
+	j = 0;
+	for_each_set_bit(i, mask, fwd->chip.ngpio)
+		__assign_bit(i, bits, test_bit(j++, values));
+
+	return 0;
+}
+
+static int gpio_fwd_get_multiple_locked(struct gpio_chip *chip,
+					unsigned long *mask, unsigned long *bits)
+{
+	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
+	unsigned long flags;
+	int error;
+
+	if (chip->can_sleep) {
+		mutex_lock(&fwd->mlock);
+		error = gpio_fwd_get_multiple(fwd, mask, bits);
 		mutex_unlock(&fwd->mlock);
-	else
+	} else {
+		spin_lock_irqsave(&fwd->slock, flags);
+		error = gpio_fwd_get_multiple(fwd, mask, bits);
 		spin_unlock_irqrestore(&fwd->slock, flags);
+	}
 
 	return error;
 }
@@ -377,19 +387,13 @@ static void gpio_fwd_set(struct gpio_chip *chip, unsigned int offset, int value)
 	gpiod_set_value(fwd->descs[offset], value);
 }
 
-static void gpio_fwd_set_multiple(struct gpio_chip *chip, unsigned long *mask,
+static void gpio_fwd_set_multiple(struct gpiochip_fwd *fwd, unsigned long *mask,
 				  unsigned long *bits)
 {
-	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
-	unsigned long *values, flags = 0;
 	struct gpio_desc **descs;
+	unsigned long *values;
 	unsigned int i, j = 0;
 
-	if (chip->can_sleep)
-		mutex_lock(&fwd->mlock);
-	else
-		spin_lock_irqsave(&fwd->slock, flags);
-
 	/* Both values bitmap and desc pointers are stored in tmp[] */
 	values = &fwd->tmp[0];
 	descs = (void *)&fwd->tmp[BITS_TO_LONGS(fwd->chip.ngpio)];
@@ -400,11 +404,23 @@ static void gpio_fwd_set_multiple(struct gpio_chip *chip, unsigned long *mask,
 	}
 
 	gpiod_set_array_value(j, descs, NULL, values);
+}
 
-	if (chip->can_sleep)
+static void gpio_fwd_set_multiple_locked(struct gpio_chip *chip,
+					 unsigned long *mask, unsigned long *bits)
+{
+	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
+	unsigned long flags;
+
+	if (chip->can_sleep) {
+		mutex_lock(&fwd->mlock);
+		gpio_fwd_set_multiple(fwd, mask, bits);
 		mutex_unlock(&fwd->mlock);
-	else
+	} else {
+		spin_lock_irqsave(&fwd->slock, flags);
+		gpio_fwd_set_multiple(fwd, mask, bits);
 		spin_unlock_irqrestore(&fwd->slock, flags);
+	}
 }
 
 static int gpio_fwd_set_config(struct gpio_chip *chip, unsigned int offset,
@@ -470,9 +486,9 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 	chip->direction_input = gpio_fwd_direction_input;
 	chip->direction_output = gpio_fwd_direction_output;
 	chip->get = gpio_fwd_get;
-	chip->get_multiple = gpio_fwd_get_multiple;
+	chip->get_multiple = gpio_fwd_get_multiple_locked;
 	chip->set = gpio_fwd_set;
-	chip->set_multiple = gpio_fwd_set_multiple;
+	chip->set_multiple = gpio_fwd_set_multiple_locked;
 	chip->base = -1;
 	chip->ngpio = ngpios;
 	fwd->descs = descs;
-- 
2.28.0

