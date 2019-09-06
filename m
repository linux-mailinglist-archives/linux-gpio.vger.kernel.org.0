Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 61484AB43E
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Sep 2019 10:45:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391708AbfIFIpq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 6 Sep 2019 04:45:46 -0400
Received: from michel.telenet-ops.be ([195.130.137.88]:57806 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391743AbfIFIpp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Sep 2019 04:45:45 -0400
Received: from ramsan ([84.194.98.4])
        by michel.telenet-ops.be with bizsmtp
        id y8lg2001605gfCL068lhD2; Fri, 06 Sep 2019 10:45:43 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i69sC-0003N0-Te; Fri, 06 Sep 2019 10:45:40 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1i69sC-0005h3-SO; Fri, 06 Sep 2019 10:45:40 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 1/4] gpio: of: Make of_get_named_gpiod_flags() private
Date:   Fri,  6 Sep 2019 10:45:36 +0200
Message-Id: <20190906084539.21838-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190906084539.21838-1-geert+renesas@glider.be>
References: <20190906084539.21838-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since commit f626d6dfb7098525 ("gpio: of: Break out OF-only code"),
there are no more users of of_get_named_gpiod_flags() outside
gpiolib-of.c.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpiolib-of.c | 2 +-
 drivers/gpio/gpiolib-of.h | 7 -------
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index b034abe59f287bff..4c6b366cb7bd5cd0 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -223,7 +223,7 @@ static void of_gpio_flags_quirks(struct device_node *np,
  * value on the error condition. If @flags is not NULL the function also fills
  * in flags for the GPIO.
  */
-struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
+static struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
 		     const char *propname, int index, enum of_gpio_flags *flags)
 {
 	struct of_phandle_args gpiospec;
diff --git a/drivers/gpio/gpiolib-of.h b/drivers/gpio/gpiolib-of.h
index 454d1658ee2d45fb..9768831b1fe2f25b 100644
--- a/drivers/gpio/gpiolib-of.h
+++ b/drivers/gpio/gpiolib-of.h
@@ -11,8 +11,6 @@ struct gpio_desc *of_find_gpio(struct device *dev,
 			       const char *con_id,
 			       unsigned int idx,
 			       unsigned long *lookupflags);
-struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
-		   const char *list_name, int index, enum of_gpio_flags *flags);
 int of_gpiochip_add(struct gpio_chip *gc);
 void of_gpiochip_remove(struct gpio_chip *gc);
 int of_gpio_get_count(struct device *dev, const char *con_id);
@@ -25,11 +23,6 @@ static inline struct gpio_desc *of_find_gpio(struct device *dev,
 {
 	return ERR_PTR(-ENOENT);
 }
-static inline struct gpio_desc *of_get_named_gpiod_flags(struct device_node *np,
-		   const char *list_name, int index, enum of_gpio_flags *flags)
-{
-	return ERR_PTR(-ENOENT);
-}
 static inline int of_gpiochip_add(struct gpio_chip *gc) { return 0; }
 static inline void of_gpiochip_remove(struct gpio_chip *gc) { }
 static inline int of_gpio_get_count(struct device *dev, const char *con_id)
-- 
2.17.1

