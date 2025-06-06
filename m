Return-Path: <linux-gpio+bounces-21086-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB28AD048E
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Jun 2025 17:04:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1CF213B25F6
	for <lists+linux-gpio@lfdr.de>; Fri,  6 Jun 2025 15:04:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97FC628A724;
	Fri,  6 Jun 2025 15:03:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WqDEOU26"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCBD28A1D8
	for <linux-gpio@vger.kernel.org>; Fri,  6 Jun 2025 15:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749222204; cv=none; b=q79LXQpYu5EdyHyR/z8Ic/ZQrotPVNAeePW38IgzpawQJS0sLZznKMXSlDeMLq5aDm1jRcY37iq952WdMgWsFk7ZxrG6DAXjjfqIcz6jn4T4WkqoFkefz14vm8ciqTBqiUDn3MhIzM3RZgRNUbdU2/dulwVfgLCRtiGxm/3bqII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749222204; c=relaxed/simple;
	bh=u0sGN7ydx4uMtzXn04toQXzwTv85evbuIZ6QE3/YgMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qr571Yp2UhLkK1MenhMC7bIkcxPnqSWCe/xGe0C3+qmo/SKiUQyS0FlnkwWLZFCvH3aKsEbVxARGPMsyRY8Vp8tGtL+RjAMMNsVEs+n0dEI5ZmA8hl43/9j8ovFJCIrfE5ozTGhzHAc/ScQEQQQmg+Vx0wtAoQGvyTE3iAHb9W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WqDEOU26; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-adb5cb6d8f1so353788866b.3
        for <linux-gpio@vger.kernel.org>; Fri, 06 Jun 2025 08:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749222199; x=1749826999; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sp17uD+Ck7qERE7Du3GZRQM5DwcLbeJ07EXw1C758vE=;
        b=WqDEOU26CwmvUF/ht8QIDUXoTqvWei/tDYEOlrZbRt4Qt7NcwriSmugxnsT0xNh1G/
         5uKR6v0J0fltj0qq2VXLIcp5UnqrLnebMTu8v0/Uuzxjz+Qs8GoLiP6brHjeLLdzseXI
         69PkbBNc+1uhCxrqHZbBmyFtM8KK6q+oFc0p0/o6E4jHrRFDZznbWUq1jeKlbzzeVgBx
         ubbBdgzFyQwbV12u9M9C6tmTxgJ050XYqrxkviBIPy7lZj/VWyIUijih5jI4IbTvAfum
         NA8RhTXunxKVJko7jNeddUaS3T4dsWbCzM3tEYKws2lIdoWCJH6GCknaVzmzy+IxDpSH
         X15A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749222199; x=1749826999;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sp17uD+Ck7qERE7Du3GZRQM5DwcLbeJ07EXw1C758vE=;
        b=TGT1nqH1x1Eq8vJHh0qv8kYjoQVSo8+zguYuYx3RyMlu6Ts9hO4cBFTUItkK/5PnkZ
         caXc6p78KL500WRFh642KEUt7TCjJr3+NjYuWOgGDWNmXE9+b0xZIyvMTXYYLhaQDGpP
         oX12b3D/qEnzhke/B/Xl4HjNlOnkM2RDuPb1l9OnLKgNwLqMsa4mTkoxoYKnqThNbHvx
         soQM5PtqC1PbFglx1NejjUqxuuhExmmPsmBTE1RHS4nJPvCOSIZmkExmsiZpuJvzEJGm
         WQ1SL+ZGMEXARf2AFFi5rems27SchIMQrCAZWjEQMjvzWz5qVSWcVBdMgZKERtUj05/T
         xkjg==
X-Forwarded-Encrypted: i=1; AJvYcCV52hWkvZMCXpAXcRAo0bbecneFlOdfBvpGOixbtqe+a0Sw3YzUsbl+YYTqbGdnlCUhqxujcEkU3jWY@vger.kernel.org
X-Gm-Message-State: AOJu0YydB/Rnp4tk8z9UrFkfZga118smr0q02X8eQ+tYyY7TiM1K5JBw
	mJQfa2Vn1wqSr6ZbVbp6TXLEbwXAva7qPuBEq+Gu3DacICwJMYyy/KZxR+AgQyfX4Fk=
X-Gm-Gg: ASbGncvTS/IZ8Nu1U2SwguHlfHrbwTZxcRkhD6zrs1MBR3BDyZ3v/JhgAAmPVXm9OfN
	eYNHCI8c1NRrLibl2E6/PeYkkFNZf7TUEjLU67Mzv43TWVt3En17yLkgYA0d3cs6iGW8+jdLyEC
	5k324sA3Y95CXIoLFdo7Kd++iW7uZMlOzRb8tMVgTP4OcYxwyc9nommiziV8mCtYBSDxyDB3aXY
	N2EvLo9q5R2TYf8inJtbhHuR5scO/Oj4N88+Y9pHK3e5mVFpcGL4XWTG6irFei0dRDPY67qLE9N
	f/i+udrK/L6PA0NfZ5SS0f9cw74dv7AOhFFVrfi6w8s47SMTiuaQ6m3RT4T1+tT+pv7pZRzunGq
	S4qPXW4MWCjvHMLXLd3LM6xJdkEjhL0G8xNo0YLrQbsrHzg==
X-Google-Smtp-Source: AGHT+IFLMof/DV5Z1UjifZ5XRPYfS8ED3LxnpNpMroHTMjtBmz83MVE70EV7inVwrnIoSK5yhF97rg==
X-Received: by 2002:a17:907:d02:b0:ad8:9b5d:2c23 with SMTP id a640c23a62f3a-ade1aa5d45emr316376466b.10.1749222198347;
        Fri, 06 Jun 2025 08:03:18 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade1dc38cf2sm127735066b.121.2025.06.06.08.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 08:03:17 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Fri, 06 Jun 2025 16:03:08 +0100
Subject: [PATCH v2 12/17] regulator: s2mps11: refactor handling of external
 rail control
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250606-s2mpg1x-regulators-v2-12-b03feffd2621@linaro.org>
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
2.50.0.rc0.604.gd4ff7b7c86-goog


