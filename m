Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 346951755F5
	for <lists+linux-gpio@lfdr.de>; Mon,  2 Mar 2020 09:24:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727327AbgCBIYw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 Mar 2020 03:24:52 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:55552 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726313AbgCBIYw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Mar 2020 03:24:52 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id 9LQp220075USYZQ06LQpE9; Mon, 02 Mar 2020 09:24:49 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j8gNd-0007XT-4J; Mon, 02 Mar 2020 09:24:49 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j8gNd-0003EV-27; Mon, 02 Mar 2020 09:24:49 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpiolib: Fix inverted check in gpiochip_remove()
Date:   Mon,  2 Mar 2020 09:24:48 +0100
Message-Id: <20200302082448.11795-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The optimization to check for requested lines actually optimized for the
uncomon error case, where one of the GPIO lines is still in use.
Hence the error message must be printed when the loop is terminated
early, not when it went through all available GPIO lines.

Fixes: 869233f81337bfb3 ("gpiolib: Optimize gpiochip_remove() when check for requested line")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Noticed by review, tested by creating and destroying an otherwise unused
GPIO aggregator, which triggers:

    gpio gpiochip8: REMOVING GPIOCHIP WITH GPIOS STILL REQUESTED
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 4e78bdc2739693c3..6180cf84fab7ce5e 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1823,7 +1823,7 @@ void gpiochip_remove(struct gpio_chip *chip)
 	}
 	spin_unlock_irqrestore(&gpio_lock, flags);
 
-	if (i == gdev->ngpio)
+	if (i != gdev->ngpio)
 		dev_crit(&gdev->dev,
 			 "REMOVING GPIOCHIP WITH GPIOS STILL REQUESTED\n");
 
-- 
2.17.1

