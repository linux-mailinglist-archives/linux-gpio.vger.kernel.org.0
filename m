Return-Path: <linux-gpio+bounces-6881-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEF68D3CD2
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 18:35:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55E521F23EF6
	for <lists+linux-gpio@lfdr.de>; Wed, 29 May 2024 16:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 051001CB31B;
	Wed, 29 May 2024 16:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BGd5yz77"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F05F1C9EAC;
	Wed, 29 May 2024 16:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717000236; cv=none; b=E+10WJ2Y3xXG+G3AcnICzJZ3/zFcJs1m/iAl447LhGq3rTidKOsvA6u3f17bsCkaD/nWs/LIO06+f2FtwibxZkRtS1FPunJU9TYJqljPUwoaMTz7ujHTUle2Cdc6c7OG4wY2Hkh3otKj1KGqM6uJWMTuiAviPpu2tv6L+Yx+tR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717000236; c=relaxed/simple;
	bh=Ts9WiTi8n3Z0JGJ0fF0cdTHZghaqZY6W9ZGkIBz1Wc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dCgsXJpYxs31wL+RcAZ42olEVW1LGjvO/tl0vnsedHSxFF8wemQWcq6HoJgROUYhWr+9/pkn9bRGDyzfq0eyp3+Yi41vDEvOfXPgRStXuVRdguUzfUH85gv52yek949eeQF+2Mg3U+BLy6dTWDsPvLtYhFS4fAbYL0tK9oHmMbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BGd5yz77; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50223C4AF11;
	Wed, 29 May 2024 16:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717000236;
	bh=Ts9WiTi8n3Z0JGJ0fF0cdTHZghaqZY6W9ZGkIBz1Wc4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BGd5yz77G0V3q4JwEhvcE+0wKmWWcANn1VbvwTKuUXMG8gkoxnJkl0lKHJKUBjL6Z
	 HaXshgG3UjAt/4vzIjxcSZfLc2VPsibWDwDSB++moYh4jtb4hY/XJf+DKM5FdSJaX4
	 jL2tjclMG7VjfbpNWZenFjsm6aWY+xgMdH4JDJznp1oLEjUHQR7FVs9Ap/ueTHL2sF
	 VISIIQK4g01nYfU8A12cM8Yc0vA98iHLlCL1S3D4Tv0IJF8GENin9EhGrX08p+F17q
	 /1cyZJ2A+pIaJ0n6Y2/FjWmEv2XzxFyDm22haLx2lW/6wya32Wi3zS8EKBSNf6reAi
	 z5cNRea9r+2Ug==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1sCMCC-000000004jE-1Upy;
	Wed, 29 May 2024 18:30:36 +0200
From: Johan Hovold <johan+linaro@kernel.org>
To: Lee Jones <lee@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Das Srinagesh <quic_gurus@quicinc.com>,
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH v2 13/14] regulator: add pm8008 pmic regulator driver
Date: Wed, 29 May 2024 18:29:57 +0200
Message-ID: <20240529162958.18081-14-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20240529162958.18081-1-johan+linaro@kernel.org>
References: <20240529162958.18081-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Qualcomm PM8008 is an I2C-controlled PMIC containing seven LDO
regulators.

The driver is based on a driver submitted by Satya Priya, but it has
been cleaned up and reworked to match the new devicetree binding which
no longer describes each regulator as a separate device.

This avoids describing internal details like register offsets in the
devicetree and allows for extending the implementation with features
like over-current protection without having to update the binding.

Specifically note that the regulator interrupts are shared between all
regulators.

Note that the secondary regmap is looked up by name and that if the
driver ever needs to be generalised to support regulators provided by
the primary regmap (I2C address) such information could be added to the
device-id table.

This also fixes the original implementation, which looked up regulators
by 'regulator-name' property rather than devicetree node name and which
prevented the regulators from being named to match board schematics.

Link: https://lore.kernel.org/r/1655200111-18357-8-git-send-email-quic_c_skakit@quicinc.com
Cc: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
Cc: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/regulator/Kconfig                 |   7 +
 drivers/regulator/Makefile                |   1 +
 drivers/regulator/qcom-pm8008-regulator.c | 198 ++++++++++++++++++++++
 3 files changed, 206 insertions(+)
 create mode 100644 drivers/regulator/qcom-pm8008-regulator.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 7db0a29b5b8d..546533735be8 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1027,6 +1027,13 @@ config REGULATOR_PWM
 	  This driver supports PWM controlled voltage regulators. PWM
 	  duty cycle can increase or decrease the voltage.
 
+config REGULATOR_QCOM_PM8008
+	tristate "Qualcomm PM8008 PMIC regulators"
+	depends on MFD_QCOM_PM8008
+	help
+	  Select this option to enable support for the voltage regulators in
+	  Qualcomm PM8008 PMICs.
+
 config REGULATOR_QCOM_REFGEN
 	tristate "Qualcomm REFGEN regulator driver"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/regulator/Makefile b/drivers/regulator/Makefile
index 46fb569e6be8..0457b0925b3e 100644
--- a/drivers/regulator/Makefile
+++ b/drivers/regulator/Makefile
@@ -112,6 +112,7 @@ obj-$(CONFIG_REGULATOR_MT6380)	+= mt6380-regulator.o
 obj-$(CONFIG_REGULATOR_MT6397)	+= mt6397-regulator.o
 obj-$(CONFIG_REGULATOR_MTK_DVFSRC) += mtk-dvfsrc-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_LABIBB) += qcom-labibb-regulator.o
+obj-$(CONFIG_REGULATOR_QCOM_PM8008) += qcom-pm8008-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_REFGEN) += qcom-refgen-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_RPM) += qcom_rpm-regulator.o
 obj-$(CONFIG_REGULATOR_QCOM_RPMH) += qcom-rpmh-regulator.o
diff --git a/drivers/regulator/qcom-pm8008-regulator.c b/drivers/regulator/qcom-pm8008-regulator.c
new file mode 100644
index 000000000000..da017c1969d0
--- /dev/null
+++ b/drivers/regulator/qcom-pm8008-regulator.c
@@ -0,0 +1,198 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2024 Linaro Limited
+ */
+
+#include <linux/array_size.h>
+#include <linux/bits.h>
+#include <linux/device.h>
+#include <linux/math.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+
+#include <asm/byteorder.h>
+
+#define DEFAULT_VOLTAGE_STEPPER_RATE	38400
+
+#define LDO_STEPPER_CTL_REG		0x3b
+#define STEP_RATE_MASK			GENMASK(1, 0)
+
+#define LDO_VSET_LB_REG			0x40
+
+#define LDO_ENABLE_REG			0x46
+#define ENABLE_BIT			BIT(7)
+
+struct pm8008_regulator {
+	struct regmap		*regmap;
+	struct regulator_desc	desc;
+	unsigned int		base;
+};
+
+struct pm8008_regulator_data {
+	const char			*name;
+	const char			*supply_name;
+	unsigned int			base;
+	int				min_dropout_uV;
+	const struct linear_range	*voltage_range;
+};
+
+static const struct linear_range nldo_ranges[] = {
+	REGULATOR_LINEAR_RANGE(528000, 0, 122, 8000),
+};
+
+static const struct linear_range pldo_ranges[] = {
+	REGULATOR_LINEAR_RANGE(1504000, 0, 237, 8000),
+};
+
+static const struct pm8008_regulator_data pm8008_reg_data[] = {
+	{ "ldo1", "vdd-l1-l2", 0x4000, 225000, nldo_ranges, },
+	{ "ldo2", "vdd-l1-l2", 0x4100, 225000, nldo_ranges, },
+	{ "ldo3", "vdd-l3-l4", 0x4200, 300000, pldo_ranges, },
+	{ "ldo4", "vdd-l3-l4", 0x4300, 300000, pldo_ranges, },
+	{ "ldo5", "vdd-l5",    0x4400, 200000, pldo_ranges, },
+	{ "ldo6", "vdd-l6",    0x4500, 200000, pldo_ranges, },
+	{ "ldo7", "vdd-l7",    0x4600, 200000, pldo_ranges, },
+};
+
+static int pm8008_regulator_set_voltage_sel(struct regulator_dev *rdev, unsigned int sel)
+{
+	struct pm8008_regulator *preg = rdev_get_drvdata(rdev);
+	unsigned int mV;
+	__le16 val;
+	int ret;
+
+	ret = regulator_list_voltage_linear_range(rdev, sel);
+	if (ret < 0)
+		return ret;
+
+	mV = DIV_ROUND_UP(ret, 1000);
+
+	val = cpu_to_le16(mV);
+
+	ret = regmap_bulk_write(preg->regmap, preg->base + LDO_VSET_LB_REG,
+			&val, sizeof(val));
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int pm8008_regulator_get_voltage_sel(struct regulator_dev *rdev)
+{
+	struct pm8008_regulator *preg = rdev_get_drvdata(rdev);
+	unsigned int uV;
+	__le16 val;
+	int ret;
+
+	ret = regmap_bulk_read(preg->regmap, preg->base + LDO_VSET_LB_REG,
+			&val, sizeof(val));
+	if (ret < 0)
+		return ret;
+
+	uV = le16_to_cpu(val) * 1000;
+
+	return (uV - preg->desc.min_uV) / preg->desc.uV_step;
+}
+
+static const struct regulator_ops pm8008_regulator_ops = {
+	.list_voltage		= regulator_list_voltage_linear,
+	.set_voltage_sel	= pm8008_regulator_set_voltage_sel,
+	.get_voltage_sel	= pm8008_regulator_get_voltage_sel,
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.is_enabled		= regulator_is_enabled_regmap,
+};
+
+static int pm8008_regulator_probe(struct platform_device *pdev)
+{
+	const struct pm8008_regulator_data *data;
+	struct regulator_config config = {};
+	struct device *dev = &pdev->dev;
+	struct pm8008_regulator *preg;
+	struct regulator_desc *desc;
+	struct regulator_dev *rdev;
+	struct regmap *regmap;
+	unsigned int val;
+	int ret, i;
+
+	regmap = dev_get_regmap(dev->parent, "secondary");
+	if (!regmap)
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(pm8008_reg_data); i++) {
+		data = &pm8008_reg_data[i];
+
+		preg = devm_kzalloc(dev, sizeof(*preg), GFP_KERNEL);
+		if (!preg)
+			return -ENOMEM;
+
+		preg->regmap = regmap;
+		preg->base = data->base;
+
+		desc = &preg->desc;
+
+		desc->name = data->name;
+		desc->supply_name = data->supply_name;
+		desc->of_match = data->name;
+		desc->regulators_node = of_match_ptr("regulators");
+		desc->ops = &pm8008_regulator_ops;
+		desc->type = REGULATOR_VOLTAGE;
+		desc->owner = THIS_MODULE;
+
+		desc->linear_ranges = data->voltage_range;
+		desc->n_linear_ranges = 1;
+		desc->uV_step = desc->linear_ranges[0].step;
+		desc->min_uV = desc->linear_ranges[0].min;
+		desc->n_voltages = linear_range_values_in_range(&desc->linear_ranges[0]);
+
+		ret = regmap_read(regmap, preg->base + LDO_STEPPER_CTL_REG, &val);
+		if (ret < 0) {
+			dev_err(dev, "failed to read step rate: %d\n", ret);
+			return ret;
+		}
+		val &= STEP_RATE_MASK;
+		desc->ramp_delay = DEFAULT_VOLTAGE_STEPPER_RATE >> val;
+
+		desc->min_dropout_uV = data->min_dropout_uV;
+
+		desc->enable_reg = preg->base + LDO_ENABLE_REG;
+		desc->enable_mask = ENABLE_BIT;
+
+		config.dev = dev->parent;
+		config.driver_data = preg;
+		config.regmap = regmap;
+
+		rdev = devm_regulator_register(dev, desc, &config);
+		if (IS_ERR(rdev)) {
+			ret = PTR_ERR(rdev);
+			dev_err(dev, "failed to register regulator %s: %d\n",
+					desc->name, ret);
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+static const struct platform_device_id pm8008_regulator_id_table[] = {
+	{ "pm8008-regulator" },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, pm8008_regulator_id_table);
+
+static struct platform_driver pm8008_regulator_driver = {
+	.driver	= {
+		.name = "qcom-pm8008-regulator",
+	},
+	.probe = pm8008_regulator_probe,
+	.id_table = pm8008_regulator_id_table,
+};
+module_platform_driver(pm8008_regulator_driver);
+
+MODULE_DESCRIPTION("Qualcomm PM8008 PMIC regulator driver");
+MODULE_LICENSE("GPL");
-- 
2.44.1


