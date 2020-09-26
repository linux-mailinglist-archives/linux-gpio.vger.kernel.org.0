Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5BC9279D0B
	for <lists+linux-gpio@lfdr.de>; Sun, 27 Sep 2020 02:05:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728908AbgI0AFY (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 26 Sep 2020 20:05:24 -0400
Received: from rere.qmqm.pl ([91.227.64.183]:65469 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726311AbgI0AFY (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 26 Sep 2020 20:05:24 -0400
X-Greylist: delayed 364 seconds by postgrey-1.27 at vger.kernel.org; Sat, 26 Sep 2020 20:05:20 EDT
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 4BzQjv6gH4zWS;
        Sun, 27 Sep 2020 01:59:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1601164756; bh=4nAv6U26QMceZhE6mlilp7UbAoqJ2qt3XIJwygPTvZs=;
        h=Date:In-Reply-To:References:From:Subject:To:Cc:From;
        b=DkzzlQYPp8KLkLsJ2sNx4uZElGsGdzcvkR0Yw8TLTqKhma4+aLNcb060Fg7SorJPl
         5vIUoq6TUZlrpk757msk/A77NmUJsfz+KsLV4Ar5iuMkOrz6DDxyxr1tNAdWN36JTk
         Mqqaz0+24LhHqe5sbVI2BbxnHSpRyeUHDfMyIpZEHzlYUgaWoHW+qLo9h5QiB7rSp2
         BMzPOIwFMSY/ylU+MqbUjsrps6t8QSGpROieCzuFyUczh4e0MQXonkLIhuNJykY8Cp
         y5twxO4JE+tetEGja0vtwQCmmlPsGL3T8wuxukGlERLCUq6geLNyrBAiT0f79grA+f
         6aGUdWBSrZ5wA==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.102.4 at mail
Date:   Sun, 27 Sep 2020 01:59:15 +0200
Message-Id: <e82886d0f8f5131c9fccf2a17e3a15acce507d6f.1601164493.git.mirq-linux@rere.qmqm.pl>
In-Reply-To: <cover.1601164493.git.mirq-linux@rere.qmqm.pl>
References: <cover.1601164493.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH 2/5] regulator: tps65910: use regmap accessors
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     Tony Lindgren <tony@atomide.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Use regmap accessors directly for register manipulation - removing
one layer of abstraction.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/regulator/tps65910-regulator.c | 125 +++++++++++++------------
 1 file changed, 63 insertions(+), 62 deletions(-)

diff --git a/drivers/regulator/tps65910-regulator.c b/drivers/regulator/tps65910-regulator.c
index faa5b3538167..1d5b0a1b86f7 100644
--- a/drivers/regulator/tps65910-regulator.c
+++ b/drivers/regulator/tps65910-regulator.c
@@ -390,8 +390,8 @@ static int tps65911_get_ctrl_register(int id)
 static int tps65910_set_mode(struct regulator_dev *dev, unsigned int mode)
 {
 	struct tps65910_reg *pmic = rdev_get_drvdata(dev);
-	struct tps65910 *mfd = pmic->mfd;
-	int reg, value, id = rdev_get_id(dev);
+	struct regmap *regmap = rdev_get_regmap(dev);
+	int reg, id = rdev_get_id(dev);
 
 	reg = pmic->get_ctrl_reg(id);
 	if (reg < 0)
@@ -399,14 +399,14 @@ static int tps65910_set_mode(struct regulator_dev *dev, unsigned int mode)
 
 	switch (mode) {
 	case REGULATOR_MODE_NORMAL:
-		return tps65910_reg_update_bits(pmic->mfd, reg,
-						LDO_ST_MODE_BIT | LDO_ST_ON_BIT,
-						LDO_ST_ON_BIT);
+		return regmap_update_bits(regmap, reg,
+					  LDO_ST_MODE_BIT | LDO_ST_ON_BIT,
+					  LDO_ST_ON_BIT);
 	case REGULATOR_MODE_IDLE:
-		value = LDO_ST_ON_BIT | LDO_ST_MODE_BIT;
-		return tps65910_reg_set_bits(mfd, reg, value);
+		return regmap_set_bits(regmap, reg,
+				       LDO_ST_ON_BIT | LDO_ST_MODE_BIT);
 	case REGULATOR_MODE_STANDBY:
-		return tps65910_reg_clear_bits(mfd, reg, LDO_ST_ON_BIT);
+		return regmap_clear_bits(regmap, reg, LDO_ST_ON_BIT);
 	}
 
 	return -EINVAL;
@@ -415,13 +415,14 @@ static int tps65910_set_mode(struct regulator_dev *dev, unsigned int mode)
 static unsigned int tps65910_get_mode(struct regulator_dev *dev)
 {
 	struct tps65910_reg *pmic = rdev_get_drvdata(dev);
+	struct regmap *regmap = rdev_get_regmap(dev);
 	int ret, reg, value, id = rdev_get_id(dev);
 
 	reg = pmic->get_ctrl_reg(id);
 	if (reg < 0)
 		return reg;
 
-	ret = tps65910_reg_read(pmic->mfd, reg, &value);
+	ret = regmap_read(regmap, reg, &value);
 	if (ret < 0)
 		return ret;
 
@@ -435,20 +436,20 @@ static unsigned int tps65910_get_mode(struct regulator_dev *dev)
 
 static int tps65910_get_voltage_dcdc_sel(struct regulator_dev *dev)
 {
-	struct tps65910_reg *pmic = rdev_get_drvdata(dev);
+	struct regmap *regmap = rdev_get_regmap(dev);
 	int ret, id = rdev_get_id(dev);
 	int opvsel = 0, srvsel = 0, vselmax = 0, mult = 0, sr = 0;
 
 	switch (id) {
 	case TPS65910_REG_VDD1:
-		ret = tps65910_reg_read(pmic->mfd, TPS65910_VDD1_OP, &opvsel);
+		ret = regmap_read(regmap, TPS65910_VDD1_OP, &opvsel);
 		if (ret < 0)
 			return ret;
-		ret = tps65910_reg_read(pmic->mfd, TPS65910_VDD1, &mult);
+		ret = regmap_read(regmap, TPS65910_VDD1, &mult);
 		if (ret < 0)
 			return ret;
 		mult = (mult & VDD1_VGAIN_SEL_MASK) >> VDD1_VGAIN_SEL_SHIFT;
-		ret = tps65910_reg_read(pmic->mfd, TPS65910_VDD1_SR, &srvsel);
+		ret = regmap_read(regmap, TPS65910_VDD1_SR, &srvsel);
 		if (ret < 0)
 			return ret;
 		sr = opvsel & VDD1_OP_CMD_MASK;
@@ -457,14 +458,14 @@ static int tps65910_get_voltage_dcdc_sel(struct regulator_dev *dev)
 		vselmax = 75;
 		break;
 	case TPS65910_REG_VDD2:
-		ret = tps65910_reg_read(pmic->mfd, TPS65910_VDD2_OP, &opvsel);
+		ret = regmap_read(regmap, TPS65910_VDD2_OP, &opvsel);
 		if (ret < 0)
 			return ret;
-		ret = tps65910_reg_read(pmic->mfd, TPS65910_VDD2, &mult);
+		ret = regmap_read(regmap, TPS65910_VDD2, &mult);
 		if (ret < 0)
 			return ret;
 		mult = (mult & VDD2_VGAIN_SEL_MASK) >> VDD2_VGAIN_SEL_SHIFT;
-		ret = tps65910_reg_read(pmic->mfd, TPS65910_VDD2_SR, &srvsel);
+		ret = regmap_read(regmap, TPS65910_VDD2_SR, &srvsel);
 		if (ret < 0)
 			return ret;
 		sr = opvsel & VDD2_OP_CMD_MASK;
@@ -473,12 +474,10 @@ static int tps65910_get_voltage_dcdc_sel(struct regulator_dev *dev)
 		vselmax = 75;
 		break;
 	case TPS65911_REG_VDDCTRL:
-		ret = tps65910_reg_read(pmic->mfd, TPS65911_VDDCTRL_OP,
-					&opvsel);
+		ret = regmap_read(regmap, TPS65911_VDDCTRL_OP, &opvsel);
 		if (ret < 0)
 			return ret;
-		ret = tps65910_reg_read(pmic->mfd, TPS65911_VDDCTRL_SR,
-					&srvsel);
+		ret = regmap_read(regmap, TPS65911_VDDCTRL_SR, &srvsel);
 		if (ret < 0)
 			return ret;
 		sr = opvsel & VDDCTRL_OP_CMD_MASK;
@@ -514,13 +513,14 @@ static int tps65910_get_voltage_dcdc_sel(struct regulator_dev *dev)
 static int tps65910_get_voltage_sel(struct regulator_dev *dev)
 {
 	struct tps65910_reg *pmic = rdev_get_drvdata(dev);
+	struct regmap *regmap = rdev_get_regmap(dev);
 	int ret, reg, value, id = rdev_get_id(dev);
 
 	reg = pmic->get_ctrl_reg(id);
 	if (reg < 0)
 		return reg;
 
-	ret = tps65910_reg_read(pmic->mfd, reg, &value);
+	ret = regmap_read(regmap, reg, &value);
 	if (ret < 0)
 		return ret;
 
@@ -556,12 +556,13 @@ static int tps65910_get_voltage_vdd3(struct regulator_dev *dev)
 static int tps65911_get_voltage_sel(struct regulator_dev *dev)
 {
 	struct tps65910_reg *pmic = rdev_get_drvdata(dev);
+	struct regmap *regmap = rdev_get_regmap(dev);
 	int ret, id = rdev_get_id(dev);
 	unsigned int value, reg;
 
 	reg = pmic->get_ctrl_reg(id);
 
-	ret = tps65910_reg_read(pmic->mfd, reg, &value);
+	ret = regmap_read(regmap, reg, &value);
 	if (ret < 0)
 		return ret;
 
@@ -594,7 +595,7 @@ static int tps65911_get_voltage_sel(struct regulator_dev *dev)
 static int tps65910_set_voltage_dcdc_sel(struct regulator_dev *dev,
 					 unsigned selector)
 {
-	struct tps65910_reg *pmic = rdev_get_drvdata(dev);
+	struct regmap *regmap = rdev_get_regmap(dev);
 	int id = rdev_get_id(dev), vsel;
 	int dcdc_mult = 0;
 
@@ -605,10 +606,9 @@ static int tps65910_set_voltage_dcdc_sel(struct regulator_dev *dev,
 			dcdc_mult--;
 		vsel = (selector % VDD1_2_NUM_VOLT_FINE) + 3;
 
-		tps65910_reg_update_bits(pmic->mfd, TPS65910_VDD1,
-					 VDD1_VGAIN_SEL_MASK,
-					 dcdc_mult << VDD1_VGAIN_SEL_SHIFT);
-		tps65910_reg_write(pmic->mfd, TPS65910_VDD1_OP, vsel);
+		regmap_update_bits(regmap, TPS65910_VDD1, VDD1_VGAIN_SEL_MASK,
+				   dcdc_mult << VDD1_VGAIN_SEL_SHIFT);
+		regmap_write(regmap, TPS65910_VDD1_OP, vsel);
 		break;
 	case TPS65910_REG_VDD2:
 		dcdc_mult = (selector / VDD1_2_NUM_VOLT_FINE) + 1;
@@ -616,14 +616,14 @@ static int tps65910_set_voltage_dcdc_sel(struct regulator_dev *dev,
 			dcdc_mult--;
 		vsel = (selector % VDD1_2_NUM_VOLT_FINE) + 3;
 
-		tps65910_reg_update_bits(pmic->mfd, TPS65910_VDD2,
-					 VDD1_VGAIN_SEL_MASK,
-					 dcdc_mult << VDD2_VGAIN_SEL_SHIFT);
-		tps65910_reg_write(pmic->mfd, TPS65910_VDD2_OP, vsel);
+		regmap_update_bits(regmap, TPS65910_VDD2, VDD1_VGAIN_SEL_MASK,
+				   dcdc_mult << VDD2_VGAIN_SEL_SHIFT);
+		regmap_write(regmap, TPS65910_VDD2_OP, vsel);
 		break;
 	case TPS65911_REG_VDDCTRL:
 		vsel = selector + 3;
-		tps65910_reg_write(pmic->mfd, TPS65911_VDDCTRL_OP, vsel);
+		regmap_write(regmap, TPS65911_VDDCTRL_OP, vsel);
+		break;
 	}
 
 	return 0;
@@ -633,6 +633,7 @@ static int tps65910_set_voltage_sel(struct regulator_dev *dev,
 				    unsigned selector)
 {
 	struct tps65910_reg *pmic = rdev_get_drvdata(dev);
+	struct regmap *regmap = rdev_get_regmap(dev);
 	int reg, id = rdev_get_id(dev);
 
 	reg = pmic->get_ctrl_reg(id);
@@ -649,11 +650,11 @@ static int tps65910_set_voltage_sel(struct regulator_dev *dev,
 	case TPS65910_REG_VAUX2:
 	case TPS65910_REG_VAUX33:
 	case TPS65910_REG_VMMC:
-		return tps65910_reg_update_bits(pmic->mfd, reg, LDO_SEL_MASK,
-						selector << LDO_SEL_SHIFT);
+		return regmap_update_bits(regmap, reg, LDO_SEL_MASK,
+					  selector << LDO_SEL_SHIFT);
 	case TPS65910_REG_VBB:
-		return tps65910_reg_update_bits(pmic->mfd, reg, BBCH_BBSEL_MASK,
-						selector << BBCH_BBSEL_SHIFT);
+		return regmap_update_bits(regmap, reg, BBCH_BBSEL_MASK,
+					  selector << BBCH_BBSEL_SHIFT);
 	}
 
 	return -EINVAL;
@@ -663,6 +664,7 @@ static int tps65911_set_voltage_sel(struct regulator_dev *dev,
 				    unsigned selector)
 {
 	struct tps65910_reg *pmic = rdev_get_drvdata(dev);
+	struct regmap *regmap = rdev_get_regmap(dev);
 	int reg, id = rdev_get_id(dev);
 
 	reg = pmic->get_ctrl_reg(id);
@@ -673,21 +675,21 @@ static int tps65911_set_voltage_sel(struct regulator_dev *dev,
 	case TPS65911_REG_LDO1:
 	case TPS65911_REG_LDO2:
 	case TPS65911_REG_LDO4:
-		return tps65910_reg_update_bits(pmic->mfd, reg, LDO1_SEL_MASK,
-						selector << LDO_SEL_SHIFT);
+		return regmap_update_bits(regmap, reg, LDO1_SEL_MASK,
+					  selector << LDO_SEL_SHIFT);
 	case TPS65911_REG_LDO3:
 	case TPS65911_REG_LDO5:
 	case TPS65911_REG_LDO6:
 	case TPS65911_REG_LDO7:
 	case TPS65911_REG_LDO8:
-		return tps65910_reg_update_bits(pmic->mfd, reg, LDO3_SEL_MASK,
-						selector << LDO_SEL_SHIFT);
+		return regmap_update_bits(regmap, reg, LDO3_SEL_MASK,
+					  selector << LDO_SEL_SHIFT);
 	case TPS65910_REG_VIO:
-		return tps65910_reg_update_bits(pmic->mfd, reg, LDO_SEL_MASK,
-						selector << LDO_SEL_SHIFT);
+		return regmap_update_bits(regmap, reg, LDO_SEL_MASK,
+					  selector << LDO_SEL_SHIFT);
 	case TPS65910_REG_VBB:
-		return tps65910_reg_update_bits(pmic->mfd, reg, BBCH_BBSEL_MASK,
-						selector << BBCH_BBSEL_SHIFT);
+		return regmap_update_bits(regmap, reg, BBCH_BBSEL_MASK,
+					  selector << BBCH_BBSEL_SHIFT);
 	}
 
 	return -EINVAL;
@@ -850,10 +852,10 @@ static int tps65910_set_ext_sleep_config(struct tps65910_reg *pmic,
 
 	/* External EN1 control */
 	if (ext_sleep_config & TPS65910_SLEEP_CONTROL_EXT_INPUT_EN1)
-		ret = tps65910_reg_set_bits(mfd,
+		ret = regmap_set_bits(mfd->regmap,
 				TPS65910_EN1_LDO_ASS + regoffs, bit_pos);
 	else
-		ret = tps65910_reg_clear_bits(mfd,
+		ret = regmap_clear_bits(mfd->regmap,
 				TPS65910_EN1_LDO_ASS + regoffs, bit_pos);
 	if (ret < 0) {
 		dev_err(mfd->dev,
@@ -863,10 +865,10 @@ static int tps65910_set_ext_sleep_config(struct tps65910_reg *pmic,
 
 	/* External EN2 control */
 	if (ext_sleep_config & TPS65910_SLEEP_CONTROL_EXT_INPUT_EN2)
-		ret = tps65910_reg_set_bits(mfd,
+		ret = regmap_set_bits(mfd->regmap,
 				TPS65910_EN2_LDO_ASS + regoffs, bit_pos);
 	else
-		ret = tps65910_reg_clear_bits(mfd,
+		ret = regmap_clear_bits(mfd->regmap,
 				TPS65910_EN2_LDO_ASS + regoffs, bit_pos);
 	if (ret < 0) {
 		dev_err(mfd->dev,
@@ -878,10 +880,10 @@ static int tps65910_set_ext_sleep_config(struct tps65910_reg *pmic,
 	if ((tps65910_chip_id(mfd) == TPS65910) &&
 			(id >= TPS65910_REG_VDIG1)) {
 		if (ext_sleep_config & TPS65910_SLEEP_CONTROL_EXT_INPUT_EN3)
-			ret = tps65910_reg_set_bits(mfd,
+			ret = regmap_set_bits(mfd->regmap,
 				TPS65910_EN3_LDO_ASS + regoffs, bit_pos);
 		else
-			ret = tps65910_reg_clear_bits(mfd,
+			ret = regmap_clear_bits(mfd->regmap,
 				TPS65910_EN3_LDO_ASS + regoffs, bit_pos);
 		if (ret < 0) {
 			dev_err(mfd->dev,
@@ -893,10 +895,10 @@ static int tps65910_set_ext_sleep_config(struct tps65910_reg *pmic,
 	/* Return if no external control is selected */
 	if (!(ext_sleep_config & EXT_SLEEP_CONTROL)) {
 		/* Clear all sleep controls */
-		ret = tps65910_reg_clear_bits(mfd,
+		ret = regmap_clear_bits(mfd->regmap,
 			TPS65910_SLEEP_KEEP_LDO_ON + regoffs, bit_pos);
 		if (!ret)
-			ret = tps65910_reg_clear_bits(mfd,
+			ret = regmap_clear_bits(mfd->regmap,
 				TPS65910_SLEEP_SET_LDO_OFF + regoffs, bit_pos);
 		if (ret < 0)
 			dev_err(mfd->dev,
@@ -917,39 +919,38 @@ static int tps65910_set_ext_sleep_config(struct tps65910_reg *pmic,
 		int sr_reg_add = pmic->get_ctrl_reg(id) + 2;
 		int opvsel, srvsel;
 
-		ret = tps65910_reg_read(pmic->mfd, op_reg_add, &opvsel);
+		ret = regmap_read(mfd->regmap, op_reg_add, &opvsel);
 		if (ret < 0)
 			return ret;
-		ret = tps65910_reg_read(pmic->mfd, sr_reg_add, &srvsel);
+		ret = regmap_read(mfd->regmap, sr_reg_add, &srvsel);
 		if (ret < 0)
 			return ret;
 
 		if (opvsel & VDD1_OP_CMD_MASK) {
 			u8 reg_val = srvsel & VDD1_OP_SEL_MASK;
 
-			ret = tps65910_reg_write(pmic->mfd, op_reg_add,
-						 reg_val);
+			ret = regmap_write(mfd->regmap, op_reg_add, reg_val);
 			if (ret < 0) {
 				dev_err(mfd->dev,
 					"Error in configuring op register\n");
 				return ret;
 			}
 		}
-		ret = tps65910_reg_write(pmic->mfd, sr_reg_add, 0);
+		ret = regmap_write(mfd->regmap, sr_reg_add, 0);
 		if (ret < 0) {
 			dev_err(mfd->dev, "Error in setting sr register\n");
 			return ret;
 		}
 	}
 
-	ret = tps65910_reg_clear_bits(mfd,
+	ret = regmap_clear_bits(mfd->regmap,
 			TPS65910_SLEEP_KEEP_LDO_ON + regoffs, bit_pos);
 	if (!ret) {
 		if (ext_sleep_config & TPS65911_SLEEP_CONTROL_EXT_INPUT_SLEEP)
-			ret = tps65910_reg_set_bits(mfd,
+			ret = regmap_set_bits(mfd->regmap,
 				TPS65910_SLEEP_SET_LDO_OFF + regoffs, bit_pos);
 		else
-			ret = tps65910_reg_clear_bits(mfd,
+			ret = regmap_clear_bits(mfd->regmap,
 				TPS65910_SLEEP_SET_LDO_OFF + regoffs, bit_pos);
 	}
 	if (ret < 0)
@@ -1097,7 +1098,7 @@ static int tps65910_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, pmic);
 
 	/* Give control of all register to control port */
-	err = tps65910_reg_set_bits(pmic->mfd, TPS65910_DEVCTRL,
+	err = regmap_set_bits(pmic->mfd->regmap, TPS65910_DEVCTRL,
 				DEVCTRL_SR_CTL_I2C_SEL_MASK);
 	if (err < 0)
 		return err;
@@ -1113,7 +1114,7 @@ static int tps65910_probe(struct platform_device *pdev)
 		 * voltage level can go higher than expected or crash
 		 * Workaround: use no synchronization of DCDC clocks
 		 */
-		tps65910_reg_clear_bits(pmic->mfd, TPS65910_DCDCCTRL,
+		regmap_clear_bits(pmic->mfd->regmap, TPS65910_DCDCCTRL,
 					DCDCCTRL_DCDCCKSYNC_MASK);
 		break;
 	case TPS65911:
-- 
2.20.1

