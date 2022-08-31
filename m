Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EEFAC5A7BC6
	for <lists+linux-gpio@lfdr.de>; Wed, 31 Aug 2022 12:55:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230378AbiHaKz1 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Wed, 31 Aug 2022 06:55:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230215AbiHaKzZ (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 31 Aug 2022 06:55:25 -0400
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6ADBC40BDD
        for <linux-gpio@vger.kernel.org>; Wed, 31 Aug 2022 03:55:21 -0700 (PDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0D7CD1A20CF;
        Wed, 31 Aug 2022 12:55:20 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id CA7891A20C7;
        Wed, 31 Aug 2022 12:55:19 +0200 (CEST)
Received: from local (shlinux2.ap.freescale.net [10.192.224.44])
        by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id A6A45181D0CA;
        Wed, 31 Aug 2022 18:55:18 +0800 (+08)
From:   haibo.chen@nxp.com
To:     linus.walleij@linaro.org, brgl@bgdev.pl,
        linux-gpio@vger.kernel.org, marek.vasut@gmail.com
Cc:     haibo.chen@nxp.com, linux-imx@nxp.com
Subject: [PATCH] gpio: pca953x: Add mutex_lock for regcache sync in PM
Date:   Wed, 31 Aug 2022 18:37:35 +0800
Message-Id: <1661942255-13177-1-git-send-email-haibo.chen@nxp.com>
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

The regcache sync will set the cache_bypass = true, at that
time, when there is regmap write operation, it will bypass
the regmap cache, then the regcache sync will write back the
value from cache to register, which is not as our expectation.

Though regmap already use its internal lock to avoid such issue,
but this driver force disable the regmap internal lock in its
regmap config: disable_locking = true

To avoid this issue, use the driver's own lock to do the protect
in system PM.

Fixes: b76574300504 ("gpio: pca953x: Restore registers after suspend/resume cycle")
Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
---
 drivers/gpio/gpio-pca953x.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pca953x.c b/drivers/gpio/gpio-pca953x.c
index 091dd573c556..cf9bf3fcaee2 100644
--- a/drivers/gpio/gpio-pca953x.c
+++ b/drivers/gpio/gpio-pca953x.c
@@ -1168,7 +1168,9 @@ static int pca953x_suspend(struct device *dev)
 {
 	struct pca953x_chip *chip = dev_get_drvdata(dev);
 
+	mutex_lock(&chip->i2c_lock);
 	regcache_cache_only(chip->regmap, true);
+	mutex_unlock(&chip->i2c_lock);
 
 	if (atomic_read(&chip->wakeup_path))
 		device_set_wakeup_path(dev);
@@ -1191,13 +1193,17 @@ static int pca953x_resume(struct device *dev)
 		}
 	}
 
+	mutex_lock(&chip->i2c_lock);
 	regcache_cache_only(chip->regmap, false);
 	regcache_mark_dirty(chip->regmap);
 	ret = pca953x_regcache_sync(dev);
-	if (ret)
+	if (ret) {
+		mutex_unlock(&chip->i2c_lock);
 		return ret;
+	}
 
 	ret = regcache_sync(chip->regmap);
+	mutex_unlock(&chip->i2c_lock);
 	if (ret) {
 		dev_err(dev, "Failed to restore register map: %d\n", ret);
 		return ret;
-- 
2.34.1

