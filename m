Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CACD312D05E
	for <lists+linux-gpio@lfdr.de>; Mon, 30 Dec 2019 14:39:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727456AbfL3Ni7 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 Dec 2019 08:38:59 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:38004 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727480AbfL3Ni7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 Dec 2019 08:38:59 -0500
Received: from ramsan ([84.195.182.253])
        by laurent.telenet-ops.be with bizsmtp
        id kDeu2100J5USYZQ01Deu5A; Mon, 30 Dec 2019 14:38:57 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ilvG2-0001h3-Ik; Mon, 30 Dec 2019 14:38:54 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1ilvG2-0001Xq-Gl; Mon, 30 Dec 2019 14:38:54 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Pantelis Antoniou <pantelis.antoniou@konsulko.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Peter Ujfalusi <peter.ujfalusi@ti.com>,
        Chris Brandt <chris.brandt@renesas.com>,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 1/2] gpio: of: Extract of_gpiochip_add_hog()
Date:   Mon, 30 Dec 2019 14:38:51 +0100
Message-Id: <20191230133852.5890-2-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191230133852.5890-1-geert+renesas@glider.be>
References: <20191230133852.5890-1-geert+renesas@glider.be>
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Extract the code to add all GPIO hogs of a gpio-hog node into its own
function, so it can be reused.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpiolib-of.c | 49 ++++++++++++++++++++++++++-------------
 1 file changed, 33 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index b696e4598a240ea4..dfae797846bb746b 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -625,6 +625,35 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
 	return desc;
 }
 
+/**
+ * of_gpiochip_add_hog - Add all hogs in a hog device node
+ * @chip:	gpio chip to act on
+ * @hog:	device node describing the hogs
+ *
+ * Returns error if it fails otherwise 0 on success.
+ */
+static int of_gpiochip_add_hog(struct gpio_chip *chip, struct device_node *hog)
+{
+	enum gpiod_flags dflags;
+	struct gpio_desc *desc;
+	unsigned long lflags;
+	const char *name;
+	unsigned int i;
+	int ret;
+
+	for (i = 0;; i++) {
+		desc = of_parse_own_gpio(hog, chip, i, &name, &lflags, &dflags);
+		if (IS_ERR(desc))
+			break;
+
+		ret = gpiod_hog(desc, name, lflags, dflags);
+		if (ret < 0)
+			return ret;
+	}
+
+	return 0;
+}
+
 /**
  * of_gpiochip_scan_gpios - Scan gpio-controller for gpio definitions
  * @chip:	gpio chip to act on
@@ -635,29 +664,17 @@ static struct gpio_desc *of_parse_own_gpio(struct device_node *np,
  */
 static int of_gpiochip_scan_gpios(struct gpio_chip *chip)
 {
-	struct gpio_desc *desc = NULL;
 	struct device_node *np;
-	const char *name;
-	unsigned long lflags;
-	enum gpiod_flags dflags;
-	unsigned int i;
 	int ret;
 
 	for_each_available_child_of_node(chip->of_node, np) {
 		if (!of_property_read_bool(np, "gpio-hog"))
 			continue;
 
-		for (i = 0;; i++) {
-			desc = of_parse_own_gpio(np, chip, i, &name, &lflags,
-						 &dflags);
-			if (IS_ERR(desc))
-				break;
-
-			ret = gpiod_hog(desc, name, lflags, dflags);
-			if (ret < 0) {
-				of_node_put(np);
-				return ret;
-			}
+		ret = of_gpiochip_add_hog(chip, np);
+		if (ret < 0) {
+			of_node_put(np);
+			return ret;
 		}
 	}
 
-- 
2.17.1

