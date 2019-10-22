Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86CFDE0AAD
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Oct 2019 19:31:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727154AbfJVR3t (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Oct 2019 13:29:49 -0400
Received: from mga11.intel.com ([192.55.52.93]:43553 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388136AbfJVR3a (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 22 Oct 2019 13:29:30 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 Oct 2019 10:29:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,217,1569308400"; 
   d="scan'208";a="196507356"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga008.fm.intel.com with ESMTP; 22 Oct 2019 10:29:28 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 40CB84FE; Tue, 22 Oct 2019 20:29:24 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Yury Norov <yury.norov@gmail.com>,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        William Breathitt Gray <vilhelm.gray@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v2 11/11] gpio: pca953x: Tight up indentation
Date:   Tue, 22 Oct 2019 20:29:22 +0300
Message-Id: <20191022172922.61232-12-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191022172922.61232-1-andriy.shevchenko@linux.intel.com>
References: <20191022172922.61232-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is no need to split some of the lines. However,
improve the style of multi-line comment. On top of this
there is no need to have double space.

Correct above indentation issues without altering the functionality.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pca953x.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 774e4c69df03..f80ed5a43614 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -421,7 +421,9 @@ static int pca953x_gpio_get_value(struct gpio_chip *gc, unsigned off)
 	ret = regmap_read(chip->regmap, inreg, &reg_val);
 	mutex_unlock(&chip->i2c_lock);
 	if (ret < 0) {
-		/* NOTE:  diagnostic already emitted; that's all we should
+		/*
+		 * NOTE:
+		 * diagnostic already emitted; that's all we should
 		 * do unless gpio_*_value_cansleep() calls become different
 		 * from their nonsleeping siblings (and report faults).
 		 */
@@ -735,8 +737,7 @@ static irqreturn_t pca953x_irq_handler(int irq, void *devid)
 	return IRQ_HANDLED;
 }
 
-static int pca953x_irq_setup(struct pca953x_chip *chip,
-			     int irq_base)
+static int pca953x_irq_setup(struct pca953x_chip *chip, int irq_base)
 {
 	struct i2c_client *client = chip->client;
 	struct irq_chip *irq_chip = &chip->irq_chip;
@@ -786,9 +787,9 @@ static int pca953x_irq_setup(struct pca953x_chip *chip,
 	irq_chip->irq_set_type = pca953x_irq_set_type;
 	irq_chip->irq_shutdown = pca953x_irq_shutdown;
 
-	ret =  gpiochip_irqchip_add_nested(&chip->gpio_chip, irq_chip,
-					   irq_base, handle_simple_irq,
-					   IRQ_TYPE_NONE);
+	ret = gpiochip_irqchip_add_nested(&chip->gpio_chip, irq_chip,
+					  irq_base, handle_simple_irq,
+					  IRQ_TYPE_NONE);
 	if (ret) {
 		dev_err(&client->dev,
 			"could not connect irqchip to gpiochip\n");
@@ -862,7 +863,7 @@ static int device_pca957x_init(struct pca953x_chip *chip, u32 invert)
 static const struct of_device_id pca953x_dt_ids[];
 
 static int pca953x_probe(struct i2c_client *client,
-				   const struct i2c_device_id *i2c_id)
+			 const struct i2c_device_id *i2c_id)
 {
 	struct pca953x_platform_data *pdata;
 	struct pca953x_chip *chip;
@@ -871,8 +872,7 @@ static int pca953x_probe(struct i2c_client *client,
 	u32 invert = 0;
 	struct regulator *reg;
 
-	chip = devm_kzalloc(&client->dev,
-			sizeof(struct pca953x_chip), GFP_KERNEL);
+	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
 	if (chip == NULL)
 		return -ENOMEM;
 
@@ -986,7 +986,7 @@ static int pca953x_probe(struct i2c_client *client,
 
 	if (pdata && pdata->setup) {
 		ret = pdata->setup(client, chip->gpio_chip.base,
-				chip->gpio_chip.ngpio, pdata->context);
+				   chip->gpio_chip.ngpio, pdata->context);
 		if (ret < 0)
 			dev_warn(&client->dev, "setup failed, %d\n", ret);
 	}
@@ -1006,7 +1006,7 @@ static int pca953x_remove(struct i2c_client *client)
 
 	if (pdata && pdata->teardown) {
 		ret = pdata->teardown(client, chip->gpio_chip.base,
-				chip->gpio_chip.ngpio, pdata->context);
+				      chip->gpio_chip.ngpio, pdata->context);
 		if (ret < 0)
 			dev_err(&client->dev, "teardown failed, %d\n", ret);
 	} else {
-- 
2.23.0

