Return-Path: <linux-gpio+bounces-21005-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CA991ACE15F
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 17:28:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79B6C175BF7
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 15:28:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 57E2A1F3BAC;
	Wed,  4 Jun 2025 15:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QYXbmF/V"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936381DE4E3
	for <linux-gpio@vger.kernel.org>; Wed,  4 Jun 2025 15:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050762; cv=none; b=pD5OfGPWhRbIWQcrSSJzRTHuDo1ihpPjcF78o1+FogIainCRuPXEAzv1hHWD8Fnujqa5erMDuSve8vhDgxNxzCa0lKDKW7WDupj7yNk86IN/MBvloaG8lZYXenqRMqG3LoK12J+EiBJ8oz+mrRu5SmFwX2+pfA6CDgoTpI4J1/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050762; c=relaxed/simple;
	bh=S58osScf9m+EZHP6ZPFv6S9jPWquICjN+2mKXJ7uBec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lNHT7KLmJnjSE0jN2OhTVcafQ0kmYOc1rMPGIFuNm9slSSnUfH2YpgEAuvvjT7MJwdN0hdY8xafaZYCnH1STSeRxzuGsM5+RpBKaPiy3okZ3Z+rSbCJvB9F3vDBugypPZJqvpHY7np6IryABWyyyNhFpEcuUGpNP1LRc298cWQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QYXbmF/V; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60462000956so12098469a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Jun 2025 08:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749050755; x=1749655555; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7B0+Nwu/HOkqYpijxQs4Jzs+csQzmp8Gn5FLuXG11/I=;
        b=QYXbmF/VacG/6FgIsHsRfmjYL1ZGXi+lZU1KrZLBK4FC1kjZkRhG22WV+qeoytDOo7
         rIgy1QMdypbG5+pj2dj0wODYQPuQXkS/d8phJzzMTjV9cDIpn62JcU8qChRhyeKWm2xy
         e8zx0GXcRWi96FtrOiipwru07Iu7WrnpHUuAy/HaLRGHlnbzVzFFChyqvP5Irx+7kFGM
         nJBkTXupD973Oo30U+7JgnuupVZveSirabPK+3bjBuQPoCH+fZPnZahqVBZ59aR6phbA
         dW4C0TgwvaZ7Lq1gsHlWfAfYw1FeGVJnmIwWFIS8JYOGaSAQaHyFtkl0k4YGRZLltifW
         Dv3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050755; x=1749655555;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7B0+Nwu/HOkqYpijxQs4Jzs+csQzmp8Gn5FLuXG11/I=;
        b=LKtvu0bZUGoZkZtC53XvMQypStGLyiboocqOpSqsNBKXYpXn7mXXWN7TCRD7+YsG2F
         HgBmrN3ydjOKpNjP7UpUuXr/dtKHAKi49T+7cr1djt303LJIUwwidajXGtXBTxzeKCOo
         LRrhFc1wYOFJRBiUVRMW7ZAawQu42/QpMXNk9vQ4KdlG4itqy7C3zV0m/KF35IqX1Pvf
         YqO76Md7M6ntWc3dKfU72ynYXdLs41dSImgbInTt5dAj6GuQCn5VJUXozb63yPCXruYI
         ZZCafsL0d+JGuCtpS8vu03KROEP2N9srqcvg3KcuqBX5GUC4P2Jmk6fITUTyFxgDB8Ow
         KmYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXq9Qj3kVJhifVoOUlmmKfg4PGG2+QHmLJ4Jpg8BTws21AO/g244uTgs0y3TLYP+SVs2lotCuJ+4+SY@vger.kernel.org
X-Gm-Message-State: AOJu0YyzKV6jBxUJrsJVijFM05T4tSKdvtVZQXEcrWP/GCebKBciUnqE
	yb219ryDauOpNN3DxH3oIIlIcCljdEIPyO1Ssb4s/ENXaB/iMcZL2u9e6KmvRdNm8aw=
X-Gm-Gg: ASbGncuGRgyC9UE3DFeh71EEfalE+1iWBsKv+OT6UTAGzQuq1RS2VJJl8ctPXkx/fae
	gVTRT8zu2w3pVEsjYo/NY6HT95E7y/+Y2SzsqcdXVHibHuF4begeHXCsc/TODPwlyvoIomaFk4O
	P2gY+wdIP5iZsrUeyhc+/JKOL9BRzI4v62ZN/BEDTyOjHI1LRdUX7BzsfhHVDVdre9v0GRScZha
	YO0nX9gGJyBvX7S2dZI21lyLlerUGoLabiYlppmjTU4BM3T8/lPPdgJLKimrQSoJJq9PQMdqRT+
	aESgGjPHLOHO1P7e9KNJ2N4plLyuura6iotLu2jP31FcBEvvz73+AVGtTfMg9BKbtwUa23JF78T
	WE+hBQxUpBrDiuraFjAmiuUx0taAqIc8PIN5AGK0HLFvadqqZDMab8D9/
X-Google-Smtp-Source: AGHT+IFnvxqBiHW9G1Ii6JI98RPKz5RCaegMjvcGQbieSyHuvx0T2tzr+X2hIiYnkirxUQ7UEIZKZA==
X-Received: by 2002:a05:6402:280d:b0:607:116e:108d with SMTP id 4fb4d7f45d1cf-607116e12b9mr912806a12.21.1749050754729;
        Wed, 04 Jun 2025 08:25:54 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606ed984f63sm1051640a12.58.2025.06.04.08.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:25:54 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 04 Jun 2025 16:25:55 +0100
Subject: [PATCH 16/17] regulator: s2mps11: add S2MPG11 regulator
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250604-s2mpg1x-regulators-v1-16-6038740f49ae@linaro.org>
References: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
In-Reply-To: <20250604-s2mpg1x-regulators-v1-0-6038740f49ae@linaro.org>
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
buck converters, various LDOs, and power meters. It typically
complements an S2MPG10 PMIC in a main/sub configuration as the
sub-PMIC.

It has 12 buck, 1 buck-boost, and 15 LDO rails. Several of these can
either be controlled via software or via external signals, e.g. input
pins connected to a main processor's GPIO pins.

This commit implements support for these rails.

The rails are instantiated as separate driver instances for bucks and
LDOs, because S2MPG11 is typically used with an S2MPG10 main-PMIC where
some bucks of one typically supply at least some of the LDOs of the
other.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/s2mps11.c | 301 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 300 insertions(+), 1 deletion(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 74f09b949ca7d6f1d61decd086480996fd444dbd..3b5f6f2f2b11be81f27bc39d5d48005da4afeace 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -18,6 +18,7 @@
 #include <linux/regulator/of_regulator.h>
 #include <linux/mfd/samsung/core.h>
 #include <linux/mfd/samsung/s2mpg10.h>
+#include <linux/mfd/samsung/s2mpg11.h>
 #include <linux/mfd/samsung/s2mps11.h>
 #include <linux/mfd/samsung/s2mps13.h>
 #include <linux/mfd/samsung/s2mps14.h>
@@ -413,7 +414,7 @@ static int s2mpg10_of_parse_cb(struct device_node *np,
 	struct s2mpg10_regulator_desc *s2mpg10_desc = to_s2mpg10_regulator_desc(desc);
 	u32 ext_control;
 
-	if (s2mps11->dev_type != S2MPG10)
+	if (s2mps11->dev_type != S2MPG10 && s2mps11->dev_type != S2MPG11)
 		return 0;
 
 	if (of_property_read_u32(np, "samsung,ext-control", &ext_control))
@@ -439,6 +440,27 @@ static int s2mpg10_of_parse_cb(struct device_node *np,
 		}
 		break;
 
+	case S2MPG11:
+		switch (desc->id) {
+		case S2MPG11_BUCK1 ... S2MPG11_BUCK3:
+		case S2MPG11_BUCK5:
+		case S2MPG11_BUCK8:
+		case S2MPG11_BUCK9:
+		case S2MPG11_BUCKD:
+		case S2MPG11_BUCKA:
+		case S2MPG10_LDO1:
+		case S2MPG10_LDO2:
+		case S2MPG10_LDO8:
+		case S2MPG10_LDO13:
+			if (ext_control > S2MPG11_PCTRLSEL_LDO13S_EN)
+				return -EINVAL;
+			break;
+
+		default:
+			return -EINVAL;
+		}
+		break;
+
 	default:
 		return -EINVAL;
 	}
@@ -476,6 +498,7 @@ static int s2mpg10_enable_ext_control(struct s2mps11_info *s2mps11,
 
 	switch (s2mps11->dev_type) {
 	case S2MPG10:
+	case S2MPG11:
 		s2mpg10_desc = to_s2mpg10_regulator_desc(rdev->desc);
 		break;
 
@@ -603,6 +626,21 @@ static int s2mpg10_regulator_buck_set_voltage_time(struct regulator_dev *rdev,
 						       rdev->desc->ramp_mask);
 }
 
+static int s2mpg11_regulator_buck_set_voltage_time(struct regulator_dev *rdev,
+						   int old_uV, int new_uV)
+{
+	unsigned int ramp_mask;
+
+	ramp_mask = rdev->desc->ramp_mask;
+	if (old_uV > new_uV)
+		/* The downwards mask is at a different position. */
+		ramp_mask >>= 2;
+
+	return s2mpg1x_regulator_buck_set_voltage_time(rdev, old_uV, new_uV,
+						       rdev->desc->ramp_reg,
+						       ramp_mask);
+}
+
 /*
  * We assign both, ::set_voltage_time() and ::set_voltage_time_sel(), because
  * only if the latter is != NULL, the regulator core will call neither during
@@ -919,6 +957,249 @@ static const struct s2mpg10_regulator_desc s2mpg10_regulators_bucks[] = {
 					 PCTRLSEL4, GENMASK(7, 4))
 };
 
+static const struct regulator_ops s2mpg11_reg_buck_ops[] = {
+	{
+		.list_voltage		= regulator_list_voltage_linear_range,
+		.map_voltage		= regulator_map_voltage_linear_range,
+		.is_enabled		= regulator_is_enabled_regmap,
+		.enable			= regulator_enable_regmap,
+		.disable		= regulator_disable_regmap,
+		.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+		.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+		.set_voltage_time	= s2mpg11_regulator_buck_set_voltage_time,
+		.set_voltage_time_sel	= regulator_set_voltage_time_sel,
+		.enable_time		= s2mpg10_regulator_buck_enable_time,
+		.set_ramp_delay		= regulator_set_ramp_delay_regmap,
+	}, {
+		.list_voltage		= regulator_list_voltage_linear_range,
+		.map_voltage		= regulator_map_voltage_linear_range,
+		.get_voltage_sel	= regulator_get_voltage_sel_regmap,
+		.set_voltage_sel	= regulator_set_voltage_sel_regmap,
+		.set_voltage_time	= s2mpg11_regulator_buck_set_voltage_time,
+		.set_voltage_time_sel	= regulator_set_voltage_time_sel,
+		.enable_time		= s2mpg10_regulator_buck_enable_time,
+		.set_ramp_delay		= regulator_set_ramp_delay_regmap,
+	}
+};
+
+#define s2mpg11_regulator_desc_ldo_cmn(_num, _supply, _vrange,		\
+		_vsel_reg_sfx, _vsel_mask, _en_reg, _en_mask,		\
+		_ramp_delay, _r_reg, _r_mask, _r_table, _r_table_sz,	\
+		_pc_reg, _pc_mask)					\
+	{								\
+		.desc = regulator_desc_s2mpg1x_ldo_cmn(#_num"s",	\
+				S2MPG11_LDO##_num, _supply,		\
+				s2mpg10_reg_ldo_ops,			\
+				_vrange,				\
+				S2MPG11_PMIC_L##_num##S_##_vsel_reg_sfx, \
+				_vsel_mask,				\
+				S2MPG11_PMIC_##_en_reg, _en_mask,	\
+				_ramp_delay, _r_reg, _r_mask, _r_table,	\
+				_r_table_sz),				\
+		.pctrlsel_reg = _pc_reg,				\
+		.pctrlsel_mask = _pc_mask,				\
+	}
+
+
+/* standard LDO via LxM_CTRL */
+#define s2mpg11_regulator_desc_ldo(_num, _supply, _vrange)		\
+	s2mpg11_regulator_desc_ldo_cmn(_num, _supply, _vrange,		\
+		CTRL, GENMASK(5, 0),					\
+		L##_num##S_CTRL, BIT(7),				\
+		0, 0, 0, NULL, 0,					\
+		0, 0)
+
+/* standard LDO but possibly GPIO controlled */
+#define s2mpg11_regulator_desc_ldo_gpio(_num, _supply, _vrange,		\
+					_pc_reg, _pc_mask)		\
+	s2mpg11_regulator_desc_ldo_cmn(_num, _supply, _vrange,		\
+		CTRL, GENMASK(5, 0),					\
+		L##_num##S_CTRL, GENMASK(7, 6),				\
+		0, 0, 0, NULL, 0,					\
+		S2MPG11_PMIC_##_pc_reg, _pc_mask)
+
+/* LDO with ramp support and possibly GPIO controlled */
+#define s2mpg11_regulator_desc_ldo_ramp(_num, _supply, _vrange,		\
+		_en_mask, _r_reg_sfx, _pc_reg, _pc_mask)		\
+	s2mpg11_regulator_desc_ldo_cmn(_num, _supply, _vrange,		\
+		CTRL1, GENMASK(6, 0),					\
+		LDO_CTRL1, _en_mask,					\
+		6250, S2MPG11_PMIC_##_r_reg_sfx, GENMASK(1, 0),		\
+		s2mpg10_ldo_ramp_table,					\
+		ARRAY_SIZE(s2mpg10_ldo_ramp_table),			\
+		S2MPG11_PMIC_##_pc_reg, _pc_mask)
+
+#define s2mpg11_buck_to_ramp_mask(n) (GENMASK(3, 2) << (((n) % 2) * 4))
+
+#define regulator_desc_s2mpg11_buckx(_name, _id, _supply, _vrange,	\
+		_vsel_reg, _en_reg, _en_mask, _r_reg)			\
+	regulator_desc_s2mpg1x_buck_cmn(_name, _id, _supply,		\
+		s2mpg11_reg_buck_ops,  _vrange,				\
+		S2MPG11_PMIC_##_vsel_reg, GENMASK(7, 0),		\
+		S2MPG11_PMIC_##_en_reg, _en_mask,			\
+		S2MPG11_PMIC_##_r_reg,					\
+		s2mpg11_buck_to_ramp_mask(_id - S2MPG11_BUCK1),		\
+		s2mpg10_buck_ramp_table,				\
+		ARRAY_SIZE(s2mpg10_buck_ramp_table), 30)
+
+#define s2mpg11_regulator_desc_buck_xm(_num, _vrange, _vsel_reg_sfx,	\
+				       _en_mask, _r_reg, _en_rrate)	\
+	.desc = regulator_desc_s2mpg11_buckx(#_num"s",			\
+				S2MPG11_BUCK##_num, "vinb"#_num"s",	\
+				_vrange,				\
+				B##_num##S_##_vsel_reg_sfx,		\
+				B##_num##S_CTRL, _en_mask,		\
+				_r_reg),				\
+	.enable_ramp_rate = _en_rrate
+
+#define s2mpg11_regulator_desc_buck_cm(_num, _vrange, _vsel_reg_sfx,	\
+				       _en_mask, _r_reg)		\
+	{								\
+		s2mpg11_regulator_desc_buck_xm(_num, _vrange,		\
+			_vsel_reg_sfx, _en_mask, _r_reg, 12500),	\
+	}
+
+#define s2mpg11_regulator_desc_buckn_cm_gpio(_num, _vrange,		\
+		_vsel_reg_sfx, _en_mask, _r_reg, _pc_reg, _pc_mask)	\
+	{								\
+		s2mpg11_regulator_desc_buck_xm(_num, _vrange,		\
+			_vsel_reg_sfx, _en_mask, _r_reg, 12500),	\
+		.pctrlsel_reg = S2MPG11_PMIC_##_pc_reg,			\
+		.pctrlsel_mask = _pc_mask,				\
+	}
+
+#define s2mpg11_regulator_desc_buck_vm(_num, _vrange, _vsel_reg_sfx,	\
+				       _en_mask, _r_reg)		\
+	{								\
+		s2mpg11_regulator_desc_buck_xm(_num, _vrange,		\
+			_vsel_reg_sfx, _en_mask, _r_reg, 25000),	\
+	}
+
+#define s2mpg11_regulator_desc_bucka(_num, _num_lower, _r_reg,		\
+				     _pc_reg, _pc_mask)			\
+	{								\
+		.desc = regulator_desc_s2mpg11_buckx(#_num_lower,	\
+				S2MPG11_BUCK##_num, "vinb"#_num_lower,	\
+				s2mpg11_buck_vranges##_num_lower,	\
+				BUCK##_num##_OUT,			\
+				BUCK##_num##_CTRL, GENMASK(7, 6),	\
+				_r_reg),				\
+		.enable_ramp_rate = 25000,				\
+		.pctrlsel_reg = S2MPG11_PMIC_##_pc_reg,			\
+		.pctrlsel_mask = _pc_mask,				\
+	}
+
+#define s2mpg11_regulator_desc_buckboost()				\
+	{								\
+		.desc = regulator_desc_s2mpg1x_buck_cmn("boost",	\
+				S2MPG11_BUCKBOOST, "vinbb",		\
+				s2mpg10_reg_ldo_ops,			\
+				s2mpg11_buck_vrangesboost,		\
+				S2MPG11_PMIC_BB_OUT1, GENMASK(6, 0),	\
+				S2MPG11_PMIC_BB_CTRL, BIT(7),		\
+				0, 0, NULL, 0, 35),			\
+		.enable_ramp_rate = 17500,				\
+	}
+
+/* voltage range for s2mpg11 LDO 1, 2 */
+S2MPG10_VOLTAGE_RANGE(s2mpg11_ldo, 1, 300000, 450000, 950000, STEP_12_5_MV);
+
+/* voltage range for s2mpg11 LDO 3, 7, 10, 11, 12, 14, 15 */
+S2MPG10_VOLTAGE_RANGE(s2mpg11_ldo, 3, 700000, 1600000, 1950000, STEP_25_MV);
+
+/* voltage range for s2mpg11 LDO 4, 6 */
+S2MPG10_VOLTAGE_RANGE(s2mpg11_ldo, 4, 1800000, 2500000, 3300000, STEP_25_MV);
+
+/* voltage range for s2mpg11 LDO 5 */
+S2MPG10_VOLTAGE_RANGE(s2mpg11_ldo, 5, 1600000, 1600000, 1950000, STEP_12_5_MV);
+
+/* voltage range for s2mpg11 LDO 8 */
+S2MPG10_VOLTAGE_RANGE(s2mpg11_ldo, 8, 979600, 1130400, 1281200, 5800);
+
+/* voltage range for s2mpg11 LDO 9 */
+S2MPG10_VOLTAGE_RANGE(s2mpg11_ldo, 9, 725000, 725000, 1300000, STEP_12_5_MV);
+
+/* voltage range for s2mpg11 LDO 13 */
+S2MPG10_VOLTAGE_RANGE(s2mpg11_ldo, 13, 1800000, 1800000, 3350000, STEP_25_MV);
+
+/* voltage range for s2mpg11 BUCK 1, 2, 3, 4, 8, 9, 10 */
+S2MPG10_VOLTAGE_RANGE(s2mpg11_buck, 1, 200000, 450000, 1300000, STEP_6_25_MV);
+
+/* voltage range for s2mpg11 BUCK 5 */
+S2MPG10_VOLTAGE_RANGE(s2mpg11_buck, 5, 200000, 400000, 1300000, STEP_6_25_MV);
+
+/* voltage range for s2mpg11 BUCK 6 */
+S2MPG10_VOLTAGE_RANGE(s2mpg11_buck, 6, 200000, 1000000, 1500000, STEP_6_25_MV);
+
+/* voltage range for s2mpg11 BUCK 7 */
+S2MPG10_VOLTAGE_RANGE(s2mpg11_buck, 7, 600000, 1500000, 2200000, STEP_12_5_MV);
+
+/* voltage range for s2mpg11 BUCK D */
+S2MPG10_VOLTAGE_RANGE(s2mpg11_buck, d, 600000, 2400000, 3300000, STEP_12_5_MV);
+
+/* voltage range for s2mpg11 BUCK A */
+S2MPG10_VOLTAGE_RANGE(s2mpg11_buck, a, 600000, 1700000, 2100000, STEP_12_5_MV);
+
+/* voltage range for s2mpg11 BUCK BOOST */
+S2MPG10_VOLTAGE_RANGE(s2mpg11_buck, boost,
+		      2600000, 3000000, 3600000, STEP_12_5_MV);
+
+static const struct s2mpg10_regulator_desc s2mpg11_regulators_ldos[] = {
+	s2mpg11_regulator_desc_ldo_ramp(1, "vinl1s", s2mpg11_ldo_vranges1,
+					GENMASK(5, 4), DVS_SYNC_CTRL1,
+					PCTRLSEL5, GENMASK(3, 0)),
+	s2mpg11_regulator_desc_ldo_ramp(2, "vinl1s", s2mpg11_ldo_vranges1,
+					GENMASK(7, 6), DVS_SYNC_CTRL2,
+					PCTRLSEL5, GENMASK(7, 4)),
+	s2mpg11_regulator_desc_ldo(3, "vinl3s", s2mpg11_ldo_vranges3),
+	s2mpg11_regulator_desc_ldo(4, "vinl5s", s2mpg11_ldo_vranges4),
+	s2mpg11_regulator_desc_ldo(5, "vinl3s", s2mpg11_ldo_vranges5),
+	s2mpg11_regulator_desc_ldo(6, "vinl5s", s2mpg11_ldo_vranges4),
+	s2mpg11_regulator_desc_ldo(7, "vinl3s", s2mpg11_ldo_vranges3),
+	s2mpg11_regulator_desc_ldo_gpio(8, "vinl2s", s2mpg11_ldo_vranges8,
+					PCTRLSEL6, GENMASK(3, 0)),
+	s2mpg11_regulator_desc_ldo(9, "vinl2s", s2mpg11_ldo_vranges9),
+	s2mpg11_regulator_desc_ldo(10, "vinl4s", s2mpg11_ldo_vranges3),
+	s2mpg11_regulator_desc_ldo(11, "vinl4s", s2mpg11_ldo_vranges3),
+	s2mpg11_regulator_desc_ldo(12, "vinl4s", s2mpg11_ldo_vranges3),
+	s2mpg11_regulator_desc_ldo_gpio(13, "vinl6s", s2mpg11_ldo_vranges13,
+					PCTRLSEL6, GENMASK(7, 4)),
+	s2mpg11_regulator_desc_ldo(14, "vinl4s", s2mpg11_ldo_vranges3),
+	s2mpg11_regulator_desc_ldo(15, "vinl3s", s2mpg11_ldo_vranges3),
+};
+
+static const struct s2mpg10_regulator_desc s2mpg11_regulators_bucks[] = {
+	s2mpg11_regulator_desc_buckboost(),
+	s2mpg11_regulator_desc_buckn_cm_gpio(1, s2mpg11_buck_vranges1,
+					     OUT1, GENMASK(7, 6), DVS_RAMP1,
+					     PCTRLSEL1, GENMASK(3, 0)),
+	s2mpg11_regulator_desc_buckn_cm_gpio(2, s2mpg11_buck_vranges1,
+					     OUT1, GENMASK(7, 6), DVS_RAMP1,
+					     PCTRLSEL1, GENMASK(7, 4)),
+	s2mpg11_regulator_desc_buckn_cm_gpio(3, s2mpg11_buck_vranges1,
+					     OUT1, GENMASK(7, 6), DVS_RAMP2,
+					     PCTRLSEL2, GENMASK(3, 0)),
+	s2mpg11_regulator_desc_buck_cm(4, s2mpg11_buck_vranges1,
+				       OUT, BIT(7), DVS_RAMP2),
+	s2mpg11_regulator_desc_buckn_cm_gpio(5, s2mpg11_buck_vranges5,
+					     OUT, GENMASK(7, 6), DVS_RAMP3,
+					     PCTRLSEL2, GENMASK(7, 4)),
+	s2mpg11_regulator_desc_buck_cm(6, s2mpg11_buck_vranges6,
+				       OUT1, BIT(7), DVS_RAMP3),
+	s2mpg11_regulator_desc_buck_vm(7, s2mpg11_buck_vranges7,
+				       OUT1, BIT(7), DVS_RAMP4),
+	s2mpg11_regulator_desc_buckn_cm_gpio(8, s2mpg11_buck_vranges1,
+					     OUT1, GENMASK(7, 6), DVS_RAMP4,
+					     PCTRLSEL3, GENMASK(3, 0)),
+	s2mpg11_regulator_desc_buckn_cm_gpio(9, s2mpg11_buck_vranges1,
+					     OUT1, GENMASK(7, 6), DVS_RAMP5,
+					     PCTRLSEL3, GENMASK(7, 4)),
+	s2mpg11_regulator_desc_buck_cm(10, s2mpg11_buck_vranges1,
+				       OUT, BIT(7), DVS_RAMP5),
+	s2mpg11_regulator_desc_bucka(D, d, DVS_RAMP6, PCTRLSEL4, GENMASK(3, 0)),
+	s2mpg11_regulator_desc_bucka(A, a, DVS_RAMP6, PCTRLSEL4, GENMASK(7, 4)),
+};
+
 static const struct regulator_ops s2mps11_ldo_ops = {
 	.list_voltage		= regulator_list_voltage_linear,
 	.map_voltage		= regulator_map_voltage_linear,
@@ -1803,6 +2084,7 @@ static int s2mps11_handle_ext_control(struct s2mps11_info *s2mps11,
 		break;
 
 	case S2MPG10:
+	case S2MPG11:
 		/*
 		 * If desc.enable_val is != 0, then external control was
 		 * requested. We can not test s2mpg10_desc::ext_control,
@@ -1862,6 +2144,22 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 		BUILD_BUG_ON((enum s2mpg10_regulators) S2MPS_REGULATOR_MAX <
 			     S2MPG10_REGULATOR_MAX);
 		break;
+	case S2MPG11:
+		switch (pdev->id + 1) {
+		case S2MPG10_REGULATOR_CELL_ID_BUCKS:
+			rdev_num = ARRAY_SIZE(s2mpg11_regulators_bucks);
+			s2mpg10_regulators = s2mpg11_regulators_bucks;
+			break;
+		case S2MPG10_REGULATOR_CELL_ID_LDOS:
+			rdev_num = ARRAY_SIZE(s2mpg11_regulators_ldos);
+			s2mpg10_regulators = s2mpg11_regulators_ldos;
+			break;
+		default:
+			return -EINVAL;
+		}
+		BUILD_BUG_ON((enum s2mpg11_regulators) S2MPS_REGULATOR_MAX <
+			     S2MPG11_REGULATOR_MAX);
+		break;
 	case S2MPS11X:
 		rdev_num = ARRAY_SIZE(s2mps11_regulators);
 		regulators = s2mps11_regulators;
@@ -1940,6 +2238,7 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 
 static const struct platform_device_id s2mps11_pmic_id[] = {
 	{ "s2mpg10-regulator", S2MPG10},
+	{ "s2mpg11-regulator", S2MPG11},
 	{ "s2mps11-regulator", S2MPS11X},
 	{ "s2mps13-regulator", S2MPS13X},
 	{ "s2mps14-regulator", S2MPS14X},

-- 
2.49.0.1204.g71687c7c1d-goog


