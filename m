Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BAB9195C91
	for <lists+linux-gpio@lfdr.de>; Fri, 27 Mar 2020 18:23:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727830AbgC0RXP (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 27 Mar 2020 13:23:15 -0400
Received: from metis.ext.pengutronix.de ([85.220.165.71]:60961 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727774AbgC0RXP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 27 Mar 2020 13:23:15 -0400
Received: from dude.hi.pengutronix.de ([2001:67c:670:100:1d::7])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1jHsh4-0003b8-VX; Fri, 27 Mar 2020 18:22:54 +0100
Received: from ukl by dude.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1jHsh3-000823-HX; Fri, 27 Mar 2020 18:22:53 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Marek Vasut <marek.vasut@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "H. Nikolaus Schaller" <hns@goldelico.com>,
        Mark Brown <broonie@kernel.org>
Cc:     kernel@pengutronix.de, linux-gpio@vger.kernel.org
Subject: [PATCH v1 1/2] [RFC] gpio: pca953x: fix handling of automatic address incrementing
Date:   Fri, 27 Mar 2020 18:22:43 +0100
Message-Id: <20200327172244.30816-2-u.kleine-koenig@pengutronix.de>
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

Some of the chips supported by the pca953x driver need the most
significant bit in the address word set to automatically increment the
address pointer on subsequent reads and writes (example: PCA9505). With
this bit unset the same register is read multiple times on a multi-byte
read sequence. Other chips must not have this bit set and autoincrement
always (example: PCA9555).

Up to now this AI bit was interpreted to be part of the address, which
resulted in inconsistent regmap caching when a register was written with
AI set and then read without it. This happened for the PCA9505 in
pca953x_gpio_set_multiple() where pca953x_read_regs() bulk read from the
cache for registers 0x8-0xc and then wrote to registers 0x88-0x8c. (Side
note: reading 5 values from offset 0x8 yiels OP0 5 times because AI must
be set to get OP0-OP4, which is another bug that is resolved here as a
by-product.) The same problem happens when calls to gpio_set_value() and
gpio_set_array_value() were mixed.

With this patch the AI bit is always set for chips that support it. This
works as there are no code locations that make use of the behaviour with
AI unset (for the chips that support it).

Note that the call to pca953x_setup_gpio() had to be done a bit earlier
to make the NBANK macro work.

The history of this bug is a bit complicated. Commit b32cecb46bdc
("gpio: pca953x: Extract the register address mangling to single
function") changed which chips and functions are affected. Commit
3b00691cc46a ("gpio: pca953x: hack to fix 24 bit gpio expanders") used
some duct tape to make the driver at least appear to work. Commit
49427232764d ("gpio: pca953x: Perform basic regmap conversion")
introduced the caching. Commit b4818afeacbd ("gpio: pca953x: Add
set_multiple to allow multiple bits to be set in one write.") introduced
the .set_multiple() callback which didn't work for chips that need the
AI bit which was fixed later for some chips in 8958262af3fb ("gpio:
pca953x: Repair multi-byte IO address increment on PCA9575"). So I'm
sorry, I don't know which commit I should pick for a Fixes: line.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpio/gpio-pca953x.c | 44 +++++++++++++++++++++++--------------
 1 file changed, 28 insertions(+), 16 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 5638b4e5355f..8168558299c2 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -307,8 +307,22 @@ static const struct regmap_config pca953x_i2c_regmap = {
 	.volatile_reg = pca953x_volatile_register,
 
 	.cache_type = REGCACHE_RBTREE,
-	/* REVISIT: should be 0x7f but some 24 bit chips use REG_ADDR_AI */
-	.max_register = 0xff,
+	.max_register = 0x7f,
+};
+
+static const struct regmap_config pca953x_ai_i2c_regmap = {
+	.reg_bits = 8,
+	.val_bits = 8,
+
+	.read_flag_mask = REG_ADDR_AI,
+	.write_flag_mask = REG_ADDR_AI,
+
+	.readable_reg = pca953x_readable_register,
+	.writeable_reg = pca953x_writeable_register,
+	.volatile_reg = pca953x_volatile_register,
+
+	.cache_type = REGCACHE_RBTREE,
+	.max_register = 0x7f,
 };
 
 static u8 pca953x_recalc_addr(struct pca953x_chip *chip, int reg, int off,
@@ -319,18 +333,6 @@ static u8 pca953x_recalc_addr(struct pca953x_chip *chip, int reg, int off,
 	int pinctrl = (reg & PCAL_PINCTRL_MASK) << 1;
 	u8 regaddr = pinctrl | addr | (off / BANK_SZ);
 
-	/* Single byte read doesn't need AI bit set. */
-	if (!addrinc)
-		return regaddr;
-
-	/* Chips with 24 and more GPIOs always support Auto Increment */
-	if (write && NBANK(chip) > 2)
-		regaddr |= REG_ADDR_AI;
-
-	/* PCA9575 needs address-increment on multi-byte writes */
-	if (PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE)
-		regaddr |= REG_ADDR_AI;
-
 	return regaddr;
 }
 
@@ -863,6 +865,7 @@ static int pca953x_probe(struct i2c_client *client,
 	int ret;
 	u32 invert = 0;
 	struct regulator *reg;
+	const struct regmap_config *regmap_config;
 
 	chip = devm_kzalloc(&client->dev, sizeof(*chip), GFP_KERNEL);
 	if (chip == NULL)
@@ -925,7 +928,17 @@ static int pca953x_probe(struct i2c_client *client,
 
 	i2c_set_clientdata(client, chip);
 
-	chip->regmap = devm_regmap_init_i2c(client, &pca953x_i2c_regmap);
+	pca953x_setup_gpio(chip, chip->driver_data & PCA_GPIO_MASK);
+
+	if (NBANK(chip) > 2 || PCA_CHIP_TYPE(chip->driver_data) == PCA957X_TYPE) {
+		dev_info(&client->dev, "using AI\n");
+		regmap_config = &pca953x_ai_i2c_regmap;
+	} else {
+		dev_info(&client->dev, "using no AI\n");
+		regmap_config = &pca953x_i2c_regmap;
+	}
+
+	chip->regmap = devm_regmap_init_i2c(client, regmap_config);
 	if (IS_ERR(chip->regmap)) {
 		ret = PTR_ERR(chip->regmap);
 		goto err_exit;
@@ -956,7 +969,6 @@ static int pca953x_probe(struct i2c_client *client,
 	/* initialize cached registers from their original values.
 	 * we can't share this chip with another i2c master.
 	 */
-	pca953x_setup_gpio(chip, chip->driver_data & PCA_GPIO_MASK);
 
 	if (PCA_CHIP_TYPE(chip->driver_data) == PCA953X_TYPE) {
 		chip->regs = &pca953x_regs;
-- 
2.26.0.rc2

