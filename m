Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 762961B12F9
	for <lists+linux-gpio@lfdr.de>; Mon, 20 Apr 2020 19:27:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726355AbgDTR15 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 20 Apr 2020 13:27:57 -0400
Received: from mga03.intel.com ([134.134.136.65]:2872 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726081AbgDTR15 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 20 Apr 2020 13:27:57 -0400
IronPort-SDR: IGFn+tlZn1O7/12K7YAnAzsW66iduLxUe+E7zGVgZFKYfa+xaKcDKC0VbgiPNn5eJpW2qQgKl8
 zFAAjyX6hjBg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2020 10:27:56 -0700
IronPort-SDR: IST0KvdQ6A9cJz/g7DD+yqXpYHxTAgt2xbUaHL71FDq3eStfHWib0zHy6S3ZiA8zNnCh6rtF58
 rvkvhNTAWGOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,407,1580803200"; 
   d="scan'208";a="243892358"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga007.jf.intel.com with ESMTP; 20 Apr 2020 10:27:54 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id B64FD233; Mon, 20 Apr 2020 20:27:53 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-gpio@vger.kernel.org,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v3 3/3] gpio: pca953x: drop unused parameters of pca953x_recalc_addr()
Date:   Mon, 20 Apr 2020 20:27:52 +0300
Message-Id: <20200420172752.33588-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200420172752.33588-1-andriy.shevchenko@linux.intel.com>
References: <20200420172752.33588-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

After the previous patch the two last parameters of
pca953x_recalc_addr() are unused and so can be dropped.

Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpio/gpio-pca953x.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 590b072366377..06d6af60e6b76 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -326,8 +326,7 @@ static const struct regmap_config pca953x_ai_i2c_regmap = {
 	.max_register = 0x7f,
 };
 
-static u8 pca953x_recalc_addr(struct pca953x_chip *chip, int reg, int off,
-			      bool write, bool addrinc)
+static u8 pca953x_recalc_addr(struct pca953x_chip *chip, int reg, int off)
 {
 	int bank_shift = pca953x_bank_shift(chip);
 	int addr = (reg & PCAL_GPIO_MASK) << bank_shift;
@@ -339,7 +338,7 @@ static u8 pca953x_recalc_addr(struct pca953x_chip *chip, int reg, int off,
 
 static int pca953x_write_regs(struct pca953x_chip *chip, int reg, unsigned long *val)
 {
-	u8 regaddr = pca953x_recalc_addr(chip, reg, 0, true, true);
+	u8 regaddr = pca953x_recalc_addr(chip, reg, 0);
 	u8 value[MAX_BANK];
 	int i, ret;
 
@@ -357,7 +356,7 @@ static int pca953x_write_regs(struct pca953x_chip *chip, int reg, unsigned long
 
 static int pca953x_read_regs(struct pca953x_chip *chip, int reg, unsigned long *val)
 {
-	u8 regaddr = pca953x_recalc_addr(chip, reg, 0, false, true);
+	u8 regaddr = pca953x_recalc_addr(chip, reg, 0);
 	u8 value[MAX_BANK];
 	int i, ret;
 
@@ -376,8 +375,7 @@ static int pca953x_read_regs(struct pca953x_chip *chip, int reg, unsigned long *
 static int pca953x_gpio_direction_input(struct gpio_chip *gc, unsigned off)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
-	u8 dirreg = pca953x_recalc_addr(chip, chip->regs->direction, off,
-					true, false);
+	u8 dirreg = pca953x_recalc_addr(chip, chip->regs->direction, off);
 	u8 bit = BIT(off % BANK_SZ);
 	int ret;
 
@@ -391,10 +389,8 @@ static int pca953x_gpio_direction_output(struct gpio_chip *gc,
 		unsigned off, int val)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
-	u8 dirreg = pca953x_recalc_addr(chip, chip->regs->direction, off,
-					true, false);
-	u8 outreg = pca953x_recalc_addr(chip, chip->regs->output, off,
-					true, false);
+	u8 dirreg = pca953x_recalc_addr(chip, chip->regs->direction, off);
+	u8 outreg = pca953x_recalc_addr(chip, chip->regs->output, off);
 	u8 bit = BIT(off % BANK_SZ);
 	int ret;
 
@@ -414,8 +410,7 @@ static int pca953x_gpio_direction_output(struct gpio_chip *gc,
 static int pca953x_gpio_get_value(struct gpio_chip *gc, unsigned off)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
-	u8 inreg = pca953x_recalc_addr(chip, chip->regs->input, off,
-				       true, false);
+	u8 inreg = pca953x_recalc_addr(chip, chip->regs->input, off);
 	u8 bit = BIT(off % BANK_SZ);
 	u32 reg_val;
 	int ret;
@@ -439,8 +434,7 @@ static int pca953x_gpio_get_value(struct gpio_chip *gc, unsigned off)
 static void pca953x_gpio_set_value(struct gpio_chip *gc, unsigned off, int val)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
-	u8 outreg = pca953x_recalc_addr(chip, chip->regs->output, off,
-					true, false);
+	u8 outreg = pca953x_recalc_addr(chip, chip->regs->output, off);
 	u8 bit = BIT(off % BANK_SZ);
 
 	mutex_lock(&chip->i2c_lock);
@@ -451,8 +445,7 @@ static void pca953x_gpio_set_value(struct gpio_chip *gc, unsigned off, int val)
 static int pca953x_gpio_get_direction(struct gpio_chip *gc, unsigned off)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
-	u8 dirreg = pca953x_recalc_addr(chip, chip->regs->direction, off,
-					true, false);
+	u8 dirreg = pca953x_recalc_addr(chip, chip->regs->direction, off);
 	u8 bit = BIT(off % BANK_SZ);
 	u32 reg_val;
 	int ret;
@@ -509,10 +502,8 @@ static int pca953x_gpio_set_pull_up_down(struct pca953x_chip *chip,
 					 unsigned int offset,
 					 unsigned long config)
 {
-	u8 pull_en_reg = pca953x_recalc_addr(chip, PCAL953X_PULL_EN, offset,
-					     true, false);
-	u8 pull_sel_reg = pca953x_recalc_addr(chip, PCAL953X_PULL_SEL, offset,
-					      true, false);
+	u8 pull_en_reg = pca953x_recalc_addr(chip, PCAL953X_PULL_EN, offset);
+	u8 pull_sel_reg = pca953x_recalc_addr(chip, PCAL953X_PULL_SEL, offset);
 	u8 bit = BIT(offset % BANK_SZ);
 	int ret;
 
-- 
2.26.1

