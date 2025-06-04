Return-Path: <linux-gpio+bounces-21003-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF1AACE157
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 17:28:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5C423A5984
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 15:27:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E50801DDA34;
	Wed,  4 Jun 2025 15:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SNm6Nlnz"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B39E1DDC08
	for <linux-gpio@vger.kernel.org>; Wed,  4 Jun 2025 15:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050760; cv=none; b=WCQ1zdMXjje29lRclR4ZUZARCN84CFYuEhWAuSzs+/mp40UodT9oxBLxa5GTDklK7zPEhpv/RGoGL87mrVk/riu0o1EInwd2hfI5OG867pxeNy8iIJGTrazpfGcNDERUwqi5zBCO1u3tAxm2+hhTh/k/Ypv2DDJEqMixqoXonk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050760; c=relaxed/simple;
	bh=A/GHEuztfmgd1/p5cSNEjJ3+xiiEy5QUpmdgAvLhvKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k2oXavDcOvZQfxrUd6t9FreXdmc5KuI4rCstfoPkffMgtGj1+QQz5utiC2+BS6KkMNoaFkCz9e21pHNnzluD+Fa9gStfn35jBUp4Vxk1q23IBPP6i/vtHbPH/E3ROLS0yRMpS4TET8x3OHl7Q/I4Cw3iJk9kU1l871hs2QXE6uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SNm6Nlnz; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60461fc88d7so14038476a12.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Jun 2025 08:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749050754; x=1749655554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vn2J3nnAxbZSYZ0Pl0MdJxpTvr8+PeUSA3EZa6924LA=;
        b=SNm6NlnzXNYUNidt32Y7GsuhNDSoLhlaTthVWBGNAAJiNY4b+ZLm45lEUGzcoYXv8z
         vBsQKoZ1SB6oJ8mKoYC1vBpEj4DfBcpn62ltdHBvVwk5CAVmcV5RWoA4vDCLUtRz6rtY
         nXT5ZemHlcSsoYl09iU92xrozxJKs2F6EZzASxOhUTOsN4nreyDekTrRTZDzN/w7/bLB
         0v/RY3uzHB4Oira2qJ4AR7bkQbqjhsEjpsPaYq0gKXA/ht80YAhc8LGm1bAI4wev2RRM
         7e6O5ELVT6itTJ2dPubcNb2ShC4fIXzeADTMBp4dZLz9GGmzxX7FuMVJ5DRx0J3yCWPz
         MFHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050754; x=1749655554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vn2J3nnAxbZSYZ0Pl0MdJxpTvr8+PeUSA3EZa6924LA=;
        b=aEFYYjf/npeQuyO18x8o309SsO0oMyLgzi/APbfa+Ni93ulWmcVzhIIcrjjBlfARoW
         toJ5kfZwGyxvCUcRi7pqms2VQ7X1WP2yDVmpm+5mQ/w4NmpDeQN28HsQYrE48tjpAzPK
         sN52ND7Egpi0pFT9SeZORZ3/MV6xyy54DpwFH2SMKpsp8mYXrTm2q+MsEJLHonUcjPNy
         G79uFj3DjauVVMokKdT8+C6nKJmt1ULZG8OppcrmXFBVP4s42rdGqQlNc5T6LBarGDGg
         puI774KwvNeavSqSIBDcHH33rpa4lqq9xQFuHo6kz8/6heZsZ4JwzRB8pjx4X5utgM8P
         LrCw==
X-Forwarded-Encrypted: i=1; AJvYcCXQScXf0xwlaMZtK0OHu7xM5p5Kn3QHjr3/a7jYvxzim/t1WNqoA91xvnxRMl+AWXfp4nhpBgDXwnPt@vger.kernel.org
X-Gm-Message-State: AOJu0YzoGLRN5PbMHW4Gv803OW2tv6A0mXeZmsnFMRPUUzc0/QMZzGCO
	KNJ/GXIfXbFRDgG525WRx1ci0G22T1r5Sv/dv63WTMaVzaVrCCQkdueoI87VrovXMq4=
X-Gm-Gg: ASbGncuH5LwBimHWkzWwjXl9LCpJ0lFk9/zaDKkmw/H3g1Q8EtEBLOY4PKJz/aTkro1
	4wdYYnNIYuA+oAfOk4NSSIM3Z667x4rE9gP0yAjR/q+ple/cO7wGHE2UqNV6P8gMjsV2+ZurJa2
	lclclOkd7Ei9UAtDWkEZuAnj33Q01j5gtivhqYJwrQI0ftUaKqE41QOUJn6Oui4GTfnBLlVW2Fs
	9HKEWdnB9XNRhm9bHybuFjYxVAwBx0e9CWXadHttmI4SWGGXPaPBvjzMuy9xkW5aFafw2piLhFw
	ReY1irqRXRYYFYzLHujNJ0LtJjd+rQEdmVARzTE8wyKWEu1/rnyxhRXaa9p3gQ6d9oLLxfPUa+H
	dUq0hlxADyEyzCDW+ByI7u0JOaQVV0Zy8TaE=
X-Google-Smtp-Source: AGHT+IGETXau/Hs1twpCO4F6DmcKfpU3VQ25hwN+cddBXzSz725FYngJL1uteD+Puz581oTrnBSHGg==
X-Received: by 2002:a05:6402:5c9:b0:5fc:9979:78f7 with SMTP id 4fb4d7f45d1cf-606f0b66b7bmr2628868a12.14.1749050754080;
        Wed, 04 Jun 2025 08:25:54 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606ed984f63sm1051640a12.58.2025.06.04.08.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:25:53 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 04 Jun 2025 16:25:54 +0100
Subject: [PATCH 15/17] regulator: s2mps11: refactor S2MPG10 regulator
 macros for S2MPG11 reuse
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250604-s2mpg1x-regulators-v1-15-6038740f49ae@linaro.org>
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

Rails in the S2MPG11 share a very similar set of properties with
S2MP10 with slight differences. Update the existing macros to allow
reuse by the upcoming S2MPG11 driver.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
Note: checkpatch complains about unused macro arguments _r_mask,
_r_table, and _r_table_sz, but these are false-positives due to patch
context.
---
 drivers/regulator/s2mps11.c | 70 ++++++++++++++++++++++++++++-----------------
 1 file changed, 43 insertions(+), 27 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index f427895637a32f26e2960ce7c7879632f0bc2dcb..74f09b949ca7d6f1d61decd086480996fd444dbd 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -638,24 +638,24 @@ static const struct regulator_ops s2mpg10_reg_buck_ops[] = {
 	}
 };
 
-#define regulator_desc_s2mpg10_ldo_cmn(_num, _supply, _ops, _vrange,	\
-		_vsel_reg_sfx, _vsel_mask, _en_reg, _en_mask,		\
+#define regulator_desc_s2mpg1x_ldo_cmn(_name, _id, _supply, _ops,	\
+		_vrange, _vsel_reg, _vsel_mask, _en_reg, _en_mask,	\
 		_ramp_delay, _r_reg, _r_mask, _r_table,	_r_table_sz) {	\
-	.name		= "ldo"#_num"m",				\
+	.name		= "ldo"_name,					\
 	.supply_name	= _supply,					\
-	.of_match	= of_match_ptr("ldo"#_num"m"),			\
+	.of_match	= of_match_ptr("ldo"_name),			\
 	.regulators_node = of_match_ptr("regulators"),			\
 	.of_parse_cb	= s2mpg10_of_parse_cb,				\
-	.id		= S2MPG10_LDO##_num,				\
+	.id		= _id,						\
 	.ops		= &_ops[0],					\
 	.type		= REGULATOR_VOLTAGE,				\
 	.owner		= THIS_MODULE,					\
 	.linear_ranges	= _vrange,					\
 	.n_linear_ranges = ARRAY_SIZE(_vrange),				\
 	.n_voltages	= _vrange##_count,				\
-	.vsel_reg	= S2MPG10_PMIC_L##_num##M_##_vsel_reg_sfx,	\
+	.vsel_reg	= _vsel_reg,					\
 	.vsel_mask	= _vsel_mask,					\
-	.enable_reg	= S2MPG10_PMIC_##_en_reg,			\
+	.enable_reg	= _en_reg,					\
 	.enable_mask	= _en_mask,					\
 	.ramp_delay	= _ramp_delay,					\
 	.ramp_reg	= _r_reg,					\
@@ -670,10 +670,12 @@ static const struct regulator_ops s2mpg10_reg_buck_ops[] = {
 		_ramp_delay, _r_reg, _r_mask, _r_table,	_r_table_sz,	\
 		_pc_reg, _pc_mask)					\
 	{								\
-		.desc = regulator_desc_s2mpg10_ldo_cmn(_num, _supply,	\
-				_ops,					\
-				_vrange, _vsel_reg_sfx, _vsel_mask,	\
-				_en_reg, _en_mask,			\
+		.desc = regulator_desc_s2mpg1x_ldo_cmn(#_num"m",	\
+				S2MPG10_LDO##_num, _supply, _ops,	\
+				_vrange,				\
+				S2MPG10_PMIC_L##_num##M_##_vsel_reg_sfx, \
+				_vsel_mask,				\
+				S2MPG10_PMIC_##_en_reg, _en_mask,	\
 				_ramp_delay, _r_reg, _r_mask, _r_table,	\
 				_r_table_sz),				\
 		.pctrlsel_reg = _pc_reg,				\
@@ -728,31 +730,45 @@ static const struct regulator_ops s2mpg10_reg_buck_ops[] = {
  * (12.5mV/μs) while our ::set_voltage_time() takes the value in ramp_reg
  * into account.
  */
-#define regulator_desc_s2mpg10_buck(_num, _vrange, _r_reg) {		\
-	.name		= "buck"#_num"m",				\
-	.supply_name	= "vinb"#_num"m",				\
-	.of_match	= of_match_ptr("buck"#_num"m"),			\
+#define regulator_desc_s2mpg1x_buck_cmn(_name, _id, _supply, _ops,	\
+		_vrange, _vsel_reg, _vsel_mask, _en_reg, _en_mask,	\
+		_r_reg, _r_mask, _r_table, _r_table_sz,			\
+		_en_time) {						\
+	.name		= "buck"_name,					\
+	.supply_name	= _supply,					\
+	.of_match	= of_match_ptr("buck"_name),			\
 	.of_parse_cb	= s2mpg10_of_parse_cb,				\
 	.regulators_node = of_match_ptr("regulators"),			\
-	.id		= S2MPG10_BUCK##_num,				\
-	.ops		= &s2mpg10_reg_buck_ops[0],			\
+	.of_parse_cb	= s2mpg10_of_parse_cb,				\
+	.id		= _id,						\
+	.ops		= &_ops[0],					\
 	.type		= REGULATOR_VOLTAGE,				\
 	.owner		= THIS_MODULE,					\
 	.linear_ranges	= _vrange,					\
 	.n_linear_ranges = ARRAY_SIZE(_vrange),				\
 	.n_voltages	= _vrange##_count,				\
-	.vsel_reg	= S2MPG10_PMIC_B##_num##M_OUT1,			\
-	.vsel_mask	= 0xff,						\
-	.enable_reg	= S2MPG10_PMIC_B##_num##M_CTRL,			\
-	.enable_mask	= GENMASK(7, 6),				\
-	.ramp_reg	= S2MPG10_PMIC_##_r_reg,			\
-	.ramp_mask	= s2mpg10_buck_to_ramp_mask(S2MPG10_BUCK##_num	\
-						    - S2MPG10_BUCK1),	\
-	.ramp_delay_table = s2mpg10_buck_ramp_table,			\
-	.n_ramp_values	= ARRAY_SIZE(s2mpg10_buck_ramp_table),		\
-	.enable_time	= 30, /* + V/enable_ramp_rate */		\
+	.vsel_reg	= _vsel_reg,					\
+	.vsel_mask	= _vsel_mask,					\
+	.enable_reg	= _en_reg,					\
+	.enable_mask	= _en_mask,					\
+	.ramp_reg	= _r_reg,					\
+	.ramp_mask	= _r_mask,					\
+	.ramp_delay_table = _r_table,					\
+	.n_ramp_values	= _r_table_sz,					\
+	.enable_time	= _en_time, /* + V/enable_ramp_rate */		\
 }
 
+#define regulator_desc_s2mpg10_buck(_num, _vrange, _r_reg)		\
+	regulator_desc_s2mpg1x_buck_cmn(#_num"m", S2MPG10_BUCK##_num,	\
+		"vinb"#_num"m", s2mpg10_reg_buck_ops, _vrange,		\
+		S2MPG10_PMIC_B##_num##M_OUT1, GENMASK(7, 0),		\
+		S2MPG10_PMIC_B##_num##M_CTRL, GENMASK(7, 6),		\
+		S2MPG10_PMIC_##_r_reg,					\
+		s2mpg10_buck_to_ramp_mask(S2MPG10_BUCK##_num		\
+					  - S2MPG10_BUCK1),		\
+		s2mpg10_buck_ramp_table,				\
+		ARRAY_SIZE(s2mpg10_buck_ramp_table), 30)
+
 #define s2mpg10_regulator_desc_buck_cm(_num, _vrange, _r_reg)		\
 	.desc = regulator_desc_s2mpg10_buck(_num, _vrange, _r_reg),	\
 	.enable_ramp_rate = 12500

-- 
2.49.0.1204.g71687c7c1d-goog


