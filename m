Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1F6F21A12CA
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2020 19:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726395AbgDGRiy (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Apr 2020 13:38:54 -0400
Received: from mga11.intel.com ([192.55.52.93]:4268 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726277AbgDGRiy (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 7 Apr 2020 13:38:54 -0400
IronPort-SDR: iinTRl6bDp6O6YTiwV9kA+e+h5bPkc5iODtLJWma1mcru82PnEeqQxjPpet3bvfZ/eGMPiyMLO
 A1WSrYxq16Jw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2020 10:38:54 -0700
IronPort-SDR: MBa2yEA3FH35T+hP799krCSrEYYm7p/Kql9Lgl/vNsRCNZNA7masTAONpF1XFHS//rmcNsYlsK
 +OSvGtehoP4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,356,1580803200"; 
   d="scan'208";a="269496247"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 07 Apr 2020 10:38:53 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 94113348; Tue,  7 Apr 2020 20:38:50 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 7/9] pinctrl: mcp23s08: Make use of device properties
Date:   Tue,  7 Apr 2020 20:38:47 +0300
Message-Id: <20200407173849.43628-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200407173849.43628-1-andriy.shevchenko@linux.intel.com>
References: <20200407173849.43628-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Device property API allows to gather device resources from different sources,
such as ACPI. Convert the drivers to unleash the power of device property API.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 515d1aa32732..330c2203e0f2 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -4,6 +4,7 @@
 #include <linux/kernel.h>
 #include <linux/device.h>
 #include <linux/mutex.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/gpio/driver.h>
 #include <linux/i2c.h>
@@ -11,7 +12,6 @@
 #include <linux/slab.h>
 #include <asm/byteorder.h>
 #include <linux/interrupt.h>
-#include <linux/of_device.h>
 #include <linux/regmap.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinconf.h>
@@ -20,12 +20,12 @@
 /*
  * MCP types supported by driver
  */
-#define MCP_TYPE_S08	0
-#define MCP_TYPE_S17	1
-#define MCP_TYPE_008	2
-#define MCP_TYPE_017	3
-#define MCP_TYPE_S18    4
-#define MCP_TYPE_018    5
+#define MCP_TYPE_S08	1
+#define MCP_TYPE_S17	2
+#define MCP_TYPE_008	3
+#define MCP_TYPE_017	4
+#define MCP_TYPE_S18	5
+#define MCP_TYPE_018	6
 
 /* Registers are all 8 bits wide.
  *
@@ -757,7 +757,6 @@ static const struct i2c_device_id mcp230xx_id[] = {
 };
 MODULE_DEVICE_TABLE(i2c, mcp230xx_id);
 
-#ifdef CONFIG_OF
 static const struct of_device_id mcp23s08_i2c_of_match[] = {
 	{
 		.compatible = "microchip,mcp23008",
@@ -783,12 +782,11 @@ static const struct of_device_id mcp23s08_i2c_of_match[] = {
 	{ },
 };
 MODULE_DEVICE_TABLE(of, mcp23s08_i2c_of_match);
-#endif /* CONFIG_OF */
 
 static struct i2c_driver mcp230xx_driver = {
 	.driver = {
 		.name	= "mcp230xx",
-		.of_match_table = of_match_ptr(mcp23s08_i2c_of_match),
+		.of_match_table = mcp23s08_i2c_of_match,
 	},
 	.probe		= mcp230xx_probe,
 	.id_table	= mcp230xx_id,
@@ -942,17 +940,17 @@ static int mcp23s08_spi_regmap_init(struct mcp23s08 *mcp, struct device *dev,
 static int mcp23s08_probe(struct spi_device *spi)
 {
 	struct device *dev = &spi->dev;
+	const void *match;
 	unsigned			addr;
 	int				chips = 0;
 	struct mcp23s08_driver_data	*data;
 	int				status, type;
 	unsigned			ngpio = 0;
-	const struct			of_device_id *match;
 	u32				spi_present_mask;
 
-	match = of_match_device(of_match_ptr(mcp23s08_spi_of_match), &spi->dev);
+	match = device_get_match_data(dev);
 	if (match)
-		type = (int)(uintptr_t)match->data;
+		type = (int)(uintptr_t)match;
 	else
 		type = spi_get_device_id(spi)->driver_data;
 
@@ -1022,7 +1020,6 @@ static const struct spi_device_id mcp23s08_ids[] = {
 };
 MODULE_DEVICE_TABLE(spi, mcp23s08_ids);
 
-#ifdef CONFIG_OF
 static const struct of_device_id mcp23s08_spi_of_match[] = {
 	{
 		.compatible = "microchip,mcp23s08",
@@ -1048,14 +1045,13 @@ static const struct of_device_id mcp23s08_spi_of_match[] = {
 	{ },
 };
 MODULE_DEVICE_TABLE(of, mcp23s08_spi_of_match);
-#endif
 
 static struct spi_driver mcp23s08_driver = {
 	.probe		= mcp23s08_probe,
 	.id_table	= mcp23s08_ids,
 	.driver = {
 		.name	= "mcp23s08",
-		.of_match_table = of_match_ptr(mcp23s08_spi_of_match),
+		.of_match_table = mcp23s08_spi_of_match,
 	},
 };
 
-- 
2.25.1

