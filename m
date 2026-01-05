Return-Path: <linux-gpio+bounces-30131-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE68CF29CA
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 10:07:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F025301FB5D
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 09:02:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE63C32E6A5;
	Mon,  5 Jan 2026 09:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P8YBi0xW"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD2732C33E
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 09:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603718; cv=none; b=Yeh4ViWTrU3Q+TyXv17576e15iVM6mxL0SmKP37GW3cXR3RLOl3c2N3GcCKR/WoW9d5v0Rcu7J8NdMTSo+ZmjdOdR+Q3kSLpHYrpZOchzWg2tTfGNRLdSYELDn6RbeXnHVuUNGYZem7t9V6gpFVQJB5p+w5O889TTIQ9sDj69Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603718; c=relaxed/simple;
	bh=K5C3OhUoY6K0VAHET6GjBFnt0SuYQemw88dVyIhs++Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F2iqPbmGFR3IIy9Lt+LLHVFrP3CE3wybRLdyego+a6J8ByZaeO+a1hR4umieY0xkvhrrUNKf9kawCrRAMYdzb9gXMDT08/ot8hfYEGWo+0ZNXKoGgyZ8dejsqYy7+mwnNcPNI46PgD99IEVYQhGY89eleI68wB2IpcZGWA5PQCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P8YBi0xW; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b8010b8f078so2040163466b.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 01:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767603708; x=1768208508; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nusFn6aAeugE2vgG6EjhYq+miTmPM6tuO12QEUcKzwU=;
        b=P8YBi0xWmVnwlgaBwZ4TazOLBE/i03wdMJ3IL6jKaOlGDCwS/WfNmhXvtqNYND74RV
         JEv00lhtiIERp6abIO0Vsl/MB4P3azYXTL7PLmZ2YRlamJhNTh54zPirlnx9Gjix8vIJ
         KQ7yTDMnoxox7tCcNy+t/hnzpjhH4K9dy8DyyXXsvNMYqRmzYgN110Tyn1Pr2o6jzG5t
         4f3wTwx9/Ka45vmGwagdumwGnNEZSp42BzJNj5NpgOl/pvg93Oom2I+0IMhXNEGKnj08
         AOQAur12g/BQJhPC6+OwOfr1poioNLS023N9NXRjUqcZLQJJ3YTEIO3pb6ISzQLwOJ1H
         wMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603708; x=1768208508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nusFn6aAeugE2vgG6EjhYq+miTmPM6tuO12QEUcKzwU=;
        b=h95sUzkI1GSkZBp0t3aq9AyaMWt2i/2qoy+jO3Qb30KCkn2NM8kf3HQ+yNTxbN9ZkL
         XWT7tS5Ko0Igx/iS0c+lGJFLlFikeV9UqRukPho/akgigxFlbzdJgpUahIk3Tcr+rdUI
         380ZT6YREeh+h3yyYcCoECPUpscCwq0sHMOz0/c7OdjGN6uUb1L4LV33pFI1es3OGYTy
         Jxm3EuvRpLMyPn7FJxWqvV7/ilGYis+oLxfnmtQIocotRRmUDUkokiUIdwDrORlaSGeQ
         VqYlokK29ThPbdK8YJ1O/pZy7jILDJBqk9QdTJwH7DS8iNEgsnnzdCh2FxjpzB1wUqD5
         Wpyw==
X-Forwarded-Encrypted: i=1; AJvYcCXDAb1rEKKhzG9N66zCnWPnVr/LTTauVJ4XOUe/znShsuE3ZsRcg43ThVKtn4nh3TTtoPYoxRrXe9/Y@vger.kernel.org
X-Gm-Message-State: AOJu0YxFA5atw7DucvMQJD4o8Zqwnrnmsq2Pam3h//EA5j4+QoR2szVI
	e+zWALcWdDvFfGP2gzJlbeMzYBGac3bMiKZV4TOP1ulTSFHTptkpD7nEB3jgKvq1jtg=
X-Gm-Gg: AY/fxX7Dr4iDiPJu5LJWkEs/eXJfDG668xQhXH4hdwXdzRz1+0H9UyLJpcv84e+xU52
	dyUO6T5Q99qIDPl66GGlZe64IDA8dDTyMffqEDtHwRKYXOvHOtI0OmrkalbOYYeDJaJJeKgzlsQ
	KznJisfxC1VLvT0HwKDoTCPMTBUIbWNeHqIVPBklUmPefFqGdSQ3QAEAGAAlAynTZ+ERNnqZXWI
	lEt5X5MLX1i9bO2jE3q6shoMASZS/K4VKExaYC2Mgw2eFGEt7q5EiJg3XVetsBpMX7THP5TMV+9
	C0v6KNiKqLTdPWbv35GB4t7pzB+LtKDMIUDMR1LtHr93SOitjF/nZtKyvSepfTI3uy402BWXjAe
	KWfwMa5K9MGmplzcPatE36Y4ronwhy9/bH+nyejRRhT7jgaHNNdT7dYHKEwjTD6PaISIyD3E+x/
	DN9NHH/QgCQd6joM3AZyRoTid2cd6nFWeFiB60yOBQKf7q8HE8TORqsPmLe1ayxffHSH3UTV5Jl
	s8jauJS/K1e5o8U
X-Google-Smtp-Source: AGHT+IFZpiiMKEoM+bNlxEzc9xDzaIxcL1vnVA9swVqdKvu61oAUboe81BV/nwzziDLPAO0mtoXPeg==
X-Received: by 2002:a17:906:6a2a:b0:b73:845f:4432 with SMTP id a640c23a62f3a-b8037178f70mr5650773066b.32.1767603708200;
        Mon, 05 Jan 2026 01:01:48 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0ecb9sm5384010466b.56.2026.01.05.01.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:01:47 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 05 Jan 2026 09:01:50 +0000
Subject: [PATCH v6 14/20] regulator: s2mps11: update node parsing (allow
 -supply properties)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260105-s2mpg1x-regulators-v6-14-80f4b6d1bf9d@linaro.org>
References: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
In-Reply-To: <20260105-s2mpg1x-regulators-v6-0-80f4b6d1bf9d@linaro.org>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Juan Yescas <jyescas@google.com>, 
 kernel-team@android.com, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.2

For the upcoming S2MPG10 and S2MPG11 support, we need to be able to
parse -supply properties in the PMIC's DT node.

This currently doesn't work, because the code here currently points the
regulator core at each individual regulator sub-node, and therefore the
regulator core is unable to find the -supply properties.

Update the code to simply let the regulator core handle all the parsing
by adding the ::of_match and ::regulators_node members to all existing
regulator descriptions, by adding ::of_parse_cb() to those
regulators which support the vendor-specific samsung,ext-control-gpios
to parse it (S2MPS14), and by dropping the explicit call to
of_regulator_match().

Configuring the PMIC to respect the external control GPIOs via
s2mps14_pmic_enable_ext_control() is left outside ::of_parse_cb()
because the regulator core ignores errors other than -EPROBE_DEFER from
that callback, while the code currently fails probe on register write
errors and I believe it should stay that way.

The driver can now avoid the devm_gpiod_unhinge() dance due to
simpler error handling of GPIO descriptor acquisition.

This change also has the advantage of reducing runtime memory
consumption by quite a bit as the driver doesn't need to allocate a
'struct of_regulator_match' and a 'struct gpio_desc *' for each
regulator for all PMICs as the regulator core does that. This saves
40+8 bytes on arm64 for each individual regulator on all supported
PMICs (even on non-S2MPS14 due to currently unnecessarily allocating
the extra memory unconditionally). With the upcoming S2MPG10 and
S2MPG11 support, this amounts to 1640+328 and 1120+224 bytes
respectively.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
- fix commit message typos: s2mp1 -> s2mpg1
---
 drivers/regulator/s2mps11.c | 192 ++++++++++++++++++++++++--------------------
 1 file changed, 105 insertions(+), 87 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 8a36ab67b73e4151c7f67af0555a6465ee1e7a04..88e21c90832a45547e5791b15cd1de274f81fed6 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -40,12 +40,6 @@ struct s2mps11_info {
 	 * the suspend mode was enabled.
 	 */
 	DECLARE_BITMAP(suspend_state, S2MPS_REGULATOR_MAX);
-
-	/*
-	 * Array (size: number of regulators) with GPIO-s for external
-	 * sleep control.
-	 */
-	struct gpio_desc **ext_control_gpiod;
 };
 
 static int get_ramp_delay(int ramp_delay)
@@ -244,7 +238,7 @@ static int s2mps11_regulator_enable(struct regulator_dev *rdev)
 	case S2MPS14X:
 		if (test_bit(rdev_id, s2mps11->suspend_state))
 			val = S2MPS14_ENABLE_SUSPEND;
-		else if (s2mps11->ext_control_gpiod[rdev_id])
+		else if (rdev->ena_pin)
 			val = S2MPS14_ENABLE_EXT_CONTROL;
 		else
 			val = rdev->desc->enable_mask;
@@ -334,6 +328,58 @@ static int s2mps11_regulator_set_suspend_disable(struct regulator_dev *rdev)
 				  rdev->desc->enable_mask, state);
 }
 
+static int s2mps11_of_parse_cb(struct device_node *np,
+			       const struct regulator_desc *desc,
+			       struct regulator_config *config)
+{
+	const struct s2mps11_info *s2mps11 = config->driver_data;
+	struct gpio_desc *ena_gpiod;
+	int ret;
+
+	if (s2mps11->dev_type == S2MPS14X)
+		switch (desc->id) {
+		case S2MPS14_LDO10:
+		case S2MPS14_LDO11:
+		case S2MPS14_LDO12:
+			break;
+
+		default:
+			return 0;
+		}
+	else
+		return 0;
+
+	ena_gpiod = fwnode_gpiod_get_index(of_fwnode_handle(np),
+					   "samsung,ext-control", 0,
+					   GPIOD_OUT_HIGH |
+					   GPIOD_FLAGS_BIT_NONEXCLUSIVE,
+					   "s2mps11-regulator");
+	if (IS_ERR(ena_gpiod)) {
+		ret = PTR_ERR(ena_gpiod);
+
+		/* Ignore all errors except probe defer. */
+		if (ret == -EPROBE_DEFER)
+			return ret;
+
+		if (ret == -ENOENT)
+			dev_info(config->dev,
+				 "No entry for control GPIO for %d/%s in node %pOF\n",
+				 desc->id, desc->name, np);
+		else
+			dev_warn_probe(config->dev, ret,
+				       "Failed to get control GPIO for %d/%s in node %pOF\n",
+				       desc->id, desc->name, np);
+		return 0;
+	}
+
+	dev_info(config->dev, "Using GPIO for ext-control over %d/%s\n",
+		 desc->id, desc->name);
+
+	config->ena_gpiod = ena_gpiod;
+
+	return 0;
+}
+
 static const struct regulator_ops s2mps11_ldo_ops = {
 	.list_voltage		= regulator_list_voltage_linear,
 	.map_voltage		= regulator_map_voltage_linear,
@@ -362,6 +408,8 @@ static const struct regulator_ops s2mps11_buck_ops = {
 #define regulator_desc_s2mps11_ldo(num, step) {		\
 	.name		= "LDO"#num,			\
 	.id		= S2MPS11_LDO##num,		\
+	.of_match	= of_match_ptr("LDO"#num),	\
+	.regulators_node = of_match_ptr("regulators"),	\
 	.ops		= &s2mps11_ldo_ops,		\
 	.type		= REGULATOR_VOLTAGE,		\
 	.owner		= THIS_MODULE,			\
@@ -378,6 +426,8 @@ static const struct regulator_ops s2mps11_buck_ops = {
 #define regulator_desc_s2mps11_buck1_4(num) {			\
 	.name		= "BUCK"#num,				\
 	.id		= S2MPS11_BUCK##num,			\
+	.of_match	= of_match_ptr("BUCK"#num),		\
+	.regulators_node = of_match_ptr("regulators"),		\
 	.ops		= &s2mps11_buck_ops,			\
 	.type		= REGULATOR_VOLTAGE,			\
 	.owner		= THIS_MODULE,				\
@@ -395,6 +445,8 @@ static const struct regulator_ops s2mps11_buck_ops = {
 #define regulator_desc_s2mps11_buck5 {				\
 	.name		= "BUCK5",				\
 	.id		= S2MPS11_BUCK5,			\
+	.of_match	= of_match_ptr("BUCK5"),		\
+	.regulators_node = of_match_ptr("regulators"),		\
 	.ops		= &s2mps11_buck_ops,			\
 	.type		= REGULATOR_VOLTAGE,			\
 	.owner		= THIS_MODULE,				\
@@ -412,6 +464,8 @@ static const struct regulator_ops s2mps11_buck_ops = {
 #define regulator_desc_s2mps11_buck67810(num, min, step, min_sel, voltages) {	\
 	.name		= "BUCK"#num,				\
 	.id		= S2MPS11_BUCK##num,			\
+	.of_match	= of_match_ptr("BUCK"#num),		\
+	.regulators_node = of_match_ptr("regulators"),		\
 	.ops		= &s2mps11_buck_ops,			\
 	.type		= REGULATOR_VOLTAGE,			\
 	.owner		= THIS_MODULE,				\
@@ -429,6 +483,8 @@ static const struct regulator_ops s2mps11_buck_ops = {
 #define regulator_desc_s2mps11_buck9 {				\
 	.name		= "BUCK9",				\
 	.id		= S2MPS11_BUCK9,			\
+	.of_match	= of_match_ptr("BUCK9"),		\
+	.regulators_node = of_match_ptr("regulators"),		\
 	.ops		= &s2mps11_buck_ops,			\
 	.type		= REGULATOR_VOLTAGE,			\
 	.owner		= THIS_MODULE,				\
@@ -502,6 +558,8 @@ static const struct regulator_ops s2mps14_reg_ops;
 #define regulator_desc_s2mps13_ldo(num, min, step, min_sel) {	\
 	.name		= "LDO"#num,				\
 	.id		= S2MPS13_LDO##num,			\
+	.of_match	= of_match_ptr("LDO"#num),		\
+	.regulators_node = of_match_ptr("regulators"),		\
 	.ops		= &s2mps14_reg_ops,			\
 	.type		= REGULATOR_VOLTAGE,			\
 	.owner		= THIS_MODULE,				\
@@ -518,6 +576,8 @@ static const struct regulator_ops s2mps14_reg_ops;
 #define regulator_desc_s2mps13_buck(num, min, step, min_sel) {	\
 	.name		= "BUCK"#num,				\
 	.id		= S2MPS13_BUCK##num,			\
+	.of_match	= of_match_ptr("BUCK"#num),		\
+	.regulators_node = of_match_ptr("regulators"),		\
 	.ops		= &s2mps14_reg_ops,			\
 	.type		= REGULATOR_VOLTAGE,			\
 	.owner		= THIS_MODULE,				\
@@ -535,6 +595,8 @@ static const struct regulator_ops s2mps14_reg_ops;
 #define regulator_desc_s2mps13_buck7(num, min, step, min_sel) {	\
 	.name		= "BUCK"#num,				\
 	.id		= S2MPS13_BUCK##num,			\
+	.of_match	= of_match_ptr("BUCK"#num),		\
+	.regulators_node = of_match_ptr("regulators"),		\
 	.ops		= &s2mps14_reg_ops,			\
 	.type		= REGULATOR_VOLTAGE,			\
 	.owner		= THIS_MODULE,				\
@@ -552,6 +614,8 @@ static const struct regulator_ops s2mps14_reg_ops;
 #define regulator_desc_s2mps13_buck8_10(num, min, step, min_sel) {	\
 	.name		= "BUCK"#num,				\
 	.id		= S2MPS13_BUCK##num,			\
+	.of_match	= of_match_ptr("BUCK"#num),		\
+	.regulators_node = of_match_ptr("regulators"),		\
 	.ops		= &s2mps14_reg_ops,			\
 	.type		= REGULATOR_VOLTAGE,			\
 	.owner		= THIS_MODULE,				\
@@ -634,6 +698,9 @@ static const struct regulator_ops s2mps14_reg_ops = {
 #define regulator_desc_s2mps14_ldo(num, min, step) {	\
 	.name		= "LDO"#num,			\
 	.id		= S2MPS14_LDO##num,		\
+	.of_match	= of_match_ptr("LDO"#num),	\
+	.regulators_node = of_match_ptr("regulators"),	\
+	.of_parse_cb	= s2mps11_of_parse_cb,		\
 	.ops		= &s2mps14_reg_ops,		\
 	.type		= REGULATOR_VOLTAGE,		\
 	.owner		= THIS_MODULE,			\
@@ -649,6 +716,9 @@ static const struct regulator_ops s2mps14_reg_ops = {
 #define regulator_desc_s2mps14_buck(num, min, step, min_sel) {	\
 	.name		= "BUCK"#num,				\
 	.id		= S2MPS14_BUCK##num,			\
+	.of_match	= of_match_ptr("BUCK"#num),		\
+	.regulators_node = of_match_ptr("regulators"),		\
+	.of_parse_cb	= s2mps11_of_parse_cb,			\
 	.ops		= &s2mps14_reg_ops,			\
 	.type		= REGULATOR_VOLTAGE,			\
 	.owner		= THIS_MODULE,				\
@@ -725,6 +795,8 @@ static const struct regulator_ops s2mps15_reg_buck_ops = {
 #define regulator_desc_s2mps15_ldo(num, range) {	\
 	.name		= "LDO"#num,			\
 	.id		= S2MPS15_LDO##num,		\
+	.of_match	= of_match_ptr("LDO"#num),	\
+	.regulators_node = of_match_ptr("regulators"),	\
 	.ops		= &s2mps15_reg_ldo_ops,		\
 	.type		= REGULATOR_VOLTAGE,		\
 	.owner		= THIS_MODULE,			\
@@ -740,6 +812,8 @@ static const struct regulator_ops s2mps15_reg_buck_ops = {
 #define regulator_desc_s2mps15_buck(num, range) {			\
 	.name		= "BUCK"#num,					\
 	.id		= S2MPS15_BUCK##num,				\
+	.of_match	= of_match_ptr("BUCK"#num),			\
+	.regulators_node = of_match_ptr("regulators"),			\
 	.ops		= &s2mps15_reg_buck_ops,			\
 	.type		= REGULATOR_VOLTAGE,				\
 	.owner		= THIS_MODULE,					\
@@ -835,60 +909,6 @@ static int s2mps14_pmic_enable_ext_control(struct s2mps11_info *s2mps11,
 			rdev->desc->enable_mask, S2MPS14_ENABLE_EXT_CONTROL);
 }
 
-static void s2mps14_pmic_dt_parse_ext_control_gpio(struct platform_device *pdev,
-		struct of_regulator_match *rdata, struct s2mps11_info *s2mps11)
-{
-	struct gpio_desc **gpio = s2mps11->ext_control_gpiod;
-	unsigned int i;
-	unsigned int valid_regulators[3] = { S2MPS14_LDO10, S2MPS14_LDO11,
-		S2MPS14_LDO12 };
-
-	for (i = 0; i < ARRAY_SIZE(valid_regulators); i++) {
-		unsigned int reg = valid_regulators[i];
-
-		if (!rdata[reg].init_data || !rdata[reg].of_node)
-			continue;
-
-		gpio[reg] = devm_fwnode_gpiod_get(&pdev->dev,
-				of_fwnode_handle(rdata[reg].of_node),
-				"samsung,ext-control",
-				GPIOD_OUT_HIGH | GPIOD_FLAGS_BIT_NONEXCLUSIVE,
-				"s2mps11-regulator");
-		if (PTR_ERR(gpio[reg]) == -ENOENT)
-			gpio[reg] = NULL;
-		else if (IS_ERR(gpio[reg])) {
-			dev_err(&pdev->dev, "Failed to get control GPIO for %d/%s\n",
-				reg, rdata[reg].name);
-			gpio[reg] = NULL;
-			continue;
-		}
-		if (gpio[reg])
-			dev_dbg(&pdev->dev, "Using GPIO for ext-control over %d/%s\n",
-				reg, rdata[reg].name);
-	}
-}
-
-static int s2mps11_pmic_dt_parse(struct platform_device *pdev,
-		struct of_regulator_match *rdata, struct s2mps11_info *s2mps11,
-		unsigned int rdev_num)
-{
-	struct device_node *reg_np;
-
-	reg_np = of_get_child_by_name(pdev->dev.parent->of_node, "regulators");
-	if (!reg_np) {
-		dev_err(&pdev->dev, "could not find regulators sub-node\n");
-		return -EINVAL;
-	}
-
-	of_regulator_match(&pdev->dev, reg_np, rdata, rdev_num);
-	if (s2mps11->dev_type == S2MPS14X)
-		s2mps14_pmic_dt_parse_ext_control_gpio(pdev, rdata, s2mps11);
-
-	of_node_put(reg_np);
-
-	return 0;
-}
-
 static int s2mpu02_set_ramp_delay(struct regulator_dev *rdev, int ramp_delay)
 {
 	unsigned int ramp_val, ramp_shift, ramp_reg;
@@ -946,6 +966,8 @@ static const struct regulator_ops s2mpu02_buck_ops = {
 #define regulator_desc_s2mpu02_ldo1(num) {		\
 	.name		= "LDO"#num,			\
 	.id		= S2MPU02_LDO##num,		\
+	.of_match	= of_match_ptr("LDO"#num),	\
+	.regulators_node = of_match_ptr("regulators"),	\
 	.ops		= &s2mpu02_ldo_ops,		\
 	.type		= REGULATOR_VOLTAGE,		\
 	.owner		= THIS_MODULE,			\
@@ -961,6 +983,8 @@ static const struct regulator_ops s2mpu02_buck_ops = {
 #define regulator_desc_s2mpu02_ldo2(num) {		\
 	.name		= "LDO"#num,			\
 	.id		= S2MPU02_LDO##num,		\
+	.of_match	= of_match_ptr("LDO"#num),	\
+	.regulators_node = of_match_ptr("regulators"),	\
 	.ops		= &s2mpu02_ldo_ops,		\
 	.type		= REGULATOR_VOLTAGE,		\
 	.owner		= THIS_MODULE,			\
@@ -976,6 +1000,8 @@ static const struct regulator_ops s2mpu02_buck_ops = {
 #define regulator_desc_s2mpu02_ldo3(num) {		\
 	.name		= "LDO"#num,			\
 	.id		= S2MPU02_LDO##num,		\
+	.of_match	= of_match_ptr("LDO"#num),	\
+	.regulators_node = of_match_ptr("regulators"),	\
 	.ops		= &s2mpu02_ldo_ops,		\
 	.type		= REGULATOR_VOLTAGE,		\
 	.owner		= THIS_MODULE,			\
@@ -991,6 +1017,8 @@ static const struct regulator_ops s2mpu02_buck_ops = {
 #define regulator_desc_s2mpu02_ldo4(num) {		\
 	.name		= "LDO"#num,			\
 	.id		= S2MPU02_LDO##num,		\
+	.of_match	= of_match_ptr("LDO"#num),	\
+	.regulators_node = of_match_ptr("regulators"),	\
 	.ops		= &s2mpu02_ldo_ops,		\
 	.type		= REGULATOR_VOLTAGE,		\
 	.owner		= THIS_MODULE,			\
@@ -1006,6 +1034,8 @@ static const struct regulator_ops s2mpu02_buck_ops = {
 #define regulator_desc_s2mpu02_ldo5(num) {		\
 	.name		= "LDO"#num,			\
 	.id		= S2MPU02_LDO##num,		\
+	.of_match	= of_match_ptr("LDO"#num),	\
+	.regulators_node = of_match_ptr("regulators"),	\
 	.ops		= &s2mpu02_ldo_ops,		\
 	.type		= REGULATOR_VOLTAGE,		\
 	.owner		= THIS_MODULE,			\
@@ -1022,6 +1052,8 @@ static const struct regulator_ops s2mpu02_buck_ops = {
 #define regulator_desc_s2mpu02_buck1234(num) {			\
 	.name		= "BUCK"#num,				\
 	.id		= S2MPU02_BUCK##num,			\
+	.of_match	= of_match_ptr("BUCK"#num),		\
+	.regulators_node = of_match_ptr("regulators"),		\
 	.ops		= &s2mpu02_buck_ops,			\
 	.type		= REGULATOR_VOLTAGE,			\
 	.owner		= THIS_MODULE,				\
@@ -1038,6 +1070,8 @@ static const struct regulator_ops s2mpu02_buck_ops = {
 #define regulator_desc_s2mpu02_buck5(num) {			\
 	.name		= "BUCK"#num,				\
 	.id		= S2MPU02_BUCK##num,			\
+	.of_match	= of_match_ptr("BUCK"#num),		\
+	.regulators_node = of_match_ptr("regulators"),		\
 	.ops		= &s2mpu02_ldo_ops,			\
 	.type		= REGULATOR_VOLTAGE,			\
 	.owner		= THIS_MODULE,				\
@@ -1054,6 +1088,8 @@ static const struct regulator_ops s2mpu02_buck_ops = {
 #define regulator_desc_s2mpu02_buck6(num) {			\
 	.name		= "BUCK"#num,				\
 	.id		= S2MPU02_BUCK##num,			\
+	.of_match	= of_match_ptr("BUCK"#num),		\
+	.regulators_node = of_match_ptr("regulators"),		\
 	.ops		= &s2mpu02_ldo_ops,			\
 	.type		= REGULATOR_VOLTAGE,			\
 	.owner		= THIS_MODULE,				\
@@ -1070,6 +1106,8 @@ static const struct regulator_ops s2mpu02_buck_ops = {
 #define regulator_desc_s2mpu02_buck7(num) {			\
 	.name		= "BUCK"#num,				\
 	.id		= S2MPU02_BUCK##num,			\
+	.of_match	= of_match_ptr("BUCK"#num),		\
+	.regulators_node = of_match_ptr("regulators"),		\
 	.ops		= &s2mpu02_ldo_ops,			\
 	.type		= REGULATOR_VOLTAGE,			\
 	.owner		= THIS_MODULE,				\
@@ -1125,6 +1163,8 @@ static const struct regulator_desc s2mpu02_regulators[] = {
 #define regulator_desc_s2mpu05_ldo_reg(num, min, step, reg) {	\
 	.name		= "ldo"#num,				\
 	.id		= S2MPU05_LDO##num,			\
+	.of_match	= of_match_ptr("ldo"#num),		\
+	.regulators_node = of_match_ptr("regulators"),		\
 	.ops		= &s2mpu02_ldo_ops,			\
 	.type		= REGULATOR_VOLTAGE,			\
 	.owner		= THIS_MODULE,				\
@@ -1156,6 +1196,8 @@ static const struct regulator_desc s2mpu02_regulators[] = {
 #define regulator_desc_s2mpu05_buck(num, which) {	\
 	.name		= "buck"#num,			\
 	.id		= S2MPU05_BUCK##num,		\
+	.of_match	= of_match_ptr("buck"#num),	\
+	.regulators_node = of_match_ptr("regulators"),	\
 	.ops		= &s2mpu02_buck_ops,		\
 	.type		= REGULATOR_VOLTAGE,		\
 	.owner		= THIS_MODULE,			\
@@ -1254,22 +1296,7 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 				     s2mps11->dev_type);
 	}
 
-	s2mps11->ext_control_gpiod = devm_kcalloc(&pdev->dev, rdev_num,
-			       sizeof(*s2mps11->ext_control_gpiod), GFP_KERNEL);
-	if (!s2mps11->ext_control_gpiod)
-		return -ENOMEM;
-
-	struct of_regulator_match *rdata __free(kfree) =
-		kcalloc(rdev_num, sizeof(*rdata), GFP_KERNEL);
-	if (!rdata)
-		return -ENOMEM;
-
-	for (i = 0; i < rdev_num; i++)
-		rdata[i].name = regulators[i].name;
-
-	ret = s2mps11_pmic_dt_parse(pdev, rdata, s2mps11, rdev_num);
-	if (ret)
-		return ret;
+	device_set_of_node_from_dev(&pdev->dev, pdev->dev.parent);
 
 	platform_set_drvdata(pdev, s2mps11);
 
@@ -1279,15 +1306,6 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 	for (i = 0; i < rdev_num; i++) {
 		struct regulator_dev *regulator;
 
-		config.init_data = rdata[i].init_data;
-		config.of_node = rdata[i].of_node;
-		config.ena_gpiod = s2mps11->ext_control_gpiod[i];
-		/*
-		 * Hand the GPIO descriptor management over to the regulator
-		 * core, remove it from devres management.
-		 */
-		if (config.ena_gpiod)
-			devm_gpiod_unhinge(&pdev->dev, config.ena_gpiod);
 		regulator = devm_regulator_register(&pdev->dev,
 						&regulators[i], &config);
 		if (IS_ERR(regulator))
@@ -1296,7 +1314,7 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 					     regulators[i].id,
 					     regulators[i].name);
 
-		if (config.ena_gpiod) {
+		if (regulator->ena_pin) {
 			ret = s2mps14_pmic_enable_ext_control(s2mps11,
 							      regulator);
 			if (ret < 0)

-- 
2.52.0.351.gbe84eed79e-goog


