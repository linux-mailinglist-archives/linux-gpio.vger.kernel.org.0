Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6EBEB54B497
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jun 2022 17:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356310AbiFNPX4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jun 2022 11:23:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234073AbiFNPXz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2022 11:23:55 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A61122281
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jun 2022 08:23:54 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1o18OU-00062k-PO; Tue, 14 Jun 2022 17:23:50 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o18OS-000Vye-BR; Tue, 14 Jun 2022 17:23:49 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o18OT-00GGik-3I; Tue, 14 Jun 2022 17:23:49 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Lee Jones <lee.jones@linaro.org>
Cc:     linux-gpio@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 1/2] gpio: twl4030: Drop platform teardown callback
Date:   Tue, 14 Jun 2022 17:23:38 +0200
Message-Id: <20220614152339.252958-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1660; h=from:subject; bh=+bS8yp4mfSzD3PqmWYCYRkcgqri39Wr/NuGz6vRLUcg=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiqKfy0iGJehq3PEvDsN2xfRk5kpu4eFGK0xx7dp+X jyBariyJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYqin8gAKCRDB/BR4rcrsCQ3lCA CRqr4l/ZcEuuHTbQrIeJVxpHNSWyYN2HxxLcwZ/Ikhda4tcWcbiYvLh5nhKJmQBmma1krotqIuiKRM aqoei2nSgWNi5N1Eq2ZjivVd2sXXuaadVFgY2+c5dIqs4DGf4Knr+xydB3VhOCwAyuN/TLXNdMkIm0 cNo6sNo1k8Q82jJhG/Ig7YqdU8L5tLdHlEDY5j/W3ljYYHf/XWJK07FmRn6jN4pMk4qzp+5OBpS4oI 86BXOfcJk4Y0+SBXyMR61Mso05Hjip93h7+TI+v5pElzjVi3PoeeHk5NBEkjlSfMAsay7h97ytH+K4 1Q9MJWbFv1djXCyiXw4rYkXWc+jNqF
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

There is no machine providing a teardown callback, so drop the unused
code.

This is a preparation for making platform remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpio/gpio-twl4030.c | 11 -----------
 include/linux/mfd/twl.h     |  2 --
 2 files changed, 13 deletions(-)

diff --git a/drivers/gpio/gpio-twl4030.c b/drivers/gpio/gpio-twl4030.c
index de249726230e..e2cb7cb90c8c 100644
--- a/drivers/gpio/gpio-twl4030.c
+++ b/drivers/gpio/gpio-twl4030.c
@@ -593,18 +593,7 @@ static int gpio_twl4030_probe(struct platform_device *pdev)
 /* Cannot use as gpio_twl4030_probe() calls us */
 static int gpio_twl4030_remove(struct platform_device *pdev)
 {
-	struct twl4030_gpio_platform_data *pdata = dev_get_platdata(&pdev->dev);
 	struct gpio_twl4030_priv *priv = platform_get_drvdata(pdev);
-	int status;
-
-	if (pdata && pdata->teardown) {
-		status = pdata->teardown(&pdev->dev, priv->gpio_chip.base,
-					 TWL4030_GPIO_MAX);
-		if (status) {
-			dev_dbg(&pdev->dev, "teardown --> %d\n", status);
-			return status;
-		}
-	}
 
 	gpiochip_remove(&priv->gpio_chip);
 
diff --git a/include/linux/mfd/twl.h b/include/linux/mfd/twl.h
index 8871cc5188a0..c8cd31756037 100644
--- a/include/linux/mfd/twl.h
+++ b/include/linux/mfd/twl.h
@@ -594,8 +594,6 @@ struct twl4030_gpio_platform_data {
 
 	int		(*setup)(struct device *dev,
 				unsigned gpio, unsigned ngpio);
-	int		(*teardown)(struct device *dev,
-				unsigned gpio, unsigned ngpio);
 };
 
 struct twl4030_madc_platform_data {

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
2.36.1

