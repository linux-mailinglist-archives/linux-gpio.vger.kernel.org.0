Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAAC151755D
	for <lists+linux-gpio@lfdr.de>; Mon,  2 May 2022 19:06:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243520AbiEBRJr (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 2 May 2022 13:09:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243652AbiEBRJj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 May 2022 13:09:39 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 778E0CC4
        for <linux-gpio@vger.kernel.org>; Mon,  2 May 2022 10:06:10 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nlZUs-0006Gu-N4; Mon, 02 May 2022 19:06:06 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nlZUs-006ZT9-Ok; Mon, 02 May 2022 19:06:05 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nlZUq-0076m8-GZ; Mon, 02 May 2022 19:06:04 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
        kernel@pengutronix.de
Subject: [PATCH] gpio: pca953x: Make platform teardown callback return void
Date:   Mon,  2 May 2022 19:05:55 +0200
Message-Id: <20220502170555.51183-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3556; h=from:subject; bh=JEvm0qzNzM4pRC0um1wbjyXWeGgx7Mh6I8qKkdfNeLw=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBicA9vU947GM/yHUONegqwYFqzBSWcrkyWTlpW3n+k Hf2B7S6JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYnAPbwAKCRDB/BR4rcrsCTLqB/ 9IjcY2rpO9oEPtLayfFRe7vc4JIV9epR04f6ZzwMiSwiE9Kt4Yl6IcnncwXVcFp0SKxOo8twj5aylA 6/1SUu9N0jXtYOqFX8zjjC5/XRGfRGAKpwXUpus6RRPTpy5SCRujbICEe9E4oFt/cGTjgVulipCuNX KUzww/d0AsRjvxFJJzuAe5U5qCSu956zAjCf/BrM0lv7fhIg76W0We0TXLeN2xVspNaw9/t1F0+Yow Kp61hGvJDAKpQbnP3HPd6Wy5DovgzJtKQ8Q430KMhFkxhBOsfACxoTCa8G0wA8pO5j8b/1YWEx8mrU OjuQG1Tt9jBQ1DWjGeoc/bwLaN/lk7
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

All platforms that provide a teardown callback return 0. New users are
supposed to not make use of platform support, so there is no
functionality lost.

This patch is a preparation for making i2c remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 arch/arm/mach-davinci/board-da850-evm.c | 12 ++++--------
 drivers/gpio/gpio-pca953x.c             | 11 +++--------
 include/linux/platform_data/pca953x.h   |  2 +-
 3 files changed, 8 insertions(+), 17 deletions(-)

diff --git a/arch/arm/mach-davinci/board-da850-evm.c b/arch/arm/mach-davinci/board-da850-evm.c
index 428012687a80..e86622416d0e 100644
--- a/arch/arm/mach-davinci/board-da850-evm.c
+++ b/arch/arm/mach-davinci/board-da850-evm.c
@@ -519,8 +519,8 @@ static int da850_evm_ui_expander_setup(struct i2c_client *client, unsigned gpio,
 	return ret;
 }
 
-static int da850_evm_ui_expander_teardown(struct i2c_client *client,
-					unsigned gpio, unsigned ngpio, void *c)
+static void da850_evm_ui_expander_teardown(struct i2c_client *client,
+					   unsigned gpio, unsigned ngpio, void *c)
 {
 	platform_device_unregister(&da850_evm_ui_keys_device);
 
@@ -532,8 +532,6 @@ static int da850_evm_ui_expander_teardown(struct i2c_client *client,
 	gpio_free(gpio + DA850_EVM_UI_EXP_SEL_C);
 	gpio_free(gpio + DA850_EVM_UI_EXP_SEL_B);
 	gpio_free(gpio + DA850_EVM_UI_EXP_SEL_A);
-
-	return 0;
 }
 
 /* assign the baseboard expander's GPIOs after the UI board's */
@@ -700,13 +698,11 @@ static int da850_evm_bb_expander_setup(struct i2c_client *client,
 	return ret;
 }
 
-static int da850_evm_bb_expander_teardown(struct i2c_client *client,
-					unsigned gpio, unsigned ngpio, void *c)
+static void da850_evm_bb_expander_teardown(struct i2c_client *client,
+					   unsigned gpio, unsigned ngpio, void *c)
 {
 	platform_device_unregister(&da850_evm_bb_leds_device);
 	platform_device_unregister(&da850_evm_bb_keys_device);
-
-	return 0;
 }
 
 static struct pca953x_platform_data da850_evm_ui_expander_info = {
diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index d2fe76f3f34f..f985a1d67762 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -1087,20 +1087,15 @@ static int pca953x_remove(struct i2c_client *client)
 {
 	struct pca953x_platform_data *pdata = dev_get_platdata(&client->dev);
 	struct pca953x_chip *chip = i2c_get_clientdata(client);
-	int ret;
 
 	if (pdata && pdata->teardown) {
-		ret = pdata->teardown(client, chip->gpio_chip.base,
-				      chip->gpio_chip.ngpio, pdata->context);
-		if (ret < 0)
-			dev_err(&client->dev, "teardown failed, %d\n", ret);
-	} else {
-		ret = 0;
+		pdata->teardown(client, chip->gpio_chip.base,
+				chip->gpio_chip.ngpio, pdata->context);
 	}
 
 	regulator_disable(chip->regulator);
 
-	return ret;
+	return 0;
 }
 
 #ifdef CONFIG_PM_SLEEP
diff --git a/include/linux/platform_data/pca953x.h b/include/linux/platform_data/pca953x.h
index 4eb53e023997..96c1a14ab365 100644
--- a/include/linux/platform_data/pca953x.h
+++ b/include/linux/platform_data/pca953x.h
@@ -22,7 +22,7 @@ struct pca953x_platform_data {
 	int		(*setup)(struct i2c_client *client,
 				unsigned gpio, unsigned ngpio,
 				void *context);
-	int		(*teardown)(struct i2c_client *client,
+	void		(*teardown)(struct i2c_client *client,
 				unsigned gpio, unsigned ngpio,
 				void *context);
 	const char	*const *names;

base-commit: 3123109284176b1532874591f7c81f3837bbdc17
-- 
2.35.1

