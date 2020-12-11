Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DD5CD2D74B1
	for <lists+linux-gpio@lfdr.de>; Fri, 11 Dec 2020 12:31:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394530AbgLKL2g (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Fri, 11 Dec 2020 06:28:36 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:22276 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2394422AbgLKL23 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 11 Dec 2020 06:28:29 -0500
X-IronPort-AV: E=Sophos;i="5.78,411,1599490800"; 
   d="scan'208";a="65422229"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 11 Dec 2020 20:27:56 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 8D4E542D7EA2;
        Fri, 11 Dec 2020 20:27:56 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     marek.vasut+renesas@gmail.com, lee.jones@linaro.org,
        matti.vaittinen@fi.rohmeurope.com, lgirdwood@gmail.com,
        broonie@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     khiem.nguyen.xt@renesas.com, linux-power@fi.rohmeurope.com,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 09/10] mfd: bd9571mwv: Make the driver more generic
Date:   Fri, 11 Dec 2020 20:27:39 +0900
Message-Id: <1607686060-17448-10-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1607686060-17448-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1607686060-17448-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Khiem Nguyen <khiem.nguyen.xt@renesas.com>

Since the driver supports BD9571MWV PMIC only,
this patch makes the functions and data structure become more generic
so that it can support other PMIC variants as well.

Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@renesas.com>
[shimoda: rebase and refactor]
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/mfd/bd9571mwv.c       | 71 +++++++++++++++++++++++++++++++++++--------
 include/linux/mfd/bd9571mwv.h | 18 ++---------
 2 files changed, 62 insertions(+), 27 deletions(-)

diff --git a/drivers/mfd/bd9571mwv.c b/drivers/mfd/bd9571mwv.c
index 80c6ef0..adb9e3d 100644
--- a/drivers/mfd/bd9571mwv.c
+++ b/drivers/mfd/bd9571mwv.c
@@ -3,6 +3,7 @@
  * ROHM BD9571MWV-M MFD driver
  *
  * Copyright (C) 2017 Marek Vasut <marek.vasut+renesas@gmail.com>
+ * Copyright (C) 2020 Renesas Electronics Corporation
  *
  * Based on the TPS65086 driver
  */
@@ -14,6 +15,34 @@
 
 #include <linux/mfd/bd9571mwv.h>
 
+/**
+ * struct bd957x_data - internal data for the bd957x driver
+ *
+ * Internal data to distinguish bd957x variants
+ */
+struct bd957x_data {
+	char *part_name;
+	const struct regmap_config *regmap_config;
+	const struct regmap_irq_chip *irq_chip;
+	const struct mfd_cell *cells;
+	int num_cells;
+};
+
+/**
+ * struct bd9571mwv - state holder for the bd9571mwv driver
+ *
+ * Device data may be used to access the BD9571MWV chip
+ */
+struct bd9571mwv {
+	struct device *dev;
+	struct regmap *regmap;
+	const struct bd957x_data *data;
+
+	/* IRQ Data */
+	int irq;
+	struct regmap_irq_chip_data *irq_data;
+};
+
 static const struct mfd_cell bd9571mwv_cells[] = {
 	{ .name = "bd9571mwv-regulator", },
 	{ .name = "bd9571mwv-gpio", },
@@ -102,6 +131,14 @@ static struct regmap_irq_chip bd9571mwv_irq_chip = {
 	.num_irqs	= ARRAY_SIZE(bd9571mwv_irqs),
 };
 
+static const struct bd957x_data bd9571mwv_data = {
+	.part_name = BD9571MWV_PART_NAME,
+	.regmap_config = &bd9571mwv_regmap_config,
+	.irq_chip = &bd9571mwv_irq_chip,
+	.cells = bd9571mwv_cells,
+	.num_cells = ARRAY_SIZE(bd9571mwv_cells),
+};
+
 static int bd9571mwv_identify(struct bd9571mwv *bd)
 {
 	struct device *dev = bd->dev;
@@ -127,13 +164,6 @@ static int bd9571mwv_identify(struct bd9571mwv *bd)
 			ret);
 		return ret;
 	}
-
-	if (value != BD9571MWV_PRODUCT_CODE_VAL) {
-		dev_err(dev, "Invalid product code ID %02x (expected %02x)\n",
-			value, BD9571MWV_PRODUCT_CODE_VAL);
-		return -EINVAL;
-	}
-
 	ret = regmap_read(bd->regmap, BD9571MWV_PRODUCT_REVISION, &value);
 	if (ret) {
 		dev_err(dev, "Failed to read revision register (ret=%i)\n",
@@ -141,7 +171,8 @@ static int bd9571mwv_identify(struct bd9571mwv *bd)
 		return ret;
 	}
 
-	dev_info(dev, "Device: BD9571MWV rev. %d\n", value & 0xff);
+	dev_info(dev, "Device: %s rev. %d\n", bd->data->part_name,
+		 value & 0xff);
 
 	return 0;
 }
@@ -160,7 +191,23 @@ static int bd9571mwv_probe(struct i2c_client *client,
 	bd->dev = &client->dev;
 	bd->irq = client->irq;
 
-	bd->regmap = devm_regmap_init_i2c(client, &bd9571mwv_regmap_config);
+	/* Read the PMIC product code */
+	ret = i2c_smbus_read_byte_data(client, BD9571MWV_PRODUCT_CODE);
+	if (ret < 0) {
+		dev_err(&client->dev, "failed reading at 0x%02x\n",
+			BD9571MWV_PRODUCT_CODE);
+		return ret;
+	}
+	switch (ret) {
+	case BD9571MWV_PRODUCT_CODE_VAL:
+		bd->data = &bd9571mwv_data;
+		break;
+	default:
+		dev_err(bd->dev, "Unsupported device 0x%x\n", ret);
+		return -ENOENT;
+	}
+
+	bd->regmap = devm_regmap_init_i2c(client, bd->data->regmap_config);
 	if (IS_ERR(bd->regmap)) {
 		dev_err(bd->dev, "Failed to initialize register map\n");
 		return PTR_ERR(bd->regmap);
@@ -171,14 +218,14 @@ static int bd9571mwv_probe(struct i2c_client *client,
 		return ret;
 
 	ret = regmap_add_irq_chip(bd->regmap, bd->irq, IRQF_ONESHOT, 0,
-				  &bd9571mwv_irq_chip, &bd->irq_data);
+				  bd->data->irq_chip, &bd->irq_data);
 	if (ret) {
 		dev_err(bd->dev, "Failed to register IRQ chip\n");
 		return ret;
 	}
 
-	ret = mfd_add_devices(bd->dev, PLATFORM_DEVID_AUTO, bd9571mwv_cells,
-			      ARRAY_SIZE(bd9571mwv_cells), NULL, 0,
+	ret = mfd_add_devices(bd->dev, PLATFORM_DEVID_AUTO, bd->data->cells,
+			      bd->data->num_cells, NULL, 0,
 			      regmap_irq_get_domain(bd->irq_data));
 	if (ret) {
 		regmap_del_irq_chip(bd->irq, bd->irq_data);
diff --git a/include/linux/mfd/bd9571mwv.h b/include/linux/mfd/bd9571mwv.h
index bcc7092..5ab976a 100644
--- a/include/linux/mfd/bd9571mwv.h
+++ b/include/linux/mfd/bd9571mwv.h
@@ -3,6 +3,7 @@
  * ROHM BD9571MWV-M driver
  *
  * Copyright (C) 2017 Marek Vasut <marek.vasut+renesas@gmail.com>
+ * Copyright (C) 2020 Renesas Electronics Corporation
  *
  * Based on the TPS65086 driver
  */
@@ -83,6 +84,8 @@
 
 #define BD9571MWV_ACCESS_KEY			0xff
 
+#define BD9571MWV_PART_NAME			"BD9571MWV"
+
 /* Define the BD9571MWV IRQ numbers */
 enum bd9571mwv_irqs {
 	BD9571MWV_IRQ_MD1,
@@ -94,19 +97,4 @@ enum bd9571mwv_irqs {
 	BD9571MWV_IRQ_WDT_OF,
 	BD9571MWV_IRQ_BKUP_TRG,
 };
-
-/**
- * struct bd9571mwv - state holder for the bd9571mwv driver
- *
- * Device data may be used to access the BD9571MWV chip
- */
-struct bd9571mwv {
-	struct device *dev;
-	struct regmap *regmap;
-
-	/* IRQ Data */
-	int irq;
-	struct regmap_irq_chip_data *irq_data;
-};
-
 #endif /* __LINUX_MFD_BD9571MWV_H */
-- 
2.7.4

