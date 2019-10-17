Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AD64DA932
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2019 11:50:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393746AbfJQJuT (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Oct 2019 05:50:19 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44277 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389021AbfJQJuT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Oct 2019 05:50:19 -0400
Received: by mail-lj1-f194.google.com with SMTP id m13so1815888ljj.11;
        Thu, 17 Oct 2019 02:50:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=B4nV+UMiZrRWL8NEUT7jJ6/dkCR9n2JxEkHQ4ehIxzM=;
        b=b4+xMxBxIu2ZW2R/fqIFmS/H3npM3/A4AwX1wC8YnKGWhcy0OlfNzDpRoV89uPTTAH
         xZ3DKxc5cGi7aFg1Ip/15fOiVRYz5fJzrbHorqOfTA09WekX8N4CSJYX4dGkCS08F9UD
         mJ97OcQxNQfl43h4B7zq4G9EVDNtFRMt1fmC2dP9I3pW23Y/uKpGHekbsHVx7BZp39+/
         0Gp2nWHEXkUyXU/msp+um4IZOPSUtj0G4WoFouAj3IWQFItF2H8EGKV6DjRudntY+NSu
         ixz3MifPyLbKuZYK+t5IvlInosuWlQP5zN6o6Zohy6ssKjLivglc8+ys44mn34Jn76Ee
         3GTg==
X-Gm-Message-State: APjAAAW+3F8+T7qyBX1alRiskc6nPpIfw8zujjLZ4wuPyC4nLKLvwA40
        F8R2TnhSAFP+Cz/o0iJ371I=
X-Google-Smtp-Source: APXvYqzSwV1BhukVKHENWapfjw2isCLKtid/wZQjRFv92sxqnTof8z7xJBjsvHhvBnBoPBkAyj52uQ==
X-Received: by 2002:a05:651c:1022:: with SMTP id w2mr1852748ljm.189.1571305814382;
        Thu, 17 Oct 2019 02:50:14 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id v6sm749994ljh.66.2019.10.17.02.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 02:50:13 -0700 (PDT)
Date:   Thu, 17 Oct 2019 12:50:01 +0300
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: [RFC PATCH 07/13] regulator: bd71828: enhanced run-level support
Message-ID: <5955d7d2a0e71c1a2d0b217bc2a764fa836bcec8.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Support changing run-level via I2C and add in-kernel API for allowing
run time changes of run-level voltages.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/regulator/bd71828-regulator.c | 266 ++++++++++++++++++++++----
 include/linux/mfd/rohm-bd71828.h      |   3 +
 2 files changed, 232 insertions(+), 37 deletions(-)

diff --git a/drivers/regulator/bd71828-regulator.c b/drivers/regulator/bd71828-regulator.c
index 36f5aef941e5..d5d0dcee90cf 100644
--- a/drivers/regulator/bd71828-regulator.c
+++ b/drivers/regulator/bd71828-regulator.c
@@ -19,6 +19,12 @@
 #include <linux/regulator/machine.h>
 #include <linux/regulator/of_regulator.h>
 
+/* Drivers should not do this. But we provide this custom kernel interface
+ * for users to switch the run-level. Hence we need to get the rdev from
+ * struct regulator
+ */
+#include "internal.h"
+
 #define MAX_GPIO_DVS_BUCKS 4
 #define DVS_RUN_LEVELS 4
 
@@ -39,7 +45,10 @@ struct bd71828_regulator_data {
 	const struct reg_init *reg_inits;
 	int reg_init_amnt;
 	struct run_lvl_ctrl run_lvl[DVS_RUN_LEVELS];
+	struct mutex dvs_lock;
 	struct gpio_descs *gps;
+	struct regmap *regmap;
+	bool allow_runlvl;
 };
 
 static const struct reg_init buck1_inits[] = {
@@ -225,7 +234,7 @@ static int set_runlevel_voltage(struct regmap *regmap,
 	return ret;
 }
 
-static int buck_set_gpio_hw_dvs_levels(struct device_node *np,
+static int buck_set_runlvl_hw_dvs_levels(struct device_node *np,
 				       const struct regulator_desc *desc,
 				       struct regulator_config *cfg)
 {
@@ -245,11 +254,12 @@ static int buck_set_gpio_hw_dvs_levels(struct device_node *np,
 
 	data = container_of(desc, struct bd71828_regulator_data, desc);
 
+	mutex_lock(&data->dvs_lock);
 	for (i = 0; i < DVS_RUN_LEVELS; i++) {
 		ret = of_property_read_u32(np, props[i], &uv);
 		if (ret) {
 			if (ret != -EINVAL)
-				return ret;
+				goto unlock_out;
 			uv = 0;
 		}
 		if (uv) {
@@ -259,7 +269,7 @@ static int buck_set_gpio_hw_dvs_levels(struct device_node *np,
 			ret = set_runlevel_voltage(cfg->regmap, desc, uv, i);
 
 			if (ret)
-				return ret;
+				goto unlock_out;
 
 			ret = regmap_update_bits(cfg->regmap, en_reg,
 						 en_masks[i], en_masks[i]);
@@ -268,10 +278,15 @@ static int buck_set_gpio_hw_dvs_levels(struct device_node *np,
 						 en_masks[i], 0);
 		}
 		if (ret)
-			return ret;
+			goto unlock_out;
 	}
 
-	return rohm_regulator_set_dvs_levels(&data->dvs, np, desc, cfg->regmap);
+	ret = rohm_regulator_set_dvs_levels(&data->dvs, np, desc, cfg->regmap);
+
+unlock_out:
+	mutex_unlock(&data->dvs_lock);
+
+	return ret;
 }
 
 static int ldo6_parse_dt(struct device_node *np,
@@ -324,11 +339,40 @@ static int bd71828_dvs_gpio_set_run_level(struct bd71828_regulator_data *rd,
 	return gpiod_set_array_value_cansleep(rd->gps->ndescs, rd->gps->desc,
 				     rd->gps->info, values);
 }
+
+/* Get current run level when RUN levels are controlled using I2C */
+static int bd71828_dvs_i2c_set_run_level(struct regmap *regmap,
+					 int lvl)
+{
+	unsigned int reg;
+
+	reg = lvl << (ffs(BD71828_MASK_RUN_LVL_CTRL) - 1);
+
+	return regmap_update_bits(regmap, BD71828_REG_PS_CTRL_3,
+				  BD71828_MASK_RUN_LVL_CTRL, reg);
+}
+/* Get current run level when RUN levels are controlled using I2C */
+static int bd71828_dvs_i2c_get_run_level(struct regmap *regmap,
+					 struct bd71828_regulator_data *rd)
+{
+	int ret;
+	unsigned int val;
+
+	ret = regmap_read(regmap, BD71828_REG_PS_CTRL_3, &val);
+	if (ret)
+		return ret;
+
+	ret = (val & BD71828_MASK_RUN_LVL_CTRL);
+	ret >>= ffs(BD71828_MASK_RUN_LVL_CTRL) - 1;
+
+	return ret;
+}
+
+/* Get current RUN level when run levels are controlled by GPIO */
 static int bd71828_dvs_gpio_get_run_level(struct bd71828_regulator_data *rd)
 {
 	int run_level;
 	int ret;
-
 	DECLARE_BITMAP(values, 2);
 
 	values[0] = 0;
@@ -346,47 +390,131 @@ static int bd71828_dvs_gpio_get_run_level(struct bd71828_regulator_data *rd)
 	return run_level;
 }
 
+/*
+ * To be used when BD71828 regulator is controlled by RUN levels
+ * via I2C instead of GPIO
+ */
+static int bd71828_dvs_i2c_is_enabled(struct regulator_dev *rdev)
+{
+	struct bd71828_regulator_data *data = rdev_get_drvdata(rdev);
+	int ret;
+
+	mutex_lock(&data->dvs_lock);
+	ret = bd71828_dvs_i2c_get_run_level(rdev->regmap, data);
+	if (ret < 0)
+		goto unlock_out;
+
+	ret = data->run_lvl[ret].enabled;
+
+unlock_out:
+	mutex_unlock(&data->dvs_lock);
+
+	return ret;
+}
+
+/*
+ * To be used when BD71828 regulator is controlled by RUN levels
+ * via GPIO
+ */
 static int bd71828_dvs_gpio_is_enabled(struct regulator_dev *rdev)
 {
 	struct bd71828_regulator_data *data = rdev_get_drvdata(rdev);
 	int ret;
 
-	// TODO: lock GPIO state (Is this needed)
+	mutex_lock(&data->dvs_lock);
 	ret = bd71828_dvs_gpio_get_run_level(data);
-	if (ret < 0)
+	if (ret < 0 || ret >= DVS_RUN_LEVELS)
 		goto unlock_out;
 
 	ret = data->run_lvl[ret].enabled;
 
 unlock_out:
-	//TODO: unlock
+	mutex_unlock(&data->dvs_lock);
 
 	return ret;
 }
 
+/*
+ * To be used when BD71828 regulator is controlled by RUN levels
+ * via I2C instead of GPIO
+ */
+static int bd71828_dvs_i2c_get_voltage(struct regulator_dev *rdev)
+{
+	int ret;
+	struct bd71828_regulator_data *data = rdev_get_drvdata(rdev);
+
+	mutex_lock(&data->dvs_lock);
+	ret = bd71828_dvs_i2c_get_run_level(rdev->regmap, data);
+	if (ret < 0)
+		goto unlock_out;
+
+	ret = data->run_lvl[ret].voltage;
+
+unlock_out:
+	mutex_unlock(&data->dvs_lock);
+
+	return ret;
+}
+
+/*
+ * To be used when BD71828 regulator is controlled by RUN levels
+ * via GPIO
+ */
 static int bd71828_dvs_gpio_get_voltage(struct regulator_dev *rdev)
 {
 	int ret;
 	struct bd71828_regulator_data *data = rdev_get_drvdata(rdev);
 
-	// TODO: lock GPIO state (Is this needed)
+	mutex_lock(&data->dvs_lock);
 	ret = bd71828_dvs_gpio_get_run_level(data);
-	if (ret < 0)
+	if (ret < 0 || DVS_RUN_LEVELS <= ret)
 		goto unlock_out;
 
 	ret = data->run_lvl[ret].voltage;
 
 unlock_out:
-	//TODO: unlock
+	mutex_unlock(&data->dvs_lock);
+
+	return ret;
+}
+
+/**
+ * bd71828_set_runlevel_voltage - change run-level voltage
+ *
+ * @regulator:  pointer to regulator for which the run-level voltage is changed
+ * @uv:		New voltage for run-level in micro volts
+ * @level:	run-level for which the voltage is to be changed
+ *
+ * Changes the run-level voltage for given regulator
+ */
+int bd71828_set_runlevel_voltage(struct regulator *regulator, unsigned int uv,
+				 unsigned int level)
+{
+	struct regulator_dev *rdev = regulator->rdev;
+	struct bd71828_regulator_data *data = rdev_get_drvdata(rdev);
+	int ret;
+
+	if (!data || !data->allow_runlvl)
+		return -EINVAL;
+
+	mutex_lock(&data->dvs_lock);
+	ret = set_runlevel_voltage(rdev->regmap, rdev->desc, uv, level);
+	mutex_unlock(&data->dvs_lock);
 
 	return ret;
 }
+EXPORT_SYMBOL(bd71828_set_runlevel_voltage);
 
 static const struct regulator_ops dvs_buck_gpio_ops = {
 	.is_enabled = bd71828_dvs_gpio_is_enabled,
 	.get_voltage = bd71828_dvs_gpio_get_voltage,
 };
 
+static const struct regulator_ops dvs_buck_i2c_ops = {
+	.is_enabled = bd71828_dvs_i2c_is_enabled,
+	.get_voltage = bd71828_dvs_i2c_get_voltage,
+};
+
 static const struct regulator_ops bd71828_buck_ops = {
 	.enable = regulator_enable_regmap,
 	.disable = regulator_disable_regmap,
@@ -972,17 +1100,72 @@ static const struct bd71828_regulator_data bd71828_rdata[] = {
 };
 
 struct bd71828_gpio_cfg {
-	unsigned int gpiobucks;
+	bool use_gpio;
+	unsigned int runlvl;
 	struct gpio_descs *gps;
 };
 
+static void mark_regulator_runlvl_controlled(struct device *dev,
+					     struct device_node *np,
+					     struct bd71828_gpio_cfg *g)
+{
+	int i;
+
+	for (i = 1; i <= ARRAY_SIZE(bd71828_rdata); i++) {
+		if (!of_node_name_eq(np, bd71828_rdata[i-1].desc.of_match))
+			continue;
+		switch (i) {
+		case 1:
+		case 2:
+		case 6:
+		case 7:
+			g->runlvl |= 1 << (i - 1);
+			dev_dbg(dev, "buck %d runlevel controlled\n", i);
+			break;
+		default:
+			dev_err(dev,
+				"Only bucks 1,2,6,7 support run-level dvs\n");
+			break;
+		}
+	}
+}
+
+static int get_runcontrolled_bucks_dt(struct device *dev,
+				      struct bd71828_gpio_cfg *g)
+{
+	struct device_node *np;
+	struct device_node *nproot = dev->of_node;
+	const char *prop = "rohm,dvs-runlvl-ctrl";
+
+	g->runlvl = 0;
+
+	nproot = of_get_child_by_name(nproot, "regulators");
+	if (!nproot) {
+		dev_err(dev, "failed to find regulators node\n");
+		return -ENODEV;
+	}
+	for_each_child_of_node(nproot, np)
+		if (of_property_read_bool(np, prop))
+			mark_regulator_runlvl_controlled(dev, np, g);
+
+	of_node_put(nproot);
+	return 0;
+}
+
 static int check_dt_for_gpio_controls(struct device *d,
 				      struct bd71828_gpio_cfg *g)
 {
-	int ret, i;
-	struct device_node *np = d->of_node;
-	const char *prop = "rohm,dvs_gpio_bucks";
-	uint32_t bucks[MAX_GPIO_DVS_BUCKS];
+	int ret;
+
+	ret = get_runcontrolled_bucks_dt(d, g);
+	if (ret)
+		return ret;
+
+	g->use_gpio = false;
+
+	/* If the run level control is not requested by any bucks we're done */
+	if (!g->runlvl)
+		return 0;
 
 	g->gps = devm_gpiod_get_array(d, "rohm,dvs-vsel", GPIOD_OUT_LOW);
 
@@ -996,22 +1179,14 @@ static int check_dt_for_gpio_controls(struct device *d,
 	if (g->gps->ndescs != 2)
 		return -ENOENT;
 
-	ret = of_property_read_variable_u32_array(np, prop, bucks, 0,
-						  ARRAY_SIZE(bucks));
-
-	if (ret < 0) {
-		if (ret == -EOVERFLOW)
-			return -EINVAL;
-	}
-	for (i = 0; i < ret; i++)
-		g->gpiobucks |= 1 << bucks[i];
+	g->use_gpio = true;
 
 	return 0;
 }
 
-static void set_buck_gpio_controlled(struct rohm_regmap_dev *bd71828,
-				     struct bd71828_regulator_data *rd,
-				     struct bd71828_gpio_cfg *g)
+static void set_buck_runlvl_controlled(struct rohm_regmap_dev *bd71828,
+				      struct bd71828_regulator_data *rd,
+				      struct bd71828_gpio_cfg *g)
 {
 	switch (rd->desc.id) {
 	case BD71828_BUCK1:
@@ -1033,9 +1208,16 @@ static void set_buck_gpio_controlled(struct rohm_regmap_dev *bd71828,
 	 * Disallow setters. Get voltages/enable states based
 	 * on current RUN level
 	 */
-	rd->gps = g->gps;
-	rd->desc.ops = &dvs_buck_gpio_ops;
-	rd->desc.of_parse_cb = buck_set_gpio_hw_dvs_levels;
+
+	rd->allow_runlvl = true;
+
+	if (g->use_gpio) {
+		rd->gps = g->gps;
+		rd->desc.ops = &dvs_buck_gpio_ops;
+	} else {
+		rd->desc.ops = &dvs_buck_i2c_ops;
+	}
+	rd->desc.of_parse_cb = buck_set_runlvl_hw_dvs_levels;
 }
 
 static ssize_t show_runlevel(struct device *dev,
@@ -1044,10 +1226,14 @@ static ssize_t show_runlevel(struct device *dev,
 	int runlevel;
 	struct bd71828_regulator_data *rd = dev_get_drvdata(dev);
 
-	if (!rd || !rd->gps)
+	if (!rd)
 		return -ENOENT;
 
-	runlevel = bd71828_dvs_gpio_get_run_level(rd);
+	if (!rd->gps)
+		runlevel = bd71828_dvs_i2c_get_run_level(rd->regmap, rd);
+	else
+		runlevel = bd71828_dvs_gpio_get_run_level(rd);
+
 	if (runlevel < 0)
 		return runlevel;
 
@@ -1063,7 +1249,10 @@ static ssize_t set_runlevel(struct device *dev, struct device_attribute *attr,
 	if (kstrtol(buf, 0, &val) != 0)
 		return -EINVAL;
 
-	val = bd71828_dvs_gpio_set_run_level(rd, val);
+	if (rd->gps)
+		val = bd71828_dvs_gpio_set_run_level(rd, val);
+	else
+		val = bd71828_dvs_i2c_set_run_level(rd->regmap, val);
 	if (val)
 		return val;
 
@@ -1133,8 +1322,11 @@ static int bd71828_probe(struct platform_device *pdev)
 		/* Use bd71828_rdata as template */
 		rd[i] = bd71828_rdata[i];
 
-		if (gcfg.gpiobucks & (1 << i))
-			set_buck_gpio_controlled(bd71828, &rd[i], &gcfg);
+		mutex_init(&rd[i].dvs_lock);
+		if (gcfg.runlvl & (1 << i))
+			set_buck_runlvl_controlled(bd71828, &rd[i], &gcfg);
+
+		rd[i].regmap = bd71828->regmap;
 	}
 
 	config.regmap = bd71828->regmap;
diff --git a/include/linux/mfd/rohm-bd71828.h b/include/linux/mfd/rohm-bd71828.h
index eb0557eb5314..5f15c6a309e6 100644
--- a/include/linux/mfd/rohm-bd71828.h
+++ b/include/linux/mfd/rohm-bd71828.h
@@ -422,4 +422,7 @@ enum {
 #define BD71828_OUT_TYPE_OPEN_DRAIN			0x0
 #define BD71828_OUT_TYPE_CMOS				0x2
 
+int bd71828_set_runlevel_voltage(struct regulator *regulator, unsigned int uv,
+				 unsigned int level);
+
 #endif /* __LINUX_MFD_BD71828_H__ */
-- 
2.21.0


-- 
Matti Vaittinen, Linux device drivers
ROHM Semiconductors, Finland SWDC
Kiviharjunlenkki 1E
90220 OULU
FINLAND

~~~ "I don't think so," said Rene Descartes. Just then he vanished ~~~
Simon says - in Latin please.
~~~ "non cogito me" dixit Rene Descarte, deinde evanescavit ~~~
Thanks to Simon Glass for the translation =] 
