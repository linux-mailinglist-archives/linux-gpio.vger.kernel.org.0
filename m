Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33580192507
	for <lists+linux-gpio@lfdr.de>; Wed, 25 Mar 2020 11:04:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726276AbgCYKEp (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 25 Mar 2020 06:04:45 -0400
Received: from xavier.telenet-ops.be ([195.130.132.52]:59656 "EHLO
        xavier.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727137AbgCYKEo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Mar 2020 06:04:44 -0400
Received: from ramsan ([84.195.182.253])
        by xavier.telenet-ops.be with bizsmtp
        id Ja4k220035USYZQ01a4kxT; Wed, 25 Mar 2020 11:04:44 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jH2tw-00033y-2V; Wed, 25 Mar 2020 11:04:44 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jH2tw-0003ei-1c; Wed, 25 Mar 2020 11:04:44 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 2/2] gpiolib: Remove unused gpio_chip parameter from gpio_set_bias()
Date:   Wed, 25 Mar 2020 11:04:39 +0100
Message-Id: <20200325100439.14000-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200325100439.14000-1-geert+renesas@glider.be>
References: <20200325100439.14000-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

gpio_set_bias() no longer uses the passed gpio_chip pointer parameter.
Remove it.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpiolib.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 8eeb29de12cb5811..7e3c19bd21cdf327 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3264,7 +3264,7 @@ static int gpio_set_config(struct gpio_desc *desc, enum pin_config_param mode)
 	return gpio_do_set_config(chip, gpio_chip_hwgpio(desc), config);
 }
 
-static int gpio_set_bias(struct gpio_chip *chip, struct gpio_desc *desc)
+static int gpio_set_bias(struct gpio_desc *desc)
 {
 	int bias = 0;
 	int ret = 0;
@@ -3330,7 +3330,7 @@ int gpiod_direction_input(struct gpio_desc *desc)
 	}
 	if (ret == 0) {
 		clear_bit(FLAG_IS_OUT, &desc->flags);
-		ret = gpio_set_bias(chip, desc);
+		ret = gpio_set_bias(desc);
 	}
 
 	trace_gpio_direction(desc_to_gpio(desc), 1, ret);
@@ -3414,7 +3414,6 @@ EXPORT_SYMBOL_GPL(gpiod_direction_output_raw);
  */
 int gpiod_direction_output(struct gpio_desc *desc, int value)
 {
-	struct gpio_chip *gc;
 	int ret;
 
 	VALIDATE_DESC(desc);
@@ -3432,7 +3431,6 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
 		return -EIO;
 	}
 
-	gc = desc->gdev->chip;
 	if (test_bit(FLAG_OPEN_DRAIN, &desc->flags)) {
 		/* First see if we can enable open drain in hardware */
 		ret = gpio_set_config(desc, PIN_CONFIG_DRIVE_OPEN_DRAIN);
@@ -3458,7 +3456,7 @@ int gpiod_direction_output(struct gpio_desc *desc, int value)
 	}
 
 set_output_value:
-	ret = gpio_set_bias(gc, desc);
+	ret = gpio_set_bias(desc);
 	if (ret)
 		return ret;
 	return gpiod_direction_output_raw_commit(desc, value);
-- 
2.17.1

