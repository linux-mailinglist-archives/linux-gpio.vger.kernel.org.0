Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD8AEAA671
	for <lists+linux-gpio@lfdr.de>; Thu,  5 Sep 2019 16:49:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390063AbfIEOtA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 5 Sep 2019 10:49:00 -0400
Received: from relay7-d.mail.gandi.net ([217.70.183.200]:51721 "EHLO
        relay7-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728590AbfIEOtA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Sep 2019 10:49:00 -0400
X-Originating-IP: 86.207.98.53
Received: from localhost (aclermont-ferrand-651-1-259-53.w86-207.abo.wanadoo.fr [86.207.98.53])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id B1E0E2000B;
        Thu,  5 Sep 2019 14:48:57 +0000 (UTC)
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Ludovic Desroches <ludovic.desroches@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Claudiu.Beznea@microchip.com, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH v2] pinctrl: at91-pio4: implement .get_multiple and .set_multiple
Date:   Thu,  5 Sep 2019 16:48:49 +0200
Message-Id: <20190905144849.24882-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Implement .get_multiple and .set_multiple to allow reading or setting
multiple pins simultaneously. Pins in the same bank will all be switched at
the same time, improving synchronization and performances.

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---

Changes since v1
https://lore.kernel.org/lkml/20190905141304.22005-1-alexandre.belloni@bootlin.com/ :
 - Removed debug line



 drivers/pinctrl/pinctrl-at91-pio4.c | 58 +++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-at91-pio4.c b/drivers/pinctrl/pinctrl-at91-pio4.c
index d6de4d360cd4..d281ec40e098 100644
--- a/drivers/pinctrl/pinctrl-at91-pio4.c
+++ b/drivers/pinctrl/pinctrl-at91-pio4.c
@@ -328,6 +328,33 @@ static int atmel_gpio_get(struct gpio_chip *chip, unsigned offset)
 	return !!(reg & BIT(pin->line));
 }
 
+static int atmel_gpio_get_multiple(struct gpio_chip *chip, unsigned long *mask,
+				   unsigned long *bits)
+{
+	struct atmel_pioctrl *atmel_pioctrl = gpiochip_get_data(chip);
+	unsigned int bank;
+
+	bitmap_zero(bits, atmel_pioctrl->npins);
+
+	for (bank = 0; bank < atmel_pioctrl->nbanks; bank++) {
+		unsigned int word = bank;
+		unsigned int offset = 0;
+		unsigned int reg;
+
+#if ATMEL_PIO_NPINS_PER_BANK != BITS_PER_LONG
+		word = BIT_WORD(bank * ATMEL_PIO_NPINS_PER_BANK);
+		offset = bank * ATMEL_PIO_NPINS_PER_BANK % BITS_PER_LONG;
+#endif
+		if (!mask[word])
+			continue;
+
+		reg = atmel_gpio_read(atmel_pioctrl, bank, ATMEL_PIO_PDSR);
+		bits[word] |= mask[word] & (reg << offset);
+	}
+
+	return 0;
+}
+
 static int atmel_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 				       int value)
 {
@@ -358,11 +385,42 @@ static void atmel_gpio_set(struct gpio_chip *chip, unsigned offset, int val)
 			 BIT(pin->line));
 }
 
+static void atmel_gpio_set_multiple(struct gpio_chip *chip, unsigned long *mask,
+				    unsigned long *bits)
+{
+	struct atmel_pioctrl *atmel_pioctrl = gpiochip_get_data(chip);
+	unsigned int bank;
+
+	for (bank = 0; bank < atmel_pioctrl->nbanks; bank++) {
+		unsigned int bitmask;
+		unsigned int word = bank;
+
+#if ATMEL_PIO_NPINS_PER_BANK != BITS_PER_LONG
+		word = BIT_WORD(bank * ATMEL_PIO_NPINS_PER_BANK);
+#endif
+		if (!mask[word])
+			continue;
+
+		bitmask = mask[word] & bits[word];
+		atmel_gpio_write(atmel_pioctrl, bank, ATMEL_PIO_SODR, bitmask);
+
+		bitmask = mask[word] & ~bits[word];
+		atmel_gpio_write(atmel_pioctrl, bank, ATMEL_PIO_CODR, bitmask);
+
+#if ATMEL_PIO_NPINS_PER_BANK != BITS_PER_LONG
+		mask[word] >>= ATMEL_PIO_NPINS_PER_BANK;
+		bits[word] >>= ATMEL_PIO_NPINS_PER_BANK;
+#endif
+	}
+}
+
 static struct gpio_chip atmel_gpio_chip = {
 	.direction_input        = atmel_gpio_direction_input,
 	.get                    = atmel_gpio_get,
+	.get_multiple           = atmel_gpio_get_multiple,
 	.direction_output       = atmel_gpio_direction_output,
 	.set                    = atmel_gpio_set,
+	.set_multiple           = atmel_gpio_set_multiple,
 	.to_irq                 = atmel_gpio_to_irq,
 	.base                   = 0,
 };
-- 
2.21.0

