Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E247D41A45
	for <lists+linux-gpio@lfdr.de>; Wed, 12 Jun 2019 04:12:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406576AbfFLCM3 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 11 Jun 2019 22:12:29 -0400
Received: from anchovy2.45ru.net.au ([203.30.46.146]:38526 "EHLO
        anchovy2.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405661AbfFLCM3 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Jun 2019 22:12:29 -0400
Received: (qmail 17943 invoked by uid 5089); 12 Jun 2019 02:12:27 -0000
Received: by simscan 1.2.0 ppid: 17895, pid: 17896, t: 0.0483s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
X-RBL:  $rbltext
Received: from unknown (HELO preid-c7.electromag.com.au) (preid@electromag.com.au@203.59.235.95)
  by anchovy3.45ru.net.au with ESMTPA; 12 Jun 2019 02:12:27 -0000
Received: by preid-c7.electromag.com.au (Postfix, from userid 1000)
        id F1F50200706F3; Wed, 12 Jun 2019 10:12:21 +0800 (AWST)
From:   Phil Reid <preid@electromag.com.au>
To:     linus.walleij@linaro.org, jkridner@gmail.com,
        m.felsch@pengutronix.de, poeschel@lemonage.de,
        preid@electromag.com.au, gustavo@embeddedor.com,
        linux-gpio@vger.kernel.org
Subject: [PATCH 1/1] pinctlr: mcp23s08: Fix add_data and irqchip_add_nested call order
Date:   Wed, 12 Jun 2019 10:12:17 +0800
Message-Id: <1560305537-54100-1-git-send-email-preid@electromag.com.au>
X-Mailer: git-send-email 1.8.3.1
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Currently probing of the mcp23s08 results in an error message
"detected irqchip that is shared with multiple gpiochips:
please fix the driver"

This is due to the following:

Call to mcp23s08_irqchip_setup() with call hierarchy:
mcp23s08_irqchip_setup()
  gpiochip_irqchip_add_nested()
    gpiochip_irqchip_add_key()
      gpiochip_set_irq_hooks()

Call to devm_gpiochip_add_data() with call hierarchy:
devm_gpiochip_add_data()
  gpiochip_add_data_with_key()
    gpiochip_add_irqchip()
      gpiochip_set_irq_hooks()

The gpiochip_add_irqchip() returns immediately if there isn't a irqchip
but we added a irqchip due to the previous mcp23s08_irqchip_setup()
call. So it calls gpiochip_set_irq_hooks() a second time.

Fix this by moving the call to devm_gpiochip_add_data before
the call to mcp23s08_irqchip_setup

Suggested-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Phil Reid <preid@electromag.com.au>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 5d7a851..c53be73 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -382,7 +382,6 @@ struct mcp23s08_driver_data {
 	struct mcp23s08		chip[];
 };
 
-
 static int mcp23s08_direction_input(struct gpio_chip *chip, unsigned offset)
 {
 	struct mcp23s08	*mcp = gpiochip_get_data(chip);
@@ -881,6 +880,10 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	if (ret < 0)
 		goto fail;
 
+	ret = devm_gpiochip_add_data(dev, &mcp->chip, mcp);
+	if (ret < 0)
+		goto fail;
+
 	mcp->irq_controller =
 		device_property_read_bool(dev, "interrupt-controller");
 	if (mcp->irq && mcp->irq_controller) {
@@ -922,10 +925,6 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 			goto fail;
 	}
 
-	ret = devm_gpiochip_add_data(dev, &mcp->chip, mcp);
-	if (ret < 0)
-		goto fail;
-
 	if (one_regmap_config) {
 		mcp->pinctrl_desc.name = devm_kasprintf(dev, GFP_KERNEL,
 				"mcp23xxx-pinctrl.%d", raw_chip_address);
@@ -1018,7 +1017,6 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 #endif
 #endif /* CONFIG_OF */
 
-
 #if IS_ENABLED(CONFIG_I2C)
 
 static int mcp230xx_probe(struct i2c_client *client,
-- 
1.8.3.1

