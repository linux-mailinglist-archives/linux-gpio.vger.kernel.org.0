Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07D58530B86
	for <lists+linux-gpio@lfdr.de>; Mon, 23 May 2022 11:03:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231864AbiEWIkK (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 23 May 2022 04:40:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231986AbiEWIkI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 23 May 2022 04:40:08 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59BA323BC7
        for <linux-gpio@vger.kernel.org>; Mon, 23 May 2022 01:40:03 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nt3bc-00063c-1D; Mon, 23 May 2022 10:40:00 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nt3bb-0042tQ-P5; Mon, 23 May 2022 10:39:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nt3bZ-00BZ7q-PL; Mon, 23 May 2022 10:39:57 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Michael Hennerich <michael.hennerich@analog.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] gpio: adp5588: Remove support for platform setup and teardown callbacks
Date:   Mon, 23 May 2022 10:39:47 +0200
Message-Id: <20220523083947.840708-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2410; h=from:subject; bh=TKOAhKfOfoyr/WYLdTkjwj21WcTF3HPrFNvJMn2w/Cc=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBii0hPEf1oAHXMEjUOAdkqUcVBQiqGM/isg6wghPyL NsqWEgGJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYotITwAKCRDB/BR4rcrsCWcaCA CDC74vvB54Cr9Qbj6MueBItfx0Fa5Gtq+r7/z8WJajY5EiwqIus18eynjABXjB+zbmzYDjOCL1zLLn kzmypFBXHmGVtMCLOtfb1A1Qu5uFRerSNZMxTpIhVpetUeUUevhQt8dmBEBniG0v/8EY9jO0WPC8Kd DABDiYLt1fu4f7cllawW0yhrzuFJ4DbTKkOazjvLsplkNrb4e6HlB6d17MfZKx0oro+EkL3tLDgpxU KdqWnQgkxqSndYc6H5BT5p7yCPBYUeJB98uaMy8VvpDjnB6NPUT67QlqWrKFq9dTDGC+li8BDdRo7i kqRqYinpPhqPYvLoBGuQx5idzWaO4t
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

If the teardown callback failed in the gpio driver, it fails to free the
irq (if there is one). The device is removed anyhow. If later on the irq
triggers, all sorts of unpleasant things might happen (e.g. accessing
the struct adp5588_gpio which is already freed in the meantime or starting
i2c bus transfers for an unregistered device). Even before irq support was
added to this driver, exiting early was wrong; back then it failed to
unregister the gpiochip.

Fortunately these callbacks aren't used any more since at least blackfin
was removed in 2018. So just drop them.

Note that they are not removed from struct adp5588_gpio_platform_data
because the keyboard driver adp5588-keys.c also makes use of them.
(I didn't check if the callbacks might have been called twice, maybe there
is another reason hidden to better not call these functions.)

This patch is a preparation for making i2c remove callbacks return void.

Fixes: 80884094e344 ("gpio: adp5588-gpio: new driver for ADP5588 GPIO expanders")
Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpio/gpio-adp5588.c | 19 -------------------
 1 file changed, 19 deletions(-)

diff --git a/drivers/gpio/gpio-adp5588.c b/drivers/gpio/gpio-adp5588.c
index f1e4ac90e7d3..e388e75103f4 100644
--- a/drivers/gpio/gpio-adp5588.c
+++ b/drivers/gpio/gpio-adp5588.c
@@ -406,12 +406,6 @@ static int adp5588_gpio_probe(struct i2c_client *client)
 	if (ret)
 		return ret;
 
-	if (pdata && pdata->setup) {
-		ret = pdata->setup(client, gc->base, gc->ngpio, pdata->context);
-		if (ret < 0)
-			dev_warn(&client->dev, "setup failed, %d\n", ret);
-	}
-
 	i2c_set_clientdata(client, dev);
 
 	return 0;
@@ -419,20 +413,7 @@ static int adp5588_gpio_probe(struct i2c_client *client)
 
 static int adp5588_gpio_remove(struct i2c_client *client)
 {
-	struct adp5588_gpio_platform_data *pdata =
-			dev_get_platdata(&client->dev);
 	struct adp5588_gpio *dev = i2c_get_clientdata(client);
-	int ret;
-
-	if (pdata && pdata->teardown) {
-		ret = pdata->teardown(client,
-				      dev->gpio_chip.base, dev->gpio_chip.ngpio,
-				      pdata->context);
-		if (ret < 0) {
-			dev_err(&client->dev, "teardown failed %d\n", ret);
-			return ret;
-		}
-	}
 
 	if (dev->client->irq)
 		free_irq(dev->client->irq, dev);

base-commit: 4b0986a3613c92f4ec1bdc7f60ec66fea135991f
-- 
2.35.1

