Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 085BE2E0995
	for <lists+linux-gpio@lfdr.de>; Tue, 22 Dec 2020 12:24:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbgLVLXe (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Tue, 22 Dec 2020 06:23:34 -0500
Received: from relmlor2.renesas.com ([210.160.252.172]:59808 "EHLO
        relmlie6.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726491AbgLVLW7 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 22 Dec 2020 06:22:59 -0500
X-IronPort-AV: E=Sophos;i="5.78,438,1599490800"; 
   d="scan'208";a="66595835"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie6.idc.renesas.com with ESMTP; 22 Dec 2020 20:22:26 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir5.idc.renesas.com (Postfix) with ESMTP id 489B04006CD0;
        Tue, 22 Dec 2020 20:22:26 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     marek.vasut+renesas@gmail.com, lee.jones@linaro.org,
        matti.vaittinen@fi.rohmeurope.com, lgirdwood@gmail.com,
        broonie@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     khiem.nguyen.xt@renesas.com, linux-power@fi.rohmeurope.com,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v5 05/12] regulator: bd9571mwv: Add BD9574MWF support
Date:   Tue, 22 Dec 2020 20:22:12 +0900
Message-Id: <1608636139-564-6-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608636139-564-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1608636139-564-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Add support for BD9574MWF which is silimar chip with BD9571MWV.
Note that we don't support voltage rails VD{09,18,25,33} by this
driver on BD9574. The VD09 voltage could be read from PMIC but that
is not supported by this commit.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/regulator/bd9571mwv-regulator.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/bd9571mwv-regulator.c b/drivers/regulator/bd9571mwv-regulator.c
index 42b6a70..7b0cd08 100644
--- a/drivers/regulator/bd9571mwv-regulator.c
+++ b/drivers/regulator/bd9571mwv-regulator.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * ROHM BD9571MWV-M regulator driver
+ * ROHM BD9571MWV-M and BD9574MWF-M regulator driver
  *
  * Copyright (C) 2017 Marek Vasut <marek.vasut+renesas@gmail.com>
  *
@@ -9,6 +9,7 @@
  * NOTE: VD09 is missing
  */
 
+#include <linux/mfd/rohm-generic.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -277,6 +278,7 @@ static int bd9571mwv_regulator_probe(struct platform_device *pdev)
 	struct regulator_dev *rdev;
 	unsigned int val;
 	int i;
+	enum rohm_chip_type chip = platform_get_device_id(pdev)->driver_data;
 
 	bdreg = devm_kzalloc(&pdev->dev, sizeof(*bdreg), GFP_KERNEL);
 	if (!bdreg)
@@ -292,6 +294,9 @@ static int bd9571mwv_regulator_probe(struct platform_device *pdev)
 	config.regmap = bdreg->regmap;
 
 	for (i = 0; i < ARRAY_SIZE(regulators); i++) {
+		/* BD9574MWF supports DVFS only */
+		if (chip == ROHM_CHIP_TYPE_BD9574 && regulators[i].id != DVFS)
+			continue;
 		rdev = devm_regulator_register(&pdev->dev, &regulators[i],
 					       &config);
 		if (IS_ERR(rdev)) {
@@ -339,7 +344,8 @@ static int bd9571mwv_regulator_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id bd9571mwv_regulator_id_table[] = {
-	{ "bd9571mwv-regulator", },
+	{ "bd9571mwv-regulator", ROHM_CHIP_TYPE_BD9571 },
+	{ "bd9574mwf-regulator", ROHM_CHIP_TYPE_BD9574 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(platform, bd9571mwv_regulator_id_table);
-- 
2.7.4

