Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EC672DA91F
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2019 11:49:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2408697AbfJQJs6 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Oct 2019 05:48:58 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41530 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393860AbfJQJs6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Oct 2019 05:48:58 -0400
Received: by mail-lj1-f194.google.com with SMTP id f5so1824774ljg.8;
        Thu, 17 Oct 2019 02:48:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=xMJ02Rqzj9NWc93++Nb9W5UF63rHZUfgXVTm8mWpXjg=;
        b=dihkTRCBhANBa/eSDNh0GbCI2YxIdGPKlfOJ8jvOF1sMOaeU2WMA0uXmgviz1HOyjR
         FGnu9bSwAyEzAqnX+HSQokVGR8ioxGDsgOUwI2pjD3t7BjkWJGC/HghC/yFd6JeohrD8
         o+nIVHqBpLOHECnayBpQwaYmX1C+II8SX28ku5+Rj9OLGliew2qRQzOG0tD3+Q9Pr97l
         Xf8FzSGvALoXRhhZBV+Jyc8082SSLfRSUEn8VbNbMtg+EhKL61L2SdIsJxc7AaQ5o/Bh
         Fh3yKTw2H8XsY3M3keo3Ny8KWaXkGmnYD/cFFzdN/RN+gjYV6D6ghrnTmHfv6ni1+ydj
         ngZg==
X-Gm-Message-State: APjAAAW25RQF7YQBpANnQcal6a6rKLrvmh471jcB/yryXDBghAYQGjit
        uD9eGj3WN3W+sFZtt2FpHdI=
X-Google-Smtp-Source: APXvYqz0/oYayp2hZ17btVRdqeTc64tgtTlY+zmoR//ykJsHfKIif0XfH7dMad5Ut0HJcpbzOcKHcQ==
X-Received: by 2002:a2e:957:: with SMTP id 84mr1897712ljj.23.1571305733383;
        Thu, 17 Oct 2019 02:48:53 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id c18sm949735ljd.27.2019.10.17.02.48.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 02:48:52 -0700 (PDT)
Date:   Thu, 17 Oct 2019 12:48:40 +0300
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
Subject: [RFC PATCH 06/13] regulator: bd71828: Add GPIO based run-level
 control for regulators
Message-ID: <3ed3393c66759bf9fb85cfc7d5ebf21ba175cdbe.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
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

Bucks 1,2,6 and 7 on RPHM BD71828 can be either controlled as
individual regulartors - or they can be grouped to a group of
regulators that are controlled by 'run levels'. This can be
done via I2C. Each regulator can be assigned a voltage and
enable/disable status for each run-level. These statuses are
also changeable via I2C.

Run-levels can then be changed either by I2C or GPIO. This
control mechanism is selected by data in one time programmable
area (during production) and can't be changed later.

Allow regulators to be controlled via run-levels and allow
getting/setting the current run-level also via GPIO.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---

This patch is intended as a opener for discussion - not as a final
version to be merged in.

 drivers/regulator/bd71828-regulator.c | 373 +++++++++++++++++++++++++-
 1 file changed, 362 insertions(+), 11 deletions(-)

diff --git a/drivers/regulator/bd71828-regulator.c b/drivers/regulator/bd71828-regulator.c
index 44e4e7235346..36f5aef941e5 100644
--- a/drivers/regulator/bd71828-regulator.c
+++ b/drivers/regulator/bd71828-regulator.c
@@ -4,8 +4,10 @@
 //
 
 #include <linux/delay.h>
+#include <linux/device.h>
 #include <linux/err.h>
 #include <linux/gpio.h>
+#include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
 #include <linux/kernel.h>
 #include <linux/mfd/rohm-bd71828.h>
@@ -17,16 +19,27 @@
 #include <linux/regulator/machine.h>
 #include <linux/regulator/of_regulator.h>
 
+#define MAX_GPIO_DVS_BUCKS 4
+#define DVS_RUN_LEVELS 4
+
 struct reg_init {
 	unsigned int reg;
 	unsigned int mask;
 	unsigned int val;
 };
+
+struct run_lvl_ctrl {
+	unsigned int voltage;
+	bool enabled;
+};
+
 struct bd71828_regulator_data {
 	struct regulator_desc desc;
-	const struct rohm_dvs_config dvs;
+	struct rohm_dvs_config dvs;
 	const struct reg_init *reg_inits;
 	int reg_init_amnt;
+	struct run_lvl_ctrl run_lvl[DVS_RUN_LEVELS];
+	struct gpio_descs *gps;
 };
 
 static const struct reg_init buck1_inits[] = {
@@ -41,6 +54,14 @@ static const struct reg_init buck1_inits[] = {
 	},
 };
 
+static const struct reg_init buck1_gpio_inits[] = {
+	{
+		.reg = BD71828_REG_PS_CTRL_1,
+		.mask = BD71828_MASK_DVS_BUCK1_CTRL,
+		.val = BD71828_DVS_BUCK1_USE_RUNLVL,
+	},
+};
+
 static const struct reg_init buck2_inits[] = {
 	{
 		.reg = BD71828_REG_PS_CTRL_1,
@@ -49,6 +70,14 @@ static const struct reg_init buck2_inits[] = {
 	},
 };
 
+static const struct reg_init buck2_gpio_inits[] = {
+	{
+		.reg = BD71828_REG_PS_CTRL_1,
+		.mask = BD71828_MASK_DVS_BUCK2_CTRL,
+		.val = BD71828_DVS_BUCK2_USE_RUNLVL,
+	},
+};
+
 static const struct reg_init buck6_inits[] = {
 	{
 		.reg = BD71828_REG_PS_CTRL_1,
@@ -57,6 +86,14 @@ static const struct reg_init buck6_inits[] = {
 	},
 };
 
+static const struct reg_init buck6_gpio_inits[] = {
+	{
+		.reg = BD71828_REG_PS_CTRL_1,
+		.mask = BD71828_MASK_DVS_BUCK6_CTRL,
+		.val = BD71828_DVS_BUCK6_USE_RUNLVL,
+	},
+};
+
 static const struct reg_init buck7_inits[] = {
 	{
 		.reg = BD71828_REG_PS_CTRL_1,
@@ -65,6 +102,14 @@ static const struct reg_init buck7_inits[] = {
 	},
 };
 
+static const struct reg_init buck7_gpio_inits[] = {
+	{
+		.reg = BD71828_REG_PS_CTRL_1,
+		.mask = BD71828_MASK_DVS_BUCK7_CTRL,
+		.val = BD71828_DVS_BUCK7_USE_RUNLVL,
+	},
+};
+
 static const struct regulator_linear_range bd71828_buck1267_volts[] = {
 	REGULATOR_LINEAR_RANGE(500000, 0x00, 0xef, 6250),
 	REGULATOR_LINEAR_RANGE(2000000, 0xf0, 0xff, 0),
@@ -155,6 +200,80 @@ static int buck_set_hw_dvs_levels(struct device_node *np,
 	return rohm_regulator_set_dvs_levels(&data->dvs, np, desc, cfg->regmap);
 }
 
+static int set_runlevel_voltage(struct regmap *regmap,
+				const struct regulator_desc *desc,
+				unsigned int uv, unsigned int level)
+{
+	int i, ret = -EINVAL;
+	/*
+	 * RUN level registers are next to vsel_reg. RUN0 reg is next, then
+	 * is the RUN 1 reg and so on...
+	 */
+	u8 reg = desc->vsel_reg + level + 1;
+	u8 mask = BD71828_MASK_BUCK1267_VOLT;
+
+	for (i = 0; i < desc->n_voltages; i++) {
+		ret = regulator_desc_list_voltage_linear_range(desc, i);
+		if (ret < 0)
+			continue;
+		if (ret == uv) {
+			i <<= ffs(desc->vsel_mask) - 1;
+			ret = regmap_update_bits(regmap, reg, mask, i);
+			break;
+		}
+	}
+	return ret;
+}
+
+static int buck_set_gpio_hw_dvs_levels(struct device_node *np,
+				       const struct regulator_desc *desc,
+				       struct regulator_config *cfg)
+{
+	struct bd71828_regulator_data *data;
+	uint32_t uv;
+	int i, ret;
+	/* On BD71828 the RUN level control reg is next to enable reg */
+	u8 en_reg = desc->enable_reg + 1;
+	const char *props[DVS_RUN_LEVELS] = { "rohm,dvs-runlevel0-voltage",
+					      "rohm,dvs-runlevel1-voltage",
+					      "rohm,dvs-runlevel2-voltage",
+					      "rohm,dvs-runlevel3-voltage" };
+	u8 en_masks[DVS_RUN_LEVELS] = { BD71828_MASK_RUN0_EN,
+					BD71828_MASK_RUN1_EN,
+					BD71828_MASK_RUN2_EN,
+					BD71828_MASK_RUN3_EN };
+
+	data = container_of(desc, struct bd71828_regulator_data, desc);
+
+	for (i = 0; i < DVS_RUN_LEVELS; i++) {
+		ret = of_property_read_u32(np, props[i], &uv);
+		if (ret) {
+			if (ret != -EINVAL)
+				return ret;
+			uv = 0;
+		}
+		if (uv) {
+			data->run_lvl[i].voltage = uv;
+			data->run_lvl[i].enabled = true;
+
+			ret = set_runlevel_voltage(cfg->regmap, desc, uv, i);
+
+			if (ret)
+				return ret;
+
+			ret = regmap_update_bits(cfg->regmap, en_reg,
+						 en_masks[i], en_masks[i]);
+		} else {
+			ret = regmap_update_bits(cfg->regmap, en_reg,
+						 en_masks[i], 0);
+		}
+		if (ret)
+			return ret;
+	}
+
+	return rohm_regulator_set_dvs_levels(&data->dvs, np, desc, cfg->regmap);
+}
+
 static int ldo6_parse_dt(struct device_node *np,
 			 const struct regulator_desc *desc,
 			 struct regulator_config *cfg)
@@ -189,6 +308,85 @@ static int ldo6_parse_dt(struct device_node *np,
 	return 0;
 }
 
+static int bd71828_dvs_gpio_set_run_level(struct bd71828_regulator_data *rd,
+					  int val)
+{
+	DECLARE_BITMAP(values, 2);
+
+	if (rd->gps->ndescs != 2)
+		return -EINVAL;
+
+	if (val < 0 || val > 3)
+		return -EINVAL;
+
+	values[0] = val;
+
+	return gpiod_set_array_value_cansleep(rd->gps->ndescs, rd->gps->desc,
+				     rd->gps->info, values);
+}
+static int bd71828_dvs_gpio_get_run_level(struct bd71828_regulator_data *rd)
+{
+	int run_level;
+	int ret;
+
+	DECLARE_BITMAP(values, 2);
+
+	values[0] = 0;
+
+	if (rd->gps->ndescs != 2)
+		return -EINVAL;
+
+	ret = gpiod_get_array_value_cansleep(rd->gps->ndescs, rd->gps->desc,
+				     rd->gps->info, values);
+	if (ret)
+		return ret;
+
+	run_level = values[0];
+
+	return run_level;
+}
+
+static int bd71828_dvs_gpio_is_enabled(struct regulator_dev *rdev)
+{
+	struct bd71828_regulator_data *data = rdev_get_drvdata(rdev);
+	int ret;
+
+	// TODO: lock GPIO state (Is this needed)
+	ret = bd71828_dvs_gpio_get_run_level(data);
+	if (ret < 0)
+		goto unlock_out;
+
+	ret = data->run_lvl[ret].enabled;
+
+unlock_out:
+	//TODO: unlock
+
+	return ret;
+}
+
+static int bd71828_dvs_gpio_get_voltage(struct regulator_dev *rdev)
+{
+	int ret;
+	struct bd71828_regulator_data *data = rdev_get_drvdata(rdev);
+
+	// TODO: lock GPIO state (Is this needed)
+	ret = bd71828_dvs_gpio_get_run_level(data);
+	if (ret < 0)
+		goto unlock_out;
+
+	ret = data->run_lvl[ret].voltage;
+
+unlock_out:
+	//TODO: unlock
+
+	return ret;
+}
+
+static const struct regulator_ops dvs_buck_gpio_ops = {
+	.is_enabled = bd71828_dvs_gpio_is_enabled,
+	.get_voltage = bd71828_dvs_gpio_get_voltage,
+};
+
 static const struct regulator_ops bd71828_buck_ops = {
 	.enable = regulator_enable_regmap,
 	.disable = regulator_disable_regmap,
@@ -773,6 +971,132 @@ static const struct bd71828_regulator_data bd71828_rdata[] = {
 	},
 };
 
+struct bd71828_gpio_cfg {
+	unsigned int gpiobucks;
+	struct gpio_descs *gps;
+};
+
+static int check_dt_for_gpio_controls(struct device *d,
+				      struct bd71828_gpio_cfg *g)
+{
+	int ret, i;
+	struct device_node *np = d->of_node;
+	const char *prop = "rohm,dvs_gpio_bucks";
+	uint32_t bucks[MAX_GPIO_DVS_BUCKS];
+
+	g->gps = devm_gpiod_get_array(d, "rohm,dvs-vsel", GPIOD_OUT_LOW);
+
+	if (IS_ERR(g->gps)) {
+		ret = PTR_ERR(g->gps);
+		if (ret == -ENOENT)
+			return 0;
+		return ret;
+	}
+
+	if (g->gps->ndescs != 2)
+		return -ENOENT;
+
+	ret = of_property_read_variable_u32_array(np, prop, bucks, 0,
+						  ARRAY_SIZE(bucks));
+
+	if (ret < 0) {
+		if (ret == -EOVERFLOW)
+			return -EINVAL;
+	}
+	for (i = 0; i < ret; i++)
+		g->gpiobucks |= 1 << bucks[i];
+
+	return 0;
+}
+
+static void set_buck_gpio_controlled(struct rohm_regmap_dev *bd71828,
+				     struct bd71828_regulator_data *rd,
+				     struct bd71828_gpio_cfg *g)
+{
+	switch (rd->desc.id) {
+	case BD71828_BUCK1:
+		rd->reg_inits = buck1_gpio_inits;
+		break;
+	case BD71828_BUCK2:
+		rd->reg_inits = buck2_gpio_inits;
+		break;
+	case BD71828_BUCK6:
+		rd->reg_inits = buck6_gpio_inits;
+		break;
+	case BD71828_BUCK7:
+		rd->reg_inits = buck7_gpio_inits;
+		break;
+	default:
+		return;
+	}
+	/*
+	 * Disallow setters. Get voltages/enable states based
+	 * on current RUN level
+	 */
+	rd->gps = g->gps;
+	rd->desc.ops = &dvs_buck_gpio_ops;
+	rd->desc.of_parse_cb = buck_set_gpio_hw_dvs_levels;
+}
+
+static ssize_t show_runlevel(struct device *dev,
+			   struct device_attribute *attr, char *buf)
+{
+	int runlevel;
+	struct bd71828_regulator_data *rd = dev_get_drvdata(dev);
+
+	if (!rd || !rd->gps)
+		return -ENOENT;
+
+	runlevel = bd71828_dvs_gpio_get_run_level(rd);
+	if (runlevel < 0)
+		return runlevel;
+
+	return sprintf(buf, "0x%x\n", runlevel);
+}
+
+static ssize_t set_runlevel(struct device *dev, struct device_attribute *attr,
+			  const char *buf, size_t count)
+{
+	struct bd71828_regulator_data *rd = dev_get_drvdata(dev);
+	long val;
+
+	if (kstrtol(buf, 0, &val) != 0)
+		return -EINVAL;
+
+	val = bd71828_dvs_gpio_set_run_level(rd, val);
+	if (val)
+		return val;
+
+	return count;
+}
+
+static DEVICE_ATTR(runlevel, 0664, show_runlevel, set_runlevel);
+
+static struct attribute *runlevel_attributes[] = {
+	&dev_attr_runlevel.attr,
+	NULL
+};
+
+static const struct attribute_group bd71828_attr_group = {
+	.attrs	= runlevel_attributes,
+};
+
+static int bd71828_create_sysfs(struct platform_device *pdev)
+{
+	return sysfs_create_group(&pdev->dev.kobj, &bd71828_attr_group);
+}
+
+static int bd71828_remove_sysfs(struct platform_device *pdev)
+{
+	sysfs_remove_group(&pdev->dev.kobj, &bd71828_attr_group);
+	return 0;
+}
+
+static int bd71828_remove(struct platform_device *pdev)
+{
+	return bd71828_remove_sysfs(pdev);
+}
+
 static int bd71828_probe(struct platform_device *pdev)
 {
 	struct rohm_regmap_dev *bd71828;
@@ -780,6 +1104,8 @@ static int bd71828_probe(struct platform_device *pdev)
 	struct regulator_config config = {
 		.dev = pdev->dev.parent,
 	};
+	struct bd71828_gpio_cfg gcfg = {0};
+	struct bd71828_regulator_data *rd;
 
 	bd71828 = dev_get_drvdata(pdev->dev.parent);
 	if (!bd71828) {
@@ -787,35 +1113,59 @@ static int bd71828_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	ret = check_dt_for_gpio_controls(pdev->dev.parent, &gcfg);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to get DVS gpio resources\n");
+		return ret;
+	}
+
+	/*
+	 * Allocate device data to allow controlling more than one PMICs
+	 */
+	rd = devm_kmalloc_array(&pdev->dev, ARRAY_SIZE(bd71828_rdata),
+				sizeof(*rd), GFP_KERNEL);
+	if (!rd)
+		return -ENOMEM;
+
+	dev_set_drvdata(&pdev->dev, rd);
+
+	for (i = 0; i < ARRAY_SIZE(bd71828_rdata); i++) {
+		/* Use bd71828_rdata as template */
+		rd[i] = bd71828_rdata[i];
+
+		if (gcfg.gpiobucks & (1 << i))
+			set_buck_gpio_controlled(bd71828, &rd[i], &gcfg);
+	}
+
 	config.regmap = bd71828->regmap;
 
 	for (i = 0; i < ARRAY_SIZE(bd71828_rdata); i++) {
 		struct regulator_dev *rdev;
-		const struct bd71828_regulator_data *rd;
 
-		rd = &bd71828_rdata[i];
+		config.driver_data = &rd[i];
+
 		rdev = devm_regulator_register(&pdev->dev,
-					       &rd->desc, &config);
+					       &rd[i].desc, &config);
 		if (IS_ERR(rdev)) {
 			dev_err(&pdev->dev,
 				"failed to register %s regulator\n",
-				rd->desc.name);
+				rd[i].desc.name);
 			return PTR_ERR(rdev);
 		}
-		for (j = 0; j < rd->reg_init_amnt; j++) {
+		for (j = 0; j < rd[i].reg_init_amnt; j++) {
 			ret = regmap_update_bits(bd71828->regmap,
-						 rd->reg_inits[j].reg,
-						 rd->reg_inits[j].mask,
-						 rd->reg_inits[j].val);
+						 rd[i].reg_inits[j].reg,
+						 rd[i].reg_inits[j].mask,
+						 rd[i].reg_inits[j].val);
 			if (ret) {
 				dev_err(&pdev->dev,
 					"regulator %s init failed\n",
-					rd->desc.name);
+					rd[i].desc.name);
 				return ret;
 			}
 		}
 	}
-	return 0;
+	return bd71828_create_sysfs(pdev);
 }
 
 static struct platform_driver bd71828_regulator = {
@@ -823,6 +1173,7 @@ static struct platform_driver bd71828_regulator = {
 		.name = "bd71828-pmic"
 	},
 	.probe = bd71828_probe,
+	.remove = bd71828_remove,
 };
 
 module_platform_driver(bd71828_regulator);
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
