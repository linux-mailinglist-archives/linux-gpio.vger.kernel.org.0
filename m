Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6262010AC0C
	for <lists+linux-gpio@lfdr.de>; Wed, 27 Nov 2019 09:43:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726729AbfK0Ina (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 27 Nov 2019 03:43:30 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:47536 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbfK0InK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 27 Nov 2019 03:43:10 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id Wwiu2100e5USYZQ06wiuWY; Wed, 27 Nov 2019 09:43:08 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iZsuU-0000xe-KQ; Wed, 27 Nov 2019 09:42:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1iZsuU-0004OJ-IG; Wed, 27 Nov 2019 09:42:54 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org, qemu-devel@nongnu.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 1/7] gpiolib: Add GPIOCHIP_NAME definition
Date:   Wed, 27 Nov 2019 09:42:47 +0100
Message-Id: <20191127084253.16356-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191127084253.16356-1-geert+renesas@glider.be>
References: <20191127084253.16356-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The string literal "gpiochip" is used in several places.
Add a definition for it, and use it everywhere, to make sure everything
stays in sync.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v3:
  - New.
---
 drivers/gpio/gpiolib-sysfs.c | 7 +++----
 drivers/gpio/gpiolib.c       | 4 ++--
 drivers/gpio/gpiolib.h       | 2 ++
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index fbf6b1a0a4fae6ce..23e3d335cd543d53 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -762,10 +762,9 @@ int gpiochip_sysfs_register(struct gpio_device *gdev)
 		parent = &gdev->dev;
 
 	/* use chip->base for the ID; it's already known to be unique */
-	dev = device_create_with_groups(&gpio_class, parent,
-					MKDEV(0, 0),
-					chip, gpiochip_groups,
-					"gpiochip%d", chip->base);
+	dev = device_create_with_groups(&gpio_class, parent, MKDEV(0, 0), chip,
+					gpiochip_groups, GPIOCHIP_NAME "%d",
+					chip->base);
 	if (IS_ERR(dev))
 		return PTR_ERR(dev);
 
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index dce0b31f4125a6b3..c9e47620d2434983 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1419,7 +1419,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *chip, void *data,
 		ret = gdev->id;
 		goto err_free_gdev;
 	}
-	dev_set_name(&gdev->dev, "gpiochip%d", gdev->id);
+	dev_set_name(&gdev->dev, GPIOCHIP_NAME "%d", gdev->id);
 	device_initialize(&gdev->dev);
 	dev_set_drvdata(&gdev->dev, gdev);
 	if (chip->parent && chip->parent->driver)
@@ -5105,7 +5105,7 @@ static int __init gpiolib_dev_init(void)
 		return ret;
 	}
 
-	ret = alloc_chrdev_region(&gpio_devt, 0, GPIO_DEV_MAX, "gpiochip");
+	ret = alloc_chrdev_region(&gpio_devt, 0, GPIO_DEV_MAX, GPIOCHIP_NAME);
 	if (ret < 0) {
 		pr_err("gpiolib: failed to allocate char dev region\n");
 		bus_unregister(&gpio_bus_type);
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index ca9bc1e4803c2979..a4a759920faa48ab 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -16,6 +16,8 @@
 #include <linux/module.h>
 #include <linux/cdev.h>
 
+#define GPIOCHIP_NAME	"gpiochip"
+
 /**
  * struct gpio_device - internal state container for GPIO devices
  * @id: numerical ID number for the GPIO chip
-- 
2.17.1

