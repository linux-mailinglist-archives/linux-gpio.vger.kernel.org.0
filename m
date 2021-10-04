Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 11B9A420B20
	for <lists+linux-gpio@lfdr.de>; Mon,  4 Oct 2021 14:45:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233182AbhJDMrm (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 4 Oct 2021 08:47:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233212AbhJDMrl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 4 Oct 2021 08:47:41 -0400
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be [IPv6:2a02:1800:120:4::f00:14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30062C06174E
        for <linux-gpio@vger.kernel.org>; Mon,  4 Oct 2021 05:45:52 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:9ca4:a53a:9ffa:e003])
        by xavier.telenet-ops.be with bizsmtp
        id 1olp2601B11933301olp4g; Mon, 04 Oct 2021 14:45:49 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mXNLn-001rl3-He; Mon, 04 Oct 2021 14:45:47 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1mXNLn-00430z-12; Mon, 04 Oct 2021 14:45:47 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] gpio: aggregator: Wrap access to gpiochip_fwd.tmp[]
Date:   Mon,  4 Oct 2021 14:45:45 +0200
Message-Id: <a9af5139b6b8eb687495ffae69d32acd305ac2f3.1633351482.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The tmp[] member of the gpiochip_fwd structure is used to store both the
temporary values bitmap and the desc pointers for operations on multiple
GPIOs.  As both are arrays with sizes unknown at compile-time, accessing
them requires offset calculations, which are currently duplicated in
gpio_fwd_get_multiple() and gpio_fwd_set_multiple().

Introduce (a) accessors for both arrays and (b) a macro to calculate the
needed storage size.  This confines the layout of the tmp[] member into
a single spot, to ease maintenance.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpio/gpio-aggregator.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-aggregator.c b/drivers/gpio/gpio-aggregator.c
index 2ff867d2a3630d3b..869dc952cf45218b 100644
--- a/drivers/gpio/gpio-aggregator.c
+++ b/drivers/gpio/gpio-aggregator.c
@@ -247,6 +247,11 @@ struct gpiochip_fwd {
 	unsigned long tmp[];		/* values and descs for multiple ops */
 };
 
+#define fwd_tmp_values(fwd)	&(fwd)->tmp[0]
+#define fwd_tmp_descs(fwd)	(void *)&(fwd)->tmp[BITS_TO_LONGS((fwd)->chip.ngpio)]
+
+#define fwd_tmp_size(ngpios)	(BITS_TO_LONGS((ngpios)) + (ngpios))
+
 static int gpio_fwd_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
 	struct gpiochip_fwd *fwd = gpiochip_get_data(chip);
@@ -279,15 +284,11 @@ static int gpio_fwd_get(struct gpio_chip *chip, unsigned int offset)
 static int gpio_fwd_get_multiple(struct gpiochip_fwd *fwd, unsigned long *mask,
 				 unsigned long *bits)
 {
-	struct gpio_desc **descs;
-	unsigned long *values;
+	struct gpio_desc **descs = fwd_tmp_descs(fwd);
+	unsigned long *values = fwd_tmp_values(fwd);
 	unsigned int i, j = 0;
 	int error;
 
-	/* Both values bitmap and desc pointers are stored in tmp[] */
-	values = &fwd->tmp[0];
-	descs = (void *)&fwd->tmp[BITS_TO_LONGS(fwd->chip.ngpio)];
-
 	bitmap_clear(values, 0, fwd->chip.ngpio);
 	for_each_set_bit(i, mask, fwd->chip.ngpio)
 		descs[j++] = fwd->descs[i];
@@ -333,14 +334,10 @@ static void gpio_fwd_set(struct gpio_chip *chip, unsigned int offset, int value)
 static void gpio_fwd_set_multiple(struct gpiochip_fwd *fwd, unsigned long *mask,
 				  unsigned long *bits)
 {
-	struct gpio_desc **descs;
-	unsigned long *values;
+	struct gpio_desc **descs = fwd_tmp_descs(fwd);
+	unsigned long *values = fwd_tmp_values(fwd);
 	unsigned int i, j = 0;
 
-	/* Both values bitmap and desc pointers are stored in tmp[] */
-	values = &fwd->tmp[0];
-	descs = (void *)&fwd->tmp[BITS_TO_LONGS(fwd->chip.ngpio)];
-
 	for_each_set_bit(i, mask, fwd->chip.ngpio) {
 		__assign_bit(j, values, test_bit(i, bits));
 		descs[j++] = fwd->descs[i];
@@ -405,8 +402,8 @@ static struct gpiochip_fwd *gpiochip_fwd_create(struct device *dev,
 	unsigned int i;
 	int error;
 
-	fwd = devm_kzalloc(dev, struct_size(fwd, tmp,
-			   BITS_TO_LONGS(ngpios) + ngpios), GFP_KERNEL);
+	fwd = devm_kzalloc(dev, struct_size(fwd, tmp, fwd_tmp_size(ngpios)),
+			   GFP_KERNEL);
 	if (!fwd)
 		return ERR_PTR(-ENOMEM);
 
-- 
2.25.1

