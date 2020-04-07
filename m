Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 195561A12C8
	for <lists+linux-gpio@lfdr.de>; Tue,  7 Apr 2020 19:38:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbgDGRix (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 7 Apr 2020 13:38:53 -0400
Received: from mga12.intel.com ([192.55.52.136]:42932 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726339AbgDGRix (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 7 Apr 2020 13:38:53 -0400
IronPort-SDR: 4RzxzSGR1Mc2Eiq6KXM27EeXbHQvofOHEbeWfKURpa1o4StpRy7SmhFDf+FS8ONjNoDUVKQ0X5
 IC9X4Zh1q4+g==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2020 10:38:52 -0700
IronPort-SDR: xRvooFcLZmJJh9c0giiL8g50/jgvRJBLqETisRaJGbne4k1VH0qp2+qXRAM7CRCyMctnnxjT1Z
 QMr0cHTJBptw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,356,1580803200"; 
   d="scan'208";a="397931605"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga004.jf.intel.com with ESMTP; 07 Apr 2020 10:38:51 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
        id 80772220; Tue,  7 Apr 2020 20:38:50 +0300 (EEST)
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 5/9] pinctrl: mcp23s08: Refactor mcp23s08_spi_regmap_init()
Date:   Tue,  7 Apr 2020 20:38:45 +0300
Message-Id: <20200407173849.43628-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200407173849.43628-1-andriy.shevchenko@linux.intel.com>
References: <20200407173849.43628-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

There is a lot of duplication for one small helper function.
Refactor mcp23s08_spi_regmap_init() to prepare everything first
and then register regmap at the end.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/pinctrl-mcp23s08.c | 61 ++++++++++++++----------------
 1 file changed, 28 insertions(+), 33 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-mcp23s08.c b/drivers/pinctrl/pinctrl-mcp23s08.c
index 513864c74860..07b69242a5b3 100644
--- a/drivers/pinctrl/pinctrl-mcp23s08.c
+++ b/drivers/pinctrl/pinctrl-mcp23s08.c
@@ -888,50 +888,38 @@ struct mcp23s08_driver_data {
 static int mcp23s08_spi_regmap_init(struct mcp23s08 *mcp, struct device *dev,
 				    unsigned int addr, unsigned int type)
 {
-	struct regmap_config *one_regmap_config = NULL;
+	const struct regmap_config *config;
+	struct regmap_config *copy;
+	const char *name;
 
 	switch (type) {
 	case MCP_TYPE_S08:
+		mcp->reg_shift = 0;
+		mcp->chip.ngpio = 8;
+		mcp->chip.label = devm_kasprintf(dev, GFP_KERNEL, "mcp23s08.%d",
+						 addr);
+
+		config = &mcp23x08_regmap;
+		name = devm_kasprintf(dev, GFP_KERNEL, "%d", addr);
+		break;
+
 	case MCP_TYPE_S17:
-		switch (type) {
-		case MCP_TYPE_S08:
-			one_regmap_config =
-				devm_kmemdup(dev, &mcp23x08_regmap,
-					sizeof(struct regmap_config), GFP_KERNEL);
-			mcp->reg_shift = 0;
-			mcp->chip.ngpio = 8;
-			mcp->chip.label = devm_kasprintf(dev, GFP_KERNEL,
-					"mcp23s08.%d", addr);
-			break;
-		case MCP_TYPE_S17:
-			one_regmap_config =
-				devm_kmemdup(dev, &mcp23x17_regmap,
-					sizeof(struct regmap_config), GFP_KERNEL);
-			mcp->reg_shift = 1;
-			mcp->chip.ngpio = 16;
-			mcp->chip.label = devm_kasprintf(dev, GFP_KERNEL,
-					"mcp23s17.%d", addr);
-			break;
-		}
-		if (!one_regmap_config)
-			return -ENOMEM;
+		mcp->reg_shift = 1;
+		mcp->chip.ngpio = 16;
+		mcp->chip.label = devm_kasprintf(dev, GFP_KERNEL, "mcp23s17.%d",
+						 addr);
 
-		one_regmap_config->name = devm_kasprintf(dev, GFP_KERNEL, "%d", addr);
-		mcp->regmap = devm_regmap_init(dev, &mcp23sxx_spi_regmap, mcp,
-					       one_regmap_config);
+		config = &mcp23x17_regmap;
+		name = devm_kasprintf(dev, GFP_KERNEL, "%d", addr);
 		break;
 
 	case MCP_TYPE_S18:
-		one_regmap_config =
-			devm_kmemdup(dev, &mcp23x17_regmap,
-				sizeof(struct regmap_config), GFP_KERNEL);
-		if (!one_regmap_config)
-			return -ENOMEM;
-		mcp->regmap = devm_regmap_init(dev, &mcp23sxx_spi_regmap, mcp,
-					       one_regmap_config);
 		mcp->reg_shift = 1;
 		mcp->chip.ngpio = 16;
 		mcp->chip.label = "mcp23s18";
+
+		config = &mcp23x17_regmap;
+		name = config->name;
 		break;
 
 	default:
@@ -939,6 +927,13 @@ static int mcp23s08_spi_regmap_init(struct mcp23s08 *mcp, struct device *dev,
 		return -EINVAL;
 	}
 
+	copy = devm_kmemdup(dev, &config, sizeof(config), GFP_KERNEL);
+	if (!copy)
+		return -ENOMEM;
+
+	copy->name = name;
+
+	mcp->regmap = devm_regmap_init(dev, &mcp23sxx_spi_regmap, mcp, copy);
 	if (IS_ERR(mcp->regmap))
 		return PTR_ERR(mcp->regmap);
 
-- 
2.25.1

