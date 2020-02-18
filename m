Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 08439162946
	for <lists+linux-gpio@lfdr.de>; Tue, 18 Feb 2020 16:19:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbgBRPSy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 18 Feb 2020 10:18:54 -0500
Received: from michel.telenet-ops.be ([195.130.137.88]:43490 "EHLO
        michel.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727020AbgBRPS2 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 18 Feb 2020 10:18:28 -0500
Received: from ramsan ([84.195.182.253])
        by michel.telenet-ops.be with bizsmtp
        id 4FJD2200q5USYZQ06FJDNA; Tue, 18 Feb 2020 16:18:26 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j44dZ-0006yC-R8; Tue, 18 Feb 2020 16:18:13 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1j44dZ-00022y-PY; Tue, 18 Feb 2020 16:18:13 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Harish Jenny K N <harish_kandiga@mentor.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Cc:     Alexander Graf <graf@amazon.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Phil Reid <preid@electromag.com.au>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Christoffer Dall <christoffer.dall@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        qemu-devel@nongnu.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v5 2/5] gpiolib: Add support for GPIO line table lookup
Date:   Tue, 18 Feb 2020 16:18:09 +0100
Message-Id: <20200218151812.7816-3-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200218151812.7816-1-geert+renesas@glider.be>
References: <20200218151812.7816-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently GPIOs can only be referred to by GPIO controller and offset in
GPIO lookup tables.

Add support for looking them up by line name.
Rename gpiod_lookup.chip_label to gpiod_lookup.key, to make it clear
that this field can have two meanings, and update the kerneldoc and
GPIO_LOOKUP*() macros.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Ulrich Hecht <uli+renesas@fpond.eu>
Reviewed-by: Eugeniu Rosca <erosca@de.adit-jv.com>
Tested-by: Eugeniu Rosca <erosca@de.adit-jv.com>
---
v5:
  - Add Reviewed-by, Tested-by,

v4:
  - Add Reviewed-by,
  - Rename gpiod_lookup.chip_label.
  - Use U16_MAX instead of (u16)-1,

v3:
  - New.
---
 drivers/gpio/gpiolib.c       | 22 +++++++++++++++++-----
 include/linux/gpio/machine.h | 15 ++++++++-------
 2 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 200c2d2be4b78043..24c02167f9e5472f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -4453,7 +4453,7 @@ static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
 	if (!table)
 		return desc;
 
-	for (p = &table->table[0]; p->chip_label; p++) {
+	for (p = &table->table[0]; p->key; p++) {
 		struct gpio_chip *chip;
 
 		/* idx must always match exactly */
@@ -4464,18 +4464,30 @@ static struct gpio_desc *gpiod_find(struct device *dev, const char *con_id,
 		if (p->con_id && (!con_id || strcmp(p->con_id, con_id)))
 			continue;
 
-		chip = find_chip_by_name(p->chip_label);
+		if (p->chip_hwnum == U16_MAX) {
+			desc = gpio_name_to_desc(p->key);
+			if (desc) {
+				*flags = p->flags;
+				return desc;
+			}
+
+			dev_warn(dev, "cannot find GPIO line %s, deferring\n",
+				 p->key);
+			return ERR_PTR(-EPROBE_DEFER);
+		}
+
+		chip = find_chip_by_name(p->key);
 
 		if (!chip) {
 			/*
 			 * As the lookup table indicates a chip with
-			 * p->chip_label should exist, assume it may
+			 * p->key should exist, assume it may
 			 * still appear later and let the interested
 			 * consumer be probed again or let the Deferred
 			 * Probe infrastructure handle the error.
 			 */
 			dev_warn(dev, "cannot find GPIO chip %s, deferring\n",
-				 p->chip_label);
+				 p->key);
 			return ERR_PTR(-EPROBE_DEFER);
 		}
 
@@ -4506,7 +4518,7 @@ static int platform_gpio_count(struct device *dev, const char *con_id)
 	if (!table)
 		return -ENOENT;
 
-	for (p = &table->table[0]; p->chip_label; p++) {
+	for (p = &table->table[0]; p->key; p++) {
 		if ((con_id && p->con_id && !strcmp(con_id, p->con_id)) ||
 		    (!con_id && !p->con_id))
 			count++;
diff --git a/include/linux/gpio/machine.h b/include/linux/gpio/machine.h
index 1ebe5be05d5f81fa..84c66fbf54fd5811 100644
--- a/include/linux/gpio/machine.h
+++ b/include/linux/gpio/machine.h
@@ -20,8 +20,9 @@ enum gpio_lookup_flags {
 
 /**
  * struct gpiod_lookup - lookup table
- * @chip_label: name of the chip the GPIO belongs to
- * @chip_hwnum: hardware number (i.e. relative to the chip) of the GPIO
+ * @key: either the name of the chip the GPIO belongs to, or the GPIO line name
+ * @chip_hwnum: hardware number (i.e. relative to the chip) of the GPIO, or
+ *              U16_MAX to indicate that @key is a GPIO line name
  * @con_id: name of the GPIO from the device's point of view
  * @idx: index of the GPIO in case several GPIOs share the same name
  * @flags: bitmask of gpio_lookup_flags GPIO_* values
@@ -30,7 +31,7 @@ enum gpio_lookup_flags {
  * functions using platform data.
  */
 struct gpiod_lookup {
-	const char *chip_label;
+	const char *key;
 	u16 chip_hwnum;
 	const char *con_id;
 	unsigned int idx;
@@ -63,17 +64,17 @@ struct gpiod_hog {
 /*
  * Simple definition of a single GPIO under a con_id
  */
-#define GPIO_LOOKUP(_chip_label, _chip_hwnum, _con_id, _flags) \
-	GPIO_LOOKUP_IDX(_chip_label, _chip_hwnum, _con_id, 0, _flags)
+#define GPIO_LOOKUP(_key, _chip_hwnum, _con_id, _flags) \
+	GPIO_LOOKUP_IDX(_key, _chip_hwnum, _con_id, 0, _flags)
 
 /*
  * Use this macro if you need to have several GPIOs under the same con_id.
  * Each GPIO needs to use a different index and can be accessed using
  * gpiod_get_index()
  */
-#define GPIO_LOOKUP_IDX(_chip_label, _chip_hwnum, _con_id, _idx, _flags)  \
+#define GPIO_LOOKUP_IDX(_key, _chip_hwnum, _con_id, _idx, _flags)         \
 {                                                                         \
-	.chip_label = _chip_label,                                        \
+	.key = _key,                                                      \
 	.chip_hwnum = _chip_hwnum,                                        \
 	.con_id = _con_id,                                                \
 	.idx = _idx,                                                      \
-- 
2.17.1

