Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 058722E1AE3
	for <lists+linux-gpio@lfdr.de>; Wed, 23 Dec 2020 11:26:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728329AbgLWKXW (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 23 Dec 2020 05:23:22 -0500
Received: from relmlor1.renesas.com ([210.160.252.171]:5941 "EHLO
        relmlie5.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728264AbgLWKXV (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 23 Dec 2020 05:23:21 -0500
X-IronPort-AV: E=Sophos;i="5.78,441,1599490800"; 
   d="scan'208";a="66928582"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 23 Dec 2020 19:22:49 +0900
Received: from localhost.localdomain (unknown [10.166.252.89])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 7F6824255D37;
        Wed, 23 Dec 2020 19:22:49 +0900 (JST)
From:   Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To:     marek.vasut+renesas@gmail.com, lee.jones@linaro.org,
        matti.vaittinen@fi.rohmeurope.com, lgirdwood@gmail.com,
        broonie@kernel.org, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com
Cc:     khiem.nguyen.xt@renesas.com, linux-power@fi.rohmeurope.com,
        linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v6 04/12] regulator: bd9571mwv: rid of using struct bd9571mwv
Date:   Wed, 23 Dec 2020 19:22:35 +0900
Message-Id: <1608718963-21818-5-git-send-email-yoshihiro.shimoda.uh@renesas.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1608718963-21818-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1608718963-21818-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

To simplify this driver, use dev_get_regmap() and
rid of using struct bd9571mwv.

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Reviewed-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/regulator/bd9571mwv-regulator.c | 49 +++++++++++++++++----------------
 1 file changed, 26 insertions(+), 23 deletions(-)

diff --git a/drivers/regulator/bd9571mwv-regulator.c b/drivers/regulator/bd9571mwv-regulator.c
index e690c2c..42b6a70 100644
--- a/drivers/regulator/bd9571mwv-regulator.c
+++ b/drivers/regulator/bd9571mwv-regulator.c
@@ -17,7 +17,7 @@
 #include <linux/mfd/bd9571mwv.h>
 
 struct bd9571mwv_reg {
-	struct bd9571mwv *bd;
+	struct regmap *regmap;
 
 	/* DDR Backup Power */
 	u8 bkup_mode_cnt_keepon;	/* from "rohm,ddr-backup-power" */
@@ -137,26 +137,30 @@ static const struct regulator_desc regulators[] = {
 };
 
 #ifdef CONFIG_PM_SLEEP
-static int bd9571mwv_bkup_mode_read(struct bd9571mwv *bd, unsigned int *mode)
+static int bd9571mwv_bkup_mode_read(struct bd9571mwv_reg *bdreg,
+				    unsigned int *mode)
 {
 	int ret;
 
-	ret = regmap_read(bd->regmap, BD9571MWV_BKUP_MODE_CNT, mode);
+	ret = regmap_read(bdreg->regmap, BD9571MWV_BKUP_MODE_CNT, mode);
 	if (ret) {
-		dev_err(bd->dev, "failed to read backup mode (%d)\n", ret);
+		dev_err(regmap_get_device(bdreg->regmap),
+			"failed to read backup mode (%d)\n", ret);
 		return ret;
 	}
 
 	return 0;
 }
 
-static int bd9571mwv_bkup_mode_write(struct bd9571mwv *bd, unsigned int mode)
+static int bd9571mwv_bkup_mode_write(struct bd9571mwv_reg *bdreg,
+				     unsigned int mode)
 {
 	int ret;
 
-	ret = regmap_write(bd->regmap, BD9571MWV_BKUP_MODE_CNT, mode);
+	ret = regmap_write(bdreg->regmap, BD9571MWV_BKUP_MODE_CNT, mode);
 	if (ret) {
-		dev_err(bd->dev, "failed to configure backup mode 0x%x (%d)\n",
+		dev_err(regmap_get_device(bdreg->regmap),
+			"failed to configure backup mode 0x%x (%d)\n",
 			mode, ret);
 		return ret;
 	}
@@ -194,7 +198,7 @@ static ssize_t backup_mode_store(struct device *dev,
 	 * Configure DDR Backup Mode, to change the role of the accessory power
 	 * switch from a power switch to a wake-up switch, or vice versa
 	 */
-	ret = bd9571mwv_bkup_mode_read(bdreg->bd, &mode);
+	ret = bd9571mwv_bkup_mode_read(bdreg, &mode);
 	if (ret)
 		return ret;
 
@@ -202,7 +206,7 @@ static ssize_t backup_mode_store(struct device *dev,
 	if (bdreg->bkup_mode_enabled)
 		mode |= bdreg->bkup_mode_cnt_keepon;
 
-	ret = bd9571mwv_bkup_mode_write(bdreg->bd, mode);
+	ret = bd9571mwv_bkup_mode_write(bdreg, mode);
 	if (ret)
 		return ret;
 
@@ -221,7 +225,7 @@ static int bd9571mwv_suspend(struct device *dev)
 		return 0;
 
 	/* Save DDR Backup Mode */
-	ret = bd9571mwv_bkup_mode_read(bdreg->bd, &mode);
+	ret = bd9571mwv_bkup_mode_read(bdreg, &mode);
 	if (ret)
 		return ret;
 
@@ -235,7 +239,7 @@ static int bd9571mwv_suspend(struct device *dev)
 	mode |= bdreg->bkup_mode_cnt_keepon;
 
 	if (mode != bdreg->bkup_mode_cnt_saved)
-		return bd9571mwv_bkup_mode_write(bdreg->bd, mode);
+		return bd9571mwv_bkup_mode_write(bdreg, mode);
 
 	return 0;
 }
@@ -248,7 +252,7 @@ static int bd9571mwv_resume(struct device *dev)
 		return 0;
 
 	/* Restore DDR Backup Mode */
-	return bd9571mwv_bkup_mode_write(bdreg->bd, bdreg->bkup_mode_cnt_saved);
+	return bd9571mwv_bkup_mode_write(bdreg, bdreg->bkup_mode_cnt_saved);
 }
 
 static const struct dev_pm_ops bd9571mwv_pm  = {
@@ -268,7 +272,6 @@ static int bd9571mwv_regulator_remove(struct platform_device *pdev)
 
 static int bd9571mwv_regulator_probe(struct platform_device *pdev)
 {
-	struct bd9571mwv *bd = dev_get_drvdata(pdev->dev.parent);
 	struct regulator_config config = { };
 	struct bd9571mwv_reg *bdreg;
 	struct regulator_dev *rdev;
@@ -279,40 +282,40 @@ static int bd9571mwv_regulator_probe(struct platform_device *pdev)
 	if (!bdreg)
 		return -ENOMEM;
 
-	bdreg->bd = bd;
+	bdreg->regmap = dev_get_regmap(pdev->dev.parent, NULL);
 
 	platform_set_drvdata(pdev, bdreg);
 
 	config.dev = &pdev->dev;
-	config.dev->of_node = bd->dev->of_node;
-	config.driver_data = bd;
-	config.regmap = bd->regmap;
+	config.dev->of_node = pdev->dev.parent->of_node;
+	config.driver_data = bdreg;
+	config.regmap = bdreg->regmap;
 
 	for (i = 0; i < ARRAY_SIZE(regulators); i++) {
 		rdev = devm_regulator_register(&pdev->dev, &regulators[i],
 					       &config);
 		if (IS_ERR(rdev)) {
-			dev_err(bd->dev, "failed to register %s regulator\n",
+			dev_err(&pdev->dev, "failed to register %s regulator\n",
 				pdev->name);
 			return PTR_ERR(rdev);
 		}
 	}
 
 	val = 0;
-	of_property_read_u32(bd->dev->of_node, "rohm,ddr-backup-power", &val);
+	of_property_read_u32(config.dev->of_node, "rohm,ddr-backup-power", &val);
 	if (val & ~BD9571MWV_BKUP_MODE_CNT_KEEPON_MASK) {
-		dev_err(bd->dev, "invalid %s mode %u\n",
+		dev_err(&pdev->dev, "invalid %s mode %u\n",
 			"rohm,ddr-backup-power", val);
 		return -EINVAL;
 	}
 	bdreg->bkup_mode_cnt_keepon = val;
 
-	bdreg->rstbmode_level = of_property_read_bool(bd->dev->of_node,
+	bdreg->rstbmode_level = of_property_read_bool(config.dev->of_node,
 						      "rohm,rstbmode-level");
-	bdreg->rstbmode_pulse = of_property_read_bool(bd->dev->of_node,
+	bdreg->rstbmode_pulse = of_property_read_bool(config.dev->of_node,
 						      "rohm,rstbmode-pulse");
 	if (bdreg->rstbmode_level && bdreg->rstbmode_pulse) {
-		dev_err(bd->dev, "only one rohm,rstbmode-* may be specified");
+		dev_err(&pdev->dev, "only one rohm,rstbmode-* may be specified");
 		return -EINVAL;
 	}
 
-- 
2.7.4

