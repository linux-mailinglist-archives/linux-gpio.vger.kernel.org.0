Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73E55711855
	for <lists+linux-gpio@lfdr.de>; Thu, 25 May 2023 22:43:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232918AbjEYUn0 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 25 May 2023 16:43:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230389AbjEYUnZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 25 May 2023 16:43:25 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72BD4E47
        for <linux-gpio@vger.kernel.org>; Thu, 25 May 2023 13:43:08 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1q2Hna-0006Y4-BC; Thu, 25 May 2023 22:43:02 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q2HnZ-002nnx-5c; Thu, 25 May 2023 22:43:01 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <ukl@pengutronix.de>)
        id 1q2HnY-007xYr-69; Thu, 25 May 2023 22:43:00 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Patrick Rudolph <patrick.rudolph@9elements.com>,
        linux-gpio@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH] pinctrl: Switch i2c drivers back to use .probe()
Date:   Thu, 25 May 2023 22:42:58 +0200
Message-Id: <20230525204258.711186-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2068; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=kP0P10GihJGbT9lwPUfnf9oTyHbqCx3+hfoB0X9UgPY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkb8hPoGbLZ02dezUE5FqhAH9pIHjYIqixRfut2 7EfJM/ie56JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZG/ITwAKCRCPgPtYfRL+ ThpGB/9O9Tz50ouPOLLKDCdMS7DMEWNpYjtzEa06CdmcZXjpkNUUip2+eChznTSe+ZGGaeWrzOP gYBwt5uiOpzdJJeegX8ryFsHxL9xwTKHLzUG747sFiEcVn+JjdeN5BHdR0wobeJi+/J+TFN5i7J /snWws0xGjlEk2BwIq0pBmOUAGY1d0fp5z0GLTPQ3dBqjsApafB8+JFiuxa0yFV7zxuszZhs83T PTFLnFSVL8kbEiyTb7Ne8qYbn0unOTplVCr6NCNFdHpOOsSZdYNflWbP8JFnZHeWdEXem7Leqov DtyMEhCWvKAK6+yjKWvdsaGfI1pAeVijlA1DRRQ9C2QISEd+
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
03c835f498b5 ("i2c: Switch .probe() to not take an id parameter")
convert back to (the new) .probe() to be able to eventually drop
.probe_new() from struct i2c_driver.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
 drivers/pinctrl/pinctrl-cy8c95x0.c     | 2 +-
 drivers/pinctrl/pinctrl-mcp23s08_i2c.c | 2 +-
 drivers/pinctrl/pinctrl-sx150x.c       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-cy8c95x0.c b/drivers/pinctrl/pinctrl-cy8c95x0.c
index 564fbaabcdb8..2ecc96691c55 100644
--- a/drivers/pinctrl/pinctrl-cy8c95x0.c
+++ b/drivers/pinctrl/pinctrl-cy8c95x0.c
@@ -1442,7 +1442,7 @@ static struct i2c_driver cy8c95x0_driver = {
 		.of_match_table = cy8c95x0_dt_ids,
 		.acpi_match_table = cy8c95x0_acpi_ids,
 	},
-	.probe_new	= cy8c95x0_probe,
+	.probe		= cy8c95x0_probe,
 	.remove		= cy8c95x0_remove,
 	.id_table	= cy8c95x0_id,
 	.detect		= cy8c95x0_detect,
diff --git a/drivers/pinctrl/pinctrl-mcp23s08_i2c.c b/drivers/pinctrl/pinctrl-mcp23s08_i2c.c
index b635c5737e0c..3dd1bd8e73eb 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08_i2c.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08_i2c.c
@@ -101,7 +101,7 @@ static struct i2c_driver mcp230xx_driver = {
 		.name	= "mcp230xx",
 		.of_match_table = mcp23s08_i2c_of_match,
 	},
-	.probe_new	= mcp230xx_probe,
+	.probe		= mcp230xx_probe,
 	.id_table	= mcp230xx_id,
 };
 
diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index 7632ffc3946f..35faea8dfb0b 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -1262,7 +1262,7 @@ static struct i2c_driver sx150x_driver = {
 		.name = "sx150x-pinctrl",
 		.of_match_table = sx150x_of_match,
 	},
-	.probe_new = sx150x_probe,
+	.probe = sx150x_probe,
 	.id_table = sx150x_id,
 };
 

base-commit: ac9a78681b921877518763ba0e89202254349d1b
-- 
2.39.2

