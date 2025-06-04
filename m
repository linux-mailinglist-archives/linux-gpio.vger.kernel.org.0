Return-Path: <linux-gpio+bounces-20999-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4281ACE15A
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 17:28:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 370F07A6D52
	for <lists+linux-gpio@lfdr.de>; Wed,  4 Jun 2025 15:26:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C72121E1C36;
	Wed,  4 Jun 2025 15:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JWyNo4QV"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDFE1CCB4B
	for <linux-gpio@vger.kernel.org>; Wed,  4 Jun 2025 15:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749050759; cv=none; b=BHFkL0SeeNYOEknLgQwFHTPk3auAv/2pWefR7IZE3eg3ZOX8o5/dsvc1Ofnb3uiaLzn99AZqGu4iWzEq/zqlQcONoUYGXne2l48yWJa0jiw4IjJ8mTyqMl3ZbAV02s3u6ZYS0qFBHz56LRNssKGICWsJ2k4B3RAxaN/m4preLbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749050759; c=relaxed/simple;
	bh=gpRe8Mt5ndzq0RKdCAcP7CMV+rBpHJ84dXjPHbGOCWM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KouNmJZ6dtbCv1xtV1WA2clWSNtgheqDI0q+g88yIfr0CKAokPR/0bRoZodUI3Mms401AgMNAXBclLJHEjCVtLwtLjn+0jzoqgbD/fffTRDW1kzxgJ/ooqFzozxsV4ttNc4I3XYOEWShKNcaWiQ7rth9l0a6+qUBPq0T5HzXdrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JWyNo4QV; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-606b58241c9so3647107a12.3
        for <linux-gpio@vger.kernel.org>; Wed, 04 Jun 2025 08:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749050752; x=1749655552; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pP407Ox1v91FomL1iN4XwON2iK1j8Ht0T+AJfPsmGsI=;
        b=JWyNo4QVZIiV/llCGZCM/mgWS16dQa+u5O0J+eiD3dCtp+m7GzBDEQvyLhqG+2YydU
         /QyvammoVG7aUvB4VKOSk5vEKxU6GMTYB8umvneqZvV7RdnEYNWNHWnBlO3xmIeTGZbO
         RQbVOnvW6MK0Vi756tSP0vBj3UsGVLmCrOn1DtIkgCH7V/Oz1aUmOCEuqZWNizxDHAYy
         qUYINT5xs1BEQDBLrsWe9txed0Kz6oZJNOYEU/eMOP5Rs5vLlAeaYYObfkRN5OHURJz7
         jASrHNvktcVd/LSzifi/hm9jt1Dm+eVaGg1z4o4kWF/qxhUx8MCWhfm+WaYMhNTA+hbz
         6L1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749050752; x=1749655552;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pP407Ox1v91FomL1iN4XwON2iK1j8Ht0T+AJfPsmGsI=;
        b=E6sIr5LEe2U/ZoXpambNRfwsD7Fbq/uII0pkw1vGNvvYLRQVVOVyXvw6b4J6wX5AOc
         X0QDXg3a2FhObC75aGXHqBXo6ipubrDpp2l+LsQmzPHncGwEWsf3V2pJAmEZMwXgMiNF
         OacDPxiFSdPlP2yvIRYfNvLQWIcu8WUUdL7qujGI541mFgrFr8/yCxHcG8nVDWIxyt2p
         0AWWfZbCIWlCf8IAcSMhpzyDD78Qqr57LYZLFOVXQO6c1WVstKzXgBZJgrMxA7j50yc5
         dKYmCrw5RbxtOm1CeFCWCZvh6m90n63EweuhJsm2uKjekYosa0Up5zU7geX948RJmUop
         QpSg==
X-Forwarded-Encrypted: i=1; AJvYcCXrjnpv/DxJM5GK43/BFFudM+mvXhx07wZfISkq+twDL9tcwFaov/ZwOVE6oy+hJk6FAW2CvttX1i19@vger.kernel.org
X-Gm-Message-State: AOJu0YyC95Lb+86jZ7ioRUEj8cuKt06CcyM3QnIexqDxoAGtWeBZP6/H
	6OfTDOlz633JsB98IfmBPQh2d7iTtwCA5yQhL7tn2kBLRrw9CLdwRx+KoP9Kx8uaF+Y=
X-Gm-Gg: ASbGncvUvcld7yJiSr3QhJ6ZFORtZie7LuK5ZbeZw1lex2m54UMaBX1zOvHToGptGbC
	0f1lNtzXSG+rqL6keV9LAfKUrX9wYWINsrC8SK+7S5WqKy/7BX9SSkCt11MsnpKmOnesOtgp+Q8
	W1oOb5SsO0/scObqiAT0dVDf6at70/4wcBdKe+0LDHZmiCbl7XVMK3zDy6ZKQBspdWB8/eK1YlE
	RllsGWeZP8onS1JPRgoPZErLxHlGPmn+0FXvzAPQ7pDfA/snleMPfndSfS64VBqXws97pH8RvX1
	fPMvcFDGjE+9EnMqg0sUuAmUt8rFvv1mvz3+feIZwIwDHS9HVtH70mKH50zlfFIfZkuo3aGqTwn
	9yjtXYMzqiYXQYe+0if8cajAXueZd3MEuTp4=
X-Google-Smtp-Source: AGHT+IFc62NxQDrp6Fd0aN6PA4dvCy44jt7oi4p68WSn0L0ytJoyIqbFgJ8vuOoNN2SWezfzZwIZWQ==
X-Received: by 2002:a05:6402:2789:b0:602:1b8b:2902 with SMTP id 4fb4d7f45d1cf-606e941b388mr3458933a12.15.1749050752175;
        Wed, 04 Jun 2025 08:25:52 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-606ed984f63sm1051640a12.58.2025.06.04.08.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 08:25:51 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Wed, 04 Jun 2025 16:25:51 +0100
Subject: [PATCH 12/17] regulator: s2mps11: refactor handling of external
 rail control
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250604-s2mpg1x-regulators-v1-12-6038740f49ae@linaro.org>
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

Refactor s2mps14_pmic_enable_ext_control() and s2mps11_of_parse_cb()
slightly as a preparation for adding S2MPG10 and S2MPG11 support, as
both of those PMICs also support control of rails via GPIOs.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 drivers/regulator/s2mps11.c | 86 ++++++++++++++++++++++++++++++---------------
 1 file changed, 57 insertions(+), 29 deletions(-)

diff --git a/drivers/regulator/s2mps11.c b/drivers/regulator/s2mps11.c
index d3739526add3c966eb2979b9be2e543b5ad9d89a..ff9124c998c685d9c598570148dca074e671a99b 100644
--- a/drivers/regulator/s2mps11.c
+++ b/drivers/regulator/s2mps11.c
@@ -328,27 +328,13 @@ static int s2mps11_regulator_set_suspend_disable(struct regulator_dev *rdev)
 				  rdev->desc->enable_mask, state);
 }
 
-static int s2mps11_of_parse_cb(struct device_node *np,
-			       const struct regulator_desc *desc,
-			       struct regulator_config *config)
+static int s2mps11_of_parse_gpiod(struct device_node *np,
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
 	ena_gpiod = fwnode_gpiod_get_index(of_fwnode_handle(np),
 					   "samsung,ext-control", 0,
 					   GPIOD_OUT_HIGH |
@@ -380,6 +366,28 @@ static int s2mps11_of_parse_cb(struct device_node *np,
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
+	return s2mps11_of_parse_gpiod(np, desc, config);
+}
+
 static const struct regulator_ops s2mps11_ldo_ops = {
 	.list_voltage		= regulator_list_voltage_linear,
 	.map_voltage		= regulator_map_voltage_linear,
@@ -903,10 +911,16 @@ static const struct regulator_desc s2mps15_regulators[] = {
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
@@ -1244,6 +1258,26 @@ static const struct regulator_desc s2mpu05_regulators[] = {
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
@@ -1314,15 +1348,9 @@ static int s2mps11_pmic_probe(struct platform_device *pdev)
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
2.49.0.1204.g71687c7c1d-goog


