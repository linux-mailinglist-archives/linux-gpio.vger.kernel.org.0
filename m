Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5EBD01CD64E
	for <lists+linux-gpio@lfdr.de>; Mon, 11 May 2020 12:19:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729296AbgEKKSf (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 11 May 2020 06:18:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729287AbgEKKSe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 11 May 2020 06:18:34 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 586D7C061A0E
        for <linux-gpio@vger.kernel.org>; Mon, 11 May 2020 03:18:34 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:702c:fb99:3097:2049])
        by albert.telenet-ops.be with bizsmtp
        id dNJW220070GoAb606NJWfT; Mon, 11 May 2020 12:18:30 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jY5W2-0002Q8-4k; Mon, 11 May 2020 12:18:30 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jY5W2-0007pN-1T; Mon, 11 May 2020 12:18:30 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpiolib: Document that GPIO line names are not globally unique
Date:   Mon, 11 May 2020 12:18:28 +0200
Message-Id: <20200511101828.30046-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

gpiochip_set_desc_names() no longer rejects GPIO line name collisions.
Hence GPIO line names are not guaranteed to be globally unique.
In case of multiple GPIO lines with the same name, gpio_name_to_desc()
will return the first match found.

Update the comments for gpio_name_to_desc() and
gpiochip_set_desc_names() to match reality.

Fixes: f881bab038c9667d ("gpio: keep the GPIO line names internal")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpiolib.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 99533f4cb5d332a9..98822412f565073a 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -296,6 +296,9 @@ static int gpiodev_add_to_list(struct gpio_device *gdev)
 
 /*
  * Convert a GPIO name to its descriptor
+ * Note that there is no guarantee that GPIO names are globally unique!
+ * Hence this function will return, if it exists, a reference to the first GPIO
+ * line found that matches the given name.
  */
 static struct gpio_desc *gpio_name_to_desc(const char * const name)
 {
@@ -329,10 +332,12 @@ static struct gpio_desc *gpio_name_to_desc(const char * const name)
 }
 
 /*
- * Takes the names from gc->names and checks if they are all unique. If they
- * are, they are assigned to their gpio descriptors.
+ * Take the names from gc->names and assign them to their GPIO descriptors.
+ * Warn if a name is already used for a GPIO line on a different GPIO chip.
  *
- * Warning if one of the names is already used for a different GPIO.
+ * Note that:
+ *   1. Non-unique names are still accepted,
+ *   2. Name collisions within the same GPIO chip are not reported.
  */
 static int gpiochip_set_desc_names(struct gpio_chip *gc)
 {
-- 
2.17.1

