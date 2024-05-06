Return-Path: <linux-gpio+bounces-6155-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3638BD12C
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 17:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE7A51C22BBA
	for <lists+linux-gpio@lfdr.de>; Mon,  6 May 2024 15:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 40109156641;
	Mon,  6 May 2024 15:10:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C0aWDSPU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D8C1553B5;
	Mon,  6 May 2024 15:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715008215; cv=none; b=eCpdRQTT8eUOzBYHYOda1mzXF/YtT3TLvY+uNJMzp1JZdAQwyE0F6HrRsWZQPuBUs9nWnT7s4X3nKnU7pX9Ta3x0NUxOeJG/PKH/8V2nLZyg/TfEqv6X1wMkugZAAxlYOIUlcIRKeNRWQYnWcKDkhNdPbTdb+0Hpq8GcOQmyKFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715008215; c=relaxed/simple;
	bh=IqN85Bl78UCzls1ZfaO48JRo5epr0gUY+Set+TiTF8A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OoyEur9/A7kTtFXtF/PONWdBAjwNLChOFB3f5/VQahmgA8q1aTdncLUqBrP2vOuodRy2Xw4iFGQM9jr8Ujoq75qSx3tkahzc1PH6MfppqLHqThlzIE3PmN85NCtp4OXBMvOmT+gup73K2j7hBBeR46zfhSy/m2gqkWshCTpXHTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C0aWDSPU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE5EC4DE16;
	Mon,  6 May 2024 15:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715008215;
	bh=IqN85Bl78UCzls1ZfaO48JRo5epr0gUY+Set+TiTF8A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C0aWDSPUkZim8kQ4VN+PAqAVqCdCFbyyorfBpkwmzkwXPrmKrDbdwSJzcHex7mnyG
	 S499acB15z6WDY2unRXYX2z59ZaKKUCbl8H+Lo0V8hx0R9bnYdBvGb3Zo6WjsJtKZY
	 2FqNssm1S+d0aIp8SPv3EQjX4r33mDOxPa4zRR9Vr9dPJ1dDbB1CD/IQ9LxtoumsiV
	 egC0FLgeZPX7ahZddbZpvcfWh+7vfcNJjpQ92MGQjfMGNUi5DhRHTtoPzVOukIsnT4
	 OQTRoc8V9A2hmMT/AaWnn+35gV1VxGKtV6zJqDmutIvBY/l9FL+XFag4eiG8EyZOVq
	 lh8PYArFDDcHA==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan+linaro@kernel.org>)
	id 1s3zyq-000000006Cd-3U7A;
	Mon, 06 May 2024 17:10:16 +0200
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
	Satya Priya <quic_c_skakit@quicinc.com>,
	Stephen Boyd <swboyd@chromium.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH 12/13] regulator: add pm8008 pmic regulator driver
Date: Mon,  6 May 2024 17:08:29 +0200
Message-ID: <20240506150830.23709-13-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240506150830.23709-1-johan+linaro@kernel.org>
References: <20240506150830.23709-1-johan+linaro@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Satya Priya <quic_c_skakit@quicinc.com>

Qualcomm Technologies, Inc. PM8008 is an I2C-controlled PMIC containing
seven LDO regulators. Add a PM8008 regulator driver to support PMIC
regulator management via the regulator framework.

Note that this driver, originally submitted by Satya Priya [1], has been
reworked to match the new devicetree binding which no longer describes
each regulator as a separate device.

This avoids describing internal details like register offsets in the
devicetree and allows for extending the implementation with features
like over-current protection without having to update the binding.

Specifically note that the regulator interrupts are shared between all
regulators.

Note that the secondary regmap is looked up by name and that if the
driver ever needs to be generalised to support regulators provided by
the primary regmap (I2C address) such information could be added to a
driver lookup table matching on the parent compatible.

This also fixes the original implementation, which looked up regulators
by 'regulator-name' property rather than devicetree node name and which
prevented the regulators from being named to match board schematics.

[1] https://lore.kernel.org/r/1655200111-18357-8-git-send-email-quic_c_skakit@quicinc.com

Signed-off-by: Satya Priya <quic_c_skakit@quicinc.com>
Cc: Stephen Boyd <swboyd@chromium.org>
[ johan: rework probe to match new binding, amend commit message and
         Kconfig entry]
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/regulator/Kconfig                 |   7 +
 drivers/regulator/Makefile                |   1 +
 drivers/regulator/qcom-pm8008-regulator.c | 215 ++++++++++++++++++++++
 3 files changed, 223 insertions(+)
 create mode 100644 drivers/regulator/qcom-pm8008-regulator.c

diff --git a/drivers/regulator/Kconfig b/drivers/regulator/Kconfig
index 7db0a29b5b8d..d07d034ef1a2 100644
--- a/drivers/regulator/Kconfig
+++ b/drivers/regulator/Kconfig
@@ -1027,6 +1027,13 @@ config REGULATOR_PWM
 	  This driver supports PWM controlled voltage regulators. PWM
 	  duty cycle can increase or decrease the voltage.
 
+config REGULATOR_QCOM_PM8008
+	tristate "Qualcomm Technologies, Inc. PM8008 PMIC regulators"
+	depends on MFD_QCOM_PM8008
+	help
+	  Select this option to enable support for the voltage regulators in
+	  Qualcomm Technologies, Inc. PM8008 PMICs.
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
index 000000000000..51f1ce5e043c
--- /dev/null
+++ b/drivers/regulator/qcom-pm8008-regulator.c
@@ -0,0 +1,215 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2019-2020, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/regulator/driver.h>
+
+#define VSET_STEP_MV			8
+#define VSET_STEP_UV			(VSET_STEP_MV * 1000)
+
+#define LDO_ENABLE_REG(base)		((base) + 0x46)
+#define ENABLE_BIT			BIT(7)
+
+#define LDO_VSET_LB_REG(base)		((base) + 0x40)
+
+#define LDO_STEPPER_CTL_REG(base)	((base) + 0x3b)
+#define DEFAULT_VOLTAGE_STEPPER_RATE	38400
+#define STEP_RATE_MASK			GENMASK(1, 0)
+
+#define NLDO_MIN_UV			528000
+#define NLDO_MAX_UV			1504000
+
+#define PLDO_MIN_UV			1504000
+#define PLDO_MAX_UV			3400000
+
+struct pm8008_regulator_data {
+	const char			*name;
+	const char			*supply_name;
+	u16				base;
+	int				min_dropout_uv;
+	const struct linear_range	*voltage_range;
+};
+
+struct pm8008_regulator {
+	struct regmap		*regmap;
+	struct regulator_desc	rdesc;
+	u16			base;
+	int			step_rate;
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
+static const struct pm8008_regulator_data reg_data[] = {
+	/* name	  parent       base    headroom_uv voltage_range */
+	{ "ldo1", "vdd_l1_l2", 0x4000, 225000, nldo_ranges, },
+	{ "ldo2", "vdd_l1_l2", 0x4100, 225000, nldo_ranges, },
+	{ "ldo3", "vdd_l3_l4", 0x4200, 300000, pldo_ranges, },
+	{ "ldo4", "vdd_l3_l4", 0x4300, 300000, pldo_ranges, },
+	{ "ldo5", "vdd_l5",    0x4400, 200000, pldo_ranges, },
+	{ "ldo6", "vdd_l6",    0x4500, 200000, pldo_ranges, },
+	{ "ldo7", "vdd_l7",    0x4600, 200000, pldo_ranges, },
+};
+
+static int pm8008_regulator_get_voltage(struct regulator_dev *rdev)
+{
+	struct pm8008_regulator *pm8008_reg = rdev_get_drvdata(rdev);
+	__le16 mV;
+	int uV;
+
+	regmap_bulk_read(pm8008_reg->regmap,
+			LDO_VSET_LB_REG(pm8008_reg->base), (void *)&mV, 2);
+
+	uV = le16_to_cpu(mV) * 1000;
+	return (uV - pm8008_reg->rdesc.min_uV) / pm8008_reg->rdesc.uV_step;
+}
+
+static inline int pm8008_write_voltage(struct pm8008_regulator *pm8008_reg,
+							int mV)
+{
+	__le16 vset_raw;
+
+	vset_raw = cpu_to_le16(mV);
+
+	return regmap_bulk_write(pm8008_reg->regmap,
+			LDO_VSET_LB_REG(pm8008_reg->base),
+			(const void *)&vset_raw, sizeof(vset_raw));
+}
+
+static int pm8008_regulator_set_voltage_time(struct regulator_dev *rdev,
+				int old_uV, int new_uv)
+{
+	struct pm8008_regulator *pm8008_reg = rdev_get_drvdata(rdev);
+
+	return DIV_ROUND_UP(abs(new_uv - old_uV), pm8008_reg->step_rate);
+}
+
+static int pm8008_regulator_set_voltage(struct regulator_dev *rdev,
+					unsigned int selector)
+{
+	struct pm8008_regulator *pm8008_reg = rdev_get_drvdata(rdev);
+	int rc, mV;
+
+	rc = regulator_list_voltage_linear_range(rdev, selector);
+	if (rc < 0)
+		return rc;
+
+	/* voltage control register is set with voltage in millivolts */
+	mV = DIV_ROUND_UP(rc, 1000);
+
+	rc = pm8008_write_voltage(pm8008_reg, mV);
+	if (rc < 0)
+		return rc;
+
+	return 0;
+}
+
+static const struct regulator_ops pm8008_regulator_ops = {
+	.enable			= regulator_enable_regmap,
+	.disable		= regulator_disable_regmap,
+	.is_enabled		= regulator_is_enabled_regmap,
+	.set_voltage_sel	= pm8008_regulator_set_voltage,
+	.get_voltage_sel	= pm8008_regulator_get_voltage,
+	.list_voltage		= regulator_list_voltage_linear,
+	.set_voltage_time	= pm8008_regulator_set_voltage_time,
+};
+
+static int pm8008_regulator_probe(struct platform_device *pdev)
+{
+	struct regulator_config reg_config = {};
+	struct pm8008_regulator *pm8008_reg;
+	struct device *dev = &pdev->dev;
+	struct regulator_desc *rdesc;
+	struct regulator_dev *rdev;
+	struct regmap *regmap;
+	unsigned int val;
+	int rc, i;
+
+	regmap = dev_get_regmap(dev->parent, "secondary");
+	if (!regmap)
+		return -EINVAL;
+
+	for (i = 0; i < ARRAY_SIZE(reg_data); i++) {
+		pm8008_reg = devm_kzalloc(dev, sizeof(*pm8008_reg), GFP_KERNEL);
+		if (!pm8008_reg)
+			return -ENOMEM;
+
+		pm8008_reg->regmap = regmap;
+		pm8008_reg->base = reg_data[i].base;
+
+		/* get slew rate */
+		rc = regmap_bulk_read(pm8008_reg->regmap,
+				LDO_STEPPER_CTL_REG(pm8008_reg->base), &val, 1);
+		if (rc < 0) {
+			dev_err(dev, "failed to read step rate: %d\n", rc);
+			return rc;
+		}
+		val &= STEP_RATE_MASK;
+		pm8008_reg->step_rate = DEFAULT_VOLTAGE_STEPPER_RATE >> val;
+
+		rdesc = &pm8008_reg->rdesc;
+		rdesc->type = REGULATOR_VOLTAGE;
+		rdesc->ops = &pm8008_regulator_ops;
+		rdesc->name = reg_data[i].name;
+		rdesc->supply_name = reg_data[i].supply_name;
+		rdesc->of_match = reg_data[i].name;
+		rdesc->uV_step = VSET_STEP_UV;
+		rdesc->linear_ranges = reg_data[i].voltage_range;
+		rdesc->n_linear_ranges = 1;
+		BUILD_BUG_ON((ARRAY_SIZE(pldo_ranges) != 1) ||
+				(ARRAY_SIZE(nldo_ranges) != 1));
+
+		if (reg_data[i].voltage_range == nldo_ranges) {
+			rdesc->min_uV = NLDO_MIN_UV;
+			rdesc->n_voltages = ((NLDO_MAX_UV - NLDO_MIN_UV) / rdesc->uV_step) + 1;
+		} else {
+			rdesc->min_uV = PLDO_MIN_UV;
+			rdesc->n_voltages = ((PLDO_MAX_UV - PLDO_MIN_UV) / rdesc->uV_step) + 1;
+		}
+
+		rdesc->enable_reg = LDO_ENABLE_REG(pm8008_reg->base);
+		rdesc->enable_mask = ENABLE_BIT;
+		rdesc->min_dropout_uV = reg_data[i].min_dropout_uv;
+		rdesc->regulators_node = of_match_ptr("regulators");
+
+		reg_config.dev = dev->parent;
+		reg_config.driver_data = pm8008_reg;
+		reg_config.regmap = pm8008_reg->regmap;
+
+		rdev = devm_regulator_register(dev, rdesc, &reg_config);
+		if (IS_ERR(rdev)) {
+			rc = PTR_ERR(rdev);
+			dev_err(dev, "failed to register regulator %s: %d\n",
+					reg_data[i].name, rc);
+			return rc;
+		}
+	}
+
+	return 0;
+}
+
+static struct platform_driver pm8008_regulator_driver = {
+	.driver	= {
+		.name = "qcom-pm8008-regulator",
+	},
+	.probe = pm8008_regulator_probe,
+};
+
+module_platform_driver(pm8008_regulator_driver);
+
+MODULE_DESCRIPTION("Qualcomm Technologies, Inc. PM8008 PMIC Regulator Driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:qcom-pm8008-regulator");
-- 
2.43.2


