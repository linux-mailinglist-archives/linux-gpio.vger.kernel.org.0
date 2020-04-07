Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B4F31A12CD
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2020 19:38:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726380AbgDGRi4 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Apr 2020 13:38:56 -0400
Received: from mga06.intel.com ([134.134.136.31]:38265 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726393AbgDGRi4 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 7 Apr 2020 13:38:56 -0400
IronPort-SDR: 0IUIQWr0mRj4YuWKO0a4UHafBMU3JCown1Ujk1qx/VcPPRV/7PrH2CvWeNqqe+bpjeMWQcbcay
 qIhZnzSThN7Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2020 10:38:54 -0700
IronPort-SDR: WqsJsKgRnX86lgafjox08K2UecApAgLhr50zPzTAgksrRS+g6IkPN2Z72mL9kFR8Nef77N0zrv
 MO7LY8AiVfIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,356,1580803200"; 
   d="scan'208";a="361602120"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga001.fm.intel.com with ESMTP; 07 Apr 2020 10:38:53 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 98F11291; Tue,  7 Apr 2020 20:38:50 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 8/9] pinctrl: mcp23s08: Use for_each_set_bit() and hweight_long()
Date:   Tue,  7 Apr 2020 20:38:48 +0300
Message-Id: <20200407173849.43628-8-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200407173849.43628-1-andriy.shevchenko@linux.intel.com>
References: <20200407173849.43628-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Here is a simplification of SPI code by using for_each_set_bit() and
hweight_long() library functions.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 30 +++++++++++-------------------
 1 file changed, 11 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 330c2203e0f2..ea8decc36d50 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /* MCP23S08 SPI/I2C GPIO driver */
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/device.h>
 #include <linux/mutex.h>
@@ -940,13 +941,14 @@ static int mcp23s08_spi_regmap_init(struct mcp23s08 *mcp, struct device *dev,
 static int mcp23s08_probe(struct spi_device *spi)
 {
 	struct device *dev = &spi->dev;
+	unsigned long spi_present_mask;
 	const void *match;
+	int chips;
+	u32 v;
 	unsigned			addr;
-	int				chips = 0;
 	struct mcp23s08_driver_data	*data;
 	int				status, type;
 	unsigned			ngpio = 0;
-	u32				spi_present_mask;
 
 	match = device_get_match_data(dev);
 	if (match)
@@ -954,29 +956,22 @@ static int mcp23s08_probe(struct spi_device *spi)
 	else
 		type = spi_get_device_id(spi)->driver_data;
 
-	status = device_property_read_u32(&spi->dev,
-			"microchip,spi-present-mask", &spi_present_mask);
+	status = device_property_read_u32(dev, "microchip,spi-present-mask", &v);
 	if (status) {
-		status = device_property_read_u32(&spi->dev,
-				"mcp,spi-present-mask", &spi_present_mask);
+		status = device_property_read_u32(dev, "mcp,spi-present-mask", &v);
 		if (status) {
 			dev_err(&spi->dev, "missing spi-present-mask");
 			return status;
 		}
 	}
+	spi_present_mask = v;
 
-	if (!spi_present_mask || spi_present_mask > 0xff) {
+	if (!spi_present_mask || spi_present_mask >= BIT(MCP_MAX_DEV_PER_CS)) {
 		dev_err(&spi->dev, "invalid spi-present-mask");
 		return -ENODEV;
 	}
 
-	for (addr = 0; addr < MCP_MAX_DEV_PER_CS; addr++) {
-		if (spi_present_mask & BIT(addr))
-			chips++;
-	}
-
-	if (!chips)
-		return -ENODEV;
+	chips = hweight_long(spi_present_mask);
 
 	data = devm_kzalloc(&spi->dev,
 			    struct_size(data, chip, chips), GFP_KERNEL);
@@ -985,11 +980,8 @@ static int mcp23s08_probe(struct spi_device *spi)
 
 	spi_set_drvdata(spi, data);
 
-	for (addr = 0; addr < MCP_MAX_DEV_PER_CS; addr++) {
-		if (!(spi_present_mask & BIT(addr)))
-			continue;
-		chips--;
-		data->mcp[addr] = &data->chip[chips];
+	for_each_set_bit(addr, &spi_present_mask, MCP_MAX_DEV_PER_CS) {
+		data->mcp[addr] = &data->chip[--chips];
 		data->mcp[addr]->irq = spi->irq;
 
 		status = mcp23s08_spi_regmap_init(data->mcp[addr], dev, addr, type);
-- 
2.25.1

