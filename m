Return-Path: <linux-gpio+bounces-16978-lists+linux-gpio=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-gpio@lfdr.de
Delivered-To: lists+linux-gpio@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0C9A4CD07
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 21:55:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0D1D93AB0EF
	for <lists+linux-gpio@lfdr.de>; Mon,  3 Mar 2025 20:55:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457BD239089;
	Mon,  3 Mar 2025 20:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ph1aEosZ"
X-Original-To: linux-gpio@vger.kernel.org
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDCE3236435;
	Mon,  3 Mar 2025 20:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741035298; cv=none; b=pgE3FCivZsNuNpNP5ozXqvy9AjOQG7oKJKDf7nTVTAgJweITVAGYVTl3ICq0nCw0J3ZrMQ0xZtZ6kX3Q6+/dukiCayal+JowqwPFXmAOfsJaTXyTLr6R5KpkRWDhTOeHnTF4mKAyPnR6Zg00AV2mfdQZHgXxkV6jsn9as1LN2bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741035298; c=relaxed/simple;
	bh=hBqTyx3cRXjMO8YcrUQl3T9HLfXnpEZnzEJ9oJSb1Dc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IDRIYcxnsZcn2acWuUzFu1gjjLVFhOBLd/+A2tZbadtLyoYhDnh/i3/ZlgG4cKNZeg3QH5sRvwHWHM1WEHg7+usZ+pEOwEZZynNifHzuupp08Cpt3sWI7LIp0QGDu2oouOkwwElJCDXu2C4bs0avQGyHz/f5s+CLZqlnfS+DYSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ph1aEosZ; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-abbd96bef64so779361866b.3;
        Mon, 03 Mar 2025 12:54:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741035294; x=1741640094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QaYFxN/ihbyHEozZR8rg46OlgPGpXgAil1GgQ0yQw30=;
        b=Ph1aEosZ3jWRNpSlQhKyYzdG5IyTBGWfYvfadZaMvYhg1O3rGf67DPa+ABTaeLxTuu
         DX+JFZHoMLValHnow0NcPgxU85lqO0oqXehl7lEoKc5mcocAdJW01NAH0/KNPWPzn8xi
         zbEo16mp1W+WYyWhH2JnXkE0hWrK9rpmY1HB/QFEYgZLXv3Y4D+xkA/mDUD+LsEmtNUA
         PxY0xFi+lVa7HmCdeJtFu3TxjwjbAmKlW2gY0NUCEnZIiV1Q0kbQYOcIC97We+fjWs8q
         2jGc7JZz4T802chFcgsZYvn3IgJQsAubGoSmpbiMaH3LqoCbYq1RihhUDFNv4AqGJTJP
         9Mmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741035294; x=1741640094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QaYFxN/ihbyHEozZR8rg46OlgPGpXgAil1GgQ0yQw30=;
        b=NW4J+qX0CCaT7GozdNAgiaycRBZM7KI47bS5hpRPoG8JkyIcyZqSwo//pkCWmk8dp0
         dVBunw+BbaueTNTpuPuDZCYQHl8ZJ9CHGitDzStYIbx/eFd7DwWCL3zGBsEyRht3+9c7
         AabAxKKWU3A8aOkCStHUSFDb6LeLpr2WJbo48BG/KlQn+uUwcSd6FP8qpn7Iz7svslDz
         jY0dsPFs4REbhHqlfp8omNyxRP8/5vgc8/ihX+aMgn2cNjLR2mIT0Z84YujhSUFPmCox
         lZdaPrgpIJ23LndSf58rVwPrLRElIKyYcFfCmdUCYmeeJFUxfQI+rGgXqwSAniEDaTZo
         FyCg==
X-Forwarded-Encrypted: i=1; AJvYcCWx+8YBeDp/k/pNLxipqAGPB9zHDn8epmC+YuC+7fOclaM/0AL4t9auPZIpGNsEnArUZlxDzyg70VT9vfN3@vger.kernel.org, AJvYcCXjP58TgKny5V1yKpQmHWFRtj+opRKApqkgwnDtf5iUeZD+vEeJps18yvVTrZYR6JFvydZnCj4AJXat@vger.kernel.org
X-Gm-Message-State: AOJu0YxMC/xZ7EClpG0WlHAhy0kXrl1xYLTZxNOjcvsJyLRaFL33DkCm
	k7tHYWJebPvhcp9WzzOYYXmW0fr1793nzDNIgc8N48mrK7Mz7y3K
X-Gm-Gg: ASbGncvuXPovCnJOFCdKyn6TqAUVrT9L5eXSq+KS0jfOpyINy2biq7sWkHaQIizxbmy
	3ehSnBfEmGv/GGNIrbYm6azTYUyMnsNvI2I/NC1i5KnPdcjfcXwcxHMgkwdiZVYRTZJWw1hC9kf
	ZeUhFHxwdIujNR567SLOTHb3guyU6ykPtdg7py4qxyosmtDzS9cJwBjLcq5zp506qSU4Pzk2o8m
	K0/tfwqzZN0A4wUL1qhRImmCkDCCdp//bCR/bdJMzK5eysuTuzkqxEWwnmV0+C1QrDI00cYzYqe
	5c/gdkH9vhk3C70kY8WmIoBtXN/xd0m/fncE0R/Ab7gO47iTysIIPNI2hMBmJKAuB3Rh3Ry7MRY
	dNCc6eNscuZFb2Kc=
X-Google-Smtp-Source: AGHT+IH64gS0ZDjXt8GPsgr6bpd2RQzzCfhLZJtwkTBbFu3DAOZQTE2TKFa+FvPIHCOCApQHKaRMxA==
X-Received: by 2002:a17:907:86a1:b0:ac1:def4:ce20 with SMTP id a640c23a62f3a-ac1def4d088mr387883466b.18.1741035293951;
        Mon, 03 Mar 2025 12:54:53 -0800 (PST)
Received: from hex.my.domain (83.8.122.142.ipv4.supernova.orange.pl. [83.8.122.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abf76063ab8sm266955566b.73.2025.03.03.12.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 12:54:53 -0800 (PST)
From: Artur Weber <aweber.kernel@gmail.com>
Date: Mon, 03 Mar 2025 21:54:48 +0100
Subject: [PATCH v3 3/6] pinctrl: bcm281xx: Provide pinctrl device info as
 OF platform data
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-bcm21664-pinctrl-v3-3-5f8b80e4ab51@gmail.com>
References: <20250303-bcm21664-pinctrl-v3-0-5f8b80e4ab51@gmail.com>
In-Reply-To: <20250303-bcm21664-pinctrl-v3-0-5f8b80e4ab51@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741035289; l=11471;
 i=aweber.kernel@gmail.com; s=20231030; h=from:subject:message-id;
 bh=hBqTyx3cRXjMO8YcrUQl3T9HLfXnpEZnzEJ9oJSb1Dc=;
 b=jOaiXLIDUNXeZr/+d2T1x01Lk3CRbh8KvL29bv2KVPDVyogU5RpsGUSd5JC5uvxTaKijI10B1
 7KlrD5CdqMWCNgVUo0yq2DfCYRrc5AUxyV7r445vKLMVXUOjlkREHQK
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


