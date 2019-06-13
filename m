Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 828344463D
	for <lists+linux-gpio@lfdr.de>; Thu, 13 Jun 2019 18:50:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbfFMQuD (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 13 Jun 2019 12:50:03 -0400
Received: from anchovy2.45ru.net.au ([203.30.46.146]:55054 "EHLO
        anchovy2.45ru.net.au" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725835AbfFMEKd (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Jun 2019 00:10:33 -0400
Received: (qmail 16694 invoked by uid 5089); 13 Jun 2019 04:10:31 -0000
Received: by simscan 1.2.0 ppid: 16625, pid: 16626, t: 0.0596s
         scanners: regex: 1.2.0 attach: 1.2.0 clamav: 0.88.3/m:40/d:1950
X-RBL:  $rbltext
Received: from unknown (HELO preid-c7.electromag.com.au) (preid@electromag.com.au@203.59.235.95)
  by anchovy3.45ru.net.au with ESMTPA; 13 Jun 2019 04:10:30 -0000
Received: by preid-c7.electromag.com.au (Postfix, from userid 1000)
        id 29984200A3930; Thu, 13 Jun 2019 12:10:26 +0800 (AWST)
From:   Phil Reid <preid@electromag.com.au>
To:     linus.walleij@linaro.org, jkridner@gmail.com,
        m.felsch@pengutronix.de, poeschel@lemonage.de,
        preid@electromag.com.au, gustavo@embeddedor.com,
        linux-gpio@vger.kernel.org
Subject: [PATCH v3 1/1] pinctlr: mcp23s08: Fix add_data and irqchip_add_nested call order
Date:   Thu, 13 Jun 2019 12:10:23 +0800
Message-Id: <1560399023-12638-1-git-send-email-preid@electromag.com.au>
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

Fixes: 02e389e63 ("pinctrl: mcp23s08: fix irq setup order")
Suggested-by: Marco Felsch <m.felsch@pengutronix.de>
Signed-off-by: Phil Reid <preid@electromag.com.au>
---

Notes:
    v3:
    - Add fixes tag
    
    v2:
    - remove unrelated whitespace changes

 drivers/pinctrl/pinctrl-mcp23s08.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 5d7a851..b727de56 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -881,6 +881,10 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	if (ret < 0)
 		goto fail;
 
+	ret = devm_gpiochip_add_data(dev, &mcp->chip, mcp);
+	if (ret < 0)
+		goto fail;
+
 	mcp->irq_controller =
 		device_property_read_bool(dev, "interrupt-controller");
 	if (mcp->irq && mcp->irq_controller) {
@@ -922,10 +926,6 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 			goto fail;
 	}
 
-	ret = devm_gpiochip_add_data(dev, &mcp->chip, mcp);
-	if (ret < 0)
-		goto fail;
-
 	if (one_regmap_config) {
 		mcp->pinctrl_desc.name = devm_kasprintf(dev, GFP_KERNEL,
 				"mcp23xxx-pinctrl.%d", raw_chip_address);
-- 
1.8.3.1

