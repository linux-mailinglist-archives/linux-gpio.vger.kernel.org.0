Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1208D54BAE9
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jun 2022 21:48:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238275AbiFNTsR (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jun 2022 15:48:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235323AbiFNTsQ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2022 15:48:16 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 882CA3120C
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jun 2022 12:48:15 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1o1CWK-0004GG-Bi; Tue, 14 Jun 2022 21:48:12 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o1CWH-000Xvz-N3; Tue, 14 Jun 2022 21:48:11 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o1CWI-00GJ5h-F7; Tue, 14 Jun 2022 21:48:10 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Lee Jones <lee.jones@linaro.org>
Cc:     linux-gpio@vger.kernel.org, Marek Vasut <marex@denx.de>
Subject: [PATCH] gpio: ucb1400: Remove platform setup and teardown support
Date:   Tue, 14 Jun 2022 21:48:02 +0200
Message-Id: <20220614194802.269738-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2509; h=from:subject; bh=SNkL7rVEiXDJzFcK9oSwiOwt32w7CKUNRZRysLh2NBs=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiqOXp7J9Y3Xxiti7nNuI4FXPNoc5moCQVWylv3PtD V3uswxyJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYqjl6QAKCRDB/BR4rcrsCex6B/ 9AhAU1CPH1eBYYCBStvjdZvx1uJ7WwITUHM6pduW1l/ja/k0lXB1SGuxX1PGG3xilYiDbkN+A0q9rF PaM3l3KLZg8r2fZMVyQjJOxeUIdpyPhxDcTFo7R9YeKSeQPP+xvWnI2ndt/knERP7oSn6VegzTnuko WULP3CZzqZZEmxb7LUoyuLtz+lpNOk3gMEjQnQbxKVbBD1IOtLvGjfVdkji1NVCpeB+a+CS0TzjmSF SzQqzdiyo7LeoNYq7m0pvDIljX6YRhO/zuWfBU0+2u1rmShRfn5nVUyTtB/rxF2ZodFiEX0DI8v2ZN ixOh7XjAAwda2P1T9ZSQ5kdEZT4srv
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

There is no user of these callbacks. The motivation for this change is
to stop returning an error code from the remove callback.

This is a preparation for making platform remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpio/gpio-ucb1400.c | 20 --------------------
 drivers/mfd/ucb1400_core.c  |  6 ++----
 include/linux/ucb1400.h     |  2 --
 3 files changed, 2 insertions(+), 26 deletions(-)

diff --git a/drivers/gpio/gpio-ucb1400.c b/drivers/gpio/gpio-ucb1400.c
index d2a8644864c3..386e69300332 100644
--- a/drivers/gpio/gpio-ucb1400.c
+++ b/drivers/gpio/gpio-ucb1400.c
@@ -64,34 +64,14 @@ static int ucb1400_gpio_probe(struct platform_device *dev)
 	ucb->gc.can_sleep = true;
 
 	err = devm_gpiochip_add_data(&dev->dev, &ucb->gc, ucb);
-	if (err)
-		goto err;
-
-	if (ucb->gpio_setup)
-		err = ucb->gpio_setup(&dev->dev, ucb->gc.ngpio);
 
 err:
 	return err;
 
 }
 
-static int ucb1400_gpio_remove(struct platform_device *dev)
-{
-	int err = 0;
-	struct ucb1400_gpio *ucb = platform_get_drvdata(dev);
-
-	if (ucb && ucb->gpio_teardown) {
-		err = ucb->gpio_teardown(&dev->dev, ucb->gc.ngpio);
-		if (err)
-			return err;
-	}
-
-	return err;
-}
-
 static struct platform_driver ucb1400_gpio_driver = {
 	.probe	= ucb1400_gpio_probe,
-	.remove	= ucb1400_gpio_remove,
 	.driver	= {
 		.name	= "ucb1400_gpio"
 	},
diff --git a/drivers/mfd/ucb1400_core.c b/drivers/mfd/ucb1400_core.c
index 8c3832a58ef6..ac1d18039568 100644
--- a/drivers/mfd/ucb1400_core.c
+++ b/drivers/mfd/ucb1400_core.c
@@ -72,11 +72,9 @@ static int ucb1400_core_probe(struct device *dev)
 
 	/* GPIO */
 	ucb_gpio.ac97 = ac97;
-	if (pdata) {
-		ucb_gpio.gpio_setup = pdata->gpio_setup;
-		ucb_gpio.gpio_teardown = pdata->gpio_teardown;
+	if (pdata)
 		ucb_gpio.gpio_offset = pdata->gpio_offset;
-	}
+
 	ucb->ucb1400_gpio = platform_device_alloc("ucb1400_gpio", -1);
 	if (!ucb->ucb1400_gpio) {
 		err = -ENOMEM;
diff --git a/include/linux/ucb1400.h b/include/linux/ucb1400.h
index 0968ef458447..22345391350b 100644
--- a/include/linux/ucb1400.h
+++ b/include/linux/ucb1400.h
@@ -84,8 +84,6 @@ struct ucb1400_gpio {
 	struct gpio_chip	gc;
 	struct snd_ac97		*ac97;
 	int			gpio_offset;
-	int			(*gpio_setup)(struct device *dev, int ngpio);
-	int			(*gpio_teardown)(struct device *dev, int ngpio);
 };
 
 struct ucb1400_ts {

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
2.36.1

