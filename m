Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 969751A12C9
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2020 19:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726339AbgDGRiy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Apr 2020 13:38:54 -0400
Received: from mga11.intel.com ([192.55.52.93]:4268 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726277AbgDGRiy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 7 Apr 2020 13:38:54 -0400
IronPort-SDR: pi015Xo1m7q+FclUSYXmqiMZFDq9dmwL6ea0FQLai63T1p7CoHFjedEDaNwaeHf3YTT7fTz7zT
 sD/D7zlwpC8Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2020 10:38:52 -0700
IronPort-SDR: d51hcr/U0rpA5pLxNjep/lX30s1ltADK6oY3CorRIyb3pGNdeELm8hXbFZDGHOg/MGPorh9LHk
 FDMbPskY8JaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,356,1580803200"; 
   d="scan'208";a="269496242"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 07 Apr 2020 10:38:51 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 4B04579; Tue,  7 Apr 2020 20:38:50 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/9] pinctrl: mcp23s08: Get rid of legacy platform data
Date:   Tue,  7 Apr 2020 20:38:41 +0300
Message-Id: <20200407173849.43628-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Platform data is a legacy interface to supply device properties
to the driver. In this case we even don't have in-kernel users
for it. Just remove it for good.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 42 +++++++++---------------------
 include/linux/spi/mcp23s08.h       | 18 -------------
 2 files changed, 12 insertions(+), 48 deletions(-)
 delete mode 100644 include/linux/spi/mcp23s08.h

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 3a235487e38d..2c8b8c45b70e 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -8,7 +8,6 @@
 #include <linux/gpio/driver.h>
 #include <linux/i2c.h>
 #include <linux/spi/spi.h>
-#include <linux/spi/mcp23s08.h>
 #include <linux/slab.h>
 #include <asm/byteorder.h>
 #include <linux/interrupt.h>
@@ -914,16 +913,9 @@ MODULE_DEVICE_TABLE(of, mcp23s08_i2c_of_match);
 static int mcp230xx_probe(struct i2c_client *client,
 				    const struct i2c_device_id *id)
 {
-	struct mcp23s08_platform_data *pdata, local_pdata;
 	struct mcp23s08 *mcp;
 	int status;
 
-	pdata = dev_get_platdata(&client->dev);
-	if (!pdata) {
-		pdata = &local_pdata;
-		pdata->base = -1;
-	}
-
 	mcp = devm_kzalloc(&client->dev, sizeof(*mcp), GFP_KERNEL);
 	if (!mcp)
 		return -ENOMEM;
@@ -937,7 +929,7 @@ static int mcp230xx_probe(struct i2c_client *client,
 	mcp->irq_chip.irq_bus_sync_unlock = mcp23s08_irq_bus_unlock;
 
 	status = mcp23s08_probe_one(mcp, &client->dev, client, client->addr,
-				    id->driver_data, pdata->base, 0);
+				    id->driver_data, -1, 0);
 	if (status)
 		return status;
 
@@ -986,13 +978,13 @@ static void mcp23s08_i2c_exit(void) { }
 
 static int mcp23s08_probe(struct spi_device *spi)
 {
-	struct mcp23s08_platform_data	*pdata, local_pdata;
 	unsigned			addr;
 	int				chips = 0;
 	struct mcp23s08_driver_data	*data;
 	int				status, type;
 	unsigned			ngpio = 0;
 	const struct			of_device_id *match;
+	u32				spi_present_mask;
 
 	match = of_match_device(of_match_ptr(mcp23s08_spi_of_match), &spi->dev);
 	if (match)
@@ -1000,32 +992,24 @@ static int mcp23s08_probe(struct spi_device *spi)
 	else
 		type = spi_get_device_id(spi)->driver_data;
 
-	pdata = dev_get_platdata(&spi->dev);
-	if (!pdata) {
-		pdata = &local_pdata;
-		pdata->base = -1;
-
+	status = device_property_read_u32(&spi->dev,
+			"microchip,spi-present-mask", &spi_present_mask);
+	if (status) {
 		status = device_property_read_u32(&spi->dev,
-			"microchip,spi-present-mask", &pdata->spi_present_mask);
+				"mcp,spi-present-mask", &spi_present_mask);
 		if (status) {
-			status = device_property_read_u32(&spi->dev,
-				"mcp,spi-present-mask",
-				&pdata->spi_present_mask);
-
-			if (status) {
-				dev_err(&spi->dev, "missing spi-present-mask");
-				return -ENODEV;
-			}
+			dev_err(&spi->dev, "missing spi-present-mask");
+			return -ENODEV;
 		}
 	}
 
-	if (!pdata->spi_present_mask || pdata->spi_present_mask > 0xff) {
+	if (!spi_present_mask || spi_present_mask > 0xff) {
 		dev_err(&spi->dev, "invalid spi-present-mask");
 		return -ENODEV;
 	}
 
 	for (addr = 0; addr < MCP_MAX_DEV_PER_CS; addr++) {
-		if (pdata->spi_present_mask & BIT(addr))
+		if (spi_present_mask & BIT(addr))
 			chips++;
 	}
 
@@ -1040,7 +1024,7 @@ static int mcp23s08_probe(struct spi_device *spi)
 	spi_set_drvdata(spi, data);
 
 	for (addr = 0; addr < MCP_MAX_DEV_PER_CS; addr++) {
-		if (!(pdata->spi_present_mask & BIT(addr)))
+		if (!(spi_present_mask & BIT(addr)))
 			continue;
 		chips--;
 		data->mcp[addr] = &data->chip[chips];
@@ -1054,12 +1038,10 @@ static int mcp23s08_probe(struct spi_device *spi)
 			mcp23s08_irq_bus_unlock;
 		status = mcp23s08_probe_one(data->mcp[addr], &spi->dev, spi,
 					    0x40 | (addr << 1), type,
-					    pdata->base, addr);
+					    -1, addr);
 		if (status < 0)
 			return status;
 
-		if (pdata->base != -1)
-			pdata->base += data->mcp[addr]->chip.ngpio;
 		ngpio += data->mcp[addr]->chip.ngpio;
 	}
 	data->ngpio = ngpio;
diff --git a/include/linux/spi/mcp23s08.h b/include/linux/spi/mcp23s08.h
deleted file mode 100644
index 738a45b435f2..000000000000
--- a/include/linux/spi/mcp23s08.h
+++ /dev/null
@@ -1,18 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-struct mcp23s08_platform_data {
-	/* For mcp23s08, up to 4 slaves (numbered 0..3) can share one SPI
-	 * chipselect, each providing 1 gpio_chip instance with 8 gpios.
-	 * For mpc23s17, up to 8 slaves (numbered 0..7) can share one SPI
-	 * chipselect, each providing 1 gpio_chip (port A + port B) with
-	 * 16 gpios.
-	 */
-	u32 spi_present_mask;
-
-	/* "base" is the number of the first GPIO or -1 for dynamic
-	 * assignment. If there are gaps in chip addressing the GPIO
-	 * numbers are sequential .. so for example if only slaves 0
-	 * and 3 are present, their GPIOs range from base to base+15
-	 * (or base+31 for s17 variant).
-	 */
-	unsigned	base;
-};
-- 
2.25.1

