Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 981D91445A
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2019 08:02:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725710AbfEFGCM (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 6 May 2019 02:02:12 -0400
Received: from relay1.mentorg.com ([192.94.38.131]:37163 "EHLO
        relay1.mentorg.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725828AbfEFGCM (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 May 2019 02:02:12 -0400
Received: from nat-ies.mentorg.com ([192.94.31.2] helo=svr-ies-mbx-01.mgc.mentorg.com)
        by relay1.mentorg.com with esmtps (TLSv1.2:ECDHE-RSA-AES256-SHA384:256)
        id 1hNWhW-0004zO-0D from Harish_Kandiga@mentor.com ; Sun, 05 May 2019 23:02:10 -0700
Received: from localhost.localdomain (137.202.0.90) by
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1) with Microsoft SMTP Server
 (TLS) id 15.0.1320.4; Mon, 6 May 2019 07:02:05 +0100
From:   Harish Jenny K N <harish_kandiga@mentor.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
CC:     <linux-gpio@vger.kernel.org>,
        Harish Jenny K N <harish_kandiga@mentor.com>
Subject: [PATCH V1 1/2] gpio: make it possible to set active-state on GPIO lines
Date:   Mon, 6 May 2019 11:31:40 +0530
Message-ID: <1557122501-5183-2-git-send-email-harish_kandiga@mentor.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1557122501-5183-1-git-send-email-harish_kandiga@mentor.com>
References: <1557122501-5183-1-git-send-email-harish_kandiga@mentor.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [137.202.0.90]
X-ClientProxiedBy: SVR-IES-MBX-09.mgc.mentorg.com (139.181.222.9) To
 svr-ies-mbx-01.mgc.mentorg.com (139.181.222.1)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Device could decide to have different convention about what "active" means.
( i.e Active-High (output signal "1" means "active", the default)
and Active-Low (output signal "0" means "active")).
Therefore it is possible to define a GPIO as being either active-high or
active-low .

Make it possible to add the information of active state of gpio pin
as property into device tree configuration using a
"active-state" property u8 array.

This is useful for user space applications to identify
active state of pins.

This commit updates gpio_desc flag for active-state.

Note: The active-state attribute is completely optional.

example device tree line
"active-state = /bits/ 8 <0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0>;"

Signed-off-by: Harish Jenny K N <harish_kandiga@mentor.com>
---
 drivers/gpio/gpiolib-devprop.c | 38 ++++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib-of.c      |  3 +++
 drivers/gpio/gpiolib.h         |  3 +++
 3 files changed, 44 insertions(+)

diff --git a/drivers/gpio/gpiolib-devprop.c b/drivers/gpio/gpiolib-devprop.c
index dd51709..4b3fbd4 100644
--- a/drivers/gpio/gpiolib-devprop.c
+++ b/drivers/gpio/gpiolib-devprop.c
@@ -10,6 +10,7 @@
 #include <linux/slab.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
+#include <linux/gpio/machine.h>

 #include "gpiolib.h"

@@ -56,3 +57,40 @@ void devprop_gpiochip_set_names(struct gpio_chip *chip,

 	kfree(names);
 }
+
+/**
+ * devprop_gpiochip_set_active_state - Set GPIO line active state using
+ * device properties
+ * @chip: GPIO chip whose lines should be set
+ * @fwnode: Property Node containing the active-state property
+ *
+ * Looks for device property "active-state" and if it exists assigns
+ * GPIO line active states for the chip.
+ */
+void devprop_gpiochip_set_active_state(struct gpio_chip *chip,
+				       const struct fwnode_handle *fwnode)
+{
+	struct gpio_device *gdev = chip->gpiodev;
+	int ret, i;
+	u8 *states;
+
+	states = kcalloc(gdev->ngpio, sizeof(u8), GFP_KERNEL);
+	if (!states)
+		return;
+
+	ret = fwnode_property_read_u8_array(fwnode, "active-state",
+					    states, gdev->ngpio);
+
+	if (ret < 0) {
+		dev_warn(&gdev->dev, "failed to read GPIO active-state\n");
+		kfree(states);
+		return;
+	}
+
+	for (i = 0; i < gdev->ngpio; i++) {
+		if (states[i] & GPIO_ACTIVE_LOW)
+			set_bit(FLAG_ACTIVE_LOW, &gdev->descs[i].flags);
+	}
+
+	kfree(states);
+}
diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 6a3ec57..2279b3d 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -716,6 +716,9 @@ int of_gpiochip_add(struct gpio_chip *chip)
 		devprop_gpiochip_set_names(chip,
 					   of_fwnode_handle(chip->of_node));

+	devprop_gpiochip_set_active_state(chip,
+					  of_fwnode_handle(chip->of_node));
+
 	of_node_get(chip->of_node);

 	status = of_gpiochip_scan_gpios(chip);
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 078ab17..0b5f6f3 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -246,6 +246,9 @@ static inline int gpio_chip_hwgpio(const struct gpio_desc *desc)
 void devprop_gpiochip_set_names(struct gpio_chip *chip,
 				const struct fwnode_handle *fwnode);

+void devprop_gpiochip_set_active_state(struct gpio_chip *chip,
+				       const struct fwnode_handle *fwnode);
+
 /* With descriptor prefix */

 #define gpiod_emerg(desc, fmt, ...)					       \
--
2.7.4

