Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF12C50E75D
	for <lists+linux-gpio@lfdr.de>; Mon, 25 Apr 2022 19:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240787AbiDYRgL (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 25 Apr 2022 13:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237180AbiDYRgK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 Apr 2022 13:36:10 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C91B167D0F
        for <linux-gpio@vger.kernel.org>; Mon, 25 Apr 2022 10:33:05 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1nj2a7-0000uo-Ac; Mon, 25 Apr 2022 19:33:03 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nj2a7-005BpT-2o; Mon, 25 Apr 2022 19:33:01 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1nj2a5-005ZSY-1h; Mon, 25 Apr 2022 19:33:01 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-gpio@vger.kernel.org, kernel@pengutronix.de,
        linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] gpio: pcf857x: Make teardown callback return void
Date:   Mon, 25 Apr 2022 19:32:55 +0200
Message-Id: <20220425173255.56216-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=5238; h=from:subject; bh=WNoEabw7TVMpWlIG7P1ldtyDKDqHeX1GmQ2Qck/uJ3g=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiZtrs4dZrPnA3wdPxqWDRTMG9uNA8dWSUgdx/aPno y/8mkXGJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYmba7AAKCRDB/BR4rcrsCcqNB/ 0SFHn33TGj+QbtJlc3drfCSecwtAixT/vyW40BPT8lkyK883FTjPwh/GHFKPFksfgO0CTj4LsERPIp AMssWRi0pbjgVXE+LNXXKdovnLLeUbEo3u2CHDpmHKSrTZyDOrKf6bdGIoxJ7VVi87Dup4jx2Sh7Kh J97gCvLJLKxRFeLchHp9zFI8yphbXoJYoe5OBpTZ5Qrwvf6OWQ5j8cVCoag7tZzseXnbDy9yz8QmKi /W1Gc2iO5PRBnsG2wOmeeighUwonkzy7DXV2sML9AKspL7fF3aTYrf3ruKPGtD4NJqueQwlIzcORe+ W+o8xgW1ZYMv0U+VxwR9nGFGObHNFv
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

All teardown functions return 0. Also there is little sense in returning
a negative error code from an i2c remove function as this only results in
emitting an error message but the device is removed nevertheless.

This patch is a preparation for making i2c remove callbacks return void.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Changes since (implicit) v1:

 - make it actually compile, thanks to the kernel test robot for
   pointing that out.

 arch/arm/mach-davinci/board-da830-evm.c  |  3 +--
 arch/arm/mach-davinci/board-dm644x-evm.c |  9 +++------
 arch/arm/mach-davinci/board-dm646x-evm.c |  4 +---
 drivers/gpio/gpio-pcf857x.c              | 14 +++-----------
 include/linux/platform_data/pcf857x.h    |  2 +-
 5 files changed, 9 insertions(+), 23 deletions(-)

diff --git a/arch/arm/mach-davinci/board-da830-evm.c b/arch/arm/mach-davinci/board-da830-evm.c
index 823c9cc98f18..52a452eff01c 100644
--- a/arch/arm/mach-davinci/board-da830-evm.c
+++ b/arch/arm/mach-davinci/board-da830-evm.c
@@ -473,11 +473,10 @@ static int __init da830_evm_ui_expander_setup(struct i2c_client *client,
 	return 0;
 }
 
-static int da830_evm_ui_expander_teardown(struct i2c_client *client, int gpio,
+static void da830_evm_ui_expander_teardown(struct i2c_client *client, int gpio,
 		unsigned ngpio, void *context)
 {
 	gpio_free(gpio + 6);
-	return 0;
 }
 
 static struct pcf857x_platform_data __initdata da830_evm_ui_expander_info = {
diff --git a/arch/arm/mach-davinci/board-dm644x-evm.c b/arch/arm/mach-davinci/board-dm644x-evm.c
index cce3a621eb20..b69fc17d6a8c 100644
--- a/arch/arm/mach-davinci/board-dm644x-evm.c
+++ b/arch/arm/mach-davinci/board-dm644x-evm.c
@@ -366,14 +366,13 @@ evm_led_setup(struct i2c_client *client, int gpio, unsigned ngpio, void *c)
 	return status;
 }
 
-static int
+static void
 evm_led_teardown(struct i2c_client *client, int gpio, unsigned ngpio, void *c)
 {
 	if (evm_led_dev) {
 		platform_device_unregister(evm_led_dev);
 		evm_led_dev = NULL;
 	}
-	return 0;
 }
 
 static struct pcf857x_platform_data pcf_data_u2 = {
@@ -428,7 +427,7 @@ evm_u18_setup(struct i2c_client *client, int gpio, unsigned ngpio, void *c)
 	return 0;
 }
 
-static int
+static void
 evm_u18_teardown(struct i2c_client *client, int gpio, unsigned ngpio, void *c)
 {
 	gpio_free(gpio + 1);
@@ -439,7 +438,6 @@ evm_u18_teardown(struct i2c_client *client, int gpio, unsigned ngpio, void *c)
 		device_remove_file(&client->dev, &dev_attr_user_sw);
 		gpio_free(sw_gpio);
 	}
-	return 0;
 }
 
 static struct pcf857x_platform_data pcf_data_u18 = {
@@ -488,7 +486,7 @@ evm_u35_setup(struct i2c_client *client, int gpio, unsigned ngpio, void *c)
 	return 0;
 }
 
-static int
+static void
 evm_u35_teardown(struct i2c_client *client, int gpio, unsigned ngpio, void *c)
 {
 	gpio_free(gpio + 7);
@@ -498,7 +496,6 @@ evm_u35_teardown(struct i2c_client *client, int gpio, unsigned ngpio, void *c)
 	gpio_free(gpio + 2);
 	gpio_free(gpio + 1);
 	gpio_free(gpio + 0);
-	return 0;
 }
 
 static struct pcf857x_platform_data pcf_data_u35 = {
diff --git a/arch/arm/mach-davinci/board-dm646x-evm.c b/arch/arm/mach-davinci/board-dm646x-evm.c
index ee91d81ebbfd..625d2d626147 100644
--- a/arch/arm/mach-davinci/board-dm646x-evm.c
+++ b/arch/arm/mach-davinci/board-dm646x-evm.c
@@ -315,15 +315,13 @@ static int evm_pcf_setup(struct i2c_client *client, int gpio,
 	return evm_led_setup(client, gpio+4, 4, c);
 }
 
-static int evm_pcf_teardown(struct i2c_client *client, int gpio,
+static void evm_pcf_teardown(struct i2c_client *client, int gpio,
 			unsigned int ngpio, void *c)
 {
 	BUG_ON(ngpio < 8);
 
 	evm_sw_teardown(client, gpio, 4, c);
 	evm_led_teardown(client, gpio+4, 4, c);
-
-	return 0;
 }
 
 static struct pcf857x_platform_data pcf_data = {
diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index b7568ee33696..e3a53dd5df1e 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -396,20 +396,12 @@ static int pcf857x_remove(struct i2c_client *client)
 {
 	struct pcf857x_platform_data	*pdata = dev_get_platdata(&client->dev);
 	struct pcf857x			*gpio = i2c_get_clientdata(client);
-	int				status = 0;
 
-	if (pdata && pdata->teardown) {
-		status = pdata->teardown(client,
-				gpio->chip.base, gpio->chip.ngpio,
+	if (pdata && pdata->teardown)
+		pdata->teardown(client, gpio->chip.base, gpio->chip.ngpio,
 				pdata->context);
-		if (status < 0) {
-			dev_err(&client->dev, "%s --> %d\n",
-					"teardown", status);
-			return status;
-		}
-	}
 
-	return status;
+	return 0;
 }
 
 static void pcf857x_shutdown(struct i2c_client *client)
diff --git a/include/linux/platform_data/pcf857x.h b/include/linux/platform_data/pcf857x.h
index 11d4ed78c7f4..01d0a3ea3aef 100644
--- a/include/linux/platform_data/pcf857x.h
+++ b/include/linux/platform_data/pcf857x.h
@@ -36,7 +36,7 @@ struct pcf857x_platform_data {
 	int		(*setup)(struct i2c_client *client,
 					int gpio, unsigned ngpio,
 					void *context);
-	int		(*teardown)(struct i2c_client *client,
+	void		(*teardown)(struct i2c_client *client,
 					int gpio, unsigned ngpio,
 					void *context);
 	void		*context;

base-commit: 3123109284176b1532874591f7c81f3837bbdc17
-- 
2.35.1

