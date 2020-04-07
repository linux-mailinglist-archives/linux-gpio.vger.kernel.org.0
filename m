Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AA0961A12CC
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2020 19:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726406AbgDGRiz (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Apr 2020 13:38:55 -0400
Received: from mga06.intel.com ([134.134.136.31]:38264 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726380AbgDGRiy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 7 Apr 2020 13:38:54 -0400
IronPort-SDR: hK6htlTr7jJx/kymkpHQ6hm5o9Q7yAgeN2nyDrtGDghu1QgvBoH2aeLBf8gawtmd+g8p5SJApX
 FnW4JLza1cIA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2020 10:38:52 -0700
IronPort-SDR: K2+LroH4pOxOh9B0ymCg0V9r0klw+lGKmkRjRvpyxJRcc/0OtyTexgRtne4J6UwNZGub8l+QIM
 +KrJLpy1JkCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,356,1580803200"; 
   d="scan'208";a="361602076"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 07 Apr 2020 10:38:51 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 67C5B1DF; Tue,  7 Apr 2020 20:38:50 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 3/9] =?UTF-8?q?pinctrl:=20mcp23s08:=20Consolidate=20SPI?= =?UTF-8?q?=20and=20I=C2=B2C=20code?=
Date:   Tue,  7 Apr 2020 20:38:43 +0300
Message-Id: <20200407173849.43628-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200407173849.43628-1-andriy.shevchenko@linux.intel.com>
References: <20200407173849.43628-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There are three parts of each, SPI and I²C, driver spread over the code under
ifdeffery. Consolidate them so it will be only one for SPI and one for I²C.

The code has been cosmetically changed to avoid intrusive change.
Clean up is considered in the nearest future.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 461 +++++++++++++++--------------
 1 file changed, 233 insertions(+), 228 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index e05219d3331f..30a5b6bfbb86 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -27,8 +27,6 @@
 #define MCP_TYPE_S18    4
 #define MCP_TYPE_018    5
 
-#define MCP_MAX_DEV_PER_CS	8
-
 /* Registers are all 8 bits wide.
  *
  * The mcp23s17 has twice as many bits, and can be configured to work
@@ -308,80 +306,6 @@ static const struct pinconf_ops mcp_pinconf_ops = {
 
 /*----------------------------------------------------------------------*/
 
-#ifdef CONFIG_SPI_MASTER
-
-static int mcp23sxx_spi_write(void *context, const void *data, size_t count)
-{
-	struct mcp23s08 *mcp = context;
-	struct spi_device *spi = to_spi_device(mcp->dev);
-	struct spi_message m;
-	struct spi_transfer t[2] = { { .tx_buf = &mcp->addr, .len = 1, },
-				     { .tx_buf = data, .len = count, }, };
-
-	spi_message_init(&m);
-	spi_message_add_tail(&t[0], &m);
-	spi_message_add_tail(&t[1], &m);
-
-	return spi_sync(spi, &m);
-}
-
-static int mcp23sxx_spi_gather_write(void *context,
-				const void *reg, size_t reg_size,
-				const void *val, size_t val_size)
-{
-	struct mcp23s08 *mcp = context;
-	struct spi_device *spi = to_spi_device(mcp->dev);
-	struct spi_message m;
-	struct spi_transfer t[3] = { { .tx_buf = &mcp->addr, .len = 1, },
-				     { .tx_buf = reg, .len = reg_size, },
-				     { .tx_buf = val, .len = val_size, }, };
-
-	spi_message_init(&m);
-	spi_message_add_tail(&t[0], &m);
-	spi_message_add_tail(&t[1], &m);
-	spi_message_add_tail(&t[2], &m);
-
-	return spi_sync(spi, &m);
-}
-
-static int mcp23sxx_spi_read(void *context, const void *reg, size_t reg_size,
-				void *val, size_t val_size)
-{
-	struct mcp23s08 *mcp = context;
-	struct spi_device *spi = to_spi_device(mcp->dev);
-	u8 tx[2];
-
-	if (reg_size != 1)
-		return -EINVAL;
-
-	tx[0] = mcp->addr | 0x01;
-	tx[1] = *((u8 *) reg);
-
-	return spi_write_then_read(spi, tx, sizeof(tx), val, val_size);
-}
-
-static const struct regmap_bus mcp23sxx_spi_regmap = {
-	.write = mcp23sxx_spi_write,
-	.gather_write = mcp23sxx_spi_gather_write,
-	.read = mcp23sxx_spi_read,
-};
-
-#endif /* CONFIG_SPI_MASTER */
-
-/*----------------------------------------------------------------------*/
-
-/* A given spi_device can represent up to eight mcp23sxx chips
- * sharing the same chipselect but using different addresses
- * (e.g. chips #0 and #3 might be populated, but not #1 or $2).
- * Driver data holds all the per-chip data.
- */
-struct mcp23s08_driver_data {
-	unsigned		ngpio;
-	struct mcp23s08		*mcp[8];
-	struct mcp23s08		chip[];
-};
-
-
 static int mcp23s08_direction_input(struct gpio_chip *chip, unsigned offset)
 {
 	struct mcp23s08	*mcp = gpiochip_get_data(chip);
@@ -656,14 +580,12 @@ static int mcp23s08_irqchip_setup(struct mcp23s08 *mcp)
 /*----------------------------------------------------------------------*/
 
 static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
-			      void *data, unsigned addr, unsigned type,
+			      unsigned int addr, unsigned int type,
 			      unsigned int base, int cs)
 {
 	int status, ret;
 	bool mirror = false;
 	bool open_drain = false;
-	struct regmap_config *one_regmap_config = NULL;
-	int raw_chip_address = (addr & ~0x40) >> 1;
 
 	mutex_init(&mcp->lock);
 
@@ -687,83 +609,6 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 	mcp->chip.of_node = dev->of_node;
 #endif
 
-	switch (type) {
-#ifdef CONFIG_SPI_MASTER
-	case MCP_TYPE_S08:
-	case MCP_TYPE_S17:
-		switch (type) {
-		case MCP_TYPE_S08:
-			one_regmap_config =
-				devm_kmemdup(dev, &mcp23x08_regmap,
-					sizeof(struct regmap_config), GFP_KERNEL);
-			mcp->reg_shift = 0;
-			mcp->chip.ngpio = 8;
-			mcp->chip.label = devm_kasprintf(dev, GFP_KERNEL,
-					"mcp23s08.%d", raw_chip_address);
-			break;
-		case MCP_TYPE_S17:
-			one_regmap_config =
-				devm_kmemdup(dev, &mcp23x17_regmap,
-					sizeof(struct regmap_config), GFP_KERNEL);
-			mcp->reg_shift = 1;
-			mcp->chip.ngpio = 16;
-			mcp->chip.label = devm_kasprintf(dev, GFP_KERNEL,
-					"mcp23s17.%d", raw_chip_address);
-			break;
-		}
-		if (!one_regmap_config)
-			return -ENOMEM;
-
-		one_regmap_config->name = devm_kasprintf(dev, GFP_KERNEL, "%d", raw_chip_address);
-		mcp->regmap = devm_regmap_init(dev, &mcp23sxx_spi_regmap, mcp,
-					       one_regmap_config);
-		break;
-
-	case MCP_TYPE_S18:
-		one_regmap_config =
-			devm_kmemdup(dev, &mcp23x17_regmap,
-				sizeof(struct regmap_config), GFP_KERNEL);
-		if (!one_regmap_config)
-			return -ENOMEM;
-		mcp->regmap = devm_regmap_init(dev, &mcp23sxx_spi_regmap, mcp,
-					       one_regmap_config);
-		mcp->reg_shift = 1;
-		mcp->chip.ngpio = 16;
-		mcp->chip.label = "mcp23s18";
-		break;
-#endif /* CONFIG_SPI_MASTER */
-
-#if IS_ENABLED(CONFIG_I2C)
-	case MCP_TYPE_008:
-		mcp->regmap = devm_regmap_init_i2c(data, &mcp23x08_regmap);
-		mcp->reg_shift = 0;
-		mcp->chip.ngpio = 8;
-		mcp->chip.label = "mcp23008";
-		break;
-
-	case MCP_TYPE_017:
-		mcp->regmap = devm_regmap_init_i2c(data, &mcp23x17_regmap);
-		mcp->reg_shift = 1;
-		mcp->chip.ngpio = 16;
-		mcp->chip.label = "mcp23017";
-		break;
-
-	case MCP_TYPE_018:
-		mcp->regmap = devm_regmap_init_i2c(data, &mcp23x17_regmap);
-		mcp->reg_shift = 1;
-		mcp->chip.ngpio = 16;
-		mcp->chip.label = "mcp23018";
-		break;
-#endif /* CONFIG_I2C */
-
-	default:
-		dev_err(dev, "invalid device type (%d)\n", type);
-		return -EINVAL;
-	}
-
-	if (IS_ERR(mcp->regmap))
-		return PTR_ERR(mcp->regmap);
-
 	mcp->chip.base = base;
 	mcp->chip.can_sleep = true;
 	mcp->chip.parent = dev;
@@ -822,14 +667,6 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 			goto fail;
 	}
 
-	if (one_regmap_config) {
-		mcp->pinctrl_desc.name = devm_kasprintf(dev, GFP_KERNEL,
-				"mcp23xxx-pinctrl.%d", raw_chip_address);
-		if (!mcp->pinctrl_desc.name)
-			return -ENOMEM;
-	} else {
-		mcp->pinctrl_desc.name = "mcp23xxx-pinctrl";
-	}
 	mcp->pinctrl_desc.pctlops = &mcp_pinctrl_ops;
 	mcp->pinctrl_desc.confops = &mcp_pinconf_ops;
 	mcp->pinctrl_desc.npins = mcp->chip.ngpio;
@@ -856,70 +693,13 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 
 /*----------------------------------------------------------------------*/
 
-#ifdef CONFIG_OF
-#ifdef CONFIG_SPI_MASTER
-static const struct of_device_id mcp23s08_spi_of_match[] = {
-	{
-		.compatible = "microchip,mcp23s08",
-		.data = (void *) MCP_TYPE_S08,
-	},
-	{
-		.compatible = "microchip,mcp23s17",
-		.data = (void *) MCP_TYPE_S17,
-	},
-	{
-		.compatible = "microchip,mcp23s18",
-		.data = (void *) MCP_TYPE_S18,
-	},
-/* NOTE: The use of the mcp prefix is deprecated and will be removed. */
-	{
-		.compatible = "mcp,mcp23s08",
-		.data = (void *) MCP_TYPE_S08,
-	},
-	{
-		.compatible = "mcp,mcp23s17",
-		.data = (void *) MCP_TYPE_S17,
-	},
-	{ },
-};
-MODULE_DEVICE_TABLE(of, mcp23s08_spi_of_match);
-#endif
-
-#if IS_ENABLED(CONFIG_I2C)
-static const struct of_device_id mcp23s08_i2c_of_match[] = {
-	{
-		.compatible = "microchip,mcp23008",
-		.data = (void *) MCP_TYPE_008,
-	},
-	{
-		.compatible = "microchip,mcp23017",
-		.data = (void *) MCP_TYPE_017,
-	},
-	{
-		.compatible = "microchip,mcp23018",
-		.data = (void *) MCP_TYPE_018,
-	},
-/* NOTE: The use of the mcp prefix is deprecated and will be removed. */
-	{
-		.compatible = "mcp,mcp23008",
-		.data = (void *) MCP_TYPE_008,
-	},
-	{
-		.compatible = "mcp,mcp23017",
-		.data = (void *) MCP_TYPE_017,
-	},
-	{ },
-};
-MODULE_DEVICE_TABLE(of, mcp23s08_i2c_of_match);
-#endif
-#endif /* CONFIG_OF */
-
-
 #if IS_ENABLED(CONFIG_I2C)
 
 static int mcp230xx_probe(struct i2c_client *client,
 				    const struct i2c_device_id *id)
 {
+	struct device *dev = &client->dev;
+	unsigned int type = id->driver_data;
 	struct mcp23s08 *mcp;
 	int status;
 
@@ -929,8 +709,39 @@ static int mcp230xx_probe(struct i2c_client *client,
 
 	mcp->irq = client->irq;
 
-	status = mcp23s08_probe_one(mcp, &client->dev, client, client->addr,
-				    id->driver_data, -1, 0);
+	switch (type) {
+	case MCP_TYPE_008:
+		mcp->regmap = devm_regmap_init_i2c(client, &mcp23x08_regmap);
+		mcp->reg_shift = 0;
+		mcp->chip.ngpio = 8;
+		mcp->chip.label = "mcp23008";
+		break;
+
+	case MCP_TYPE_017:
+		mcp->regmap = devm_regmap_init_i2c(client, &mcp23x17_regmap);
+		mcp->reg_shift = 1;
+		mcp->chip.ngpio = 16;
+		mcp->chip.label = "mcp23017";
+		break;
+
+	case MCP_TYPE_018:
+		mcp->regmap = devm_regmap_init_i2c(client, &mcp23x17_regmap);
+		mcp->reg_shift = 1;
+		mcp->chip.ngpio = 16;
+		mcp->chip.label = "mcp23018";
+		break;
+
+	default:
+		dev_err(dev, "invalid device type (%d)\n", type);
+		return -EINVAL;
+	}
+
+	if (IS_ERR(mcp->regmap))
+		return PTR_ERR(mcp->regmap);
+
+	mcp->pinctrl_desc.name = "mcp23xxx-pinctrl";
+
+	status = mcp23s08_probe_one(mcp, dev, client->addr, type, -1, 0);
 	if (status)
 		return status;
 
@@ -947,6 +758,34 @@ static const struct i2c_device_id mcp230xx_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, mcp230xx_id);
 
+#ifdef CONFIG_OF
+static const struct of_device_id mcp23s08_i2c_of_match[] = {
+	{
+		.compatible = "microchip,mcp23008",
+		.data = (void *) MCP_TYPE_008,
+	},
+	{
+		.compatible = "microchip,mcp23017",
+		.data = (void *) MCP_TYPE_017,
+	},
+	{
+		.compatible = "microchip,mcp23018",
+		.data = (void *) MCP_TYPE_018,
+	},
+/* NOTE: The use of the mcp prefix is deprecated and will be removed. */
+	{
+		.compatible = "mcp,mcp23008",
+		.data = (void *) MCP_TYPE_008,
+	},
+	{
+		.compatible = "mcp,mcp23017",
+		.data = (void *) MCP_TYPE_017,
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, mcp23s08_i2c_of_match);
+#endif /* CONFIG_OF */
+
 static struct i2c_driver mcp230xx_driver = {
 	.driver = {
 		.name	= "mcp230xx",
@@ -977,8 +816,138 @@ static void mcp23s08_i2c_exit(void) { }
 
 #ifdef CONFIG_SPI_MASTER
 
+#define MCP_MAX_DEV_PER_CS	8
+
+static int mcp23sxx_spi_write(void *context, const void *data, size_t count)
+{
+	struct mcp23s08 *mcp = context;
+	struct spi_device *spi = to_spi_device(mcp->dev);
+	struct spi_message m;
+	struct spi_transfer t[2] = { { .tx_buf = &mcp->addr, .len = 1, },
+				     { .tx_buf = data, .len = count, }, };
+
+	spi_message_init(&m);
+	spi_message_add_tail(&t[0], &m);
+	spi_message_add_tail(&t[1], &m);
+
+	return spi_sync(spi, &m);
+}
+
+static int mcp23sxx_spi_gather_write(void *context,
+				const void *reg, size_t reg_size,
+				const void *val, size_t val_size)
+{
+	struct mcp23s08 *mcp = context;
+	struct spi_device *spi = to_spi_device(mcp->dev);
+	struct spi_message m;
+	struct spi_transfer t[3] = { { .tx_buf = &mcp->addr, .len = 1, },
+				     { .tx_buf = reg, .len = reg_size, },
+				     { .tx_buf = val, .len = val_size, }, };
+
+	spi_message_init(&m);
+	spi_message_add_tail(&t[0], &m);
+	spi_message_add_tail(&t[1], &m);
+	spi_message_add_tail(&t[2], &m);
+
+	return spi_sync(spi, &m);
+}
+
+static int mcp23sxx_spi_read(void *context, const void *reg, size_t reg_size,
+				void *val, size_t val_size)
+{
+	struct mcp23s08 *mcp = context;
+	struct spi_device *spi = to_spi_device(mcp->dev);
+	u8 tx[2];
+
+	if (reg_size != 1)
+		return -EINVAL;
+
+	tx[0] = mcp->addr | 0x01;
+	tx[1] = *((u8 *) reg);
+
+	return spi_write_then_read(spi, tx, sizeof(tx), val, val_size);
+}
+
+static const struct regmap_bus mcp23sxx_spi_regmap = {
+	.write = mcp23sxx_spi_write,
+	.gather_write = mcp23sxx_spi_gather_write,
+	.read = mcp23sxx_spi_read,
+};
+
+/* A given spi_device can represent up to eight mcp23sxx chips
+ * sharing the same chipselect but using different addresses
+ * (e.g. chips #0 and #3 might be populated, but not #1 or $2).
+ * Driver data holds all the per-chip data.
+ */
+struct mcp23s08_driver_data {
+	unsigned		ngpio;
+	struct mcp23s08		*mcp[8];
+	struct mcp23s08		chip[];
+};
+
+static int mcp23s08_spi_regmap_init(struct mcp23s08 *mcp, struct device *dev,
+				    unsigned int addr, unsigned int type)
+{
+	struct regmap_config *one_regmap_config = NULL;
+
+	switch (type) {
+	case MCP_TYPE_S08:
+	case MCP_TYPE_S17:
+		switch (type) {
+		case MCP_TYPE_S08:
+			one_regmap_config =
+				devm_kmemdup(dev, &mcp23x08_regmap,
+					sizeof(struct regmap_config), GFP_KERNEL);
+			mcp->reg_shift = 0;
+			mcp->chip.ngpio = 8;
+			mcp->chip.label = devm_kasprintf(dev, GFP_KERNEL,
+					"mcp23s08.%d", addr);
+			break;
+		case MCP_TYPE_S17:
+			one_regmap_config =
+				devm_kmemdup(dev, &mcp23x17_regmap,
+					sizeof(struct regmap_config), GFP_KERNEL);
+			mcp->reg_shift = 1;
+			mcp->chip.ngpio = 16;
+			mcp->chip.label = devm_kasprintf(dev, GFP_KERNEL,
+					"mcp23s17.%d", addr);
+			break;
+		}
+		if (!one_regmap_config)
+			return -ENOMEM;
+
+		one_regmap_config->name = devm_kasprintf(dev, GFP_KERNEL, "%d", addr);
+		mcp->regmap = devm_regmap_init(dev, &mcp23sxx_spi_regmap, mcp,
+					       one_regmap_config);
+		break;
+
+	case MCP_TYPE_S18:
+		one_regmap_config =
+			devm_kmemdup(dev, &mcp23x17_regmap,
+				sizeof(struct regmap_config), GFP_KERNEL);
+		if (!one_regmap_config)
+			return -ENOMEM;
+		mcp->regmap = devm_regmap_init(dev, &mcp23sxx_spi_regmap, mcp,
+					       one_regmap_config);
+		mcp->reg_shift = 1;
+		mcp->chip.ngpio = 16;
+		mcp->chip.label = "mcp23s18";
+		break;
+
+	default:
+		dev_err(dev, "invalid device type (%d)\n", type);
+		return -EINVAL;
+	}
+
+	if (IS_ERR(mcp->regmap))
+		return PTR_ERR(mcp->regmap);
+
+	return 0;
+}
+
 static int mcp23s08_probe(struct spi_device *spi)
 {
+	struct device *dev = &spi->dev;
 	unsigned			addr;
 	int				chips = 0;
 	struct mcp23s08_driver_data	*data;
@@ -1030,9 +999,17 @@ static int mcp23s08_probe(struct spi_device *spi)
 		chips--;
 		data->mcp[addr] = &data->chip[chips];
 		data->mcp[addr]->irq = spi->irq;
-		status = mcp23s08_probe_one(data->mcp[addr], &spi->dev, spi,
-					    0x40 | (addr << 1), type,
-					    -1, addr);
+
+		status = mcp23s08_spi_regmap_init(data->mcp[addr], dev, addr, type);
+		if (status)
+			return status;
+
+		data->mcp[addr]->pinctrl_desc.name = devm_kasprintf(dev, GFP_KERNEL,
+				"mcp23xxx-pinctrl.%d", addr);
+		if (!data->mcp[addr]->pinctrl_desc.name)
+			return -ENOMEM;
+
+		status = mcp23s08_probe_one(data->mcp[addr], dev, 0x40 | (addr << 1), type, -1, addr);
 		if (status < 0)
 			return status;
 
@@ -1051,6 +1028,34 @@ static const struct spi_device_id mcp23s08_ids[] = {
 };
 MODULE_DEVICE_TABLE(spi, mcp23s08_ids);
 
+#ifdef CONFIG_OF
+static const struct of_device_id mcp23s08_spi_of_match[] = {
+	{
+		.compatible = "microchip,mcp23s08",
+		.data = (void *) MCP_TYPE_S08,
+	},
+	{
+		.compatible = "microchip,mcp23s17",
+		.data = (void *) MCP_TYPE_S17,
+	},
+	{
+		.compatible = "microchip,mcp23s18",
+		.data = (void *) MCP_TYPE_S18,
+	},
+/* NOTE: The use of the mcp prefix is deprecated and will be removed. */
+	{
+		.compatible = "mcp,mcp23s08",
+		.data = (void *) MCP_TYPE_S08,
+	},
+	{
+		.compatible = "mcp,mcp23s17",
+		.data = (void *) MCP_TYPE_S17,
+	},
+	{ },
+};
+MODULE_DEVICE_TABLE(of, mcp23s08_spi_of_match);
+#endif
+
 static struct spi_driver mcp23s08_driver = {
 	.probe		= mcp23s08_probe,
 	.id_table	= mcp23s08_ids,
-- 
2.25.1

