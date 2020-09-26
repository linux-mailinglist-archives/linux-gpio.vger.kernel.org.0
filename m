Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7C3D3279D09
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Sep 2020 02:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728887AbgI0AFX (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 26 Sep 2020 20:05:23 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:56996 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728721AbgI0AFX (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 26 Sep 2020 20:05:23 -0400
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4BzQjy3tW1zdb;
        Sun, 27 Sep 2020 01:59:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1601164758; bh=SrdWKpugfgEvsUIujDpbZcnVd69Nyy4z5hiP/mxvhCU=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=kZ4cAb9v7gDCp42cYiTvjJDfb02ylYrk+HS0c/GvOa3voPr8Iaw8iAfLX7Jem4tfy
         m/bIvRoL8ziIqmektzpisknBcrQcFNy4931xJkuKyTxH1FA/1LiRsGTiLftYN9XU/a
         cR8THSk22cOQOvM0OEHUasz7b/aT00sFgj0aI7ty0PJopT/2qUKlDE6CeLc13iO210
         SqhRwG6zpG8nXESluhSCUnOTUrPFZ4wh9pfhrWe+cMXW0MzlnOdGVicwZFI2Mmi0ON
         xEjYDQCFWkKXZk93RTW+ZeVayOfPcFsFq7XdRdIuRlOchQp4V8Ey/PlYxGde3EMNyq
         DyYq9nLNEK0xQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Sun, 27 Sep 2020 01:59:17 +0200
Message-Id: <8ebfb748eb55b68e5da4c5eefcf708ae9307b418.1601164493.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1601164493.git.mirq-linux@rere.qmqm.pl>
References: <cover.1601164493.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH 4/5] mfd: tps65910: clean up after switching to regmap
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Mark Brown <broonie@kernel.org>,
        Tony Lindgren <tony@atomide.com>
Cc:     linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Remove wrappers around regmap calls to remove now-useless indirection.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/mfd/tps65910.c       | 16 ++++++++--------
 include/linux/mfd/tps65910.h | 35 -----------------------------------
 2 files changed, 8 insertions(+), 43 deletions(-)

diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
index 11959021b50a..36a52f44cd11 100644
--- a/drivers/mfd/tps65910.c
+++ b/drivers/mfd/tps65910.c
@@ -292,7 +292,7 @@ static int tps65910_ck32k_init(struct tps65910 *tps65910,
 	if (!pmic_pdata->en_ck32k_xtal)
 		return 0;
 
-	ret = tps65910_reg_clear_bits(tps65910, TPS65910_DEVCTRL,
+	ret = regmap_clear_bits(tps65910->regmap, TPS65910_DEVCTRL,
 						DEVCTRL_CK32K_CTRL_MASK);
 	if (ret < 0) {
 		dev_err(tps65910->dev, "clear ck32k_ctrl failed: %d\n", ret);
@@ -314,7 +314,7 @@ static int tps65910_sleepinit(struct tps65910 *tps65910,
 	dev = tps65910->dev;
 
 	/* enabling SLEEP device state */
-	ret = tps65910_reg_set_bits(tps65910, TPS65910_DEVCTRL,
+	ret = regmap_set_bits(tps65910->regmap, TPS65910_DEVCTRL,
 				DEVCTRL_DEV_SLP_MASK);
 	if (ret < 0) {
 		dev_err(dev, "set dev_slp failed: %d\n", ret);
@@ -322,7 +322,7 @@ static int tps65910_sleepinit(struct tps65910 *tps65910,
 	}
 
 	if (pmic_pdata->slp_keepon.therm_keepon) {
-		ret = tps65910_reg_set_bits(tps65910,
+		ret = regmap_set_bits(tps65910->regmap,
 				TPS65910_SLEEP_KEEP_RES_ON,
 				SLEEP_KEEP_RES_ON_THERM_KEEPON_MASK);
 		if (ret < 0) {
@@ -332,7 +332,7 @@ static int tps65910_sleepinit(struct tps65910 *tps65910,
 	}
 
 	if (pmic_pdata->slp_keepon.clkout32k_keepon) {
-		ret = tps65910_reg_set_bits(tps65910,
+		ret = regmap_set_bits(tps65910->regmap,
 				TPS65910_SLEEP_KEEP_RES_ON,
 				SLEEP_KEEP_RES_ON_CLKOUT32K_KEEPON_MASK);
 		if (ret < 0) {
@@ -342,7 +342,7 @@ static int tps65910_sleepinit(struct tps65910 *tps65910,
 	}
 
 	if (pmic_pdata->slp_keepon.i2chs_keepon) {
-		ret = tps65910_reg_set_bits(tps65910,
+		ret = regmap_set_bits(tps65910->regmap,
 				TPS65910_SLEEP_KEEP_RES_ON,
 				SLEEP_KEEP_RES_ON_I2CHS_KEEPON_MASK);
 		if (ret < 0) {
@@ -354,7 +354,7 @@ static int tps65910_sleepinit(struct tps65910 *tps65910,
 	return 0;
 
 disable_dev_slp:
-	tps65910_reg_clear_bits(tps65910, TPS65910_DEVCTRL,
+	regmap_clear_bits(tps65910->regmap, TPS65910_DEVCTRL,
 				DEVCTRL_DEV_SLP_MASK);
 
 err_sleep_init:
@@ -436,11 +436,11 @@ static void tps65910_power_off(void)
 
 	tps65910 = dev_get_drvdata(&tps65910_i2c_client->dev);
 
-	if (tps65910_reg_set_bits(tps65910, TPS65910_DEVCTRL,
+	if (regmap_set_bits(tps65910->regmap, TPS65910_DEVCTRL,
 			DEVCTRL_PWR_OFF_MASK) < 0)
 		return;
 
-	tps65910_reg_clear_bits(tps65910, TPS65910_DEVCTRL,
+	regmap_clear_bits(tps65910->regmap, TPS65910_DEVCTRL,
 			DEVCTRL_DEV_ON_MASK);
 }
 
diff --git a/include/linux/mfd/tps65910.h b/include/linux/mfd/tps65910.h
index ce4b9e743f7c..f7398d982f23 100644
--- a/include/linux/mfd/tps65910.h
+++ b/include/linux/mfd/tps65910.h
@@ -913,39 +913,4 @@ static inline int tps65910_chip_id(struct tps65910 *tps65910)
 	return tps65910->id;
 }
 
-static inline int tps65910_reg_read(struct tps65910 *tps65910, u8 reg,
-		unsigned int *val)
-{
-	return regmap_read(tps65910->regmap, reg, val);
-}
-
-static inline int tps65910_reg_write(struct tps65910 *tps65910, u8 reg,
-		unsigned int val)
-{
-	return regmap_write(tps65910->regmap, reg, val);
-}
-
-static inline int tps65910_reg_set_bits(struct tps65910 *tps65910, u8 reg,
-		u8 mask)
-{
-	return regmap_update_bits(tps65910->regmap, reg, mask, mask);
-}
-
-static inline int tps65910_reg_clear_bits(struct tps65910 *tps65910, u8 reg,
-		u8 mask)
-{
-	return regmap_update_bits(tps65910->regmap, reg, mask, 0);
-}
-
-static inline int tps65910_reg_update_bits(struct tps65910 *tps65910, u8 reg,
-					   u8 mask, u8 val)
-{
-	return regmap_update_bits(tps65910->regmap, reg, mask, val);
-}
-
-static inline int tps65910_irq_get_virq(struct tps65910 *tps65910, int irq)
-{
-	return regmap_irq_get_virq(tps65910->irq_data, irq);
-}
-
 #endif /*  __LINUX_MFD_TPS65910_H */
-- 
2.20.1

