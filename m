Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79943517572
	for <lists+linux-gpio@lfdr.de>; Mon,  2 May 2022 19:09:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386601AbiEBRMe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 May 2022 13:12:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1386554AbiEBRMP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 May 2022 13:12:15 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E43E75FDD
        for <linux-gpio@vger.kernel.org>; Mon,  2 May 2022 10:08:45 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nlZXO-0006gD-OZ; Mon, 02 May 2022 19:08:42 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nlZXO-006ZTn-NK; Mon, 02 May 2022 19:08:41 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nlZXM-0077Av-I8; Mon, 02 May 2022 19:08:40 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>, kernel@pengutronix.de,
        linux-gpio@vger.kernel.org
Subject: [PATCH] gpio: max732x: Drop unused support for irq and setup code via platform data
Date:   Mon,  2 May 2022 19:08:27 +0200
Message-Id: <20220502170827.51396-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3770; h=from:subject; bh=sas8GpEb9pRHxpp4zJxTJ8cLeVDoC5Xw2BUrzQtD0jE=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBicBAIkt9+qZozlS1HZzijwy7S0KZbtZbcNI1Rk+PU UV1gZ+OJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYnAQCAAKCRDB/BR4rcrsCTIXCA CUY8UV60OMAk1xca2V4CxU7R970KNzrtNnR5jQZOByOwuM529JUXBmjPQ/ba70aenTOCwkfw0YqnmX V83qmM72f6pGP8Ct8AUOxQKDqxJUtKaOWwITwhZRI2q4CKW2SLrxqsUHaCU0Fezczivk58hhOvz1hm WxUDbzMbjHy+ELVudbHBZEJBaIC+V0f0f606UIWuZON08Ni2yfGnzmEnDRARmrBb13CxmAfLKhX94T fRv/Enl+VJGDxxFQv1sxHWybK1j7vuunhjmLRO7h534ThplKmDMZezih5tIOsUJNbmqjBN0+PNxuzX nDyfbdd5qBQjWSRcAN0oxeo1kFC4sr
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

The only user of max732x_platform_data is arch/arm/mach-pxa/littleton.c
and it only uses .gpio_base. So drop the other members from the data struct
and simplify the driver accordingly.

The motivating side effect of this change is that the .remove() callback
cannot return a nonzero error code any more which prepares making i2c
remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpio/gpio-max732x.c           | 37 ++-------------------------
 include/linux/platform_data/max732x.h | 12 ---------
 2 files changed, 2 insertions(+), 47 deletions(-)

diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index 238cbe926b9f..da6972117030 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -496,17 +496,13 @@ static int max732x_irq_setup(struct max732x_chip *chip,
 			     const struct i2c_device_id *id)
 {
 	struct i2c_client *client = chip->client;
-	struct max732x_platform_data *pdata = dev_get_platdata(&client->dev);
 	int has_irq = max732x_features[id->driver_data] >> 32;
 	int irq_base = 0;
 	int ret;
 
-	if (((pdata && pdata->irq_base) || client->irq)
-			&& has_irq != INT_NONE) {
+	if (client->irq && has_irq != INT_NONE) {
 		struct gpio_irq_chip *girq;
 
-		if (pdata)
-			irq_base = pdata->irq_base;
 		chip->irq_features = has_irq;
 		mutex_init(&chip->irq_lock);
 
@@ -540,10 +536,9 @@ static int max732x_irq_setup(struct max732x_chip *chip,
 			     const struct i2c_device_id *id)
 {
 	struct i2c_client *client = chip->client;
-	struct max732x_platform_data *pdata = dev_get_platdata(&client->dev);
 	int has_irq = max732x_features[id->driver_data] >> 32;
 
-	if (((pdata && pdata->irq_base) || client->irq) && has_irq != INT_NONE)
+	if (client->irq && has_irq != INT_NONE)
 		dev_warn(&client->dev, "interrupt support not compiled in\n");
 
 	return 0;
@@ -703,44 +698,16 @@ static int max732x_probe(struct i2c_client *client,
 	if (ret)
 		return ret;
 
-	if (pdata->setup) {
-		ret = pdata->setup(client, chip->gpio_chip.base,
-				chip->gpio_chip.ngpio, pdata->context);
-		if (ret < 0)
-			dev_warn(&client->dev, "setup failed, %d\n", ret);
-	}
-
 	i2c_set_clientdata(client, chip);
 	return 0;
 }
 
-static int max732x_remove(struct i2c_client *client)
-{
-	struct max732x_platform_data *pdata = dev_get_platdata(&client->dev);
-	struct max732x_chip *chip = i2c_get_clientdata(client);
-
-	if (pdata && pdata->teardown) {
-		int ret;
-
-		ret = pdata->teardown(client, chip->gpio_chip.base,
-				chip->gpio_chip.ngpio, pdata->context);
-		if (ret < 0) {
-			dev_err(&client->dev, "%s failed, %d\n",
-					"teardown", ret);
-			return ret;
-		}
-	}
-
-	return 0;
-}
-
 static struct i2c_driver max732x_driver = {
 	.driver = {
 		.name		= "max732x",
 		.of_match_table	= of_match_ptr(max732x_of_table),
 	},
 	.probe		= max732x_probe,
-	.remove		= max732x_remove,
 	.id_table	= max732x_id,
 };
 
diff --git a/include/linux/platform_data/max732x.h b/include/linux/platform_data/max732x.h
index f231c635faec..423999207cd5 100644
--- a/include/linux/platform_data/max732x.h
+++ b/include/linux/platform_data/max732x.h
@@ -7,17 +7,5 @@
 struct max732x_platform_data {
 	/* number of the first GPIO */
 	unsigned	gpio_base;
-
-	/* interrupt base */
-	int		irq_base;
-
-	void		*context;	/* param to setup/teardown */
-
-	int		(*setup)(struct i2c_client *client,
-				unsigned gpio, unsigned ngpio,
-				void *context);
-	int		(*teardown)(struct i2c_client *client,
-				unsigned gpio, unsigned ngpio,
-				void *context);
 };
 #endif /* __LINUX_I2C_MAX732X_H */

base-commit: 3123109284176b1532874591f7c81f3837bbdc17
-- 
2.35.1

