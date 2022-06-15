Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F10D054C91A
	for <lists+linux-gpio@lfdr.de>; Wed, 15 Jun 2022 14:51:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349080AbiFOMva (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 15 Jun 2022 08:51:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349205AbiFOMvD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 15 Jun 2022 08:51:03 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48BF2544FF
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jun 2022 05:50:18 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1o1STP-0004bU-F8; Wed, 15 Jun 2022 14:50:15 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o1STM-000gVd-2V; Wed, 15 Jun 2022 14:50:13 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o1STM-00GRz1-MY; Wed, 15 Jun 2022 14:50:12 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de
Subject: [PATCH] gpio: xgs-iproc: Drop if with an always false condition
Date:   Wed, 15 Jun 2022 14:47:18 +0200
Message-Id: <20220615124718.304719-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1193; h=from:subject; bh=cXPUkWfUt5G/YEia8MfBpcA1qhyBd8OYdGaeGNtISaQ=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiqdTSR0vpzL4t+QAsqkXD9WNwV1ZsZ7yQobdPxIyw HfyLm5+JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYqnU0gAKCRDB/BR4rcrsCWIqB/ sF14a9WBHyu0WRdELIZI655hlKnaVZ0JAQBeWEyf69ETCmOhk5+kqKJ4n2rkqNeTCbyJEjTqozsX3E wC4sm8gFXOLF4akqpgAnNaWHXkFyqkVDscE8ROZjKSktrIu6qVOujA5g5Y9EsyeNleE4WkgxRNpRDr t6biGsLzVBM/0HGy0az/+cU5n272cN2tpghHH3JfASI6WHgf4bDo6mYv2Od0Tz2qGw6nWwlYETB/xt StxjV6W7vVknkk7j9QFXdm3dvyOYyPiDScC03ClPaD01efotuTCWSkN3vhCHjPl3CIhe1kFIFpomlW 6sFx0nHW5Oy6d4URAMsmKl/eGFXrH1
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

The remove callback is only called after probe completed successfully.
In this case platform_set_drvdata() was called with a non-NULL argument
and so chip is never NULL.

Also note that returning an error code from a remove callback doesn't
result in the device staying bound. It's still removed and devm
callbacks are called.

This is a preparation for making platform remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpio/gpio-xgs-iproc.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-xgs-iproc.c b/drivers/gpio/gpio-xgs-iproc.c
index 43ca52fa6f9a..fd88500399c6 100644
--- a/drivers/gpio/gpio-xgs-iproc.c
+++ b/drivers/gpio/gpio-xgs-iproc.c
@@ -281,11 +281,7 @@ static int iproc_gpio_probe(struct platform_device *pdev)
 
 static int iproc_gpio_remove(struct platform_device *pdev)
 {
-	struct iproc_gpio_chip *chip;
-
-	chip = platform_get_drvdata(pdev);
-	if (!chip)
-		return -ENODEV;
+	struct iproc_gpio_chip *chip = platform_get_drvdata(pdev);
 
 	if (chip->intr) {
 		u32 val;

base-commit: f2906aa863381afb0015a9eb7fefad885d4e5a56
-- 
2.36.1

