Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 258FB2DF7DB
	for <lists+linux-gpio@lfdr.de>; Mon, 21 Dec 2020 03:58:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728415AbgLUCzb (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sun, 20 Dec 2020 21:55:31 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:9923 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727653AbgLUCzU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sun, 20 Dec 2020 21:55:20 -0500
X-IronPort-AV: E=Sophos;i="5.78,436,1599490800"; 
   d="scan'208";a="66411308"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie6.idc.renesas.com with ESMTP; 21 Dec 2020 11:54:45 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id F320441BA027;
        Mon, 21 Dec 2020 11:54:44 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     marek.vasut+renesas@gmail.com, lee.jones@linaro.org,
        matti.vaittinen@fi.rohmeurope.com, lgirdwood@gmail.com,
        broonie@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     khiem.nguyen.xt@renesas.com, linux-power@fi.rohmeurope.com,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v4 11/12] mfd: bd9571mwv: Make the driver more generic
Date:   Mon, 21 Dec 2020 11:54:38 +0900
Message-Id: <1608519279-13341-12-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608519279-13341-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1608519279-13341-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Khiem Nguyen <khiem.nguyen.xt@renesas.com>

Since the driver supports BD9571MWV PMIC only, this patch makes
the functions and data structure become more generic so that
it can support other PMIC variants as well. Also remove printing
part name which Lee Jones suggested.

Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@renesas.com>
Co-developed-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 drivers/mfd/bd9571mwv.c       | 89 +++++++++++++++++++++++++------------------
 include/linux/mfd/bd9571mwv.h | 18 +--------
 2 files changed, 54 insertions(+), 53 deletions(-)

diff --git a/drivers/mfd/bd9571mwv.c b/drivers/mfd/bd9571mwv.c
index 49e968e..c905ab4 100644
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
@@ -14,6 +15,14 @@
 
 #include <linux/mfd/bd9571mwv.h>
 
+/* Driver data to distinguish bd957x variants */
+struct bd957x_ddata {
+	const struct regmap_config *regmap_config;
+	const struct regmap_irq_chip *irq_chip;
+	const struct mfd_cell *cells;
+	int num_cells;
+};
+
 static const struct mfd_cell bd9571mwv_cells[] = {
 	{ .name = "bd9571mwv-regulator", },
 	{ .name = "bd9571mwv-gpio", },
@@ -102,13 +111,19 @@ static struct regmap_irq_chip bd9571mwv_irq_chip = {
 	.num_irqs	= ARRAY_SIZE(bd9571mwv_irqs),
 };
 
-static int bd9571mwv_identify(struct bd9571mwv *bd)
+static const struct bd957x_ddata bd9571mwv_ddata = {
+	.regmap_config = &bd9571mwv_regmap_config,
+	.irq_chip = &bd9571mwv_irq_chip,
+	.cells = bd9571mwv_cells,
+	.num_cells = ARRAY_SIZE(bd9571mwv_cells),
+};
+
+static int bd957x_identify(struct device *dev, struct regmap *regmap)
 {
-	struct device *dev = bd->dev;
 	unsigned int value;
 	int ret;
 
-	ret = regmap_read(bd->regmap, BD9571MWV_VENDOR_CODE, &value);
+	ret = regmap_read(regmap, BD9571MWV_VENDOR_CODE, &value);
 	if (ret) {
 		dev_err(dev, "Failed to read vendor code register (ret=%i)\n",
 			ret);
@@ -121,66 +136,66 @@ static int bd9571mwv_identify(struct bd9571mwv *bd)
 		return -EINVAL;
 	}
 
-	ret = regmap_read(bd->regmap, BD9571MWV_PRODUCT_CODE, &value);
+	ret = regmap_read(regmap, BD9571MWV_PRODUCT_CODE, &value);
 	if (ret) {
 		dev_err(dev, "Failed to read product code register (ret=%i)\n",
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
-	ret = regmap_read(bd->regmap, BD9571MWV_PRODUCT_REVISION, &value);
+	ret = regmap_read(regmap, BD9571MWV_PRODUCT_REVISION, &value);
 	if (ret) {
 		dev_err(dev, "Failed to read revision register (ret=%i)\n",
 			ret);
 		return ret;
 	}
 
-	dev_info(dev, "Device: BD9571MWV rev. %d\n", value & 0xff);
-
 	return 0;
 }
 
 static int bd9571mwv_probe(struct i2c_client *client,
-			  const struct i2c_device_id *ids)
+			   const struct i2c_device_id *ids)
 {
-	struct bd9571mwv *bd;
-	int ret;
-
-	bd = devm_kzalloc(&client->dev, sizeof(*bd), GFP_KERNEL);
-	if (!bd)
-		return -ENOMEM;
-
-	i2c_set_clientdata(client, bd);
-	bd->dev = &client->dev;
-	bd->irq = client->irq;
+	const struct bd957x_ddata *ddata;
+	struct device *dev = &client->dev;
+	struct regmap *regmap;
+	struct regmap_irq_chip_data *irq_data;
+	int ret, irq = client->irq;
+
+	/* Read the PMIC product code */
+	ret = i2c_smbus_read_byte_data(client, BD9571MWV_PRODUCT_CODE);
+	if (ret < 0) {
+		dev_err(dev, "Failed to read product code\n");
+		return ret;
+	}
+	switch (ret) {
+	case BD9571MWV_PRODUCT_CODE_BD9571MWV:
+		ddata = &bd9571mwv_ddata;
+		break;
+	default:
+		dev_err(dev, "Unsupported device 0x%x\n", ret);
+		return -ENODEV;
+	}
 
-	bd->regmap = devm_regmap_init_i2c(client, &bd9571mwv_regmap_config);
-	if (IS_ERR(bd->regmap)) {
-		dev_err(bd->dev, "Failed to initialize register map\n");
-		return PTR_ERR(bd->regmap);
+	regmap = devm_regmap_init_i2c(client, ddata->regmap_config);
+	if (IS_ERR(regmap)) {
+		dev_err(dev, "Failed to initialize register map\n");
+		return PTR_ERR(regmap);
 	}
 
-	ret = bd9571mwv_identify(bd);
+	ret = bd957x_identify(dev, regmap);
 	if (ret)
 		return ret;
 
-	ret = devm_regmap_add_irq_chip(bd->dev, bd->regmap, bd->irq,
-				       IRQF_ONESHOT, 0, &bd9571mwv_irq_chip,
-				       &bd->irq_data);
+	ret = devm_regmap_add_irq_chip(dev, regmap, irq, IRQF_ONESHOT, 0,
+				       ddata->irq_chip, &irq_data);
 	if (ret) {
-		dev_err(bd->dev, "Failed to register IRQ chip\n");
+		dev_err(dev, "Failed to register IRQ chip\n");
 		return ret;
 	}
 
-	return devm_mfd_add_devices(bd->dev, PLATFORM_DEVID_AUTO,
-				    bd9571mwv_cells, ARRAY_SIZE(bd9571mwv_cells),
-				    NULL, 0, regmap_irq_get_domain(bd->irq_data));
+	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, ddata->cells,
+				    ddata->num_cells, NULL, 0,
+				    regmap_irq_get_domain(irq_data));
 }
 
 static const struct of_device_id bd9571mwv_of_match_table[] = {
diff --git a/include/linux/mfd/bd9571mwv.h b/include/linux/mfd/bd9571mwv.h
index bcc7092..e1716ec 100644
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
@@ -17,7 +18,7 @@
 #define BD9571MWV_VENDOR_CODE			0x00
 #define BD9571MWV_VENDOR_CODE_VAL		0xdb
 #define BD9571MWV_PRODUCT_CODE			0x01
-#define BD9571MWV_PRODUCT_CODE_VAL		0x60
+#define BD9571MWV_PRODUCT_CODE_BD9571MWV	0x60
 #define BD9571MWV_PRODUCT_REVISION		0x02
 
 #define BD9571MWV_I2C_FUSA_MODE			0x10
@@ -94,19 +95,4 @@ enum bd9571mwv_irqs {
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

