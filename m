Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 35ADA7874C7
	for <lists+linux-gpio@lfdr.de>; Thu, 24 Aug 2023 18:01:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242316AbjHXQAi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 24 Aug 2023 12:00:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242420AbjHXQA1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 24 Aug 2023 12:00:27 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id C027C19A8;
        Thu, 24 Aug 2023 09:00:22 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.02,195,1688396400"; 
   d="scan'208";a="173854092"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 25 Aug 2023 01:00:21 +0900
Received: from localhost.localdomain (unknown [10.226.93.115])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 51F5540071E7;
        Fri, 25 Aug 2023 01:00:19 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2] gpio: pca953x: Use i2c_get_match_data()
Date:   Thu, 24 Aug 2023 17:00:17 +0100
Message-Id: <20230824160017.368517-1-biju.das.jz@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.1 required=5.0 tests=AC_FROM_MANY_DOTS,BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Replace device_get_match_data() and id lookup for retrieving match data
by i2c_get_match_data().

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
v1->v2:
 * Moved i2c_get_match_data() to be called before devm_regulator_get() as
   it doesn't require regulator to be enabled for functioning.
---
 drivers/gpio/gpio-pca953x.c | 18 +++---------------
 1 file changed, 3 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index a806a3c1b801..929a2d075fe4 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -1051,7 +1051,6 @@ static int device_pca957x_init(struct pca953x_chip *chip, u32 invert)
 
 static int pca953x_probe(struct i2c_client *client)
 {
-	const struct i2c_device_id *i2c_id = i2c_client_get_device_id(client);
 	struct pca953x_platform_data *pdata;
 	struct pca953x_chip *chip;
 	int irq_base = 0;
@@ -1090,6 +1089,9 @@ static int pca953x_probe(struct i2c_client *client)
 	}
 
 	chip->client = client;
+	chip->driver_data = (uintptr_t)i2c_get_match_data(client);
+	if (!chip->driver_data)
+		return -ENODEV;
 
 	reg = devm_regulator_get(&client->dev, "vcc");
 	if (IS_ERR(reg))
@@ -1102,20 +1104,6 @@ static int pca953x_probe(struct i2c_client *client)
 	}
 	chip->regulator = reg;
 
-	if (i2c_id) {
-		chip->driver_data = i2c_id->driver_data;
-	} else {
-		const void *match;
-
-		match = device_get_match_data(&client->dev);
-		if (!match) {
-			ret = -ENODEV;
-			goto err_exit;
-		}
-
-		chip->driver_data = (uintptr_t)match;
-	}
-
 	i2c_set_clientdata(client, chip);
 
 	pca953x_setup_gpio(chip, chip->driver_data & PCA_GPIO_MASK);
-- 
2.25.1

