Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A4428DA8F3
	for <lists+linux-gpio@lfdr.de>; Thu, 17 Oct 2019 11:46:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405771AbfJQJoi (ORCPT <rfc822;lists+linux-gpio@lfdr.de>);
        Thu, 17 Oct 2019 05:44:38 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:34895 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727873AbfJQJoh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Oct 2019 05:44:37 -0400
Received: by mail-lf1-f68.google.com with SMTP id w6so1355124lfl.2;
        Thu, 17 Oct 2019 02:44:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hYznydYja52DtFXUuq6dMzWIVNzGF3GKMTYuczlglSs=;
        b=kPloRMVjvtHevN/Nu92dLLyLQ4qr2U5+8uNWLnwTLG2jw4LvJql+dCwO8CZ9TRL2k7
         GhSGCkeJJd3EZEKR5XptYDPXf85NmntugTC/YDey2/RY2FropVLxuPst9zlxBX7MgomM
         lzgJVUh8SikwB363BGbWIQ4XSZ+IjknHU4oy+ZDixFrjk5vZyOVTS9S+DFLuriSj/Vxq
         3d/pnATcGbdZHVgTbL3Kb8/3oa5ZHWESJVNLzSSgzK6yR77h+cTaZY7tyFQ96P1fnrFs
         WijMGL13YcDFl946no5d8BZhDZzWucC9DV9tHNlIPlYmcshd7f6rISuCekM8aBw6kEVs
         mzZw==
X-Gm-Message-State: APjAAAV7Wx/OIQjHms0HcHA/iBvxx0oWcd8ajeEItBar927F1TtrAQn5
        8LBUU6fnMHn2RfdXqljCgDA=
X-Google-Smtp-Source: APXvYqxts+xfi4VpfudtKyhgXw9MDkqXtbRcHCP2NxCqTyeBhxUWoPzOBgVVeKa+o0D8ouI6MLA8bw==
X-Received: by 2002:a19:f80d:: with SMTP id a13mr1717015lff.6.1571305473679;
        Thu, 17 Oct 2019 02:44:33 -0700 (PDT)
Received: from localhost.localdomain ([213.255.186.46])
        by smtp.gmail.com with ESMTPSA id f5sm713683lfh.52.2019.10.17.02.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 02:44:33 -0700 (PDT)
Date:   Thu, 17 Oct 2019 12:44:20 +0300
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
Subject: [RFC PATCH 04/13] regulator: bd718x7: Split driver to common and
 bd718x7 specific parts
Message-ID: <8bfdaad0744289629d8ce856d13e559a679e7d27.1571302099.git.matti.vaittinen@fi.rohmeurope.com>
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

Few ROHM PMICs allow setting the voltage states for different system states
like RUN, IDLE, SUSPEND and LPSR. States are then changed via SoC specific
mechanisms. bd718x7 driver implemented device-tree parsing functions for
these state specific voltages. The parsing functions can be re-used by
other ROHM chip drivers like bd71828. Split the generic functions from
bd718x7-regulator.c to rohm-regulator.c and export them for other modules
to use.

Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
---
 drivers/regulator/Kconfig             |   4 +
 drivers/regulator/Makefile            |   1 +
 drivers/regulator/bd718x7-regulator.c | 183 ++++++++------------------
 drivers/regulator/rohm-regulator.c    |  95 +++++++++++++
 include/linux/mfd/rohm-generic.h      |  44 +++++++
 5 files changed, 199 insertions(+), 128 deletions(-)
 create mode 100644 drivers/regulator/rohm-regulator.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index b57093d7c01f..74de76bf98d7 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -196,6 +196,7 @@ config REGULATOR_BD70528
 config REGULATOR_BD718XX
 	tristate "ROHM BD71837 Power Regulator"
 	depends on MFD_ROHM_BD718XX
+	select REGULATOR_ROHM
 	help
 	  This driver supports voltage regulators on ROHM BD71837 PMIC.
 	  This will enable support for the software controllable buck
@@ -780,6 +781,9 @@ config REGULATOR_RN5T618
 	  Say y here to support the regulators found on Ricoh RN5T567,
 	  RN5T618 or RC5T619 PMIC.
 
+config REGULATOR_ROHM
+	tristate
+
 config REGULATOR_RT5033
 	tristate "Richtek RT5033 Regulators"
 	depends on MFD_RT5033
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index eef73b5a35a4..41e4055d2d66 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -98,6 +98,7 @@ obj-$(CONFIG_REGULATOR_PCF50633) += pcf50633-regulator.o
 obj-$(CONFIG_REGULATOR_RC5T583)  += rc5t583-regulator.o
 obj-$(CONFIG_REGULATOR_RK808)   += rk808-regulator.o
 obj-$(CONFIG_REGULATOR_RN5T618) += rn5t618-regulator.o
+obj-$(CONFIG_REGULATOR_ROHM)	+= rohm-regulator.o
 obj-$(CONFIG_REGULATOR_RT5033)	+= rt5033-regulator.o
 obj-$(CONFIG_REGULATOR_S2MPA01) += s2mpa01.o
 obj-$(CONFIG_REGULATOR_S2MPS11) += s2mps11.o
diff --git a/drivers/regulator/bd718x7-regulator.c b/drivers/regulator/bd718x7-regulator.c
index bdab46a5c461..2dcb010a626c 100644
--- a/drivers/regulator/bd718x7-regulator.c
+++ b/drivers/regulator/bd718x7-regulator.c
@@ -318,6 +318,7 @@ struct reg_init {
 };
 struct bd718xx_regulator_data {
 	struct regulator_desc desc;
+	const struct rohm_dvs_config dvs;
 	const struct reg_init init;
 	const struct reg_init *additional_inits;
 	int additional_init_amnt;
@@ -349,133 +350,15 @@ static const struct reg_init bd71837_ldo6_inits[] = {
 	},
 };
 
-#define NUM_DVS_BUCKS 4
-
-struct of_dvs_setting {
-	const char *prop;
-	unsigned int reg;
-};
-
-static int set_dvs_levels(const struct of_dvs_setting *dvs,
-			  struct device_node *np,
-			  const struct regulator_desc *desc,
-			  struct regmap *regmap)
-{
-	int ret, i;
-	unsigned int uv;
-
-	ret = of_property_read_u32(np, dvs->prop, &uv);
-	if (ret) {
-		if (ret != -EINVAL)
-			return ret;
-		return 0;
-	}
-
-	for (i = 0; i < desc->n_voltages; i++) {
-		ret = regulator_desc_list_voltage_linear_range(desc, i);
-		if (ret < 0)
-			continue;
-		if (ret == uv) {
-			i <<= ffs(desc->vsel_mask) - 1;
-			ret = regmap_update_bits(regmap, dvs->reg,
-						 DVS_BUCK_RUN_MASK, i);
-			break;
-		}
-	}
-	return ret;
-}
-
-static int buck4_set_hw_dvs_levels(struct device_node *np,
+static int buck_set_hw_dvs_levels(struct device_node *np,
 			    const struct regulator_desc *desc,
 			    struct regulator_config *cfg)
 {
-	int ret, i;
-	const struct of_dvs_setting dvs[] = {
-		{
-			.prop = "rohm,dvs-run-voltage",
-			.reg = BD71837_REG_BUCK4_VOLT_RUN,
-		},
-	};
+	struct bd718xx_regulator_data *data;
 
-	for (i = 0; i < ARRAY_SIZE(dvs); i++) {
-		ret = set_dvs_levels(&dvs[i], np, desc, cfg->regmap);
-		if (ret)
-			break;
-	}
-	return ret;
-}
-static int buck3_set_hw_dvs_levels(struct device_node *np,
-			    const struct regulator_desc *desc,
-			    struct regulator_config *cfg)
-{
-	int ret, i;
-	const struct of_dvs_setting dvs[] = {
-		{
-			.prop = "rohm,dvs-run-voltage",
-			.reg = BD71837_REG_BUCK3_VOLT_RUN,
-		},
-	};
+	data = container_of(desc, struct bd718xx_regulator_data, desc);
 
-	for (i = 0; i < ARRAY_SIZE(dvs); i++) {
-		ret = set_dvs_levels(&dvs[i], np, desc, cfg->regmap);
-		if (ret)
-			break;
-	}
-	return ret;
-}
-
-static int buck2_set_hw_dvs_levels(struct device_node *np,
-			    const struct regulator_desc *desc,
-			    struct regulator_config *cfg)
-{
-	int ret, i;
-	const struct of_dvs_setting dvs[] = {
-		{
-			.prop = "rohm,dvs-run-voltage",
-			.reg = BD718XX_REG_BUCK2_VOLT_RUN,
-		},
-		{
-			.prop = "rohm,dvs-idle-voltage",
-			.reg = BD718XX_REG_BUCK2_VOLT_IDLE,
-		},
-	};
-
-
-
-	for (i = 0; i < ARRAY_SIZE(dvs); i++) {
-		ret = set_dvs_levels(&dvs[i], np, desc, cfg->regmap);
-		if (ret)
-			break;
-	}
-	return ret;
-}
-
-static int buck1_set_hw_dvs_levels(struct device_node *np,
-			    const struct regulator_desc *desc,
-			    struct regulator_config *cfg)
-{
-	int ret, i;
-	const struct of_dvs_setting dvs[] = {
-		{
-			.prop = "rohm,dvs-run-voltage",
-			.reg = BD718XX_REG_BUCK1_VOLT_RUN,
-		},
-		{
-			.prop = "rohm,dvs-idle-voltage",
-			.reg = BD718XX_REG_BUCK1_VOLT_IDLE,
-		},
-		{
-			.prop = "rohm,dvs-suspend-voltage",
-			.reg = BD718XX_REG_BUCK1_VOLT_SUSP,
-		},
-	};
-
-	for (i = 0; i < ARRAY_SIZE(dvs); i++) {
-		ret = set_dvs_levels(&dvs[i], np, desc, cfg->regmap);
-		if (ret)
-			break;
-	}
-	return ret;
+	return rohm_regulator_set_dvs_levels(&data->dvs, np, desc, cfg->regmap);
 }
 
 static const struct bd718xx_regulator_data bd71847_regulators[] = {
@@ -496,7 +379,17 @@ static const struct bd718xx_regulator_data bd71847_regulators[] = {
 			.enable_reg = BD718XX_REG_BUCK1_CTRL,
 			.enable_mask = BD718XX_BUCK_EN,
 			.owner = THIS_MODULE,
-			.of_parse_cb = buck1_set_hw_dvs_levels,
+			.of_parse_cb = buck_set_hw_dvs_levels,
+		},
+		.dvs = {
+			.level_map = ROHM_DVS_LEVEL_RUN | ROHM_DVS_LEVEL_IDLE |
+				     ROHM_DVS_LEVEL_SUSPEND,
+			.run_reg = BD718XX_REG_BUCK1_VOLT_RUN,
+			.run_mask = DVS_BUCK_RUN_MASK,
+			.idle_reg = BD718XX_REG_BUCK1_VOLT_IDLE,
+			.idle_mask = DVS_BUCK_RUN_MASK,
+			.suspend_reg = BD718XX_REG_BUCK1_VOLT_SUSP,
+			.suspend_mask = DVS_BUCK_RUN_MASK,
 		},
 		.init = {
 			.reg = BD718XX_REG_BUCK1_CTRL,
@@ -520,7 +413,14 @@ static const struct bd718xx_regulator_data bd71847_regulators[] = {
 			.enable_reg = BD718XX_REG_BUCK2_CTRL,
 			.enable_mask = BD718XX_BUCK_EN,
 			.owner = THIS_MODULE,
-			.of_parse_cb = buck2_set_hw_dvs_levels,
+			.of_parse_cb = buck_set_hw_dvs_levels,
+		},
+		.dvs = {
+			.level_map = ROHM_DVS_LEVEL_RUN | ROHM_DVS_LEVEL_IDLE,
+			.run_reg = BD718XX_REG_BUCK2_VOLT_RUN,
+			.run_mask = DVS_BUCK_RUN_MASK,
+			.idle_reg = BD718XX_REG_BUCK2_VOLT_IDLE,
+			.idle_mask = DVS_BUCK_RUN_MASK,
 		},
 		.init = {
 			.reg = BD718XX_REG_BUCK2_CTRL,
@@ -792,7 +692,17 @@ static const struct bd718xx_regulator_data bd71837_regulators[] = {
 			.enable_reg = BD718XX_REG_BUCK1_CTRL,
 			.enable_mask = BD718XX_BUCK_EN,
 			.owner = THIS_MODULE,
-			.of_parse_cb = buck1_set_hw_dvs_levels,
+			.of_parse_cb = buck_set_hw_dvs_levels,
+		},
+		.dvs = {
+			.level_map = ROHM_DVS_LEVEL_RUN | ROHM_DVS_LEVEL_IDLE |
+				     ROHM_DVS_LEVEL_SUSPEND,
+			.run_reg = BD718XX_REG_BUCK1_VOLT_RUN,
+			.run_mask = DVS_BUCK_RUN_MASK,
+			.idle_reg = BD718XX_REG_BUCK1_VOLT_IDLE,
+			.idle_mask = DVS_BUCK_RUN_MASK,
+			.suspend_reg = BD718XX_REG_BUCK1_VOLT_SUSP,
+			.suspend_mask = DVS_BUCK_RUN_MASK,
 		},
 		.init = {
 			.reg = BD718XX_REG_BUCK1_CTRL,
@@ -816,7 +726,14 @@ static const struct bd718xx_regulator_data bd71837_regulators[] = {
 			.enable_reg = BD718XX_REG_BUCK2_CTRL,
 			.enable_mask = BD718XX_BUCK_EN,
 			.owner = THIS_MODULE,
-			.of_parse_cb = buck2_set_hw_dvs_levels,
+			.of_parse_cb = buck_set_hw_dvs_levels,
+		},
+		.dvs = {
+			.level_map = ROHM_DVS_LEVEL_RUN | ROHM_DVS_LEVEL_IDLE,
+			.run_reg = BD718XX_REG_BUCK2_VOLT_RUN,
+			.run_mask = DVS_BUCK_RUN_MASK,
+			.idle_reg = BD718XX_REG_BUCK2_VOLT_IDLE,
+			.idle_mask = DVS_BUCK_RUN_MASK,
 		},
 		.init = {
 			.reg = BD718XX_REG_BUCK2_CTRL,
@@ -840,7 +757,12 @@ static const struct bd718xx_regulator_data bd71837_regulators[] = {
 			.enable_reg = BD71837_REG_BUCK3_CTRL,
 			.enable_mask = BD718XX_BUCK_EN,
 			.owner = THIS_MODULE,
-			.of_parse_cb = buck3_set_hw_dvs_levels,
+			.of_parse_cb = buck_set_hw_dvs_levels,
+		},
+		.dvs = {
+			.level_map = ROHM_DVS_LEVEL_RUN,
+			.run_reg = BD71837_REG_BUCK3_VOLT_RUN,
+			.run_mask = DVS_BUCK_RUN_MASK,
 		},
 		.init = {
 			.reg = BD71837_REG_BUCK3_CTRL,
@@ -864,7 +786,12 @@ static const struct bd718xx_regulator_data bd71837_regulators[] = {
 			.enable_reg = BD71837_REG_BUCK4_CTRL,
 			.enable_mask = BD718XX_BUCK_EN,
 			.owner = THIS_MODULE,
-			.of_parse_cb = buck4_set_hw_dvs_levels,
+			.of_parse_cb = buck_set_hw_dvs_levels,
+		},
+		.dvs = {
+			.level_map = ROHM_DVS_LEVEL_RUN,
+			.run_reg = BD71837_REG_BUCK4_VOLT_RUN,
+			.run_mask = DVS_BUCK_RUN_MASK,
 		},
 		.init = {
 			.reg = BD71837_REG_BUCK4_CTRL,
diff --git a/drivers/regulator/rohm-regulator.c b/drivers/regulator/rohm-regulator.c
new file mode 100644
index 000000000000..ca368ada53c6
--- /dev/null
+++ b/drivers/regulator/rohm-regulator.c
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (C) 2018 ROHM Semiconductors
+
+#include <linux/errno.h>
+#include <linux/mfd/rohm-generic.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+
+static int set_dvs_level(const struct regulator_desc *desc,
+			 struct device_node *np, struct regmap *regmap,
+			 char *prop, unsigned int reg, unsigned int mask,
+			 unsigned int omask, unsigned int oreg)
+{
+	int ret, i;
+	uint32_t uv;
+
+	ret = of_property_read_u32(np, prop, &uv);
+	if (ret) {
+		if (ret != -EINVAL)
+			return ret;
+		return 0;
+	}
+
+	if (uv == 0) {
+		if (omask)
+			return regmap_update_bits(regmap, oreg, omask, 0);
+	}
+	for (i = 0; i < desc->n_voltages; i++) {
+		ret = regulator_desc_list_voltage_linear_range(desc, i);
+		if (ret < 0)
+			continue;
+		if (ret == uv) {
+			i <<= ffs(desc->vsel_mask) - 1;
+			ret = regmap_update_bits(regmap, reg, mask, i);
+			if (omask && !ret)
+				ret = regmap_update_bits(regmap, oreg, omask,
+							 omask);
+			break;
+		}
+	}
+	return ret;
+}
+
+int rohm_regulator_set_dvs_levels(const struct rohm_dvs_config *dvs,
+			  struct device_node *np,
+			  const struct regulator_desc *desc,
+			  struct regmap *regmap)
+{
+	int i, ret = 0;
+	char *prop;
+	unsigned int reg, mask, omask, oreg = desc->enable_reg;
+
+	for (i = 0; i < ROHM_DVS_LEVEL_MAX && !ret; i++) {
+		if (dvs->level_map & (1 << i)) {
+			switch (i + 1) {
+			case ROHM_DVS_LEVEL_RUN:
+				prop = "rohm,dvs-run-voltage";
+				reg = dvs->run_reg;
+				mask = dvs->run_mask;
+				omask = dvs->run_on_mask;
+				break;
+			case ROHM_DVS_LEVEL_IDLE:
+				prop = "rohm,dvs-idle-voltage";
+				reg = dvs->idle_reg;
+				mask = dvs->idle_mask;
+				omask = dvs->idle_on_mask;
+				break;
+			case ROHM_DVS_LEVEL_SUSPEND:
+				prop = "rohm,dvs-suspend-voltage";
+				reg = dvs->suspend_reg;
+				mask = dvs->suspend_mask;
+				omask = dvs->suspend_on_mask;
+				break;
+			case ROHM_DVS_LEVEL_LPSR:
+				prop = "rohm,dvs-lpsr-voltage";
+				reg = dvs->lpsr_reg;
+				mask = dvs->lpsr_mask;
+				omask = dvs->lpsr_on_mask;
+				break;
+			default:
+				return -EINVAL;
+			}
+			ret = set_dvs_level(desc, np, regmap, prop, reg, mask,
+					    omask, oreg);
+		}
+	}
+	return ret;
+}
+EXPORT_SYMBOL(rohm_regulator_set_dvs_levels);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>");
+MODULE_DESCRIPTION("Generic helpers for ROHM PMIC regulator drivers");
diff --git a/include/linux/mfd/rohm-generic.h b/include/linux/mfd/rohm-generic.h
index b280f3100d6c..86397b42e9bf 100644
--- a/include/linux/mfd/rohm-generic.h
+++ b/include/linux/mfd/rohm-generic.h
@@ -4,6 +4,9 @@
 #ifndef __LINUX_MFD_ROHM_H__
 #define __LINUX_MFD_ROHM_H__
 
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+
 enum {
 	ROHM_CHIP_TYPE_BD71837 = 0,
 	ROHM_CHIP_TYPE_BD71847,
@@ -18,4 +21,45 @@ struct rohm_regmap_dev {
 	struct regmap *regmap;
 };
 
+enum {
+	ROHM_DVS_LEVEL_UNKNOWN,
+	ROHM_DVS_LEVEL_RUN,
+	ROHM_DVS_LEVEL_IDLE,
+	ROHM_DVS_LEVEL_SUSPEND,
+	ROHM_DVS_LEVEL_LPSR,
+#define ROHM_DVS_LEVEL_MAX ROHM_DVS_LEVEL_LPSR
+};
+
+struct rohm_dvs_config {
+	uint64_t level_map;
+	unsigned int run_reg;
+	unsigned int run_mask;
+	unsigned int run_on_mask;
+	unsigned int idle_reg;
+	unsigned int idle_mask;
+	unsigned int idle_on_mask;
+	unsigned int suspend_reg;
+	unsigned int suspend_mask;
+	unsigned int suspend_on_mask;
+	unsigned int lpsr_reg;
+	unsigned int lpsr_mask;
+	unsigned int lpsr_on_mask;
+};
+
+#if IS_ENABLED(CONFIG_REGULATOR_ROHM)
+int rohm_regulator_set_dvs_levels(const struct rohm_dvs_config *dvs,
+				  struct device_node *np,
+				  const struct regulator_desc *desc,
+				  struct regmap *regmap);
+
+#else
+static inline int rohm_regulator_set_dvs_levels(const struct rohm_dvs_config *dvs,
+						struct device_node *np,
+						const struct regulator_desc *desc,
+						struct regmap *regmap)
+{
+	return 0;
+}
+#endif //IS_ENABLED(CONFIG_REGULATOR_ROHM)
+
 #endif
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
