Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 530443797E2
	for <lists+linux-gpio@lfdr.de>; Mon, 10 May 2021 21:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231829AbhEJTrn (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 10 May 2021 15:47:43 -0400
Received: from mga03.intel.com ([134.134.136.65]:43252 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231546AbhEJTrl (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 May 2021 15:47:41 -0400
IronPort-SDR: 9d7O9sBmeR4JN2d498EngHzp2vnO4gbQuGKYMKKMBmN1u/WoPwJuZ9lwVNuy57jknlFXypu5FN
 SY9fYz//JJeg==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="199324482"
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; 
   d="scan'208";a="199324482"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2021 12:46:36 -0700
IronPort-SDR: wWi9F5HVRxBjqd7EgEWLiXjudAVJ2wqqtTKYQTJxq+IJlFQgh3HKdKp+f5gUWtFmSHAp6yreGL
 ZZoHynyaJuoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,288,1613462400"; 
   d="scan'208";a="609214218"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 10 May 2021 12:46:33 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 1EAF7D7; Mon, 10 May 2021 22:46:54 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Srinivas Neeli <srinivas.neeli@xilinx.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Yury Norov <yury.norov@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Neeli Srinivas <sneeli@xilinx.com>
Subject: [PATCH v2 3/5] gpio: xilinx: Introduce xgpio_read_chan() / xgpio_write_chan()
Date:   Mon, 10 May 2021 22:46:31 +0300
Message-Id: <20210510194633.11943-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210510194633.11943-1-andriy.shevchenko@linux.intel.com>
References: <20210510194633.11943-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

With the new helpers, i.e. xgpio_read_chan() / xgpio_write_chan(),
the code is easier to read and maintain. No functional changes
intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Neeli Srinivas <sneeli@xilinx.com>
---
 drivers/gpio/gpio-xilinx.c | 68 +++++++++++++++++++++-----------------
 1 file changed, 37 insertions(+), 31 deletions(-)

diff --git a/drivers/gpio/gpio-xilinx.c b/drivers/gpio/gpio-xilinx.c
index 136557e7dd3c..e6c78409ab3a 100644
--- a/drivers/gpio/gpio-xilinx.c
+++ b/drivers/gpio/gpio-xilinx.c
@@ -23,7 +23,8 @@
 #define XGPIO_DATA_OFFSET   (0x0)	/* Data register  */
 #define XGPIO_TRI_OFFSET    (0x4)	/* I/O direction register  */
 
-#define XGPIO_CHANNEL_OFFSET	0x8
+#define XGPIO_CHANNEL0_OFFSET	0x0
+#define XGPIO_CHANNEL1_OFFSET	0x8
 
 #define XGPIO_GIER_OFFSET	0x11c /* Global Interrupt Enable */
 #define XGPIO_GIER_IE		BIT(31)
@@ -79,12 +80,26 @@ static inline int xgpio_index(struct xgpio_instance *chip, int gpio)
 	return 0;
 }
 
-static inline int xgpio_regoffset(struct xgpio_instance *chip, int gpio)
+static inline int xgpio_regoffset(struct xgpio_instance *chip, int ch)
 {
-	if (xgpio_index(chip, gpio))
-		return XGPIO_CHANNEL_OFFSET;
+	switch (ch) {
+	case 0:
+		return XGPIO_CHANNEL0_OFFSET;
+	case 1:
+		return XGPIO_CHANNEL1_OFFSET;
+	default:
+		return -EINVAL;
+	}
+}
 
-	return 0;
+static inline u32 xgpio_read_chan(struct xgpio_instance *chip, int reg, int ch)
+{
+	return xgpio_readreg(chip->regs + reg + xgpio_regoffset(chip, ch));
+}
+
+static inline void xgpio_write_chan(struct xgpio_instance *chip, int reg, int ch, u32 v)
+{
+	xgpio_writereg(chip->regs + reg + xgpio_regoffset(chip, ch), v);
 }
 
 static inline int xgpio_offset(struct xgpio_instance *chip, int gpio)
@@ -109,12 +124,13 @@ static inline int xgpio_offset(struct xgpio_instance *chip, int gpio)
 static int xgpio_get(struct gpio_chip *gc, unsigned int gpio)
 {
 	struct xgpio_instance *chip = gpiochip_get_data(gc);
+	int index = xgpio_index(chip, gpio);
+	int offset = xgpio_offset(chip, gpio);
 	u32 val;
 
-	val = xgpio_readreg(chip->regs + XGPIO_DATA_OFFSET +
-			    xgpio_regoffset(chip, gpio));
+	val = xgpio_read_chan(chip, XGPIO_DATA_OFFSET, index);
 
-	return !!(val & BIT(xgpio_offset(chip, gpio)));
+	return !!(val & BIT(offset));
 }
 
 /**
@@ -141,8 +157,7 @@ static void xgpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 	else
 		chip->gpio_state[index] &= ~BIT(offset);
 
-	xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
-		       xgpio_regoffset(chip, gpio), chip->gpio_state[index]);
+	xgpio_write_chan(chip, XGPIO_DATA_OFFSET, index, chip->gpio_state[index]);
 
 	spin_unlock_irqrestore(&chip->gpio_lock, flags);
 }
@@ -172,9 +187,8 @@ static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 			break;
 		/* Once finished with an index write it out to the register */
 		if (index !=  xgpio_index(chip, i)) {
-			xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
-				       index * XGPIO_CHANNEL_OFFSET,
-				       chip->gpio_state[index]);
+			xgpio_write_chan(chip, XGPIO_DATA_OFFSET, index,
+					 chip->gpio_state[index]);
 			spin_unlock_irqrestore(&chip->gpio_lock, flags);
 			index =  xgpio_index(chip, i);
 			spin_lock_irqsave(&chip->gpio_lock, flags);
@@ -188,8 +202,7 @@ static void xgpio_set_multiple(struct gpio_chip *gc, unsigned long *mask,
 		}
 	}
 
-	xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
-		       index * XGPIO_CHANNEL_OFFSET, chip->gpio_state[index]);
+	xgpio_write_chan(chip, XGPIO_DATA_OFFSET, index, chip->gpio_state[index]);
 
 	spin_unlock_irqrestore(&chip->gpio_lock, flags);
 }
@@ -214,8 +227,7 @@ static int xgpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
 
 	/* Set the GPIO bit in shadow register and set direction as input */
 	chip->gpio_dir[index] |= BIT(offset);
-	xgpio_writereg(chip->regs + XGPIO_TRI_OFFSET +
-		       xgpio_regoffset(chip, gpio), chip->gpio_dir[index]);
+	xgpio_write_chan(chip, XGPIO_TRI_OFFSET, index, chip->gpio_dir[index]);
 
 	spin_unlock_irqrestore(&chip->gpio_lock, flags);
 
@@ -248,13 +260,11 @@ static int xgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
 		chip->gpio_state[index] |= BIT(offset);
 	else
 		chip->gpio_state[index] &= ~BIT(offset);
-	xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET +
-			xgpio_regoffset(chip, gpio), chip->gpio_state[index]);
+	xgpio_write_chan(chip, XGPIO_DATA_OFFSET, index, chip->gpio_state[index]);
 
 	/* Clear the GPIO bit in shadow register and set direction as output */
 	chip->gpio_dir[index] &= ~BIT(offset);
-	xgpio_writereg(chip->regs + XGPIO_TRI_OFFSET +
-			xgpio_regoffset(chip, gpio), chip->gpio_dir[index]);
+	xgpio_write_chan(chip, XGPIO_TRI_OFFSET, index, chip->gpio_dir[index]);
 
 	spin_unlock_irqrestore(&chip->gpio_lock, flags);
 
@@ -267,16 +277,14 @@ static int xgpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
  */
 static void xgpio_save_regs(struct xgpio_instance *chip)
 {
-	xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET,	chip->gpio_state[0]);
-	xgpio_writereg(chip->regs + XGPIO_TRI_OFFSET, chip->gpio_dir[0]);
+	xgpio_write_chan(chip, XGPIO_DATA_OFFSET, 0, chip->gpio_state[0]);
+	xgpio_write_chan(chip, XGPIO_TRI_OFFSET, 0, chip->gpio_dir[0]);
 
 	if (!chip->gpio_width[1])
 		return;
 
-	xgpio_writereg(chip->regs + XGPIO_DATA_OFFSET + XGPIO_CHANNEL_OFFSET,
-		       chip->gpio_state[1]);
-	xgpio_writereg(chip->regs + XGPIO_TRI_OFFSET + XGPIO_CHANNEL_OFFSET,
-		       chip->gpio_dir[1]);
+	xgpio_write_chan(chip, XGPIO_DATA_OFFSET, 1, chip->gpio_state[1]);
+	xgpio_write_chan(chip, XGPIO_TRI_OFFSET, 1, chip->gpio_dir[1]);
 }
 
 static int xgpio_request(struct gpio_chip *chip, unsigned int offset)
@@ -434,8 +442,7 @@ static void xgpio_irq_unmask(struct irq_data *irq_data)
 			xgpio_writereg(chip->regs + XGPIO_IPISR_OFFSET, val);
 
 		/* Update GPIO IRQ read data before enabling interrupt*/
-		val = xgpio_readreg(chip->regs + XGPIO_DATA_OFFSET +
-				    index * XGPIO_CHANNEL_OFFSET);
+		val = xgpio_read_chan(chip, XGPIO_DATA_OFFSET, index);
 		chip->gpio_last_irq_read[index] = val;
 
 		/* Enable per channel interrupt */
@@ -512,8 +519,7 @@ static void xgpio_irqhandler(struct irq_desc *desc)
 			unsigned int irq;
 
 			spin_lock_irqsave(&chip->gpio_lock, flags);
-			data = xgpio_readreg(chip->regs + XGPIO_DATA_OFFSET +
-					     index * XGPIO_CHANNEL_OFFSET);
+			data = xgpio_read_chan(chip, XGPIO_DATA_OFFSET, index);
 			rising_events = data &
 					~chip->gpio_last_irq_read[index] &
 					chip->irq_enable[index] &
-- 
2.30.2

