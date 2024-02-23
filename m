Return-Path: <linux-gpio+bounces-3695-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B23B1860E36
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Feb 2024 10:39:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67E23280E88
	for <lists+linux-gpio@lfdr.de>; Fri, 23 Feb 2024 09:39:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2D915D8EB;
	Fri, 23 Feb 2024 09:38:32 +0000 (UTC)
X-Original-To: linux-gpio@vger.kernel.org
Received: from esa2.ltts.com (unknown [14.140.155.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11AD5D479;
	Fri, 23 Feb 2024 09:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=14.140.155.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708681112; cv=none; b=myItyOCeZ15Xlu6B1P1F3VXJD4vHrd+8TG6GwexnjQNdCYAGsXGRzWYvuH1W+OlYyTKbprAharoWAQjZx3Lfkrkm0gWdo7kybUWmjyXhr0zcMM+M9fgypPa5XVCWwE+7jISmf5nFDF+VqGjQ8vZADv+ew2VJHqry/PeW7oM7J1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708681112; c=relaxed/simple;
	bh=632mSW739GI+cTIj2J0SM75z6pUhIUvmsgpajnnzy4A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=qyn23TWzHLqqLpQnxQvlMWb4fU01ZuVTM7BqlVpzJa9IiSpYLlmWSLx9mRMnsPNX98iqr7HeGWMNJEEuszvbh08gNDIJvVy+TV9mxAN07vkbVv6aMdGUGsIOBdmGzb0ylonCRhcAYvHL/KwasGktXPuJtVG750GlMMr2KS11zJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ltts.com; spf=pass smtp.mailfrom=ltts.com; arc=none smtp.client-ip=14.140.155.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ltts.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ltts.com
IronPort-SDR: yillgQfEhLteR7Vr7Cpb6G3w65YFnAXrxVMDMawG4rqIQqrc9n3h2Fu2aGvJqsx/dNUEx8ef4D
 dcbMKTGiC1Pw==
Received: from unknown (HELO localhost.localdomain) ([192.168.34.55])
  by esa2.ltts.com with ESMTP; 23 Feb 2024 15:07:12 +0530
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
	Bhargav Raviprakash <bhargav.r@ltts.com>
Subject: [PATCH v2 03/14] mfd: tps6594: add regmap config in match data
Date: Fri, 23 Feb 2024 15:06:50 +0530
Message-Id: <20240223093701.66034-4-bhargav.r@ltts.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240223093701.66034-1-bhargav.r@ltts.com>
References: <20240223093701.66034-1-bhargav.r@ltts.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduces a new struct tps6594_match_data. This struct
holds fields for chip id and regmap config. Using this
struct in of_device_id data field.
This helps in adding support for TPS65224 PMIC.

Signed-off-by: Bhargav Raviprakash <bhargav.r@ltts.com>
---
 drivers/mfd/tps6594-i2c.c   | 24 ++++++++++++++++--------
 drivers/mfd/tps6594-spi.c   | 24 ++++++++++++++++--------
 include/linux/mfd/tps6594.h | 11 +++++++++++
 3 files changed, 43 insertions(+), 16 deletions(-)

diff --git a/drivers/mfd/tps6594-i2c.c b/drivers/mfd/tps6594-i2c.c
index c125b474b..e80e0af2b 100644
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
+	{ .compatible = "ti,tps6594-q1", .data = (void *)&match_data[TPS6594], },
+	{ .compatible = "ti,tps6593-q1", .data = (void *)&match_data[TPS6593], },
+	{ .compatible = "ti,lp8764-q1",  .data = (void *)&match_data[LP8764], },
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
index 5afb1736f..b9428dc12 100644
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
+	{ .compatible = "ti,tps6594-q1", .data = (void *)&match_data[TPS6594], },
+	{ .compatible = "ti,tps6593-q1", .data = (void *)&match_data[TPS6593], },
+	{ .compatible = "ti,lp8764-q1",  .data = (void *)&match_data[LP8764], },
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
index 6c5a2889f..615529591 100644
--- a/include/linux/mfd/tps6594.h
+++ b/include/linux/mfd/tps6594.h
@@ -1344,6 +1344,17 @@ struct tps6594 {
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


