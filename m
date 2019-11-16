Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3190FF527
	for <lists+linux-gpio@lfdr.de>; Sat, 16 Nov 2019 20:01:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727675AbfKPTA5 (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Sat, 16 Nov 2019 14:00:57 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:46317 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727577AbfKPTA5 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 16 Nov 2019 14:00:57 -0500
Received: by mail-lf1-f67.google.com with SMTP id o65so10547445lff.13;
        Sat, 16 Nov 2019 11:00:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=SQwlIZYwgZ7E+PjgzbBwJtHBofQGrr7XQxaCSgUXJEs=;
        b=fW7+Z9LNAQ2KoqdZt8SDe0oIhdnxp34RwYZGRMEPhnscfr2aoT5zo2/uVwdi4idjyv
         zzOHnJEu4Ki4xjsmK1Ls9e9KnzAAtyzq4M4FUWbRj03aqMmkTQRQz1JKTaehd5jNpg5i
         1wrpcyXcmFUS1lO1R0H7MUuTn5+a0uKRv40qZXiZLSnJsGYevhrHV3JUy4Df6CvrpMCp
         xp/6KB2oTuzK8S0iMgAX233A3Oq3kc16HONYXi+NqKdgqdwe8sGQm/x5txjU1+cQjcGv
         1W0QpAWTGvO4OliPiZzaju2xmJIXocgtNS0oT8x9rLTB1Pi3gClMkBWIOLk70eKH/J4Z
         amXg==
X-Gm-Message-State: APjAAAWKQHg2ctmC55kkYtOuVkew4bXqGxHMyvEvfEK6+mBq24pQ/7QR
        TWFL/SO9KXbwOKwImdKuzvg=
X-Google-Smtp-Source: APXvYqzqcfNOjCOwZFxa8T8vyKx9bJfoydU64GyU+d2dttIwOXa4bcHEIygfHfqAleSv7OvnrkJ6ig==
X-Received: by 2002:a19:9116:: with SMTP id t22mr14427960lfd.99.1573930852121;
        Sat, 16 Nov 2019 11:00:52 -0800 (PST)
Received: from localhost.localdomain (dyttqz39y2bkc1ryvyh3t-4.rev.dnainternet.fi. [2001:14bb:420:da5f:a0b0:502a:b811:1af])
        by smtp.gmail.com with ESMTPSA id d5sm5847233ljc.51.2019.11.16.11.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Nov 2019 11:00:51 -0800 (PST)
Date:   Sat, 16 Nov 2019 21:00:43 +0200
From:   Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To:     matti.vaittinen@fi.rohmeurope.com, mazziesaccount@gmail.com
Cc:     Lee Jones <lee.jones@linaro.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Jeff Kirsher <jeffrey.t.kirsher@intel.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Nicholas Mc Guire <hofrat@osadl.org>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-rtc@vger.kernel.org
Subject: [PATCH v4 12/16] regulator: bd71828: Add GPIO based run-level
 control for regulators
Message-ID: <23d38cc0d086069ea0b95229c220465a2336d7f8.1573928775.git.matti.vaittinen@fi.rohmeurope.com>
References: <cover.1573928775.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1573928775.git.matti.vaittinen@fi.rohmeurope.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Bucks 1,2,6 and 7 on ROHM BD71828 can be either controlled as
individual regulartors - or they can be grouped to a group of
regulators that are controlled by 'run levels'. This can be
done via I2C. Each regulator can be assigned a voltage and
enable/disable status for each run-level. These statuses are
also changeable via I2C.

Run-levels can then be changed either by I2C or GPIO. This
control mechanism is selected by data in one time programmable
area (during production) and can't be changed later.

Allow:
 - configuring regulators to be controlled via run-levels
 - allow getting/setting the current run-level via in-kernel API
   using either GPIO or I2C underneath
 - Allow run-time changes to run-level voltages via in-kernel API
Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/regulator/bd71828-regulator.c | 561 +++++++++++++++++++++++++-
 include/linux/mfd/rohm-bd71828.h      |   5 +
 2 files changed, 556 insertions(+), 10 deletions(-)

diff --git a/drivers/regulator/bd71828-regulator.c b/drivers/regulator/bd71828-regulator.c
index b113cec41969..411e6a297da6 100644
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
@@ -17,16 +19,37 @@
 #include <linux/regulator/machine.h>
 #include <linux/regulator/of_regulator.h>
 
+/* Drivers should not do this. But we provide this custom kernel interface
+ * for users to switch the run-level. Hence we need to get the rdev from
+ * struct regulator
+ */
+#include "internal.h"
+
+#define MAX_GPIO_DVS_BUCKS 4
+#define DVS_RUN_LEVELS 4
+#define BD71828_RUNLVL_DEFAULT_UV 500000
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
+	struct mutex dvs_lock;
+	struct gpio_descs *gps;
+	struct regmap *regmap;
+	bool allow_runlvl;
 };
 
 static const struct reg_init buck1_inits[] = {
@@ -41,6 +64,14 @@ static const struct reg_init buck1_inits[] = {
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
@@ -49,6 +80,14 @@ static const struct reg_init buck2_inits[] = {
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
@@ -57,6 +96,14 @@ static const struct reg_init buck6_inits[] = {
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
@@ -65,6 +112,14 @@ static const struct reg_init buck7_inits[] = {
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
@@ -155,6 +210,83 @@ static int buck_set_hw_dvs_levels(struct device_node *np,
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
+static int buck_set_runlvl_hw_dvs_levels(struct device_node *np,
+				       const struct regulator_desc *desc,
+				       struct regulator_config *cfg)
+{
+	struct bd71828_regulator_data *data;
+	/* Default to 'disabled' (0 uV) if no property found */
+	uint32_t uv[DVS_RUN_LEVELS] = {0};
+	int i, ret;
+	const char *prop = "rohm,dvs-runlevel-microvolts";
+	/* On BD71828 the RUN level control reg is next to enable reg */
+	u8 en_reg = desc->enable_reg + 1;
+	u8 en_masks[DVS_RUN_LEVELS] = { BD71828_MASK_RUN0_EN,
+					BD71828_MASK_RUN1_EN,
+					BD71828_MASK_RUN2_EN,
+					BD71828_MASK_RUN3_EN };
+
+	data = container_of(desc, struct bd71828_regulator_data, desc);
+
+	ret = of_property_read_variable_u32_array(np, prop, uv, 1,
+						  DVS_RUN_LEVELS);
+	if (ret < 0 && ret != -EINVAL)
+		return ret;
+
+	mutex_lock(&data->dvs_lock);
+	for (i = 0; i < DVS_RUN_LEVELS; i++) {
+		if (uv[i]) {
+			data->run_lvl[i].voltage = uv[i];
+			data->run_lvl[i].enabled = true;
+
+			ret = set_runlevel_voltage(cfg->regmap, desc, uv[i], i);
+			if (ret)
+				goto unlock_out;
+
+			ret = regmap_update_bits(cfg->regmap, en_reg,
+						 en_masks[i], en_masks[i]);
+		} else {
+			data->run_lvl[i].voltage = BD71828_RUNLVL_DEFAULT_UV;
+			ret = regmap_update_bits(cfg->regmap, en_reg,
+						 en_masks[i], 0);
+		}
+		if (ret)
+			goto unlock_out;
+	}
+
+	ret = rohm_regulator_set_dvs_levels(&data->dvs, np, desc, cfg->regmap);
+
+unlock_out:
+	mutex_unlock(&data->dvs_lock);
+
+	return ret;
+}
+
 static int ldo6_parse_dt(struct device_node *np,
 			 const struct regulator_desc *desc,
 			 struct regulator_config *cfg)
@@ -189,6 +321,265 @@ static int ldo6_parse_dt(struct device_node *np,
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
+static int bd71828_dvs_gpio_get_run_level(struct bd71828_regulator_data *rd)
+{
+	int run_level;
+	int ret;
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
+static int bd71828_dvs_gpio_is_enabled(struct regulator_dev *rdev)
+{
+	struct bd71828_regulator_data *data = rdev_get_drvdata(rdev);
+	int ret;
+
+	mutex_lock(&data->dvs_lock);
+	ret = bd71828_dvs_gpio_get_run_level(data);
+	if (ret < 0 || ret >= DVS_RUN_LEVELS)
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
+static int bd71828_dvs_gpio_get_voltage(struct regulator_dev *rdev)
+{
+	int ret;
+	struct bd71828_regulator_data *data = rdev_get_drvdata(rdev);
+
+	mutex_lock(&data->dvs_lock);
+	ret = bd71828_dvs_gpio_get_run_level(data);
+	if (ret < 0 || DVS_RUN_LEVELS <= ret)
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
+
+	return ret;
+}
+EXPORT_SYMBOL(bd71828_set_runlevel_voltage);
+
+/**
+ * bd71828_set_runlevel - change system run-level.
+ *
+ * @regulator:	pointer to one of the BD71828 regulators obtained by
+ *		call to regulator_get
+ * @level:	New run-level the system should enter
+ *
+ * Changes the system to run-level which was given as argument. This
+ * operation will change state of all regulators which are set to be
+ * controlled by run-levels. Note that 'regulator' must point to a
+ * regulator which is controlled by run-levels.
+ */
+int bd71828_set_runlevel(struct regulator *regulator, unsigned int level)
+{
+	struct regulator_dev *rdev = regulator->rdev;
+	struct bd71828_regulator_data *rd = rdev_get_drvdata(rdev);
+
+	if (!rd)
+		return -ENOENT;
+
+	if (!rd || !rd->allow_runlvl)
+		return -EINVAL;
+
+	if (rd->gps)
+		return bd71828_dvs_gpio_set_run_level(rd, level);
+
+	return bd71828_dvs_i2c_set_run_level(rd->regmap, level);
+}
+EXPORT_SYMBOL(bd71828_set_runlevel);
+
+/**
+ * bd71828_get_runlevel - get the current system run-level.
+ *
+ * @regulator:	pointer to one of the BD71828 regulators obtained by
+ *		call to regulator_get
+ * @level:	Pointer to value where current run-level is stored
+ *
+ * Returns the current system run-level. Note that 'regulator' must
+ * point to a regulator which is controlled by run-levels.
+ */
+int bd71828_get_runlevel(struct regulator *regulator, unsigned int *level)
+{
+	struct regulator_dev *rdev = regulator->rdev;
+	struct bd71828_regulator_data *rd = rdev_get_drvdata(rdev);
+	int ret;
+
+	if (!rd)
+		return -ENOENT;
+
+	if (!rd || !rd->allow_runlvl)
+		return -EINVAL;
+
+	if (!rd->gps)
+		ret = bd71828_dvs_i2c_get_run_level(rd->regmap, rd);
+	else
+		ret = bd71828_dvs_gpio_get_run_level(rd);
+
+	if (ret < 0)
+		return ret;
+
+	*level = (unsigned int) ret;
+
+	return 0;
+}
+EXPORT_SYMBOL(bd71828_get_runlevel);
+
+
+static const struct regulator_ops dvs_buck_gpio_ops = {
+	.is_enabled = bd71828_dvs_gpio_is_enabled,
+	.get_voltage = bd71828_dvs_gpio_get_voltage,
+};
+
+static const struct regulator_ops dvs_buck_i2c_ops = {
+	.is_enabled = bd71828_dvs_i2c_is_enabled,
+	.get_voltage = bd71828_dvs_i2c_get_voltage,
+};
+
 static const struct regulator_ops bd71828_buck_ops = {
 	.enable = regulator_enable_regmap,
 	.disable = regulator_disable_regmap,
@@ -773,6 +1164,127 @@ static const struct bd71828_regulator_data bd71828_rdata[] = {
 	},
 };
 
+struct bd71828_gpio_cfg {
+	bool use_gpio;
+	unsigned int runlvl;
+	struct gpio_descs *gps;
+};
+
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
+static int check_dt_for_gpio_controls(struct device *d,
+				      struct bd71828_gpio_cfg *g)
+{
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
+
+	g->gps = devm_gpiod_get_parent_array(d, "rohm,dvs-vsel", GPIOD_OUT_LOW);
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
+	g->use_gpio = true;
+
+	return 0;
+}
+
+static void set_buck_runlvl_controlled(struct rohm_regmap_dev *bd71828,
+				      struct bd71828_regulator_data *rd,
+				      struct bd71828_gpio_cfg *g)
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
+
+	/*
+	 * Disallow setters. Get voltages/enable states based
+	 * on current RUN level
+	 */
+	rd->allow_runlvl = true;
+
+	if (g->use_gpio) {
+		rd->gps = g->gps;
+		rd->desc.ops = &dvs_buck_gpio_ops;
+	} else {
+		rd->desc.ops = &dvs_buck_i2c_ops;
+	}
+	rd->desc.of_parse_cb = buck_set_runlvl_hw_dvs_levels;
+}
+
 static int bd71828_probe(struct platform_device *pdev)
 {
 	struct rohm_regmap_dev *bd71828;
@@ -780,6 +1292,8 @@ static int bd71828_probe(struct platform_device *pdev)
 	struct regulator_config config = {
 		.dev = pdev->dev.parent,
 	};
+	struct bd71828_gpio_cfg gcfg = {0};
+	struct bd71828_regulator_data *rd;
 
 	bd71828 = dev_get_drvdata(pdev->dev.parent);
 	if (!bd71828) {
@@ -787,30 +1301,57 @@ static int bd71828_probe(struct platform_device *pdev)
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
+		mutex_init(&rd[i].dvs_lock);
+		if (gcfg.runlvl & (1 << i))
+			set_buck_runlvl_controlled(bd71828, &rd[i], &gcfg);
+
+		rd[i].regmap = bd71828->regmap;
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
diff --git a/include/linux/mfd/rohm-bd71828.h b/include/linux/mfd/rohm-bd71828.h
index d013e03f742d..fc0955f0662c 100644
--- a/include/linux/mfd/rohm-bd71828.h
+++ b/include/linux/mfd/rohm-bd71828.h
@@ -418,4 +418,9 @@ enum {
 #define BD71828_OUT_TYPE_OPEN_DRAIN			0x0
 #define BD71828_OUT_TYPE_CMOS				0x2
 
+int bd71828_set_runlevel_voltage(struct regulator *regulator, unsigned int uv,
+				 unsigned int level);
+int bd71828_set_runlevel(struct regulator *regulator, unsigned int level);
+int bd71828_get_runlevel(struct regulator *regulator, unsigned int *level);
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
