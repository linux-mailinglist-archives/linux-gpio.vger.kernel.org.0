Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44139210A76
	for <lists+linux-gpio@lfdr.de>; Wed,  1 Jul 2020 13:42:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730439AbgGALmU (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 1 Jul 2020 07:42:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730321AbgGALmT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 1 Jul 2020 07:42:19 -0400
Received: from laurent.telenet-ops.be (laurent.telenet-ops.be [IPv6:2a02:1800:110:4::f00:19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2489FC061755
        for <linux-gpio@vger.kernel.org>; Wed,  1 Jul 2020 04:42:19 -0700 (PDT)
Received: from ramsan ([IPv6:2a02:1810:ac12:ed20:503c:ab8:1424:9638])
        by laurent.telenet-ops.be with bizsmtp
        id xniG2200249uj5301niG47; Wed, 01 Jul 2020 13:42:16 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jqb84-0006Pu-92; Wed, 01 Jul 2020 13:42:16 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1jqb84-0002EF-73; Wed, 01 Jul 2020 13:42:16 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/2] gpio: aggregator: Use bitmap_parselist() for parsing GPIO offsets
Date:   Wed,  1 Jul 2020 13:42:12 +0200
Message-Id: <20200701114212.8520-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200701114212.8520-1-geert+renesas@glider.be>
References: <20200701114212.8520-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace the custom code to parse GPIO offsets and/or GPIO offset ranges
by a call to bitmap_parselist(), and an iteration over the returned bit
mask.

This should have no impact on the format of the configuration parameters
written to the "new_device" virtual file in sysfs.

Suggested-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Rename mask to bitmap,
  - Allocate bitmap dynamically.
---
 drivers/gpio/gpio-aggregator.c | 59 +++++++++++++++-------------------
 1 file changed, 26 insertions(+), 33 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 62a3fcbd4b4bb106..424a3d25350bf50d 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -10,6 +10,7 @@
 #include <linux/bitmap.h>
 #include <linux/bitops.h>
 #include <linux/ctype.h>
+#include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
 #include <linux/gpio/machine.h>
@@ -111,55 +112,45 @@ static int aggr_add_gpio(struct gpio_aggregator *aggr, const char *key,
 
 static int aggr_parse(struct gpio_aggregator *aggr)
 {
-	unsigned int first_index, last_index, i, n = 0;
-	char *name, *offsets, *first, *last, *next;
 	char *args = aggr->args;
-	int error;
+	unsigned long *bitmap;
+	unsigned int i, n = 0;
+	char *name, *offsets;
+	int error = 0;
+
+	bitmap = bitmap_alloc(ARCH_NR_GPIOS, GFP_KERNEL);
+	if (!bitmap)
+		return -ENOMEM;
 
 	for (name = get_arg(&args), offsets = get_arg(&args); name;
 	     offsets = get_arg(&args)) {
 		if (IS_ERR(name)) {
 			pr_err("Cannot get GPIO specifier: %pe\n", name);
-			return PTR_ERR(name);
+			error = PTR_ERR(name);
+			goto free_bitmap;
 		}
 
 		if (!isrange(offsets)) {
 			/* Named GPIO line */
 			error = aggr_add_gpio(aggr, name, U16_MAX, &n);
 			if (error)
-				return error;
+				goto free_bitmap;
 
 			name = offsets;
 			continue;
 		}
 
 		/* GPIO chip + offset(s) */
-		for (first = offsets; *first; first = next) {
-			next = strchrnul(first, ',');
-			if (*next)
-				*next++ = '\0';
-
-			last = strchr(first, '-');
-			if (last)
-				*last++ = '\0';
-
-			if (kstrtouint(first, 10, &first_index)) {
-				pr_err("Cannot parse GPIO index %s\n", first);
-				return -EINVAL;
-			}
-
-			if (!last) {
-				last_index = first_index;
-			} else if (kstrtouint(last, 10, &last_index)) {
-				pr_err("Cannot parse GPIO index %s\n", last);
-				return -EINVAL;
-			}
-
-			for (i = first_index; i <= last_index; i++) {
-				error = aggr_add_gpio(aggr, name, i, &n);
-				if (error)
-					return error;
-			}
+		error = bitmap_parselist(offsets, bitmap, ARCH_NR_GPIOS);
+		if (error) {
+			pr_err("Cannot parse %s: %d\n", offsets, error);
+			goto free_bitmap;
+		}
+
+		for_each_set_bit(i, bitmap, ARCH_NR_GPIOS) {
+			error = aggr_add_gpio(aggr, name, i, &n);
+			if (error)
+				goto free_bitmap;
 		}
 
 		name = get_arg(&args);
@@ -167,10 +158,12 @@ static int aggr_parse(struct gpio_aggregator *aggr)
 
 	if (!n) {
 		pr_err("No GPIOs specified\n");
-		return -EINVAL;
+		error = -EINVAL;
 	}
 
-	return 0;
+free_bitmap:
+	bitmap_free(bitmap);
+	return error;
 }
 
 static ssize_t new_device_store(struct device_driver *driver, const char *buf,
-- 
2.17.1

