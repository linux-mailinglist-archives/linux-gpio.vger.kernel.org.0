Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD363781AB5
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Aug 2023 19:37:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbjHSRh5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 19 Aug 2023 13:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229721AbjHSRh4 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 19 Aug 2023 13:37:56 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id A8FB4A6;
        Sat, 19 Aug 2023 10:37:54 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,187,1684767600"; 
   d="scan'208";a="177043578"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 20 Aug 2023 02:37:53 +0900
Received: from localhost.localdomain (unknown [10.226.92.22])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 9986C4039AEA;
        Sun, 20 Aug 2023 02:37:50 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] gpio: pca953x: Use i2c_get_match_data()
Date:   Sat, 19 Aug 2023 18:37:47 +0100
Message-Id: <20230819173747.8682-1-biju.das.jz@bp.renesas.com>
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
Note:
 This patch is only compile tested.
---
 drivers/gpio/gpio-pca953x.c | 17 ++++-------------
 1 file changed, 4 insertions(+), 13 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index a806a3c1b801..1ef6cf182e64 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -1051,7 +1051,6 @@ static int device_pca957x_init(struct pca953x_chip *chip, u32 invert)
 
 static int pca953x_probe(struct i2c_client *client)
 {
-	const struct i2c_device_id *i2c_id = i2c_client_get_device_id(client);
 	struct pca953x_platform_data *pdata;
 	struct pca953x_chip *chip;
 	int irq_base = 0;
@@ -1102,18 +1101,10 @@ static int pca953x_probe(struct i2c_client *client)
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
+	chip->driver_data = (uintptr_t)i2c_get_match_data(client);
+	if (!chip->driver_data) {
+		ret = -ENODEV;
+		goto err_exit;
 	}
 
 	i2c_set_clientdata(client, chip);
-- 
2.25.1

