Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5563622C6E
	for <lists+linux-gpio@lfdr.de>; Wed,  9 Nov 2022 14:33:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbiKINdN (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 9 Nov 2022 08:33:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229740AbiKINdM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 9 Nov 2022 08:33:12 -0500
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 412092F64A
        for <linux-gpio@vger.kernel.org>; Wed,  9 Nov 2022 05:33:11 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:410d:c657:be54:f60b])
        by michel.telenet-ops.be with bizsmtp
        id iDZ92800547WmLZ06DZ9Z7; Wed, 09 Nov 2022 14:33:09 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oslCW-0006f1-Om; Wed, 09 Nov 2022 14:33:08 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1oslCW-001cE1-9p; Wed, 09 Nov 2022 14:33:08 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] pinctrl: renesas: gpio: Use dynamic GPIO base if no function GPIOs
Date:   Wed,  9 Nov 2022 14:33:04 +0100
Message-Id: <df2cf30ac4c3cbee726799f32b727c1ebe62819c.1668000684.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.3 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Since commit 502df79b860563d7 ("gpiolib: Warn on drivers still using
static gpiobase allocation") in gpio/for-next, one or more warnings are
printed during boot on systems where the pin controller also provides
GPIO functionality:

    gpio gpiochip0: Static allocation of GPIO base is deprecated, use dynamic allocation.

Fix this for ARM-based SH/R-Mobile SoCs by:
  1. Taking into account a non-zero GPIO base in the various GPIO chip
     callbacks,
  2. Switching to dynamic allocation of the GPIO base when support for
     legacy function GPIOs is not enabled.

On SuperH SoCs using legacy function GPIOs, the GPIO bases of the GPIO
controller and the GPIO function controller must not be changed, as all
board files rely on the fixed GPIO_* and GPIO_FN_* definitions provided
by the various <cpu/sh*.h> header files.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Tested on all affected ARM SH/R-Mobile SoCs.

Obviously SuperH should be converted from function GPIOs to pin control.
Is it actually possible to use pin control without DT?
Unfortunately I do not have access to any of the affected systems
(SH7203, SH726[49], SH772[0234], SH7734, SH7757, SH778[56] and SHX3).
---
 drivers/pinctrl/renesas/gpio.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/renesas/gpio.c b/drivers/pinctrl/renesas/gpio.c
index ea3d38b4af8da4e1..5758daf94fe2e867 100644
--- a/drivers/pinctrl/renesas/gpio.c
+++ b/drivers/pinctrl/renesas/gpio.c
@@ -135,12 +135,12 @@ static int gpio_pin_request(struct gpio_chip *gc, unsigned offset)
 	if (idx < 0 || pfc->info->pins[idx].enum_id == 0)
 		return -EINVAL;
 
-	return pinctrl_gpio_request(offset);
+	return pinctrl_gpio_request(gc->base + offset);
 }
 
 static void gpio_pin_free(struct gpio_chip *gc, unsigned offset)
 {
-	return pinctrl_gpio_free(offset);
+	return pinctrl_gpio_free(gc->base + offset);
 }
 
 static void gpio_pin_set_value(struct sh_pfc_chip *chip, unsigned offset,
@@ -164,7 +164,7 @@ static void gpio_pin_set_value(struct sh_pfc_chip *chip, unsigned offset,
 
 static int gpio_pin_direction_input(struct gpio_chip *gc, unsigned offset)
 {
-	return pinctrl_gpio_direction_input(offset);
+	return pinctrl_gpio_direction_input(gc->base + offset);
 }
 
 static int gpio_pin_direction_output(struct gpio_chip *gc, unsigned offset,
@@ -172,7 +172,7 @@ static int gpio_pin_direction_output(struct gpio_chip *gc, unsigned offset,
 {
 	gpio_pin_set_value(gpiochip_get_data(gc), offset, value);
 
-	return pinctrl_gpio_direction_output(offset);
+	return pinctrl_gpio_direction_output(gc->base + offset);
 }
 
 static int gpio_pin_get(struct gpio_chip *gc, unsigned offset)
@@ -238,7 +238,7 @@ static int gpio_pin_setup(struct sh_pfc_chip *chip)
 	gc->label = pfc->info->name;
 	gc->parent = pfc->dev;
 	gc->owner = THIS_MODULE;
-	gc->base = 0;
+	gc->base = IS_ENABLED(CONFIG_PINCTRL_SH_FUNC_GPIO) ? 0 : -1;
 	gc->ngpio = pfc->nr_gpio_pins;
 
 	return 0;
-- 
2.25.1

