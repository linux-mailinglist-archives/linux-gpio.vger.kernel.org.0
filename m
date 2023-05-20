Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ABAA70A987
	for <lists+linux-gpio@lfdr.de>; Sat, 20 May 2023 19:47:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229525AbjETRrq (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 20 May 2023 13:47:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjETRrp (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 20 May 2023 13:47:45 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9F06FE
        for <linux-gpio@vger.kernel.org>; Sat, 20 May 2023 10:47:43 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q0Qg9-0001Zh-IP; Sat, 20 May 2023 19:47:41 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q0Qg8-001acu-81; Sat, 20 May 2023 19:47:40 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q0Qg7-006LLy-Aj; Sat, 20 May 2023 19:47:39 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     linux-gpio@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] gpio: Switch i2c drivers back to use .probe()
Date:   Sat, 20 May 2023 19:47:35 +0200
Message-Id: <20230520174735.364367-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5859; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=dzACVsxqJyk9DWmkM9yf6eo3eg0KArOn5Yi3lcjRGas=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkaQezo1l5oUbhUOi80UjxyHoAgNKzZ3QNmpQ9S TG1R0BCy0iJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZGkHswAKCRCPgPtYfRL+ The5B/9O1K7jNlbpGEuobfR5HJzuNZQ2hTnBg/gBoSMoZ79aOFSM6FbH52iBX9o3N7ywMtDlWrV O4FeHVA+UqJe0qazy5DDu5dzLHcAh4m2/8XXwnkXwLMcMhkWNRaUXo131LEHuMJv5aT82Y4N9fE ZnSP8INoVIXsyvhRSMyl3axb863Ps3wHc1P/NIBvniACZl5z3ZZRESAKOwHW/nu9fB/UVFOXa/T haWhvc6A5d36JUK3alBFZcf8LJKcvmTnc4hMgilV2tEY9lAGnOf7bf+Lnv+OMRv4R6wCoFfoKHN B1volTwEsg8usvw8lM8dLxpq4+puvo8TlmBmnwhhoZ59lZ0w
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

After commit b8a1a4cd5a98 ("i2c: Provide a temporary .probe_new()
call-back type"), all drivers being converted to .probe_new() and then
03c835f498b5 ("i2c: Switch .probe() to not take an id parameter") convert
back to (the new) .probe() to be able to eventually drop .probe_new() from
struct i2c_driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

this patch was generated using coccinelle, but I aligned the result to
the per-file indention.

This is one patch for the whole gpio subsystem. if you want it split per
driver (or directory?) for improved patch count numbers, please tell me.

I based this on top of the gpio branch that was merged into next. If you
apply it somewhere else and get conflicts, feel free to just drop the
files with conflicts from this patch and apply anyhow. I'll care about
the fallout later then.

Best regards
Uwe

 drivers/gpio/gpio-adnp.c     | 2 +-
 drivers/gpio/gpio-fxl6408.c  | 2 +-
 drivers/gpio/gpio-gw-pld.c   | 2 +-
 drivers/gpio/gpio-max7300.c  | 2 +-
 drivers/gpio/gpio-max732x.c  | 2 +-
 drivers/gpio/gpio-pca953x.c  | 2 +-
 drivers/gpio/gpio-pca9570.c  | 2 +-
 drivers/gpio/gpio-pcf857x.c  | 2 +-
 drivers/gpio/gpio-tpic2810.c | 2 +-
 drivers/gpio/gpio-ts4900.c   | 2 +-
 10 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpio/gpio-adnp.c b/drivers/gpio/gpio-adnp.c
index 9b01c391efce..6dafab0cf964 100644
--- a/drivers/gpio/gpio-adnp.c
+++ b/drivers/gpio/gpio-adnp.c
@@ -535,7 +535,7 @@ static struct i2c_driver adnp_i2c_driver = {
 		.name = "gpio-adnp",
 		.of_match_table = adnp_of_match,
 	},
-	.probe_new = adnp_i2c_probe,
+	.probe = adnp_i2c_probe,
 	.id_table = adnp_i2c_id,
 };
 module_i2c_driver(adnp_i2c_driver);
diff --git a/drivers/gpio/gpio-fxl6408.c b/drivers/gpio/gpio-fxl6408.c
index 208fa851e82a..c14b5cc5e519 100644
--- a/drivers/gpio/gpio-fxl6408.c
+++ b/drivers/gpio/gpio-fxl6408.c
@@ -148,7 +148,7 @@ static struct i2c_driver fxl6408_driver = {
 		.name	= "fxl6408",
 		.of_match_table = fxl6408_dt_ids,
 	},
-	.probe_new	= fxl6408_probe,
+	.probe		= fxl6408_probe,
 	.id_table	= fxl6408_id,
 };
 module_i2c_driver(fxl6408_driver);
diff --git a/drivers/gpio/gpio-gw-pld.c b/drivers/gpio/gpio-gw-pld.c
index 5057fa9ad610..899335da93c7 100644
--- a/drivers/gpio/gpio-gw-pld.c
+++ b/drivers/gpio/gpio-gw-pld.c
@@ -125,7 +125,7 @@ static struct i2c_driver gw_pld_driver = {
 		.name = "gw_pld",
 		.of_match_table = gw_pld_dt_ids,
 	},
-	.probe_new = gw_pld_probe,
+	.probe = gw_pld_probe,
 	.id_table = gw_pld_id,
 };
 module_i2c_driver(gw_pld_driver);
diff --git a/drivers/gpio/gpio-max7300.c b/drivers/gpio/gpio-max7300.c
index cf482f4f0098..31c2b95321cc 100644
--- a/drivers/gpio/gpio-max7300.c
+++ b/drivers/gpio/gpio-max7300.c
@@ -62,7 +62,7 @@ static struct i2c_driver max7300_driver = {
 	.driver = {
 		.name = "max7300",
 	},
-	.probe_new = max7300_probe,
+	.probe = max7300_probe,
 	.remove = max7300_remove,
 	.id_table = max7300_id,
 };
diff --git a/drivers/gpio/gpio-max732x.c b/drivers/gpio/gpio-max732x.c
index 7f2fde191755..fca9ca68e387 100644
--- a/drivers/gpio/gpio-max732x.c
+++ b/drivers/gpio/gpio-max732x.c
@@ -711,7 +711,7 @@ static struct i2c_driver max732x_driver = {
 		.name		= "max732x",
 		.of_match_table	= of_match_ptr(max732x_of_table),
 	},
-	.probe_new	= max732x_probe,
+	.probe		= max732x_probe,
 	.id_table	= max732x_id,
 };
 
diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 1286b22ef23a..a806a3c1b801 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -1375,7 +1375,7 @@ static struct i2c_driver pca953x_driver = {
 		.of_match_table = pca953x_dt_ids,
 		.acpi_match_table = pca953x_acpi_ids,
 	},
-	.probe_new	= pca953x_probe,
+	.probe		= pca953x_probe,
 	.remove		= pca953x_remove,
 	.id_table	= pca953x_id,
 };
diff --git a/drivers/gpio/gpio-pca9570.c b/drivers/gpio/gpio-pca9570.c
index 6a5a8e593ed5..d8db80ef1293 100644
--- a/drivers/gpio/gpio-pca9570.c
+++ b/drivers/gpio/gpio-pca9570.c
@@ -175,7 +175,7 @@ static struct i2c_driver pca9570_driver = {
 		.name = "pca9570",
 		.of_match_table = pca9570_of_match_table,
 	},
-	.probe_new = pca9570_probe,
+	.probe = pca9570_probe,
 	.id_table = pca9570_id_table,
 };
 module_i2c_driver(pca9570_driver);
diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index 3de1d3ad7472..c4c785548408 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -419,7 +419,7 @@ static struct i2c_driver pcf857x_driver = {
 		.name	= "pcf857x",
 		.of_match_table = pcf857x_of_table,
 	},
-	.probe_new = pcf857x_probe,
+	.probe = pcf857x_probe,
 	.shutdown = pcf857x_shutdown,
 	.id_table = pcf857x_id,
 };
diff --git a/drivers/gpio/gpio-tpic2810.c b/drivers/gpio/gpio-tpic2810.c
index 642ed82b9de2..effb7b8ff81f 100644
--- a/drivers/gpio/gpio-tpic2810.c
+++ b/drivers/gpio/gpio-tpic2810.c
@@ -127,7 +127,7 @@ static struct i2c_driver tpic2810_driver = {
 		.name = "tpic2810",
 		.of_match_table = tpic2810_of_match_table,
 	},
-	.probe_new = tpic2810_probe,
+	.probe = tpic2810_probe,
 	.id_table = tpic2810_id_table,
 };
 module_i2c_driver(tpic2810_driver);
diff --git a/drivers/gpio/gpio-ts4900.c b/drivers/gpio/gpio-ts4900.c
index 43e8b66e04f7..eba96319dac2 100644
--- a/drivers/gpio/gpio-ts4900.c
+++ b/drivers/gpio/gpio-ts4900.c
@@ -185,7 +185,7 @@ static struct i2c_driver ts4900_gpio_driver = {
 		.name = "ts4900-gpio",
 		.of_match_table = ts4900_gpio_of_match_table,
 	},
-	.probe_new = ts4900_gpio_probe,
+	.probe = ts4900_gpio_probe,
 	.id_table = ts4900_gpio_id_table,
 };
 module_i2c_driver(ts4900_gpio_driver);

base-commit: 2c99754ea0f90ed4a7ab0db9879e57a266b01bfc
-- 
2.39.2

