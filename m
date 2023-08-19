Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 970AF781ABD
	for <lists+linux-gpio@lfdr.de>; Sat, 19 Aug 2023 20:04:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbjHSSEw (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 19 Aug 2023 14:04:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229463AbjHSSEw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 19 Aug 2023 14:04:52 -0400
Received: from relmlie6.idc.renesas.com (relmlor2.renesas.com [210.160.252.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 1781A81830;
        Sat, 19 Aug 2023 11:04:49 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="6.01,187,1684767600"; 
   d="scan'208";a="177044449"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 20 Aug 2023 03:04:49 +0900
Received: from localhost.localdomain (unknown [10.226.92.22])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id B5B21404585F;
        Sun, 20 Aug 2023 03:04:46 +0900 (JST)
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Biju Das <biju.das.jz@bp.renesas.com>,
        Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: [PATCH] gpio: pcf857x: Extend match data support for OF tables
Date:   Sat, 19 Aug 2023 19:04:43 +0100
Message-Id: <20230819180443.16718-1-biju.das.jz@bp.renesas.com>
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

The driver has OF match table, but still it uses an ID lookup table for
retrieving match data. Currently, the driver is working on the
assumption that an I2C device registered via OF will always match a
legacy I2C device ID. Extend match data support for OF tables by using
i2c_get_match_data() instead of the ID lookup for both OF/ID matches by
making similar OF/ID tables.

Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
---
Note:
 This patch is only compile tested.
---
 drivers/gpio/gpio-pcf857x.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/gpio/gpio-pcf857x.c b/drivers/gpio/gpio-pcf857x.c
index c4c785548408..53b69abe6787 100644
--- a/drivers/gpio/gpio-pcf857x.c
+++ b/drivers/gpio/gpio-pcf857x.c
@@ -36,19 +36,19 @@ static const struct i2c_device_id pcf857x_id[] = {
 MODULE_DEVICE_TABLE(i2c, pcf857x_id);
 
 static const struct of_device_id pcf857x_of_table[] = {
-	{ .compatible = "nxp,pcf8574" },
-	{ .compatible = "nxp,pcf8574a" },
-	{ .compatible = "nxp,pca8574" },
-	{ .compatible = "nxp,pca9670" },
-	{ .compatible = "nxp,pca9672" },
-	{ .compatible = "nxp,pca9674" },
-	{ .compatible = "nxp,pcf8575" },
-	{ .compatible = "nxp,pca8575" },
-	{ .compatible = "nxp,pca9671" },
-	{ .compatible = "nxp,pca9673" },
-	{ .compatible = "nxp,pca9675" },
-	{ .compatible = "maxim,max7328" },
-	{ .compatible = "maxim,max7329" },
+	{ .compatible = "nxp,pcf8574", (void *)8 },
+	{ .compatible = "nxp,pcf8574a", (void *)8 },
+	{ .compatible = "nxp,pca8574", (void *)8 },
+	{ .compatible = "nxp,pca9670", (void *)8 },
+	{ .compatible = "nxp,pca9672", (void *)8 },
+	{ .compatible = "nxp,pca9674", (void *)8 },
+	{ .compatible = "nxp,pcf8575", (void *)16 },
+	{ .compatible = "nxp,pca8575", (void *)16 },
+	{ .compatible = "nxp,pca9671", (void *)16 },
+	{ .compatible = "nxp,pca9673", (void *)16 },
+	{ .compatible = "nxp,pca9675", (void *)16 },
+	{ .compatible = "maxim,max7328", (void *)8 },
+	{ .compatible = "maxim,max7329", (void *)8 },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, pcf857x_of_table);
@@ -272,7 +272,6 @@ static const struct irq_chip pcf857x_irq_chip = {
 
 static int pcf857x_probe(struct i2c_client *client)
 {
-	const struct i2c_device_id *id = i2c_client_get_device_id(client);
 	struct pcf857x *gpio;
 	unsigned int n_latch = 0;
 	int status;
@@ -296,7 +295,7 @@ static int pcf857x_probe(struct i2c_client *client)
 	gpio->chip.set_multiple		= pcf857x_set_multiple;
 	gpio->chip.direction_input	= pcf857x_input;
 	gpio->chip.direction_output	= pcf857x_output;
-	gpio->chip.ngpio		= id->driver_data;
+	gpio->chip.ngpio		= (uintptr_t)i2c_get_match_data(client);
 
 	/* NOTE:  the OnSemi jlc1562b is also largely compatible with
 	 * these parts, notably for output.  It has a low-resolution
-- 
2.25.1

