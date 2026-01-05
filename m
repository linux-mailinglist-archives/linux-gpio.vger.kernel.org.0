Return-Path: <linux-gpio+bounces-30130-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C447CF29CD
	for <lists+linux-gpio@lfdr.de>; Mon, 05 Jan 2026 10:07:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 12826302558D
	for <lists+linux-gpio@lfdr.de>; Mon,  5 Jan 2026 09:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C415432E6BB;
	Mon,  5 Jan 2026 09:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cJARZl2v"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74D5232D0D5
	for <linux-gpio@vger.kernel.org>; Mon,  5 Jan 2026 09:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767603718; cv=none; b=BVx0Oi4WBumaSdybW+c4RHriUKvherHqfofbIjQOHXFpOI/UgqQ0hWdx6SBRhjzmkagZADVWcjZwQYHIvHI8Cbn+6OQkjcgX1Q8UJQhlIWKEjxaa05e8FP9Q2BoVFpsZDH5xwO2PRaaNcYOZQOz/BWqvnb4sJGxJclW5xzEcbGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767603718; c=relaxed/simple;
	bh=RBiblDYuoL7LiB6An/b16TWoN7ju2Vuj/2Yriz+avcs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bPhbb9qSCK2lBpJJLS1exfmgKduPY1A0y0gTk5rxTWMa/zjBObjtkjFhDNfU94+gviEv3rFoM5a2WUwPlsT79ubMx4vuuqvBqkmNbGAjmDWKj8piezllyPCtOhv1QYxHxAnuC8r3i2VWvwcwoRDo27ioSKt5u7xDFeO5m89weig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cJARZl2v; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b83122f9d78so1190882666b.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 Jan 2026 01:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767603709; x=1768208509; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QCOif9oxn9Ts49wbKRM5kmB/vgWlHk9jFqT6IaUcSpc=;
        b=cJARZl2vlRj5yAtAmwO0+6xn7F7n9mlhRNHE5R3EVZIr/8c6v5w9VGxYDqBXSU/So3
         kdYi+4IFzX55p5hM/31ZmFG3zm7Co3aKT7iK2zHfiBh7FTxNihTGlplDFTrBrShajhO4
         z0uJH1h6bAlQebLBU5UWq0daTZwZogBHl6R+L9Jx14dx8DJEy90Hebmos2EeqAwRsgly
         e60EQDZMmvcoQ1mrbkMkOsY/POMqwUEJBeAEXuSmMRuvK5BnZp1iZI50xpzA/6E3hnkm
         g7PDYFGGhas1p5KvVliQ39J3WWqzzDhR2aHL9pOR4p2no/MUhg0abXNSCRR3+BrD8Xnn
         eJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767603709; x=1768208509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QCOif9oxn9Ts49wbKRM5kmB/vgWlHk9jFqT6IaUcSpc=;
        b=QmKmmscTVh2Pg++5VDqrYQQ7SVzoTt5ZFh1zZYzUM1m9o25rgHyLxH9SXu5VObrQ94
         fcQ3TFzyIe8OQ8gEf19R3hyqM26yrgPEsz5GlHVLPFeKTsJr5sOeRlB5Iyy3W4zlJXCR
         FTyMmF0OmbeupF4ScnC3ZJkipnG/cXNFEHZui6IAlgVxWf2gWuXeBuhBV8ijYSJZHTzI
         4+FTS72tJ+ROk+zdyIDaSiJqc2pIKjuEF6oJYbA0cTulKKKQgzJq8PPOFMABCYWv5qRm
         iCpzgwzFawfqdzRvECncpbjJbZsSX0RFsCJn20et3pAHrBEE2zf+ssfex9l5GWMrMbwL
         Oc9g==
X-Forwarded-Encrypted: i=1; AJvYcCX+QQ3ymhhvGSHSBKuj/HS5eHv+PslMk6qf9ZNR6VSleU3ZBvFHDfLglaQw1pU4VrR2q0zfXfrhZdEP@vger.kernel.org
X-Gm-Message-State: AOJu0YzgIGu5hH6+7vu4jknqkYnZuEWY14p/4SZvE5JDBZNouN97hx0J
	eyj1XXF6q34aDFm4fYT11FOF6IgsbXjzh3H7M9zZKYoClL02Aqpqt7cqKwkYzx/BQ/o=
X-Gm-Gg: AY/fxX6d3gu7KesTcdekFpDkB9RKl8pfzdspsL4SDlznbHQ6uZ1QG3BEu5GKlDbBZTL
	fgp09MroTYt6mxdHSZ1EzfQAApWcEV3xbjSAKpbVkWGrvtyMc0qNEvAMKRn24gKHemh010r+7jL
	FDsxJ8qG70VaCdL2v3/B+DSePYfxbokvXDaP1ZiKA5p3YkwzHePujsz6lQ0itMLlRvrsawhXXNE
	UW3uKr2/5Q8fyzGWJ5/JKNonhiiBjoEY1sTM1LWkXaLKp2lTzJW+vNVGeFiDcy6y6AZvWE4u87v
	1hE0hPa8MLi4zWJU06ERMJw2IsXV87udJET6JFQwt+Rdixi1JYFMKFrtpi2kwASXHxUOsT6DYkA
	RS81A5giZZKhNJdawoJ9FafBbPIJneLEDR7z/R3fzHo3si5FUdkU+9iYcl2ASaqTzWJMv4WVEh/
	yFR7AddisM/L0HW6x8gNKi2orU3wj8Oa+ydzc2kNOgntHSD0UXkIXR/5WUxdnAhngYS4qh3AcHZ
	NSD8Q==
X-Google-Smtp-Source: AGHT+IFUVIMSn/sV3dFiXZcscsT3hGk0kSrJJy4RRYZc736gdsQg7/QBdwgX43lVqJFHn1pNi85KIg==
X-Received: by 2002:a17:907:948d:b0:b83:95c7:e984 with SMTP id a640c23a62f3a-b8395c7ed4dmr1656276066b.49.1767603708754;
        Mon, 05 Jan 2026 01:01:48 -0800 (PST)
Received: from puffmais2.c.googlers.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0ecb9sm5384010466b.56.2026.01.05.01.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 01:01:48 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Mon, 05 Jan 2026 09:01:51 +0000
Subject: [PATCH v6 15/20] regulator: s2mps11: refactor handling of external
 rail control
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260105-s2mpg1x-regulators-v6-15-80f4b6d1bf9d@linaro.org>
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

Refactor s2mps14_pmic_enable_ext_control() and s2mps11_of_parse_cb()
slightly as a preparation for adding S2MPG10 and S2MPG11 support, as
both of those PMICs also support control of rails via GPIOs.

This also includes the following to avoid further updates in follow-up
commits:
* On S2MPG10 and S2MPG11, external rail control can be via GPIO or via
  non-GPIO signals, hence passing a GPIO is allowed to be optional.
  This avoids inappropriate verbose driver messages.
* Prepare to allow use of standard DT property name 'enable-gpios' for
  newer platforms instead of vendor-specific 'samsung,ext-control'.

Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v2:
- add 'optional' flag to this commit (Bartosz)
- add 'con_id' to this commit
---
 drivers/regulator/s2mps11.c | 100 +++++++++++++++++++++++++++++---------------
 1 file changed, 67 insertions(+), 33 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index 88e21c90832a45547e5791b15cd1de274f81fed6..7f4db6673b43ebd533c2afb568ae3481351a9c60 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -328,29 +328,15 @@ static int s2mps11_regulator_set_suspend_disable(struct regulator_dev *rdev)
 				  rdev->desc->enable_mask, state);
 }
 
-static int s2mps11_of_parse_cb(struct device_node *np,
-			       const struct regulator_desc *desc,
-			       struct regulator_config *config)
+static int s2mps11_of_parse_gpiod(struct device_node *np,
+				  const char *con_id, bool optional,
+				  const struct regulator_desc *desc,
+				  struct regulator_config *config)
 {
-	const struct s2mps11_info *s2mps11 = config->driver_data;
 	struct gpio_desc *ena_gpiod;
 	int ret;
 
-	if (s2mps11->dev_type == S2MPS14X)
-		switch (desc->id) {
-		case S2MPS14_LDO10:
-		case S2MPS14_LDO11:
-		case S2MPS14_LDO12:
-			break;
-
-		default:
-			return 0;
-		}
-	else
-		return 0;
-
-	ena_gpiod = fwnode_gpiod_get_index(of_fwnode_handle(np),
-					   "samsung,ext-control", 0,
+	ena_gpiod = fwnode_gpiod_get_index(of_fwnode_handle(np), con_id, 0,
 					   GPIOD_OUT_HIGH |
 					   GPIOD_FLAGS_BIT_NONEXCLUSIVE,
 					   "s2mps11-regulator");
@@ -361,14 +347,19 @@ static int s2mps11_of_parse_cb(struct device_node *np,
 		if (ret == -EPROBE_DEFER)
 			return ret;
 
-		if (ret == -ENOENT)
+		if (ret == -ENOENT) {
+			if (optional)
+				return 0;
+
 			dev_info(config->dev,
 				 "No entry for control GPIO for %d/%s in node %pOF\n",
 				 desc->id, desc->name, np);
-		else
+		} else {
 			dev_warn_probe(config->dev, ret,
 				       "Failed to get control GPIO for %d/%s in node %pOF\n",
 				       desc->id, desc->name, np);
+		}
+
 		return 0;
 	}
 
@@ -380,6 +371,29 @@ static int s2mps11_of_parse_cb(struct device_node *np,
 	return 0;
 }
 
+static int s2mps11_of_parse_cb(struct device_node *np,
+			       const struct regulator_desc *desc,
+			       struct regulator_config *config)
+{
+	const struct s2mps11_info *s2mps11 = config->driver_data;
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
+	return s2mps11_of_parse_gpiod(np, "samsung,ext-control", false, desc,
+				      config);
+}
+
 static const struct regulator_ops s2mps11_ldo_ops = {
 	.list_voltage		= regulator_list_voltage_linear,
 	.map_voltage		= regulator_map_voltage_linear,
@@ -903,10 +917,16 @@ static const struct regulator_desc s2mps15_regulators[] = {
 };
 
 static int s2mps14_pmic_enable_ext_control(struct s2mps11_info *s2mps11,
-		struct regulator_dev *rdev)
+					   struct regulator_dev *rdev)
 {
-	return regmap_update_bits(rdev->regmap, rdev->desc->enable_reg,
-			rdev->desc->enable_mask, S2MPS14_ENABLE_EXT_CONTROL);
+	int ret = regmap_update_bits(rdev->regmap, rdev->desc->enable_reg,
+				     rdev->desc->enable_mask,
+				     S2MPS14_ENABLE_EXT_CONTROL);
+	if (ret < 0)
+		return dev_err_probe(rdev_get_dev(rdev), ret,
+				     "failed to enable GPIO control over %d/%s\n",
+				     rdev->desc->id, rdev->desc->name);
+	return 0;
 }
 
 static int s2mpu02_set_ramp_delay(struct regulator_dev *rdev, int ramp_delay)
@@ -1244,6 +1264,26 @@ static const struct regulator_desc s2mpu05_regulators[] = {
 	regulator_desc_s2mpu05_buck45(5),
 };
 
+static int s2mps11_handle_ext_control(struct s2mps11_info *s2mps11,
+				      struct regulator_dev *rdev)
+{
+	int ret;
+
+	switch (s2mps11->dev_type) {
+	case S2MPS14X:
+		if (!rdev->ena_pin)
+			return 0;
+
+		ret = s2mps14_pmic_enable_ext_control(s2mps11, rdev);
+		break;
+
+	default:
+		return 0;
+	}
+
+	return ret;
+}
+
 static int s2mps11_pmic_probe(struct platform_device *pdev)
 {
 	struct sec_pmic_dev *iodev = dev_get_drvdata(pdev->dev.parent);
@@ -1314,15 +1354,9 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
 					     regulators[i].id,
 					     regulators[i].name);
 
-		if (regulator->ena_pin) {
-			ret = s2mps14_pmic_enable_ext_control(s2mps11,
-							      regulator);
-			if (ret < 0)
-				return dev_err_probe(&pdev->dev, ret,
-						     "failed to enable GPIO control over %d/%s\n",
-						     regulator->desc->id,
-						     regulator->desc->name);
-		}
+		ret = s2mps11_handle_ext_control(s2mps11, regulator);
+		if (ret < 0)
+			return ret;
 	}
 
 	return 0;

-- 
2.52.0.351.gbe84eed79e-goog


