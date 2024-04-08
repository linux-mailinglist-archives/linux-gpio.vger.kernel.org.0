Return-Path: <linux-gpio+bounces-5172-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 199C589BF35
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 14:43:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 869F61F24990
	for <lists+linux-gpio@lfdr.de>; Mon,  8 Apr 2024 12:43:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6E8078286;
	Mon,  8 Apr 2024 12:42:26 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa2.ltts.com (unknown [14.140.155.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE54574267;
	Mon,  8 Apr 2024 12:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.140.155.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712580146; cv=none; b=FfSI9Z+HTDfk8U88Xi+bAHVi0SpmsC4kS+wUaNgE1ooywbSkSBrdZrRBS8Ol2obTm++//O+eBCBtqcSZXaEVqIyniq0dHP4ZIEMaNE3oGp/Y7K7jLsoQDMTdCNfqtwXDLxlNpHUK17kB7vs7z66AsUhKVHz2TTFGdR1r39NNMYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712580146; c=relaxed/simple;
	bh=EclyQN+YA7HHsemmcLckQ4roFm2VU11PIgupyA6ilZI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gLqu5NvzVAhkymWJ8Blus2Nc9RoRiiBcwmDzXH6zia1RVlOu0SWqYEGgW+lO69kb3UsYbJV1dgyxRK3hTDFTKqOmHwqikvE0haOzLqpQvG/3IN3lihFbNCBbc92vct8a1wx0RBGrDlsZOj9ElEs7UlPD/V9VPZ26yRl9sJEh9bE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ltts.com; spf=pass smtp.mailfrom=ltts.com; arc=none smtp.client-ip=14.140.155.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ltts.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ltts.com
IronPort-SDR: q5LbA2NHz0MfRxgoH4WuKIA1kVcYZQN2zG48N4t5l5kyhgBfo3F1dkkDft83UErmIckyye0qSa
 VX5O+kn2tMGg==
Received: from unknown (HELO localhost.localdomain) ([192.168.34.55])
  by esa2.ltts.com with ESMTP; 08 Apr 2024 18:11:08 +0530
From: Bhargav Raviprakash <bhargav.r@ltts.com>
To: linux-kernel@vger.kernel.org
Cc: m.nirmaladevi@ltts.com,
	lee@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	jpanis@baylibre.com,
	devicetree@vger.kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linus.walleij@linaro.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	nm@ti.com,
	vigneshr@ti.com,
	kristo@kernel.org,
	eblanc@baylibre.com,
	Bhargav Raviprakash <bhargav.r@ltts.com>
Subject: [PATCH v6 03/11] mfd: tps6594: add regmap config in match data
Date: Mon,  8 Apr 2024 18:10:39 +0530
Message-Id: <20240408124047.191895-4-bhargav.r@ltts.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240408124047.191895-1-bhargav.r@ltts.com>
References: <20240408124047.191895-1-bhargav.r@ltts.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduces a new struct tps6594_match_data. This struct holds fields for
chip id and regmap config. Using this struct in of_device_id data field.
This helps in adding support for TPS65224 PMIC.

Signed-off-by: Bhargav Raviprakash <bhargav.r@ltts.com>
Acked-by: Julien Panis <jpanis@baylibre.com>
---
 drivers/mfd/tps6594-i2c.c   | 24 ++++++++++++++++--------
 drivers/mfd/tps6594-spi.c   | 24 ++++++++++++++++--------
 include/linux/mfd/tps6594.h | 11 +++++++++++
 3 files changed, 43 insertions(+), 16 deletions(-)

diff --git a/drivers/mfd/tps6594-i2c.c b/drivers/mfd/tps6594-i2c.c
index c125b474b..9e2ed48b7 100644
--- a/drivers/mfd/tps6594-i2c.c
+++ b/drivers/mfd/tps6594-i2c.c
@@ -192,10 +192,16 @@ static const struct regmap_config tps6594_i2c_regmap_config = {
 	.write = tps6594_i2c_write,
 };
 
+static const struct tps6594_match_data match_data[] = {
+	[TPS6594] = {TPS6594, &tps6594_i2c_regmap_config},
+	[TPS6593] = {TPS6593, &tps6594_i2c_regmap_config},
+	[LP8764] = {LP8764, &tps6594_i2c_regmap_config},
+};
+
 static const struct of_device_id tps6594_i2c_of_match_table[] = {
-	{ .compatible = "ti,tps6594-q1", .data = (void *)TPS6594, },
-	{ .compatible = "ti,tps6593-q1", .data = (void *)TPS6593, },
-	{ .compatible = "ti,lp8764-q1",  .data = (void *)LP8764,  },
+	{ .compatible = "ti,tps6594-q1", .data = &match_data[TPS6594], },
+	{ .compatible = "ti,tps6593-q1", .data = &match_data[TPS6593], },
+	{ .compatible = "ti,lp8764-q1",  .data = &match_data[LP8764], },
 	{}
 };
 MODULE_DEVICE_TABLE(of, tps6594_i2c_of_match_table);
@@ -205,6 +211,7 @@ static int tps6594_i2c_probe(struct i2c_client *client)
 	struct device *dev = &client->dev;
 	struct tps6594 *tps;
 	const struct of_device_id *match;
+	const struct tps6594_match_data *mdata;
 
 	tps = devm_kzalloc(dev, sizeof(*tps), GFP_KERNEL);
 	if (!tps)
@@ -216,14 +223,15 @@ static int tps6594_i2c_probe(struct i2c_client *client)
 	tps->reg = client->addr;
 	tps->irq = client->irq;
 
-	tps->regmap = devm_regmap_init(dev, NULL, client, &tps6594_i2c_regmap_config);
-	if (IS_ERR(tps->regmap))
-		return dev_err_probe(dev, PTR_ERR(tps->regmap), "Failed to init regmap\n");
-
 	match = of_match_device(tps6594_i2c_of_match_table, dev);
 	if (!match)
 		return dev_err_probe(dev, -EINVAL, "Failed to find matching chip ID\n");
-	tps->chip_id = (unsigned long)match->data;
+	mdata = (struct tps6594_match_data *)match->data;
+	tps->chip_id = mdata->chip_id;
+
+	tps->regmap = devm_regmap_init(dev, NULL, client, mdata->config);
+	if (IS_ERR(tps->regmap))
+		return dev_err_probe(dev, PTR_ERR(tps->regmap), "Failed to init regmap\n");
 
 	crc8_populate_msb(tps6594_i2c_crc_table, TPS6594_CRC8_POLYNOMIAL);
 
diff --git a/drivers/mfd/tps6594-spi.c b/drivers/mfd/tps6594-spi.c
index 5afb1736f..82a1c02e3 100644
--- a/drivers/mfd/tps6594-spi.c
+++ b/drivers/mfd/tps6594-spi.c
@@ -77,10 +77,16 @@ static const struct regmap_config tps6594_spi_regmap_config = {
 	.use_single_write = true,
 };
 
+static const struct tps6594_match_data match_data[] = {
+	[TPS6594] = {TPS6594, &tps6594_spi_regmap_config},
+	[TPS6593] = {TPS6593, &tps6594_spi_regmap_config},
+	[LP8764] = {LP8764, &tps6594_spi_regmap_config},
+};
+
 static const struct of_device_id tps6594_spi_of_match_table[] = {
-	{ .compatible = "ti,tps6594-q1", .data = (void *)TPS6594, },
-	{ .compatible = "ti,tps6593-q1", .data = (void *)TPS6593, },
-	{ .compatible = "ti,lp8764-q1",  .data = (void *)LP8764,  },
+	{ .compatible = "ti,tps6594-q1", .data = &match_data[TPS6594], },
+	{ .compatible = "ti,tps6593-q1", .data = &match_data[TPS6593], },
+	{ .compatible = "ti,lp8764-q1",  .data = &match_data[LP8764], },
 	{}
 };
 MODULE_DEVICE_TABLE(of, tps6594_spi_of_match_table);
@@ -90,6 +96,7 @@ static int tps6594_spi_probe(struct spi_device *spi)
 	struct device *dev = &spi->dev;
 	struct tps6594 *tps;
 	const struct of_device_id *match;
+	const struct tps6594_match_data *mdata;
 
 	tps = devm_kzalloc(dev, sizeof(*tps), GFP_KERNEL);
 	if (!tps)
@@ -101,14 +108,15 @@ static int tps6594_spi_probe(struct spi_device *spi)
 	tps->reg = spi_get_chipselect(spi, 0);
 	tps->irq = spi->irq;
 
-	tps->regmap = devm_regmap_init(dev, NULL, spi, &tps6594_spi_regmap_config);
-	if (IS_ERR(tps->regmap))
-		return dev_err_probe(dev, PTR_ERR(tps->regmap), "Failed to init regmap\n");
-
 	match = of_match_device(tps6594_spi_of_match_table, dev);
 	if (!match)
 		return dev_err_probe(dev, -EINVAL, "Failed to find matching chip ID\n");
-	tps->chip_id = (unsigned long)match->data;
+	mdata = (struct tps6594_match_data *)match->data;
+	tps->chip_id = mdata->chip_id;
+
+	tps->regmap = devm_regmap_init(dev, NULL, spi, mdata->config);
+	if (IS_ERR(tps->regmap))
+		return dev_err_probe(dev, PTR_ERR(tps->regmap), "Failed to init regmap\n");
 
 	crc8_populate_msb(tps6594_spi_crc_table, TPS6594_CRC8_POLYNOMIAL);
 
diff --git a/include/linux/mfd/tps6594.h b/include/linux/mfd/tps6594.h
index 16543fd4d..d781e0fe3 100644
--- a/include/linux/mfd/tps6594.h
+++ b/include/linux/mfd/tps6594.h
@@ -1337,6 +1337,17 @@ struct tps6594 {
 	struct regmap_irq_chip_data *irq_data;
 };
 
+/**
+ * struct tps6594_match_data - of match data of PMIC
+ *
+ * @chip_id: chip ID of PMIC
+ * @config: regmap config of PMIC
+ */
+struct tps6594_match_data {
+	unsigned long chip_id;
+	const struct regmap_config *config;
+};
+
 extern const struct regmap_access_table tps6594_volatile_table;
 extern const struct regmap_access_table tps65224_volatile_table;
 
-- 
2.25.1


