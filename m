Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E5CF5BE43
	for <lists+linux-gpio@lfdr.de>; Mon,  1 Jul 2019 16:28:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729262AbfGAO2N (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 1 Jul 2019 10:28:13 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:53978 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728162AbfGAO2N (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Jul 2019 10:28:13 -0400
Received: from ramsan ([84.194.98.4])
        by michel.telenet-ops.be with bizsmtp
        id XSUA2000B05gfCL06SUAF7; Mon, 01 Jul 2019 16:28:10 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hhxHu-00089A-DN; Mon, 01 Jul 2019 16:28:10 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1hhxHu-0006av-CH; Mon, 01 Jul 2019 16:28:10 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpiolib: Clarify use of non-sleeping functions
Date:   Mon,  1 Jul 2019 16:28:09 +0200
Message-Id: <20190701142809.25308-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Obviously functions that are safe to be called from atomic contexts, can
be called from non-atomic contexts, too.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Do I need more coffee?
---
 drivers/gpio/gpiolib.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index a3fb9302e94eb310..906c9763b08511d8 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3031,7 +3031,7 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
  * Return the GPIO's raw value, i.e. the value of the physical line disregarding
  * its ACTIVE_LOW status, or negative errno on failure.
  *
- * This function should be called from contexts where we cannot sleep, and will
+ * This function can be called from contexts where we cannot sleep, and will
  * complain if the GPIO chip functions potentially sleep.
  */
 int gpiod_get_raw_value(const struct gpio_desc *desc)
@@ -3050,7 +3050,7 @@ EXPORT_SYMBOL_GPL(gpiod_get_raw_value);
  * Return the GPIO's logical value, i.e. taking the ACTIVE_LOW status into
  * account, or negative errno on failure.
  *
- * This function should be called from contexts where we cannot sleep, and will
+ * This function can be called from contexts where we cannot sleep, and will
  * complain if the GPIO chip functions potentially sleep.
  */
 int gpiod_get_value(const struct gpio_desc *desc)
@@ -3083,7 +3083,7 @@ EXPORT_SYMBOL_GPL(gpiod_get_value);
  * without regard for their ACTIVE_LOW status.  Return 0 in case of success,
  * else an error code.
  *
- * This function should be called from contexts where we cannot sleep,
+ * This function can be called from contexts where we cannot sleep,
  * and it will complain if the GPIO chip functions potentially sleep.
  */
 int gpiod_get_raw_array_value(unsigned int array_size,
@@ -3109,7 +3109,7 @@ EXPORT_SYMBOL_GPL(gpiod_get_raw_array_value);
  * Read the logical values of the GPIOs, i.e. taking their ACTIVE_LOW status
  * into account.  Return 0 in case of success, else an error code.
  *
- * This function should be called from contexts where we cannot sleep,
+ * This function can be called from contexts where we cannot sleep,
  * and it will complain if the GPIO chip functions potentially sleep.
  */
 int gpiod_get_array_value(unsigned int array_size,
@@ -3323,7 +3323,7 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
  * Set the raw value of the GPIO, i.e. the value of its physical line without
  * regard for its ACTIVE_LOW status.
  *
- * This function should be called from contexts where we cannot sleep, and will
+ * This function can be called from contexts where we cannot sleep, and will
  * complain if the GPIO chip functions potentially sleep.
  */
 void gpiod_set_raw_value(struct gpio_desc *desc, int value)
@@ -3364,7 +3364,7 @@ static void gpiod_set_value_nocheck(struct gpio_desc *desc, int value)
  * Set the logical value of the GPIO, i.e. taking its ACTIVE_LOW,
  * OPEN_DRAIN and OPEN_SOURCE flags into account.
  *
- * This function should be called from contexts where we cannot sleep, and will
+ * This function can be called from contexts where we cannot sleep, and will
  * complain if the GPIO chip functions potentially sleep.
  */
 void gpiod_set_value(struct gpio_desc *desc, int value)
@@ -3386,7 +3386,7 @@ EXPORT_SYMBOL_GPL(gpiod_set_value);
  * Set the raw values of the GPIOs, i.e. the values of the physical lines
  * without regard for their ACTIVE_LOW status.
  *
- * This function should be called from contexts where we cannot sleep, and will
+ * This function can be called from contexts where we cannot sleep, and will
  * complain if the GPIO chip functions potentially sleep.
  */
 int gpiod_set_raw_array_value(unsigned int array_size,
@@ -3411,7 +3411,7 @@ EXPORT_SYMBOL_GPL(gpiod_set_raw_array_value);
  * Set the logical values of the GPIOs, i.e. taking their ACTIVE_LOW status
  * into account.
  *
- * This function should be called from contexts where we cannot sleep, and will
+ * This function can be called from contexts where we cannot sleep, and will
  * complain if the GPIO chip functions potentially sleep.
  */
 int gpiod_set_array_value(unsigned int array_size,
-- 
2.17.1

