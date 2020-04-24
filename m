Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FBD11B781C
	for <lists+linux-gpio@lfdr.de>; Fri, 24 Apr 2020 16:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726753AbgDXOOh (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 24 Apr 2020 10:14:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726699AbgDXOOh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 24 Apr 2020 10:14:37 -0400
Received: from michel.telenet-ops.be (michel.telenet-ops.be [IPv6:2a02:1800:110:4::f00:18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0428C09B046
        for <linux-gpio@vger.kernel.org>; Fri, 24 Apr 2020 07:14:36 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed60:8134:2f28:3a79:6257])
        by michel.telenet-ops.be with bizsmtp
        id WeEZ2200C3LKRvX06eEZMf; Fri, 24 Apr 2020 16:14:34 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jRz69-0007cE-Mo; Fri, 24 Apr 2020 16:14:33 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jRz69-0002yb-Ju; Fri, 24 Apr 2020 16:14:33 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpiolib: Improve kernel messages
Date:   Fri, 24 Apr 2020 16:14:32 +0200
Message-Id: <20200424141432.11400-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Simplify the printing of kernel messages and make the messages more
accurate by using the most appropriate {dev,chip,gpiod}_*() helpers.

Sample impact:

    -gpiochip_setup_dev: registered GPIOs 496 to 511 on device: gpiochip0 (e6050000.gpio)
    +gpio gpiochip0: registered GPIOs 496 to 511 on e6050000.gpio

    -no flags found for gpios
    +gpio-953 (?): no flags found for gpios

    -GPIO line 355 (PCIE/SATA switch) hogged as output/low
    +gpio-355 (PCIE/SATA switch): hogged as output/low

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpiolib.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 40f2d7f69be26f22..48b4f70e2898e789 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1508,9 +1508,8 @@ static int gpiochip_setup_dev(struct gpio_device *gdev)
 
 	/* From this point, the .release() function cleans up gpio_device */
 	gdev->dev.release = gpiodevice_release;
-	pr_debug("%s: registered GPIOs %d to %d on device: %s (%s)\n",
-		 __func__, gdev->base, gdev->base + gdev->ngpio - 1,
-		 dev_name(&gdev->dev), gdev->chip->label ? : "generic");
+	dev_dbg(&gdev->dev, "registered GPIOs %d to %d on %s\n", gdev->base,
+		gdev->base + gdev->ngpio - 1, gdev->chip->label ? : "generic");
 
 	return 0;
 
@@ -1526,8 +1525,8 @@ static void gpiochip_machine_hog(struct gpio_chip *gc, struct gpiod_hog *hog)
 
 	desc = gpiochip_get_desc(gc, hog->chip_hwnum);
 	if (IS_ERR(desc)) {
-		pr_err("%s: unable to get GPIO desc: %ld\n",
-		       __func__, PTR_ERR(desc));
+		chip_err(gc, "%s: unable to get GPIO desc: %ld\n", __func__,
+			 PTR_ERR(desc));
 		return;
 	}
 
@@ -1536,8 +1535,8 @@ static void gpiochip_machine_hog(struct gpio_chip *gc, struct gpiod_hog *hog)
 
 	rv = gpiod_hog(desc, hog->line_name, hog->lflags, hog->dflags);
 	if (rv)
-		pr_err("%s: unable to hog GPIO line (%s:%u): %d\n",
-		       __func__, gc->label, hog->chip_hwnum, rv);
+		gpiod_err(desc, "%s: unable to hog GPIO line (%s:%u): %d\n",
+			  __func__, gc->label, hog->chip_hwnum, rv);
 }
 
 static void machine_gpiochip_add(struct gpio_chip *gc)
@@ -1562,8 +1561,8 @@ static void gpiochip_setup_devs(void)
 	list_for_each_entry(gdev, &gpio_devices, list) {
 		ret = gpiochip_setup_dev(gdev);
 		if (ret)
-			pr_err("%s: Failed to initialize gpio device (%d)\n",
-			       dev_name(&gdev->dev), ret);
+			dev_err(&gdev->dev,
+				"Failed to initialize gpio device (%d)\n", ret);
 	}
 }
 
@@ -2672,7 +2671,7 @@ int gpiochip_irqchip_add_key(struct gpio_chip *gc,
 		return -EINVAL;
 
 	if (!gc->parent) {
-		pr_err("missing gpiochip .dev parent pointer\n");
+		chip_err(gc, "missing gpiochip .dev parent pointer\n");
 		return -EINVAL;
 	}
 	gc->irq.threaded = threaded;
@@ -4842,7 +4841,7 @@ int gpiod_configure_flags(struct gpio_desc *desc, const char *con_id,
 
 	/* No particular flag request, return here... */
 	if (!(dflags & GPIOD_FLAGS_BIT_DIR_SET)) {
-		pr_debug("no flags found for %s\n", con_id);
+		gpiod_dbg(desc, "no flags found for %s\n", con_id);
 		return 0;
 	}
 
@@ -5067,8 +5066,7 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
 	/* Mark GPIO as hogged so it can be identified and removed later */
 	set_bit(FLAG_IS_HOGGED, &desc->flags);
 
-	pr_info("GPIO line %d (%s) hogged as %s%s\n",
-		desc_to_gpio(desc), name,
+	gpiod_info(desc, "hogged as %s%s\n",
 		(dflags & GPIOD_FLAGS_BIT_DIR_OUT) ? "output" : "input",
 		(dflags & GPIOD_FLAGS_BIT_DIR_OUT) ?
 		  (dflags & GPIOD_FLAGS_BIT_DIR_VAL) ? "/high" : "/low" : "");
-- 
2.17.1

