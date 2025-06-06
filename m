Return-Path: <linux-gpio+bounces-21088-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A1BAD0493
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Jun 2025 17:05:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 170CB189DEA3
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Jun 2025 15:05:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CF77328AAF8;
	Fri,  6 Jun 2025 15:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q/E0ok1O"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED7A28A1E6
	for <linux-gpio@vger.kernel.org>; Fri,  6 Jun 2025 15:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749222206; cv=none; b=W6tY1kC9P2xS6z/NrGE1QMOXfYJZlYjuZxRgh1Jn3SUeyc2jO0+2HaLlGfbX1bmBfE3/Fgwx4oB1tH/wqr6Fr0YY8XWsZP7HLPD1w+buxTE6EWofXoxQGUkbfGeuy6dqE5cDn37f0l2ffJir0zWdRyni1ipOTrjUJSkyuBL7ltY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749222206; c=relaxed/simple;
	bh=i6QXnSiteLIUPBjVIav8k0ILi207/7CCIjQjoaDN3aQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tIeKr8rjo5h5LarTvpSsOCyJaJud97xlvOIMCXR865azJjIKdwofr2haFJrVGf2iu/qAAxkOUfUwQ03DeoCpFnuIokwyseB5ZyMIFIPcQcwWeX3SxipcyxK5uqcVLX23PdHxdkCx65fAemB8P01jHdcDj2MirBhMOtE9rERbgK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q/E0ok1O; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-ad8a6c202ffso402250466b.3
        for <linux-gpio@vger.kernel.org>; Fri, 06 Jun 2025 08:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749222199; x=1749826999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kqxgbhEUW2aPqS16pDRoTw9isctia083M7RJw6SkJXc=;
        b=Q/E0ok1OQB0mkpBg9xX+nNN40dUVDjOJgXKphVKierwsey5IBPTq2x4QUsr/1XQF15
         wgbx/y79LR98BrfiLQtKWBY/7vCT6Yz1Jf2dkIQMmWpFHcjdYZ+ZGg9mTIGV+Cs3C2FT
         A6tsInPr8aIUc0Rnfempq9xiP5eav5RuqrCu+n4QIUmAw4vyt2CssGkkPC+FlTvMql4S
         q/KHuCAw12Jvj9rPc0S1oefv6EUdIqA+3WCrAQdvqDigtiXKOFXk689DyYuqnV9D/qUn
         YIkzWzpm3mytd0jF02w6AopWpFaeLCuDu8OyBe3iRG9sA+UdYmLfkuu2VSoeLQQLLnqZ
         q8+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749222199; x=1749826999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kqxgbhEUW2aPqS16pDRoTw9isctia083M7RJw6SkJXc=;
        b=eIzovF9+Q8agWcDS97IhTYwWFg3hoWYh8JECS1+uNTvHRO9jZo69YaiF9HgYO64lqL
         u5AqXl5Dy1tyTW8tyxQheF3/XPG4WvPpV4v4iC5YDq1bNu/bLglJ96VjVoFvmXUdl+3W
         WIS4A1DUfO5i/G80VKfETuMSqImboZiSx8Tjxlz3qZ4RejMsKEEZ2WI/Jm/1XyygAN+A
         eKWFW3DHuM7eo3AZHHeJZwFTY/lUciz81hbQ9aUZDG6OhdhXDaXxjbFGAVeJ5mbKlHBT
         FlnUX9PBeJyQGxbcl1TbrmZ7kAjiFB4WYvOz7rI6lxPa3pIh7IgWA7U+dkAoieiaHytd
         wZdw==
X-Forwarded-Encrypted: i=1; AJvYcCWMC4CrzCStuxSwHK8BJFUfpu7EwQ4AspaWnvIB2ugbwdD9Btw1/ECe4gHYhl5va71bCsfDllMO75dP@vger.kernel.org
X-Gm-Message-State: AOJu0YyzkfGmGrAghwP3GZyH61nVxNTpNcSi4pJQn5npEepg3C+r4WdO
	s64bJVpGOgKZYfZypu+WsdSbcjrl/L4yhnegGXG7LqUPTXUSuEOCaY/3zx2tARlZ6YE=
X-Gm-Gg: ASbGncs3EYAQEXL2Je39ZnrKyQXT6pOXEkFu5Lz1LQ2f0xoZuGyHkZ2IDcLxb7hRI+G
	1fWFbymk/DRH4gQx31PT6St/9w5CHEVS96/blOw8yxaYu1KSJKLrBAaw4go9uk9YRppxEZu51LQ
	ztfdOB151VoxutiFyKMCtQE0Z3XF1K0oeDgBsLhQ8HpoNjwV+u7B5iOl+yd1e8SCy+MZgvnDzzK
	c+uwDbnmve9XJ9mL5D/bw4YZhGKffPK51PZWfda0bkzCqfd9ESqur6swj+D7S6iHZTRb5KAwXjs
	YUAARfQKmLnPClwNGjZXhqA+VlJPmxh3H88c5boT+yO2OHi6b3KRRXNlvFORppq3ecM+0+7zuNB
	E8409wMhP2m5nhzs+GOtctQsENW4B4440NFMwTwWqm19bgA==
X-Google-Smtp-Source: AGHT+IEEWvXQDp4Z8aQYKW7jE1ugyWPX7Vb2fc4HmfXzwlZ9jNJDrzGCqaBfn/QhjgrsiaPRZYfKfA==
X-Received: by 2002:a17:907:3e0f:b0:ad9:16c8:9fee with SMTP id a640c23a62f3a-ade1a9160d7mr369371766b.3.1749222198976;
        Fri, 06 Jun 2025 08:03:18 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc38cf2sm127735066b.121.2025.06.06.08.03.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 08:03:18 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Jun 2025 16:03:09 +0100
Subject: [PATCH v2 13/17] regulator: s2mps11: add S2MPG10 regulator
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250606-s2mpg1x-regulators-v2-13-b03feffd2621@linaro.org>
References: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
In-Reply-To: <20250606-s2mpg1x-regulators-v2-0-b03feffd2621@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

The S2MPG10 PMIC is a Power Management IC for mobile applications with
buck converters, various LDOs, power meters, RTC, clock outputs, and
additional GPIO interfaces.

It has 10 buck and 31 LDO rails. Several of these can either be
controlled via software or via external signals, e.g. input pins
connected to a main processor's GPIO pins.

This commit implements support for these rails.

Additional data needs to be stored for each regulator, e.g. the input
pin for external control, or a rail-specific ramp-rate for when
enabling a buck-rail. Therefore, probe() is updated slightly to make
that possible.

The rails are instantiated as separate driver instances for bucks and
LDOs, because S2MPG10 is typically used with an S2MPG11 sub-PMIC where
some bucks of one typically supply at least some of the LDOs of the
other.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
- move assignment of ::of_parse_cb in regulator_desc_s2mpg10_buck() to
  match order of struct definition
---
 drivers/regulator/s2mps11.c         | 561 +++++++++++++++++++++++++++++++++++-
 include/linux/mfd/samsung/s2mpg10.h |   3 +
 2 files changed, 561 insertions(+), 3 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index ff9124c998c685d9c598570148dca074e671a99b..3f2993b96c3e54427f5c0af7bb045e2278daa671 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -3,6 +3,7 @@
 // Copyright (c) 2012-2014 Samsung Electronics Co., Ltd
 //              http://www.samsung.com
 
+#include <dt-bindings/regulator/samsung,s2mpg10-regulator.h>
 #include <linux/bug.h>
 #include <linux/cleanup.h>
 #include <linux/err.h>
@@ -16,6 +17,7 @@
 #include <linux/regulator/machine.h>
 #include <linux/regulator/of_regulator.h>
 #include <linux/mfd/samsung/core.h>
+#include <linux/mfd/samsung/s2mpg10.h>
 #include <linux/mfd/samsung/s2mps11.h>
 #include <linux/mfd/samsung/s2mps13.h>
 #include <linux/mfd/samsung/s2mps14.h>
@@ -42,6 +44,21 @@ struct s2mps11_info {
 	DECLARE_BITMAP(suspend_state, S2MPS_REGULATOR_MAX);
 };
 
+#define to_s2mpg10_regulator_desc(x) container_of((x), struct s2mpg10_regulator_desc, desc)
+
+struct s2mpg10_regulator_desc {
+	struct regulator_desc desc;
+
+	/* Ramp rate during enable, valid for bucks only. */
+	unsigned int enable_ramp_rate;
+
+	/* Registers for external control of rail. */
+	unsigned int pctrlsel_reg;
+	unsigned int pctrlsel_mask;
+	/* Populated from DT. */
+	unsigned int pctrlsel_val;
+};
+
 static int get_ramp_delay(int ramp_delay)
 {
 	unsigned char cnt = 0;
@@ -388,6 +405,492 @@ static int s2mps11_of_parse_cb(struct device_node *np,
 	return s2mps11_of_parse_gpiod(np, desc, config);
 }
 
+static int s2mpg10_of_parse_cb(struct device_node *np,
+			       const struct regulator_desc *desc,
+			       struct regulator_config *config)
+{
+	const struct s2mps11_info *s2mps11 = config->driver_data;
+	struct s2mpg10_regulator_desc *s2mpg10_desc = to_s2mpg10_regulator_desc(desc);
+	u32 ext_control;
+
+	if (s2mps11->dev_type != S2MPG10)
+		return 0;
+
+	if (of_property_read_u32(np, "samsung,ext-control", &ext_control))
+		return 0;
+
+	switch (s2mps11->dev_type) {
+	case S2MPG10:
+		switch (desc->id) {
+		case S2MPG10_BUCK1 ... S2MPG10_BUCK7:
+		case S2MPG10_BUCK10:
+		case S2MPG10_LDO3 ... S2MPG10_LDO19:
+			if (ext_control > S2MPG10_PCTRLSEL_TCXO_ON2)
+				return -EINVAL;
+			break;
+
+		case S2MPG10_LDO20:
+			if (ext_control > S2MPG10_PCTRLSEL_LDO20M_OFF)
+				return -EINVAL;
+			break;
+
+		default:
+			return -EINVAL;
+		}
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	/*
+	 * If the regulator should be configured for external control, then:
+	 * 1) the PCTRLSELx register needs to be set accordingly
+	 * 2) regulator_desc::enable_val needs to be:
+	 *    a) updated and
+	 *    b) written to the hardware
+	 * 3) we switch to the ::ops that don't provide ::enable() and
+	 *    ::disable() implementations
+	 *
+	 * Points 1) and 2b) will be handled in _probe(), after
+	 * devm_regulator_register() returns, so that we can properly act on
+	 * failures, since the regulator core ignores most return values from
+	 * this parse callback.
+	 */
+	s2mpg10_desc->pctrlsel_val = ext_control;
+	s2mpg10_desc->pctrlsel_val <<= (ffs(s2mpg10_desc->pctrlsel_mask) - 1);
+
+	s2mpg10_desc->desc.enable_val = S2MPG10_PMIC_CTRL_ENABLE_EXT;
+	s2mpg10_desc->desc.enable_val <<= (ffs(desc->enable_mask) - 1);
+
+	++s2mpg10_desc->desc.ops;
+
+	return s2mps11_of_parse_gpiod(np, desc, config);
+}
+
+static int s2mpg10_enable_ext_control(struct s2mps11_info *s2mps11,
+				      struct regulator_dev *rdev)
+{
+	const struct s2mpg10_regulator_desc *s2mpg10_desc;
+	int ret;
+
+	switch (s2mps11->dev_type) {
+	case S2MPG10:
+		s2mpg10_desc = to_s2mpg10_regulator_desc(rdev->desc);
+		break;
+
+	default:
+		return 0;
+	}
+
+	ret = regmap_update_bits(rdev_get_regmap(rdev),
+				 s2mpg10_desc->pctrlsel_reg,
+				 s2mpg10_desc->pctrlsel_mask,
+				 s2mpg10_desc->pctrlsel_val);
+	if (ret)
+		return dev_err_probe(rdev_get_dev(rdev), ret,
+				     "failed to configure pctrlsel for %s\n",
+				     rdev->desc->name);
+
+	ret = regulator_enable_regmap(rdev);
+	if (ret)
+		return dev_err_probe(rdev_get_dev(rdev), ret,
+				     "failed to enable regulator %s\n",
+				     rdev->desc->name);
+
+	return 0;
+}
+
+/* ops for regulators without ramp control */
+static const struct regulator_ops s2mpg10_reg_ldo_ops[] = {
+	{
+		.list_voltage		= regulator_list_voltage_linear_range,
+		.map_voltage		= regulator_map_voltage_linear_range,
+		.is_enabled		= regulator_is_enabled_regmap,
+		.enable			= regulator_enable_regmap,
+		.disable		= regulator_disable_regmap,
+		.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+		.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+		.set_voltage_time_sel	= regulator_set_voltage_time_sel,
+	}, {
+		.list_voltage		= regulator_list_voltage_linear_range,
+		.map_voltage		= regulator_map_voltage_linear_range,
+		.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+		.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+		.set_voltage_time_sel	= regulator_set_voltage_time_sel,
+	}
+};
+
+/* ops for regulators that have ramp control */
+static const struct regulator_ops s2mpg10_reg_ldo_ramp_ops[] = {
+	{
+		.list_voltage		= regulator_list_voltage_linear_range,
+		.map_voltage		= regulator_map_voltage_linear_range,
+		.is_enabled		= regulator_is_enabled_regmap,
+		.enable			= regulator_enable_regmap,
+		.disable		= regulator_disable_regmap,
+		.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+		.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+		.set_voltage_time_sel	= regulator_set_voltage_time_sel,
+		.set_ramp_delay		= regulator_set_ramp_delay_regmap,
+	}, {
+		.list_voltage		= regulator_list_voltage_linear_range,
+		.map_voltage		= regulator_map_voltage_linear_range,
+		.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+		.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+		.set_voltage_time_sel	= regulator_set_voltage_time_sel,
+		.set_ramp_delay		= regulator_set_ramp_delay_regmap,
+	}
+};
+
+static int s2mpg10_regulator_buck_enable_time(struct regulator_dev *rdev)
+{
+	const struct s2mpg10_regulator_desc * const s2mpg10_desc =
+		to_s2mpg10_regulator_desc(rdev->desc);
+	const struct regulator_ops * const ops = rdev->desc->ops;
+	int vsel, curr_uV;
+
+	vsel = ops->get_voltage_sel(rdev);
+	if (vsel < 0)
+		return vsel;
+
+	curr_uV = ops->list_voltage(rdev, vsel);
+	if (curr_uV < 0)
+		return curr_uV;
+
+	return (rdev->desc->enable_time
+		+ DIV_ROUND_UP(curr_uV, s2mpg10_desc->enable_ramp_rate));
+}
+
+static int s2mpg10_regulator_buck_set_voltage_time(struct regulator_dev *rdev,
+						   int old_uV, int new_uV)
+{
+	unsigned int ramp_reg, ramp_sel, ramp_rate;
+	int ret;
+
+	if (old_uV == new_uV)
+		return 0;
+
+	ramp_reg = rdev->desc->ramp_reg;
+	if (old_uV > new_uV)
+		/* The downwards ramp is at a different offset. */
+		ramp_reg += S2MPG10_PMIC_DVS_RAMP4 - S2MPG10_PMIC_DVS_RAMP1;
+
+	ret = regmap_read(rdev->regmap, ramp_reg, &ramp_sel);
+	if (ret)
+		return ret;
+
+	ramp_sel &= rdev->desc->ramp_mask;
+	ramp_sel >>= ffs(rdev->desc->ramp_mask) - 1;
+	if (ramp_sel >= rdev->desc->n_ramp_values ||
+	    !rdev->desc->ramp_delay_table)
+		return -EINVAL;
+
+	ramp_rate = rdev->desc->ramp_delay_table[ramp_sel];
+
+	return DIV_ROUND_UP(abs(new_uV - old_uV), ramp_rate);
+}
+
+/*
+ * We assign both, ::set_voltage_time() and ::set_voltage_time_sel(), because
+ * only if the latter is != NULL, the regulator core will call neither during
+ * DVS if the regulator is disabled. If the latter is NULL, the core always
+ * calls the ::set_voltage_time() callback, which would give incorrect results
+ * if the regulator is off.
+ * At the same time, we do need ::set_voltage_time() due to differing upwards
+ * and downwards ramps and we can not make that code dependent on the regulator
+ * enable state, as that would break regulator_set_voltage_time() which
+ * expects a correct result no matter the enable state.
+ */
+static const struct regulator_ops s2mpg10_reg_buck_ops[] = {
+	{
+		.list_voltage		= regulator_list_voltage_linear_range,
+		.map_voltage		= regulator_map_voltage_linear_range,
+		.is_enabled		= regulator_is_enabled_regmap,
+		.enable			= regulator_enable_regmap,
+		.disable		= regulator_disable_regmap,
+		.enable_time		= s2mpg10_regulator_buck_enable_time,
+		.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+		.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+		.set_voltage_time	= s2mpg10_regulator_buck_set_voltage_time,
+		.set_voltage_time_sel	= regulator_set_voltage_time_sel,
+		.set_ramp_delay		= regulator_set_ramp_delay_regmap,
+	}, {
+		.list_voltage		= regulator_list_voltage_linear_range,
+		.map_voltage		= regulator_map_voltage_linear_range,
+		.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+		.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+		.set_voltage_time	= s2mpg10_regulator_buck_set_voltage_time,
+		.set_voltage_time_sel	= regulator_set_voltage_time_sel,
+		.set_ramp_delay		= regulator_set_ramp_delay_regmap,
+	}
+};
+
+#define regulator_desc_s2mpg10_ldo_cmn(_num, _supply, _ops, _vrange,	\
+		_vsel_reg_sfx, _vsel_mask, _en_reg, _en_mask,		\
+		_ramp_delay, _r_reg, _r_mask, _r_table,	_r_table_sz) {	\
+	.name		= "ldo"#_num"m",				\
+	.supply_name	= _supply,					\
+	.of_match	= of_match_ptr("ldo"#_num"m"),			\
+	.regulators_node = of_match_ptr("regulators"),			\
+	.of_parse_cb	= s2mpg10_of_parse_cb,				\
+	.id		= S2MPG10_LDO##_num,				\
+	.ops		= &_ops[0],					\
+	.type		= REGULATOR_VOLTAGE,				\
+	.owner		= THIS_MODULE,					\
+	.linear_ranges	= _vrange,					\
+	.n_linear_ranges = ARRAY_SIZE(_vrange),				\
+	.n_voltages	= _vrange##_count,				\
+	.vsel_reg	= S2MPG10_PMIC_L##_num##M_##_vsel_reg_sfx,	\
+	.vsel_mask	= _vsel_mask,					\
+	.enable_reg	= S2MPG10_PMIC_##_en_reg,			\
+	.enable_mask	= _en_mask,					\
+	.ramp_delay	= _ramp_delay,					\
+	.ramp_reg	= _r_reg,					\
+	.ramp_mask	= _r_mask,					\
+	.ramp_delay_table = _r_table,					\
+	.n_ramp_values	= _r_table_sz,					\
+	.enable_time	= 130, /* startup 20+-10 + ramp 30..100μs */	\
+}
+
+#define s2mpg10_regulator_desc_ldo_cmn(_num, _supply, _vrange, _ops,	\
+		_vsel_reg_sfx, _vsel_mask, _en_reg, _en_mask,		\
+		_ramp_delay, _r_reg, _r_mask, _r_table,	_r_table_sz,	\
+		_pc_reg, _pc_mask)					\
+	{								\
+		.desc = regulator_desc_s2mpg10_ldo_cmn(_num, _supply,	\
+				_ops,					\
+				_vrange, _vsel_reg_sfx, _vsel_mask,	\
+				_en_reg, _en_mask,			\
+				_ramp_delay, _r_reg, _r_mask, _r_table,	\
+				_r_table_sz),				\
+		.pctrlsel_reg = _pc_reg,				\
+		.pctrlsel_mask = _pc_mask,				\
+	}
+
+/* standard LDO via LxM_CTRL */
+#define s2mpg10_regulator_desc_ldo(_num, _supply, _vrange)		\
+	s2mpg10_regulator_desc_ldo_cmn(_num, _supply, _vrange,		\
+		s2mpg10_reg_ldo_ops, CTRL, GENMASK(5, 0),		\
+		L##_num##M_CTRL, BIT(7),				\
+		0, 0, 0, NULL, 0,					\
+		0, 0)							\
+
+/* standard LDO via LxM_CTRL but non-standard vsel mask */
+#define s2mpg10_regulator_desc_ldo_vmsk(_num, _supply, _vrange,		\
+					_vsel_mask)			\
+	s2mpg10_regulator_desc_ldo_cmn(_num, _supply, _vrange,		\
+		s2mpg10_reg_ldo_ops, CTRL, _vsel_mask,			\
+		L##_num##M_CTRL, BIT(7),				\
+		0, 0, 0, NULL, 0,					\
+		0, 0)
+
+/* standard LDO but possibly GPIO controlled */
+#define s2mpg10_regulator_desc_ldo_gpio(_num, _supply, _vrange,		\
+					_pc_reg, _pc_mask)		\
+	s2mpg10_regulator_desc_ldo_cmn(_num, _supply, _vrange,		\
+		s2mpg10_reg_ldo_ops, CTRL, GENMASK(5, 0),		\
+		L##_num##M_CTRL, GENMASK(7, 6),				\
+		0, 0, 0, NULL, 0,					\
+		S2MPG10_PMIC_##_pc_reg, _pc_mask)
+
+/* LDO with ramp support and possibly GPIO controlled */
+#define s2mpg10_regulator_desc_ldo_ramp(_num, _supply, _vrange,		\
+		_en_mask, _r_reg_sfx, _pc_reg, _pc_mask)		\
+	s2mpg10_regulator_desc_ldo_cmn(_num, _supply, _vrange,		\
+		s2mpg10_reg_ldo_ramp_ops, CTRL1, GENMASK(6, 0),		\
+		LDO_CTRL2, _en_mask,					\
+		6250, S2MPG10_PMIC_##_r_reg_sfx, GENMASK(1, 0),		\
+		s2mpg10_ldo_ramp_table,					\
+		ARRAY_SIZE(s2mpg10_ldo_ramp_table),			\
+		S2MPG10_PMIC_##_pc_reg, _pc_mask)
+
+#define s2mpg10_buck_to_ramp_mask(n) (GENMASK(1, 0) << (((n) % 4) * 2))
+
+/*
+ * The ramp_delay during enable is fixed (12.5mV/μs), while the ramp during
+ * DVS can be adjusted. Linux can adjust the ramp delay via DT, in which case
+ * the regulator core will modify the regulator's constraints and call our
+ * .set_ramp_delay() which updates the DVS ramp in ramp_reg.
+ * For enable, our .enable_time() unconditionally uses enable_ramp_rate
+ * (12.5mV/μs) while our ::set_voltage_time() takes the value in ramp_reg
+ * into account.
+ */
+#define regulator_desc_s2mpg10_buck(_num, _vrange, _r_reg) {		\
+	.name		= "buck"#_num"m",				\
+	.supply_name	= "vinb"#_num"m",				\
+	.of_match	= of_match_ptr("buck"#_num"m"),			\
+	.regulators_node = of_match_ptr("regulators"),			\
+	.of_parse_cb	= s2mpg10_of_parse_cb,				\
+	.id		= S2MPG10_BUCK##_num,				\
+	.ops		= &s2mpg10_reg_buck_ops[0],			\
+	.type		= REGULATOR_VOLTAGE,				\
+	.owner		= THIS_MODULE,					\
+	.linear_ranges	= _vrange,					\
+	.n_linear_ranges = ARRAY_SIZE(_vrange),				\
+	.n_voltages	= _vrange##_count,				\
+	.vsel_reg	= S2MPG10_PMIC_B##_num##M_OUT1,			\
+	.vsel_mask	= 0xff,						\
+	.enable_reg	= S2MPG10_PMIC_B##_num##M_CTRL,			\
+	.enable_mask	= GENMASK(7, 6),				\
+	.ramp_reg	= S2MPG10_PMIC_##_r_reg,			\
+	.ramp_mask	= s2mpg10_buck_to_ramp_mask(S2MPG10_BUCK##_num	\
+						    - S2MPG10_BUCK1),	\
+	.ramp_delay_table = s2mpg10_buck_ramp_table,			\
+	.n_ramp_values	= ARRAY_SIZE(s2mpg10_buck_ramp_table),		\
+	.enable_time	= 30, /* + V/enable_ramp_rate */		\
+}
+
+#define s2mpg10_regulator_desc_buck_cm(_num, _vrange, _r_reg)		\
+	.desc = regulator_desc_s2mpg10_buck(_num, _vrange, _r_reg),	\
+	.enable_ramp_rate = 12500
+
+#define s2mpg10_regulator_desc_buck_gpio(_num, _vrange, _r_reg,		\
+					 _pc_reg, _pc_mask)		\
+	{								\
+		s2mpg10_regulator_desc_buck_cm(_num, _vrange, _r_reg),	\
+		.pctrlsel_reg = S2MPG10_PMIC_##_pc_reg,			\
+		.pctrlsel_mask = _pc_mask,				\
+	}
+
+#define s2mpg10_regulator_desc_buck(_num, _vrange, _r_reg)		\
+	{								\
+		s2mpg10_regulator_desc_buck_cm(_num, _vrange, _r_reg),	\
+	}
+
+#define S2MPG10_VOLTAGE_RANGE(_prefix, _idx, _start_uV, _min_uV,	\
+			      _max_uV, _step_uV)			\
+static const struct linear_range _prefix##_vranges##_idx[] = {		\
+	REGULATOR_LINEAR_RANGE(_min_uV,					\
+			       ((_min_uV) - (_start_uV)) / (_step_uV),	\
+			       ((_max_uV) - (_start_uV)) / (_step_uV),	\
+			       _step_uV)				\
+};									\
+static const unsigned int _prefix##_vranges##_idx##_count =		\
+	((((_max_uV) - (_start_uV)) / (_step_uV)) + 1)
+
+/* voltage range for s2mpg10 LDO 1, 11, 12 */
+S2MPG10_VOLTAGE_RANGE(s2mpg10_ldo, 1, 300000, 700000, 1300000, STEP_12_5_MV);
+
+/* voltage range for s2mpg10 LDO 2, 4, 9, 14, 18, 19, 20, 23, 25, 29, 30, 31 */
+S2MPG10_VOLTAGE_RANGE(s2mpg10_ldo, 2, 700000, 1600000, 1950000, STEP_25_MV);
+
+/* voltage range for s2mpg10 LDO 3, 5, 6, 8, 16, 17, 24, 28 */
+S2MPG10_VOLTAGE_RANGE(s2mpg10_ldo, 3, 725000, 725000, 1300000, STEP_12_5_MV);
+
+/* voltage range for s2mpg10 LDO 7 */
+S2MPG10_VOLTAGE_RANGE(s2mpg10_ldo, 7, 300000, 450000, 1300000, STEP_12_5_MV);
+
+/* voltage range for s2mpg10 13, 15 */
+S2MPG10_VOLTAGE_RANGE(s2mpg10_ldo, 13, 300000, 450000, 950000, STEP_12_5_MV);
+
+/* voltage range for s2mpg10 LDO 10 */
+S2MPG10_VOLTAGE_RANGE(s2mpg10_ldo, 10, 1800000, 1800000, 3350000, STEP_25_MV);
+
+/* voltage range for s2mpg10 LDO 21, 22, 26, 27 */
+S2MPG10_VOLTAGE_RANGE(s2mpg10_ldo, 21, 1800000, 2500000, 3300000, STEP_25_MV);
+
+/* possible ramp values for s2mpg10 LDO 11, 12, 13, 15 */
+static const unsigned int s2mpg10_ldo_ramp_table[] = {
+	STEP_6_25_MV, STEP_12_5_MV
+};
+
+/* voltage range for s2mpg10 BUCK 1, 2, 3, 4, 5, 7, 8, 9, 10 */
+S2MPG10_VOLTAGE_RANGE(s2mpg10_buck, 1, 200000, 450000, 1300000, STEP_6_25_MV);
+
+/* voltage range for s2mpg10 BUCK 6 */
+S2MPG10_VOLTAGE_RANGE(s2mpg10_buck, 6, 200000, 450000, 1350000, STEP_6_25_MV);
+
+static const unsigned int s2mpg10_buck_ramp_table[] = {
+	STEP_6_25_MV, STEP_12_5_MV, STEP_25_MV
+};
+
+static const struct s2mpg10_regulator_desc s2mpg10_regulators_ldos[] = {
+	s2mpg10_regulator_desc_ldo_vmsk(1, "vinl3m", s2mpg10_ldo_vranges1,
+					GENMASK(6, 0)),
+	s2mpg10_regulator_desc_ldo(2, "vinl9m", s2mpg10_ldo_vranges2),
+	s2mpg10_regulator_desc_ldo_gpio(3, "vinl4m", s2mpg10_ldo_vranges3,
+					PCTRLSEL5, GENMASK(3, 0)),
+	s2mpg10_regulator_desc_ldo_gpio(4, "vinl9m", s2mpg10_ldo_vranges2,
+					PCTRLSEL5, GENMASK(7, 4)),
+	s2mpg10_regulator_desc_ldo_gpio(5, "vinl3m", s2mpg10_ldo_vranges3,
+					PCTRLSEL6, GENMASK(3, 0)),
+	s2mpg10_regulator_desc_ldo_gpio(6, "vinl7m", s2mpg10_ldo_vranges3,
+					PCTRLSEL6, GENMASK(7, 4)),
+	/*
+	 * Possibly GPIO controlled, but non-standard (greater) V-range and
+	 * enable reg & mask.
+	 */
+	s2mpg10_regulator_desc_ldo_cmn(7, "vinl3m", s2mpg10_ldo_vranges7,
+				       s2mpg10_reg_ldo_ops,
+				       CTRL, GENMASK(6, 0),
+				       LDO_CTRL1, GENMASK(4, 3),
+				       0, 0, 0, NULL, 0,
+				       S2MPG10_PMIC_PCTRLSEL7, GENMASK(3, 0)),
+	s2mpg10_regulator_desc_ldo_gpio(8, "vinl4m", s2mpg10_ldo_vranges3,
+					PCTRLSEL7, GENMASK(7, 4)),
+	s2mpg10_regulator_desc_ldo_gpio(9, "vinl10m", s2mpg10_ldo_vranges2,
+					PCTRLSEL8, GENMASK(3, 0)),
+	s2mpg10_regulator_desc_ldo_gpio(10, "vinl15m", s2mpg10_ldo_vranges10,
+					PCTRLSEL8, GENMASK(7, 4)),
+	s2mpg10_regulator_desc_ldo_ramp(11, "vinl7m", s2mpg10_ldo_vranges1,
+					GENMASK(1, 0), DVS_SYNC_CTRL3,
+					PCTRLSEL9, GENMASK(3, 0)),
+	s2mpg10_regulator_desc_ldo_ramp(12, "vinl8m", s2mpg10_ldo_vranges1,
+					GENMASK(3, 2), DVS_SYNC_CTRL4,
+					PCTRLSEL9, GENMASK(7, 4)),
+	s2mpg10_regulator_desc_ldo_ramp(13, "vinl1m", s2mpg10_ldo_vranges13,
+					GENMASK(5, 4), DVS_SYNC_CTRL5,
+					PCTRLSEL10, GENMASK(3, 0)),
+	s2mpg10_regulator_desc_ldo_gpio(14, "vinl10m", s2mpg10_ldo_vranges2,
+					PCTRLSEL10, GENMASK(7, 4)),
+	s2mpg10_regulator_desc_ldo_ramp(15, "vinl2m", s2mpg10_ldo_vranges13,
+					GENMASK(7, 6), DVS_SYNC_CTRL6,
+					PCTRLSEL11, GENMASK(3, 0)),
+	s2mpg10_regulator_desc_ldo_gpio(16, "vinl5m", s2mpg10_ldo_vranges3,
+					PCTRLSEL11, GENMASK(7, 4)),
+	s2mpg10_regulator_desc_ldo_gpio(17, "vinl6m", s2mpg10_ldo_vranges3,
+					PCTRLSEL12, GENMASK(3, 0)),
+	s2mpg10_regulator_desc_ldo_gpio(18, "vinl10m", s2mpg10_ldo_vranges2,
+					PCTRLSEL12, GENMASK(7, 4)),
+	s2mpg10_regulator_desc_ldo_gpio(19, "vinl10m", s2mpg10_ldo_vranges2,
+					PCTRLSEL13, GENMASK(3, 0)),
+	s2mpg10_regulator_desc_ldo_gpio(20, "vinl10m", s2mpg10_ldo_vranges2,
+					PCTRLSEL13, GENMASK(7, 4)),
+	s2mpg10_regulator_desc_ldo(21, "vinl14m", s2mpg10_ldo_vranges21),
+	s2mpg10_regulator_desc_ldo(22, "vinl15m", s2mpg10_ldo_vranges21),
+	s2mpg10_regulator_desc_ldo(23, "vinl11m", s2mpg10_ldo_vranges2),
+	s2mpg10_regulator_desc_ldo(24, "vinl7m", s2mpg10_ldo_vranges3),
+	s2mpg10_regulator_desc_ldo(25, "vinl10m", s2mpg10_ldo_vranges2),
+	s2mpg10_regulator_desc_ldo(26, "vinl15m", s2mpg10_ldo_vranges21),
+	s2mpg10_regulator_desc_ldo(27, "vinl15m", s2mpg10_ldo_vranges21),
+	s2mpg10_regulator_desc_ldo(28, "vinl7m", s2mpg10_ldo_vranges3),
+	s2mpg10_regulator_desc_ldo(29, "vinl12m", s2mpg10_ldo_vranges2),
+	s2mpg10_regulator_desc_ldo(30, "vinl13m", s2mpg10_ldo_vranges2),
+	s2mpg10_regulator_desc_ldo(31, "vinl11m", s2mpg10_ldo_vranges2)
+};
+
+static const struct s2mpg10_regulator_desc s2mpg10_regulators_bucks[] = {
+	s2mpg10_regulator_desc_buck_gpio(1, s2mpg10_buck_vranges1, DVS_RAMP1,
+					 PCTRLSEL1, GENMASK(3, 0)),
+	s2mpg10_regulator_desc_buck_gpio(2, s2mpg10_buck_vranges1, DVS_RAMP1,
+					 PCTRLSEL1, GENMASK(7, 4)),
+	s2mpg10_regulator_desc_buck_gpio(3, s2mpg10_buck_vranges1, DVS_RAMP1,
+					 PCTRLSEL2, GENMASK(3, 0)),
+	s2mpg10_regulator_desc_buck_gpio(4, s2mpg10_buck_vranges1, DVS_RAMP1,
+					 PCTRLSEL2, GENMASK(7, 4)),
+	s2mpg10_regulator_desc_buck_gpio(5, s2mpg10_buck_vranges1, DVS_RAMP2,
+					 PCTRLSEL3, GENMASK(3, 0)),
+	s2mpg10_regulator_desc_buck_gpio(6, s2mpg10_buck_vranges6, DVS_RAMP2,
+					 PCTRLSEL3, GENMASK(7, 4)),
+	s2mpg10_regulator_desc_buck_gpio(7, s2mpg10_buck_vranges1, DVS_RAMP2,
+					 PCTRLSEL4, GENMASK(3, 0)),
+	s2mpg10_regulator_desc_buck(8, s2mpg10_buck_vranges1, DVS_RAMP2),
+	s2mpg10_regulator_desc_buck(9, s2mpg10_buck_vranges1, DVS_RAMP3),
+	s2mpg10_regulator_desc_buck_gpio(10, s2mpg10_buck_vranges1, DVS_RAMP3,
+					 PCTRLSEL4, GENMASK(7, 4))
+};
+
 static const struct regulator_ops s2mps11_ldo_ops = {
 	.list_voltage		= regulator_list_voltage_linear,
 	.map_voltage		= regulator_map_voltage_linear,
@@ -1271,6 +1774,18 @@ static int s2mps11_handle_ext_control(struct s2mps11_info *s2mps11,
 		ret = s2mps14_pmic_enable_ext_control(s2mps11, rdev);
 		break;
 
+	case S2MPG10:
+		/*
+		 * If desc.enable_val is != 0, then external control was
+		 * requested. We can not test s2mpg10_desc::ext_control,
+		 * because 0 is a valid value.
+		 */
+		if (!rdev->desc->enable_val)
+			return 0;
+
+		ret = s2mpg10_enable_ext_control(s2mps11, rdev);
+		break;
+
 	default:
 		return 0;
 	}
@@ -1286,6 +1801,7 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 	unsigned int rdev_num;
 	int i, ret;
 	const struct regulator_desc *regulators;
+	const struct s2mpg10_regulator_desc *s2mpg10_regulators = NULL;
 
 	s2mps11 = devm_kzalloc(&pdev->dev, sizeof(struct s2mps11_info),
 				GFP_KERNEL);
@@ -1294,6 +1810,30 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 
 	s2mps11->dev_type = platform_get_device_id(pdev)->driver_data;
 	switch (s2mps11->dev_type) {
+	case S2MPG10:
+		/*
+		 * Add 1, because our core driver subtracted 1 via
+		 * devm_mfd_add_devices().
+		 */
+		switch (pdev->id + 1) {
+		case S2MPG10_REGULATOR_CELL_ID_BUCKS:
+			rdev_num = ARRAY_SIZE(s2mpg10_regulators_bucks);
+			s2mpg10_regulators = s2mpg10_regulators_bucks;
+			break;
+		case S2MPG10_REGULATOR_CELL_ID_LDOS:
+			rdev_num = ARRAY_SIZE(s2mpg10_regulators_ldos);
+			s2mpg10_regulators = s2mpg10_regulators_ldos;
+			break;
+		default:
+			return -EINVAL;
+		}
+		/*
+		 * Can not use ARRAY_SIZE() here, as it doesn't reflect the
+		 * highest regulator id.
+		 */
+		BUILD_BUG_ON((enum s2mpg10_regulators) S2MPS_REGULATOR_MAX <
+			     S2MPG10_REGULATOR_MAX);
+		break;
 	case S2MPS11X:
 		rdev_num = ARRAY_SIZE(s2mps11_regulators);
 		regulators = s2mps11_regulators;
@@ -1339,14 +1879,28 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 	config.driver_data = s2mps11;
 	for (i = 0; i < rdev_num; i++) {
 		struct regulator_dev *regulator;
+		const struct regulator_desc *rdesc = &regulators[i];
+
+		if (s2mpg10_regulators) {
+			struct s2mpg10_regulator_desc *s2mpg10_desc;
+
+
+			s2mpg10_desc = devm_kmemdup(&pdev->dev,
+						    &s2mpg10_regulators[i],
+						    sizeof(*s2mpg10_desc),
+						    GFP_KERNEL);
+			if (!s2mpg10_desc)
+				return -ENOMEM;
+
+			rdesc = &s2mpg10_desc->desc;
+		}
 
 		regulator = devm_regulator_register(&pdev->dev,
-						&regulators[i], &config);
+						    rdesc, &config);
 		if (IS_ERR(regulator))
 			return dev_err_probe(&pdev->dev, PTR_ERR(regulator),
 					     "regulator init failed for %d/%s\n",
-					     regulators[i].id,
-					     regulators[i].name);
+					     rdesc->id, rdesc->name);
 
 		ret = s2mps11_handle_ext_control(s2mps11, regulator);
 		if (ret < 0)
@@ -1357,6 +1911,7 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 }
 
 static const struct platform_device_id s2mps11_pmic_id[] = {
+	{ "s2mpg10-regulator", S2MPG10},
 	{ "s2mps11-regulator", S2MPS11X},
 	{ "s2mps13-regulator", S2MPS13X},
 	{ "s2mps14-regulator", S2MPS14X},
diff --git a/include/linux/mfd/samsung/s2mpg10.h b/include/linux/mfd/samsung/s2mpg10.h
index 3e8bc65078472518c5e77f8bd199ee403eda18ea..f2e2c7923ad8116816ff5cae3b0c0eb98af2e42b 100644
--- a/include/linux/mfd/samsung/s2mpg10.h
+++ b/include/linux/mfd/samsung/s2mpg10.h
@@ -295,6 +295,9 @@ enum s2mpg10_pmic_reg {
 	S2MPG10_PMIC_LDO_SENSE4,
 };
 
+/* rail controlled externally, based on PCTRLSELx */
+#define S2MPG10_PMIC_CTRL_ENABLE_EXT BIT(0)
+
 /* Meter registers (type 0xa00) */
 enum s2mpg10_meter_reg {
 	S2MPG10_METER_CTRL1,

-- 
2.50.0.rc0.604.gd4ff7b7c86-goog


