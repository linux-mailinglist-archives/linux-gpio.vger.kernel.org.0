Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8262D1A12D0
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2020 19:39:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbgDGRjA (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Apr 2020 13:39:00 -0400
Received: from mga09.intel.com ([134.134.136.24]:9359 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726277AbgDGRjA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 7 Apr 2020 13:39:00 -0400
IronPort-SDR: bC1iZ4jYBc6Ai59veaPt9TJ3rY0zuVXJLsst1rxGhPA4iiaWV3qx22kH+lHfxN27mex5z/5yNc
 aUBQgs4o5/Jw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2020 10:38:54 -0700
IronPort-SDR: UbV11R3M/UL19RSTSmqiHg8cYhtC4TevTl8q63Di1LhXAeTM7XeTUCb7SNt92THJcPvkupgV7h
 /Ii8ci6HgnNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,356,1580803200"; 
   d="scan'208";a="254532190"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga006.jf.intel.com with ESMTP; 07 Apr 2020 10:38:53 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id AACFF5EA; Tue,  7 Apr 2020 20:38:50 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 9/9] =?UTF-8?q?pinctrl:=20mcp23s08:=20Split=20to=20thre?= =?UTF-8?q?e=20parts:=20core,=20I=C2=B2C,=20SPI?=
Date:   Tue,  7 Apr 2020 20:38:49 +0300
Message-Id: <20200407173849.43628-9-andriy.shevchenko@linux.intel.com>
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

Split the driver to three parts: core, I²C, SPI.
No functional change intended.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/Kconfig                |  13 +-
 drivers/pinctrl/Makefile               |   2 +
 drivers/pinctrl/pinctrl-mcp23s08.c     | 458 +------------------------
 drivers/pinctrl/pinctrl-mcp23s08.h     |  52 +++
 drivers/pinctrl/pinctrl-mcp23s08_i2c.c | 124 +++++++
 drivers/pinctrl/pinctrl-mcp23s08_spi.c | 262 ++++++++++++++
 6 files changed, 459 insertions(+), 452 deletions(-)
 create mode 100644 drivers/pinctrl/pinctrl-mcp23s08.h
 create mode 100644 drivers/pinctrl/pinctrl-mcp23s08_i2c.c
 create mode 100644 drivers/pinctrl/pinctrl-mcp23s08_spi.c

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 834c59950d1c..f646f070d98f 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -172,15 +172,22 @@ config PINCTRL_GEMINI
 	select GENERIC_PINCONF
 	select MFD_SYSCON
 
+config PINCTRL_MCP23S08_I2C
+	tristate
+	select REGMAP_I2C
+
+config PINCTRL_MCP23S08_SPI
+	tristate
+	select REGMAP_SPI
+
 config PINCTRL_MCP23S08
 	tristate "Microchip MCP23xxx I/O expander"
 	depends on SPI_MASTER || I2C
-	depends on I2C || I2C=n
 	select GPIOLIB
 	select GPIOLIB_IRQCHIP
-	select REGMAP_I2C if I2C
-	select REGMAP_SPI if SPI_MASTER
 	select GENERIC_PINCONF
+	select PINCTRL_MCP23S08_I2C if I2C
+	select PINCTRL_MCP23S08_SPI if SPI_MASTER
 	help
 	  SPI/I2C driver for Microchip MCP23S08 / MCP23S17 / MCP23S18 /
 	  MCP23008 / MCP23017 / MCP23018 I/O expanders.
diff --git a/drivers/pinctrl/Makefile b/drivers/pinctrl/Makefile
index 0b36a1cfca8a..1731b2154df9 100644
--- a/drivers/pinctrl/Makefile
+++ b/drivers/pinctrl/Makefile
@@ -21,6 +21,8 @@ obj-$(CONFIG_PINCTRL_DIGICOLOR)	+= pinctrl-digicolor.o
 obj-$(CONFIG_PINCTRL_FALCON)	+= pinctrl-falcon.o
 obj-$(CONFIG_PINCTRL_GEMINI)	+= pinctrl-gemini.o
 obj-$(CONFIG_PINCTRL_MAX77620)	+= pinctrl-max77620.o
+obj-$(CONFIG_PINCTRL_MCP23S08_I2C)	+= pinctrl-mcp23s08_i2c.o
+obj-$(CONFIG_PINCTRL_MCP23S08_SPI)	+= pinctrl-mcp23s08_spi.o
 obj-$(CONFIG_PINCTRL_MCP23S08)	+= pinctrl-mcp23s08.o
 obj-$(CONFIG_PINCTRL_MESON)	+= meson/
 obj-$(CONFIG_PINCTRL_OXNAS)	+= pinctrl-oxnas.o
diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index ea8decc36d50..cb545557dcd4 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -7,9 +7,8 @@
 #include <linux/mutex.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/export.h>
 #include <linux/gpio/driver.h>
-#include <linux/i2c.h>
-#include <linux/spi/spi.h>
 #include <linux/slab.h>
 #include <asm/byteorder.h>
 #include <linux/interrupt.h>
@@ -18,15 +17,7 @@
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinconf-generic.h>
 
-/*
- * MCP types supported by driver
- */
-#define MCP_TYPE_S08	1
-#define MCP_TYPE_S17	2
-#define MCP_TYPE_008	3
-#define MCP_TYPE_017	4
-#define MCP_TYPE_S18	5
-#define MCP_TYPE_018	6
+#include "pinctrl-mcp23s08.h"
 
 /* Registers are all 8 bits wide.
  *
@@ -51,31 +42,6 @@
 #define MCP_GPIO	0x09
 #define MCP_OLAT	0x0a
 
-struct mcp23s08;
-
-struct mcp23s08 {
-	u8			addr;
-	bool			irq_active_high;
-	bool			reg_shift;
-
-	u16			irq_rise;
-	u16			irq_fall;
-	int			irq;
-	bool			irq_controller;
-	int			cached_gpio;
-	/* lock protects regmap access with bypass/cache flags */
-	struct mutex		lock;
-
-	struct gpio_chip	chip;
-	struct irq_chip		irq_chip;
-
-	struct regmap		*regmap;
-	struct device		*dev;
-
-	struct pinctrl_dev	*pctldev;
-	struct pinctrl_desc	pinctrl_desc;
-};
-
 static const struct reg_default mcp23x08_defaults[] = {
 	{.reg = MCP_IODIR,		.def = 0xff},
 	{.reg = MCP_IPOL,		.def = 0x00},
@@ -107,7 +73,7 @@ static const struct regmap_access_table mcp23x08_precious_table = {
 	.n_yes_ranges = 1,
 };
 
-static const struct regmap_config mcp23x08_regmap = {
+const struct regmap_config mcp23x08_regmap = {
 	.reg_bits = 8,
 	.val_bits = 8,
 
@@ -119,6 +85,7 @@ static const struct regmap_config mcp23x08_regmap = {
 	.cache_type = REGCACHE_FLAT,
 	.max_register = MCP_OLAT,
 };
+EXPORT_SYMBOL_GPL(mcp23x08_regmap);
 
 static const struct reg_default mcp23x16_defaults[] = {
 	{.reg = MCP_IODIR << 1,		.def = 0xffff},
@@ -151,7 +118,7 @@ static const struct regmap_access_table mcp23x16_precious_table = {
 	.n_yes_ranges = 1,
 };
 
-static const struct regmap_config mcp23x17_regmap = {
+const struct regmap_config mcp23x17_regmap = {
 	.reg_bits = 8,
 	.val_bits = 16,
 
@@ -164,6 +131,7 @@ static const struct regmap_config mcp23x17_regmap = {
 	.cache_type = REGCACHE_FLAT,
 	.val_format_endian = REGMAP_ENDIAN_LITTLE,
 };
+EXPORT_SYMBOL_GPL(mcp23x17_regmap);
 
 static int mcp_read(struct mcp23s08 *mcp, unsigned int reg, unsigned int *val)
 {
@@ -579,9 +547,8 @@ static int mcp23s08_irqchip_setup(struct mcp23s08 *mcp)
 
 /*----------------------------------------------------------------------*/
 
-static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
-			      unsigned int addr, unsigned int type,
-			      unsigned int base)
+int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
+		       unsigned int addr, unsigned int type, unsigned int base)
 {
 	int status, ret;
 	bool mirror = false;
@@ -690,411 +657,4 @@ static int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
 		dev_dbg(dev, "can't setup chip %d, --> %d\n", addr, ret);
 	return ret;
 }
-
-/*----------------------------------------------------------------------*/
-
-#if IS_ENABLED(CONFIG_I2C)
-
-static int mcp230xx_probe(struct i2c_client *client,
-				    const struct i2c_device_id *id)
-{
-	struct device *dev = &client->dev;
-	unsigned int type = id->driver_data;
-	struct mcp23s08 *mcp;
-	int status;
-
-	mcp = devm_kzalloc(&client->dev, sizeof(*mcp), GFP_KERNEL);
-	if (!mcp)
-		return -ENOMEM;
-
-	mcp->irq = client->irq;
-
-	switch (type) {
-	case MCP_TYPE_008:
-		mcp->regmap = devm_regmap_init_i2c(client, &mcp23x08_regmap);
-		mcp->reg_shift = 0;
-		mcp->chip.ngpio = 8;
-		mcp->chip.label = "mcp23008";
-		break;
-
-	case MCP_TYPE_017:
-		mcp->regmap = devm_regmap_init_i2c(client, &mcp23x17_regmap);
-		mcp->reg_shift = 1;
-		mcp->chip.ngpio = 16;
-		mcp->chip.label = "mcp23017";
-		break;
-
-	case MCP_TYPE_018:
-		mcp->regmap = devm_regmap_init_i2c(client, &mcp23x17_regmap);
-		mcp->reg_shift = 1;
-		mcp->chip.ngpio = 16;
-		mcp->chip.label = "mcp23018";
-		break;
-
-	default:
-		dev_err(dev, "invalid device type (%d)\n", type);
-		return -EINVAL;
-	}
-
-	if (IS_ERR(mcp->regmap))
-		return PTR_ERR(mcp->regmap);
-
-	mcp->pinctrl_desc.name = "mcp23xxx-pinctrl";
-
-	status = mcp23s08_probe_one(mcp, dev, client->addr, type, -1);
-	if (status)
-		return status;
-
-	i2c_set_clientdata(client, mcp);
-
-	return 0;
-}
-
-static const struct i2c_device_id mcp230xx_id[] = {
-	{ "mcp23008", MCP_TYPE_008 },
-	{ "mcp23017", MCP_TYPE_017 },
-	{ "mcp23018", MCP_TYPE_018 },
-	{ },
-};
-MODULE_DEVICE_TABLE(i2c, mcp230xx_id);
-
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
-
-static struct i2c_driver mcp230xx_driver = {
-	.driver = {
-		.name	= "mcp230xx",
-		.of_match_table = mcp23s08_i2c_of_match,
-	},
-	.probe		= mcp230xx_probe,
-	.id_table	= mcp230xx_id,
-};
-
-static int __init mcp23s08_i2c_init(void)
-{
-	return i2c_add_driver(&mcp230xx_driver);
-}
-
-static void mcp23s08_i2c_exit(void)
-{
-	i2c_del_driver(&mcp230xx_driver);
-}
-
-#else
-
-static int __init mcp23s08_i2c_init(void) { return 0; }
-static void mcp23s08_i2c_exit(void) { }
-
-#endif /* CONFIG_I2C */
-
-/*----------------------------------------------------------------------*/
-
-#ifdef CONFIG_SPI_MASTER
-
-#define MCP_MAX_DEV_PER_CS	8
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
-static int mcp23s08_spi_regmap_init(struct mcp23s08 *mcp, struct device *dev,
-				    unsigned int addr, unsigned int type)
-{
-	const struct regmap_config *config;
-	struct regmap_config *copy;
-	const char *name;
-
-	switch (type) {
-	case MCP_TYPE_S08:
-		mcp->reg_shift = 0;
-		mcp->chip.ngpio = 8;
-		mcp->chip.label = devm_kasprintf(dev, GFP_KERNEL, "mcp23s08.%d",
-						 addr);
-
-		config = &mcp23x08_regmap;
-		name = devm_kasprintf(dev, GFP_KERNEL, "%d", addr);
-		break;
-
-	case MCP_TYPE_S17:
-		mcp->reg_shift = 1;
-		mcp->chip.ngpio = 16;
-		mcp->chip.label = devm_kasprintf(dev, GFP_KERNEL, "mcp23s17.%d",
-						 addr);
-
-		config = &mcp23x17_regmap;
-		name = devm_kasprintf(dev, GFP_KERNEL, "%d", addr);
-		break;
-
-	case MCP_TYPE_S18:
-		mcp->reg_shift = 1;
-		mcp->chip.ngpio = 16;
-		mcp->chip.label = "mcp23s18";
-
-		config = &mcp23x17_regmap;
-		name = config->name;
-		break;
-
-	default:
-		dev_err(dev, "invalid device type (%d)\n", type);
-		return -EINVAL;
-	}
-
-	copy = devm_kmemdup(dev, &config, sizeof(config), GFP_KERNEL);
-	if (!copy)
-		return -ENOMEM;
-
-	copy->name = name;
-
-	mcp->regmap = devm_regmap_init(dev, &mcp23sxx_spi_regmap, mcp, copy);
-	if (IS_ERR(mcp->regmap))
-		return PTR_ERR(mcp->regmap);
-
-	return 0;
-}
-
-static int mcp23s08_probe(struct spi_device *spi)
-{
-	struct device *dev = &spi->dev;
-	unsigned long spi_present_mask;
-	const void *match;
-	int chips;
-	u32 v;
-	unsigned			addr;
-	struct mcp23s08_driver_data	*data;
-	int				status, type;
-	unsigned			ngpio = 0;
-
-	match = device_get_match_data(dev);
-	if (match)
-		type = (int)(uintptr_t)match;
-	else
-		type = spi_get_device_id(spi)->driver_data;
-
-	status = device_property_read_u32(dev, "microchip,spi-present-mask", &v);
-	if (status) {
-		status = device_property_read_u32(dev, "mcp,spi-present-mask", &v);
-		if (status) {
-			dev_err(&spi->dev, "missing spi-present-mask");
-			return status;
-		}
-	}
-	spi_present_mask = v;
-
-	if (!spi_present_mask || spi_present_mask >= BIT(MCP_MAX_DEV_PER_CS)) {
-		dev_err(&spi->dev, "invalid spi-present-mask");
-		return -ENODEV;
-	}
-
-	chips = hweight_long(spi_present_mask);
-
-	data = devm_kzalloc(&spi->dev,
-			    struct_size(data, chip, chips), GFP_KERNEL);
-	if (!data)
-		return -ENOMEM;
-
-	spi_set_drvdata(spi, data);
-
-	for_each_set_bit(addr, &spi_present_mask, MCP_MAX_DEV_PER_CS) {
-		data->mcp[addr] = &data->chip[--chips];
-		data->mcp[addr]->irq = spi->irq;
-
-		status = mcp23s08_spi_regmap_init(data->mcp[addr], dev, addr, type);
-		if (status)
-			return status;
-
-		data->mcp[addr]->pinctrl_desc.name = devm_kasprintf(dev, GFP_KERNEL,
-				"mcp23xxx-pinctrl.%d", addr);
-		if (!data->mcp[addr]->pinctrl_desc.name)
-			return -ENOMEM;
-
-		status = mcp23s08_probe_one(data->mcp[addr], dev, 0x40 | (addr << 1), type, -1);
-		if (status < 0)
-			return status;
-
-		ngpio += data->mcp[addr]->chip.ngpio;
-	}
-	data->ngpio = ngpio;
-
-	return 0;
-}
-
-static const struct spi_device_id mcp23s08_ids[] = {
-	{ "mcp23s08", MCP_TYPE_S08 },
-	{ "mcp23s17", MCP_TYPE_S17 },
-	{ "mcp23s18", MCP_TYPE_S18 },
-	{ },
-};
-MODULE_DEVICE_TABLE(spi, mcp23s08_ids);
-
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
-
-static struct spi_driver mcp23s08_driver = {
-	.probe		= mcp23s08_probe,
-	.id_table	= mcp23s08_ids,
-	.driver = {
-		.name	= "mcp23s08",
-		.of_match_table = mcp23s08_spi_of_match,
-	},
-};
-
-static int __init mcp23s08_spi_init(void)
-{
-	return spi_register_driver(&mcp23s08_driver);
-}
-
-static void mcp23s08_spi_exit(void)
-{
-	spi_unregister_driver(&mcp23s08_driver);
-}
-
-#else
-
-static int __init mcp23s08_spi_init(void) { return 0; }
-static void mcp23s08_spi_exit(void) { }
-
-#endif /* CONFIG_SPI_MASTER */
-
-/*----------------------------------------------------------------------*/
-
-static int __init mcp23s08_init(void)
-{
-	int ret;
-
-	ret = mcp23s08_spi_init();
-	if (ret)
-		goto spi_fail;
-
-	ret = mcp23s08_i2c_init();
-	if (ret)
-		goto i2c_fail;
-
-	return 0;
-
- i2c_fail:
-	mcp23s08_spi_exit();
- spi_fail:
-	return ret;
-}
-/* register after spi/i2c postcore initcall and before
- * subsys initcalls that may rely on these GPIOs
- */
-subsys_initcall(mcp23s08_init);
-
-static void __exit mcp23s08_exit(void)
-{
-	mcp23s08_spi_exit();
-	mcp23s08_i2c_exit();
-}
-module_exit(mcp23s08_exit);
-
-MODULE_LICENSE("GPL");
+EXPORT_SYMBOL_GPL(mcp23s08_probe_one);
diff --git a/drivers/pinctrl/pinctrl-mcp23s08.h b/drivers/pinctrl/pinctrl-mcp23s08.h
new file mode 100644
index 000000000000..90dc27081a3c
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-mcp23s08.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* MCP23S08 SPI/I2C GPIO driver */
+
+#include <linux/gpio/driver.h>
+#include <linux/irq.h>
+#include <linux/mutex.h>
+#include <linux/pinctrl/pinctrl.h>
+#include <linux/types.h>
+
+/*
+ * MCP types supported by driver
+ */
+#define MCP_TYPE_S08	1
+#define MCP_TYPE_S17	2
+#define MCP_TYPE_008	3
+#define MCP_TYPE_017	4
+#define MCP_TYPE_S18	5
+#define MCP_TYPE_018	6
+
+struct device;
+struct regmap;
+
+struct pinctrl_dev;
+
+struct mcp23s08 {
+	u8			addr;
+	bool			irq_active_high;
+	bool			reg_shift;
+
+	u16			irq_rise;
+	u16			irq_fall;
+	int			irq;
+	bool			irq_controller;
+	int			cached_gpio;
+	/* lock protects regmap access with bypass/cache flags */
+	struct mutex		lock;
+
+	struct gpio_chip	chip;
+	struct irq_chip		irq_chip;
+
+	struct regmap		*regmap;
+	struct device		*dev;
+
+	struct pinctrl_dev	*pctldev;
+	struct pinctrl_desc	pinctrl_desc;
+};
+
+extern const struct regmap_config mcp23x08_regmap;
+extern const struct regmap_config mcp23x17_regmap;
+
+int mcp23s08_probe_one(struct mcp23s08 *mcp, struct device *dev,
+		       unsigned int addr, unsigned int type, unsigned int base);
diff --git a/drivers/pinctrl/pinctrl-mcp23s08_i2c.c b/drivers/pinctrl/pinctrl-mcp23s08_i2c.c
new file mode 100644
index 000000000000..e0b001c8c08c
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-mcp23s08_i2c.c
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* MCP23S08 I2C GPIO driver */
+
+#include <linux/i2c.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/regmap.h>
+
+#include "pinctrl-mcp23s08.h"
+
+static int mcp230xx_probe(struct i2c_client *client, const struct i2c_device_id *id)
+{
+	struct device *dev = &client->dev;
+	unsigned int type = id->driver_data;
+	struct mcp23s08 *mcp;
+	int ret;
+
+	mcp = devm_kzalloc(dev, sizeof(*mcp), GFP_KERNEL);
+	if (!mcp)
+		return -ENOMEM;
+
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
+	mcp->irq = client->irq;
+	mcp->pinctrl_desc.name = "mcp23xxx-pinctrl";
+
+	ret = mcp23s08_probe_one(mcp, dev, client->addr, type, -1);
+	if (ret)
+		return ret;
+
+	i2c_set_clientdata(client, mcp);
+
+	return 0;
+}
+
+static const struct i2c_device_id mcp230xx_id[] = {
+	{ "mcp23008", MCP_TYPE_008 },
+	{ "mcp23017", MCP_TYPE_017 },
+	{ "mcp23018", MCP_TYPE_018 },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, mcp230xx_id);
+
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
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mcp23s08_i2c_of_match);
+
+static struct i2c_driver mcp230xx_driver = {
+	.driver = {
+		.name	= "mcp230xx",
+		.of_match_table = mcp23s08_i2c_of_match,
+	},
+	.probe		= mcp230xx_probe,
+	.id_table	= mcp230xx_id,
+};
+
+static int __init mcp23s08_i2c_init(void)
+{
+	return i2c_add_driver(&mcp230xx_driver);
+}
+
+/*
+ * Register after I²C postcore initcall and before
+ * subsys initcalls that may rely on these GPIOs.
+ */
+subsys_initcall(mcp23s08_i2c_init);
+
+static void mcp23s08_i2c_exit(void)
+{
+	i2c_del_driver(&mcp230xx_driver);
+}
+module_exit(mcp23s08_i2c_exit);
+
+MODULE_LICENSE("GPL");
diff --git a/drivers/pinctrl/pinctrl-mcp23s08_spi.c b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
new file mode 100644
index 000000000000..e06fb885fd2b
--- /dev/null
+++ b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
@@ -0,0 +1,262 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* MCP23S08 SPI GPIO driver */
+
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/spi/spi.h>
+
+#include "pinctrl-mcp23s08.h"
+
+#define MCP_MAX_DEV_PER_CS	8
+
+/*
+ * A given spi_device can represent up to eight mcp23sxx chips
+ * sharing the same chipselect but using different addresses
+ * (e.g. chips #0 and #3 might be populated, but not #1 or #2).
+ * Driver data holds all the per-chip data.
+ */
+struct mcp23s08_driver_data {
+	unsigned		ngpio;
+	struct mcp23s08		*mcp[8];
+	struct mcp23s08		chip[];
+};
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
+static int mcp23s08_spi_regmap_init(struct mcp23s08 *mcp, struct device *dev,
+				    unsigned int addr, unsigned int type)
+{
+	const struct regmap_config *config;
+	struct regmap_config *copy;
+	const char *name;
+
+	switch (type) {
+	case MCP_TYPE_S08:
+		mcp->reg_shift = 0;
+		mcp->chip.ngpio = 8;
+		mcp->chip.label = devm_kasprintf(dev, GFP_KERNEL, "mcp23s08.%d", addr);
+
+		config = &mcp23x08_regmap;
+		name = devm_kasprintf(dev, GFP_KERNEL, "%d", addr);
+		break;
+
+	case MCP_TYPE_S17:
+		mcp->reg_shift = 1;
+		mcp->chip.ngpio = 16;
+		mcp->chip.label = devm_kasprintf(dev, GFP_KERNEL, "mcp23s17.%d", addr);
+
+		config = &mcp23x17_regmap;
+		name = devm_kasprintf(dev, GFP_KERNEL, "%d", addr);
+		break;
+
+	case MCP_TYPE_S18:
+		mcp->reg_shift = 1;
+		mcp->chip.ngpio = 16;
+		mcp->chip.label = "mcp23s18";
+
+		config = &mcp23x17_regmap;
+		name = config->name;
+		break;
+
+	default:
+		dev_err(dev, "invalid device type (%d)\n", type);
+		return -EINVAL;
+	}
+
+	copy = devm_kmemdup(dev, &config, sizeof(config), GFP_KERNEL);
+	if (!copy)
+		return -ENOMEM;
+
+	copy->name = name;
+
+	mcp->regmap = devm_regmap_init(dev, &mcp23sxx_spi_regmap, mcp, copy);
+	if (IS_ERR(mcp->regmap))
+		return PTR_ERR(mcp->regmap);
+
+	return 0;
+}
+
+static int mcp23s08_probe(struct spi_device *spi)
+{
+	struct device *dev = &spi->dev;
+	struct mcp23s08_driver_data *data;
+	unsigned long spi_present_mask;
+	const void *match;
+	unsigned int addr;
+	unsigned int ngpio = 0;
+	int chips;
+	int type;
+	int ret;
+	u32 v;
+
+	match = device_get_match_data(dev);
+	if (match)
+		type = (int)(uintptr_t)match;
+	else
+		type = spi_get_device_id(spi)->driver_data;
+
+	ret = device_property_read_u32(dev, "microchip,spi-present-mask", &v);
+	if (ret) {
+		ret = device_property_read_u32(dev, "mcp,spi-present-mask", &v);
+		if (ret) {
+			dev_err(dev, "missing spi-present-mask");
+			return ret;
+		}
+	}
+	spi_present_mask = v;
+
+	if (!spi_present_mask || spi_present_mask >= BIT(MCP_MAX_DEV_PER_CS)) {
+		dev_err(dev, "invalid spi-present-mask");
+		return -ENODEV;
+	}
+
+	chips = hweight_long(spi_present_mask);
+
+	data = devm_kzalloc(dev, struct_size(data, chip, chips), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	spi_set_drvdata(spi, data);
+
+	for_each_set_bit(addr, &spi_present_mask, MCP_MAX_DEV_PER_CS) {
+		data->mcp[addr] = &data->chip[--chips];
+		data->mcp[addr]->irq = spi->irq;
+
+		ret = mcp23s08_spi_regmap_init(data->mcp[addr], dev, addr, type);
+		if (ret)
+			return ret;
+
+		data->mcp[addr]->pinctrl_desc.name = devm_kasprintf(dev, GFP_KERNEL,
+								    "mcp23xxx-pinctrl.%d",
+								    addr);
+		if (!data->mcp[addr]->pinctrl_desc.name)
+			return -ENOMEM;
+
+		ret = mcp23s08_probe_one(data->mcp[addr], dev, 0x40 | (addr << 1), type, -1);
+		if (ret < 0)
+			return ret;
+
+		ngpio += data->mcp[addr]->chip.ngpio;
+	}
+	data->ngpio = ngpio;
+
+	return 0;
+}
+
+static const struct spi_device_id mcp23s08_ids[] = {
+	{ "mcp23s08", MCP_TYPE_S08 },
+	{ "mcp23s17", MCP_TYPE_S17 },
+	{ "mcp23s18", MCP_TYPE_S18 },
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, mcp23s08_ids);
+
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
+	{ }
+};
+MODULE_DEVICE_TABLE(of, mcp23s08_spi_of_match);
+
+static struct spi_driver mcp23s08_driver = {
+	.probe		= mcp23s08_probe,
+	.id_table	= mcp23s08_ids,
+	.driver = {
+		.name	= "mcp23s08",
+		.of_match_table = mcp23s08_spi_of_match,
+	},
+};
+
+static int __init mcp23s08_spi_init(void)
+{
+	return spi_register_driver(&mcp23s08_driver);
+}
+
+/*
+ * Register after SPI postcore initcall and before
+ * subsys initcalls that may rely on these GPIOs.
+ */
+subsys_initcall(mcp23s08_spi_init);
+
+static void mcp23s08_spi_exit(void)
+{
+	spi_unregister_driver(&mcp23s08_driver);
+}
+module_exit(mcp23s08_spi_exit);
+
+MODULE_LICENSE("GPL");
-- 
2.25.1

