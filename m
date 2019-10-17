Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F48ADA8FC
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2019 11:46:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392604AbfJQJpG (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Oct 2019 05:45:06 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:42421 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728022AbfJQJpF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Oct 2019 05:45:05 -0400
Received: by mail-lj1-f193.google.com with SMTP id y23so1809341lje.9;
        Thu, 17 Oct 2019 02:45:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9cepIFDs6VKhbCy115hQHSPI/VM4Wk3kRHVEHfJm8xo=;
        b=DIpRXaVUCLKbnl91cgnJp46Wu5+obc4LY5EjTgJAtsWrdzrqAkDScmj1BNJ2BTquOX
         WESk61uSL1y3+btVe8uYPNDnI+tRPU6E021nFHIHNisib81ETlOYyoS38Qn37S1iwjc8
         jww6JV7WC45j1jtxSS0mhw9ufIIyWFJHgJ9O4SLXzOr7hCf37mrhJazFEE5SbdaMrw/M
         nY0O4sYRwQmNX2YLtTyuDR5vLsTxibRLwZ1laf6XTlC7afYoa9+PODGO9qoUtr8vi4Ge
         dPXt6ckz4Jgl2QEP8EkWXC477OLnSxbPQXIf6kpLIbfR1o/lZ8yFktsvOmEMfng9lJD9
         2RsQ==
X-Gm-Message-State: APjAAAXA4e8YF3NoPAYwIP4pxN3TTT45IB5w/kC6oI2q9LwhGagKWKUA
        fhLyOdn+vkb73mPsVLKfLTo=
X-Google-Smtp-Source: APXvYqz26ffsKkD8OqSUA2nBJ6d+9egjwp2FbxgUTO9OlKDuOapt/OxI2TRR5/8twm+fmiZwFTdfOg==
X-Received: by 2002:a05:651c:112e:: with SMTP id e14mr1833940ljo.193.1571305500286;
        Thu, 17 Oct 2019 02:45:00 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id v22sm745580ljh.56.2019.10.17.02.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 02:44:59 -0700 (PDT)
Date:   Thu, 17 Oct 2019 12:44:52 +0300
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
Subject: [RFC PATCH 05/13] regulator: bd71828: Basic support for ROHM bd71828
 PMIC regulators
Message-ID: <dab20840eaf7301fbff489b60c058a80537ab757.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
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

ROHM BD71828 is a power management IC containing 7 bucks and 7 LDOs. Bucks
1,2,6 and 7 can be assigned to a regulator group controlled by run-levels.
Eg. Voltages and enable/disable statuses for specific run-levels (run0 to
run3) can be set via register interface and run level changes can then be
done either via I2C or GPIO.

This initial commit does not support assigning bucks to be controlled via
run-levels but only allows them to be individually controlled.

LDO5 voltage can also be controlled by GPIO2 pin and register interfaces
but this driver only supports the control via register.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/regulator/Kconfig             |  12 +
 drivers/regulator/Makefile            |   1 +
 drivers/regulator/bd71828-regulator.c | 832 ++++++++++++++++++++++++++
 3 files changed, 845 insertions(+)
 create mode 100644 drivers/regulator/bd71828-regulator.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 74de76bf98d7..8c94a35d059a 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -193,6 +193,18 @@ config REGULATOR_BD70528
 	  This driver can also be built as a module. If so, the module
 	  will be called bd70528-regulator.
 
+config REGULATOR_BD71828
+	tristate "ROHM BD71828 Power Regulator"
+	depends on MFD_ROHM_BD71828
+	select REGULATOR_ROHM
+	help
+	  This driver supports voltage regulators on ROHM BD71828 PMIC.
+	  This will enable support for the software controllable buck
+	  and LDO regulators.
+
+	  This driver can also be built as a module. If so, the module
+	  will be called bd71828-regulator.
+
 config REGULATOR_BD718XX
 	tristate "ROHM BD71837 Power Regulator"
 	depends on MFD_ROHM_BD718XX
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 41e4055d2d66..b363b592a429 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -28,6 +28,7 @@ obj-$(CONFIG_REGULATOR_AS3722) += as3722-regulator.o
 obj-$(CONFIG_REGULATOR_AXP20X) += axp20x-regulator.o
 obj-$(CONFIG_REGULATOR_BCM590XX) += bcm590xx-regulator.o
 obj-$(CONFIG_REGULATOR_BD70528) += bd70528-regulator.o
+obj-$(CONFIG_REGULATOR_BD71828) += bd71828-regulator.o
 obj-$(CONFIG_REGULATOR_BD718XX) += bd718x7-regulator.o
 obj-$(CONFIG_REGULATOR_BD9571MWV) += bd9571mwv-regulator.o
 obj-$(CONFIG_REGULATOR_DA903X)	+= da903x.o
diff --git a/drivers/regulator/bd71828-regulator.c b/drivers/regulator/bd71828-regulator.c
new file mode 100644
index 000000000000..44e4e7235346
--- /dev/null
+++ b/drivers/regulator/bd71828-regulator.c
@@ -0,0 +1,832 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2019 ROHM Semiconductors
+// bd71828-regulator.c ROHM BD71828GW-DS1 regulator driver
+//
+
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/gpio.h>
+#include <linux/interrupt.h>
+#include <linux/kernel.h>
+#include <linux/mfd/rohm-bd71828.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/machine.h>
+#include <linux/regulator/of_regulator.h>
+
+struct reg_init {
+	unsigned int reg;
+	unsigned int mask;
+	unsigned int val;
+};
+struct bd71828_regulator_data {
+	struct regulator_desc desc;
+	const struct rohm_dvs_config dvs;
+	const struct reg_init *reg_inits;
+	int reg_init_amnt;
+};
+
+static const struct reg_init buck1_inits[] = {
+	/*
+	 * DVS Buck voltages can be changed by register values or via GPIO.
+	 * Use register accesses by default.
+	 */
+	{
+		.reg = BD71828_REG_PS_CTRL_1,
+		.mask = BD71828_MASK_DVS_BUCK1_CTRL,
+		.val = BD71828_DVS_BUCK1_CTRL_I2C,
+	},
+};
+
+static const struct reg_init buck2_inits[] = {
+	{
+		.reg = BD71828_REG_PS_CTRL_1,
+		.mask = BD71828_MASK_DVS_BUCK2_CTRL,
+		.val = BD71828_DVS_BUCK2_CTRL_I2C,
+	},
+};
+
+static const struct reg_init buck6_inits[] = {
+	{
+		.reg = BD71828_REG_PS_CTRL_1,
+		.mask = BD71828_MASK_DVS_BUCK6_CTRL,
+		.val = BD71828_DVS_BUCK6_CTRL_I2C,
+	},
+};
+
+static const struct reg_init buck7_inits[] = {
+	{
+		.reg = BD71828_REG_PS_CTRL_1,
+		.mask = BD71828_MASK_DVS_BUCK7_CTRL,
+		.val = BD71828_DVS_BUCK7_CTRL_I2C,
+	},
+};
+
+static const struct regulator_linear_range bd71828_buck1267_volts[] = {
+	REGULATOR_LINEAR_RANGE(500000, 0x00, 0xef, 6250),
+	REGULATOR_LINEAR_RANGE(2000000, 0xf0, 0xff, 0),
+};
+
+static const struct regulator_linear_range bd71828_buck3_volts[] = {
+	REGULATOR_LINEAR_RANGE(1200000, 0x00, 0x0f, 50000),
+	REGULATOR_LINEAR_RANGE(2000000, 0x10, 0x1f, 0),
+};
+
+static const struct regulator_linear_range bd71828_buck4_volts[] = {
+	REGULATOR_LINEAR_RANGE(1000000, 0x00, 0x1f, 25000),
+	REGULATOR_LINEAR_RANGE(1800000, 0x20, 0x3f, 0),
+};
+
+static const struct regulator_linear_range bd71828_buck5_volts[] = {
+	REGULATOR_LINEAR_RANGE(2500000, 0x00, 0x0f, 50000),
+	REGULATOR_LINEAR_RANGE(3300000, 0x10, 0x1f, 0),
+};
+
+static const struct regulator_linear_range bd71828_ldo_volts[] = {
+	REGULATOR_LINEAR_RANGE(800000, 0x00, 0x31, 50000),
+	REGULATOR_LINEAR_RANGE(3300000, 0x32, 0x3f, 0),
+};
+
+static int ramp_delay_supported(struct regulator_dev *rdev)
+{
+	switch (rdev->desc->id) {
+	case BD71828_BUCK1:
+	case BD71828_BUCK2:
+	case BD71828_BUCK6:
+	case BD71828_BUCK7:
+		return 1;
+	default:
+		break;
+	}
+	return 0;
+}
+
+static int bd71828_set_ramp_delay(struct regulator_dev *rdev, int ramp_delay)
+{
+	unsigned int val;
+
+	if (!ramp_delay_supported(rdev)) {
+		dev_err(&rdev->dev, "%s: can't set ramp-delay\n",
+			rdev->desc->name);
+		return -EINVAL;
+	}
+
+	switch (ramp_delay) {
+	case 1 ... 2500:
+		val = 0;
+		break;
+	case 2501 ... 5000:
+		val = 1;
+		break;
+	case 5001 ... 10000:
+		val = 2;
+		break;
+	case 10001 ... 20000:
+		val = 3;
+		break;
+	default:
+		val = 3;
+		dev_err(&rdev->dev,
+			"ramp_delay: %d not supported, setting 20mV/uS",
+			 ramp_delay);
+	}
+
+	/*
+	 * On BD71828 the ramp delay level control reg is at offset +2 to
+	 * enable reg
+	 */
+	return regmap_update_bits(rdev->regmap, rdev->desc->enable_reg + 2,
+				  BD71828_MASK_RAMP_DELAY,
+				  val << (ffs(BD71828_MASK_RAMP_DELAY) - 1));
+
+}
+
+static int buck_set_hw_dvs_levels(struct device_node *np,
+				  const struct regulator_desc *desc,
+				  struct regulator_config *cfg)
+{
+	struct bd71828_regulator_data *data;
+
+	data = container_of(desc, struct bd71828_regulator_data, desc);
+
+	return rohm_regulator_set_dvs_levels(&data->dvs, np, desc, cfg->regmap);
+}
+
+static int ldo6_parse_dt(struct device_node *np,
+			 const struct regulator_desc *desc,
+			 struct regulator_config *cfg)
+{
+	int ret, i;
+	uint32_t uv = 0;
+	unsigned int en;
+	struct regmap *regmap = cfg->regmap;
+	static const char * const props[] = { "rohm,dvs-run-voltage",
+					      "rohm,dvs-idle-voltage",
+					      "rohm,dvs-suspend-voltage",
+					      "rohm,dvs-lpsr-voltage" };
+	unsigned int mask[] = { BD71828_MASK_RUN_EN, BD71828_MASK_IDLE_EN,
+			       BD71828_MASK_SUSP_EN, BD71828_MASK_LPSR_EN };
+
+	for (i = 0; i < ARRAY_SIZE(props); i++) {
+		ret = of_property_read_u32(np, props[i], &uv);
+		if (ret) {
+			if (ret != -EINVAL)
+				return ret;
+			continue;
+		}
+		if (uv)
+			en = 0xffffffff;
+		else
+			en = 0;
+
+		ret = regmap_update_bits(regmap, desc->enable_reg, mask[i], en);
+		if (ret)
+			return ret;
+	}
+	return 0;
+}
+
+static const struct regulator_ops bd71828_buck_ops = {
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.list_voltage = regulator_list_voltage_linear_range,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+};
+
+static const struct regulator_ops bd71828_dvs_buck_ops = {
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.list_voltage = regulator_list_voltage_linear_range,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+	.set_voltage_time_sel = regulator_set_voltage_time_sel,
+	.set_ramp_delay = bd71828_set_ramp_delay,
+};
+
+static const struct regulator_ops bd71828_ldo_ops = {
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.is_enabled = regulator_is_enabled_regmap,
+	.list_voltage = regulator_list_voltage_linear_range,
+	.set_voltage_sel = regulator_set_voltage_sel_regmap,
+	.get_voltage_sel = regulator_get_voltage_sel_regmap,
+};
+
+static int bd71828_ldo6_get_voltage(struct regulator_dev *rdev)
+{
+	return BD71828_LDO_6_VOLTAGE;
+}
+
+static const struct regulator_ops bd71828_ldo6_ops = {
+	.enable = regulator_enable_regmap,
+	.disable = regulator_disable_regmap,
+	.get_voltage = bd71828_ldo6_get_voltage,
+	.is_enabled = regulator_is_enabled_regmap,
+};
+
+static const struct bd71828_regulator_data bd71828_rdata[] = {
+	{
+		.desc = {
+			.name = "buck1",
+			.of_match = of_match_ptr("BUCK1"),
+			.regulators_node = of_match_ptr("regulators"),
+			.id = BD71828_BUCK1,
+			.ops = &bd71828_dvs_buck_ops,
+			.type = REGULATOR_VOLTAGE,
+			.linear_ranges = bd71828_buck1267_volts,
+			.n_linear_ranges = ARRAY_SIZE(bd71828_buck1267_volts),
+			.n_voltages = BD71828_BUCK1267_VOLTS,
+			.enable_reg = BD71828_REG_BUCK1_EN,
+			.enable_mask = BD71828_MASK_RUN_EN,
+			.vsel_reg = BD71828_REG_BUCK1_VOLT,
+			.vsel_mask = BD71828_MASK_BUCK1267_VOLT,
+			.owner = THIS_MODULE,
+			.of_parse_cb = buck_set_hw_dvs_levels,
+		},
+		.dvs = {
+			.level_map = ROHM_DVS_LEVEL_RUN | ROHM_DVS_LEVEL_IDLE |
+				     ROHM_DVS_LEVEL_SUSPEND |
+				     ROHM_DVS_LEVEL_LPSR,
+			.run_reg = BD71828_REG_BUCK1_VOLT,
+			.run_mask = BD71828_MASK_BUCK1267_VOLT,
+			.idle_reg = BD71828_REG_BUCK1_IDLE_VOLT,
+			.idle_mask = BD71828_MASK_BUCK1267_VOLT,
+			.idle_on_mask = BD71828_MASK_IDLE_EN,
+			.suspend_reg = BD71828_REG_BUCK1_SUSP_VOLT,
+			.suspend_mask = BD71828_MASK_BUCK1267_VOLT,
+			.suspend_on_mask = BD71828_MASK_SUSP_EN,
+			.lpsr_on_mask = BD71828_MASK_LPSR_EN,
+			/*
+			 * LPSR voltage is same as SUSPEND voltage. Allow
+			 * setting it so that regulator can be set enabled at
+			 * LPSR state
+			 */
+			.lpsr_reg = BD71828_REG_BUCK1_SUSP_VOLT,
+			.lpsr_mask = BD71828_MASK_BUCK1267_VOLT,
+		},
+		.reg_inits = buck1_inits,
+		.reg_init_amnt = ARRAY_SIZE(buck1_inits),
+	},
+	{
+		.desc = {
+			.name = "buck2",
+			.of_match = of_match_ptr("BUCK2"),
+			.regulators_node = of_match_ptr("regulators"),
+			.id = BD71828_BUCK2,
+			.ops = &bd71828_dvs_buck_ops,
+			.type = REGULATOR_VOLTAGE,
+			.linear_ranges = bd71828_buck1267_volts,
+			.n_linear_ranges = ARRAY_SIZE(bd71828_buck1267_volts),
+			.n_voltages = BD71828_BUCK1267_VOLTS,
+			.enable_reg = BD71828_REG_BUCK2_EN,
+			.enable_mask = BD71828_MASK_RUN_EN,
+			.vsel_reg = BD71828_REG_BUCK2_VOLT,
+			.vsel_mask = BD71828_MASK_BUCK1267_VOLT,
+			.owner = THIS_MODULE,
+			.of_parse_cb = buck_set_hw_dvs_levels,
+		},
+		.dvs = {
+			.level_map = ROHM_DVS_LEVEL_RUN | ROHM_DVS_LEVEL_IDLE |
+				     ROHM_DVS_LEVEL_SUSPEND |
+				     ROHM_DVS_LEVEL_LPSR,
+			.run_reg = BD71828_REG_BUCK2_VOLT,
+			.run_mask = BD71828_MASK_BUCK1267_VOLT,
+			.idle_reg = BD71828_REG_BUCK2_IDLE_VOLT,
+			.idle_mask = BD71828_MASK_BUCK1267_VOLT,
+			.idle_on_mask = BD71828_MASK_IDLE_EN,
+			.suspend_reg = BD71828_REG_BUCK2_SUSP_VOLT,
+			.suspend_mask = BD71828_MASK_BUCK1267_VOLT,
+			.suspend_on_mask = BD71828_MASK_SUSP_EN,
+			.lpsr_on_mask = BD71828_MASK_LPSR_EN,
+			.lpsr_reg = BD71828_REG_BUCK2_SUSP_VOLT,
+			.lpsr_mask = BD71828_MASK_BUCK1267_VOLT,
+		},
+		.reg_inits = buck2_inits,
+		.reg_init_amnt = ARRAY_SIZE(buck2_inits),
+	},
+	{
+		.desc = {
+			.name = "buck3",
+			.of_match = of_match_ptr("BUCK3"),
+			.regulators_node = of_match_ptr("regulators"),
+			.id = BD71828_BUCK3,
+			.ops = &bd71828_buck_ops,
+			.type = REGULATOR_VOLTAGE,
+			.linear_ranges = bd71828_buck3_volts,
+			.n_linear_ranges = ARRAY_SIZE(bd71828_buck3_volts),
+			.n_voltages = BD71828_BUCK3_VOLTS,
+			.enable_reg = BD71828_REG_BUCK3_EN,
+			.enable_mask = BD71828_MASK_RUN_EN,
+			.vsel_reg = BD71828_REG_BUCK3_VOLT,
+			.vsel_mask = BD71828_MASK_BUCK3_VOLT,
+			.owner = THIS_MODULE,
+			.of_parse_cb = buck_set_hw_dvs_levels,
+		},
+		.dvs = {
+			/*
+			 * BUCK3 only supports single voltage for all states.
+			 * voltage can be individually enabled for each state
+			 * though => allow setting all states to support
+			 * enabling power rail on different states.
+			 */
+			.level_map = ROHM_DVS_LEVEL_RUN | ROHM_DVS_LEVEL_IDLE |
+				     ROHM_DVS_LEVEL_SUSPEND |
+				     ROHM_DVS_LEVEL_LPSR,
+			.run_reg = BD71828_REG_BUCK3_VOLT,
+			.idle_reg = BD71828_REG_BUCK3_VOLT,
+			.suspend_reg = BD71828_REG_BUCK3_VOLT,
+			.lpsr_reg = BD71828_REG_BUCK3_VOLT,
+			.run_mask = BD71828_MASK_BUCK3_VOLT,
+			.idle_mask = BD71828_MASK_BUCK3_VOLT,
+			.suspend_mask = BD71828_MASK_BUCK3_VOLT,
+			.lpsr_mask = BD71828_MASK_BUCK3_VOLT,
+			.idle_on_mask = BD71828_MASK_IDLE_EN,
+			.suspend_on_mask = BD71828_MASK_SUSP_EN,
+			.lpsr_on_mask = BD71828_MASK_LPSR_EN,
+		},
+	},
+	{
+		.desc = {
+			.name = "buck4",
+			.of_match = of_match_ptr("BUCK4"),
+			.regulators_node = of_match_ptr("regulators"),
+			.id = BD71828_BUCK4,
+			.ops = &bd71828_buck_ops,
+			.type = REGULATOR_VOLTAGE,
+			.linear_ranges = bd71828_buck4_volts,
+			.n_linear_ranges = ARRAY_SIZE(bd71828_buck4_volts),
+			.n_voltages = BD71828_BUCK4_VOLTS,
+			.enable_reg = BD71828_REG_BUCK4_EN,
+			.enable_mask = BD71828_MASK_RUN_EN,
+			.vsel_reg = BD71828_REG_BUCK4_VOLT,
+			.vsel_mask = BD71828_MASK_BUCK4_VOLT,
+			.owner = THIS_MODULE,
+			.of_parse_cb = buck_set_hw_dvs_levels,
+		},
+		.dvs = {
+			/*
+			 * BUCK4 only supports single voltage for all states.
+			 * voltage can be individually enabled for each state
+			 * though => allow setting all states to support
+			 * enabling power rail on different states.
+			 */
+			.level_map = ROHM_DVS_LEVEL_RUN | ROHM_DVS_LEVEL_IDLE |
+				     ROHM_DVS_LEVEL_SUSPEND |
+				     ROHM_DVS_LEVEL_LPSR,
+			.run_reg = BD71828_REG_BUCK4_VOLT,
+			.idle_reg = BD71828_REG_BUCK4_VOLT,
+			.suspend_reg = BD71828_REG_BUCK4_VOLT,
+			.lpsr_reg = BD71828_REG_BUCK4_VOLT,
+			.run_mask = BD71828_MASK_BUCK4_VOLT,
+			.idle_mask = BD71828_MASK_BUCK4_VOLT,
+			.suspend_mask = BD71828_MASK_BUCK4_VOLT,
+			.lpsr_mask = BD71828_MASK_BUCK4_VOLT,
+			.idle_on_mask = BD71828_MASK_IDLE_EN,
+			.suspend_on_mask = BD71828_MASK_SUSP_EN,
+			.lpsr_on_mask = BD71828_MASK_LPSR_EN,
+		},
+	},
+	{
+		.desc = {
+			.name = "buck5",
+			.of_match = of_match_ptr("BUCK5"),
+			.regulators_node = of_match_ptr("regulators"),
+			.id = BD71828_BUCK5,
+			.ops = &bd71828_buck_ops,
+			.type = REGULATOR_VOLTAGE,
+			.linear_ranges = bd71828_buck5_volts,
+			.n_linear_ranges = ARRAY_SIZE(bd71828_buck5_volts),
+			.n_voltages = BD71828_BUCK5_VOLTS,
+			.enable_reg = BD71828_REG_BUCK5_EN,
+			.enable_mask = BD71828_MASK_RUN_EN,
+			.vsel_reg = BD71828_REG_BUCK5_VOLT,
+			.vsel_mask = BD71828_MASK_BUCK5_VOLT,
+			.owner = THIS_MODULE,
+			.of_parse_cb = buck_set_hw_dvs_levels,
+		},
+		.dvs = {
+			/*
+			 * BUCK5 only supports single voltage for all states.
+			 * voltage can be individually enabled for each state
+			 * though => allow setting all states to support
+			 * enabling power rail on different states.
+			 */
+			.level_map = ROHM_DVS_LEVEL_RUN | ROHM_DVS_LEVEL_IDLE |
+				     ROHM_DVS_LEVEL_SUSPEND |
+				     ROHM_DVS_LEVEL_LPSR,
+			.run_reg = BD71828_REG_BUCK5_VOLT,
+			.idle_reg = BD71828_REG_BUCK5_VOLT,
+			.suspend_reg = BD71828_REG_BUCK5_VOLT,
+			.lpsr_reg = BD71828_REG_BUCK5_VOLT,
+			.run_mask = BD71828_MASK_BUCK5_VOLT,
+			.idle_mask = BD71828_MASK_BUCK5_VOLT,
+			.suspend_mask = BD71828_MASK_BUCK5_VOLT,
+			.lpsr_mask = BD71828_MASK_BUCK5_VOLT,
+			.idle_on_mask = BD71828_MASK_IDLE_EN,
+			.suspend_on_mask = BD71828_MASK_SUSP_EN,
+			.lpsr_on_mask = BD71828_MASK_LPSR_EN,
+		},
+	},
+	{
+		.desc = {
+			.name = "buck6",
+			.of_match = of_match_ptr("BUCK6"),
+			.regulators_node = of_match_ptr("regulators"),
+			.id = BD71828_BUCK6,
+			.ops = &bd71828_dvs_buck_ops,
+			.type = REGULATOR_VOLTAGE,
+			.linear_ranges = bd71828_buck1267_volts,
+			.n_linear_ranges = ARRAY_SIZE(bd71828_buck1267_volts),
+			.n_voltages = BD71828_BUCK1267_VOLTS,
+			.enable_reg = BD71828_REG_BUCK6_EN,
+			.enable_mask = BD71828_MASK_RUN_EN,
+			.vsel_reg = BD71828_REG_BUCK6_VOLT,
+			.vsel_mask = BD71828_MASK_BUCK1267_VOLT,
+			.owner = THIS_MODULE,
+			.of_parse_cb = buck_set_hw_dvs_levels,
+		},
+		.dvs = {
+			.level_map = ROHM_DVS_LEVEL_RUN | ROHM_DVS_LEVEL_IDLE |
+				     ROHM_DVS_LEVEL_SUSPEND |
+				     ROHM_DVS_LEVEL_LPSR,
+			.run_reg = BD71828_REG_BUCK6_VOLT,
+			.run_mask = BD71828_MASK_BUCK1267_VOLT,
+			.idle_reg = BD71828_REG_BUCK6_IDLE_VOLT,
+			.idle_mask = BD71828_MASK_BUCK1267_VOLT,
+			.idle_on_mask = BD71828_MASK_IDLE_EN,
+			.suspend_reg = BD71828_REG_BUCK6_SUSP_VOLT,
+			.suspend_mask = BD71828_MASK_BUCK1267_VOLT,
+			.suspend_on_mask = BD71828_MASK_SUSP_EN,
+			.lpsr_on_mask = BD71828_MASK_LPSR_EN,
+			.lpsr_reg = BD71828_REG_BUCK6_SUSP_VOLT,
+			.lpsr_mask = BD71828_MASK_BUCK1267_VOLT,
+		},
+		.reg_inits = buck6_inits,
+		.reg_init_amnt = ARRAY_SIZE(buck6_inits),
+	},
+	{
+		.desc = {
+			.name = "buck7",
+			.of_match = of_match_ptr("BUCK7"),
+			.regulators_node = of_match_ptr("regulators"),
+			.id = BD71828_BUCK7,
+			.ops = &bd71828_dvs_buck_ops,
+			.type = REGULATOR_VOLTAGE,
+			.linear_ranges = bd71828_buck1267_volts,
+			.n_linear_ranges = ARRAY_SIZE(bd71828_buck1267_volts),
+			.n_voltages = BD71828_BUCK1267_VOLTS,
+			.enable_reg = BD71828_REG_BUCK7_EN,
+			.enable_mask = BD71828_MASK_RUN_EN,
+			.vsel_reg = BD71828_REG_BUCK7_VOLT,
+			.vsel_mask = BD71828_MASK_BUCK1267_VOLT,
+			.owner = THIS_MODULE,
+			.of_parse_cb = buck_set_hw_dvs_levels,
+		},
+		.dvs = {
+			.level_map = ROHM_DVS_LEVEL_RUN | ROHM_DVS_LEVEL_IDLE |
+				     ROHM_DVS_LEVEL_SUSPEND |
+				     ROHM_DVS_LEVEL_LPSR,
+			.run_reg = BD71828_REG_BUCK7_VOLT,
+			.run_mask = BD71828_MASK_BUCK1267_VOLT,
+			.idle_reg = BD71828_REG_BUCK7_IDLE_VOLT,
+			.idle_mask = BD71828_MASK_BUCK1267_VOLT,
+			.idle_on_mask = BD71828_MASK_IDLE_EN,
+			.suspend_reg = BD71828_REG_BUCK7_SUSP_VOLT,
+			.suspend_mask = BD71828_MASK_BUCK1267_VOLT,
+			.suspend_on_mask = BD71828_MASK_SUSP_EN,
+			.lpsr_on_mask = BD71828_MASK_LPSR_EN,
+			.lpsr_reg = BD71828_REG_BUCK7_SUSP_VOLT,
+			.lpsr_mask = BD71828_MASK_BUCK1267_VOLT,
+		},
+		.reg_inits = buck7_inits,
+		.reg_init_amnt = ARRAY_SIZE(buck7_inits),
+	},
+	{
+		.desc = {
+			.name = "ldo1",
+			.of_match = of_match_ptr("LDO1"),
+			.regulators_node = of_match_ptr("regulators"),
+			.id = BD71828_LDO1,
+			.ops = &bd71828_ldo_ops,
+			.type = REGULATOR_VOLTAGE,
+			.linear_ranges = bd71828_ldo_volts,
+			.n_linear_ranges = ARRAY_SIZE(bd71828_ldo_volts),
+			.n_voltages = BD71828_LDO_VOLTS,
+			.enable_reg = BD71828_REG_LDO1_EN,
+			.enable_mask = BD71828_MASK_RUN_EN,
+			.vsel_reg = BD71828_REG_LDO1_VOLT,
+			.vsel_mask = BD71828_MASK_LDO_VOLT,
+			.owner = THIS_MODULE,
+			.of_parse_cb = buck_set_hw_dvs_levels,
+		},
+		.dvs = {
+			/*
+			 * LDO1 only supports single voltage for all states.
+			 * voltage can be individually enabled for each state
+			 * though => allow setting all states to support
+			 * enabling power rail on different states.
+			 */
+			.level_map = ROHM_DVS_LEVEL_RUN | ROHM_DVS_LEVEL_IDLE |
+				     ROHM_DVS_LEVEL_SUSPEND |
+				     ROHM_DVS_LEVEL_LPSR,
+			.run_reg = BD71828_REG_LDO1_VOLT,
+			.idle_reg = BD71828_REG_LDO1_VOLT,
+			.suspend_reg = BD71828_REG_LDO1_VOLT,
+			.lpsr_reg = BD71828_REG_LDO1_VOLT,
+			.run_mask = BD71828_MASK_LDO_VOLT,
+			.idle_mask = BD71828_MASK_LDO_VOLT,
+			.suspend_mask = BD71828_MASK_LDO_VOLT,
+			.lpsr_mask = BD71828_MASK_LDO_VOLT,
+			.idle_on_mask = BD71828_MASK_IDLE_EN,
+			.suspend_on_mask = BD71828_MASK_SUSP_EN,
+			.lpsr_on_mask = BD71828_MASK_LPSR_EN,
+		},
+	}, {
+		.desc = {
+			.name = "ldo2",
+			.of_match = of_match_ptr("LDO2"),
+			.regulators_node = of_match_ptr("regulators"),
+			.id = BD71828_LDO2,
+			.ops = &bd71828_ldo_ops,
+			.type = REGULATOR_VOLTAGE,
+			.linear_ranges = bd71828_ldo_volts,
+			.n_linear_ranges = ARRAY_SIZE(bd71828_ldo_volts),
+			.n_voltages = BD71828_LDO_VOLTS,
+			.enable_reg = BD71828_REG_LDO2_EN,
+			.enable_mask = BD71828_MASK_RUN_EN,
+			.vsel_reg = BD71828_REG_LDO2_VOLT,
+			.vsel_mask = BD71828_MASK_LDO_VOLT,
+			.owner = THIS_MODULE,
+			.of_parse_cb = buck_set_hw_dvs_levels,
+		},
+		.dvs = {
+			/*
+			 * LDO2 only supports single voltage for all states.
+			 * voltage can be individually enabled for each state
+			 * though => allow setting all states to support
+			 * enabling power rail on different states.
+			 */
+			.level_map = ROHM_DVS_LEVEL_RUN | ROHM_DVS_LEVEL_IDLE |
+				     ROHM_DVS_LEVEL_SUSPEND |
+				     ROHM_DVS_LEVEL_LPSR,
+			.run_reg = BD71828_REG_LDO2_VOLT,
+			.idle_reg = BD71828_REG_LDO2_VOLT,
+			.suspend_reg = BD71828_REG_LDO2_VOLT,
+			.lpsr_reg = BD71828_REG_LDO2_VOLT,
+			.run_mask = BD71828_MASK_LDO_VOLT,
+			.idle_mask = BD71828_MASK_LDO_VOLT,
+			.suspend_mask = BD71828_MASK_LDO_VOLT,
+			.lpsr_mask = BD71828_MASK_LDO_VOLT,
+			.idle_on_mask = BD71828_MASK_IDLE_EN,
+			.suspend_on_mask = BD71828_MASK_SUSP_EN,
+			.lpsr_on_mask = BD71828_MASK_LPSR_EN,
+		},
+	}, {
+		.desc = {
+			.name = "ldo3",
+			.of_match = of_match_ptr("LDO3"),
+			.regulators_node = of_match_ptr("regulators"),
+			.id = BD71828_LDO3,
+			.ops = &bd71828_ldo_ops,
+			.type = REGULATOR_VOLTAGE,
+			.linear_ranges = bd71828_ldo_volts,
+			.n_linear_ranges = ARRAY_SIZE(bd71828_ldo_volts),
+			.n_voltages = BD71828_LDO_VOLTS,
+			.enable_reg = BD71828_REG_LDO3_EN,
+			.enable_mask = BD71828_MASK_RUN_EN,
+			.vsel_reg = BD71828_REG_LDO3_VOLT,
+			.vsel_mask = BD71828_MASK_LDO_VOLT,
+			.owner = THIS_MODULE,
+			.of_parse_cb = buck_set_hw_dvs_levels,
+		},
+		.dvs = {
+			/*
+			 * LDO3 only supports single voltage for all states.
+			 * voltage can be individually enabled for each state
+			 * though => allow setting all states to support
+			 * enabling power rail on different states.
+			 */
+			.level_map = ROHM_DVS_LEVEL_RUN | ROHM_DVS_LEVEL_IDLE |
+				     ROHM_DVS_LEVEL_SUSPEND |
+				     ROHM_DVS_LEVEL_LPSR,
+			.run_reg = BD71828_REG_LDO3_VOLT,
+			.idle_reg = BD71828_REG_LDO3_VOLT,
+			.suspend_reg = BD71828_REG_LDO3_VOLT,
+			.lpsr_reg = BD71828_REG_LDO3_VOLT,
+			.run_mask = BD71828_MASK_LDO_VOLT,
+			.idle_mask = BD71828_MASK_LDO_VOLT,
+			.suspend_mask = BD71828_MASK_LDO_VOLT,
+			.lpsr_mask = BD71828_MASK_LDO_VOLT,
+			.idle_on_mask = BD71828_MASK_IDLE_EN,
+			.suspend_on_mask = BD71828_MASK_SUSP_EN,
+			.lpsr_on_mask = BD71828_MASK_LPSR_EN,
+		},
+
+	}, {
+		.desc = {
+			.name = "ldo4",
+			.of_match = of_match_ptr("LDO4"),
+			.regulators_node = of_match_ptr("regulators"),
+			.id = BD71828_LDO4,
+			.ops = &bd71828_ldo_ops,
+			.type = REGULATOR_VOLTAGE,
+			.linear_ranges = bd71828_ldo_volts,
+			.n_linear_ranges = ARRAY_SIZE(bd71828_ldo_volts),
+			.n_voltages = BD71828_LDO_VOLTS,
+			.enable_reg = BD71828_REG_LDO4_EN,
+			.enable_mask = BD71828_MASK_RUN_EN,
+			.vsel_reg = BD71828_REG_LDO4_VOLT,
+			.vsel_mask = BD71828_MASK_LDO_VOLT,
+			.owner = THIS_MODULE,
+			.of_parse_cb = buck_set_hw_dvs_levels,
+		},
+		.dvs = {
+			/*
+			 * LDO1 only supports single voltage for all states.
+			 * voltage can be individually enabled for each state
+			 * though => allow setting all states to support
+			 * enabling power rail on different states.
+			 */
+			.level_map = ROHM_DVS_LEVEL_RUN | ROHM_DVS_LEVEL_IDLE |
+				     ROHM_DVS_LEVEL_SUSPEND |
+				     ROHM_DVS_LEVEL_LPSR,
+			.run_reg = BD71828_REG_LDO4_VOLT,
+			.idle_reg = BD71828_REG_LDO4_VOLT,
+			.suspend_reg = BD71828_REG_LDO4_VOLT,
+			.lpsr_reg = BD71828_REG_LDO4_VOLT,
+			.run_mask = BD71828_MASK_LDO_VOLT,
+			.idle_mask = BD71828_MASK_LDO_VOLT,
+			.suspend_mask = BD71828_MASK_LDO_VOLT,
+			.lpsr_mask = BD71828_MASK_LDO_VOLT,
+			.idle_on_mask = BD71828_MASK_IDLE_EN,
+			.suspend_on_mask = BD71828_MASK_SUSP_EN,
+			.lpsr_on_mask = BD71828_MASK_LPSR_EN,
+		},
+	}, {
+		.desc = {
+			.name = "ldo5",
+			.of_match = of_match_ptr("LDO5"),
+			.regulators_node = of_match_ptr("regulators"),
+			.id = BD71828_LDO5,
+			.ops = &bd71828_ldo_ops,
+			.type = REGULATOR_VOLTAGE,
+			.linear_ranges = bd71828_ldo_volts,
+			.n_linear_ranges = ARRAY_SIZE(bd71828_ldo_volts),
+			.n_voltages = BD71828_LDO_VOLTS,
+			.enable_reg = BD71828_REG_LDO5_EN,
+			.enable_mask = BD71828_MASK_RUN_EN,
+			.vsel_reg = BD71828_REG_LDO5_VOLT,
+			.vsel_mask = BD71828_MASK_LDO_VOLT,
+			.of_parse_cb = buck_set_hw_dvs_levels,
+			.owner = THIS_MODULE,
+		},
+		/*
+		 * LDO5 is special. It can choose vsel settings to be configured
+		 * from 2 different registers (by GPIO).
+		 *
+		 * This driver supports only configuration where
+		 * BD71828_REG_LDO5_VOLT_L is used.
+		 */
+		.dvs = {
+			.level_map = ROHM_DVS_LEVEL_RUN | ROHM_DVS_LEVEL_IDLE |
+				     ROHM_DVS_LEVEL_SUSPEND |
+				     ROHM_DVS_LEVEL_LPSR,
+			.run_reg = BD71828_REG_LDO5_VOLT,
+			.idle_reg = BD71828_REG_LDO5_VOLT,
+			.suspend_reg = BD71828_REG_LDO5_VOLT,
+			.lpsr_reg = BD71828_REG_LDO5_VOLT,
+			.run_mask = BD71828_MASK_LDO_VOLT,
+			.idle_mask = BD71828_MASK_LDO_VOLT,
+			.suspend_mask = BD71828_MASK_LDO_VOLT,
+			.lpsr_mask = BD71828_MASK_LDO_VOLT,
+			.idle_on_mask = BD71828_MASK_IDLE_EN,
+			.suspend_on_mask = BD71828_MASK_SUSP_EN,
+			.lpsr_on_mask = BD71828_MASK_LPSR_EN,
+		},
+
+	}, {
+		.desc = {
+			.name = "ldo6",
+			.of_match = of_match_ptr("LDO6"),
+			.regulators_node = of_match_ptr("regulators"),
+			.id = BD71828_LDO6,
+			.ops = &bd71828_ldo6_ops,
+			.type = REGULATOR_VOLTAGE,
+			.n_voltages = 1,
+			.enable_reg = BD71828_REG_LDO6_EN,
+			.enable_mask = BD71828_MASK_RUN_EN,
+			.owner = THIS_MODULE,
+			/*
+			 * LDO6 only supports enable/disable for all states.
+			 * Voltage for LDO6 is fixed.
+			 */
+			.of_parse_cb = ldo6_parse_dt,
+		},
+	}, {
+		.desc = {
+			/* SNVS LDO in data-sheet */
+			.name = "ldo7",
+			.of_match = of_match_ptr("LDO7"),
+			.regulators_node = of_match_ptr("regulators"),
+			.id = BD71828_LDO_SNVS,
+			.ops = &bd71828_ldo_ops,
+			.type = REGULATOR_VOLTAGE,
+			.linear_ranges = bd71828_ldo_volts,
+			.n_linear_ranges = ARRAY_SIZE(bd71828_ldo_volts),
+			.n_voltages = BD71828_LDO_VOLTS,
+			.enable_reg = BD71828_REG_LDO7_EN,
+			.enable_mask = BD71828_MASK_RUN_EN,
+			.vsel_reg = BD71828_REG_LDO7_VOLT,
+			.vsel_mask = BD71828_MASK_LDO_VOLT,
+			.owner = THIS_MODULE,
+			.of_parse_cb = buck_set_hw_dvs_levels,
+		},
+		.dvs = {
+			/*
+			 * LDO7 only supports single voltage for all states.
+			 * voltage can be individually enabled for each state
+			 * though => allow setting all states to support
+			 * enabling power rail on different states.
+			 */
+			.level_map = ROHM_DVS_LEVEL_RUN | ROHM_DVS_LEVEL_IDLE |
+				     ROHM_DVS_LEVEL_SUSPEND |
+				     ROHM_DVS_LEVEL_LPSR,
+			.run_reg = BD71828_REG_LDO7_VOLT,
+			.idle_reg = BD71828_REG_LDO7_VOLT,
+			.suspend_reg = BD71828_REG_LDO7_VOLT,
+			.lpsr_reg = BD71828_REG_LDO7_VOLT,
+			.run_mask = BD71828_MASK_LDO_VOLT,
+			.idle_mask = BD71828_MASK_LDO_VOLT,
+			.suspend_mask = BD71828_MASK_LDO_VOLT,
+			.lpsr_mask = BD71828_MASK_LDO_VOLT,
+			.idle_on_mask = BD71828_MASK_IDLE_EN,
+			.suspend_on_mask = BD71828_MASK_SUSP_EN,
+			.lpsr_on_mask = BD71828_MASK_LPSR_EN,
+		},
+
+	},
+};
+
+static int bd71828_probe(struct platform_device *pdev)
+{
+	struct rohm_regmap_dev *bd71828;
+	int i, j, ret;
+	struct regulator_config config = {
+		.dev = pdev->dev.parent,
+	};
+
+	bd71828 = dev_get_drvdata(pdev->dev.parent);
+	if (!bd71828) {
+		dev_err(&pdev->dev, "No MFD driver data\n");
+		return -EINVAL;
+	}
+
+	config.regmap = bd71828->regmap;
+
+	for (i = 0; i < ARRAY_SIZE(bd71828_rdata); i++) {
+		struct regulator_dev *rdev;
+		const struct bd71828_regulator_data *rd;
+
+		rd = &bd71828_rdata[i];
+		rdev = devm_regulator_register(&pdev->dev,
+					       &rd->desc, &config);
+		if (IS_ERR(rdev)) {
+			dev_err(&pdev->dev,
+				"failed to register %s regulator\n",
+				rd->desc.name);
+			return PTR_ERR(rdev);
+		}
+		for (j = 0; j < rd->reg_init_amnt; j++) {
+			ret = regmap_update_bits(bd71828->regmap,
+						 rd->reg_inits[j].reg,
+						 rd->reg_inits[j].mask,
+						 rd->reg_inits[j].val);
+			if (ret) {
+				dev_err(&pdev->dev,
+					"regulator %s init failed\n",
+					rd->desc.name);
+				return ret;
+			}
+		}
+	}
+	return 0;
+}
+
+static struct platform_driver bd71828_regulator = {
+	.driver = {
+		.name = "bd71828-pmic"
+	},
+	.probe = bd71828_probe,
+};
+
+module_platform_driver(bd71828_regulator);
+
+MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
+MODULE_DESCRIPTION("BD71828 voltage regulator driver");
+MODULE_LICENSE("GPL");
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
