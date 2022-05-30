Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 58630537987
	for <lists+linux-gpio@lfdr.de>; Mon, 30 May 2022 13:02:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231345AbiE3LCG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Mon, 30 May 2022 07:02:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235583AbiE3LCF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 30 May 2022 07:02:05 -0400
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 829AF261E
        for <linux-gpio@vger.kernel.org>; Mon, 30 May 2022 04:02:03 -0700 (PDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A475B1A0775;
        Mon, 30 May 2022 13:02:01 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 58A8A1A0843;
        Mon, 30 May 2022 13:02:01 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
        by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id E86B7180031F;
        Mon, 30 May 2022 19:01:59 +0800 (+08)
From:   haibo.chen@nxp.com
To:     linus.walleij@linaro.org, brgl@bgdev.pl, marek.vasut@gmail.com
Cc:     linux-gpio@vger.kernel.org, linux-imx@nxp.com, haibo.chen@nxp.com
Subject: [PATCH] gpio: pca953x: use the correct register address to do regcache sync
Date:   Mon, 30 May 2022 18:48:48 +0800
Message-Id: <1653907728-27235-1-git-send-email-haibo.chen@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

From: Haibo Chen <haibo.chen@nxp.com>

For regcache_sync_region, need to use pca953x_recalc_addr() to get
the real register address.

Fixes: b76574300504 ("gpio: pca953x: Restore registers after suspend/resume cycle")
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/gpio/gpio-pca953x.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index b444c6ab958b..08bc52c3cdcb 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -1120,20 +1120,21 @@ static int pca953x_regcache_sync(struct device *dev)
 {
 	struct pca953x_chip *chip = dev_get_drvdata(dev);
 	int ret;
+	u8 regaddr;
 
 	/*
 	 * The ordering between direction and output is important,
 	 * sync these registers first and only then sync the rest.
 	 */
-	ret = regcache_sync_region(chip->regmap, chip->regs->direction,
-				   chip->regs->direction + NBANK(chip));
+	regaddr = pca953x_recalc_addr(chip, chip->regs->direction, 0);
+	ret = regcache_sync_region(chip->regmap, regaddr, regaddr + NBANK(chip));
 	if (ret) {
 		dev_err(dev, "Failed to sync GPIO dir registers: %d\n", ret);
 		return ret;
 	}
 
-	ret = regcache_sync_region(chip->regmap, chip->regs->output,
-				   chip->regs->output + NBANK(chip));
+	regaddr = pca953x_recalc_addr(chip, chip->regs->output, 0);
+	ret = regcache_sync_region(chip->regmap, regaddr, regaddr + NBANK(chip));
 	if (ret) {
 		dev_err(dev, "Failed to sync GPIO out registers: %d\n", ret);
 		return ret;
@@ -1141,16 +1142,18 @@ static int pca953x_regcache_sync(struct device *dev)
 
 #ifdef CONFIG_GPIO_PCA953X_IRQ
 	if (chip->driver_data & PCA_PCAL) {
-		ret = regcache_sync_region(chip->regmap, PCAL953X_IN_LATCH,
-					   PCAL953X_IN_LATCH + NBANK(chip));
+		regaddr = pca953x_recalc_addr(chip, PCAL953X_IN_LATCH, 0);
+		ret = regcache_sync_region(chip->regmap, regaddr,
+					   regaddr + NBANK(chip));
 		if (ret) {
 			dev_err(dev, "Failed to sync INT latch registers: %d\n",
 				ret);
 			return ret;
 		}
 
-		ret = regcache_sync_region(chip->regmap, PCAL953X_INT_MASK,
-					   PCAL953X_INT_MASK + NBANK(chip));
+		regaddr = pca953x_recalc_addr(chip, PCAL953X_INT_MASK, 0);
+		ret = regcache_sync_region(chip->regmap, regaddr,
+					   regaddr + NBANK(chip));
 		if (ret) {
 			dev_err(dev, "Failed to sync INT mask registers: %d\n",
 				ret);
-- 
2.25.1

