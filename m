Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 50CD9577DD6
	for <lists+linux-gpio@lfdr.de>; Mon, 18 Jul 2022 10:47:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233314AbiGRIrg (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 18 Jul 2022 04:47:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233571AbiGRIrg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Jul 2022 04:47:36 -0400
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68809B1C0
        for <linux-gpio@vger.kernel.org>; Mon, 18 Jul 2022 01:47:35 -0700 (PDT)
Received: from inva021.nxp.com (localhost [127.0.0.1])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 201EF201D60;
        Mon, 18 Jul 2022 10:47:34 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
        by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id CD157201D5B;
        Mon, 18 Jul 2022 10:47:33 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 56F121820F5D;
        Mon, 18 Jul 2022 16:47:31 +0800 (+08)
From:   haibo.chen@nxp.com
To:     linus.walleij@linaro.org, brgl@bgdev.pl, marek.vasut@gmail.com
Cc:     linux-gpio@vger.kernel.org, haibo.chen@nxp.com, linux-imx@nxp.com
Subject: [PATCH 2/3] gpio: pca953x: use the correct range when do regmap sync
Date:   Mon, 18 Jul 2022 16:31:42 +0800
Message-Id: <1658133103-23394-2-git-send-email-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1658133103-23394-1-git-send-email-haibo.chen@nxp.com>
References: <1658133103-23394-1-git-send-email-haibo.chen@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Haibo Chen <haibo.chen@nxp.com>

regmap will sync a range of registers, here use the correct range
to make sure the sync do not touch other unexpected registers.

Find on pca9557pw on imx8qxp/dxl evk board, this device support
8 pin, so only need one register(8 bits) to cover all the 8 pins's
property setting. But when sync the output, we find it actually
update two registers, output register and the following register.

Fixes: b76574300504 ("gpio: pca953x: Restore registers after suspend/resume cycle")
Fixes: ec82d1eba346 ("gpio: pca953x: Zap ad-hoc reg_output cache")
Fixes: 0f25fda840a9 ("gpio: pca953x: Zap ad-hoc reg_direction cache")
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/gpio/gpio-pca953x.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 7209f69a8e8d..18888ec24d04 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -912,12 +912,12 @@ static int device_pca95xx_init(struct pca953x_chip *chip, u32 invert)
 	int ret;
 
 	ret = regcache_sync_region(chip->regmap, chip->regs->output,
-				   chip->regs->output + NBANK(chip));
+				   chip->regs->output + NBANK(chip) - 1);
 	if (ret)
 		goto out;
 
 	ret = regcache_sync_region(chip->regmap, chip->regs->direction,
-				   chip->regs->direction + NBANK(chip));
+				   chip->regs->direction + NBANK(chip) - 1);
 	if (ret)
 		goto out;
 
@@ -1130,14 +1130,14 @@ static int pca953x_regcache_sync(struct device *dev)
 	 * sync these registers first and only then sync the rest.
 	 */
 	regaddr = pca953x_recalc_addr(chip, chip->regs->direction, 0);
-	ret = regcache_sync_region(chip->regmap, regaddr, regaddr + NBANK(chip));
+	ret = regcache_sync_region(chip->regmap, regaddr, regaddr + NBANK(chip) - 1);
 	if (ret) {
 		dev_err(dev, "Failed to sync GPIO dir registers: %d\n", ret);
 		return ret;
 	}
 
 	regaddr = pca953x_recalc_addr(chip, chip->regs->output, 0);
-	ret = regcache_sync_region(chip->regmap, regaddr, regaddr + NBANK(chip));
+	ret = regcache_sync_region(chip->regmap, regaddr, regaddr + NBANK(chip) - 1);
 	if (ret) {
 		dev_err(dev, "Failed to sync GPIO out registers: %d\n", ret);
 		return ret;
@@ -1147,7 +1147,7 @@ static int pca953x_regcache_sync(struct device *dev)
 	if (chip->driver_data & PCA_PCAL) {
 		regaddr = pca953x_recalc_addr(chip, PCAL953X_IN_LATCH, 0);
 		ret = regcache_sync_region(chip->regmap, regaddr,
-					   regaddr + NBANK(chip));
+					   regaddr + NBANK(chip) - 1);
 		if (ret) {
 			dev_err(dev, "Failed to sync INT latch registers: %d\n",
 				ret);
@@ -1156,7 +1156,7 @@ static int pca953x_regcache_sync(struct device *dev)
 
 		regaddr = pca953x_recalc_addr(chip, PCAL953X_INT_MASK, 0);
 		ret = regcache_sync_region(chip->regmap, regaddr,
-					   regaddr + NBANK(chip));
+					   regaddr + NBANK(chip) - 1);
 		if (ret) {
 			dev_err(dev, "Failed to sync INT mask registers: %d\n",
 				ret);
-- 
2.25.1

