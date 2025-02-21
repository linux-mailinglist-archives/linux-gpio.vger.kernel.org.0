Return-Path: <linux-gpio+bounces-16412-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E72CEA400FD
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 21:33:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 09D8B189A169
	for <lists+linux-gpio@lfdr.de>; Fri, 21 Feb 2025 20:33:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DDD3253F2A;
	Fri, 21 Feb 2025 20:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T46uqCJU"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DB4A253B7D;
	Fri, 21 Feb 2025 20:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740169972; cv=none; b=KGGtHODoIzgXPCmyyBnDKFkafPU1xRlFb3xBillqVqMZ0lnF7VOocARKQ+ZLJYjmbpdFE/38v6uUzrcUyeV0lRfOvdPeJAHYIownnHl3/a0B15PhXecuqsMUaxOICqpqp7W8HIkvM4X0RG/VTQhxoiOu3K9mfNow7UG84bv8oM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740169972; c=relaxed/simple;
	bh=hBqTyx3cRXjMO8YcrUQl3T9HLfXnpEZnzEJ9oJSb1Dc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PjEqkaElUGJnk3/A8/LrIGzTdEQZBnXGsO6keFBdt97O8nUXIySgEDjAd9fnHvajXqSVp+GQ9Iz46cX6UYTGUjdRpva3jRiYqzoODI8XNTW1mcuXC8cutIw1VFQWhKCtoJl8xib4Oe2vFDjpJ73s05CwcFpxe5xlUuhpG+BRAlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T46uqCJU; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5df07041c24so3683580a12.0;
        Fri, 21 Feb 2025 12:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740169968; x=1740774768; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QaYFxN/ihbyHEozZR8rg46OlgPGpXgAil1GgQ0yQw30=;
        b=T46uqCJUIAyo51Asy/SkCqcvSgGvdrnAzPwW5c4MhNsHXk9FVyBrzohyc/NAN89Pyu
         yJ/QTKS1bhf87B0IMTd67iIJnbEpr+Pcq5ppS6CalJoZsFUqTQS1UmtSJZIYs1OTCeJf
         j1Y4e+s5hMIhAmdnkMe6R0yAlEmpjqUc/1GIIlJ4WBPx70CrsnXvW2o12z011TuvAq87
         ZQtGVNRKBv8AYgN1+rOc/mt7MlrfFURN9jxo5UkzBCwJj4WEyaDe2pIfdfhZUCMNiNBM
         TllbpVid0cCu5uJKX59RbVPWwWfqk7FncFbsbesL1RB7fhxpFGXRrJ8Tkrnku3/2i68W
         r/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740169968; x=1740774768;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QaYFxN/ihbyHEozZR8rg46OlgPGpXgAil1GgQ0yQw30=;
        b=QcLqnLuveWnsAqkYW/vo64cEV3nLqrd5hZ875Eloa/O1xlIDo1BieaBMA/snixVX3l
         TOQr6V1rk+0n7nZUDIi3aKvnBWo7zTVp5nWWZ26h0TR+CflzbsUDVMF5+1MUn4CuXrLu
         0LCCImCI1h+02J6rYIKv50Gubx9HtOKHPIeBxVVFgZbOLVY5AohTio+M9Pwb+83BE9Jn
         dQT/Wwnp8rsC39xrJy43C9IzhVkRJCx/+iZ67c/LGG4QnTrKmlKp4EIhOsEl8rJqZUr6
         uHHCs4+OtwrVz7+WNnuwEeNFqlVyUmsVs4DvTrXeoaWBeP6JhGielWa/KWzI6VcWI7t6
         +SYg==
X-Forwarded-Encrypted: i=1; AJvYcCVDXM2X1Q6/HF9dsI+g7ZaCDRO7Vgz28+Z7tuGdWgAozvwU2rP3mG1Z73vYCOg4JhJJMmnNcQ8mf/RPOSNW@vger.kernel.org, AJvYcCWJ4C26lAeFTulix7/EbfpcXgEglht/98Zpp2ounaQ7Mczh0U7beo8/4Vty5L95HDgy4EcSpiP2rdIo@vger.kernel.org
X-Gm-Message-State: AOJu0YyaNpMObtGQaXCxTuG7klIgWGOaq+rcjYb54+HQ8XfcwZZmdNW8
	1aRzL/3VfoYKSMwHvvDkUXwu/Yq2PNCH1Kuo8PCLEjIIhZ67iRr1
X-Gm-Gg: ASbGnctTGR7USOfCZxr8FplU2LBjGz4kt7lxM+jl8TO5VAB1qjur5duzk4qEms9147v
	DnSpG0DlhJLBhYZxRq18V9FmEIixGBZgHo/d2Wf+UwIyQ7W+2oXOr7ra2QkRCOc8FtqKZ8h6a7K
	GmGNh4sqKDMzDZzs32+yyfFYauxpghGrGfUppLI+eGQ5ZyZ6leSfiJAWTagdiCWWKtylfgIu6Gg
	H8nxRrZlq9ssNncqY/SBIMN81GKH32Cqs1skXtuUbqDqvuRXmneXyydVG3QIF68rNLW7lSju2FZ
	i7ainKka/jp2m0yfSPb7WwhVrWOAMxc30s9OZfa0BsbL87H4jtekG94C047QZGk5DwATCtND
X-Google-Smtp-Source: AGHT+IGLEG8ESnyf5EpQSCaMOyDDp05nAfmVmcjBASTZj4YCtR7n5vuxkxAJJQElkQsuXfucOVIclg==
X-Received: by 2002:a05:6402:388c:b0:5de:c9d0:6742 with SMTP id 4fb4d7f45d1cf-5e0b70df001mr3712533a12.9.1740169968116;
        Fri, 21 Feb 2025 12:32:48 -0800 (PST)
Received: from hex.my.domain (83.8.202.192.ipv4.supernova.orange.pl. [83.8.202.192])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1c418bsm14653485a12.24.2025.02.21.12.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 12:32:47 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Fri, 21 Feb 2025 21:32:39 +0100
Subject: [PATCH v2 3/6] pinctrl: bcm281xx: Provide pinctrl device info as
 OF platform data
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-bcm21664-pinctrl-v2-3-7d1f0279fe16@gmail.com>
References: <20250221-bcm21664-pinctrl-v2-0-7d1f0279fe16@gmail.com>
In-Reply-To: <20250221-bcm21664-pinctrl-v2-0-7d1f0279fe16@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Stanislav Jakubek <stano.jakubek@gmail.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Artur Weber <aweber.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740169959; l=11471;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=hBqTyx3cRXjMO8YcrUQl3T9HLfXnpEZnzEJ9oJSb1Dc=;
 b=HTFfRP+A/6+NN/h42IoNON8PlB0XejYOo4pnPd22j6rOXZSQO1Q0LXzCPcSasChSDnt09ZK1I
 pyXJqAmLA6ECEHuD6U8oabKGasVSyr+jO+xTqfmn3kdsaXc1SJierYT
X-Developer-Key: i=aweber.kernel@gmail.com; a=ed25519;
 pk=RhDBfWbJEHqDibXbhNEBAnc9FMkyznGxX/hwfhL8bv8=

Introduce a new struct type, "bcm281xx_pinctrl_info", that holds
information about the pins, pin functions and regmap config for a pin
control chip. Create such a struct for the BCM218xx and pass it as
device data for the OF compatible match.

This is done in preparation for introducing additional chip types
to the driver.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
Changes in v2:
- Make regmap_config pointer member of bcm281xx_pinctrl_info a pointer
  (fixes "initializer element is not a compile-time constant" error)
---
 drivers/pinctrl/bcm/pinctrl-bcm281xx.c | 119 +++++++++++++++++++++------------
 1 file changed, 78 insertions(+), 41 deletions(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
index a039b490cdb8e6c41169bfd48abb371447c150a0..f5aeb8a56e6ffa1204423ddc22204a4f0f4e8f84 100644
--- a/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
+++ b/drivers/pinctrl/bcm/pinctrl-bcm281xx.c
@@ -76,20 +76,40 @@ struct bcm281xx_pin_function {
 };
 
 /*
- * bcm281xx_pinctrl_data - Broadcom-specific pinctrl data
- * @reg_base - base of pinctrl registers
+ * Device types (used in bcm281xx_pinctrl_desc to differentiate
+ * the two device types from each other)
  */
-struct bcm281xx_pinctrl_data {
-	void __iomem *reg_base;
+enum bcm281xx_pinctrl_type {
+	BCM281XX_PINCTRL_TYPE,
+};
+
+/*
+ * bcm281xx_pinctrl_info - description of a pinctrl device supported
+ * by this driver, intended to be used as a provider of OF match data.
+ */
+struct bcm281xx_pinctrl_info {
+	enum bcm281xx_pinctrl_type device_type;
 
 	/* List of all pins */
 	const struct pinctrl_pin_desc *pins;
-	const unsigned int npins;
+	unsigned int npins;
 
 	const struct bcm281xx_pin_function *functions;
-	const unsigned int nfunctions;
+	unsigned int nfunctions;
+
+	const struct regmap_config *regmap_config;
+};
+
+/*
+ * bcm281xx_pinctrl_data - Broadcom-specific pinctrl data
+ * @reg_base - base of pinctrl registers
+ */
+struct bcm281xx_pinctrl_data {
+	struct device *dev;
+	void __iomem *reg_base;
 
 	struct regmap *regmap;
+	const struct bcm281xx_pinctrl_info *info;
 };
 
 /*
@@ -933,11 +953,22 @@ static const struct bcm281xx_pin_function bcm281xx_functions[] = {
 	BCM281XX_PIN_FUNCTION(alt4),
 };
 
-static struct bcm281xx_pinctrl_data bcm281xx_pinctrl = {
+static const struct regmap_config bcm281xx_pinctrl_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = BCM281XX_PIN_VC_CAM3_SDA * 4,
+};
+
+static const struct bcm281xx_pinctrl_info bcm281xx_pinctrl = {
+	.device_type = BCM281XX_PINCTRL_TYPE,
+
 	.pins = bcm281xx_pinctrl_pins,
 	.npins = ARRAY_SIZE(bcm281xx_pinctrl_pins),
 	.functions = bcm281xx_functions,
 	.nfunctions = ARRAY_SIZE(bcm281xx_functions),
+
+	.regmap_config = &bcm281xx_pinctrl_regmap_config,
 };
 
 static inline enum bcm281xx_pin_type pin_type_get(struct pinctrl_dev *pctldev,
@@ -945,10 +976,10 @@ static inline enum bcm281xx_pin_type pin_type_get(struct pinctrl_dev *pctldev,
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
-	if (pin >= pdata->npins)
+	if (pin >= pdata->info->npins)
 		return BCM281XX_PIN_TYPE_UNKNOWN;
 
-	return *(enum bcm281xx_pin_type *)(pdata->pins[pin].drv_data);
+	return *(enum bcm281xx_pin_type *)(pdata->info->pins[pin].drv_data);
 }
 
 #define BCM281XX_PIN_SHIFT(type, param) \
@@ -970,18 +1001,11 @@ static inline void bcm281xx_pin_update(u32 *reg_val, u32 *reg_mask,
 	*reg_mask |= param_mask;
 }
 
-static const struct regmap_config bcm281xx_pinctrl_regmap_config = {
-	.reg_bits = 32,
-	.reg_stride = 4,
-	.val_bits = 32,
-	.max_register = BCM281XX_PIN_VC_CAM3_SDA * 4,
-};
-
 static int bcm281xx_pinctrl_get_groups_count(struct pinctrl_dev *pctldev)
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
-	return pdata->npins;
+	return pdata->info->npins;
 }
 
 static const char *bcm281xx_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
@@ -989,7 +1013,7 @@ static const char *bcm281xx_pinctrl_get_group_name(struct pinctrl_dev *pctldev,
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
-	return pdata->pins[group].name;
+	return pdata->info->pins[group].name;
 }
 
 static int bcm281xx_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
@@ -999,7 +1023,7 @@ static int bcm281xx_pinctrl_get_group_pins(struct pinctrl_dev *pctldev,
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
-	*pins = &pdata->pins[group].number;
+	*pins = &pdata->info->pins[group].number;
 	*num_pins = 1;
 
 	return 0;
@@ -1025,7 +1049,7 @@ static int bcm281xx_pinctrl_get_fcns_count(struct pinctrl_dev *pctldev)
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
-	return pdata->nfunctions;
+	return pdata->info->nfunctions;
 }
 
 static const char *bcm281xx_pinctrl_get_fcn_name(struct pinctrl_dev *pctldev,
@@ -1033,7 +1057,7 @@ static const char *bcm281xx_pinctrl_get_fcn_name(struct pinctrl_dev *pctldev,
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
-	return pdata->functions[function].name;
+	return pdata->info->functions[function].name;
 }
 
 static int bcm281xx_pinctrl_get_fcn_groups(struct pinctrl_dev *pctldev,
@@ -1043,8 +1067,8 @@ static int bcm281xx_pinctrl_get_fcn_groups(struct pinctrl_dev *pctldev,
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
 
-	*groups = pdata->functions[function].groups;
-	*num_groups = pdata->functions[function].ngroups;
+	*groups = pdata->info->functions[function].groups;
+	*num_groups = pdata->info->functions[function].ngroups;
 
 	return 0;
 }
@@ -1054,14 +1078,15 @@ static int bcm281xx_pinmux_set(struct pinctrl_dev *pctldev,
 			       unsigned int group)
 {
 	struct bcm281xx_pinctrl_data *pdata = pinctrl_dev_get_drvdata(pctldev);
-	const struct bcm281xx_pin_function *f = &pdata->functions[function];
-	u32 offset = 4 * pdata->pins[group].number;
+	const struct bcm281xx_pin_function *f = &pdata->info->functions[function];
+	unsigned int pin = pdata->info->pins[group].number;
+	u32 offset = 4 * pin;
 	int rc = 0;
 
 	dev_dbg(pctldev->dev,
 		"%s(): Enable function %s (%d) of pin %s (%d) @offset 0x%x.\n",
-		__func__, f->name, function, pdata->pins[group].name,
-		pdata->pins[group].number, offset);
+		__func__, f->name, function, pdata->info->pins[group].name,
+		pin, offset);
 
 	rc = regmap_update_bits(pdata->regmap, offset,
 		BCM281XX_PIN_REG_F_SEL_MASK,
@@ -1069,7 +1094,7 @@ static int bcm281xx_pinmux_set(struct pinctrl_dev *pctldev,
 	if (rc)
 		dev_err(pctldev->dev,
 			"Error updating register for pin %s (%d).\n",
-			pdata->pins[group].name, pdata->pins[group].number);
+			pdata->info->pins[group].name, pin);
 
 	return rc;
 }
@@ -1168,7 +1193,7 @@ static int bcm281xx_std_pin_update(struct pinctrl_dev *pctldev,
 					"Invalid Drive Strength value (%d) for "
 					"pin %s (%d). Valid values are "
 					"(2..16) mA, even numbers only.\n",
-					arg, pdata->pins[pin].name, pin);
+					arg, pdata->info->pins[pin].name, pin);
 				return -EINVAL;
 			}
 			bcm281xx_pin_update(val, mask, (arg/2)-1,
@@ -1179,7 +1204,7 @@ static int bcm281xx_std_pin_update(struct pinctrl_dev *pctldev,
 		default:
 			dev_err(pctldev->dev,
 				"Unrecognized pin config %d for pin %s (%d).\n",
-				param, pdata->pins[pin].name, pin);
+				param, pdata->info->pins[pin].name, pin);
 			return -EINVAL;
 
 		} /* switch config */
@@ -1233,7 +1258,7 @@ static int bcm281xx_i2c_pin_update(struct pinctrl_dev *pctldev,
 					"Invalid pull-up value (%d) for pin %s "
 					"(%d). Valid values are 568, 720, 831, "
 					"1080, 1200, 1800, 2700 Ohms.\n",
-					arg, pdata->pins[pin].name, pin);
+					arg, pdata->info->pins[pin].name, pin);
 				return -EINVAL;
 			}
 
@@ -1266,7 +1291,7 @@ static int bcm281xx_i2c_pin_update(struct pinctrl_dev *pctldev,
 		default:
 			dev_err(pctldev->dev,
 				"Unrecognized pin config %d for pin %s (%d).\n",
-				param, pdata->pins[pin].name, pin);
+				param, pdata->info->pins[pin].name, pin);
 			return -EINVAL;
 
 		} /* switch config */
@@ -1311,7 +1336,7 @@ static int bcm281xx_hdmi_pin_update(struct pinctrl_dev *pctldev,
 		default:
 			dev_err(pctldev->dev,
 				"Unrecognized pin config %d for pin %s (%d).\n",
-				param, pdata->pins[pin].name, pin);
+				param, pdata->info->pins[pin].name, pin);
 			return -EINVAL;
 
 		} /* switch config */
@@ -1354,7 +1379,7 @@ static int bcm281xx_pinctrl_pin_config_set(struct pinctrl_dev *pctldev,
 
 	default:
 		dev_err(pctldev->dev, "Unknown pin type for pin %s (%d).\n",
-			pdata->pins[pin].name, pin);
+			pdata->info->pins[pin].name, pin);
 		return -EINVAL;
 
 	} /* switch pin type */
@@ -1364,13 +1389,13 @@ static int bcm281xx_pinctrl_pin_config_set(struct pinctrl_dev *pctldev,
 
 	dev_dbg(pctldev->dev,
 		"%s(): Set pin %s (%d) with config 0x%x, mask 0x%x\n",
-		__func__, pdata->pins[pin].name, pin, cfg_val, cfg_mask);
+		__func__, pdata->info->pins[pin].name, pin, cfg_val, cfg_mask);
 
 	rc = regmap_update_bits(pdata->regmap, offset, cfg_mask, cfg_val);
 	if (rc) {
 		dev_err(pctldev->dev,
 			"Error updating register for pin %s (%d).\n",
-			pdata->pins[pin].name, pin);
+			pdata->info->pins[pin].name, pin);
 		return rc;
 	}
 
@@ -1390,11 +1415,23 @@ static struct pinctrl_desc bcm281xx_pinctrl_desc = {
 	.owner = THIS_MODULE,
 };
 
+static struct bcm281xx_pinctrl_data bcm281xx_pinctrl_pdata;
+
 static int __init bcm281xx_pinctrl_probe(struct platform_device *pdev)
 {
-	struct bcm281xx_pinctrl_data *pdata = &bcm281xx_pinctrl;
+	struct bcm281xx_pinctrl_data *pdata = &bcm281xx_pinctrl_pdata;
 	struct pinctrl_dev *pctl;
 
+	/* Set device pointer in platform data */
+	pdata->dev = &pdev->dev;
+
+	/* Get the data to use from OF match */
+	pdata->info = of_device_get_match_data(&pdev->dev);
+	if (!pdata->info) {
+		dev_err(&pdev->dev, "Failed to get data from OF match\n");
+		return -ENODEV;
+	}
+
 	/* So far We can assume there is only 1 bank of registers */
 	pdata->reg_base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(pdata->reg_base)) {
@@ -1404,15 +1441,15 @@ static int __init bcm281xx_pinctrl_probe(struct platform_device *pdev)
 
 	/* Initialize the dynamic part of pinctrl_desc */
 	pdata->regmap = devm_regmap_init_mmio(&pdev->dev, pdata->reg_base,
-		&bcm281xx_pinctrl_regmap_config);
+		pdata->info->regmap_config);
 	if (IS_ERR(pdata->regmap)) {
 		dev_err(&pdev->dev, "Regmap MMIO init failed.\n");
 		return -ENODEV;
 	}
 
 	bcm281xx_pinctrl_desc.name = dev_name(&pdev->dev);
-	bcm281xx_pinctrl_desc.pins = bcm281xx_pinctrl.pins;
-	bcm281xx_pinctrl_desc.npins = bcm281xx_pinctrl.npins;
+	bcm281xx_pinctrl_desc.pins = pdata->info->pins;
+	bcm281xx_pinctrl_desc.npins = pdata->info->npins;
 
 	pctl = devm_pinctrl_register(&pdev->dev, &bcm281xx_pinctrl_desc, pdata);
 	if (IS_ERR(pctl)) {
@@ -1426,7 +1463,7 @@ static int __init bcm281xx_pinctrl_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id bcm281xx_pinctrl_of_match[] = {
-	{ .compatible = "brcm,bcm11351-pinctrl", },
+	{ .compatible = "brcm,bcm11351-pinctrl", .data = &bcm281xx_pinctrl },
 	{ },
 };
 

-- 
2.48.1


