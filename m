Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (unknown [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 622BD5BBAB6
	for <lists+linux-gpio@lfdr.de>; Sat, 17 Sep 2022 23:39:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229501AbiIQVjF (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 17 Sep 2022 17:39:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbiIQVjE (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 17 Sep 2022 17:39:04 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31DA82C119
        for <linux-gpio@vger.kernel.org>; Sat, 17 Sep 2022 14:39:02 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1oZfWc-0003DA-7b; Sat, 17 Sep 2022 23:38:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oZfWc-001LhX-7v; Sat, 17 Sep 2022 23:38:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1oZfWZ-001asm-SF; Sat, 17 Sep 2022 23:38:55 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] gpio: twl4030: Reorder functions which allows to drop a forward declaraion
Date:   Sat, 17 Sep 2022 23:37:29 +0200
Message-Id: <20220917213729.341321-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2024; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=SCY8v1XGu1IE+mYAhpjFf5CXfVJXkcAjrpV9tbj44Lo=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjJj4QWhRg/XqIURA+h/OYzdP7CFiLdPqXS3EMExjD v0KCDq6JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYyY+EAAKCRDB/BR4rcrsCWdRB/ sGKOfxlMcOsS6azUZZpzsZGuF6y1pRW+hocwks95w6YVPm/y6LTzObJ9eE3tc3Jl5s3YgDi4mpUCyI prcwFWT+VDtk9JAcanX9fJ/MUta6vlPKu9euy49P06uByVwZEtGBYJrQNFXcTUZBGRkYmSeupd1HFk koTlGo48se4gKAro1Rh4zwTffBRAuWWmYscMGwEqxg/u0PLwir69HDGxazkWYzJ6UNDa9dhEvy2zfC OiwggQ5t2lErt4mLd3Eiw+5nYoKdUQmwv8RjpPOFhczA/gmwQA0mibiKvXIjUq02eSNI0hQEl3/Wx5 IkiPTAmZtwjjJOtRrAEg8X/dVyAm5y
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is no cyclic dependency between gpio_twl4030_probe() and
gpio_twl4030_remove(), so by moving the latter before the former the
forward declaration can be dropped.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpio/gpio-twl4030.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/drivers/gpio/gpio-twl4030.c b/drivers/gpio/gpio-twl4030.c
index 5046e51af8df..c1bb2c3ca6f2 100644
--- a/drivers/gpio/gpio-twl4030.c
+++ b/drivers/gpio/gpio-twl4030.c
@@ -465,8 +465,6 @@ static int gpio_twl4030_debounce(u32 debounce, u8 mmc_cd)
 				REG_GPIO_DEBEN1, 3);
 }
 
-static int gpio_twl4030_remove(struct platform_device *pdev);
-
 static struct twl4030_gpio_platform_data *of_gpio_twl4030(struct device *dev,
 				struct twl4030_gpio_platform_data *pdata)
 {
@@ -494,6 +492,18 @@ static struct twl4030_gpio_platform_data *of_gpio_twl4030(struct device *dev,
 	return omap_twl_info;
 }
 
+/* Cannot use as gpio_twl4030_probe() calls us */
+static int gpio_twl4030_remove(struct platform_device *pdev)
+{
+	struct gpio_twl4030_priv *priv = platform_get_drvdata(pdev);
+
+	gpiochip_remove(&priv->gpio_chip);
+
+	/* REVISIT no support yet for deregistering all the IRQs */
+	WARN_ON(!is_module());
+	return 0;
+}
+
 static int gpio_twl4030_probe(struct platform_device *pdev)
 {
 	struct twl4030_gpio_platform_data *pdata = dev_get_platdata(&pdev->dev);
@@ -590,18 +600,6 @@ static int gpio_twl4030_probe(struct platform_device *pdev)
 	return ret;
 }
 
-/* Cannot use as gpio_twl4030_probe() calls us */
-static int gpio_twl4030_remove(struct platform_device *pdev)
-{
-	struct gpio_twl4030_priv *priv = platform_get_drvdata(pdev);
-
-	gpiochip_remove(&priv->gpio_chip);
-
-	/* REVISIT no support yet for deregistering all the IRQs */
-	WARN_ON(!is_module());
-	return 0;
-}
-
 static const struct of_device_id twl_gpio_match[] = {
 	{ .compatible = "ti,twl4030-gpio", },
 	{ },
-- 
2.37.2

