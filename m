Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2625154B496
	for <lists+linux-gpio@lfdr.de>; Tue, 14 Jun 2022 17:27:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234073AbiFNPX4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 14 Jun 2022 11:23:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344407AbiFNPXz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 14 Jun 2022 11:23:55 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3312122285
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jun 2022 08:23:54 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1o18OU-00062t-PO; Tue, 14 Jun 2022 17:23:50 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o18OS-000Vyh-It; Tue, 14 Jun 2022 17:23:49 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1o18OT-00GGin-9G; Tue, 14 Jun 2022 17:23:49 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Lee Jones <lee.jones@linaro.org>
Cc:     linux-gpio@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH 2/2] gpio: twl4030: Don't return an error after WARN in .remove
Date:   Tue, 14 Jun 2022 17:23:39 +0200
Message-Id: <20220614152339.252958-2-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220614152339.252958-1-u.kleine-koenig@pengutronix.de>
References: <20220614152339.252958-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1180; h=from:subject; bh=Uj1wtaSVDQPjq14U06dQPKVu/V1FWNUH5y/QuBfzras=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiqKf3IUdiTo3LtM56wWOEM/VYS3bk6Ltry9VIcvv7 SM880cqJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYqin9wAKCRDB/BR4rcrsCRtDB/ 9XjkKGT46xwDfzeHA9jSPvlEockbSAHQGgiuxl0PbhXXcK+rRKZZ+d7UWSaK9BEDAMnN5GXSncm1im arhJ3c9VCw5laYfBpUoPFvBrBkx4o8aEhRIiCGCGjViaX/Tmew8GiObTSGCqA2yeeH31mvIEmGmLnK /MXs7iIctpMl1yJNyfVRSzao2YnBtZQFr1WyyCmtzCTW0WT6ybcPI1dXKBfLrevcZTUfwr6CIbqFKN dz/krL5NPqVFkPBwgkHcCwp9RwnmFm0jcpsSIpN5ecTea79N5pJ66CI4Y47lxuTwcbj38bQMqaz981 yTXUq8ZJwMLp0UXdexjDw5RIH1N5wH
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

Returning a non-zero value in a platform driver's remove callback only
results in an error message ("remove callback returned a non-zero value.
This will be ignored.", see platform_remove()), and then the device is
removed anyhow.

As there was just a WARN_ON triggered, return 0 to drop the follow up
warning. The latter output is hardly relevant after the big WARN splat.

This is a preparation for making platform remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/gpio/gpio-twl4030.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpio-twl4030.c b/drivers/gpio/gpio-twl4030.c
index e2cb7cb90c8c..5046e51af8df 100644
--- a/drivers/gpio/gpio-twl4030.c
+++ b/drivers/gpio/gpio-twl4030.c
@@ -597,12 +597,9 @@ static int gpio_twl4030_remove(struct platform_device *pdev)
 
 	gpiochip_remove(&priv->gpio_chip);
 
-	if (is_module())
-		return 0;
-
 	/* REVISIT no support yet for deregistering all the IRQs */
-	WARN_ON(1);
-	return -EIO;
+	WARN_ON(!is_module());
+	return 0;
 }
 
 static const struct of_device_id twl_gpio_match[] = {
-- 
2.36.1

