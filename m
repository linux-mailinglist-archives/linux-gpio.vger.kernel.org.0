Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B470D195C8A
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 18:23:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727773AbgC0RXA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 13:23:00 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:45721 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727754AbgC0RXA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 13:23:00 -0400
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1jHsh4-0003b9-VX; Fri, 27 Mar 2020 18:22:54 +0100
Received: from ukl by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1jHsh3-000826-IM; Fri, 27 Mar 2020 18:22:53 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Marek Vasut <marek.vasut@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Mark Brown <broonie@kernel.org>
Cc:     kernel@pengutronix.de, linux-gpio@vger.kernel.org
Subject: [PATCH v1 2/2] [RFC] gpio: pca953x: drop unused parameters of pca953x_recalc_addr()
Date:   Fri, 27 Mar 2020 18:22:44 +0100
Message-Id: <20200327172244.30816-3-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.26.0.rc2
In-Reply-To: <20200327172244.30816-1-u.kleine-koenig@pengutronix.de>
References: <20200327074922.vrxbcjw2xlrv2bkb@pengutronix.de>
 <20200327172244.30816-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::7
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

After the previous patch the two last parameters of
pca953x_recalc_addr() are unused and so can be dropped.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpio/gpio-pca953x.c | 31 +++++++++++--------------------
 1 file changed, 11 insertions(+), 20 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 8168558299c2..f4943cad5d0e 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -325,8 +325,7 @@ static const struct regmap_config pca953x_ai_i2c_regmap = {
 	.max_register = 0x7f,
 };
 
-static u8 pca953x_recalc_addr(struct pca953x_chip *chip, int reg, int off,
-			      bool write, bool addrinc)
+static u8 pca953x_recalc_addr(struct pca953x_chip *chip, int reg, int off)
 {
 	int bank_shift = pca953x_bank_shift(chip);
 	int addr = (reg & PCAL_GPIO_MASK) << bank_shift;
@@ -338,7 +337,7 @@ static u8 pca953x_recalc_addr(struct pca953x_chip *chip, int reg, int off,
 
 static int pca953x_write_regs(struct pca953x_chip *chip, int reg, unsigned long *val)
 {
-	u8 regaddr = pca953x_recalc_addr(chip, reg, 0, true, true);
+	u8 regaddr = pca953x_recalc_addr(chip, reg, 0;
 	u8 value[MAX_BANK];
 	int i, ret;
 
@@ -356,7 +355,7 @@ static int pca953x_write_regs(struct pca953x_chip *chip, int reg, unsigned long
 
 static int pca953x_read_regs(struct pca953x_chip *chip, int reg, unsigned long *val)
 {
-	u8 regaddr = pca953x_recalc_addr(chip, reg, 0, false, true);
+	u8 regaddr = pca953x_recalc_addr(chip, reg, 0);
 	u8 value[MAX_BANK];
 	int i, ret;
 
@@ -375,8 +374,7 @@ static int pca953x_read_regs(struct pca953x_chip *chip, int reg, unsigned long *
 static int pca953x_gpio_direction_input(struct gpio_chip *gc, unsigned off)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
-	u8 dirreg = pca953x_recalc_addr(chip, chip->regs->direction, off,
-					true, false);
+	u8 dirreg = pca953x_recalc_addr(chip, chip->regs->direction, off);
 	u8 bit = BIT(off % BANK_SZ);
 	int ret;
 
@@ -390,10 +388,8 @@ static int pca953x_gpio_direction_output(struct gpio_chip *gc,
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
 
@@ -413,8 +409,7 @@ static int pca953x_gpio_direction_output(struct gpio_chip *gc,
 static int pca953x_gpio_get_value(struct gpio_chip *gc, unsigned off)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
-	u8 inreg = pca953x_recalc_addr(chip, chip->regs->input, off,
-				       true, false);
+	u8 inreg = pca953x_recalc_addr(chip, chip->regs->input, off);
 	u8 bit = BIT(off % BANK_SZ);
 	u32 reg_val;
 	int ret;
@@ -438,8 +433,7 @@ static int pca953x_gpio_get_value(struct gpio_chip *gc, unsigned off)
 static void pca953x_gpio_set_value(struct gpio_chip *gc, unsigned off, int val)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
-	u8 outreg = pca953x_recalc_addr(chip, chip->regs->output, off,
-					true, false);
+	u8 outreg = pca953x_recalc_addr(chip, chip->regs->output, off);
 	u8 bit = BIT(off % BANK_SZ);
 
 	mutex_lock(&chip->i2c_lock);
@@ -450,8 +444,7 @@ static void pca953x_gpio_set_value(struct gpio_chip *gc, unsigned off, int val)
 static int pca953x_gpio_get_direction(struct gpio_chip *gc, unsigned off)
 {
 	struct pca953x_chip *chip = gpiochip_get_data(gc);
-	u8 dirreg = pca953x_recalc_addr(chip, chip->regs->direction, off,
-					true, false);
+	u8 dirreg = pca953x_recalc_addr(chip, chip->regs->direction, off);
 	u8 bit = BIT(off % BANK_SZ);
 	u32 reg_val;
 	int ret;
@@ -491,10 +484,8 @@ static int pca953x_gpio_set_pull_up_down(struct pca953x_chip *chip,
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
2.26.0.rc2

